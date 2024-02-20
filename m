Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BD3C54764
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 17:46:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D75410E505;
	Tue, 20 Feb 2024 17:46:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lF/sfA+7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E78BE10E4FF
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Feb 2024 17:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708451194; x=1739987194;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=grhj3UFgyOkkaGOQLT6zuzPB6SFCi3WG08rMKs1iGDk=;
 b=lF/sfA+7+1HHsaFZoAwN4scvktyGl/ulKgEkSIa4bNvSAy1NFW33tUKV
 VHHzexdC1xSb8lwEtWLwV+QxpqWWg27HB2MVXqAekADoJrM6w1Ikg/SKb
 gsKfKZXjk+UZwd2nQDdMztx/6QLR94p2hbNVtbuACQETCngJlmoCA2xsN
 resZ3k/yvhOeM+Zdjz9TNwFHfBOW5na6uFGnNkOyVmbsi2WvyHicTRIdf
 HGaS+ZTaplnCkfquSAnhiPej6QzcctpIoIte5Z5P7AWRMwews3Zpvvm51
 B7LsEUepnrp0ER3gEOosNFI92zno8kJyyosOA6KKZZ7oa3vSfYrhkoVKd A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2712888"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2712888"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 09:46:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="9449723"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2024 09:46:33 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 09:46:32 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 20 Feb 2024 09:46:32 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 20 Feb 2024 09:46:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eWFdU6ow/Ep0+3UmVW+zDRfITpdJPd7l0LDzeKn4fLrpCdB5L8BQL58GnZHSQx2GV7B92zQNO7OBPTGfc1kBffwhmsHW5TXfR2WZ1MRQ1rF8HWKbm2QEYdEdtMVWjDGZv8VDsWg9iT/UfZIw67z/5hAyy/ithAWcV0YVh/TcOMuTG0hcUUK8UPOAZR0rZzMuv+Xy5rjAiCI9Mp+LsFK7ESYeJXgUor4zNr4FHDYqapkueF+HxLJBdAT21QyAIq8hZFdzrlRMWXIAh+CrXlDS0kIF/eFsw6iajlq5Redofx90J2GFRzLTqMDwJJD1xN0ATwiH9aydQWuuD4R6iXw0ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGbDp43hi4JzZEjdcaXDetuTTd6cPrFf1yajMMOKgnQ=;
 b=TDMzX03B6PIi/RTs/EWi6VVvye4GpOKsWbmQlU0oQncPohmUSagmSZpcBgFJy3nfBWSnz9BhJrYi3p/BnrGXjy4GRzxCKPCbvlVUkLARnUtfDBdFgbftd0uULrFu34ejWFgHyEcDPc39h3Pitjvlt6rTsGPTMSLwySckdpnCfKbwy865l270rh9aYVHsu2ZQEjC7H5NMeFHwV/TbeJwV96F5xJERI2RmOMedgWuFaNsG3fxDTY+S2NsRVCW3Jc6XD7vSg3O5kuAw3UJgeqA7PBJZ2oXiJ1msW9iRtr5vxAVeOG6RSicEWRM1YDBFNLUb8VBpGya6MUrZ5WYhBJ59pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7189.namprd11.prod.outlook.com (2603:10b6:8:137::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38; Tue, 20 Feb
 2024 17:46:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7316.018; Tue, 20 Feb 2024
 17:46:29 +0000
Date: Tue, 20 Feb 2024 11:46:27 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
CC: <priyanka.dandamudi@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: Re: [PATCH] xe/xe_bo_move: Enhance xe_bo_move trace
Message-ID: <7jtzy5n7olfdqbtwyx3dhrtiwgf6vundrnpmxfuqmfjufx2nba@rchyjrzgsx5y>
References: <20240220044748.948496-1-priyanka.dandamudi@intel.com>
 <0e9d3e4cf399c7384c6cfea5a8de33ad5d69d5f7.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e9d3e4cf399c7384c6cfea5a8de33ad5d69d5f7.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0279.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7189:EE_
X-MS-Office365-Filtering-Correlation-Id: 600f5e74-c943-4a11-5843-08dc323bde88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3irwYtnm4p5iBhfCc6TnMaceWDQmNCftMT2LuHz30W/URJ+8eSKvz2rdE2RFqxz+eX5Nbf5+W8zzrE0ISGNMXV/kU0PYY59AWTXotr1pB0iHMbOwq3MKp0uMVXD8yBX5O2tF3nTTHvvpWuFocYRiiIhjD66jcFt2H6w9eGORi6TkwjUX2ehLxWexQ4nhHLRGDn2Aeu4kEt6ncBo8KX/DK/SIxGaaVq6m1igzt/BDBKm+8yvChLhrWDH1EbtRkeSJZ0quH8SKxZTwLIlwHLwBLl2wwNZiyevUI0Xj9nMeJDPMIkuvhtXcEkxq3lHH2mZwZ1xa5THZCPF+dMv61ovIKGageJkPDr9lxNJl98Gf0tTYnrrd0LHqeardWn7mVFZdHVMZymRzVMCwnLhPejXwF8iXISOu6nM2Q42ELxbfYGaLPucrr0iZ4eQm7SfbF34CAN1Z0rvsZqwcKqN8UC31hXHXrKuvIDTD6wWhJVsosg571w1Z+0obBRk020xlLOPsZ4/8oWwgcrjOuQneMgEYUc7J4kh4PL7FICTPkSUpMUg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Jo72q1YPB24ef0c42eSGqDSKhN2UzzRhOwfKkSMInx2SloT/MZbTB3xFeH?=
 =?iso-8859-1?Q?JnbxTxR3JgSHt9T7/KhVGd0L0EFq3AWgDAhLRUKXRT/o1UJhdL5LVI6hM7?=
 =?iso-8859-1?Q?YWiSrR19HX9FUXOvDHskKHwY9qmlNBNiifBFN51SnZx/0k8JrIebf1ENci?=
 =?iso-8859-1?Q?8bvkjHQbDH2fhTISwTUU/En+DIuAw3rdKmmwPm0H3G9fwYKI3wb667I862?=
 =?iso-8859-1?Q?z3WAMNMcvXUQtTx4YGiefpjMPAP57bdvhhATheO2lg+HYR34phaxJuOXQr?=
 =?iso-8859-1?Q?kBWgRNz4C/szQ8/9TrVAWCdnVOHyilansXf9L/hi/+Pxw5pRonfEQKp8JB?=
 =?iso-8859-1?Q?NPLVmFNjj0bSALQerMY3piElutfWstrMRFDilmdb7nBbnIrKpaixJ5asdL?=
 =?iso-8859-1?Q?0ElaBF4yIsOhGSUqcMa584JMVeTzDTL98RWJpw9K5Udie6X6/CjUF5cbHn?=
 =?iso-8859-1?Q?wd0YSjZtIXjPhXMCgzGS+uEUvAtqLHJv9MIu+swRaCOG1v923dP6LDXfp8?=
 =?iso-8859-1?Q?78uN2TVsGdDWiiKwqYVg6Sch6+id5tXhxhWiKghliufqpRsl0lN8ctlM7Q?=
 =?iso-8859-1?Q?HkOLJN8dbddjKW4IGzBvDFc/GTCFPniv5ebG0DxmUA3dVSmGi7Og9OPu7X?=
 =?iso-8859-1?Q?PEVcfV5q0g0gCwsvHMqtwuZWzVuLVrCmONnA2PlUHAb4vpP9W9cYzKf5Ju?=
 =?iso-8859-1?Q?W9a4XFGlNI/S44m0ytBsmh0yMzAgpWYSCiYXsHFcOKbglePJgaybwzwdtG?=
 =?iso-8859-1?Q?j3UfavB0BzUvTR9XXTPTyQk3MMNPEriKdEUSPAbV6z3FXc2oi4vV1K1HXM?=
 =?iso-8859-1?Q?1idWkTus6NnZiAjaaHTzf51tEaDe/k2SsCkViczor5ZOJt6vSLWgDH72JM?=
 =?iso-8859-1?Q?NFoNcJhHIZOb/KMhAvV1PAtN+PIR3LK29bCWZ48bZOYcZgS08ybnOTxDFk?=
 =?iso-8859-1?Q?gZkLpfhBm9Iz0sk0NVQlIiB0LxszakqEoaqv4GrktyxXAPgC0+uqmFM3zK?=
 =?iso-8859-1?Q?pBNtY2BRUhdzxwMM87hUXQIY3aoJ4OIWQ+z3j6+29Arlf7UkYLWNzgG3jy?=
 =?iso-8859-1?Q?rqmzC7JqlmlhsbtG7kyv1+VN6L23fUaXguui4h9hkvfenxKah6EMEd9f0x?=
 =?iso-8859-1?Q?vJKhUpiRWQF2F3qkjkQdYE0D2dP1MS7N8p3VQ7jGe41govVunmdVgbly6t?=
 =?iso-8859-1?Q?L7g7md0ItD9zdy1z/Wupfw5FZ8TAL9Bi3Mux9rPX++lVlq5PFyj+KNPhZU?=
 =?iso-8859-1?Q?S9F/5BsEj5kgj5bJXhzF3B5uFVry+6Gfx7yKsKjH/M2Yw30amzvHf9o+1T?=
 =?iso-8859-1?Q?6lt9uTe5Yyj9PnOHvgUJshr7HlD09v5yMAnw6cmL5BH7bLfLh04ZAYYkJK?=
 =?iso-8859-1?Q?376qodqsu7leuVDMrZe2v+LKxNbP8o6jtXlwyqBiKsh2foAF+kI4lbxhU6?=
 =?iso-8859-1?Q?6f0o429Ny5piK08CCWNaEhRDllUfPbU/k/mROVt18OtspL6b9MDMQcu+Cu?=
 =?iso-8859-1?Q?NVtfpDscSQcL7q2tKH29cZWrkpW40FCtViouedjvOW0xOzieUjU7HrkxGv?=
 =?iso-8859-1?Q?PTjAH6AjrQsyTqgo2949y4M8wUKqGB1LnsePRG+Ckv6gbo5KwaAAGxA6fY?=
 =?iso-8859-1?Q?YzI85/Ws9HTQQZ3srLhwgA2xnr0+33VS5DbJZRRc+ejq/bh7Bo590yAA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 600f5e74-c943-4a11-5843-08dc323bde88
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 17:46:29.9197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lOk4X440CG8pgl0m7q3Vo3sPiEazOuDOdth3zbSLVZYFluBidExq5QOnJsGkTVfdKea821cDdLSvJ6m4qheXmwqXvpsX9Bax/T4f0qKb08I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7189
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Feb 20, 2024 at 08:49:26AM +0100, Thomas Hellström wrote:
>Hi
>
>On Tue, 2024-02-20 at 10:17 +0530, priyanka.dandamudi@intel.com wrote:
>> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>>
>> Enhanced xe_bo_move trace to be more readable.
>> It will help to show the migration details.
>> Src and dst details.
>>
>> v2: Modify trace_xe_bo_move(), it takes the integer mem_type
>> rather than a string.
>> Make mem_type_to_name() extern, it will be used by trace.(Thomas)
>>
>> v3: Move mem_type_to_name() to xe_bo.[ch] (Thomas, Matt)
>>
>> v4: Add device details to reduce ambiquity related to vram0/vram1.
>> (Oak)
>>
>> v5: Rename mem_type_to_name to xe_mem_type_to_name. (Thomas)
>>
>> v6: Optimised code to use xe_bo_device(__entry->bo). (Thomas)
>>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Oak Zeng <oak.zeng@intel.com>
>> Cc: Kempczynski Zbigniew <Zbigniew.Kempczynski@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Brian Welty <brian.welty@intel.com>
>> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>> Reviewed-by: Oak Zeng <oak.zeng@intel.com>
>> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>
>I pushed this to drm-xe-next now, changing the title from
>xe/xe_bo_move: ... to drm/xe/xe_bo_move:

I was wondering why 32b broke again even if we had this patch in
drm-xe-next:

8d038f49c1f3 ("drm/xe: Fix cast on trace variable")

see below

>
>Thanks,
>Thomas
>
>
>
>> ---
>>  drivers/gpu/drm/xe/xe_bo.c         | 11 +++++++++--
>>  drivers/gpu/drm/xe/xe_bo.h         |  1 +
>>  drivers/gpu/drm/xe/xe_drm_client.c | 12 ++----------
>>  drivers/gpu/drm/xe/xe_trace.h      | 27 +++++++++++++++++++++++----
>>  4 files changed, 35 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 686d716c5581..d59b67d43c25 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -28,6 +28,14 @@
>>  #include "xe_ttm_stolen_mgr.h"
>>  #include "xe_vm.h"
>>  
>> +const char *const xe_mem_type_to_name[TTM_NUM_MEM_TYPES]  = {
>> +	[XE_PL_SYSTEM] = "system",
>> +	[XE_PL_TT] = "gtt",
>> +	[XE_PL_VRAM0] = "vram0",
>> +	[XE_PL_VRAM1] = "vram1",
>> +	[XE_PL_STOLEN] = "stolen"
>> +};
>> +
>>  static const struct ttm_place sys_placement_flags = {
>>  	.fpfn = 0,
>>  	.lpfn = 0,
>> @@ -727,8 +735,7 @@ static int xe_bo_move(struct ttm_buffer_object
>> *ttm_bo, bool evict,
>>  		migrate = xe->tiles[0].migrate;
>>  
>>  	xe_assert(xe, migrate);
>> -
>> -	trace_xe_bo_move(bo);
>> +	trace_xe_bo_move(bo, new_mem->mem_type, old_mem_type);
>>  	xe_device_mem_access_get(xe);
>>  
>>  	if (xe_bo_is_pinned(bo) && !xe_bo_is_user(bo)) {
>> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>> index db4b2db6b073..7e49e670d91e 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.h
>> +++ b/drivers/gpu/drm/xe/xe_bo.h
>> @@ -244,6 +244,7 @@ int xe_bo_evict_pinned(struct xe_bo *bo);
>>  int xe_bo_restore_pinned(struct xe_bo *bo);
>>  
>>  extern const struct ttm_device_funcs xe_ttm_funcs;
>> +extern const char *const xe_mem_type_to_name[];
>>  
>>  int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>>  			struct drm_file *file);
>> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c
>> b/drivers/gpu/drm/xe/xe_drm_client.c
>> index 82d1305e831f..6040e4d22b28 100644
>> --- a/drivers/gpu/drm/xe/xe_drm_client.c
>> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
>> @@ -131,14 +131,6 @@ static void bo_meminfo(struct xe_bo *bo,
>>  
>>  static void show_meminfo(struct drm_printer *p, struct drm_file
>> *file)
>>  {
>> -	static const char *const
>> mem_type_to_name[TTM_NUM_MEM_TYPES]  = {
>> -		[XE_PL_SYSTEM] = "system",
>> -		[XE_PL_TT] = "gtt",
>> -		[XE_PL_VRAM0] = "vram0",
>> -		[XE_PL_VRAM1] = "vram1",
>> -		[4 ... 6] = NULL,
>> -		[XE_PL_STOLEN] = "stolen"
>> -	};
>>  	struct drm_memory_stats stats[TTM_NUM_MEM_TYPES] = {};
>>  	struct xe_file *xef = file->driver_priv;
>>  	struct ttm_device *bdev = &xef->xe->ttm;
>> @@ -171,7 +163,7 @@ static void show_meminfo(struct drm_printer *p,
>> struct drm_file *file)
>>  	spin_unlock(&client->bos_lock);
>>  
>>  	for (mem_type = XE_PL_SYSTEM; mem_type < TTM_NUM_MEM_TYPES;
>> ++mem_type) {
>> -		if (!mem_type_to_name[mem_type])
>> +		if (!xe_mem_type_to_name[mem_type])
>>  			continue;
>>  
>>  		man = ttm_manager_type(bdev, mem_type);
>> @@ -182,7 +174,7 @@ static void show_meminfo(struct drm_printer *p,
>> struct drm_file *file)
>>  					      
>> DRM_GEM_OBJECT_RESIDENT |
>>  					       (mem_type !=
>> XE_PL_SYSTEM ? 0 :
>>  					      
>> DRM_GEM_OBJECT_PURGEABLE),
>> -					      
>> mem_type_to_name[mem_type]);
>> +					      
>> xe_mem_type_to_name[mem_type]);
>>  		}
>>  	}
>>  }
>> diff --git a/drivers/gpu/drm/xe/xe_trace.h
>> b/drivers/gpu/drm/xe/xe_trace.h
>> index e4e7262191ad..0cce98a6b14b 100644
>> --- a/drivers/gpu/drm/xe/xe_trace.h
>> +++ b/drivers/gpu/drm/xe/xe_trace.h
>> @@ -12,6 +12,7 @@
>>  #include <linux/tracepoint.h>
>>  #include <linux/types.h>
>>  
>> +#include "xe_bo.h"
>>  #include "xe_bo_types.h"
>>  #include "xe_exec_queue_types.h"
>>  #include "xe_gpu_scheduler_types.h"
>> @@ -31,7 +32,7 @@ DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
>>  			     ),
>>  
>>  		    TP_fast_assign(
>> -			   __entry->fence = (unsigned long)fence;
>> +			   __entry->fence = (u64)fence;

why did you revert the commit mentioned above moving this back to u64?

Lucas De Marchi

>>  			   __entry->seqno = fence->seqno;
>>  			   ),
>>  
>> @@ -100,9 +101,27 @@ DEFINE_EVENT(xe_bo, xe_bo_cpu_fault,
>>  	     TP_ARGS(bo)
>>  );
>>  
>> -DEFINE_EVENT(xe_bo, xe_bo_move,
>> -	     TP_PROTO(struct xe_bo *bo),
>> -	     TP_ARGS(bo)
>> +TRACE_EVENT(xe_bo_move,
>> +	    TP_PROTO(struct xe_bo *bo, uint32_t new_placement,
>> uint32_t old_placement),
>> +	    TP_ARGS(bo, new_placement, old_placement),
>> +	    TP_STRUCT__entry(
>> +		     __field(struct xe_bo *, bo)
>> +		     __field(size_t, size)
>> +		     __field(u32, new_placement)
>> +		     __field(u32, old_placement)
>> +		     __array(char, device_id, 12)
>> +			),
>> +
>> +	    TP_fast_assign(
>> +		   __entry->bo      = bo;
>> +		   __entry->size = bo->size;
>> +		   __entry->new_placement = new_placement;
>> +		   __entry->old_placement = old_placement;
>> +		   strscpy(__entry->device_id,
>> dev_name(xe_bo_device(__entry->bo)->drm.dev), 12);
>> +		   ),
>> +	    TP_printk("migrate object %p [size %zu] from %s to %s
>> device_id:%s",
>> +		      __entry->bo, __entry->size,
>> xe_mem_type_to_name[__entry->old_placement],
>> +		      xe_mem_type_to_name[__entry->new_placement],
>> __entry->device_id)
>>  );
>>  
>>  DECLARE_EVENT_CLASS(xe_exec_queue,
>
