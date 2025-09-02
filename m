Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15816CA1005
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 06:04:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C685110E58F;
	Tue,  2 Sep 2025 06:04:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iMAUwwqo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F97110E58F
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 06:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756793074; x=1788329074;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JsqEzsTuG/TqqZqrvY6Cdhm8NlLHOM101FM4w+C2e1w=;
 b=iMAUwwqoN0nkOrUSdCb/tx9h1ZKZ6iPtlmAu8lOb3gfmnyXYQZfhpQRf
 +Y7m0sqfy8o1YOWIFah4agrdjRLBIEDYTZ/QasWw7KWFXjZvtrky9bRO/
 LrVV9URH1DBwE6oBdHS/UcA9rYu5S4oeZjvdzcMxGt7bEIjVNIFxq39GX
 1YA+gpcqUZkKiWqzdMg+TDt06NR+6GGspH2NHXHEkoiXd6VfgjAWfDVsx
 VmR+snoUd7rbejgOw+6H90SabQ7bTUGitmZXB9zpH9RPr0GrDEkhXK8MX
 YwAQbVPIAR867VKk8AsNmo9tshZMGb0AK15Q1UpFo4Y/uF8F/0hgfAi+D Q==;
X-CSE-ConnectionGUID: KfFBq3BFRcK4+3rI18f7Sw==
X-CSE-MsgGUID: NqRt8s1ySMiSLHyZezlBKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="81633172"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="81633172"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 23:04:34 -0700
X-CSE-ConnectionGUID: hW4Jg0hfRjmm8GLZZWQE1A==
X-CSE-MsgGUID: oEpZcyLDQE6MVi7n3MWLJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="171146479"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 23:04:31 -0700
Date: Tue, 2 Sep 2025 08:04:28 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH v2 4/6] drm/xe/configfs: Fix documentation warning
Message-ID: <aLaI7NPp9Wurafve@black.igk.intel.com>
References: <20250827-wa-bb-cmds-v2-0-3cdf4d63c72a@intel.com>
 <20250827-wa-bb-cmds-v2-4-3cdf4d63c72a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-wa-bb-cmds-v2-4-3cdf4d63c72a@intel.com>
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

On Wed, Aug 27, 2025 at 03:35:29PM -0700, Lucas De Marchi wrote:
> Fix this warning while building the documentation:
> 
> 	Documentation/gpu/xe/xe_configfs:9: drivers/gpu/drm/xe/xe_configfs.c:138:
> 	WARNING: Definition list ends without a blank line; unexpected unindent.
> 
> That also makes it format it better in the output.

I found the heading adornments for "Overview" to be a bit off, which we also
might want to adjust for consistency.

> Fixes: e2b33fce5eb0 ("drm/xe/configfs: Improve documentation steps")
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
