Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DB4F8E497
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 02:21:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B51310E1D3;
	Fri, 17 Apr 2026 02:21:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h6Mdkxj5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A73410E1D3
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Apr 2026 02:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776392459; x=1807928459;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2HbZaCOCynGJu6GqhMuGUTc5S69tUu+fkVmBQldSNX4=;
 b=h6Mdkxj5QVrwQxN0j58knPZrDrGG82dExuvRTjvXc860pphAjURN7sQe
 S1mGFgP7j7fNcB+v8lfGE5Fs4cq63TMECtckdQEP0oNzNCciT23Be4GSS
 dVkzKtszMsxiDbX7odWmMV7+A4xVexGuNrW4qP9LRqtRXPptAskl/DP3v
 PoMow6RHMezPOM3vIezlQEX0PF3PLFGJIM8gBqYIFYR4v27TR/L0hv3pH
 2BjtuHSqjyWUcoHvQcKrMSKrBbREjvdOP2EEe276N1eXyCdu7uSqgbqAY
 KMPU1K1jzj+KeesBMf/jhFKZ5PP5SGQg2ctHfzYq/HH003S3nTcbGR0pn g==;
X-CSE-ConnectionGUID: 0imjCjo3RWWxd52cycBxFQ==
X-CSE-MsgGUID: 7zNPWi8JQ+m3BsmBigRkBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77105500"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="77105500"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 19:20:58 -0700
X-CSE-ConnectionGUID: KNW6lUNySX+nZ/qC7TSDGg==
X-CSE-MsgGUID: YwfYQ8vASHOIKgcs6++IrQ==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 19:20:57 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 19:20:46 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 16 Apr 2026 19:20:46 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.47) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 19:20:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BwTDMtsDnFCsxPkCcqYGSIiQ5nTx5ZOBkVAAR77SBuU3jHrgy/Qo2NgR6cNOHUiI2dOOBUgO9IZGLoHLe14bA/itb4X75nOZY/35S0uvDefTOMKR6U/2p6CFfPkvKxUVR57jquZ7jf7ujNcJkA2/AYwEHlqaO+1zf8wkez6o5Q5Uim+6t4USwbG8BRraClbXpwIU+znZEHa88HySpmcXEcGLXz3Wl6UvPlZZj2DmsSWVXuy6Me6X4Q8f4CZcSIZcTQ/Wp1lc8keqzMSsTgkMYstBRkZbx1Sr/XrR5vvM4FRnofOwXyb2SH0eFEnbDqLLH5oWwkaP0Xfx6T965yCAtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvnn8h08b8tusKC4ECIt6bGbqhgPHfgvA7wYH1PQ5BQ=;
 b=MdSxoiGxk06vugumYcMXYA2F9kxGTIuHw7ST6frHm2KLagGGFnVZWEJH7JdajZVPY2WQuNmPTahZqjTJCEF9qQvXSSv52/4Dwc6Lz672E5sQC/Q6qxD9mD2u9UUse2AhqWetKkxYj6SB6QQyKkuZiBIyQtKXSK4YvJQjv13HjsGIvx7DXZp9EJpdz3D9gJrbV25l72Y/xL58bcvvKHA+Vm0zyd3M3r9uWBoPd9g2mrOcVmgc1uV6WNsGBVqD9f/emqi3Y1GgaSDopvyces/HNydgvt5c6ygBeMmjWuSnXY60RJODUkH8WqcJttlTTRsOm1ELOG47YHuwQq47994s7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by BL1PR11MB5288.namprd11.prod.outlook.com (2603:10b6:208:316::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Fri, 17 Apr
 2026 02:20:44 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9818.017; Fri, 17 Apr 2026
 02:20:44 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Sousa, Gustavo"
 <gustavo.sousa@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v2] drm/xe/hdcp: Add NULL check for media_gt in
 intel_hdcp_gsc_check_status()
Thread-Topic: [PATCH v2] drm/xe/hdcp: Add NULL check for media_gt in
 intel_hdcp_gsc_check_status()
Thread-Index: AQHczc1j1uVAU1DO+EWGE3POKJ/atbXiFVWAgABsQuA=
Date: Fri, 17 Apr 2026 02:20:44 +0000
Message-ID: <DM4PR11MB54568743003BC9EF6F00FBF6EA202@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260416-check-for-null-media_gt-in-intel_hdcp_gsc_check_status-v2-1-9adb9fd3b621@intel.com>
 <20260416193733.GG755471@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20260416193733.GG755471@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|BL1PR11MB5288:EE_
x-ms-office365-filtering-correlation-id: dee07f16-e061-4856-21d9-08de9c27edf5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: B3Smkl5GhAclSEauQy4L3dOzwFPIoyyt1GS+UagzxKtxwbg4tXKtQMcHZ3qqbGUQOwy/8ma28uDPMPr3CgSyIODSsXLh/Rvcbpd0iO4C8AG7LpqSmI/48R3DVfnCobwsl8aVqVITpoxqhjyLKegikcKqdeENwa4G9oa+qe4LBnKv802dR5SW1IEW3WkN1Hj+Xiqx9huLMTqjm9srZF4EVuCXwbjk28D6rijaCA0n4kNKYwkrC50ADoZDdJPFwb0B4RNa8UcAZTTOx5XttYsxe2issr8zF+9meR+43KxuehsAPq6VSFl4O6RdBv3e2nxRv769XLpWV9CHdWckdQQR7naTh+vVlaj39vACnSXFXpsjRs1BReEOBDSRk/f2jswNi+O7mA6nbic7nBQDqphAKilpwxHcHUK3JpxusY2eUbmQkLOxnCOgNl2d8mKuM6FDu7cgJLwIkiNpsddNqMDWlErzdAH1vabb4UKXqNKZlrD0mXQUwYQk49IlUcDw+SpnhzKTkGP8RmxzCki+iEx/HgTeg+s6r24ao62U4QPJlsomQgssgNY08gKlXr0CNQJUjUPZgDh9UAlY4HZcpwnW2KR2SnSaQHd7Sezgl84mWzL+ui/zezoQeEV6dki9c6yFDyaKfYPOM6Lwa+oy4OolP9llFmxn+Z3eIIYAX8Emk0GYAdZCwyJbeTEy76MVSGojg1QJrave66KT9wEhbVCkgGSonnVXk6jU+WcQ/GOJ4I+dqpLrhhjxcSGIF2+LKCDh
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PjKDfLagQRkGGq9HpzqqPwYXxGOhi3qmqWVJ1T64owy3aWxzI6F0u+eibfUP?=
 =?us-ascii?Q?qaXc6csETcLumOg36j/K1P6F+je6tibDI9MBEN64sagofcOVmdKX6l1ndwT/?=
 =?us-ascii?Q?7p3YtRzxjq7E6XVLANbnn6lCmXf2afmFsewOU6XgJMMxGzT2QN+TUU380g31?=
 =?us-ascii?Q?S+vdRJ1JYKVOT82MVR/D7EPo28u2Qx+j4l/3MwfLT2d9AzlpefrCGYA9gJcz?=
 =?us-ascii?Q?CN4qBDGww/6+izZelEdki8ymi1LNfXvJngxlLPQiO431H4CVKSVJD68qEYOI?=
 =?us-ascii?Q?i/+8kewCnzNYo8mQSBxUt5fHVGl9pgUPOCUt9BD/ljzc+xDejOPU6plBhmOY?=
 =?us-ascii?Q?JV93UJNZTKPFRCj0RgjUKWHqqY12hgDU8kIrTEHgQn1FdeRTL8Y+sbABVCEe?=
 =?us-ascii?Q?7e0S/6as33QX5y6zrfmJthnveyAhlC9gnjV9E5fNEemxyPs91ti8Tdqo3hTM?=
 =?us-ascii?Q?RTW0dJipuJhN59W9uIYPG6eCINgBTlXDNjb9LXYPxoyddzrbXqboVibgRrXu?=
 =?us-ascii?Q?TSv03UNCUE0RY+yWBWX302WcNJVw6govyeRYjJYAsu2uAiyLlBDQ51qAF6ax?=
 =?us-ascii?Q?+n3PMIx6gkq68lnQ7yD8qhOXHMQr3ogrryaczXbWE7JJFqlzGyDAJv4m4VY7?=
 =?us-ascii?Q?3odKKZrC80dJPgkgHLTDtTEIqC2Jng0AwGBrzaYRDnWDynfxFwH4qleE7SvB?=
 =?us-ascii?Q?c1OBtFwwVUJlnSJ3VFLvrYYMZy5Lke1kK0zp54y/kdyc6adSCogxM2Mehyvy?=
 =?us-ascii?Q?uJm8ZGvVfpI/DiUN3z2I0NhQN+2IdxZOS3HkahmO7wuhgPewD/5apVkSYzWs?=
 =?us-ascii?Q?aEzsJO2WgLKRsIWeM/0rSe6eYVux5gvp2phzbAdIoGTCtnmPrg+kqc7Jw+VF?=
 =?us-ascii?Q?3dSZYMax1ueiyy+sFxGcPCkfmS7/YuRcvaWWraVP3HK2C5r+crTbs8L2Sglj?=
 =?us-ascii?Q?XSJyjCyFQM1ydhcfoa62yf9GFzOjRpn3adpF2mSRKnLGImZl1B7ntNYEOwvu?=
 =?us-ascii?Q?HXYo21VllRpoF9CYKbQlmcWVRWIyObFf54nTjjQnPaEUTLruCMyG8hHjeDW+?=
 =?us-ascii?Q?PNte9lyMhDYQMbrIE5uIBx9lQrsaO1sGJAj+CVJv+0AwPAKFi2Rt7+HzBCiP?=
 =?us-ascii?Q?pYLs3fEei/rGn+QuxYTBJYp5VZBwCfXL8iCANvVwC541f1UX6JQstUptcGzV?=
 =?us-ascii?Q?W8JM+G+xMKuM/wg26oQ19Ln/vn4YEcsaudPaM68vvEfc+vMIpA8gVc8cVCYC?=
 =?us-ascii?Q?CZEq2k6csSuEavfg4b2V5FlCdancu6yCjDyjgZ7yBtVEZmNrWi/ny3O6xZPf?=
 =?us-ascii?Q?hVWkPERuJr5w1ekdXgZmK6ryIce/vVdozUqC+QuNmmGJ4MmeNW5vW11hEfNq?=
 =?us-ascii?Q?RlKh199jZwAnHcmLFjhJ/0Ict+MDh/dllPwPNtLlL5vBWuFpLeLVZeiyoP5W?=
 =?us-ascii?Q?nA9oGhyKlMzZDBjgkMeaanjQH7733PFprdnKRnKrbIgVbJ/dWfVsRBrFkI1c?=
 =?us-ascii?Q?6u9sQQITopXTTuZIOPyngidNy2/18C3uXAd8albm/7Qowo6clreENszzfcDm?=
 =?us-ascii?Q?BkL/KekVbIVVeJYATUd9DBiavTpLJHTb0tdrLCeStjv7axQeagB6upq3qB8Y?=
 =?us-ascii?Q?Vs5K1g9LnoM33Mio0KpYhWHKlhs6OhMcfwAKT8qeviD/QqM8JcRrnEmbrIzF?=
 =?us-ascii?Q?LT4lEqygzNIHG1ZbTayFUhaKzgrMwqkpR5rn6v7vp4ZLNAbUk7xnHP8OQHHX?=
 =?us-ascii?Q?dr4JQwws/Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: rjlxNOenRZZCJc6urbAQ+BsIj9N4M4R8sr9fmeOQ0QcGmyRR6/GPimiJuvg8KADC5uM4KeD1uFKt4/HQLgLKjymeYDbHxqWpcaNPcbtRk0O0lH54xZlyvUfIIpHQKpTiZspmPDBNZKWz+fltNsgT27Y6pFALdt0cTSDf82Z/sDRNm63rTpU+fkQPqnT2+o99OLzbVtsKDeJ7qYYyJdiW+g6liZ4rGw2eJIL1vnaUjTzgUn5MYG/q4Z8kxlIm6ReHqSwubY99SoEgsvwhb7TQNw6g5RmEN/hW5oGh4Ln99OcZUaKxzzt694A0ytOh9NSnoTPX7dUgZvynVH50jOb/KA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dee07f16-e061-4856-21d9-08de9c27edf5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2026 02:20:44.2593 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dJMRQ2RWP8Iw4tg7oqH0Xnekps//5DN++AZK4nV/CGB6eoF+24DDtG14ZJvOoRv7eGLvrpf5etF8hkXCcKhGmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5288
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

On Thu, Apr 16, 2026 12:38 PM Matthew Roper wrote:
> On Thu, Apr 16, 2026 at 03:17:19PM -0300, Gustavo Sousa wrote:
> > When media GT is disabled via configfs, there is no allocation for
> > media_gt, which is kept as NULL.  In such scenario,
> > intel_hdcp_gsc_check_status() results in a kernel pagefault error due
> > to &gt->uc.gsc being evaluated as an invalid memory address.
> >
> > Fix that by introducing a NULL check on media_gt and bailing out early
> > if so.
> >
> > While at it, also drop the NULL check for gsc, since it can't be NULL
> > if media_gt is not NULL.
> >
> > v2:
> >   - Get address for gsc only after checking that gt is not NULL.
> >     (Shuicheng)
> >   - Drop the NULL check for gsc. (Shuicheng)
> >
> > Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> > Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>=20
> We should probably also have
>=20
> Fixes: 4af50beb4e0f ("drm/xe: Use gsc_proxy_init_done to check proxy
> status")
> Cc: <stable@vger.kernel.org> # v6.10+
>=20
> too?  Or I guess we could make the argument that there don't seem to be a=
ny
> real devices without the media GT, so it only became possible to trigger =
this
> once we added configfs support for manually disabling GTs?
> In that case,
>=20
> Fixes: 7abd69278bb5 ("drm/xe/configfs: Add attribute to disable GT types"=
)
> Cc: <stable@vger.kernel.org> # v6.19+
>=20
> minimizes the number of kernel versions this would be backported to.

Is it possible that we have future platform that does not have media gt, an=
d be supported with old kernel?
For that case, it should be supported with dkms, so this Fixes tag should n=
ot affect. Is it right?
So, I prefer this Fixes tag.

LGTM.
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>

>=20
>=20
> Anyway, the change itself is
>=20
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>=20
> > ---
> > Changes in v2:
> > - EDITME: describe what is new in this series revision.
> > - EDITME: use bulletpoints and terse descriptions.
> > - Link to v1:
> > https://patch.msgid.link/20260302-check-for-null-media_gt-in-intel_hdc
> > p_gsc_check_status-v1-1-163d5f826b30@intel.com
> > ---
> >  drivers/gpu/drm/xe/display/xe_hdcp_gsc.c | 12 ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> > b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> > index 29c72aa4b0d2..33494b86205d 100644
> > --- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> > +++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> > @@ -37,9 +37,17 @@ static bool intel_hdcp_gsc_check_status(struct
> drm_device *drm)
> >  	struct xe_device *xe =3D to_xe_device(drm);
> >  	struct xe_tile *tile =3D xe_device_get_root_tile(xe);
> >  	struct xe_gt *gt =3D tile->media_gt;
> > -	struct xe_gsc *gsc =3D &gt->uc.gsc;
> > +	struct xe_gsc *gsc;
> > +
> > +	if (!gt) {
> > +		drm_dbg_kms(&xe->drm,
> > +			    "not checking GSC status for HDCP2.x: media GT not
> present or disabled\n");
> > +		return false;
> > +	}
> > +
> > +	gsc =3D &gt->uc.gsc;
> >
> > -	if (!gsc || !xe_uc_fw_is_available(&gsc->fw)) {
> > +	if (!xe_uc_fw_is_available(&gsc->fw)) {
> >  		drm_dbg_kms(&xe->drm,
> >  			    "GSC Components not ready for HDCP2.x\n");
> >  		return false;
> >
> > ---
> > base-commit: 9ac7dca8d82a4e6d9806ac6c991f0777338833bb
> > change-id:
> > 20260302-check-for-null-media_gt-in-intel_hdcp_gsc_check_status-
> 071898
> > b8a402
> >
> > Best regards,
> > --
> > Gustavo Sousa <gustavo.sousa@intel.com>
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
