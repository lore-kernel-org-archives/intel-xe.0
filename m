Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546BDC021AA
	for <intel-xe@archiver.kernel.org>; Tue, 18 Feb 2025 11:07:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA7410E034;
	Tue, 18 Feb 2025 11:07:35 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 249FE10E034;
 Tue, 18 Feb 2025 11:07:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe=3A_Fix_export?=
 =?utf-8?q?ing_xe_buffers_multiple_times?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jacek Lawrynowicz" <jacek.lawrynowicz@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Feb 2025 11:07:34 -0000
Message-ID: <173987685414.3539942.10405362533824868874@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250218100353.2137964-1-jacek.lawrynowicz@linux.intel.com>
In-Reply-To: <20250218100353.2137964-1-jacek.lawrynowicz@linux.intel.com>
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

Series: drm/xe: Fix exporting xe buffers multiple times
URL   : https://patchwork.freedesktop.org/series/145001/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 4587c0599666 drm-tip: 2025y-02m-18d-09h-10m-11s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Fix exporting xe buffers multiple times


