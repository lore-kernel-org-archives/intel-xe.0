Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689B5C4332F
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 14:05:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1443310E038;
	Mon,  6 Nov 2023 14:05:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB7410E038
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 14:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699279508; x=1730815508;
 h=message-id:date:mime-version:subject:from:to:references:
 in-reply-to:content-transfer-encoding;
 bh=UD8L9nfiwd5ZqSRh1hKCIMvY98z+g5W9WlcXSfYMrFM=;
 b=KYRmEVnvuZkpT2avZA3lhEu1CkrjVYlySXiTcO4bqk2DkcwYsuZA0wKA
 BZW3pXcgdnaQNIl3Z4hCxYm/0d7k043ofaRGIRgCr3eME/L0b+V68jrCd
 HwrR3Kx+cnImnHWR+YeXeE+wncAAUBnY8W0OLA79tnvUCmNEw3bycUDU0
 ukWvvFBZw4pb8dRjLDdga5RPGkOiB8LxOKNhY14TbzdXELLXAuNwVs/Tw
 nWxEuF/12VyJuk8AfJ3EguQKQBafPYwlYiPxPoL1MIY8FhvccT1LOVnp+
 tTNPXLWUhR3d69VSZtmj8aUvnCt5CamSQRmhZFs2nEPYta7Bzagy/V+aR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="386454526"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="386454526"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 06:05:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="797311876"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="797311876"
Received: from lapeders-mobl1.ger.corp.intel.com (HELO [10.249.254.193])
 ([10.249.254.193])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 06:05:06 -0800
Message-ID: <653ca1fe-ff3a-5f89-c081-fb84f1a7051f@linux.intel.com>
Date: Mon, 6 Nov 2023 15:05:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20231026040213.1272993-1-matthew.brost@intel.com>
 <20231026040213.1272993-2-matthew.brost@intel.com>
 <fb2e37fa-be28-70e6-37c8-bfc8e0625545@linux.intel.com>
In-Reply-To: <fb2e37fa-be28-70e6-37c8-bfc8e0625545@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 11/6/23 14:16, Thomas Hellström wrote:
> Hi,
>
> On 10/26/23 06:01, Matthew Brost wrote:
>> The idea being out-syncs can signal indicating all previous operations
>> on the bind queue are complete. An example use case of this would be
>> support for implementing vkQueueWaitForIdle easily.
>>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>
> Do we actually create a gpu job when num_binds == 0 so that in-fences 
> and waiting for previous binds actually work as intended even when we 
> remove the async queue?

Or to rephrase since the async queue is actually already removed, 
Similar to review for patch 2 / 26 Do we ensure correct ordering even in 
the presence of in-fences here?

/Thomas



>
> /Thomas
>
>
