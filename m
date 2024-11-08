Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58CCD64084
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 20:23:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 707A010E291;
	Fri,  8 Nov 2024 20:23:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XWxtDF7a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2CC810E0B9
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 20:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731097403; x=1762633403;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dAJycT/JEkbFXpQhhYIe7pK16g8Kj9XIAKj/MkVFcPE=;
 b=XWxtDF7a2jr/bNpPTyedjjnAQlFJRgTk05WzX9/Figxf9m3O5OXsCj2k
 49TdKOcuq8wGP+od5hqjPGC4jWILfYOd+9WEMaKXv7A1a3P1AIUlLF3e3
 vBexkVRL/t6Rs77DBheaUqXu7Qu0MfZ43OCZFrU89A3PkY3d+lkQenyD0
 k7nJhXF6Bw7PxCgpfXWrVBjev+5p54COGPYU9LUgEm8hesOwJvqfXj71z
 q7rXV9Da7m43qb6GPeZ0o+NEfiWiX+lml7NLkhGPLVXrvlp072VQJrLcg
 PzdN9an7/dafp7kcqgLrl00eFpKI0zIGdNdg4ebC72TWyHJ8ThC3XTtRc A==;
X-CSE-ConnectionGUID: NQi83KApQsqhc6o1UjYqqg==
X-CSE-MsgGUID: Ux4gXLh4T1i2ckZpE17gZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="42092801"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="42092801"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 12:23:23 -0800
X-CSE-ConnectionGUID: +c3fDwolR/+Is9CrdXyqlA==
X-CSE-MsgGUID: at3sysPhTzOn0eigzKq5vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="90570909"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 12:23:23 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 12:23:22 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 12:23:22 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 12:23:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xZXkn5Yq93lRaEHGLH4BTT3Zj9B6d1w0VYXgG4ibqTL1ite80SJSJHUNDggrI/WhKhFLJPNzklVfMsrEdgC7LJdwFww2SjVmW2KH2qwldOik+yXV3c7Tn9JJmKq/Jm+YEVyBtYxQEfgyIYzCy4vl54cRCkiFscjvU+HhNv0AJltKOpDVlyDcWxMcW/+OsHJEKqn/YbAtNzK/t87f+39LARF0Zo9FxgHC6cu+di+2MMYlPhIqHw9iE0led4uOwrTUD1ORiaDgql+/T1TwhUqetZQ7IcAHrp5VCqgDRyyc2beG6iNQg48Y4efKwvyfccB3nPEuqrG/9IVJ6rikpe3QZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dAJycT/JEkbFXpQhhYIe7pK16g8Kj9XIAKj/MkVFcPE=;
 b=WyunE0fpWUTYH8E2xCRWhD7oY+r/EXHjWQBEX1vWI/eows+PvZO/vpTavlBa0Dq3D5KQm+M3O0XQG22ayDDtayK1BnuhININ/xBNYtpTCPG/CQ/FPGwxd1BxHsC2mM7BkE4BWtryCbsiZfz74aOINYSwFBwRxw0vCoseqST/DHuwHSbGWg3sGAl1M2MZIiOwxp5l6B1DWBZ5gCaTtMURrJWMRe4LjXe6lNIiP+7rbBP+eITggEwl4yFyUoFxkHtiZ15mD6H8Pgpecx53xqIqpGnIRPJpzJhYlHMihSv7Z72s8UMEhSZDuyOj/2ayS92/NvLhq0WjUGDTJDOoveRPJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7898.namprd11.prod.outlook.com (2603:10b6:930:7b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.22; Fri, 8 Nov
 2024 20:23:17 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8137.018; Fri, 8 Nov 2024
 20:23:17 +0000
Date: Fri, 8 Nov 2024 14:23:13 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lindong Wu <lindong.wu@intel.com>,
 "Caleb Callaway" <caleb.callaway@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Felix J Degrood <felix.j.degrood@intel.com>
Subject: Re: [PATCH] drm/xe: Add gt_id to xe_sched_job traces
Message-ID: <d3harwxnggkiosuliacsqgz4am3koy7ifckqdz2jyl5yifbfrx@kloge3wlbatl>
References: <20241107060606.3130885-1-lucas.demarchi@intel.com>
 <Zyxip+TTTfMZfX5A@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Zyxip+TTTfMZfX5A@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4P223CA0021.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7898:EE_
X-MS-Office365-Filtering-Correlation-Id: da784c32-cacf-401c-8b8b-08dd00332e0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?naOEP3RHwMS1Ghty1yuwcjqnpbngeIemRjbY5PCNzgEZMyRGXAK8k8w+SM96?=
 =?us-ascii?Q?Gg355noL3HbhS1byMcchWG1Y6dzyjRvw1zKBO728rD928FTRDeUsnhQbalMa?=
 =?us-ascii?Q?n02CxjjvXRy/Htg5/IUZUxGK9mD/39kgxZ/DVo3PVwVXuStwPTkU+KLAgxbW?=
 =?us-ascii?Q?+PyDdj8n86FsGb9KHCe/4G+gTIH/C8hA3920fAwgdCjQsIIAJJCTi/UxS5W8?=
 =?us-ascii?Q?DpibxDqg/EX0sKhErhI0OHzw40mdGZ0qXtW4EDaF996RE8Bs2LdsxfD4V5bI?=
 =?us-ascii?Q?/q7QTl2NGAOzEQ4pWXQHEmRRwojizmgO9pifykAKgoGW5e3klF6dlsZbxLT/?=
 =?us-ascii?Q?STytEWs965pr1Gn8gcql1Mo87h6Apd5MEqJPtCWrSfY8lMwcMNfSgg39EFiT?=
 =?us-ascii?Q?Q3ds0a/dgfYiQOEU2BaEm1A0sibZI0bEBvZS2WKP9XUNFV9ITiaPTmcAotJ5?=
 =?us-ascii?Q?LTkdVyFqqQPon7SAFME8z52Pa8hgpXm3VeB7POz4JLE+Wljp+fce8RGodl7V?=
 =?us-ascii?Q?Q0FTtVPycvcqTkgV+r0dsSSj5ijhklBogUOSkFTXXEYDD6fE1uaeyJQKmZkS?=
 =?us-ascii?Q?C6j6M15623v+yLT13rdcEJxV1S72njm4uAHHSwg5YL5G1/Ga2SUWU18QpUyu?=
 =?us-ascii?Q?cwzw3wbkHoF1Sfg/1FobVdLoZLtwMxHk6YUK1RGDx0loutTPQEmCwLpq2L7D?=
 =?us-ascii?Q?D1I9xKJRxbMJumxemmiPXXiFdyce4clYjt1qyYgqPEMZ8DJ2OhksTfNE2eic?=
 =?us-ascii?Q?xmg2YM6KbHskV+Sg8gW+X2khVbB7PkCuUYQTkCL4At6HwvANDIm0HuOWrYqi?=
 =?us-ascii?Q?MWHuFLfbploPzEDcLrix56hhNru95Y0tyQwYYpMk2hhnvbgr64JvFOqqoCbJ?=
 =?us-ascii?Q?N1YO4J/lleLGbqqMeWcn3hAwNnrblU69oMlee3OkF/EfSlm2HJar5FIyQPIa?=
 =?us-ascii?Q?ZiuaafaxJApiDU2yqfIIlR2FTULm6so7EZFQgEDA8Git9VSzj7R8dJWtgRSg?=
 =?us-ascii?Q?x3JcJ/mJcT3udA4YWMKHlQjid/dxbLCTuei0YHJ6hxLJrsCdcwmqdrwac7TY?=
 =?us-ascii?Q?YO3SfsFILssFNshuUSsLhNlH9oiM2PU95JkCKHi48pznZx9cNus/Mo4Kve6B?=
 =?us-ascii?Q?js8WkOkcyUL/TqPwGwpai4FkZk4VhN71x0/7XNwmVfxrUVNSkotRYdTlfuuk?=
 =?us-ascii?Q?ev3FJhWfwB2rkkZzDuh5oWX+Ju0qU8g19VIYvQNNZJUYMPtodpRDWteWAwrw?=
 =?us-ascii?Q?OyrGkvpn3HJxuauXBpujJyPjpvAEJ7o0kuBSrspUIC1iYMLEqxGP96UN8/qj?=
 =?us-ascii?Q?YfrkW5AvmF/p6kXAraZyY7p2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0vSepztsYLz3DrZPC/rRyVJPdowsJGQPQZ0FEUdyo5M8vU3e6BS/4F9EC7gV?=
 =?us-ascii?Q?G6ZTaE1NED8tCFfMPSQr/33r8Vejke+VtN+sZP4FXznj9bSq0pXNCGrQ3Kje?=
 =?us-ascii?Q?4itqu1TLGnuIpgJ+HIshq01A9SIxFU0lpg14ZW3H9WHiNv/9zqj2ppjemqnn?=
 =?us-ascii?Q?vVnl+DNrppkY4FoaL3EF1Jkhp5ejT1BQvifBmFfzeOsrWohZOK1pBUut6CET?=
 =?us-ascii?Q?LJq8vXkUgI/lYwGvlKZAJ5FMQbhD3CHQLrVnElJo4lvYsFoD91b2khIL1hDz?=
 =?us-ascii?Q?sZCrLapXgPDcTraMFJcLvHcAWG+Yo/wDVEGt0Bb7RmLbUC7MZM7GRPPPkgrR?=
 =?us-ascii?Q?zdyfQBFk8I2CDfspAbxqqL10/e3FsRifm/eQ3H6VW7nzSAFIG/fHbtYb22l+?=
 =?us-ascii?Q?fQF4O9mx6CFzdR524FzwvrQZlTzUZarN+GiFij1D0WXr8IzjdAgpwzIG8XtU?=
 =?us-ascii?Q?DlcqgkF8N9H6RRVYhfaQ/fWKct0c9ucu59XbpchuI2xjUukeJ5rmauDRmW5Y?=
 =?us-ascii?Q?UQ6HwX9ICbcf8qYgzD6N6rBNzuAlv4ufIq6yDvumSdaWq7zvJiPmmlIqZOu/?=
 =?us-ascii?Q?37Obi3fkBeLYl+dGVv1wFc2XxMMnw9lcgFHPJRRiX83rTdyz5w2AzhneU81G?=
 =?us-ascii?Q?/oXLRvAzBrqYf8ONkX8oyyL8BRcNNG0n+qH5KMwWEM1bnLdK0qNjEskUKFSC?=
 =?us-ascii?Q?AcjiSUNCgTB60hDzTw1fNm2HGT7kA4ylncEqe+FU+Y7ekr6e6ovX9/HpMxe1?=
 =?us-ascii?Q?6YHsl8EugptlkMfU8dVFvdRIvd1zEim31IjYjFaErTZyitkkcI9WzJkeovrH?=
 =?us-ascii?Q?yVwyFy0UpQ08ZGmcZAiwkC8fiLG0nYD3zAJAzl2H7ycJw2TN9yFRGSrzjz2i?=
 =?us-ascii?Q?WcGnR2Yv49KXQ3H9AqUeX3Cy7g272eSmORIxfJ7MXBDZk0Mi4miZV5Lw/+q6?=
 =?us-ascii?Q?qfwMlVZ6Hh+/wTGmFeVnX9Ef3EI2wfFFc1Uar7yiwLzRZDrZUOKypSqVUDRN?=
 =?us-ascii?Q?Qsol5G2PosAD8cqO/0V7O4qNobhsIiHgff8wKZWFqGIs1KuRKNOz+GOAjxNT?=
 =?us-ascii?Q?SsNTTUYgYB5QPRBYjB4pkETEBTiOecdTDCzqNxJROtWI4ZDxeL8kIs7Q4LyM?=
 =?us-ascii?Q?6jJWmvPRjV7aPpKKhDRgFh6JCqC8GY4Gu4csbFDNZSjkDyVbCIH0hqtdR9ji?=
 =?us-ascii?Q?SajNoW8YCf/gP3tiAKfXDfs9SveZcjYNJ64O1ZAUwDqkuzQ1BG8whNUjS9zq?=
 =?us-ascii?Q?lEyPIW/XnT2AoKhbrXaBy/gD55tRVx/OZ8LQMLrulqo7JR2QJeqtLcY0MoVy?=
 =?us-ascii?Q?ZzK6l1YgrUwJ2eMUwg7ZwFOIgpefatUNugRNnGu4JsE3H3QjVQYJ4xmZzTEL?=
 =?us-ascii?Q?fDAIQipJ55pwYJmz8wZ+RzAc0FDEq6qpxwpmjZuhwGNJNgtelzoARbJAT+6m?=
 =?us-ascii?Q?/GFHH0aRk2a0Lja9rz6/iYJbi0J2M1zPZTpzinf1E6C1MI41WcrrggzJaKHM?=
 =?us-ascii?Q?TYSJbJzuF2+NM0R7Di3VZGlq6WFMzkPAXdKLQdyPElybF/F2iVbJ8206voYy?=
 =?us-ascii?Q?a9qDwKAaVletOdfsa41tipOn+fVA/lv7HOt4gybEQWHks/Qx3wv0YUIox1EG?=
 =?us-ascii?Q?FQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da784c32-cacf-401c-8b8b-08dd00332e0f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 20:23:17.3870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cbOZu6QhxGa61QZaF/Qbjm/2Vn/sGD8ktcc2/KNwbInTkenDJwAja5et8KuzyBCaC3XEjV8RteEG2zov0g4MkBAYYbZrWpG+YuLzIZhvRWs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7898
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

On Wed, Nov 06, 2024 at 10:48:07PM -0800, Matthew Brost wrote:
>On Wed, Nov 06, 2024 at 10:06:06PM -0800, Lucas De Marchi wrote:
>> In order to uniquely identify the jobs, xe_sched_job tracepoints need
>> to have the tuple (gt_id, guc_id). Find a "hole" where the next entry is
>> unaligned and add one more field.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>

thanks, applied.

Lucas De Marchi
