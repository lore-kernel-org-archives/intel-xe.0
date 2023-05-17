Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2FDBC77B7F
	for <intel-xe@archiver.kernel.org>; Wed, 17 May 2023 12:26:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9935D10E40A;
	Wed, 17 May 2023 12:26:09 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id CAB7C10E14F;
 Wed, 17 May 2023 12:26:06 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 5FD37AADFB;
 Wed, 17 May 2023 12:26:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Wed, 17 May 2023 12:26:06 -0000
Message-ID: <168432636638.6591.14691953011665564407@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230516173258.181118-1-matthew.auld@intel.com>
In-Reply-To: <20230516173258.181118-1-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_series_starting_with_=5BCI=2C1/7=5D_Revert_=22drm/xe=3A_Use_?=
 =?utf-8?q?atomic_instead_of_mutex_for_xe=5Fdevice=5Fmem=5Faccess=5Fongoin?=
 =?utf-8?b?ZyIgKHJldjIp?=
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

Series: series starting with [CI,1/7] Revert "drm/xe: Use atomic instead of mutex for xe_device_mem_access_ongoing" (rev2)
URL   : https://patchwork.freedesktop.org/series/117829/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 0909fec9b fixup! drm/xe/display: Implement display support
=== git am output follows ===
Applying: Revert "drm/xe: Use atomic instead of mutex for xe_device_mem_access_ongoing"
Applying: drm/xe: don't allocate under ct->lock
Applying: drm/xe: keep pulling mem_access_get further back
Applying: drm/xe/ggtt: prime ggtt->lock against FS_RECLAIM
Applying: drm/xe: fix xe_device_mem_access_get() races
Applying: drm/xe: Use atomic for mem_access.ref
Applying: HAX


