Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABABCF2576
	for <intel-xe@archiver.kernel.org>; Sun, 13 Oct 2024 12:41:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF5610E180;
	Sun, 13 Oct 2024 12:41:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bFutzYBB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4AB810E180
 for <intel-xe@lists.freedesktop.org>; Sun, 13 Oct 2024 12:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728823270; x=1760359270;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=TaCcKeOSrh5WR1zcRTYTlaAHcc7gzcn/ErnX6O54Qdo=;
 b=bFutzYBBGf/M7xAeI8Dbiv1bDeJLYUOtUG31EHFYP8cEHRVY9QBHBzGa
 bkrbi8s1Kqwc8iDv6/k9dweN3Of8zuUQ5DRz8UgCTbs3e5B9OZg9RY6o4
 QNZRyKeCi7UdfsvFlsEPUGPTNiy6UR0MgtMGqKcN+uA0tJSOyjBCFeKdJ
 b56HsFfCLcNY7Jh1oRC9Ix4xGyWoAJsxcTsCOfr/AvNhsQVHspDpoANE9
 51K9u6lH0W5WaDLgLvYpEHcghV/rtmAGqhQgXwjTqoPrYphHQ1ex1Fbt2
 9fGA/GSa08CCIu/YoFSOh8WneCigMcQZ76JtX/LnuhJ3/G96FYkZWtUxw w==;
X-CSE-ConnectionGUID: UKjurkGMQsmQVxlGd17vuA==
X-CSE-MsgGUID: thnLlvhuTWqiaGCXi1kMjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="39551402"
X-IronPort-AV: E=Sophos;i="6.11,200,1725346800"; d="scan'208";a="39551402"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2024 05:41:10 -0700
X-CSE-ConnectionGUID: JCpVbZltT46G+HcRFNOf4g==
X-CSE-MsgGUID: xnbK8VZ/QwqtxSKqOHHrJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,200,1725346800"; d="scan'208";a="78155316"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa008.jf.intel.com with ESMTP; 13 Oct 2024 05:41:08 -0700
Received: from [10.246.19.248] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.19.248])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 60C15284ED;
 Sun, 13 Oct 2024 13:41:07 +0100 (IST)
Message-ID: <bd9acb70-b774-46b8-9f6e-40cb5205f3d9@intel.com>
Date: Sun, 13 Oct 2024 14:41:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] GuC Buffer Cache
To: Matthew Brost <matthew.brost@intel.com>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20241009172125.1539-1-michal.wajdeczko@intel.com>
 <ZwnYnZQQZm5jtpWL@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ZwnYnZQQZm5jtpWL@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 12.10.2024 04:02, Matthew Brost wrote:
> On Wed, Oct 09, 2024 at 07:21:20PM +0200, Michal Wajdeczko wrote:
>> Michal Wajdeczko (5):
>>   drm/xe/guc: Introduce the GuC Buffer Cache
>>   drm/xe/kunit: Allow to replace xe_managed_bo_create_pin_map()
>>   drm/xe/kunit: Add KUnit tests for GuC Buffer Cache
>>   drm/xe/pf: Prepare GuC Buffer Cache for PF-only actions
>>   drm/xe/pf: Use GuC Buffer Cache during VFs provisioning
>>
>>  drivers/gpu/drm/xe/Makefile                 |   1 +
>>  drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c | 450 ++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_bo.c                  |   4 +
>>  drivers/gpu/drm/xe/xe_gt.c                  |   6 +
>>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c         |  32 ++
>>  drivers/gpu/drm/xe/xe_gt_sriov_pf.h         |   6 +
>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c  |  67 +--
>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h   |   4 +
>>  drivers/gpu/drm/xe/xe_guc_buf.c             | 391 +++++++++++++++++
>>  drivers/gpu/drm/xe/xe_guc_buf.h             |  48 +++
>>  drivers/gpu/drm/xe/xe_guc_buf_types.h       |  40 ++
>>  11 files changed, 1017 insertions(+), 32 deletions(-)
> 
> See my comment in patch #1, please explore if that suggestion works.

already tried but it didn't work, hence this new code

> Nearly 1000+ new lines code needs to be carefully considered if this is
> required. IMO we really want avoid bloating Xe unless this has strong
> justification.

my bad, I missed to refer to [1] where it was pointed that PF should
avoid doing any memory allocations during resume/reset and with this new
cache in patch 5/5 PF is now able to do VFs re-provisioning (which uses
H2G CTB with indirect data) without any allocations

[1]
https://lore.kernel.org/intel-xe/3e13401972fd49240f486fd7d47580e576794c78.camel@intel.com/

> 
> Matt
> 
>>  create mode 100644 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
>>  create mode 100644 drivers/gpu/drm/xe/xe_guc_buf.c
>>  create mode 100644 drivers/gpu/drm/xe/xe_guc_buf.h
>>  create mode 100644 drivers/gpu/drm/xe/xe_guc_buf_types.h
>>
>> -- 
>> 2.43.0
>>

