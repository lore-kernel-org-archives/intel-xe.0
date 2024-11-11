Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9EABD5E39A
	for <intel-xe@archiver.kernel.org>; Mon, 11 Nov 2024 08:34:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A99E510E436;
	Mon, 11 Nov 2024 08:34:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="amwPHQdw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A5D10E436
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Nov 2024 08:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731314059; x=1762850059;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Qw0waPHKzeQvDumySVfRMRtmqdeBiISBP2VPbW8KQAY=;
 b=amwPHQdwyALGBTFOyTZ/MzcOKb/nv5zv1wlvZksg1chhmN01ON8r6PKS
 Gu4YA8jQRxdjSX0Uo2WK11TMxkk8VsCX5lhwdznBvubC2ulclv+kYFRaS
 ikmVZLipOF2uEChQG/vbr8j2DTOsYLMRnWgCTH1HWz1P/3C5rXhulVyVk
 DkcphotsMDU7DLSJY6ciZRviCaHVr4dSOv4KHrbAykpr7jibL0zihoFaD
 KHVQTnrw/71RnSxgDa4s8mMd0H1+j4XM/8z7Vy9GykChqwykFSV1RpgWP
 MLkT3yAF0gzCdEB2/5Y9LTdXuEqR20g/JM6aeasImme19JJOF/IYh7Op9 Q==;
X-CSE-ConnectionGUID: XcvCPvNSS5KClYCUUcMdSg==
X-CSE-MsgGUID: rLTngymxRom40WtU56qHSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="31333997"
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; d="scan'208";a="31333997"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 00:34:19 -0800
X-CSE-ConnectionGUID: LghEgWQ1RoajO+Z8pKmSQQ==
X-CSE-MsgGUID: X+6Xkdf4SuKbeKmf3KhkAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; d="scan'208";a="86771188"
Received: from smile.fi.intel.com ([10.237.72.154])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 00:34:18 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tAPsE-0000000DWsb-2KT1; Mon, 11 Nov 2024 10:34:14 +0200
Date: Mon, 11 Nov 2024 10:34:14 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 david.e.box@linux.intel.com, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, rodrigo.vivi@intel.com, lucas.demarchi@intel.com
Subject: Re: [PATCH 1/2] platform/x86/intel/pmt: allow user offset for PMT
 callbacks
Message-ID: <ZzHBhsJ_J3ARhLu9@smile.fi.intel.com>
References: <20241108201955.2048085-1-michael.j.ruhl@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108201955.2048085-1-michael.j.ruhl@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Fri, Nov 08, 2024 at 03:19:53PM -0500, Michael J. Ruhl wrote:
> Usage of the telem sysfs file allows for partial reads at
> an offset.
> 
> The current callback method returns the buffer starting
> from offset 0 only.
> 
> Include the requested offset in the callback.
> Update the necsessary address calculations with the offset.

...

> -	memcpy_fromio(buf, addr, count);
> +	memcpy_fromio(buf, addr + off, count);

This will give an unaligned IO access in some cases. Is it a problem?

-- 
With Best Regards,
Andy Shevchenko


