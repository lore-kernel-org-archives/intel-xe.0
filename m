Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D06606A320
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 02:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W8aWGXu5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27F8410E7E9;
	Thu, 19 Nov 2026 02:00:55 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1512E10E7E9
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 02:00:49 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 1E67B63522;
 Thu, 19 Nov 2026 02:00:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACBFF1F000C4;
 Thu, 19 Nov 2026 02:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795053647;
 bh=sDjJmvzTSztbbZ543WdXFZl/PoLIg0s+fUG09hqTlvA=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=W8aWGXu5YQiHtfTWJ1gCikQ635FnXbCu28nLpgCYfbRqIYWKQJmxTV1p4UWRP20lT
 l7+fBQD06rUJfyF4qsNbneieq0jMZmKOYpmZoS3EyYoAbyZO5yWdrsos/SVymPZxmG
 C+g6Op7r/mofc4w+Ujy1fnmg+ZnUGs2AEEpOPSa2MiS5MS/KmHOIuQiGp1gQVSt5jN
 wT2VmQCovVUrWLX0zMfD37LIek7ocpRhMekAULpImtc2neNRDH7vhXShVKNl0LOSMH
 qslV+2ud7hOWhlQRa/zuCr/5hw01syE2dW+k8QM1EGg09l/buZAarTo/bG2//mVXDq
 dAzmtFM2GaLFQ==
Message-ID: <sashiko-outbox-222315@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe: Add GuC FW path configfs overrides
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261119014602.243548-2-daniele.ceraolospurio@intel.com>
References: <20261119014602.243548-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 02:00:47 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] drm/xe/configfs: 1-byte OOB write in __gt_guc_override_show()
- [Medium] drm/xe/configfs: empty override in __gt_guc_override_store()
  disables GuC
- [Medium] drm/xe: unchecked drmm_kstrdup() failure in
  xe_configfs_guc_override()
- [Low] drm/xe/configfs: missing guc_overrides in
  dump_custom_dev_config()
--

commit f425c98fc376b284cd705ef5abb819f7ae2fc52d
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

drm/xe: Add GuC FW path configfs overrides

This commit adds per-GT configfs attributes (primary_gt_guc_override and
media_gt_guc_override) to override the GuC firmware path independently for
the primary and media GTs.

> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_con=
figfs.c
> index 2ddd707a6dbd3..b6b544c3bc9da 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
[ ... ]
> @@ -309,6 +329,11 @@ struct xe_config_group_device {
>  			unsigned int max_vfs;
>  			bool admin_only_pf;
>  		} sriov;
> +
> +		struct {
> +			char *primary_gt;
> +			char *media_gt;
> +		} guc_overrides;
>  	} config;
> =20
>  	/* protects attributes */
> @@ -331,6 +356,10 @@ static const struct xe_config_device device_defaults=
 =3D {
>  		.max_vfs =3D XE_DEFAULT_MAX_VFS,
>  		.admin_only_pf =3D XE_DEFAULT_ADMIN_ONLY_PF,
>  	},
> +	.guc_overrides =3D {
> +		.primary_gt =3D NULL,
> +		.media_gt =3D NULL,
> +	},
>  };

[Severity: Low]
Should dump_custom_dev_config() also print guc_overrides.primary_gt and
guc_overrides.media_gt?  When either override is set, memcmp() in
xe_configfs_check_device() logs "Found custom settings in configfs" and
calls dump_custom_dev_config(), which does not include the new fields.

> @@ -937,6 +966,84 @@ static ssize_t ctx_restore_post_bb_store(struct conf=
ig_item *item,
>  	return wa_bb_store(dev->config.ctx_restore_post_bb, dev, data, sz);
>  }
> =20
> +static ssize_t __gt_guc_override_show(struct xe_config_group_device *dev,
> +				      char **override, char *page)
> +{
> +	guard(mutex)(&dev->lock);
> +
> +	return sprintf(page, "%s\n", *override ? *override : "no override");
> +}
> +
> +static ssize_t __gt_guc_override_store(struct xe_config_group_device *de=
v,
> +				       char **override, const char *page, size_t len)
> +{
> +	char *path;
> +
> +	if (len > PATH_MAX)
> +		return -EINVAL;

[Severity: High]
Can __gt_guc_override_show() write 1 byte past the end of the PAGE_SIZE
configfs read buffer?

In fs/configfs/file.c, fill_write_buffer() caps writes at
SIMPLE_ATTR_SIZE - 1 (4095) bytes, so len > PATH_MAX (4096) in
__gt_guc_override_store() accepts a 4095-byte string without a trailing
newline and stores a 4095-character string in *override.  When the
attribute is read back, fill_read_buffer() passes a PAGE_SIZE (4096-byte)
buffer to __gt_guc_override_show(), and sprintf(page, "%s\n", *override)
writes 4095 characters, '\n', and '\0' (4097 bytes).  Using sysfs_emit()
in __gt_guc_override_show() and rejecting len >=3D PATH_MAX in
__gt_guc_override_store() would avoid this overflow.

> +
> +	guard(mutex)(&dev->lock);
> +	if (is_bound(dev))
> +		return -EBUSY;
> +
> +	/*
> +	 * An empty string disables the override. Some bash commands can add a
> +	 * '\n' or '\0 ' at the end of the string, so consider a string of
> +	 * length 1 containing one of those characters as empty.
> +	 */
> +	if (!len || (len =3D=3D 1 && (page[0] =3D=3D '\n' || page[0] =3D=3D '\0=
'))) {
> +		kfree(*override);
> +		*override =3D NULL;
> +	} else {
> +		path =3D krealloc(*override, len + 1, GFP_KERNEL);
> +		if (!path)
> +			return -ENOMEM;
> +
> +		memcpy(path, page, len);
> +
> +		/*
> +		 * the echo command adds a trailing newline unless the -n option
> +		 * is used, so replace it if present.
> +		 */
> +		if (path[len - 1] =3D=3D '\n')
> +			path[len - 1] =3D '\0';
> +		else
> +			path[len] =3D '\0';
> +
> +		*override =3D path;
> +	}

[Severity: Medium]
Can writing a NUL byte followed by a newline (e.g. "echo -e '\0'", where
len =3D=3D 2 and page[0] =3D=3D '\0') store a non-NULL empty string in *ove=
rride?

Because the empty-string check requires len =3D=3D 1, a 2-byte "\0\n" input
takes the else branch and stores a buffer starting with '\0'.  During
probe, xe_configfs_guc_override() duplicates that empty string and
uc_fw_override() sets uc_fw->path to "", which causes uc_fw_request() to
mark GuC firmware as XE_UC_FIRMWARE_DISABLED and xe_wopcm_init() to fail
probe with -EINVAL.  Checking page[0] =3D=3D '\0' regardless of len (or
checking !strlen(path)) would treat any NUL-leading write as empty.

[ ... ]

> @@ -1479,6 +1592,43 @@ u32 xe_configfs_get_ctx_restore_post_bb(struct pci=
_dev *pdev,
>  	return len;
>  }
> =20
> +/**
> + * xe_configfs_guc_override - get configfs guc override path
> + * @pdev: pci device
> + * @gt_type: type of the GT for which to get the guc override path
> + *
> + * Return: A new drmm-managed allocation containing the path to the spec=
ified GT
> + * guc override if set, NULL otherwise
> + */
> +const char *xe_configfs_guc_override(struct pci_dev *pdev, enum xe_gt_ty=
pe gt_type)
> +{
> +	struct xe_config_group_device *dev =3D find_xe_config_group_device(pdev=
);
> +	struct drm_device *drm =3D pci_get_drvdata(pdev);
> +	const char *override, *path =3D NULL;
> +
> +	if (!dev)
> +		return NULL;
> +
> +	if (!drm)
> +		goto out_put;
> +
> +	scoped_guard(mutex, &dev->lock) {
> +		if (gt_type =3D=3D XE_GT_TYPE_MAIN)
> +			override =3D dev->config.guc_overrides.primary_gt;
> +		else if (gt_type =3D=3D XE_GT_TYPE_MEDIA)
> +			override =3D dev->config.guc_overrides.media_gt;
> +		else
> +			override =3D NULL;
> +
> +		if (override)
> +			path =3D drmm_kstrdup(drm, override, GFP_KERNEL);
> +	}
> +
> +out_put:
> +	config_group_put(&dev->group);
> +	return path;
> +}

[Severity: Medium]
If drmm_kstrdup() fails, does xe_configfs_guc_override() return NULL and
make the allocation failure indistinguishable from having no override
configured?  uc_fw_override() will then leave uc_fw->path set to the
default auto-selected firmware path and silently load the default firmware
instead of failing probe with -ENOMEM.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119014602.2435=
48-2-daniele.ceraolospurio@intel.com?part=3D1
