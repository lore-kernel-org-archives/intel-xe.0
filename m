Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B4EE94115
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 20:56:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF8A310E56E;
	Fri,  6 Oct 2023 20:56:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A40C910E56E
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 20:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696625788; x=1728161788;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=af29al+SfRr/RkPK7AYTRziFLkcTN1gm9pLwt80qelg=;
 b=DyU8CsiPRTxu67T2PIiktMmSq5Nod+EWOTvUp4Q29uxHu0ZbSWtuPxqt
 KvByNcXOtCPA3FE897wdSrdjuJaDZg8T1vTfNF2Y1xwWWjyqQZa2STlem
 wZNB5aJ7f0c8o0JNli8L1ahuz/YK5fkt3uT9LRrMPh0zPgPlQP+OP4qSa
 0axV1xm+ptWHERyFtctGpTb2LuPkp48jhVeE4gn5UKknWpsrKR4JCcQUV
 deXx1w1O48xDUB+9IAXp+C75ilTIL4ATdhfLCY3nGnmb8Wrq20mceGM/D
 +FVSbwshHjpA3axDH5w8yvRDL6yXhOcFW5bKOQ+fFdGIr0fHPchTqjSoD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="382695571"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="382695571"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 13:56:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="787505250"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="787505250"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Oct 2023 13:56:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 13:56:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 13:56:13 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 6 Oct 2023 13:56:13 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 6 Oct 2023 13:56:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KGbso8f+17Hxm3qe4uyz3xL8s0algpu92jwUoCoIrh5A0mELplV2EAIiz3sJR4LLWJOClqLpbxZ1/+U4HGeTPxbtvf0OTt7phrZj341XfnEefmsLBFDPYG8HJVhK8eJSv4Sjzcpp7EXIBF7heqof+QptfaGRFdC7JC7n/iqPXYJLZE2chqEg0xRyfyWNiOhWY0hZaVvI+4kWEOFfMT9Yd/3Pufa/OQ6vA7ehKk4aSC8OGf8tZtyHKI739R2ua5ks0TGIwrbeV9XA9c67FVCcJhVKo5W5kQv+5tnJ6nJcMK3xc5qeXZHmqEzks2lMKnmRbal0zUS9IKeVBXQJD+wQ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6tlolkhn5b0Aj4EHFZAg6srZVYA1L51eGWicJnbKpFA=;
 b=BkS7Ovc9ThDaOQrZsGt8rg29744TXkVfPQrYYzhE0PPsI6Ks6rxeTitVzDNMBeiAiY7eBEFmK6QrUG2xi2+j2mpgVQeeMoTh3yjmD39uMMc1p1uO4CL2vQVC7i1B6BpWbrIOIvz+tZ+0nN6Wa06Fsxe+tQx2QRHRK+lkpJdZhj2lu78n7MBn5ryy1riL4jeevBS4z1xeRGZZxFkxVlknnBIoWy+053vtY1jEpMELXzyvnJ+Uc28kB9CcgbGohcVQTcmE8EOV6qttsy1u+qXphXfL+B+EeYS/P4GGig4XFoHGezn2Kn/9R0gYM9w+Kbtta/4zsBTpbHkAjjfXU7GGNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV3PR11MB8532.namprd11.prod.outlook.com (2603:10b6:408:1ae::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.39; Fri, 6 Oct
 2023 20:56:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%7]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 20:56:11 +0000
Date: Fri, 6 Oct 2023 15:56:08 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <srpfbr2i544raey3j7632bq7uhowya53s2v5osbrqxuxhoyruj@vltqrwcbrey7>
References: <20231006165053.55479-1-jose.souza@intel.com>
 <tecwsvc6m7wofukfl2fsroircqfyla6i5rnewl3dzclhyigm3n@ryoralndd7cx>
 <5a8e6f5807c5271e2327b7e0d4f8f04530d08d4b.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5a8e6f5807c5271e2327b7e0d4f8f04530d08d4b.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0113.namprd03.prod.outlook.com
 (2603:10b6:a03:333::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV3PR11MB8532:EE_
X-MS-Office365-Filtering-Correlation-Id: cc835713-7463-4580-19b6-08dbc6aeac03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V9fW9qC8Lf0JITlkTACliTJbiMoWh8Ds8L+1QynGojBCxLtINh6pwU9AFofZsxYR0dPSyaVAEOY9YhqNV+u40BMq8TXshUa7LSo5QNyD/xnYxGtHmCH+J4IqEIeVlx6t9Ru91eRsz3j1uWMFIupvFPeDHReCjRgmPm/DTl06a6BJKxlETQcCe9l2zfVIjOG8rTjZuTtpT5e6ht1SwtDv16gxD7CLbhyznHGgzYFlER9vOVsODTDTXzWgUy1bDAuzfkajeFRhOMLNEf55oYrideDITQXZNaQhgsBwe9RC8VlvV3Hfmq3vLv3zpcsI6wfPBRE8Q6kPCp5s75L0hYCWeny3IjloGt0xZ8cK0xtOkoLzfIkTNYFlPCBxLnVgphIfR3q2fybNno0aaUMWtd7o/RuDLRFS190+SDp/UyvwXVKweqym7RKsclKT8XjO9wuDUAI+ntyG11Omg5CHNUvvFljvFPvsEiWoWSlW/J6c684W+PjwNP8vcBUAQxXawlyLFSk74LfF+vid6T00wS2hQXdOwV0XVTYhewG6XyAM35Ccx+vubdPNcHxO9u25zmch
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(396003)(366004)(346002)(39860400002)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(316002)(6506007)(83380400001)(2906002)(8936002)(41300700001)(5660300002)(6862004)(4326008)(8676002)(66476007)(86362001)(26005)(33716001)(66556008)(66946007)(6486002)(6512007)(9686003)(6666004)(38100700002)(82960400001)(6636002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?BLjzna7jj+m+D2d9GYsgJdeVoiYCTEUbjNQwO56wLKB4sMuPdDNmDpIlXV?=
 =?iso-8859-1?Q?f+B2n1vQRh76JuPsnvHc5mDQv+1bzDiEiXwSFNO1FNs/tmS6ja7K7d71ZD?=
 =?iso-8859-1?Q?PNMGKL9ttAAOmJJ10TkXK2ZBkWSTYnQ4QLV4dRegwb+i7qLO7S/WCLOysb?=
 =?iso-8859-1?Q?KWtXYMUz1g9gRSClUDGRcOuORXJkVtGOc4QKsogCeHoKcUPWtGkUZW2oYd?=
 =?iso-8859-1?Q?Ao0e9MZniJsW6JZFe1HFqc8+FjwI0txBy9tur7R33CWGRnXIkG4TPBsVQp?=
 =?iso-8859-1?Q?bILvIJPX0FxsaEmtip4ISQug7W6O+KfbcnERDv1DgXXDPEooQTf3TqnqEM?=
 =?iso-8859-1?Q?DAdEl/sASif+colDb7oEYcYcFxLy0cyFp0pGQH3akkVEibcEHJV0UoO8Ld?=
 =?iso-8859-1?Q?VCJzo3Oln2hYQaadXLMVnwbYqL9zz/ec/vKdIwEzmG2Pb5k/qduqNWxOXo?=
 =?iso-8859-1?Q?q16irZUiJ3jHII9tuT12rAtrk2ibL+RNLgtB78bCrzB2WRPWHFTm11ANBF?=
 =?iso-8859-1?Q?A3HQJ+su2vYICwUXUQW8smAXp1VoS1A4oXWa3N6enBIZjzJU0OAK1O9ziG?=
 =?iso-8859-1?Q?BxHRuh+NSk7xCNpmauPSNAIKfGWnGL2uHghjEN/SL4mkcurVpWhm72lFKU?=
 =?iso-8859-1?Q?tjPwAmTweGAA2cjO8Gt9KXBS5ZpWt6m6xGTNlfzCzLpqpV+9ETliL+MzCv?=
 =?iso-8859-1?Q?JPc3AWa82BeioEZYvrYuHmiopTh8u23dkovSw649nGQ/rkKPB5NH3vLnL6?=
 =?iso-8859-1?Q?grG2MobTw2nqiBwYMBzAGwnI+OgjzYwbWTM0+URDC63uJ8GX5ZT6/IipAi?=
 =?iso-8859-1?Q?U5gAvn92Q/BFgVHlXnpI2KfdF0f3KYRViOTFMyCwdGkbSTacohCDPtReVB?=
 =?iso-8859-1?Q?SI7AnCcpU2t6t4a0gRpb83Ycfq5evVSNNPF41qn8F4pl5hRdXxZQuBHDDV?=
 =?iso-8859-1?Q?b8bIxDA79GoA4KR9dFbDw6i2uS+kVWB7HagGld5GklnLzVfCa92Lyjbbmg?=
 =?iso-8859-1?Q?4i7xymqWYocbXUQDFPVDJ9aGcv4b67jvFIEKPsb5WwWhBSEymuuG9HkIh+?=
 =?iso-8859-1?Q?LFVGQQTB5j65lr2OGzIw3Rfqhi1otxHflDOQKeXiSrxEskSZjuDGe7Fijo?=
 =?iso-8859-1?Q?ovYqUMrxRDmMDdbSgbHMbf5T8g/J4cd/VWrxTeyIbBiwseFdcboBxxHqcE?=
 =?iso-8859-1?Q?DfhsbazXUCgBp2k3STctesv3KChDS6WmIQoZ1DbrJc91isorkuGLjxXq5Z?=
 =?iso-8859-1?Q?O0CbcJcKmQ1gy5daGkcZOnF6JO55VQescz1VOxL8Rcgs3dCg9hCzdXq689?=
 =?iso-8859-1?Q?MIYto18/FsFWvrEMSvHTbt4eMWv0o00ogW9AE2MZj/oM1t0YnD2nOmkAt8?=
 =?iso-8859-1?Q?SIydcOu5QXYlXY7a2WG7Th5zE3QoaU87u62s0J/SmvkM0he+IzmBJxf+5V?=
 =?iso-8859-1?Q?/hUu8XLkoWM1Ai3myP59cqiSJQKvmua1aLHb2m4/ke/EZLt+6YWAoGAszr?=
 =?iso-8859-1?Q?RwhElDI/N9t4qiqzwS8fnsS93Da4q/TL2FtRPIrPTh7tTKrvcTj2I2TZ1+?=
 =?iso-8859-1?Q?Tn34cObotwmCIcSbHnivUyqXPyGg5QQwnmFRZ5NMce4rnt1GWYGjDyM18R?=
 =?iso-8859-1?Q?WQ2sLClgnZ/VtNhW5yKZ2tA85rBSHyljVSZnPZc3LYpindOYAmEPqDow?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc835713-7463-4580-19b6-08dbc6aeac03
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 20:56:11.7599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pGeb+1TUGdakzmHtrpA4NKZ3RGKjoLFjoRC4nex+1h15ZTgzB0mHX7mbfFmNaDHabbqUQ9RlmDhGVVVxXsRBzU/VZNDOAjdArRk0AxtlxpM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8532
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Remove PIPE_CONTROL_TILE_CACHE_FLUSH
 from PIPE_CONTROL in gfx20+
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Oct 06, 2023 at 05:23:36PM +0000, Jose Souza wrote:
>On Fri, 2023-10-06 at 12:16 -0500, Lucas De Marchi wrote:
>> On Fri, Oct 06, 2023 at 09:50:53AM -0700, Jose Souza wrote:
>> > PIPE_CONTROL_TILE_CACHE_FLUSH/bit 28 is now reserved bit in PIPE_CONTROL
>> > instruction for gfx20+, so here only setting it for older graphics
>> > versions.
>> >
>> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> > Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/xe_ring_ops.c | 5 ++++-
>> > 1 file changed, 4 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
>> > index 6eec7c7e4bc56..c2aec32fc46ad 100644
>> > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
>> > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>> > @@ -157,16 +157,19 @@ static int emit_store_imm_ppgtt_posted(u64 addr, u64 value,
>> > static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
>> > {
>> > 	struct xe_gt *gt = job->q->gt;
>> > +	struct xe_device *xe = gt->tile->xe;
>>
>> gt_to_xe()
>>
>> > 	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
>> > 	u32 flags;
>> >
>> > 	flags = (PIPE_CONTROL_CS_STALL |
>> > -		 PIPE_CONTROL_TILE_CACHE_FLUSH |
>> > 		 PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH |
>> > 		 PIPE_CONTROL_DEPTH_CACHE_FLUSH |
>> > 		 PIPE_CONTROL_DC_FLUSH_ENABLE |
>> > 		 PIPE_CONTROL_FLUSH_ENABLE);
>> >
>> > +	if (GRAPHICS_VERx100(xe) < 2000)
>> > +		flags |= PIPE_CONTROL_TILE_CACHE_FLUSH;
>>
>> Looks correct that it doesn't exist in xe2. But looking at bspec 56551,
>> it doesn't seem it can't be set, but rather that it doesn't have any
>> effect on xe2. Is this not the case?
>
>Yeah I don't see any tests failing because this bit is set in Xe or Mesa but better not set reserved bits.

Why better? We do that all the time in the driver when the bit is just
"not valid for the platform" rather than "can't be set".  When it's
explicitely marked as reserved then it's a case by case analysis.

Lucas De Marchi

>
>>
>> Lucas De Marchi
>>
>> > +
>> > 	if (XE_WA(gt, 1409600907))
>> > 		flags |= PIPE_CONTROL_DEPTH_STALL;
>> >
>> > --
>> > 2.42.0
>> >
>
