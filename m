Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE464CF9C6F
	for <intel-xe@archiver.kernel.org>; Mon, 23 Sep 2024 09:37:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA58F10E18A;
	Mon, 23 Sep 2024 09:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kvFYUdja";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2302A10E18A
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Sep 2024 09:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727084274; x=1758620274;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=DXUqLBEUCmWfx+vHbaMdTNZBVkkd+fPIW7Ewu9gl/0k=;
 b=kvFYUdjasNiLrnJjpUDud3J6JVJLZCEv9awCqtUihLEL6yy+eMjKzf+y
 0IVahMdgwbTytChKQlT2skNaJsRxxHuajL4AwYt1Mjuixtzn0UMH5ghZ8
 dmj5NxbhWIlLs75rebXec9QGMcLhdWlZ9z8ZE+9a2clG/S/W3Jg4DfKrO
 bO+Y0LeEnm8LO6M8q7Yp2PoQJEIEvyPma0Z/YrxArVBJMD5PXJMkl6s3J
 J5OkH0Ow3YP+mkHnL/52IRjlR2ibxuSfwWX+CPWPIP3sBmVRfSwaq2BtG
 l6ZyPlhZB2o5XcU+8gH1DvRklJk4vMFrrWk69ds3MmL4806C4TK8Daix1 w==;
X-CSE-ConnectionGUID: IHktgCsNTmKixW7T8s7YlQ==
X-CSE-MsgGUID: rBTmWBJnRx+523Z7wXmdsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25540345"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="25540345"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 02:37:43 -0700
X-CSE-ConnectionGUID: m7E54/aRTrmgAqHgl5sKdg==
X-CSE-MsgGUID: 1LQwfGb8RAm+Ry54ZUqyjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="101750115"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.65])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 02:37:41 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, intel-xe@lists.freedesktop.org,
 daniele.ceraolospurio@intel.com, thomas.hellstrom@linux.intel.com
Subject: Re: [PATCH 2/3] drm/xe/pciids: Add PVC's PCI device ID macros
In-Reply-To: <hcefkofngnohwn3qukf7xo5juwbyvakfx7hlzlkh76ciy5pxly@gt3pidublp2g>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1725624296.git.jani.nikula@intel.com>
 <6ac1829493a53a3fec889c746648d627a0296892.1725624296.git.jani.nikula@intel.com>
 <Ztsmyp6L4vZEtad6@intel.com> <874j6bameb.fsf@intel.com>
 <hcefkofngnohwn3qukf7xo5juwbyvakfx7hlzlkh76ciy5pxly@gt3pidublp2g>
Date: Mon, 23 Sep 2024 12:37:37 +0300
Message-ID: <874j667lsu.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 19 Sep 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> Pushed. With force.

:muscle:

Thanks,
Jani.

-- 
Jani Nikula, Intel
