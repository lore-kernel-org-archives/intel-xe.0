Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F06F9936C
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 10:58:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B32110F093;
	Thu, 23 Apr 2026 10:58:38 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C367110F093;
 Thu, 23 Apr 2026 10:58:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_enabl?=
 =?utf-8?q?e_ccs_modifiers_on_dg2?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 23 Apr 2026 10:58:37 -0000
Message-ID: <177694191779.2778.9644449661144942940@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260423101739.2772745-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20260423101739.2772745-1-juhapekka.heikkila@gmail.com>
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

Series: drm/i915/display: enable ccs modifiers on dg2
URL   : https://patchwork.freedesktop.org/series/165351/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b42c7f53219a11f9182009f8d70cb70a408ea5d5
Author: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date:   Thu Apr 23 13:17:39 2026 +0300

    drm/i915/display: enable ccs modifiers on dg2
    
    Since Xe driver aux ccs enablement dg2 ccs modifiers have been
    disabled on both Xe and i915 drivers. Here allow dg2 to use
    ccs again for framebuffers.
    
    Fixes: 6a99e91 ("drm/i915/display: Detect AuxCCS support via display parent interface")
    Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
+ /mt/dim checkpatch 95fbbe4877e1543975d0d0f18a7cc0074416be41 drm-intel
b42c7f53219a drm/i915/display: enable ccs modifiers on dg2
-:10: WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes: <12+ chars of sha1> ("<title line>")' - ie: 'Fixes: 6a99e91a6ca8 ("drm/i915/display: Detect AuxCCS support via display parent interface")'
#10: 
Fixes: 6a99e91 ("drm/i915/display: Detect AuxCCS support via display parent interface")

total: 0 errors, 1 warnings, 0 checks, 21 lines checked


