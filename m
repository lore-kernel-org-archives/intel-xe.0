Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F45EE7F157
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 03:30:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B18F10E45F;
	Wed, 27 Sep 2023 03:30:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C49C10E193
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 03:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695785446; x=1727321446;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2R3C4hAvhR6UBSE9otLKWUB3KWgbmo3s7b5rOKiWwac=;
 b=bO+hwKEip9WOQv7Eu1Mgum4svpSuCSBt1eICz9keDfiIwJ/Kh0d4ZBbP
 ExuxvijEShlMdhxSgb2CdS1nF+sPNAq6vklXHWov+hTxDQQDoqltLX7BC
 p5sKGqL8FcuiBotFGZYBHwh3iiGYJK8pWVYmSag6tJZXRIFn0mQ36QKIZ
 pd1mPEPE0cmcEfbdvHad0zHDFHFfrTgH8DKfN3294NH5tmQQ3ZvtR9vgN
 VbCPAFPC3qGgVw154UKr51hWbWtJ1OmsyYoK/SR9CkZekmVBZ9TGmawTG
 0T5qPSYhPySgjchNCSxYY5RDIv4rjhoRYmMi6uTLutE+yON/gOq8FuhBv w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="385575231"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="385575231"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 20:30:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="742567672"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="742567672"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 20:30:45 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 20:30:45 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 20:30:45 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 20:30:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MACAbs2FoK1YBF66tJYmDywgnpGw/WhIhfkuUHSGaUGtJOrF1dSCKzp0mDw4LrdDuFeuTGjXSayHbtJ5QCelUMNV/1vvSvOlivs+RwJFCWSUJCpxKi/KeWUrGMKBGcLVC5bvalJ45IScE5Ut/DLN6AstLSbWB4jJBXLhydzUIEfL3kLWARRnsE8SEzxVhFqebZ2ZTV/82GYV4IePg76wBWn1rEtqBJVNLiWOCtUgWik39gtdoBY2EKEp1ckrrmhqaMFY/cSUts1zABaYBqfUk0kdvJm5Db8uQOXHWw8IuVbLws2ilE18dQrkADQgQ4qNDQFcbbrrE2SpgDnRADzEmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EYosMAKH7/I3asgLPOD0ZdlhjQ4GqHzk9abFP8Tt18M=;
 b=Mx3kg1U9hKlrO3iRJ0RtH9lQi7rK3Q9yvb+ypZm24te7LhAm1j+SbfgsfwDIdWTPjvIKG4lTMda81cAn1qUOWDn+xBEstBG315BWXmgsy/MaZZJP9TI6xfwm0n6wUjmqK7Nmdr8tRGJI5bpfC7wo1zXJ1SjgkL954LSvNQKxMYM1NsjTO/ip7SZO3JewULHyKfOgR8IzNIK/qwIkQnyVjGvPKWR5eghfBy2LmYxznykV8nD5vgEwZD0o2hSgLCLeoDJu+2xfLq8ZicQiFbAvHgD7BAbDA1CCYnCLMEfgiwYnLjnBP45hsEGekKYni1t175aDNWayarDkymJhHqGb9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by LV8PR11MB8558.namprd11.prod.outlook.com (2603:10b6:408:1ed::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 03:30:37 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::cf65:94e6:cdd3:cfe]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::cf65:94e6:cdd3:cfe%7]) with mapi id 15.20.6813.018; Wed, 27 Sep 2023
 03:30:37 +0000
Date: Tue, 26 Sep 2023 22:30:34 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <exgalkfrqi6c2chfh5pymcoehbp2ml4oqv7w5idcv2bhpkhh37@s74ydg3cpdmp>
References: <20230926223631.2807873-1-lucas.demarchi@intel.com>
 <20230926223631.2807873-6-lucas.demarchi@intel.com>
 <20230926231747.GV2706891@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230926231747.GV2706891@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR01CA0056.prod.exchangelabs.com (2603:10b6:a03:94::33)
 To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|LV8PR11MB8558:EE_
X-MS-Office365-Filtering-Correlation-Id: 48bc6743-1405-40ee-89dc-08dbbf0a1de2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2/aQCMI0AB09jDKEigPHeHg7Ys5LCshrMbK6TtJ/Fuqfo050Huu4iZsHke0TSl9vZzzLzvvpjBXY30/0JmuePPad/7pNMEON1P/So0kgd7PAoeoK2aRdNXo/BX3/iHjVnN0+0iPKZit/ektA8B7R1EhAbeYDNvFgRJPZx32H4AwRlVcnv/thhUugSiCl6OChN/ZTwsg/lix2hh3YmTS7tyOpBjcLS6jNderz5Zl7L1n2RgdF4cMiaEY1zNxGILRKOFPp8OGnMLXLDpkO0iMqNj1xZVILdvfI/k8K0a9YgaT+gaz3Y5fau0HfR96fkKc/Jjv9CxUKevC66wjY5x6Kh+rbP/biWVzOI3TBTHZb5gxN8dh6U0jpEdGqlgwVXjASvCmvA3cgd/qP4Wt/MVH24+0UbYXCVhyvyYAimBM4nvfavB7Rp55rDr5V+5RfP/rMqo5igdlmCD8VF9YLnXQpoiynM20+bWXqYkHhnKZs8Nq2PHkAPkEiYDJW+gsr6gzdx+Ryr0HwSvB61Vrcp1KNWQSzpSfuHcrGQ6/eYSB62a0yWVdFAKhc4WIw0rumEuVy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(376002)(39860400002)(396003)(366004)(136003)(230922051799003)(1800799009)(186009)(451199024)(6666004)(478600001)(26005)(6486002)(107886003)(83380400001)(86362001)(82960400001)(33716001)(38100700002)(5660300002)(6506007)(6512007)(9686003)(6636002)(2906002)(66556008)(54906003)(66476007)(316002)(66946007)(41300700001)(4326008)(8676002)(6862004)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4QvgsO2SMPvH5AEzFP5d9sndko3IE3ZcGBlxdysxd0mVpuKJnqy37Hnd1UWl?=
 =?us-ascii?Q?fWIBkfhGsHkjgGp1YWgbgRlME0zn4OTrSScjt7oLV7Gr/verP5vFGVDWasUU?=
 =?us-ascii?Q?5fQ28Gp7G0IRl1BVQuyplDU4XE+8N4itTbEXkmDW2KQkBbeR4QHDmZVnuB9u?=
 =?us-ascii?Q?X7TLod4ILZ8uqEQdntXsCuEZJRXMzYTixSixMTtqkInXpXQruT0LNk0ifjCt?=
 =?us-ascii?Q?KX+3c3ueIoulfNS48WarXaQPgsB//OSWtX1jsUWwVB64K49rCPDpnKC+AEoe?=
 =?us-ascii?Q?wzVOvZVdPFoK3nfCuyceRuTZgqPtQw1oRFQCKS23QS5mkYHzOmi9avwpmG00?=
 =?us-ascii?Q?Rhn4cNPWAgg42vbKkfrWaMt5Wd7rDxHM40TEEeLUnVmhghDPwFlW4leCRZES?=
 =?us-ascii?Q?we2s4Buzu1T0QBnPfieX73pGLsZEUgTXl6E54cRFqewVDfmW6GZbyzuOFunh?=
 =?us-ascii?Q?cKH71J9OQiqUngcCuL2qVQeYxu3GZZIWt4xR07YFQwa+80Fw6AWERZS/B5om?=
 =?us-ascii?Q?M8b6p6AISZtWHBXSq+VNKElQ7u3Oi/X1Dag2z46rGVBvhCSbQPZbQ5GeqCJn?=
 =?us-ascii?Q?YquUKcBerhhlBHsQnxg6amyoFNr8B8zWUzJ9/MN41x47N0PDm/b1BZB9Owyo?=
 =?us-ascii?Q?HxAkaW7bpjTOuNsBMsWPn/fnpHG1t4bXQV5ugpi8MT9pINREwIKOzwZfWeKJ?=
 =?us-ascii?Q?Rs691VBfICuhSO7QDIWBEmDxo8YW8EvN2ohSm7El1luwiyv/wryzL6GHIcwS?=
 =?us-ascii?Q?QdKa6/LrsxztV7uKC0/IVVBSZzqbsrqPPjECOME80Smfv4jsz9qYs/25fo/8?=
 =?us-ascii?Q?+o8z30Z9I1233p7TWThTcKK+nR9Qd05GRPyFxoch8+Ph827jqNwTCq6H81v+?=
 =?us-ascii?Q?UR3AzQ9Vm+I3ohPIJZvdJm+5dYEFMigteOrGoI8FrQgT4j/VzBtp5nejnhae?=
 =?us-ascii?Q?EbZipfmsZTEOLQOOn9UhR+QNAb2BkoB5r8tmo0h6omYbOgUOYT2YeVQimEbh?=
 =?us-ascii?Q?YUBeErnrV32HyqIdxwQkpN+Xyy914flY07IizvjFiRK7a7sBTd9coNZOu6mP?=
 =?us-ascii?Q?5fb+yeGCwXeInf5PWPH4+lluLlgzHyHaqI7qtldifxtWUZB5siEa/XLQFqKQ?=
 =?us-ascii?Q?e85v/aSqzZZYXbmHJvHkFk60BBCmkHV2G+7/ynbzNUDelJRK8GX4PkRC85cD?=
 =?us-ascii?Q?swuULdVnEyJdDZNY4l8t9QFnlxkV03CZTgMI+OsGWVhA5c7Po0ycNC3/uc58?=
 =?us-ascii?Q?SGTgDPuxJK6wOdEi+mb4c79rMJrBrG8GBHJ8+4UAfa0R51q746Pe5AVJGWKt?=
 =?us-ascii?Q?wyluKsOjR8hVkFbS54++G73w140UM9rf7NkYuvT/m1cdaj44Dv578SWKqFXD?=
 =?us-ascii?Q?lj1F1zX++yLykDBVqEGLLOimEjn8G8GtQ72Mjih7qTu3bKfAmFmmc5gdsq/b?=
 =?us-ascii?Q?T1H1SsWVFhO2SccKl6rVTisVqf5LPILtRNwehZGL3Msl0MI1X4i8SFL/hDaZ?=
 =?us-ascii?Q?WteLxvyHH63KwsUsru65UmOQmrgPAv/FGNj7ndxceAnabmy2D7/nSd4JT5at?=
 =?us-ascii?Q?Aq5nPRq6JRJn88bh03UBDwhUjqWv2Q9V0RHcgc7w8n76J5LHmO/FYk6ePded?=
 =?us-ascii?Q?Ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48bc6743-1405-40ee-89dc-08dbbf0a1de2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 03:30:37.7959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OVK1wH5InZ3Y/NrYkfi8fF9klbaSE1GuJdztPWF3deMWWSz8BREK4IceZSR8mQXCImEgIU5XJlciG5ZPDrSUpnduD4S3Vh8/BPJyY4R3t4Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8558
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 05/11] drm/xe: Use vfunc to initialize PAT
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

On Tue, Sep 26, 2023 at 04:17:47PM -0700, Matt Roper wrote:
>On Tue, Sep 26, 2023 at 03:36:25PM -0700, Lucas De Marchi wrote:
>> Split the PAT initialization between SW-only and HW. The _early() only
>> sets up the ops and data structure that are used later to program the
>> tables. This allows the PAT to be easily extended to other platforms.
>>
>> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device.c       |  3 ++
>>  drivers/gpu/drm/xe/xe_device_types.h | 13 ++++++
>>  drivers/gpu/drm/xe/xe_pat.c          | 59 +++++++++++++++++++++-------
>>  drivers/gpu/drm/xe/xe_pat.h          | 11 ++++++
>>  4 files changed, 72 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 687dc3d79a66..046b7a087451 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -26,6 +26,7 @@
>>  #include "xe_irq.h"
>>  #include "xe_mmio.h"
>>  #include "xe_module.h"
>> +#include "xe_pat.h"
>>  #include "xe_pcode.h"
>>  #include "xe_pm.h"
>>  #include "xe_query.h"
>> @@ -276,6 +277,8 @@ int xe_device_probe(struct xe_device *xe)
>>  	int err;
>>  	u8 id;
>>
>> +	xe_pat_init_early(xe);
>> +
>>  	xe->info.mem_region_mask = 1;
>>  	err = xe_display_init_nommio(xe);
>>  	if (err)
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 32ab0fea04ee..98835ee058f5 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -25,6 +25,7 @@
>>  #endif
>>
>>  struct xe_ggtt;
>> +struct xe_pat_ops;
>>
>>  #define XE_BO_INVALID_OFFSET	LONG_MAX
>>
>> @@ -331,6 +332,18 @@ struct xe_device {
>>  		atomic_t ref;
>>  	} mem_access;
>>
>> +	/**
>> +	 * @pat: Encapsulate PAT related stuff
>> +	 */
>> +	struct {
>> +		/** Internal operations to abstract platforms */
>> +		const struct xe_pat_ops *ops;
>> +		/** PAT table to program in the HW */
>> +		const u32 *table;
>> +		/** Number of PAT entries */
>> +		int n_entries;
>> +	} pat;
>> +
>>  	/** @d3cold: Encapsulate d3cold related stuff */
>>  	struct {
>>  		/** capable: Indicates if root port is d3cold capable */
>> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
>> index 71e0e047fff3..86386633e206 100644
>> --- a/drivers/gpu/drm/xe/xe_pat.c
>> +++ b/drivers/gpu/drm/xe/xe_pat.c
>> @@ -32,6 +32,11 @@
>>  #define TGL_PAT_WC				REG_FIELD_PREP(TGL_MEM_TYPE_MASK, 1)
>>  #define TGL_PAT_UC				REG_FIELD_PREP(TGL_MEM_TYPE_MASK, 0)
>>
>> +struct xe_pat_ops {
>> +	void (*program_graphics)(struct xe_gt *gt, const u32 table[], int n_entries);
>> +	void (*program_media)(struct xe_gt *gt, const u32 table[], int n_entries);
>> +};
>> +
>>  static const u32 tgl_pat_table[] = {
>>  	[0] = TGL_PAT_WB,
>>  	[1] = TGL_PAT_WC,
>> @@ -80,24 +85,37 @@ static void program_pat_mcr(struct xe_gt *gt, const u32 table[], int n_entries)
>>  	}
>>  }
>>
>> -void xe_pat_init(struct xe_gt *gt)
>> -{
>> -	struct xe_device *xe = gt_to_xe(gt);
>> +static const struct xe_pat_ops tgl_pat_ops = {
>> +	.program_graphics = program_pat,
>> +};
>> +
>> +static const struct xe_pat_ops pvc_pat_ops = {
>> +	.program_graphics = program_pat_mcr,
>> +};
>> +
>> +/*
>> + * SAMedia register offsets are adjusted by the write methods and they target
>> + * registers that are not MCR, while for normal GT they are MCR
>> + */
>> +static const struct xe_pat_ops mtl_pat_ops = {
>> +	.program_graphics = program_pat,
>> +	.program_media = program_pat_mcr,
>> +};
>>
>> +void xe_pat_init_early(struct xe_device *xe)
>> +{
>>  	if (xe->info.platform == XE_METEORLAKE) {
>> -		/*
>> -		 * SAMedia register offsets are adjusted by the write methods
>> -		 * and they target registers that are not MCR, while for normal
>> -		 * GT they are MCR
>> -		 */
>> -		if (xe_gt_is_media_type(gt))
>> -			program_pat(gt, mtl_pat_table, ARRAY_SIZE(mtl_pat_table));
>> -		else
>> -			program_pat_mcr(gt, mtl_pat_table, ARRAY_SIZE(mtl_pat_table));
>> +		xe->pat.ops = &mtl_pat_ops;
>> +		xe->pat.table = mtl_pat_table;
>> +		xe->pat.n_entries = ARRAY_SIZE(mtl_pat_table);
>>  	} else if (xe->info.platform == XE_PVC || xe->info.platform == XE_DG2) {
>> -		program_pat_mcr(gt, pvc_pat_table, ARRAY_SIZE(pvc_pat_table));
>> +		xe->pat.ops = &pvc_pat_ops;
>
>Actually, to be more consistent with the rest of the driver we should
>probably name this 'dg2_pat_ops' after the first platform that
>introduced this.

I was not very happy with the name neither, but naming it dg2 would be
inconsistent with the pvc_pat_table.... or I would need to rename that
in this same patch. But my final goal was to name it after the arch, so
renaming it here would be pointless. See patch #7.

Lucas De Marchi

>
>
>Matt
>
>> +		xe->pat.table = pvc_pat_table;
>> +		xe->pat.n_entries = ARRAY_SIZE(pvc_pat_table);
>>  	} else if (GRAPHICS_VERx100(xe) <= 1210) {
>> -		program_pat(gt, tgl_pat_table, ARRAY_SIZE(tgl_pat_table));
>> +		xe->pat.ops = &tgl_pat_ops;
>> +		xe->pat.table = tgl_pat_table;
>> +		xe->pat.n_entries = ARRAY_SIZE(tgl_pat_table);
>>  	} else {
>>  		/*
>>  		 * Going forward we expect to need new PAT settings for most
>> @@ -111,3 +129,16 @@ void xe_pat_init(struct xe_gt *gt)
>>  			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
>>  	}
>>  }
>> +
>> +void xe_pat_init(struct xe_gt *gt)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +
>> +	if (!xe->pat.ops)
>> +		return;
>> +
>> +	if (xe_gt_is_media_type(gt))
>> +		xe->pat.ops->program_media(gt, xe->pat.table, xe->pat.n_entries);
>> +	else
>> +		xe->pat.ops->program_graphics(gt, xe->pat.table, xe->pat.n_entries);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
>> index 659de4008131..744318cab69b 100644
>> --- a/drivers/gpu/drm/xe/xe_pat.h
>> +++ b/drivers/gpu/drm/xe/xe_pat.h
>> @@ -7,7 +7,18 @@
>>  #define _XE_PAT_H_
>>
>>  struct xe_gt;
>> +struct xe_device;
>>
>> +/**
>> + * xe_pat_init_early - SW initialization, setting up data based on device
>> + * @xe: xe device
>> + */
>> +void xe_pat_init_early(struct xe_device *xe);
>> +
>> +/**
>> + * xe_pat_init_early - Program HW PAT table
>> + * @gt: GT structure
>> + */
>>  void xe_pat_init(struct xe_gt *gt);
>>
>>  #endif
>> --
>> 2.40.1
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
