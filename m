Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86EA3C197BF
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 23:23:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E9D410EBB0;
	Thu, 27 Feb 2025 23:23:41 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31DD610EBB0;
 Thu, 27 Feb 2025 23:23:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Improve_type-safety_?=
 =?utf-8?q?on_POWER=5FDOMAIN=5F*=28=29_macros_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Feb 2025 23:23:40 -0000
Message-ID: <174069862019.2921297.11721195765656279180@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250227-improve-type-safey-power-domain-macros-v3-0-b6eaa00f9c33@intel.com>
In-Reply-To: <20250227-improve-type-safey-power-domain-macros-v3-0-b6eaa00f9c33@intel.com>
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

Series: Improve type-safety on POWER_DOMAIN_*() macros (rev4)
URL   : https://patchwork.freedesktop.org/series/144727/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: e03a2fbda18f drm-tip: 2025y-02m-27d-21h-48m-55s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/display: Use explicit base values in POWER_DOMAIN_*() macros
Applying: drm/i915/display: Make POWER_DOMAIN_*() always result in enum intel_display_power_domain


