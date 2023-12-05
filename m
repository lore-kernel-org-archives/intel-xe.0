Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4CAC4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 22:00:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F250410E042;
	Tue,  5 Dec 2023 22:00:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 444D110E042
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 22:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701813643; x=1733349643;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RoduXG1G5IiOQFMojMoFMHFirLGGqgfNAPtAIFYiVhw=;
 b=VeV0AM3Qm6jgcu22sNRwOz2Tnp902hSN7WdGQ/VavM5vrpV9SchA5djn
 SRzZw2CSJ2rSSwnw4T6Gc0l0ZG4MH6P2ZQRirzqFqI74w6pxXaBSE0vRU
 71oH4qI1acYUga/1nqtrWqhie64koQ+YZilFhW0XA42VJRBMIAYwsVSOn
 UtXWFSdgq8iJuE+M1/Q9+/8QW/c4VEWNlOjZofy/Sn1bGS0/GrQuu+Zuq
 Gd0dPmY8/02MPpLP+z3BTOo7Bmxi2NVaWyCFiTMV0mjHaYMoHa6l1UGk/
 CPXXFwtmdKyP7iBcyEXF2RFnBzGNy1nNUl/hmv8tbqC+qFoxAKB/Q7Lwk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="7262585"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="7262585"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 14:00:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="837091093"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="837091093"
Received: from ckochhof-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.33.179])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 14:00:41 -0800
Date: Tue, 5 Dec 2023 23:00:38 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <ZW-dhlb50ByUXSEd@ashyti-mobl2.lan>
References: <20231204053709.30013-1-niranjana.vishwanathapura@intel.com>
 <20231204053709.30013-3-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204053709.30013-3-niranjana.vishwanathapura@intel.com>
Subject: Re: [Intel-xe] [PATCH v3 2/3] drm/xe: Allow userspace to configure
 CCS mode
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Niranjana,

On Sun, Dec 03, 2023 at 09:37:08PM -0800, Niranjana Vishwanathapura wrote:
> Allow user to configure the CCS mode setting through a
> 'ccs_mode' sysfs interface. Also report the current
> CCS mode configuration and number of compute slices
> available through this interface.
> 
> v2: Rebase, make it platform agnostic
> v3: Separte out num_cslices sysfs interface and make
>     xe_gt_ccs_mode_sysfs_init() return void
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Looks good,

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
