Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57EFC3DA6E
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jan 2024 19:30:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B6D10E682;
	Fri,  5 Jan 2024 19:30:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 907CB10E682
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jan 2024 19:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704483045; x=1736019045;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iTybY5LyouE4bZJqWYoIOzUKZn6YJGApI4Xn6Hi/zSE=;
 b=PtFzZjPFuoSMGXxDsC5QwzDcOIf9OdZEb23UVnpZM3J12rOwc7gjcFpk
 xpsknm9iXisY4n37f5CPRXQ5ojcOeHxUovBSU4vOr9dggQ8eIOhqJzRRZ
 Db4HGSp7ktlvh1L5UGx12elPhykMXUqmKlkfXINs9PZEuzv0j/VntRFaE
 9833sDt6zPvBr03nGnBMC88n2xn8gL36ZGpdjduOpaAVNMWUGrCgQbMHX
 vNXDhCr2/6JzqeUil70cfJnPeM9R4tRUMX1o/xsjYS5fp6H8OljIxLwrq
 /FIvyHJ3dmH1dh5G8XIAyjyjJjX1JNZUlEUEORKxT4PHZeHRj77NxS0/x A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="388018738"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; d="scan'208";a="388018738"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 11:30:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="1027839845"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; d="scan'208";a="1027839845"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jan 2024 11:30:44 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Jan 2024 11:30:43 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Jan 2024 11:30:43 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Jan 2024 11:30:43 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Jan 2024 11:30:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dWxKbsEcM6ugtpCSriu5E3ze2PAgw15GFqIQ33Kqde1cN1IB0ZWSEXXvEdwW0vk+fHNkeaJ3WnWOozJLfq7jVvec84276+blvUEiay0d2MWb2PMmVwz4W/pIuwXtGmhMYwJsDA1E9M2nsT1Aiezk4td3pjWGUVZJ744ALnQkInIOi8ifsHT8PJ73o77pJNH2XzROqm5pK25QgRmEMPTOCtaPAfdWk0Tr8MFm2dkWif1DA+mos3Z94GmWFCExAZH5Wy9UmtHn048Nge7ZeqHVXwE9m6bHuxde3Tr9ziIxX7dmOcia5O2oSHQmJp0jFXcpCQV/JUy1GH9xv7xlpmnAjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fe1DoPSHqP4MSdKZb6zV/wtmdJe0fKahxQJTgoT4NJ8=;
 b=lb7zwmFcGKZkuzFcRCJKsfGjcwzGvvGtypaPrjAncZFKuf1qsUEddw42ESVENSrQmsqukCSM6v4PlssT18XTMz/ZnXqOZdO6MC/Q/79aOBaYgxbkvDXN7ynEyOZ7gt/BkGJJHKgT19f9zM58X1Rkm8l4W0jMdeISHRqgiq1g/tK1gt2gX+6T9reDtuGoTaSalpaZ6iCxCbzRzpWpxNZBF3kMZx7fiZ173HZ9mBG06a3jSMCXjeBzvuGm3vpotk8RR8vxSGbqS/UfShBMVI32m4UWIxqJJxteJFkUinN9elXpicSfCGTnpkjWStLcRHzrmCjPTsRPiYIXPK2PC5RlZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB7070.namprd11.prod.outlook.com (2603:10b6:510:216::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Fri, 5 Jan
 2024 19:30:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7159.015; Fri, 5 Jan 2024
 19:30:36 +0000
Date: Fri, 5 Jan 2024 19:29:42 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Welty <brian.welty@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Fix guc_exec_queue_set_priority
Message-ID: <ZZhYpsh7Feb09ruM@DUT025-TGLU.fm.intel.com>
References: <20240105190440.9908-1-brian.welty@intel.com>
 <20240105190440.9908-2-brian.welty@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240105190440.9908-2-brian.welty@intel.com>
X-ClientProxiedBy: SJ0PR05CA0037.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB7070:EE_
X-MS-Office365-Filtering-Correlation-Id: b8298649-ba5f-47ca-0d6d-08dc0e24ca89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V0AR/KM9HrU22nQwwpah3NNP8ddwkrY8jbTV0QT0Rq7p1/OsqdqMRyaky+idxAclYHI8lpeme48JhbrExyZEp3xJV+VGmcQOnBNYmP6akXKZF6ZgBSgN+kJeXO8qGc3MznAvBslmeCrwCviER4yKbx/RGV9dDL8IVzpyV7W1ml2ZenecZVqsx3LhZ/t9O5/n4z1QG/WpWCYN1vAQ4X/P4WJ+k0DwLIt65HdUYPgmZlNX4L7aWo+6fAmq/f8IMfMo4mNaOTJeWXtcofYy/R3KhJUjm91bNM8i/hzaf8QQ27aStrucPzTqMQeXTOapRv6Y9R29XK/USEVyA/JVEnPbmNl/NhT/9QL/Pb5yUK1SoIT9YdmsOIFuNTFTC8v9Jpbmwh0eD2I+2vhp5lOuQsgFHIPLo0dvmvOh5u7qBjdAHwvEx8/MfCVfxTvHTBcxZ06VwFF3UIPH5wSbCAJgBzkRQKIFv4/YrxHI85Tzq4iwGedvGeTx6+2ewkRwWUJGzPhWKq4HemsnYVCI4dmgsyugeTjiR3xzUG9MPeOf3jPAx6p+enrljqby/KZfY7RPpSrN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(376002)(136003)(396003)(39860400002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(6512007)(26005)(6666004)(6506007)(5660300002)(44832011)(8936002)(83380400001)(2906002)(478600001)(66476007)(6636002)(66946007)(41300700001)(6486002)(4326008)(316002)(8676002)(66556008)(86362001)(82960400001)(38100700002)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lDgjszNo58llDcQ+U92U+nZOg0/+SkgMM6fSZb13++ObRwDt/UmXfhvN505P?=
 =?us-ascii?Q?cYHbRCkgFYFCxKNHDu1IZGOT0SuvozO7j9OG63uYmXVX5PUAtqrkgPXs6NhY?=
 =?us-ascii?Q?WtA7YelxDM9kbK1QVjluw8pxbbHGMrkHTlQcZ3hu+0FEXHnrItQPGSR0xt7F?=
 =?us-ascii?Q?LsTcdO9WN1V37xEE+lWJwwJYFzAC//xhp4vKG5FWA2aBWQrFip8/KjeXXowl?=
 =?us-ascii?Q?OGPeJyzrO5o5tpHc/K2VKD5i5LWRFq21b0o2W3zC1Wb/2tGiKw/b3/t449Vj?=
 =?us-ascii?Q?n/Hpkgns66nFeL3O2KZkeKWRvfzxuu8IEgvaC8vUEIBazanlVs8AmiTX5mZ4?=
 =?us-ascii?Q?NCkbfs5h8C1WDTlTsJhaMxnTJ+q0tYIRtbsb6yYnF4xormUo7PD3kSOu5aEN?=
 =?us-ascii?Q?YAjMpNX27V4nIUJ/02bLD22Dp0jzz8Jv1/RpvHfd9c97W9FvyYEWFoV9byjA?=
 =?us-ascii?Q?iZ5av327vr5BmpK1PqT4e+5rZAqSkaJc0OX0RbUEaYm8pUKkLNTG3lRH30an?=
 =?us-ascii?Q?0fxlmjTepvDpaPJ1hlfsApehJGGntnFxtrMYHdVINCFMZcYkY8kMR292G5En?=
 =?us-ascii?Q?y1N9MSpn/o+1Q33u9L2+VfGMn90eST4HjOvhYSZxhTpA0qQCgywGAy8JJqR3?=
 =?us-ascii?Q?UyV/K9aFImovW1kq7aZvNwRP3Mb7qUoybOhHgUzHNzOaT6uIKJew4mBffuex?=
 =?us-ascii?Q?J+IFcw0EETTVeMGmeMjkwCwERkzpOy4zivA8YsNmvEX5QWa+Xi52i7g8BFt5?=
 =?us-ascii?Q?M9oVqgIEnuivqu4GbjNZli+NQURsuYX4KGJyhDIcvRJF4OcRe9IFQXaZTfi4?=
 =?us-ascii?Q?v40SGQg3eDz8o97Adg01CCvrK51TGJ4vRF8VlUwghQTfR6Uuu5lApBIr4TlG?=
 =?us-ascii?Q?kvciOUP98nVZfCkV/jqJ+yIjQzdX+IJl4gRxrfE6BFnumDyuhoySMUtmxCHb?=
 =?us-ascii?Q?L/D0IKUnENqawKPi+JGdUn2q+aLzHDD2dE/g64T0hBCHX3rQlqz3u+JWsMzU?=
 =?us-ascii?Q?eYJ0ImsrdViycgzTq3EuvMXNjCd2uKAQWyIiIHyBqh2WdnokiGQGY4RHGWf2?=
 =?us-ascii?Q?p9HEHDceWmFbhPiguSDKpHUK6kxUa6xA2JhZW0wKB898+vwvRUSWjiM7q5ce?=
 =?us-ascii?Q?dYjPcD6k0Pm9+m5x1nebOM4kZY2hKW8hP6P1EEN4QfiDyXd/3mkZGizvgzBO?=
 =?us-ascii?Q?oYiDzHVnS7E7QOZNaPMAUHFynaauRukB9ZkjH7DiLkGYPns/48cTjjuhCY8p?=
 =?us-ascii?Q?6RGegV+cpnAnU2oe4OlOqvj5QTxVExNfWYD36ywSd+vGONSPV9EjP8c4NZb0?=
 =?us-ascii?Q?VFwfGQvqbCFcXL7IxPKFDPOhJb1ZhYDQLi9I4krvHUwVyEYlEOrVzd9wN+9V?=
 =?us-ascii?Q?B6xMX9Pu3TKjjhJx2Gk/0UMzqwOiVShJwVBJpoH70tQ6LT88/dNH9KQo51+W?=
 =?us-ascii?Q?vDEKdyuylIMosEkf8+b/FLkngG7zZLMhMKrNLvasz1o10dDYjl8rw9zQhd6U?=
 =?us-ascii?Q?DS/232VgjgxQJ2hCvTYLS3TLuJj/hiU0gXo3wMMZ0v9nBrrUMjRaLhQzlUxb?=
 =?us-ascii?Q?3mxuF3nQD3UvumCmdxyyxQIezVMZpy9McOs+EJZABXauiuWQg6Rgpf8WGxpw?=
 =?us-ascii?Q?fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b8298649-ba5f-47ca-0d6d-08dc0e24ca89
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 19:30:36.1237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IvpWxNVsHHtmcvkAG1xkt3XG/QLFnh73kZwXlRBSEBk5eOMLL1ApkDBVM1hHlqzMJ9ikMGp1HpfVWo09oGooUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7070
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jan 05, 2024 at 11:04:39AM -0800, Brian Welty wrote:
> We need to set q->priority prior to calling guc_exec_queue_add_msg() as
> that will call init_policies() and sets the scheduling properties to those
> stored in the exec_queue.
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: Brian Welty <brian.welty@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 21ac68e3246f..5de3ac47c462 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1308,8 +1308,8 @@ static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
>  	if (!msg)
>  		return -ENOMEM;
>  
> -	guc_exec_queue_add_msg(q, msg, SET_SCHED_PROPS);
>  	q->priority = priority;
> +	guc_exec_queue_add_msg(q, msg, SET_SCHED_PROPS);
>  
>  	return 0;
>  }
> -- 
> 2.43.0
> 
