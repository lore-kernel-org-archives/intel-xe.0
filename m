Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFD41076377
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 06:34:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDA9510EC35;
	Wed,  1 Apr 2026 06:34:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R6RQOd2M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5DFD10EC35
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Apr 2026 06:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775025251; x=1806561251;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=O17kQ1T5/I2LQTLg96LjbIy/m6dilolVjDmHK9sGVVc=;
 b=R6RQOd2M1pvIj1PRVEr6Jz+Sd6aviYFTs+EjYZjJu9K8cfHZhT3wmh2T
 nn2w16Ej+L0kJdRYXx/R/iBwBkHTvHhxApA/uT1FVL91PVJDCVy8V3k0I
 P0Lo5rQTN99UqE6AsnAECh7Vx81Wo8SeF9VyB5jvoxUbdZt/pxy8+OzYe
 4/BXxiRk9mnXgc4jzgShcsnafXF6iUj7sgEN63sbbDJrkmA/Ie2krvN71
 Di1TNcREoOqwv1Pvm2pPwj59FpGBN8mg+guEA62y+FVYFO8eoxeucqd7Q
 LICBsHtZROVK/kErZ/Vnr4qBLlzBzv2dPs2guLLXQCfSXlywHWeRHWKTq Q==;
X-CSE-ConnectionGUID: mjpsYeiYQqKuyHq0kAFsyw==
X-CSE-MsgGUID: yCsZnTcfTs+uJGkOwyXK3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75939004"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="75939004"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 23:34:11 -0700
X-CSE-ConnectionGUID: X6plXsBPTsiv32Asd69S/g==
X-CSE-MsgGUID: Rl3Y2hzyQziGOyeIFsfjUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="221732805"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 23:34:08 -0700
Date: Wed, 1 Apr 2026 08:34:05 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com
Subject: Re: [PATCH v2 08/11] drm/xe/xe_ras: Add support for Uncorrectable
 Core-Compute errors
Message-ID: <acy8XXWwxbpLrFsL@black.igk.intel.com>
References: <20260302102155.4074630-13-riana.tauro@intel.com>
 <20260302102155.4074630-21-riana.tauro@intel.com>
 <aahjUV9VPkT11a85@black.igk.intel.com>
 <cbdfde54-2625-4c9b-bd48-2c1c0b63cb24@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cbdfde54-2625-4c9b-bd48-2c1c0b63cb24@intel.com>
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

On Tue, Mar 31, 2026 at 09:54:32PM +0530, Tauro, Riana wrote:
> On 3/4/2026 10:22 PM, Raag Jadav wrote:
> > On Mon, Mar 02, 2026 at 03:52:03PM +0530, Riana Tauro wrote:
> > > Uncorrectable Core-Compute errors are classified into Global and Local
> > > errors.

...

> > > +	} while (response.additional_errors);
> > I know we're not NASA but I'd try to have some timeout instead of blindly
> > trusting the hardware.
> 
> additional_errors is a indication. So will be 0/1.
> Timeout is already present in sysctrl_send_command. So unnecessary here
> again.
> 
> Also before every sysctrl command we are setting response to 0.

If the firmware returns the same values repeatedly, we'll be stuck here
indefinitely. I know it's extreme corner case and probably a firmware
bug, but that's not an excuse for the driver to not handle it.

I've handled it[1] as flooding, not ideal but convenient for now.

[1] https://lore.kernel.org/intel-xe/20260331102346.1034100-3-raag.jadav@intel.com/

Raag
