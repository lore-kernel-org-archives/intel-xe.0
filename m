Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A17B7C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 08:48:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6980E10F3D5;
	Mon, 15 Apr 2024 08:48:21 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 487AE10F3D5;
 Mon, 15 Apr 2024 08:48:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/3=5D_drm/xe/vm=3A_prevent_UAF_with_asid_based_lookup?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Apr 2024 08:48:20 -0000
Message-ID: <171317090029.1404431.13469766196867936031@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240412113144.259426-4-matthew.auld@intel.com>
In-Reply-To: <20240412113144.259426-4-matthew.auld@intel.com>
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

Series: series starting with [1/3] drm/xe/vm: prevent UAF with asid based lookup
URL   : https://patchwork.freedesktop.org/series/132365/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c87357e7f6655908c0934a4f55fadf5b9aa9e88f
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ce991fb52ced13dd97765b9fa4df2acb508cccd2
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Fri Apr 12 12:31:47 2024 +0100

    drm/xe/vm: don't include xe_gt.h
    
    clangd complains here, since nothing in xe_gt.h seems to be needed.
    
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 8af056cad31bddacf155eeb7a199af5bd0f02abc drm-intel
89b74bf2f139 drm/xe/vm: prevent UAF with asid based lookup
0413b9c9ac68 drm/xe/vm: drop vm->destroy_work
ce991fb52ced drm/xe/vm: don't include xe_gt.h


