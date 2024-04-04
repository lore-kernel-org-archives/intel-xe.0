Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6094CD1284
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 09:12:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52E9E11A657;
	Thu,  4 Apr 2024 09:12:03 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B829511A66F;
 Thu,  4 Apr 2024 09:12:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Fix_bo_leak_in_?=
 =?utf-8?q?intel=5Ffb=5Fbo=5Fframebuffer=5Finit_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 04 Apr 2024 09:12:01 -0000
Message-ID: <171222192175.1208645.6662711635528025224@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240404090302.68422-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240404090302.68422-1-maarten.lankhorst@linux.intel.com>
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

Series: drm/xe: Fix bo leak in intel_fb_bo_framebuffer_init (rev3)
URL   : https://patchwork.freedesktop.org/series/131429/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
10b531c2aeb176a1a539b4a77216232f97719cec
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 79bb9df2638eda9f883c27214bda5fd6552b794f
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Thu Apr 4 11:03:02 2024 +0200

    drm/xe: Fix bo leak in intel_fb_bo_framebuffer_init
    
    Add a unreference bo in the error path, to prevent leaking a bo ref.
    
    Return 0 on success to clarify the success path.
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Fixes: 44e694958b95 ("drm/xe/display: Implement display support")
    Cc: <stable@vger.kernel.org> # v6.8+
+ /mt/dim checkpatch 714417be4833696db248e963e5010e6639610bda drm-intel
79bb9df2638e drm/xe: Fix bo leak in intel_fb_bo_framebuffer_init


