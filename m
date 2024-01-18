Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC67C47DAF
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jan 2024 20:02:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4BA410E902;
	Thu, 18 Jan 2024 20:02:24 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 872DA10E902;
 Thu, 18 Jan 2024 20:02:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_GuC_CT_tweaks_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Thu, 18 Jan 2024 20:02:23 -0000
Message-ID: <170560814355.558567.5852699633374405143@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240118192442.1480073-1-matthew.brost@intel.com>
In-Reply-To: <20240118192442.1480073-1-matthew.brost@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: GuC CT tweaks (rev3)
URL   : https://patchwork.freedesktop.org/series/128062/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e7f730565356938dd6c63cd498218fdc5d6a22b0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 41577d4d4042f252a54a5ccd6592653c8bd281dd
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Jan 18 11:24:42 2024 -0800

    drm/xe/guc: Flush G2H handler when turning off CTs
    
    Make sure G2H handler is not running when changing the CT state to drop
    messages or disabled. This will help prevent races in the code ensuring
    that G2H are not being processed after changing the state.
    
    v2:
    - s/flush_g2h_handler/stop_g2h_handler (Michal)
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 776dc1588b4b329dba41ded2db883fbc1bf77950 drm-intel
99879247e drm/xe/guc: Add more GuC CT states
adf4d04ef drm/xe: Move TLB invalidation reset before HW reset
41577d4d4 drm/xe/guc: Flush G2H handler when turning off CTs


