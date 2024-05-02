Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 007EAC4345F
	for <intel-xe@archiver.kernel.org>; Thu,  2 May 2024 09:24:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E8D810E186;
	Thu,  2 May 2024 09:24:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h8tNvSqN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E30D10E186
 for <intel-xe@lists.freedesktop.org>; Thu,  2 May 2024 09:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714641881; x=1746177881;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JSp+wMN2pAL5xWPbmWnTGEfdgrOVEu8AP05iN8GGZ3g=;
 b=h8tNvSqNKJqaU58/s5yJON5naTfUbujUQbrwPo7eFEXV76myzUEuTvpj
 dWPTkQ9tuuILQhM1Cm1Hi/O4ezpGuw8U2fsHpyBgJZO3CvrtnNfXH7a8s
 V25B8GyGQEUq4LSsFP7ub3L6ipkuSaginpuNyt2vIkw1rC6L1FlWPfI/y
 lAFSz7K+IH9er9ieOHZcwD6yvHxVbErYtY4v+2kNzMxOOPNmt9Jdx31SS
 jR/4z0dUCUHSHgcPZsO/gm/7IkNrLm+zCJSFg18b5GWgpw0xsnnxjoOmV
 ApOVjeJXpWfZdR6xvlMdcDiRnKiVzQUjW/C6lDxvubWZ1eo3gZjynZntl Q==;
X-CSE-ConnectionGUID: X5hwCEhaQU6ccu9aZsFIWA==
X-CSE-MsgGUID: 8jCTV0kmQQCScW1iTfD+Sw==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="14205524"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="14205524"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 02:24:41 -0700
X-CSE-ConnectionGUID: Bn+lqLOWRNu6osYr8onsWw==
X-CSE-MsgGUID: UVac4zdCQSORfhQZSWRewQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="64501979"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa001.jf.intel.com with ESMTP; 02 May 2024 02:24:39 -0700
Received: from [10.246.17.255] (unknown [10.246.17.255])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id D2FCD28775;
 Thu,  2 May 2024 10:24:37 +0100 (IST)
Message-ID: <6d79251d-574e-44f5-9aa5-6f5bc948da0e@intel.com>
Date: Thu, 2 May 2024 11:24:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Define generic helpers for manipulating macro
 arguments
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240501223221.2395-1-michal.wajdeczko@intel.com>
 <ZjM_vNXn9JmlzOkc@smile.fi.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ZjM_vNXn9JmlzOkc@smile.fi.intel.com>
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



On 02.05.2024 09:24, Andy Shevchenko wrote:
> On Thu, May 02, 2024 at 12:32:19AM +0200, Michal Wajdeczko wrote:
>> Michal Wajdeczko (2):
>>   args.h: add more helpers for manipulating macro arguments
>>   drm/xe/rtp: Prefer helper macros from args.h
>>
>>  drivers/gpu/drm/xe/xe_rtp.h         |   4 +-
>>  drivers/gpu/drm/xe/xe_rtp_helpers.h |  26 +++----
>>  include/linux/args.h                | 103 ++++++++++++++++++++++++++++
>>  3 files changed, 115 insertions(+), 18 deletions(-)
> 
> It's good in general to have the code being deduplicated, but the above
> statistics is a bit scary. 

The statistics here might be little blurred due to added documentation.
Without documentation this would look a little better:

 drivers/gpu/drm/xe/xe_rtp.h         |  4 ++--
 drivers/gpu/drm/xe/xe_rtp_helpers.h | 26 ++++++++++----------------
 include/linux/args.h                | 26 ++++++++++++++++++++++++++
 3 files changed, 38 insertions(+), 18 deletions(-)

> Do we have more users where we indeed make code much
> nicer? 

A new user (still inside Xe driver) for these macro is on it's way, but
before that I wanted to start with a preparation step and promote any
generic helpers to the outside of the Xe driver, as it was pointed in
similar case with other helper macro [1]

[1] https://patchwork.freedesktop.org/patch/578134/?series=129854&rev=1

> If not, let's keep these where it belongs to for now.
> 

If this proposal didn't get any traction, which won't surprise me based
on outcome of [2], then at least I would have some ground for creating a
local xe_args.h or use xe_macros.h as a location for common args macros.

[2]
https://lore.kernel.org/lkml/20240214214654.1700-1-michal.wajdeczko@intel.com/
