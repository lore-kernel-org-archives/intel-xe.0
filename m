Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4762C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Dec 2023 20:59:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 114B910E146;
	Fri,  1 Dec 2023 20:59:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 879F310E146
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Dec 2023 20:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701464388; x=1733000388;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pbBhpZuFU7F/SopvLbiHomI7jV2FiORf3gu0GbS+WNE=;
 b=Qh9yXWdz1vwNU7ciSpQHIq4Hg8Nd7ozKiwZCIN4sjG1sAygkUz8glhPH
 CmRjC/C0Zxg0d9OOqh4cX+UCmQb9C9CpSOTAF6godHky5qblXih7InTP2
 jh/lrxgKoSbGMjn3TQ4e6FZjt0MJ2CJ2fESTOaT+Eix4m+LSwmn0Es6pt
 LZsovF5ApirPangl8QE/DWS5LTTr0o4Jb0j1GEhULcWhGP0jfbgBXu9iD
 afwZCcHnYsdv3G++/PF/6+9zKUgAnuv5WEkhdud+9KbXpsf7KyRSZu5h9
 2VQEDrUp8GoA4LjpJ1OVbkNeBUG1gzj8mnQF38FmzTevfCxswY2KeBpjM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="373733554"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; d="scan'208";a="373733554"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 12:59:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="798854642"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; d="scan'208";a="798854642"
Received: from ipollak-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.33.73])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 12:59:25 -0800
Date: Fri, 1 Dec 2023 21:59:22 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <ZWpJKjCWA1Y0yEH7@ashyti-mobl2.lan>
References: <20231129025716.9094-1-niranjana.vishwanathapura@intel.com>
 <20231129025716.9094-4-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129025716.9094-4-niranjana.vishwanathapura@intel.com>
Subject: Re: [Intel-xe] [PATCH v2 3/3] drm/xe: Avoid any races around
 ccs_mode update
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

Hi Niranjana,

...

> +	/** @clients: drm clients info */
> +	struct {
> +		/** @lock: Protects drm clients info */
> +		spinlock_t lock;

is this a refcount at the end of the day?

Andi
