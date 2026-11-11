Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1CD606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 19:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nb+tyGWH
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A6510FD9D;
	Wed, 11 Nov 2026 19:56:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1EB10FD9D
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Nov 2026 19:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794426994; x=1825962994;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=F4ZcmZIHGMrg4wlqxDdY1lQTaOFJ8zPe7uHjnavmsrA=;
 b=nb+tyGWHpv6ViK/Rh1UQG0kGPRuRYyWclZaRZMTHBR35vauwQX/GhwSu
 JSLf3IeE4rmHWKN4fT2jXUHY2swjxCzoA68TO24UM1WkyqnLedZTV/hWH
 aBFnSQGYc/jcOJ0msYxYq+v/bqLBeCZuFEDzeG6cAXu8hxNCjnCuwlrfB
 hEtrOoF41s7Rqsq7pcM+kheCe1aC51G6FF/R8/9kFaxoCvu2i3wGtNPoO
 1N9L4iy/0ylStC8vMcd4Ozl8QlOAVL4TMLRiWxlMmSubhXCGLxkRhWk1H
 o726vMxRdJeCyJKwY0Jf9ZIdYDk5JNIgF/cxjMdVcKDAmfCY1MEm6VtTW Q==;
X-CSE-ConnectionGUID: VOKpFT+0QBOOjvTQaxbf4A==
X-CSE-MsgGUID: kAPf1fhPQqGW0UX2OxiwVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3208123"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3208123"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 11:56:34 -0800
X-CSE-ConnectionGUID: bZ+QlBvJTIWy53+rHqjlcw==
X-CSE-MsgGUID: LTywExh6SWC6bitrhWTWog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8584256"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 11:56:33 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 11:56:32 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 11 Nov 2026 11:56:32 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.21) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 11:56:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UbcOzP4+PJlxmnD/vi/9sk8HJjWT8kKbNw9GtODC0I75W66Uc6uGHy4O3klninOGp7obCGx6e7HlkeD77BdmCmr7tNNRjL9R3IRQQZcUg7aW15cYqBRIUsBdgmLychu9PQH00A/FN+5khFG25VDaiVshgdqMueJZDKZqq0hs9UyL2Umjde+cL8y5E+JEKDBNf0NeVAqq4yL4/asSWwjp9kPJk+FvczpSM3WK3AlUNVKKo3+6Zr6xGVK/SEUUuF20Ao3Fxt8nVpcISmotVE7JFkzV4pRqZB9oQAeky9C5C+q+IR7CvPagSs8njkQ5qoJK3a5NKQaMlWm4sNudRwNY/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLqVH53DCCZ/YC3vRrtrhYa//AsabXm9vt0jXNtp3No=;
 b=Y/TqZclcOlvQIrdExfx8KgBnfhOZHO33o2Ka+YK8N+knId1NG8+09AZ6t4xdhGahChP0M/0qKSSfSf1wb4npExXiR7n9QsvsvzsaWctV0/OIhEMZwhSXhcf2HW0l+Dch0q+4dEZU4D/Kb0Yh0N4EEfrppm1ah/slhEwl2ZksIJvdQ7mdVPLy5leJxazv2QnwlTMW9D7640oNCceRX/UqXztcqGT9gvzRMAENrafX4rqNTe5w8f/XPWDJNPbDVnBAIhi5JEx+BgcBEAJzzqo7woJNpVx28TQe9dP7+A+39It3zviKJxOFcFg4kQAdA34P/qETr0Navxbl1v1GvdFaFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by PH8PR11MB7095.namprd11.prod.outlook.com (2603:10b6:510:215::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Wed, 11 Nov
 2026 19:56:25 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 19:56:24 +0000
Date: Wed, 11 Nov 2026 14:56:16 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <anoop.c.vijay@intel.com>
Subject: Re: [PATCH 1/3] drm/xe/sysctrl: Use preallocated mailbox staging
 buffers
Message-ID: <avTIYODcKWCDvi7D@intel.com>
References: <20261104215353.234314-5-stuart.summers@intel.com>
 <20261104215353.234314-6-stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261104215353.234314-6-stuart.summers@intel.com>
X-ClientProxiedBy: SJ0PR03CA0156.namprd03.prod.outlook.com
 (2603:10b6:a03:338::11) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|PH8PR11MB7095:EE_
X-MS-Office365-Filtering-Correlation-Id: 427dea7e-8ae5-4ecc-67ea-08df402ddcfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|3023799007|18002099003|22082099003|10067099003|261021135927099003|261028144727099003|4143699003|11063799006|261022075727099003|261026130827099003|261009223027099003|261026121527099003|261021133027099003|56012099006|261022113327099003|261102123227099003|261021130227099003|261021121427099003|261026135527099003|261022105027099003|261021123027099003|261022115727099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: lxDb29JILMK9+iOIsuxWrs2ajB+EZtJWBDhuqMfSfbyOerESJr9e+Wlc08c+POiiJqZfeB4xVGetym9QpnUlbMH5pnDROhRp+WfoXvlqCHnAq5WBWzpk+BN9fO/pNuhoZaUTfPN3wUzKBJmgdMq/l8RqvxPpRX2tBfHwUEYXQcbu6lOR9fo2sVKnzZyAlSgccHSvwHyP3PVWtdAz3LGW++V4doa+k4IE7wFdQszWnX+gv1TWphcjhnceWSO+6AIk5eEMyLuLdSbYlJpQSHC/I9lzTeqzGZTQdN8PRKZR+ZO5//6zX6cNww7Z8MbVy3tv3G+Wm0+WPIql6PhmrW42VCrXl9edoK0yeT1MUaRpcSnYqiMs1SjekmUDBX1N5eVYaPwk7IA2Z1LGF++KoQgSViK5cG6JQGWrPDujVbEsxJNUjBX/owGkLLqFcybXHLEH6AEwhBkxg2Ch2ngL2IprHVVnmAWA+tFMNrT2LekqcPhcDwr3mvRP+ixaPJ8qtrJsH1MhP5M+rTBH5o259OoqOSkbit2tg/CKh6rTK8+oMTSdlhnI/0ixmwx3sNglr0DeUNWW36GXa+dPSGpYUYAfDedM+uUfT9PCVUiMTq9Id4RmEQFIvBB8WhORX0Uipjxjs2c1AiT75uzg/OrUtEXzhBvfSEg3TOYKnkkY61QCuGQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(3023799007)(18002099003)(22082099003)(10067099003)(261021135927099003)(261028144727099003)(4143699003)(11063799006)(261022075727099003)(261026130827099003)(261009223027099003)(261026121527099003)(261021133027099003)(56012099006)(261022113327099003)(261102123227099003)(261021130227099003)(261021121427099003)(261026135527099003)(261022105027099003)(261021123027099003)(261022115727099003)(261026140227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qqn7RsrgzWMEwQaKbV/js9/0chr3d3rSmU3rfc+KFSO7p4WTKJaPTLUTEsyd?=
 =?us-ascii?Q?HF7xm6Lp83Ufdu4nn1ef18x3Am7+ZQApDx47N9uvM/iIOMoKr5nRwzQZOq5E?=
 =?us-ascii?Q?3w/M40GuLASzBfImvSuNLdNJAPUo9peK82jUurYLr0h9fWE/RXV+cdgdPFwr?=
 =?us-ascii?Q?ccoOvSIbNTc4SH24eRu88QY1qFQgI90f30m6NL7gWM8b8ve10MHlIshWWpCh?=
 =?us-ascii?Q?LIsuw3/pvQ0staBrmNaJTv7DGFz/TEwTZL/iSJ24i7tU7w4XAqWJ/gEXiMmB?=
 =?us-ascii?Q?mQ8BNh2BZP5pvTahl7i5M6pLT7W8z6iYkSmW8fzEqQ9hJf6p/7Cr21hd3cbX?=
 =?us-ascii?Q?RSl2+EwoTuQp9rHEw2+E3JoEQoXdeVMAvNGYaM7gAbzh185urfd4ECDaXkPs?=
 =?us-ascii?Q?7m6XLSztVvQwsPS8gMAuUNWqyO63nS3dP3eYuxsaUshadzVzuscQtU6SPaFg?=
 =?us-ascii?Q?xTE/SuSJTOcYC7qMlhStj91uZ91WYkYJwjlcXQjfUEqFer7rWk6Joe3m7gpd?=
 =?us-ascii?Q?W19Py3iEIV0zj82zFtxj5ZQBAOqlnNALY8ZTWD+sLnZl/3bZtA6+DHqVnu/r?=
 =?us-ascii?Q?gscQbBc8qklZ33TknlGm+NrZZTBVVb15aXEZw3aVnXqmT6vIWQ5X5axObjNe?=
 =?us-ascii?Q?pNNua9Y+NNBJC0e0hu/EGF1FfMCn94Or0Hms6wGokz+JrDcDDSypnv600pCR?=
 =?us-ascii?Q?JGfbe1PNwjd2HNoFTWqMFYSfprXt65ntdtsRSOT4yDm6w5M7/lSIKjVOyZjc?=
 =?us-ascii?Q?z45IwJEOFtRoRw/5qRXqTaW6Xn3p8hZcqrQ33UlVUE9Wg69752CHHMsYdnK7?=
 =?us-ascii?Q?0ZIsiXfHEkmiMul/Rq/YXh6pD5fsxYgxVPghyGkLH1q38RrG4k5+YpRci1Py?=
 =?us-ascii?Q?mNPHh4CMdZL76U0qpqhDw8ex7DjlXR9bl4npMYl0ekuu6by2AElbxPFKj1is?=
 =?us-ascii?Q?FGiDTVqt43UHkmqRkxjqe4q1UxQ0cuAVNrnLSBFUkisSRUOhzL19DjM7CV9A?=
 =?us-ascii?Q?Npm0jpjokmLBtRgW7YlW/9ik5rJwl1oTHRUOG0mdaJ7dK3XU0JmuTO3LHFL8?=
 =?us-ascii?Q?PVs6ESrRLN8uSwSIR5QVM2UHrZPAvx1nFRHzmiO5K1ylGOCHBh+Gkqeq+XQo?=
 =?us-ascii?Q?SbFAgLJeLkOeLXVjbzmMF3OjuLz2OVstEFfmYCzdxHFLCSlmdgQyDW6QBt2S?=
 =?us-ascii?Q?h/Qgg3oaTLqIow9q/nkUxzaggTmMBsE82r01K8z4oSG/KQsxOi8JSHJH0lr0?=
 =?us-ascii?Q?rF3JNbGrQhg6BjWiibQqjjr4cPfYVOdurPSVcdy20FN0JkpyHVHRoeNrimao?=
 =?us-ascii?Q?Hy8f81Kfyc6DLYVqLOVtTfZy0yUG2Ub6hY7ofs2c6YKYKbk03L47jdkd1TKE?=
 =?us-ascii?Q?imrJuvaZbQgnvTAaJ8Nb1yRcDvuV/1HydzDYmJsQ+IP4WdldZ3s+PXD1EW4p?=
 =?us-ascii?Q?5ijpauntu0fpqG5aWcmiVx8RDCNptZtSmUBhLNH1dry+drm4UIT7BtuXXBrP?=
 =?us-ascii?Q?cINF0ggUMj8qlSI0deU5jpYC9CtFoZ1PHu9NlgDacFzqUGtWcSfwrrTHoU2h?=
 =?us-ascii?Q?FfH+whWRJFyVjCDlrIvNaUPg80P/WJa7dsB66a5ifjEN/IQ54afRp4f7N4Bp?=
 =?us-ascii?Q?hTJswNGITD+WjNkb29xQ9ESqnLovoxOkcFSvCO1WIl581+BXm/RyK5Jw/VNO?=
 =?us-ascii?Q?adOflHvciY1QfbS2ZopQmQAE4T4oyabb57Vcwd5K8W187NAM0qeBW2s+1Zkg?=
 =?us-ascii?Q?j0vJHGw6bA=3D=3D?=
X-Exchange-RoutingPolicyChecked: MeoK/6PrwwQ+WHsCL/vZyoK1PUchuikfrw+NeWoMn7JPCJ8oZsb1j5ZKLpOzA/mPz8AXg+kfV28Xg5HbAZ+A+W4xtZN8KuOdUNOVLQuTXb8Je6ifkKu0gu+T/1QLKgAtVyg0p5Rv64ATwhgAi1Saf4NAdriCzULmJuWk7/B/aO7T2hKwstDOWLuLNny7wY8aoD4qzlKtyATmr0gDv9gakYPM5hJ2uqMATQsIrMYCJTcIvvREpq03bGxE4pIuhRHjexldIUnHB2cjwDXLBX8OZEO2H5ASuramYuSFTQGmlX5zZq0fEjKfFuQUWatNHSrENtF44egk0rXCVpgldR15pQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 427dea7e-8ae5-4ecc-67ea-08df402ddcfa
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 19:56:23.8953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ycoYEAUjz418DXU1VPfAUIuUiMI6WGqG9exHDrqsJ8yoWbCmzDJfgtJX/U1HsilyrSgiCBHZ9CBm3Ti+j7uDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7095
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 09:53:54PM +0000, Stuart Summers wrote:
> Every mailbox command stages its request and response through a buffer
> allocated with GFP_KERNEL. Both are bounded by the maximum mailbox
> message size and the command mutex already serialises every sender, so
> embed them in struct xe_sysctrl and drop the per-command allocation.
> 
> This removes the only failure mode from sysctrl_prepare_command(), so
> return the command size directly, and allows commands to be sent from
> contexts where a GFP_KERNEL allocation is not possible - such as the
> runtime resume path, which gains a sender later in this series.
> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 56 +++++++++----------------
>  drivers/gpu/drm/xe/xe_sysctrl_types.h   | 11 +++++
>  2 files changed, 31 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> index f1a231dfec1e..2af73c62d32d 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> @@ -6,7 +6,6 @@
>  #include <linux/bitfield.h>
>  #include <linux/cleanup.h>
>  #include <linux/minmax.h>
> -#include <linux/slab.h>
>  #include <linux/sprintf.h>
>  #include <linux/string.h>
>  
> @@ -103,36 +102,27 @@ static void sysctrl_clear_response(struct xe_sysctrl *sc)
>  	xe_mmio_rmw32(sc->mmio, SYSCTRL_MB_CTRL, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, 0);
>  }
>  
> -static int sysctrl_prepare_command(struct xe_device *xe,
> -				   u8 group_id, u8 command,
> -				   const void *data_in, size_t data_in_len,
> -				   u8 **mbox_cmd, size_t *cmd_size)
> +static size_t sysctrl_prepare_command(struct xe_sysctrl *sc,
> +				      u8 group_id, u8 command,
> +				      const void *data_in, size_t data_in_len)
>  {
>  	struct xe_sysctrl_mailbox_msg_hdr *hdr;
> -	size_t size;
> -	u8 *buffer;
> +	struct xe_device *xe = sc_to_xe(sc);
> +
> +	lockdep_assert_held(&sc->cmd_lock);
>  
>  	xe_assert(xe, command <= SYSCTRL_HDR_COMMAND_MAX);
>  
>  	xe_assert(xe, data_in_len <= XE_SYSCTRL_MB_MAX_MESSAGE_SIZE - sizeof(*hdr));
>  
> -	size = sizeof(*hdr) + data_in_len;
> -
> -	buffer = kmalloc(size, GFP_KERNEL);
> -	if (!buffer)
> -		return -ENOMEM;
> -
> -	hdr = (struct xe_sysctrl_mailbox_msg_hdr *)buffer;
> +	hdr = (struct xe_sysctrl_mailbox_msg_hdr *)sc->cmd_buf;
>  	hdr->data = REG_FIELD_PREP(SYSCTRL_HDR_GROUP_ID_MASK, group_id) |
>  		    REG_FIELD_PREP(SYSCTRL_HDR_COMMAND_MASK, command);
>  
>  	if (data_in && data_in_len)
> -		memcpy(buffer + sizeof(*hdr), data_in, data_in_len);
> -
> -	*mbox_cmd = buffer;
> -	*cmd_size = size;
> +		memcpy(sc->cmd_buf + sizeof(*hdr), data_in, data_in_len);
>  
> -	return 0;
> +	return sizeof(*hdr) + data_in_len;
>  }
>  
>  static int sysctrl_send_frames(struct xe_sysctrl *sc,
> @@ -231,14 +221,17 @@ static int sysctrl_receive_frames(struct xe_sysctrl *sc,
>  	struct xe_sysctrl_mailbox_msg_hdr *hdr;
>  	struct xe_device *xe = sc_to_xe(sc);
>  	size_t remain = sizeof(*hdr) + data_out_len;
> -	u8 *buffer __free(kfree) = kzalloc(remain, GFP_KERNEL);
> +	u8 *buffer = sc->resp_buf;
>  	size_t frame_size;
>  	bool done = false;
>  	int ret = 0;
>  	u8 *out;
>  
> -	if (!buffer)
> -		return -ENOMEM;
> +	lockdep_assert_held(&sc->cmd_lock);
> +
> +	xe_assert(xe, data_out_len <= XE_SYSCTRL_MB_MAX_MESSAGE_SIZE - sizeof(*hdr));
> +
> +	memset(buffer, 0, remain);
>  
>  	out = buffer;
>  	while (!done && remain) {
> @@ -360,8 +353,7 @@ int xe_sysctrl_send_command(struct xe_sysctrl *sc,
>  {
>  	struct xe_device *xe = sc_to_xe(sc);
>  	u8 group_id, command_code;
> -	u8 *mbox_cmd = NULL;
> -	size_t cmd_size = 0;
> +	size_t cmd_size;
>  	unsigned int timeout_ms;
>  	int ret;
>  
> @@ -380,25 +372,17 @@ int xe_sysctrl_send_command(struct xe_sysctrl *sc,
>  
>  	might_sleep();
>  
> -	ret = sysctrl_prepare_command(xe, group_id, command_code,
> -				      cmd->data_in, cmd->data_in_len,
> -				      &mbox_cmd, &cmd_size);
> -	if (ret) {
> -		xe_log_err(xe, SYSCTRL, ret, "Failed to prepare command %#x.%#x\n",
> -			   group_id, command_code);
> -		return ret;
> -	}
> -
>  	guard(mutex)(&sc->cmd_lock);
>  
> -	ret = sysctrl_send_command(sc, mbox_cmd, cmd_size,
> +	cmd_size = sysctrl_prepare_command(sc, group_id, command_code,
> +					   cmd->data_in, cmd->data_in_len);
> +
> +	ret = sysctrl_send_command(sc, sc->cmd_buf, cmd_size,
>  				   cmd->data_out, cmd->data_out_len, rdata_len,
>  				   timeout_ms);
>  	if (ret)
>  		xe_log_err(xe, SYSCTRL, ret, "Mailbox command failed to send %#x.%#x\n",
>  			   group_id, command_code);
>  
> -	kfree(mbox_cmd);
> -
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> index f12455f2886d..605bdc62e0bf 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> @@ -58,6 +58,17 @@ struct xe_sysctrl {
>  	/** @cmd_lock: Mutex protecting mailbox command operations */
>  	struct mutex cmd_lock;
>  
> +	/**
> +	 * @cmd_buf: Request staging buffer, sized to the maximum mailbox
> +	 * message. Preallocated because commands are sent from the runtime
> +	 * resume path, which may be entered from reclaim. Protected by
> +	 * @cmd_lock.
> +	 */
> +	u8 cmd_buf[XE_SYSCTRL_MB_MAX_MESSAGE_SIZE];
> +
> +	/** @resp_buf: Response staging buffer, see @cmd_buf */
> +	u8 resp_buf[XE_SYSCTRL_MB_MAX_MESSAGE_SIZE];
> +
>  	/** @work: Pending events worker */
>  	struct work_struct work;
>  
> -- 
> 2.43.0
> 
