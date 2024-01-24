Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784FFC47422
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jan 2024 07:54:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 432FC10F676;
	Wed, 24 Jan 2024 07:54:53 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB04110F652;
 Wed, 24 Jan 2024 07:54:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/irq=3A_allocate_al?=
 =?utf-8?q?l_possible_msix_interrupts_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dani Liberman" <dliberman@habana.ai>
Date: Wed, 24 Jan 2024 07:54:51 -0000
Message-ID: <170608289189.685200.7438219755393600742@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240124075058.2302235-1-dliberman@habana.ai>
In-Reply-To: <20240124075058.2302235-1-dliberman@habana.ai>
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

Series: drm/xe/irq: allocate all possible msix interrupts (rev5)
URL   : https://patchwork.freedesktop.org/series/128832/
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
commit 902eb3637a2dbcef4ab83d9b40ff2980d4c5458a
Author: Dani Liberman <dliberman@habana.ai>
Date:   Wed Jan 24 09:50:58 2024 +0200

    drm/xe/irq: allocate all possible msix interrupts
    
    If platform supports MSIX, driver needs to allocate all possible
    interrupts.
    
    v2:
      - drop msix_cap and use the api return code instead.
      - fix commit message.
    
    v3:
      - pass specific type in irq flags.
    
    Cc: Ohad Sharabi <osharabi@habana.ai>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Dani Liberman <dliberman@habana.ai>
+ /mt/dim checkpatch 0496fe20d8ed5e73ed186d293ef67e7bae4658eb drm-intel
902eb3637 drm/xe/irq: allocate all possible msix interrupts


