Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C801DC77B73
	for <intel-xe@archiver.kernel.org>; Wed, 24 May 2023 18:33:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B5E10E24E;
	Wed, 24 May 2023 18:33:04 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4F25810E399;
 Wed, 24 May 2023 18:33:02 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 4936EA882E;
 Wed, 24 May 2023 18:33:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Wed, 24 May 2023 18:33:02 -0000
Message-ID: <168495318229.11320.12180354938029837640@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230524175701.320653-1-matthew.auld@intel.com>
In-Reply-To: <20230524175701.320653-1-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_series_starting_with_=5Bv10=2C1/9=5D_drm/xe=3A_don=27t_alloc?=
 =?utf-8?q?ate_under_ct-=3Elock?=
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

Series: series starting with [v10,1/9] drm/xe: don't allocate under ct->lock
URL   : https://patchwork.freedesktop.org/series/118327/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: b02504cd5 drm/xe/display: Allow scanout of bos that can be migrated to lmem
=== git am output follows ===
Applying: drm/xe: don't allocate under ct->lock
Applying: drm/xe: keep pulling mem_access_get further back
Applying: drm/xe: drop xe_device_mem_access_get() from guc_ct_send
Applying: drm/xe/ggtt: prime ggtt->lock against FS_RECLAIM
Applying: drm/xe: drop xe_device_mem_access_get() from invalidation_vma
Applying: drm/xe: fix xe_device_mem_access_get() races
Applying: drm/xe/vm: tidy up xe_runtime_pm usage
Applying: drm/xe: add lockdep annotation for xe_device_mem_access_get()
Applying: drm/xe/debugfs: grab mem_access around forcewake


