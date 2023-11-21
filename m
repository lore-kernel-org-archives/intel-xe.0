Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A2CC61D90
	for <intel-xe@archiver.kernel.org>; Tue, 21 Nov 2023 16:49:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8444D10E529;
	Tue, 21 Nov 2023 16:49:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1A1310E52F
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Nov 2023 16:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700585385; x=1732121385;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8IEG5iTrWyiWJ+nqwlRPSMYEe/aJlUd90MC1oHLmFOM=;
 b=CW9Bty6uusUmeAmXSyunVXJy62P6WigEeO2UEWOq4gPP5/Dh975YDPei
 C6lZ0x8kUDtZ0Zz+ENV2HHOliZwjkIhlMxFT5hjxGhWsP9rZmhSpZgIZW
 XPsydgsUjQKNK1tg9H/w5HrERbCnfl85WmEM2mD4jpTT7iagQALCJZ7Pw
 Qx7vD+lNaA8orWjfQ9PEffXzyzHpu5lrcH2THTXxfr5jGXHhPejJNub9y
 WBtNdtn8pxsFXRwP/sLcJcMq92TRPNx4lXbxnstX8PF9CBTVt7NwLFsMI
 E6EN1VyCJ8x8dd+Hy7a1mKCpsypILX6cjGfwgLY7Lx3bvIi9zQ7wBkhUh g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="458373011"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; d="scan'208";a="458373011"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 08:49:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="884267067"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; d="scan'208";a="884267067"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2023 08:49:44 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 21 Nov 2023 08:49:43 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 21 Nov 2023 08:49:43 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 21 Nov 2023 08:49:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dFZLCy6mijIyY4ioEUKFdImxZ1RCKCwX79HKnYIjBKES8calkR/22SR0BYCIksZEl/6Esrpb5YrP76IDaW1EuRPjxl+fMtuFGTrCBfqHpsg/GgYmVal51Oy7g5seHhZ3UqXk5aln7nTOKeIup2s0DuZKwksPNSKEXjgJkaplxjMPB0pwNeY+qz/OEEait8BVG9RXD8GIjFwRnsn5HZN6r64BZEcXP2Tq3mAacx3dJNxvIbYOMy4Nj7QtydRq4VM3iSUTOihFQD0piptrcwJyzbcUOymFbsSJ8Cca68PpKnJW76pgowMDkzJ64IUSFG9W4TAgcwL+MNzjL2wMEcAumA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8sVhAv7KNSrUwJM7M79kzOs8Pij5lPbhEZEZz1tC4S0=;
 b=n0ZTOiKCNe5j4p1okYdGfsN4A61nqTwUBqCqfEr7kbBkOOJKaxN7MnSqF536kAcC2U3WxX4deTBwYxm5yXjowQTSr6jkRrLbsRauHYsT0SuKx2aEvN/UpOJvL7fQSuRFxmuTz7toB35pr3BGxxVx0LuB03qoQdlk+yrfiu18pD3/QlGl4gU/8fdFCymokSC/kgNkFIhQgwi2LtvJQ6iqX5M6JNky6ByI763HkLN8uVKSWDYfq4BIi+MXeOteIbZcfQPNZDNnAy4zVoFHxVUKtk4+EnuWMIBgLjZ9FPDy7Jf1AP3GEvSUMeDv7DY/LdZx7vKA7lTOtGfvJwCWtk2FVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB8489.namprd11.prod.outlook.com (2603:10b6:806:3a9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26; Tue, 21 Nov
 2023 16:49:40 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7025.017; Tue, 21 Nov 2023
 16:49:40 +0000
Date: Tue, 21 Nov 2023 10:49:38 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <5fs7ronk3x5am5eaoge7446m6ktud3erhdgthblhcwpnrpwlpr@6zcyuf5znck3>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
 <20231114130231.2299661-19-michal.winiarski@intel.com>
 <6tspngnkj5qz7isixbeeb3a4chshdxb3may2lhvpkq4qqwusu4@yfxff2bq4yia>
 <tgdyqlupjtophwtiqmol6ioba67md7z4amracowlspp6lsbgpt@zln7qb2zue5e>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tgdyqlupjtophwtiqmol6ioba67md7z4amracowlspp6lsbgpt@zln7qb2zue5e>
X-ClientProxiedBy: SJ0PR03CA0250.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB8489:EE_
X-MS-Office365-Filtering-Correlation-Id: 791b45a1-2da7-4088-fb59-08dbeab1da9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xw6oNRixyc0FeMwLmvS5J2OOV+IWKLkzf6TAXg3b3xT+g2OkMXm43bWv89NqERS+coum3WLoMaj2M1Kq2jv7u0ZKjVL2mefNxFBD3ippOlIWlcP4v1RbIrBtll5V5IXybo2ciShFT5aSI4ovjVd/olBuKZKx1p5hFZytMVZiVyUiLQ7wu0zljx+ViqBFtxFeSOcVz+oaNyLslw0g1Fs5urPhC2koGdEGxg5VPENM4iIiYRwe9SYC1q8Rkijp6JVfhbo0/cEX1NShAVi4V0iwS7tMIY9kYksqMjb+78S/xkylFOZwPnrR65B/Fk0dWIHjgH6n5r8pesZDQ4a5vTHe+6tYmocLJPPo7k5lO1eu3ibf1XIwYFPLoGJ2UxbQgeUhNMT3Ge5/BVSqtSlLLsmPx4X6ZthGK3eZQsgEwmrsdf5Cq5mzK5EKrqig6ANzckFGSK/z4o8TTjJ7nlZnUBsCdO1HmsjWVo5i4XkI31l1cy+iQGCb5VoAPY0jnQY1b5e/Up8+15umuUhTjNrgarEMo341yLnc/uAAyD5vYLgC2G3ON5HKZfKoRIpFKLQuPJxP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(346002)(376002)(136003)(39860400002)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(83380400001)(38100700002)(33716001)(2906002)(316002)(66476007)(6636002)(66946007)(66556008)(107886003)(9686003)(6512007)(82960400001)(26005)(41300700001)(5660300002)(86362001)(6506007)(478600001)(6486002)(8936002)(8676002)(6862004)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjdlOXZ4R3hwbThObmhOaTVVaDF6QkNrYzFqbjFpb0Q5RUZlQjFpakpUY2R1?=
 =?utf-8?B?bHc5NEZMajJHZXEvNGhudVBoZGNyRHliME5LOWNZZ0JsNnZkdmZHSDg2Mktm?=
 =?utf-8?B?WUJvUmcwbXJnTGNqVnF0WHUxc0lJd3VLZVJkaC8vL20vajNLb2gxdlZ6c2lI?=
 =?utf-8?B?VWhQaUpBVmVIajVrWlY3WDZGUGhua0REUlJ2U0tDaWNQM1FUMGR4ZnJ4bVZv?=
 =?utf-8?B?d1AxdG9TTVc5U0R2Qk4yZFVpd2tnN2RISlI4TEFrcGVMUUFVK3Z3L2c4V1c3?=
 =?utf-8?B?Z2VGNWUybGF3ai82c0pvaytaRDB3QUcrNWw2U3QxQjRyZzcydmR4M3pJbC9E?=
 =?utf-8?B?Q3JvTW1ZTCtUWlJrMG4yNTg0aEFYRytPWDdmRHV2b2JxTXNkelBLMHpOR3dj?=
 =?utf-8?B?N2xwR0w4ZHNxRUc5eEkzanEvbldYcThRTXV0dFVLZm1EWmJEL2RBVGI4NUZv?=
 =?utf-8?B?M084cHZNV2hCaCtBTVc4eGRQWVhNSkM4UlV4RWZkcEZIc21SNWRPU3FqOXdi?=
 =?utf-8?B?dFF4anR3MG9NeVUydjNENkNFcFM5OVdTWXJBandPdGpuQnd6T0h6S2xRdVNi?=
 =?utf-8?B?SC9YSmcyZm9Ga0tIejFyNWQxNlc5VndnWHhwYmtvdWtYYkc5MnExUzJ6S0gw?=
 =?utf-8?B?OFRZb3N0eC9URng1bnE0N2c1dDR3TVhsclg1dFVGSG9Ua0JmMk1IeElxRFpZ?=
 =?utf-8?B?Wnk3SWxEbW5nVmJpWHA1VE5pVTA4dzVkcWVtbVRycTNyMVNwMnlacENNeXpO?=
 =?utf-8?B?S1FjTkZ5QVFhSmJtTW9UUFJpeDcrNHdhRHNWd1A5T29WMjJLUzZhTEdiQ0RY?=
 =?utf-8?B?cGdsdHNkMDIvR2ljT1VhcUZnMWlnUjZOcDErSDJ0NDhTLzZuMzU3SlZ3QWR5?=
 =?utf-8?B?d2FEb3JuTmpVdWdRYjgrY2FvQkpDY09SSlpkdDhyaVhDSHVwaVlHdVJVVlk4?=
 =?utf-8?B?Q092M1Z0VUpXdE9hQ2tncWhHUGdJNlJSNmlLQ2hvWnhOY2I2a0NzdTRkWGNv?=
 =?utf-8?B?QnhubEpRZVNMcFlIbEJpZGprR3BDRXB2R2ZOZVFrMmdDdng4ZCtuTU1aZjNH?=
 =?utf-8?B?d1lObnlqdGpqQTdYMDR1Tk5WdmZPdHd0OEpZdUx6U3Zod0VqL0pYbnh5RmM2?=
 =?utf-8?B?R25PUE53UHE2WUhEWU5VWGxDeHR3MW1MVUIrWHlGbHU4UDFwdWFPRlZsK0VJ?=
 =?utf-8?B?U21NNlpUdTY3S2Y2RHBwVGZQVGVWQVhTQStpWHd4VXgxWVdqODMwaVVJZnFo?=
 =?utf-8?B?WnlxdlYwbEdoanpCUCtBSU1XQUM5K0I1M2Y1RG1kYTg3dzNBNitlcVlFa0M2?=
 =?utf-8?B?emtlVHpVQ0FlV0xZZncyUEZIV0cremR6UjlhTlFBVGxLYTZmT1NrMjQ0ekJx?=
 =?utf-8?B?eU5DdFd1RERBWTlDMHUwd1RHZGg4cGIzQm9YV0NOV1RFMWM2SEtkNWg3SjZa?=
 =?utf-8?B?c1ZKa0dFRHYyN3RwMzZmalAwWlZZektNNERpVFJvVm5vZjZPTC81L2tGQjBw?=
 =?utf-8?B?QmdRMERWZ2p6SzBUZm4rQ1pwWVBIMnJhMkpMeitjWVVWMmkyaDZoeTIvdHNQ?=
 =?utf-8?B?R2t1K2FYMTNxY3BjcnpNeUY1Mks3bkJOZE1YR1JRalhWVW9KV3JPZE1qcDA2?=
 =?utf-8?B?QnBQS1RnUUVTQndhRnJvTjV0ZHh2TCsvZ1FRM3g3WE04bm9OTTFmSWdIN01H?=
 =?utf-8?B?MEgvL2VScWFvaEhFakpYKzZFckM4Y1JldWwycHNSNFpLZEZ5RGpSdGp6R2ha?=
 =?utf-8?B?UDlnQmhQQURPMWNUSHJuejhWU0piZVo3Y2dSTTY2RUJXd3k5T0pOd1c2OHNk?=
 =?utf-8?B?YXpaTERQOEhGbWFLWE80WGFIMDdvYlorMUlQQTBiSGpzelV2N0pTS2UyL01C?=
 =?utf-8?B?RUxSSkNBdzJWbTdlclFoLzJicFpHaVFQdDZ2bUI1ZnNNVyt6N1RiVzVVWEp6?=
 =?utf-8?B?V3pleHMvQlBPakpNaW1QUXI0TlRGc1dSVWgyeVRHVnVnWStrNlExam8zcDU1?=
 =?utf-8?B?QzJzazdKZC9mSzJaRFpwZVgza21nMCtkaHBNa3ZnSFI0T2NQMDZhTFZhM0Z3?=
 =?utf-8?B?SkkyZjhoV1R5WHFjWU9xTGZ3NlBCVzZ0VTR6OWhjeURsbHJMYVpTa3p6VkZL?=
 =?utf-8?B?aGY5RFRjMjhYSklITVpVSjNvb21CVllBVWlLZ3lGMXJtL1Z5T2ZiOGQ4cHZR?=
 =?utf-8?B?cVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 791b45a1-2da7-4088-fb59-08dbeab1da9a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 16:49:40.2501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0u1a/sfLVgKbFSvGq1GI9hmXxPOiftVJTMXJLByb+EuyIIZScSIAWdeOSy9yQ3SKCbSshRrhfgygy23AryjF1uE3UkBKS/KxYv3IOjB3PFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8489
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 18/20] drm/xe/guc: Allocate GuC data
 structures in system memory for initial load
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Nov 21, 2023 at 02:42:20PM +0100, Michał Winiarski wrote:
>On Mon, Nov 20, 2023 at 02:20:22PM -0600, Lucas De Marchi wrote:
>> On Tue, Nov 14, 2023 at 02:02:29PM +0100, Michał Winiarski wrote:
>> > GuC load will need to happen at an earlier point in probe, where local
>> > memory is not yet available. Use system memory for GuC data structures
>> > used for initial "hwconfig" load, and realloc at a later,
>> > "post-hwconfig" load, when local memory is available.
>> >
>> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/xe_guc.c     | 45 +++++++++++++++++++++++++++++++++
>> > drivers/gpu/drm/xe/xe_guc_ads.c |  2 +-
>> > drivers/gpu/drm/xe/xe_guc_ct.c  |  2 +-
>> > drivers/gpu/drm/xe/xe_guc_log.c |  2 +-
>> > 4 files changed, 48 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> > index d1181ddf4bdae..3f430d5bc1051 100644
>> > --- a/drivers/gpu/drm/xe/xe_guc.c
>> > +++ b/drivers/gpu/drm/xe/xe_guc.c
>> > @@ -251,6 +251,45 @@ static void guc_fini(struct drm_device *drm, void *arg)
>> > 	xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
>> > }
>> >
>> > +static int __guc_bo_reinit(struct xe_guc *guc, struct xe_bo **src)
>> > +{
>> > +	struct xe_tile *tile = gt_to_tile(guc_to_gt(guc));
>> > +	struct xe_device *xe = guc_to_xe(guc);
>> > +	struct xe_bo *bo;
>> > +
>> > +	bo = xe_bo_create_from_data(xe, tile, &(*src)->vmap.vaddr, (*src)->size, ttm_bo_type_kernel,
>>
>> in general we should not access a iosys_map like that. Maybe add an
>> assert above this line:
>>
>> 	xe_assert(xe, !(*src)->vmap.is_iomem);
>
>Makes sense - I'll add the assert.
>
>>
>> > +				    XE_BO_CREATE_VRAM_IF_DGFX(tile));
>>
>
>> humn... maybe we are missing a XE_BO_CREATE_VRAM(tile)?
>
>It's only called for "IS_DGFX", so I think we're fine for now.

but that was the point... checking IF_DGFX() everywhere, including
code paths we should only be at for dgfx seems wasteful. Anyway, this is
independent from this patch and something that can be done later.

Lucas De Marchi

>
>Thanks,
>-Michał
>
>>
>> Lucas De Marchi
>>
>> > +	if (IS_ERR(bo))
>> > +		return PTR_ERR(bo);
>> > +
>> > +	xchg(src, bo);
>> > +	xe_bo_unpin_map_no_vm(bo);
>> > +
>> > +	return 0;
>> > +}
>> > +
>> > +static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
>> > +{
>> > +	int ret;
>> > +
>> > +	if (!IS_DGFX(guc_to_xe(guc)))
>> > +		return 0;
>> > +
>> > +	ret = __guc_bo_reinit(guc, &guc->log.bo);
>> > +	if (ret)
>> > +		return ret;
>> > +
>> > +	ret = __guc_bo_reinit(guc, &guc->ads.bo);
>> > +	if (ret)
>> > +		return ret;
>> > +
>> > +	ret = __guc_bo_reinit(guc, &guc->ct.bo);
>> > +	if (ret)
>> > +		return ret;
>> > +
>> > +	return 0;
>> > +}
>> > +
>> > int xe_guc_init(struct xe_guc *guc)
>> > {
>> > 	struct xe_device *xe = guc_to_xe(guc);
>> > @@ -309,6 +348,12 @@ int xe_guc_init(struct xe_guc *guc)
>> >  */
>> > int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>> > {
>> > +	int ret;
>> > +
>> > +	ret = xe_guc_realloc_post_hwconfig(guc);
>> > +	if (ret)
>> > +		return ret;
>> > +
>> > 	guc_init_params_post_hwconfig(guc);
>> >
>> > 	return xe_guc_ads_init_post_hwconfig(&guc->ads);
>> > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>> > index 88789826e7817..88514d09303d0 100644
>> > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>> > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>> > @@ -282,7 +282,7 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
>> > 	bo = xe_bo_create_pin_map(xe, tile, NULL, guc_ads_size(ads) +
>> > 				  MAX_GOLDEN_LRC_SIZE,
>> > 				  ttm_bo_type_kernel,
>> > -				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
>> > +				  XE_BO_CREATE_SYSTEM_BIT |
>> > 				  XE_BO_CREATE_GGTT_BIT);
>> > 	if (IS_ERR(bo))
>> > 		return PTR_ERR(bo);
>> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> > index a84e111bb36ad..8f190cc0e5527 100644
>> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> > @@ -148,7 +148,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>> >
>> > 	bo = xe_bo_create_pin_map(xe, tile, NULL, guc_ct_size(),
>> > 				  ttm_bo_type_kernel,
>> > -				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
>> > +				  XE_BO_CREATE_SYSTEM_BIT |
>> > 				  XE_BO_CREATE_GGTT_BIT);
>> > 	if (IS_ERR(bo))
>> > 		return PTR_ERR(bo);
>> > diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
>> > index 45c60a9c631c3..6334311a56e63 100644
>> > --- a/drivers/gpu/drm/xe/xe_guc_log.c
>> > +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>> > @@ -93,7 +93,7 @@ int xe_guc_log_init(struct xe_guc_log *log)
>> >
>> > 	bo = xe_bo_create_pin_map(xe, tile, NULL, guc_log_size(),
>> > 				  ttm_bo_type_kernel,
>> > -				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
>> > +				  XE_BO_CREATE_SYSTEM_BIT |
>> > 				  XE_BO_CREATE_GGTT_BIT);
>> > 	if (IS_ERR(bo))
>> > 		return PTR_ERR(bo);
>> > --
>> > 2.42.1
>> >
