Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9C5C02180
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jan 2025 21:27:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14FFE10E7D5;
	Mon, 13 Jan 2025 21:27:29 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A32F10E7D5;
 Mon, 13 Jan 2025 21:27:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/dmc=5Fwl=3A_Trac?=
 =?utf-8?q?k_pipe_interrupt_registers_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 13 Jan 2025 21:27:28 -0000
Message-ID: <173680364803.3360825.8382858422543964659@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250113204306.112266-1-gustavo.sousa@intel.com>
In-Reply-To: <20250113204306.112266-1-gustavo.sousa@intel.com>
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

Series: drm/i915/dmc_wl: Track pipe interrupt registers (rev2)
URL   : https://patchwork.freedesktop.org/series/143103/
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
commit 925178566ee7d6d26138b59b041256fec1666271
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Mon Jan 13 17:38:58 2025 -0300

    drm/i915/dmc_wl: Track pipe interrupt registers
    
    Pipe interrupt registers live in their respective pipes' power wells,
    which are below PG0. That means that they must also be tracked as
    registers that are powered-off during dynamic DC states.
    
    There are probably more ranges that we need to track down and add to the
    powered_off_ranges. However, let's make this change only about pipe
    interrupt registers to fix some vblank timeouts observed due to the DMC
    wakelock not being taken for those registers.
    
    In the future, we might want to replace powered_off_ranges with a new
    table to represent registers in PG0, which should be probably easier to
    maintain. Any register not belonging to that table should be considered
    powered off during dynamic DC states and, as such, requiring the DMC
    wakelock for access.
    
    Bspec: 72519, 71583
    Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch 20058aae3e619821197cd32b736893f1d7917ba3 drm-intel
e35f918a4385 drm/i915/display: Use display MMIO functions in intel_display_irq.c
d2a9f6e25991 drm/i915/display: Wrap IRQ-specific uncore functions
925178566ee7 drm/i915/dmc_wl: Track pipe interrupt registers


