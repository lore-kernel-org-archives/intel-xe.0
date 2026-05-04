Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DA1FF885A
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 16:22:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15FE10E0D2;
	Mon,  4 May 2026 16:22:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JZDwnIe4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7750C10E0D2
 for <intel-xe@lists.freedesktop.org>; Mon,  4 May 2026 16:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777911775; x=1809447775;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2cDXQqzHxHU0IFnIlZC8f+eJFnNpsxcxfOcspSNzkm4=;
 b=JZDwnIe4lqoqxxSeQxPnZu4hRMLTsKPwRGpAGjag8z/cGsH+tXe2pc6P
 Ec2WcjUKmQvIGsNR30YDx3toNUZww6qouHpJ10lNdvKIuSaRcydbP0EUT
 OwH9DFh2G9V9ucA230YIlqdviIOgMXdWqxPELupIV3ugtpUeHXtmIUkfT
 dkv3KLNQCKvNUm7WcAz7aquRQObf5+pJ8aUu9iwXlbuOlKqrAdwbZ584t
 j720id2cSI7qlmmpTeetYp2qXYs5TwEkb512GMbYNEGcGA+5kA0pijLrc
 ATzr/BTQQ5Rrqrg0JZJfknmMlxo3h5BmTl4A+UYmF9Ugv7DeLN1koNGHR A==;
X-CSE-ConnectionGUID: EDMPU9aTTs+sECUfkzNGvQ==
X-CSE-MsgGUID: QhxQAA78SrK6SwqP6dYscg==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78672507"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="78672507"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 09:22:54 -0700
X-CSE-ConnectionGUID: kViqDSYQTi2BexU6tyfSeg==
X-CSE-MsgGUID: iq6JTo3oTuqUsTxI9Rt6zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="235430070"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 09:22:50 -0700
Date: Mon, 4 May 2026 18:22:48 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, michal.wajdeczko@intel.com
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Anoop Vijay <anoop.c.vijay@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH v5 5/6] drm/xe/xe_ras: Move xe drm_ras registration
Message-ID: <afjH2EZD9-kIH2Va@black.igk.intel.com>
References: <20260504065614.3832331-8-riana.tauro@intel.com>
 <20260504065614.3832331-13-riana.tauro@intel.com>
 <691a88c5-49eb-4b9c-96c7-8054b3224632@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <691a88c5-49eb-4b9c-96c7-8054b3224632@intel.com>
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

+ Michal

On Mon, May 04, 2026 at 04:23:14PM +0530, Tauro, Riana wrote:
> On 5/4/2026 12:26 PM, Riana Tauro wrote:
> > Move xe drm_ras registration to RAS initialization flow and keep
> > hardware error initialization for processing errors reported
> > via irq.

...

> > +void xe_ras_init(struct xe_device *xe)
> > +{
> > +	int ret;
> > +
> 
> Needs an SRIOV_VF check here. Will add it in next rev

Rather, reuse vf_update_device_info() (which I think also should've been
done for other sysctrl flags).

Raag

> > +	if (xe->info.platform != XE_PVC)
> > +		return;
> > +
> > +	ret = xe_drm_ras_init(xe);
> > +	if (ret)
> > +		drm_err(&xe->drm, "Failed to initialize xe_drm_ras %d\n", ret);
> > +}
