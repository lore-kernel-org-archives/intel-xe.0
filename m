Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93316FD5F99
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 09:04:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF7A10E603;
	Wed,  8 Apr 2026 09:04:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KzW+a7hi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E9C10E601;
 Wed,  8 Apr 2026 09:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775639055; x=1807175055;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=JJZDagYjxZUP3O7R91CiKSMPGzOGuHV5ArAnlj5/6yE=;
 b=KzW+a7hiyIeo51SiZB83yYhnRdjyjTbjPoKsGBbX9GEon4LNLxsVGFdu
 DSDP8uhIVXYvmwsfa8MM/rrh3x0eoEO8BuMpUzY+EqIweL/wxRCvY9xZ9
 9Zu6sfH1Ligkx8tdlFbVfvHk3RHN7JnTDRDFiLBDxSGz13ifyhj1OXi6j
 LuvqEwuvvj9lyI1mNoMat8vHb2wETzLt2a3vpEK9PEWyVXiHFhr9VvxGh
 iZmeJpLNXzEugt/G3G9t5Ya7s6YBWiArbi8y5zW1767IL8Sc5/doRAxaj
 wsZ/lUDrMGFB4ZjtaQPiwNgwQ/zY8zxYFvBtn5GOyaJzWTXr1j6CvhKta w==;
X-CSE-ConnectionGUID: clCIt/+ZRNSAyBxEDDsfyg==
X-CSE-MsgGUID: ygCRX0mIRpGBFYlhCiZhww==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="75786048"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="75786048"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 02:04:14 -0700
X-CSE-ConnectionGUID: hPPJSF6EQFuzEELb/F1/LA==
X-CSE-MsgGUID: ieFdFID1RwmXlSy6uRLV9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="221867694"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.32])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 02:04:12 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 11/12] drm/i915/selftests:  Use i915_gtt_view_is_*()
In-Reply-To: <4ffd08679102f08e571b30483894c06cad95c175@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260407155053.32156-1-ville.syrjala@linux.intel.com>
 <20260407155053.32156-12-ville.syrjala@linux.intel.com>
 <4ffd08679102f08e571b30483894c06cad95c175@intel.com>
Date: Wed, 08 Apr 2026 12:04:09 +0300
Message-ID: <9cdb25fde7b0df5a574a778dd1bcb3b41f345d40@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 08 Apr 2026, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Tue, 07 Apr 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
>> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>>
>> Replace the naked GTT view type checks with the new
>> i915_gtt_view_is_*() helpers. This isolates some of
>> the code from GTT view implementation details.
>>
>> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Oh, double space in the Subject.

>
>> ---
>>  drivers/gpu/drm/i915/selftests/i915_vma.c | 23 +++++++++++------------
>>  1 file changed, 11 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/selftests/i915_vma.c b/drivers/gpu/drm=
/i915/selftests/i915_vma.c
>> index 258557388a2d..60dbc6e04f43 100644
>> --- a/drivers/gpu/drm/i915/selftests/i915_vma.c
>> +++ b/drivers/gpu/drm/i915/selftests/i915_vma.c
>> @@ -533,12 +533,11 @@ assert_remapped(struct drm_i915_gem_object *obj,
>>  	return sg;
>>  }
>>=20=20
>> -static unsigned int remapped_size(enum i915_gtt_view_type view_type,
>> +static unsigned int remapped_size(const struct i915_gtt_view *view,
>>  				  const struct intel_remapped_plane_info *a,
>>  				  const struct intel_remapped_plane_info *b)
>>  {
>> -
>> -	if (view_type =3D=3D I915_GTT_VIEW_ROTATED)
>> +	if (i915_gtt_view_is_rotated(view))
>>  		return a->dst_stride * a->width + b->dst_stride * b->width;
>>  	else
>>  		return a->dst_stride * a->height + b->dst_stride * b->height;
>> @@ -606,11 +605,11 @@ static int igt_vma_rotate_remap(void *arg)
>>  			max_offset =3D max_pages - max_offset;
>>=20=20
>>  			if (!plane_info[0].dst_stride)
>> -				plane_info[0].dst_stride =3D view.type =3D=3D I915_GTT_VIEW_ROTATED=
 ?
>> +				plane_info[0].dst_stride =3D i915_gtt_view_is_rotated(&view) ?
>>  									plane_info[0].height :
>>  									plane_info[0].width;
>>  			if (!plane_info[1].dst_stride)
>> -				plane_info[1].dst_stride =3D view.type =3D=3D I915_GTT_VIEW_ROTATED=
 ?
>> +				plane_info[1].dst_stride =3D i915_gtt_view_is_rotated(&view) ?
>>  									plane_info[1].height :
>>  									plane_info[1].width;
>>=20=20
>> @@ -632,7 +631,7 @@ static int igt_vma_rotate_remap(void *arg)
>>  						goto out_object;
>>  					}
>>=20=20
>> -					expected_pages =3D remapped_size(view.type, &plane_info[0], &plane=
_info[1]);
>> +					expected_pages =3D remapped_size(&view, &plane_info[0], &plane_inf=
o[1]);
>>=20=20
>>  					if (view.type !=3D I915_GTT_VIEW_NORMAL &&
>>  					    vma->size !=3D expected_pages * PAGE_SIZE) {
>> @@ -664,13 +663,13 @@ static int igt_vma_rotate_remap(void *arg)
>>=20=20
>>  					sg =3D vma->pages->sgl;
>>  					for (n =3D 0; n < ARRAY_SIZE(view.rotated.plane); n++) {
>> -						if (view.type =3D=3D I915_GTT_VIEW_ROTATED)
>> +						if (i915_gtt_view_is_rotated(&view))
>>  							sg =3D assert_rotated(obj, &view.rotated, n, sg);
>>  						else
>>  							sg =3D assert_remapped(obj, &view.remapped, n, sg);
>>  						if (IS_ERR(sg)) {
>>  							pr_err("Inconsistent %s VMA pages for plane %d: [(%d, %d, %d, %d=
, %d), (%d, %d, %d, %d, %d)]\n",
>> -							       view.type =3D=3D I915_GTT_VIEW_ROTATED ?
>> +							       i915_gtt_view_is_rotated(&view) ?
>>  							       "rotated" : "remapped", n,
>>  							       plane_info[0].width,
>>  							       plane_info[0].height,
>> @@ -1009,7 +1008,7 @@ static int igt_vma_remapped_gtt(void *arg)
>>  				goto out;
>>=20=20
>>  			if (!plane_info[0].dst_stride)
>> -				plane_info[0].dst_stride =3D *t =3D=3D I915_GTT_VIEW_ROTATED ?
>> +				plane_info[0].dst_stride =3D i915_gtt_view_is_rotated(&view) ?
>>  								 p->height : p->width;
>>=20=20
>>  			vma =3D i915_gem_object_ggtt_pin(obj, &view, 0, 0, PIN_MAPPABLE);
>> @@ -1032,7 +1031,7 @@ static int igt_vma_remapped_gtt(void *arg)
>>  					unsigned int offset;
>>  					u32 val =3D y << 16 | x;
>>=20=20
>> -					if (*t =3D=3D I915_GTT_VIEW_ROTATED)
>> +					if (i915_gtt_view_is_rotated(&view))
>>  						offset =3D (x * plane_info[0].dst_stride + y) * PAGE_SIZE;
>>  					else
>>  						offset =3D (y * plane_info[0].dst_stride + x) * PAGE_SIZE;
>> @@ -1064,7 +1063,7 @@ static int igt_vma_remapped_gtt(void *arg)
>>  					u32 exp =3D y << 16 | x;
>>  					u32 val;
>>=20=20
>> -					if (*t =3D=3D I915_GTT_VIEW_ROTATED)
>> +					if (i915_gtt_view_is_rotated(&view))
>>  						src_idx =3D rotated_index(&view.rotated, 0, x, y);
>>  					else
>>  						src_idx =3D remapped_index(&view.remapped, 0, x, y);
>> @@ -1073,7 +1072,7 @@ static int igt_vma_remapped_gtt(void *arg)
>>  					val =3D ioread32(&map[offset / sizeof(*map)]);
>>  					if (val !=3D exp) {
>>  						pr_err("%s VMA write test failed, expected 0x%x, found 0x%x\n",
>> -						       *t =3D=3D I915_GTT_VIEW_ROTATED ? "Rotated" : "Remapped",
>> +						       i915_gtt_view_is_rotated(&view) ? "Rotated" : "Remapped",
>>  						       exp, val);
>>  						i915_vma_unpin_iomap(vma);
>>  						err =3D -EINVAL;

--=20
Jani Nikula, Intel
