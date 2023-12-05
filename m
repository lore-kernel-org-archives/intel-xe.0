Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFA1C07E97
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 15:56:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03CC310E382;
	Tue,  5 Dec 2023 15:56:43 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id AB6C910E382;
 Tue,  5 Dec 2023 15:56:41 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A261BAADD5;
 Tue,  5 Dec 2023 15:56:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Tue, 05 Dec 2023 15:56:41 -0000
Message-ID: <170179180166.24285.6908711508148573748@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231205133954.2089546-1-lucas.demarchi@intel.com>
In-Reply-To: <20231205133954.2089546-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_series_starting_with_=5BCI=2C1/4=5D_drm/xe/kunit=3A_Remove_h?=
 =?utf-8?q?andling_of_XE=5FTEST=5FSUBPLATFORM=5FANY?=
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

Series: series starting with [CI,1/4] drm/xe/kunit: Remove handling of XE_TEST_SUBPLATFORM_ANY
URL   : https://patchwork.freedesktop.org/series/127361/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: ac7b89571 drm/xe/uapi: Kill exec_queue_set_property
=== git am output follows ===
Applying: drm/xe/kunit: Remove handling of XE_TEST_SUBPLATFORM_ANY
Applying: drm/xe/kunit: Move fake pci data to test-priv
Applying: drm/xe/kunit: Add stub to read_gmdid
Applying: drm/xe/kunit: Test WAs for MTL and LNL


