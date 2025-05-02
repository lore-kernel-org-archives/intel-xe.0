Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2302EC3ABAC
	for <intel-xe@archiver.kernel.org>; Fri,  2 May 2025 17:27:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD53910E0E8;
	Fri,  2 May 2025 17:27:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M2WsPRkf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4531810E0E8
 for <intel-xe@lists.freedesktop.org>; Fri,  2 May 2025 17:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746206829; x=1777742829;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=W6QpKwTUbmImktx4onmBTNMyIoUlWiEqmnx3/WhqYLY=;
 b=M2WsPRkfHU19ELZLip11ueJaYwLZHCjRmrIjMu+DInMONJyhBmoPS4kD
 YwlHzVvz+lh0OkZITb7Jkq/YMeEBdpOtobJQrnB9hpay1eFoCSqXG6GLD
 2cfQJ0KybDE0y+id5LFlrhnEMJzBWJ1TaC+vXliXzJG2O7MKGwWk1yn3E
 1DcQ295xxuqSp6LP2KXU56+8gCBTmLJYCJWaMa+8uwvbeMka3x0kcr9fe
 kXHJQcgum9+MHLXl2tWvBNR1bmUY4WK0/NrcKyBCKSzhSYSqmTw+LABwn
 odM6bHHIpNhrEOhViBVidBQqpyBX90bZDXOpX1xkT+yZAqq5M5Kxki0pU A==;
X-CSE-ConnectionGUID: /XReISNuS8mYKQnVH+c3Ug==
X-CSE-MsgGUID: QjjaEpafQJyl3+R0QnXuMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="50550783"
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; d="scan'208";a="50550783"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 10:27:08 -0700
X-CSE-ConnectionGUID: S4vt43amTDqknGjUqOYcLw==
X-CSE-MsgGUID: RrQNFqcKTc6cKaXhfwZY4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; d="scan'208";a="134587222"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 10:27:07 -0700
Date: Fri, 2 May 2025 20:27:02 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nilawar, Badal" <badal.nilawar@intel.com>,
 "Tauro, Riana" <riana.tauro@intel.com>,
 "Gupta, Anshuman" <anshuman.gupta@intel.com>
Subject: Re: [PATCH v4 0/3] BMG PCIe Gen5 downgrade attributes and usage
Message-ID: <aBUAZmM8XIRCVun3@black.fi.intel.com>
References: <20250425140626.3082588-1-raag.jadav@intel.com>
 <aA9UlvQfo5-6-CtB@black.fi.intel.com> <aA_ebBh6mxsEJi1w@intel.com>
 <aA_gYVCQe1JEY_xB@intel.com> <aBBl4ukmZJ0b72dN@black.fi.intel.com>
 <8b0ca59b5c5ed0cf5fb3efb844afa84fe3c39570.camel@intel.com>
 <aBLaJAEj5tKG_Asp@black.fi.intel.com>
 <sh6cpgadw6gk2jufhaoqpmz3mteegl2gnfpqxg7zgwmbm6vu76@kksxyzna74yc>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sh6cpgadw6gk2jufhaoqpmz3mteegl2gnfpqxg7zgwmbm6vu76@kksxyzna74yc>
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

On Fri, May 02, 2025 at 11:16:02AM -0500, Lucas De Marchi wrote:
> On Thu, May 01, 2025 at 05:19:16AM +0300, Raag Jadav wrote:
> > On Thu, May 01, 2025 at 01:10:49AM +0530, Vivi, Rodrigo wrote:
> > > On Tue, 2025-04-29 at 08:38 +0300, Raag Jadav wrote:
> > > > On Mon, Apr 28, 2025 at 04:09:05PM -0400, Rodrigo Vivi wrote:
> > > > > On Mon, Apr 28, 2025 at 04:00:44PM -0400, Rodrigo Vivi wrote:
> > > > > > On Mon, Apr 28, 2025 at 01:12:38PM +0300, Raag Jadav wrote:
> > > > > > > On Fri, Apr 25, 2025 at 07:36:23PM +0530, Raag Jadav wrote:
> > > > > > > > This series exposes sysfs attributes for BMG PCIe Gen5
> > > > > > > > downgrade and
> > > > > > > > documents their usage.
> > > > > > >
> > > > > > > Anything I can do to move this forward?
> > > > > >
> > > > > > I almost push it here, but then I noticed that it is
> > > > > > gen5_downgrade.
> > > > > > Hadn't we agreed to follow what spec says so?
> > > > > >
> > > > > > "to then automatically persist the Gen4 downgrade flag in Flash"
> > > > > > "Write Gen4 Downgrade bit to MRC Flash File"
> > > > > >
> > > > > > == Applying  PCIe Gen4 Downgrade ==
> > > > > >
> > > > > > Although I see that there are some mentions calling "Gen5
> > > > > > downgrade", "Gen4 downgrade" seems to be the most used term in
> > > > > > the specs, specially when calling bits and
> > > > > > sections names...
> > > >
> > > > Which is what I followed until we had a change of preference over gen
> > > > definition.
> > > > https://lore.kernel.org/intel-xe/34b33d3135fc24302db2764ce86a641e7c49054f.camel@intel.com/
> > > >
> > > > > Because of the inconsistencies and our back and forth here and to
> > > > > get prepared
> > > > > for future cases where we might need to downgrade from gen6 to
> > > > > gen5, the current
> > > > > Architecture recommendation is to simply go with
> > > > >
> > > > > so /sys/bus/pci/devices/<bdf>/pcie_gen_downgrade_{status,capable}
> > > >
> > > > I really like Lucas' proposal, which is also consistent with similar
> > > > existing
> > > > attributes.
> > > >
> > > > /sys/bus/pci/devices/<bdf>/auto_link_downgrade_capable
> > > 
> > > I'm sorry for the delay in the response, it took a while to get
> > > confirmation. We can go with this one. or with the one you sent
> > > already. Your call. Just let me know that I push the version you tell
> > > and tell the architects to update the spec.
> > 
> > I'm okay with either one. But since it was Lucas' idea, let's hear his
> > thoughts.
> > 
> > Lucas, can we move forward with auto_link_downgrade_capable?
> 
> yes, I'm ok with that.

We also have ack from the architecture. Thank you for the suggestion.
I'll add you to the credits :)

Raag
