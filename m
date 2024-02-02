Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5128C48291
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 17:51:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C50710EEC3;
	Fri,  2 Feb 2024 17:51:32 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06AAD10EEC3;
 Fri,  2 Feb 2024 17:51:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/vm=3A_don=27t_igno?=
 =?utf-8?q?re_error_when_in=5Fkthread?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 02 Feb 2024 17:51:31 -0000
Message-ID: <170689629103.953177.1230239115114004845@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240202171435.427630-2-matthew.auld@intel.com>
In-Reply-To: <20240202171435.427630-2-matthew.auld@intel.com>
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

Series: drm/xe/vm: don't ignore error when in_kthread
URL   : https://patchwork.freedesktop.org/series/129480/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 01c09bfdeddf4708aead513304e0c43da3340237
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Fri Feb 2 17:14:36 2024 +0000

    drm/xe/vm: don't ignore error when in_kthread
    
    If GUP fails and we are in_kthread, we can have pinned = 0 and ret = 0.
    If that happens we call sg_alloc_append_table_from_pages() with n_pages
    = 0, which is not well behaved and can trigger:
    
    kernel BUG at include/linux/scatterlist.h:115!
    
    depending on if the pages array happens to be zeroed or not. Even if we
    don't hit that it crashes later when trying to dma_map the returned
    table.
    
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 1dd92467500a5ead3e44bbdfe15e064dd79b65ef drm-intel
01c09bfde drm/xe/vm: don't ignore error when in_kthread


