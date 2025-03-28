Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11F0C28B20
	for <intel-xe@archiver.kernel.org>; Fri, 28 Mar 2025 19:43:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A48510E160;
	Fri, 28 Mar 2025 19:43:33 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36B9E10E160;
 Fri, 28 Mar 2025 19:43:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable_GuC_opt-in_feature?=
 =?utf-8?q?s_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 28 Mar 2025 19:43:32 -0000
Message-ID: <174319101221.16988.6966598129292200223@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250328172837.2607990-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250328172837.2607990-1-daniele.ceraolospurio@intel.com>
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

Series: Enable GuC opt-in features (rev3)
URL   : https://patchwork.freedesktop.org/series/145532/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e9f69bd0d0ec5af8c9dead096b743d3db6ae91d0
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Fri Mar 28 10:28:37 2025 -0700

    drm/xe/guc: Enable the Dynamic Inhibit Context Switch optimization
    
    The Dynamic Inhibit Context Switch is an optimization aimed at reducing
    the amount of time the HW is stuck waiting on an unsatisfied semaphore.
    When this optimization is enabled, the GuC will dynamically modify the
    CTX_CTRL_INHIBIT_SYN_CTX_SWITCH in the CTX_CONTEXT_CONTROL register of
    lrcs to enable immediate switching out on an usatisfied semaphore wait
    when multiple contexts are competing for time on the same engine.
    
    This feature is available on recent HW from GuC 70.40.1 onwards and it
    is enabled via a per-VF feature opt-in.
    
    v2: rebase
    v3: switch to using guc_buf_cache instead of dedicated alloc
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Cc: Julia Filipchuk <julia.filipchuk@intel.com>
+ /mt/dim checkpatch 9447a2490a5bfe1540aa5c59ac9cd537a9574158 drm-intel
e518e407e2a7 drm/xe/guc: Enable extended CAT error reporting
-:119: WARNING:LINE_SPACING: Missing a blank line after declarations
#119: FILE: drivers/gpu/drm/xe/xe_guc.c:589:
+	struct xe_device *xe = guc_to_xe(guc);
+	CLASS(xe_guc_buf, buf)(&guc->buf, OPT_IN_MAX_DWORDS);

total: 0 errors, 1 warnings, 0 checks, 185 lines checked
e9f69bd0d0ec drm/xe/guc: Enable the Dynamic Inhibit Context Switch optimization


