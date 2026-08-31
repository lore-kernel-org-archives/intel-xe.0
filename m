Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EECFC61DE2
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 08:46:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA87A10E762;
	Mon, 31 Aug 2026 08:46:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="S1KQBNQr";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D358710E762
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 08:45:59 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 1864A60120;
 Mon, 31 Aug 2026 08:45:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 940451F00A3D;
 Mon, 31 Aug 2026 08:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788165958;
 bh=s5DUiq6l1G+FXoZJtEixEtm90TdD4ZKL5zPL1WSfTB8=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=S1KQBNQry70USPP4V6yCvwDS6JKscVhQZ5gMc4Ch4W/orLH1DXVSTT9DTVqhHxyPN
 qMODy74LLLd4Nalz7BPh6gneyU+iDy4dXvb9AdBTAwaLdhWyih2lxvPyHrJ+5uy7dL
 2hAcAZ/ue0wUrS1DlM5oz3/uDDNzdLKvGrpwxE896u9j3/HHZJ7sjTqGR0CJ7uftPk
 kQl7oLlHx01JvMPOGOnyPnEhq/bYv4e/suc4mSC9XYJg3xsy/T2csXiARcZsmcZwwJ
 NFQFFreF8cCZij1z1xfMVlF63pikJEcuab3uIu7j6wbQnWE4DkVYCoxE2dQAlbvf9p
 l+74kfV1XgP3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V19 10/15] drm/xe/configfs: Add
 disable_vram_page_offline attribute
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260831064942.315720-27-tejas.upadhyay@intel.com>
References: <20260831064942.315720-17-tejas.upadhyay@intel.com>
 <20260831064942.315720-27-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 08:45:58 +0000
Message-Id: <20260831084558.940451F00A3D@smtp.kernel.org>
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
- [Medium] The `disable_vram_page_offline_show` function incorrectly negate=
s the configured boolean value, causing sysfs/configfs reads to contradict =
the actual configuration state.
- [Medium] The dummy fallback implementation of `xe_configfs_get_disable_vr=
am_page_offline()` incorrectly returns `true` when configfs is disabled, co=
ntradicting the default configuration.
--

commit d087a9cf3ce1baaaa80f9dce6c4475133cc05dbf
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>

drm/xe/configfs: Add disable_vram_page_offline attribute

Add a new configfs attribute disable_vram_page_offline to control
how bad VRAM pages are handled. The attribute can only be set before
binding to the device and defaults to false (offlining enabled).

> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_con=
figfs.c
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
[ ... ]
> @@ -616,6 +631,33 @@ static ssize_t enable_multi_queue_store(struct confi=
g_item *item, const char *pa
>  	return len;
>  }
> =20
> +static ssize_t disable_vram_page_offline_show(struct config_item *item, =
char *page)
> +{
> +	struct xe_config_device *dev =3D to_xe_config_device(item);
> +
> +	return sprintf(page, "%s\n", str_yes_no(!dev->disable_vram_page_offline=
));

[Severity: Medium]
Does this logic negate the configured boolean value? Since the attribute
is named disable_vram_page_offline, if a user writes '1' to it (setting
it to true), won't the '!' operator cause this to output 'N' on read? This
could break userspace assumptions where reading yields the opposite of what
was just written.

> +}
> +
> +static ssize_t disable_vram_page_offline_store(struct config_item *item,
[ ... ]
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_con=
figfs.h
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
[ ... ]
> @@ -44,6 +45,7 @@ static inline bool xe_configfs_media_gt_allowed(struct =
pci_dev *pdev) { return t
>  static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) =
{ return U64_MAX; }
>  static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { =
return false; }
>  static inline bool xe_configfs_get_enable_multi_queue(struct pci_dev *pd=
ev) { return true; }
> +static inline bool xe_configfs_get_disable_vram_page_offline(struct pci_=
dev *pdev) { return true; }

[Severity: Medium]
Should this dummy fallback return false instead of true? The commit message
and device_defaults indicate that the default state is false (offlining is
active). When the kernel is compiled without configfs support, returning
true here would silently disable VRAM page offlining by default.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831064942.3157=
20-17-tejas.upadhyay@intel.com?part=3D10
