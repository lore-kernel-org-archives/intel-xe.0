Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1087EC5AD49
	for <intel-xe@archiver.kernel.org>; Mon, 26 May 2025 19:07:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCCB310E390;
	Mon, 26 May 2025 19:07:05 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55ABF10E3AD;
 Mon, 26 May 2025 19:07:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Do_not_print_en?=
 =?utf-8?q?gine_reset_message_on_a_killed_queue?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 May 2025 19:07:04 -0000
Message-ID: <174828642434.21264.8917259422137926668@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250508190920.1343610-1-matthew.brost@intel.com>
In-Reply-To: <20250508190920.1343610-1-matthew.brost@intel.com>
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

Series: drm/xe: Do not print engine reset message on a killed queue
URL   : https://patchwork.freedesktop.org/series/148776/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 66d17bc1a1b0f2698a694e3df95eb30d12b232fa
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu May 8 12:09:20 2025 -0700

    drm/xe: Do not print engine reset message on a killed queue
    
    When an app is ctrl-c (killed) any queues running on the GPU have their
    preemption timeout set to the minimum value and scheduling is disabled.
    If the queue has something active on the GPU it is very likely for the
    GuC will trigger an engine reset resulting in the engine reset message
    being printed when this is fully expected. Do not print the engine reset
    message on queues which have been killed.
    
    Reported-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4904
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
+ /mt/dim checkpatch 3e019cc3eaffcb7022b9de66871eabdefd6e06ff drm-intel
66d17bc1a1b0 drm/xe: Do not print engine reset message on a killed queue


