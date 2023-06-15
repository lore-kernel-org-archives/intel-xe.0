Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 756ACEB64DB
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jun 2023 10:44:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FCA510E4C5;
	Thu, 15 Jun 2023 10:44:29 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id A98BC10E4C5;
 Thu, 15 Jun 2023 10:44:27 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A64E2A73C7;
 Thu, 15 Jun 2023 10:44:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Date: Thu, 15 Jun 2023 10:44:27 -0000
Message-ID: <168682586767.10727.6999645777825170774@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230615092643.3399572-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230615092643.3399572-1-himal.prasad.ghimiray@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_se?=
 =?utf-8?q?ries_starting_with_=5Bv4=2C1/1=5D_drm/xe=3A_Add_a_debugfs_for_f?=
 =?utf-8?q?aking_gt_reset_failure=2E?=
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

Series: series starting with [v4,1/1] drm/xe: Add a debugfs for faking gt reset failure.
URL   : https://patchwork.freedesktop.org/series/119376/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9d96923a5a95b234d6a3678db17b2607c1aac296
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Thu Jun 15 14:56:43 2023 +0530

    drm/xe: Add a debugfs for faking gt reset failure.
    
    In case of gt reset failure, KMD notifies userspace about failure
    via uevent. To validate this notification we need to ensure gt
    reset fails and there is no mechanism to cause failure from hardware.
    Hence added a debugfs which will cause fake reset failure.
    
    v1(Rodrigo)
    - Change the variable to fake_reset_failure_in_progress.
    - Drop usage of READ_ONCE and WRITE_ONCE.
    - Follow consistency for variable assignment. Either use
      functions for all the assignments or don't use for any.
    
    v2
    - Add description for variable.
    - Define xe_fake_reset(gt) function in xe_gt.c to set the
      fake_reset_failure_in_progress.
    - No need to explicitly initialize the fake_reset_failure_in_progress
      as false. (Rodrigo)
    - Return proper error code in case of fake reset. (Bala)
    
    v3
    - Move gt reset worker call to xe_fake_reset(gt) which ensures
    fake reset goes through even in GT suspend state. (Aravind)
    
    v4
    -Clear whitespaces.
    
    Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    cc: Francois Dugast <francois.dugast@intel.com>
    Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
    Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch 6d2981d42cd891965094ec7d173203520cfa36f7 drm-intel
9d96923a5 drm/xe: Add a debugfs for faking gt reset failure.


