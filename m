Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD429C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 16:31:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8112410E923;
	Thu,  7 Dec 2023 16:31:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F5F10E923
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 16:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701966695; x=1733502695;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XykAi9/75rsvd1fPLISJQTqSMVGgLCsvQmoEOWYMIWw=;
 b=PEP7JaA+BdhV34EacIVdJ5N2mvVR4xo4cw0D8L+D2qIQsLJnDhQCDECr
 /SwW4VcouMA+7UkvZ2+9YWdk8WdYHBbh6pJ1qpIn3Y5L3/t7zcQOCnWRn
 O17vm7HIGxx6dYmED/vBkf5gmq6ge3d8bKB4Mg74rVQVIe6NH2DKfD1P2
 ck37zGdTfZJXxwgm1PX68/EhzTQDWriGky2ixsbSVZo4KIHu0TVIibQOT
 AC2R9Xcuw4Ys9xGU6gn8gknQ6Bxu7tClM9/2VwnblKXzAgSwqZidhQycs
 p9DnXvgvSeudaNfXgM+JBpaDxx9u81mEbgyEjsc3q31uk5Dq6AVp6xulf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1087350"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="1087350"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 08:31:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="889803174"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; d="scan'208";a="889803174"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 08:31:27 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 08:31:27 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 08:31:27 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 08:31:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=krUBAGnTMR+cE/mkOjarfCNGcH67FX80eecAfd4bNEyJue9IOS59SJkgw8QY9MClL/gv25UJAqqgC0YiKg1WS0wiIjqj9VjWxFnvfZntZwp3kEyglSlFWj9zRbQM5AqJacMWXUg7tbLkKYbLMhM2tCRS53q9ALVCqf3sy+G/6dKkInAbeeUCfxxl3DHvyKUwsbKt5hQXZE2GTDmuDkX9xa1Tk2GG1yrRw2EJLKf9ThU1jMQ3Ag5Vtr/Cb13Oe86PTaQju8ez6wkVGaJvGG6QWf/8pk2jH9go9r8IWjmzIJubGyqB28vGrVHSzoEjPPMBH0tD7JbK701gTT17fYr0YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SEqEZOFGLKm9CGJjKRMd4c+NPQGlazAHpEAL/8/QQr4=;
 b=HGNcMZQOTOnUuIyLxeEgtXrW3K8Q4F8e0cJpOpWvxNioNGpLP7ZZwfqpeBnpuLvrQkkwz+XHRTnn4V7QNqp7Bjk8L7HeiureJCFrsksu63P/ADy3jw4f386spxLDAgAe3A6Uyt7ebpEjY4pIelwDeOvdskJ5ddbpZ+XrdWhYZSee4JWYXvJhcWxuSf2ro29XHcJC65KJUtqwHWw/e3dvOF+O90D8h7UsU/lYzVbwsWwUPoRlvr6SDa5Jbqg2WAebQry8P6B7WY1HK1E5YP3hm0Zbff9YXHSFBvVxYeZRrSs9Xf9X1UtiQ75cGv7bo10ycqyztFn28KSS7c8/JLW2iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5022.namprd11.prod.outlook.com (2603:10b6:a03:2d7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Thu, 7 Dec
 2023 16:31:24 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7046.033; Thu, 7 Dec 2023
 16:31:24 +0000
Date: Thu, 7 Dec 2023 10:31:22 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Stash GMD_ID value in xe_gt
Message-ID: <ze3j4vdrysjhasxuzgo6erz3bgodzrkmyrr2qcjm2wj74qehvr@y3of5zvirgid>
References: <20231206205034.1105637-4-matthew.d.roper@intel.com>
 <20231206205034.1105637-5-matthew.d.roper@intel.com>
 <klfcmsla75h3sxdhd6vjxsrnaej2qycu3bjizntytjyxflae7t@d7dsiab2o3e5>
 <20231206230953.GX5757@mdroper-desk1.amr.corp.intel.com>
 <6q4wwszpvvl5wacpusm6lrrzzqccnxyefz23h5wb3bcidqg3ga@dqdnxieitt4f>
 <20231207003736.GY5757@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231207003736.GY5757@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5022:EE_
X-MS-Office365-Filtering-Correlation-Id: 5abbf82f-28af-407a-04ff-08dbf741f42e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +AZJAd+akHxfB+InJFIfSFig3o5mLqNERGeokaLgah9R7IqQ7u/86eesgFHPcJj+dtcPFOE+6TPD6fZVs7vo3JEyUoxrMflBoeCuD1g4w31FjbtIqxBRyhFTG+Srr7PTA80QWaEVMd0KBnfb8xgMwiem5Ez2YH3RuyWWGUX3s7UlXq3fvoCBT7fR37nkBiBxOsuGOh7whysfwjWbJK7RfDaCdHoAKWWrT7da3j/a2TdwqrrPrpul/lGHgfzR4E6oIOukzaQg/1VBbyoLZssEaI45QRuQUs1jSbVjpgGCfEUoa7B7ys7FZ7GmMx/Cg/gDYTyEJK6jQS6GwjhWYqHoO6cWGVUqCBbtdMcnfQVZh6czmlPiM6Mj+qcKMHfTxg5lMrBzJdIOm+kArpLsnDAy/IBbp7KL2+dhKnT/1PKJT07TU48AIwYDt5Gk2oanYdymTJs2LD7d/fH+FCh0b4XJXBEWB24cVJHn1aFhKXqL/r5J79K8nlUvsfvDHrLtYu0jNi6I4di7LGb/tOLjBIo48giznlQVgpcHzAvuZCDnkv4lF3/0Zq2LsLTUoOwWLnxl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(366004)(39860400002)(346002)(136003)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(41300700001)(5660300002)(86362001)(2906002)(6506007)(26005)(9686003)(6512007)(8676002)(6862004)(4326008)(8936002)(66556008)(38100700002)(66476007)(478600001)(316002)(33716001)(66946007)(6486002)(6636002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fZ1SlhCbZjm0pJvIGnaCjWNZj4rkJb34mZ/5crS3ozXXrmAqUsj+fgs7TLxs?=
 =?us-ascii?Q?Ku8gJzDP1w167MzFAGNic95TUWnwk6JBJsAzxbGDwV9087/NIv/hNyy1/t0F?=
 =?us-ascii?Q?fx5mn1ZoniA5oLtAqIT/3r1XiNkZjQgiq7SfiG6uST7cPoKWO3hvKjg8naTO?=
 =?us-ascii?Q?1tg/e0lGZcYWgYQw6h5EIiWLZ5xaDs7ti8ccIJ5Hp0BaSBZQojjSKYlCZ/Ub?=
 =?us-ascii?Q?OF7J2GqcoTiInOVD7OlXIpj5NtX/X0eDLMuYuxkI9U3aXehj2KyPwLdNZk2l?=
 =?us-ascii?Q?g6OYtUyCcZb+py9My5RfRuYoDXQhzuEzGQJ84CPM9hepuGRA5QS52qJexNP4?=
 =?us-ascii?Q?lrfKJRwT1aqqvkINOvGwDw7/nzuKMc+O0EnzoOWOC9h75tI2RMJDBAAYRvUs?=
 =?us-ascii?Q?LY95hnNYP01FNg5UKzZGrKsYEVn4NvdMNWKhHS2LYpW63i0EmzUXy5Fy+Yfd?=
 =?us-ascii?Q?jQHhEE2HZ3xN6SOT4MQcqC0xLrPFosur424uH3T9fq2/+5KGYKGyo2E516Uy?=
 =?us-ascii?Q?kHvpWc00zyNMC+w+DDeACEjBII7o/i1yOIc27Yt/YVN9q2R37h2mhN+8g713?=
 =?us-ascii?Q?SCOtMIsuiaFP6sWCSYFNukwpbmeohIRuHkRirjxr4QFFtRVH+Ckb3LAICMoD?=
 =?us-ascii?Q?2ko4NLMMUzXXQjbngkGttTuBnRgiD7WlESzxESv9A/7yBNEAQSBtiWT5i8+K?=
 =?us-ascii?Q?3DZwE6/8YnjnKQUCtDI10fCqIICqEj43t429D/Ry6ZRNKMMsPfHQPb4Qthn8?=
 =?us-ascii?Q?gqhP/dN7l021xBlIufF64/J5Oj3EumhJIYPvezBlZocTreolsWCHv2YPEQsG?=
 =?us-ascii?Q?SzI/n4KbX0d7jXqztDFhrSPKMscjAC6PluLGa0B/wQgYVC0PB8+8MTFSsd3E?=
 =?us-ascii?Q?oAOrC9weJZ0oNE0aakGKB7OrGnQ9reGl0nQ4fCqG4E8fWckK6ti9iCRwYDJ6?=
 =?us-ascii?Q?2rq/p1k66qT3n8q+gxqS8jRx/nxjCKbWlvr5ORIW5S1V94hFu9mSp4kxpAqh?=
 =?us-ascii?Q?GiiXv2edeakrTGaqAsVwRRGJcRtu9pWjcOrfHGGrO7EbxoI3LK4aehlVPEl/?=
 =?us-ascii?Q?/eao+Qdkd4NC7CZLl3AF67Gx8Qj0gs4fZsMnOJkNK1Cj6WVDC/HEZKyVmR1H?=
 =?us-ascii?Q?JzXusSG03Q+oyjNd55AYVxB9bZPJK4plaQJECIeGGanBrhcx6A0xKuWgZ/6J?=
 =?us-ascii?Q?CSEtAol7h69qsyqdalwGtZfJGW66rgMxRKk+W5cdbPdnL2Nnr3PA9DWx+pBW?=
 =?us-ascii?Q?EDAKClnXXHLxhoNwGPu4dOp6U0dk8fahtV2W2ljGsKqzPxohsF5g/ei9iXHI?=
 =?us-ascii?Q?GDnrGo5Wic7Bqlde4+FKtbh4To84iWOuy0dysvxeUT8y/+3UmsUSrBuS8Slv?=
 =?us-ascii?Q?+Ek9vIXZGsmjCIvVMSReMAqvyKyzJCmi+KQFYZ2n8VpxzV6dl3QukdwvPjwP?=
 =?us-ascii?Q?nkwN7UDdf6f1wpv3/WC0XwHuSae3xfk89zopahCH4vz0GeCeM7mPtL9QcYUq?=
 =?us-ascii?Q?Npf4uvoXJrthcDYtUFuOeM4viAdYafIZq+xGs8pdwVLdmoQHCKmh/i/FvpyY?=
 =?us-ascii?Q?bSGqjSQw2ZFspVkpIM5Ml5PGgvWwgyqzFD/FeJ0W2uG8IDR97OYbQc9uPpmJ?=
 =?us-ascii?Q?hQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5abbf82f-28af-407a-04ff-08dbf741f42e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 16:31:24.6980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wu7FOqcEbLqDrILtL3+HOgdJRm6emyHkaamjS+POUT3+i9/kDvR8kWzLWNwKBa3Y6AdvQkjlv7IjRc7zD2KHW2orZ2FKEVatNjEqriQJ+h8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5022
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Dec 06, 2023 at 04:37:36PM -0800, Matt Roper wrote:
>On Wed, Dec 06, 2023 at 05:19:41PM -0600, Lucas De Marchi wrote:
>> On Wed, Dec 06, 2023 at 03:09:53PM -0800, Matt Roper wrote:
>> > On Wed, Dec 06, 2023 at 04:55:10PM -0600, Lucas De Marchi wrote:
>> > > On Wed, Dec 06, 2023 at 12:50:36PM -0800, Matt Roper wrote:
>> > > > Although we've stored the major and minor versions for graphics/media in
>> > > > xe_device, it will be simpler to implement the uapi version query if we
>> > > > also stash the raw register value in the GT itself.
>> > > >
>> > > > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> > > > ---
>> > > > drivers/gpu/drm/xe/xe_gt.c       | 6 ++++++
>> > > > drivers/gpu/drm/xe/xe_gt_types.h | 2 ++
>> > > > 2 files changed, 8 insertions(+)
>> > > >
>> > > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> > > > index 154d6c7072b9..c6f7885ffdc0 100644
>> > > > --- a/drivers/gpu/drm/xe/xe_gt.c
>> > > > +++ b/drivers/gpu/drm/xe/xe_gt.c
>> > > > @@ -381,6 +381,12 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>> > > > 	/* Initialize CCS mode sysfs after early initialization of HW engines */
>> > > > 	xe_gt_ccs_mode_sysfs_init(gt);
>> > > >
>> > > > +	/*
>> > > > +	 * Stash hardware-reported version.  Since this register does not exist
>> > > > +	 * on pre-MTL platforms, reading it there will (correctly) return 0.
>> > > > +	 */
>> > > > +	gt->info.gmdid = xe_mmio_read32(gt, GMD_ID);
>> > >
>> > > I was coincidentally reading the PICA_DEVICE_ID for a debug (that we
>> > > currently don't read) and stumbled upon this.
>> > >
>> > > I'm wondering what's the correct place to read and save the GMDIDs. We
>> > > already read it on xe_pci.c:handle_gmdid(). Why don't we simply stash it
>> > > there? With the current design, it doesn't seem we allow 2 GTs with
>> > > different graphics / media version since it still on the xe side
>> > > initialization.
>> > >
>> > > So, why don't we just stash it on xe rather than GT?
>> >
>> > I mainly did it this way because it makes the actual uapi change a bit
>> > simpler to actually keep this in the GT itself.  Plus it's a bit more
>> > future-proof in case we ever do start allowing multiple GTs of the same
>>
>> I don't disagree with the uapi. We can keep the uapi gt-based.... just
>> wondering if we need to keep the read on the gt initialization, because
>> if we allow GTs of the same type with different versions, we'd already
>> have quite a lot to change in xe_pci.c
>>
>> > type with different versions, or if we ever add new types of GTs beyond
>> > just primary/media.
>>
>> on the other hand, we have 2 other GMDIDs that could be useful, but
>> aren't tied to the GT:  Display and PICA. I'm mainly concerned about
>> PICA for now since I'd like to print it for debug. Should I tie it to
>> the device while graphics and media remain on the respective GT ?
>
>I don't think PICA should be in Xe itself (and we should remove the
>display GMD_ID as well).  Instead the display code in i915/ should
>probably read and stash it in intel_display_runtime_info during
>intel_display_device_probe() (assuming we're on a platform with display
>version 14 or higher) and can print it in
>intel_display_device_info_print().

I was thinking that PICA could be available even without display, but
it's not relevant for now. If it ever becomes, we can move it to xe.
Thanks.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
