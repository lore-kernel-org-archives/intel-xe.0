Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8627C678D4
	for <intel-xe@archiver.kernel.org>; Mon,  6 Mar 2023 10:25:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A427810E1E0;
	Mon,  6 Mar 2023 10:25:53 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 912F710E1E0
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Mar 2023 10:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678098350; x=1709634350;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=TScCBCPhPtlMKLc8yr6Y+dtLGjwnrIKJ4gQ98o4H9/M=;
 b=Tj/euaWLingIEduy6twJT6C35Jv3AZDzmSp1XMqdkB73pYjNP6uZ4+yI
 FP4sO/sqSVJyMjRy/ZG1iT26+Jhoxv+VJVSM5vHDuAHTHirrFwjVcaPXy
 W2grfde9YoCUNFIrW4UPvqhcJYr2Hxynh7BMKoSfjaE9YvLXWSpuBlXqp
 fIVmXf8X/jQDiDT7hawFwjATE6hUywkawp4Qf45VJB1JGOcDTn40kuY7W
 xYUXx3YatbT4fACAdoyopW0ss2TZ/dkEioGix45qDgQzk8JmUEYx+hpdq
 XIGpg27NCJCniJlCecPR+vOie754Z3gN/nzcneBtAhdxU2C83FUpBHvqT w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="421793903"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; d="scan'208";a="421793903"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 02:25:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="669389777"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; d="scan'208";a="669389777"
Received: from kmreisi-mobl.ger.corp.intel.com (HELO [10.252.45.119])
 ([10.252.45.119])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 02:25:48 -0800
Message-ID: <238e79d2-4d99-b526-eb0d-049506072fdb@linux.intel.com>
Date: Mon, 6 Mar 2023 11:25:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Content-Language: en-US
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230302095528.20469-1-niranjana.vishwanathapura@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20230302095528.20469-1-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] drm/xe/migrate: Fix number of PT structs in
 docbook
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
Cc: thomas.hellstrom@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hey,

On 2023-03-02 10:55, Niranjana Vishwanathapura wrote:
> Update xe_migrate_doc.h with 32 page table structs (not 48)
>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_migrate_doc.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_migrate_doc.h b/drivers/gpu/drm/xe/xe_migrate_doc.h
> index 6a68fdff08dc..584972c4d3be 100644
> --- a/drivers/gpu/drm/xe/xe_migrate_doc.h
> +++ b/drivers/gpu/drm/xe/xe_migrate_doc.h
> @@ -21,7 +21,7 @@
>    * table BOs for updates, and identity map the entire device's VRAM with 1 GB
>    * pages.
>    *
> - * Currently the page structure consists of 48 phyiscal pages with 16 being
> + * Currently the page structure consists of 32 phyiscal pages with 16 being

This leaves a small typo in physical, the next word.

With that fixed:

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

>    * reserved for BO mapping during copies and clear, 1 reserved for kernel binds,
>    * several pages are needed to setup the identity mappings (exact number based
>    * on how many bits of address space the device has), and the rest are reserved
