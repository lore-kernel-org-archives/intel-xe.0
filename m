Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F038BC5CFC1
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 22:23:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A724210E106;
	Fri, 14 Aug 2026 22:23:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hBbm4Goq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8101710E106
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 22:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786746216; x=1818282216;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uYQFdJMBx3fvrTvcNNz8b0saDFBh/ica9ZwIHM6xiiM=;
 b=hBbm4GoqWbetT8k7c9fOvVzqXLvrLgzg9y4QAT8q7tWWX2HfjNBvDVGd
 gD7XqSf6BJvTDc5defYhsQWZMwdrI3/9qaxOsBRGoNBr06Xobt4Q8qait
 GuYBYuvXdjQN4mvEhP31v2sYXdcJkS6i96+opy0tgRQLZ9xoDBfrHm2GV
 BkZpORk/87BMa9YiSwIRqW1u5pSMNvJi6b7J69edFozaWqpnciSA8f2lR
 n8LHdlkgS80/wOvpLPVZdZpYlLG00qtnRvwziDj+W25PiGI4CDmgCWyPn
 Vg2QRjwIezrlBuBr29YkxIlVSXSScifKsH1xvkHxkF4CAtLYjfQ1OcwRb A==;
X-CSE-ConnectionGUID: 3fSWeHsnSteBJ+UUU9ESNA==
X-CSE-MsgGUID: FHbfdJWvSgetNXjLkZNgmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="91140591"
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; d="scan'208";a="91140591"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 15:23:35 -0700
X-CSE-ConnectionGUID: hYDjzbznT+Ctiu3jBqQzDA==
X-CSE-MsgGUID: b+u+pyBfTnmlLJKihnnPEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; d="scan'208";a="294259968"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 15:23:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 15:23:35 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 15:23:35 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.30) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 15:23:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NKjC8uYhG1GGuRUKFMFsi241Hcm9sa6i1lz2xgetIk/RZrPuG8HVU2n5B8AZ/qGMf+vuMuz3dWVqRjsjmTZt51th5tsW5YG0nznirw1Rx1iBAqkjrv7C4VWnG22rsK/kjPAc3gU5DW56mlhb0uV3JJWQvwR3BGW13cnBbcnKb2aE5Y4sHuapOsn/AdN3Bz3yC7LZ5KbgZ2S8cFv8w0/aPuTDLW/sMOLQU5lr2hhKGpSdWzSkcQvken5D4QRojhKr7LPK+rnkaLdIrbn0ak36CnTr25dJtcw/cCcheY9014YBf9E96P3Ms9cGe/tJD0Lk+hbfvN35G9QpCAZRqJtZYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sBel+rT875WUomLfi8VcAvqjpKVz4P8W5HI0veo/3Ek=;
 b=MXE7b30kqmeeprnHGKEgxltdP+ItzKCA7Q9lGJIpHFC9hKY/QidufVTxkgg9v/t+SWdbwLWeWXxjffXfukOztP75NXNHNpx5BjkcVa2ZFbc1ool1Z8DhM4Kmdnw4jpmEC7pXEUz/8AUOQocCAv1wqdLKso/s4oJaxtc30JoOKl3bPHXWqyS6TyT5pY6f7Ldmm5If9ZbxQHvxYRgqVwIHSkPXYfRdmoRtIVeEtOrh/7Zi6Qu6V0rB/xm2beRhOdciWGndLqRDhoZRB1jSCGQ3GV+2lEqPQ9tbRaSUnY66r4W8a5OSW5uoeVmJuvFuAoDVlHEJWgo7dlyQ04AIr1kXSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW3PR11MB4601.namprd11.prod.outlook.com (2603:10b6:303:59::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 22:23:32 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 22:23:32 +0000
Date: Fri, 14 Aug 2026 15:23:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Sk Anirban <sk.anirban@intel.com>,
 "Badal Nilawar" <badal.nilawar@intel.com>
Subject: Re: [PATCH] drm/xe: Do not apply WA 14025883347 to media 3503
Message-ID: <20260814222330.GJ8279@mdroper-desk1.amr.corp.intel.com>
References: <20260812223915.273611-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260812223915.273611-1-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: SJ0PR05CA0084.namprd05.prod.outlook.com
 (2603:10b6:a03:332::29) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW3PR11MB4601:EE_
X-MS-Office365-Filtering-Correlation-Id: c546e558-d5aa-4e1a-06f6-08defa52ac8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Yo2nb/KJBa4bbrgOcueJdZpZdzyyltHYf/EC4KgNqaaY0Czy3f+J8rXpGE1xHdcWClup46pv6lZ1fhR7/x/97HAFJdDppavyhavJIr7qJ0LdMu510WoYlgSmQAc1iWGbOFu/LMwKmvYzIzDSImJxkF+I0+v3BIb1RTocfp1864yeveKllD8CNQbDQThFvD6y7zbSM+VLki6QufawCOP4agjUdz5xy5El+Pt94E6S8fxZHvtoC594At945AO5Bl3wskbXQnjLtqGpP+ww9b+98Bq2f6M6b+vj9JDRQ9EvwIc1Xhxnr1rhKpIaTGK0sPaECbmvnW6sUJpLHrZ9L7MALn0SikkYBIkCln+AktxlwMvsBLr+sbRoc8uGUQ/zjIXzKBaZdUqCFYGZBR7HHAihJr9OqCSIPyHBTf4WfW558euEwHQRQNwZWYov++4fLPS38uZHEUpoG9PAqTcyZvp3svn/6Ro8PdsmJqyi2mMF8fno8P31bTlMKPB0Ozrrji7TQCRtUBU1URKVkOP0NHZAsnWqI0RqDXLLbfTNwhz/ev+bS+EPdD1Q+ZA5UnUgZ6yIr/654nz+FUdm8mrfDfVQGgHSRU1Kr+KfutVDAufKP4RALJEmi6vkNi3D/m82kvRyp231hvsAR+fl8dIX5RJf5NNMe7DaZAwnvEUW2PoUhBw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+01OhJRn9vdCl6QxETSn2kgPbvzmyXc7zxKUo0xWMy8a/xEPVSGNqZwuzaZe?=
 =?us-ascii?Q?ABRmqsWIyhNTlGhfo19Nd5rTv58j4yc0Hpn7pjVhiqv6WPanVMfhPM964mLE?=
 =?us-ascii?Q?59yN1VkwYGt9L+nrI0BE4X5Q4akqj9WnljLF97YregtfhxTMr47jQqbJqRc6?=
 =?us-ascii?Q?VT1ZiQoSuEOuIzQmGj/qgSpJGhq49Xbn2oYwmL+iEWM1VYYwpb3sZAx1KxPh?=
 =?us-ascii?Q?e3v6UdnNGENs5h+mRXIwkjC7AmurI0CkuGOmU+eDswXuLZSBjnMNNWz+wk3u?=
 =?us-ascii?Q?5Eqk9FQFClCUAPT47ozLT4m+0asUuRfYYh8R5XwtJiGg708tM8NBTWO4KefG?=
 =?us-ascii?Q?jqjg8GWKmHC0+RiDGqZnrdx1x0NBZBLSQdNb+iGmKZpvR+NoXvE4fArm+Tmu?=
 =?us-ascii?Q?dnmDgzfdtXqyOD7YTCnba8+Hiezzu4yG7VjMAkYwVUek7uE/7h30So5gOm8d?=
 =?us-ascii?Q?LdKMG/pOHejt4vfdJ1yOZyaU5P/Q0xB10e+0G9OOV+mjaf6tuSQSYt1uZr1F?=
 =?us-ascii?Q?fBQE5GqKt6YGET6xOEFUUzr6ffT+WdMANL+2QsizpckFbA7uVYPhxQLchSvu?=
 =?us-ascii?Q?0Pnu3UYn7PMFeD/rYoeyr6s4FlV+2aLw2C3Bsz+2W8tZfosrVbUVJ3WYIuf7?=
 =?us-ascii?Q?VHkzQXhNsshc9tWcjjxFmWFH6v3D/sEkcsIYoNgAO6yyrlh0N0NOmOGnR7lM?=
 =?us-ascii?Q?6W+8RxUBbFF3vQ7kQlMG2NrTs/njquCzEvDCP1Uv7NPmS4KvkzmgFxZEIagr?=
 =?us-ascii?Q?nc2iRB1KQs6I94ajFJ54oXWl+3p2bhKe2YwMCztbwv8E9/u8+JdeVwW2CwWC?=
 =?us-ascii?Q?a7Y7h6zWb6AEaZ8npHvpuTd6hsmEBwy1w/13mwaZhqWuWlYvu4Dg5fm3E7Xv?=
 =?us-ascii?Q?mdur4X0bgyl/gpxYZRaGIeWZI6pzvy2iZ23FuUJlMNZzjbFvM+O2f3LLKQwM?=
 =?us-ascii?Q?R6NYhcv24+m33S2aPxH2X81clV9pF3GtdR91Ybp8KQd5HEGHCGGpv35sIyj2?=
 =?us-ascii?Q?RD4W54Ba6taYNmWrgVnspNmO24zoyIfn7vAn41mRsIbuk26pgf7cAmE0Vdi2?=
 =?us-ascii?Q?cEG+4B9yY8WHRLOl5eUNArj/8nD2PQv3KABzDVPzeHl0i0JVb6IjuCVolza+?=
 =?us-ascii?Q?I6VD7hYQ+0yRuC7lY0pXfDjITxnaNuJB8gJdLx4jLe8fGZCfyQYe/FEeJ+02?=
 =?us-ascii?Q?iKC0LllSSzkx6kEAnQdeKcaSAbdFxBY8LMhlAQueurvjMjWZHwc2E1nkudat?=
 =?us-ascii?Q?pJsbH0L675LK8gNlS74L1pLTlC5adgHPzWvS1aj0WRjTXDZVW995lm05WpgS?=
 =?us-ascii?Q?gx18CIpwIW1FsLL/84ZrfBRuIjm7prr6KsIuyzMnupyb65bW3FhlPMkfQgFE?=
 =?us-ascii?Q?snNWC/EJCJf4s1jGlJO5hf0yYUxA67jn//SitW7GCiCRYc/DwuQDt1XBOqFc?=
 =?us-ascii?Q?B8ZEGqtWZgOHtE99uTKxCml0Y03T7QvF53ec2fRYXeA//Njp3AXT8BPi4L6R?=
 =?us-ascii?Q?143ZHt66BJ7phe1leZ3R4wRxKXCAdGs6Xk48Li9VHP4XghjWmZEdQgOtWfY6?=
 =?us-ascii?Q?+E78zatU9djmDnzKkl0JObf9WEyiW9p6grVo3SgzH9FVZgmSUWOfayaHAA4+?=
 =?us-ascii?Q?ZhF9PSpJmZFFoll6oWK8Oj25VPXphg8LI3ePVB47Ytm3ioJu2gJmWwMr262w?=
 =?us-ascii?Q?a5LH1X5MWrJ0GmOq5XUlQHozeznBT6+2DlM4dBhbSOhYrzxCVsKUcjpUkz3W?=
 =?us-ascii?Q?bRZ6LVBQj3SpDWkVRal+gZaqqXDoO5o=3D?=
X-Exchange-RoutingPolicyChecked: hY9RWmLB53C46tCFDyUNptfouK0IXc4pNwESij/FsT5oMxO/O4Uf92I8P7j4I+YAtnK79qxG2YmjjXhygyz0O6n4nbj7q0RCKgIz21eQL5dR9Mnq/cvgvP8fP1Bqr2aZ2QKuJXrEY9QpdDglL+TyVIzKwtfJzwaZ9Qsh+A+WsDSHvHtulIhYpQueI9osKiE5BiPdhpPaptvv22Z7quhSDn/bS0iEp75KANgpSOggzS6JVCHBcNvG4hJqd/77UxJBUOksNVDqxBojqJZHKx+GM7dsjxzg/rkSdVMj2JuXKAKw+VXLwicXrau0NP9eDivjUxWZoadXax3yayCLPJeLWA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c546e558-d5aa-4e1a-06f6-08defa52ac8b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 22:23:32.5262 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c+nhKZAWHXh+VH2f6D7k8Yhub2izqcdkmzO5GOibviDnF9PoB5iOxak6xE3ER9/JRkptJak1LEAOLVoLVLVUxi3fF9+yMzoALpLTNdKJ2oQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4601
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

On Wed, Aug 12, 2026 at 10:39:15PM +0000, Daniele Ceraolo Spurio wrote:
> The database was updated and the WA is no longer listed as applicable
> to media 3503, so don't enable it there.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Sk Anirban <sk.anirban@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_wa_oob.rules | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index f02ac9bf7424..dd69ad07f7a9 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -63,7 +63,7 @@
>  16026007364    MEDIA_VERSION(3000)
>  14020316580    MEDIA_VERSION(1301)
>  
> -14025883347	MEDIA_VERSION_RANGE(1301, 3503)
> +14025883347	MEDIA_VERSION_RANGE(1301, 3500)
>  		GRAPHICS_VERSION_RANGE(2004, 3005)
>  16029380221	MEDIA_VERSION(3500)
>  22022079272	MEDIA_VERSION(3503)
> -- 
> 2.53.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
