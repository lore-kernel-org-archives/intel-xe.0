Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C38A8C77B7C
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 20:31:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 717FF10E12F;
	Tue, 24 Jun 2025 20:31:56 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD75810E12F;
 Tue, 24 Jun 2025 20:31:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Drop_bo-=3Esize?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 24 Jun 2025 20:31:54 -0000
Message-ID: <175079711476.106099.17388448465011915534@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250624194654.2787356-1-matthew.brost@intel.com>
In-Reply-To: <20250624194654.2787356-1-matthew.brost@intel.com>
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

Series: drm/xe: Drop bo->size
URL   : https://patchwork.freedesktop.org/series/150710/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7aff32de565791b0f137cd45ff7e1597a646f871
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Jun 24 12:46:54 2025 -0700

    drm/xe: Drop bo->size
    
    bo->size is redundant because the base GEM object already has a size
    field with the same value. Drop bo->size and use the base GEM object’s
    size instead. While at it, introduce xe_bo_size() to abstract the BO
    size.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch 0db5cf46e2c4fd232179cd9d5d127ab8c4aa0682 drm-intel
7aff32de5657 drm/xe: Drop bo->size
-:44: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#44: FILE: drivers/gpu/drm/xe/xe_bo.c:1203:
+		backup = ___xe_bo_create_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL, xe_bo_size(bo),

total: 0 errors, 1 warnings, 0 checks, 508 lines checked


