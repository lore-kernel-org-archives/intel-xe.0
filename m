Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434B4C3DA41
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jul 2024 14:06:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E13FA10E7E3;
	Wed, 10 Jul 2024 14:06:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PNNwvqMY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA0F610E7E3
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jul 2024 14:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720620402; x=1752156402;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=V1c7CcZQIaKzIRzTErpkTyOKABkk0WTNwl2ctVCo5tA=;
 b=PNNwvqMY+NiZhT3yn7effBNvquuCH11BoFBVU5UFWpQ4lo7SxLkTeLtx
 UKafAQJr9MXsLyZ7m94+BiCcZnV4xxV1eqV3Z+LIU2F29EBIpf4dodh5a
 QzPAkzJrrDDRNdilPdxpFRafQOqgmPPKZhZ/IisNcfzPMcppugj9Pk55J
 Wx+uvCklDjxrf68CQztZLYuOOfBFgYEMyiNw6QVejKPKTvHRWJxEfCCAJ
 B4pnxBFC8lxCjyUPleW9mVky5+hRzSlPbmCzH99eIYDL5W4RkFEQGus0q
 JSHpKpvBaiqO3n2I5I4jttm+bZEWsmkmTVK9MFWWU+lSVWooDdiZmgz0q Q==;
X-CSE-ConnectionGUID: 1pNaCocKRD6UHt08O4vEUw==
X-CSE-MsgGUID: F0szLRi/QJWlXt0rxBazCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="21758160"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="21758160"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 07:05:48 -0700
X-CSE-ConnectionGUID: 2Ax2FqR3ST2dQQUz/chiew==
X-CSE-MsgGUID: 7YxZsK7pTt6x9CcJ5iW2Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="48671657"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jul 2024 07:05:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 07:05:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 07:05:45 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 10 Jul 2024 07:05:45 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 10 Jul 2024 07:05:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ky0YZgM4OTUAJrUZhMh/9yR0zOyn7Jnn6Vlq8rvxzOdEPGfjX+q9PICotJtGdH4tMana2/kUdMjIFMbrReGvMhtZW09AqLW2JGxntJbiNdUOe/mikouqjcUiXVoBR/J4h/sbEAHIgZOAM9BzaBWLaOfjITzwnzW7vLGX6PtNV5pNZ47VnWuR18aYwQnXokqSxZG2j56j402fTUKJaZhp7yEG+QtvaHb3YPYtqgElsocaL3ZXdeglosHjH6+3RnGVvq6JIkZk1yNvNuz4v2sj+dnn0dd2bY+SLlhGrtO8Pt5/MLAT282dcW13otT3Ig+jSfQEI4hMR8a6zm/3r7sNzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1c7CcZQIaKzIRzTErpkTyOKABkk0WTNwl2ctVCo5tA=;
 b=JNND0JJIMSCad8aO7xHS4h9Fz3/8ihMZGTRMn+0AbAuAIOu066FvYfRDKnPRhc9CkajXz1b2NqNlq5+REJEf1EXh+nD4ZIbxeIkrVAQHEdsloo9RQJ3UqG9mgGmWbAEKxdZaysV9UUULBBY6wBj06TImWL83rZS/VtWCz7w+jlPw2h/WvJtLp3G5J3z9036usbSCCz6PBQHxwi+MWxOwpIuAbkrBM8ZrvCYNHlJpgQBA7mJeekVK/awJXet4Qe9DHRXPNKuXZPgaDdI9740NiEJg1Wi/7bbRStgL4F/wJqNsv1ht1cWGQ0c8y6SZKplgUdmbnxLrEsKJp3LlN2GHQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CY8PR11MB7395.namprd11.prod.outlook.com (2603:10b6:930:86::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Wed, 10 Jul
 2024 14:05:43 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%7]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 14:05:43 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Yang, Fei" <fei.yang@intel.com>, "Roper, Matthew
 D" <matthew.d.roper@intel.com>, "Jerez Plata, Francisco"
 <francisco.jerez.plata@intel.com>
Subject: Re: [PATCH] drm/xe/uapi: Expose EU width via topology query
Thread-Topic: [PATCH] drm/xe/uapi: Expose EU width via topology query
Thread-Index: AQHa0o23ZwyB6+1XsUOAuK1Jm1mldbHv/2IA
Date: Wed, 10 Jul 2024 14:05:43 +0000
Message-ID: <a03a8d9fad59a747e9a0980517a41dcfd2d6da97.camel@intel.com>
References: <20240710055440.1985620-1-lucas.demarchi@intel.com>
In-Reply-To: <20240710055440.1985620-1-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CY8PR11MB7395:EE_
x-ms-office365-filtering-correlation-id: 2db02ed6-2739-4450-4f2c-08dca0e96344
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VzgzcFFQUXp2SVhocTlGVm9nWFBjaW9FWTVXaVcvR1VYc2dGbWpPZXYrdjQ4?=
 =?utf-8?B?VGF5ZEcyOGRRNHMrd1NrbURQYjlVY1RMVTE4NEJOYk9La2pVUm5nRHV0dHdO?=
 =?utf-8?B?aUR2ZW1KVEMrRnA4MDlEaG5UcmNvZ2ZNV2tOM2hyeUIwbys3bU14b2lERWpT?=
 =?utf-8?B?YkMrb0RsalY1bDZCWklkcVNWdklkaGcyeWhRaWlNOXh2ZGdKL2QrTDdOOFIv?=
 =?utf-8?B?eTZsTE1pR2UxWHdndm94cm5IeWdzYWUzUHFTMysvMEJ0SW42ZFBRUElkWFNO?=
 =?utf-8?B?OEROcFVITmpWZDk1Qk5QMDNUZVRwQ1ZaUjVJand2R2JkRDJGakYxckVmMCs0?=
 =?utf-8?B?THdtenJUWCt2ZjhTek1Eb0dtZ3N2WEJlRXFWSkliOVFHY0lNTEpxaUhXSWtH?=
 =?utf-8?B?SlZwVysvRUhzTVRGMnkvcXRJbkVESVlkZkNFMU02VzlRWGJIUkcyeERWZ0pv?=
 =?utf-8?B?bkNFZyt6dTdRWlRlQTBZYU1KSDRSSlY4MGdrOTQ0NXZxZFVFOG4wc3NKNStP?=
 =?utf-8?B?b2k3ZG12a1p2bSt0R1NsMXRzeVUwZ1ZaeVg3aUFlTEdWVDVHVWRLY0VFbmd5?=
 =?utf-8?B?cnpzOWFaK0d3MnpvaFB1d3g4emxMTE14d1FGTWgwR0VWaFBJUVZUZ1Vualdw?=
 =?utf-8?B?aU9sWUYvbFdrZkhlRTU2d3R5MnZueVo5dUZrVi9HaGNnRmpVLzRWdXBabis2?=
 =?utf-8?B?ZjhXOWx5OVdJWlFxSTlzblRueWc0SnFEQTBIZ0lDQ0hRMU13YUh3OTN2ZFpB?=
 =?utf-8?B?VmVraDlGRlU3RXFjQ1dXS1ZTWjRoekVaYXVsazJzdm83N29RUWhrcnFmdUlK?=
 =?utf-8?B?clNiMWlVZ3BvNUZvelA2cUNuUGlkME80QmEvZzl0Y3p0UlpUU2xqV01Fckds?=
 =?utf-8?B?OWZOUFFBR3d1U202b2VBTmpBK1J4UTIraEFzcWFYTGxEbk5MN0J0Q09ia2Rx?=
 =?utf-8?B?KzRDVUgzNlNYZnRRWlpjTHFaZlpkQWVGV3RxcVRYZG9MMW9EbGxNckNPVEw1?=
 =?utf-8?B?UWZpMUt4Tnc2Y1lBOTlSNzdxUkpXblRtMFFuTEcyeVlZOW9hQUlEblRBLzRt?=
 =?utf-8?B?K29HS3dmUGJOS2o2cCs5QjlxM2U1cXdSN1VJcFo1enFZLzNVUWVlZjhJaFBW?=
 =?utf-8?B?WUx0R00vbWJMNFgvdUl1TmRiZzJ5dTRxSnE2WFM3TlJmNW42OUw5Ti84UXdJ?=
 =?utf-8?B?Unp4Rjc3a1F1QVA5aSsxQ1RPSVpmVmtZRDhpSFpEbXQ3bGNHT0tEamxzMlBy?=
 =?utf-8?B?cE5sUWtqdGcxRHZrSGFWVXpETmpiTWRPclFJRFZwbzViaWYvVmNIemVtMHJ5?=
 =?utf-8?B?elBZRnQ5L1hzQWpCQzdaTFVOeEE4TEtWS1JQcjREV2t5ejJ1cmdINk9hK0Rx?=
 =?utf-8?B?NGI1bWYxUmF1aHlhWlNkdHdlcjFKUzJka254eTRGbjM5cW9oc1N1dSsrRURJ?=
 =?utf-8?B?ZGZUM3B3U1d0aUhNQlRGaDF2OS94eVFaeW9INldRMmNoWEdWYU1qOWN5U3Qv?=
 =?utf-8?B?N3ExMGFmSnpOUTJMbTF0VEhBWFhoa1lNWm56VXVkaFhjZENBTHo3Nzcrc1FN?=
 =?utf-8?B?WkNpRGwwSVByWjVFYVltSDF0OG5CNkZMQTV5MW1mdWlBQkdYZVp1QyswU3Bz?=
 =?utf-8?B?Z0hOK1RvUUk5eWhHYVhudjYxNGNCZzBJZGFwekwzVzFnTDNKbUdlczZVMnRw?=
 =?utf-8?B?WXBLaTJaTTFlaThQRE4walFCdldmQzQ1WmE3dGEwK3k1RlJrUnFvN3pGSHd1?=
 =?utf-8?B?QUZWUDBpSG9mbDhTeEJ1bU9lSWswdnNOcWRXaXptdlJOTzhuMjVRTW5kVUlY?=
 =?utf-8?Q?pQ89sFWaysIS+qccpW5vFE0EffV8VTsGfdUgI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TkZvb2g1ZHY3enJrUEdtaVNISWp3SFBKbWpEOHdxMGQxVVVPdzluWnU0ajZy?=
 =?utf-8?B?M3Rmdy9YckhaNTg4Q1hKc2tQcEgzcGRsUHZjc2drYVJGUW91MlAxeWZUQ0hZ?=
 =?utf-8?B?ZVZrY05WK0ZTQ3BvbXk1R0ZPNGtHODNJQzVyK05kTXM4NWtlNVRBOEd4b1VX?=
 =?utf-8?B?NGxnRFBNd2E2MnpjNkRKazF0c2c2cWgvK1ZDdENJZGpiK0JHNWlYbVVFT3Zj?=
 =?utf-8?B?eEV1NStCZUhIWi8xMTM0VGs0NHlmN0ExMnBNWUJuTDdTdjNGdjFjNnREdzhJ?=
 =?utf-8?B?Y1REUlNobUkyeEZWdUY0YlJMUnJYaEx5WHFlQUQyaFF6R1Q1Q0xWc09KWVlv?=
 =?utf-8?B?NnNhd2lzQkNqODhYcWxZQzkrN1l0Y3lNWGQxTGx5cjVzek9wbkczMzRaRXB4?=
 =?utf-8?B?bWxXK3JYNGphRHNXMEhvVzlWazgwWkZOVmZka0x6MHVZWWl2OW5XaW1JdFN1?=
 =?utf-8?B?bFNGdUtseDltYmxkVFRxUGJENlRqZDBtTDBzS2FMWkRHL1JNQ0RYazQ5RmJv?=
 =?utf-8?B?emErQ01JckI1cXM1bjN4V1hkS3ZqT2N5WFVTaUNSOVJ0Q21hWGdOYzY4TkJ5?=
 =?utf-8?B?ZGxBSGQ4TlpCSHBWc1lESG1CVFdOaUdQWWVxRU5YeEliVE1wZk1hOHYxV2dp?=
 =?utf-8?B?V0R3ZHJTbmJPbStscWxiRUtBbzNiWDJNUEdGbFltaVRvTS9wb2tPcThMMms2?=
 =?utf-8?B?R00vU3JHeThnRFdUczhLSWtRN2syUHQ2VUVLU3VaS25HU2R6YTl0K0ZaTHJk?=
 =?utf-8?B?UFFuRDRtY2JFcUQzc2JjOWc4TlN4V0V0Qm5zUWhFNGo1d1EyMXU4bGZCa2wy?=
 =?utf-8?B?YXdkbVVmY0hHeVJNcGYwWkxoOFVEN3RMRkVRL2FvSkNLR0ZSam9UTzNrcFNk?=
 =?utf-8?B?VlN6bGlqZ0J2ZHRtMlZURXVsMnRSQUNvQ0MyNE43eXBRR1U3N0hBK3l2SG9I?=
 =?utf-8?B?dk5FN0FhdlYxcDViMzViaHRCdktqN3FmVy9QcW5rcU4rZ0NZMWNaWU9UaStm?=
 =?utf-8?B?elV0dEdvbjZkcnlyMThFaW5CQm9zOTM3YndVc1RSRE5wTzYwbDJINkNRYjFR?=
 =?utf-8?B?blBuYWJTZUpVdkFOdExNVmlRSEF5RFFjN29rNGhNYjB0SDJrbzdzVHdsQXRo?=
 =?utf-8?B?VjVicU9WQjZkWlpJVlBvYm9QV29VUkowdjcvMjUyNDB4bjJaYlE5djdyenhp?=
 =?utf-8?B?N2tlc3czczJlQ2RwTFIyai9UZXB1SC8vN0l2ak52ak5wdjhSSWwwbFdYdE1T?=
 =?utf-8?B?ZmlpaVZjWEdHSDVHVkVlSjd0WWZuTFZLNjBPTFNUczJLY1U2V25PSWs2MGxU?=
 =?utf-8?B?dk12RFRqWDlyNVFQby9rcDVsYmV0QVpscEcyZk1XZ0Z5R1dFa3FDTy9WLzV1?=
 =?utf-8?B?YzZnb3QvSTlXUXFOMyt6ZEZtdU01SWtkMGhVcGQwNGdoT3FVNG9RcCtwVHUz?=
 =?utf-8?B?NEd4NmhQNUFkMHBFbFdnVHVXWmJSRWd0SExqN1U2S0dVRy8rb1lxK0VkNHds?=
 =?utf-8?B?Q3F0M1lGaHNmLzFIbEVXWXh2dEs0Qmp2TUp2SjRWZmxRQ0pIMW16bU5iM2ZZ?=
 =?utf-8?B?Sld1N3c1ZVpVK3cvTUd3ZGhsRUZISEJSZUs4OXBjcTl4MTVsMGpWS0dMVUQy?=
 =?utf-8?B?S0xFNjIvOHF1cFJqaDdYTVdlUE12d1ZnWXkrWWFqZzltdUUzWEhtUUZ5Tnhi?=
 =?utf-8?B?NmN3TTZZVitNdEpxUTBsbTUwcHhlOXFBNlJjdk5RRWFrTFVYWEZPVlBPN1ow?=
 =?utf-8?B?ZEpHaHhhNDlyWDFQdEVPK1NreFlhTkpXNVIzbEZiQXMvSElpUVJjYW4vdnJ5?=
 =?utf-8?B?Q0orQk50a2lJcENZOWM2d1dIZlBtVnh6WlJhRGJnVjNxdHh3dXZmbnlkUnpC?=
 =?utf-8?B?aGZSelJUb2RRZWFQM2hLN2puL3NMNmF3MWN3d1lZdzR3NVA1c2lLUE9pa1JG?=
 =?utf-8?B?dENNeTlpRmk5eXhBamh3SDZtbVZqdUFTejRSWGREVnNsaXRrcDhaRThPQ045?=
 =?utf-8?B?Wlh0S0dzNGdLN3hvZ0tLM1RRVHdxYVBKL1hIWmtObGFjakNtQ25aeW1sSkF5?=
 =?utf-8?B?QndRL2lPSVhZOU1ld3B2ZVZoNjRSM3R6cGFCZkNUbklkdEpQaWhxZVJhNlNp?=
 =?utf-8?B?eWtjTDZQVEVkV1RLcFUyV3d5Snpad0ZMek9GMVZVanZRZjVrNjFvVmZuZldm?=
 =?utf-8?B?alE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AE5A79C8347D064499C64D8654A053CB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2db02ed6-2739-4450-4f2c-08dca0e96344
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2024 14:05:43.2734 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dFCF2sSde8ZlcrzdTiN0QzO9nvMNZK+RVaVSsTRZQmuDzoPGgzx9hZK7WfkHelOU6A9/9qEYsv36Hi5mC9pmjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7395
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

T24gVHVlLCAyMDI0LTA3LTA5IGF0IDIyOjUzIC0wNzAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IFBWQywgWGUyIGFuZCBsYXRlciBwbGF0Zm9ybXMgaGF2ZSBhIDE2IHdpZGUgRVUuIFdlIHdl
cmUgaW1wbGljaXRseQ0KPiByZXBvcnRpbmcgZm9yIFBWQyB0aGUgbnVtYmVyIG9mIDE2LXdpZGUg
RVVzIHdpdGhvdXQgZ2l2aW5nIHVzZXJzcGFjZSBhbnkNCj4gaGludCB0aGF0IHRoZXkgd2VyZSBk
aWZmZXJlbnQgdGhhbiBmb3Igb3RoZXIgcGxhdGZvcm1zLiBYZTIgYW5kIGxhdGVyDQo+IGFsc28g
aGF2ZSAxNi13aWRlLCBidXQgaW4gdGhvc2UgY2FzZSB0aGUgcmVwb3J0ZWQgbnVtYmVyIHdvdWxk
DQo+IGNvcnJlc3BvbmQgdG8gdGhlIDgtd2lkZSBjb3VudC4NCj4gDQo+IEFkZCBhIG5ldyBpdGVt
IHRvIHRoZSB0b3BvbG9neSB0aGF0IGFpbXMgdG8gY2xhcmlmeSB3aGF0IHRoZSBFVV9QRVJfRFNT
DQo+IG1hc2sgbWVhbnMuIFRoaXMgbmV3IGl0ZW0gdXNlcyBtYXNrW10gYXMgYSBzaW5nbGUgdTgg
dmFsdWUuIFhlMiBhbmQNCj4gbGF0ZXIgcGxhdGZvcm1zIHN0YXJ0IHJldHVybmluZyB0aGUgbnVt
YmVyIG9mIFNJTUQxNiBFVXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMdWNhcyBEZSBNYXJjaGkg
PGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4gLS0tDQo+IA0KPiBUZXN0ZWQgb24gVEdMIGFu
ZCBMTkwgdG8gY2hlY2sgdGhlIGJlaGF2aW9yIGluIGRtZXNnLCBkZWJ1Z2ZzIGFuZCBpb2N0bC4N
Cj4gVGVzdC13aXRoOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9pZ3QtZGV2LzIwMjQwNzEwMDU0
NDQ2LjE5ODUwNjktMS1sdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20vDQo+IA0KPiAgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2d0X3RvcG9sb2d5LmMgfCAxMyArKysrKysrKy0tLS0tDQo+ICBkcml2ZXJz
L2dwdS9kcm0veGUveGVfZ3RfdHlwZXMuaCAgICB8ICA2ICsrKysrKw0KPiAgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3F1ZXJ5LmMgICAgICAgfCAxMiArKysrKysrKysrLS0NCj4gIGluY2x1ZGUvdWFw
aS9kcm0veGVfZHJtLmggICAgICAgICAgIHwgMjAgKysrKysrKysrKysrKysrKysrKysNCj4gIDQg
ZmlsZXMgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdG9wb2xvZ3kuYyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9ndF90b3BvbG9neS5jDQo+IGluZGV4IDI1ZmYwM2FiODQ0OC4uNTVhZTFj
NzkwNDhmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdG9wb2xvZ3ku
Yw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdG9wb2xvZ3kuYw0KPiBAQCAtMzEs
NyArMzEsNyBAQCBsb2FkX2Rzc19tYXNrKHN0cnVjdCB4ZV9ndCAqZ3QsIHhlX2Rzc19tYXNrX3Qg
bWFzaywgaW50IG51bXJlZ3MsIC4uLikNCj4gIH0NCj4gIA0KPiAgc3RhdGljIHZvaWQNCj4gLWxv
YWRfZXVfbWFzayhzdHJ1Y3QgeGVfZ3QgKmd0LCB4ZV9ldV9tYXNrX3QgbWFzaykNCj4gK2xvYWRf
ZXVfbWFzayhzdHJ1Y3QgeGVfZ3QgKmd0LCB4ZV9ldV9tYXNrX3QgbWFzaywgdTggKmV1X3dpZHRo
KQ0KPiAgew0KPiAgCXN0cnVjdCB4ZV9kZXZpY2UgKnhlID0gZ3RfdG9feGUoZ3QpOw0KPiAgCXUz
MiByZWdfdmFsID0geGVfbW1pb19yZWFkMzIoZ3QsIFhFTFBfRVVfRU5BQkxFKTsNCj4gQEAgLTQ3
LDExICs0NywxMyBAQCBsb2FkX2V1X21hc2soc3RydWN0IHhlX2d0ICpndCwgeGVfZXVfbWFza190
IG1hc2spDQo+ICAJaWYgKEdSQVBISUNTX1ZFUngxMDAoeGUpIDwgMTI1MCkNCj4gIAkJcmVnX3Zh
bCA9IH5yZWdfdmFsICYgWEVMUF9FVV9NQVNLOw0KPiAgDQo+IC0JLyogT24gUFZDLCBvbmUgYml0
ID0gb25lIEVVICovDQo+IC0JaWYgKEdSQVBISUNTX1ZFUngxMDAoeGUpID09IDEyNjApIHsNCj4g
KwlpZiAoR1JBUEhJQ1NfVkVSeDEwMCh4ZSkgPT0gMTI2MCB8fCBHUkFQSElDU19WRVIoeGUpID49
IDIwKSB7DQo+ICsJCS8qIFNJTUQxNiBFVXMsIG9uZSBiaXQgPSBvbmUgRVUgKi8NCj4gKwkJKmV1
X3dpZHRoID0gRFJNX1hFX1RPUE9fRVVfV0lEVEhfU0lNRDE2Ow0KDQpJbiBteSBvcGluaW9uIHdv
dWxkIGJlIGJldHRlciB0byByZXR1cm4gdGhlIGFjdHVhbC9IVyBFVSBjb3VudCBhbmQgbGVnYWN5
L1dpbmRvd3MvTWFya2V0aW5nIEVVIGNvdW50Lg0KDQo+ICAJCXZhbCA9IHJlZ192YWw7DQo+ICAJ
fSBlbHNlIHsNCj4gLQkJLyogQWxsIG90aGVyIHBsYXRmb3Jtcywgb25lIGJpdCA9IDIgRVUgKi8N
Cj4gKwkJLyogU0lNRDggRVVzLCBvbmUgYml0ID0gMiBFVSAqLw0KPiArCQkqZXVfd2lkdGggPSBE
Uk1fWEVfVE9QT19FVV9XSURUSF9TSU1EODsNCj4gIAkJZm9yIChpID0gMDsgaSA8IGZscyhyZWdf
dmFsKTsgaSsrKQ0KPiAgCQkJaWYgKHJlZ192YWwgJiBCSVQoaSkpDQo+ICAJCQkJdmFsIHw9IDB4
MyA8PCAyICogaTsNCj4gQEAgLTIxMyw3ICsyMTUsNyBAQCB4ZV9ndF90b3BvbG9neV9pbml0KHN0
cnVjdCB4ZV9ndCAqZ3QpDQo+ICAJCSAgICAgIFhFSFBfR1RfQ09NUFVURV9EU1NfRU5BQkxFLA0K
PiAgCQkgICAgICBYRUhQQ19HVF9DT01QVVRFX0RTU19FTkFCTEVfRVhULA0KPiAgCQkgICAgICBY
RTJfR1RfQ09NUFVURV9EU1NfMik7DQo+IC0JbG9hZF9ldV9tYXNrKGd0LCBndC0+ZnVzZV90b3Bv
LmV1X21hc2tfcGVyX2Rzcyk7DQo+ICsJbG9hZF9ldV9tYXNrKGd0LCBndC0+ZnVzZV90b3BvLmV1
X21hc2tfcGVyX2RzcywgJmd0LT5mdXNlX3RvcG8uZXVfd2lkdGgpOw0KPiAgCWxvYWRfbDNfYmFu
a19tYXNrKGd0LCBndC0+ZnVzZV90b3BvLmwzX2JhbmtfbWFzayk7DQo+ICANCj4gIAlwID0gZHJt
X2RiZ19wcmludGVyKCZndF90b194ZShndCktPmRybSwgRFJNX1VUX0RSSVZFUiwgIkdUIHRvcG9s
b2d5Iik7DQo+IEBAIC0yMzEsNiArMjMzLDcgQEAgeGVfZ3RfdG9wb2xvZ3lfZHVtcChzdHJ1Y3Qg
eGVfZ3QgKmd0LCBzdHJ1Y3QgZHJtX3ByaW50ZXIgKnApDQo+ICANCj4gIAlkcm1fcHJpbnRmKHAs
ICJFVSBtYXNrIHBlciBEU1M6ICAgICAlKnBiXG4iLCBYRV9NQVhfRVVfRlVTRV9CSVRTLA0KPiAg
CQkgICBndC0+ZnVzZV90b3BvLmV1X21hc2tfcGVyX2Rzcyk7DQo+ICsJZHJtX3ByaW50ZihwLCAi
RVUgd2lkdGg6ICAgICAgICAgICAgJXVcbiIsIGd0LT5mdXNlX3RvcG8uZXVfd2lkdGgpOw0KPiAg
DQo+ICAJZHJtX3ByaW50ZihwLCAiTDMgYmFuayBtYXNrOiAgICAgICAgJSpwYlxuIiwgWEVfTUFY
X0wzX0JBTktfTUFTS19CSVRTLA0KPiAgCQkgICBndC0+ZnVzZV90b3BvLmwzX2JhbmtfbWFzayk7
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdHlwZXMuaCBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndF90eXBlcy5oDQo+IGluZGV4IDZiNWUwYjQ1ZWZiMC4uNzFiNDgz
NDA4MGY1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdHlwZXMuaA0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdHlwZXMuaA0KPiBAQCAtMzQzLDYgKzM0
MywxMiBAQCBzdHJ1Y3QgeGVfZ3Qgew0KPiAgDQo+ICAJCS8qKiBAZnVzZV90b3BvLmwzX2Jhbmtf
bWFzazogTDMgYmFuayBtYXNrICovDQo+ICAJCXhlX2wzX2JhbmtfbWFza190IGwzX2JhbmtfbWFz
azsNCj4gKw0KPiArCQkvKioNCj4gKwkJICogQGZ1c2VfdG9wby5ldV93aWR0aDogRVUgd2lkdGgg
LSBTSU1EOCwgU0lNRDE2LCBldGMuIFNlZQ0KPiArCQkgKiBlbnVtIGRybV94ZV90b3BvX2V1X3dp
ZHRoLg0KPiArCQkgKi8NCj4gKwkJdTggZXVfd2lkdGg7DQo+ICAJfSBmdXNlX3RvcG87DQo+ICAN
Cj4gIAkvKiogQHN0ZWVyaW5nOiByZWdpc3RlciBzdGVlcmluZyBmb3IgaW5kaXZpZHVhbCBIVyB1
bml0cyAqLw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMgYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYw0KPiBpbmRleCA0ZTAxZGY2YjFiN2EuLjgyYzk2
NmI3MzMwMiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMNCj4gQEAgLTQ1NSwxMSArNDU1LDEy
IEBAIHN0YXRpYyBpbnQgcXVlcnlfaHdjb25maWcoc3RydWN0IHhlX2RldmljZSAqeGUsDQo+ICBz
dGF0aWMgc2l6ZV90IGNhbGNfdG9wb19xdWVyeV9zaXplKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0K
PiAgew0KPiAgCXJldHVybiB4ZS0+aW5mby5ndF9jb3VudCAqDQo+IC0JCSg0ICogc2l6ZW9mKHN0
cnVjdCBkcm1feGVfcXVlcnlfdG9wb2xvZ3lfbWFzaykgKw0KPiArCQkoNSAqIHNpemVvZihzdHJ1
Y3QgZHJtX3hlX3F1ZXJ5X3RvcG9sb2d5X21hc2spICsNCj4gIAkJIHNpemVvZl9maWVsZChzdHJ1
Y3QgeGVfZ3QsIGZ1c2VfdG9wby5nX2Rzc19tYXNrKSArDQo+ICAJCSBzaXplb2ZfZmllbGQoc3Ry
dWN0IHhlX2d0LCBmdXNlX3RvcG8uY19kc3NfbWFzaykgKw0KPiAgCQkgc2l6ZW9mX2ZpZWxkKHN0
cnVjdCB4ZV9ndCwgZnVzZV90b3BvLmwzX2JhbmtfbWFzaykgKw0KPiAtCQkgc2l6ZW9mX2ZpZWxk
KHN0cnVjdCB4ZV9ndCwgZnVzZV90b3BvLmV1X21hc2tfcGVyX2RzcykpOw0KPiArCQkgc2l6ZW9m
X2ZpZWxkKHN0cnVjdCB4ZV9ndCwgZnVzZV90b3BvLmV1X21hc2tfcGVyX2RzcykgKw0KPiArCQkg
c2l6ZW9mX2ZpZWxkKHN0cnVjdCB4ZV9ndCwgZnVzZV90b3BvLmV1X3dpZHRoKSk7DQo+ICB9DQo+
ICANCj4gIHN0YXRpYyBpbnQgY29weV9tYXNrKHZvaWQgX191c2VyICoqcHRyLA0KPiBAQCAtNTI0
LDYgKzUyNSwxMyBAQCBzdGF0aWMgaW50IHF1ZXJ5X2d0X3RvcG9sb2d5KHN0cnVjdCB4ZV9kZXZp
Y2UgKnhlLA0KPiAgCQkJCXNpemVvZihndC0+ZnVzZV90b3BvLmV1X21hc2tfcGVyX2RzcykpOw0K
PiAgCQlpZiAoZXJyKQ0KPiAgCQkJcmV0dXJuIGVycjsNCj4gKw0KPiArCQl0b3BvLnR5cGUgPSBE
Uk1fWEVfVE9QT19FVV9XSURUSDsNCj4gKwkJZXJyID0gY29weV9tYXNrKCZxdWVyeV9wdHIsICZ0
b3BvLA0KPiArCQkJCSZndC0+ZnVzZV90b3BvLmV1X3dpZHRoLA0KPiArCQkJCXNpemVvZihndC0+
ZnVzZV90b3BvLmV1X3dpZHRoKSk7DQo+ICsJCWlmIChlcnIpDQo+ICsJCQlyZXR1cm4gZXJyOw0K
PiAgCX0NCj4gIA0KPiAgCXJldHVybiAwOw0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2Ry
bS94ZV9kcm0uaCBiL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gaW5kZXggMTk2MTlkNDk1
MmE4Li42MTE0YTkwNjQ4NDkgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJt
LmgNCj4gKysrIGIvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiBAQCAtNDkxLDYgKzQ5MSwx
OSBAQCBzdHJ1Y3QgZHJtX3hlX3F1ZXJ5X2d0X2xpc3Qgew0KPiAgCXN0cnVjdCBkcm1feGVfZ3Qg
Z3RfbGlzdFtdOw0KPiAgfTsNCj4gIA0KPiArZW51bSBkcm1feGVfdG9wb19ldV93aWR0aCB7DQo+
ICsJLyoqDQo+ICsJICogQERSTV9YRV9UT1BPX0VVX1dJRFRIX1NJTUQ4IC0gRVVzIHJlcG9ydGVk
IHdpdGgNCj4gKwkgKiBEUk1fWEVfVE9QT19FVV9QRVJfRFNTIGhhdmUgU0lNRDggd2lkdGgNCj4g
KwkgKi8NCj4gKwlEUk1fWEVfVE9QT19FVV9XSURUSF9TSU1EOCA9IDAsDQo+ICsJLyoqDQo+ICsJ
ICogQERSTV9YRV9UT1BPX0VVX1dJRFRIX1NJTUQxNiAtIEVVcyByZXBvcnRlZCB3aXRoDQo+ICsJ
ICogRFJNX1hFX1RPUE9fRVVfUEVSX0RTUyBoYXZlIFNJTUQxNiB3aWR0aA0KPiArCSAqLw0KPiAr
CURSTV9YRV9UT1BPX0VVX1dJRFRIX1NJTUQxNiwNCj4gK307DQo+ICsNCj4gIC8qKg0KPiAgICog
c3RydWN0IGRybV94ZV9xdWVyeV90b3BvbG9neV9tYXNrIC0gZGVzY3JpYmUgdGhlIHRvcG9sb2d5
IG1hc2sgb2YgYSBHVA0KPiAgICoNCj4gQEAgLTUxOCw2ICs1MzEsMTIgQEAgc3RydWN0IGRybV94
ZV9xdWVyeV9ndF9saXN0IHsNCj4gICAqICAgIGNvbnRhaW5pbmcgdGhlIGZvbGxvd2luZyBpbiBt
YXNrOg0KPiAgICogICAgYGBFVV9QRVJfRFNTICAgIGZmIGZmIDAwIDAwIDAwIDAwIDAwIDAwYGAN
Cj4gICAqICAgIG1lYW5zIGVhY2ggRFNTIGhhcyAxNiBFVS4NCj4gKyAqICAtICVEUk1fWEVfVE9Q
T19FVV9XSURUSCAtIFRvIHF1ZXJ5IHRoZSB3aWR0aCBvZiBFVXMgYXMgcGVyDQo+ICsgKiAgICBl
bnVtIGRybV94ZV90b3BvX2V1X3dpZHRoLiBJdCBhbHdheXMgaGFzIG51bV9ieXRlcyA9PSAxIGFu
ZCB0aGUgb25seSBieXRlDQo+ICsgKiAgICBpbiB0aGUgbWFzayBiZWluZyB0aGUgdmFsdWUuIEZv
ciBleGFtcGxlLCBhIHF1ZXJ5IHJlc3BvbnNlIGNvbnRhaW5pbmcgdGhlDQo+ICsgKiAgICBmb2xs
b3dpbmcgaW4gbWFzazoNCj4gKyAqICAgIGBgRVVfV0lEVEggICAgMDBgYA0KPiArICogICAgbWVh
bnMgdGhlIEVVcyBhcmUgU0lNRDguDQo+ICAgKi8NCj4gIHN0cnVjdCBkcm1feGVfcXVlcnlfdG9w
b2xvZ3lfbWFzayB7DQo+ICAJLyoqIEBndF9pZDogR1QgSUQgdGhlIG1hc2sgaXMgYXNzb2NpYXRl
ZCB3aXRoICovDQo+IEBAIC01MjcsNiArNTQ2LDcgQEAgc3RydWN0IGRybV94ZV9xdWVyeV90b3Bv
bG9neV9tYXNrIHsNCj4gICNkZWZpbmUgRFJNX1hFX1RPUE9fRFNTX0NPTVBVVEUJCTINCj4gICNk
ZWZpbmUgRFJNX1hFX1RPUE9fTDNfQkFOSwkJMw0KPiAgI2RlZmluZSBEUk1fWEVfVE9QT19FVV9Q
RVJfRFNTCQk0DQo+ICsjZGVmaW5lIERSTV9YRV9UT1BPX0VVX1dJRFRICQk1DQo+ICAJLyoqIEB0
eXBlOiB0eXBlIG9mIG1hc2sgKi8NCj4gIAlfX3UxNiB0eXBlOw0KPiAgDQoNCg==
