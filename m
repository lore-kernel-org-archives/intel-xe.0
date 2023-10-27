Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1095C25B47
	for <intel-xe@archiver.kernel.org>; Fri, 27 Oct 2023 11:17:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A267410E978;
	Fri, 27 Oct 2023 11:17:32 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id B72C010E978;
 Fri, 27 Oct 2023 11:17:30 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id B50D6AADE3;
 Fri, 27 Oct 2023 11:17:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Fri, 27 Oct 2023 11:17:30 -0000
Message-ID: <169840545073.19711.16493986761633789681@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231027104810.310819-5-matthew.auld@intel.com>
In-Reply-To: <20231027104810.310819-5-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_So?=
 =?utf-8?q?me_eviction_fixes_=28rev2=29?=
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

Series: Some eviction fixes (rev2)
URL   : https://patchwork.freedesktop.org/series/125591/
State : warning

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
commit 226c0818ddc35bc3bd27e9cbd7ea468e46bb2485
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Fri Oct 27 11:48:14 2023 +0100

    drm/xe/bo: sync kernel fences for KMD buffers
    
    With things like pipelined evictions, VRAM pages can be marked as free
    and yet still have some active kernel fences, with the idea that the
    next caller to allocate the memory will respect them. However it looks
    like we are missing synchronisation for KMD internal buffers, like
    page-tables, lrc etc. For userspace objects we should already have the
    required synchronisation for CPU access via the fault handler, and
    likewise for GPU access when vm_binding them.
    
    To fix this synchronise against any kernel fences for all KMD objects at
    creation. This should resolve some severe corruption seen during
    evictions.
    
    v2 (Matt B):
      - Revamp the comment explaining this. Also mention why USAGE_KERNEL is
        correct here.
    
    Closes: ?
    Testcase: igt@xe-evict-ccs
    Reported-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 76d7314ce7ceb58ee595a0ae1ba45bc99b9e277d drm-intel
80c8a89c9 drm/xe/migrate: fix MI_ARB_ON_OFF usage
365ee677e drm/xe/bo: consider dma-resv fences for clear job
226c0818d drm/xe/bo: sync kernel fences for KMD buffers
-:25: WARNING:COMMIT_LOG_WRONG_LINK: 'Closes:' should be followed by a public http(s) link
#25: 
Closes: ?

-:27: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#27: 
Reported-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>

total: 0 errors, 2 warnings, 0 checks, 27 lines checked


