Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E3D10854DD
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 09:41:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 013AF10E78F;
	Wed, 18 Mar 2026 09:41:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FXrmcu+x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD0010E793;
 Wed, 18 Mar 2026 09:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773826905; x=1805362905;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=oGm7z5WFhS1F2vkp2tz9OgMWI+7feDYAJiM0g7xfIDk=;
 b=FXrmcu+xMEfhb9y6UX809/9HqEhVRJSWIxSenNclaCvXHEDW1TxMf9HY
 ShHvFltPxmMm3zvwjEyWsu8Oq8YpP1y+0+bIdD1nxuCJIWV8ur48dEChG
 8qdW4J+hWEopJ/Vvdh5xFhYy6UB3xKvh6aQ9Fx2mC8Cn7HT+0v/jKa4ar
 Gw156PQ54SYEZJ88TkxCSoaUwYpyeU3rl08c8QrWz/Em1fARUoOib+0vP
 EGxzqKXFroeDSsroz2pTa64DbcAOcXghlcRDPVCCGAHW95eqhbIGiq51T
 gdNt37kF1ge3S0NyYun42bqVchFCPk2veF4B+2Kt1ddN43xPVoo9mb2u4 Q==;
X-CSE-ConnectionGUID: o+DermWTQbKc7E2fyzgFNw==
X-CSE-MsgGUID: zmDQHVDaRseVdJJW+SfHzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74576679"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="74576679"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 02:41:44 -0700
X-CSE-ConnectionGUID: RgoHS1T5QqqQniH98VHH5g==
X-CSE-MsgGUID: RV5SmwFiRTuRC+R39CUfiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="260473107"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.79])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 02:41:43 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Rahul Bukte <rahul.bukte@sony.com>, Tvrtko Ursulin <tursulin@igalia.com>
Cc: Suraj Kandpal <suraj.kandpal@intel.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915/gt: Check set_default_submission() before
 deferencing
In-Reply-To: <abo9bv1oz_5S66zE@rahul-Z690-S01>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260203044839.1555147-1-suraj.kandpal@intel.com>
 <864065cfcd3baaff212135beb781b0a5990728d8@intel.com>
 <abo9bv1oz_5S66zE@rahul-Z690-S01>
Date: Wed, 18 Mar 2026 11:41:38 +0200
Message-ID: <407885d79847863026260d4f911e905da8d51724@intel.com>
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

On Wed, 18 Mar 2026, Rahul Bukte <rahul.bukte@sony.com> wrote:
> Hi,
>
> On Fri, Mar 13, 2026 at 06:34:22PM +0200, Jani Nikula wrote:
>> On Tue, 03 Feb 2026, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
>> > From: Rahul Bukte <rahul.bukte@sony.com>
>> >
>> > When the i915 driver firmware binaries are not present, the
>> > set_default_submission pointer is not set. This pointer is
>> > dereferenced during suspend anyways.
>> 
>> Which kernel vesions did this happen with? Should this have had Fixes:
>> or Cc: stable?
>
> Fixes: ff44ad51ebf8 ("drm/i915: Move engine->submit_request selection to a vfunc")
> Cc: stable@vger.kernel.org
>
> Suraj, you mentioned that you have commited this to din [1]. Can we add
> this fixes and cc tags to that please?
>
> [1]: https://lore.kernel.org/all/DM3PPF208195D8D000253F905FADCA379F9E36DA@DM3PPF208195D8D.namprd11.prod.outlook.com/

Tvrtko, please pick this up for drm-intel-fixes.

BR,
Jani.

-- 
Jani Nikula, Intel
