Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 184D9CAC5AA
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 21:37:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA83910E231;
	Tue, 17 Sep 2024 21:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nsthPHYl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B8E10E231
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 21:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726609074; x=1758145074;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=O4B5kkoYwW+xc8qvDjvPgMhVA31vdkEPe7gTlqAaVrs=;
 b=nsthPHYl4A0En23uPHVxkDwLyzLJC+C1pFIX5OImD1BKmhSlQDtJ2jg0
 SzKzKMJY8pAdG8KXvLwVpGSmxNyCu0KrC8Jig+gprzrN2yEG5HtFHnfXe
 +0zUYVVlSYNfTwqq6IK12btrlUSEMdLYZW2bnpEaG7H+DIUIbW1WyWnvF
 o8f30WoaV7yTLuGH4Lv9Kmx4imL8E6nFIu/UNrJ1ZpDBZJyKT9qQKiTVh
 WRDjNBftmXj2WiOKI0IE3tGwzHU3CzWpLT1JbvwTttJvWjtc99P1+4Ndp
 w4lUdWp0OpyesuIGQQuSEAdkGvPWZfWbYvEIonufnv3j0Fj4opAiYD5yD g==;
X-CSE-ConnectionGUID: VTLhersYREmnz4Z57ZFbFg==
X-CSE-MsgGUID: vnXVwIQSQnmy8EmcrHQ4ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="24980608"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="24980608"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 14:37:53 -0700
X-CSE-ConnectionGUID: ObPL0TMlTNStXa0XLhytSw==
X-CSE-MsgGUID: LhMRmeFHQxGGCnYeMC/jyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="69645268"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO [10.245.245.78])
 ([10.245.245.78])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 14:37:52 -0700
Message-ID: <02239a29-9b72-42ee-86e9-7b0a1e0f95a1@linux.intel.com>
Date: Tue, 17 Sep 2024 23:37:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Restore pci state upon resume
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240912190530.435976-1-rodrigo.vivi@intel.com>
 <5o4xl2avzkdnbecni3vg7fmtiw5lfr2ohuz3o6vdfqzjmkdmia@pd7naq6fa42l>
 <ZuNbKM6-oiJUIR4Y@intel.com>
 <a2zmirx4ymwjxrnh6ytkia7fq7izrz4cha4rqtzt7t5247ln5x@crcltza2zs3h>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <a2zmirx4ymwjxrnh6ytkia7fq7izrz4cha4rqtzt7t5247ln5x@crcltza2zs3h>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hey,

Den 2024-09-12 kl. 23:40, skrev Lucas De Marchi:
> On Thu, Sep 12, 2024 at 05:20:40PM GMT, Rodrigo Vivi wrote:
>> On Thu, Sep 12, 2024 at 03:11:12PM -0500, Lucas De Marchi wrote:
>>> On Thu, Sep 12, 2024 at 03:05:30PM GMT, Rodrigo Vivi wrote:
>>> > The pci state was saved, but not restored. Restore
>>> > right after the power state transition request like
>>> > every other driver.
>>> >
>>> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>>>
>>> oh, no
>>>
>>> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> > ---
>>> > drivers/gpu/drm/xe/xe_pci.c | 2 ++
>>> > 1 file changed, 2 insertions(+)
>>> >
>>> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>> > index 5ba4ec229494..6d29ef4b396f 100644
>>> > --- a/drivers/gpu/drm/xe/xe_pci.c
>>> > +++ b/drivers/gpu/drm/xe/xe_pci.c
>>> > @@ -949,6 +949,8 @@ static int xe_pci_resume(struct device *dev)
>>> >     if (err)
>>> >         return err;
>>> >
>>> > +    pci_restore_state(pdev);
>>> > +
>>>
>>> something bad happened... I was sure this line was here before. Indeed.
>>> git log -L:xe_pci_resume:drivers/gpu/drm/xe/xe_pci.c to the rescue
>>>
>>> See commit f6761c68c0ac ("drm/xe/display: Improve s2idle handling.")
>>
>> hmmm...
>> Perhaps
>>
>> Fixes: f6761c68c0ac ("drm/xe/display: Improve s2idle handling.")
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>
>> then?!
> 
> yes, reading that patch I don't understand why it got removed.
> 
> Lucas De Marchi
Likely a conflict from rebasing, sorry for the noise!
> 
>>
>> The restoration shouldn't have anything to do with that case.
>> and it pairs with pci_save_state(pdev) is still there...
>>
>> It is not in i915, but I have an i915 patch to add the restore
>> there as well.
>>
>> Also, I might as well in a follow up bring back the
>> pci_set_power_state(pdev, PCI_D3hot) to Xe.
>> This is probably the right way, aligns with all other drivers
>> and i915. So that shouldn't be the cause of the power drainage
>> on suspend anyway, or i915 would be also draining it.
>>
>>>
>>> Lucas De Marchi
>>>
>>> >     err = pci_enable_device(pdev);
>>> >     if (err)
>>> >         return err;
>>> > --
>>> > 2.46.0
>>> >

