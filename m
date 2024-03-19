Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44779C54E60
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 09:25:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C3A10E9D4;
	Tue, 19 Mar 2024 09:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c4xiEg77";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E0A010E9D4
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Mar 2024 09:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710840332; x=1742376332;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7Bhk49YPQVb+y2teCVRf5jPd549KjSuGO+0T7m8J9fQ=;
 b=c4xiEg77C6jELeSPyyB3+eCxNlZrQVkR+toumI6BdCvTaKAbzlkmjrsI
 gliKdkmyBL26zWQSTNyUXgcW1KkPG7gcd1RKWRZUvzdeu2Np5YwJifot+
 ymPfOnfoaxUjPir3lLVYmYdiuStQbAnQXJuJeIeLR0OudaKKTh9Z5xNlk
 Vz6Nk1+qclePq9vN7JtcNkxxxV0X3/jsZ+6klvXOiVb0VQgUNhZKeNmev
 PNuP4rS0VIJPrISQQ92/WG8YHrHTpl1cFJvb7rp92FVDKKEdvSDMhj+bK
 fdsHYw9qA9D0YaO/DGzllrbjnwqux0m93hg+tJKoAjVABLoROjk4qJ/2V w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="17142150"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; d="scan'208";a="17142150"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 02:25:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; d="scan'208";a="13646091"
Received: from unknown (HELO [10.245.245.25]) ([10.245.245.25])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 02:25:29 -0700
Message-ID: <a6109ad5-d11e-4992-9ccb-17dd8b658afa@intel.com>
Date: Tue, 19 Mar 2024 09:25:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pt: Warn on 0 level before going to next lower
 level
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240318173744.6301-1-nirmoy.das@intel.com>
 <ZfinAR6OlL7OzrbU@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ZfinAR6OlL7OzrbU@intel.com>
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

On 18/03/2024 20:41, Rodrigo Vivi wrote:
> On Mon, Mar 18, 2024 at 06:37:44PM +0100, Nirmoy Das wrote:
>> This should happen so add a warn_on to be more paranoid.
> 
> should or should not?

s/should/should not/

> 
>>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
