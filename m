Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BFF5C77B60
	for <intel-xe@archiver.kernel.org>; Mon, 27 Mar 2023 18:45:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD3B10E721;
	Mon, 27 Mar 2023 18:45:41 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D529D10E6F4
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Mar 2023 18:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679942738; x=1711478738;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ZfZu90cAxqRFsS8O3I716H1PR9Faxdyf5UwB6kIzBnc=;
 b=f2RBkDQZEoIFXSxZimntO0XZaQGeT+XEGQDzCWCvnykj/ARbgNIhaFrG
 DAEWo9i0HaA+jhrAC451T8iAlnwvO2Tm/dd0QjHnF0AGi1id8gOR94rq2
 7LTjXP2LFMHRnfo/3nZh86Cjr2/VL9q7lQ3xCZJSsuD525SZrNAzEVcw+
 2LC/h9R0bmcMVYS3gfll6sM0ME+NJrEgQRTJFfP6/ZPhEZyJ4QC7PuKu5
 29pVA8Nh+hiUS8XY6/8jWS2nyNoOI9xXo+tL2KIeJOdJG96o/IiGyluF5
 Y4Pfx/N3XjRzMXA/dmlbFPPoKZnXLCDQmbPGBnJZC2qF3YFQdLaWSwvyB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="328799654"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; d="scan'208";a="328799654"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 11:45:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="807589773"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; d="scan'208";a="807589773"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.48.146])
 ([10.252.48.146])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 11:45:37 -0700
Message-ID: <78ecca84-82d2-2b9e-cf83-5e7742782823@linux.intel.com>
Date: Mon, 27 Mar 2023 20:45:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
References: <20230327175824.2967914-1-matthew.d.roper@intel.com>
Content-Language: en-US
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20230327175824.2967914-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] drm/xe/pat: Define PAT tables as static
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


On 3/27/2023 7:58 PM, Matt Roper wrote:
> The tables are only used within this file; there's no reason for them
> not to be static.
>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_pat.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index c860b2122301..be1bea58378a 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -30,7 +30,7 @@
>   #define TGL_PAT_WC				REG_FIELD_PREP(TGL_MEM_TYPE_MASK, 1)
>   #define TGL_PAT_UC				REG_FIELD_PREP(TGL_MEM_TYPE_MASK, 0)
>   
> -const u32 tgl_pat_table[] = {
> +static const u32 tgl_pat_table[] = {
>   	[0] = TGL_PAT_WB,
>   	[1] = TGL_PAT_WC,
>   	[2] = TGL_PAT_WT,
> @@ -41,7 +41,7 @@ const u32 tgl_pat_table[] = {
>   	[7] = TGL_PAT_WB,
>   };
>   
> -const u32 pvc_pat_table[] = {
> +static const u32 pvc_pat_table[] = {
>   	[0] = TGL_PAT_UC,
>   	[1] = TGL_PAT_WC,
>   	[2] = TGL_PAT_WT,
> @@ -52,7 +52,7 @@ const u32 pvc_pat_table[] = {
>   	[7] = PVC_PAT_CLOS(2) | TGL_PAT_WB,
>   };
>   
> -const u32 mtl_pat_table[] = {
> +static const u32 mtl_pat_table[] = {
>   	[0] = MTL_PAT_0_WB,
>   	[1] = MTL_PAT_1_WT,
>   	[2] = MTL_PAT_3_UC,
