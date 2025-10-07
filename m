Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC53CCD184
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 09:13:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF2010E5BF;
	Tue,  7 Oct 2025 09:13:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CdxUGJzI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6667D10E5BF
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 09:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759828379; x=1791364379;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vfPmyaOiTThz36urdqnxdInBlj0ZzAJX0N2cQn8So7M=;
 b=CdxUGJzIhwPKbF4J0/sEFb9OGzu4+eCAY+Wlc9X448vo8PYYjiHOyCVx
 PSNs0z/NDqHyGWDHyGp6U2Tz23JhyDlKVptomJ5h7NlrMtRgwo2EttvVo
 1q3Ij6jK2c/cKsfrPNzu3a4n5ZvObuENQiV+7HIlJIUDwZHXUuNq4/e1t
 pre4nRr/yOcm7hIJNxhNz2cA758tIvQT+i3jfcqfyz2gX21a8g5nwMS8Y
 zIA1HBd5g88621NEPgAbfHgQGdmXX1mFIuUS3qIf1A9jy5DiIxNgvrWKN
 Y6sHDHHHnVOuecYK8wKnjmMNKNJuyEA8erG8NM5Ywu7T4YEv79iV8FAM+ Q==;
X-CSE-ConnectionGUID: kIMlAhdkQJe+QAn+yfdISQ==
X-CSE-MsgGUID: drA6FtwTSHiyjdgt5v6TBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="64623895"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="64623895"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 02:12:58 -0700
X-CSE-ConnectionGUID: YamJpGlwRC6/d0GDGCQ3PA==
X-CSE-MsgGUID: PAMne+3ZTnesWzWYxyw2ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="180155776"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 02:12:59 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 02:12:57 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 02:12:57 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.33) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 02:12:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DTjMvI6eK0FpkkJtzE2ehteIM1FRuynyUXqU1W1TZ727sGLUlUIWhBH8WOMHwAZIXtow4sbIsPI8IQ8HCnqshjgTNBtSp11YN1GKQ9755Cegg2Cl5Hmi7/EwQFdzsL5etfl53fRAnste+p7iV5kNnrtBSRav8WQXNx/r97/006OwJ7mMYzJiMSu7AtohhMz1GE23jPyl4U61HS0icFa9eEB1kcJoxTd9Brllrpb6Tm5SQ48972e/ap+Xv4DtojPZtpIe2Yg+RcZb+8VkXTrmyE6k3K/ZCIONan8W57roKNlrILdviCzo8/HTsrMz/QunUYHn4fZUPs/ibTeEMNwl6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vfPmyaOiTThz36urdqnxdInBlj0ZzAJX0N2cQn8So7M=;
 b=xJ0yuGsGXsaGNphk+Lv+FwqFUlHiVNTBggtwPU95pHEhBYSozPfYJ7sCzW259SuR6t/43z9UPUm06oFXnuEmqj+WkdbU6uwUZsUMmPFqDS+MlefbuiyIx0geShvGnMOU1xpliEx9+T+YGPcBABuj/OQygk+0xpzZWxctpjC9v35/VYWtw0CjFelIr0Okw62Tfqfuc3aCsaBZBkqYzRSU2QT1rSPUfNT9IgiNsit3Of8G6fpN8po9i/RqnJVIzaQ5vu5v9kHKDdOhm9+WYxauK91t9mfKtzmPbq1RzO1Id3r8q9Ze0OMV87FTm4Pkpp3fisDNB8cFJdYYD3Eo6a0JtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH0PR11MB4887.namprd11.prod.outlook.com (2603:10b6:510:30::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Tue, 7 Oct
 2025 09:12:45 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 09:12:45 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
Subject: RE: [PATCH 2/3] drm/xe: Fix copyright in xe_ttm_stolen_mgr
Thread-Topic: [PATCH 2/3] drm/xe: Fix copyright in xe_ttm_stolen_mgr
Thread-Index: AQHcNv4kmGGNMjwPm060oyBolo9u37S2ZvSA
Date: Tue, 7 Oct 2025 09:12:45 +0000
Message-ID: <SJ1PR11MB6204A91432B2438DB634AC9C81E0A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20251006201339.2603160-5-shuicheng.lin@intel.com>
 <20251006201339.2603160-7-shuicheng.lin@intel.com>
In-Reply-To: <20251006201339.2603160-7-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH0PR11MB4887:EE_
x-ms-office365-filtering-correlation-id: bf7e9b8d-5ccc-4fa8-7105-08de0581ad9a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|376014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?OG84OTl1V2NQakpTdm02U3JMZUV0aHhwVTdEVmZ1QlBxN2pJUzJud2dYcXN4?=
 =?utf-8?B?L21KT0sxNUVQbjRZNGZnZHVNK1BsTHJ0ZVIrM2wrSVdKTFl4OGFTUUJpMlBu?=
 =?utf-8?B?Tkx0Zm1DUW5ha3NFU0VVZm9UdlBjRS96SjFxRWRGakFuQzB0d2pBUktLVEt5?=
 =?utf-8?B?bkRDMXZjeWVId09mWTEvemNLUjlpcmNNbC83Rll2b0pOS1Axc3Z3eWVRZlZ5?=
 =?utf-8?B?eGJEZnU1TERyUDR5YUltVE9mZVdna2lVM1pwUi9qamZZR0NnVUJqWEpyMDln?=
 =?utf-8?B?VUx4VmdMY3c5VEpaUldVa0lReXphVnJnbkx0cVM0QUNLQjNqRkFZcFM1UDhT?=
 =?utf-8?B?dGJqWWFsa3BVTXAyenN6ZGZpNTd5SWxiWEU0NHFrQWM1aW9hZDQ0RVIrZnhq?=
 =?utf-8?B?dzdnZGhJL1pZeTRmWlcxRThiZG5LMFA3UGs2Q2FxbldRVnhqS2xKL1V5MXRu?=
 =?utf-8?B?TC81TTZ4V0p2WGl3N2d4d2VWVzI0RzFZaHhWc3RueVI4RjBhdGJyV1JwOHpH?=
 =?utf-8?B?bHpmNEppaE5MOXFuT1R5ZFhLMytxNVUzWWV3cUtyTDZzOGRKWGxEUG1vME1a?=
 =?utf-8?B?SU50enRtVkExb1pQclR4dG00RFViMjdDQ21DeFdLeGlvbW1uYUhlOEUyOEFk?=
 =?utf-8?B?Q2VTVjhjOWtPeDIzK2k2b1hnb0FRZng1TEJqdlJxdXRVWXlxMlRJMCtNMSt6?=
 =?utf-8?B?MTZ2WG5hWFNTWkZuRk1mQUdVSmcyYjQrVHBvWExTMWdyMVd6TGFOUiszZVk1?=
 =?utf-8?B?NjNiQktOb2tsRXIwNVNzZ0dtQW52YkVsL2Vha2hyaDVCYmRHeVRzK3dNWWhS?=
 =?utf-8?B?TlhFRjRqM0ZhUFJMZWFuZm1XMHRKKzFyaXdiMTMrK0oyQ3F1U3JLM1dRbXpm?=
 =?utf-8?B?YXNhME9KMCsyRlZpaDJleENtSU8zdk4yMm0wUlA2QlpDZGV3TVlqb2wvYktK?=
 =?utf-8?B?N0k5d2l5QXJlY3hCY216ajhyc2dMZG5WRTU5RzdTZ0srYzJRQ3Z5LzRJbi9q?=
 =?utf-8?B?OVZaQm9rSGQxWDI0U0Z6ZURYaGdMQnVtemhEWWtDRGNSTkozS2JjQ3pDdFRE?=
 =?utf-8?B?WkdMbVFNQXRHZGJ5UStWamZPQm5KRHNGanFRdlVmd0g2MEdhOU0zODRKd1FP?=
 =?utf-8?B?bTRacmFOUDkvVmw5elI1dTdqTkU4T1l4M1Z5NTBldWphdEhIbVgySjhZaTZB?=
 =?utf-8?B?TG0zZVE4aU8rYnRYNWtvbFpaZ2lPN0J5M0cydXB0Wk5vOHhnU05ndVNsNVJH?=
 =?utf-8?B?MWxHWDVQdjMrYnFENCtVRHF3d0ZaZTBRbTluR2dvdXR5YjIwMlJJTnFRSElU?=
 =?utf-8?B?cU9DRnNLbG5neHhRYmovWkRsNE9kblgvV1JObFhIRHJPNWl3ZTBEcTV2YS9Y?=
 =?utf-8?B?OFQ4T3d6Q1d4UnlvbXppeTlrd1ZJOGg5V3ppb05oeWFlTjVYMnIzMWdnRXRz?=
 =?utf-8?B?RW9FTzVNaUV1ZVVwRE1UYURxNUs0enJBVzViNXkrZTdqUy9vUjgzd1VncnhH?=
 =?utf-8?B?TDQxVDZrNHkxTCtaWlM2ZzJjcFh5cktSNGJWZk5BNGNjWTdTSFhTbWxuNytn?=
 =?utf-8?B?NExiVnlMRDhmQnZxQ3VEdE1STzhJdzg5bXBwZ2w5VCt2Um1oajNMZUlMYWxM?=
 =?utf-8?B?ZGszbXp0K0RqSXh6aSt2UVVHNEtKbDk3c1ZuSVNXeUZyckxHMEtBelRZTXJn?=
 =?utf-8?B?Y1RFRUZwbEJqcDBjTGlweE5HUG94dVRRVEF0ZzhnWW9Vb3Z6RkcvV1Z0a0M5?=
 =?utf-8?B?MDRCNDkwNUoyWXNiYnEwT2NiN25BK1R6YTk1N0ZRSjV5bmZvTnd6V2JjUWNw?=
 =?utf-8?B?Skw3VzgyMGsySSttWVJDSk5KWUtzVzZEeHBMcVJ0RjNOT1hTbWJBYklRYzI2?=
 =?utf-8?B?Zzk2VktLWE81ODBVN1hwT0VHMlFzRmFqbVdWaTVYUGYvQ3BXUGd5NTRUMFVE?=
 =?utf-8?B?OXVwdVlpeThzckh3OWhmaHk0N2trSTdEclI4N3pTLzFEMjlIdHh3NG81ck8w?=
 =?utf-8?B?OWVseFpwYkczS09SdTFFTkg1NXV6ay9ieDhVTDZrMHFOQVgyS2MrSWViLzQ4?=
 =?utf-8?Q?/TnuLD?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S1g0RjdzVnF0and0TE90Y1lUODVYcmx1TzR6cXRRUi9CZk9YS2N5S0ZLL0FD?=
 =?utf-8?B?aEVQZWcwVFc1dXhSdjc4YlR1UmxhR2lkcFNUUlZIa2lGa1Qxb3BSNFMvWUlp?=
 =?utf-8?B?ZUlzbkg3V3lnM2NXRXNseWZ3c24zc01rRjRnWFFVZlF1dXA3Nzhqd2xVT0xr?=
 =?utf-8?B?T0U4MFAvci9HQ0pwQkc4RWsydWowVEp3d0tlMjM3N1ltTmJ5TXNTOEhHNnMw?=
 =?utf-8?B?QmsrQStuK3lKbWl1Q3JNZ2pZSWJIRHAvRjJUR3V6RVkzZ3hwK3VaVDdwZzVX?=
 =?utf-8?B?U3VONHdqa3h2YmRDYmN3QytsK3hoNmJMWkFZVXBvZ3ZBVzBJbXRoSmhCQy9T?=
 =?utf-8?B?c1F6U0RRV1BOdXl5eDF4NVNZUFBQc0pFakF5TW5TMmdBcWdNaldkWTVuK1BN?=
 =?utf-8?B?U3I4MyszcXc2dDhSTTh4ZDUvaE5CMHB4Y2wzUlVYNVVONCt1Z2VSUU5VRGFr?=
 =?utf-8?B?Q2hpQnJ4MUtBb1ZjUjlseDhoSkkyME5CSFcrc2xGMjM2UzBQLzViK3laQ2U3?=
 =?utf-8?B?b2duUFduQzNUa01RQkhYSHpGT00yOFdaMlo1RFhEb0phMEFrZ3VxTUdFZ05T?=
 =?utf-8?B?QzBUNC9yWmdLNjhrZEVoYnQ2bjFESUIrNzI4ckNyUXcwVGNxWW5SMnY2RUxq?=
 =?utf-8?B?UmNiVHZQU2dJaUFUWGdlTXBNdHBYU2Y5WU5SYnRDK2pxWUFXak10UkQ1WVBp?=
 =?utf-8?B?OW02dy9wRHdSQmNicHVucTUvL3o2UXlSdkFKWkVnVG05M2oyMTMrR2xrNXhq?=
 =?utf-8?B?b0x2OTEwRjh2ZXc2VUt4QWlMbUE2L1F6d1NTVkQ4cWovYmZwU0FSbUJGZDdO?=
 =?utf-8?B?U2VwYmFsa3dFb3NrWjZBeGFhK2ExVmtFNzQ1UE9OYmxzcWtIU3NUMHVjVVRr?=
 =?utf-8?B?Z1JTQ1kvdHo3OVJ6aXpZN3VVVFo4b2xSemMwdGRuSWtXdURNZ0FhVWZVWUNw?=
 =?utf-8?B?RDlNNE1peVk2QU5sQmo5TnVRUUFPWXNqVDNrTUhVVUhvaDdPNDk2blY0Y0Vs?=
 =?utf-8?B?eEJTVnp6UUp1MktIMDBYNW1aWHE2M2VXK2syNCtHOE9Wc1FibnNhbjZWNERt?=
 =?utf-8?B?cGtacm43aWdUL1ZhVllHL1gyVGJieWF6M01JemxZR1VJeFB2U2lWMXhuNURR?=
 =?utf-8?B?L1lLcVdEQ3JvZlRaTE9lQndUNGdXeGw3SWlJUHdVZUFhRVdudE1GbTZZTy9T?=
 =?utf-8?B?WDc3RXVlaDVvT1IrV3dIc0h2Yzc1N1ZkTDBadE9PVHZUM2h5cmR0Lzd6VkVI?=
 =?utf-8?B?NUI5OXNPdDZIaHZTUkZScjc5VEErZ2Z1OUtyUXNCWTBCbUUydk51K2E3MkNF?=
 =?utf-8?B?d3IwSmE4S1hqaTJDdDVCbGxZSUlZZUlUTDJXWGRQUGU3dGM3dkJlbFlsS1Qy?=
 =?utf-8?B?THhDejZRQVdnd2NrekFBNWJPOVRtK1FyTGk1VWNlNmY0a3ZiZlFWR0Joa0hH?=
 =?utf-8?B?dktLdDJMMDZ5T1lhV0phanBoOXNsM0Via042WUQvVDdDSzJpMVl4Q3EyZW9K?=
 =?utf-8?B?SkNXdTNjdEYvR1ZuVWJIaDB4cU05S0JNK2N2RmFvN09IVytrT1BzcEhUbE44?=
 =?utf-8?B?S2VtZjF1RWpJN3ZXUU5VWU1QZEZoS3FHeTluT0tOY1V6NjZ1cUhJelY0Y09n?=
 =?utf-8?B?U21YS093UWxwQmpIYzFkOXZCKzh5QlNQZkZHVEl5cE1iQk0yNVlkbFdEZE9C?=
 =?utf-8?B?SnpLc3M3blBjU05LdXJYUkJQeEJ5Nm5IM1RvL2F6ZFdaUG1PaFdQV3JSZXBV?=
 =?utf-8?B?aG9YaXJOT2o0TWpsUTlubXRqZDVrU1FTMEVuR1AwdHBkcFRkYmsxUGdSYU4v?=
 =?utf-8?B?VjhJMEhZc2xTUFB4RU5CT1dBY2FoL2ZLWWxBSVlDM1ArL1VPbkR0MkZJSG0z?=
 =?utf-8?B?WGxQc0VIam41ZFhLeEc3MzdsWkRGdTc4aExmRTF3UU9IWUVITzhZT01pWUNx?=
 =?utf-8?B?ZWJuanYvNlY0VnhsMG02TTVGb1l6emJ4TDRFZkU5MjkrVXlQUWpQK0p6M0dK?=
 =?utf-8?B?ZHh0aW44UWJUV0RjUDQzcDlwUmp3VnNZS1NURXkvcTdSUlVSVlNFOWVuWUVD?=
 =?utf-8?B?UDhjWUlybW1lUlVVNytmZTlUcDFHSE9ibjRja0NsTCttTkxEN2pvWW1PTTl3?=
 =?utf-8?B?NUZOUGtnRWkzWmtPd2dKTGg0VHIvYzRjclp0bjF2eXVwWlRtVWlnekdVUHRC?=
 =?utf-8?Q?AxgT/H5NY1izWn1izT/FfIBKpJmKayn3/R8cQYEQzx6P?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf7e9b8d-5ccc-4fa8-7105-08de0581ad9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2025 09:12:45.4184 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8nDykyBQYclaQ7BhSdMUrq5M53Kw+2oESXM4uv6EDKf1aa9rHzd7CtTbaZ0ApXFlS105TdB4M3wd/Ktfcw6JICbfpxe/AnBD0l5zTx0+ytI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4887
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwteGUgPGludGVs
LXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4gU2h1aWNo
ZW5nIExpbg0KPiBTZW50OiAwNyBPY3RvYmVyIDIwMjUgMDE6NDMNCj4gVG86IGludGVsLXhlQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogTGluLCBTaHVpY2hlbmcgPHNodWljaGVuZy5saW5A
aW50ZWwuY29tPjsgVml2aSwgUm9kcmlnbw0KPiA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4g
U3ViamVjdDogW1BBVENIIDIvM10gZHJtL3hlOiBGaXggY29weXJpZ2h0IGluIHhlX3R0bV9zdG9s
ZW5fbWdyDQo+IA0KPiAtIENvcnJlY3QgUmVkIEhhdCBjb3B5cmlnaHQgeWVhciBmcm9tICIyMDAy
IiB0byAiMjAyMiIuDQo+IC0gU29ydCB0aGUgaW5jbHVkZSBsaW5lcyBhbHBoYWJldGljYWxseS4N
Cj4gDQo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlcyBpbnRlbmRlZC4NCj4gDQo+IENjOiBSb2RyaWdv
IFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFNodWljaGVu
ZyBMaW4gPHNodWljaGVuZy5saW5AaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV90dG1fc3RvbGVuX21nci5jIHwgNCArKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV90dG1fc3RvbGVuX21nci5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3R0bV9zdG9sZW5fbWdyLmMNCj4gaW5kZXggZGM1ODgyNTU2NzRkLi45YjAwYmRjOGVmMWEgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90dG1fc3RvbGVuX21nci5jDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90dG1fc3RvbGVuX21nci5jDQo+IEBAIC0xLDcgKzEs
NyBAQA0KPiAgLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVA0KPiAgLyoNCj4gICAqIENv
cHlyaWdodCDCqSAyMDIxLTIwMjMgSW50ZWwgQ29ycG9yYXRpb24NCj4gLSAqIENvcHlyaWdodCAo
QykgMjAyMS0yMDAyIFJlZCBIYXQNCj4gKyAqIENvcHlyaWdodCAoQykgMjAyMS0yMDIyIFJlZCBI
YXQNCj4gICAqLw0KPiANCj4gICNpbmNsdWRlIDxkcm0vZHJtX21hbmFnZWQuaD4NCj4gQEAgLTI0
LDggKzI0LDggQEANCj4gICNpbmNsdWRlICJ4ZV9zcmlvdi5oIg0KPiAgI2luY2x1ZGUgInhlX3R0
bV9zdG9sZW5fbWdyLmgiDQo+ICAjaW5jbHVkZSAieGVfdHRtX3ZyYW1fbWdyLmgiDQo+IC0jaW5j
bHVkZSAieGVfd2EuaCINCj4gICNpbmNsdWRlICJ4ZV92cmFtLmgiDQo+ICsjaW5jbHVkZSAieGVf
d2EuaCINCg0KUmV2aWV3ZWQtYnk6IFRlamFzIFVwYWRoeWF5IDx0ZWphcy51cGFkaHlheUBpbnRl
bC5jb20+DQoNClRlamFzDQo+IA0KPiAgc3RydWN0IHhlX3R0bV9zdG9sZW5fbWdyIHsNCj4gIAlz
dHJ1Y3QgeGVfdHRtX3ZyYW1fbWdyIGJhc2U7DQo+IC0tDQo+IDIuNDkuMA0KDQo=
