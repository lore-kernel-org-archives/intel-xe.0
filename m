Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81FD0C77B7A
	for <intel-xe@archiver.kernel.org>; Wed, 31 May 2023 17:07:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AFC410E031;
	Wed, 31 May 2023 17:07:11 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D9310E031
 for <intel-xe@lists.freedesktop.org>; Wed, 31 May 2023 17:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685552829; x=1717088829;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yPkVAW5KYs3GkoIYj5yOat2cghSuPF1qiDazHMCrvWU=;
 b=JrCbUYblA/ChE1hCjK37Sc4DwAmPlyseM3DJKTpCcL09O0e17jtOCzLR
 Mk8XdedxdhWN4p4VIxRD8F20F37IJ0VBehCBUwNngZHHOJQTJLxgxJeF9
 txdpWoz5erfCb0XIDUbMAPD94LTGcNBhWqxQa10eHakWdJhbYq5GdcVVV
 zLgzGe9VNKwdqatlRJZAxlx4ihTdKrWMN21FNfwnCbkciB2T7J0lKpOfZ
 pdKesw3gaKHJBWlRPa+FxNVnOy/K9fnCQ9WhUhPUaoYiLs+8BQC/TZ7sZ
 rLs9W15P3rqlkTjiY8HUS6i6YnfN1mufYqqjOHQzvaOz/SlTajVgrU4/H A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="441661525"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="441661525"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 10:03:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="776832682"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="776832682"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 31 May 2023 10:03:02 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 10:03:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 31 May 2023 10:03:01 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 31 May 2023 10:03:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RTEQvfDIsUbWoPO35Zc1xkaD2cNMs6HWVThqNZRLJ1jc1mmsOJ3uuD9F4aOepHl22pali5uDSp2v+DnV1ig7MEbk/mUJBiwI6BdfXWoP2gcUZQHyP/knIjh21X5IWDpf25axeoCZyNVbhUFSInzt+xRFSdbvwXzA1KkYSgUoS/HRGOnVneTAyON5xms1uybgg/Bk0J5n/6p7A2BI7sIlasNP1Zuc/TXJNCN6K6SKC10tJ7c20Ir5nEII5mtX05G4gOOHT97jsyjFsCfL2GKnSGRt0y1L7eHQeFyqWRBJ9v4NIN0G/JeN/csRybCm0puNj4kJVQKDB9iuaHgp/2yW3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A0MVNuW8K0CcP4150ocU+vqumbN33Cr9neTU0FjODPM=;
 b=d3cNJLxeieKvzDRHrPDcDD/e6Bp+x1KQ3qWLOppH6ewNaeKgzgIOnuPF1CUGT4/QqwFuUAmv7V9AtM2w+FBNl0t/KEvQ4c6l+9XdRrAlFsKrHgoIX8kv84BvvXZ5t36lrsg86j1DA0OEB3pmFboJ/H6OB8mZk34PcV5bQTLeKg6G/fhd+qEGK4QdToSk9eKYy4L+KYz/zr2lIbO5+GiuGcswwLwK6LZ7FV0XN1y+vHT8nv+mHc1hQaf+k2YbZCAfv4Fa6tmRqfR1wIksXcHXRniQuCd6IPBw/7QhFOr3VZ3TZ9oILka1qeLPUBXH0+KiV7UGUzQ6D/xTjsHtYBk+KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CH0PR11MB5457.namprd11.prod.outlook.com (2603:10b6:610:d0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Wed, 31 May
 2023 17:02:59 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::e1a7:aae9:f8e7:6aa8]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::e1a7:aae9:f8e7:6aa8%7]) with mapi id 15.20.6433.022; Wed, 31 May 2023
 17:02:59 +0000
Date: Wed, 31 May 2023 19:02:51 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZHd9u1AdemcPGPn3@fdugast-desk.home>
References: <20230531152338.6-1-francois.dugast@intel.com>
 <uieo7p5pwbj252uxdtmyyozj3crbbrkcm4uevookml3vxqj2ik@c3ilb7d7okcl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <uieo7p5pwbj252uxdtmyyozj3crbbrkcm4uevookml3vxqj2ik@c3ilb7d7okcl>
Organization: Intel Corporation
X-ClientProxiedBy: FR2P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::9) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CH0PR11MB5457:EE_
X-MS-Office365-Filtering-Correlation-Id: 640ae038-47c3-4fa5-bdec-08db61f8e31d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dixTX2s5yY2rBmTyfJfVYChVmPzqz0G5NpkdYSXxNXkgPE+bgNalcOavibUUVOQrxo2D5DTxd431k21lYo+twMgVaxV/YSdltqyH6RIggCYwu8U3eJww/E3iwOaIRZuaNYPCDletcbDnHrBRqa5mj9FfXjCWQe1tWklHuza87DSZWNQ0Q8oiF4SV/9xzoJt7pmtHIVbZ2GY+WkLVXIq2DwQLHWiD5GrNzIDw+0Bb4wfi2R/mZ6G8c5pGBLU4jTuHzcigNsHfGYeoS4vy0+nr11Pn8sJDIDz3BC9LUKlKBQUWi224xlpCs1jDhnksIY2ZYFqYlDp5wrwz8pvoZtc53dfZ7HcSMhDYMHOL4TxPOAGAYW1d6u1FYIXuCrrmn8kTHwEST10RCKwaKqLxYxGhteU2+sHnhK2vzo+sgyZ+2mfqQL+RwX+vTVDSaO79a9iPEG+gTq2qUEg/4RvSgzs6wChLpgTDu7hrnb5mmkPURNr5nPi6SXF9YXie+wTEf7J3jEHSz5MbZwNwLsuThSDKrg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(376002)(366004)(39860400002)(396003)(451199021)(6862004)(478600001)(44832011)(8676002)(82960400001)(8936002)(5660300002)(36756003)(2906002)(86362001)(6636002)(66946007)(66476007)(4326008)(66556008)(316002)(41300700001)(38100700002)(966005)(186003)(9686003)(26005)(6506007)(6512007)(6486002)(36916002)(6666004)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lUrrm2Samus2kHdFxeDScrAUYWvXUaEbbO7xdUYVtC6DnkBOD2CZRdQvApjf?=
 =?us-ascii?Q?eREzFu/D/ZMM1AY1cMj6Uo0Frw2vc0Qcwop34LhxVWvcwgDvPC9wXz8lp22C?=
 =?us-ascii?Q?+4iCNCIMSdlDpZykWvCoZwEVlPWcUVw21jCQVGpiuT0kbTtb5tnTV9OLzbX5?=
 =?us-ascii?Q?s1AoRGIzsnbSEP2Bf2XiZtQpmiXErNF/g9bxcmDk9EeF0NBlMXh3u59lH62h?=
 =?us-ascii?Q?UgToLPVG0OetyxDHicHlVnZajbJrGaIOpDQIX+TlfR7RpvYhUOavx+nw3yov?=
 =?us-ascii?Q?rJ4pX1Xj9hqwm2FquoFoFX+VyeK7ZrkuZfQS+D1J/sTletN7ScOWUD13yUzq?=
 =?us-ascii?Q?YGD1EBXwhQrY5FfDY2IRccz7F8x1fkP9zOD9Itcuf8pQS1xWEexdJfnd6gHF?=
 =?us-ascii?Q?HuwswDzN5ZEQ3MqarkobmnADrLl+RAdk0tYipB7cvNnwWun/BwoyexqMeCb6?=
 =?us-ascii?Q?L12BL88F3B3QltwuJBiaFWnPoFYFl6CmMk0UbCtd/rVG+HB9taSac95PaJ24?=
 =?us-ascii?Q?61/VHKFmpF4trvJ4H3CQYZ+SI9xPcQxCqEin1xcEbiqHvbNrIy7cBh7IyJTO?=
 =?us-ascii?Q?/FVQBaOcMMcOLU+frCtTCD1qA+ZO6WcNw99oIoyFE7WLBcs2ATGeE1/GYa+A?=
 =?us-ascii?Q?PjGH8zEDF25VeROQWmhCHkZGQvHbKPr/qOtr1UDI2600ryBe285vdwEPxCHc?=
 =?us-ascii?Q?0z/BOCY5afNSRFJqHF+XBzGazPgL6JPiUtqyc0ystgJ7PCMkH7RVmy8wsSGL?=
 =?us-ascii?Q?h2tmRlXfa5l+2sCXXfKpFNtNeP9wHoabwL9FdH45nyi3o4wMnwQEw6AyYQNx?=
 =?us-ascii?Q?i7OUhjt6oorAkeoS2FRyJMirRBGxTJT8v8rq/ebKNOKnU+3XojB5YSPiFKHD?=
 =?us-ascii?Q?KqsCm3nbvWnhPPAT4yMACCku0YWl9rs+PzHLoteJBWc3SugoJ02QjMuxaOX3?=
 =?us-ascii?Q?pzy76QrFjPs+RYg1ORCTXSOuztfkuBs2FHlsMgvNaXYlMS2hccTHNjIaGNLy?=
 =?us-ascii?Q?0JQrBTem23EGvZGc5CUpDS6stsbW/7S3HVWlxo1hOOYU6HANuUHASQr9Me2s?=
 =?us-ascii?Q?gGVERGGXIY12ZJN5dFxFhEqO8H1xr9xrP7glPGs3g83V8ujBW8hzNhsfnFi5?=
 =?us-ascii?Q?rLBK2D9jIZAnMP4RI8RgHVuRTmA2SVw+Hg+TUv03n+pLNo5O/Ze85HfGvLmr?=
 =?us-ascii?Q?w0zKSaZHPYPo3ZVVSKfxLsa5LZQGVEkR+utmFD+O339fobrSnvMm435pjTta?=
 =?us-ascii?Q?DuCG3T7oDiCElY/inw0QKETBrA9dGDQnFRTtFczNYRhgLCJEyJ3ssD3xt44D?=
 =?us-ascii?Q?aFKRPBvmWNpTnJDYFGX+OY2VCt6EKLLsK53WdP/DssKnFTxGZ9AICqWv8PsW?=
 =?us-ascii?Q?mAXvs7HsPeix5iccOvAVddChg8j18lvGko9+cT6x0gdd6HjZ0a4RClHAGlQn?=
 =?us-ascii?Q?g3zDeLlZ/y2mfDyrEW2482vUmm709IioyCKGhIvtHrb9Rf2M9siCci2KzdgR?=
 =?us-ascii?Q?F6I/00CAf7PRFUKXSAJSxoCP2VytxSnHI6We0CPBAscTZrKeIv2ksb9rQtuX?=
 =?us-ascii?Q?Ws8wKKTYQmDprALCTRG831Pg90DDJDCRMo/88F63mg8cxRrU3ArIsn8CEwr9?=
 =?us-ascii?Q?ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 640ae038-47c3-4fa5-bdec-08db61f8e31d
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 17:02:59.4625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s1VpcyquRf+Vg5//2JN3sBmJNjt1AbQc1Xwy6DCpeTBkk+KaGhW2m97bHicx2hL9sqCsKTghyLTChUpo3Hx4rk+BVpfdzVcG411PbJTCgXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5457
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 0/5] drm/xe: uAPI cleanup
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

On Wed, May 31, 2023 at 09:23:45AM -0700, Lucas De Marchi wrote:
> +Oded
> 
> On Wed, May 31, 2023 at 03:23:33PM +0000, Francois Dugast wrote:
> > This series addresses some feedback on xe_drm.h provided here:
> > https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.html
> > 
> > It is based on xe-rev1-2023-05-02, not on drm-xe-next, so it will
> > likely break CI.
> 
> As I said on the previous reply, this is not going to fly. Now we have a
> patch series against xe-rev1-2023-05-02, pushed as xe-rev2 branch with
> *no recorded reviews*, doing things that already conflict with other
> fixes that landed in drm-xe-next. Examples: the 32b compat for uapi,
> the mmio refactor, the oob WAs, the probe refactor, etc etc.
> 
> Also, there are other fixes queued as fixups, which is still the process
> being used in drm-xe-next. It's also where CI is running. Due to display
> being moved up in the branch it's basically the only sane thing to do.
> 
> I think we need we are shooting ourselves on the foot and this review
> process needs to be fixed / agreed upon before we create a mess out of
> it.
> 
> Lucas De Marchi

Yes I understand the concern. The intention is to address Oded's feedback on the
revision that was reviewed, so that the next review iteration is manageable and
not based on a moving target, which could lead to and endless effort.

Maybe I created confusion by sharing on the mailing list but at this stage the
idea is not to get this series merged, only to get Oded's validation that it
fixes the issues that he reported. Yes this means more work will be required to
rebase and create fixups later for drm-xe-next but it seems acceptable for the
work that has been done so far.

Do you see a better way that would still satisfy the "not moving target" goal?

Thanks,
Francois

> 
> > 
> > v2: fix ordering of defines and fields in uAPI (Lucas De Marchi)
> > 
> > Francois Dugast (5):
> >  drm/xe: Use SPDX-License-Identifier instead of license text
> >  drm/xe: Group engine related structs
> >  drm/xe: Move defines before relevant fields
> >  drm/xe: Document usage of struct drm_xe_device_query
> >  drm/xe: Fix some formatting issues in uAPI
> > 
> > include/uapi/drm/xe_drm.h | 171 ++++++++++++++++++++------------------
> > 1 file changed, 90 insertions(+), 81 deletions(-)
> > 
> > -- 
> > 2.34.1
> > 
