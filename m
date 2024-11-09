Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434C3D5E37A
	for <intel-xe@archiver.kernel.org>; Sat,  9 Nov 2024 17:35:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1071110E2C2;
	Sat,  9 Nov 2024 17:35:35 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B90C10E2C2;
 Sat,  9 Nov 2024 17:35:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Common_preempt_fences_and?=
 =?utf-8?q?_semantics?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 09 Nov 2024 17:35:34 -0000
Message-ID: <173117373437.1811529.15734026670222024297@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241109172942.482630-1-matthew.brost@intel.com>
In-Reply-To: <20241109172942.482630-1-matthew.brost@intel.com>
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

Series: Common preempt fences and semantics
URL   : https://patchwork.freedesktop.org/series/141128/
State : warning

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
commit e8af0ebee771f2b8741b28e34160572b14b51b4e
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Sat Nov 9 09:29:42 2024 -0800

    drm/xe: Use dma_fence_preempt base class
    
    Use the dma_fence_preempt base class in Xe instead of open-coding the
    preemption implementation.
    
    Cc: Dave Airlie <airlied@redhat.com>
    Cc: Simona Vetter <simona.vetter@ffwll.ch>
    Cc: Christian Koenig <christian.koenig@amd.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 8d50af9e25b53de6798791c338e8fa6619c5729c drm-intel
68ffb8c8162a dma-resv: Add DMA_RESV_USAGE_PREEMPT
-:112: WARNING:STATIC_CONST_CHAR_ARRAY: static const char * array should probably be static const char * const
#112: FILE: drivers/dma-buf/dma-resv.c:774:
+	static const char *usage[] = { "kernel", "write", "read", "bookkeep",

total: 0 errors, 1 warnings, 0 checks, 145 lines checked
4ee8642bbc8b drm/sched: Teach scheduler about DMA_RESV_USAGE_PREEMPT
7b34b4a73f58 dma-fence: Add dma_fence_preempt base class
-:27: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#27: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 163 lines checked
aaacb186f893 drm/sched: Teach scheduler about dma_fence_prempt type
98896e0f5dc8 drm/xe: Use DMA_RESV_USAGE_PREEMPT for preempt fences
e8af0ebee771 drm/xe: Use dma_fence_preempt base class


