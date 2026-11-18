Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D69A606A32A
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 07:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XRyrsSy0
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC0CB10E6AE;
	Wed, 18 Nov 2026 07:44:51 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5737410E6AE
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 07:44:45 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id CEFE543629;
 Wed, 18 Nov 2026 07:44:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94A101F000C5;
 Wed, 18 Nov 2026 07:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794987884;
 bh=P9P3RzddA5wy7jbomTvqp/TjbKKOn0ujtaWy2BmzvnA=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=XRyrsSy053P22FVJfSzokOe5o4gsTWQjTefo9nxYzVsxlg5QyLzEuy4eS142MpPuE
 xu8xWyJAAMV3NLnKAb3MgXIb5hiIxHwOWMXLoFvx1Y1GlMKhBWxX9auNqgzi4OS0Ek
 DSkBDzrZnFqBReBQ9/2rgEbJ0Dqi/o0gMk1ISEeleQxvGrJjlZ1aWF3A9da2dCsTRx
 p4CKqpHmNvAw8/WQqGI1zd68Yw+QG7Df2UALS/5U5NbARF7+ueanPjlfLvXiRVZKu6
 tELqQc6heg05PzMgzfdIfk99z2rTxWZ6lU2E/ym4akC49TP1ontT0fzw40eeiG7V9R
 6etU+8ERfFbaA==
Message-ID: <sashiko-outbox-220342@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] drm/xe: Expose CRI maximum memory frequency and
 bandwidth in sysfs
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261118072506.4159301-4-naresh.kumar.g@intel.com>
References: <20261118072506.4159301-1-naresh.kumar.g@intel.com>
 <20261118072506.4159301-4-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 07:44:44 +0000
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

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] drm/xe: CFI violation in cri_max_freq_show() and max_bw_show()
  callbacks
- [Medium] drm/xe: missing skip_pcode check in memory_groups() exposes 0
  on VFs
- [Low] drm/xe: commit message names attribute max_bw_Mbps instead of
  max_bw
--

commit f3ff798042aa8ab90bca8ef642079ca40acf46ed
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

drm/xe: Expose CRI maximum memory frequency and bandwidth in sysfs

This commit exposes the maximum achievable memory frequency and bandwidth
reported by firmware on Crescent Island as read-only sysfs attributes under
tile#/memory/ and documents them in the Xe sysfs ABI.

> Expose the maximum achievable memory frequency and bandwidth reported
> by PCODE MEMORY_CONFIG as read-only tile#/memory/max_freq (MHz) and
> tile#/memory/max_bw_Mbps (Mbps) on Crescent Island.

[Severity: Low]
This isn't a bug, but the commit message refers to tile#/memory/max_bw_Mbps
while the code and ABI documentation name the attribute tile#/memory/max_bw.

> diff --git a/drivers/gpu/drm/xe/xe_vram_config.c b/drivers/gpu/drm/xe/xe_=
vram_config.c
> index 31a3405c39abd..4b8661b8597ac 100644
> --- a/drivers/gpu/drm/xe/xe_vram_config.c
> +++ b/drivers/gpu/drm/xe/xe_vram_config.c
[ ... ]
> @@ -84,11 +90,81 @@ static const struct attribute_group freq_group_attrs =
=3D {
>  	.attrs =3D freq_attrs,
>  };
> =20
> +static const struct attribute_group *pvc_memory_groups[] =3D {
> +	&freq_group_attrs,
> +	NULL
> +};
> +
> +static int memory_config_read(struct device *dev, u32 subcmd, u32 *val)
> +{
> +	struct xe_tile *tile =3D dev_to_tile(dev);
> +
> +	guard(xe_pm_runtime)(tile_to_xe(tile));
> +
> +	return xe_pcode_read(tile, PCODE_MBOX(PCODE_MEMORY_CONFIG, subcmd, 0),
> +			     val, NULL);
> +}
> +
> +static ssize_t cri_max_freq_show(struct device *dev, struct device_attri=
bute *attr,
> +				 char *buf)
> +{
> +	u32 val =3D 0;
> +	int err;
> +
> +	err =3D memory_config_read(dev, MEMORY_CONFIG_SUBCOMMAND_READ_MAX_FREQU=
ENCY, &val);
> +	if (err)
> +		return err;
> +
> +	return sysfs_emit(buf, "%u\n", val);
> +}
> +
> +static struct device_attribute dev_attr_cri_max_freq =3D
> +	__ATTR(max_freq, 0444, cri_max_freq_show, NULL);
> +
> +static ssize_t max_bw_show(struct device *dev, struct device_attribute *=
attr,
> +			   char *buf)
> +{
> +	u32 val =3D 0;
> +	int err;
> +
> +	err =3D memory_config_read(dev, MEMORY_CONFIG_SUBCOMMAND_READ_MAX_BANDW=
IDTH, &val);
> +	if (err)
> +		return err;
> +
> +	return sysfs_emit(buf, "%u\n", val);
> +}
> +static DEVICE_ATTR_RO(max_bw);

[Severity: High]
Will reading max_freq or max_bw trigger a control flow integrity failure on
kernels built with clang CFI?

xe_vram_config_sysfs_init() attaches cri_memory_groups to the bare kobject
returned by kobject_create_and_add("memory", tile->sysfs), whose ktype uses
kobj_sysfs_ops.  When userspace reads either file, kobj_attr_show() casts t=
he
attribute to struct kobj_attribute and calls ->show() with signature
(struct kobject *, struct kobj_attribute *, char *), which mismatches the
struct device_attribute callback signature used here and traps under clang
CFI, as previously fixed in other Xe sysfs files by 4ea512714c42 ("drm/xe:
Fix CFI violation when accessing sysfs files").

Defining these attributes as struct kobj_attribute and passing struct kobje=
ct
* to memory_config_read() (using kobj_to_tile(kobj->parent)) avoids the
type mismatch.

> +
> +static struct attribute *cri_memory_attrs[] =3D {
> +	&dev_attr_cri_max_freq.attr,
> +	&dev_attr_max_bw.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group cri_memory_group_attrs =3D {
> +	.attrs =3D cri_memory_attrs,
> +};
> +
> +static const struct attribute_group *cri_memory_groups[] =3D {
> +	&cri_memory_group_attrs,
> +	NULL
> +};
> +
> +static const struct attribute_group **memory_groups(struct xe_device *xe)
> +{
> +	if (xe->info.platform =3D=3D XE_PVC)
> +		return pvc_memory_groups;
> +	if (xe->info.platform =3D=3D XE_CRESCENTISLAND)
> +		return cri_memory_groups;
> +	return NULL;
> +}

[Severity: Medium]
Should memory_groups() return NULL when xe->info.skip_pcode is set, such as
on Crescent Island SR-IOV virtual functions?

vf_update_device_info() sets xe->info.skip_pcode =3D 1 on virtual functions,
and xe_tile_init_noalloc() still initializes tile sysfs.  When skip_pcode is
set, pcode_mailbox_rw() returns 0 without updating the output value, so
reading max_freq and max_bw on a virtual function silently succeeds and
reports 0.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118072506.4159=
301-1-naresh.kumar.g@intel.com?part=3D3
