Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 925EDC36010
	for <intel-xe@archiver.kernel.org>; Tue,  1 Apr 2025 20:48:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5524E10E6A3;
	Tue,  1 Apr 2025 20:48:05 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A042210E690;
 Tue,  1 Apr 2025 20:48:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Large_devcoredump_file_su?=
 =?utf-8?q?pport?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 01 Apr 2025 20:48:04 -0000
Message-ID: <174354048465.24812.8244392696974465756@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250401204351.4130873-1-matthew.brost@intel.com>
In-Reply-To: <20250401204351.4130873-1-matthew.brost@intel.com>
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

Series: Large devcoredump file support
URL   : https://patchwork.freedesktop.org/series/147085/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b1b8be18d6473f947deba912f8b7f3f461a1de06
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Apr 1 13:43:51 2025 -0700

    drm/xe: Update xe_ttm_access_memory to use GPU for non-visible access
    
    Add migrate layer functions to access VRAM and update
    xe_ttm_access_memory to use for non-visible access and large (more than
    16k) BO access. 8G devcoreump on BMG observed 3 minute CPU copy time vs.
    3s GPU copy time.
    
    v4:
     - Fix non-page aligned accesses
     - Add support for small / unaligned access
     - Update commit message indicating migrate used for large accesses (Auld)
     - Fix warning in xe_res_cursor for non-zero offset
    v5:
     - Fix 32 bit build (CI)
    v6:
     - Rebase and use SVM migration copy functions
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 2dda6162c8d942406173d92a4cd3f23ea8a45696 drm-intel
054b7afbea46 drm/xe: Add devcoredump chunking
b1b8be18d647 drm/xe: Update xe_ttm_access_memory to use GPU for non-visible access


