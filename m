Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E515FC6171
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 19:04:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E75610ED78;
	Fri, 13 Sep 2024 19:04:04 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC1410ED78;
 Fri, 13 Sep 2024 19:04:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5Bv?=
 =?utf-8?q?2=2C1/3=5D_drm/xe=3A_Move_display_reference_timestamp_readout_to_?=
 =?utf-8?q?display/?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Sep 2024 19:04:02 -0000
Message-ID: <172625424210.997972.7603268132032204934@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240913162910.4145142-4-matthew.d.roper@intel.com>
In-Reply-To: <20240913162910.4145142-4-matthew.d.roper@intel.com>
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

Series: series starting with [v2,1/3] drm/xe: Move display reference timestamp readout to display/
URL   : https://patchwork.freedesktop.org/series/138660/
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
commit a22f28c21b25c18a9ea0a57c0afa8280cf666674
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Fri Sep 13 09:29:13 2024 -0700

    drm/xe/sriov: Drop TIMESTAMP_OVERRIDE from Xe2 runtime regs
    
    TIMESTAMP_OVERRIDE is never used to initialize the GT clock frequency on
    Xe2 platforms (and the register itself no longer exists on LNL) so drop
    it from the list of runtime registers.
    
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
    Acked-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 8839c645d7a7d76cbee6f4807984dbd6c77eb543 drm-intel
57f00a84e94c drm/xe: Move display reference timestamp readout to display/
df1e49339e06 drm/xe: Don't try to derive GT clock freq from display register on Xe2
a22f28c21b25 drm/xe/sriov: Drop TIMESTAMP_OVERRIDE from Xe2 runtime regs


