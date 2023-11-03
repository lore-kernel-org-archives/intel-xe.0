Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47EEEC4332F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 15:55:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C32710EA13;
	Fri,  3 Nov 2023 15:55:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F8310EA17
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 15:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699026935; x=1730562935;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1hQikrIwE6j1S+fnNKUzuFElFHXeffik0jLJrTlhSmw=;
 b=NgaBmP3EiBXxFlk7kVfNhnGf2bvOsqRZRlYJ/0kyf92n3Qv3EXK03Qtk
 id/KtRXyida88vIfUL7FLcExKyL007BuKmiTwGWebi5WDqdNVhwui/4Ap
 pnjbseeGZq4VQlaXso8aXX9KS3B6eCHXowFDGqEhdGbaR5g7HOf/4N4MV
 3ySfUZjlaDDMmOAVyMpHmH+y3uBloKf8YdCzcCsCfpce0yFgGDGZz49vK
 iaUwpSvBFqCCKenv72VmSHzrhuB6V1DhOIL/+ZTUkAyZzLycpZ05RFCw3
 iMoo4DBYq4PKpx73n6S6/e21e7vsEB6UIuYK6CoQJ2LRI9Mr+xg4YF11B g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="386139729"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="386139729"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 08:55:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="9774475"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Nov 2023 08:55:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 3 Nov 2023 08:55:34 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 3 Nov 2023 08:55:34 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 3 Nov 2023 08:55:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KsdLDfgJ2gQAMfoghnOpAwGYgZqERTSynZ1NihAfcFR7JAQMU8uK2gWwJgE306Z1wN5FShwKBd7u1QCd+3iAcgngOGfZGOnHdgDCI/GFfwwBI476U5S3FvAdQMepD6buRao7Z2bNaQ2+4Xt5T4mFiDTTogcvwPCtALQRVFjEeIpr4QcJY5gyunBJZknbEQ9g6CANOE6rtmN8g+Mbd72PmD4vPHuJP63pdNJTFdcOjNWhITrvU/sr+3jDZxDhmWgdWKyYm6jGipvrjjvHAWsc+tBZabzsi8A9kBKsAv0zCKyYO20RovCQhRfqsfCI1GxbnYuWK/4qnLP11m0pA1JmFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RpmQWSfH1a0UkNgShk4/nYKYJiWSmxEf5sAToeHF2EI=;
 b=Oz5/qGlhwKvgAJHE8Oi+1Ar65jvF5cQVtwhkdlG2VOkvlP0B+IVRnBy83X1K5Dt1mtr/CUHC71oO9BT+1N03mFRlr1kpvyzDWGiWCAYKOCO9em+BDbo+K6a2IVs9I3NRpfkfbD+dZA9YyFtqnwuB6txwmKef8Ni850yRw7EMctBfXQwccjyJigpu6rojudM6t8SkNmn/D0N93geiyLKXb4WL3J5GlSYhntbbFxAAfgmeutcrHwLE5uqivFY+KAO3RFeIGp1LSlF5rXUso8LksjLDtwHEYoz/oPjWj1j+e15E4odE1A8vYbIAhnTnDh3FspfJR6no+FrOVXQ+F4ox+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4790.namprd11.prod.outlook.com (2603:10b6:510:40::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Fri, 3 Nov
 2023 15:55:29 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::dc77:69e0:a3bc:e3e]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::dc77:69e0:a3bc:e3e%6]) with mapi id 15.20.6954.021; Fri, 3 Nov 2023
 15:55:29 +0000
Date: Fri, 3 Nov 2023 11:55:26 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZUUX7vuHm/q0bLcD@intel.com>
References: <20231102195102.4144-1-bommithi.sakeena@intel.com>
 <nstvbxhvjgq5jubaxkjwg7tg6munpiy73g72j3opnsfrsfu7ew@crbvetzythzm>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <nstvbxhvjgq5jubaxkjwg7tg6munpiy73g72j3opnsfrsfu7ew@crbvetzythzm>
X-ClientProxiedBy: BYAPR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:a03:40::36) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB4790:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aab609f-71a0-4420-ec2c-08dbdc854d83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZwT4BDFi5rCZrjowq5e9pTmk7s24URMkUtOXEPiVdGMSRuSIdtkRR/GIpWKG3DZXX1gMMmcGNqCwOQgQGdOQlTjBfDVjKVt4vMOsInfdTZXVP4HMKGxUdJxpvHPcyMPZ6LLypT5kdPSO0ONCRqxyK3CTjNYCSRYPoIVDA34MOK11+sLdQol6DRBeCZGNwhgtmNS3z76lZJ5QmNTm2AZTw1SRiVFrAldM7dAPoH43qHMiORwmsxnJ2qHua5EJxHUHnjocOcvQOhbK4xQW012EqJpbwytT8LYGXSgoUCWI9AxI1qC+dCdFK4kuYZv07rD/cJCcocSOQrp2R9sINgh9myNhGzHiOWKdruPM03J218RmCiN2/yj49CZ3o9/PIOyt0eLp4tNMUCt/qBE1phIOv+f0Ftb812Sw4oSi2CfV7O8hMjvU6/5YlzEj7RZ9sXwTwwJhmBys9KkqlkbsSG0BMbXauYl7CHn0ofPb11bCmQyk7I382wgBcGltnH+GMSd8JT4qarxJ4k8cNBghOpjqXqLlm/NI+WQZquc7k5gmo0avWvJ9JJKxyjfHO4vaGUKr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(376002)(366004)(396003)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6512007)(26005)(2616005)(38100700002)(36756003)(86362001)(82960400001)(5660300002)(83380400001)(478600001)(6666004)(6506007)(8936002)(6486002)(6862004)(66476007)(66556008)(2906002)(37006003)(8676002)(316002)(6636002)(4326008)(41300700001)(44832011)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?VOIdclCyoCT3HE2H8eA8bOSfc8ib+g3hCfimMipd5Y/f9j8S8XJIy3K5kl?=
 =?iso-8859-1?Q?8jseoNIT0z33oFMzJjVYkHI3Cmgpl8UiOmDS8P588fI6IbXpqDEcUJEYcj?=
 =?iso-8859-1?Q?hrF7mT7AWPMAaeaVewQPW96j9bHSSV8lPktOe4Rni/Y/kPIMtqvpBfHAxm?=
 =?iso-8859-1?Q?xpjd57O57KOjvSneLlFPgaXbAU3Rgr1gQaO7d4o3YErt3ToSLhbAqNEdmD?=
 =?iso-8859-1?Q?Vquu3mv4ghDXjJ8IugbyWSG/b7PeSJ4PthK6Ir8pBw87RiW10+SdW474jf?=
 =?iso-8859-1?Q?d/aE2t4SMkcd9VzJqBAsYex7X+cJ6qvdhEo6qtntHUbJE/7i1UliyEeG9l?=
 =?iso-8859-1?Q?Xxr+78E6TAuz5LAuM0gjupVUpvMqaAO7DnjXVMldc0gwZ19FAPB+PoLtEs?=
 =?iso-8859-1?Q?dHKchb0SnEMh0jxI4ii6hNPuJrWVJWgTPixW0rOW1H4lFXki5hsJTWuKop?=
 =?iso-8859-1?Q?ZsVn+VQIb1WKGKxrKw5PTOFp4Wn7JORg/izRlmTCRY6Gmcwe2jDT5q3B5o?=
 =?iso-8859-1?Q?dGzgtwAnnu8PucXUCPatHuX2H4HTrgKT7OhHXPDp6X/yL3vJFvKQtrS3VN?=
 =?iso-8859-1?Q?CWVYOusZmopR2RyVY1BvZX5LsiCvFosBdZkUV6L75XJBkPyPt38u2ipaKy?=
 =?iso-8859-1?Q?QxVBVYHPECR2Y/kloFaCJj/B3bFGwj0ap2t+Og5ZSZ7BQRJh60xxKx4Jpm?=
 =?iso-8859-1?Q?m6pkc4kvgAWaKG0tK0Oo3SsQuG7oTD9SAyAUHZdB13uBVv2CKnN1MhH3/T?=
 =?iso-8859-1?Q?70iFSTdIvtwYZTUiXm/Zn1NOR29Zs/rQIFsX48ZiRjNNKMIvC7D9gbFwu4?=
 =?iso-8859-1?Q?KINsC8f2NkHDxGA3RxVGvQFbTg/XJdgcoaCtcnj/S0K61Z9uxVigSovcy6?=
 =?iso-8859-1?Q?g6iiakFl7H6fV2VfqAw5wq8jauIRnL4DIhOYozeR/ZzuI7mbP2PO20Kh6A?=
 =?iso-8859-1?Q?655v6fD0LnTI9jJZ6c3zHu0SP9di4ACxo0z6dl8q9yMKjEcNErrK14TaDQ?=
 =?iso-8859-1?Q?UtRZUhaugtEdBiUhRDlkjJl/gMDkYIbvCZfzTlB6X4kM3l2+mB7Q331MTY?=
 =?iso-8859-1?Q?LswrfwlY4WB5iFJpUtbCcs64Am3eYHT/oHX1+/G1Mo41KlYAO7mgq9ddFJ?=
 =?iso-8859-1?Q?4rveQV8WSWmX94Cp/xTyq0Tmfgi48+mZomf7mzy30eFpVfWUN86OghzEB7?=
 =?iso-8859-1?Q?0DEGss46Co9O1YuTeod5zJZwg6eA+VLFQThFhbNP2m/F+RkB8gFHW+pxW1?=
 =?iso-8859-1?Q?fAXo+murBaV9/4fZWUH93U0XSO3vDIyaJIzvIrFI1ZrK6WA+SJd0u0741y?=
 =?iso-8859-1?Q?tgSvcAp7cvYC5/tpTCzvHvt6IS1+XDm1/CWnmWGo+P8Uq/eh0IwJ5M6khv?=
 =?iso-8859-1?Q?3MeGf5go2RC1oefNF+GMg1n2SlXVSq1C3H9dFGFb5UX8QWtnDFTViBhBla?=
 =?iso-8859-1?Q?+5NYwJHISwSpIPEMBFDs61PSVfYhKbb2Qw/RdlZ58p1WK1XH+WeMK/TXAy?=
 =?iso-8859-1?Q?A/RqjJQ/3u6MY4LRKRVqDm5TfALvwzOuecsYlsXIidDFf7oPoiX0fOohjT?=
 =?iso-8859-1?Q?SUJZV8upsFmYBGHJUUdRaM+tYvaFdmCR3zKBkV60CdpQYNweRmR6DGtegO?=
 =?iso-8859-1?Q?SIHyti4MKnIw9H7uSrq/Zn1Dce9o8p4kWUsbjEHspOkuoeLJIQ+mRWxw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aab609f-71a0-4420-ec2c-08dbdc854d83
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 15:55:29.7772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x5y1qY0B1RyWWuRduXEJVrw2QjPRwZKe9tT3nLo2s0asn7jxLXF+F+NouVtrzpaHXv7HkqTUegoz2dmo5Qt/AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4790
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Encapsulate all the module parameters
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

On Thu, Nov 02, 2023 at 10:48:36PM -0500, Lucas De Marchi wrote:
> On Thu, Nov 02, 2023 at 07:51:02PM +0000, Bommithi Sakeena wrote:
> > Encapsulate all the module paramters in one single global struct
> > variable. This also removes the extra xe_module.h from includes.
> > 
> > v2: naming consistency as suggested by Jani and Lucas
> > 
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Signed-off-by: Bommithi Sakeena <bommithi.sakeena@intel.com>
> 
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

I was going to push this patch, but then I noticed the checkpatch result.
We need to get those fixed on a v3 before we can merge it.

> 
> thanks
> Lucas De Marchi
> 
> > ---
> > drivers/gpu/drm/xe/xe_device.c  |  2 +-
> > drivers/gpu/drm/xe/xe_display.c |  4 ++--
> > drivers/gpu/drm/xe/xe_guc_log.c |  2 +-
> > drivers/gpu/drm/xe/xe_mmio.c    |  2 +-
> > drivers/gpu/drm/xe/xe_module.c  | 29 ++++++++++++++---------------
> > drivers/gpu/drm/xe/xe_module.h  | 23 ++++++++++++++++-------
> > drivers/gpu/drm/xe/xe_pci.c     |  6 +++---
> > drivers/gpu/drm/xe/xe_uc_fw.c   |  6 +++---
> > 8 files changed, 41 insertions(+), 33 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 8341acf66e5f..5e682ba68ec4 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -223,7 +223,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
> > 
> > 	xe->info.devid = pdev->device;
> > 	xe->info.revid = pdev->revision;
> > -	xe->info.force_execlist = force_execlist;
> > +	xe->info.force_execlist = xe_modparam.force_execlist;
> > 
> > 	spin_lock_init(&xe->irq.lock);
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
> > index da10f16e1c12..74391d9b11ae 100644
> > --- a/drivers/gpu/drm/xe/xe_display.c
> > +++ b/drivers/gpu/drm/xe/xe_display.c
> > @@ -45,7 +45,7 @@ static bool has_display(struct xe_device *xe)
> >  */
> > bool xe_display_driver_probe_defer(struct pci_dev *pdev)
> > {
> > -	if (!enable_display)
> > +	if (!xe_modparam.enable_display)
> > 		return 0;
> > 
> > 	return intel_display_driver_probe_defer(pdev);
> > @@ -69,7 +69,7 @@ static void xe_display_last_close(struct drm_device *dev)
> >  */
> > void xe_display_driver_set_hooks(struct drm_driver *driver)
> > {
> > -	if (!enable_display)
> > +	if (!xe_modparam.enable_display)
> > 		return;
> > 
> > 	driver->driver_features |= DRIVER_MODESET | DRIVER_ATOMIC;
> > diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> > index 45c60a9c631c..27c3827bfd05 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_log.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> > @@ -100,7 +100,7 @@ int xe_guc_log_init(struct xe_guc_log *log)
> > 
> > 	xe_map_memset(xe, &bo->vmap, 0, 0, guc_log_size());
> > 	log->bo = bo;
> > -	log->level = xe_guc_log_level;
> > +	log->level = xe_modparam.guc_log_level;
> > 
> > 	err = drmm_add_action_or_reset(&xe->drm, guc_log_fini, log);
> > 	if (err)
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> > index 0da4f75c07bf..9f5a7e1bd695 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > @@ -73,7 +73,7 @@ _resize_bar(struct xe_device *xe, int resno, resource_size_t size)
> >  */
> > static void xe_resize_vram_bar(struct xe_device *xe)
> > {
> > -	u64 force_vram_bar_size = xe_force_vram_bar_size;
> > +	u64 force_vram_bar_size = xe_modparam.force_vram_bar_size;
> > 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > 	struct pci_bus *root = pdev->bus;
> > 	resource_size_t current_size;
> > diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> > index 7194595e7f31..1ea883f48c63 100644
> > --- a/drivers/gpu/drm/xe/xe_module.c
> > +++ b/drivers/gpu/drm/xe/xe_module.c
> > @@ -10,39 +10,38 @@
> > 
> > #include "xe_drv.h"
> > #include "xe_hw_fence.h"
> > -#include "xe_module.h"
> > #include "xe_pci.h"
> > #include "xe_pmu.h"
> > #include "xe_sched_job.h"
> > 
> > -bool force_execlist = false;
> > -module_param_named_unsafe(force_execlist, force_execlist, bool, 0444);
> > +struct xe_modparam xe_modparam = {
> > +	.enable_display = true,
> > +	.guc_log_level = 5,
> > +	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
> > +	/* the rest are 0 by default */
> > +};
> > +
> > +module_param_named_unsafe(force_execlist, xe_modparam.force_execlist, bool, 0444);
> > MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
> > 
> > -bool enable_display = true;
> > -module_param_named(enable_display, enable_display, bool, 0444);
> > +module_param_named(enable_display, xe_modparam.enable_display, bool, 0444);
> > MODULE_PARM_DESC(enable_display, "Enable display");
> > 
> > -u32 xe_force_vram_bar_size;
> > -module_param_named(vram_bar_size, xe_force_vram_bar_size, uint, 0600);
> > +module_param_named(vram_bar_size, xe_modparam.force_vram_bar_size, uint, 0600);
> > MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size(in MiB)");
> > 
> > -int xe_guc_log_level = 5;
> > -module_param_named(guc_log_level, xe_guc_log_level, int, 0600);
> > +module_param_named(guc_log_level, xe_modparam.guc_log_level, int, 0600);
> > MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1..5=enable with verbosity min..max)");
> > 
> > -char *xe_guc_firmware_path;
> > -module_param_named_unsafe(guc_firmware_path, xe_guc_firmware_path, charp, 0400);
> > +module_param_named_unsafe(guc_firmware_path, xe_modparam.guc_firmware_path, charp, 0400);
> > MODULE_PARM_DESC(guc_firmware_path,
> > 		 "GuC firmware path to use instead of the default one");
> > 
> > -char *xe_huc_firmware_path;
> > -module_param_named_unsafe(huc_firmware_path, xe_huc_firmware_path, charp, 0400);
> > +module_param_named_unsafe(huc_firmware_path, xe_modparam.huc_firmware_path, charp, 0400);
> > MODULE_PARM_DESC(huc_firmware_path,
> > 		 "HuC firmware path to use instead of the default one - empty string disables");
> > 
> > -char *xe_param_force_probe = CONFIG_DRM_XE_FORCE_PROBE;
> > -module_param_named_unsafe(force_probe, xe_param_force_probe, charp, 0400);
> > +module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
> > MODULE_PARM_DESC(force_probe,
> > 		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> > index e1da1e9ca5cb..def912235007 100644
> > --- a/drivers/gpu/drm/xe/xe_module.h
> > +++ b/drivers/gpu/drm/xe/xe_module.h
> > @@ -3,13 +3,22 @@
> >  * Copyright © 2023 Intel Corporation
> >  */
> > 
> > +#ifndef _XE_MODULE_H_
> > +#define _XE_MODULE_H_
> > +
> > #include <linux/types.h>
> > 
> > /* Module modprobe variables */
> > -extern bool force_execlist;
> > -extern bool enable_display;
> > -extern u32 xe_force_vram_bar_size;
> > -extern int xe_guc_log_level;
> > -extern char *xe_guc_firmware_path;
> > -extern char *xe_huc_firmware_path;
> > -extern char *xe_param_force_probe;
> > +struct xe_modparam {
> > +        bool force_execlist;
> > +        bool enable_display;
> > +        u32 force_vram_bar_size;
> > +        int guc_log_level;
> > +        char *guc_firmware_path;
> > +        char *huc_firmware_path;
> > +        char *force_probe;
> > +};
> > +extern struct xe_modparam xe_modparam;
> > +
> > +#endif
> > +
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index 2fae45b9d88e..9de5bac4a5f3 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -417,12 +417,12 @@ static bool device_id_in_list(u16 device_id, const char *devices, bool negative)
> > 
> > static bool id_forced(u16 device_id)
> > {
> > -	return device_id_in_list(device_id, xe_param_force_probe, false);
> > +	return device_id_in_list(device_id, xe_modparam.force_probe, false);
> > }
> > 
> > static bool id_blocked(u16 device_id)
> > {
> > -	return device_id_in_list(device_id, xe_param_force_probe, true);
> > +	return device_id_in_list(device_id, xe_modparam.force_probe, true);
> > }
> > 
> > static const struct xe_subplatform_desc *
> > @@ -591,7 +591,7 @@ static int xe_info_init(struct xe_device *xe,
> > 	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
> > 
> > 	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
> > -				  enable_display &&
> > +				  xe_modparam.enable_display &&
> > 				  desc->has_display;
> > 	/*
> > 	 * All platforms have at least one primary GT.  Any platform with media
> > diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> > index 3032c4f148d4..25778887d846 100644
> > --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> > +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> > @@ -220,11 +220,11 @@ uc_fw_override(struct xe_uc_fw *uc_fw)
> > 	/* empty string disables, but it's not allowed for GuC */
> > 	switch (uc_fw->type) {
> > 	case XE_UC_FW_TYPE_GUC:
> > -		if (xe_guc_firmware_path && *xe_guc_firmware_path)
> > -			path_override = xe_guc_firmware_path;
> > +		if (xe_modparam.guc_firmware_path && *xe_modparam.guc_firmware_path)
> > +			path_override = xe_modparam.guc_firmware_path;
> > 		break;
> > 	case XE_UC_FW_TYPE_HUC:
> > -		path_override = xe_huc_firmware_path;
> > +		path_override = xe_modparam.huc_firmware_path;
> > 		break;
> > 	default:
> > 		break;
> > -- 
> > 2.34.1
> > 
