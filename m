Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD620C3DA6D
	for <intel-xe@archiver.kernel.org>; Mon, 19 May 2025 22:00:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 676BE10E025;
	Mon, 19 May 2025 22:00:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EGQM8avK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA5A10E025
 for <intel-xe@lists.freedesktop.org>; Mon, 19 May 2025 22:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747692019; x=1779228019;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OxWLvkUEgvf4ZVlg2U812I8sBzfM/6Ur+nMbEMQpd+s=;
 b=EGQM8avKa3fWM+sfo+hJOLAocZzDWMm5w4VnP6kYh6zAlvNrL44Nwf4b
 pfm4TMhJCnueOCdp6Vzy6RVGaKcVKmue+qbx/MDYrZcqTg9ERAn4zhOcE
 R5iVKK0wsxtKvTpHcqb17oIh5J+xA+xrKh6ejI0ktOw64GaGr5GBWWISq
 vNjL9TKV742GwIRfR2xv8KtryhZwxvC8OJTNDezJwN8jiFrvw59E0s9EI
 +aePueL1CAJM6EZDOO5D1F4JYfYj0HiGVrGdnyapGlZaqziCLQB4tNe9y
 rcaQMyRVthZePmq7sw30wOU246ZUq9ihBf9HOGYCxBQ2Fz2pxpWIH2ORg Q==;
X-CSE-ConnectionGUID: iv56gP0uQimfzc8uLd5c3w==
X-CSE-MsgGUID: t0J6oHmEQaeOi+FaLeOtUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="59838935"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="59838935"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 15:00:19 -0700
X-CSE-ConnectionGUID: E6B4LBUrT66Hg8HkAKNazA==
X-CSE-MsgGUID: hR92sK++TKucssghsvjMeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="144621076"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 15:00:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 19 May 2025 15:00:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 19 May 2025 15:00:18 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 19 May 2025 15:00:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CgBqX+PR3mh1Y9kVbLOOFjqqbe6K/ad1RsjhzEeX1d0upIaYeOIdBCPk2sKkbjNmchZU6TEVpfAlLogzE0tBV3Fc/0cubB7JRmcHIl5k/c+se/4fsr56FjLcY50Uo9Umhz7vVMTDrM4GnoxM1BnCOhPihFiFTDsIqhoahXclgEhPb1sIdyx2kxk0UDOq0p3jMdEtotl3N5Fiso1Mj86jVVBs0fJBOubTnsk26xG4vtIqUzd+x3IshGvJqAj0/Gc8HGKpGy7U5TQDkhuczH7Gzid5BXne/mK/hRE1YlsDv8Jj4PoLm/RJvMuVzVPnwMLruHI5TrhxxT8HPHLcIWMu7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vz0W96XrcQh2q6QzDoNzUVVkp5VTYIVpqmIDOmwKhII=;
 b=ivoTEVBe1dfxZqLsqe1pDraS1QQP7ABqhgL/iLFNTF3pNHcN2z8WYJdUGS+4BCO8Wtg/fzYR6IIzzuHEMwC6EvnlsM530+/UfdVlSP4s8N234CgUqgmnyjrAn1m6QpSfGC1EG/ompmIM60nsZH57kWaSlLEqezsn//dzxTqb7MS3oznksT7ng8DG/rhAVavnJON45CA5v6TZv7giiC5n38zCCAz6eLxZv/fZNxOrCMv7Gn5YDEguLGt8UFtIyiDIuLlJkbUeCL8wvgHO8jSvDQ2NLchNCEzQVEOE+Oz43ctKtxzpUxoJE1MI2Uu8TL1MmWz3Vt/OnMKzeifKeyuhRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA0PR11MB7695.namprd11.prod.outlook.com (2603:10b6:208:400::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Mon, 19 May
 2025 21:59:49 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 21:59:48 +0000
Date: Mon, 19 May 2025 17:59:45 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, Peter Senna Tschudin
 <peter.senna@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe: Allow to trigger GT resets using debugfs writes
Message-ID: <aCup0cJlU63s0r_O@intel.com>
References: <20250519200914.216-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250519200914.216-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::19) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA0PR11MB7695:EE_
X-MS-Office365-Filtering-Correlation-Id: a11ced2d-7ada-47ee-5e0d-08dd9720794e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2eul1Fd+cU6rSB5utyu0LOgNUBEBCTWlpiABCUApiBJj4vQZoIZuaB1DsgiM?=
 =?us-ascii?Q?zSB+Vdn2HgOkVjK9HTl/C0UM1jemr/dzx+axpRxTgxEvJJsX8nKVWX5H8Xg7?=
 =?us-ascii?Q?QXh+4v+l5pcRkPnDElTxog6HQXyfep4e1zNBacnJzzxa3ksnTK928QIlLbq7?=
 =?us-ascii?Q?fE+ePw8YegIbuES6afuqwZzvS9umBckWirA4kqDEYRPoeFzs9/VIcC3u66We?=
 =?us-ascii?Q?u76Sig/WWwxhmfyOg7zQc/zG3CaSAynXibxJy8+i4ui7BXMwz1pwALr5YIBZ?=
 =?us-ascii?Q?2sVVNOnfjpBfYl43ScPj6dM19e4Tw7k7N4NkDrAxTr3JvZSP6RVH44JHqmTK?=
 =?us-ascii?Q?K36PznGD7sGbRX3lAQIn8PrKsLicmeT1IK0mkGz2CSwIIDNIYUggOH7hKj04?=
 =?us-ascii?Q?XF75oY66aXUf6fPiunqCWfsVli3B1mhiV8LXKuAXSBERf3I4Gz/ab4g8MoHc?=
 =?us-ascii?Q?trJCebePo0HSJk/YYpwWAI6U6Swyvc0YLy8Lt7u99Rw0laRUxUjk22AJ0dq9?=
 =?us-ascii?Q?7k35NDBHr5/cQW91g5xChO6p+breVKYU4smw/l3xrlTWrdITX8dJPIBIsYjx?=
 =?us-ascii?Q?ycbUrtkbwGbnw1j/vALUS7oZpheXdVLHGJKfyJiZYziGCxQctlF+ZMDPQgJe?=
 =?us-ascii?Q?nv8WZ3z11WuXVaVu8V5ktTSdONYKg1YKE4omvhUyVuU5v/oEEU6oHjt2VTTv?=
 =?us-ascii?Q?n7MxA2nH7MmG+ADj3cTfPLuS5+ZiKyHleE/Vx4VpZqv5gs17bj1H4gLZJ0Pd?=
 =?us-ascii?Q?iMrVgMqtNJS61ysh6mSJiuppsX0AlwoBjxn7IJAGZoDT66v1cRWLRSofZ64c?=
 =?us-ascii?Q?Z6wARZHQDJ7MwV7s7qXHiVUWGWWTuI1OHK2VkTDGhSTLE6HpcEb9tPIwL4GS?=
 =?us-ascii?Q?APGXvh/p8m1P9FPcm9wvbFgtE13UDx9ROIclv86IDR7718OoV/uwSy/bwQpr?=
 =?us-ascii?Q?6kt0a92ACyIM708zAUTLU8I8Vo4DFSgiQuFAlEEsS/N1KnEvM4f63hL43NRQ?=
 =?us-ascii?Q?dZLEg9kqc9X0D3EHWgQF2MwcvHPejyAfsAglkq92NjYX3T1ZNOiWK0EVEbY7?=
 =?us-ascii?Q?VRwyrv4gAQEc3Itn58VPbOtYs8jtJxQFPiCkBpDJy625egz5M/k+JZQhEHSP?=
 =?us-ascii?Q?geJcZhXeo6sE1u3sy0seykxcWnA2W4uVNRd2ui6NJpZwgDXNMcsnm+CjZ4dE?=
 =?us-ascii?Q?ypz8xGvc56TrPWMAYk7lXvwmjD1vn7aw1TTDgpgLSu5O5lfp20CVrZDi8Kzc?=
 =?us-ascii?Q?Hk9z/RzxL61eJD+AGcz5EGBXZBVRC4krdT7GolEVbaPJyUw764yVxJU9dEkG?=
 =?us-ascii?Q?sKf/TtV/hze1E+A5kfmeY0zOCQGT96AXn+m0VMTwDk2PjqZDUqS3/Rl124VH?=
 =?us-ascii?Q?N6Snd8ygXK+3KFUe6N1gxGcqiFLG2KgrANOFvMD5DjPLoQCAA3cpmFGGOV0Y?=
 =?us-ascii?Q?B5YwGgmOUX0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TSRJ9coJpLOolZLi2GUD5ZKyxe7tIAS5rpRU0ExHNsSapSO7M0mH+kVFmRT5?=
 =?us-ascii?Q?CXYQK+dBz0wrzGAIJsiLuPppVHFTMafXH/4bl3IUH/Qq8E5m5rtMLe0kwTt7?=
 =?us-ascii?Q?iDsieLSmEx4OOw0ETivKseKvAlZgLfMS9m5QUfUq/OL1L304ADW8fSdVyLwI?=
 =?us-ascii?Q?W3gJl5pqSMg1slA+qpYTQjAPuAZF+2XlwHESFZWS2gBfGcAf81ODNbBC5LEp?=
 =?us-ascii?Q?M68nM5CWmPxaA+e8M+Y1F9AzCI2gGuyUpCD7zwXLC908pfzHx2jemp3/kju1?=
 =?us-ascii?Q?vwCnIPFzKSXLVHpKNRBz/HsBxpeZhXqPEn2wLGKxGBWqe9xIHBnGjj/ar7vy?=
 =?us-ascii?Q?4hlqI3EnAqTBT8xT+V9in8Y6SOGvRqG6qb5e86Mdgkrn46wDJRmCF4tdOUAV?=
 =?us-ascii?Q?ZS59lSSHuwe5j8QQk0vgl80PUQELMc++GDFaHYiJBQXttupEXYb0rvXPIvpV?=
 =?us-ascii?Q?3B7Y1qGb/6Ll/XKfVY/8PLDVBUB+jbJkp5Okmi4jkD1We45M3w8sx3UE9Pmk?=
 =?us-ascii?Q?iqX6isAd0WcAkU06pb5d9utbiDSOZDNNUBZQTiiBc5XAnAz7EHnCmh7Kt/1K?=
 =?us-ascii?Q?/vh0rpjzsuKz5wmlOHo9lk/IpsB5HPKdR9352md9wE4Q4Zps2CTRANOv8ba3?=
 =?us-ascii?Q?uVza5aLLfU3l3vCBLwDmXtrYBPKIhFixjrmwUmGnpdUy/c3+R9kfFX3Q0wjz?=
 =?us-ascii?Q?6QYlWgXbfiCWqSr+tjUfQ9p4mdzfH6M5qPN8V0C8Shgba8JhI5OxkMSFYu9y?=
 =?us-ascii?Q?ClxNxOalaTlPkPC7fXyueFO/FXw4w8SiPmXgvKJ4wwUptsL8C7GUTZDr5RHo?=
 =?us-ascii?Q?R8TNWICOKe00YVtfIzWrB9/TvaVZJVVQj6ZDz4Cz+pP+dPOyLrBek+qZKNrH?=
 =?us-ascii?Q?iw2WN/nGjFTJ1HLiGXVUkwzbYq9V2Gle7SnlERVSAFr3X/mqsNawJLTrHQDp?=
 =?us-ascii?Q?piY0JhrZeaooTcp00SfTE5aW6igzG4t3mk+wZazrY6UKX5jHd0Rq+J8XyORb?=
 =?us-ascii?Q?H6+AbqFBWSPB3WnC02JRUK5dauJmqPHO5Q1iybcQvlyahDwa3Ki1P0QMajDQ?=
 =?us-ascii?Q?Gg9466vnU57oMa6u8TJ0tQUpceq25CdODpsC8F0b73HP/HcpyfjbldI2Uq70?=
 =?us-ascii?Q?/3m5zkcgAHgRAEQ1e0EyXXUUlAJtUQGZW6EvDEzl3CzLrkx9xGfjwMSWea+v?=
 =?us-ascii?Q?yKwiw29XUguaTJVg7/aJI149qyazBsnmMKQtIWg0YLTPDvmYeBztwdXviklv?=
 =?us-ascii?Q?buahTIoPcM0zuzNQL07GqBB0PSrlbMyqdea2Jsw1CuAi5HxZrAwosssflrd/?=
 =?us-ascii?Q?wcLRPsLLg+OpVsybP1LAG3sqRkhu0kvnRyveWkudvHFo+X0uN+zK4ltw/cH1?=
 =?us-ascii?Q?9a627FED3/32fv0A35NyQmnL8V0Eiz2wz0H8LVHzO3r6NIjKHpR8id6EXAXq?=
 =?us-ascii?Q?xVsu5FnA0WkmRjiAfZkvG6wgzNzGuHq4RGtSBoRwN8gje3qr5SK1CA4+ZKar?=
 =?us-ascii?Q?o43NRhSdVsqyFheRPTFwZF9xYBWZoVvT0C2mJu9tlEYekN+/TrJ6humSlUeE?=
 =?us-ascii?Q?cGx0CaqbR6M2X4QeDxAUbvuqkGoiyi2cxzPVNstvrqlopKg6JgCrmnENrlaM?=
 =?us-ascii?Q?uA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a11ced2d-7ada-47ee-5e0d-08dd9720794e
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 21:59:48.9209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8OKb/z0fbRAJEYcA+1q5I9HQnltm9VeLhWqymbh+vJE9mw8rpVq5uDaxLnqGsqYO73NHyw2evMRMUMRAPpvDXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7695
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

On Mon, May 19, 2025 at 10:09:14PM +0200, Michal Wajdeczko wrote:
> Today we allow to trigger GT resest by reading dedicated debugfs
> files "force_reset" and "force_reset_sync" that we are exposing
> using drm_info_list[] and drm_debugfs_create_files().
> 
> To avoid triggering potentially disruptive actions during otherwise
> "safe" read operations, expose those two attributes using debugfs
> function where we can specify file permissions and provide custom
> "write" handler to trigger the GT resets also from there.
> 
> This step would allow us to drop triggering GT resets during read
> operations, which we leave just to give users more time to switch.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>

I like the idea and it simplifies the error that Peter was handling in the
new IGT case.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c | 96 +++++++++++++++++++++++-------
>  1 file changed, 76 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 119a55bb7580..848618acdca8 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -122,24 +122,6 @@ static int powergate_info(struct xe_gt *gt, struct drm_printer *p)
>  	return ret;
>  }
>  
> -static int force_reset(struct xe_gt *gt, struct drm_printer *p)
> -{
> -	xe_pm_runtime_get(gt_to_xe(gt));
> -	xe_gt_reset_async(gt);
> -	xe_pm_runtime_put(gt_to_xe(gt));
> -
> -	return 0;
> -}
> -
> -static int force_reset_sync(struct xe_gt *gt, struct drm_printer *p)
> -{
> -	xe_pm_runtime_get(gt_to_xe(gt));
> -	xe_gt_reset(gt);
> -	xe_pm_runtime_put(gt_to_xe(gt));
> -
> -	return 0;
> -}
> -
>  static int sa_info(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	struct xe_tile *tile = gt_to_tile(gt);
> @@ -306,8 +288,6 @@ static int hwconfig(struct xe_gt *gt, struct drm_printer *p)
>   * - without access to the PF specific data
>   */
>  static const struct drm_info_list vf_safe_debugfs_list[] = {
> -	{"force_reset", .show = xe_gt_debugfs_simple_show, .data = force_reset},
> -	{"force_reset_sync", .show = xe_gt_debugfs_simple_show, .data = force_reset_sync},
>  	{"sa_info", .show = xe_gt_debugfs_simple_show, .data = sa_info},
>  	{"topology", .show = xe_gt_debugfs_simple_show, .data = topology},
>  	{"ggtt", .show = xe_gt_debugfs_simple_show, .data = ggtt},
> @@ -332,6 +312,78 @@ static const struct drm_info_list pf_only_debugfs_list[] = {
>  	{"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
>  };
>  
> +static ssize_t write_to_gt_call(const char __user *userbuf, size_t count, loff_t *ppos,
> +				void (*call)(struct xe_gt *), struct xe_gt *gt)
> +{
> +	bool yes;
> +	int ret;
> +
> +	if (*ppos)
> +		return -EINVAL;
> +	ret = kstrtobool_from_user(userbuf, count, &yes);
> +	if (ret < 0)
> +		return ret;
> +	if (yes)
> +		call(gt);
> +	return count;
> +}
> +
> +static void force_reset(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	xe_pm_runtime_get(xe);
> +	xe_gt_reset_async(gt);
> +	xe_pm_runtime_put(xe);
> +}
> +
> +static ssize_t force_reset_write(struct file *file,
> +				 const char __user *userbuf,
> +				 size_t count, loff_t *ppos)
> +{
> +	struct seq_file *s = file->private_data;
> +	struct xe_gt *gt = s->private;
> +
> +	return write_to_gt_call(userbuf, count, ppos, force_reset, gt);
> +}
> +
> +static int force_reset_show(struct seq_file *s, void *unused)
> +{
> +	struct xe_gt *gt = s->private;
> +
> +	force_reset(gt); /* to be deprecated! */
> +	return 0;
> +}
> +DEFINE_SHOW_STORE_ATTRIBUTE(force_reset);
> +
> +static void force_reset_sync(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	xe_pm_runtime_get(xe);
> +	xe_gt_reset(gt);
> +	xe_pm_runtime_put(xe);
> +}
> +
> +static ssize_t force_reset_sync_write(struct file *file,
> +				      const char __user *userbuf,
> +				      size_t count, loff_t *ppos)
> +{
> +	struct seq_file *s = file->private_data;
> +	struct xe_gt *gt = s->private;
> +
> +	return write_to_gt_call(userbuf, count, ppos, force_reset_sync, gt);
> +}
> +
> +static int force_reset_sync_show(struct seq_file *s, void *unused)
> +{
> +	struct xe_gt *gt = s->private;
> +
> +	force_reset_sync(gt); /* to be deprecated! */
> +	return 0;
> +}
> +DEFINE_SHOW_STORE_ATTRIBUTE(force_reset_sync);
> +
>  void xe_gt_debugfs_register(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> @@ -355,6 +407,10 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>  	 */
>  	root->d_inode->i_private = gt;
>  
> +	/* VF safe */
> +	debugfs_create_file("force_reset", 0600, root, gt, &force_reset_fops);
> +	debugfs_create_file("force_reset_sync", 0600, root, gt, &force_reset_sync_fops);
> +
>  	drm_debugfs_create_files(vf_safe_debugfs_list,
>  				 ARRAY_SIZE(vf_safe_debugfs_list),
>  				 root, minor);
> -- 
> 2.47.1
> 
