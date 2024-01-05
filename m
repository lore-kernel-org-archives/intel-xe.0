Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C948C3DA6E
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jan 2024 05:33:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27DAC10E562;
	Fri,  5 Jan 2024 05:33:06 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E675110E56A;
 Fri,  5 Jan 2024 05:33:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_xe/xe=5Fbo=5Fmove=3A_Enha?=
 =?utf-8?q?nce_xe=5Fbo=5Fmove_trace_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: priyanka.dandamudi@intel.com
Date: Fri, 05 Jan 2024 05:33:04 -0000
Message-ID: <170443278494.20654.14762181425413635733@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240105052420.2389969-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20240105052420.2389969-1-priyanka.dandamudi@intel.com>
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

Series: xe/xe_bo_move: Enhance xe_bo_move trace (rev3)
URL   : https://patchwork.freedesktop.org/series/128151/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6132e0df11938ea0538fab59c094076bc84f262c
Author: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Date:   Fri Jan 5 10:54:20 2024 +0530

    xe/xe_bo_move: Enhance xe_bo_move trace
    
    Enhanced xe_bo_move trace to be more readable.
    It will help to show the migration details.
    Src and dst details.
    
    v2: Modify trace_xe_bo_move(), it takes the integer mem_type
    rather than a string.
    Make mem_type_to_name() extern, it will be used by trace.(Thomas)
    
    v3: Move mem_type_to_name() to xe_bo.[ch] (Thomas, Matt)
    
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Oak Zeng <oak.zeng@intel.com>
    Cc: Kempczynski Zbigniew <Zbigniew.Kempczynski@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Brian Welty <brian.welty@intel.com>
    Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
+ /mt/dim checkpatch 7b3b98d034784b125bad7aca46f9e7a3cfcde45a drm-intel
6132e0df1 xe/xe_bo_move: Enhance xe_bo_move trace
-:108: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#108: FILE: drivers/gpu/drm/xe/xe_trace.h:107:
+	    TP_STRUCT__entry(

-:115: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#115: FILE: drivers/gpu/drm/xe/xe_trace.h:114:
+	    TP_fast_assign(

total: 0 errors, 0 warnings, 2 checks, 80 lines checked


