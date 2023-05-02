Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7472C7EE22
	for <intel-xe@archiver.kernel.org>; Tue,  2 May 2023 19:18:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC6F010E01F;
	Tue,  2 May 2023 19:18:51 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2654210E01F
 for <intel-xe@lists.freedesktop.org>; Tue,  2 May 2023 19:18:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4B06762585;
 Tue,  2 May 2023 19:18:49 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.55.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 077DBC433D2;
 Tue,  2 May 2023 19:18:46 +0000 (UTC)
Date: Tue, 2 May 2023 15:18:44 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <ZFFiFFmlc4b3ZDuw@rdvivi-mobl4>
References: <20230425192624.168640-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230425192624.168640-1-jose.souza@intel.com>
Subject: Re: [Intel-xe] [PATCH v2 00/15] Display fixes
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
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Apr 25, 2023 at 12:26:09PM -0700, José Roberto de Souza wrote:
> This patch series does 4 main things:
> - fix the dkl phy mutex initialization by:
> 	- backporting: https://patchwork.freedesktop.org/series/116431/
> 	- backporting: https://patchwork.freedesktop.org/patch/msgid/20230420170558.35398-1-jose.souza@intel.com
> 	- fixing display function calls
> 
> - enable modular fia in TGL
> 	- this patch will be gone in next Xe rebase as has_modular_fia
> 	was removed in drm-tip. Not backporting patches removing it
> 	because it is a huge series.
> 
> - Makes has_psr_hw_tracking default as 0, as only TGL and DG1 supports
> PSR HW tracking in Xe kmd
> 
> - Enable Raptorlake-P
> 
> v2:
> - function call fixes in 'squash! drm/xe/display: Implement display support'
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/249

Since I'm delaying on the rebase I was expecting for this week, I went
ahead and pushed this series so we unblock folks.

As we agreed in the chat, I added you SoB in all the backported patches
you submit. Anyone in the way of patch deliverable needs to add the SoB
by the rules... Let's try to follow the rules even though these patches
will be gone on the next rebase so we don't end up accidentally missing
something behind...

> 
> Jani Nikula (10):
>   drm/i915/display: remove intel_display_commit_duplicated_state()
>   drm/i915/display: start high level display driver file
>   drm/i915/display: move intel_modeset_probe_defer() to
>     intel_display_driver.[ch]
>   drm/i915/display: rename intel_modeset_probe_defer() ->
>     intel_display_driver_probe_defer()
>   drm/i915/display: move modeset probe/remove functions to
>     intel_display_driver.c
>   drm/i915/display: rename intel_display_driver_* functions
>   drm/i915/display: add intel_display_reset.[ch]
>   drm/i915/display: move display suspend/resume to
>     intel_display_driver.[ch]
>   drm/i915/display: rename intel_display_driver_suspend/resume functions
>   drm/i915/display: add intel_display_driver_early_probe()
> 
> José Roberto de Souza (5):
>   drm/i915: Initialize dkl_phy spin lock from display code path
>   squash! drm/xe/display: Implement display support
>   TEMPORARY: drm/xe/display: Enable modular fia in TGL
>   drm/xe/display: Disable PSR HW tracking by default in all display
>     versions
>   drm/xe: Enable Raptorlake-P
> 
>  drivers/gpu/drm/i915/Makefile                 |   2 +
>  drivers/gpu/drm/i915/display/intel_display.c  | 693 +-----------------
>  drivers/gpu/drm/i915/display/intel_display.h  |  29 +-
>  .../drm/i915/display/intel_display_driver.c   | 585 +++++++++++++++
>  .../drm/i915/display/intel_display_driver.h   |  36 +
>  .../drm/i915/display/intel_display_reset.c    | 135 ++++
>  .../drm/i915/display/intel_display_reset.h    |  14 +
>  drivers/gpu/drm/i915/display/intel_dkl_phy.c  |   9 +
>  drivers/gpu/drm/i915/display/intel_dkl_phy.h  |   1 +
>  drivers/gpu/drm/i915/gt/intel_reset.c         |   6 +-
>  drivers/gpu/drm/i915/i915_driver.c            |  35 +-
>  drivers/gpu/drm/i915/i915_irq.c               |   2 +-
>  drivers/gpu/drm/i915/i915_pci.c               |   3 +-
>  drivers/gpu/drm/xe/Makefile                   |   1 +
>  drivers/gpu/drm/xe/xe_display.c               |  38 +-
>  drivers/gpu/drm/xe/xe_pci.c                   |   1 +
>  16 files changed, 854 insertions(+), 736 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/display/intel_display_driver.c
>  create mode 100644 drivers/gpu/drm/i915/display/intel_display_driver.h
>  create mode 100644 drivers/gpu/drm/i915/display/intel_display_reset.c
>  create mode 100644 drivers/gpu/drm/i915/display/intel_display_reset.h
> 
> -- 
> 2.40.0
> 
