Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04174C5B543
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 08:24:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B739C10E49A;
	Tue, 10 Jun 2025 08:24:27 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB14010E49A;
 Tue, 10 Jun 2025 08:24:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/dsb=3A_Disable_G?=
 =?utf-8?q?OSUB_interrupt?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Jun 2025 08:24:25 -0000
Message-ID: <174954386582.62603.12178065628138236174@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250610074846.2954601-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20250610074846.2954601-1-chaitanya.kumar.borah@intel.com>
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

Series: drm/i915/dsb: Disable GOSUB interrupt
URL   : https://patchwork.freedesktop.org/series/150021/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d3baeac13ed8912bc1f2810af73b2cdb4e2ab086
Author: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Date:   Tue Jun 10 13:18:46 2025 +0530

    drm/i915/dsb: Disable GOSUB interrupt
    
    DSB engine generates spurious interrupts if any dword starting with 0x0c
    is part of the indexed write command within a GOSUB buffer. This renders
    the GOSUB interrupt unusable. Hence, disable it for now without removing
    the infrastructure in case we can use it in future.
    
    Fixes: 78f237a6a61b ("drm/i915/dsb: Add support for GOSUB interrupt")
    Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
+ /mt/dim checkpatch 52ecbb6a68785860c776b29f58792d9807243979 drm-intel
d3baeac13ed8 drm/i915/dsb: Disable GOSUB interrupt


