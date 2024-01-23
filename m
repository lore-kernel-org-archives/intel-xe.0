Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8026C47DDB
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 20:57:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D87310E08D;
	Tue, 23 Jan 2024 20:57:56 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 144D110E080;
 Tue, 23 Jan 2024 20:57:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_series_starting_with?=
 =?utf-8?q?_=5Bv3=2C1/9=5D_drm/xe=3A_Remove_double_new_lines_in_devcoredump?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Date: Tue, 23 Jan 2024 20:57:56 -0000
Message-ID: <170604347608.684601.11113289960936169420@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240123204454.246788-1-jose.souza@intel.com>
In-Reply-To: <20240123204454.246788-1-jose.souza@intel.com>
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

Series: series starting with [v3,1/9] drm/xe: Remove double new lines in devcoredump
URL   : https://patchwork.freedesktop.org/series/129103/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: fc6b7c6ee drm-tip: 2024y-01m-23d-16h-04m-25s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Remove double new lines in devcoredump
Applying: drm/xe: Change devcoredump functions parameters to xe_sched_job
Applying: drm/xe: Nuke xe from xe_devcoredump
Applying: drm/xe: Stash GMD_ID value in xe_gt
Applying: drm/xe: Print more device information in devcoredump
Applying: drm/xe: Print registers spread in 2 u32 as u64
Applying: drm/xe: Remove additional spaces in devcoredump HW Engines section
Applying: drm/xe: Add functions to convert regular address to canonical address and back
Applying: drm/xe: Add batch buffer addresses to devcoredump


