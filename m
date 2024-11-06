Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE457D44D7F
	for <intel-xe@archiver.kernel.org>; Wed,  6 Nov 2024 15:18:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D5FB10E2EC;
	Wed,  6 Nov 2024 15:18:35 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C9C10E715;
 Wed,  6 Nov 2024 15:18:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_PF=3A_Add_support_fo?=
 =?utf-8?q?r_VF_scheduling_priority_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 06 Nov 2024 15:18:33 -0000
Message-ID: <173090631349.1417154.11012949255038053652@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241106151301.2079-1-michal.wajdeczko@intel.com>
In-Reply-To: <20241106151301.2079-1-michal.wajdeczko@intel.com>
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

Series: PF: Add support for VF scheduling priority (rev2)
URL   : https://patchwork.freedesktop.org/series/140401/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: e663a17feb61 drm-tip: 2024y-11m-06d-14h-55m-17s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/guc: Add VF_CFG_SCHED_PRIORITY_KEY KLV definition
Applying: drm/xe/guc: Add VF_CFG_SCHED_PRIORITY to KLV helper
Applying: drm/xe/pf: Add functions to configure VF scheduling priority
Applying: drm/xe/pf: Allow to control scheduling priority using debugfs
Applying: drm/xe/pf: Adjust scheduling priority based on policy change


