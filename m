Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8CFAD5AE73
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 08:55:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B05D810E7C6;
	Thu,  7 Nov 2024 08:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eAMR5ARm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBAE210E7C6
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Nov 2024 08:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730969734; x=1762505734;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=C2/oD5Rf8EjWEslH1RvCqTECRf0yNZJWY+Gn2AFH0oI=;
 b=eAMR5ARmUmlBvjPPDWEy/L6r5ZgHPcKuOIGbsrdSqFCLfJ6CktEg3VVQ
 ZFJC6H6FhW/YY/PK16BIox9tLSfFaOYiK2ZS8jJJPKzrYWb6HQyrfjcC9
 +k/uIbNxVscTDPWUpf8VZ1pjpZpTpd/grReshST7vhcSw1Zu4KMqV3hJK
 id3S6zQuJ4xjrAmu0fKhV2RUsyhF5CtrAl5wNBzVuFOtFAvrABW/ll5Gs
 +9SoJiNXC8r9WL0NgyunnHazNb32tHNuWSdu0O/KyEYmVXj86iGNuMN/0
 G4Ttmu2i+0Ech5XyGKorQ1VuSbyxVaRLWngTOj8JsvOeGN5oJF+b+HhV+ w==;
X-CSE-ConnectionGUID: WRZyaYLZRkeQps1riSicKw==
X-CSE-MsgGUID: 5uxXjcCjTjqb9ldEfLXmGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="56198782"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; d="scan'208";a="56198782"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 00:55:33 -0800
X-CSE-ConnectionGUID: Wz3JmfbETkGVV60gIN+12w==
X-CSE-MsgGUID: hbIylxf+Qauh7EV+KL9JDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; d="scan'208";a="85785866"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2024 00:55:33 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 7 Nov 2024 00:55:32 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 7 Nov 2024 00:55:32 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 7 Nov 2024 00:55:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WyYdo6//hMCRUpSLFrFF+V1ntNpmkQcsijky28G1UDoBcG9ksR0KlAv7e20b43JZy/hfm25yv36i/wG3HL8kHdq2cxwH0tCkRrRb1ybtTLc4PCbygCR+mE6M21/gPzqAyDT6z7k899KJRN9vHyLp4cRqJVsiZ1Y5iT6NdmP7FwMFOv/7WiJ/6IMxeSF0NplhNQ42zh08wmKdxrau2A2mpFHZqcqrPJxEP1ll5j6XqOftUEd+OB0qCrqLaGLVdjf65rdMmb/xCSsNxcOqNnALRz7vVxNM3lJrR52icFWYWgr0TBGZIDOqK+Zoiib7iwML4007lE8T4ZlV7wlM9/K7Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C2/oD5Rf8EjWEslH1RvCqTECRf0yNZJWY+Gn2AFH0oI=;
 b=daQgkIgs4gRb3/rszrw1eRaB6cN8gwOdsuJh92G8NnpQwKE5BRonCEBzLVl8aVCAN2Su4vRvOAUUP/CWtGDI2qsbCZ0aI106TwwSbn8ibbVZZ9xFEkf4JyVyrP9Zl7AFrYCu6HYjZtEXX+vjb6RN3LNbg3HQr0YIeDQepZIhVnV9ABkdrwK+Ih6DITrV17KdCpNzEdWGnX2U9tJ1/vkLWUkRg/hNX4jBV1rIpg3cyBjz07yX18RImoyOY0I1Vp1N0Vn0Lzcqy3f9FV1LD361d1zOjfm27DHIOH5pWUZK3Ztkm0VJHEW2ZYFTEE7ncHlSNipxbtRNlONVZKf5/gArVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7054.namprd11.prod.outlook.com (2603:10b6:303:219::20)
 by PH7PR11MB5984.namprd11.prod.outlook.com (2603:10b6:510:1e3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Thu, 7 Nov
 2024 08:55:30 +0000
Received: from MW4PR11MB7054.namprd11.prod.outlook.com
 ([fe80::9504:33a7:4018:581e]) by MW4PR11MB7054.namprd11.prod.outlook.com
 ([fe80::9504:33a7:4018:581e%5]) with mapi id 15.20.8114.028; Thu, 7 Nov 2024
 08:55:30 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: =?utf-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/display: Pcode sets the CD clock frequency
 voltage levels
Thread-Topic: [PATCH] drm/i915/display: Pcode sets the CD clock frequency
 voltage levels
Thread-Index: AQHbMGClVe8clQ7+5UGIEyLMFpRn9bKqZdwAgAEamHA=
Date: Thu, 7 Nov 2024 08:55:30 +0000
Message-ID: <MW4PR11MB7054DBCC8C80838915281246EF5C2@MW4PR11MB7054.namprd11.prod.outlook.com>
References: <20241106152023.398748-1-mika.kahola@intel.com>
 <ZyuPxvxO1VHd6GJv@intel.com>
In-Reply-To: <ZyuPxvxO1VHd6GJv@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7054:EE_|PH7PR11MB5984:EE_
x-ms-office365-filtering-correlation-id: fb3536f9-e82d-4bb7-8473-08dcff09ee99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZlhSMFBNdno3YlZZSklGbE9jYlVZUW5rOXlsUTBEN1BXck85dnlnOTZFK0FV?=
 =?utf-8?B?dG52R0s4alV3WG4zbUp0cE9VOWlmTWFOdG0vd3N3NzZ5WGNWREhQTjJGdXBM?=
 =?utf-8?B?MEpFaHV2eE1UaWxMRzBKcDM2cDNRYjlEV0JidlJGM01JcXZ0SmI2Q1ZXc0Nu?=
 =?utf-8?B?ejNIMVJleVpxOE91S012aitlcjUzdkpabU44OEZ4aitaNG1CK0U0ZFNIeU1O?=
 =?utf-8?B?YXpqWk5sMEJEUHQ2ZFluNDlnenp0WENrTzkrSUtETmJKSGRaaTRjUXZuMnBX?=
 =?utf-8?B?b2wwaitKYlpiNWt4SmE5Z0Zqck9zQ3phelh2UlNWVkIrZ0IvUG8yQU1IWXFH?=
 =?utf-8?B?aVpzOGhqSkd4MUJpZ3R2M3hHdURodEw3T2FxOTBFdlltUGlJa0FoSi8raHIy?=
 =?utf-8?B?RjJCU01uejI1ZzdnOTJta2VtRVEvWXBSc2g0UmFoUVpVWFljTTA3Zzh2bTBD?=
 =?utf-8?B?SXB6NW5xYTJHc2FhbU1xc09DckxVN2tncFFFanBmbmVoaWE5d0JBSTdERXg1?=
 =?utf-8?B?YnNpMGtjV0hLZFE4THpoV3BkclU4cGRheHV2cVZFL2JyTndOd0g2bHFrSFJN?=
 =?utf-8?B?RmdoOFpUU0JLbkd0ZmwwNTh0bVkxbGJRRHhrTXlFWFFuUlYyZW5oNlpMWXlw?=
 =?utf-8?B?a0M5b0hqNXkxZU80d29DRGJTTU1EbFlMT01MMnIzcXNwOUNhN1Bac3lKcWdG?=
 =?utf-8?B?bWhOMWRieHA5NkZKeWpNZGFiYzVyOEpoOUVocm4rcWlsT3VOcFRET1Uwd0M0?=
 =?utf-8?B?RjJGVE9QeFFLbUtnVHhNaEpLQVd1dExRaUczMlBWTGxGZGFCbzBxRGVBVHN0?=
 =?utf-8?B?bVBsY1J1Z2Z0bXMyZTRBTTUwd0FXQUhiSFI1RytGVFcyaXkzd1YzUHd2cmgv?=
 =?utf-8?B?emRtNXU0MndYSEdpbFJSTmVHT1RrU0hNc0hpNEV3OTNRY0p2SFcxcC9CdGpn?=
 =?utf-8?B?NDRkbktPWmQ5ZTVENjZ5RHl5cHBlV2szZlFiaHE2NGxFZENpOUdoUmtaa09J?=
 =?utf-8?B?ZG1SUzcyUTh0eU5teXVCTGlIUHNuWkdtT2NQamxleEgxV3FvUmVuR2RHbVV0?=
 =?utf-8?B?a05tYXF2OG9LM1lnSGZSSm51dWFwNm5HVlhtejd2NE41NGpEcGQwRDRWb29Y?=
 =?utf-8?B?VWhubEo1cTBvWTIwU1ZiTS9WMEJoT21INExacnBXR2JkQ1Vkc1NDQjFBWDg4?=
 =?utf-8?B?U1pWZTFQZ3QzMXpmYzVMOVorL2UySmZQRUg4UVIrcC92ZmxmWVVTanhnb3Ja?=
 =?utf-8?B?U1VkdGpEcE40NlZrRjZwdS96TU9yd3pkQmZtWk5OQ2pIS2l2ZXdodmJldlVH?=
 =?utf-8?B?Y1lJMmRtSUZ3NGtDbkVvQ2x4V1dMRGFxcGhUUXhJV3hPZk00U2Z5T1pCK3Z2?=
 =?utf-8?B?YjNnNzMyZEw0U0NnQU9UNXlRM3FvTW1oOXVXVkhVS085U2MyeS9QVDhEY3BZ?=
 =?utf-8?B?YUxNdUxEekkrdTFRb0lmdWM3KzBFUGY1aUdDcnFwUmVFNE1weTZ2WXZqcWZn?=
 =?utf-8?B?Vll4bEZBeHMwZU90eUl3YVpEK25YK2tuUm1NWDFPeVQ5Z2xmY2RrUkRvU2dU?=
 =?utf-8?B?bmRRT2dMc2ZrcTBoREFMbTlueGJVSEVpQ3FIdE0valh1Sm43Zk9pZFVtR3BZ?=
 =?utf-8?B?Q21TMThHNFJHeHI1RjJGbU9uRXJCMW1FcWN4TkEvUS8xc2dsWURxb1EveCs4?=
 =?utf-8?B?WmdqajNlVjBiYzA5VjhRMlVhR3VLc2VLUFdzYzFZWVk0dExiWWhsek5vVkhu?=
 =?utf-8?B?VUplQmpOdno0WEFHeWg1bG8vTkY4dlgweDMzaTk4RDd0bW16bmtnYmZ6ZzVQ?=
 =?utf-8?Q?tyepdtxPB004FKLGTFaxteuDcS8iM2Q+EbTE4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7054.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZWErZEx5V3ZQYVkzREFsSzZzL3lBVFQvWG5TR1RYeVdSM1puZklxeUJITG5J?=
 =?utf-8?B?eVNTQXN0TjNKS1h0TmNGVnhaUG9aaHBzK0tWOWxXcENMMHFtSXQ0eGs0RlNB?=
 =?utf-8?B?WmEzSWJlTmorYU1DL280RWI4WjlPT2pUQnRwc014b0RZSGlIdExPa01OU1RS?=
 =?utf-8?B?NU5BV1loVHgwcUdyVldWYnNtbWNvNzZ2bWNJa1YxUmFONlhUcXBwLzlWZHZZ?=
 =?utf-8?B?WEthcDdQZE1uYUw4TjFQUFNSQjhkVWlka2k5NzU1Q0VWZ3BKZmdoSHZLRTQ2?=
 =?utf-8?B?TXdZK1VKak41VmxrYnY3LzVDOVpXNXc4QXV1Qkc5SDFobDRIdTlKMkFDWWRW?=
 =?utf-8?B?eDNFdW85eU9RM0t4K1V5aWtTSkVMRTNOQk0wQWlvcWJjZnV4Tkt1TkdBa05s?=
 =?utf-8?B?d2s3S085UWdFS1k1SW9xa1JwTEF0bDdINGxsb01Gd1NoeFRPaEltUmZmcm9w?=
 =?utf-8?B?eDlZNzQ1ZUZWWW5SSzdGNWN4TEFiU01lSnExc1V0Rml0QUxFT09mUk90UjhY?=
 =?utf-8?B?d3hRa3ROeFpKTWlmM1VubDlPYmNFNmNhZ3lyU0VXUmFZVDlyTWZqdTVSVnJV?=
 =?utf-8?B?dm1kQ0V2NllWMkhxVU9UQ0sydUg4SW9yKzZ3a0VvU2tQNFBmeThKaUVhRnJE?=
 =?utf-8?B?VDk3a0Njc2FDKzRqSGVkdGg4WUtQT2dSMWxob0l0T2RXSlphZlZBOHFhMFR5?=
 =?utf-8?B?VG1vd3JjNzB5VWRveUFVMDU5K2wwZ3BFTjRMVVRQZGQ0Z1QwWGFtYUZBTSs0?=
 =?utf-8?B?M1lqejJ2NzdKUmFvdEV4NUJ5ejlQazVNbXpjNTUwTzVPZVRuVFQwMGw2elpQ?=
 =?utf-8?B?MkNvOUlOZHZLcnE3ZlRrZHdZTXcyWXV3OXlUS2owUWM3NUZGOFdDa0xhb3lB?=
 =?utf-8?B?K2ZEOXA5bGFOQ0V0ZmVmN0ZING5nVldGTmp5ZHBFTjBpbmtHRUFjaWJvMVRq?=
 =?utf-8?B?VitmMmFWaVZyNDYzb1ZyZmFnaFRPSTh4dVd4eS91QW0vaTNvZVR3cGpsWWZX?=
 =?utf-8?B?R0ZXR1Y1cFR5YWVSb1pnVVE0SE91MGdqWkRxa2gxSU1LVVZaWWV1dUxBUG4w?=
 =?utf-8?B?RXNNSE5nWG9PSUV1cUlmRlBLTFUvUlFXM25EUUZnZkF5aHVyMi9aVmNPMmI2?=
 =?utf-8?B?UjVab2xseU5HM2ZUTW5KL21pRG5vOHJnMDNGMTNwTzNhWC94dnZ1UkNueVFR?=
 =?utf-8?B?WWQ5RFJQTzI0R09mYlZWa3FrbTVWV3I2ZFk4cklYbEZiQ0MrTEx2bEwzR3BM?=
 =?utf-8?B?YWFyR2lBUWh6K3ZjNklyMit1b2pQc1lmemRFZ1V3LzNoVHI1MFFEbzVnT1do?=
 =?utf-8?B?NjNEbm5Sb2ZXUk1GWDBVYWpNSmtITDA2NysxNVVDY0tQVForRjhDVEc3RGoy?=
 =?utf-8?B?QXJaMEM4bndWZ1FIejZ6TC8waFNQR0lFREFaSFpMYlBEQ1VWUis2WE40dnRD?=
 =?utf-8?B?QTVvcGIzUFd3MUFET0xNd1dnamp5SnJmSWxwd1d0VEZCNjJ0L0wzMnlPemJ1?=
 =?utf-8?B?MEN2ai90ZW56d1VpUi8weE5MK1RubDJCeStlak5NNVVUL1NvamFpODhzVzdR?=
 =?utf-8?B?KzhKZTZ5ZTVmR0FWVjFHQjFiYjFkM21rM0ZwVi9vQkpiNkF5TUZQMHBZa3NC?=
 =?utf-8?B?d2ZNZHI2Z2R0Ti9uMzUvbkdzNEt2aFlXVlYxdVYrb3prZUpIeVlNbURoQ3lR?=
 =?utf-8?B?OC9rTm5rcnJMTnJCNUlpMzhaN052ZDh3WUorU0NSZW93UHRpbnNCSlpUVE5I?=
 =?utf-8?B?d2dnMmtHWjF0cXJoK3NCbytqWDRiUjZyY0hRMHhoNEpNbllYVlBWK2tMNzYr?=
 =?utf-8?B?NGRUNDhTUFpwWFJOTWwwT1dIb1hGTnVaOFdNZGdJejNub3cvVk51K0VHSSt3?=
 =?utf-8?B?SUttRGQ0RHpvREgyMHJVT2RYWXpseXhqUVAwSjh1aWJDVGVYOGZkU25VUlpz?=
 =?utf-8?B?T2w2OS9kY0s1VWVPT2lBVU42NGx0RGxSU0p1NFF6cllhaDhVekFTYlMrUkRi?=
 =?utf-8?B?UkNkaE9HczBXTi9iaWxlOXNDbUwveUhCOEFCTmMybG1DeDBZQmQybk1XdDBX?=
 =?utf-8?B?UGR0akRJUG1VdDlQV1pNN2tCQVU4YVVSQVQyZjlIQWxtK1k2ZGk2SmZta2o0?=
 =?utf-8?Q?ugNLCLuSGVGSf5ldFgT08xZd5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7054.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb3536f9-e82d-4bb7-8473-08dcff09ee99
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2024 08:55:30.2260 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7WGFsqUfoAC2BVtHaduvU6EISXUZRZ7IzW/daE8+Ijb9hJR0ApNk+RnSzwM82CWr/2C4L0Zc59t6Bil8DQpU3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5984
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZp
bGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIDYgTm92ZW1i
ZXIgMjAyNCAxNy40OA0KPiBUbzogS2Fob2xhLCBNaWthIDxtaWthLmthaG9sYUBpbnRlbC5jb20+
DQo+IENjOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogUmU6IFtQ
QVRDSF0gZHJtL2k5MTUvZGlzcGxheTogUGNvZGUgc2V0cyB0aGUgQ0QgY2xvY2sgZnJlcXVlbmN5
IHZvbHRhZ2UNCj4gbGV2ZWxzDQo+IA0KPiBPbiBXZWQsIE5vdiAwNiwgMjAyNCBhdCAwNToyMDoy
M1BNICswMjAwLCBNaWthIEthaG9sYSB3cm90ZToNCj4gPiBPbiB4ZTNscGQgdGhlIENEIGNsb2Nr
IGZyZXF1ZW5jeSBpcyBzZXQgYnkgdGhlIGRyaXZlciB3aXRob3V0IHNldHRpbmcNCj4gPiB2b2x0
YWdlIGxldmVscy4gUHJldmlvdXNseSwgd2UgaGFkIDQgbGV2ZWxzIG9mIHZvbHRhZ2VzIHRvIGNo
b29zZQ0KPiA+IGZyb20uIEhvd2V2ZXIsIGhhdmluZyBvbmx5IDQgbGV2ZWxzIGlzIHJhdGhlciBj
b2Fyc2UgYW5kIHdlIG1heSBlbmQgdXANCj4gPiBjb25zdW1pbmcgbW9yZSBwb3dlciB0aGFuIG5l
Y2Vzc2FyeS4gVGhlcmVmb3JlLCB0aGVzZSBhcmUgbm93IHJlbW92ZWQNCj4gPiBhbmQgY2hvb3Np
bmcgdGhlIGNvcnJlY3Qgdm9sdGFnZSBsZXZlbCBpcyBub3cgaGFuZGVkIG92ZXIgdG8gUGNvZGUN
Cj4gPiBmaXJtd2FyZSB3aGljaCBpcyBhYmxlIHRvIHNldCB2b2x0YWdlIGxldmVsIHdpdGggaGln
aGVyIGdyYW51bGFyaXR5Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogTWlrYSBLYWhvbGEgPG1p
a2Eua2Fob2xhQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9jZGNsay5jIHwgNDggKysrKysrKysrKystLS0tLS0tLS0tLQ0KPiA+ICBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlZy5oICAgICAgICAgICAgfCAgMyArKw0KPiA+ICAy
IGZpbGVzIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQ0KPiA+DQo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY2RjbGsu
Yw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jZGNsay5jDQo+ID4g
aW5kZXggMDNjNGVlZjNmOTJhLi43MmRhMDZlNzc4MTUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jZGNsay5jDQo+ID4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jZGNsay5jDQo+ID4gQEAgLTE2MjcsMTYgKzE2Mjcs
NiBAQCBzdGF0aWMgdTggcnBsdV9jYWxjX3ZvbHRhZ2VfbGV2ZWwoaW50IGNkY2xrKQ0KPiA+ICAJ
CQkJICBycGx1X3ZvbHRhZ2VfbGV2ZWxfbWF4X2NkY2xrKTsNCj4gPiAgfQ0KPiA+DQo+ID4gLXN0
YXRpYyB1OCB4ZTNscGRfY2FsY192b2x0YWdlX2xldmVsKGludCBjZGNsaykgLXsNCj4gPiAtCS8q
DQo+ID4gLQkgKiBTdGFydGluZyB3aXRoIHhlM2xwZCBwb3dlciBjb250cm9sbGVyIGRvZXMgbm90
IG5lZWQgdGhlIHZvbHRhZ2UNCj4gPiAtCSAqIGluZGV4IHdoZW4gZG9pbmcgdGhlIG1vZGVzZXQg
dXBkYXRlLiBUaGlzIGZ1bmN0aW9uIGlzIGJlc3QgbGVmdA0KPiA+IC0JICogZGVmaW5lZCBidXQg
cmV0dXJuaW5nIDAgdG8gdGhlIG1hc2suDQo+ID4gLQkgKi8NCj4gPiAtCXJldHVybiAwOw0KPiA+
IC19DQo+IA0KPiBJIHRoaW5rIEkgcHJlZmVyIHRoZSBvcmlnaW5hbCBhcHByb2FjaCBoZXJlLiBB
dm9pZHMgYWxsIHRob3NlIHVnbHkgaWYgc3RhdGVtZW50cyBhbGwNCj4gb3ZlciB0aGUgcGxhY2Uu
DQoNCk1heWJlIHdlIGNhbiB0aGVuIGRyb3AgdGhpcyBwYXRjaCB0aGVuLiBXZSBjYW4ga2VlcCB0
aGUgb3JpZ2luYWwgYXBwcm9hY2guDQoNClRoYW5rcyENCj4gDQo+ID4gLQ0KPiA+ICBzdGF0aWMg
dm9pZCBpY2xfcmVhZG91dF9yZWZjbGsoc3RydWN0IGludGVsX2Rpc3BsYXkgKmRpc3BsYXksDQo+
ID4gIAkJCSAgICAgICBzdHJ1Y3QgaW50ZWxfY2RjbGtfY29uZmlnICpjZGNsa19jb25maWcpICB7
IEBAIC0NCj4gMTc1OCw4DQo+ID4gKzE3NDgsOSBAQCBzdGF0aWMgdm9pZCBieHRfZ2V0X2NkY2xr
KHN0cnVjdCBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5LA0KPiA+ICAJICogQ2FuJ3QgcmVhZCB0aGlz
IG91dCA6KCBMZXQncyBhc3N1bWUgaXQncw0KPiA+ICAJICogYXQgbGVhc3Qgd2hhdCB0aGUgQ0RD
TEsgZnJlcXVlbmN5IHJlcXVpcmVzLg0KPiA+ICAJICovDQo+ID4gLQljZGNsa19jb25maWctPnZv
bHRhZ2VfbGV2ZWwgPQ0KPiA+IC0JCWludGVsX2NkY2xrX2NhbGNfdm9sdGFnZV9sZXZlbChkaXNw
bGF5LCBjZGNsa19jb25maWctPmNkY2xrKTsNCj4gPiArCWlmIChESVNQTEFZX1ZFUihkaXNwbGF5
KSA8IDMwKQ0KPiA+ICsJCWNkY2xrX2NvbmZpZy0+dm9sdGFnZV9sZXZlbCA9DQo+ID4gKwkJCWlu
dGVsX2NkY2xrX2NhbGNfdm9sdGFnZV9sZXZlbChkaXNwbGF5LCBjZGNsa19jb25maWctDQo+ID5j
ZGNsayk7DQo+ID4gIH0NCj4gPg0KPiA+ICBzdGF0aWMgdm9pZCBieHRfZGVfcGxsX2Rpc2FibGUo
c3RydWN0IGludGVsX2Rpc3BsYXkgKmRpc3BsYXkpIEBADQo+ID4gLTIyMDksNyArMjIwMCw3IEBA
IHN0YXRpYyB2b2lkIGJ4dF9zZXRfY2RjbGsoc3RydWN0IGludGVsX2Rpc3BsYXkNCj4gPiAqZGlz
cGxheSwNCj4gPg0KPiA+ICAJaW50ZWxfdXBkYXRlX2NkY2xrKGRpc3BsYXkpOw0KPiA+DQo+ID4g
LQlpZiAoRElTUExBWV9WRVIoZGlzcGxheSkgPj0gMTEpDQo+ID4gKwlpZiAoRElTUExBWV9WRVIo
ZGlzcGxheSkgPj0gMTEgJiYgRElTUExBWV9WRVIoZGlzcGxheSkgPCAzMCkNCj4gPiAgCQkvKg0K
PiA+ICAJCSAqIENhbid0IHJlYWQgb3V0IHRoZSB2b2x0YWdlIGxldmVsIDooDQo+ID4gIAkJICog
TGV0J3MganVzdCBhc3N1bWUgZXZlcnl0aGluZyBpcyBhcyBleHBlY3RlZC4NCj4gPiBAQCAtMjI4
OCw4ICsyMjc5LDEwIEBAIHN0YXRpYyB2b2lkIGJ4dF9jZGNsa19pbml0X2h3KHN0cnVjdCBpbnRl
bF9kaXNwbGF5DQo+ICpkaXNwbGF5KQ0KPiA+ICAJICovDQo+ID4gIAljZGNsa19jb25maWcuY2Rj
bGsgPSBieHRfY2FsY19jZGNsayhkaXNwbGF5LCAwKTsNCj4gPiAgCWNkY2xrX2NvbmZpZy52Y28g
PSBieHRfY2FsY19jZGNsa19wbGxfdmNvKGRpc3BsYXksIGNkY2xrX2NvbmZpZy5jZGNsayk7DQo+
ID4gLQljZGNsa19jb25maWcudm9sdGFnZV9sZXZlbCA9DQo+ID4gLQkJaW50ZWxfY2RjbGtfY2Fs
Y192b2x0YWdlX2xldmVsKGRpc3BsYXksIGNkY2xrX2NvbmZpZy5jZGNsayk7DQo+ID4gKw0KPiA+
ICsJaWYgKERJU1BMQVlfVkVSKGRpc3BsYXkpIDwgMzApDQo+ID4gKwkJY2RjbGtfY29uZmlnLnZv
bHRhZ2VfbGV2ZWwgPQ0KPiA+ICsJCQlpbnRlbF9jZGNsa19jYWxjX3ZvbHRhZ2VfbGV2ZWwoZGlz
cGxheSwNCj4gY2RjbGtfY29uZmlnLmNkY2xrKTsNCj4gPg0KPiA+ICAJYnh0X3NldF9jZGNsayhk
aXNwbGF5LCAmY2RjbGtfY29uZmlnLCBJTlZBTElEX1BJUEUpOyAgfSBAQCAtMjMwMCw4DQo+ID4g
KzIyOTMsMTAgQEAgc3RhdGljIHZvaWQgYnh0X2NkY2xrX3VuaW5pdF9odyhzdHJ1Y3QgaW50ZWxf
ZGlzcGxheQ0KPiA+ICpkaXNwbGF5KQ0KPiA+DQo+ID4gIAljZGNsa19jb25maWcuY2RjbGsgPSBj
ZGNsa19jb25maWcuYnlwYXNzOw0KPiA+ICAJY2RjbGtfY29uZmlnLnZjbyA9IDA7DQo+ID4gLQlj
ZGNsa19jb25maWcudm9sdGFnZV9sZXZlbCA9DQo+ID4gLQkJaW50ZWxfY2RjbGtfY2FsY192b2x0
YWdlX2xldmVsKGRpc3BsYXksIGNkY2xrX2NvbmZpZy5jZGNsayk7DQo+ID4gKw0KPiA+ICsJaWYg
KERJU1BMQVlfVkVSKGRpc3BsYXkpIDwgMzApDQo+ID4gKwkJY2RjbGtfY29uZmlnLnZvbHRhZ2Vf
bGV2ZWwgPQ0KPiA+ICsJCQlpbnRlbF9jZGNsa19jYWxjX3ZvbHRhZ2VfbGV2ZWwoZGlzcGxheSwN
Cj4gY2RjbGtfY29uZmlnLmNkY2xrKTsNCj4gPg0KPiA+ICAJYnh0X3NldF9jZGNsayhkaXNwbGF5
LCAmY2RjbGtfY29uZmlnLCBJTlZBTElEX1BJUEUpOyAgfSBAQCAtMjQ3NywxMA0KPiA+ICsyNDcy
LDE1IEBAIHZvaWQgaW50ZWxfY2RjbGtfZHVtcF9jb25maWcoc3RydWN0IGludGVsX2Rpc3BsYXkg
KmRpc3BsYXksDQo+ID4gIAkJCSAgICAgY29uc3Qgc3RydWN0IGludGVsX2NkY2xrX2NvbmZpZyAq
Y2RjbGtfY29uZmlnLA0KPiA+ICAJCQkgICAgIGNvbnN0IGNoYXIgKmNvbnRleHQpDQo+ID4gIHsN
Cj4gPiAtCWRybV9kYmdfa21zKGRpc3BsYXktPmRybSwgIiVzICVkIGtIeiwgVkNPICVkIGtIeiwg
cmVmICVkIGtIeiwgYnlwYXNzDQo+ICVkIGtIeiwgdm9sdGFnZSBsZXZlbCAlZFxuIiwNCj4gPiAt
CQkgICAgY29udGV4dCwgY2RjbGtfY29uZmlnLT5jZGNsaywgY2RjbGtfY29uZmlnLT52Y28sDQo+
ID4gLQkJICAgIGNkY2xrX2NvbmZpZy0+cmVmLCBjZGNsa19jb25maWctPmJ5cGFzcywNCj4gPiAt
CQkgICAgY2RjbGtfY29uZmlnLT52b2x0YWdlX2xldmVsKTsNCj4gPiArCWlmIChESVNQTEFZX1ZF
UihkaXNwbGF5KSA9PSAzMCkNCj4gPiArCQlkcm1fZGJnX2ttcyhkaXNwbGF5LT5kcm0sICIlcyAl
ZCBrSHosIFZDTyAlZCBrSHosIHJlZiAlZA0KPiBrSHosIGJ5cGFzcyAlZCBrSHpcbiIsDQo+ID4g
KwkJCSAgICBjb250ZXh0LCBjZGNsa19jb25maWctPmNkY2xrLCBjZGNsa19jb25maWctPnZjbywN
Cj4gPiArCQkJICAgIGNkY2xrX2NvbmZpZy0+cmVmLCBjZGNsa19jb25maWctPmJ5cGFzcyk7DQo+
ID4gKwllbHNlDQo+ID4gKwkJZHJtX2RiZ19rbXMoZGlzcGxheS0+ZHJtLCAiJXMgJWQga0h6LCBW
Q08gJWQga0h6LCByZWYgJWQNCj4ga0h6LCBieXBhc3MgJWQga0h6LCB2b2x0YWdlIGxldmVsICVk
XG4iLA0KPiA+ICsJCQkgICAgY29udGV4dCwgY2RjbGtfY29uZmlnLT5jZGNsaywgY2RjbGtfY29u
ZmlnLT52Y28sDQo+ID4gKwkJCSAgICBjZGNsa19jb25maWctPnJlZiwgY2RjbGtfY29uZmlnLT5i
eXBhc3MsDQo+ID4gKwkJCSAgICBjZGNsa19jb25maWctPnZvbHRhZ2VfbGV2ZWwpOw0KPiA+ICB9
DQo+ID4NCj4gPiAgc3RhdGljIHZvaWQgaW50ZWxfcGNvZGVfbm90aWZ5KHN0cnVjdCBpbnRlbF9k
aXNwbGF5ICpkaXNwbGF5LCBAQA0KPiA+IC0yNDk3LDcgKzI0OTcsMTAgQEAgc3RhdGljIHZvaWQg
aW50ZWxfcGNvZGVfbm90aWZ5KHN0cnVjdCBpbnRlbF9kaXNwbGF5DQo+ICpkaXNwbGF5LA0KPiA+
ICAJaWYgKCFJU19ERzIoaTkxNSkpDQo+ID4gIAkJcmV0dXJuOw0KPiA+DQo+ID4gLQl1cGRhdGVf
bWFzayA9IERJU1BMQVlfVE9fUENPREVfVVBEQVRFX01BU0soY2RjbGssDQo+IGFjdGl2ZV9waXBl
X2NvdW50LCB2b2x0YWdlX2xldmVsKTsNCj4gPiArCWlmIChESVNQTEFZX1ZFUihpOTE1KSA9PSAz
MCkNCj4gPiArCQl1cGRhdGVfbWFzayA9IERJU1BMQVkzMF9UT19QQ09ERV9VUERBVEVfTUFTSyhj
ZGNsaywNCj4gYWN0aXZlX3BpcGVfY291bnQpOw0KPiA+ICsJZWxzZQ0KPiA+ICsJCXVwZGF0ZV9t
YXNrID0gRElTUExBWV9UT19QQ09ERV9VUERBVEVfTUFTSyhjZGNsaywNCj4gPiArYWN0aXZlX3Bp
cGVfY291bnQsIHZvbHRhZ2VfbGV2ZWwpOw0KPiA+DQo+ID4gIAlpZiAoY2RjbGtfdXBkYXRlX3Zh
bGlkKQ0KPiA+ICAJCXVwZGF0ZV9tYXNrIHw9IERJU1BMQVlfVE9fUENPREVfQ0RDTEtfVkFMSUQ7
IEBAIC0NCj4gMzY5OSw3ICszNzAyLDYgQEANCj4gPiBzdGF0aWMgY29uc3Qgc3RydWN0IGludGVs
X2NkY2xrX2Z1bmNzIHhlM2xwZF9jZGNsa19mdW5jcyA9IHsNCj4gPiAgCS5nZXRfY2RjbGsgPSBi
eHRfZ2V0X2NkY2xrLA0KPiA+ICAJLnNldF9jZGNsayA9IGJ4dF9zZXRfY2RjbGssDQo+ID4gIAku
bW9kZXNldF9jYWxjX2NkY2xrID0gYnh0X21vZGVzZXRfY2FsY19jZGNsaywNCj4gPiAtCS5jYWxj
X3ZvbHRhZ2VfbGV2ZWwgPSB4ZTNscGRfY2FsY192b2x0YWdlX2xldmVsLA0KPiA+ICB9Ow0KPiA+
DQo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaW50ZWxfY2RjbGtfZnVuY3MgcnBsdV9jZGNsa19m
dW5jcyA9IHsgZGlmZiAtLWdpdA0KPiA+IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9yZWcu
aCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcmVnLmgNCj4gPiBpbmRleCBjMTYwZTA4Nzk3
MmEuLjVkMGIxMzQ2MDYzMSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9p
OTE1X3JlZy5oDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9yZWcuaA0KPiA+
IEBAIC0zNTgxLDYgKzM1ODEsOSBAQA0KPiA+ICAJCSgoRElTUExBWV9UT19QQ09ERV9DRENMSyhj
ZGNsaykpIHwgXA0KPiA+ICAJCShESVNQTEFZX1RPX1BDT0RFX1BJUEVfQ09VTlQobnVtX3BpcGVz
KSkgfCBcDQo+ID4gIAkJKERJU1BMQVlfVE9fUENPREVfVk9MVEFHRSh2b2x0YWdlX2xldmVsKSkp
DQo+ID4gKyNkZWZpbmUgICBESVNQTEFZMzBfVE9fUENPREVfVVBEQVRFX01BU0soY2RjbGssIG51
bV9waXBlcykgXA0KPiA+ICsJCSgoRElTUExBWV9UT19QQ09ERV9DRENMSyhjZGNsaykpIHwgXA0K
PiA+ICsJCShESVNQTEFZX1RPX1BDT0RFX1BJUEVfQ09VTlQobnVtX3BpcGVzKSkpDQo+ID4gICNk
ZWZpbmUgICBJQ0xfUENPREVfU0FHVl9ERV9NRU1fU1NfQ09ORklHCTB4ZQ0KPiA+ICAjZGVmaW5l
ICAgICBJQ0xfUENPREVfUkVQX1FHVl9NQVNLCQlSRUdfR0VOTUFTSygxLCAwKQ0KPiA+ICAjZGVm
aW5lICAgICBJQ0xfUENPREVfUkVQX1FHVl9TQUZFDQo+IAlSRUdfRklFTERfUFJFUChJQ0xfUENP
REVfUkVQX1FHVl9NQVNLLCAwKQ0KPiA+IC0tDQo+ID4gMi40My4wDQo+IA0KPiAtLQ0KPiBWaWxs
ZSBTeXJqw6Rsw6QNCj4gSW50ZWwNCg==
