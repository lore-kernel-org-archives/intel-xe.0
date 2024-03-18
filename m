Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5D8C54E5D
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 17:05:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26BC410F79D;
	Mon, 18 Mar 2024 17:05:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N8Bm95vX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19CDE10F79D
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 17:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710781522; x=1742317522;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FdFx8MSp8Zu82pGoXurnLvFRzSwYCCr5wAAaI819nkk=;
 b=N8Bm95vX2/8myRi3tZn1VUnyrmmczmTF2iodY530XQ2H2pUHqBnvcPoj
 qk57pTSeSP1V8Bpppu4A0Ehd6OoToDinBQMIU4J8u6pZbusYhCRihKdaD
 yaqT2EeNMoKaHV+xaZ+d4HwU+MwM2qxQE3WYTLJ2202hLzyQjQcfskcLo
 YKsrJBOaUzIsq+BrxEW4lH5PvfbImYyK476m3G94DG+5n4U2gV7ylcPcu
 PrfGdUskg6yuM1f98pJqCJ7Q3HWpmghe3s5Lb7RLCADshsi3NUfE990fd
 ZBKjAsnwBNZo6XmxQg8rQut69SBl6vkLfIk/0dSKYVEDm9IP3phrHmWqL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="28087222"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="28087222"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 10:05:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="18231985"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 10:05:21 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 10:05:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 10:05:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 10:05:20 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 10:05:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hHTaN6DJW7gEnfzUEEMmYfASs/0sVAAafn+Sq9mhameCOcpqMIUR70D4l7/1zB4ReZBG6XhyqjATgSGsSwkVTc95BCIua8cA7OWlpt6GHVEYRMApGVmzBKeHM7xjMH2SQ2Q3x+j3kvwR61HaO7JhpMEvL8Z8Q6pCCtg9PUI5fOYcuyXQhTpAV+509122K5/ao46zQCPAkgVlQYTIqaiiEpooFuWZ0EKBiZQ+Fl5QStnkqGO/tX4Af69a5xJ76ITz7g5UUOkGqrZTJ7rA4QzijZmMWla2w2+2ab/bndziC0AgUCJppQMCvAg5imJfnWuTMtAfkwPZKZy334L0EUFp2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aa+HotrV0UGnrypnrty0LkGwaQIdE1ow7FcXPUFTB5s=;
 b=fy+EWUyIKanXG6wQa3LJlQQV6e+TFtOjynBT9NtHts0DWbEuIjL42ewV41Q4ANCKystI+n+hL/xutUXLlX5eB5BfWQCatLiqDqytF1cZ4gReoNw3wKAHN6H5dNvW8LzeX/irOKgaMirjMeboPhG/CqHD3UYVd708ei0BHKpiL6ibdwLcDi9I/mExQd3fC2tz541MGCvuzFIDlqkL4/jugHp2230eCa1T4e8racGur5vACYFe9MW2pjC0aLTz0yQi6FjmDbZ/mILgVZZttdm5LQVALtrdnW3qF0DZLVf6YPT+BiyfaDgfi30UXsjj5DdIpDOff6J5+uSCzKYxp4biEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH0PR11MB8143.namprd11.prod.outlook.com (2603:10b6:610:193::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Mon, 18 Mar
 2024 17:05:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7409.010; Mon, 18 Mar 2024
 17:05:19 +0000
Date: Mon, 18 Mar 2024 17:03:29 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe: Add a WARN_ON for NULL job in
 xe_sync_entry_signal
Message-ID: <Zfhz4YTXolRatbqN@DUT025-TGLU.fm.intel.com>
References: <20240318164342.3094-1-nirmoy.das@intel.com>
 <20240318164342.3094-2-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240318164342.3094-2-nirmoy.das@intel.com>
X-ClientProxiedBy: BY3PR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH0PR11MB8143:EE_
X-MS-Office365-Filtering-Correlation-Id: 70fbd4ad-9591-4a7e-a74f-08dc476d96c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gxq0KRGydASo5+kHKQN5KtwMIM+rKfjsIn/+fNb/GnAhPc3JOXxTZu6l6aCcl8GcZnDupGR1ymb3jMzMQYvpECTNNqxHUX24U70h/0tJ5wpD2HwNP1CEzSnfnu0BlJQJAhzI/zC6OfPpTNSEYFodSh+sEQ9f28ArW/aNlh7Wc/lUEBQPpUo+FDaacEo2Ieqhsa1NclCKl8c2Us5LtdCmKapR7EqZYcWazuHYhO5kDSpg79yOTJpcntBBtMT8qXQPW5LmTnTuDr3eRM/oLa8rm/QWK2KBARupgcVIGklMZUNgM+NmxFB0bIhMWbxftdASHh0InaIDi+/NtxKq6CS36UtrMbzlNjDNdc08C19bAuF1J1dpoHt3PtMU68EjlQlbFUPnwvX7hBiMimEI81U6W3oVM4AHsizEAfWmPLTQxHhx8NW9gja7/UhjjDQ1zzK/3N906Xh/unl1WqxxWODeV7UTRRRR+T8YRCCdKwmHiomePABTiIkxx406cHf+hQcE1jLv18VLj0ZTZRUSS1tDGoxVK+V3pAXlwPzpyxqpdPXjpZVYMGwsGmw2cuz4KtmGvDbmzN2CC0rFVIwoAw+RL4qCR58wpR/KrHyF6QjLdthhdVYq+pTd7sLwCfBJyJPABFFk6Tl2yPOxFFIVfCx1SIlUZ6x17lGLr11Tfkb4PAs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dDX7ImOhosau8jD6IJmg4YSuY0BxkFfeJvnI9cSWidJvUrp2hdYLt+EE9DtB?=
 =?us-ascii?Q?151KfBeVUNSUpbJjwt/kjXWRBHt5VqrgVwOIgnILo2lLVGC1TW/4Nr3ZC/Yp?=
 =?us-ascii?Q?GU7UGNnBrQ2BlgxFlPoOcFNdPc7p9f0gAykfC5zoG1lTHYI83LyTUUaqN0sO?=
 =?us-ascii?Q?U2vZJrriVg90xoN2WdQWPyPrMq51RLf+z10585iwkimEkPaZEo2BjtL5AmNV?=
 =?us-ascii?Q?HMC6U1jpDlwIVgqNimRNE6uyQU0aH3tfOzjG7zuWw7xUWyvc4kjnI+maJR34?=
 =?us-ascii?Q?6A5kk0C50Ul56wLcYhAY9ANkicXkvXxNMUgwrRpe5oKTwXfMr5mdZDh1luSw?=
 =?us-ascii?Q?fRu/eT3vfnux1uNuiMnvZP1tpqUW9qRDU/ut1STPH2E6QSXOuFSJnnUiSSTd?=
 =?us-ascii?Q?Dm8sh1D94V2mojcl8ELS9zLQYkCyzjl6CBKgSsvb0iAZQ4HqmNpNC29/0NKD?=
 =?us-ascii?Q?pOnhgVAzj+3IlB5SHBqC/IdcsbywqK4RuWs4efrlU/9DbPMhnuH8kWPZiAQK?=
 =?us-ascii?Q?89DHNU7VaqWG9YmofEPO/0FIjBGwgvLGbUtj47hikP78hxS5qTvtOsGm6OhI?=
 =?us-ascii?Q?RtVQodhpC9/4XImx31YsyyFpK985dNIsz1glSpU+jY4jMkx7Vp1G5S0ZVafi?=
 =?us-ascii?Q?WWngc2KfVx3IQOEpSA7Q6/gZTpDAYNGvsSGA5Keipo9nZQJ9yVKYrdeZJ88J?=
 =?us-ascii?Q?OqkO9arXs8x95hQBgqPYKguVM+x5TRz0BY05xgMhf3z1qDc8ultKIzUpVf09?=
 =?us-ascii?Q?/5XNGceh9/3L3gDOoTAHRr9y2xLo8QhMUUG9ODVZWUknufO2+RP+Th3F0bTm?=
 =?us-ascii?Q?GDuDGtAd0jS2IP/jwR7LQEXydlt1GUSfSBCCyvXwCsczMYFwFbhIFG6K6BsC?=
 =?us-ascii?Q?XcCP5D0VmlYqd6WJc3N7XzpnFyn7H7wSTZc2NVY2bEoDnqy901gQDjYmaEM2?=
 =?us-ascii?Q?BOkq+qYS0leAgbTDsOISA6tfHD3gODlgpDMwB5c8C2hEa+n0T3iPzmrIjBfJ?=
 =?us-ascii?Q?KVmnnk9RBCvg8T3uL5V6OE0Oy/5KzZgl3utXH1iOoJtPP3oS6sU03iPIaUIs?=
 =?us-ascii?Q?p/esOjbTeMmF29AisrzDJF3xkqsMG/+eWLD/JatRuL9/1sEEXuV3ujYPUDn5?=
 =?us-ascii?Q?uIsm6poA7qtxqZ6BiRoTUYj4v/HgMSOdzQLLjGl8+K1Tw5Ic/QfsbqMhpuJJ?=
 =?us-ascii?Q?0XpcJqy5VPLGuqKX59QMqwIowLEKySjY9bDvuzaJJikvcyCbuGR+kpa2ZJ4O?=
 =?us-ascii?Q?JELXG0Pyks7WOjS0SIKQRzNturzBwyQp5A9HgMVqIibA/Y1IW+GEO+O8LYtw?=
 =?us-ascii?Q?oAZ8cDXYT+8ehVSm+eq3HOyFEN0rAtBVZaAjXu5pqQDguEMA044WbrUdwgko?=
 =?us-ascii?Q?d5+b/CRKuUnjZZj3K5umQT3dNjqtJbAqfVXIOxirldwbs3IKgAETe3xAYz+p?=
 =?us-ascii?Q?OHN5fuqxpULOnIlJR/rX2FqBD/a5rnM/Wz1JVyip+ST2xiAi+ErmYhxMYudT?=
 =?us-ascii?Q?S+11mqCN6gU880Jo2aBOrzUVDGAd2m9L5sL8/+keDxDy4pwXj+J+H1mZTzfx?=
 =?us-ascii?Q?AEYcdKhsED4XPeVfyq+A4zYgnwfxU6a2Q8E8GcsNdJt0M9iIXZTOvHzYsG1L?=
 =?us-ascii?Q?Dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70fbd4ad-9591-4a7e-a74f-08dc476d96c7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 17:05:18.9276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fo0WNpVqJUxQ7l3YLKr8oCWc5lekwcrT221lJhtaC+p2viR/ocQ5RboM2ZjPRyMXoOymoMn52tOg76jeMyXaIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8143
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

On Mon, Mar 18, 2024 at 05:43:42PM +0100, Nirmoy Das wrote:
> Add a warn for NULL job when sync->type is
> DRM_XE_SYNC_TYPE_USER_FENCE. This should be a programming
> error and should never happen so warn and let the kernel crash
> if that ever happens.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sync.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index 02c9577fe418..247505c3478d 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -255,6 +255,7 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct xe_sched_job *job,
>  			dma_fence_put(fence);
>  		}
>  	} else if (sync->type == DRM_XE_SYNC_TYPE_USER_FENCE) {
> +		XE_WARN_ON(!job);
>  		job->user_fence.used = true;
>  		job->user_fence.addr = sync->addr;
>  		job->user_fence.value = sync->timeline_value;
> -- 
> 2.42.0
> 
