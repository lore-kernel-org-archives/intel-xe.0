Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BD4C2BBCA
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 11:18:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FFF510EC12;
	Fri, 28 Jun 2024 11:18:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hZTFHtsc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4DFE10EC12
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 11:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719573482; x=1751109482;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=5QIc2YOYu5cIJmIGyyj8htG6fszKA/IJQnr3gsGrf38=;
 b=hZTFHtscl0heS4e/Klr82/xefJnF8KUTqdVAlexiMspeX4DWHofPQKoP
 zMenxj2ev+pvyD0kKSCYOCSABks10js1iBEbW4zUVBaSYVS5+Y7CFEICU
 A0MDdKE+p33rELYGJve7KOoIBEovnXDUBfUCI7sfWFpwGc2v+Duxhx0xu
 py6NTtegGvMJKp8gLMsuDLHrwnDvJ+LvVM766v3ZIVxSo0KfJ8Tj9TpZH
 pLlIcxKewZSKCix/aPpw39kfLluxAfi3s1uuC6lm35i6DGvzP/8BTQkp2
 UJ/3VZi8i9+q617ZSFN3Lg579CCucTlwJj3YH197yIHcXvTWEk1gtFq7H w==;
X-CSE-ConnectionGUID: Tb6Cx4sAR6iC7m+rEPr+Yg==
X-CSE-MsgGUID: pUXX//69TWiv+Wa0E2yTpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="34289121"
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; d="scan'208";a="34289121"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 04:18:02 -0700
X-CSE-ConnectionGUID: SFxFjmYBS36EIlzhon6meQ==
X-CSE-MsgGUID: /dpL+JjPQI6HHgWwEn32Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; d="scan'208";a="49666257"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 04:18:00 -0700
Date: Fri, 28 Jun 2024 14:18:10 +0300
From: Imre Deak <imre.deak@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH] drm/xe/pf: Remove unused xe var in pf_get_threshold
Message-ID: <Zn6b8oyAJ7GtTdka@ideak-desk.fi.intel.com>
References: <20240628085457.21929-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628085457.21929-1-nirmoy.das@intel.com>
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
Reply-To: imre.deak@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jun 28, 2024 at 10:54:57AM +0200, Nirmoy Das wrote:
> Remove unused xe var which probably came for resolving a merge
> conflict, commit 2817ef9704e7 ("Merge remote-tracking branch
> 'drm/drm-next' into drm-tip")
> 
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index a5c9dfa1077c..694671497f6e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1785,7 +1785,6 @@ static int pf_get_threshold(struct xe_gt *gt, unsigned int vfid,
>  			    enum xe_guc_klv_threshold_index index)
>  {
>  	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
> -	struct xe_device *xe = gt_to_xe(gt);

I noticed the same issue after pushing a patch to drm-tip, afaiu the
correct way to apply these kinds of fixups is

$ cat patch | dim cat-to-fixup
$ dim rebuild-tip

as described in
https://drm.pages.freedesktop.org/maintainer-tools/drm-tip.html

I did this now for the above fixup.

>  
>  	return config->thresholds[index];
>  }
> -- 
> 2.42.0
> 
