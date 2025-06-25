Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CD9C7EE2A
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 21:01:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A5610E134;
	Wed, 25 Jun 2025 21:01:50 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B9F910E134;
 Wed, 25 Jun 2025 21:01:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5BC?=
 =?utf-8?q?I=2C1/2=5D_drm/xe/guc=3A_Enable_extended_CAT_error_reporting?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 25 Jun 2025 21:01:49 -0000
Message-ID: <175088530956.110430.5661583448500760546@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250625205405.1653212-3-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250625205405.1653212-3-daniele.ceraolospurio@intel.com>
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

Series: series starting with [CI,1/2] drm/xe/guc: Enable extended CAT error reporting
URL   : https://patchwork.freedesktop.org/series/150785/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a64a3451cf7279f0e7e372f3508b6d146c63ab37
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Wed Jun 25 13:54:07 2025 -0700

    drm/xe/guc: Enable the Dynamic Inhibit Context Switch optimization
    
    The Dynamic Inhibit Context Switch is an optimization aimed at reducing
    the amount of time the HW is stuck waiting on an unsatisfied semaphore.
    When this optimization is enabled, the GuC will dynamically modify the
    CTX_CTRL_INHIBIT_SYN_CTX_SWITCH in the CTX_CONTEXT_CONTROL register of
    LRCs to enable immediate switching out on an unsatisfied semaphore wait
    when multiple contexts are competing for time on the same engine.
    
    This feature is available on recent HW from GuC 70.40.1 onwards and it
    is enabled via a per-VF feature opt-in.
    
    v2: rebase
    v3: switch to using guc_buf_cache instead of dedicated alloc
    v4: add helper to check for feature availability (Michal), don't enable
    if multi-lrc is possible.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Cc: Julia Filipchuk <julia.filipchuk@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch 74f3ed8bab4e5ef51f1c266e8c7ffd1f2a052a73 drm-intel
4cc8bada84ce drm/xe/guc: Enable extended CAT error reporting
-:121: WARNING:LINE_SPACING: Missing a blank line after declarations
#121: FILE: drivers/gpu/drm/xe/xe_guc.c:590:
+	struct xe_device *xe = guc_to_xe(guc);
+	CLASS(xe_guc_buf, buf)(&guc->buf, OPT_IN_MAX_DWORDS);

total: 0 errors, 1 warnings, 0 checks, 165 lines checked
a64a3451cf72 drm/xe/guc: Enable the Dynamic Inhibit Context Switch optimization


