Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60BE5C88E7D
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 20:14:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C7210E1C3;
	Tue, 15 Sep 2026 20:14:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NBpm2Oj8";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1921B10E10B;
 Tue, 15 Sep 2026 20:14:44 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id A4F034064B;
 Tue, 15 Sep 2026 20:14:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 528661F000FF;
 Tue, 15 Sep 2026 20:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789503283;
 bh=zXSKz1TNKBhnCcHbjA4TmFmP+8CMVuwA2eZXsz7mBoU=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=NBpm2Oj8erY/LXuYig1QSmcoIo47CaO/RRjICB2DkMHWUyK7eF+vHjoxTKw89vg1m
 fiSTzG9jbiJKFAuJmrWo6CtFjwaXu9fxtmZxftnZh73cwdqOjbA2vGfwW9RLb1Hl7v
 6xA3GFSRWZHqCbK5d0LjkHN6VTTaP568Y0BwyqobSlH51VkNE9SHv8cvH03qPWkCUr
 8xFhFW8fAVRtGjiMjzup4DovgIeLr1T7ni+0zQOZuqmTuwuEInB/GwHHDJCeaYnq9E
 DadAOsRGmI59KmF44R3KHFfnUIjEAEWh+r/0ODJsCvbFJK29wK2aO9DU0xDMw+rSiX
 ByIz4rvq1ptVg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/10] drm/i915/selftests: use intel_gtt_view_is_*()
 helpers more
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <c626ae37eed76d8b94333ba0202fdfe34ec88dd5.1789502902.git.jani.nikula@intel.com>
References: <cover.1789502902.git.jani.nikula@intel.com>
 <c626ae37eed76d8b94333ba0202fdfe34ec88dd5.1789502902.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 20:14:42 +0000
Message-Id: <20260915201443.528661F000FF@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/i915/selftests: incorrect view type check breaks igt_vma_rem=
apped_gtt
--

commit b3029da419b0bcdce00e05ce10b2c3fff729069e
Author: Jani Nikula <jani.nikula@intel.com>

drm/i915/selftests: use intel_gtt_view_is_*() helpers more

This commit replaces direct view type comparisons with intel_gtt_view_is_*()
helpers.

> diff --git a/drivers/gpu/drm/i915/selftests/i915_vma.c b/drivers/gpu/drm/=
i915/selftests/i915_vma.c
> index b16297a6a4e8d..ca340a94f7728 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_vma.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_vma.c
[ ... ]
> @@ -1057,7 +1057,7 @@ static int igt_vma_remapped_gtt(void *arg)
>  				goto out;
>  			}
> =20
> -			GEM_BUG_ON(vma->gtt_view.type !=3D I915_GTT_VIEW_NORMAL);
> +			GEM_BUG_ON(!intel_gtt_view_is_normal(&vma->gtt_view));
> =20
>  			map =3D i915_vma_pin_iomap(vma);
>  			i915_vma_unpin(vma);
[ ... ]
> @@ -1072,7 +1072,7 @@ static int igt_vma_remapped_gtt(void *arg)
>  					u32 exp =3D y << 16 | x;
>  					u32 val;
> =20
> -					if (*t =3D=3D I915_GTT_VIEW_ROTATED)
> +					if (intel_gtt_view_is_rotated(&vma->gtt_view))
>  						src_idx =3D rotated_index(&view.rotated, 0, x, y);
>  					else
>  						src_idx =3D remapped_index(&view.remapped, 0, x, y);

[Severity: Medium]
Will this check always evaluate to false? Earlier in igt_vma_remapped_gtt(),
the vma is pinned with a normal view, and verified with the GEM_BUG_ON
shown above. Because vma->gtt_view is normal, this condition will fail even
when testing a rotated view, incorrectly taking the remapped_index() path
and causing spurious test failures.

Should this check continue to evaluate the original test context instead,
such as by using intel_gtt_view_is_rotated(&view)?

> @@ -1081,7 +1081,7 @@ static int igt_vma_remapped_gtt(void *arg)
>  					val =3D ioread32(&map[offset / sizeof(*map)]);
>  					if (val !=3D exp) {
>  						pr_err("%s VMA write test failed, expected 0x%x, found 0x%x\n",
> -						       *t =3D=3D I915_GTT_VIEW_ROTATED ? "Rotated" : "Remapped",
> +						       intel_gtt_view_is_rotated(&vma->gtt_view) ? "Rotated" : "Re=
mapped",
>  						       exp, val);
>  						i915_vma_unpin_iomap(vma);
>  						err =3D -EINVAL;

[Severity: Medium]
Does this error message also need to check the original view context? For
the same reason as above, if the test fails for a rotated view, it will
incorrectly print Remapped because vma->gtt_view is normal here.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1789502902.gi=
t.jani.nikula@intel.com?part=3D8
