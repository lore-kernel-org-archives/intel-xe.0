Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD62C3DA64
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jul 2024 21:37:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B65D10E6DA;
	Wed, 31 Jul 2024 21:37:09 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 756F810E6DA;
 Wed, 31 Jul 2024 21:37:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Faster_devcoredump_and_fi?=
 =?utf-8?q?xes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 31 Jul 2024 21:37:08 -0000
Message-ID: <172246182847.469469.1901490916113238657@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240731213221.2523989-1-matthew.brost@intel.com>
In-Reply-To: <20240731213221.2523989-1-matthew.brost@intel.com>
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

Series: Faster devcoredump and fixes
URL   : https://patchwork.freedesktop.org/series/136770/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
7b537a014c4c1a32250e342541870b03977fa7a4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ba6e71dcf533cb48ef08ca4056ddf83b4bf316d5
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Jul 31 14:32:21 2024 -0700

    drm/xe: Faster devcoredump
    
    The current algorithm to read out devcoredump is O(N*N) where N is the
    size of coredump due to usage of the drm_coredump_printer in
    xe_devcoredump_read. Switch to a O(N) algorithm which prints the
    devcoredump into a readable format in snapshot work and update
    xe_devcoredump_read to memcpy from the readable format directly.
    
    v2:
     - Fix double free on devcoredump removal (Testing)
     - Set read_data_size after snap work flush
     - Adjust remaining in iterator upon realloc (Testing)
     - Set read_data upon realloc (Testing)
    v3:
     - Kernel doc
    
    Reported-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2408
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch caaefe49619299337b0fdc73a2379043d8684825 drm-intel
efc9a50df162 drm/xe: Take ref to VM in delayed snapshot
-:14: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 47058633d9c5 ("drm/xe: Move lrc snapshot capturing to xe_lrc.c")'
#14: 
47058633d9c5 ("drm/xe: Move lrc snapshot capturing to xe_lrc.c")

total: 1 errors, 0 warnings, 0 checks, 46 lines checked
76e6757a1bd9 drm/printer: Allow NULL data in devcoredump printer
-:23: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#23: FILE: drivers/gpu/drm/drm_print.c:105:
+			memcpy(iterator->data,
+				str + (iterator->start - iterator->offset), copy);

-:44: CHECK:SPACING: No space is necessary after a cast
#44: FILE: drivers/gpu/drm/drm_print.c:146:
+			snprintf(((char *) iterator->data) + pos,

-:45: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#45: FILE: drivers/gpu/drm/drm_print.c:147:
+			snprintf(((char *) iterator->data) + pos,
+				iterator->remain, "%pV", vaf);

total: 0 errors, 0 warnings, 3 checks, 31 lines checked
ba6e71dcf533 drm/xe: Faster devcoredump


