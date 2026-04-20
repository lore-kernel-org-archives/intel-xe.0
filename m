Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66DA8F5A8A5
	for <intel-xe@archiver.kernel.org>; Mon, 20 Apr 2026 17:35:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D2310E180;
	Mon, 20 Apr 2026 17:35:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NUqyngew";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1339410E180
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Apr 2026 17:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776706517; x=1808242517;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=SG01c9U5d8fFYSpisi0jsbXFNvS/Dc/QMpE0skyMp3c=;
 b=NUqyngewKIAx5rjmNpqCpl3JYb/pGQncfoMI0WymbUZeCsM/YU66EbYB
 jlg36mFrFj1tVpYYffYlRk0mg0zxp/SI76cnW4lhQ656ZxaJPELHZudDo
 T0KjQH2Ad9jUcsI0LY8GI+6/2MWXLOmWis33buM1uDd/+Yyuhkqtz/LPH
 18HSqqRnQcv6VV/ucvA2IQmrACBgbMMoeBOu2hDBeVssntxd+emZd8DDg
 KMTRzOEseFy7F52SckAJ327V8i4Uny9R7Dykvd2IDzGVwwjpx582dhzx6
 P7dUGLHXh7cfz9c5/WFXEdZiozS9hzV6/lDfskcU5YYxbvRXss8cvheTn g==;
X-CSE-ConnectionGUID: UO2pjQqgSbOzjCw1yb6wvw==
X-CSE-MsgGUID: kQEeSDgWQSSKMLD0g7S2Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="80220402"
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; d="scan'208";a="80220402"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 10:35:16 -0700
X-CSE-ConnectionGUID: uHVGcwbfQJKEk/r0KcAaYA==
X-CSE-MsgGUID: y/hnfwV5QBKJdd7pkPh76Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; d="scan'208";a="269837501"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.102])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 10:35:14 -0700
Date: Mon, 20 Apr 2026 19:35:10 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Purkait, Soham" <soham.purkait@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>, intel-xe@lists.freedesktop.org,
 riana.tauro@intel.com, anshuman.gupta@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, anoop.c.vijay@intel.com
Subject: Re: [PATCH v1 2/2] drm/xe/xe_ras: Add RAS support for GPU health
 indicator
Message-ID: <aeZjzhyKjdh27lSP@ashyti-mobl2.lan>
References: <20260416093610.4085667-1-soham.purkait@intel.com>
 <20260416093610.4085667-3-soham.purkait@intel.com>
 <aeDN6g6HWd3v-V72@ashyti-mobl2.lan>
 <bd5d4112-36c1-4e9f-b06e-08213922c157@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bd5d4112-36c1-4e9f-b06e-08213922c157@intel.com>
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

Hi Soham,

On Mon, Apr 20, 2026 at 09:49:32PM +0530, Purkait, Soham wrote:
> On 16-04-2026 17:24, Andi Shyti wrote:
> > On Thu, Apr 16, 2026 at 03:06:10PM +0530, Soham Purkait wrote:
> > > GPU health indicator exposes a single sysfs interface, gpu_health,
> > > at the device level, allowing administrators and management tools to
> > > query the GPU health status. The interface permits both read and write
> > > operations on PF and native functions, while on VFs it is exposed as
> > > read-only.
> > Can you describe better the interfaces? The input and output
> > values?
> 
> Sure. I missed it in this series. I think it is better to be in cover-letter
> isn't it  ?

I was referring to the commit log. Of course, you can also add
them in the cover letter, but that's up to you if you see it
necessary.

Andi
