Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04367C27C5E
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 15:28:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A083410E1E9;
	Mon, 10 Jun 2024 15:28:16 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1BDC10E1E9;
 Mon, 10 Jun 2024 15:28:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_series_starting_with?=
 =?utf-8?q?_=5BCI=2C1/3=5D_drm/xe=3A_poor_man=27s_exhaustive_eviction?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 10 Jun 2024 15:28:15 -0000
Message-ID: <171803329572.32192.18079174569274298619@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240610152017.43436-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240610152017.43436-1-thomas.hellstrom@linux.intel.com>
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

Series: series starting with [CI,1/3] drm/xe: poor man's exhaustive eviction
URL   : https://patchwork.freedesktop.org/series/134682/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 3d66fb77a4da drm-tip: 2024y-06m-10d-14h-38m-39s UTC integration manifest
=== git am output follows ===
.git/rebase-apply/patch:197: trailing whitespace.
	
.git/rebase-apply/patch:203: new blank line at EOF.
+
warning: 2 lines add whitespace errors.
.git/rebase-apply/patch:37: trailing whitespace.
	if (err != -ENOMEM || *exclusive)	  
warning: 1 line adds whitespace errors.
Applying: drm/xe: poor man's exhaustive eviction
Applying: drm/xe: Take the validation rwsem in exclusive mode on OOM
Applying: drm/xe/xe-for-ci: Check whether oom was due to ww mutex error injection


