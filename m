Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B85C54E5D
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 13:42:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F3C10FAC4;
	Tue, 19 Mar 2024 13:42:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iHR6RkPr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D2CA10FAC4
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Mar 2024 13:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710855744; x=1742391744;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=qf0UxJ+ROKp9FjNJ/xGJUKqODo2+xTfuWuDty6Y9LLQ=;
 b=iHR6RkPr2WJXXK34cwOxDA0GdZ0/pW8ykLh4/wXfUrdx/q+kT0mxZCAR
 6McsvkFCZA2JGs+3N9BW8cIrZdlP1uXAwoH28+mKxCou6/ApOQFCwJqa0
 U2viMQv5WrbNe6NFVv6/5akpoQQqE0TFE4B5Ph3xn2R4OI4XOtGxadt1z
 /fOllxHiMFNJDZw9VeFxfrxP40DLMKfrMhmvuSyx8p6+fW2WMUW1Jgw7s
 F9ReNxn4EOliPlNGd7kcfVmvtYDUBeO/Du4KenGXEUr+S6suZxh23xcjM
 uWvaZ7n+4XfANixDJtvXs5LFD/l2VwFvkDOXi+r2257UNrUr5UEigT+KE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5561119"
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; 
   d="scan'208";a="5561119"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 06:42:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; d="scan'208";a="18268970"
Received: from unknown (HELO [10.245.245.25]) ([10.245.245.25])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 06:42:17 -0700
Message-ID: <e3570f15-2f29-40e6-862b-25f885a6ffb0@intel.com>
Date: Tue, 19 Mar 2024 13:42:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Add a NULL check in xe_ttm_stolen_mgr_init
Content-Language: en-GB
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
References: <20240319130925.22399-1-nirmoy.das@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240319130925.22399-1-nirmoy.das@intel.com>
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

On 19/03/2024 13:09, Nirmoy Das wrote:
> Add an explicit check to ensure that the mgr is not NULL.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

