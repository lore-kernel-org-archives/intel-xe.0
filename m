Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC58C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 13 Nov 2023 15:04:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE3610E3A3;
	Mon, 13 Nov 2023 15:04:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61A0C10E397
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Nov 2023 15:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699887870; x=1731423870;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=bQIlrNZiraAhE9EV+a4WhQzlwunLyX1i2cpvDZnI+e0=;
 b=VDdQJSLecx9fOvdJlxGu0UYQ1n56x5NawQ0K46DJYVOhasV9gX1rfuiA
 0oHoj4hlIHcYjIViiDS5jF/MSz4trzrXwJRKIYOp8jMEYhZcfg2aB2lCs
 b+CLqRtzqDYT4W0WobBDVjIoh4MVdJcGsiZfUv7qvzBgWwDfnHFfXRH2I
 Q+2S1WsN/DLOiUe80KloFuzVfT+qtSBhM3xJIXaMPy4XXo/XbmVyKrQv0
 5WJSQjaLS3Vi99C+OkgtpVzffnfYTHppIooL7rUKT56nwxyA8Qui0sLgV
 JhC2c7b7V38fajMRbaDfH/eeS1U1plLbp+GmdDid/dhTVt6+hZJa1of8H A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="390252679"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="390252679"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 07:04:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="12128497"
Received: from cgheban-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.92])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 07:04:29 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
In-Reply-To: <iqnwce72yngqs4uequb7s67q7aoesyxa2xcgxo6ungprj64b5u@ha5cyqpgq6oa>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231109175132.3084142-1-lucas.demarchi@intel.com>
 <20231109175132.3084142-3-lucas.demarchi@intel.com>
 <87v8a6ufyn.fsf@intel.com>
 <iqnwce72yngqs4uequb7s67q7aoesyxa2xcgxo6ungprj64b5u@ha5cyqpgq6oa>
Date: Mon, 13 Nov 2023 17:04:26 +0200
Message-ID: <87il65vgn9.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Fix build with KUNIT=m
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

On Mon, 13 Nov 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Mon, Nov 13, 2023 at 12:04:32PM +0200, Jani Nikula wrote:
>>On Thu, 09 Nov 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>> -	depends on DRM && PCI && MMU
>>> +	depends on DRM && PCI && MMU && (m || (y && KUNIT=y))
>>
>>What do plain m and y mean here?
>
> m == this config set to m
> y == this config set to y

Okay, TIL. Not a very common pattern.


-- 
Jani Nikula, Intel
