Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039D4606A326
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 09:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Zl/IwE0G
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F63D11218F;
	Thu, 26 Nov 2026 09:25:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAFAE11218F
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 09:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795685140; x=1827221140;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eB/VkuXvMQlN8o0SkcUmp43o1tZV0NhPIXcnHc0u+yo=;
 b=Zl/IwE0GNQOypu7X+qC4R4ljeyFvuj37EFEN5bWkV10TVfl703rA9yNT
 qEp9lEt4pv0GBUcKrisn+SGbkaYLkYpQk6I/0WRZakyjduC9n8qU2cd68
 YByoNGuFoQVGOYB9/q/cWIiWDEaSh5MLxxlIrqfi620/3vtIVqRa54maH
 usmBupzGJutbxkB3WFxcySdUGinevIWd/ktsTxzA1TdEnuHfmFpgpAjer
 1jWk1xcNy+gfVCMcGNDnRrU3q4mSzb8dFKp72WFo5IVv5Or8FK87ERJj/
 j0jnJDxXWcYOVDiv4SaHMnvB5nCdoQ7K3z0Kj8amg1NCbbJnSpItxs7GL g==;
X-CSE-ConnectionGUID: 7HAqMHTzTVmvJE6rEPN8sQ==
X-CSE-MsgGUID: 0hTaKzozQDeQZYSsLhdJAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4493966"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4493966"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 01:25:40 -0800
X-CSE-ConnectionGUID: QeTF1NbPRRixs4XHka/BBA==
X-CSE-MsgGUID: EOQ6QJhSTw6CsR44X99zvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12446319"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 01:25:37 -0800
Date: Thu, 26 Nov 2026 10:25:34 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, badal.nilawar@intel.com,
 aravind.iddamsetty@linux.intel.com,
 ravi.kishore.koppuravuri@intel.com, mallesh.koujalagi@intel.com,
 tejas.upadhyay@intel.com
Subject: Re: [PATCH v4 3/3] drm/xe/ras: Skip offline queue processing after
 device unplug
Message-ID: <awf7DtksUhNVbRDa@black.igk.intel.com>
References: <20261126083516.1932195-5-riana.tauro@intel.com>
 <20261126083516.1932195-8-riana.tauro@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261126083516.1932195-8-riana.tauro@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 26, 2026 at 02:05:20PM +0530, Riana Tauro wrote:
> The system controller worker can drain the offline queue at runtime.
> During teardown, devres runs ras_fini() before sysctrl_fini(), so the
> worker can still run after the offlined pages XArray is destroyed:
> 
>   CPU0 (teardown)                 CPU1 (sysctrl worker)
>   ras_fini()
>     xa_destroy()
>                                   xe_ras_get_offline_queue()
>                                     ...
>                                       xa_store()
>   sysctrl_fini()
>     disable_work_sync()
> 
> Wrap xe_ras_get_offline_queue() in drm_dev_enter()/drm_dev_exit().
> drm_dev_unplug() runs before devres teardown and waits for in-flight
> sections, so no queue processing runs after ras_fini().

Considering the current state of affairs, this is going to become more
and more difficult to manage. Rather, introduce a ordered workqueue as
part if xe_ras state and schedule both sysctrl and hw_error work on it.

Raag
