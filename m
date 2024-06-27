Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE53BC2BD09
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 13:43:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7220A10EA9F;
	Thu, 27 Jun 2024 13:43:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kwcSEbOv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D861510E32F
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jun 2024 13:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719495797; x=1751031797;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=vrHThPwiJFG/nvHXLdFs6Qn7yw6o4/2v/MQiEWdHCSw=;
 b=kwcSEbOvDZBcakjPin3mlaDodr0496JYzc5WpDwP5SeYKJXN0NZyQGLa
 NsMDlyx418MGgmb5lLPFJhV2ugE7MrgtfvzzekzVN8Kgi1ULIqb5GRgVm
 7KSgiNMW7Y+s2XZliuLR5fmMxR7i41fzJXoIcYOqgoY/F0yfzvtOj4C1X
 GzNwqglMLVKdOmiyZB4CkckZCvnYeeTHwUTIX3c5wm5AAmxts9ZP3AheH
 ASemPgQ10cStbpWNF+JiUudrJh0A9iGBg+5VdF+eFnQY/gJKtGvVyjyPH
 ukqadGdcLPGnF5uykUfg7jVfHGDpDpVxWAwDKOJ9z1A+yORgzqlES4UDK w==;
X-CSE-ConnectionGUID: ADX7UqqgTMuiphdapKVKcA==
X-CSE-MsgGUID: dglw8Jx2SNmuLfT1zgum/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16442273"
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="16442273"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 06:43:16 -0700
X-CSE-ConnectionGUID: 4xZHsps+S66pTE8nBqOf9A==
X-CSE-MsgGUID: PbSS8FMKRqSLIWcNjXdEeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="44206608"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jun 2024 06:43:16 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 06:43:16 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 27 Jun 2024 06:43:16 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 27 Jun 2024 06:43:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BYhy4wzwsVrGPSuwXwPJoPClnMG5LDkSbpoJGdFiLZ28IUyhuvDQy2B8fbzjGqlsStuorosmngH+nJaXaZhGqHOq/CsoNNfgkfLn7PAbu9JtPjBdXje3kuE5bw+Iya9sAT2p9i5fcD9MdQjrUyR1R+0wZ7zERNpz8LtO8XuBi/EaeadilCh+PF9nUR+oP2v1p+V+z9GeoQtnBWDevpskMUsGWOYV39va271j9q11ICV4mUzO9lP6riCjC6BLAmlqgUKXfK8n6Opx9pLX8IPpkeGew3E+Wueffkj8XNXtSxpBVzlSublpliAl+Q5t/1r0jbzMh+KolZrFTZEDTOj1ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vrHThPwiJFG/nvHXLdFs6Qn7yw6o4/2v/MQiEWdHCSw=;
 b=dpreVQHCvrlmdMRS2JKANMa1JlwrxhGnjoTsqcm2WrFQkTXzsPeFjb4N5ERqxs5o77VQVK0vJTuY3BCdtU25Cu+X942EUxkmnxnNV0GMmtaVJliGsLDMCbpmIrCZywS1s4Qmx46fYbc5A33U1QF09cgCexCQK1Eynu1SwSyb+10P18UiE8BkLLsN6n7vFKcsBS+q+DAc8A+RkGHvNuOXUx0h6f0UNq22LecFzJwVx16TcG2mDk02Z+rFmCI9/j62DzEv7xwlVtGxVRY1rNlCUaOicJJbS4MNcEt3crrSFwCTOamdq2vCgGCydf69LjEH00PXuMSXzAQ2GXWodFBqsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CY8PR11MB7685.namprd11.prod.outlook.com (2603:10b6:930:73::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 13:43:11 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%7]) with mapi id 15.20.7698.032; Thu, 27 Jun 2024
 13:43:11 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH v5 0/2] drm/xe/oa: Add NO_PREEMPT property
Thread-Topic: [PATCH v5 0/2] drm/xe/oa: Add NO_PREEMPT property
Thread-Index: AQHax26z5QkwKpS+fU6CCkMv1cysJLHaRHkAgAAu5wCAAMFPgIAAbFYA
Date: Thu, 27 Jun 2024 13:43:10 +0000
Message-ID: <6c3e943dacaa7ecb6445a447886b799a570a530d.camel@intel.com>
References: <20240626021343.1054590-1-ashutosh.dixit@intel.com>
 <760e7d389b66748e839cc249933a9a95d0ad977f.camel@intel.com>
 <87frszh4m5.wl-ashutosh.dixit@intel.com>
 <87ed8ihn5g.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87ed8ihn5g.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CY8PR11MB7685:EE_
x-ms-office365-filtering-correlation-id: 4ade05ec-637c-4256-1aca-08dc96af15e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MHNGeVNXRVdGOW5ZRUF0cnZLK3QvWWJWNlkwL0JJbjc5YVJSZVowTUl2V1RI?=
 =?utf-8?B?OStucERyT01mOWFFRFBEUTd3Y3RLY0xEK3VlNDhIVDhZQ1NKVXI5NnRTR2k5?=
 =?utf-8?B?WnBnVVlCMEIzVnQ4dVNYTUFkQU1nVjRCNFR1Q0pKQ0tnSmVOTTZWdGhDOHh6?=
 =?utf-8?B?TUNzOFB4TmpyVVdPd0d3KytzRVo2bllhN3E3dFZKK3BRTGxhczVKN2xONXpn?=
 =?utf-8?B?ZHFDMVdUdy9DQkd2TUNRS3Bnb3BDakd1dGtXc29xblJmZ2NUa1UyRE9pV0hV?=
 =?utf-8?B?RndEK3ZzM0JHeTFvV3FRbGRIM3VRaG5Lc0F5dXpveGhhZUtxUWZIS09mUTkw?=
 =?utf-8?B?bEF1aElhaGlxQUtEb3U0TmFiSC9sd2VwM2dnTVJ2VUhqZWNqQ21EdXpqM1Qz?=
 =?utf-8?B?dUhJcmNRUlg5RWpkZ0xlSWpXSGF3TEE5QXFld1VJckppSVVKRlVzT05jZ0FT?=
 =?utf-8?B?RFAvdzlXZk0wb1EyeThPVzZaclVZVXE2QWVBUHk4MmZTWFU4aURwWDlpSDUy?=
 =?utf-8?B?bHFITWRPNHl4YzZCbzhmZ2MvQSt1dGlCL2Vmcnc3d0FnaDF2bDFVUDFXZk52?=
 =?utf-8?B?N1pLU2NUSHhuUjlMQ1RCN044WWpTZ25QWE1lQytTTFBHdG1GMVk2VkpPa2c5?=
 =?utf-8?B?SkhrWG9TdElGRGJzQ0hyT0c5UEFwczg1WGtxODdNNXNQWnYvc3BHeVh2d1NH?=
 =?utf-8?B?T3hEOWVFRWp4U0w5bEhPd0NOOVBRZVJLdWZ3Y2h2VzUrUVcwd1NFSUwwY3JO?=
 =?utf-8?B?TTdkN0ZVaWk0c2lNQ0NNNmlVN3YyZVFTVXR0aFdQRnNBNGdXZnJnUk5OamtQ?=
 =?utf-8?B?eEJ2QWUxQTJDeVBGSFJ6M2xNOVVpM28xZzhucHdUYUV2Q05NUDhWZEhpNHAw?=
 =?utf-8?B?WFYvWXM5cmRRV3pNbVh6clV0K0ZHdk55eFp1VU02citDSDRWR2s0dE83ZDJ4?=
 =?utf-8?B?SjJpVGpwZ2R0b0JPNzNvS1FydG5OUkpsNDRVcFREbm9SYytVbXdaYUFKa21H?=
 =?utf-8?B?Q3pUTXBwUXdudDMzTEozYjBRTXpjRW92UkEwVFlpMTFydWFaRHlYdG1QRi9W?=
 =?utf-8?B?LzdIVzdjM1laa2xWeDMvOXhKakNJTnA1alZOeW1tZ3BPYkZlMGg5akY1b05G?=
 =?utf-8?B?RncycEgzZTMxYitoVmhQMGxOZGR0TzBacGprMUhHUGdmRHErYVhCTTJUN2xu?=
 =?utf-8?B?SW5RdkM1Qkc4NWZNUUtXR2RpeS9sd1Zack1ZV0VrMUQxd004VWEzcWdGOVY0?=
 =?utf-8?B?VFJBODc3SFNGYzB1ZkFhdUVVMWlhUWk1ZVkwNGJxQXAwSEMvblFVWmlTQW1r?=
 =?utf-8?B?TXo1b2Y3L0hvakhycFducWVTeWVnSllHK0RiUldBQkVFQUtiaXp3ZnROYmhO?=
 =?utf-8?B?Tkg0a3dKRWFqSk8vL2puTDI4bXZLaUozKzFIQmVQRGJRSTRjVWdLd2ZaZ0tM?=
 =?utf-8?B?bklkRTdBWEZIbU1laXRKMDBaR1d1Sjl4WFIwWVkvZWJtaGZQV09meHRmRGRX?=
 =?utf-8?B?MXJyaHVhb1pscWNkKy81M2ZlbHQ2dSsrSjNkTHMrc0YrNllEWm1MTDcvaU9p?=
 =?utf-8?B?T0V3OWsyd21ybFE3YkE2RWlTb2doOHBuZ2pRenpDSjA4bjFreWdpYS9CZkFL?=
 =?utf-8?B?ZThLTG1FSTEzTlRZYUFDMTVGSjJHVXoxcER3QXNaRnpsN0dmMXp1RlN3YmFP?=
 =?utf-8?B?RnJydnZ6YmRUQjVrWFZnNWpBVERESkFaZU92emYzYzA0enV0ZGtLeEdtTGdy?=
 =?utf-8?B?WkZKUkZNNUxnWE9XeUo4Y1IrZEZMTjBHRVpkN1dLNHlFcG9RUzFWeTF2Uytl?=
 =?utf-8?Q?abXcviB//nFrDjD/vGDo5+jRrfFZ40ZsU3Mms=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YlN4OXN6WWlZQ0hCeCtRaWtERmJOaXp6M2FWNDNoTFFtQVY3ZEpvUm1EVlI4?=
 =?utf-8?B?eE5jd0g2QWtMRStxVFo5cmxOZmpkOVFNYWY5SjRaQ29pWXZFWXFIN2MwdFJl?=
 =?utf-8?B?cWlvVmZDOEc5S29aVnQrcG1yQkNQbForUFZtc0Z3WGpJVzQ2V3BWOHB6ek9u?=
 =?utf-8?B?NU15K25CUm1Cc0dtSjBUbGlGOXo0bS9JWWtUbmFLZXY0UVU5RzgzMHVuWG40?=
 =?utf-8?B?Q0FuV0hBemF1T2xLdEVKNDFzZFovZXErblBNOWNqOGl0K2tvQzRwV1gyUXJC?=
 =?utf-8?B?NnFTZWFkQlBzM2grU0lNemFyeURjQ05FYXlDZXFTV0VOaVNuMXN6ZFcrcjFz?=
 =?utf-8?B?RGc4NitLMEs3VVNRa3FoM0M0WGcvbW5IS1hVbHcyeEFmM1NPa2dEczV4RjRs?=
 =?utf-8?B?S0dhZlRPRU82YXJiVjE3VU5Ia1FFNHhjaFlLSmZqUE16SU5UVXhJV09tdlRj?=
 =?utf-8?B?NUdWT2ttcmZKWWtGdmcvc1RnWVNBQ0dZbjd3MnFBMU4raFJHdmt1eHZlUjZB?=
 =?utf-8?B?UVVXQnNBelM0NDJ2QUJtc2JDNklOUzMrV2FtN0VzMGVTNUhLaFZYWktuUWpJ?=
 =?utf-8?B?RXZRNUZ0d29BRiszbWJNS2JUNHBTRGdmWW42RnlvUC9VcUpBMDVRcmVrZVpp?=
 =?utf-8?B?UlZPQnVWUlhJMTBkV2ZhZndjczU2RGo0clFScEl4dEVuOVJvQXAzNERDNmtM?=
 =?utf-8?B?OTBlMEJucXRRbmVZQzdtNUFzVGh0ZG1zVi92ZE1tRmV1NnE2SzB5U3QrdUgy?=
 =?utf-8?B?QmhMWkJUd3I1cEIraHRnTXNJOERvTVJwNGFvYjEvaWRyVDV2ei94TTRXL0tn?=
 =?utf-8?B?Q3FVVUlTcWhYcVFkZUQ1a1RSMEhZU0JRdkg1K1JuaG5NTlN0UTJTb2daZzVt?=
 =?utf-8?B?MUtza1JNZmZZU2NRdFgrUVR0eU0ydjhTMzlieGJWVXFsTXFCSUplWHhEUHFB?=
 =?utf-8?B?QTRZaE5JZjdNMGFBbHp0NE1TTHpSZzI4ZFZlZ0NTMDZaZ2w5dTJ4aXc3dVpP?=
 =?utf-8?B?d05lVm9ybjNuVjFleUR6SWlUdlZidDdXT09LdS9OUVhqRmVLcjZsa2pGL3pz?=
 =?utf-8?B?ZjE1M1ZCVmVCa1VoaDZ0MytaOStLekYrNjNUWkluenlPN2F0eExTVy9EOXY3?=
 =?utf-8?B?Nkk2TG4rYUNkNXFNcDBoQ0l3YXBjd1FsV0VOeENiQk5SYklaZ0VCL0g0Um9k?=
 =?utf-8?B?WStWSllkYmZkTFpXcjhNRHo4Q09XNFdVQXI5V2FPUUNvdFQ1enYrRndHNWlB?=
 =?utf-8?B?cnNGL0Fxa2NvckVkR0U2SjZWRE55RC9TMG9Hb3VFalBIVkgxNk9yb2lGWXZX?=
 =?utf-8?B?ZUY1RkpBcmRJRW9zM0xMZ1ZGWWNRQVp3bHhtWlNDOTVOc3Z3Vm9oUmwvVEM4?=
 =?utf-8?B?c2V6MCtjeUQrT2hQQ1l5cTU3cXlrL05mT1BLcGUwaU9TK3RsU1l0ZXdSdVBB?=
 =?utf-8?B?ZzUxZCtzR2pyYS9JR3ZmOHppTjlEOC9MZDB4ekUvL3dDdWlCSUtFMG54bDVW?=
 =?utf-8?B?K1Q5MWwzTUIxOXJhK2F3MXZBSXhCQU5UalUxVUNNTmFmenpHWTk1S1JuU0ZG?=
 =?utf-8?B?UEhwMVBORzZlOEkrYjlSTVEzN3NiUEk3alE4emFiRW1pZWVta2xNUHVFaUNV?=
 =?utf-8?B?M3Zwd3p6MzBBVFlreWw2ZWlDeFlwMGFVd2h5b0IyK1VjNUhrT2c2RjV1SVZS?=
 =?utf-8?B?cVdHWGYyWlFBUG5xRlhsVFV1SmJDakxRdmhQN0YwTkZ0THZTelE1a3gveTBD?=
 =?utf-8?B?Qy8rV2NIdHJWMlltamVJcjdJV2tIRXUzVE45M0NXZlIvRGpEaVdJak1IT1c0?=
 =?utf-8?B?OXplcHFtbkVFZDg0QUJyL0Z5bzhkRlpHSDVXL0NPanZwWDd5TTJqRWFCaDZk?=
 =?utf-8?B?MW5RUVg1S2F3SUtiaG5uMUt2M1A5eUI4RklFR1RSWUQ4MytQT3V3dWpvQWpy?=
 =?utf-8?B?aUQ3Qjg4dEtTZnpZcGlHY0JRUnpFMGVhNmM1ZWhmVDN4amJBMGlvOXAzd1Bh?=
 =?utf-8?B?dUZpaXlOdmNTbFlTeW1ZWi8zdXJDSW9TamJCVU12bC9SNTB1elUzNE1iUjMv?=
 =?utf-8?B?Sk9NN3hQZEVFQ2RqNld4L2N0UVNGTEIwN2trVXAvTW9aM1lKV25KLzJlTXRq?=
 =?utf-8?B?eUdKL3lNK2U5QzVuMEJ2dnpmMWplaDZxaUxTN05CQzM1OVNsSFllcHdWTjlX?=
 =?utf-8?B?WXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <887DD547E5ED5140A38B449D2841121B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ade05ec-637c-4256-1aca-08dc96af15e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2024 13:43:10.9934 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9/yOAd76EPGh8tvw+TRS0Sf8KQubheo8aAlBTbefMwDWxMz10J1Mx63/vBx3nKkAEy3E8d5VpY1r545i1Qldwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7685
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

T24gVGh1LCAyMDI0LTA2LTI3IGF0IDAwOjE1IC0wNzAwLCBEaXhpdCwgQXNodXRvc2ggd3JvdGU6
DQo+IE9uIFdlZCwgMjYgSnVuIDIwMjQgMTI6NDM6MzAgLTA3MDAsIERpeGl0LCBBc2h1dG9zaCB3
cm90ZToNCj4gPiANCj4gPiBPbiBXZWQsIDI2IEp1biAyMDI0IDA5OjU1OjQwIC0wNzAwLCBTb3V6
YSwgSm9zZSB3cm90ZToNCj4gPiA+IA0KPiA+ID4gT24gVHVlLCAyMDI0LTA2LTI1IGF0IDE5OjEz
IC0wNzAwLCBBc2h1dG9zaCBEaXhpdCB3cm90ZToNCj4gPiA+ID4gQWRkIERSTV9YRV9PQV9QUk9Q
RVJUWV9OT19QUkVFTVBUIHByb3BlcnR5LiBUaGlzIGlzIGludGVuZGVkIHRvIGJlIFhlIEd1Qw0K
PiA+ID4gPiBlcXVpdmFsZW50IG9mIGk5MTUgcHJvcGVydHkgRFJNX0k5MTVfUEVSRl9QUk9QX0hP
TERfUFJFRU1QVElPTi4NCj4gPiA+ID4gDQo+ID4gPiA+IHYyOiBJbnRyb2R1Y2Ugbm9fcHJlZW1w
dCBleGVjIHF1ZXVlIG9wDQo+ID4gPiA+IHYzOiBJbnRyb2R1Y2Ugc2V0X25vX3ByZWVtcHQgYW5k
IGNsZWFyX25vX3ByZWVtcHQgZXhlYyBxdWV1ZSBvcCdzDQo+ID4gPiA+IHY0OiBSZXZlcnQgdG8g
djEsIHdoaWNoIGRvZXNuJ3QgYWRkIG5ldyBleGVjIHF1ZXVlIG9wJ3MNCj4gPiA+ID4gdjU6IFNh
bWUgYXMgdjQsIGV4Y2VwdCBhZGRlZCAndWFwaScgdG8gUGF0Y2ggMi8yIHRpdGxlDQo+ID4gPiAN
Cj4gPiA+IE1lc2EvVU1EIHVBUEkgdXNlcjogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3Jn
L21lc2EvbWVzYS8tL21lcmdlX3JlcXVlc3RzLzI5MzEyDQo+ID4gPiBQbGVhc2UgbGV0cyBwdXNo
IHRvIG1ha2UgaXQgcGFydCBvZiB0aGUgc2FtZSBrZXJuZWwgcmVsZWFzZSBhcyBvdGhlciBPQSBw
YXRjaGVzLg0KPiA+IA0KPiA+IEkganVzdCBub3cgbWVyZ2VkIHRoaXMsIEkgdGhpbmsgaXQgd2ls
bCBtYWtlIGl0IGludG8gdGhlIHNhbWUga2VybmVsDQo+ID4gcmVsZWFzZSBhcyB0aGUgb3RoZXIg
T0EgcGF0Y2hlcy4gSWYgbm90LCBJIHdpbGwgdXBkYXRlLg0KPiANCj4gQWNjb3JkaW5nIHRvIFJv
ZHJpZ28ncyA2LjExIFBSLCBsb29rcyBsaWtlIGFsbCBPQSBwYXRjaGVzIHNob3VsZCBtYWtlIGl0
DQo+IGludG8gNi4xMToNCj4gDQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2ludGVsLXhlL1pu
eVc5UmRDX2FXU2xhX3FAaW50ZWwuY29tL1QvI3UNCg0KQXdlc29tZS4gdGhhbmsgeW91DQoNCj4g
DQo+IA0KPiA+IA0KPiA+ID4gDQo+ID4gPiBBY2tlZC1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6
YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQo+ID4gDQo+ID4gVGhhbmtzLiBBbHNvLCB0aGFua3Mg
VW1lc2ggZm9yIHJldmlld2luZy4NCj4gPiANCj4gPiBBc2h1dG9zaA0KPiA+IA0KPiA+IA0KPiA+
ID4gDQo+ID4gPiA+IA0KPiA+ID4gPiBBc2h1dG9zaCBEaXhpdCAoMik6DQo+ID4gPiA+ICAgZHJt
L3hlL29hOiBBbGxvdyBzdHJlYW0gZW5hYmxlL2Rpc2FibGUgZnVuY3Rpb25zIHRvIHJldHVybiBl
cnJvcg0KPiA+ID4gPiAgIGRybS94ZS9vYS91YXBpOiBBbGxvdyBwcmVlbXB0aW9uIHRvIGJlIGRp
c2FibGVkIG9uIHRoZSBzdHJlYW0gZXhlYw0KPiA+ID4gPiAgICAgcXVldWUNCj4gPiA+ID4gDQo+
ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfb2EuYyAgICAgICB8IDEwNCArKysrKysrKysr
KysrKysrKysrKysrKysrKy0tLS0tDQo+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfb2Ff
dHlwZXMuaCB8ICAgMyArDQo+ID4gPiA+ICBpbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oICAgICAg
ICB8ICAgNiArKw0KPiA+ID4gPiAgMyBmaWxlcyBjaGFuZ2VkLCA5OCBpbnNlcnRpb25zKCspLCAx
NSBkZWxldGlvbnMoLSkNCj4gPiA+ID4gDQo+ID4gPiANCg0K
