Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D3CD73E83
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 20:23:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25CE910E07A;
	Thu, 29 Jan 2026 20:23:35 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6547010E07A;
 Thu, 29 Jan 2026 20:23:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Make_MMIO_c?=
 =?utf-8?q?ommunication_more_robust_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 29 Jan 2026 20:23:34 -0000
Message-ID: <176971821441.206949.2683490670949389738@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260127193727.601-1-michal.wajdeczko@intel.com>
In-Reply-To: <20260127193727.601-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/guc: Make MMIO communication more robust (rev3)
URL   : https://patchwork.freedesktop.org/series/160377/
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
commit 1d9a51d5890e8d2f5916dda63f8e17a6b6a96da2
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue Jan 27 20:37:26 2026 +0100

    drm/xe/guc: Allow second H2G retry on FLR
    
    During VF FLR the scratch registers could be cleared both by the
    GuC and by the PF driver. Allow to retry more times once we find
    out that the HXG header was cleared and wait at least 256ms before
    resending the same message again to the GuC.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch bd9c2b8a3a5b7bd8c38108929bfabd7a40dc922b drm-intel
a00b2ee0578f drm/xe: Promote relaxed_ms_sleep
-:69: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#69: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 84 lines checked
b5e176b83ffd drm/xe: Move exponential sleep logic to helper
8f42eaf60169 drm/xe/guc: Limit sleep while waiting for H2G credits
f5106b0bff7e drm/xe/guc: Drop redundant register read
37df28c03590 drm/xe/guc: Wait before retrying sending H2G
1d9a51d5890e drm/xe/guc: Allow second H2G retry on FLR


