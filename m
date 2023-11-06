Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37232C0018A
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 13:16:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B20410E312;
	Mon,  6 Nov 2023 13:16:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC28410E312
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 13:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699276592; x=1730812592;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=aQvWhtFr7YKcdZaqcVYARnCPn46Yylkvx93xDE4E6UI=;
 b=V9ot04keRHaEpsj9zAOaPUcpwSK+Ze2ibmZbLDj9hnN9j60aRUB+B+al
 0ZqLLxZ0wSAa4Ic8l6VlsKjzdx0pP8TnWrirmrDVKTZxIXlgvA4y8igVS
 eyUl/GZqsYm4XSUcArtH3WrIlnwTejza0EnwRA+q2LhnkZyQ43YYz4i2m
 A5CcbVbbkMC2UPEjqSDJZlNpfSxxVySNHyEcpN7V6UVEL3gz1Z2QEWATT
 ltaKBEgAVCnkRp3h6BL73KsuV/jhiLUKESvxV8k6JrlJKRY0g5WxZdkum
 GBNjSEl/zbeQjmI5PFdT0kraQAwLK2NGi5O87rhT2OA3OQRXgXtRcDo6s Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="369475894"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="369475894"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 05:16:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="762314563"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="762314563"
Received: from lapeders-mobl1.ger.corp.intel.com (HELO [10.249.254.193])
 ([10.249.254.193])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 05:16:30 -0800
Message-ID: <fb2e37fa-be28-70e6-37c8-bfc8e0625545@linux.intel.com>
Date: Mon, 6 Nov 2023 14:16:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20231026040213.1272993-1-matthew.brost@intel.com>
 <20231026040213.1272993-2-matthew.brost@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231026040213.1272993-2-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 01/26] drm/xe: Allow num_binds == 0 in VM
 bind IOCTL
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

Hi,

On 10/26/23 06:01, Matthew Brost wrote:
> The idea being out-syncs can signal indicating all previous operations
> on the bind queue are complete. An example use case of this would be
> support for implementing vkQueueWaitForIdle easily.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Do we actually create a gpu job when num_binds == 0 so that in-fences 
and waiting for previous binds actually work as intended even when we 
remove the async queue?

/Thomas


