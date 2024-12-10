Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B29E77180
	for <intel-xe@archiver.kernel.org>; Tue, 10 Dec 2024 21:29:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E1E510E0A3;
	Tue, 10 Dec 2024 21:29:04 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2C4110E0A3;
 Tue, 10 Dec 2024 21:29:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Make_irq_enable?=
 =?utf-8?q?d_flag_atomic?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Levi, Ilia" <ilia.levi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Dec 2024 21:29:02 -0000
Message-ID: <173386614285.972787.1664418315736793127@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241210173506.202150-1-ilia.levi@intel.com>
In-Reply-To: <20241210173506.202150-1-ilia.levi@intel.com>
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

Series: drm/xe: Make irq enabled flag atomic
URL   : https://patchwork.freedesktop.org/series/142367/
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
commit 5d20116d385243850b5a41f35bfeb5850d00e67c
Author: Ilia Levi <ilia.levi@intel.com>
Date:   Tue Dec 10 19:35:06 2024 +0200

    drm/xe: Make irq enabled flag atomic
    
    The irq.enabled flag was protected by a spin lock (irq.lock).
    By making it atomic we no longer need to wait for the spin lock in
    irq handlers. This will become especially useful for MSI-X irq
    handlers to prevent lock contention between different interrupts.
    
    Signed-off-by: Ilia Levi <ilia.levi@intel.com>
+ /mt/dim checkpatch 2223c2c738ecb056c0a77e115334887da66668c8 drm-intel
5d20116d3852 drm/xe: Make irq enabled flag atomic


