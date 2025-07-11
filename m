Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456C0C83F1A
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 16:08:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E8C10EA70;
	Fri, 11 Jul 2025 16:08:03 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C0510EA6E;
 Fri, 11 Jul 2025 16:08:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_More_missing_XeLP_workaro?=
 =?utf-8?q?unds_=28rev11=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 11 Jul 2025 16:08:00 -0000
Message-ID: <175225008099.155282.12754892027489147794@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250711160153.49833-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250711160153.49833-1-tvrtko.ursulin@igalia.com>
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

Series: More missing XeLP workarounds (rev11)
URL   : https://patchwork.freedesktop.org/series/149097/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
43254c2aa575037fc031c7ac21b0d031c700b2bf
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c9dcf639551e5a3cff8184310c23a12f1f1a9d0f
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Fri Jul 11 17:01:53 2025 +0100

    drm/xe/xelp: Add Wa_18022495364
    
    Add Wa_18022495364 as a context workaround batch buffer workaround.
    
    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch d415c0716821abca694e8a93e74cc71b4a9b6522 drm-intel
72d8a5211be4 drm/xe: Generalize wa bb emission code
a32f4de62664 drm/xe: Pass wa bb setup arguments in a struct
-:32: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#32: FILE: drivers/gpu/drm/xe/xe_lrc.c:982:
+^Istruct xe_lrc ^I^I*lrc;$

-:35: WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#35: FILE: drivers/gpu/drm/xe/xe_lrc.c:985:
+	unsigned		offset;

-:37: WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#37: FILE: drivers/gpu/drm/xe/xe_lrc.c:987:
+	unsigned		num_funcs;

total: 0 errors, 3 warnings, 0 checks, 133 lines checked
e8a796694289 drm/xe: Rename utilization workaround emission function
65637b64604b drm/xe: Track number of written dwords from workaround batch buffer emission
7efeebf804df drm/xe: Allow specifying number of extra dwords at the end of wa bb emission
9a9661bff8d9 drm/xe: Add plumbing for indirect context workarounds
27b80cc2a136 drm/xe/xelp: Implement Wa_16010904313
c9dcf639551e drm/xe/xelp: Add Wa_18022495364


