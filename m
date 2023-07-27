Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67ECEC0015E
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 16:08:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1333D10E5B9;
	Thu, 27 Jul 2023 16:08:33 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0797110E5B9
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 16:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690474112; x=1722010112;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ciodhrwNlH7bBoyVzikjXahquPdYP3khS+wy+kQrGUk=;
 b=kRmrcOYMA963/Y3K3TVdFnKRRTr4kcXK3l4Uevw95pX8QdNW9fvOsXrz
 hSVjgmRG996NKCIiOfKulOt1AZe50nOC1Uuk5RURei6ASN9E7OEhy3ZbT
 X5YY9ELWkkNIhNouBaWAcFXrhfODpGUzMxAQaYlZ1NO+cBtoidy45YmUV
 W4t6VkeVWdyk10IgXrK+fx3Sf+9+aJb2Z7pmNQNryNJT5bMBnNCPoH4ae
 gIDpL/2VQbFJd7wsMUwXVOAvpuNSy/B8c8izFVHphHzUyOzIrRpyKsfky
 5aF9nevvTCroXIiH5kIPwbtiEgTrjESxvykMtRqCcoHruob3an0WuT0Ky g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="353266853"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="353266853"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 09:08:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="727065309"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="727065309"
Received: from thomasph-mobl1.ger.corp.intel.com (HELO [10.252.16.87])
 ([10.252.16.87])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 09:08:30 -0700
Message-ID: <eadce48a-9002-54cd-50c6-d1d23cfdf0c6@intel.com>
Date: Thu, 27 Jul 2023 17:08:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <ZMFW6AkUQCWNGdpl@intel.com>
 <20230726213042.394720-1-rodrigo.vivi@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20230726213042.394720-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix an invalid locking wait context
 bug
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

On 26/07/2023 22:30, Rodrigo Vivi wrote:
> We cannot have spin locks around xe_irq_reset, since it will
> call the intel_display_power_is_enabled() function, and
> that needs a mutex lock. Hence causing the undesired
> "[ BUG: Invalid wait context ]"
> 
> We cannot convert i915's power domain lock to spin lock
> due to the nested dependency of non-atomic context waits.
> 
> So, let's move the xe_irq_reset functions from the
> critical area, while still ensuring that we are protecting
> the irq.enabled and ensuring the right serialization
> in the irq handlers.
> 
> v2: On the first version, I had missed the fact that
> irq.enabled is checked on the xe/display glue layer,
> and that i915 display code is actually using the irq
> spin lock properly. So, this got changed to a version
> suggested by Matthew Auld.
> 
> v3: do not use lockdep_assert for display glue.
>      do not save restore irq from inside IRQ or we can
>      get bogus irq restore warnings
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/463
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

