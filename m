Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0604CC3DA63
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 03:18:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC1C10E3E1;
	Tue, 23 Jul 2024 03:18:49 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CD9810E3E1;
 Tue, 23 Jul 2024 03:18:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Wait_on_bookkee?=
 =?utf-8?q?p_dma-resv_slots_when_unmapping_/_mapping_same_address?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 23 Jul 2024 03:18:48 -0000
Message-ID: <172170472844.358681.6981024324119652059@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240723031409.1698464-1-matthew.brost@intel.com>
In-Reply-To: <20240723031409.1698464-1-matthew.brost@intel.com>
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

Series: drm/xe: Wait on bookkeep dma-resv slots when unmapping / mapping same address
URL   : https://patchwork.freedesktop.org/series/136366/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
5ce3e132caaa5b45e5e50201b574a097d130967c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 065193c2c85c2dedde6219fa541d4f349dcdb1b6
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Mon Jul 22 20:14:09 2024 -0700

    drm/xe: Wait on bookkeep dma-resv slots when unmapping / mapping same address
    
    There is a window between unmap and map of the same address in which the
    old and new address is invalid. Avoid this window by waiting bookkeep
    dma-resv when unmapping and mapping the same address.
    
    This race is shown when running xe_vm.mmap* on presi platform which by
    nature are more susceptible to races.
    
    Fixes: ("drm/xe: Convert multiple bind ops into single job")
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b drm-intel
065193c2c85c drm/xe: Wait on bookkeep dma-resv slots when unmapping / mapping same address


