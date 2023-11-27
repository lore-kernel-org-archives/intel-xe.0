Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 078AAC07CB1
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 11:30:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D051B10E247;
	Mon, 27 Nov 2023 11:30:23 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 915B310E24B;
 Mon, 27 Nov 2023 11:30:21 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 8E6B0AADF6;
 Mon, 27 Nov 2023 11:30:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
Date: Mon, 27 Nov 2023 11:30:21 -0000
Message-ID: <170108462158.3005.15284470569384663518@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231127100249.168117-1-sujaritha.sundaresan@intel.com>
In-Reply-To: <20231127100249.168117-1-sujaritha.sundaresan@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Ad?=
 =?utf-8?q?d_a_freq_sub_directory_for_GT_frequencies?=
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

Series: Add a freq sub directory for GT frequencies
URL   : https://patchwork.freedesktop.org/series/126909/
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
commit 70cbbbf264208cd2d935b4604d511414bc779fdc
Author: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Date:   Mon Nov 27 15:32:49 2023 +0530

    drm/xe: Add a new sub directory for gt frequencies
    
    Add a new sub directory "freq" for gt frequencies and rename
    exisiting frequency sysfs attributes to align with devfreq
    requirements.
    
    Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
+ /mt/dim checkpatch 742c5e2bbe41df0e79309e7d601e3a52ef0a4e59 drm-intel
70cbbbf26 drm/xe: Add a new sub directory for gt frequencies


