Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566C3D2A542
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 19:13:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2485110E756;
	Wed, 16 Oct 2024 19:13:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GIWEnUqf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AECA410E756
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Oct 2024 19:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729106016; x=1760642016;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=niZ6LooJ9oCfKLT/RNIsmIpx7KDNLLm9eN0OQUSWLLs=;
 b=GIWEnUqfnfxLAx4bNw7FlrhIyax3CfW2Ij26ZwXakTH2ry9pO7H6YHf6
 kduegkC+v806NboqD3EtzwtassubHqqxvPogJcm9hkQ+o5kCMfc+nHaQW
 yk4mHtsDS2I57mIZFRMLLM9ABSgn3xTPTr8+P+1BTAghMWlUFul9MN7hM
 gAAYJVwvRa57u9VQJX5nFWAghQ7ql1UjQ7Gr1Fy0BUr0guEBvK6aKK+Cu
 PiiVAsJjDjadJF2HwdM6MVKHeViA7ztia/SfIcfM2QNADc89S5ySF8D/F
 DMEOxfk5HEvCcl/sRFP8aTpmm3PvRTFUzvsXbU7sA+hM6jn0hD0PzF29a g==;
X-CSE-ConnectionGUID: aOQC5ErmTcqfdD2atoOxgg==
X-CSE-MsgGUID: eCwEvigZRWCCN2b6xCu6EQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="39204049"
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="39204049"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 12:13:35 -0700
X-CSE-ConnectionGUID: QO7xlvAWQee48txki11Cjg==
X-CSE-MsgGUID: WjG2YcAiRCqpQOqVk9vG3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="78478142"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2024 12:13:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 12:13:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 16 Oct 2024 12:13:34 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 16 Oct 2024 12:13:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NETHXj69fGvwvYxbVmUhSDYTvaARxrp8V1x79+h2zitRDMUiIT0BH43NzOVUauEst2n8Qk8nTLs3Hdsnoy6+/D2WQZ0JPTocgszG8VPGMjMJJxsnKdtOaYg3ywoI+99EseRXA53FJBcLKtncUHsk5Tf2M8TrlbSqQ/hqtbIVSdEBBU3eKM8QTE8WlfPMJIj0lDFXf9/ODuYdut0E6Ay/ILB+PJs05BQQg448WXUJ83ARjGjS1uPqTEJrFNVUFLX/JtpslbLIhcCLSug0k9PHgC/TrR/ewr+KQkHy+YaEy4Uq5D/4bt+fmjWtdWfdmnbthL8sVDmhQIyEJZy4nfcPWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=niZ6LooJ9oCfKLT/RNIsmIpx7KDNLLm9eN0OQUSWLLs=;
 b=jKn0rBHh5cRsIvHXQ8ORjHlDtFmEguwERtD/K1pYRUITPnWWUTKAiJOUaVn3zV3rrVblRgByZrrs4i0JoRzlmkd/YFcUuGldnzcYegW7Y4rQ908gPxCdtpW+OUzWkgcA6uTsVft15j6KViYoNUAxJ9eDCSfSMPOGOEldoxv2iHNGIdZsV8o3PJteW92Y5//lRotHjTUXZZEeDfze+2kh51sPp9dhBlodO8+i2B5yGJGHf6BhTEJbS1SqWDY3vHQDs2bRgHqwmBO26BdSprVp8UVeqRK4rEAUHuq0G8yo/P+dEFQCNzTfHrAUzHjB6vpjSQ0SGlkgl4I8pvYbS6iafw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Wed, 16 Oct
 2024 19:13:31 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb%5]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 19:13:31 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Yang, 
 Fei" <fei.yang@intel.com>
Subject: Re: [PATCH 1/1] drm/xe: enable lite restore
Thread-Topic: [PATCH 1/1] drm/xe: enable lite restore
Thread-Index: AQHbH/zCq5SLhlIoWU+dBtyzNo10RLKJvv2A
Date: Wed, 16 Oct 2024 19:13:31 +0000
Message-ID: <382341ca84abda4653f56b99690a9a63de882a35.camel@intel.com>
References: <20241016185726.907844-1-fei.yang@intel.com>
 <20241016185726.907844-2-fei.yang@intel.com>
In-Reply-To: <20241016185726.907844-2-fei.yang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8185:EE_|PH7PR11MB6449:EE_
x-ms-office365-filtering-correlation-id: 2414ab31-8d8c-42db-5fdd-08dcee169fa0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?clpqRVZxY1lmTm01N0R1YWt3Ull3NzhFRjBVUityb2x6QjNCS0NrSTBzb0hi?=
 =?utf-8?B?anhJSjFxWk5acFpRdjZTV0cyZk10d1h6dFQwSGEwN2hGQzc4VzJRZExrMmpE?=
 =?utf-8?B?azRGbWNVZnFKTkZzamNEV000aHNaeEFsblYrOGIzektTa0JXbnkyeUl5cEg1?=
 =?utf-8?B?YXFrbHRjOVp0aDMwSC9hUEIzZ2pFTTVia1FMOVNEQ09FSHRGUmxpNk1ibVZH?=
 =?utf-8?B?WEEwemkxTWd5ZGVyYk5oWGJVYklDWVlTR21VOTk4WFZWbmd6dzVHVEpwOVBM?=
 =?utf-8?B?K0ROMGFUM0gwOWVXMmFRUGw0ZHRuenRQamZUU3JOYVoweHYvT2JWam1IQWZJ?=
 =?utf-8?B?M1k3YUttWmRySTIvK2JvL3dham1LT3lNUEpKbGtPc1ltL2VURnJ6Vkd5MUdP?=
 =?utf-8?B?Um9Bb080QnVXZmg0NzBWMjB0VnpYNWN3M3o1dkJ5QTNOdnZFTDhBbXZXcXNs?=
 =?utf-8?B?UHpreGdTRlp2d0R4TTk2SnlpK01PajB6T24zSCtpWGxaMzhvdGVNNHVwOVdo?=
 =?utf-8?B?SlRGS211U241OW82WVF1OWtPeVN6WVlVWFFpaVp5RUNJZ2tSMzBidUZsb0cz?=
 =?utf-8?B?NVl0bXYybkhGdVJYMWM2NmxlNWwxQ0RpUEY4bWdMUTlSaS93UG5iOE5sUTl2?=
 =?utf-8?B?NHlNcEJCeTk0RWc3Z3FSanAvTllLUXdKRFIvNHJYVlFndjFLNlBIazIyNUJ5?=
 =?utf-8?B?YXhjS1lSNWY4Z1FBTEo0Q0VCd2ZZUm0zSndWVUtjWTk0eVFMYTlFbUZDOGlH?=
 =?utf-8?B?WXc3eEwzN0l4aW9aUitGd0t0L1Fpa0NZYmtQY3lIQVdBelAyNDhDUHdsckZN?=
 =?utf-8?B?NEtzVUJ1ZWkwemVnaWtvMWhUam81d3YyNnNkSkRYbkYyTExmNmE0VG9kR1d0?=
 =?utf-8?B?aGM2bzd5bzFQNUFHTEZkMTdhQWRUWjIxZjZYbHpWV29wbnFzTllBMVpBc2dx?=
 =?utf-8?B?TEt4MDVmb3p2OXI2Yzk0T2J5WElRWmoxVWZia240VTNVWEo3UzM4b3h3Nmdj?=
 =?utf-8?B?dlN6dXpvK0YyVE9TRjNGa3hOMWU3YTgrY0w4TzBMMmZHOTJZOWJ0WkFta2lP?=
 =?utf-8?B?R2FMemdJc1dGaHB2a0pLdnAwbFdrR2NzTHZPNjZlaUp2L1dIbmIxalRNbStH?=
 =?utf-8?B?UlJESzlONHJxRnMxRWI1WFF5U01CblIzVHkramtwdVdIZzdPUTJDelYyVWZo?=
 =?utf-8?B?TzZqUDBnY0ltazhJRTlKRmRYOHNNZm5oM1J2UGh4aCtCMUlwa2RSamFoenIz?=
 =?utf-8?B?SkpjK09DMjBlS3pYVDBqQUMwRXY0RHFjUEZXV1pVdnJXQnJxTCtjMTUwKzFG?=
 =?utf-8?B?NDI5U2IwWXJidVpxeTBIck5adGUyVERJc0JrcGlxRUxGT1o3cjhobEVEVy90?=
 =?utf-8?B?eVkxOG1yenFtOXNDVDFjM1hWQ2RycGJtV2w0K0w1Z3I3M0V0ZFh3RE5xKzZl?=
 =?utf-8?B?T0d6STJUTWN1bWFBVmNMZVVpQURubDZ3dGFPT2NMZVF2U3hnaUtkT3dBNzJh?=
 =?utf-8?B?Ym1rTEVFM3Q0VDdTempjU0F6UVFReURBdXRJNk00OGJtL01YVkcxSUo0Y0tx?=
 =?utf-8?B?VnF0Z1hkWnF2czVwNS93NXZRQUpsbDFySmcwRUtiKzlySjlrWFlFWmdFOUJn?=
 =?utf-8?B?cTNhajdxMS93OTZzQjVtSlh1c3ZEcHY5R01icEczTzV5UndtRHI5bHRnajlm?=
 =?utf-8?B?ZnVaWHd2STFtZlcrUGhHU0hreUhTMDNESTEvRERSTm5KcTVCSURnMTNPemto?=
 =?utf-8?B?UEhwSVd5RHJ3bGxFNm1VZlFzSkpmRDBnWnluWnZLQ2RIUTV0dzk2NnVQeDFM?=
 =?utf-8?B?Y3QzUXFPbk9OREpLdmZNdz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Nmg2U2Y2aHJFa3ZOd2hXSU8wMkJiaGFFWllLWFVjWFBjVUZxc0tvT2lZSng5?=
 =?utf-8?B?dnB0SzAxeDU4Q3F5eFZDT21UT2VLSm11R25uQ3ZlRm1ydmNCcjR0cXZtUVA0?=
 =?utf-8?B?M3NlZ0ZUdTFicUhqc2RIRVhKWHpjR1FmcXJHTHhqOHlLd05lcVc5aGJOZ25Y?=
 =?utf-8?B?aUdaRjB1WktQNVdzMExzTjFqdnZ4YU1yZ2hPdXBxaTErb3lxRFozRS81T2s5?=
 =?utf-8?B?OHBoM2dKLzlPUjBqTlEwRTlZN1VxakFoejJiYmxoZHlLclBuQXFQbzh6akwy?=
 =?utf-8?B?anJidGh3bUkzU1ZhU0x0Y284b08xYTZCTU5oM1FuMmhjcHFacVBBZ3Q3eEVi?=
 =?utf-8?B?eXREQUw5VUdNMGJJSklqVHpKRlhTbStERU5MVXIwMTZ2U3ZjakRNMEtTOURL?=
 =?utf-8?B?ekx3K2QwVWwvRlBENFl5MjMyLzN3eEVFaEt6S09hNno5SUw1ZjB6bnpzaU9o?=
 =?utf-8?B?S3VEU293elBRL2ZrRTVWb3RKdmFybmxJVFJ0M0ZCVlBkRlprUFZHdFk5NjFC?=
 =?utf-8?B?NzBkSHhkeDlOQzZROGtJUlFFN3hzb3lLK05QWXpWSm9ZOGI4K2x5NE5LUEgw?=
 =?utf-8?B?cjFpa1Fja2x4bFJDdG1CbVd4U2U3d2g3RmoxOFJSc1hodkVMbGxPNG1BM2Y3?=
 =?utf-8?B?eHIyYis3eUV2S1p0N2l6R3RLN1lEYTU5N1ZVN1dCSVprZTR3eER0YjR0RVg4?=
 =?utf-8?B?LzRMdTc2SXlVcTZ0Qk50MFhjYVNSSFlkREVHejVmWnB5SDNjeWkrUktCczlw?=
 =?utf-8?B?VXI4OVpPRFpCMUFON2tUbytxOSs1SVhZMHg0UktVblhld09zbDE2UzFDd01w?=
 =?utf-8?B?UEtKYmxvblljOHNqSG1yYmpyVmNoeSt4bWptdlVWdW9CNHlyYVZJUlBiNkdT?=
 =?utf-8?B?blZMcmtQc3BZd0FCVW11Y1BTQUhBaVRkMlUxSjFQUkRTQnY0M0hBaERqSHBZ?=
 =?utf-8?B?NUZpOWJxUnNlMm1oSHpmR0VWMHQ4QnhOZkJrY3V1Y0ZJelBta0MxMll4LzVh?=
 =?utf-8?B?SlkyR2pVcDlFYkV2dUdRUU9XcWxINlJVYWtKdDB1V3k2Q2wzUGkvcmg4akJB?=
 =?utf-8?B?TEE1NElWd3A5L3A4KzZ6dHlBZ09xK1o2K3dzSTFqb1RtUTFsUlpma09zT2Vp?=
 =?utf-8?B?aWdOQmM4dC8xMVhpOFFORE5Ydko0QkZtZWFZcTVYazlwN3R0dkZwMVBUdXhl?=
 =?utf-8?B?eU5MZUJveTlaNERHODg0cks5MU5oQUh4VUFnaFQvODZVQjNpcTVidEVxeVNP?=
 =?utf-8?B?V3Avdm9RUjBZWStlbzQxWEhZV2pWN1hRcFJnTG8yR0RZenBxNVE1ajA4cEM0?=
 =?utf-8?B?MUcyQjB1VFk5bVQ3d0VhMUo3SWExck5sbisvSG5QdjVIZ2xPTldoc1lOdVUr?=
 =?utf-8?B?dHI2NHBoc1hVYzQ0VFppaGtneEk2S3BVY3J6S0JUeVBaUEpmZkUvU0d4TFRh?=
 =?utf-8?B?ZTdZV1p0V2NhZFBIVHFDRExBQXFXWHNwNElNK0FJcmxGOUdPZzdhb09NcUx4?=
 =?utf-8?B?WkRMUW93Y28vNEJsczFQNXlPeGRGUjlvQSs3VTRHVmNCRU5wZXQwTDBNNzJs?=
 =?utf-8?B?UVNIZnBaRVhZcjl4STFoRVc0R3U0dkZjQkErMVBWVnZ4cDhFSzAvS1lULzBj?=
 =?utf-8?B?TWxyRWcvYWliTHBLWU5RQ2NvSjRlQ2JvbkNzQXBzaGRMeVQ2ano0RWpLRGxG?=
 =?utf-8?B?MU1WR1hZZVl2Sll1ZXp4Tmt3dkttSStCVzlwSGVhZGEwRG1mQU9xNVI0ZzFy?=
 =?utf-8?B?QkR3UE55WkpEcGZ0ZitYLzNLcENMUTJEeVAxUmt6RVdFSEIySVdEUDN3SGZr?=
 =?utf-8?B?L3BaeDQrWlZYWXNpaFM5S0g2cXBUc3dXN1l0d2RhVFJ6ekV1U016RGRjYzBP?=
 =?utf-8?B?RHQ0bGVEaE9aSkFlcWZGQithbk5aWVJxYnRQRDFZNnFUUG4xd2t0dGV0NU1q?=
 =?utf-8?B?Y0ExMTdQcU93Ulo1VWZDWVlXSnRzeUltM2IzMmJiNGZMTDNEV0gzekNnaFVx?=
 =?utf-8?B?M2Y3Q04vS29pRzhVTmxvVTFSVnd4Qkt3dm1NNTlmY2trZ3ZGcnJDYllmak5l?=
 =?utf-8?B?RkVZZG1nOG1BRm1zZGRlQWNHcXVRME1veVhadVQvSjBKejEyL3N5eFRVUlFX?=
 =?utf-8?B?K1BvRzEvcm1oeVplaE1YS0lKYVc5SlhveEhiMlpUMzJ6bFIwSlJzbjFmSzJZ?=
 =?utf-8?B?OEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DBF4E1D497DC3349A04DBA6053D75230@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2414ab31-8d8c-42db-5fdd-08dcee169fa0
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2024 19:13:31.4434 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: agE7Ca+zzbQvfEktWVTgoUdD8MmMD1603nnTzL1rFSJxMaBLPV51WGC03eC+FqRXRWC4ZsQNj6bwEtyQ8zYO6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6449
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

T24gV2VkLCAyMDI0LTEwLTE2IGF0IDExOjU3IC0wNzAwLCBmZWkueWFuZ0BpbnRlbC5jb20gd3Jv
dGU6DQo+IEZyb206IEZlaSBZYW5nIDxmZWkueWFuZ0BpbnRlbC5jb20+DQo+IA0KPiBUaGUgbGl0
ZSByZXN0b3JlIGlzIGEgcGVyZm9ybWFuY2UgaW1wcm92ZW1lbnQgZmVhdHVyZSB3aGljaCBhdm9p
ZHMNCj4gdW5uZWNlc3NhcnkgZnVsbCBjb250ZXh0IHNhdmUgYW5kIHJlc3RvcmUgaWYgdGhlIHRh
c2sgYmVlbiBzd2l0Y2hlZA0KPiBpbiBpcyB0aGUgc2FtZSBhcyB0aGUgb25lIGJlZW4gc3dpdGNo
ZWQgb3V0LiBUaGlzIGlzIHN1cHBvc2VkIHRvIGJlDQo+IGVuYWJsZWQgYnkgZGVmYXVsdC4NCg0K
aW4gdGhlIHNhbWUgd2hhdD8gZW5naW5lPw0KcGxlYXNlIGFwcGVuZCB0aGF0IHRvIGNvbW1pdCBt
ZXNzYWdlLg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBGZWkgWWFuZyA8ZmVpLnlhbmdAaW50ZWwu
Y29tPg0KPiBDYzogSm9obiBIYXJyaXNvbiA8Sm9obi5DLkhhcnJpc29uQEludGVsLmNvbT4NCj4g
LS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjLmMgICAgICB8IDIgKy0NCj4gIGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndWNfZndpZi5oIHwgMSArDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9ndWMuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuYw0KPiBpbmRl
eCA4NTcwYjEyMTgyODcuLmZlZDMwZjI4NzJmNyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2d1Yy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuYw0KPiBA
QCAtNzAsNyArNzAsNyBAQCBzdGF0aWMgdTMyIGd1Y19jdGxfZGVidWdfZmxhZ3Moc3RydWN0IHhl
X2d1YyAqZ3VjKQ0KPiAgDQo+ICBzdGF0aWMgdTMyIGd1Y19jdGxfZmVhdHVyZV9mbGFncyhzdHJ1
Y3QgeGVfZ3VjICpndWMpDQo+ICB7DQo+IC0JdTMyIGZsYWdzID0gMDsNCj4gKwl1MzIgZmxhZ3Mg
PSBHVUNfQ1RMX0VOQUJMRV9MSVRFX1JFU1RPUkU7DQo+ICANCj4gIAlpZiAoIWd1Y190b194ZShn
dWMpLT5pbmZvLnNraXBfZ3VjX3BjKQ0KPiAgCQlmbGFncyB8PSBHVUNfQ1RMX0VOQUJMRV9TTFBD
Ow0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19md2lmLmggYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2Z3aWYuaA0KPiBpbmRleCAwMWUzYWI1OTBjM2EuLjA4ZmZl
NTlmMjJmYSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19md2lmLmgN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19md2lmLmgNCj4gQEAgLTEwNSw2ICsx
MDUsNyBAQCBzdHJ1Y3QgZ3VjX3VwZGF0ZV9leGVjX3F1ZXVlX3BvbGljeSB7DQo+ICANCj4gICNk
ZWZpbmUgR1VDX0NUTF9GRUFUVVJFCQkJMg0KPiAgI2RlZmluZSAgIEdVQ19DVExfRU5BQkxFX1NM
UEMJCUJJVCgyKQ0KPiArI2RlZmluZSAgIEdVQ19DVExfRU5BQkxFX0xJVEVfUkVTVE9SRQlCSVQo
NCkNCj4gICNkZWZpbmUgICBHVUNfQ1RMX0RJU0FCTEVfU0NIRURVTEVSCUJJVCgxNCkNCj4gIA0K
PiAgI2RlZmluZSBHVUNfQ1RMX0RFQlVHCQkJMw0KDQo=
