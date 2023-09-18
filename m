Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DC4CD3421
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 08:43:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A04810E188;
	Mon, 18 Sep 2023 08:43:28 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1C35810E188;
 Mon, 18 Sep 2023 08:43:26 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 08D27A00CC;
 Mon, 18 Sep 2023 08:43:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sujaritha Sundaresan" <sujaritha.sundaresan@intel.com>
Date: Mon, 18 Sep 2023 08:43:26 -0000
Message-ID: <169502660603.32416.8750314807126993673@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230918071757.1132362-1-sujaritha.sundaresan@intel.com>
In-Reply-To: <20230918071757.1132362-1-sujaritha.sundaresan@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe/regs=3A_Add_definition_for_the_PERF=5FLIMIT=5FREASONS_regi?=
 =?utf-8?q?ster?=
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

Series: drm/xe/regs: Add definition for the PERF_LIMIT_REASONS register
URL   : https://patchwork.freedesktop.org/series/123835/
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
commit b16fa5854d698611c681495c16a8e8e29f5648ba
Author: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Date:   Mon Sep 18 12:47:57 2023 +0530

    drm/xe/regs: Add definition for the PERF_LIMIT_REASONS register
    
    Adding the definitions for the perf limit reasons register. This will
    be extensively used in frequency testing as well as the definition of
    several sysfs attributes.
    
    Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
+ /mt/dim checkpatch 9da40abcc0ccdf8fdfed4e21d76060bfcd35fe7d drm-intel
b16fa5854 drm/xe/regs: Add definition for the PERF_LIMIT_REASONS register


