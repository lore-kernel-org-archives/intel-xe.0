Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F931C47422
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 07:29:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D461010E60A;
	Wed, 17 Jan 2024 07:29:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E75AC10E60A
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jan 2024 07:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705476574; x=1737012574;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ieXFjoQgKSmkn7wgTFYbi/KU4jDjQ8aTKIaoXbniSU8=;
 b=gXo/RvjIf9zjaYUvfSkRW6cVTseDk2i0l4Oj0JxeCRCLJiUw/j6fZwnT
 uXrMURZvrNwP1vPTcdJXEfV6Sqeg7hD60H1FEGsDezS/RLv3MqsxxFyYV
 6diTQ2f1x5psDR6WIFfTUADL4biy+2Wh6NrycujU9ynSpQbBMq9Aqlaek
 t+VST+x/f1dFH+vtfz+qnTPXgcNTz+AW9Ajd4CPDDSrdlS1IakE1AQszf
 tcj1LKvKshsLtU7TUSKUwuYkR4y/PUVkhum+ZQgo/9jLNhaxRXglP6YBJ
 zYrtG71GwS1xdRYJE4CKY1gbYS9/T/qiWrPh1i8AABh754Fm1fKeDPSEC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="390547111"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="390547111"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 23:29:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="32741928"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2024 23:29:32 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 23:29:31 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 23:29:30 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Jan 2024 23:29:30 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Jan 2024 23:29:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FAoO8aijWFbNkztly/RnyBIXmSsLOFk9MU4lVfdAgaRWFCu8BZefx9sQO1VgOXygNIg4TjsIIxbxjB/16dcovCOlugZ98KS6cKwsGYMOcGPMc0j8kVrElS7bod+tHllb8ioX7byfTMwqlv3Iz2WhCPW+SiR0CdxJa9BC35JiZzoatXEWIfMcULqbDA3ocRHKjfPRJMgcmYwg+16fwiw9mk//uM+QUTcW7W19ToHJEKkeD3+61OC4x6FO9UXm5pvAuH9yRyklt3FvhNEA6o+oIqxydXXACZAZLiUa0AZuyDkSKc4wWgfm8nOduDCOm3bOkqJJOcb6XvN+lrAiPnjWnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bW2E73tZO1C4Pr1KXROGXe1Mc42rgpNWdXvaQ4jQUlI=;
 b=dO5pz+zsXXmoUTfgjWUF1TruaadJ7wvvFAPYQpv1dtyJ6ux3YaY3tSsyPHLqLsOOtoTVtamsOvLkF1Rz/jkrKQPMvJcrYmw1Scc9No+aBm4dVfPvA9VTXczfC0plNY8ti0OniqfysMrwenY6G3MNvRtBzHUOUdHUKiFm2+bF6BvPHYK1Pu7Mif4TtL2PusRzVHrYOicKLoZk32cfMZnbcXbYdQwPS5kEbARKBciq0tONR+xvkPFKS5mgOfb7H93mN6GSrGwaItXoh1VT1aQcY2g/E5NiI8h2rp3NzZaS+XExIr2T/M+Ig0ryjbrSw89xZccGHVfDPIkbcfLD5w+PTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by PH7PR11MB8552.namprd11.prod.outlook.com (2603:10b6:510:2fe::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.30; Wed, 17 Jan
 2024 07:29:21 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::f6ca:b25e:ebc1:10fd]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::f6ca:b25e:ebc1:10fd%4]) with mapi id 15.20.7181.026; Wed, 17 Jan 2024
 07:29:21 +0000
Date: Tue, 16 Jan 2024 23:29:19 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
Subject: Re: [PATCH 1/3] drm/xe: Cleanup CCS mode related code
Message-ID: <ZaeBz9RPUkRRkpKf@nvishwa1-DESK>
References: <20231216214120.7394-1-niranjana.vishwanathapura@intel.com>
 <20231216214120.7394-2-niranjana.vishwanathapura@intel.com>
 <1eebe9dead86eac190f344cab6512e038c103d70.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1eebe9dead86eac190f344cab6512e038c103d70.camel@intel.com>
X-ClientProxiedBy: BY3PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::25) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|PH7PR11MB8552:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e7f4948-8067-49da-8037-08dc172e05ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VhbtPDihNWaDuIi9Mvw3QTiLBsc7dHYOS8BHUMyR2I+GMg3glZKsi9OyGkuDOfqfZuLOcRiK4UNXTtPEXWBfig87CHw/G75G5mER3T0HLJbDvu+eLxTdsDK3FrUDPdzc6Gtz8eI/rcno6N9IxSBl6lvknUlWAlGPLioTwjAF3D8WxUmJWd08725UdZHWgW35kIgl/qGEYRSkDBbsim4pHDS1hipOAiLe97YQp6qRueIsDq9snSOF4roFKavp8JseEo6JXPFrsO/NuPpl2TiPsf0GbGlZ/Xx0rHcmEd964NHTzy5fGWjhENHhkHQqCaDESmpva65XVkWbrCjZXmyU+X1f+lX5nq+uNd5sY5k5LxWeg6YWwggepcs1k1a6d1ytFc6JlgZyiIbJFa/O2xYN92Eg07ISguva6JXklOCt28GYp7Xg8V8+Gf/fCk/yDe8WNSDTvKAfqI0epVu6oPtdcIEvfuIBwUFh+gV8BFAnB0EvNyjqIxyimDrquQyxK9xAlFAhEgpyVPsc7G4Mhh57j4YHtsSppaYftk9EuAbQAsb6X4Uwlsxf6UrBNJONahnn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(366004)(136003)(346002)(396003)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(4001150100001)(5660300002)(2906002)(41300700001)(38100700002)(86362001)(33716001)(82960400001)(6636002)(66556008)(9686003)(54906003)(6512007)(478600001)(66476007)(66946007)(6486002)(6506007)(316002)(83380400001)(44832011)(8676002)(6862004)(4326008)(8936002)(26005)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?gKARMcWBF+374rnuS7pnRsZQ91/xOhn2AZ/XfeUzoi1W6aD6L32WXM/tx1?=
 =?iso-8859-1?Q?JydhxrpxP22u5Y83IsikD+SmJhRoJEb89Mix5+5H09PtWQB9K012YXsn1B?=
 =?iso-8859-1?Q?5uYPAHt2OpYpx3AAQq058lXoM9M5KhIHfsEPtGt6NSpSfapjM4s3dPI8GX?=
 =?iso-8859-1?Q?Gvj1DhxuZCmhOjkY0Gb60+AAcHNUTTyN/+BZ9Cvx5DL47wDh/Fp38/qf1K?=
 =?iso-8859-1?Q?T4xOvJutrlGFRsf+Qqq6aQU98yEiwWemS21YtgKaviUI/wwqs5+YY5eihk?=
 =?iso-8859-1?Q?5ZSscdnPbuoVs3M0vLVVioyDJEn/Pd09Tc0RGCSF861Qc46SqDAw9KdwEk?=
 =?iso-8859-1?Q?dahFOeeYm7mi8ujpfx2TP12JDhtqgvG93tX2v5jRDm1oypYFV3I1zMlt4B?=
 =?iso-8859-1?Q?wzM5Gf7AQcPfdT/rC7wzugv6lr18SYju8Vo603Yq7jAxh8eFtnvBeKfa3B?=
 =?iso-8859-1?Q?uE9+pbKqqEtPmSZaz3k6Cz9cVH4QErK/ZNRX3rwqBFWO+t17riAxG0BU01?=
 =?iso-8859-1?Q?wRCNnurQSZeuLm/jI+w39gQvvYE4PliaFI+auZM+6wAgPRa3CaN51Z0PTx?=
 =?iso-8859-1?Q?rOnCYV7cv0sXfZr8T5AcC24+l2eWdCAN9hkzVprgjNZ48a4w5UVLi2KQkp?=
 =?iso-8859-1?Q?vaNZDhF9xC1vTJy34BUnU0hi/7AedX99tvhYD/NVwutjt0Gu35kWMAOaT0?=
 =?iso-8859-1?Q?1yEBPxSRXX7KJaO9MS05b3vnroCniGo3sGRlVgB857ooEIAhHeXg72FDFN?=
 =?iso-8859-1?Q?E2irF4L+PvB7rDPj1AnHqadtjKyOF4MKU5Mtaf1U/7VO+Sbccycd2pcE5R?=
 =?iso-8859-1?Q?yhKnR9QVwuvjf0SQM26Qp32jjo6g1PH9XbJ1gYE1jEBUGyEbFq4hH0Oj9a?=
 =?iso-8859-1?Q?+yKibKS7vGCt4cfe31fPr+EAZrDeWlR7Hib0Ez3kjEOKvEtDctpwJZMXQk?=
 =?iso-8859-1?Q?4FguCS2l6yfqGVjVbft3kAGtlA7FJyuoWE/ESlE5WRla+C1mXO/pap7H1l?=
 =?iso-8859-1?Q?KWk9T3PKa/bh8AYTr3Zk6h5pyU2rzOVvl5IEGYjkx6sgECZ9pjAzZOKZX2?=
 =?iso-8859-1?Q?pLvuK6RuxPMezmG7WlbUFBenkdLvc7GZCObtF7yrncto58U6EBH9BO13Y+?=
 =?iso-8859-1?Q?/aGd2vS0/LvPgy7AdM7dDNpge8ip75CXqu8hWZddYBBjROR/XXsxxUdC8b?=
 =?iso-8859-1?Q?5+dgRRHPs3giR/tI+df4pwdqcGReWnmB7NxReNR1zMr7ZE7zWUtyBGKrL2?=
 =?iso-8859-1?Q?JLekNEjNJWWT+jVU7WAxGMSPR1FaZbeUyk/QXJZ4s2mtt2aeNrD35+etar?=
 =?iso-8859-1?Q?Ot+1Jk53+4ngjFPwIblFcVbQv7g4RcYUIVtHWeoRX9HWEnl5349pce93Zr?=
 =?iso-8859-1?Q?GeuBk5b2Zk1j6PvWKP5rAZayvG/ZW8uPG0HQN+XrVaIu+Aw+tvrhTZLMRq?=
 =?iso-8859-1?Q?ho9WEfLAJeJHOPL1sH8PbkA2ZE9sY98IDsziftPhLe+fq1ntzFHNcOhgeR?=
 =?iso-8859-1?Q?ENbVYUdX7xZnwnvd5GPkcffLV3RUHdB4vmmTvrr7bkgXGulOlp3bayTRt0?=
 =?iso-8859-1?Q?/ztPMbX1n4cDb1uNO4RhFNFGe8PATE2OZ5CkJqaohEgGBB4GIQJctmXDjc?=
 =?iso-8859-1?Q?O89g6lOdC8sD8m1cSfmfZ/vF9Hq6a0WnWq8JHOSdiYkcnVrSRythEI6dZS?=
 =?iso-8859-1?Q?JnbkQij0uRW3n+Nvc/I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e7f4948-8067-49da-8037-08dc172e05ce
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 07:29:21.4323 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4bUATD9fcTYgdPSN0lkEe/xGY8m60QGCNriZmyAefUBxv/xXK4pJdIjCTDdJjeSo/HZLQEmrCzQ7nKaHWeob5nQnyO4Yt5LhvlQnWEv346/BKjce5Bgvbu4H8RxoE1yR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8552
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 16, 2024 at 01:43:24PM -0800, Summers, Stuart wrote:
>On Sat, 2023-12-16 at 13:41 -0800, Niranjana Vishwanathapura wrote:
>> Refactor some of the CCS mode related code to make it compliant
>> with the coding guidelines.
>>
>> v2: Fix macro usage
>>
>> Signed-off-by: Niranjana Vishwanathapura
>> <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 12 +-------
>>  drivers/gpu/drm/xe/xe_gt.c           |  4 +--
>>  drivers/gpu/drm/xe/xe_gt.h           |  2 --
>>  drivers/gpu/drm/xe/xe_gt_ccs_mode.c  | 45 ++++++++++++++++++++------
>> --
>>  drivers/gpu/drm/xe/xe_gt_ccs_mode.h  | 12 ++------
>>  5 files changed, 37 insertions(+), 38 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 1dd361046b5dc..2d9c004838437 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -386,18 +386,8 @@
>>  #define   RCU_MODE_FIXED_SLICE_CCS_MODE                REG_BIT(1)
>>  #define   RCU_MODE_CCS_ENABLE                  REG_BIT(0)
>>  
>> -/*
>> - * Total of 4 cslices, where each cslice is in the form:
>> - *   [0-3]     CCS ID
>> - *   [4-6]     RSVD
>> - *   [7]       Disabled
>> - */
>>  #define CCS_MODE                               XE_REG(0x14804)
>> -#define   CCS_MODE_CSLICE_0_3_MASK             REG_GENMASK(11, 0) /*
>> 3 bits per cslice */
>> -#define   CCS_MODE_CSLICE_MASK                 0x7 /* CCS0-3 + rsvd
>> */
>> -#define  
>> CCS_MODE_CSLICE_WIDTH                        ilog2(CCS_MODE_CSLICE_MA
>> SK + 1)
>> -#define   CCS_MODE_CSLICE(cslice, ccs) \
>> -       ((ccs) << ((cslice) * CCS_MODE_CSLICE_WIDTH))
>> +#define   CCS_MODE_CSLICE_ASSIGNMENT           REG_GENMASK(2, 0)
>>  
>>  #define FORCEWAKE_ACK_GT                       XE_REG(0x130044)
>>  #define   FORCEWAKE_KERNEL                     BIT(0)
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 3af2adec12956..342f82f245f39 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -462,7 +462,7 @@ static int all_fw_domain_init(struct xe_gt *gt)
>>         /* Configure default CCS mode of 1 engine with all resources
>> */
>>         if (xe_gt_ccs_mode_enabled(gt)) {
>>                 gt->ccs_mode = 1;
>> -               xe_gt_apply_ccs_mode(gt);
>> +               xe_gt_ccs_mode_apply(gt);
>>         }
>>  
>>         if (IS_SRIOV_PF(gt_to_xe(gt)) && !xe_gt_is_media_type(gt))
>> @@ -584,7 +584,7 @@ static int do_gt_restart(struct xe_gt *gt)
>>         }
>>  
>>         /* Get CCS mode in sync between sw/hw */
>> -       xe_gt_apply_ccs_mode(gt);
>> +       xe_gt_ccs_mode_apply(gt);
>>  
>>         return 0;
>>  }
>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>> index f3c780bd266dd..11265e851a811 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.h
>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>> @@ -17,8 +17,6 @@
>>                 for_each_if(((hwe__) = (gt__)->hw_engines + (id__))
>> && \
>>                           xe_hw_engine_is_valid((hwe__)))
>>  
>> -#define CCS_MASK(gt) (((gt)->info.engine_mask &
>> XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)
>> -
>>  #ifdef CONFIG_FAULT_INJECTION
>>  extern struct fault_attr gt_reset_failure;
>>  static inline bool xe_fault_inject_gt_reset(void)
>> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>> b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>> index 529fc286cd06c..ee1065c44da7f 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>> @@ -12,17 +12,38 @@
>>  #include "xe_gt_sysfs.h"
>>  #include "xe_mmio.h"
>>  
>> -static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32
>> num_engines)
>> +#define
>> CCS_MODE_CSLICE_WIDTH          ilog2(CCS_MODE_CSLICE_ASSIGNMENT + 1)
>> +#define CCS_MODE_CSLICE(cslice, ccs)   \
>> +       ((ccs) << ((cslice) * CCS_MODE_CSLICE_WIDTH))
>> +
>> +#define CCS_MASK(gt) (((gt)->info.engine_mask &
>> XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)
>> +
>> +/* Get CCS mode mask to disable all compute slices */
>> +static u32 xe_gt_ccs_mode_disabled(struct xe_gt *gt)
>>  {
>> -       u32 mode = CCS_MODE_CSLICE_0_3_MASK; /* disable all by
>> default */
>> +       int i, num_slices = hweight32(gt->info.__engine_mask &
>> XE_HW_ENGINE_CCS_MASK);
>> +       u32 mode = 0;
>> +
>> +       for (i = 0; i < num_slices; i++)
>> +               mode |= CCS_MODE_CSLICE(i,
>> CCS_MODE_CSLICE_ASSIGNMENT);
>> +
>> +       return mode;
>> +}
>> +
>> +void xe_gt_ccs_mode_apply(struct xe_gt *gt)
>> +{
>> +       u32 mode = xe_gt_ccs_mode_disabled(gt); /* disable all by
>> default */
>
>This comment doesn't apply any more if there's a new calculation which
>can reduce from all right?

Yah, it just means, we start with a mask to disable all slices and
some slices will be switched to enabled in below calculation.

>
>>         int num_slices = hweight32(CCS_MASK(gt));
>>         struct xe_device *xe = gt_to_xe(gt);
>> +       u32 num_engines = gt->ccs_mode;
>>         int width, cslice = 0;
>>         u32 config = 0;
>>  
>> -       xe_assert(xe, xe_gt_ccs_mode_enabled(gt));
>> +       if (!num_engines)
>> +               return;
>>  
>> -       xe_assert(xe, num_engines && num_engines <= num_slices);
>> +       xe_assert(xe, xe_gt_ccs_mode_enabled(gt));
>> +       xe_assert(xe, num_engines <= num_slices);
>>         xe_assert(xe, !(num_slices % num_engines));
>>  
>>         /*
>> @@ -60,7 +81,7 @@ static void __xe_gt_apply_ccs_mode(struct xe_gt
>> *gt, u32 num_engines)
>>                         while ((CCS_MASK(gt) & BIT(cslice)) == 0)
>>                                 cslice++;
>>  
>> -                       mode &= ~CCS_MODE_CSLICE(cslice,
>> CCS_MODE_CSLICE_MASK);
>> +                       mode &= ~CCS_MODE_CSLICE(cslice,
>> CCS_MODE_CSLICE_ASSIGNMENT);
>>                         mode |= CCS_MODE_CSLICE(cslice, hwe-
>> >instance);
>>                         cslice++;
>>                 }
>> @@ -72,14 +93,6 @@ static void __xe_gt_apply_ccs_mode(struct xe_gt
>> *gt, u32 num_engines)
>>                    mode, config, num_engines, num_slices);
>>  }
>>  
>> -void xe_gt_apply_ccs_mode(struct xe_gt *gt)
>> -{
>> -       if (!gt->ccs_mode)
>> -               return;
>> -
>> -       __xe_gt_apply_ccs_mode(gt, gt->ccs_mode);
>> -}
>> -
>>  static ssize_t
>>  num_cslices_show(struct device *kdev,
>>                  struct device_attribute *attr, char *buf)
>> @@ -189,3 +202,9 @@ void xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt)
>>                          __func__, err);
>>         }
>>  }
>> +
>> +bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt)
>> +{
>> +       /* Check if there are more than one compute engines available
>
>/* Check if there is more than one compute engine available */
>

Ok,

Thanks,
Niranjana

>Thanks,
>Stuart
>
>> */
>> +       return hweight32(CCS_MASK(gt)) > 1;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>> b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>> index f39975aaaab0d..0dc191a59525c 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>> @@ -6,19 +6,11 @@
>>  #ifndef _XE_GT_CCS_MODE_H_
>>  #define _XE_GT_CCS_MODE_H_
>>  
>> -#include "xe_device_types.h"
>> -#include "xe_gt.h"
>>  #include "xe_gt_types.h"
>> -#include "xe_platform_types.h"
>>  
>> -void xe_gt_apply_ccs_mode(struct xe_gt *gt);
>> +void xe_gt_ccs_mode_apply(struct xe_gt *gt);
>>  void xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt);
>> -
>> -static inline bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt)
>> -{
>> -       /* Check if there are more than one compute engines available
>> */
>> -       return hweight32(CCS_MASK(gt)) > 1;
>> -}
>> +bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt);
>>  
>>  #endif
>>  
>
