Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41ADC77B75
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 13:33:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6508C10E12D;
	Tue,  9 May 2023 13:33:54 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D10EF10E12D
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 13:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683639232; x=1715175232;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=uVfiUHq0BIHMpwpO2axUvF3QoD7SZGb09ughqNxNVyI=;
 b=Y9pMoyWict1BH/P6dxENFzYNsnesxa1uAkMOFqIJ03EgdTjjqu8koPG0
 BXSqLJfIRmzACuvVfGK9+dcKAtI4FAYWOLnjO8wZbsbawwW1yBq+f5YWt
 jOXjrpyLJN9rr22k3SFLpX++H9KpF88qICfEkDkgqH0BAn8Z4fzaSc3GI
 lFTFEZ47gVfJpbaHqX600ybMzVPLzwuA6m7CDNJtJNqY7V8q4KlicM3uO
 srJ+c2KroynWfyVgYv0zYWvZqMLLjuT3Tx7s5HnnWXj7qzvMgrsuzgSLj
 NzqM8nOXSvI6CpH3/tIFwvnF+S/g0g+335Eff5qUrRNQif+9xRQKkqLHa A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="415494983"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="415494983"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 06:33:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="698901751"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="698901751"
Received: from jparkkin-mobl.ger.corp.intel.com (HELO [10.249.254.236])
 ([10.249.254.236])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 06:33:51 -0700
Message-ID: <8d88f83a-290e-c7fd-7e02-00ecc034c4e5@linux.intel.com>
Date: Tue, 9 May 2023 15:33:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-15-matthew.brost@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230502001727.3211096-15-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v2 14/31] maple_tree: Export mas_preallocate
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


On 5/2/23 02:17, Matthew Brost wrote:
> The DRM GPUVA implementation needs this function.

A more thorough explanation as to why  it's needed would help convince 
maple tree maintainers an export is needed.

Otherwise the change itself LGTM.

/Thomas


>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   lib/maple_tree.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/lib/maple_tree.c b/lib/maple_tree.c
> index 9e2735cbc2b4..ae37a167e25d 100644
> --- a/lib/maple_tree.c
> +++ b/lib/maple_tree.c
> @@ -5726,6 +5726,7 @@ int mas_preallocate(struct ma_state *mas, gfp_t gfp)
>   	mas_reset(mas);
>   	return ret;
>   }
> +EXPORT_SYMBOL_GPL(mas_preallocate);
>   
>   /*
>    * mas_destroy() - destroy a maple state.
