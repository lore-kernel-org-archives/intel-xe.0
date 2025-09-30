Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0DC1CCA471
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 09:42:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97FC810E53E;
	Tue, 30 Sep 2025 09:42:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CdISotbM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7655D10E53E
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 09:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759225359; x=1790761359;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/Jnz1LMNcMt8ZLuymksw9zmHIZK5o2mliJMcN0I4OWg=;
 b=CdISotbMQUO1bY8fPKPaqXZcWdgcogoBbF+vbScCDwZ/ndjShZiSQyI3
 Ae5ShPTeujdINYf4NsfbfcwDth4sXem+dZo5OOINk2oeawu+4xbtfxH69
 IJDhOYZmnKDwZ+ouHbKOi8gJpM7fC2tYohd6UOnZ/bonqAXtz+voH9wfN
 /0dVH+FZeYra6jZxoRGv1KJIoKYp9dM/BbVEnES/ZWPIwXK0hpbOUlmJw
 5Jp+zFUp0kXoqpQlrOnBrH36kLn3ZJ66SChK09wnsL+mGzZ5/aJ6VuzWq
 aB3DWfD0bIzQLg18sOs/lHUi/E6n3bdNCwQJzhL+RA9T2TMoZhG97gfMh A==;
X-CSE-ConnectionGUID: TXNSS1w8T0q/fj8JT4eR9g==
X-CSE-MsgGUID: VRxQ9IOMSL+JNxTpe3faIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61521680"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61521680"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 02:42:39 -0700
X-CSE-ConnectionGUID: cJVpcF1YSPKwOh05o1CkPQ==
X-CSE-MsgGUID: i+ZMZi35S5WNzONLJhqu9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="179248466"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 02:42:36 -0700
Date: Tue, 30 Sep 2025 11:42:33 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, michal.wajdeczko@intel.com
Subject: Re: [PATCH v1 0/2] Drop redundant runtime PM usage
Message-ID: <aNumCRuzgmb7jvqG@black.igk.intel.com>
References: <20250918114804.2957177-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918114804.2957177-1-raag.jadav@intel.com>
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

On Thu, Sep 18, 2025 at 05:18:02PM +0530, Raag Jadav wrote:
> This series attempts to cleanup runtime PM usage in a few places
> where applicable. Feel free to join in and help find other similar
> cases.

Ping.

Raag
