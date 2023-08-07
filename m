Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E968C001DB
	for <intel-xe@archiver.kernel.org>; Mon,  7 Aug 2023 13:04:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F5710E0A6;
	Mon,  7 Aug 2023 13:04:50 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id A3D2C10E0A6;
 Mon,  7 Aug 2023 13:04:48 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9A647A0093;
 Mon,  7 Aug 2023 13:04:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Mon, 07 Aug 2023 13:04:48 -0000
Message-ID: <169141348862.13176.14289672579293935207@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230807130226.49777-2-matthew.auld@intel.com>
In-Reply-To: <20230807130226.49777-2-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe/vm=3A_uncombine_the_combined=5Flinks=2Edestroy?=
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

Series: drm/xe/vm: uncombine the combined_links.destroy
URL   : https://patchwork.freedesktop.org/series/122102/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e700ea2f248a75138759bcb443affeef4a2d1991
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5ad0a1d1f734ef4b11363fd5a36dbe6ad6619483
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Mon Aug 7 14:02:27 2023 +0100

    drm/xe/vm: uncombine the combined_links.destroy
    
    It looks like it's plausible for eviction to be happening as we are
    closing the vm, however the rebind_link and destroy links are in this
    case not mutually exclusive, since eviction only needs the vm dma-resv
    lock which the vm close drops when accessing the contested list. If we
    race with eviction here it can run rampant and corrupt the list since
    both the destroy and rebind links are the same list entry underneath.
    Simplest is to just split these entries into separate links.
    
    References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/514
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 8a6b4e2f061b33999d3c0bcaa42441c082103d1e drm-intel
/mt/dim: line 50: /root/.dimrc: No such file or directory


