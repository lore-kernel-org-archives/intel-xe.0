Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010C3C02198
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 16:15:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CDCC10E5A6;
	Mon, 10 Feb 2025 16:15:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ENt0TbWP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92BF810E5A6
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 16:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739204113; x=1770740113;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=94hlI+YM/7fcdpnkMu9SKB95nOoeWXMCEZ46y8Nj4PU=;
 b=ENt0TbWPdwwTdhJokWjpUy5wABOBOZET4u/shHHjR3rjoaNjbV9fX/6l
 9CRWdpiIca7P2f9aB5yLKarKlTN5acHDgzFPR1RV0cAvDphEsfQ4xjVpn
 i/HWeRIGkfpP06ywvfmciMLY3bXfEuRpe6y+c1VLVojeCPxn1tsvtOUst
 MBwHDprXZiBU4l8OzFFoycJgx1Rzwy0TAJT6HvVG1BvnKzUjq90mH0su7
 adbvq2f1YJoTXc1XJ9N7A1Vbs+Wd3arYTsxAZOVGKS2V6ns5N5XIbrAhH
 4Fuui8juJ0DODxPxsGYu9XAeElTpDRV7OcmxbO/2FL7xX3u1JQ14ORUEf Q==;
X-CSE-ConnectionGUID: f3PpXQeJQ+GnFRn35nf6GQ==
X-CSE-MsgGUID: 3KiuWrkrRHWvcSuNxglAww==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="50778534"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="50778534"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 08:15:12 -0800
X-CSE-ConnectionGUID: v0jqNzYGQKOcdgYrtMQ74A==
X-CSE-MsgGUID: dg8j7VR8RB+YhZHcYZToOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="112186155"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.18])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 08:15:08 -0800
Date: Mon, 10 Feb 2025 17:15:04 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 matthew.d.roper@intel.com, andi.shyti@linux.intel.com,
 intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 riana.tauro@intel.com, badal.nilawar@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v1] drm/xe/hwmon: expose fan speed
Message-ID: <Z6omCGczu0vjQtpc@ashyti-mobl2.lan>
References: <20250210100515.2205584-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210100515.2205584-1-raag.jadav@intel.com>
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

Hi Raag,

On Mon, Feb 10, 2025 at 03:35:15PM +0530, Raag Jadav wrote:
> Add hwmon support for fan1_input, fan2_input and fan3_input attributes,
> which will expose fan speed of respective channels in RPM when supported
> by hardware. With this in place we can monitor fan speed using lm-sensors
> tool.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

I think you've got the hang of it by now :-)

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

> +#define   FAN_SPEED_CONTROL			0x7D
> +#define     FSC_READ_NUM_FANS			0x4
> +

I don't really like the alignment here, I'd have preferred:

	...	0x7D
	...	0x04

with the '0'. But you are being consistent with the header's
style, so it's OK.

Thanks,
Andi
