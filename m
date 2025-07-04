Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023F4C83F03
	for <intel-xe@archiver.kernel.org>; Fri,  4 Jul 2025 12:04:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAEAE10EA05;
	Fri,  4 Jul 2025 12:04:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CTQeIw4S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E2810EA05
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Jul 2025 12:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751630691; x=1783166691;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kpJBGxbbJiVsqrm/norBIVNb4ha2jipOMTNr35caaAI=;
 b=CTQeIw4SF7gdZxXDHnhTkBnQMo099s9Kco/Y2xz0zJztgx+Cq/78t7W5
 bvyqkbGGELIzu26tiC9J6HXf8Qa30ebUDX7n/ZjLrSxwbkfkuEzYx0Z3s
 QfWH0VSz25qKMs4qExltXNixU1sRk+J0W1o+03YYYpH1Srp+ChtuVJMKm
 FOv85m55mMFXkudit3R+1s5gTjw26rl6AD3nDnCBt0XSaejv2uQqhYkux
 IqCz4IbNTG8KyNKY+N7ZafBrbuqZSc/ihErXm2cB5klw54ZuDsmJt5SJE
 zwhhbcvGg406otgCDtruQpLJHFCn8o4lolIi6HLRz2bbK/W9ablFbH0UK A==;
X-CSE-ConnectionGUID: jhLMjWyQSSW8CcbpMYRrSA==
X-CSE-MsgGUID: R1VAV27hSBiDjSi5nKd2DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53832418"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="53832418"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 05:04:51 -0700
X-CSE-ConnectionGUID: J5pRu+TYRVCf2nxL7s4mvw==
X-CSE-MsgGUID: xpBDxkX2R+WbX03HYSn+yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="185584209"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.245.51])
 ([10.245.245.51])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 05:04:49 -0700
Message-ID: <1653febe-2dce-4c1b-9c70-97dcdc1b17fa@intel.com>
Date: Fri, 4 Jul 2025 13:04:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/bmg: Add one additional PCI ID
To: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: balasubramani.vivekanandan@intel.com, Vodapalli@freedesktop.org
References: <20250704103527.100178-1-ravi.kumar.vodapalli@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250704103527.100178-1-ravi.kumar.vodapalli@intel.com>
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

On 04/07/2025 11:35, Ravi Kumar Vodapalli wrote:
> From: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>
> 
> One additional PCI ID is added in Bspec for BMG, Add it so that
> driver recognizes this device with this new ID.
> 
> Bspec: 68090
> Signed-off-by: Vodapalli, Ravi Kumar <ravi.kumar.vodapalli@intel.com>

Going by similar changes should we also add:

Cc: stable@vger.kernel.org # v6.12+

?

That way user doesn't need a bleeding edge kernel just to get a working 
machine, or is there something special about this pciid which needs some 
other kernel changes?

> ---
>   include/drm/intel/pciids.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
> index a0180d10e260..76f8d26f9cc9 100644
> --- a/include/drm/intel/pciids.h
> +++ b/include/drm/intel/pciids.h
> @@ -846,6 +846,7 @@
>   /* BMG */
>   #define INTEL_BMG_IDS(MACRO__, ...) \
>   	MACRO__(0xE202, ## __VA_ARGS__), \
> +	MACRO__(0xE209, ## __VA_ARGS__), \
>   	MACRO__(0xE20B, ## __VA_ARGS__), \
>   	MACRO__(0xE20C, ## __VA_ARGS__), \
>   	MACRO__(0xE20D, ## __VA_ARGS__), \

