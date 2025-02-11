Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5156AC0219D
	for <intel-xe@archiver.kernel.org>; Tue, 11 Feb 2025 09:54:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD7210E63F;
	Tue, 11 Feb 2025 09:54:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P9PpCm7r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB6C10E647
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Feb 2025 09:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739267650; x=1770803650;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=m7L2izq/H7Ex2+X6aNgGtN/P12BH0fAdYkcmIUlgQJY=;
 b=P9PpCm7r8EB5ji/FUaWDGPz3WxSiRCU3dwgHWiaonfi5em2o77mBiHi7
 ZqNV4P6WctDSqxCPSNtUMGQ1/ceQJHaX3XqNgVYddMZ4rF05y3g8lNrrW
 zUNGE19FzPj9XwMqNT0YrnT6FqXU7bdaMxPvwNlRWXCwyDVjMYrv7dKJd
 5mNMIo5tqg9ow5hXbvW+7kEZtSd62WWbuS4BUFCBpFcYaQ5xgqjxK+lqk
 17XEiFSCly6+Smy2MMcbKTUIJkW9dsRKYUriHX2GQmcvQNERq60128Don
 yKA2ZQjYZ3F7v08HlXJdfeVJDCWeFWLCs38S2nsji3ROgCROrB1Opp6dY A==;
X-CSE-ConnectionGUID: 6BLCtJPCRie9tGpSro6Kkw==
X-CSE-MsgGUID: fpcRC6dFR3irPLvIF8YnFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39898278"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; d="scan'208";a="39898278"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 01:54:09 -0800
X-CSE-ConnectionGUID: v4d6JCtDQwC3bPQ9R62fVQ==
X-CSE-MsgGUID: alBGDcaTTm2fDuOEPnz/cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112929035"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Feb 2025 01:54:09 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 01:54:08 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 01:54:08 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 01:54:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=na6NEDQB1BosK6YHezIFch+A3l6SAt/zGlohlKgQgapJI2dG/tC283mO1AVNcdczlH628rNpOiWFbsgx8CRhudPMZ+1eWZ+m0LSpfPjHL2SoWUvXKAF102kdIaHqWLtFpkVBhTUar3hU1tEahf6+Cc3ZmBlPlWkh1WRB12UTLNCl9Z6n/Pbq6QwAJiky0NtF33Qd7B4T3w/HN4BxMzBFpfbfN7wT3i5b/nTETvqOSjAXsKHedAhO1ZBDSJX8rid3QZ3ZxVnATjxzKu3e2UfZ8CQqtbl2Co5z5vvjzkyh63HqgN0Lr5kJhhCb76LzS2u6XZK5EGhh8K7tJSLPQfk6hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qk0pkYfCQySxdMMG3Ey7f53KTqVTRrAZXtGk4f4W4h8=;
 b=Nir9ZN1eP+ZDqq6kKrpoCAFt9KBKanr4G6F0DakkXWGkHP2BSgOuTRmotDwDCmkXoS2IuTOfdWxYA0JLQjIpkiaPp61uulG4En3KyI/U/R4VkEatNx7bbEiq9ocJVt34iEZCFILibmyFqtSvEnuN7MsKRez1uHNaeKHUFiGed+9+0dweGvn6+YgxSBGwCw5p38CQ9SR+rHp7/YqiETFLYXHvf7iFZcqCvP01YTyhT6exOIH648mHiSYpHKE4gosNYx+T6hWbEp62zL3CgOQGVjlrDFvBA6WpcgDgZl6EaQDNqdgG3d3gw7UBl2IpuRL7sTzQWK0HKRFIKeGg9yAaig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by BL1PR11MB5240.namprd11.prod.outlook.com (2603:10b6:208:30a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Tue, 11 Feb
 2025 09:53:58 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 09:53:58 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>
Subject: RE: [PATCH] drm/xe/guc: Escalate GuC load failure immediately
Thread-Topic: [PATCH] drm/xe/guc: Escalate GuC load failure immediately
Thread-Index: AQHbfB6KJmoRFqPpBUmo/4sJ8pALxrNB3PNQ
Date: Tue, 11 Feb 2025 09:53:58 +0000
Message-ID: <SJ1PR11MB6204F3EF51FC309DADA9782B81FD2@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250211004702.1872837-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250211004702.1872837-1-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|BL1PR11MB5240:EE_
x-ms-office365-filtering-correlation-id: 37aa0ad3-1e4d-46a9-46a4-08dd4a820161
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?nz/wmcjGfk8qI0J/auHXrGHlh6Medj0t7mWd82R3V+iBBb1hu2kvpMNGEtU+?=
 =?us-ascii?Q?AwubdBSSSfOoVkylcdFT7ULAaIgtdzgkgVp7LUEWggtPmz181tztAV/MADLU?=
 =?us-ascii?Q?k9FHlVRakIPsc/8h5dYLQxH/ppXccmYiLvfhi1miQefgE1msPodC2d6a7TGg?=
 =?us-ascii?Q?947roAvNSiI3WhPHuBnhRrMIPZ35S+DaaT3Pa797NnmA6ntcVGTQAxIvqJMQ?=
 =?us-ascii?Q?BrRaFeAfsk2PHMUMV58sYgcw138TRyM0xTZlKScW/Ct1dW3EwulnOFej3JE4?=
 =?us-ascii?Q?2JJZcv08swL7UjUjSs/xk1qr10ovv3buJRUZBJq6+aVOtaR6/5fdMTwrSASR?=
 =?us-ascii?Q?5YPU2pxW14IBsqfljeg5waF4KjI6XmxAaBK+uLnMbulx06iuMAJ6LLfNnB6C?=
 =?us-ascii?Q?gvLZTL2NVObpz2G8+sjA8J4igd6dXZHdYuGKlnJUOTxo+7MNfg3eZKFL78/j?=
 =?us-ascii?Q?nArxKxG5BHwKkmDKV18V/p9tGib5YDoVBtXg7pwH+lj22ph56reWqekd39K1?=
 =?us-ascii?Q?JakUtC5NUAEUjNkdsBw6Okxj884flaTKbUS0fTVq8PbHA6SISzoBp+P5jysj?=
 =?us-ascii?Q?J7TwrUct0lLNYQDNkMmsjQWEDaI+Zu/p2pvZnNcIPD4Iq+Hvuo2ib37aWfVp?=
 =?us-ascii?Q?DkJvoXy4EoOB7cx3sxvSBzbkyFyJuiMRgqbM81o4juJ/GqDxz46a3x/huA5U?=
 =?us-ascii?Q?bXedWHs6DgezyVSNeluJz21k4RcFEtXJcJPeog7DYG2OO7D+k2Kgpy3oUM+H?=
 =?us-ascii?Q?lpzaciAPsfykQ/Wwz4K/k1JWjHpy67YlFCTgSrkhyBWbU7UEkU1CxtRvowXs?=
 =?us-ascii?Q?bdRyeIlVy08qgow0fHFdVqK19xtVkFwVLvk7Foej6JssG8ND2Orx5Jqgd0sV?=
 =?us-ascii?Q?oWdz2vgL6wJZMhe31CZDWNl+fhlKGQnrZzxDX8YEj8Kewk+XLsMgCWxSTmWb?=
 =?us-ascii?Q?R8octwibif5GhNxwFR8PvD8mZIZl+UHqqQrhiFB1Z3boRj4RHxbeCKK+aj4z?=
 =?us-ascii?Q?uK388OgTNaf+2wvJb1+L0oPYAu43NdFT4u5BnaNOc/WTXgqoiBFmemfy95Zj?=
 =?us-ascii?Q?4t2hh7eDvFzhNY2ABFkcFZyFSPvadUWKKyi1+0YLPe7Cqq+sKpD+I66ikt0Q?=
 =?us-ascii?Q?Xx2YjU7nZ/Db/+HxivbED8PTvbs9PRBk/ruQJuYGMVfEwdTomBV8WC2EmhNE?=
 =?us-ascii?Q?3PZmYiXiqS2w7LQl1IwgeCbrA/3NVon7c+1BtU600Zl4h7mOg/wk9fMQ68fw?=
 =?us-ascii?Q?aGyALNCrxv3wpLE/08DjL4guKGZJp4f0LMpc5XG/0hmrdhpUscAiqqNHqdGJ?=
 =?us-ascii?Q?s4RCfr/a1QCHJY/tB6aKSltMOa3EgibbIDF8mAeLZ2p2d+GL7WSJ9oorP2Z+?=
 =?us-ascii?Q?hVgRAVRqjLt0IuUlobXwr5lYMXowYShDGCegjhiwIcrznAWmg487Ovo5Xyn8?=
 =?us-ascii?Q?rQwktp/zVFygmQlBgXjv50NH3Em6Enu1?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fv8rSRIHAlVATpPKcXKIp3JtPG9mn3jXUMtJney92NCPCFrZhgmud6cCt+7G?=
 =?us-ascii?Q?nrTlR/imwsIpSvuJdOhrja2YYHII97PUXBuV88RaKa9CVC4Qc1sNdaWtNGOF?=
 =?us-ascii?Q?MPxBmjtCqPaQrvg5He55lv74mN0CHLVTidd8lQjCVP2eizo4ZVXjwp8Qke1v?=
 =?us-ascii?Q?NO780IH71Wk8knc/OGDnxBVIA+XcSAYmMjm8Uyi2yfUDB9Z/wTUcGglGBqht?=
 =?us-ascii?Q?reryo6zNVlgnzRQfX5gtfg2Gisel2ApS7LrTjoa/ze2KOJVYxUH7IEmQjWpR?=
 =?us-ascii?Q?Gt++u6YReOWdrOM90KyUNeyxn11HPebta4EmSWSErIZChGD1SG1/PsbNVWZf?=
 =?us-ascii?Q?g2wPPtdXW25iTGJX//Lo5wj9KJFHfEj13G3gRNcKdp3boOacEPUW5W6zqvPn?=
 =?us-ascii?Q?ur+HUj65pz0Vkq+B43PYQjW3DIkP7pVRcjfys3VR3DIS6YmjUQ5qiuiQfAfn?=
 =?us-ascii?Q?JvqUjGsL4XEaDFYKcS1F3qkGxs4QjAdfj4n/ubHVi+mKojsj4MDcRq/9Tay1?=
 =?us-ascii?Q?b8sOiwCYRZAI2A22gESAzKqZAaz6VLcnXmQOaLh8kT8w08Jjbk0zwQGPY9VR?=
 =?us-ascii?Q?6QFms88xF/R5NBO+HwTemN6VMe9J4wIp/ZpYBiDU1rBFCIybL8KJGuTikuws?=
 =?us-ascii?Q?5nYvM92lf7aC36FiKkYkB4kWUVZHQa/mllHZvjpXVMVMcgxLwUh0sndCTZBq?=
 =?us-ascii?Q?e6gjwZ0+YDWW1lwGh5NlDm5gh23ROhzmKpbcdRKY0oZXp7X6Ils4J6AwFrw4?=
 =?us-ascii?Q?c7iE2/77LvbYP5kXZGudKXTX/kojMNnowGtMEoKFMO6gGZh8muBMOlA5w2tu?=
 =?us-ascii?Q?66qOY5Shc8vM4keNOB6tb+Vofj1LlNmvL8vt0akSqK2ndjlJmHEvp3RB0zIY?=
 =?us-ascii?Q?rAvBF3zZ5yuFUXejP1uRjjPQiL1oQQbmTVpCXMgWA/AkzZ5qqmHLtVbanMqV?=
 =?us-ascii?Q?hOCile8YyIVx3AO1IVfNLgL/leQPUgJcJ2DvyNg/soBrqbCFZwGe6nRO3HoY?=
 =?us-ascii?Q?op2Sdp10j69F8XxLqfFZ4jCoJPuOLyEb3le2uTnRf+MrgZgq1KOIxeDMQQpM?=
 =?us-ascii?Q?HoYaswmZ9EZOKeefwK0R/Scx4aZ0kwSmLZKaZ6rmknn6cszL9nOuRXI9phOn?=
 =?us-ascii?Q?Zo4b1wm5TovKkn7POe/5pM6gPaiUsj9XtfQZbkhoAgLEo4ZTetaGpS3ERKiG?=
 =?us-ascii?Q?svoDh6VasLMz43iWPh7KQU2N3B/3Mb4kaWSUFWFJ6Le/IGmKf4pwxHlW4npV?=
 =?us-ascii?Q?0UnJZLQh/eb87mhFpuwtLy7nMUyvBdtHTHxaR0p+6yzlo/e5Ade8qoV85KsS?=
 =?us-ascii?Q?zeNeFyFNViGKmhMAhxWYehp8V3SZEiQiMq+0GHb7Lgx0TpnvkMzposx3HfcW?=
 =?us-ascii?Q?ML2Mv6xTBf6lc2HwROQx7bRVGFxgTPEx9a3AMv39ptg1nsXSuGh6VtLgWgff?=
 =?us-ascii?Q?UuBX4k/A5YgJEXTJ4XlKZLXull681elRn/iIjK6zQ6omVM9dPx3pZ7tQ2pM3?=
 =?us-ascii?Q?OMJf/0c/pDj+51g9/aA6b8U4/R1+BcORYRPEvWAqYy5rQqvrDy70JbwipFvf?=
 =?us-ascii?Q?koyqEbdan/FZIM8CHHqCBPaYS45WiMicbhnfrkRY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37aa0ad3-1e4d-46a9-46a4-08dd4a820161
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 09:53:58.5256 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LeNuKpkng6QshX44NbPrKW5tibk+AJDrQA2APLEel6y8dIpu9d6q8hNea2M69sCI+VhdZhVp6fxRFZA82i1a3Weu941uhNWJ4VLKbxWnvkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5240
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



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Dani=
ele
> Ceraolo Spurio
> Sent: Tuesday, February 11, 2025 6:17 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>; Brost,
> Matthew <matthew.brost@intel.com>; Harrison, John C
> <john.c.harrison@intel.com>
> Subject: [PATCH] drm/xe/guc: Escalate GuC load failure immediately
>=20
> When the Xe was first introduced, we intentionally avoided escalating GuC
> load failures, to not abort mid-probe. Xe is now mature enough and we
> gracefully handle probe failures, so we can start escalating immediately.
>=20
> Note that even without this patch the probe is still aborted because the
> attempt to enable CTs after GuC load will fail and that failure is alread=
y
> escalated.
>=20
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c in=
dex
> 1619c0a52db9..13c3084c42c2 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -938,7 +938,7 @@ static s32 guc_pc_get_cur_freq(struct xe_guc_pc
> *guc_pc)  #endif
>  #define GUC_LOAD_TIME_WARN_MS      200
>=20
> -static void guc_wait_ucode(struct xe_guc *guc)
> +static int guc_wait_ucode(struct xe_guc *guc)
>  {
>  	struct xe_gt *gt =3D guc_to_gt(guc);
>  	struct xe_mmio *mmio =3D &gt->mmio;
> @@ -1045,6 +1045,8 @@ static void guc_wait_ucode(struct xe_guc *guc)
>  			  delta_ms, xe_guc_pc_get_act_freq(guc_pc),
> guc_pc_get_cur_freq(guc_pc),
>  			  before_freq, status, count);
>  	}
> +
> +	return load_done ? 0 : -EIO;

Do you see possibility of load_done to be -1 and you will return success he=
re?

Tejas
>  }
>=20
>  static int __xe_guc_upload(struct xe_guc *guc) @@ -1077,14 +1079,16 @@
> static int __xe_guc_upload(struct xe_guc *guc)
>  		goto out;
>=20
>  	/* Wait for authentication */
> -	guc_wait_ucode(guc);
> +	ret =3D guc_wait_ucode(guc);
> +	if (ret)
> +		goto out;
>=20
>  	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_RUNNING);
>  	return 0;
>=20
>  out:
>  	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOAD_FAIL);
> -	return 0	/* FIXME: ret, don't want to stop load currently */;
> +	return ret;
>  }
>=20
>  static int vf_guc_min_load_for_hwconfig(struct xe_guc *guc)
> --
> 2.43.0

