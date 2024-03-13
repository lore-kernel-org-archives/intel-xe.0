Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95335C54791
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 20:45:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3776810EF4D;
	Wed, 13 Mar 2024 20:45:29 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44FDB10EF4D;
 Wed, 13 Mar 2024 20:45:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_tests/intel/xe=5Fwed?=
 =?utf-8?q?ged=3A_Introduce_a_new_test_for_Xe_device_wedged_state?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 Mar 2024 20:45:27 -0000
Message-ID: <171036272728.732599.6639748076125914963@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240313195530.141586-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240313195530.141586-1-rodrigo.vivi@intel.com>
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

Series: tests/intel/xe_wedged: Introduce a new test for Xe device wedged state
URL   : https://patchwork.freedesktop.org/series/131099/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 790a1d4e546a drm-tip: 2024y-03m-13d-20h-00m-39s UTC integration manifest
=== git am output follows ===
error: tests/meson.build: does not exist in index
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: tests/intel/xe_wedged: Introduce a new test for Xe device wedged state
Patch failed at 0001 tests/intel/xe_wedged: Introduce a new test for Xe device wedged state
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


