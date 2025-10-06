Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB3EFCAC5B8
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 14:24:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C4C10E3EA;
	Mon,  6 Oct 2025 14:24:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="frudWuxu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58AC910E3EA
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 14:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759760681; x=1791296681;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=CrYN1FSQTZv8Q0TnYmgHo9ZNMTE5dWgjLSQ8Yj1Kn1U=;
 b=frudWuxuV+pghASeXuAPE4SLg+AtYtINHpLtc1KUJtLdHHM6Fd0/SnmO
 hlq5QzZVMLbccCdySNKTLTh5yBn7XPQE+m6jyLJKE9HMSOClY/wxpQ8EQ
 ubzsW+Yewuj1VgzU7AV2rOBQUIcnaSXtnnDUTMe8S6DVDMMEtBUIMnozR
 on5os3YALcj+V3nvAqRgzp7MrOS+GRHOjPcgHI2db4rYmoQglA1gMCBdC
 MkKSLU4ABMNFCVRHfj/aCHDfcpdyK17goIl2+JUHAGyqLtYnslmD6KMFT
 Id1OrmBKjI85IUKdlOTG4GbGmdjEVWEIz4ZtExMHEz4tAT/2qTw7C0EGt A==;
X-CSE-ConnectionGUID: LT2iBuWcSHK9IAM+VeybzA==
X-CSE-MsgGUID: wmW5ZxXjT5mHxzxq9/ddEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="60971017"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="60971017"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 07:24:41 -0700
X-CSE-ConnectionGUID: 05wDHJuOSqS+KGe+fkN1xQ==
X-CSE-MsgGUID: FOyCsJg+RselkP0w7PiHsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="216977301"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 07:24:41 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 07:24:40 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 07:24:40 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.70) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 07:24:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OXZTmUkQCvClTlFesPziWANFJQaDTfoIWZStNjy1rkIO9cyk3d6ux4fZU9bs0XdpXVCDzoaXkd9y9Ff5x7booOq3OuiuVdCzkdd9SEbZ+Sl7K2bmTMLDvzTCxam0E0jcGcyHmfDVm8gkOnjbC0YnOyxFt64k5ClwyctqAWR/pHMedqQO6M4udoZksZXtcOhhOr8WbXroFe9VidCth4OBzDvE4EBl7fxCwsK5l00z8lh7Q3xE/g5a1RM0GNSJWk4XxCbqvkqrkW7KR0Q8TgUx/hU9P8EgYcgu8coxe2ebhPYjA5R8sVMRV7oMKNPt50EHCFTYj4eehMbHOyfT1/1byQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rv53MnMJPMcXiw9CTXOgljluIAMhQhst3QVegqFrCk8=;
 b=OcQBcvC18IuGBk34wIEjTXsk8bH0Lx6DaeMMFR7WcfAe4j4C53NNzFar6k//ACoSn3CAkRxFDpsyizfmAt2prZF+TQfQDluM+tMR12nqBKdvbjaO5dsqlI4oGBm1WaclpRsbLw2rcb6ZTbgCyNLjKMpU4c+xhslOF3/ofd0DcCnsZqvEb+GGrLlHQIDMzIV2B5QBbYu8F7iQe3gBdzKxRXEmZpYYnBZqtG2gX2V2q+a4SLNySdcqWikCvbqDtQvW2nj4+z73osO+Vr/lHYN8pJLqC+FH4DHd5EtdbhiDuBLhS4VdHEsCY79msC1MDnPnuTgePEslXctrdi+7Ds2IKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by SN7PR11MB6752.namprd11.prod.outlook.com (2603:10b6:806:264::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 14:24:28 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Mon, 6 Oct 2025
 14:24:28 +0000
Message-ID: <fcde5ea3-0f19-4d71-839a-f1cd0f3b5a21@intel.com>
Date: Mon, 6 Oct 2025 16:24:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/30] drm/xe/vf: Add xe_gt_recovery_pending helper
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251006104445.2210624-1-matthew.brost@intel.com>
 <20251006104445.2210624-8-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20251006104445.2210624-8-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR10CA0094.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::23) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|SN7PR11MB6752:EE_
X-MS-Office365-Filtering-Correlation-Id: a84fc2de-b51d-484a-f9a5-08de04e40ee5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0NvQlVIVlZySC9vVWR1aENCd2Q4QUp0bHBrd21sZHB0Q01qQ0NzajBad2cx?=
 =?utf-8?B?RUNSQ0tURU01TUNTcnFmTWlMQWorL2RNdENIZ042OTMxUWJBRWJ4UGhWN3c3?=
 =?utf-8?B?Wng0QkRKNEFMQUdGVklndnZVZ2hhVWluS0RCMFFKc3hkZE9GSlY2VjdEeFJa?=
 =?utf-8?B?MWl1bEtxR0FuTUdZbmRyYUo1YlJ6cnpnOVpXeUtLenVBRjh4VXJSWFpkSXgx?=
 =?utf-8?B?bEZZMWxYbEpWQ3FlSXM4K2Q2U2RwN2plTW80NERFQVMzWTJRU0FzNWdTbzdK?=
 =?utf-8?B?My80V0lWOHl1NGlON3dzZm51M015dDFVT2kyaDI2Zm9BM2JZVkdsWGdMdVJr?=
 =?utf-8?B?TEl1SXIzcVVKeVFKQkE0RnBoWEFnWWJHcFZjdDRTREpPRTdNL1FTSVZVNVA3?=
 =?utf-8?B?YTVTNlJHQ0lzL3dldnBpREZNUndGaElGQTNiTk54elF6TVA5dlVWK0t6NHEz?=
 =?utf-8?B?QXdjMWJQRXBWOTJRcy9tTWplS2pyMlQrUEV2V09OSGZaaUk3SzRaRGV5MVhR?=
 =?utf-8?B?WTJMNHN3YW1hbWZxQUt4VzhYQWZVamlKRzd4N21RN0tGbTRtdm1rdXl5eEhG?=
 =?utf-8?B?Q1YwSnc2cWhKZTBWdHg0dUIvc3hjNGJVZlhudEhoUnhPY1QyWG1vSEJ6R3dX?=
 =?utf-8?B?b0R0WURDY25tQTVLK0J2Z2thaEw5dHlrTlJvQU1SbUcxcVJZZEl5emhUdTJ3?=
 =?utf-8?B?WDBSR0dSU0E5cGFxZC9PdGtNNExGcnNMNElwRTR2ZmxZUFJEaElWZXpPMVNG?=
 =?utf-8?B?TlhVYzRyODRWVFpRZDM5NTN3SWxQM1VPcm9OY0JVM01XMWRsb3lnOTN0OUNT?=
 =?utf-8?B?dGNEampWUEdiTmxmVFdzV1RhRUQ2K1cwR3ZGKzZ6M0Q3OWVUakRGbXBCdGdw?=
 =?utf-8?B?SWR6bzd5bjlyZkhPNDlaQVFVTFpEbUIzY2ZPK0RIaUxBcHUzcy9SRnNNNzRw?=
 =?utf-8?B?UzVZVTBiSGp1dUc5NHIrYmpyTW94aEc1VmJUZVd5R2JibVErbnpGaktMU1Zh?=
 =?utf-8?B?cEh0RUdYQmRKRE9Mc3U2SGh2ZkVaTXZUOHc3V01LeGt5aW4rSXJZd0h0VVVa?=
 =?utf-8?B?S0xwSU8zdEVOSHFkWGZUV2pEM2p0NVkyUDJUYTQwSGluZUhHU3p0UWMrd0tB?=
 =?utf-8?B?eDZrY0VrZkNLdnBvdG1nOS9wMGlPQTlMaHV3aDdpVkZ6cDNGZVhES2puOXZZ?=
 =?utf-8?B?Nlg4Ni9yTy9pOUZ1ZUFwNkNGRXVBY1NkOTgxdkpNKzBudXhES2R0UGxtMjhE?=
 =?utf-8?B?T1lBNmhGY2R4MHRTTFNNdFBiM0lENGlHUzduYkZkS1RRVTZoYzJLZWpUdHhB?=
 =?utf-8?B?KzVZcUZhcjF0b1YxYTl0eDhpaEFieitFNUtEcXNSNDB3QTIrTWZSYU5pbmlx?=
 =?utf-8?B?QkNaalhlMVVWeXJxZzE5MjViQWorSlhjNzlIUU9jZmcvVFRTdW1pTUkvMitz?=
 =?utf-8?B?SWVEN0ZMSjRWQTBhZEJDU3Bia2tjYkVUQndZelUzcFV3RHA1V0VpdlplaE5u?=
 =?utf-8?B?QWVNWlliMis4Z1NSOSs3UXBYa1ZVc2t3bTMzcnZjTExhcUgzMExIaFV6KzVP?=
 =?utf-8?B?MmVQSUk0QjVDTjVzMmhNR0diUnZDU3lGcDVJekcyTzFxQmJ3eUpCQ2cwOVd5?=
 =?utf-8?B?ZTc5MWN3bFBxazB5c25qeDNsOTdRUjNKcGZ2K2ZtV0hFOEVqN1Q3K0tHNnkr?=
 =?utf-8?B?a1NBK2Z5eCt6YTRydGpLR2xyMThwQ21VdTdhdzFtR29GVmFqYnhXL2ZzbmNU?=
 =?utf-8?B?RkYwUHdYazRIVk9lK21XVGhXTVJCUWZhRFY1Wmx5cllwVnFqT04yTzlzR01Z?=
 =?utf-8?B?aWVHczl4eEFUWEZpMGRXYm1KSURHMnFVRFJqVEY2SitPdW0yeGpkMXJrQzlI?=
 =?utf-8?B?M2R4OEw4Sjhnd2ZtSnlFdDJCbm13a2NpcWNUSlhuQ3hicURIUSs0QkJSamk3?=
 =?utf-8?Q?C61XAnUyFMWzwBvld7shiIssPcI8pT4o?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z053RTdkVWVsa3ZXTTArZEVVRmd0OFo4bi9Vbk1sUFd4amxHdjdJUVNaaXFC?=
 =?utf-8?B?Z0swR0laQzBNQ3FkZjFFaG12U2VKRzFScDIwckJXRmtFdzRDT2I0M1dISzlL?=
 =?utf-8?B?N29iZCswVUJNMytVWERjTTJoUHVkZG04VTlUV0M2ZHpFeEdkaVRKUGJ4OUhl?=
 =?utf-8?B?Tlc4ZHd6andWSGJSNGNxRHd3cUlaaitYK3FKZXRXbWR1RS9lcGx6K2hGa3Zh?=
 =?utf-8?B?MUZzWFg1bnNnVGJ4cVYvSndMQlNkWTZLYlg0MGVUb3IxMVh2RjJzZEU2Wnhk?=
 =?utf-8?B?MXRIT056RFQ3MTROWGk4TkRNWVk3aCtEcGVScXpTZkFJQng5bUVqQURuMVp4?=
 =?utf-8?B?TFpSS1lKU2drd003TlNiY0VOUWt4Rml6Rkk5azEra1hWYlZhNkJudWMrWWNq?=
 =?utf-8?B?ZnowOWJUVlNzcnZXNXdFc1ZJOXNKdVA3UHRmTGFlYmRkbUhLZVA4N1NmcCsv?=
 =?utf-8?B?dytrbTZxbksyOTY1OGx5SWx3Z0lRS0ttS2RYZlNXVHB1SkxPTzFhVElQSGNn?=
 =?utf-8?B?SlJMSW40MGIrWTZWOStsRVptWDZGR2tiYjlyWE41dHMyK3dOemZVaHAzR000?=
 =?utf-8?B?YXNKRzYzaTRqMldiVlgzdmxra0kzYXlMV0tVRUZzUjkwdHJQUDI1T2RpMFB3?=
 =?utf-8?B?TFlzYUlLOEVIUVBwRDBBMUZQZkFBNEZYSHRzam54NXdLZDM5bGZ1YnZ1c2hn?=
 =?utf-8?B?RDR5Rm5SOXJRY21GNVRoUjFacEg3SmM0bDR0OTEyTjZmeHBJcUZXSDlGL1d5?=
 =?utf-8?B?d3B2c0V4d2tTSTN3bEpUZmFCTk1uSXhLUjhicEZqcHBTVmVFTG94MXNlNWlr?=
 =?utf-8?B?SU5pK3lmejZWcmw1dkVoZGlGREpuRUFldE5IMElYcnlJTG1XaUMzb2ltOXpy?=
 =?utf-8?B?aENsNFdCcGRaZDhyNVFqd1VwMzFHQUdmdXdPcXNhUHNqWHpjUzVzS2VEeUxj?=
 =?utf-8?B?VTBKKzV6cDNQazVLOVR3REloazVXUnhER0poQTlWWkkzb2VuMEVra3pGeW50?=
 =?utf-8?B?WWUva2dxK0djMUxueWNNcnBZcmNjNG5Mbjk0NnlUUWNja2lsbWxJbHpQRkdG?=
 =?utf-8?B?QWE0V0NSeHN6TW1tOVJrc0dEbnhIeWR3Y3ppOERBd3A1T1ZtdFF6eGQrVUJX?=
 =?utf-8?B?ei9mNnhJYnR6ZXpsZjVIRUYxWFJoZVErWjhDbzhxRStEM3NIVlUxRWVEVlBE?=
 =?utf-8?B?eTBBK1RqSlNLaytZSUdLUTUyMTFGMjZXc1p1MVdrWWEwUkI2VXdxNWhJRlVq?=
 =?utf-8?B?L0JtbkNkZ25VNFlrU3pNcXphVDg2a01QTnI5aEl0K2g0b1VQUVRRVEVsYjVJ?=
 =?utf-8?B?ZEswd0M4VXhONnpubFVRc1dkRVVhY0VyeGs3V25OcldscHZ1R1ZyTlZJb1k2?=
 =?utf-8?B?bjBMRUVQVHFRK01YK0cxL3VlVUt3UXFxWWl3c2FDT0Yyb2x5ZXYrQU85bSts?=
 =?utf-8?B?VUZJRG1VS0ZVNmJFTFp5YlYwdVVkVU9rS0lxSlUwQXlFM1FPLzdKSWRBTWdi?=
 =?utf-8?B?Z1h5cG1zWG52UnIzbEFQd0tGaHhjSzVUc0ZuMnZTV0ozTGpwRW9OdGV4bGJ3?=
 =?utf-8?B?Wm9JZ3hvSmNaNjlUN1YrQlJLenNqdkw3MklGeEQxejZva2lvQ1dvSDZhUWpD?=
 =?utf-8?B?RWxEcjBwUWduWkx4bUNwZ01QZHRFLzBtKzIzRUR1bzVGaXRkYklRMDY3bGky?=
 =?utf-8?B?NHkyMGUwdEpNd1pQWkZOOWtiYjk3b3N1UUZ6N3RqcFhxS1FLVlVZQVh0V25h?=
 =?utf-8?B?bUpJdkFQeFMxcnBMa1lERzdEU2NJQzV6RzJyYzZmTUVnelUrTnZpenJCT051?=
 =?utf-8?B?RDVWeE9ZNUxWL0ZoNDBhL0dQNUIvdUJRTWtsZUI2SG9HRGxXZVhOLzRsL0RP?=
 =?utf-8?B?MG81bHh3YW0rb3JjODBnSXNIbUw1SDNBTlhDbVZuYTROMVI2NWNQUm5NWGtI?=
 =?utf-8?B?SUhYa2JKMmhWYS9oYzV5TElaYnRmV1Nvb1ZzM1RRNEFTdk81MGVjeUlQSXJn?=
 =?utf-8?B?NlF4cmtSaUhDZE5aQUdQTytGb3BvbjhuZDljaVJkelZVY1h4d0pZaXBiU0RY?=
 =?utf-8?B?L1NVT1djYVlhTDBCTVc2eEtGWThPSHVhaHZZanVaOXVsZ2VKTEE0Q0pFaDVp?=
 =?utf-8?Q?3CQ/lcYbqQEyifBA5x3rks0g9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a84fc2de-b51d-484a-f9a5-08de04e40ee5
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 14:24:28.4788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ekwiyTZBwM3nNHxbbA48CzCPR3jKnBBzcI0lf+Y+CFkfp2oYNfbnuSKCEXUBPE6fCMTRnEW+zJjilnurUJD26g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6752
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


On 10/6/2025 12:44 PM, Matthew Brost wrote:
> Add xe_gt_recovery_pending helper.
>
> This helper serves as the singular point to determine whether a GT
> recovery is currently in progress. Expected callers include the GuC CT
> layer and the GuC submission layer. Atomically visable as soon as vCPU
> are unhalted until VF recovery completes.
>
> v3:
>   - Add GT layer xe_gt_recovery_inprogress (Michal)
>   - Don't blow up in memirq not enabled (CI)
>   - Add __memirq_received with clear argument (Michal)
>   - xe_memirq_sw_int_0_irq_pending rename (Michal)
>   - Use offset in xe_memirq_sw_int_0_irq_pending (Michal)
> v4:
>   - Refactor xe_gt_recovery_inprogress logic around memirq (Michal)
> v5:
>   - s/inprogress/pending (Michal)

Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>

-Tomasz

>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt.h                | 13 ++++++
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 27 +++++++++++++
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  2 +
>   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h | 10 +++++
>   drivers/gpu/drm/xe/xe_memirq.c            | 48 +++++++++++++++++++++--
>   drivers/gpu/drm/xe/xe_memirq.h            |  2 +
>   6 files changed, 98 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 41880979f4de..5df2ffe3ff83 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -12,6 +12,7 @@
>   
>   #include "xe_device.h"
>   #include "xe_device_types.h"
> +#include "xe_gt_sriov_vf.h"
>   #include "xe_hw_engine.h"
>   
>   #define for_each_hw_engine(hwe__, gt__, id__) \
> @@ -124,4 +125,16 @@ static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
>   		hwe->instance == gt->usm.reserved_bcs_instance;
>   }
>   
> +/**
> + * xe_gt_recovery_pending() - GT recovery pending
> + * @gt: the &xe_gt
> + *
> + * Return: True if GT recovery in pending, False otherwise
> + */
> +static inline bool xe_gt_recovery_pending(struct xe_gt *gt)
> +{
> +	return IS_SRIOV_VF(gt_to_xe(gt)) &&
> +		xe_gt_sriov_vf_recovery_pending(gt);
> +}
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 0461d5513487..86131ee481dc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -26,6 +26,7 @@
>   #include "xe_guc_hxg_helpers.h"
>   #include "xe_guc_relay.h"
>   #include "xe_lrc.h"
> +#include "xe_memirq.h"
>   #include "xe_mmio.h"
>   #include "xe_sriov.h"
>   #include "xe_sriov_vf.h"
> @@ -776,6 +777,7 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt)
>   	struct xe_device *xe = gt_to_xe(gt);
>   
>   	xe_gt_assert(gt, IS_SRIOV_VF(xe));
> +	xe_gt_assert(gt, xe_gt_sriov_vf_recovery_pending(gt));
>   
>   	set_bit(gt->info.id, &xe->sriov.vf.migration.gt_flags);
>   	/*
> @@ -1118,3 +1120,28 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
>   	drm_printf(p, "\thandshake:\t%u.%u\n",
>   		   pf_version->major, pf_version->minor);
>   }
> +
> +/**
> + * xe_gt_sriov_vf_recovery_pending() - VF post migration recovery pending
> + * @gt: the &xe_gt
> + *
> + * This function's return value must be immediately visable upon vCPU unhalt and
> + * be persisent until RESFIX_DONE is issued. This guarnetee is only coded for
> + * platforms which support memirq, if non-memirq platforms support VF migration
> + * this function will need to be updated.
> + *
> + * Return: True if VF post migration recovery in pending, False otherwise
> + */
> +bool xe_gt_sriov_vf_recovery_pending(struct xe_gt *gt)
> +{
> +	struct xe_memirq *memirq = &gt_to_tile(gt)->memirq;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	/* early detection until recovery starts */
> +	if (xe_device_uses_memirq(gt_to_xe(gt)) &&
> +	    xe_memirq_guc_sw_int_0_irq_pending(memirq, &gt->uc.guc))
> +		return true;
> +
> +	return READ_ONCE(gt->sriov.vf.migration.recovery_inprogress);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index 0af1dc769fe0..b91ae857e983 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -25,6 +25,8 @@ void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt);
>   int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
>   void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>   
> +bool xe_gt_sriov_vf_recovery_pending(struct xe_gt *gt);
> +
>   u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>   u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>   u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index 298dedf4b009..1dfef60ec044 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -46,6 +46,14 @@ struct xe_gt_sriov_vf_runtime {
>   	} *regs;
>   };
>   
> +/**
> + * xe_gt_sriov_vf_migration - VF migration data.
> + */
> +struct xe_gt_sriov_vf_migration {
> +	/** @recovery_inprogress: VF post migration recovery in progress */
> +	bool recovery_inprogress;
> +};
> +
>   /**
>    * struct xe_gt_sriov_vf - GT level VF virtualization data.
>    */
> @@ -58,6 +66,8 @@ struct xe_gt_sriov_vf {
>   	struct xe_gt_sriov_vf_selfconfig self_config;
>   	/** @runtime: runtime data retrieved from the PF. */
>   	struct xe_gt_sriov_vf_runtime runtime;
> +	/** @migration: migration data for the VF. */
> +	struct xe_gt_sriov_vf_migration migration;
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
> index 49c45ec3e83c..56acfdd77266 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -398,8 +398,9 @@ void xe_memirq_postinstall(struct xe_memirq *memirq)
>   		memirq_set_enable(memirq, true);
>   }
>   
> -static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
> -			    u16 offset, const char *name)
> +static bool __memirq_received(struct xe_memirq *memirq,
> +			      struct iosys_map *vector, u16 offset,
> +			      const char *name, bool clear)
>   {
>   	u8 value;
>   
> @@ -409,12 +410,26 @@ static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
>   			memirq_err_ratelimited(memirq,
>   					       "Unexpected memirq value %#x from %s at %u\n",
>   					       value, name, offset);
> -		iosys_map_wr(vector, offset, u8, 0x00);
> +		if (clear)
> +			iosys_map_wr(vector, offset, u8, 0x00);
>   	}
>   
>   	return value;
>   }
>   
> +static bool memirq_received_noclear(struct xe_memirq *memirq,
> +				    struct iosys_map *vector,
> +				    u16 offset, const char *name)
> +{
> +	return __memirq_received(memirq, vector, offset, name, false);
> +}
> +
> +static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
> +			    u16 offset, const char *name)
> +{
> +	return __memirq_received(memirq, vector, offset, name, true);
> +}
> +
>   static void memirq_dispatch_engine(struct xe_memirq *memirq, struct iosys_map *status,
>   				   struct xe_hw_engine *hwe)
>   {
> @@ -434,8 +449,16 @@ static void memirq_dispatch_guc(struct xe_memirq *memirq, struct iosys_map *stat
>   	if (memirq_received(memirq, status, ilog2(GUC_INTR_GUC2HOST), name))
>   		xe_guc_irq_handler(guc, GUC_INTR_GUC2HOST);
>   
> -	if (memirq_received(memirq, status, ilog2(GUC_INTR_SW_INT_0), name))
> +	/*
> +	 * We must wait to perform the clear operation until after
> +	 * xe_gt_sriov_vf_start_migration_recovery() runs, to avoid race
> +	 * conditions where xe_gt_sriov_vf_recovery_pending() returns false.
> +	 */
> +	if (memirq_received_noclear(memirq, status, ilog2(GUC_INTR_SW_INT_0),
> +				    name)) {
>   		xe_guc_irq_handler(guc, GUC_INTR_SW_INT_0);
> +		iosys_map_wr(status, ilog2(GUC_INTR_SW_INT_0), u8, 0x00);
> +	}
>   }
>   
>   /**
> @@ -460,6 +483,23 @@ void xe_memirq_hwe_handler(struct xe_memirq *memirq, struct xe_hw_engine *hwe)
>   	}
>   }
>   
> +/**
> + * xe_memirq_guc__sw_int_0_irq_pending() - SW_INT_0 IRQ is pending
> + * @memirq: the &xe_memirq
> + * @guc: the &xe_guc to check for IRQ
> + *
> + * Return: True if SW_INT_0 IRQ is pending on @guc, False otherwise
> + */
> +bool xe_memirq_guc_sw_int_0_irq_pending(struct xe_memirq *memirq, struct xe_guc *guc)
> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	u32 offset = xe_gt_is_media_type(gt) ? ilog2(INTR_MGUC) : ilog2(INTR_GUC);
> +	struct iosys_map map = IOSYS_MAP_INIT_OFFSET(&memirq->status, offset * SZ_16);
> +
> +	return memirq_received_noclear(memirq, &map, ilog2(GUC_INTR_SW_INT_0),
> +				       guc_name(guc));
> +}
> +
>   /**
>    * xe_memirq_handler - The `Memory Based Interrupts`_ Handler.
>    * @memirq: the &xe_memirq
> diff --git a/drivers/gpu/drm/xe/xe_memirq.h b/drivers/gpu/drm/xe/xe_memirq.h
> index 06130650e9d6..e25d2234ab87 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.h
> +++ b/drivers/gpu/drm/xe/xe_memirq.h
> @@ -25,4 +25,6 @@ void xe_memirq_handler(struct xe_memirq *memirq);
>   
>   int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc);
>   
> +bool xe_memirq_guc_sw_int_0_irq_pending(struct xe_memirq *memirq, struct xe_guc *guc);
> +
>   #endif
