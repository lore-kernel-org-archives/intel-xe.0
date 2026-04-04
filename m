Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 396A0E88D86
	for <intel-xe@archiver.kernel.org>; Sat,  4 Apr 2026 06:23:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDAB210E39F;
	Sat,  4 Apr 2026 06:23:19 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB0210E39F;
 Sat,  4 Apr 2026 06:23:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Wait_for_HW_cle?=
 =?utf-8?q?arance_before_issuing_the_next_TLB_inval=2E_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: fei.yang@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 04 Apr 2026 06:23:18 -0000
Message-ID: <177528379874.431846.15752106642292939474@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260404062250.3435419-1-fei.yang@intel.com>
In-Reply-To: <20260404062250.3435419-1-fei.yang@intel.com>
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

Series: drm/xe: Wait for HW clearance before issuing the next TLB inval. (rev2)
URL   : https://patchwork.freedesktop.org/series/163417/
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
commit a89a73cb1903a374d17a3cddbe2b99468f45245e
Author: Fei Yang <fei.yang@intel.com>
Date:   Fri Apr 3 23:22:49 2026 -0700

    drm/xe: Wait for HW clearance before issuing the next TLB inval.
    
    Hardware requires the software to poll the valid bit and make sure it's
    cleared before issuing a new TLB invalidation request.
    We also need to avoid racing against GuC on TLB invalidations by only
    allowing KMD to issue TLB invalidation request during GuC reset.
    
    v2: separate ggtt inval to xe_gam_port and call in guc_reset only (Matt)
    
    Signed-off-by: Fei Yang <fei.yang@intel.com>
    Suggested-by: Matthew Brost <matthew.brost@intel.com>
    Cc: Stuart Summers <stuart.summers@intel.com>
+ /mt/dim checkpatch f0ef889ccb91830e573f8e61c637c5337a4ff6d8 drm-intel
a89a73cb1903 drm/xe: Wait for HW clearance before issuing the next TLB inval.
-:31: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#31: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 160 lines checked


