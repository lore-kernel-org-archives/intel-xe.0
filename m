Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441F4D42B9B
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 15:28:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EECBF10E604;
	Tue, 12 Nov 2024 15:27:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ItuhddMm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D972910E604
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 15:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731425278; x=1762961278;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kix+tDXd/OHa3nrcLUpos2J4yobEUJHVLRoofvoqD+4=;
 b=ItuhddMmS/PbaMRbR7Hkb7mEpacn4Ympj41A1UZA+0OB8nn+HC07uKuk
 vZbQ/5Jyp+HwKU+JTe7DfNQ+yjPjHDrvUJPPd9kjN6QUp7N8Zqe8F+X5Z
 TB6ZenpYn5+JbzNH7RTDgzNWJ2bXrewMoABflJy1RAFFEO69yaaum9Ky7
 P4dhaCK2CONwhRPunBoeG5XBoUDINhMrRoQ8mb/9HeT0hNyArT5oMyjbo
 VnQLIlmRKb0qsRsj4yge6gqNj/3mkFF7ZmAML5SwhQ+dufXLVDonakNes
 WaeBSLihGss84dQP4GrxbEaJqMVuBCaLyGlY9aTKnlWuAyz2NuZiv/4u3 w==;
X-CSE-ConnectionGUID: /R11AfZaT/u5xFrOFk5Rag==
X-CSE-MsgGUID: CHySNyk0QOKCVPZWHuBukg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31227978"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31227978"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 07:27:58 -0800
X-CSE-ConnectionGUID: YiOyrTEVTJeVJ7mZQ64pYg==
X-CSE-MsgGUID: X0pDeDitQs61A1hjAIETeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="87931761"
Received: from smile.fi.intel.com ([10.237.72.154])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 07:27:56 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tAso5-0000000E2ey-3ZM1; Tue, 12 Nov 2024 17:27:53 +0200
Date: Tue, 12 Nov 2024 17:27:53 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "david.e.box@linux.intel.com" <david.e.box@linux.intel.com>,
 "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: Re: [PATCH 1/2] platform/x86/intel/pmt: allow user offset for PMT
 callbacks
Message-ID: <ZzNz-ckhzRSCezRD@smile.fi.intel.com>
References: <20241108201955.2048085-1-michael.j.ruhl@intel.com>
 <ZzHBhsJ_J3ARhLu9@smile.fi.intel.com>
 <IA1PR11MB64184E52DA33ABC36329A2FDC1592@IA1PR11MB6418.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA1PR11MB64184E52DA33ABC36329A2FDC1592@IA1PR11MB6418.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Tue, Nov 12, 2024 at 02:38:06PM +0000, Ruhl, Michael J wrote:
> > -----Original Message-----
> > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Sent: Monday, November 11, 2024 3:34 AM
> > To: Ruhl, Michael J <michael.j.ruhl@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; platform-driver-x86@vger.kernel.org;
> > david.e.box@linux.intel.com; ilpo.jarvinen@linux.intel.com;
> > hdegoede@redhat.com; Vivi, Rodrigo <rodrigo.vivi@intel.com>; De Marchi,
> > Lucas <lucas.demarchi@intel.com>
> > Subject: Re: [PATCH 1/2] platform/x86/intel/pmt: allow user offset for PMT
> > callbacks
> > 
> > On Fri, Nov 08, 2024 at 03:19:53PM -0500, Michael J. Ruhl wrote:
> > > Usage of the telem sysfs file allows for partial reads at an offset.
> > >
> > > The current callback method returns the buffer starting from offset 0
> > > only.
> > >
> > > Include the requested offset in the callback.
> > > Update the necsessary address calculations with the offset.
> > 
> > ...
> > 
> > > -	memcpy_fromio(buf, addr, count);
> > > +	memcpy_fromio(buf, addr + off, count);
> 
> Hi Andy,
> 
> > This will give an unaligned IO access in some cases. Is it a problem?
> 
> That is a good question.
> 
> I moved this value from the caller to this location.
> 
> So essentially it is "unchanged" from the current usage.  Does that answer
> the question?

Probably. Please, mention this in the commit message.

-- 
With Best Regards,
Andy Shevchenko


