Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D014DD2CDFA
	for <intel-xe@archiver.kernel.org>; Tue, 22 Oct 2024 16:06:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9354F10E6B8;
	Tue, 22 Oct 2024 16:06:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LocGbFf6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A77F010E6B8
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Oct 2024 16:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729613179; x=1761149179;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ABsrXVO7HAKCW1dzhTtcSV9+iDw073o6sj/pu3Z3N+4=;
 b=LocGbFf6N8A+tFYfWAkMO+vHrllakSnYoX0uL0EnQkR+psm42P0u+VBG
 YFOSpGhpH13uqHOGF+fI17blI10nU6o1Syc57IQE5hSTIpz1B31+47/8E
 pua99Lg9OAMzT2ynEJD4S/KIepUuQqjGesgPVnAWuJ6JSfZoxC2SvqrbP
 RPXKdzPot56Nry2jYNiMvQwy/X8HTSGZvxT+MzDo8iL50NbxnO4Phynyy
 KrgXraaZpQF59bQJ/Lk42eqUL46atVl6SlDiDNpOJcVPDPiHEjazK/Wt7
 Jx8DtDV/e0igQ3vEXtiTg/nm7wR8eC3r59XBT1GAlTLN88CQamRrnAABL Q==;
X-CSE-ConnectionGUID: T874e2aaQzuHmRNXnLGhmA==
X-CSE-MsgGUID: smhetOM+Q22ei+KM+eEgQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="54566279"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="54566279"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 09:06:18 -0700
X-CSE-ConnectionGUID: HX7IwpN8TWK5LC1qBeT1Xg==
X-CSE-MsgGUID: hLSNQ3EURqqK+q0ejIxiVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="110742943"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Oct 2024 09:06:18 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 22 Oct 2024 09:06:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 22 Oct 2024 09:06:17 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 22 Oct 2024 09:06:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t7ZLUlindUlK7HKrrW6im2KqY1M1HCavkXCT9DBA5EB+LBphFb/iy582lbaaAkzjflzrUEkwAXmbvChZ7MPWo1MPRmq5a7J89zwa9fBga9q3BP59juWN4ObslH/INCOh+OhBtzuXr/iRYeMckPqcyOh/3yfXbfqG5J0MblL8wHGmsUwVQMKxNk8NFcwxQ6aJSzj9VQw4I0dyJKGpJ3m4tzRhKpig6/45ll+M5zdFBxx0CWAK14xd+rjbjDMwvss8k6Iv9wLjWRUN7j5xhrYHGfqWPxC4Uc/Do+ZJ9Ehs+Dd4iqTOeffiw8jf6MR8pvzGuDmAgROv2WHg44t2dVHUHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yS/paksuZ13fpEwcgLMnc5kuhMw136cGW6zuM1UXvxA=;
 b=lKR1MIIe4IvU81nbRzHX0o1h2KswqPRLqQvtDWNz6FGaWfiFZkRkS1DJN1U/BrxDVh4WKP958T21gEyGHgSLwFvqWMUyWMwvaMe9t4Y1rUrmj5+qfkIbEuA4/YfJKH7M5zLWHUGY0SSWkt+kR6np40SE+5+s1HIzosQpdKlIzEim5zhl8PMW3OLLQSWACL+SPOr1GSQ5MSu40BEMUFrSyBcb1gwHrMNgk4DTTCPaFpCyYAaSXMTh+VuA5LoJmREOJnBuakhnsv62+Z2qlEk9DR11dg41RpEPQzsHCrVXhZ/SoSzbhjQWSffMKDtnmj8ActmLsVP7LdG45qSnhK7dEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CH3PR11MB8154.namprd11.prod.outlook.com (2603:10b6:610:15f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Tue, 22 Oct
 2024 16:06:12 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 16:06:12 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Das, Nirmoy" <nirmoy.das@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Das, Nirmoy" <nirmoy.das@intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v4] drm/xe/ufence: Signal ufence faster when possible
Thread-Topic: [PATCH v4] drm/xe/ufence: Signal ufence faster when possible
Thread-Index: AQHbIXiCEtU4FbJQPUOYomBUMzHm+7KS9UMw
Date: Tue, 22 Oct 2024 16:06:12 +0000
Message-ID: <CH0PR11MB54445812098179FC554B1BFEE54C2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241018152958.1975994-1-nirmoy.das@intel.com>
In-Reply-To: <20241018152958.1975994-1-nirmoy.das@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CH3PR11MB8154:EE_
x-ms-office365-filtering-correlation-id: e191cc7e-1cd3-4269-35a9-08dcf2b37357
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?YJY18cJ8fseYiT5GbRqaR4MSzlvr7Xwwv44Jv0p8SB6kIXDfP2QBZ7bTyv9i?=
 =?us-ascii?Q?LWBOn9/lrh3/7kUdxveJOwvNAk2FHM0yqU1wIVEyYL36jnZT2Q/yQIyu6ri9?=
 =?us-ascii?Q?TU543T3uZhXrHX8cwJmZnktvjL8hzPYdhr6LA/qV6dxesdhX2PELTkby4JJn?=
 =?us-ascii?Q?Hzf/UaT1owYu2O4jGeVERyvlWj38o/N6aVxgT+mJkOveZXyXpoMJEh1WN7qj?=
 =?us-ascii?Q?FT2SIgOhpwOzz/82wlN0ZlQRsjP158U9HOxFvy+QGm+273dP3BDP52OLatzy?=
 =?us-ascii?Q?I4AJEQzcpBTPclMem/qUI3Jb8c1NtrbEcS5F0ctZRCjT5BrmQJmRI7RToJ1Y?=
 =?us-ascii?Q?HJ2ZPtq6mFehCvaXnzouKh9V/5DnqRKSmrxvG4bKj8VcoGU/cGs8lDJiN6fA?=
 =?us-ascii?Q?Y6XcqCeKG3zVD+qwnylsW6bxdoQ/gyF88DarGeqTNUlljd7buXn/mW4cntTL?=
 =?us-ascii?Q?jEl/aYiFBCEgaMNMwQFnz615/nMJx4nknmUl5cQAfEKl/fUW3HyMMTSekjbG?=
 =?us-ascii?Q?JDa7+aIMpTFzOc7yx882QFKP6vjoFsOiz7gTQDOHOOt3xE3tgSI17WjtKpcB?=
 =?us-ascii?Q?pWoN9VsrZDyFVTRONjFA83FCZE1KS9g8ohxBa1AacE8xj2fRTwZQVe0LC3h5?=
 =?us-ascii?Q?oSALY7t4X9FMRBZkp8HHduQSAzfAC6msJ86PSr2y6THJnkt+GVSuoBCO/RbQ?=
 =?us-ascii?Q?6ypW9kvUMtylH9s0hfUR1T9d26UdIVoo98IpHSDwNVgwLWT+TF/gDiDx5gvg?=
 =?us-ascii?Q?J1uZ/19A1330HkwGZwf1S10TOPQ8SJcn+rEuytJ6wmAJCjUcSHFWCA88rDMb?=
 =?us-ascii?Q?QwxV7zdQoOROPUERIYsijN3jwiet7kMahbG8z5qqBn/HAnZUN3JURIgweJ1U?=
 =?us-ascii?Q?HYTr+kEMJDT9KC8bekUTKQXekF9+mKfwcnedhBujOZq2xN5nfWAAkDo8z0Xp?=
 =?us-ascii?Q?4I55mBttIW6/raasF4h6ytPkPst3rGX1CkECNxhySzxFrVOHC1NDSaI/Inl6?=
 =?us-ascii?Q?jD9VLNkl5NwJkUOTixr7BgvNuMpGXMCH/VNlLdQetuGj50v10dhPB+rCmSTW?=
 =?us-ascii?Q?zDn4x8QPg0Yz89ixvjCl/LCouhkckLYTq2q9c1pQIAvCRJn74p+IC1cOgkpj?=
 =?us-ascii?Q?JCZrUc/i7HKmSkmeAJtUE6XLlZZScvlvCPq98DRJMV/KOW5dwCUdEbEzBIIU?=
 =?us-ascii?Q?F4EOotIKoM29pUSwHujAXZA9MBKuigZ4+lwD4qn251Qr1Tiq+KcgBhoQShUM?=
 =?us-ascii?Q?YCQiBvmC/hDN8KdDGgc2K42UMJQ5MZ7So7NwFom+kQ2TqoRf0H14NKNgeLCm?=
 =?us-ascii?Q?65dv7d/W5uHygyKJoFHZe+3G?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CQZRcpJVctnpLxhEzT1jcDFPOww9s5kSid5mxr72X53aIZQA7mAMBZ3EzXcI?=
 =?us-ascii?Q?jVw8EGzJCJFok6PSvNncWfTgCR4Q+djHwuFMvDWPSUpExF7sk8+WQ820k9Yd?=
 =?us-ascii?Q?mIa1EqigY9yIabPeIn6Zf6p9giW8Zx1UiivWA/pUTG0Sv08X6W4EE5MC9UWj?=
 =?us-ascii?Q?Nmta675YLvFxGLIWzcvDc/h7musf4LgTcPby1wWpxIODIOTOg3/9LyE8P4qC?=
 =?us-ascii?Q?q7QJ9hXl8a4Alp2m0aSf1rgCUpvlqyRwkY0if11Yhrqn6KzsLzeg1tYH/ha1?=
 =?us-ascii?Q?m1GRNYvfyQPJ3qQ8dCSVMORL3Lw5+hd0PEOv02HHdtYq1LJY8rgR9g/EwO9o?=
 =?us-ascii?Q?9R1mU+qN4AfBJOLiV6MBahNsAf21cBR5bfNRdSNFlcIC6YR7jeFX9cbzn0qB?=
 =?us-ascii?Q?7+mMgh2toiADgPIfyOm+nzoaH9OxEXXpsrQx5JHkyrJ0420ve9eia2i8PorF?=
 =?us-ascii?Q?Pn4cTlSGVumv2ua3SucbVU6+a6qNh67LSaf1Ls2DPq7vuODgwpuQ1QlPalak?=
 =?us-ascii?Q?MK8xyBf5vuNfiZLtl2LyOV/esPwynz9SXPSwK5AVDN2ne2STUC0WNAwQ3x+o?=
 =?us-ascii?Q?uuo4FNHPryFOy3wxa+7zqJ0QB+ckdZI2wqzsYJJxqt5Ju1tl+i0POrlRDd5/?=
 =?us-ascii?Q?Fy/A1tRzZQpBa4YsiJUn8zOznqj5mqFOzC05uAbB4EP97IkFiHm5atcJf3dy?=
 =?us-ascii?Q?9TBA9mJCHS+Ui6XDHXkpMpkfx41jQ6ycRVyyHDwODpM7ASeF4gaW1Jagz09f?=
 =?us-ascii?Q?ftiv2aJLdt0mMLRf+VEk6QU17ERZJbJzCdIIDRaHndSGcMh9uEzSjvGJltiF?=
 =?us-ascii?Q?jS3WkfyGopnk7XZ+NdAH83JPxCV95c59YJQU/sY9A0XcERUGUL0AOD2UNv0y?=
 =?us-ascii?Q?xCYUvFd1rRQIkclZ6uGEIN73OAtEdpUSIPZb0G1bn9KQIN5fBQlaeoMWAU7i?=
 =?us-ascii?Q?WuUljrJvvQRn5hu0tysXPvHyVDfxQ2N42Api1Qsl0wruD8GsTSx7QltqUIOR?=
 =?us-ascii?Q?ZEd4zvLHhgf2Q8jw5zm0CL5OLFIoDfkOxlS88V2uhF6YtSZad8LeIlXtbRmN?=
 =?us-ascii?Q?nAEo2EmhkL9pRiRqfwZjInWItWWUHoajPFVB+O1iZiPToPHQKbICUmlzhHku?=
 =?us-ascii?Q?MFWN3XyMR/oe8WJEITnx1FfBy+PzmlZrJ27jIViofK64Nl2AsM9fP+qcqhsu?=
 =?us-ascii?Q?L1x9eR3IX9emdsYofbDC5zy3/GiEiCEsZFwUBLrfm62WhVStaDL+IhKnYKBb?=
 =?us-ascii?Q?uj2H+d4GM34sdrmootVoksOAUC7OGozPH/6tUvOL1fmffOa2cLSt7TDWFDkn?=
 =?us-ascii?Q?RxJnS9qavQ1W+GbxiGcCvMtfpl045AvPHWwvD8oHVay1t2dQR1dRTJItMihP?=
 =?us-ascii?Q?r2ekZtPwrJ+vzAL9I7naghj+s6Z2eekbZUbUqPIGopJja0zmwNCONhkyi1l3?=
 =?us-ascii?Q?2FUv5kuMIZq53j24FWgM2/z3wu1BmESh7zRVw6ggtrgPUTib4P3n2RKSX8VS?=
 =?us-ascii?Q?Db9ZpL7pG5r2k+n7syVt0g4t82r34LRB+VfNQ2oICVNes8DafZNmnj4wSG4X?=
 =?us-ascii?Q?Gi8YkmkZ1MgX/B2y82/fJbkMl/HixOw4Rii9/LBs?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e191cc7e-1cd3-4269-35a9-08dcf2b37357
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2024 16:06:12.7789 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qwkm2ziDatfahZIqtvzQRsHbt/PuNcckHo0VgxjquB/9qY6uyvlpfsBhmHKyuD9NDOi6/r4Hp3R736VsQFjA5IRdjI5Vla7JvjUBufnFdgI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8154
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Nirmoy=
 Das
Sent: Friday, October 18, 2024 8:30 AM
To: intel-xe@lists.freedesktop.org
Cc: Das, Nirmoy <nirmoy.das@intel.com>; Auld, Matthew <matthew.auld@intel.c=
om>; Brost, Matthew <matthew.brost@intel.com>
Subject: [PATCH v4] drm/xe/ufence: Signal ufence faster when possible
>=20
> When the backing fence is already signaled, the ufence can be
> immediately signaled without queuing in the ordered work queue.
> This should also reduce load from the xe ordered_wq and won't
> block signaling a ufence which doesn't require any serialization.
>=20
> v2: fix system_wq typo
> v3: signal immediately instead of queuing in system_wq (Matt B)
> v4: revert back to v2 of using workqueue because of locking issue
>     and remote viewing a different mm struct.
>     Use Xe's unordered_wq which should be less congested than global
>     one.
>=20
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

I don't see anything immediately wrong with this, though given that
V3 had to be reverted, I'd wait for approval from Matt Brost before
proceeding to make sure the revert reason is amenable.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_sync.c | 24 +++++++++++++++++++++---
>  1 file changed, 21 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index a90480c6aecf..7a1558c7ce09 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -92,18 +92,27 @@ static void user_fence_worker(struct work_struct *w)
>  	user_fence_put(ufence);
>  }
> =20
> -static void kick_ufence(struct xe_user_fence *ufence, struct dma_fence *=
fence)
> +static void kick_ufence_ordered(struct xe_user_fence *ufence,
> +				struct dma_fence *fence)
>  {
>  	INIT_WORK(&ufence->worker, user_fence_worker);
>  	queue_work(ufence->xe->ordered_wq, &ufence->worker);
>  	dma_fence_put(fence);
>  }
> =20
> +static void kick_ufence_unordered(struct xe_user_fence *ufence,
> +				  struct dma_fence *fence)
> +{
> +	INIT_WORK(&ufence->worker, user_fence_worker);
> +	queue_work(ufence->xe->unordered_wq, &ufence->worker);
> +	dma_fence_put(fence);
> +}
> +
>  static void user_fence_cb(struct dma_fence *fence, struct dma_fence_cb *=
cb)
>  {
>  	struct xe_user_fence *ufence =3D container_of(cb, struct xe_user_fence,=
 cb);
> =20
> -	kick_ufence(ufence, fence);
> +	kick_ufence_ordered(ufence, fence);
>  }
> =20
>  int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
> @@ -239,7 +248,16 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync=
, struct dma_fence *fence)
>  		err =3D dma_fence_add_callback(fence, &sync->ufence->cb,
>  					     user_fence_cb);
>  		if (err =3D=3D -ENOENT) {
> -			kick_ufence(sync->ufence, fence);
> +			/*
> +			 * use unordered_wq to schedule it faster and to keep
> +			 * the ordered_wq less loaded as serialization is not
> +			 * needed for when the fence is already signaled.
> +			 *
> +			 * This needs to be done with a wq here to avoid locking
> +			 * issue when a ufence addr is backed by a bo and also
> +			 * tsk->mm needs to null to call kthread_use_mm().
> +			 */
> +			kick_ufence_unordered(sync->ufence, fence);
>  		} else if (err) {
>  			XE_WARN_ON("failed to add user fence");
>  			user_fence_put(sync->ufence);
> --=20
> 2.46.0
>=20
>=20
