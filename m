Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC283C36010
	for <intel-xe@archiver.kernel.org>; Fri, 11 Apr 2025 14:38:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2EBB10EBD3;
	Fri, 11 Apr 2025 14:38:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ncIfCmA4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B540210EBD3
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Apr 2025 14:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744382321; x=1775918321;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=pDViAReEWkmZLGcVpcGqL6xdIWkwK7BNxoHIgKlVC48=;
 b=ncIfCmA4hbskE36NFL+Bf0NmtKd5QQ9qP16RZSekS/2PviP5Y6JEH0OL
 TsdAPtnSc5MIt0s5Su/QfNbKLw0a///FqJmlgojvOAe/7mhWkD7/OiG7G
 AAPExPMrboZt5JBhNgzStAO4Xfx2bx+j6Hpq0E9G733kAg3K24DUSWLCw
 TxYBwgQLtuuvCVna1OprJs/mhSNiWftWBNmXFmtpI5B/haF+g1dCQZ5Ba
 YEmz3LBGnu40gaqoikUgfV5woHfGqzH1rIkUYWzfFljIs19qImHzXyEE4
 VCLlmUeLCGsffHn6Kb6g1Ws/vd1ufZmoU+KmPgChPSzzoHk2DPUtak03g w==;
X-CSE-ConnectionGUID: oUBWcOuPRgSoTZtwKhoctw==
X-CSE-MsgGUID: EwfHwP1gSNSM4ji5cUJubg==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="56118712"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="56118712"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 07:38:19 -0700
X-CSE-ConnectionGUID: 1UPJPcADSfausJAO1QKccQ==
X-CSE-MsgGUID: m89nF4YMQxuUqyy23mFU8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="130049179"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa009.fm.intel.com with ESMTP; 11 Apr 2025 07:38:17 -0700
Received: from [10.245.96.73] (mwajdecz-MOBL.ger.corp.intel.com [10.245.96.73])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 9F26D34918;
 Fri, 11 Apr 2025 15:38:16 +0100 (IST)
Message-ID: <55fcfe89-2eb2-48bc-93f9-bb02109097bd@intel.com>
Date: Fri, 11 Apr 2025 16:38:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe/guc: Add LFD format output for guc log
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20250327234028.249314-1-zhanjun.dong@intel.com>
 <20250327234028.249314-2-zhanjun.dong@intel.com>
 <Z+YaCmivtd1Wa9wU@lstrano-desk.jf.intel.com>
 <ce6d3489-ee79-4834-b4be-1c5a590d682d@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ce6d3489-ee79-4834-b4be-1c5a590d682d@intel.com>
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



On 03.04.2025 17:20, Dong, Zhanjun wrote:
> Please see my inline comments below.
> 
> Regards,
> Zhanjun Dong
> 
> On 2025-03-27 11:39 p.m., Matthew Brost wrote:
>> On Thu, Mar 27, 2025 at 04:40:27PM -0700, Zhanjun Dong wrote:
>>> Add new debugfs entry "guc_log_lfd", which supports output guc log
>>> in LFD(Log Format Descriptors) format.
>>>
>>
>> Not a full review - but couple of drive by comments.
>>

...

>>> +
>>> +/** Log Init Config KLV IDs. */
>>> +enum guc_log_lic_type_t {
>>
>> '_t' suffix isn't used in the Xe style as typically is used for typedefs
>> which are frowned upon in upstream Linux. I'd drop "_t" suffix
>> everywhere.
> 
> I agree _t is not Xe style, while for this case, the ABI header file is
> follows with GuC spec, which is a cross system/project thing. The name
> here is the secondary defines.
> I guess simply follows orginal spec will make things more easy to
> compare and reduce possible mismatches among systems.
> 

I was also requesting to drop the _t suffix, so it's not just Matt voice

also please note that the raw GuC spec is not based on some solid ISO
standard that we should use as a role model, so blindly following what
was written there is not exactly the right choice

and while comparing spec you can easily drop _t suffix (that shouldn't
be there in first place)


