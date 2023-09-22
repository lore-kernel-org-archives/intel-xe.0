Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF53E7D0D6
	for <intel-xe@archiver.kernel.org>; Fri, 22 Sep 2023 07:12:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0226D10E61E;
	Fri, 22 Sep 2023 07:12:06 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 364FB10E61E;
 Fri, 22 Sep 2023 07:12:04 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 3311AAADDD;
 Fri, 22 Sep 2023 07:12:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Date: Fri, 22 Sep 2023 07:12:04 -0000
Message-ID: <169536672420.5199.1191470677663135288@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230921115002.22884-1-tejas.upadhyay@intel.com>
In-Reply-To: <20230921115002.22884-1-tejas.upadhyay@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_fdinfo_memory_stats_=28rev7=29?=
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

Series: drm/xe: fdinfo memory stats (rev7)
URL   : https://patchwork.freedesktop.org/series/123102/
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
commit f1c78e128f5d630ae2e22c1b6286491dcb649df9
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Thu Sep 21 17:20:02 2023 +0530

    drm/xe: Implement fdinfo memory stats printing
    
    Use the newly added drm_print_memory_stats helper to show memory
    utilisation of our objects in drm/driver specific fdinfo output.
    
    To collect the stats we walk the per memory regions object lists
    and accumulate object size into the respective drm_memory_stats
    categories.
    
    Objects with multiple possible placements are reported in multiple
    regions for total and shared sizes, while other categories are
    counted only for the currently active region.
    
    V4:
      - Remove rcu lock - Auld/Thomas
      - take refcnt only if its non-zero - Auld
      - DMA_RESV_USAGE_BOOKKEEP covers all fences - Auld
      - covert to xe_bo for public objects
    V3:
      - dont use xe_bo_get/put, not needed
      - use designated initializer - Jani
      - use list_for_each_entry_rcu
      - Fix Checkpatch err - CI
    V2:
      - Use static initializer for mem_type - Himal/Jani
    
    Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch 7e0d40e7aa56f19a9b3e9bc492003085f9be01c3 drm-intel
f7a5857b4 drm/xe: Add drm-client infrastructure
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:98: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#98: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 159 lines checked
768be59be drm/xe: Interface xe drm client with fdinfo interface
8f9f11af4 drm/xe: Add tracking support for bos per client
521110d74 drm/xe: Record each drm client with its VM
f2352bcd4 drm/xe: Track page table memory usage for client
f974a15c4 drm/xe: Account ring buffer and context state storage
f1c78e128 drm/xe: Implement fdinfo memory stats printing


