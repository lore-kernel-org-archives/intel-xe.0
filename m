Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3269CC3ABC9
	for <intel-xe@archiver.kernel.org>; Fri, 16 May 2025 07:50:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB8510E9D2;
	Fri, 16 May 2025 07:50:18 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C8710E9C9;
 Fri, 16 May 2025 07:50:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_More_missing_XeLP_workaro?=
 =?utf-8?q?unds?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 May 2025 07:50:17 -0000
Message-ID: <174738181794.87017.14739716463222922047@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250516074412.46863-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250516074412.46863-1-tvrtko.ursulin@igalia.com>
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

Series: More missing XeLP workarounds
URL   : https://patchwork.freedesktop.org/series/149097/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e2572a190725c357a23208b5a878c2396ceecd76
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Fri May 16 08:44:12 2025 +0100

    drm/xe/xelp: Add Wa_18022495364
    
    Add Wa_18022495364 as a context indirect workaround.
    
    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
+ /mt/dim checkpatch bf8c2c7bea6b5a38b6a3c24fdfc72b1ab5c03c28 drm-intel
5498cd8f36bd drm/xe: Clarify LRC size when allocating
dfff4e6949a8 drm/xe/xelp: Implement HSDES#16010904313 workarounds
-:127: CHECK:SPACING: spaces preferred around that '+' (ctx:VxW)
#127: FILE: drivers/gpu/drm/xe/xe_lrc.c:1021:
+	*cmd++ = __xe_lrc_regs_ggtt_addr(lrc)+ CTX_CMD_BUF_CCTL * sizeof(u32);
 	                                     ^

-:175: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#175: FILE: drivers/gpu/drm/xe/xe_lrc.c:1069:
+	start = cmd = map.vaddr;

total: 0 errors, 0 warnings, 2 checks, 190 lines checked
e2572a190725 drm/xe/xelp: Add Wa_18022495364


