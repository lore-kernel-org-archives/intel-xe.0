Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB4AC2BA18
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 05:06:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB9F10E562;
	Tue, 18 Jun 2024 05:06:35 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C2E10E562;
 Tue, 18 Jun 2024 05:06:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/rtp=3A_Allow_to_OR?=
 =?utf-8?q?_rules_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Jun 2024 05:06:33 -0000
Message-ID: <171868719348.97967.12512135577877896840@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240618050044.324454-1-lucas.demarchi@intel.com>
In-Reply-To: <20240618050044.324454-1-lucas.demarchi@intel.com>
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

Series: drm/xe/rtp: Allow to OR rules (rev2)
URL   : https://patchwork.freedesktop.org/series/134967/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 475ea5190aabe7c1dfeff023fe86bf74b8a5304a
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Mon Jun 17 22:00:44 2024 -0700

    drm/xe/xe2: Add proper check for media in Wa_14020756599
    
    A temporary fixup was made in commit 24d0d98af1c3 ("drm/xe/xe2lpm: Fixup
    Wa_14020756599") due to limitations in the RTP infra. Now that RTP has
    support for OR condition that change can be removed. RTP now also
    supports checking any GT, so use that instead of the more specific
    xe_rtp_match_when_media2000() used in that commit.
    
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 7f26b37f8cb73f5cf2251d7fff5b55240e04f153 drm-intel
723d60bbffdb drm/xe/rtp: Allow to match 0 sr entries
730a6a068199 drm/xe/rtp: Expand max rules/actions per entry
-:43: WARNING:LONG_LINE: line length of 165 exceeds 100 columns
#43: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:61:
+#define XE_RTP_PASTE_5(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_4(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:43: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#43: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:61:
+#define XE_RTP_PASTE_5(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_4(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:43: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'prefix_' - possible side-effects?
#43: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:61:
+#define XE_RTP_PASTE_5(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_4(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:43: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'args_' - possible side-effects?
#43: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:61:
+#define XE_RTP_PASTE_5(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_4(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:44: WARNING:LONG_LINE: line length of 165 exceeds 100 columns
#44: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:62:
+#define XE_RTP_PASTE_6(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_5(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:44: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#44: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:62:
+#define XE_RTP_PASTE_6(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_5(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:44: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'prefix_' - possible side-effects?
#44: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:62:
+#define XE_RTP_PASTE_6(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_5(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:44: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'args_' - possible side-effects?
#44: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:62:
+#define XE_RTP_PASTE_6(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_5(prefix_, sep_, _XE_TUPLE_TAIL args_)

total: 2 errors, 2 warnings, 4 checks, 24 lines checked
273627704010 drm/xe/rtp: Allow to OR rules
01c49eab5582 drm/xe/rtp: Add match on any GT
475ea5190aab drm/xe/xe2: Add proper check for media in Wa_14020756599


