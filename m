Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7A9C64EC4
	for <intel-xe@archiver.kernel.org>; Thu,  9 Mar 2023 01:05:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDCBE10E769;
	Thu,  9 Mar 2023 01:05:20 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E93C10E769
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Mar 2023 01:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678323919; x=1709859919;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DtNuB1zGZcXcbOHLZcHrVyHQSdGKTebQdsTY3jHzG2A=;
 b=lhE062Sw0CUOScdy3jo8iSyuhOvwvkMzhK9znPcnC2kUcU3hnJh3rTRw
 HWBfjaIVAig0q0tyscoyD/DsLAqPPln9kSwRtz5d/OGpieyVZ4Ja0SRMf
 D3DqoJMioTS9LZJQIQM+6o1u7b+bwQxtrquPz2py4Js9a5iFvJ/rkHkUL
 sjftNwGjA919KEAlTOH3hYiVJujbreoXSoOMXsiMez8Y+Z5XcvetdpdRB
 M7QY3LNin563A21QC3S//XXfeiz7PL3p4Bm4Odgn0b8ddsbICuvm8GQ5D
 tmPYwvrQbCH3jaZ+kF3SluWuZD1XJ4z4sTgOP+kfvXzj57uvvlRy8G3/K Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="337846458"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="337846458"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 17:05:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="670549124"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="670549124"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP; 08 Mar 2023 17:05:17 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 17:05:17 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 17:05:16 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 17:05:16 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 17:05:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ifE+uXF1hxQgk4/+uX2ty3ThpLWMv9SJM57/x/qzIL+VTyLh8rd7w1bkQkIbTRcBvD0IyUFfUJbGlqDswZI97k6HoU0aCxb3PtLuyPecbODm979Vwetk8y8SLQJhy0mdITm+tqVXK5CHGbnkilkj9U1H+fFTtqubvaKMbLXJ7L+j5EAuQZdl2yOsug2+yPOvnLKq78VLHxvnh6dF5UlrMTKY8S5KQGFZPSHhoVJJRfE09sJCo+5n5cH6JS4n+7LV5Re7tlR5vAyr21oVYJyJOAjD7jJOoJ4S1G0HrPjHSwzADrQzjQsmyvOHqRBy3OuCuBZCtIYuTZYu72SlLPe2bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dolh8vDXkTo9r3QNeizU4aiq0u+P6emrLhkRnQCSFuM=;
 b=C9ybI6wyP7kNThYKp2/E/TOZfgjyXx98foy0UDQrnPpknQjDcOPMf/BTiQQIup6tMj0xA5ybpF3hCxzZv1ByoAXME6SJvP+raqLZOhLXKSQk13IV7svxBz+RAQvqVfy5pJV7HdzQiI5n6ma/Jc1zpWjPawX3qQRIHX+dbwwmM/8T9HWj+fxG1/uO9cZwoYFYWYDvoDowSqHkS+qLKQnwpOHpzY6S4mnfGNyA1irTYzLA4B+ZFSXtUB7AqPrm5uRop8ST6TBaI/3EjdAwNwPawE45Zep3dkF30hSbfNpD6Raw2ZnDD6Fxcp0vMJGgYMy4X591UQbRU49p04o1VKundw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN0PR11MB6301.namprd11.prod.outlook.com (2603:10b6:208:3c3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.23; Thu, 9 Mar
 2023 01:05:09 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%4]) with mapi id 15.20.6178.017; Thu, 9 Mar 2023
 01:05:09 +0000
Date: Wed, 8 Mar 2023 17:05:05 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230309010505.thipav5y4oilfdy2@ldmartin-desk2.lan>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
 <20230307092446.1263266-15-lucas.demarchi@intel.com>
 <20230308231115.GK1543793@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230308231115.GK1543793@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR06CA0066.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::43) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN0PR11MB6301:EE_
X-MS-Office365-Filtering-Correlation-Id: d0a4d9c0-51ba-4d97-8711-08db203a53ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DjadoDd8uLmMK83KEEg5dom16vdDPN7DPecRp98Jm96rs+D9Sx3rmdv/IlMzq810j7HneefxqDntJmaqp2tgf0I0ROIlx/6mCnLMlJGWE4ST61M4QnQSmXcK428D30x+qS4st9VKXvTgtOyAkC+vic3kB/1/f66Ljh2Cx6pvBA5paSFEaaXpW+62juXbmspKhfftax2pfa4/mj8ueiBZ638v0OSEnhQXyi4kAOB959i69BONssYDrVgL6CtHgC6cy51r9I4KBqXu/BmXYl5a1hxc/7IQgRwvediDWaLzuy615pIALaeHZK0KcShSSbZeMHghV6+sD7O9hhamXw0zXKkeZ8tlKeUfxBrC814e+cy7ps3IvluHkgXjBqY9CtxFQPOvyt0lNlvfJsXraAXSelzMz5gmcXX00vg4XfwVmrqbthk1aIgnuLZqFmybv61wzw0smLlVEADx3Dz7se1E7gHtMegVi60GrEX6uZg91rMBZcDwqGL8TgJHyMBLwzoLjyMrEAL7wov6cOkq1axvHHrldYx4WWHhCbfCoX3O60tTRBv+b/XgycvtlYXWE3uQqXIV1nu0JAXVrub+GCBl8OEBNHXmQb+SUHaHagIrrK2UUsIFY3m8ic7cCunWt0WcBbN0yi2y689MBS88ZsKWRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(346002)(136003)(396003)(376002)(366004)(451199018)(36756003)(6666004)(83380400001)(478600001)(9686003)(186003)(2906002)(8676002)(1076003)(6506007)(316002)(26005)(6512007)(6486002)(8936002)(6862004)(66556008)(66476007)(4326008)(66946007)(86362001)(41300700001)(5660300002)(82960400001)(38100700002)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8SLLn1kRGpTe0W7+expfweQmwZihnBl5bnwRTeLLIDoHG84VAD82k1T1qmbK?=
 =?us-ascii?Q?tStFe/SPT8MiavppsBv0SZHpWXsrbqPpqBGm6ysS1jrCXYy//fh9qu1hWU/R?=
 =?us-ascii?Q?U2pXXTpBT/jDBC6Esm6P18G6bTW0iRIGWaaH8NJR+MAN1UVePe/wUD8au1bz?=
 =?us-ascii?Q?VzehCT9F3wBmWRCkpW9MvbetnMAFBJNgJM7KHecDkDGFo288NUNiJpczfIAZ?=
 =?us-ascii?Q?P1fHcs5h2H6wJ0KR8IUpx1+xT3uEtNXfx5ORU1H6ZE7x1iHkvdqjoTaD0Lvv?=
 =?us-ascii?Q?tcXzsHsnb2JPlxEeGFd8+GOpKZvJe/krz7TFM1OErp27kAUr8pnLaVhP0Dmu?=
 =?us-ascii?Q?s6N2WPYz3sInquJAoBY/cLrqCoOMuTisgdnGrpcK01BJurmpuw+2iwmLAw05?=
 =?us-ascii?Q?DB1cKRJMG0IBUAc/oHPXdqtQODRTrttojfLOl4vB03CBdBdPf81V0t+b9oRq?=
 =?us-ascii?Q?pYfKJ8RGGnKahkB6Zzdllu+Q3ZEvr+y2IWLwQ+BJLHywVnKpQJMTrcVFQNjy?=
 =?us-ascii?Q?TSdGmR9gkL7whzG6sUv2B7y1qS470RDbTcCSBH6aMQ4USJQYLiCVhZcL/7Hx?=
 =?us-ascii?Q?MdPefoyE2tajfZYQbCySmjirm0FejHqT2Vvjt6PzUlfelHcEhv7UoWE+F/W7?=
 =?us-ascii?Q?neElKgGxrRevSK4kVZ8ShQFBzd+X0LskbHC7khe2kEpM58E5GefXntSca2yQ?=
 =?us-ascii?Q?ao5qrtOcHcftcFpXmUwKRuEScYaaVcqVXy8fdSiNia4uBm59gk4O9HWehS+0?=
 =?us-ascii?Q?NZSWdYxvSpoh6ZHHcTWJoes9JnsIg+FwBqSY+B0YC0+cSgTVYVvUXqBZhWPT?=
 =?us-ascii?Q?rIYLHZFZcWicGC54jl+aYJgXu3PQQxhxCaqgjDt1Oaft0Yojr1cv4lH8aQoE?=
 =?us-ascii?Q?5DiztS8zQXE97H+AtpE/EHOmhGyy/cUAjsFjFa9TKWuY7TwouTVvnL+jlPoM?=
 =?us-ascii?Q?ryRP4pdi60B14IkkzFYdxylK7yrd6kumqP6lHcq6bPDmTYA+TvHN2ZYSCOZA?=
 =?us-ascii?Q?FHrwiYGIpMX84bD/ohkLt0EfL2+CMbtJxUI7QeTbmyuP3a2lLbenmOGPtRbh?=
 =?us-ascii?Q?HFURQF16vUdzCBuvPFp8Q5u8t/o9AetReMHR44giZ+Pc4sKVNNDdR3Lf6F+R?=
 =?us-ascii?Q?4zfkMk8BC6YAkJsce9b9UP/ofwRb25FFePx6wIVuwrzMnt015yIvQpsROt/l?=
 =?us-ascii?Q?AlrbLWq5dzkgPazBNpiVYxwRWiUW5HXhUeP7XH1UwdWh6dswVjqSlFZ8nbVn?=
 =?us-ascii?Q?fimA27WyuSxHR2Q7qlD/B+V6azoBe3XB82Pdkc7CMgS5C+mGZ3c/ThxpFPe7?=
 =?us-ascii?Q?rqAy3Um0v6Sv/SgAA5lmsTUbPJL816jPt5en2YEw7F7uGhScF8Po/UrW4Koe?=
 =?us-ascii?Q?5I6zHo+MsCpeBuWIPUc5VctiWyeus1GQMe+nS9KxXDBSf5AS4HvpAJeNm5aR?=
 =?us-ascii?Q?Sh9xJEPOPlTq0LeTAji9i2MaAAkVTFN5dGgP1CkQK8AelBPkP3ZND8DL+BMp?=
 =?us-ascii?Q?Xz3CpIH3NzvhZS8jD8a8nPGjHwQsi4h5VwL6AAPCSEJ9Wo3qPL+8e5Sdu49F?=
 =?us-ascii?Q?KyXz3x+6kjB23ADVL+oYNbtYEFG76oPSmNtbTEkZMZbuIionxNsjZAI6oQND?=
 =?us-ascii?Q?dA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d0a4d9c0-51ba-4d97-8711-08db203a53ac
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 01:05:08.8953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ybAZy8tdA/gK0bQs9nYBEg82yZpEQeu+jvYYfGAWURQuOWBrPMFLAVuIsRaRGy3QYjgywJO0eYFxUbrRnLhJFVbiCiso5CbZVUg6J0gxLsY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6301
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 14/19] drm/xe: Add PVC gt workarounds
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

On Wed, Mar 08, 2023 at 03:11:15PM -0800, Matt Roper wrote:
>On Tue, Mar 07, 2023 at 01:24:41AM -0800, Lucas De Marchi wrote:
>> Synchronize with i915 the PVC gt workarounds as of committ
>> commit 4d14d7717f19 ("drm/i915/selftest: Fix ktime_get() and h/w
>> access order").
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  9 +++++++++
>>  drivers/gpu/drm/xe/xe_wa.c           | 18 ++++++++++++++++++
>>  2 files changed, 27 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 70457c0ff4a6..1b39a209898b 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -216,6 +216,15 @@
>>  #define FORCEWAKE_MEDIA_VDBOX_GEN11(n)		_MMIO(0xa540 + (n) * 4)
>>  #define FORCEWAKE_MEDIA_VEBOX_GEN11(n)		_MMIO(0xa560 + (n) * 4)
>>
>> +#define XEHPC_LNCFMISCCFGREG0			MCR_REG(0xb01c)
>> +#define   XEHPC_OVRLSCCC			REG_BIT(0)
>> +
>> +#define RENDER_MOD_CTRL				MCR_REG(0xcf2c)
>> +#define COMP_MOD_CTRL				MCR_REG(0xcf30)
>> +#define XEHP_VDBX_MOD_CTRL			MCR_REG(0xcf34)
>> +#define XEHP_VEBX_MOD_CTRL			MCR_REG(0xcf38)
>> +#define   FORCE_MISS_FTLB			REG_BIT(3)
>> +
>>  #define GEN10_SAMPLER_MODE			MCR_REG(0xe18c)
>>  #define   ENABLE_SMALLPL			REG_BIT(15)
>>  #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
>> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>> index 155cabe16e2e..6498f187591d 100644
>> --- a/drivers/gpu/drm/xe/xe_wa.c
>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>> @@ -180,6 +180,24 @@ static const struct xe_rtp_entry gt_was[] = {
>>  	  XE_RTP_RULES(PLATFORM(DG2)),
>>  	  XE_RTP_ACTIONS(CLR(GEN7_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE))
>>  	},
>> +
>> +	/* PVC */
>> +
>> +	{ XE_RTP_NAME("14015795083"),
>> +	  XE_RTP_RULES(PLATFORM(PVC)),
>> +	  XE_RTP_ACTIONS(CLR(GEN7_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE))
>> +	},
>> +	{ XE_RTP_NAME("18018781329"),
>> +	  XE_RTP_RULES(PLATFORM(PVC)),
>> +	  XE_RTP_ACTIONS(SET(RENDER_MOD_CTRL, FORCE_MISS_FTLB),
>> +			 SET(COMP_MOD_CTRL, FORCE_MISS_FTLB),
>> +			 SET(XEHP_VDBX_MOD_CTRL, FORCE_MISS_FTLB),
>> +			 SET(XEHP_VEBX_MOD_CTRL, FORCE_MISS_FTLB))
>> +	},
>> +	{ XE_RTP_NAME("16016694945"),
>> +	  XE_RTP_RULES(PLATFORM(PVC)),
>> +	  XE_RTP_ACTIONS(SET(XEHPC_LNCFMISCCFGREG0, XEHPC_OVRLSCCC))
>
>I think we need XE_RTP_ACTION_FLAG(MASKED_REG) on this one.

yeah, missed the flag in this one.

thanks
Lucas De Marchi

>
>
>Matt
>
>> +	},
>>  	{}
>>  };
>>
>> --
>> 2.39.0
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
