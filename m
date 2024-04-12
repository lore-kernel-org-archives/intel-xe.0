Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77F1C00A94
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 14:39:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A4810F684;
	Fri, 12 Apr 2024 14:39:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m/ExsPaN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A30B510F697
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 14:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712932770; x=1744468770;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=a88yx3ZXqv+NEh41ydyx5uIq8YumzwdM5CJNah/4jLw=;
 b=m/ExsPaN+mGkBwWG5NKQf67k38O84NxY+Ueqqg8VpF6+mnjytx2VpyVy
 JNWafZjPb61IXUazc4G4wOhd9S0YLWpn1B0XNpWPvC8CijwRUozfEy5zC
 4VgWDS4QhPLNB7dO/BQMn79kIgvBIly/GjXD2FZoivBSMa5W/hs15Kb4I
 JfRV+rm2wwi/rAhIhoFoWIgfsyj+Xpn+5/GNzgDv1TS127D4QMHAmIhjU
 cEeWuarPwXlTf/QTKJqJ0+nFPFGApGF0VREla0klSsAZLTC6/lhAHAYpB
 HxcEa9gUtf5Chlbej+LXOl4sxHe2OeGianPXXPwRXfEtya8mzfkegzaYw Q==;
X-CSE-ConnectionGUID: AITTimOOSsitMgQX27NGIA==
X-CSE-MsgGUID: CV1xfOUPTtCDJDaT/RIDbQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8496112"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="8496112"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 07:39:29 -0700
X-CSE-ConnectionGUID: VbiHY1R8QTm2DKuSJTkZxg==
X-CSE-MsgGUID: RfqFclaMSsuqe/0fRwgY3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="25902682"
Received: from mohdaris-mobl1.gar.corp.intel.com (HELO localhost)
 ([10.252.61.65])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 07:39:26 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Dafna Hirschfeld
 <dhirschfeld@habana.ai>, Matt Roper <matthew.d.roper@intel.com>, Niranjana
 Vishwanathapura <niranjana.vishwanathapura@intel.com>, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Generate oob before compiling anything
In-Reply-To: <2vhlfwcxjtpjjlj6ddpfuunkqanfrvbdzw76mfsoa4rtjmm2gl@aaqz5bxidaa6>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240411210703.3296782-1-lucas.demarchi@intel.com>
 <87v84n3w8q.fsf@intel.com>
 <2vhlfwcxjtpjjlj6ddpfuunkqanfrvbdzw76mfsoa4rtjmm2gl@aaqz5bxidaa6>
Date: Fri, 12 Apr 2024 17:39:20 +0300
Message-ID: <87h6g64pd3.fsf@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, 12 Apr 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Fri, Apr 12, 2024 at 09:56:05AM +0300, Jani Nikula wrote:
>>On Thu, 11 Apr 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>> Instead of keep adding more dependencies as WAs are needed in different
>>> places of the driver, just add a rule with all the objects so the code
>>> generation happens before anything else.
>>
>>What's "oob" and why is it used unexplained everywhere?
>
> from xe_wa.c kernel-doc:
>
>   * platform. There are some basic categories of workarounds, depending on
>   * how/when they are applied:
>
>    ( ... )
>   * - Other/OOB:  There are WAs that, due to their nature, cannot be applied from    
>   *   a central place. Those are peppered around the rest of the code, as needed.    
>   *   Workarounds related to the display IP are the main example.                    
>
> This can certainly be improved and the link to wa_oob.c made. But it's
> not that it was not explained anywhere :)

Yeah, but... what does OOB mean? Out-of-band?

BR,
Jani.

-- 
Jani Nikula, Intel
