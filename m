Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB14C04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 14:09:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A20C10FC76;
	Tue, 23 Apr 2024 14:09:18 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4503E10FC76;
 Tue, 23 Apr 2024 14:09:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe=3A_Support_PC?=
 =?utf-8?q?Ie_FLR_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aravind Iddamsetty" <aravind.iddamsetty@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 23 Apr 2024 14:09:17 -0000
Message-ID: <171388135728.1607644.16179061092355554383@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240422065756.294679-1-aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20240422065756.294679-1-aravind.iddamsetty@linux.intel.com>
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

Series: drm/xe: Support PCIe FLR (rev6)
URL   : https://patchwork.freedesktop.org/series/131366/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 861eed75446f drm-tip: 2024y-04m-23d-07h-30m-22s UTC integration manifest
=== git am output follows ===
Applying: drm: add devm release action
Applying: drm/xe: Save and restore PCI state
Applying: drm/xe: Extract xe_gt_idle() helper
Applying: drm/xe/FLR: Support PCIe FLR


