Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AEA7CCFA0D
	for <intel-xe@archiver.kernel.org>; Wed,  5 Nov 2025 15:50:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C88710E2DC;
	Wed,  5 Nov 2025 15:50:06 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A5710E2AC;
 Wed,  5 Nov 2025 15:50:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_allow_request?=
 =?utf-8?q?=5Firq_on_GSC_interrupt?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Simon Richter" <simon.richter@hogyros.de>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Nov 2025 15:50:05 -0000
Message-ID: <176235780529.20673.12652137861220383988@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251105141220.2674-1-Simon.Richter@hogyros.de>
In-Reply-To: <20251105141220.2674-1-Simon.Richter@hogyros.de>
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

Series: drm/xe: allow request_irq on GSC interrupt
URL   : https://patchwork.freedesktop.org/series/157074/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d9120d4d84745cf011b4b3efb338747e69179dfb
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1437cf41909d19a6db266023c92b6c3a4da41a25
Author: Simon Richter <Simon.Richter@hogyros.de>
Date:   Wed Nov 5 23:12:04 2025 +0900

    drm/xe: allow request_irq on GSC interrupt
    
    The default flags for freshly allocated interrupts are platform dependent,
    and apparently powerpc and arm set IRQ_NOREQUEST by default, and resets it
    once setup is complete.
    
    Most do this in the IRQ domain's "map" function. The xe driver does not
    define a domain, so clear the NOREQUEST and NOAUTOEN flags as part of the
    initialization. Also set NOPROBE -- it is doubtful this will ever be
    relevant, but it seems correct for what is effectively a softirq.
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6468
    Fixes: 87a4c85d3a3ed579c86fd2612715ccb94c4001ff
    Cc: <stable@vger.kernel.org> # v6.7+
    Signed-off-by: Simon Richter <Simon.Richter@hogyros.de>
+ /mt/dim checkpatch 695cfd228beb5b8816553e7002a2d61d381327a8 drm-intel
1437cf41909d drm/xe: allow request_irq on GSC interrupt
-:16: WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes: <12+ chars of sha1> ("<title line>")' - ie: 'Fixes: 87a4c85d3a3e ("drm/xe/gsc: add gsc device support")'
#16: 
Fixes: 87a4c85d3a3ed579c86fd2612715ccb94c4001ff

total: 0 errors, 1 warnings, 0 checks, 7 lines checked


