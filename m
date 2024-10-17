Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E32D2124B
	for <intel-xe@archiver.kernel.org>; Thu, 17 Oct 2024 08:42:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 231DF10E1CF;
	Thu, 17 Oct 2024 08:42:03 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E19AC10E1CF;
 Thu, 17 Oct 2024 08:42:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Add_support_for_3_VD?=
 =?utf-8?q?SC_engines_12_slices_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 17 Oct 2024 08:42:01 -0000
Message-ID: <172915452191.1277702.14076232234463437579@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241017082348.3413727-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20241017082348.3413727-1-ankit.k.nautiyal@intel.com>
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

Series: Add support for 3 VDSC engines 12 slices (rev3)
URL   : https://patchwork.freedesktop.org/series/139933/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 6f9cc21188c8 drm-tip: 2024y-10m-17d-07h-13m-58s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/display: Prepare for dsc 3 stream splitter
Applying: drm/i915/vdsc: Use VDSC0/VDSC1 for LEFT/RIGHT VDSC engine
Applying: drm/i915/vdsc: Add register bits for VDSC2 engine
Applying: drm/i915/vdsc: Add support for read/write PPS for DSC3
Applying: drm/i915/dp: Add check for hdisplay divisible by slice count
Applying: drm/i915/display: Add DSC pixel replication
Applying: drm/i915/dp: Compute pixel replication count for DSC 12 slices case
Applying: drm/i915/display: Account for pixel replication in pipe_src
Applying: drm/i915/dsc: Account for Odd pixel removal
Applying: drm/i915/dp: Add support for 3 vdsc engines and 12 slices.


