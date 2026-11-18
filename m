Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA19E606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 06:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eSlsPFvx
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 549A810E22B;
	Wed, 18 Nov 2026 06:44:23 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABEFA10E22B
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 06:44:17 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 555A840B60;
 Wed, 18 Nov 2026 06:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B7AD1F000C4;
 Wed, 18 Nov 2026 06:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794984257;
 bh=XpgptElfF+4V701JH4JAN4CKVHHLujLZuzH+FvB6eLw=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=eSlsPFvxPe4E9Ywvj58y4kSQUXoxIx2+CtH34Wcurem6EnFxdWUMSo7Ile9BxWdN3
 DfbjvgODEHiD1JYNUBAgY6LHJKKJF9AlpRqMuK02d98kroZbtnt4D/P8GM0gt8liXX
 HOCjmKnR6U0vBkiLoMIQN48azNrCwFlQ1RQPEpiKS6A+VCbH5b6lJq7qZE2oZfQiZH
 WIOtFX/YtM7JdllCZn5qqb+rG9H5GexM46v6F93vNmze/D7FfFZid3MjJRvUUliGak
 Y9QBvVRMc5O3krMUz+Y/+C2DhAwx7Z5DyDKMmeAmGErw+VJwkGvJ+wWjxp3iEnTq9/
 3GVhc6r6DueTQ==
Message-ID: <sashiko-outbox-220269@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] drm/xe: Expose CRI maximum memory frequency and
 bandwidth in sysfs
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261118062301.4135537-3-naresh.kumar.g@intel.com>
References: <20261118062301.4135537-1-naresh.kumar.g@intel.com>
 <20261118062301.4135537-3-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 06:44:16 +0000
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
- [Medium] drm/xe: missing skip_pcode check in
  xe_vram_config_sysfs_init()
- [Low] drm/xe: commit message names max_bw attribute as max_bw_Mbps
--

commit 2489fa624f46a75d6217603f94ec6bc55b6aa131
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

drm/xe: Expose CRI maximum memory frequency and bandwidth in sysfs

This commit exposes the maximum achievable memory frequency and bandwidth
reported by PCODE on Crescent Island via per-tile sysfs attributes and
documents them in the Xe sysfs ABI.

> Expose the maximum achievable memory frequency and bandwidth reported
> by PCODE MEMORY_CONFIG as read-only tile#/memory/max_freq (MHz) and
> tile#/memory/max_bw_Mbps (Mbps) on Crescent Island.

[Severity: Low]
The commit message refers to the bandwidth attribute as
tile#/memory/max_bw_Mbps, whereas the code and ABI documentation name it
tile<N>/memory/max_bw.

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
Does defining dev_attr_cri_max_freq and dev_attr_max_bw as struct
device_attribute trigger a KCFI trap when reading max_freq or max_bw on
CONFIG_CFI_CLANG kernels?

xe_vram_config_sysfs_init() attaches cri_memory_groups to a dynamic kobject
created with kobject_create_and_add("memory", tile->sysfs).  Reads on that
kobject dispatch through kobj_attr_show(), which casts the attribute to
struct kobj_attribute and calls show(struct kobject *,
struct kobj_attribute *, char *), whereas cri_max_freq_show() and
max_bw_show() take (struct device *, struct device_attribute *, char *) and
pass the bare kobject pointer to memory_config_read() as a struct device *.

These attributes should use struct kobj_attribute, matching 4ea512714c42
("drm/xe: Fix CFI violation when accessing sysfs files").

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
Should memory_groups() or xe_vram_config_sysfs_init() check
xe->info.skip_pcode before registering these PCODE-backed attributes?

Crescent Island supports SR-IOV, and vf_update_device_info() sets
xe->info.skip_pcode =3D 1 on VFs.  Because pcode_mailbox_rw() returns 0
without updating the output value when skip_pcode is set, reading max_freq
and max_bw on a Crescent Island VF will silently succeed and report 0.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118062301.4135=
537-1-naresh.kumar.g@intel.com?part=3D3
