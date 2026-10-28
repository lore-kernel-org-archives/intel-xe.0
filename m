Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361FC606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 16:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gqxzhoZd
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A11C510E092;
	Wed, 28 Oct 2026 16:25:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4E8C10E092
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 16:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793204710; x=1824740710;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yBi9tnfiptC1mFdK0HsoWmQ8RW2P3+GSKLD9YhgbnpU=;
 b=gqxzhoZdKon9gfMB8kKqk6RS0316z3czbjB6wnGtAiqCQZavg2dTZXW/
 No98KsiRSnb1oceCIdoOdiuVS7x4kx3kEuPDXcS+vCWnsHdYSsIwLAYWW
 KfmC7PvxDEX4vvqSJhSX0rUaq4EN2IBDkYn1w7q2IsRJ5/epKhPrjRDch
 ZRkMD7hN2jqdSrmPF++lVtLcGcr83M8vrJkIv1s2wue+gewXqzkyrEfIe
 2PFWouxu8n+b1S0YAbr/o29CfYwgJhXxCikzUas07V9njit+QZmWA/NMk
 fCSzOSa5B7A1GGLhSyGFWCAcx00kOApdEVjuP5JajtKDGlxBn7rI/SSYv A==;
X-CSE-ConnectionGUID: LcptMKNTT6uVB3jg0ryBqw==
X-CSE-MsgGUID: N1IZAe8IQDCH9gxraBzd4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1827809"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1827809"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 09:25:10 -0700
X-CSE-ConnectionGUID: agCqKix7QCKA1AOybQ+paw==
X-CSE-MsgGUID: MCQcGpc4TFmXyYwCdaPVdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5204338"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 09:25:08 -0700
Date: Wed, 28 Oct 2026 17:25:05 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com
Subject: Re: [PATCH v6 02/10] drm/xe/cper: Retrieve the error counter record
 for CPER reporting
Message-ID: <auIh4RiXHkilpK6I@black.igk.intel.com>
References: <20261028095723.734387-12-badal.nilawar@intel.com>
 <20261028095723.734387-14-badal.nilawar@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028095723.734387-14-badal.nilawar@intel.com>
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

On Wed, Oct 28, 2026 at 03:27:26PM +0530, Badal Nilawar wrote:
> Retrieve error counter record required to build a CPER record.
> 
> Assisted-by: LLM
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
