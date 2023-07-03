Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88C0C001B0
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jul 2023 11:29:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C16910E0E3;
	Mon,  3 Jul 2023 11:29:09 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 453EC10E0E3;
 Mon,  3 Jul 2023 11:29:08 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 426A1A0078;
 Mon,  3 Jul 2023 11:29:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Date: Mon, 03 Jul 2023 11:29:08 -0000
Message-ID: <168838374826.4275.12696283086459469917@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230630115019.123675-1-jani.nikula@intel.com>
In-Reply-To: <20230630115019.123675-1-jani.nikula@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_series_?=
 =?utf-8?q?starting_with_=5BRESEND=2C1/5=5D_drm/i915/uncore=3A_add_intel?=
 =?utf-8?q?=5Funcore=5Fregs=28=29_helper_=28rev2=29?=
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

Series: series starting with [RESEND,1/5] drm/i915/uncore: add intel_uncore_regs() helper (rev2)
URL   : https://patchwork.freedesktop.org/series/120065/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
Traceback (most recent call last):
  File "/kernel/tools/testing/kunit/kunit.py", line 24, in <module>
    import kunit_kernel
  File "/kernel/tools/testing/kunit/kunit_kernel.py", line 42, in <module>
    class LinuxSourceTreeOperations:
  File "/kernel/tools/testing/kunit/kunit_kernel.py", line 95, in LinuxSourceTreeOperations
    def start(self, params: List[str], build_dir: str) -> subprocess.Popen[str]:
TypeError: 'type' object is not subscriptable
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


