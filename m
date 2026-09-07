Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 251ADC79F99
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 10:02:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D900210E747;
	Mon,  7 Sep 2026 10:02:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="H3P2W9I2";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D0F10E747
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 10:02:14 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 41610601F9;
 Mon,  7 Sep 2026 10:02:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB81E1F00A3D;
 Mon,  7 Sep 2026 10:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788775333;
 bh=Z4hOQDbeGPlKMd/WSDgSir9xoG4kqgSAM/YcqWnV+F8=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=H3P2W9I2aUyXOi8KaRsVHwivG3sE70qp0R+xctaBNKUnuvqB5ihB6lkjlKCQ6ekp8
 W1m5BtVcGU2Rmqfo0+W1JmNtw8lxGgy3D/sSF4+NoCFoBOMGO966eT5XewxmlADHw1
 OPHzhTZvixqDdQACacrD230PFIxWy5imQtsJS2Lgh+4y9N01eL570jddPH3CDTD7yB
 ReSG3g+GjKXFbu26iR1EHalruSr9x2vdhBQfcmT8J+EceZIbma+Yl6r66qv2fMBxjM
 qxKq5LjhCdIj0qR7cnFtowbVmMGvUTZ5Hwfe35/INDtqJA4Vvf8lr884Y66QQJBG9e
 TA/CU8HP03ajg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/6] drm/xe/xe_ras: Track offlined pages by firmware
 to avoid duplicates
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260907094706.1407436-14-riana.tauro@intel.com>
References: <20260907094706.1407436-8-riana.tauro@intel.com>
 <20260907094706.1407436-14-riana.tauro@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 10:02:12 +0000
Message-Id: <20260907100212.CB81E1F00A3D@smtp.kernel.org>
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
- [High] Incorrect bit shift used to calculate XArray index for device phys=
ical addresses.
--

commit cb65d57e28d4e4a8f1d6464c1a918d7392d5e460
Author: Riana Tauro <riana.tauro@intel.com>

drm/xe/xe_ras: Track offlined pages by firmware to avoid duplicates

This commit introduces tracking for pages successfully offlined by the
firmware using an XArray. This prevents the memory scrubber from issuing
redundant page offline requests for the same address.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
[ ... ]
> @@ -244,11 +248,16 @@ static int send_page_offline_cmd(struct xe_device *=
xe, u64 page_address,
>  		return ret;
>  	}
> =20
> +	if (action =3D=3D XE_RAS_PAGE_ACTION_OFFLINE)
> +		xa_store(&state->offlined_pages, page_address >> PAGE_SHIFT,
> +			 XE_RAS_PAGE_OFFLINED, GFP_KERNEL);

[Severity: High]
Does this code use the correct page shift for device physical addresses?

PAGE_SHIFT is the host's page shift, which could be 64K depending on the
kernel build, whereas the device page size is likely 4K. If the host uses 6=
4K
pages, shifting by PAGE_SHIFT would truncate the lower bits of the device
address, causing multiple distinct 4K device pages to hash to the exact same
XArray index.

> +
>  	return ret;
>  }
> =20
>  static int handle_page_offline(struct xe_device *xe, u64 page_address, b=
ool send_cmd)
>  {
> +	struct xe_ras_state *state =3D &xe->ras.state;
>  	enum xe_ras_page_action action;
>  	int ret =3D 0;
> =20
[ ... ]
> @@ -288,7 +297,11 @@ static int handle_page_offline(struct xe_device *xe,=
 u64 page_address, bool send
>  			   "Physical page address belongs to critical BO: 0x%llx\n", page_add=
ress);
>  		return ret;
>  	case -EEXIST:
> -		action =3D XE_RAS_PAGE_ACTION_OFFLINE;
> +		if (xa_load(&state->offlined_pages, page_address >> PAGE_SHIFT))

[Severity: High]
Will this check cause false positives on non-4K kernel page builds?

If a hardware memory error occurs on a different 4K device page that falls
within the same 64K host page as a previously offlined page, this lookup
will find the existing entry. The driver might then mistakenly conclude this
specific device page is already offlined and skip sending the command to the
firmware.

> +			action =3D XE_RAS_PAGE_ACTION_DECLINE;
> +		else
> +			action =3D XE_RAS_PAGE_ACTION_OFFLINE;
> +
>  		xe_log_err(xe, DEVICE_MEMORY, ret,
>  			   "Double-bit ECC error detected at physical address 0x%llx, page al=
ready software offlined\n",
>  			   page_address);
[ ... ]
> @@ -410,8 +423,11 @@ static void get_offlined_list(struct xe_device *xe)
>  			return;
>  		}
> =20
> -		for (i =3D 0; i < response.pages_returned && i < XE_RAS_NUM_PAGES; i++)
> +		for (i =3D 0; i < response.pages_returned && i < XE_RAS_NUM_PAGES; i++=
) {
>  			handle_page_offline(xe, response.page_addresses[i], false);
> +			xa_store(&state->offlined_pages, response.page_addresses[i] >> PAGE_S=
HIFT,
> +				 XE_RAS_PAGE_OFFLINED, GFP_KERNEL);

[Severity: High]
Could this initialization also suffer from the same device vs. host page sh=
ift
mismatch?

Using PAGE_SHIFT here would populate the cache with indices that may group
multiple device pages into a single host page index.

> +		}
> =20
>  		if (!state->max_pages)
>  			state->max_pages =3D response.max_entries;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907094706.1407=
436-8-riana.tauro@intel.com?part=3D6
