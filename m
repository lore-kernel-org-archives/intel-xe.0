Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ADE4C7618E
	for <intel-xe@archiver.kernel.org>; Mon, 24 Apr 2023 20:52:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3932710E602;
	Mon, 24 Apr 2023 20:52:12 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C812610E602
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Apr 2023 20:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682369529; x=1713905529;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7chgv/M0cstmPDbZKZII+5n2Lc64xWV3nlkXTipP+74=;
 b=emglKlWmwfSW3LIzV2YdqncfsLPZ97+VDkRivHabGENq3fY3WLsHGnf+
 PFroNOu6/gcH9m02hXBxqTnL3PMPXJ+salTcaW0q2RawdWNTPX8tIJ89u
 trCJI8D812jUSDoITrWjji0AhbuWIkX/adwfWw1jtqNqfEttxfH9JwSTn
 kAeYUUGH0KlyfmAXOW0eVGYfyCZfm6CQV5vD/CYuv4s380BQ6I4YlhRuz
 THAlVeDIjF5+08h4Ogu9yYUROtl0PdyRRqQGwPHR4/Jw3sKYwQhS1bkmu
 HiRHRadmfNiio3ZNz0ybZ1DifgKOZ8n6mJyBab6jh6dwk4agBLWj2/lJe g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="349363617"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="349363617"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 13:52:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="782542458"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="782542458"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 24 Apr 2023 13:52:08 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 24 Apr 2023 13:52:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 24 Apr 2023 13:52:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 24 Apr 2023 13:52:07 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 24 Apr 2023 13:52:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bstaw86PHMz8T8ECEPxUJHHafbLHdxfNJNOuZWzLj1p8+J02xKWHpnRhaR/xsNo11EBJTQpzoRJgYV3mbkz7YyMkLuGPgLxxBR0cFv+5x/7siIbolvqn28K8TCm9weKYU2WrxO1G1+x6QgEyajdh3009xdb8jBfjP37to1NWsrA8xPbqFHij/BKlYDpEwsGh/fWdlQ2zxG42lZJByrU6XZsHCqT8IjNElMmKV65WE2EXyqqBz5+fpvxRVddHDQRvouBhrAFuVUUJUTxjoKgTN8/zmtxvX4gfX8gX58jIMpuyFxts8b+WXxMfwZjDGzGEM2pCQ23/bCVv70ervHM38w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yM4+PITnEdYg671Lgz+DDXgHNl5frIoYY6iSrI0D+Nk=;
 b=YUmKIFA7lEso+tn3UZbBIkYCtW85rHxhMQ+CVruWp8wdcG9ThOzxdkv+7IZOZxS+oNd1ONeSlYr+UI+LFHeitL92tMIQ886gTNPVQp1pslkunlpRtFwZzYqm+klR4nsPtKE2eNfsapfZvutw31DqJ075sxNrG6+q38PSVB8szjFRqfKwPtYPCBiV7T3dyPHowO6/hkvxbjNfrEMc4WZYQWHVtjiOPJMYeLC40wiEiscE/w0EaF4ESwlJYDuZRR7zazRutEFjfh0xD7oDHHlLg1bn90aelXRrf291bVxHR6IBRWmAEKuoWqL1EcKFUIxZ/9pjWpOUxIhXMPE+BLwKFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB5084.namprd11.prod.outlook.com (2603:10b6:806:116::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.32; Mon, 24 Apr
 2023 20:52:06 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 20:52:06 +0000
Date: Mon, 24 Apr 2023 13:52:03 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <4d5zchnzxxasdcae3w5asaeki442pt6fb7t6vsk5dhdo74zwvc@fe72sk52j5hb>
References: <20230421223258.128781-1-lucas.demarchi@intel.com>
 <20230421223258.128781-14-lucas.demarchi@intel.com>
 <20230424202912.GB10045@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230424202912.GB10045@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY5PR13CA0019.namprd13.prod.outlook.com
 (2603:10b6:a03:180::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB5084:EE_
X-MS-Office365-Filtering-Correlation-Id: d728c704-acac-4801-3a8f-08db4505c358
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QoXPrKfDfl4H66KU8a/ajyqTNgN2tT2r+tDkUQbpXRvcIxMJPLGO+OahzuKMwNBzte9qz6Z331L+Ad1tb7NKwLzY+lsXIwXEqaDJZaxKuuiyw4o9wq8V8UmDFD15NLJkuSx8iU2lpsui7jU9apFn3Wi0Jn4SULs5KHa0omO7bpRa50ZZv9maly8MsHb8FxkprkX+p3xnTGga37nlTYNxez5wbOHdkbC8Tw1XeueFbpIWkfT1CxBuwa9sW+2GYH/gStboS4A8rkeuS7BcxksZckdzVsYXM2bSOWzS0198pxzyNUh6lv0pF1o9Qu+JpdsyNHr+pg90eJ+fcbQZglUWxU7KgX4H6U02e8/64lNt1UKxJnJehosfIcWtMzLBsAi/aAsF3Y22YwAfrnm5ROUsZ7vE5u9aXq9Gqtl+dK1Db2yM4WRKA7oUHxo+nKlriz7y30qI3khmjfYeUiHBMRqOXisIe+H9jv/Iwg92amu//c8A1lgCebbQKoQs/soVvXOuYrWePQIs4pdmGJHLgaQxysM143CYaCLkWqHYSwCWNjusJBM9PoWyktGGgimpysyG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(366004)(376002)(136003)(396003)(346002)(451199021)(2906002)(66476007)(66556008)(66946007)(316002)(4326008)(6862004)(66899021)(8676002)(5660300002)(8936002)(41300700001)(33716001)(86362001)(186003)(6512007)(9686003)(26005)(38100700002)(478600001)(6486002)(6666004)(83380400001)(6506007)(82960400001)(6636002)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m+FkHTI54GA4TwiOon37+siIL7iDJxDkCrtTtXUQRx6Tx/E+qPtE9Fsmv5R0?=
 =?us-ascii?Q?gcjevMkUZHo4CknIDvVkuz6UICHHosTfdHHBTkyP9i9X1ay0APXDlB7snjUO?=
 =?us-ascii?Q?54R1ZFvOj85YxErqF+pyiqh8OAV4/AX3zIhcaHS2VBNMf3/tmy+Pr9PHUaV7?=
 =?us-ascii?Q?6AXguvcqb91TtIwGaChEiXcYbkM3QVr87BzXbT2ouHEh5z/WXbhDwUud9W3j?=
 =?us-ascii?Q?Fa8LsmRScO7ablZm5N20DYdpyKYwlP2zh/SLjTUGE1xeikdQE8Toka3Ge8x6?=
 =?us-ascii?Q?OHFkQ6kNNHEZun6ngT93qGOtpmFIJhTwAN2GPY1+bM8QLGD9kOwaHfhHD+fk?=
 =?us-ascii?Q?boEXZ+xRRdH0n5sb+wZbw8APMI+dAayICjalhLJBkkSOjbunUzHbC0b9gvuA?=
 =?us-ascii?Q?g0v3hDuFp4LyjoTVY1ViRdd6cWV1JyA4WEXyClKlH+WQKWpI4V4+c2SyWVHF?=
 =?us-ascii?Q?++0SweRvbiXDIDwGEFvkCLFEhmjMRF1EvZAWmJEKtIR+Kv5si9FxTfDF/MAt?=
 =?us-ascii?Q?Iz/cFOfExZgE7VHNCJgj+IuahPV5Ga95X7FFz8IKvUnNtp2+ZHOgywXAqUju?=
 =?us-ascii?Q?XxLnecsW2EtgFmcO8nOcauerG9ViARYlK8QD4ebkRROzRxeKXp90FM7x/npo?=
 =?us-ascii?Q?/sM4ISRsZydEDkkAPnzfVegLZJxTDnFVfjXKHhPT3i8mM7reFZeKP5qFqtvh?=
 =?us-ascii?Q?73CDPqf/kGb0VM99HK3QtUJ9rvF0ZcGF1o1wLttfF8U1GFk+V0e3BL5qYLBL?=
 =?us-ascii?Q?sqtRV/xml9bZwp0JabK0IRIcnUtaV/AAKNdzW17PhJxeWNhkV/d+zvwt6ZLj?=
 =?us-ascii?Q?UfZLx8M4UnF+dka0489SZrp5dQ2Lg3c16sSkKBF08Ajp2QQ2JYDDGIC8scYy?=
 =?us-ascii?Q?Nzz73TQYD2iqPELVZqiJmJBruF2r7svLT0WK+O+u0T1XUh4MX4CucuvJMMoR?=
 =?us-ascii?Q?JSljV+m/Q/S3tubq2vt2nX1lThIZSs302D1QkKIJo/ZkiZqN0AXTqb4rudjG?=
 =?us-ascii?Q?IzWEJQUx5vIpoJJxZgYHFUf22g5WfjC6YttECyY5QhuuNvPy+jvcSUDAVwNZ?=
 =?us-ascii?Q?YmKMHrmJP3QnZfuuv6n6vAfdDF4ui4hDt/ogWamCPHBBDlHevXugwS+itx3z?=
 =?us-ascii?Q?M+5OejjQmHLYWjYnWf7S2Edwc1i40ZHODbYVZZeY1U7W+z9MpdDZNoHK6PqK?=
 =?us-ascii?Q?w8ao1hX00JgZf44h8la0bObUV4zRexw0sMBETyFe7lBL4sVYTl4Za8xMT2lL?=
 =?us-ascii?Q?s848CGLHj8wOOKWy5O5zz3W2DuGWx5YsZJL/YDhlJtFhQlosfpCL/FwzDhFd?=
 =?us-ascii?Q?EBKy8ti9Y+sDyUlMQ9mbG0REsoD/y0LAryvREUKESdvxCXkKigo862LQRpZ8?=
 =?us-ascii?Q?azOqAOzsFQp1VKECdjFShB+zCDuy6xI/72Muz7aR+cZzB/kQD4XJvrbdRpjy?=
 =?us-ascii?Q?+36KqNVc/iyrdlk3yu6qlOgSUaHBy3uY6GEgCrh5DBN3D9zK+yyaekWOfNci?=
 =?us-ascii?Q?bHmFJC/fpPWeH2JE76abD90z9j2GGeEYexg5OHz6TOJjaeEVGmzzNcj50to7?=
 =?us-ascii?Q?5JGOGY/iJxlRANV4hW2AaWAhd9gNTH7KCM5HBFsUscOryK4Rq97eruDsYPT3?=
 =?us-ascii?Q?Sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d728c704-acac-4801-3a8f-08db4505c358
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 20:52:05.9301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BTComOtkoszGVPA3EuuPsJ7/LqUP5us/iG/RIYXF5LvnQnII9dqvX6DXMvPwH9iq6o1tKrhhB/FBO55Uu8dx+8qHJtkW6riD9YSYtHom0pY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5084
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 13/17] drm/xe: Introduce xe_reg/xe_reg_mcr
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Apr 24, 2023 at 01:29:12PM -0700, Matt Roper wrote:
>On Fri, Apr 21, 2023 at 03:32:54PM -0700, Lucas De Marchi wrote:
>> Stop using i915 types for registers. Use our own types. Differently from
>> i915, this will keep under this will keep under the register definition
>> the knowledge for the different types of registers. For now, the "flags"
>
>This sentence got a bit garbled.

will fix

>
>> are mcr and masked, although only the former is being used.
>>
>> Additionally MCR registers have their own type. The only place that
>> should really look inside a xe_mcr_reg_t is that code dealing with the
>> steering and using other APIs when the register is MCR has been a source
>> of problem in the past.
>>
>> Most of the driver is agnostic to the register differences since they
>> either use the definition from the header or already call the correct
>> MCR_REG()/_MMIO() macros. By embeding the struct xe_reg inside the
>> struct it's also possible to guarantee the compiler will break if
>> using RANDOM_MCR_REG.reg is attempted, since now the u32 is inside the
>> inner struct.
>>
>> v2:
>>   - Deep a dedicated type for MCR registers to avoid misuse
>>     (Matt Roper, Jani)
>>   - Drop the typedef and just use a struct since it's not an opaque type
>>     (Jani)
>>   - Add more kernel-doc
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_reg_defs.h | 93 +++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_gt_mcr.c        | 36 +++++++----
>>  drivers/gpu/drm/xe/xe_gt_mcr.h        | 11 ++--
>>  drivers/gpu/drm/xe/xe_irq.c           |  2 +-
>>  drivers/gpu/drm/xe/xe_mmio.c          |  2 +-
>>  5 files changed, 125 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>> index b5c25e31b889..c0a091206f27 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>> @@ -8,4 +8,97 @@
>>
>>  #include "compat-i915-headers/i915_reg_defs.h"
>>
>> +/**
>> + * struct xe_reg - Register definition
>> + *
>> + * Register defintion to be used by the individual register. Although the same
>> + * definition is used for xe_reg and xe_reg_mcr, they use different internal
>> + * APIs for accesses.
>> + */
>> +struct xe_reg {
>> +	union {
>> +		struct {
>> +			/** @reg: address */
>> +			u32 reg:30;
>
>I wonder if we should just make this reg:22 for now?  All platforms
>supported today only have a 4MB MMIO area per tile, so 22 bits covers
>all valid reg offsets.  If someone typos an extra digit into a register
>definition, I think the compiler would help warn that they tried to
>define something outside the possible range.  It would also make it more
>clear exactly how many flag bits we have left here to work with for
>future expansion, assuming we want to stay within 32-bits total.
>
>If a future platform doubles the MMIO space for a tile, we can easily
>bump the number of bits up.  But I don't see any downside to just making
>it match the true register address space for now.

looks like a compelling reason indeed.  I will change it.


>
>Aside from that,
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

thanks
Lucas De Marchi
