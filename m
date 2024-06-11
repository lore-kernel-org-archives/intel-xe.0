Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86FB4C27C75
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 15:19:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CB2310E07E;
	Tue, 11 Jun 2024 15:19:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Atxclzkm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F19F10E07E
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 15:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718119157; x=1749655157;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=J2ehKplW7bxX+B3Cjx14wdgUpTokcPXHTcA4SW6uAU0=;
 b=AtxclzkmObUC+SENqy1BOut/hYDU6vWBr4ugJL//FiGhQ2/y31S9uSyI
 NDosaQ+dfFCFqQpgbzhZ8V1QffBUaTiCWfB5jOAq18Pnpp7kMIcov/jAH
 2rRh5NFQWwh3NNqkItTUJA3iioEcx1JTOFelRTdEm4LtCIVb/tRojtChF
 m8Wa+OQaq1o/ar/RkdBcitOdH4fbegr4rYw7ZJbe4NsYVJMXa6ak0ta22
 lad38LytnHsa52fQL57FQ2WoFVGMO5salBnhHwvcA+Li9sc06PTt68Cds
 r2XZx56GSSWiQUA71QMSRnzjcW1zc+ciEki4S94p1XbZD0bj4MnQhJbLO w==;
X-CSE-ConnectionGUID: ATYl76wzSK2JcadHzMAwnQ==
X-CSE-MsgGUID: fdNVE7yYSAmpbZQ08XzfXA==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="25509047"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="25509047"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 08:19:17 -0700
X-CSE-ConnectionGUID: lAFasAxCRqWobS3X3SgB9A==
X-CSE-MsgGUID: vP0pL/5YTTSXwQP99G2Z2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="39323513"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jun 2024 08:19:16 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Jun 2024 08:19:16 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 11 Jun 2024 08:19:16 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 11 Jun 2024 08:19:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jILVv5wtXj6SqVFOSpycinnVi+K3xAYlws8kBURpvKxedudsu2sEn8nIIgd9OJQbXrEnX3+p34GZT0eOk/hzpQNrscLJRSmkD38L7wVZM3iIfZT9mbAvZ5PTsGYcNP4Zva/HksiN9vG0O6oQk/c5kTUPPKVJHq3GNzUAlUgJTcekGj9SQ57tBcmZ60BXZrLhdHJqY70amFosL3KYoKxus5tETBaSZXW8lq3YhbzCZGPlwoDdgNgqLU+0dfB1j6U6nnoFMH+y7LMW4vl4xVKwT8J6ThZqKCx2jRBt2+CfN/VrmDdJax1KGlf+PpldD1CR02EO2646Ip7eEM/MMt08+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EmXJnwJGm17b1JmzmnkqBJSmlztkLWHWtfq3EgtWwgw=;
 b=JUt6nbwT/ggAHD+l+r9jTe5LkWK/qm2Dhwk6mfaL2RR4ca40TSrgiwPeDrlN5Tk3o0tuCqDLIFU8FsfszdV6cEtBvRqHW2ovasKh/gw7Tl9UYagIZ24fXmhXb1ZUu6jX4s/gJT+xyH4k4syR6JVbMkcXxGwqc1sKEYusutFCQTYYhotN3BHfhqRmxEuivAIpcR8jhbmDkDVO5jwZXAK3Qdjk1CvKqEy9kZnDX2i3DZU0sT3CXKa+zH+5DY7gSVd7ScwDQ8LkmkD43yYfaXk1lutN6zQ/jgnNOqaX8hYppc/nQrpzFBEVEKeRE/BorslG3P5KqpuslqS7tlzTmWrN6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SJ0PR11MB5054.namprd11.prod.outlook.com (2603:10b6:a03:2d3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 15:19:13 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.7633.037; Tue, 11 Jun 2024
 15:19:13 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v6 07/11] drm/xe: Assert runnable state in
 handle_sched_done
Thread-Topic: [PATCH v6 07/11] drm/xe: Assert runnable state in
 handle_sched_done
Thread-Index: AQHavA1jMeVMTkIDt0OQr/pMuRkDirHCo6DQ
Date: Tue, 11 Jun 2024 15:19:13 +0000
Message-ID: <CH0PR11MB544468042C6A549B863F5F91E5C72@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240611144053.2805091-1-matthew.brost@intel.com>
 <20240611144053.2805091-8-matthew.brost@intel.com>
In-Reply-To: <20240611144053.2805091-8-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SJ0PR11MB5054:EE_
x-ms-office365-filtering-correlation-id: 12f64b6c-b524-442a-680f-08dc8a29d9d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230032|1800799016|366008|376006|38070700010;
x-microsoft-antispam-message-info: =?us-ascii?Q?ubMtaSEHmN9vUR45jx2otnYKEcPCIRvigKcvMOSbFHB297GRB8Mr5DNWY1/9?=
 =?us-ascii?Q?p2bCiisuw7KC80JUhn4gaTtH+IgkVdQuxSpiswMBPFEjsJlmMkenxftTedcZ?=
 =?us-ascii?Q?gdipP+A6rGVeYBUeAdtz2//yIvj4/3fDeqbvSZ9tVaQkXyGPHoDNcXqhPPpK?=
 =?us-ascii?Q?2PF10WihFleSEJR3JSa47+md62yTY/JNSSwXAHDpfkr7ZwBOLegfZR6cjM61?=
 =?us-ascii?Q?flC1FWAz0i1tEM1oUB2xuf+KahioCFd0my8qPVCDkoMDjyD0CZUshjhc4BoN?=
 =?us-ascii?Q?IdeOkfAV27RjB5+URX7RWnb3F2IoxwHFBkXfAQcVVPDub5tfCzUG5AHUqsFo?=
 =?us-ascii?Q?YjPO5LZImcjAg4wavw9UlXI/auUbilZd72Pgu9cGwY+afIiporGcIukMzFOv?=
 =?us-ascii?Q?M/GVNtRByH5HXvF7L3f917k87tuPHbPTbCcuYB3YkRTuSX5yvVj9zdcxG6pg?=
 =?us-ascii?Q?6PeHKAl1D8MDALBJPhlOVxnfy3/kOzGzJKDkC2xn6aeTAuYjubNL/vwpN0XD?=
 =?us-ascii?Q?8O+xHtQxP9+/BDopL2jivPdnbMY3L/M/sbNUQvXcpoui9Wo8LHqdhV8QYHSF?=
 =?us-ascii?Q?s1OwJyoLJ0+MwIBgQNs9XZZ/vjFRRaWwhYlhoX9elGiWo3Sk8x4nCsFBQilQ?=
 =?us-ascii?Q?nnh3KCvJ3SAjTT3SAIdeSAfXcLH35JvANYbgRg2LFValkgLJBtcsgC9OQsL5?=
 =?us-ascii?Q?CPVufZC/E/yFZTH7RC0cAPUnmSkHWsllWzYSnVgYnEldVrQejjeEowS4XMoe?=
 =?us-ascii?Q?0/vQz4+i8NMD++xDCtks6iVfEum35/zA7DbvcTbA6o0w6h8Fyp9Q4e6WGVhL?=
 =?us-ascii?Q?DiIzL/1OhMtVpqug91qdg1QlDzKsSydjBL+NCDxpvX1xSeIrYo4FhJX3j5rA?=
 =?us-ascii?Q?bJuGZTt6aIY135aF29m16ahRKc0hlg4tibEbRLDWgJD6Gc15kKRdP0QcaIBO?=
 =?us-ascii?Q?aHzjs4ZW2va1bR3NQaFETjZD0rdKs/R0R6D0kyTV0qZZbrjfbGqqdg6QtOCA?=
 =?us-ascii?Q?BMfjHXe7MCj8GZxJhmd1CRw+e8qlCyaPiwTPULEV3USa+UBSNSnokbH4lrc2?=
 =?us-ascii?Q?scZIkR+qFxWIWrSsrSsLsLCjNgW9ETP1V286ZsBvIpP41qFLS0NH38Tye22S?=
 =?us-ascii?Q?KUZKpgvDQ+Jip6HpStyJCnwPNHdF7G4nGkVXTKTyJ5Y+dPquzTJuty2wZRV+?=
 =?us-ascii?Q?olgFIf6bS+2VmnhDYe/tZYzGSK9GuldFhvFR+R8z7ST48tLeknTnc6Q7R1Q4?=
 =?us-ascii?Q?iTQDAAxbzv97Al01uTRb7wXU7YWI+YB4UVRJVXNtw7gN7louedlrrp+3DHQ/?=
 =?us-ascii?Q?qmg7nv0HxaQ8RnOjidDJd2AkX3Bng1FuvMvYqgAC7EN5Tk6GwWMUf/+cT4Z5?=
 =?us-ascii?Q?x/RGQv0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230032)(1800799016)(366008)(376006)(38070700010); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vJ6k1rtLNqYJVGSCTdhj4W+CJjfZRDFkGX7KZKjPw0gO+7/hhzF/qZZ6wsk0?=
 =?us-ascii?Q?bES6n4lizjROI/WzRFrIR3YgMS0yIVK+A0NHR8oUvEqIURIjicFcrnrNw9e/?=
 =?us-ascii?Q?dGo4aRxYNoTP2MpUuM22RHCTt0KLLqiJpU6s3jEGdKc5aFBmrYO5ef4t9jqQ?=
 =?us-ascii?Q?ji5dEI6JM8rMbsi927AeuCTGqLnS5BzlSwnJHuea0ZKkvElcCI7YkehHmRIL?=
 =?us-ascii?Q?XLvbj7GLJK57zGGNhAa99qOhopU9ukHguAywmDiG0gYV4pBFAZUEpEsfDgSJ?=
 =?us-ascii?Q?rRc3a5PLpw+Yq90+mMqYA5lWq9QSq9qgjsxOwflOI5cXiOwDRB1kwUq/P4Im?=
 =?us-ascii?Q?MEZ3zwtZTDA2xVoA23xpHLezNByyOd9Vu0jJwc9Iv7c4cvgnvpeWo1DveJiG?=
 =?us-ascii?Q?gTOLSMUhAXgJcPOUUqtayLR71bv0lP/3ws1bS2SWKE6TAAjwmXQ8oGzDcgU/?=
 =?us-ascii?Q?fiJTvWmiFYdYbX/2tYLlPw7372dKamTN0pf3hvyFPtt1ssimuBdK+wJLCuEc?=
 =?us-ascii?Q?SU6pwEh1ZipxpdJEd25w1XQLFWiDq4FBuWoEKS9xNkbzOQYUn8Flo4qJ6Dv7?=
 =?us-ascii?Q?caeENJSvjhxXF8SUE1inU4sA+Tp8syi7rX/xOskFDW9CEu4Kxb11bF38U8Jn?=
 =?us-ascii?Q?2DoLRIrjaqylOg0KDwL90y1wEnT/QejikfOmZr+md88dbRho8KEPx5I8YTdx?=
 =?us-ascii?Q?7EFTlTrpKUoHjsQNh79ReUnBvZQOH7WzuFaK1Y/21YLSftkzcIvEFdtuKP98?=
 =?us-ascii?Q?Z/TFqVUMHz1Y7etGSeze9+lP4WmFfm3AigNS7MaqhqOwl2kkhB7RrUK2wUjr?=
 =?us-ascii?Q?Qk134SbZ9zj8uZz9+azTOeghB+M4rVT1x3xJ85uqwLyvV13ImgW/XI4Pc5A4?=
 =?us-ascii?Q?iNV+0CuJA4eR8yZuVMHoNvEQ9D/IvKLMlEwvD7KHUQQvtS4NKFjm1sXLezPt?=
 =?us-ascii?Q?GWBYfBj+bHUxd4VuyZjZCatY+44Br3OD/juVnYCPz1twO2h/kSgONoOkc75D?=
 =?us-ascii?Q?JojMflseiAdJz1tuHYgOR1v9xc3w2+ISVE8bLZ0rxDX6T+xKkyzqFhbBQYhd?=
 =?us-ascii?Q?8DsvNACgiNt8GosD/+mz0uJ7FAoE90nUopKtCotxyZ3IEV6TW10nBNVlXGH5?=
 =?us-ascii?Q?j+QatI2phbWbJwdExnMK1j71YFtYfW8zF5gjtrVviLZx+ATKWAoahpZAt8lH?=
 =?us-ascii?Q?zXD6HeBbCWKcSEndLpcKXGMKQq3WaKmfWUtdejltwh952YfFf7/EPMQaowkl?=
 =?us-ascii?Q?AURXupCnMfX6r4hB4+I+oFpiWATrKbzooAqfrrqevo9qIpxDe6pvSlefElrR?=
 =?us-ascii?Q?otUouB9yThHcbA26yqEiSD7R5L0pweZCZsd6AzQz/XznxQJcLN3iSAHFNNrI?=
 =?us-ascii?Q?o9yPfEsD0FMYRYhc2pxQK86eeHP2Snjso6vVAlJkF7dQT9BR92i4HbU4BQZ+?=
 =?us-ascii?Q?BLVIf5iKf1ONHj8oHkbM3T1gqeO5pFNuuSZq8U6IUe0J9LIYNu3hnqgNZHKL?=
 =?us-ascii?Q?1BfAtetNjkHqWAwrjEjdO1GENu5kSwlIJ1GrspjWun5LFQHQQGOznrPg3knp?=
 =?us-ascii?Q?kRxgOAlvR2w2mCly+D1IsKLVEoZ6/z0lDzBME/F4Vq/wsBNZ6FLrShc5ZmrV?=
 =?us-ascii?Q?WQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12f64b6c-b524-442a-680f-08dc8a29d9d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2024 15:19:13.2420 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LU/rbkICjs1M0LmuUDmGLfxxGreggORUjRED5NHLsLjXYyj/6nc2XNxqt4kgLQH2qX5XabvJ7Rp0KoTvlCUd693V4v1WN78UbVZd8fw9bqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5054
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
Sent: Tuesday, June 11, 2024 7:41 AM
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 07/11] drm/xe: Assert runnable state in handle_sched_don=
e
>=20
> Ensure G2H and KMD GuC machine match.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index afd22a8d815d..ab0dc93d7740 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1592,16 +1592,21 @@ static void deregister_exec_queue(struct xe_guc *=
guc, struct xe_exec_queue *q)
>  	xe_guc_ct_send_g2h_handler(&guc->ct, action, ARRAY_SIZE(action));
>  }
> =20
> -static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *=
q)
> +static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *=
q,
> +			      u32 runnable_state)
>  {
>  	trace_xe_exec_queue_scheduling_done(q);
> =20
>  	if (exec_queue_pending_enable(q)) {
> +		xe_gt_assert(guc_to_gt(guc), runnable_state =3D=3D 1);
> +
>  		q->guc->resume_time =3D ktime_get();
>  		clear_exec_queue_pending_enable(q);
>  		smp_wmb();
>  		wake_up_all(&guc->ct.wq);
>  	} else {
> +		xe_gt_assert(guc_to_gt(guc), runnable_state =3D=3D 0);
> +
>  		clear_exec_queue_pending_disable(q);
>  		if (q->guc->suspend_pending) {
>  			suspend_fence_signal(q);
> @@ -1640,7 +1645,7 @@ int xe_guc_sched_done_handler(struct xe_guc *guc, u=
32 *msg, u32 len)
>  		return -EPROTO;
>  	}
> =20
> -	handle_sched_done(guc, q);
> +	handle_sched_done(guc, q, runnable_state);
> =20
>  	return 0;
>  }
> --=20
> 2.34.1
>=20
>=20
