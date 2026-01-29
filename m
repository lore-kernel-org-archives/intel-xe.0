Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B428FD358DB
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 08:10:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E57A10E804;
	Thu, 29 Jan 2026 08:10:57 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1AE210E7FC;
 Thu, 29 Jan 2026 08:10:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Enable_Wa=5F140?=
 =?utf-8?q?25515070=2C_Enable_indirect_ring_state_for_XE2+?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 29 Jan 2026 08:10:56 -0000
Message-ID: <176967425698.204204.14436174260517247154@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260129072706.2587551-5-julia.filipchuk@intel.com>
In-Reply-To: <20260129072706.2587551-5-julia.filipchuk@intel.com>
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

Series: drm/xe: Enable Wa_14025515070, Enable indirect ring state for XE2+
URL   : https://patchwork.freedesktop.org/series/160812/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e323a91c162449eeac9fb7db3bac9e4b3f478a58
Author: Julia Filipchuk <julia.filipchuk@intel.com>
Date:   Wed Jan 28 23:27:01 2026 -0800

    Reapply "drm/xe/xe2: Enable Indirect Ring State support for Xe2"
    
    This reverts commit 03d85ab36bcbcbe9dc962fccd3f8e54d7bb93b35.
    
    Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
+ /mt/dim checkpatch 6a3c9a03d943eb112c916c7419a837bc7de3a296 drm-intel
c7f94a4c690f drm/xe: Enable Wa_14025515070
-:37: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#37: FILE: drivers/gpu/drm/xe/xe_guc_ads.c:366:
+					 GUC_WA_KLV_CLEAR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CONTEXT_REGISTRATION);

-:38: CHECK:BRACES: Unbalanced braces around else statement
#38: FILE: drivers/gpu/drm/xe/xe_guc_ads.c:367:
+		else {

total: 0 errors, 1 warnings, 1 checks, 35 lines checked
4bc76e4b0021 Revert "drm/xe/xe3p_xpc: Enable Indirect Ring State for xe3p_xpc"
e323a91c1624 Reapply "drm/xe/xe2: Enable Indirect Ring State support for Xe2"


