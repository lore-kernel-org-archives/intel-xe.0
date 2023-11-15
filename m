Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B5AC072A2
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 17:42:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D56FD10E0CA;
	Wed, 15 Nov 2023 17:42:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAFB010E0CA
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 17:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700070163; x=1731606163;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=32yb7nMFWT51zQp54rCIDDpZLZ3ju3qMa5crNP7UhpE=;
 b=Hrgq6n1y8GxAvRqCQLiK/2tlu9m8HSb3zTFuh8DnFuv0XVbU3facOJEI
 kjiHiw054/ktUZ0QfNSeDZxDJkGJOft5JyrWZ+GB2sli/Jsbfa7j1vJOW
 hQfQqV5Z6FwBP76pj4B4E430k0b4ugyl4tbDbJdZKfR3JCsQU08O/9Iin
 X5mAyNA7GB4LIhFvx1TS4GUIyZa8MIR96DTTkmxbrZ7fdScWT4XgNwCdw
 X5Q9P1eK8fcasMmhfggtMV5g48WQJ+wJ/9g+LlkWZ5+l/6lHXNfyrudtS
 C1SMgl6gkqCQ4KN/1fbEwLRxhRVuu2NsdBNbouOmeOGLeQpNBgYeHB2tv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="477139577"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="477139577"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 09:42:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="768653620"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="768653620"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2023 09:42:42 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 09:42:40 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 09:42:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 09:42:40 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 09:42:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iOIIIsJY9glX4TU7/Yg/eN563fCR1Dif0Y3PI+UljiKJmSICzKG40tqTOMCoFX+Lj8ffZjxikFNHoGM4cxuiBCoHI1Wuc9I1ed289GX19MklXMd6hH7pKsU7yWdYaoVHiGBgxvViIMCbBCj46TBV306M6ss43SUr11LhGvcPgi23nvvNDkYWh7MA/yblMZDSIOxt2WkiNNVVQTafDYAEtO2WXC4GDkBttLSoV/BYQW0ohXI6s0h175/Jfx0cuuXTEbci4oyX+N/kv43adeYejrLjg0biF3AkXe2T+2zvuInUfbS4HEkr1A4XFNyFtcXh79GrVsvo+EbMoMAovsAj3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4fB89JBqoGoOEiTf2GoDxwZAWrrk80cKlGotZbFGxT0=;
 b=moW3bNQEgr7NFPpG4vi2qTRWWOcwtznrhhplvel3el6YipNxtvprexuDU8UUJXIU+oulcEXoXuJHz2T2iUnNV4f8XLqGuLf8bLkfQXV9MVlBaxXiih0vy7J/KII4HIQojEJuo+kSdpYnLisLHLoFwkNhUnOQlXacdWB7aYKiNdWidiq5fsz7uQvKXYxOdOvJ5v01yN9R2JuiWwRmoOOW70/3EuP+Vg1g++/Z/alAVmDca35hvU0miM41ynr9VjxVzM7qiW0ekj/WpxwvQtwkIcB7C1FZ6xAttoAGl+hSdmlruUr4qPltQ+l0f0Vqa7AxmexRjXLIiA2YtNO4eQ/dcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7728.namprd11.prod.outlook.com (2603:10b6:208:3f0::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Wed, 15 Nov
 2023 17:42:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9%3]) with mapi id 15.20.6977.033; Wed, 15 Nov 2023
 17:42:37 +0000
Date: Wed, 15 Nov 2023 10:41:21 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <ZVSgURHzVdwm1LIN@DUT025-TGLU.fm.intel.com>
References: <20231115113748.1949-1-michal.wajdeczko@intel.com>
 <20231115113748.1949-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231115113748.1949-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY5PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7728:EE_
X-MS-Office365-Filtering-Correlation-Id: 69508138-d9d8-402e-7cb0-08dbe60241da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: siw1Eyf8PXlJgY5qEikWgW0eE7u27K8EFpYklR0dDjPe5XwHDB7mTel7XD11TD7y85v8rDZcc/hNlgItiUbNV6W0kAf5kbvDXuRnIUjErRDCaBXgxEyONPXrllRsCkrT1uO/KHm3x9ZqLWZ+JWr84NXmroOWXFUISHcqaXYZnLabF0YlhexbNKn31IlCrEVaRzIp3TC33FmObrynpe/2G+As0AHhBWvM0CrYwFT3XYTVnPuqFQgvIQzhCzvwfMqpBRqW8B0kL8GZXeoDSwNWDrBTYAfVG7OLizta7v1KsTAp/YghlatxgmQaCxFM7uM696jPQs9VZIXj1oBCBUneIXvaZppk42MVVJ8C8oliZ6sSIWim6KtsHImQAbQtihOCXsVmvEkoED1mpgNZNc5ZM0vanWw/QfloqcX6NK3wGpgBd/rOhGR0Wi58hyzeCHG2CviMM4kMMSs61aVQFvM87H8JQQVyiiCYG7jNa9qTydlHV8IAwphfzN8v6RVqljtLsyDPpjDATeWGMRhDs0tAYZNr0aeN7yWD8QDfkRmWidmZYiScDdHdrl1HvMrLTgtA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(39860400002)(346002)(376002)(136003)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(82960400001)(86362001)(83380400001)(26005)(6666004)(6486002)(478600001)(38100700002)(6512007)(6506007)(2906002)(41300700001)(8936002)(5660300002)(44832011)(4326008)(66556008)(316002)(66476007)(6636002)(6862004)(8676002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mMu3KI7s/SUfVR0hp2cyDFI7YITc4JTi27qqN7gk+JBM+en52rztZSoaQp21?=
 =?us-ascii?Q?Qu5VRe53Vp3h/UMXCa7DL23t0tb316HLdOHrEP+R/0Ju94Qp2q8UOIpwtusn?=
 =?us-ascii?Q?A8NKoqci2ZeQbEOYIPs+UuDOjTB/lCLVmJt+OxeGPktikZBgO9B+DV+DWaei?=
 =?us-ascii?Q?eyvFNrCHnssuQslV7Ntc0HOyQzg+Q2cMqOHqCarfTGLHGCLaAjG5FVB8Z0dV?=
 =?us-ascii?Q?TL7NDWLpA4zg+kLC9EYrMB2SRF17JGbvRPJkOoZkKL1I9rSfUdh5Xdg8q/Pd?=
 =?us-ascii?Q?whXuPag6Pzs35gbJRLayzu1QnWpHHQtYGtM6oyqr0/zUqWLu81MPCPlhrDFz?=
 =?us-ascii?Q?o3qqfuAG+Aos63X5ZQo6Jf/ComLGlk0q1qvWG8Xu1iVOGsAccuX/90oWjw/Y?=
 =?us-ascii?Q?BpUYbJh9wfW2SGROiZsJcu+ZEXZDhEURMdEeLKIUD85UIMszy/FKLPON49Iq?=
 =?us-ascii?Q?rEMoTIuK6718buWcpjDYNSmHs8GfH/4UVrOaszOG9GKf1JNukVdOGgeGxxFl?=
 =?us-ascii?Q?UTEZS2yJ1MjDhi3zkjv6AbAsLkl3Ri0qaVoLItSiwsV2F1mwolEjGa54s/o9?=
 =?us-ascii?Q?4ehwCzr12O+vevyp1pyFixE7zbw/aNl4LUU+yIVLqnIPeXcuJjFml4Ii1Gxj?=
 =?us-ascii?Q?TTAtQ3+VExN1uxMkd3Q20iK10oi8sjuiRdIDx5yJEfigmuG14ACqWFxMWTwc?=
 =?us-ascii?Q?GwMoOD1SykN9f0UMiUeTd45Fact0o1v8p1br6uxV4sDQkXRvV1tgkMlawcQ0?=
 =?us-ascii?Q?Xo0cwItiTpmglVVmBkAnBbYiTIkFbF3njBcec+Tlaa6A2rHC0UriqxKYXEob?=
 =?us-ascii?Q?dh1SZpYoVJ1bSRpbTwWPzo015G7IgzRAo2sBZGM4yp5+rLihC9OT/vhtxJpm?=
 =?us-ascii?Q?8Q2lAtVLqP8Ht9wS7rdT8YrL1y4bFEXcUW51TkNPaxAbqyafGEHBCp3h+ouw?=
 =?us-ascii?Q?GwBR2L59OqhAjZUUgZw9Vh1DGCI8/5Sk9/K2+swrDB1elYQLog2VEbY+bccJ?=
 =?us-ascii?Q?b11E5d2+s+r+8xRiu7JRBRHCp3Rj0CaEDRNfxuo9Mbvy40EfNuUoupOSpCIY?=
 =?us-ascii?Q?5Ru3Dfn7D2YJq1HtO6xwRIORi1Ksbo265couVL3IUIhnn1CF3G8m3if5jKYH?=
 =?us-ascii?Q?0rrzLEk88aIyjqqHCauh+/ek5nBfueEZVV3SQ+U2wmoqN3YE0qHcUmhuUY88?=
 =?us-ascii?Q?XdlRUS4UXI7Oq7dPyoGuIGw5wHRm2MF3tvIudf41JOIrV0u+2yAosSwM+6aB?=
 =?us-ascii?Q?7e9VLH7bSoh8rMeULwsfXlK+h+aSlqRfpLmwFOfHbkBB8rZCPr5ILqxF8ndq?=
 =?us-ascii?Q?WagmZfAV6mZeXrJLFYU/BHeCaOD7nPddvhCwSqb87Od8o9vY2mvQW5wjUNok?=
 =?us-ascii?Q?7ix+T7ErYSYPkdctj6KHCkEhUNzcOh2+5a8G36Y3rfKiYBGdfVsPs/VU8kZq?=
 =?us-ascii?Q?MFlevh+tiHlocdsLNmlnoAMUus9644L2J4e/k+vc/WBoKXXPuJ8ee+rEBsOK?=
 =?us-ascii?Q?Itpb2SGOy3e7TCuak+iAzzDgJtd/yHLJHOUGoC2Y2waMaF5F0cBOLKU4HLBi?=
 =?us-ascii?Q?Sb0yDEt0JMFXHYTf6k4tS7w6t5e4x/Vf3L02Gscg9KOe7rgKyfdu/DeHn8W/?=
 =?us-ascii?Q?sQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 69508138-d9d8-402e-7cb0-08dbe60241da
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 17:42:37.3747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rEAk7SmyfaWbwvKbGuFiKJXTAhClpeC+yC2v0PzWS/dBecbbc+1uiTvF9jXSJsPHt2C8Ti31bbRIAERhPf/tNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7728
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/4] drm/xe/guc: Fix handling of
 GUC_HXG_TYPE_NO_RESPONSE_BUSY
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Nov 15, 2023 at 12:37:47PM +0100, Michal Wajdeczko wrote:
> If GuC responds with the NO_RESPONSE_BUSY message, we extend
> our timeout while waiting for the actual response, but we wrongly
> assumed that the next message will be RESPONSE_SUCCESS, missing
> that we still can get RESPONSE_FAILURE.
> 
> Change the condition for the expected message type, using only
> common bits from RESPONSE_SUCCESS and RESPONSE_FAILURE (as they
> differ, by ABI design, only by the last bit).
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index ddbe64eb0f3b..16c233f120c6 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -671,9 +671,10 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  	header = xe_mmio_read32(gt, reply_reg);
>  	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) ==
>  	    GUC_HXG_TYPE_NO_RESPONSE_BUSY) {
> +		u32 resp_bits = GUC_HXG_TYPE_RESPONSE_SUCCESS & GUC_HXG_TYPE_RESPONSE_FAILURE;

I think this works but is kinda goofy. It only works because 0x7 & 0x6
are values. If these are defined as 0x6 & 0x1 this doesn't work.

> +		u32 resp_mask = FIELD_PREP(GUC_HXG_MSG_0_TYPE, resp_bits);
>  
> -		ret = xe_mmio_wait32(gt, reply_reg, GUC_HXG_MSG_0_TYPE,
> -				     FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_RESPONSE_SUCCESS),
> +		ret = xe_mmio_wait32(gt, reply_reg,  resp_mask, resp_mask,
>  				     1000000, &header, false);
>

Here now we'd need to check for a failure in the header field.

With all of this, I believe it is better just to wait for
GUC_HXG_TYPE_RESPONSE_SUCCESS and have xe_mmio_wait32 timeout on all
other returns. Getting a failure case is rare and we can live a timeout.

Matt

>  		if (unlikely(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, header) !=
> -- 
> 2.25.1
> 
