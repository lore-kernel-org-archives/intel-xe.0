Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF76AC7EE24
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 09:30:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F5F410E00B;
	Fri,  2 Jun 2023 09:30:01 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A88B010E00B
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Jun 2023 09:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685698198; x=1717234198;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=JxN5fUngxiiHj5BbYtJs+fXThsz0M0qF0LNO9SLpvF8=;
 b=aVTHA+yEIFxGH23JR4leSvORp9EZ37nWuQhGcQXbkdArEIVrJH2c2jpU
 7Bjfmm62NUFe/OGB0QChWJH/GmmZxxZMCArozzXK3dRgHlgitUmM9vZ+9
 hjMJpxTL3Jf0SgKfvnydGcST5PH+rcSp5t6y3utOzqYLnljYa4qecb5os
 UJaR8B6ht3QbjvExTvPK2h4Vx1zIzew/Q8cDn2jeIHpxIMTwtjabDzOLU
 Jn9+8bmw4sqSj9AY3byaI8eEsVJ7N3ssITILRzu8vnSj4TwFNOLDyDoTK
 y3QD1sspl34DP1px+adMbzSYUHvUfCpHpOP/+s0JG+pQHRo8ydyWFBoMK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="442203520"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="442203520"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 02:29:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="772837551"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="772837551"
Received: from pklosowski.ger.corp.intel.com (HELO localhost) ([10.252.55.229])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 02:29:56 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
In-Reply-To: <20230601174914.GL6953@mdroper-desk1.amr.corp.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230525161643.7-1-francois.dugast@intel.com>
 <jxctfqc4627xgu3nxumherp724kyqiz6iqhtxkrbp3ibtagpjn@mqeyghmdhwvf>
 <20230601164106.GJ6953@mdroper-desk1.amr.corp.intel.com>
 <w6uvvepfl3b34n2sbli5htn77j2g3jnaqg6fa2kkvntpgwnj6u@wqsakk7vtg5d>
 <20230601174914.GL6953@mdroper-desk1.amr.corp.intel.com>
Date: Fri, 02 Jun 2023 12:29:53 +0300
Message-ID: <87fs7afbzi.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH] drm/xe: Prevent flooding the kernel log with
 XE_IOCTL_ERR
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 01 Jun 2023, Matt Roper <matthew.d.roper@intel.com> wrote:
> One concern with "_ASSERT" is that people may incorrectly assume that
> it's something that only gets compiled into debug builds.  But with a
> different name like "_CHECK" or "_EXPECT" your proposal below looks okay
> to me.

On a related note, the reverse of this is one of the biggest issues I
have with GEM_BUG_ON() in i915. There's no hint that it's only for debug
configs. Having ASSERT in the name would go a long way in clarifying it.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
