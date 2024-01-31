Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2027C47258
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jan 2024 13:47:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D7210F115;
	Wed, 31 Jan 2024 13:47:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF6D10F115
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jan 2024 13:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706708828; x=1738244828;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=6XGDypxfWuozyOjIXnQzhHAHAxTd41uKB3l+3FsUlH4=;
 b=WAPWpxTYafQ02tUSCdZ95yWRaRjoOwbweWGrz0lbYP0g5Oij9l4JbSjx
 Xey1M4ic1cogfn2o8bhZLMacHUmNTGtOPh8UNVm+LWkLjx5smihjxR+Yj
 9lUuOXES18ciJZz+de+mth6W/hD6KejiiWia7SLgfIzGrHomTOcNaeRMZ
 7jD4TSlKVaiDqsC+22Arlw4ljV5I4U2UVeVc+gRVKNkYA+PNJlmG+d7xg
 QnkkAD+S/baHwCRBSSzKqTnyyKuaX+isnIIfM7NzC/eXd72uQyHx9OTuw
 Gk58xOejuJUVUQgojMRl2rQC1BFmQN1ksSWnh8WI/WLUbw3JUi6pPfmPx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="17137080"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="17137080"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 05:47:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="30227150"
Received: from abarrete-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.59.174])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 05:47:04 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: Re: Re: [PATCH 2/2] drm/xe: drop display/ subdir from include
 directories
In-Reply-To: <luojhbiq7zyojjxyquy7d3qloeg5fvy2wxzwanx572s7y62om6@5rddv47rspj5>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240122101428.2683468-1-jani.nikula@intel.com>
 <20240122101428.2683468-2-jani.nikula@intel.com>
 <47hzp5ya6cwdcidq7cwid5ykpkn6wavxtf3ynjf3xgirbgulsc@afsk7pgae3lx>
 <87le8hnu6r.fsf@intel.com>
 <663d25vngq6zcee6vupweq7dohhmftpaggtnfl7752sn6qhdao@ypgsfn62skob>
 <87ttn4m0r2.fsf@intel.com> <877cjrjhzi.fsf@intel.com>
 <luojhbiq7zyojjxyquy7d3qloeg5fvy2wxzwanx572s7y62om6@5rddv47rspj5>
Date: Wed, 31 Jan 2024 15:47:00 +0200
Message-ID: <8734udipij.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 30 Jan 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> Let's push this. If it doesn't work out due to people including other
> headers, we may think of a way to block that without reverting.
>
> Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

Thanks, pushed.

BR,
Jani.


-- 
Jani Nikula, Intel
