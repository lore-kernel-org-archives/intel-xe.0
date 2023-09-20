Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACD6C0031C
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 17:02:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C647410E0E6;
	Wed, 20 Sep 2023 17:02:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C4A310E0E6
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 17:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695229339; x=1726765339;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=hIVCdEdxPQATaN4XYvuqcIswg1nNqN364pxa4rUXMQI=;
 b=EtKdGcV2jp0VRLbevUWK0hBQ535BVsWhif5+ZA7ben153xF7dnLiCyJl
 elSplLwqB/QAoDaSfX9qn0mU8h4da93lw8CpXxKT6d+4Fin4xSr7MKDFm
 FPi461+RoAnH4h5vS1EOV/0z2QIqoy+HxW2Z2nQXnA6U4PojLxx9dfMY9
 eQKs2Jt1V6nuQC6n4taH3rzLK/P8MW/wanjByC1P1MSkcm55STyQ8ezaV
 UR9PQ7LPQ5eihi9yUNFepODb1YPJ7izDFRvJHCyi+qZRryFsxnv9KEiB0
 1WIqsrxzbxwK6NILVHcbkbDHgXAFXL9IB9tcNPaGodqlNi1mgS+cfzK7h A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="411227344"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="411227344"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 10:02:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="749989915"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="749989915"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by fmsmga007.fm.intel.com with SMTP; 20 Sep 2023 10:02:04 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 20 Sep 2023 20:02:03 +0300
Date: Wed, 20 Sep 2023 20:02:03 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <ZQsli9iUesaFUXwH@intel.com>
References: <20230919144111.32702-1-gustavo.sousa@intel.com>
 <w7l6s4ywimggliinhccwbpnvepxera3an6raryyffusmenesng@me7t4rjxmyjz>
 <169514495100.2105.12416170725310981140@gjsousa-mobl2>
 <l4avy36wdkxxcmc2beblwvplfokvhrxbybfmmsmm22mt6gjjyc@gk24v7rkvwok>
 <ZQrPxAC4dBYv9fNi@intel.com>
 <169522701249.7665.16720184796685652725@gjsousa-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <169522701249.7665.16720184796685652725@gjsousa-mobl2>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Sep 20, 2023 at 01:23:32PM -0300, Gustavo Sousa wrote:
> Quoting Ville Syrjälä (2023-09-20 07:56:04-03:00)
> >On Tue, Sep 19, 2023 at 11:08:04PM -0500, Lucas De Marchi wrote:
> >> On Tue, Sep 19, 2023 at 02:35:51PM -0300, Gustavo Sousa wrote:
> >> >Quoting Lucas De Marchi (2023-09-19 14:31:24-03:00)
> >> >>On Tue, Sep 19, 2023 at 11:41:10AM -0300, Gustavo Sousa wrote:
> >> >>>Starting with Xe_LP+, GFX_MSTR_IRQ contains status bits that have W1C
> >> >>>behavior. If we do not properly reset them, we would miss delivery of
> >> >>>interrupts if a pending bit is set when enabling IRQs.
> >> >>>
> >> >>>As an example, the display part of our probe routine contains paths
> >> >>>where we wait for vblank interrupts. If a display interrupt was already
> >> >>>pending when enabling IRQs, we would time out waiting for the vblank.
> >> >>>
> >> >>>That in fact happened recently when modprobing Xe on a Lunar Lake with a
> >> >>>specific configuration; and that's how we found out we were missing this
> >> >>>step in the IRQ enabling logic.
> >> >>>
> >> >>>Fix the issue by clearing GFX_MSTR_IRQ as part of the IRQ reset.
> >> >>>
> >> >>>BSpec: 50875, 54028, 62357
> >> >>>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> >> >>>---
> >> >>> drivers/gpu/drm/xe/xe_irq.c | 4 ++++
> >> >>> 1 file changed, 4 insertions(+)
> >> >>>
> >> >>>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> >> >>>index ccb934f8fa34..3746e9204e48 100644
> >> >>>--- a/drivers/gpu/drm/xe/xe_irq.c
> >> >>>+++ b/drivers/gpu/drm/xe/xe_irq.c
> >> >>>@@ -456,6 +456,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
> >> >>>
> >> >>> static void gt_irq_reset(struct xe_tile *tile)
> >> >>> {
> >> >>>+        struct xe_device *xe = tile_to_xe(tile);
> >> >>>         struct xe_gt *mmio = tile->primary_gt;
> >> >>>
> >> >>>         u32 ccs_mask = xe_hw_engine_mask_per_class(tile->primary_gt,
> >> >>>@@ -463,6 +464,9 @@ static void gt_irq_reset(struct xe_tile *tile)
> >> >>>         u32 bcs_mask = xe_hw_engine_mask_per_class(tile->primary_gt,
> >> >>>                                                    XE_ENGINE_CLASS_COPY);
> >> >>>
> >> >>>+        if (GRAPHICS_VERx100(xe) >= 1210)
> >> >>>+                xe_mmio_write32(mmio, GFX_MSTR_IRQ, ~0);
> >> >>
> >> >>shouldn´t you exclude bit 31 (MSTR_INT) since it'ss not a status bit
> >> >>and would rather enable the interrupts... ?
> >> >
> >> >I thought about that, but looking closer at the BSpec for that register, that
> >> >bit seems not to exist for the targeted graphics IPs.
> >> 
> >> true, I missed that... but then this would be a weird place to reset
> >> it. We already forked the irq setup in xe_irq_reset(). Also, this
> >> is going to be called for each gt, which doesn't seem right.
> >> Better to move it to dg1_irq_reset().
> >
> >It should also be cleared after disabling/masking off all the lower
> >level interrupts, otherwise you could just get some bit relatching
> >immediately after clearing it.
> 
> Meaning to move this to be done after the call to
> xe_display_irq_reset()?

It should be more or less the last thing we clear.

> 
> The BSpec says:
> 
>   "For any new interrupts set after the 190010h read, new interrupts are
>   re-generated after setting 31 of 190008h."
> 
> Considering that we disable interrupts with dg1_intr_disable(), doesn't
> that mean that relatching won't happen until dg1_intr_enable() gets
> called?

Typically the latching happens whenever the lower level
interrupt register has an edge. The master interrupt
enable should only determine if those latched bits
propagate further in the chain.

So the master interrupt enable is basically same functions as IER,
whereas the latched status bits in there are now more or less
equivalent to IIR. There is no IMR equivalent to prevent the bits
from being latched in the first place.

> 
> Btw, from the sentence above, I believe the proper way of resetting this
> register would be to read its value and then write it back instead of
> simply writing 1's as I did in this version.

When handling interrupts you obviously want to write back the
value that you read out as those are the interrupts you are going
to handle. Clearing any other bit would risk losing said interrupts.
During irq_reset() we aren't going to handle anything so just
blindly clearing all bits is fine.

-- 
Ville Syrjälä
Intel
