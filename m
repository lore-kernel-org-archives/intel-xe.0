Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB99C04FFE
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 03:45:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6DCC10FB00;
	Wed, 24 Apr 2024 03:45:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nWI1fPmX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D525610FB00
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 03:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713930311; x=1745466311;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KShxo4ZZJPNAEDe39ITiw8I29sDViT0kUmq0YiLEVZM=;
 b=nWI1fPmXbYNTIOMzZO69nvMmDzfDvqwCOvMjT5OaKyOI+MNlWaF+Y6FS
 fKqGdU3sVvlGL2IC43gafRathjaBN6JCuMqav7Zokdgk+ej3jn+l8KSXO
 31MDWLtksVKR1AJ68WUB1qzGsmptM3KkybPFSlPnN03ysiEbr5kJXEYsC
 MqW1KYewCKEvHa2fkIRkH7l3TMtRfE9HVRMgaz21fST4rBL8xGzdhNlIz
 TRFg9RlHRt0ZqyWGcxGvWrzE8UZii6mo8nxp1e/U6L4OCOii+PZ9Tdubi
 EcDl90CAmJgz5yY7OZn+1xxadfWk8Z03iWzW8ij+ASAvTuglJs2MNAijX A==;
X-CSE-ConnectionGUID: BTntN6uxSECEWD8Cs0lFog==
X-CSE-MsgGUID: tDazVQAmSuaQtjJroLovgA==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9409458"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="9409458"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 20:45:08 -0700
X-CSE-ConnectionGUID: mxosUabrQFmitlgoLA48ZQ==
X-CSE-MsgGUID: Bd/u1sUhTPWshCuC0/CvoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208";a="24576063"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 20:45:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 20:45:07 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 20:45:06 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 20:45:06 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 20:45:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IM0OT5EK81eocEWne804Su+ZigkgQkttBE5JC5uEzQAHOnUVCXPxccn/Ga9lqCzuEpcGPUfStyQtI4OaD9CaojEhBijjaE/1RKljJAFaTnm/LrsnRFFhbHfknm4UvQtlvChxD6YyDV5rc4g7Zjgr+S8VnjflvrIX7bKQi76/tY8DAtt/3uofBczqLWN6CzKApgN9G0IjLbGu9JkmYIvu9SADl9EZFJN4OqqrOYQaR78PMuNse3w/xuPzfDfTpnYNSOyEnk/LheeuctgcWl5N0Iq3h8ifdLpJkayqRd2dIa3Zva5DwIMurmQS3MGD88NivMcKyO8Zz9RjhjTszwTOzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tldWW2Gr3/RP3WkQzQM4J70HT3PmZEHsyT8jpJwZVjE=;
 b=hYpk9vbfQdU0KgXJkyHY/Oy9sQmoUJTomX5iPGcSmeDyupH3I9I9rzjY1ZpWR1sq67sDU54UWWH7OKPRxuomUyM9BAuBYGdIHnO5WRG6ODLD/hL7HxLVKTzFANN0V3AbzpnZvvFsns4N0Sw3xVz1fb4VUKqyMHMyTCYNWXUcdkbE/ODi0p1AK8nMT/fmRqrCTivpI2+lvwpoVhXlcLHWkFZ6vIPjGWnOLYpdXbvkPslipat0fyNYrNjXXAclmVsx5/kXKDtokzsoZGypeGMHmjFYAC3siBRT3R5F2ixp0gMbCTZNDLZUtkKejy/ygBS2uyoKcFe27KtY6foBcjJxYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4959.namprd11.prod.outlook.com (2603:10b6:a03:2de::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Wed, 24 Apr
 2024 03:45:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7519.020; Wed, 24 Apr 2024
 03:45:03 +0000
Date: Wed, 24 Apr 2024 03:44:29 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] Revert "drm/xe/vm: drop vm->destroy_work"
Message-ID: <ZiiAHU/Ra5yeL7Ii@DUT025-TGLU.fm.intel.com>
References: <20240423074721.119633-3-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240423074721.119633-3-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR03CA0300.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4959:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e29ce17-cc62-4487-f5cc-08dc6410eca6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tfsJ0RYC7QKIyPm9gUpeKNk57v9sPbzy3Amr9ZNVkk8SCGjStuosIsmCmpVD?=
 =?us-ascii?Q?NiSh8b8tV4DmDFYvbKtuEATw7v6CIDFTLylaMqCP1efkwvt9SEWp7YQBRgxO?=
 =?us-ascii?Q?QApKbiJPpZaZZHGMlmIshpaw6jd2HsahXnZ3SfLEkKouo2p4YUXu1H/IeL7w?=
 =?us-ascii?Q?9coIMOGJ7rKxfB6kyU1NZKeAGAhuMus3zNXTtoud00xmibvvhOmdXFZjHQ6m?=
 =?us-ascii?Q?Y/HEqF9gt96Ok6Sxcv5pN5JiXVcB/UO4fZiBWYcbwolLxJkGSXU7cNuGlSSr?=
 =?us-ascii?Q?I2dmvnEgUv/xQxQybWLm2+26QKVwA16j0OcikgIcf2W6xoH7cbDmik+xOYow?=
 =?us-ascii?Q?xRG7+SvHZ7BeygL2leJVSxu7LJd4xWj0hF+v9sNPuDQjjWZf8Z7bMNJSaTab?=
 =?us-ascii?Q?yZY+W4hsVvAJXvo5FL3ZnXlNBEzrTN92JhK50uW7qmvjlFd264W9qI4Sw5mD?=
 =?us-ascii?Q?8454IidhiVjQrJ3je5sUcN2obV7e2iTLq7qjjsJ54CnqY2xmk6u/jm/FOyWu?=
 =?us-ascii?Q?pj0UnJWV/CjxQV01HSRyygydwVi3xDA0wquboQaMuRFR1Rnu3Z5uzuGA9CEM?=
 =?us-ascii?Q?XgRHnn30EImVERUpV6YR95Pq0CQKZdkfrr6/sj/HqV9JCEnl2cisp4XfmejJ?=
 =?us-ascii?Q?HicPmzKEPlSYygo4qgeo/C9RbOAHKl1erDpnE020ocCiII59MtsQMuVQDY8C?=
 =?us-ascii?Q?WKY0gBFzbfLBax8lqWBf/vvUKWjFQ4zk4gWCCV2pMunwHtwbuaGC1JpVtpV2?=
 =?us-ascii?Q?WRY/Owz0hy2bysOYHF6MbG057XcGX3CMlQ7RxuolZNnE8Y7knx1t1ykLWRH+?=
 =?us-ascii?Q?Qv4AGrjlSjz0NmJAXE+K2fBqZQa3tz3bRhdSIZWRMGdBHW11GOU+brvV7g6F?=
 =?us-ascii?Q?/qjBk0GTgasufX8rhhw8Ohz3KUpRIdnkiy1flXmCF5DQfs+PLO9EES2zZUd2?=
 =?us-ascii?Q?LDAdjQZfgdTtQbwIiBvtqZ8YnB7jFOqOj31liSR96kIWzZ09uvD8vwFRNolC?=
 =?us-ascii?Q?vc+Y/S+/oFhR1jHkYkbO5m/sQ1lgR2TrLSb+tlFOSq2/WL9dy/ZiXSrONv9r?=
 =?us-ascii?Q?wTuWsuMCDNL6hLIrF126DVdrMzWdcGXh1HmJC6F3YN8rMjBlH6Ig/52tmp5C?=
 =?us-ascii?Q?3XDyuSX6t7/Mehsi3Daq4lLjJG4Rl37eHidVTrggwqwD53qv77ygTEqvL5fK?=
 =?us-ascii?Q?imfMx+zSVm16ofqyEBaojhztzQboAOtE6jnR7thUnEGmfCW8JYK0JVp8UNKI?=
 =?us-ascii?Q?JPQhp5eTjgeO0g02hyyLWATBwzS9SChlZgJfBd3UMw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UZ94rlRgSJ1+7fZZspYLY/YXCep4KQOXH9tn/psx9cfbFnnQOhtZOL1qpZew?=
 =?us-ascii?Q?E1YeX6uS3RrPUN7GDaj2Kno/2/S3OO/x9Zd8RgmPXjqxraq6UdMALHJXqtoj?=
 =?us-ascii?Q?4+gejIXqoViXuyT4UpsXrKOoB2MVv9VSAxE3VsuWbJi/qDqFieoym0pENWE+?=
 =?us-ascii?Q?TqeXx9VEIQI0HY8WpYqqBTxUiUG9IMGw05RnEQXbPFAZfjr9bBpw6RH5eCoy?=
 =?us-ascii?Q?Vw61lAAUV8t03WjXRBWrGoKkz9zgE/su+3s50b00INGIGEX2LnmZTyiKaCrJ?=
 =?us-ascii?Q?7YOQd0ghMkqAKGZXev0Mes9/8XEfr1jfEMO1xevuIueElJOQzNgEy8W2ujqM?=
 =?us-ascii?Q?gUSNgvOgjHzEds/E48Zx3X+cQUoWDg02D6gjm1OQcjYZEFWLOUU7WXjRQEn3?=
 =?us-ascii?Q?ikdZULx3qKmC2umuPW9kl22vR0uKoRPl5B2n5Ea3DzfGFITVXUoYCia++/SE?=
 =?us-ascii?Q?v2hvDLOG62OMN3A0rIL68JfHab1PcVR8HRd8CXXKdRU/5GrlcDyQbvqsRARc?=
 =?us-ascii?Q?gSSL62dX3VDpBILhqGZTvVvbx6qOfnr5bwU0Ccn1bsjXUUc7iqk4g46DFsZT?=
 =?us-ascii?Q?9wGpjUX/dwY/ZSYnjfphfvePSR6rrvAEQTAp9xeK0+AiMmYocyMnD+K6GruD?=
 =?us-ascii?Q?8MkqJLPoSOqGoc258YLCDkSFNSk4V22HUb7jjMrRMb2xt1c/JO2tLZYA4pit?=
 =?us-ascii?Q?rwJMyXUFsNvX0CTRPJKvnajaHx2BprYqcCZdfl3OTQKcEvDJyT3RvB6kMtz2?=
 =?us-ascii?Q?rURAGB9R/0xvSBmnXqOEGsY3g8Mpc7FatxGYAZbO1Wt0ghWyjQCdjq//DGRc?=
 =?us-ascii?Q?uer1Eli6jWtnsyEVG7c1nFuUzex29jvlaL5fgaZ6Patn2pMzrc+XJ8IbTqLa?=
 =?us-ascii?Q?nRYBcHgZwO8XIx5pdejN/h9OQ6B1mZJFzysAyn4DfN+QkBP6S3FRkxsFRSo8?=
 =?us-ascii?Q?ycInEzQkXRT8Y6mwDF41IujvURiBP8es6yREBdunOpGHQ9/YBszVHEgIIuya?=
 =?us-ascii?Q?UAWe6WDV1gNndUHFdr0tP7OzbgQGSSWG8SVEM/H43sQ+Xr6Tppnj54FQxpCo?=
 =?us-ascii?Q?LQd9WtUU6ItuUkEBYUPIpwaTc9kKhtFLnhLqVExSxIGsk4AYHUt8LTd/vk6a?=
 =?us-ascii?Q?W/6xiLcLnj4463kl9k9WZLwzqr7+ZiYdqSrcreO6jGOuJlXyd7QchpEgMNyK?=
 =?us-ascii?Q?I/VK+vF0UvKKiOApc/Jb+hoK1fe4Xa+zrek7xwgWTlHgPnl86G8hvR1s/7Nm?=
 =?us-ascii?Q?sM2aJ08UUS+K2PP8mUPj5vQPZPwe9HpVhjbRrhIFUaay6wUk+NMllyKq/rfF?=
 =?us-ascii?Q?cVmvuWrh/svQLwAqIjH4bE/OD7r66WHnrhMLCAsi1F8bT6AdvPErpfmwN2fN?=
 =?us-ascii?Q?pwSZBrQ6FbuFAFs10Irt99enAXxTT2Py9MRpnP75b7ggzP87UQDgszLoZYAm?=
 =?us-ascii?Q?kMbX3G2M1DyMIVsoFqMLPH8IcBFGq0thgKkOjWtfgqJl/6Y2NsgyWjMy+8nU?=
 =?us-ascii?Q?vO2d4Z3Ktd+NLufBUXyAixfhLGQPRhg6xE/EPAXAD4xgkagCcH09oX+Tq683?=
 =?us-ascii?Q?NapCWFjdPwxJ9m97w6iyNsTQReDZpmuVEO+ylbFHAGa8/Fcelzg1+xzA3+b7?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e29ce17-cc62-4487-f5cc-08dc6410eca6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 03:45:03.3424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9wkinl05/Zw/EFt2uub45Ih6XMCjLwbtQfgf4eLnt8oJnYlcm4yAxT/u6YI9868fuG6e6FfyYqLsW88as8K+QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4959
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

On Tue, Apr 23, 2024 at 08:47:22AM +0100, Matthew Auld wrote:
> This reverts commit 5b259c0d1d3caa6efc66c2b856840e68993f814e.
> 
> Cleanup here is good, however we need to able to flush a worker during
> vm destruction which might involve sleeping, so bring back the worker.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

I guess the alternative is is a lock + plus enable variable around
queuing of the rebind worker? I suppose I prefer leaving the destroy
worker intacted than a new lock. Also there is a large chance at some
point in the future we will need to sleep again on VM destroy and will
need the destroy worker anyways.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm.c       | 17 +++++++++++++++--
>  drivers/gpu/drm/xe/xe_vm_types.h |  7 +++++++
>  2 files changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 85d6f359142d..2ba7c920a8af 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1178,6 +1178,8 @@ static const struct xe_pt_ops xelp_pt_ops = {
>  	.pde_encode_bo = xelp_pde_encode_bo,
>  };
>  
> +static void vm_destroy_work_func(struct work_struct *w);
> +
>  /**
>   * xe_vm_create_scratch() - Setup a scratch memory pagetable tree for the
>   * given tile and vm.
> @@ -1257,6 +1259,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  	init_rwsem(&vm->userptr.notifier_lock);
>  	spin_lock_init(&vm->userptr.invalidated_lock);
>  
> +	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
> +
>  	INIT_LIST_HEAD(&vm->preempt.exec_queues);
>  	vm->preempt.min_run_period_ms = 10;	/* FIXME: Wire up to uAPI */
>  
> @@ -1494,9 +1498,10 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  	xe_vm_put(vm);
>  }
>  
> -static void xe_vm_free(struct drm_gpuvm *gpuvm)
> +static void vm_destroy_work_func(struct work_struct *w)
>  {
> -	struct xe_vm *vm = container_of(gpuvm, struct xe_vm, gpuvm);
> +	struct xe_vm *vm =
> +		container_of(w, struct xe_vm, destroy_work);
>  	struct xe_device *xe = vm->xe;
>  	struct xe_tile *tile;
>  	u8 id;
> @@ -1516,6 +1521,14 @@ static void xe_vm_free(struct drm_gpuvm *gpuvm)
>  	kfree(vm);
>  }
>  
> +static void xe_vm_free(struct drm_gpuvm *gpuvm)
> +{
> +	struct xe_vm *vm = container_of(gpuvm, struct xe_vm, gpuvm);
> +
> +	/* To destroy the VM we need to be able to sleep */
> +	queue_work(system_unbound_wq, &vm->destroy_work);
> +}
> +
>  struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id)
>  {
>  	struct xe_vm *vm;
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 7570c2c6c463..badf3945083d 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -177,6 +177,13 @@ struct xe_vm {
>  	 */
>  	struct list_head rebind_list;
>  
> +	/**
> +	 * @destroy_work: worker to destroy VM, needed as a dma_fence signaling
> +	 * from an irq context can be last put and the destroy needs to be able
> +	 * to sleep.
> +	 */
> +	struct work_struct destroy_work;
> +
>  	/**
>  	 * @rftree: range fence tree to track updates to page table structure.
>  	 * Used to implement conflict tracking between independent bind engines.
> -- 
> 2.44.0
> 
