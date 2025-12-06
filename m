Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B884D3ABCC
	for <intel-xe@archiver.kernel.org>; Sat,  6 Dec 2025 00:33:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C35B10E28E;
	Sat,  6 Dec 2025 00:33:02 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F9E10E28E;
 Sat,  6 Dec 2025 00:33:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Limit_num=5Fsyncs_to_prev?=
 =?utf-8?q?ent_oversized_allocations_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 06 Dec 2025 00:33:00 -0000
Message-ID: <176498118098.62152.13360169656888693729@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251205234715.2476561-4-shuicheng.lin@intel.com>
In-Reply-To: <20251205234715.2476561-4-shuicheng.lin@intel.com>
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

Series: Limit num_syncs to prevent oversized allocations (rev3)
URL   : https://patchwork.freedesktop.org/series/158594/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 07501f9b9234db0dce0d0b8d62f875922caba5fc
Author: Shuicheng Lin <shuicheng.lin@intel.com>
Date:   Fri Dec 5 23:47:18 2025 +0000

    drm/xe/oa: Limit num_syncs to prevent oversized allocations
    
    The OA open parameters did not validate num_syncs, allowing
    userspace to pass arbitrarily large values, potentially
    leading to excessive allocations.
    
    Add check to ensure that num_syncs does not exceed DRM_XE_MAX_SYNCS,
    returning -EINVAL when the limit is violated.
    
    v2: use XE_IOCTL_DBG() and drop duplicated check. (Ashutosh)
    
    Fixes: c8507a25cebd ("drm/xe/oa/uapi: Define and parse OA sync properties")
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
    Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
    Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch db6505187efb9c255df1dd6e78c00d95fadfef79 drm-intel
fb8037fa3bee drm/xe: Limit num_syncs to prevent oversized allocations
-:50: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#50: 
Reported-by: Koen Koning <koen.koning@intel.com>
Reported-by: Peter Senna Tschudin <peter.senna@linux.intel.com>

total: 0 errors, 1 warnings, 0 checks, 25 lines checked
07501f9b9234 drm/xe/oa: Limit num_syncs to prevent oversized allocations


