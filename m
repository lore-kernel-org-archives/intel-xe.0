Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C463BC02183
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jan 2025 19:10:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C30E10E257;
	Thu, 16 Jan 2025 19:10:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T7vJnqLB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 468E810E257
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jan 2025 19:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737054643; x=1768590643;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=vgmlqETEodDSvFWRE+9RowdUgJYZL9CuPaV+VVCt6uI=;
 b=T7vJnqLBC2QzNYyEM08yRg0uQYQegGysU/jayg9tnTV0xas+4vteCbEm
 h+1hWsx+zkjEsG+XYfaV59w2uj/q8w4qfbYinJVstVnZzTjiM/2/+UNXq
 +12wwzEITZp+fogKH0UB0nT6YJN67oOd9O6mSVNRp61Mm6eJE7vR7EmSN
 89grsiJnAa4LpbJ7w1+oLdMKyAPlhMIHKHRIuuSErArRpRAXPlbB2ZzLl
 IUwfMo8R2btgEFZiLQFHFy8xc5rBxx/8B9f15VoTJemAscnGqfomTiHgS
 6/m9uWYSUgIVeVA6cR6s561N/EztZ+EQjsQSWSHZdR4Aw+aUR8mwLwD54 w==;
X-CSE-ConnectionGUID: 2n+RzjR6RcetCmPWAzX88A==
X-CSE-MsgGUID: q9EEPnViQjuGnkgndRHQ8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37489951"
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="37489951"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 11:10:42 -0800
X-CSE-ConnectionGUID: 5ZI8dpk8QzuxxRltH3sJ6w==
X-CSE-MsgGUID: a9o5OyFETqqnZ6RyI8Vfxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="105436802"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2025 11:10:41 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 16 Jan 2025 11:10:41 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 16 Jan 2025 11:10:41 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 16 Jan 2025 11:10:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D1rsMoqtv0zOCX1AN9qcb77XglLmFF1cI386uUnugdLX/VO2GBb5HKoQfbxaKPf73GTMVdVL3uGGBUJNV50V55oa7x1PmNpqIy98i8LV4O2sSxets8Pe3wJd3GGzjRQKaWQX1C/Du5iI4s/+QbUMqT0BRCVrgslkaI83ToeLmzsP7FCUbfIm18dLjTDUtXunk9GeJIwsdxRET70+aT7C5Opg5Xei7upOmD84PRMr9ulRvDSAJUTKZkGYLNFDr8wFXAeJSZIDuD++9R8x/u8F6Ed4beJObi4u/nvUXTIDVe+2Oo1J8tUSRMMc37bjgzz8XHwqg+ioWWwqrWA22E2C8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vgmlqETEodDSvFWRE+9RowdUgJYZL9CuPaV+VVCt6uI=;
 b=NgJf+mxWNJXfqRG4vgfAysBpMm6O30zdmLP4yIXYDcWYJyzJUxHOE0LRq0Y7C8YK5Zc21a4tMDWqzBY3oUy/+NlOKOcLirf6tOWZWgYoMy6WBlmIzvUXtMPtwq657N2A4MIbei6u7HPJk5v5CWLtHAbl1UX+B4dfx7Il8e1jsGT17p9/opUApPxUWgkK1A6Bv1Nf7C4Guv9xo/9w3qNRppNH2PgdRqmW+nt1Gq2vc/QqQEsI1Bi028Bp85JGnjX0r5sDwzEA2621QIi6pSTwr1hqFfBh/XJkA+13VSJS00teFRH4J76CgUcTgjLxUBARoLL6pjfI9+vVGWGXQzbbAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SJ2PR11MB8323.namprd11.prod.outlook.com (2603:10b6:a03:53f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Thu, 16 Jan
 2025 19:10:23 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%6]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 19:10:22 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Refactor dma_mask_size
Thread-Topic: [PATCH 1/2] drm/xe: Refactor dma_mask_size
Thread-Index: AQHbaBeIlSGwLC8g20yQCDPyQfe7KLMZxGMA
Date: Thu, 16 Jan 2025 19:10:22 +0000
Message-ID: <a5b305a50c5b0b2b29557be65d6b3fee6c734bd9.camel@intel.com>
References: <20250116125447.4025927-1-sai.teja.pottumuttu@intel.com>
 <20250116125447.4025927-2-sai.teja.pottumuttu@intel.com>
In-Reply-To: <20250116125447.4025927-2-sai.teja.pottumuttu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SJ2PR11MB8323:EE_
x-ms-office365-filtering-correlation-id: df81d767-4b71-40dd-ab88-08dd36616d17
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZVFNSzZaYUNUMnZ1NDR0MTFWR2hWVm9ib2cycW1OcDZWdUNZcENwcExOdmlJ?=
 =?utf-8?B?dU9jdk1WamNFQ0ZFNnFrTjlVQWxESGNPY0IrYnVsWmhYTVJJUHd4aVZpMjZP?=
 =?utf-8?B?V3NPbmh2UGRhRDk4M3kyUFhtRE1BNy9pNVZMNGFKSG01amErb0IrSWJXU1Fl?=
 =?utf-8?B?OTFva3pSb0MwYk9IZ0hqdEppUVlxSXNhSjVMQzdsR1NyY1R4YkpNeFIwQmEw?=
 =?utf-8?B?UThWRmdTMk8wUkhxaXpOdTRVSEFFNzN2KzhuQkNhSkZaYjc4dSs0aVVtOWVB?=
 =?utf-8?B?Z1JUNGdhMzBOMi80RjRNRlRjYWYzN2hnV2VUc1Z5RzVFVkVBUFgrd2ppWDFU?=
 =?utf-8?B?N0E1Y2xmbnh0cFM3OVhHWWhSMGh5c0VGSHBuZ2JhUmlGdFV6ZmYzemNUMHpM?=
 =?utf-8?B?a1ZENnlVbEs1aEQzVm9BS3l6akMwakZQNWdkb2s1dHoreWcrVkJ4aUMxYnZM?=
 =?utf-8?B?M0dmaHlHbTh2bk9jeEE0anQ5S0RJcWVDdHhEZFlHLzkvaVJtTWpYRTFIMEdS?=
 =?utf-8?B?VnNQV3ZFZHplN2laaFgzUFVuNVdVbk1yT0lRVllTYjJJWVJEWEZiRWRaVHlr?=
 =?utf-8?B?OFpaeENYekNRQmFJVTFaZTl0MmJ5YzRnWXlGWnJ3cnZMYjA0K2x0VnF1YkVO?=
 =?utf-8?B?NFFrMXBkb1FTQnNPc01rNFdscDA1M29mdVIweFIyMEhhTlRVTUFLdXlSbkpB?=
 =?utf-8?B?NWIvSlZxOG5VSVd0Q3ZtRFlvMDcxMjlDMkhGS2NVWnRYdEdpZUN0R1EwUjN0?=
 =?utf-8?B?dGZWMjFBNlNsZW00VVYxcTNMV2xQS1V2bGxLU2ZIclk1TU1Lc1QyMmk5d2NN?=
 =?utf-8?B?WDdhZzVneHROU1M5Qi9vbXBTREErSlRGcnFTQk1qOVlxZ2UyU3J2OHFGZVg3?=
 =?utf-8?B?VjNhNjlZZlMzckNiSDlzMDRMMExlNTB0QzJNdE5ocU5aVm11TjJKcFpKRzZI?=
 =?utf-8?B?MndqcEQxOE5OLzR3TnI5Wk5WZ0VSbFFHcWhYU0dTanZMTXpOYnBraGg5TjNT?=
 =?utf-8?B?Y0hqUzA3QkxkOEttd1MxcTg5bDRWNUZ3VlIxWjA2ZnBCZUdXSnh0UVA0VkZY?=
 =?utf-8?B?bTcyZFNXOEl2d1l0blRTVlp2WklseHo2SkpmSmMxT25XalBjUzdzdTBRVmhZ?=
 =?utf-8?B?SVdQSEpTRGVBajd0azczemtJTmlsVVp1TWlXOVRUcHUyYkFGdDEwWjgzSUpt?=
 =?utf-8?B?YXlmK1Vyc3JmWXBHZncvdlhpVWtlN01RNXJkRlhYZnRnL3pVS3k5ZGN6aURv?=
 =?utf-8?B?YzNsR2p0WHkrQmFuRm82Ync5aktPYzB3Q0M2TXlMQmNXVnBWdnVRcFJoUzNs?=
 =?utf-8?B?ejhlME8ya2hkN0wySElubGtPeHgrOWVuVXhPMTJNeFlDcEY5ZWQ2WjNsYk83?=
 =?utf-8?B?VDNkenQ3YUZFTkw2SC9FQW1ESGczY1cxVVdRMTEwMjhUNS9vM04wSkRNMFJZ?=
 =?utf-8?B?Y3FveUZhZm9jZWpRQm1UYnQyNzZrSUFiOGRXSnpMdXJGZDFjMElWUUhMTC85?=
 =?utf-8?B?TWJXUEY0TlFrRHpZRkpoU0dCY25zMnlQRFFxTUtBdjE0OGJoZXB3UnZhNXFy?=
 =?utf-8?B?ZVVVSTY3c0xCL2cvZEwxSDFWd0FVSVJaSmlPTTZad0o0QUFuYytzWDludDA2?=
 =?utf-8?B?d3ZzdWFMdEY5SzJHS1JNYyszWTN0d3dTL2g2R2NZWm1iT3RFVnMybUdkS3R0?=
 =?utf-8?B?MnZ3WHJPWTJ6aTZHd0FZVWNkeWd4Z1NDakxjdUtiaWF6Sms0aGp6NG9tNWpG?=
 =?utf-8?B?N0tZVGU5N0RSNkVoYjFESTRwYS9VV1pSelJ4VzJsRUN0WGZCM0xxSjFTcDZC?=
 =?utf-8?B?ZHNwakl3cTNPK2wvLzJya3BzWC95YTNKR1VlRUdtbmk0TzVBajM5c1lnVXJM?=
 =?utf-8?B?Vk5OQ09yUlZ5K041T2JiYzI2TEJDejM0WCtoRUFNV2VXRTFBSGw5V1lnOExV?=
 =?utf-8?Q?JeJXY/08nrN0tR035OKPKQAIBwor3Ys1?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RzFQR3BsdUpJSWJKOG90YldHenJ1U0I5alR2M05XTUQ2bUVQYmVkNTQ2MEJY?=
 =?utf-8?B?Y2ZtSCtRcFpnbmNsRE5JTjd4Rm94aVo1anlyQzhvcW0xb3B0a3plV3FxTGwz?=
 =?utf-8?B?RWhyZThGWVk0Q0s1aWZrbFhQb1M0c3o1OWxHUlljdk85SldBRUdPY0Z3Z1Rp?=
 =?utf-8?B?OHpXVGQremJwU0RjeGQvMHVIR2Q3VFRyUVlYa1dFV3BubkpRUW9hZ3htNW1C?=
 =?utf-8?B?OCtRSlAyYXpGK1JYdUZGSHhZOTRNMTFGU0c4Y1hrenB5eEk3WVlNZzdTV3Z3?=
 =?utf-8?B?d1cwWUpKT3A3SWt5eXdNSkY2bkZFWnBacEVTOXhPczVUNXI5MUpZWFJFUlZW?=
 =?utf-8?B?NVlFWjNoYVhBQWZ3YWlOT25hUnROWFBXcGQxcGMrVkEwbmFVb3NhbG5vRkY2?=
 =?utf-8?B?T0lJZ05qSWxXZ3hwZFdXc3ZGK3BmUjg5dU9HWlN2RkY4RDR2ZTdiVlZqQTlK?=
 =?utf-8?B?a0lRSzFvUC9sWkJoOHg2OGVtSXEyVEhnV1pXcFJRL0crc0JzQk16MFBvMlZw?=
 =?utf-8?B?NFJCUDE2UERQUnZYNmh5V3JnbElqYXA5ZkFtQmlCQ0FCNnJVWDBUR2pSQWtQ?=
 =?utf-8?B?SnVweVBVTmNhbW1LQ3l3b1NVS1VtZmZodVpjcHY3aDQ4STd5T0JkMyt6UGpo?=
 =?utf-8?B?SmhXbXpKd21sQ2dRZHd3b25vS0s5WEJ2RVBPWituaHNiVE5NVWdvTFJITHhn?=
 =?utf-8?B?MjVuUG1yaXd2UGthYUkySDY4ekRpNHpOcHE2Q1JjUERkaXNJaDRXS0laNDdG?=
 =?utf-8?B?amxoTVo4RW9hbnNiZldIdW9VZVFZa1htay9HZmpUbXhSaWp1c1hWOW42Z3Fw?=
 =?utf-8?B?a0lZQmFKZkcwMXVldytsMHFFdSsrLy9jQ1hzTkg5S3BhV21tZUtSdDNvSFdm?=
 =?utf-8?B?RFczRVM1ci9PQUdDc00yenF2elVhbmY4VGFVbmdCb2ZCTXF0WGlJeXBCQmtn?=
 =?utf-8?B?amszKzIxMXJTSHBSS1Y2V2lLekZhNHVrUzhPb0ZYZmxQckxEcE5HV2Myc0du?=
 =?utf-8?B?MTFDS1J3K0xPb2JkM0hURE5KTHk4bEtNL0xIalhqMDUwRDZRRzJJUCtVR1lL?=
 =?utf-8?B?enVJU0ltd3lGN0RXbitpbzhGRjAwRS9yQ0ZxTkNsZWNIVGREZFJicHBuYUI2?=
 =?utf-8?B?UjRwUE9EdXAxZFZlejVkaU5neVFZMXdFa010bmdvTGZwWmpDQ0ZuTzZQZVJh?=
 =?utf-8?B?cGM0ZnhqaEhuQ0pGdVgrNjNQN0xVVWZOVGtQOXBLMVR3aVVjWmU3cEFlcjIx?=
 =?utf-8?B?K0VGWnkyVGxMVkdGQkVSSXdCSXNtRjNkUFJJYlhzZ1VEMlNVN0lSeDZlRXh4?=
 =?utf-8?B?a2paZUN2ZXVSNWcwWG1MS2Jvb3J2RVo3M3QyVS84TWNJRDFyNDRrNjNEMzVJ?=
 =?utf-8?B?Z09zcWk5NUw5R0hJaktUTmNRUm8xT0lOV0JZQmt1TGkrampKaUNWakl2bllp?=
 =?utf-8?B?dFg4bUwyMVpLR2R1bWtwZDFoSkkzSHhWY0YwM0drUldVWTJPR0RhU2EyUUVl?=
 =?utf-8?B?b3JWRFhIUmc1aWRGRnZ5ZTBCRno0ckdqeE5LZEZyVE4vd0UwVElPNkU1a0tz?=
 =?utf-8?B?Z3RUWUpQV0JFNWFENmdSMkU4elpZSWtzbHR3KzBFYWcrUWl3Q2tsWHAzYlBG?=
 =?utf-8?B?VUxaMVBPdHJSM2lmNERCekQwSUJUVmxuRnc3SmYxSFJaa3lRZUpWNlBmVi9z?=
 =?utf-8?B?NGlrV3BVbTdUOWdicDJHZkV4YlJEVjdCUHA3SXJFNTVuNzUxQnM4MXpwR0dr?=
 =?utf-8?B?SUVLelJZMFA4TEc5N2JOcVMxckpCTFBtZHg5TURHTjN3WFRTOTdRYU41Rkdk?=
 =?utf-8?B?UkRvaTNVbzlGbVEyVU5KMGZmemZ0SWdYSmFCSlJBTlVNMDhrS3F4S3NGc05I?=
 =?utf-8?B?c3pNVUVHd0dqZE1KaWhxdXJyTUhWN3RyTzdiTW5zVXdPcWFwVFo1UUJCQWFR?=
 =?utf-8?B?K05HM0x5R0hCUm1xZmxQM09CckhGVUFnWDhtZ3pjQnJlMG5hTWwxK1o1eE9V?=
 =?utf-8?B?eDZtTlBvRlJOMHM4bVBFMXpDM2xpSENuNE5KUDZFVGZFdURIY29CSkJQR1Vt?=
 =?utf-8?B?ZXdrbC9IZy95eE5KTHd2YXJkbkFKYXR3WXc4bWU0ZmtEamdPS21ycXZpVWVK?=
 =?utf-8?B?RWFlRkg4RkRLVWJhdXQzRy9xUldXOUc3cHlEanBhWmdhT1YyaGx1Yzl4Vkhn?=
 =?utf-8?B?YUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <950ED737316C3A459E08A983288E4E9E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df81d767-4b71-40dd-ab88-08dd36616d17
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2025 19:10:22.6212 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PnaJ/+KicME+dWI6/EJDY8QVlfwGmvuyWy3KxMgE0HGHjiYqEJjm82tyw2Iy4fBkcXQOO2QxTOqSLgYkncv+v4oGtUrRliEVGUjkRCkQUV8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8323
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

T24gVGh1LCAyMDI1LTAxLTE2IGF0IDE4OjI0ICswNTMwLCBTYWkgVGVqYSBQb3R0dW11dHR1IHdy
b3RlOgo+IGRtYV9tYXNrX3NpemUgaXMgbW9yZSByZWxhdGVkIHRvIHRoZSBwbGF0Zm9ybSB0aGFu
IHRoZSBHVCBJUC4gVGh1cwo+IG1vdmUgaXQgdG8gcGxhdGZvcm0gZGVzY3JpcHRvcnMuCgpDYW4g
eW91IGdpdmUgc29tZSBtb3JlIHJlYXNvbmluZyBmb3Igd2h5IHlvdSB0aGluayB0aGlzIG5lZWRz
IHRvCmNoYW5nZT8gVGhlIHBoeXMgYWRkcmVzcyBiaXRzIGFyZSBzcGVjaWZpYyB0byB0aGUgZ3Jh
cGhpY3MgSVAKdHlwaWNhbGx5LiBBcmUgeW91IGV4cGVjdGluZyB0aGlzIHRvIGJlIGRpZmZlcmVu
dCBmb3IgZGlmZmVyZW50CnBsYXRmb3JtIFNLVXM/CgpUaGFua3MsClN0dWFydAoKPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBTYWkgVGVqYSBQb3R0dW11dHR1IDxzYWkudGVqYS5wb3R0dW11dHR1QGludGVs
LmNvbT4KPiAtLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuY8KgwqDCoMKgwqDCoCB8
IDIyICsrKysrKysrKysrKysrKystLS0tLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2lf
dHlwZXMuaCB8wqAgMSAtCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDcg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2ku
Ywo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaS5jCj4gaW5kZXggNDhkMWM4MWQ0NDFlLi5m
NTljMWFjYWUyM2YgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaS5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaS5jCj4gQEAgLTU0LDYgKzU0LDggQEAgc3Ry
dWN0IHhlX2RldmljZV9kZXNjIHsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqBlbnVtIHhlX3BsYXRm
b3JtIHBsYXRmb3JtOwo+IMKgCj4gK8KgwqDCoMKgwqDCoMKgdTggZG1hX21hc2tfc2l6ZTsKPiAr
Cj4gwqDCoMKgwqDCoMKgwqDCoHU4IHJlcXVpcmVfZm9yY2VfcHJvYmU6MTsKPiDCoMKgwqDCoMKg
wqDCoMKgdTggaXNfZGdmeDoxOwo+IMKgCj4gQEAgLTgzLDcgKzg1LDYgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCB4ZV9ncmFwaGljc19kZXNjIGdyYXBoaWNzX3hlbHAKPiA9IHsKPiDCoAo+IMKgwqDC
oMKgwqDCoMKgwqAuaHdfZW5naW5lX21hc2sgPSBCSVQoWEVfSFdfRU5HSU5FX1JDUzApIHwKPiBC
SVQoWEVfSFdfRU5HSU5FX0JDUzApLAo+IMKgCj4gLcKgwqDCoMKgwqDCoMKgLmRtYV9tYXNrX3Np
emUgPSAzOSwKPiDCoMKgwqDCoMKgwqDCoMKgLnZhX2JpdHMgPSA0OCwKPiDCoMKgwqDCoMKgwqDC
oMKgLnZtX21heF9sZXZlbCA9IDMsCj4gwqB9Owo+IEBAIC05NSwxNCArOTYsMTIgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCB4ZV9ncmFwaGljc19kZXNjCj4gZ3JhcGhpY3NfeGVscHAgPSB7Cj4gwqAK
PiDCoMKgwqDCoMKgwqDCoMKgLmh3X2VuZ2luZV9tYXNrID0gQklUKFhFX0hXX0VOR0lORV9SQ1Mw
KSB8Cj4gQklUKFhFX0hXX0VOR0lORV9CQ1MwKSwKPiDCoAo+IC3CoMKgwqDCoMKgwqDCoC5kbWFf
bWFza19zaXplID0gMzksCj4gwqDCoMKgwqDCoMKgwqDCoC52YV9iaXRzID0gNDgsCj4gwqDCoMKg
wqDCoMKgwqDCoC52bV9tYXhfbGV2ZWwgPSAzLAo+IMKgfTsKPiDCoAo+IMKgI2RlZmluZSBYRV9I
UF9GRUFUVVJFUyBcCj4gwqDCoMKgwqDCoMKgwqDCoC5oYXNfcmFuZ2VfdGxiX2ludmFsaWRhdGlv
biA9IHRydWUsIFwKPiAtwqDCoMKgwqDCoMKgwqAuZG1hX21hc2tfc2l6ZSA9IDQ2LCBcCj4gwqDC
oMKgwqDCoMKgwqDCoC52YV9iaXRzID0gNDgsIFwKPiDCoMKgwqDCoMKgwqDCoMKgLnZtX21heF9s
ZXZlbCA9IDMKPiDCoAo+IEBAIC0xMzcsNyArMTM2LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB4
ZV9ncmFwaGljc19kZXNjCj4gZ3JhcGhpY3NfeGVocGMgPSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBCSVQoWEVfSFdfRU5HSU5FX0NDUzIpIHwgQklUKFhFX0hXX0VOR0lORV9D
Q1MzKSwKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqBYRV9IUF9GRUFUVVJFUywKPiAtwqDCoMKgwqDC
oMKgwqAuZG1hX21hc2tfc2l6ZSA9IDUyLAo+IMKgwqDCoMKgwqDCoMKgwqAubWF4X3JlbW90ZV90
aWxlcyA9IDEsCj4gwqDCoMKgwqDCoMKgwqDCoC52YV9iaXRzID0gNTcsCj4gwqDCoMKgwqDCoMKg
wqDCoC52bV9tYXhfbGV2ZWwgPSA0LAo+IEBAIC0xNTgsNyArMTU2LDYgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCB4ZV9ncmFwaGljc19kZXNjCj4gZ3JhcGhpY3NfeGVscGcgPSB7Cj4gwqB9Owo+IMKg
Cj4gwqAjZGVmaW5lIFhFMl9HRlhfRkVBVFVSRVMgXAo+IC3CoMKgwqDCoMKgwqDCoC5kbWFfbWFz
a19zaXplID0gNDYsIFwKPiDCoMKgwqDCoMKgwqDCoMKgLmhhc19hc2lkID0gMSwgXAo+IMKgwqDC
oMKgwqDCoMKgwqAuaGFzX2F0b21pY19lbmFibGVfcHRlX2JpdCA9IDEsIFwKPiDCoMKgwqDCoMKg
wqDCoMKgLmhhc19mbGF0X2NjcyA9IDEsIFwKPiBAQCAtMjE4LDYgKzIxNSw3IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgeGVfZGV2aWNlX2Rlc2MgdGdsX2Rlc2MgPSB7Cj4gwqDCoMKgwqDCoMKgwqDC
oC5ncmFwaGljcyA9ICZncmFwaGljc194ZWxwLAo+IMKgwqDCoMKgwqDCoMKgwqAubWVkaWEgPSAm
bWVkaWFfeGVtLAo+IMKgwqDCoMKgwqDCoMKgwqBQTEFURk9STShUSUdFUkxBS0UpLAo+ICvCoMKg
wqDCoMKgwqDCoC5kbWFfbWFza19zaXplID0gMzksCj4gwqDCoMKgwqDCoMKgwqDCoC5oYXNfZGlz
cGxheSA9IHRydWUsCj4gwqDCoMKgwqDCoMKgwqDCoC5oYXNfbGxjID0gdHJ1ZSwKPiDCoMKgwqDC
oMKgwqDCoMKgLnJlcXVpcmVfZm9yY2VfcHJvYmUgPSB0cnVlLAo+IEBAIC0yMjcsNiArMjI1LDcg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCB4ZV9kZXZpY2VfZGVzYyBya2xfZGVzYyA9IHsKPiDCoMKg
wqDCoMKgwqDCoMKgLmdyYXBoaWNzID0gJmdyYXBoaWNzX3hlbHAsCj4gwqDCoMKgwqDCoMKgwqDC
oC5tZWRpYSA9ICZtZWRpYV94ZW0sCj4gwqDCoMKgwqDCoMKgwqDCoFBMQVRGT1JNKFJPQ0tFVExB
S0UpLAo+ICvCoMKgwqDCoMKgwqDCoC5kbWFfbWFza19zaXplID0gMzksCj4gwqDCoMKgwqDCoMKg
wqDCoC5oYXNfZGlzcGxheSA9IHRydWUsCj4gwqDCoMKgwqDCoMKgwqDCoC5oYXNfbGxjID0gdHJ1
ZSwKPiDCoMKgwqDCoMKgwqDCoMKgLnJlcXVpcmVfZm9yY2VfcHJvYmUgPSB0cnVlLAo+IEBAIC0y
MzgsNiArMjM3LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB4ZV9kZXZpY2VfZGVzYyBhZGxfc19k
ZXNjID0gewo+IMKgwqDCoMKgwqDCoMKgwqAuZ3JhcGhpY3MgPSAmZ3JhcGhpY3NfeGVscCwKPiDC
oMKgwqDCoMKgwqDCoMKgLm1lZGlhID0gJm1lZGlhX3hlbSwKPiDCoMKgwqDCoMKgwqDCoMKgUExB
VEZPUk0oQUxERVJMQUtFX1MpLAo+ICvCoMKgwqDCoMKgwqDCoC5kbWFfbWFza19zaXplID0gMzks
Cj4gwqDCoMKgwqDCoMKgwqDCoC5oYXNfZGlzcGxheSA9IHRydWUsCj4gwqDCoMKgwqDCoMKgwqDC
oC5oYXNfbGxjID0gdHJ1ZSwKPiDCoMKgwqDCoMKgwqDCoMKgLnJlcXVpcmVfZm9yY2VfcHJvYmUg
PSB0cnVlLAo+IEBAIC0yNTMsNiArMjUzLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB4ZV9kZXZp
Y2VfZGVzYyBhZGxfcF9kZXNjID0gewo+IMKgwqDCoMKgwqDCoMKgwqAuZ3JhcGhpY3MgPSAmZ3Jh
cGhpY3NfeGVscCwKPiDCoMKgwqDCoMKgwqDCoMKgLm1lZGlhID0gJm1lZGlhX3hlbSwKPiDCoMKg
wqDCoMKgwqDCoMKgUExBVEZPUk0oQUxERVJMQUtFX1ApLAo+ICvCoMKgwqDCoMKgwqDCoC5kbWFf
bWFza19zaXplID0gMzksCj4gwqDCoMKgwqDCoMKgwqDCoC5oYXNfZGlzcGxheSA9IHRydWUsCj4g
wqDCoMKgwqDCoMKgwqDCoC5oYXNfbGxjID0gdHJ1ZSwKPiDCoMKgwqDCoMKgwqDCoMKgLnJlcXVp
cmVfZm9yY2VfcHJvYmUgPSB0cnVlLAo+IEBAIC0yNjYsNiArMjY3LDcgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCB4ZV9kZXZpY2VfZGVzYyBhZGxfbl9kZXNjID0gewo+IMKgwqDCoMKgwqDCoMKgwqAu
Z3JhcGhpY3MgPSAmZ3JhcGhpY3NfeGVscCwKPiDCoMKgwqDCoMKgwqDCoMKgLm1lZGlhID0gJm1l
ZGlhX3hlbSwKPiDCoMKgwqDCoMKgwqDCoMKgUExBVEZPUk0oQUxERVJMQUtFX04pLAo+ICvCoMKg
wqDCoMKgwqDCoC5kbWFfbWFza19zaXplID0gMzksCj4gwqDCoMKgwqDCoMKgwqDCoC5oYXNfZGlz
cGxheSA9IHRydWUsCj4gwqDCoMKgwqDCoMKgwqDCoC5oYXNfbGxjID0gdHJ1ZSwKPiDCoMKgwqDC
oMKgwqDCoMKgLnJlcXVpcmVfZm9yY2VfcHJvYmUgPSB0cnVlLAo+IEBAIC0yNzksNiArMjgxLDcg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCB4ZV9kZXZpY2VfZGVzYyBkZzFfZGVzYyA9IHsKPiDCoMKg
wqDCoMKgwqDCoMKgLm1lZGlhID0gJm1lZGlhX3hlbSwKPiDCoMKgwqDCoMKgwqDCoMKgREdGWF9G
RUFUVVJFUywKPiDCoMKgwqDCoMKgwqDCoMKgUExBVEZPUk0oREcxKSwKPiArwqDCoMKgwqDCoMKg
wqAuZG1hX21hc2tfc2l6ZSA9IDM5LAo+IMKgwqDCoMKgwqDCoMKgwqAuaGFzX2Rpc3BsYXkgPSB0
cnVlLAo+IMKgwqDCoMKgwqDCoMKgwqAuaGFzX2hlY2lfZ3NjZmkgPSAxLAo+IMKgwqDCoMKgwqDC
oMKgwqAucmVxdWlyZV9mb3JjZV9wcm9iZSA9IHRydWUsCj4gQEAgLTMwMiw2ICszMDUsNyBAQCBz
dGF0aWMgY29uc3QgdTE2IGRnMl9nMTJfaWRzW10gPSB7Cj4gSU5URUxfREcyX0cxMl9JRFMoTk9Q
KSwgMCB9Owo+IMKgc3RhdGljIGNvbnN0IHN0cnVjdCB4ZV9kZXZpY2VfZGVzYyBhdHNfbV9kZXNj
ID0gewo+IMKgwqDCoMKgwqDCoMKgwqAuZ3JhcGhpY3MgPSAmZ3JhcGhpY3NfeGVocGcsCj4gwqDC
oMKgwqDCoMKgwqDCoC5tZWRpYSA9ICZtZWRpYV94ZWhwbSwKPiArwqDCoMKgwqDCoMKgwqAuZG1h
X21hc2tfc2l6ZSA9IDQ2LAo+IMKgwqDCoMKgwqDCoMKgwqAucmVxdWlyZV9mb3JjZV9wcm9iZSA9
IHRydWUsCj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgREcyX0ZFQVRVUkVTLAo+IEBAIC0zMTEsNiAr
MzE1LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB4ZV9kZXZpY2VfZGVzYyBhdHNfbV9kZXNjID0g
ewo+IMKgc3RhdGljIGNvbnN0IHN0cnVjdCB4ZV9kZXZpY2VfZGVzYyBkZzJfZGVzYyA9IHsKPiDC
oMKgwqDCoMKgwqDCoMKgLmdyYXBoaWNzID0gJmdyYXBoaWNzX3hlaHBnLAo+IMKgwqDCoMKgwqDC
oMKgwqAubWVkaWEgPSAmbWVkaWFfeGVocG0sCj4gK8KgwqDCoMKgwqDCoMKgLmRtYV9tYXNrX3Np
emUgPSA0NiwKPiDCoMKgwqDCoMKgwqDCoMKgLnJlcXVpcmVfZm9yY2VfcHJvYmUgPSB0cnVlLAo+
IMKgCj4gwqDCoMKgwqDCoMKgwqDCoERHMl9GRUFUVVJFUywKPiBAQCAtMzIxLDYgKzMyNiw3IEBA
IHN0YXRpYyBjb25zdCBfX21heWJlX3VudXNlZCBzdHJ1Y3QgeGVfZGV2aWNlX2Rlc2MKPiBwdmNf
ZGVzYyA9IHsKPiDCoMKgwqDCoMKgwqDCoMKgLmdyYXBoaWNzID0gJmdyYXBoaWNzX3hlaHBjLAo+
IMKgwqDCoMKgwqDCoMKgwqBER0ZYX0ZFQVRVUkVTLAo+IMKgwqDCoMKgwqDCoMKgwqBQTEFURk9S
TShQVkMpLAo+ICvCoMKgwqDCoMKgwqDCoC5kbWFfbWFza19zaXplID0gNTIsCj4gwqDCoMKgwqDC
oMKgwqDCoC5oYXNfZGlzcGxheSA9IGZhbHNlLAo+IMKgwqDCoMKgwqDCoMKgwqAuaGFzX2hlY2lf
Z3NjZmkgPSAxLAo+IMKgwqDCoMKgwqDCoMKgwqAucmVxdWlyZV9mb3JjZV9wcm9iZSA9IHRydWUs
Cj4gQEAgLTMzMCwyMyArMzM2LDI3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgeGVfZGV2aWNlX2Rl
c2MgbXRsX2Rlc2MgPSB7Cj4gwqDCoMKgwqDCoMKgwqDCoC8qIC5ncmFwaGljcyBhbmQgLm1lZGlh
IGRldGVybWluZWQgdmlhIEdNRF9JRCAqLwo+IMKgwqDCoMKgwqDCoMKgwqAucmVxdWlyZV9mb3Jj
ZV9wcm9iZSA9IHRydWUsCj4gwqDCoMKgwqDCoMKgwqDCoFBMQVRGT1JNKE1FVEVPUkxBS0UpLAo+
ICvCoMKgwqDCoMKgwqDCoC5kbWFfbWFza19zaXplID0gNDYsCj4gwqDCoMKgwqDCoMKgwqDCoC5o
YXNfZGlzcGxheSA9IHRydWUsCj4gwqB9Owo+IMKgCj4gwqBzdGF0aWMgY29uc3Qgc3RydWN0IHhl
X2RldmljZV9kZXNjIGxubF9kZXNjID0gewo+IMKgwqDCoMKgwqDCoMKgwqBQTEFURk9STShMVU5B
UkxBS0UpLAo+ICvCoMKgwqDCoMKgwqDCoC5kbWFfbWFza19zaXplID0gNDYsCj4gwqDCoMKgwqDC
oMKgwqDCoC5oYXNfZGlzcGxheSA9IHRydWUsCj4gwqB9Owo+IMKgCj4gwqBzdGF0aWMgY29uc3Qg
c3RydWN0IHhlX2RldmljZV9kZXNjIGJtZ19kZXNjID0gewo+IMKgwqDCoMKgwqDCoMKgwqBER0ZY
X0ZFQVRVUkVTLAo+IMKgwqDCoMKgwqDCoMKgwqBQTEFURk9STShCQVRUTEVNQUdFKSwKPiArwqDC
oMKgwqDCoMKgwqAuZG1hX21hc2tfc2l6ZSA9IDQ2LAo+IMKgwqDCoMKgwqDCoMKgwqAuaGFzX2Rp
c3BsYXkgPSB0cnVlLAo+IMKgwqDCoMKgwqDCoMKgwqAuaGFzX2hlY2lfY3NjZmkgPSAxLAo+IMKg
fTsKPiDCoAo+IMKgc3RhdGljIGNvbnN0IHN0cnVjdCB4ZV9kZXZpY2VfZGVzYyBwdGxfZGVzYyA9
IHsKPiDCoMKgwqDCoMKgwqDCoMKgUExBVEZPUk0oUEFOVEhFUkxBS0UpLAo+ICvCoMKgwqDCoMKg
wqDCoC5kbWFfbWFza19zaXplID0gNDYsCj4gwqDCoMKgwqDCoMKgwqDCoC5oYXNfZGlzcGxheSA9
IHRydWUsCj4gwqDCoMKgwqDCoMKgwqDCoC5yZXF1aXJlX2ZvcmNlX3Byb2JlID0gdHJ1ZSwKPiDC
oH07Cj4gQEAgLTYxMiw2ICs2MjIsNyBAQCBzdGF0aWMgaW50IHhlX2luZm9faW5pdF9lYXJseShz
dHJ1Y3QgeGVfZGV2aWNlCj4gKnhlLAo+IMKgwqDCoMKgwqDCoMKgwqB4ZS0+aW5mby5zdWJwbGF0
Zm9ybSA9IHN1YnBsYXRmb3JtX2Rlc2MgPwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgc3VicGxhdGZvcm1fZGVzYy0+c3VicGxhdGZvcm0gOiBYRV9TVUJQTEFURk9STV9OT05FOwo+
IMKgCj4gK8KgwqDCoMKgwqDCoMKgeGUtPmluZm8uZG1hX21hc2tfc2l6ZSA9IGRlc2MtPmRtYV9t
YXNrX3NpemU7Cj4gwqDCoMKgwqDCoMKgwqDCoHhlLT5pbmZvLmlzX2RnZnggPSBkZXNjLT5pc19k
Z2Z4Owo+IMKgwqDCoMKgwqDCoMKgwqB4ZS0+aW5mby5oYXNfaGVjaV9nc2NmaSA9IGRlc2MtPmhh
c19oZWNpX2dzY2ZpOwo+IMKgwqDCoMKgwqDCoMKgwqB4ZS0+aW5mby5oYXNfaGVjaV9jc2NmaSA9
IGRlc2MtPmhhc19oZWNpX2NzY2ZpOwo+IEBAIC02NzYsNyArNjg3LDYgQEAgc3RhdGljIGludCB4
ZV9pbmZvX2luaXQoc3RydWN0IHhlX2RldmljZSAqeGUsCj4gwqDCoMKgwqDCoMKgwqDCoHhlLT5p
bmZvLmdyYXBoaWNzX25hbWUgPSBncmFwaGljc19kZXNjLT5uYW1lOwo+IMKgwqDCoMKgwqDCoMKg
wqB4ZS0+aW5mby5tZWRpYV9uYW1lID0gbWVkaWFfZGVzYyA/IG1lZGlhX2Rlc2MtPm5hbWUgOiAi
bm9uZSI7Cj4gwqAKPiAtwqDCoMKgwqDCoMKgwqB4ZS0+aW5mby5kbWFfbWFza19zaXplID0gZ3Jh
cGhpY3NfZGVzYy0+ZG1hX21hc2tfc2l6ZTsKPiDCoMKgwqDCoMKgwqDCoMKgeGUtPmluZm8udnJh
bV9mbGFncyA9IGdyYXBoaWNzX2Rlc2MtPnZyYW1fZmxhZ3M7Cj4gwqDCoMKgwqDCoMKgwqDCoHhl
LT5pbmZvLnZhX2JpdHMgPSBncmFwaGljc19kZXNjLT52YV9iaXRzOwo+IMKgwqDCoMKgwqDCoMKg
wqB4ZS0+aW5mby52bV9tYXhfbGV2ZWwgPSBncmFwaGljc19kZXNjLT52bV9tYXhfbGV2ZWw7Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2lfdHlwZXMuaAo+IGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3BjaV90eXBlcy5oCj4gaW5kZXggODczZWZlYzVjZGVlLi43NDM3NDE1
YTU0ZDUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaV90eXBlcy5oCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaV90eXBlcy5oCj4gQEAgLTEzLDcgKzEzLDYg
QEAgc3RydWN0IHhlX2dyYXBoaWNzX2Rlc2Mgewo+IMKgwqDCoMKgwqDCoMKgwqB1OCB2ZXI7Cj4g
wqDCoMKgwqDCoMKgwqDCoHU4IHJlbDsKPiDCoAo+IC3CoMKgwqDCoMKgwqDCoHU4IGRtYV9tYXNr
X3NpemU7wqDCoMKgwqDCoMKgwqAvKiBhdmFpbGFibGUgRE1BIGFkZHJlc3MgYml0cyAqLwo+IMKg
wqDCoMKgwqDCoMKgwqB1OCB2YV9iaXRzOwo+IMKgwqDCoMKgwqDCoMKgwqB1OCB2bV9tYXhfbGV2
ZWw7Cj4gwqDCoMKgwqDCoMKgwqDCoHU4IHZyYW1fZmxhZ3M7Cgo=
