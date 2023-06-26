Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C8FEB64D7
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jun 2023 22:26:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A1E10E25A;
	Mon, 26 Jun 2023 22:26:16 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6244F10E25A
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jun 2023 22:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687818374; x=1719354374;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/DkYKjeTPnNWoYqGg+z+eJ/6V3pL/pt4Stv7Qy9PG8s=;
 b=YZgNCjbdGsUbjs92doul4H+1bpTeQBUBt0x8OKBuq8l4LMKCvIRCQ9rL
 5EARvlvUhvJ0C7PJgh7uxJ4tTv6o+iuSD/W5lx/IR1bq7eXvwsf7SeDXq
 KLuSbhp1uIj3D18WnwrW6/9+ZAK0Cce8n/p912ES3P6DU3B05dKWQLM0m
 S58nNa3/BoR98NyGUhtma093GrWNQjF3ZJv1nPiXA0H2N7tR3CHLtg8oM
 Dsxewo7pRM3mgeFWaHIVSez6spyN9Ks+hG5FxDau05T9Mesu5fN7Iw45C
 wi7pJeEivls5UG7wcogz/BG4LGqod53ZSepgrpYoF4DMaKWOjs+ZUOfGn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="346166472"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; d="scan'208";a="346166472"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 15:26:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="840449850"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; d="scan'208";a="840449850"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 26 Jun 2023 15:26:13 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 26 Jun 2023 15:26:12 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 26 Jun 2023 15:26:12 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 26 Jun 2023 15:26:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bmIM0VjjqHjAkKkA7JFBqVobuTqwsI7PbxmsBc6fbpzJl40nOvb3zfUt5HkmEYZYcKT+lmDJi8IK4l7z8DRibEx8QP0GTvtiQHzjRruwnh+DfHc2v45d027sVRqzeBFOtid9V1a0MGK71/2UPOSxkm8iLQu+fWnNZPepxNrnZoACT5i+AkVf/gCEt1qkeo5IKriNisbiXTJhEZNpK8piTNUpiec6ETnReqQGBJ1NE0dfrmPa2KDNJ6h3hdVihjOCSQSs7DsUOLx2ezZi6EwaLMZnKI9c1V4A6BGB33z7APb9SZIwlMZqBMy7kbbkdzDe90u/TED1jHwnp4RiIiQHqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35MXxTlsrWGcpTFdRh1gMRJWifyZeuFeJAsVVDj5fsI=;
 b=UencHfMABV1hEjM234eG8hNt/l07oRv9f94oflC4PB0c1v51+P++R4rOBq8pID3TS7CrTlvaEx0ZD1ZPojL0E3dcW8Up9xNIS+3Der0f41KHMpWNzc8YXo24ngrXg03BnLKvR4kM5JVzvCRkYMBtZV62HYGajiYuI6I+qLJ0glX2PWifTbwMyAOE1Jp2BdML50DYt6SMaA9qHsjzwknKGbMA2k7BNfKKv9C964eAEzq3gtcqoMh8h7OO74BxAw9F3AiGTAGYj3sITvKteSrfZ8CSs4v3H68RArqHN9LubG/oiu/rRzz0qk9y1JnPqRnfgjJA2p897Ir0+cI/wtgMzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW5PR11MB5908.namprd11.prod.outlook.com (2603:10b6:303:194::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Mon, 26 Jun
 2023 22:26:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6521.023; Mon, 26 Jun 2023
 22:26:10 +0000
Date: Mon, 26 Jun 2023 22:25:22 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Paulo Zanoni <paulo.r.zanoni@intel.com>
Message-ID: <ZJoQUpeypY26X3Xj@DUT025-TGLU.fm.intel.com>
References: <20230626212221.136640-1-paulo.r.zanoni@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230626212221.136640-1-paulo.r.zanoni@intel.com>
X-ClientProxiedBy: BYAPR11CA0100.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::41) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW5PR11MB5908:EE_
X-MS-Office365-Filtering-Correlation-Id: b7515891-78b7-46f9-7bea-08db769457b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 84VMLtVX4q+J+UqGtJrKUIbF8GBhfnFRngd2Udwa9o+fLYPuTT+UCHCxExCflaXa923cKaw7iTKnR4g0a/gUzGcdaqBcWVOKNtB5qM7PdKTq9vFDCVsBmOPAfj8OC+Lla1FTiTqiTrNGk8WgS6vzyZyBe5gcUcljNViekVSWqKAX6gQTegODwlAe5UBJXlmSMn53y3d+uTNfB7/sSV6XGRiLvf74Cfj61B8ZNFb9Ys0YjQTz8fU86QbXcwKETBgFUp1Ctdik250O0ImOe/AeQ6AyKe614SzEsiabnc/oY/G59M3+LO6/jRh0Zr6ATa+N1broS34hacHZ5M62g6cNYp0I0Xglojw9/xSokI3LW9Plfh5twy2SVptquTvEZBA69hM85BsVXmx6TRc3TmopiQUtB3Fsv543C906W70FRvAjmE7+Sk58uSVQcG96vYZsP1i2C7JzqHU3KN5cG8QG5nHeHuHNGgBCFHgfpf5euP3ocS0heQL/G6wueLpXhamo55vHB1IFaUkEIoTaRcApeOIuF8q7q+ZVyLw5tlTxQbE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(366004)(376002)(346002)(136003)(451199021)(5660300002)(6862004)(2906002)(186003)(26005)(38100700002)(6512007)(6506007)(41300700001)(83380400001)(44832011)(66476007)(66556008)(66946007)(8936002)(8676002)(82960400001)(6666004)(6486002)(4326008)(478600001)(966005)(86362001)(316002)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?LLDDSIfyrmxiGthVyaH88/f9xkYTqaUajmbLy1OKTNLUQr9cKy97TsKbjy?=
 =?iso-8859-1?Q?8MlZGu7FitxF8p9AhRlTUcDYBvNuPBje8JruROLEWO4s4vr36uz6QPVbvn?=
 =?iso-8859-1?Q?m7WVI8mfG8A5fgryEflQK0mYQ007ncCSRVEZ8sjL6yWURhJEhRH80YumDu?=
 =?iso-8859-1?Q?r0H35AlUIg+2gfcruu0+T4xRvVDBDOOlgLFInUMw+Pu2nQJWub+caGHHI3?=
 =?iso-8859-1?Q?BRSLIBoMYzncPAGE+S4/hZZykZXw+zhvdWmhz8p16S6zzbegEXKuZgySN3?=
 =?iso-8859-1?Q?jsEHjkILDq871er/vnF3ja5FW7ogwkFI49weytUg9xeX0mkTFi5GuWdpUB?=
 =?iso-8859-1?Q?SLcWixsKPCW1CLNu7toT9V00WGh/UIGEAeQ4Tw75ONaIv+mOleonNez31R?=
 =?iso-8859-1?Q?2x8mweRbF/YwpRHuXhVaPMLF9k3cn+mYPLl5A/wBRySiHUc9NR67rQ71jd?=
 =?iso-8859-1?Q?T72q1gY3s9KgIKfp2Yes4SfnM8/1OeqBLZydfyRY71Y1P3b3/G61DmfzUm?=
 =?iso-8859-1?Q?nRtxIhxbrB/EMMxbuyvgEajIk8V5gcW96jxy653hrE7EUbrZtFRr4gvPdy?=
 =?iso-8859-1?Q?9G8JTmVabEBYASOFeO/iR5Fu/9qJF1XuBOgjy3iMavyhISiLexVe53woJz?=
 =?iso-8859-1?Q?1mLDBk/2KfBOWYaaVKbEd7dzXVshHWJCA8TdmbNu5/cAoF9Xhu/0YuAPCy?=
 =?iso-8859-1?Q?8+bZerdlTASMcvQmXpukaFf/ikeZMCvGDHKsYo/JVQoiIGPefrsu6f99Cu?=
 =?iso-8859-1?Q?b9leUORJhx80vggcE0FSXeLyNZkVCE4bdCBfafYaXdmyp1F0KPBKNeaZDW?=
 =?iso-8859-1?Q?09NueQcLLtcXs/Oa9kDT0RQLpjSBltyyU6NqXrJ5ujKRALsQYjzrLg5tEa?=
 =?iso-8859-1?Q?sVlU17UbkPJjeqXrl0YwssLRnTYGSG6cv3uQUp2W2JahGCvGa0zy+Ra9Re?=
 =?iso-8859-1?Q?9OZuNe4n21ea6Y48eMtN+D/pBHUUxSKY3Jduzf23HE3Hiyc0IYKSuBMAc+?=
 =?iso-8859-1?Q?jiM9cD4l6NEwFF9KQFnAHioWIPzhR276hgq2N7K3zMLXtu1D1WkZxgkNfA?=
 =?iso-8859-1?Q?bLcNnMGJqO5CF5zXZEnsPVQrb+Hl3FPCduyBjq8p83q/nl1MRceuwBIQTs?=
 =?iso-8859-1?Q?XY1yK1WkMjVlYQL3R7ORpQ4rT4YKyK4XaFzJdTu1elWqae9eSIj8oJypgo?=
 =?iso-8859-1?Q?zBlNprmAIJex5taYw0FyYe+11C2WjP/KdZu0q4LU3DorZM+I/IpMG1PMl7?=
 =?iso-8859-1?Q?foDlPm6rgLcyWMtTm0wa/Ec8E5WUUwrhdRoq/KXqwp43GHZo0R8nrcWz0s?=
 =?iso-8859-1?Q?0vzkAU+tWpDojSP3QFpga677CntTokmkhF630ak8Nwu4r0tYf539siXMwG?=
 =?iso-8859-1?Q?fAEwwjnSjsYgeSnIo0t2vykPSYu2VAJ+KyJ0oDr21z5rvF4SWWZvqmYug2?=
 =?iso-8859-1?Q?c1tPdIWQ1YmftznEHq/U1D0eV7Cs14gd9w2N5gXFxwwC1L7Xnf7gonZQvI?=
 =?iso-8859-1?Q?oPiO+qcDoyPXeITrhUYfV9KKfAhdrIvyyQqJCYs94bnkbDSUAqpgsppiJ+?=
 =?iso-8859-1?Q?tSj/8iFaESFHkulPcO17BGXmkIcWvZ4L1ai7N6PGEhqi8CMCTHpwC+grzq?=
 =?iso-8859-1?Q?EAXKR9ybhp08qQmGjLbfZhQMilyoUjD0BUBDOnqX0SDbOrpMu/agzSJA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7515891-78b7-46f9-7bea-08db769457b3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 22:26:10.3465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OmkudCbU5ftaLaq/peBqawghn0XnkiTYMheQcJAqQ45S8a2YDcYmqBRa4BttWrc/rpMDAlNQbuXbT2UFvwoVJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5908
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2 v2] drm/xe: fix bounds checking for 'len'
 in xe_engine_create_ioctl
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

On Mon, Jun 26, 2023 at 02:22:20PM -0700, Paulo Zanoni wrote:
> There's this shared machine running xe.ko and I often log in to see my
> tmux corrupted by messages such as:
> 
>     usercopy: Kernel memory overwrite attempt detected to wrapped address (offset 0, size 18446660151965198754)!
> 
> I also sometimes see:
> 
>     kernel BUG at mm/usercopy.c:102!
> 
> Someone is running a program that's definitely submitting random
> numbers to this ioctl. If you pass width=65535 and
> num_placements=32769 then you get a negative 'len', which avoids the
> EINVAL check, leading to the bug.
> 
> Switch 'len' to u32. It is the result of the multiplication of two u16
> numbers, so it won't be able to overflow back into smaller numbers as
> an u32.
> 
> Very simple reproducer:
>     https://people.freedesktop.org/~pzanoni/engine-create-bug/
> 
> v2: Make len u32 instead of checking for <=0 (José).
> 
> Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_engine.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
> index 6e6b2913f766..530f55a33b03 100644
> --- a/drivers/gpu/drm/xe/xe_engine.c
> +++ b/drivers/gpu/drm/xe/xe_engine.c
> @@ -522,7 +522,7 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
>  	struct xe_engine *e = NULL;
>  	u32 logical_mask;
>  	u32 id;
> -	int len;
> +	u32 len;
>  	int err;
>  
>  	if (XE_IOCTL_ERR(xe, args->flags) ||
> -- 
> 2.39.2
> 
