Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58924CCF2D6
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 10:08:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2FD210E14F;
	Mon, 19 Oct 2026 10:08:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF7D10E14F
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Oct 2026 10:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792404519; x=1823940519;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=we/U60m7GJnIBFBm5j+i1dEhulgFjSwMEI+jcj6bIYo=;
 b=JVgAlr23175Mfm1ZhO/H40BPpq3bWF5hy0hHkORU4ZIAq1DLCV69yEW7
 UpGbuBvaXMYPlBgJfRRDdRSx1w1VHq1G/UgtgGUsGAIVsYJOJCCrEFEi9
 6W0/nBVoaxYNC2qXhev3FZlJ/bKA3u/7mD9kKX1+MQmOgSoY0v8JZyM5c
 /ExZbKHr+0FvUqtfMO62hndHWcusmIUICaqjORF5+4XhmGUavEK5Og8+a
 HGY+mx0p/rNMhv+C9Qiq5azUxYM2hbjeYna4BZybplBPVTLftYBJfpjmC
 OMpBPFrd3onEFuOF4sYCzqlu5P75aDqvWw6wwZl05HzGUBvv1N7WPjIWt Q==;
X-CSE-ConnectionGUID: c+pvGV8TQ/ayX2dJ+EXL8g==
X-CSE-MsgGUID: b2+WYtBnR9mpENtG8l77fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="988348"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="988348"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 03:08:38 -0700
X-CSE-ConnectionGUID: UE553QtkRcKEezdLJxQT3w==
X-CSE-MsgGUID: ToKN+RmqSoCT8sBLacO95g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2902044"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO [10.245.245.245])
 ([10.245.245.245])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 03:08:36 -0700
Message-ID: <69d9e989-67a7-415b-9433-05df2bf8bad7@intel.com>
Date: Mon, 19 Oct 2026 11:08:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [1/3] drm/xe: Toggle the D3Cold enable flag at runtime resume
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 "Poosa, Karthik" <karthik.poosa@intel.com>, intel-xe@lists.freedesktop.org
References: <20261015165451.154495-6-vinay.belgaumkar@intel.com>
 <553c4753-6c38-471b-8e3a-c6b8c4407e29@intel.com>
 <7f92dbae-5b66-4fe0-9dcc-6cd2e2d5a4f0@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <7f92dbae-5b66-4fe0-9dcc-6cd2e2d5a4f0@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 16/10/2026 19:35, Belgaumkar, Vinay wrote:
> 
> On 10/16/2026 11:23 AM, Poosa, Karthik wrote:
>>
>> On 15-10-2026 22:24, Vinay Belgaumkar wrote:
>>> We enable this flag during runtime suspend,
>> i think there should be Fixes tag for this.
>>
>> Fixes: f026520367be ("drm/xe: Only set PCI d3cold_allowed when we are 
>> really allowing.")
> ok.
>>
>>> need to set it back to
>>> false early during resume to prevent any race with pci driver.
>> What is race that seen without this ?
> 
> While D0 is being programmed in xe_pci_runtime_resume(), pci driver's 
> internal auto suspend timer could expire and, since this d3cold flag is 
> still true, pci driver could try to put vsp into D3. This is probably 

I think needs more info here? We are in the RPM resume callback at this 
stage (RESUMING), so surely we are holding the required usage_count refs 
etc here, so how can it enter D3 here?


> why we toggle this flag as the very first thing in the S3 resume 
> function xe_pci_resume().
> 
> Thanks,
> 
> Vinay.
> 
>>>
>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_pci.c | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>> index 57c6f778ca24..2269e51868c1 100644
>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>> @@ -1450,6 +1450,9 @@ static int xe_pci_runtime_resume(struct device 
>>> *dev)
>>>       struct xe_device *xe = pdev_to_xe_device(pdev);
>>>       int err;
>>>   +    if (xe->d3cold.allowed)
>>> +        d3cold_toggle(pdev, D3COLD_DISABLE);
>>> +
>>>       err = pci_set_power_state(pdev, PCI_D0);
>>>       if (err)
>>>           return err;

