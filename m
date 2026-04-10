Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC82F36B9F
	for <intel-xe@archiver.kernel.org>; Fri, 10 Apr 2026 02:29:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D59110E02E;
	Fri, 10 Apr 2026 02:29:30 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B294A10E02E;
 Fri, 10 Apr 2026 02:29:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Fix_resource_le?=
 =?utf-8?q?aks_in_bo_init_and_dma-buf_paths_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 10 Apr 2026 02:29:29 -0000
Message-ID: <177578816971.449056.12707266172417181221@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260408175255.3402838-1-shuicheng.lin@intel.com>
In-Reply-To: <20260408175255.3402838-1-shuicheng.lin@intel.com>
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

Series: drm/xe: Fix resource leaks in bo init and dma-buf paths (rev3)
URL   : https://patchwork.freedesktop.org/series/164476/
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
commit ce37d476481a3da96b771c0ba1880cee430a8ffa
Author: Shuicheng Lin <shuicheng.lin@intel.com>
Date:   Wed Apr 8 17:52:55 2026 +0000

    drm/xe: Fix dma-buf attachment leak in xe_gem_prime_import()
    
    When xe_dma_buf_init_obj() fails, the attachment from
    dma_buf_dynamic_attach() is not detached. Add dma_buf_detach() before
    returning the error. Note: we cannot use goto out_err here because
    xe_dma_buf_init_obj() already frees bo on failure, and out_err would
    double-free it.
    
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Cc: stable@vger.kernel.org
    Assisted-by: Claude:claude-opus-4.6
    Reviewed-by: Mattheq Brost <matthew.brost@intel.com>
    Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
+ /mt/dim checkpatch 97d8833ffba6bd3d6aaa51169069620ac17a2e37 drm-intel
80d1e05cfe5c drm/xe/bo: Fix bo leak on unaligned size validation in xe_bo_init_locked()
-:15: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#15: 
Assisted-by: Claude:claude-opus-4.6

-:15: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude:claude-opus-4.6'
#15: 
Assisted-by: Claude:claude-opus-4.6

total: 1 errors, 1 warnings, 0 checks, 11 lines checked
0dcfbfe35eb9 drm/xe/bo: Fix bo leak on GGTT flag validation in xe_bo_init_locked()
-:15: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#15: 
Assisted-by: Claude:claude-opus-4.6

-:15: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude:claude-opus-4.6'
#15: 
Assisted-by: Claude:claude-opus-4.6

total: 1 errors, 1 warnings, 0 checks, 11 lines checked
507d72484f17 drm/xe: Fix bo leak in xe_dma_buf_init_obj() on allocation failure
-:25: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#25: 
Assisted-by: Claude:claude-opus-4.6

-:25: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude:claude-opus-4.6'
#25: 
Assisted-by: Claude:claude-opus-4.6

total: 1 errors, 1 warnings, 0 checks, 31 lines checked
ce37d476481a drm/xe: Fix dma-buf attachment leak in xe_gem_prime_import()
-:14: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#14: 
Assisted-by: Claude:claude-opus-4.6

-:14: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude:claude-opus-4.6'
#14: 
Assisted-by: Claude:claude-opus-4.6

total: 1 errors, 1 warnings, 0 checks, 19 lines checked


