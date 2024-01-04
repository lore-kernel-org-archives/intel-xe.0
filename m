Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FAFC47074
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 13:33:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 909F610E2CF;
	Thu,  4 Jan 2024 13:33:38 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7087210E2CF;
 Thu,  4 Jan 2024 13:33:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_xe/xe=5Fbo=5Fmove=3A_Enha?=
 =?utf-8?q?nce_xe=5Fbo=5Fmove_trace_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
Date: Thu, 04 Jan 2024 13:33:37 -0000
Message-ID: <170437521746.20586.15470221078193686704@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240103123826.2386219-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20240103123826.2386219-1-priyanka.dandamudi@intel.com>
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

Series: xe/xe_bo_move: Enhance xe_bo_move trace (rev2)
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
commit f9ae1b5b050461dccf522425ad491b8bee7953a5
Author: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Date:   Wed Jan 3 18:08:26 2024 +0530

    xe/xe_bo_move: Enhance xe_bo_move trace
    
    Enhanced xe_bo_move trace to be more readable.
    It will help to show the migration details.
    Src and dst details.
    
    v2: Modify trace_xe_bo_move(), it takes the integer mem_type
    rather than a string.
    Make mem_type_to_name() extern, it will be used by trace.(Thomas)
    
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Oak Zeng <oak.zeng@intel.com>
    Cc: Kempczynski Zbigniew <Zbigniew.Kempczynski@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Brian Welty <brian.welty@intel.com>
    Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
+ /mt/dim checkpatch 7b3b98d034784b125bad7aca46f9e7a3cfcde45a drm-intel
f9ae1b5b0 xe/xe_bo_move: Enhance xe_bo_move trace
-:107: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#107: FILE: drivers/gpu/drm/xe/xe_trace.h:107:
+	    TP_STRUCT__entry(

-:114: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#114: FILE: drivers/gpu/drm/xe/xe_trace.h:114:
+	    TP_fast_assign(

total: 0 errors, 0 warnings, 2 checks, 81 lines checked


