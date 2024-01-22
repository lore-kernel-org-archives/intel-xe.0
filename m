Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0AFC4725D
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 09:00:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84FFC10EBCE;
	Mon, 22 Jan 2024 09:00:24 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10FFF10EBCD;
 Mon, 22 Jan 2024 09:00:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/irq=3A_allocate_al?=
 =?utf-8?q?l_possible_msix_interrupts_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dani Liberman" <dliberman@habana.ai>
Date: Mon, 22 Jan 2024 09:00:24 -0000
Message-ID: <170591402407.646097.1243662096884989547@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240121090214.2072923-1-dliberman@habana.ai>
In-Reply-To: <20240121090214.2072923-1-dliberman@habana.ai>
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

Series: drm/xe/irq: allocate all possible msix interrupts (rev3)
URL   : https://patchwork.freedesktop.org/series/128832/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e7f730565356938dd6c63cd498218fdc5d6a22b0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 69285bee46913c38f957add4fc704c59fc7c00b3
Author: Dani Liberman <dliberman@habana.ai>
Date:   Sun Jan 21 11:02:14 2024 +0200

    drm/xe/irq: allocate all possible msix interrupts
    
    If platform supports MSIX, driver needs to allocate all possible
    interrupts.
    
    v2:
      - drop msix_cap and use the api return code instead.
      - fix commit message.
    
    Cc: Ohad Sharabi <osharabi@habana.ai>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Dani Liberman <dliberman@habana.ai>
+ /mt/dim checkpatch cf77aca631655da119d860e2528d266a05ca87d2 drm-intel
69285bee4 drm/xe/irq: allocate all possible msix interrupts


