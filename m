Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63580E7717D
	for <intel-xe@archiver.kernel.org>; Wed, 11 Dec 2024 06:48:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C26110E06B;
	Wed, 11 Dec 2024 06:48:00 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A187E10E06B;
 Wed, 11 Dec 2024 06:47:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_VF=3A_Avoid_reading_?=
 =?utf-8?q?inaccessible_registers_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jakub Kolakowski" <jakub1.kolakowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 11 Dec 2024 06:47:58 -0000
Message-ID: <173389967865.1116814.6938508221941310539@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241211064211.781820-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20241211064211.781820-1-marcin.bernatowicz@linux.intel.com>
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

Series: VF: Avoid reading inaccessible registers (rev2)
URL   : https://patchwork.freedesktop.org/series/142196/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 7bbcd7df9387 drm-tip: 2024y-12m-10d-23h-09m-33s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/vf: Don't check has flat ccs in bios on VF
Applying: drm/xe/rtp: Add match helper to omit SR-IOV VF device
Applying: drm/xe/vf: Don't apply Wa_22019338487 for VF


