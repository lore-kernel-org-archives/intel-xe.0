Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC757C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu, 22 Aug 2024 22:27:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B584F10E0FD;
	Thu, 22 Aug 2024 22:27:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cbwDsyEZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A02F10E0FD
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Aug 2024 22:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724365659; x=1755901659;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fGZ/wVzgLxX0UzmOoQLjHLBEgHnuiboKQ2h+82U47L8=;
 b=cbwDsyEZTqCpFX6Ka1AYopgpXXDFmWUu7THVIi26o83LCbAhe0BPI33v
 CIytpdP9R0tkt69PFTntA3SBdWUJDS4BjdTGvd3vdEOOW7iSPoFfq4UXI
 Ii1/HXdEkOuEzqnFJJ7+lgiuB8FhAhkm1yPsonrdIN5f42f9PbCX5ZXqC
 pSWVkfLRyquEOtacRgSaTTYVn6RZgyUyfWgQ/xl7zuL9D1/1xsqArlTv9
 f4Ue68/LX0kwAMClwqmwuRjjzcXaoAzb2kwB0f3pjbqxp6v5alAQLAxfj
 Ru1pxfbkLFOkwRmEGroGww+fqbjr0vZfGGyeR2NM4kd0hpZC3SbmQV84f g==;
X-CSE-ConnectionGUID: 33cqpw3rQ0WsaXkXU/eySA==
X-CSE-MsgGUID: dLhcF8PlT82xtu7JxbV7cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="25710076"
X-IronPort-AV: E=Sophos;i="6.10,168,1719903600"; d="scan'208";a="25710076"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 15:27:39 -0700
X-CSE-ConnectionGUID: 5Vb+8yaNSbOHLTEJtq9xPQ==
X-CSE-MsgGUID: DOUY+94XS7yDEgsT1xDLkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,168,1719903600"; d="scan'208";a="61577971"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Aug 2024 15:27:39 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 15:27:37 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 22 Aug 2024 15:27:37 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 22 Aug 2024 15:27:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HltnZJhoFF1L8vYL9dq3xJGhMLTolXMXts54dHqE/uCgZj6V0X0Q7w2g1nNqYk2NBM8D0BVIW61X2R29MKBzNEFJ/sJ2HBT2b/kXa84mkQhPaDD4HpMxm4Bt0A5OEO5rf992fdJA8ae4oUCcxP6ywWmvz0U+33EF7yGs4T8eNkHCifrpkUA5+zsueVbX7K/qYYmbu9xZVZHriqhF4FEFLMZ7X77O6XFwkM5TAKy4/y7yc9KBYIh+149j8bHbmntO7Vm8nfmNde+tBN77DoaNDi2FnRvWdkjEGWJy/xcX9feGtjKtpOSjdOwJb1fh775GCwJVjhM5kBE2/RhhJoa7XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5YmUs6dzSS+kFQFByI4Fjd/VSqBWm6Y6LXgFG6nANxg=;
 b=w02smWPu6YUvlhbPCiLyUSh/gIht99+2+SAJPj7+EGwVWxp2PA18wNxUd6lVO5Yj+h2T/n1XKgHGZQdi4otAA2d4B18SP2/PFCKCd4dSFurrdr3TSb75zOlSGJyl+6SIDuXldf9Zkv0tWcWYhFjLWF7JLnTr+ul0gAeY7AHhC8E7MOSg8mqgrBjA2CE59kriITVb+ndQDLF35ihqeujVfhLcTEuMypE0Q3hyIGdwaJRcq0ZIp1DoExFQW3JJYr3vfpXrto/EGJFFt2ccx2eA1H/3eT31zatHNJ17U4uxAkHG9lc49iAPAUGy4Z8FfzdSkK10maKvKVBh71XzSjpAiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH7PR11MB7480.namprd11.prod.outlook.com (2603:10b6:510:268::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Thu, 22 Aug
 2024 22:27:34 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 22:27:33 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Levi, Ilia" <ilia.levi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Levi, Ilia" <ilia.levi@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Elbaz, Koby" <koby.elbaz@intel.com>, "Avizrat,
 Yaron" <yaron.avizrat@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe: move the kernel lrc from hwe to execlist port
Thread-Topic: [PATCH] drm/xe: move the kernel lrc from hwe to execlist port
Thread-Index: AQHa9ILs6ds2M9d0wkWF91Le6Tg0obIz1A8A
Date: Thu, 22 Aug 2024 22:27:33 +0000
Message-ID: <CH0PR11MB5444DEFB6AD4E8BC6350C126E58F2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240822110252.1280706-1-ilia.levi@intel.com>
In-Reply-To: <20240822110252.1280706-1-ilia.levi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH7PR11MB7480:EE_
x-ms-office365-filtering-correlation-id: bcc17d86-7a1a-4890-f94c-08dcc2f99e4f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?uhcAKmfaISKF55K6lQicXzUzHcwd0HxjseA8curmd+0M/MhIpLzFfVZncdu1?=
 =?us-ascii?Q?NnGFlRuE3ig4mb7bSDfx3axIF3XXNXxnthZlyOfmfxs4NIeKzE4uJyBTdNRW?=
 =?us-ascii?Q?UjdEEBtOPHRagCYhDSdaAA4ZyruxFWwRO9PEn5ii+BLJago4cN06aUAsWLLg?=
 =?us-ascii?Q?UfjoBKIqiGA6bSYBt9PMGZhQRJOtVY/yJA7TonK5Nk/FzfIKW6m4riihww8o?=
 =?us-ascii?Q?/X76MZTsBuJ87vs2gh+/UjfK+wUzJk4AeTnhv3aFV6TgLX2iiuCxuFL6hFD0?=
 =?us-ascii?Q?Gag3wTAxC1WRzeSDh8NHMA8nencw6rrgCOjDegyrCvDz7cNYUXfcCvOLUmQA?=
 =?us-ascii?Q?zBwaP6yT8OjR5Q52hQmsbgaKvR41N4IZC2bBquOZtuZfisgFB8m33i9PdEbv?=
 =?us-ascii?Q?+0Okug8H/3fDOy8KJmlSMdXupDqiBOx+uujrw7Rlo2nk2i8zYWngFeAHgu/L?=
 =?us-ascii?Q?gvnmrLe3ZHnQTlRWRtseZ/SaPPpIuN8oLZ5cL3L1VWsoHB1+9eOElxxrWrVp?=
 =?us-ascii?Q?kw3XwVFoVm28NupjbLLTwFG1z2PZY2688yyYRLKYVjADV6azyC5WEIvbme/6?=
 =?us-ascii?Q?XTaQR7/X6s6mf80xRnoih63vQMDWEx5sfaor8su3qZjdUIsiemusIZfX/qQ0?=
 =?us-ascii?Q?L+OjHpXAf1yr1EpR+eUl5YVJcuXDHz3WnsPfZrbIF75bOkWxyJNStG00EldU?=
 =?us-ascii?Q?bPUz5a+przfm3I21KUG7MNuT6tJ0jCfjRcccb3mTbmMuIiy9UPkX46JDM8NO?=
 =?us-ascii?Q?PLzRSMHBoOsYtWVoHEYWjE+C07U1wMj2uHwlisruphd4liuLhWLPusB0NQu8?=
 =?us-ascii?Q?0sevRlvvHabYtaG7AzcLJ/nzgYgGclVmKnlPI9UT8qqllJfARCkGG8VNsaBB?=
 =?us-ascii?Q?P3fXXtaaHLcvQfEroVmsbDJxG4iqWYWFV5FlKp0ZwLeanGQJXb3QUaF+zwZl?=
 =?us-ascii?Q?k4Gh7MWyvS9SHZ6F0Si87Whmyhre4zwabiv6vnt33x40HijZJczlUaQcVsU6?=
 =?us-ascii?Q?OPdP6W9S4WNbFc3/CzBKru5dVNluN7U1k2VtljJPegzAngHB8u9jQXCknTgu?=
 =?us-ascii?Q?0rnEALmv0nHRq133d4DP3hL6aPkPAo4x3414tCliMoN4hYGaMPf0mxYawcmv?=
 =?us-ascii?Q?rF2HfHW1N0nTMPpV5iVsI3FMGKYODMKZp68DGbltmMOmrT9mkTa/NXneORSk?=
 =?us-ascii?Q?XVcXlyFh1YIN5xcPodH+nQyKws6BzCEK0Tg7jksfkuVTv7Iqh4AL90qn2YdJ?=
 =?us-ascii?Q?f1yUsoBXDZ8355hDOgaMGmCjs1GSPaKasMACH8UglhmlSmdJyDhxxNi+bcbO?=
 =?us-ascii?Q?mtrmnR7ImrrN8eDJxPSnVStE7qEkSxeZgCLy1I2EaghQGkHWZGjI/rAL/le4?=
 =?us-ascii?Q?x7f3rLmEEiTGjmlK5XXgRrv6Ruh4TfSKHLy/Td6JgPApPcUzrQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3zRAhqCKPPtCS0sA/kIHXa10oYJ6NA7Kklnztm3tdBp5w6hvuClSJmvN3fwH?=
 =?us-ascii?Q?Kl711x6QAgBvjDk8gnJZeZpykto9xt9DRB7M54RoZ/Yb8i7Afv9lwE4NHwza?=
 =?us-ascii?Q?JE4/KXnQQeL5lxOdjExbJGGPZ5KHiaIikZDnNmplR8McgH3o9dOvZQA15s5O?=
 =?us-ascii?Q?f2Vt0+IsZ61192lDZh0mTCYfxCU1aSh3x+7xCmzXE0reOmmqAAlAyAG5IMHx?=
 =?us-ascii?Q?f1I8XfdxnbrHy0i6C4+If37ebYerdlXV2gMPJK1rhAvFKHQbksiRioqE8gKT?=
 =?us-ascii?Q?ytuh1X6FGs44n7BJLFTFL/f+S6z7KA10r7EHLYR07LEmN4rKNbluZpAUpdzs?=
 =?us-ascii?Q?H4Rp9k8V8meem/XmYTwI5g+trcALg0yF4qqNeMUccepk8DZiBMqH46Yukf6+?=
 =?us-ascii?Q?Goc3E2Uhc7G216czG2uAQrQIMvKyNxy4z5A588jo9PRsCE6Q/NrPus9Mp9ym?=
 =?us-ascii?Q?tlKPmowGstJuTuEUYPHf0ReAp9qeIFZUwlvtJx/J5mNOifkutp0eegCWFQCk?=
 =?us-ascii?Q?TZDKXTpJO+oef6YYzf5F36GrhiABbNQqCVuDy4H7VXi0+5vOZyPB2TkRRAfS?=
 =?us-ascii?Q?N82k+X2JjY1eLs5vipEJKHqV6JjmGh5NM7JF5fvmm/jDLs+VCmV8GxEIZxoo?=
 =?us-ascii?Q?7k0dWAzvsxMd66QjDVFZfhHCPs+jKzLnjdJqeZGB0u2DJR+PAlL8lnU2PEGQ?=
 =?us-ascii?Q?TtnqxZx/+0SxGjGpzX6Q6y4Io0W66qSsa+RDteXgho/7U6M2js+WUYlvakdo?=
 =?us-ascii?Q?uNXaj4JZHVf1BNIUrkDWfjJMcuGPWCCNnVdcBVLXTPJBETiBnQtzfyL+4RpG?=
 =?us-ascii?Q?g2MjSzRElanzwGQKXmYlecg1RVFZYwd6NkP0E/IPjhfum1lENYLNGKz8RIho?=
 =?us-ascii?Q?3/m3/Cm1AauxX5ICZFSpsfR7SHI494o3SwhWaTRcJaGwf0c4yXLhg3c9mecB?=
 =?us-ascii?Q?IB/TI/9ZJzgJumIgU3mu9sx5CAIiXanASvZyfMolCg9oaGaCACNUTqFcmnFh?=
 =?us-ascii?Q?o3jjAszn26x2x6oX1yUOSAzbv5hIsq4mgvcTClA/nc4RSU1q2Y73UjN8zxS/?=
 =?us-ascii?Q?B3Lt8ZqJji2lYeFCETKRQXj+pFJO9CC9PS+5TnSgOOjoIA+hF20gkmUeMwhJ?=
 =?us-ascii?Q?h30F4YuTHc6jTlzzVkKkhJtRePl+haU3zdbYSLVa1h48IycIJwt2TsBzLsh5?=
 =?us-ascii?Q?oTeKzfSbL1dVETn24/UR2HRRSB5la8A0Og8k7sdbU+7cppqA88jp0Llbe2nh?=
 =?us-ascii?Q?LPDBG8TBxA/AfgTQNoytW0JBXJH8MZ6nlvvNMGELmkW41bxDpjZ4ExqkCDgb?=
 =?us-ascii?Q?nUTYWanvwppEkcHMvarLFMGEEFG7dIznKonpg25ZM8jH7RPJfumnu9PlBvi8?=
 =?us-ascii?Q?PSKXnyfRKiBRfzWZurt8XlVYIk6AqphJEBfdnjk7Hv+dvQlbD8vm5LMFAFEO?=
 =?us-ascii?Q?z483g/moPjVQ1GyeVyNc4WrHCQ/d+A1P3po5DVjOEG+CuzXDSNJdh/FAT/bV?=
 =?us-ascii?Q?c07DailgDRpixcm7kYZtMe/p5QlBql01VOtvUmwMGpds1VDJCKrdmmCxJgFU?=
 =?us-ascii?Q?9ve8nv5cW/bBOuC2NudWB++M7s+chP00iSLqwlpA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcc17d86-7a1a-4890-f94c-08dcc2f99e4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2024 22:27:33.8251 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UThVD47/J65ZZYwRiA0Kn/s2xh3CFPyiq/SbusnMHTMfQuyq+Cski+VRW11Dbx3UnVD5xcjYZ2LRmSYbUiMrDWY7E42r/CoUPOU3yBfiqBk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7480
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Ilia L=
evi
Sent: Thursday, August 22, 2024 4:03 AM
To: intel-xe@lists.freedesktop.org
Cc: Levi, Ilia <ilia.levi@intel.com>; Vishwanathapura, Niranjana <niranjana=
.vishwanathapura@intel.com>; Brost, Matthew <matthew.brost@intel.com>; Elba=
z, Koby <koby.elbaz@intel.com>; Avizrat, Yaron <yaron.avizrat@intel.com>
Subject: [PATCH] drm/xe: move the kernel lrc from hwe to execlist port
>=20
> The kernel lrc is used solely by the execlist infra.
> Move it to the execlist port struct and initialize it only when
> execlists are used.
>=20
> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_execlist.c        | 10 ++++++++--
>  drivers/gpu/drm/xe/xe_execlist_types.h  |  2 ++
>  drivers/gpu/drm/xe/xe_hw_engine.c       | 15 ++-------------
>  drivers/gpu/drm/xe/xe_hw_engine_types.h |  2 --
>  4 files changed, 12 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_exe=
clist.c
> index 7502e3486eaf..447c290cb02b 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -123,8 +123,8 @@ static void __xe_execlist_port_idle(struct xe_execlis=
t_port *port)
>  	if (!port->running_exl)
>  		return;
> =20
> -	xe_lrc_write_ring(port->hwe->kernel_lrc, noop, sizeof(noop));
> -	__start_lrc(port->hwe, port->hwe->kernel_lrc, 0);
> +	xe_lrc_write_ring(port->lrc, noop, sizeof(noop));
> +	__start_lrc(port->hwe, port->lrc, 0);
>  	port->running_exl =3D NULL;
>  }
> =20
> @@ -262,6 +262,10 @@ struct xe_execlist_port *xe_execlist_port_create(str=
uct xe_device *xe,
> =20
>  	port->hwe =3D hwe;
> =20
> +	port->lrc =3D xe_lrc_create(hwe, NULL, SZ_16K);
> +	if (IS_ERR(port->lrc))
> +		return ERR_PTR(PTR_ERR(port->lrc));

Nit:
I get that just returning port->lrc isn't possible because the compiler wou=
ld complain about
returning an incorrect data structure (xe_lrc vs xe_execlist_port), but sur=
ely there's a better
way of passing the error pointer forward?

Maybe it would look better if it was separated?

"""
	if (IS_ERR(port->lrc)) {
		int err =3D PTR_ERR(port->lrc);
		return ERR_PTR(err);
	}
"""

The only other alternatives I can think of would involve several large-scal=
e changes to
how xe_lrc_create works, so what you're already doing is probably the best =
option.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt


> +
>  	spin_lock_init(&port->lock);
>  	for (i =3D 0; i < ARRAY_SIZE(port->active); i++)
>  		INIT_LIST_HEAD(&port->active[i]);
> @@ -287,6 +291,8 @@ void xe_execlist_port_destroy(struct xe_execlist_port=
 *port)
>  	spin_lock_irq(&gt_to_xe(port->hwe->gt)->irq.lock);
>  	port->hwe->irq_handler =3D NULL;
>  	spin_unlock_irq(&gt_to_xe(port->hwe->gt)->irq.lock);
> +
> +	xe_lrc_put(port->lrc);
>  }
> =20
>  static struct dma_fence *
> diff --git a/drivers/gpu/drm/xe/xe_execlist_types.h b/drivers/gpu/drm/xe/=
xe_execlist_types.h
> index f94bbf4c53e4..415140936f11 100644
> --- a/drivers/gpu/drm/xe/xe_execlist_types.h
> +++ b/drivers/gpu/drm/xe/xe_execlist_types.h
> @@ -27,6 +27,8 @@ struct xe_execlist_port {
>  	struct xe_execlist_exec_queue *running_exl;
> =20
>  	struct timer_list irq_fail;
> +
> +	struct xe_lrc *lrc;
>  };
> =20
>  struct xe_execlist_exec_queue {
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw=
_engine.c
> index aa9b2b16a6e0..35273192895c 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -273,7 +273,6 @@ static void hw_engine_fini(struct drm_device *drm, vo=
id *arg)
> =20
>  	if (hwe->exl_port)
>  		xe_execlist_port_destroy(hwe->exl_port);
> -	xe_lrc_put(hwe->kernel_lrc);
> =20
>  	hwe->gt =3D NULL;
>  }
> @@ -558,21 +557,13 @@ static int hw_engine_init(struct xe_gt *gt, struct =
xe_hw_engine *hwe,
>  		goto err_name;
>  	}
> =20
> -	hwe->kernel_lrc =3D xe_lrc_create(hwe, NULL, SZ_16K);
> -	if (IS_ERR(hwe->kernel_lrc)) {
> -		err =3D PTR_ERR(hwe->kernel_lrc);
> -		goto err_hwsp;
> -	}
> -
>  	if (!xe_device_uc_enabled(xe)) {
>  		hwe->exl_port =3D xe_execlist_port_create(xe, hwe);
>  		if (IS_ERR(hwe->exl_port)) {
>  			err =3D PTR_ERR(hwe->exl_port);
> -			goto err_kernel_lrc;
> +			goto err_hwsp;
>  		}
> -	}
> -
> -	if (xe_device_uc_enabled(xe)) {
> +	} else {
>  		/* GSCCS has a special interrupt for reset */
>  		if (hwe->class =3D=3D XE_ENGINE_CLASS_OTHER)
>  			hwe->irq_handler =3D xe_gsc_hwe_irq_handler;
> @@ -587,8 +578,6 @@ static int hw_engine_init(struct xe_gt *gt, struct xe=
_hw_engine *hwe,
> =20
>  	return drmm_add_action_or_reset(&xe->drm, hw_engine_fini, hwe);
> =20
> -err_kernel_lrc:
> -	xe_lrc_put(hwe->kernel_lrc);
>  err_hwsp:
>  	xe_bo_unpin_map_no_vm(hwe->hwsp);
>  err_name:
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe=
/xe_hw_engine_types.h
> index 39f24012d0f4..8be6d420ece4 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -136,8 +136,6 @@ struct xe_hw_engine {
>  	enum xe_force_wake_domains domain;
>  	/** @hwsp: hardware status page buffer object */
>  	struct xe_bo *hwsp;
> -	/** @kernel_lrc: Kernel LRC (should be replaced /w an xe_engine) */
> -	struct xe_lrc *kernel_lrc;
>  	/** @exl_port: execlists port */
>  	struct xe_execlist_port *exl_port;
>  	/** @fence_irq: fence IRQ to run when a hw engine IRQ is received */
> --=20
> 2.43.2
>=20
>=20
