Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018B2C48292
	for <intel-xe@archiver.kernel.org>; Mon,  5 Feb 2024 16:02:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 863C710FA7A;
	Mon,  5 Feb 2024 16:02:49 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B36B10FA75;
 Mon,  5 Feb 2024 16:02:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/display=3A_fix_i91?=
 =?utf-8?q?5=5Fgem=5Fobject=5Fis=5Fshmem=28=29_wrapper?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 05 Feb 2024 16:02:48 -0000
Message-ID: <170714896811.1024443.2474991917340500683@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240205153110.38340-2-matthew.auld@intel.com>
In-Reply-To: <20240205153110.38340-2-matthew.auld@intel.com>
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

Series: drm/xe/display: fix i915_gem_object_is_shmem() wrapper
URL   : https://patchwork.freedesktop.org/series/129547/
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
commit 35ea490a32c3cec1baf525255734adc1ac873347
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Mon Feb 5 15:31:11 2024 +0000

    drm/xe/display: fix i915_gem_object_is_shmem() wrapper
    
    shmem ensures the memory is cleared on allocation, however here we are
    using TTM, which doesn't natively support shmem (other than for swap),
    but instead just allocates normal system memory. And we only zero such
    memory for userspace allocations. In the case of intel_fbdev we are
    missing the memset_io().
    
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
+ /mt/dim checkpatch 65b31bb0da2e57ac39ddf5f7bf77ca191e6b6fad drm-intel
35ea490a3 drm/xe/display: fix i915_gem_object_is_shmem() wrapper


