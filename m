Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF154C83F17
	for <intel-xe@archiver.kernel.org>; Mon, 14 Jul 2025 18:49:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEC1010E346;
	Mon, 14 Jul 2025 18:49:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R/zgVP96";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9C5510E32D
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Jul 2025 18:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752518966; x=1784054966;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=J7RnVOtdh8TQPmc+QnYgaUwShXQVMT8JoUCVCM5k0C4=;
 b=R/zgVP96l5YJVXrc0rP9uoQn4MHYlN/QgtjfgMxwWXWpVg8OZe8lAv1d
 uYkKnVek/5NvCE6Ze7Ny+qylc1wjhFzv/uIq1m8KRE0k83LNscuhXsHRc
 4zA/tW/E/VryqXzkzQtylh6DtZQCt/lI73BYo2QtMr+3a5CvnYNMY3iXZ
 iT3m9oL4KrElQKtFrXo8dZe9ds63BQHxpu/CextYUGHhBbh22m23reswC
 nMtiX9L5oXsP3g/UiihrJeOHJHLoKcoyzyaN2Z7V7UAUJ4Htbx86VGRlH
 mqpcm7XRohTPVauDAUj6S/Evo5p4sslU/eS4RQUFZrjFyMXFUoX6mV8zf Q==;
X-CSE-ConnectionGUID: nqXi82nAQqa2pWvPxOIxNQ==
X-CSE-MsgGUID: wVczJdHzTkSRQUik+kYhtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65789063"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="65789063"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 11:49:25 -0700
X-CSE-ConnectionGUID: lfXzFRUJSGCHc8b3Enpkww==
X-CSE-MsgGUID: zuyQrBz9R2y2bjXkxdV+7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="162561399"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 11:49:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 14 Jul 2025 11:49:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 14 Jul 2025 11:49:21 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.65)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 11:49:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xFtEKoROjYbWn+HcH5M4jLAUXa3XAY4+oe0cvhEow6RTegPAdO1K9mR0MXRZs5yfToYJAQLiJiN+FmHvDc+zC+YeZOIbMOfCXrv1d9jvZ6qBjfSYk3agyFeRyYjt4LAzb3+RFoh+a6gFniwbeihSCpMvVwDCa20L1/ANdEi431Gcv9YcFGoad5FjrZfRidvBdUov3h2Ca7AuRl6f73But7OziC+9KQRKmzL7sMdD7bic+qDhCjSx+8FLXC72XvrmKKryCPV2wWoadAvoowToQiU7pBJJS1arlSWHangvp+H4OEXy9dKjoYs/ofHQ1CgHBOcJbImFBP0Z/dnRibm3sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4vrGB/Vs0UNNytsSqXDqpgN4vqquJZhzP9ENHlzMME=;
 b=PQ/IDbNgJEV11rhpQjSoxDcAtTAzYanpuRVpg3HSpigyuCsYjsFTM1M4gboRBTXOv3kcA1W7kTcTgyjmRAXk17JpwrN8QD30LJW7LhkRIne2b6J1fyAJIGIUYVoSyMNVnPkNNX7kyxpcT3PmHmJs+RjorJsBBzmaxSszFDZEKa3qraTWyR0uBIMnRSOA4qSO8DM51EE2G6FsxiNygZyWGgXm5t5eKiNx0vt0xPyaVUi3dkKM/cYmRAwNATzCbNIkO0Mw4CiuwQao1NmOopdP9RP9vhM0Lu2wes1/3f58qGbZVqrSCtlXKFJt3GH1i3uCjwRZJ8p9+92eD9QyPurIuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH0PR11MB5176.namprd11.prod.outlook.com (2603:10b6:510:3f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Mon, 14 Jul
 2025 18:48:34 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Mon, 14 Jul 2025
 18:48:34 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH CI,
 v11 3/5] drm/xe: Move struct xe_vram_region to a dedicated header
Date: Mon, 14 Jul 2025 20:48:16 +0200
Message-ID: <20250714184818.89201-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250714184818.89201-1-piotr.piorkowski@intel.com>
References: <20250714184818.89201-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0256.eurprd04.prod.outlook.com
 (2603:10a6:10:28e::21) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH0PR11MB5176:EE_
X-MS-Office365-Filtering-Correlation-Id: 2372b98e-d47c-4727-07ca-08ddc30708d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VnloNzdpOHZObElGUTZjNTN0L3dlUVVQcHZUbmlaVmxuUi9jeWlQYlZIT1B3?=
 =?utf-8?B?aU1XYko5S1ViNVVCa1lzZEZvTllSaExlUy8xamJmQ1Izcm9XNkVqcDhqTXpU?=
 =?utf-8?B?aEdoRWlnMEY3UmlDOVIyMlRYU29hNnBmVWNjVzFmQTZEU04vTU5takdRQUlk?=
 =?utf-8?B?YTdjT1ptUWpZQ21rMVJxL00vV3FmV1BJUW8rUE9XeDVHMkxWaExIY21WcGkv?=
 =?utf-8?B?TmFtUGpUUFFQY0hHRXpnZnp5Y2ZkdWlPZU14cXM2S0RjanZDbTB5bEZCV09q?=
 =?utf-8?B?UjB3QzZxejdHVzZoNjV3Yzl4S1dtOWc0R0ExNVI0NmNIcEJGbUk5cGhNN2FQ?=
 =?utf-8?B?ZEpjU1JJRUwyQ3hwRE9hZksvdnFEaFhGOGc0RGFYTnlueEtGbEpIVlZsL29a?=
 =?utf-8?B?dHdickxwOHpEUzVqbG1nc1JIS2lkK0ZMbU5SbWplMDc4eGpuZkdLTFV2Mnp3?=
 =?utf-8?B?bUZaeEp1Rkc2VWJKYUUxdmNGYVpJdDZTSjA1Y2RXTkhLa3VRbDl4Z21PUG1l?=
 =?utf-8?B?cUUyOHZMT2xjb05IU0E5TTNLNGNpSTlpdHlveTgrcERPWW1BRjJwRGFtYTM1?=
 =?utf-8?B?eDdXcXBscXlWODZ1TTZWa1lua0lmWjU5dWdLQkJCbVMvOWVaNUFBTkRLMDZx?=
 =?utf-8?B?d2hKZ1FHdXFueEsveXJab2d5M29LMnFhb1ZCYWFyWEtscmxuSXpwbC9BbjdK?=
 =?utf-8?B?R0x0S1dzMDMvTXBiQk13WVlzakM5SkVQNGJCaG9mK1hCOWpjb0xkbzFqSThz?=
 =?utf-8?B?V0wrM01TbUlhbXV6a1ZPMUkyK3NKMDh3SE1KQzFtMXZNSDBJaDJ1RlNRSjhU?=
 =?utf-8?B?dVB4ZXhOelhnWFpDaEsrTXJVUTJpNVNGRDhqdXYwZ3pnR0ZhRkdNV1ZtcERC?=
 =?utf-8?B?aUNmRzZOT0t4MzRxOTdFanBWNG5TdE8rUUdiSnFWeTNnV2dCc3ZjKzlZM20w?=
 =?utf-8?B?eFF4Tk9qTUNNVjlIay9TL1BETG54dWFiek5sQjZNT2hJdmFhelpsb2ROZEIy?=
 =?utf-8?B?KzFPMTZ3YTR4N0ZuVGZ3bHQ2NlNOeU5HeWNOSHFsQUNiejVuN0k5NDBlaTlZ?=
 =?utf-8?B?Mnc2K1pLY1JXNWxtM3JFL1RSTFR1S3M3YkVGSnR5SmpraEsxSlFFSGRCSVpz?=
 =?utf-8?B?cVRzVFFFUzVjYWx2LzgvNDZralpiZUlxTE11SlByVE9pTXU0bzVLMVYrcllw?=
 =?utf-8?B?Z21rSFFrSmpPOTNHbXF0QitnZ3V5MmdzaU1MblNhdEJrdVVVZllQbDA4U2F3?=
 =?utf-8?B?SU5pa3oxOTZDeWpkdzZuQWJKcDN2YjlINnd1RllVZ3BGNy9WalNGRktJczl3?=
 =?utf-8?B?cVkvcFhoaXJuajJrOUo3SWJjWHNucU5aY3lPN0NtbW1weE9wUUdzR1Y2aHBw?=
 =?utf-8?B?YUkxM1ZiL3ZtNjZwMVJSUG5BSGtvL3lRRGMvbTc5dmxVUVFZQ2ZUc2V0U1Ex?=
 =?utf-8?B?RThrOTVlN2RhdE5Zd2NYM0l0N3VTSWJVaGZTWk11dEdiYUNuVmxWWWFyOGlk?=
 =?utf-8?B?c2ZBOFFoSU00cU8rNGhScyt3K3FLUHdPOTBUejFLdUNvSExNT3ZpTmpWWXgv?=
 =?utf-8?B?VzgvNENNQllmbk52bHRVM3dBc2JmamxsMnR5cHNBVThUVDFlb0VBRXZPc2x4?=
 =?utf-8?B?bCtGL1JzS0dhekc2eVhsQU1RK2J0NzkzYnhmSTExT0pDQ1ZVdW9YMlZXcHhH?=
 =?utf-8?B?Z3J4QkZWSW03NFQrcmJsM1ZGMGROU3FhUlNDc2swTDhTRTBrOG41TnpjTEN1?=
 =?utf-8?B?cXlsTGVFWTRyR3g4dVNFelpsK3MyTERWRG45N09GeDNMR0F0NkxiZGJTYlNE?=
 =?utf-8?B?TllPZDJlaXd0ZVVFa1VxSDhWNHhLNmFkQVdKWFVLa0xrZkdRL0JEOGlITEV0?=
 =?utf-8?B?ZmZrNmxxdTk2UEx4S2NEamtnQXkzTGZCM1FhVDZYNnpVajlGcStNSHJqY0ZZ?=
 =?utf-8?Q?KhbP2ojiT6s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejUzVDdrMXNyZEhYbnhORm1NVlZhOWkyK3ZuZytUZlBsSTdWS25ORGVtUG1D?=
 =?utf-8?B?Z0JzQy90RFVoUklZSjdDUzRrcjV5a2NNOFJjVXNGU01yZkl4SExWT1MwdjFI?=
 =?utf-8?B?SDdmb0hGY1BuU1NDMkJKREs2ZzJabTBGbUhNQVZ5OGNRcEtXQVJpSkNLWkJF?=
 =?utf-8?B?QklaOHFtWEgxZlErZjVCby81dWIwSTJBeEl2UDZPT3I0K3lQTkczTGl3cms0?=
 =?utf-8?B?WjhpaWpSVkhSSU9FK0xmNkVsR2FaZ3IwSEx2K2tPbSsxRTFOcWpaOTJnUWFt?=
 =?utf-8?B?RmJrTkV1UHEvcEQ4L09RN3NwZEhRdTZzQVpWT2dHSVpldGdROHp1YUgyeEhF?=
 =?utf-8?B?ZjJGNkg5MnRiTlo0MHAvZ2NERll4WDNuR1JWdEp6VUd1OXIxWWJYRlR5K1RU?=
 =?utf-8?B?aW1mWVp0ajBhQnhRSWRiN2pHUC82aEMyZWFaelhkSE96bDZ5TVZZUGVheitj?=
 =?utf-8?B?RXUzalpIMDhUVDlMZDZTYkNsYnd0dWJQOHJvbnRMbENaQUptM2NxRnBDeWor?=
 =?utf-8?B?K0c3RFFIMDltSDZlZVowZXRST25hVkdERGk0bHo0TXB1YUkySzJEVkQvQ2w0?=
 =?utf-8?B?YW1CNFdBM0RGNDdjd2NyK2g3M1BjbU5ZMXFYNExnOXQwbVFWdkJOazlYKzB4?=
 =?utf-8?B?RkFoYjJYb0RsbC9aOHFBVFFocFhscDFMbVFScUo2RlhBZDFxL285VFlpT215?=
 =?utf-8?B?S2t5d29qUms2SGJpbHpia1dZa1hzMk1vRnluQXp6TEFlamJCUUUvZlZadEVO?=
 =?utf-8?B?N2FBeWJ0KzZiWEI1eDEya3R6bGI1ZE5NcUIralJYeUczZ1FVcFRKWlNwdDFV?=
 =?utf-8?B?NmxGQUg3R21VdXZUN3hWVSt4R2tJTkdUK2liNmZjS0ZSd1VyQWd5WjR3a2Qv?=
 =?utf-8?B?YWxmWDNsekl6cjhlbTRIcC8zc05iL2t0UVVLWnRFZHhSa3VDYkZLTWJNUDRI?=
 =?utf-8?B?bm8zQTRMU1hkSlR5eXlWMUttd1hhYk15ZmtaZTU4WEdla0QvZU9yYlc3ajE0?=
 =?utf-8?B?WGwvQmlFR1ViUys5VnRsTXRzMXdmcmpJMURCQXN6KzRDOHIwSnM0ZjhPcmk2?=
 =?utf-8?B?WW5jTlZpYlE5Z1BJK3Fvb3JCSmJVWW1ERzVoWmNrWHFXcWQ1YWZGMCt5U3ZL?=
 =?utf-8?B?WWM0UnVJME00c0tWWWhwVE1YRVgyYmpiNnNWZDZ0dmQ5Wk9EV1hITUp1WWpz?=
 =?utf-8?B?dGhBWXAxL3p2dkRDb1B4ZzAxSDNJK0s3WWp2bGRnREV2alFQUDR5K3lKN0do?=
 =?utf-8?B?NTNPcFhXTFlKQXdEbFBTZDdtaUxGZFFVRTMrY0paUDFyUG9pRHZ3ZnRDTjhZ?=
 =?utf-8?B?VDNRc3M2VWZQK3E1N0VDTmV2SXhQY3VxbFNoUGlrREdzTjdFMW5Ea3RtRVo3?=
 =?utf-8?B?cWhnSUZWbGJCU2x5Tm5Cb29POC8vMTc4c0k2V1lYOEtFN3MwQUNyamt3VkxY?=
 =?utf-8?B?eThNZm5pT1RtVWJSY3QzczZoaDFoMyszM0gvQnEzcEVMVWZtNC9nNzBkNHpO?=
 =?utf-8?B?ZkxSRm1IUnQ3M0lrM3ZZYlk0dkZCc1loZWtkcDZTVFZJZnlwRHJOSmwzeUZY?=
 =?utf-8?B?SGdobzhTOW9tbDZxSDlGejJvaU12RGIxTEIwOHlGNk5pUVBLd0FpQmNxc3NE?=
 =?utf-8?B?emNFV0JBaUVQK2xuSzVqVlNyR1BBKzdYL1JzMXdFajNHc1BSZURiRG52RDlw?=
 =?utf-8?B?U3UzY3FRdVp0WDlLdkxUTHJHcEFIM0QrREs0OG83QVM0Y08vYkVla3dLWjdW?=
 =?utf-8?B?L1B6TEZkWHI1UmVSN1NNTjhMN0VUZlFRaFRlMGg3RHVUM3JDbk1RMU52WG5D?=
 =?utf-8?B?UHA1LzR4dDVUelNTR0xqYnRQYWNqVFZnZVNFcWlKWTRmMUNTQlpxNjFaaldt?=
 =?utf-8?B?Z2s2emQ2LzcwZ1FKR3pXdjlZRVZKak9BNVpxMUx0dlltdTZReWdVaUJFMkIv?=
 =?utf-8?B?ZGY5Tnl4WFJrSDduTVRZbERQSTROR0ltZU5JOWM1OUkwTFh2S2tBekI1TG5C?=
 =?utf-8?B?OWZCRVJWNzVrM0VpR2U5cjZiY3FhRWlvNEU1SzJtWFU0RkFLN0tSYzRlalN4?=
 =?utf-8?B?Vy9LQWFzQTFhS2RzQjJxdE5ZRURKejRIb2Q2SzhpYUxEa3VFRytBMU1adFp4?=
 =?utf-8?B?bU4rTGdPdXlZdlR6NFpMV3o4RkM1aFNZa1BJeXlPSjZMa3pZeitldTZZam9v?=
 =?utf-8?B?L3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2372b98e-d47c-4727-07ca-08ddc30708d2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 18:48:34.0360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P5VXRRJ85Qq8iUtb6fC8f4zt2DlhOEkaIfqNzaqQKhN11aIXPN04lpYkoyZ1xTQxIFsubJzf/PkdrXnq4K7zz/RtU8yiZwlXDNeihf7vTYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5176
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

Let's move the xe_vram_region structure to a new header dedicated to VRAM
to improve modularity and avoid unnecessary dependencies when only
VRAM-related structures are needed.

v2: Fix build if CONFIG_DRM_XE_DEVMEM_MIRROR is enabled
v3: Fix build if CONFIG_DRM_XE_DISPLAY is enabled
v4: Move helper to get tile dpagemap to xe_svm.c

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Suggested-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com> # rev3
Acked-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  1 +
 drivers/gpu/drm/xe/display/xe_plane_initial.c |  1 +
 drivers/gpu/drm/xe/xe_bo.c                    |  1 +
 drivers/gpu/drm/xe/xe_bo_types.h              |  1 +
 drivers/gpu/drm/xe/xe_device.c                |  1 +
 drivers/gpu/drm/xe/xe_device_types.h          | 60 +--------------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  1 +
 drivers/gpu/drm/xe/xe_svm.c                   |  8 +-
 drivers/gpu/drm/xe/xe_tile.c                  |  1 +
 drivers/gpu/drm/xe/xe_tile.h                  | 12 ---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  1 +
 drivers/gpu/drm/xe/xe_vram.c                  |  1 +
 drivers/gpu/drm/xe/xe_vram_types.h            | 74 +++++++++++++++++++
 13 files changed, 91 insertions(+), 72 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_vram_types.h

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 2187b2de64e1..f2cfba674899 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -16,6 +16,7 @@
 #include "xe_device.h"
 #include "xe_ggtt.h"
 #include "xe_pm.h"
+#include "xe_vram_types.h"
 
 static void
 write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_ofs,
diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index 873f4e18cb2a..11591c7cdc70 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -21,6 +21,7 @@
 #include "intel_plane.h"
 #include "intel_plane_initial.h"
 #include "xe_bo.h"
+#include "xe_vram_types.h"
 #include "xe_wa.h"
 
 #include <generated/xe_wa_oob.h>
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 18f27da47a36..00ce067d5fd3 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -36,6 +36,7 @@
 #include "xe_trace_bo.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_vm.h"
+#include "xe_vram_types.h"
 
 const char *const xe_mem_type_to_name[TTM_NUM_MEM_TYPES]  = {
 	[XE_PL_SYSTEM] = "system",
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index ff560d82496f..57d34698139e 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -9,6 +9,7 @@
 #include <linux/iosys-map.h>
 
 #include <drm/drm_gpusvm.h>
+#include <drm/drm_pagemap.h>
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_device.h>
 #include <drm/ttm/ttm_placement.h>
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index df6f1790d6a6..08f45777f797 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -64,6 +64,7 @@
 #include "xe_ttm_sys_mgr.h"
 #include "xe_vm.h"
 #include "xe_vram.h"
+#include "xe_vram_types.h"
 #include "xe_vsec.h"
 #include "xe_wait_user_fence.h"
 #include "xe_wa.h"
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 8262a935ddb4..94a6b81b3f9d 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -10,7 +10,6 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
-#include <drm/drm_pagemap.h>
 #include <drm/ttm/ttm_device.h>
 
 #include "xe_devcoredump_types.h"
@@ -26,7 +25,6 @@
 #include "xe_sriov_vf_types.h"
 #include "xe_step_types.h"
 #include "xe_survivability_mode_types.h"
-#include "xe_ttm_vram_mgr_types.h"
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 #define TEST_VM_OPS_ERROR
@@ -39,6 +37,7 @@ struct xe_ggtt;
 struct xe_i2c;
 struct xe_pat_ops;
 struct xe_pxp;
+struct xe_vram_region;
 
 #define XE_BO_INVALID_OFFSET	LONG_MAX
 
@@ -71,63 +70,6 @@ struct xe_pxp;
 		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
 		 struct xe_tile * : (tile__)->xe)
 
-/**
- * struct xe_vram_region - memory region structure
- * This is used to describe a memory region in xe
- * device, such as HBM memory or CXL extension memory.
- */
-struct xe_vram_region {
-	/** @tile: Back pointer to tile */
-	struct xe_tile *tile;
-	/** @io_start: IO start address of this VRAM instance */
-	resource_size_t io_start;
-	/**
-	 * @io_size: IO size of this VRAM instance
-	 *
-	 * This represents how much of this VRAM we can access
-	 * via the CPU through the VRAM BAR. This can be smaller
-	 * than @usable_size, in which case only part of VRAM is CPU
-	 * accessible (typically the first 256M). This
-	 * configuration is known as small-bar.
-	 */
-	resource_size_t io_size;
-	/** @dpa_base: This memory regions's DPA (device physical address) base */
-	resource_size_t dpa_base;
-	/**
-	 * @usable_size: usable size of VRAM
-	 *
-	 * Usable size of VRAM excluding reserved portions
-	 * (e.g stolen mem)
-	 */
-	resource_size_t usable_size;
-	/**
-	 * @actual_physical_size: Actual VRAM size
-	 *
-	 * Actual VRAM size including reserved portions
-	 * (e.g stolen mem)
-	 */
-	resource_size_t actual_physical_size;
-	/** @mapping: pointer to VRAM mappable space */
-	void __iomem *mapping;
-	/** @ttm: VRAM TTM manager */
-	struct xe_ttm_vram_mgr ttm;
-#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
-	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
-	struct dev_pagemap pagemap;
-	/**
-	 * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE memory
-	 * pages of this tile.
-	 */
-	struct drm_pagemap dpagemap;
-	/**
-	 * @hpa_base: base host physical address
-	 *
-	 * This is generated when remap device memory as ZONE_DEVICE
-	 */
-	resource_size_t hpa_base;
-#endif
-};
-
 /**
  * struct xe_mmio - register mmio structure
  *
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 7e7102cddfd7..22a61b4c4390 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -33,6 +33,7 @@
 #include "xe_migrate.h"
 #include "xe_sriov.h"
 #include "xe_ttm_vram_mgr.h"
+#include "xe_vram_types.h"
 #include "xe_wopcm.h"
 
 #define make_u64_from_u32(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index e6871734ffa9..901f9a0268e6 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -17,6 +17,7 @@
 #include "xe_ttm_vram_mgr.h"
 #include "xe_vm.h"
 #include "xe_vm_types.h"
+#include "xe_vram_types.h"
 
 static bool xe_svm_range_in_vram(struct xe_svm_range *range)
 {
@@ -989,6 +990,11 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
 
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
 
+static struct drm_pagemap *tile_local_pagemap(struct xe_tile *tile)
+{
+	return &tile->mem.vram->dpagemap;
+}
+
 /**
  * xe_svm_alloc_vram()- Allocate device memory pages for range,
  * migrating existing data.
@@ -1006,7 +1012,7 @@ int xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range *range,
 	xe_assert(tile_to_xe(tile), range->base.flags.migrate_devmem);
 	range_debug(range, "ALLOCATE VRAM");
 
-	dpagemap = xe_tile_local_pagemap(tile);
+	dpagemap = tile_local_pagemap(tile);
 	return drm_pagemap_populate_mm(dpagemap, xe_svm_range_start(range),
 				       xe_svm_range_end(range),
 				       range->base.gpusvm->mm,
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 858ce0183aaa..bd2ff91a7d1c 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -20,6 +20,7 @@
 #include "xe_ttm_vram_mgr.h"
 #include "xe_wa.h"
 #include "xe_vram.h"
+#include "xe_vram_types.h"
 
 /**
  * DOC: Multi-tile Design
diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
index 440bc9e11c8b..dceb6297aa01 100644
--- a/drivers/gpu/drm/xe/xe_tile.h
+++ b/drivers/gpu/drm/xe/xe_tile.h
@@ -18,18 +18,6 @@ int xe_tile_alloc_vram(struct xe_tile *tile);
 
 void xe_tile_migrate_wait(struct xe_tile *tile);
 
-#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
-static inline struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
-{
-	return &tile->mem.vram->dpagemap;
-}
-#else
-static inline struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
-{
-	return NULL;
-}
-#endif
-
 static inline bool xe_tile_is_root(struct xe_tile *tile)
 {
 	return tile->id == 0;
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 3de2df47959b..8f9b8a1d2c05 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -15,6 +15,7 @@
 #include "xe_gt.h"
 #include "xe_res_cursor.h"
 #include "xe_ttm_vram_mgr.h"
+#include "xe_vram_types.h"
 
 static inline struct drm_buddy_block *
 xe_ttm_vram_mgr_first_block(struct list_head *list)
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index c93e9b96354b..366e5d8a85ca 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -21,6 +21,7 @@
 #include "xe_module.h"
 #include "xe_sriov.h"
 #include "xe_vram.h"
+#include "xe_vram_types.h"
 
 #define BAR_SIZE_SHIFT 20
 
diff --git a/drivers/gpu/drm/xe/xe_vram_types.h b/drivers/gpu/drm/xe/xe_vram_types.h
new file mode 100644
index 000000000000..a01838236036
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_vram_types.h
@@ -0,0 +1,74 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_VRAM_TYPES_H_
+#define _XE_VRAM_TYPES_H_
+
+#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
+#include <drm/drm_pagemap.h>
+#endif
+
+#include "xe_ttm_vram_mgr_types.h"
+
+struct xe_tile;
+
+/**
+ * struct xe_vram_region - memory region structure
+ * This is used to describe a memory region in xe
+ * device, such as HBM memory or CXL extension memory.
+ */
+struct xe_vram_region {
+	/** @tile: Back pointer to tile */
+	struct xe_tile *tile;
+	/** @io_start: IO start address of this VRAM instance */
+	resource_size_t io_start;
+	/**
+	 * @io_size: IO size of this VRAM instance
+	 *
+	 * This represents how much of this VRAM we can access
+	 * via the CPU through the VRAM BAR. This can be smaller
+	 * than @usable_size, in which case only part of VRAM is CPU
+	 * accessible (typically the first 256M). This
+	 * configuration is known as small-bar.
+	 */
+	resource_size_t io_size;
+	/** @dpa_base: This memory regions's DPA (device physical address) base */
+	resource_size_t dpa_base;
+	/**
+	 * @usable_size: usable size of VRAM
+	 *
+	 * Usable size of VRAM excluding reserved portions
+	 * (e.g stolen mem)
+	 */
+	resource_size_t usable_size;
+	/**
+	 * @actual_physical_size: Actual VRAM size
+	 *
+	 * Actual VRAM size including reserved portions
+	 * (e.g stolen mem)
+	 */
+	resource_size_t actual_physical_size;
+	/** @mapping: pointer to VRAM mappable space */
+	void __iomem *mapping;
+	/** @ttm: VRAM TTM manager */
+	struct xe_ttm_vram_mgr ttm;
+#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
+	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
+	struct dev_pagemap pagemap;
+	/**
+	 * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE memory
+	 * pages of this tile.
+	 */
+	struct drm_pagemap dpagemap;
+	/**
+	 * @hpa_base: base host physical address
+	 *
+	 * This is generated when remap device memory as ZONE_DEVICE
+	 */
+	resource_size_t hpa_base;
+#endif
+};
+
+#endif
-- 
2.34.1

