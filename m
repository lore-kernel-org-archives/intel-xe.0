Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E6AC2BBCA
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 08:48:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA98210E10D;
	Fri, 28 Jun 2024 08:48:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BDsOXw2Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F7F10E0D1
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 08:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719564516; x=1751100516;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uJ0XL0Yg8iXGHd7/Xnmrip+RC331JlmBcU1m9Hqhvk4=;
 b=BDsOXw2Z2aAwABjNY/Vq7DVq9uQ4XDnfpjvOLrKVKfjXztnyJi3CITfW
 o2YbcrRGyGlv6jZgyhEByU0qpy4QK3zYNTi5X3+XpEyFoQVsT0t/y+1At
 C0TpktwLSbL+/nmFDVJpbuxxp6VXYVz99RcSH+IIo6JNdT55bhPuHomsL
 UX0A79wBW8JwK5uR+bW0hmFrZD78df5igmo0bpfj45jUMnqRIjI3FbIkq
 5NVLWNsWCmt25SWJxGL/rgYWyjg+zgyD9szeuj/Rpxiix4V1ejRiPjWdS
 nqy8/4pCWivKdI0flkvwpTRX1UUdDazyF2WObKXfAGSpWgGjPRa4mIQ5M A==;
X-CSE-ConnectionGUID: Te2BVvMpTxS2cfmicVPAwQ==
X-CSE-MsgGUID: aXn3RYPmTfy//CsED2O4Dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="16963117"
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; d="scan'208";a="16963117"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 01:48:35 -0700
X-CSE-ConnectionGUID: W9Texms/R3aCzZyWL3wNAg==
X-CSE-MsgGUID: X2p96QlBRjOiX5qfXxIXZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; d="scan'208";a="49275802"
Received: from patrokax-mobl.gar.corp.intel.com (HELO [10.246.38.191])
 ([10.246.38.191])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 01:48:34 -0700
Message-ID: <2fca2f7c-3530-4c17-965d-8a342bc7cd80@linux.intel.com>
Date: Fri, 28 Jun 2024 10:48:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] drm/xe/client: Check return value of
 xe_force_wake_get
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-xe@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240625094228.5327-1-nirmoy.das@intel.com>
 <171951484029.775393.10885902747621916498.b4-ty@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <171951484029.775393.10885902747621916498.b4-ty@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 6/27/2024 9:00 PM, Lucas De Marchi wrote:
> On Tue, 25 Jun 2024 11:42:28 +0200, Nirmoy Das wrote:
>> xe_force_wake_get() can return error so check it's return value
>> before reading gpu_timestamp value.
>>
>> v2: set HWE to NULL instead of setting timestamp to 0(Lucas)
>>      Add a warn on for xe_force_wake_put(Himal)
>>
>>
>> [...]
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
> and applied to drm-xe-next, thanks!
>
> [1/1] drm/xe/client: Check return value of xe_force_wake_get
>        commit: e71cf19e3119de446cc37ddabb2e161ebbf7357c


Thanks Lucas!

>
> Best regards,
