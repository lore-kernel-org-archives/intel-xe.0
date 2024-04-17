Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C3CC4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 20:48:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79BD210E309;
	Wed, 17 Apr 2024 20:48:08 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 836EA10E309;
 Wed, 17 Apr 2024 20:48:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_outer_runti?=
 =?utf-8?q?me=5Fpm_protection_to_xe=5Flive=5Fktest=40xe=5Fdma=5Fbuf?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Apr 2024 20:48:07 -0000
Message-ID: <171338688753.1483580.8783963506094608332@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <171271725279.1318876.10825510039289922734@8e613ede5ea5>
In-Reply-To: <171271725279.1318876.10825510039289922734@8e613ede5ea5>
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

Series: drm/xe: Add outer runtime_pm protection to xe_live_ktest@xe_dma_buf
URL   : https://patchwork.freedesktop.org/series/132574/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f5fb02e01091a469b6325b72a47b3a0a1e96309c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 54f9c7b96b68556bf952ea2a43c82b6cae7ee849
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Wed Apr 17 15:34:11 2024 -0400

    drm/xe: Add outer runtime_pm protection to xe_live_ktest@xe_dma_buf
    
    Any kunit doing any memory access should get their own runtime_pm
    outer references since they don't use the standard driver API
    entries. In special this dma_buf from the same driver.
    
    Found by pre-merge CI on adding WARN calls for unprotected
    inner callers:
    
    <6> [318.639739]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
    <4> [318.639957] ------------[ cut here ]------------
    <4> [318.639967] xe 0000:4d:00.0: Missing outer runtime PM protection
    <4> [318.640049] WARNING: CPU: 117 PID: 3832 at drivers/gpu/drm/xe/xe_pm.c:533 xe_pm_runtime_get_noresume+0x48/0x60 [xe]
    
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Francois Dugast <francois.dugast@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 64a20aacb61e4ce6d8a0b3dc6e4bff72e316ffa3 drm-intel
54f9c7b96b68 drm/xe: Add outer runtime_pm protection to xe_live_ktest@xe_dma_buf
-:14: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#14: 
<6> [318.639739]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver

total: 0 errors, 1 warnings, 0 checks, 21 lines checked


