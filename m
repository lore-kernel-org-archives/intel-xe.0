Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9B1CC6B33
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 16:01:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F56E10E796;
	Thu, 15 Oct 2026 16:01:34 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A93F410F603
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 16:01:28 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 6DCEB439E1;
 Thu, 15 Oct 2026 16:01:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 447F31F000C4;
 Thu, 15 Oct 2026 16:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792080088;
 bh=TxXcqoOB+yZr1Vfz/18MQYaT2ydOjcI0rTfXfaIDwV0=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=CA0JWBTQ2qPw3L5CP29l7bAQyfRHLNwMz7lIhzvlrciBvN/VthXkbHlEW2sLiy2O+
 q8QRs5ybp/lqS1FwV1IPa9EBABGQXywfKNy8w2D3639GfDMKjom93p2zF/t74U+Fxg
 HFvzPXYgN8sZdLHhxY2VEwIEGK6ohnn5LBY/ZaJ2ahU47bXjyzZyysl7R+Btvheq+D
 NmtxqHnDMnqUGTIKsHalujIIW8olimSbdd+GAJEca19kNmcayUl1UuW+5Dg32m4jPN
 rsA5a3GI1GJYvhqbX275cLh7mOxcA69sxYrDd6QzOx1npIftB6S5DUtLAFoMGnDoUO
 yilOkVCoOkX9g==
Message-ID: <sashiko-outbox-173121@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] drm/xe: revamp hw reserved PAT index checking
To: "Matthew Auld" <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261015154553.483229-7-matthew.auld@intel.com>
References: <20261015154553.483229-5-matthew.auld@intel.com>
 <20261015154553.483229-7-matthew.auld@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 16:01:25 +0000
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
- [Medium] drm/xe: speculative out-of-bounds read in xe_pat_index_get_coh_m=
ode() via madvise
--

commit a69fb578f40c8fdf51d5e718f8df4b1bc5df612f
Author: Matthew Auld <matthew.auld@intel.com>

drm/xe: revamp hw reserved PAT index checking

This commit changes how PAT index validity is verified. It introduces
xe_pat_index_is_valid() and updates xe_pat_index_get_coh_mode() to validate
the coherency mode directly from the PAT table instead of relying on the ca=
ller.

> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 18e26f04169ab..d0dac1ebd4784 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -294,9 +294,17 @@ static const struct xe_pat_table_entry xe3p_lpg_pat_=
table[] =3D {
>  	[31] =3D XE2_PAT( 0, 0, 3, 0, 3, 3 ),
>  };
> =20
> +bool xe_pat_index_is_valid(struct xe_device *xe, u16 pat_index)
> +{
> +	WARN_ON(pat_index >=3D xe->pat.n_entries);
> +	return xe->pat.table[pat_index].valid;
> +}
> +
>  u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)
>  {
>  	WARN_ON(pat_index >=3D xe->pat.n_entries);
> +	WARN_ON(!xe->pat.table[pat_index].coh_mode ||
> +		xe->pat.table[pat_index].coh_mode > XE_COH_2WAY);

[Severity: Medium]
Could this new check introduce a speculative out-of-bounds array access?

If the bounds check WARN_ON(pat_index >=3D xe->pat.n_entries) is speculativ=
ely
mispredicted, the CPU might execute the read of
xe->pat.table[pat_index].coh_mode using an out-of-bounds index.

This seems reachable with an unmitigated user-controlled index via the
madvise ioctl. While xe_vm_madvise_ioctl() mitigates the index for the first
part of its validation, it then passes the raw user input to
check_pat_args_are_sane():

drivers/gpu/drm/xe/xe_vm_madvise.c:xe_vm_madvise_ioctl() {
    ...
    if (args->type =3D=3D DRM_XE_MEM_RANGE_ATTR_PAT) {
        pat_index =3D array_index_nospec(args->pat_index.val,
                                       xe->pat.n_entries);
        ...
    }

    if (args->type =3D=3D DRM_XE_MEM_RANGE_ATTR_PAT) {
        if (!check_pat_args_are_sane(xe, &madvise_range,
                                     args->pat_index.val)) {
    ...
}

The check_pat_args_are_sane() function then forwards this unmitigated index
to xe_pat_index_get_coh_mode().

>  	return xe->pat.table[pat_index].coh_mode;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015154553.4832=
29-5-matthew.auld@intel.com?part=3D2
