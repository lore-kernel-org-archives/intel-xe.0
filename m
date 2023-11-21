Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 937B4C61D92
	for <intel-xe@archiver.kernel.org>; Tue, 21 Nov 2023 12:46:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E58910E272;
	Tue, 21 Nov 2023 12:46:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7496610E272
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Nov 2023 12:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700570813; x=1732106813;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=emKKVeIV41OJSfZnFPw1RRBSQ9u/+jlyrlARwaXNRHE=;
 b=c3C4cRAIOLzbNBCqFazt73fMmE1DbnPTmyfwvf2hk9Qxpc4f4s9iXwqX
 OX6g/p832B6UXjCuiWTlO4TJh7iOZJl543tkU68VzmlASvyKW4XY5ogcS
 Lik868nIz09mytxfH7aBcjAnnxlL4GG5rpQv/cQhLlEfRzGIPAuHEWoTg
 uZR977abHfzbyJVU7T80LoaEyi/bPPSzf7EYKHfVhTm1Aa/AjNOPi+OSn
 mZ2U5pDe/KDmDH4qh8U7T+UIw4KlsDTmN8gT3bhL//EEjXE17qBID3COr
 8JmL9wucrzkWOlaNcJCSxFlunSMLcAnLv03dvyZho3UWvlDfSgRljMv0T w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="376868495"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="376868495"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 04:46:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="766634202"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="766634202"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2023 04:46:52 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 21 Nov 2023 04:45:40 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 21 Nov 2023 04:45:16 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 21 Nov 2023 04:45:16 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 21 Nov 2023 04:45:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IyBsuOxI1SvrbO3wtId2fs/7kZmLBTmco+PQpIBd+rk01n+GZNuSsL8+o+Vm6+/HdODK1T2fc7bBVxdjHG5nAGJaypd5q6aCKGXBTLiDHLZkyzow/EyCbmJROjdyp1wLhfGJ8dyMhJtikLxPNHNTKZhL7qu1ioHlSsfas94+KOwpw87+lvzf1+G7Yf/N8M/4GKuxaF1VlxygELXwTsQYEcHh8uP33AKAogfIwHZy3OT5eW1boRnoKCeYSvx3kXu64SgK6HRMXXP0leWTFX/FEvzN6CM5KXdvifUqX01IF3ny0dRBNsMymkexpC7Pj/ntI3XvH6ZkbkOJV+UBULDTbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jMwQRO7eVOTe4+6EdhlZStcl068Zw/mrPdGoSJGYChI=;
 b=Lb3ztTQi7VXvH0W0NVmL30xcgMxXQPCLbosmdrM1A5pej+I7r+1DYpZoYS5jLdwVcisk9HazhZnH/d83BP3I+5YF8SncJvFTtA455/87D63x83JtAK0JlVitSgJv9BRxll7JOsQzmpgRqpOjwvP+f/ZU8ji7qF0lRzM9XHjsf4sVAI4602yuMZfcD0zbQ1Rwwfg7PkBj3ZWLRWr04sz6iq3FqEedaXVCdbUEW4Y7/xGia3AbusTxivIxIEuELq52VYdgqSqncdSA4hc+VLz8vRH+wjUGo1shJ6xl/ofTc45TdLiqg6TkSRYxudLhynqpoJmcB+T4psD6y+1t2PKXAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM4PR11MB6261.namprd11.prod.outlook.com (2603:10b6:8:a8::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.18; Tue, 21 Nov 2023 12:45:14 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.028; Tue, 21 Nov 2023
 12:45:14 +0000
Date: Tue, 21 Nov 2023 13:45:10 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <dvhf4ocdlz6arrsqmv4hcfnatceqlhe3lfapkiaqae2cxpysqi@zubxjpvxpfhm>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
 <20231114130231.2299661-3-michal.winiarski@intel.com>
 <20231115204700.GK1327160@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231115204700.GK1327160@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: FR0P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::15) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM4PR11MB6261:EE_
X-MS-Office365-Filtering-Correlation-Id: 52937b11-5484-4b81-af39-08dbea8fb4a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zls4ncfp69YmMK/Wl+Oum/MgZKNHytLu3UhKhOHozZ/w0haFckYm5dvCIluSfN4r1ct8BYFFsT3Xtco+GHyWasn7ILl4BKsZvD9H01Ioq+StEvbmBlGjxSqMVyhzrqjoq4WD0/k+39xY+dQ0LdQXuz3ZX81zqjmk5e5PSWV1Ew7ujDsdQFJXjG1kscjyFvEkC/xvZo8zFTQN/jN3qKWy2MJIiG8mierX02J6WxhfdasO0OFi7muMe3GLvzFp50mRbGOtcuu3KbSw/sFWfCHnnAsPqfbezmXliPoqM5QHtvlhsuZ0XLQwoF/odq7k3eVwVufpoZ1l2MvpHEt1gN5e0hZKsPvnOB8kwB/HZ0pnwHQKcdiXMngaq1OPbxhblTdP71fHVtYFluWPcVp81CnjvScj15WzZUnxTMSMhgkhYzBR5pn6HADveML2wgSUO/HgVTU7tuX8jAdb0g4uDckfMZXEpupw0l7GykMe1jat5JeAXiD5IZlpTj5rk/pL7R/SeEPDj8uoQTnIAxI/OYTcid8n9S2c6I4oV3upDiGcdiaR7mX795fHSAvRZHBhhchfOdGmuLfDsMdhOhWAhqIQ8PIPZyfbrm/9GVWV/u61ez4lc+l3+MVXCTryHdylGdSkVSWVqzrKdH0oHA/4TOFMhxgaZ9S6Kf4RIArZqRZhf/Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(376002)(346002)(39860400002)(136003)(396003)(230173577357003)(230922051799003)(230273577357003)(451199024)(64100799003)(1800799012)(186009)(316002)(66946007)(54906003)(66476007)(66556008)(6636002)(6506007)(6512007)(9686003)(6666004)(478600001)(6486002)(26005)(38100700002)(82960400001)(33716001)(83380400001)(86362001)(2906002)(5660300002)(8936002)(41300700001)(4326008)(8676002)(6862004)(27256005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEp2QmlXNjZGYU5zNXpXUXJyaHVhUnVQcG4wTkpqb2U0VkNNVnZxR1ZXL1Bh?=
 =?utf-8?B?TVUvRWR0Y01lcGhRcCtJOFZBTjQ2RUdpQzRZdUJtbFU3U210dGlLc3ZoNkxa?=
 =?utf-8?B?T2xLdDlhZmhhWUNIWVBUSE9tL1dXUmVGa0p4TWY5SHMwWDk0UVFQNEtwTlZz?=
 =?utf-8?B?RWZYNUFveXZKQTVFVFZxb0laSitpMmlseTFVRi9YWXBOV1J6TkNpVFJRZlk2?=
 =?utf-8?B?MzVIcGFrdXJEbEhrblVQNDVDRmZoQ2d5T2JhWTJjdzNjQVpXUUNVa0xMem1o?=
 =?utf-8?B?MHZnWUprcC9zc0NGdjMxVXM2UGdkZ1lMZ09KM1N2Ui9QWlVPQjVWU3R4Z3pw?=
 =?utf-8?B?K2kyRG5YeXZlM0VXUm5IMDFyNXorR3Vxc3V0dTJZaG51WEpEOGdpTGpvQVhj?=
 =?utf-8?B?a1VSQVZVcjN1TWQvd1NqZE1WUHF6Zkd1ZzRIczRJdWJOdFhXQlJSeE1CUUpq?=
 =?utf-8?B?Mk5UOUpUZ0VSaWR3VkM5Ti9IUDBXZ29KTndlVENZU0ZoMDNyd3BVRlVHS21o?=
 =?utf-8?B?cTlBNjN6Rjc0NlVadWNubGhaenhNSG1hVGZOWUp1VDRDM01BZ0IzNkorYm56?=
 =?utf-8?B?cUFxQThQSnE3STlyS1BIOXZsK1JwRGxTTnhnajdzTEU1MlRndUNqUkVTMFVp?=
 =?utf-8?B?WDVYeWRjWGk3TWZtRy94Y2pJVTBGK2NQTzRNaGIvK3M1S3IyTFNLL2FXUmNk?=
 =?utf-8?B?M1lEWWVab09qRTMyZ1VsdXIwSFVEd2twS1hnZGtWbzEyMXdHU0tZKzhnWU1q?=
 =?utf-8?B?ZndBemlXL3F1ckZmTWtucVBpUXZUbjlDbERCL0NaUDgzeEtHVTJ3TnlOWi9r?=
 =?utf-8?B?UUZFTlVIQzlTQTJtc3VnNjV4cmJuQlBkd1A1SEhRR2pCbDZOVjh3clZEUWc4?=
 =?utf-8?B?blA4TXFWeERiYkVHMnJvc0ppd0tSOGppUzJXNDV2M3o4clJndjA4NEdrZzUy?=
 =?utf-8?B?M3dnUXgzdXRVWlM3Umd0NnJjekZlUGJZUUplSWVVYkFJdE9KMkIwNysycEVP?=
 =?utf-8?B?RWhZVlBROVRLYTA5SFFxSk5PVEU2MUg1b2R2bThQWWdpaGgyNko1QlkzZ1Jq?=
 =?utf-8?B?bzQ3Q21aRVBjUWtyb0YxZFlmdGh6RTFTWU5RRG5iMDJsSzZiWXpvQ25OU3Zt?=
 =?utf-8?B?bzk4ZlBnSTBSV2pMTSs2c1lNTjZGR3hnSGs0empjcEgwMk55MW5jU2RhRkY4?=
 =?utf-8?B?YXFYSlhQVk1wNGlwQnRQRjBTM3pFV3VnWDBENGpobEYzQkhiODJGeXVEZmFE?=
 =?utf-8?B?alNXQ0dyaUVBUERjYjV0ZzllcUFFeWwxczJUWlRWRE1DSm5GRHNmb2hkVzJi?=
 =?utf-8?B?VDBJVkhkYTc5TmFJL0s4Q1hNTStqWTJ2b3R0aHRlKy82V01INm9OSkN5UGxO?=
 =?utf-8?B?ZHp0VGYwUmE3bEpVd09QRnFnZDN0OUxoUFpRM3laZEs5OS9WcFVKcUNBVWl0?=
 =?utf-8?B?ZVhNeGJZV3BZc2dhUjRGSzJ2Q2xSbGhOa0pSYldRWFdnWldBRGcreDQzbmtx?=
 =?utf-8?B?YVJXTmViYlhGTEt4eWJTaUNmQkJhTWFIb2VDbVVidnB6S3FZTW84Kyt3enU4?=
 =?utf-8?B?dEFBdlZranl5WG9rcEdjVjB2NkhaZ1NxeVVJZjBHQkMzM016dFRDMTlhU0Rq?=
 =?utf-8?B?Z2wyQW44elBKb1ZBWjdPdFdNOVZQNk1MVDBlTzNjKzFaOG5oSHVXcmg2R1Ey?=
 =?utf-8?B?UllPS2NES1h1UXA2bk9UVE1ma09ZYmIra0lLY3ZVNnhSSFhTNWsrOFIvZWNI?=
 =?utf-8?B?TVZkTkV2TEU0Y2c0d2xUWlNGMXZFSG9ENnNzTG0xa0FxUk81NUtyRGJxcjVo?=
 =?utf-8?B?Y0ZVbVdCV0JOUVRqRm13aFRaTzZUMTZNVXdjTjN6aDdxSzJ3enJoM1FhNk5B?=
 =?utf-8?B?cURkTU5KVERNN0QwOGhjY2t0TWpHaFRINGtEVlNSWUdRRDRqYUhFRFlvMllU?=
 =?utf-8?B?V0pzbkRQUTM2UXY0QVpmQkJRMEtEWWRtcE5ZRmlmSWhBTXEyT0EyeXFPMno4?=
 =?utf-8?B?QTY1VW9CK3hZZnhmL1lDVkdVeXpHK3RXbHRHbVpYWmgzQjIzd0lIVWd3Qi9n?=
 =?utf-8?B?Vk45UFhkdEl4QnQxTXVHLzllTkgzY0tFSTQ1Qm5jSEh5UHJKRU5zVE9URWE0?=
 =?utf-8?B?RU1GUjFqWE5iVVFiVk4zWVZhWllaSnppRXRzU3ZWWUI3Y2c2L3NEVzA1TVh0?=
 =?utf-8?B?aGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52937b11-5484-4b81-af39-08dbea8fb4a7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 12:45:13.6898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uqRSGttEwggkvufeCRFEJHbrY37bwbL1W5W5Yw/upE4sK7ua3a7/LRLO31okoRvirN3pKbcuZu4bsYogXH7cq6eK7EgfUFeK7IJwjoOQlJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6261
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 02/20] drm/xe: Use managed
 pci_enable_device
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Nov 15, 2023 at 12:47:00PM -0800, Matt Roper wrote:
> On Tue, Nov 14, 2023 at 02:02:13PM +0100, Michał Winiarski wrote:
> > Xe uses devres for most of its driver-lifetime resources, use it for pci
> > device as well.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> > v2 -> v3:
> > - Mark xe_pci_clear_master as static to fix W=1 build warning (CI)
> > 
> >  drivers/gpu/drm/xe/xe_pci.c | 26 ++++++++++++++------------
> >  1 file changed, 14 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index de986aaee3bb2..e6b59c4b02bdc 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -663,6 +663,11 @@ static void xe_pci_remove(struct pci_dev *pdev)
> >  	pci_set_drvdata(pdev, NULL);
> >  }
> >  
> > +static void xe_pci_clear_master(void *pdev)
> > +{
> > +	pci_clear_master(pdev);
> > +}
> > +
> >  static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> >  {
> >  	const struct xe_device_desc *desc = (const void *)ent->driver_data;
> > @@ -691,23 +696,25 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> >  	if (xe_display_driver_probe_defer(pdev))
> >  		return -EPROBE_DEFER;
> >  
> > +	err = pcim_enable_device(pdev);
> > +	if (err)
> > +		return err;
> > +
> >  	xe = xe_device_create(pdev, ent);
> >  	if (IS_ERR(xe))
> >  		return PTR_ERR(xe);
> >  
> > +	pci_set_drvdata(pdev, xe);
> > +
> >  	xe_pm_assert_unbounded_bridge(xe);
> >  	subplatform_desc = find_subplatform(xe, desc);
> >  
> > -	pci_set_drvdata(pdev, xe);
> > -	err = pci_enable_device(pdev);
> > -	if (err)
> > -		return err;
> > -
> >  	pci_set_master(pdev);
> > +	devm_add_action(&pdev->dev, xe_pci_clear_master, pdev);
> 
> Is it necessary to do this explicitly?  I think this already happens in
> pci_disable_device -> do_pci_disable_device, right?  I don't see any
> other drivers adding an explicit managed action to do it either.

You're right - it can be removed.

Thanks,
-Michał

> 
> 
> Matt
> 
> >  
> >  	err = xe_info_init(xe, desc, subplatform_desc);
> >  	if (err)
> > -		goto err_pci_disable;
> > +		return err;
> >  
> >  	xe_display_probe(xe);
> >  
> > @@ -734,16 +741,11 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> >  
> >  	err = xe_device_probe(xe);
> >  	if (err)
> > -		goto err_pci_disable;
> > +		return err;
> >  
> >  	xe_pm_init(xe);
> >  
> >  	return 0;
> > -
> > -err_pci_disable:
> > -	pci_disable_device(pdev);
> > -
> > -	return err;
> >  }
> >  
> >  static void xe_pci_shutdown(struct pci_dev *pdev)
> > -- 
> > 2.42.1
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
