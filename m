Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C4FCAC598
	for <intel-xe@archiver.kernel.org>; Tue, 16 Sep 2025 21:21:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B1010E80D;
	Tue, 16 Sep 2025 21:21:42 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E5710E561;
 Tue, 16 Sep 2025 21:21:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_user_comman?=
 =?utf-8?q?ds_to_WA_BB_via_configfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Sep 2025 21:21:41 -0000
Message-ID: <175805770143.339404.6172636581623547838@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250916-wa-bb-cmds-v5-0-306bddbc15da@intel.com>
In-Reply-To: <20250916-wa-bb-cmds-v5-0-306bddbc15da@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/154618/
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
commit 5cbf02e92d04690ac75fc0f51d817a6f5051efa1
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Tue Sep 16 14:15:44 2025 -0700

    drm/xe/configfs: Add mid context restore bb
    
    Like done for post context restore, allow the user to add commands to
    the middle of context restore, at the beginning of engine restore
    commands.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch c3610fc0ab7c1c668031b3804549187d75550e93 drm-intel
93ff3347ad4b drm/xe/configfs: Extract function to parse engine
50ec07c9f776 drm/xe/configfs: Allow to select by class only
-:41: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#41: FILE: drivers/gpu/drm/xe/xe_configfs.c:165:
+	{ .cls = "vcs", .mask = XE_HW_ENGINE_VCS_MASK, .engine_class = XE_ENGINE_CLASS_VIDEO_DECODE },

-:42: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#42: FILE: drivers/gpu/drm/xe/xe_configfs.c:166:
+	{ .cls = "vecs", .mask = XE_HW_ENGINE_VECS_MASK, .engine_class = XE_ENGINE_CLASS_VIDEO_ENHANCE },

total: 0 errors, 2 warnings, 0 checks, 105 lines checked
42515e16e743 drm/xe/lrc: Allow to add user commands on context switch
6942c31fa605 drm/xe/configfs: Add post context restore bb
b2ca3a46e669 drm/xe/lrc: Allow INDIRECT_CTX for more engine classes
c05578995897 drm/xe/lrc: Allow to add user commands mid context switch
5cbf02e92d04 drm/xe/configfs: Add mid context restore bb


