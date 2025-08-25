Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C351CA0EFA
	for <intel-xe@archiver.kernel.org>; Mon, 25 Aug 2025 12:07:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD86E10E255;
	Mon, 25 Aug 2025 12:07:52 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C3010E255;
 Mon, 25 Aug 2025 12:07:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/gt=3A_Introduce_ru?=
 =?utf-8?q?ntime_suspend/resume_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 25 Aug 2025 12:07:51 -0000
Message-ID: <175612367140.265707.1358528393489840756@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250825112025.1766637-1-raag.jadav@intel.com>
In-Reply-To: <20250825112025.1766637-1-raag.jadav@intel.com>
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

Series: drm/xe/gt: Introduce runtime suspend/resume (rev2)
URL   : https://patchwork.freedesktop.org/series/153132/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
553439844b6500767ce8aef522cfe9fbb7ece541
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit bd6cf18008af2fc894fd4c7d42c5f901636c603a
Author: Raag Jadav <raag.jadav@intel.com>
Date:   Mon Aug 25 16:50:25 2025 +0530

    drm/xe/gt: Introduce runtime suspend/resume
    
    If power state is retained between suspend/resume cycle, we don't have
    to perform full gt re-initialization. Introduce runtime helpers for gt
    which greatly reduce suspend/resume delay.
    
    v2: Drop redundant xe_gt_sanitize() and xe_guc_ct_stop() (Daniele)
        Use runtime naming for guc helpers (Daniele)
        s/xe_guc_ct_enable/xe_guc_ct_register (Daniele)
    
    Originally-by: Riana Tauro <riana.tauro@intel.com>
    Signed-off-by: Raag Jadav <raag.jadav@intel.com>
+ /mt/dim checkpatch 5481954bd63bd4d34a5acb2b89fb2caf55bb0695 drm-intel
bd6cf18008af drm/xe/gt: Introduce runtime suspend/resume
-:14: WARNING:BAD_SIGN_OFF: Non-standard signature: Originally-by:
#14: 
Originally-by: Riana Tauro <riana.tauro@intel.com>

total: 0 errors, 1 warnings, 0 checks, 208 lines checked


