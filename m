Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A935CEEE26E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 22:30:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 774AF10E08B;
	Thu, 12 Sep 2024 22:30:43 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B3C10E08B;
 Thu, 12 Sep 2024 22:30:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe=3A_Don=27t_try_to_derive_GT_clock_freq_from_display_?=
 =?utf-8?q?register_on_Xe2?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Sep 2024 22:30:42 -0000
Message-ID: <172618024222.994019.3337081267378741343@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240912215559.4070443-3-matthew.d.roper@intel.com>
In-Reply-To: <20240912215559.4070443-3-matthew.d.roper@intel.com>
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

Series: series starting with [1/2] drm/xe: Don't try to derive GT clock freq from display register on Xe2
URL   : https://patchwork.freedesktop.org/series/138611/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 79abc631f77b521a9b970c8d6ca5d1101bbcb798
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Thu Sep 12 14:56:01 2024 -0700

    drm/xe/sriov: Drop TIMESTAMP_OVERRIDE from Xe2 runtime regs
    
    TIMESTAMP_OVERRIDE is never used to initialize the GT clock frequency on
    Xe2 platforms (and the register itself no longer exists on LNL) so drop
    it from the list of runtime registers.
    
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch e55e4cc47de4150012eec3e54b6d710967d66510 drm-intel
178a31aa393a drm/xe: Don't try to derive GT clock freq from display register on Xe2
79abc631f77b drm/xe/sriov: Drop TIMESTAMP_OVERRIDE from Xe2 runtime regs


