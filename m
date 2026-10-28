Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3985C606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 17:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mIG2LJ84
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F23D910E6B8;
	Wed, 28 Oct 2026 17:06:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 104A410E6B8
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 17:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793207194; x=1824743194;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RCLq1X/UcU9L1bv7pvDuZ1LHL/4/XR8BM+rnWyfPIck=;
 b=mIG2LJ84214dP50cruvxNqy9ebyGqFVFZWzo3xJCPaFJ5lXYTKsSOMAG
 zLMIEag1ubi04/Ro/FbXKMLwPKaLSILj4qzG9GU0d1j1NUtHFnzm6z48v
 49KWeqjvKaHDVWk0H6zUdHZMCHrOWUfqzln7L5s+RvYkG59ndZSKqyXpc
 7PkTZQeN4oqTnsho2Y7VQMKDbCJY3ykX+6tqLi+NgSCxlNt9SLZemK0Tf
 sjIm8ll+mzkuFjbVbMDIkU1/53ucwhBV2WRzwHjvElMFPGbNWJJAdb3Gm
 X/Uu+xT9pofLVz0BecLw7pk1ONEG5mq4JsKTUTMKTqZIouO7E7oHwJwTI g==;
X-CSE-ConnectionGUID: A6vEO0RLTb201+N1Q3oBCg==
X-CSE-MsgGUID: +S1xuO0gR/yGf0kX7bl/mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1961009"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1961009"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 10:06:34 -0700
X-CSE-ConnectionGUID: hN+WSwSOS82HzTPymGsyeg==
X-CSE-MsgGUID: JxcVlAQwQgmpzEbOE+n2cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="4847231"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 10:06:31 -0700
Date: Wed, 28 Oct 2026 18:06:28 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com
Subject: Re: [PATCH v6 06/10] drm/xe/cper: Emit cper record to trace buf
Message-ID: <auIrlLnOUCYxTs_C@black.igk.intel.com>
References: <20261028095723.734387-12-badal.nilawar@intel.com>
 <20261028095723.734387-18-badal.nilawar@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028095723.734387-18-badal.nilawar@intel.com>
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 28, 2026 at 03:27:30PM +0530, Badal Nilawar wrote:
> Add the xe_error_cper tracepoint and emit each assembled CPER record
> through it. Besides the raw record, the event carries the device name,
> platform ID, FRU ID, severity and the Intel error section header, so
> tools can pick up the records from the trace buffer.
> 
> Assisted-by: LLM
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
