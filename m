Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4070EE14D3
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 18:49:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7922A10E706;
	Wed,  6 Sep 2023 18:49:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 140F710E706
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 18:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694026191; x=1725562191;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kzjkhPCVdTTDWZW8iHqQRZU53jWayhH8B8Ic89eC+Vg=;
 b=EIaSqY4Bk/p7PDAdBtkaC6GWTta1cqfpakncDMydXqxngTIFcQX3deMP
 VpyhgdbIRCxUoA5/o5QFYn+sc2alTnPxw4dP1J1w4HN/GuQ0NvH2j9pRz
 GPJnz8RqHFOJb11gCXzPqxZMlYMdLUR7H6VjSesXh6p0JiOKrNI6mGE0t
 bG/YgxNBfRpFnZ9pX2F7z1TtZHYgCRZX89PAZnUCuPRqrTF1+NrrmFcHs
 9nKsVChZwBBcr/tsINuT4FSzE4P1L0Vzi3KVXqwLW/BXRCCmEteA34Y00
 K85Ou0ZERUN16cChrmylL5ZzFpAuPWXK1qVLXM0gelZgf66mMOA7dW9+s Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="362188690"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="362188690"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 11:49:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="744791626"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="744791626"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2023 11:49:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 6 Sep 2023 11:49:42 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 6 Sep 2023 11:49:42 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 6 Sep 2023 11:49:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZYvUL+eb/zJtiSev0qKGp0J8xP9Rns/xCGBxL0kBRByOuevXzD00nHfrox+rsOgR6gwyirnMGz+94t1V0vJa9e5/lBKz1zp9wneLR95JOpgKeyxm5TAQMmb2iseMkIqrNHnpqkY52xqqOW9yBhwzJ1nxejQRetMKwJsd6mRCNW8YtJl+RRFMJ7/MbFIgPVJ8zDiQiCQWcvcM+zOeJ5s3IblkV5J6MTCztWW2fywshm0Ei7fuVnBpf8ui5+hc9j8q8HsZ5GB8L2+zQVZrvsj8YfOre8l1ivSmO7NpaVSauhv7HV4wWCrUm4YP8y1dQDHWgPfR3S59ptx/ghSBe6LNXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUcIY2tHUY70yMR1CQVHyW83QZfyN++6R+va9in1MjA=;
 b=U8tieDa1BN7VtqrHxPCFoKVOOBr+wsGjPoHNAzdbdmNuNuTDeYxvx2bDx58fNq1pV0h5WpXhgsjjajxWbJyOebXVtAczPf6eyWPAPFhP8HI52G20I3maLFriMZ5rVX+7w1BkSXvaGvqHgNI0t3PGnkBkMQMgSphy+7zUaKADvUEqUgt7qPxn6/iryLfLQaBi+vdd8yumKpYH6ISA7+Gr4gxv0kvmGsif74Ecaq3jBodC0DTo5PMl2DG9NobyW4+eKOKYtLPa+V+f5LVeXfEjPt29xb6XSLkt4w8qXKilCC1s+PXebToP6wsf2nM6sjhsncyg1sfTfb903wqEsDJoKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BY1PR11MB8029.namprd11.prod.outlook.com (2603:10b6:a03:526::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 18:49:40 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 18:49:40 +0000
Date: Wed, 6 Sep 2023 11:49:37 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <26hcp33tuu24jtl2tyo7iyqaucnkbww3sd4na4k5boa577eof4@axnzegfuxdya>
References: <20230906060400.4144425-1-balasubramani.vivekanandan@intel.com>
 <20230906180457.GF2706891@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230906180457.GF2706891@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BY1PR11MB8029:EE_
X-MS-Office365-Filtering-Correlation-Id: 224a75c0-d0b7-4cf1-fce7-08dbaf0a067e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G5vH5+T+eKtjKqiww48GiEgwW/dOI0OqBLR+b50ixnjwvdEhHkJ/I5BDJlsmh9JJxyRjLK0fy0V9QSDVDNpFUMDXEz594zzq0+DoZ1xXVtP7yDY/B4qi4ngfP/zUwNTomUa9/A5CEgvkjI8A9LpJPoKLhnaECtFp9uCQXhZWdFJY7jBle0/7P6tgE8dOfsnGONYqO5M3rhpNenBy0c9RaAXGoZ6PsnK/soVI32yoc/MU3OOwd1PUP1uxzy0euNSFkUSJnnK4vHA5vLlrn8lKNqcSPkHeFsnA0wZPrKQaL9Xyxm1ag0K7vfWP6oIKe0+OdWxiDQTAXCFfx+A/9/pQVMwbtVIRWrywkf+oAU2kBA7QLVg5q+259nnAN6WrIxlSVzmzhzjGBg3SbX7SDkW1gEE3vu1VifdHTH6Su2v31Qhipff77LqabQ6m3qCB1H5RBd7GBUbx1PftptMmnt7LGwJKq1+ubH7vORVbltp+Wvh4lCtw0/6Y31CuwpC4ncppZa40bVNx+XCyNiomJdx0tKoqVObPOeE74q57qYfr5aHUM8AM3Pm7+3kSIgPRZ/yVX9/4+1ijQjOTeQLDyyhMsgsdFIRyJCK9bGiCav/6KN8y1Sx2QP05HZQjB52p9ZF1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(396003)(366004)(376002)(346002)(136003)(1800799009)(186009)(451199024)(33716001)(5660300002)(86362001)(41300700001)(8676002)(4326008)(6862004)(8936002)(6666004)(6486002)(6506007)(26005)(6512007)(9686003)(478600001)(2906002)(38100700002)(66556008)(66946007)(66476007)(6636002)(316002)(82960400001)(27246005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ut8Ch/5AJTIm0H2GN5M5sgsLah4HQ8xn+h9yaMywzpVvyQj/gf+AwrkCIHif?=
 =?us-ascii?Q?7vQ3ZhCUIqKFglq0u2V1NMcddmoLn283jv0w+7EfP1qAHz12+IsXnlq40moN?=
 =?us-ascii?Q?z9K3KmQD4b9Uh0rzLaGBtEHCKMSAQKqpKKG8O+XjczroUicwrn+BlCT9BUUr?=
 =?us-ascii?Q?te16Hg7Y7tyRtngRu9tYx6Mx8hYSBDK4+O/YYfOQ8sVAHUsac1JzSg2qcnEA?=
 =?us-ascii?Q?HWbxm7AiNLxgoymseRiAOcy2CEwQrt32aKf03WX2Q9EZorNbmsks0pvwh/0P?=
 =?us-ascii?Q?rptmK5GE4YhXdiEVclM1J9e7AfaARzvGP/HjrA2upqnbBfSaGy68wcDwbcWU?=
 =?us-ascii?Q?G5IaOYoFohd/+mZaTUZqa+0a9fVqeOqZgllEX3tE0oDjZzEqaIBzgDvbjMH2?=
 =?us-ascii?Q?bUz774eLQ9vPEw5jAS3KYPF6tPpFD2TvvS9R0O199kJHE2pqEKQ8a7rK3e6X?=
 =?us-ascii?Q?OO9ibtASp0byJE5jvIGCt4Vs6ruvPfBE997EZ5YaTuoWv8VHoyvvmBnMr3Ly?=
 =?us-ascii?Q?1Yer9B7dkD8PFjyQYMejGzMrzRRxg/vlsfDaK+I6p+CH+hiUscO83XhUMefB?=
 =?us-ascii?Q?QXxWJe2iy4cyLF5ht0JYMK/PBueY3OhH6URRq/HmP8SLivo4+vwDPkKX3Af0?=
 =?us-ascii?Q?vZ1/A3VVKYo64e09LOtjpCz3pwEHX6gtQvZA8m9hvIqESeT5pjAzGJybyGzE?=
 =?us-ascii?Q?5ko+MpJ6+rp+9G+foLXIbImgk+D29GKZPMRF7oW0udERKXw0xnq7UzkaeNlf?=
 =?us-ascii?Q?qpNenU+3z37BQxw3T/SRxjlEWJYzCov2IL7s0vAslcsAvwP0H+93XQ/Gz5qv?=
 =?us-ascii?Q?X5A+YTotdeNrPkoY9Jp6sTNI77Ik3tDPyyVb+zYDTc91NmyD+RHzPu6aMKra?=
 =?us-ascii?Q?hgRatih3/UdOMvjuXo+2g74ZWvifKvDJq8UImJfUdkHiZG392ch9bjzSgCjK?=
 =?us-ascii?Q?pFqkJKTZKGqUlAUJ9fxbxBjTkEIOJsfEJ/PlW3ADm5y4K/2renR5IHk3ZGXd?=
 =?us-ascii?Q?O1JDPl8sB0TW7H5TQgAicKjqvOpEHMuQ0Xx4eDjJsWhBi8uQ0atSx3sq3TQs?=
 =?us-ascii?Q?GMFLrGZfgn5FHMEXuzwyZ3fYtVcUuHGogugJh3d2RlpYu5/XOGjta1vBhIcJ?=
 =?us-ascii?Q?jDqxTVo7KCl3heqeojpBK3ubKEJsXM3yZxWBVTL/qXVqWEDoDzGnLijPasgf?=
 =?us-ascii?Q?OkhP8T84rLjgzTluKq0jPuSoUS7g4GBmEO6xBQ2u1iLI31rAwxUROaw769qC?=
 =?us-ascii?Q?TErD5GkANyU669QJDrLI61nK2xMaXu6+GoUQMP+Zh3XVMjtsgw4jXzYzELMt?=
 =?us-ascii?Q?aXgU6Iq6pVW6Vp0XGtl2vImCAklXP6la8+zt3UUrXTD6QKHS7djMVPq2Cxdl?=
 =?us-ascii?Q?GWNxsuC2lJptk08h21MEashavvtpmHZsfwLUpCg1D+3WpVEY/JQySR5vF/tb?=
 =?us-ascii?Q?Xj2TxrDV+tdQc75nqW40uTiZkJeUDCda7R2ie4ElcWXEmWjVfwjNeNDkiuiM?=
 =?us-ascii?Q?GSc/cXaQJjfR3O9F9ke8NhjjwAd11Ni7qqmVnjdncEsBwJ+6vJBBx8KbW975?=
 =?us-ascii?Q?CpZ0ExEvNupIQuFlkax2FwA3p3SzyO1BeEGK8ados+yhO166E8/cHtzKj5G4?=
 =?us-ascii?Q?wA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 224a75c0-d0b7-4cf1-fce7-08dbaf0a067e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 18:49:39.9802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FVii2WlFINPst2I06zvpx7KKQX+LbYuNUoKXFrxJvKiYDGSQzdOjq9d5j+z9qytOnIzaTFFbXgjkzIlrEMTL9JLxjfJA6Hj6gfcpnbwrrng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8029
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/display: Print display ip version
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

On Wed, Sep 06, 2023 at 11:04:57AM -0700, Matt Roper wrote:
>On Wed, Sep 06, 2023 at 11:34:00AM +0530, Balasubramani Vivekanandan wrote:
>> Print display ip version during module load
>>
>> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_pci.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 60f3474844e2..fc01544346d5 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -844,6 +844,11 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>  		str_yes_no(xe->info.enable_display),
>>  		xe->info.dma_mask_size, xe->info.tile_count);
>>
>> +	if (xe->info.enable_display)
>> +		drm_dbg(&xe->drm, "Display: %d.%02d\n",
>> +			xe->info.display_runtime.ip.ver,
>> +			xe->info.display_runtime.ip.rel);
>> +
>
>Rather than printing the display version here, it might be better to
>call intel_display_device_info_print() somewhere appropriate which will

Somewhere appropriate would be xe_display.c, so it only gets printed if
there is display.... or if it's moved to a shared function in i915
itself that we already call.

Lucas De Marchi

>dump not only the IP version, but also the relevant feature flags.
>
>
>Matt
>
>>  	drm_dbg(&xe->drm, "Stepping = (G:%s, M:%s, D:%s, B:%s)\n",
>>  		xe_step_name(xe->info.step.graphics),
>>  		xe_step_name(xe->info.step.media),
>> --
>> 2.25.1
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
