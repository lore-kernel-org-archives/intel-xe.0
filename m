Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C4CCDB483
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 10:25:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B44AF10E102;
	Fri, 13 Oct 2023 10:25:29 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 69D0310E102;
 Fri, 13 Oct 2023 10:25:27 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 68D63A3ECB;
 Fri, 13 Oct 2023 10:25:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Fri, 13 Oct 2023 10:25:27 -0000
Message-ID: <169719272742.31155.1083436217506385795@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231013102226.2961-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231013102226.2961-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe/uAPi=3A_Clarify_the_meaning_of_min=5Fpage=5Fsize_and_MIN?=
 =?utf-8?q?=5FALIGNMENT?=
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

Series: drm/xe/uAPi: Clarify the meaning of min_page_size and MIN_ALIGNMENT
URL   : https://patchwork.freedesktop.org/series/125108/
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
commit c1c2c5fc367a97c1a0b9e5f2a61067c2c7c10717
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Fri Oct 13 12:22:26 2023 +0200

    drm/xe/uAPi: Clarify the meaning of min_page_size and MIN_ALIGNMENT
    
    In particular, don't *enforce* alignment of buffer object sizes to
    MIN_ALIGNMENT, as enforcing that for imported dma-bufs would not
    really make sense.
    
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Francois Dugast <francois.dugast@intel.com>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 037b6c8b23818fa71223e996c68a4f55f2d91338 drm-intel
c1c2c5fc3 drm/xe/uAPi: Clarify the meaning of min_page_size and MIN_ALIGNMENT


