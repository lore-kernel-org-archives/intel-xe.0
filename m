Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4ED1067043
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 15:33:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CBAB10EA49;
	Thu, 12 Mar 2026 15:33:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WirZ+9BJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6DB710EA49
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Mar 2026 15:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773329630; x=1804865630;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HEOOFuA0kt7+EtuakxAGbqWw1wNmcLV3/QmSl9W6Mxg=;
 b=WirZ+9BJCeEJ0+L4F77FoB59BM7slWHE5/IzWhs6XaxqC1VD825njpLO
 R3oxow8UL+F+FFQDsQcPFfGnYBKnaGaZZxLp58AfydrlYPZHYazxXvDLX
 CWdVx34IUgw+NJPLeb2XTvLoOyVHnx65g4nR51dGdm6ZYup55HEYy/Agy
 yAQEo9WN65r0GWKFIFYy0kMDSu9ESREylxf2iB1yihhVZkQidqg/Ulx50
 /r4Juq7I5Sgfo1vdUoPV2sLLNfCbTspGOy+eFzlcIBJfsUYsfly8+EaoX
 e6D1O3aczhncNbPXOK7OBvjdssXtuLw8S1p0YWPAsOD9QBXmogtKvTWzp w==;
X-CSE-ConnectionGUID: Z2iclcXOSU+yKyH7coALeg==
X-CSE-MsgGUID: jtZouInSQ4aK0pOSQr9NKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="97036891"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="97036891"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 08:33:50 -0700
X-CSE-ConnectionGUID: dvezhShWTyKYd1LJDnclRA==
X-CSE-MsgGUID: +CpVAw51Rw+6u0WomAVxVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="225549206"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.245.114])
 ([10.245.245.114])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 08:33:48 -0700
Message-ID: <436ae8c7-ff42-42a2-a647-d28aeb86295b@intel.com>
Date: Thu, 12 Mar 2026 15:33:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/uapi: Fix kernel-doc for
 DRM_XE_VM_BIND_FLAG_DECOMPRESS
To: Nitin Gote <nitin.r.gote@intel.com>, intel-xe@lists.freedesktop.org
Cc: kernel test robot <lkp@intel.com>
References: <20260312160244.809849-2-nitin.r.gote@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260312160244.809849-2-nitin.r.gote@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 12/03/2026 16:02, Nitin Gote wrote:
> There is kernel-doc warning for DRM_XE_VM_BIND_FLAG_DECOMPRESS:
> 
>    ./include/uapi/drm/xe_drm.h:1060: WARNING: Block quote ends without
>    a blank line; unexpected unindent.
> 
> Fix the warning by adding the missing '%' prefix to
> DRM_XE_VM_BIND_FLAG_DECOMPRESS in the kernel-doc list entry for
> struct drm_xe_vm_bind_op.
> 
> Fixes: 2270bd7124f4 ("drm/xe: add VM_BIND DECOMPRESS uapi flag")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202603121515.gEMrFlTL-lkp@intel.com/
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
Assuming this does fix the warning,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

