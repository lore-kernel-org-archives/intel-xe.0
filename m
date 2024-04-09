Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CB5CD1284
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 11:33:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39BF910E54A;
	Tue,  9 Apr 2024 11:33:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kMwxvlcZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3209B10E54A
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 11:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712662429; x=1744198429;
 h=message-id:date:mime-version:subject:from:to:references:
 in-reply-to:content-transfer-encoding;
 bh=E0g/cnAjgbKi5xmNYai05YTv/CxtIajzbmiUgz8p134=;
 b=kMwxvlcZkNndG5/3zlVL1Gcv/+K6dd6EuE3DUqtBUDB/gpUDWVXuZjgr
 qqC76iuBahAhMNrg7FYPqvf/021fqpDidcDgaPMLpmB5cgimQjhLb2+56
 OssMoeXyjX4dCSp2JT6Hk15Z1TKbVChreqq8mmmUHwBT9BxGSAsLexJt1
 3f2DM1Xd6ZHIPSoWOPb9gObkh4eWilxHtDaAY7QsPfriGEpdvo5Pp/Drk
 Z91E2208ggkbkC9Snq67ePb+wnoUvUH8dlS6DlGVDGfzpjV4tLQxsMeyV
 HqmAPLKES5nsDAB9diSRXMRQ0F2QeA4NMR0LhbjAJOJVNS0VfOYO/ApMy g==;
X-CSE-ConnectionGUID: Ruj8yktoTO6jeInFamIjDQ==
X-CSE-MsgGUID: 6XzxV43MT12buqfS1s4ZRw==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="18687772"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="18687772"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 04:33:49 -0700
X-CSE-ConnectionGUID: kmyzLMK0QnCI9LZ8eY8l0g==
X-CSE-MsgGUID: MD1gFEvyR+qaAXWMCc/YUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="20241647"
Received: from unknown (HELO [10.245.245.238]) ([10.245.245.238])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 04:33:48 -0700
Message-ID: <56175793-a4a4-44ec-a1b1-2d978859e677@intel.com>
Date: Tue, 9 Apr 2024 12:33:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915: Use enum mode in drm_mm_insert_node_in_range
From: Matthew Auld <matthew.auld@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
References: <20240409111541.2478-1-nirmoy.das@intel.com>
 <a93ebbfc-6f04-4028-b50b-a2505f573125@intel.com>
Content-Language: en-GB
In-Reply-To: <a93ebbfc-6f04-4028-b50b-a2505f573125@intel.com>
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

On 09/04/2024 12:31, Matthew Auld wrote:
> On 09/04/2024 12:15, Nirmoy Das wrote:
>> Use DRM_MM_INSERT_BEST as mode instead of zero.
>>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Commit title should be prefixed with drm/xe:

> 
