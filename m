Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B0AFD876A
	for <intel-xe@archiver.kernel.org>; Tue, 17 Mar 2026 13:52:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB70A10E650;
	Tue, 17 Mar 2026 13:52:44 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B0710E425;
 Tue, 17 Mar 2026 13:52:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_MEI_interrupt_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Simon Richter" <simon.richter@hogyros.de>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Mar 2026 13:52:43 -0000
Message-ID: <177375556363.366776.12537974077377327916@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260317134741.3420-1-Simon.Richter@hogyros.de>
In-Reply-To: <20260317134741.3420-1-Simon.Richter@hogyros.de>
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

Series: MEI interrupt fixes
URL   : https://patchwork.freedesktop.org/series/163380/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fd49a82015c2a1dd8bbb6d1bebf409c993edf864
Author: Simon Richter <Simon.Richter@hogyros.de>
Date:   Tue Mar 17 22:47:18 2026 +0900

    drm/xe: Use same NUMA node for MEI interrupt
    
    The xe driver does not define an irq domain for the GSC (which would
    automatically allocate the interrupt descriptors on the same NUMA node as
    the interrupt controller), so explicitly specify the same NUMA node that
    the PCI device is attached to.
    
    Signed-off-by: Simon Richter <Simon.Richter@hogyros.de>
+ /mt/dim checkpatch b65472ae36d2a21ac0a1991618db1e9b09b1dcd0 drm-intel
c9f2398034a1 drm/xe: allow request_irq on GSC interrupt
-:15: WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes: <12+ chars of sha1> ("<title line>")' - ie: 'Fixes: 87a4c85d3a3e ("drm/xe/gsc: add gsc device support")'
#15: 
Fixes: 87a4c85d3a3ed579c86fd2612715ccb94c4001ff

total: 0 errors, 1 warnings, 0 checks, 7 lines checked
fd49a82015c2 drm/xe: Use same NUMA node for MEI interrupt


