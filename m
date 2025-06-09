Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BFCC5B552
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 14:59:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F9BD10E405;
	Mon,  9 Jun 2025 14:59:41 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE52310E406;
 Mon,  9 Jun 2025 14:59:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_A_few_drm=5Fsyncobj_?=
 =?utf-8?q?optimisations?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 09 Jun 2025 14:59:39 -0000
Message-ID: <174948117990.61033.2290600698680889372@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250609113313.75395-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250609113313.75395-1-tvrtko.ursulin@igalia.com>
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

Series: A few drm_syncobj optimisations
URL   : https://patchwork.freedesktop.org/series/149983/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 40c78d0f4b5d drm-tip: 2025y-06m-09d-14h-19m-32s UTC integration manifest
=== git am output follows ===
Applying: drm/syncobj: Remove unhelpful helper
Applying: drm/syncobj: Do not allocate an array to store zeros when waiting
Applying: drm/syncobj: Avoid one temporary allocation in drm_syncobj_array_find
Applying: drm/syncobj: Use put_user in drm_syncobj_query_ioctl
Applying: drm/syncobj: Avoid temporary allocation in drm_syncobj_timeline_signal_ioctl
Applying: drm/syncobj: Add a fast path to drm_syncobj_array_wait_timeout
Applying: drm/syncobj: Add a fast path to drm_syncobj_array_find


