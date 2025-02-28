Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F071DC282C6
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 18:00:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9807010ED19;
	Fri, 28 Feb 2025 18:00:29 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B6210ED19;
 Fri, 28 Feb 2025 18:00:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/vdsc=3A_Use_the_?=
 =?utf-8?q?DSC_config_tables_for_DSI_panels_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 28 Feb 2025 18:00:28 -0000
Message-ID: <174076562884.3265359.12368727465665450174@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250228152531.403026-1-suraj.kandpal@intel.com>
In-Reply-To: <20250228152531.403026-1-suraj.kandpal@intel.com>
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

Series: drm/i915/vdsc: Use the DSC config tables for DSI panels (rev5)
URL   : https://patchwork.freedesktop.org/series/145560/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d9e0b045079b2b1b7af223f021462b993275b4c7
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Fri Feb 28 20:55:32 2025 +0530

    drm/i915/vdsc: Use the DSC config tables for DSI panels
    
    Some DSI panel vendors end up hardcoding PPS params because of which
    it does not listen to the params sent from the source. We use the
    default config tables for DSI panels when using DSC 1.1 rather than
    calculate our own rc parameters.
    
    --v2
    -Use intel_crtc_has_type [Jani]
    
    --v4
    -Use a function to check Mipi dsi dsc 1.1 condition [Ankit]
    -Add documentation for using this condition [Ankit]
    -Rebase
    
    --v5
    -Pass only the crtc_state [Jani]
    -Fixup the comment [Jani]
    -Check for dsc major version [Jani]
    -Use co-developed-by tag [Jani]
    
    Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13719
    Co-developed-by: William Tseng <william.tseng@intel.com>
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch ca9d01b66c70413a62a1a28fbf8709d2e8440c1c drm-intel
d9e0b045079b drm/i915/vdsc: Use the DSC config tables for DSI panels
-:26: WARNING:BAD_SIGN_OFF: Co-developed-by and Signed-off-by: name/email do not match
#26: 
Co-developed-by: William Tseng <william.tseng@intel.com>
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

total: 0 errors, 1 warnings, 0 checks, 30 lines checked


