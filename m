Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E318C35FFA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Mar 2025 13:56:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 018B910E504;
	Wed, 19 Mar 2025 13:56:08 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5BAE10E504;
 Wed, 19 Mar 2025 13:56:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_update_to_FBC=2C_PSR?=
 =?utf-8?q?_combo_handling_in_xe2lpd?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 19 Mar 2025 13:56:06 -0000
Message-ID: <174239256680.53854.13749525483325518909@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250319135130.122703-1-vinod.govindapillai@intel.com>
In-Reply-To: <20250319135130.122703-1-vinod.govindapillai@intel.com>
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

Series: update to FBC, PSR combo handling in xe2lpd
URL   : https://patchwork.freedesktop.org/series/146487/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: a958e31a81b3 drm-tip: 2025y-03m-15d-18h-50m-02s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/fbc: keep FBC disabled if selective update is on in xe2lpd
Applying: drm/i915/fbc: remove panel_replay dependency from fbc wa checks


