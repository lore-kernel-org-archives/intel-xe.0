Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5CEEE49AF
	for <intel-xe@archiver.kernel.org>; Wed, 23 Aug 2023 00:35:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B038210E0C7;
	Wed, 23 Aug 2023 00:35:43 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2D0B610E0C7;
 Wed, 23 Aug 2023 00:35:41 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 29014AADDA;
 Wed, 23 Aug 2023 00:35:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Wed, 23 Aug 2023 00:35:41 -0000
Message-ID: <169275094116.16626.10479905370818884407@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230823003312.1356779-3-matthew.d.roper@intel.com>
In-Reply-To: <20230823003312.1356779-3-matthew.d.roper@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_se?=
 =?utf-8?q?ries_starting_with_=5Bv2=2C1/2=5D_drm/xe=3A_Avoid_64-bit_regist?=
 =?utf-8?q?er_reads?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: series starting with [v2,1/2] drm/xe: Avoid 64-bit register reads
URL   : https://patchwork.freedesktop.org/series/122770/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e700ea2f248a75138759bcb443affeef4a2d1991
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 11f455e6b511955454d17d6fb4005117ddcd6e55
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Tue Aug 22 17:33:14 2023 -0700

    drm/xe: Drop xe_mmio_write64()
    
    The only possible 64-bit register writes in the driver come from the
    highly questionable MMIO ioctl.  That ioctl's register write support
    only operates for userspace running as root and cannot be used by any
    real userspace; it exists solely to support the "xe_reg" debug tool in
    IGT.  Since the spec indicates that hardware does not officially support
    64-bit register accesses, there's no reason to allow such 64-bit writes,
    even for debugging.
    
    Bspec: 60027
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch 3a964d06598874329aab6f8db7fd52840135d568 drm-intel
/mt/dim: line 50: /root/.dimrc: No such file or directory


