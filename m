Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 324F8E77186
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 04:26:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3BC010E18F;
	Thu, 12 Dec 2024 04:26:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DR/bxikJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6603B10E18F
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 04:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733977581; x=1765513581;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Uam8kfjQVYWPDK66eZPpQ8EjYrvk3Vth/FfUY3Ws1EM=;
 b=DR/bxikJRMQVGNedpHfj3Oa5gqs2JOI+MVfMUn8MCfFokYeOwndSs2a2
 Vsa3hd57Lv9r1vUWL5S7HhInrvGVkXQLAjRSuaBkT0JDHIMMhZsdcripf
 ap6d1PCkNjcOhhH6R5BLmeWMbCcvea9Gk/8dXrnGaZS/5JyeOK8W/ymAC
 xin9XoynuCbbCa8G7836mdrL2R0JelB/K+VGF3nmOH6i04a1P+O/h78qm
 cYE3dLyZ+PY8rEzI8TxZ+W/MKxOq4hpQa3Va6RJb0cB0HHI+89odibOwg
 cNvyDIZIxHCVpZv80CDhhnYDVDnkS3la+H7bc6uGsRVjASH5bstTL2bC1 Q==;
X-CSE-ConnectionGUID: wfuBoaq0TqWjLyH5BgCncg==
X-CSE-MsgGUID: m/z7NHcVTY+JtS6uRVa23w==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34253663"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="34253663"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 20:26:21 -0800
X-CSE-ConnectionGUID: k4hOTsu6S6KT10NvDqGlGw==
X-CSE-MsgGUID: 2vneJqsQTxuhsu/dlQep9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="101177461"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.80])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 20:26:20 -0800
Date: Wed, 11 Dec 2024 22:26:15 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe: Fix fault on fd close when wedged
Message-ID: <ffgubo3r4kue5fmlbb6grii3t3rfafnpk5av4ieht7em7du7xw@svwhtkn3exfq>
References: <20241211225332.1136152-1-lucas.demarchi@intel.com>
 <Z1pd3co1pwBPvExA@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Z1pd3co1pwBPvExA@lstrano-desk.jf.intel.com>
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

On Wed, Dec 11, 2024 at 07:51:57PM -0800, Matthew Brost wrote:
>On Wed, Dec 11, 2024 at 02:53:32PM -0800, Lucas De Marchi wrote:
>> If device is wedged, the final run ticks update for the client should be
>> skipped as it's already unmapped. Fix this pagefault when forcing a
>
>Where does exec queue get unmapped on wedging a device?

it's the lrc we are trying to read: lrc->bo, with offset == timestamp.

I thought it was part of the the xe_gt_declare_wedged(), but I'm not
following what triggers it - the only thing that should trigger that
would be the xe_lrc_put() and the refcount reaching 0. Something is not
adding up here, I will have to trace the destroy to see what's going on.

Lucas De Marchi
