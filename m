Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7854C001B0
	for <intel-xe@archiver.kernel.org>; Mon, 14 Aug 2023 15:07:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74BA810E099;
	Mon, 14 Aug 2023 15:07:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9819A10E099
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Aug 2023 15:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692025630; x=1723561630;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wPP2VBp/BhKsxIiL0zA4ZogXflMolmRoZ6x2NuhpSDM=;
 b=G+ltzOBc7h4bgZe0ELmrLimY9hR5Nowh7UPC+IGGvO+teU62AFwqFUw0
 yBtb4TAXXbL92yOpnO8Digk7Unxr9G1j+v+k3YxmjovTCAfPchXjcctFA
 JNO3Ljxoi9yQCv9xSckuLZ8d3rPe+S6fRMKOex0eqVY29Dnd0wi6lY0zf
 B+7V8EylygEtny/an9n08N/Nq86IwnjyaAD3AaK2vsAOMM7CFHGMc8gZz
 HrG+tpSFKcbQhVOlo6SyNepEUZwlXoo7jK4w8O21Z6QAES8MPywIwKPS8
 tpVKZbqNJ8ATVtXOBo23ReyAFN7bHLC7HttRGl9BgCO7Ym0Hcns1Nim1j g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="458420543"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; d="scan'208";a="458420543"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 08:07:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="768483888"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; d="scan'208";a="768483888"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 14 Aug 2023 08:07:09 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 14 Aug 2023 08:07:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 14 Aug 2023 08:07:09 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 14 Aug 2023 08:07:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AcWl3MFYXBrCdMeKEJb3mHoRdsE0TRCcmZkCRAq+pulmA7GzguhTgbGQm0Hml9sQJjdYXXB9IxUDg5WVBSiqbk+R+D3VBWR1u/F99QMhIuyLwcTlzMy7KrhW6bF31vCDgATplh3PvAknujbWfP1UkyotU2OC5rbL+uiQtW79MIANAtyVIRAgiTnw8XnkC6peDJJe+KGgGriw93Crctryy4jGKiKCKOYL1IQ9qHIKJmuTvoDgruECPOF27sZaIlPWiVW3dAsQ4rzCIvR98UG7hDrCTWSwLa4FljQsp8FCuFAyEyAOIfv8EMC+lx4mE4ApLzPxvrIgOfTA5O+HdCO+tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cP+TcXuxH52JpZVQMVPMc3eJn/dc+TNSrFHEkzXqAvA=;
 b=kMcvr11aXh2fulzJIJ8yx2/yyzaHyY8VOLmbfJBV9NtzWLP9F6YVgZn3cDdVcuTfmM5Tcb+Fdv/FENA0xlMzxuKHAXkrBKTtj3jWBYqptEIWxWdBDh8C/ihlQqDBdB8PeHyfSCh9nsEqOW1Kb9IQhA6wXcN9al1srhhfsrY4DyMyqaAvdaoyampvjzE4txKqGYCSRVriLbU/naO265enRIg1lYb2hirIpKhA9L2NUexIS5Rt/NtDA4cdoSDYCrNXi6r2wZezA4EEedX4+g10QtM/wnZMl8D3/xpvBGOu+tnOdynN7UwZGGcO7GDLzfK9FpZj2h+UX7TIJ8MPHpLmNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SJ2PR11MB7598.namprd11.prod.outlook.com (2603:10b6:a03:4c6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 15:07:07 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::f7ed:4327:5d1a:b8fc]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::f7ed:4327:5d1a:b8fc%4]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 15:07:07 +0000
Date: Mon, 14 Aug 2023 08:07:04 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Message-ID: <ZNpDGDsAHOsRzsnq@nvishwa1-DESK>
References: <20230808182411.31354-1-niranjana.vishwanathapura@intel.com>
 <20230808182411.31354-4-niranjana.vishwanathapura@intel.com>
 <SJ1PR11MB620457BF2B85DA4195524A4F8111A@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB620457BF2B85DA4195524A4F8111A@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR02CA0070.namprd02.prod.outlook.com
 (2603:10b6:a03:54::47) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SJ2PR11MB7598:EE_
X-MS-Office365-Filtering-Correlation-Id: a0da9c49-65da-4274-acd6-08db9cd8205a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m0YmXvfp4chvbs/sH9IdEwxfptKd7aYhlpTukl9EM6Sbnv8jOuW8GvEXs1t8Am6qlztd3eKXsUkI4v3l2f11hdiNuUVIwdfAP7/GN/JHncaZTJgHldZvKn2QbivauwIjccQvcUMiQEzl0a4VAiQ2K5uGNq6sPcvT7qsAFcmFy8WuO0d466f4mQS1Ns/V6Svc/nXPpoe0Y2l5pZ5vgZ7PL+G3sPIKbOqJEQli3JNys83IA2LW0JvnUkMXod8zYzoF8EQT8kiNJIOJAAuPODNPxua3z3xHuu9rXSK0mUnoSYMMIBQ8a3LVyt5exyHxLExcMJj7cAzhJNPi2ECyd6XEyzncmY6oYJYf6OZC8wWgdZJ8VI+axUo131CpPHn98sy+wxtIQNl5myHkP74cQ6eQL2d/aEwikNTUxE/puJaxuJVNXs0cVg+4G49HycbLMzsuQ2WCxIrzDyJLoHzqn79ckWkNxeUc+XpP5CsPv+n309OhR247GloJhsjZJQXL0bKgW2gwMZLjak/xiBwlYT2eDGEN39GNZDNvwZP5J/QPvafoLsSpnSQd2qPlMiQ1xbM3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(396003)(376002)(346002)(39860400002)(136003)(186006)(451199021)(1800799006)(4326008)(8936002)(9686003)(6512007)(86362001)(478600001)(6862004)(6506007)(6486002)(316002)(8676002)(66946007)(54906003)(41300700001)(66556008)(6666004)(66476007)(33716001)(6636002)(53546011)(5660300002)(44832011)(26005)(107886003)(83380400001)(2906002)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NQzlRQVbWTz7kC077XL2Ec2jd/gkVJ7yFiHmwWYikzxhIDpud0wgc+VEYm3U?=
 =?us-ascii?Q?URpYXo2Pw+H9rmdvuSL8SFWw4xarv7Ku7yBvV/2tvPKxG9Gry8k62ZsfBP2T?=
 =?us-ascii?Q?sVRYk7UtdSW1KmIzGxnpvIXvdpcLbFDGdnB3Dm3XoUdAPRruNM/wIJcb4umY?=
 =?us-ascii?Q?zfNszlY9Vo3ZIih6hkAc2jZJGroNrWM1596PH6f+heSrVIS6tJUV63X4ir+E?=
 =?us-ascii?Q?h0CRHXsqOnJGo838q/C7NXzS6HTKDtJ/57X0fBOUiy3D/fzwPFQG3ZsjKPjC?=
 =?us-ascii?Q?aIU46kkNxsePd7uhKTxMX3co0xJgZzEy88w107NbMgNFZrciDdTTx3TcsIMC?=
 =?us-ascii?Q?jF6QjqoYjKM66TKgV4LjKiKpnxkvBR4QJwhHEfVhNkEF4xB1qg2PLZNxAt8h?=
 =?us-ascii?Q?KqZ+swzG22G1fev4YYL4EL+rwsUR1YcjWzS1jhkYVSb4WU+8DuLHbdNoaZSh?=
 =?us-ascii?Q?a6bpOqVPYLWk/18wACMA5Ayg8O129xdKf0adHdT3BCvFMpcEjUrBTfkX2cSu?=
 =?us-ascii?Q?pdgIRatxgiwG3FZllh/JYQGWGAttwgN3Jau8WgFAZLJo03HPeYSZ9tEtbhQZ?=
 =?us-ascii?Q?FHitq1mPw0ixC+yPgf0wPcblkiM+Tn3H05aH8NLYhO4akV8EHPPM00aC0ods?=
 =?us-ascii?Q?W8NvVnFN+BV2PPKilsYtVn8qajrQA5/Bf+nA1WJb7+uytl0n6n9ExXP2yVNn?=
 =?us-ascii?Q?bW47USE+fW9x39+VzyhN8ogkWujZIUaEJqUtTDLrw62gHuwnLJnvF4PQOD0k?=
 =?us-ascii?Q?Sl1JNzfpeCaKqMdUIRMoKd+ZdYLazZvJKQV7aOZpbF8jqcvyvcgEotInHmD0?=
 =?us-ascii?Q?IliyrN9NYntgbSb49nROtifc0Sx6Yy84RVynJP8WTfDQJBw0QNOKfZBLhSm3?=
 =?us-ascii?Q?Khi2WhU/SWpZKkGsshPMn1lTfsTUll7S8xGAl5d/AIvjEh9bXGk9CrcQH3Fa?=
 =?us-ascii?Q?tEi6Qt7aHoJ93dk7yh8sk6SKY+X/9se2CPS+WuusQ5ZH79xGLMtoXMxjmrmV?=
 =?us-ascii?Q?hlKdR2xYh8ttCNv17l22keLir1vN0rK4iM5Py2Ok7F5cLwuRVE5jzL/lEjxV?=
 =?us-ascii?Q?Kk3gyvDQO0A8W0QWyOYjMCve1sVq7CfZKhE3ifhDJ54ZJ1JLrgzeAskS9JDD?=
 =?us-ascii?Q?Ow8zAJ/2ur7ZzNvR/1DSbPscHtbfZ1NbRaX9PbbilUlvvwKqeQv6zd4etQ1j?=
 =?us-ascii?Q?EhLtbHjI5/ZJkQwuNFibRwiuPT5juRyDdICHb7pZ8RCf1Ihc0cCwACCc4Mpr?=
 =?us-ascii?Q?Hnkm2eVYiguyNwzp7o031QYjGKpfrW2aXtrMmkZIMoQ4rpTMMR08Zaig/XYs?=
 =?us-ascii?Q?074p1FPJioLom41Yh1QlCCjsMhW9Qd2WlEtq5191TezzeM/6gsEZ3bKAssTs?=
 =?us-ascii?Q?tPA+KHvxeE1jPMnoU65NCO1mOK3iJE5FJP2UCDEVt+9AQouYsbbmFlAYEdwl?=
 =?us-ascii?Q?xxWlThVDg2953XXPRsY6JYr2CoLQbPtcOXsr2ER0rEHH6+HSKKD0NCmCZilC?=
 =?us-ascii?Q?BhXA8lSd7yqzkkZSIMk9f4OC34Ej3lnfAUsj1Bfl8+VE2j+r49d95P4wqoMh?=
 =?us-ascii?Q?puWD+nJg7d8GyTBdajK8DmOJQ/HF6+JlyAOAxarha1ZG4djCxrpXsQbVbsyJ?=
 =?us-ascii?Q?rNJm/7uzAW4wh+c4tlrY2ms=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a0da9c49-65da-4274-acd6-08db9cd8205a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 15:07:07.3661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UqOJWvBq6XCaEdkzNXBm5imcStX1bYtviepgYdPXQAE+BYDR97g1jEYt8KsvkxjW8Ljkq0ngpr6O6Olc2572MtJT7255av/ZuZv41B/GvcqRbS0KIlM/SjoKxGElWemA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7598
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/4] drm/xe: Add
 CONFIG_DRM_XE_PREEMPT_TIMEOUT_COMPUTE
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Sat, Aug 12, 2023 at 12:08:05AM -0700, Upadhyay, Tejas wrote:
>
>
>> -----Original Message-----
>> From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
>> Sent: Tuesday, August 8, 2023 11:54 PM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Harrison, John C <john.c.harrison@intel.com>; Upadhyay, Tejas
>> <tejas.upadhyay@intel.com>
>> Subject: [PATCH 3/4] drm/xe: Add
>> CONFIG_DRM_XE_PREEMPT_TIMEOUT_COMPUTE
>>
>> Allow preemption timeout for compute engines to be specified as a config
>> option. The purpose is actually to give compute tasks longer time to reach a
>> pre-emption point after a pre-emption request has been issued. This is
>> necessary because Gen12 does not support mid-thread pre-emption and
>> compute tasks can have long running threads.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> Signed-off-by: Niranjana Vishwanathapura
>> <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/xe/Kconfig.profile | 12 ++++++++++++
>> drivers/gpu/drm/xe/xe_hw_engine.c  |  8 +++++++-
>> drivers/gpu/drm/xe/xe_hw_engine.h  |  6 ++++++
>>  3 files changed, 25 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/Kconfig.profile
>> b/drivers/gpu/drm/xe/Kconfig.profile
>> index 06742e192206..5ca3305a22b6 100644
>> --- a/drivers/gpu/drm/xe/Kconfig.profile
>> +++ b/drivers/gpu/drm/xe/Kconfig.profile
>> @@ -31,6 +31,18 @@ config DRM_XE_PREEMPT_TIMEOUT
>>  	  an arbitration point and yield to HW before the timer expires, the
>>  	  HW will be reset to allow the more important context to execute.
>>
>> +	  Value should be within the
>> DRM_XE_PREEMPT_TIMEOUT_MIN/MAX limits.
>> +	  This is adjustable via
>> XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT.
>> +config DRM_XE_PREEMPT_TIMEOUT_COMPUTE
>> +	int "Preempt timeout for compute engines (ms, jiffy granularity)"
>> +	default 7500 # milliseconds
>
>Same comment as previous patch about us unit.
>

Got it.

>> +	help
>> +	  How long to wait (in milliseconds) for a preemption event to occur
>> +	  when submitting a new context to a compute capable engine. If the
>> +	  current context does not hit an arbitration point and yield to HW
>> +	  before the timer expires, the HW will be reset to allow the more
>> +	  important context to execute.
>> +
>>  	  Value should be within the
>> DRM_XE_PREEMPT_TIMEOUT_MIN/MAX limits.
>>  	  This is adjustable via
>> XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT.
>>  config DRM_XE_PREEMPT_TIMEOUT_MAX
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c
>> b/drivers/gpu/drm/xe/xe_hw_engine.c
>> index 25bad007a85b..57a0fb50852c 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> @@ -340,7 +340,11 @@ hw_engine_setup_default_state(struct
>> xe_hw_engine *hwe)
>>
>>  static u32 get_default_preempt_timeout(struct xe_hw_engine *hwe)  {
>> -	return XE_HW_ENGINE_PREEMPT_TIMEOUT;
>> +	if (hwe->class == XE_ENGINE_CLASS_RENDER ||
>> +	    hwe->class == XE_ENGINE_CLASS_COMPUTE)
>> +		return XE_HW_ENGINE_PREEMPT_TIMEOUT_COMPUTE;
>> +	else
>> +		return XE_HW_ENGINE_PREEMPT_TIMEOUT;
>>  }
>
>Probably API in previous patch continuation of this change, but it does not make sense to introduce change in previous patch at least.
>

Responded in previous patch.

>>
>>  static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>> @@ -569,6 +573,8 @@ int xe_hw_engines_init_early(struct xe_gt *gt)
>>
>>  	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT <
>> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
>>  	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT >
>> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
>> +	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT_COMPUTE <
>> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
>> +	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT_COMPUTE >
>> +XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
>
>Can this be done shorter with,
>BUILD_BUG_ON(get_default_preempt_timeout(hwe) <
>> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
>BUILD_BUG_ON(get_default_preempt_timeout(hwe) > XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
>

No, we can't. The BUILD_BUG_ON is to detect errors during build time,
not the runtime. Any config issues must be caught during build time.

Thanks,
Niranjana

>Thanks,
>Tejas
>>
>>  	for (i = 0; i < ARRAY_SIZE(gt->hw_engines); i++)
>>  		hw_engine_init_early(gt, &gt->hw_engines[i], i); diff --git
>> a/drivers/gpu/drm/xe/xe_hw_engine.h
>> b/drivers/gpu/drm/xe/xe_hw_engine.h
>> index 582be209355b..c4f0969efc06 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
>> @@ -35,6 +35,12 @@ struct drm_printer;
>>  #else
>>  #define XE_HW_ENGINE_PREEMPT_TIMEOUT (640 * 1000)  #endif
>> +#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_COMPUTE
>> +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_COMPUTE \
>> +	(CONFIG_DRM_XE_PREEMPT_TIMEOUT_COMPUTE * 1000) #else
>> #define
>> +XE_HW_ENGINE_PREEMPT_TIMEOUT_COMPUTE
>> XE_HW_ENGINE_PREEMPT_TIMEOUT
>> +#endif
>>  #ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN  #define
>> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN
>> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN  #else
>> --
>> 2.21.0.rc0.32.g243a4c7e27
>
