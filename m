Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CFCD111A5
	for <intel-xe@archiver.kernel.org>; Mon,  4 Nov 2024 04:49:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE4B10E0CF;
	Mon,  4 Nov 2024 04:49:49 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8294C10E371;
 Mon,  4 Nov 2024 04:49:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_series_starting_with?=
 =?utf-8?q?_=5BRESEND=2CPATCHv2=2C1/3=5D_drm/i915/dp=3A_use_fsleep_instead_o?=
 =?utf-8?q?f_usleep=5Frange_for_LT?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 04 Nov 2024 04:49:48 -0000
Message-ID: <173069578853.1389949.15911838419296891750@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241104035859.3796797-1-arun.r.murthy@intel.com>
In-Reply-To: <20241104035859.3796797-1-arun.r.murthy@intel.com>
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

Series: series starting with [RESEND,PATCHv2,1/3] drm/i915/dp: use fsleep instead of usleep_range for LT
URL   : https://patchwork.freedesktop.org/series/140855/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: e1ed3c4d5631 drm-tip: 2024y-11m-04d-02h-31m-41s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/dp: use fsleep instead of usleep_range for LT
Applying: drm/i915/dp: read Aux RD interval just before setting the FFE preset
Applying: drm/i915/dp: Include the time taken by AUX Tx for timeout


