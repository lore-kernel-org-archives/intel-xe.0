Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A84FE8FDC3
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 02:38:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A926C10E084;
	Wed,  4 Oct 2023 02:38:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA3A110E084
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 02:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696387085; x=1727923085;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OPCor8CkaK1KH2iI5J0RB6EPKD3R5t5ErMKgmYoN/PE=;
 b=HNqUGBcShYYox7F5o7Ixuey+qI3Wrbs1oJOeT3YNasuXI+z9X3OK4j82
 kl0mIslnc35lCz4a1cZqV0GQX7zJTBy9/en8tLEUYsg+B1qLdR+FTTEor
 ZQ/5Dj0QTEtgn//IWpQW7UMgEjNmhV8gECuH9Frhx/E2B4nhCEzCdrGK5
 UoIsQQAF4Lv4/QBvIJRNB5mXxgU6jXG/Y/hnvZqlF34Jo3BVZVbw5eYna
 hDX3PkzFPQi9K3H5isgaCq5Lb2h4SfL78BRiNbw/MNn2tBtrsk9Ch//MG
 s7hHuKk0MmHIWjowNglZoMCvz2qxmFsXPHA/BBP6/3uNcekmoRA8KfZhu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="381900145"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="381900145"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 19:38:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="924874573"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="924874573"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2023 19:38:05 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 3 Oct 2023 19:38:05 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 3 Oct 2023 19:38:04 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 3 Oct 2023 19:38:04 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 3 Oct 2023 19:38:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JyPN7BKIySdAV+3tOlslEseuJG9n48+XEKmGHJgqpqMUnZpZQorz+TfoisBFaMhE1aZjiwXHrNGrORBe8ehMIuD5gglRupapL3pvqIa2/Xr55wYrKARlD3ZfB7gvgtUSUbgb0wj3fXHYW6MMEwoQCNKHJHjmyXuwJBIQ41k+su/U7wqC2Wvkylql3CnHwAY9aJVdRdvTbI4dEduZVH7hoMWExwsZWNZ7yCDWT6XOjGHKL3BYsUTelQRdb3mTiAl+PFbM+/c9O2V/sYBeC7eydp9nywS1yr6vVmSEhPOEaHxgaZBo2XFOptDvSGNScODdNcwhffyS+tDTwHOMeqim8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSkjeg3e3PZLYh3IQnnDWh2J+2gxy55guC/LZKVPStI=;
 b=imut62r2IsL+je0kx+a8g9MrGce5/EAgFQL69cKE2Ca7ir2giSC0WUrSMIDZr4s/Z3fD3s5boPN7vpJi5u/f6Esm4qpLWVVihVdsjQ5vDi58clKeuonN6iW7rB0iqaVivPShECGsuTUH27UIY2eO6082vVVmEdUlwnZVcqEe0p7M47v1Efa7oMDaDStIQ9UL8gtY0b+uykQU4ZX4ncR6eCxMhigH/3yvBfk2m1kT1n2CJUxa2Z6NWHjhzJz5JjaJRN+4X0NnGQHJp5G1DVlxyAKe3o2b9Rih9oaQH0qc+hZ1hYWtO8c9+wbEv+YvmDAOdThYDxx6l9PFm5wLPYo1nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 SN7PR11MB7540.namprd11.prod.outlook.com (2603:10b6:806:340::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.28; Wed, 4 Oct 2023 02:38:01 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::8d1:d53c:a9f7:852b]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::8d1:d53c:a9f7:852b%3]) with mapi id 15.20.6838.033; Wed, 4 Oct 2023
 02:38:01 +0000
Date: Tue, 3 Oct 2023 19:37:58 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Message-ID: <ZRzQBuqFTbPenC1n@unerlige-ril>
References: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
 <20230919161049.2307855-20-ashutosh.dixit@intel.com>
 <87fs3axfia.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <87fs3axfia.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY3PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:a03:254::18) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|SN7PR11MB7540:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b80fa96-614f-4efd-23a1-08dbc482ed80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qzzUoP2fk4IBpVeyvmd/0NMbc+IrNi85W9BqlSD+pUKMOql4g8W4xyV8/qBVqbLHCy6jhTrdWg/1KjJqszq/mgmsGZpoWC7p1gbeAa4fa7+xhBhOfibb+JreLsWwVUNBoBzEWsleDos4j/2N0vmZeAW+njmF4bqbR4aT1e2CZSrK58YYzEDgIZqIzrz3TnjQ+KYrH1QmyS3NFRN5JWlVWW4ov34Cb4/56cNnCmSHFG+IJhsH5gARfUoSTgJ6s1Cc40D6ufMPAfCMmthxFadmU2kRicWP+V885K7eGLBN7GYR/o+JX+MeL6TqGsEYRC4oUtZAA5HfDe/vNQLU2MRClkMWyI0LNibwc4pZigNTeW0NaHBJLcK3kn/BI2J7mF9Vyl01pnW3kVQNduFyi4i1MpjigycGkEPMpkQTnQLmtEA7TIX7bDeIuYn7wXfKI9wZcHRwmv668eYzg4rMfEVQiWlz90LbRut+wgubTLS5tCCyPzle8T5Vpy4t1nt2+hi9x/6ayjoJYJWPsKC1/ZvI5ZSj56TD98JL1DCZjtIddqBWPMYSTUXvpprcY1WtTyil
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(376002)(136003)(346002)(39860400002)(366004)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(9686003)(6512007)(6506007)(38100700002)(86362001)(82960400001)(26005)(6636002)(2906002)(478600001)(6666004)(6862004)(8936002)(66946007)(41300700001)(316002)(8676002)(6486002)(4326008)(5660300002)(33716001)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHBjWlNzVldmTUNOU2hEd1N4Z1BTOEZ2WnBiTkxDMVdPN0lPaTkxdHFzNlpY?=
 =?utf-8?B?cUZqTnh5RzNocDUrems5bllFeXZkUVE3dGorNmI4azMrV2FYSk9oYmlDUEF4?=
 =?utf-8?B?aEZlVFlPSXlTb3RScUMyR3psVXlPY3R4N1NPYlIzM0d4WC9kSVRqZGNGSUZM?=
 =?utf-8?B?eCs2QS8rYVNXV3hkZ0o1QzArdXRWNXN1dTlMSW9QcFovVVVjcnhBVUJqQ2Nx?=
 =?utf-8?B?NXNlMzNGdFJxMHp1WGNSamphUkhwelVDVVlGODkzR0FkVmdadHhJMHZzVFIr?=
 =?utf-8?B?bUZ4ZmgrbHQ5OGtvSkJrbDFFRHpQNWVDeHFqNldkVlFzUG00THRHaWdWemxJ?=
 =?utf-8?B?UTd0S283TmlZWnRSUVpqNHRjVjdOTndpOGEzYzRwTVF0WTQrcEwwOUl5UzlK?=
 =?utf-8?B?eFErbnJ4MWpCV3dZWXg0d0RjSlVjNEFaT2Q1WWhCekFML0lPSnZ6b1NoT1pL?=
 =?utf-8?B?TEJXdFBWaXJWQjh3bC9KWFpzeE1udGJ1ZEE1Y1MrZVNHclBna0d5Z0tMTmFy?=
 =?utf-8?B?ZU93MGdQclhwTTRMamoxUG8xT1orMHNQWTBOcEY5Rzl2d2lxRlZsN2tjSmgv?=
 =?utf-8?B?VTMrMUp5a0kzN2NIZFI2QVYyb3E5NysrR0d3aGYwSHAyVzBxSjV3aUR1VW1X?=
 =?utf-8?B?M1kxQmU0R0s3TW5uSENvY0VmeUJVemhRYkxOeDY2Z2NkNDg0N0F6ZGk1SDRE?=
 =?utf-8?B?R2lJbTk4RDhKem1NbnhOY1dmR1JxS2dyWXk0aCtUR2hXNW5oM3d5Q3F6eXll?=
 =?utf-8?B?UUR5VXA0ZUFzdlhDSko4SWJFVGRXOExBVGxCMnpIWnh1VE9UbENEWGQ2aUVR?=
 =?utf-8?B?OU10d2pRRTFHMWJmZzhqKzlwRzFObWI4MTRSdmhrYVFERFhkd2drdmlnZU1t?=
 =?utf-8?B?R09QV044VEI4YTJ4Q0FLdXdjU21TN1FNZnE1OEUwZEVTSFdWd214RndxcE43?=
 =?utf-8?B?QW1lT0xJcTAzK2hZN0ZqcmFJazlzL3pZSmRndTc5eTc2RjdvYjJ5K3hCTGJD?=
 =?utf-8?B?WmVwejFZK1VmR21PQ2pCcGt3TnNBOUtRZDJhVUZsQ0dvSGpSTzZIQnJtU2NV?=
 =?utf-8?B?U2t4aXg5b1J4RitYM1VXcS9nZ2prMy9OOWdBcUZqbW0zbnBqMkRSbHNxMmE1?=
 =?utf-8?B?L0hQV29aYjVrS3RMVEdDSGE1dUNkTUU5bTNEZzlydnVGZ1BKSGhRSUNFUFRJ?=
 =?utf-8?B?U3JXV0JYOTZhQ3lqUE04S2ZuKzlZWUFIQW8xRXlZWGJnWWVVd2p1Z2tid3pu?=
 =?utf-8?B?V2xWdng3U3Z3TFVacEpiZEZ1NkROSUxXRlJDMDZ0c1AyQ1VUenVOQzhPR2Rv?=
 =?utf-8?B?Zm5oTFpNNzk3dTluaVp4K05yODlTV3BwV0hrWXF2bE43THVHRllvK0tNditF?=
 =?utf-8?B?c1hKYjViUWVRbS8xVFBoOGpGR3BTNkppSFZic0M2ZmxhZFR5cEJhK3MyRUtx?=
 =?utf-8?B?Q1BTNFRBZVM4eHZINTJLY3Vzd1NuOHV5aG5UUGx1SWVsRDdNK1Vvb0k4czZj?=
 =?utf-8?B?WEFZSUNDTjhlT0RjK083OGNZRi80UE5hbFlhcXY1Tm9wb1FWQ0hpdkNsay91?=
 =?utf-8?B?Tm9SNkdEWDlQeVlJdlZ4cGs0MWNGTE9oSkJNOVVKVXZVR0ZlS29sWDJEYTcy?=
 =?utf-8?B?L0c0RW1vUjN1SFJPR1FSZTEwWjZhd20rT2IxdFJlYkdPMHB3R1k3bEt5WEo5?=
 =?utf-8?B?UWtwYTkxMTdPOC9nSm96YmJkQ1NiUElHbE9Qd2s2aEZBTGduWGZIeHZDVU92?=
 =?utf-8?B?ZHJIbXR5dmtMOWl4ZUdVNjZGMnpVVWEzQVA5L2RoSlhWMVlEc2U5eHl2Y2pH?=
 =?utf-8?B?UGppRjJpZkV5ZEhxWWVXUzMyQ1ZsWVcvSEc3SjVVN2hzM24xcHlIM2xkS1hI?=
 =?utf-8?B?RmJNNHdtZ2lENVp1Q05HdWNMRXprYUtSMGl4UGt3c1BnQVFoN1NPTUdIbGRv?=
 =?utf-8?B?ZVE1ZnBJOWF4dmtTTzlwWVdtRk5kVWtUQmtDRFlBTFhueTlOZFhRZnR0SFl5?=
 =?utf-8?B?VkxSQzNyWXI1bStWWk53WG5qaUZLcE05R2JRUkZsZS95bEk0cjRSaDdXMkNL?=
 =?utf-8?B?enZsYkFrUzU0Qm9rREYxVEtlTGg3Z25abVU2OEM0VUEvZjdyOHBkNWhaUjlQ?=
 =?utf-8?B?OXVxbHYzOEF5dThtSHBQOVZwRndVVXJzT1pYWGRTZktqdjk1L0s5Y1pkRzBW?=
 =?utf-8?Q?YplZbtkPMg37LOl2XcJ+adY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b80fa96-614f-4efd-23a1-08dbc482ed80
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 02:38:01.3494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MwnRH+bYchqjGap3K7saKioquXuH/DD0trCZ0z/XInYz5o+jmn52ExNn0eXF1D0i/+kZlgV+w4ZRypdNEjaT11W2zB2Bo4Vzclkwr2q8Ksw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7540
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 19/21] drm/xe/uapi: Drop OA_IOCTL_VERSION
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

On Tue, Sep 19, 2023 at 10:02:53AM -0700, Dixit, Ashutosh wrote:
>On Tue, 19 Sep 2023 09:10:47 -0700, Ashutosh Dixit wrote:
>>
>> OA version was previously used to track which OA properties were introduced
>> at which version. However OA version is an outlier in that a similar
>> version is not used anywhere else in the kernel.
>
>This is not strictly true. E.g. AMD's include/uapi/linux/kfd_ioctl.h
>contains KFD_IOCTL_MAJOR_VERSION/KFD_IOCTL_MINOR_VERSION.
>
>> For XE, we will track addition of new properties by means of
>> xe_user_extension. Userland can either maintain a mapping of OA properties
>> against the kernel version, or rely on return codes (e.g. ENOTSUPP) to
>> "discover" OA properties.
>
>But let's see if we need a version for OA or the kernel version itself is
>sufficient.
>
>>
>> Suggested-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

ok, if there is precedence for a version, no harm adding it, but I agree 
that we should see if there are ways to do this with the generic OA 
query. For features that are added with extensions, it's taken care of 
inherently. Sometimes there are features that are internal to the 
implementation that the user might want to know. Those may need to be 
exposed via capabilities/flags in the generic oa/perf query.

Umesh
>
>Thanks.
>--
>Ashutosh
