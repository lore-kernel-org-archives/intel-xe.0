Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8573D1036F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 02:23:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A660B10E4F7;
	Wed, 26 Nov 2025 02:23:23 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A478910E4F7;
 Wed, 26 Nov 2025 02:23:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/hdcp=3A_call_HDC?=
 =?utf-8?q?P_GSC_hook_via_parent_interface?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Nov 2025 02:23:22 -0000
Message-ID: <176412380266.28035.2995331504164147245@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <cover.1764090990.git.jani.nikula@intel.com>
In-Reply-To: <cover.1764090990.git.jani.nikula@intel.com>
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

Series: drm/i915/hdcp: call HDCP GSC hook via parent interface
URL   : https://patchwork.freedesktop.org/series/158054/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 197157ab4a71fc5637865adda3a0acc33e1e762d
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Nov 25 19:17:44 2025 +0200

    drm/{i915, xe}/hdcp: use parent interface for HDCP GSC calls
    
    The HDCP GSC implementation is different for both i915 and xe. Add it to
    the display parent interface, and call the hooks via the parent
    interface.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 8052b0ba2e97387477c22ba816fabca9a4728aae drm-intel
44659edd9958 drm/i915/hdcp: move i915 specific HDCP GSC implementation to i915
-:37: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#37: 
rename from drivers/gpu/drm/i915/display/intel_hdcp_gsc.c

total: 0 errors, 1 warnings, 0 checks, 29 lines checked
197157ab4a71 drm/{i915, xe}/hdcp: use parent interface for HDCP GSC calls
-:38: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#38: 
deleted file mode 100644

-:259: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#259: FILE: drivers/gpu/drm/i915/display/intel_parent.c:30:
+	return display->parent->hdcp->gsc_msg_send(gsc_context, msg_in, msg_in_len, msg_out, msg_out_len);

total: 0 errors, 2 warnings, 0 checks, 434 lines checked


