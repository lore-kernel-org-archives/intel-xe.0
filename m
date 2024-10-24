Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689F9CE8E8B
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 15:30:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F1CD10E972;
	Thu, 24 Oct 2024 15:30:19 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4BAD10E969;
 Thu, 24 Oct 2024 15:30:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_PF=3A_Add_support_for_VF_?=
 =?utf-8?q?scheduling_priority?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Oct 2024 15:30:17 -0000
Message-ID: <172978381773.1328167.16401304275719231294@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241023231152.1815-1-michal.wajdeczko@intel.com>
In-Reply-To: <20241023231152.1815-1-michal.wajdeczko@intel.com>
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

Series: PF: Add support for VF scheduling priority
URL   : https://patchwork.freedesktop.org/series/140401/
State : success

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
commit b4176057ba8649ed10a2aa760e9062f533738cd9
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Thu Oct 24 01:11:52 2024 +0200

    drm/xe/pf: Adjust scheduling priority based on policy change
    
    Local values of scheduling priorities need to be adjusted when
    changing the schedule_if_idle policy as those are related.
    
    Disabling schedule_if_idle policy forces the low priority, and
    enabling schedule_if_idle policy forces the normal priority.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 121cd95da591284c97d6f9ac1c58c7a79d27b201 drm-intel
7646a661383d drm/xe/guc: Add VF_CFG_SCHED_PRIORITY_KEY KLV definition
741eacad4bbc drm/xe/guc: Add VF_CFG_SCHED_PRIORITY to KLV helper
3c20533ba44b drm/xe/pf: Add functions to configure VF scheduling priority
aea65ce2be00 drm/xe/pf: Allow to control scheduling priority using debugfs
b4176057ba86 drm/xe/pf: Adjust scheduling priority based on policy change


