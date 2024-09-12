Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2D4EED615
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 15:35:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A30C10EBD0;
	Thu, 12 Sep 2024 15:35:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IJQnP1Fc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1390610EBD0
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 15:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726155323; x=1757691323;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=WCHJOfwcV1f9GuTu9Q9Lru2tKbpd5iCBPguctCZnufs=;
 b=IJQnP1FcWo/5SZe7ftu9y6mCMEa0ZCzJCYpLHAomiGb8+5bwgN0fH5Ht
 b07bX/Bs8o+RMMScPGCUuaW+qStYjZciTdTmxgAQ46NpNUM/jRLkaMlk8
 y9bXN/ZevFveI8aSlx0munXaMEFgLPmhwmKKSNaBfa0DDYR+Lw0jB8Yq3
 7JEVvQCGJfUDoWdkIpzcg5Lb08h112b1MJR05age351lEQNYd3mlXnabo
 cDJbutUoBvj5qmeT9D2j+gzo8Pcn4nzlGpv/OAk6HfHw9621TudNe093m
 qi7i31TjczV329IHHh5YK3mpt5NcgQONQfn4tgBGDSME/ka6EeqjX7gxu w==;
X-CSE-ConnectionGUID: R1Y2v4ecQaeGUfkSOooH1Q==
X-CSE-MsgGUID: XUjxTp2DR+OJ8svYaCVf+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25147954"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="25147954"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 08:35:22 -0700
X-CSE-ConnectionGUID: vmC3OZLPTHW/ZX/77urnbw==
X-CSE-MsgGUID: fiGNYx81TFS3pVBhtu3u4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="67838920"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.160])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 08:35:17 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>, Dnyaneshwar
 Bhadane <dnyaneshwar.bhadane@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe/pciid: Add new PCI id for ARL
In-Reply-To: <mavshqjpsgmdmcyp6pl7xqm4mw5u23vm7lx3yajplfhvjfpzng@v52ynafehpuc>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240911092657.2348978-1-dnyaneshwar.bhadane@intel.com>
 <570df84e-44b3-42ec-8ad5-313865ed585a@intel.com>
 <874j6li5z1.fsf@intel.com>
 <mavshqjpsgmdmcyp6pl7xqm4mw5u23vm7lx3yajplfhvjfpzng@v52ynafehpuc>
Date: Thu, 12 Sep 2024 18:35:14 +0300
Message-ID: <878qvwga19.fsf@intel.com>
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

On Thu, 12 Sep 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Thu, Sep 12, 2024 at 12:20:02PM GMT, Jani Nikula wrote:
>>On Wed, 11 Sep 2024, "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com> wrote:
>>> On 11-09-2024 14:56, Dnyaneshwar Bhadane wrote:
>>>> Add new PCI id for ARL platform.
>>>>
>>>> Signed-off-by: Dnyaneshwar Bhadane<dnyaneshwar.bhadane@intel.com>
>>>> ---
>>>>   include/drm/intel/xe_pciids.h | 3 ++-
>>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/include/drm/intel/xe_pciids.h b/include/drm/intel/xe_pciids.h
>>>> index 79001afa7d27d..5758924a5b4ca 100644
>>>> --- a/include/drm/intel/xe_pciids.h
>>>> +++ b/include/drm/intel/xe_pciids.h
>>>> @@ -181,7 +181,8 @@
>>>>   	MACRO__(0x7D41, ## __VA_ARGS__),	\
>>>>   	MACRO__(0x7D51, ## __VA_ARGS__),        \
>>>>   	MACRO__(0x7D67, ## __VA_ARGS__),	\
>>>> -	MACRO__(0x7DD1, ## __VA_ARGS__)
>>>> +	MACRO__(0x7DD1, ## __VA_ARGS__),	\
>>>> +	MACRO__(0xB650, ## __VA_ARGS__)
>>> This should be 0xB640
>>
>>Lucas, Rodrigo, are we getting buy-in for having the PCI ID macros
>>shared between i915 and xe yet...? ;)
>
>
> I acked that series already.

Indeed. Sorry I missed it.

BR,
Jani.

-- 
Jani Nikula, Intel
