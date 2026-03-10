Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1AD9EB106D
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 15:11:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F9F810E160;
	Tue, 10 Mar 2026 15:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kv4Uys/u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A8610E160;
 Tue, 10 Mar 2026 15:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773155485; x=1804691485;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=e6aVBPS2KGqVQ59kUtR2nms8IM9kY6ZOVdDdA9SK7kQ=;
 b=kv4Uys/ucbvrY0na77MKh6acrVDXJtC3d3L9g9StG0PUJuWcbFvF//gg
 p/ByD8h9+SgMopfZulZiN1ygKfc0yz5b1jjvvj+EFcUnhAKyxFhxx1CuM
 BHwAAUDXGuJBWd16T3JH5ofLemYw1oFN+tPLpq5gMjdIqTvKPs9L+lwV1
 AASn78xpFR5ByAe5PtD7EL+II7M1PG+DRKRJYfHDe/WNFxFRmQJgwVsai
 I1XhKVkkGtF8nN4HHDeCTq4C44MvyrHfzSfh8qgz437H4BIsjTfMhhl15
 ZlIhyc36rkYw3Dl2Z8OQC5zMGUKFX9JSyZ1mtceNJJDMYQIIrekxeeNnq w==;
X-CSE-ConnectionGUID: fAqct5sHRWq7OS27mPTNsA==
X-CSE-MsgGUID: ch6fuUjyRWa0bgwm7UKfag==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="78058257"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="78058257"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 08:11:25 -0700
X-CSE-ConnectionGUID: u+KTVKS1Sq2OE9alUQnQCQ==
X-CSE-MsgGUID: twd0Pw17T4uPFy6Nc5gh1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="215505741"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.244.33])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 08:11:23 -0700
Date: Tue, 10 Mar 2026 17:11:20 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Richter <Simon.Richter@hogyros.de>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 1/1] drm/i915: handle failure from
 vga_get_uninterruptible()
Message-ID: <abA0mA9HTWh3YdxN@intel.com>
References: <20260218131131.460105-1-Simon.Richter@hogyros.de>
 <20260306151347.758836-1-Simon.Richter@hogyros.de>
 <aa_8GhVURTdKWRVl@intel.com>
 <45f30d71-2afc-40fb-ba5d-ffd0bb7e7ee0@hogyros.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45f30d71-2afc-40fb-ba5d-ffd0bb7e7ee0@hogyros.de>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Tue, Mar 10, 2026 at 11:45:53PM +0900, Simon Richter wrote:
> Hi,
> 
> On 3/10/26 8:10 PM, Ville Syrjälä wrote:
> 
> > Do you need to take this in via some other tree, or should I just push
> > it to drm-intel-next?
> 
> This is independent from the PCI changes (and I didn't Cc linux-pci on 
> this one), so via drm-intel-next would be best, thanks!

Pushed. Thanks.

> 
> I've also prepared a backported version for 5.3 to 6.19 kernels[1].
> 
>     Simon
> 
> [1] https://patchwork.freedesktop.org/patch/709684/?series=161721&rev=4

-- 
Ville Syrjälä
Intel
