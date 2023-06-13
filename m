Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7691CEB64D0
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jun 2023 18:59:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F19D10E108;
	Tue, 13 Jun 2023 18:59:29 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A06510E108
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jun 2023 18:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686682767; x=1718218767;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CDv/32l7kNQqfovriN6Dnuenc1rD+8hsAJa3GSC+Hic=;
 b=kH0sDKMS1hcavLnU2BlDU2FkT61gp9zUwiZ4zm0/wlYT1zGdUPAesK35
 NPcqnve/45aizM0y6LkUIJSNnsxNrRuGooWP7QHGWUfGHzmr8qVmr53Q1
 SZKkoyLjdfXoX7HxzDMEAgSdB0jj4C3u8qNvKiTCdug4nFNUWFMemo0mh
 R1wLBEVnlIb7iO/d+z+mitOIUviP2x1x9wORSm2so5IpP1+VmSsmNM4x3
 MdRvgcB2ysWSYPuGTnh86lLZOImWHPb9mQ6KIoZ8sVIvnLhWOPLagWj/A
 0MASMoAkUL61rKj1pdSxpvG3wcDjSx7lMqlFbhv1MK0aPfySzV0BSUGH2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="386830513"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; d="scan'208";a="386830513"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 11:59:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="776946078"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; d="scan'208";a="776946078"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 13 Jun 2023 11:59:26 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 13 Jun 2023 11:59:25 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 13 Jun 2023 11:59:25 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 13 Jun 2023 11:59:25 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 13 Jun 2023 11:59:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oTdjXfaavO19AMziphMiGE28vx0tv5fwamqhyB1z7j48NFEAPEMnTj/G+6LBriDiKaSNM2joz7vwdSmdsMoagRZeBdAY4XsQQRCftY5W661aEoRXcg2cRtUy353LYvIf1/N/JYE3s0u2W65W8Xrur3VHA8lycm+BlEQKOJ66XATW+irf3kn/zicAaratTedBzElTHGr0JkF4kbafBQ7jebsiMHjpxHmxkJtfO3CdMhkKLumYVVC+3k+Cun2HoOq8QsUz96fGA0dfY/lZf2wWHgMI+5f115CovJbDSeuZ56CZntz/L7HM3Vygphv9qgCKy+qR9GowPbxCMLFcUoeonA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u7ggL1D1SivpS32HCK4BpJnF3cY0fq67RpoZxR4A2X4=;
 b=ezIWRKvMDi5Zb6zSApQNWCmg3SejFiOf/DjV4+EFwMPGn4O7JQ4ai8ozwrYxYA8Lh6/+8h13qG+QF5aY/CCykJaA+HOcoPwUzCvL/IRn9Oof8sY/v86ds+OMj6kf3FL0AUatrQXTpool8uS9OMCf3rpXbWngEhdGe//RZVi3S2NxrYXZkCPxHw0ifBg+fZ2oScyK7iiK7AYF75nor5eNW6ezS/trrgQGw/o6nNjzzKGVfk+5+3jQIjssSz5S/92SD6L4E0O9HvdtUfdJ4ZgPA1N80Scrfq8dO/cReLJ5+8zoz1X636HHFOoKuxHdM6ph5eVXqZDJUJVGXQUW6Lyv3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7770.namprd11.prod.outlook.com (2603:10b6:610:129::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.46; Tue, 13 Jun
 2023 18:59:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6455.030; Tue, 13 Jun 2023
 18:59:20 +0000
Date: Tue, 13 Jun 2023 18:58:32 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Message-ID: <ZIi8WEZD+4Pc3mKK@DUT025-TGLU.fm.intel.com>
References: <20230613094232.3703549-1-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230613094232.3703549-1-riana.tauro@intel.com>
X-ClientProxiedBy: SJ0PR13CA0125.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7770:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cac5a32-6415-4cef-c31b-08db6c404b7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ln0B7CxGPRJbyxZ7Fwq15tzVQVrcDafhav+IKvXnLmn6YtPMRhqKYGeSnyNVD/JO+u5Vcoc1XZjTLmxMdAeTjR52HcNgyKUtB+rSbIYhjGMZ+//QF7alnAmEVgPyPTmxndb1rot1cndLHVfCHuimkn37vOmv2ZVIhY5Hxfx/wTd43wZWY9fxQgIag2WzzcdLENAK897MgzNsoVj/wj8kmB0HEYMHwQSzVUc+V8wKNL9LMSYDFeaCz+9EMvLv02ABfGprMrw5HNJRoCr9MxvXWmtQAoxzlru2ouarugQbxYsSRB9FxINvV6SnuY2pubt8sq+8WbQXQTNOFTJ945En9PivIcd7sC0BlulPmaRnN47SNeOsQI2i7JQ2zzvPo+gGpeLKi0/srJkeUXUeP8qHQcXmJjfdbGbYZG/CL3QbqLMyJw7ZBWehX2KTfkqmW4ae+CeMiSivigwDwLWBdbnRFHaMH6s1FNnzOK3n4rNJBTe4qzo1THwBtCzoV2EaDaeFOv8wfJjJKWxjo3q3bYhvqgTsoKsuIOn2LwzHEjbGRqBkBpoBctW7WfwD7hB+0E8eS8H1y0nQQZ+1QiKGLdmSakaUVMaAlQclSrKkD9WugI8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(366004)(346002)(376002)(396003)(451199021)(86362001)(66476007)(66946007)(66556008)(6636002)(478600001)(4326008)(6666004)(316002)(107886003)(6486002)(4744005)(2906002)(6862004)(5660300002)(41300700001)(8936002)(8676002)(44832011)(82960400001)(38100700002)(26005)(6506007)(6512007)(83380400001)(186003)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AqcoORXqzrQiUpiF4DuKoXH34cVoaXtHQvB54T1WvTOlKAzJBGioLlVn46IJ?=
 =?us-ascii?Q?GieDD9gjj++ONbyxR2Zo/PDYi3XuoIKQkuCNxB6L6HwdZ5lxLE7cy1lyugqi?=
 =?us-ascii?Q?o4Mr71JNnsEk3zJdvkzUM/GHUFbVSz/FkQ7CIgZEVITLXdmxAM7hD0mFv+UK?=
 =?us-ascii?Q?S0uGPXG7AMRnrS90m5M29NxTeURVjyGmnzZPlEk69JoG/KWo0Tt2vvEtj/lA?=
 =?us-ascii?Q?AuKbDGwe69WMEKGV6OJEWH8K5ZpSW3i4YqLXQqR8TCLyAp+DfH9uol1WzwjL?=
 =?us-ascii?Q?ETKBZyx9x5hYxaM5EnPHAC7cLtcHio3FUPuX00oabibLtLOI1meP1cf06cCX?=
 =?us-ascii?Q?sZSx4utQVr689jgTCI7FKnCHY1x6wq5B98N/CyNJGAN+vjLDiqUJ2PJ0UABY?=
 =?us-ascii?Q?VeVJg8RklD/P+gxyXdhidiYyZVWOPC9Q8m2sSso3mrHQmD5FR3smCNURjaln?=
 =?us-ascii?Q?LoUeQWE9qtOG4A6Ez0qEGxH3rlumCCviFyWTpLE6EdbmmJ2+/6hodkowTIre?=
 =?us-ascii?Q?7e5saurGfZJomWkkRBDPxQ5ZejHTcWQgdsCLA60dkmkO7o9xt4B6X4TB61yF?=
 =?us-ascii?Q?jsgnUZ07CC7uzGE81oc3CZqpJSzZ5l+EN3ousw6EpSDDrh2Apmbn+O3VooD+?=
 =?us-ascii?Q?aXGkVxwoquxUBMtm8nsS6n1jhthwOWZTWaS1srhdxzZirZ39WRhaixLBPB+Z?=
 =?us-ascii?Q?oYVwLOue8chyy4Qcn0VFkGP11olvtFLP4t9NLt6fJJ6GPS2pScWf7b7HctXW?=
 =?us-ascii?Q?5ZlJ4Piy4v1eWtEjkb/VEQbBlIOlE38DFJg1sf/zXa2oL4+Lq+/V0elvE7+Y?=
 =?us-ascii?Q?GLPH9wyCgDMN4O/NjH5egVGRHZV9o8MgAF/a210P52e+7MegEUL2Oc3Innkf?=
 =?us-ascii?Q?ttWGN0XRnKIJUFXHZdnMwTjihwbSEFp9yOWfq+9hAFmVfRzP2P1KxNerXDBL?=
 =?us-ascii?Q?AvZ+QHWdEFlSXe6Tt+1YqBBFDQAhyEW++xEGTiDqlq+ye5Gzl9jsBnPsiHGP?=
 =?us-ascii?Q?1wtrgfUJdSmj+tDdPs/VoD0xyHeKopaehvCKywvn9KZPPdfY6gPNFUva2nsb?=
 =?us-ascii?Q?e1JShqqqog36madIjaTKiJsgt3vR1BxOlWaTXcnTW15Mg3xbts+he6qoWYRn?=
 =?us-ascii?Q?JPBUO1SAgRdvv66VGxt2pgei9Tz1ttWsRZYsuW1BMRSSpWnEeXsCdjf+cqeW?=
 =?us-ascii?Q?tEMKl9WX4TCGVgbLNnIIiW9pPip4FMmHZ+1WLmTBEQqfVR6Xr9YcdP1xeD/x?=
 =?us-ascii?Q?Q7lpjcwJhRfeFmGlfUCzwff8XbYf6t+K34KndqvJUYDeuOJU003KXgIwPk8X?=
 =?us-ascii?Q?0yeTaMTMUMTm61r7M/Yi8Xb9IRNAdjlaTVKmLi8Zd1YT18KQ0U6rBgq4SxdM?=
 =?us-ascii?Q?TIF7QXonGNxzCDn57ODohqvntUm28ZRuyBdO1u2Z7QZuJaiVNsWXYoFqDl4H?=
 =?us-ascii?Q?cEY53WpoReEZSeEannArlmxyUWg7PUHFkBUgmV5jfAI/zvgIJnQiLQJo6MSh?=
 =?us-ascii?Q?zxWrIX14e/g526EaDdgBeI7JEui9B9Way1TLUkvhwh+wnMHBE8bEaUduFBGr?=
 =?us-ascii?Q?exisSBxuXsQuaSrn+t89dCaesaa0HmqDyPNCnDQYFVG2uV0SVT1g7owpzdev?=
 =?us-ascii?Q?wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cac5a32-6415-4cef-c31b-08db6c404b7d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 18:59:20.5107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9+IGT0xA6ODK92X1V2fBotS+cXnsW/kTfLEuUlDNgGI4u3gKw4cEAevh8atTzlqDJUQnZxjBRV7vo49tt2KiqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7770
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe : Fix GT looping for standalone media
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
Cc: matthew.d.roper@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jun 13, 2023 at 03:12:32PM +0530, Riana Tauro wrote:
> Currently the id of primary gt is set using gt_count and not
> the media gt.
> 
> set gt->info.id of media gt using gt_count
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index bd1f59b49928..2991cf5365d5 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -590,7 +590,7 @@ static int xe_info_init(struct xe_device *xe,
>  		 * up with platforms that support both together.
>  		 */
>  		drm_WARN_ON(&xe->drm, id != 0);
> -		gt->info.id = 1;

I agree with change but Matt R is the expert here.

If we go with the change the above drm_WARN_ON & FIXME comment need to
be deleted too.

Matt

> +		gt->info.id = xe->info.gt_count++;
>  	}
>  
>  	return 0;
> -- 
> 2.40.0
> 
