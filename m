Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9606CAC581
	for <intel-xe@archiver.kernel.org>; Mon,  8 Sep 2025 19:46:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75F1E10E5BF;
	Mon,  8 Sep 2025 19:46:33 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA39710E5BF;
 Mon,  8 Sep 2025 19:46:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_user_comman?=
 =?utf-8?q?ds_to_WA_BB_via_configfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 08 Sep 2025 19:46:32 -0000
Message-ID: <175736079269.313434.16878818676236954679@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250905-wa-bb-cmds-v3-0-3da2b7bdc73e@intel.com>
In-Reply-To: <20250905-wa-bb-cmds-v3-0-3da2b7bdc73e@intel.com>
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

Series: drm/xe: Add user commands to WA BB via configfs
URL   : https://patchwork.freedesktop.org/series/154119/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f8a73eb9bdc72771773528edf183e617a5dea903
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Fri Sep 5 22:50:34 2025 -0700

    drm/xe/configfs: Add post context restore bb
    
    Allow the user to specify commands to execute during a context restore.
    Currently it's possible to parse 2 types of actions:
    
            - cmd: the instructions are added as is to the bb
            - reg: just use the address and value, without worrying about
              encoding the right LRI instruction. This is possibly the most
              useful use case, so added a dedicated action for that.
    
    This also prepares for future BBs: mid context restore and rc6 context
    restore that can re-use the same parsing functions.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 6da3b81612a8f96c0b70981f173381ca05f80ce0 drm-intel
31590e58378a drm/xe: Update workaround documentation
de07bfb11eb1 drm/xe/configfs: Fix documentation warning
1189c84b55de drm/xe/configfs: Extract function to parse engine
3719bb23455d drm/xe/configfs: Allow to select by class only
-:40: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#40: FILE: drivers/gpu/drm/xe/xe_configfs.c:165:
+	{ .cls = "vcs", .mask = XE_HW_ENGINE_VCS_MASK, .engine_class = XE_ENGINE_CLASS_VIDEO_DECODE },

-:41: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#41: FILE: drivers/gpu/drm/xe/xe_configfs.c:166:
+	{ .cls = "vecs", .mask = XE_HW_ENGINE_VECS_MASK, .engine_class = XE_ENGINE_CLASS_VIDEO_ENHANCE },

total: 0 errors, 2 warnings, 0 checks, 105 lines checked
a0d798c7b6b5 drm/xe/lrc: Allow to add user commands on context switch
f8a73eb9bdc7 drm/xe/configfs: Add post context restore bb


