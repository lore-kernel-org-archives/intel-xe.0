Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3179DC4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 10:02:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E113610E496;
	Wed,  8 Nov 2023 10:02:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTP id 724EF10E496
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 10:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699437746; x=1730973746;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=xy8VHwvmtWAJLHvAypTkiiYFU8EEYIpFQG/gcU7/1hw=;
 b=ZUFcvSHkmmxMuC+sWvvpF01igyV/DCNIau36BGTeif2p1tlNHSYQBhkg
 GGLa63chJxNCS8SPKNrfNLlLXfLf4eg5rnurIRnk9X6cRxd3TI1vthuNM
 rKBUa992Rw1aqY7fZ1WB4hDeHNK52d7XKHWvPeqm7e/cowJLKC0bjFhd8
 GOOIe1KEwV0+eo5jt1NWnUKJXhbUnQdkFTTtHadllJdk3/RtqeT3r+WT5
 PkRPbr1PtorNimAuFihm9tAzfVml41kPzV4UE6A4Xv1eyiRybfSdLRGZv
 yjQTPZyKzUPHBwRsRj+cXY9awuiOO8wBzTNt+TgRXcYRaJfDbOgrSZnQH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="11285487"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="11285487"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 02:02:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="828921245"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="828921245"
Received: from rwyszeck-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.53.217])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 02:02:20 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
In-Reply-To: <j7woryfaopndy26jdcsteie5lsacghy74fvw646rxm7eliaey5@4nlicq3xlzfv>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <202311070416.8nPv4n6G-lkp@intel.com> <87a5rqymy8.fsf@intel.com>
 <j7woryfaopndy26jdcsteie5lsacghy74fvw646rxm7eliaey5@4nlicq3xlzfv>
Date: Wed, 08 Nov 2023 12:02:17 +0200
Message-ID: <87fs1gy34m.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [drm-xe:oak/drm-evictable-lru 2911/3055]
 drivers/gpu/drm/i915/display/intel_display_power.h: linux/mutex.h is
 included more than once.
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
Cc: oe-kbuild-all@lists.linux.dev, kernel test robot <yujie.liu@intel.com>,
 intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 07 Nov 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Tue, Nov 07, 2023 at 10:41:51AM +0200, Jani Nikula wrote:
>>On Tue, 07 Nov 2023, kernel test robot <yujie.liu@intel.com> wrote:
>>> tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git oak/drm-evictable-lru
>>
>>Why do we have this stale branch? I don't think developers should push
>>their branches to xe/kernel.git but their own repos instead.
>
> agreed. I just blocked branch creation in gitlab so we don't have
> those accidents anymore.

I was looking for this yesterday. For future reference, which knob is it
and where in the gitlab UI?

TIA,
Jani.


-- 
Jani Nikula, Intel
