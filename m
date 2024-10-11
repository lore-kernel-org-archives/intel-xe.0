Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3B2D0EE19
	for <intel-xe@archiver.kernel.org>; Fri, 11 Oct 2024 18:23:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F2910EBEF;
	Fri, 11 Oct 2024 18:23:47 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D55C710EBEE;
 Fri, 11 Oct 2024 18:23:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/guc=3A_Fix_derefer?=
 =?utf-8?q?ence_before_NULL_check_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Everest K.C." <everestkc@everestkc.com.np>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 11 Oct 2024 18:23:46 -0000
Message-ID: <172867102686.1241696.4318848013110435281@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241009184951.4991-1-everestkc@everestkc.com.np>
In-Reply-To: <20241009184951.4991-1-everestkc@everestkc.com.np>
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

Series: drm/xe/guc: Fix dereference before NULL check (rev4)
URL   : https://patchwork.freedesktop.org/series/139890/
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
commit 0214fae2444baeaaa19821141b0b1451c05a31bc
Author: Everest K.C. <everestkc@everestkc.com.np>
Date:   Wed Oct 9 12:49:49 2024 -0600

    drm/xe/guc: Fix dereference before Null check
    
    The pointer list->list was derefrenced before the Null check
    resulting in possibility of Null pointer derefrencing.
    This patch moves the Null check outside the for loop, so that
    the check is performed before the derefrencing.
    
    This issue was reported by Coverity Scan.
    
    Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
+ /mt/dim checkpatch d2577be8b969257afb5f76964afc16ae4f6f7c07 drm-intel
0214fae2444b drm/xe/guc: Fix dereference before Null check


