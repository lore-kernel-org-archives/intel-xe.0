Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F98C48BF6
	for <intel-xe@archiver.kernel.org>; Thu,  7 Mar 2024 10:54:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 652E510E187;
	Thu,  7 Mar 2024 10:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PpfxJmkY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0004010EBC4
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Mar 2024 10:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709808859; x=1741344859;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=6nTVoejTsgAAqTl1GmCuPfv/Gf7rHhv7spGM/U36AZo=;
 b=PpfxJmkYcxUzMuxBQtI/e8vPnnuP+y9Xv/jQRN7P24ZOcTSXwEBpID/X
 cLyQ/koGrZCSpwSigVeAqg8PpziGlg3+X1G0jJmgEJy1KnhkNu5hWRLX2
 c8aeTSPmrPd1NLz6yB8R4X3BfV40y3lF7KxuQMV+//xP16T4J3wBmSCOZ
 Y9Zs5SW1X4xyn+FbD8I9Wuh0Ah4b3A14AStlHgEoa9cYwq+Th6W8FMd7Y
 oMr2XYcN7cNmEwnMppBghNTX+L2sQ+fk7fpyHfk8mi9b1nfzWhO+heSn/
 e92qZ/9iAVag68QeaThZHG+XrRCGhU9YPTQgW5anYrx59ARhB4rYQvoAO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="29913648"
X-IronPort-AV: E=Sophos;i="6.06,211,1705392000"; d="scan'208";a="29913648"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 02:54:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,211,1705392000"; d="scan'208";a="10626282"
Received: from cpetrove-mobl.ger.corp.intel.com (HELO [10.249.46.111])
 ([10.249.46.111])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 02:54:18 -0800
Message-ID: <29091195-93fd-43c4-a2be-f90e4dd174f0@linux.intel.com>
Date: Thu, 7 Mar 2024 11:54:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/xe: Nuke EXEC_QUEUE_FLAG_PERSISTENT
Content-Language: en-US
To: =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20240304140514.24768-1-jose.souza@intel.com>
 <20240304140514.24768-4-jose.souza@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240304140514.24768-4-jose.souza@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

For patch 2 with the errno inversion fixed, and 1 and 4:

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

On 2024-03-04 15:05, José Roberto de Souza wrote:
> This is a left over of commit f1a9abc0cf31 ("drm/xe/uapi: Remove support for persistent exec_queues").
> 
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_exec_queue_types.h | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 62b3d9d1d7cdd..9cc689f50db00 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -76,14 +76,12 @@ struct xe_exec_queue {
>   #define EXEC_QUEUE_FLAG_KERNEL			BIT(1)
>   /* kernel engine only destroyed at driver unload */
>   #define EXEC_QUEUE_FLAG_PERMANENT		BIT(2)
> -/* queue keeps running pending jobs after destroy ioctl */
> -#define EXEC_QUEUE_FLAG_PERSISTENT		BIT(3)
>   /* for VM jobs. Caller needs to hold rpm ref when creating queue with this flag */
> -#define EXEC_QUEUE_FLAG_VM			BIT(4)
> +#define EXEC_QUEUE_FLAG_VM			BIT(3)
>   /* child of VM queue for multi-tile VM jobs */
> -#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(5)
> +#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(4)
>   /* kernel exec_queue only, set priority to highest level */
> -#define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(6)
> +#define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(5)
>   
>   	/**
>   	 * @flags: flags for this exec queue, should statically setup aside from ban
