Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9BEC5CFC1
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 17:39:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B5110E589;
	Fri, 14 Aug 2026 17:39:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="A1VthAdv";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3694510E589
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 17:39:30 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 5D6DD601DE;
 Fri, 14 Aug 2026 17:39:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 925011F000E9;
 Fri, 14 Aug 2026 17:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786729169;
 bh=CukmcqyUIkxTX3YExhhMnR6/vYnM1gKPYu7hhI6wDxA=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=A1VthAdvY17uU7f1uZGPto99j34i4grQrA93lY7Oxqp6x2x6q98isJW/zm6856yPO
 xir658FcA8Saqg+4hpoefPzPKOzjgGBcQGq9J6NWJVI1ouXQynadz0Iq98qWx4y21u
 PoKdLgGJsJGzioUVW0W2PSH95xMbIrRP6WODGmCBHt0f6RzJeF/phGa9Z9shJDztZz
 Z3GnVBDJcZVRyOq8M067q3W6u2bQSqADJ6ddeqkUrNXsZwQblSANYyk5NWFLVezj9v
 ITGY9ECqTJ4FAIC7lE4DjbT1qcvr8nfmz2EeOrX5m2fYW5nJz8ijGCvu8nzbCc8+aL
 Lfcnc09ZMeoJA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 22/33] drm/xe/survivability: Report 'boot status' on
 sysfs failure
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260814171801.13347-23-michal.wajdeczko@intel.com>
References: <20260814171801.13347-1-michal.wajdeczko@intel.com>
 <20260814171801.13347-23-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 17:39:27 +0000
Message-Id: <20260814173928.925011F000E9@smtp.kernel.org>
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
- [High] The `csc_hw_error_work` workqueue item is never canceled during dr=
iver teardown, leading to a potential Use-After-Free.
- [High] Hardware-controlled infinite loop while traversing the auxiliary i=
nfo register linked list.
--

--- Patch [22]: [PATCH v5 22/33] drm/xe/survivability: Report 'boot status'=
 on sysfs failure ---
commit 24540c4b13c7579fcae729221e696b114366060f
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>

drm/xe/survivability: Report 'boot status' on sysfs failure

If we fail to create any of the survivability sysfs files, the user
can't view boot status registers any more. Report them into dmesg
instead using our existing SIGID helper.

> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm=
/xe/xe_survivability_mode.c
> index 8b74bbc963903..e14553295171d 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
[ ... ]
> @@ -329,6 +330,9 @@ static int create_survivability_sysfs(struct pci_dev =
*pdev)
> =20
>  failed:
>  	xe_err(xe, "Failed to create survivability sysfs files: %pe\n", ERR_PTR=
(ret));
> +	/* no sysfs, dump Survivability info to dmesg instead */
> +	if (needs_info)
> +		log_survivability_info(xe);
>  	return ret;
>  }

[Severity: High]
This is a pre-existing issue, but can this loop run infinitely if the hardw=
are
returns corrupted or circular data?

drivers/gpu/drm/xe/xe_survivability_mode.c:populate_survivability_info() {
    ...
		for (id =3D REG_FIELD_GET(AUXINFO_REG_OFFSET, reg_value);
		     id >=3D AUX_INFO0 && id < MAX_SCRATCH_REG;
		     id =3D  REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, info[id]))
			set_survivability_info(mmio, info, id);
    ...
}

Since survivability mode handles wedged or failing firmware, the hardware m=
ight
return an AUXINFO_HISTORY_OFFSET that points to the current or a previously
visited index.

Does this traversal need a bound or cycle detection to prevent hanging a ke=
rnel
thread?

[Severity: High]
This is a pre-existing issue, but is there a potential use-after-free during
driver teardown if this work item is not canceled?

drivers/gpu/drm/xe/xe_hw_error.c:xe_hw_error_init() {
    ...
	INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
    ...
}

The work item is initialized without a corresponding teardown action
(like devm_add_action_or_reset) to cancel it on driver unbind.

If the driver is unloaded while hardware error processing is queued, the wo=
rker
could execute after the tile and xe structures are freed:

drivers/gpu/drm/xe/xe_hw_error.c:csc_hw_error_work() {
	struct xe_tile *tile =3D container_of(work, typeof(*tile), csc_hw_error_wo=
rk);

	xe_hw_error_print(tile, CSC_HW_ERROR);
}

Does the driver need a cancel_work_sync() during teardown to prevent this?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814171801.1334=
7-1-michal.wajdeczko@intel.com?part=3D22
