Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C5ACEB2FD
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 05:11:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9387C10E0C9;
	Tue,  1 Oct 2024 05:11:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FKnsPCHJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C397810E0C9
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Oct 2024 05:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727759499; x=1759295499;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gT2RVd/tSztO/jdhJu2W3W5ZrVyeV1yWUL4TE0879EA=;
 b=FKnsPCHJYrvwI21OOPsha6h6lN6AXHDly0x5htPUGoB9ldqkpiMVWlDf
 YQnF7hKQ9smF+wLpqPsIbCxVCIRm4Rgg/YsTIsU8H/rDgiftEbrdNFgk3
 mz+1OJGNYgPKNeYi531+oN0vm6GcvKyp0k658U1YIz51ZcZFd0OzD6hc2
 /y0fqdPYn7i3VpmR/EraJ6qR/i3vv5uA1gJDdIgJORIVHIsHqAQhlKYNr
 L96r+n9DCKteMIBuK4MjfAoSi6pSgdNrL9zPk6473xmVxe5n5iahc320m
 kIOJxpl1ISHWaPcl/LlaQmu4eIoa37znhQzHEEUljoKWUI7kdWSd7i6mu w==;
X-CSE-ConnectionGUID: w9pL+hR/R5CaZ4s699Hi5g==
X-CSE-MsgGUID: TwnHSoZORny006aF+zp+Jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="38013279"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="38013279"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 22:11:26 -0700
X-CSE-ConnectionGUID: d0CTQq0vQEyM/8fbSTGKSw==
X-CSE-MsgGUID: l9RAaEnUS76+p03u5W0FwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="77599284"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Sep 2024 22:11:25 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 22:11:24 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 30 Sep 2024 22:11:24 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Sep 2024 22:11:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OFCsox+3RKD80dNrkGRAr0gtaaB/OKW2ZQCdQ70AaT6zqOQSfWMR8DpF3ANsL1wYSnnPSXoSGLQzOC+q7E/DkkTC5tpJuRkQblBDfa/7F1nWfBqQzBZAL/q6OeM4ctbeatdzm3VtQNm5mmzxNsgTkoeziz6AYwDl79mrle/xCrKQxTwSBaxMu2Nm4AJn2KrXc0iczyBIx5iRthM1Drz1EwEqiDLsHTGYvU5lJxKK+4/TPGXZeXRU8TbJyqSjWcoUTWwReQpl7tiTFOj07BF5U70FzVkiqZJxCnjNnwd78CfOZymtCnVBWsHeoEV4eaHmHligQSpf0MxkWK/YEZMdxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o9ZeygjkkD/dil9koetij0ycUi2kMzjd/utCeFWPxNg=;
 b=wOYuOwW8ByM5TtC2HcsfF145bc1GtS1LyF7R7XWKeKMlyYRA12gkm5DXgNC1+tn8Axe4nn+7ep0yIw2XfaTLKd34dp9s28DzRHm/TV8RkfDBAoWeQLLzeLf2Y3KqzuEEbo3GO3/anVp8d2EXILbvxQBxPdCNFBLaI0NZBm07CQcX/XCsGdZcFVBbY6mM3jmWs0Wj4GlcPHrYHVFV1Dy8kanrW9A4yMVoZZGVQSty5rEQncr4lDomijDMaP6BjYs8ZedzJnjbfc20Afp5x/ghJRjzT72A1fAriC+YtO2QSJ40snuI6UeAw1wOUqWuIfVTlzrk2k8nDBsNc0mqjCXmyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DS0PR11MB7902.namprd11.prod.outlook.com (2603:10b6:8:f6::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8005.26; Tue, 1 Oct 2024 05:11:16 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8005.024; Tue, 1 Oct 2024
 05:11:15 +0000
Message-ID: <6dbbfd13-e579-46ff-8975-6d88516aa1c1@intel.com>
Date: Tue, 1 Oct 2024 10:41:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/25] drm/xe: Modify xe_force_wake_put to handle _get
 returned mask
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Badal Nilawar <badal.nilawar@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, "Nirmoy
 Das" <nirmoy.das@intel.com>
References: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
 <20240930053149.1246339-5-himal.prasad.ghimiray@intel.com>
 <2cd313aa-264a-4e33-88e4-7b1093c1df36@intel.com>
 <b598cd52-fbbe-46cd-ae81-47519f5db77d@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <b598cd52-fbbe-46cd-ae81-47519f5db77d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0015.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::27) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DS0PR11MB7902:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b453dd9-8577-4c3d-d1d4-08dce1d779b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eERRSkp6YVBIRUI2ZlpNc2l6ZGtkeUVTZXlscEdpaWVYeGZjUjNkR2pNbXBI?=
 =?utf-8?B?dE8yQ2tlMVJWdlpFTjFNbWU2ZXZRcjladzBlek9OdnAwSGZ1RUI1QjhQcFdj?=
 =?utf-8?B?ejlOckpCVHR0S2Q4WmVzeHFqc2pQM1EvUHN0RHVYMGVBbkV3MFZFV05XYnM1?=
 =?utf-8?B?cTltVVcxWm9BNVJENlZXK2JGaGZoRm5FNXZlUlMxNFgwMHJpOU9jMlRJQzBB?=
 =?utf-8?B?ME9qQ0hkVXdWd3Q5RFVlMDYzangzWDFYVlZQUXVEUXNPa0QwVFJxekJMbFE0?=
 =?utf-8?B?MnFMMVRLTUMrVmJUV0NpU2Rnb2prdjBSWVhpNHlnTVB5VXJBME1zbVY5TnFM?=
 =?utf-8?B?REdta3ZUa0ROMnhMZzJUR1dINHNZaWJNRmZXOGFQbkpxVGlxbnY0ZEU0VTZM?=
 =?utf-8?B?SnpoTmxCMThIZUY3bGZ1SjE5WkFqM1JkTTZOaUhEaFA0TzNobHZ1NVhlYnU2?=
 =?utf-8?B?RGRyQnFEREYxSUZQZXJuY2hha2Q0Y0ZMN2wrVmplQ3JCUlRxYVpHdmhuSllt?=
 =?utf-8?B?S09BS1lqYmVrT3haVEZXQW9paEx5b0Fad1l6Z20rRFNJT3cyZ05zOHdwTlpN?=
 =?utf-8?B?bVhlcFR3Rmo0eU5kT0VaMW9DUVZ3MjRETVpTejI4NnBQV2w3MFB1b3RES3lR?=
 =?utf-8?B?NzM3K1lnTGRqbEVzU2QvMlRta2g1Q1RlY1FIS1o1UkNCY3BUVEM2VEs4YnpR?=
 =?utf-8?B?bzRvcithZk9KWWtDQmJkRno3Zy9WSnBNVWRCcW90V2dOcGVvV3M4WVBvYm41?=
 =?utf-8?B?SHZZN1NwYmpsekJDMmYrQnR3RVpLREdFVk5MbnVNcSsrbFZnTXc2aVZqQ21E?=
 =?utf-8?B?RCtHc0Jhbk1wakE1aVRtVXB0MG1EUUhwOUhvODYzUXpzbXptam5NY25xRHZ5?=
 =?utf-8?B?UVJocmorOSt3d0VRRGZnZFFSQ3JKVWNBOEwxb2FRa2g2NllEQUROektsWGJM?=
 =?utf-8?B?aTZNbE1xeCtHdHErVERUMkRTd3NnRittMjBTdy9CRWcvdVY4bFROZEVUY2Ni?=
 =?utf-8?B?ZHdoYnMwMTRCWUQycVRBK3haMzlrUVJoZkFJVmNyWTl0VTFybW9kWWNSN3VY?=
 =?utf-8?B?cjFHR0M2Vjc1UDBKcW5UbHNtdnpNM3JJTDhOei9YbENlNksrMmZhMzU4V0p4?=
 =?utf-8?B?UzVYNmJpRVNkaUxqUzY0YVd6bSt0U2xWYmVDSHJob1pqWUpuaUU0TnVSbDNa?=
 =?utf-8?B?Q3R5Q1RGMWhyY0FCRk9xZlFmWHJtNnU2Q1Zhcy9nUFdpSHV5WGx1eVlLNEFo?=
 =?utf-8?B?MXowRDVpTW1qSkNhNTFkRGNoNDNWaWF2d3RrNGhrTW5NMDN2T0NELzFpdVhB?=
 =?utf-8?B?VHp5ajNnMk5rWTZ2MXdFWFVhMVhJMFZCMFp0Yk9mbGI3VGVqa0VCTlRvekhM?=
 =?utf-8?B?ZyszVkd5a0pzcnkyUjJ2ZWE3RXhjb3ZocFo1aEh5bVp6ME1LanNTQWNnMXJF?=
 =?utf-8?B?TlNmMDRuQmtXUThzSHNtSWNJZENXVzhEVlJtaXV6b1BXTnlzRXRndjdVTFkv?=
 =?utf-8?B?R0dVbzVKQTZhTVZFc20ySUo5SGJqS3pCeDROZHlubjRCelJiaTJCUTdSMlFp?=
 =?utf-8?B?U2pqR2RmSnRTcTB1RWFjbmdhRTJ4djRsM29haHRjWnM3aVdEQ1Z0bmZ1Z0xk?=
 =?utf-8?B?RkkyMDlTUXRndkRWRWJGUnB4TG1oUWxmOGlqdzIzbGdVdDN3Q09leVREQldq?=
 =?utf-8?B?Uk5LQnorRktMNkNEajBZQU1MTVpjWUIrdFV2cFhMMUkyMkl2clpucFFnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWNXK1JHOTRvNlMya1FoUjFRNS8xaFluQnRyTUZtOFo2MGpCSEdFR1huVHlu?=
 =?utf-8?B?SFVzWEdnc1hiK1Z4WGUvcFRPek1UZTIvYUFqd25vL1ZzdmJZZ2E2YjROb1RM?=
 =?utf-8?B?MnNudUYrYW5tNnQrVnZoR24rUDc5c0ZoejVwWGZnOU13Rnh0d1Z6azRHdmE2?=
 =?utf-8?B?VGdtRG5wV1RmcksvbnNsUmdudTY3SGN3ait1eWFzeHJreC9GRm92SFp4SHZ3?=
 =?utf-8?B?aDBTZ3o2NHhTU3FWbE8wWTRyRzF1eHQ0MTRXMENQSDUxM0VZRks1VU5MaXRJ?=
 =?utf-8?B?MjgvUnRlMXhtbjgyL3ZjYzZRMTRPVktvRUdHcUdtbE54UVhrYkt5d3JIZEZE?=
 =?utf-8?B?endNT2NiZlBYTjg3MHNZd1V2ZmtDNmNDZWNmS0trRTFrbjBHZys0T2pBVktL?=
 =?utf-8?B?cmFwaFZwWmNheUFaZWQ3N0Y4L3dJeEdFVHR4RmozMlQ5VEFiVkdFNGhOUzRJ?=
 =?utf-8?B?MEcyZElBeXd3VEowSDFSNmVEZFdmOUcwakt3R2dVNTFJSnpHZXFDeW45aTUv?=
 =?utf-8?B?cENia0dYamVaR1hQM2NmOXVzZER6amRLVzlLSGkvT3RyR2J0UzJEbGJNY3oy?=
 =?utf-8?B?TkNoRDQxanZVWDN0MUw5MnRDRkFMVTd1Sy9BZzBtSTI3WU92aVQ2Y09BVkp4?=
 =?utf-8?B?V0ZHdWMzMTVkVmZiNzR0UFI2eXF6VWJkRjZKd3kxNVM1cmZ2YmZCR0VvRnYv?=
 =?utf-8?B?QkdQZEVLUzU4SVRpejJZMWYxMHR5NjJLaDNDNVRBQlZaUXp3N0hJUENVSGlu?=
 =?utf-8?B?QTNiRHVwajJuVDRHZG1tT0ZoaWdudmdMQ0NnQ2pmMDBzdFozb1BHTThRVjZV?=
 =?utf-8?B?bGtrcjBKemEvbXR2dmY5b2FJSGdxajVtdzF4RTFNbnB2eGhBY3d6U2lFZkR2?=
 =?utf-8?B?QVEyaFBScG5TS0cwYllYZ2JiSlFvRDJwRHYydlRSeThFaDlGV1JuL1RtUzVX?=
 =?utf-8?B?OUtzVHV5VmJaejZXWUpROWFUbFN5REM1di9kc2x6NzczZGxoNjNzdDl6UERk?=
 =?utf-8?B?Y1p6UkVnY1ErTmhTWmZpOEtaa2FEeHRRS3MrUWJBNSs5ZWh5RXZuVHlqeEhC?=
 =?utf-8?B?MXdpejJVMlBmV2QrYmRranVnVnpYWDM5RTdCWjk4UWxsYTNMU1k1MG8vSVY3?=
 =?utf-8?B?bUlGN3NQWnI4SU80bWt3MEd1eXBLdFFRUHNkVG9mWjl1ZGt4cVErckRManFm?=
 =?utf-8?B?NHMzNXI0aU83T2Z6a2ZVUTkvdys0MjI4enVXdUZUNGZ2ZGZsTlkwbWJyY2FQ?=
 =?utf-8?B?NlcrUlZuNjJTY3phWFVVakRDVlRaOHNEaTN3VXNHcmJIdDVrVk4zZGExaTlU?=
 =?utf-8?B?UHhpTnBOdmQ2b0FjRGc1Q0grbjJJcWtIYXArSGo1MWJEcHpFaFhGV1V1V0FE?=
 =?utf-8?B?VXc0b2lPeHZpb05VWk1IeUFhOWZacGV1YXZDOWRDK3Z0YXdHVCtIS3VOYzFR?=
 =?utf-8?B?TG9LMEpNQVU3NWtKOHhZd2pZN3VMR094NlArcFg4TysrK0crN1ZuMVhOd2lF?=
 =?utf-8?B?UFF2TVgzK2poVk1wNUZwTkZFZFFTNHhsMlVUMGRPOG5IcWdwOEhoUHcvWkFH?=
 =?utf-8?B?WHBHWkJwUVBKd2YzZ0IrUmxHUkdxVWFWcCs3N2N1eXV1dldqV1lXdFVUT1gw?=
 =?utf-8?B?TWxyRkhMb2w1aFgyNTFKRi81MGdudkdzYUxlbk94ZkxEaVdDUEhNVDBWeG5k?=
 =?utf-8?B?NStNTlVBbVp5a0FBVGRqRGdZb201TE9keFZjbFM4NGFHb0crZE9Malp1YWlU?=
 =?utf-8?B?a1ZOZlpLblhIcUJUUTdhOFdtR09Bdis0R1gwL201ZEhITG5zL0pIT3orRUhj?=
 =?utf-8?B?Ym1TWWUzZWpiVzZGUkc0TkM4M1lBN1JpcUkzRWJwRnRpTE1JVzRzSUFuTGpq?=
 =?utf-8?B?SlFTRTlPR0ErQktmYW44UkZCRGM4ZmpXc1B3Q3JMWDdCc3p6QmJFd1N1MlNL?=
 =?utf-8?B?N2ZLQWhEU3NoWVVDbWR3M1A1SWcvUzZFMHNjTDY0NHdGMXNsM0NPN3V4WStI?=
 =?utf-8?B?Q0JPSW9LMHNocFdiRFJYZGFJRWIraXhTZUxneGJTTHFaU2RJdE1uMkI3MjVN?=
 =?utf-8?B?RVJxbXk2dDlETEVEZFpGMjNvYWtyRm9xWUtweXZUNldSVlgwaWxveFJNdlRh?=
 =?utf-8?B?bVArU2R5OXpWQmI0ZlY3VnpidHZqcFJOeUYxNS8wMXB0MEpqT3daQjdJVGRB?=
 =?utf-8?Q?9RxhhKNDQ0e7XXGVSOTzO/s=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b453dd9-8577-4c3d-d1d4-08dce1d779b5
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 05:11:15.8935 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /HJD69Ktgf/M3N9p0/cfmpr17X5xtrtQrPZyP6kqiJJtZ4lyN+S1AKd1QWBRIWXPEdlJoVSzleoxYTmq0NisoBEQhZu4OvgxNhyf+Sjqchk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7902
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



On 01-10-2024 01:45, Michal Wajdeczko wrote:
> 
> 
> On 30.09.2024 22:13, Michal Wajdeczko wrote:
>>
>>
>> On 30.09.2024 07:31, Himal Prasad Ghimiray wrote:
>>> Instead of calling xe_force_wake_put on all domains that were input to
>>> xe_force_wake_get, call _put only on the domains whose reference counts
>>> were successfully incremented by the _get call. Since the return value
>>> of _get can be a mask that does not match any specific value in the enum
>>> xe_force_wake_domains, change the input parameter of _put to unsigned int.
>>
>> at this point in the series xe_force_wake_get() still returns errno
> 
> oops, scratch that, somehow missed patch 03/25
> 
>>
>> maybe rephrase this to something like:
>>
>> "Prepare xe_force_wake_put() to accept force_wake reference with
>> refcounted domains"
>>
>> and also maybe it is a good time to change this function to void (or
>> maybe even do it before this path?

Changing this to void here or before this patch will break the
compilation, since the cleanup is in subsequent patches. Therefore,
patch 25/25 addresses changing it to void after all the cleanups.

>>
>>>
>>> v3
>>> - Move WARN to this patch (Badal)
>>> - use xe_gt_WARN instead of XE_WARN (Michal)
>>> - Stop using xe_force_wake_domains for non enum values.
>>> - Remove kernel-doc from this patch (Badal)
>>>
>>> -v5
>>> - Fix global awake_domain
>>>
>>> -v6
>>> - put all initialized domains in case of FORCEWAKE_ALL.
>>> - Modify ret variable name (Michal)
>>> - Modify input var name (Michal)
>>> - Modify commit message and warn (Badal)
>>>
>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>>> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
>>
>> probably this applies to some earlier #rev, so please mark it as such

Sure. Miss at my end. Will do in this patch and others.

>>
>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_force_wake.c | 28 +++++++++++++++++++++-------
>>>   drivers/gpu/drm/xe/xe_force_wake.h |  2 +-
>>>   2 files changed, 22 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
>>> index 7f358e42c5d4..372ea43b0d06 100644
>>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>>> @@ -211,26 +211,40 @@ unsigned int xe_force_wake_get(struct xe_force_wake *fw,
>>>   }
>>>   
>>>   int xe_force_wake_put(struct xe_force_wake *fw,
>>> -		      enum xe_force_wake_domains domains)
>>> +		      unsigned int fw_ref)
>>>   {
>>>   	struct xe_gt *gt = fw->gt;
>>>   	struct xe_force_wake_domain *domain;
>>> -	enum xe_force_wake_domains tmp, sleep = 0;
>>> +	unsigned int tmp, sleep = 0;
>>>   	unsigned long flags;
>>> -	int ret = 0;
>>> +	int ack_fail = 0;
>>> +
>>> +	/*
>>> +	 * Avoid unnecessary lock and unlock when the function is called
>>> +	 * in error path of individual domains.
>>> +	 */
>>> +	if (!fw_ref)
>>> +		return 0;
>>> +
>>> +	if (fw_ref == XE_FORCEWAKE_ALL)
>>> +		fw_ref = fw->initialized_domains;
>>>   
>>>   	spin_lock_irqsave(&fw->lock, flags);
>>> -	for_each_fw_domain_masked(domain, domains, fw, tmp) {
>>> +	for_each_fw_domain_masked(domain, fw_ref, fw, tmp) {
>>>   		if (!--domain->ref) {
>>>   			sleep |= BIT(domain->id);
>>>   			domain_sleep(gt, domain);
>>>   		}
>>>   	}
>>>   	for_each_fw_domain_masked(domain, sleep, fw, tmp) {
>>> -		ret |= domain_sleep_wait(gt, domain);
>>> +		if (domain_sleep_wait(gt, domain) == 0)
>>> +			fw->awake_domains &= ~BIT(domain->id);
>>> +		else
>>> +			ack_fail |= BIT(domain->id);
>>>   	}
>>> -	fw->awake_domains &= ~sleep;
>>>   	spin_unlock_irqrestore(&fw->lock, flags);
>>>   
>>> -	return ret;
>>> +	xe_gt_WARN(gt, ack_fail, "Forcewake domain%s %#x failed to acknowledge sleep request\n",
>>> +		   str_plural(hweight_long(ack_fail)), ack_fail);
>>> +	return ack_fail;
>>>   }
>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
>>> index eb638128952d..b5a75544d86a 100644
>>> --- a/drivers/gpu/drm/xe/xe_force_wake.h
>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
>>> @@ -18,7 +18,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt,
>>>   unsigned int xe_force_wake_get(struct xe_force_wake *fw,
>>>   			       enum xe_force_wake_domains domains);
>>>   int xe_force_wake_put(struct xe_force_wake *fw,
>>> -		      enum xe_force_wake_domains domains);
>>> +		      unsigned int fw_ref);
>>>   
>>>   static inline int
>>>   xe_force_wake_ref(struct xe_force_wake *fw,
>>
> 

