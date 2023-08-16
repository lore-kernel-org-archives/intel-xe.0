Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 906CBC04A6A
	for <intel-xe@archiver.kernel.org>; Wed, 16 Aug 2023 16:41:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9F910E388;
	Wed, 16 Aug 2023 16:41:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7206B10E388
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Aug 2023 16:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692204093; x=1723740093;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lgZodtlPuDlqaADn5xIgtccPeCLxfIYReYlR4Cogxf4=;
 b=aMVbeCtFCf0xo/tjbPV/NDT62YKXVsB2Apj0lB47LLhJ2EsliqBP6gYs
 o6JyFDiAnfMfunqb/UdHkd4YIeLfrBtTO8VMIfQ980oOpEBU4xi9jsYmp
 vKh0UkKU5pfDMCnFH/VZeuxT7ChNeW9hyBHYlXSZEKclWim0m4QTsM3+a
 OdGdKSiZpRixZRdybHmnU0B0fFw8UjExPUPAajivDwdNjPX5K1Tyal5Sw
 w0sKbJm3Yfkyc1hn614kaMyYnQviShDhHxYBl/zWXCNbRonPMPUhstvzJ
 yPQSjzGFIz8fUpaMTp7+yU1cY2OvwIbJCZ3FF9/n1CH9+aQbn3V8m+QGb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="438933187"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; d="scan'208";a="438933187"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 09:41:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="804289900"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; d="scan'208";a="804289900"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP; 16 Aug 2023 09:41:14 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 09:41:14 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 09:41:14 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 16 Aug 2023 09:41:14 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 16 Aug 2023 09:41:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g00cj9KkC882Sa0EBwlJpKc+3jJ6bAtZ18PEDsVp1efak2SlqVLnjRBHElh+Y4+qZgPNpso9uP6PBl4pGBIAoi9AYRM960/niNoRq3tHjrxEOf/WoJFOp6lUS+7PqwFuWcGWQvzOKPpSRf+nSw3MJ5lpHDAKM9M2+iv4Mx9fhYzNPXl/8CSx3gYw+p/MeTWbAPFV50qBL0A5zaTCoy+ZPcd99fTeAFGnIn/s96zKIz2L8mL+UPW3d+glERIE79wLuUq/tjJx88Psy90a3XMjIy4UVxkly8sGluBHwYsTiibjlPVuBTOix7grJtN6Ae5enqnVlX1RjZhPdQlmJ0W7NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Np4VKGtWoFGs/X+1RKRPR6tqpzh7+QlpYkKUqSMspZ8=;
 b=GS2zwV7+LX8xw1srWjXJqU2yzi3MkGO94vSVR+NklhXJoKlaXhftOLJrD4IUiEiz8pqZMYuiZ84yirJd0aVJiA4lZAWZCVl8gW+6ftYbNDH0v6ZYHFNECycXTw3ptiyjiaeLPuvGbvFCXzbhCfsoud64UCsX5oh5UVmNdZhNsS0zpYu5hD+CiUPTm1aHFv48OVBeI8DWiq8BDKS32ggi60a+QMakZu5mmARJ4iG2bi9KM8k3rP31Lh8KqeEvUiqn+9hS2u1gT0sqH0+Z9ZVzDl6rxOyB2p5BPeK5UYyCTxV6zAQFvxV9+TxqlG25ami9DF0JuelU9L6h8Ndwf6ODiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SA2PR11MB4857.namprd11.prod.outlook.com (2603:10b6:806:fa::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Wed, 16 Aug
 2023 16:41:12 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::f7ed:4327:5d1a:b8fc]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::f7ed:4327:5d1a:b8fc%4]) with mapi id 15.20.6678.025; Wed, 16 Aug 2023
 16:41:12 +0000
Date: Wed, 16 Aug 2023 09:41:04 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Message-ID: <ZNz8IBw8+83D6ifU@nvishwa1-DESK>
References: <20230816115238.2340-1-niranjana.vishwanathapura@intel.com>
 <20230816115238.2340-3-niranjana.vishwanathapura@intel.com>
 <439234fc-4dcc-4f60-b71e-32e1be96d1b5@intel.com>
 <ZNzx/8KeURxfO8ue@nvishwa1-DESK>
 <1b3fa46f-8aca-46ee-bee9-2465881f98e3@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1b3fa46f-8aca-46ee-bee9-2465881f98e3@intel.com>
X-ClientProxiedBy: BY3PR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:a03:254::25) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SA2PR11MB4857:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f400b74-816d-44ad-ea1a-08db9e779977
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TxZNz6nMIVKPIx2g9A7Kq5C/yV8SSx2N1Dl/5GjVyHCOMDhtOXkpjL2/fhWTGi8cT8EmVdD/zr3KrWgWhxIwTE439+DhYAPjUusWswovbHev4n36dwbbPgk4vFvCBKcz759B6GKxA8lR0//mSiBT6kLCdCsbzFS4xpQ68rzOUpMB5oA4cyGrrNrhakQY+g8y66KNSQHkhfiyKGzzG3hhSsaIuZLs9wHv5NSdE1d/RW40i24rEab5WRYyYpy4H2lRYe2m1X6WbzCcXr89RocA0qtCejFxIReM/v+pntkgUh0BR1Pdr9DdzGxQEHQ34lKGHzz5gTAlKQXKxA5Uv4VUVZwkY6K81zIYq5P5CD/F2wrXFQnncZ1yGf1gYDFctdkSQLyM6OdgbhQm1E3PccqNUNzRGPNtU3g9ra5atNHBOeKhLrC3VpX5Vf7hBNfjc2SpY2HWgnDRdij6XgTyvuKuuubfkq5Fts2M8WNHt/gIZ0lCAL700T8CDH2gReyt4mYbSQXZ6m9M8UNUC9jKL8PqUVcSQ+YF2n420HGKQt/fFfBCLIo9bYtjkSFoUyS7bPn0PnZzQj0Kf1odavlt1OHZzZO/cVcRnqGQNIK/MjElcQo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(39860400002)(346002)(366004)(376002)(136003)(1800799009)(451199024)(186009)(316002)(6636002)(66946007)(66476007)(66556008)(41300700001)(5660300002)(44832011)(38100700002)(8676002)(4326008)(8936002)(6862004)(33716001)(82960400001)(2906002)(83380400001)(26005)(478600001)(86362001)(9686003)(6512007)(53546011)(6506007)(6666004)(6486002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/c6zIxC3UwApfXNJ+jQ8Vc5DwmGHFo7qTGO/765HVOLwMZsC14vA6x5u/P?=
 =?iso-8859-1?Q?bfBqYbsTeh22Ec4NxyHdcSkJYUyn5IvJZc95AMTNctdYkQcmmK9xo/36l0?=
 =?iso-8859-1?Q?3oOUeGIgWgj0oHKZ00sye6TweMRaB/D0HS7Jys5cKFXww52ub5i6a1kopr?=
 =?iso-8859-1?Q?tAYIDMT3ADXyn5Sw9gm53uE9uzbW45hGxe7kl2vsrC4Ffpgpp5W6kPtJFm?=
 =?iso-8859-1?Q?vrqQc03WF5fnoY9xo0H1NrYD6RoKKEVh+bBK1IeBu9lo8mivBVdUP+Sl+I?=
 =?iso-8859-1?Q?+CLii6EUPOCl3PcKbrSHz9EgA/B/kL8lmgzlI0P9ZU9NgmIcE9ahl/ESVo?=
 =?iso-8859-1?Q?fLqQX96NV3vHuLWuEoa8FPhIVe6+nKZv7/KKzDGm8C+tafB1HCISMDw9iK?=
 =?iso-8859-1?Q?qLRP24zQFekO23H0K8IgcnOIWsvRrKVQwHkq6TziEFc/W44pxUJP/sA7pC?=
 =?iso-8859-1?Q?pF9uBIfIrv2IWRynnbeAHDK5U25y6A/KsGbSsds+S0oH6D1/Ps+UHt8fah?=
 =?iso-8859-1?Q?DVLs7TMZtSbu+PFFJDTRe3AqWXkfl7d53GZ+n3a6/uwjTWrGiZXRdGyx8J?=
 =?iso-8859-1?Q?KgIqU7CLZq3FIcUcHA3PLYmWyVQvDkamfvbL2NAR7LS8nk00Wm2g788jU6?=
 =?iso-8859-1?Q?X6ercZGzzYvQackE7PU2/JydT3JHmiHMysxxy/X8eG7VyxuNDQ93FtMZqW?=
 =?iso-8859-1?Q?X2OMmiVIQ5TEbvrxR+0PgBjCOmqyHgygm13n1yUoI64+BDrp2mkW01a6rn?=
 =?iso-8859-1?Q?QLZFL6xSiYua5HdRB+9wCBtEXwxjWqABTpYbDKA1b4V4p0hAtYMUSa3o8o?=
 =?iso-8859-1?Q?OWgsWFLlGVzfU5O8acJ90Bhx5mml4eMPPB7H7dwZvX0XswbYwHN3gDZP/v?=
 =?iso-8859-1?Q?Tewltpo9AsAiFfpL2jqoQ3dTCsk7GukLyK+2DX+KSvORBYHEZ0AEpR+0OH?=
 =?iso-8859-1?Q?7dVq93IswYWnvPNz0jJ5Cp3XjLvuBxdCpEtgdBGXY5mO6Erv1fiXjnMRlD?=
 =?iso-8859-1?Q?/Yw/jnmDINbo2e47xrjJtOz9bFXGPB99V0o591XxGO+b7HdwjxM8vKvHpX?=
 =?iso-8859-1?Q?r265bbbV0FurXrXe/iKh3PZUu/xtx/JQQj5yduOZFsckeNj2JPuXXi/YaK?=
 =?iso-8859-1?Q?3d4O7HYeW/XoYmYTdJszBw2Hg3sy0S45e4ftqpmrBnV/Kb+L4bXK4eLyQM?=
 =?iso-8859-1?Q?Lz4tXdEhx8xim4OjTUb2eXJrmsM/eArSEAlx3fyuSt+qWruqfg4E/069GJ?=
 =?iso-8859-1?Q?Sgd+hcOOTjrOryxmkLXJv3hVLJkm6D1EmpjsboskPFyul9BAZP2yhlYger?=
 =?iso-8859-1?Q?fvE+rofIO5iM6yLRO7yjxqBT2a2AkVXVYX8Ydmflh3T0UVV/b7skHCH2O5?=
 =?iso-8859-1?Q?WihjCqA4U0rNvSFml1/AEpvoaFdRhQNmGUqxPsQZ4dHfSkC/8Cxm8bjusf?=
 =?iso-8859-1?Q?kfHDURs3JmqyU8Mh3tlmSPqivFsiPQo1l5WMJNTAuHstKmEFYVKlkABJKZ?=
 =?iso-8859-1?Q?FE9Ago6F4DalS8tpNQ1JmEarfK2SQSI8PdkU5v+lDulmoH6KY/8eRMVpDI?=
 =?iso-8859-1?Q?aOnMVwFKF1Wd97Ed6hIRLlRBhrkfmo9niy/Z07p/9e87JCnLYbZ5kT0M3M?=
 =?iso-8859-1?Q?GOkfSNjB20NvbI09KGu10tGtyuOeYbOvWE4leBjBYyoJ9TVGU12yNeibBG?=
 =?iso-8859-1?Q?3KhItcX31BloxuERri4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f400b74-816d-44ad-ea1a-08db9e779977
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 16:41:12.2838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w+pb2UStBHVv/HBWvsBgcWeKoQml47hYs4ERukEtsrQ3f7Uw8P8G8ehpm6AZeWigu5Cujxg1zojUF0cIzzKfh/Mzrx+1NE6unJiSVJedcpOEb8le8Yow0X0P/wUI+/sl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4857
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 2/2] drm/xe: Add
 CONFIG_DRM_XE_PREEMPT_TIMEOUT
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

On Wed, Aug 16, 2023 at 10:00:59PM +0530, Ghimiray, Himal Prasad wrote:
>Hi Niranjana,
>
>On 16-08-2023 21:27, Niranjana Vishwanathapura wrote:
>>On Wed, Aug 16, 2023 at 09:18:12PM +0530, Ghimiray, Himal Prasad wrote:
>>>  Hi Niranjana,
>>>
>>>  On 16-08-2023 17:22, Niranjana Vishwanathapura wrote:
>>>
>>>Allow preemption timeout to be specified as a config option.
>>>
>>>v2: Change unit to microseconds (Tejas)
>>>v3: Remove get_default_preempt_timeout()
>>>
>>>Signed-off-by: Niranjana Vishwanathapura 
>>><niranjana.vishwanathapura@intel.com>
>>>---
>>> drivers/gpu/drm/xe/Kconfig.profile | 11 +++++++++++
>>> drivers/gpu/drm/xe/xe_hw_engine.c  |  5 ++++-
>>> drivers/gpu/drm/xe/xe_hw_engine.h  |  5 +++++
>>> 3 files changed, 20 insertions(+), 1 deletion(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/Kconfig.profile 
>>>b/drivers/gpu/drm/xe/Kconfig.profile
>>>index 9ad487647ca1..a3655ee6978e 100644
>>>--- a/drivers/gpu/drm/xe/Kconfig.profile
>>>+++ b/drivers/gpu/drm/xe/Kconfig.profile
>>>@@ -22,6 +22,17 @@ config DRM_XE_TIMESLICE_MIN
>>>        help
>>>          Configures the default min timeslice duration between multiple
>>>          contexts by guc scheduling.
>>>+config DRM_XE_PREEMPT_TIMEOUT
>>>+       int "Preempt timeout (us, jiffy granularity)"
>>>+       default 640000 # microseconds
>>>+       help
>>>+         How long to wait (in microseconds) for a preemption 
>>>event to occur
>>>+         when submitting a new context. If the current context 
>>>does not hit
>>>+         an arbitration point and yield to HW before the timer 
>>>expires, the
>>>+         HW will be reset to allow the more important context to 
>>>execute.
>>>+
>>>+         Value should be within the 
>>>DRM_XE_PREEMPT_TIMEOUT_MIN/MAX limits.
>>>
>>>  Is there plan to make this config dependent on
>>>CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN/CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX ?
>>>
>>
>>No, it can be independently set. The _MIN and _MAX can also be 
>>independently set.
>
>If they can be independently set we can have scenario where there is 
>no DRM_XE_PREEMPT_TIMEOUT_MIN/MAX limits
>
>and above statement "Value should be within the 
>DRM_XE_PREEMPT_TIMEOUT_MIN/MAX limits"  becomes somewhat wrong.
>
>>
>>>  If not, value should be within
>>>XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN/XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX.
>>>
>>
>>Yes, the patch includes a BUILD_BUG_ON() to ensure that.
>
>Yes that is correct. I had only pointed this from description in 
>Kconfig perspective.
>

Ok. May be we are overthinking here. It doesn't sound right to
force MIN/MAX to be defined here and we have BUILD_BUG_ON to
report any configuration issue anyway.

Let me remove this line as well and MIN/MAX documentation should
be suffecient here I think.

Niranjana

>BR
>
>Himal Ghimiray
>
>>
>>>+         This is adjustable via 
>>>XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT.
>>>
>>>  If IIRC ioctl calls names are changed from XE_ENGINE_* to
>>>  XE_EXEC_QUUEUE_*. Please confirm.
>>>
>>>  And this statement seems misleading, ioctl call will set the 
>>>properties
>>>  for specific exec_queue and config is meant to be for all exec_queues
>>>  unless changed by ioctl.
>>>
>>>  IMO better description will be "preemption property for 
>>>exec_queue can be
>>>  adjusted by XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT" or we 
>>>can skip
>>>  this
>>>
>>>  info altogether in kconfig because ioctl description might be already
>>>  covering it.
>>>
>>
>>Yah, the for to change the name from Xe_ENGINE* to XE_EXEC_QUEUE.
>>Yah, makes sense to remove that line altogether. Will post a fixup patch.
>>
>>Niranajna
>>
>>>  BR
>>>
>>>  Himal Ghimiray
>>>
>>> config DRM_XE_PREEMPT_TIMEOUT_MAX
>>>        int "Default max  preempt timeout (us)"
>>>        default 10000000 # microseconds
>>>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c 
>>>b/drivers/gpu/drm/xe/xe_hw_engine.c
>>>index c44540684462..4c812d04e182 100644
>>>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>>>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>>>@@ -370,7 +370,7 @@ static void hw_engine_init_early(struct xe_gt 
>>>*gt, struct xe_hw_engine *hwe,
>>>                hwe->eclass->sched_props.timeslice_us = 1 * 1000;
>>>                hwe->eclass->sched_props.timeslice_min = 
>>>XE_HW_ENGINE_TIMESLICE_MIN;
>>>                hwe->eclass->sched_props.timeslice_max = 
>>>XE_HW_ENGINE_TIMESLICE_MAX;
>>>- hwe->eclass->sched_props.preempt_timeout_us = 640 * 1000;
>>>+ hwe->eclass->sched_props.preempt_timeout_us = 
>>>XE_HW_ENGINE_PREEMPT_TIMEOUT;
>>>hwe->eclass->sched_props.preempt_timeout_min = 
>>>XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
>>>hwe->eclass->sched_props.preempt_timeout_max = 
>>>XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
>>>                /* Record default props */
>>>@@ -562,6 +562,9 @@ int xe_hw_engines_init_early(struct xe_gt *gt)
>>>        read_copy_fuses(gt);
>>>        read_compute_fuses(gt);
>>>
>>>+       BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT < 
>>>XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
>>>+       BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT > 
>>>XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
>>>+
>>>        for (i = 0; i < ARRAY_SIZE(gt->hw_engines); i++)
>>>                hw_engine_init_early(gt, &gt->hw_engines[i], i);
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h 
>>>b/drivers/gpu/drm/xe/xe_hw_engine.h
>>>index 3d37d6d44261..71968ee2f600 100644
>>>--- a/drivers/gpu/drm/xe/xe_hw_engine.h
>>>+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
>>>@@ -30,6 +30,11 @@ struct drm_printer;
>>> #else
>>> #define XE_HW_ENGINE_TIMESLICE_MAX (10 * 1000 * 1000)
>>> #endif
>>>+#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT
>>>+#define XE_HW_ENGINE_PREEMPT_TIMEOUT CONFIG_DRM_XE_PREEMPT_TIMEOUT
>>>+#else
>>>+#define XE_HW_ENGINE_PREEMPT_TIMEOUT (640 * 1000)
>>>+#endif
>>> #ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
>>> #define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 
>>>CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
>>> #else
