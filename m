Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D30CCD1BB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 17:01:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE81410E178;
	Wed, 22 Oct 2025 17:01:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PxNn7YBq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4039810E178
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 17:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761152496; x=1792688496;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8hz4kKiSwMop4sVVcOfi8ivsCvkTYS/TC6jOpeOB8iQ=;
 b=PxNn7YBqSZHf7o9hk1ERbmy2ZGayS2ZJsEnKia5Ch+AdE/EOT/ZOcv7j
 hnqBL/sm5/Eon1hh+VF4sO/2HOtX0e+zL/N+ncFNfvZ3ktUPnlXmKHQAO
 7auueTAVMvto1XHvBmqzSDIFb/adgtuHuFbc44mdYxGcl6jE4qHiTYjVN
 0T+shsjWEVSKnSQFAxZ6x3j5AjEjPmI9e0S+ZzpTTTRNzPA6+Ftu8V18G
 uNC4kF3jaIkhZcYhNQ43ygbMALj6dgGmDbnIsyXkQntsYBFU+5NTSnkMP
 wEMyGBXEbYB9YEiEl0jRrAB/sVtq1Q6C5n/EZS1MfiGZBMEbiaXbL3BGx g==;
X-CSE-ConnectionGUID: d9+FzpU/RI6lsrEDGJvM4A==
X-CSE-MsgGUID: /qxiFd89ScSKHbIydBNR3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73978654"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="73978654"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 10:01:36 -0700
X-CSE-ConnectionGUID: mjjsX/hGTkGRzfIMjn94Qw==
X-CSE-MsgGUID: 1I5C8nykQvSx8NzPdZg+Yw==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 10:01:34 -0700
Date: Wed, 22 Oct 2025 19:01:31 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 daniele.ceraolospurio@intel.com, michal.wajdeczko@intel.com,
 badal.nilawar@intel.com
Subject: Re: [PATCH v6 1/4] drm/xe/vf: Update pause/unpause() helpers with VF
 naming
Message-ID: <aPkN69Ulm-b5UJNa@black.igk.intel.com>
References: <20251022094246.3584785-1-raag.jadav@intel.com>
 <20251022094246.3584785-2-raag.jadav@intel.com>
 <aPj3AgztiXKC+iRY@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPj3AgztiXKC+iRY@lstrano-desk.jf.intel.com>
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

On Wed, Oct 22, 2025 at 08:23:46AM -0700, Matthew Brost wrote:
> On Wed, Oct 22, 2025 at 03:12:43PM +0530, Raag Jadav wrote:
> > Now that pause/unpause() helpers have been updated for VF migration
> > usecase, update their naming to match the functionality.

...

> >  /**
> > - * xe_guc_submit_pause - Stop further runs of submission tasks on given GuC.
> > + * xe_guc_submit_vf_pause - Stop further runs of submission tasks for VF.
> >   * @guc: the &xe_guc struct instance whose scheduler is to be disabled
> >   */
> > -void xe_guc_submit_pause(struct xe_guc *guc)
> > +void xe_guc_submit_vf_pause(struct xe_guc *guc)
> >  {
> >  	struct xe_exec_queue *q;
> >  	unsigned long index;
> 
> Can we now have xe_gt_assert in the renamed functions that IS_SRIOV_VF
> is true?

I thought vf_recovery() already does it for us?

> Feel free add those in next rev and retain:
> 
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Thank you.

Raag
