Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD35CFC501
	for <intel-xe@archiver.kernel.org>; Mon, 14 Oct 2024 07:53:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8EA10E3B0;
	Mon, 14 Oct 2024 07:53:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UCww/qbC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86E510E3B0
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Oct 2024 07:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728892418; x=1760428418;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DGETLDSlQ4ezwlWlI/LnEF+cRQYknpxbmggCml9SCnE=;
 b=UCww/qbChKzmtfLe0IfbE+JIf98RSVM1TTdJGQi1fOhlDVTrjDmMtuNv
 TukgccqcetBdbxmMqrzi/aiHYp7skZdVXJucirrru2TuqALJYf36hSETq
 lcGXRRuAoNviZBpF54cPHd4jCpLOx6O5mnYkhbIN01/ipsVI7ZbleKcxK
 n2n5DPTedEb82OdbiQa8V8bflg8szRfCWetyBpybFqGud2FTg3sFGdYrJ
 jGoHFI4Z1gztPEzzJeDh89BEafEBfMIZnEU0SpHJqkP2lmyTDPqRe4SGp
 L1bbAz98Vi+BngGBYjRgxT0qN/sLSOvbGrcQEkEyGLEnh//nN4kHoAPqy Q==;
X-CSE-ConnectionGUID: L+s2QT5aTwKC/gMje6WLtg==
X-CSE-MsgGUID: 6ATD9NNZQyej3RWFBJu76A==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="28112320"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="28112320"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 00:53:37 -0700
X-CSE-ConnectionGUID: Q0AN8MZHRi62pWP+AW+P/Q==
X-CSE-MsgGUID: wmxC1R8aTV+Ivk1frMgKWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="108291489"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.94])
 ([10.245.244.94])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 00:53:36 -0700
Message-ID: <a8e10e81-8f54-44da-b8af-a10dd7f55f6a@intel.com>
Date: Mon, 14 Oct 2024 08:53:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/ufence: ufence can be signaled right after
 wait_woken
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
Cc: stable@vger.kernel.org, Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20241011151029.4160630-1-nirmoy.das@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241011151029.4160630-1-nirmoy.das@intel.com>
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

On 11/10/2024 16:10, Nirmoy Das wrote:
> do_comapre() can return success after a timedout wait_woken() which was

s/comapre/compare

> treated as -ETIME. The loop calling wait_woken() sets correct err so
> there is no need to re-evaluate err.
> 
> v2: Remove entire check that reevaluate err at the end(Matt)
> 
> Fixes: e670f0b4ef24 ("drm/xe/uapi: Return correct error code for xe_wait_user_fence_ioctl")
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
> Cc: <stable@vger.kernel.org> # v6.8+
> Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

