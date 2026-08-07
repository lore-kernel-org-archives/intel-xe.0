Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E342FC5AC7C
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 07:19:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D4610F3B4;
	Fri,  7 Aug 2026 07:19:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="huY1XRxV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1838510F3B4
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Aug 2026 07:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786087139; x=1817623139;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=CkWvklTRCEBPU+Dx03hS6SdcU6lHVII9X1BAXym8Kaw=;
 b=huY1XRxVjw3pYmrzm2pPLdrp1EYYUxtq+wD5MDmcyr8AdFmdSPaFAbdm
 nmZUGy4L2Yl8H2k5Xq/EfhOUZ+7MtxBR2MrBRSdosSPCRfc1lwU0kV769
 olaUVMNRKUO0klsQwBCj49/q2lJc0fPe0WSKueUSE9YWFHvLKzBY8hsOm
 jo+GG0Lxo08Luwr6BS+BslVdDdA1EzsTARZ7QBz21AnETG0taF0HKlPJS
 nvzIBCOwggcKIKoEvr64I0LCLD79ke08gQHAn8NZqR+iS9Nqyc0/84MPS
 9wvSWfnxYqOupi5F2yTb+QUyqQ6i8+8mIJspWQ5KtcuWRJv+z+PuISokA Q==;
X-CSE-ConnectionGUID: iTpePjKsQpKQ7nYexMJ9hQ==
X-CSE-MsgGUID: RXVGmkMyRiikYmS4Sgze5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86566199"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="86566199"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 00:18:59 -0700
X-CSE-ConnectionGUID: 0cGWCjfFQcCzFC8tUqNxEg==
X-CSE-MsgGUID: 1FAOLmPtSBCET/sNEemasw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="287006297"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 00:18:59 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 00:18:58 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 7 Aug 2026 00:18:58 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.25) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 00:18:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tkWEx1zynHocjkg52LNLRqTSQUrwlmH4PVF18Q8jynDejXBtT5z6Fp/RGiljGZuLKDPrejsHtbFhAHy6ltanEtgIYpZVwzyNO9MxCDZSVXvukDzZ4YxPh4aX7gXAzHRfyyAjhgyFNAF2X7b3g1p1Eu1l0DYKFw+G+KYdxJ8fa7wE8mk6msQ7y3sFtEmKEoDUVh8o3r8KfrfONk+TSRu/1E2qRCXrTQtWDznTXXQbTn8tdyC+gfht0ziH8cbxOR4ujHEp53SVhJD5uem6q66NYxrZF1kJ8ojQ3asQObU0U6YMG2wZcsV7JnweTEZeDaHl8bOvJpc2ab18ZNEJk472Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UmxQIMThN8QX9Z0XprkFGBpJsfoW+kkJx4gmax3sb8Y=;
 b=ZuM2mT3+eFofOyqZLZqB48VmtAdUKB0q8Vzk208IEdoVpVG3cEAZDF0T7c59EQXrRdda+aVJWZLOmennVPgt9CK7JEdiifxMzkt7ArV3O9ld9gnTT30LsX+F7xZG7yBFHq8dFiGHCeGn7BcsJbLRSNPUAuzm2qtIEuO6eIt466ZpwEow5QdZubSVNOJtXQM3PHVmFVuaPBDI8fT8smMVp5fDhJ7BEAPjfPsjH0MFAdAkN262uUOU6NM5suynGxqupfS1tQcWyMMQL1ukH7eAC9R9xmUNFTJ4GeElsK6tiYUVi8ddTsw/HDselbTCnHbzhmpv+2jKG55U8gNWbRlQDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by LV8PR11MB8509.namprd11.prod.outlook.com (2603:10b6:408:1e6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Fri, 7 Aug
 2026 07:18:45 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0292.018; Fri, 7 Aug 2026
 07:18:45 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v2 3/3] drm/xe/ggtt: Add KUnit tests for usable and shareable
 pools
Date: Fri, 7 Aug 2026 09:18:22 +0200
Message-ID: <20260807071822.225338-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260807071822.225338-1-piotr.piorkowski@intel.com>
References: <20260807071822.225338-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0202CA0022.eurprd02.prod.outlook.com
 (2603:10a6:803:14::35) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|LV8PR11MB8509:EE_
X-MS-Office365-Filtering-Correlation-Id: ec1a1533-8489-466a-1998-08def4541e2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|56012099006|11063799006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: HxXIy77UqLbCYo3HQ31b4GmXkIgx4uSH9Si03u0nS8IY2TV/dqImxJ5vtWfk6HW+pKH8JUwB+XQ4ZzSBmYeSwPrEUDjKuMl61TAkTQungC13o9lreAIg2BBj//NR0LqU29FzSjMpI8E7pgfbYrDXS5J4yqQ6kUZhs6MCOhv22R1h+Cr1tppbzAjtdHmT6pHzPsV0rlDD5rxZsak371s2flHeQZxP/LLUPkpoVIfUnu/V0bSe9nluYxoi2IzfBAj2LeW1TEVHpzsRNCIfq3NYm7wOGhmlJFjbJkYTum7cihgiTJSImf6e2pTWZbcG5IwFVxwhjnbv5AXPkIcKLlBCUjBdJlMmCQOM6SrFm9VXYn0oIWHK6HWWeQf9at6muQtRmnE1vDbLl6V3snSAhhi5yaWv2RNI74UWEzoO2IqcJEqMNqb06Q7YwRbrEpEaRoPrg96fI4jIYRCOuiKjKwCpVDN6pRloJqSTU7OTl2K992q1zf6vak1WRd5ac9EBvCL/D3QqanFzjKAvCyc5SusP0+UnzOxF5X1I3TX/Pri7W7AG2aVzPM/5UlLXQ4rhyP2ESysqz+U+WNMEC88TofiO01V9+6P7Mvmi/QowfOa2ZasCl+SLbAyfglTR6W+camkocMhUUqqf0kIuA0AGXoPnRb1FVshYKrlYUsDaVH9eV3M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1B4MGdHWUJEVUFXZVF0TkRBcVFaYklPcjUzQmhKa0lkWmNxeUFmelU4aW44?=
 =?utf-8?B?clkxd2dmVFBrOEFRNmZHSWFaL2VaYVdkWlVSKzAwdmRQQUlCTVM5SGNMUXF2?=
 =?utf-8?B?REhTSEZqS0V5NDh2TUl4WDF5QjE4eGVVRjFZRzFORjYvS0ZSeE9Za1plUmNX?=
 =?utf-8?B?Tko3OXZTVkIvaVY4eit3eVR2WUxmZjh6VWdGUW5vbTNNenR3MTVmZUR6TU9P?=
 =?utf-8?B?ZTc4UjhmMnNsNDAzaVAwbmdQTHFSeHRoY2dmZTlNWHpUdEJBUnVub3FEZkRj?=
 =?utf-8?B?M0NNRlF6RUo3bXhTSXRDaXBUL1RtUjNhc0lWNUpTeU9BU3MxSGgvYVR6cG9i?=
 =?utf-8?B?blR1YXdRTHFla0RpeDJudjZNYjY3QTFiOVE1KzZlTFI2R3liWVVTZTBudktH?=
 =?utf-8?B?V1EwZEhQRHlBWGdNWWJIbURYdGdnVU42cVNMMXhVU0FaZTBjYXRpWXdlY3Vk?=
 =?utf-8?B?bGE4blFMUjFPNHcwTXl0SlNybHlGWEp1Nys0WFFzQnl4WWcxQ2xscUU5V3RD?=
 =?utf-8?B?VmcyeWVlVGR6QzFPZG9WNW9wd1d2dmdJS2lSOEVJVCtLMmoxMitydnJxQThB?=
 =?utf-8?B?TVF1dUt6NThUbHdSTWFFWHd1bUgvbXJGL2tNOExXR2psc0xSQXhLTU1GT09x?=
 =?utf-8?B?VDYyek9lR1JZR0MrQ09UNzhLRVlFNERndGdvQXMyd1lvemZJMHdQWUJnbUJk?=
 =?utf-8?B?QnNwRFRkRDN1WnNuemxMbnpmajNIblFFaXl6REhEc1I4MHNrV0d5ZVNBL25x?=
 =?utf-8?B?Y3B5a29wa3pZemFiZ2JiT1hHOU4vaXcwbkgxZGJ5NDZKZW1ScjluSW4xUDZx?=
 =?utf-8?B?QWoyYk5jU0VhWGRVQlZRRlQxRWwySXpzMVI2U3FXQ3VETFlhVThQd0ExSmpj?=
 =?utf-8?B?MzRtZ3k0dmdNa0o2b3NlMWxFYmVLSUJCSDlmeEtwbFM1SmxUWFBuaFlhUHNQ?=
 =?utf-8?B?ZkFRUzdlVHdWbnNvSUJvdkI0aElBTmp6M245Nk1LSE45SitxS2ZsNG1YUVhL?=
 =?utf-8?B?WnNOVy9lcTFwVUVVc1VyTXRCMytla0hkcGRTcTVhNG16VWkvMnB3VnIrRGYr?=
 =?utf-8?B?a0RHWG9aOWs3cmhNbnRQUEl0N081bktBNXAwSk9YL0tjYTZkNm9NcDBzNEk0?=
 =?utf-8?B?eXJiZDNkcVhyTVpyUjZnL3k0M0hsamc4ZS93WU5PRHJZb1cxbVlPS3NyTElS?=
 =?utf-8?B?ZkplaUZOODBYRGVWTDYxOGpYb2hpa09iUmlNNTlYQkU1ZTMvM0ZpUmRSQzYw?=
 =?utf-8?B?OVppcWFIZ2NES2FKYWtvOUU5WHdmVFRncE1kY3hKRjZXUU55YnNpbklLaFhx?=
 =?utf-8?B?b2tkZExMclFXYllUc2dzd3NyTTZ6YXlZcVdFZlpNalhsZHhUQnBEd3VqRkxD?=
 =?utf-8?B?THRoZDAwamI2Zk5RQzVQcGVDR01IR3RNMnBmS0VabERvcC9id1R5eERsVE8x?=
 =?utf-8?B?a3dtNHp6OGJ6ZlNTTzd3VUkwcTBXOHBackYrSUx3V3Flc2Q2RlBqbnRPMDZO?=
 =?utf-8?B?VytOUXJBT1RkZUlvWEFzdEJ6ZFlSRkpkNWttUS9hQzFxOFBiSlBxR0RIQzNM?=
 =?utf-8?B?K2Y5Z0lzSVlmTnpJK3FvY3JCSzBuaHYrZGI3WEpZeHNkc3NUVTNDc0VYTFRU?=
 =?utf-8?B?NGZIdXNIUGd5ck9VbnVDY2JUU1FGRGdJUzVNK1dUTzMyZUt6cDF3YldBc29y?=
 =?utf-8?B?TzlvNS9MWk94Sm1yU3hQK2Zxcm0vcHdjUDVrRERGVTVOeUhKNUFGVE5SSjNT?=
 =?utf-8?B?TUo2UEsxMXV5SlJCRndPYjVQY050dzRWaEk4WlBTTUV6SjZ5YVFKV0pJS25L?=
 =?utf-8?B?UEdMNlNtVmZta1l3dzRORmx5MlFvOEl0elZIbzlSbWJSdFZkQmtnSENCZVkz?=
 =?utf-8?B?RG9TRHNJNFFDMm8rWTd6NVlGbGUxOVM0MEoraGlLd3VoRHRhY2NFRktVV01Q?=
 =?utf-8?B?V3NnY1VJL295RE0wVCtmQlBaT1JGdUpYMTlGMU90YWJCWi9lLzVSV2Z2MGph?=
 =?utf-8?B?TWRNUmxpaHA1T25BaC92b3kvd0FYRUdNKzdtZDRaZjVHeUNwY2NBWUhFZnlB?=
 =?utf-8?B?T3Q3RlVJVldCTldDZ2RsZVJOQ0VONjU2MFBBdTdLK3dja1YrMVJPWUU4Szl2?=
 =?utf-8?B?dzAwbTMvSUhFZGFPMmlmemV4a21nT2NuN0ZVRStYMmlvbUpvRGRqL0tBc2NX?=
 =?utf-8?B?SFdkc2ZGUjFRdHlYRmxmNmd0azcwUXhqUG9HSlViR1BndTMrcUNkQUdkT09x?=
 =?utf-8?B?d1hGeENPeGw5akJoeFdIdmhBYlVxdHFiWWYrRDlINmI4Mmlxd1NtN0pSeGRN?=
 =?utf-8?B?bllXRkZqVzlGdFA4ZXFLNFlWSHZGQy8xb05VenVEQVowVlROb3RQZ1NUczRs?=
 =?utf-8?Q?YzTY//qqnZomyWCo=3D?=
X-Exchange-RoutingPolicyChecked: kBtNcB2ae8gSgDjD104EJrKtnDF740s8nSZZENe/VGCKsNIyRtnxjBwyBmzq+Ns/98dL+Uw9J8s/qFXrZi7wW+x815nQFTX4pmK8UDZwoDqEt+whtWs8CEwf+qvKCziJ5ZsZIGngZsTpizCn+mnt4dBK8GNSVLapVUCwbwKCDFwioe0Xa3F8U5+lqKyYQLk0+qN+pvGyiyajlIoop+Xtir3NKIIEO1vCLJtF9dkhgCcDK4krMZfaxanbs6Ge/2u8mZDvKMwyN4msfaUaNnm6RVhbfvKFD5zedyw9mHPiGk4IWpiZKMOM7sjculSrvs3Wa+3YoCvOsnZoQ+X1UjEYEg==
X-MS-Exchange-CrossTenant-Network-Message-Id: ec1a1533-8489-466a-1998-08def4541e2e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 07:18:45.6810 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ESCIfxhxHyFoX7epPCXja7+fQlge35SSduEVUYj/X+0pisZetyXCrtChzXWChLfMrjCaS0QOmLQH4H5JZlNt0H0o8r9ZpyULpbwFlGt7yQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8509
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Add GGTT KUnit tests focused on the newly introduced usable and
shareable pools.

Cover range initialization for native and PF modes, including partially
overlapping pools. Exercise allocation direction and conflicts between
the pools, as well as the unavailable shareable pool and requests
exceeding pool capacity.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/tests/xe_ggtt_test.c | 315 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.c            |   4 +
 2 files changed, 319 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_ggtt_test.c

diff --git a/drivers/gpu/drm/xe/tests/xe_ggtt_test.c b/drivers/gpu/drm/xe/tests/xe_ggtt_test.c
new file mode 100644
index 000000000000..2fb564298620
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_ggtt_test.c
@@ -0,0 +1,315 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <kunit/test.h>
+
+#include "xe_device.h"
+#include "xe_kunit_helpers.h"
+
+#define GGTT_TEST_START		SZ_1M
+
+static int ggtt_test_init(struct kunit *test)
+{
+	xe_kunit_helper_xe_device_test_init(test);
+	return 0;
+}
+
+static void init_native(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	u64 accessible = ggtt_accessible_size(&ggtt);
+	u64 usable = min_t(u64, SZ_1G, accessible);
+
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, 0);
+
+	KUNIT_EXPECT_EQ(test, ggtt.start, GGTT_TEST_START);
+	KUNIT_EXPECT_EQ(test, ggtt.size, usable);
+	KUNIT_EXPECT_EQ(test, ggtt_total_size(&ggtt), usable);
+
+	drm_mm_takedown(&ggtt.mm);
+}
+
+static void alloc_usable_pool_high(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	struct xe_ggtt_node *usable_node;
+	u64 accessible = ggtt_accessible_size(&ggtt);
+	u64 usable = (accessible * 3) / 4;
+
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, 0);
+
+	usable_node = xe_ggtt_insert_node(&ggtt, XE_PAGE_SIZE, XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(usable_node),
+			GGTT_TEST_START + usable - XE_PAGE_SIZE);
+
+	ggtt_node_remove(usable_node);
+	drm_mm_takedown(&ggtt.mm);
+}
+
+static void alloc_usable_pool_oversized(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	struct xe_ggtt_node *node;
+	u64 accessible = ggtt_accessible_size(&ggtt);
+	u64 usable = (accessible * 3) / 4;
+
+	KUNIT_ASSERT_LE(test, usable + XE_PAGE_SIZE, (u64)U32_MAX);
+
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, 0);
+
+	node = xe_ggtt_insert_node(&ggtt, usable + XE_PAGE_SIZE, XE_PAGE_SIZE);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(node), -ENOSPC);
+
+	drm_mm_takedown(&ggtt.mm);
+}
+
+#if IS_ENABLED(CONFIG_PCI_IOV)
+static void init_shared_pf(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	u64 accessible = ggtt_accessible_size(&ggtt);
+
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, accessible, accessible);
+
+	KUNIT_EXPECT_EQ(test, ggtt.size, accessible);
+	KUNIT_EXPECT_EQ(test, ggtt.shareable.start, 0);
+	KUNIT_EXPECT_EQ(test, ggtt.shareable.size, accessible);
+	KUNIT_EXPECT_EQ(test, ggtt_total_size(&ggtt), accessible);
+
+	drm_mm_takedown(&ggtt.mm);
+}
+
+static void init_partial_overlap(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	u64 accessible = ggtt_accessible_size(&ggtt);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+
+	KUNIT_ASSERT_GT(test, accessible, 0ULL);
+	KUNIT_ASSERT_GT(test, usable, shareable);
+
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, shareable);
+
+	KUNIT_EXPECT_EQ(test, ggtt.size, usable);
+	KUNIT_EXPECT_EQ(test, ggtt.shareable.start, accessible - shareable);
+	KUNIT_EXPECT_EQ(test, ggtt.shareable.size, shareable);
+	KUNIT_EXPECT_LT(test, ggtt.shareable.start, usable);
+	KUNIT_EXPECT_EQ(test, ggtt_total_size(&ggtt), accessible);
+
+	drm_mm_takedown(&ggtt.mm);
+}
+
+static void alloc_usable_pool_low(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	struct xe_ggtt_node *usable_node;
+	u64 accessible = ggtt_accessible_size(&ggtt);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, shareable);
+
+	usable_node = xe_ggtt_insert_node(&ggtt, XE_PAGE_SIZE, XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(usable_node), GGTT_TEST_START);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_size(usable_node), (u64)XE_PAGE_SIZE);
+
+	ggtt_node_remove(usable_node);
+	drm_mm_takedown(&ggtt.mm);
+}
+
+static void alloc_shareable_pool_high(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	struct xe_ggtt_node *shareable_node;
+	u64 accessible = ggtt_accessible_size(&ggtt);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, shareable);
+
+	shareable_node = xe_ggtt_insert_node_shareable(&ggtt,
+						       XE_PAGE_SIZE,
+						       XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shareable_node);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(shareable_node),
+			GGTT_TEST_START + accessible - XE_PAGE_SIZE);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_size(shareable_node),
+			(u64)XE_PAGE_SIZE);
+
+	ggtt_node_remove(shareable_node);
+	drm_mm_takedown(&ggtt.mm);
+}
+
+static void alloc_partial_overlap(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	struct xe_ggtt_node *usable_node, *shareable_node;
+	u64 accessible = ggtt_accessible_size(&ggtt);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, shareable);
+
+	usable_node = xe_ggtt_insert_node(&ggtt, XE_PAGE_SIZE, XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
+	shareable_node = xe_ggtt_insert_node_shareable(&ggtt,
+						       XE_PAGE_SIZE,
+						       XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shareable_node);
+
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(usable_node), GGTT_TEST_START);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(shareable_node),
+			GGTT_TEST_START + accessible - XE_PAGE_SIZE);
+
+	ggtt_node_remove(shareable_node);
+	ggtt_node_remove(usable_node);
+	drm_mm_takedown(&ggtt.mm);
+}
+
+static void alloc_partial_overlap_usable_full(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	struct xe_ggtt_node *usable_node, *shareable_node;
+	u64 accessible = ggtt_accessible_size(&ggtt);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+
+	KUNIT_ASSERT_LE(test, usable, (u64)U32_MAX);
+	KUNIT_ASSERT_LE(test, shareable, (u64)U32_MAX);
+
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, shareable);
+
+	usable_node = xe_ggtt_insert_node(&ggtt, usable, XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
+	shareable_node = xe_ggtt_insert_node_shareable(&ggtt,
+						       shareable,
+						       XE_PAGE_SIZE);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(shareable_node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(shareable_node), -ENOSPC);
+
+	ggtt_node_remove(usable_node);
+	drm_mm_takedown(&ggtt.mm);
+}
+
+static void alloc_partial_overlap_shareable_full(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	struct xe_ggtt_node *usable_node, *shareable_node;
+	u64 accessible = ggtt_accessible_size(&ggtt);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+
+	KUNIT_ASSERT_LE(test, usable, (u64)U32_MAX);
+	KUNIT_ASSERT_LE(test, shareable, (u64)U32_MAX);
+
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, shareable);
+
+	shareable_node = xe_ggtt_insert_node_shareable(&ggtt,
+						       shareable,
+						       XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shareable_node);
+	usable_node = xe_ggtt_insert_node(&ggtt, usable, XE_PAGE_SIZE);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(usable_node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(usable_node), -ENOSPC);
+
+	ggtt_node_remove(shareable_node);
+	drm_mm_takedown(&ggtt.mm);
+}
+
+static void alloc_shareable_pool_unavailable(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	struct xe_ggtt_node *node;
+	u64 accessible = ggtt_accessible_size(&ggtt);
+	u64 usable = (accessible * 3) / 4;
+
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, 0);
+
+	node = xe_ggtt_insert_node_shareable(&ggtt, XE_PAGE_SIZE, XE_PAGE_SIZE);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(node), -ENOSPC);
+
+	drm_mm_takedown(&ggtt.mm);
+}
+
+static void alloc_shareable_pool_oversized(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	struct xe_ggtt_node *node;
+	u64 accessible = ggtt_accessible_size(&ggtt);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+
+	KUNIT_ASSERT_LE(test, shareable + XE_PAGE_SIZE, (u64)U32_MAX);
+
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, shareable);
+
+	node = xe_ggtt_insert_node_shareable(&ggtt,
+					     shareable + XE_PAGE_SIZE,
+					     XE_PAGE_SIZE);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(node), -ENOSPC);
+
+	drm_mm_takedown(&ggtt.mm);
+}
+#else
+#define GGTT_PCI_IOV_TEST_SKIP(_name) \
+	static void _name(struct kunit *test) \
+	{ \
+		kunit_skip(test, "requires CONFIG_PCI_IOV"); \
+	}
+
+GGTT_PCI_IOV_TEST_SKIP(init_shared_pf)
+GGTT_PCI_IOV_TEST_SKIP(init_partial_overlap)
+GGTT_PCI_IOV_TEST_SKIP(alloc_usable_pool_low)
+GGTT_PCI_IOV_TEST_SKIP(alloc_shareable_pool_high)
+GGTT_PCI_IOV_TEST_SKIP(alloc_partial_overlap)
+GGTT_PCI_IOV_TEST_SKIP(alloc_partial_overlap_usable_full)
+GGTT_PCI_IOV_TEST_SKIP(alloc_partial_overlap_shareable_full)
+GGTT_PCI_IOV_TEST_SKIP(alloc_shareable_pool_unavailable)
+GGTT_PCI_IOV_TEST_SKIP(alloc_shareable_pool_oversized)
+
+#undef GGTT_PCI_IOV_TEST_SKIP
+#endif /* CONFIG_PCI_IOV */
+
+static struct kunit_case ggtt_test_cases[] = {
+	KUNIT_CASE(init_native),
+	KUNIT_CASE(alloc_usable_pool_high),
+	KUNIT_CASE(alloc_usable_pool_oversized),
+	KUNIT_CASE(init_shared_pf),
+	KUNIT_CASE(init_partial_overlap),
+	KUNIT_CASE(alloc_usable_pool_low),
+	KUNIT_CASE(alloc_shareable_pool_high),
+	KUNIT_CASE(alloc_partial_overlap),
+	KUNIT_CASE(alloc_partial_overlap_usable_full),
+	KUNIT_CASE(alloc_partial_overlap_shareable_full),
+	KUNIT_CASE(alloc_shareable_pool_unavailable),
+	KUNIT_CASE(alloc_shareable_pool_oversized),
+	{}
+};
+
+static struct kunit_suite ggtt_suite = {
+	.name = "xe_ggtt",
+	.test_cases = ggtt_test_cases,
+	.init = ggtt_test_init,
+};
+
+kunit_test_suites(&ggtt_suite);
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 57e167b3bd3e..77f58485f3c9 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -1358,3 +1358,7 @@ u64 xe_ggtt_node_size(const struct xe_ggtt_node *node)
 {
 	return node->base.size;
 }
+
+#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_ggtt_test.c"
+#endif
-- 
2.34.1

