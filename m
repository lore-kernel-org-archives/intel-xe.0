Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98148CCD184
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 18:57:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5269810EAEF;
	Thu,  9 Oct 2025 18:57:57 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC0910EAEF;
 Thu,  9 Oct 2025 18:57:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Enable_media_sa?=
 =?utf-8?q?mpler_power_gating_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 09 Oct 2025 18:57:55 -0000
Message-ID: <176003627589.25094.11881316631738052175@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251009184235.1929975-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20251009184235.1929975-1-vinay.belgaumkar@intel.com>
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

Series: drm/xe: Enable media sampler power gating (rev3)
URL   : https://patchwork.freedesktop.org/series/155564/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 259f44e938236aabb12df7951ca47b1dfb954815
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date:   Thu Oct 9 11:42:35 2025 -0700

    drm/xe: Enable media sampler power gating
    
    Where applicable, enable media sampler power gating. Also, add
    it to the powergate_info debugfs.
    
    v2: Remove the sampler powergate status since it is cleared quickly anyway.
    v3: Use vcs mask (Rodrigo) and fix the version check for media
    
    Fixes: 38e8c4184ea0 ("drm/xe: Enable Coarse Power Gating")
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
+ /mt/dim checkpatch 23e7752f903fec07634c72b778a733cf4ed17656 drm-intel
259f44e93823 drm/xe: Enable media sampler power gating
-:46: CHECK:LINE_SPACING: Please don't use multiple blank lines
#46: FILE: drivers/gpu/drm/xe/xe_gt_idle.c:130:
 
+

total: 0 errors, 0 warnings, 1 checks, 36 lines checked


