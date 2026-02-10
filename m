Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 244ACEA3F2F
	for <intel-xe@archiver.kernel.org>; Tue, 10 Feb 2026 09:11:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0E5D10E515;
	Tue, 10 Feb 2026 09:11:43 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77DDF10E514;
 Tue, 10 Feb 2026 09:11:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_User_readable_error_codes?=
 =?utf-8?q?_on_atomic=5Fioctl_failure_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Feb 2026 09:11:42 -0000
Message-ID: <177071470246.241444.2536728390626993289@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260210-atomic-v9-0-525c88fd2402@intel.com>
In-Reply-To: <20260210-atomic-v9-0-525c88fd2402@intel.com>
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

Series: User readable error codes on atomic_ioctl failure (rev8)
URL   : https://patchwork.freedesktop.org/series/152277/
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
commit d1b8359ba05bcc93ebd66190ec15ca869e184395
Author: Arun R Murthy <arun.r.murthy@intel.com>
Date:   Tue Feb 10 14:34:01 2026 +0530

    drm: Introduce DRM_CAP_ATOMIC_ERROR_REPORTING
    
    The new capability informs users that atomic_ioctl() supports
    failure reporting when an error occurs.
    
    Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
    Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 8f0fa64d0cca695724e2d2fbe4c61336de727b79 drm-intel
be4d61669e77 drm: Define user readable error codes for atomic ioctl
3eb443a6a3ee drm/atomic: Add error_code element in atomic_state
055f2f7c751a drm/atomic: Allocate atomic_state at the beginning of atomic_ioctl
e56f311ac5d7 drm/atomic: Call complete_signaling only if prepare_signaling is done
e0081ceadcc7 drm/atomic: Return user readable error in atomic_ioctl
-:52: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#52: FILE: drivers/gpu/drm/drm_atomic_uapi.c:1270:
+								      DRM_MODE_ATOMIC_INVALID_API_USAGE,

total: 0 errors, 1 warnings, 0 checks, 123 lines checked
e6b73cdc6a87 drm/i915/display: Error codes for async flip failures
d1b8359ba05b drm: Introduce DRM_CAP_ATOMIC_ERROR_REPORTING


