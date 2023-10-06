Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B361E81E1E
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 17:30:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5686710E553;
	Fri,  6 Oct 2023 17:30:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8241610E553
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 17:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696613451; x=1728149451;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=yJfxGso2hVacQEjduRKP/iW8Ny7PPq5EIYHPErQ2nO4=;
 b=TgZQdCuVTxJWojwSR/1wn2FaK2URttYxh6Y//a5nmX1wt6tT+ZjMluOM
 v0DAFjNxp0a6F+nxdTiESqFAeHBTLJDaBRW2InoiDMNc06MU+FI6GH7xn
 nNPnGZvyTNmp+uhRNIxmMXno0By0DlcXxK+4vCBbxZvtNUTalMvJzI5xK
 ITJ2VrrWymyqB/1MlQDCrzxt/0zgDQ6wggp2A8vx8DfQLf2erKZ8A2nSH
 ZjXXRt7ZWFixtsrdK0GCsCJ0s3s6DBeiSe/Dq6diAUHuxi6PW1NPGFX8i
 uZ6xeBSE/MSBDSjXOTMOPlO3NltOfKllTnI3+OVMYY52oR1eooC4v3o1v w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="414790071"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="414790071"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 10:30:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="818078369"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="818078369"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Oct 2023 10:30:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 10:30:50 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 6 Oct 2023 10:30:50 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 6 Oct 2023 10:30:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BLnu7RQrB8hC0ygPOt4P478NVXEGQHy6qaXe+/S2k/yaeJT0ILFs6WDNtC9MoUIGLceLlbeGip5TM1PmavNHxIh/xsG5IMXmKoaXgTpsbjWLIq8nmT45Fs6b+8Yo3TcoXy+AB6yFg5GCBf9GdTRbR501ipFtCZ5Ozn1qHx+TzhtzJ0lqIXvcrAHahRWR9MoEs+vHbgqHxvFOXka3fISkj6eYPzL0megj0BA6UYvHkGzcH2cxxMVwthoAdRIDn4e1tSfKN+8+Yqkrr5czuAyk6uJNlHhgeNHagBtaaxNJe+WdxE8tBnlFJILhtIG9V0WpX2VP2h7o7UeojEcBTNH8sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gGK13dObE6e89Nv4fzDWpSmJJrK2lk7GVGfXpO1SeWY=;
 b=L7EaZzXcMRvlLpoitM2CGzHMy8GBdSyoDjOujZWqR1UP7YaRkC4/V8Q6lq7cKqVU4k06hUyC0XQsq1xowLuRfCqp4cVK889ifWGxO9bjRKC+VAynvwLgJl6jBAY2EixAZXoeoDuj2BOzeFMu/H2OSNbjDJQXvsyijjMdF/WTvnmlmmBZrEPORuo99VqwCFWhMNsjbXClpoequQZpz/f4sTMov/9e5Pb9AwvosQMtq/x9fT5/eWviHeQcGGMdXhiM5OgBwSLbDz8NSJiYbt0tzIF7BvtR5F7L0YGbnhi6uZx5rMvOiRtKksg/WR2cDYY1yJsCMHLPs4WzEbLECIhQew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by DM4PR11MB6094.namprd11.prod.outlook.com (2603:10b6:8:ab::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Fri, 6 Oct
 2023 17:30:48 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::bff0:69bb:b4e7:dacb]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::bff0:69bb:b4e7:dacb%4]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 17:30:48 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH v4 2/3] drm/xe/display: Enable remapped
 display page tables
Thread-Index: AQHZ+Ft+kA5I8EMkgUqg2FP2BIhwurA9BO1w
Date: Fri, 6 Oct 2023 17:30:48 +0000
Message-ID: <IA1PR11MB64186FBA31437DAE7A613186C1C9A@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20231006134540.332716-1-juhapekka.heikkila@gmail.com>
 <20231006134540.332716-3-juhapekka.heikkila@gmail.com>
In-Reply-To: <20231006134540.332716-3-juhapekka.heikkila@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|DM4PR11MB6094:EE_
x-ms-office365-filtering-correlation-id: 830b1002-2145-4074-8fe4-08dbc691faa4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wfi8j1xMYn6QVe0dZ0pxBdRH8Ob0QZ4LeIko4GmVu69HXiAz6jPO2o2+fHCEpYw6TNVuBL4J1MH4/7Wyk+38tXEBHpAafhqcrKURIZReuY7E7iMTIpLfE/lV1dCVpzXdklmLZB7dwowdwm488/SaihFML3spP2ydsOxtXhLr7VLxPS+Y35AWQSYK9ERth/T+a89ihu5vzTvyypCNCGsuEpNeIxSyjajG4u4dHQj6xt00yiPoY2jOmzTGZrkBJvAYyyXchBQSEjxzz+972DU6DTOEITCqDzetyyPKQz0rdEHj4QtBckZVwebuFDPjfVuURc0OaOzJjr2tebcY/ZeiWLvVnhHkUmN+TZSsg4hcBmkUowTEo5hMOfwUXmJG9qG2phPhYdryyRoDRNEGU6lOS+xUirKpGKbUAn6EpNAK9BcYIlDJWpZFgzSCgcpqcYxLoKonshfLrhyH6nvh6nSncKW+BIBDf8eNC17NVHf2ZuKN4gUr/t6VrXK9RIgR86V2OVFg7vR9QeESfU3UqE4LxEuedfmh+ZV8DlwJsN+OXwa8cCJETiqZTAZGvhCc6oMY/MFcH2Y9MWaaXdtx42gm2B1pC6TrHzEmcYcI5Vw7uDJNHVOOzUFxaWWLNorYaYa7
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(396003)(136003)(39860400002)(366004)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(9686003)(71200400001)(6506007)(7696005)(82960400001)(33656002)(38070700005)(38100700002)(86362001)(122000001)(26005)(55016003)(66476007)(64756008)(76116006)(66446008)(66556008)(66946007)(110136005)(41300700001)(2906002)(5660300002)(8936002)(8676002)(52536014)(316002)(83380400001)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EaaR3qVpy5QbRbRtg8rPenlw/4sgfe19sPG4SLTcWpTLdZM+Y1qtASFKF1SE?=
 =?us-ascii?Q?YYL46I9oJDUAVS9wEb0zKbwkV7f9fcyQuioY2pgCUBIzF/mNiVsQSPHmrxuM?=
 =?us-ascii?Q?6AKfgevM+5TleXWN2yKQrwrKLfipALZy0T8XlamdZbkQ/2qV7Yn6l1yzSTKC?=
 =?us-ascii?Q?bA3xesT9lhcCE+uDwogK3XMC3fjD80IxdqLlWHYXs1j1K0z0K/qLLtmW55cj?=
 =?us-ascii?Q?h7cD3VKL01Djt6c3vAz2ywBzOjyBDND1DCzT5hb7Mj23apCiOzGGwI7Qa9zo?=
 =?us-ascii?Q?nqh+LXlgfC0aUDRgoU9IuZ/AIXeKTn+9Px/ZGnRFgJcltvw8o8QOu0kzTNlM?=
 =?us-ascii?Q?gDH/7CmEFZ0kmPd/SNEQiKyA4yQVm8CVVWkVgtELa1U0fr0nYcQMinad5Fz1?=
 =?us-ascii?Q?VkHK0vzcTU3qRuW61xG8VNfaimo0ADulQG+JX9kO9T8qj1IHy0dWk5FkZaBV?=
 =?us-ascii?Q?TeI6BZbZNill69l4MoSJxj/Hl3graXCGJh7OSm72tKCBgwSI1lI0BQ8X1FX0?=
 =?us-ascii?Q?/9Iw4Hkhp92K9jQsCx6hgk7dvlUvf+jeWrd8+qUP0MLup+V19+iN1y/fCsN3?=
 =?us-ascii?Q?4CU59TUhVZYCnzRFHBasSgcPuhjREHfwnUbiuTSG0cKEV4y74MCu8vAdh+iZ?=
 =?us-ascii?Q?8naPKlj/YwP7psHt8qb81r7VDPxVCFmRjJnGJsnjF8n+hqMKbnUHID9CMQZR?=
 =?us-ascii?Q?7oeLpk58pvZnBWtWUHVEmAqouy3Sxv/BT2CvhiUzcto3I3UgxIsJ29O/DmgC?=
 =?us-ascii?Q?24cCnKrGDSmlPHcYk/h1ApO/EvPTv7635dJ1gPsdvEoUDeitGO91JfCc6XX7?=
 =?us-ascii?Q?Ij5EEvxFc2SEyywdXgfNoUNWCJf8Is4m/W+kM8rMrl/3Rn98rGO3KpaM+i/n?=
 =?us-ascii?Q?wIRUvomMWrof6OSQ0UU0IYqlLbx9dF/GR37rMvAxBThsCkBpVA2xGN4nW+yK?=
 =?us-ascii?Q?qeYAlOlZfiyGrzzefnZx1IkPhO/v7zzT0FPXHE4ddmGEZTC1CJharWrlv/Ob?=
 =?us-ascii?Q?7vA8D3/zVcy/FtwRWUscaGQ3SJFpnjB8pnU++4liSr7oaQOZ8li6jLMoFgPW?=
 =?us-ascii?Q?DKqNt0U11PfHcbgjLCFotA3UyR0oslZ0tRylsWHIqxV2dodbsSmlg0iuEmfP?=
 =?us-ascii?Q?kFkobO5sbKPtkhgor7qz1DRztZ0z7b/YwBdtQ5cpEyKY66u28IjRBX0w9LWC?=
 =?us-ascii?Q?sNaqFh+p65o9YKZ8Wkj7881uJeEBxAbZM8tsvByd5LKJ/zBwi1Ojx7/LhCvd?=
 =?us-ascii?Q?0sk8Lq/FmjgWCDK2iN5gfjp3qV91BUSXKM+Z77me2xhtVF4OLzFN+/CPziMJ?=
 =?us-ascii?Q?74T8wwSCsFs8TJlY2pQ0r77tc0VKRDWKNS+/wVEwHe2ViJLj2he2Rul3hO9J?=
 =?us-ascii?Q?zRsnZw81uGXdb8rtFrk5KHWVjm12R7o+8IYRT6haaMVnsOebk09OLZH0GoWL?=
 =?us-ascii?Q?denUmBR/dtBZw0L1D9gLijrAx/mwixKlFCah96ErIbJGFxi57gC1YJMawRlA?=
 =?us-ascii?Q?qMhbMxMUwUNPK1h6ElbRYYV0wFVu/7ZzBgf0E2mJQg/5A7h+tnYqMDHVAEC1?=
 =?us-ascii?Q?HKAMevBqkQPex0PMaku6wF4zrOdXtkHce5ylOgtB?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 830b1002-2145-4074-8fe4-08dbc691faa4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2023 17:30:48.0657 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UimaLbbLEnbd19j9ZynBNQVSGNOWsChGaAqcLPmZre2uiZqqJIPbbDXgvpj3LDjMHrSk/LvYo94dN6nT9cLquU5ulBoByJMpOyJoWzVOOtQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6094
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 2/3] drm/xe/display: Enable remapped
 display page tables
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



>-----Original Message-----
>From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Juha-
>Pekka Heikkila
>Sent: Friday, October 6, 2023 9:46 AM
>To: intel-xe@lists.freedesktop.org
>Subject: [Intel-xe] [PATCH v4 2/3] drm/xe/display: Enable remapped display
>page tables
>
>Enable usage of remapped display page tables where needed.

Looks reasonable.

Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

M

>Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>---
> drivers/gpu/drm/xe/display/xe_fb_pin.c | 21 +++++++++++++++------
> 1 file changed, 15 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>index 8a1cb6c28eb0..e8e38091c8e6 100644
>--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>@@ -88,6 +88,9 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer
>*fb,
>
> 	if (view->type =3D=3D I915_GTT_VIEW_NORMAL)
> 		dpt_size =3D ALIGN(size / XE_PAGE_SIZE * 8, XE_PAGE_SIZE);
>+	else if  (view->type =3D=3D I915_GTT_VIEW_REMAPPED)
>+		dpt_size =3D ALIGN(intel_remapped_info_size(&fb-
>>remapped_view.gtt.remapped) * 8,
>+				 XE_PAGE_SIZE);
> 	else
> 		/* display uses 4K tiles instead of bytes here, convert to
>entries.. */
> 		dpt_size =3D ALIGN(intel_rotation_info_size(&view->rotated) * 8,
>@@ -119,6 +122,18 @@ static int __xe_pin_fb_vma_dpt(struct
>intel_framebuffer *fb,
>
> 			iosys_map_wr(&dpt->vmap, x * 8, u64, pte);
> 		}
>+	} else if (view->type =3D=3D I915_GTT_VIEW_REMAPPED) {
>+		const struct intel_remapped_info *remap_info =3D &view-
>>remapped;
>+		u32 i, dpt_ofs =3D 0;
>+
>+		for (i =3D 0; i < ARRAY_SIZE(remap_info->plane); i++)
>+			write_dpt_remapped(bo, &dpt->vmap, &dpt_ofs,
>+					   remap_info->plane[i].offset,
>+					   remap_info->plane[i].width,
>+					   remap_info->plane[i].height,
>+					   remap_info->plane[i].src_stride,
>+					   remap_info->plane[i].dst_stride);
>+
> 	} else {
> 		const struct intel_rotation_info *rot_info =3D &view->rotated;
> 		u32 i, dpt_ofs =3D 0;
>@@ -240,12 +255,6 @@ static struct i915_vma *__xe_pin_fb_vma(struct
>intel_framebuffer *fb,
> 	if (!vma)
> 		return ERR_PTR(-ENODEV);
>
>-	/* Remapped view is only required on ADL-P, which xe doesn't support.
>*/
>-	if (XE_WARN_ON(view->type =3D=3D I915_GTT_VIEW_REMAPPED)) {
>-		ret =3D -ENODEV;
>-		goto err;
>-	}
>-
> 	if (IS_DGFX(to_xe_device(bo->ttm.base.dev)) &&
> 	    intel_fb_rc_ccs_cc_plane(&fb->base) >=3D 0 &&
> 	    !(bo->flags & XE_BO_NEEDS_CPU_ACCESS)) {
>--
>2.25.1

