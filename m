Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0D6CA0EEB
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 14:42:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD78D10E332;
	Tue, 12 Sep 2023 14:42:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F59C10E332
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 14:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694529769; x=1726065769;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iV45R/wP7A1SgTnAgAMAVjk9LflyM10YKOGp/St0jks=;
 b=ObYNXmAtUl6f2KKCDJfgliWM8/EHT4+r7hRYdBIG88oMhDc7pS2b/dG+
 1SmrCbtY0FjA8SO9bo2VgCpFrM6H0mifUbIol9qnSyBfSEcwbSiglwFuq
 M8e3Lb8MoyaGFXf6o4mCAChF/ka9lLFYsC0LYUkt6CpMjwOV7KLw38PE+
 tIVqUqCTg76+lNByd0uIzUCQt8AVPLxXM+auf2KVuJFkDKagrRejf/jI0
 +v+MZoFJVb++7WtXzFfkYKVipoIgqEaHypYdeFlUT7nIQtkNtBAuINQbP
 tbePvu1ahqY+R0WL41bv1KUoMdFwQBtyftiB1rinhQKTN14w/hQuhWmOB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="377309301"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="377309301"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 07:42:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="858830619"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="858830619"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2023 07:42:48 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 07:42:48 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 07:42:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 12 Sep 2023 07:42:47 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 12 Sep 2023 07:42:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LutlcV0b5PyHg2bZflkFl/v/XwVs2NIduTLEYpKJSv0CL66hHDfExpizu8bDJt46Bx9TKCdcLp3cOYcH0tyuqp5hGhY7MuTqwq5ZNkSeikJd65DdfXe72kLXr9smGo5GwbDmjU+bTpvnZbRUEvyyaWtNkjnOb6SbN5agvEmpVdBdTCbwtogk93+OtYa5WX/nMxsLotKEtzOfGEwZYC88zK3ZB5F3fXK77qQ//pC2nkZDlqxGUZUeAL/dv55SW01HBl40s7NIY3JZRpZ6CbmpgfwEu/oxcExDuajx0X+JWB9LrVlPFbrr/AbNUBMLatEFfbK5XNb1zE8NH6+H610qNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J5ZGlDN7gryfyJh+4jYzHN8nQu1lqeYx8/VkGx+mHco=;
 b=Wvu9pMGqbUUNegBd7KrPaFzZ+KYT4NyQPEkXpUyUwpghqbsB39QMvu/7N4+WGVZqzzsZ8NcGE5lD3HMCOle+7DudGRiT3z4WPd+BNFCkIiA92SBi6XvTWD431ileR/etfp+FgG3vPIVzqeuVRx8QYS4T4DcUIzQ0cNFsvPNbiKXJ16Tf/2d1f4BpQqCCQu1HyL0hosnPmUwwTGn8kXZwhQQrWB8JCNf2l7bEnS5ijJDUNLrvHi69fwnS09cVnKLxJovKsH8uQpN5huUicckUQxmKobzOOD9q9udufYRCAXkrAg2h90i60H5jlV2TgwXOZ+YkyRvX0u+TwrkQKoNvoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW3PR11MB4715.namprd11.prod.outlook.com (2603:10b6:303:57::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Tue, 12 Sep
 2023 14:42:46 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 14:42:46 +0000
Date: Tue, 12 Sep 2023 09:42:41 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ofir Bitton <obitton@habana.ai>
Message-ID: <oglhtekjfa3i2mfbfks4peoc4ap2y4yvflwsf5ri2za2jvrcsy@ttkz4mxz6xwr>
References: <20230907193515.7-1-francois.dugast@intel.com>
 <ef36eb06-d65b-6ad4-ac4f-f1fb2ba7a544@habana.ai>
 <tl37n5qledvt7yxce5sl4byon6puewxvs3ymfebsndnolwstg3@3fjfvpuzna5b>
 <fede72f2-e542-8308-fcb4-ad37ae058154@habana.ai>
 <20230912002541.GD2706891@mdroper-desk1.amr.corp.intel.com>
 <23515ffe-c397-21a9-94b5-e28f5b26fd64@habana.ai>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <23515ffe-c397-21a9-94b5-e28f5b26fd64@habana.ai>
X-ClientProxiedBy: BYAPR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:a03:40::37) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW3PR11MB4715:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ce2bb22-863c-44fb-f813-08dbb39e8709
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5eetMbmW/20q+dGqHUqDcygZR0vDS1c1uvLhtyfAiYzWM97AQQRXIKkKSU546M2AkoxF9GxwP09EUVo1NSZFHzNO6p8vY2vhlLKk3Lw815pvTRWe5Y53+hxWjrHZRiJWz2tYT4OPOSz/J6JImwnDWj1v8o2xOvCVnB3c6RyGb1TQvXcVVEUoV6LOMACPxYbKeZy8mbqnyixRbFFIcvgxz39SAQ7Ni40DFiPwQLEUyLHwY+U2kTJoEsnCxOd/3IdryIpGfX7KjF6fsMfCJfQ56Bqu5qucjjvOiWa8sIdDrDcm5jx4mQHQIeVb+UlL+9ZXqpOA0/o0QOhBx3M43p9nAfMM3/LuwGwjjnUK+qlZxCVbZRoaIbBlSiWwRIdWyEctTm4PYCQOmxg0obGauky4H9beRg1k6ksdEUMDSP3XLyWTBUOmLk+bsPJkwA9mTegJhGw5u0qojGJivsOttB4vGaNv1dskqNLnxNvPGSYgRSNnsqEwngS0HXaTT6OTfxSx7G3Scc3gfclGb+Cpstdp/hayz2L+5jQWcmpp8gz7cbMRA0dPD5WJchJEZOG1AptWsGbCycIzYyTSoTb5GJ6jcA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(366004)(39860400002)(136003)(376002)(346002)(1800799009)(186009)(451199024)(38100700002)(82960400001)(86362001)(316002)(8936002)(41300700001)(5660300002)(966005)(66476007)(66556008)(66946007)(6916009)(8676002)(4326008)(54906003)(33716001)(9686003)(2906002)(30864003)(6512007)(53546011)(6666004)(478600001)(83380400001)(6486002)(26005)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SBKZ8U7oivCY1eEaSyyMusfDzSpvc73Sl+GFl5vDsvq+fpSxfyub7H2jthLV?=
 =?us-ascii?Q?SbQ4YTYdk3x2XOMl9uiLIu19z1yTAzEgCVX31MYyoSD+onEKrxVuAqtCXA6y?=
 =?us-ascii?Q?VsBqU9iX3d6gNk0pGHCBfyN0TkOj8LNQD4dzlK1AKQof6X0ZhBQFLXs4IUk9?=
 =?us-ascii?Q?t6sYHHiwX8xzymbmUqcPaZFE5b3h35mtl5o0mtN52nJ0TGV0AEJ8/w2njFr1?=
 =?us-ascii?Q?bo9+7MfTPP6G2fdPRetciTvEk/tBHKqCsqRo5+/UPAUFa4RbByCZh4ZD06FM?=
 =?us-ascii?Q?GB3AVd+SpfLcsAELBw02DcJU/ZfMERVYizk43i98liYBSq0cokQvadKEFlw7?=
 =?us-ascii?Q?lYppJFrUg+SXE1rc+QgpplwR6Z3vsd23DEdNbYrEhxTfVVppKP7qq5fkWpHf?=
 =?us-ascii?Q?yoHH/lNRwvNPOediBfMYVwGejNKaEfLlk7F3VBWIer1Ey76D+/XeM0qQy8WD?=
 =?us-ascii?Q?KZSZRidiZDBE4hI9grMMemMNtcWR8fQzKYKxXKE/h2UsLv4vQLcBIDvBO3qH?=
 =?us-ascii?Q?hAP45SUshxBFCpFE7fW/dRZW3QcEOICklmyv6E3pgmJYcKM7ZATfS4Oulzk2?=
 =?us-ascii?Q?ijUQt0iD/nto4vdy5SrsnkcaGj1rVdVTkeI/ob6OcgD/BTGHesbWnPI+cDTy?=
 =?us-ascii?Q?xiF0ynr9l1P65+ZG+luCd+5ZqYPxLGx3Q1/b9juTic6qtbBEttWFj6YEcd+K?=
 =?us-ascii?Q?ArNGQtwdVAN9i8fhgw3IQe6OElrhs/9s2EvVpcWXp58qQTPpAcQjiUzgqe/6?=
 =?us-ascii?Q?6rG1ELKSeXOcK3hmi3pIs5ehVqvVyClrzlC5UbTNwdQN2Vh1udjIel6AWzfh?=
 =?us-ascii?Q?PF6YBfrcl34Fap+zs498N8HJ3hYvkNp6uhGkODvFk0uNtpwZmkFflxqGim6x?=
 =?us-ascii?Q?zKSGWRRnwAjkiRgoZp9UUfSSXIDdEue7ql8yGgiA4BzQoUkxJCYVulxBFJxs?=
 =?us-ascii?Q?HqGT8yqWOC+xwxG7J/nkhpf2k2+LFfOOgBERpIUHHPZtB3Kll57VkZn5E4t5?=
 =?us-ascii?Q?tRMyGHtcz/lfJ4ipazrmPik6w5dXaXKiqLv+mYsCzmYKltTQQWIzURO1jxAM?=
 =?us-ascii?Q?NpSN3su9jzPB4oXsspsUh+c5n3FJYEEZCmvaiklChBCmPiqPDfI5sOsvCqSu?=
 =?us-ascii?Q?3HpEwdKrMFY3zPqUDNQ07ex1szfs0yb2gc4c+pw9bzQyZl7shYRrFutYT9SL?=
 =?us-ascii?Q?zr4p2tDhiAzPCCSDYjCMzjVpgPHa3G+4lS4G6m2ItjTpw50UI4cUKW5Jzl89?=
 =?us-ascii?Q?Don6xENeu2J1k95neMjKad7hLW91y06i4TpzBTQqtK65Aq+F9sUFZlpP0gYC?=
 =?us-ascii?Q?oL/cYyapZf9kRSYkieRaL2k10kynPAHInlGt0QTdwCxcHVH6/iNyovjDYJ7G?=
 =?us-ascii?Q?NrvaVRwUkfDKQzHfmjfiRrtl5SakRZPdGBGl5pApkTyw0Cbs31J4ENyMDw7+?=
 =?us-ascii?Q?fdUoCA748pFBVnrJ1dariCWSaBjDHnZLOmwu0Q9GicvioSA7mhm0dABmy5KJ?=
 =?us-ascii?Q?JPa5hVvbZZdkeAFkid4JzYalIg+VugTY+46xN9ZMeLoNUi6S/8ih7MZcGyI0?=
 =?us-ascii?Q?ZqENXyt510A0mdrlzofjA2avxFZCPhJv5Qxbu1nqRNVsupb6trisTYflfhKi?=
 =?us-ascii?Q?Vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ce2bb22-863c-44fb-f813-08dbb39e8709
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 14:42:45.7524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UaDpshRqnB4TBRj/5OyzXWwfpWMHI1Nute9UNxFgK53JWd8s4KiBj/eASk12RoO4OhNbYkYga9u1WVAT6AeVKRbpVhQaJK5r6nwAOYiB0CU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4715
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/uapi: Remove MMIO ioctl
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
Cc: "Dugast, Francois" <francois.dugast@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 12, 2023 at 03:43:06AM -0500, Ofir Bitton wrote:
>On 12/09/2023 3:25, Matt Roper wrote:
>> On Mon, Sep 11, 2023 at 04:21:37AM +0000, Ofir Bitton wrote:
>>> On 11/09/2023 6:45, Lucas De Marchi wrote:
>>>> On Sun, Sep 10, 2023 at 04:34:24PM +0000, Ofir Bitton wrote:
>>>>> On 07/09/2023 22:35, Francois Dugast wrote:
>>>>>> This was previously used in UMD for timestamp correlation, which can now
>>>>>> be done with DRM_XE_QUERY_CS_CYCLES.
>>>>>>
>>>>>> Link:
>>>>>> https://lore.kernel.org/all/20230706042044.GR6953@mdroper-desk1.amr.corp.intel.com/
>>>>>> Closes:
>>>>>> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/636
>>>>>> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>>>>>> ---
>>>>>>    drivers/gpu/drm/xe/xe_device.c |   1 -
>>>>>>    drivers/gpu/drm/xe/xe_mmio.c   | 102 ---------------------------------
>>>>>>    include/uapi/drm/xe_drm.h      |  31 ++--------
>>>>>>    3 files changed, 4 insertions(+), 130 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_device.c
>>>>>> b/drivers/gpu/drm/xe/xe_device.c
>>>>>> index 109aeb25d19c..10fa1b55578a 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>>>>> @@ -107,7 +107,6 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>>>>>>        DRM_IOCTL_DEF_DRV(XE_EXEC_QUEUE_DESTROY,
>>>>>> xe_exec_queue_destroy_ioctl,
>>>>>>                  DRM_RENDER_ALLOW),
>>>>>>        DRM_IOCTL_DEF_DRV(XE_EXEC, xe_exec_ioctl, DRM_RENDER_ALLOW),
>>>>>> -    DRM_IOCTL_DEF_DRV(XE_MMIO, xe_mmio_ioctl, DRM_RENDER_ALLOW),
>>>>>>        DRM_IOCTL_DEF_DRV(XE_EXEC_QUEUE_SET_PROPERTY,
>>>>>> xe_exec_queue_set_property_ioctl,
>>>>>>                  DRM_RENDER_ALLOW),
>>>>>>        DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>>>>>> index 3ccc0af4430b..e636e3f3456d 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>>>>>> @@ -422,108 +422,6 @@ int xe_mmio_init(struct xe_device *xe)
>>>>>>        return 0;
>>>>>>    }
>>>>>>
>>>>>> -#define VALID_MMIO_FLAGS (\
>>>>>> -    DRM_XE_MMIO_BITS_MASK |\
>>>>>> -    DRM_XE_MMIO_READ |\
>>>>>> -    DRM_XE_MMIO_WRITE)
>>>>>> -
>>>>>> -static const struct xe_reg mmio_read_whitelist[] = {
>>>>>> -    RING_TIMESTAMP(RENDER_RING_BASE),
>>>>>> -};
>>>>>> -
>>>>>> -int xe_mmio_ioctl(struct drm_device *dev, void *data,
>>>>>> -          struct drm_file *file)
>>>>>> -{
>>>>>> -    struct xe_device *xe = to_xe_device(dev);
>>>>>> -    struct xe_gt *gt = xe_root_mmio_gt(xe);
>>>>>> -    struct drm_xe_mmio *args = data;
>>>>>> -    unsigned int bits_flag, bytes;
>>>>>> -    struct xe_reg reg;
>>>>>> -    bool allowed;
>>>>>> -    int ret = 0;
>>>>>> -
>>>>>> -    if (XE_IOCTL_DBG(xe, args->extensions) ||
>>>>>> -        XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>>>>>> -        return -EINVAL;
>>>>>> -
>>>>>> -    if (XE_IOCTL_DBG(xe, args->flags & ~VALID_MMIO_FLAGS))
>>>>>> -        return -EINVAL;
>>>>>> -
>>>>>> -    if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_MMIO_WRITE) &&
>>>>>> args->value))
>>>>>> -        return -EINVAL;
>>>>>> -
>>>>>> -    allowed = capable(CAP_SYS_ADMIN);
>>>>>> -    if (!allowed && ((args->flags & ~DRM_XE_MMIO_BITS_MASK) ==
>>>>>> DRM_XE_MMIO_READ)) {
>>>>>> -        unsigned int i;
>>>>>> -
>>>>>> -        for (i = 0; i < ARRAY_SIZE(mmio_read_whitelist); i++) {
>>>>>> -            if (mmio_read_whitelist[i].addr == args->addr) {
>>>>>> -                allowed = true;
>>>>>> -                break;
>>>>>> -            }
>>>>>> -        }
>>>>>> -    }
>>>>>> -
>>>>>> -    if (XE_IOCTL_DBG(xe, !allowed))
>>>>>> -        return -EPERM;
>>>>>> -
>>>>>> -    bits_flag = args->flags & DRM_XE_MMIO_BITS_MASK;
>>>>>> -    bytes = 1 << bits_flag;
>>>>>> -    if (XE_IOCTL_DBG(xe, args->addr + bytes > xe->mmio.size))
>>>>>> -        return -EINVAL;
>>>>>> -
>>>>>> -    /*
>>>>>> -     * TODO: migrate to xe_gt_mcr to lookup the mmio range and handle
>>>>>> -     * multicast registers. Steering would need uapi extension.
>>>>>> -     */
>>>>>> -    reg = XE_REG(args->addr);
>>>>>> -
>>>>>> -    xe_device_mem_access_get(xe);
>>>>>> -    xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>>>>> -
>>>>>> -    if (args->flags & DRM_XE_MMIO_WRITE) {
>>>>>> -        switch (bits_flag) {
>>>>>> -        case DRM_XE_MMIO_32BIT:
>>>>>> -            if (XE_IOCTL_DBG(xe, args->value > U32_MAX)) {
>>>>>> -                ret = -EINVAL;
>>>>>> -                goto exit;
>>>>>> -            }
>>>>>> -            xe_mmio_write32(gt, reg, args->value);
>>>>>> -            break;
>>>>>> -        default:
>>>>>> -            drm_dbg(&xe->drm, "Invalid MMIO bit size");
>>>>>> -            fallthrough;
>>>>>> -        case DRM_XE_MMIO_8BIT: /* TODO */
>>>>>> -        case DRM_XE_MMIO_16BIT: /* TODO */
>>>>>> -            ret = -EOPNOTSUPP;
>>>>>> -            goto exit;
>>>>>> -        }
>>>>>> -    }
>>>>>> -
>>>>>> -    if (args->flags & DRM_XE_MMIO_READ) {
>>>>>> -        switch (bits_flag) {
>>>>>> -        case DRM_XE_MMIO_32BIT:
>>>>>> -            args->value = xe_mmio_read32(gt, reg);
>>>>>> -            break;
>>>>>> -        case DRM_XE_MMIO_64BIT:
>>>>>> -            args->value = xe_mmio_read64_2x32(gt, reg);
>>>>>> -            break;
>>>>>> -        default:
>>>>>> -            drm_dbg(&xe->drm, "Invalid MMIO bit size");
>>>>>> -            fallthrough;
>>>>>> -        case DRM_XE_MMIO_8BIT: /* TODO */
>>>>>> -        case DRM_XE_MMIO_16BIT: /* TODO */
>>>>>> -            ret = -EOPNOTSUPP;
>>>>>> -        }
>>>>>> -    }
>>>>>> -
>>>>>> -exit:
>>>>>> -    xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>>>>> -    xe_device_mem_access_put(xe);
>>>>>> -
>>>>>> -    return ret;
>>>>>> -}
>>>>>> -
>>>>>>    /**
>>>>>>     * xe_mmio_read64_2x32() - Read a 64-bit register as two 32-bit reads
>>>>>>     * @gt: MMIO target GT
>>>>>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>>>>> index 86f16d50e9cc..6c6d1cfa415a 100644
>>>>>> --- a/include/uapi/drm/xe_drm.h
>>>>>> +++ b/include/uapi/drm/xe_drm.h
>>>>>> @@ -106,11 +106,10 @@ struct xe_user_extension {
>>>>>>    #define DRM_XE_EXEC_QUEUE_CREATE        0x06
>>>>>>    #define DRM_XE_EXEC_QUEUE_DESTROY        0x07
>>>>>>    #define DRM_XE_EXEC            0x08
>>>>>> -#define DRM_XE_MMIO            0x09
>>>>>> -#define DRM_XE_EXEC_QUEUE_SET_PROPERTY    0x0a
>>>>>> -#define DRM_XE_WAIT_USER_FENCE        0x0b
>>>>>> -#define DRM_XE_VM_MADVISE        0x0c
>>>>>> -#define DRM_XE_EXEC_QUEUE_GET_PROPERTY    0x0d
>>>>>> +#define DRM_XE_EXEC_QUEUE_SET_PROPERTY    0x09
>>>>>> +#define DRM_XE_WAIT_USER_FENCE        0x0a
>>>>>> +#define DRM_XE_VM_MADVISE        0x0b
>>>>>> +#define DRM_XE_EXEC_QUEUE_GET_PROPERTY    0x0c
>>>>>>
>>>>>>    /* Must be kept compact -- no holes */
>>>>>>    #define DRM_IOCTL_XE_DEVICE_QUERY        DRM_IOWR(DRM_COMMAND_BASE
>>>>>> + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
>>>>>> @@ -123,7 +122,6 @@ struct xe_user_extension {
>>>>>>    #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY
>>>>>> DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct
>>>>>> drm_xe_exec_queue_get_property)
>>>>>>    #define DRM_IOCTL_XE_EXEC_QUEUE_DESTROY
>>>>>> DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_DESTROY, struct
>>>>>> drm_xe_exec_queue_destroy)
>>>>>>    #define DRM_IOCTL_XE_EXEC             DRM_IOW(DRM_COMMAND_BASE +
>>>>>> DRM_XE_EXEC, struct drm_xe_exec)
>>>>>> -#define DRM_IOCTL_XE_MMIO            DRM_IOWR(DRM_COMMAND_BASE +
>>>>>> DRM_XE_MMIO, struct drm_xe_mmio)
>>>>>>    #define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY
>>>>>> DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct
>>>>>> drm_xe_exec_queue_set_property)
>>>>>>    #define DRM_IOCTL_XE_WAIT_USER_FENCE
>>>>>> DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct
>>>>>> drm_xe_wait_user_fence)
>>>>>>    #define DRM_IOCTL_XE_VM_MADVISE
>>>>>> DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
>>>>>> @@ -883,27 +881,6 @@ struct drm_xe_exec {
>>>>>>        __u64 reserved[2];
>>>>>>    };
>>>>>>
>>>>>> -struct drm_xe_mmio {
>>>>>> -    /** @extensions: Pointer to the first extension struct, if any */
>>>>>> -    __u64 extensions;
>>>>>> -
>>>>>> -    __u32 addr;
>>>>>> -
>>>>>> -#define DRM_XE_MMIO_8BIT    0x0
>>>>>> -#define DRM_XE_MMIO_16BIT    0x1
>>>>>> -#define DRM_XE_MMIO_32BIT    0x2
>>>>>> -#define DRM_XE_MMIO_64BIT    0x3
>>>>>> -#define DRM_XE_MMIO_BITS_MASK    0x3
>>>>>> -#define DRM_XE_MMIO_READ    0x4
>>>>>> -#define DRM_XE_MMIO_WRITE    0x8
>>>>>> -    __u32 flags;
>>>>>> -
>>>>>> -    __u64 value;
>>>>>> -
>>>>>> -    /** @reserved: Reserved */
>>>>>> -    __u64 reserved[2];
>>>>>> -};
>>>>>> -
>>>>>>    /**
>>>>>>     * struct drm_xe_wait_user_fence - wait user fence
>>>>>>     *
>>>>>
>>>>> I would prefer to keep this ioctl for debug, or an equivavlent
>>>>> alternative. We can remove the timestmap part but keep the general mmio
>>>>> ioctl interface for 'CAP_SYS_ADMIN' access only.
>>>>> Any objections?
>>
>> Well, one general roadblock is that the DRM subsystem rules don't allow
>> adding ABI without a real, open-source userspace consumer.  Not only do
>> we not have a "real" consumer for this ioctl itself, but we also don't
>> even want to give anyone the impression that we have a backdoor
>> interface to allow non-opensource userspace to go behind the driver's
>> back and start controlling the hardware.  Userspace can still obviously
>> do that by running as root and mapping the BAR directly, but they're not
>> using official driver uapi at that point, and there are potentially
>> other ways that a sysadmin can close those holes if necessary.
>
>Hey Matt, I totally undesrstand your concern, I might have another
>suggestion. We can create another FD in debugfs and move this ioctl
>there (I can take ownership on this), This way ABI is not an issue.

an interface in debugfs would be better than keeping the ioctl.
We seem to have some consensus now to go ahead and remove this.

	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Please record the Acked-by from UMD when you get them and before
merging.  And we will also need to change IGT ahead of merging this.


thanks
Lucas De Marchi


>
>>
>>>>
>>>> CAP_SYS_ADMIN can already map the bar and do the reads and
>>>> writes. What's the benefit of going through the kernel?
>>>>
>>>> Lucas De Marchi
>>>>
>>>>>
>>>>> Ofir
>>>
>>> Some register read/write requires driver involvement, for example
>>> disabling clock gating or going through a register gateway.
>>> In addition, if a user would like to access directly through the bar he
>>> will need to be aware of the exact bar mapping. It is preferable that
>>> the user will be able to ask for read/write from/to a specific MMIO
>>> address and the driver will map it to the proper offset in bar.
>>
>> Are you using the term "user" to describe the userspace _software_ or
>> the person sitting at the computer?  If the latter, then we don't need
>> this ioctl at all; the "intel_reg" tool from IGT has provided this kind
>> of functionality on i915 for years; it's a simple command-line tool that
>> can be used with commands like:
>>
>>          intel_reg read 0x1234
>>          intel_reg write 0x5678 0xabcd
>>
>> The tool uses libpciaccess under the hood to map the BAR, and can
>> perform other necessary pre/post operations (like grabbing releasing
>> forcewake to make sure the register is accessible).
>
>By 'user' I do mean userspace process. Intel_reg tool can work but it
>has its own limitations.
>
>>
>> If you're using "user" to refer to the userspace _software_ (e.g., IGT's
>> xe_reg debug tool which is using the ioctl right now), then there's even
>> more incentive to move away from the ioctl --- the ioctl interface we
>> have today already has a bunch of limitations that make it less useful
>> than it should be for debugging:
>>
>>   * There's no way to specify/access registers on non-tile0.
>
>I am aware, I will add support for multi-tile devices.
>
>>   * There's no way to specify that you do/don't want it to do the "extra"
>>     steps like you describe (e.g., automatically grabbing forcewake is
>>     convenient a lot of the time, but if you're actually trying to debug
>>     forcewake itself, then the ioctl's automatic behavior just gets in
>>     your way).
>>
>
>Understood, for these kind of debugs the mmio ioctl is irrelevant.
>
>> While the ioctl could theoretically be extended to overcome these
>> limitations, we still shouldn't really be building up ABI like that for
>> debug purposes without real userspace consumers, especially if we have a
>> viable alternative that's been used for a long time.  It's relatively
>> simple for tools like intel_reg and xe_reg to just use libpciaccess to
>> map the BAR, figure out the appropriate offset, and then optionally
>> perform other operations (like forcewake) according to whatever options
>> were passed on the command line.  With debug tools it's especially
>> likely that we'll come up with new behaviors that we want to add (e.g.,
>> handle display register accesses via msgbus transactions on MTL/LNL?)
>> and it would be better if we didn't need to keep extending the ioctl
>> uapi and ABI for these debug-only purposes).
>
>I agree we need an interface that will not be obligated to any ABI as
>this is for pure debug, so we are left with 2 options:
>1. My suggestion to create a debugfs FD and use the ioctl there.
>2. Move code to innersource
>
>I prefer option #1 as the latter will not be available for customers who
>uses the opensource driver.
>
>Ofir.
>
>>
>>
>> Matt
>>
>
