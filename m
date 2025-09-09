Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE4ACA0FED
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 19:21:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3747410E7EC;
	Tue,  9 Sep 2025 19:21:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PiIGAT9C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1637910E7E9;
 Tue,  9 Sep 2025 19:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757445659; x=1788981659;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hcjqtg/1buYqemHe8vyu9yPhcW7/0Rq1/Z5Z5WmXe8A=;
 b=PiIGAT9CJV4IRbeVrG4j+ClMjCt4UdgIj5Po2MvQ7f1Z84iRChhk8o01
 w9exliZtLs9vXhRT5arBN/w7hqkcmvGYr68N5ThHJbD+UCuOb4gk1kOM0
 haZV7H1ESIf1q0FiyIfilIssNNA22YLIiPUzAw6dxG+yinzDfHhBiKt/N
 K2uv4L11i7VbLxJt2ceImyZd5W+0e7L2SJ6qiyumRxNXfNVvv7f3q4DGP
 9Le2ohR6akGzNgoEtskPQdDLW7/Q1DejLbce56nJOJuqLmg6zKv+z1ZjH
 q6vM0/19F4iIHIgAHXv7Aua4RXiir1DGdIKUZgsm7Uj/XpG7hZ2CsFiAr w==;
X-CSE-ConnectionGUID: X1p0027KROW3T4DpS9jZVQ==
X-CSE-MsgGUID: IqIl6NSSRomDGbPGQlJhbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="70358347"
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; d="scan'208";a="70358347"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 12:20:57 -0700
X-CSE-ConnectionGUID: CJff4aiHSuGiEcUS/1DR3Q==
X-CSE-MsgGUID: U/RToG1uTFeCKPDxk7m0/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; d="scan'208";a="196847577"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.244.108])
 ([10.245.244.108])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 12:20:55 -0700
Message-ID: <823c4b68-64ab-4e0f-bb6b-e8d52586e7f1@linux.intel.com>
Date: Tue, 9 Sep 2025 21:20:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] mm/mmu_notifier: Allow two-pass struct
 mmu_interval_notifiers
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: intel-xe@lists.freedesktop.org, Andrew Morton
 <akpm@linux-foundation.org>, Simona Vetter <simona.vetter@ffwll.ch>,
 Dave Airlie <airlied@gmail.com>, Alistair Popple <apopple@nvidia.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20250821114626.89818-1-thomas.hellstrom@linux.intel.com>
 <20250821114626.89818-2-thomas.hellstrom@linux.intel.com>
 <20250909171831.GC882933@ziepe.ca>
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250909171831.GC882933@ziepe.ca>
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

Hi, Jason

On 9/9/25 19:18, Jason Gunthorpe wrote:
> On Thu, Aug 21, 2025 at 01:46:21PM +0200, Thomas Hellström wrote:
>> +struct mmu_interval_notifier_finish {
>> +	struct list_head link;
>> +	/**
>> +	 * @finish: Driver callback for the finish pass.
>> +	 * @final: Pointer to the mmu_interval_notifier_finish structure.
>> +	 * @range: The mmu_notifier_range.
>> +	 * @cur_seq: The current sequence set by the first pass.
>> +	 *
>> +	 * Note that there is no error reporting for additional passes.
>> +	 */
>> +	void (*finish)(struct mmu_interval_notifier_finish *final,
>> +		       const struct mmu_notifier_range *range,
>> +		       unsigned long cur_seq);
> I would rather this be in mmu_interval_notifier_ops

Thanks for reviewing.

We could have the struct mmu_interval_notifier_finish have a pointer to 
mmu_interval_notifier_ops or even to
mmu_interval_notifier. Now that you mention it IIRC Linus has pointed 
out that he strongly prefer function pointers in const ops wherever 
possible. Would like to keep the linked list, though, as we've discussed 
before, for passing of state and to avoid a second interval tree traversal.

Thanks,

Thomas



>   though I guess I
> see why it was done like this, I don't think it is a great idea for
> DRM to wrapper the notifier library with yet another library :\
>
> Regardless
>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
>
> Jason
