Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74DDFEEF55
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 21:48:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A11D10E4D7;
	Tue,  7 Apr 2026 21:48:57 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC7EF10E4D7;
 Tue,  7 Apr 2026 21:48:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Fix_resource_le?=
 =?utf-8?q?aks_in_bo_init_and_dma-buf_paths?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 07 Apr 2026 21:48:55 -0000
Message-ID: <177559853595.438154.3282109077712621634@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260407201542.3396317-1-shuicheng.lin@intel.com>
In-Reply-To: <20260407201542.3396317-1-shuicheng.lin@intel.com>
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

Series: drm/xe: Fix resource leaks in bo init and dma-buf paths
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
commit 09c060bfdd054bfab4979b9aa38f0c59c44fa5a0
Author: Shuicheng Lin <shuicheng.lin@intel.com>
Date:   Tue Apr 7 20:15:42 2026 +0000

    drm/xe: Fix dma-buf attachment leak in xe_gem_prime_import()
    
    When xe_dma_buf_init_obj() fails, the attachment from
    dma_buf_dynamic_attach() is not detached. Add dma_buf_detach() before
    returning the error. Note: we cannot use goto out_err here because
    xe_dma_buf_init_obj() already frees bo on failure, and out_err would
    double-free it.
    
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Cc: stable@vger.kernel.org
    Assisted-by: Claude:claude-opus-4.6
    Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
+ /mt/dim checkpatch 2dc939ed1bd66b5eac479a95968188a87de9cf81 drm-intel
f5a90be00b05 drm/xe/bo: Fix bo leak on unaligned size validation in xe_bo_init_locked()
-:15: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#15: 
Assisted-by: Claude:claude-opus-4.6

-:15: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude:claude-opus-4.6'
#15: 
Assisted-by: Claude:claude-opus-4.6

total: 1 errors, 1 warnings, 0 checks, 11 lines checked
80673b3a23a4 drm/xe/bo: Fix bo leak on GGTT flag validation in xe_bo_init_locked()
-:15: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#15: 
Assisted-by: Claude:claude-opus-4.6

-:15: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude:claude-opus-4.6'
#15: 
Assisted-by: Claude:claude-opus-4.6

total: 1 errors, 1 warnings, 0 checks, 11 lines checked
c85fa54d778b drm/xe: Fix bo leak in xe_dma_buf_init_obj() on allocation failure
-:12: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#12: 
Assisted-by: Claude:claude-opus-4.6

-:12: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude:claude-opus-4.6'
#12: 
Assisted-by: Claude:claude-opus-4.6

total: 1 errors, 1 warnings, 0 checks, 11 lines checked
09c060bfdd05 drm/xe: Fix dma-buf attachment leak in xe_gem_prime_import()
-:14: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#14: 
Assisted-by: Claude:claude-opus-4.6

-:14: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude:claude-opus-4.6'
#14: 
Assisted-by: Claude:claude-opus-4.6

total: 1 errors, 1 warnings, 0 checks, 19 lines checked


