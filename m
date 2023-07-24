Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95191C001B0
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jul 2023 15:19:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666F510E332;
	Mon, 24 Jul 2023 15:19:56 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E638610E332
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Jul 2023 15:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690211993; x=1721747993;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rpCc/FI+0FBr4NimPIZBv8gbpBXSASXXk6eLSKVgbJs=;
 b=HKUt40YeZuDCNmW9fs73ECbFMnbBv6GoGGJ7QwhI/WGpLQSEcI5eaN5e
 QWP1ai1iSEktt5b2SiwR02G0YEPxsT4btXSbn/FT8vUVhEn26piCyWJun
 wnaMfbfXqVCcvL2Tr/oYB5UMZtnWPuKBSTiqEwl8xsM36eE73GacHhBxj
 IMvO5gnJiOpJ1V5m5wmrnhIjCoFZqci2UAF/FhK4EXcl01Tr1y0qYU93Q
 UKPGdHvzOjztdfHrb7dct8QmWLOkJIs7uAYUgb3bCSsC2Pbiy6zpaxIyR
 uZLyIWwxIJn6FC0uWmYNKKi+KTvx+cQUkJyskxof1Djrseg0VomQ8jI25 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="357467605"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="357467605"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 08:19:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="719704008"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="719704008"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 24 Jul 2023 08:19:53 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 08:19:52 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 08:19:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 24 Jul 2023 08:19:52 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 24 Jul 2023 08:19:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q+RNrodmQ2bqJaRj1hGj7dK7fF9xaddj0uomjuzY/kzIL0m8UopsnLp16OaLV8IUcd4bkC+MLGEtSSbHJ8Ebfqc97yfgUlRrkYOFzkoYpJ5EKhnSKycpk9Pp8yknV9UxHHNzRWwHMkK88YGGrXSCLunNVZ4B2Y+V/U/SjVJxTiFnOutQEmuucWC2TVqjmmETPc0uKxfLym4EDzr99OpEZeNEGcr8oOh5uYpYo4bfIcBT/BPJkyGDFqvyvi96y5xB/gHTMJPLedeO61+XTSPgvJHoJJeqmMoTALuD1xhPcg2lvbfF8yGA4OEkdDxYXpijwhzta73S3Gxnem0xSSo8rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KSflFRRsiTSR8QcR8ZmnkpplhuUnufshs0uNPthE97o=;
 b=GG7sv4dn5g+Dx5nJEJQeWfaNd2GsgZEuicha5wtq0mDyCJyZTGmlZxbkJOilP1ZJL/9xKWRM71eMZzQwu8X722g1SUvIRNkcmd1h+LTcKl6GWX+6YNu+uQn/iTYodtWE5RAWtVu34NcGqChTr3TapJcGHPQwhr2lcRoCxja8VZx4vGfGVeKAAGAf+j2JsvB6X81CiA2sWa0FHzdgkmINmdAwX7sMPPbIsqhvFsRREX9MflEsIIcGU+LY1Imv9eU7cKq0pYJ2MH1OT41PMaCsfHHhc6sxFFz5WLG2oHUCoGdt1SIn9BWol0hAy3ziOOPs28T0LtnXjIM2Nd7UqG6qbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB6121.namprd11.prod.outlook.com (2603:10b6:208:3ef::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 15:19:50 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164%7]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 15:19:50 +0000
Date: Mon, 24 Jul 2023 12:19:44 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <tn7m6idgtutvs4azkvbbzqpb7arxmosqsbg7g7a577vbbzogoo@sdz3pswmjaf6>
References: <20230721175557.1513250-3-matthew.d.roper@intel.com>
 <t4z4llhy4g2kqz45utcucexv6hzh2gc6ktrndxjsgevi7fgmhz@e2euksrkr7i2>
 <20230724151618.GD138014@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230724151618.GD138014@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR04CA0029.namprd04.prod.outlook.com
 (2603:10b6:a03:40::42) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB6121:EE_
X-MS-Office365-Filtering-Correlation-Id: 16897ca1-6fa5-4911-c90b-08db8c596c2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /twVBDeUlLWk+G462xxundDwSuJFv6Fi6AZ9z3IEPIUoJFOqu7FW3HYHpk563zcbI91RV7s7PZ0PYETPk0WMIuLInwYoQqc9g2+p3k/jEGSyMhP/7ugHgFYY+ENeziQNoneyI3uH5cuCKqM2IRwXpL4jkbEWIeS5eKDlHh1KNgj2rNjjXAkWAzAxRda7W4RZGqkx7SxbKOXlN/yjfRV00N88dyWb6639jF/Ths6E95nNCM20Lysgl251024b/zrAjHtsS+bn50sg15nTHIHQVgEzJm26P4BkhStZixi64g4GsEoBsSl4UKaX16sS14X89kO0MY7Iakeq+l0lR0swsFf00rMDgmD8szFt/nimm5S5Ylk04UpBEAj9vHv1KPODfBRqcsE1XfhMdDD2K0E29CVq+QrF63U5dK1mGt4PTHH6TQrmy/oA8AfoJ2DghiAroqmQzrEkMDp8X0ZD9xNdtL09Q+52FvWEg5qTFxOEg4J4exlaPMI1++1Z8Ilb+O4Cn2aSZsDBipvrSj0AOSkzHSqMdemLxe1nx812MhfmgOWrgG7JIllcZqT3sSjmfHpl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(346002)(376002)(136003)(366004)(396003)(451199021)(6862004)(41300700001)(8936002)(8676002)(316002)(66556008)(66476007)(6636002)(66946007)(4326008)(2906002)(33716001)(478600001)(82960400001)(86362001)(5660300002)(6666004)(9686003)(6512007)(6486002)(38100700002)(83380400001)(26005)(186003)(6506007)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gxPc1yHsyGGCYOAynJX8TBL40YZI/guqNaLJucs1fwNJf2u7KYL0F7NPDetd?=
 =?us-ascii?Q?Nn/5UZE0G2211sx7B1C8stOxMkLCNmDzoZkevWri/cktgfh2a01f0i2t3RKc?=
 =?us-ascii?Q?e6b8BUO865xQ0xdLO2gpWPJBSqHc2X665urTxi+bSLyQxCuYHkTDoytYNREC?=
 =?us-ascii?Q?PruAFudY+sI20O70aC9tZsvVnKUzSSTtCOpknQiZdR9sX+VzDdVmfjr/oB+W?=
 =?us-ascii?Q?rwSxOKYBOSKJXc7OD+7wNnpQ9MdEc0VqhNQo7EyQyvFeCON2RckA14TJ6t4s?=
 =?us-ascii?Q?KkZ0UkuWN1YBzhA68FwEARPNOvritMqJKl+4TEyxEXtk09KCuPsFXB2kWlWa?=
 =?us-ascii?Q?AbruvoTbBY3bVESEEHtEa+li6nGbbXY+oEfhoAfJfCCXskcggpNLKFXVeFuK?=
 =?us-ascii?Q?8WYm3xHjRxxRDX/RV7aSX40S5XAH+M/wwT80JfF2vxslc+qbQczyxu2DzlX1?=
 =?us-ascii?Q?csjdZ7H4XtrL2kI9dWbV7+AQebARIwTnXTkgy6VQXP8b8hlsmLNwwlvYsNZ3?=
 =?us-ascii?Q?g/vAZW9yr//jeTfZ+8lJrnibHLZOjuwZ0Mglu7y7z28fAVPgtugkwZZ1VUBb?=
 =?us-ascii?Q?iFF1lYwAjVhORPzDH+Mg0bxSG9jda545DhLZkH6Uje8PrxFR02z2xgYRVZPo?=
 =?us-ascii?Q?LgpJbJExYPv6js1RjFlsrgGrZLbkuWr2orgLZGzVmQAO6D4Z0yz+tr3iLCtk?=
 =?us-ascii?Q?HWEtjxXo0DAqpgzC64ZVTHpzIRCEQDe73Rmt2qHlyOR2S7SU1xrV8afJ+zN1?=
 =?us-ascii?Q?t2AntnnYIgjlRv3gVA/S7HvZYodeXTZfI9ByzSFIkDP6OAGYAWMjIIrCNFZ5?=
 =?us-ascii?Q?YBO3PtTo0BuXj0dYKnW7HdELWqonS1JU5nhpkiIyp4SmLFqf2lmM/sG06rud?=
 =?us-ascii?Q?OE+95Rl+QPy7aYdcwzxHCloMmsDDudamJPDdSgNKrK3FjvjXETI/o5Np9pId?=
 =?us-ascii?Q?dpqeWeu6RbsF0STBpQ7iHuSbh3FvjHM2GYXUREVY/BXkmSLhKxzxJ1P524ih?=
 =?us-ascii?Q?aB7T/oL/S87krpZfBts7muQx4ksMSjKt3kLeKqfP9dTwzblfG8+jotJTJsLG?=
 =?us-ascii?Q?HUGb/E49DPY4zsFQjXj4D9zC6NDybVwbDtJAWRYF6ubqpt0FkGg4mo75bQbD?=
 =?us-ascii?Q?QkrY4OWflSHKd9K/QF9nN4KbFMpZ5Cexd05g/dGJmajc1OyC6hiMLYKFYcvb?=
 =?us-ascii?Q?cQCS03jx8AZecBnRXE/V6a0b5GvKqmfaOEupfjnLybKPriN53++kWs8DjH4q?=
 =?us-ascii?Q?ycDb1CFo5CP0pKZyDC1s3XBBQ3hbLLdzIKNaqZMlHVMtt1ocPcDeptgiq5Wq?=
 =?us-ascii?Q?ePftPmBR9HS7pOLxza/W2EZ1tbNbXhtkPTOwX3tcKs2EFGn0XKuTd2mDuOmN?=
 =?us-ascii?Q?xCfxaYpYMqb41HI7nYL3bJssKHSvLGrdm0K26KfFizqz7ekg5Il2pblv02sn?=
 =?us-ascii?Q?ZimbrLzQ7wL0vVIjnTuJM/qjvJ82/b+oj1lfIUWnMK3DL7RQZzz82GepDSFk?=
 =?us-ascii?Q?9+UXJLl3AOUMQ3JvHkJRduSeDPRbtjTj5+D7Ynq0KuMpSbk/P7tP9MD4JYFm?=
 =?us-ascii?Q?Tv7Vu7St7ieTq93lN1cPsCxyXI25Ml+glHOS1rURjqa9vyREEOezGUJ8P6AY?=
 =?us-ascii?Q?4w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16897ca1-6fa5-4911-c90b-08db8c596c2c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 15:19:50.1185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ye1p/1vZOHLUCKxOuTImnAAHzxOy5WtByxFD/VQ/2rLC+AsMaiUvtONzYfqy3D/t5rIkfO8JkcAwt245jlWl3aJkeOndi5OBqXj6I2gDu28=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6121
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe/mtl: Map PPGTT as CPU:WC
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
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jul 24, 2023 at 08:16:18AM -0700, Matt Roper wrote:
>On Fri, Jul 21, 2023 at 01:54:02PM -0700, Lucas De Marchi wrote:
>> On Fri, Jul 21, 2023 at 10:55:58AM -0700, Matt Roper wrote:
>> > On MTL and beyond, the GPU performs non-coherent accesses to the PPGTT
>> > page tables.  These page tables should be mapped as CPU:WC.
>> >
>> > Removes CAT errors triggered by xe_exec_basic@once-basic on MTL:
>> >
>> >   xe 0000:00:02.0: [drm:__xe_pt_bind_vma [xe]] Preparing bind, with range [1a0000...1a0fff) engine 0000000000000000.
>> >   xe 0000:00:02.0: [drm:xe_vm_dbg_print_entries [xe]] 1 entries to update
>> >   xe 0000:00:02.0: [drm:xe_vm_dbg_print_entries [xe]]  0: Update level 3 at (0 + 1) [0...8000000000) f:0
>> >   xe 0000:00:02.0: [drm] Engine memory cat error: guc_id=2
>> >   xe 0000:00:02.0: [drm] Engine memory cat error: guc_id=2
>> >   xe 0000:00:02.0: [drm] Timedout job: seqno=4294967169, guc_id=2, flags=0x4
>> >
>> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/xe_bo.c | 17 +++++++++++++----
>> > drivers/gpu/drm/xe/xe_bo.h |  1 +
>> > drivers/gpu/drm/xe/xe_pt.c |  3 ++-
>> > 3 files changed, 16 insertions(+), 5 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> > index 828a9fea420b..d04538e65f11 100644
>> > --- a/drivers/gpu/drm/xe/xe_bo.c
>> > +++ b/drivers/gpu/drm/xe/xe_bo.c
>> > @@ -301,6 +301,7 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
>> > 	struct xe_device *xe = xe_bo_device(bo);
>> > 	struct xe_ttm_tt *tt;
>> > 	unsigned long extra_pages;
>> > +	enum ttm_caching caching = ttm_cached;
>> > 	int err;
>> >
>> > 	tt = kzalloc(sizeof(*tt), GFP_KERNEL);
>> > @@ -314,10 +315,18 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
>> > 		extra_pages = DIV_ROUND_UP(xe_device_ccs_bytes(xe, bo->size),
>> > 					   PAGE_SIZE);
>> >
>> > -	/* TODO: Select caching mode */
>> > -	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags,
>> > -			  bo->flags & XE_BO_SCANOUT_BIT ? ttm_write_combined : ttm_cached,
>> > -			  extra_pages);
>> > +	/*
>> > +	 * Display scanout is always non-coherent with the CPU cache.
>> > +	 *
>> > +	 * For Xe_LPG and beyond, PPGTT PTE lookups are also non-coherent and
>> > +	 * require a CPU:WC mapping.
>> > +	 *
>> > +	 */
>> > +	if (bo->flags & XE_BO_SCANOUT_BIT ||
>> > +	    (xe->info.graphics_verx100 >= 1270 && bo->flags & XE_BO_PPGTT_BIT))
>> > +		caching = ttm_write_combined;
>> > +
>> > +	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching, extra_pages);
>> > 	if (err) {
>> > 		kfree(tt);
>> > 		return NULL;
>> > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>> > index 72c68facd481..fd103b64f446 100644
>> > --- a/drivers/gpu/drm/xe/xe_bo.h
>> > +++ b/drivers/gpu/drm/xe/xe_bo.h
>> > @@ -31,6 +31,7 @@
>> > #define XE_BO_DEFER_BACKING		BIT(9)
>> > #define XE_BO_SCANOUT_BIT		BIT(10)
>> > #define XE_BO_FIXED_PLACEMENT_BIT	BIT(11)
>> > +#define XE_BO_PPGTT_BIT			BIT(12)
>>
>> we have XE_BO_CREATE_GGTT_BIT. To make name consistent and close to a
>> similar flag, this should probably be
>>
>> #define XE_BO_CREATE_PPGTT_BIT		BIT(6)
>
>We actually *don't* want consistent naming here since these are
>completely different things.  GGTT_BIT indicates that the object is
>intended to be bound into the GGTT's address space, whereas PPGTT_BIT
>indicates that the object *is* the PPGTT.  Maybe I should rename this
>one to XE_BO_PAGETABLE_BIT or something to make them less similar.

that sounds better to me

Lucas De Marchi

>
>
>Matt
>
>>
>> While at it, let's remove the _BIT that is agains our naming
>> convention.
>>
>> Although here I think what we actually need is the XE_BO_NEEDS_CPU_ACCESS
>> from Matt Auld's  series. Cc'ing him.
>>
>> Lucas De Marchi
>>
>> > /* this one is trigger internally only */
>> > #define XE_BO_INTERNAL_TEST		BIT(30)
>> > #define XE_BO_INTERNAL_64K		BIT(31)
>> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>> > index a458224a88ca..fe91b10f951e 100644
>> > --- a/drivers/gpu/drm/xe/xe_pt.c
>> > +++ b/drivers/gpu/drm/xe/xe_pt.c
>> > @@ -221,7 +221,8 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
>> > 				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
>> > 				  XE_BO_CREATE_IGNORE_MIN_PAGE_SIZE_BIT |
>> > 				  XE_BO_CREATE_PINNED_BIT |
>> > -				  XE_BO_CREATE_NO_RESV_EVICT);
>> > +				  XE_BO_CREATE_NO_RESV_EVICT |
>> > +				  XE_BO_PPGTT_BIT);
>> > 	if (IS_ERR(bo)) {
>> > 		err = PTR_ERR(bo);
>> > 		goto err_kfree;
>> > --
>> > 2.41.0
>> >
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
