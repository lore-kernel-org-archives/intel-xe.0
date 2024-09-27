Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D32CEBF81
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 08:26:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3725010E34E;
	Fri, 27 Sep 2024 08:26:54 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A66AF10E34E;
 Fri, 27 Sep 2024 08:26:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_gpu=3A_drm=3A_i915=3A_dis?=
 =?utf-8?q?play=3A_Avoid_null_values_intel=5Fplane=5Fatomic=5Fcheck=5Fwith?=
 =?utf-8?q?=5Fstate?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Sep 2024 08:26:53 -0000
Message-ID: <172742561367.1110099.16544996198770395994@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240927000146.50830-1-alessandro.zanni87@gmail.com>
In-Reply-To: <20240927000146.50830-1-alessandro.zanni87@gmail.com>
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
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: gpu: drm: i915: display: Avoid null values intel_plane_atomic_check_with_state
URL   : https://patchwork.freedesktop.org/series/139198/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c44d377fcea6a6ec5c0b37bf778604da26f5fada
Author: Jani Nikula <jani.nikula@linux.intel.com>
Date:   Fri Sep 27 11:20:32 2024 +0300

    gpu: drm: i915: display: Avoid null values intel_plane_atomic_check_with_state
    
    On Fri, 27 Sep 2024, Alessandro Zanni <alessandro.zanni87@gmail.com> wrote:
    > This fix solves multiple Smatch errors:
    >
    > drivers/gpu/drm/i915/display/intel_atomic_plane.c:660
    > intel_plane_atomic_check_with_state() error:
    > we previously assumed 'fb' could be null (see line 648)
    >
    > drivers/gpu/drm/i915/display/intel_atomic_plane.c:664
    > intel_plane_atomic_check_with_state()
    > error: we previously assumed 'fb' could be null (see line 659)
    >
    > drivers/gpu/drm/i915/display/intel_atomic_plane.c:671
    > intel_plane_atomic_check_with_state()
    > error: we previously assumed 'fb' could be null (see line 663)
    >
    > We should check first if fb is not null before to access its properties.
    
    new_plane_state->uapi.visible && !fb should not be possible, but it's
    probably too hard for smatch to figure out. It's not exactly trivial for
    humans to figure out either.
    
    I'm thinking something like below to help both.
    
    Ville, thoughts?
    
    BR,
    Jani.
    
    >
    > Signed-off-by: Alessandro Zanni <alessandro.zanni87@gmail.com>
    > ---
    >  drivers/gpu/drm/i915/display/intel_atomic_plane.c | 6 +++---
    >  1 file changed, 3 insertions(+), 3 deletions(-)
    >
    > diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
    > index e979786aa5cf..1606f79b39e6 100644
    > --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
    > +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
    > @@ -656,18 +656,18 @@ int intel_plane_atomic_check_with_state(const struct intel_crtc_state *old_crtc_
    >           intel_plane_is_scaled(new_plane_state))
    >               new_crtc_state->scaled_planes |= BIT(plane->id);
    >
    > -     if (new_plane_state->uapi.visible &&
    > +     if (new_plane_state->uapi.visible && fb &&
    >           intel_format_info_is_yuv_semiplanar(fb->format, fb->modifier))
    >               new_crtc_state->nv12_planes |= BIT(plane->id);
    >
    > -     if (new_plane_state->uapi.visible &&
    > +     if (new_plane_state->uapi.visible && fb &&
    >           fb->format->format == DRM_FORMAT_C8)
    >               new_crtc_state->c8_planes |= BIT(plane->id);
    >
    >       if (new_plane_state->uapi.visible || old_plane_state->uapi.visible)
    >               new_crtc_state->update_planes |= BIT(plane->id);
    >
    > -     if (new_plane_state->uapi.visible &&
    > +     if (new_plane_state->uapi.visible && fb &&
    >           intel_format_info_is_yuv_semiplanar(fb->format, fb->modifier)) {
    >               new_crtc_state->data_rate_y[plane->id] =
    >                       intel_plane_data_rate(new_crtc_state, new_plane_state, 0);
+ /mt/dim checkpatch c114fec0af7e702962ba625f659e4647a9887194 drm-intel
c44d377fcea6 gpu: drm: i915: display: Avoid null values intel_plane_atomic_check_with_state
-:41: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#41: 
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c

-:81: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 1 warnings, 0 checks, 9 lines checked


