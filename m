Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE8E606A320
	for <intel-xe@archiver.kernel.org>; Sat, 21 Nov 2026 11:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mWbkfuNN
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2AE410E0FF;
	Sat, 21 Nov 2026 11:32:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FB2710E0FF
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 11:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795260767; x=1826796767;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vNBF/pKtI+eHOQLcENjDr1JU9S2pq7mrEmagdVQzT/I=;
 b=mWbkfuNNT1aMuP8XzObnGFuxkKo1mDXMF5mDAsDG69RTvwGiWqZcpA62
 qHC5Thz3/XhncPizbctig12JSLKpSCDXDbt/PgwXZrGEVxEm5FkzgrCjp
 XEgeUz0DttmPTfN0FU5PkA1sG02JcMGSd6lE/XSHMmqCyeiHZt7N7zK3V
 rHhNjzrDLC+NBP4elBWWsvzWSflTV5Y7cI5OGkCEzX8USThAR+bmq08PM
 QbAf+vGJaREQxMw8aiNRdoML/4f1YB7M75pxrCTmmm+3VpVAuDkjyW03U
 iFS0JGqrNDmQeVp+9fU8+4CTy2bKG38qs6UESQBgw7is4nnuMTRJO25pj g==;
X-CSE-ConnectionGUID: 6UJJdaOaRkeJJwXPWZSfOQ==
X-CSE-MsgGUID: 643ez2wBQ6uIXoQ9gOZZqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4212549"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4212549"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2026 03:32:47 -0800
X-CSE-ConnectionGUID: K2kv+NYKS0qYRFR3VIk/eA==
X-CSE-MsgGUID: /9alfhKHRK2pT3EPR7mG3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; d="scan'208";a="10893521"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2026 03:32:44 -0800
Date: Sat, 21 Nov 2026 12:32:41 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com, matthew.d.roper@intel.com
Subject: Re: [PATCH v9 3/3] drm/xe/cper: Prepare Intel CPER info records
Message-ID: <awGBWR8FyhxaxSTd@black.igk.intel.com>
References: <20261121064545.168470-5-badal.nilawar@intel.com>
 <20261121064545.168470-8-badal.nilawar@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261121064545.168470-8-badal.nilawar@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 21, 2026 at 12:15:49PM +0530, Badal Nilawar wrote:
> The RAS info queue contains error logs for detail counters, or dynamic
> counter headers followed by error logs for aggregate counters.
> 
> Build CPER info records from the queue data, converting each error log
> into an CPER event. For aggregate counters, group logs by their dynamic
> counter header and build one info record per header.
> 
> Emit a CPER record for each generated info record.
> 
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
