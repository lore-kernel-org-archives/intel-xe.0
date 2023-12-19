Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8EEC41535
	for <intel-xe@archiver.kernel.org>; Tue, 19 Dec 2023 16:37:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A9A910E0F3;
	Tue, 19 Dec 2023 16:37:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9985410E0F3
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Dec 2023 16:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703003870; x=1734539870;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wRRKMAVY6eToK4uNyuJr/9+HDniUVE5H/r/o4/ReL3g=;
 b=AeqSgXSwTD6PAmXNBlBBRM4Ljk2gSC91NgGKUNxVE6sIq6oaSxWwZSoS
 aIBPh59DQlaMeQJpw5US1MTHCN6xztrEchZ25KugwZV2IpuK1Z1Q+UvXB
 Iwe791kuasaQdd8VJqU7IrpH3MCSf3lqluPWnuD9aX5P29HzOuvVGZSwG
 M1bo6+sPnw34vIYxeCkGTiJcqZq2oL/BlukvAmkWGtquXyN0Km7C0Mzab
 YjuBMYNIKdPoyVHUtx7UpONXOgKx+fdu8RivGmCWdORzMMjapTh2fEws5
 Dh5NdzrB532RBncBimdbZMxeoyY4x2ze4IvDg/AnDFbNdvgsXz8FP5NFg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="375833864"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; d="scan'208";a="375833864"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 08:37:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; d="scan'208";a="17930559"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa001.fm.intel.com with ESMTP; 19 Dec 2023 08:37:47 -0800
Received: from [10.249.146.116] (unknown [10.249.146.116])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 6B4123784C;
 Tue, 19 Dec 2023 16:37:43 +0000 (GMT)
Message-ID: <52786e3f-519c-4c30-94e6-c8b6b7b6c787@intel.com>
Date: Tue, 19 Dec 2023 17:37:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 00/10] Introduce GuC Doorbells Manager
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20231218190629.502-1-michal.wajdeczko@intel.com>
 <4f98d3d5-5d8c-a173-bd15-195d062f6ba5@linux.intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <4f98d3d5-5d8c-a173-bd15-195d062f6ba5@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 19.12.2023 16:33, Thomas Hellström wrote:
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
> These kunit changes are neither motivated nor very well described in the
> cover letter, nor do they align well with the series titles. Those
> should've been posted as a separate series?

Agree that some changes could be sent as separate series, but I also
must admit that it was easier to send them together to show how these
changes to logging and kunit fit into new DBM code and the DBM test.

But in the future I will try to split series more aggressively.

Thanks,
Michal

> 
> /Thomas
> 
>>   drivers/gpu/drm/xe/.kunitconfig               |   5 +
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
