Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B319DFC6181
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 21:08:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C8310EDAE;
	Fri, 13 Sep 2024 21:08:01 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A410A10EDAC;
 Fri, 13 Sep 2024 21:08:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_use_devm=5Fadd?=
 =?utf-8?q?=5Faction=5For=5Freset=28=29_helper?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "HeLuang" <helugang@uniontech.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Sep 2024 21:08:00 -0000
Message-ID: <172626168066.998388.9360299039448863072@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <9631BC17D1E028A2+20240911102215.84865-1-helugang@uniontech.com>
In-Reply-To: <9631BC17D1E028A2+20240911102215.84865-1-helugang@uniontech.com>
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

Series: drm/xe: use devm_add_action_or_reset() helper
URL   : https://patchwork.freedesktop.org/series/138672/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c2789f566b70ebee810855a5c3e4be70922f1ede
Author: He Lugang <helugang@uniontech.com>
Date:   Wed Sep 11 18:22:15 2024 +0800

    drm/xe: use devm_add_action_or_reset() helper
    
    Use devm_add_action_or_reset() to release resources in case of failure,
    because the cleanup function will be automatically called.
    
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: He Lugang <helugang@uniontech.com>
+ /mt/dim checkpatch 2530827ab017894f2339dd308356366d6e87a72d drm-intel
c2789f566b70 drm/xe: use devm_add_action_or_reset() helper


