Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CA3CD5BD5
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 09:29:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B4D10EEDE;
	Thu, 28 May 2026 09:29:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AJYO3Zvs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B12AC10EEDE
 for <intel-xe@lists.freedesktop.org>; Thu, 28 May 2026 09:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779960551; x=1811496551;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SpgDoqr6+f/syj5i/JhDyQArFaEbzRQmM5RfNSUUD3c=;
 b=AJYO3ZvszTy7fldIg+rZT42YgjZA+qpq5voPUTvXpD54M75nGVAbtRDp
 XhuCJXBr1ReAM5BOE5A2zAJi5nm1ApnqOsD3JhIjMZN/oGOMUSZtrmvn0
 6gN7vPk+im8WrHv72NuAsuyCQE2NsXHUXsv8LujXfSpp9n873S/7oOcMf
 9meG7Wg6L8ZbnXQBTYgJGfuwnDMApHgAvEjR2QGU0By7eCNmjrVJ4aQTV
 xCS9bgA8ymx75racfXOJMXmK6Wz7yMOUvtFwyw/jqcc6L/uJXo8KHGJo4
 XCGOjbDjR11c2lU94wd9SlFp3q+gx1U2T3DGj4olbApBYvl2WK182ji+e Q==;
X-CSE-ConnectionGUID: 9Gquu186RkOhJudOcWPNWQ==
X-CSE-MsgGUID: lrMfVNfqTc+6y5Cdy56s3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="91909450"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="91909450"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 02:29:10 -0700
X-CSE-ConnectionGUID: gR6LwYDKQ66XT++WI8xRfQ==
X-CSE-MsgGUID: uDyhmMHuSbC7TtPfOKA75Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="244329656"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 02:29:08 -0700
Date: Thu, 28 May 2026 11:29:05 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: Re: [PATCH v7 3/6] drm/xe/xe_ras: Add support to clear error counter
Message-ID: <ahgK4dvEKdSWnN7e@black.igk.intel.com>
References: <20260527060241.3351323-8-riana.tauro@intel.com>
 <20260527060241.3351323-11-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527060241.3351323-11-riana.tauro@intel.com>
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

On Wed, May 27, 2026 at 11:32:45AM +0530, Riana Tauro wrote:
> Add structures and helper function to clear error counter value.

...

> +	ret = ras_status_to_errno(response.status);
> +	if (ret) {
> +		xe_err(xe, "sysctrl: clear counter command failed with status %u, err %d\n",

'%#x' specifier for status, it comes from the hardware. Also, I think
err is redundant here since it's just our interpretation of status (which
is already present) and it doesn't really help debug anything.

> +		       response.status, ret);
> +		return ret;
> +	}

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
