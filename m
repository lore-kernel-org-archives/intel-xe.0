Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF5EC35FFC
	for <intel-xe@archiver.kernel.org>; Tue, 25 Mar 2025 06:51:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F03910E383;
	Tue, 25 Mar 2025 06:51:26 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32FA910E383;
 Tue, 25 Mar 2025 06:51:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/display=3A_Read_?=
 =?utf-8?q?panel_replay_source_status_through_PSR2_status_register?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Mar 2025 06:51:25 -0000
Message-ID: <174288548519.76357.11158841249297129459@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250324100823.3111564-1-animesh.manna@intel.com>
In-Reply-To: <20250324100823.3111564-1-animesh.manna@intel.com>
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

Series: drm/i915/display: Read panel replay source status through PSR2 status register
URL   : https://patchwork.freedesktop.org/series/146656/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a57ec7ba68277d7a66c38cca2cb35e508c271d60
Author: Animesh Manna <animesh.manna@intel.com>
Date:   Mon Mar 24 15:38:23 2025 +0530

    drm/i915/display: Read panel replay source status through PSR2 status register
    
    PTL onwards get panel replay status from PSR2 status register
    instead of SRD status.
    
    Signed-off-by: Animesh Manna <animesh.manna@intel.com>
    Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch 9a42bdcde0f77b2c1e947e283cc3b267b1ce2056 drm-intel
a57ec7ba6827 drm/i915/display: Read panel replay source status through PSR2 status register


