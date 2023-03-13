Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15382C6FD19
	for <intel-xe@archiver.kernel.org>; Mon, 13 Mar 2023 12:47:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE0AA10E0E0;
	Mon, 13 Mar 2023 12:47:00 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DECA710E0E0
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Mar 2023 12:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678711618; x=1710247618;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9OVuIoGDPZSNDf0AkmodHO7b4MS7ZTI5TCm3U5DYcKE=;
 b=FFn81hST6ioWxdG3PELwURL6IgJCRiFsjECr3Wa8ACfFgWpBIAw8V1xP
 Gfps46ZZM11FrTIOPbO8Be93gPlSMWFo3wrfLsbFQBf+FnZZfwQtR9a0L
 UDyYAFJd+a+8P13ywas9wu0AC4fJdH9E/HufrAoRsCh1amCye9bhfSWFd
 ohvALsy6Rz8oyszi8l7o0q1pQQIAWq3tjg78q7PTu/y+r/jYNPw5GLpP8
 eUfLk8wGxhpOBdYxWv6DCFe/VbZEZV/rbDDcgiCpAhQUgAxb+nCXyOE7q
 P33RzAgvFYA9VU9yFSy+qtx1e+Hn8BnrUQf8U8O9fAsBErp8qINJyRwWJ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="364797624"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; d="scan'208";a="364797624"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 05:46:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="655963066"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; d="scan'208";a="655963066"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga006.jf.intel.com with ESMTP; 13 Mar 2023 05:46:57 -0700
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.252.24.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 1F729580C25;
 Mon, 13 Mar 2023 05:46:56 -0700 (PDT)
Date: Mon, 13 Mar 2023 13:46:54 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <20230313134654.6f146a8c@maurocar-mobl2>
In-Reply-To: <20230313081316.2408-1-michal.wajdeczko@intel.com>
References: <20230313081316.2408-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 0/5] RFC: Introduce new selftests framework
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, 13 Mar 2023 09:13:11 +0100
Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:

> Existing solution to support live testing has many limitations.
> With proposed here framework we can live test every new bound device
> and use same style for both mock and live tests of Xe, GT or GuC.
> 
> Also Kunit parsing works better (which might be needed by our CI).
> 
> And with little more effort, patches pending, we can add support for
> rerunning tests on selected device or filtering tests to be executed.
> 
> This new framework can coexist with any other default kunit tests and
> any currently available live tests implemented as separate module.

I did some comments to patch 1/5.

For patches 2 to 5: they LGTM. Feel free to add:
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org> # for patches 2 to 5

> 
> Sample output from mock run:
> 
> [ ] Starting KUnit Kernel (1/1)...
> [ ] ============================================================
> [ ] ================= device_mock (2 subtests) =================
> [ ] [PASSED] test_basic
> [ ] [PASSED] test_to_gt
> [ ] =================== [PASSED] device_mock ===================
> [ ] =================== gt_mock (2 subtests) ===================
> [ ] [PASSED] test_basic
> [ ] [PASSED] test_to_xe
> [ ] ===================== [PASSED] gt_mock =====================
> [ ] =================== guc_mock (1 subtest) ===================
> [ ] [PASSED] test_basic
> [ ] ==================== [PASSED] guc_mock =====================
> [ ] ================= guc_ct_mock (1 subtest) ==================
> [ ] [PASSED] test_basic
> [ ] =================== [PASSED] guc_ct_mock ===================
> [ ] ============================================================
> [ ] Testing complete. Ran 6 tests: passed: 6
> 
> Sample output from live run with "dut_filter=*"
> 
> [ ] ============================================================
> [ ] ================= device_live (2 subtests) =================
> [ ] [PASSED] test_to_gt
> [ ] [PASSED] test_guc_submission_enabled
> [ ] =================== [PASSED] device_live ===================
> [ ] =================== gt_live (2 subtests) ===================
> [ ] [PASSED] test_gt_info
> [ ] [PASSED] test_gt_is_not_media_type
> [ ] ===================== [PASSED] gt_live =====================
> [ ] ================== guc_live (2 subtests) ===================
> [ ] [PASSED] test_guc_fw
> [ ] [SKIPPED] test_guc_rejects_unknown_action
> [ ] ==================== [PASSED] guc_live =====================
> [ ] =================== ct_live (2 subtests) ===================
> [ ] [PASSED] test_ct_not_broken
> [ ] [PASSED] test_ct_rejects_unknown_action
> [ ] ===================== [PASSED] ct_live =====================
> [ ] ============================================================
> [ ] Testing complete. Ran 8 tests: passed: 7, skipped: 1
> 
> Sample raw output from live run with "anonymous_dut=1"
> 
> [ ] [drm] Initialized xe 1.1.0 20201103 for 0000:00:02.0 on minor 0
> [ ]     # device_live: DUT 0000:00:02.0
> [ ]     # Subtest: device_live
> [ ]     1..2
> [ ]     ok 1 - test_to_gt
> [ ]     ok 2 - test_guc_submission_enabled
> [ ] # device_live: pass:2 fail:0 skip:0 total:2
> [ ] # Totals: pass:2 fail:0 skip:0 total:2
> ...
> 
> Sample raw output from live run with "anonymous_dut=0"
> 
> [ ]     # device_live:     # failed to initialize (-25)
> [ ] not ok 1 - device_live
> ...
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> 
> Michal Wajdeczko (5):
>   drm/xe: Introduce new selftests framework
>   drm/xe: Initial selftests for xe_device
>   drm/xe: Initial selftests for xe_gt
>   drm/xe: Initial selftests for xe_guc
>   drm/xe: Initial selftests for xe_guc_ct
> 
>  drivers/gpu/drm/xe/Kconfig.debug              |  22 ++++
>  drivers/gpu/drm/xe/Makefile                   |  11 ++
>  .../selftests/live/xe_device_live_selftest.c  |  39 ++++++
>  .../xe/selftests/live/xe_gt_live_selftest.c   |  40 ++++++
>  .../selftests/live/xe_guc_ct_live_selftest.c  |  52 ++++++++
>  .../xe/selftests/live/xe_guc_live_selftest.c  |  54 ++++++++
>  .../selftests/mock/xe_device_mock_selftest.c  |  41 ++++++
>  .../xe/selftests/mock/xe_gt_mock_selftest.c   |  40 ++++++
>  .../selftests/mock/xe_guc_ct_mock_selftest.c  |  31 +++++
>  .../xe/selftests/mock/xe_guc_mock_selftest.c  |  30 +++++
>  drivers/gpu/drm/xe/selftests/xe_selftests.h   |  35 ++++++
>  .../gpu/drm/xe/selftests/xe_selftests_auto.c  |  46 +++++++
>  .../drm/xe/selftests/xe_selftests_executor.c  | 118 ++++++++++++++++++
>  .../drm/xe/selftests/xe_selftests_helpers.c   | 101 +++++++++++++++
>  .../drm/xe/selftests/xe_selftests_internal.h  |  22 ++++
>  .../gpu/drm/xe/selftests/xe_selftests_mock.c  |  32 +++++
>  .../drm/xe/selftests/xe_selftests_params.c    |  23 ++++
>  drivers/gpu/drm/xe/xe_device.c                |   6 +
>  drivers/gpu/drm/xe/xe_gt.c                    |   6 +
>  drivers/gpu/drm/xe/xe_guc.c                   |   6 +
>  drivers/gpu/drm/xe/xe_guc_ct.c                |   6 +
>  drivers/gpu/drm/xe/xe_module.c                |   2 +
>  22 files changed, 763 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/selftests/live/xe_device_live_selftest.c
>  create mode 100644 drivers/gpu/drm/xe/selftests/live/xe_gt_live_selftest.c
>  create mode 100644 drivers/gpu/drm/xe/selftests/live/xe_guc_ct_live_selftest.c
>  create mode 100644 drivers/gpu/drm/xe/selftests/live/xe_guc_live_selftest.c
>  create mode 100644 drivers/gpu/drm/xe/selftests/mock/xe_device_mock_selftest.c
>  create mode 100644 drivers/gpu/drm/xe/selftests/mock/xe_gt_mock_selftest.c
>  create mode 100644 drivers/gpu/drm/xe/selftests/mock/xe_guc_ct_mock_selftest.c
>  create mode 100644 drivers/gpu/drm/xe/selftests/mock/xe_guc_mock_selftest.c
>  create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests.h
>  create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_auto.c
>  create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_executor.c
>  create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_helpers.c
>  create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_internal.h
>  create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_mock.c
>  create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_params.c
> 
