Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664D1C28B28
	for <intel-xe@archiver.kernel.org>; Thu, 13 Mar 2025 09:20:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A00410E816;
	Thu, 13 Mar 2025 09:20:05 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB9110E816
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Mar 2025 09:20:03 +0000 (UTC)
Message-ID: <4d08feb3-9067-4241-b6a2-e3f6578d1c32@lankhorst.se>
Date: Thu, 13 Mar 2025 10:19:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] drm/xe: Split init of xe_gt_init_hwconfig to
 xe_gt_init and *_early
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20250310200653.89731-1-dev@lankhorst.se>
 <20250310200653.89731-9-dev@lankhorst.se>
 <z4oxa2vgrqorbediwjjwvs5nwtjxqwjtbeenmwa3m53mizdrjy@ox4klandkqsl>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <z4oxa2vgrqorbediwjjwvs5nwtjxqwjtbeenmwa3m53mizdrjy@ox4klandkqsl>
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

On 2025-03-11 21:55, Lucas De Marchi wrote:
> On Mon, Mar 10, 2025 at 09:06:53PM +0100, Maarten Lankhorst wrote:
>> static void xe_gt_fini(void *arg)
>> @@ -471,6 +451,18 @@ int xe_gt_init(struct xe_gt *gt)
>>     if (!fw_ref)
>>         return -ETIMEDOUT;
>>
>> +    err = xe_uc_init(&gt->uc);
>> +    if (err)
>> +        goto err_force_wake;
>> +
>> +    err = xe_uc_init_hwconfig(&gt->uc);
>> +    if (err)
>> +        goto err_force_wake;
> 
> humn... why are these 2 variants not merged together then?
> 
> at the end of this series I don't know what to expect. Is everything
> here sufficient or is this part of what we need?
That's a good question, makes sense to merge those 2 calls.

I haven't done it yet was because I was trying to solve the issue of flickering. If it turns things
break, then  I want to ensure that we could undo the patches.

Wes hould simplify GuC initialisation too, but I wanted to wait with it in order to diagnose issues resulting from
reworking the ordering flow first. This way it becomes easier to fix any regressions, for both should they pop up.

Cheers,
~maarten
