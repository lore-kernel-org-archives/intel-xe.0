Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F50EED619
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 16:43:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ECB410E650;
	Fri, 15 Sep 2023 16:43:43 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 638FD10E650;
 Fri, 15 Sep 2023 16:43:41 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 636D5A3ECB;
 Fri, 15 Sep 2023 16:43:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Fri, 15 Sep 2023 16:43:41 -0000
Message-ID: <169479622140.32042.1764822506991839349@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230915164057.6618-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230915164057.6618-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_Reinstate_pipelined_fence_enable=5Fsignaling_=28rev2=29?=
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

Series: drm/xe: Reinstate pipelined fence enable_signaling (rev2)
URL   : https://patchwork.freedesktop.org/series/123669/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6d9fb39313f4efd0b024684134c92f1a8b1e26a1
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Fri Sep 15 18:40:57 2023 +0200

    drm/xe: Reinstate pipelined fence enable_signaling
    
    With the GPUVA conversion, the xe_bo::vmas member became replaced with
    drm_gem_object::gpuva.list, however there was a couple of usage instances
    left using the old member. Most notably the pipelined fence
    enable_signaling.
    
    Remove the xe_bo::vmas member completely, fix usage instances and
    also enable this pipelined fence enable_signaling even for faulting
    VM:s since we actually wait for bind fences to complete.
    
    v2:
    - Rebase.
    
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 4a9681392cecd56a372d06b648f7b3a37fdd5c63 drm-intel
6d9fb3931 drm/xe: Reinstate pipelined fence enable_signaling


