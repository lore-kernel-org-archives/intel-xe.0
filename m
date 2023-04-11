Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85AEAC77B6F
	for <intel-xe@archiver.kernel.org>; Tue, 11 Apr 2023 16:34:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54AF610E105;
	Tue, 11 Apr 2023 16:34:34 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DABDA10E105
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Apr 2023 16:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681230872; x=1712766872;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DUz0lXnlEfVlpGIr3tCsw5/HWkA6OK1sKsiAZkQWb08=;
 b=fcDiC9rSaEziIahwPdsVGudHB4ASLOvj+j9cevP8i8tgOBpkacB9/krq
 0s+bZ6bj7UnjJ0olBvMHNJIiNCCnZEBnY2W1Q2Kw3K8hV/fvyw75AKzsM
 L61J7fjbiAd7tNBZj+dc5RuVa1gyXsOQqYaWe321dckVN/nZoG6pM4tRR
 BBrOmyARl0llw5MHQhheeMG3spx0Vuz2RsV0ASRnWWY7kmL7wFVpylK97
 +7Px54/9661oCm7bEQ8E3HMHaIZo6YKJ6XRmYNpxs6and3HMEPrvVRjRE
 7rTF2k9iJEmGGYd4o0q7EPhOn3xFNe1AEnKZu8rwRV0hUtiNmU6Qyr8Oq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="429959167"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="429959167"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 09:34:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="1018428445"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="1018428445"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 11 Apr 2023 09:34:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 11 Apr 2023 09:34:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 11 Apr 2023 09:34:07 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 11 Apr 2023 09:34:07 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 11 Apr 2023 09:34:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YFDstETH2hiIY3YWtz4iUnvVNNglA0qFutdYQ9Y+1tPfQ5I0tyCJZqvnukMSvES2yF+gn5oH4WvF9QPQhxP9wduXQcaePQj2JmvZBsaqSUkXmaWjc21OrcNMVmqoM9zCWZIqEeFpTnwmMaRyncnRG3Xrt3Gy7xSrExnMoe6ooWM64MLYe8KE5wxEaIGJCxv19cnCg/sTmj+F7RcNacBUfeu/XK4GVPPUcODI03n8p7YiwybKJoII8lrbBx7Kbz6AyVhFzhnSqFzb41MEjSuudG4eOxk6tLV4R7lWL5+zaC0o+b4rPz9ldlwxoJ3n+GTBD1aKEUuwvio212gid09kLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RzmUuDWrDeDN/k4UhhpadYmPBplA2DqE6dNTPLKn1OM=;
 b=DcUaQe2dy81U+aSe58fK9mdua9G1+F7N/D7Kk7u9KkwQ0EG2GW3+uRXSFAdhmZMKwdOSxYfAv5ahtbfJewyXfYQOBVX2qGtcnVaDC71TYFmEHWXhqlqyaaSTqDFNka5a+/KVtDAhHx5+FsJ7z+BZDAC+BPtf/z2E9ayEr9GZMuE3+4J/6DicPw1wq7jLIQ50sksqKykxP0qEu98sSK2ER3KeLimKQhm92srYkRVbxph43104fJgy/JZG9T8jov2BPdvq5yFUSZ4LMIV7SRSs7P/2aj2B+hFpidQBAUq2W+a+4kGsBGNGuehy9EQ6QJYzP4tmswjXKK0//LhDpvFc6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6261.namprd11.prod.outlook.com (2603:10b6:8:a8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 16:34:05 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%6]) with mapi id 15.20.6277.038; Tue, 11 Apr 2023
 16:34:05 +0000
Date: Tue, 11 Apr 2023 09:34:03 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
Message-ID: <20230411163403.ahqonzymovlw4ujd@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230410180504.2706189-1-anusha.srivatsa@intel.com>
 <20230410183726.r7hsj55yuqaouuyq@ldmartin-desk2.lan>
 <20230410184510.GV4085390@mdroper-desk1.amr.corp.intel.com>
 <SJ2SPRMB0011023861F6CB95DBF1A334F89A9@SJ2SPRMB0011.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <SJ2SPRMB0011023861F6CB95DBF1A334F89A9@SJ2SPRMB0011.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY5PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6261:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d988e0a-fbde-4c32-4674-08db3aaa9088
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gy3rSa1bqqTDfW90B6TzKvkmk7fmI7h0iSGpGcjX9wNOs4As8j6+O8Ex6yZGg+WSSRnvw33zyZw7G6jH7qg30l9qx1IIliQJB0FU82uz9PK+Ubl3sqnbkMJjb1+ItjBD5+LXx4YBxx2gWEqPuRGhPo3cVNM04OUpb9e9i2djnnKyWsc2hxwbwiYWvassfKGDBDwYnvWnUsXC2HZF9wFw9ICxiDv5WYJqQS+Wv8MbOTiUE8snWArL7Y7ybMJBl+sNVwcQ8+KyTYscDUfTa61IcMJpd5l8DrA1B7OULN2lYUYDO8rf0dp2L4lWg7t1B3JLFzf0T6IxeXSbCo80cAlLXv878Yj9TP2L3WrB1hLxXrKra1RN4A+xk/Gadkaqwacea7p9y5+B0xOtMKzrZ3PRiC5lfF8W5W8Ghe5LgZsMdbWtoWvM/LtCT6+bzGb9NWIRqZCS+I6UKO1V+xkv5kSnx42f0py27A+Hco8ioCcoVrt9sFDfCiN+87JOaxvPd+6s7KJTsgYLY7Fr2vHc2tQpZ0fwXpRy0YhxEpagR8XIXI1VjMRFQwxrDHjP8tkOubaO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(376002)(136003)(346002)(39860400002)(451199021)(6636002)(54906003)(83380400001)(186003)(478600001)(41300700001)(316002)(66946007)(1076003)(53546011)(26005)(6506007)(6512007)(6486002)(66556008)(9686003)(4326008)(66476007)(5660300002)(8676002)(6862004)(8936002)(82960400001)(2906002)(38100700002)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CtWUMJBKXpXotaHCXI/6JcgFBhZ4ao7lh+taa1oMF3dTV2buhCPFZgrpLXKV?=
 =?us-ascii?Q?hxcYLspDx/SKrTRV49OMNypsx6mu3FgUUJIhllKL02//+HvJKQRxVXv48D7V?=
 =?us-ascii?Q?0qJVeWyJkW3qOCK+P5lYJcubTPGFmenwvKDTxquDGrZjBOTggdSnlxV5ehZT?=
 =?us-ascii?Q?4wx0mPmiWzw76h/2nP7ut9CilR/Rhl4fKD0Ck+ORSRLYzjRB5kfaoJIuTx6B?=
 =?us-ascii?Q?k5o6S6DG2rIMGPQfwG2276feCIWJqPCtqeR/sXjtk2G8/VfNDSfD2BDWZ2UN?=
 =?us-ascii?Q?QS/o3G2IGBTpSm1IfmY+PTVG7hMMGl+fVoyYDtRKc6+iHPYOnEbSeWBY5GqY?=
 =?us-ascii?Q?yp32k0jPGNd5Wi5uVXSZBjMkJuwkkMIu7za3/N3/Iy1HGztpNxRUlYEV3Hrw?=
 =?us-ascii?Q?2AW7d8Q0rRiYwNmX0rBduCh7vSsrAe9+UoiMVuE3eSC297ydvi8HOI03JGiO?=
 =?us-ascii?Q?yYxjQHpWLygJZ8yeH3Gi4JTvXDNK8xur2DL0FLn1PuYXUlgV8VYAQd0k099o?=
 =?us-ascii?Q?EKraxYWOjnbU/pq5TUmRkGKcU89ZCNBH/H3eNSJnSAvS1nCtH4GXs2cRczha?=
 =?us-ascii?Q?U84jAaJK0zdtsysY5qZAuBjPWBMGtqfAx7NOt9fChDC0a3yZIuKy8u9mCPmb?=
 =?us-ascii?Q?Yh6vJS+2DH90+yT8gKtmCcGBLH/n5ptysJtqHblwqWWNm6xOHo2e1Gkh7zCw?=
 =?us-ascii?Q?HERAR0SLde0QJCaaNJYHQEBSi+ZYJSRaUohT82Es0KZu0Okw93bZ8jvAxie+?=
 =?us-ascii?Q?9hSfN1abtJ3JfbIbIZu2+QoyxplHB9UkGhNNrydZi28qZ+hoJwrbeUVa+9M3?=
 =?us-ascii?Q?EsXO6mT1biembjie1z5O823UyzrJRa3+FqM3bl8dkHgws5CgWx1pGeRu6/e3?=
 =?us-ascii?Q?qHlcz2Hv3LVcCIyH3QJShltdR9V7YMb+o19bnSfxOLXv7cWlZ+Ko06Xk5M00?=
 =?us-ascii?Q?62291qgAQxiIejRUEuAMquOdqHHY1gnVvNiGxaJLmfWotTd8YSjwSm/hz24P?=
 =?us-ascii?Q?gWbHoW+FwukVmq1SkljrqOqEezwLzFVnmxKgjZ2zn7MTyaEREr9BUm8bR1P+?=
 =?us-ascii?Q?DTo8KFSETut2Z2ukJ7gsvC6vo9I2N/cNKlkkHfvGxj1YvatvdSO6jvCS7sNw?=
 =?us-ascii?Q?DjhHdIzsul05dEVsv8bCaUTaFM9MuqnEb8u9EoQbXCnzaM2tbUanjQ3CBfPc?=
 =?us-ascii?Q?97oGlyMeFoz9OL+FyCHkBlRNZlidZOVLUsmwuqzXx3n414+WEmvr4vFMuUvs?=
 =?us-ascii?Q?pD/IqoWf1468oTQlY/tIbr7VY5sRk4wAgjmIXN1YC9xK33Psj0hwv2od+xJI?=
 =?us-ascii?Q?gnF3EZ91iRCPkRZiCD/yMIhvtH93zVJ/g7lLuMVNayKU5bVzUmTqnpXnhTtI?=
 =?us-ascii?Q?UQ7FYqIAq/q6J1AvbPZ29mfZ57gtagYrsqqvCmid4CCOKuiMBzSk4w69HSV7?=
 =?us-ascii?Q?hShIZd5oFj0a0DjkiKO3Ra8Pra5FDmjeeYY2GeERTdpZ3ndk94mGrpTikCMp?=
 =?us-ascii?Q?tkklGgSJQDAwtRDg+tRv9gOV1U5wAMyHtLJLFp1hbkxF4SgbZ+pIzlHADLvi?=
 =?us-ascii?Q?pPXMM1cJy3zJiJdfV8fxaJpuH3sLMDXkrNu8WJrW5JlMsZSB6z1c/pgtCLwa?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d988e0a-fbde-4c32-4674-08db3aaa9088
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 16:34:04.9068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /wGXdg+4WzuVxOWnjpEMf4j2TpICrfVCgQ4BJt1tFlaI7RyXErA55Y3GF7uLGO10bQRXTTzAXOzlh2LkNqqa7xf7tUbjhbUqsadlRyMd3Rk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6261
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Add Rocketlake device info
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Apr 11, 2023 at 04:23:02PM +0000, Anusha Srivatsa wrote:
>
>
>> -----Original Message-----
>> From: Roper, Matthew D <matthew.d.roper@intel.com>
>> Sent: Monday, April 10, 2023 11:45 AM
>> To: De Marchi, Lucas <lucas.demarchi@intel.com>
>> Cc: Srivatsa, Anusha <anusha.srivatsa@intel.com>; intel-
>> xe@lists.freedesktop.org
>> Subject: Re: [Intel-xe] [PATCH] drm/xe: Add Rocketlake device info
>>
>> On Mon, Apr 10, 2023 at 11:37:26AM -0700, Lucas De Marchi wrote:
>> > On Mon, Apr 10, 2023 at 11:05:04AM -0700, Anusha Srivatsa wrote:
>> > > Add missing device info for Rocketlake.
>> > >
>> > > v2: Also add abox_mask to the device info(lucas)
>> > > v3: rebase
>> > >
>> > > Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
>> > > Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>(v2)
>> > > ---
>> > > drivers/gpu/drm/xe/xe_display.c | 11 +++++++++++
>> > > drivers/gpu/drm/xe/xe_pci.c     |  8 ++++++++
>> > > 2 files changed, 19 insertions(+)
>> > >
>> > > diff --git a/drivers/gpu/drm/xe/xe_display.c
>> > > b/drivers/gpu/drm/xe/xe_display.c index 5fab5b9fbde0..44697c0f7fb5
>> > > 100644
>> > > --- a/drivers/gpu/drm/xe/xe_display.c
>> > > +++ b/drivers/gpu/drm/xe/xe_display.c
>> > > @@ -488,6 +488,17 @@ void xe_display_info_init(struct xe_device *xe)
>> > > 	case XE_DG1:
>> > > 		xe->info.display = (struct xe_device_display_info) {
>> GEN12_DISPLAY };
>> > > 		break;
>> > > +	case XE_ROCKETLAKE:
>> > > +		xe->info.display = (struct xe_device_display_info) {
>> > > +			GEN12_DISPLAY,
>> > > +			.abox_mask = BIT(0),
>> > > +			.has_hti = 1,
>> > > +			.has_psr_hw_tracking = 0,
>> > > +			.cpu_transcoder_mask =
>> > > +				BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
>> > > +				BIT(TRANSCODER_C),
>> > > +		};
>> > > +		break;
>> > > 	case XE_ALDERLAKE_S:
>> > > 		xe->info.display = (struct xe_device_display_info) {
>> > > 			GEN12_DISPLAY,
>> > > diff --git a/drivers/gpu/drm/xe/xe_pci.c
>> > > b/drivers/gpu/drm/xe/xe_pci.c index b92d8b5a391e..a81427019d02
>> > > 100644
>> > > --- a/drivers/gpu/drm/xe/xe_pci.c
>> > > +++ b/drivers/gpu/drm/xe/xe_pci.c
>> > > @@ -179,6 +179,13 @@ static const struct xe_device_desc tgl_desc = {
>> > > 	.require_force_probe = true,
>> > > };
>> > >
>> > > +static const struct xe_device_desc rkl_desc = {
>> > > +	.graphics = &graphics_xelp,
>> > > +	.media = &media_xem,
>> >
>> > now it will have VCS2 as a possible engine. Not sure if the fusing
>> > will handle this correctly or if we should create a different
>> > xe_media_desc for rkl.  Matt?
>>
>> We should double check to be sure, but in theory the fuse readout should handle
>> this properly.
>
>Hmm went ahead with the assumption that the fusing will handle the engines properly. I will add a check in read_media_fuses()

this is more a question than a direction to add more checks. If this is
tested in a RKL machine and confirmed the fusing for VCS2 is read
correctly, then we can keep it simple and not bother with additional
checks in read_media_fuses(). If it is, you should be seeing this in
dmesg:

	drm_info(&xe->drm, "vcs%u fused off\n", j);


Lucas De Marchi

>
>Thanks,
>Anusha
>>
>> Matt
>>
>> >
>> > Lucas De Marchi
>> >
>> > > +	PLATFORM(XE_ROCKETLAKE),
>> > > +	.require_force_probe = true,
>> > > +};
>> > > +
>> > > static const struct xe_device_desc adl_s_desc = {
>> > > 	.graphics = &graphics_xelp,
>> > > 	.media = &media_xem,
>> > > @@ -301,6 +308,7 @@ static struct gmdid_map media_ip_map[] = {  */
>> > > static const struct pci_device_id pciidlist[] = {
>> > > 	XE_TGL_IDS(INTEL_VGA_DEVICE, &tgl_desc),
>> > > +	XE_RKL_IDS(INTEL_VGA_DEVICE, &rkl_desc),
>> > > 	XE_ADLS_IDS(INTEL_VGA_DEVICE, &adl_s_desc),
>> > > 	XE_ADLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
>> > > 	XE_DG1_IDS(INTEL_VGA_DEVICE, &dg1_desc),
>> > > --
>> > > 2.25.1
>> > >
>>
>> --
>> Matt Roper
>> Graphics Software Engineer
>> Linux GPU Platform Enablement
>> Intel Corporation
