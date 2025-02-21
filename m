Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16CFDC021B6
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 22:44:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D716F10E19B;
	Fri, 21 Feb 2025 22:44:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NKyIpTp6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 845DC10E19B
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 22:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740177869; x=1771713869;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LV+6DuA5pPxLHIShon521j97jhW6TmJCFHLIyCXxOrU=;
 b=NKyIpTp6UACi21CAcRSTpK+K5bJCsNrrmwdAhDmrfMd2Oq6JM9F6Ic0d
 EzB+DYYmIR61YhOPiA841qVXoxXS83HzoYpkub3yqH6zS0zwi1eLjRry4
 BPSXkiGzyZLfo/AdNavIrX8LsG2tgPYUWB5kUuOw7UF+uhZUm3bK89eUk
 dPOLWks8+GVC5aysd4n5joKOABPV5LhD+a4Kc5gUwrReC+j1EYzzVmrY2
 Rd057Y6J/fV/qF4a/qoahp0omorqFgyGQHYYjZFpu2u6zUgjxqGC6l6y6
 raaISOyKQkgqJGv7mYW8PCAJmbVNgVD/JKQJL+DV2XerxjAvcsbRTSk0y w==;
X-CSE-ConnectionGUID: BnyElU7KQoiiZFlIwMZiVA==
X-CSE-MsgGUID: muHAwwcYT0GU8Ku5BizvjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="58424718"
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; d="scan'208";a="58424718"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 14:44:29 -0800
X-CSE-ConnectionGUID: ceLRTMW9Ql+DUilmp/L6oQ==
X-CSE-MsgGUID: CqG+FGj8RhGx/RAn8T4taw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; d="scan'208";a="115307038"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 14:44:30 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 21 Feb 2025 14:44:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 21 Feb 2025 14:44:27 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Feb 2025 14:44:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gFIpopebIhtLM7uMH3aSNfuKtjQ2oGNBUUw0f64NQ7WUGIvWtr+A87lWZhtkjTLBnUIW/zVkx/oFZrOuqij/lT3bNccBd6tiZS1B8XLhDOjjmGAp75/IhzaiDv4IDhL7rxipaA82EXNK9VY8YVkC6zWRMjfvcZSC8zzCTtRFbnFKTcF9rTdMlBgo4H3iol+3CBO1XPKF7qG4/JtL1WQAdoZlPFxji4IuQiabibPNQnjvx1Ipb5Jllg811Pnue9n0MRm7pN2JM6/UHec3ldnY7SILPGo0Ga59JY8cqTH7I3IGhJNQX/y7K+N/83CZWUsHRkUvp06MDgt9dyh2VVRZAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=54kDzUlZAGTYufhXVUZHAyZEHJWfn2r5HAGlSoTTwAo=;
 b=KG8LXOTNWB9UTCMxILyBTHh5EB+lYF7UYA1xkT/MKCXpzlIWZmwFSkqTkLwkmnglMgp2ZAi0N9W1Hb9/CZlzsc+e3yAHGEq3f+p1m0+dXHAn+FHgrtrMbk0iwcxEK5TRWxwlLwkO/QWRlhk9WtQbGFLm0YExoN7Y+XFoN+fjrVt/sc1gkud3uC+GzAf3TW7s2ac+AEJNZVmSzW+tP+4kd01Qx7owFUUuNEfKuUBkqrv7ZOxmRcom/Xqq8e0PXjn6szzo0tKs3ygQwnHimc+Mr1ipyAo7CZdD9KgQLQgFX4yVl/oJqcn4TJVEMOZ6lxr8kRdBu94laA6myGT7CpvtoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6383.namprd11.prod.outlook.com (2603:10b6:8:bf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Fri, 21 Feb
 2025 22:44:24 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 22:44:23 +0000
Date: Fri, 21 Feb 2025 16:44:18 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/9] drm/xe: Switch from xe to devm actions
Message-ID: <lh4id3yyvumqrgqxsgxzovh4msah5ghdub42anj2wry5ppq44a@dox6gkq3ld4v>
References: <20250214212313.1767562-1-lucas.demarchi@intel.com>
 <20250214212313.1767562-4-lucas.demarchi@intel.com>
 <CH0PR11MB5444B7F1705A86124CD09121E5FE2@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <CH0PR11MB5444B7F1705A86124CD09121E5FE2@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR03CA0236.namprd03.prod.outlook.com
 (2603:10b6:303:b9::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6383:EE_
X-MS-Office365-Filtering-Correlation-Id: 10b76e73-e69a-4ac5-6b8f-08dd52c94941
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XWiN/4APaScRTEZcIHy9vQtc/9aWCk7rBWVjNHlLGbWEEC9RWBq3JnESNy4E?=
 =?us-ascii?Q?nbxPbhbGmxv/9ZXqqLutga7WQ+iG5ATVj2msbiBkMMtEFsQJwLgQNBG0RvbE?=
 =?us-ascii?Q?+gaEmu9oip2bNeJrn2MHxey+AqotCtDZIbckmF9SrGp6FMWq5TmoyJDIGFpQ?=
 =?us-ascii?Q?WiHLPIQizr+CVrgaYIjlDcZyYvHCH6O4ooV3h+4CW662MAWaESxctip1lJrp?=
 =?us-ascii?Q?i3W//JpIsJZGMzxlDQpyp/nJMJa5mk50n9tHCCCPR5TS7uaUePwSQktb7OJO?=
 =?us-ascii?Q?2wuyptJ2OSyKu3NpdBmFzmseue3do04kWHkM7Aswe8mXXvgKoagsaOMuAwfz?=
 =?us-ascii?Q?SQJxuYvOVcGp2LtocZcFpRUXb4czRj7fLEeZG39pPAJnXs/IiTZHcE5iK01y?=
 =?us-ascii?Q?5A9kNqQ0MOKzDI/ieIhvGgqM+K466jDSr2r4L9UozmxPwTo/KLZTWvfgj/JJ?=
 =?us-ascii?Q?RsBurT22Pay32ukmphq+KedSyX+KuNPV2hktLxTBuX7s66PC2U/AfzlyA3Sa?=
 =?us-ascii?Q?SnkF+0IYLB3kva5/ji4zNWvSzEb6vlRW6219+1OQZj4Q9LuLn/N8X+zEm6wo?=
 =?us-ascii?Q?MgZe5WSe/FUtnfgAJSUxINl8baKsIz2rofxhxL/r2fIzb7GXuRuLGiHuvzkw?=
 =?us-ascii?Q?xlmWONWiXD4DBDhWp/tG81dePjeojtu1HZxukqVhTgG05xOIL5aWKOuc0ZeH?=
 =?us-ascii?Q?fHfao3DPoJMiDTbCPCToPGkFGCoO1+b3rMTp0vpNHc7Jl+UT9NoPYFORvE7F?=
 =?us-ascii?Q?wGVkwUPE0uZl0T+S3AxyIvmH/Ggo0RC6qCV+FZTSj03AbQeAErMwzetNs90t?=
 =?us-ascii?Q?0rQuQIc+kHdUQFd3ms+wH3AfZZm9SRT4jSpXors4a+XqdYNDlR5J1xkYSpQL?=
 =?us-ascii?Q?MNuXguxxY1MdQjImXvqgN7xmJqRrgGaDDKuG0Mkvk39UZcfmG+XvWrm9yhSI?=
 =?us-ascii?Q?XbgsTQErUjdipdJRz8k/9t7CpqtMv4/8zjfyzeA6jownlhjDLWB8tp5wWE0d?=
 =?us-ascii?Q?Uz5YnT5vDjWWNZrThtAN0O+l+F/ZTapKSBh6iNxz+iZzZav4Ri7cuV1IzbOd?=
 =?us-ascii?Q?pDTwYc7De1TrLKls9eZjMPiFPa5PDgXd0/egXysZ6cRJoCMbj+opfSVov5sT?=
 =?us-ascii?Q?YTEiu+gJkZMgD18ajCbdCWqyM6TgSOHhJrctsH/55GXD8zOrPpK7FZzFme0E?=
 =?us-ascii?Q?IESU8e08W6YDjlUklepdTIKS2eumaFkSvnHEk9Dm2WClhEAljoGXugkrN7MM?=
 =?us-ascii?Q?lkTTF5SgpwV3gQJdJyrIwJyfx1K1x5onF/KTauAUKmrkc3ANAtlBzkrLLB7O?=
 =?us-ascii?Q?fPjBUjXxMpUSYbWOQBi4jyyFPgQIvjfVKOwYLhv8yJEDi37BOY7lAWxxQ7Uf?=
 =?us-ascii?Q?+o1LU/jPQspdRaIwP5yKDpuyIat6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SH/eb0EugerDzuoDbd/oXcFxUo8Shj8dI+PTrIqQBD2zbGUNKDoeEAe+xxM8?=
 =?us-ascii?Q?CjcLKAe1pzArEgJLZAljps0ym4BnnDLd2D+6xSAe9BrA8GCl/YmaahN8FQ1Q?=
 =?us-ascii?Q?W+wNQNrSJzErEuaJ8WuuVStlK8JOZ1Q4D/SlBUKtENdj9O+nc9WomHc0wqwm?=
 =?us-ascii?Q?wDl0muHipIkOgiYpiyrpAMIXyD2Qe0URigPYTmQ5BdlOVbFXOneWklJ3vlHs?=
 =?us-ascii?Q?7AConWKqeil1N/DP8/jO9pK1OAgWDYzwSQLBTWr+WvCrOv0wYfNtd93R/8HZ?=
 =?us-ascii?Q?PYrirXWvAgg/yq0EJGkgPwt4NJYdvWY7VuDA4RcD3NETlnXWBkPSksA7ld1H?=
 =?us-ascii?Q?V7cDqQCnJTCZ1wNMGDXfi92hQLfczqx+n9Tr/PWxVDkmgL6lEvjeaLOyA3ft?=
 =?us-ascii?Q?Bz7LzxolH6v6oFvGzh0On7+2nPs51xMk9mEiVQ1Va6CxUXpc5JfDTJkQr6Tb?=
 =?us-ascii?Q?uKzpFU9CuHvSOxPq1W67vZD7cU0APXZwXLctirBs6VNqaupkDE91qwKhd66A?=
 =?us-ascii?Q?6ZFOJGWje6LrPu85nKBHxMY7xZfMW9a0/njxwdTY/qsM7gJi3LAazNvRsvWy?=
 =?us-ascii?Q?1L/dqtFgGUdTHL/zdE4xgD+cnPLxuC74zqIhELAM4V1CLAF/xxT6HBCNWnUu?=
 =?us-ascii?Q?Vvy9wHf+3v3DGN/TkKc7RukU0yEIyhwCG11Yvg1QpM03bJgGMvoXCDUE2jKS?=
 =?us-ascii?Q?6CvpgUw3yMFJoTsiRoOW+7NK49/YAl/2mh4otGEqHTdkTl+MwJsEtPc3VE3m?=
 =?us-ascii?Q?7j48Mzh7K1FmEv1hUxeIvWw4czoOc7Ypbdnyd/kjVgD1/5mrjqdsT4o4nw2p?=
 =?us-ascii?Q?rE9/R7oneKMvzVEy4v+ZIbRufa+JHkWrOeh905Rlc8evywhdgYlCfdbQe5NK?=
 =?us-ascii?Q?yUsgrIR3lmOKqj9F4R8mVXGHkwKUk3507WmQQyq45TGsQOwiz7DfBYlkq/R/?=
 =?us-ascii?Q?FeMCfjvIG2iSDBLDToQuJyIDPMkF1DJHMhYedEd/2HGjohzp/ttxKxGRPRZX?=
 =?us-ascii?Q?TzTKSt5z4mziDG8o8EwIVHLO+m73AhzEpW86MMPIH8Ha6bHfGf/vEzciEowK?=
 =?us-ascii?Q?2ZYPAdmiJrvTsMyOILR3Xi1Zj8KGGqjOMC3YAocaN/bFaZVzAw28Vcn3ncmd?=
 =?us-ascii?Q?OZuG1vkDYgRQI1tACi1aPa01o1dSptrKKqXd0mJiI2HisbKc/BUdoDIuJFac?=
 =?us-ascii?Q?/JdH+2x2v+9SdsAixpmCkT/KF+ZzCNEWD7YfaUiE8GiB/edUhdP4OEPc/Vl3?=
 =?us-ascii?Q?AyWpznHZliOcZ6ryZkrFCpsc7fVWSoZC/srpMSV23U7A8zlXsyrImUoElcD+?=
 =?us-ascii?Q?zto97yRTdXK0JvsxlkrijEqVBdEdNMGbEJmrsNRaOrvL4SCxyzBCqqVwirM4?=
 =?us-ascii?Q?tKja7ffzmgl0f4FaNH8ULzKkR1HRPM2LeCfjb5tRhZIfsGFPuYslwJ4eeyt/?=
 =?us-ascii?Q?IT/P4Tw6TVtU8fugQ3d/kAGb1Qxm3U6OS+nrYktuEI5c3FiVtxgKmcencTQk?=
 =?us-ascii?Q?moGsAkCwcYFfEDTlV0hFRffvg4XvH83z1Fn5/HVQ7NvzVBoe6sxJQTFqQqMM?=
 =?us-ascii?Q?5Fqlkg2lL18oha6RS2nDxqet4es2rY4Sxm2I5zYN+JJ0dAuK1TwNyWWQTzYF?=
 =?us-ascii?Q?2g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10b76e73-e69a-4ac5-6b8f-08dd52c94941
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 22:44:23.0363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6x1L+52aJFQnyL/EtW2+3Yq+CMgZCx885P2R6ounmkyav5XDZyN+UlJX9RePAj8GFhOGdcb4S1GvFAd8kSw9KQWDaJ3iKOM1JysG5inqsfo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6383
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

On Fri, Feb 14, 2025 at 10:18:35PM +0000, Cavitt, Jonathan wrote:
>-----Original Message-----
>From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Lucas De Marchi
>Sent: Friday, February 14, 2025 1:23 PM
>To: intel-xe@lists.freedesktop.org
>Cc: De Marchi, Lucas <lucas.demarchi@intel.com>
>Subject: [PATCH 3/9] drm/xe: Switch from xe to devm actions
>>
>> Now that component drivers are compatible with devm, switch to using it
>> instead of our own.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Looks good to me, though since we removed all calls to
>xe_device_add_action_or_reset in this patch, we may want
>to consider removing the declaration here (I.E. take the
>removal from patch 4 and do it here).  Alternatively, we
>should probably just squash this with patch 4 in this series.

but then it's mixing the impl removal with the removal of its users...
I'd prefer to keep it like this.

>
>But besides that:
>Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

thanks
Lucas De Marchi
