Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD34CD98F0
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 11:56:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E83710E9CE;
	Wed, 17 Jun 2026 11:56:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QxENDEmF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FED610E9CE
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jun 2026 11:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781697401; x=1813233401;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WTA8AjLV+h8ltCAoEY9jG1UGssmrVwDBGIGFRFg2u20=;
 b=QxENDEmF6M07xbK4suDM2HHHdZFKNXCbHvZYh3zrCEVlSQ8oE33vUdF/
 w3gMxdLa3eIU8z+hr5C8RDEF2PiGXRkPdLVHiL80Khq4J1gcsfRd6WS+v
 BL29vfenySv5jSHO/SSHBh9mQxopjBNvZjaq2UURekPRSLmFyLIuMx/2D
 1aO6+laLYZ2RxVNp2/nkQPnHpuDFyghEz2VMkf6fOXtwlwSZUpHmn9GxL
 cduEHGLU2MqbqVr3PgKg6QHpubQfcffpSHpaxWZxcWsPyCKHrDPNLRlQc
 Y6HAv8YkgJncTdIVF6oAa+8FSphuyV5QIfbQhGUwsuOXco9ub5Zr3G1pQ Q==;
X-CSE-ConnectionGUID: WDbu3EEuS8aEKVdXizz6hQ==
X-CSE-MsgGUID: 5lzfRwsUQ/GTk8mSksBsqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="93973982"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="93973982"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 04:56:41 -0700
X-CSE-ConnectionGUID: zkjCBRR+TSqT2mgHhHrbCw==
X-CSE-MsgGUID: MshCcUxUTkq58v3Yag4lZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="251951031"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 04:56:39 -0700
Date: Wed, 17 Jun 2026 13:56:36 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [PATCH] drm/xe: Move drm_client_dev_suspend/resume outside pm
 block signalling
Message-ID: <ajKLdJIoHYBCIMiz@black.igk.intel.com>
References: <20260617082104.610620-2-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617082104.610620-2-tejas.upadhyay@intel.com>
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

On Wed, Jun 17, 2026 at 01:51:05PM +0530, Tejas Upadhyay wrote:
> A circular locking dependency is reported between xe_pm_block_map and
> dev->clientlist_mutex:
> 
>   &dev->clientlist_mutex --> &vm->lock --> xe_pm_block_map --> &dev->clientlist_mutex
> 
> The dependency chain is:
> 1. xe_pm_suspend() calls xe_pm_block_begin_signalling(), then
>    xe_display_pm_suspend() which calls drm_client_dev_suspend()
>    acquiring clientlist_mutex. (xe_pm_block_map -> clientlist_mutex)
> 
> 2. drm_client_dev_unregister() -> drm_file_free() -> xe_file_close() ->
>    prelim_xe_eudebug_file_close() acquires discovery_lock.
>    (clientlist_mutex -> discovery_lock)
> 
> 3. xe_vm_close_and_put() acquires vm->lock under discovery_lock.
>    (discovery_lock -> vm->lock)
> 
> 4. xe_exec_ioctl() holds vm->lock and calls xe_pm_block_on_suspend()
>    which waits on xe_pm_block_map. (vm->lock -> xe_pm_block_map)
> 
> Fix this by moving drm_client_dev_suspend() before
> xe_pm_block_begin_signalling() in xe_pm_suspend(), and
> drm_client_dev_resume() after xe_pm_block_end_signalling() in
> xe_pm_resume(). This breaks the xe_pm_block_map -> clientlist_mutex
> edge in the dependency chain.
> 
> The drm_client_dev_suspend/resume calls are safe to move because they
> only blank/unblank the fbdev console and don't depend on display power
> state or any operations within the block signalling scope.

Other folks already have interesting comments but just FYI:
We'd want to make sure fbdev is not left blank on suspend/resume failure
so the user atleast have an opportunity to see the failure and possibly
add to the bug report.

You can refer to the comment above xe_display_pm_resume().

Raag
