Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A49FDD64097
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 22:07:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 723AC10E137;
	Fri,  8 Nov 2024 22:07:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EhQFauB9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E8F10E137
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 22:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731103639; x=1762639639;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ar0Ir694OlIJoABulZq5Tu5a5NJmq9BlIFDz2f2vvPQ=;
 b=EhQFauB94Zl3EzfO/yutyywyrZycy0sG2NHp+rfCN1UJHCTOWbyj9uVC
 I4+nE9df6WeBO8VB0U0NbvFAMjnupys9Svxb9dxIMyh+g4JPtY++4Gfd8
 eNP3Uw8cYTcThroCmdU8QKladyaLaLdqTNn8l4cuCSSaOq8p72LDKusMI
 XLlMlnduC1yBLUWnGIsAUrX5LdHtAIcEF4nFKAIPBa7EwfTkhh9qv1mwx
 Kp44aiiDOjPvk5sQ+irG0vDDbM7WCTn8oJVQu+PDGPZlBbEMQRz+hqiO8
 HkLN7ExGgRv/APdsTQPI9gD11Gv1ohniRGiP2FRR1RsiD+80ouX+1QSHY w==;
X-CSE-ConnectionGUID: 3hadP6TsQr6IqDH8jScjOg==
X-CSE-MsgGUID: FDQH/JPRRKSTkKy3OyNVgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="31105914"
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="31105914"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 14:07:19 -0800
X-CSE-ConnectionGUID: MoiJkrpRQ1WO9IW4iSWUsw==
X-CSE-MsgGUID: b7clnCMKTpqY08XzGH3t7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="85761109"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 14:07:18 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 14:07:17 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 14:07:17 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 14:07:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pmqG0MZNf3d9+k47XYVbfn5zU6Gvy/DbYh8aCGJXC8BdDX3CObiazBQSeK7R6pMAwk1ypWWIrE4HaLmKcnopnYhOaON9dFRo39+MB/w0wd3DMZSKfAsTvyIRi7duaaupBIV27eOwIfDMFv1ub+o83EK6JDUPqC15D+r4KPqp6GEDy/Ckp6bCL+iX3iqOE07xJz3gMF+kKUbBz/ja3XFVxkEMzXHGcMzvRydK8RnqwyoOQBaVLA6jaWJGE1CE4UmDv+KyVI4ps/Uy9GjQI/jbnLkEK273JPImFZb4ip8T6xi/XtphvNgp3AJKGtQnc4fWi59e8VLYDN1O/SZ27BtbtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xJlwuWBrla7Ql0bPxPH8FDF+V9eW6NN67ZrDKpRP9PY=;
 b=f9kmtY+zw2Sz7WWjg7HMepgzuwZVgGQCMk9P6laJlz5s2FXrjcHbSnioKblzNarmj3clEFTXlGallAXfYRNs+pyNHdp965ebeQv30i4jWa4fLWogpBDsSFxmDtzF5Lzk2xZdS39fDhNOEVZyYOnPJD8v8fs/F3avzwZgrWkDW7FAefEXvx15lrLHfOO1WF8yxdSVjCNsDW/b62VC3kFohMA5MHeOc+erfvA8EhnrbIZ3ciOedwxcGjH/nflqyMII4rc36cu2pSILAx5pkmoxRsMOjRG+46uZ8Y1U9PdigOPbdb2LmspCwbBr2MuZ8MO0UuI9g6brSHv58urBY33QCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SN7PR11MB6849.namprd11.prod.outlook.com (2603:10b6:806:2a1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Fri, 8 Nov
 2024 22:07:10 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%5]) with mapi id 15.20.8137.019; Fri, 8 Nov 2024
 22:07:09 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>, "Dong,
 Zhanjun" <zhanjun.dong@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 3/7] drm/xe: Add ring start to LRC snapshot
Thread-Topic: [PATCH 3/7] drm/xe: Add ring start to LRC snapshot
Thread-Index: AQHbMgWs0JLjcu9UEUyRpOtUJ9+yF7Kt8N3Q
Date: Fri, 8 Nov 2024 22:07:09 +0000
Message-ID: <CH0PR11MB544451D68E7923F1A5769489E55D2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241108174312.272792-1-matthew.brost@intel.com>
 <20241108174312.272792-4-matthew.brost@intel.com>
In-Reply-To: <20241108174312.272792-4-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SN7PR11MB6849:EE_
x-ms-office365-filtering-correlation-id: 11969466-ec77-4a99-f821-08dd0041b0ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?IVmyptGZElGSQhcaJqucYqxHwRU/zPAZMf1BLzBiVi9vLTh9C2AmuUotDA8U?=
 =?us-ascii?Q?QW0lfTgXnmFX4OtlhEyqLbqwiL5V5/75LG1RUcTgZimpbRUbqR1vaPim/RFv?=
 =?us-ascii?Q?1KVP4W4hlB5YspSFPVDikoua95K9881VkobS5qMvvytfbnYEolst80fG2NAB?=
 =?us-ascii?Q?JWC7+oQnDeO1LKqTykmUejW4Y32pgqdpgFqZeewmdi1YJGhXbZL59lO+wEPd?=
 =?us-ascii?Q?04tNXiMy749L9tWcY0SibY/9SdxuCo/qSf0GGoK+9E8TQ4vE/N/1/EExEVr+?=
 =?us-ascii?Q?t8xgkQ90seIuTHe4PX4J50aCK50mJ50ibEBFY2tMU/axonqFPJcPAbzJSe6G?=
 =?us-ascii?Q?9ErzWA3qfKyoJARTnlDeirHGR+Bo0KZZzZ5zNUcx1nX/lDjunt5dZEchQnRE?=
 =?us-ascii?Q?vHRBABkb5UTjVdSuLM5VBVT75aRj9u202WOa5PtGN5WlEVpm1ZpXK8U+GhBR?=
 =?us-ascii?Q?UtPbaUmlU6b2Q4ZC9gY0Xhq1wRB+HgTqS2alKo3Xta6UEHoMTzyYn1Nlm8m4?=
 =?us-ascii?Q?ecnA+d8SU6A0eYsQfHt6u6R2OYvrkpACss2Vtvxrap0c6t33ek47Pet0MY9T?=
 =?us-ascii?Q?Wi71npID/3je/MztAgBADrFbNNe8iId78Dea4ZMxZa/Nh/53NyLtzfYB+7Oc?=
 =?us-ascii?Q?LOwJzNg0RyrWuoAuBOZeynORB7+R+s06mzvzPq1SVnzUuMyE6F8RiwVHXcmY?=
 =?us-ascii?Q?jbfCbUdeWa2bCSYymNcnDFuB+hmwOMveHIf8A/pqECJLuQB8GvKmCZLgsZPZ?=
 =?us-ascii?Q?JJIOR61wfaUyV0Q/bB25GpK79UwBvjqK0KWksOL67fhlZctQG0jP3VhQ9qlv?=
 =?us-ascii?Q?wIQTBb32xMq6S/69xAFkaeE6NQ+pAfMzvnNQZPPf4/J/HdLSnx0JvxLN9xQI?=
 =?us-ascii?Q?cIwlzEZInV34f0HEdKwH0Zo2RLQT/9FzrMDL/6MCDL9W8BPu517nal5Wg5KX?=
 =?us-ascii?Q?IJPagF1uJCTIiMvs7Lqox4C1F+Fx3ZTCgVoAZWQmRbpiIIw+Ak9wI9hPnbAp?=
 =?us-ascii?Q?kbJTyYa67647TnPi5v485i0/uIDxcGtLQwE88bHFtuQa3+71631gs+93/DfX?=
 =?us-ascii?Q?0ISpNbKphgbDxpsVAr4le3J9MN2McDqriMXYZqdHHljE2fuk2y/sKKdon2Y0?=
 =?us-ascii?Q?RKOShH5V5rx5oSXe7h+uFKnQDNYo6kxEXnkryyfitokQ6habVoSVDue1BxeD?=
 =?us-ascii?Q?4hsLsFU5fwwRtdb1xSKGxdrfcIgBBibLr7c94wSYxM+Bc9zwu1KI8aldhcS6?=
 =?us-ascii?Q?U+ivDknb6bSdSJUo2uZICzybyfT6S0TykSmqUyAYapI1lT3x+CaUU6+v4h+T?=
 =?us-ascii?Q?1sPNNARBj5/Ahftxg2tc5BnvAghaPbuSYGf3yv5AyAH+jl30eX/tnR2T+5nX?=
 =?us-ascii?Q?e+uz8zo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QEuSZjkM6TRt9FQNcde5vLiKMZuyNLmT39jCkYBh2SGX9V8PiEuvqT0Lbymx?=
 =?us-ascii?Q?0crwDx+ifPa6ExC0P+Dt78r2g3qpo97j/BYk8YtdzFmyqOkUT/ZpLCAID8Mt?=
 =?us-ascii?Q?bqRlq/zul5UBKkO9xjX1+wKtDhnexTEHGAmJ2p7Zq6yrPqceltSNxhfJKRm2?=
 =?us-ascii?Q?vodECeynfyCdply8iYINx5hiQiuI4Pzuh2PtkHdrSpVhBIndbYm1NhBmuAD9?=
 =?us-ascii?Q?kTG2UqAu/jr/Y4VfpbyFs7TBtR4xWio8nvGdX9b7h9FAGPke1vObES6nY5Ut?=
 =?us-ascii?Q?uKOpF7XrLl2KkrxnPNAXGEVHxq3ntl4XGM2GzHt9qrTnTyRWMWfzlKda+pf8?=
 =?us-ascii?Q?aYHVy5FMjkqwgmpqZ2PzcneRtC0NFB3yGd8eG7DTtPaaMB6QVcmfjicQ0Bnn?=
 =?us-ascii?Q?znO2VIx/1j9tf/UhaKHTjrfnaUt+U8ZbI/K+ND/KRL8ehLMMRYIlai7KSNy2?=
 =?us-ascii?Q?sokxv8Y0Zr8q875h1oWBavk45u+8SKXdU97K3oWfqxjAjQJJmDmt4JFXU9gF?=
 =?us-ascii?Q?h8vVYKV+W0swBk/2Erzl5hRpqSrBX9o/joPEI0q+znbxDhHNnyNBHmE3442x?=
 =?us-ascii?Q?rN3WqGuSmMEoDzhJnf8jUzN5LlFmdDKkFG9fxlAkISrnKphyhbPQFGKMgjFn?=
 =?us-ascii?Q?jPFR1CO2P9DakUt89K9wVZljG6XJuNDvgTzjGwrCqcTl+SOefA3QhSqCOuVV?=
 =?us-ascii?Q?RIXC8axwl/ejTq6IMlyznOsdY2XQyUZ0AFAoC1N7z7E93heqqSDQppLm0sHj?=
 =?us-ascii?Q?9Orkpv6e5Ody/c9geTEcuWyqLyI/QQYPGS2NrSq0dpGeO3WN75WP51oUYXQA?=
 =?us-ascii?Q?2olAf2GEZsVgX4pdqtlEibaxZlvWn8O8QxplemAL/lM2YpsAoth8MQMMpwsD?=
 =?us-ascii?Q?OlIB4MBb/PPcn69npngGWz97+o57bjAPFKTTv8moY4ivwcj6diajSubMW1TO?=
 =?us-ascii?Q?tJp8KIBInz6CuGTPs8pI2DpZMhz/5fizfkVVvH9GCmN4gamh5A42OsVurzFJ?=
 =?us-ascii?Q?G2BI0Pkm4PqtfxpWmUZSujGcuA+zKxoa1eINem223of2pJfeLRRl4JxxIh57?=
 =?us-ascii?Q?LEuloM8moDJgkbT85n2fOVeRDTypyQ29ftG14Z6AMU5jFNnO6W/hDIQBBDL4?=
 =?us-ascii?Q?56CKnBIYmdT8z+pmiYBaHUlRIlEGm9oQ0hY08nI24cDkVh/ET2yDXe86UK2N?=
 =?us-ascii?Q?uPAnrV1EvvJa6k6LLDexyyjMhpXx5cuU/xvnsChUDGUEWceZRjal9HkJ1B/G?=
 =?us-ascii?Q?Ys3RUHw3kIdi63W5PK1h0ylzGM39g3Xhk7ZhapSHOwR53Oh4MqNYrwdIpISH?=
 =?us-ascii?Q?rEIWv5CsDtMm6ExPhnAZH34eoPqfaValEjqONKoFKp9c5kmudQHGwdRgKrir?=
 =?us-ascii?Q?+nZnWvyxKmzDKI3EVrxppvKZK23s00pLdJGlAgc6RnK8D/hGTXcTaazbl2WV?=
 =?us-ascii?Q?uaoHYFmHSsTwQSATT5IN8pRZFqKXvr45VOvoKMsk8pCJUxYnC0kchlE8qXcJ?=
 =?us-ascii?Q?krklpiZHlX/McSGWMx5p894GScvde41AruwzjSNhJ2wCZcKPRbackcp1XjWX?=
 =?us-ascii?Q?4jQ12BBvBkdeGCsUcVciCa0jsu5ra3FSuiMsKXxN?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11969466-ec77-4a99-f821-08dd0041b0ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2024 22:07:09.8852 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p7IumKccT9hdvOygPMYiorFWLuTnnng2DRQQkSzqMjyHZeZE08SqI6oqedI23DrPze39m9uc+6ATy176pkGswZOrQRpFOEp6HeHjXALipmw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6849
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthe=
w Brost
Sent: Friday, November 8, 2024 9:43 AM
To: intel-xe@lists.freedesktop.org
Cc: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>; Dong, Z=
hanjun <zhanjun.dong@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
Subject: [PATCH 3/7] drm/xe: Add ring start to LRC snapshot
>=20
> Add LRC ring start register to LRC snapshot to verify no LRC register
> corruption upon hang. This could be possible if the indirect ring state
> was mapped to user space or via an internal KMD memory corruption.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Seems correct to me.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_lrc.c | 10 ++++++++++
>  drivers/gpu/drm/xe/xe_lrc.h |  1 +
>  2 files changed, 11 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index afb0f4f44748..80cb0e7e2d22 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1061,6 +1061,14 @@ u32 xe_lrc_ring_tail(struct xe_lrc *lrc)
>  		return xe_lrc_read_ctx_reg(lrc, CTX_RING_TAIL) & TAIL_ADDR;
>  }
> =20
> +static u32 xe_lrc_ring_start(struct xe_lrc *lrc)
> +{
> +	if (xe_lrc_has_indirect_ring_state(lrc))
> +		return xe_lrc_read_indirect_ctx_reg(lrc, INDIRECT_CTX_RING_START);
> +	else
> +		return xe_lrc_read_ctx_reg(lrc, CTX_RING_START);
> +}
> +
>  void xe_lrc_set_ring_head(struct xe_lrc *lrc, u32 head)
>  {
>  	if (xe_lrc_has_indirect_ring_state(lrc))
> @@ -1641,6 +1649,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(str=
uct xe_lrc *lrc)
>  	snapshot->head =3D xe_lrc_ring_head(lrc);
>  	snapshot->tail.internal =3D lrc->ring.tail;
>  	snapshot->tail.memory =3D xe_lrc_ring_tail(lrc);
> +	snapshot->start =3D xe_lrc_ring_start(lrc);
>  	snapshot->start_seqno =3D xe_lrc_start_seqno(lrc);
>  	snapshot->seqno =3D xe_lrc_seqno(lrc);
>  	snapshot->lrc_bo =3D xe_bo_get(lrc->bo);
> @@ -1701,6 +1710,7 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *=
snapshot, struct drm_printer
>  	drm_printf(p, "\tLRC Head: (memory) %u\n", snapshot->head);
>  	drm_printf(p, "\tLRC Tail: (internal) %u, (memory) %u\n",
>  		   snapshot->tail.internal, snapshot->tail.memory);
> +	drm_printf(p, "\tRing start: (memory) 0x%08x\n", snapshot->start);
>  	drm_printf(p, "\tStart seqno: (memory) %d\n", snapshot->start_seqno);
>  	drm_printf(p, "\tSeqno: (memory) %d\n", snapshot->seqno);
>  	drm_printf(p, "\tTimestamp: 0x%08x\n", snapshot->ctx_timestamp);
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index a2058a501353..a1b227440d1d 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -28,6 +28,7 @@ struct xe_lrc_snapshot {
>  	u32 ring_desc;
>  	u32 indirect_context_desc;
>  	u32 head;
> +	u32 start;
>  	struct {
>  		u32 internal;
>  		u32 memory;
> --=20
> 2.34.1
>=20
>=20
