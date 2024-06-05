Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C259BC25B76
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 21:45:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7877E10E148;
	Wed,  5 Jun 2024 21:45:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LsjgpISy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC1410E142
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 21:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717623901; x=1749159901;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ag9Y5QeuvZ8N5SUzJYufTwgTjxNcKlNpQzeSCREgDGc=;
 b=LsjgpISy3/sFsK8zwQbNvcfx0dQ5K8RZZHDuYLBp8oBAv5xXLTb5RY6c
 NZNJR3ySMWx/Pl4g1t0bPA5NqawdwQsswp4ZG+hDTOAR8+DXH2E3i1V54
 7h4J5OASwilrJva4ZbDoK9uzVAMPoGCVkvp5meKW5xIdV6byBS74HzLvL
 h2993R4aK20RJMG2J1GcOdrmVlZB2Zv6V6Ydmftyv6zB0rmwX649RJN3X
 GvNR0BOwsEeuq4Zv6V6k1IYcyEGwCfR+OwaQp1AfSyQjhdoybVsrLJUu0
 40Dnnr/23t7aHoqBfmHSNKhoJcvCQDdepmHg0TOqSL1zIvO7CMz5L9mW+ w==;
X-CSE-ConnectionGUID: d8Zo/Km+SaiCOx2ALZ/bpQ==
X-CSE-MsgGUID: GK0PB7EuR6mOkg8+6ixWgA==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="31805361"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="31805361"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 14:45:00 -0700
X-CSE-ConnectionGUID: 7eeCeJgrQz6NMTFUienKkQ==
X-CSE-MsgGUID: CqKWp+GsQySMnMvdPM2S+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="37840447"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jun 2024 14:45:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 14:44:59 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 14:44:59 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 14:44:59 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 14:44:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ca674UCZ2ati6P3/gbcqEAMMtyszZBPLLApGzUjVEV6+NhjtAX8Zv4JZvnTB68293C1s7PwEYJaZ2ZsZeKVQz9k7aMLp02C8IHFUkJ0fPipD77HL2pIv87oKzzi0z10OMHy8OrW9VbMbA538YCKR+NhzjpMnqvXPkaoOqKeJrsF40qXrVf40iT3LjNuROOXI68LeBoHxFwLcsFfpIYL7rIEs89/U0VVP5+slHU+ZyM1ouyTe0ojGMnjz8CrPkTxgX+AhFqYaefPehSBKmyBPdUXTUWT+gMnIw40KN+eVGH1tQt+nDjezkBkzOGOg7BG1qR56hlJJVW0ypOITEPCIeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yA6hNTa3oru0VnnFRks2aXeRzseVM1cr+o3RkTWJDnU=;
 b=dP2FgJi9iXMt8VP3mvinEW4MNyYQRQFsCFG9ZuawS1nzJnvxOZTHoqLaN9VB4F0SSHXb6tTENjNbc/1WyaG02xJ0CAUjK87NwXdA1Ygx/nnyBRZk8w5juNb9AkYzRmY3OReWZz/OLGCXwTJuPtcCUqKOSAMhOeNDyZkjN/x2rYPoNY/hvyJBwbrvGsAKbaxCIVPP581V9v8lV4waRJPGymIKP0vLzMWavw+n2Nf1cVKBd9RrZIYAUIufbtgTc033pT4tLqjlh0Ndixc3YgQTZHhXumHkabF1/DxtrokRQw0/Jk0z9FJxBRbp8y8PmtZ3JXlRt1Qo0Bq1a86V+HIoKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CY8PR11MB6986.namprd11.prod.outlook.com (2603:10b6:930:56::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Wed, 5 Jun
 2024 21:44:55 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.7633.018; Wed, 5 Jun 2024
 21:44:53 +0000
Date: Wed, 5 Jun 2024 21:44:02 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/guc: Allow CTB G2H processing without G2H IRQ
Message-ID: <ZmDcIk9HzUx81Tvv@DUT025-TGLU.fm.intel.com>
References: <20240605201947.1460-1-michal.wajdeczko@intel.com>
 <20240605201947.1460-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240605201947.1460-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0260.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::25) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CY8PR11MB6986:EE_
X-MS-Office365-Filtering-Correlation-Id: 916d65d1-c88d-4d91-9871-08dc85a8bbd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?k7P2lfEL2xbnTj86g7A7bkDyYy//LKd+jYu/S3b3hIW6HQQg2sJ2gYgZSSn/?=
 =?us-ascii?Q?RoeLR09D1GwPi792+erHZvMdMAR0dccKvlyhRGeBqh72anzxB1PIoCI8FGdY?=
 =?us-ascii?Q?Rw+Fkadyt/BF3Dmsk73k+lyWSUGDuP1Exl3Rq6v6sWc6xeMggoSl4q+Vvjkw?=
 =?us-ascii?Q?r2lODcW0A3Vq8/KjDBTBKQEV8cLw0pgL0BwO5Bfp0PwDVuLJM9SGF7KU6KHD?=
 =?us-ascii?Q?XYWY55XyYZPiRKBL6nAyMNLwI01kuwxk33SBRS9UKeFHRB/qn8wxkJiXoY2+?=
 =?us-ascii?Q?5zxgIdTx4bDLMQV0u9qSzDgmV0MMcZACqjTzXG/NoxyVJMCUb7ZraCvE1Aha?=
 =?us-ascii?Q?T+cgbA2VnEfIS1nmcvPfgxDfjpjegR67pdHAjTXkccTFhz6W4GBcXOcTIckM?=
 =?us-ascii?Q?AYvLNiq5B1dYhjnv6OSPBS/uyGYESAxbQs0HbA1Z+cSIlG9AOBgErdoKH/31?=
 =?us-ascii?Q?OZgRBzuzMGExn6DmQ7EK7mbTJjMqtPdaJOZH82u9tCMsTkUr3xslytc3H0h6?=
 =?us-ascii?Q?eZH6cNMhHcW7Tlfm1lcGf0T52FOcqtTi5X2aEW7NS4/G7sS39yqxjUVbhvwb?=
 =?us-ascii?Q?KMvdV0CiTdq8FWaQ8DxW0eTv9Gn8Dvo08NHkYqkY/yrt4Bd4HGEnV85/YscD?=
 =?us-ascii?Q?r+khlk6Y10SpE6usK8vSUugfJ3wxbYOZBX6f1z9KBwiEhZ0cqV3JNdNCdvtO?=
 =?us-ascii?Q?m96XHNKeetwPwijttXY6DzleiMGiUgiS6vStadnwv3aWgko0MuDDk5yyziL7?=
 =?us-ascii?Q?ZDUTRVeRUtvENcqXaw1JgfLJVqh8O7UtMqDx3DTE11mfBcxS+3vvxZki/7J8?=
 =?us-ascii?Q?Ca5npamDVMwg2Hqb0sDposV60xSdUgHaT0R/4VYgWuiuv0V4WM/suTsHRj6Y?=
 =?us-ascii?Q?sRSVXtJsgJzSptuQkxegeK7VtVclWnDplXVn6OZFt5CpsN20qphFsqxsfkpR?=
 =?us-ascii?Q?8GUxO3ZFhK2HLJO4LQ+pCpLVuBRYQXnKFk5QLjECa7s1NBYXTRfXRAU3WL9d?=
 =?us-ascii?Q?Y4w3nMOMlfPMmfhpJ2pp+/bJdJOvOoXcriE+9oLJlfuoNnbsXdnSObTwmkwQ?=
 =?us-ascii?Q?UeRRVOPvYETQX9VwT7KqBqiZj68Y4oJqN+JbPFGiyQ6VCc9+Msj9Tg6sdCbo?=
 =?us-ascii?Q?RZio9WvTqzYBa39LW+7OMO4eorhWNClV0vdgKigP0THpTvTxIzPEN3VUbiaY?=
 =?us-ascii?Q?nGsFIU9ID16N8juzwOAlJj/OG9uOMFa1tdi88Oy3JGfopXYHfYF78Ka7+1oG?=
 =?us-ascii?Q?n9HvaweTaJ10W2Yunx04bGBZBKiwMRFJDqHTOWfDpA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FR6bsPjlzZg99/XgQTjKKOzVo6e38hWdlesY+5WAEJkIK6LKX8l+KzvUyJhU?=
 =?us-ascii?Q?+VKTzyuDkgerJDmtjX9Y9BafTcO8ry6aGdM/FsAm09z7lGn8pz1F1BrJgtLK?=
 =?us-ascii?Q?yGFlA2RJ93SOvZ2Er+RxRtdWCSSYXAIkdH3hhKHFxfkYS2qKLPN5mPP6IV7V?=
 =?us-ascii?Q?MWHswFLOni9qe99O9jywghBG5sMRmR5O5o8CdnZntnTWvIIrxNuHpGNSi0Y+?=
 =?us-ascii?Q?idwSHdbvbFKInXoYPYv7ujPDGqMxfjjpYkImCGO2aZechB9cVe+BY1cEYMj2?=
 =?us-ascii?Q?t+eNs9mkMox1q+p/y2XOhqHDURFKR5xA8MHArCI2L8iVKkOBhR+Ym7w0wNz+?=
 =?us-ascii?Q?fgq0JygzCrnuCg0yZOKMRZcWS1UpZV5pRDn2esmBNkwMVKFD7xlTGHF91HLj?=
 =?us-ascii?Q?j/IQD7tUGyR/Ok+uAkCQUvh5Po7vx+IVkISkZSCaOfq5xGynnYobDWqGuqis?=
 =?us-ascii?Q?nkEUNvTWWIUvGqZ5neNd+YRYXSemvgP785G4XK9fCUjYJzxROZbGg1AxgluV?=
 =?us-ascii?Q?tU/pmlVBfXzMhY6nUcSqxLj9G0nUwq2/lBUyttPIMNtiOQrlOm6FTmzxWEEr?=
 =?us-ascii?Q?/H8ybdMksNc4+6l7ehbPI5tiSacRg0sRvd6sesiIOB4emaK78os+L70swb4c?=
 =?us-ascii?Q?YRhnVCOnNXBZQq8LNZuDA6ZfSzNcxQdg0mk6HDBJhkjX90eZs4soUz4/kQCi?=
 =?us-ascii?Q?tKy+Bi8TJsAHc9jCBhfy24D/Oea9M73mxZCS/h5421H/W79at4OMsWu6v4E0?=
 =?us-ascii?Q?5vvKgsbZZ/u/6lgn0oCgk/mCggxpMyNUmrTYPsi4gY7fdrVbB3EPDnGJKiff?=
 =?us-ascii?Q?Ia5eYTkolE6NqmmYH6RTg+0UJYlst0KHOlhLUmobbB7c8UmdvKSQ7LI6CJFW?=
 =?us-ascii?Q?l7lb2QxU6MGhp5/GHtRajyzUV/6UVmQDH/iFSuYKEUkXrIldVActlbej9/yc?=
 =?us-ascii?Q?7YdfBI41mf78hKAzb5FXWxG+7OTjkMxSFEjavHr0aqdspK7P5sbmM/ZDRZwp?=
 =?us-ascii?Q?3ZkB3BulErW/q+O7Er+JdlzB/rnpIAHhfyxBdQomgBtPUb8vZh0jYbikbUoQ?=
 =?us-ascii?Q?wScLfNmUejmBnhR5adZNZ0vdzRegjcxby/JChibkBL+XZ2elG1HXTNDXDkXc?=
 =?us-ascii?Q?VU6LANW0eI5LG8zSTLBY+RVrm2MXdYq5nWATPU7CBZk6eGYe/wpEGN8tWTPU?=
 =?us-ascii?Q?YQS6BHJC0aVEIy7PYU1Ri1+SBKER+t63Izhj7LOsEy13eXuV0YHr/LeXPUKJ?=
 =?us-ascii?Q?ct+AKQZuiSBpa9G3nFdPJQ5X7i6DdYvkPO/h/yyN6bEKRRyWMoBL9mXTwQMK?=
 =?us-ascii?Q?B4Yj2oG2/9/OI+XNdMkwBUkVGJYYgTZvj7LsGqxbg0K2vJCP0xOzIIX3f8wo?=
 =?us-ascii?Q?Nsu4JpVhRcpB0WLOovTlYRsZSY9DQpNAZI+uNoCVcPTWQztaIrjSSG4BIBfb?=
 =?us-ascii?Q?1TheJhRjRVommrsvQgNou7mbX1VZ8B7PE5g0FUQB1LUNTTFzlc8lZH6h+iXl?=
 =?us-ascii?Q?eDrzCTR51/h6Lv7ONRVdmRxyoGTouyqfUkxpmFjP1ktBlTdBKlD8EycHvGPf?=
 =?us-ascii?Q?UthAyKOZy4MMTABLgrEtqv0YYlTlmrLYVzJvkZKIdGbAgVBfSVSQGB3TlnrT?=
 =?us-ascii?Q?4Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 916d65d1-c88d-4d91-9871-08dc85a8bbd2
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 21:44:53.2957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oq19DvUS+6pgwJPl1QL4AIyBJkHfCMdfDzZv0PgO4q+HlBL9mSS7yc0lxrCkztVLQz9cpeEVtymwZUCacml7cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6986
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

On Wed, Jun 05, 2024 at 10:19:47PM +0200, Michal Wajdeczko wrote:
> During early initialization, in the xe_guc_min_load_for_hwconfig()
> function, we are successfully enabling CTB communication, but it
> will only allow us to send non-blocking H2G messages, as due to
> not yet enabled IRQs, including G2H IRQs, we will not notice any
> new G2H message sent by the GuC, including replies to our blocking
> H2G request messages. And those successful replies are mandatory
> for the VF drivers to continue normal operations.
> 
> As attempt to workaround this driver initialization ordering issue,
> introduce special safe-mode CTB worker, that will periodically
> trigger G2H processing, like original IRQ handler, in case no
> MSI/MSIX IRQs were enabled on the driver yet. Once we detect that
> IRQ were enabled, we will stop this worker.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c       | 42 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_ct_types.h |  2 ++
>  2 files changed, 44 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 17f0e5019bb8..b8155edb7f07 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -127,6 +127,7 @@ static void guc_ct_fini(struct drm_device *drm, void *arg)
>  }
>  
>  static void g2h_worker_func(struct work_struct *w);
> +static void safe_mode_worker_func(struct work_struct *w);
>  
>  static void primelockdep(struct xe_guc_ct *ct)
>  {
> @@ -155,6 +156,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>  	spin_lock_init(&ct->fast_lock);
>  	xa_init(&ct->fence_lookup);
>  	INIT_WORK(&ct->g2h_worker, g2h_worker_func);
> +	INIT_DELAYED_WORK(&ct->safe_mode_worker,  safe_mode_worker_func);
>  	init_waitqueue_head(&ct->wq);
>  	init_waitqueue_head(&ct->g2h_fence_wq);
>  
> @@ -321,6 +323,42 @@ static void xe_guc_ct_set_state(struct xe_guc_ct *ct,
>  	mutex_unlock(&ct->lock);
>  }
>  
> +static bool ct_needs_safe_mode(struct xe_guc_ct *ct)
> +{
> +	return !pci_dev_msi_enabled(to_pci_dev(ct_to_xe(ct)->drm.dev));
> +}
> +
> +static bool ct_restart_safe_mode_worker(struct xe_guc_ct *ct)
> +{
> +	if (!ct_needs_safe_mode(ct))
> +		return false;
> +
> +	queue_delayed_work(ct->g2h_wq, &ct->safe_mode_worker, HZ / 10);
> +	return true;
> +}
> +
> +static void safe_mode_worker_func(struct work_struct *w)
> +{
> +	struct xe_guc_ct *ct = container_of(w, struct xe_guc_ct, safe_mode_worker.work);
> +
> +	xe_guc_ct_irq_handler(ct);

To build on my comment in patch 1. Rather than calling
xe_guc_ct_irq_handler here, can the we decouple the implementation of
g2h_worker_func into a new function and call that directly here? This
way the fast path isn't executed and this worker won't just kick another
worker? Maybe this has some implictions are suspend / resume / reset
(this worker might be pausable / flushed?) but it is likely worth while
to do this.

Matt

> +
> +	if (!ct_restart_safe_mode_worker(ct))
> +		xe_gt_dbg(ct_to_gt(ct), "GuC CT safe-mode canceled\n");
> +}
> +
> +static void ct_enter_safe_mode(struct xe_guc_ct *ct)
> +{
> +	if (ct_restart_safe_mode_worker(ct))
> +		xe_gt_dbg(ct_to_gt(ct), "GuC CT safe-mode enabled\n");
> +}
> +
> +static void ct_exit_safe_mode(struct xe_guc_ct *ct)
> +{
> +	if (cancel_delayed_work_sync(&ct->safe_mode_worker))
> +		xe_gt_dbg(ct_to_gt(ct), "GuC CT safe-mode disabled\n");
> +}
> +
>  int xe_guc_ct_enable(struct xe_guc_ct *ct)
>  {
>  	struct xe_device *xe = ct_to_xe(ct);
> @@ -350,6 +388,9 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>  	wake_up_all(&ct->wq);
>  	xe_gt_dbg(gt, "GuC CT communication channel enabled\n");
>  
> +	if (ct_needs_safe_mode(ct))
> +		ct_enter_safe_mode(ct);
> +
>  	return 0;
>  
>  err_out:
> @@ -373,6 +414,7 @@ static void stop_g2h_handler(struct xe_guc_ct *ct)
>  void xe_guc_ct_disable(struct xe_guc_ct *ct)
>  {
>  	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_DISABLED);
> +	ct_exit_safe_mode(ct);
>  	stop_g2h_handler(ct);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> index fede4c6e93cb..761cb9031298 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> @@ -110,6 +110,8 @@ struct xe_guc_ct {
>  	u32 g2h_outstanding;
>  	/** @g2h_worker: worker to process G2H messages */
>  	struct work_struct g2h_worker;
> +	/** @safe_mode_worker: worker to check G2H messages with IRQ disabled */
> +	struct delayed_work safe_mode_worker;
>  	/** @state: CT state */
>  	enum xe_guc_ct_state state;
>  	/** @fence_seqno: G2H fence seqno - 16 bits used by CT */
> -- 
> 2.43.0
> 
