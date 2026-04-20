Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91408F55817
	for <intel-xe@archiver.kernel.org>; Mon, 20 Apr 2026 11:20:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C72C10E4F5;
	Mon, 20 Apr 2026 11:20:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JsBGK6l0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB31810E4F5
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Apr 2026 11:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776684043; x=1808220043;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=F5c1SHoOT2nfsoVPjr3u8aF4n4jHFj21Bx/g5FKWhcs=;
 b=JsBGK6l0T/L3zWz5GL5Ws4Ub2M3E4LXED+8cs2jGomCDANmVeJhxx4H4
 5JMcZpFnk+H0yiHFAWi+wp34g4ummXfxrOsn4rmcj+FLjRLELZbSlz/TG
 osotmApofgte/tW6YAnrgAEuxVBOIfpI6Zq2N2vX/pQr/8SLTh6CgsKhv
 UHqQ6pdnjvZrvFin5rqZmEt450fNBeHMz8uZrTiY2gTPMyMiIsGvP48MW
 9OQFL/qP6sWnqvi+aZFxm+pkRRCST8Ta54M4V50KDozqO2WnTv698jtdh
 NgVmav6SwngL8Rpt/Binap44QOS8z2oafiL7Eprk2rFL5EAJEe4IoJ8uq A==;
X-CSE-ConnectionGUID: avA5aIvoSHuYyfIopK6RpQ==
X-CSE-MsgGUID: MrajC8wuQa+/WgOf6LQuRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="80184592"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="80184592"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 04:20:42 -0700
X-CSE-ConnectionGUID: +wM8032kSMWZ6LyHZlPWRA==
X-CSE-MsgGUID: wq1VwyoxSdGyNnreeUzi6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="231605508"
Received: from unknown (HELO black.igk.intel.com) ([10.91.253.5])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 04:20:39 -0700
Date: Mon, 20 Apr 2026 13:20:35 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 riana.tauro@intel.com, michal.wajdeczko@intel.com,
 matthew.d.roper@intel.com, michal.winiarski@intel.com,
 matthew.auld@intel.com, maarten@lankhorst.se, jani.nikula@intel.com,
 lukasz.laguna@intel.com, zhanjun.dong@intel.com, lukas@wunner.de
Subject: Re: [PATCH v5 1/9] drm/xe/uc_fw: Allow re-initializing firmware
Message-ID: <aeYMA6LjQ40muCrH@black.igk.intel.com>
References: <20260406140722.154445-1-raag.jadav@intel.com>
 <20260406140722.154445-2-raag.jadav@intel.com>
 <10a458a4-8c28-48f0-847a-1213c74a7e8e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <10a458a4-8c28-48f0-847a-1213c74a7e8e@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Apr 15, 2026 at 09:06:40AM -0700, Daniele Ceraolo Spurio wrote:
> On 4/6/2026 7:07 AM, Raag Jadav wrote:
> > In preparation of usecases which require re-initializing firmware without
> > reloading the driver, introduce xe_uc_fw_reinit(). The uC firmware bo
> > already exists but since it's contents are on VRAM, they are lost on PCIe
> > FLR. Copy the firmware back to it's bo and mark it as loadable as part of
> > re-initialization.
> 
> Could we just keep the firmware in SMEM instead? It's only accessed during
> FW load (unlike other GuC objects like the CTB that are accessed regularly),
> so it shouldn't be a massive penalty even if the memory access takes longer.

The initial fw load indeed happens in SMEM but they're later moved to VRAM
using xe_managed_bo_reinit_in_vram() and uc_fw layer is probably not aware
of this.

Keeping them in SMEM will probably make this patch redundant but I'm not
informed enough about the history to really know the rationale behind
current state of things. Either way works for me.

> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> > v2: Add kernel doc (Matthew Brost)
> > ---
> >   drivers/gpu/drm/xe/xe_uc_fw.c | 39 +++++++++++++++++++++++++++++------
> >   drivers/gpu/drm/xe/xe_uc_fw.h |  1 +
> >   2 files changed, 34 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> > index df2aa196f6f9..fb168238ee7d 100644
> > --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> > +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> > @@ -715,13 +715,7 @@ static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmwar
> >   	const struct firmware *fw = NULL;
> >   	int err;
> > -	/*
> > -	 * we use FIRMWARE_UNINITIALIZED to detect checks against uc_fw->status
> > -	 * before we're looked at the HW caps to see if we have uc support
> > -	 */
> >   	BUILD_BUG_ON(XE_UC_FIRMWARE_UNINITIALIZED);
> > -	xe_gt_assert(gt, !uc_fw->status);
> > -	xe_gt_assert(gt, !uc_fw->path);
> >   	uc_fw_auto_select(xe, uc_fw);
> > @@ -834,6 +828,14 @@ static int uc_fw_copy(struct xe_uc_fw *uc_fw, const void *data, size_t size, u32
> >   	return err;
> >   }
> > +static void uc_fw_reinit(struct xe_uc_fw *uc_fw, const void *data)
> > +{
> > +	struct xe_device *xe = uc_fw_to_xe(uc_fw);
> > +
> > +	xe_map_memcpy_to(xe, &uc_fw->bo->vmap, 0, data, uc_fw->size);
> > +	xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_LOADABLE);
> > +}
> > +
> >   int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
> >   {
> >   	const struct firmware *fw = NULL;
> > @@ -857,6 +859,31 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
> >   }
> >   ALLOW_ERROR_INJECTION(xe_uc_fw_init, ERRNO); /* See xe_pci_probe() */
> > +/**
> > + * xe_uc_fw_reinit() - Re-initialize uC firmware into its bo
> > + * @uc_fw: uC firmware
> > + *
> > + * Returns: 0 on success, negative error code otherwise.
> > + */
> > +int xe_uc_fw_reinit(struct xe_uc_fw *uc_fw)
> > +{
> > +	const struct firmware *fw = NULL;
> > +	int err;
> 
> should probably bail early if the FW is not supported.
> 
> > +
> > +	err = uc_fw_request(uc_fw, &fw);
> 
> I don't really like the idea of going through FW selection again, as this
> could technically cause us to switch to a different FW path or image. IMO
> here for native/PF we should do something like:
> 
>     if (!intel_uc_fw_is_available(uc_fw))
>         return 0;
> 
>     xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_SELECTED);
>     old_fw_version = uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
>     fw = firmware_request_nowarn(&fw, uc_fw->path, dev);
> 
>     parse_headers(uc_fw, fw);
>     new_fw_version = uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
>     if (old_fw_version != new_fw_version)
>         return -ENOEXEC;
> 
>     uc_fw_reinit(uc_fw, fw->data);
>     release_firmware(fw);
> 
> The firmware_request_nowarn() and parse_headers() are the same ones used in
> uc_fw_request, so it might be worth moving them to a common function (in
> which case we can use uc_fw_release instead of release_firmware to match).

Makes sense.

Raag

> > +	if (err)
> > +		return err;
> > +
> > +	/* no error and no firmware means nothing to copy */
> > +	if (!fw)
> > +		return 0;
> > +
> > +	uc_fw_reinit(uc_fw, fw->data);
> > +	uc_fw_release(fw);
> > +
> > +	return err;
> > +}
> > +
> >   static u32 uc_fw_ggtt_offset(struct xe_uc_fw *uc_fw)
> >   {
> >   	return xe_bo_ggtt_addr(uc_fw->bo);
> > diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h b/drivers/gpu/drm/xe/xe_uc_fw.h
> > index bb281b72a677..9f469bf07d66 100644
> > --- a/drivers/gpu/drm/xe/xe_uc_fw.h
> > +++ b/drivers/gpu/drm/xe/xe_uc_fw.h
> > @@ -15,6 +15,7 @@
> >   struct drm_printer;
> >   int xe_uc_fw_init(struct xe_uc_fw *uc_fw);
> > +int xe_uc_fw_reinit(struct xe_uc_fw *uc_fw);
> >   size_t xe_uc_fw_copy_rsa(struct xe_uc_fw *uc_fw, void *dst, u32 max_len);
> >   int xe_uc_fw_upload(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags);
> >   int xe_uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw);
> 
