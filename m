Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AEC2C25B75
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 22:01:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 289E210EDBB;
	Wed, 29 May 2024 22:01:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VcsO1g54";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA0E110EDBB
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 22:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717020058; x=1748556058;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JxBPAQdq5Q2RJT0VnSRNDlIFCGhoATF1OslOumeuidA=;
 b=VcsO1g54e4PFCEriElHg9ZfF30rejr0iZCcroptxvTzdX3/tWTznvL8Z
 vtYuxDPb8E2/WMFuejjcat2pnpvIc4uoqsLzk/1tr3MgJAe/G/IVsI0PP
 Qw00GpiM5RChZzxxDDHbnAQ2Y/Gp7spaYc6ElLIZdfxN+cc6nUZWOPZs9
 7oN1CvkbDw4x30jiAAh6LctR/rGo7Ngy2+/zhojRMOyIyGg0i6T/i4GyY
 GFaL26NYiA2ke9+y8cikcQpTP9CY9P61TXCIWxlFSywRP6ka+zenE+QQz
 GoRX2PzSio7Kp0Wtq8VKmHN+okXC1WTzxUN0qYg3T2+g0vwBfk07xonxj w==;
X-CSE-ConnectionGUID: JW6ErX/bRIqVRfMuN3eCEg==
X-CSE-MsgGUID: cBhdEcHtTMSS+M67NciZcg==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13620078"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="13620078"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 15:00:44 -0700
X-CSE-ConnectionGUID: zh43csAFTl26pgMl6eLv4A==
X-CSE-MsgGUID: hlhH9ClrQLiHqdbUY3yhfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="40109583"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 May 2024 14:59:58 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 14:59:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 14:59:57 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 29 May 2024 14:59:57 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 May 2024 14:59:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KYYaa9VIrPCNhBzR9RoOFLi8fnlH+tFuRCgosKR6s+qze9W4FrIASCPqMrPahKxmxLIwr10X9a2mb58Zy/QZ2hZaWYK28+OVRcqMD9iiUsX5wiDt9DB+Fb0gXUaeRz9DYHwQnWjvTZK8qYcZcB7cHn+okNY9irqnlXihvUn+vVCL7m76jlXa4qXxL657eVpyriDkMPVEWqv7bWgA3EII7pfy8jYzbVeJJn2UkRQuIfFeADCskk7Y6Cpu4V7G7TysV5+xwpjcLc2w6e4Zf5T8rBKnrPGY++9wkgyNbjHzthMNVNqExoXxoKyP+joFBeq2RBPi0w/EcyYiRy5Bg7ggYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/YAlueod8IPIuwKOiA9eeIco1pwVvDzvn+M/SCm8rx8=;
 b=bk6gU/JhzMr9aviP02eZZIf0hm8wTn1weLH0O/Jq48LE0GuvveMk6Gs7k6UIw8Q8CvbO7+9EO+7FGorM8NaSaTJlXKbsml/weunGnoe04CvGrRuhnGWrMS1tGXIrzUV6NPN1nzSr2P6QcfYgSEbq/uBHo14ZE0f4a+KD4LmRoaaei97PDlSqQpQp9TzB6VBvl93zRSN7+oKMW09m90yJJA+tUbhf6pY12qU6zsK83Pp/gIT9+fmNpclgp2V1f5B4YATmEGRZolVmkjLFX90OVvuytdES/NmF7psohWZT4p/VR7PCWR1uytWx9WjDhd+gxfBjOIzT2h8L3U42bhE7cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6514.namprd11.prod.outlook.com (2603:10b6:208:3a2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Wed, 29 May
 2024 21:59:55 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%4]) with mapi id 15.20.7633.018; Wed, 29 May 2024
 21:59:55 +0000
Date: Wed, 29 May 2024 17:59:52 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3] drm/xe: Remove unwanted mutex locking
Message-ID: <ZlelWCyAEtS2hUjW@intel.com>
References: <20240529213925.22239-1-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240529213925.22239-1-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR05CA0061.namprd05.prod.outlook.com
 (2603:10b6:a03:332::6) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6514:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c442ab0-95b7-4ad4-58b9-08dc802aacc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7yat/y/IOMPBKfC0DRxe83BRVwAlOIGYKTSop+hrBzsflOR59+2GeSBLKYLl?=
 =?us-ascii?Q?mDghsAm2JLX41VqZeMT6+enbky/Fb4PH4LX+GUqKL6CNAUSrhFqXD0LbQUdf?=
 =?us-ascii?Q?3env8D9GftDT6z1DAFi4hStgAOAP8hSq6sHuvgvzpLccVPyTiXlte32T3Ez8?=
 =?us-ascii?Q?2zTk/xMasuhlYVbQmsjnx6RpwALGit9QFWW7tZ2DGmfnCMXpoGHkmJzR+F3C?=
 =?us-ascii?Q?quXkpSDtnot4CoDsRJy+7J1wys/Z+uW0V0Pky8lTQimjLYHL5UWx9xUyxhi5?=
 =?us-ascii?Q?Nwmz7396UoRjn4ubJX87G5oSeVKeWCWf+LB6Z2P1cQmbMrSyKfNqi46ot6Lt?=
 =?us-ascii?Q?cZq6C5AcSvy2SVtT/sZXDkDWv4S2OLFNddM2Jty7SMGPr5eW6VVbUxTzBDJa?=
 =?us-ascii?Q?yO+7FxRKqL36VN3g0RlzXrmomcNPBNOxXZZ+D9EHzC86WRkUDwf+xxro/6wq?=
 =?us-ascii?Q?mkBnFVuPSzadPL/gVr2cnYmdhDpKrt4L8RTNF6VdJUGWJ3fQX7Pn0+zefUja?=
 =?us-ascii?Q?j/PMsD4sJaAH5y1CJ7mOxBbjvZOEtezlnuKRThCh/KuX7JbrA9NEVwrpXo0C?=
 =?us-ascii?Q?TAP9gaZj0MNSrP9cUj+4BSWP84KJ2A1xIVz61Ho1hTMEZN4ZamP4WezhFbBa?=
 =?us-ascii?Q?gMqfVoH1BRxxb4rgNnBzzSHPTE+585np2j6Y1+tQE7DfonHucmI3PmYwnum3?=
 =?us-ascii?Q?U8HHzFFTVJs5y7OCYrnJTgMlSNjj3aZ3MzqZo4rkdX0viybOELMZkarUmFW3?=
 =?us-ascii?Q?LQgk01ASqCwSfHpmZQSXufWrW3fW3d7dyozmlqPEwyY94X0iyoldWGGmIx5b?=
 =?us-ascii?Q?o5VF6BvgU5Pu+dql18q0T8z4oLLyZUXE4zGUdL27lkdpZ09aMJq9VdPYf+0J?=
 =?us-ascii?Q?+ih35yPgVipKFa5Z4m7+7N6H6HZ9fdlqbw0Aqv1hHtYAt5nEFkE5lq/3HRaZ?=
 =?us-ascii?Q?AQXaOchpCx2eQfFoYEj0C7LjWqhYDbpGvnBUNNH0idMPaupvCb1Ck2eF3R12?=
 =?us-ascii?Q?Ng/87jwif33rVFTewkP5QkCEJ2SH/2ozsORL/zjJFDVxGzFiWjLc9njgimAT?=
 =?us-ascii?Q?qSLYZ7KiGHB6pgGRJJpcRk1XUh6rjNDTrateIxbgqWq6LgMw6erws+4dIJzx?=
 =?us-ascii?Q?3eRgODMXW3wFHS5RuIkA5VeKuhRZ0osMeEXriPorQ0UymlF29m9WRifIEKBB?=
 =?us-ascii?Q?jFRx3Cj9bEv08Qio3p0C3+/QXrGZEjgLjeDg1HWaG4D3gEXWxEMNoE2qen5v?=
 =?us-ascii?Q?9um11S/H+JVCXoCTa9gI/+H1h/1EAF9ywl5XtVsuiQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IZDy7Bznv5nWXdyL/FFCrw2s4kV2iWb2VMzNTmsubo+JI6ofqJEGDP4iSp0E?=
 =?us-ascii?Q?8AntSvxQ8JY0SyShb7NG4GUNh1cOVVK2zZLbPUFpYTxHv6UEci2zsPwTJutz?=
 =?us-ascii?Q?punxTPdVgYBuu+rkzMpAY3BFreIPq2ZlQvYrcAPK7Q5AKLx6VdYjwqlvzOfA?=
 =?us-ascii?Q?vT1lNLYOoDw8/V+50fzylj9RRnD6tomSQYAQ0nawLLfIhaJZgy5n6Fw6/Z64?=
 =?us-ascii?Q?woHC1LtUS3qXPc+uJd4EQlqbp5jzRCt2dG24fCc4qgNNcSCJYwUcZ1x9z1kM?=
 =?us-ascii?Q?3WZkaaOR4n7dEG85vayj46+HqchBn9mWl17+DQvZdAgAC4V1kXyiC7GSy4Pc?=
 =?us-ascii?Q?yjGosRCG2wfSyZkG0TXS8j+JzusvP5moG0nisCf+3KH4Ms3A3nx0/avFLLV0?=
 =?us-ascii?Q?ZSxnIDVgkXgQ5DQpt0WL9WFe1JDP2OeW3Vj7oQ6PnS22PrRn5DETzNy9nQ01?=
 =?us-ascii?Q?yUSw1vORNxlHD58yvE03H1jqUFhhSnkHxCGMN5yz/m7RvnFSbNHutCYEZgiP?=
 =?us-ascii?Q?5CugA/ZS0XNKp0eTWx/0Y6vNx5q2ahcMDA0EaOimZ+2/sSi/ouchH4Bzn0wi?=
 =?us-ascii?Q?NGIFqpvCKrkyACnof9ppxYszXjMz5a/NSaOIUJrtiKvbU0vj+bFpA4oclGQ8?=
 =?us-ascii?Q?wPjOnGscHpD6L/iC9p/TIF0dlu+9cYtCy4RMx2gImv8+tyq3vdEhW60Hu4kq?=
 =?us-ascii?Q?73jxVFV0de3qDHnwCiyLQtIGwOQEw3WOBI3ho3pZhJgY+y/GokVwpyJ5bK5A?=
 =?us-ascii?Q?Hu7SpdKkBpkKEA9+TP5UU0b3Fy1C5ZrVLBxrmrXYzvnt55dbdlfBg9cBC8Vb?=
 =?us-ascii?Q?TfS61IIGWzEDqygkuJo256hBIPd8rgUMzQxBXB6lYe5lNmbIxcgDnFMeOrGT?=
 =?us-ascii?Q?NlRcXG+GTVroCwycZpC8GI17US+J2eccB2CXqpCo22OcVs0tdfYqXhxvt9P4?=
 =?us-ascii?Q?htzb1yEe+3JIcIiEbFa9eu6JsZVsv+8pMVQAf+5QX6ojpwft74fRFWwf64eS?=
 =?us-ascii?Q?42khcikJu0ctgUYGt1AsCBqaH2/NV7oREPkbYSRk0z3avT3SxggLgCZSlgfO?=
 =?us-ascii?Q?5/Ql5V4SOOhbrNhrSZWkQRqfGViOr9PyYMZjDkGPmuB2DXOzQhDWyMmRx3Lq?=
 =?us-ascii?Q?Isi4d9yxayotUF2OQ6z02eQDd3Y5wRfn3fgNDv7jOhrtEscXcYnhFXrlFdJO?=
 =?us-ascii?Q?Dycgz93p/uchzYsKKQl+XDlOr1awngg6nb/E17yfZ54vfQD2uT+mwKlQeDlR?=
 =?us-ascii?Q?poXoYiZvpWSwMEbj5he4HS4GWa/gRpon/ymlPHlVhrIjPT1gJKeuP4mApjDf?=
 =?us-ascii?Q?O+YXfFGmOrjP7TOg7HygyT/wWbxBUApPqctl2bJcpezvLTNt6bgy1Ma+nq/O?=
 =?us-ascii?Q?VMEA6N80sjF9SNn/Q8oCSNozsT59+L1N/gKcZeGBpSsMrI9tBSOBf/351fpE?=
 =?us-ascii?Q?feV7Pe6l19BIbWkP/7vdMhgyEqT5DHg16j3TUtbUNAASH9rn/6J/j6RtQuND?=
 =?us-ascii?Q?eNI2/9isagJJhqsiolDl21Ebz8mQr9tFqb5GOYfVsFz1gQ/R9/DG6lPavfU1?=
 =?us-ascii?Q?DWi7YmViOp2plqfhE7rvgcnPeQbxOzQ3u9depg3J?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c442ab0-95b7-4ad4-58b9-08dc802aacc2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 21:59:55.6736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rAhtBs62cu4gFgEDzXtIZF3M8IgnsDO5igzDiSTTyFJLeqSMqoYJ0/AUx8R8uNGkeokj61QaQWP5RAopXRfQFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6514
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

On Wed, May 29, 2024 at 02:39:25PM -0700, Niranjana Vishwanathapura wrote:
> Do not hold xef->exec_queue.lock mutex while parsing the xarray
> xef->exec_queue.xa in xe_file_close() as it is not needed and
> will cause an unwanted dependency between this lock and the vm->lock.
> 
> This lock protects the exec queue lookup and reference taking which
> doesn't apply to this code path. When FD is closing, IOCTLs presumably
> can't be modifying the xarray.
> 
> v2: Update commit text (Matt Brost)
> v3: Add more code comment (Rodrigo Vivi)
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index f04b11e45c2d..bf4c4306f6d3 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -96,12 +96,15 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>  	struct xe_exec_queue *q;
>  	unsigned long idx;
>  
> -	mutex_lock(&xef->exec_queue.lock);
> +	/*
> +	 * No need for exec_queue.lock here as there is no contention at
> +	 * this point.

I'm really sorry to be pedantic here. "But why is there no contention at this point?"
This remain unanswered here in the comment, and only a further code inspection or
a git-blame archeology would lead to the commit message with:
"When FD is closing, IOCTLs presumably can't be modifying the xarray."

>  Taking exec_queue.lock here causes undue dependency
> +	 * on vm->lock taken during xe_exec_queue_kill().
> +	 */
>  	xa_for_each(&xef->exec_queue.xa, idx, q) {
>  		xe_exec_queue_kill(q);
>  		xe_exec_queue_put(q);
>  	}
> -	mutex_unlock(&xef->exec_queue.lock);
>  	xa_destroy(&xef->exec_queue.xa);
>  	mutex_destroy(&xef->exec_queue.lock);
>  	mutex_lock(&xef->vm.lock);
> -- 
> 2.43.0
> 
