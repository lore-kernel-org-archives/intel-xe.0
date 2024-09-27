Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B84CEBF81
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 08:26:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 024F710E1F4;
	Fri, 27 Sep 2024 08:26:42 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A42E210E1F4;
 Fri, 27 Sep 2024 08:26:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_gpu=3A_drm=3A_i915?=
 =?utf-8?q?=3A_display=3A_Avoid_null_values_intel=5Fplane=5Fatomic=5Fcheck?=
 =?utf-8?q?=5Fwith=5Fstate?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Sep 2024 08:26:41 -0000
Message-ID: <172742560166.1110099.14681053424534549819@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240927000146.50830-1-alessandro.zanni87@gmail.com>
In-Reply-To: <20240927000146.50830-1-alessandro.zanni87@gmail.com>
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

Series: gpu: drm: i915: display: Avoid null values intel_plane_atomic_check_with_state
URL   : https://patchwork.freedesktop.org/series/139198/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: c114fec0af7e drm-tip: 2024y-09m-27d-07h-08m-52s UTC integration manifest
=== git am output follows ===
Applying: gpu: drm: i915: display: Avoid null values intel_plane_atomic_check_with_state


