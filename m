Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F42C021B2
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 00:44:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4864110E02B;
	Fri, 21 Feb 2025 00:44:34 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D704C10E02B;
 Fri, 21 Feb 2025 00:44:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Stop_accessing_displ?=
 =?utf-8?q?ay_TIMESTAMP=5FOVERRIDE_in_GT_code?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Feb 2025 00:44:32 -0000
Message-ID: <174009867287.332697.11992752232922103455@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250221003843.443559-6-matthew.d.roper@intel.com>
In-Reply-To: <20250221003843.443559-6-matthew.d.roper@intel.com>
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

Series: Stop accessing display TIMESTAMP_OVERRIDE in GT code
URL   : https://patchwork.freedesktop.org/series/145200/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 2c2b141845ce drm-tip: 2025y-02m-20d-19h-00m-30s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/display: Make refclk fetching logic reusable
Applying: drm/i915/gt: Replace TIMESTAMP_OVERRIDE readout
Applying: drm/xe: Drop usage of TIMESTAMP_OVERRIDE
Applying: drm/xe/sriov: Drop TIMESTAMP_OVERRIDE from Xe2 runtime regs


