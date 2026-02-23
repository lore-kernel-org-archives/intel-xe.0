Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428E2EEC285
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 21:33:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F37AF10E298;
	Mon, 23 Feb 2026 21:33:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hu69TVdM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA12710E298
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 21:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771882422; x=1803418422;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kE0zQ6RtwA3e+l/5tEl5EcebWD0op+ANkMDm6JHQjb0=;
 b=Hu69TVdMMyPNdjr20ZAw4D7auNfzg0Khapeo7FMXdDvQiCSCvA+bpB0+
 W5UGdlgRuXg4d+63+YjdxQhBHH228P5gllN8fY5TTj0I7SqbUA/2aOp+a
 iLlNaTBm7uBHRodstHSpJZSRTICt7u84FS2CWVUto8u5KB9XgDAx3wban
 8CgLbO6KBkZkRPootQpd8H3bGIe4MHCAhTYBVgr0JBOn03OAElIYqO+dK
 OA9/yyAGKjle1HHA3tZWOJ5l1A6zyjtd4wymHGarRhWwsuykGFrZbx0SV
 vSqMV1lmRn+T6L+3KF2asYf9qEDdQPT4l05TfRQ5VPbK9P8ZQ6epNvcam Q==;
X-CSE-ConnectionGUID: IpUWwxbZQTWThiR6F3181g==
X-CSE-MsgGUID: o6AEkPFJT7ymn06dxeyAqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="84342239"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="84342239"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 13:33:41 -0800
X-CSE-ConnectionGUID: 4GXsgEXwQE+clgrV48fMoQ==
X-CSE-MsgGUID: NLYdIkujQ72AIlFQhrgPKQ==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 13:33:40 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 13:33:40 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 13:33:40 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.13) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 13:33:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W04jTJsjk1sA0gKm77gZ6N8O+yuv1J35c2z09ibtr1njX1e/i8lC4otdZBi6uAvYg5/qadMXXc3We68KL3LqxAU0YK+u9mUzeD2oHiO0moR/eOhNgNsix07H4rSe8EWdlN0Kwj2XO5a/wlp8UDVdAUggwJlcomPMloKBMFIJJ+pv9wU8+XRYGpx+6B3TPBzSejiFRAMp9LxRslmoekTcZVjAFFFnuEP+sdg65G0jVKERzgRGRrAnyap6DbKiXUbv+AJq3dqh6X1edJoJ8kScz77AAWonr70scbD+2gr+huuhxy04R+MAiTBBokaY8dHBRsDJd8jCGdBH9vYrXcETmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kE0zQ6RtwA3e+l/5tEl5EcebWD0op+ANkMDm6JHQjb0=;
 b=r4UcbSkXVksCpix6Yd9C4SfGqABQyGlrN4M0zwEppst2uj3iuqVQmRhav8az9XawegUfRAidsHOz/sd/j6eZxDa3ExJf1ZePcSQHl4N2CwERyI3ntHR7UYJp+GrgjlE76qyHRMq8WrzBBT0MhDNheBRr+PvZsMs4Av/XxBAd+ffwBIBzyKkMU+w0ydrYomemApyMYsyMrHlxVftsXeg3sXb3QLupEfTo9j5413okqI4s2hXhJS0MJWUM8LKb3NSOYIGwqke9VFa9fXPhULL1TQ5NRs+AyXHftBtJYbG5/ij29FifDGMgm11C448LAkKFxI/p/3slUs3OHU1t8QjW7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by IA4PR11MB9277.namprd11.prod.outlook.com (2603:10b6:208:55d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 23 Feb
 2026 21:33:37 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 21:33:37 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH v2 16/23] drm/xe: Consolidate workaround entries for
 Wa_14019877138
Thread-Topic: [PATCH v2 16/23] drm/xe: Consolidate workaround entries for
 Wa_14019877138
Thread-Index: AQHcoo5vLfSgJll8VUqqtxFLMOBDLrWQrl0Q
Date: Mon, 23 Feb 2026 21:33:37 +0000
Message-ID: <DM4PR11MB5456A6363D05A35429F44AEAEA77A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
 <20260220-forupstream-wa_cleanup-v2-16-b12005a05af6@intel.com>
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-16-b12005a05af6@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|IA4PR11MB9277:EE_
x-ms-office365-filtering-correlation-id: 4ec18486-b95a-4b3d-3c6c-08de732334a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?bGxQalVDYkJpWjVmMjFOL2tDNmhLb0ZPdzQ4ejJYYVVHRnR1WEVPbDlaZ0Qy?=
 =?utf-8?B?d3RVZzdQTjlPZmlLakZPZE15VjlpV2NBZENQd0VjSzhnT0JmYlFncGZRWDh6?=
 =?utf-8?B?NCtYUUpJQnlMWXNJNUR1RHNuMUUzcmZsZ1NjRGUxdWlPaXlyMlluclZWNHJD?=
 =?utf-8?B?QWhUSTZsVnZsZDJlbzhKaFRFRGdYb2pELy9TSTRHTjVNd21rVThsN2FhZjhN?=
 =?utf-8?B?endWR1dnTDBJYWs2MzM5Nis0NWhUTG9lMCtNUEQrd3hBMU9UM0pLc2o0WWlO?=
 =?utf-8?B?MUVjZk9tczZhL0pkZUFJUk56VS9uVitsQ1RzT2ZUakRUcjUybnhuZjIvS0N0?=
 =?utf-8?B?NFd3Vml1SHZJSnNMZzZxcGlwUzQ3QzNRVS8vUW5VbmFNaXZsTkpYT3NFRUhh?=
 =?utf-8?B?NVVQclhZN05ERExhZDVDQ1BiMzVzR1lYRUo0cEtxV1QyTy9NSk1BeXZ6c0RU?=
 =?utf-8?B?RnVsTkhlVi9Fb1V3b25zTFV1RlpjZnFWL0pZT1BvajJSNUs2Z0JXTEdZQ1Fm?=
 =?utf-8?B?Q0NKTUNQWjJUTU9WQkhPQWhOU0xTOU5TRlNpWHQxbTdVOFNDMTR1WWVoMHNj?=
 =?utf-8?B?U2tocW1tdGNmbTFBNW5VeHk3Q3lQSGdqcVlCM3NhL3ArNHVSRTZPVFJrV2cr?=
 =?utf-8?B?WEY0bytmUDYyYXFWZzBIU1VTNXU4WDlSTWZYQW1FS2ZuM3lsY0F5cnFJbnFJ?=
 =?utf-8?B?eVB4cXpjV3hWNG95K1ZwZWR1cUpqT3lWdG12cG15RUh2T0grbS9xVm1wMTdq?=
 =?utf-8?B?Zm0ySXZaZXY2VVhsRzVPdkxiSVlUMnEyNnl0alVQQ21IenBsbkZFMmwzYXNT?=
 =?utf-8?B?L0VvaVBXQkxKTzh3dmNkZGd2cCtGcHJjd0ExaVFDTThwblpubmZRbFpyWDdM?=
 =?utf-8?B?MGNQR1I2aHlId3pzblVFRmZZWmUxRmpEa3BIbXdBdzRGR0R1aTROUHB1R084?=
 =?utf-8?B?eUxMREI1MkE3V0ZvWmhETW4wYk1EaVpWUTRMZGM1d2VUd0hKaTFFSkZHZW1u?=
 =?utf-8?B?Qm91YWRtU0NwMzFYWUpicXF0cVVraG55ZjIwUGdGam5FQU5sdGM2ZWhNZGRy?=
 =?utf-8?B?T29nQ0s5UHRZRW04YUFkTFBvK1MwLzAxQS9PZWFqeCtaOEwxR0g4cEpkSWpo?=
 =?utf-8?B?QVorbEx1UzBEbkxZdHc4MTJVYWFmaTFhVnp4RTdpT3FDZ0xuTXQ0aGxYVFdh?=
 =?utf-8?B?MzFGVWVZNnVJUm0xQkRQUVVWTDFvQTRBRG1OVk5ZaVJoMkw2TmJ2dFZoR24z?=
 =?utf-8?B?NyttLzNwczY5UGgxemRvNVlQbVlqdmk2ZmtZbEQxSnZ1M0l4MUVISlFiekta?=
 =?utf-8?B?NERwMVl2MytJbDRsSlRxQS9zQ3FkcmpZTVVRZXE0L1I4eFRuNWxleEVCVytj?=
 =?utf-8?B?QWRzQXZqSWVIWXR0d3NPY0t0T2JyRnZaL1o2M2xsVzAvTytUUTFXMDVranNz?=
 =?utf-8?B?SW84Tkg3dFhkaERxd2VMTWVLelhBdnUvUElnUTZ6cFlHeSs0dEprWitYeXps?=
 =?utf-8?B?TjZuMXd3R24xUHZmK1lhUWo0OUtsbkJGVm10OTQ5SEgveHNZbklIOW5aUzhT?=
 =?utf-8?B?ZW03Slc0YVJWbUVoQllmMGNWWFRUTGEzRVYwM1lOaXJucTlPdmw4RmxWTGxQ?=
 =?utf-8?B?RFhmaS91KzZnSjA2NG5PdkhzZS9rc3IyeUJ1QlNsOEJaQnpkMzhTbVhlTVoz?=
 =?utf-8?B?ekZlclBacVVLQ2JnbWcwVEkyLzdEOEsyczNZT0JVUGkrLzB1Q21QNXFkK0R3?=
 =?utf-8?B?TkxQLzMzTFVPTEdiWlhLcFYwOFA2M3pFdU4rTkNLWGsyQ3Y1Q3JxMFBjci9u?=
 =?utf-8?B?S1QxWDZ3RkJocjZTNzRuaGplM1NsdWNYMnB5SEMzbnBXWUswb3lVREprNVhh?=
 =?utf-8?B?dzREYjJCRTJidzZxeTJsV0Vza0pKVmVBT3crVFZnNXJZZXpOWGtMM0p3MWFP?=
 =?utf-8?B?M3Q3TzFmVVdtU3EyaCtRa2hPL1hIN2dCandiWE5SRmhFRmFKMEZxVHlGZ2w1?=
 =?utf-8?B?YTBRcUJ2RXdnN3pYNGljWEsrQUFsN3J5c0RicEwvSWJZUTRraU5QSlM0UXdN?=
 =?utf-8?B?V0hyWkNVSlA4bVVIRnpYL2V5VG9LSU1laEtic1RqcG45dTc5NVZKVWIrZC9T?=
 =?utf-8?B?R0tZQ3lCWG1WdUhnT2lxZlQ3TUs0WDZpVENxNWF0UGZ5SVRJbWYvOXNBd2RR?=
 =?utf-8?Q?Ex8dva9baxI5n4IJ1ztzH80=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1pRR0ZjaDdWR25NNnpESjRIemVudjRiV2hOZ21iK05sRkE0d01wcHEzWHRP?=
 =?utf-8?B?UU1jc2FxajlRYTh1K2JIRXdYTnVRWnEySDFHcjFsRUlZaE5IdUNaQThhSUwr?=
 =?utf-8?B?clVHVDdQMERMWkRxRC9Uc0hyd0lrdzNVcE10UzNqaXZINk9ua2k2eFpURUYv?=
 =?utf-8?B?cTM1RWV3VmtnSDRlTlg1ZndtZFJBd0VZZnAwZnY4eUdrck1YOGlzVi9WTmVP?=
 =?utf-8?B?UmF3aFUranBCSzMyTWdkWWFFcE9GZ1JUUHVTUnRrajNDTjlTV2piSEVWL1ZO?=
 =?utf-8?B?Tnp5TWloY09lWEhta3lBLzI5YTN0a2RvZktrSW1ZUVFIOTNKeVBSMnhmYWFa?=
 =?utf-8?B?MGczU0tTVE1vbjBpWC9JSDVqa0liVEt3Q1BvSWtmRURKOGtZVUxBNkRPZEZi?=
 =?utf-8?B?Rm5xZUIrdHZwZVd5cERLR2o0a1RSVGpqS2IxUGsyVS9rb0twL2ZQYlBRUkJO?=
 =?utf-8?B?NDBNTHZYdExUelFDMThGUTRwdkdLby8zOXJPaWMzbnA2SWYrQlk3N24yNW9N?=
 =?utf-8?B?NFFmTUQvOEJnK25IeDhrYXVmd3VKNWhRamFlNHppZC9yT1pxeThFckV5ZTFo?=
 =?utf-8?B?cUdvK05LdUQ2RnVqUDlINjZLY2c0bWpyT2FnUHBnaWFLMUtBeGRneVJVWWFr?=
 =?utf-8?B?M3ZFbzRORUpaSTBwQ1JqR3grUWpPTjgyMUZPOUo5bkxSTkIvN3krMi84VkR0?=
 =?utf-8?B?eDZadFpiWkEwZnRud1p3enlSUllTWTdvaTNZaUQ1eGwrd1FNaWowM3E2bS85?=
 =?utf-8?B?MTFUb3lTZXdZYTRNcjJUMGlvbU4vdXFLbXROOEErbVNRRVlnU3hQNWNpQlFK?=
 =?utf-8?B?SlE2MEhpeGh6ZlZlV05wV2lQYmdTMk5hOXhGTE8xc2ZHZW8rVGhuMzhFNU44?=
 =?utf-8?B?aEY3Z3pwN3BlUVd6ZTk1QmkyeEhNZ0xxZk5qYUZNVjg1SDZiZlNPZjZMOUVN?=
 =?utf-8?B?VUYwNytibVN6dTl4OFdubEZMeVllNyt1Nit1M01yVEpZWVNRKzd3Y284a3pE?=
 =?utf-8?B?TFFTUHFaQXpnbGRBWWkzMnhTR0IrRnhOZWQ3SWtPM1ovZWU1WWFXeHZQWjQ0?=
 =?utf-8?B?REVuVFozc3dTNzVFOExaY1Avbkl4TTcyTldpV1REN29RZU1HdisrSXNweFF6?=
 =?utf-8?B?YkVnUFdzZGgrckVNYVY2UVNhNFdIWUFXQ0ZPcDAyR0ltc2Rmb2RQZjJpTm85?=
 =?utf-8?B?b0VjMjgxZjZvM2ZScUtIYmZYUkU0ZHJXcnNYY1FTeElOTnBKMWpXeVJLWTZU?=
 =?utf-8?B?VDNxYzRLNVZESm50MWZkeXFtQUQvTlFCR3hEMEk3TENXUy9McmNMM2R4VjA2?=
 =?utf-8?B?eUd1ZDRQY3hKY1kwSG1nUGxZaWp6bm1jRGQ0U1pyMTByZUFvaVVCNTdHdHlu?=
 =?utf-8?B?R1pRcDdHNDZyV3dBSUFJMHFWT09HT3phbXZ0SWlaeWlQcUNyREZsOFhXU1Er?=
 =?utf-8?B?V01CZFRqS0s4TjdVejdSbmVYU1AvdUN0S0J6SHNHWHBXY1VkWW8rVi90bU9S?=
 =?utf-8?B?OGhxS3lobldlTEs5VWZiem5wVng3akp5SzBEOWxncTF1YjNGa3lkMXhpZE4v?=
 =?utf-8?B?bzBDU1FXR2t2Mzl3a0xjMnBJbmhvaE5KalVGaHV1bk5PRjJjU3h1c2FYRmQ1?=
 =?utf-8?B?UmdlVXl3R1NWUUdZL3Y0S1pzSFhQckRKU1lRcWpTUkoxZGh1SEtLQmNrdnNi?=
 =?utf-8?B?OGt4WjRnL3Y5SHlvZGtNUjdLWi9OVUFZeFl0ODJPSW9rN0ZybzExR0xZa3lj?=
 =?utf-8?B?OG5LVXpCbjVxb3BCOU9zYlRodzUvK2RqT1o5QkZvYzB2aWxmbUwvUGdMWHBI?=
 =?utf-8?B?T0x5a1o2Wko3WHpLTWgrdnFKdDd6NlV0T3d5Ym1CbjNjcDhsY1FNOHFvb2lL?=
 =?utf-8?B?akh4Rmo3UTByMFpVWmN1VE1nQkRUZzBIZ3BPWGhNYUVOY2NPSXoraTR4S1Vx?=
 =?utf-8?B?UlUxN3RabzljK3d0eTAzcXpveHVFb3JKYlVRTzl0ZDBIeExiR0toWFhxYjFh?=
 =?utf-8?B?dDlyRkFCRi9SSHNWb0tKWktrYzFzdjZ3WHJvSjRXUFlvaXNlWEdzWVMzVGpn?=
 =?utf-8?B?MzA2c0oxeUJ6dUJzL2srWTU2KzBORVl2aEhLeXJhTjlOb3BXbUYzTEJKMXRk?=
 =?utf-8?B?NWpIL3lmSUZ6TC8weXNuUmFQT2RNamxaZlRHbWptdEM4NGZVZTRJNVlNUUdB?=
 =?utf-8?B?WVAwWDVFWlhZN3dFWGo3L1RsTFRQMWtlTUlJay82ZlNubVhucVBjSnNNeXp5?=
 =?utf-8?B?b1Jlb1lYdFVaSkhkVzNMZWNJNEtrSzk4dG1qd1ZHcEtzZ0Jleml6U1lZRFVN?=
 =?utf-8?B?MVltallpY2lJdC9RVDlZTWxlTXdoZG0wV2twZEFidWJxMXhDMWltUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ec18486-b95a-4b3d-3c6c-08de732334a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2026 21:33:37.7259 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 84zQSeFgBQ83trU1o4rLnE+mRMKj0AecTp7u/ivrdIw/4Za9nRMvW81GZhtma85FLApjeOPVxklkSd4hGfpRnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9277
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

T24gRnJpLCBGZWIgMjAsIDIwMjYgOToyOCBBTSBNYXR0IFJvcGVyIHdyb3RlOg0KPiBXYV8xNDAx
OTg3NzEzOCBhcHBsaWVzIHRvIGFsbCBncmFwaGljcyB2ZXJzaW9ucyBmcm9tIDEyLjU1IHRocm91
Z2ggMjAuMDQNCj4gKGluY2x1c2l2ZSkgdGhhdCBoYXZlIGEgcmVuZGVyIGVuZ2luZS4gIENvbnNv
bGlkYXRlIHRoZSBSVFAgZW50cmllcyBpbnRvIGEgc2luZ2xlDQo+IHJhbmdlLWJhc2VkIGVudHJ5
Lg0KDQoxMi42MCBpcyBpbmNsdWRlZCBpbiB0aGlzIHJhbmdlLCB3aGljaCBpcyBmb3IgUFZDIHRo
YXQgZG9lc24ndCBoYXZlIHJlbmRlciBlbmdpbmUuDQpMR1RNLg0KUmV2aWV3ZWQtYnk6IFNodWlj
aGVuZyBMaW4gPHNodWljaGVuZy5saW5AaW50ZWwuY29tPg0KDQo+IA0KPiBOb3RlIHRoYXQgdGhl
IERHMiBlbnRyeSBmb3IgdGhpcyB3b3JrYXJvdW5kIHdhcyBtaXNzaW5nIGFuDQo+IEVOR0lORV9D
TEFTUyhSRU5ERVIpIHJ1bGU7IHRoYXQgbWlzdGFrZSBpcyBmaXhlZCBieSB0aGlzIGNvbnNvbGlk
YXRpb24uDQoNClNob3VsZCB3ZSBmaXggaXQgaW4gdGhlIHN0YWJsZSBrZXJuZWwgYWxzbz8gDQpU
aGlzIGlzIGEgcGl4ZWwgc2hhZGVyIHJlbGF0ZWQgcmVnaXN0ZXI7IHRoZSBzZXR0aW5nIHNob3Vs
ZCBub3QgYWZmZWN0IG90aGVyIGVuZ2luZXMuIA0KU28gaXQgc2VlbXMgdGhpcyBtaXN0YWtlIHNo
b3VsZCBub3QgaGF2ZSBzaWRlIGVmZmVjdHMuIA0KSXMgbXkgdW5kZXJzdGFuZGluZyBjb3JyZWN0
PyANClRoYW5rcy4NCg0KU2h1aWNoZW5nDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hdHQgUm9w
ZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3dhLmMgfCAyMCArKysrLS0tLS0tLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3dhLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfd2EuYyBpbmRl
eA0KPiA4MzMxOGE0ZWJjYjUxZTAwNDQ5N2UyY2I5NDYwZTk1NjkxYjVkOWZmLi4yMWFmOTk3NDQ3
ZTc4OTUxZGQ2ZA0KPiA0MGM4NzQ1NGU4ZWY2OTM0MzAwNiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3dhLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhLmMN
Cj4gQEAgLTYzNyw2ICs2MzcsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB4ZV9ydHBfZW50cnlf
c3IgbHJjX3dhc1tdID0gew0KPiAgCSAgWEVfUlRQX1JVTEVTKEdSQVBISUNTX1ZFUlNJT04oMTIw
MCkpLA0KPiAgCSAgWEVfUlRQX0FDVElPTlMoU0VUKENPTU1PTl9TTElDRV9DSElDS0VONCwNCj4g
RElTQUJMRV9URENfTE9BRF9CQUxBTkNJTkdfQ0FMQykpDQo+ICAJfSwNCj4gKwl7IFhFX1JUUF9O
QU1FKCIxNDAxOTg3NzEzOCIpLA0KPiArCSAgWEVfUlRQX1JVTEVTKEdSQVBISUNTX1ZFUlNJT05f
UkFOR0UoMTI1NSwgMjAwNCksDQo+IEVOR0lORV9DTEFTUyhSRU5ERVIpKSwNCj4gKwkgIFhFX1JU
UF9BQ1RJT05TKFNFVChYRUhQX1BTU19DSElDS0VOLCBGRF9FTkRfQ09MTEVDVCkpDQo+ICsJfSwN
Cj4gDQo+ICAJLyogREcxICovDQo+IA0KPiBAQCAtNjczLDEwICs2NzcsNiBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IHhlX3J0cF9lbnRyeV9zciBscmNfd2FzW10gPSB7DQo+ICAJICBYRV9SVFBfUlVM
RVMoUExBVEZPUk0oREcyKSksDQo+ICAJICBYRV9SVFBfQUNUSU9OUyhTRVQoQ0FDSEVfTU9ERV8x
LA0KPiBNU0FBX09QVElNSVpBVElPTl9SRURVQ19ESVNBQkxFKSkNCj4gIAl9LA0KPiAtCXsgWEVf
UlRQX05BTUUoIjE0MDE5ODc3MTM4IiksDQo+IC0JICBYRV9SVFBfUlVMRVMoUExBVEZPUk0oREcy
KSksDQo+IC0JICBYRV9SVFBfQUNUSU9OUyhTRVQoWEVIUF9QU1NfQ0hJQ0tFTiwgRkRfRU5EX0NP
TExFQ1QpKQ0KPiAtCX0sDQo+IA0KPiAgCS8qIFBWQyAqLw0KPiANCj4gQEAgLTY5NCwxMCArNjk0
LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB4ZV9ydHBfZW50cnlfc3IgbHJjX3dhc1tdID0gew0K
PiAgCSAgWEVfUlRQX1JVTEVTKEdSQVBISUNTX1ZFUlNJT05fUkFOR0UoMTI3MCwgMTI3NCkpLA0K
PiAgCSAgWEVfUlRQX0FDVElPTlMoU0VUKENBQ0hFX01PREVfMSwNCj4gTVNBQV9PUFRJTUlaQVRJ
T05fUkVEVUNfRElTQUJMRSkpDQo+ICAJfSwNCj4gLQl7IFhFX1JUUF9OQU1FKCIxNDAxOTg3NzEz
OCIpLA0KPiAtCSAgWEVfUlRQX1JVTEVTKEdSQVBISUNTX1ZFUlNJT05fUkFOR0UoMTI3MCwgMTI3
NCksDQo+IEVOR0lORV9DTEFTUyhSRU5ERVIpKSwNCj4gLQkgIFhFX1JUUF9BQ1RJT05TKFNFVChY
RUhQX1BTU19DSElDS0VOLCBGRF9FTkRfQ09MTEVDVCkpDQo+IC0JfSwNCj4gDQo+ICAJLyogWGUy
X0xQRyAqLw0KPiANCj4gQEAgLTcwNSwxMCArNzAxLDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB4
ZV9ydHBfZW50cnlfc3IgbHJjX3dhc1tdID0gew0KPiAgCSAgWEVfUlRQX1JVTEVTKEdSQVBISUNT
X1ZFUlNJT04oMjAwNCksDQo+IEVOR0lORV9DTEFTUyhSRU5ERVIpKSwNCj4gIAkgIFhFX1JUUF9B
Q1RJT05TKFNFVChWRl9TQ1JBVENIUEFELA0KPiBYRTJfVkZHX1RFRF9DUkVESVRfSU5URVJGQUNF
X0RJU0FCTEUpKQ0KPiAgCX0sDQo+IC0JeyBYRV9SVFBfTkFNRSgiMTQwMTk4NzcxMzgiKSwNCj4g
LQkgIFhFX1JUUF9SVUxFUyhHUkFQSElDU19WRVJTSU9OKDIwMDQpLA0KPiBFTkdJTkVfQ0xBU1Mo
UkVOREVSKSksDQo+IC0JICBYRV9SVFBfQUNUSU9OUyhTRVQoWEVIUF9QU1NfQ0hJQ0tFTiwgRkRf
RU5EX0NPTExFQ1QpKQ0KPiAtCX0sDQo+ICAJeyBYRV9SVFBfTkFNRSgiMTQwMTk5ODg5MDYiKSwN
Cj4gIAkgIFhFX1JUUF9SVUxFUyhHUkFQSElDU19WRVJTSU9OKDIwMDQpLA0KPiBFTkdJTkVfQ0xB
U1MoUkVOREVSKSksDQo+ICAJICBYRV9SVFBfQUNUSU9OUyhTRVQoWEVIUF9QU1NfQ0hJQ0tFTiwg
RkxTSF9JR05PUkVTX1BTRCkpDQo+IEBAIC03NTgsMTAgKzc1MCw2IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgeGVfcnRwX2VudHJ5X3NyIGxyY193YXNbXSA9IHsNCj4gIAkgIFhFX1JUUF9SVUxFUyhH
UkFQSElDU19WRVJTSU9OX1JBTkdFKDIwMDEsIDIwMDIpLA0KPiBFTkdJTkVfQ0xBU1MoUkVOREVS
KSksDQo+ICAJICBYRV9SVFBfQUNUSU9OUyhTRVQoWEVIUF9QU1NfQ0hJQ0tFTiwgRkxTSF9JR05P
UkVTX1BTRCkpDQo+ICAJfSwNCj4gLQl7IFhFX1JUUF9OQU1FKCIxNDAxOTg3NzEzOCIpLA0KPiAt
CSAgWEVfUlRQX1JVTEVTKEdSQVBISUNTX1ZFUlNJT05fUkFOR0UoMjAwMSwgMjAwMiksDQo+IEVO
R0lORV9DTEFTUyhSRU5ERVIpKSwNCj4gLQkgIFhFX1JUUF9BQ1RJT05TKFNFVChYRUhQX1BTU19D
SElDS0VOLCBGRF9FTkRfQ09MTEVDVCkpDQo+IC0JfSwNCj4gIAl7IFhFX1JUUF9OQU1FKCIxNDAy
MTQ5MDA1MiIpLA0KPiAgCSAgWEVfUlRQX1JVTEVTKEdSQVBISUNTX1ZFUlNJT04oMjAwMSksDQo+
IEVOR0lORV9DTEFTUyhSRU5ERVIpKSwNCj4gIAkgIFhFX1JUUF9BQ1RJT05TKFNFVChGRl9NT0RF
LA0KPiANCj4gLS0NCj4gMi41My4wDQoNCg==
