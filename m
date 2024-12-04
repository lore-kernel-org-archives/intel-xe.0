Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA5CE7716B
	for <intel-xe@archiver.kernel.org>; Wed,  4 Dec 2024 15:39:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5908310E4E0;
	Wed,  4 Dec 2024 15:39:20 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D37910E4E0;
 Wed,  4 Dec 2024 15:39:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/display=3A_handl?=
 =?utf-8?q?e_hdmi_connector_init_failures=2C_and_no_HDMI/DP_cases?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 04 Dec 2024 15:39:19 -0000
Message-ID: <173332675911.2548676.3793875192669652463@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1733324735.git.jani.nikula@intel.com>
In-Reply-To: <cover.1733324735.git.jani.nikula@intel.com>
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

Series: drm/i915/display: handle hdmi connector init failures, and no HDMI/DP cases
URL   : https://patchwork.freedesktop.org/series/142118/
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
commit b0b6f4285e556d124825401119c1807efbc93c4b
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Dec 4 17:07:21 2024 +0200

    drm/i915/ddi: only call shutdown hooks for valid encoders
    
    DDI might be HDMI or DP only, leaving the other encoder
    uninitialized. Calling the shutdown hook on an uninitialized encoder may
    lead to a NULL pointer dereference. Check the encoder types (and thus
    validity via the DP output_reg or HDMI hdmi_reg checks) before calling
    the hooks.
    
    Reported-by: Sergey Senozhatsky <senozhatsky@chromium.org>
    Closes: https://lore.kernel.org/r/20241031105145.2140590-1-senozhatsky@chromium.org
    Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
    Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch c8df5caf278df4f9ca0aba627047c5ee4318fc0d drm-intel
87a982965be7 drm/i915/hdmi: propagate errors from intel_hdmi_init_connector()
b7349cbc4c5f drm/i915/hdmi: add error handling in g4x_hdmi_init()
ca90192bb396 drm/i915/ddi: propagate errors from intel_ddi_init_hdmi_connector()
e8cd1da1d651 drm/i915/display: add intel_encoder_is_hdmi()
b0b6f4285e55 drm/i915/ddi: only call shutdown hooks for valid encoders


