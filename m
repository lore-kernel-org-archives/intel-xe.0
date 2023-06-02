Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B26EEC7EE24
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 19:52:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ACA510E0FB;
	Fri,  2 Jun 2023 19:52:50 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3E57310E0FB;
 Fri,  2 Jun 2023 19:52:48 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 3AF8AAADEA;
 Fri,  2 Jun 2023 19:52:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Date: Fri, 02 Jun 2023 19:52:48 -0000
Message-ID: <168573556823.15700.16451130478107066517@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230602180702.17380-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20230602180702.17380-1-niranjana.vishwanathapura@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_Use_large_rings_for_compute_contexts?=
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

Series: drm/xe: Use large rings for compute contexts
URL   : https://patchwork.freedesktop.org/series/118796/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 58d07ad5529305c3cb5012e5ca8166bdffa656f0
Author: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Date:   Fri Jun 2 11:07:02 2023 -0700

    drm/xe: Use large rings for compute contexts
    
    Allow compute contexts to submit the maximal amount of work without
    blocking userspace.
    
    The original size for user LRC ring's (SZ_16K) was chosen to minimise
    memory consumption, without being so small as to frequently stall in the
    middle of workloads. With the main consumers being GL / media pipelines
    of 2 or 3 batches per frame, we want to support ~10 requests in flight
    to allow for the application to control throttling without stalling
    within a frame.
    
    Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
    Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
    Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
+ /mt/dim checkpatch ef153c77d25ffd86b074190b77f9f561b9a5a909 drm-intel
58d07ad55 drm/xe: Use large rings for compute contexts


