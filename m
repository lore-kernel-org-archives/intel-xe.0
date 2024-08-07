Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA07FC3DA7F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 05:47:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E9B310E0ED;
	Wed,  7 Aug 2024 05:47:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OmxFPcU4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DEF710E0ED
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Aug 2024 05:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723009670; x=1754545670;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6Uhx3EhBFUNu0WG8++OCTuCJWoTnn3Ic0fd2g4UUnm4=;
 b=OmxFPcU4f6xU3ltsW0dPaR91zcRJb+PGZwaO9NDHURQCkYtGHu5tE7yh
 0YdPvOpM2am1wwQ0WXE3U/6Bgligomtt/KezvbV/wqoC8GEECr+AlOhLc
 e1EOHjZtJctvKVYaC+jbSy16TQM2UpggloLReCk3QzRz5uqyTlxlOR9L7
 jg+AIGr/+BIcVmq4uKa9Q/lBOAafI7V1EH2WcjOKjUYeRrtLKN9HOmGyM
 /ZicY6xMgz+aa4bivPyeLvt+NvfVas+GV0pC6qbfW46C2PtkirKWF0nC9
 UyW8DM2xepRWE31wtxEijOiHXA5PgXUUhPmxTKKcD6jrUxPGN5Fnha0/j Q==;
X-CSE-ConnectionGUID: EhCiqFo7RtqSUymt7qqOuA==
X-CSE-MsgGUID: QLON0vR5QMKL3y7UgIbUsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="20917210"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; d="scan'208";a="20917210"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 22:47:49 -0700
X-CSE-ConnectionGUID: XHPfk25MRtqj3OK3capY8A==
X-CSE-MsgGUID: yhtoMlsbRTyuMC3Vs/0n+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; d="scan'208";a="57282606"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Aug 2024 22:47:49 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 6 Aug 2024 22:47:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 6 Aug 2024 22:47:47 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 6 Aug 2024 22:47:47 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 6 Aug 2024 22:47:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dDt+9+1JiTxjIEV3VrcI3Ju/h60et5Jf79+SdNLe0Bzap27vxYR/keL8WKZgNvdGDsFIJE5YsXk+c5DYF2q859MWIP9DwQznxr0263B+57i5U09qjns11g7o9kRUM0/cffgO9unZMbh4vVwIS56PQjsjMKCczm1+TmPCKndm71HIoKk88KmfXPnccy7d0VYYR7FXbxfOJRX6dv9Pc1fvxgeJsygSK6N7W0MkV8iNsjacp7qytqY1pKdoeNLBlN63iePTt5w1RUy/600pnUcfL2umemAq0zNQ78XoBlzMP4z20BaRuLtNvovG1svLIQTFn17XAkD1ISOFBfypcsLwNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IhE9hsDkYG3nhrjsXgBpCwOcCQLySnJU7PQp5/vdlOs=;
 b=Wl1rA5a/LK/HzgIZ/AedhP02QqmHcHux43D3HhtEiL6Cn0NDjXpAa2h+aN4bsygg5JQjm47IQax5FOzgwGr9DAj/cr3gfNro1JGmuxMerSsMJ1LoKR6LvT0l9IfUjiCa8t+xdeE56CtqB+GEpHh6hmUklUNeB2rRPpCMl7gHHAuD9VvVR+0jN1D8eVlE6/qMPiTIMgI1RE+VqxISa7CGzHgQuFUczIUzycLfuCIVTzoJQ2pPahnZ4ICjgEuhcnrLVbKCgoYK47+SozUXtywdsuGKN/9Rv+KcvS+3lzm6tYBJQ8lJkCpExm70CNvtD+lveD2ARic5MvoB1oh8SFGVSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SJ1PR11MB6155.namprd11.prod.outlook.com (2603:10b6:a03:45e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.28; Wed, 7 Aug
 2024 05:47:43 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 05:47:43 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Das, Nirmoy" <nirmoy.das@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Das, Nirmoy" <nirmoy.das@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: RE: [PATCH 2/2] drm/xe: Add stats for tlb invalidation count
Thread-Topic: [PATCH 2/2] drm/xe: Add stats for tlb invalidation count
Thread-Index: AQHa6Dt4ApXYAxeQkEWqcD0Uw/yOqrIbSZaQ
Date: Wed, 7 Aug 2024 05:47:43 +0000
Message-ID: <SJ1PR11MB6204957D8FAC83421E7F3FD481B82@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240806194510.13044-1-nirmoy.das@intel.com>
 <20240806194510.13044-2-nirmoy.das@intel.com>
In-Reply-To: <20240806194510.13044-2-nirmoy.das@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SJ1PR11MB6155:EE_
x-ms-office365-filtering-correlation-id: f71abe84-02d0-47d7-3b94-08dcb6a474d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?EPipqncIfQPuuGnbU+Jn30zggJ+TBeAiyWTwmT4yHce4Z/8zTr5uCXNPjqBY?=
 =?us-ascii?Q?YqrNRN71gl8ejk0b9szKSzjXWRp8MHNu8K+bAs8gfqvokuVld9koIm93mKnx?=
 =?us-ascii?Q?0aGgbyJQ/MbD6HQu9aCliswrqFP/OgoibrPKfqfnJnJSxOeOZYcMg5TijSVo?=
 =?us-ascii?Q?8zOGm4x8fra8ab8IxZmhDOD4Hy20HojeEJRgPotn3Hm8VKybiEMdidpRtHyS?=
 =?us-ascii?Q?xe3N43/WbCJVgnpxcR597Fw4jwaegvMo90LTi5yifO4gDVUGH84B9TulNNuQ?=
 =?us-ascii?Q?mcgXBsE6b166e6ovj6R3ETa7O5J9B/xTc6M2LMr5PPeG/X4hbxsLENSxMnO7?=
 =?us-ascii?Q?2WDYYIylfc1EbXCRoDhoJyoAosTBfRtidQnllvBWpwd6ayztx5eq9BP5I865?=
 =?us-ascii?Q?GzoSRjxGrw5OA7RC4Gas+ZZ/coLzGQHv7MCq89l6yfoTbiZLY46VDpR/6XaD?=
 =?us-ascii?Q?OMy2aMMKOmqzs09z15Apw0azzerxjAcwYS8mtDd/2Rv0C9vuNwTZs1KXOizS?=
 =?us-ascii?Q?vazQgoFXEXwP0Qw3Uq1DrjfaFmrdY412olLJuVfLNoaD3TYaNB4u/98kUEK+?=
 =?us-ascii?Q?3RG6VuCiaAbkqafOdkNZgOdxzo/mmgnimGgqD4PTIeZWYXEm2c0+ls8rC1w4?=
 =?us-ascii?Q?5BeIuKiA9C2p5NalZruwe8Oj1cPD69eAydDMUQXWsZ4bZeP6bVEcReyaleZp?=
 =?us-ascii?Q?9yVmLSDM63icBb6nuC6ho7MKu2VO/bLjSuivcsXlwPc8KDanDSQiCX8iqS8j?=
 =?us-ascii?Q?gUASqQs/2PdcsiIEmyh9Q7xQ0dqCmsHGEp5RlKp7cPP9G/OA84Y46+I5yZKx?=
 =?us-ascii?Q?tB52mDCGz6qdLYwvS+BEZNqZHi1x3sks4GJWCKJPTKwaPgyvE7Kn5Tv4JuFY?=
 =?us-ascii?Q?jSFTxAS8jDSo88vlT3Uk8N4Lp7vHbATpaxtNCrzMn2rNfemnc6dX6OIjWAZo?=
 =?us-ascii?Q?lWcZmmB6OUQvQWAPM5o9eeudurEaYUfR0BZ8REX0ChOs8iFMl7evcEYZDBJI?=
 =?us-ascii?Q?s6e0KFlX/rT/0KcMzOGu10essFrSyqzBC3Rz7D/ql5a1zqNK0OOvWiJ+/213?=
 =?us-ascii?Q?BowhLAR2jJ8nCX8Y2bIb6j3Mcw37FE7KSYwHlWrn0pGQCbIx0k7On3VwW+sh?=
 =?us-ascii?Q?vS1Cg9uKVU2kmNDj468NQGEPVzKcIaVVA9Qtc3NFYYBDOMdkY09ukgIrtLDj?=
 =?us-ascii?Q?XSJI7d9nkk/PfZGcY0ACAW0fRKa4JxlF7avzj+GsJ4GWNbI/4fjXA3/V+OP9?=
 =?us-ascii?Q?5RhW5cVmuGPargNTS3N7s0oTOYmGrjinlUhiwym9VVd4mFlrlFbZtJFw8pWV?=
 =?us-ascii?Q?hXeStwP2a9QnJM3H+OBtMNKF2wYx+hQTip3/h23RffmbUHqmrXEK6vb8kH3o?=
 =?us-ascii?Q?Xj7X+AmWWENjInFWgaSioJRtuLXMjy0TJNn1iSqYchi1epZ0KA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BDbtoAFXfSHUvG1uSk7LLnhgVOYkKc2ZX/whQ4ePbEKTx6Kn68h+Mfw/zFI9?=
 =?us-ascii?Q?Ld5woPDriegXzl+miZ3M7MHmPGzyQG6BE3GaZGrjrKAl266QpHw7+pJDhDK/?=
 =?us-ascii?Q?WSpE7Vh6s/3o7ZgZdBn/csMqOogTbDLBqEy/nAHhbY2iVOF7yGZrFBalP8TM?=
 =?us-ascii?Q?Whz94Bs1t4P7mWwCYnsIfK5NhtHFN0hgXkb3+PRm8X/fc97YzEYR2NGYtEdB?=
 =?us-ascii?Q?9C0d9RQZCiFbqQ8UOj+if/lpsQKwhXEQo0KHz8618s0vonP6C6q28iK1wOKE?=
 =?us-ascii?Q?9vvqLbe9KIFgX72uC+jdqMQ4Cs7zrea2wptdWNOr/wV/HNk2agdM+jnvaY8F?=
 =?us-ascii?Q?RHFfIO5tgdl7zvIAkHa0HFKpnbH9OAsSLVGD1Gb3S5khC2NFJfysWs4ain6M?=
 =?us-ascii?Q?UtHucnMudi/xm27sLQapWUbEW+iFuH2mz9DDRyV0m1+4r2xLvppEW2azpMHy?=
 =?us-ascii?Q?I2IyqH2MlrbbN4WiEwd1e8TVJSaLBOZOgDrFUn11Us4MrMy0WOs1F7KXV4Bo?=
 =?us-ascii?Q?WXi35tCL2NNcpDb39yBezpaeSEbXEKqAalxSQciGNZucPhW+xuvjtLg1UQYr?=
 =?us-ascii?Q?ZRLXD1hVZD4jfBYGhZPzYssQjUXO2KBuT4mUu8oVuQoSOjcmgBxcJGTzj24n?=
 =?us-ascii?Q?ETYV7xXw+wW3zWHidsnPteovpD6ugDXY5js51wajI+2GpHHV7Jh0RRu3IuJn?=
 =?us-ascii?Q?m0/9ddWE2ff3NrzSXHRGgs0pZgdch3rEUPk9Tg+3ypM/6a4rMpvP/9khMuYr?=
 =?us-ascii?Q?G6RGKUJnZ/iuZmQTn42ui6XdvGZgElPEtgaS0xNSrS4yWkCAUleV4XYXg20V?=
 =?us-ascii?Q?sLBDxM2acC43KlKPpeQv2YIBL7D6xItY6ES+suGP03RyTCOpdv7S6BT9ich9?=
 =?us-ascii?Q?bUV1Q1F9Wpg+xvsgbW4M0Gn9Ky6V7m92zv6bUOKefRzK8gT97IK7Y8pY7kuo?=
 =?us-ascii?Q?UOs7YiFsKzLgD+jNcGCdap/jvHlL72mqGpEbZLgg9HuVb6fgV3Cc/50iJQ55?=
 =?us-ascii?Q?GteJSScAb+Jb1X18v5dPFaTUOAUUz1S9SXa9TYjhh8E+OiVqpsSoQA2mm1/n?=
 =?us-ascii?Q?5pTAsqHrsNZgzLikQaHgAx22EwSwwsMH/VHEvxecj9FiwkXjdllzhI8CEqZ9?=
 =?us-ascii?Q?Wz0V6lVh7y/a0sxUb+eiA6DEz8S0/qbF+MPDag5FyuB3PXSuMMrOZ7UvGgr2?=
 =?us-ascii?Q?N6rMMXnlSCg1ebMhKYJTkyTlUebGo/TCpczgsVInv3Ko3atwCB5ztSDPfF9W?=
 =?us-ascii?Q?uImtzhk1c6TkX81ugHtTn/tU48FVkE8p4G4KDfyaw4p+FrfD5ZvJnbQ697J2?=
 =?us-ascii?Q?oW4sM5VRZyqB+1KMdf2DRUsvLvxIGbvFBlE6O2znmF9pMLVr0e95oBYH0kBM?=
 =?us-ascii?Q?Z3JNdLROl+mzZUWEAJcEh/raWUYim3Y1RZCRTQ24IULFfGz+sQCCVMTHPttU?=
 =?us-ascii?Q?eIQaeohCaO90ZiitjktRbHII5x5JeApZp1v6K0NmkTWYsoz848jW/uPQXHc4?=
 =?us-ascii?Q?NAW+x8kZCS1wZGf8AXm0FKcGCnX7BBWq+hSe5xd334qoNYe6q4k3zhNxgarH?=
 =?us-ascii?Q?D26MgxrT3T4AHRnWEC2nGqWwbByB/HIp+iQdp8Gk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f71abe84-02d0-47d7-3b94-08dcb6a474d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2024 05:47:43.0238 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SgS6I5HqHAbwP6G8n8rRzwRjRYR5636hUc/umgIumVGgeREu1lAr43gzRiU0twwaSRDPz6jWOPkMzVy2KSR0euYYpvQcBVpvmbSPC4rUzk8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6155
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Nirm=
oy
> Das
> Sent: Wednesday, August 7, 2024 1:15 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Das, Nirmoy <nirmoy.das@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>; Wajdeczko, Michal
> <Michal.Wajdeczko@intel.com>
> Subject: [PATCH 2/2] drm/xe: Add stats for tlb invalidation count
>=20
> Add stats for tlb invalidadtion count which can be viewed with per GT sta=
t
> debugfs file.
>=20
> Example output:
> cat /sys/kernel/debug/dri/0/gt0/stats
> tlb_inval_count: 22
>=20
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_stats.c            | 1 +
>  drivers/gpu/drm/xe/xe_gt_stats.h            | 1 +
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 2 ++
>  3 files changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c
> b/drivers/gpu/drm/xe/xe_gt_stats.c
> index cc69d748e8f6..adb5a9aa6bd3 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> @@ -15,6 +15,7 @@ void xe_gt_stats_incr(struct xe_gt *gt, enum
> xe_gt_counter_stats id, int incr)  }
>=20
>  static const char *const stat_description[] =3D {
> +	"tlb_inval_count",
>  };
>=20
>  int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p) diff=
 --git
> a/drivers/gpu/drm/xe/xe_gt_stats.h b/drivers/gpu/drm/xe/xe_gt_stats.h
> index e83155ab1fdb..11b8ed17f9d9 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats.h
> +++ b/drivers/gpu/drm/xe/xe_gt_stats.h
> @@ -12,6 +12,7 @@ struct xe_gt;
>  //struct drm_printer;
>=20
>  enum xe_gt_counter_stats {
> +	XE_GT_COUNTER_TLB_INVAL,
>  	XE_GT_COUNTER_STATS_NUM,
>  };
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 87cb76a8718c..e3cdb0e041af 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -16,6 +16,7 @@
>  #include "xe_pm.h"
>  #include "xe_sriov.h"
>  #include "xe_trace.h"
> +#include "xe_gt_stats.h"

nit: include alphabetical order=20

>  #include "regs/xe_guc_regs.h"
>=20
>  #define FENCE_STACK_BIT		DMA_FENCE_FLAG_USER_BITS
> @@ -213,6 +214,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>  			gt->tlb_invalidation.seqno =3D 1;
>  	}
>  	mutex_unlock(&guc->ct.lock);
> +	xe_gt_stats_incr(gt, XE_GT_COUNTER_TLB_INVAL, 1);

Apart from above nit, LGTM :
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

>=20
>  	return ret;
>  }
> --
> 2.42.0

