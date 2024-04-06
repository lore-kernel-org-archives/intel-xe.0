Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249DBC3A59D
	for <intel-xe@archiver.kernel.org>; Sat,  6 Apr 2024 00:11:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE52B10EBD8;
	Sat,  6 Apr 2024 00:11:57 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED21B10EBDB;
 Sat,  6 Apr 2024 00:11:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Initialize_GuC_?=
 =?utf-8?q?ID_mgr_before_registering_guc=5Fsubmit=5Ffini?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 06 Apr 2024 00:11:55 -0000
Message-ID: <171236231597.1239316.5384747914932041767@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240405212747.226263-1-matthew.brost@intel.com>
In-Reply-To: <20240405212747.226263-1-matthew.brost@intel.com>
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

Series: drm/xe: Initialize GuC ID mgr before registering guc_submit_fini
URL   : https://patchwork.freedesktop.org/series/132107/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
10b531c2aeb176a1a539b4a77216232f97719cec
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4619e421a2ae18d8346b62cb81a003481b17a217
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Apr 5 14:27:47 2024 -0700

    drm/xe: Initialize GuC ID mgr before registering guc_submit_fini
    
    It reasonable to assume that guc_submit_fini may rely on GuC ID mgr
    being available. With that, register guc_submit_fini after initializing
    the GuC ID mgr. This will ensure the GuC ID mgr is available in
    guc_submit_fini due the reverse execution order of
    drmm_add_action_or_reset.
    
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 11155f150a41d028c6ac7a141924fd4c8798721d drm-intel
4619e421a2ae drm/xe: Initialize GuC ID mgr before registering guc_submit_fini


