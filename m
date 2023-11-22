Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B013EC61D9B
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 13:46:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79BB510E638;
	Wed, 22 Nov 2023 13:46:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DBE710E63A
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 13:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700660782; x=1732196782;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cuU3i2JQ6XKynMOpX4iF01LLzWHAXMSdrhJ3y14AIgY=;
 b=JLu20gPYpOsatg4QEPJOuej5TXRklIOtZtO3oH26if10kpP3mQn3ilbq
 ClPynijTbNKb/IS/LXuXa5RzAPYh7Pkh0x/yuA7DAVdo4QENBxsU1p5cu
 4UDhHscPrsV4BNmn/7WOSeqfvYm3KTWoQ/mKIj6sF2ak9MmGphG9rlMjt
 EITEqaIZ9G5YWxcJVGH08K/bp3MA7tDmZ071iveMyKnWwklRC7fOjCabc
 ZYqY2rg0Ty3FAidaNRKabgkDUaUU49W9jXtLd2+KWSm7NQE4TvCGAilBQ
 +3P65L+dsDjJruo6Ia6V5tzRif1RBVGg3/PZvPDYyufUbz0sUo51UdJf5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="391825188"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="391825188"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 05:46:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="8279385"
Received: from aconradi-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.221.156])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 05:46:21 -0800
Date: Wed, 22 Nov 2023 14:46:17 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Message-ID: <ZV4GKYzUVGyQwMBJ@ashyti-mobl2.lan>
References: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
 <20231106111845.2333093-3-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231106111845.2333093-3-mika.kuoppala@linux.intel.com>
Subject: Re: [Intel-xe] [RFC 02/25] drm/xe/eudebug: Introduce discovery for
 resources
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

Hi Mika,

On Mon, Nov 06, 2023 at 01:18:22PM +0200, Mika Kuoppala wrote:
> Debugger connection can happen way after the client has
> created and destroyed arbitrary number of resources.
> 
> We need to playback all currently existing resources for the
> debugger. The client is held until this so called discovery
> process, executed by workqueue, is complete.
> 
> This patch is based on discovery work by Maciej Patelczyk
> for i915 driver.

Co-developed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>

I think it's valid also for the previous patch.

Andi
