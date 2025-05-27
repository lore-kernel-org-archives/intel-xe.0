Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D121DC54F30
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 19:21:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A67B10E00C;
	Tue, 27 May 2025 19:21:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XHVoX0fS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E247010E00C
 for <intel-xe@lists.freedesktop.org>; Tue, 27 May 2025 19:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748373691; x=1779909691;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9cf34/HmDYaBr5X6c4EDdLC7/6vXjzNg6qxblEU7gJ8=;
 b=XHVoX0fSpPyVNm6vmPmGsrFTzOOhtoPAlbJ4f+/4Lim7owmbN00zTiCi
 hFvZ8Li1AlnTDM7L8WCwKBA3dwgc755jzcwOmk34qqRVA6IT/aOssHFK/
 l5Mfj/vP3Cqf8al8n7yYUkfy1uX0IOyTJg0bJpdptB0JyATGg/tqX4GhY
 e6iq+kBkLOvLoV1x0dGpNxe0h/lGZZRWFVseWtNGGHW6Rgwm1Lwg13YLF
 HjnMol52dCIDrD8qctikK6EY2xM+UK5udI/JLUAIzPN5I86x4WqQ6+wll
 1ufHm18s3cNmoKWWgBbnYmgJA/9UViqBRdu/faXpnCxlQdA4gbV3SH0xV A==;
X-CSE-ConnectionGUID: CEFGtD5tQlapn+x3qsYf9w==
X-CSE-MsgGUID: 7sLU+6znSe6SWEJK1Yil9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="49491309"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; d="scan'208";a="49491309"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 12:21:30 -0700
X-CSE-ConnectionGUID: zw4XcoLeRIih98anXtahcw==
X-CSE-MsgGUID: +DZkwxKiT361ixJ3Blbo/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; d="scan'208";a="143920658"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 12:21:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 12:21:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 12:21:29 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.60)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 12:21:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TOFEhOct6NlNn/gp24ZvRI9oHD7d+yROEP+yH1xYjr2q3NgmRnU2nwSFSX+dWRU8X8ImyF9qZ2tb9RxwEKI+9CdrqOBpBas6KviAF4TCtL5ASKqm+q9eLew0JGFL/TQ97KGXvyQJPMuDndgsRjPcPLJZPyfdrTEwFHdejrK6SVMN+zfXCvn1zqu8PUcivlokdp1/89kWnCnOuj60JscX1GWoxZT8s19T8SSF9C4pBDsndFk5UmUfeuPhyrTUxKptaHT8xnIvH9W/3M135xojKNkhewpC/w6pv28lBzxD5S/wSMDmoXlWyAE05r4LaDbccEWvvhaV5jCX2ki+Zqo8JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=imYSdJuB173dGT3WxyAAQMUotn5btycIy3yMqLe8w/c=;
 b=Zqi7A03Ek4aGufp88kpLcKRQqHE7o1PPJJCp4flik4hRCXA/1BWN0NmQ6Iy6iRJ3qgkkr7Qhlou63YfLmk/EWdjTi1/FiczaVDbqm/9iq7JfAVlq50oxOan3sUXlreGRe6P94uNKEnkyjWy4273ivQq1rVZOYvZ4IKSA4fiMXbRrIewGEJenunsjeAiHNBcDrUyb1jcnFT+TAHk0Po4HXfJayZW6sA4lsk7ghoQR2u5NTxkQ+rF2W8J2oNn6amKNmaWWypEUPWN1HpQFE02NGkyqyCFIH4VZJJyMtcrVD/+cVbQXvoXQnO+7b5k3eXBjxV7b3BwbUXUISQI+IUHrfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB7454.namprd11.prod.outlook.com (2603:10b6:a03:4cc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Tue, 27 May
 2025 19:21:00 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 19:21:00 +0000
Date: Tue, 27 May 2025 14:20:57 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Stuart Summers
 <stuart.summers@intel.com>
Subject: Re: [PATCH v3 2/3] drm/xe: Allow to disable engines
Message-ID: <rypburm47xpqaklrxqyc2oau6lskqoa4f3kxxxbgfubuowfnib@4pgl2mzesqrv>
References: <20250523-engine-mask-v3-0-11817dc6eb63@intel.com>
 <20250523-engine-mask-v3-2-11817dc6eb63@intel.com>
 <20250523210211.GT5080@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250523210211.GT5080@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR01CA0008.prod.exchangelabs.com (2603:10b6:a02:80::21)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB7454:EE_
X-MS-Office365-Filtering-Correlation-Id: dde63646-2621-4e19-a8c2-08dd9d539d44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JlDk3ylvBxFUioKQN2MPngjMx4bjmKe37oRT2LXcR/zkeUBsFNh4GcD6p8lX?=
 =?us-ascii?Q?RtvO7+CHlNeqi8mbD/Eh3e0eXBun3BKCdf9ig6qNv2qWs/hThfFe1AyLxF+7?=
 =?us-ascii?Q?cNH5VyVXg5tk3a5JYtONgG+2iTDFbhYlHgvYfOZgi4/dIvgl+rDQYoWi7SkN?=
 =?us-ascii?Q?6pidDNyr5dOFe4SyD20a+865bXvfQlTjougvJMa/ayvO6NG1sArLtj0qN+o3?=
 =?us-ascii?Q?Earwkbxr0DZduzzN/oOSDh92XB+EihuuvpJNxVu4uzjFp16olmymkOV4DToj?=
 =?us-ascii?Q?GBB84E/21DQe77V9zaP8VuAwcg77kRqFYhmPzOcSCHpwo9QQtI4ten7Bxj5o?=
 =?us-ascii?Q?WlSki/LEbzOdBbGZhpKMpIpWxZX5kiULHN7+UfagRBJjLFEMTDecePYkRH7a?=
 =?us-ascii?Q?ZsyFBaRuXIPWSeqH51lNduQ+lr1F+9BsouyXLgkVkzy0Xby9LUYelg+iBn7Y?=
 =?us-ascii?Q?rJcxzya7FsdMQJJ+dkKO3ac4OoKQB9NOB3LX0dJICnH2UxyCmJQHprcN8kTC?=
 =?us-ascii?Q?DkLa8d87zvGpSOxvWkDEr28V/4cNUQdK7T1UJKHcj53tjv681GQ4sHsoa+mQ?=
 =?us-ascii?Q?+HdwWhFoMOEf0YIiOGYesFJ/hBEssdCvXdcaeEGvvNggSHltbJFIb1CAZ9h6?=
 =?us-ascii?Q?dvdy9OPM9MBfK4CsJq+0ue83LKg1ZDBJNE2sivIDL+LtFh8PR0awSub9MZKm?=
 =?us-ascii?Q?opgw9YNzqG5+tKpEUN+u1JHiYTCwGMMdjJzLgjZ/KPT3XHgvZfSFX0r1EDZ3?=
 =?us-ascii?Q?+nu4See+4sAtTmI3I7zXFXImNV55uQZtRxBQV7kLrFjznaGdgOha1VcMqBmI?=
 =?us-ascii?Q?08ay5xiprOlQcHH3V71FzNIedj262EXPNPc6JQ0HdnSRXU227CsY4jJLpEC8?=
 =?us-ascii?Q?jol5i0JKNyQbF2laXluv0+L53ArI4lsfg71LQUblbqjVcHTjtB9JqIz7UOi+?=
 =?us-ascii?Q?m5Kf0cLxSm/5cmxt/dhhhKMuwpQLEKrLrEV+hLqRj/ab1peVUEHNKGrVbvmI?=
 =?us-ascii?Q?38qT8Gfj8QJUUbiP2jkajeOpPeIRtjdy/dFtVWSIxnh0wtq17K1fTqZFBk3E?=
 =?us-ascii?Q?ro4QYFE1yof4leCVfGD8Cd8eiAZjc4k0a9jqjpQOTbwdIQywPwvQf8PnDu/a?=
 =?us-ascii?Q?PuZ555zhKICf5d7pUi/J+QJwmo4BJnF58CUoKCW52gdfwhGnfCWjpY7yLuMd?=
 =?us-ascii?Q?tBbbYTFwFK19f7+0KjwiZ4VOHGed/xJEQaiFP6fkJMDYNPPtBY/pzCTRUJuP?=
 =?us-ascii?Q?xJ0WE9xJEmhSZkDDFjQGrWGXN+zv+OMXJJdn3mEUv0eZfByHGAaHSQNOa58P?=
 =?us-ascii?Q?8NcpUYNYFfadpRlO1RAgV3HFzdI7+qAaVrp5tAszFIUa+kK/mYUK2SHh9ZB8?=
 =?us-ascii?Q?/TpiAriCJyh08tWfVWLFPVN3Ly52ZUSshdLToTaqvpbrCyPld2BN/iekVbRZ?=
 =?us-ascii?Q?Wcbye3rRYpM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ksok644GAsoD25aVyL0K7OYeBhKbGRGYxp3IOPIiySyShSbmAMvMLIuR0SUk?=
 =?us-ascii?Q?3WZMuoXYWdS4oUApgSwAVc2QXcQASXqXLoIHXgnoXJ2c7m6dg8U/JpYeBwvJ?=
 =?us-ascii?Q?oM8DGdr49iVRfWFAPUafQYm0sRQLJDP8OE0YBea6s+7uj5IBMrWd3FJ+6rWk?=
 =?us-ascii?Q?zNKV7+STftlB/a8idOeS6wrvXIpuV31ScpM1T2gZGcczVx3Dh+BYjSBozM1Y?=
 =?us-ascii?Q?hrVX+yA5Ye0K3jvSzQ1RrM+DbZsntJ8Am/aUd75hj1QPfKB8fgv1fNjmLIGh?=
 =?us-ascii?Q?TH/gK7r2w0bwvn5j1nggmXN20BeGSOcMOHWqj2NyJZuwMNILRGZ3J6Z9U0JV?=
 =?us-ascii?Q?P5L3q+Wtuda8WEz0gBRaCGo+CUtjdzdLt9423HWUjy7FotWN8WfgjkeftNM6?=
 =?us-ascii?Q?riS9cMpdos9GXPSDtfaNwXUQa7jN5bEx49VtSl2h1sHrN7Oxtxtv0piBOcju?=
 =?us-ascii?Q?uexeMKhR6LJ4FNc6aGBXULhVur6GGVks+U3+9RvS6DRqI3RacJCbIK8mj5X0?=
 =?us-ascii?Q?7JKCe2/mUSm13NGcruxy17P5XPMy74yCyu2ADR1Q8XuQIznaE5BLjniz5Gm1?=
 =?us-ascii?Q?Bp6EOHj99LjtVFWCh5Thn9eEYKgWtIK1WIHn/blytPjkU1jcXZTCrhxUxFrN?=
 =?us-ascii?Q?eiYAZKuCkhlilUiYfJReeqr1P6cHjxzu6b88ETETOtyYTXXGJKhB26x1VBCy?=
 =?us-ascii?Q?N2ygdTxMBSKtKL05FqqkDmh64Dwyy08f85U5n/GmRxFSCLMlaiKJmrjLuuTZ?=
 =?us-ascii?Q?Laza62Xid9i1qkfztATKqtXKNzNtfvgJsP05uasWnF4MCUU5M7qr5DFtM5Ec?=
 =?us-ascii?Q?EhQCmv1HtVS11RyzViSJHy+VTokJ7XZ/dMI2mlgd8EMg2P38tbowQnRf26lb?=
 =?us-ascii?Q?NPm9b0Yv+/dwfpgQP4lunDj6ADMBzI3gGWAunMuNnSzr5XH4sK0ZHWt0INCQ?=
 =?us-ascii?Q?bBKy0UGvT9tFT39q33P0eyZg/vyYkFhvH6qsWgGBGbeZe3C/uQuAVqx/c5EL?=
 =?us-ascii?Q?LQpUpZBGg2u5xv/33PhXmkBtoo5gqTgDxmiOWJkl+dpSs3HL2H0Wul/ihpFq?=
 =?us-ascii?Q?FksXN0iW0GqXcRuvXhEQVaSk+n6j8GLfKCqcumc+X3GPbEo67FOnO1z0W+cq?=
 =?us-ascii?Q?wqNKwsr5tAt7iIRm6ALm/+kHUFTcBXZWAz0PMfVo8cqClQO7crx3GVv6xEVk?=
 =?us-ascii?Q?zohEFmyj8N5cvDq503PKTiTeIbIU0Fm0Ku7tKumLwBPZwRlBAOpoahWTPg4A?=
 =?us-ascii?Q?gdQXOXNHOvqg4t109ngmtYvF1+YJdjEptkOFGLw8nafYQmlEQsGnzYExXll4?=
 =?us-ascii?Q?hae3pp5yt4+wcT4UrquY5/jBTidi2Mr0s51Cozz6zm+XzZ5vgV8LO6rS2ZJf?=
 =?us-ascii?Q?nH/iHFFqBKPvmna+x/HarEnDsWgWG3oQSXiVgHs88lV50YgFfcHjyTgDac+b?=
 =?us-ascii?Q?boomfebc/RLyTd/Lhkf2r8bRa9MGxQMJNkFqizlm1E2jcazzWbi6hCcfTsVr?=
 =?us-ascii?Q?Ycfok4vMlU3kZqJUZoBMSvoLVNaLxdB4C7KxuOhxYaI+8C/qSCmrK91wpZnP?=
 =?us-ascii?Q?SflD8eUNhgrzX6q71fyORjJKxHHBs8eOTQJ0b045xlA8DSSqWSh+h4RMc9nk?=
 =?us-ascii?Q?Ug=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dde63646-2621-4e19-a8c2-08dd9d539d44
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 19:21:00.5396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3VPJVNv1mboC6hKWFceY6K8G67IzN24TghAZ7q2ywdP/+aBMO4j3k32XP7pXlcid7x0oU4X2tkJN0/mxqcyaYr6IZ+PGUSaFsOrjX51OFgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7454
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

On Fri, May 23, 2025 at 02:02:11PM -0700, Matt Roper wrote:
>On Fri, May 23, 2025 at 10:42:32AM -0700, Lucas De Marchi wrote:
>> Sometimes it's useful to load the driver with a smaller set of engines
>> to allow more targeted debugging, particularly on early enabling.
>>
>> Besides checking what is fused off in hardware, add similar logic to
>> disable engines in software. This will use configfs to allow users
>> to set what engine to disable, so already add prepare for that. The
>> exact configfs interface will be added later.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_configfs.c  | 15 +++++++++++++++
>>  drivers/gpu/drm/xe/xe_configfs.h  |  2 ++
>>  drivers/gpu/drm/xe/xe_hw_engine.c | 20 ++++++++++++++++++++
>>  3 files changed, 37 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>> index cb9f175c89a1c..11ca36f194bfc 100644
>> --- a/drivers/gpu/drm/xe/xe_configfs.c
>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>> @@ -226,6 +226,21 @@ void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
>>  	config_item_put(&dev->group.cg_item);
>>  }
>>
>> +/**
>> + * xe_configfs_get_engine_allowed - get engine allowed mask from configfs
>> + * @pdev: pci device
>> + *
>> + * Find the configfs group that belongs to the pci device and return
>> + * the mask of engines allowed to be used.
>> + *
>> + * Return: engine mask with allowed engines
>> + */
>> +u64 xe_configfs_get_engine_allowed(struct pci_dev *pdev)
>
>Nitpick:  should this be plural engine*s*_allowed?  Alternatively,
>engine_mask_allowed, although the function name is starting to get a bit
>long...
>
>> +{
>> +	/* dummy implementation */
>> +	return U64_MAX;
>> +}
>> +
>>  int __init xe_configfs_init(void)
>>  {
>>  	struct config_group *root = &xe_configfs.su_group;
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
>> index ef6d231b3024b..050da4689d653 100644
>> --- a/drivers/gpu/drm/xe/xe_configfs.h
>> +++ b/drivers/gpu/drm/xe/xe_configfs.h
>> @@ -14,11 +14,13 @@ int xe_configfs_init(void);
>>  void xe_configfs_exit(void);
>>  bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
>>  void xe_configfs_clear_survivability_mode(struct pci_dev *pdev);
>> +u64 xe_configfs_get_engine_allowed(struct pci_dev *pdev);
>>  #else
>>  static inline int xe_configfs_init(void) { return 0; }
>>  static inline void xe_configfs_exit(void) { }
>>  static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
>>  static inline void xe_configfs_clear_survivability_mode(struct pci_dev *pdev) { }
>> +static inline u64 xe_configfs_get_engine_allowed(struct pci_dev *pdev) { return U64_MAX; }
>>  #endif
>>
>>  #endif
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>> index 93241fd0a4ba3..8e7f580db86d8 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> @@ -17,6 +17,7 @@
>>  #include "regs/xe_irq_regs.h"
>>  #include "xe_assert.h"
>>  #include "xe_bo.h"
>> +#include "xe_configfs.h"
>>  #include "xe_device.h"
>>  #include "xe_execlist.h"
>>  #include "xe_force_wake.h"
>> @@ -810,6 +811,24 @@ static void check_gsc_availability(struct xe_gt *gt)
>>  	}
>>  }
>>
>> +static void check_sw_disable(struct xe_gt *gt)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	u64 sw_allowed = xe_configfs_get_engine_allowed(to_pci_dev(xe->drm.dev));
>> +	enum xe_hw_engine_id id;
>> +
>> +	for (id = 0; id < XE_NUM_HW_ENGINES; ++id) {
>> +		if (!(gt->info.engine_mask & BIT(id)))
>> +			continue;
>> +
>> +		if (!(sw_allowed & BIT(id))) {
>> +			gt->info.engine_mask &= ~BIT(id);
>> +			drm_info(&xe->drm, "%s disabled via configfs\n",
>
>We should probably use xe_gt_info() so that it's clear what these
>messages apply to, especially on a multi-tile platform where the
>different tiles may be fused differently and leave a different set of
>remaining engines that could be potentially disabled by software.

I had it as gt_info here, but that wasn't matching the log message on
the other functions in this file. I will add a patch to convert logging
messages

Lucas De Marchi
