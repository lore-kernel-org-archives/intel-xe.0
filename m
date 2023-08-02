Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2861C001DE
	for <intel-xe@archiver.kernel.org>; Wed,  2 Aug 2023 23:34:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37B4F10E583;
	Wed,  2 Aug 2023 23:34:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED3BE10E155
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Aug 2023 23:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691019297; x=1722555297;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7efkBciRE71+tn2Z25LoetMi/dJ33maLBxNsWpeV1tE=;
 b=gmsY1EN1lCyTUmu4O2KALQdOdtKBy9YCwgwZ8cQvvjPjhszwR9GO/PAz
 MSyExsW0c9fFh3O1ql8b3Q7jV2EPs2oothn/S13a1TytyoTrtiU9G5yq+
 N1pxoTu+T7Uo3F+7HUiXxS4YAUZYIBgzEH6/QnnAky2/P8RMjW2//Oorx
 bJU53kyL1i7eH0/ZxV17GTEXb96HCYOBlfMxQXQc56Xe/P5KtSLcc9t4J
 QsNytQBUDOdWWRYzeLHlVnhGmX9JuUpbTgqZBtllqVLAFGB8yztWqaa/r
 ymX5Pq85qTsZLUcgMal2lVLi4dKkCDkIcJr150o0GzdQRXartvErpILAD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="433564382"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; d="scan'208";a="433564382"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 16:34:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="975862534"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; d="scan'208";a="975862534"
Received: from mlytkin-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.252.38.55])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 16:34:53 -0700
Date: Thu, 3 Aug 2023 01:34:51 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Message-ID: <ZMroG8SWDMDHtsOL@ashyti-mobl2.lan>
References: <20230802135241.458855-1-badal.nilawar@intel.com>
 <20230802135241.458855-2-badal.nilawar@intel.com>
 <ZMrbZXOVsyT133D8@ashyti-mobl2.lan>
 <b863c26d-143b-9dd4-7f90-44a2b0ae94e2@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b863c26d-143b-9dd4-7f90-44a2b0ae94e2@roeck-us.net>
Subject: Re: [Intel-xe] [PATCH v3 1/6] drm/xe/hwmon: Add HWMON infrastructure
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
Cc: linux-hwmon@vger.kernel.org, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Guenter,

[...]

> > > +static const struct hwmon_channel_info *hwmon_info[] = {
> > > +	NULL
> > > +};
> > 
> > just:
> > 
> >    static const struct hwmon_channel_info *hwmon_info[] = { };
> > 
> > would do.
> > 
> 
> What would be the point ? This is just a placeholder, and we need
> a NULL entry at the end.

right... this series needs to be read from the end to the
beginning :)

Andi
