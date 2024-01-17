Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0392DC47DA2
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 23:13:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C103910E8F7;
	Wed, 17 Jan 2024 23:12:59 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D52C510E8F7;
 Wed, 17 Jan 2024 23:12:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fixes_for_sparse_warning?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Wed, 17 Jan 2024 23:12:57 -0000
Message-ID: <170553317787.537693.18092278427488240657@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240117134048.165425-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240117134048.165425-1-thomas.hellstrom@linux.intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Fixes for sparse warning
URL   : https://patchwork.freedesktop.org/series/128881/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e7f730565356938dd6c63cd498218fdc5d6a22b0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ba03c7da503bafec16dc28d4f2eff36da42f7931
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Jan 17 14:40:48 2024 +0100

    drm/xe: Use a NULL pointer instead of 0.
    
    The last argument of xe_pcode_read() is a pointer. Use NULL instead of 0.
    
    Fixes: 92d44a422d0d ("drm/xe/hwmon: Expose card reactive critical power")
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch 6002d529f9fe420895d407e481d39b19b58ec001 drm-intel
41f74dad2 drm/xe/dmabuf: Make xe_dmabuf_ops static
-:11: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'dd08ebf6c352', maybe rebased or not pulled?
#11: 
Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
400181343 drm/xe/ggtt: Use ioread64 to dereference ggtt::gsm
-:12: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'dd08ebf6c352', maybe rebased or not pulled?
#12: 
Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")

total: 0 errors, 1 warnings, 0 checks, 13 lines checked
a4dba841c drm/xe: Annotate mcr_[un]lock()
-:13: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'dd08ebf6c352', maybe rebased or not pulled?
#13: 
Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")

-:14: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'fb1d55efdfcb', maybe rebased or not pulled?
#14: 
Fixes: fb1d55efdfcb ("drm/xe: Cleanup OPEN_BRACE style issues")

total: 0 errors, 2 warnings, 0 checks, 16 lines checked
f7805ef0d drm/xe: Don't use __user error pointers
-:15: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'dd08ebf6c352', maybe rebased or not pulled?
#15: 
Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")

total: 0 errors, 1 warnings, 0 checks, 74 lines checked
ba03c7da5 drm/xe: Use a NULL pointer instead of 0.
-:11: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '92d44a422d0d', maybe rebased or not pulled?
#11: 
Fixes: 92d44a422d0d ("drm/xe/hwmon: Expose card reactive critical power")

total: 0 errors, 1 warnings, 0 checks, 8 lines checked


