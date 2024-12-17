Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8369BE77184
	for <intel-xe@archiver.kernel.org>; Tue, 17 Dec 2024 22:20:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E90B10E180;
	Tue, 17 Dec 2024 22:20:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MCHMv+K/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E2FD10E180
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Dec 2024 22:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734474057; x=1766010057;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HjhiYDO7BG8qwuasUD+ehsdQZuRHaqfZOonXpTtBPvU=;
 b=MCHMv+K/dpxsLSWR1/5+t+q3/+H3JNjNVqJF2hTtDHD56fNWjW3pKYyi
 2lz/drjMJdczWFUkZmsS0szLGFmTtcB61vwrq7kwwepbMCPI6o3MKppw6
 uRuOViJOIfeND5pEGDA7prto0tw29xjdemLutTHxs7Qm9vu9kuXtwopXC
 GE3XVD9JNWBWCKSiw8XOSNks1szTotEbw8oCO9zuLYCNgTJKZ6Aw/I+72
 PGZzlpg2EIe2puf0CjpWwYrAySxWR/xi3Q6HzaJwCkIXLRf4mNO/DHx+H
 O+8fH3K8VlVxhMKg8xnHFhwkrZ38XLFGaTzXMgxmZfSdxa3DFP7UQVu/U A==;
X-CSE-ConnectionGUID: FObVbdp8S2SnKCXX/eZ5aw==
X-CSE-MsgGUID: DmT/XHt9SJeFgm3IPV1fQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="37759987"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="37759987"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 14:20:56 -0800
X-CSE-ConnectionGUID: 9/o9epp6QPCRrKZOWryPzA==
X-CSE-MsgGUID: r2Nb8RApSlWEo74cywws4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="102669358"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.111.153])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 14:20:57 -0800
Date: Tue, 17 Dec 2024 16:20:51 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe: Fix fault on fd close when wedged
Message-ID: <ynhh4xborbdqo34iu2wrbop2tlekbjvbmewa4kzwclwtp2h7to@xpctmz7gkgxz>
References: <20241211225332.1136152-1-lucas.demarchi@intel.com>
 <Z1pd3co1pwBPvExA@lstrano-desk.jf.intel.com>
 <ffgubo3r4kue5fmlbb6grii3t3rfafnpk5av4ieht7em7du7xw@svwhtkn3exfq>
 <Z1sPi9G00q6advpY@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Z1sPi9G00q6advpY@lstrano-desk.jf.intel.com>
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

On Thu, Dec 12, 2024 at 08:30:03AM -0800, Matthew Brost wrote:
>On Wed, Dec 11, 2024 at 10:26:15PM -0600, Lucas De Marchi wrote:
>> On Wed, Dec 11, 2024 at 07:51:57PM -0800, Matthew Brost wrote:
>> > On Wed, Dec 11, 2024 at 02:53:32PM -0800, Lucas De Marchi wrote:
>> > > If device is wedged, the final run ticks update for the client should be
>> > > skipped as it's already unmapped. Fix this pagefault when forcing a
>> >
>> > Where does exec queue get unmapped on wedging a device?
>>
>> it's the lrc we are trying to read: lrc->bo, with offset == timestamp.
>>
>> I thought it was part of the the xe_gt_declare_wedged(), but I'm not
>> following what triggers it - the only thing that should trigger that
>> would be the xe_lrc_put() and the refcount reaching 0. Something is not
>> adding up here, I will have to trace the destroy to see what's going on.
>>
>
>Quick reached the same conclusion - accessing the LRC BO should be safe
>until the final put, hence my question. It does appear something else
>weird is going on here.

finally had some time to analyze this again. So the issue is actually a
between unbind and close, because the test in question here does:

	fd = drm_open_driver(DRIVER_XE);
	...
	fd = xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_REBIND);
	drm_close_driver(fd);

note that the application is "leaking" the first fd when it opens the device
again. When the fd is closed on termination, the device already went
through unbind (i.e. xe_pci_remove()).


I will send a new patch to fix that.

Lucas De Marchi

>
>Matt
>
>> Lucas De Marchi
