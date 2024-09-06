Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B7DCCE7B06
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 12:43:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D62D10EA36;
	Fri,  6 Sep 2024 12:43:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JkGjYvB8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3879110EA36
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 12:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725626589; x=1757162589;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=NmO3t6WPerl3PeoSzO1Ntw3mGl0WR+s5U2uCahvVCuE=;
 b=JkGjYvB8LefcVCQAGwfusRaVoMfoj8XjUMdIe0mklgnMhHvm2Vo5ilO2
 rm7P7nRtb9tJNzlYgcKIFshXr5AviBULf8bGMKmG8iYXTWZ8AAoJ7EJjh
 dmHKwGLIaIcT6RDvn5tc/KeGbyp6KQ/4Q2SvqPQF08Aq9MMRNtDZJNuhP
 DP4VC7j5mJzEv99s/eIP2iyWdpbZcclwAfs4l33HCBcRwX5lkg0EOwia9
 kQJ0AkS+dsr57CUq94k7B5bGu02XfygL9/gkQE19XvyrXKDnJk6QWKiRX
 Qg3nadV7kuXCZJ0JOhZ97bncwGpxoXR9lzld/StSCLEyap4H+c0sqLqB8 g==;
X-CSE-ConnectionGUID: t5KCLHlKRY+BBjeyJy0GEg==
X-CSE-MsgGUID: 4np/gwroRZOWh8N01RJVDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="41889273"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="41889273"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 05:43:08 -0700
X-CSE-ConnectionGUID: 4utjHjENSwOOp+nqF3ZA1w==
X-CSE-MsgGUID: MD4ktPf5SNiE0UnvJVaBKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="96660944"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.62])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 05:43:07 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Subject: Re: [PATCH 1/3] drm/xe/pciids: add some missing ADL-N PCI IDs
In-Reply-To: <32a74590-112a-4482-b8f1-cc0d92eb68c5@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1725443121.git.jani.nikula@intel.com>
 <47d543393e4026588401a03c4e3ce12ce29780e3.1725443121.git.jani.nikula@intel.com>
 <32a74590-112a-4482-b8f1-cc0d92eb68c5@intel.com>
Date: Fri, 06 Sep 2024 15:43:01 +0300
Message-ID: <8734mdneay.fsf@intel.com>
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

On Thu, 05 Sep 2024, "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com> wrote:
> On 04-09-2024 15:16, Jani Nikula wrote:
>> Similar to commit 425b463859ed ("drm/i915: Update ADL-N PCI IDs").
>>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Looks good.
>
> Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>

Thanks for the reviews, pushed to drm-xe-next.

BR,
Jani.

>
>> ---
>>   include/drm/intel/xe_pciids.h | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/drm/intel/xe_pciids.h b/include/drm/intel/xe_pciids.h
>> index 73d972a8aca1..41617c5ac6ab 100644
>> --- a/include/drm/intel/xe_pciids.h
>> +++ b/include/drm/intel/xe_pciids.h
>> @@ -97,7 +97,9 @@
>>   #define XE_ADLN_IDS(MACRO__, ...)		\
>>   	MACRO__(0x46D0, ## __VA_ARGS__),	\
>>   	MACRO__(0x46D1, ## __VA_ARGS__),	\
>> -	MACRO__(0x46D2, ## __VA_ARGS__)
>> +	MACRO__(0x46D2, ## __VA_ARGS__),	\
>> +	MACRO__(0x46D3, ## __VA_ARGS__),	\
>> +	MACRO__(0x46D4, ## __VA_ARGS__)
>>   
>>   /* RPL-S */
>>   #define XE_RPLS_IDS(MACRO__, ...)		\

-- 
Jani Nikula, Intel
