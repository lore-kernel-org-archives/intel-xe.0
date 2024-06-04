Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42FCBC25B78
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 14:58:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A3010E3C0;
	Tue,  4 Jun 2024 14:58:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FEmNP9ZE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1848C10E498
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jun 2024 14:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717513124; x=1749049124;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=OV2jMasAkIkQBnoslIMMD9QLRsyG7XDFIeQhVeXKx6M=;
 b=FEmNP9ZEfx+IPByy9eKYF7xTubal7NQgTekUmoxYPeBq1zxJ8Fo0A9yd
 WyaQDqEmRTs8pImyOq4FeassQnZyJM17iPzy6pfWE0gu7ejuKp0F5z93Z
 Gf98iUOJgws2R0vpneva30TnZG7Ebra7RnozhV32+bvH48zwogYJGTsxC
 9Zp+F5hrPlSCkF41Q/CsK/orneOXww/xDeQ9w0c6zEKq6keVLpzlMBwhl
 xkjQkXpMSTWgdO4r/H+/nrSBaFUO1nWN778zyIEaDfLdzVMZ1JyRk05Cg
 CQMwSW5gNbU7VxHvygj1zAdlzVmjrJbI5cGGgis/svZFDZ6CagTJxkXo+ g==;
X-CSE-ConnectionGUID: /0v/d9KZRrqKUvSaZMQsGw==
X-CSE-MsgGUID: tzGHc/kLREOJ0sdvl8035A==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="25465501"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="25465501"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 07:58:43 -0700
X-CSE-ConnectionGUID: z4z2f5SgQyOY3mvKeGXa9Q==
X-CSE-MsgGUID: DyDORZPDTnOtPzmgMaT9Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="42374020"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.245.99.210])
 ([10.245.99.210])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 07:58:42 -0700
Message-ID: <8c51ae4e-dbd9-4ffe-ae42-17a67fec31d0@intel.com>
Date: Tue, 4 Jun 2024 16:58:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] drm/xe: flush engine buffers before signalling
 user fence on all engines
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
References: <20240604-fix_user_fence_posted-v2-0-9276ecef973a@intel.com>
 <ed6eb79e5942310650425f90e0d10f00fb704e36.camel@linux.intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <ed6eb79e5942310650425f90e0d10f00fb704e36.camel@linux.intel.com>
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



On 04.06.2024 13:07, Thomas Hellström wrote:
> On Tue, 2024-06-04 at 11:38 +0200, Andrzej Hajda wrote:
>> According to the discussion result on my previous patch I have
>> prepared
>> new patchset, which reverts previous patch and adds barrier before
>> user fence signalling.
>> Remarks:
>> - I was not able to test it yet, hopefully CI will do it and me also
>> after fixing LNL issue,

Finally I can confirm that on LNL this patchset the barrier is enough, 
at least on the igt tests I was fixing.

>> - I am not sure about MI_FLUSH_DW flags, bspec says:
>>    "After this command is completed with a Store DWord enabled, CPU
>> access to graphics memory will be coherent"
>>    Shouldn't we use "Store DWord" then?
> It's not impossible that "store dword" needs to be enabled to act as a
> write barrier. but it also says "The parser pauses on an internal flush
> until all drawing engines have completed any pending operations."
>
> If it turns out a store dword is indeed needed as a post sync
> operation, we could perhaps use the "store dword" functionality of this
> command to store the user-fence value and replace the posted write.

Yep this seems even more elegant solution for me, but as I stated above 
the current solution works well.

Regards
Andrzej

>
> /Thomas
>
>> [1]:
>> https://lore.kernel.org/intel-xe/Zl5DcuZeZiFgxVdJ@DUT025-TGLU.fm.intel.com/T/#m0b4420045908bac70426728d460108c0b2b65dca
>>
>> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
>> ---
>> - Link to v1:
>> https://lore.kernel.org/r/20240603-fix_user_fence_posted-v1-1-61c76ef69cea@intel.com
>>
>> ---
>> Andrzej Hajda (2):
>>        Revert "drm/xe: flush gtt before signalling user fence on all
>> engines"
>>        drm/xe: flush engine buffers before signalling user fence on
>> all engines
>>
>>   drivers/gpu/drm/xe/xe_ring_ops.c | 26 ++++++++++++++++++++------
>>   1 file changed, 20 insertions(+), 6 deletions(-)
>> ---
>> base-commit: fe3d637a9c72b22297da0c731fa5e217bd182d2d
>> change-id: 20240603-fix_user_fence_posted-ca56c79c0662
>>
>> Best regards,

