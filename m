Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBAC7C47DA2
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 14:22:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DE0C10E5BE;
	Tue, 16 Jan 2024 14:22:27 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C24910E5B6;
 Tue, 16 Jan 2024 14:22:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/irq=3A_allocate_al?=
 =?utf-8?q?l_possible_msix_interrupts?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dani Liberman" <dliberman@habana.ai>
Date: Tue, 16 Jan 2024 14:22:26 -0000
Message-ID: <170541494657.502240.116092494521846107@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240116130736.1678104-1-dliberman@habana.ai>
In-Reply-To: <20240116130736.1678104-1-dliberman@habana.ai>
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

Series: drm/xe/irq: allocate all possible msix interrupts
URL   : https://patchwork.freedesktop.org/series/128832/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
faa12d3432d7ef7793d934cd9338c555e95a5aad
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2a7763aa94514b5afe5f9ada3086206609781091
Author: Dani Liberman <dliberman@habana.ai>
Date:   Tue Jan 16 15:07:36 2024 +0200

    drm/xe/irq: allocate all possible msix interrupts
    
    For future platforms which will support msix, need to allocate all
    possible interrupts.
    
    Signed-off-by: Dani Liberman <dliberman@habana.ai>
    Cc: Ohad Sharabi <osharabi@habana.ai>
    Signed-off-by: Dani Liberman <dliberman@habana.ai><mailto:dliberman@habana.ai>
    Reviewed-by: Ohad Sharabi <osharabi@<mailto:gustavo.sousa@intel.com>habana.ai>
+ /mt/dim checkpatch c4796d784fcc0a8b72cd8fdc8c3f6f9bc2552242 drm-intel
2a7763aa9 drm/xe/irq: allocate all possible msix interrupts


