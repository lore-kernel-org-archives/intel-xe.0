Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8B8D62073
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 17:08:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD85210E2CB;
	Tue, 19 Nov 2024 17:08:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QVC1XRSb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4769410E2CB
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Nov 2024 17:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732036130; x=1763572130;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tpWSPW5lx6VK9lzUMBLSPJiD7jx4W6jDQ9u9Jc++ab0=;
 b=QVC1XRSb2AUiW1bARZuWWRP7WpQAqZrS0wEsZ5WUAayuffhHkiD2Nkah
 xcvqb/c/cxtqs78rP3++a+Cx20ZjLTVYwHq3y9SltjR0fk82ch8DSHpmz
 u8LvpGTiK1I6y8JxBs0TZkrSBGzhlylqYCCzDicMxVUoSgGM3jHQXHzsU
 hcSYtYRJ+dBjIGzI4jqSdliChKS58dfhAg3CJPUfOstTaGOfZu32TdOU7
 vluETdGQUyb03mxjBLnCQAbqjU15WvWSD1mcBTIpQIxc01qegdGBDuuft
 Hirs+nK0R1Yyy3+vL36x6H0kQCVBQk64NbsBhyV0bnk1CkS+mBj3QB5Uo A==;
X-CSE-ConnectionGUID: Q8gdIMCATqORrj/+ucQYOw==
X-CSE-MsgGUID: xgjOgyAuQvuLCDEzDNR4bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="43456235"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="43456235"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 09:08:49 -0800
X-CSE-ConnectionGUID: f1sIkpoxRWSes8+4nPofAA==
X-CSE-MsgGUID: aTwnIFJuTtuS3K/s+OdKZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="94077448"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.109.70])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 09:08:49 -0800
Date: Tue, 19 Nov 2024 11:08:42 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 ryszard.knop@intel.com, Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Sort again the info flags
Message-ID: <pma4bikew4wnxhs2nczdzbbpz2yt77pvoy5xdxq23sg5cw4e3n@aypm5hztxb2v>
References: <20241118223314.1969166-1-lucas.demarchi@intel.com>
 <7f8fccfd-cb92-47bd-b6d3-bbed2a11094e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <7f8fccfd-cb92-47bd-b6d3-bbed2a11094e@intel.com>
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

On Tue, Nov 19, 2024 at 10:51:58AM +0000, Matthew Auld wrote:
>On 18/11/2024 22:33, Lucas De Marchi wrote:
>>Those flags are supposed to be kept sorted alphabetically. Unfortunately
>>it's a constant battle as new flags are added to the end or at random
>>places. Sort it again.
>>
>>v2: Include the other non-has_* 1-bit flags in the sort
>>
>>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> # v1
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>  drivers/gpu/drm/xe/xe_device_types.h | 32 ++++++++++++++++------------
>>  1 file changed, 18 insertions(+), 14 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>index 8592f1b02db11..8b2b12daa49dd 100644
>>--- a/drivers/gpu/drm/xe/xe_device_types.h
>>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>>@@ -294,14 +294,21 @@ struct xe_device {
>>  		/** @info.va_bits: Maximum bits of a virtual address */
>>  		u8 va_bits;
>
>Should we not document somewhere here that the below should be kept sorted?

yes, probably. Also... we have the CI Hooks we should make better use of
too. First check if the patch series changed drivers/gpu/drm/xe/xe_device_types.h
at all and if it did, check that these flags are sorted. We should be
able to add some quick and dirty checks so we don't have to keep
changing it. Just need to make sure the output on what was
the error is helpful, otherwise people will just ignore it.

Ryszard / Jani  any thought on that idea?

Lucas De Marchi
