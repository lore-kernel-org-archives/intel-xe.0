Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65CA0C54FDF
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 08:57:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AE0B10EE49;
	Thu, 30 Jul 2026 08:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J5zyyH8r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F7E910EE49
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 08:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785401872; x=1816937872;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xHCFGN9aLJPLuKbLkKWhD66LanX/hUh4Zd0AyLJN6OM=;
 b=J5zyyH8r5kp+KibYH6Me1Aro4chxXKPl/9sayU2/O8ivYjSPrL9wyt6G
 mf1RODrMQBH6Kjuvhac1ypOxYnnii89Y9Ve9txWVfbS4nHOUfHXcPZMQm
 E1WSQ02gRg5ebhf4M1AxnWypdMY53okKM7FIvBF4HBZgC6l0b4ErTNyrZ
 b/0bWXSPyfjpI0AeAg0nlaS7Gx3G8MNHrk0VM88KBkDkh3lDS5cv8E0oa
 2jfFi/VW/lW8X+XS/8Db26uQOviGYME7oA9aY0PKu+x1dDLO6AlCdi6Px
 fPHuoqeKD/0xUg+cT58lDTZN/duQMATclDlrm67J7vLeZCMfD5/PPnofb A==;
X-CSE-ConnectionGUID: RYfWgbghSO+SYHDZfy6Z8w==
X-CSE-MsgGUID: 3kHw/hz7TYqRZofgGQIZ3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103553455"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="103553455"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 01:57:52 -0700
X-CSE-ConnectionGUID: PvPEvzdoRG2m6ezpCgTUlQ==
X-CSE-MsgGUID: IinMr40ZQ8efE30XXFIukQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="259669459"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 01:57:50 -0700
Date: Thu, 30 Jul 2026 10:57:47 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, vinay.belgaumkar@intel.com,
 riana.tauro@intel.com, karthik.poosa@intel.com, sk.anirban@intel.com
Subject: Re: [PATCH] drm/xe/ras: Split RAS init into xe_ras_init_early and
 xe_ras_init
Message-ID: <amsSC57qtHNAj4gs@black.igk.intel.com>
References: <20260730065430.902562-2-mallesh.koujalagi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730065430.902562-2-mallesh.koujalagi@intel.com>
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

On Thu, Jul 30, 2026 at 12:24:31PM +0530, Mallesh Koujalagi wrote:
> xe_ras_init() was doing two unrelated things: setting up internal
> bookkeeping needed before interrupts start, and querying firmware
> errors that can only be done safely after the device is registered.
> 
> Split it into two functions with clear responsibilities:
> 
> - xe_ras_init_early(): runs early, before interrupts are enabled.
> 
> - xe_ras_init(): runs after the device is registered.

Why not just xe_ras_process_errors() after drm_dev_register() and keep
the rest as is?

With,

Fixes: d9732e498f5f ("drm/xe/xe_ras: Query errors from system controller on probe")

Also, IIUC process_hw_errors() suffers from the same problem after commit
a7df563b45b0 ("drm/xe/xe_hw_error: Handle CSC Firmware reported Hardware
errors"), which we also might want to fix at some point.

Raag
