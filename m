Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3647CC38142
	for <intel-xe@archiver.kernel.org>; Wed,  1 Feb 2023 09:12:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1609C10E2D3;
	Wed,  1 Feb 2023 09:12:49 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D80D10E2D3
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Feb 2023 09:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675242766; x=1706778766;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kuyso3kofvBZVWU0DzJZgu8nh9h9YTa25hvvlWgAV5k=;
 b=aFksO4IwE06NuttplEc6QJ/C4YAJ3y/6EwAKP0l/PN+8RLSLT1e0wejc
 WMU3N4WwpQ/7eMYV6IwgDtCaErga74TLw4N7H7G5EJ/DuBYYk7Ypjciup
 Yxx3eCkqv5IV7uhaM9twe7dkUjVloB4dDbAbTItbZGTGwqAG2FkL/DV3B
 27Ffe+Vg9zbHUuUALXEtYxdZuqvWlzcpl3GW2ehEjO6J1ABKhbOKesZcY
 7ngbyyuMzVfPSo//yBPtn+x1Zl5RmwEf+wlYAJRlwjju/Y0c0rL5QAeV0
 exbFQwuhe/mE3wmz3L7YxK0RvLIGa5cILgczo15JPcHwJDag1Q1DZqqmt A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="311736981"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="311736981"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 01:12:31 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="664826504"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="664826504"
Received: from ddawido-mobl1.ger.corp.intel.com (HELO [10.252.1.213])
 ([10.252.1.213])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 01:12:30 -0800
Message-ID: <9c5fe8c3-8583-ce26-1b64-f226eb8a10fb@intel.com>
Date: Wed, 1 Feb 2023 09:12:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.0
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
 <20230112222538.2000142-38-rodrigo.vivi@intel.com>
 <Y8/9Sn1LAkpDW+Ex@intel.com>
 <DM6PR11MB45291BB4644955E0CED4447995C99@DM6PR11MB4529.namprd11.prod.outlook.com>
 <Y9loTUvw3vtK0WnF@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <Y9loTUvw3vtK0WnF@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 37/37] drm/xe: enforce GSMBASE for DG1
 instead of BAR2
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 31/01/2023 19:13, Rodrigo Vivi wrote:
> On Tue, Jan 24, 2023 at 04:25:16PM +0000, Lecluse, Philippe wrote:
>> On DG1, BAR2 is not reliable for reporting Vram size, need to use GSMBASE.
>> Simplify xe_mmio_total_vram_size to report vram size and usable size.

s/reliable/valid/
s/Vram size/usable VRAM size/

> 
> Matt, with this as commit msg of this patch, can I convert your gitlab approval in rv-b?

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> 
> What about other gitlab approvals? can I convert them to rv-b or
> do you intend to go patch by patch here in the ml?

Sure.

> 
> Thanks,
> Rodrigo.
> 
>>
>> -----Original Message-----
>> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>> Sent: Tuesday, January 24, 2023 4:46 PM
>> To: intel-xe@lists.freedesktop.org; Brost, Matthew <matthew.brost@intel.com>; maarten.lankhorst@linux.intel.com; Lecluse, Philippe <philippe.lecluse@intel.com>; mchehab@kernel.org
>> Cc: Auld, Matthew <matthew.auld@intel.com>
>> Subject: Re: [Intel-xe] [PATCH 37/37] drm/xe: enforce GSMBASE for DG1 instead of BAR2
>>
>> On Thu, Jan 12, 2023 at 05:25:38PM -0500, Rodrigo Vivi wrote:
>>> From: Philippe Lecluse <philippe.lecluse@intel.com>
>>
>> Hi Phil, could you please reply with a commit message to this patch?
>> I will add on the next interaction or while merging it.
>>
>> Thanks,
>> Rodrigo.
>> ---------------------------------------------------------------------
>> Intel Benelux B.V.
>> Registered in The Netherlands under number 24134020
>> Statutory seat: Rotterdam
>> Registered address: Capronilaan 37, 1119NG Schiphol-Rijk
>>
>> This e-mail and any attachments may contain confidential material for
>> the sole use of the intended recipient(s). Any review or distribution
>> by others is strictly prohibited. If you are not the intended
>> recipient, please contact the sender and delete all copies.
>>
