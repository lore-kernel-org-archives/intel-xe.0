Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1539FC282C5
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 12:56:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D54BB10EC9A;
	Fri, 28 Feb 2025 12:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jIngbUPB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 166E210EC9A
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Feb 2025 12:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740747397; x=1772283397;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=TDHNVTNhSPgS5mQri/O2pvx75mWlsb0T+4O/wT+pjUM=;
 b=jIngbUPBtgmn8vnjPgsWYurIBgLOcykir7RF1OCml4pq1bRFQsi2xeYV
 eFi6H5FkB5W6nrno+O1PTz8sUNhn1b6wjEk5Ri10gSb8zb6LRRIWB2zsn
 bDeoScvH9mtSoCxColdvnpEANHAu4o+hBdTKyF2ELCW7y8QDI+Rffy9Pr
 MfcGrfPkxGtlhzB7ZdyL4CIaDapTbt3O/UMt7v6qHF9ymcVIwQYtyULxv
 CwUdfALBxYZc3IJdfXjUZmXNmtcb3sUU2pWHYuqyECW4nnQhRRiTq5pfV
 /74/0ICzgxGsrfJQ9xwJ+XxycFIwO+iBLIJh3BPWxoOh3chPuLY94+l2p g==;
X-CSE-ConnectionGUID: EJfqK4fASSiSBCwRFlxSCw==
X-CSE-MsgGUID: iRfsLHmMTXm5MV8Mc249aQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="29268137"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="29268137"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 04:56:37 -0800
X-CSE-ConnectionGUID: QzIRgdDMSI6kOUBTHIF8Bg==
X-CSE-MsgGUID: HkVAYp+/STW6WxqxuAiW3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="148133477"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.244.73])
 ([10.245.244.73])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 04:56:36 -0800
Message-ID: <2385e181-1f3e-4eb1-b00d-33d09e67603f@intel.com>
Date: Fri, 28 Feb 2025 12:56:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/hmm: Style- and include fixes
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Oak Zeng <oak.zeng@intel.com>, stable@vger.kernel.org
References: <20250228104418.44313-1-thomas.hellstrom@linux.intel.com>
 <20250228104418.44313-2-thomas.hellstrom@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250228104418.44313-2-thomas.hellstrom@linux.intel.com>
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

On 28/02/2025 10:44, Thomas Hellström wrote:
> Add proper #ifndef around the xe_hmm.h header, proper spacing
> and since the documentation mostly follows kerneldoc format,
> make it kerneldoc. Also prepare for upcoming -stable fixes.
> 
> Fixes: 81e058a3e7fd ("drm/xe: Introduce helper to populate userptr")
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: <stable@vger.kernel.org> # v6.10+
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

