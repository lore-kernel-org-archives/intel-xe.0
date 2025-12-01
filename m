Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F7DD116F1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 13:55:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EDC210E239;
	Mon,  1 Dec 2025 13:55:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B7nl+79z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 831AE10E239
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 13:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764597328; x=1796133328;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=LLFoqn1UM8Er15W9EeaexxaEQuTxCONzqaFj7O1+SqQ=;
 b=B7nl+79zz2N2OBPl/lpfzKJHqNzjhMvpDicwIwxgm+x/GUp7KciutFQK
 zVVGfdrNmq29leg09qT3D6lnzANO5dlLfnwQsJUebsQzdpmnn8LXKBIlH
 xcky0GKpQqB0ijoxcYmOclSgs4UBEuNNFzIKGc2NMuof7ioC9Y/QrG5sj
 inscI1I/4FYh1k3rk+bMYu0nmQm3xmO7U+ceT8YszgOoWN0yUPtM2T7b5
 UkVlihdChu7mDbb5aWV3cT89kcDFX7iEiCyvEbbkYmGW0dfojaBhxJzUr
 lqfuPtsC8A+0VUy9mQ+kRGmQYF3MqKMlde7D0zNSrlhgFJ10rmIj6fq68 A==;
X-CSE-ConnectionGUID: P/XXLFUwQJquHssh/QH/0w==
X-CSE-MsgGUID: 0Yj9mji1RWOW509EwmEGBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="77167776"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="77167776"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 05:55:28 -0800
X-CSE-ConnectionGUID: qbEsfWxsQkGPNqK5gLP2vg==
X-CSE-MsgGUID: MeUqf/MbT6edDWkxRFbjHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="198548377"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.132])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 05:55:26 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Gote, Nitin R"
 <nitin.r.gote@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Cc: "Piorkowski, Piotr" <piotr.piorkowski@intel.com>, "Gote, Nitin R"
 <nitin.r.gote@intel.com>
Subject: RE: [PATCH] drm/xe: Use IS_ENABLED() for config checks instead of
 defined()
In-Reply-To: <SJ1PR11MB620465985EABAEF33646A24581DBA@SJ1PR11MB6204.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251127170651.3798-2-nitin.r.gote@intel.com>
 <SJ1PR11MB620465985EABAEF33646A24581DBA@SJ1PR11MB6204.namprd11.prod.outlook.com>
Date: Mon, 01 Dec 2025 15:55:22 +0200
Message-ID: <170172a4dd8a4262611287ca2e189258845a5d23@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 01 Dec 2025, "Upadhyay, Tejas" <tejas.upadhyay@intel.com> wrote:
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Nitin
>> Gote
>> Sent: 27 November 2025 22:37
>> To: intel-xe@lists.freedesktop.org
>> Cc: Piorkowski, Piotr <piotr.piorkowski@intel.com>; Gote, Nitin R
>> <nitin.r.gote@intel.com>
>> Subject: [PATCH] drm/xe: Use IS_ENABLED() for config checks instead of
>> defined()
>> 
>> Prefer IS_ENABLED() instead of defined() for checking whether a kconfig
>> option is enabled.
>
> Add little info why

That's just what you're supposed to do. ;)

BR,
Jani.



>
> Tejas
>> 
>> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_vram.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
>> index 0a645e76e5fa..8fac1cc08dc9 100644
>> --- a/drivers/gpu/drm/xe/xe_vram.c
>> +++ b/drivers/gpu/drm/xe/xe_vram.c
>> @@ -325,7 +325,7 @@ struct xe_vram_region *xe_vram_region_alloc(struct
>> xe_device *xe, u8 id, u32 pla
>>  	vram->xe = xe;
>>  	vram->id = id;
>>  	vram->placement = placement;
>> -#if defined(CONFIG_DRM_XE_PAGEMAP)
>> +#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
>>  	vram->migrate = xe->tiles[id].migrate;  #endif
>>  	return vram;
>> --
>> 2.50.1
>

-- 
Jani Nikula, Intel
