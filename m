Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E60C41535
	for <intel-xe@archiver.kernel.org>; Tue, 19 Dec 2023 04:58:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CCF910E3DF;
	Tue, 19 Dec 2023 04:58:11 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id A4A8010E3DF;
 Tue, 19 Dec 2023 04:58:09 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A1106AADE4;
 Tue, 19 Dec 2023 04:58:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Introduce_GuC_Doorbe?=
 =?utf-8?q?lls_Manager_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Date: Tue, 19 Dec 2023 04:58:09 -0000
Message-ID: <170296188965.17580.12728818103244199695@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231218190629.502-1-michal.wajdeczko@intel.com>
In-Reply-To: <20231218190629.502-1-michal.wajdeczko@intel.com>
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

Series: Introduce GuC Doorbells Manager (rev5)
URL   : https://patchwork.freedesktop.org/series/127608/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 84e5d706c drm/xe/dg2: Drop pre-production workarounds
=== git am output follows ===
Applying: drm/xe: Add GT oriented drm_printers
Applying: drm/xe: Report TLB timeout using GT oriented functions
Applying: drm/xe: Introduce GuC Doorbells Manager
Applying: drm/xe/kunit: Set SR-IOV mode of the fake device
Applying: drm/xe/kunit: Define helper functions to allocate fake xe device
Applying: drm/xe/kunit: Restore test->priv when done with fake xe device
Applying: drm/xe/kunit: Use xe kunit helper in RTP test
Applying: drm/xe/kunit: Use xe kunit helper in WA test
Applying: drm/xe/kunit: Enable CONFIG_LOCKDEP in tests
Applying: drm/xe/kunit: Add GuC Doorbells Manager tests


