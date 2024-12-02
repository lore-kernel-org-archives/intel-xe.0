Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF17AE69E81
	for <intel-xe@archiver.kernel.org>; Mon,  2 Dec 2024 18:39:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF8810E106;
	Mon,  2 Dec 2024 18:39:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Or2qhUar";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7EAF10E106
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Dec 2024 18:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733164741; x=1764700741;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fFb2DAjfUXXUx1UMYozfokw9/6UugyCaQMAVhevcIBo=;
 b=Or2qhUarzavSQGzhyuNfilS9SY79lGGRCMQkbpMPe3XwXksfX/ysrs3t
 vU3Q6jLN6he3Q/lFceiR8ojYi9o5z1GFsW64nHLilAP5aBViG98dDxgRB
 FsWcpZq3WhqOSvWdjNzBE3BtebCmbCIR7cjuhB31StPgrqe789aFl09Hp
 7CgDzKqQHHYuzxM27Yt5KYm3+cdEjSTOW1EOPTwV+VYHOKM3fCLJfr2qz
 yZpNcDSvCu2zQ840QYVLqTMMZ+q1XDfeNOLatfN71WsOFYXiM08WwWgbN
 6KcRa7kcwd2hO+Ii+N0+dBMJNnqjrkPM8QLhzd1p+i0r/58llm+1Cdk3T g==;
X-CSE-ConnectionGUID: Qn5AQa+BT1O856tkxx+dzw==
X-CSE-MsgGUID: /hBW+y+VQ4eDbXrPRlRFTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="37290387"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; d="scan'208";a="37290387"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 10:39:00 -0800
X-CSE-ConnectionGUID: aAgDZlaKSby0RnlyOgx2zg==
X-CSE-MsgGUID: L86pgUO7R9aerH3UEK9B9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; d="scan'208";a="93096517"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Dec 2024 10:39:00 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Dec 2024 10:38:59 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 2 Dec 2024 10:38:59 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 2 Dec 2024 10:38:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ck9hadNkWTgJIw9nnSUMnynY2x0eS5WDG2q57fUWZaHU3wZgL8Cq6pCBgFXIy9X8JHtTM+Bc0je4rdvIzwROyXTsPSAJQ/THsO74WsaB944AtEEZkr+bCdndTObp5AniDjOzCmvF/sLAv12Ib9nwilQcMHKjqy+I2B76Hf17jGLCwZo7gpn+tZvQa961vhjKU8lthfKWcE4Zx2Rxe0qAqub8V8wpS0l0O2AFNljJaKaT18GaStiTe1l4ra0kx2UCnRPhKucMf88q3im42pSShuCDKVorFqsn0eX/sqxl22soeRGP7lx5Q+lci00MvBq4eyrwzXL2TZHNCmM4VfNSZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fd/WviudzSEqVfQiWerWsIe6HAT2VMjVmemiJYQy8Nk=;
 b=gsW/gTWQLy6rXG3DYt/JRuJqy+64kgIfB6Fz41DOk27W1B/ofWMayKhsZ2ZgVFRwKr8g8EjvSaRiJa4niSa2YY5eChoADzLktTPSQHsB1uvFO6r9aC6aZNjdYeeoQfHdVyE96X0aqH8y8XtUzPQ/llkSsZtlM0OoBnuOB4wwDx4JgIul0Wabx6FBIgXl+NTTnL6BbhCTEhNN6SPX7IHXqfI4r+MZ1oR3YZRBzyqD9gFCaP5Enz7y4QydZJMxd2C27vyNecCDybD2dA3bTA6/gYknqCPdyFYgySV4ps1yI3uZ0q47/GrvvCxgHZUOm2NflO2dzxN7H7P1I1/r4ZHgcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA1PR11MB6613.namprd11.prod.outlook.com (2603:10b6:806:254::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Mon, 2 Dec
 2024 18:38:55 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 18:38:55 +0000
Date: Mon, 2 Dec 2024 19:38:53 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/vf: Perform early GT MMIO initialization to
 read GMDID
Message-ID: <20241202183853.7liw6iungfopyp6h@intel.com>
References: <20241114175955.2299-1-michal.wajdeczko@intel.com>
 <20241114175955.2299-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241114175955.2299-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MI0P293CA0005.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::19) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA1PR11MB6613:EE_
X-MS-Office365-Filtering-Correlation-Id: 48820ee3-f2d5-4fa1-3fbe-08dd130093c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S1lGV2JkY2RiODJmTFkrdTJCVjRlbmpmTHVTNkF2VWtsdmVtNENENVhlRytw?=
 =?utf-8?B?YWtVd0NYNHJyRWFXbHMvdHdwZTdLejNtb3JRWGFCVXV1azZBTXFpZFBjamVq?=
 =?utf-8?B?Q2xiWHlDVmxzRjArN25kVXd5Qit0RnZzNDZmQmhPUVhlWStqb3lwenhUc2Y0?=
 =?utf-8?B?dnVjTitjbHlrRDRZMytFdnpBNndjZmxXWXJqNCtXeDl3ZUlRKzZ2L3ovMGNi?=
 =?utf-8?B?a2Z5Z3N1TlVSYy8rOGxRdGFRR1g2K1NTMm5YYjlERmRIaExlLzNJUkhtcnZD?=
 =?utf-8?B?QVRHbmtaMmY4bjd0L1VXcmNwTEhmMk9GOTMzd0NQRE9MR2pOdVI2R0lsMk42?=
 =?utf-8?B?SytsaXF5R3J2RDFkZ085UGdINjNGZFRaRW5wVWRkcnoreEc1ZTVXOS9sWmRT?=
 =?utf-8?B?QmlQYzV3MmdlSFBOSXVvOVV1UEhEclV5bCt1QjlCN2RQbERIR0ttMzdGRGtN?=
 =?utf-8?B?Y01LTFViaDJZUWJJZzIzQmNvVTh5ZWZNK0dLbFVJazVDM3U5eDliSk81VmV1?=
 =?utf-8?B?WCtZN3J6NTFrT1ZSUzQxRXpHenhkZWJVT0ZuYStiSFFmTkNManlvc1Z4bThv?=
 =?utf-8?B?VXBJUjJiMXU4NGFCT1NTTEN4RjBlNFJ6dHd5bWVsdFZXV1o1Skx4UGx6QWNK?=
 =?utf-8?B?MVA3Snd6MnZ0SmJXR3p4K0x0d0dhMXpvM1I0YzNIcTFncHFpeHM5SHlZUmhJ?=
 =?utf-8?B?UDg1ZnBPNU84UmgrZ3o0ZWMzSkVlemFoYkZodVE1Q2VxSkt4Qk1yVmt0T0Fy?=
 =?utf-8?B?V2oyUUk0Uk1kUUxFcWVpeXJndHJSS09YbVA1VktjQlhTeU0yamJpamp4M2FF?=
 =?utf-8?B?bkFpN2hkMEVzQnBvditCR0RUcnFQYU13eUkvUFR5SkJ1aW8zcC9IZThPOTdS?=
 =?utf-8?B?SE5LNXh4clFqQ24yOFdQbW9FWm5PQVZ5ek5lVTdBejF6TUV1SDFpZ2F3NWVh?=
 =?utf-8?B?VkhkYnB6VTZpcWh3bG1PeHRYWFFSOWtjOHRpSllKUzRLd21COWxZb3pnak1H?=
 =?utf-8?B?cDdjNmJGaFArZTA4TSt5RTIzVVBwUW1STERiZXRJTHZhRGNkRmh3ODc1Z0RT?=
 =?utf-8?B?anhkUk0yenV0NXMweVljYkNiNGYrUFQzTlp6M0lsVlljMjh6d1BzZHFCMWIy?=
 =?utf-8?B?aThRNDBTZVBET0Zhc0QwUzJORHExaDVaVnhpdTR3WFRCZGpQcmFPczF6V3hJ?=
 =?utf-8?B?eEZQWkd4SVJQcWx5UTBjVkpTTXhzbmt1QXZOTmFQdjJnNFhXRE9MR0pycEhr?=
 =?utf-8?B?Tkx1QnYyQ3FjVS9ON0hpVVlGVW16a2pwQlVobkpKMUFLZDEzTUVuYXZHazRW?=
 =?utf-8?B?K0hxTFVOUWhoUHpoNnllSVFNWmJmcEJ0OTVnY2xZNXNjb050YUUvSHIvMVNh?=
 =?utf-8?B?NkhZa0pFNXpVZWtTbVY0VDNDdnpHUEpMS3N6MFZXN2lQeWtaYWllaTFYTkY5?=
 =?utf-8?B?djM0cFIrb3dsQ2tKK09ZZzJMVEl5RnZhck1TTmxyeXBCUVI3aVQ5dHNVNmps?=
 =?utf-8?B?OTEwRTBXUHd0OHArdS9TTjR1S1NUS010a0RHNURiN0Vpd1hYRitieFFwMEh6?=
 =?utf-8?B?N1Z4elN3clJTZElsRWcrUGFkTnBqN2xJcUZLdzFxZkNBRzQ4SnI3SUQ4MS9G?=
 =?utf-8?B?RkV3eWExTkIzaXJodTFoWWRzR3FqOWF6MCtFTnN2VzIvSFE5S2lDNzBlM1FT?=
 =?utf-8?B?LzJRZWZXZ1ZKZVMvZVoxWWUwc2xVTll0WTN4M2pOTVlUNmYvY1pOc2hOZmtM?=
 =?utf-8?B?Y0w2T3gwSU1BTWF4OFppN3JZNXUzZUl4bkQvTEJrc1dld1ltUWFUYW9MNEMz?=
 =?utf-8?B?K2tnWTBtOFcvRmYySDZldz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlFyNWVMNHAwZGtYOVhvT1RIYzFuYWpYeENkTXdqNnVLbndHdHFrVFdibm1D?=
 =?utf-8?B?aVphK2xadXE1MHBGTUppVitXS2FHNkoxNW9jTG1UVlUzMHB6YlhTWFhqQmlJ?=
 =?utf-8?B?dTFyL3U1VjFiNjNTRDB5L0dNMG5IaFFiWDZYYUh4dHVzYkNQam5kWTVGT1hY?=
 =?utf-8?B?dkZkNGJmWGZua0FNeE1LQWhsL3FxRndXZE1WLzJJNkxHbCtuMnZtekhBK1RH?=
 =?utf-8?B?cSt2V2w2aDBMSHhSQlJsSERXTnJQS3J2OGFwRW40UWxXY2QwblpidmJiMy9G?=
 =?utf-8?B?NzhmMVRoalJUL29PdDB5RWptWlNld0hPSk4xNkZyWWF6WHpqNnRYR1ZlVGdD?=
 =?utf-8?B?YXJFRnVVd09uOU81Q2hxU1dmTytnZXJXbTJXWEY0eVN2bmdJYzllbjQyVG9z?=
 =?utf-8?B?YVFwcUJNdkVjWkkybGZJNENNWC9pbXpRUVQxUHppMW5hTzErRkRETGFCYVhU?=
 =?utf-8?B?UlArS2tRWnE0ZHRxdFBwZDQ5Ykh4dWlnUDM3UHVGZTArcUpiOFgyYWlLNHlr?=
 =?utf-8?B?dVFtZFhmUDR3YXNQVU5xcFhvUWZTMmlJT3FLaVRsYjNJNFhTMXViR2d4NFJq?=
 =?utf-8?B?SWxiMU1LcitJNXB2K1BxUlYyOC9pOVp0bmZka2owK0ZlYVdBSzRsMXBMZXJk?=
 =?utf-8?B?cm9wZmNmS0dtL2xlZng2S0FNQXZ3blAvWm5XRnR6TkV4eFdmT1ZYOUl3d1Zn?=
 =?utf-8?B?MnR0a0d6QSs4YWNtVkFabFVDb1prSURqS3lSRkFkQ0czTW4vUXJCaVZSVCtS?=
 =?utf-8?B?Vi9iU0pUdnFoZTFFTFNjSUZrVmdjdWNNaGFpaTZvTkF4R3ZxWWE3aGlvbFZT?=
 =?utf-8?B?YVIxNWdaYmFZWFNxdXhxQXZwWUxFVm80dEZCQjJKSEg0OHFNNzhHbFBvWnov?=
 =?utf-8?B?WkNaU1JXK1lHZEtoaUNsRTcxNmJTakxIY3puL3lqUGRhdWMwZks0ZTFFK0RH?=
 =?utf-8?B?eWIzdEFFdWVJZDJLNmZ1ZGhiMS90cnB1RC9oaUxzckZyUnNwdWU2VzUzSVNQ?=
 =?utf-8?B?OWJsci93bytxelZJMVVITTQ1WERONGtxbHJIZnoyVXFxcDQyYzI0a0JRczhL?=
 =?utf-8?B?czN6UkUyVDVqNVB0SWZSWUQ2TDdtYk82UlVSUkMyU0h1aisxeXViSUVGOXZO?=
 =?utf-8?B?cUlBUjZ5Z0FYQlRlNVNLcFVIV1BSa3VnZVhURkRsVGN0eWZRZE1nR2tndzZP?=
 =?utf-8?B?OS8yWTJiUVZzVklHMU9iWGxQcUhiSnhjczE5NkVpYjRIZndrZk9IeGU4TGV6?=
 =?utf-8?B?ME9ua1d5QWZvWmFBc0Z6K1JjYXlDOERFRUlKZk5SSW9ka2lwaW9ncjllaUdL?=
 =?utf-8?B?WG1lNFZNNjJ4aGNIZ3Q4RjVTbjVSdlZ6c3JiTWFuUmx3UFVmWFZUd0lqVU8z?=
 =?utf-8?B?M0hxTFA0b05wMk0vQ0IrRUdzQkVjR0JhanplclVBMjhYcEl4ZEdPb25rN3E0?=
 =?utf-8?B?akVVbUZQaUVmRFd5bndLZVNjOHMwaG9jejRIMm95S1RydnBWRkQzVDRBWjFO?=
 =?utf-8?B?RFlXaWhCR3ozZ0o0M2UraytOWGVCVjRpWHcvTG9iZmlENUk4UDlQSGlzTE5T?=
 =?utf-8?B?c25ZbU5MbWVKQzNFUkZXZG1uNE5KTFczbVBWaTJWVFZhRWIwd1dlaG5ENm1r?=
 =?utf-8?B?enM5VjR2bEl6TUU3VkhiSTFoL3BCYVp2empJbDZGLzFkdUtrbTZuelM5OVBk?=
 =?utf-8?B?YkVBMGEvUEJDUG9FVmdQSytLQnNFS2V5UUxnaE05eUhOWUc1Qnp5N3UvRk9q?=
 =?utf-8?B?dGkvL3BOcGhOSDNFRjRld3dSRFAwcnc5V1Z1dytLVFJHbFJXVUNUaU92Ymd1?=
 =?utf-8?B?Mzkva0t1VWY5YTllNmZzdEdxUzh0VjY1TUNRdmUxZWMvK3hKandxR3dIejQ1?=
 =?utf-8?B?Z09QZ3pIYWlNbmk2UTVicXNlWmp6aHVaYnI2dHV0Q01CRkNhN2IzbEYyS2hC?=
 =?utf-8?B?Y2pSV1F6UEx4QlFGaG16TzI3eG96N3lzb01yYjRYN0NVM3hySFhNZG5xdkJY?=
 =?utf-8?B?NUYxbGplR04yVWQrcHc1VUdJRTgzSTdVOUIzRjl4SmpiNGlTbEsycEkxOVhT?=
 =?utf-8?B?TndxY0pTVWJBTSt1ckR1cllDYnlqenpIdXpMUjNBb01UYkF2WWRhU2hCeDVW?=
 =?utf-8?B?MFM2cHhiOWVZN0FtVTBmWURsNmFqM2hEL2JydVhTNTd3Y0V5MjdEK2dUMDBO?=
 =?utf-8?B?N0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48820ee3-f2d5-4fa1-3fbe-08dd130093c9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 18:38:55.8374 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QayPZHGpw9EEZsqwdnR0bG2xK0WBFzzOVtSW0EY8iUXocOIyAZBEuWu/45D4L/PKD+Voti1z+y7y8idV34TkhyJ5gkQace6PnOQk+eYJelA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6613
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on czw [2024-lis-14 18:59:55 +0100]:
> VFs need to communicate with the GuC to obtain the GMDID value
> and existing GuC functions used for that assume that the GT has
> it's MMIO members already setup. However, due to recent refactoring
> the gt->mmio is initialized later, and any attempt by the VF to use
> xe_mmio_read|write() from GuC functions will lead to NPD crash due
> to unset MMIO register address:
> 
> [] xe 0000:00:02.1: [drm] Running in SR-IOV VF mode
> [] xe 0000:00:02.1: [drm] GT0: sending H2G MMIO 0x5507
> [] BUG: unable to handle page fault for address: 0000000000190240
> 
> Since we are already tweaking the id and type of the primary GT to
> mimic it's a Media GT before initializing the GuC communication,
> we can also call xe_gt_mmio_init() to perform early setup of the
> gt->mmio which will make those GuC functions work again.
> 
> Fixes: 58548b91101f ("drm/xe: Defer gt->mmio initialization until after multi-tile setup")
> Fixes: 0afda5d7bba4 ("drm/xe/pci: Convert register access to use xe_mmio")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 9b81e7d00a86..8388a92c8fc2 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -507,6 +507,7 @@ static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver,
>  			gt->info.type = XE_GT_TYPE_MAIN;
>  		}
>  
> +		xe_gt_mmio_init(gt);
>  		xe_guc_comm_init_early(&gt->uc.guc);
>  
>  		/* Don't bother with GMDID if failed to negotiate the GuC ABI */

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.43.0
> 

-- 
