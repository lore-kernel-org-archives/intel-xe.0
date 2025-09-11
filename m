Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283D6CAC587
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 18:13:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF7F10EB7D;
	Thu, 11 Sep 2025 18:13:37 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F6B910EB7D;
 Thu, 11 Sep 2025 18:13:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/madvise=3A_Fix_ioc?=
 =?utf-8?q?tl_argument_check?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Sep 2025 18:13:36 -0000
Message-ID: <175761441618.326696.2239462385575637329@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250911173139.1405878-2-shuicheng.lin@intel.com>
In-Reply-To: <20250911173139.1405878-2-shuicheng.lin@intel.com>
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

Series: drm/xe/madvise: Fix ioctl argument check
URL   : https://patchwork.freedesktop.org/series/154412/
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
commit 1891726b99cd68c0edf1b7e15f1d6ae001f83ba6
Author: Shuicheng Lin <shuicheng.lin@intel.com>
Date:   Thu Sep 11 17:31:40 2025 +0000

    drm/xe/madvise: Fix ioctl argument check
    
    It is "preferred_mem_loc" instead of "atomic" for the ATTR_PREFERRED_LOC path.
    
    Also include 2 minor changes with no functional impact.
    1. Remove the redundant "attr.atomic_access" assignment.
    2. Replace down_read_interruptible() with xe_svm_notifier_lock_interruptible()
       to pair with xe_svm_notifier_unlock().
    
    Fixes: ada7486c5668 ("drm/xe: Implement madvise ioctl for xe")
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
+ /mt/dim checkpatch 89a1fbdb7a718191d0c935fcf0a495e4a6480183 drm-intel
1891726b99cd drm/xe/madvise: Fix ioctl argument check
-:6: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#6: 
It is "preferred_mem_loc" instead of "atomic" for the ATTR_PREFERRED_LOC path.

total: 0 errors, 1 warnings, 0 checks, 24 lines checked


