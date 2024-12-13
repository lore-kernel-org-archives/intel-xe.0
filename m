Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF73E7717D
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 10:55:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 838CA10EFBF;
	Fri, 13 Dec 2024 10:55:02 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC21610EFBF;
 Fri, 13 Dec 2024 10:55:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_series_starting_with?=
 =?utf-8?q?_=5BPATCHv2=2C1/3=5D_drm/plane=3A_Add_new_plane_property_IN=5FFOR?=
 =?utf-8?q?MATS=5FASYNC_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Dec 2024 10:55:01 -0000
Message-ID: <173408730169.2105340.18264214362522311180@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241118075315.466009-1-arun.r.murthy@intel.com>
In-Reply-To: <20241118075315.466009-1-arun.r.murthy@intel.com>
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

Series: series starting with [PATCHv2,1/3] drm/plane: Add new plane property IN_FORMATS_ASYNC (rev2)
URL   : https://patchwork.freedesktop.org/series/141474/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 8f7b64e13772 drm-tip: 2024y-12m-13d-09h-55m-10s UTC integration manifest
=== git am output follows ===
error: corrupt patch at line 13
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: drm/plane: Add new plane property IN_FORMATS_ASYNC
Applying: drm/plane: Expose function to create format/modifier blob
Patch failed at 0002 drm/plane: Expose function to create format/modifier blob
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


