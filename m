Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43266CCD1BF
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 14:18:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F413D10E415;
	Tue, 28 Oct 2025 14:18:01 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89EF810E415;
 Tue, 28 Oct 2025 14:18:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/uapi=3A_Implement_?=
 =?utf-8?q?DRM=5FXE=5FGEM=5FCREATE=5FFLAG=5FNO=5FCOMPRESSION_flag?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sanjay Yadav" <sanjay.kumar.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 28 Oct 2025 14:18:00 -0000
Message-ID: <176166108056.63274.4812993367467886189@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251028131031.2052163-2-sanjay.kumar.yadav@intel.com>
In-Reply-To: <20251028131031.2052163-2-sanjay.kumar.yadav@intel.com>
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

Series: drm/xe/uapi: Implement DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION flag
URL   : https://patchwork.freedesktop.org/series/156658/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f867e605613af1770f90c4b0afd4a8f06424d1f0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b0f00581c46aca67f2e95a0988b7e66556b9aea5
Author: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Date:   Tue Oct 28 18:40:32 2025 +0530

    drm/xe/uapi: Implement DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION flag
    
    Let userspace opt out of CCS compression on a per-BO basis. When set,
    the driver maps this to XE_BO_FLAG_NO_COMPRESSION, skips CCS metadata
    allocation/clearing, and rejects compressed PAT indices at vm_bind.
    This avoids extra memory ops and manual CCS state handling for buffer.
    
    Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
    Suggested-by: Matthew Auld <matthew.auld@intel.com>
+ /mt/dim checkpatch 5742fc7aea99a1326637a7106eeaeac383a1c76d drm-intel
b0f00581c46a drm/xe/uapi: Implement DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION flag
-:139: CHECK:LINE_SPACING: Please don't use multiple blank lines
#139: FILE: drivers/gpu/drm/xe/xe_vm.c:3475:
+
+

total: 0 errors, 0 warnings, 1 checks, 124 lines checked


