Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB4A5D609A7
	for <intel-xe@archiver.kernel.org>; Wed, 27 Nov 2024 08:01:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49AE10EA15;
	Wed, 27 Nov 2024 08:01:21 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D896D10EA15;
 Wed, 27 Nov 2024 08:01:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Power?=
 =?utf-8?q?_request_asserting/deasserting?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kahola, Mika" <mika.kahola@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 27 Nov 2024 08:01:20 -0000
Message-ID: <173269448088.3655976.17165303920563082653@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241127073200.124907-1-mika.kahola@intel.com>
In-Reply-To: <20241127073200.124907-1-mika.kahola@intel.com>
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

Series: drm/i915/display: Power request asserting/deasserting
URL   : https://patchwork.freedesktop.org/series/141822/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 26f56bd4f5680076f36e0b47e0a5737ff996d080
Author: Mika Kahola <mika.kahola@intel.com>
Date:   Wed Nov 27 09:32:00 2024 +0200

    drm/i915/display: Use struct intel_display instead of struct drm_i915_private
    
    Let's start using struct intel_display instead of struct drm_i915_private
    when introducing new code. No functional changes.
    
    v2: Drop tc_to_intel_display() helper funtion (Jani)
    
    Signed-off-by: Mika Kahola <mika.kahola@intel.com>
    Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
+ /mt/dim checkpatch 241f1fd26b38614aa85276a78b127e9abb14850a drm-intel
614a4aa453be drm/i915/xe3lpd: Power request asserting/deasserting
-:36: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#36: 
v5: Drop TCSS_DISP_MAILBOX_IN_CMD_RUN_BUSY from TCSS_DISP_MAILBOX_IN_CMD_DATA(val)

-:56: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#56: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h:206:
+#define   TCSS_DISP_MAILBOX_IN_CMD_DATA(val)	REG_FIELD_PREP(TCSS_DISP_MAILBOX_IN_CMD_CMD_MASK, val)

total: 0 errors, 2 warnings, 0 checks, 60 lines checked
26f56bd4f568 drm/i915/display: Use struct intel_display instead of struct drm_i915_private
-:10: WARNING:TYPO_SPELLING: 'funtion' may be misspelled - perhaps 'function'?
#10: 
v2: Drop tc_to_intel_display() helper funtion (Jani)
                                      ^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 26 lines checked


