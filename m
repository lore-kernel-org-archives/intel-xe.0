Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79EB7E9A048
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 12:52:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF8310E328;
	Thu, 19 Feb 2026 12:52:30 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B311510E328;
 Thu, 19 Feb 2026 12:52:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/xe3p=5Flpg=3A_L2_f?=
 =?utf-8?q?lush_optimization_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 19 Feb 2026 12:52:28 -0000
Message-ID: <177150554870.265880.8615700000055883604@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260219113743.1588081-6-tejas.upadhyay@intel.com>
In-Reply-To: <20260219113743.1588081-6-tejas.upadhyay@intel.com>
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

Series: drm/xe/xe3p_lpg: L2 flush optimization (rev3)
URL   : https://patchwork.freedesktop.org/series/158017/
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
commit d18c80b4bdd491bcbeee2f3878bbfc995921d700
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Thu Feb 19 17:07:48 2026 +0530

    drm/xe/xe3p: Skip TD flush
    
    Xe3p has HW ability to do transient display flush so the xe driver can
    enable this HW feature by default and skip the software TD flush.
    
    Bspec: 60002
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch c81e41f7aca96f583296a2a875f0179484b7a81f drm-intel
43ff77d660e4 drm/xe/xe3p_lpg: flush shrinker bo cachelines manually
-:18: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#18: 
flushed after the free (like if Media suddenly turns on and does a full flush)

total: 0 errors, 1 warnings, 0 checks, 45 lines checked
b7a508f18ce4 drm/xe/pat: define coh_mode 2way
d59db0f17e1a drm/xe/xe3p_lpg: Enable L2 flush optimization feature
d18c80b4bdd4 drm/xe/xe3p: Skip TD flush


