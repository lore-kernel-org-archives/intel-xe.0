Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D4FDC46CA2
	for <intel-xe@archiver.kernel.org>; Tue, 19 Dec 2023 16:34:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522C510E2B6;
	Tue, 19 Dec 2023 16:34:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0030710E2B6
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Dec 2023 16:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703003680; x=1734539680;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=UJpIuI1NEwcUN2hoF+pWa19aTB0y1c2m9Dw1djY5pdI=;
 b=AxRXNradY/xugfava0MSS7ljYaP17vRkCnlFblBN3AJIogOexyk9UbwD
 HUc6zlgC5mk+7Hqp7ifBCy6w1TCHVFCFY2KUcDo8aPydLPKmhIrVT1KgJ
 FioOYQi/lyS3bqMATNOqtpPXrr555pD7Y6R+kseo/5tBVDAgfk+c+r7oD
 dcExElRli2AemIb+1MA39dnB+dZwYI8CkdCjmqxlH0mHdwdKBCbDYFU2R
 nZofbXs1Upq+F85BBnDXWtS5VoGi1o45h9Bi4l1HWVQwe1tGP3y8K4ji2
 EDCwKSd+jKc00psyjIfzw5CX5gOoNxBn2PY4zK/XiS+ELHSLmnsehA4i8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="2780159"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="2780159"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 08:34:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="846397584"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; d="scan'208";a="846397584"
Received: from hasifnax-mobl1.gar.corp.intel.com (HELO [10.249.254.69])
 ([10.249.254.69])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 08:34:38 -0800
Message-ID: <ac5e8844-3115-ab66-7e14-3483e9c885ef@linux.intel.com>
Date: Tue, 19 Dec 2023 17:34:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH RESEND v5 00/10] Introduce GuC Doorbells Manager
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20231218190629.502-1-michal.wajdeczko@intel.com>
 <4f98d3d5-5d8c-a173-bd15-195d062f6ba5@linux.intel.com>
In-Reply-To: <4f98d3d5-5d8c-a173-bd15-195d062f6ba5@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 12/19/23 16:33, Thomas Hellström wrote:
> Hi, Michal,
>
> On 12/18/23 20:06, Michal Wajdeczko wrote:
>> Introduce simple GuC doorbells ID manager that will be used by the
>> PF driver for VFs provisioning and can later be used by submission
>> code once we are ready to switch from H2G based notifications to
>> doorbells mechanism.
>>
>> As preparation steps, improve existing logging and kunit code that
>> is used by the new code.
>>
>> v5: rename drm printfn helpers to follow the header name (Lucas)
>>
>> Michal Wajdeczko (10):
>>    drm/xe: Add GT oriented drm_printers
>>    drm/xe: Report TLB timeout using GT oriented functions
>>    drm/xe: Introduce GuC Doorbells Manager
>>    drm/xe/kunit: Set SR-IOV mode of the fake device
>>    drm/xe/kunit: Define helper functions to allocate fake xe device
>>    drm/xe/kunit: Restore test->priv when done with fake xe device
>>    drm/xe/kunit: Use xe kunit helper in RTP test
>>    drm/xe/kunit: Use xe kunit helper in WA test
>>    drm/xe/kunit: Enable CONFIG_LOCKDEP in tests
>>    drm/xe/kunit: Add GuC Doorbells Manager tests
>
> These kunit changes are neither motivated nor very well described in 
> the cover letter, nor do they align well with the series titles. Those 
> should've been posted as a separate series?
>
> /Thomas
>
After discussing on chat and since the series is already reviewed / acked:

Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


>> drivers/gpu/drm/xe/.kunitconfig               |   5 +
>>   drivers/gpu/drm/xe/Makefile                   |   4 +
>>   drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c | 201 ++++++++++++++
>>   drivers/gpu/drm/xe/tests/xe_kunit_helpers.c   |  90 ++++++
>>   drivers/gpu/drm/xe/tests/xe_kunit_helpers.h   |  17 ++
>>   drivers/gpu/drm/xe/tests/xe_pci.c             |   3 +
>>   drivers/gpu/drm/xe/tests/xe_pci_test.h        |   2 +
>>   drivers/gpu/drm/xe/tests/xe_rtp_test.c        |   5 +-
>>   drivers/gpu/drm/xe/tests/xe_wa_test.c         |   5 +-
>>   drivers/gpu/drm/xe/xe_gt_printk.h             |  44 +++
>>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   |  13 +-
>>   drivers/gpu/drm/xe/xe_guc_db_mgr.c            | 261 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_db_mgr.h            |  22 ++
>>   drivers/gpu/drm/xe/xe_guc_types.h             |  15 +
>>   drivers/gpu/drm/xe/xe_uc.c                    |   5 +
>>   15 files changed, 680 insertions(+), 12 deletions(-)
>>   create mode 100644 drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
>>   create mode 100644 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
>>   create mode 100644 drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_guc_db_mgr.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_guc_db_mgr.h
>>
