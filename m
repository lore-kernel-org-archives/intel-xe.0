Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59782C0219D
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 22:32:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 249BA10E105;
	Fri,  7 Feb 2025 22:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AgelZ9rM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF9C10E0DB
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Feb 2025 22:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738967519; x=1770503519;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RIoW8/9f3AIUcnUYSyv2WN6E4rCOmqQZ6jqeQUQ5t4w=;
 b=AgelZ9rMMHPvQVwKQgxqT/VIKRciD1mMMHB6asMU30MfdrjvDf/ofcoM
 0vMIgW0ytDn4oQqxz50+N/FWvmGnflaAdqt8ec6h1uNdebsjJJDOjfVXg
 potyLHROZ9jhgGWS/OsZ2YcQuPpa3ev7VBoH1JyTnTMA002922C2rN+PO
 EXpplMKEBLAHzESOjmdf9xJj9FyAot2JRHKWWVBUYTFnGNre15DkeMj6P
 4b70pywKJxRiwrRvmuRci5V1XNnqcHUPmIrMaG1IjW9+tjEatiESvAmY3
 uMvL7Q1zocZAqo5f/r0MimeEKum/OVPDLDbSgusJQJY9J6FefJaZ0sGFj g==;
X-CSE-ConnectionGUID: 0S3JWTVBSvePJiJE6nn/xg==
X-CSE-MsgGUID: eH0i8gbhT3SFMKU850BTsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="64977874"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="64977874"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 14:31:58 -0800
X-CSE-ConnectionGUID: XClxQ+oBTMClMLJQ8ILchA==
X-CSE-MsgGUID: dpn9nXt6S7Kb2axylRmvcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112077037"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 14:31:56 -0800
Date: Sat, 8 Feb 2025 00:31:53 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: Re: [PATCH v3 13/13] drm/xe/hwmon: Stop ignoring errors on probe
Message-ID: <Z6aJ2Q6JXPWultSA@black.fi.intel.com>
References: <20250207221945.2878241-1-lucas.demarchi@intel.com>
 <20250207221945.2878241-14-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207221945.2878241-14-lucas.demarchi@intel.com>
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

On Fri, Feb 07, 2025 at 02:19:45PM -0800, Lucas De Marchi wrote:
> Not registering hwmon because it's not available (SRIOV_VF and DGFX) is
> different from failing the initialization. Handle the errors
> appropriately.

Nice, I had planned this as part of my fan/temperature series. But since
we already have it here,

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
