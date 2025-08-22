Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1F6CA0EEB
	for <intel-xe@archiver.kernel.org>; Fri, 22 Aug 2025 07:40:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B4B10EA93;
	Fri, 22 Aug 2025 07:40:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BEngyQz0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69BA110EA83
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Aug 2025 07:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755848435; x=1787384435;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=5e5qbZDzGCbIEoJr5Tx6hnnMSxbxu0cHXuANHXdNSKo=;
 b=BEngyQz0DCWkCXoaXsUjZ38AHq1f0OJBxGnBtE+PqKNUna4+M21jPb4T
 OOZJi4+lDV5BiqUDnU438EuRtoUJGHuW5wSTFctw1d4wRlAMB6llD7GE3
 ZOHs/53Tv6ZpjR6MaGeR7MutXyz2BoFIV/IdjULu1lUzb0zVKZBHL3jw3
 koHWoZHTRu+F3NUdEFkLgrnwBujLIKcHBWxMV65xLZPYf0D82s+eparHM
 lY1gHtowJuhtasQKH00GhHJsY1z8cfnWhsrl1lp4egd8Mg/35HkyU9Hpy
 qAHQicHrrsv31d+1gGHP1fl63d+3XUx4Xu20uIqPH8wgHFXv4eKFfa8uA Q==;
X-CSE-ConnectionGUID: 8SA6T0KNR3e0VH3rPdPBwA==
X-CSE-MsgGUID: 5mStrQ4sS3GBBfb/JbBaZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="68754236"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="68754236"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 00:40:35 -0700
X-CSE-ConnectionGUID: X5cJq11XSZCPjAAs/rhp7g==
X-CSE-MsgGUID: dC9lGK4DRn+kqeBGfJDMfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="199601219"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.244.108])
 ([10.245.244.108])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 00:40:33 -0700
Message-ID: <c5972562babb20204cfd5ddcd598a8902b5180c0.camel@linux.intel.com>
Subject: Re: [PATCH 04/15] drm/xe: Pass down drm_exec context to validation
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Joonas Lahtinen	
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Date: Fri, 22 Aug 2025 09:40:28 +0200
In-Reply-To: <aJzAhDRi9W+iKl0b@lstrano-desk.jf.intel.com>
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
 <20250813105121.5945-5-thomas.hellstrom@linux.intel.com>
 <aJzAhDRi9W+iKl0b@lstrano-desk.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
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

On Wed, 2025-08-13 at 09:42 -0700, Matthew Brost wrote:
> > =C2=A0=20
> > +	/**
> > +	 * @validation: Validation data only valid with the vm
> > resv held.
> > +	 * Note: This is really task state of the task holding the
> > vm resv,
> > +	 * and moving forward we should
> > +	 * come up with a better way of passing this down the
> > call-
> > +	 * chain.
>=20
> I've already mentioned this, attaching the _exec xe_vma_ops might be
> good option as xe_vma_ops has lifetime of only existing for the bind
> (i.e., it is stack variable) so you'd only need to set it (i.e., no
> clear required).

That is true, although since this is really task state the correct
thing would be to pass this as a parameter to the functions involved,
but when I tried to implement that, it got quite complicated.

So figuring saving this for a future cleanup might make sense. I'll do
that for v2 anyway, and we can discuss it further.

Thanks,
Thomas


>=20
> I think patch largely makes sense.
>=20
> Matt=20
>=20
> > +

