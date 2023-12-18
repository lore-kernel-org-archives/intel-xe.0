Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE12C35274
	for <intel-xe@archiver.kernel.org>; Mon, 18 Dec 2023 18:04:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B88A10E08A;
	Mon, 18 Dec 2023 18:04:02 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6AA7410E08A;
 Mon, 18 Dec 2023 18:04:00 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 67430AADD6;
 Mon, 18 Dec 2023 18:04:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/guc=3A_Use_FAST=5F?=
 =?utf-8?q?REQUEST_for_non-blocking_H2G_messages_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Date: Mon, 18 Dec 2023 18:04:00 -0000
Message-ID: <170292264042.12106.13972340700505520409@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231206211441.3092072-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20231206211441.3092072-1-daniele.ceraolospurio@intel.com>
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

Series: drm/xe/guc: Use FAST_REQUEST for non-blocking H2G messages (rev4)
URL   : https://patchwork.freedesktop.org/series/126495/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 78da78fb026673367c3340c31f582d33af98765e
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Wed Dec 6 13:14:41 2023 -0800

    drm/xe/guc: Use FAST_REQUEST for non-blocking H2G messages
    
    We're currently sending non-blocking H2G messages using the EVENT type,
    which suppresses all CTB protocol replies from the GuC, including the
    failure cases. This might cause errors to slip through and manifest as
    unexpected behavior (e.g. a context state might not be what the driver
    thinks it is because the state change command was silently rejected by
    the GuC). To avoid this kind of problems, we can use the FAST_REQUEST
    type instead, which suppresses the reply only on success; this way we
    still get the advantage of not having to wait for an ack from the GuC
    (i.e. the H2G is still non-blocking) while still detecting errors.
    Since we can't escalate to the caller when a non-blocking message
    fails, we need to escalate to GT reset instead.
    
    Note that FAST_REQUEST failures are NOT expected and are usually a sign
    that the H2G was either malformed or requested an illegal operation.
    
    v2: assign fence values to FAST_REQUEST messages, fix abi doc, use xe_gt
    printers (Michal).
    
    v3: fix doc alignment, fix and improve prints (Michal)
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v2
    Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 16f9e14e9101e3250294fc3ccb0acb35cd75532d drm-intel
78da78fb0 drm/xe/guc: Use FAST_REQUEST for non-blocking H2G messages


