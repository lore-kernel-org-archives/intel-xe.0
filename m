Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DBEC87FCE
	for <intel-xe@archiver.kernel.org>; Sun, 27 Jul 2025 04:34:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF6010E0E7;
	Sun, 27 Jul 2025 04:34:59 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA21610E0E7;
 Sun, 27 Jul 2025 04:34:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Mark_xe_driver_as_BROKEN_?=
 =?utf-8?q?until_fixed?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Simon Richter" <Simon.Richter@hogyros.de>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 27 Jul 2025 04:34:57 -0000
Message-ID: <175359089788.192342.9916247781187775218@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250727042825.8560-1-Simon.Richter@hogyros.de>
In-Reply-To: <20250727042825.8560-1-Simon.Richter@hogyros.de>
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

Series: Mark xe driver as BROKEN until fixed
URL   : https://patchwork.freedesktop.org/series/152144/
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
commit e97f38785c466ffef3f780e2bfb427069f3f839e
Author: Simon Richter <Simon.Richter@hogyros.de>
Date:   Sun Jul 27 13:27:36 2025 +0900

    Mark xe driver as BROKEN if kernel page size is not 4kB
    
    This driver, for the time being, assumes that the kernel page size is 4kB,
    so it fails on loong64 and aarch64 with 16kB pages, and ppc64el with 64kB
    pages.
+ /mt/dim checkpatch b5cba94af0ba1607a1413be3ab9b8a712397042a drm-intel
e97f38785c46 Mark xe driver as BROKEN if kernel page size is not 4kB
-:22: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 0 warnings, 0 checks, 8 lines checked


