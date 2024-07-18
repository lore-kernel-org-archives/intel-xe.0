Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C47C3DA60
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 13:22:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB8F10E14F;
	Thu, 18 Jul 2024 13:22:38 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A77C10E14F;
 Thu, 18 Jul 2024 13:22:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Unlink_client_d?=
 =?utf-8?q?uring_vm_close?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 18 Jul 2024 13:22:37 -0000
Message-ID: <172130895763.286320.5241719169739699893@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240718131752.3736689-1-tejas.upadhyay@intel.com>
In-Reply-To: <20240718131752.3736689-1-tejas.upadhyay@intel.com>
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

Series: drm/xe: Unlink client during vm close
URL   : https://patchwork.freedesktop.org/series/136240/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
5ce3e132caaa5b45e5e50201b574a097d130967c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3ba4defab87ca1da48cc2e7f8c388cccd2cddf3a
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Thu Jul 18 18:47:52 2024 +0530

    drm/xe: Unlink client during vm close
    
    We have async call which does not know if client
    unlinked from vm by the time it is accessed. Set
    client unlink early during xe_vm_close() so that
    async API do not touch closed client info.
    
    Also, debugs related to job timeout is not useful
    when its "no process" or client already unlinked.
    
    Fixes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2273
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch d0e3ac45f03af2770c2027a1e9799617e1186e5c drm-intel
3ba4defab87c drm/xe: Unlink client during vm close
-:14: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'Fixes:', use 'Link:' or 'Closes:' instead
#14: 
Fixes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2273

total: 0 errors, 1 warnings, 0 checks, 21 lines checked


