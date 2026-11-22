Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344DF606A320
	for <intel-xe@archiver.kernel.org>; Sun, 22 Nov 2026 14:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HLHZ9+xR
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E781D10E474;
	Sun, 22 Nov 2026 14:57:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6DCF10E474
 for <intel-xe@lists.freedesktop.org>; Sun, 22 Nov 2026 14:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795359467; x=1826895467;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bzTeUpZzUSE5SMOfkoz8yM7BnGUdVKsbm94MwF0qgyQ=;
 b=HLHZ9+xR3/nSrwnCkcosdsAheYfUIjKwImLgrrlh64nvLUzhcPw+4cYc
 RS1g9c6XH3HaIun/S2M6ukSuP+xxT7STo7ICUKvjuHMDzIMqjZhwIwJbr
 68vlBLQivtDYA25RzuE1u2wTtUjHZfEy+KUoX5BQGKCVfLf6Ew7gQ7Aqw
 VgE4LoIqVvUiq2J/MCmSQkduh+PGaAhTk62mbqL+HiA0xF6Dpw3okXbnG
 orgp4WdKc5+L7QLjfXoU0i+tMv4XsWCHXHjgXfISg6mSqSWrCkf207Xx7
 gIQXpxytD/iDfnABiYGcvvBFI/+DwiUruZNre/F6NLCEOa1LEhJYZ0TRL g==;
X-CSE-ConnectionGUID: LdKtZ1KjS+qoAIDu2LJY5g==
X-CSE-MsgGUID: uNzrhclrQZWIED4gqeUQpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4084761"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4084761"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 06:57:47 -0800
X-CSE-ConnectionGUID: VUdGEMgGRJS8l4R9Q6Qluw==
X-CSE-MsgGUID: HHNDaXh9TxajnRAfDjx3RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11000763"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 06:57:44 -0800
Date: Sun, 22 Nov 2026 15:57:40 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com, matthew.d.roper@intel.com
Subject: Re: [PATCH v11 2/3] drm/xe/xe_ras: Add support to retrieve info
 queue data
Message-ID: <awMC5AltQ1XO2lXH@black.igk.intel.com>
References: <20261122144838.214706-5-badal.nilawar@intel.com>
 <20261122144838.214706-7-badal.nilawar@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261122144838.214706-7-badal.nilawar@intel.com>
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

On Sun, Nov 22, 2026 at 08:18:41PM +0530, Badal Nilawar wrote:
> Retrieve the RAS info queue data, in multiple chunks, and assemble it into
> a flat buffer.
> 
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
