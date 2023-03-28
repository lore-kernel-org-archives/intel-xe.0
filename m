Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241CAC76195
	for <intel-xe@archiver.kernel.org>; Tue, 28 Mar 2023 01:57:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0AC810E285;
	Tue, 28 Mar 2023 01:57:34 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id C3DA110E285;
 Tue, 28 Mar 2023 01:57:32 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id BF82BAADDC;
 Tue, 28 Mar 2023 01:57:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Tue, 28 Mar 2023 01:57:32 -0000
Message-ID: <167996865278.29056.17060783635836267139@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230328015450.1731183-1-matthew.brost@intel.com>
In-Reply-To: <20230328015450.1731183-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_VM_LRU_bulk_move?=
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

Series: VM LRU bulk move
URL   : https://patchwork.freedesktop.org/series/115697/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit 2bf8f26026a35cf4a24d3609f70d1fb166c4183e
Author:     Chang, Bruce <yu.bruce.chang@intel.com>
AuthorDate: Thu Mar 23 19:38:58 2023 +0000
Commit:     Chang, Bruce <yu.bruce.chang@intel.com>
CommitDate: Mon Mar 27 20:20:53 2023 +0000

    drm/xe: don't auto fall back to execlist mode if guc failed to init
    
    In general, this is due to FW load failure, should just report
    error and fail the probe so that user can easily retry again.
    
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>
=== git am output follows ===
Applying: drm/xe: Only try to lock external BOs in VM bind
Applying: drm/xe: VM LRU bulk move


