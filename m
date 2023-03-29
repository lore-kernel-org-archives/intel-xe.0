Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BEE3C74A5B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Mar 2023 17:36:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 774D710EBCE;
	Wed, 29 Mar 2023 17:36:29 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id A619610EBCE;
 Wed, 29 Mar 2023 17:36:27 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9B944AADDC;
 Wed, 29 Mar 2023 17:36:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Wed, 29 Mar 2023 17:36:27 -0000
Message-ID: <168011138759.23898.17768035445664758720@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230329173334.4015124-1-matthew.d.roper@intel.com>
In-Reply-To: <20230329173334.4015124-1-matthew.d.roper@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Minor_batchbuffer_handling_fixes?=
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

Series: Minor batchbuffer handling fixes
URL   : https://patchwork.freedesktop.org/series/115812/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit 5de0375b04455c7c8e516f53715eedde50f5ae45
Author:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
AuthorDate: Thu Mar 23 15:05:18 2023 +0100
Commit:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CommitDate: Wed Mar 29 11:24:42 2023 +0200

    drm/xe: Display api changes update
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
=== git am output follows ===
Applying: drm/xe: Include hardware prefetch buffer in batchbuffer allocations
Applying: drm/xe: Adjust batchbuffer space warning when creating a job
Applying: drm/xe: Don't emit extra MI_BATCH_BUFFER_END in WA batchbuffer


