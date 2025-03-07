Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23352C282DE
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 14:57:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E070F10E2B4;
	Fri,  7 Mar 2025 14:57:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xh1H6T7G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 287B410E2B4
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 14:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741359448; x=1772895448;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=rDu9Zp1wPU2arpk81geF+Lf+r/yq3MuOeRWdibNPyBI=;
 b=Xh1H6T7GuuC66NhaGnvaH+Fh3xGPdaZSET/G+ZXK92wet0hv1ASZHrqo
 dr0+aslKPUu+Xx8Um5xaCuT2TlsholyMT+zf+oNq/fbH4bD45RiEtNwu6
 zde349RughzlWdI2mTYVycWVJdWIbas6B5QrOC1OWpSRFeU8op8V7JQNU
 POVpn735hasYPf3MIJGfyr/m1ds+N1Ff3nPjydAeqevMOUQJwUZSQILNT
 v6B95+5+eIeONivbX5Cv3xfKhBrj1SNFO22ZNIhbZVso12W/GQ2XpgxoO
 tgX/c+dGELB7ONq//wAAvKBYUtnaCL4JK+QC7CyefcNhSmPZlMM1bjWTL w==;
X-CSE-ConnectionGUID: xykgFbSkSpWiQHfYcvAhNw==
X-CSE-MsgGUID: lZPD66XbRCel+PZmmG8mjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="46063529"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="46063529"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 06:57:27 -0800
X-CSE-ConnectionGUID: JezxXxFAT3mHgyR1QqCQkw==
X-CSE-MsgGUID: 8H4Zp7d7TLSX1ThUTibP8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="119511022"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.246.214])
 ([10.245.246.214])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 06:57:26 -0800
Message-ID: <34c2677bbb16a9863b5209a73d9d34daab13dc45.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe/userptr: Fix an incorrect assert
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Date: Fri, 07 Mar 2025 15:57:23 +0100
In-Reply-To: <e9513f16-1470-437f-8472-b73859ff88f2@intel.com>
References: <20250307100109.21397-1-thomas.hellstrom@linux.intel.com>
 <e9513f16-1470-437f-8472-b73859ff88f2@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
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

On Fri, 2025-03-07 at 13:19 +0000, Matthew Auld wrote:
> On 07/03/2025 10:01, Thomas Hellstr=C3=B6m wrote:
> > The assert incorrectly checks the total length processed which
> > can in fact be greater than the number of pages. Fix.
> >=20
> > Fixes: 0a98219bcc96 ("drm/xe/hmm: Don't dereference struct page
> > pointers without notifier lock")
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>=20

Thanks for reviewing, Matt.
/Thomas

