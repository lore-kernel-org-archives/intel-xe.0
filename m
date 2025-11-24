Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3072CFD318
	for <intel-xe@archiver.kernel.org>; Mon, 24 Nov 2025 06:09:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 753AF10E068;
	Mon, 24 Nov 2025 06:09:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aW8bqQky";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E307610E068
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Nov 2025 06:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763964553; x=1795500553;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=AhEjQGQxm1qpdOj9InGDAtI5P9xY+tnJ2c6H79Nt4Ms=;
 b=aW8bqQkyDtYIY4pnhFI6/KxEb2JdcPR+x0cNyQC109xRs7DbQ6Dqg0sY
 UGPwLcwHM/OGlb5hUVxxH5FemzaKAIT2fSRVCt5W2exm1JV7V/HHI2G+2
 ODujPuOTQBWLR5nLnip7dLzRljZ3/IydfXRKaAweJucMGuj98Qn8ct68z
 AdG3/k4lppa4C0/yfAv89rF7ZTqkTXzy2dfuiaMWr8xXK8mry7Nu9R9O7
 59D0btVQv9aTazwYpAUpj7uMNjeLx78f/cfCX3PXdHRs6cwMBSF4bj7U9
 f8WPhZnM46pvKKxPNnZe1Ocy1q5EkUwcGlxtAyUmBW7Nu8eFyZXhWjRit Q==;
X-CSE-ConnectionGUID: 8RgwSVJQR7evTZWqeaOPtA==
X-CSE-MsgGUID: the61+0NQv2xIStg/Bxvgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="83575014"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="83575014"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 22:09:13 -0800
X-CSE-ConnectionGUID: S0KjWC0aRVWE6pi6bk88cA==
X-CSE-MsgGUID: CL4f2dIgTle0vOe0SWgFbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="192340112"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 22:09:12 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 23 Nov 2025 22:09:12 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 23 Nov 2025 22:09:12 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.18) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 23 Nov 2025 22:09:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=caIOosbwt4a4MNN/orMyrayF5wsO23jNx5taYF3RaLYNx1LFwDI3AFXX9KklulsFStIieP5TrI+xtiVvXcW8D0Kd9Sw7pLoh0/oNEziSL57SHAcEGvWM31ZcUJY2ZNbfYZnKDiGZwfbqYip69QawNJCiwCl/6z5HJE6ia4yVzmCDjtrqoEt2bzYJ7QHHKn9bDJmZxbwuqX1oscOjos0BoOG2QbKc3kjYwygbEzXHPg2BLt3DCQ3fdExhh9Q133gjr27NoTnu3E5qFdCiSJpS0f+e2yS0/YUZSP+dihiZSUEiydvBIUqgYFc4M3zel7tAhVOvlUVNYP2H8xiZT1E18g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bqcXXvR6aLZltw7yxRzi1evLSDxVtx9KqcF/Hs+aoZ0=;
 b=yCNgzJGGA3pPvoaWNa8Ddn1lTa96c46q/2DFwkjzQqgoxowhCJpXRKFu0+ouvldrTh3tAEiPFMuYRezCtY2qfHUwG6iCI/tVvkas9jPatIQhY9MffxNVsSMwnyc2pI5DNHnKaeXKt9B/x28FXa76AH8r4bLeHWIMeKwB4A+Yb4THfmgVF5QqWbpCrtiUCBuaxXgYWMx02j8g5r6PIsg+S6HF+WNE8Bj977b5bffXuxBzBTO7HwAQtFzUPpT0b7OFIdVIWZ+8R4lqhoLhKhifbxWk+LiMXViWDD88onvRElS6xVnRVo3UwBMXoT0dnnq50t4Sqxg/O5HblzLSIxC/Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH7PR11MB7049.namprd11.prod.outlook.com (2603:10b6:510:20c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 06:09:10 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.9343.009; Mon, 24 Nov 2025
 06:09:10 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/xe: Covert return of -EBUSY to -ENOMEM in VM bind
 IOCTL
Thread-Topic: [PATCH 2/2] drm/xe: Covert return of -EBUSY to -ENOMEM in VM
 bind IOCTL
Thread-Index: AQHcW07w3sZt3KmCokKsGhffINr+GrUBWsBQ
Date: Mon, 24 Nov 2025 06:09:09 +0000
Message-ID: <SJ1PR11MB620401605A3C3F42C779C48A81D0A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20251122012502.382587-1-matthew.brost@intel.com>
 <20251122012502.382587-2-matthew.brost@intel.com>
In-Reply-To: <20251122012502.382587-2-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH7PR11MB7049:EE_
x-ms-office365-filtering-correlation-id: 03f33662-3d20-4c48-7aeb-08de2b1ffba7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?gFazUtymnLvcTghSpKkOjMgR3l7ONI6MLpyrJH+B9TXcuJmhRq6hJQLbqm1k?=
 =?us-ascii?Q?Dcn+nFNiqxoTKcppeB5d1Pqu88INzg1mEkdH+wRtP/D1tV/ZJUWUOrzrdBNn?=
 =?us-ascii?Q?L8dkuWYnug8mdyJQpK71ve0bQyQtFZIgiJnQGcQX91KsiZzQVfbORrmMsdtK?=
 =?us-ascii?Q?3MKfUpfMFuZVwb5RylWp8mvAhEao0NeFdrOkwPl3hUVJzNxzU+mDaYiTGjdv?=
 =?us-ascii?Q?2rtGogBZsIaBHI6au7R2bQ0PUCtwv+SBWRzcSdYlOrBiKb28C4sYuuWKDb1f?=
 =?us-ascii?Q?1Jp08VO0HD0QKKNa1LPnTzGEReCX3SpOOaakOXlFZFpzF76GT4ONOdJ2cmQ/?=
 =?us-ascii?Q?OoHBfX23mlNNA0LxgeBznH11ZTi1BcutNL3lvXSsqkatyhPJuZlHTaNgv7x6?=
 =?us-ascii?Q?kMLn5PuZhlRzoX+4feRVhbHhpF9Hq+1WssgsNEs/Rvchlnj7+0BfExk8GReQ?=
 =?us-ascii?Q?eG/WkfHKCObgtagrrDrRnZgNIig0k+r6yh3smfUgwSdHvnt3iZWriiOV6OHI?=
 =?us-ascii?Q?69J1L2LUtV+MUyxDH3ExmN+v5PzQmru2MwFE1akYhzZM9U3tfPp8zLzu9jAF?=
 =?us-ascii?Q?WT8MMZGWLbZvCU4TPpZ93Tmrkb2BIFXxZump/WuFJpxK9l7xz/L/D8PB45v0?=
 =?us-ascii?Q?ZjfWfszUpU5Zu/AOpMEoSAvdGYHr7Pm44Y+/VMZ2ifY5nM+qkOMSxhQto1XQ?=
 =?us-ascii?Q?LEv9KplhTpfyFiwL5lDXU1JCU4rN1yMD7se/POUItqjGpd/+Mvurzta/g9j5?=
 =?us-ascii?Q?CqZPP0r/WnpBJ2HODyURhhsS4bMAh29UJCWmAHwhRYO3m8PG6O/eDqrbMbtb?=
 =?us-ascii?Q?EvniMCXs6Gp81k9jh7ApS9IbnNHmWRvUpr4z6cCbZx0I+oMS0Bo70O7oCVVC?=
 =?us-ascii?Q?0irE0ZM47aXi/fWPSxvHoi34Zj8qpEG+9NiAa8/24fLbhtykkpVpBdquEyxB?=
 =?us-ascii?Q?vwNprl7iB0R92imhGJK171ECvk+bMtophb7fTI3w593X8l8rSVoqfYwidMWP?=
 =?us-ascii?Q?VSLIcLqjwFqfpIPMHebupGFGcOxcQneOGtksrgSAXb/Ectysa//Nw/BCAl6W?=
 =?us-ascii?Q?fqI87g0EZyL4WTBvC9p6dxm28UMlSx9yDde+WnI2Wbge46Pcc11MwWgGXG9W?=
 =?us-ascii?Q?mqq1JTShU0Qp1OpisFux6N/LaxPjQ7KaHsN4ygoJmo4clEdmpjNPSUt2KMIq?=
 =?us-ascii?Q?ITiySTF/6i3psvCFxoJdQqd8tRBGrj827nUa0O5CooJlN8Jh2NZ9atwjMygj?=
 =?us-ascii?Q?93gHAh6W5Wo0fSfw0ZUiTt57IE3sqi7yIjCALkXOyidQqVbYrK9hKhZEdLJ4?=
 =?us-ascii?Q?KRm9LyQGMbmQz5cHbWsHz1DuvBwA+8j71Qm1B8oJAjZ829CmJjULLxL7zDYp?=
 =?us-ascii?Q?eUnpBLSzGD2uAQpUo3vQJ73a1PNjmKjRmYQKS+FdOXBhR0nYa3006L9qb3JW?=
 =?us-ascii?Q?DsTUPjUQRRjCa3xfsp7H+Fdw8lZWeai580+lq6nNkd9ZipoBjq20fkBBsBxz?=
 =?us-ascii?Q?uiYJ+2Z79YVP+bc3AYcwlSCD32r1U921jjIE?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JrJg9zvNHAfNM3vN0+jCI5gUC5WzXFF0xcZbs2q/wYdftZzf4EvYEqNev2d5?=
 =?us-ascii?Q?vI4wgu9fM8snXwYoH978gqEF+JK8ezsuj1vvTQqeEYjHBod7SXdsKFKznyrb?=
 =?us-ascii?Q?Y3ntOQ+zOVw/jrC/oSR1Smm+WK+JZyxfmPgL0FtihfxL/4v/J6k/+9MQI6Ko?=
 =?us-ascii?Q?tHJhy9jmD1vxs2p+AGChst4AbH9oZIWr36VHzdSe1Sn81ElTa3d5B4JFXJTy?=
 =?us-ascii?Q?wBIwH2iZnARSizGHOTvO6IPOLFiggJJt0Sg6CQP9OgDzAM1cmKsWuKHdRNgM?=
 =?us-ascii?Q?Qt1I4jDutHkiRBFCN98kZBKVtqadmOJfIo3ofG+/D4DuJFFd5Q21QcoorGPr?=
 =?us-ascii?Q?Vj8cGDMpRYPk8Fd/sPF3pAKGJj6VZ3uF2+LN4xBb7eAyyG1smUQzdkXpHCzx?=
 =?us-ascii?Q?g8vUhr9a7ELv1DRhaDhKEiD49yw9bznIM1VaYBJLiB91AgMHkOahfoudXFu6?=
 =?us-ascii?Q?Sw9Dm6sUwUi30TzIRat7R2d8RRiyTE7yafQGUhmhIvkwlwheMDyRLZ+4lqve?=
 =?us-ascii?Q?hGRw0hj/C4BiQPVBhd3KINolFPT59iyNvnxFWCY1M8TddK3TuOKTKN4Oik9a?=
 =?us-ascii?Q?fOJGR/tZQIQA5JWIJ6UED/OtZmvOjQrg8yKFPedlfxAVpX1adXdtVsSc7u4B?=
 =?us-ascii?Q?fprM6PIzYdjjkzQnxfMEn0JSDjiWo7Jm9/nUB83MCRgYJXMP3dL+Lwtlzv+E?=
 =?us-ascii?Q?auGgfpAM+jWPCp/Xe7ZHQRHvZt1IBl2ud05qImOznTil6E3+ODW2b8YstdWn?=
 =?us-ascii?Q?WZNW4HCoMiPBQ+hj/t+zjEUdeXB1TiuvT/tAYU20/a3Vm4C1hyKG7npf/XGO?=
 =?us-ascii?Q?QO1Ft1TPjsuFXbgUaR/LrykdlXeRLbGkBTSZFSu55kvVO5uyOuukcALNJCV1?=
 =?us-ascii?Q?hcI3l6I1VANiimeforbDGmHYc8tQvh9mzBpPXuUxDqpIlgDOjrl7qESPMTnC?=
 =?us-ascii?Q?J0EXpb41u1QjXLPRawffuf6hVWGeF+6zbR/ywv84MHEszZpeGy7ZnYkaNHVa?=
 =?us-ascii?Q?6MncLOZvrPXsMw64L8yRizlsCtZPNAbpMPAa1bYm6IEa+6RV55T9DJnAP4qt?=
 =?us-ascii?Q?RNNWKhizmhufRTuhodJNx8VtewUjHRJzKg9+H7UsDApdFKI6m/6EDfPKeGLQ?=
 =?us-ascii?Q?Z9bn9yWQj0nal7KKqHmpODd4eJhdACWXq4lgOEcKxKRy3MWSsPIRxFTGj0u+?=
 =?us-ascii?Q?q5QMRNineiaLikrUtN3GMgM/O4tG6wB0YggM5w6+URk8YjYPA8Bf5BZcs4gy?=
 =?us-ascii?Q?G4WBzF0LgkGmb/9wBYbLLSZPAEi1K6AQ2sBT+3OI2E6AGc0FlY6lEEbzo9PW?=
 =?us-ascii?Q?5tb9f3QqRU4o8dO/olO+vEGDx5oglP251AHERSJLzdvBXvmehtxonGvcd+cg?=
 =?us-ascii?Q?C0iARZSCAqE8+jMTQ+D6abNtnmXm/VCsXk7RbBLGPpgkQMpsBAJFIh15ckwY?=
 =?us-ascii?Q?bGLeeobalNQ6kEQIjEPbAyRjaK/ze/kVjtpnY/MvjaW1xFtQfQPgzZYJhm9D?=
 =?us-ascii?Q?bim9y1FKSlqQmoFgUgwGenBL5QQeCQEbm10TJMn43q14skY8ALBAN0EQVHM+?=
 =?us-ascii?Q?R1oHgnH4Ch2+Gk1aa2Rfz1NnquVeLuxa6tOtVHEq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03f33662-3d20-4c48-7aeb-08de2b1ffba7
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2025 06:09:09.8399 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 37dRyBUrpJ90fISV9YGutsYOc2hWCxGR6UC8T5GfWXU1gpvj8Obm2klWbUl1qcDwjLttmmak5JX29kWaNjFJMYtini8JvZyv2xN3MYGXuIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7049
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Matthew Brost
> Sent: 22 November 2025 06:55
> To: intel-xe@lists.freedesktop.org
> Subject: [PATCH 2/2] drm/xe: Covert return of -EBUSY to -ENOMEM in VM
> bind IOCTL
>=20
> xe_vma_userptr_pin_pages can return -EBUSY but -EBUSY has special meaning
> in VM bind IOCTLs that user fence is pending that is attached to the VMA.
> Convert -EBUSY to -ENOMEM in this case as -EBUSY in practice means we are
> low or out of memory.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c inde=
x
> f9989a7a710c..a87a606ba890 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2448,8 +2448,17 @@ static struct xe_vma *new_vma(struct xe_vm
> *vm, struct drm_gpuva_op_map *op,
>  		if (IS_ERR(vma))
>  			return vma;
>=20
> -		if (xe_vma_is_userptr(vma))
> +		if (xe_vma_is_userptr(vma)) {
>  			err =3D
> xe_vma_userptr_pin_pages(to_userptr_vma(vma));
> +			/*
> +			 * -EBUSY has dedicated meaning that a user fence
> +			 * attached to the VMA is busy, in practice
> +			 * xe_vma_userptr_pin_pages can only fail with -
> EBUSY if
> +			 * we are low on memory so convert this to -
> ENOMEM.
> +			 */
> +			if (err =3D=3D -EBUSY)
> +				err =3D -ENOMEM;
> +		}

Looks correct,=20
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
>  	}
>  	if (err) {
>  		prep_vma_destroy(vm, vma, false);
> --
> 2.34.1

