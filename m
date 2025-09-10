Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106F4CA101F
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 16:08:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B311B10E965;
	Wed, 10 Sep 2025 16:08:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RakN1fZC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E91FC10E965
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Sep 2025 16:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757520491; x=1789056491;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1AY23qUUwq9S6Bu+0llsWFQNnif/nBTlwdcyCmBPxl8=;
 b=RakN1fZCCKbA7dkxYJVUG7ViJvvrSAptcP6n8RT63LsReWqko53KbW0O
 PHrBSNW3PUnnEfnLlnDVCWqHyHkPBTKiYLndgbBwN4fLKt6yoRLsKkDXP
 EkmG1G+rtL7LeK0UQXAgsoIvlok0R81ZGABBZWRJPfpKQ/ejcgiJ8bduz
 45MaNtJv64gDYi4UzKc9ucQ+lPRAky38gIX9OJu5bOHYrNcWd8BUEclkN
 iqFROmXeHfjSKectHsc+7pM5ebSmZPyZhxJ0GJOhawWiQXGE/EcdGr8FT
 I28eamRI3lXCZFl0NqmV2fxAgtmWCrVEIeEPnVEjnZtzLuZrXEaFVj2Da g==;
X-CSE-ConnectionGUID: M9rXg/+SR8e/uS/qePo0Zg==
X-CSE-MsgGUID: s/fl6vfXT2W1zZiAcyqrIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="71259141"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="71259141"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 09:08:10 -0700
X-CSE-ConnectionGUID: 4Le69qMUSBinhFRg62Cq2w==
X-CSE-MsgGUID: kt5WnX/eT/qW6dI0r9twng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="172618008"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 09:08:10 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 09:08:10 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 09:08:10 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.71) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 09:08:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d9cqEOzzEqdqqQbGorbAemTKqS8hCfP5MaRIHarf+hgTXJOu9/a5VPQrE0DVSeEZEnHxlc/UjfBLzgSTGsrifRgzS2Gk/ke0owwRQWhD+8hUIwszGgA3CuMzgqorYXR3+Na8qF0wp0RXq3yiOxgwxwjHCC546aAuArl3FVUWMmXI67V3CLyx459M2v7kTzdcc9CfRMfoS+AevhL9OoIcin99FJ/aVeAap9GIBQYvo/7FtOOYUDybAZ3YVOenLpjpy6C93LZ6B7t6aV8MD4rm2sndyCLUITDx7hNDYxYqEq3ptB4XJB+PBccGXctbE8wCs8Xuy+jqy7O0XqUmLD+dRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDwLTNFtwOBAZVA4Mnlbv5GmOmCbjVLlvsEvvzCOv1w=;
 b=Hgar91sK1HKyWTBrS6ce2JlT/WDXsjnlwfq0S9rU4h4HGpq2ti1pVfdGENSchDP2l7WXSSaXQWgQsgXOjfV0ZgwFlGdbqS3yat3vtyOoBIeC2yM/YBz6yYURMW3GWrlVMGnEe2ayd/gBLDY0Mu4zw5EkcUixc78SqZ1Sx6jUvztAwn0OD92WYavJNc1zFO3FzW/O1qqnpnCc5uLzWcIxgIPuNObdxqF9GX7ZtST8ryOa4NbpqQnvbpK154L2HN+R2zxIZGRabpcaGryCeCSGb5q6LCcR35PA7dbc/4DZswWJ5uOk2XKn+wPBe78mp4GIont6TQfNHFwlttcEJzwCpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by CY8PR11MB7847.namprd11.prod.outlook.com
 (2603:10b6:930:7c::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 16:08:07 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::d66a:6830:d9af:740a]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::d66a:6830:d9af:740a%6]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 16:08:07 +0000
Date: Wed, 10 Sep 2025 09:08:04 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: <John.C.Harrison@intel.com>, <rodrigo.vivi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <Intel-Xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2] drm/xe/guc: Return an error code if the GuC load fails
Message-ID: <aMGiZKwrDxfP3V7v@msatwood-mobl>
References: <20250909224132.536320-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250909224132.536320-1-John.C.Harrison@Intel.com>
X-ClientProxiedBy: MW4PR04CA0114.namprd04.prod.outlook.com
 (2603:10b6:303:83::29) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|CY8PR11MB7847:EE_
X-MS-Office365-Filtering-Correlation-Id: 45f52dc8-3099-47ef-757f-08ddf0843af0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVBBU2RhRUVjUTJtZkpDS1BzMVpwMWhtOE5TRDlaWFF6Zm00UG0vRnk4VXJY?=
 =?utf-8?B?YzFDWEd6M09hR3l2WHVaSERDZEZUbzhjcHBUNCtzN3UrMjZWd01aNzRmWjNn?=
 =?utf-8?B?SElMZ3dIMlhzTlBmeUEyTHRpNklqbEpzM285ZndZNFErYUxyaUpLOFhDNjNS?=
 =?utf-8?B?UDFpQ0h3MmJOSVV4VVJwSGhMQ01yeTB2c3diL3ZRYkE0Y1cyWk1memoyalRV?=
 =?utf-8?B?V3ZBZnBhOGFubjFSelVKK3RUUitBa1QreXVCbGNPUGFTT3dkL00rR1pVUkhI?=
 =?utf-8?B?VnVpWnpqQkZkeWppc1JCYVBSUkdGNGZLV095SGNQdklHb3MzbXR2N1dEUllC?=
 =?utf-8?B?SDlaeUNHelI0V3JCTEl5OElnT25YY1BCUXp6U0tBbFlTcjlQU1c0UWt2WEhX?=
 =?utf-8?B?aTRueGRON1FCSUtoZjRBT0lYNzFWTnJ1VHJhSGxHbFBaSWlJVkFuWHBYWHU2?=
 =?utf-8?B?Y2tQeFNKWTVHSkFJMWMyZlh2K3lzZFgvZGUzM09PSDJhN2dFRXhmcjhUMjNR?=
 =?utf-8?B?eFpheFpzMWVjcU8rRUt6REI1cWd2SHFHVTVxdU1KSnlQNUJyWGdLT0VmamIv?=
 =?utf-8?B?L2pmSEdINFYyOStWYUQ3cmdwcjV5dUdsWExJYklxRk0rd1ZlRXNsOExyNmZk?=
 =?utf-8?B?V2ZlbWd5bU1UQkYzK0hwU3NEY2NGdldML0JUcjlLOUNGdm0zcFo2VDdDdjJT?=
 =?utf-8?B?L3FybkdtN0MrbVVYUDIzTnBKU1lhd0FiUFE3TkRQZzZManV3N2UwQ2FBclRy?=
 =?utf-8?B?SGhiMG5xZzBBbzlxMVQ2ajlZUEtDOFBpcUtRbmxndmd0WVc0WmJjbDJQV25R?=
 =?utf-8?B?Q0pVSFdhbGg3dFJVVmdXU3ZEMUhkejFRQUZKNjZHcENsNHREaHorQU1Qd1VH?=
 =?utf-8?B?elN3bG5SdlV1U3VrVWVvMlpGcjFjeGZyYUE2b3dIZlZJYnBBWnJhZFNURVZH?=
 =?utf-8?B?YmlyT0RiZTVVWnd0dHZhcjNLY1ErSTJ3ZVRDbmwvcXZhd0dlaHNpOUtMSW5o?=
 =?utf-8?B?TE03cW9nT0N5bUNUNXBDYTdoNVlPSkhKUzIvWTY5NlZtVHRmZk9FRWdHckx4?=
 =?utf-8?B?aHpaSkVWUTVqWlpINmoyR3Z5TDdoTG9qalRHMDVlUDdNY3NMK3hGa3JTZUQr?=
 =?utf-8?B?WjNwa2ZHdVB0WGU2R0ZERGlabzZ1RElLenp5SXdQNEJGYy9ITEdGT3lmSDJM?=
 =?utf-8?B?S1FSS2IxMG44SGVvNURqdlZDSnpWbGo4ZVdJdVpMRkp1QTFQaHdVd3JOd1l3?=
 =?utf-8?B?MUlTVU1LR01UU3RxNkU5dFFwa2g2djhVaFRiVURMNU9nS3EyZVJ6R1lCbjNN?=
 =?utf-8?B?OHBkZUdMSmc2azVyRFJLR0prUCtHaFlJZ00va1JlMUpvcmJ0L3dlY1dvclZZ?=
 =?utf-8?B?aUFtbUZwOUd1MTlvL0xVbUQ2TXN5a1hzRHhvL1FKUWQ2WlRsRndVdTBodWhJ?=
 =?utf-8?B?K3drTUN3VTRlY1lpdHpwbnQ2YmZYeFlmdmZ6bGN6S1MweGIwVWhuNHZ4d1FV?=
 =?utf-8?B?NWJEWk5mcVdkWFgzVlNLRXNobkFMODFLM0Fwc0QzZ2ZtWE1XbXJ1NnF6ejJ4?=
 =?utf-8?B?RXdNbzkwOE1oU0tSMmM3b0JHSUswblpLaEVyakVuRTROS1d1Q2hESStsOEhS?=
 =?utf-8?B?L0FyVE8zM1d6ZlNSYVhybkloL0lCKytqaXNTRGtEempvQ0ZscTI1SzFWeWdt?=
 =?utf-8?B?YzJ1NmlRZi9uK3RtS2R1RmFxdEhyOXUzSll5Y0xmdWdwVldDL1kzb3pwVGpS?=
 =?utf-8?B?MVZSdVpnN1BTc3h2VEVEKzBiOHdmSXJ2emNvcisrN2cybytucWtDb3MvaTFI?=
 =?utf-8?B?Q2VTQ3Q4NG0xR3RPenJjUlAyY1V1VG1NSVI1MFFyR0lsU3Y1OS9aVVFhZllv?=
 =?utf-8?B?dEpzd3JudERXeHVxaVI2bGcxRnYxS0pvSnZPcm1KeHpkellnZDB1eVZESjVN?=
 =?utf-8?Q?av0KwGQU9v8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF89507EDE4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUNWeTdjejE2dTdFc0YxTENrWW5LQjhBbjJWeFArQzI2WFhiUEhVUVJCRjJi?=
 =?utf-8?B?Q0xNK3pjaTNuMlFUbWJFaGlZcmtlYVd4OTRrbWdwc2VjbzRldHdrODY2ZUpC?=
 =?utf-8?B?ZVFpUWg3V2c1dDNCNWV2SitUaUViK2VlNzVMcFhOTEZBM0l1WEdVcDFYVVVi?=
 =?utf-8?B?SVhMdklmVEE2cEQrQ2Y4cUUrK1h6bXVTY0dVYk5OQlM0MVViSGQ4RkJKOXFT?=
 =?utf-8?B?MW9yN3ZwZVhvWmRBTm9KRHVwWjJpUkRPU292UTRCeDMvVTZuRktabFN4QWQv?=
 =?utf-8?B?dkVlUzVWSDR3aVZPVGlQVW5RTVl1Um95dFZjU3B1OTZ1My85alAzenMyb0VQ?=
 =?utf-8?B?MVlVeVY5NTEvNU9jdS81MGxiY0VtRXJqSDQvemxKV3NTaEZpSG5ISEoxMk5G?=
 =?utf-8?B?ek5Uam56WHRjZEVZcFl2L2JmbnRzVS8wR2VobFNUR05pVnhsMDBEa3N3VDA3?=
 =?utf-8?B?R0FVdXRSSHNSMDJWd3RmakhBZU5SUnhVWlRzUno0RnBGaEh0NmZzSHBKL1do?=
 =?utf-8?B?UC80QVVzOHFvM1lvckVMeDI4UUNTblNHNm9FSnY3ZjBFT0dUUXhGRDR0K29N?=
 =?utf-8?B?Y1VxVy9CNFFlZWxOUlFISUFDNFQrQWJ5cElacUc0SjVSRUhWWU82NndHR1JM?=
 =?utf-8?B?N21GNzk1U3NURkxPRHk5NnNQS2loUWlmclp0UkVFU1VjUzBvQlFLTWJEU3JX?=
 =?utf-8?B?SGNUK3RJcnRwMU9FOXE2ZWo0VHd3RzBFZUdHaHM5dTVHQ1hlb043VEV6SDZj?=
 =?utf-8?B?M2dOcWgzWW9aRVRnaGNlTVJRMGR1SVpkOUZpbkNXWldQUHozbXJFd1NVSXNz?=
 =?utf-8?B?NUwwOVd6K25OVUZESTlQVmxmOGVadStXQ1RpeHpsOWRQcm1BbWQzREFBQTZy?=
 =?utf-8?B?eEI3aE16bU1yZFgrN1h6eVdrSHpnWHdpK3h2cW4wa0RNVGZvcGhrNlM3clN2?=
 =?utf-8?B?Y3JweXZtMEh4V0VMeU5aNEt5VE9KRy9qYmhkSnFtOG5hVkNvWkxGSS9IQkVR?=
 =?utf-8?B?Y2xGalpURkFINEgzcjhBSFB3VkM2V2NJWk1URHVsbXNNK2lvanU4UHNmMnM0?=
 =?utf-8?B?Y3Rtek03MVJKSUIwWjJzMU1sK0JuSEFpaUt6ZmJVSVB5RkE1UWhienVndXVF?=
 =?utf-8?B?bkk2TGJsTzhVQlhhRGVuYklHQng3UmNpYXA1RlVMZ3ZCOVFPaGNlYlRDV3hI?=
 =?utf-8?B?VlJ2VTRaM0NUeE56SGJnNFVtbDBEbG9mUG1PQUIzTWhseTdJQ0REY2kwclNE?=
 =?utf-8?B?dk1taEN6eVRrT0hDci94a0dKZ3VFQ0YveWNxRjg3U3RQaWEzSkZiRzVaeTBO?=
 =?utf-8?B?QVZhTHZ5SUxhVjVIVG05M0dvckNvVXBBY1REUnp0eWhZYk4weDVEeHFMWThB?=
 =?utf-8?B?T01nT1h1bjRhU080aW5EZUlUbFFBTVdyTk1xMkx1anMyRUFkekR1ZjFXNThv?=
 =?utf-8?B?MFhNSFczWlFZeHVMTVJ4M3JDTUpzdVREK3ZJWS91Q2dXS05tN3FrbGhIZkkz?=
 =?utf-8?B?cjBPcnhDRk54MVN6aGxyMGVycmFaTnZhcGR6cjMrY29ZZDl2Nk5iNFBudDMx?=
 =?utf-8?B?SUZQYlluUGJhUzBRR2VLVGY0OEpzTVV2d1prbnVvQXhmWU1ZazVRQjlpK3BG?=
 =?utf-8?B?eDRBc0hPb0k0bXpJQ2p5WTI3MklSUHRtUUxzVE8wNG1Ga3pFMXlaL0pONGlE?=
 =?utf-8?B?T2pBTVJnNWZyeEFZR1JlYTZvL0NRRU9PVkg2QWdZNHphMGdQdW1zcURabUt2?=
 =?utf-8?B?OEFYR01rekZzeDRsUjVpQnp5NHVXL2NSNGozK2huS2Z6NmhJdUFtRHFONzRF?=
 =?utf-8?B?bzZSanNNdFJOQmxTc01hck81OHpUaENOanIrclpJdFA3MmJLUTMzT3F0SlUv?=
 =?utf-8?B?S01QWGU3NFlzYUh2K01PVWhBOFc5clExd0srekZEY3ZudG1pN2p0OGN3L2Vo?=
 =?utf-8?B?Qms4TEFPTWQ0QUx0QUtOckdTRlNkdWRUODRJNU9IUGRBVUtzQjkwK2lsWXd1?=
 =?utf-8?B?UGsvZk5oZFhNNUtyUDUwMTQ0UEd0R29mMUF0a3ZLRmVKVGtJVHBQeDk3a1J2?=
 =?utf-8?B?dHlGZ2lRNnRSVGtoajlDdUFkcFhDSjJ3dE1uTHhVZThRQllmNTdBSTFTMFZL?=
 =?utf-8?B?Qnd1V3NYaXFzdlp0dXJyL2xCeDgyRGk1MGtRak0yNk9NNWxnU2M5NFBpSGpX?=
 =?utf-8?B?MVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45f52dc8-3099-47ef-757f-08ddf0843af0
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 16:08:07.4140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gh0Vqb/1x8lrB5Yg7GXN+uevmpBlVIhMhWC8PKW3Hc/67o9vOymw+EgjM2R4ir2VGDeFbjfWTSZ/LNQ8AxyUB8+15QNdAHzu0dCp3E4Y4dY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7847
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 09, 2025 at 03:41:31PM -0700, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Due to multiple explosion issues in the early days of the Xe driver,
> the GuC load was hacked to never return a failure. That prevented
> kernel panics and such initially, but now all it achieves is creating
> more confusing errors when the driver tries to submit commands to a
> GuC it already knows is not there. So fix that up.
> 
> As a stop-gap and to help with debug of load failures due to invalid
> GuC init params, a wedge call had been added to the inner GuC load
> function. The reason being that it leaves the GuC log accessible via
> debugfs. However, for an end user, simply aborting the module load is
> much cleaner than wedging and trying to continue. The wedge blocks
> user submissions but it seems that various bits of the driver itself
> still try to submit to a dead GuC and lots of subsequent errors occur.
> And with regards to developers debugging why their particular code
> change is being rejected by the GuC, it is trivial to either add the
> wedge back in and hack the return code to zero again or to just do a
> GuC log dump to dmesg.
> 
> v2: Add support for error injection testing and drop the now redundant
> wedge call.
> 
> CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index e56c9c5c8845..5aa7289cc83e 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1057,7 +1057,7 @@ static s32 guc_pc_get_cur_freq(struct xe_guc_pc *guc_pc)
>  #endif
>  #define GUC_LOAD_TIME_WARN_MS      200
>  
> -static void guc_wait_ucode(struct xe_guc *guc)
> +static int guc_wait_ucode(struct xe_guc *guc)
>  {
>  	struct xe_gt *gt = guc_to_gt(guc);
>  	struct xe_mmio *mmio = &gt->mmio;
> @@ -1164,7 +1164,7 @@ static void guc_wait_ucode(struct xe_guc *guc)
>  			break;
>  		}
>  
> -		xe_device_declare_wedged(gt_to_xe(gt));
> +		return -EPROTO;
>  	} else if (delta_ms > GUC_LOAD_TIME_WARN_MS) {
>  		xe_gt_warn(gt, "excessive init time: %lldms! [status = 0x%08X, timeouts = %d]\n",
>  			   delta_ms, status, count);
> @@ -1176,7 +1176,10 @@ static void guc_wait_ucode(struct xe_guc *guc)
>  			  delta_ms, xe_guc_pc_get_act_freq(guc_pc), guc_pc_get_cur_freq(guc_pc),
>  			  before_freq, status, count);
>  	}
> +
> +	return 0;
>  }
> +ALLOW_ERROR_INJECTION(guc_wait_ucode, ERRNO);
>  
>  static int __xe_guc_upload(struct xe_guc *guc)
>  {
> @@ -1208,14 +1211,16 @@ static int __xe_guc_upload(struct xe_guc *guc)
>  		goto out;
>  
>  	/* Wait for authentication */
> -	guc_wait_ucode(guc);
> +	ret = guc_wait_ucode(guc);
> +	if (ret)
> +		goto out;
>  
>  	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_RUNNING);
>  	return 0;
>  
>  out:
>  	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOAD_FAIL);
> -	return 0	/* FIXME: ret, don't want to stop load currently */;
> +	return ret;
>  }
>  
>  static int vf_guc_min_load_for_hwconfig(struct xe_guc *guc)
> -- 
> 2.49.0
> 
