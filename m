Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D983E7717F
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 17:53:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4417510E431;
	Thu, 12 Dec 2024 17:53:58 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CBD610E01F;
 Thu, 12 Dec 2024 17:53:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/=7Bi915=2Cxe=7D=3A_Co?=
 =?utf-8?q?nvert_to_DRM_client_setup?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Dec 2024 17:53:56 -0000
Message-ID: <173402603657.1677623.4427471335952015089@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241212170913.185939-1-tzimmermann@suse.de>
In-Reply-To: <20241212170913.185939-1-tzimmermann@suse.de>
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

Series: drm/{i915,xe}: Convert to DRM client setup
URL   : https://patchwork.freedesktop.org/series/142499/
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
commit d71513f7f3a296e505f1737bd87a53c3c562f4d1
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Thu Dec 12 18:08:53 2024 +0100

    drm/fb-helper: Remove struct drm_fb_helper.fb_probe
    
    The callback fb_probe in struct drm_fb_helper is unused. Remove it.
    New drivers should set struct drm_driver.fbdev_probe instead and call
    drm_client_setup() to instantiate in-kernel DRM clients.
    
    Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
+ /mt/dim checkpatch 1833817dea7ab2961cc662bfc451bc232c5d24cc drm-intel
ce4d02412067 drm/{i915, xe}: Suspend/resume fbdev emulation via client interfaces
57d055437a1d drm/client: Add client-hotplug helper
b65e08c2b9a0 drm/client: Send pending hotplug events after resume
989987dc6bd5 drm/i915/display: Remove fbdev suspend and hotplug tracking
d08673893ce2 drm/i915/display: fbdev: Move custom restore code to new callback
2009a2cadbf1 drm/i915/display: fbdev: Move custom suspend code to new callback
31f2d7cf8046 drm/i915/display: Remove preferred_bpp from struct intel_fbdev
63b9ad4b0c82 drm/i915/display: Remove struct drm_fb_helper from struct intel_fbdev
5789e20ecabc drm/i915/display: Move fbdev code around
2baf7b446488 drm/{i915,xe}: Run DRM default client setup
9c44f7aa204e drm/i915/display: Remove compile guard around fbdev debugfs output
d71513f7f3a2 drm/fb-helper: Remove struct drm_fb_helper.fb_probe


