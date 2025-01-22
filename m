Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3450EC02181
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 15:49:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E5710E70E;
	Wed, 22 Jan 2025 15:49:33 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B57C10E70E;
 Wed, 22 Jan 2025 15:49:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915=3A_Improve_the_d?=
 =?utf-8?q?isplay_VT-d_workarounds?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 Jan 2025 15:49:31 -0000
Message-ID: <173756097130.3121218.9188498203864991491@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250122151755.6928-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250122151755.6928-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915: Improve the display VT-d workarounds
URL   : https://patchwork.freedesktop.org/series/143856/
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
commit fc4ad4f7f6d347172be60cb7c33ae0b1de8b8f68
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Wed Jan 22 17:17:55 2025 +0200

    drm/i915/fbdev: Use fb->normal_view.gtt
    
    Grab the GTT view for the fbdev fb pinning from
    fb->normal_view.gtt instead of having and extra one on
    the stack. Seems safer in case we ever put any new
    information into normal GTT views.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 6834acba715b85cbecfeb660b9695806e98c9a0a drm-intel
36cc8ec8954b drm/i915: Move VT-d alignment into plane->min_alignment()
48efe2554e4a drm/i915: Use more optimal VTd alignment for planes
391332970742 drm/i915: Calculate the VT-d guard size in the display code
042b3e66e9a8 drm/i915: Use per-plane VT-d guard numbers
fc4ad4f7f6d3 drm/i915/fbdev: Use fb->normal_view.gtt


