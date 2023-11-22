Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4471C61D99
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 16:00:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B50E10E674;
	Wed, 22 Nov 2023 16:00:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A44210E674
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 16:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700668835; x=1732204835;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Lrc9QtEzhzjujA/JhX08944YBYQi+5kYw8Ih0Lo7gQQ=;
 b=Pd9nX5faRo7HNfiZVo7/GtPlhboja+c0eu/pN5lI0OwFmkXDKDH6TdjW
 J+JWwPjlxc44cptuxz6ti/tm037bRkHlD82Ij4YNNDVUuUC6/TkcEj8f2
 b6srcld9zO6UO7nr107vU/eTOlHnoA7vsMuqv+iD6/WW8hRewRksm7vAE
 L3AYRSJfj2bCO7GvmgiB/IVGvXYGRr27R9LAiHdTMXr70UwOH4mqvAD+5
 SJ6305HrewWmBxmT6XtKE5+R7BMn0K/tZ1nsk0alEvVBjgeET9ZFwuMRT
 ZgMcPgXylpS4kz1Ubc98F18Xp0XjX1M0oxMo0b/KFEAi0m3Q9BP3pXaFR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="458577709"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="458577709"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 08:00:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="910865965"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="910865965"
Received: from aconradi-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.221.156])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 08:00:33 -0800
Date: Wed, 22 Nov 2023 17:00:30 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Message-ID: <ZV4lnjWGym9hztqz@ashyti-mobl2.lan>
References: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
 <20231106111845.2333093-5-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231106111845.2333093-5-mika.kuoppala@linux.intel.com>
Subject: Re: [Intel-xe] [RFC 04/25] drm/xe/eudebug: hw enablement for eudebug
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

On Mon, Nov 06, 2023 at 01:18:24PM +0200, Mika Kuoppala wrote:
> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> 
> In order to turn on debug capabilities, (i.e. breakpoints), TD_CTL
> and some other registers needs to be programmed. Implement eudebug
> mode enabling including eudebug related workarounds.
> 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Signed-off-by: <mika.kuoppala@linux.intel.com>

I see that your SoB is missing from other patches, as well, I'm
not going to comment on them, anymore.

Andi
