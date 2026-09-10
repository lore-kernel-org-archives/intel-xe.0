Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01290C79FB9
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 13:19:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C1010E5E6;
	Thu, 10 Sep 2026 13:19:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ceUUcR1f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E45C610E5E6
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 13:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789046374; x=1820582374;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qOtxpPSw6Np74L4N3ey8NcaiAcJO76HsEcj28emx+4I=;
 b=ceUUcR1f4ME9WuYix+FxRDYDO3O8Nl4AWQOzuNA48ANWJYCE7lyCcB4M
 Sg2DhZXtoguaNasa1qyoF/UtyhsqXRPTaFj5ykSWKnhgv6cjq494FBXiO
 r35+8U0x86HSoxUjysKCYuoVL+i6wU5DQjfotI+WzmzDlYtK7N3yqY8Qt
 zqdmPjT4ObyTiPZ0Sd3zDS4YmNuBfVwKRhMla9/9lyYd66Uqmt6DZjePH
 t2TYsiPnaHwD0dybpk84qYKI2FNE4EiYhC7+oVzZ38+gDOwQTNF5oOtmr
 qPFIaag/3Xa7tezPJlFEvigEEQNz303tPzXOBNrH+meIcQkyGRVdPnJQI A==;
X-CSE-ConnectionGUID: A/0HnGa3ShOQbnjRmTLToA==
X-CSE-MsgGUID: CPgUkTuHTHK/sJc/Ha7JQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="92009376"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="92009376"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 06:19:33 -0700
X-CSE-ConnectionGUID: lSi+uOXlQBmvop/lcYBxJg==
X-CSE-MsgGUID: iZ23cC30SCuvEHrjQOc6AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="9244"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 06:19:30 -0700
Date: Thu, 10 Sep 2026 15:19:28 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, michal.wajdeczko@intel.com,
 himal.prasad.ghimiray@intel.com, arvind.yadav@intel.com,
 syed.abdul.muqthyar.ahmed@intel.com, nitin.r.gote@intel.com
Subject: Re: [PATCH v3 02/12] drm/xe/cper: Retrieve the error counter record
 for CPER reporting
Message-ID: <aqKuYHXqkwClMekH@black.igk.intel.com>
References: <20260906172604.2215987-14-badal.nilawar@intel.com>
 <20260906172604.2215987-16-badal.nilawar@intel.com>
 <ap_gdX1GeLLatl2H@black.igk.intel.com>
 <aqD4syBajVA2sZPy@black.igk.intel.com>
 <5214c20f-ab36-4a8e-899e-351bca1d4026@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5214c20f-ab36-4a8e-899e-351bca1d4026@intel.com>
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

On Thu, Sep 10, 2026 at 06:29:03PM +0530, Nilawar, Badal wrote:
> On 09-09-2026 11:42, Raag Jadav wrote:
> > On Tue, Sep 08, 2026 at 12:16:27PM +0200, Raag Jadav wrote:
> > > On Sun, Sep 06, 2026 at 10:56:07PM +0530, Badal Nilawar wrote:
> > > > Retrieve error counter record required to build a CPER record when
> > > > one not provided by the caller.
> > > > 
> > > > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> > > > ---
> > > >   drivers/gpu/drm/xe/xe_cper.c |  15 ++++++
> > > >   drivers/gpu/drm/xe/xe_ras.c  | 100 ++++++++++++++++++++++-------------
> > > >   drivers/gpu/drm/xe/xe_ras.h  |   3 ++
> > > >   3 files changed, 80 insertions(+), 38 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> > > > index e8017e3ee3a0..f04a91223a43 100644
> > > > --- a/drivers/gpu/drm/xe/xe_cper.c
> > > > +++ b/drivers/gpu/drm/xe/xe_cper.c
> > > > @@ -9,6 +9,8 @@
> > > >   #include "xe_cper.h"
> > > >   #include "xe_device.h"
> > > > +#include "xe_printk.h"
> > > > +#include "xe_ras.h"
> > > >   #include "xe_ras_types.h"
> > > >   /**
> > > > @@ -26,6 +28,8 @@ void xe_emit_hardware_error_cper(struct pci_dev *pdev, int cper_sev, enum xe_sig
> > > >   				 struct xe_ras_get_counter_response *response)
> > > >   {
> > > >   	struct xe_device *xe = pdev_to_xe_device(pdev);
> > > > +	struct xe_ras_get_counter_response local_resp = {};
> > > > +	struct xe_ras_get_counter_response *counter_response = response;
> > > >   	if (!xe)
> > > >   		return;
> > > > @@ -33,5 +37,16 @@ void xe_emit_hardware_error_cper(struct pci_dev *pdev, int cper_sev, enum xe_sig
> > > >   	if ((int)sigid >= INTEL_SIGID_GPU_XE_HARDWARE_START)
> > > >   		return;
> > > > +	if (!counter || !xe_ras_counter_is_valid(xe, counter))
> > > Why? Should we even be at this point without a valid counter?
> > ras_counter_is_valid() is already part of get_counter() and !counter
> > should be covered by IS_ERR_OR_NULL() in patch 1, which makes the entire
> > condition redundant.
> 
> get_counter is only validating ras response not caller provided counter.
> 
> Check is needed for data[] payload from xe_log.

In which case the caller is abusing xe_log and is expected to receive a
get_counter() failure, so let's not hide bugs.

Raag
