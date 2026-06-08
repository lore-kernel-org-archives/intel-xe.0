Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D739CD8C92
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 15:20:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B1D110F5B3;
	Mon,  8 Jun 2026 15:20:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DiyuJba1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDBB010F5B1;
 Mon,  8 Jun 2026 15:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780932043; x=1812468043;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9eObIzUp90iyVovOiFW6Wv3TBcfaWK1EtMywRF2ykeI=;
 b=DiyuJba1umxn7K79+cTUt0pnD9cMOrsLFgxrc+dLvHEokaOnpskoOh4C
 llGixo6p33WcbIDLJ1f/Wth7mO4QL97ulNn/KQpHt86vVDVTkHJmDII9D
 9CUqM5pQ6h8taqYy3uXvd/NKHuy7XY9YKjhd5ntDe5SD8m6TeHGZMHsgt
 vtq3yHQ4jspbtpw1bfe83WjK/D09woWgR8gr0r8gu/8+nb3U9ba3QCqM9
 kDdW6lKRJO0na4L2ROYs+YFgNdo+WWSS/TewO5YJ7om6M9fmVz2rXgGu4
 JvqlOeGIfDMkbaZTL5euAtRVmjRhAaxj+eauSlauHJIAatRLDWpBVgN25 g==;
X-CSE-ConnectionGUID: DpuYdi9fTIen9ePMMPWjFQ==
X-CSE-MsgGUID: eTJxxcHMQUatWO2Hhs1zbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="85525057"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="85525057"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 08:20:42 -0700
X-CSE-ConnectionGUID: 1WXhknDRT2WWo2mJQrwcYA==
X-CSE-MsgGUID: Y2UWDO3JRUKKf0K8dw/+5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="241411412"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 08:20:40 -0700
Date: Mon, 8 Jun 2026 17:20:37 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: "Wajdeczko, Michal" <michal.wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Gupta, Saurabhg" <saurabhg.gupta@intel.com>,
 "Zuo, Alex" <alex.zuo@intel.com>
Subject: Re: [PATCH v3 5/5] drm/xe/i2c: Report i2c irq handler issue
Message-ID: <aibdxRlzmaT3E2TD@black.igk.intel.com>
References: <20260605210534.3843211-1-jonathan.cavitt@intel.com>
 <20260605210534.3843211-6-jonathan.cavitt@intel.com>
 <cf797d6c-facc-41ce-aef3-291f7ab881ea@intel.com>
 <SN6PR11MB27174A1CB0B3BB00FDAE460DE51C2@SN6PR11MB2717.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN6PR11MB27174A1CB0B3BB00FDAE460DE51C2@SN6PR11MB2717.namprd11.prod.outlook.com>
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

On Mon, Jun 08, 2026 at 08:04:29PM +0530, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Wajdeczko, Michal <michal.wajdeczko@intel.com> 
> > On 6/5/2026 11:05 PM, Jonathan Cavitt wrote:
> > > Error logging is expected but not included in xe_i2c_irq_handler() for
> > > generic_handle_irq_safe(), so add error logging there.
> > > 
> > > This issue was caught by static analysis.
> > 
> > hmm, what exactly was this tool complaining about?
> 
> It is complaining that xe_i2c_irq_handler() is the only place where
> the return value for generic_handle_irq_safe() is not checked.
> 
> > 
> > almost no other callers of the generic_handle_irq_safe() are printing any errors
> > (which are more about programming mistakes than runtime failures)
> > 
> > I'm asking, as if we believe that such errors are legit then maybe we shouldn't
> > 
> > 	"Deassert after I2C adapter clears the interrupt"
> 
> Is this not also the case for every other caller of
> generic_handle_irq_safe()?  If generic_handle_irq_safe() fails,
> and it fails for a legitimate reason, we really should be doing
> something about that other than just logging the error and
> moving on.  Since we don't, based on historical usage, I don't
> think whatever error generic_handle_irq_safe() can throw is
> a legitimate issue that requires intervention.
> 
> But you don't have to believe just me about it.  Raag Jadav
> also approves of this implementation where we don't do
> anything about the error other than just log it, and he's the
> one that wrote xe_i2c_irq_handler().

Possible generic_handle_irq_safe() error cases are

1. Missing irq descriptor
2. Called in process ctx when set to enforced irq ctx

Both of which are programming mistakes and unrelated to hardware.

Raag
