Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806E4C67861
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 11:31:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 283D810EBFE;
	Tue,  9 Apr 2024 11:31:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UY7ABdRP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B087C10EBFE
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 11:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712662291; x=1744198291;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=60bpSK96AvaefWlkO5SQSMXjtfo2lwzLcG0nDS2rJqc=;
 b=UY7ABdRPGDhBnhbcFEma/AYSCF533fNtRxFeUxxbE+eFdc4khc5jjb+3
 TgibMGG79VxwlhUGyJT5sCfCZFp1IeQreLQJCq6a2/TUtUUhzzIKf3Z5y
 QU5ZwoDz2+lNCVXn3r4+pHXfgdOPBpvRgCgTJt40m2rtN2JOG3X/wcZj6
 fqjCeu6nPM2wVxsSdHSYqYGBbPFaVWavnFEvYat/kE628f9ezBqAq23FY
 xogofGfNhLp/3OejuMkZ2vkP3ygiT1DvpZJo4BMn7I3Q6hqfiZDfqaWqM
 p9hPW0MyxckyKcKJV74GAzBTbdi6URPjRAzRuFpbP+J/AvIVhhr6lVZWY A==;
X-CSE-ConnectionGUID: zK/45cHCRc6tFsQRD6P1Hw==
X-CSE-MsgGUID: 5uVvcsWXT/67YLNaFT3lwA==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="19353712"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="19353712"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 04:31:29 -0700
X-CSE-ConnectionGUID: 7nCTnselQNi0ctTk7eobwA==
X-CSE-MsgGUID: ++NBqf1ERqeO6UqYpqZlPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="20770970"
Received: from unknown (HELO [10.245.245.238]) ([10.245.245.238])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 04:31:28 -0700
Message-ID: <a93ebbfc-6f04-4028-b50b-a2505f573125@intel.com>
Date: Tue, 9 Apr 2024 12:31:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915: Use enum mode in drm_mm_insert_node_in_range
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
References: <20240409111541.2478-1-nirmoy.das@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240409111541.2478-1-nirmoy.das@intel.com>
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

On 09/04/2024 12:15, Nirmoy Das wrote:
> Use DRM_MM_INSERT_BEST as mode instead of zero.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

