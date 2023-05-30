Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32611C7EE23
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 12:48:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0354B10E13B;
	Tue, 30 May 2023 12:48:12 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E24910E152
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 12:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685450890; x=1716986890;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=qgCq/xuniGTaflsdD3+Od3Vcu4rNSxMkHRgaJzoOnvg=;
 b=HNwnDmg7W/Dm0s1m04cTrVCoTXVTk9S8h/f31O9Wp/bS30JiR0s36hgJ
 o1QH6DlRVZvWRIpS4+t1evoLMslzy1CDBc+4hjj6CX8qXklkMSGssD0pE
 phjrDTWGxuNuzP6OkcBCWcRHt0gEqNoZj11C9uh00gXLdSzy035E7WUnx
 14aTgRzP9xkpzBSRn+Agh7j54HcfMXXc9DnsoqCz+SXkFj8bGjGXCiMuj
 jGxAzAC24dxGJRIgSPVS1Qxp6YKv94v17c+NYE0603IRGINzhX4YZnc7c
 GfVhjbbuVAs5dgZGBQcFrDYkKJ0+J2/n9LZeY2LXP0DBEJm1m0lNKPqAF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="353743437"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="353743437"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 05:48:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="683948751"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="683948751"
Received: from jhogberg-mobl1.ger.corp.intel.com (HELO [10.249.254.79])
 ([10.249.254.79])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 05:48:08 -0700
Message-ID: <f13bd041-f24a-f423-1907-305d6cc96b80@linux.intel.com>
Date: Tue, 30 May 2023 14:48:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230530103421.2824622-1-sujaritha.sundaresan@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230530103421.2824622-1-sujaritha.sundaresan@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 0/1] Adding throttle reasons sysfs attributes
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

Hi,

On 5/30/23 12:34, Sujaritha Sundaresan wrote:
> Exposing various throttle reasons attributes as part of sysfs.
> These attributes can point to various reasons for performance
> limitations, include power limits, temperature etc.

No need for cover letter for a single patch. Could just fold the above 
description into the patch commit message.

Thanks,

Thomas


>
> Sujaritha Sundaresan (1):
>    [RFC]drm/xe: Adding throttle reasons sysfs attributes
>
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h | 12 +++++
>   drivers/gpu/drm/xe/xe_guc_pc.c       | 67 ++++++++++++++++++++++++++++
>   2 files changed, 79 insertions(+)
>
