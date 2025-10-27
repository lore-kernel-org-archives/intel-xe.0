Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D09FCCF9EA
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 11:38:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B41B10E041;
	Mon, 27 Oct 2025 11:38:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n8bB/XsE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 921E110E041
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 11:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761565090; x=1793101090;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lpMQ5DbmzYXe0kwJDZ1k0ggu8HwA/nSz8ig4bDg46yo=;
 b=n8bB/XsEGp45l56GmieQcQUiWSPNUjr66Sv9RbAEmnnnvurH+5AfmkUo
 XvF2JeUK7yu4ivOSIJ7haOi0ohGbervVbekVxlgRcPqsBJCmOYeAqz98i
 llIht195W2gtg1W3LRB7ZpxZvGrb6lz9LOahchj2Ze35+5bbIqgpkWJXQ
 VV6xzHbp4p5N6PMFRWg/F8SAkMd24wJw5667QhvFnlkj3+kTjHXVAx9jn
 Z9zj1YgkFq6hhRJsd1ziSfH4CS0GHKIbUyOeOFP5jPtzb06gVqylSZXB7
 RYtdY8g1VzbCyHvMANRz2tiYYymiICIKv6TdkyLXJJyN1ceipixOtYR+I A==;
X-CSE-ConnectionGUID: wYUAiCECT4ikPljWyuD1xQ==
X-CSE-MsgGUID: kUtsDNHTSwWmpkWXhajx9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74984056"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="74984056"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 04:38:10 -0700
X-CSE-ConnectionGUID: TN5SY1epS3e6cWswk3QyPA==
X-CSE-MsgGUID: 50p4/JMVSqKaKPmkfiFEig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="190153313"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 04:38:09 -0700
Date: Mon, 27 Oct 2025 12:38:06 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Sk Anirban <sk.anirban@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 0/8] drm/xe: CRI support in gt_throttle + refactors
Message-ID: <aP9ZnnaKEVEIwXDa@black.igk.intel.com>
References: <20251026-gt-throttle-cri-v2-0-41f8288a71a7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026-gt-throttle-cri-v2-0-41f8288a71a7@intel.com>
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

On Sun, Oct 26, 2025 at 10:57:12PM -0700, Lucas De Marchi wrote:

...

> Finally last patch tries to resolve the TOCTOU issue previously

> discussed in a reasonable way.

:D
