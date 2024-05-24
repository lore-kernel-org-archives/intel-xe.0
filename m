Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86372C25B74
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 08:18:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 258D58945A;
	Fri, 24 May 2024 08:18:09 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B8F8945A;
 Fri, 24 May 2024 08:18:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe=3A_Allow_migr?=
 =?utf-8?q?ate_vm_gpu_submissions_from_reclaim_context_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 May 2024 08:18:06 -0000
Message-ID: <171653868665.2172910.1623599748625787716@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240524071940.83042-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240524071940.83042-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: Allow migrate vm gpu submissions from reclaim context (rev3)
URL   : https://patchwork.freedesktop.org/series/133918/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 94810806e111 drm-tip: 2024y-05m-24d-08h-09m-07s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Decouple job seqno and lrc seqno
Applying: drm/xe: Split lrc seqno fence creation up
Applying: drm/xe: Don't initialize fences at xe_sched_job_create()
Applying: drm/xe: Remove xe_lrc_create_seqno_fence()
Applying: drm/xe: Move job creation out of the struct xe_migrate::job_mutex


