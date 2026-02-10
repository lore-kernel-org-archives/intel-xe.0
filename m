Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6ECAEA8114
	for <intel-xe@archiver.kernel.org>; Tue, 10 Feb 2026 13:35:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FDB610E57C;
	Tue, 10 Feb 2026 13:35:37 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF89D10E57C;
 Tue, 10 Feb 2026 13:35:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/xe3p=5Flpg=3A_L2_f?=
 =?utf-8?q?lush_optimization_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Feb 2026 13:35:36 -0000
Message-ID: <177073053696.241778.13299746360249200737@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260210125120.1329411-5-tejas.upadhyay@intel.com>
In-Reply-To: <20260210125120.1329411-5-tejas.upadhyay@intel.com>
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

Series: drm/xe/xe3p_lpg: L2 flush optimization (rev2)
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
commit 54bee95a5083fe306a558b2fd1af3734f10fe426
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Tue Feb 10 18:21:24 2026 +0530

    drm/xe/xe3p: Skip TD flush
    
    Xe3p has HW ability to do transient display flush so the xe driver can
    enable this HW feature by default and skip the software TD flush.
    
    Bspec: 60002
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch 5f16c3d1100e59f2fbaeb2724039cc3a948574bb drm-intel
2739d651d6cd drm/xe/xe3p_lpg: flush userptr/shrinker bo cachelines manually
-:10: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#10: 
"eXtended Architecture" (XA) tagged memory—memory shared between the CPU and GPU

total: 0 errors, 1 warnings, 0 checks, 54 lines checked
46aaf0b7eaea drm/xe/xe3p_lpg: Enable L2 flush optimization feature
54bee95a5083 drm/xe/xe3p: Skip TD flush


