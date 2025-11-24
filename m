Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590F0CFD35F
	for <intel-xe@archiver.kernel.org>; Mon, 24 Nov 2025 21:51:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 205D010E26B;
	Mon, 24 Nov 2025 21:51:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SLsF78d+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 835C310E26B
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Nov 2025 21:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764021083; x=1795557083;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=B6TkXCka7dbxmFNFzTzOo7BvfnNIZCiSes6SkGfWQlU=;
 b=SLsF78d+jI25S5Z5TyJ02v6MfkoMSiu4hSFK2T+vCBYnvQD8iDnBZMCg
 gCtcrWJgfnzVBVmnrEpovofl5eX3tneom8vLAYDUU6V+iQAOtUHZPsma4
 fvIjUAYXSecoSG5fMy8cyBaSmWelulkGz5zrXzFCouUoCZhr9HtFaSR9y
 ttjHqd0AEUO3+mvnF0Qo+50pU1mCc7lMdOo8SGgKYlqYynzUjUdTGE2YF
 qzQpcwmZ3VhUZXG30Lnd76l3G0Fos5W64nHZufW/k+UktMRxYwM+FH4Cg
 2wKeIrC2PbOd2wtfjs4B8FveuEdfG1+Ji/eXQHncfZkJLkBccw0gAyrmb w==;
X-CSE-ConnectionGUID: NPq/2xOrTSmVmElEJWZf+g==
X-CSE-MsgGUID: UeYMIeEqS/KA9H0WDdqZAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="65218583"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="65218583"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 13:51:22 -0800
X-CSE-ConnectionGUID: +LiH40+WR4Kj7fUz1D+r7Q==
X-CSE-MsgGUID: WYU+G/k5Qem2scqxB1AJiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="229727034"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 13:51:21 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Nov 2025 13:51:20 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 24 Nov 2025 13:51:20 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.47) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 24 Nov 2025 13:51:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QihTgwTpBiTsD/RgRVbYCAU2k0TBoueqowuxqP/qZLOj3P6+pRvr0nStrGxCOmKdyQQz8XEctuTZzbbeTaDYVjTgGI8GxZwKtwPO2bSENlZqHTHvlAjHr4cS2mjeE8TPJ2S/1Rvt68S22xUTALkDTP9CFf9W6UVxgtT1LASdVSOvP4/Xy5ZOmoy/sfQiVLESjzHxJuWS8zHoTiuut9pFG8Ewnlh76wfBR7pBvBBlZuEzBKeGkwhnEvxZeVt5Hv9kqFyeO51a6kSqyyz9Hq/kkmr+IgOvLDBCdWUknZdxuW1+XfFhEUwoVFrLrMuee2G9aPeYrnmspUEUWfEBHrtGmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tI8oGrtBmmRhUteMM1RJu3A8hlmqsdULVzzqGuUP2SA=;
 b=nnv//eUKF9bY7Vhpbz8hLXkIBAimN0FqhVWdDzGK04UR4JtAB5paHxAKnsZdTS34RlFoZgCDIY3UCjeBJuiVfUG0MGHldkua2KJRnLD8XIYIAaK6BjHHpCIHMUfZ+FbwbT6dinesOISTSDu1FnNpxzWJlgaCtRJN5s1LXjZ+BrRBvRwtkRFFun32bOqrOuN3ZHXrpAGv111ZFU36w1+Kvr44OPrNOOO44Kpj3agzqeFxtJYKvY+8gQLuoYRVBTi2Ac+PvvNOB4k0z75cLpmwF/z6ZMjp8xFyoxy/ezdbYh2vkhX2R573erKfsz7a+OxMhmvAUJfq+toG3KKGma4E6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PR11MB8733.namprd11.prod.outlook.com (2603:10b6:0:40::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.17; Mon, 24 Nov 2025 21:51:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 21:51:17 +0000
Date: Mon, 24 Nov 2025 13:51:14 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Tomasz Lis <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
Subject: Re: [PATCH v1] drm/xe: Protect against unset LRC when pausing
 submissions
Message-ID: <aSTTUuDDPV5Cs0Be@lstrano-desk.jf.intel.com>
References: <20251124212325.1900462-1-tomasz.lis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251124212325.1900462-1-tomasz.lis@intel.com>
X-ClientProxiedBy: MW4PR03CA0192.namprd03.prod.outlook.com
 (2603:10b6:303:b8::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PR11MB8733:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ae7fa07-5e15-43d7-10d9-08de2ba398b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ak81bIHtfrQroTwUCmN/Ftr61H50OwsagHRESHOC8QqJ0RWaTLxYczlRT3xU?=
 =?us-ascii?Q?sUjd3yhSNPkOUsMrvocmAzZjWu/W8YHQ9n0Fnm6BXabNWQQmhNQo342cJkfj?=
 =?us-ascii?Q?AWnYW8+n8ow5p9UEpM0PReGQf9Rd4BO4obhJjltn9Q7TR1K+o2h2j/z8BFon?=
 =?us-ascii?Q?IB+5MjzxwOzq9phf1EXIZJM24UC9xg3V6C12gBigrd2x96Yr/IzEjIUaRBTZ?=
 =?us-ascii?Q?Isn0vn5TvENEFPRM0+HvR0emzpEnrt1pOS/EcVnl/cb0zwiHmO57S1MRCz9i?=
 =?us-ascii?Q?gY/fc///pCoespJ6g/EpTf9iJ7OTCluIOkDnwqdzfu9xKUXqbBgfwoSJ4gFG?=
 =?us-ascii?Q?6yV5spdQXcZN8aLfP8Spa1N2/CjaJW1+6Qkid+6SBUhailAiXdbKxhi9sjHC?=
 =?us-ascii?Q?hCIh1gG7bu8K9jk5GatgqDAMhg2HtPshwe/vWeT+Xufn9aieSA9XkQtyGFFW?=
 =?us-ascii?Q?3EKj6paoSYASE4LkYt04EeGnSpwS7y3LwUQrqXN33+B5dMlYp6Otdt9oHwkL?=
 =?us-ascii?Q?kdXKtyC2t4MPmNDQpgqX02XSI+BMqWkShRzUJwwJF+OpS1mcQ9w20a2KTTPP?=
 =?us-ascii?Q?U+AFlphqlmazq/JS8+W6f/3dyWfh63yx/dYmz2bEJfwz8hmg95tg7x7kxPcW?=
 =?us-ascii?Q?oDU/5uVd8AwRaHqm0y4VZVN7YDXcjDWa/1nT4bw1phtY5m+gvtfmvm2IP/fC?=
 =?us-ascii?Q?ieY5X7gq9/5ntpq1nlKB5jloik5U5UC5MwEkXbYiFG4fpBp/IP+pbrcSyS/r?=
 =?us-ascii?Q?XGquugtlisEF1RV1XEWEAcmAg2YPedEyWJU2PoEG1k4kinDdZLr8NY8i1QH6?=
 =?us-ascii?Q?Kcl6jeJVwkZejI6r42K7fP0X9DUkLcnmZEnHXYganhZLUGW+dsCs2NPRxvkI?=
 =?us-ascii?Q?hegNCqZsHtzvkwt68ykoO7unazeoHuI1JDq0J8hblrKsDwSiOQUnWrQBTaub?=
 =?us-ascii?Q?T/8XOOalGueXJBFDBdeiZ4Ql0Mj00Toc1cmXmY/Y/tLyI0h0NpMIC9xLOCU2?=
 =?us-ascii?Q?+LkfNX22kpgZc21P6Q9aP0b9NsLg7onJ1AcLtxulxjuXTJyELKIcXxLo8zLa?=
 =?us-ascii?Q?WuSk02mYK462poHeXh0IuRKWRaGOrO8imOERN9p1xGLLYNcJ1WEbnqzqlYTP?=
 =?us-ascii?Q?tbGqEck4W8bddc/rvaY84qKUmmRc36bVAHJOeG7+eITgb6QONK0l36do7MV3?=
 =?us-ascii?Q?Udk9oLogjk8p/J8Sgu9zyBz2jyXvRzGpcwh4A/fZC6iB+opr9/Wr5wgpiFJb?=
 =?us-ascii?Q?n+PvPJFvO+uP0cPgGnTeolouPKGOeI14DWFOlcqJngBarOFERTEucAk5GG6m?=
 =?us-ascii?Q?AcYmGyEET4uXME2Xwz67N/+WIfRZ38ePxZOCflRwopp1eVqTxaYuDmE+C2CU?=
 =?us-ascii?Q?5VfQTHNl0wi6qQm+mMtqPK5DDrhwNVhwxTj/OZvm64lYMtypRTWksvTqvn1H?=
 =?us-ascii?Q?gM46GBoN1NC97N0Sl8ZD56oQbW7Hs4cE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x0EUP3ueUQmeTWBVM7fbZXkEng4qqHoDpC6tIKsRXPn86gSFzU3Fiz3CZ46F?=
 =?us-ascii?Q?M21X+Rvivbbt9NpJwEUBg+TQPHpj2Eyd6rMPaLDlchyvoQRCna+gYaKsSg8D?=
 =?us-ascii?Q?1W3h8OVkFurBnk4gNrpetfXsOSvVfqziY/B2oMkyGiC9VgBfLJMbKVa5VGkE?=
 =?us-ascii?Q?AxXXI4RC16xuUoFQNukY31NRw/fZ7iiKI5srnBYVSLHz+bW2XhaEfJxiPXPQ?=
 =?us-ascii?Q?n1HAEEJozq6EJZwtBKISnPFinWzveHz8hDMz8zRfPNntkPRHbSJ+DH9h1Nk8?=
 =?us-ascii?Q?EE0XaqcpQChC66kj/j38h5qgL4iYaHqyR8wCScvJvqQHNqhFm0/FYr9Mfyl+?=
 =?us-ascii?Q?Jcbim2flUdL+AUOBDDifASKMQ4j0cvssfNohrXPYhO+L2UfdHwu2Xh6Mmr+s?=
 =?us-ascii?Q?WMcNhIZY0aNEOd/PAyJm+1OqcJ20mPm4huxakp8vY3TSapZZRyW73lcNsVk6?=
 =?us-ascii?Q?cwYeyPnZ7QkwjHfala6JTAEbKhPhdXBQQlN321MSmyMvfSBdbQQ25H+decYh?=
 =?us-ascii?Q?0ExlZuJOFkYvh5H1/Z6Sdy6tsy0kc+xP8HpE99Ff6Hyc2egkYRxzDFL9YYiI?=
 =?us-ascii?Q?43QZDPXX/x+zHFTnOFX0jpDY8bwIEBjSW5u2d12cyoR6I3lUYqlolpPRznrf?=
 =?us-ascii?Q?RGTrUdFi+yxfHuWirpvwvNRIa/YsMEo7xOtn32Aqy7fIk8TE5a3XiT3/8Nt2?=
 =?us-ascii?Q?cVtqB3mVMQxYm4LX/K+o6vBu6LFxSqf7P0Z4JKCRNdb6QfZeDwlCOM9SR+Uc?=
 =?us-ascii?Q?pA0Ro+Q5KKTjQqf3eAJnzw2uobzHajr6cBWFvXaB8te+6s44hp4gdEjMz1y+?=
 =?us-ascii?Q?AGQG7rVYRULyYL0VEU8yNfYiRttUJubLS+PcdiNMprIRxLjUpjFWNAie6tyd?=
 =?us-ascii?Q?P3F2+IRiYAj4pXFpFxpsNubwhm3Dou5L/MJP7n4RXkJzBNb0I0HXK/45EpGk?=
 =?us-ascii?Q?Y67GfTpXxGlZ1/O1WTpey24dNIhsc/sLAT6vaJjnCt4IIxCNuIxJIPEJVl6v?=
 =?us-ascii?Q?7QkFsfCNI+VrbdAUlv0ogDTUSAjAHM2m5WddBIeMmtZk3QYxYFxqgzwQGHas?=
 =?us-ascii?Q?h/SG1z74+SOzbFSgX5RdLFMsHdJeTr43GaQHlzXqJKK7NlBqO1/lQEpRt38X?=
 =?us-ascii?Q?fOAu7iS+5WKWjU3d+peQ/7f+nFg8s3xKQzUFfnxmu8sC8QWTkkrFgOFewP5E?=
 =?us-ascii?Q?KC2/BGEoFhdeeTS7/uEOvdOc9plmMpgX5mAEiI9jlXC6imXvvUCaXaif5rRf?=
 =?us-ascii?Q?xyVYWsrpvUBP2LzfuxJk56c0ythaNF5+CG4eHqfXei6XQMPGo9xDGGua7XMS?=
 =?us-ascii?Q?CQLh0oT1NOmerxF/tOZlhK5OQUng9c1fK/Ma+cqpIJnMyQLudNwe36N59DVl?=
 =?us-ascii?Q?bIs/s9TDMVGKWKbzzjG47Oe3ndq/+osZDEdJ/FgglUJ87dj1HnP9j07SktnN?=
 =?us-ascii?Q?3Ew0jUde/aKUx0itNKoAL33yqgYxRhpmKqCIw3T3j7k6Pz3iXJMl1xQ4z1rQ?=
 =?us-ascii?Q?PptQRhDiPwnOB+Phe5nbSDrI78qF0MW+8ESzEYfNi7VFksCA1pt9v5ql9vmw?=
 =?us-ascii?Q?maIHsuhuKe0v1OedJPAZYbeUXDGymAk4avhKj01ZlikqUgBa/cv//RkVhrNJ?=
 =?us-ascii?Q?oA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ae7fa07-5e15-43d7-10d9-08de2ba398b0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 21:51:17.5972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hw0QXvLGv8vsx9fccbr1KOvC/259hudiYU9c15IbJ1zjYRQcGW0GBBajdBYWqe1WNBz8yGEtT/FX4Kc/Q/j0TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8733
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

On Mon, Nov 24, 2025 at 10:23:25PM +0100, Tomasz Lis wrote:
> While pausing submissions, it is possible to encouner an exec queue
> which is during creation, and therefore doesn't have a valid xe_lrc
> struct reference.
> 
> Protect agains such situation, by checking for NULL before access.
> 

Fixes tag?

> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>

Otherwise LGTM:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 7e0882074a99..f57000c2cb9d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2107,6 +2107,18 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
>  	q->guc->resume_time = 0;
>  }
>  
> +static void lrc_parallel_clear(struct xe_lrc *lrc)
> +{
> +	struct xe_device *xe = gt_to_xe(lrc->gt);
> +	struct iosys_map map = xe_lrc_parallel_map(lrc);
> +	int i;
> +
> +	for (i = 0; i < WQ_SIZE / sizeof(u32); ++i)
> +		parallel_write(xe, map, wq[i],
> +			       FIELD_PREP(WQ_TYPE_MASK, WQ_TYPE_NOOP) |
> +			       FIELD_PREP(WQ_LEN_MASK, 0));
> +}
> +
>  /*
>   * This function is quite complex but only real way to ensure no state is lost
>   * during VF resume flows. The function scans the queue state, make adjustments
> @@ -2130,8 +2142,8 @@ static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
>  	guc_exec_queue_revert_pending_state_change(guc, q);
>  
>  	if (xe_exec_queue_is_parallel(q)) {
> -		struct xe_device *xe = guc_to_xe(guc);
> -		struct iosys_map map = xe_lrc_parallel_map(q->lrc[0]);
> +		/* Pairs with WRITE_ONCE in __xe_exec_queue_init  */
> +		struct xe_lrc *lrc = READ_ONCE(q->lrc[0]);
>  
>  		/*
>  		 * NOP existing WQ commands that may contain stale GGTT
> @@ -2139,10 +2151,8 @@ static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
>  		 * seems to get confused if the WQ head/tail pointers are
>  		 * adjusted.
>  		 */
> -		for (i = 0; i < WQ_SIZE / sizeof(u32); ++i)
> -			parallel_write(xe, map, wq[i],
> -				       FIELD_PREP(WQ_TYPE_MASK, WQ_TYPE_NOOP) |
> -				       FIELD_PREP(WQ_LEN_MASK, 0));
> +		if (lrc)
> +			lrc_parallel_clear(lrc);
>  	}
>  
>  	job = xe_sched_first_pending_job(sched);
> -- 
> 2.25.1
> 
