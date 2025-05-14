Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECF9C3ABD8
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 20:04:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9B1710E701;
	Wed, 14 May 2025 20:04:40 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1805710E701;
 Wed, 14 May 2025 20:04:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe/vf=3A_Post-mi?=
 =?utf-8?q?gration_recovery_of_queues_and_jobs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lis, Tomasz" <tomasz.lis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 14 May 2025 20:04:39 -0000
Message-ID: <174725307909.80831.6191072627376774733@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250513224952.701343-1-tomasz.lis@intel.com>
In-Reply-To: <20250513224952.701343-1-tomasz.lis@intel.com>
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

Series: drm/xe/vf: Post-migration recovery of queues and jobs
URL   : https://patchwork.freedesktop.org/series/148982/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 3d6670fab64c drm-tip: 2025y-05m-14d-19h-28m-21s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/sa: Avoid caching GGTT address within the manager
Applying: drm/xe/vf: Finish RESFIX by reset if CTB not enabled
Applying: drm/xe/vf: Pause submissions during RESFIX fixups
Applying: drm/xe: Block reset while recovering from VF migration
Applying: drm/xe/vf: Rebase HWSP of all contexts after migration
Applying: drm/xe/vf: Rebase MEMIRQ structures for all contexts after migration
Applying: drm/xe/vf: Post migration, repopulate ring area for pending request


