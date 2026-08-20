Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98795C5DF81
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 21:28:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5545C10F18A;
	Thu, 20 Aug 2026 21:28:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WW9hY1LJ";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C9110E228
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 21:28:05 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id F39E260A61;
 Thu, 20 Aug 2026 21:28:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 977AA1F000E9;
 Thu, 20 Aug 2026 21:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787261284;
 bh=YGRprMVhSn0/kR+4Nx56PqIOhNvZpkfszRtp++9Ynhs=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=WW9hY1LJq09MHIm5C1o9SlTthw4gdNxg4BsECBb/vwA1wrzsOjPgigd6sG3kqIA+4
 XVp51Ok7iFTlUiZmN7LkR1n6XmWcOf2OQMffq8BAQvQ+xUEvuMepb/OO06huvcdZ5z
 scrbhfOmvUrX9EyoFpO7JGYGDaxKFsrMET//2MGj8i5Ywt5oluWtGNgNCL9gwhCXCR
 UpN/ALuyodPRsGAPA5+ocVIt3ey0H/h5Ty3ReeA/zjxWkTYsoT3uR2a5tOJ2tEyUW8
 Tx52MFfQzyOKa8PCo++KjawR+7o2H4OL5GUvjLtFxE1uFESqtowL4yw+E+Q4toC32i
 2ryos681C5zFQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/10] drm/xe: Move debug configfs entries to
 xe_configfs_debug.c
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260820210639.107524-17-stuart.summers@intel.com>
References: <20260820210639.107524-12-stuart.summers@intel.com>
 <20260820210639.107524-17-stuart.summers@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 21:28:04 +0000
Message-Id: <20260820212804.977AA1F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Dangling pointer returned by `xe_configfs_get_ctx_restore_mid_bb` =
leads to Use-After-Free during probe.
- [High] Out-of-bounds read in `parse_wa_bb_lines()` when parsing input wit=
hout trailing whitespace.
--

--- Patch [5]: [PATCH 05/10] drm/xe: Move debug configfs entries to xe_conf=
igfs_debug.c ---
commit 099241979e5a310cfae46aa5d3f9fe454fd151cd
Author: Stuart Summers <stuart.summers@intel.com>

drm/xe: Move debug configfs entries to xe_configfs_debug.c

Move the debug specific configfs attributes into the new
xe_configfs_debug.c file under a new debug configfs subdirectory.

> diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.c b/drivers/gpu/drm/xe/=
xe_configfs_debug.c
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_configfs_debug.c

[ ... ]

> +u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
> +				       enum xe_engine_class class,
> +				       const u32 **cs)
> +{
> +	struct xe_config_group_device *dev =3D find_device(pdev);
> +	u32 len;
> +
> +	if (!dev)
> +		return 0;
> +
> +	scoped_guard(mutex, &dev->lock) {
> +		if (cs)
> +			*cs =3D dev->config.debug.ctx_restore_mid_bb[class].cs;
> +
> +		len =3D dev->config.debug.ctx_restore_mid_bb[class].len;
> +	}
> +	config_group_put(&dev->group);
> +
> +	return len;
> +}

[Severity: High]
This is a pre-existing issue, but can this lead to a use-after-free during
driver probe? The pointer is read into the cs argument while holding dev->l=
ock,
but the lock and the config group reference are both released before the
pointer is returned to the caller.=20

If a concurrent write to the configfs attribute executes
ctx_restore_mid_bb_store() and krealloc() frees the old memory, or if the
configfs directory is removed causing xe_config_device_release() to free the
memory, the caller will be left with a dangling pointer.

For example, in xe_lrc.c:setup_configfs_mid_ctx_restore_bb():
       =20
count =3D xe_configfs_get_ctx_restore_mid_bb(to_pci_dev(xe->drm.dev),
                                           hwe->class, &user_batch);
...
memcpy(cmd, user_batch, count * sizeof(u32));
       =20
Can we safely dereference user_batch here without holding the lock?

[ ... ]

> +static ssize_t parse_wa_bb_lines(const char *lines,
> +				 struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX])
> +{
> +	ssize_t dwords =3D 0, ret;
> +	const char *p;
> +
> +	for (p =3D lines; *p; p++) {
> +		const struct engine_info *info =3D NULL;
> +		u32 val, val2;
> +
> +		/* Also allow empty lines */
> +		p +=3D strspn(p, " \t\n");
> +		if (!*p)
> +			break;
> +
> +		ret =3D parse_engine(p, " \t\n", NULL, &info);
> +		if (ret < 0)
> +			return ret;
> +
> +		p +=3D ret;
> +		p +=3D strspn(p, " \t");
> +
> +		if (str_has_prefix(p, "cmd")) {
> +			for (p +=3D strlen("cmd"); *p;) {
> +				ret =3D parse_hex(p, &val);
> +				if (ret < 0)
> +					return -EINVAL;
> +				if (!ret)
> +					break;
> +
> +				p +=3D ret;
> +				dwords++;
> +				wa_bb_append(&wa_bb[info->engine_class], val);
> +			}

[Severity: High]
This isn't a bug introduced by this patch, but does this loop read past the
end of the buffer if the input string does not end with a trailing space
or newline?

In the outer loop, the pointer p is unconditionally incremented by p++ after
each iteration. If parse_hex() processes a token without trailing whitespace
(for example, echo -n 'rcs cmd 1'), it will advance p exactly to the null
terminator. The inner loop terminates because *p is null, and execution
falls through to the end of the outer loop body.=20
       =20
The outer loop then executes p++, advancing the pointer past the null
terminator, and the loop condition *p evaluates out-of-bounds memory.
Could this trigger a slab-out-of-bounds read?

> +		} else if (str_has_prefix(p, "reg")) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820210639.1075=
24-12-stuart.summers@intel.com?part=3D5
