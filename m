Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7217EC982CC
	for <intel-xe@archiver.kernel.org>; Sat, 19 Sep 2026 05:07:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B8B10E0B1;
	Sat, 19 Sep 2026 05:07:39 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52AB510E0B1;
 Sat, 19 Sep 2026 05:07:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Use_SIG=5FID_logs_for_GuC?=
 =?utf-8?q?_component_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 19 Sep 2026 05:07:37 -0000
Message-ID: <178979445733.183949.1749789766630877423@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260919050055.2092579-9-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20260919050055.2092579-9-umesh.nerlige.ramappa@intel.com>
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

Series: Use SIG_ID logs for GuC component (rev4)
URL   : https://patchwork.freedesktop.org/series/173177/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4d3420ca875097fb8a2ece71614f47b550a77390
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Fri Sep 18 22:01:03 2026 -0700

    drm/xe/guc: Report errors that cause a CT shutdown using SIGID
    
    Convert any errors that can cause the CT to be declared as dead to
    use the xe_log_err() helper. Errors that are escalated to the callers
    are left for the caller to report with SIGID if needed.
    While at it, update some of the error messages to make what went wrong
    clearer.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
    Assisted-by: Claude:claude-opus-5
+ /mt/dim checkpatch e56378c725f82208a52da0a3b5eecd67ddcbf750 drm-intel
ce94e807a774 drm/xe/guc: Use different error codes for GuC load errors
6bac70fdf2dc drm/xe/guc: Handle CRASH and EXCEPTION G2H with separate helpers
179abfd368c8 drm/xe/guc: Make ct_dead_capture available on non-debug config
677a51987cf8 drm/xe/guc: Cleanup error codes and handling for CT errors
c8366ff9641c drm/xe/uc: Report DMA failure using SIGID
e6af9baf81c7 drm/xe/guc: Report major GuC failures using SIGID
4d3420ca8750 drm/xe/guc: Report errors that cause a CT shutdown using SIGID
-:151: WARNING:LINE_SPACING: Missing a blank line after declarations
#151: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:1758:
+		int err = -EBADMSG;
+		xe_log_err(gt, GUC, err, "CT: Invalid G2H origin=%u\n", origin);

total: 0 errors, 1 warnings, 0 checks, 163 lines checked


