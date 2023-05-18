Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CBBC77B7D
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 19:52:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B4A610E547;
	Thu, 18 May 2023 19:52:54 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A33BC10E547
 for <intel-xe@lists.freedesktop.org>; Thu, 18 May 2023 19:52:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D0AB6651C8;
 Thu, 18 May 2023 19:52:51 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.55.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id D522BC433D2;
 Thu, 18 May 2023 19:52:48 +0000 (UTC)
Date: Thu, 18 May 2023 15:52:46 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Jouni =?iso-8859-1?Q?H=F6gander?= <jouni.hogander@intel.com>
Message-ID: <ZGaCDuMYN5Mt47tI@rdvivi-mobl4>
References: <20230515094614.1850878-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230515094614.1850878-1-jouni.hogander@intel.com>
Subject: Re: [Intel-xe] [PATCH 0/4] Revert frontbuffer tracking removal
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, uma.shankar@intel.com,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, May 15, 2023 at 12:46:10PM +0300, Jouni Högander wrote:
> Even if frontbuffer tracking is targeted being discontinued it is seen as
> too risky to remove it completely at this point -> Revert frontbuffer
> tracking removal patches. Also add fixup patches to handle build breakage
> caused by these reverts.
> 
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
for the series, but I'm afraid that you will need to rebase
to get the patch 2 applying again.

> 
> Jouni Högander (4):
>   Revert "drm/i915/display: Neuter frontbuffer tracking harder"
>   Revert "drm/i915: Remove gem and overlay frontbuffer tracking"
>   fixup! drm/i915/display: Remaining changes to make xe compile
>   fixup! drm/xe/display: Implement display support
> 
>  drivers/gpu/drm/i915/display/i9xx_plane.c     |   1 -
>  drivers/gpu/drm/i915/display/intel_cursor.c   |   6 +-
>  drivers/gpu/drm/i915/display/intel_display.c  |   4 +-
>  .../drm/i915/display/intel_display_types.h    |   8 +-
>  drivers/gpu/drm/i915/display/intel_fb.c       |  19 ++-
>  drivers/gpu/drm/i915/display/intel_fb_pin.c   |   6 +
>  drivers/gpu/drm/i915/display/intel_fbdev.c    |   7 +-
>  .../gpu/drm/i915/display/intel_frontbuffer.c  | 128 ++++++++++++++++--
>  .../gpu/drm/i915/display/intel_frontbuffer.h  |  76 +++++++++--
>  drivers/gpu/drm/i915/display/intel_overlay.c  |  14 ++
>  .../drm/i915/display/intel_plane_initial.c    |   3 +-
>  drivers/gpu/drm/i915/display/intel_sprite.c   |   1 -
>  drivers/gpu/drm/i915/gem/i915_gem_clflush.c   |   4 +
>  drivers/gpu/drm/i915/gem/i915_gem_domain.c    |   7 +
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |   2 +
>  drivers/gpu/drm/i915/gem/i915_gem_object.c    |  25 ++++
>  drivers/gpu/drm/i915/gem/i915_gem_object.h    |  22 +++
>  drivers/gpu/drm/i915/gem/i915_gem_phys.c      |   4 +
>  drivers/gpu/drm/i915/i915_driver.c            |   1 -
>  drivers/gpu/drm/i915/i915_gem.c               |   8 ++
>  drivers/gpu/drm/i915/i915_gem_gtt.c           |   1 +
>  drivers/gpu/drm/i915/i915_vma.c               |  12 ++
>  drivers/gpu/drm/xe/display/xe_plane_initial.c |   2 +-
>  23 files changed, 321 insertions(+), 40 deletions(-)
> 
> -- 
> 2.34.1
> 
