Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B8BC71149
	for <intel-xe@archiver.kernel.org>; Fri, 18 Aug 2023 14:17:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2240089B62;
	Fri, 18 Aug 2023 14:17:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C8B89B62
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Aug 2023 14:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692368245; x=1723904245;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JAogDTV4NBv+t76FHaDZdQNcwKjTjaXV18/cOpIS9CU=;
 b=Ow8x0QL/WN9IZHvG5PaDV32KcGNye+xcMExxXIMfaqMuk3a1FvpCkDms
 nyPMNbEif62nvlOxPBclRzP4GIcq3onHu4YyAJmQvUt3e0nF77BiANabL
 2lLpfH+J3BgxgAom2kz+k5l3tlKNJKTUhV1fkNiOVP3Qwz+eg+MN58ST9
 9hb8JvIfSwoVEPcAG7ixzEe2OQi0ngU9+QM/wWol+yWMgNaxbuml/GjKI
 Zx7AVXeeJ1DqGInkyM8wG8oTNVv9JvrwC85pNvFPqSeowUSSY1zBosnZe
 Jr0irjQmrkIGihhEnDNpPCJrgpGX/UXBoLSO1bcoeQQw+nSLCda98Bq9u w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="358076915"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="358076915"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 07:17:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="770145707"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="770145707"
Received: from esavax-mobl.ger.corp.intel.com (HELO intel.com) ([10.249.41.4])
 by orsmga001-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2023 07:17:23 -0700
Date: Fri, 18 Aug 2023 16:17:20 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZN99cJzZ2u8ij08U@ashyti-mobl2.lan>
References: <20230818135810.2093337-1-tejas.upadhyay@intel.com>
 <ZN96QbtifizPTNV9@DUT025-TGLU.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZN96QbtifizPTNV9@DUT025-TGLU.fm.intel.com>
Subject: Re: [Intel-xe] [PATCH] drm/xe: madvise_funcs should use value not
 property
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Tejas,

On Fri, Aug 18, 2023 at 02:03:45PM +0000, Matthew Brost wrote:
> On Fri, Aug 18, 2023 at 07:28:10PM +0530, Tejas Upadhyay wrote:
> 
> You need a comment in the commit message.
> 
> > Fixes: c160a11ccbef ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> >
> 
> Delete this newline.
> 
> > Cc: Matthew Brost <matthew.brost@intel.com>
> 
> With a fixed commit message:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

please add my

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

as well.

Thanks,
Andi
