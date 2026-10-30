Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A1F606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 13:14:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D480010E4A8;
	Fri, 30 Oct 2026 13:14:31 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39DB10E0C6;
 Fri, 30 Oct 2026 13:14:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/dp=2C_drm/i915=3A_con?=
 =?utf-8?q?versions_from_seq=5Ffile_to_drm=5Fprinter?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 30 Oct 2026 13:14:30 -0000
Message-ID: <179336607072.94098.8417726534257591294@221881a7231d>
X-Patchwork-Hint: ignore
References: <cover.1793361738.git.jani.nikula@intel.com>
In-Reply-To: <cover.1793361738.git.jani.nikula@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: drm/dp, drm/i915: conversions from seq_file to drm_printer
URL   : https://patchwork.freedesktop.org/series/177252/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
3009867cd31863246e4afc138520a7a8bd37bb11
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b98917d28c7908f93e89fecbe56d2f1311a29b20
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri Oct 30 14:03:16 2026 +0200

    drm/i915/debugfs: prefer drm_printf_indent() over inline \t
    
    We have a helper drm_printf_indent() for tab indenting the prints. It
    makes the actual strings more readable, and highlights the indented
    parts better in source.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 29f9258a2788a1066c0910c480e65c80887f4d20 drm-intel
3c57e2978bf6 drm/dp: pass struct drm_printer to drm_dp_downstream_debug()
ecd821001ca2 drm/dp: prefer drm_printf_indent() over inline \t
8ae9ac860beb drm/i915/debugfs: pass struct drm_printer to intel_plane_info()
4786ce0752e1 drm/i915/debugfs: pass struct drm_printer to crtc_updates_info()
9be3c0869289 drm/i915/debugfs: convert crtc_updates_info() to use drm_printf_indent()
859aec1cd2bc drm/i915/debugfs: pass struct drm_printer to intel_scaler_info()
60bbab9c7362 drm/i915/debugfs: pass struct drm_printer to intel_encoder_info()
f00356d35a8d drm/i915/debugfs: pass struct drm_printer to intel_crtc_info()
af80aa85aa3e drm/i915/debugfs: pass struct drm_printer to intel_{dp, dp_mst, hdmi}_crtc_info()
90a28ba1077a drm/i915/debugfs: pass struct drm_printer to intel_hdcp_info()
50a20d5fbf32 drm/i915/debugfs: refactor intel_seq_print_mode() into intel_print_mode()
ebbe1c4b9df6 drm/i915/debugfs: pass struct drm_printer to intel_connector_info()
b98917d28c79 drm/i915/debugfs: prefer drm_printf_indent() over inline \t
-:128: WARNING:LONG_LINE: line length of 126 exceeds 100 columns
#128: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:366:
+				  plane_state->planar_linked_plane->base.base.id, plane_state->planar_linked_plane->base.name,

total: 0 errors, 1 warnings, 0 checks, 234 lines checked


