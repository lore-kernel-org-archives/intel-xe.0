Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA55C5478C
	for <intel-xe@archiver.kernel.org>; Fri,  1 Mar 2024 17:45:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8995210E120;
	Fri,  1 Mar 2024 17:45:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n56e60vm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2776510E87D
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Mar 2024 17:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709315100; x=1740851100;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=UEAgCFiHVJ0L/bTlYVFZnMZUka4nFanwz9Z02r82VLo=;
 b=n56e60vmi5PdzaPjRfxQ+8ofNOPcdPw8eSRME8kDFVBkGVAKHJUJXVPT
 dLOpJjhC4oSDuyxfm7yo/c39jnR2cdjjsOIfoCi+T0itT5yS+tAlh4tLk
 A1Rzrvq3SPh/cyMBpmNAkmPB7nZ1145/XToGWGj1YHATzQWTXOLPVnfpn
 jda2OB9XvBSzQ/6SwXvjdffhyAwB7NzHu9T9e6PgqNmUIthIfzLuLXctw
 JYmHDKm/mudQnKmMQvq1HJ8b9MtY869LhN8zMQgp/Rs+OrHrzUogaSHpM
 Q7/V9GRMJzQ7hgQEuqrTVj3ohqRVD75Btdt+h9U+y4cm5Ug/dZPdyT4Er Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="3988201"
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="3988201"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 09:44:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; d="scan'208";a="12967633"
Received: from knomani-mobl.ger.corp.intel.com (HELO [10.252.3.163])
 ([10.252.3.163])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 09:44:58 -0800
Message-ID: <3003a0aa-c547-41db-b851-ea43af5c6651@intel.com>
Date: Fri, 1 Mar 2024 17:44:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Convert xe_pm_runtime_{get,put} to void and
 protect from recursion
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20240227183533.505053-1-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240227183533.505053-1-rodrigo.vivi@intel.com>
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

On 27/02/2024 18:35, Rodrigo Vivi wrote:
> With mem_access going away and pm_runtime getting called instead,
> we need to protect these against recursions.
> 
> For D3cold, the TTM migration helpers will call for the job execution.
> Jobs execution will be protected by direct runtime_pm calls, but they
> cannot be called again if we are already at a runtime suspend/resume
> transaction when evicting/restoring memory for D3Cold. So, we will check
> for the xe_pm_read_callback_task.

Does this need to be reworded? It looked like calling this for jobs 
wasn't going to work.

> 
> The put is asynchronous so there's no need to block it. However, for a
> proper balance, we need to ensure that the references are taken and
> restored regardless of the flow. So, let's convert them all to void and
> use some direct linux/pm_runtime functions.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
