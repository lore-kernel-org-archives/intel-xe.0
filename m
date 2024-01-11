Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6754C47077
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 11:29:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B68F10E05B;
	Thu, 11 Jan 2024 11:29:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A3D610E890
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jan 2024 11:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704972562; x=1736508562;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=fmVbUhKepJVRVqBmDt0KXRPn60CeT7AB2N3gOVz/dLI=;
 b=d+Qlnras1zuJ8A7swx7tP1A7jhMw2gSJiSqmYoGKp4rI0ti55/Jy1rU+
 xbmEzISeDNzmZ9nlxY7OMM5AeddsjCSA2lOdmp3EtHfdGQJMjh2JgK0Cu
 MvfxC7shPE0XCMCsnOIn+O0wLkt3eqPDimVeuDitMGTr6b5V6ra+gnaU7
 BtOR40YRUjwJV18cxXlg1l7quDKg8hG8h9j+vhY5gcIbgzIV49bqgKKW2
 a8WBej/+ZZK0ZBtOPMB8tAIonPtzdwTPUDB+HjjXnruZQpsKpKvwz9+V0
 1kKIc814YGop3UxnXZx9fjQE2AAm1K+SJtQlXOL5vKuf/Ja7WxHwG/VeD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="484990984"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; d="scan'208";a="484990984"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 03:29:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="872992991"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; d="scan'208";a="872992991"
Received: from gaertgee-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.54.206])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 03:29:20 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Patchwork <patchwork@emeril.freedesktop.org>
Subject: Re: =?utf-8?Q?=E2=9C=97?= CI.checkpatch: warning for drm/xe:
 display support should not depend on EXPERT
In-Reply-To: <170497212931.271298.16781504254126615026@5338d5abeb45>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240111104716.3548744-1-jani.nikula@intel.com>
 <170497212931.271298.16781504254126615026@5338d5abeb45>
Date: Thu, 11 Jan 2024 13:29:18 +0200
Message-ID: <87ttnkt8fl.fsf@intel.com>
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

On Thu, 11 Jan 2024, Patchwork <patchwork@emeril.freedesktop.org> wrote:
> == Series Details ==
>
> Series: drm/xe: display support should not depend on EXPERT
> URL   : https://patchwork.freedesktop.org/series/128648/
> State : warning
>
> == Summary ==
>
> + KERNEL=/kernel
> + git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
> Cloning into 'mt'...
> warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
> + git -C mt rev-list -n1 origin/master
> faa12d3432d7ef7793d934cd9338c555e95a5aad
> + cd /kernel
> + git config --global --add safe.directory /kernel
> + git log -n1
> commit 9b662af5259f4ddaac4101a7ce4ecdfe606f08b7
> Author: Jani Nikula <jani.nikula@intel.com>
> Date:   Thu Jan 11 12:47:16 2024 +0200
>
>     drm/xe: display support should not depend on EXPERT
>     
>     Remove the DRM_XE_DISPLAY config dependency on EXPERT. I can only
>     presume the idea was only experts should be able to disable it, but the
>     effect is the opposite.
>     
>     Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>     Reported-by: Eero Tamminen <eero.t.tamminen@intel.com>
>     Reviewed-by: Francois Dugast <francois.dugast@intel.com>
> + /mt/dim checkpatch 79184e72263e91528195db01783148435c7e4fad drm-intel
> 9b662af52 drm/xe: display support should not depend on EXPERT
> -:11: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report

Kind of hard when it was in private. :p

BR,
Jani.


> #11: 
> Reported-by: Eero Tamminen <eero.t.tamminen@intel.com>
> Reviewed-by: Francois Dugast <francois.dugast@intel.com>
>
> total: 0 errors, 1 warnings, 0 checks, 8 lines checked
>
>

-- 
Jani Nikula, Intel
