Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C1AD68B2B
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 14:38:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E249210E2AE;
	Thu, 14 Nov 2024 14:38:03 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15D310E2AE;
 Thu, 14 Nov 2024 14:38:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Add_iomem_helpers_fo?=
 =?utf-8?q?r_use_from_debugfs_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 14 Nov 2024 14:38:01 -0000
Message-ID: <173159508198.4108163.18054576166674653698@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241112200454.2211-1-michal.wajdeczko@intel.com>
In-Reply-To: <20241112200454.2211-1-michal.wajdeczko@intel.com>
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

Series: Add iomem helpers for use from debugfs (rev3)
URL   : https://patchwork.freedesktop.org/series/141060/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: fb1a93e81fa2 drm-tip: 2024y-11m-14d-13h-52m-40s UTC integration manifest
=== git am output follows ===
Applying: iov_iter: Provide copy_iomem_to|from_iter()
Applying: libfs: Provide simple_read_from|write_to_iomem()
Applying: drm/xe: Add read/write debugfs helpers for GGTT node
Applying: drm/xe/pf: Expose access to the VF GGTT PTEs over debugfs


