Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A954FC61D97
	for <intel-xe@archiver.kernel.org>; Thu, 23 Nov 2023 15:35:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B3F10E09E;
	Thu, 23 Nov 2023 15:35:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA7C10E09E
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Nov 2023 15:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700753698; x=1732289698;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LGOjzaln0AsB7uTQKhfGQCuJNQmJrjWXIBlriFdR4zM=;
 b=gH8FrDo8JcMcxlCZiK/Z7GLzY/4w8HPjqRfzjmEYk29GNWdPwkFjKdeh
 /5egWmPDS5mG6xNFr047lQ8oy5inloKUQMRqZ4VNB3NYe+ZGQQZK04V07
 7mWvrznPFdb2f6+K95MRiSh5W4mHEn/t4u+VAyed4j/iAln2AXMfsJftS
 ucABfbv98rXo3HV5FK9TsK9cO6nUp8ev5BABWlilP2uZvsOvLZIO5axp5
 5FvEodSJ6EESg8olH83tuTQEaG4VM2cftDULdX3XJXMsSDSzhF8uit6zp
 kuhKGbO1/jxg3ebJBPtcMb+dPN17nV3VwyvatMN1l64YyD8cFzAv9T9pw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="395107611"
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; d="scan'208";a="395107611"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2023 07:34:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="890809898"
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; d="scan'208";a="890809898"
Received: from mocoilea-mobl1.ger.corp.intel.com (HELO [10.252.24.207])
 ([10.252.24.207])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2023 07:34:57 -0800
Message-ID: <73478d93-9cb0-46c9-b3f3-8495bcb98e30@intel.com>
Date: Thu, 23 Nov 2023 15:34:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20231123153158.12779-1-thomas.hellstrom@linux.intel.com>
 <20231123153158.12779-2-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20231123153158.12779-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v2 1/4] drm/xe: Ensure that we don't access
 the placements array out-of-bounds
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

On 23/11/2023 15:31, Thomas Hellström wrote:
> Ensure, using xe_assert that the various try_add_<placement> functions
> don't access the bo placements array out-of-bounds.
> 
> v2:
> - Remove the places argument to make sure the xe_assert operates on
>    the array we're actually populating. (Matthew Auld)
> 
> Suggested-by: Ohad Sharabi <osharabi@habana.ai>
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/946
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
