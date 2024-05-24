Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D2CC25B74
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 19:35:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2357610EB1A;
	Fri, 24 May 2024 19:35:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UJ12t8Ks";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D34D10EC91
 for <intel-xe@lists.freedesktop.org>; Fri, 24 May 2024 19:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716579340; x=1748115340;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=A86s7fvl13xPnhobMPanEOhe/5VD2x1WaRjjasZAgZM=;
 b=UJ12t8Ks/hg3ute4Rm19pajbUyBjw++eAApaV7gqtMFV09sBYEmAoDzV
 k1xTsUK7suoHN56RW4FI0VK0ubTDM0UBAV+x48tdOTICwR3Bdx26FUdYN
 6TYwMLNkaVylT2uGKNrbkSMCCQTZZUYynflfaBtZx0EFKeOF7+pG/aDG7
 AostyejDc/8TrrVMnn6ceU78f4UNjava/SdpIRHqHnUIJvL2wWZHOU4rL
 VeI2lzjW44T7M5Cx1pWa2W4qWpt9GEXyk1RzsA5EWXmvNq1c+7tFvGH0Y
 06X2+2BOiP1lRnYYNJ1JiuDJADaoMmkZaiQPSmjOIk6u0HRe8LAuLZlAm g==;
X-CSE-ConnectionGUID: XrK9UqqQSTW1z5PoCcw3eA==
X-CSE-MsgGUID: s7Adqw22Tfa87GNYpEhGrg==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="30505743"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="30505743"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 12:35:40 -0700
X-CSE-ConnectionGUID: O4HO85puQ2ezAoM96g3fOQ==
X-CSE-MsgGUID: lYHqaDeUTU+47QciVt9yHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="34223830"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 May 2024 12:35:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 24 May 2024 12:35:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 24 May 2024 12:35:39 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 24 May 2024 12:35:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bN3CrdqB+QrHWJ8T4zQnGK4B1CmwslRAw3E7o0hF2Rw9zdlvQrvviQip1wFz7h/JsHNH586HUqQx6ema898lY+Y1duMAnHppxZs/wF62zSMKeuxrdnJsmebzeEDznN+4D6khyKagG7pKXv8KNqcW7yn1P3zxFWsiOczlwL0nkZ9kkJ/S7LZikLAsznR0nal0P5u2wrFMPKcOqbepCESKl47OeUguly1FcqoqWaNG69jj/omzTiLXIY5OvFKG4ISdZFbSJ1TALRUKSkB3vLVbz3ovBWx/1CJ2SGcEmK+lcIG110GaFN1UaUU0uXR9AN48ucXUSLh06XTmg+6vsJTTXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ii6Y8U8XwiokalglVYjFepl789MtlZFUi/odkhA5mE=;
 b=e/tNdhNOCL2IoCoglcQa+7fv1I4PDF3hoquiubOS5VUQXc77Yi+f00772izPHT12PNG4z97pkr4rDlSY1YSr3/vFWpny23gnkmwNk2pC2bJGLxA6ILHpQ7XmpCndIdgM1QyBaXzt4w5U6c1v4/SaIEQx5JceB2QzFaP6ppzP//fx0Lfao31o6zvE84xrw/uFCpiGbrnIPbwAyZv0eQLXlle9/+i3j3aMSGkgTQPFzGZedFTwTjrV9+E4/j9DPGXgBhnj6ShlmTJOHFLPya7RpQj70sA0cMYnVKZWks9VsdBpndFmZTnBfjmNIiTyedQnF6ddrQ1bLuRgHZeztadtiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6437.namprd11.prod.outlook.com (2603:10b6:930:36::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Fri, 24 May
 2024 19:35:36 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Fri, 24 May 2024
 19:35:36 +0000
Date: Fri, 24 May 2024 15:35:32 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jani.saarinen@intel.com>,
 <matthew.auld@intel.com>, <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe: Do not access xe file when updating exec queue
 runtime
Message-ID: <ZlDsBOpHS9ybagbt@intel.com>
References: <20240524184958.1344787-1-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240524184958.1344787-1-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: SJ0PR13CA0031.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::6) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6437:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ccdc34b-3e1a-4766-3f03-08dc7c28af06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NpA0pX/6lHfAWWbfDfO17kKJ6mrRelAvTzryZldxcVFbREtsIGiiS9s4US0/?=
 =?us-ascii?Q?Haz3vMLd+e2hkPvv45RpXEePioNGgqlqWRVPnhnLaC+F8MprvPdrhdpiwGwH?=
 =?us-ascii?Q?Snc6jbKqp+dOo9CiROvOOw0x5ywBI3zfdpbp56K8E0gZ26wV26qqM74yHJtH?=
 =?us-ascii?Q?TLMJ8oeKUi/pmSJXajmo/Mrf7onOzkhKLw15SqVGQjDq7Vksrnabnbrj69CE?=
 =?us-ascii?Q?jACoy0rzfkzeitoX/2uhiIA5TrE3qK78aESsjr974miaWjkl/5Oo+HwdcgmW?=
 =?us-ascii?Q?ZayO869hxDSWlFOubIWfRlW3zsQPnK8z2osMaM9yqDyTL5qVQpatHyeEOBUT?=
 =?us-ascii?Q?u87lyCkoC4zLOzE4ar3OhY5eFLsuNIWdkSIPyvZNHKYFhtKI8Cb0+ZuG60NL?=
 =?us-ascii?Q?eP/gqu5I6JxWx1d1eDNs1FOScW+Xp9MMY/U6sWx6PyRkdBdze8fXk7rE6jfS?=
 =?us-ascii?Q?mSk5vIa3J8v6XMTLgEyfnzZWIYn53NFqS2Z5qg8Uo50chM1kZj4vt3HrhdQS?=
 =?us-ascii?Q?2wguYYuOy9anBPnhAX8h6WKD0RR72ClIW7SuP8tYAOMVuaQJr9Le3QlnE7Uc?=
 =?us-ascii?Q?Zkpaz+p8Ojaa1ba9WTTPEhe2srAplq3rZR+Lc0x5YOF7mLCKui9fU7KM35Mj?=
 =?us-ascii?Q?717DXzg9TpIctw3Oi2y0zz4TlNPbqcKXiI1bzaAVPqPw0FDaebfTcPYrSkAW?=
 =?us-ascii?Q?15JFXyctfOnIkRvnNrINqNMwb6zOoUT380VGI1ks2g2oZQjtbKjbkmBN7LS1?=
 =?us-ascii?Q?ABBpd8XN+5qr8sgIXqRHQ2rwZZIq0VR00VUIqH92w/9s354DMLkdOmn5EBK5?=
 =?us-ascii?Q?qM5NqHCZewWuxzCdwTsW40SEjkpMVqaMtkSiVB3ChIwBBPt1HFbDDzHCbc0K?=
 =?us-ascii?Q?w7YDTDEc8WMMAMIY4tMrfZEIMHvwjZgkXr15Ulgnz/qQK8jKzWKmZmKDCJFK?=
 =?us-ascii?Q?ZlrkQUHkBa4oTlpuzIsv1x5UZsFcTRwYwyLnF0suk5hSRW8pgSsD+2+FMqzs?=
 =?us-ascii?Q?/PKl7WBc6lVwZe8JMHUdoo+c51m2/MikoNatQ165Ukd4FZuMHPLBKHIY+xIF?=
 =?us-ascii?Q?udAadFqcu7nIcPLPswGYChRWshT4oxVW8WkyB08mtRue5rIJGcUe3p4RIMmH?=
 =?us-ascii?Q?ZBYWHVfaQmXlAbrtvYMqEWXfB0PGmBHyrVW11FeQqlpena8/PyfMX0uNMnnI?=
 =?us-ascii?Q?B7yJXgHyvc1LEPFyASHcbckLQmxWAvAkFuWz1X7SKGAMfW4396P6A1bqRos?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ktF8rLbTNWBjs17jqeZWqW3Gf7gRQt3K3ipGxJ6uGVgyXaf07qf0Uk51DJyR?=
 =?us-ascii?Q?DiH/bFDo6uK4iSWb9LNbMgqVIKuMp2fynEt3AOguUlHohI6+CKKSjDYqf3K3?=
 =?us-ascii?Q?oyMUz7x9BIlXlosQ4Zwp6Q6GnhlOQnNbokUS36JdOic1fBqgWNFYsp8YaJma?=
 =?us-ascii?Q?BlWjB0syGW5MFfgxottQPDD48+/tJ/cxfPZSzhP0CWNAOeIlXucD624lY4Nu?=
 =?us-ascii?Q?NOemBA0iIc1VipMMJ6zRHWCUK4KfpIJVRQJqPYjWBh9Y03Nq00MCh00k1HPV?=
 =?us-ascii?Q?RFnXsWelu+UtVdzzWc4eZPUZOTEjo9HTHaPeNgIe4MdrADOtRRAnRe6RTevS?=
 =?us-ascii?Q?EZ+z9d+BQttYiqNS/WS9iL2AFCVPBDD8HWVeDY2cjokao8FjQqVlAUVHSRiw?=
 =?us-ascii?Q?9RoNeMQ7gSMxwe9y5T71HXrvg+G3fdodOPMSiIo++TgGde/4TSJ33iU/tK/t?=
 =?us-ascii?Q?bABvJTMVOM6ueh+n7g9sR4AB5yiGE9gWAijpFockH+P04zrt/J9rJgifALgz?=
 =?us-ascii?Q?FD2bxwsNHhEWh+zIs0+UIwKZYHtovgN52biuxfw/YA20kmNLyXEReyQxQ+Uj?=
 =?us-ascii?Q?RldJcIV2f56n9fz5gps1NvAw2cjkwVkcokbHQjbgGc7XeQxHAEWjONzOnfXC?=
 =?us-ascii?Q?6mvWVzbHfAAoyihTvms6Bgr18+9VQvdKsk/ICpgmTo9Obay8VuMkMGcalw3g?=
 =?us-ascii?Q?O4/ZL0FvxuTDQ/UWm2IQW72dP6JhmHwTiNmz13OBVYIgBhcQ0IXya0TNxxJ8?=
 =?us-ascii?Q?OKkpb/XOIdzveuiVFyD8nn46VT3EbcCmtzsuj80d+0yTluMPRoYh7VnacwiP?=
 =?us-ascii?Q?2ojgsWUWI/DVAbaM2UAMeXAAfEj7hKM2NRU5tSHA/y6eeXt5jD4IbbQtN7Qj?=
 =?us-ascii?Q?aF/6edfE79Ym20OHw2I0Lp42nMbx/O2TrGnm44HjIbslIU4KM3U0rDTJi+/R?=
 =?us-ascii?Q?Y44tYUr4ouRWr9OMsNMIuMOQFkvSWI6/cojO+s222BndfdvhbnEiDZZWrodw?=
 =?us-ascii?Q?jhiuM3lwiA4jc4imMhTL/Tro4U+4e36Sp5EXhd+wRJKRYn1vhxKTdDBcIn9J?=
 =?us-ascii?Q?H3O+VW+AqV5KY2Fhe62oPcd5fhKdlX6BSKZXszVWe1YKAfgsKHxpi9oy/Tm5?=
 =?us-ascii?Q?lRYPiCF9eVzKTpcvgbrI+rWOEdfeyWl/P5WZmsESom31cyyKjimrEYQcVxe+?=
 =?us-ascii?Q?Q9Ed5AJt9J9WsrR9SGiiufXiG2rb1ie3O2ON9n+oqSatboDbbKXwJezDaTlk?=
 =?us-ascii?Q?3hDrEXwAgA9BqfJ8IuVOOFK1+Ti/AnbrMOOCQaeXoa2mpoEeON0O/rAKvJKM?=
 =?us-ascii?Q?J6kG/5jETEkE86byxGBB2J5FMtbG+OJwsuIDLUdO/9n7C2Wb4W7jZ4m1Ds9E?=
 =?us-ascii?Q?IM3wGaTf47uWtdyHn5Tn9I3SGFPeFsFKJ95RO1zDlCOellja+TP01Y5JWtne?=
 =?us-ascii?Q?mhguyksSM1sGRttaDvAhUwJtmFCCFaMvAJaTk/S9zhJtxEjXA7yRNgRvSElk?=
 =?us-ascii?Q?9eDWsG9Ou7e98spBiGqxScJ2vCWIS/SFvu4BEWH6noNZL6ryzJfCFfCL/RVr?=
 =?us-ascii?Q?EZMuNRLckF16SMhuZN625Yuoqv66FbbwxDeOKMj8GlBxDUl4oZKuddTIOHwG?=
 =?us-ascii?Q?nQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ccdc34b-3e1a-4766-3f03-08dc7c28af06
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 19:35:35.9978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YGJG8yx5v3ifr8G701n6Qyds29N3I+W4VOI2knbz9LWGtIySJ9cFxbRv3FE5w96cjtWNpWpsMl1D9ajPnrlp6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6437
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

On Fri, May 24, 2024 at 11:49:58AM -0700, Umesh Nerlige Ramappa wrote:
> The current code is running into a use after free case where xe file is
> closed before the exec queue runtime can be updated. This is occuring in
> the xe_file_close path. To fix that, do not access xe file when updating
> the exec queue runtime. Instead store the exec queue runtime locally in
> the exec queue object and accumulate it when the user dumps the drm
> client stats. We know that the xe file is valid when user is dumping the
> runtime stats for the drm client, so this effectively removes the
> dependency on xe file object in xe_exec_queue_update_runtime().
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1908
> Fixes: 6109f24f87d7 ("drm/xe: Add helper to accumulate exec queue runtime")
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_drm_client.c       | 4 +++-
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 5 +----
>  drivers/gpu/drm/xe/xe_exec_queue_types.h | 2 ++
>  3 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index af404c9e5cc0..a6a15562b8f7 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -251,8 +251,10 @@ static void show_runtime(struct drm_printer *p, struct drm_file *file)
>  
>  	/* Accumulate all the exec queues from this client */
>  	mutex_lock(&xef->exec_queue.lock);
> -	xa_for_each(&xef->exec_queue.xa, i, q)
> +	xa_for_each(&xef->exec_queue.xa, i, q) {
>  		xe_exec_queue_update_runtime(q);
> +		xef->runtime[q->class] += q->runtime - xef->runtime[q->class];
> +	}
>  	mutex_unlock(&xef->exec_queue.lock);
>  
>  	/* Get the total GPU cycles */
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 0fd61fb4d104..a0775a96efb1 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -765,7 +765,6 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
>   */
>  void xe_exec_queue_update_runtime(struct xe_exec_queue *q)
>  {
> -	struct xe_file *xef;
>  	struct xe_lrc *lrc;
>  	u32 old_ts, new_ts;
>  
> @@ -777,8 +776,6 @@ void xe_exec_queue_update_runtime(struct xe_exec_queue *q)
>  	if (!q->vm || !q->vm->xef)
>  		return;
>  
> -	xef = q->vm->xef;
> -
>  	/*
>  	 * Only sample the first LRC. For parallel submission, all of them are
>  	 * scheduled together and we compensate that below by multiplying by
> @@ -789,7 +786,7 @@ void xe_exec_queue_update_runtime(struct xe_exec_queue *q)
>  	 */
>  	lrc = &q->lrc[0];
>  	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
> -	xef->runtime[q->class] += (new_ts - old_ts) * q->width;
> +	q->runtime += (new_ts - old_ts) * q->width;
>  }
>  
>  void xe_exec_queue_kill(struct xe_exec_queue *q)
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index ee78d497d838..085a7dce7565 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -151,6 +151,8 @@ struct xe_exec_queue {
>  	 * Protected by @vm's resv. Unused if @vm == NULL.
>  	 */
>  	u64 tlb_flush_seqno;
> +	/** @runtime: hw engine class runtime in ticks for this exec queue*/
                                                                          ^
missing space                                                             ^

good idea to move to the exec_queue

> +	u64 runtime;

could we please find a better name for this? runtime what?
or do you mean run_time?
Is this the total run time of the exec queue expressed in ticks of the eu clock?

My poor brain parses runtime as the phase of the operation, vs
run_time as the time spent running.

or perhaps 'run_ticks'?

>  	/** @lrc: logical ring context for this exec queue */
>  	struct xe_lrc lrc[];
>  };
> -- 
> 2.34.1
> 
