Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07DAFCD37B0
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 12:30:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4D5110E272;
	Mon, 18 Sep 2023 12:30:00 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id D876210E07F;
 Mon, 18 Sep 2023 12:29:58 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id DDBFBAADE4;
 Mon, 18 Sep 2023 12:29:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dani Liberman" <dliberman@habana.ai>
Date: Mon, 18 Sep 2023 12:29:58 -0000
Message-ID: <169504019890.32416.2857507650068890878@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230918114848.67712-1-dliberman@habana.ai>
In-Reply-To: <20230918114848.67712-1-dliberman@habana.ai>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_se?=
 =?utf-8?q?ries_starting_with_=5B1/3=5D_drm/xe=3A_proper_setting_of_irq_en?=
 =?utf-8?q?abled_flag?=
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

Series: series starting with [1/3] drm/xe: proper setting of irq enabled flag
URL   : https://patchwork.freedesktop.org/series/123856/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f176fc5a89875149b11bac8e2014d930b712a619
Author: Dani Liberman <dliberman@habana.ai>
Date:   Mon Sep 18 14:48:48 2023 +0300

    drm/xe: add msix support
    
    In future devices we will need to support msix interrupts.
    
    Reviewed-by: Ohad Sharabi <osharabi@habana.ai>
    Signed-off-by: Dani Liberman <dliberman@habana.ai>
+ /mt/dim checkpatch 717f01815b20bde3f081a18f42f31673ce1f107f drm-intel
9119be542 drm/xe: proper setting of irq enabled flag
b73bf0d7a drm/xe: change old msi irq api to a new one
f176fc5a8 drm/xe: add msix support


