Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1318CAC5B8
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 21:37:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7075D10E856;
	Thu,  2 Oct 2025 21:37:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i8jy2fPM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A6BC10E856
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 21:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759441032; x=1790977032;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=AfhAXyuqa9XPxCaoFH+t503UAXOwmFv6fpjIR/yyN2U=;
 b=i8jy2fPMSZoqKPbENj5zcZfNSCqJJpddIxTjnZGkcs16p/l2AnFAWmZO
 kh/wC6pmHExPkdgSZ2TC/Cbjj3YmwtEAymTEMZeM+xEiHG9kdXjsMI6LZ
 quHmjNL0vg4rUytlOg/PPAY/smYb7wz+JUTAvTMK56GmfFcegU1IJb0cK
 J5JFe5Lh6Pmp6ppWVEvRrmgscl99uHSk/3cXeFz0q7zjKO5MZx2JSI7qm
 cijek+LFktMYg82lNHGh1iobUAsgGvB173njytMQWvQLk9wSJ+Nw3UQat
 H6ckUAgq9GIyayb4XGMqthQLOc3tp3DkzgoV+1Ipo4aY3MmxBqUjc7zke g==;
X-CSE-ConnectionGUID: jwfWDiw6TBO4JzP6ywT7mA==
X-CSE-MsgGUID: dlunL2TTTp+kOJlP8yLvEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="61641798"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="61641798"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 14:37:11 -0700
X-CSE-ConnectionGUID: qrx9bXrnSMiZWAFT2E0fsw==
X-CSE-MsgGUID: i3XeW2qKSaGA5xdAD9wB/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="183435964"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 14:37:12 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 14:37:10 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 2 Oct 2025 14:37:10 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.9) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 14:37:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H/oIHOFPwoSHoxQGSZPshYSFWDKGbffYjHk9D07gTZFJlbS42D1evKWyKgs7REKBna8JuOwaOkkOWe9ayE8/uybnEReLWZxwHvSj7AciC4pmfHhKfs831GX4JwsZl4k/HTRc/WaKbN6vrAN//hU/XRdQwhZWP0f2qxk5kNIlql4KVYHzqzmthHBboVw7tAiFPd5qpkhHF0HIBYOp4+HYnModoEZEvAJHyX6oORVvHOFzyglqmNcEsP2UlhlsNDgrpfZoSNCewtwkLSZzF/0fuIL8Fzdq4p3OgB7oZPJXQsG9gToAuJmpB834ZA2XCi0TcCCWuHsW7sF+/Bpccifi+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SoaEf7HS/jFdNBBMoXEk/DgySHed0VAVU7Mhjff5fyg=;
 b=yl5EAMgiOQv2a9/FT7OcErPNQPMLr5N1V9YJcJo+Cf98Y4WUYa1+5g12qL9q6GUN4VVeympZu+OXP4ZW6u4FeOukaX0+T3AD2SHoIff7TleX7vG3gruaa+2trmC7ZpHcb0ltz8OynxbTrYnfYUYmUR7DnAvyyZFGD8rmxM3o5MzS3AJRWytKYouN3CEASkO0LPLcZijrdBmY9MZ148W638B1HxasyeNJj59GWv57tviHwKgcSoS9k6X9mnLCgYq3IeZcCnlVjrcZklJbkiWZC4VIKs0z0/ZVznrh1ylm+UN7tfKr2AXcyV7uUwOvs1cqxm0O3HBmqaipHlOz+ivCeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ0PR11MB5134.namprd11.prod.outlook.com (2603:10b6:a03:2de::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Thu, 2 Oct
 2025 21:37:08 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9160.015; Thu, 2 Oct 2025
 21:37:08 +0000
Date: Thu, 2 Oct 2025 23:37:03 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/6] drm/xe/pf: Expose VF control operations over debugfs
Message-ID: <ryboom2e3p5zjgpys2zeakazoardfexq2n3kwbv4g3a67ffx6s@k2evegu7levb>
References: <20250930233525.201263-1-michal.wajdeczko@intel.com>
 <20250930233525.201263-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250930233525.201263-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI1PR04CA0095.eurprd04.prod.outlook.com
 (2603:10a6:803:64::30) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ0PR11MB5134:EE_
X-MS-Office365-Filtering-Correlation-Id: ea301164-03fe-4947-12c2-08de01fbd650
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WG1PSTlJcDZyc0FKZ01SRDg5Rlo3bXNWUEhiS3U5MTBXNGlFU1I5c2xNL3hm?=
 =?utf-8?B?OGtScHVsL1B0eFdFbnhKRmVBUU9ZSjl4RE5DYk1GN2Zya0xPdlhoOWJSS1V6?=
 =?utf-8?B?VXNEa3I3ZjZUTktDVEZqZjBYZWkzR0trT2R2ZmpyMTBLMFd0ck96ZzhsT2hR?=
 =?utf-8?B?QkhsMStTMVpTTkNDNHE0NVF1SnZEMTBjSytDanhocnZRTmN1a1llQUVCUVN2?=
 =?utf-8?B?OURsWURkVDVNOGNYd0pJMzJTSHVGY2gxWUlKV1p2SmNsOVpTYm9uRURxNUVD?=
 =?utf-8?B?TUJEVUpkbmdrbGc4L1BIRWw2OTJyVWVDc1h0RWJKL0dPRlZHZjhaN0ZZMFlj?=
 =?utf-8?B?U2VOUzRFRTgwNFdzLzNXelBac3RzVHVsZkRNbGhhejdFdXdpZU8reGxFOS90?=
 =?utf-8?B?SEVldDJQc01uVmM1NVJNV2VOOEZsRk4zeXdWNXVhejVlSmg3VU01ek8yUjgw?=
 =?utf-8?B?MVNNeDdBaEZUeml4ME1lZFRlVkZGV3hwMUZGSVpVNGgzNGIwQ0xTMVFZSzZi?=
 =?utf-8?B?RFhGVHZ0NDFXSTh1OUhUUzhlZ2dYckg3aGtldGpCYXl2R21XSjlZSVJ4M3NM?=
 =?utf-8?B?QnpZZnZtYnc4K3VPR2dTTFFFN2liWDFCSHh1UFFUbjJWTGNUN3Fsc0Q4L285?=
 =?utf-8?B?dUpiWkllV2dteEJ6K25JSTN5eEJkMDB1K3J1dnR5dEJ0dFNnSk5yajMxMEs5?=
 =?utf-8?B?RnRPS21hZVg5Yk5PT2tQVTV1VVAzYnh6Ym4zalpSVHRNY2ZQcDZ6NllBbVlz?=
 =?utf-8?B?SUlmcUtmVzRNRVdQNXRWdlJsSkM3STRzVnk3U1NNemJDbkFjR1Fnd1lKSmJP?=
 =?utf-8?B?V3haNkVkYXdHdXpzUncrY2I0MmNPaVQyMDdtZnlKWFJjenVlNVZPM0V0Tkx5?=
 =?utf-8?B?aDZPaVhiazNLRHpWYlRzQWRON1g5TkRIejl6VjRrTmlFUVNXcGl6TVkwSHQ2?=
 =?utf-8?B?M0ZYWjdhVXh3TkZZbGw1aTk4SUZQUXZ0YllJR3NGMVNzOEhoZVo3Wk14K1NI?=
 =?utf-8?B?bmFXeGRyUnFNanBiV005TVhlK0pxQ3pOd3o0RnpaYjVnNUN4V3JkS0FDTFZ3?=
 =?utf-8?B?TnlvVUlsU3NOUGVTWE1LcWVuUDhvdDdBOEhDZDlEVHVLaWw0cW5YaTNlRzRp?=
 =?utf-8?B?NUJpODdpVUdCUWVLeUsxalAyM0srbDZlYWZ5V2hyVkY3MnJQdkxpeElhcjBY?=
 =?utf-8?B?dlY0aWdrN0RzaWl0YkIvVEtXZFRHVGhOMVBraXlXNTlGOFFXQnp1R0FVY2pi?=
 =?utf-8?B?TTc4MUN5d0Q0c0ZZaXB0Rm11WE0wcmZmd3U2SEEyMFJkNXlQb2tCNXFmaEFn?=
 =?utf-8?B?OGU4aUFMcmY4Ym9Kc1ZVOXhrdEtjZ3Bpd0pjbEVVVGhsOXN4TFQvTWRYK3lY?=
 =?utf-8?B?NW0zOTBLbHM5YytBOGpCVFFQVWJoekJYVVMyNDBSU3dURVFWNm9VYkJSZWxK?=
 =?utf-8?B?Uys0azVmbGcrcHZJdktoV3lEQ0FJMDNha2dwZlJMZlNsVUpvOWFQa3E3VHZw?=
 =?utf-8?B?ZmRUMXRDcGJjZkdNVDFmclRJQ082RFdER3YwS2pDR0x5RUkvbHl3QzVEN0I3?=
 =?utf-8?B?UUNURG82RCtMNUpyOWE3WUMwZWl2bjJFYmp0MVFLQU9jdGxrQ0cvTkZMM29m?=
 =?utf-8?B?aDFCaXB4ZGRhYzRhbGdiNXdZdHRLcVcrbDBsTEgvVG1CbG9KT2FTYzRQN1k2?=
 =?utf-8?B?dVZXUjY0T3BCWFZhYmh2MVVFUnJmeTd1ZnZQVTBvaHNrWjJWeThxSDFPNW5k?=
 =?utf-8?B?UG9nV3dub29zRzZ3NG9NQkRFK2pjZFpxRXpub1Y4VFNRbzdMbEJiajZIQlNl?=
 =?utf-8?B?ODRmTXdZeWJQbHFlRjlTOXF5bHBUejFWYnFGcSszOHNKWHdNeUhqR04vdWFC?=
 =?utf-8?B?b0NsRUNDRnRTKy9EYUVwaXBPd1NrUitXZ3QzYS9HNEJ6OWRTNTl6bTdNeWdz?=
 =?utf-8?Q?7Sr5JOyc4jDUJoV5rcuhvY5rkRCiPIXg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3BiWUtPRGVhNWxOekF6cEMwdmNpTzRFRzU0ZC9LcDVWQzF1emMzN3FxR0FU?=
 =?utf-8?B?TFFoWmMrRnhJRUowM3dDYTZCaCt1alNCUTZJSXBtSC90OTlJMGdZTUU2T3ZT?=
 =?utf-8?B?S3BtNVFDZFhFSElYS0JzK2JjcGZiZlhLeGlUTzlKbXo0WUxKYlNmNzVGa2J1?=
 =?utf-8?B?blFKM3dBVGphWUV3YjYvL2JyWGJ5ZW1LSnU3aEdDVmhORG56K2d2dUpJa1hI?=
 =?utf-8?B?TFJ3eEg5cWdZQTZqdzZNM1puYkN3d1NSdmM1RVA0WlN0cGVheThKV0pUbzFE?=
 =?utf-8?B?T3ZtTFEyNUJnOHl6dlg5M1c2bVBza3dlRlIyS1JkbjIvSHdvOUJXTnBtbjdZ?=
 =?utf-8?B?MDBOY2NIdk5VaHhkb3o4SjBjbitrUEpMazFaTUhwclFqYmxEQU1xVFBRZERU?=
 =?utf-8?B?bXdpbHZNekY3cnkrbEsxMm1ISVNwR3pvY1J3cGlvZ2ZjUnRrTEZ4VWwxOHd6?=
 =?utf-8?B?ZGRENEVnNXJkajZ2MUJraG9IYWFQWWlxZXZWdDYyUm5YYWllMXFXMndEM3li?=
 =?utf-8?B?eWJ4Q3R5dWVWVWxSK3hvWG1LSmtjamFWTWR4aHVRSnJKWm1Qenh3aU85WFZG?=
 =?utf-8?B?R1pYM2RCS1RqUnFRYlNLdmt2aVA5VHh3NUNPazRGQUlmdGY2T04vemJiamxS?=
 =?utf-8?B?bFB4Yk4xMFRxMjhRWjBrSHhucjUwYmJDMjBQV0lIQWRnb1o5YUdEVk41V0Jn?=
 =?utf-8?B?S1NodURNcnRsQW1XeThqL0x6ZDVlVTlZdnMydmFtRllmRWxtRklweUtaVmtD?=
 =?utf-8?B?b1VwUko2QUNkSG1scXlWek9mZUd5d1JrM2xYOGVhSHZQVWVsSzFOWTdFN3Z0?=
 =?utf-8?B?Y0VtcndySjVqOXBHdFQ0U0FmTHNnd1ZBUW5PTDR2R3lYSkppU3FVRXNHMjA5?=
 =?utf-8?B?OHcvMVlCaWRxN2VVSm1HT3J1S09xN3dLNkpOcXBCdHNxNHROZWxkTnZoQTVO?=
 =?utf-8?B?c21hNVRqODNENzRCK3k4aUtmU2g1T29mWnhzcGIvWDFjVGRvU1l6RFdWVHNP?=
 =?utf-8?B?V1ZyMm9HRVNuTHVTL3R5KzdOV0pHTUljcFNYTHVqTk13SlREcm9wSFhhN1lu?=
 =?utf-8?B?bWFIQ1lKMnBZMGxBenFidk5KUUdGNjVXckJQRUM0OUdxWjVRTjRFZFJtaEhu?=
 =?utf-8?B?OHJ3UXpDTm04cG9yQjVpSG5IV1RwQkMxTUloZHMxMFlVNkl5ZEc2eDMrajRB?=
 =?utf-8?B?ZndtZFpmWmN0WXA2TGl5OHN0SXBjUmZvVE01bmlTbUgrMVBHd1p4NzYycWRl?=
 =?utf-8?B?ZW5nUnl2Mm1SaUdNZmViOVRTVVQ1bzRxTUtWL1J3OWV6a3hJcS9IUEw1c01r?=
 =?utf-8?B?ZXNPUWhvN3lIdm05R055ekFtMUM5OGJmWFFDVEMyYVZXWk81R01rdFpGM3Jj?=
 =?utf-8?B?eFB6d25Pclgwb0Z0bHgzQWxiYytKSEg1TWRvS2g2YUhqditWNXp1emZGSWgz?=
 =?utf-8?B?ZDFLY1g3WjF5c2lsTURqeDNvQzZySThoT3RiZ0tWQmRHaEtpTSs4S0dnMy9k?=
 =?utf-8?B?cEhQbDVSaVZjYWJ4N0Z5MW5HNEx5bWplZkpXTmV4WFhoRVJMOHdPMmhwMmZ0?=
 =?utf-8?B?TGo2N0FUTDdITXVUQWhkM1pMczh6WFE1ZnJzZHp2clZ3WTZhTndBeVdlMVBM?=
 =?utf-8?B?SUpxTFZ6ZmVNYzN0L0UvQW1vUW53ZFc5dkhmenp3ODVzbit6TGI4S0JweFFX?=
 =?utf-8?B?Yy9hOXFiNE5mNjVzNHM4UHBLcUtPY0lNWTh3Ri8zb05HQVYzWlp6OUpPSFdQ?=
 =?utf-8?B?aFV4Ump0VGpZZjZOYTFYenBadnVQZVF2clh3VVk2OENhb3NrUGV0dHdTRUQ5?=
 =?utf-8?B?bStEZW1jbkx2QklnWTY3N1AxK3l3MVZJMkFxYmYwQ25CNGtYR29IYjhNanhG?=
 =?utf-8?B?QVFvemd4Y0pHMWQvcVdyWjlIU2tJU2VMeUltcVlrNGQwTW9kMmowUFpPTFRh?=
 =?utf-8?B?cGFNeXpCREpZck9JcUhJVG1TMmNvMHoxRDlGTFdMelV2SEVyZjkyRFR6bDlo?=
 =?utf-8?B?TjYwaWxqYXIyenFmeVhMa3FOZXZ5NEZvNmxLN0txZFhZdTVPWUFBVGdPN21t?=
 =?utf-8?B?TXcwa09xN2NWMVZNNUZRandtbEp2NlJzVThVNHl0dUt6ZkhlZWx4TzRwaTE3?=
 =?utf-8?B?eFhHNTlQaUtENVdnY0c5QkhicU8rb0NCUElLY1kxOHkzajZ5RXdmUWJFTGl5?=
 =?utf-8?B?WWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea301164-03fe-4947-12c2-08de01fbd650
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 21:37:08.0174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: znmRE4a12GiqO3iFfuEw13dEy7FzOMcY9ljWGlRz434vLR4al4UsIqS1wFVx59Fkfy5S1u12uL7pvQa0e2FawUx1P42xgSYArNzktbw9DBI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5134
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

On Wed, Oct 01, 2025 at 01:35:21AM +0200, Michal Wajdeczko wrote:
> To allow the user to control the activity of individual VFs,
> expose basic VF control operations (pause, resume, stop, reset)
> over the debugfs as write-only files:
> 
>   /sys/kernel/debug/dri/BDF/sriov/
>   ├── vf1
>   │   ├── pause
>   │   ├── reset
>   │   ├── resume
>   │   ├── stop
>   │   :
>   ├── vf2
>   :   :
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

Thanks,
-Michał

> ---
>  drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c | 93 ++++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
