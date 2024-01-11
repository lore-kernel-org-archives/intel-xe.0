Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF00C47077
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 18:26:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B79510E975;
	Thu, 11 Jan 2024 18:26:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F161C10E975
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jan 2024 18:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704997608; x=1736533608;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=UPZyRdTFmgS5Zfl6Ez08nzwm+OCC3gSMjpw++yKLgd0=;
 b=gtosfDmIkKt8IqMSIDjF7zxVjcLNgS45HSkibb+QP0c/H/5t+tNJuCgm
 cxvrUcDqvykBonLUG5etcF4SlkUYsUaVOJvqTbjUyqflM8lrTC5bX4nnM
 6YUIOFpAdGgTBDm4NerZi0V2cEww9Z/LSicvnMrleUpy4RmM64He5e59S
 gFs5UUnoebKrziebi3SslnqfjJTkzqhi8ig6vJ2AKnuPpbhtCqbijK2qH
 vKSK4xp5mbC0zaikpHG2f1B9Xx4gFRS9r5CztyocXFX+Xk5w07VsVeeEe
 onemQ/nojJGgSYpWcxmDCnbUyS9oMVfbVvLOMOXXFnEDfVkV6qG7Ksynb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="402717150"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; d="scan'208";a="402717150"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 10:26:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="1113943150"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; d="scan'208";a="1113943150"
Received: from kklimes-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.252.38.5])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 10:26:46 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Turritopsis Dohrnii Teo En Ming <teo.en.ming@protonmail.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: Question on Intel Iris Xe Graphics on Laptops
In-Reply-To: <aRnjmXLlTs07MdYbmlK1XqpR8wTCugB4w9v8VmEo7Cn5_QH6mCeAbRspsTYAhTQnx7nwXMVbERu0Qq2yWxZQPYZy0u1f2UhlXL0aB9T4fKQ=@protonmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <aRnjmXLlTs07MdYbmlK1XqpR8wTCugB4w9v8VmEo7Cn5_QH6mCeAbRspsTYAhTQnx7nwXMVbERu0Qq2yWxZQPYZy0u1f2UhlXL0aB9T4fKQ=@protonmail.com>
Date: Thu, 11 Jan 2024 20:26:42 +0200
Message-ID: <87il3zu3od.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: "ceo@teo-en-ming-corp.com" <ceo@teo-en-ming-corp.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 11 Jan 2024, Turritopsis Dohrnii Teo En Ming <teo.en.ming@protonmail.com> wrote:
> How is Intel Iris Xe Graphics compared to the NVIDIA GeForce GTX 1050
> TI GPU on my Aftershock gaming laptop, in terms of 4K video rendering
> performance? Is it significantly faster than my NVIDIA GeForce GTX
> 1050 TI GPU when rendering 4K videos? Does it take much much shorter
> times to render 4K videos compared to my NVIDIA GeForce GTX 1050 TI
> GPU? I render 4K videos and upload them to YouTube on a regular basis.

This list is for the xe driver development only. Please refer to
independent sites for performance comparisons.

BR,
Jani.

-- 
Jani Nikula, Intel
