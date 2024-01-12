Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7384BC4706C
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 15:30:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF7E10EB50;
	Fri, 12 Jan 2024 15:30:10 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9E910EB4C;
 Fri, 12 Jan 2024 15:30:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_VF_Tweaks?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Date: Fri, 12 Jan 2024 15:30:08 -0000
Message-ID: <170507340884.338258.9284728371557611860@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240112152649.849-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240112152649.849-1-michal.wajdeczko@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: VF Tweaks
URL   : https://patchwork.freedesktop.org/series/128727/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 7a2018706 drm/xe: Fix potential deadlock in __fini_dbm
=== git am output follows ===
Applying: drm/xe/vf: Assume fixed GSM size if VF
Applying: drm/xe/vf: Don't try to capture engine data unavailable to VF
Applying: drm/xe/vf: Don't program MOCS if VF
Applying: drm/xe/vf: Don't initialize stolen memory manager if VF
Applying: drm/xe/vf: Don't check if LMEM is initialized if VF
Applying: drm/xe/vf: Don't enable hwmon if VF
Applying: drm/xe/vf: Don't program PAT if VF
Applying: drm/xe/vf: Don't support MCR registers if VF


