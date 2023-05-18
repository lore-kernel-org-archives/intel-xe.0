Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D0BC7EE22
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 11:39:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D23010E090;
	Thu, 18 May 2023 11:39:23 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FF0610E090
 for <intel-xe@lists.freedesktop.org>; Thu, 18 May 2023 11:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684409961; x=1715945961;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=8UYd5EKvaEvxqB9Qa4wSHp9owJQ4fizkaNiWY90sZBI=;
 b=UEgzxZ1hcefnBW5zwL9swI3So/maiQk7Im2JUeehNNG001NZAgYxpmIM
 WQc7U9bUIPSYtt/L6ADrE04SK5+yivQoMODpxaYpuH5mGt3XZcvmZ2bOy
 cJlfVTPnQZt3lsky+0v8/uCiJ4FgZYE0+Q5C9LRfJ1g/G2JatUVdI9+aj
 Zu0y8B8J/vR75VACF5zTNWH66kiMv7Ms+rqpG0N2Komxci5Nl7GZbV3qG
 aLqi694X/z+LTdHlVXAPb5KtQcaQK1YWl6z8FHDsvPwv/3jWe9K3dRF6M
 JJTOzzPF+cvZ+EpbPUVwqhxywUNX4fa93JZ38tNydYEdqJ5Cp+uK7Clxc g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="438384580"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200"; d="scan'208";a="438384580"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 04:39:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="702104894"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200"; d="scan'208";a="702104894"
Received: from amcminn-mobl.ger.corp.intel.com (HELO [10.252.19.102])
 ([10.252.19.102])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 04:39:19 -0700
Message-ID: <55ba8506-1200-94a0-964c-e2a430c8d754@intel.com>
Date: Thu, 18 May 2023 12:39:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Content-Language: en-GB
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230517160857.2791619-1-michael.j.ruhl@intel.com>
 <20230517160857.2791619-3-michael.j.ruhl@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20230517160857.2791619-3-michael.j.ruhl@intel.com>
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

On 17/05/2023 17:08, Michael J. Ruhl wrote:
> "Right sizing" the PCI BAR is not necessary.  If rebar is needed
> size to the maximum available.
> 
> Preserve the force_vram_bar_size sizing.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
