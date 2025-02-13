Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2D6C021A7
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 04:41:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 352AF10E39E;
	Thu, 13 Feb 2025 04:41:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HS/jN8ia";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE7D10E39E
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Feb 2025 04:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739421690; x=1770957690;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0I24u+xaLPKWIO8a4hUxIuwOIyYl1pkjuAE7l8xs2HY=;
 b=HS/jN8iaTg/JgureLYz4l9Shrf/aIjPsB4oNMn4PyzgJiN3z7C13Yo+8
 UqDa4dV7KbotvAqNoSBccB/MI5rpAAQh/tCM/cq6qehwRKr/jyZTxte1x
 nMwJQShEQ2b+gVo9M/R4jRVA8k0avqXGWwDhDc6bgvkVDudNnVdamUMx2
 T6VcPpqmHnqadvyspSb2NbPpYGXBOoLkmV36lCaqz1+7Cc/i9lKYPE7Wy
 yNQ/tDntMUpZ6/YxUWsJqwDd5bBg5bC8FLPH+BmYvoAEqBzoTgl5rm+O2
 6ymctt5oRlZjFY6J4G1QjfM7Mfnk0P5zS/vhO9oDH6naABxhw9G0q2FA7 Q==;
X-CSE-ConnectionGUID: 4Q4dlpEsTtqiaQyquOvOYg==
X-CSE-MsgGUID: oj4uHR0xQfeHyutqRQlPDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39294141"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="39294141"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 20:41:29 -0800
X-CSE-ConnectionGUID: DZXxvLyJR+CF7EWbZNXtfw==
X-CSE-MsgGUID: UjwpnnblTVCqagJEG9OTxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="113025408"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 20:41:28 -0800
Date: Thu, 13 Feb 2025 06:41:24 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 01/13] drm/xe: Add callback support for driver remove
Message-ID: <Z6139KcC9OJTbgni@black.fi.intel.com>
References: <20250212193600.475089-1-lucas.demarchi@intel.com>
 <20250212193600.475089-2-lucas.demarchi@intel.com>
 <Z60QWgI68CS8TflK@black.fi.intel.com>
 <qdimi2zm224r52wjzof7y7fgvmli5lq2nb7ho55qdru3jlawzr@chxmjs5vs63x>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <qdimi2zm224r52wjzof7y7fgvmli5lq2nb7ho55qdru3jlawzr@chxmjs5vs63x>
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

On Wed, Feb 12, 2025 at 03:28:15PM -0600, Lucas De Marchi wrote:
> On Wed, Feb 12, 2025 at 11:19:22PM +0200, Raag Jadav wrote:
> > On Wed, Feb 12, 2025 at 11:35:48AM -0800, Lucas De Marchi wrote:
> > > xe device probe uses devm cleanup in most places. However there are a
> > > few cases where this is not possible: when the driver interacts with
> > > component add/del. In that case, the resource group would be cleanup
> > > while the entire device resources are in the process of cleanup.  One
> > > example is the xe_gsc_proxy and display using that to interact with mei
> > > and audio.
> > > 
> > > Add a callback-based remove so the exception doesn't make the probe
> > > use multiple error handling styles.
> > > 
> > > v2: Change internal API to mimic the devm API. This will make it easier
> > >     to migrate in future when devm can be used.
> > 
> > Which means we'd like to go back to devm action someday, or is that even
> > possible? Assuming it is, and still worth it, why not try to do that
> > instead?
> 
> From the cover letter:
> 	I have other changes on top of these that will make devm compatible.
> 	That will need some drivers/base/ changes though, so it's probably good
> 	to do it in parallel.
> 
> From my reply to Rodrigo:
> 	The devm part is here:
> 	https://lore.kernel.org/dri-devel/20250212200542.515493-1-lucas.demarchi@intel.com/
> 
> 	In the end I could simplify it much more than I thought and what is
> 	required on devres side is just one patch, 2 lines diff. Hopefully I
> 	didn't simplify it too much. Let's see. If that one is accepted through
> 	intel-xe tree, then we may even drop this first patch and go straight
> 	with that solution.
> 
> 	...
> 
> 	I will wait some feedback on that other series to see how we are going
> 	to proceed. If we keep this patch, then I will update this doc.
> 
> I hope this clarifies,

Yep, just trying to weigh in.

Side note: There's a devres.h split in progress[1]. In case you'll be touching
these in future versions, please let me know. We'll do it in a cleaner way that
doesn't conflict.

[1] https://lore.kernel.org/r/20250212062513.2254767-1-raag.jadav@intel.com/

Raag
