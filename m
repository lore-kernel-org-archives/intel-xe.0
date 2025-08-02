Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2885C87FCB
	for <intel-xe@archiver.kernel.org>; Sat,  2 Aug 2025 02:48:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABFF910E32F;
	Sat,  2 Aug 2025 02:48:13 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 672D910E066;
 Sat,  2 Aug 2025 02:48:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Mark_xe_driver_as_BROKEN_?=
 =?utf-8?q?if_kernel_page_size_is_not_4kB_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Simon Richter" <simon.richter@hogyros.de>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 02 Aug 2025 02:48:13 -0000
Message-ID: <175410289341.207063.5953426426361189305@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250727070413.9743-1-Simon.Richter@hogyros.de>
In-Reply-To: <20250727070413.9743-1-Simon.Richter@hogyros.de>
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

Series: Mark xe driver as BROKEN if kernel page size is not 4kB (rev3)
URL   : https://patchwork.freedesktop.org/series/152145/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c298eac5978c38dcc62a70c0d73c91765e7cc296
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 09e3618fe0906cc11d9f7ff98c37680dd8349a32
Author: Simon Richter <Simon.Richter@hogyros.de>
Date:   Sat Aug 2 11:40:36 2025 +0900

    Mark xe driver as BROKEN if kernel page size is not 4kB
    
    This driver, for the time being, assumes that the kernel page size is 4kB,
    so it fails on loong64 and aarch64 with 16kB pages, and ppc64el with 64kB
    pages.
    
    Signed-off-by: Simon Richter <Simon.Richter@hogyros.de>
    Cc: stable@vger.kernel.org
+ /mt/dim checkpatch 1e1a350a027482a09b07628ce72a69bb7f49567f drm-intel
09e3618fe090 Mark xe driver as BROKEN if kernel page size is not 4kB
-:24: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 0 checks, 7 lines checked


