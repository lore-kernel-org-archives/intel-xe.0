Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3EAE77188
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jan 2025 16:33:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 740DD8952F;
	Tue, 14 Jan 2025 16:33:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mulkG8Py";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A78889864
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jan 2025 16:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736872382; x=1768408382;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=gO0kwE17U6fj0A5E2kErT/dbKSX94oX4W3t4k+y44JU=;
 b=mulkG8PyB6IlBtaTbhFDI5lrUulKKgJdYhn2X9bz8ILihRIXFRNGQ66i
 tr2/vpFsKaVX3jN0BqGWadzbi5yTplFGgFGfJDEJ6n5jr6SdGjaMbIe/K
 lpCSXKUwDfy9M14AcBCnQqDTIPmt4jUzodHICL8U7s6GU/pblWRDABECf
 NC7YdMzzaKi3vl4Mrostxr1DWyJSyU/1uE91m6N8Q182f0c2oceGCESUg
 aTUPBPIZRvcg4lLYDn55BR+g+0HLEHStt6r6Xjp+haRG5hw1DIBwoiTkP
 wCWkd0YMGimR9YxdOmrUbMaq9ClFbjLJo4MV9ax4a2ZTrNJG5rvZog6b6 Q==;
X-CSE-ConnectionGUID: mB9md9qgTCy6EJCSL9ycyg==
X-CSE-MsgGUID: ARxb1fx+Q/mxGQsHaNWWxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="48585571"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="48585571"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 08:33:01 -0800
X-CSE-ConnectionGUID: JOKZZQw3TdSS1/DGScTDPw==
X-CSE-MsgGUID: FmOnjT+WQ7qiLHDqtRFq/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; d="scan'208";a="104688747"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.108.161])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 08:33:00 -0800
Date: Tue, 14 Jan 2025 10:32:57 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>, 
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/xe: Always setup GT MMIO adjustment data
Message-ID: <qg2narinajkhbytzi33nr6raxckp7wz3xaau5mbjneamwnu3ah@prwgncepb3ng>
References: <20241114175955.2299-1-michal.wajdeczko@intel.com>
 <20241114175955.2299-2-michal.wajdeczko@intel.com>
 <yzyjk63jmruhujcaqpkx4cd64ymrqvjmikwlltgbf7pmbg6s7o@ycn665ds4ile>
 <3dde1c69-39f7-4ae7-8ecd-31338ce94a80@intel.com>
 <4drzjxtmbgwjiwwuxxu6436parjojvohwhuqcyzktvihvpbomm@m2j64wuicfr3>
 <20241203203716.GL4891@mdroper-desk1.amr.corp.intel.com>
 <f66dgje6rwskimv6zm7tylmjfvbzqbnvlrptaj6rgsqp464uxd@nj2cfcnqkaal>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f66dgje6rwskimv6zm7tylmjfvbzqbnvlrptaj6rgsqp464uxd@nj2cfcnqkaal>
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

On Mon, Dec 09, 2024 at 06:44:36AM -0800, Lucas De Marchi wrote:
>On Tue, Dec 03, 2024 at 12:37:16PM -0800, Matt Roper wrote:
>>On Tue, Nov 19, 2024 at 02:33:28PM -0600, Lucas De Marchi wrote:
>>>On Thu, Nov 14, 2024 at 08:36:46PM +0100, Michal Wajdeczko wrote:
>>>>
>>>>
>>>> On 14.11.2024 20:23, Lucas De Marchi wrote:
>>>> > On Thu, Nov 14, 2024 at 06:59:54PM +0100, Michal Wajdeczko wrote:
>>>> > > While we believed that xe_gt_mmio_init() will be called just once
>>>> > > per GT, this might not be a case due to some tweaks that need to
>>>> > > performed by the VF driver during early probe.  To avoid leaving
>>>> >
>>>> > can you be explicit where this is being set on the VF case?
>>>>
>>>> it will be used in read_gmdid(), see next patch
>>>>
>>>> > Shouldn't VF
>>>> > itself deal with fixing up what it did?
>>>>
>>>> in read_gmdid() we already said
>>>>
>>>> 516      /*
>>>> 517       * Only undo xe_gt.info here, the remaining changes made above
>>>> 518       * will be overwritten as part of the regular initialization.
>>>> 519       */
>>>>
>>>> and it looks that xe_gt_mmio_init() is not overwriting everything as we
>>>> would expect
>>>
>>>We only need to read the gmdid and for that need the mmio struct to be
>>>filled out. We end up needing the gt as a context, but this all looks to
>>>be fixing things that shouldn't have been done.
>>
>>I think the problem is that when you say we "only need to read the
>>gmdid" that isn't a simple register read when running on an SRIOV VF.
>>Rather it's a handshake and query sent to the GuC, which actually
>>involves reading/writing lots of GuC registers to eventually get back
>>that single version number we want.
>
>and IMO all the preparation for handling the SR-IOV special case needs
>to be explicit in the init sequence of the driver rather than poking
>holes like this.
>
>>
>>SRIOV has a lot of chicken-and-egg problems; in this case the problem is
>>that our driver needs to know what IP version it's running on in order
>>to know how to do basic GT initialization.  However at the same time we
>>need to have already done basic GT + GuC initialization in order to even
>>find out the IP version since the VF doesn't have any direct access to
>>the GMD_ID registers.  So we wind up relying on some ugly hacks like
>>this that do a partial/fake initialization of the GT (under the
>>understanding that a lot of other GT functionality like MCR, forcewake,
>>etc. won't get used) to do things "out of order" compared to native
>>execution, and then we come back and fix things up later.
>>
>>I think some of the headaches here are really oversights in the hardware
>>design (e.g., why doesn't the VF BAR expose GMD_ID values somewhere so
>>that we don't have to go through the GuC?).  But I don't have any good
>>ideas for handling things in a cleaner manner, aside from having a
>>completely independent .ko with different code flows to run on VFs,
>>which I don't think anyone really wants.
>
>I don't think we need a different/independent .ko. We only need the init
>sequence to be clearer and do explicit initialization for VF instead of
>hacking "the leaf functions".
>
>Anyway, I'm adding my ack here for this to be applied as is, because
>fixing it means a lot more refactors.
>
>I think the problem from start was "we want to keep the same driver init
>sequence in the VF case", when the HW is not really made to allow the
>same init sequence. So why do we keep insisting in doing that?
>
>
>Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

feel free to use

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

instead of the a-b to merge this.

Lucas De Marchi

>
>Lucas De Marchi
