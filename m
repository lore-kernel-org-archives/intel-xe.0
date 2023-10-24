Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF5EEC00A8F
	for <intel-xe@archiver.kernel.org>; Tue, 24 Oct 2023 10:43:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C518D10E093;
	Tue, 24 Oct 2023 10:43:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC7710E342
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Oct 2023 10:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698144218; x=1729680218;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=b2dw0ICQgLp98VkIzgBWcOATj9iJcG7YLHR3hJ261hE=;
 b=aDaZXCslxY/1h4X12hjKMH9FoyyutOmzqLHB97UURiogecKtNwcY32Eq
 wUHcNjHC5czvDmVbZOoA4UJG91nylbUA1VN2t3nSCUnab2UtngjjrwQA9
 ODKYeJMASpuF+bzSkL/Se61gHgcqeFIts/yvpkbaDZ0Ge8DxoUgBERUpT
 iH27Rdl6eiRhoV2kB8Mm4O+XzG507vAwCo2dfiyNKcjqq17nZA2Y/wWm5
 E1Wtsu2yzqOed8n8qBYlleMeVggF0FkLP56ea1eZI4cgV6sowyb7Yp2hJ
 in9FvV41V27GYXpaMKQnZ4GswpshtFXIXjf0DVez77eH7AsuorEnxQYy6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="372091242"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; d="scan'208";a="372091242"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 03:43:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; 
   d="scan'208";a="6415028"
Received: from goepfrim-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.48.28])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 03:43:30 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20231020073430.103493-3-mauro.chehab@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231020073430.103493-1-mauro.chehab@linux.intel.com>
 <20231020073430.103493-3-mauro.chehab@linux.intel.com>
Date: Tue, 24 Oct 2023 13:43:34 +0300
Message-ID: <87zg089u7d.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 2/2] drm: xe: xe_display_misc: fix build with
 W=1
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

On Fri, 20 Oct 2023, Mauro Carvalho Chehab <mauro.chehab@linux.intel.com> wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
>
> As reported by LKP, when the Xe driver is built with W=1, a warning
> will be produced:
>
> 	>> drivers/gpu/drm/xe/display/xe_display_misc.c:10:14: warning: no previous prototype for 'intel_gmch_vga_set_decode' [-Wmissing-prototypes]
> 	      10 | unsigned int intel_gmch_vga_set_decode(struct pci_dev *pdev, bool enable_decode)
> 	         |              ^~~~~~~~~~~~~~~~~~~~~~~~~
>
> Currently, such function is just a stub, not used anywhere.
> Yet, it is declared there without a prototype. As this is just a
> reminder for something that will be implemented in the future,
> change it to static and add __maybe_unused to disable compiler
> warnings on it.

Please just include the header with the prototype.

BR,
Jani.

>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202310201234.ZZLwdoiy-lkp@intel.com/
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  drivers/gpu/drm/xe/display/xe_display_misc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_display_misc.c b/drivers/gpu/drm/xe/display/xe_display_misc.c
> index 81ff97e704ea..53a53e500a09 100644
> --- a/drivers/gpu/drm/xe/display/xe_display_misc.c
> +++ b/drivers/gpu/drm/xe/display/xe_display_misc.c
> @@ -7,7 +7,7 @@
>  
>  struct pci_dev;
>  
> -unsigned int intel_gmch_vga_set_decode(struct pci_dev *pdev, bool enable_decode)
> +__maybe_unused static unsigned int intel_gmch_vga_set_decode(struct pci_dev *pdev, bool enable_decode)
>  {
>  	/* ToDo: Implement the actual handling of vga decode */
>  	return 0;

-- 
Jani Nikula, Intel
