Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2E9C6FD18
	for <intel-xe@archiver.kernel.org>; Tue, 25 Apr 2023 09:31:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2386A10E6D2;
	Tue, 25 Apr 2023 09:31:10 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1522F10E6E5
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Apr 2023 09:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682415068; x=1713951068;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=R2+tBeNk/3f5cEKTPrfRhMIabkevfz7/RzwnK/dGqvs=;
 b=U/I5gysw1HL9zu51G441J2KSvEXexthItEuVN6egjPHnw58ObiRJTO4E
 5FhVJFd5LC3oSVu+jKIwgbsGvV9qZtCFlgt2kcSZl7GwdPw9JVvVYepPQ
 G9feci2TVl4RmgMEh9Kl96WHetK4MIumCKFos3Dz6xqUqRUE54vpYBhRg
 8mPDetMJtKBoUteP3ff7cQl49LPbGw7Aw9OrMOkRap9rCOhowu4bnNQWg
 OLWg7krwOrIC3l5+FRUtboCHGoxfkBpusyG7KIl5Js9hXyO/lMQnPZkHP
 2zxHPFczKG8ie/LGG2XeofXynJaQ43qPp9Sc8DxdlqNP1rTGvOol0w7Pv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="346732195"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; d="scan'208";a="346732195"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 02:30:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="696111494"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; d="scan'208";a="696111494"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 25 Apr 2023 02:30:44 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 25 Apr 2023 02:30:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 25 Apr 2023 02:30:44 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 25 Apr 2023 02:30:44 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 25 Apr 2023 02:30:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kiV8ZodHSdijAFfIpW1LwzEobh+4odFMyxXb8Wa458GBhfN8IGDIAJJ00p8AIrmu7cwDjruITyY5s0BfvgI2GIhbXI0dGjsF35rzsCUc1jGkWbDl0qkIJL3EGNqtg+NDUhVByhyLBewK5MwjcPefuUgGzcsXWeMBzp5SKbTJQFcz3g05Dvfep0VEgXqHS0LElsNoB68y7HF4no/t4tV0VkJQrPf7BAxvFB2xLGhY2djxrsaH7VRnrD/QxMzCAykcw0XfSilrH1kglSSFRfEMz7zdPQMRHoHC5vjzTDOhEzuRmX05O9lRJCgTnQMk2ZCfoPMPj65YxDwOBro6kZ2yAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1q2PWYCHHzT8T90M4bxaC/gOtDYAypxHvC6eelL4Yz4=;
 b=BEfCjUwd9HtaTkrTyrxsrV3ATwD14kbCMDLdZef3A+9itqJsBQSULi+NMjE9cw6MjKnvhczRBr/xUkgY5SBM/5g2iQ74IWsn2V5uIyAJrZ1ciWPDsy0Xw21SeJPIllH67kUvWm6P0dFPGLoVdOlciBnxCG00nGdjZ0vHQaI0yeWSrOuuttRPVvXTbM9KjH2bPHCBrEYsdPQ6dd8cLYjFrcxszT6aR9pwyCcmukFes+R20idOZTzwFoM/L8LJubY4jn4FBfqknHLO3vGvllHlPe6vQAYhLCfXQxtb7R/XC4QjDvF3pLfQn9c2xBiK3YK7oYi+m/7gggDnZm3xzfHKaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 DM6PR11MB4723.namprd11.prod.outlook.com (2603:10b6:5:2a0::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.34; Tue, 25 Apr 2023 09:30:42 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::a9bf:176e:3858:c1c1]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::a9bf:176e:3858:c1c1%7]) with mapi id 15.20.6319.033; Tue, 25 Apr 2023
 09:30:42 +0000
Date: Tue, 25 Apr 2023 15:00:33 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Matthew Auld <matthew.william.auld@gmail.com>
Message-ID: <ZEeduZQnpvr6GcFC@bvivekan-mobl>
References: <20230421153852.329899-1-balasubramani.vivekanandan@intel.com>
 <20230421153852.329899-2-balasubramani.vivekanandan@intel.com>
 <CAM0jSHNhE_gv_ZwacK2qRtsgO1oY2oM1J+fU5bmgSK22Nr2=cQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CAM0jSHNhE_gv_ZwacK2qRtsgO1oY2oM1J+fU5bmgSK22Nr2=cQ@mail.gmail.com>
X-ClientProxiedBy: PN2PR01CA0194.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::19) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1897:EE_|DM6PR11MB4723:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b06c316-637d-4413-ec0e-08db456fbd11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2elECH7BjjIx5Y+sGzRlilweW88h2Y5Iy2i61DsES1tfUpEmOA3a26GOb+zkYFrqZ0xlfY/oU3gGb1p7irwOng3wepCBFIKB/XEhUFAdN+dqJ7IrgANCollnMGxz6WrCD8ZoDmGu0pmBH5YoK7uQdM2kMaC9ugKoPzNU3FnpC9jFE+y47u280/IeW1o8CttOiFgKH0iwMiJudZuDfW/0ilaITiI7yv0LrlX++FMjZzUIvGyYzJUH3aKSYeXSvZ82FR1rw7mzYy8qSfnzISqmwshMHkFidlxupFvaXrz7MpK9lzMSaCjFzXNniEJwj5F6KxDolZJp/dNz7qlPORi60smYG39dZAuyvc1A5/5j3hBELcBd4jI1cs0xm5vdnUgrwqpWbRpTX1ZM67fECqIizFGtMdH2LBqlF8vfHJCA8Bo5loAoxGP7NSbzPhGQeXgo4q1sOF/HhQXChYlN1Ri04b6yAiIQ+AHThZG7iA/Vi6StXFGG3vew0ko5exGWuVGhx24DTF7pqYSP5YT1VEB85h0TPtbMa5hTBJm/SSLa7FHtgRQIz948pUaOuQKfjaOT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(376002)(366004)(346002)(136003)(396003)(451199021)(6506007)(6512007)(478600001)(9686003)(26005)(53546011)(83380400001)(41300700001)(316002)(5660300002)(186003)(38100700002)(2906002)(66946007)(66556008)(82960400001)(6916009)(4326008)(66476007)(33716001)(6666004)(6486002)(86362001)(8936002)(44832011)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVNuMXFsQjVRQ2x6N05zL0IyWG1hT3pxdnZmVG4vTy9uVVJzek1Ga2VmTWVs?=
 =?utf-8?B?OFc5MWxIS1FIRDkzcy8xbUdsRjcvaUxxVmdXa2J0cFdXZXoxcW8zMUdJWnhn?=
 =?utf-8?B?amNKQjk3WStQL09kK1Mwb0tKaTlPZ1FNSTlhWlM0emdwQW5BZnRZa1BuUzFu?=
 =?utf-8?B?OXhwR0htUUlsQ1Jjem5zR0ZhdEZRVFd4YnVTSEd5RXcrblVmY1hUeUFqVDFn?=
 =?utf-8?B?bnVVUGlnQlVHL01VK0c3STBLbm5zbVk2dHNCM2VQbkJlTGwxK1M2NElNOHFN?=
 =?utf-8?B?ajZlQm1PZmZueUFMU1lQazBSZE81aXVBS1JzNytabWU2cVpzNWpoZk9sK0R3?=
 =?utf-8?B?dy9PT2QzYnFVb2R1ZitmT2FwYURwZDN4ME9TVmpBVlhFc05LYlB2NXhjNWcv?=
 =?utf-8?B?WmJJR0RaaCtKNkpSMUYwaUovNkUwZmlWcjRVS2tld2NEb2tPNXVSOUluOUJN?=
 =?utf-8?B?VHR1c015TEdJejJTb2I2K0kydERQR01YcFVnNVVaRFlDSElNZmlDSVozc2Nv?=
 =?utf-8?B?Qzd3ajJGRUErbyt6blkzS1B5aWNtaWhkbTRIb2xtL0tQNzdxb2JlSk1nNnpC?=
 =?utf-8?B?WXFLZnc4UFlPVlptbkxoaHQydm5tbHplNTdsU25iVTdXaWxCZFE5dVFDMjBq?=
 =?utf-8?B?Vk5zakNMeDh4MFFaZ3RvNitJUi9ZbWhQUGpwZWFXT2lEcUYyLzR1eVRyd2Vh?=
 =?utf-8?B?SDNBaVYxYUJKd3FYRFg1UUZMMUovVHh3QjJqRVJISnpob1ZXNzJ5SlpzWjMy?=
 =?utf-8?B?eFRmS3Y3alRQeE1heURrM2JOempEV3ZKVlBkN1ZJOXd4Y2tiTjB1SlhsaDFh?=
 =?utf-8?B?UXJZV3MyZ0M5Qy9NRHhCL1o3SFRuRFBPQ29GNERqcTBBem1aQ28zU0VseHMv?=
 =?utf-8?B?a1JFM3NVR3pndnl1S1FudWtkVlF6U1ZaRHgzUnVNSTVRTnlHY25TSHF2KzNh?=
 =?utf-8?B?S1NjRUNNbU1Ta1lodFpRTnNFdHorbnF0MUNyc0lTNzltdVdudGo3UEdtcXNU?=
 =?utf-8?B?T1V2a0ZHb2hESEJia3BERzVpRGYxYnVzbmNYUEhmTG1FRitZM01NMzlJNVRG?=
 =?utf-8?B?VEU2Mk5abEpQN29UNHh2OHZ1MTdjK016Y3I5bmNNOENhK0lQMkxpREVTZEFV?=
 =?utf-8?B?a09iR2tQWlJCTGhxcGpXU2ZLN2NQeEp6aTUxZ1dtOW5PN1VyMnJUZGVNbG00?=
 =?utf-8?B?SGNPZWViSDBMODJPQndNcEx3QWEvYVN1dkZsRmVpWERNUWRPSTM0bFIzSUc3?=
 =?utf-8?B?SHkrRjc4VlNLRittaHh6YThZNHg3SDkrSkl1QmZ6MU9hUzR4NUd5UllSTVEy?=
 =?utf-8?B?SUVUdjJkR2NpK29OWEJkZ2lDL2tIQ01Yd3dpL0hIeUdIUlFGdGExbk03RU44?=
 =?utf-8?B?ZWQ0dHBPcUNBOFd4MlNyOVlGQ3dXV0ZORkttcUthT3E3S09Bc25odVl6S2pM?=
 =?utf-8?B?QThjRTBPL1BpMlBzK0dnb2FxcVhubzk3eFBZWmx1T1UvSjI2UVdkY2JxMFF6?=
 =?utf-8?B?SE1WNjd1eWJnOW5QeXd3cFdrS0c0Rk1Ua0hvVE92dk81RGRicWpGN1RZRDFw?=
 =?utf-8?B?QlFxa09BNldBODlNN21xRW1kbHlxMTZtTTFwVlNyVVhubE52azFpTGZEKzNm?=
 =?utf-8?B?MnVKNFY4KzdlRDlFWnBVNEVzSiswR0JRMG03dThVNWRvK3dORjNOanMwNyt0?=
 =?utf-8?B?SHJ6eEF2czhWcEY4T3RYdUR4MHV6T0VIUXBPN1pTL2EyVlgvMkRPMHh0ZUdV?=
 =?utf-8?B?M1JoY0JEMCtpbUYrU1pQMUtQMWJQWGRrR3pmdUlXVlVXWCs4WmdSRE8zY0R0?=
 =?utf-8?B?akgydUVxZm8xbGVRcjd6VmpBRGFGREozc09iTFBLd1pNeENTTnQ2SHBtYndG?=
 =?utf-8?B?NStncVUzOEJkYklsQjM2M3QrZW1tcGtTTjdDdU1XdmdkdS93U3lhWXo1bEpi?=
 =?utf-8?B?L3dielY5TDhjYWR1SWZLaEwreFNzdHVBbVpYVnZERllHeEJMMmcvOWlmWmcw?=
 =?utf-8?B?NXpiZno3ekFpSHkxVlI2eWUwcVNITUJ6YWFJVW8yRm50WjJUa3c2TGIwQ2VN?=
 =?utf-8?B?MElYZTZ0eGxvM3lwb3R6eWdneCtRdklRRGFydGQ0MlFaelNXUVNqeDBCZldl?=
 =?utf-8?B?V1h4SVo4OG9qVHViOFhUQTBpeDVsVVlJaytSUHltd0lUWVBncFVLaEhKUG9R?=
 =?utf-8?Q?scFLGYUYMeKRb7KsHLkwFcs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b06c316-637d-4413-ec0e-08db456fbd11
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 09:30:42.2635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SbKtsuFCY2ThggLmfEkElQHx5TBZPPKZag1EcJvbfgWJpYDG14XapSXOFB1elNQJdErz8GYlOyIAUdUvvZGtNws+FskBbNTGNYEOkn0gbLpqJrC+sfBux/hiowYPrPCi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4723
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Change log level of error prints
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

On 21.04.2023 17:43, Matthew Auld wrote:
> On Fri, 21 Apr 2023 at 16:39, Balasubramani Vivekanandan
> <balasubramani.vivekanandan@intel.com> wrote:
> >
> > Error prints are logged using drm_err log level.
> >
> > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_mmio.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> > index 8bd39c3e65ae..7a0fcb37aab0 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > @@ -59,8 +59,8 @@ _resize_bar(struct xe_device *xe, int resno, resource_size_t size)
> >
> >         ret = pci_resize_resource(pdev, resno, bar_size);
> >         if (ret) {
> > -               drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe)\n",
> > -                        resno, 1 << bar_size, ERR_PTR(ret));
> > +               drm_err(&xe->drm, "Failed to resize BAR%d to %dM (%pe)\n",
> > +                       resno, 1 << bar_size, ERR_PTR(ret));
> 
> Not sure if we should treat it as an error, also there might be
> nothing the user can really do. The driver should still be functional.
Yeah you are right, else it would create unnecessary failures in the CI.
> 
> >                 return -1;
> >         }
> >
> > @@ -119,7 +119,7 @@ static int xe_resize_vram_bar(struct xe_device *xe, resource_size_t vram_size)
> >         }
> >
> >         if (!root_res) {
> > -               drm_info(&xe->drm, "Can't resize VRAM BAR - platform support is missing. Consider enabling 'Resizable BAR' support in your BIOS\n");
> > +               drm_err(&xe->drm, "Can't resize VRAM BAR - platform support is missing. Consider enabling 'Resizable BAR' support in your BIOS\n");
> 
> Same here.
Also here.

I will drop this patch in the next version.

Regards,
Bala
> 
> >                 return -1;
> >         }
> >
> > --
> > 2.34.1
> >
