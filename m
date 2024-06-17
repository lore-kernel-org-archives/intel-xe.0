Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14BEC2BA15
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 15:52:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E0C310E43F;
	Mon, 17 Jun 2024 15:52:26 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7008710E43F;
 Mon, 17 Jun 2024 15:52:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/vf=3A_Don=27t_touc?=
 =?utf-8?q?h_GuC_irq_registers_if_using_memory_irqs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 17 Jun 2024 15:52:25 -0000
Message-ID: <171863954545.97967.2868975829875378107@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240617154736.685-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240617154736.685-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/vf: Don't touch GuC irq registers if using memory irqs
URL   : https://patchwork.freedesktop.org/series/134962/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4e845fce9cf872dba9d2ac118a03ffea8324eb8b
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Mon Jun 17 17:47:36 2024 +0200

    drm/xe/vf: Don't touch GuC irq registers if using memory irqs
    
    On platforms where VFs are using memory based interrupts, we
    missed invalid access to no longer existing interrupt registers,
    as we keep them marked with XE_REG_OPTION_VF. To fix that just
    either setup memirq vectors in GuC or enable legacy interrupts.
    
    Fixes: aef4eb7c7dec ("drm/xe/vf: Setup memory based interrupts in GuC")
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 3b4eab7e82c7a1429e257890553ad571f320b8a3 drm-intel
4e845fce9cf8 drm/xe/vf: Don't touch GuC irq registers if using memory irqs


