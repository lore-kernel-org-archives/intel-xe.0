Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C5DC0218A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 19:13:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2CC610E032;
	Thu, 30 Jan 2025 19:13:34 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0096510E032;
 Thu, 30 Jan 2025 19:13:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/vrr=3A_Fix_DSB+V?=
 =?utf-8?q?RR_usage_for_PTL+?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 Jan 2025 19:13:33 -0000
Message-ID: <173826441399.2949890.5732114114966486200@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250130184518.22353-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250130184518.22353-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/vrr: Fix DSB+VRR usage for PTL+
URL   : https://patchwork.freedesktop.org/series/144152/
State : success

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
commit a09986c0798022b7fdba99410d99c06e27673fe1
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Thu Jan 30 20:45:18 2025 +0200

    drm/i915/vrr: Poll for the push send bit to clear on the DSB
    
    Since we now do the "wait for safe window" before triggering
    the push send, there is a theoretical possibity that we may
    have screwed up the vblank evasion and the push has slipped
    past the vmax decision boundary. In that case the push would
    only happen after the next frame's vactive, while we've
    already signalled the flip to have completed via the DSB
    interrupt immediately after triggering the push.
    
    To make sure we catch such screwups let's poll for the push
    send bit to clear. Assuming vblank delay has been dealt with
    already it should clear within ~1 scanline. But for safety
    let's give it ~2 scanlines. If the bit does not clear within
    that time the DSB will raise the poll error interrupt to inform
    us that something went wrong.
    
    Also I suppose it might generally be a good idea to make sure
    the send bit has cleared before we complete the commit because
    we're not supposed to send a new push while the previous one
    is still pending.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6 drm-intel
718c4a0eb7a6 drm/i915/dsb: Introduce intel_dsb_poll()
9173d096748b drm/i915/vrr: Reorder the DSB "wait for safe window" vs. TRANS_PUSH
a09986c07980 drm/i915/vrr: Poll for the push send bit to clear on the DSB


