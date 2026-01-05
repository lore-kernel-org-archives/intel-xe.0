Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1116C79F9E
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 15:06:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5093210E42E;
	Mon,  5 Jan 2026 15:06:11 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 648AD10E42D;
 Mon,  5 Jan 2026 15:06:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_put_COMMON=5FSL?=
 =?utf-8?q?ICE=5FCHICKEN3_on_the_allowlist_for_UMD?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lionel Landwerlin" <lionel.g.landwerlin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 05 Jan 2026 15:06:10 -0000
Message-ID: <176762557038.126412.6740508553496451419@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260105150222.462293-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20260105150222.462293-1-lionel.g.landwerlin@intel.com>
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

Series: drm/xe: put COMMON_SLICE_CHICKEN3 on the allowlist for UMD
URL   : https://patchwork.freedesktop.org/series/159648/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9f1cb6875f3f9eb0925ed50c16100322a2df513c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 81b97e57bf877b2e8d78c04e766f984c3342e53d
Author: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date:   Mon Jan 5 17:02:22 2026 +0200

    drm/xe: put COMMON_SLICE_CHICKEN3 on the allowlist for UMD
    
    Similar to i915's commit cebc13de7e704b1355bea208a9f9cdb042c74588
    ("drm/i915: Whitelist COMMON_SLICE_CHICKEN3 for UMD access")
    
    A recommended tuning setting for both gen12 and Xe_HP platforms
    requires that we grant userspace r/w access to the
    COMMON_SLICE_CHICKEN3 register.
    
    Bspec: 73993, 73994, 31870, 68331
    Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
+ /mt/dim checkpatch f5136cded03e959ebb00a1160e5f00973c38007e drm-intel
81b97e57bf87 drm/xe: put COMMON_SLICE_CHICKEN3 on the allowlist for UMD
-:26: ERROR:CODE_INDENT: code indent should use tabs where possible
#26: FILE: drivers/gpu/drm/xe/xe_reg_whitelist.c:50:
+                       ENGINE_CLASS(RENDER)),$

-:26: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#26: FILE: drivers/gpu/drm/xe/xe_reg_whitelist.c:50:
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
+                       ENGINE_CLASS(RENDER)),

-:26: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#26: FILE: drivers/gpu/drm/xe/xe_reg_whitelist.c:50:
+                       ENGINE_CLASS(RENDER)),$

total: 1 errors, 1 warnings, 1 checks, 11 lines checked


