Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C30E65D29
	for <intel-xe@archiver.kernel.org>; Fri, 22 Nov 2024 07:54:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D80410EAE4;
	Fri, 22 Nov 2024 07:54:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nPVzh803";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB1B10E0D8;
 Fri, 22 Nov 2024 07:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732262082; x=1763798082;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xPRwSnxQv/Z9wkuhgw2fLLXgY4wOorqyWZNx15GOxaE=;
 b=nPVzh803qd7L3JL4R0FHeUegqwzvDwmMmZ83xO1sQrfxAD9Vc3A+PMmS
 tR1ygG4xtJdfEO8oecmT1CtzSgQxwiflYoKVF3z28vBKFf6e/D7qthNJD
 MKZVEz20g6MzjupLPcDWK4BCZseh5As3k9GYfyoglySE1WPNiEuOUWDol
 V2NCRkpftAy5+d9vnjiw7KnT7tiuy9FadkscR7tSkU2H+fUxRO9YlL7cp
 XIHo9Bz7u1oFv5QDOLa/QfqwmlaQiHS5xO31M0EGzrvFGHXmsvYk00UJa
 QyykbJ6AFCWfun/LlgCt4VT3+amkvKUo7BYH8aBvWmR1kht9TltBl0fTK w==;
X-CSE-ConnectionGUID: GfisDc9RRHqV11WwwVenRA==
X-CSE-MsgGUID: 4JHdGHpnTlibbn3YBo3Vzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32157331"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="32157331"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 23:54:42 -0800
X-CSE-ConnectionGUID: Cg5Ngv5WSxKK+EMgdi9UCw==
X-CSE-MsgGUID: ARRCY653RieAQAF43FcWsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="91295500"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 23:54:40 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 23:54:39 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 23:54:39 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 23:54:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cjt6hp6/8KzG89C1gL71nt73upBi4YWLi4ccunVQ3xhNtlz+9uOonLjDMFrTKnhylqY/I2bsSYqGARnhfRPKZWsrP8GnyNBhkM5BhAJF263EN2XNjqOiY/ZSqfUPd/7eDla7SM9PImK7N+xrVaXJf0g4mUxF/pVCmTbMGxwL87kwCd+vsZca6pkvNzvZ3mARdPacapSfagDQYZi8T9nSBDqb78TpEQkokbKRX6Ysu/teiD756LuqCqdIAl0ltv+EHmfA2koNN40P1qVqN0UPP2H+P9PvOB5yi4AIYN2xcA6c8a5YBqM9GpRrkuhs8BAeylub+MSoJP62xpiJ7Ge8qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xPRwSnxQv/Z9wkuhgw2fLLXgY4wOorqyWZNx15GOxaE=;
 b=ImvkDxScMl2RIxnMY+gQogeMygNL3MWfSW8weESWfG4TBwFUTqRyc3Lesno4iSfCY5EvzzL2hSow2ArZrHC+h1E9uIaEmixSnoKztP4UMWdee1UAHmFPK6H1k0IYW00yMYEgaqC1oo3y7itEL173ddTO5Z0WbdEPp0VMZGoGI0jbzA46IVncGp6tZsb/gpKAiqmZw2E6KPyJCWwjsWAL2uqtBBLhJVCc0Dxz/YVDbbC+0wZx/TTf/c8sWsXYZIsMkh5SCBjJmmBaStVsrWJ9IZmKthss1SXiOhOEZAETxnaISLqEC8jshZD+dPtrFf9eBtyVEd3A3wNEVEEfLGjy/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22)
 by SJ0PR11MB5939.namprd11.prod.outlook.com (2603:10b6:a03:42e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Fri, 22 Nov
 2024 07:54:36 +0000
Received: from PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::2554:e827:dbde:714]) by PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::2554:e827:dbde:714%7]) with mapi id 15.20.8158.024; Fri, 22 Nov 2024
 07:54:36 +0000
From: "Illipilli, TejasreeX" <tejasreex.illipilli@intel.com>
To: "i915-ci-infra@lists.freedesktop.org" <i915-ci-infra@lists.freedesktop.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBDSS5CQVQ6IGZhaWx1cmUgZm9yIGRybS9pOTE1OiBNU1QgYW5k?=
 =?utf-8?Q?_DDI_cleanups_and_refactoring_(rev3)?=
Thread-Topic: =?utf-8?B?4pyXIENJLkJBVDogZmFpbHVyZSBmb3IgZHJtL2k5MTU6IE1TVCBhbmQgRERJ?=
 =?utf-8?Q?_cleanups_and_refactoring_(rev3)?=
Thread-Index: AQHbO1Tuh70hgIF5s0S7yEDkL4n8l7LC8AHg
Date: Fri, 22 Nov 2024 07:54:36 +0000
Message-ID: <PH8PR11MB6753EE002190277D94DA314BF2232@PH8PR11MB6753.namprd11.prod.outlook.com>
References: <cover.1732106557.git.jani.nikula@intel.com>
 <173211120756.722476.1061959015010963380@b555e5b46a47>
 <87o72a0zrd.fsf@intel.com>
In-Reply-To: <87o72a0zrd.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6753:EE_|SJ0PR11MB5939:EE_
x-ms-office365-filtering-correlation-id: 6e719592-7d35-404b-eb22-08dd0acae8cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?WlJqdkRSOXNKOGtoeklSR3djbUNQVVBRd2VIUGFkcTlsQWFyNWQxNmVYbHox?=
 =?utf-8?B?OWRaZGJwRndxZzViVG04Vllmdktma3J1YzJzb3lxR2d3YXJ1VkFIdlJ6V2Y2?=
 =?utf-8?B?d0Y3M0p6OURLZXlsblJMODlaY282N0thY0RUdStqcUJYbUNPalNtWnpPRUtw?=
 =?utf-8?B?QkloSU8xY213eGJMbC9GdHBtam5EN2ZCTGJOa2N4aGRDdHNzRjI1Q1YyYjgv?=
 =?utf-8?B?N3NRclVJUmIxNlNPbG14SVJZaE9ENUJNNFUxa3V1U2ZXd2JMWWpHczBCTHFo?=
 =?utf-8?B?dXZ6OGUxR095WVNTdDRvc0txV1JXaVFtQXRHR3RHMDlQZGhwTkZvWXNvdXF4?=
 =?utf-8?B?WGlTSDljcWxmNWxaVmNFZ0FFelBuMEthalowNTE0RTFJNmJ1S1dKR0YxL0pO?=
 =?utf-8?B?S2RTT1BWWUx6LzBtM3o4dGpUZk11Zjg4R2h0UGpoNlhNYkNYL3lLSUtmMFd1?=
 =?utf-8?B?SElvanc2VGVpMU5QeWpxM0h3WmJ1NmRJM3Z5c3QyalltRktjMWRWSE9aRVFU?=
 =?utf-8?B?RHZqNlYxTUlyOElHOE4vQ0JRVjUrZi9uYU9POFZSV3cvVTVLeEpRaDQ3T3po?=
 =?utf-8?B?bWNKa3k4dkNnOGF2ZXY3RlRIdXlBcWh3S0JrSWdnMjVZaUN2aUl6YlVSK1Ra?=
 =?utf-8?B?RFdCNklGeENNVWRiRDZaeFkwTHhucGZJZ2ptN1VOaXlFRFo5VTJuYkNyby9X?=
 =?utf-8?B?V3owVm1uMUY4Tnhjamd1ZlNYOUdoSUlkWjdkUUdrcHR2NkhubUZOSDBQZll1?=
 =?utf-8?B?Z1hhcHhJa1dxeHh3R2ZBYk91ankvbmhVRDIxMEpFaEVVSk1lb1NIbDlSTFM0?=
 =?utf-8?B?RXRpRW9hYTE4bU04cXh5WGhNTktzVnREUnpPWTU1c1FKcGl6U3N4Vnk4bTNP?=
 =?utf-8?B?TTVETG1RckRpYWlMYzMxZm9XcDdTcVhiL1FtQ1ZzRXdBMUFKNm5Qako1a2lU?=
 =?utf-8?B?dkFveVhIenBvVjY4ajc3Ym4rY0RTZXV0NDJkbTZxSnJ0MFZ4L3JzbGlOWTlE?=
 =?utf-8?B?NHNNQ0VQT2o1SG1YMkxpWG9abUNDeCtpTmFtZVRaNHFianovTm1vS1ByZFlI?=
 =?utf-8?B?WktHV0tiMmNXWlUvckpxVTEyVDNhQy9tWmR3dmM3ZlV5L3M2dWVCS3dDbmV1?=
 =?utf-8?B?Vkc4OW8wdHRXWHFRTFFaMTZRQW5qL21WcmEyY1hPZ3o2TE5VOFBBV0U4d25T?=
 =?utf-8?B?Zk8zWXNuVm1lRkdCNGZ0anF6UVkxWTBPM0sra1NaSWhNbk9Ec1UwSnpWSkRj?=
 =?utf-8?B?NTQ3dEZTRUdoU3hRZXpaak5VL3ZrcDF2MnZVclBvdzh1Vk1FaWYrdlBzbEYr?=
 =?utf-8?B?MEh1WTQ5WlBlY2w4OFNrNXBxU3BzSEpFQzI1U2g4QXVRejg3MjJyOXRHOVNU?=
 =?utf-8?B?N2pOYmZqT2swcGd4WGJkdjNoQXFuMzQ1MGdXc3FHdnFtaEtZVU1aK3A3RHM3?=
 =?utf-8?B?L0YxSll3TVYxUUJhVDNKWjl3MmlGSzYvMEJTTC9FcmRBMUwyZm1rRW5laGM0?=
 =?utf-8?B?M3hQaDhxUGIrVEd2STJZK0IwcVdtK2ZTL3A3Y3doZEozUkhiNms4SWxEWFJk?=
 =?utf-8?B?OG11UjByWlR2ekpobUdjTDVhSlBtYm83NXZlbGFHRCtGZnNOQktGb1hjN0J4?=
 =?utf-8?B?MER3c1B1OVRlL3JUUXpkSnhrWTBkdVNjWWxsby9GK2FyLys4Vjlwd0duY2I5?=
 =?utf-8?B?N2JEdnJpbmN5UVBqR204YkhkMmsrS2NNYkxsSFRKbk1mcGczaldqK2dDTEpM?=
 =?utf-8?Q?sYg50qWVZehvjZAtt+9lQrlJSeM2VfukJAnI/Yf?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6753.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UXR6aHc5SEppZ1M5NUhnTHo5NHZOWWh3ZUZtZ3ZlRkhxOTJVZEU0cWNDeWha?=
 =?utf-8?B?MmZaS0R0VXBxd2ZhbnZ5VzB2T0hicHdLWEl0VzIvSXhWZ1Bqd25ZaWgvKzlo?=
 =?utf-8?B?QlpXUzc5T3pNbXA4ZXNSL3Q4dnFmYm0rS0VZSk5DWHJLN0k5aHp4RWFpemRk?=
 =?utf-8?B?emQxUURGRjhDdE9LWXNJdjllNnBWb3pMdXlhMVRORDF4SDRJbG9iQXRvRjNp?=
 =?utf-8?B?eDhMamp5eFdZazRWWHBMZ2xVUUFOSEozbkFvaHJWU0E1N1g5ci9FSEcveHpr?=
 =?utf-8?B?OVY2azZ3OTRMQUpCU2VRZERTT0RLd05Xb05EU1k5aG5XSTVYRC9nWnA5RUMy?=
 =?utf-8?B?cDR2OUx3dnFsUzNVdUxJYStBRllseU03cm91K3BJR2xkdmFHb2dyeDJkZ1Z5?=
 =?utf-8?B?SU0wYzR3czBseDdVcDJhRFBvZVcvTXJwbmNkeHV0SU1TckcyVFozcHV4WGU5?=
 =?utf-8?B?U016OGRkR3R5RmFaYjUyb2VEbFJpbWxIRit3clFIWXRmbWM2TGdSckQwSVJV?=
 =?utf-8?B?NysySCtyU0t6OC9TWVNwQkR2NndkZ1VaMXh3dkZ4TU42a2JVQ3NxNEhweXUv?=
 =?utf-8?B?bjJvM1ZLYlRNR3U1Zy9DRXlFZGNOaUQ2VUVlMlFUdC9UUWh5UDRqWVMzc1ps?=
 =?utf-8?B?eUlNUlpIVzZKWmVaT3JmZnMxK29SOEM2R1IxdWdaMHJENmFDNXVTNDlQWEZU?=
 =?utf-8?B?eWpPZ2wwWGc4V1g0VWtTQTdleFhDNERDNXN3TnlML24xY1RBMVdsOUZuZGl2?=
 =?utf-8?B?SEVhMm9ubTRDTFdIN2Y4RlkzSlE2RjRFOS94VmM1RUtXeFFZMWhvWnVITTBr?=
 =?utf-8?B?WUFPbmxhK25hUkxka3hQS1FMaCtTdURTQzNHRGRWbVRxUk9mNUFSN2JZUHFl?=
 =?utf-8?B?RkZBRGZPM3diS2l4U1NJbE9YR3JRZENZUmtmTkd4WFUxVzE2UGZwT1huTVJM?=
 =?utf-8?B?Ti9sTC80cWdDWVZlMFdQcnBYWHpIaUpuaWNOSlcwQk83NkZ2ZGdCbzJHRGRa?=
 =?utf-8?B?ODg3c2h0aG9lQjEydTNNRERvYjl1TTFIVjN1TENLUkRMWlBRU3c2YXpBNWlM?=
 =?utf-8?B?QmdjSW03L3VLNU1LTTM3amVmYVgwd0UzSTJ5MDNST0tMTUNLN0pycDRaWWdh?=
 =?utf-8?B?d2JOSWd5UllmRDBSTWJoek0vdUZHaDNOVC9nK1YvZ3RPQ0Q2M2Mwd0pQaU9B?=
 =?utf-8?B?QjJxZkZhOUpNOUR6RnVRdTIrMXNGRDhMVnJuSE5UUTYzbFVDMjJpeG9FVUFI?=
 =?utf-8?B?U1lUK1owUm9wYXpjZ01SaDl2U296clQ0ZEJqdW1PVnVyMHBnOWpxZlFhODFP?=
 =?utf-8?B?TFRmM0RjZlhKUFZoc1M5SDdqTzQrd2ZUZERsRDcvVkpjZXpXREROYlRMajE2?=
 =?utf-8?B?WTc2Sit2cmVtVG1wN3R3c2xaU0FTKzNtOXc5RjZCZTk1cXZmZVNqZDN0T0dl?=
 =?utf-8?B?cmdRQVBaM3dXTllOVVBLc3JWeEJYN1ZUckMrZUI1ekpZdkZnZnF6VDlSTWhW?=
 =?utf-8?B?VVA3UHpzam1IMmZHT2wrWFB3VENST01BZVZvcW01MCsyTVU2cU9xL2huSUN5?=
 =?utf-8?B?czdISXVlam9vbnJ1NTdaK2NZY3Q1Q3JINjFLb0dQOUxqb3ZKSXVYeWtKUkZ5?=
 =?utf-8?B?Z3lhNGJpS0xDUGtidldjNDQ5aEpZVEovLyt6bkVvOWVQYkttUTZOQ3lkVElR?=
 =?utf-8?B?cHhTMnZkTm1oYTlrZ1dzZG9mdy8rSUREZzdiVFZIS043VVNkejRZRUNORzJs?=
 =?utf-8?B?V3YvakFFSVI2b3lKVXpGL2pKaUVwYkpHR3ZNVi9IMWtCaVJaNEg5cWFXL2xp?=
 =?utf-8?B?NWJDa2IwTEJOSGNCSmR3bHFQak5OODAzb2k1N3hXTzlkbzFUUDI2cFNndW8y?=
 =?utf-8?B?VE4yUmM0QWFNWHBJRmtOUjdSU1ZoQVZFTFRVVXJtSGxyN21ZZkVxVkxCd2dH?=
 =?utf-8?B?SkhTNDhKTW5NZHFQSmllYzNodzNiUlZlQnkvc0E2Vkp2VDRaY1g2bnFjc0J0?=
 =?utf-8?B?V3dXTmNzQllwajRKUC9xZ2I5NlI3ODhkWmZYVTR3TjFSc1VoSG9mQUJwTTZz?=
 =?utf-8?B?UFRFQnNSelB4ckRLcnp4d0hCLzhRM1JqSlV4NFprY2NrU0pQTm81a3Y4ZDhx?=
 =?utf-8?B?K3lDS3h5Y3VnSHRxcUswaFhIbHZXcGxHeDVSdHhGL3RyUm44M2xkSWxxNzg2?=
 =?utf-8?B?NWNicHZheGt3UDdaa3oxTjRNSzd2RHpuQU1rVDBKV1dka3p1SUVpVW5LYTJK?=
 =?utf-8?B?UEsyeERTMEFIZlBvWlQwZXp4SGFRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6753.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e719592-7d35-404b-eb22-08dd0acae8cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2024 07:54:36.1467 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PLvhutX2nN9LIp0ng+vgZoCNiyTDG9QJNonb6OHDFk3q2C0alKSKJW7jD6sM2un9PSLVWtyT/5MnWgr+WxYhDI7G94QNXzoiDI2YNS1B1t8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5939
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTQxNTAxLyAt
IENJLkJBVC9YZS5DSS5GdWxsIC0gQWRkcmVzc2VkIGZhaWx1cmVzLCBYZVBXIGNhbm5vdCBiZSBy
ZS1yZXBvcnRlZC4NCg0KVGhhbmtzLA0KVGVqYXNyZWUNCg0KDQotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KRnJvbTogSTkxNS1jaS1pbmZyYSA8aTkxNS1jaS1pbmZyYS1ib3VuY2VzQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEphbmkgTmlrdWxhDQpTZW50OiBXZWRuZXNk
YXksIE5vdmVtYmVyIDIwLCAyMDI0IDc6MzMgUE0NClRvOiBJOTE1LWNpLWluZnJhQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KQ2M6IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KU3ViamVj
dDogUmU6IOKclyBDSS5CQVQ6IGZhaWx1cmUgZm9yIGRybS9pOTE1OiBNU1QgYW5kIERESSBjbGVh
bnVwcyBhbmQgcmVmYWN0b3JpbmcgKHJldjMpDQoNCk9uIFdlZCwgMjAgTm92IDIwMjQsIFBhdGNo
d29yayA8cGF0Y2h3b3JrQGVtZXJpbC5mcmVlZGVza3RvcC5vcmc+IHdyb3RlOg0KPiA9PSBTZXJp
ZXMgRGV0YWlscyA9PQ0KPg0KPiBTZXJpZXM6IGRybS9pOTE1OiBNU1QgYW5kIERESSBjbGVhbnVw
cyBhbmQgcmVmYWN0b3JpbmcgKHJldjMpDQo+IFVSTCAgIDogaHR0cHM6Ly9wYXRjaHdvcmsuZnJl
ZWRlc2t0b3Aub3JnL3Nlcmllcy8xNDE1MDEvDQo+IFN0YXRlIDogZmFpbHVyZQ0KPg0KPiA9PSBT
dW1tYXJ5ID09DQo+DQo+IENJIEJ1ZyBMb2cgLSBjaGFuZ2VzIGZyb20gDQo+IHhlLTIyNTUtNjk5
MmVlNGI5Y2Q1YTU1M2U2ZTQyOWU1OGI5N2FiZWRmNTQ2ZTNlZF9CQVQgLT4gDQo+IHhlLXB3LTE0
MTUwMXYzX0JBVCANCj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PQ0KPg0KPiBTdW1tYXJ5DQo+IC0tLS0tLS0NCj4NCj4gICAqKkZBSUxVUkUqKg0K
Pg0KPiAgIFNlcmlvdXMgdW5rbm93biBjaGFuZ2VzIGNvbWluZyB3aXRoIHhlLXB3LTE0MTUwMXYz
X0JBVCBhYnNvbHV0ZWx5IG5lZWQgdG8gYmUNCj4gICB2ZXJpZmllZCBtYW51YWxseS4NCj4gICAN
Cj4gICBJZiB5b3UgdGhpbmsgdGhlIHJlcG9ydGVkIGNoYW5nZXMgaGF2ZSBub3RoaW5nIHRvIGRv
IHdpdGggdGhlIGNoYW5nZXMNCj4gICBpbnRyb2R1Y2VkIGluIHhlLXB3LTE0MTUwMXYzX0JBVCwg
cGxlYXNlIG5vdGlmeSB5b3VyIGJ1ZyB0ZWFtIChJOTE1LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZykgdG8gYWxsb3cgdGhlbQ0KPiAgIHRvIGRvY3VtZW50IHRoaXMgbmV3IGZhaWx1cmUg
bW9kZSwgd2hpY2ggd2lsbCByZWR1Y2UgZmFsc2UgcG9zaXRpdmVzIGluIENJLg0KPg0KPiAgIA0K
Pg0KPiBQYXJ0aWNpcGF0aW5nIGhvc3RzICg5IC0+IDkpDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQ0KPg0KPiAgIE5vIGNoYW5nZXMgaW4gcGFydGljaXBhdGluZyBob3N0cw0KPg0K
PiBQb3NzaWJsZSBuZXcgaXNzdWVzDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0NCj4NCj4gICBIZXJl
IGFyZSB0aGUgdW5rbm93biBjaGFuZ2VzIHRoYXQgbWF5IGhhdmUgYmVlbiBpbnRyb2R1Y2VkIGlu
IHhlLXB3LTE0MTUwMXYzX0JBVDoNCj4NCj4gIyMjIElHVCBjaGFuZ2VzICMjIw0KPg0KPiAjIyMj
IFBvc3NpYmxlIHJlZ3Jlc3Npb25zICMjIyMNCj4NCj4gICAqIGlndEBrbXNfcHNyQHBzci1wcmlt
YXJ5LXBhZ2UtZmxpcEBlZHAtMToNCj4gICAgIC0gYmF0LWFkbHAtNzogICAgICAgICBbUEFTU11b
MV0gLT4gW0RNRVNHLVdBUk5dWzJdICsxIG90aGVyIHRlc3QgZG1lc2ctd2Fybg0KPiAgICBbMV06
IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2ludGVsLXhlL3hlLTIyNTUtNjk5MmVl
NGI5Y2Q1YTU1M2U2ZTQyOWU1OGI5N2FiZWRmNTQ2ZTNlZC9iYXQtYWRscC03L2lndEBrbXNfcHNy
QHBzci1wcmltYXJ5LXBhZ2UtZmxpcEBlZHAtMS5odG1sDQo+ICAgIFsyXTogDQo+IGh0dHBzOi8v
aW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2ludGVsLXhlL3hlLXB3LTE0MTUwMXYzL2JhdC1hZGxw
LTcvaWcNCj4gdEBrbXNfcHNyQHBzci1wcmltYXJ5LXBhZ2UtZmxpcEBlZHAtMS5odG1sDQoNClVu
cmVsYXRlZCwgcGxlYXNlIHJlLXJlcG9ydC4NCg0KUGxlYXNlIGFsc28gYWRkIHRoZSBSZXBseS1U
bzogSTkxNS1jaS1pbmZyYUBsaXN0cy5mcmVlZGVza3RvcC5vcmcgaGVhZGVyIHRvIHRoZSBtYWls
cy4NCg0KDQo+DQo+ICAgDQo+IEtub3duIGlzc3Vlcw0KPiAtLS0tLS0tLS0tLS0NCj4NCj4gICBI
ZXJlIGFyZSB0aGUgY2hhbmdlcyBmb3VuZCBpbiB4ZS1wdy0xNDE1MDF2M19CQVQgdGhhdCBjb21l
IGZyb20ga25vd24gaXNzdWVzOg0KPg0KPiAjIyMgSUdUIGNoYW5nZXMgIyMjDQo+DQo+ICMjIyMg
SXNzdWVzIGhpdCAjIyMjDQo+DQo+ICAgKiBpZ3RAY29yZV9ob3R1bnBsdWdAdW5iaW5kLXJlYmlu
ZDoNCj4gICAgIC0gYmF0LWFkbHAtNzogICAgICAgICBbUEFTU11bM10gLT4gW0RNRVNHLVdBUk5d
WzRdIChbSW50ZWwgWEUjMzUxN10pDQo+ICAgIFszXTogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEu
b3JnL3RyZWUvaW50ZWwteGUveGUtMjI1NS02OTkyZWU0YjljZDVhNTUzZTZlNDI5ZTU4Yjk3YWJl
ZGY1NDZlM2VkL2JhdC1hZGxwLTcvaWd0QGNvcmVfaG90dW5wbHVnQHVuYmluZC1yZWJpbmQuaHRt
bA0KPiAgICBbNF06IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14
ZS94ZS1wdy0xNDE1MDF2My9iYXQtYWRscC03L2lnDQo+IHRAY29yZV9ob3R1bnBsdWdAdW5iaW5k
LXJlYmluZC5odG1sDQo+DQo+ICAgKiBpZ3RAa21zX3BzckBwc3ItY3Vyc29yLXBsYW5lLW1vdmU6
DQo+ICAgICAtIGJhdC1hZGxwLTc6ICAgICAgICAgW1BBU1NdWzVdIC0+IFtTS0lQXVs2XSAoW0lu
dGVsIFhFIzM0NDNdIC8gW0ludGVsIFhFIzQ1NV0pICszIG90aGVyIHRlc3RzIHNraXANCj4gICAg
WzVdOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14ZS94ZS0yMjU1LTY5
OTJlZTRiOWNkNWE1NTNlNmU0MjllNThiOTdhYmVkZjU0NmUzZWQvYmF0LWFkbHAtNy9pZ3RAa21z
X3BzckBwc3ItY3Vyc29yLXBsYW5lLW1vdmUuaHRtbA0KPiAgICBbNl06IA0KPiBodHRwczovL2lu
dGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14ZS94ZS1wdy0xNDE1MDF2My9iYXQtYWRscC03
L2lnDQo+IHRAa21zX3BzckBwc3ItY3Vyc29yLXBsYW5lLW1vdmUuaHRtbA0KPg0KPiAgIA0KPiAj
IyMjIFdhcm5pbmdzICMjIyMNCj4NCj4gICAqIGlndEB4ZV9leGVjX2ZhdWx0X21vZGVAbWFueS1i
YXNpYzoNCj4gICAgIC0gYmF0LWxubC0xOiAgICAgICAgICBbRE1FU0ctRkFJTF1bN10gKFtJbnRl
bCBYRSMzNDY2XSkgLT4gW0lOQ09NUExFVEVdWzhdIChbSW50ZWwgWEUjMzQ2Nl0pDQo+ICAgIFs3
XTogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvaW50ZWwteGUveGUtMjI1NS02OTky
ZWU0YjljZDVhNTUzZTZlNDI5ZTU4Yjk3YWJlZGY1NDZlM2VkL2JhdC1sbmwtMS9pZ3RAeGVfZXhl
Y19mYXVsdF9tb2RlQG1hbnktYmFzaWMuaHRtbA0KPiAgICBbOF06IA0KPiBodHRwczovL2ludGVs
LWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14ZS94ZS1wdy0xNDE1MDF2My9iYXQtbG5sLTEvaWd0
DQo+IEB4ZV9leGVjX2ZhdWx0X21vZGVAbWFueS1iYXNpYy5odG1sDQo+DQo+ICAgDQo+ICAgW0lu
dGVsIFhFIzM0NDNdOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL3hlL2tlcm5l
bC9pc3N1ZXMvMzQ0Mw0KPiAgIFtJbnRlbCBYRSMzNDY2XTogaHR0cHM6Ly9naXRsYWIuZnJlZWRl
c2t0b3Aub3JnL2RybS94ZS9rZXJuZWwvaXNzdWVzLzM0NjYNCj4gICBbSW50ZWwgWEUjMzUxN106
IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0veGUva2VybmVsL2lzc3Vlcy8zNTE3
DQo+ICAgW0ludGVsIFhFIzQ1NV06IA0KPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcv
ZHJtL3hlL2tlcm5lbC9pc3N1ZXMvNDU1DQo+DQo+DQo+IEJ1aWxkIGNoYW5nZXMNCj4gLS0tLS0t
LS0tLS0tLQ0KPg0KPiAgICogTGludXg6IHhlLTIyNTUtNjk5MmVlNGI5Y2Q1YTU1M2U2ZTQyOWU1
OGI5N2FiZWRmNTQ2ZTNlZCAtPiANCj4geGUtcHctMTQxNTAxdjMNCj4NCj4gICBJR1RfODExODog
MTc3MDcwOTVmMWU1ZDNjMzBmNDYzYjQzMDIyZjAxYzAxNjA1NzliNiBAIGh0dHBzOi8vZ2l0bGFi
LmZyZWVkZXNrdG9wLm9yZy9kcm0vaWd0LWdwdS10b29scy5naXQNCj4gICB4ZS0yMjU1LTY5OTJl
ZTRiOWNkNWE1NTNlNmU0MjllNThiOTdhYmVkZjU0NmUzZWQ6IDY5OTJlZTRiOWNkNWE1NTNlNmU0
MjllNThiOTdhYmVkZjU0NmUzZWQNCj4gICB4ZS1wdy0xNDE1MDF2MzogMTQxNTAxdjMNCj4NCj4g
PT0gTG9ncyA9PQ0KPg0KPiBGb3IgbW9yZSBkZXRhaWxzIHNlZTogDQo+IGh0dHBzOi8vaW50ZWwt
Z2Z4LWNpLjAxLm9yZy90cmVlL2ludGVsLXhlL3hlLXB3LTE0MTUwMXYzL2luZGV4Lmh0bWwNCg0K
LS0NCkphbmkgTmlrdWxhLCBJbnRlbA0K
