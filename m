Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C49C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 20:36:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66E2110E823;
	Fri, 19 Apr 2024 20:36:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m4xtREgQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB28310E823
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 20:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713558981; x=1745094981;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=VIyRc2mwcg88KOAM9nb4X/X4tUTyKQ3c4wFf4ZfZ5vM=;
 b=m4xtREgQuKAeVZkvo8KEzw/IvgBkImzWmyCiuSEKLLGu6fxpld5YhBYZ
 EGcB+MUh37Q5I3RMXM8slM59r0zZK+PAhhTPDcS/B5XwmJzetiu/6E35v
 0Qf/B8Y27A5NgoGwA6f/Hz3veMok+shD+Ot1DjzjHF0g74AF1yyUyeo7T
 QwgVcS27KPs/eU5p2r81qVnu78QZrOdLeWQfUdXPmN/HeRxnslaDsgXJ+
 TVGUuSIEVAo0CJVlHcNOrNbcL3tw1IRNxKPTkc199PiM73yb+bkwHtOmP
 GRbga+SmJNe9ZjrbrinC/YTLy8o/D+LW1yJunYs1lJTq+Gg6Lllp38TL7 w==;
X-CSE-ConnectionGUID: X/lAnUOVQiWIeicNrv637Q==
X-CSE-MsgGUID: RiN0jJAFQbuzRH2a6M0lmQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="9053020"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="9053020"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 13:36:20 -0700
X-CSE-ConnectionGUID: yYQdbFK1QFChmCVYXltUug==
X-CSE-MsgGUID: lv7whhyrQ+2zZ5DZUYzEUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="23469355"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 13:36:20 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 13:36:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 13:36:18 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 13:36:18 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 13:36:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JGEI5roY9tf+fbcYnSDrbg/WMAk4Hb0+GD8Tuk0/yeIAt0sX1Aa/niTnmvZVOy96qanilfP1v50RGY3XvFByDdOb8Xy/boFguP+Oa4nY9yNylgFrl+Zn707Fu/EBykyjxpcHBnIiHRuYYt0dSnN2vRhUx0eA+KCGAXlkFhh2QygHwXDwu9Vbd16NxWxvguzzqRj42dBeEB5FTGsZjfz3wRYDbyvSDUZG/CYFBlPkj1wre2Eah3a1Ddw2MGHbX4ofjRc0STqlEaj0pq8Hsl1wbJ/8arXA2AHxsINNi3gRXejlbMQ8J0MH3ZevsfIX9tDXtmpExvx1cACR+osbuTGpQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cdIT715mnnLqiXxHBgHZ8xo9lkabYng8uCpcZ01YW+I=;
 b=S6lZPAPRayBL+hvJpg6hYre8lQLAWAhCU/GkIk66jFsPWwY7lxknJE5dzJCFlZMskTHCRCwu+WjRs3zLBF+9a8RF5YbRAd+VdMO6UlGU+jSD12WP7EzTReCv+6InhTC5JEWGab+Tfl8SrGeEbQaIX5tahL49rhn4Qdu9hC/Ab0OS8AO/oxVWbwJxB6xp9vXAs468mQTBYfAR+BDxCKudbPVLPYlPMSVXNwWCmv/nh/jiMeSez3bRIc8PBmklwjAZCkRIXhefNPuKsnK4Ji8Kya3udcLah0CFoe/uq9yeC9Fd/BTcVZZdxORtDJWLrwkBfE1/m0F21lOEhO3DhlrHxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CH3PR11MB8139.namprd11.prod.outlook.com (2603:10b6:610:157::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.12; Fri, 19 Apr
 2024 20:36:16 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb%5]) with mapi id 15.20.7519.015; Fri, 19 Apr 2024
 20:36:16 +0000
Date: Fri, 19 Apr 2024 22:36:12 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/guc: Improve GuC doorbell/context ID manager
 intro message
Message-ID: <20240419203612.gtwnf3tlei655vza@intel.com>
References: <20240419153407.402-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240419153407.402-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BEXP281CA0002.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10::12)
 To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CH3PR11MB8139:EE_
X-MS-Office365-Filtering-Correlation-Id: a69b2278-8ac7-4c0e-2973-08dc60b05c65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dTdGOEVmR0FScDNhY3Nua1FramZnbVlCR2czeWpBSVFYc015c3k4MENsdGtt?=
 =?utf-8?B?d2NBNFkzRW1idk5EZjEyd2FlZDJPVk1BY1FiZ3QzbGNVN3c5NUpNU21oeEpZ?=
 =?utf-8?B?dFlzT2hXSVAzVCtVTTg0OEg2b1FBYys5RkdxbkNCUWVPNUljamw1NGJ1RmVG?=
 =?utf-8?B?QWxKT3h3U3cvOUlFaStHbUFuMVZxWGd3TzlxRkZPRVdleFdvQ01yaGFXMHVn?=
 =?utf-8?B?UGpMUk4xcE4zNStQdVFKQm1ZWkRLS0x2aVVrelZOeUZjY0ZrNlB2TDZmZ3Jl?=
 =?utf-8?B?cW52T004ajBCZmJXNTlBa3p4WDVWYm5jZnM3RklkSkFGenl4R2RvTklSOExO?=
 =?utf-8?B?THA5c2ZKOWw5UTlsN3dlQ0k2TVNQeS9CNVBVZU1wKzQzR2VpMmVTS2doVlBN?=
 =?utf-8?B?SmEvcUxIRzFBM0FpTjNGamNwQkt1QVY0SEtxOFIrbTd2L2JLVmx2QWR2VFdV?=
 =?utf-8?B?N1dIL21GYVZMWUYrRGlrZ2dIRXFyTFAwT0tzTHduOThxaGpoS3NadERsQ1Jt?=
 =?utf-8?B?Q05jNnpzYXJPNlNuQ0txM2kyaDBjdC96ZTJHQ0JROGtHamVOejYxdGlSSU5z?=
 =?utf-8?B?aFdDdGZjU1NtUDNzWjQyb3pYV1JSdjhnTUZvb1JZNUJ5OTVQT0VtQVFFcVRB?=
 =?utf-8?B?dGZjMDlUeVVwY21LUXpJc3RYUGtOUWROa1ovdDh6RHRFN050ZC9RV2pjQXlI?=
 =?utf-8?B?MlkzSFkxdWd0eWVDODVEbjlPUG41akhzUUsraGl6ekpMNTJLVzdZYkxiNmdn?=
 =?utf-8?B?dEIxa0NFYVFEOGMrQXlJQ0g1bzR6S1k0SUFyb0JlWEhockI5VUpwYy95aW9k?=
 =?utf-8?B?ejBCeUZ0V0l1dlZLMGJlNUJ6U2g0UHgxSFJaQ3dLOXdJWXZXWUsvV1RLRXI1?=
 =?utf-8?B?Q3h1TmZSZWhUUDFwY0xxaCtjMTZjZWpiMmV5M3ljYzdmenlkSEdYeCtXbk1Z?=
 =?utf-8?B?YmY4SVJYVnVVd1Q0TURkOHpTWmhWV3Bhd0xaT0ZFNVozM1RCNExWSGQ3K25r?=
 =?utf-8?B?S1UvUHQwbWVRZ2pkOW02a0NkS2hXZEFUalI3WEFWb1E0U0ZKT2dMbkJCZTZo?=
 =?utf-8?B?UDlyY3hQcURjR0JUNEx5aHBPelNyUWNUNkVlV3dQUG9GdTExUDNidndnaGZQ?=
 =?utf-8?B?dm9PeWFCSDY0YzNid1ArREMxaEZDNjlqS3F5SGJqaVBIL09TbkNZOG5VcFpw?=
 =?utf-8?B?NzNiQWVBUUhzQmdWTU1wVkRLLzZSOWJma2lzQ3ExRk44QkZNR1h4UngvYk9I?=
 =?utf-8?B?enhNbWMzai8vb3VabnFoNjhERGt6K3RIRllCVFlBc0xmblpIUytYdEgvR2RB?=
 =?utf-8?B?bXNBRDF2ZmpQTThFK01JcTVoc2RPc0Jwanpkby96a0JEQkVZYStnWFhhZXA1?=
 =?utf-8?B?TnZJa2ZORlB2eElROXZvSUxFN2JVWEp5bzBraVhGZTc5aHMwL0ZyM2pOTzNv?=
 =?utf-8?B?dThNRjc5MTJBYmhjVWdrcDFUb2hnRGp1NDRpYnhLRTllZStmMWt1RTJwTE1R?=
 =?utf-8?B?ZnhFZjJQQzRaRXpWM1lkRGlCYmlCNVJUT0VwRnZjbTlkTDZqRlFDNThla0dP?=
 =?utf-8?B?MS80RnFQaWdPZmVHUXFDcXRKdkE0QVNWaUdGMVZFTXpGemxod2NXYmxLZXpY?=
 =?utf-8?B?Sk94Nmw2THI2RDRYdWsyOFVXb1VKVXFBTVluVlk5UTBScEFKd1JZQmJVaWFT?=
 =?utf-8?B?c2ViUzRJNThnYlhEbmErNDZaVWllQkh4MmZLbG5sNG1KUTRKaDF4RHJBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjFEdDRvaEhQZ1Fxdlk1V3Y0a2JiQStBQlZGRjJjdklHYUtKWHlmODlCcGtB?=
 =?utf-8?B?Mml2N2l1dGVDNjhEM3lRTnFkSkhQNlY0QTFzZUNHcGlmVDl2L2lVWEJEOVl2?=
 =?utf-8?B?UC84UEU4VHBHZTJXdDZrNVJURE8yU3RCTVJEMjVva3BkSzgzNjJZTWNpNFoz?=
 =?utf-8?B?SUV0dDhUa2ZKY0tURXVDakVNSDdhWFZaWHQ0bGFOR0M5YkY0eDdqaHBGd3Fq?=
 =?utf-8?B?bG42Y3NHYnV1U1VqUm9UckUrNjdNTmRscTJmYUFwQkJQL0xodzVmR3lFaVQ3?=
 =?utf-8?B?SUVINXhuaEwxSFlBSVk1VmNSSjNFZkFEL0I1ZjlJdFJSVFgvcm9tTHFPUkVE?=
 =?utf-8?B?M05Ub09UOC9Dc2tMRW94Nld4Wm11TjFSdXlVbFFiUVFjYlV3RVByb3RXcmRZ?=
 =?utf-8?B?Q3E5Um5mdFUzdVRJRURHMEcwOFBZZzBLdCtlZHRGM1ZtMlVhNjRIQnc0dXN4?=
 =?utf-8?B?a3M3SzVOY1pBN1M2ME4vOWZnMi9PRGhNT0d4YTY4VDlqSGdZM2k2MTA3T0xr?=
 =?utf-8?B?Wm1sK281T29WRUZRYnN4d083bDNERDVrSm9QMDRLcE83SUF1bGQ2TjYvWGNw?=
 =?utf-8?B?TERtSzhQRGcwbE92Q29VNWozbS92NHdlZ244cHJYQUM5RmpVKzlwUHAvazFO?=
 =?utf-8?B?cDFrUE1tbFlYempUY0tBZnVDRmluaGdUQjBkWVRzeTF2NlV2aE43Rm94Ykdy?=
 =?utf-8?B?TnZGUktlNVo4aG9nYk5NQlFmeHpLWFRmSFFINzhTc0xPSG9WZ0s4MFlodzdu?=
 =?utf-8?B?ZEVFc2xMTXJnUFkyYVBSNVJ4SmpqbHpTdzNUbTI4NTFFbnNta29URFpiM2s3?=
 =?utf-8?B?aUtQQ1kvTHhxeU5CZ2hWd0xJanJvV2N2RDVESHJLWXM5bWVlVFk0NzZKc2N0?=
 =?utf-8?B?MnIyUzMxRFNsUFdwN28yQXczcVZBUUgxZEpmTmxGZXFLU2lYeVVRVEZ0cGdM?=
 =?utf-8?B?RVZUNlpYNFA3QWw0RjVXZnY5Skh0dCtuMHNVZzl3ckwzZVl0djVQVnlHejgx?=
 =?utf-8?B?S1pzYTZQNWNxY0pPTzRHb3paWkI1cjJnVTkxRExvRGg4cGtxMWNLRklsdFBn?=
 =?utf-8?B?cDlrRXZUcVkzL3lQSzVLY0JoOUI1L1NRQnVQWW40WXVremtTS1MzQThubmpJ?=
 =?utf-8?B?VHozd3BJbm1Oc3pEZDZ6SC9hRzJ3SW1QZDJyam9ha0trYXpIN1UxL1BOTGhG?=
 =?utf-8?B?aGZ2WnljeHRRY3kxMjJ3YTZPbkwzbGdSQSs0VFFJQkVCeWJlMFM4Y2JIeFZ2?=
 =?utf-8?B?eWxKYThpc0l4SkRjT1hqQnByTjN1MHZ1TEdlUUFreVVwRS9MRXVsRFdNVnlJ?=
 =?utf-8?B?dEdTbzRsZURxb2pMYTIxOEhWVzAyYWVZRlUrNU9SaG5DcisvMlRURWgyU0lh?=
 =?utf-8?B?SERuSTMvVVh6UUowMEFZZlpRMnZ4VUIvUjlKczR2T0lISVJWMG5xZDNoQXFC?=
 =?utf-8?B?bUY1bkpBNUNnUTlrTVhiaEJLdk52Lzdmc2czc2xIZ01WMjgxVi9wQ1N0TGVw?=
 =?utf-8?B?YldWTTAyb1RkRitUMjdscUZYcXRQWXhUZzRRVm05cndlaGRibnRuVjAzVHdE?=
 =?utf-8?B?b2JDcTNFelh3dTdDWTdXbGNyT3pEajMwcVRlRHp0dTdaelFIcmgvSmdzYnRJ?=
 =?utf-8?B?cnNtWWpsVkdzZDdqR1lnQU9wTm11WE9CNWNOWnBkNEZ6Y3o1YkFTOVZMbllz?=
 =?utf-8?B?U1BnWXFTRGMrQTl0eGU5QjNxOWpkcEFyQ21oRTdsRE5JRUNSSkVRK0U0WjBw?=
 =?utf-8?B?Q2xwdVQvZGY2bTA3STRxblRDTXFkdHE4TGNNNFlreEdqejNOciswam1jRTRC?=
 =?utf-8?B?ckFzSjNFRkYycm05UTJBYVdwYWczNm9vaHk0OEduQlczZVoyVnpQYjNNTFRP?=
 =?utf-8?B?QjJpZGtHQUxSQmZTKzJxR2RNc2ZTRURwOGt4Unh3VG5hVGlIaEtPbVFzK3Bs?=
 =?utf-8?B?Mkp3Sm1vZ0NNYWE5TUdoVFN0dU9yQjRiR2xLaGFNWGQzS01yeW5OY3FSYjhj?=
 =?utf-8?B?bEZBaCszcENrYnBEZmdrV3FlZERNZWhwdDVHOWdVR3JlZ00rVjU0TEl5ZjR2?=
 =?utf-8?B?OXdPbEJ3bFRwa2djNlpBODNJeW5vSzdWU2JtcDMwNFowaFNrTUtzRitMYmhv?=
 =?utf-8?B?RzFKMTYvUWF4a0JMMm9nZG5aaTh3ZzZzT2gzSFRPMlI1RVpoejBiZXRCVXdJ?=
 =?utf-8?B?L0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a69b2278-8ac7-4c0e-2973-08dc60b05c65
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 20:36:16.2322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C+dEO5SvzAiFlITdccdbkfNt+L97HGVuLJXiQMy1yjr3SDJpqFNykMSN9aAId6Mib7iK2Q9DUwJsd+NAUAtvdWsQFh/n59Zs6YcXWaG1yhU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8139
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pią [2024-kwi-19 17:34:07 +0200]:
> We can use recently added str_plural() helper.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_db_mgr.c | 3 ++-
>  drivers/gpu/drm/xe/xe_guc_id_mgr.c | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_db_mgr.c b/drivers/gpu/drm/xe/xe_guc_db_mgr.c
> index 8d9a0287df6b..6767e8076e6b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_db_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_guc_db_mgr.c
> @@ -106,7 +106,8 @@ int xe_guc_db_mgr_init(struct xe_guc_db_mgr *dbm, unsigned int count)
>  	if (ret)
>  		return ret;
>  done:
> -	xe_gt_dbg(dbm_to_gt(dbm), "using %u doorbell(s)\n", dbm->count);
> +	xe_gt_dbg(dbm_to_gt(dbm), "using %u doorbell%s\n",
> +		  dbm->count, str_plural(dbm->count));
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
> index 0fb7c6b78c31..cd0549d0ef89 100644
> --- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
> @@ -97,7 +97,8 @@ int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit)
>  	if (ret)
>  		return ret;
>  
> -	xe_gt_info(idm_to_gt(idm), "using %u GUC ID(s)\n", idm->total);
> +	xe_gt_info(idm_to_gt(idm), "using %u GUC ID%s\n",
> +		   idm->total, str_plural(idm->total));
>  	return 0;
>  }

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

>  
> -- 
> 2.43.0
> 

-- 
