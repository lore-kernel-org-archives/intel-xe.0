Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 617B9C7EE23
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 12:14:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C7A10E09C;
	Thu, 11 May 2023 12:14:46 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AFB110E09C
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 12:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683807284; x=1715343284;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=QnEBdU4jaGThS0zH8U6F73ENEu+7T9kX/Xqb+BpTKR4=;
 b=lJZI3CRCZF+JJh+U4+riT4kpO6+fEuiK6mxsPnhgam28EiixTDhuX+Eh
 sjthl7bxAR9/rHw3YbX2R19sfE2C3esplLxDMMR0utyywIjdhwoN3Orzk
 t2BXMf9p6izoGOXYPfbGFx3KoHfbRJtKRG+OlxYQCTuTQ+eBqH73qQFLv
 oTNUqYaqSv878GS33z1Dk5Mb8kBKgWNjjZgGNt2AjtQdPk0UpxhktUIfN
 1Up8dQJ4RiCe0xZG8e84YGU797oPHJnFQQM+EFqToRtATFUtdeiWGkblx
 GpA409mc4G5HeT8E/YBGnPsalQSw5WTR2O1H1I5jC5g8zPh5NxmKNcmiN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="413812065"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="413812065"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 05:14:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="650146630"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="650146630"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 11 May 2023 05:14:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 05:14:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 05:14:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 11 May 2023 05:14:42 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 11 May 2023 05:14:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ACZkx3Ddd6FfQCtsPI/87XqQg7jcW4+R97iEGKlNkNXTp9fjKip0JYZVK4txU6AOVm/gEEetzqS95U9e1C5Yr+wasjnEKwfKZCzoPORWk+FfhuELhnEbY/0NfweoWxVN+44tS+ljHZalXRgv4MZVz4nwqE+nIL0g4l7BC/iCpuOKU15Kcwvw4DMeYclurzpVh7E/r+EmV6+D/qHBmIGg3FMfBJG6WX/O2CmE9TGvkLl77rKaASlGRG5mJZY8V8UmttN99ZcYoJlYrDtyrnvbcylMZPG92OQRGwlNxLoI+7nwYhJhzIPfWKQVcAZ4LtIMTHKCiwqEkZ6KgtM+TLtzRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GRJcsULH0SZEzXPOKQoEsBSm69bsMsP4t8a6Ca75xE4=;
 b=DURV4MxGoXaNjY0OVFL+J8bThcJ9d2iL93qNmXca7hfO5HLioda8ZsuUtjvQpcxTImAvlu95KpuvNY5o6dn5SvJgWcA1FP9ZDeVlzA10hJ/oCZVHVdEgb2Vt9zZxpxxGPvJ4Xtus48AOz10+pNGBFJdmDdo/3VVhqFfFmwUp65efqSmq02eM7rWU996HambOaaCiIf1qHSB3+JFXNEByb7EWQuxDwJkMT3PIWX8pApj02VEg3By8TOQ20xsctFO1pFoqTDstFkOeeF/FN0OQI+bfBabMTAxyIcJgem2N8FvygbPLnWK2/ixHmCR968AqqcKywQCPPX+udC4dfDzB3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5480.namprd11.prod.outlook.com (2603:10b6:208:314::6)
 by CY8PR11MB6940.namprd11.prod.outlook.com (2603:10b6:930:58::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Thu, 11 May
 2023 12:14:28 +0000
Received: from BL1PR11MB5480.namprd11.prod.outlook.com
 ([fe80::7313:20af:ba84:eb1b]) by BL1PR11MB5480.namprd11.prod.outlook.com
 ([fe80::7313:20af:ba84:eb1b%4]) with mapi id 15.20.6387.020; Thu, 11 May 2023
 12:14:27 +0000
Message-ID: <5dcf50c8-0963-813f-68d4-b206549f1c31@intel.com>
Date: Thu, 11 May 2023 17:44:18 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.1
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
 <20230511034722.1929038-16-matthew.d.roper@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20230511034722.1929038-16-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0017.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::22) To BL1PR11MB5480.namprd11.prod.outlook.com
 (2603:10b6:208:314::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5480:EE_|CY8PR11MB6940:EE_
X-MS-Office365-Filtering-Correlation-Id: 951de01a-bfc3-494d-c185-08db52194409
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zSMVOvnyBBUdJVX/ym+CFSqTn3cDglQrQqV5wvw2ugANoLHkxFMLHAMeR1LS1bFd1KDj03noj7yxsAddS5lC0Fx18RnKB7cAeUHaazQbbxdzVsXzW2xP2ab/MNJaMocnkDW2X+4/0I/tDjcGhWOjhj42MvJcojHXg1l1ZyUi4tpqf2+a2aI440v8KH52ctRivqlKAIAu3hcB3fSu3KdnBGBzxj68MS85klkWFZa+kAYXb4IbV9Nvcdlw2yS+SoWS/9qhQAxV9gg04aMLZJQds4rasxKM4952JuZs5fbVxeoJMEDYw3BZUhStxzDJ3IQgRlCbCZdiM74Ylq0bWPRuX5xQnZC8ClkXi92zSUvwhf3Cc0EHheHUdSshsnBbfloTSV5fgcyX+hyoU3sZuCERFTd05UbDwWwl1Wn9+T8JfZviKE+jgG06SEZYrBuIDHqP+DNZpOK0c6NCaKr5YqwLNFwOQudHzz/HLADpQA5hm5HH+3e0u5iPiSe1H9HTOV95d2uguWV1H8391dxF5teAQR+Xi7EMnq21F7bHsjPj953vVn1oi+HOW6pbtYG0oyjDTrDnYV7cpVbpsWu0w3ElNzKaCT7QMwtWhyFmQNCs7ej2MiEq2Glc1cJXkVB9ROr7W1AYv3TNQeRMqX823/GZ1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5480.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(366004)(136003)(39860400002)(396003)(451199021)(5660300002)(478600001)(31686004)(6486002)(8676002)(8936002)(41300700001)(316002)(6666004)(53546011)(66556008)(66476007)(66946007)(26005)(6506007)(6512007)(2906002)(83380400001)(2616005)(186003)(82960400001)(86362001)(31696002)(36756003)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEd6WW4vZFA0ZHVVTFdEdGtVWWJNZVRscmQ3QjJlRXY0ZU91eUlpNVRUQ0x6?=
 =?utf-8?B?cC9xRzdMc3pCcWNGNEY1blBQekFST1l1QU9WT09PeG1SdjduN1RUc3ErMEN3?=
 =?utf-8?B?bTliTnMwclJjQm5Na0xZcmxKYkREWG1ROXNUcUN5c0t5WEI1ZmpaeEFsUVVp?=
 =?utf-8?B?b0xwSmNxaTBLNWhsd3hqUklKbzNscGh3RjBDNW81WFNYek9aSldDa2R0VXZw?=
 =?utf-8?B?YXhoYzBTYlBRRFNkTzFZRFVDVVl0Zm1EODRIWENhZ3R6TGdFUzJBbUU3NEdD?=
 =?utf-8?B?SzJ0ajdwV0NvK0hBbnNPNWMyRDVSK2E4K3V4MDFpNHcwTGhoNGVRWlpjMVNy?=
 =?utf-8?B?YU1rc0FCRnFUOTRKa1hPeGlYZzBKb09aNkkxQ2MzdzJMUlRZUTJQWVliRURV?=
 =?utf-8?B?RkNGT2o4dHh3clJwTmx2b1dlRjdPNnJPMG9XSTZUOGh3VFFpSXY4K1BURXho?=
 =?utf-8?B?RjZVTFlhREJnUWE4U2FHUFdvYUtJUGo3eG5BQldaUlU5SW5BdWdJN2VZcGVR?=
 =?utf-8?B?QUFiNWRKNTV3NjFnZ3pVak9vdTByWHFER3VNWlRiV2lsNXRydmZwb1FRT05r?=
 =?utf-8?B?WlY1SnRKMTNjdGNLYnBVbUhSZ0Z1UEg1UU81azM5Z1lienBLZ2l1OXl6S3dZ?=
 =?utf-8?B?S3pic0xFZzZhU0NCRkl1NFp0Rm5XOUUwVXVLSndUeDJVeGtnQUdLOEg0emhO?=
 =?utf-8?B?cDdJOXQ3VGZJbndWVHRXa0xMSWhmeVZlTkxGdHZJNjg4Q3dVbHFYOG43cStv?=
 =?utf-8?B?WnpvUUtXZ2FoOGFBRnl5MUdaUHI5Ym5HWUZIbHN6K0lTZDFOVjFvbHpXVDVB?=
 =?utf-8?B?ZnB3SllxTG1hZEJYNEpOS3pYSVB2RGlUQUNOL3BQTkFZMVNWV2Z6SmtzRnNh?=
 =?utf-8?B?VW83bWFOOHZzampYWXI1K3NLMWdtdi9mbit3MUdnaVRIb0NkcjQ2V2ZObnlM?=
 =?utf-8?B?U051WDY2UVdOclk3Y2pHeXBBMFEvS1FlaXhaNWVsdXlwYTk1YTBDQ1JVRkFL?=
 =?utf-8?B?WnJIdVVERkUvQnRhcE92SzlpOENxcmMvMU1pdFlmWkUyNzdnRk10SlNpWDVt?=
 =?utf-8?B?dWlLZStzcVhzMjNYa3I1elovdEtDVEcybWF5alZ3YWJ0QUNvS3BnOVZLTy9l?=
 =?utf-8?B?bk03Zi8rK21QcjVPbUxCMEZoeGZuZXFxU05xeG8vQy9Vd294cVl1Vk4vaUJL?=
 =?utf-8?B?SW9VRUd3bnZ1VnQ1MTVqL1lhMzJqVFJ2YVE4TU5vdUJEQ2hDTWtTaW5SL0ha?=
 =?utf-8?B?UUhQTm9ML3VSWG5ZdnVHcW1EU1B1ZXh1ZmRlS0RyZkpMYW1rck15QmRMTnhl?=
 =?utf-8?B?OGtOTlA1MU1vYXB4enlDNFBTK2greDR4RjdqL1k5R0tjaEdUTG4zTEhCYXli?=
 =?utf-8?B?MWNMY3lRdGI0anRXYnFMMktHcGtOeUppV1V6MlB1ZWdYdVhzQzhLOWo5aEJq?=
 =?utf-8?B?bkc4QS8wZjEzQmgrWmhBN25kc0xRWVEvTHpibStXb2xnRWxoMDZHT3VQd1lB?=
 =?utf-8?B?aituSFIrbEs4VTY3QUFOYTBHYUhicXBKR1dCWTNDWE43RzRWQ0dLNjV1b2lO?=
 =?utf-8?B?WHdxQW52R2VzR3hNREJrRy9zNGhQWWVmOFdiOURUSlcrdUZFYm92c0pvUHhU?=
 =?utf-8?B?cVNoNzlPaW5PYzFOVHJYUEdZalRWY0gvSjF6QWJrUWtzZEVYUlZKWFFRRmtH?=
 =?utf-8?B?WXlWdEtGZWI5YzlZYWFKZUtSdmJvSG02OG9OMlRBNVBENUp1UTJGWE9lWXpF?=
 =?utf-8?B?ZkhpQk5Yc002VmdWaEJxMUZTTERYQlJ3Z1BWNGRzSVhrcTNYVXJGMzdNVk9m?=
 =?utf-8?B?M1RvWDlFVkE5UHRPdmFLQzkwWkNOWjlpY0pUZEl3MlFlT1N1ZkhrUU9CYy8r?=
 =?utf-8?B?T1poUTVmdFZJenlyaXNUMVhuQ28zb3JNK0UzLzNZUERqWFpIUDZuTER3SFNl?=
 =?utf-8?B?Z0xYTmhYaEhYejlZNWFPSnZIRFM0UjR5MCt6VlR2a21lZHhGT2pjN0h2bTdW?=
 =?utf-8?B?SE4yZmNqY3d4L3dGZ0FMTVVOR3ZEY0ZWUkJGcEs4OFhLSGpxcEdEcmwrZXYw?=
 =?utf-8?B?YkwwOEQ4U0MvLzJpWTlaUUxOZ01RRm1zc3U0Uk9uR1Q5OWQ0QUxiZitlRVBT?=
 =?utf-8?B?WDRlRTF3eFBmekJsdGFmc2M5Y05qRklnZmNvMWs2VTFmRkRIeEtySlNQaFpH?=
 =?utf-8?B?UEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 951de01a-bfc3-494d-c185-08db52194409
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 12:14:27.6484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GL+PaFCdcV3cuHmMuWHNuzaDvr9zqlNydnfgRLnuXiXkPDDDIMJclgipv9Q3njSw2cuvkFnv0iGn2P3ihai4pAhL8L7vmdnstJxPAnphPhs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6940
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 15/26] drm/xe: Interrupts are delivered
 per-tile, not per-GT
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



On 11-05-2023 09:17, Matt Roper wrote:
> IRQ delivery and handling needs to be handled on a per-tile basis.  Note
> that this is true even for the "GT interrupts" relating to engines and
> GuCs --- the interrupts relating to both GTs get raised through a single
> set of registers in the tile's sgunit range.
> 
> The (mis)use of struct xe_gt as a target for MMIO operations in the
> driver makes the code somewhat confusing since we wind up needing a GT
> pointer to handle programming that's unrelated to the GT.  To mitigate
> this confusion, all of the xe_gt structures used solely as an MMIO
> target in interrupt code are renamed to 'mmio.'  Reworking the driver's
> MMIO handling to not be dependent on xe_gt is planned as a future
> update.
> 
> Note that GT initialization code currently calls xe_gt_irq_postinstall()
> in an attempt to enable the HWE interrupts for the GT being initialized.
> Unfortunately xe_gt_irq_postinstall() doesn't really match its name and
> does a bunch of other stuff unrelated to the GT interrupts (such as
> enabling the top-level device interrupts).  That will be addressed in
> future patches.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c  |   2 +-
>  drivers/gpu/drm/xe/xe_irq.c | 334 ++++++++++++++++++++----------------
>  drivers/gpu/drm/xe/xe_irq.h |   4 +-
>  3 files changed, 187 insertions(+), 153 deletions(-)
> 


<snip>
>  static u32 dg1_intr_disable(struct xe_device *xe)
>  {
> -	struct xe_gt *gt = xe_primary_mmio_gt(xe);
> +	struct xe_gt *mmio = xe_primary_mmio_gt(xe);
>  	u32 val;
>  
>  	/* First disable interrupts */
> -	xe_mmio_write32(gt, DG1_MSTR_TILE_INTR, 0);
> +	xe_mmio_write32(mmio, DG1_MSTR_TILE_INTR, 0);

if sgunit registers are replicated per tile, but why DG1_MSR_TILE_INTR
is handled on primary tile only, is this not a sgunit register?

>  
>  	/* Get the indication levels and ack the master unit */
> -	val = xe_mmio_read32(gt, DG1_MSTR_TILE_INTR);
> +	val = xe_mmio_read32(mmio, DG1_MSTR_TILE_INTR);
>  	if (unlikely(!val))
>  		return 0;
>  
> -	xe_mmio_write32(gt, DG1_MSTR_TILE_INTR, val);
> +	xe_mmio_write32(mmio, DG1_MSTR_TILE_INTR, val);
>  
>  	return val;
>  }
>  
>  static void dg1_intr_enable(struct xe_device *xe, bool stall)
>  {
> -	struct xe_gt *gt = xe_primary_mmio_gt(xe);
> +	struct xe_gt *mmio = xe_primary_mmio_gt(xe);
>  
> -	xe_mmio_write32(gt, DG1_MSTR_TILE_INTR, DG1_MSTR_IRQ);
> +	xe_mmio_write32(mmio, DG1_MSTR_TILE_INTR, DG1_MSTR_IRQ);
>  	if (stall)
> -		xe_mmio_read32(gt, DG1_MSTR_TILE_INTR);
> +		xe_mmio_read32(mmio, DG1_MSTR_TILE_INTR);
>  }
>

Thanks,
Aravind.

