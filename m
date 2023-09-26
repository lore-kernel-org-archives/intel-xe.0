Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D65E7E63F
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 14:18:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A6610E3EF;
	Tue, 26 Sep 2023 14:18:31 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 00D2510E3EF;
 Tue, 26 Sep 2023 14:18:29 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id F3557AADF4;
 Tue, 26 Sep 2023 14:18:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Date: Tue, 26 Sep 2023 14:18:28 -0000
Message-ID: <169573790899.20980.2805874891738176210@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230926130552.10605-1-gustavo.sousa@intel.com>
In-Reply-To: <20230926130552.10605-1-gustavo.sousa@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe/irq=3A_Clear_GFX=5FMSTR=5FIRQ_as_part_of_IRQ_reset_=28rev3?=
 =?utf-8?q?=29?=
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

Series: drm/xe/irq: Clear GFX_MSTR_IRQ as part of IRQ reset (rev3)
URL   : https://patchwork.freedesktop.org/series/123920/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 24f8e09349b6b57299a51f6558b78b417c44a947
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Tue Sep 26 10:05:52 2023 -0300

    drm/xe/irq: Clear GFX_MSTR_IRQ as part of IRQ reset
    
    Starting with Xe_LP+, GFX_MSTR_IRQ contains status bits that have W1C
    behavior. If we do not properly reset them, we would miss delivery of
    interrupts if a pending bit is set when enabling IRQs.
    
    As an example, the display part of our probe routine contains paths
    where we wait for vblank interrupts. If a display interrupt was already
    pending when enabling IRQs, we would time out waiting for the vblank.
    
    That in fact happened recently when modprobing Xe on a Lunar Lake with a
    specific configuration; and that's how we found out we were missing this
    step in the IRQ enabling logic.
    
    Fix the issue by clearing GFX_MSTR_IRQ as part of the IRQ reset.
    
    v2:
      - Make resetting GFX_MSTR_IRQ be the last step to avoid bit
        re-latching. (Ville)
    v3:
      - Swap nesting order: guard loop with the IP version check instead of
        doing the check at each iteration. (Lucas)
    
    BSpec: 50875, 54028, 62357
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch fc8ec3c56efa5c15b630ddc17c89100440fe03ef drm-intel
24f8e0934 drm/xe/irq: Clear GFX_MSTR_IRQ as part of IRQ reset


