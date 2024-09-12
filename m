Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBB0EED634
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 17:48:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FAD110EBFA;
	Thu, 12 Sep 2024 17:48:21 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E6D610EBFA;
 Thu, 12 Sep 2024 17:48:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/oa=3A_Fix_overflow?=
 =?utf-8?q?_in_oa_batch_buffer?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Souza, Jose" <jose.souza@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Sep 2024 17:48:20 -0000
Message-ID: <172616330031.992962.7512154374622093135@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240912153842.35813-1-jose.souza@intel.com>
In-Reply-To: <20240912153842.35813-1-jose.souza@intel.com>
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

Series: drm/xe/oa: Fix overflow in oa batch buffer
URL   : https://patchwork.freedesktop.org/series/138601/
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
commit 1b4b40ce92f2c4774a7570a194a2fceab3cfc070
Author: José Roberto de Souza <jose.souza@intel.com>
Date:   Thu Sep 12 08:38:42 2024 -0700

    drm/xe/oa: Fix overflow in oa batch buffer
    
    By default xe_bb_create_job() appends a MI_BATCH_BUFFER_END to batch
    buffer, this is not a problem if batch buffer is only used once but
    oa reuses the batch buffer for the same metric and at each call
    it appends a MI_BATCH_BUFFER_END, printing the warning below and then
    overflowing.
    
    [  381.072016] ------------[ cut here ]------------
    [  381.072019] xe 0000:00:02.0: [drm] Assertion `bb->len * 4 + bb_prefetch(q->gt) <= size` failed!
                   platform: LUNARLAKE subplatform: 1
                   graphics: Xe2_LPG / Xe2_HPG 20.04 step B0
                   media: Xe2_LPM / Xe2_HPM 20.00 step B0
                   tile: 0 VRAM 0 B
                   GT: 0 type 1
    
    So here checking if batch buffer already have MI_BATCH_BUFFER_END if
    not append it.
    
    v2:
    - simply fix, suggestion from Ashutosh
    
    Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
    Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
    Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch 9fd27ed0883cff53777b8db0b7c6db327132dcdc drm-intel
1b4b40ce92f2 drm/xe/oa: Fix overflow in oa batch buffer


