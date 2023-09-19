Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E16CD5492
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 07:46:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C5210E361;
	Tue, 19 Sep 2023 07:46:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1918210E361
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 07:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695109584; x=1726645584;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LEK4mL80wJmdMG2WbXvpzxZDIjavXANxA9oIgEMqJxc=;
 b=kUzRFJ0E9wekq4VhGq8hWUDyS/lk4DegqezFz4JY4Age7QuB1rwuEJbk
 HDjaGnctjkkH1/+wW4migSLmS4lXLS22JHK5sxwPpJ5OZ/Ss6gS8QLFnY
 FKaVBdDnnbVB7CX2r5SsI+D3j/Ed+vJ1balW/V74p6+tXScd/+dRwIdso
 qRXmhNW0Bgreq9ZXAFuI8qNMPDI/ANvTGpkxiKwBCbeXPEGGJD3WNNNEl
 btCvPmcNArzG8zHeV6D3ljMdBOYGWHrMsiaVEdD/w2ljHLM+XbsIm5dGW
 EvNruCkyO/gMthv+lsTID+PG59HYrEJsn5n1yJ/j3lqewPZkRPziEBYPV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="359276573"
X-IronPort-AV: E=Sophos;i="6.02,158,1688454000"; d="scan'208";a="359276573"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 00:46:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="811637601"
X-IronPort-AV: E=Sophos;i="6.02,158,1688454000"; d="scan'208";a="811637601"
Received: from sorenthe-mobl.ger.corp.intel.com (HELO [10.249.254.70])
 ([10.249.254.70])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 00:46:22 -0700
Message-ID: <03b5e4bf-f98d-c839-3e49-681712d828fe@linux.intel.com>
Date: Tue, 19 Sep 2023 09:46:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230919063611.14236-1-aravind.iddamsetty@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230919063611.14236-1-aravind.iddamsetty@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix kernel doc warning for PMU events
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

+Lucas for any --fixup comments.

Hi, Aravind.

On 9/19/23 08:36, Aravind Iddamsetty wrote:
> Add DOC keyword to PMU events comment in include/drm/xe_drm.h to make it
> kernel doc format.
>
> Fixes: 4a9681392cec ("drm/xe/pmu: Enable PMU interface")

Since we're still rebasing xe, The above commit hash will soon be stale, 
so  I think the proper way to add this is to do

git commit --fixup=<commit hash>


>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> ---
>   include/uapi/drm/xe_drm.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 63863eda8355..6ab85c7fed36 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1054,7 +1054,7 @@ struct drm_xe_vm_madvise {
>   };
>   
>   /**
> - * XE PMU event config IDs
> + * DOC: XE PMU event config IDs
>    *
>    * Check 'man perf_event_open' to use these ID's in 'struct perf_event_attr'
>    * as part of perf_event_open syscall to read a particular event.

Otherwise LGTM.

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


