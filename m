Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFFF2CD0438
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jan 2026 04:46:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73A5310E22D;
	Tue,  6 Jan 2026 04:46:18 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A04DA10E22D;
 Tue,  6 Jan 2026 04:46:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_User_readable_error_codes?=
 =?utf-8?q?_on_atomic=5Fioctl_failure_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 Jan 2026 04:46:17 -0000
Message-ID: <176767477765.128107.10681777105841510220@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260106-atomic-v7-0-d51d9a351684@intel.com>
In-Reply-To: <20260106-atomic-v7-0-d51d9a351684@intel.com>
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

Series: User readable error codes on atomic_ioctl failure (rev6)
URL   : https://patchwork.freedesktop.org/series/152277/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9f1cb6875f3f9eb0925ed50c16100322a2df513c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0dd76c872e5d885ee5c9d78f83bfbd1f0e2abc9b
Author: Arun R Murthy <arun.r.murthy@intel.com>
Date:   Tue Jan 6 10:08:00 2026 +0530

    drm/i915/display: Error codes for async flip failures
    
    For failures in async flip atomic check/commit path return user readable
    error codes in struct drm_atomic_state.
    
    Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
+ /mt/dim checkpatch b3845fe8af5ec5c1d4b26e40ac6b4c7370e5fa35 drm-intel
bbf45f3f424e drm: Define user readable error codes for atomic ioctl
5ee9e7acc5de drm/atomic: Add error_code element in atomic_state
843310ce8b87 drm/atomic: Allocate atomic_state at the beginning of atomic_ioctl
23c47d64713b drm/atomic: Return user readable error in atomic_ioctl
-:47: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#47: FILE: drivers/gpu/drm/drm_atomic_uapi.c:1254:
+								      DRM_MODE_ATOMIC_ASYNC_NOT_SUPP_PLANE,

total: 0 errors, 1 warnings, 0 checks, 131 lines checked
0dd76c872e5d drm/i915/display: Error codes for async flip failures


