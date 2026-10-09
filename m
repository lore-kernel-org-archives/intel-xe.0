Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422E7CA6012
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 08:38:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D935110FFA9;
	Fri,  9 Oct 2026 08:38:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oHxHzn94";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8BCD10FFA9
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 08:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791535104; x=1823071104;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=RgfmfUsh/qbFRrW/VWnHmvrkAUepoWwPIzLEVpWCgVw=;
 b=oHxHzn94S7lKuVOHrMyKs8i+H7JoHEXaSdhbpSZMtCABlYN+753Tgb9G
 W0V5kx0TVtW2ZMIhm4DKjgk5ZPhmTYHiuSas5wjMN/sWamyENoubR1yBN
 PrjliYzu5NbgHyRNYbyyL6aV62YS7TTdqxA9sJ2sNRCi8GMBRu6wKAizv
 fZHiPopCFXmMq2SZEcM7L0pruXegWEtA/Jaos3Cv/rQaeXZW3uIUTcK9S
 gNVeiNJYym8YSeW+413XRFUbdGDMg3nh8OKLmWq7SH5suK5d0NlaCa+VX
 b+JI81PGCWwH5Za0lJ7fGrCLeksUyc28xftBxAxULa3gCKTezJ6x3k7LM g==;
X-CSE-ConnectionGUID: foBY5JzdTL67y3T3NeTrzQ==
X-CSE-MsgGUID: 7V308NlqQ8qYzFJ9CvW01g==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="218744"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="218744"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 01:38:21 -0700
X-CSE-ConnectionGUID: ZdMWIKC+Th2CTB3Xp997ww==
X-CSE-MsgGUID: HlVBXEw0TAuQRDrPRYhKiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="601383"
Received: from slindbla-desk.ger.corp.intel.com (HELO [10.245.244.25])
 ([10.245.244.25])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 01:38:20 -0700
Message-ID: <c7c817ce-338c-4640-93d6-ad5d6ec6c444@intel.com>
Date: Fri, 9 Oct 2026 09:38:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Don't transfer shrinker pages for pinned bos on
 purgeable state change
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Arvind Yadav <arvind.yadav@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, stable@vger.kernel.org
References: <20261009070053.7790-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20261009070053.7790-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 09/10/2026 08:00, Thomas Hellström wrote:
> Pinned bos have their pages removed from the shrinker's shrinkable /
> purgeable counts on pin, and added back on unpin according to the
> bo's purgeable state at that time.
> 
> However, xe_bo_set_purgeable_shrinker() unconditionally transfers
> pages between the shrinkable and purgeable counts. If the purgeable
> state of a pinned bo changes, for example by userspace madvising
> DONTNEED on a VMA of a bo that is also pinned as a scanout buffer,
> this underflows one count and, after unpin, leaves the other one
> permanently inflated.
> 
> Only update the purgeable flag for pinned bos, and leave the page
> accounting to unpin.
> 
> Fixes: 536a2ead3a8f ("drm/xe/bo: Add purgeable shrinker state helpers")
> Cc: Arvind Yadav <arvind.yadav@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v7.1+
> Assisted-by: LLM
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
