Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B58C5516D
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jul 2026 11:23:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C502010F21F;
	Fri, 31 Jul 2026 11:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FOREZIZT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A66310F21F
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jul 2026 11:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785496979; x=1817032979;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kMwGUDAu/de3tkt3jVhD/aGmQuGBHseVSfGHs90L+h4=;
 b=FOREZIZTj7N0PGXOSf4ImGCBfAtyY08xs+K7ollyznhDz50FXksKQamc
 2pcR7XPkp6BBhChmv3/X/1ssCEKXSZFcfnVWzmv4wBcwja5cqUAIscMnN
 P3wsMo6YksvPe+0iG6OD9EjQWHcCD8wWCh3oAifrm2iMR/pbA7p7Bfgnj
 OABGHUBxyVrroPTlGT6G3ZfX+HNCC2A5is746Of3j+YtgD1hVzcKmKq6r
 yufgSlKxE6Ico7Dk3K3Y99lGzOCqDSzaqChUTVNDwO6WrOJ1O265vXFqv
 J/XwgEMZzsHfqUoGsmoMIUGoVMAyzaq5XGCVmz9ZSNZ9Co6DDV6D+8hze Q==;
X-CSE-ConnectionGUID: xy5onDi5ReqUNUFxIlU0MA==
X-CSE-MsgGUID: Ua0tNr7tTYCn0aWoSJiswQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="89801007"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="89801007"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 04:22:58 -0700
X-CSE-ConnectionGUID: 4LtVhJbuTuSUwtChfnsZtg==
X-CSE-MsgGUID: 6x7TqhZFQUGl33kkRcc3jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="254250054"
Received: from slindbla-desk.ger.corp.intel.com (HELO [10.245.244.78])
 ([10.245.244.78])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 04:22:57 -0700
Message-ID: <7477c473-6027-4941-8a0d-fa6b90dd477d@intel.com>
Date: Fri, 31 Jul 2026 12:22:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] drm/xe/guc_ads: use uncached mapping for UM queue
 BO
To: Jia Yao <jia.yao@intel.com>, intel-xe@lists.freedesktop.org
Cc: gwan-gyeong.mun@intel.com, stable@vger.kernel.org
References: <20260722053410.2767369-1-jia.yao@intel.com>
 <20260730232712.517989-1-jia.yao@intel.com>
 <20260730232712.517989-4-jia.yao@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260730232712.517989-4-jia.yao@intel.com>
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

On 31/07/2026 00:27, Jia Yao wrote:
> The HW unit that writes fault descriptors into the UM queue ring buffer
> may not be coherent with the CPU cache.  If a descriptor write is still
> sitting in a GPU L3 cache line when GuC reads the slot, GuC sees the
> stale (all-zero) content from DRAM and forwards an invalid descriptor to
> the driver (Faulted Address = 0, ASID = 0).
> 
> Mark the UM queue BO as uncached (XE_BO_FLAG_NEEDS_UC) so that writes
> bypass the cache and are immediately visible to GuC.
> 

Did you mean to drop the fixes tag here?

Fixes: 9c57bc08652a ("drm/xe/lnl: Drop force_probe requirement")
Cc: <stable@vger.kernel.org> # v6.12+

> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Jia Yao <jia.yao@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

