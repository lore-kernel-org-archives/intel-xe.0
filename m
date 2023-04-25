Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3ECEC77B61
	for <intel-xe@archiver.kernel.org>; Tue, 25 Apr 2023 10:43:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C413B10E6F5;
	Tue, 25 Apr 2023 10:43:02 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A052D10E094
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Apr 2023 10:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682419380; x=1713955380;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4kuDQpnv3p1JGBzCPgMUcla7x8lsdJnbGvPOmmdVQsU=;
 b=Wc5I3b9/okJqh2XCS86mID+exhf/84hrKxEvUfaAit1C7y24u9w0wP0S
 zLdIK+BKfTRXERwyhHnazI/+QJ+xXw2ehq4i/HhxEkjh+IPsEjdV1lBFD
 AdsTY77FdAlfyzgle6SQVmDQogrzX/phvbSQFTN/MZVuqvUu9Bq+bYj1u
 TpQxWnM2dmdjg4eS/ZKUNGW1cdUXcpUwDWjTpb1RNYIMP/w72jhBvrzf7
 hUMV0ntGwdXd56nyqsaF73UH7/7J3gFzF4t50obP2r0sM66GyOnzCzSq5
 CG5D3jPYoO7wTzm1PHxDEN82N/volsR1bpVU+Vr1B0NC2MuyT2w5nGkDA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="330938866"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; d="scan'208";a="330938866"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 03:42:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="782804588"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; d="scan'208";a="782804588"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 25 Apr 2023 03:42:59 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 25 Apr 2023 03:42:59 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 25 Apr 2023 03:42:59 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 25 Apr 2023 03:42:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aFCCn0xwzATsIv3ixgX50bLsiULRwSognVvMSjPAwa9aJvTVmhSXPaQaK8CdN56paFFePW4+gpDUt5bGVr5TZRripECiR/9CqM95Um+s/2OPd/7EGQNulLk/vxILPeOuXLkI5WWAws+R96lLMM1R0Gxbd1EUHocWBuGddreTVhI9JJJ3x6Tcloa9StPBuRF0DDEcVIMNs3QcvWp/WapMX6z0nVk1gdr31JGUbpo1shZg4orYTmFtnL8x4NYacdfzejrByDtKgYdeYH8N4l91v2eoBBiBodI00Nk0m5+HECbaVjECcBNhGSMgdozRW05xiUUzjUwQrppwCLlVx84/UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHuE9JUZuz7DwgsyHdqYopU2RtUwjLghC2Dj2YrSAsU=;
 b=B4jkY07AYSL0o4p3hg2oS/p9keswmgDnAnyx7E9fiyrCB7Hh83xdyo8hZPJZsOlZMzxhokGwxAjWvz3yCJYG6Ic+tWW/F6yWivlGDcz+Y3oCp3UtrtuWxg2nD0XxDwhohiKUj9Dn+1ltYi5Q5HPyv/X/HDwuakfE26BOoyZIu9nb3eTAO8LTRSw1oiygRQPqDnma0iyf1acSo6fEd52wtPaLdALFRIxuBnw4S9oo5LxBaVB+T5LTQxGgGUiPO25oi93LKziPeJJd27hvF5YelSuMR8zglruwUjYpEENz0M+Q+Gwh0nKgnjX8ejlOYjKGTMUhphdYVNI3FYExXjre+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 SJ0PR11MB5197.namprd11.prod.outlook.com (2603:10b6:a03:2d1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Tue, 25 Apr
 2023 10:42:49 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::a9bf:176e:3858:c1c1]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::a9bf:176e:3858:c1c1%7]) with mapi id 15.20.6319.033; Tue, 25 Apr 2023
 10:42:49 +0000
Date: Tue, 25 Apr 2023 16:12:39 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Matthew Auld <matthew.william.auld@gmail.com>
Message-ID: <ZEeunzdZ1BrFPWCL@bvivekan-mobl>
References: <20230421153852.329899-1-balasubramani.vivekanandan@intel.com>
 <CAM0jSHO_-1KAs-rOBxaaq0hN7B2octzeN3XcGHrWoRbOYMuo6Q@mail.gmail.com>
 <ZEedNrn7vaQmlSYL@bvivekan-mobl>
 <CAM0jSHMXMgHSkQZicOvZobHgyJ2G_z=n+=A9uQbNgSXUo2Rycg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CAM0jSHMXMgHSkQZicOvZobHgyJ2G_z=n+=A9uQbNgSXUo2Rycg@mail.gmail.com>
X-ClientProxiedBy: PN3PR01CA0016.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::18) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1897:EE_|SJ0PR11MB5197:EE_
X-MS-Office365-Filtering-Correlation-Id: da7e013a-1fe8-43bd-e893-08db4579d035
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 87ckYx3yRAUcCB3mA1T8U0ZdbJ2aW502Pavm/5oUGRNV6R9qFNZqW145J517MCcMzVOrdmYTVRCcNz7uum6g3ME8zfo9qqHhfH2Oba1enS+PicXnKg6khNCmSRbDLHGC0HL8U+8G6vUVersR9ZysKpvfFT6zSKNpsm/xXzs3WW+gM0Uq24tLD4PUvBfoXeGNDeNkEcAAM3+7yFFhe2Xw6y0FW6cNOk9oHE5aRqrLVnh8UugIvHfk3XIB/96uD8aBGJoFRBUjiotgRKwZ/XhRpL16NVhOdJADwo4tlSF03qEHLq414VF4zR7uZfPi8hlIMZLievAnVxZxRUNwD/2dOvmdJF1JfH3peGIJ8ZbnsSShL2IcNGEo1wFbzqH677CgkQi9zAoebkyHspqIivHbTB6FVsZxz10Nq9zuC4MsXpoz5uwzRCDQ4nBTqB0TlBmeaBZlfeTx1I1Tn7dpkBk2JubgrRSlnpZkyvHWYmxQguedABVCZtgmsiKo+aUWCoeKZzbbnweC5f3aC3PtuoaDfylvzpan9QwsMKrki78HxGy0tk3Bb6vik/Z/kdiWVEmD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(136003)(39860400002)(366004)(346002)(376002)(451199021)(83380400001)(66946007)(44832011)(2906002)(6506007)(33716001)(6512007)(26005)(9686003)(316002)(66556008)(66476007)(82960400001)(6666004)(4326008)(6916009)(8676002)(41300700001)(38100700002)(5660300002)(8936002)(86362001)(478600001)(186003)(53546011)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ak5uQ3hTbld3N2hqUTJVTng1ZjFqSVdGdkdiZzJrNTFHZHhzSWVnV2J6a2Q2?=
 =?utf-8?B?Qm1tQm1udklZTU90NG5ydjh3QnNQK0pvem9OQ29LdDhrSjhZcERvM3I1ckgr?=
 =?utf-8?B?RTd6dlQ1RzgvMitKdXNHWktsZ1JscTlDU3g3ZXhCRjNxLzBMZTBiczFlNnVQ?=
 =?utf-8?B?N2w3MXVhYlh2aWdEdHFFSXJsbjFkYlVNUEZobjFwckJxREFOVmRTMloxdjVs?=
 =?utf-8?B?bFNUcjVWdGsxVjhJWE1DZTNFUkw3NUs2TSs5ZzREdjB6aVlsMDJCejFiYnlr?=
 =?utf-8?B?d3pvOVZYSWFjcVl5Nkt2QTZ4L2N6YmpOcWIzeVBUdDdmSFJET2M1RlBnQldU?=
 =?utf-8?B?ckxZZmxZNEFOQXRNVzkrVU1aMTZYMWk4Z2xTOFd1WCs2QkZEU2VyeURydWVl?=
 =?utf-8?B?ejFqYzg4SnQzc0JpQ2NwdkJEbW10NkorNzIrM1JJbXc1VEkyWG9HUlRHdE03?=
 =?utf-8?B?UXl0dWtSTXlMN1kxZzFmTFJ5RElaSkJpREJJSy9WMEt2dGQ5eGhLeEIwcU5o?=
 =?utf-8?B?Q2FPL0lKMm94VzNueGd4TDR6c0ZkaUlOQ0tGbXI0OXNTTlYvYXlZSng0TGhD?=
 =?utf-8?B?eHdEb1ZNb1psOSt4eDZrbWJBcElGNlVSRG96dGJ5cGNzb1NhR3d5ekJBaTlO?=
 =?utf-8?B?UVRkNGFTSEhUd0tCNGp3SEhQU2MvWmxzL0F6eWpWaVpKQ1grMTd0S0hja2V6?=
 =?utf-8?B?OUJUZmNZajlUUWRCWG9DcTdFKzN1VkNKaFRmdXVjL0QwYUxUM1FLMHl3T0Ru?=
 =?utf-8?B?R3MvcHV2ZWxJcVB1VTNkLzE1VE9ENXNMSk4zbHEwOWQxUnFDQWI1Wkd1QlZO?=
 =?utf-8?B?citIeC85Wk94M0lHejNFM0ZnamtRZTlZK0ZobVhrY2NXQmowK01Yd0JGWXNI?=
 =?utf-8?B?czRRTHJ3VFh2N2dPS1VKdisxRVk5czZGdGdNbUd2SktNai9ZdHR2dlZTMDRw?=
 =?utf-8?B?RDkzcG1WdHFvK1o3Y1dHMThBR2k4TFZNZUpHRDZKaE0yY2NrQi9xckdoYXMz?=
 =?utf-8?B?V1Q0Nmc1Y2QxNS9YOSt4S2RUVkwrdFd6L2FoZWJRbGduTnNLS1dzWDN0eThE?=
 =?utf-8?B?NERjbURHZVRMZVUwUWFuclVzczNWWlo2OVJBUEFFWCtaUFVPVnFiRnUzUlgw?=
 =?utf-8?B?eDdPMUpQNXBqdDkwNGFqTGhGblFmazlKbzVrRFF2NlhLQ1Qrd1NPb1VwR3FX?=
 =?utf-8?B?ZzhWcjRqWXhDalZpZUJTeVNzU1pydy9oTnVRNHdWa0gybks4ZHdESWQ5WWp1?=
 =?utf-8?B?V0VIb3Z1VDY3NGhBM1A1NGtOUWFkY1N2WllyY1pmdVAzMVZsNndNcndkWTd5?=
 =?utf-8?B?c0xLRXNqMGxrczl0Tk9WdVViVUN4RHovaVJqbW9VQUwyQ2dzMEtLcjczVEhr?=
 =?utf-8?B?cjNGSmpEYWhtUXB4MXRVeDI4Z3RqcXhHRGUvMUtEeW8wWDh3VnhwQkJsdXJs?=
 =?utf-8?B?S0tvQ3RmMmhQVzgvM0FjZU1xUWlKMFBLcVo0N1M4Vkx3Uk04SmtyU1JuYUQx?=
 =?utf-8?B?MlVTM29yZW0zSFJseldSZmV2UlBiai9qaC95MHZqMGRwSVBLcFpreDRrNGNO?=
 =?utf-8?B?RkhrSUJVZVhJSGVuMisrTGl6ckRPdEFSRU85RDByWHJXS0lFbWtUNEJOQ0gw?=
 =?utf-8?B?ZzFqQTZnYjNMRGpOV2Z4K2VsdUZjbGJyZ3RrVkFPK003UTM0bHRrRGdVWFZp?=
 =?utf-8?B?bHgxOU1FZ3hETHZVSG9OM3d2R00xT2xyc3hheXlhaXAyMmxwVjhSYTM0SjNQ?=
 =?utf-8?B?UFVDWHV0OFRNcjNaNS90QzFmd21HVmxPaWd6ZzVoWEUrbDgweGhZUEZKaHBQ?=
 =?utf-8?B?UFpYckEyTFFqcmcrVThVVU4wN0pjYW9EZ0VOUWMyNUNzRjY4cWxnZmpsSzhE?=
 =?utf-8?B?L2hLL0RKUkYrRVpqancrZGNkVnlEZC8wbHVLKzVwWk01L1Q3aXRQMC9kNmV0?=
 =?utf-8?B?TnVBUjhtUEJqbjRWRWdNdTlMaTc5QzdUWUkxUENjMUs3dzRSTjdDdnFOUzdv?=
 =?utf-8?B?T2wySUNObXVBSWRrWTZSaWdEbmVLZWx5YmVneWV3ZkZyQmovQTBMOHBPdkJI?=
 =?utf-8?B?cURJM0doZXhBUk1WUDVuUXllMVVaZENwNDUrUlJDUU9VWkczdkp4dXZkL0tq?=
 =?utf-8?B?elFCQ2NnRDlsalRhQkJTMC9nbndFYXo5dFQwZ25jQ1UrOEdDakh2SWRmSDB3?=
 =?utf-8?Q?n42yQOVYovkDaBoCi54V3dM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da7e013a-1fe8-43bd-e893-08db4579d035
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 10:42:49.4911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mSEMaSYrET9jEc59rYtnFzCGSwB/AnlNl8EQRMzWP5PaxhGedWQLyM0zMUlJYW9GuahAglWXOFLJpC6PlT14a3yOaqs5UluQ1NHd0Ubm3Cb7NNy0ooWyzObTVn9MrKBc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5197
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Keep all resize bar related
 prints inside xe_resize_vram_bar
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

On 25.04.2023 11:25, Matthew Auld wrote:
> On Tue, 25 Apr 2023 at 10:28, Balasubramani Vivekanandan
> <balasubramani.vivekanandan@intel.com> wrote:
> >
> > On 21.04.2023 17:31, Matthew Auld wrote:
> > > On Fri, 21 Apr 2023 at 16:39, Balasubramani Vivekanandan
> > > <balasubramani.vivekanandan@intel.com> wrote:
> > > >
> > > > xe_resize_vram_bar() function is already printing the status of bar
> > > > resizing. It has prints covering both success and failure.
> > > > There is no need of additional prints in the caller which were not so
> > > > easily to follow.
> > > >
> > > > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_mmio.c | 15 +++++----------
> > > >  1 file changed, 5 insertions(+), 10 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> > > > index 98357c1f109f..8bd39c3e65ae 100644
> > > > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > > > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > > > @@ -107,6 +107,8 @@ static int xe_resize_vram_bar(struct xe_device *xe, resource_size_t vram_size)
> > > >                         return 0;
> > > >         }
> > > >
> > > > +       drm_info(&xe->drm, "Resizing bar from %llu -> %llu\n", current_size, rebar_size);
> > >
> > > Maybe convert to MiB and print the unit?
> > Will change in the new revision.
> > >
> > > > +
> > > >         while (root->parent)
> > > >                 root = root->parent;
> > > >
> > > > @@ -117,7 +119,7 @@ static int xe_resize_vram_bar(struct xe_device *xe, resource_size_t vram_size)
> > > >         }
> > > >
> > > >         if (!root_res) {
> > > > -               drm_info(&xe->drm, "Can't resize VRAM BAR - platform support is missing\n");
> > > > +               drm_info(&xe->drm, "Can't resize VRAM BAR - platform support is missing. Consider enabling 'Resizable BAR' support in your BIOS\n");

Print regarding 'Resizable BAR' support is added here. I thought this is
the point where it would fail if platform lacks resizable BAR support.

Let me add the same print inside _resize_bar() function as well when it
fails and send a new revision.

> > > >                 return -1;
> > > >         }
> > > >
> > > > @@ -183,7 +185,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
> > > >         u64 vram_size;
> > > >         u64 original_size;
> > > >         u64 usable_size;
> > > > -       int resize_result, err;
> > > > +       int err;
> > > >
> > > >         if (!IS_DGFX(xe)) {
> > > >                 xe->mem.vram.mapping = 0;
> > > > @@ -212,7 +214,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
> > > >         if (err)
> > > >                 return err;
> > > >
> > > > -       resize_result = xe_resize_vram_bar(xe, vram_size);
> > > > +       xe_resize_vram_bar(xe, vram_size);
> > > >         xe->mem.vram.io_start = pci_resource_start(pdev, GEN12_LMEM_BAR);
> > > >         xe->mem.vram.io_size = min(usable_size,
> > > >                                    pci_resource_len(pdev, GEN12_LMEM_BAR));
> > > > @@ -221,13 +223,6 @@ int xe_mmio_probe_vram(struct xe_device *xe)
> > > >         if (!xe->mem.vram.size)
> > > >                 return -EIO;
> > > >
> > > > -       if (resize_result > 0)
> > > > -               drm_info(&xe->drm, "Successfully resize VRAM from %lluMiB to %lluMiB\n",
> > > > -                        (u64)original_size >> 20,
> > > > -                        (u64)xe->mem.vram.io_size >> 20);
> > > > -       else if (xe->mem.vram.io_size < usable_size && !xe_force_vram_bar_size)
> > > > -               drm_info(&xe->drm, "Using a reduced BAR size of %lluMiB. Consider enabling 'Resizable BAR' support in your BIOS.\n",
> > > > -                        (u64)xe->mem.vram.size >> 20);
> > >
> > > Should we then update the _resize_bar() fail message to include this
> > > information?
> > This messsage is included in the print when resize fails.
> 
> I mean specifically the "..Consider enabling 'Resizable BAR' support
> in your BIOS". The 'Resizable BAR' bit should be easy enough to
> google. Do we print that on resize failure?

See my comments above.

Regards,
Bala
> 
> >
> > Regards,
> > Bala
> > >
> > > >         if (usable_size > xe->mem.vram.io_size)
> > > >                 drm_warn(&xe->drm, "Restricting VRAM size to PCI resource size (0x%llx->0x%llx)\n",
> > > >                          usable_size, xe->mem.vram.io_size);
> > > > --
> > > > 2.34.1
> > > >
