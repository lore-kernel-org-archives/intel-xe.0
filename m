Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7943606A32E
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 12:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SrxraEGq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99FFD10E40B;
	Tue, 27 Oct 2026 12:43:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A7C910E40B
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 12:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793104998; x=1824640998;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Vmw5lqZ4QHnwnQSD/FbGr7VWq7HNeXTqX9mGbaPOYX0=;
 b=SrxraEGqaBDmkmzZXe3WE/uk4Ovzpw7xEayBD0Y2/whonQKqu6GaVGot
 YXSN0JGakJjxpIog6/KPi1S7Q+YOlN90PrT/chEqqLb4qkhjS1qgiMNvZ
 sGYNnFt8PZUfbXCb64abZFNNw4RazoW0Rzx22IzPoAxvtI8Si7q8R1bnd
 z4RxOsuWj9dDrODYAhQxMw8FfcBEv1LbyByBfnAlDu7vTA1O13KoqmYV4
 MYQKf8i8egck40+tEtKrblkTr0tFmKaFCXLsTguAfvXK9628BRQUoTGP7
 Q5LJjEfER3xlVVfr1vUJ/AyFnNW+XxVPahOefbVBQu7BpgRrMrzlTeci/ Q==;
X-CSE-ConnectionGUID: dy4kRRXwQBWoDc/Opu4BNQ==
X-CSE-MsgGUID: cIbG6iD0RG+t1mDgb9b+1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1683949"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1683949"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 05:43:18 -0700
X-CSE-ConnectionGUID: TnHGBOJSR7OW2cIoGFIhag==
X-CSE-MsgGUID: wknxbwp9Q1uaL6g2m+3krw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4632288"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 05:43:15 -0700
Date: Tue, 27 Oct 2026 13:43:12 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com
Subject: Re: [PATCH v5 08/13] drm/xe/xe_ras: Report core compute errors using
 SIGID
Message-ID: <auCcYLT1rzlLj5dS@black.igk.intel.com>
References: <20261023043422.681260-15-badal.nilawar@intel.com>
 <20261023043422.681260-23-badal.nilawar@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023043422.681260-23-badal.nilawar@intel.com>
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 10:04:30AM +0530, Badal Nilawar wrote:
> Use xe_log_* helpers to report core compute errors.
> 
> Example:
> 	xe 0000:03:00.0: [drm] *ERROR* SIGID=203 (02020012000a000200000800)
> [Hardware Error]: CORE_COMPUTE: Uncorrectable error detected, type 2
> 
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
