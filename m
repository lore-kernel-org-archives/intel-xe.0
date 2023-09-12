Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB964CA0ECA
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 11:11:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ECA810E3F4;
	Tue, 12 Sep 2023 11:11:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3AD610E3F4
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 11:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694517098; x=1726053098;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=rZj/P7keW7PuzFOoXxId0NYtb608Su0vGrs4GTAyioU=;
 b=mriA5dy/hjGetdzBReu38hOxSqPnDZ+jRTXDrq5WOGQ+0qNXp2cDZtQV
 +u3+BYeC9cTsaSsHrNpjA0iJdvfWnXEX5GLzm5xbhcYv+/acLTe6QJmo+
 h/nvhg3t4sMpMFrs9SH8dUE5C+HmqXVt0M3OZZHg4AbEEtiOFMgHnRyxn
 DEtNgMaOwSV+0jVCtLgLfjURPubyAY4wQNqVevAN817JbozfT1/GaXEpR
 MOPHc679cSp7S0SOIEgrUuwi5+bRTe28YMZuv7iWbFcRyV64RJvUcyPBC
 Gt0CWEuUrWGzHvFCWvlYiTvzTKpMulFqQkpkh0dhBLJptEV/rsnnv765t g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="442359277"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="442359277"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:11:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="813779785"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="813779785"
Received: from kscholl-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.206])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:11:35 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ofir Bitton <obitton@habana.ai>, Matt Roper <matthew.d.roper@intel.com>
In-Reply-To: <23515ffe-c397-21a9-94b5-e28f5b26fd64@habana.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230907193515.7-1-francois.dugast@intel.com>
 <ef36eb06-d65b-6ad4-ac4f-f1fb2ba7a544@habana.ai>
 <tl37n5qledvt7yxce5sl4byon6puewxvs3ymfebsndnolwstg3@3fjfvpuzna5b>
 <fede72f2-e542-8308-fcb4-ad37ae058154@habana.ai>
 <20230912002541.GD2706891@mdroper-desk1.amr.corp.intel.com>
 <23515ffe-c397-21a9-94b5-e28f5b26fd64@habana.ai>
Date: Tue, 12 Sep 2023 14:11:32 +0300
Message-ID: <87v8cfd4t7.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH] drm/xe/uapi: Remove MMIO ioctl
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 12 Sep 2023, Ofir Bitton <obitton@habana.ai> wrote:
> On 12/09/2023 3:25, Matt Roper wrote:
> Hey Matt, I totally undesrstand your concern, I might have another
> suggestion. We can create another FD in debugfs and move this ioctl
> there (I can take ownership on this), This way ABI is not an issue.

FD or ioctl in debugfs? Or do you just mean adding a debugfs file for
register access?

BR,
Jani.

-- 
Jani Nikula, Intel
