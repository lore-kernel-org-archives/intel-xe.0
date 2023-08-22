Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD118EE49A4
	for <intel-xe@archiver.kernel.org>; Tue, 22 Aug 2023 13:15:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E4010E352;
	Tue, 22 Aug 2023 13:15:47 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3E38210E352;
 Tue, 22 Aug 2023 13:15:45 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 3B536AADDA;
 Tue, 22 Aug 2023 13:15:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Tue, 22 Aug 2023 13:15:45 -0000
Message-ID: <169271014524.20551.17182621351611105644@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230821234322.758689-3-matthew.d.roper@intel.com>
In-Reply-To: <20230821234322.758689-3-matthew.d.roper@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_se?=
 =?utf-8?q?ries_starting_with_=5B1/2=5D_drm/xe=3A_Avoid_64-bit_register_re?=
 =?utf-8?q?ads?=
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

Series: series starting with [1/2] drm/xe: Avoid 64-bit register reads
URL   : https://patchwork.freedesktop.org/series/122720/
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
commit b2b7c60ff8087c984f9bb8a212175cf88b688dad
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Mon Aug 21 16:43:24 2023 -0700

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
+ /mt/dim checkpatch 779f35314dba1441d29f4cfd510e7beb73c5f615 drm-intel
/mt/dim: line 50: /root/.dimrc: No such file or directory


