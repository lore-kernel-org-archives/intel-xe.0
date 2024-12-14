Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C729E7716A
	for <intel-xe@archiver.kernel.org>; Sat, 14 Dec 2024 13:43:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D2010E0A7;
	Sat, 14 Dec 2024 13:43:36 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45D210E0A7;
 Sat, 14 Dec 2024 13:43:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/connector=3A_make_mod?=
 =?utf-8?q?e=5Fvalid=28=29_callback_accept_const_mode_pointer_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 14 Dec 2024 13:43:34 -0000
Message-ID: <173418381486.2533635.9431734874368339518@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241214-drm-connector-mode-valid-const-v2-0-4f9498a4c822@linaro.org>
In-Reply-To: <20241214-drm-connector-mode-valid-const-v2-0-4f9498a4c822@linaro.org>
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

Series: drm/connector: make mode_valid() callback accept const mode pointer (rev2)
URL   : https://patchwork.freedesktop.org/series/141429/
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
commit 1e7b9dc5f78def09a0b3406da2a606e3b9ba6a25
Author: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat Dec 14 15:37:09 2024 +0200

    drm/connector: make mode_valid take a const struct drm_display_mode
    
    The mode_valid() callbacks of drm_encoder, drm_crtc and drm_bridge
    take a const struct drm_display_mode argument. Change the mode_valid
    callback of drm_connector to also take a const argument.
    
    Acked-by: Jani Nikula <jani.nikula@intel.com>
    Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
    Reviewed-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
    Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
    Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+ /mt/dim checkpatch ed42e55b9d8bcc9c4a8c179071e6166a5e423913 drm-intel
df7fcd5fb252 drm/encoder_slave: make mode_valid accept const struct drm_display_mode
3f74b5925fe9 drm/amdgpu: don't change mode in amdgpu_dm_connector_mode_valid()
61b3e4bd3703 drm/sti: hda: pass const struct drm_display_mode* to hda_get_mode_idx()
f7f2d06215b9 drm/connector: make mode_valid_ctx take a const struct drm_display_mode
1e7b9dc5f78d drm/connector: make mode_valid take a const struct drm_display_mode


