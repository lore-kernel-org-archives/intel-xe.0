Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC3FC47258
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 17:14:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB89410E7FA;
	Tue, 23 Jan 2024 17:14:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D63710E7FA
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jan 2024 17:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706030090; x=1737566090;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=WhFYZcF83S4KwNFOX2dfVtX2xV/x1NnNR+ALjLpOsZg=;
 b=LlGp64v34yeiCLcFIzPQscbg5NTYAC8mE5omUtU1JFvu1sM0fLsrey4g
 a0wI0hbCjW4NkAzEqoxoOyvN2C47AIGl/1R8KWHa+Ctmba1VdPO+3sQf+
 P2hq+bNI9yQIfVixYOCxFGdLvnAA/pGxtqtZPQ3IGVbL01xujxRnE8aPN
 Z8vv8Ay4kfYR92Ydv4NPtG0hAnR7moJyOluZMQm7o0mvUm0wWsaigsc/w
 NfMaTgE8cdIt8vulg07xKZm8I6H8vgFjebVHSg62JArgrq1iIzsFNi3oJ
 1ypWl481IuPxFGhPTdu4gHJdxzz3dyjJJAv9sDwGtmyX1B5E9r2W/l9a3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8342490"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="8342490"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 09:13:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="929397219"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="929397219"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 09:13:24 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: Re: [PATCH 2/2] drm/xe: drop display/ subdir from include
 directories
In-Reply-To: <663d25vngq6zcee6vupweq7dohhmftpaggtnfl7752sn6qhdao@ypgsfn62skob>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240122101428.2683468-1-jani.nikula@intel.com>
 <20240122101428.2683468-2-jani.nikula@intel.com>
 <47hzp5ya6cwdcidq7cwid5ykpkn6wavxtf3ynjf3xgirbgulsc@afsk7pgae3lx>
 <87le8hnu6r.fsf@intel.com>
 <663d25vngq6zcee6vupweq7dohhmftpaggtnfl7752sn6qhdao@ypgsfn62skob>
Date: Tue, 23 Jan 2024 19:13:21 +0200
Message-ID: <87ttn4m0r2.fsf@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 23 Jan 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Mon, Jan 22, 2024 at 07:39:56PM +0200, Jani Nikula wrote:
>>On Mon, 22 Jan 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>> the downside of patch 1 is now that core xe code can include any of the
>>> display/ headers, but only xe_display.h is acceptable to keep the
>>> interface sane.
>>
>>I'd say xe_display.h remains the only interface towards xe core, I don't
>>think this patch changes that, and its location doesn't really give any
>>guarantees. It's been a matter of sticking display/ in the include
>>anyway, and enforcing that is a matter of maintainer vigilance.
>
> I just thought the previous split was slightly better: No code in xe
> should include display/ and should rather use the xe_display.[hc]
> interface.
>
> Now with #include "display/xe_display.h" spread throughout the code,
> this could serve as example for people to start including stuff they
> shouldn't.
>
> I'm not entirely opposed, so if you and others agree, please go ahead.

Well, at the moment you can include *anything* from under display/
*without* the prefix, because it's all in the include path. (Although
that will fail for DRM_XE_DISPLAY=n, but does CI even build that combo
regularly?)

I'm fine with dropping this too. I just think it makes it easier to
check that nothing outside of display/ does any displayish things.

Your call.


BR,
Jani.

>
> Lucas De Mrachi
>
>>
>>> Or are you thinking about changing the interface?
>>
>>I agree the interface should be in one file only, but changing the
>>interface is an orthogonal matter (I have no plans atm).
>>
>>BR,
>>Jani.
>>
>>
>>-- 
>>Jani Nikula, Intel

-- 
Jani Nikula, Intel
