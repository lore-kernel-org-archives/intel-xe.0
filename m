Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55DAC36010
	for <intel-xe@archiver.kernel.org>; Fri, 11 Apr 2025 16:32:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2971010EC20;
	Fri, 11 Apr 2025 16:32:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZGx6bRLx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E43BE10EC20
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Apr 2025 16:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744389174; x=1775925174;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=50CksSxuhClQicuh7l03YOxVzeuLdMIAvjHhKTMEbEQ=;
 b=ZGx6bRLxB8Jo29m4I6tzvEex/91zlZymVFxzSikOCSfnTObbs8vj9UxG
 xccmf/R852jXTSgpn/Ss1GpoyT3O9r/05PgzLXDffry5Wfg1f/0Fv2aGQ
 Ui07wdSAIj3nkIwkPDFGupQVBfLLK6+fEHx1hopBCsl44IcOq8UpiRGLT
 ZKd/5UDtNO8bGwmRdR2gFFimgJfaoWhFvIFKC9F+kNTODscf7gaPZkZfX
 xdP+D4yLiMSKZaxaioJSzNPR716/cd7fSktKrOZsVaXriRdPJisFEzmGn
 RCls3iUcb/iJqmyUwl0rXCFUvwbDXf4dY2MjfzgH51OUhEQmj21FXVpfb A==;
X-CSE-ConnectionGUID: LeSH5MDhR+iq2qePsdnjmA==
X-CSE-MsgGUID: RxQmMbmCRVCzztNxuml1Pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="46111500"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="46111500"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 09:32:52 -0700
X-CSE-ConnectionGUID: hdH8DQiUR12qrCRM0+a5dg==
X-CSE-MsgGUID: yHuhskc6TricVZeeXwEgUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="134345656"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa004.fm.intel.com with ESMTP; 11 Apr 2025 09:32:51 -0700
Received: from [10.245.96.73] (mwajdecz-MOBL.ger.corp.intel.com [10.245.96.73])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id A010E3497A;
 Fri, 11 Apr 2025 17:32:49 +0100 (IST)
Message-ID: <6394d86d-9daf-4955-9262-8c6a83b996c6@intel.com>
Date: Fri, 11 Apr 2025 18:32:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/4] drm/xe/vf: Divide GGTT ballooning into allocation
 and insertion
To: "Lis, Tomasz" <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250409211340.3046931-1-tomasz.lis@intel.com>
 <20250409211340.3046931-2-tomasz.lis@intel.com>
 <9f2fd22b-a439-4e86-bb6e-9efe7944fe7f@intel.com>
 <8de5029e-cffc-4973-9c62-ff3683d38c9a@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <8de5029e-cffc-4973-9c62-ff3683d38c9a@intel.com>
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



On 11.04.2025 16:35, Lis, Tomasz wrote:
> 
> On 10.04.2025 18:54, Michal Wajdeczko wrote:
>> On 09.04.2025 23:13, Tomasz Lis wrote:

...

>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>>> index 7062115909f2..e7d474bd0cfe 100644
>>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>>> @@ -1,4 +1,4 @@
>>> -// SPDX-License-Identifier: MIT
>>> +/// SPDX-License-Identifier: MIT
>> what's this?
> happens when I have lagged connection to my dev machine. Will remove.

I really don't care when/how it was added

but it clearly shows that you don't check the diffs in patches before
sending them out and requesting a review

so asking again, please be more careful and mind the reviewers time

