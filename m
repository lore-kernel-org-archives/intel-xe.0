Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9589D3C526
	for <intel-xe@archiver.kernel.org>; Thu, 17 Oct 2024 17:31:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A776A10E0CC;
	Thu, 17 Oct 2024 17:31:52 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34BEE10E0CC;
 Thu, 17 Oct 2024 17:31:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Log_unreliable_?=
 =?utf-8?q?MMIO_reads_during_forcewake_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 17 Oct 2024 17:31:51 -0000
Message-ID: <172918631121.1280070.18238924737942290790@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241017034026.1525693-1-shuicheng.lin@intel.com>
In-Reply-To: <20241017034026.1525693-1-shuicheng.lin@intel.com>
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

Series: drm/xe: Log unreliable MMIO reads during forcewake (rev3)
URL   : https://patchwork.freedesktop.org/series/139922/
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
commit 7cc21014a25835ba064858832595c1aab04ce097
Author: Shuicheng Lin <shuicheng.lin@intel.com>
Date:   Thu Oct 17 16:30:38 2024 +0000

    drm/xe: Handle unreliable MMIO reads during forcewake
    
    In some cases, when the driver attempts to read an MMIO register,
    the hardware may return 0xFFFFFFFF. The current force wake path
    code treats this as a valid response, as it only checks the BIT.
    However, 0xFFFFFFFF should be considered an invalid value, indicating
    a potential issue. To address this, we should add a log entry to
    highlight this condition and return failure.
    The force wake failure log level is changed from notice to err
    to match the failure return value.
    
    v2 (Matt Brost):
      - set ret value (-EIO) to kick the error to upper layers
    v3 (Rodrigo):
      - add commit message for the log level promotion from notice to err
    
    Suggested-by: Alex Zuo <alex.zuo@intel.com>
    Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 86151967bacde225a6052197245126a6264963f0 drm-intel
7cc21014a258 drm/xe: Handle unreliable MMIO reads during forcewake


