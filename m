Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2BEC5AD49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 13:19:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA86710EAA7;
	Fri,  6 Jun 2025 13:19:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K75L8at4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B84510EA9E
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 13:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749215956; x=1780751956;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Mxdr/8KKrmTyA0BpLvYsmSx1pAc+Hej4j2iz/ubJqH4=;
 b=K75L8at4C3Y2XciwNJyLGX17CXCCJB7MgHTzml63f0Uuu2k9H8iVk0zv
 ZdZWmkxVWEqFke2gnwOf1XUBXFxnmG4bPyMfM94wjTrC39cD5K07MFZ/W
 fGCIm7HkgJsQ4aVfsKeCfW1DV+7/ok6DqGFALFDo3xUKCVFF/uDBWHxfK
 BBZScNOGRQJ1qpKPftRBlhn9frL0X1t+DHb4fSmpY3+ns/hDzy2yrUCy8
 inTI5VTX3Z3NzT1TMVquPubih6gVYWUJUqt0rrrxoTudnNqb0Zv4Ysz/8
 izoncqAw+CsXI6vbSvlWHm8pPKSoiS+LEzO42hSscxEScUNhYFHcFrs1f g==;
X-CSE-ConnectionGUID: LOgtUX+fRUOWlwPyM3Uv+Q==
X-CSE-MsgGUID: 5nvHqFRSS76szigUip/DZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="55156738"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="55156738"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 06:19:16 -0700
X-CSE-ConnectionGUID: Em+/KeBjQJyItmwNvz4kYA==
X-CSE-MsgGUID: bNlCxppkSUWVsxmfau5uDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="146786415"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.33])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 06:19:16 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: John Harrison <john.c.harrison@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>, intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v6] drm/xe: Add helper function to inject fault into
 ct_dead_capture()
In-Reply-To: <a0c92aa2-ed7d-41f0-8d7c-b66b36be3fa7@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250524144613.11970-1-satyanarayana.k.v.p@intel.com>
 <a0c92aa2-ed7d-41f0-8d7c-b66b36be3fa7@intel.com>
Date: Fri, 06 Jun 2025 16:19:12 +0300
Message-ID: <ff47692cc6c70d10b3e58cf68e6d70ef79ebd997@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 05 Jun 2025, John Harrison <john.c.harrison@intel.com> wrote:
> On 5/24/2025 7:46 AM, Satyanarayana K V P wrote:
>> When injecting fault to xe_guc_ct_send_recv() & xe_guc_mmio_send_recv()
>> functions, the CI test systems are going out of space and crashing. To
>> avoid this issue, a new helper function is created and when fault is
>> injected into this xe_inject_fault() helper function, ct dead capture
>> is avoided which suppresses ct dumps in the log.
>>
>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>> Suggested-by: John Harrison <John.C.Harrison@Intel.com>
> Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
>
> This seems like the simplest and cleanest solution to me (for both the 
> KMD and the IGT sides). I don't know if Jani or Michal still have 
> objections to it.

Simple it may be, but I still think it conflates two orthogonal things
that should both be decided by userspace.

If userspace wants error injection, why should the kernel decide it
means no error capture in dmesg? Especially when that decision is to
tackle an arbitrary self-inflicted *userspace* issue i.e. disk space
limitation during testing.

Mechanism, not policy.

There, I've said it, but this is not a hill I'm going to die on.


BR,
Jani.


-- 
Jani Nikula, Intel
