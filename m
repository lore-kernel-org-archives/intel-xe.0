Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C760C48297
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 11:10:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E67710FCC7;
	Tue,  6 Feb 2024 11:10:41 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11EB310FEBA;
 Tue,  6 Feb 2024 11:10:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_xe/xe=5Fbo=5Fmove=3A_Enha?=
 =?utf-8?q?nce_xe=5Fbo=5Fmove_trace_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: priyanka.dandamudi@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 Feb 2024 11:10:40 -0000
Message-ID: <170721784007.1055287.15627585304620152234@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240206105911.107720-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20240206105911.107720-1-priyanka.dandamudi@intel.com>
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

Series: xe/xe_bo_move: Enhance xe_bo_move trace (rev4)
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
commit 61739fba076280643680527b162320b75de5e678
Author: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Date:   Tue Feb 6 16:29:11 2024 +0530

    xe/xe_bo_move: Enhance xe_bo_move trace
    
    Enhanced xe_bo_move trace to be more readable.
    It will help to show the migration details.
    Src and dst details.
    
    v2: Modify trace_xe_bo_move(), it takes the integer mem_type
    rather than a string.
    Make mem_type_to_name() extern, it will be used by trace.(Thomas)
    
    v3: Move mem_type_to_name() to xe_bo.[ch] (Thomas, Matt)
    
    v4: Add device details to reduce ambiquity related to vram0/vram1. (Oak)
    
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Oak Zeng <oak.zeng@intel.com>
    Cc: Kempczynski Zbigniew <Zbigniew.Kempczynski@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Brian Welty <brian.welty@intel.com>
    Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
+ /mt/dim checkpatch 7c79a8cb401543f9c8aa8a60e497ae1720ec4cf0 drm-intel
61739fba0 xe/xe_bo_move: Enhance xe_bo_move trace
-:119: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#119: FILE: drivers/gpu/drm/xe/xe_trace.h:107:
+	    TP_STRUCT__entry(

-:127: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#127: FILE: drivers/gpu/drm/xe/xe_trace.h:115:
+	    TP_fast_assign(

-:132: WARNING:LONG_LINE: line length of 111 exceeds 100 columns
#132: FILE: drivers/gpu/drm/xe/xe_trace.h:120:
+		   strscpy(__entry->device_id, dev_name(ttm_to_xe_device(__entry->bo->ttm.bdev)->drm.dev), 12);

total: 0 errors, 1 warnings, 2 checks, 89 lines checked


