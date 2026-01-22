Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386E7D6CFAB
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 23:22:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EADDA10E086;
	Thu, 22 Jan 2026 23:22:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GQE93odK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66D3510EB00
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jan 2026 23:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769124171; x=1800660171;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=rSJqylTEI7Sxn6IFk8+C2svPz/SX3rctDlOmoG6v+O4=;
 b=GQE93odKmTKgocsxPD3m0vHI5T+dXFz8Jm254E8IlRB4BSMnNuOYEG0m
 nV8idP5Xf/i7TzljV9/KYFLSwFMuaZV1o1PYjxd/Jr/becMbV9p3AVSO1
 Y5VAc44DrWvb59Wh/WwaHiJkjnf6kwLnztwFv2+z3WFOjffh1NzEdEz+t
 E/8Htd+oRFBuYNTxuJAesqZWZb/nymFqr2nmsJf7sDWJhY7g5MSmx87pR
 bpwW8qXeR0StGwiqNeiXC78iBcFAaTquP1ZLoxih9qkEoCUwQFnaw/tDx
 l2Jc6nf5MR6DFOxjkcTkvT62vq2u9bPKt925ItklYhlOXPawCkkHnafj2 g==;
X-CSE-ConnectionGUID: H1IXT/s+QyGXwlfS/9WGPg==
X-CSE-MsgGUID: o/hCHJChSZ6hPoK06HhK8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70274994"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; d="scan'208";a="70274994"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 15:22:51 -0800
X-CSE-ConnectionGUID: 62ZADlMOSNGSGbuUWlxGlg==
X-CSE-MsgGUID: vEMykQgOS2GqzPyBxWZ9Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; d="scan'208";a="210996747"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 15:22:51 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 15:22:50 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 22 Jan 2026 15:22:50 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.55) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 15:22:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CokXKWkQEBcPQMOIXZdyMECEJmQy3NYYv/bCEBlywF7YSbj4wH0BeGbQqLyBbld79JQwTe0/eAZOHbW7RQdN2v7nHlUr4WM6KeTjWGg2DNaU8vrDP0RrRP96f9Oez20pS12PZVm5UekoBf2LL/jyzKxCLWKNOQziwvHYXuoVK1lac8YtLrw+iy7D5ZKbs8eV9gt4RjBpswM+KB5+hhkZWHU5dFNfrBeXbVOeroz4YROsZ/pAYexpSsBYrFfjJAmJ34zZuxP1XnLcnK8bAMAhh+f9bEWn3Gj3DitP+20fXsN9L87f4v7z7yf0s8Lz9BilCY7GNMgEKOVRePgJRcua8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k2QFdaS693rkW9lCu8921RkLQXcDwDTc4lDkdwgGJmM=;
 b=iYibo1mAWLtVeWNolzP+k+bvPZizPhjSof3ZWqqyn+BRgavT39Z4cqAXc1uiHC0aQcwpY8ZAXQv2/sEvpFCWafM3nwaNZohhDyKB0WaUJnrRZB4h32yM2FBAg3k0zg5Ss2GrocdQWFliw+m99xyPj7dzfgRBrqv/gy5eIYqWmmU7kmKQjNfKvN/jLefdFarK7lhjRGwk+5FsgZpX5o8bGpF0VzpB0dS0LlPE1ooqAZgb7TimKao8NdPx0W79EbaNhXIaPoX/F4e40FmNePy0FH1WUQ0vTWSOAeC8k0D/wo9PM0ybHTM+Oc/ZWdUwcRdEvUxgJVOtN4YJGPfYWLdUEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by PH7PR11MB7431.namprd11.prod.outlook.com (2603:10b6:510:273::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 23:22:43 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%3]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 23:22:43 +0000
Message-ID: <e5e174f7-b404-4376-9450-ecc6358283f8@intel.com>
Date: Thu, 22 Jan 2026 15:22:40 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] drm/xe: Decouple GuC RC code from xe_guc_pc
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260113220801.2198264-1-vinay.belgaumkar@intel.com>
 <20260113220801.2198264-2-vinay.belgaumkar@intel.com>
 <66a2c0d2-09a4-4e1a-a445-204e92e9dbdd@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <66a2c0d2-09a4-4e1a-a445-204e92e9dbdd@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ2PR07CA0006.namprd07.prod.outlook.com
 (2603:10b6:a03:505::18) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|PH7PR11MB7431:EE_
X-MS-Office365-Filtering-Correlation-Id: cd4c64af-4e11-41b7-fc71-08de5a0d248f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|18082099003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NlhDTGRrdDJqcENBbFdJYlVMR3dCMkRmVlB0cXdDYTZoREtiaUFDeDRjNVdp?=
 =?utf-8?B?R05PT0lZK3h5dWpaWU12ZFd0YUJkdXMyU2pwRjMwdml1Ris2OUtTWGNZL2U2?=
 =?utf-8?B?K2E3bklrT1FaK1ZtaG1kekd5TExSYU0wenRxTWpMSjlJVUxDWFUrNlpnanBp?=
 =?utf-8?B?RjdaVTJlQXZkTW80eEd2a2trM0ZycnFQbTVTMkU0ZW9CK0JUVHBGT20ycW42?=
 =?utf-8?B?Uk1TS1laNlE0THREa0J6UHNKTDdicmF6bm16OS9ZemJQNXRSMUFxTERpbVhW?=
 =?utf-8?B?ZzY4LzR5QTJ0VG5QUzRpd3BpOVJ4QUtHVlJDNmIvcytseFBKaFluc1NWVmxB?=
 =?utf-8?B?cXFSN1FxWDRYNm1SNHJ5K29BQ1hRUHNSOWh1cGdOSkh4cFUrTjlicUU3WW9S?=
 =?utf-8?B?aVh1SmlnSmZlaU5vS2g4MVJaSmlGZVViSFZkQ3NPTzkrL3ZWbWwrMWM1S0ZC?=
 =?utf-8?B?Y1pTekpqVCs2UzNLTkZ4dHE3bDBEQU5DdFlBWnlCKzJtajhQQldtc2dEMzE5?=
 =?utf-8?B?eEV0ZWVBejZzdlBBSGptYjZNUFZUbEgyckVzaVg1TFNaclpxb0hIUTQ1VjVH?=
 =?utf-8?B?cmc0RnRKV0t0SFlhM2N4Ymt1YmZUVy9QMFNSVlRtdG1EcGNMNHZmQS9pdGZL?=
 =?utf-8?B?UVlpQ1dHNDd3bGdvWEdUR1BlZ1R3ZDNzSmx1Q1hOSkxmdGh0WEpxcDFZTWJu?=
 =?utf-8?B?enJMa1VPdnY2QkEvZ0x3Y3R3elNaUHB3bHJVVFRFZVJjMFBSRVNCNnRVN0d5?=
 =?utf-8?B?TUVhbGVVcjIrNFJYZ0ZaRGJPZXdTMWxVWktYVis5Q0xXVlJacmk4ZE9FK21i?=
 =?utf-8?B?R1JGTEx4VmpmVzJHeVJpOC90M2RXU2k3T3Y5eGllVHNHbTEzd2RoTTBvZWJk?=
 =?utf-8?B?clRmSE41b0U0Y1lhV05JMlp1bFBUQXVCZi8ydWFqZk0rNEtqSGhVQ3FXdHJ2?=
 =?utf-8?B?NmxEOU9LUFNRTXhrcDNHL1F2bm9oNkowVU5QaE8rUW9zUUJwUGJGWDNxbXVs?=
 =?utf-8?B?cURUUmlpc0ZjSm1LL2lmNklNK3VTNWZvYWNEZEZjdm5vVlJPR1lROVhoN3JF?=
 =?utf-8?B?aUhWbUNzK0pMcGtxRkRBVTdVWlE2d0swRkFNODc3L0tjV2VwdWMrdUx2T2sv?=
 =?utf-8?B?T2VFcFhwVFJpWStDZ1liNWIwUmVxYzBRd0dkbFI5djM1dFczSjRrU1lRV0hu?=
 =?utf-8?B?U1Z2RnNtZUNDR29LYlNGRmtTeTM1OFdrTks5K28rUlFONGNIb2VBUVpBZnB0?=
 =?utf-8?B?YUhQc05uRi9GUE9PU3lTZHBkanRidm9nbDJibmpGTjZwYzF0VjVBcm54c3cz?=
 =?utf-8?B?NEFwZDZHMlVwS1ZjZ1UweTMxdThHMnpmZGtJTU00Rmhqa0JTWXJZUzlUNHpk?=
 =?utf-8?B?R2JDL1VNa1ppQkY5WEFJYXVxZzJHTTBLcXdpYlVsMEdONE5GNm80LzNqM3JI?=
 =?utf-8?B?VE9OcG5reXNhNm5YMk5DUXdFVVA1eUJFZm93UUVpZUNqOGx6WDBMNHNlQ2J5?=
 =?utf-8?B?Z1NJNjZRQ3ozbjRobTJaYlBFUlpGM0RtcWtiKzdNSW0vZEdtNVphRXNtM2JP?=
 =?utf-8?B?czNkZEZMRVRseVdFMG1KRGIvR1dKUFppOFB1UE5odER1SEtxOCtFMTVacEgw?=
 =?utf-8?B?Y0paRktwckxsa3U5bndwZVNtSmdKY29NbERVUExlWUcwbmhkOHprM3BFd1Nn?=
 =?utf-8?B?OFJVWjhzL0lZTFdlMnYrdEZBZHNTVWNKZzF1WXhUS1h4TklFZnh2Nk5qMzVR?=
 =?utf-8?B?a0FBaGNxeU5qeWFTZkE5K2tkejJHNW9jeldjVUFuTkpOZ3NyKzlZbU5KdjN0?=
 =?utf-8?B?Zy9WUFR2RWRqdkh3dkZyMm9SUnlUZjBqZldzSGVJQ1JCd0NxcDhCWWp4Q3F5?=
 =?utf-8?B?L2d3VkQ0ckdwWUJSL1B1bURvTlhoczV3THZZU0Z6UjNmK0E0enZEdkJLai92?=
 =?utf-8?B?RVlQMGlqVGJMQTZGZ1Y2YWlYRTc0MENpQXpFV0doYitTczJKOXFWOExLVmhJ?=
 =?utf-8?B?dXFac2NmTjI5REY4Y1Z5Q3VIb2J4ZXpUZTMrZ1d5RVBGZk11ZU9ON2NoZTQ3?=
 =?utf-8?B?NE5RSHJaVVdEVnM2MEljUHFFT3haYk1TRnlzSHoyOW5YT0svNlR4QXFBSGRB?=
 =?utf-8?Q?Q1uM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18082099003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K28vZ2xZREFUK3A1WkljbldueXVmSzhQdXQyRnhYbUVuNEQzMGdrREtnNW1F?=
 =?utf-8?B?RGJPTk5xa09nbEFjQ25PMUY4Mjd6ZnovZVlrU3U5SWEyeFZpSEtxanhuNDEx?=
 =?utf-8?B?WVBZVnRZLzZzSi9IbTZEUkwzUngwRlJUSFVIdFlMeTB5OE9RTmM3ditIOEgz?=
 =?utf-8?B?S1E3dVhQT052MlJ1eHBsQ1lzSllSMkZMT2llUlAxRkRSWDZaaVNtSkRucytn?=
 =?utf-8?B?alU1bUp1R2tiMklFU3RWMUczbkswQkZxOFkyQzJVZGxGRTkxTFBLK0xhcFhD?=
 =?utf-8?B?aG5OUmQ5azQvRGVYSnFUQ1J6VG45eng1amxnZDliNTlNOVJlOUx0bkNtVlBG?=
 =?utf-8?B?Vlh3V3lpVkdzVlNPQ3pGU1ZUOHNPa1dOL2dBNjdiN2xnSkx4QXNuZVpXSnYv?=
 =?utf-8?B?UDMyRjhScE1yam55a09Ob2RwZ3J6amxiaWVsM1htenZrekxHMnRaNnRqZ2x6?=
 =?utf-8?B?VjJaeXRPdEtRdytMdi9oQVFGSTk5WC8zZlVSSW1BUmpWUGVUdTYra2pqTmhG?=
 =?utf-8?B?UGR1WVRSWk5jNnFoQXlZemoxL041cGVHdmNWeXB2enc4bk1MbmZpQ01iUWNq?=
 =?utf-8?B?Nnc1WERmYVZtRFJCY2dsV0FiR0N5cUtqNEcyU0NuRHd5clQzVG50MEx6ZnNs?=
 =?utf-8?B?VnIzSFpma1gwcGxJYkZEeFdNckFINkxBOUxWeFcwdU9lZWdKbmxvQm9aSXR1?=
 =?utf-8?B?b2FEZElPYzNHaDFnN3dEMkt3ekZHMDJ2VXpFcmlFTXkyMWsxRnA4OEp0bVYr?=
 =?utf-8?B?WVcxVjhtWEV4dFVJUklmK2F6QmVOMG1lZHNOTVBjeWFkZDRSTWdKcktGSWho?=
 =?utf-8?B?YW02VmdNTEdxZi9pSCtndlVqejcrMUZUV1QwT2VDMlBNKyttWjZVTzNQWTdq?=
 =?utf-8?B?QUYvRGJEQmViVis5Q1lTQ3ZxckZBeWg1UTdORVc4WWJqYlBnVkptTTZjaWtw?=
 =?utf-8?B?OWg4WGxXVlFXNDJGVWlpS3RxdDYrQWNWclV1V0t3ZjlkR1VuTGpvTkFjMnZu?=
 =?utf-8?B?U1AxNzRsNEFxTEQvK2hwTlMrWnY2dkZZS2dlRHpicmRpSVljOC9NcUFrU1Nx?=
 =?utf-8?B?WTJVS0lHTWV0WWdlODZuUVB3enZ5RTJSNy9uTmc1czczcW14KzFvdEVIbXJF?=
 =?utf-8?B?L3M3TXFkaC9Ba2NvUzJiQ255QjBtRGlES0U0TEdMa0pzYi9YeUtZMHorWk9Y?=
 =?utf-8?B?STJwOEk4VVBjNTc1K2QzZkVGMWEvVUtZU0R2dEUrbnpvT1UyUk9SWjZEM1dx?=
 =?utf-8?B?MWk1V244R08yU1ZOeDJMb0ZYSWV6ZzVJMXZLdWgvR2xxRXlyYVE1bnc4WXI5?=
 =?utf-8?B?YjdMVkVESnRTR1Zlbk9XN3JMbEtnM05OVWQxT3hqQUM0L0tTSWx6YU90VThu?=
 =?utf-8?B?dFFVeG5LcnB0cWFXbXpRYnphd1czbGhISldpVXVGZHJDR2hKSi9IVUhKdVpO?=
 =?utf-8?B?Y3IvL2MwSWJhQ0hkU0Q1NU5EczdvNml3Z1JVbUl5dEx3dlVsK0RSVlVNYkFO?=
 =?utf-8?B?dHRwL2hzVFlmbXVMV2NFaGR5Tzh1Z0ducmVQK0UzeUhqTGh2Z3lWU0JaK1Az?=
 =?utf-8?B?UFJFVW1WMFRkK1NTdmdXdzl2Y2g5UlJhYUdzR3EvcnVldmh0UWRxVGVTRVA3?=
 =?utf-8?B?ZHB4TXBTUHhuUG1Lb2t4cHF6bEdxODlLRENlTWZaeWtCSTJqUkhyRDE1WVEv?=
 =?utf-8?B?cTlCbXlObXVjMkVMSkJQd05kNStEQ0RNbFN2dE05em1EbjVXaE1MZVBoZVA2?=
 =?utf-8?B?YWJ5eFlOMEFwV1J4N2hvdnVxSm9aT1lqTGN5b25yWVNzeDFya1plSU5SS29u?=
 =?utf-8?B?WTUydStlTUtHT2llU1Q0ZzZWUVBISHh4YkFXSmI1U1pZY1ZzakptWEYzVnl4?=
 =?utf-8?B?b01PdFB1N3dTNVN3YzVRVVRiQUNiNG5yMFkvdUhWMDY2Wml1dHVZQjRVNk9Z?=
 =?utf-8?B?UDh0QVFadVZCQU1MMTZyM0tpZHQ0N0NVUzBqdWpSRnptZmM2bktVeVVTc0VT?=
 =?utf-8?B?aEcyN2tMT3lDbThIZ0lhVGU2SDI5VkdiTHp0UkFSRnZOOHFHVnl3RHgvSktE?=
 =?utf-8?B?dlp3Y2tPR04rakdpRWlxMEpBZE4xcGJRZG55bGx2M28yOVFRYUFaNjVFb0Fk?=
 =?utf-8?B?cEozbWVpZmM2MHhXV3dYd0JTSThzWjVJanh1MUFxS3Q5UGo4U1RmMW5sVlhX?=
 =?utf-8?B?ekVGWDdVbFBjRS9GbGNTK3dpRFJuM2FIVVh1WUlUNWM1UERvY2xEazVGS2l0?=
 =?utf-8?B?eEQ5S29vd2NnVzIvZTR0TDBrcmxpT2pnV2thayszK1RmTEk4cWg2dEZJYTZh?=
 =?utf-8?B?TGZjRmFWSHAxOVhyblc5ZzVrUEp3T0RCTW5JWDdPRlVXTWphS2NJRDRxRUpZ?=
 =?utf-8?Q?NPQHxBizjr30uqJo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd4c64af-4e11-41b7-fc71-08de5a0d248f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 23:22:42.8936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ExZvubk9lzir3eQ2UTdKfcBLQwF1c81BZxFaH0Lh3wR3KN+E56yil+HXQ87Qlv4O56fibkmNvarsZwMKApoWbCLzc/7NBP3lZcrBLu6nWyQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7431
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


On 1/22/2026 12:15 AM, Riana Tauro wrote:
> Hi Vinay
>
>
> On 1/14/2026 3:38 AM, Vinay Belgaumkar wrote:
>> Move enable/disable GuC RC logic into the new file. This will
>> allow us to independently enable/disable GuC RC and not rely
>> on SLPC related functions. GuC already provides separate H2G
>> interfaces to setup GuC RC and SLPC.
>>
>> v2: Comments (Michal W), remove duplicate c6_enable calls from
>> xe_guc_pc.
>>
>> v3: Clarify crosss interactions between xe_guc_rc and xe_guc_pc
>> (Michal W)
>>
>> v4: More comments (Michal W)
>>
>> v5: Remove rc_init and use enable/disable (Riana)
>
> Few small comments
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile    |   1 +
>>   drivers/gpu/drm/xe/xe_gt.c     |   1 -
>>   drivers/gpu/drm/xe/xe_guc.c    |   2 +
>>   drivers/gpu/drm/xe/xe_guc_pc.c |  70 ++++----------------
>>   drivers/gpu/drm/xe/xe_guc_pc.h |   1 -
>>   drivers/gpu/drm/xe/xe_guc_rc.c | 114 +++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_rc.h |  14 ++++
>>   drivers/gpu/drm/xe/xe_uc.c     |  10 +--
>>   drivers/gpu/drm/xe/xe_uc.h     |   1 -
>>   9 files changed, 149 insertions(+), 65 deletions(-)
>>   create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 89dc48cd73e2..928fdb925c13 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -74,6 +74,7 @@ xe-y += xe_bb.o \
>>       xe_guc_log.o \
>>       xe_guc_pagefault.o \
>>       xe_guc_pc.o \
>> +    xe_guc_rc.o \
>>       xe_guc_submit.o \
>>       xe_guc_tlb_inval.o \
>>       xe_heci_gsc.o \
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 313ce83ab0e5..9ee328aa6579 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -822,7 +822,6 @@ static void gt_reset_worker(struct work_struct *w)
>>       if (IS_SRIOV_PF(gt_to_xe(gt)))
>>           xe_gt_sriov_pf_stop_prepare(gt);
>>   -    xe_uc_gucrc_disable(&gt->uc);
>>       xe_uc_stop_prepare(&gt->uc);
>>       xe_pagefault_reset(gt_to_xe(gt), gt);
>>   diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 44360437beeb..f66b0c987b09 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -35,6 +35,7 @@
>>   #include "xe_guc_klv_helpers.h"
>>   #include "xe_guc_log.h"
>>   #include "xe_guc_pc.h"
>> +#include "xe_guc_rc.h"
>>   #include "xe_guc_relay.h"
>>   #include "xe_guc_submit.h"
>>   #include "xe_memirq.h"
>> @@ -1609,6 +1610,7 @@ void xe_guc_stop_prepare(struct xe_guc *guc)
>>       if (!IS_SRIOV_VF(guc_to_xe(guc))) {
>>           int err;
>>   +        xe_guc_rc_disable(guc);
>>           err = xe_guc_pc_stop(&guc->pc);
>>           xe_gt_WARN(guc_to_gt(guc), err, "Failed to stop GuC PC: 
>> %pe\n",
>>                  ERR_PTR(err));
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c 
>> b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index 54702a0fd05b..cf02c53ca3c5 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -92,6 +92,17 @@
>>    * Render-C states is also a GuC PC feature that is now enabled in 
>> Xe for
>>    * all platforms.
>>    *
>> + * Implementation details:
>> + * -----------------------
>> + * The implementation for GuC Power Management features is split as 
>> follows:
>> + *
>> + * xe_guc_rc:  Logic for handling GuC RC
>> + * xe_gt_idle: Host side logic for RC6 and Coarse Power gating (CPG)
>> + * xe_guc_pc:  Logic for all other SLPC related features
>> + *
>> + * There is some cross interaction between these where host C6 will 
>> need to be
>> + * enabled when we plan to skip GuC RC. Also, the GuC RC mode is 
>> currently
>> + * overridden through 0x3003 which is an SLPC H2G call.
>>    */
>>     static struct xe_guc *pc_to_guc(struct xe_guc_pc *pc)
>> @@ -253,22 +264,6 @@ static int pc_action_unset_param(struct 
>> xe_guc_pc *pc, u8 id)
>>       return ret;
>>   }
>>   -static int pc_action_setup_gucrc(struct xe_guc_pc *pc, u32 mode)
>> -{
>> -    struct xe_guc_ct *ct = pc_to_ct(pc);
>> -    u32 action[] = {
>> -        GUC_ACTION_HOST2GUC_SETUP_PC_GUCRC,
>> -        mode,
>> -    };
>> -    int ret;
>> -
>> -    ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
>> -    if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret == -ECANCELED))
>> -        xe_gt_err(pc_to_gt(pc), "GuC RC enable mode=%u failed: %pe\n",
>> -              mode, ERR_PTR(ret));
>> -    return ret;
>> -}
>> -
>>   static u32 decode_freq(u32 raw)
>>   {
>>       return DIV_ROUND_CLOSEST(raw * GT_FREQUENCY_MULTIPLIER,
>> @@ -1050,30 +1045,6 @@ int xe_guc_pc_restore_stashed_freq(struct 
>> xe_guc_pc *pc)
>>       return ret;
>>   }
>>   -/**
>> - * xe_guc_pc_gucrc_disable - Disable GuC RC
>> - * @pc: Xe_GuC_PC instance
>> - *
>> - * Disables GuC RC by taking control of RC6 back from GuC.
>> - *
>> - * Return: 0 on success, negative error code on error.
>> - */
>> -int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
>> -{
>> -    struct xe_device *xe = pc_to_xe(pc);
>> -    struct xe_gt *gt = pc_to_gt(pc);
>> -    int ret = 0;
>> -
>> -    if (xe->info.skip_guc_pc)
>> -        return 0;
>> -
>> -    ret = pc_action_setup_gucrc(pc, GUCRC_HOST_CONTROL);
>> -    if (ret)
>> -        return ret;
>> -
>> -    return xe_gt_idle_disable_c6(gt);
>> -}
>> -
>>   /**
>>    * xe_guc_pc_override_gucrc_mode - override GUCRC mode
>>    * @pc: Xe_GuC_PC instance
>> @@ -1217,9 +1188,6 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>>           return -ETIMEDOUT;
>>         if (xe->info.skip_guc_pc) {
>> -        if (xe->info.platform != XE_PVC)
>> -            xe_gt_idle_enable_c6(gt);
>> -
>>           /* Request max possible since dynamic freq mgmt is not 
>> enabled */
>>           pc_set_cur_freq(pc, UINT_MAX);
>>           return 0;
>> @@ -1257,15 +1225,6 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>>       if (ret)
>>           return ret;
>>   -    if (xe->info.platform == XE_PVC) {
>> -        xe_guc_pc_gucrc_disable(pc);
>> -        return 0;
>> -    }
>> -
>> -    ret = pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
>> -    if (ret)
>> -        return ret;
>> -
>>       /* Enable SLPC Optimized Strategy for compute */
>>       ret = pc_action_set_strategy(pc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
>>   @@ -1285,10 +1244,8 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
>>   {
>>       struct xe_device *xe = pc_to_xe(pc);
>>   -    if (xe->info.skip_guc_pc) {
>> -        xe_gt_idle_disable_c6(pc_to_gt(pc));
>> +    if (xe->info.skip_guc_pc)
>>           return 0;
>> -    }
>>         mutex_lock(&pc->freq_lock);
>>       pc->freq_ready = false;
>> @@ -1309,8 +1266,7 @@ static void xe_guc_pc_fini_hw(void *arg)
>>       if (xe_device_wedged(xe))
>>           return;
>>   -    CLASS(xe_force_wake, fw_ref)(gt_to_fw(pc_to_gt(pc)), 
>> XE_FORCEWAKE_ALL);
>> -    xe_guc_pc_gucrc_disable(pc);
>> +    CLASS(xe_force_wake, fw_ref)(gt_to_fw(pc_to_gt(pc)), XE_FW_GT);
>>       XE_WARN_ON(xe_guc_pc_stop(pc));
>>         /* Bind requested freq to mert_freq_cap before unload */
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h 
>> b/drivers/gpu/drm/xe/xe_guc_pc.h
>> index 0e31396f103c..1b95873b262e 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
>> @@ -15,7 +15,6 @@ struct drm_printer;
>>   int xe_guc_pc_init(struct xe_guc_pc *pc);
>>   int xe_guc_pc_start(struct xe_guc_pc *pc);
>>   int xe_guc_pc_stop(struct xe_guc_pc *pc);
>> -int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
>>   int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum 
>> slpc_gucrc_mode mode);
>>   int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc);
>>   void xe_guc_pc_print(struct xe_guc_pc *pc, struct drm_printer *p);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.c 
>> b/drivers/gpu/drm/xe/xe_guc_rc.c
>> new file mode 100644
>> index 000000000000..214473be6c83
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_rc.c
>> @@ -0,0 +1,114 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>
> 2026
ok.
>
>> + */
>> +
>> +#include <linux/device/devres.h>
>> +#include <drm/drm_print.h>
>> +
>> +#include "abi/guc_actions_slpc_abi.h"
>> +#include "xe_device.h"
>> +#include "xe_force_wake.h"
>> +#include "xe_gt.h"
>> +#include "xe_guc.h"
>
> Alphabetical
ok.
>
>> +#include "xe_gt_idle.h"
>> +#include "xe_gt_printk.h"
>> +#include "xe_guc_ct.h"
>> +#include "xe_guc_rc.h"
>> +#include "xe_pm.h"
>> +
>> +/**
>> + * DOC: GuC RC (Render C-states)
>> + *
>> + * GuC handles the GT transition to deeper C-states in conjunction 
>> with Pcode.
>> + * GuC RC can be enabled independently of the frequency component in 
>> SLPC,
>> + * which is also controlled by GuC.
>> + *
>> + * This file will contain all H2G related logic for handling Render 
>> C-states.
>> + * There are some calls to xe_gt_idle, where we enable host C6 when 
>> GuC RC is
>> + * skipped. GuC RC is mostly independent of xe_guc_pc with the 
>> exception of
>> + * functions that override the mode for which we have to rely on the 
>> SLPC H2G
>> + * calls.
>
> Can you link this doc in the firmware documentation
>
> Documentation/gpu/xe/xe_firmware.rst
sure, will add that.
>
>> + */
>> +
>> +static int guc_action_setup_gucrc(struct xe_guc *guc, u32 control)
>> +{
>> +    u32 action[] = {
>> +        GUC_ACTION_HOST2GUC_SETUP_PC_GUCRC,
>> +        control,
>> +    };
>> +    int ret;
>> +
>> +    ret = xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
>> +    if (ret && !(xe_device_wedged(guc_to_xe(guc)) && ret == 
>> -ECANCELED))
>> +        xe_gt_err(guc_to_gt(guc),
>> +              "GuC RC setup %s(%u) failed (%pe)\n",
>> +               control == GUCRC_HOST_CONTROL ? "HOST_CONTROL" :
>> +               control == GUCRC_FIRMWARE_CONTROL ? "FIRMWARE_CONTROL" :
>> +               "UNKNOWN", control, ERR_PTR(ret));
>> +    return ret;
>> +}
>> +
>> +/**
>> + * xe_guc_rc_disable() - Disable GuC RC
>> + * @guc: Xe GuC instance
>> + *
>> + * Disables GuC RC by taking control of RC6 back from GuC.
>> + */
>> +void xe_guc_rc_disable(struct xe_guc *guc)
>> +{
>> +    struct xe_device *xe = guc_to_xe(guc);
>> +
>> +    if (!xe->info.skip_guc_pc && (xe->info.platform != XE_PVC))
>> +        if (guc_action_setup_gucrc(guc, GUCRC_HOST_CONTROL))
>> +            return;
>> +
>> +    XE_WARN_ON(xe_gt_idle_disable_c6(guc_to_gt(guc)));
>> +}
>> +
>> +static void xe_guc_rc_fini_hw(void *arg)
>> +{
>> +    struct xe_guc *guc = arg;
>> +    struct xe_device *xe = guc_to_xe(guc);
>> +    struct xe_gt *gt = guc_to_gt(guc);
>> +
>> +    if (xe_device_wedged(xe))
>> +        return;
>> +
>> +    CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>> +    xe_guc_rc_disable(guc);
>> +}
>> +
>> +/**
>> + * xe_guc_rc_enable() - Enable GuC RC feature if applicable
>> + * @guc: Xe GuC instance
>> + *
>> + * Enables GuC RC feature.
>> + *
>> + * Return: 0 on success, negative error code on error.
>> + */
>> +int xe_guc_rc_enable(struct xe_guc *guc)
>> +{
>> +    struct xe_device *xe = guc_to_xe(guc);
>> +    struct xe_gt *gt = guc_to_gt(guc);
>> +
>> +    xe_gt_assert(gt, xe_device_uc_enabled(xe));
>> +
>> +    CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>> +    if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FW_GT))
>> +        return -ETIMEDOUT;
>> +
>> +    if (xe->info.platform == XE_PVC) {
>> +        xe_guc_rc_disable(guc);
>> +        return 0;
>> +    }
>> +
>> +    if (xe->info.skip_guc_pc) {
>> +        xe_gt_idle_enable_c6(gt);
>> +        return 0;
>> +    }
>> +
>> +    devm_add_action_or_reset(xe->drm.dev, xe_guc_rc_fini_hw, guc);
>> +
>> +    return guc_action_setup_gucrc(guc, GUCRC_FIRMWARE_CONTROL);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.h 
>> b/drivers/gpu/drm/xe/xe_guc_rc.h
>> new file mode 100644
>> index 000000000000..9798cc80fb4a
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_rc.h
>> @@ -0,0 +1,14 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>
> 2026

ok, thanks,

Vinay.

>
>
> Thanks
> Riana
>
>> + */
>> +
>> +#ifndef _XE_GUC_RC_H_
>> +#define _XE_GUC_RC_H_
>> +
>> +struct xe_guc;
>> +
>> +void xe_guc_rc_disable(struct xe_guc *guc);
>> +int xe_guc_rc_enable(struct xe_guc *guc);
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>> index 157520ea1783..2212f195f5a1 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.c
>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>> @@ -14,6 +14,7 @@
>>   #include "xe_gt_sriov_vf.h"
>>   #include "xe_guc.h"
>>   #include "xe_guc_pc.h"
>> +#include "xe_guc_rc.h"
>>   #include "xe_guc_engine_activity.h"
>>   #include "xe_huc.h"
>>   #include "xe_sriov.h"
>> @@ -216,6 +217,10 @@ int xe_uc_load_hw(struct xe_uc *uc)
>>       if (ret)
>>           goto err_out;
>>   +    ret = xe_guc_rc_enable(&uc->guc);
>> +    if (ret)
>> +        goto err_out;
>> +
>>       xe_guc_engine_activity_enable_stats(&uc->guc);
>>         /* We don't fail the driver load if HuC fails to auth */
>> @@ -244,11 +249,6 @@ int xe_uc_reset_prepare(struct xe_uc *uc)
>>       return xe_guc_reset_prepare(&uc->guc);
>>   }
>>   -void xe_uc_gucrc_disable(struct xe_uc *uc)
>> -{
>> -    XE_WARN_ON(xe_guc_pc_gucrc_disable(&uc->guc.pc));
>> -}
>> -
>>   void xe_uc_stop_prepare(struct xe_uc *uc)
>>   {
>>       xe_gsc_stop_prepare(&uc->gsc);
>> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
>> index 5398da1a8097..255a54a8f876 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.h
>> +++ b/drivers/gpu/drm/xe/xe_uc.h
>> @@ -12,7 +12,6 @@ int xe_uc_init_noalloc(struct xe_uc *uc);
>>   int xe_uc_init(struct xe_uc *uc);
>>   int xe_uc_init_post_hwconfig(struct xe_uc *uc);
>>   int xe_uc_load_hw(struct xe_uc *uc);
>> -void xe_uc_gucrc_disable(struct xe_uc *uc);
>>   int xe_uc_reset_prepare(struct xe_uc *uc);
>>   void xe_uc_runtime_resume(struct xe_uc *uc);
>>   void xe_uc_runtime_suspend(struct xe_uc *uc);
>
