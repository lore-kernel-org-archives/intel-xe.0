Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C01DC0218A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jan 2025 16:41:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2FE510E6CA;
	Tue, 28 Jan 2025 16:41:46 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F8910E6CA;
 Tue, 28 Jan 2025 16:41:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Fix_size=5F?=
 =?utf-8?q?t_print_format?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 28 Jan 2025 16:41:46 -0000
Message-ID: <173808250633.2004773.6287240610794833971@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250128154242.3371687-1-lucas.demarchi@intel.com>
In-Reply-To: <20250128154242.3371687-1-lucas.demarchi@intel.com>
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

Series: drm/xe/guc: Fix size_t print format
URL   : https://patchwork.freedesktop.org/series/144039/
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
commit a3654f1f8dbb7f2fc68f0890eda4861bb4d9da80
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Tue Jan 28 07:42:42 2025 -0800

    drm/xe/guc: Fix size_t print format
    
    Use %zx format to print size_t to remove the following warning when
    building for i386:
    
       include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
         518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
             |                               ~~~~~~~~~~~ ^ ~~~
    >> drivers/gpu/drm/xe/xe_guc_ct.c:1727:43: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
        1727 |                         drm_printf(p, "[CTB].length: 0x%lx\n", snapshot->ctb_size);
             |                                                        ~~~     ^~~~~~~~~~~~~~~~~~
             |                                                        %zx
    
    Cc: José Roberto de Souza <jose.souza@intel.com>
    Reported-by: kernel test robot <lkp@intel.com>
    Closes: https://lore.kernel.org/oe-kbuild-all/202501281627.H6nj184e-lkp@intel.com/
    Fixes: cb1f868ca137 ("drm/xe: Make GUC binaries dump consistent with other binaries in devcoredump")
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 5abfea439ebf973d3eabf588f5d87054676b6f2e drm-intel
a3654f1f8dbb drm/xe/guc: Fix size_t print format
-:13: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#13: 
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"

total: 0 errors, 1 warnings, 0 checks, 16 lines checked


