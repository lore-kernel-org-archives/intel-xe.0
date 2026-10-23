Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C77606A31B
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 06:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PfazblhN
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EECFE10E552;
	Fri, 23 Oct 2026 06:31:59 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C751310E54E
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 06:31:53 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 7C38143F60;
 Fri, 23 Oct 2026 06:31:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 423D81F031E7;
 Fri, 23 Oct 2026 06:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792737113;
 bh=HqWKHas9KyNCYY4zaTLnt8iNv31VHMRYVEiCOKev+Hs=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=PfazblhN165BnMywii99CX5up2ErKXkYxTe/CApnHoB2bpYxwjL3r8exdLz25RH7O
 2KM5M8HXce57Ck4G7heQG2mXHkOr0x6oLNzYquA7IZFPYZe2xKDXvwM+VovQHiFcJN
 Iff7PL6+vgMezGIrfyYm7pF6oMzq8jGJ1Huym6uYfDNYM5BPSa9hXK6lXuyCzuQxcV
 2tRCR1GyCQeTofiEd9aKqBQg5QPFXu3ob17uDqAxyfmjTLRFWw3ho/imzvPEtQKsrV
 ctMO+7Nxnk5giT5IyiniyVx0FzRHAJikpoQEPp0NhJS+nRRhX7cbNGMD/riPyJnmWj
 zPtmU7snGm/Ew==
Message-ID: <sashiko-outbox-182352@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/7] drm/xe: dump GAM page fault report registers in
 devcoredump
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261023060554.2643515-5-naresh.kumar.g@intel.com>
References: <20261023060554.2643515-1-naresh.kumar.g@intel.com>
 <20261023060554.2643515-5-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 06:31:52 +0000
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/xe: unsteered MCR read of GAMCTRL PF queue registers in devc=
oredump
--

commit 1da764eb534ebe0a6ed34a1262b84f79a5f87633
Author: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>

drm/xe: dump GAM page fault report registers in devcoredump

This commit adds definitions for PAGE_FLTRPTQ_HEAD_GAMCTRL and
PAGE_FLTRPTQ_TAIL_GAMCTRL and captures them during devcoredump snapshots.
It also prints the captured values in the devcoredump output along with a
page fault notice when the head and tail registers differ.

> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/re=
gs/xe_gt_regs.h
> index e93895e0c731a..e9eb0bd04af10 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -530,6 +530,9 @@
>  #define   LMEM_EN				REG_BIT(31)
>  #define   LMTT_DIR_PTR				REG_GENMASK(30, 0) /* in multiples of 64KB */
> =20
> +#define PAGE_FLTRPTQ_HEAD_GAMCTRL		XE_REG(0xcf90)
> +#define PAGE_FLTRPTQ_TAIL_GAMCTRL		XE_REG(0xcf94)
> +
>  #define HALF_SLICE_CHICKEN5			XE_REG_MCR(0xe188, XE_REG_OPTION_MASKED)
>  #define   DISABLE_SAMPLE_G_PERFORMANCE		REG_BIT(0)
> =20
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_=
devcoredump.c
> index 49a7c020a1615..8d59f80e2929f 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -114,6 +114,11 @@ static const struct xe_reg_desc xe_dbg_media_gt_rpm_=
reglist[] =3D {
>  	XE_REG_DESC(RPM_GCD, "RPM_GCD"),
>  };
> =20
> +static const struct xe_reg_desc xe_dbg_gam_pf_reglist[] =3D {
> +	XE_REG_DESC(PAGE_FLTRPTQ_HEAD_GAMCTRL, "PAGE_FLTRPTQ_HEAD_GAMCTRL"),
> +	XE_REG_DESC(PAGE_FLTRPTQ_TAIL_GAMCTRL, "PAGE_FLTRPTQ_TAIL_GAMCTRL"),
> +};

[Severity: Medium]
Should PAGE_FLTRPTQ_HEAD_GAMCTRL (0xcf90) and PAGE_FLTRPTQ_TAIL_GAMCTRL
(0xcf94) be defined as MCR registers with XE_REG_MCR() and captured via
steered MCR reads instead of raw xe_mmio_read32()?

In drivers/gpu/drm/xe/xe_gt_mcr.c, the 0x00C800 to 0x00CFFF GAM/GAMCTRL
range is listed in the INSTANCE0 steering tables across Xe platforms (such
as xehpc_instance0_steering_table, xelpg_instance0_steering_table,
xe2lpg_instance0_steering_table, xe3p_lpg_instance0_steering_table, and
xe3p_xpc_instance0_steering_table):

drivers/gpu/drm/xe/xe_gt_mcr.c:
	{ 0x00C800, 0x00CFFF },		/* GAMCTRL */

Because rw_with_mcr_steering() leaves the last-used group and instance
programmed in MCR_SELECTOR / MTL_MCR_SELECTOR (and on GRAPHICS_VERx100(xe)
>=3D 1270, MTL_MCR_SELECTOR is shared with GuC and serialized via
gt->mcr_lock and STEER_SEMAPHORE), reading these registers in
devcoredump_snapshot() -> xe_devcoredump_capture_gt_regs() ->
xe_dbg_gt_snapshot_capture() -> xe_dbg_reg_snapshot_capture_target() via
unsteered xe_mmio_read32() can race with concurrent MCR steering or target
a terminated non-(0, 0) GAMCTRL instance. When that happens, both reads
return 0x00000000 and xe_gam_pf_snapshot_print() will not print the page
fault message even if a fault occurred.

Even with the subsequent patch in the series ("drm/xe: capture L3 node
status registers in devcoredump") adding XE_REG_DESC_MCR() and updating
xe_dbg_reg_snapshot_capture_target() to call xe_gt_mcr_unicast_read_any()
for MCR descriptors, PAGE_FLTRPTQ_HEAD_GAMCTRL and
PAGE_FLTRPTQ_TAIL_GAMCTRL remain defined with XE_REG() and XE_REG_DESC(),
so they still bypass xe_gt_mcr_unicast_read_any().

Additionally, on Xe3p+ platforms where xe_guc_using_main_gamctrl_queues()
is true (GT_VER(gt) >=3D 35), xe_guc_upload() switches hardware and GuC to
the unicast Main GAMCTRL queues:

drivers/gpu/drm/xe/xe_guc.c:xe_guc_upload() {
	if (xe_guc_using_main_gamctrl_queues(guc))
		xe_mmio_write32(&gt->mmio, MAIN_GAMCTRL_MODE, MAIN_GAMCTRL_QUEUE_SELECT);
}

On those platforms, are 0xcf90 and 0xcf94 still the active page fault
reporting queue registers to capture in xe_devcoredump_capture_gt_regs()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023060554.2643=
515-1-naresh.kumar.g@intel.com?part=3D4
