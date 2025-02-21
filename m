Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E59C021AA
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 12:12:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB5910EA65;
	Fri, 21 Feb 2025 12:12:16 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4C7810EA63;
 Fri, 21 Feb 2025 12:12:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/sched=3A_Job_que?=
 =?utf-8?q?ue_peek/pop_helpers_and_struct_job_re-order_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Feb 2025 12:12:15 -0000
Message-ID: <174013993586.461006.6335195900340778907@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250221105038.79665-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250221105038.79665-1-tvrtko.ursulin@igalia.com>
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

Series: drm/sched: Job queue peek/pop helpers and struct job re-order (rev2)
URL   : https://patchwork.freedesktop.org/series/144853/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: a22ac320a083 drm-tip: 2025y-02m-21d-09h-57m-32s UTC integration manifest
=== git am output follows ===
Applying: drm/sched: Add internal job peek/pop API
Applying: drm/amdgpu: Pop jobs from the queue more robustly
Applying: drm/sched: Remove a hole from struct drm_sched_job
Applying: drm/sched: Move drm_sched_entity_is_ready to internal header
Applying: drm/sched: Move internal prototypes to internal header
Applying: drm/sched: Group exported prototypes by object type


