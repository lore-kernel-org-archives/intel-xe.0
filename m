Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BFFC3DA63
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 09:17:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DED710E4F3;
	Tue, 23 Jul 2024 09:17:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j7a0/VnV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4636A10E521
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jul 2024 09:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721726255; x=1753262255;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=pcDkKTKG3q2cddQoKkf9eaf1THTCEpxSOLhQGmdWsrg=;
 b=j7a0/VnVS1L/baTC/34UOH1VFcw/5ITWmLWU6W+QlVoLwdemOGjoSemu
 nSMpl1I+Q6BeLI5236Atoy6FyI9fV0vJZ8W+E/cDth/rtlrXJLQI8p/+g
 TjJ2TfItxDFEvRnkIrogrimQDt5v2GtHJXVDA9xkBIbSYIj5Jn6iLNgG4
 ZTi3vfdNGs+l55bd/+zm3q37yb6jhXXaZzAcG/3DY8x+kMRtB0MYs948b
 1BFVcs/cDBrKueeJk1lFBl+ItjC9eU1SxCfYj73yWp1iZ+FFybJNzlnPy
 ko6uW/S1IEUngBC+OFNurQCRGWjo/U4MqQzgN5SlSBJ1VvQ6/xf9lzhM1 w==;
X-CSE-ConnectionGUID: VnK1TBEuSaylQgdGThKnYw==
X-CSE-MsgGUID: VVXCZr3bTfi/vcWxK+D4pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="29956172"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="29956172"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 02:17:19 -0700
X-CSE-ConnectionGUID: bK0aHqAUQ26f86T1yE8Z2Q==
X-CSE-MsgGUID: Ln5Dl7OqSOWR4DVOtTfJZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="83186289"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.245.253])
 ([10.245.245.253])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 02:15:57 -0700
Message-ID: <25a3301b-4925-4630-8ee5-4c7951fb8b4a@intel.com>
Date: Tue, 23 Jul 2024 10:15:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix xe_pt_abort_unbind
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20240723010230.1652707-1-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240723010230.1652707-1-matthew.brost@intel.com>
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

On 23/07/2024 02:02, Matthew Brost wrote:
> When restoring the childern PT entries on a bind failure the incorrect

children

> loop index has used resulting in PT entries being leaked. This is shown
> by running xe_vm.bind-array-conflict-error-inject on a VRAM device going
> into a suspend state after the test completes.
> 
> Fixes: a708f6501c69 ("drm/xe: Update PT layer with better error handling")
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
