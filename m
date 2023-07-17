Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050E3C001B0
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jul 2023 20:33:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C86A410E2B2;
	Mon, 17 Jul 2023 20:33:37 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32AD610E04A
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jul 2023 20:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689626015; x=1721162015;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=b/rjDKcLdsbBggQYlJRo0XoBzos1HoMCNgAQuo2ZkyU=;
 b=m3Dd4hDQ5HMA/S4ZkzmZ/6puqEYpU9teb1EVTRUGcIQrHV/et4uK6nDQ
 tOWXR3ADSLvmz1TfohygGpPKJ22JN6HZVBGnRcjzoS4xVoeX3xuKyskXs
 E/jX8cZy5sgqq5zuZkkVSPMnaweJi/ww+ck6keTfYCGXv2j6E3Msa0Ljh
 hbQSeC6DpQf3YLHv9QVncipz/Cn0Bp5KqP02u5PNYwMQi6MmjLUvuKQ2B
 BzaUSUqYn9woSFlNTnxBPNVGzMTC9vyNyNaCf9E5X+WvVbQY1Xs0kcv7A
 aDBoZ/h8Uonrl0/JGQwFYkbNuUu1OGgbrNgF+eMvvHAHERLU4ncZOdgr2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="452408479"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="452408479"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 13:33:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="726685497"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="726685497"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP; 17 Jul 2023 13:33:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 17 Jul 2023 13:33:33 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 17 Jul 2023 13:33:33 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 17 Jul 2023 13:33:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cZWQjC6JtGQa1iFne7/LMCjnwc6VkcTMXTPQp0d+sUtkiyc4MXMAbABaYUKo+D3I+rOutqU0d9FKZFEnQDMk5fNWftmfbSf6snQNuFghgNgi+sA1KJFSOc2FT6cTdRQkbQ7nmRSGn7W165WqI7bZJhvJQShTNVVPbpyr5ea2OVc1sK6cKw7oVTxx9E6h+t9J6uQ0EDsodTwhv/AR8QEHHpsfnpTOfLxtWakjnNdktoiuojuUF161nwRjpQMXajGT1cr8Li1edkYbXTsjG53lR8FNLMOc1rrBrnN/uIrvCJVb+ObbG2RGHqYsRSNWZjp7/EXGp6pwRIpNvuboUOGi/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a2Tj8/LcF+FjPU3ptv5qqkKUMKfB1yN+vcl9YMOCT+s=;
 b=IZQJbK478s/k+PBxW7A6DrdB25IufsLgycoTfNVMVyVKRhNaY2ocoqlMXaqn6vzYx/zk5rMt6E9End+Puh3LvRNbP0S6RAXpZVPC6Nedkabqz1OZVCGCVpWaego+pBeAG8adlFOJ0V+yGXTnHXXetAb2CejRDnNbEMQWO1In37zct6GV9d7dAwMZL3wBq2/ucitJPi8Hf+HlRxQCvfaB2xJ8GgUE2fxjHhf+KCGbzwZ/JfnV0UfevT7nzByGE4sgazmMxET/uBYJRPXLpRagqswa2p6FBu+Cs+R4J+2husRVpyr3Hv5lNYBk9CXWqVmkNexPTUXRXKQXQqQpddqrYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 SJ0PR11MB8293.namprd11.prod.outlook.com (2603:10b6:a03:44f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.28; Mon, 17 Jul
 2023 20:33:30 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::9495:a404:de8b:cad3]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::9495:a404:de8b:cad3%7]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 20:33:30 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH] drm/xe: Fix bo refcounting in
 intel_framebuffer
Thread-Index: AQHZsCThle6Tjdgn60my82TQ/iHbIq++eV+A
Date: Mon, 17 Jul 2023 20:33:30 +0000
Message-ID: <DM4PR11MB6360583FE65B50F61A3E5F2CF43BA@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20230706161130.520247-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20230706161130.520247-1-maarten.lankhorst@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|SJ0PR11MB8293:EE_
x-ms-office365-filtering-correlation-id: dd47d805-0540-4ab6-1566-08db8705152b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z1FHtxeI9iyD65eT8Noj6OZ8VLPDBVtpbuzZFr5WgRVwc5pWAGPT6w/fm5q+bMXZTc8+nafDBqvQEIM62reAJtthVhw2xbycWnB0WM7SrewnS8F6XS2wiQMkF2OaPacy/bFvEPEfFZxmegk65jX2/rs4OenHfBDrToXwXs/Reqs9pldaQpGEllmKAT6WMehGezsJZUImtZ72+C0KAaQzFPCbq3jn5kK+vyu7uAYH0EwkctBEgFfjxasOT/ah3elVSZR9v/0B02/gHW8RaXb7lOa6Pi+zHI9wkpcPzF/EJ+eHeIKBYLeq1zA6eS3a9CXPr6XdVcIfzvR81gcTKZlpNZMUqqkobMYKC+x+UcKSpTCuVI04HqSokL/mbUa72H2k1HuTtVSkbUIrpACLXHqjV8MSWUZ8wsuqF2E3RI/BytbWnAN0UsRinflmVOOTptkYFb1p/3Z0HdNVd/9b0Chk2w1a14Sb8ZemiXIl3LpdN1gGungFRxNWurjVPeo+3j+EgBSl7TfRFvDa1cz414U86jEEJtotaaj6MXvbqh2mtlSnaMHMF9DKQQcipj1wA74LgED9SzZH4ZawtfL2v9iqD/U2NERTy6BStv8VNmFYUlgORQ1AWIMPiJklMEmF8GPb
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(346002)(366004)(396003)(39860400002)(451199021)(478600001)(33656002)(38100700002)(2906002)(5660300002)(110136005)(8676002)(71200400001)(83380400001)(122000001)(8936002)(52536014)(186003)(53546011)(82960400001)(7696005)(38070700005)(66946007)(86362001)(41300700001)(9686003)(26005)(55016003)(6506007)(64756008)(316002)(66556008)(66446008)(66476007)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?s/Ri3AKW5268xpzLDFH+XCCBD7VHPIz46zNpnU60WWf6vUdvCV8vjY3qGSLa?=
 =?us-ascii?Q?k9ZsKDz977fpWQ756Q5jWk1lxbKnA1vHXV50yddivcXW+sr9H0NStUE+uef9?=
 =?us-ascii?Q?LtS8y4YSwfvuSZ+ftpg2tyPw752g35c3xjsDJpJips5l9lU4JPB3MO/SMpzm?=
 =?us-ascii?Q?mteXvwQaob/JRO6d0axtWnob+VXoBl5Xw4UAguuz5MIg2FtfrSDeyzaeEH3u?=
 =?us-ascii?Q?6ze4upEa2YUEevW82N0zZ6+uvRkXjb4hmC7xgoR1H7siUVZHGjR6FCjCxAC9?=
 =?us-ascii?Q?ogMsnmrFIZaaATB0z0fq9LD3gAuLQGIRiiKjIipHj6XpZ46UtS2Ytqbwv+m8?=
 =?us-ascii?Q?aX89hFK2YN+jngZo++KswlXocaUfLs8u3KbOjAbs7vcjB0Mjui7WhOvz/Jco?=
 =?us-ascii?Q?Yt0OLTGwque/esQihpX6u8mjny9AyfuipYrm2W0Uq1oNzx5dDszl09RYtaVX?=
 =?us-ascii?Q?Gy83aG7I9WXDI/auaWPYFput7cVcl8a8E9DS0QU2RRxOht0xSo8O8xxm9nPF?=
 =?us-ascii?Q?gHrqVEEloqu1bVGFpSKMfPhfgndc98K8OfEGM2dlFjJAGuMYnVCNXIOpiwd4?=
 =?us-ascii?Q?bljkdo+kd1PcVk4A6/LRglZXsct6VpDzdV/3t7gKEmy+m+L0vUJmV2IBN0Qh?=
 =?us-ascii?Q?HTaU+lzy2HOnCu0dUCN5pzks5ednqcNi2ecU54nWkdF2eX2+NPgjh2QaWSkn?=
 =?us-ascii?Q?opeHYPzG36/el9EQ1ccVy+VyMO0HtfxpHTp3D71T0t4vPzUkp3Pa+fxmdUx3?=
 =?us-ascii?Q?3UXQigVSsB5VKfYE7WoR2oAviZ+1LJS0WWpE7i0hzC/3+HuFsmeLkSSsNRa+?=
 =?us-ascii?Q?Gt/m4sDOaRwCsrqfHJMdsY8nL3wjBXTpY2Kpn1Sxh6LuVxxgqPrIH4euUHlf?=
 =?us-ascii?Q?8GANnKx/yanHioLNEljugpoSfSFAx4Xu4vyJU8teXUYcHjneGGwfxRlwLD5E?=
 =?us-ascii?Q?PV2ZrLEJggeVppEqpSlEaUJyMUv5lxgYlSU+GgCqiJbyXP1T+O9RwTIWRVt9?=
 =?us-ascii?Q?UVt+/TDeXzJdtrPMnREh381sCFTtjCtosWdWjzWSi/7HoH0Pl+sN4xSRqUH/?=
 =?us-ascii?Q?5XaXrN8ha92XnmChrlMsW9/GD5500vXG3gSYUq+JpyS8PBGVOHbe7BVuCWO4?=
 =?us-ascii?Q?NCM/N3Tc++pDYuqwt1bMk7Rrg9PH6U/8w5Matljp/I+24Z1h7zUWbOgBHKiw?=
 =?us-ascii?Q?2vebS2ot7O+x9xSnDCBeRSkK9b/pHEY9U4m7B7RzXlHGYaFObWemx0zN8azZ?=
 =?us-ascii?Q?pKX3tOCJhnNo5Zv0NFb/YXuvFVazTwI7oGC7Tle5bM3C6m84xfXdMGtODUYH?=
 =?us-ascii?Q?XwECzJmDyWIX5hgu0m63gSFyBU39jvOUvw1pJ6XYCRC4c5dD2zJ6IlNVf1K7?=
 =?us-ascii?Q?lhBjEMUKCbblwisguFtl9pDpqDBbmEs+lLlCnKIcne6m36zBXfc6Cy6KRCpT?=
 =?us-ascii?Q?+s5cY7uxuXFpNpaCXOASSV8qBAiBr55m7Ez23bN9qpm5dtnaX5/x9kFKT/Dg?=
 =?us-ascii?Q?igUNLi0L3cGWTC8Hg9hyFwhK3cJ6GHxT6RHcOauRhcY5L2vLKcvg0Gsu32ci?=
 =?us-ascii?Q?9Jpci+S9pBD0g2YmdUZ+XFwNilUzSbtvXtgq4ddW?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd47d805-0540-4ab6-1566-08db8705152b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2023 20:33:30.2612 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tsQ/0mN3o5GYj221/dJHFydSp7i3hAEaTXkBpaqtqQIBiGlu6pO+18NBc0tRg/PXqr7L3N8qaZgLYmEwb8tMnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8293
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix bo refcounting in
 intel_framebuffer
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Maar=
ten
> Lankhorst
> Sent: Thursday, July 6, 2023 9:42 PM
> To: intel-xe@lists.freedesktop.org
> Subject: [Intel-xe] [PATCH] drm/xe: Fix bo refcounting in intel_framebuff=
er
>=20
> Seems we have various confused refcounting mechanisms.
> intel_frontbuffer.c was holding a reference on the bo, but it should be h=
andled in the
> framebuffer.
>=20
> A few rebases before, there was code that explicitly adds a refcount in i=
ntel_fb_init,
> but chunks of that have disappeared. The changes in xe_plane_initial are =
reminders
> of it.
>=20
> By adding a refcount, we match how drm_gem_framebuffer_helper handles thi=
ngs.
> In i915, this is opaquely (and accidentally?) handled through intel_front=
buffer_get(),
> not going to duplicate that mistake in xe.

Change looks ok to me. Abstracting it in framebuffer should be ok.
As Lucas suggested, since the rebase has caused it would be good to adjust =
this along
with change that started the regression.

Overall approach looks good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

>=20
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_fb.c          | 10 +++++++---
>  drivers/gpu/drm/i915/display/intel_frontbuffer.c |  4 ----
>  drivers/gpu/drm/xe/display/xe_plane_initial.c    |  5 ++---
>  3 files changed, 9 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c
> b/drivers/gpu/drm/i915/display/intel_fb.c
> index d3e8721610794..2ef0a5227c2d3 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.c
> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> @@ -1895,7 +1895,8 @@ static void intel_user_framebuffer_destroy_vm(struc=
t
> drm_framebuffer *fb)
>  		xe_bo_lock_no_vm(bo, NULL);
>  		xe_bo_unpin(bo);
>  		xe_bo_unlock_no_vm(bo);
> -        }
> +	}
> +	xe_bo_put(intel_fb_obj(fb));
>  #endif
>  }
>=20
> @@ -1905,10 +1906,10 @@ static void intel_user_framebuffer_destroy(struct
> drm_framebuffer *fb)
>=20
>  	drm_framebuffer_cleanup(fb);
>=20
> -	intel_user_framebuffer_destroy_vm(fb);
> -
>  	intel_frontbuffer_put(intel_fb->frontbuffer);
>=20
> +	intel_user_framebuffer_destroy_vm(fb);
> +
>  	kfree(intel_fb);
>  }
>=20
> @@ -2125,6 +2126,9 @@ int intel_framebuffer_init(struct intel_framebuffer
> *intel_fb,
>=20
>  		intel_fb->dpt_vm =3D vm;
>  	}
> +#else
> +	/* Hold a reference to object while fb is alive */
> +	xe_bo_get(obj);
>  #endif
>=20
>  	ret =3D drm_framebuffer_init(&dev_priv->drm, fb, &intel_fb_funcs); diff=
 --git
> a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
> b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
> index 64fdc78803815..15d414ed0d731 100644
> --- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
> +++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
> @@ -256,8 +256,6 @@ static void frontbuffer_release(struct kref *ref)
>  	i915_active_fini(&front->write);
>=20
>  	i915_gem_object_put(obj);
> -#else
> -	xe_bo_get(obj);
>  #endif
>  	kfree_rcu(front, rcu);
>  }
> @@ -300,8 +298,6 @@ intel_frontbuffer_get(struct drm_i915_gem_object *obj=
)
>  		rcu_assign_pointer(obj->frontbuffer, front);
>  	}
>  	spin_unlock(&i915->display.fb_tracking.lock);
> -#else
> -	xe_bo_get(obj);
>  #endif
>=20
>  	return front;
> diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c
> b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> index fad4c66a82264..f6caf64b99d54 100644
> --- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
> +++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> @@ -166,6 +166,8 @@ intel_alloc_initial_plane_obj(struct intel_crtc *crtc=
,
>  		drm_dbg_kms(&dev_priv->drm, "intel fb init failed\n");
>  		goto err_bo;
>  	}
> +	/* Reference handed over to fb */
> +	xe_bo_put(bo);
>=20
>  	return true;
>=20
> @@ -265,9 +267,6 @@ static void plane_config_fini(struct intel_initial_pl=
ane_config
> *plane_config)
>  		else
>  			kfree(fb);
>  	}
> -
> -	if (plane_config->vma)
> -		drm_gem_object_put(&plane_config->vma->bo->ttm.base);
>  }
>=20
>  void intel_crtc_initial_plane_config(struct intel_crtc *crtc)
> --
> 2.39.2

