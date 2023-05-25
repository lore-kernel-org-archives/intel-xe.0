Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1245CC7EE29
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 21:35:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E551F10E777;
	Thu, 25 May 2023 21:35:52 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39AE310E777
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 21:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685050551; x=1716586551;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=06AqQJhKp9oPIZLgzmmP07aXf6mtib7lvUGgFlI+ZLc=;
 b=fGE0gURT2kPQHHHsbqA8/NlJPYAb735MYWO24eO6xkBm4xhYmYXe5Y6W
 Rbe6oEbr2SaxlVVJYlb8r4yONQ7GsneyZNKw0KzrD86zFx/92XNCsAmEl
 eqO+1Pm57LsCW5PrWEz98PWDLy+XNSPhu99paH4Mo3ySxzq1FctI1vXCY
 1rClLlLOoRLE5ELRJjjHomHb60AHjRV8gJGmH2SWYhZ9/TbIpjx2h5Hq0
 cTUnVXaaMXp2qNEufOWDbs9yi3BVCQQ3xTWPXxEQtjOurgxRukQSE8re3
 Bhi8EkcSVmjtWN2h2ZcBa5KgYx7siMzQEiBiDVhOEThXsHUMqkHeU0AAJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="338631181"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="338631181"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 14:35:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="708152898"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="708152898"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 25 May 2023 14:35:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 14:35:46 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 14:35:46 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 14:35:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jk7R0E1fLjU4pLDpr3LTFRzY0hga1rs7uujOc3ysq/jDj6F6a9eq5v4mQpUU+7hV0da4NtFeD4Fahofw85Nup+31o4Ik8m5OfiksQ+Npd1BQJuzfxK8oyp3yKrEAoI1m4QlsU6E64BXQYfB7SJAnrWueGGbgNLCPbYJBMsQ56ltUGLSFqIndTY7HlZRhX1IUDwH82QhgRk7BqGn8b0RNlaLHv5mGXSeGAPGJIGsMoVYBxv7iTeLzAI0Y23QbastZ4ShCwzpQ1jwDwWCt++71YBiQowUMJzOhwA8XstXcxf+dCr4cDiYHh4rBqA8V0ssbWQx39IrOIUTpjfkcCyyR2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zNJeFM3rjsYcTjmnLgJrCf4DA+pfrg3JKTNbWLFs4e4=;
 b=mWcBqUFJqE4LppEPxYSn3MR3IlMzv8f2N7t6KVS8LCL14tXboRODo4JlNEJ2Nd2O+Qylw0IMdkl8saBvvU19wRwvmV3vkXAqmiYDPMkoJyHDXsNeTLBoVVdqHekBJViEhj2dtoeth2T/9mnJ7PrMc2BPIrHJ1dPLjjgbHcaQS8axRVuIAq1wl6bsKMT9m55TbvG4nMDog0oN39Njcg9PttXWWycxUPJeod53i98vN4oJ5qBBVhTz2Wl63TORbgCmbIwVxDuaVoh4/Qz/5X0cSUxraIl99oKY3YV5vdzv1RVONKPqw8fJA1Oq2/nH5HwY5wZ6PFEevzD0Uvjm4JANkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4517.namprd11.prod.outlook.com (2603:10b6:208:24e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 21:35:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6411.028; Thu, 25 May 2023
 21:35:42 +0000
Date: Thu, 25 May 2023 21:35:09 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZG/UjXbjVUauGOov@DUT025-TGLU.fm.intel.com>
References: <20230525074144.178961-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230525074144.178961-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0111.namprd05.prod.outlook.com
 (2603:10b6:a03:334::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4517:EE_
X-MS-Office365-Filtering-Correlation-Id: a1058089-1e6d-4c9f-e058-08db5d67fd56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5kBxAA3nF9BEr2a+Nid9Ex5Y09Vkr071v5s54nGb5yJYkxLaL+9kTHKxL8krP5CyLl2usNZKCjxv5Qqb9DzMosILlkjy+WIZ2e6KQ8t05I+UPrx6sAl7WI1aZXbOdW7rnU5CoKjQPdtMh82UFk2gFzWsFxKZyUmvmEPKkx37Mpo4jEslJlIjn3x9MUquiJjs9s/DJURbpBLR7UKvRWUru2I0JDLlndxgYV7vI6AVskfCPSXIfF2YKMoPJ0Q331BG7J5SHuJHhd6PWnId1SME4rTTGDL1BjXkZenIHxjtVWoY/hwXWVXHj8PZ4joKKehAGND0DbjFotamxd4qgjaf3Q1EMYzvv831hIRBuN/vbpWfswNLY3jfbftOEZao4GIj1pBcIqUWjptueFrAJim/dkcBr+EcYr+Hd/eXh90gEnxYuYGU48a396OkXoINLs3YR3JAlZ8aMj82vXbIr1+6aL0QV8w/qyN6bQhjQfR6mlehd+ivtSweHRCAdpGivxKIlvsIPEtYq0rFLz2ChnKBkQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(366004)(376002)(396003)(346002)(451199021)(8676002)(8936002)(6506007)(5660300002)(966005)(82960400001)(2906002)(186003)(86362001)(26005)(66574015)(83380400001)(44832011)(6512007)(316002)(4326008)(6666004)(478600001)(6916009)(66946007)(66556008)(66476007)(38100700002)(6486002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?EdsUPXpYGsKWWYAOWMOX35ycEdja9T4HNRqbw3Hvtydis3xR5Uvpmma26O?=
 =?iso-8859-1?Q?/vg5V3CM15eWuvh1LhhszDTl0r5zkvWRM0+fymL0oBEFTVIL5pUGmBXsiA?=
 =?iso-8859-1?Q?sgrgd7/H7OTrYc6vO+1d867Rm0qgHgl+SmXBxVaxzlgSa2mve89B+ZD5iN?=
 =?iso-8859-1?Q?LOXCD4R77XUkdTKW0xCer47vQRK0L3lfOP4UYnbhp1S+DAMBpyXr074A8/?=
 =?iso-8859-1?Q?1m5my9cFm66GZvg7R0XJSKEyrifWYbefPXfOHw8i9MoVgICXCDccsmWFyA?=
 =?iso-8859-1?Q?+VqMuYt5trE6HNtIRWLMQU1MqtV6O/AQQbPU5JviDBSgii7U9DjmWzp/lH?=
 =?iso-8859-1?Q?nyIPTe0z++oI9KYsCB7dUtif9eowuiELdFYHKUS6lsH2+pcqAfJ7IHrNYH?=
 =?iso-8859-1?Q?k7vrlkCKrT6WrA2NVta3q9DTfzqrXYxTjUkS2qTqp6BDksEtABcO83Z3Ly?=
 =?iso-8859-1?Q?oz16F53PJ4N1Mgv3Eo/tnHgGizxtOZ6IJs0vilsrfhF8dqscjZPVHUKShY?=
 =?iso-8859-1?Q?HyJNwzMGbtyxmIJ8o4IpKOuxRbcMM1hXhqCGDucQCGfZRelmS3085vBW4E?=
 =?iso-8859-1?Q?at0DVToRxEjPJsyWwzLNgaRpNrVRg8TY8rTFV0UvOHmmkj/JC580ztuQ3C?=
 =?iso-8859-1?Q?ld7bXzYlH+rNwO34XvH3VJhvwF9Wxrk99Nkaq80Ivu0aIyF8+sViImZu1b?=
 =?iso-8859-1?Q?AImFMRPVbpIxI5C3kMJDCOVu+R+yE9QYk/s5etnsIIHESaUFnN3oAMm6MV?=
 =?iso-8859-1?Q?TXsBispzzXwJjM1LA77gKMl+UPLamvBH7U38oUiEKH/CpA/DLfb3nHGviD?=
 =?iso-8859-1?Q?zhplbALItqholdeXAoyQH1YhN0MdaYvdGOjO71heX6tJfnhPVSJKoqSbde?=
 =?iso-8859-1?Q?lDWl9g128l9X4rL/lraBFlRACmfmnzjFgCapJtTiH4okcdylFACtbMitR2?=
 =?iso-8859-1?Q?Mwp/RsMa4TcU/GkbWM+9LtuEZplJmQdRgZk8Jk7rn0XAf4tUic1frcyOTe?=
 =?iso-8859-1?Q?46eCB57fnXniv+FQ06elK7kctdfq8ngKLFcPqoXMdHC+o3X0+3KsBFcak+?=
 =?iso-8859-1?Q?w4gfkrbzIvk58CxkabO+LJDPzUKtx4PgyTWrXdzLO7wVcH3YtiRskdelTa?=
 =?iso-8859-1?Q?AjeRplM+jh9l5OMu+OSv5cXKttA/3xnc003Qz3h6HNBsdvKRG86exKqQcT?=
 =?iso-8859-1?Q?2X9MHHAJDTk6k0oxNOkr+zGbJbN5rW6ZVorv19AsYaxjMfy0dBuhfMpldS?=
 =?iso-8859-1?Q?VY+FtgaBx3VDH+1DJcjUg0a2RNW2uWscW0dl/pg8R1BqYulob4CVdEqMTM?=
 =?iso-8859-1?Q?Eon4dtTVzW2W2+tNgcXGq9P1fBI+DL/aEYBJ7WpwdYTCFR7cKYnSr9cfW+?=
 =?iso-8859-1?Q?wlDaPkZz3QSAvQki3DTXh5PbQSJUEJHDtO4L2B86PjjYnYHmqCrzccsj7A?=
 =?iso-8859-1?Q?TOdZB6GaHitwX1tWw1oJWNeYLvBkcc9u7xIJB8tVYeR5F30ConNb7Cfhh0?=
 =?iso-8859-1?Q?K8E4hJFVmNeS4QqDJOpkZs5N7SPFEgdunea7a2QEPPfS+k093oJIA0AmuE?=
 =?iso-8859-1?Q?2+pESq4WwshwOylbgoewNifsoXM0TDU9T6Tr0opoDmJICScP9gCPbmhON3?=
 =?iso-8859-1?Q?aFqAPoUNWV8FSXZscAce8UMnUgRvxFEEzT4zG0oskCQJSb07yNGo6xYQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1058089-1e6d-4c9f-e058-08db5d67fd56
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 21:35:41.8348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B7Ku3DUHt/+X+iax676VuB5FjUatLgk6OzerD1l3DEkX3cFOrG/pq4HrZkrvDm0VSpmQUlsGr4W07uPwfs7tgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4517
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix vm refcount races
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

On Thu, May 25, 2023 at 09:41:44AM +0200, Thomas Hellström wrote:
> Fix a race in xe_vm_lookup() where the vm could disappear after
> the lookup mutex unlock but before the get. The xe_vm_get() call
> must be inside the lookup mutex.
> 
> Also fix a vm close race where multiple callers could potentially
> succeed in calling xe_vm_close_and_put().
> 
> Reported-by: Oded Gabbay <ogabbay@kernel.org>
> Link: https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.html
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 26 ++++++++++++--------------
>  1 file changed, 12 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index a0306526b269..ac25afac89fd 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1463,10 +1463,9 @@ struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id)
>  
>  	mutex_lock(&xef->vm.lock);
>  	vm = xa_load(&xef->vm.xa, id);
> -	mutex_unlock(&xef->vm.lock);
> -
>  	if (vm)
>  		xe_vm_get(vm);
> +	mutex_unlock(&xef->vm.lock);
>  
>  	return vm;
>  }
> @@ -1940,26 +1939,25 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
>  	struct xe_file *xef = to_xe_file(file);
>  	struct drm_xe_vm_destroy *args = data;
>  	struct xe_vm *vm;
> +	int err = 0;
>  
>  	if (XE_IOCTL_ERR(xe, args->pad))
>  		return -EINVAL;
>  
> -	vm = xe_vm_lookup(xef, args->vm_id);
> -	if (XE_IOCTL_ERR(xe, !vm))
> -		return -ENOENT;
> -	xe_vm_put(vm);
> -
> -	/* FIXME: Extend this check to non-compute mode VMs */
> -	if (XE_IOCTL_ERR(xe, vm->preempt.num_engines))
> -		return -EBUSY;
> -
>  	mutex_lock(&xef->vm.lock);
> -	xa_erase(&xef->vm.xa, args->vm_id);
> +	vm = xa_load(&xef->vm.xa, args->vm_id);
> +	if (XE_IOCTL_ERR(xe, !vm))
> +		err = -ENOENT;
> +	else if (XE_IOCTL_ERR(xe, vm->preempt.num_engines))
> +		err = -EBUSY;
> +	else
> +		xa_erase(&xef->vm.xa, args->vm_id);
>  	mutex_unlock(&xef->vm.lock);
>  
> -	xe_vm_close_and_put(vm);
> +	if (!err)
> +		xe_vm_close_and_put(vm);
>  
> -	return 0;
> +	return err;
>  }
>  
>  static const u32 region_to_mem_type[] = {
> -- 
> 2.39.2
> 
