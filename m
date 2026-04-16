Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50626F8A163
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 11:39:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0F710E88E;
	Thu, 16 Apr 2026 11:39:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XtzRsoTB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3614F10E88E
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Apr 2026 11:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776339564; x=1807875564;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sTfptXURZUHvwRfkYxZuBzuBEgG5sjvpD7kVVA6reQY=;
 b=XtzRsoTBN34BYrWBNyRDLpHd53I+hfih/FR3WVSyKzHo+muUM998h+Ib
 QV707uPtfSXvhz/Z0emW1t8Rq2X0mPJvhrorLsyl6cwXlfQJORzUwCgIO
 4KuE1FGQ8+33MYlfQgzXns26Mxs8WyqYYaQXA3aNwsXF4yeTi8PO8BCmr
 1x4wS27WQykxC9DHCGXDFPz7mA5xqEtUeEyXylelK5EfoOSYGrtsRFt/t
 V1qMqnHRnIB4c4UEFyIAa0397OJGCdGtiQLW4mdxgswvvmlwjJIJz7rb4
 dR1YOlx6TBDrSfp8u0xsqXO4ix65VYWU3noYXXpFYN7J82jnBYZ7p1UrL A==;
X-CSE-ConnectionGUID: Dn48X1jAR5aYn/4FJ/zt1A==
X-CSE-MsgGUID: A/BAiNebT32l+KOX06ox3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77450533"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="77450533"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 04:39:24 -0700
X-CSE-ConnectionGUID: J4lk6h5jSFWfXdPqhpvBcQ==
X-CSE-MsgGUID: wv3BIc1oR9yMRRzlfDkGzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="230637674"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.251])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 04:39:19 -0700
Date: Thu, 16 Apr 2026 13:39:16 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Soham Purkait <soham.purkait@intel.com>
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 anshuman.gupta@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, raag.jadav@intel.com,
 ravi.kishore.koppuravuri@intel.com, mallesh.koujalagi@intel.com,
 anoop.c.vijay@intel.com
Subject: Re: [PATCH v1 1/2] drm/xe/xe_ras: Add structures and commands for
 RAS GPU health indicator
Message-ID: <aeDKZGVmVextYczY@ashyti-mobl2.lan>
References: <20260416093610.4085667-1-soham.purkait@intel.com>
 <20260416093610.4085667-2-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416093610.4085667-2-soham.purkait@intel.com>
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

Hi Soham,

On Thu, Apr 16, 2026 at 03:06:09PM +0530, Soham Purkait wrote:
> Add the sysctrl commands and response structures for GPU health
> indicator supported by RAS.

Can you please describe better the structures you are adding?

> Signed-off-by: Soham Purkait <soham.purkait@intel.com>

...

> +/**
> + * typedef xe_ras_health_status_t - Device health status values (8-bit)
> + *
> + * Three-state health indicator value reported by system controller commands.
> + *
> + * The expected values are:
> + * - 0: ok  - The device is healthy and operating within normal parameters.
> + * - 1: warning  - The device is experiencing minor issues but is still operational.
> + * - 2: critical  - The device is in a critical state and may not be operational.
> + */
> +typedef u8 xe_ras_health_status_t;

Please, don't add another definition of u8. Keep it u8. If you
expect only those three values (or at least a limited number of
values), you can define an enum.

Andi
