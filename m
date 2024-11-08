Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7558D64097
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 23:34:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73A3F10E027;
	Fri,  8 Nov 2024 23:34:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H2QxO0ii";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD0810E2A8
 for <Intel-Xe@lists.freedesktop.org>; Fri,  8 Nov 2024 23:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731108895; x=1762644895;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7/gzCNle0IE48w/IMqrHhyrn7HhsiWXkCTyK7dJ5864=;
 b=H2QxO0iisnZQo2yEyRezETwOioS5gbeyRtWcfmfCwpigzkVPWxZFzgdX
 59gjEPHAbFBnhpGbK88YUvJNnlpPXiTJsKl6xdCTbKNlT6VMP8Fb2Gv2D
 xIpRoZKRfOfoc8bhIlpQF+lwQlZENL9MuwZE02413ArGcjiTBrfwKltJD
 WIDfM0FOlzwWgiGXkbNZcj2jncyRKSbYW0Wm0tBbXw7eGvNO4kuoKYhji
 IO+jsXW48U6EdCe97gAFRMC/ElzniwiXCVfxg/IAOiO55BB0gxbWq9HoS
 3clCe7bTap1rMnqavqwSb1K78q1eTvFLyLvyhMvH5+BFc3DyAzEgdaycY w==;
X-CSE-ConnectionGUID: a20KoCGcTkeMWJBfwbflYA==
X-CSE-MsgGUID: 2Zru/Kg8Sbm17bG7nQ6rFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53569620"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="53569620"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 15:34:54 -0800
X-CSE-ConnectionGUID: fTq6qZPaSt+LNNETnql9fg==
X-CSE-MsgGUID: ka5wLVyMTluwuEPJ8OyeIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="85782946"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 15:34:55 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 15:34:54 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 15:34:54 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 15:34:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uW+M8G//fp9lwJZl3gEN4CD7nEFd9IOEcy/SV3nr1AWZyF/4oKqzmsVYw4kKdl7whEjK0DfgVM2ZS3jxut2XJ96GPMB0E1s3ZLxDWIbc1HMsWYCxVplgcXjlqcN6apfVt9yM8EQcvJBts61pi04EkWNdRipvnySdEHNf79X5RCzZhgjho0yBWqyYv0arrYYxorNLqf5l/mMMBEBWUlv9bUzAYPIcUaRBnDoVez8wYgKwkhA0cHXh8L/o9vF8bLh248ygUc04q8xQ3tRS825/dGyQX8FmhTWEWTat+ZxggOo4pjdhP73L4MCK5PKW04RXliFsMV1QrIpWLnWB42/CZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qXBJX3LN4G8eJcvHKM9TjkLyQkY1W860ncLP+iPi1c=;
 b=PcDwPVEVZVw2JXO9hBxXbonybCG0UssA+eUYeKjzZcaL2oNIGJuoiBN62q0HKDNGlKbMpxFkqZa3mlOhIGjqnKrr/ENaB0KA/Zo0EVW77gJ6L2vqizmE3h5329NJJ3KpxZv4QCXml9FDKImar8hbUO43kriEYPp8jpwRYyP0JLhbXXI0CVCR0O6w5xKpIq90Vpz4IsxFJ8AF87amMv1TEJVA/2Bkk5Gn4f45VNvZIhsjOplIaVrfnRdtLYSDSRHTleQG+cajYod0Oh4NjzqH6Jwgum8X4u668VEwpWQi9bTKHagQhQYE+ArXWciN3WEGhSuGBJtjBwYKnovtYjdadA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB8418.namprd11.prod.outlook.com (2603:10b6:208:487::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.22; Fri, 8 Nov
 2024 23:34:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8114.028; Fri, 8 Nov 2024
 23:34:45 +0000
Date: Fri, 8 Nov 2024 15:35:18 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/guc: Support crash dump notification from GuC
Message-ID: <Zy6gNqJ4B7urZsj/@lstrano-desk.jf.intel.com>
References: <20241108212737.2044007-1-John.C.Harrison@Intel.com>
 <20241108212737.2044007-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241108212737.2044007-3-John.C.Harrison@Intel.com>
X-ClientProxiedBy: MW4PR04CA0363.namprd04.prod.outlook.com
 (2603:10b6:303:81::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB8418:EE_
X-MS-Office365-Filtering-Correlation-Id: 3097aa06-e4dc-4a57-96bc-08dd004ded84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qE7LhOI9oeZ0FVBIabB4g+D47x9cS8N7nC/o1JAczKfyR0LSjYu+/SofG54w?=
 =?us-ascii?Q?1J9G3J7DEkEZgcek+8KANbgGcmqWxP8gwQq5sZJByAs6+0aan1M8UX4bNnrC?=
 =?us-ascii?Q?jBPqiBsM3NrJZZe+b1b3/CA6GTyL02zzNU3WamYKP3G1p20zuBpa13rmoAyz?=
 =?us-ascii?Q?w2uIF34sIIWpbUj4tp4rRVeGNaGlTrBrd7Cgla+d4XZ7OH2qBiOlfMcaXLfL?=
 =?us-ascii?Q?64uw36PmBvNEl/ilOoIBQndUhUw/6k+7zC80QaXbDjwKIVk2Q7fpQq6P5V1N?=
 =?us-ascii?Q?+6CYtekhO/Tsp4BdgDGMDGTU82/MKEHcx7IE9H/B56VyxdQowh62kCX3iFJD?=
 =?us-ascii?Q?bOGu0UmxApkOT+f1vcsuJ52UcTOjzlIcp/cO+qex6nSB3PYOtV5dNa7g1D6g?=
 =?us-ascii?Q?+MYouAGaG7T0F49SEoN7vTJMbmDplIU3Yge/66Iqh4nibCEpTOrciVrNDfG1?=
 =?us-ascii?Q?wbPFPod4TSV+7iv03a4qTMVBnznfj9VoJECeKqT6L7lA6J8S04pmCDh+1Kzj?=
 =?us-ascii?Q?wv8vGhtvX8Y3HbFujJJkPFaP3aRFeOrwQs42ThALRsUf6UASVTfVAP40N7cG?=
 =?us-ascii?Q?acDpJEXr4EdzRF4E5BYF1+RKEpVNQUDiL27hyu6IY1+MfRuFSw8j9L1ZqbUs?=
 =?us-ascii?Q?sAftrTj2nTVQwd3CJ9nzndVbYRkHcZ3RYclzFjnGB3jgX/uT03WtN7TiqP7x?=
 =?us-ascii?Q?NfYyoMdXqyV80BKepB+ZtYcxeoqgtRlNJgjzb8SKIk318H3f0v/cZNTUhGU9?=
 =?us-ascii?Q?33H6VnMYZcGZVgB0jvDVU+cbZQofEgMwh7KqK4UmXt7svN9SAH6V+BpwIyB/?=
 =?us-ascii?Q?p3DtvynvcACdd9Mxs7LZZr18MyfsWEiifvMufT0W1CkniKIOMq9qALuNhtyR?=
 =?us-ascii?Q?PkTdenLxCid0EhJCobVlFQsJz8PhaAG6RB00s5MwXDpxjoSxpmLorKuRVj4Q?=
 =?us-ascii?Q?dJzqJlCYBRgWYXQQWTnGtwRiAo9UEMmU/2gwinmvp5F7cKWsxLJ/RDglXIco?=
 =?us-ascii?Q?s+TEWH2NOZOcpclDqrbKgbrbp4ZyIBQ3fOiOYAn7R+Of1E3RS/JvsgKOi/Fd?=
 =?us-ascii?Q?2vABHCIGDWSxGHnXhodIA6M8r0D7HLwWbXVerODZ3HXNZ9nYGtTsg6GJ2y0s?=
 =?us-ascii?Q?qZlZ7HtkBADbihh49ZWWC+EvLaQ5vRFAPEIjBLRxvO93DcLTxUZSJv3QT9UG?=
 =?us-ascii?Q?HuHbfqWIedzY0H8unU7jzLsVq/UB1zeJdI5YttVwZ1FRbaBpg9RZB13LRUlX?=
 =?us-ascii?Q?KHjKM6JMB5+JRNkOk7rY1WFuJT9ZStJCeBaUlWG6QdYvmJxxGWxRNGLADhZT?=
 =?us-ascii?Q?2QeFStA+s0JHqrk6m1q3bELy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SWod8uqvm9HSHU3NyF2faDWDXMmwFo0zRmeC+pCsF4QxanEWX2aHAPZdR+89?=
 =?us-ascii?Q?yOPgu3/pknbAFw4mTRjnLj8nY/U2uRndaV5OQAYcE8wppfYjyBl6RVWX3YKZ?=
 =?us-ascii?Q?tS/B+oY/CqdW7as1HME/g8xhfRFfIS8wszyaB6ZntnCJI8GNqdrm3uKR14A0?=
 =?us-ascii?Q?oNjXcFSBvmxT3P5JLfvc/l9ONArxh35ltnle6fvrgpAlq7dLvsM3hMA1cEYy?=
 =?us-ascii?Q?C2Lfl12Ocp98Hpmcp7u8L3T0TvWXGbz2/1YMLXv/KPYMLooVnyciiRPNTnje?=
 =?us-ascii?Q?7wfOmxLhFnoscj6Jv76Itu3TBW7W5oZHSNkZyEVKztXY6sOY6O7RzkLDP8xW?=
 =?us-ascii?Q?1y3hfhLhJ6SzE86VhYbqfPhjHzu3zB59THAaPlb0dw9TVk43aZASIdZFPWjs?=
 =?us-ascii?Q?y2MmSy1nJEZS7Bd6ZFPHqXLTAV8hLHSkdHMYl4PsjPiJ8bB4M0DQGaTZoSun?=
 =?us-ascii?Q?6Hrdi0bFjF6U0zkZiG4hI1eWw+/+holSI6yTwdAFRjU4/DFXH0IzFKTA5U0k?=
 =?us-ascii?Q?D/10nQh75AEXowxbbvRUaFq0EP7gQzT59YT+txt0Ct+657IqxMIZpI6rPLzN?=
 =?us-ascii?Q?BKaYtBp2602bKf793LQmw7eLklWSpBZnYLN7oKSITUcqXZ3QfCk56GRG3LYg?=
 =?us-ascii?Q?TuxCK2Cck7sgnxm1NczIl9jt68RaVp5qv8rlLSX1CCzWnMrJStoIus0GPZKw?=
 =?us-ascii?Q?ebZQ4/fyTvBi6kWHAnum3sBYReemFv6DN6EOxQXJq0SctdOghobg1VzTNnWT?=
 =?us-ascii?Q?FsKBoee9HQkGLwztqJ+nABicKUPGQmo44jaRqe13WFhTX9PShybjHue70wsX?=
 =?us-ascii?Q?PC6OCL5i/uhTqwhKa8eESqxo6R6f1ySFtG6E5zVgS8Vhb9bYuyiGAtRA8Ry3?=
 =?us-ascii?Q?93hd470lXiEUc7fHs0l5x4JOHYwyTINDCDdCqDSlna/bMgUyxfce0S1Yq6FH?=
 =?us-ascii?Q?lNrcoJJY2Hk6SQ5D8VT7sJ1ndezrCTyF86m9gRXRUWkgs3sqdF+5NgxYN9fC?=
 =?us-ascii?Q?WeWEFWaCvvhB9tqbmVl0L9nRQxQ5h8mVMN5JfsowU8Z1DjCmyBtEEnGSboEQ?=
 =?us-ascii?Q?3oDJMp9WsCMb8Tuo3o8IRoAZD0Vb+hStHF5xgOunr+4sni6vAO1le5OgoI0j?=
 =?us-ascii?Q?1wyCJqLKG4ANfXOSfJ+KUAZp32VF2AT8IpX4mYDJ1VFTv3uAElDQZm08uYtg?=
 =?us-ascii?Q?qEDFp/8PO0DKtgre1G23fNzSUZGqnYgGiWBGJxCS4yop7demhqkDgqDhWe9K?=
 =?us-ascii?Q?RuDy44HydUVV8PVmAuQnGQO6QZ4lbrIHUSWT1W1tvwYjN5uNiSM0gIicsWjQ?=
 =?us-ascii?Q?HxvPhoxXA6dz25a+/2uNpQ5KkSUdwkmd8p28ewmJ2FxUTi17sBlT3BgSWhb9?=
 =?us-ascii?Q?/YB+m4XGXG5yJvVOow22usJa3CAqpJRKAkAaaK0DGQ/v7ezR8ZlXcOUIutZ1?=
 =?us-ascii?Q?OC7FE6HIayBx/HRAX/7pqfeKoAHxbSVmHmIfPoNtt/J5J07o3Dw2arCHrTP5?=
 =?us-ascii?Q?JWaDggFFNc2sc2ncPtb/swwDgcy8himlhktDomQ8m5OLdJggJQOROGGIG4bm?=
 =?us-ascii?Q?K8sFUwl3y9yXl2EmNA0+SQ+zJN3HT3xZ+kdeeGnBof2bRiN6pYxc2TQ6Doqc?=
 =?us-ascii?Q?rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3097aa06-e4dc-4a57-96bc-08dd004ded84
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 23:34:45.5348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EgnKcimw+DFXIhNrLDPb7WrNkJ4wBA3XqrvMJVdMzE1temdFr81H7B03yPlRQ2fY6Vd2IpeB44KCHLp4y6Qd9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8418
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

On Fri, Nov 08, 2024 at 01:27:37PM -0800, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Add support for the two crash dump notifications from GuC. Either one
> means GuC is toast, so just capture state trigger a reset.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 63bd91963eb1..7eb175a0b874 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -54,6 +54,7 @@ enum {
>  	CT_DEAD_PARSE_G2H_UNKNOWN,		/* 0x1000 */
>  	CT_DEAD_PARSE_G2H_ORIGIN,		/* 0x2000 */
>  	CT_DEAD_PARSE_G2H_TYPE,			/* 0x4000 */
> +	CT_DEAD_CRASH,				/* 0x8000 */
>  };
>  
>  static void ct_dead_worker_func(struct work_struct *w);
> @@ -1120,6 +1121,24 @@ static int parse_g2h_event(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  	return 0;
>  }
>  
> +static int guc_crash_process_msg(struct xe_guc_ct *ct, u32 action)
> +{
> +	struct xe_gt *gt = ct_to_gt(ct);
> +
> +	if (action == XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED)
> +		xe_gt_err(gt, "GuC Crash dump notification\n");
> +	else if (action == XE_GUC_ACTION_NOTIFY_EXCEPTION)
> +		xe_gt_err(gt, "GuC Exception notification\n");
> +	else
> +		xe_gt_err(gt, "Unknown GuC crash notification: 0x%04X\n", action);
> +
> +	CT_DEAD(ct, NULL, CRASH);
> +
> +	kick_reset(ct);

Side note, we may want to wire a devcoredump to a GT reset too.

Anyways this patch LGTM. With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> +
> +	return 0;
> +}
> +
>  static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  {
>  	struct xe_gt *gt =  ct_to_gt(ct);
> @@ -1294,6 +1313,10 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  	case GUC_ACTION_GUC2PF_ADVERSE_EVENT:
>  		ret = xe_gt_sriov_pf_monitor_process_guc2pf(gt, hxg, hxg_len);
>  		break;
> +	case XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED:
> +	case XE_GUC_ACTION_NOTIFY_EXCEPTION:
> +		ret = guc_crash_process_msg(ct, action);
> +		break;
>  	default:
>  		xe_gt_err(gt, "unexpected G2H action 0x%04x\n", action);
>  	}
> -- 
> 2.47.0
> 
