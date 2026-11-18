Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E567606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 13:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lankhorst.se header.i=@lankhorst.se header.a=rsa-sha256 header.s=default header.b=azzDLDJH
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFED8899D4;
	Wed, 18 Nov 2026 13:21:43 +0000 (UTC)
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 533C310E085;
 Wed, 18 Nov 2026 13:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1795008096;
 bh=/Uj5q/KjhKqO3uslk8VWWy4ZW0ReiuI5BvK9tbNkv9o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=azzDLDJHKgoBB8XlEiv7iocOXOE3Oyoj7wDQmjzj4tqPZFTX/GQzRZ/z5MmJhtu+Z
 ON1KpdqjOvwBK6/OX2OzzffI4igK9LrbeiwuRK9TNEuXGlR4MHP60Ac/Z4mtVq9t/W
 ndjPdMTKxfYgR5bOJpw37Kw/prqcUEtKz1sOveJB4Ob/ZyVpoIwKDezKsAia0ms3Pi
 0Qrsj1bHZDsLT64/RPijJF9+zIHtJ8ZqPMf7fDaBs77DYtIgFDzdkhq3oBlu11j3Wg
 pVMtnCvqyi5l9yf2e913iMDLbtV5w481wJY87ShQkcqL4te7PVjGspPSyKfTjlmwYy
 y7fz6cqXq3XxA==
Message-ID: <d71c136b-b4d4-49bd-b817-958a696580e1@lankhorst.se>
Date: Wed, 18 Nov 2026 14:22:52 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] drm/xe/display: Avoid using stolen memory for
 framebuffer when media gt exists.
To: Jani Nikula <jani.nikula@linux.intel.com>, intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
References: <20261117143038.479557-7-dev@lankhorst.se>
 <20261117143038.479557-8-dev@lankhorst.se>
 <db7ccaec935c5df651a6c1d051d70185b06872b0@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <db7ccaec935c5df651a6c1d051d70185b06872b0@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hey,

On 11/18/26 11:24, Jani Nikula wrote:
> On Tue, 17 Nov 2026, Maarten Lankhorst <dev@lankhorst.se> wrote:
>> On systems with media GT, extra latency is added when accessing stolen
>> memory when the GT is in MC6.
>>
>> Simply disable allocating stolen memory for framebuffers when media gt
>> is found.
>>
>> Thanks to the previous patch, it will be possible to preserve the
>> contents.
>>
>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7513
> 
> Closes: instead?
I believe it's related, but not sufficient on its own to close that bug.
In particular DPT in stolen memory was a bigger factor.Hence the link
to that bug without closing it.

> 
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>> Link: https://patch.msgid.link/20260630135523.1775379-3-dev@lankhorst.se
> 
> What's this needed for?
Yeah I dropped it on final review before pushing.
> 
>> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>> ---
>>  drivers/gpu/drm/xe/display/xe_display_bo.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/display/xe_display_bo.c b/drivers/gpu/drm/xe/display/xe_display_bo.c
>> index f5102cd0e95d6..9385026a80b97 100644
>> --- a/drivers/gpu/drm/xe/display/xe_display_bo.c
>> +++ b/drivers/gpu/drm/xe/display/xe_display_bo.c
>> @@ -131,6 +131,14 @@ bool xe_display_bo_fbdev_prefer_stolen(struct xe_device *xe, unsigned int size)
>>  	if (IS_DGFX(xe))
>>  		return false;
>>  
>> +	/*
>> +	 * Avoid stolen memory when the media_gt exists,
>> +	 * because a lot of latency is added when media gt is in MC6
>> +	 */
>> +	if (xe_device_get_root_tile(xe)->media_gt)
>> +		return false;
>> +
>> +	/* machine hang when doing lots of LMEMBAR accesses */
>>  	if (XE_DEVICE_WA(xe, 22019338487_display))
>>  		return false;
> 

