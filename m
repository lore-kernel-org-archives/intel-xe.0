Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62DAC71156
	for <intel-xe@archiver.kernel.org>; Fri, 18 Aug 2023 13:55:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B70FB10E529;
	Fri, 18 Aug 2023 13:55:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB8C310E529
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Aug 2023 13:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692366934; x=1723902934;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5l+TLt5jJBfvVH9wRW+tq76gc6Dv0LogxMlFhQsQZiE=;
 b=cMLL0S8zfVe7UmpDHAscTxrrdRTk+iJa1fvLANgsC2UoiodWMqGxwnK6
 xzgFh55P8MdFZAJOpjBsSVEKFu3IXK0kuvtGNFNlGDRc+YzRuiwaawJQU
 lywHoDcNjWwSK77mEgJ399M5O2j7ZUFd8y7aEdBs7T0iLU6mntf9GITjj
 UsYoOUogYhOQSkbfuleQfzQvV/xRPQCHJIhL4fjgDv21o8ETQTkw2VW7R
 O3bV0Fh+bKs8M023yT9fkP5jLIJEhxlZnZ1Z1KJ+fPx60UJEdQAzsonL/
 KJDahZV/zR3TCpqrs3i+gUsZVcb5+AwV0isCvJE0pXcGzkYLzEWSNw3lG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="372006120"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="372006120"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 06:55:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="858706980"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="858706980"
Received: from esavax-mobl.ger.corp.intel.com (HELO intel.com) ([10.249.41.4])
 by orsmga004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2023 06:55:29 -0700
Date: Fri, 18 Aug 2023 15:55:27 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Message-ID: <ZN94TxNikUSKS6GN@ashyti-mobl2.lan>
References: <20230627183043.2024530-1-badal.nilawar@intel.com>
 <20230627183043.2024530-3-badal.nilawar@intel.com>
 <ZJzNuq/WaxjZ8YH/@DUT025-TGLU.fm.intel.com>
 <ZJ2Qm0UcAidCEArX@ashyti-mobl2.lan>
 <87zg2rsxj9.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zg2rsxj9.wl-ashutosh.dixit@intel.com>
Subject: Re: [Intel-xe] [PATCH v2 2/6] drm/xe/hwmon: Expose power attributes
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
Cc: linux-hwmon@vger.kernel.org, intel-xe@lists.freedesktop.org,
 linux@roeck-us.net
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Ashutosh,

> > >
> > > Also the the loop which acquires hwmon->hwmon_lock is confusing too.
> 
> Confusing but correct.

Confusing is implicitely not correct.

Might be correct now, but in some moenths someone else might miss
the point because it's confusing, mis-interpret and send the
wrong code.

Reviewers, going through the +/- commit will have a tough time
figuring out.

Let's keep things easy and simple... there are easier paths for
locking here and we've been discussing them with Badal.

Andi
