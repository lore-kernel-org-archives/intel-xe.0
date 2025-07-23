Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A33C83F1A
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 21:21:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1A610E06C;
	Wed, 23 Jul 2025 21:21:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mSS/k490";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08BB910E06C
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Jul 2025 21:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753305715; x=1784841715;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NNllHJdIR4/+wZVeiYq64t2RZxeFiD7crWaLMS5walw=;
 b=mSS/k490/jiv8Ahy9zTQ+pjMQ/hA50xkkSkS9+Mqyr8VrP+/hBipQUlx
 9MxIgNQ20r4EQrorgbBpThxDT2FoSU3gjaEUgwYH7BzCCwfCsaFu1twS8
 qwi801g4uSdaosqsR+kjzcsR1cyf2LB0hPvFlHJdxQ5DzvGhlY+nDsCpj
 /vNY959Y+dVvhTlUj5C0g9AYHpPB2KY50Cj/QhFcwKUihL9Hd3rVzih0T
 rbPRv5VOcAedjVOcW4+lQ77vBaA+e4jhGdZ5dt4uUzQ5pMIe0H7FBui3U
 8fUu9VN99VCExG9hBsMjMoHMntsbyOv2Ud6MuyQx/5UffG0TcV6uAtEbE Q==;
X-CSE-ConnectionGUID: gnS0SKw9SFeSK7IQlvZF+A==
X-CSE-MsgGUID: JmdRy7gdSaChcufZSy+UsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55698569"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="55698569"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 14:20:38 -0700
X-CSE-ConnectionGUID: RpcluUzaStKWGBAxzODxdQ==
X-CSE-MsgGUID: 04HvLWlaQAO7dM5YZnvfbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="165345354"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 14:20:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 14:20:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 23 Jul 2025 14:20:31 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.70) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 14:20:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z8pPpbARKY4MiRvktZRxvaeV60rkGwiU0QEfpKAUdkwU284+CS5gBH1VdwgHyb3L4BroS5tovya+zPUVjDiOI/JrHO363t9A2OjdjLSqfrNtvy+EgeCD1aR19aCwRY5KcBrm/zn093+gxGk1mI+m9cZQLp2R4EjLVEFBer4qqrGFczP+dRgNouod+YmNJxLRVhU6u9HaKM5+NN2iH+Qqn5is5xiDl6v3a7MV1WWjzHrVFtpIkhhZJvk++U0CS7wJsrQHeFrvRd8hYeG1ozfKCT783H4OoPX2TjdqOe+nndhB/NHT0sUmDv0Lf6oE7juVd1kDqrlCNH/0JIn022BBLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=So3P8Ra+aTTIgBuD2kJ2i9tkECUNtmHEYCsgkS8pczM=;
 b=yoNb6qyrlUt3ta4XQxI47Fr7LoNoG6alYywqIA1edCRPbYJqTHGX4ujSU9FDxyjAQYd5axFljNgccn1RePVQwZWY0HFslUq3xDQXEPG1/ocZhvDy8svWTbm89KFkKlzNowSjbFg9ofObY9mOUaByayqxjeudUQ3XD8h7md4Sd2NRDhPQzqZlGraA17BJa3XFRXm1GluZy59x1pYywJytJpLiRpPsJ2DyUwLQZLYZTkIxvyJ6q1LoelUyNlM3yK0n/FSm7TR1EDvpYX25RySNEAXUZ0XZU5UMb27OU9quoarFEOvshmEWn1sds5wzZcHQzVDh2bbDe3no9GlO6v3BdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PR11MB8684.namprd11.prod.outlook.com (2603:10b6:0:4a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 21:20:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 21:20:14 +0000
Date: Wed, 23 Jul 2025 14:22:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "Kassabri, Farah" <farah.kassabri@intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>
Subject: Re: [PATCH 5/5] drm/xe: Split TLB invalidation code in frontend and
 backend
Message-ID: <aIFSeYFxE50ksYvx@lstrano-desk.jf.intel.com>
References: <20250723182222.48423-1-stuart.summers@intel.com>
 <20250723182222.48423-6-stuart.summers@intel.com>
 <aIE1XbbGohxwvI5F@lstrano-desk.jf.intel.com>
 <aIFDe7w41uKnayGO@lstrano-desk.jf.intel.com>
 <dafc298f5f296f6d653f526fa58592aacd482caa.camel@intel.com>
 <aIFKfcST9legrQiO@lstrano-desk.jf.intel.com>
 <671fc5f3d5f61c50bc0a1df1ac7452f72bf5cec3.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <671fc5f3d5f61c50bc0a1df1ac7452f72bf5cec3.camel@intel.com>
X-ClientProxiedBy: MW4PR03CA0260.namprd03.prod.outlook.com
 (2603:10b6:303:b4::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PR11MB8684:EE_
X-MS-Office365-Filtering-Correlation-Id: 98a57955-851f-49b4-e71f-08ddca2eb6f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UU1WNFEwTnVSRzBTaW85cWk5QUJ3YzBhOXplNlJHMDNsTmZreHFYeGcvVVR3?=
 =?utf-8?B?ZnFLSzl6VDFMQlFmd0UwOVo0Q3I2N0RkY2dGTzJiSmNKL0RrUG85TEJXZngr?=
 =?utf-8?B?d2lZODNETUtwOVlKMlJuSXFNQVRQbm9DU3U2cTlGK0UvU0YvQ2JQcUFUTDlq?=
 =?utf-8?B?a3Z4cW1YZlV5REdaOThPVzZISmlDeTBUQ0ExUnFvalpBRU9PMUcrRERsV2Iw?=
 =?utf-8?B?WUdraWxiSWRMTzBJVklhaVhRR0F2QUF0OFUxY0xybDlUTVE1YU15VXhsaUx4?=
 =?utf-8?B?UUp3U2JCSFEzTnJFYzdJRWFTTUNRNmRaZDczR1Y2STJYLzZseCt6MEdkN2FW?=
 =?utf-8?B?VHRrVWpUNmxmYUhtUVNIV2xmVVhPQjJvZUlHelZsdWZESHZBdUVzbmZrSUY1?=
 =?utf-8?B?djBrOFF6WnVNQzY5Z3JFVHVtN3ZLbmpDdXh1cnFYWGtBMGtESHJVbDVhVlJq?=
 =?utf-8?B?ZDFHNzhzU0VBMktEQXl5YkRKVTN1RTYrUjd0Q2NIczc1dURIbXVhRzBDTjNO?=
 =?utf-8?B?TzI3Z09hRzdEbEh3UlVPTFAzV21NdnoxSVR5em5kaW5GT3orVlJRdkthVWxa?=
 =?utf-8?B?bjJqM29XV1pIQ2JKSlNLNFg5SStqMzl3dlVBUzZOV3UxMDc3R2NJWXNxR0Zy?=
 =?utf-8?B?MXVpZy8rdmtQVzZ1WXhVT0NETGY4NThiWW5pdGVQMWxNT2NodTJTRTh6Wit5?=
 =?utf-8?B?WlVDWnp0eHlFdGJkNUEvYk1HT1RwTWNHTHZ3SUJOQ083RDA2dHQwNXg5em0w?=
 =?utf-8?B?Si9hUTR6NXZCZXR2ZlRFQUlpcFJxcG41MUJmY3pSQ3B5SSsrMnRKcGV0MCsw?=
 =?utf-8?B?bXFhUk1sRk9BQ1hPTUlVdXdRNTV5cFZkYmpQRnVYTGhmKzUxYTUzWFVPQ3ZD?=
 =?utf-8?B?S3U4bHl4c05ZRVdXZzlJRWhoZlA5Ym9KajY4dm9oampPZlh3M1ZpUHhGQWRD?=
 =?utf-8?B?aS85VGlkUkFaMVVHd3BXVER4RWxTWHNCNlQ1Vzcyd21zVDIyWDU1b2hvL1hN?=
 =?utf-8?B?eDVwR25STzdPVnpnTng1Q2tTTllWSnFVYXNIVGZseURoVTJsTnBoNXFzYVhm?=
 =?utf-8?B?ei9Wa1RNSWhvYzRneXQyaU5lMGtDckQ1dzE3dG51blFESDhGU2d2eCsxMDRj?=
 =?utf-8?B?WjZkZldRdVlocG55YVBmc1Y3dW45QkFZdzM4N3RKZGZtV0NSeEE0YTRxb0xQ?=
 =?utf-8?B?b2t0cEJMUzdIK3VJblhuYTZsa2RWN3VpcUpnTHkveHRTZ1BrYVdSS1BjTkMz?=
 =?utf-8?B?SW56YjFXVkRpdHd4Q3VNVUd5T3NmNkpCb0FkaHZ5UXh4RC9LUTExV1MwMGh4?=
 =?utf-8?B?Ri9OUno4WksyYkp6dThTK05XaXNJNDYzZ01ZQXF2cUVwZHZKbXV3L0RxSjlU?=
 =?utf-8?B?ZmlIdEZHbDN2dEhYUDFEeGFCWmtycm90cmRzU0htWHRWaHpyUDVSbXVRNG9p?=
 =?utf-8?B?d0JpYkx6c2x5dldLSDRoMjBwM3hVZDJKT0VEcTh0djJraUkwcmQzdHRMYjd0?=
 =?utf-8?B?NzR5Sm1xSHYrL0ZSTzJ4Q0hXWGJhSVZ4MHhQQlFncDZ2clN6QXFURU51TlMw?=
 =?utf-8?B?bGtrTUpXZUVZZ0wxY01wQm54elRzclpsQlNxZDNpSEp2U3krSXkyd0p6VnFm?=
 =?utf-8?B?d0JYNTU4K1hoekJCVXZJMWhPdzJ0S3lvaHBxTTBvWlF2VWl5T0VRMDd3OVVR?=
 =?utf-8?B?bUl6eGcxR3Ira0xUZ3l1S2RVZExwMDRyNnVmQUEraEpvM1ZSczUvMXhyakg3?=
 =?utf-8?B?UmRlb2s1Zm1sZ05mSTNGR3I2ZUVoa1JVTzVkRlhmSkJnNWRqaXFhZmFNS1VZ?=
 =?utf-8?B?RERKZUs2MFA2cC9EMC9GSW9jSkxDd0FyOFlqTjUwaldOLzU0cmxrTEcwOTBa?=
 =?utf-8?B?K0JmelZWSjJnekNoWVNDZy9DRzVpUDFubTZJdS90YXFZbmFyS01uTWNmMlRW?=
 =?utf-8?Q?KG/M+BlQk4w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXNpNC8veWpuR3hYOVRpaEtHR1l2U1lLSVhLVVVIL1RnWExaQTRlc2wwcnBj?=
 =?utf-8?B?WndSTHNlOUVLdTNzQU9MUm9nYTdlTkRyc1ZZdnpZOTgwa3UzZk01Vkdmc2Z4?=
 =?utf-8?B?SDZtenZQMGJ1SmYxMWxTay9JWjJFcEVtQXJOUVY3aWFQUUNNL1o3R2FoM3BZ?=
 =?utf-8?B?TFQ5Y3g3WDBNTjlGdmpvMnpOM1pSWVF1em9nZzlNdWVGMlUyTExGQ1BJOHh4?=
 =?utf-8?B?RzFIUGUxRCtSQysvN3YzK1dJMFhTeWVPU1dIQXZjNTdlNmhpMUR6bVV0SXVZ?=
 =?utf-8?B?TUE5WlR2c25VSm9qc3dLcDR2NGxLWW1qWFVveWVxQzhhNVYraUFGQ1F3SG1D?=
 =?utf-8?B?VnNtU0JDKzFpcmdBM2hwdDR6by9ZNU11c2dkcDJtendoL2lqZ1Jmc2twRWt2?=
 =?utf-8?B?ZVNzVUxEYVhwQ0NHVSs0WHdGRHN1VUoxVFJpVFlaSFgzTGIwZ1VWRXJUa3Rz?=
 =?utf-8?B?Z1R1SStaZldXbG4xSmdmRFdsMzJBUWVFWDFYMEJnR3IxVi81NGxqLzQyeXIx?=
 =?utf-8?B?SG96MVVzcUY1cGlEL2R2eVd1WUhlR0RPMTV4czlhOXprV3kyWjQ3aXg3dmkw?=
 =?utf-8?B?Vnh4cXVERUlRd09lMG1XcGtyRHNOK3BlR2kyVytkNmlOUTlhVzBGMkNjTXcw?=
 =?utf-8?B?Q043eGZtaGN6eURPOTNwN2VCTHBxSWlrcERyN2ZjY2ErVGhRNW1RV2RoRXJQ?=
 =?utf-8?B?YzU0SEFlZ2p4L29UMUx5ZDZwY0dBTjF6N3JaL2wvVFlSMDlDVjJueW5Hdmxu?=
 =?utf-8?B?dS8wZnUzckpXNXdPQUljTTRjS25SUWl3Qjg0aWwveU1vbWl5UmVOZTdtZFYz?=
 =?utf-8?B?dWhzSWdlcXhaSWdwMzRnSGViT1JLSXBXanFzRlNabWFtZkFlSnZ2SThDaGcy?=
 =?utf-8?B?RFBoTlZaU1BiYzhwc0g0bFVRcEQzUkRuN005aFY3V3kwOElaYUdPMzErMlZr?=
 =?utf-8?B?M2YzUlJyaXErY1p3cHZjbDVsWituS05iNTF5NW9TRDByNU0rdDBRVWtJSGt2?=
 =?utf-8?B?aWNwbEFLTlErRUM5RWlrT1FDQTJPdlEzUUxlTCtYanJEb01NdHozaXRIWTVH?=
 =?utf-8?B?UW9rSGVzVlFlaFVIemRsMVJnQmUySUFnZmR6dG1uYVlONTJ1Umt6cjM2Y1pk?=
 =?utf-8?B?NXJNQjgyZVFlOEgxbW1ld3dMTDNnUUZvcnFVQ2JyQlNIaXZIcDBoUVhRWWhw?=
 =?utf-8?B?RjNZckwzUzcxY05VSDFjMklTQzF4a3JMWjZUU3Q4WTVLY3lYbTgrWXMzR0Jl?=
 =?utf-8?B?YU93S2NnNkU0aW9sVk53MzM5aTNtTDEvL2FwU1ZyOU01REFxeVZTZDY4R1lE?=
 =?utf-8?B?eWlyN0d0RCtoZmsxRnpldXBRUW9WSE9SSGgvNlZxblhoRTFrTzliU0t5bHZw?=
 =?utf-8?B?UUhadTdkR1VidWQ1SWVjNlVXcXc3bkpkMVhvamVod2ZmMFdnUzNiTitKSmw5?=
 =?utf-8?B?RktGc0VWeE5VdnEzOVVUZTdPaG5MeHBBNDhteE00WVMxM0J3TmtaZ1NFcjlC?=
 =?utf-8?B?c3ZNTjJJMGRoUFltRmt4Wm5OQ2ZJNEgrWmRGbFl2YkUvTzhTT3VGSXhsNVVi?=
 =?utf-8?B?ejdEMityV1JScENMeFdrVjBKcUl1Qm1mZ1NTUEliWk05VlpyNC9WbUllRlZ3?=
 =?utf-8?B?WW55UTZlTkxXeVlkOHRMYjR0aG5IOGd4R25xcmU2RllxL1pDVk1jd2sxVDRw?=
 =?utf-8?B?UmlOdFhjL2MzcGFObXJ6ZnVabWI0eTg3dEYyUUVpTHB2WS9vbVFkZGFKSnc3?=
 =?utf-8?B?WjNDVFJxRk1sR1UzVk5xZzBrNFZNb0ZicWV3V05MNHlpUDR3S3F5UzFvcHll?=
 =?utf-8?B?V2RHNEpFOU40aXpqZG5aTGswVGNnbEZ4ejRDYk5SL05NZzhjZ3Ztb3lmdXRl?=
 =?utf-8?B?WSt6OUJtZFFDTjA5T1d1Tm5GdTFreWxxdHRkUURzUFMrQ0U5Qmg4RzU3RVhO?=
 =?utf-8?B?eWdJL1laRVBqTDgrNGd4di8wTi9nSGJzSFBQVCtSRnkwRUM2MFpYdzRONmNo?=
 =?utf-8?B?QzRYWlROcmM3ZWtpVW9GMkpSM3BsRGVtcFBhc2RLR3lTdDNjTzMrWERWUWsy?=
 =?utf-8?B?ZXA3WHU1bVNya3JHTmUvcFR1djB5TFpEeVhtSGpPWmRFTTdxRklBTXNBODY2?=
 =?utf-8?B?M2R4WWJxK1Fsd1M0dERKMmNvbnpDR2FNbXp3cDJ0Y2d2MWhLQm9CdlBzRTd1?=
 =?utf-8?B?Zmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98a57955-851f-49b4-e71f-08ddca2eb6f8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 21:20:14.5525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pB6HDUKEs0OmylAGBmmCN8h8gfdIfxKwJ4+j0EDPc0k8rfcEzk/IOubS3h4AHiZAK+NXmMIs7yiGQ0z9um4+1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8684
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

On Wed, Jul 23, 2025 at 02:55:24PM -0600, Summers, Stuart wrote:
> On Wed, 2025-07-23 at 13:47 -0700, Matthew Brost wrote:
> > 
> 
> <cut>
> (just to reduce the noise in the rest of the patch here for now...)
> 
> > > > > >  
> > > > > >  /**
> > > > > > - * xe_tlb_inval_reset - Initialize TLB invalidation reset
> > > > > > + * xe_tlb_inval_reset() - TLB invalidation reset
> > > > > >   * @tlb_inval: TLB invalidation client
> > > > > >   *
> > > > > >   * Signal any pending invalidation fences, should be called
> > > > > > during a GT reset
> > > > > >   */
> > > > > >  void xe_tlb_inval_reset(struct xe_tlb_inval *tlb_inval)
> > > > > >  {
> > > > > > -       struct xe_gt *gt = tlb_inval->private;
> > > > > >         struct xe_tlb_inval_fence *fence, *next;
> > > > > >         int pending_seqno;
> > > > > >  
> > > > > >         /*
> > > > > > -        * we can get here before the CTs are even
> > > > > > initialized if
> > > > > > we're wedging
> > > > > > -        * very early, in which case there are not going to
> > > > > > be
> > > > > > any pending
> > > > > > -        * fences so we can bail immediately.
> > > > > > +        * we can get here before the backends are even
> > > > > > initialized if we're
> > > > > > +        * wedging very early, in which case there are not
> > > > > > going
> > > > > > to be any
> > > > > > +        * pendind fences so we can bail immediately.
> > > > > >          */
> > > > > > -       if (!xe_guc_ct_initialized(&gt->uc.guc.ct))
> > > > > > +       if (!tlb_inval->ops->initialized(tlb_inval))
> > > > > >                 return;
> > > > > >  
> > > > > >         /*
> > > > > > -        * CT channel is already disabled at this point. No
> > > > > > new
> > > > > > TLB requests can
> > > > > > +        * Backend is already disabled at this point. No new
> > > > > > TLB
> > > > > > requests can
> > > > > >          * appear.
> > > > > >          */
> > > > > >  
> > > > > > -       mutex_lock(&gt->uc.guc.ct.lock);
> > > > > > -       spin_lock_irq(&gt->tlb_inval.pending_lock);
> > > > > > -       cancel_delayed_work(&gt->tlb_inval.fence_tdr);
> > > > > > +       tlb_inval->ops->lock(tlb_inval);
> > > > > 
> > > > > I think you want a dedicated lock embedded in struct
> > > > > xe_tlb_inval,
> > > > > rather than reaching into the backend to grab one.
> > > > > 
> > > > > This will deadlock as written: G2H TLB inval messages are
> > > > > sometimes
> > > > > processed while holding ct->lock (non-fast path, unlikely) and
> > > > > sometimes
> > > > > without it (fast path, likely).
> > > > 
> > > > Ugh, I'm off today. Ignore the deadlock part, I was confusing
> > > > myself...
> > > > I was thinking this was the function xe_tlb_inval_done_handler,
> > > > it is
> > > > not. I still think xe_tlb_inval should its own lock but this
> > > > patch
> > > > written should work with s/xe_guc_ct_send/xe_guc_ct_send_locked.
> > > 
> > > So one reason I didn't go that way is we did just the reverse
> > > recently
> > > - moved from a TLB dedicated lock to the more specific CT lock
> > > since
> > > these are all going into the CT handler anyway when we use GuC
> > > submission. Then this embedded version allows us to lock at the
> > > bottom
> > > data layer rather than having a separate lock in the upper layer.
> > > Another thing is we might want to have different types of
> > > invalidation
> > > running in parallel without locking the data in the upper layer
> > > since
> > > the real contention would be in the lower level pipelining anyway.
> > > 
> > 
> > I can see the reasoning behind this approach, and maybe it’s fine.
> > 
> > But consider the case where the GuC backend has to look up a VM,
> > iterate
> > over a list of exec queues, and send multiple H2Gs to the hardware,
> > each
> > with a corresponding G2H (per-context invalidations). In the worst
> > case,
> > the CT code may have to wait for and process some G2Hs because our
> > G2H
> > credits are exhausted—all while holding the CT lock, which currently
> > blocks any hardware submissions (i.e., hardware submissions need the
> > CT
> > lock). Now imagine multiple sources issuing invalidations: they could
> > grab the CT lock before a submission waiting on it, further delaying
> > that
> > submission. 
> > 
> > The longer a mutex is held, the more likely the CPU thread holding it
> > could switched out while holding it.
> > 
> > This doesn’t seem scalable compared to using a finer-grained CT lock
> > (e.g., only taking it in xe_guc_ct_send).
> > 
> > I’m not saying this won’t work as you have it—I think it will—but the
> > consequences of holding the CT lock for an extended period need to be
> > considered.
> 
> Couple more thoughts.. so in the case you mentioned, ideally I'd like
> to have just a single invalidation per request, rather than across a
> whole VM. That's the reason we have the range based invalidation to

Yes, this is ranged based.

> begin with. If we get to the point where we want to make that even
> finer, that's great, but we should still just have a single
> invalidation per request (again, ideally).
> 

Maybe you have a different idea, but I was thinking of queue-based
invalidations: the frontend assigns a single seqno, the backend issues N
invalidations to the hardware—one per GCID mapped in the VM/GT tuple—and
then signals the frontend when all invalidations associated with the
seqno are complete. With the GuC, a GCID corresponds to each exec queue’s
gucid mapped in the VM/GT tuple. Different backends can handle this
differently.

> Also, you already have some patches up on the list that do some
> coalescing of invalidations so we reduce the number of invalidations
> for multiple ranges. I didn't want to include those patches here
> because IMO they are really a separate feature here and it'd be nice to
> review that on its own.
>

I agree it is a seperate thing, that should help in some cases, and
should be reviewed on its own.

That doesn't help in the case of multiple VM's issuing invalidations
though (think eviction is occuring or MMU notifiers are firing). The
lock contenion is moved from a dedicated TLB invalidation lock, to a
widely shared CT lock. If multiple TLB invalidations are contending, now
all other users of the CT lock contend at this higher level. i.e., by
only acquring CT lock at last part of an invalidation, other waiters
(non-invalidation) get QoS.

Matt
 
> So basically, the per request lock here also pushes us to implement in
> a more efficient and precise way rather than just hammering as many
> invalidations over a given range as possible.
> 
> And of course there are going to need to be bigger hammer invalidations
> sometimes (like the full VF invalidation we're doing in the
> invalidate_all() routines), but those still fall into the same category
> of precision, just with a larger scope (rather than multiple smaller
> invalidations).
> 
> Thanks,
> Stuart
> 
> > 
> > Matt
> > 
> > > Thanks,
> > > Stuart
> > > 
> > > > 
> > > > Matt 
> > > > 
> > > > > 
> > > > > I’d call this lock seqno_lock, since it protects exactly
> > > > > that—the
> > > > > order
> > > > > in which a seqno is assigned by the frontend and handed to the
> > > > > backend.
> > > > > 
> > > > > Prime this lock for reclaim as well—do what primelockdep() does
> > > > > in
> > > > > xe_guc_ct.c—to make it clear that memory allocations are not
> > > > > allowed
> > > > > while the lock is held as TLB invalidations can be called from
> > > > > two
> > > > > reclaim paths:
> > > > > 
> > > > > - MMU notifier callbacks
> > > > > - The dma-fence signaling path of VM binds that require a TLB
> > > > >   invalidation
> > > > > 
> > > > > > +       spin_lock_irq(&tlb_inval->pending_lock);
> > > > > > +       cancel_delayed_work(&tlb_inval->fence_tdr);
> > > > > >         /*
> > > > > >          * We might have various kworkers waiting for TLB
> > > > > > flushes
> > > > > > to complete
> > > > > >          * which are not tracked with an explicit TLB fence,
> > > > > > however at this
> > > > > > -        * stage that will never happen since the CT is
> > > > > > already
> > > > > > disabled, so
> > > > > > -        * make sure we signal them here under the assumption
> > > > > > that we have
> > > > > > +        * stage that will never happen since the backend is
> > > > > > already disabled,
> > > > > > +        * so make sure we signal them here under the
> > > > > > assumption
> > > > > > that we have
> > > > > >          * completed a full GT reset.
> > > > > >          */
> > > > > > -       if (gt->tlb_inval.seqno == 1)
> > > > > > +       if (tlb_inval->seqno == 1)
> > > > > >                 pending_seqno = TLB_INVALIDATION_SEQNO_MAX -
> > > > > > 1;
> > > > > >         else
> > > > > > -               pending_seqno = gt->tlb_inval.seqno - 1;
> > > > > > -       WRITE_ONCE(gt->tlb_inval.seqno_recv, pending_seqno);
> > > > > > +               pending_seqno = tlb_inval->seqno - 1;
> > > > > > +       WRITE_ONCE(tlb_inval->seqno_recv, pending_seqno);
> > > > > >  
> > > > > >         list_for_each_entry_safe(fence, next,
> > > > > > -                                &gt-
> > > > > > >tlb_inval.pending_fences,
> > > > > > link)
> > > > > > -               inval_fence_signal(gt_to_xe(gt), fence);
> > > > > > -       spin_unlock_irq(&gt->tlb_inval.pending_lock);
> > > > > > -       mutex_unlock(&gt->uc.guc.ct.lock);
> > > > > > +                                &tlb_inval->pending_fences,
> > > > > > link)
> > > > > > +               xe_tlb_inval_fence_signal(fence);
> > > > > > +       spin_unlock_irq(&tlb_inval->pending_lock);
> > > > > > +       tlb_inval->ops->unlock(tlb_inval);
> > > > > >  }
> > > > > >  
> > > > > > -static bool tlb_inval_seqno_past(struct xe_gt *gt, int
> > > > > > seqno)
> > > > > > +static bool xe_tlb_inval_seqno_past(struct xe_tlb_inval
> > > > > > *tlb_inval, int seqno)
> > > > > >  {
> > > > > > -       int seqno_recv = READ_ONCE(gt->tlb_inval.seqno_recv);
> > > > > > +       int seqno_recv = READ_ONCE(tlb_inval->seqno_recv);
> > > > > > +
> > > > > > +       lockdep_assert_held(&tlb_inval->pending_lock);
> > > > > >  
> > > > > >         if (seqno - seqno_recv < -(TLB_INVALIDATION_SEQNO_MAX
> > > > > > /
> > > > > > 2))
> > > > > >                 return false;
> > > > > > @@ -201,44 +192,20 @@ static bool tlb_inval_seqno_past(struct
> > > > > > xe_gt *gt, int seqno)
> > > > > >         return seqno_recv >= seqno;
> > > > > >  }
> > > > > >  
> > > > > > -static int send_tlb_inval(struct xe_guc *guc, const u32
> > > > > > *action,
> > > > > > int len)
> > > > > > -{
> > > > > > -       struct xe_gt *gt = guc_to_gt(guc);
> > > > > > -
> > > > > > -       xe_gt_assert(gt, action[1]);    /* Seqno */
> > > > > > -       lockdep_assert_held(&guc->ct.lock);
> > > > > > -
> > > > > > -       /*
> > > > > > -        * XXX: The seqno algorithm relies on TLB
> > > > > > invalidation
> > > > > > being processed
> > > > > > -        * in order which they currently are, if that changes
> > > > > > the
> > > > > > algorithm will
> > > > > > -        * need to be updated.
> > > > > > -        */
> > > > > > -
> > > > > > -       xe_gt_stats_incr(gt, XE_GT_STATS_ID_TLB_INVAL, 1);
> > > > > > -
> > > > > > -       return xe_guc_ct_send(&guc->ct, action, len,
> > > > > > -                             G2H_LEN_DW_TLB_INVALIDATE, 1);
> > > > > > -}
> > > > > > -
> > > > > >  static void xe_tlb_inval_fence_prep(struct
> > > > > > xe_tlb_inval_fence
> > > > > > *fence)
> > > > > >  {
> > > > > >         struct xe_tlb_inval *tlb_inval = fence->tlb_inval;
> > > > > > -       struct xe_gt *gt = tlb_inval->private;
> > > > > > -       struct xe_device *xe = gt_to_xe(gt);
> > > > > > -
> > > > > > -       lockdep_assert_held(&gt->uc.guc.ct.lock);
> > > > > >  
> > > > > >         fence->seqno = tlb_inval->seqno;
> > > > > > -       trace_xe_tlb_inval_fence_send(xe, fence);
> > > > > > +       trace_xe_tlb_inval_fence_send(tlb_inval->xe, fence);
> > > > > >  
> > > > > >         spin_lock_irq(&tlb_inval->pending_lock);
> > > > > >         fence->inval_time = ktime_get();
> > > > > >         list_add_tail(&fence->link, &tlb_inval-
> > > > > > >pending_fences);
> > > > > >  
> > > > > >         if (list_is_singular(&tlb_inval->pending_fences))
> > > > > > -               queue_delayed_work(system_wq,
> > > > > > -                                  &tlb_inval->fence_tdr,
> > > > > > -                                  tlb_timeout_jiffies(gt));
> > > > > > +               queue_delayed_work(system_wq, &tlb_inval-
> > > > > > > fence_tdr,
> > > > > > +                                  tlb_inval->ops-
> > > > > > > timeout_delay(tlb_inval));
> > > > > >         spin_unlock_irq(&tlb_inval->pending_lock);
> > > > > >  
> > > > > >         tlb_inval->seqno = (tlb_inval->seqno + 1) %
> > > > > > @@ -247,202 +214,63 @@ static void
> > > > > > xe_tlb_inval_fence_prep(struct
> > > > > > xe_tlb_inval_fence *fence)
> > > > > >                 tlb_inval->seqno = 1;
> > > > > >  }
> > > > > >  
> > > > > > -#define MAKE_INVAL_OP(type)    ((type <<
> > > > > > XE_GUC_TLB_INVAL_TYPE_SHIFT) | \
> > > > > > -               XE_GUC_TLB_INVAL_MODE_HEAVY <<
> > > > > > XE_GUC_TLB_INVAL_MODE_SHIFT | \
> > > > > > -               XE_GUC_TLB_INVAL_FLUSH_CACHE)
> > > > > > -
> > > > > > -static int send_tlb_inval_ggtt(struct xe_gt *gt, int seqno)
> > > > > > -{
> > > > > > -       u32 action[] = {
> > > > > > -               XE_GUC_ACTION_TLB_INVALIDATION,
> > > > > > -               seqno,
> > > > > > -               MAKE_INVAL_OP(XE_GUC_TLB_INVAL_GUC),
> > > > > > -       };
> > > > > > -
> > > > > > -       return send_tlb_inval(&gt->uc.guc, action,
> > > > > > ARRAY_SIZE(action));
> > > > > > -}
> > > > > > -
> > > > > > -static int send_tlb_inval_all(struct xe_tlb_inval
> > > > > > *tlb_inval,
> > > > > > -                             struct xe_tlb_inval_fence
> > > > > > *fence)
> > > > > > -{
> > > > > > -       u32 action[] = {
> > > > > > -               XE_GUC_ACTION_TLB_INVALIDATION_ALL,
> > > > > > -               0,  /* seqno, replaced in send_tlb_inval */
> > > > > > -               MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL),
> > > > > > -       };
> > > > > > -       struct xe_gt *gt = tlb_inval->private;
> > > > > > -
> > > > > > -       xe_gt_assert(gt, fence);
> > > > > > -
> > > > > > -       return send_tlb_inval(&gt->uc.guc, action,
> > > > > > ARRAY_SIZE(action));
> > > > > > -}
> > > > > > +#define xe_tlb_inval_issue(__tlb_inval, __fence, op,
> > > > > > args...)  \
> > > > > > +({                                                          
> > > > > >    \
> > > > > > +       int
> > > > > > __ret;                                              \
> > > > > > +                                                            
> > > > > >    \
> > > > > > +       xe_assert((__tlb_inval)->xe, (__tlb_inval)-
> > > > > > >ops);       \
> > > > > > +       xe_assert((__tlb_inval)->xe,
> > > > > > (__fence));                \
> > > > > > +                                                            
> > > > > >    \
> > > > > > +       (__tlb_inval)->ops-
> > > > > > >lock((__tlb_inval));                \
> > > > > > +       xe_tlb_inval_fence_prep((__fence));                  
> > > > > >    \
> > > > > > +       __ret = op((__tlb_inval), (__fence)->seqno,
> > > > > > ##args);    \
> > > > > > +       if (__ret <
> > > > > > 0)                                          \
> > > > > > +               xe_tlb_inval_fence_signal_unlocked((__fence))
> > > > > > ;  \
> > > > > > +       (__tlb_inval)->ops-
> > > > > > >unlock((__tlb_inval));              \
> > > > > > +                                                            
> > > > > >    \
> > > > > > +       __ret == -ECANCELED ? 0 :
> > > > > > __ret;                        \
> > > > > > +})
> > > > > >  
> > > > > >  /**
> > > > > > - * xe_gt_tlb_invalidation_all - Invalidate all TLBs across
> > > > > > PF
> > > > > > and all VFs.
> > > > > > - * @gt: the &xe_gt structure
> > > > > > - * @fence: the &xe_tlb_inval_fence to be signaled on
> > > > > > completion
> > > > > > + * xe_tlb_inval_all() - Issue a TLB invalidation for all
> > > > > > TLBs
> > > > > > + * @tlb_inval: TLB invalidation client
> > > > > > + * @fence: invalidation fence which will be signal on TLB
> > > > > > invalidation
> > > > > > + * completion
> > > > > >   *
> > > > > > - * Send a request to invalidate all TLBs across PF and all
> > > > > > VFs.
> > > > > > + * Issue a TLB invalidation for all TLBs. Completion of TLB
> > > > > > is
> > > > > > asynchronous and
> > > > > > + * caller can use the invalidation fence to wait for
> > > > > > completion.
> > > > > >   *
> > > > > >   * Return: 0 on success, negative error code on error
> > > > > >   */
> > > > > >  int xe_tlb_inval_all(struct xe_tlb_inval *tlb_inval,
> > > > > >                      struct xe_tlb_inval_fence *fence)
> > > > > >  {
> > > > > > -       struct xe_gt *gt = tlb_inval->private;
> > > > > > -       int err;
> > > > > > -
> > > > > > -       err = send_tlb_inval_all(tlb_inval, fence);
> > > > > > -       if (err)
> > > > > > -               xe_gt_err(gt, "TLB invalidation request
> > > > > > failed
> > > > > > (%pe)", ERR_PTR(err));
> > > > > > -
> > > > > > -       return err;
> > > > > > -}
> > > > > > -
> > > > > > -/*
> > > > > > - * Ensure that roundup_pow_of_two(length) doesn't overflow.
> > > > > > - * Note that roundup_pow_of_two() operates on unsigned long,
> > > > > > - * not on u64.
> > > > > > - */
> > > > > > -#define MAX_RANGE_TLB_INVALIDATION_LENGTH
> > > > > > (rounddown_pow_of_two(ULONG_MAX))
> > > > > > -
> > > > > > -static int send_tlb_inval_ppgtt(struct xe_gt *gt, u64 start,
> > > > > > u64
> > > > > > end,
> > > > > > -                               u32 asid, int seqno)
> > > > > > -{
> > > > > > -#define MAX_TLB_INVALIDATION_LEN       7
> > > > > > -       u32 action[MAX_TLB_INVALIDATION_LEN];
> > > > > > -       u64 length = end - start;
> > > > > > -       int len = 0;
> > > > > > -
> > > > > > -       action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
> > > > > > -       action[len++] = seqno;
> > > > > > -       if (!gt_to_xe(gt)->info.has_range_tlb_inval ||
> > > > > > -           length > MAX_RANGE_TLB_INVALIDATION_LENGTH) {
> > > > > > -               action[len++] =
> > > > > > MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL);
> > > > > > -       } else {
> > > > > > -               u64 orig_start = start;
> > > > > > -               u64 align;
> > > > > > -
> > > > > > -               if (length < SZ_4K)
> > > > > > -                       length = SZ_4K;
> > > > > > -
> > > > > > -               /*
> > > > > > -                * We need to invalidate a higher granularity
> > > > > > if
> > > > > > start address
> > > > > > -                * is not aligned to length. When start is
> > > > > > not
> > > > > > aligned with
> > > > > > -                * length we need to find the length large
> > > > > > enough
> > > > > > to create an
> > > > > > -                * address mask covering the required range.
> > > > > > -                */
> > > > > > -               align = roundup_pow_of_two(length);
> > > > > > -               start = ALIGN_DOWN(start, align);
> > > > > > -               end = ALIGN(end, align);
> > > > > > -               length = align;
> > > > > > -               while (start + length < end) {
> > > > > > -                       length <<= 1;
> > > > > > -                       start = ALIGN_DOWN(orig_start,
> > > > > > length);
> > > > > > -               }
> > > > > > -
> > > > > > -               /*
> > > > > > -                * Minimum invalidation size for a 2MB page
> > > > > > that
> > > > > > the hardware
> > > > > > -                * expects is 16MB
> > > > > > -                */
> > > > > > -               if (length >= SZ_2M) {
> > > > > > -                       length = max_t(u64, SZ_16M, length);
> > > > > > -                       start = ALIGN_DOWN(orig_start,
> > > > > > length);
> > > > > > -               }
> > > > > > -
> > > > > > -               xe_gt_assert(gt, length >= SZ_4K);
> > > > > > -               xe_gt_assert(gt, is_power_of_2(length));
> > > > > > -               xe_gt_assert(gt, !(length &
> > > > > > GENMASK(ilog2(SZ_16M)
> > > > > > - 1,
> > > > > > -                                                  
> > > > > > ilog2(SZ_2M)
> > > > > > + 1)));
> > > > > > -               xe_gt_assert(gt, IS_ALIGNED(start, length));
> > > > > > -
> > > > > > -               action[len++] =
> > > > > > MAKE_INVAL_OP(XE_GUC_TLB_INVAL_PAGE_SELECTIVE);
> > > > > > -               action[len++] = asid;
> > > > > > -               action[len++] = lower_32_bits(start);
> > > > > > -               action[len++] = upper_32_bits(start);
> > > > > > -               action[len++] = ilog2(length) - ilog2(SZ_4K);
> > > > > > -       }
> > > > > > -
> > > > > > -       xe_gt_assert(gt, len <= MAX_TLB_INVALIDATION_LEN);
> > > > > > -
> > > > > > -       return send_tlb_inval(&gt->uc.guc, action, len);
> > > > > > -}
> > > > > > -
> > > > > > -static int __xe_tlb_inval_ggtt(struct xe_gt *gt,
> > > > > > -                              struct xe_tlb_inval_fence
> > > > > > *fence)
> > > > > > -{
> > > > > > -       int ret;
> > > > > > -
> > > > > > -       mutex_lock(&gt->uc.guc.ct.lock);
> > > > > > -
> > > > > > -       xe_tlb_inval_fence_prep(fence);
> > > > > > -
> > > > > > -       ret = send_tlb_inval_ggtt(gt, fence->seqno);
> > > > > > -       if (ret < 0)
> > > > > > -               inval_fence_signal_unlocked(gt_to_xe(gt),
> > > > > > fence);
> > > > > > -
> > > > > > -       mutex_unlock(&gt->uc.guc.ct.lock);
> > > > > > -
> > > > > > -       /*
> > > > > > -        * -ECANCELED indicates the CT is stopped for a GT
> > > > > > reset.
> > > > > > TLB caches
> > > > > > -        *  should be nuked on a GT reset so this error can
> > > > > > be
> > > > > > ignored.
> > > > > > -        */
> > > > > > -       if (ret == -ECANCELED)
> > > > > > -               return 0;
> > > > > > -
> > > > > > -       return ret;
> > > > > > +       return xe_tlb_inval_issue(tlb_inval, fence,
> > > > > > tlb_inval-
> > > > > > > ops->all);
> > > > > >  }
> > > > > >  
> > > > > >  /**
> > > > > > - * xe_tlb_inval_ggtt - Issue a TLB invalidation on this GT
> > > > > > for
> > > > > > the GGTT
> > > > > > + * xe_tlb_inval_ggtt() - Issue a TLB invalidation for the
> > > > > > GGTT
> > > > > >   * @tlb_inval: TLB invalidation client
> > > > > >   *
> > > > > > - * Issue a TLB invalidation for the GGTT. Completion of TLB
> > > > > > invalidation is
> > > > > > - * synchronous.
> > > > > > + * Issue a TLB invalidation for the GGTT. Completion of TLB
> > > > > > is
> > > > > > asynchronous and
> > > > > > + * caller can use the invalidation fence to wait for
> > > > > > completion.
> > > > > >   *
> > > > > >   * Return: 0 on success, negative error code on error
> > > > > >   */
> > > > > >  int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval)
> > > > > >  {
> > > > > > -       struct xe_gt *gt = tlb_inval->private;
> > > > > > -       struct xe_device *xe = gt_to_xe(gt);
> > > > > > -       unsigned int fw_ref;
> > > > > > -
> > > > > > -       if (xe_guc_ct_enabled(&gt->uc.guc.ct) &&
> > > > > > -           gt->uc.guc.submission_state.enabled) {
> > > > > > -               struct xe_tlb_inval_fence fence;
> > > > > > -               int ret;
> > > > > > -
> > > > > > -               xe_tlb_inval_fence_init(tlb_inval, &fence,
> > > > > > true);
> > > > > > -               ret = __xe_tlb_inval_ggtt(gt, &fence);
> > > > > > -               if (ret)
> > > > > > -                       return ret;
> > > > > > -
> > > > > > -               xe_tlb_inval_fence_wait(&fence);
> > > > > > -       } else if (xe_device_uc_enabled(xe) &&
> > > > > > !xe_device_wedged(xe)) {
> > > > > > -               struct xe_mmio *mmio = &gt->mmio;
> > > > > > -
> > > > > > -               if (IS_SRIOV_VF(xe))
> > > > > > -                       return 0;
> > > > > > -
> > > > > > -               fw_ref = xe_force_wake_get(gt_to_fw(gt),
> > > > > > XE_FW_GT);
> > > > > > -               if (xe->info.platform == XE_PVC ||
> > > > > > GRAPHICS_VER(xe) >= 20) {
> > > > > > -                       xe_mmio_write32(mmio,
> > > > > > PVC_GUC_TLB_INV_DESC1,
> > > > > > -
> > > > > >                                        PVC_GUC_TLB_INV_DESC1_
> > > > > > INVAL
> > > > > > IDATE);
> > > > > > -                       xe_mmio_write32(mmio,
> > > > > > PVC_GUC_TLB_INV_DESC0,
> > > > > > -
> > > > > >                                        PVC_GUC_TLB_INV_DESC0_
> > > > > > VALID
> > > > > > );
> > > > > > -               } else {
> > > > > > -                       xe_mmio_write32(mmio, GUC_TLB_INV_CR,
> > > > > > -
> > > > > >                                        GUC_TLB_INV_CR_INVALID
> > > > > > ATE);
> > > > > > -               }
> > > > > > -               xe_force_wake_put(gt_to_fw(gt), fw_ref);
> > > > > > -       }
> > > > > > +       struct xe_tlb_inval_fence fence, *fence_ptr = &fence;
> > > > > > +       int ret;
> > > > > >  
> > > > > > -       return 0;
> > > > > > +       xe_tlb_inval_fence_init(tlb_inval, fence_ptr, true);
> > > > > > +       ret = xe_tlb_inval_issue(tlb_inval, fence_ptr,
> > > > > > tlb_inval-
> > > > > > > ops->ggtt);
> > > > > > +       xe_tlb_inval_fence_wait(fence_ptr);
> > > > > > +
> > > > > > +       return ret;
> > > > > >  }
> > > > > >  
> > > > > >  /**
> > > > > > - * xe_tlb_inval_range - Issue a TLB invalidation on this GT
> > > > > > for
> > > > > > an address range
> > > > > > + * xe_tlb_inval_range() - Issue a TLB invalidation for an
> > > > > > address range
> > > > > >   * @tlb_inval: TLB invalidation client
> > > > > >   * @fence: invalidation fence which will be signal on TLB
> > > > > > invalidation
> > > > > >   * completion
> > > > > > @@ -460,33 +288,12 @@ int xe_tlb_inval_range(struct
> > > > > > xe_tlb_inval
> > > > > > *tlb_inval,
> > > > > >                        struct xe_tlb_inval_fence *fence, u64
> > > > > > start, u64 end,
> > > > > >                        u32 asid)
> > > > > >  {
> > > > > > -       struct xe_gt *gt = tlb_inval->private;
> > > > > > -       struct xe_device *xe = gt_to_xe(gt);
> > > > > > -       int  ret;
> > > > > > -
> > > > > > -       xe_gt_assert(gt, fence);
> > > > > > -
> > > > > > -       /* Execlists not supported */
> > > > > > -       if (xe->info.force_execlist) {
> > > > > > -               __inval_fence_signal(xe, fence);
> > > > > > -               return 0;
> > > > > > -       }
> > > > > > -
> > > > > > -       mutex_lock(&gt->uc.guc.ct.lock);
> > > > > > -
> > > > > > -       xe_tlb_inval_fence_prep(fence);
> > > > > > -
> > > > > > -       ret = send_tlb_inval_ppgtt(gt, start, end, asid,
> > > > > > fence-
> > > > > > > seqno);
> > > > > > -       if (ret < 0)
> > > > > > -               inval_fence_signal_unlocked(xe, fence);
> > > > > > -
> > > > > > -       mutex_unlock(&gt->uc.guc.ct.lock);
> > > > > > -
> > > > > > -       return ret;
> > > > > > +       return xe_tlb_inval_issue(tlb_inval, fence,
> > > > > > tlb_inval-
> > > > > > > ops->ppgtt,
> > > > > > +                                 start, end, asid);
> > > > > >  }
> > > > > >  
> > > > > >  /**
> > > > > > - * xe_tlb_inval_vm - Issue a TLB invalidation on this GT for
> > > > > > a
> > > > > > VM
> > > > > > + * xe_tlb_inval_vm() - Issue a TLB invalidation for a VM
> > > > > >   * @tlb_inval: TLB invalidation client
> > > > > >   * @vm: VM to invalidate
> > > > > >   *
> > > > > > @@ -496,27 +303,22 @@ void xe_tlb_inval_vm(struct
> > > > > > xe_tlb_inval
> > > > > > *tlb_inval, struct xe_vm *vm)
> > > > > >  {
> > > > > >         struct xe_tlb_inval_fence fence;
> > > > > >         u64 range = 1ull << vm->xe->info.va_bits;
> > > > > > -       int ret;
> > > > > >  
> > > > > >         xe_tlb_inval_fence_init(tlb_inval, &fence, true);
> > > > > > -
> > > > > > -       ret = xe_tlb_inval_range(tlb_inval, &fence, 0, range,
> > > > > > vm-
> > > > > > > usm.asid);
> > > > > > -       if (ret < 0)
> > > > > > -               return;
> > > > > > -
> > > > > > +       xe_tlb_inval_range(tlb_inval, &fence, 0, range, vm-
> > > > > > > usm.asid);
> > > > > >         xe_tlb_inval_fence_wait(&fence);
> > > > > >  }
> > > > > >  
> > > > > >  /**
> > > > > > - * xe_tlb_inval_done_handler - TLB invalidation done handler
> > > > > > - * @gt: gt
> > > > > > + * xe_tlb_inval_done_handler() - TLB invalidation done
> > > > > > handler
> > > > > > + * @tlb_inval: TLB invalidation client
> > > > > >   * @seqno: seqno of invalidation that is done
> > > > > >   *
> > > > > >   * Update recv seqno, signal any TLB invalidation fences,
> > > > > > and
> > > > > > restart TDR
> > > > > 
> > > > > I'd mention that is function is safe be called from any context
> > > > > (i.e.,
> > > > > process, atomic, and hardirq contexts are allowed).
> > > > > 
> > > > > We might need to convert tlb_inval.pending_lock to a
> > > > > raw_spinlock_t
> > > > > for
> > > > > PREEMPT_RT enablement. Same for the GuC fast_lock. AFAIK we
> > > > > haven’t
> > > > > had
> > > > > any complaints, so maybe I’m just overthinking it, but also
> > > > > perhaps
> > > > > not.
> > > > > 
> > > > > >   */
> > > > > > -static void xe_tlb_inval_done_handler(struct xe_gt *gt, int
> > > > > > seqno)
> > > > > > +void xe_tlb_inval_done_handler(struct xe_tlb_inval
> > > > > > *tlb_inval,
> > > > > > int seqno)
> > > > > >  {
> > > > > > -       struct xe_device *xe = gt_to_xe(gt);
> > > > > > +       struct xe_device *xe = tlb_inval->xe;
> > > > > >         struct xe_tlb_inval_fence *fence, *next;
> > > > > >         unsigned long flags;
> > > > > >  
> > > > > > @@ -535,77 +337,53 @@ static void
> > > > > > xe_tlb_inval_done_handler(struct xe_gt *gt, int seqno)
> > > > > >          * officially process the CT message like if racing
> > > > > > against
> > > > > >          * process_g2h_msg().
> > > > > >          */
> > > > > > -       spin_lock_irqsave(&gt->tlb_inval.pending_lock,
> > > > > > flags);
> > > > > > -       if (tlb_inval_seqno_past(gt, seqno)) {
> > > > > > -               spin_unlock_irqrestore(&gt-
> > > > > > > tlb_inval.pending_lock, flags);
> > > > > > +       spin_lock_irqsave(&tlb_inval->pending_lock, flags);
> > > > > > +       if (xe_tlb_inval_seqno_past(tlb_inval, seqno)) {
> > > > > > +               spin_unlock_irqrestore(&tlb_inval-
> > > > > > >pending_lock,
> > > > > > flags);
> > > > > >                 return;
> > > > > >         }
> > > > > >  
> > > > > > -       WRITE_ONCE(gt->tlb_inval.seqno_recv, seqno);
> > > > > > +       WRITE_ONCE(tlb_inval->seqno_recv, seqno);
> > > > > >  
> > > > > >         list_for_each_entry_safe(fence, next,
> > > > > > -                                &gt-
> > > > > > >tlb_inval.pending_fences,
> > > > > > link) {
> > > > > > +                                &tlb_inval->pending_fences,
> > > > > > link) {
> > > > > >                 trace_xe_tlb_inval_fence_recv(xe, fence);
> > > > > >  
> > > > > > -               if (!tlb_inval_seqno_past(gt, fence->seqno))
> > > > > > +               if (!xe_tlb_inval_seqno_past(tlb_inval,
> > > > > > fence-
> > > > > > > seqno))
> > > > > >                         break;
> > > > > >  
> > > > > > -               inval_fence_signal(xe, fence);
> > > > > > +               xe_tlb_inval_fence_signal(fence);
> > > > > >         }
> > > > > >  
> > > > > > -       if (!list_empty(&gt->tlb_inval.pending_fences))
> > > > > > +       if (!list_empty(&tlb_inval->pending_fences))
> > > > > >                 mod_delayed_work(system_wq,
> > > > > > -                                &gt->tlb_inval.fence_tdr,
> > > > > > -                                tlb_timeout_jiffies(gt));
> > > > > > +                                &tlb_inval->fence_tdr,
> > > > > > +                                tlb_inval->ops-
> > > > > > > timeout_delay(tlb_inval));
> > > > > >         else
> > > > > > -               cancel_delayed_work(&gt-
> > > > > > >tlb_inval.fence_tdr);
> > > > > > +               cancel_delayed_work(&tlb_inval->fence_tdr);
> > > > > >  
> > > > > > -       spin_unlock_irqrestore(&gt->tlb_inval.pending_lock,
> > > > > > flags);
> > > > > > -}
> > > > > > -
> > > > > > -/**
> > > > > > - * xe_guc_tlb_inval_done_handler - TLB invalidation done
> > > > > > handler
> > > > > > - * @guc: guc
> > > > > > - * @msg: message indicating TLB invalidation done
> > > > > > - * @len: length of message
> > > > > > - *
> > > > > > - * Parse seqno of TLB invalidation, wake any waiters for
> > > > > > seqno,
> > > > > > and signal any
> > > > > > - * invalidation fences for seqno. Algorithm for this depends
> > > > > > on
> > > > > > seqno being
> > > > > > - * received in-order and asserts this assumption.
> > > > > > - *
> > > > > > - * Return: 0 on success, -EPROTO for malformed messages.
> > > > > > - */
> > > > > > -int xe_guc_tlb_inval_done_handler(struct xe_guc *guc, u32
> > > > > > *msg,
> > > > > > u32 len)
> > > > > > -{
> > > > > > -       struct xe_gt *gt = guc_to_gt(guc);
> > > > > > -
> > > > > > -       if (unlikely(len != 1))
> > > > > > -               return -EPROTO;
> > > > > > -
> > > > > > -       xe_tlb_inval_done_handler(gt, msg[0]);
> > > > > > -
> > > > > > -       return 0;
> > > > > > +       spin_unlock_irqrestore(&tlb_inval->pending_lock,
> > > > > > flags);
> > > > > >  }
> > > > > >  
> > > > > >  static const char *
> > > > > > -inval_fence_get_driver_name(struct dma_fence *dma_fence)
> > > > > > +xe_inval_fence_get_driver_name(struct dma_fence *dma_fence)
> > > > > >  {
> > > > > >         return "xe";
> > > > > >  }
> > > > > >  
> > > > > >  static const char *
> > > > > > -inval_fence_get_timeline_name(struct dma_fence *dma_fence)
> > > > > > +xe_inval_fence_get_timeline_name(struct dma_fence
> > > > > > *dma_fence)
> > > > > >  {
> > > > > > -       return "inval_fence";
> > > > > > +       return "tlb_inval_fence";
> > > > > >  }
> > > > > >  
> > > > > >  static const struct dma_fence_ops inval_fence_ops = {
> > > > > > -       .get_driver_name = inval_fence_get_driver_name,
> > > > > > -       .get_timeline_name = inval_fence_get_timeline_name,
> > > > > > +       .get_driver_name = xe_inval_fence_get_driver_name,
> > > > > > +       .get_timeline_name =
> > > > > > xe_inval_fence_get_timeline_name,
> > > > > >  };
> > > > > >  
> > > > > >  /**
> > > > > > - * xe_tlb_inval_fence_init - Initialize TLB invalidation
> > > > > > fence
> > > > > > + * xe_tlb_inval_fence_init() - Initialize TLB invalidation
> > > > > > fence
> > > > > >   * @tlb_inval: TLB invalidation client
> > > > > >   * @fence: TLB invalidation fence to initialize
> > > > > >   * @stack: fence is stack variable
> > > > > > @@ -618,15 +396,12 @@ void xe_tlb_inval_fence_init(struct
> > > > > > xe_tlb_inval *tlb_inval,
> > > > > >                              struct xe_tlb_inval_fence
> > > > > > *fence,
> > > > > >                              bool stack)
> > > > > >  {
> > > > > > -       struct xe_gt *gt = tlb_inval->private;
> > > > > > -
> > > > > > -       xe_pm_runtime_get_noresume(gt_to_xe(gt));
> > > > > > +       xe_pm_runtime_get_noresume(tlb_inval->xe);
> > > > > >  
> > > > > > -       spin_lock_irq(&gt->tlb_inval.lock);
> > > > > > -       dma_fence_init(&fence->base, &inval_fence_ops,
> > > > > > -                      &gt->tlb_inval.lock,
> > > > > > +       spin_lock_irq(&tlb_inval->lock);
> > > > > > +       dma_fence_init(&fence->base, &inval_fence_ops,
> > > > > > &tlb_inval->lock,
> > > > > >                        dma_fence_context_alloc(1), 1);
> > > > > > -       spin_unlock_irq(&gt->tlb_inval.lock);
> > > > > > +       spin_unlock_irq(&tlb_inval->lock);
> > > > > 
> > > > > While here, 'fence_lock' is probably a better name.
> > > > > 
> > > > > Matt
> > > > > 
> > > > > >         INIT_LIST_HEAD(&fence->link);
> > > > > >         if (stack)
> > > > > >                 set_bit(FENCE_STACK_BIT, &fence->base.flags);
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.h
> > > > > > b/drivers/gpu/drm/xe/xe_tlb_inval.h
> > > > > > index 7adee3f8c551..cdeafc8d4391 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_tlb_inval.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_tlb_inval.h
> > > > > > @@ -18,24 +18,30 @@ struct xe_vma;
> > > > > >  int xe_gt_tlb_inval_init_early(struct xe_gt *gt);
> > > > > >  
> > > > > >  void xe_tlb_inval_reset(struct xe_tlb_inval *tlb_inval);
> > > > > > -int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval);
> > > > > > -void xe_tlb_inval_vm(struct xe_tlb_inval *tlb_inval, struct
> > > > > > xe_vm *vm);
> > > > > >  int xe_tlb_inval_all(struct xe_tlb_inval *tlb_inval,
> > > > > >                      struct xe_tlb_inval_fence *fence);
> > > > > > +int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval);
> > > > > > +void xe_tlb_inval_vm(struct xe_tlb_inval *tlb_inval, struct
> > > > > > xe_vm *vm);
> > > > > >  int xe_tlb_inval_range(struct xe_tlb_inval *tlb_inval,
> > > > > >                        struct xe_tlb_inval_fence *fence,
> > > > > >                        u64 start, u64 end, u32 asid);
> > > > > > -int xe_guc_tlb_inval_done_handler(struct xe_guc *guc, u32
> > > > > > *msg,
> > > > > > u32 len);
> > > > > >  
> > > > > >  void xe_tlb_inval_fence_init(struct xe_tlb_inval *tlb_inval,
> > > > > >                              struct xe_tlb_inval_fence
> > > > > > *fence,
> > > > > >                              bool stack);
> > > > > > -void xe_tlb_inval_fence_signal(struct xe_tlb_inval_fence
> > > > > > *fence);
> > > > > >  
> > > > > > +/**
> > > > > > + * xe_tlb_inval_fence_wait() - TLB invalidiation fence wait
> > > > > > + * @fence: TLB invalidation fence to wait on
> > > > > > + *
> > > > > > + * Wait on a TLB invalidiation fence until it signals, non
> > > > > > interruptable
> > > > > > + */
> > > > > >  static inline void
> > > > > >  xe_tlb_inval_fence_wait(struct xe_tlb_inval_fence *fence)
> > > > > >  {
> > > > > >         dma_fence_wait(&fence->base, false);
> > > > > >  }
> > > > > >  
> > > > > > +void xe_tlb_inval_done_handler(struct xe_tlb_inval
> > > > > > *tlb_inval,
> > > > > > int seqno);
> > > > > > +
> > > > > >  #endif /* _XE_TLB_INVAL_ */
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > > > > > b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > > > > > index 05b6adc929bb..c1ad96d24fc8 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > > > > > @@ -9,10 +9,85 @@
> > > > > >  #include <linux/workqueue.h>
> > > > > >  #include <linux/dma-fence.h>
> > > > > >  
> > > > > > -/** struct xe_tlb_inval - TLB invalidation client */
> > > > > > +struct xe_tlb_inval;
> > > > > > +
> > > > > > +/** struct xe_tlb_inval_ops - TLB invalidation ops (backend)
> > > > > > */
> > > > > > +struct xe_tlb_inval_ops {
> > > > > > +       /**
> > > > > > +        * @all: Invalidate all TLBs
> > > > > > +        * @tlb_inval: TLB invalidation client
> > > > > > +        * @seqno: Seqno of TLB invalidation
> > > > > > +        *
> > > > > > +        * Return 0 on success, -ECANCELED if backend is mid-
> > > > > > reset, error on
> > > > > > +        * failure
> > > > > > +        */
> > > > > > +       int (*all)(struct xe_tlb_inval *tlb_inval, u32
> > > > > > seqno);
> > > > > > +
> > > > > > +       /**
> > > > > > +        * @ggtt: Invalidate global translation TLBs
> > > > > > +        * @tlb_inval: TLB invalidation client
> > > > > > +        * @seqno: Seqno of TLB invalidation
> > > > > > +        *
> > > > > > +        * Return 0 on success, -ECANCELED if backend is mid-
> > > > > > reset, error on
> > > > > > +        * failure
> > > > > > +        */
> > > > > > +       int (*ggtt)(struct xe_tlb_inval *tlb_inval, u32
> > > > > > seqno);
> > > > > > +
> > > > > > +       /**
> > > > > > +        * @ppttt: Invalidate per-process translation TLBs
> > > > > > +        * @tlb_inval: TLB invalidation client
> > > > > > +        * @seqno: Seqno of TLB invalidation
> > > > > > +        * @start: Start address
> > > > > > +        * @end: End address
> > > > > > +        * @asid: Address space ID
> > > > > > +        *
> > > > > > +        * Return 0 on success, -ECANCELED if backend is mid-
> > > > > > reset, error on
> > > > > > +        * failure
> > > > > > +        */
> > > > > > +       int (*ppgtt)(struct xe_tlb_inval *tlb_inval, u32
> > > > > > seqno,
> > > > > > u64 start,
> > > > > > +                    u64 end, u32 asid);
> > > > > > +
> > > > > > +       /**
> > > > > > +        * @initialized: Backend is initialized
> > > > > > +        * @tlb_inval: TLB invalidation client
> > > > > > +        *
> > > > > > +        * Return: True if back is initialized, False
> > > > > > otherwise
> > > > > > +        */
> > > > > > +       bool (*initialized)(struct xe_tlb_inval *tlb_inval);
> > > > > > +
> > > > > > +       /**
> > > > > > +        * @flush: Flush pending TLB invalidations
> > > > > > +        * @tlb_inval: TLB invalidation client
> > > > > > +        */
> > > > > > +       void (*flush)(struct xe_tlb_inval *tlb_inval);
> > > > > > +
> > > > > > +       /**
> > > > > > +        * @timeout_delay: Timeout delay for TLB invalidation
> > > > > > +        * @tlb_inval: TLB invalidation client
> > > > > > +        *
> > > > > > +        * Return: Timeout delay for TLB invalidation in
> > > > > > jiffies
> > > > > > +        */
> > > > > > +       long (*timeout_delay)(struct xe_tlb_inval
> > > > > > *tlb_inval);
> > > > > > +
> > > > > > +       /**
> > > > > > +        * @lock: Lock resources protecting the backend seqno
> > > > > > management
> > > > > > +        */
> > > > > > +       void (*lock)(struct xe_tlb_inval *tlb_inval);
> > > > > > +
> > > > > > +       /**
> > > > > > +        * @unlock: Lock resources protecting the backend
> > > > > > seqno
> > > > > > management
> > > > > > +        */
> > > > > > +       void (*unlock)(struct xe_tlb_inval *tlb_inval);
> > > > > > +};
> > > > > > +
> > > > > > +/** struct xe_tlb_inval - TLB invalidation client (frontend)
> > > > > > */
> > > > > >  struct xe_tlb_inval {
> > > > > >         /** @private: Backend private pointer */
> > > > > >         void *private;
> > > > > > +       /** @xe: Pointer to Xe device */
> > > > > > +       struct xe_device *xe;
> > > > > > +       /** @ops: TLB invalidation ops */
> > > > > > +       const struct xe_tlb_inval_ops *ops;
> > > > > >         /** @tlb_inval.seqno: TLB invalidation seqno,
> > > > > > protected
> > > > > > by CT lock */
> > > > > >  #define TLB_INVALIDATION_SEQNO_MAX     0x100000
> > > > > >         int seqno;
> > > > > > -- 
> > > > > > 2.34.1
> > > > > > 
> > > 
> 
