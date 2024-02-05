Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3347DC48295
	for <intel-xe@archiver.kernel.org>; Mon,  5 Feb 2024 13:33:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA1F210F99A;
	Mon,  5 Feb 2024 13:33:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ED8ME33f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B3710F99A
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Feb 2024 13:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707140023; x=1738676023;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=FRNaWlQhH0UXBAR0SrCKbxObEScX7Ro8IvaCkzKMf2M=;
 b=ED8ME33fZtQEBweJMNF3uGl1UoIZn2m4ORN4s0uN+lnxVqEJt6yETZV4
 Yhd6jlPwCh6i1kiDNb4IVsh6c8EZLN5364FNe+XXqTD9Nps7j3kYcZ/AA
 IewhfOcCtnvKyFxjLnl6BCWepen+9aNKXSJ3RlcRWov9IB9y7l0yDwIp6
 9WinvSKWdUIp6ZT8BBY74zLq3/fbArRukUMBgFW55gtRXGTU3hOe1Txx0
 05v2Lc20VKFhHsfhG4einLJ/hFB4gL1pZNxBeXQjLuLHs0JOlEFRnCtP1
 hrbadrXicyJ9tskzYd3U8yV6WNjrq8EjSFETDfXcMYznfvx5fmFzhGGMO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="11258684"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; d="scan'208";a="11258684"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 05:33:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="1010903"
Received: from vgolodni-mobl.ger.corp.intel.com (HELO [10.252.0.151])
 ([10.252.0.151])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 05:33:41 -0800
Message-ID: <3baa7513-00c2-4a81-9357-326df2065057@intel.com>
Date: Mon, 5 Feb 2024 13:33:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 29/34] drm/xe: Convert gt_reset from mem_access to
 xe_pm_runtime
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
 <20240126203044.1104705-30-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240126203044.1104705-30-rodrigo.vivi@intel.com>
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

On 26/01/2024 20:30, Rodrigo Vivi wrote:
> We need to ensure that device is in D0 on any kind of GT reset.
> We are likely already protected by outer bounds like exec,
> but if exec/sched ref gets dropped on a hang, we might transition
> to D3 before we are able to perform the gt_reset and recover.
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

