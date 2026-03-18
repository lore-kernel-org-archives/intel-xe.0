Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 890FD10775E4
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 16:34:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F13010E04C;
	Wed, 18 Mar 2026 16:34:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TXea1NsW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C716F10E047
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 16:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773851693; x=1805387693;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=z1bFtthx9G34AzTVEHc/ayef9kX4Rdszs4e12kNRfWE=;
 b=TXea1NsWq5NnKbdd+tcNraoVk9/55VJLiabuCGC8kzwxoX7szpZTe2FC
 yBex3u5b9MgpEgwZlMjnSjyy7rRT3ek0X6qh5NEl/JoY6RSlYlzEQ2Nqb
 BoOiOb9EZ7zKZskhqRe5d7guSVz5g7INRu4MIEOdsKI7ITAHzbeLOMicg
 vAybBcSZGarIx3ebxYGuyQRlSSfw7cOPyuI2fOyxlwNcvvQclvmb294yA
 Ud+u2ZpGO7DUce4L7asaNX5+kNcTkrfSE7f1WDQiQ+SilgbTVXsSZkpz2
 diwRmbxwFuQ62tyJRern8nO8tWvXYzy9nlXAh48nz5bINDZ3dWRRgxZie g==;
X-CSE-ConnectionGUID: vrsQDXnHS2Cp7GVoBj5+JQ==
X-CSE-MsgGUID: OWkEylrySyqNKnLE5Y8kkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="92485608"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="92485608"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 09:34:52 -0700
X-CSE-ConnectionGUID: 0U1FDSJGQ5q+0U7nOCpTEw==
X-CSE-MsgGUID: k2qgEbjmTeKZnHzFeh0grQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="221761494"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 09:34:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 09:34:51 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 18 Mar 2026 09:34:51 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.47) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 09:34:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eaWhP6fnuOjhOJ5wp41kojWX4JXh8lgMAoHiWeeR3esxg+FJoG65pLlEV/3u7jBUzfRv0JQ5SrKihvPjSJXXq+0+Jpo+I1IQ99Z/7DGeAZDNKb/zMOFrMJ64Xz5zV3dgq+WSpW2NS6Dd1IxrauYDwgmPbf78mOCYetdPWaLbP4ty0ezKn4LQG/iVMPDrexzJts6SJaNRmE1z6ZpWuDNDK3L48v6DAyAM7nSNE8344uR9KMXKlLSwXX2lbhwNCGSzlnz0zXaEmN2CwXZHQ1E0bQamyOqI7GYvDKwybpljf1bGoOckjXurMB8r9uwwCwCRQJ+PVjMtAQiGE46VyjlmRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jukYH78DvUex/wbMA94SxnkUudVgDA9oMmjxz0vRN1c=;
 b=IKZ1TwBI9y4sy6IGX/eS4SVQwsif5hGjIDkXF2Qkjp2Hu7e2R/UMcgbon/e/uiHLINq02r1cC7XWmQXx3ZcUh1iNGsckmBYx7ZeDEtlh9AwPk35gfA1LY9F/q8vXfX3OH442JR2ok5Povjud4RFL3wC/tHv6YTF6W2QrYjZu0Bo+cQX4di81XFteG87G+STAqhTBJFy+uXk6QBQiJ3ukjTJ2y4UJ1CNjHYxnEOi/lJzUJAnANpuNMKAMViiIHui/kOIGqkWM+CTb/nwsJJMZYgdqqweElriT+4m8rG+N8x0ku5gbU+941WyVNRj+Kq+ereCN8iVYILGhjrViwdvNJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MW3PR11MB4666.namprd11.prod.outlook.com (2603:10b6:303:56::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 16:34:43 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.20.9723.014; Wed, 18 Mar 2026
 16:34:43 +0000
Date: Wed, 18 Mar 2026 22:04:36 +0530
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v10 6/7] drm/xe/xe_sysctrl: Add System Controller power
 management support
Message-ID: <abrUHJOvjAThXZsX@soc-5CG1426VCC.clients.intel.com>
References: <20260313143303.2441609-9-anoop.c.vijay@intel.com>
 <20260313143303.2441609-15-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260313143303.2441609-15-anoop.c.vijay@intel.com>
X-ClientProxiedBy: SJ0PR13CA0199.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::24) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MW3PR11MB4666:EE_
X-MS-Office365-Filtering-Correlation-Id: feb4b421-927f-4d84-e341-08de850c4268
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: qe8Jp16hdkwcwKoFuw/DFR74MPhkn4AdOtDtGSa9qeUpJ45NFz49izIZnaSyfyVHg3ABnTU41e+Wp9c1HRZhGmzBkHonwwzp3MlftHZ14xQeWVyYLbDr7YDM4U7Gre4GKleuRddLZ+upVKGtVxlmOBQjV1irT4PJCqNXjK8fiEwznn14tFL/yMn2A4KrD7m31o7DkIJ7C5SFwsX9q1cLpTruuO20gYJM/lCg8BuqD4o8SMBFVw8v6k8+0Rq0knP64AmVRdGDNPLS5Gw8ESoLE1em3VkH/l00b6xVYxMRorWlj3coSHG1INZYtot8kaWV3PXpELrYB9RkGq5apwGz7P8YvrnBZ+zRL44uOorCKVT7VzIokAFrMgwTcN4JCSWx8R9x4rUrKbq8lLDwAWfEphNDPiRa52kGvTWakpltlrD4DIs6EB8SK5NI5KFQ8/d7izVGrC3mcqHRc693WozjEcG4lik+6HKJneFr3JopsbqmP/pnifAFrDyXsbCG5l5QmeLp95Q6+Htc9q4j3nlEN/ZytlsTfznRiGqbbygbDY8eByo9fPVwbeQWsPbZdAywFGWQnJZcm3xxuvtuxsKJOncWSg4NzTljdO4ck6L/qLFGK6FRLcOORTkIrxMpz+TBRkhRnr5J7AoaDBlgnykMP79gnA7a0MMYEl+zyXIXhWTHIaPuweRIGy0DzfCzT7s2W7/9KqDK0TU45wuLOvwvwPWCBPD/RvBLanV/ECY9FoA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWRnanhFMnVuQVhOQ0JOUzFyOVZZcVZDMDB5dnRWSFJhUEpUdTlpQjFDY1E5?=
 =?utf-8?B?RE5TelA5c3NldWdjUTd2TVNKcmZnb284U2JobXdDLzdRbDFDYjFMNWljZDJy?=
 =?utf-8?B?TGRScEhpaEtjdmZ6UFBBdTdMTnJPYnhYYlA3emc1UkJhVW0wamdEQWp0bVkz?=
 =?utf-8?B?bGY5TitRaTNsZDE1SnkrYnlUNUxhRGZuWE5IbVluUE5GblcwVUlaV1BQVUFZ?=
 =?utf-8?B?OTQ5TWdSWTIyeFZOWFdhcDk2Q1psOVF2S2gvM1hoMlR3SGxGY0N4SzJocEhX?=
 =?utf-8?B?TDBla2VoT0N4MEJkZWgyTTF0dkEyRUVhMGVEcUJsV2haSFBjckdmQVIvenpv?=
 =?utf-8?B?aVFQRllXRm1Oak11TnV6VFRFNDdqNENUdk9lK2xlcExuZHJxVWZNcElzbFps?=
 =?utf-8?B?L3A3ck5jRVZQYTRNWkI4Z2xvV1dvM2F0YUdqNGRaMW5EZVIvTUVlZUFnblVQ?=
 =?utf-8?B?SkM0TWRPS0tHbDJuTXRUNWthMzcrR29meUJwdWcxcGFybjQrL3FCTjRJNVhU?=
 =?utf-8?B?VysyT2cxbWNIOFZOQlVFdXJoREJ3WWM5VUFvNzl3dXBlaWdoRis3RDFSZDh0?=
 =?utf-8?B?L01KTjg3OXpUUmlxMDRkRSs5VjVzZ1Q3WUViRS9IeWF5UFhiL211cnNMbnhQ?=
 =?utf-8?B?aXJmWURaRTkzTC9jclpRTmxWdER1Wk1LOGVONno5UERxQVdHZ3dkVk5SNnNH?=
 =?utf-8?B?QW40M2xFSThCb2FuZTFRSm9rNHduTi9CVmZrYyt4b2hKUjdYZ0NVdi9PelU0?=
 =?utf-8?B?NEl1b0Ntc2s1WGZXaHZUKzIrOXduVmhIK25IaWNkazNOZjdpcHFPckFIeEUv?=
 =?utf-8?B?SW9QMDZFUGFnOXFSeXVKam1RME1pQ05aeW0vdnErOTl6R1dXY0t4Nm5EM3Ja?=
 =?utf-8?B?UWp6aStGMmJxV3NCUEJVeUtLWDYvNjNPUVg4YndIMmcrMjZxTC9RVzc5cnJQ?=
 =?utf-8?B?UVBkZ2VTTWUzWnhpQkhHU09oSHdjZURob1UrdHJaeWZXVTQveVJVRzV2ZDJq?=
 =?utf-8?B?VTlTRTcrRCsydExsTTZPUHlMT0FvWmFueXROWmhPOHdsWG5jMzFCN1hYMDlJ?=
 =?utf-8?B?UEQzUzB0blJRSS9kandJRzc1QzZYczRJSVNyQTFtYk9LZnhoclZWNjNkTDQ2?=
 =?utf-8?B?c3N0eDM4UHc3TkRyZW5OVnFPSy9oc0YwTklzbkJ4STNmbGRUQmduVk53cmFH?=
 =?utf-8?B?TzJrazY4ZzU5SmlxQWlPaE9BRmVFendlb1FrQU1SaHRRUHdVMTZ0d3NBVlJM?=
 =?utf-8?B?NWdOSmxyb1g1WW0rNE1YZlQyS29xOHVTZjd5WlhkQUsrQnhvVGhtMWhWQ1dw?=
 =?utf-8?B?dm9ZZlJLUzc1VmFlODZzQlpxS2lpakZIdTQyNk9HdlVtNk1PUUdBMGs0aEVV?=
 =?utf-8?B?WHg5U1hCY3dPS2FWUE12QldQa1RNeFJRVk4zK3hOWVZwdWxjYUZmMU1uQ0xp?=
 =?utf-8?B?MUtsN3VEdkJRMHZRc0ZlM0FXR2RTM29ITUhTbUFudW4rMVZKbUM1VjdwSWZH?=
 =?utf-8?B?NkU0bGxGdHphS1h1RE50M0FsemExQkYwb0NXNDN6UWJQZ29LZWVPUWpwZ0cr?=
 =?utf-8?B?TEhSc3lqdzFQblI1M0ZoZGRXZVJ2WEsxbWhWNnRBZWJaRldJRTRBWHcwL244?=
 =?utf-8?B?dFhNUzhXejRmMHBtNDFpOHhjTER5bWY4aHBoelRISFQzbkNGUmExVGNldlYr?=
 =?utf-8?B?b0h3eWN3TnJQdGFGTkZxRXBpczk2MDZxT0MvMFBOUDRTTzNNM2dKNDZtNm9U?=
 =?utf-8?B?dEptN1BoVml0UU54R05iK2F2YU51Tmp2UjRWSnB3MXU5LzRYb0E0WENpajhK?=
 =?utf-8?B?QXgrNVlMQXNNMUtiY2ptY2ZCQW9JcUpRV0dUVjllekJXUzVTVUJkRDAzZVVv?=
 =?utf-8?B?YVFYdGw4T3pXaXJsU1l6YklZRG1iT2tQQm10UHhNVWhWd0ZjNHdQajJvZitv?=
 =?utf-8?B?NmpHM3hwQ2Q1TmdXakFCNEErcU1PNFM5RGJxeFpmcUhSVjRDQUJRZ01sWFN6?=
 =?utf-8?B?MkxMVU5Tak1jcEZoYkRCeGxBeHFvb09oZ0lMZzBBUUdrdlphblV3Wm9wRXl6?=
 =?utf-8?B?dEFxZE5qQmhrdmtZL0pqVTIrRXBSeisrSytyanVKU0V0a0ZEQ255OWtWMUEz?=
 =?utf-8?B?NjFsdTEvbzVBUXBRczFyVVUyL0dwaEtPRWZJdVhZdVphTE05cmp5cllhRFAz?=
 =?utf-8?B?cHhEa1d5ZmtYK3BHS0RsOUpmU1RWWUhVVzlqWHVrRTY3ZU5IYzZjbFBXSnZO?=
 =?utf-8?B?ZktQdzdSYWUrSE8yUlhRUXlsb3I0ZHc5S010Z3I4c1lBK0lpOGVrVStKTHVT?=
 =?utf-8?B?V1Jpbk5XTnQ2V1BZMHZ2Y0xkcTBkeTZyais1WTcvMlFFVHBQOVBtUWJ0Sis4?=
 =?utf-8?Q?VwwtoQg5L1pRaHYQJ3t3utQe2sE58u2yjg9Q/?=
X-Exchange-RoutingPolicyChecked: VMDh7dob2OeRz2K6pCaQQsnYMrtKusrq7EXQRbJliJnfQb0142AFDt8PcsgtRmuMPheC30hi3J+YV590CeAvCtWuwdIuHbP97eBJDimDShJ1gwO+Vgoy0eRQlvixy6sYNZtGj9vnEx2Du7Fqa1IcXCmvJzCcZUjei8rey890yNhFw2uRQDtQh8ar5NUyVMf5EUvDj0q7KzN9P3iOkod8bGPg0hhuUDeOHimzMWMFs/0XwSI6xpR0AR9DLnRObWDCq3CzJkDHn87iAw3U6r+ram+Z7vkXXuI0u2aMvfZg6hX+9lqWimYSEM67SG8sRjkfC44fkvitbLbeOtX0+o5XSQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: feb4b421-927f-4d84-e341-08de850c4268
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 16:34:43.7106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LgNpe8ZXbiGe/xOfnuFYuVu2+uQvDzv1mNCP6D8Ni4CaSqrV2VUoemqA+nVr8ubxktmfZjC7YuQYas51KEQeJCLV96LacXxKxbIjaQ+V3Ao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4666
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

On Fri, Mar 13, 2026 at 07:33:09AM -0700, Anoop, Vijay wrote:
>From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>Add suspend and resume handlers for System Controller to handle system
>(S3/S4) and runtime power management transitions.
>
>The handlers disable SoC remapper region before entering low power
>states and restore remapper configuration and mailbox interface on
>resume, re-establishing communication with firmware.
>
>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>---
>v10: (Riana, Umesh)
>- Added sysctrl suspend/resume handling
>---
> drivers/gpu/drm/xe/xe_pm.c      | 11 +++++++++
> drivers/gpu/drm/xe/xe_sysctrl.c | 40 +++++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_sysctrl.h |  2 ++
> 3 files changed, 53 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>index 01185f10a883..abdddd44a575 100644
>--- a/drivers/gpu/drm/xe/xe_pm.c
>+++ b/drivers/gpu/drm/xe/xe_pm.c
>@@ -26,6 +26,7 @@
> #include "xe_pcode.h"
> #include "xe_pxp.h"
> #include "xe_sriov_vf_ccs.h"
>+#include "xe_sysctrl.h"
> #include "xe_trace.h"
> #include "xe_vm.h"
> #include "xe_wa.h"
>@@ -206,6 +207,8 @@ int xe_pm_suspend(struct xe_device *xe)
>
> 	xe_i2c_pm_suspend(xe);
>
>+	xe_sysctrl_pm_suspend(xe);
>+
> 	drm_dbg(&xe->drm, "Device suspended\n");
> 	xe_pm_block_end_signalling();
>
>@@ -259,6 +262,8 @@ int xe_pm_resume(struct xe_device *xe)
>
> 	xe_i2c_pm_resume(xe, true);
>
>+	xe_sysctrl_pm_resume(xe);
>+
> 	xe_irq_resume(xe);
>
> 	for_each_gt(gt, xe, id) {
>@@ -618,6 +623,9 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>
> 	xe_i2c_pm_suspend(xe);
>
>+	if (xe->d3cold.allowed)
>+		xe_sysctrl_pm_suspend(xe);
>+
> 	xe_rpm_lockmap_release(xe);
> 	xe_pm_write_callback_task(xe, NULL);
> 	return 0;
>@@ -670,6 +678,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>
> 	xe_i2c_pm_resume(xe, xe->d3cold.allowed);
>
>+	if (xe->d3cold.allowed)
>+		xe_sysctrl_pm_resume(xe);
>+
> 	xe_irq_resume(xe);
>
> 	for_each_gt(gt, xe, id) {
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
>index 84e3b70043a1..a3ac49e1985f 100644
>--- a/drivers/gpu/drm/xe/xe_sysctrl.c
>+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
>@@ -82,3 +82,43 @@ int xe_sysctrl_init(struct xe_device *xe)
>
> 	return 0;
> }
>+
>+/**
>+ * xe_sysctrl_pm_suspend() - System Controller suspend handler
>+ * @xe: xe device instance
>+ *
>+ * Invoked during system suspend (S3/S4) and runtime suspend.
>+ * Disables SoC remapper region to allow safe power state transitions.
>+ */
>+void xe_sysctrl_pm_suspend(struct xe_device *xe)
>+{
>+	if (!xe->info.has_sysctrl)
>+		return;
>+
>+	if (IS_SRIOV_VF(xe))
>+		return;
>+
>+	xe->soc_remapper.set_sysctrl_region(xe, 0);
>+}
>+
>+/**
>+ * xe_sysctrl_pm_resume() - System Controller resume handler
>+ * @xe: xe device instance
>+ *
>+ * Invoked during system resume (S3/S4 to S0) and runtime resume from D3cold.
>+ * Restores SoC remapper configuration and reinitializes mailbox interface.
>+ */
>+void xe_sysctrl_pm_resume(struct xe_device *xe)
>+{
>+	struct xe_sysctrl *sc = &xe->sc;
>+
>+	if (!xe->info.has_sysctrl)
>+		return;
>+
>+	if (IS_SRIOV_VF(xe))
>+		return;

LGTM, but maybe checking for VF in multiple functions can be somehow 
avoided. Not a concern right now, so this is

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>+
>+	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
>+
>+	xe_sysctrl_mailbox_init(sc);
>+}
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
>index d5d8735038ae..a816feed8da6 100644
>--- a/drivers/gpu/drm/xe/xe_sysctrl.h
>+++ b/drivers/gpu/drm/xe/xe_sysctrl.h
>@@ -17,5 +17,7 @@ static inline struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
> }
>
> int xe_sysctrl_init(struct xe_device *xe);
>+void xe_sysctrl_pm_suspend(struct xe_device *xe);
>+void xe_sysctrl_pm_resume(struct xe_device *xe);
>
> #endif
>-- 
>2.43.0
>
