Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED30CCF9C5B
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 17:03:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82CE310E78C;
	Thu, 20 Nov 2025 17:03:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jhkCcD6i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A8910E78C
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Nov 2025 17:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763658235; x=1795194235;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iDEQorb0ZLjlm6TiOllBjQegtSvmsTK6H1nlo5aVo5Y=;
 b=jhkCcD6i6PdT6qscyfqBBAT+2OtR7g9yPLFrb4My6sbKPoPw2BJIKwWk
 615x1hEyamMN1tNm7B2L5z7tIOX/v8Hrw0MYJQOXqLclRpWDJNeriOB3X
 zu5ZvntahwQalIpYrEHyE0AJHjrPL4sMbN9UCbJWYFdN5cR00+LfgcorS
 ZmSyMyFPQCatoVTO6YWTduKzfUl0WM1Q75SWDS1ax73DL3iep2G43aIUE
 5aeGI7cnjYkG+9uyxfXwq4a3/1eqbe5AtO3h1/E2xX1m6j0DPEXXFinYb
 VH39BQTERw4FrGJISU64ihN/2DTC9xmLa9nCUh2hj0niwy4TE2jmcXSDg g==;
X-CSE-ConnectionGUID: WzdEpyXNTRi1q0v7aB5B8w==
X-CSE-MsgGUID: 6gxp/x6FS2eyZH8JBk+U7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="83126118"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="83126118"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 09:03:54 -0800
X-CSE-ConnectionGUID: yegryX5lSuO97MTqPKJnOQ==
X-CSE-MsgGUID: gxIiRGjzQnWHMXHVVJUgvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="191441974"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 09:03:54 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 09:03:53 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 09:03:53 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.25) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 09:03:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d45LsAz5UBxTBkGy9VNZTJJ+PdYAC9RcU5b8BWoPraCUELwipr35+ZrlSlJUDiNebgtEC8SuHpp1nmU8ZvnR0DPlZaO7TFrRrF1eSJK0BXFLcgskL7fa24bx1pWGj49oLdGfXlbzzjPSnbFl6DjywqimeSLNfsuatcdSxCCff9JCa6bPmAtxB1N9N78YN63WIbv8lOspflrnhEztee3oyMOyMe7hh3Fz392Q4WSIeJ6P3Tpdyfo1AgbZm+u7xBqwUADTSOubkZhEf2k78/ZmpMECPfSnwc5rsWbCVxKwOeqm2hEvdObE4DPI6ChoqNzFQPgmivgt5Ob8AZTOG3i38g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDEQorb0ZLjlm6TiOllBjQegtSvmsTK6H1nlo5aVo5Y=;
 b=YYdq1eApKHvmGxYp0A3AZIykDfxmheGA1waYHMUgz5bjtL71p9fJQbnzuXxHD8LsdpWDbgsMJrd6LTefk2c70vLN3HEGpayiNmuqXRuHZBzvYeoe1+T634JgHtLwgzRaLoAKYFqWSTQ0qveEpLFgT0iIihjz0Lbbg2s9qunTcc8wHIBlrh5szaAI8pZ1EjolkoG9S9x4HcVzrj1GNtZTEmcdcD9DBvcu8KdxCHX89rbOx4TJQCCAmK9mPsky2hsL8pbad+w1wjMnVAl2MtwYrfnQ6S/0JITv0QJZkyaaQ/dZIHFbW/LADZAtclaWD4aeMtT7afe0RfwejRrLY54WYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by BL1PR11MB5304.namprd11.prod.outlook.com (2603:10b6:208:316::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 20 Nov
 2025 17:03:50 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9343.011; Thu, 20 Nov 2025
 17:03:50 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Summers, Stuart" <stuart.summers@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
Subject: RE: [PATCH v3] drm/xe/guc: Fix resource leak in
 xe_guc_ct_init_noalloc()
Thread-Topic: [PATCH v3] drm/xe/guc: Fix resource leak in
 xe_guc_ct_init_noalloc()
Thread-Index: AQHcUnKJogzdsnozQka3u8MGbVKmjrTsUESAgA+I5aA=
Date: Thu, 20 Nov 2025 17:03:50 +0000
Message-ID: <DM4PR11MB545673B45E5F588CE3BCB0C5EAD4A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20251104221613.795865-2-shuicheng.lin@intel.com>
 <20251110184522.1581001-2-shuicheng.lin@intel.com>
 <6psimf6gkwdel5jhp6ldpa2yfmyjsy4o43isyiccgeqmx52gb4@z3h2l7a76g7u>
In-Reply-To: <6psimf6gkwdel5jhp6ldpa2yfmyjsy4o43isyiccgeqmx52gb4@z3h2l7a76g7u>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|BL1PR11MB5304:EE_
x-ms-office365-filtering-correlation-id: e220ad05-920d-4905-be76-08de2856c720
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?dTBieW5LY3lnbEVaeTdMVDVMMzdFT2pTNWpFcGxXZ244UThBRUhwZVB3cDdx?=
 =?utf-8?B?SGRiRDJlOGJMVzE5Qi9ScW5MQWhqSlp5T1pwbzl3OFNVd0JRRTY3U21wQjY4?=
 =?utf-8?B?Qm8zOXpaZHpnbml5clhsN2xTMlF0SzBBMlhUSGJrb1I3NDVYb2o5SFA1L2o2?=
 =?utf-8?B?dURZdmZPTXJkcFRxcld3RU1UZXFZbjR4dEVvNU9xQSswKzE3blEyZmQ2QWww?=
 =?utf-8?B?aTVtNFM0UFNFWm1BU3VIME1IK3M5aDVWK1hxUTRGb2NGSXhsWmVTci83VS9F?=
 =?utf-8?B?RDArc1YxWTBweUE1bnFKeEo5MVlXNXZrdTFzME52VlYwZldrbWlwcUF0ek1G?=
 =?utf-8?B?RkdOMXpKMFVQd0wwVWdLYzBCaUwwQitod0tVcVRjaXNsVmYrQjlVdjRvRFFo?=
 =?utf-8?B?R2NSYThvUlVFd25RYno5RzUyMWdwVlU0MnU3VENzQ0NFNDZJdjk5RitTK0xP?=
 =?utf-8?B?dHp2YmZNTGVReXVjc2FDMlAyODJ2TENZRDNFVXRtaDREdGRYV0JCWGxXNXFF?=
 =?utf-8?B?MHhsVkFML0RjdWVMNUY4TnVpZFUrbWFmcU9KRWZWcTM0dzlNWHlGeFE1bTgw?=
 =?utf-8?B?N3FDQTdnV2psTlM2ZXc5b2RwZUx0VU9zbTNWQmhMeTFXeFUwalpZOWFYMXhE?=
 =?utf-8?B?UDl4OHBURTlRKzJTKzYwR0s1RlRBTXJaYXlaUFBNK3ZFc2U2L01VNENuVjdY?=
 =?utf-8?B?Z25aRTJmallTdExkRi9XUU1OcWEvdlU5M2hpNXY3U1gwYU1HOGFRaWtNM1F4?=
 =?utf-8?B?ZVVURlhYdllqTWlBTyt3dXpoWjhUZkxDWVlpQ1hocmw3b2xJb2RIbkZjRUwy?=
 =?utf-8?B?dkhYWjM5RVllZVIrZjZVNGNHZUJLeFNXZmVqRjg1S3hiZ3N2b21mc0pBV01y?=
 =?utf-8?B?dkxWK3hhL0duRGQ0eFNhQmRnZGxoejZFREpuRisydGlNdHpLdmlieTRWdHN2?=
 =?utf-8?B?cU9MOG5zZUFBOGVpd1RiNTZjRVdqcFRZQm5WRTcrRDRFQzZyc3VsaVF2WTRD?=
 =?utf-8?B?a2l0eFhMMkZTb1B1UVRmZWNoY1kwSzdqcEZNbitkTkIweUJicUxKRFRaTk1s?=
 =?utf-8?B?QStQS2hMV1I5blB2NEY5N3IyYjBmd0dYK1NqVTAyNGxYSnFXY1lJYm84SVRk?=
 =?utf-8?B?cWVaRzRqWjV6elFreU1IeDNmSGQ5Vk81TC93cGtWMWVBTmNlcThwdHZ2c1Z5?=
 =?utf-8?B?OFRLYkc3U2tRdXVrd0Y2cXc2N2t2RHlGTjhGV3BpUEVyQ1NRcGM1RXczRzhC?=
 =?utf-8?B?eU9zb3NORzI5ci9sd1VsTWVtN1FPSkNMclVCYkU4Q2dGTDRrbkJpVzNaYkhF?=
 =?utf-8?B?THdmRXFoa2dZL2U4ZURaRk14SmtMVk14cUhsb1pmNm84d3E3eFdBd1BWMlhG?=
 =?utf-8?B?dnlaTlA1N1BiMVVReDBDVWUyUVBieGxhZ3hxSXJ4N2lXR1c4OEtWNVZyTVhX?=
 =?utf-8?B?eGQyRHJUNzhCejhLSC9nQVFrK1VObldYVVhRMEs0a0crdXl2dlpkV29pU1F1?=
 =?utf-8?B?N0pYVkVRSGpocWNraUNiUGlmSWt1bmtWZ1FSMXE0UTUwZHBxRDNSaEMydW1X?=
 =?utf-8?B?TjZibGZzbkk0dExUU09VYXVvRHdrYmFubWJBL2djb1pLK293cmVER0VUWU9p?=
 =?utf-8?B?aHVBaVpwQVFZYUd0eGxWY1hLM1dac24xTFhtWjFOTDBoYTU1Z3ZzM0hZcDFC?=
 =?utf-8?B?elBqcFdVUlNIWlNLNGJRV1lvQkZwZUUzZmxsZ2M3YXpaTVIrSDQ1aVBzRHNa?=
 =?utf-8?B?eHJzbkJZZ2kzdS9LSVFOUGQ4QTJRVVVGb3lDR0szSnBVckczNURDRHYvdU1w?=
 =?utf-8?B?QXA4b1dCblFVV2VPNE9VV1Q5ckNxdU50VEpVSi9sUWVNdGxiZWtqMzJESW1k?=
 =?utf-8?B?VFJSRzRtQ0tOcVI1UEUrdkFNOGtLMzVBNm53RDhFbzZPL0pTblUwWEdWMVFk?=
 =?utf-8?B?VnZJdlJIdjRkQTlzakx3dlBhY0ZvRndzRzJ0THZLcjE2cjhlSkhPRzcwRmRF?=
 =?utf-8?B?Z3JVK0l2OTM4WnJtd0dvbGxFSmU0emlZaVJxMFBhSS9aTEpkT2swUzR5bHBp?=
 =?utf-8?Q?kqtLUT?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RkNkWm1BQXE2WWtSSXVRWXRQSFdlR0dtSUFrK29kLzNZM2tPamUxNUpuRGVU?=
 =?utf-8?B?Si9oS1pRTFRtRFYvQWlHampIQ2dnU0ttb2JYYy9kUVhvZG51TXVXZ0RFM1pN?=
 =?utf-8?B?aWJwY1d3YkRaRDMwSng1YXUycnRkMWJKQTNFK1lwZElhT3REclZ1ckpNRVhL?=
 =?utf-8?B?RVd6RzYzbFpxSTQvalhXYVJmbDE4YURRUTh4THJjeUZJUWR5T3JCTjgxSU81?=
 =?utf-8?B?bzUxaHhnNC9wWVUrb1p3bWhaalBaK0FEWnpCWExEOUlSY3BKKy82Y1RWTEZY?=
 =?utf-8?B?VTNXRkgwdGxkVGk1N05Td1UwYk9HZ1JOblArYnNOdGZNekhkWW9xZFh3dSt3?=
 =?utf-8?B?eXlEQXRmM1greTBsU1JwZ3ZmWm1veG9HUk9qTFd4WWZ4RTlDUzZ0YmdmL1VR?=
 =?utf-8?B?M2ZQVS93a0VnZlVQODRxcWN1TG9sUGlvTW0xVTczYUxWSzl3UEZGT1NsdnNI?=
 =?utf-8?B?TUNvODVjaEM3amxucGcvSkZWenllbnk0WFdEalhlZnl5WkJQUERGbjg5cjlr?=
 =?utf-8?B?YnR1QWRLWHhQalJTQS9URm9CaEJoTTF4dS9OWHBSblBaTVh6b09nNDVOZS9E?=
 =?utf-8?B?NkhsUktkOTVkK3QzMFloRGU1Znh0bUdsTDJISm9uSzBxdVJjeVBnUlpXelFh?=
 =?utf-8?B?U1JJanVPQVV3aHFqUnQyQUNTNXNOSUJ4T1lIanhNQ09rOHVoUmc2MzlCZ2Jz?=
 =?utf-8?B?YkZOZHQxcVd4SzZGYWFoOWlrb2NwM1c4am44Ymc2ZnB6c2lEblJ5TzlreVpP?=
 =?utf-8?B?K0MxVENjaEVDVEcvNUNHMXNjL1hKZEZVRDFvTFN2ZUNxSCt1eExNOGlxUW9T?=
 =?utf-8?B?dFQzNjNrc1IzTURLeHlWMDNoV2JFcTAyMTBycTE0NkhucUNZMFB5QXJ1VDJn?=
 =?utf-8?B?UFFiWFVuM0U2RndLUUkyd3MvbndZUzNvR1Y2TFA4eUdGellienluTm56aHRS?=
 =?utf-8?B?MUw5eldWNnhMZzJmaGlteGREU0tTaXpjM012YWh0bFBsemJaQURGb0lsZHNG?=
 =?utf-8?B?K09CSkdSMkRzeUpyb2NOMDZjbG4wOUY2VkFKSUdyWklOQWJrUndPNVo0c2Ri?=
 =?utf-8?B?L3VUS0Jqd0EwT0NvZFhIRjI0dHhpV0dIL3J4WmhzVWQ0VzFjVXp2cUIzV1lp?=
 =?utf-8?B?TUptZ1I5dXRwRytsczdvcEU3V05Qb20wcnAzN3FXWUx2WDVudG9UZVRqRXhJ?=
 =?utf-8?B?Tm5nR3JQamMrTndheUZ0TkltRHhQT2xSbzRYZGNFSzdXSllibFJhV3V2UEps?=
 =?utf-8?B?SG1UdmNjRDJwUGpkQjcydUhTN3g0QWZhcC9pSnRaK1pnSTJkSG44b1pyeTVS?=
 =?utf-8?B?VG1mVGVVdG80V1IwVktWWno3NWhvRC9GT2VmT3UxMGtmS1lKSVVkTExsTmVj?=
 =?utf-8?B?Z2dsMThkbVZiRFJCV3ZWUTNodjNtNnpxaXp5WEJqaVFac1ZUQXJ4bmhzRklN?=
 =?utf-8?B?ZmRJSUNYWHFGTW1WRGpGS1JFcG9NVVpLS2t0RFpteXRKTkF4dGFkTXBRZ0Fz?=
 =?utf-8?B?SjNJY3JjNzB5K3M4NkZHckVjc0hUKzlFVXVpSXJkZG5qNjlHMzNjVXVHMG1R?=
 =?utf-8?B?TFArOGxidFM4TTROSzYzM0ZNYWtpZlZWMHFKQ1BYdFR3Unl1UXliaDVJMTU4?=
 =?utf-8?B?aXhHNGdVaXBxN2FNTWFYNVdGc3hlYlZLcS9XeHVIUzJTQmVzdFk2UTBpUWxM?=
 =?utf-8?B?cm5BUjRsY1VmSGw5R3pWM2NHUm1PTVNEdzNaWm9qekdKd2VEU1AzcHlwaGtz?=
 =?utf-8?B?UWQzRjZVVUpMV0ZVcnkrTU1RR0xzdGdSM2JBNHNaaTZHb2VyTjdJVmlha0dT?=
 =?utf-8?B?VHNOc3BVYWIvMG1XWnBBd0FXTjJ3N2ltQXdhYkpJMWl1TGhNTjNEQStnRERI?=
 =?utf-8?B?cGc0dTdCVTNTSlNSdy9uc0FEMkMzdjgvRVpkSU5YeWkrV0FJZTlaaW0yOU9M?=
 =?utf-8?B?MFA3VGpwazNVem1nWndXbHR1dFplY1lkNXBPMFZNYzc1bS9TVU5lQ2VVcDJi?=
 =?utf-8?B?d2Y1NEs5WUFtMVF0K25vUlE1UEIzbStXclNXamJVZkFyU0VtMDYzQ2FFcmg0?=
 =?utf-8?B?cm5Ua3pyeld1TExGYy8wcmZwdVN6Wmxpbm4vVktIdHJGUTJkaVRWVS9oYWFk?=
 =?utf-8?B?YkVyK01TbHBuVzllcWdPck54SHZwV1I5MUlqRDR5QU1PYVkvNG5hS3RPUCtP?=
 =?utf-8?Q?RNF6cmVYdMLK2+fYSWFGIRBul/IBTkPV0+NL9faWbXqx?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e220ad05-920d-4905-be76-08de2856c720
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2025 17:03:50.5924 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SKbJYY1mQd4s3AhWzZjetz8WIfjxYakVi793uk6eRdF3T2ivorfcIqkoQQ3FmJPm0VtyWeTUF/fPE6ei2d4K6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5304
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

SGkgTWFpbnRhaW5lcnMsDQpKdXN0IHRvIGF2b2lkIGl0IGJlIG1pc3NlZCwgY291bGQgeW91IHBs
ZWFzZSBoZWxwIG1lIHJldmlldyBhbmQgbWVyZ2UgaXQ/DQpUaGFua3MgaW4gYWR2YW5jZSBmb3Ig
eW91ciBzdXBwb3J0Lg0KDQpCZXN0IFJlZ2FyZHMNClNodWljaGVuZw0KDQpPbiBNb24sIE5vdiAx
MCwgMjAyNSAxMTo0NiBBTSBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6DQo+IE9uIE1vbiwgTm92IDEw
LCAyMDI1IGF0IDA2OjQ1OjIzUE0gKzAwMDAsIFNodWljaGVuZyBMaW4gd3JvdGU6DQo+ID54ZV9n
dWNfY3RfaW5pdF9ub2FsbG9jKCkgYWxsb2NhdGVzIHRoZSBDVCB3b3JrcXVldWUgYW5kIG90aGVy
IGhlbHBlcnMNCj4gPmJlZm9yZSBpdCB0cmllcyB0byBpbml0aWFsaXplIGN0LT5sb2NrLiBJZiBk
cm1tX211dGV4X2luaXQoKSBmYWlscyB3ZQ0KPiA+Y3VycmVudGx5IGJhaWwgb3V0IHdpdGhvdXQg
cmVsZWFzaW5nIHRob3NlIHJlc291cmNlcyBiZWNhdXNlIHRoZQ0KPiA+Z3VjX2N0X2ZpbmkoKSBo
YXNu4oCZdCBiZWVuIHJlZ2lzdGVyZWQgeWV0Lg0KPiA+DQo+ID5TaW5jZSBkZXN0cm95X3dvcmtx
dWV1ZSgpIGluIGd1Y19jdF9maW5pKCkgbWF5IGZsdXNoIHRoZSB3b3JrcXVldWUsDQo+ID53aGlj
aCBpbiB0dXJuIGNhbiB0YWtlIHRoZSBjdCBsb2NrLCB0aGUgaW5pdGlhbGl6YXRpb24gc2VxdWVu
Y2UgaXMNCj4gPnJlc3RydWN0dXJlZCB0byBmaXJzdCBpbml0aWFsaXplIHRoZSBjdC0+bG9jaywg
dGhlbiBzZXQgdXAgYWxsIENUDQo+ID5zdGF0ZSwgYW5kIGZpbmFsbHkgcmVnaXN0ZXIgZ3VjX2N0
X2ZpbmkoKS4NCj4gPg0KPiA+djI6IGd1Y19jdF9maW5pKCkgZG9lcyB0YWtlIGN0IGxvY2suIChN
YXR0KQ0KPiA+djM6IG1vdmUgcHJpbWVsb2NrZGVwKCkgdG9nZXRoZXIgd2l0aCBkcm1tX211dGV4
X2luaXQoKS4gKEx1Y2FzKQ0KPiA+DQo+ID5GaXhlczogZGQwOGViZjZjMzUyICgiZHJtL3hlOiBJ
bnRyb2R1Y2UgYSBuZXcgRFJNIGRyaXZlciBmb3IgSW50ZWwNCj4gPkdQVXMiKQ0KPiA+Q2M6IEx1
Y2FzIERlIE1hcmNoaSA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPg0KPiA+Q2M6IE1hdHRoZXcg
QnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPg0KPiA+U2lnbmVkLW9mZi1ieTogU2h1aWNo
ZW5nIExpbiA8c2h1aWNoZW5nLmxpbkBpbnRlbC5jb20+DQo+IA0KPiBSZXZpZXdlZC1ieTogTHVj
YXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+IA0KPiB0aGFua3MsDQo+
IEx1Y2FzIERlIE1hcmNoaQ0K
