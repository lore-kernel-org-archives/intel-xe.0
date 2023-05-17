Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D557C77B7D
	for <intel-xe@archiver.kernel.org>; Wed, 17 May 2023 15:26:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C652010E446;
	Wed, 17 May 2023 15:26:00 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 44C9C10E446;
 Wed, 17 May 2023 15:25:59 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 415A6AADE4;
 Wed, 17 May 2023 15:25:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Wed, 17 May 2023 15:25:59 -0000
Message-ID: <168433715926.6588.14239085257805047995@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230517152244.348171-1-matthew.auld@intel.com>
In-Reply-To: <20230517152244.348171-1-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_series_starting_with_=5Bv5=2C1/7=5D_drm=3A_fix_drmm=5Fmutex?=
 =?utf-8?b?X2luaXQoKQ==?=
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

Series: series starting with [v5,1/7] drm: fix drmm_mutex_init()
URL   : https://patchwork.freedesktop.org/series/117891/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 0909fec9b fixup! drm/xe/display: Implement display support
=== git am output follows ===
Applying: drm: fix drmm_mutex_init()
Applying: Revert "drm/xe: Use atomic instead of mutex for xe_device_mem_access_ongoing"
Applying: drm/xe: don't allocate under ct->lock
Applying: drm/xe: keep pulling mem_access_get further back
Applying: drm/xe/ggtt: prime ggtt->lock against FS_RECLAIM
Applying: drm/xe: fix xe_device_mem_access_get() races
Applying: drm/xe: Use atomic for mem_access.ref


