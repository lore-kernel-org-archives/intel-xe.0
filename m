Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DDE9C77B7C
	for <intel-xe@archiver.kernel.org>; Fri, 12 May 2023 14:01:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0674F10E6C5;
	Fri, 12 May 2023 14:01:13 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C621B10E6C5
 for <intel-xe@lists.freedesktop.org>; Fri, 12 May 2023 14:01:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 282E260B39;
 Fri, 12 May 2023 14:01:10 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.55.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id B6402C433D2;
 Fri, 12 May 2023 14:01:07 +0000 (UTC)
Date: Fri, 12 May 2023 10:01:05 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <ZF5GoZIRfdHPg+2w@rdvivi-mobl4>
References: <20230510160220.714725-1-jani.nikula@intel.com>
 <fliqzlotxeedvkcickrymodhpkh7sqheqy7pgzoyrfdcpzcv7q@a25nxqhm5fbe>
 <87mt2bkpye.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mt2bkpye.fsf@intel.com>
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe/display: Add intel_pps support
 too
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, May 11, 2023 at 03:33:29PM +0300, Jani Nikula wrote:
> On Wed, 10 May 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> > On Wed, May 10, 2023 at 07:02:20PM +0300, Jani Nikula wrote:
> >>This is an unrelated, unneeded change in "drm/xe/display: Add intel_pps
> >>support too".
> >>
> >>After that gets applied, "drm/xe/display: Add intel_pps support too"
> >>should itself be a fixup to "drm/xe/display: Implement display support".
> >>
> >>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >
> >
> > Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> Thanks, pushed to drm-xe-next.
> 
> Rodrigo, what would be the best way to add a git rebase todo list for
> you?

An email here is fine.

I'm going to run a git rebase clean-up today or next monday.

what do I need to do besides taking care of the fixup and remove the dummy
commits?

(my only rule is that the rebase clean-up git diff HEAD..origin/drm-xe-next needs to come empty)

> 
> 
> BR,
> Jani.
> 
> 
> >
> > Lucas De Marchi
> >
> >>---
> >> drivers/gpu/drm/i915/display/intel_pps.c | 2 +-
> >> 1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >>diff --git a/drivers/gpu/drm/i915/display/intel_pps.c b/drivers/gpu/drm/i915/display/intel_pps.c
> >>index cfe40c64f6d4..c859b066e827 100644
> >>--- a/drivers/gpu/drm/i915/display/intel_pps.c
> >>+++ b/drivers/gpu/drm/i915/display/intel_pps.c
> >>@@ -481,7 +481,7 @@ static void intel_pps_get_registers(struct intel_dp *intel_dp,
> >> 				    struct pps_registers *regs)
> >> {
> >> 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
> >>-	int pps_idx = 0;
> >>+	int pps_idx;
> >>
> >> 	memset(regs, 0, sizeof(*regs));
> >>
> >>-- 
> >>2.39.2
> >>
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center
