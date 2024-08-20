Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8DBC5320E
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 08:55:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D9B10E028;
	Tue, 20 Aug 2024 08:55:55 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E930910E028;
 Tue, 20 Aug 2024 08:55:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_series_starting_with?=
 =?utf-8?q?_=5B1/3=5D_drm/xe=3A_Remove_extra_dma=5Ffence=5Fput_on_xe=5Fsync?=
 =?utf-8?q?=5Fentry=5Fadd=5Fdeps_failure?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 Aug 2024 08:55:53 -0000
Message-ID: <172414415394.698557.6146144932676991420@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240820090230.3258128-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240820090230.3258128-1-himal.prasad.ghimiray@intel.com>
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

Series: series starting with [1/3] drm/xe: Remove extra dma_fence_put on xe_sync_entry_add_deps failure
URL   : https://patchwork.freedesktop.org/series/137501/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 4d24271792fa drm-tip: 2024y-08m-19d-20h-13m-25s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Remove extra dma_fence_put on xe_sync_entry_add_deps failure
Applying: drm/xe: Remove unrequired NULL checks in xe_sync_entry_cleanup
Applying: drm/xe: Remove unrequired NULL check in xe_sched_job_free_fences


