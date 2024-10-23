Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2DCD2E01E
	for <intel-xe@archiver.kernel.org>; Wed, 23 Oct 2024 08:11:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC1E10E788;
	Wed, 23 Oct 2024 08:11:55 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E9A10E788;
 Wed, 23 Oct 2024 08:11:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_kernel/cgroups=3A_Ad?=
 =?utf-8?q?d_=22dev=22_memory_accounting_cgroup=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 23 Oct 2024 08:11:53 -0000
Message-ID: <172967111361.1322977.13181403966421444116@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241023075302.27194-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20241023075302.27194-1-maarten.lankhorst@linux.intel.com>
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

Series: kernel/cgroups: Add "dev" memory accounting cgroup.
URL   : https://patchwork.freedesktop.org/series/140361/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 0cd3ccdcf952 drm-tip: 2024y-10m-23d-07h-36m-40s UTC integration manifest
=== git am output follows ===
.git/rebase-apply/patch:95: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: kernel/cgroup: Add "dev" memory accounting cgroup
Applying: drm/drv: Add drmm cgroup registration for dev cgroups.
Applying: drm/ttm: Handle cgroup based eviction in TTM
Applying: drm/xe: Implement cgroup for vram
Applying: drm/amdgpu: Add cgroups implementation
Applying: drm/xe: Hack to test with mapped pages instead of vram.
Applying: drm/gem: Add cgroup memory accounting


