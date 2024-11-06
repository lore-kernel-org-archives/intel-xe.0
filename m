Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B8CD44D75
	for <intel-xe@archiver.kernel.org>; Wed,  6 Nov 2024 14:33:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B042210E6F4;
	Wed,  6 Nov 2024 14:33:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kiO4g0cc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4DF10E6F4
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Nov 2024 14:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730903617; x=1762439617;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=mp5iw6/Fn8iSgqaRqqfsglfG+TR4eSjbabSXuvcU7k0=;
 b=kiO4g0ccDa34PJimDhY5XdGTeAaR10y2CNed/AV0Kyq4gtgIs6dxBJuU
 JboTlu4IfINitlrNU4Vej+zDvUMASMhltng6pMp5xHTljW5oyvNHKv5Sx
 BaLrO4pkszOIE4Fh545SXButn9HDtmYbOrpU2qtEkBiznRg5QsYbL1nE0
 h9coPq04IGCrh05wlsYvye8Ipcbq6N6reXGGRkuYrw6FLC4ZDwpLvVhDT
 AcLsCuhT6YeX4vss4yHzxNz3y9og7gNlSdQwIqJxv7fTBp26QCj7IsASM
 benQMawI9wvSPscynBqzuA+fiL2yWY7L4K0B1KEvy8DREWnacSERHUuR4 Q==;
X-CSE-ConnectionGUID: R4DzpPm4QcGvbGi1uZ3GqA==
X-CSE-MsgGUID: woSTIRAcQMywR2talORdQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="34630221"
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="34630221"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 06:33:37 -0800
X-CSE-ConnectionGUID: TUZP3rPRT6Kqied6buhi1Q==
X-CSE-MsgGUID: Ar6hvA67QP2ZWsRoO9ME6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="89692048"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa004.jf.intel.com with ESMTP; 06 Nov 2024 06:33:35 -0800
Received: from [10.245.98.17] (prowe-mobl.ger.corp.intel.com [10.245.98.17])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 559A62877D;
 Wed,  6 Nov 2024 14:33:34 +0000 (GMT)
Message-ID: <b7ba81a8-bdc8-4ede-b32f-20b30336602f@intel.com>
Date: Wed, 6 Nov 2024 15:33:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/5] drm/xe/vf: Post-migration recovery worker basis
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: Tomasz Lis <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
References: <20241104213449.1455694-1-tomasz.lis@intel.com>
 <464fa43f-c1eb-4a04-a0c2-07d614c6915a@intel.com>
Content-Language: en-US
In-Reply-To: <464fa43f-c1eb-4a04-a0c2-07d614c6915a@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 06.11.2024 14:09, Michal Wajdeczko wrote:
> 
> 
> On 04.11.2024 22:34, Tomasz Lis wrote:
>> To support VF Migration, it is necessary to do fixups to any
>> non-virtualized resources. These fixups need to be applied within
>> VM, on the KMD working with VF.
>>
>> This series introduces a post-migration recovery worker, executed
>> after migration to perform fixups.
>>
>> Specific fixups will be added later in further series.
>>
>> v2: renamed and moved functions, updated logged messages, removed
>>   unused includes, used anon struct, keeping pm ref during whole
>>   recovery, skip handshake, style fixes (Michal)
>> v3: ordering, kerneldoc, asserts, debug messages, on_all_tiles ->
>>   on_all_gts, switched 'err' and 'ret'  (Michal)
>> v4: fixed missing header include in one patch
>> v5: Explained what fixups are, explained which IRQ is used, style
>>   fixes, assert to separate patch, debug message per GuC instead
>>   of one, comments changes (Michal)
>> v6: Improved documentation patch, updated one debug message
>>
> 
> series LGTM,
> 
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> 
>> Tomasz Lis (5):
>>   drm/xe/vf: React to MIGRATED interrupt
>>   drm/xe/vf: Document SRIOV VF restore flow

used v3 with DOC in .c

>>   drm/xe/vf: Send RESFIX_DONE message at end of VF restore
>>   drm/xe/vf: Start post-migration fixups with provisinoning query

fixed typo

>>   drm/xe/vf: Defer fixups if migrated twice fast

and applied to drm-xe-next


