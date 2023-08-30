Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8F0C83F01
	for <intel-xe@archiver.kernel.org>; Wed, 30 Aug 2023 07:57:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B714610E4D3;
	Wed, 30 Aug 2023 07:57:37 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id AF4C710E4D3;
 Wed, 30 Aug 2023 07:57:36 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id AA711AADD8;
 Wed, 30 Aug 2023 07:57:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Janusz Krzysztofik" <janusz.krzysztofik@linux.intel.com>
Date: Wed, 30 Aug 2023 07:57:36 -0000
Message-ID: <169338225669.15232.3922926044619180144@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230830075419.26484-2-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20230830075419.26484-2-janusz.krzysztofik@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_ku?=
 =?utf-8?q?nit=3A_Fix_test_log_size_limit_too_low_for_some_tests?=
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

Series: kunit: Fix test log size limit too low for some tests
URL   : https://patchwork.freedesktop.org/series/123054/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e700ea2f248a75138759bcb443affeef4a2d1991
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6a30f1dac7a7ee7c5c7165db6d48df51ba244037
Author: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date:   Wed Aug 30 09:54:20 2023 +0200

    kunit: Fix test log size limit too low for some tests
    
    Now we have memory space available to a kunit test case log exposed via
    debugfs limited to 2048 bytes, while some parametrized test cases, e.g.,
    drm_framebuffer.drm_test_framebuffer_create, need more.  For this reason,
    debugfs results from affected test cases get truncated silently, and
    external tools that rely on parsing of debugfs results can fail.
    
    Increase kunit test case log size limit to 4096 bytes.
    
    Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
+ /mt/dim checkpatch 7af4e65956a8d0346547567b534d49acf30085e0 drm-intel
/mt/dim: line 50: /root/.dimrc: No such file or directory


