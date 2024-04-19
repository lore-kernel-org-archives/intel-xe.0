Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C714EC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 15:57:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 798B610F54B;
	Fri, 19 Apr 2024 15:57:10 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D74C10F382;
 Fri, 19 Apr 2024 15:57:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/pf=3A_Fix_xe=5Fgt?=
 =?utf-8?q?=5Fsriov=5Fpf=5Fconfig=5Fprint=5Favailable=5Fggtt=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 19 Apr 2024 15:57:09 -0000
Message-ID: <171354222950.1521185.4505982167860274491@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240419141000.314-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240419141000.314-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/pf: Fix xe_gt_sriov_pf_config_print_available_ggtt()
URL   : https://patchwork.freedesktop.org/series/132647/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a02eeaed2031dc9e1217f4f82ad8819771b91d6c
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Fri Apr 19 16:10:00 2024 +0200

    drm/xe/pf: Fix xe_gt_sriov_pf_config_print_available_ggtt()
    
    This function is using internal helper pf_get_spare_ggtt() that
    expects PF's master mutex to be locked. Fix that.
    
    Fixes: ac6598aed1b3 ("drm/xe/pf: Add support to configure SR-IOV VFs")
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
+ /mt/dim checkpatch 1501acd2d215fa1cc15a93c5bedc40d4776ed696 drm-intel
a02eeaed2031 drm/xe/pf: Fix xe_gt_sriov_pf_config_print_available_ggtt()


