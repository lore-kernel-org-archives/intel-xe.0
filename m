Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0F4C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 22:51:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EECB211384A;
	Wed, 17 Apr 2024 22:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DQf2yle1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93BB611384A
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 22:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713394271; x=1744930271;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QfMGOZ1Z/ZcTW2jMNny8bmddNBGtFBySWix5Nfv0Wjc=;
 b=DQf2yle15TYrpVTm0V6SCQ8QV5OVZUIK1x+8bkwNrfFdzoTRaVqY7tzM
 zWKPbhiTggb/qTqVUH5Ws+PkCH9WvTJR6gkohUMQ0bmbl3G8jfuReEQ1/
 G//LoEir45CE6IJmvASM/KyOZ4KmPNanFYttC0jax9f81wN7NDicpIdAh
 m+JwVd5Km1ivQcY/8J2OUTOAb/hcb55Nc8S3AxKxe0Y6mqZI2KwoxrZ3O
 U47y/bDD6oT1ZndNO4q472V9lFh4luEnZoRaYpTthUK305q89O80AZ5s6
 IljDCxCq8FRAhzb0i24HfKXOv1fWzOT5XH9Ze86WlAycmdlWQDT8p3vI6 A==;
X-CSE-ConnectionGUID: XgNucl9IRae1VuV90Faayw==
X-CSE-MsgGUID: 4fcSl5cwQNatc7Y9C247Wg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9032754"
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; 
   d="scan'208";a="9032754"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 15:51:10 -0700
X-CSE-ConnectionGUID: 5eqih2hvQY+P+uWV3mM3jA==
X-CSE-MsgGUID: r2+068RVS3y3lKDLvEl7ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="23374028"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 15:51:10 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 15:51:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 15:51:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 15:51:09 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 15:51:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Np3Afg0lhupl4efDCXEyNe5Avgavn9ld3kVp9usGPkYnBS1VpW0DVfDSPzSmddXpFGtlsHlD5OcJKOlJQW+uEdIdEn1Lfo3KbOeoN0UqvnxVHYMeNyw+vi4wNMUGRvG/7uExo9OmSDCXu1UN1OGumQrhHgiKik62wTDNkEcEzum16pp3I5WEROre2UMFOJoz9fC9q1fmUfvkZSBmvgqtuFpEU4JcG4l7HoAuFv5uLpofCnCnz/Zg2R85vUsZGvXEoFrzTb2l43H0PobGFv72a1cQBA2btXxlBCt+jO+gAPF4VY10SqxPGGhkAr7czjLwfrg3QnRxHx1glmeW4ogTXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n65+a8ctzPw8GMvwp2+2GFVJEC7oQZzKaYqaDHEzQ0k=;
 b=hCwz2g1lESP+yaUBotQRdLf7cn+jecQKTXBaUBKw+iXFD6UUeZi1VT0sQgXSAD8gwNrDw1Lw+qSjdYKaDuZMRGpJfEtih1ICNqWRRzxCcHrheLXxJMqe30xsB9cJA9KKZ6wOorkgWLi4N274ptxeCRsUpdm0VVnbFLv/hJEbJc+sAmF0+lXT6tDgNK9IH/CyEFrYafJzRi5joNL14OIZdEUs/pWdy371XFVM8zPOpVS3nPK0C0LiUnsLp5HUQUHDUUyFz3twyLKSlu+nZjuVuhsyhO1RcwyxR1NqM/nRN9K7ztF6aDR9RLO/RtqARKb4nx4X3mkPeFk6xcr6eMY5+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB8541.namprd11.prod.outlook.com (2603:10b6:806:3a9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.37; Wed, 17 Apr
 2024 22:51:07 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7472.025; Wed, 17 Apr 2024
 22:51:07 +0000
Date: Wed, 17 Apr 2024 17:51:05 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/gsc: Turn off GSCCS interrupts when disabling
 the engine
Message-ID: <vw2psk5t4ytnlh7dm2o4lrpmr46sthe22cmbulr6anxmhzwtou@pjh2wwpdujbb>
References: <20240417211224.1359313-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240417211224.1359313-1-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: SJ0PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB8541:EE_
X-MS-Office365-Filtering-Correlation-Id: c864bb56-ee08-475b-bb17-08dc5f30de1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nfCjgIioMJUtVIEGuU1GEeRV6cgO7mgwQFCu515KMf+GpKXIh4szgUHnONOlU/K0FGjIWdLuLTBl8kwaiwiaxP6NhXs1921RZ9gnHKj437SkfqL5flSYCm0MjTYRUPeIzkypot9ZthFszIIU6b5mBLJSKXXueEb4pszGWmfYn3nd17/PIS3Q3HzVrjGLfIr3QjScXHyL2hqL7BVlUZCbj0eGxac7V8MbR+zVj3M4PB8xjpJ7eyf5UU78yNVC3VMYZTCDjhZB7+duQuVlNyJlQn0zz8gHw+9EkJwpM/ZYvCkUh64QLHvIToZ9WHt++AmlVud8rHZqozeuLAIKde8Jiq2wjGFj75sZwGaiCB8zK14vvHDxSSNlA9gqPGKBds6c7JcZjIMWyeKnqqXG9UmiH0Hvv6ZUNoZUwZysc/KktUmjjx1Wr3lxHsv6ARy3ueDKdZmQFIF08O+A1v+3071ey5VH3UlipVUHhkLLFFM2POGS99EuND1LUg8cNF5dnfFDWi+9ZicpZjISpAaioMK8Em4elN6ik68jue64vZYIeOSG+yFUjAsrz811xfdnUU4cnq2vuSG0Aqh/m1YHSFjfdKpw0z6aHZUmLVirjMLO0K4hSiPKydVzHOmpHGwhkdD37kAjs0Rt+N7uiQiM7pLlt2a43w9bVWfK9HhLUqfHew4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4NCFLctNiLLDMX+WP9o6X9f0/7lpSkLUZhXUsdXE54Yk0aOzn+mM+XGRuRNZ?=
 =?us-ascii?Q?zwsRfrDd6ufmGi0HTaTzfj7Vn6MvX0pgfEptLOLmGvajiMnBKfdxwzbi+9Iy?=
 =?us-ascii?Q?f+Hu6yDofh0qFua1yfIvIptnaLT/p/GVokvYUzYAGAEQbob/N4k2crqH14J1?=
 =?us-ascii?Q?TCwoJl5efkQPHN4aFjS8azmYtbc5Gec83TosYm7bShFGI91fZ0WbE/7ATTyW?=
 =?us-ascii?Q?FBEO/7bi4GwtpeR1/JYs1x14PsSnY1h8lJqjkGYSN8Xq1buQYMFfWjPgUnmy?=
 =?us-ascii?Q?/CS/PtVFYwbjdWl1egXw3gjMI2O7l1JLLXzTwX4mwe3qMLNMFhFBVKhxfFlb?=
 =?us-ascii?Q?FAlCgffVqZf7xhWb2+uH5pU/Ug2r0UPxqExRKq+WFIDwkdzvkKCEgCwYMEcx?=
 =?us-ascii?Q?hs6Jf3dFT+thJC8gNhusoQjkCtiWhn95O18K1wV7gDqrHdVFrnKjB5kiTYvn?=
 =?us-ascii?Q?BMPbWtIO42IbQhjVZG4CFp3y7yoFjXYahn7TStU+hJzneqaSoOdq1jc6Mr5e?=
 =?us-ascii?Q?kyfUBxURm5pbbuP456jYjr8fLLTgzTQTAP3+XxN7mJJRGywHL20vY99HaIe7?=
 =?us-ascii?Q?xYgn4qv0l4lShVOmJ4M7R66SjhI18UZa2O99XJGyqp6+aCgmQxhs9gKUYCY9?=
 =?us-ascii?Q?Bau/3KgcvjIdcwgrS6jBA4yFhlT1ibQMIF+BbyxH/HGnDiGpAn62No717TRh?=
 =?us-ascii?Q?VvueF607M6D0saPJpc7jLT4eSNbWbnznWwQTPH27ByyKUFutSXTnd5Taidhn?=
 =?us-ascii?Q?HBITRJ3c5Bc2j52M6xqM+tKhDEyc2ICSNLr/8P6XOof1Oc6vJ7b/HrasOy9t?=
 =?us-ascii?Q?PYk3Cr5FBnqbooQSR7nQNoAGWZQ98mQGIao7umi4yPimacmqSse+Wl0WkAtt?=
 =?us-ascii?Q?XFFq53u0JZoHMri5f9A6V6gbsNlmnHAfE53HYGbLz+XeNCXDlTqXomhCOLqX?=
 =?us-ascii?Q?2i7FpLy552CRXmoFEdTdiJ1M5zfdPh6teBSeF+gxphDhXVQTV01QobMV5RMT?=
 =?us-ascii?Q?GWo9LWB3VBL09ETQ9W+HCmO3hy3jpsOkUZ5W+LqTRt050DVS2ZQOKPinwGzt?=
 =?us-ascii?Q?eze0Xd75pLVGROo5aK6LKI9DLugVSQV4oBmSJKai7tt3kcCTQ/MVAdpSZPiP?=
 =?us-ascii?Q?Up9n+ALOrhREs99ytn7WnTW/sdfiCNfw0vGZfVKMcfIYYug9u6kq9Vyf8D3F?=
 =?us-ascii?Q?GZlL5OzvTpwNPNnFzhwWg5fmT+zgR43E7mxQZ/makAEfWKm5dCV5WVczk1pH?=
 =?us-ascii?Q?4ATeJpyCem9QkueOuoSUpjuHZJAe6JugoonM9RVi7bjtGYzzIG827M7y1FHv?=
 =?us-ascii?Q?UA2T/6OgyGk/g6WPbQ6EvMDnrDzyotK2rSuAyUUiSTLJ4sa78IMF3burgJGX?=
 =?us-ascii?Q?AB1YI4hHQSO3jrhMKYStkpOGdpdBrSS09sDVOX3J5QNwy0qUtW84d3YaL3uW?=
 =?us-ascii?Q?Y4ZE4BI22EzsjTIYrndg/jkzfhTeqocHRHMmD80w3y3UplgRLkIj33wc8QTU?=
 =?us-ascii?Q?MB84BweBq3Nthigw8m/Na95y/O7iyiYxabZ4IkN9xjIhRRUAc3GIjh4namRL?=
 =?us-ascii?Q?tGd2S81bgJzyTi7P3gSrjqTXgeSiTcniTZgkXYbHQdFusuFY2AY9O0A9AXo2?=
 =?us-ascii?Q?7w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c864bb56-ee08-475b-bb17-08dc5f30de1f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 22:51:07.1067 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2rpJjy3xIc2BBg1jAYeXkFoDAzFGMGIdtSss1MrVnDLNanbnpaeEq/2tB6JS7Gz3datUCB8DH2NRBPZAlhtglkYdXKmvUPfLcQx69Mkc8+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8541
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

On Wed, Apr 17, 2024 at 02:12:23PM GMT, Daniele Ceraolo Spurio wrote:
>Starting on LNL, there is a new GSCCS interrupt that is triggered when
>the GSC engine reset fails. If the HW is in a bad state, this interrupt
>might end up being triggered even if we're not using the engine, which
>will lead to a warning because we'll see it as unexpected. Since there
>is no point in handling the interrupt in this scenario, we can just
>make sure the interrupts are off when we disable the engine.
>
>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_hw_engine.c | 5 +++++
> 1 file changed, 5 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>index a688bb2d96ce..b9c5690c4d96 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>@@ -720,6 +720,11 @@ static void check_gsc_availability(struct xe_gt *gt)
> 	 */
> 	if (!xe_uc_fw_is_available(&gt->uc.gsc.fw)) {
> 		gt->info.engine_mask &= ~BIT(XE_HW_ENGINE_GSCCS0);
>+
>+		/* interrupts where previously enabled, so turn them off */
>+		xe_mmio_write32(gt, GUNIT_GSC_INTR_ENABLE, 0);
>+		xe_mmio_write32(gt, GUNIT_GSC_INTR_MASK, ~0);
>+
> 		drm_info(&xe->drm, "gsccs disabled due to lack of FW\n");
> 	}
> }
>-- 
>2.43.0
>
