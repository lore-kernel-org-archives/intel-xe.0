Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B18C61CE8
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 09:05:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868F010E1ED;
	Thu, 12 Jun 2025 09:05:16 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B09D810E793;
 Thu, 12 Jun 2025 09:05:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/gmbus=3A_Add_Wa?=
 =?utf-8?q?=5F16025573575_for_PTL_for_bit-bashing?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Jun 2025 09:05:14 -0000
Message-ID: <174971911471.70603.9542486484399901172@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250612075330.837179-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250612075330.837179-1-ankit.k.nautiyal@intel.com>
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

Series: drm/i915/gmbus: Add Wa_16025573575 for PTL for bit-bashing
URL   : https://patchwork.freedesktop.org/series/150136/
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
commit 2c6d3554b21806d9b4be2c403cf1a2d29f98f4b6
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Thu Jun 12 13:23:30 2025 +0530

    drm/i915/gmbus: Add Wa_16025573575 for PTL for bit-bashing
    
    As per Wa_16025573575 for PTL, set the GPIO masks bit before starting
    bit-bashing and maintain value through the bit-bashing sequence.
    After bit-bashing sequence is done, clear the GPIO masks bits.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 75238c32deae15ee4120b42a5be556ec36807a84 drm-intel
2c6d3554b218 drm/i915/gmbus: Add Wa_16025573575 for PTL for bit-bashing


