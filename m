Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EAF2C3DA64
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 22:03:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A2F10E0CD;
	Thu,  1 Aug 2024 22:03:35 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 557AF10E0CD;
 Thu,  1 Aug 2024 22:03:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/xe2=3A_Introduce_p?=
 =?utf-8?q?erformance_changes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Akshata Jahagirdar" <akshata.jahagirdar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 01 Aug 2024 22:03:34 -0000
Message-ID: <172254981434.489355.17299008894020784215@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1722591343.git.akshata.jahagirdar@intel.com>
In-Reply-To: <cover.1722591343.git.akshata.jahagirdar@intel.com>
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

Series: drm/xe/xe2: Introduce performance changes
URL   : https://patchwork.freedesktop.org/series/136816/
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
commit 4ee3ebcd9b5875051113e917d8fac902a2db5c44
Author: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Date:   Fri Aug 2 02:39:29 2024 -0700

    drm/xe/xe2: Introduce performance changes
    
    Add Compression Performance Improvement Changes in Xe2
    
    v2: Rebase
    
    v3: Rebase, updated as per latest changes on bspec,
        Removed unnecessary default actions (Matt)
        formatting nits (Tejas)
    
    Bspec: 72161
    Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
+ /mt/dim checkpatch d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5 drm-intel
4ee3ebcd9b58 drm/xe/xe2: Introduce performance changes
-:43: ERROR:CODE_INDENT: code indent should use tabs where possible
#43: FILE: drivers/gpu/drm/xe/xe_tuning.c:51:
+^I  ^I^I     COMPMEMRD256BOVRFETCHEN |$

-:43: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#43: FILE: drivers/gpu/drm/xe/xe_tuning.c:51:
+^I  ^I^I     COMPMEMRD256BOVRFETCHEN |$

-:43: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#43: FILE: drivers/gpu/drm/xe/xe_tuning.c:51:
+	  XE_RTP_ACTIONS(SET(L3SQCREG2,
+	  		     COMPMEMRD256BOVRFETCHEN |

-:44: ERROR:CODE_INDENT: code indent should use tabs where possible
#44: FILE: drivers/gpu/drm/xe/xe_tuning.c:52:
+^I  ^I^I     MEMRD256BOVRFETCHEN))$

-:44: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#44: FILE: drivers/gpu/drm/xe/xe_tuning.c:52:
+^I  ^I^I     MEMRD256BOVRFETCHEN))$

total: 2 errors, 2 warnings, 1 checks, 22 lines checked


