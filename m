Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E656C3DA7F
	for <intel-xe@archiver.kernel.org>; Sun,  4 Aug 2024 22:37:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA1A10E057;
	Sun,  4 Aug 2024 22:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gMGf/rSS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB9F10E057
 for <Intel-Xe@lists.freedesktop.org>; Sun,  4 Aug 2024 22:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722811060; x=1754347060;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Bj6w7TrlNlSzKUT25cqsz2OwAV2q4lIwupmFlLFAxzc=;
 b=gMGf/rSSGcRyTyuHHMSNjhxOuZIWwZn5k9SJq2okjvv1gWw9R2PJccG5
 5dbkH7mTQ2pAblhwUAAsPLLkqDmn/KI5Eua2SqoLIAIaxMOs/jWouBcWS
 eJGWinF2G4B89ALRQuqrc+35vNVttTokPSMMHpbOTmvia3nrPEaZNYnYi
 zk61JD7KkCRbCVHYIXfW4DlpYCJgo2Nd6l5xx1Z6b6MvsVEigv9d2XjLc
 kNSJvd+psdnOc40fN+MJCyIQvNabvmuZGDAvDE0Eih9w/gLwszPupKBt6
 gB6zCpTyFQ0aFGLkeRFuGB6O0+gIBoQkRlpCPk0fg6rfH+eveQvi+Romk w==;
X-CSE-ConnectionGUID: SfK3Fh03QXalR+/KjdGBDg==
X-CSE-MsgGUID: w7cG3NzfQH6GJewDlMZvOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="46161610"
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; d="scan'208";a="46161610"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2024 15:37:40 -0700
X-CSE-ConnectionGUID: YrtxXqSlSH+tTzaPO/GOPA==
X-CSE-MsgGUID: fy70hoBOS4OJ6kr8Vy1f4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; d="scan'208";a="55849730"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Aug 2024 15:37:39 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 4 Aug 2024 15:37:38 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 4 Aug 2024 15:37:38 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 4 Aug 2024 15:37:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UpF9o6uQhfiwcDF3x47eBaMXGEgpbss552jrNblxS6YC7jv29kjfa0xFLDJKvEdbIHNw+nvnEHdukeJpkT2LJ9kEnphMcKJV6RxRcgKnpofZDfzK9j7R1fywolihSiXmeSa/2e011CoepGjt5vlHXrySallLloP55jsSy+6CA8IBv22OcnQ1WeXSKv0rmgqOD3NDshabxlcrHK+yHeOLY/wvDR4eOqKXp/mHW46qD/lfteKYsqYnG9xNpyQtOapGphpEODbDCLiJEFx2y0Bjik6e/oPPus1+Ffn2bpkQpqN+PqJKvfzvSVqQFUTcufpabxqFSU3SH/VjwI8EtT9/qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9hLva+FiyW7PYA6OwJ+N+l08hskhMYbRlWiO3iIprtU=;
 b=hw2iKwXlDK4gJqGiBpQEAQzgAZ2LcnfJbHUAs4/n4wPxFMKMR8qnd1PIVnhuykuGu/VFHU4bVxLvGNRHyrRgdO1X2HIBm5XtcUXujwhR5Sm3RFlSzDJp0qVdKU05W02dN60jIfUrvZEJ22Qx1UfR7UlVf8HN9hm791v00/4sY3iosLGAqUR/bdrRaPg+xt7HsksTNZP59nPrLi9+FK2j4pKMeRcTFQK2oi9pAIwiGL4NEXDjppeokPzSIwFM/L+k8jG4VwA2Z39/bp/2nFeGzLbmuEvqZDWe3G9hjTBVlA1O/JAHlKT6GUiMoPpqtv5nj3fSEkDWt1qDichRFuvbNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB8021.namprd11.prod.outlook.com (2603:10b6:806:2fd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Sun, 4 Aug
 2024 22:37:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.023; Sun, 4 Aug 2024
 22:37:36 +0000
Date: Sun, 4 Aug 2024 22:36:30 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH v5 8/8] drm/xe/guc: Add GuC log to devcoredump captures
Message-ID: <ZrACbsc9phJWZI72@DUT025-TGLU.fm.intel.com>
References: <20240729231753.3101070-1-John.C.Harrison@Intel.com>
 <20240729231753.3101070-9-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240729231753.3101070-9-John.C.Harrison@Intel.com>
X-ClientProxiedBy: BYAPR06CA0072.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::49) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB8021:EE_
X-MS-Office365-Filtering-Correlation-Id: cb2c105e-ab01-42b2-25ea-08dcb4d609d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wBPUpvRQ2AQ6fq+no/Ga6wxbzKD4ZIDyZgSRpeG5sadeX1PWH9PREsr1mL0W?=
 =?us-ascii?Q?mBYwEzmnf9bcVoR4rOWtk4L3OshTSvvY9hgjq+Nv1k/WKdHTyVbvCT6uTT2B?=
 =?us-ascii?Q?0IWO1fw9oQlSnx+dEuwDqYUBjvo3Krt+81tJPDCN6OIloo+dwyv1fjhY95W4?=
 =?us-ascii?Q?Frrh2ok9DiLJmzoYzlU29J+FjB4uRMnIg0OTgafJh/ebyHzY2djUqn3EKBg7?=
 =?us-ascii?Q?UJBZmndhLQeGDmA1/XwEms3KyzVCcEDfnMCUAia+nMlX4XrVIgkFSaPgboZq?=
 =?us-ascii?Q?HnoR8KJTyhxVTqDAWGpnCuFH7aXeB6W894gooEUEqZ0sMLJXBgYN5ykDBiGn?=
 =?us-ascii?Q?1tN+bR3kye+HEBFIDe9tSO92YaFJKy/5NeRbnTcWI/IMgS4GQo5L1VYX87Td?=
 =?us-ascii?Q?OjhwxDc7yyguHNe7Rgyt7BiHqNWzI42PsrmFsuwTa2lwE4KICiNhe5ruNbIG?=
 =?us-ascii?Q?dSvI5kUEok93wQFwlr0OQSRu9kXyGSyFexLrE/jfmPGxk1FRu6bwh87VWz/g?=
 =?us-ascii?Q?MzZxlzdpW/BNsZEsGW6GdQnYxZUy5tlGSdtxk4GJZP0QWsfl7gm6gtNJpLox?=
 =?us-ascii?Q?MC6BvR1iHzZc9u2BBMhBc9Y96/IXB6HIi5GbNuHgZf05AcBeFE3+ceS7PV9k?=
 =?us-ascii?Q?ETYZrINQ3dhmYFUmloH0hg6+fT/dEaXl05FpixTlB4CBQoI9SD4mYD7HZrps?=
 =?us-ascii?Q?iu0c46ovPTiLptzlWyAt0Cpzht4fClj8K+NykVI77NzyzRtSN7rdHQ7veqC9?=
 =?us-ascii?Q?bZfw7vsaw2GbxtH41Nl0KpIhUhcbJaH+vaGEWG/bT7dVXHY+mkIZAwzz2Cd5?=
 =?us-ascii?Q?nfe6F5SSyWo5N9BL4nywXfspUBPPB6ux2IHvv6roywSD1C7v/Kgi1/3M3BY2?=
 =?us-ascii?Q?mhduja72hRmMSSGLqMonicaFJgmDjy2puiFnw4+gxmOaMA3RoF1vatGwp40V?=
 =?us-ascii?Q?wTMHFqlbauBrhcCS0ItVWFCgvc4fPUYD3RU9aPNbPDzu0XSC64UXGO+npa8P?=
 =?us-ascii?Q?Wsu8uh0jTEh0wT+1xMr3o4DkG1vVMUcEg8DOQzpd+/nuBLmK40xtdgmVt/XE?=
 =?us-ascii?Q?N6D8C89iC+0JjPexAEAA3j34Z4C/iRdxghM/gfaWSc0S+ZA3DmDxiMcv5qpb?=
 =?us-ascii?Q?PxARaLIeEoDcqXusneJiXSMCyzzYWRd2EBmXv91ozfQKBU44YBnH7VqKmsh/?=
 =?us-ascii?Q?bdciSu1LOeUm/C1TWqn7MJmplh/e/4x8mr2btCv10OdeNGihRPbf0vOnbeEV?=
 =?us-ascii?Q?q4jyEvv7+Pxl0gXqbbTaw7n1aPuAvE29/0eiJBWR95B9h72/KkuHvYSVDPrJ?=
 =?us-ascii?Q?5F4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GntMHA4+hHPH9w02iHX1DkmHEDt1KdvBfbJ70RlYD1icofzu19ncV4Tftaae?=
 =?us-ascii?Q?Z9aSl+k1VnuOR3sB0DRP8tZqaAHE0DiVX44mMutG2wLHge3Wh3w8SxckSCJR?=
 =?us-ascii?Q?d+w9LvB6fH79iYwv6TseeJH5EogmtJvp0cNPvZzz78QQ0H1QlCoND2wsS5QR?=
 =?us-ascii?Q?Pn+LMNN7QtKvCCl3JiIrmUbc9OVfMv81bzlSsioVU3vCR3f+RdfCfcSBGZL8?=
 =?us-ascii?Q?+waJHJv0ncMQ6SokHO4g2wE0C5TLZzNc0OHjWD0f1g1N4iRax85l28FkdqeL?=
 =?us-ascii?Q?qQiO63gh4CmA2BTRK9KgZ4lNzjdOxxfFQ/m/IHc4pVpUYTMbRi83WbHTpn8V?=
 =?us-ascii?Q?IbLyoUUy0ZQIKpyM5jwwsF7mWDn+JAvphtaUHtKE02gtczD6fwm1e1/omBzW?=
 =?us-ascii?Q?GmT5n4Dj68XElSnRWNCl+NA4GWBoIN56UcJ4+24j+u4mTLIxsQiuIhrc7VHf?=
 =?us-ascii?Q?PncAFdhAfB0YFD7uyDQ9U+A6nRm0+CYre41uFfS6udNllZxuQo1Z3n/li0u+?=
 =?us-ascii?Q?T/kv/h38yzlnrLIh1575X4nn6C7nqsjKz3aqBn0fBZKfYoRU/9eNBz+ynlvN?=
 =?us-ascii?Q?gujh3t235nynxQSQKunS6U65JKWFUnDN1rcOg78uYIFLjARkbcfJnp3MjAiJ?=
 =?us-ascii?Q?EqmQy5r7US3imgGjT6oaQglLz12ex/MfGai76DzmLU0t8SoFnIKyZtmUnEcZ?=
 =?us-ascii?Q?30ZPvumwjB0NU4d/IXIa9tO5MboSH+EHm/7w6RM5to94A0+AyMdi0OB3Kvgt?=
 =?us-ascii?Q?Y+y/PYhyMZ1cpU4CSg/NteitequGxcSEy8CR9lU/yWFS4hDF3aFR+fTJNBhq?=
 =?us-ascii?Q?PSJWa3Y4DVssJ/FgBgUz96icWFXMZns/U+SFJuxIqEZTX4PuTcJ4SnMuLSjX?=
 =?us-ascii?Q?NSW4FzcRO+4b/lrxTsVUBGNluAgmimUq9rxUoFqVK7vx8InGoXcrjT47RMyS?=
 =?us-ascii?Q?SEx9fpwzp1a8jNKS3svqh+HcbaVjau2MfdF5ZcgzVIvSXBn8Mnpy58rNXoPB?=
 =?us-ascii?Q?WxnDtWblj7PFl9A2RdCcoAD2+IWe2sJmovw2+aB389RyXETHLvGITVnhoN+j?=
 =?us-ascii?Q?4VU1JTZlcew0B6Oxnphd8TcOl332O1o+R60ln9+z0m7uTCDM4rtCCpLsqt4l?=
 =?us-ascii?Q?vrXzxvGaTbB97ucQwzIXSWZi2pvZ+aj6QOwo3RG9t3m5ylpBKCDTFSeJ1b3P?=
 =?us-ascii?Q?iV/sySV7AZ4vA+byYjkmpYv0WXp8Wm627CDcBet9GMPI1mPzCU+bwYEWbGS+?=
 =?us-ascii?Q?yfQYsxiJgeoO1eHK+rzbg7hK84XzNssDtXfHBV/eMYyZ/r83hxpaDgv99hbM?=
 =?us-ascii?Q?UJX/L/6miR1mw4a3SYdNu2Y5umlhPTpT+m3L561JnYPtczii6tutvwWc2sZJ?=
 =?us-ascii?Q?nYuni0LV6p4tkG7u/EBVinYf+z/jyzXxkI7BZRXjxWbRY/jRUs5e0guJuAig?=
 =?us-ascii?Q?WuFE8bx7qqeRLHB4LcwIUmhbIT2rvqZvTBjNns2DK9sNITOR/fnASLORzTmu?=
 =?us-ascii?Q?+3HnLq6rVvoiyywn4UgvD52D7rP69PIkkPKFBmZSQhCzpshuDmKdc5dTwTzn?=
 =?us-ascii?Q?OD4A/JmI86dXb1A1AX6799eMZkv+hWsjUdAGoGg6fNmjyRClh6Tl3SyoYw0O?=
 =?us-ascii?Q?hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb2c105e-ab01-42b2-25ea-08dcb4d609d0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2024 22:37:36.1423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cr6iVRSzohpg2KYbfGU6BWIkSuzmOA4XRWasAHyG5sQ2OEasrl8XWyjHNzWXdNRrcomrEVhw6oARbW51hZalYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8021
X-OriginatorOrg: intel.com
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

On Mon, Jul 29, 2024 at 04:17:52PM -0700, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Add an ption to include the GuC log in devcoredump captures. Note that
> this is currently optional and disabled by default. The reason being
> that useful GuC logs are large, very large when converted to an ASCII
> hex dump! And as they are not always necessary/useful for debugging a
> hang, it is not desirable to force all core dump captures to be huge.
> 
> NB: The intent is to add support for buffer compression to the core
> dumps. Then the log can be included as standard without being too
> onerous. At that point the module parameter override can be removed.
> 

Briefly looked at this series and questions / few suggestions.

1. Remove mod param to include GuC log from devcoredump and always
include it. We had a bug in devcoredump which has been fixed in [1]
where large devcoredumps took forever. This has been fixed, now
capturing a devcoredump around 256M takes .3 seconds so adding another
8M or so seems fine.

2. Instead of printing GuC log as hex, can we just dumped it as binary?
This is what we do VM mappings with dump flag set and LRC. grep
'ascii85_encode' for an example of this. It would be nice to keep binary
dumping uniform. Then surely we can update our scripts / tools to parse
this output.

3. Can we move GuC log in devcoredump to
xe_devcoredump_deferred_snap_work and just use kvmalloc? I suppose this
makes debugfs capture a little tricker?

Matt

[1] https://patchwork.freedesktop.org/series/136770/

> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c       | 22 +++++++++++++++-------
>  drivers/gpu/drm/xe/xe_devcoredump_types.h | 12 ++++++++----
>  drivers/gpu/drm/xe/xe_module.c            |  3 +++
>  drivers/gpu/drm/xe/xe_module.h            |  1 +
>  4 files changed, 27 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 08a0bb3ee7c0..b7c241bd95d5 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -17,8 +17,10 @@
>  #include "xe_gt.h"
>  #include "xe_gt_printk.h"
>  #include "xe_guc_ct.h"
> +#include "xe_guc_log.h"
>  #include "xe_guc_submit.h"
>  #include "xe_hw_engine.h"
> +#include "xe_module.h"
>  #include "xe_sched_job.h"
>  #include "xe_vm.h"
>  
> @@ -74,7 +76,7 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
>  	if (xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL))
>  		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
>  	xe_vm_snapshot_capture_delayed(ss->vm);
> -	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
> +	xe_guc_exec_queue_snapshot_capture_delayed(ss->guc.ge);
>  	xe_force_wake_put(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
>  }
>  
> @@ -116,9 +118,13 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  	drm_printf(&p, "Process: %s\n", ss->process_name);
>  	xe_device_snapshot_print(xe, &p);
>  
> +	if (xe_modparam.enable_guc_log_in_coredump) {
> +		drm_printf(&p, "\n**** GuC Log ****\n");
> +		xe_guc_log_snapshot_print(xe, coredump->snapshot.guc.log, &p, false);
> +	}
>  	drm_printf(&p, "\n**** GuC CT ****\n");
> -	xe_guc_ct_snapshot_print(xe, coredump->snapshot.ct, &p, false);
> -	xe_guc_exec_queue_snapshot_print(coredump->snapshot.ge, &p);
> +	xe_guc_ct_snapshot_print(xe, coredump->snapshot.guc.ct, &p, false);
> +	xe_guc_exec_queue_snapshot_print(coredump->snapshot.guc.ge, &p);
>  
>  	drm_printf(&p, "\n**** Job ****\n");
>  	xe_sched_job_snapshot_print(coredump->snapshot.job, &p);
> @@ -145,8 +151,9 @@ static void xe_devcoredump_free(void *data)
>  
>  	cancel_work_sync(&coredump->snapshot.work);
>  
> -	xe_guc_ct_snapshot_free(coredump->snapshot.ct);
> -	xe_guc_exec_queue_snapshot_free(coredump->snapshot.ge);
> +	xe_guc_log_snapshot_free(coredump->snapshot.guc.log);
> +	xe_guc_ct_snapshot_free(coredump->snapshot.guc.ct);
> +	xe_guc_exec_queue_snapshot_free(coredump->snapshot.guc.ge);
>  	xe_sched_job_snapshot_free(coredump->snapshot.job);
>  	for (i = 0; i < XE_NUM_HW_ENGINES; i++)
>  		if (coredump->snapshot.hwe[i])
> @@ -199,8 +206,9 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>  	if (xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL))
>  		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
>  
> -	coredump->snapshot.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
> -	coredump->snapshot.ge = xe_guc_exec_queue_snapshot_capture(q);
> +	coredump->snapshot.guc.log = xe_guc_log_snapshot_capture(&guc->log, true);
> +	coredump->snapshot.guc.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
> +	coredump->snapshot.guc.ge = xe_guc_exec_queue_snapshot_capture(q);
>  	coredump->snapshot.job = xe_sched_job_snapshot_capture(job);
>  	coredump->snapshot.vm = xe_vm_snapshot_capture(q->vm);
>  
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> index 923cdf72a816..6ac8da1631f9 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> @@ -35,10 +35,14 @@ struct xe_devcoredump_snapshot {
>  	struct work_struct work;
>  
>  	/* GuC snapshots */
> -	/** @ct: GuC CT snapshot */
> -	struct xe_guc_ct_snapshot *ct;
> -	/** @ge: Guc Engine snapshot */
> -	struct xe_guc_submit_exec_queue_snapshot *ge;
> +	struct {
> +		/** @ct: GuC CT snapshot */
> +		struct xe_guc_ct_snapshot *ct;
> +		/** @log: GuC log snapshot */
> +		struct xe_guc_log_snapshot *log;
> +		/** @ge: Guc Engine snapshot */
> +		struct xe_guc_submit_exec_queue_snapshot *ge;
> +	} guc;
>  
>  	/** @hwe: HW Engine snapshot array */
>  	struct xe_hw_engine_snapshot *hwe[XE_NUM_HW_ENGINES];
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 7bb99e451fcc..dd837125f397 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -37,6 +37,9 @@ MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size(in MiB)");
>  module_param_named(guc_log_level, xe_modparam.guc_log_level, int, 0600);
>  MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1..5=enable with verbosity min..max)");
>  
> +module_param_named_unsafe(enable_guc_log_in_coredump, xe_modparam.enable_guc_log_in_coredump, bool, 0600);
> +MODULE_PARM_DESC(enable_guc_log_in_coredump, "Include a capture of the GuC log in devcoredumps");
> +
>  module_param_named_unsafe(guc_firmware_path, xe_modparam.guc_firmware_path, charp, 0400);
>  MODULE_PARM_DESC(guc_firmware_path,
>  		 "GuC firmware path to use instead of the default one");
> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> index 61a0d28a28c8..81be7fb05bd1 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -12,6 +12,7 @@
>  struct xe_modparam {
>  	bool force_execlist;
>  	bool enable_display;
> +	bool enable_guc_log_in_coredump;
>  	u32 force_vram_bar_size;
>  	int guc_log_level;
>  	char *guc_firmware_path;
> -- 
> 2.43.2
> 
