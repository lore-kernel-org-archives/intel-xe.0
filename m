Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B8AC19F32
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 12:03:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D19D710EA1C;
	Fri,  7 Mar 2025 12:03:13 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9447B10EA13;
 Fri,  7 Mar 2025 12:03:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Misc_reviewed_patches_for?=
 =?utf-8?q?_CI?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Mar 2025 12:03:12 -0000
Message-ID: <174134899260.930.8590632193402047852@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250307111402.26577-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250307111402.26577-1-tvrtko.ursulin@igalia.com>
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

Series: Misc reviewed patches for CI
URL   : https://patchwork.freedesktop.org/series/145988/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6e4d8ace55cd62d05072917ce736876f2770ae58
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Fri Mar 7 11:14:02 2025 +0000

    drm/xe: Use correct type width for alignment in fb pinning code
    
    Plane->min_alignment returns an unsigned int so lets use that in the whole
    relevant call chain.
    
    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch ba1a74f9385439974982072bb3f2c0dc4dbd0c3d drm-intel
5adaae998b86 drm/xe: Fix MOCS debugfs LNCF readout
e5198fc8d377 drm/xe: Fix ring flush invalidation
24bb2d8863c6 drm/xe: Pass flags directly to emit_flush_imm_ggtt
6e4d8ace55cd drm/xe: Use correct type width for alignment in fb pinning code


