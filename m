Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06613C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 06:51:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C5110E4F1;
	Fri, 16 Aug 2024 06:51:43 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF3A10E4F1;
 Fri, 16 Aug 2024 06:51:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe=3A_Remove_NUL?=
 =?utf-8?q?L_check_of_lrc-=3Ebo_in_xe=5Flrc=5Fsnapshot=5Fcapture=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Singh, Apoorva" <apoorva.singh@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 Aug 2024 06:51:42 -0000
Message-ID: <172379110243.653293.699617788465050070@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240816062446.896829-1-apoorva.singh@intel.com>
In-Reply-To: <20240816062446.896829-1-apoorva.singh@intel.com>
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

Series: drm/xe: Remove NULL check of lrc->bo in xe_lrc_snapshot_capture()
URL   : https://patchwork.freedesktop.org/series/137367/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 6f1b8ad3db6e drm-tip: 2024y-08m-16d-03h-38m-57s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Remove NULL check of lrc->bo in xe_lrc_snapshot_capture()


