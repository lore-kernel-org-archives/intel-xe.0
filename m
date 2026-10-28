Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB84606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 17:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VG5HMkH/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 892C789316;
	Wed, 28 Oct 2026 17:07:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3081B89316
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 17:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793207253; x=1824743253;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rmn1HqI4o/kxHgHmPvyFfkPdcU5MJyEPOHeWPZgBTvs=;
 b=VG5HMkH/vVsI7VujTA5seirxJAfF8NfgG8g3cKcannNXI26V9FBxA2uj
 nojWUfnfomwMLIDcnvzYmI32khu1IO+5wNXKKnp4e0urMLICHzAK6oTCS
 W9CMNKqK7EAkrjotfKnTYbWSaN/7ey4WGMVvhlE4qVbwZqWw/6Y998Iqz
 BtKnCeJMZb1R8WqlIfQYY1Q2He9SY5BaUC5PlP6qHM7Sc0fi5Cp75moW1
 +Exy8Hq26V0FVg95ZJoOFGxmUr78gwdTaBBMTwwTmIm3utBGbMkUKm0dj
 IFVozuwfXIbTIva8BbXPIyMZEauu1SGiPSJH2V8MP5on38DOsGKVnY3jg Q==;
X-CSE-ConnectionGUID: HNIsCpF9RHqHHiC/b85OKg==
X-CSE-MsgGUID: 4uTyU0HJTRa//yPzPP6S/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1926637"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1926637"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 10:07:32 -0700
X-CSE-ConnectionGUID: tB70DxnbTRimowuYP6bfQw==
X-CSE-MsgGUID: xSGz18fxTICStaY2qsiW1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="4825278"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 10:07:29 -0700
Date: Wed, 28 Oct 2026 18:07:26 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com
Subject: Re: [PATCH v6 07/10] drm/xe/xe_ras: Report device memory errors
 using SIGID
Message-ID: <auIrzo_B4wpToy9g@black.igk.intel.com>
References: <20261028095723.734387-12-badal.nilawar@intel.com>
 <20261028095723.734387-19-badal.nilawar@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028095723.734387-19-badal.nilawar@intel.com>
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

On Wed, Oct 28, 2026 at 03:27:31PM +0530, Badal Nilawar wrote:
> Use xe_log_comp_info helper to report device memory errors using the
> corresponding SIGID.
> 
> Example:
> 	xe 0000:03:00.0: [drm] SIGID=202 (020100020008002000300000)
> DEVICE_MEMORY: Double-bit ECC error at sw address 0x63000
> 
> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
