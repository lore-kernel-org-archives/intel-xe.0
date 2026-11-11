Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4A9606B9F3
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 00:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xq1dzpf9
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 226AD10E3A9;
	Wed, 11 Nov 2026 00:25:23 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC3A510F83D
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Nov 2026 00:25:16 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 589B247473;
 Wed, 11 Nov 2026 00:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D13E1F00A05;
 Wed, 11 Nov 2026 00:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794356716;
 bh=aFynK5un/WPyx/m/YBPRHEYy+fUiswu+dGin6q0pfMc=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Xq1dzpf9z7I0eHzWOMMEbzC9BElB6Lck1taSAMlkt0P8MZ6EargHLHI6jnNVpQWAo
 W3DRHE4J1Rro1c1FPjJyg8KUBsc11zK2TfBNo+TAB/MzJ2T1Mz6QXL2jsi2RKwSNOD
 pj09TnSyUYypCrvXvfMGnhRuIadtMbda7bFTQ8Qxx8O/BVrGmZhlKu+fjQUmBj6u4I
 8yBy6/J8B60TakiaMmFAUl5KLhaW/j7Fccrf0n+yWIcIMumvM3HDBRrHQ6iyCm20bi
 e8iO4/nNih22oN47qMap3Wz1udKFSwsawE3aTYvxVQ08gASgSV8E3OnU4ylieyJepr
 /EscYp9TSwH1A==
Message-ID: <sashiko-outbox-208017@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] drm/xe/configfs: Allow overriding the GuC hwconfig
 table
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261111000818.238585-4-stuart.summers@intel.com>
References: <20261111000818.238585-3-stuart.summers@intel.com>
 <20261111000818.238585-4-stuart.summers@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 00:25:15 +0000
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

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] drm/xe: infinite loop on malformed configfs blob in
  xe_guc_hwconfig_lookup_u32()
- [Medium] drm/xe/configfs: uninitialized vmalloc memory leak in
  hwconfig_read()
--

commit 690eaa0a0c57392da54e4454901c30297777be5c
Author: Stuart Summers <stuart.summers@intel.com>

drm/xe/configfs: Allow overriding the GuC hwconfig table

This commit adds a binary configfs attribute to override the GuC hwconfig
table before binding the PCI device.

> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_con=
figfs.c
> index 2ddd707a6dbd3..6f810b33e12d9 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c

[ ... ]

> @@ -937,6 +961,50 @@ static ssize_t ctx_restore_post_bb_store(struct conf=
ig_item *item,
>  	return wa_bb_store(dev->config.ctx_restore_post_bb, dev, data, sz);
>  }
> =20
> +static ssize_t hwconfig_read(struct config_item *item, void *buf, size_t=
 count)
> +{
> +	struct xe_config_group_device *dev =3D to_xe_config_group_device(item);
> +
> +	guard(mutex)(&dev->lock);
> +
> +	if (!buf)
> +		return dev->config.hwconfig.len;
> +
> +	count =3D min(count, dev->config.hwconfig.len);
> +	memcpy(buf, dev->config.hwconfig.data, count);
> +
> +	return count;
> +}

[Severity: Medium]
Can a concurrent hwconfig_write() cause hwconfig_read() to leak
uninitialized vmalloc() memory to userspace?

configfs_bin_read_iter() calls ->read() twice without holding dev->lock
across both calls:

CPU0                              CPU1
configfs_bin_read_iter()
  len =3D hwconfig_read(..., NULL, 0)
  buffer->bin_buffer =3D vmalloc(len)
  buffer->bin_buffer_size =3D len
                                  hwconfig_write()
                                    /* replaces blob with smaller len */
  len =3D hwconfig_read(..., bin_buffer, len)
    /* copies only smaller len, returns >=3D 0 */
  copy_to_iter(bin_buffer, bin_buffer_size, to)
    <-- copies uninitialized vmalloc() tail to userspace

Because configfs_bin_read_iter() only aborts when the second ->read()
returns a negative value and otherwise copies the full bin_buffer_size,
returning a negative error (such as -EAGAIN) when count !=3D
dev->config.hwconfig.len would avoid the short fill.

> +
> +static ssize_t hwconfig_write(struct config_item *item, const void *buf,=
 size_t count)
> +{
> +	struct xe_config_group_device *dev =3D to_xe_config_group_device(item);
> +	void *data =3D NULL;
> +
> +	/* The table is a sequence of dwords */
> +	if (count % sizeof(u32))
> +		return -EINVAL;

[Severity: Medium]
Can a malformed hwconfig blob written here cause an infinite loop in
xe_guc_hwconfig_lookup_u32() during device probe?

hwconfig_write() only checks that count is a multiple of 4 bytes without
validating the KLV entry lengths.  When xe_guc_hwconfig_lookup_u32()
later walks the overridden table (for example from xe_gt_mcr_init() ->
init_steering_dss() -> dss_per_group()), it advances past non-matching
keys without checking len_dw:

drivers/gpu/drm/xe/xe_guc_hwconfig.c:xe_guc_hwconfig_lookup_u32() {
    ...
	while (i + 3 <=3D num_dw) {
		u32 key =3D hwconfig[i++];
		u32 len_dw =3D hwconfig[i++];

		if (key !=3D attribute) {
			i +=3D len_dw;
			continue;
		}

		*val =3D hwconfig[i];
    ...
}

If an entry has len_dw =3D=3D 0xfffffffe, i +=3D len_dw wraps 32-bit int i =
back
to the start of the same entry and hangs the probe thread; in
xe_guc_hwconfig_dump(), i + len_dw > num_dw also wraps in 32-bit unsigned
arithmetic before widening to u64 num_dw.  In addition, if len_dw =3D=3D 0 =
on
a matching key, xe_guc_hwconfig_lookup_u32() reads the next entry's key
dword into *val.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111000818.2385=
85-3-stuart.summers@intel.com?part=3D1
