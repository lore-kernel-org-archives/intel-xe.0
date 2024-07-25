Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB033C3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 12:29:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B91C510E7E9;
	Thu, 25 Jul 2024 12:29:45 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D0310E7E9;
 Thu, 25 Jul 2024 12:29:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Support_PMT_features?=
 =?utf-8?q?_in_Xe_=28rev10=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 25 Jul 2024 12:29:44 -0000
Message-ID: <172191058474.381543.6522427293018485329@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240725122214.4063886-1-michael.j.ruhl@intel.com>
In-Reply-To: <20240725122214.4063886-1-michael.j.ruhl@intel.com>
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

Series: Support PMT features in Xe (rev10)
URL   : https://patchwork.freedesktop.org/series/133472/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: e8874cead8c9 drm-tip: 2024y-07m-25d-12h-08m-50s UTC integration manifest
=== git am output follows ===
Applying: platform/x86/intel/vsec.h: Move to include/linux
Applying: platform/x86/intel/vsec: Add PMT read callbacks
Applying: platform/x86/intel/pmt: Use PMT callbacks
Applying: drm/xe/vsec: Support BMG devices
Applying: platform/x86/intel/pmt: Add support for PMT base adjust
Applying: drm/xe/vsec: Add support for DG2


