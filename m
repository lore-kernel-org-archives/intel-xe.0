Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E7BC4167B
	for <intel-xe@archiver.kernel.org>; Mon, 30 Oct 2023 11:20:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B0F10E293;
	Mon, 30 Oct 2023 11:20:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0BB610E293
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Oct 2023 11:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698664844; x=1730200844;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=xD4aK6Sa6lWLeRTodog5bU6wSqIc1+Zr/2zpzRQG/FQ=;
 b=kxsO/euVyKq+iLEYN9zbKzIzUPZ4JEJPlA6dTc5TNuIL3ymNV073pSD8
 eQpH7Jc8zBNTRJGh87Pe7Dr2EL26mvnhp5oUQU6RNQsKkmi3f8XKnBDor
 5u17sqTQJMhP+998wnGOdJvmbvmWhhNd3l8ZdkIcMBTIQkWKtPvPy9qMa
 wi4F7Na1G6PMv/nyErC+Q1CSUfsOuB4d9n5DxSbyr9OiN3Ke3t/eZ9Dlp
 ZWiLThiO1S+cttbeoEB7jj6hh3iCwhpi9TI1oHN9UdCEU5abYEnkrraxk
 Oawre10uWK7IQ40nDxvKWKpZCa+x1AfkuXO3Fi1HZN8gQpcaspVZ5RpjF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="385254133"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; d="scan'208";a="385254133"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 04:20:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="1007389661"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; d="scan'208";a="1007389661"
Received: from ksztyber-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.213.4.245])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 04:20:42 -0700
Date: Mon, 30 Oct 2023 12:20:39 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <20231030112039.6lz3uuuh34bcvs7g@zkempczy-mobl2>
References: <20231027104810.310819-5-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231027104810.310819-5-matthew.auld@intel.com>
Subject: Re: [Intel-xe] [PATCH v2 0/3] Some eviction fixes
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Oct 27, 2023 at 11:48:11AM +0100, Matthew Auld wrote:
> Hopefully fixes the scary corruption issues seen around evicting VRAM, as picked
> up by the IGTs written by Zbigniew [1].
> 
> v2: Some improvements suggested by Matt B.
> 
> [1] https://patchwork.freedesktop.org/series/124626/
> 
> -- 
> 2.41.0
> 

Works for me now:

Tested-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

