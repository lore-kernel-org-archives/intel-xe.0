Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B91606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 16:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iT5XytFV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A7E710FDB1;
	Wed, 28 Oct 2026 16:35:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E4710E092
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 16:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793205304; x=1824741304;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gSmk/346EPXGjBxST0dyM7CsykbDPko5IRQVFViW2CU=;
 b=iT5XytFV2molUq/kKGGqAlcaxRY3iuXnFF8xNzF7YSCDE1v1Oiq+k3zu
 VYdfZU7444r+EOsV+lmfNEPMlpnERoZxx8UabcXcq1l4hbIYImmAtzWlK
 OGqkfH5E61qhsSeNV8JM9597+h/W3H2HZYkx2SaDb2LQYsEJQ7Eu9iVeM
 a0WYuSLaQmzS/2GHYZalwKBtnoo+kmNMq+gxjkIFLl79KHFmhNBB+mZLZ
 9Jz1nT8CyuOHZEr2TcKqsLBzMPkvl92kl+C1nkMbkkPrJZjg0sjglAbwv
 adsoREYDVhC9Wf4hlsadKjhLjghwVjKQ3dv/xTyWUwSIhdgtPdDLLcNm5 A==;
X-CSE-ConnectionGUID: O0IX4opzQsG55KEF3PT8Og==
X-CSE-MsgGUID: 1fIUyDbiRVmzlp/O3rBs1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1935613"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1935613"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 09:35:03 -0700
X-CSE-ConnectionGUID: Mhx13XvjS1i/nkL48ufbeA==
X-CSE-MsgGUID: ooYXac60SWCxQ6rhn/hpNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="4972150"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 09:35:00 -0700
Date: Wed, 28 Oct 2026 17:34:58 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com
Subject: Re: [PATCH v6 03/10] drm/xe/cper: Initialize Intel-specific CPER
 header
Message-ID: <auIkMqr_gTdHmVqE@black.igk.intel.com>
References: <20261028095723.734387-12-badal.nilawar@intel.com>
 <20261028095723.734387-15-badal.nilawar@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028095723.734387-15-badal.nilawar@intel.com>
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

On Wed, Oct 28, 2026 at 03:27:27PM +0530, Badal Nilawar wrote:
> Define the Intel-specific CPER header and initialize it
> from the error counter record for Intel GPU hardware errors.
> 
> Assisted-by: LLM
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
