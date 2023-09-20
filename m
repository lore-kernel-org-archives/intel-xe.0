Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9BBCE79C2
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 10:56:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BDD410E47B;
	Wed, 20 Sep 2023 10:56:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E57910E47B
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 10:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695207368; x=1726743368;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=nz6CNnse26+/KRnMvlj7ikvJZTXg1Xrs9FeUZ/JMlck=;
 b=d46frhCQ5yg3iRsEwSnshUmHZb28acLubTgJbpdGgX7XbsouTa/4PjNZ
 +ldbWl7+Cl7EuhvOC4gYVvN/k5eFwWkAfqFfY48DKQmhiltQPs5jXnd73
 /aPrG/hsbh4gcZ5EbR3jHy5Z0gRkmkXcjuN+QmzYVoyIr3eFdRh1B2PXr
 0OLssO7r9Xtt8oPw5G8UP1cHTtmFlHDP9fYdOdYZSwyxYNch7kbSeyEgK
 tkqxTxtqs5lKDyb292Hlc/ZqYSMD2THbTWxoqGH0icn0UG0NAVYhXcCxM
 dcqFWqiCziMy0ggDi4fF8F2+/jaSC+CspFucVhZuVelcWNaHCF9lQ2iyH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="382934998"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="382934998"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 03:56:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="836802395"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="836802395"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by FMSMGA003.fm.intel.com with SMTP; 20 Sep 2023 03:56:05 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 20 Sep 2023 13:56:04 +0300
Date: Wed, 20 Sep 2023 13:56:04 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZQrPxAC4dBYv9fNi@intel.com>
References: <20230919144111.32702-1-gustavo.sousa@intel.com>
 <w7l6s4ywimggliinhccwbpnvepxera3an6raryyffusmenesng@me7t4rjxmyjz>
 <169514495100.2105.12416170725310981140@gjsousa-mobl2>
 <l4avy36wdkxxcmc2beblwvplfokvhrxbybfmmsmm22mt6gjjyc@gk24v7rkvwok>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <l4avy36wdkxxcmc2beblwvplfokvhrxbybfmmsmm22mt6gjjyc@gk24v7rkvwok>
X-Patchwork-Hint: comment
Subject: Re: [Intel-xe] [PATCH] drm/xe/irq: Clear GFX_MSTR_IRQ as part of
 IRQ reset
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 19, 2023 at 11:08:04PM -0500, Lucas De Marchi wrote:
> On Tue, Sep 19, 2023 at 02:35:51PM -0300, Gustavo Sousa wrote:
> >Quoting Lucas De Marchi (2023-09-19 14:31:24-03:00)
> >>On Tue, Sep 19, 2023 at 11:41:10AM -0300, Gustavo Sousa wrote:
> >>>Starting with Xe_LP+, GFX_MSTR_IRQ contains status bits that have W1C
> >>>behavior. If we do not properly reset them, we would miss delivery of
> >>>interrupts if a pending bit is set when enabling IRQs.
> >>>
> >>>As an example, the display part of our probe routine contains paths
> >>>where we wait for vblank interrupts. If a display interrupt was already
> >>>pending when enabling IRQs, we would time out waiting for the vblank.
> >>>
> >>>That in fact happened recently when modprobing Xe on a Lunar Lake with a
> >>>specific configuration; and that's how we found out we were missing this
> >>>step in the IRQ enabling logic.
> >>>
> >>>Fix the issue by clearing GFX_MSTR_IRQ as part of the IRQ reset.
> >>>
> >>>BSpec: 50875, 54028, 62357
> >>>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> >>>---
> >>> drivers/gpu/drm/xe/xe_irq.c | 4 ++++
> >>> 1 file changed, 4 insertions(+)
> >>>
> >>>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> >>>index ccb934f8fa34..3746e9204e48 100644
> >>>--- a/drivers/gpu/drm/xe/xe_irq.c
> >>>+++ b/drivers/gpu/drm/xe/xe_irq.c
> >>>@@ -456,6 +456,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
> >>>
> >>> static void gt_irq_reset(struct xe_tile *tile)
> >>> {
> >>>+        struct xe_device *xe = tile_to_xe(tile);
> >>>         struct xe_gt *mmio = tile->primary_gt;
> >>>
> >>>         u32 ccs_mask = xe_hw_engine_mask_per_class(tile->primary_gt,
> >>>@@ -463,6 +464,9 @@ static void gt_irq_reset(struct xe_tile *tile)
> >>>         u32 bcs_mask = xe_hw_engine_mask_per_class(tile->primary_gt,
> >>>                                                    XE_ENGINE_CLASS_COPY);
> >>>
> >>>+        if (GRAPHICS_VERx100(xe) >= 1210)
> >>>+                xe_mmio_write32(mmio, GFX_MSTR_IRQ, ~0);
> >>
> >>shouldn´t you exclude bit 31 (MSTR_INT) since it'ss not a status bit
> >>and would rather enable the interrupts... ?
> >
> >I thought about that, but looking closer at the BSpec for that register, that
> >bit seems not to exist for the targeted graphics IPs.
> 
> true, I missed that... but then this would be a weird place to reset
> it. We already forked the irq setup in xe_irq_reset(). Also, this
> is going to be called for each gt, which doesn't seem right.
> Better to move it to dg1_irq_reset().

It should also be cleared after disabling/masking off all the lower
level interrupts, otherwise you could just get some bit relatching
immediately after clearing it.

Also, are the latched bits single or double buffered? If double
then we need the double clear that standard IIR registers use.

-- 
Ville Syrjälä
Intel
