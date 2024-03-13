Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15CEC54791
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 12:43:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7027E10E272;
	Wed, 13 Mar 2024 12:43:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SNdZBJPZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 260DD10E272
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 12:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710333788; x=1741869788;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=EdoDpf6Mgjpi76mBFfZhORDVgdoL4I3CtWHuswQ2phI=;
 b=SNdZBJPZKXLMhmhLd5plVkU+0dK8d45qIC6CIm6+9DKy6QuE16AOgmVO
 QgzHh3ood4w6ZmR61xHEs0eEv95vcciwu6ybfC5nSmmW8R7MsNSzV5mdP
 u6gIKwJU2piHeWHhTH1PTBU2kar9Ry2GWOyPfnQbEb3jdCCVhlxaH5EFh
 vANw25D7QeAtYkJO2UgjiiWEmT+WwA1WiqcXetQlWSOM+lPAfTgEpedyP
 sGgo3ygkBVn+73ENBQl4QG26bLQa7U02sDoe+dLzb3gX6k9rTnVI+yBaj
 k2YF7VorWjtbuWBKYZcyEyMDaZfsFB9XJiJ+JawOhYtbCj+CgjkttRE7l g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="4950880"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="4950880"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 05:43:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; d="scan'208";a="11813758"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa010.jf.intel.com with ESMTP; 13 Mar 2024 05:43:06 -0700
Received: from [10.249.141.133] (unknown [10.249.141.133])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 2D37134951;
 Wed, 13 Mar 2024 12:42:59 +0000 (GMT)
Message-ID: <feaa940e-baa4-4b65-9218-9c196d10a854@intel.com>
Date: Wed, 13 Mar 2024 13:42:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Refactor GT debugfs
Content-Language: en-US
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240214115756.1525-1-michal.wajdeczko@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240214115756.1525-1-michal.wajdeczko@intel.com>
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

ping

On 14.02.2024 12:57, Michal Wajdeczko wrote:
> Many of our debugfs files are GT specific and require a pointer to
> struct xe_gt to correctly show its content.  Our initial approach
> to use drm_info_list.data field to pass pointer not only requires
> extra steps (like copying template per each GT) but also abuses
> the rule that this data field should not be device specific.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Michal Wajdeczko (3):
>   drm/xe: Store pointer to struct xe_gt in gt/ debugfs directory
>   drm/xe: Define helper for GT specific debugfs files
>   drm/xe: Refactor GT debugfs
> 
>  drivers/gpu/drm/xe/xe_gt_debugfs.c | 206 ++++++++++++++---------------
>  drivers/gpu/drm/xe/xe_gt_debugfs.h |   2 +
>  2 files changed, 105 insertions(+), 103 deletions(-)
> 
