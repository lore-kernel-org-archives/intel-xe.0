Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F932C3ABDA
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 23:46:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 219C610E034;
	Wed, 14 May 2025 23:46:46 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66D7510E034;
 Wed, 14 May 2025 23:46:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe/vm=3A_move_rebind=5Fwork_init_earlier?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 14 May 2025 23:46:45 -0000
Message-ID: <174726640541.80824.8359371642145266443@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250514152424.149591-3-matthew.auld@intel.com>
In-Reply-To: <20250514152424.149591-3-matthew.auld@intel.com>
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

Series: series starting with [1/2] drm/xe/vm: move rebind_work init earlier
URL   : https://patchwork.freedesktop.org/series/149016/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f0c100f56db9e65c21c37b4e324b7b3fae633dca
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Wed May 14 16:24:26 2025 +0100

    drm/xe/vm: move xe_svm_init() earlier
    
    In xe_vm_close_and_put() we need to be able to call xe_svm_fini(),
    however during vm creation we can call this on the error path, before
    having actually initialised the svm state, leading to various splats
    followed by a fatal NPD.
    
    Fixes: 6fd979c2f331 ("drm/xe: Add SVM init / close / fini to faulting VMs")
    Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4967
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 3d6670fab64cb00b5e6ed80d2517147db533faf1 drm-intel
836070042dca drm/xe/vm: move rebind_work init earlier
f0c100f56db9 drm/xe/vm: move xe_svm_init() earlier


