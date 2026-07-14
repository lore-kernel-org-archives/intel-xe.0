Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1CEC43458
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 08:10:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5142810EC5E;
	Tue, 14 Jul 2026 08:10:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JtUkh8HK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD5D10EC4E
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 08:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784016620; x=1815552620;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=POik9AkXAkbl0BjpaMv3bfjXbh5pVssC4wHgQPFdi+o=;
 b=JtUkh8HK0kbu5JSpA7jrz1vxXY1TTYZtIbtl6oEiG6AGpJ7FZlNfZFbf
 cVpQipDHoOzHnV6amHGA768bfDdTsIcrqO+8KcQVot4/49Sho7A1WX3zU
 gKHnDa73zUbukBCyP08bkEfIMu6GosS7vbTxR9Q1/Djr2EbWL1eyqlIMI
 eZHblJKLnDcQvEkphshrt5y2ANeB3YKMYzXOMszLDAITrKBqwxe4K40P2
 o0nC+d8v5/JpqqTJhOZ6FUb23HJExqd0VqVjhTw+2IhnfTwYQK8I0J2Wf
 FVu4lYfhjpLAPhGq/TxCK0Fq4bQjpQIwpFZbIswrqQkoqiiul0WStO0zv A==;
X-CSE-ConnectionGUID: kqBJfv6lSJuhFFWpVO8eIQ==
X-CSE-MsgGUID: TJI2HHXDSke5qK7oQ5kfXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="102185210"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="102185210"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 01:10:20 -0700
X-CSE-ConnectionGUID: mCGBd9TbRCqLHfl5pGz5dA==
X-CSE-MsgGUID: nMpaKtmoQW+bwru3BzZqhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="279055206"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 01:10:18 -0700
Date: Tue, 14 Jul 2026 10:10:15 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Soham Purkait <soham.purkait@intel.com>
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 anshuman.gupta@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, andi.shyti@intel.com,
 rodrigo.vivi@intel.com, anoop.c.vijay@intel.com
Subject: Re: [PATCH v10 1/1] drm/xe/xe_ras: Add RAS GPU health indicator
Message-ID: <alXu5xaV1XA8dE8e@black.igk.intel.com>
References: <20260710083325.300389-3-soham.purkait@intel.com>
 <20260710083325.300389-4-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710083325.300389-4-soham.purkait@intel.com>
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

On Fri, Jul 10, 2026 at 02:03:27PM +0530, Soham Purkait wrote:
> Add a sysfs interface that reports the current GPU health state and
> lets admin users and management tools update it but is readable by all
> users. Requests are routed through the sysctrl mailbox. The interface
> is present only on platforms that support the GPU health indicator.
> 
> The interface is a single read/write file at the device level:
> 
>   $ cat /sys/.../device/gpu_health
>   ok
> 
>   $ echo critical > /sys/.../device/gpu_health
> 
>   $ cat /sys/.../device/gpu_health
>   critical
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Acked-by: Raag Jadav <raag.jadav@intel.com>
