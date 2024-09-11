Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09113EE49BC
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 15:31:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B5A10EA34;
	Wed, 11 Sep 2024 15:31:14 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 895D310EA34;
 Wed, 11 Sep 2024 15:31:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Use_bookkeep_sl?=
 =?utf-8?q?ots_for_external_BO=27s_in_exec_IOCTL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 11 Sep 2024 15:31:12 -0000
Message-ID: <172606867255.985511.8760019246674687767@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240911152622.903058-1-matthew.brost@intel.com>
In-Reply-To: <20240911152622.903058-1-matthew.brost@intel.com>
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

Series: drm/xe: Use bookkeep slots for external BO's in exec IOCTL
URL   : https://patchwork.freedesktop.org/series/138531/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e87b2c6720b4a841d295b4cc59cfd90d844f3d34
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Sep 11 08:26:22 2024 -0700

    drm/xe: Use bookkeep slots for external BO's in exec IOCTL
    
    Fix external BO's dma-resv usage in exec IOCTL using bookkeep slots
    rather than write slots. This leaves syncing to user space rather than
    the KMD blindly enforcing write semantics on every external BO.
    
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Cc: José Roberto de Souza <jose.souza@intel.com>
    Cc: Kenneth Graunke <kenneth.w.graunke@intel.com>
    Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
    Reported-by: Simona Vetter <simona.vetter@ffwll.ch>
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2673
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 547f64951c0ed692e790d4f5c7333ad949f1aa6d drm-intel
e87b2c6720b4 drm/xe: Use bookkeep slots for external BO's in exec IOCTL


