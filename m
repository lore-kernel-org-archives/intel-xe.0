Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2D3C77B75
	for <intel-xe@archiver.kernel.org>; Fri, 21 Apr 2023 11:03:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1152210E02A;
	Fri, 21 Apr 2023 11:03:31 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F2710E02A
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Apr 2023 11:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682075009; x=1713611009;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Hq2KF2LDW42TaJmBfT0ntvhyIMeSVW7Jb8/EXuIzybk=;
 b=Kk554jpAm+U0BoRl11kacfzqXf9F9KBveyD1GOjhjj7ZJHWwv3q2oEP6
 f1EZ+GJA3W+HfIHH+VYLXV4x12N7XKYwWfHe2XvqHSBtQdgXOyOPYNRVG
 zQ4053kfVrNZ1Cz6M52I4yNJyjOAlvMJsBsn3zEmO6CoJxghYIpYQ6Mj/
 NxjxAjVxAqVtTZYcpaWlGNpdKs6llUk6Qpf65IyitrbKQ7SxKrgnsos4Y
 xiMq01S/+Q88nkmu0pce9OdOPngkSzvG2MsC4GZBWKFhT8h2eimA/C0Kw
 S0Nl8phM5j3fywi60TAsDwCyXenooQZ8UsjXnuaLOgy698MTKfM+nW0uk Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="330165965"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="330165965"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 04:03:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="724780116"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="724780116"
Received: from jpoulsen-mobl.ger.corp.intel.com (HELO [10.249.254.125])
 ([10.249.254.125])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 04:03:27 -0700
Message-ID: <c3b034ff-bbd5-f171-9342-b97c11480768@linux.intel.com>
Date: Fri, 21 Apr 2023 13:03:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
References: <20230406162625.320387-1-matthew.auld@intel.com>
 <20230406162625.320387-2-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230406162625.320387-2-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe/lrc: give start_seqno a better
 default
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


On 4/6/23 18:26, Matthew Auld wrote:
> If looking at the initial engine dump we should expect this to match
> XE_FENCE_INITIAL_SEQNO - 1.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/xe/xe_lrc.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index fb8c6f7d6528..ae605e7805de 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -700,6 +700,9 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>   	map = __xe_lrc_seqno_map(lrc);
>   	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
>   
> +	map = __xe_lrc_start_seqno_map(lrc);
> +	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
> +
>   	return 0;
>   
>   err_lrc_finish:
