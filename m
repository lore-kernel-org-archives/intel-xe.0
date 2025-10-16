Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B01CCD185
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 00:38:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 022E388A3E;
	Thu, 16 Oct 2025 00:38:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fukQt6Kx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ADE488A3E
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 00:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760575107; x=1792111107;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wNMYo7brraIQEkO36abnE4QZYa04b5tZMSooa/sg3C4=;
 b=fukQt6Kxb0VRzkhk1QCaIvBu7uLTGQcrwlic7uwYRg3t2L5QNJSiISxD
 e5BwVJt6woRQGLEB7Qa2mYj2WU/qM9DOrkEKOz0ysZiblXoIKpQWCBbwf
 ewkuV24CYeyPNAlJlKoV1ys57b55r4cTF6akxZ2mGbZKCqMRquYUOABJD
 R1DJlC9kUqROGnXfImSV6m+mkrSip8tydmydV03qkAyFsSBv1o42jLRA5
 1Pftc6EPzy8hwPByrkkjPzxp64q9m1Ja+LcIuqBsYO7c3NegT5jf+X/09
 35LqwfcgjyWJ82hoCS7raOMz5KQnZQru4GFz7dxqKWbtVEm1pkEiPvAB8 Q==;
X-CSE-ConnectionGUID: 7iWLnShvQA6YZhuSdrpMuQ==
X-CSE-MsgGUID: Ht4M2b/PQROaOA8MN7kgxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62660665"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="62660665"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 17:38:27 -0700
X-CSE-ConnectionGUID: hBuRh+oRQKWd3LrjaIldyA==
X-CSE-MsgGUID: CMf6XxYDSOK33l8Dim1ZSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="181525379"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 17:38:27 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 17:38:26 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 17:38:26 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.36) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 17:38:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xUFQQqjsvtXNLoHVohB1sIhMlrXrmvo3R4SwkrYvlHeAnXqIzC94NhjLxZaeCYQDzZkTvLC1xomYr3G3We9DxJyEkG5qhVbLq5R2mlJnKpZqq8YmHGptpep4yLL821oD/36JCDFPIO6t6/2Y+7wF4aaFyNv7H8NBfr4KdJGrpC8jibNwCAKE0ZpTyFPV/HV9PSC80mSel8lpZx2yYKRtlLGD0F1tR08pYM2ooVvjyLB1G3TsZcFnn9qPZvtdI/4xlUkKRdT3IOxGe8tdSy16pkbU4SfmTpSHFU7XNhMV66baOpj0r1tvtmgCiMOboS/Z5Y0022LHKB92e/fQINIZ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KgbFztpAcODXiq8IbmtmMr2WhRX9VRC77iAcfGea57A=;
 b=sGddO4nY/Akt29qs/oZg1S6+oxJ+mgN4dURlduNXjQp0VmpSm6MHSZt+x0cuq4KeObwTSrdvTUjDuwLZ3cXLg+WxL6PR+qf1Arac5+a4tkASYJ8ZrqshY3zScC+Y/llSJupBywOZB0wIXAZn+EkDfFa4SzRdJ596vs7tI6g5hnyYg/pLUllH7qZzY77OV2kJA1ElX307hLXjsIX66b2+5SclD4wZMUSVkSGT2zbvQJeWtibdjndO1lar7smYhNhjpIXf6DB2Q3gd062V7NWcEmQkrGSISGzLlurC6HatTX2oBkGG3zeDkf4xUYizVV0DUBordS/p8tQHiDNKtZXM0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW6PR11MB8409.namprd11.prod.outlook.com (2603:10b6:303:24c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 16 Oct
 2025 00:38:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.009; Thu, 16 Oct 2025
 00:38:22 +0000
Date: Wed, 15 Oct 2025 17:38:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/6] drm/xe/migrate: trim batch buffer sizing
Message-ID: <aPA+fA0qk/hIDYl4@lstrano-desk.jf.intel.com>
References: <20251015141929.123637-8-matthew.auld@intel.com>
 <20251015141929.123637-12-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251015141929.123637-12-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR04CA0177.namprd04.prod.outlook.com
 (2603:10b6:303:85::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW6PR11MB8409:EE_
X-MS-Office365-Filtering-Correlation-Id: 07ec3e50-22e9-43f8-d926-08de0c4c4fb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?k/rma0omEvHhEAmv1KDyfQfEKLTvRCc0be4xo5/nFKTXGoxpWPZQkfLqxr5r?=
 =?us-ascii?Q?FvtB6+Bu9fobygM2thijfsXkgmAoPCGh3xWPCIrTtwDC6ZSBkYhs3pQdQefY?=
 =?us-ascii?Q?uZAtgJgGoZXI4G7H1aqZiPdJvl5oown8joQjBwtPVMJYFwZroxrtB6x71COD?=
 =?us-ascii?Q?yWZyvJBhanOLk7EluuLgIfFCHEU4TmtvJ222iEUZLSQvZlVVapnX04kIEH55?=
 =?us-ascii?Q?czX7lJtJ9ttgnapGslOIqnD+6qcd7jwfwUFtmdWK/G33M+G7T3x26ojRc03E?=
 =?us-ascii?Q?ERqA+rNP6RpYHGF6xkCq0zkj6PQ6T3faLYBdTS32ibjkTJ/KYADSCX3Ohn68?=
 =?us-ascii?Q?g9TfB+1RIrILXQ7BojpCzyqltjDRuQdMJ7IGG6lb1BxCaOcuh0MkCHmeDV/U?=
 =?us-ascii?Q?CxF67KzzeEuu0mmo1yqDzl+2xKnUR05pmva0WRD6MHIZHBJS55WADNqJCDRI?=
 =?us-ascii?Q?+GwCg+Yw3WN6e3fPJwnwjGYp0ZRnK0XNQx9pxeU1htoPYkWrufIFiBpxR8bt?=
 =?us-ascii?Q?4HQ9IhQXvX92JTe/FL4KLDMNR8A37SutlzZErhRRH8LiRVWbQ/G9yu9zqnhA?=
 =?us-ascii?Q?isRTbF2DX15fxgk8IGOlJnyzcEpJ0DU/Ye4o2lfdjW+r7ycRT9TwetW8Anhp?=
 =?us-ascii?Q?qQ8OHiupqOoQSHsByt1VLcbYCPTOZm06/CyBwuijYy98DoiNcEEGfVC2IqEO?=
 =?us-ascii?Q?mTobnyaH7OxmD+3jNXRRJkUI604ax90FXkajqU+nwn1yQFMW04DAGFosRtWj?=
 =?us-ascii?Q?myUlAGEGO2akX0ZH9FAYHOSTq+OwdYnlXgHatdUlLJtf/7xdxnl06JRS6gnV?=
 =?us-ascii?Q?grWz605c0yJ2nYi/8ayhJXf2eKmb2WEp5598P6ccivgbXUAbBFtharaU5736?=
 =?us-ascii?Q?RmeT0lX75rhBWnFu4SDkpToM8QcENnB2G6Z799I20UIVZKdDT/Dc8AMtk0b3?=
 =?us-ascii?Q?0sXRZLj8xlPpK9N7LUn+nUq7p9qfC4B2s7VObc45lsyPsfbVvfazFWYjULK1?=
 =?us-ascii?Q?tX3GEfFn16IFiL9+RrjgW4UNrOsRoKk5V8w1NFMPj7Xpame1ivlusGH+YzZy?=
 =?us-ascii?Q?KDNWsiOla5ZB6/TRf4wOfQFR3OC+7o28Qajbx8s5vnyYhxutSoVj/Fw3baGg?=
 =?us-ascii?Q?1yAfZa8dbx8GONvNBk0DSLoptqA1zOHtO6lUQHbxB3si7ggK2X1QCcAbvi5R?=
 =?us-ascii?Q?PrNP7Hqejfkksxy0Is9MWxTzKLZEj4Yp5gRMjZehjqEUYoPg9Exdniw42whk?=
 =?us-ascii?Q?2Wnhfe/pkRybVhKXyDA7ljmvent6D797M3lGKXlxyOH3dbLpTXbWDG01czd1?=
 =?us-ascii?Q?HmnlRfzZ68L7jfefdUWNN3eImonbWH9eUt9ChgxP6jfQ8jsYhCPRoGNlxAGi?=
 =?us-ascii?Q?m+hqMnI5UlrDOXm5z6ybAds51jnxdtkBaUdea4uOL6QrXPRaEldehYeVOb9f?=
 =?us-ascii?Q?auwRWRX1Vi1mTAgEsA57UttANX2xicNT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lh1aBmZOeV4tefk1xUbI4oFcwQN1nGVk+43Ahf1eoQNyW3yiQO9OYzVYcMed?=
 =?us-ascii?Q?qgPiSXrTPTNwKRgR5bb1By5o/hjwQiLUjFkFahRyvGWqqE+6Q3rNmk++FSNZ?=
 =?us-ascii?Q?ynQBG5f5+YnnT2Dbof9o4WneQ76jLk3ngQkbPRJ9YENgshDarY8QhHmRlxCV?=
 =?us-ascii?Q?E9dMRTMw4HWKKOatOPk5wMx1fGD4bRAtQ4sGVxBt1d4rdpzdyW6BCu9hHbxq?=
 =?us-ascii?Q?j3UEGCSxETX+WJ9H18reTcxeXCoOuxxS1a4HW4Of/I6HZ0+zTrnf2Mrkghxp?=
 =?us-ascii?Q?2K0SGlh+F8BRjAkomfMZeCtWQwAVXzibrN3rI+RgA+wt+wRY0middmMA+DG9?=
 =?us-ascii?Q?EIvvqhsogDbvGILaPbZxCV/Lga9gKx76ngE4TJNzLkuPlYhGYSoutnLJXz/u?=
 =?us-ascii?Q?uKQSOEH/gL9uE8hifeeyep5K1AkXrpqn01z1l6AU7o04UoOLTuhw+DQgcbjR?=
 =?us-ascii?Q?26dKut1JuA8yFopgIL2WPDOAqGIoduVNKj4a15vLcmEYBSUOJHVtfltn+5Ly?=
 =?us-ascii?Q?+6FHZnbFro5qGeYHML4pHgaQf5L9GQMTMuAL6lS0G8eW7MSPT0Rt5YinKaMB?=
 =?us-ascii?Q?zbkhHyEOgI9ZkKxihXj2Wd8nHplb859aaDy6YElYHZ14A8Hy0NdQsl5rHIRR?=
 =?us-ascii?Q?110lkgTzSBuyoQl6TCHAYcAcz8YFTAM0i2n0egTSPpyBquv9CC3CiLiw+HCM?=
 =?us-ascii?Q?zcSp28dQnhjbsf/Wdy/xp0roGa0utQzt8fgaBH1f0zB0mFNHLH28Ai5umqID?=
 =?us-ascii?Q?XfwXcRi3ME/ynmQxddfB9DwZFv11rwCKjbZMmj3VkDax3ZqRWdSV9Hug03uE?=
 =?us-ascii?Q?BGaa+e9K22Z6mBwZHsKnNZhun3ZtlZpOVDwIkz9JkFugopkcgevYUCaP1lMT?=
 =?us-ascii?Q?/ZcYSo6d+eiTFuscCr2pAbyAVeUem67Ydi7nx7/GJWRngKIFI7QR5Rt8o89D?=
 =?us-ascii?Q?0LR4wR9+d/hYkstlQJvKhwn3TPKi347fILP8aP+/vd43jEUQDVL/SxVDXexX?=
 =?us-ascii?Q?6OEzeuFvUfaEtblV073HNObYg1zMPELlel2TLGC+iewRJrRQRcqiilMNqD7B?=
 =?us-ascii?Q?nHNw9RUOEWnTm1p/8q9jqjzgB5nQsU07gsg0eWZ211T2Lo+BHytaJZVKfOGw?=
 =?us-ascii?Q?ykdV2f3epmozQqbmurq/sm8Op92G8hpiLmB5q4ZGKdwujkpyTDOrcidjetNS?=
 =?us-ascii?Q?RkjSGjGykZwuim+K92YfXo/AqXlbbEP1jGU2S2u3DwBVqJ6OpvNRYyYZPf3n?=
 =?us-ascii?Q?NT0IP9tMSGs2tW17v0W3fXFoPK9+jRn+y2F7asZZT8OidtmEBaS0DLz8uy5e?=
 =?us-ascii?Q?jI0YVnP+j0nvm4yiNmTspYRkMrRUbJiY4aVrIue0bGi8o9CxmlzSDuVLU0Am?=
 =?us-ascii?Q?tHpNRO58AEiCi/qcvZHKr0hmffx7hC1rLPqJG28k8gJAD+jVZkd4DkVoMHNm?=
 =?us-ascii?Q?dgdI+K1YLInv9dXZ4S9E8oER+qTM5GrA8idS4bQeSGBZeHwNSBMfd5q41L0c?=
 =?us-ascii?Q?PVobsPfWOrvS83n+TqOCq+FQxom3U4tFrXE0Brdw6tVEvE2JGccVn7Phbydx?=
 =?us-ascii?Q?x8BaIym3n1iuhngNnSpzv8mInby5/XAVlC7Cvk3NKptn3g6uhYDMGmlk52R+?=
 =?us-ascii?Q?yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 07ec3e50-22e9-43f8-d926-08de0c4c4fb7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 00:38:22.9424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fB0YHz0gl3jlSpygjRxgkTh9/htDwnROdv0kjDz3ec9755Gwx5gzRcD9DdW76aVd8hZI5plgbCFLTr1mpL5UNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8409
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

On Wed, Oct 15, 2025 at 03:19:34PM +0100, Matthew Auld wrote:
> We have an extra two dwords, but it looks like we should only need one
> for the extra bb_end. Likely this is just leftover from back when the
> arb handling was moved into the ring programming.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 6b6caeb5cdc6..3801152b7f8f 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -847,7 +847,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  				&ccs_it);
>  
>  	while (size) {
> -		u32 batch_size = 2; /* arb_clear() + MI_BATCH_BUFFER_END */
> +		u32 batch_size = 1; /* MI_BATCH_BUFFER_END */
>  		struct xe_sched_job *job;
>  		struct xe_bb *bb;
>  		u32 flush_flags = 0;
> @@ -1312,7 +1312,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  
>  		/* Calculate final sizes and batch size.. */
>  		pte_flags = clear_vram ? PTE_UPDATE_FLAG_IS_VRAM : 0;
> -		batch_size = 2 +
> +		batch_size = 1 +
>  			pte_update_size(m, pte_flags, src, &src_it,
>  					&clear_L0, &clear_L0_ofs, &clear_L0_pt,
>  					clear_bo_data ? emit_clear_cmd_len(gt) : 0, 0,
> @@ -1876,7 +1876,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
>  	struct xe_device *xe = gt_to_xe(gt);
>  	bool use_usm_batch = xe->info.has_usm;
>  	struct dma_fence *fence = NULL;
> -	u32 batch_size = 2;
> +	u32 batch_size = 1;
>  	u64 src_L0_ofs, dst_L0_ofs;
>  	struct xe_sched_job *job;
>  	struct xe_bb *bb;
> -- 
> 2.51.0
> 
