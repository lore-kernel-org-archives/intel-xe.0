Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E46C25B74
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 20:39:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84AC01134F5;
	Thu, 30 May 2024 20:39:34 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D2D1133B4;
 Thu, 30 May 2024 20:39:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Fix_NULL_ptr_de?=
 =?utf-8?q?reference_in_devcoredump?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 May 2024 20:39:32 -0000
Message-ID: <171710157201.2239797.12330046801616007392@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240530203341.1795181-1-matthew.brost@intel.com>
In-Reply-To: <20240530203341.1795181-1-matthew.brost@intel.com>
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

Series: drm/xe: Fix NULL ptr dereference in devcoredump
URL   : https://patchwork.freedesktop.org/series/134265/
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
commit 7f393183d46e97d23e4c180d3f9197b3b7b28e85
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu May 30 13:33:41 2024 -0700

    drm/xe: Fix NULL ptr dereference in devcoredump
    
    Kernel VM do not have an Xe file. Include a check for Xe file in the VM
    before trying to get pid from VM's Xe file when taking a devcoredump.
    
    Fixes: b10d0c5e9df7 ("drm/xe: Add process name to devcoredump")
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: José Roberto de Souza <jose.souza@intel.com>
    Cc: stable@vger.kernel.org
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 8a03c116f647be54b169f3f5552341488e2df12b drm-intel
7f393183d46e drm/xe: Fix NULL ptr dereference in devcoredump


