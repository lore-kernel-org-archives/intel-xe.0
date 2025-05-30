Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 604F9C5AD49
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 20:44:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82AC510E0EB;
	Fri, 30 May 2025 20:43:54 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB0ED10E0EB;
 Fri, 30 May 2025 20:43:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Crashlog_Type1_Versi?=
 =?utf-8?q?on2_support_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 30 May 2025 20:43:52 -0000
Message-ID: <174863783269.36532.10096891907268422645@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250530203757.190853-1-michael.j.ruhl@intel.com>
In-Reply-To: <20250530203757.190853-1-michael.j.ruhl@intel.com>
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

Series: Crashlog Type1 Version2 support (rev2)
URL   : https://patchwork.freedesktop.org/series/149120/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 52afe38ad6f8 drm-tip: 2025y-05m-30d-15h-31m-58s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Correct BMG VSEC header sizing
Applying: platform/x86/intel/pmt: white space cleanup
Applying: platform/x86/intel/pmt: use guard(mutex)
Applying: platform/x86/intel: refactor endpoint usage
Applying: platform/x86/intel/pmt: crashlog binary file endpoint
Applying: platform/x86/intel/pmt: decouple sysfs and namespace
Applying: platform/x86/intel/pmt: use a version struct
Applying: platform/x86/intel/pmt: support BMG crashlog


