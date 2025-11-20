Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373B0CF8863
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 14:54:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F070610E767;
	Thu, 20 Nov 2025 14:54:43 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CEC010E766;
 Thu, 20 Nov 2025 14:54:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_tracepoints_to_profil?=
 =?utf-8?q?e_SVM_page_faults_and_migration_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 20 Nov 2025 14:54:43 -0000
Message-ID: <176365048343.14563.14498582084840805235@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251120134148.1450441-1-francois.dugast@intel.com>
In-Reply-To: <20251120134148.1450441-1-francois.dugast@intel.com>
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

Series: Add tracepoints to profile SVM page faults and migration (rev3)
URL   : https://patchwork.freedesktop.org/series/154280/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2b16a22f4d54d082643847c87406df0475f4be68
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Thu Nov 20 14:41:30 2025 +0100

    drm/xe/pagefault: Add tracepoints for page faults
    
    Add a new tracepoint when servicing VMA and SVM page faults to help UMD
    and application debugging.
    
    Here is a possible way to use it with bpftrace:
    
        sudo bpftrace -e 'tracepoint:xe:xe_pagefault_service {
            printf("%s page fault dev=%s addr=0x%llx asid=%u atomic=%u \
                   access_type=%u fault_type=%u fault_level=%u \
                   engine_class=%u engine_instance=%u vma_start=0x%llx \
                   vma_size=0x%llx\n",
                   args->cpu_addr_mirror ? "SVM" : "VMA", str(args->dev),
                   args->page_addr, args->asid, args->atomic,
                   args->access_type, args->fault_type, args->fault_level,
                   args->engine_class, args->engine_instance, args->vma_start,
                   args->vma_size);
        }'
    
    v2: Rebase after page fault refactor, expose more info (Stuart Summers)
    
    Cc: Stuart Summers <stuart.summers@intel.com>
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch 13909978d70fc4ded88b778a313b68ad86ba881a drm-intel
62cd52a5ae9a drm/xe/migrate: Add tracepoint during VRAM copy
-:53: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#53: FILE: drivers/gpu/drm/xe/xe_trace.h:473:
+		    TP_STRUCT__entry(

-:60: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#60: FILE: drivers/gpu/drm/xe/xe_trace.h:480:
+		    TP_fast_assign(

total: 0 errors, 0 warnings, 2 checks, 59 lines checked
2b16a22f4d54 drm/xe/pagefault: Add tracepoints for page faults
-:83: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#83: FILE: drivers/gpu/drm/xe/xe_trace.h:506:
+		    TP_STRUCT__entry(

-:98: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#98: FILE: drivers/gpu/drm/xe/xe_trace.h:521:
+		    TP_fast_assign(

total: 0 errors, 0 warnings, 2 checks, 91 lines checked


