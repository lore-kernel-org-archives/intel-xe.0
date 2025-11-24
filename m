Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B062DCFD313
	for <intel-xe@archiver.kernel.org>; Mon, 24 Nov 2025 13:42:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D7E10E2C6;
	Mon, 24 Nov 2025 13:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mY3KOe3P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEC0710E2C6
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Nov 2025 13:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763991720; x=1795527720;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3lfexC4yztW3lIrDORND4YOu3HV8N9fAqeYbacyThKU=;
 b=mY3KOe3PXswqOJpTAPrne2464PezheiGW1fs5Y4/5ETDyUHJrU7yIoFB
 hle1oroqdDAdfuz1eK1UiUBOF0uj6SjYFshR2l06/RG6djsoqe9oI7vHv
 vSkIPM5qlY7FwpHTeW9DE8rSB1Lf8JDFj1Y8XIgLjYw7/ufiDbvCwkMu8
 52wS0yKg2rdxg58/dT4Fjw7rhXYiZbipJ/Ql4/ImoSOhJ1xL6M5jy7HT7
 ttx1MUZ6k1KnY20BYLiruinqMOBXuF5ygSj1cqElT9I286VhRk/PVYQSq
 vQGS3K1zXW1wvymTerJ9fFM69BkEHEjM8NEd9NV/Kg7prLP5fjpEpS+Qt w==;
X-CSE-ConnectionGUID: hjoKdRu+QumZpdDlG1QBPg==
X-CSE-MsgGUID: UNEY0+PxRHSh06djmiWDSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66019688"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="66019688"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 05:41:59 -0800
X-CSE-ConnectionGUID: NnshVJELR4ad4fVV2vEFeA==
X-CSE-MsgGUID: PPyBEN5uQB6jEGMoLoRogQ==
X-ExtLoop1: 1
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.245.244.67])
 ([10.245.244.67])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 05:41:57 -0800
Message-ID: <cc27ae58-b579-4332-9653-c62b38f32add@intel.com>
Date: Mon, 24 Nov 2025 13:41:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/xe/uapi: disallow bind queue sharing
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>, Carl Zhang <carl.zhang@intel.com>,
 stable@vger.kernel.org
References: <20251120132727.575986-4-matthew.auld@intel.com>
 <20251120132727.575986-5-matthew.auld@intel.com>
 <fh6dgogrt3ibrod7qkguejy4bj3cmvlbnxksmedhvfx3ejglk2@nu3h6doh7sdx>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <fh6dgogrt3ibrod7qkguejy4bj3cmvlbnxksmedhvfx3ejglk2@nu3h6doh7sdx>
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

On 20/11/2025 15:34, Lucas De Marchi wrote:
> On Thu, Nov 20, 2025 at 01:27:29PM +0000, Matthew Auld wrote:
>> Currently this is very broken if someone attempts to create a bind
>> queue and share it across multiple VMs. For example currently we assume
>> it is safe to acquire the user VM lock to protect some of the bind queue
>> state, but if allow sharing the bind queue with multiple VMs then this
>> quickly breaks down.
>>
>> To fix this reject using a bind queue with any VM that is not the same
>> VM that was originally passed when creating the bind queue. This a uAPI
>> change, however this was more of an oversight on kernel side that we
>> didn't reject this, and expectation is that userspace shouldn't be using
>> bind queues in this way, so in theory this change should go unnoticed.
>>
>> Based on a patch from Matt Brost.
>>
>> v2 (Matt B):
>>  - Hold the vm lock over queue create, to ensure it can't be closed as
>>    we attach the user_vm to the queue.
>>  - Make sure we actually check for NULL user_vm in destruction path.
>> v3:
>>  - Fix error path handling.
>>
>> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>> Reported-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: José Roberto de Souza <jose.souza@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Michal Mrozek <michal.mrozek@intel.com>
>> Cc: Carl Zhang <carl.zhang@intel.com>
>> Cc: <stable@vger.kernel.org> # v6.8+
> 
> we never had any platform officially supported back in 6.8. Let's make
> it 6.12 to avoid useless backporting work.
> 
>> Acked-by: José Roberto de Souza <jose.souza@intel.com>
> 
> Michal / Carl, can you also ack compute/media are ok with this change?

Ping on this? I did a cursory grep for DRM_XE_ENGINE_CLASS_VM_BIND and 
found no users in compute-runtime or media-driver in upstream. This 
change should only be noticeable if you directly use 
DRM_XE_ENGINE_CLASS_VM_BIND to create a dedicated bind queue, which you 
then pass into vm_bind.

> 
> Lucas De Marchi

