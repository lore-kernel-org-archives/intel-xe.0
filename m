Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B65C54E41
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 10:29:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5174B10E407;
	Tue,  5 Mar 2024 10:29:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nmosPHol";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D9F10E41A
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 10:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709634596; x=1741170596;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ASyl3aARoJC6ISBsqpTrUNQ6tuc8cuLsDPw88YwiK8E=;
 b=nmosPHolOAO7zoaACsNUcX82pRIXMRce8bxNH/lFzO+zhiKKGN1+332d
 cRKgL1XwCTntSUAf6SeAEbICDG2vxGbE/DKTPaitj+H6QQiAKbR6sW6+a
 NElFe04n2uHziVl5JE7UioNYSuIVsd7t824ORy9b6DycPYUQmActefh6S
 3CTSd1tFUaKFSLzJK9QiU+c6O1/8p+27U3hrMeeTwRcrk6CM/+xUxOskP
 5Psd7shWwjbQdAkvAijCHur100oGKxknad5AnXPy/6zAmpzasGCqMhn4D
 bYVJBxqMjUamX77tMxV+a75uZOirRdkn7deW4wOvSBodFRk5jeEQTU6O0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="21630902"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="21630902"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 02:29:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9745037"
Received: from pkunieck-mobl.ger.corp.intel.com (HELO [10.249.140.91])
 ([10.249.140.91])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 02:29:55 -0800
Message-ID: <c59a7c9d-a127-4dcf-970e-170318684a46@intel.com>
Date: Tue, 5 Mar 2024 10:29:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] drm/xe: Introduce xe_pm_runtime_get_noresume for
 inner callers
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20240304182154.42611-1-rodrigo.vivi@intel.com>
 <20240304182154.42611-6-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240304182154.42611-6-rodrigo.vivi@intel.com>
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

On 04/03/2024 18:21, Rodrigo Vivi wrote:
> Let's ensure that we have an option for inner callers that will
> raise WARN if device is not active and not protected by outer callers.
> 
> Make this also a void function forcing every caller to unconditionally
> put the reference back afterwards.
> 
> This will be very important for cases where we want to hold the
> reference before scheduling a work in a queue. Then the work job
> will be responsible for putting it back.
> 
> While at this, already convert a case from mem_access_ongoing where
> it is not checking for the reference and put it back, what would
> cause the underflow.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
