Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 033A8CAC587
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 20:19:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B335510EB85;
	Thu, 11 Sep 2025 20:19:32 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D3310EB85;
 Thu, 11 Sep 2025 20:19:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_user_comman?=
 =?utf-8?q?ds_to_WA_BB_via_configfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Sep 2025 20:19:31 -0000
Message-ID: <175762197159.327980.5965445049874516271@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250911-wa-bb-cmds-v4-0-c8f7e48f7eae@intel.com>
In-Reply-To: <20250911-wa-bb-cmds-v4-0-c8f7e48f7eae@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/154420/
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
commit 47c3395dab446c99fdf26c7813364d887722c558
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Thu Sep 11 12:36:30 2025 -0700

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
+ /mt/dim checkpatch a433a14cc397ef049ef273a3d4404d46a20a28cb drm-intel
5ee27c2e4d2b drm/xe: Update workaround documentation
d7db1f69569e drm/xe/configfs: Fix documentation warning
c43318b32bb1 drm/xe/configfs: Extract function to parse engine
cd9ea0537bb5 drm/xe/configfs: Allow to select by class only
-:41: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#41: FILE: drivers/gpu/drm/xe/xe_configfs.c:165:
+	{ .cls = "vcs", .mask = XE_HW_ENGINE_VCS_MASK, .engine_class = XE_ENGINE_CLASS_VIDEO_DECODE },

-:42: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#42: FILE: drivers/gpu/drm/xe/xe_configfs.c:166:
+	{ .cls = "vecs", .mask = XE_HW_ENGINE_VECS_MASK, .engine_class = XE_ENGINE_CLASS_VIDEO_ENHANCE },

total: 0 errors, 2 warnings, 0 checks, 105 lines checked
545706eb92d9 drm/xe/lrc: Allow to add user commands on context switch
47c3395dab44 drm/xe/configfs: Add post context restore bb


