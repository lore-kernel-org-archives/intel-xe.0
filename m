Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D897DC71136
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 14:27:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A208D10E3B3;
	Mon, 16 Jun 2025 14:27:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iT28kobm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC7D210E3B3
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Jun 2025 14:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750084063; x=1781620063;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VoP+n8inn4fItwCPopbdSbkkNyYqFV2rQu0/TlrCL+M=;
 b=iT28kobmwtXKTh4vB6bjtjgU7mHIL3pWB632niQmm9k9SlwWmRMzREqR
 mjb5DgtyCoeRqS2mVFiDzdKBKztVQYFshF7iXaH2si1vT+FqeCvKTTyMq
 D+HPG3mbtkiKSBouY9aIePbE0EmsOpPTk+fPhPNu9xQnAVbCjjcVfGG5d
 u8rvxSTBMgO5unOQORjsFTZ8lNOmvBGxJb0EYK94oBc8xfi9SeakKm/gQ
 qBriGgHYiShCUQtxbxqp8jLIE/qdR/ATaVUYXwRsqW5PbYFM3sNL+hq1S
 Fmu74uI3P/VZVU/zsXcHJ3pWafx33+KzvAlAUyqBASgVhXUn+q0A+fBSJ Q==;
X-CSE-ConnectionGUID: uqEPlLz1R1iP7UIWGhTL5w==
X-CSE-MsgGUID: 9usxFUQJQQ26laW+oceDTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="51341688"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="51341688"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 07:27:33 -0700
X-CSE-ConnectionGUID: Ogk7fspnSjyT11/9729UUA==
X-CSE-MsgGUID: xP7nq2GkQF6ZjmAPQ32ASg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="185747230"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 07:27:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 07:27:32 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 07:27:32 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.67) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 07:27:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=USe2bxzYm8RopTwQFbAxjF6/uWGAjYTpBW5G4d1j3srQgCClx/HHJMkSxp6ZoEcz3nKJKm0eCvi5+2gdfn5nRMGp1EfRPdqRQ8HSl3JMySXvz/qRTwE982C3mtwv0I3I1tD3PFSLzSDy0/bfKW6ddnkrjqh4ZmP9xl4Xrdv1BR8QNV/Cg3h969a7lSraMSYypom1d7wx25FZzbIYEdonBchuDqtvg7Vnhs9w9d58ZRo7fsh6fUifFPC5zILH6O6qMmwnCsoRGumnhW8Qu6Oi1jTnxTCcVqC2DL380BVSBfnmeQx7AzUO0B7iknEMSogIFKULQxMYnXpYnYV/V0A3qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9ZITWAeymW/nuewaw7rKI9R9AA6SlQfHb4nW6PbXBw=;
 b=zDU8Z7zH5ADoegRs0JWMkxnb1cEY45nJHogkKH1v/x4sb7jHCW5zag26dEr2hfDpHvY4w0LWB6X4BKTWXiktBiFvdez3cY1aiEIj9UDT0xiQNSFcE4nw+dYHDWoauUvRquHkW/TkVcfX8MpvCs15JE4qLSHbYPvMLCeOYsbnJgGm9WsjDp1s8/Zas5q6PxfeLx5gDvEk+u3UgyYcA8L3Jzy3QHJAiLBA0RBmOxGXxItfNvZpm1vVNwEJVHCrYhKUYRoQoQNbJf6s3pPDlvzEUl1zMPrByw/PCpyF9peeLlJ8lDszGhBIwV+Vi72+F4BLyjxAEHqWNjK/BL6bnrR/gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CY8PR11MB7036.namprd11.prod.outlook.com (2603:10b6:930:50::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Mon, 16 Jun
 2025 14:27:03 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 14:27:03 +0000
Date: Mon, 16 Jun 2025 10:26:57 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 "Stuart Summers" <stuart.summers@intel.com>
Subject: Re: [PATCH v4 1/3] drm/xe/guc_pc: Add _locked variant for min/max freq
Message-ID: <aFApsaqg0KR-F0wv@intel.com>
References: <20250615-wa-22019338487-v4-0-704830697cbc@intel.com>
 <20250615-wa-22019338487-v4-1-704830697cbc@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250615-wa-22019338487-v4-1-704830697cbc@intel.com>
X-ClientProxiedBy: YT4P288CA0062.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d2::17) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CY8PR11MB7036:EE_
X-MS-Office365-Filtering-Correlation-Id: 40d6f046-b90a-4bf0-ad67-08ddace1dcc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5ArxAw3cWKaoSrr+RQXcvK+FSTlIg9Z+HSziJVB/fUxQ6UomEpxfu+EVpavL?=
 =?us-ascii?Q?YbFKfIFc9biM1QQzuA9NnJe+oY0dcRWdK8hSmYUd/5X1TdRlJ0PQgLMGiw6O?=
 =?us-ascii?Q?WVjkc8hRasupoZdb8l76P+lBMnOhOaTaSd1N/dMS6vz27ooaBlFGvi9vWTHG?=
 =?us-ascii?Q?z8mrjq0b8aD1db7Qmy2egu54SXMQ1TAGlgwpcG9FbtBSPyJTVgxIVktj3l02?=
 =?us-ascii?Q?qoURkYGlo8T5wIKfswP3Exy8yobXyH6u4UTsdPO7CR6DvDdjIoFtMgpbLmYZ?=
 =?us-ascii?Q?YwF33SM/pStQIlflXY8yG8zDeF818DswCVlTrkj7kb4ce8bP6eVwSafWbstJ?=
 =?us-ascii?Q?Ta0cVDw6dLP8SBWNJzDCvGUWGW7X71a8g1u74rggHXlt5WlrhTgJtAkpgZxS?=
 =?us-ascii?Q?/Q7PGPhl+U3xmrYRXagF3GTpLpW6bgi2GNNCNjZaEILWufrj/jmMsEJk/AFe?=
 =?us-ascii?Q?jj3k/oTmfoCFCcxXjZiLaSTBdobuKaPpLp4COWWUx2dAUrFesn06RufRkZX5?=
 =?us-ascii?Q?rp5DPJQj4iA/SFQXkimCfNixdbIefYMNNF9+XP0mynJLj79Lxq2N2oVxQSG2?=
 =?us-ascii?Q?R4IgyA0ZrHqtpqhdugxAmj5+UlXtPi1bXKVxEDd6Kj1ZHf87VRDnSo5/E4eX?=
 =?us-ascii?Q?kTo61/2kSu8vnXPVJeBxkGwSdFERtab1240GT3DYT+KrVlElaN3EX3H4f7ko?=
 =?us-ascii?Q?jItsvtM4PU81xIjDaVXHESNyahGkqXYn9kjhnfs3NDtlZY05Ty5aKF5dBojR?=
 =?us-ascii?Q?UGuSjyKvzEaNTbpJoO6504KFGxt5qYE0cVDm4JMoQvT1w0rI8wl9QrvKiAZa?=
 =?us-ascii?Q?wf1rbYbKl2xVzxBrgSNu2joz2GPV8V2HhDePTt2T12FA2tIk4jeWQLAcVCEY?=
 =?us-ascii?Q?iu2+VDQazFEDxjt2pRs9Im59qHazKU7rcPwC5nGH8uOR47OZSKnUiHnNVC26?=
 =?us-ascii?Q?58urwoovgCLKyOEusLf1JcKw9kKM/zbfkrBP7HwNvPC6TVIF82RV/ptsU0B4?=
 =?us-ascii?Q?295+O7YvGLlYZ49lDCdoHvvYNuRVBtV4uElvhFXexOp6Vebl3dSXfX+UwZvP?=
 =?us-ascii?Q?WkzD9O8vl5A0txlMDhiJ7EbFn/br8EYygK6H/eaSKAXrEtjEzGjj3DmT1aFz?=
 =?us-ascii?Q?flGiYSlCRIddIcTP/KBiL74lmg27ceNd4V0zz0+5gE43RiCK1afgaO+g/2xm?=
 =?us-ascii?Q?zni2QwxvNPfM2jZ5jniLMPniHyczoRQb7SC2TU43+/HBVBpiosCePFXLYJrE?=
 =?us-ascii?Q?eXWW1GRIPG0tkCznMy8YkKg8g+GzLbFSSGuruMkCr1WDuqCJAXETBgPrNAqW?=
 =?us-ascii?Q?OYnRU+oL5uViN99DA0homnOfn/c21D1WeUagwyiqi3Fk3L5EutoTsi+2Cdol?=
 =?us-ascii?Q?djNwVW8HDjapGh28sCR9p1WtqUEW8d9Vt/rgXdhStdMVZO4hTHoCuIOxG/MK?=
 =?us-ascii?Q?ppIJTC6lXQ4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QYTD7xgOv0UY+gRsoXMj9ChsDCxz1dRezIeI/PAh6qp9nrU55vBJmGSf5OYv?=
 =?us-ascii?Q?ZAqy1n45cZ2nzgwTX7SL84Jb0ohVRxGAyaIuiZC4VAJ+eCr2ng2BT36jr+Sx?=
 =?us-ascii?Q?Qj67qb6TT1POo6L/mPjX3druT2aaJIYHW/YwOhL7ODxpdiuF5ez2WzHZ0eqC?=
 =?us-ascii?Q?bbxyxQZn+4NVzU5VqfnVr+GxlPQd18iSmxOgrOdmhRTg9uhJX2rv0moX71dr?=
 =?us-ascii?Q?jjAo0/xnAIXXD9lOO9aQlCvlQVujnh1GvL1cOyPhRbGzBn0/XuxNKDHTY010?=
 =?us-ascii?Q?T8v4MlUwMctI9WcDqOiX1k/VKFrUvkdgwSxH07kit9C1n4HimC/Tqk66rHmu?=
 =?us-ascii?Q?4oyuWG528E2H3Lmk0+jwnwVFjzVPhGfIaGfNHLT57dmPXS0BIaaujpL22xTK?=
 =?us-ascii?Q?Eg/iJoBYS9Fi2gUfCg5K54NPfBSsqmiVk5kgE6SF91kmo5pQP3jxPQc7BlrH?=
 =?us-ascii?Q?QZypx77VQP4wDbCuzNWLw7kMRUy0drug8qqyT1RCV/QhBCGGp0w6eZC40Yqx?=
 =?us-ascii?Q?FzYWYnJ3Vk3OyYQ2Vms5bfQaCkbr7STlz4PbQ4qqDYHie1XsJxhN9eQ78HXI?=
 =?us-ascii?Q?Nz2odV2Cju3TaPf1tQxveNfWLR0wJxppA7gR+r6o+klzvQER/Uqz3UBb+yHE?=
 =?us-ascii?Q?0wz553vfFOi+KUb5rMX/j/j+laGwM36xvkIohuszdclhdSvpKqQ2+A4vik+h?=
 =?us-ascii?Q?CH4w/Deaa+iavjgDCMsifeqyovle6LTaTnxCdevAOCAzmsknrTvTSw2tggWJ?=
 =?us-ascii?Q?yaFKyIkbjlIWhVdwz+MI67qVPE9XDtWPgFLNTV2WMJaUHeUXg+5rxVRgJTKB?=
 =?us-ascii?Q?MZW/rIEdMB3LZv0g5aW2TGrNgbmw8rghl9Jj+daJ0TQu7qEL1MjoWTKp+LPm?=
 =?us-ascii?Q?9c2gbDFFTTvhZd9goKe7KHP4DdU/sZgwyUMCgweL6ZGy8phUlgFzEHu+CFt/?=
 =?us-ascii?Q?4OgrFmgHnqlw9LzpCKzSLYo5+bfiGHo6Av37CtMDIUVnI+cKpkOvNGYo1QcD?=
 =?us-ascii?Q?cXOu2rmpQ5R+ucrqL/gY+yBExGBvGGSGsLzLXSCP9rkac/aIhAC4X4GybrtW?=
 =?us-ascii?Q?29dPZ8KtDuQq0H64TXbrQMOXXhypZSl4ZPKvGtclnSMjDsNFSwi92uL688Rd?=
 =?us-ascii?Q?UohqC5GuKAEOPgY0OfNxBWdt9nbdQR7aqg61jIfpDRZaizlesRhXJSJY8fRc?=
 =?us-ascii?Q?Q9aVw7XlUQ57x1TaeZXwRonFIIAc37BYGdIo4a0PQZ+xZUgmIvwe/pMP6itl?=
 =?us-ascii?Q?79LqwUJUvA17XfQewMDi+VkXowEiT+sWXjPCZhk8UNSYurhmF8LGuHyooyKO?=
 =?us-ascii?Q?Cek+2Mx80Lm2QEjSgqr1MwyT9iVllGxepIOssXYAFoKH7H307P2qKN+Z9iUu?=
 =?us-ascii?Q?hX/vEQmVAs0NQHrJI2MmywBUAMM8cgjopXp+guwDF/tlhz7EYTv7uNwaBWgO?=
 =?us-ascii?Q?A5+JE2I2Zlt17/bMK4mODIHRCnGrSKzK2QpOwIuFRB3D9YY5Tm9fbFJo711a?=
 =?us-ascii?Q?2+NN6eCLxjck3teU2ILwRkSh1xNiZ0EfNjOaL+GoqpVtzvw3hBTP5nbMkqEE?=
 =?us-ascii?Q?dfTzhVN9WPztZMPdzJ12GnuPTxSPhR43od8l9JKA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40d6f046-b90a-4bf0-ad67-08ddace1dcc8
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 14:27:03.1161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nHTi4jYmIOeS3HhUxMYZpaXs0E+9k9gl+D06ilG1wts7cl8orHMDYiXa04fBH6XwNLJjomAfHWxk4GbFPw4mDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7036
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

On Sun, Jun 15, 2025 at 11:17:34PM -0700, Lucas De Marchi wrote:
> There are places in which the getters/setters are called one after the
> other causing a multiple lock()/unlock(). These are not currently a
> problem since they are all happening from the same thread, but there's a
> race possibility as calls are added outside of the early init when the
> max/min and stashed values need to be correlated.
> 
> Add the _locked() variants to prepare for that.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c | 124 +++++++++++++++++++++++------------------
>  1 file changed, 70 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 39d2acb2f30f6..53aaf937d4bec 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -5,6 +5,7 @@
>  
>  #include "xe_guc_pc.h"
>  
> +#include <linux/cleanup.h>
>  #include <linux/delay.h>
>  #include <linux/ktime.h>
>  
> @@ -554,6 +555,25 @@ u32 xe_guc_pc_get_rpn_freq(struct xe_guc_pc *pc)
>  	return pc->rpn_freq;
>  }
>  
> +static int xe_guc_pc_get_min_freq_locked(struct xe_guc_pc *pc, u32 *freq)
> +{
> +	int ret;
> +
> +	lockdep_assert_held(&pc->freq_lock);
> +
> +	/* Might be in the middle of a gt reset */
> +	if (!pc->freq_ready)
> +		return -EAGAIN;
> +
> +	ret = pc_action_query_task_state(pc);
> +	if (ret)
> +		return ret;
> +
> +	*freq = pc_get_min_freq(pc);
> +
> +	return 0;
> +}
> +
>  /**
>   * xe_guc_pc_get_min_freq - Get the min operational frequency
>   * @pc: The GuC PC
> @@ -563,27 +583,29 @@ u32 xe_guc_pc_get_rpn_freq(struct xe_guc_pc *pc)
>   *         -EAGAIN if GuC PC not ready (likely in middle of a reset).
>   */
>  int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq)
> +{
> +	guard(mutex)(&pc->freq_lock);
> +
> +	return xe_guc_pc_get_min_freq_locked(pc, freq);
> +}
> +
> +static int xe_guc_pc_set_min_freq_locked(struct xe_guc_pc *pc, u32 freq)
>  {
>  	int ret;
>  
> -	xe_device_assert_mem_access(pc_to_xe(pc));
> +	lockdep_assert_held(&pc->freq_lock);
>  
> -	mutex_lock(&pc->freq_lock);
> -	if (!pc->freq_ready) {
> -		/* Might be in the middle of a gt reset */
> -		ret = -EAGAIN;
> -		goto out;
> -	}
> +	/* Might be in the middle of a gt reset */
> +	if (!pc->freq_ready)
> +		return -EAGAIN;
>  
> -	ret = pc_action_query_task_state(pc);
> +	ret = pc_set_min_freq(pc, freq);
>  	if (ret)
> -		goto out;
> +		return ret;
>  
> -	*freq = pc_get_min_freq(pc);
> +	pc->user_requested_min = freq;
>  
> -out:
> -	mutex_unlock(&pc->freq_lock);
> -	return ret;
> +	return 0;
>  }
>  
>  /**
> @@ -596,25 +618,30 @@ int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq)
>   *         -EINVAL if value out of bounds.
>   */
>  int xe_guc_pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
> +{
> +	guard(mutex)(&pc->freq_lock);
> +
> +	return xe_guc_pc_set_min_freq_locked(pc, freq);
> +}
> +
> +
> +static int xe_guc_pc_get_max_freq_locked(struct xe_guc_pc *pc, u32 *freq)
>  {
>  	int ret;
>  
> -	mutex_lock(&pc->freq_lock);
> -	if (!pc->freq_ready) {
> -		/* Might be in the middle of a gt reset */
> -		ret = -EAGAIN;
> -		goto out;
> -	}
> +	lockdep_assert_held(&pc->freq_lock);
>  
> -	ret = pc_set_min_freq(pc, freq);
> +	/* Might be in the middle of a gt reset */
> +	if (!pc->freq_ready)
> +		return -EAGAIN;
> +
> +	ret = pc_action_query_task_state(pc);
>  	if (ret)
> -		goto out;
> +		return ret;
>  
> -	pc->user_requested_min = freq;
> +	*freq = pc_get_max_freq(pc);
>  
> -out:
> -	mutex_unlock(&pc->freq_lock);
> -	return ret;
> +	return 0;
>  }
>  
>  /**
> @@ -626,25 +653,29 @@ int xe_guc_pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
>   *         -EAGAIN if GuC PC not ready (likely in middle of a reset).
>   */
>  int xe_guc_pc_get_max_freq(struct xe_guc_pc *pc, u32 *freq)
> +{
> +	guard(mutex)(&pc->freq_lock);
> +
> +	return xe_guc_pc_get_max_freq_locked(pc, freq);
> +}
> +
> +static int xe_guc_pc_set_max_freq_locked(struct xe_guc_pc *pc, u32 freq)
>  {
>  	int ret;
>  
> -	mutex_lock(&pc->freq_lock);
> -	if (!pc->freq_ready) {
> -		/* Might be in the middle of a gt reset */
> -		ret = -EAGAIN;
> -		goto out;
> -	}
> +	lockdep_assert_held(&pc->freq_lock);
>  
> -	ret = pc_action_query_task_state(pc);
> +	/* Might be in the middle of a gt reset */
> +	if (!pc->freq_ready)
> +		return -EAGAIN;
> +
> +	ret = pc_set_max_freq(pc, freq);
>  	if (ret)
> -		goto out;
> +		return ret;
>  
> -	*freq = pc_get_max_freq(pc);
> +	pc->user_requested_max = freq;
>  
> -out:
> -	mutex_unlock(&pc->freq_lock);
> -	return ret;
> +	return 0;
>  }
>  
>  /**
> @@ -658,24 +689,9 @@ int xe_guc_pc_get_max_freq(struct xe_guc_pc *pc, u32 *freq)
>   */
>  int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq)
>  {
> -	int ret;
> -
> -	mutex_lock(&pc->freq_lock);
> -	if (!pc->freq_ready) {
> -		/* Might be in the middle of a gt reset */
> -		ret = -EAGAIN;
> -		goto out;
> -	}
> -
> -	ret = pc_set_max_freq(pc, freq);
> -	if (ret)
> -		goto out;
> +	guard(mutex)(&pc->freq_lock);
>  
> -	pc->user_requested_max = freq;
> -
> -out:
> -	mutex_unlock(&pc->freq_lock);
> -	return ret;
> +	return xe_guc_pc_set_max_freq_locked(pc, freq);
>  }
>  
>  /**
> 
> -- 
> 2.49.0
> 
