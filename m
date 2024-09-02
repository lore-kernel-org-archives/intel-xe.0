Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07099CD13CF
	for <intel-xe@archiver.kernel.org>; Mon,  2 Sep 2024 14:17:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEAE310E313;
	Mon,  2 Sep 2024 14:17:03 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A2CB10E30B;
 Mon,  2 Sep 2024 14:17:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_memirq_infra_changes_=28r?=
 =?utf-8?q?ev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ilia Levi" <ilia.levi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Sep 2024 14:17:02 -0000
Message-ID: <172528662249.906827.1419835392053170044@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240902140826.2526259-1-ilia.levi@intel.com>
In-Reply-To: <20240902140826.2526259-1-ilia.levi@intel.com>
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

Series: memirq infra changes (rev4)
URL   : https://patchwork.freedesktop.org/series/137643/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 646cb0e6d39fd7eace22fad9e1525f1ca854c322
Author: Ilia Levi <ilia.levi@intel.com>
Date:   Mon Sep 2 17:08:26 2024 +0300

    drm/xe: memirq handler changes
    
    This patch exposes an interrupt processing handler for a single hw engine.
    This handler also caters for the MSI-X mode, where the hardware engines
    report interrupt source and status to the offset of engine instance zero.
    Refactored code to use this handler from the VF use-case as well.
    
    Signed-off-by: Ilia Levi <ilia.levi@intel.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
+ /mt/dim checkpatch d5b1bfdcb803eb5b8b572a2fed8a9134993b47e5 drm-intel
a2aebe799d13 drm/xe: MSI-X support placeholder
5f2c9f7e0a38 drm/xe: move memirq out of VF
9e820bcc7c05 drm/xe: memirq infra changes for MSI-X
646cb0e6d39f drm/xe: memirq handler changes


