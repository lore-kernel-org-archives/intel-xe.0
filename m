Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B0ED6C290
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 20:04:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E3E10E357;
	Tue, 19 Nov 2024 20:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fzl0EjwL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 978D310E357
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Nov 2024 20:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732046675; x=1763582675;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XZ2w7NR3xZXPrAGNi8AptS3qaRjL0agu3Xru2KeteCk=;
 b=Fzl0EjwLDO+5ynIRaPSBbKstYnxEXeLeGKIgmItrsldIz6aLCsWXYrqY
 bABxblPkANdv5hwRyMKoWG2GABLI1ZzvlIKZAurzISmeXqpcroww2oVLD
 ayo4hZg/8Fgs3MrGZS2QJjqUX9NWDc8toBWtNNxnwJAVO2fGw+9we5ZvC
 H8t35pWXYQODK+7Qd0SPJ6uDPVN9WjHFmJDl6LjVhgVe45F4c9UEigfEn
 9dT91WviImKNCCvG58n+/VSf0TaE/G2wUQO8U/rcgiBqulbhgdO5wDfYU
 fivlkOkJE650ws2gQwAVlyG4aDey13qIZgFCeiUuh0ljDZkvRfuEu5vNZ w==;
X-CSE-ConnectionGUID: KflRGanpQCiaTKeWy+ycew==
X-CSE-MsgGUID: b2gb6mpmTfeQCpTJ+EIy4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="31451179"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="31451179"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 12:04:34 -0800
X-CSE-ConnectionGUID: iCYk27jgSa2z9V0IHnyU1w==
X-CSE-MsgGUID: QDlLE3eERbuZ5FkTF/S+ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="89841511"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.109.70])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 12:04:33 -0800
Date: Tue, 19 Nov 2024 14:04:28 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH topic/xe-for-ci] drm/xe/ptl: Update PTL GuC revision
Message-ID: <6aijejskc4beruda3hz5ig4z7jzewottbkwb7g5qguba2g5o3s@guy7lypdzqjq>
References: <20241119193156.12951-1-matthew.s.atwood@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20241119193156.12951-1-matthew.s.atwood@intel.com>
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

On Tue, Nov 19, 2024 at 11:31:56AM -0800, Matt Atwood wrote:
>Update PTL guc version to 7.36.0.

mind the reviewer. Is the required firmware in the right place? where?

Lucas De Marchi
