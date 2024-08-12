Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF36BC3DA7F
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 19:54:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F6C10E29D;
	Mon, 12 Aug 2024 19:54:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cQppOmSn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE71610E29D
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Aug 2024 19:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723492478; x=1755028478;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=D4N0agza6Kl0ctzzhMlHaWB4eh5HyMr9tlbbnyPG9lw=;
 b=cQppOmSnsHW5Upsc7URWrxj7i/GgIBM5SJtKGSU4Zap4FqS0YLYG35Cm
 Tk5kCaJJ23m19WBIi0vjpOXo4gy6z1H+pMZKUGcr1N/XKbbIQzYYsl4pN
 IMwUHMs6SsY0v6Bhxi0CIPb3wVT41QPt5Wrnf/jvr67WvfRhNlnQe1lqs
 NZXYiKmRkdzg2C4/WEnK13r5CzUjPnOsC0IYbvkotJtJOYIQSyW/6ebq2
 ZZ7ECMVKSL88A/TDpkCxEK7wzGNkmmA17OqFHasc5L6lwHlQrkgeQDn8m
 ZAilmLJwzgZnqR5yeVnQi4QIamZFdssmSyFvEJyVVIQsZmq5lu3JqsnGD A==;
X-CSE-ConnectionGUID: d4Ng4vR/QEWnOIzBvJNGvQ==
X-CSE-MsgGUID: /DaZfPxnSW+5NMhpAu0aJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21789607"
X-IronPort-AV: E=Sophos;i="6.09,284,1716274800"; d="scan'208";a="21789607"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 12:54:38 -0700
X-CSE-ConnectionGUID: 4mtHzLsMRIe4dsWIR9XdpA==
X-CSE-MsgGUID: FghGxafqRC+vdi6lzZyBWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,284,1716274800"; d="scan'208";a="59080586"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 12:54:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sdb7g-0000000ETo5-1AsZ; Mon, 12 Aug 2024 22:54:32 +0300
Date: Mon, 12 Aug 2024 22:54:32 +0300
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "david.e.box@linux.intel.com" <david.e.box@linux.intel.com>,
 "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v10] drm/xe/vsec: Support BMG devices
Message-ID: <ZrpoeG2jMR3w37ps@smile.fi.intel.com>
References: <20240812180836.227727-1-michael.j.ruhl@intel.com>
 <IA1PR11MB64186207DB7E251BF2C688A4C1852@IA1PR11MB6418.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA1PR11MB64186207DB7E251BF2C688A4C1852@IA1PR11MB6418.namprd11.prod.outlook.com>
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

On Mon, Aug 12, 2024 at 06:14:31PM +0000, Ruhl, Michael J wrote:
> Hmm,
> 
> This is what the commit message looked like when I sent it:
> 
> The Battlemage (BMG) discrete graphics card supports
> the Platform, > Monitoring Technology (PMT) feature
> directly on the primary PCI device.
> 
> Utilize the PMT callback API to add support for the BMG
> devices.
> 
> Not sure why it ended up here without the <cr>s?

Most likely MS Office happened in between and mangled the message.

-- 
With Best Regards,
Andy Shevchenko


