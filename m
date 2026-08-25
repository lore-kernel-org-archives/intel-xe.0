Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE93C5DF9C
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 00:39:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D092810E895;
	Tue, 25 Aug 2026 00:39:56 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CA5C10E895;
 Tue, 25 Aug 2026 00:39:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/xe3p=3A_Restore_sa?=
 =?utf-8?q?mpler_fault_for_uninitialized_surface_state?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Aug 2026 00:39:55 -0000
Message-ID: <178761839517.80981.7640947341174608568@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260824220458.520358-1-jose.souza@intel.com>
In-Reply-To: <20260824220458.520358-1-jose.souza@intel.com>
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

Series: drm/xe/xe3p: Restore sampler fault for uninitialized surface state
URL   : https://patchwork.freedesktop.org/series/172697/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 735724e9bc7c0a96cbd2cb7f0e896d60f797eb4e
Author: José Roberto de Souza <jose.souza@intel.com>
Date:   Mon Aug 24 15:04:58 2026 -0700

    drm/xe/xe3p: Restore sampler fault for uninitialized surface state
    
    Xe3p changed the default behavior of a fault in sampler when surface state
    address is 0x0.
    With the default behavior some default values are used instead of trigger the
    fault, what would make pretty hard to debug bugs.
    
    So here programing SAMPLER_MODE to change back to the default and expected
    behavior.
    
    Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch 15e2ba2fb6d25c03d89519aec46f8d5be3e118ad drm-intel
735724e9bc7c drm/xe/xe3p: Restore sampler fault for uninitialized surface state
-:12: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
With the default behavior some default values are used instead of trigger the

-:38: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#38: FILE: drivers/gpu/drm/xe/regs/xe_gt_regs.h:509:
+#define   SMP_FORCE_128B_OVERFETCH			REG_FIELD_PREP(SMP_WAIT_FETCH_MERGING_COUNTER, 1)

-:56: ERROR:CODE_INDENT: code indent should use tabs where possible
#56: FILE: drivers/gpu/drm/xe/xe_wa.c:607:
+^I^I^I^I              FUNC(xe_rtp_match_first_render_or_compute)),$

-:56: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#56: FILE: drivers/gpu/drm/xe/xe_wa.c:607:
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3500, XE_RTP_END_VERSION_UNDEFINED),
+				              FUNC(xe_rtp_match_first_render_or_compute)),

total: 1 errors, 2 warnings, 1 checks, 32 lines checked


