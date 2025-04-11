Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C6E2C36010
	for <intel-xe@archiver.kernel.org>; Fri, 11 Apr 2025 16:45:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3274610EC2B;
	Fri, 11 Apr 2025 16:45:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mKX2N1GT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6797210EC2B
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Apr 2025 16:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744389923; x=1775925923;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=krYsftgCK/CjrpHSFIpbs72A0WvQK2g+agrB0wJe1ew=;
 b=mKX2N1GTwcPi3mdvFCdM2GZVHV1U8qyh3DxPpoQk86878pu5Ahg0GWHX
 Cj7kIWH6t5QpAu/3By4Kb5FZ4MIrbdFZ/ec5lX25B+/ThlCQC1bvEUekr
 rWp1qL7lHCqqiDXlhtPMmEHeiGckhToaxO05JB8Z8KfrfXlApB5Jk9k16
 jkuimGvbbsi7BuwEgoppf69uz0JYLTMWxuD6ZnlTWUWJV6pTtv2/qVt62
 8eiR8q5TD2inmnoqFoH1Hxe+Q3H/HaeH618YUR9Z/HCY3Pan5B4MdCGcr
 BbqZ4FAa0w+JYFA9dfEczF5VNNGFK6vIKssy5KbgdifKSo+1Hd5/rjR4r A==;
X-CSE-ConnectionGUID: QPrhR0rbTGazH3tEb3T53g==
X-CSE-MsgGUID: qZ9NxVpYQZuzrCbvz8wChA==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="57329875"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="57329875"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 09:45:20 -0700
X-CSE-ConnectionGUID: 0QeSGuE6TRyJu0f+75Jlfg==
X-CSE-MsgGUID: NH8jxOT8Rc+lJSz0A3UVUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="129007060"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa009.jf.intel.com with ESMTP; 11 Apr 2025 09:45:18 -0700
Received: from [10.245.96.73] (mwajdecz-MOBL.ger.corp.intel.com [10.245.96.73])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id A02CB3497F;
 Fri, 11 Apr 2025 17:45:16 +0100 (IST)
Message-ID: <53283400-87a2-4c80-aad7-80b8166c30e2@intel.com>
Date: Fri, 11 Apr 2025 18:45:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/4] drm/xe/vf: Fixup CTB send buffer messages after
 migration
To: "Lis, Tomasz" <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250409211340.3046931-1-tomasz.lis@intel.com>
 <20250409211340.3046931-5-tomasz.lis@intel.com>
 <4a8c2635-634f-43a4-ac9e-aa8ae0112ffa@intel.com>
 <ffe2656f-a952-4fae-ad91-9ca9a4cb5678@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ffe2656f-a952-4fae-ad91-9ca9a4cb5678@intel.com>
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



On 11.04.2025 16:39, Lis, Tomasz wrote:
> 
> On 10.04.2025 19:58, Michal Wajdeczko wrote:
>> On 09.04.2025 23:13, Tomasz Lis wrote:

...

>>> + */
>>> +static void ct_fixup_ggtt_in_message(struct xe_guc_ct *ct,
>>> +                       struct iosys_map *cmds, u32 head,
>>> +                       u32 len, u32 size, s64 shift)
>> -:84: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open
>> parenthesis
>> #84: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:1655:
>> +static void ct_fixup_ggtt_in_message(struct xe_guc_ct *ct,
>> +                       struct iosys_map *cmds, u32 head,
>>
>> did you really run checkpatch.pl as promised ?
> Many functions got renamed on your request.

so it's my fault?

...

>>> +static int ct_fixup_ggtt_in_buffer(struct xe_guc_ct *ct, struct
>>> guc_ctb *h2g,
>>> +                     s64 shift, u32 *mhead, s32 avail)
>> -:135: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open
>> parenthesis
>> #135: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:1706:
>> +static int ct_fixup_ggtt_in_buffer(struct xe_guc_ct *ct, struct guc_ctb
>> *h2g,
>> +                     s64 shift, u32 *mhead, s32 avail)
> 
> will fix. And do checkpatch again.
> 

not just 'again' or this 'next' time

it has to be run *each* time you plan to submit patches [1] so you want
waste CI and/or reviewers time

[1]
https://docs.kernel.org/process/submitting-patches.html#style-check-your-changes

