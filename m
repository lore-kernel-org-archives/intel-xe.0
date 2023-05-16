Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C53C7EE24
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 08:30:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8266C10E321;
	Tue, 16 May 2023 08:30:31 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F8610E321
 for <intel-xe@lists.freedesktop.org>; Tue, 16 May 2023 08:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684225828; x=1715761828;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uO4z5treORicJ0zBrsCEbi7GzpmOGhImL+I3p8/iHxE=;
 b=dM5duTq/4PzHYixPb1ocBKeGIHQvloHpHpG3VGz712lEJ9/ktA/01OOT
 WeR0ORGwEcyNqGrXFMdXsFGdqqHTrmJsFrQYr7qUEVW/Dd9cY8tAY5he/
 iDz1h1butx57DO53k7RCIey+h6Y1v9EYXrua5xqLsAxZv+9S/pTENQElc
 N+jh8UQi85LjWpOzRndOq7ESJ0ZOPu7WA8eAFrPY3dN0HDREDhgh0yCld
 Zx3rUfDCV7UlV6JuNDupr2Y9RtwuJU7Vk2YluUYq/tPJLrnvYhix5hs6i
 rYtvzvK3w/6NYVG/MJk/Y5n2yK22pC8HWg1nLEBXiJhg9o+H+lOAYDrIZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="340782331"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="340782331"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 01:30:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="731909094"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="731909094"
Received: from dmarkey-mobl1.ger.corp.intel.com (HELO [10.252.19.120])
 ([10.252.19.120])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 01:30:25 -0700
Message-ID: <e72bc5f3-4685-c8dd-9c31-90738e835e00@intel.com>
Date: Tue, 16 May 2023 09:30:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230515192628.1990279-1-michael.j.ruhl@intel.com>
 <20230515192628.1990279-3-michael.j.ruhl@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20230515192628.1990279-3-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 2/4] drm/xe: Simplify rebar sizing
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

On 15/05/2023 20:26, Michael J. Ruhl wrote:
> "Right sizing" the PCI BAR is not necessary.  If rebar is needed
> size to the maximum available.
> 
> Preserve the force_vram_bar_size sizing.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
