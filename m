Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10484C54FB3
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 18:22:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB0E10E0CF;
	Thu, 29 May 2025 18:22:07 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A72510E11A;
 Thu, 29 May 2025 18:22:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe/vsec=3A_fix_C?=
 =?utf-8?q?ONFIG=5FINTEL=5FVSEC_dependency_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 29 May 2025 18:22:06 -0000
Message-ID: <174854292662.32355.15140439490336194759@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250529172355.2395634-2-lucas.demarchi@intel.com>
In-Reply-To: <20250529172355.2395634-2-lucas.demarchi@intel.com>
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

Series: drm/xe/vsec: fix CONFIG_INTEL_VSEC dependency (rev2)
URL   : https://patchwork.freedesktop.org/series/149427/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 901190a06230 drm-tip: 2025y-05m-29d-16h-22m-38s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/vsec: fix CONFIG_INTEL_VSEC dependency


