Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE09D1A431
	for <intel-xe@archiver.kernel.org>; Sat, 12 Oct 2024 04:22:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A09010E2F7;
	Sat, 12 Oct 2024 04:22:38 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18BFE10E2F7;
 Sat, 12 Oct 2024 04:22:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Log_unreliable_?=
 =?utf-8?q?MMIO_reads_during_forcewake?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 12 Oct 2024 04:22:37 -0000
Message-ID: <172870695709.1243152.9834755721617896112@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241012033445.1090373-1-shuicheng.lin@intel.com>
In-Reply-To: <20241012033445.1090373-1-shuicheng.lin@intel.com>
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

Series: drm/xe: Log unreliable MMIO reads during forcewake
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
commit efb1cc35a6da6df16053ddf22a602891a1f488a9
Author: Shuicheng Lin <shuicheng.lin@intel.com>
Date:   Sat Oct 12 03:34:45 2024 +0000

    drm/xe: Log unreliable MMIO reads during forcewake
    
    In some cases, when the driver attempts to read an MMIO register,
    the hardware may return 0xFFFFFFFF. The current force wake path
    code treats this as a valid response, as it only checks the BIT.
    However, 0xFFFFFFFF should be considered an invalid value, indicating
    a potential issue. To address this, we should add a log entry to
    highlight this condition.
    
    Suggested-by: Alex Zuo <alex.zuo@intel.com>
    Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
+ /mt/dim checkpatch 8dcf653f89accb0339e9dbbd84227a4527b2441d drm-intel
efb1cc35a6da drm/xe: Log unreliable MMIO reads during forcewake


