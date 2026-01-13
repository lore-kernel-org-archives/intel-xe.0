Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC1CD30CEE
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 22:21:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A2910E55C;
	Tue, 13 Jan 2026 22:21:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YQoSzvdU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7AB10E55C
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 22:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768342876; x=1799878876;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=g7ZNLj54QeWqFfBPVCV9EM/XoKxRcMz/uq44VN5eVs8=;
 b=YQoSzvdURwlPJpduuoTHUR/1RtTA2TOmGDFd81H+XcE8FIvYaA6LkRFx
 k258LSqLpb3b5kH3cv7CgPGgO4vtE0BxMBQN9Cft0AS5vGnY3yo8yp/kw
 wrOnznA/LoqBtqHUFOAsg3Mro+75vTV9ZdTkE4tzhkb7NK4rWDVb3/jko
 O9e9EfDa43EtSr7oTJdUVoy7E5mkdPjvpFQjNAHU6wCN0jdHwBND8ci3T
 UZh2jUKr+bPS6YBg4wL9VH1LTmNZIdSmXzWfysQOMoU566AeqYjHfMmSs
 xJmxX13Ry4MuSqnc9haN7NhhHgt//T4Vt5+x6B8kYDFIQPyKWwQil+t+E A==;
X-CSE-ConnectionGUID: oF9lcDVGSjGfu2/H6o2Dig==
X-CSE-MsgGUID: AkKCp+QuSZiRpEM0uZYGCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="81003938"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="81003938"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 14:21:15 -0800
X-CSE-ConnectionGUID: PRN+9+ErTu6XZKa4OOr57Q==
X-CSE-MsgGUID: sADZtSzFTTqKOuZHFzW1bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="208665679"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 14:21:16 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 14:21:14 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 14:21:14 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.9) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 14:21:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cj4xDUnaqPEI83beGENqJsh9SOXlYlk07Kqor/Ol38JX1LwtfQJusansiIeLg1Tdxf84ZCkM7skI5b15nCmktaqgkKHzf0k4qY2ROAMkt8//Jd/mBnyX3lvzZ9Gi3mLVANA3A5VS5acnTxOyrmLb7gA6/LI58Eux3zXg4sZ1M7xjuG43UGXDzJ8cXkJWiVdRPzT4jtfjExzGiMikdY2d68/BUmNk28VbuRTl49Q+Yeua+JBNohjWC24ML6+uTjSrlLMSRl3kI7lcs83NdJ//GDmiNeYTHJpNzdldrr/JXcr+cqvvck3e5+QNybC2bRZiSEoNgd7jOiXdoEytTdDhfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g7ZNLj54QeWqFfBPVCV9EM/XoKxRcMz/uq44VN5eVs8=;
 b=HiUweQ+aRs3vDmW5/4vNfyjyovzUHymF0+tqSnAagj9dLTF8xmB2hL5ub1vPBFt5xb1t2q7JerprJgWBM3XmT+fayc76uZ7LjiBZQsH02snvApDudT1/49kv/BOSlViq9HU6Qac64pcsN99d6hU8qYji0pZgBCVGRHedhcHYvzZlgq1YrJcMQBalP6fJZsq8B427sQXGCNZtnSQCkgjogm3E8EMWOAAiUbtyP9W5VEPR/F0D0xTT6jkSTmgcXF44hyDE4RFAxOb1j0BvjG58s7eKrm88ez1I/XZSvFtPpMIUnGp3NqfTuHdPBzYBKd6fiEsseLfPztjv69cbOQEHVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 22:21:09 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9520.005; Tue, 13 Jan 2026
 22:21:09 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 10/12] drm/xe: Add exec queue active vfunc
Thread-Topic: [PATCH v4 10/12] drm/xe: Add exec queue active vfunc
Thread-Index: AQHchDe0SuBnIDUK9U+ntLOGaNjbl7VQn+0AgAAMMQCAAAFEAA==
Date: Tue, 13 Jan 2026 22:21:09 +0000
Message-ID: <a3868286e8d300a50af06209feb313646440d446.camel@intel.com>
References: <20260113025232.3504648-1-matthew.brost@intel.com>
 <20260113025232.3504648-11-matthew.brost@intel.com>
 <ea9d5cbec2dfd68f0cc2f54834b28055ca29ab92.camel@intel.com>
 <aWbEQt0B/7CRgfzA@lstrano-desk.jf.intel.com>
In-Reply-To: <aWbEQt0B/7CRgfzA@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH7PR11MB6006:EE_
x-ms-office365-filtering-correlation-id: dbe8982f-9fc5-4ac1-fd6e-08de52f20d53
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?bmlaR0pJOWpwUnN1MjdKY05PR1I2ajdBWkhXaVJKSnNPUndqR01OOGs0Yjky?=
 =?utf-8?B?VWN4REsrVHV5OGlZbllYWVkzOFU2aURpNTc5WFkzR1dQem9lNUNYQXlUMnha?=
 =?utf-8?B?cFBSQTJRZHM2VW5VVFlEaFR0cTcrR3EvdlpQMHZNazlXVXNJcm5kVFYySjNS?=
 =?utf-8?B?YTU3cjltdVZ5L1dGRGRMWlZ4dEthcVB1ZFRTWk04SE13dHEzdUNQeWExWlBI?=
 =?utf-8?B?cnFpV1NXWW90Mk5DcFRIV1lhRm9YOElvbDlsYXc1VEpMNmM3cWlTQ1d2SmlN?=
 =?utf-8?B?VE9iTG05bEErd212M1pSR0NFWEhjc09kRzU3M3NmZm41UzQ1WTBqSkFqYXN5?=
 =?utf-8?B?a0NKTzNHcnh6MU1DUktRaFlJWSsvdWVmbnA2MXNyY0Frb2VZWjROVi9iY202?=
 =?utf-8?B?SEVjeWhKV2Q0MWloMEZOUGxDa0I3b0NqeUJRb3YxclJQcVUzaVMybnYzeFg2?=
 =?utf-8?B?bC8rQlZsMkFQM1Y4U083OHlOZ1lMVVJmMFdveldqWUtsdjVXQVBGVUt6Wnpn?=
 =?utf-8?B?OTZ0RnZTMXdRVnJTS0Fndk94dmdPbEN2OCtCRFJHalRBODR6OXBoWnUwbUl5?=
 =?utf-8?B?M1hDdmNkeU9CL1l3NVdXei9SVlJvSTl6L3lCWElqazRNL0VnbHBRdS9UanIv?=
 =?utf-8?B?VDhiUThPcU1jVkltYkYrSWpORE1uU05laHRlRDNjZXFpNCtMaUQ2RS9CemtT?=
 =?utf-8?B?aGpMUlFidmFPVGtybnBPZjZTRkw3OURaWHhRVUxQTzhrRzBlWEdKRENkKzRq?=
 =?utf-8?B?YS9HM2V4YytaREZIdm1TWTlMWmwyNElLdEFIdWtHekZLcW5TN1RFTmdrOUl6?=
 =?utf-8?B?V1RlQkNQY1dZb0czQitLdmZXVnplaTAwSzluUmlXMHFVcXA5azJRbGFyUnpr?=
 =?utf-8?B?b2NUK1JSeXZBd3g4SkFzVmNFeWt1K1NSakx1R0U4eVFwTFNIMDFMTzRTZFN3?=
 =?utf-8?B?dDMrbVRzT3p0elNVZjl3WGFrT2pLblJ6WnBrZTVKb3JXNnNPNWdodFBKMGNz?=
 =?utf-8?B?MU9HcmxtUWFLWVJjQlBPRHFSWFlDS1FJbnVSS3Q2eFdZMVlvSFJOU1hqa0gz?=
 =?utf-8?B?b0NSM05mdElyS2NMSlEzYk90MDZ0ZTZFeEZDdDJ4dTFteGMwd0cwMWFWSkNS?=
 =?utf-8?B?dmJIK0ltVEN4aXZXZkF6OTlITlNBUHlzM25mK1dHamp0dnkvS0Vrb3lLSEtl?=
 =?utf-8?B?ZlZhM2crdVB2VUtPNE04V3BHL01IdzdGTVU0dXNkdzVLVDVVZk1kTCtyVnp6?=
 =?utf-8?B?RkFkZGM4L3BVc3ByV3pVOHV1ZjQxcENCZXF5SjR4L0JkcFo3TVZQaXlNeDVT?=
 =?utf-8?B?V2J5c1FnQWxjekJmNWtZejd4dGxFRnRpMlp2VGFXdW1EVFdLOWVUZFFaWjg0?=
 =?utf-8?B?blA4aUxVRFZCajQwOU9sVmRMZkNpSTFVV3BTUzcrU0sra25wYkl5QXZGUlJR?=
 =?utf-8?B?YUszMkQ3NGc2RThkejdzTm9NbmJ0QWFHdGhQYUliYXFzN3AvcUozUnRxWm44?=
 =?utf-8?B?SVVKOHNzeGpJT210Z1NpRnBCbWJ3bDdSbnlLSUZNd1ZhU2tXQ25ScGhNcWgr?=
 =?utf-8?B?MFpJWlVKSUY1STVJaHdBLzVVdTZVemxHMmI2WnVOVWNuS1MzUEJPcGMza3pK?=
 =?utf-8?B?N1l5RXBod0JFa1JyQ08vZjk1UXlDSnF4YTEvYlJPTVdqalFiOEY1ZGVCWHEw?=
 =?utf-8?B?MlBIUXNKRWpUbm16NWhjYTlJUjM0MHZYdy9XOStrSG1HVXZTRys4enFkQlgz?=
 =?utf-8?B?ekwweitrSXJ3Z1IrWmc3ek8rWkZmeGYzdkdCVFJNMDhscTRFam5GeTJqUlJj?=
 =?utf-8?B?WnJJVXM3Q0plZi9hRUxGSW90TG1NcXNqOXlReGJNNzJ0dmFCUXJmZHNnd3Zw?=
 =?utf-8?B?Y1huaFc1MXZyK3R1Rm1WNlJRRCtFaytRTTIrZ3N6b2QwLzhTdkhaOFhpUlU3?=
 =?utf-8?B?QnpvNEpIa2U2MUQ1d3JBSGRqRWduMFRSTEF3b1dleFBxSW9qa1lHWGx2RXNS?=
 =?utf-8?B?bjFlWmNUQnZncUQ3Y2VoWHZxQzBSeVJ2NEZzS29icHloYlVkMzlUb3JsK0pB?=
 =?utf-8?Q?CUzLWi?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SmVXdTZNbTZxQ3c3WVZJL1oyN3JqSUs0THE0QmlwbmdNWGF6UlNjVVUzU1d2?=
 =?utf-8?B?M0FFWmEvUy9Pa0I3V29XRU1lQUI1RTZQeURYV3pINXdBcEc1MjlHSGJ2YndT?=
 =?utf-8?B?M21CTVBmVXdsVS9HVG9sMThmVGJ1eENJbXZIZko4QU9LRDl2YnZLVEE3a1Yx?=
 =?utf-8?B?M3pjeXhGWGFibTdsOXphTE9TSldtWmhwYVdxUGRKOU9rRmlCZk5lSis4cWp4?=
 =?utf-8?B?WkdCRndCWjBTU2dmaEFheGtYaXJ5UGxIRDBpZUVHaFVXY0pqemI3dXpDQ244?=
 =?utf-8?B?Wk1uUEl6RUdHL05ZUStoVGxwK29ZRnBLRERjcDRDTjVMc2g4S0xybkg3cVFS?=
 =?utf-8?B?WlVoVjIzTEpPOHdBSlN5VURVZXJiUVk4T3B5WnovVzdBNHpiNjg3eUtzRU5T?=
 =?utf-8?B?QkVOQ2FDZGlsQlBxOVcwR0h5NXVzdnF2UWpIU0RZekZ6TjF5VzhaN3dldGdH?=
 =?utf-8?B?MTViVW5DYUs3QWl2eDc0eFBqcksxVlByeUxsd3F2Ym4xbkJCNGxDcUVHaVZK?=
 =?utf-8?B?aU5SbE5aWXJhQU90UjdRNXMwNG5yd25GdWJ2bTAyNmNBcTVVMFlqM3NoYnpX?=
 =?utf-8?B?bFRKYU5NbjdXczQ3MTJrMjV1RkpOMk9LOXY3Y29HUy9uOGVzSzdtN0haeTFK?=
 =?utf-8?B?NXdOTFhxNEJpdFhLNzhTU0xYQnVrZXJkcURPZEVsYnFYZjBDZHl0aTN4RXl2?=
 =?utf-8?B?dnEyTFNobkV4K210TURHOVlWK2xrKzVRVFRTVnBlTG5Nc2hhQUhVWXk4OEpx?=
 =?utf-8?B?MVQ5dDNyU2Z0blJZa1R5Mm5IdU9ITXVxZzJSU0Vrc0dMTE1FWitwR2F1L3Y5?=
 =?utf-8?B?ZTIxR0ZjQ2JEcDE1THZNUFY0UTBvNXlFS3lWY2VEbzNEenNHZ1pGdjB2WURR?=
 =?utf-8?B?VkZKdTh1TzlFTms3dkZpOW91YVM1aGV1Z0dnMUp4c2ROenE0cm1COTlETVZn?=
 =?utf-8?B?OWJmUVJPTkVYSHRlbDNzNW5pd3B1QjN1M09UeUtyUzMrLzhqUVpaNTc1QWs1?=
 =?utf-8?B?VFdIREtGQittNzRwSVhEb3IydHptTGZFQlNFQlcrN2JQdjgvbWkxN3A4eEZs?=
 =?utf-8?B?ZUI3M2ZYTWpVZldKSnFXYWthTGh2TnM2bFcyOGZYTVAxUkdtVlBOOFB1Zzhj?=
 =?utf-8?B?QzVhZ2hWT20wVDhhRVJ1L2t5dDJJeEc3L0R3ckFnNkk4K2hNY3gyK0FQQURa?=
 =?utf-8?B?NXVIVnc5VkNsMWZrZy9tTEV4NkliZHlGS2ZVNS9wbnlGd0xvMUYrT012enZk?=
 =?utf-8?B?UW1mVS9ZRExoSlljYVV4bklaaktVVG5NemhFU25MU3FlNG5YTmJ2M29vQi9F?=
 =?utf-8?B?TGF2aFRoeW5jSEdWWUhlZnhjRjdTaFhPS0VLZ05UWXlZLy9nMEZ2NVUwNDZk?=
 =?utf-8?B?WGFGVkNCTi9FL1lvN3Nxd1pRTHRqZlYrVWMxRFJQZzRpaFNTelNzL0x6YktC?=
 =?utf-8?B?aVU2eTZKOHdmc0FPTlZCVzRZWm9XTnFxNHdhZTJ5SlZnRmVIKytUREsydWJv?=
 =?utf-8?B?R3huVGVhMmxZbXlUdHA2OEx1SWc3TEJWd2FNUXBFbkl0MlRPRDkrVjR5K0tq?=
 =?utf-8?B?aWZ6N3pUOWs2QWxiTjdIak11ME45eFhqdm1Ga3dJYlVmL1U4dUtveFljdVpO?=
 =?utf-8?B?TERlMUU4ZmJnK2VwYzl5Vmh1UERCd1JsNjVRWWtVV2c3SUZHTm1zV2FEalhM?=
 =?utf-8?B?dGJYcDRJNnZya2tGa05BMFZrOVdWNHNld3RKNGthTEJXd1Z3QzFTbkIrTDNo?=
 =?utf-8?B?KytvMzhySGdCMUlWR1B1UUxUU1MvUVVyUmxVZnE0Y3lZakJwK0EzVTZ4a21U?=
 =?utf-8?B?WGk0cW5tcXNuQ1BlSmNmRmxBeDExOERQQzZqbUxrb1IzWm0yMWV0ZTdYWWtn?=
 =?utf-8?B?RFJVUThIaVN4WXVZRm1UTll1eXEzc0YwUVh1cnVYNWVSdFEwVFF4MmRsdlg0?=
 =?utf-8?B?QzZtUytYcHZ2dEtnTnlXUThQcmZyR25pMjlWQjduelFlUEtQazRPM3pXdWQ3?=
 =?utf-8?B?NjdMOUpxU1FuTU83cmRUN2lnRTVLVmdnY0FNaVRVbjdwKzBmekEydTgwbnFX?=
 =?utf-8?B?MzdIN1FGcWg3cXpEQmZWZWhBa2Z0Y242YytrQ2IzNGw4RHhpaFBDL29XWmpa?=
 =?utf-8?B?ZERnY2NSZjlnVjF6d2NjRnBrQm9xRG5aMDl6WHd1YWozVEJqNVZLSnJwYkF2?=
 =?utf-8?B?ajhWbDcxVHNYSU80aFhrcHA1NHlMS0FlaWpTWldma0VsWlRzMGdyQUFuYlB2?=
 =?utf-8?B?Zi9lQnJhWUdibXZOTmFBVXpTY3YvV3d4eEpwckMwZHgwMmszVmVFTjMvR3hO?=
 =?utf-8?B?V0lVUFc5VWpjcy9CaVMrNDhFekR6dC80eTFNM1B0YXRWRkVBd21MY3J0Y0I3?=
 =?utf-8?Q?mNSKxpeId9FjS1p0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ACF5C5160C3FD042B803FF997602A59C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbe8982f-9fc5-4ac1-fd6e-08de52f20d53
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 22:21:09.1976 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 94wcG193R6snsp0yC/chie7NruMiXAxqET0ANWOH9EzOLS3cybIncADNrOu63Ynu0ohLnOposUQRQJGckhYLbR1GXyt7CRMK/pBVxupVB9I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6006
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

T24gVHVlLCAyMDI2LTAxLTEzIGF0IDE0OjE2IC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBUdWUsIEphbiAxMywgMjAyNiBhdCAwMjozMjo1OFBNIC0wNzAwLCBTdW1tZXJzLCBTdHVh
cnQgd3JvdGU6DQo+ID4gT24gTW9uLCAyMDI2LTAxLTEyIGF0IDE4OjUyIC0wODAwLCBNYXR0aGV3
IEJyb3N0IHdyb3RlOg0KPiA+ID4gSWYgYW4gZXhlYyBxdWV1ZSBpcyBpbmFjdGl2ZSAoZS5nLiwg
bm90IHJlZ2lzdGVyZWQgb3Igc2NoZWR1bGluZw0KPiA+ID4gaXMNCj4gPiA+IGRpc2FibGVkKSwg
VExCIGludmFsaWRhdGlvbnMgYXJlIG5vdCBpc3N1ZWQgZm9yIHRoYXQgcXVldWUuIEFkZCBhDQo+
ID4gPiB2aXJ0dWFsIGZ1bmN0aW9uIHRvIGRldGVybWluZSB0aGUgYWN0aXZlIHN0YXRlLCB3aGlj
aCBUTEINCj4gPiA+IGludmFsaWRhdGlvbg0KPiA+ID4gbG9naWMgY2FuIGhvb2sgaW50by4NCj4g
PiA+IA0KPiA+ID4gU2lnbmVkLW9mZi1ieTogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBp
bnRlbC5jb20+DQo+ID4gPiAtLS0NCj4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNf
cXVldWVfdHlwZXMuaCB8IDIgKysNCj4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNs
aXN0LmPCoMKgwqDCoMKgwqDCoMKgIHwgNyArKysrKysrDQo+ID4gPiDCoGRyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndWNfc3VibWl0LmPCoMKgwqDCoMKgwqAgfCA2ICsrKysrKw0KPiA+ID4gwqAzIGZp
bGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKykNCj4gPiA+IA0KPiA+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjX3F1ZXVlX3R5cGVzLmgNCj4gPiA+IGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2V4ZWNfcXVldWVfdHlwZXMuaA0KPiA+ID4gaW5kZXggZDNlMjc4OWNm
NWJjLi45Y2NhNTU4YzU4MDkgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZXhlY19xdWV1ZV90eXBlcy5oDQo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
ZXhlY19xdWV1ZV90eXBlcy5oDQo+ID4gPiBAQCAtMjk4LDYgKzI5OCw4IEBAIHN0cnVjdCB4ZV9l
eGVjX3F1ZXVlX29wcyB7DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgdm9pZCAoKnJlc3VtZSkoc3Ry
dWN0IHhlX2V4ZWNfcXVldWUgKnEpOw0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoC8qKiBAcmVzZXRf
c3RhdHVzOiBjaGVjayBleGVjIHF1ZXVlIHJlc2V0IHN0YXR1cyAqLw0KPiA+ID4gwqDCoMKgwqDC
oMKgwqDCoGJvb2wgKCpyZXNldF9zdGF0dXMpKHN0cnVjdCB4ZV9leGVjX3F1ZXVlICpxKTsNCj4g
PiA+ICvCoMKgwqDCoMKgwqDCoC8qKiBAYWN0aXZlOiBjaGVjayBleGVjIHF1ZXVlIGlzIGFjdGl2
ZSAqLw0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgYm9vbCAoKmFjdGl2ZSkoc3RydWN0IHhlX2V4ZWNf
cXVldWUgKnEpOw0KPiA+ID4gwqB9Ow0KPiA+ID4gwqANCj4gPiA+IMKgI2VuZGlmDQo+ID4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNsaXN0LmMNCj4gPiA+IGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNsaXN0LmMNCj4gPiA+IGluZGV4IDQ2YzE3YTE4YTNmNC4u
ZTRhMjY3NGY0OGM3IDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4
ZWNsaXN0LmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjbGlzdC5jDQo+
ID4gPiBAQCAtNDY5LDYgKzQ2OSwxMiBAQCBzdGF0aWMgYm9vbA0KPiA+ID4gZXhlY2xpc3RfZXhl
Y19xdWV1ZV9yZXNldF9zdGF0dXMoc3RydWN0IHhlX2V4ZWNfcXVldWUgKnEpDQo+ID4gPiDCoMKg
wqDCoMKgwqDCoMKgcmV0dXJuIGZhbHNlOw0KPiA+ID4gwqB9DQo+ID4gPiDCoA0KPiA+ID4gK3N0
YXRpYyBib29sIGV4ZWNsaXN0X2V4ZWNfcXVldWVfYWN0aXZlKHN0cnVjdCB4ZV9leGVjX3F1ZXVl
ICpxKQ0KPiA+ID4gK3sNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoC8qIE5JWSAqLw0KPiA+ID4gK8Kg
wqDCoMKgwqDCoMKgcmV0dXJuIGZhbHNlOw0KPiA+ID4gK30NCj4gPiA+ICsNCj4gPiA+IMKgc3Rh
dGljIGNvbnN0IHN0cnVjdCB4ZV9leGVjX3F1ZXVlX29wcyBleGVjbGlzdF9leGVjX3F1ZXVlX29w
cyA9DQo+ID4gPiB7DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgLmluaXQgPSBleGVjbGlzdF9leGVj
X3F1ZXVlX2luaXQsDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgLmtpbGwgPSBleGVjbGlzdF9leGVj
X3F1ZXVlX2tpbGwsDQo+ID4gPiBAQCAtNDgxLDYgKzQ4Nyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgeGVfZXhlY19xdWV1ZV9vcHMNCj4gPiA+IGV4ZWNsaXN0X2V4ZWNfcXVldWVfb3BzID0gew0K
PiA+ID4gwqDCoMKgwqDCoMKgwqDCoC5zdXNwZW5kX3dhaXQgPSBleGVjbGlzdF9leGVjX3F1ZXVl
X3N1c3BlbmRfd2FpdCwNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqAucmVzdW1lID0gZXhlY2xpc3Rf
ZXhlY19xdWV1ZV9yZXN1bWUsDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgLnJlc2V0X3N0YXR1cyA9
IGV4ZWNsaXN0X2V4ZWNfcXVldWVfcmVzZXRfc3RhdHVzLA0KPiA+ID4gK8KgwqDCoMKgwqDCoMKg
LmFjdGl2ZSA9IGV4ZWNsaXN0X2V4ZWNfcXVldWVfYWN0aXZlLA0KPiA+ID4gwqB9Ow0KPiA+ID4g
wqANCj4gPiA+IMKgaW50IHhlX2V4ZWNsaXN0X2luaXQoc3RydWN0IHhlX2d0ICpndCkNCj4gPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+ID4gPiBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMNCj4gPiA+IGluZGV4IGJlOGZhNzZi
YWYxZC4uMTkyODJlNWNhODk3IDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2d1Y19zdWJtaXQuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19z
dWJtaXQuYw0KPiA+ID4gQEAgLTIyMDMsNiArMjIwMywxMSBAQCBzdGF0aWMgYm9vbA0KPiA+ID4g
Z3VjX2V4ZWNfcXVldWVfcmVzZXRfc3RhdHVzKHN0cnVjdA0KPiA+ID4geGVfZXhlY19xdWV1ZSAq
cSkNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gZXhlY19xdWV1ZV9yZXNldChxKSB8fA0K
PiA+ID4gZXhlY19xdWV1ZV9raWxsZWRfb3JfYmFubmVkX29yX3dlZGdlZChxKTsNCj4gPiA+IMKg
fQ0KPiA+ID4gwqANCj4gPiA+ICtzdGF0aWMgYm9vbCBndWNfZXhlY19xdWV1ZV9hY3RpdmUoc3Ry
dWN0IHhlX2V4ZWNfcXVldWUgKnEpDQo+ID4gPiArew0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgcmV0
dXJuIGV4ZWNfcXVldWVfZW5hYmxlZChxKSAmJg0KPiA+ID4gIWV4ZWNfcXVldWVfcGVuZGluZ19k
aXNhYmxlKHEpOw0KPiA+IA0KPiA+IFNvIEkgdGhpbmsgdGhlIHJlcXVpcmVtZW50IGhlcmUgaXMg
IWV4ZWNfcXVldWVfcGVuZGluZ19kaXNhYmxlICYmDQo+ID4gIWV4ZWNfcXVldWVfZGVzdHJveWVk
IHJhdGhlciB0aGFuIGV4ZWNfcXVldWVfZW5hYmxlZC4uLiBCdXQgaWYgdGhlDQo+IA0KPiBJZiBk
ZXN0cm95ZWQgaXMgc2V0LCB0aGUgcmVmY291bnRpbmcgZXhjaGFuZ2UgaW4gdGhlIGZvbGxvd2lu
ZyBwYXRjaA0KPiB3aWxsIGZhaWwsIHNvIGV4ZWNfcXVldWVfZGVzdHJveWVkIGNoZWNrIGhlcmUg
aXNuJ3QgbmVlZGVkLg0KDQpPay4gU3RpbGwgbG9va2luZyBvdmVyIHRoYXQgb3RoZXIgY29tbWVu
dCBidXQgaXQgbG9va3MgcHJvbWlzaW5nLi4uDQoNCj4gDQo+ID4gY29udGV4dCBpc24ndCBlbmFi
bGVkIChzZXQgcnVubmFibGUgdG8gdHJ1ZSBpbiBHdUMpLCBpdCBtZWFucw0KPiA+IGhhcmR3YXJl
DQo+ID4gc2hvdWxkbid0IGJlIHRvdWNoaW5nIGFueSBvZiB0aGUgYXNzb2NpYXRlZCBtZW1vcnkg
YW55d2F5IGFuZCB3ZQ0KPiA+IHNob3VsZG4ndCBiZSBpc3N1aW5nIGFueSBpbnZhbGlkYXRpb25z
LCBzbyB0aGlzIHN0aWxsIGxvb2tzIG9rIHRvDQo+ID4gbWUuDQo+ID4gSXQgbWVhbnMgd2UnbGwg
YmUgZG9pbmcgZnVsbCBpbnZhbGlkYXRpb25zIGZvciB0aG9zZSBJIHRoaW5rIHRob3VnaA0KPiA+
IHdoaWNoIGNvdWxkIGFkZCBzb21lIHBlcmZvcm1hbmNlIGltcGFjdCBpbiB0aGUgdGltZSBiZXR3
ZWVuDQo+ID4gcmVnaXN0ZXINCj4gPiBhbmQgZW5hYmxlLiBGb3Igbm93IHRob3VnaCBhcyBsb25n
IGFzIHRoaXMgaXMgd29ya2luZyAoc3RpbGwgZG9pbmcNCj4gPiBzb21lDQo+ID4gdGVzdGluZyBv
biBteSBlbmQgYW5kIEkgaGFkIHNvbWUgcXVlc3Rpb25zIGluIGEgbGF0ZXIgcGF0Y2gpLCB3ZQ0K
PiA+IGNhbiBnbw0KPiA+IHdpdGggdGhpcy4NCj4gDQo+IE15IHJlYXNvbmluZyBoZXJlIGlzIHRo
YXQgdGhlIGNvbnRleHQgaXMgbm90IGVuYWJsZWQsIHNvIHdlIGRvbuKAmXQNCj4gbmVlZA0KPiB0
byBpc3N1ZSBhbiBpbnZhbGlkYXRpb24gYmVjYXVzZSB0aGUgbmV4dCBjb250ZXh0IHN3aXRjaCB0
byB0aGUNCj4gaGFyZHdhcmUNCj4gd2lsbCBpc3N1ZSBvbmXigJR0aGF04oCZcyB0aGUgY3VycmVu
dCBoYXJkd2FyZSBiZWhhdmlvci4gSWYgdGhhdCBjaGFuZ2VzLA0KPiB0aGlzIGNvdWxkIHNpbXBs
eSBiZWNvbWUgYW4gZXhlY19xdWV1ZV9yZWdpc3RlcmVkIGNoZWNrLiBJIGZvcmdldCBpZg0KPiB0
aGlzIGlzIGNoYW5naW5nIGluIGZ1dHVyZSBoYXJkd2FyZS4NCg0KT2suLi4geWVhaCBJIGd1ZXNz
IHdlIGNhbiBhZGRyZXNzIHRoaXMgaWYgaXQgY29tZXMgdXAuIEkgd2FzIG1vcmUNCndvcnJpZWQg
YWJvdXQgdGhpcyBmYWxsaW5nIGJhY2sgdG8gdGhlIGZ1bGwgaW52YWxpZGF0aW9uIGlmIHRoZSBs
aXN0DQp3YXMgZW1wdHkgaGVyZS4NCg0KPiANCj4gSSBhbHNvIG5vdGljZWQgSSBoYXZlIGEgbXVs
dGktcXVldWUgYnVnIGhlcmUgdG9vLiBUaGlzIG5lZWRzIHRvIGNoZWNrDQo+IHRoZSBwcmltYXJ5
IHF1ZXVl4oCZcyBzdGF0ZSBmb3IgbXVsdGktcXVldWUuDQoNCkFoIHRydWUsIGdvb2QgY2F0Y2gu
Li4NCg0KVGhhbmtzLA0KU3R1YXJ0DQoNCj4gDQo+IE1hdHQNCj4gDQo+ID4gDQo+ID4gVGhhbmtz
LA0KPiA+IFN0dWFydA0KPiA+IA0KPiA+ID4gK30NCj4gPiA+ICsNCj4gPiA+IMKgLyoNCj4gPiA+
IMKgICogQWxsIG9mIHRoZXNlIGZ1bmN0aW9ucyBhcmUgYW4gYWJzdHJhY3Rpb24gbGF5ZXIgd2hp
Y2ggb3RoZXINCj4gPiA+IHBhcnRzDQo+ID4gPiBvZiBYZSBjYW4NCj4gPiA+IMKgICogdXNlIHRv
IHRyYXAgaW50byB0aGUgR3VDIGJhY2tlbmQuIEFsbCBvZiB0aGVzZSBmdW5jdGlvbnMsDQo+ID4g
PiBhc2lkZQ0KPiA+ID4gZnJvbSBpbml0LA0KPiA+ID4gQEAgLTIyMjIsNiArMjIyNyw3IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgeGVfZXhlY19xdWV1ZV9vcHMNCj4gPiA+IGd1Y19leGVjX3F1ZXVl
X29wcyA9IHsNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqAuc3VzcGVuZF93YWl0ID0gZ3VjX2V4ZWNf
cXVldWVfc3VzcGVuZF93YWl0LA0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoC5yZXN1bWUgPSBndWNf
ZXhlY19xdWV1ZV9yZXN1bWUsDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgLnJlc2V0X3N0YXR1cyA9
IGd1Y19leGVjX3F1ZXVlX3Jlc2V0X3N0YXR1cywNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoC5hY3Rp
dmUgPSBndWNfZXhlY19xdWV1ZV9hY3RpdmUsDQo+ID4gPiDCoH07DQo+ID4gPiDCoA0KPiA+ID4g
wqBzdGF0aWMgdm9pZCBndWNfZXhlY19xdWV1ZV9zdG9wKHN0cnVjdCB4ZV9ndWMgKmd1Yywgc3Ry
dWN0DQo+ID4gPiB4ZV9leGVjX3F1ZXVlICpxKQ0KPiA+IA0KDQo=
