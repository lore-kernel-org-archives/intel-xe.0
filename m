Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6467F606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 06:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fA5L0Gh+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29C5110E588;
	Wed, 18 Nov 2026 06:50:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765B110E588
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 06:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794984618; x=1826520618;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kMP0xx0Wnj6uryKDEkjmgARw0tv26oSlEGvx042RYeo=;
 b=fA5L0Gh+dqcTwb+M55DtKzKFWK0GF3IsEqhGAPlD+rYKxL8s/ueyv5Te
 7VR3gsudkBMxlc+tjwLVJZtspWjaEUSfwcrpZQRmE5zzOHgQtska0qtN3
 +KE2bHIAdoQ/pxZkZqXmM8fql7MnRm7FLPKvN/RPH4ul2p6y+9r9jbeTW
 hfSG6Wos5BTallo3RR6lnMFxWnYUi6G34ocZ3wyLTRO4XlNr1LyeKfQ/5
 BbjDOes6I3XutZ5wUQyH2sQPy8VXoMuJy1iIRoK7M3i4i3SSKEUXcrtLK
 Dh2jV7P1UGORepVbvzJBxtGaB34BtriUdAtPJfKmfb19W/c3NVAWnpUJc w==;
X-CSE-ConnectionGUID: hLen6L3oQWOyBOC7weAu2Q==
X-CSE-MsgGUID: 0oDLPBU2RfaSomFU5vlHcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3805597"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3805597"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 22:50:16 -0800
X-CSE-ConnectionGUID: lXq62iRJRsSFEIMW2ijQhg==
X-CSE-MsgGUID: yAnsHlWqSl+/f17SdZP/6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="11769929"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 22:50:14 -0800
Date: Wed, 18 Nov 2026 07:50:10 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com, matthew.d.roper@intel.com
Subject: Re: [PATCH v7 1/3] drm/xe/cper: Drop redundant counter argument
Message-ID: <av1KoliBrhS1_V1O@black.igk.intel.com>
References: <20261117072118.4051706-5-badal.nilawar@intel.com>
 <20261117072118.4051706-6-badal.nilawar@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117072118.4051706-6-badal.nilawar@intel.com>
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

On Tue, Nov 17, 2026 at 12:51:20PM +0530, Badal Nilawar wrote:
> The RAS counter response already contains the queried error class.
> Use it in the CPER emitter instead of passing the counter separately.
> 
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
