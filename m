Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC7BC3DA42
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jul 2024 17:32:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1784310E5E3;
	Wed, 10 Jul 2024 17:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="URuUBGhg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA4610E5E3
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jul 2024 17:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720632723; x=1752168723;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=pSxm/M+P17LSbFCji3HJ1ssVH/NDCsvE4vZ83PaJ8yk=;
 b=URuUBGhgdMJVkxAlCANcLjgi2tvezdp28rEaZs1HgJ3hami69nDjepuS
 aWXjrrHG7Cb1Vo5CEqfckUH9RuUB5po5RR7Ft/IYKZ3tR9Tp1yPa0C6mC
 5PlxdnJaimt+N0Ffp9zZZtQRmGU8rGrH4g5yRlHG+OsNG3ejja4yCMylS
 bc2/Np1kRIlHtQ8VzENWdn7o6WVuktGoRJEk2rDuRvLECv6cnRE+O5V/d
 TCW/hVWbY0Pnz6g6eXQgqwFHcPh1ta23x5iovy5uOgZem9iP/Yxr/6I4b
 mlihiOqT12jQ+vvetx5RHpLZC3HudZ8faVV8MbMf4hZFu1FBAnnPAF64h A==;
X-CSE-ConnectionGUID: E7tbIbUWRwq+FYziKcOTpg==
X-CSE-MsgGUID: Cpyez4IIQQu9IEjvTw1axQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17815440"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="17815440"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 10:32:03 -0700
X-CSE-ConnectionGUID: xBVWVW91Tiawgg5omkS/Rg==
X-CSE-MsgGUID: Dfk1Fif/S0+Q/eCmgylfnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="48938170"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jul 2024 10:32:03 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 10:32:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 10:32:01 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 10 Jul 2024 10:32:01 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 10 Jul 2024 10:32:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EJnzSsvh2x/4Bnij5HoFUUoMU18iLT4f844YMGf3b7aYmaUC15VmZfcgTUnGz3QldXk2Sxvn3/pQZYECFS9ZeSA3HNVjYKI/bl3OGORyUpQSlBhK6SLvlwSFqo+ynEVglu54u7HM6p1PZkkxrXfojDJfc5/lwRt3OmxMGQIAF7gs2dFdr7g8DO0zcIjshbJQB07IySaLiTkGfRLqjllJeTfwzibWkNuDjeVnMQC8E/NkHdo+C+tsyYHolTHkoflv3DS5zvMsM9+BC0YP0LpnD1nxqi2uVgCqGJn8fTR6PuzSRvtzRvKeAJcWo26GIEqGHnJVTjjr76gp5Aiox/Q9Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSxm/M+P17LSbFCji3HJ1ssVH/NDCsvE4vZ83PaJ8yk=;
 b=oAfPZtivmVMM73w9HdZHfASKb9WOueVyh5lWtTO+5c11XcV2Rizh5osvjZjDEKZZahWHnj2ghCRT6Ee3YWMK/S5s2oWLDFZGM21j6aOqN4DkS/zmzoYtNR50Yab5dIpunlmlDVEPd0hgLLyg09y+DFYvlhHfuGrndgBxr0rXBDffTRsVHWwIepkmeWccaVPhZWGsvieVuNWUIvhLekOCEfEqLVFs0kzYDB5pEitrQVjYlMbd+Y1TiEiJJHjWYwuRa9ZmBVcGn4T8XhX3UXvWOZ1R/XYqRAjcvk/9jcnA2lL0C6g8cQqHIqPabY7iN8Vf0yYOrT5aRMVlpu8Ytxef2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SA3PR11MB8074.namprd11.prod.outlook.com (2603:10b6:806:302::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Wed, 10 Jul
 2024 17:31:58 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%7]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 17:31:58 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Mishra, Pallavi" <pallavi.mishra@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2] drm/xe/xe2: Enable Priority Mem Read
Thread-Topic: [PATCH v2] drm/xe/xe2: Enable Priority Mem Read
Thread-Index: AQHasljTNLcFRRGQFkyYbD/fJreQ8LHweW0A
Date: Wed, 10 Jul 2024 17:31:58 +0000
Message-ID: <a2bc8d72b081ca1625cb87385c49dd7db0e25b11.camel@intel.com>
References: <20240530062509.1529357-1-pallavi.mishra@intel.com>
In-Reply-To: <20240530062509.1529357-1-pallavi.mishra@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SA3PR11MB8074:EE_
x-ms-office365-filtering-correlation-id: fc5a7493-82f0-4f20-bd98-08dca1063379
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZlZ6RCtJektGakpOMkZpWGo4UVlCMGxTODlTbnpSNDZUWWlxL0hHdUphZ1l0?=
 =?utf-8?B?Q2F0WGNpN2J6SDhDeW81aUhlWFlQQTlGelJ5bE9qNzFqM1Q2NFdxZWxYS3hE?=
 =?utf-8?B?V1A4QnFia0JaeXlleEFNd1BhRnF2Y2NjL25FRm9RbEsvQWw2VDEva2VhcDNQ?=
 =?utf-8?B?TGhabTQrbjhLczQzclFFck0zMUxpYm01a2phR2lySm8rWFp3d1FTMno3M1hL?=
 =?utf-8?B?amJGQ0lISkpHWUE5SXRWOWZsWVl1Mkx1ZVNBck9UQ0lhVUZPS2pJYmNUbFpJ?=
 =?utf-8?B?UUxQK1ZOeGwrWlBPNmNzY3BEaDZEbW8zUDYrNEIvU0VYYi9FYnJKcE01ZTA2?=
 =?utf-8?B?R0VCWVQxV21PanprQUxHcVZiaWgrK0NKR3JnWEhIdk5ZNXBjSGhjRVBvemE1?=
 =?utf-8?B?eHV1UTFXMGVrR2I0eVlPQlNaTGsxLzUzR25wdGtxeU9SL0ExZEpPMUxQTnRr?=
 =?utf-8?B?Yk9NalhYMkVNRFZZNUs3WHlDSUtSZUJ2Y2xENUM2QXVaRGZLVGhHb2NDOUNZ?=
 =?utf-8?B?WTBwRlpVRExzamlSNytrSXU1a1lObjNDUXJ3Y0lVUVA5a2IvS0lMU3NWSWlt?=
 =?utf-8?B?YkNiT3VieDJuREdQZjMwSU9UYWJLY0cwcXVKbzIyTjF2cVd6SWM1L2cyclkr?=
 =?utf-8?B?Y2Zya0RQUWc0eXZKSGJwM0xFeVkwTUNzdzVDdFNnUUZqc0VKZHFEakk0TnBK?=
 =?utf-8?B?S3Q4VTU1Q0s3ekRNNDluZWRZc1k1dzMrb2tjU0pHUFp5ejNOZXVlUlZyMXk2?=
 =?utf-8?B?NzFlVzRURVY4djIwa3JMNVJqa0hGOFoxUDNVeTFFVGhZdW1PRkNQbXBvTy9x?=
 =?utf-8?B?azcwMFRIa3RiN1JJUWNXbTUyY1ZXeERXWjdkZGc0QlRYSGRHNXdVTW5LZWJ5?=
 =?utf-8?B?Y05DMExEbkFnQVFLdUR3QWt4dWxKV3ltOGp0SkMvMFFJa0k4R1NuMFYydzhz?=
 =?utf-8?B?R2kvdzE0YlJCRjNncXV6RFMvWmtyOFZGOElHeEFwM0RYUDRzUzBNemxkZU0y?=
 =?utf-8?B?aVN2T0JUL3M4RzF0R0N0OTJZYk8xSHM4c3pER2Z2ZFpIMit5b0JreEdFS1hh?=
 =?utf-8?B?RG83M1cwSHV4ZWROM3ByRzJKZUtscll5a3N3ZHV6QUQ1MndvRk5xOUVlMERq?=
 =?utf-8?B?SmRYcDhVZ2RPekh5aW9nYVdWTjRTWE8waXdwdXJMVnZpTnNaWU9POEpPVE9m?=
 =?utf-8?B?dEFzSjdONG9TVW9ITnRJdXAzZjhSS0ZwVDl1cDVnWFdnK3ZnK0YvUHNKMXBu?=
 =?utf-8?B?bnYvd1BWQmVNZ0drVVhsUnU4d0U3aDdUK1p2N2w1cXFrVkJqdzM2RzE4Mngv?=
 =?utf-8?B?bWRENUMxcHg1bHZoakpwdGZ3d0ZaNlZoTU5odzB5N2RicHpVeVA3ZXFrTDNX?=
 =?utf-8?B?Q3BHT1hkUzJmaWJsMklJZUpoNGRSbzhVamluVGJhMEV4UHF1MTJYQkdNVUpF?=
 =?utf-8?B?MGF3UGFzVm8yLzlLOWdJRHZidElBMjlFdDE1MmNId3ZQZTJDNjhXaC82cFMz?=
 =?utf-8?B?WFFNYVpXSDNLUW10cmdxRzBtWWc4THNoU2tqV1pMVlJoOFVyamdyWjMxUElF?=
 =?utf-8?B?UDdhOEcrRWtJbTdHYWJ2alNHSXpHU1BFa3FORlR2dnloTnRoK0NOYUkyMDd3?=
 =?utf-8?B?RGIrcTVWL3R4R0craVVvVkFVR0lBNE9mc3ROWXVOS0ppUzlNeFdzVTBkNGJt?=
 =?utf-8?B?cjRnTDAyYURVNTFBeEwrYThFbnF1M3B0Zi95UDR2OUNkVHJvMFlrMnJWVlJq?=
 =?utf-8?B?VTdYaVBUa3BldkJOb1BKbnp4Vi9oQ0FIRk8yMVlsTnF6ZlFZM05jOTU2dFQ4?=
 =?utf-8?B?VHcrZUVxSDkrelNjSlAvb00wM0FIYmZVUUYyNGZBd1RHS0VzbWxTaEc5M2FV?=
 =?utf-8?B?V2xvSmkwUUpnNGlLY1RsYVZjSVcvT3lzeDJsZURxSnBvdUE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q3MxRDYrWDdlaHRyWW9kNUFBaTNNQlg2UFdjMjVVSWlVSjZUdldZdGIxbkZE?=
 =?utf-8?B?TGFBZDc0UDdpL09MOWlHVXJJdmY2dVZMTFFaSmUrSWxoUHpHUDI3VHZNQ3B6?=
 =?utf-8?B?RFNZLzhnd1poTlY2WGh4V3NkaFFsWFlvREZKRjl0YXcySHE0YzFCL1FOLy9a?=
 =?utf-8?B?Ykl4RUwxNWY0blVGR1NyYm52VHI1UmFhQTJkajZ0Zy8vcWlwRlVlWmZhU1Vp?=
 =?utf-8?B?Y05oUGhhVWNKd2o1b3hDTW42N0ZQR1ViV2pzRXpPK3BYTno1d0p6ZjlxMDJS?=
 =?utf-8?B?b2RqWnpQS2tKTFB1U3Q0NncxVGptTGgrUC9YSGpzOXlaaXU1NmdBTDQ3WndU?=
 =?utf-8?B?UUVHRE83cWphWFlRUXJ1UlRIN2RvbTdSRGxDREhRMG8wMDd1eUQ4ZW9ueEpH?=
 =?utf-8?B?MjZFUDE1VDRWd0VnV3gyWC83T0huY2tvUVU0QnV0K29HMkVoVXZ5eW1KQVZj?=
 =?utf-8?B?MUVUV1hFT29CUnJ1TkFrbHNMT2JKWWpRWkcxRjJtM3ZKVHRJaUFmREVkKzlr?=
 =?utf-8?B?OGlHcVVSamQwZ0xzZ2RuSDUzM3JRTjczaXVPUHJUYnhoTUlGenM3YmFDVzk3?=
 =?utf-8?B?MnFSOS9SRllvbVFwc3JQUStWcG4yakRUS0ErRlc3VWVzWGNzMXRtQ3MvVldZ?=
 =?utf-8?B?QnNEZEtBSHZpS1FRNzlhdGNkcCtUazhPVStLWWwwL3J5SmxkbC9Uc2w3ZWFU?=
 =?utf-8?B?WjVFZ0tpYy9HVVJYOS91bFQ3L1hNRW1GcjAvMjhYRmJ4eDk0WWFSM0d3N1Js?=
 =?utf-8?B?YmptVGUvejd0bVpubDJvUGU5WldzT2J4VFZ3c0J5RTVST0hUT0YrTk93UGtH?=
 =?utf-8?B?WGI0cERjTU9FeGFQcnJqd0lub0ROOFFvUGx1VThHczNDL3cvZTUwZ1dnYm13?=
 =?utf-8?B?SC8yWWkrOFdNeE9aMXhleW9zTzlnc1FUZkhvVmxjb1I5UDFzaldvWVZIVGdp?=
 =?utf-8?B?WDFiaExvZ1JETjRXb0s4WWxHeVNzRnM0c25OTWdBWlFUd2tvdmg1MW9KMlRy?=
 =?utf-8?B?bnBqU24zZzNOM0pQWXdGRkZ4bnFrOFQ1MjY0dUxpK2JpNUxvRU1oMkdlbWNQ?=
 =?utf-8?B?NzVhS1ZRV01zQmFZTmtJSVlSc0puYStmYU42T2FjQWtwZnppOFpQbUhWQ3hJ?=
 =?utf-8?B?NVJKbFZ2Vko3YUFIV0d1NUM1Y2pQbkNXdXdZZGQ0MkwzWFg0ZzhLalpuZzJu?=
 =?utf-8?B?TlpINFVuc29EMUsrOEUrZWxBb0tLN05hWDFianQ3c1Z3bTNjRllnbi9qblQ5?=
 =?utf-8?B?aktkdlI2RXAva3ZJK1Y5Y1F5ZSs4dzEwNzIxRGVrclpvQ3BwaDk1VnZKZjFu?=
 =?utf-8?B?YWZVcU5VMVNEQjdWZGJzd3V3cjBUTE1QeVBTZGVOSjl1RWovN3hYL0g5djhj?=
 =?utf-8?B?OHlEcWRpRi95dkpIT09tS3VPRVJ3RlBVb2hLSlA4MWtDMXIrOWUwWlVPNmNH?=
 =?utf-8?B?dXhqRG96TUJ5dEJwb0MrTmxMY2dielVXWWVKNkpRNVZCTVFnRmlkMGlBbGN6?=
 =?utf-8?B?VHo5ckdUQVRTWkMzMCtyaFZwQkZJb3ZwVUFHUHNoTnVvUVNoL1BkeGR5WTl6?=
 =?utf-8?B?b1hENVV6ZWNrcDVKMG1hWUZzdVY5dzFQVWZ2QWU2M3V2WnFUeXlTV3BEZXA0?=
 =?utf-8?B?UGovZXFnRXBZWkFVNVNuaUFkNHpLVTVRZFBMUjlDZnFsM0NYKzNSeU5OZUgv?=
 =?utf-8?B?dlF3TFp1M2s3c2J3ZTZKMU1iVjMyTDNKRGZOZnRBcmtsODhRT3NyeGVxaXps?=
 =?utf-8?B?cGFmaVNXaDlVbko1cVQvZGFsUWR4MFZaajlyNWFkVy94WlRsRU1XTldRWEtN?=
 =?utf-8?B?anMvcHhrVFhCaFF4cFZ3a0JQTGVmemtETXhka1MyOTYzVC9YSGE0WC95UG82?=
 =?utf-8?B?VEJYUGErSDZCbVNFZkluM0FzOVlrcEpLbUROOEc3NitqRWZqU1JTaWsyVHRV?=
 =?utf-8?B?MTh3ZllHTHoyMFZEZ0xvOVZqaWVITFZtT3BQbkI2TmVtV0VtV1ZjWFFVK3Fm?=
 =?utf-8?B?QWhvR1dIN2Rhb3IzTDVtaE45SHNQUWhibW54YkdaYW5pOUdlaklIUTBheTZo?=
 =?utf-8?B?Smw0Qkc2QmRhaXh5bnRIMmt0QTlsbkl4Wkl4clF3ajNpV1JmNVBmLzhaQ0Qr?=
 =?utf-8?B?a29JV1h4QjhiL3doOGQ4bGI5cWFvT3JUdVNpalZCaStmUytiak1aUS9WcHc3?=
 =?utf-8?B?emc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1BBD27640FC1E7409A4D445B7FBFE7A6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc5a7493-82f0-4f20-bd98-08dca1063379
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2024 17:31:58.5196 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /QRPtGYAN4zqP5OoOGmhpi6ojNYxesvz0u1nRGoktbd/rimm06PZBOrDQdftUfW9Kxkc3pChle8Ol7Vc2USIpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8074
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

T24gVGh1LCAyMDI0LTA1LTMwIGF0IDExOjU1ICswNTMwLCBQYWxsYXZpIE1pc2hyYSB3cm90ZToN
Cj4gRW5hYmxlIGZlYXR1cmUgdG8gYWxsb3cgbWVtb3J5IHJlYWRzIHRvIHRha2UgYQ0KPiBwcmlv
cml0eSBtZW1vcnkgcGF0aC4gVGhpcyB3aWxsIHJlZHVjZSBsYXRlbmN5DQo+IG9uIHRoZSByZWFk
IHBhdGgsIGJ1dCBtYXkgaW50cm9kdWNlIHJlYWQgYWZ0ZXINCj4gd3JpdGUgKFJBVykgaGF6YXJk
cyBhcyByZWFkIGFuZCB3cml0ZXMgd2lsbCBubw0KPiBsb25nZXIgYmUgb3JkZXJlZC4NCj4gDQo+
IFRvIGF2b2lkIFJBVyBoYXphcmRzLCBTVyBjYW4gdXNlIHRoZSBNSV9NRU1fRkVOQ0UNCj4gY29t
bWFuZCBvciBhbnkgb3RoZXIgTUkgY29tbWFuZCB0aGF0IGdlbmVyYXRlcw0KPiBub24gcG9zdGVk
IG1lbW9yeSB3cml0ZXMuIFRoaXMgd2lsbCBlbnN1cmUgZGF0YQ0KPiBpcyBjb2hlcmVudCBpbiBt
ZW1vcnkgcHJpb3IgdG8gZXhlY3V0aW9uIG9mDQo+IGNvbW1hbmRzIHdoaWNoIHJlYWQgZGF0YSBm
cm9tIG1lbW9yeS4NCj4gDQo+IE5vIHBhdHRlcm4gaWRlbnRpZmllZCBpbiBLTUQgdGhhdCBjb3Vs
ZCBsZWFkIHRvIGENCj4gaGF6YXJkLg0KPiANCj4gdjI6IE1vZGlmeSBjb21taXQgbWVzc2FnZSwg
ZW5hYmxlIHByaW9yaXR5IG1lbQ0KPiByZWFkIGZlYXR1cmUgZm9yIG1lZGlhLCBtb2RpZnkgdmVy
c2lvbiByYW5nZSwNCj4gbW9kaWZ5IGJzcGVjIGRldGFpbCAoTWF0dCBSb3BlcikNCj4gDQo+IEJz
cGVjOiA2MDI5OCwgNjAyMzcsIDYwMTg3LCA2MDE4OA0KDQpNZXNhIGFjaw0KDQpBY2tlZC1ieTog
Sm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQoNCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IFBhbGxhdmkgTWlzaHJhIDxwYWxsYXZpLm1pc2hyYUBpbnRlbC5jb20+DQo+
IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3MveGVfZW5naW5lX3JlZ3MuaCB8ICAxICsN
Cj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuYyAgICAgICAgfCAxMSArKysrKysr
KysrKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3MveGVfZW5naW5lX3JlZ3MuaCBiL2RyaXZlcnMv
Z3B1L2RybS94ZS9yZWdzL3hlX2VuZ2luZV9yZWdzLmgNCj4gaW5kZXggMjYzZmZjN2JjMmVmLi40
ZThmOWE2MWYwYmYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX2Vu
Z2luZV9yZWdzLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3MveGVfZW5naW5lX3Jl
Z3MuaA0KPiBAQCAtMTA0LDYgKzEwNCw3IEBADQo+ICAjZGVmaW5lIENTRkVfQ0hJQ0tFTjEoYmFz
ZSkJCQlYRV9SRUcoKGJhc2UpICsgMHhkNCwgWEVfUkVHX09QVElPTl9NQVNLRUQpDQo+ICAjZGVm
aW5lICAgR0hXU1BfQ1NCX1JFUE9SVF9ESVMJCQlSRUdfQklUKDE1KQ0KPiAgI2RlZmluZSAgIFBQ
SFdTUF9DU0JfQU5EX1RJTUVTVEFNUF9SRVBPUlRfRElTCVJFR19CSVQoMTQpDQo+ICsjZGVmaW5l
ICAgQ1NfUFJJT1JJVFlfTUVNX1JFQUQJCQlSRUdfQklUKDcpDQo+ICANCj4gICNkZWZpbmUgRkZf
U0xJQ0VfQ1NfQ0hJQ0tFTjEoYmFzZSkJCVhFX1JFRygoYmFzZSkgKyAweGUwLCBYRV9SRUdfT1BU
SU9OX01BU0tFRCkNCj4gICNkZWZpbmUgICBGRlNDX1BFUkNUWF9QUkVFTVBUX0NUUkwJCVJFR19C
SVQoMTQpDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmMg
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmMNCj4gaW5kZXggOWVlZjc4OWJlODk3
Li5mMDNlNWNjOTA2M2UgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19l
bmdpbmUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmMNCj4gQEAg
LTQyNCw2ICs0MjQsMTcgQEAgaHdfZW5naW5lX3NldHVwX2RlZmF1bHRfc3RhdGUoc3RydWN0IHhl
X2h3X2VuZ2luZSAqaHdlKQ0KPiAgCQkJCQkgICAweEEsDQo+ICAJCQkJCSAgIFhFX1JUUF9BQ1RJ
T05fRkxBRyhFTkdJTkVfQkFTRSkpKQ0KPiAgCQl9LA0KPiArCQkvKiBFbmFibGUgUHJpb3JpdHkg
TWVtIFJlYWQgKi8NCj4gKwkJeyBYRV9SVFBfTkFNRSgiUHJpb3JpdHlfTWVtX1JlYWQiKSwNCj4g
KwkJICBYRV9SVFBfUlVMRVMoR1JBUEhJQ1NfVkVSU0lPTl9SQU5HRSgyMDAxLCBYRV9SVFBfRU5E
X1ZFUlNJT05fVU5ERUZJTkVEKSksDQo+ICsJCSAgWEVfUlRQX0FDVElPTlMoU0VUKENTRkVfQ0hJ
Q0tFTjEoMCksIENTX1BSSU9SSVRZX01FTV9SRUFELA0KPiArCQkJCSAgICAgWEVfUlRQX0FDVElP
Tl9GTEFHKEVOR0lORV9CQVNFKSkpDQo+ICsJCX0sDQo+ICsJCXsgWEVfUlRQX05BTUUoIlByaW9y
aXR5X01lbV9SZWFkX0Zvcl9NZWRpYSIpLA0KPiArCQkgIFhFX1JUUF9SVUxFUyhNRURJQV9WRVJT
SU9OX1JBTkdFKDEzMDEsIFhFX1JUUF9FTkRfVkVSU0lPTl9VTkRFRklORUQpKSwNCj4gKwkJICBY
RV9SVFBfQUNUSU9OUyhTRVQoQ1NGRV9DSElDS0VOMSgwKSwgQ1NfUFJJT1JJVFlfTUVNX1JFQUQs
DQo+ICsJCQkJICAgICBYRV9SVFBfQUNUSU9OX0ZMQUcoRU5HSU5FX0JBU0UpKSkNCj4gKwkJfSwN
Cj4gIAkJe30NCj4gIAl9Ow0KPiAgDQoNCg==
