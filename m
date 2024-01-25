Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B77FC47DDF
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jan 2024 21:59:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 619B810E37A;
	Thu, 25 Jan 2024 21:59:30 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D8910E37A;
 Thu, 25 Jan 2024 21:59:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/gsc=3A_Handle_GSCC?=
 =?utf-8?q?S_ER_interrupt?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Date: Thu, 25 Jan 2024 21:59:29 -0000
Message-ID: <170621996917.727999.8556484413381349566@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240125215543.3990593-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240125215543.3990593-1-daniele.ceraolospurio@intel.com>
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

Series: drm/xe/gsc: Handle GSCCS ER interrupt
URL   : https://patchwork.freedesktop.org/series/129182/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
b2ca823f819193c33ab811dfac08c614138d6d46
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8039aae8b396b4569e8fcfb638298c73f50e2b3a
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Thu Jan 25 13:55:43 2024 -0800

    drm/xe/gsc: Handle GSCCS ER interrupt
    
    Starting on Xe2, the GSCCS engine reset is a 2-step process. When the
    driver or the GuC hit the GDRST register, the CS is immediately reset
    and a success is reported, but the GSC shim keeps resetting in the
    background. While the shim reset is ongoing, the CS is able to accept
    new context submission, but any commands that require the shim will
    be stalled until the reset is completed. This means that we can keep
    submitting to the GSCCS as long as we make sure that the preemption
    timeout is big enough to cover any delay introduced by the reset
    (which it already is).
    When the shim reset completes, a specific CS interrupt is triggered,
    in response to which we need to check the GSCI_TIMER_STATUS register
    to see if the reset was successful or not.
    Note that the GSCI_TIMER_STATUS register is not power save/restored,
    so it gets reset on MC6 entry. However, a reset failure stops MC6,
    so in that scenario we're always guaranteed to find the correct value.
    
    Since we can't check the register within interrupt context, the
    existing GSC worker has been updated to handle it.
    The expected action to take on ER failure is to trigger a driver FLR,
    but we still don't support that, so for now we just print an error. A
    comment has been added to the code to keep track of the FLR requirement.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
+ /mt/dim checkpatch 38a58d4231067e1b548c12ee521b73ffc0ebb73a drm-intel
8039aae8b drm/xe/gsc: Handle GSCCS ER interrupt


