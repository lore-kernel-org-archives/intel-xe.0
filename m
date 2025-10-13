Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1098BCCD185
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 20:23:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F3410E515;
	Mon, 13 Oct 2025 20:23:44 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 628A010E509;
 Mon, 13 Oct 2025 20:23:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_xe=5Fguc=5Fpc?=
 =?utf-8?q?=2Ec=3A_fix_DOC_underlines?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Randy Dunlap" <rdunlap@infradead.org>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 13 Oct 2025 20:23:43 -0000
Message-ID: <176038702339.7102.419248975115942431@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251013182827.733781-1-rdunlap@infradead.org>
In-Reply-To: <20251013182827.733781-1-rdunlap@infradead.org>
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

Series: drm/xe: xe_guc_pc.c: fix DOC underlines
URL   : https://patchwork.freedesktop.org/series/155851/
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
commit e4b707c30f47bd21b65d33aa464d68214466a214
Author: Randy Dunlap <rdunlap@infradead.org>
Date:   Mon Oct 13 11:28:26 2025 -0700

    drm/xe: xe_guc_pc.c: fix DOC underlines
    
    Apparently a recent change in docutils has made checking of section
    heading levels (underline style) be more careful.
    
    There are 2 heading underline style errors reported here. Repair them by
    changing the underline style from Chapter (using '=') to Section (using
    '-') since they are used within a Chapter already (in xe_firmware.rst).
    
    """
    Documentation/gpu/xe/xe_firmware.rst:31: drivers/gpu/drm/xe/xe_guc_pc.c:75: ERROR: A level 2 section cannot be used here.
    
    Frequency management:
    
    =====================
    
    Established title styles: =/= =
    
    The parent of level 2 sections cannot be reached. The parser is at section level 2 but the current node has only 0 parent section(s).
    One reason may be a high level section used in a directive that parses its content into a base node not attached to the document
    (up to Docutils 0.21, these sections were silently dropped). [docutils]
    Documentation/gpu/xe/xe_firmware:31: ../drivers/gpu/drm/xe/xe_guc_pc.c:86: ERROR: A level 2 section cannot be used here.
    
    Render-C States:
    ================
    
    Established title styles: =/= =
    
    The parent of level 2 sections cannot be reached. The parser is at section level 2 but the current node has only 0 parent section(s).
    One reason may be a high level section used in a directive that parses its content into a base node not attached to the document
    (up to Docutils 0.21, these sections were silently dropped). [docutils]
    """
    
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
+ /mt/dim checkpatch f33ccc63d84c30ee59454b6c4e9303ef36c41c0c drm-intel
e4b707c30f47 drm/xe: xe_guc_pc.c: fix DOC underlines
-:22: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#22: 
The parent of level 2 sections cannot be reached. The parser is at section level 2 but the current node has only 0 parent section(s).

total: 0 errors, 1 warnings, 0 checks, 20 lines checked


