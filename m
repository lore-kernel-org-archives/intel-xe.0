Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523D1606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 16:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FVzhx8Td
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A75B10E645;
	Wed, 28 Oct 2026 16:22:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E60B10E645
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 16:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793204565; x=1824740565;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=39E7WXf1spnl6ZW4Oy0LCtr2zzUt9eNo6SNGSf5LmHk=;
 b=FVzhx8TdznEaAhyP+uPBTrzRhBqupZblhmPGd4HLUAB/zf3Y+K1Lr6cF
 d6KOg0kufo5sBAKwctCKET7cUTPZEmf9u9hEiWP3bomgeJtDLS7IAQaxs
 5YBr0Vv5Af6z3u7CRwp4SMh9qJ+fjc7oAD0/Uo0E11fsvToWbQ9cZvi8j
 jxp5Bhi3FSCJnWtxDYqcZzxIKTliewV9BaIAXBqbAM7xnDOh/zqhRdiLj
 Zpn0vbiIXU79GaJYnVQCO3kSnoqePIfHRks5LZhm+8XsJIDEbtIxaCQv5
 laGg6HgCqYObVSO1A6cLC6x4tiqlAmdoF+FLgBRcMyiyZZZxeReFw0dQY A==;
X-CSE-ConnectionGUID: jOyBUhQoTz2WKczQRhnsbA==
X-CSE-MsgGUID: yGgvpEAHTM2rJ+YY8eLY7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1921698"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1921698"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 09:22:44 -0700
X-CSE-ConnectionGUID: EOlctm+KQLiPRKYX6l4b9Q==
X-CSE-MsgGUID: hUKgUldgQDuX8sT5nHfWdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5018846"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 09:22:41 -0700
Date: Wed, 28 Oct 2026 17:22:38 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com
Subject: Re: [PATCH v6 01/10] drm/xe/cper: Add CPER reporting entry point for
 xe_log
Message-ID: <auIhTiQaOTenUMm5@black.igk.intel.com>
References: <20261028095723.734387-12-badal.nilawar@intel.com>
 <20261028095723.734387-13-badal.nilawar@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028095723.734387-13-badal.nilawar@intel.com>
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

On Wed, Oct 28, 2026 at 03:27:25PM +0530, Badal Nilawar wrote:
> Introduce xe_cper_emit() as the single entry point for emitting
> CPER records from xe_log. xe_log now forwards every SIGID log entry
> with its full context (component, location, data/len and formatted
> message), and xe_cper decides how to report it. Hardware SIGIDs are
> routed to a hardware error helper, software SIGIDs are left as TODO.
> 
> Assisted-by: LLM
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
