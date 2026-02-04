Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9CFEA7946
	for <intel-xe@archiver.kernel.org>; Wed,  4 Feb 2026 21:52:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A4510E11F;
	Wed,  4 Feb 2026 21:52:04 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B5710E11F;
 Wed,  4 Feb 2026 21:52:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/configfs=3A_Fix_?=
 =?utf-8?q?=27parameter_name_omitted=27_errors_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 04 Feb 2026 21:52:02 -0000
Message-ID: <177024192226.225549.8001697563448099068@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260203193745.576-1-michal.wajdeczko@intel.com>
In-Reply-To: <20260203193745.576-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/configfs: Fix 'parameter name omitted' errors (rev2)
URL   : https://patchwork.freedesktop.org/series/161107/
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
commit e5a200ad58cfb356d8d4347b45927442cdb15658
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue Feb 3 20:37:45 2026 +0100

    drm/xe/configfs: Fix 'parameter name omitted' errors
    
    On some configs and old compilers we can get following build errors:
    
      ../drivers/gpu/drm/xe/xe_configfs.h: In function 'xe_configfs_get_ctx_restore_mid_bb':
      ../drivers/gpu/drm/xe/xe_configfs.h:40:76: error: parameter name omitted
       static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
                                                                                ^~~~~~~~~~~~~~~~~~~~
      ../drivers/gpu/drm/xe/xe_configfs.h: In function 'xe_configfs_get_ctx_restore_post_bb':
      ../drivers/gpu/drm/xe/xe_configfs.h:42:77: error: parameter name omitted
       static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
                                                                                 ^~~~~~~~~~~~~~~~~~~~
    when trying to define our configfs stub functions. Fix that.
    
    Fixes: 7a4756b2fd04 ("drm/xe/lrc: Allow to add user commands mid context switch")
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
+ /mt/dim checkpatch 55e3e3aeecf80d9fd2536acd8ed785282be5a7b3 drm-intel
e5a200ad58cf drm/xe/configfs: Fix 'parameter name omitted' errors
-:10: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#10: 
   static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,

total: 0 errors, 1 warnings, 0 checks, 26 lines checked


