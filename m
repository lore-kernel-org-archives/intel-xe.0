Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD7BCF31BA
	for <intel-xe@archiver.kernel.org>; Thu,  3 Oct 2024 04:52:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B79010E141;
	Thu,  3 Oct 2024 04:52:14 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE4310E141;
 Thu,  3 Oct 2024 04:52:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/ttm=3A_Add_an_option_?=
 =?utf-8?q?to_report_graphics_memory_OOM_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 03 Oct 2024 04:52:12 -0000
Message-ID: <172793113244.1166431.3813437425379338219@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241002122422.287276-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20241002122422.287276-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/ttm: Add an option to report graphics memory OOM (rev2)
URL   : https://patchwork.freedesktop.org/series/138245/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1b291f3cb3c70754db2b26dccba27dfbce67402a
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Oct 2 14:24:22 2024 +0200

    drm/ttm: Add a device flag to propagate -ENOSPC on OOM
    
    Some graphics APIs differentiate between out-of-graphics-memory and
    out-of-host-memory (system memory). Add a device init flag to
    have -ENOSPC propagated from the resource managers instead of being
    converted to -ENOMEM, to aid driver stacks in determining what
    error code to return or whether corrective action can be taken at
    the driver level.
    
    Cc: Christian König <christian.koenig@amd.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 2dc0a8bed10607e6b3cc123cba2b5ad96fcb0b87 drm-intel
c0c451f4f07b drm/ttm: Change ttm_device_init to use a struct instead of multiple bools
1b291f3cb3c7 drm/ttm: Add a device flag to propagate -ENOSPC on OOM


