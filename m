Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4D5C3601E
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 18:24:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E2410E37E;
	Thu, 10 Apr 2025 18:24:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aw/6A94y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B630C10E37E
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Apr 2025 18:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744309481; x=1775845481;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GPbxy4/I2w2il0cQVNPAH52PeQGMhtGHS27HUOWB3No=;
 b=aw/6A94yBkyg9WbA05YVVPfvDG2r6icg0Hm9e4Y1PMoqGT1KITVoKZM1
 esSnuyRrESvYz61jHJC1EKl1lH94XixLGCVJczrtpTS4L/LF7ZLZH+fdm
 ifxRsbKRXSc2Sqw3KcY6nQ2RHsGC8sjjuC4ALX1ZkQraBffL5a1Xn7mZt
 o8sjrMOuwBMPQw0z7Bm7s2Sm3Qr7ld/vbMT0/YF6yEMm+x5dTgcO+egET
 xgEsGOrXoPxao7zKaigYMH4GzCJRVbD3dj6vJo6q/SiDih9DX1mQ5FLs4
 8bxRJI3LrFjWYUsmrPBza5bnQEJ3LtDicWvIfzHRdHmGL7SMuXA2kWzBA g==;
X-CSE-ConnectionGUID: hJoAc2mJS1CE3iFhguEglg==
X-CSE-MsgGUID: ReUfMLS7TJyO76Rey4hvTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="56492025"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="56492025"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 11:24:09 -0700
X-CSE-ConnectionGUID: L9lz6+5BS7SFDAe1mjAG8A==
X-CSE-MsgGUID: Psv0iYFNR162cRIYLmjF7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="129517001"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa010.fm.intel.com with ESMTP; 10 Apr 2025 11:24:07 -0700
Received: from [10.245.96.73] (mwajdecz-MOBL.ger.corp.intel.com [10.245.96.73])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id CB67C34EEE;
 Thu, 10 Apr 2025 19:24:05 +0100 (IST)
Message-ID: <bb89a891-bc4f-4818-870d-77d14e9b4e00@intel.com>
Date: Thu, 10 Apr 2025 20:24:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/4] drm/xe/vf: Fixup CTB send buffer messages after
 migration
To: "Lis, Tomasz" <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250403184055.2317409-1-tomasz.lis@intel.com>
 <20250403184055.2317409-5-tomasz.lis@intel.com>
 <5fe9853a-59df-4cbd-8e3f-4ee015178238@intel.com>
 <d1c9b224-685b-4f1d-9776-f12131f15331@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <d1c9b224-685b-4f1d-9776-f12131f15331@intel.com>
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



On 09.04.2025 23:09, Lis, Tomasz wrote:
> 
> On 08.04.2025 16:23, Michal Wajdeczko wrote:
>> On 03.04.2025 20:40, Tomasz Lis wrote:

...

>>> +    u32 msg[1];
>>     u32 msg;
>> or
>>     u32 msg[GUC_HXG_MSG_MIN_LEN];
> I want an array, so will go with 2nd. Though this looks like unjustified
> obfuscation to me.

using magic "1" is an obfuscation to me

....

>>> +                     struct guc_ctb *h2g,
>> nit: this is redundant
> oh I see. by "this" you mean a spaced out separate line.

no, I just repeat that all your fixup is about H2G and since we pass ct
each helper function can easily find pointer to h2g

passing struct guc_ctb * as separate parameter may suggest that
something other than h2g could be handled (but we don't need this)

...

>>> +    /* Read header */
>> you should at least assert that avail > 0 before reading even single u32
>>
>>     xe_gt_assert(gt, avail >= GUC_CTB_MSG_MIN_LEN);
> This is a static function, and the caller is ensuring that. But sure, I
> can add the assert.
>> but since it is called in the loop, more appropriate would be:
>>
>>     if (avail < GUC_CTB_MSG_MIN_LEN)
>>         goto broken;
> 
> I don't know what you mean by that. There are not that many
> possibilities for an integer value greater than 0 but smaller than 1.

caller just checks for avail > 0
but we shall check for avail >= GUC_CTB_MSG_MIN_LEN

and we should not make any assumptions about GUC_CTB_MSG_MIN_LEN value

> 
> And by the changes I agreed to above and below, we've already ensured
> that GUC_CTB_MSG_MIN_LEN can only be equal to 1.

we are adding checks for 'avail'
we are not making new assumptions about ABI values

...

>> maybe it's time to introduce
>>
>>     u32 move_head(u32 head, u32 step, u32 size)
> We are overdefining a lot of things already. I don't think we should
> press even harder in that direction.

it's about avoiding duplicated code and wrap it into named helper

...

>>> +
>>> +/**
>>> + * xe_guc_ct_fixup_messages_with_ggtt - Fixup any pending H2G CTB
>>> messages
>>> + * @ct: pointer to CT struct of the target GuC
>>> + * @ggtt_shift: shift to be added to all GGTT addresses within the CTB
>>> + *
>>> + * Messages in guc-to-host CTB are owned by GuC and any fixups in them
>>> + * are made by GuC. But content of the host-to-guc CTB is owned by the
>>> + * KMD, so fixups to GGTT references in any pending messages need to be
>>> + * applied here.
>> s/guc-to-host/H2G
>>
>> like you have earlier and below
> Earlier is a short description. Below I am using shortcut after defining
> it in this line. This is how the long comments should look like,
> abbreviations should be defined.

but I guess you should be aware right now that your code is not the
first that introduces the CTB feature, including G2H and H2G concept and
naming, so really above kernel-doc is not a right place to suddenly use
"guc-to-host" term (which is a bad notation anyway)



