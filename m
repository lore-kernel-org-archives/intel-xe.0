Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78292E77180
	for <intel-xe@archiver.kernel.org>; Tue, 10 Dec 2024 15:27:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3358B10E229;
	Tue, 10 Dec 2024 15:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FzpjHcr3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80BA110E229
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Dec 2024 15:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733844439; x=1765380439;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VmzngYwh5Fs610jRBgYTYAT9lXnGFXSTSPA7twsqRZM=;
 b=FzpjHcr3rqK0ZxTZnNgRViswxdti3bVcRukIcUzzKCzZR+PAOkxNwzwn
 rOdlCjz6O1zatMTVex1zzLJLfZde+47NmKnISDseysMpsjabupJVqqxdK
 gScZzRoBodqb1RxJmIi8KtAZN49XhqqkllcyzhjaNC64f8g1wNwxG+QP6
 y7LdBdOxdOBrlRiqyTQDp+6g5M5FpqdyrvVh4QoNiMHRsg5THS1CEDk2F
 t0LnTI3hB1rA2+fNVnBMEY4svF6c+BZgBh7Vlkdhmt+BjDZrtFXnZpQw0
 4Ji/ygtaxmnltqJzKJGK6fo6NRMCprpPbHsRxFjkFX0JxnTKlUexdkG2j g==;
X-CSE-ConnectionGUID: kiyz+6XcSgaQE3a2uTOnMg==
X-CSE-MsgGUID: Cs6fbckaTvuzr7gaKzi8FA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="37878153"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="37878153"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 07:27:18 -0800
X-CSE-ConnectionGUID: zzmPRXMIRBaY69InpKxfFw==
X-CSE-MsgGUID: yWsUTJNgSyOcIDr29bYD9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="100479744"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.109.171])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 07:27:17 -0800
Date: Tue, 10 Dec 2024 07:27:13 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 11/11] drm/xe: Do not attempt to bootstrap VF in
 execlists mode
Message-ID: <f654xzadm22zk3r5zvcyum77qdhsioeqmhzbrfhwg6q2pwyabm@jza5vemc46a6>
References: <20241210083111.230484-1-dev@lankhorst.se>
 <20241210083111.230484-12-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20241210083111.230484-12-dev@lankhorst.se>
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

On Tue, Dec 10, 2024 at 09:31:11AM +0100, Maarten Lankhorst wrote:
>It was mentioned in a review that there is a possibility of choosing
>to load the module with VF in execlists mode.
>
>Of course this doesn't work, just bomb out as hard as possible.
>
>Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 3 +++
> 1 file changed, 3 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>index 997438047a037..4b16a6bf27b12 100644
>--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>@@ -213,6 +213,9 @@ int xe_gt_sriov_vf_bootstrap(struct xe_gt *gt)
> {
> 	int err;
>
>+	if (!xe_device_uc_enabled(gt_to_xe(gt)))
>+		return -ENODEV;
>+
> 	err = vf_reset_guc_state(gt);
> 	if (unlikely(err))
> 		return err;
>-- 
>2.45.2
>
