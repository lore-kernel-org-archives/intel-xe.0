Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04621606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 07:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P2ysRfQ5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE0010E124;
	Wed, 11 Nov 2026 07:09:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA4D10E124
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Nov 2026 07:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794380961; x=1825916961;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CXCP584HSgiyZhzntCc7MN8e71I6YccaFSK8NL1Ppc4=;
 b=P2ysRfQ5jqQaLudKo0LiAn4fuJT4aLKRKVeCHukM8J+i7MWvZBtOJGP9
 l+vRwhRqYSTrA9eI28Dnl5rd8c1Hc4h/zPL9HeaLWhaQ2qTbjr8cbiwoJ
 4OpntaT8Et1uHrGjK3pfMICiFCtbzWJude6Sc8c5wz7+RHR/eT+Ad1bjp
 9CLdRGbHRg+KzyI1ov7SosMAdGM9n7raSgdJBzzOmTb/st6tDXTg+qdQL
 GXYPgA8LuXFn2L0Tw/X8b/EINhOdfzT5x0BLpp703bX/DP3BZC7DbbREz
 HZR6IaFSVVsmh5KTTUU6h1iKudNbj2hJIYLvwK4MBKl/BRqUrp2SnTXOM g==;
X-CSE-ConnectionGUID: wnLWqb5nSAKEwiL++hU6sw==
X-CSE-MsgGUID: q4qdQzuETu22XxqS8P4WWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3174229"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3174229"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 23:09:20 -0800
X-CSE-ConnectionGUID: zkSeCMDCRlex8wigTmOLGg==
X-CSE-MsgGUID: EcZf7NCKQ0OnHm68lF2a0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8391229"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 23:09:19 -0800
Date: Wed, 11 Nov 2026 08:09:16 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 mallesh.koujalagi@intel.com, badal.nilawar@intel.com
Subject: Re: [PATCH v4 3/8] drm/xe/survivability: Guard runtime survivability
 enable against unbind
Message-ID: <avQUnHig9Ign-njH@black.igk.intel.com>
References: <20261106071944.2693854-10-riana.tauro@intel.com>
 <20261106071944.2693854-13-riana.tauro@intel.com>
 <avMTTzrY0kPJRChS@black.igk.intel.com>
 <02e5f319-4d40-4ec2-9d50-a15b4102b21c@intel.com>
 <avP_gtHbb-taK6DK@black.igk.intel.com>
 <524ae4f5-d484-4af4-a7ac-68bdaef970c5@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <524ae4f5-d484-4af4-a7ac-68bdaef970c5@intel.com>
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

On Wed, Nov 11, 2026 at 11:20:02AM +0530, Tauro, Riana wrote:
> On 11-11-2026 11:09, Raag Jadav wrote:
> > On Wed, Nov 11, 2026 at 10:13:44AM +0530, Tauro, Riana wrote:
> > > On 10-11-2026 18:21, Raag Jadav wrote:
> > > > On Fri, Nov 06, 2026 at 12:49:48PM +0530, Riana Tauro wrote:
> > > > > Runtime surivability mode creates sysfs and declares the device as
> > > > > wedged in a worker thread. This can race with unbind.
> > > > > 
> > > > > During unbind, devres actions such as disabling the worker run as part of
> > > > > teardown. A runtime survivability enable that is still in flight or gets
> > > > > scheduled in that window can create the survivability sysfs entries while
> > > > > the device is being removed. This is incorrect, as runtime survivability mode
> > > > > must not be entered once during devres teardown.
> > > > > 
> > > > > Use the DRM device enter/exit protection so that the enable path
> > > > > synchronizes with device unplug and returns early if the device is
> > > > > already being unbound.
> > > > I'm a bit lost here. Doesn't disable_work_sync() already guarantee this?
> > > If the worker is already queued and there is a unbind in progress. The
> > > disable work sync from devm
> > > action waits for the worker to complete. This causes the device to enter
> > > survivability mode during unbind
> > > which is not intended.
> > Wouldn't the survivability stuff still land on devres and get cleaned
> > up anyway?
> 
> devres_release_all running as part of unbind copies all the devres nodes
> into a todo list and then
> releases them. If during release, we add a new devres that will not be
> cleared during unbind
> which can cause stale sysfs.

Hm, I thought all the devm actions are protected by devres_lock but
you're right.

A more robust fix would be to disable all the workers in ->remove()
callback itself and avoid such races to begin with, but I'll leave it
upto you.

Raag
