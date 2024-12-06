Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75AA7E77173
	for <intel-xe@archiver.kernel.org>; Fri,  6 Dec 2024 05:04:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F6B610E3D1;
	Fri,  6 Dec 2024 05:04:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hhkiBTMc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA2810E3CD
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Dec 2024 05:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733461440; x=1764997440;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oUzq5uamutz98ii7jiO0w3XuzXY0lc2DsGS1BG46aC0=;
 b=hhkiBTMcG4IJxyu6in2F7mY29RsDE2iFE7HqvzmsqoVX/n2hbg+IaLT5
 7ln19X/nrEbEDxzD94A41EAGv4S21cZerZz6CiR8SKqBLa/1aPCkxm2s7
 WCjgsCfdI0rxUmnCTnQ4WW+Qwo7mTOebt0Ixrs8lFdgwrE27f9m6XvpBB
 C5HpY80Y/15+q6l2RT7u+15fU4NEWtUVwfToFh2WaHJX1y8YkAK7UjMTK
 cmln5s7YaK9ZAxv9IHofUaJfF6nN6efvvPI8rEjxfnTLyEjB+1OQ9scHs
 pMS3xEYF3EcrYwCStuZQ2vlA3rzulMhOj4qSeV48zqeLONWmwpxZD4z90 A==;
X-CSE-ConnectionGUID: b2FO87qoSWWsgl7r8PfvNw==
X-CSE-MsgGUID: RhftdvguQ7Gmwo+8aNysjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="21395868"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; d="scan'208";a="21395868"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 21:04:00 -0800
X-CSE-ConnectionGUID: y1ZBXbzZSE6FelluarfMzQ==
X-CSE-MsgGUID: FhOb1Py1RUqsgebgUHAzbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; d="scan'208";a="94169848"
Received: from jdoman-desk1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.108.215])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 21:03:59 -0800
Date: Thu, 5 Dec 2024 23:03:53 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org, 
 Jonathan Cavitt <jonathan.cavitt@intel.com>, ashutosh.dixit@intel.com
Subject: Re: [PATCH 2/5] drm/xe/reg_sr: Write all whitelist slots
Message-ID: <35jeivufoznmdg7f6t3wq5iokm2excmtlaetqtqu5uzccz3asr@oibm337ycng3>
References: <20241205182240.3463027-1-lucas.demarchi@intel.com>
 <20241205182240.3463027-3-lucas.demarchi@intel.com>
 <20241205192545.GC3224633@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20241205192545.GC3224633@mdroper-desk1.amr.corp.intel.com>
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

On Thu, Dec 05, 2024 at 11:25:45AM -0800, Matt Roper wrote:
>On Thu, Dec 05, 2024 at 10:22:37AM -0800, Lucas De Marchi wrote:
>> Currently if there's 1 whitelisted register in the engine, on slot is
>> written with that register and all the others are written to a sane
>> value. For the free slots, there's no reason to change the behavior
>> if there are 0, 1 or slots occupied. If the default value from HW is not
>> trusted, all values should be written to.
>>
>> Also, later on all values are passed to GuC via ADS to be restored on
>> engine reset, so make sure they are also written to when probing the
>> device.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>I don't think it really matters too much one way or another.  There's no
>enabled/disabled setting for the force_to_nonpriv registers so we
>replace the hardware-defined "garbage" value with our own "garbage"
>value for the ununsed entries, but what really matters are the ones that
>are set.
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

see cover letter... if it doesn't matter where I argue we should drop
the paranoia. If it doesn't mattter, I'd rather go the other way.

Lucas De Marchi

>
>> ---
>>  drivers/gpu/drm/xe/xe_reg_sr.c | 3 ---
>>  1 file changed, 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
>> index c13123008e903..f982c1cdb369c 100644
>> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
>> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
>> @@ -204,9 +204,6 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
>>  	unsigned int slot = 0;
>>  	unsigned int fw_ref;
>>
>> -	if (xa_empty(&sr->xa))
>> -		return;
>> -
>>  	drm_dbg(&xe->drm, "Whitelisting %s registers\n", sr->name);
>>
>>  	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>> --
>> 2.47.0
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
