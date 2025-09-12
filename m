Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 992AECA101F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 13:43:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C2D10EC47;
	Fri, 12 Sep 2025 13:43:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E83bzCJ+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D968610EC47
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Sep 2025 13:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757684617; x=1789220617;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HZBO1Gk/SSJ1UAfzG1+5gw4gqIRtD+bQhS5HMNaTCPU=;
 b=E83bzCJ+l1zFJGxlfsDFUMx3LuQNn6FTrKebdDrJ3n+R9XJNrxRPhpwm
 Di6N/giQnxI3lHVLuk7ON1bDCSKlfrR9OAvpi4OM2GsYckqA265wUE0lf
 UMayW5xXHvZIkxsXZADAz0qFWefMqOZWE9MUpiDT8wYhY2KJCpJN3lHjL
 IBrM7GghDXHRbNfLLg/geEFypBvXoKGSy7Uh9pnW5n3Zmjdwd14WIt4yS
 sxrPsnnVKo1F+h0y3iBhPiaLLbgE5nLJQEKBCrs54gewpbcPSeOEN3fXj
 noQJCC3CkZPbrQN3Vdt8ljHtcrooPPn6lYtoJfnBv017QfVZmnFPKaTRg Q==;
X-CSE-ConnectionGUID: u/dRI+YKRXOkbHh5ZJX+zg==
X-CSE-MsgGUID: VU5wefS1SdeuBBbhArqm+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="63853663"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="63853663"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 06:43:36 -0700
X-CSE-ConnectionGUID: nAGNsScRSuaU6aUnkGBuCw==
X-CSE-MsgGUID: LqBC0GP7TLCM6wKwzkol8Q==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 06:43:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 12 Sep 2025 06:43:35 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 12 Sep 2025 06:43:35 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.44)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 12 Sep 2025 06:43:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HHuQ/EJxM0kmLk+LkrnlDyrObo8/ZhNRJraVFjrZ+Cf8nD2EGefIXn0jiwLPSQG4TzQjbJhLCLJZQ00TTNH7XAtf1H/TK+lOrUx1RhYhONzoll1/3C+HkITY+sRfWVZhtVTvL1SGzCHvwt/sfzn/85PnX+cbRDg+krsZA2DUs6zdEEoEy0fubxfM2jeJmLTI9xSONHCXJIs4YEqD0UARvwBAEAlfRBwX96kQ0ibU3avt1a3Z2dEeLW2z6d9lzWu163qHuUEh2XgXG72Pkj/cUVlyoEHt5T9h7f34dwxLJhk9lLD3BV4jWDvzgwvEFURYSZL7NSLDsUK4/2HGvMZWcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TcSFiaA9l5BwispgK4PLLBdTEjOTi8NAJlz90+Aiozw=;
 b=mEAusD8BHICk54Qjvf+JG30PN7YT7YAYFVl228la+YMNidsFBJvAHiJVnvtClv61/qbdmUO3HtTYJnk1EfKL4zyk8o2ktgkRz/Pa6YI0RPJmHuelrO8OHc/HgfKQWdGNqRcaUzsb9EWCH/83CkYLhp0bXOxvLZ3x74kkz+WpZ9astqLMvW4WuIO1j7f1jayY0THqb3iFlzH3UitAo1oF1REmxXdY8CVam9nozFwGQmbh6VcnjEenlHgtgx0WVnFOhB3IDFF/4XjEVtmJBIkDj2eb7CgtJMNdG9ozrO2QpGbXy6EVyOVgy9lRydl18KcS15AgWW3VUhvXX35SmO6FBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MW4PR11MB6618.namprd11.prod.outlook.com (2603:10b6:303:1ec::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.18; Fri, 12 Sep
 2025 13:43:31 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9115.018; Fri, 12 Sep 2025
 13:43:31 +0000
Date: Fri, 12 Sep 2025 09:43:27 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH] drm/xe: Fix circular locking dependency
Message-ID: <aMQjf9eIplownxs_@intel.com>
References: <20250911212024.966757-2-rodrigo.vivi@intel.com>
 <pcok7wpcby7muwekdt3eqczmarct4g2wrg2qmtupmvphmolhjp@ggqxwiz7pjib>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <pcok7wpcby7muwekdt3eqczmarct4g2wrg2qmtupmvphmolhjp@ggqxwiz7pjib>
X-ClientProxiedBy: BY5PR17CA0045.namprd17.prod.outlook.com
 (2603:10b6:a03:167::22) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MW4PR11MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: 95f11c2c-b933-4f6f-78bd-08ddf2025c91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+ohXJTWqHSwquFoq3TyjVEiLloc/EK0t2Ka0NfIRZ3ThqZWq8VN1tdOAG7Cc?=
 =?us-ascii?Q?lr7l9p/qqjnB+b96csSPyYVBn5vPFG64fapfmI6vmJxTHoEI0z8uRGpm9zbb?=
 =?us-ascii?Q?qggwvXLzddQIuD3lqoM30d80i1Dr7ZQUJ8sYYwB2/sczzX/TPCHCH+Q19IJe?=
 =?us-ascii?Q?8InDflr51BnWv2+o21zJGokI+cMD0JyI9KtxPFjy4NnUUxOR7qVYiNUUqFOw?=
 =?us-ascii?Q?f+DqnRkm7V2QPlfUn4rPNkp2GHJ0/dC2WfdvSjz0QWMROPEIoVoXWh8J5wsK?=
 =?us-ascii?Q?/1UdSiejkWvjNN21TUg2cKkYXaAuBD1QFghD1qf2v5eg2l9waE9r89dB2F3i?=
 =?us-ascii?Q?DfNbFfh9v3fGuVQEUYrru3nGeVAVReMa+OG38Y2j+wJ+LVXB/NzIkyan2nb1?=
 =?us-ascii?Q?p0OSuoS0SlTw6S9L23qS4V1cntFdE5uEH8BQWx2m7YdEZCeJJH4Sa4b/0o7+?=
 =?us-ascii?Q?TkWwpGATwJp7tpVZEB3FJJMRgf3GNvSXzPXnIn8rSuvrtjsRZ3ji1/Nvy4Y6?=
 =?us-ascii?Q?ML5hNW4/w/u4Ne4xN5mVkz1ShJOed9bIAEDp9WtLiJpTuySlnpTllVpkOiMW?=
 =?us-ascii?Q?/8b/9LAZ3zkb3P9L/653nliRNjUfc3Gtf98qAppKH5APxDDjE9iA38VsH1/o?=
 =?us-ascii?Q?sByhXzvtHP4BzroZbLrejz99m2HbTTarDUgXuONE0Tc3dwxwEgsLg+iTmlDY?=
 =?us-ascii?Q?J+qh9iY8Pfq9yPLLNSpP6RoWfbUNiNK5DCoeaVFhh287hZp6u0er56f5bhnf?=
 =?us-ascii?Q?QpN3KaV0xL27HQb5q10++BMDFW3tkWMYYv5zNq/mzcE/2tNRdF4oZh+SO47U?=
 =?us-ascii?Q?s+BmHhz6OYSKNcSM8TqM2Usc+k65oYtrC8p1xy57km9J6aBGEp9rNAjP1SF5?=
 =?us-ascii?Q?DnQReJWq/2HRl6hjag+T3aTR/kVkTdgjmBQI7BRMtLAWYoVAs+BlVGg7mqKZ?=
 =?us-ascii?Q?BJLTR8AZtzJuUQi/d9vVc42BkSki4BSjQppmIxopSk4Dhkp5OHAYF4jdMymB?=
 =?us-ascii?Q?HeEH23i4U9IdFsveOveoTB5kIszolweNRVcseJWwbTjEX+wf4eeuhlVTag4L?=
 =?us-ascii?Q?0+4ykimEZnKTTgfsPXgkOoWV+MHMaEw3DPH8qFGnzTphQSXrDt1iG/zcURDE?=
 =?us-ascii?Q?ZTPERXQKbZGQ+fCE+c3w1pG0GiAzRM85QcuCzwHzMOfpgOhVFbLMQg8S3Jil?=
 =?us-ascii?Q?SaXJRWAjwsA8bis2Q6+OzLGwXoV5VDei137u58dGx4mp+8ozDYcN/8PFsjYT?=
 =?us-ascii?Q?rRVzjVHIsOLGvMQSnXasmAsOKBV/iMw9s3PtJNqf13DjViLTlPaiyrwVSINw?=
 =?us-ascii?Q?LZEzTGzK8mJnsf43egf8roVDM3Pv5nlSRpVF/gPGSeYRZeqvknF7dDEiFnYK?=
 =?us-ascii?Q?3kGeKvA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3qbZg3WMK8sRPQH3X8QRVtVTbmzLK10JMteSIGQ98i6XFzdBdQvaJ+DM6wU0?=
 =?us-ascii?Q?ZM1mcWp19/H6/UEQoioAUPeTE7qbaCs8mlj344ZvXlkgdl6yAl5Hm65B6Wsg?=
 =?us-ascii?Q?tNiQ32d76hT1t7GL96JnSoEM64CLZKBqP5ey84/KEX5sjpsZPVVAWlenDcG6?=
 =?us-ascii?Q?JsviWD7kfvflkmotVA3omZZSTWVy9kJjIg5y5MlEMs6ITcEVmCT9SYOVUo2m?=
 =?us-ascii?Q?2Q7aEkPcDk8VoZoBBgOHkjzUlf/h5iIN+2hj85r2wRsW35Wq8HZrMU4Vgzlx?=
 =?us-ascii?Q?LvMiFwzVgNVITF3aCZ4yzDm1rROU/cS/yHzfopneWrAfW8NMpkm/TXALUkaj?=
 =?us-ascii?Q?plH2kO83ZMQX4vdFT1EDcbIZbmb9Uv01xcOPOvP3dJvlrAe2L4QgsJQlCWQv?=
 =?us-ascii?Q?ldTB1+6HzqZ4208rk2CFr5oFeu6cHSfKOp7pJr3RVzGh9oSBS6JYjtZ+AL3p?=
 =?us-ascii?Q?W5ius0ruINhg8JrMDa7jKpnQIDhhNz4aTwJWbU03B0y9CtdfSiy9t5lPIHSE?=
 =?us-ascii?Q?siuh7lLPCHeNcUc5+2jibRffTjgvzuZYzvb8OjiZrSrLQ6T7u8hK53n6LJQR?=
 =?us-ascii?Q?zF3EOe3MSzu/Egg2KiNhEf9n2L/wvW1IcghutzQeGwNVXOJgvtac3FWop5WH?=
 =?us-ascii?Q?MAbIyDC6JQ96lo51AEUVdw0v85ahHMEFndJ03OpCIDw9vr8hwI+kQu6SGxOZ?=
 =?us-ascii?Q?GmmlmFtUZsS6NXoqZva7KY7LrvFXRJzdUIQsHsNFtoLgcCqr/y+fTAOyWYNE?=
 =?us-ascii?Q?pGXlBP/7N7KVq4ktkzYQf62t/muqQRWyGx2l37lktTe3wnH9g6vhN5+hb8eF?=
 =?us-ascii?Q?Q/W9JDcm2GUvBzVS3gGOZ6b07ziSPWGgeulK513fciqW9y4To2lcyv2e6CFn?=
 =?us-ascii?Q?GtRurZwVEmW5rDw3258Lm21GPb0kTGr9SJzlGlAWiL3iCZv3vWecpTmcoe5s?=
 =?us-ascii?Q?zHEHNKczdIW93zlpSACQYQX1x/Qo/jhP/ptCTINk1eVEkhUnwwVQnPsSyEEH?=
 =?us-ascii?Q?nYBWU/dUNuYRSffsQpYqx47SAdiwKPPebrzCSLHZ7e8OcjNr8+SlMEffFALU?=
 =?us-ascii?Q?mCmHoKZ5RcDmCjgRPcesyKFnmPGmoO1o6vmBv4F5hajtUddtuP1VLK2m/+pc?=
 =?us-ascii?Q?TLX96dTGx1LqwYF335KfrVXO7HVDWc2/LYMQOj3Jgh8T6nh5e9d8owIWZHYt?=
 =?us-ascii?Q?l3rWqLnZH+CbDSz7pBU36gEk7bbsvmKoOq32BSpOZ618pvbESYO0rds79J2b?=
 =?us-ascii?Q?RHmbNO8Xx+vRmKkpDWoGcakm7Hu++14LI3/j0g0S5uxxts2FGKgicy71OJLW?=
 =?us-ascii?Q?ndHPRf8y0d85DsN7eGbETbCLlAx7RhFGzmOwuXAI/sGJL/eKWqE5BwwRG2ML?=
 =?us-ascii?Q?63TunY/LjFpnTwiOkpLH7p+R6hcfE7kcvPU/awGUQGb3lcSr0fToe7+DZRv7?=
 =?us-ascii?Q?KIboGOBTrW68QJMfMn2N2FBtC7E3FkqJK1EAi4XAvpG8fvOTn6wCeK+boXZa?=
 =?us-ascii?Q?+tUG/7VOuZrPPMOGuGzQoWQzeDmD1FQ2bxtWiCNIN2imi9GckGRRux/MbIc8?=
 =?us-ascii?Q?KptZ3dNRv5cM7BTrCiehxp9hL5b56krfss98gVDxG+P5S+br62g2Ooy2UHGm?=
 =?us-ascii?Q?Tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 95f11c2c-b933-4f6f-78bd-08ddf2025c91
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 13:43:31.5476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rBknXGD3NoBZhL0w0nbM0DRIQgKovlrxoAmHMcZLKqLHAxpsFyefzds0xOJsorfXER+siAADo/P0TK7R7wUmiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6618
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

On Fri, Sep 12, 2025 at 12:33:46AM -0500, Lucas De Marchi wrote:
> On Thu, Sep 11, 2025 at 05:20:25PM -0400, Rodrigo Vivi wrote:
> > Fix this:
> > 
> > ======================================================
> > WARNING: possible circular locking dependency detected
> > 6.17.0-rc4-lgci-xe-xe-pw-153723v2+ #1 Tainted: G S   U
> > ------------------------------------------------------
> > xe_pm/11324 is trying to acquire lock:
> > ffff8881085f22a0 (&pc->freq_lock){+.+.}-{3:3}, at:
> > 		  xe_guc_pc_start+0x39f/0xf70 [xe]
> > 
> > but task is already holding lock:
> > 
> > ffffffffa1020420 (xe_rpm_nod3cold_map){+.+.}-{0:0}, at:
> > 		  xe_rpm_lockmap_acquire+0x1a/0x70 [xe]
> > 
> > which lock already depends on the new lock.
> > 
> > Possible unsafe locking scenario:
> >      CPU0                    CPU1
> >      ----                    ----
> > lock(xe_rpm_nod3cold_map);
> >                              lock(&pc->freq_lock);
> >                              lock(xe_rpm_nod3cold_map);
> > lock(&pc->freq_lock);
> > 
> > Reported-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Closes: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-8/igt@xe_pm@s2idle-d3hot-basic-exec.html#dmesg-warnings335
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6122

Much better, thank you!
I removed the other one while merging it.

> 
> ?
> 
> thanks
> Lucas De Marchi
> 
> > Fixes: 60d2b7899142 ("drm/xe/guc: Add SLPC power profile interface")
> > Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_gt_freq.c | 2 ++
> > drivers/gpu/drm/xe/xe_guc_pc.c  | 2 +-
> > 2 files changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
> > index 781e4890fb26..4ff1b6b58d6b 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_freq.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
> > @@ -246,7 +246,9 @@ static ssize_t power_profile_store(struct kobject *kobj,
> > 	struct xe_guc_pc *pc = dev_to_pc(dev);
> > 	int err;
> > 
> > +	xe_pm_runtime_get(dev_to_xe(dev));
> > 	err = xe_guc_pc_set_power_profile(pc, buff);
> > +	xe_pm_runtime_put(dev_to_xe(dev));
> > 
> > 	return err ?: count;
> > }
> > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> > index 68a5bf8e3946..53fdf59524c4 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> > @@ -1215,7 +1215,7 @@ int xe_guc_pc_set_power_profile(struct xe_guc_pc *pc, const char *buf)
> > 		return -EINVAL;
> > 
> > 	guard(mutex)(&pc->freq_lock);
> > -	xe_pm_runtime_get(pc_to_xe(pc));
> > +	xe_pm_runtime_get_noresume(pc_to_xe(pc));
> > 
> > 	ret = pc_action_set_param(pc,
> > 				  SLPC_PARAM_POWER_PROFILE,
> > -- 
> > 2.51.0
> > 
