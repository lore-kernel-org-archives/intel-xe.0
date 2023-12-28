Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4303C3DA6E
	for <intel-xe@archiver.kernel.org>; Thu, 28 Dec 2023 11:28:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F9F110E004;
	Thu, 28 Dec 2023 11:28:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBF7310E004
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Dec 2023 11:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703762936; x=1735298936;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=NvIUNHEB+c6IiRWWCeeQF0AE41JgjqP4cE5fh3zJcEk=;
 b=T1j+A1GSfBYCbUSj5+B6Pd7GOXgD9oUj1HRoSRDf6LCnMFCU0BgWAvbK
 FJOJHpYwU4vPmDyJK77XTXx4uidTskXDGUFos3yrqXkKXu8EUOrvlA+xB
 973SirlBXBWy14m+J9Yt5Ylf5+aCTzyFxEc8yFKT9qNJhdOE75IDQ+6em
 gDJ6kbe8aeBJ1CR7cAfllDgT6tEf/pucumbwUqThhT8fgkPn66zNI83LE
 jzc6YRNKPcLw/QO8Axa6yM6ABpeR0G5a7SXR0u0UlDPnlwpmzXTzs/o0x
 ORWADrpe0NVvAHcERf3FpWPMU/yBEPXOT7Z8+3bI1AU+OPFPrR+bOZUgb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="3384483"
X-IronPort-AV: E=Sophos;i="6.04,311,1695711600"; 
   d="scan'208";a="3384483"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2023 03:28:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="754716798"
X-IronPort-AV: E=Sophos;i="6.04,311,1695711600"; d="scan'208";a="754716798"
Received: from piotrfor-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.35.87])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2023 03:28:53 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: "Coelho, Luciano" <luciano.coelho@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC] drm/i915/display: add support for DMC wakelocks
In-Reply-To: <d1025642c5e47fcf8338bda82d3d31930877848b.camel@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231228110934.383623-1-luciano.coelho@intel.com>
 <d1025642c5e47fcf8338bda82d3d31930877848b.camel@intel.com>
Date: Thu, 28 Dec 2023 13:28:50 +0200
Message-ID: <877ckyk1l9.fsf@intel.com>
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

On Thu, 28 Dec 2023, "Coelho, Luciano" <luciano.coelho@intel.com> wrote:
> For some strange reason, git-send-email didn't add Uma and Ville in CC,
> even though I specified it in the command line.

Everything worked as expected, but it might seem a bit surprising. ;)

Mailman has a personal setting on whether to filter your address from Cc
in messages sent to the list. I have it disabled, while apparently Uma
and Ville have it enabled. You're probably looking at the copy of the
mail that you received via the mailing list. It only has me in Cc, and
Uma and Ville have been filtered. The copy I received directly has all
three of us in Cc.

This is one of the reasons I Cc all of my patches directly to myself, so
I also have a copy that wasn't modified by mailman.


HTH,
Jani.

-- 
Jani Nikula, Intel
