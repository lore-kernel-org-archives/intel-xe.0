Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6DAC48BC3
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 04:53:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45C8210E0E6;
	Tue, 20 Feb 2024 04:53:46 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D0110E106;
 Tue, 20 Feb 2024 04:53:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_xe/xe=5Fbo=5Fmove=3A_Enha?=
 =?utf-8?q?nce_xe=5Fbo=5Fmove_trace_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: priyanka.dandamudi@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 Feb 2024 04:53:45 -0000
Message-ID: <170840482526.108167.3393268108464447167@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240220044748.948496-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20240220044748.948496-1-priyanka.dandamudi@intel.com>
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

Series: xe/xe_bo_move: Enhance xe_bo_move trace (rev7)
URL   : https://patchwork.freedesktop.org/series/128151/
State : warning

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
commit b679908ba123bf4d9514f805b1ec18e1363f384c
Author: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Date:   Tue Feb 20 10:17:48 2024 +0530

    xe/xe_bo_move: Enhance xe_bo_move trace
    
    Enhanced xe_bo_move trace to be more readable.
    It will help to show the migration details.
    Src and dst details.
    
    v2: Modify trace_xe_bo_move(), it takes the integer mem_type
    rather than a string.
    Make mem_type_to_name() extern, it will be used by trace.(Thomas)
    
    v3: Move mem_type_to_name() to xe_bo.[ch] (Thomas, Matt)
    
    v4: Add device details to reduce ambiquity related to vram0/vram1. (Oak)
    
    v5: Rename mem_type_to_name to xe_mem_type_to_name. (Thomas)
    
    v6: Optimised code to use xe_bo_device(__entry->bo). (Thomas)
    
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Oak Zeng <oak.zeng@intel.com>
    Cc: Kempczynski Zbigniew <Zbigniew.Kempczynski@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Brian Welty <brian.welty@intel.com>
    Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
    Reviewed-by: Oak Zeng <oak.zeng@intel.com>
    Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch faa7ecc2f307081d72680304e698220c244d1238 drm-intel
b679908ba123 xe/xe_bo_move: Enhance xe_bo_move trace
-:143: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#143: FILE: drivers/gpu/drm/xe/xe_trace.h:107:
+	    TP_STRUCT__entry(

-:151: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#151: FILE: drivers/gpu/drm/xe/xe_trace.h:115:
+	    TP_fast_assign(

total: 0 errors, 0 warnings, 2 checks, 105 lines checked


