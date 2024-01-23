Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA460C47258
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 11:18:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED5710E6F5;
	Tue, 23 Jan 2024 11:18:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1EF010E6F5;
 Tue, 23 Jan 2024 11:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706008732; x=1737544732;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YoOt+H5Y3eG962YN6ZE03FwdYm/3Yx1zJCWDTJPRQkI=;
 b=b1tbAHvuqVO6Ru2Qx4f5BWIWnFySW+cO5aiP+4u78uurdVz38+0b5pcl
 XLCeFn5iusn3Z5i6ICmklA9dWJfBGAPrizZGRaq3MNmkQ07OCxbnY244F
 /83h9n5hCQUEgQv583BSqSE6jk7MKrQfU1GWA1MstMyGX2PAm23ZnBOr+
 ncCb0iA3l/YDJMgfVqjqMmc2A6er0La6fULJOZHMhPaUWhpjKHd3U0nSf
 a/5oe0JZKk1CUywhFnmh5iIo7/9RNclae/Vj/lxHiY7HRszlRd95kb2jn
 WX3zoS6otOFNDZz/LhY0UP0+YOlKOq7C/MvrMZv+6eKRWJBUBVShv2tPs g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="465753125"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="465753125"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 03:18:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="34374486"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.0.222])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 03:18:51 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] xe_live_ktest: Use xe_live_test kernel
 module
Date: Tue, 23 Jan 2024 12:18:47 +0100
Message-ID: <4209373.1IzOArtZ34@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <pzahxxitvi22wn7zs7w7dy35zvj2i7ziwxdpn33pyo53kngmf7@ftr4s7ar2fkx>
References: <20231205224926.2188996-1-lucas.demarchi@intel.com>
 <7633435.EvYhyI6sBW@jkrzyszt-mobl2.ger.corp.intel.com>
 <pzahxxitvi22wn7zs7w7dy35zvj2i7ziwxdpn33pyo53kngmf7@ftr4s7ar2fkx>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Monday, 22 January 2024 16:37:17 CET Lucas De Marchi wrote:
> On Mon, Jan 22, 2024 at 12:35:28PM +0100, Janusz Krzysztofik wrote:
> >On Friday, 12 January 2024 00:45:37 CET Lucas De Marchi wrote:
...
> >> To simplify our kunit lib, we could also rely on kunit_debugfs to list
> >> tests.
> >
> >That option also sits in my IGT queue, though it requires an updated Xe CI
> >kconfig (or at least it did two months ago).
> 
> an MR to https://gitlab.freedesktop.org/drm/xe/ci would take care of
> that. Can you prep one?

Done, but a merge conflict has been reported, please let me know if I should 
do that another way.

Thanks,
Janusz

> 
> 
> Lucas De Marchi
> 




