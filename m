Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62A9C71136
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 23:40:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74C7F10E19F;
	Tue, 17 Jun 2025 23:40:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kkc8aHUa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8861710E19F
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Jun 2025 23:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750203635; x=1781739635;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=db+GId3Ar4J0G/z2eUaWCCl9lnZOlOsw8d4Ba/Cw7Mc=;
 b=Kkc8aHUaUAIJORknzMfslr4UE0o/4OZc7l/F/XAN1JDM42Z8QUiSHUM0
 6n/0xOp/BYvJvVQ9SskH5NDYGbWtI01c41C4on1X3vZ8m6M7UV3dr9F1Q
 o4R4k1D1YsHkRQElbti4shqiyVfxGb+tkZeH6iuRgKRjqmm6mqJUkkZJl
 GrZVfW3OBddyoO5p1nYxiW+cyHg3AdOU8bKj7+VZiBdsLTdVKHrCVEgeJ
 F/A/hj2CgxKXbPzitDAP0RO4j90qXQZbBix2p7Q5dzd5On8i6kRybsT0O
 rd0xxzNogWh1H9Yoyk+uVvjwCJ4pKvezvWJQmvTSqZ4GkntOJgG2SqTli Q==;
X-CSE-ConnectionGUID: eOO+EQzvTMuWQ8To9PVkqA==
X-CSE-MsgGUID: MkP8fHxMQEC4XW7MFfhZuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52543364"
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; d="scan'208";a="52543364"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 16:40:35 -0700
X-CSE-ConnectionGUID: yrqmPV52R8Sg3xitrQptTw==
X-CSE-MsgGUID: JyRILXMqSDSb9mxyEA0f9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; d="scan'208";a="149541123"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 16:40:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 16:40:34 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 16:40:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.52) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 16:40:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EGFvfivwSwnFUAfZWfvH3kBJ9gd1zk5KZTOhzZPc8VGhWa0zNsajarixPOr4iWp6nXLLoFXdnKJMhLvyiCMqkpvB9FAj0L1v9namaTebBCustwq+V9aEW0H6tF9XR2KqJv2Zc1/4cqs4VXz87D+J0ReKqmQa2AEOS7LD/ujFyQSW9TODBe51Q05npyBTWEc4lSzooe/7p7mdl0SuzxwqytCobNJmnXejQA3f+xHg4K3SlrFYNZLMlDS2uPj4438qK8BZekSvtUTA1bwX3kdskmKHLjOaGn+opt5h6w63OdYh3MWvS2gTCqPb1BO2nwUW5dg4UB1v/N1GYc+GcuBtYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1RSjHMQwvZX+KAFMZfMog70XeW4EI0KzDPz/8JFy4wM=;
 b=AesTq3XdYjkY1SJZ+ZF0cDQ8fVO77sIteRTGXxJEd4r7mXeG1dxS22DHv1sBJnw76nrslP6x8axF01vleWy4R4RSRQnroNy8KmHCUMZ+A58uRxBezMeNUidpUYj6axCXReF/DU48fUql4/8+qA4vMsm6yBI0+RIoFOeZMqTHTVCam9t/HS1tlzcIY3Uw/MmG3K3Lr2fqL9THBxyNQw10B+VvI02P/YrFhsul8mZL7PQxFThDtg+vVik/jxzChNrNaObS6BBYt6guzO2eDfgSxMff9mT5fWGB00VgBNByBbtTZwGIzFWx9FQKS1pRD+KIGYpTO9nInjkkk2+ef/Eteg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6334.namprd11.prod.outlook.com (2603:10b6:8:b5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 23:40:05 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.016; Tue, 17 Jun 2025
 23:40:05 +0000
Date: Tue, 17 Jun 2025 18:40:02 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Michal Mrozek <michal.mrozek@intel.com>, John Harrison
 <John.C.Harrison@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2 0/3] drm/xe: Tweak default GuC log level
Message-ID: <bivcz536vj5yw7pth4akihoi7as3vn4bptpnwjurgjpqy7nv4l@t7nbjgqr5jwh>
References: <20250613-guc-log-level-v2-0-cb84a63e49fe@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250613-guc-log-level-v2-0-cb84a63e49fe@intel.com>
X-ClientProxiedBy: BY3PR05CA0058.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6334:EE_
X-MS-Office365-Filtering-Correlation-Id: 92ce352c-c6b3-49da-98f9-08ddadf84946
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?G+9ykAj/1OcJ7VKsZbeghzvR4fU/VWZ15b3AzBo6d49DH7bF0opTWsdSj1r+?=
 =?us-ascii?Q?gSXpJwikgeBTHB6T8dJknGs7pjD4iI06ProYk2xwJkeweqr79PeHdQitcn3X?=
 =?us-ascii?Q?2678GDZAngf5H7yTXVzNgzrK6/BmID0e/Hej+I4B71/JOpEqUco1bkDakiHL?=
 =?us-ascii?Q?bw+rIqxyKrpqXFI7J3DP1r7KTr4KkxiziVevNkxI/zm9YusBtWlKgiRQlSyt?=
 =?us-ascii?Q?au/O3VVn0rvCAO7HutRyNygqeoMD9NE4oSzaoBQxS5KuNHrT/yqAxaMK5Wmq?=
 =?us-ascii?Q?C3eQD5VaIDRrvamCJJolfhatVGbx7//FeB1OzmBCKTQeKQwfb4TW78OYR/7j?=
 =?us-ascii?Q?UfjgaxqKJ+I8z1qH1+kamgFLRjtKLG5Br+MQ2dyj2UsK70zBscNgY3+hPh/Q?=
 =?us-ascii?Q?0ExI4oXsNRxN9NxKvy9wFx3BcXbY/BYmwLo6wkE4DKbnWku6E3EPprtjfD7q?=
 =?us-ascii?Q?DKBnXVCNdzSNEyaW1YmACYhaswbCtnQM2kjc8vvErF0daWf8ZxrwJxB5uQFD?=
 =?us-ascii?Q?DgOU5IgcCSDlzh73VnaWqDYBklpCFfQZUEKYXg5VGxDDADtNGm4LeNdv9JdN?=
 =?us-ascii?Q?NgeJNPgfKCkph2KKkfvrDatqOmyC/Zwjs8EQ1P2VQfPTulzPag4IlqhZxA93?=
 =?us-ascii?Q?9VNr83R4IQSHQAPd60g/ANtr7309tyzKgGI2XDNco29eLQ/aS1IVd1mR0HhG?=
 =?us-ascii?Q?IfYn19EwjG3YvCcW1G7u0Y24eRQMvHZ9sfykugUDSqRaODmOqVg0P3eXnRct?=
 =?us-ascii?Q?zPvXhf+sZMdDaKMgaUj4fcLKtEKoLMDbQeBx8EKE4vJAy4QR1havJApyWRUz?=
 =?us-ascii?Q?jtqij1yFZUmBjxpDm0yyVYpz14OBL65pBQFBSbjUJYOd4+RQEd5p2QAxGVLI?=
 =?us-ascii?Q?YXpQiAZreJoF0tYA4J9b8Sh4/OxXpQfwLQm8yIm/5c+3myI0aY87oo3NvUsb?=
 =?us-ascii?Q?RKa9SGT+lMsQehW5aCwLKg/h/We80JHpTClF/J5uxEWHVIEobZX9UE52Bm4c?=
 =?us-ascii?Q?UXDKT3jb65kJ1PouO5P7lAYD0HMqGxm8dhGvadCe+mssxd0Pm4yawdAItRyT?=
 =?us-ascii?Q?Eu1S+aL+j3noVc1j0kFD9ee+tCUKEKIFV60XGXBau8qLFcyjWmit/f0hiP+8?=
 =?us-ascii?Q?5jOKQ3/+3kKBu68oVARYO7hKpRW2uMWcsZggucUjiGFv3xykvDFRDjmvDpWz?=
 =?us-ascii?Q?sjxB6GO4R4/2EwZpv7pvjftPtXWeZgiAL89SXstDrx77ATS4PCGxD87jZtU6?=
 =?us-ascii?Q?RXq046SgHD+zpHkkFJCSOHwNyYq+qUBKTH7/bvCMHJfU7NFrrNPwUEVQ5uYh?=
 =?us-ascii?Q?FlDS7afDIy5DDD0k13iE2ExaTrm6VbV42a3JGUXFRsNvxyFfefCO9H8ezKL2?=
 =?us-ascii?Q?efGanPNL/soxFcISqk+ZRdptLNgPjXWOOYzC+/dAw64rcjUBs0hxHAjPHM6U?=
 =?us-ascii?Q?NZ+/GT+Pa8I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y+/G8cawl2q5yLcoRZ8IKgxA4LY4dV/pRiqHkDqXLmzvGEvmMzkI5RlBFb8L?=
 =?us-ascii?Q?oc9DjsIdI+t3sRHEvfyNDUmDp0ySbNofK0BUwoW6bWRLE/0oYRMbuca9ia6D?=
 =?us-ascii?Q?AP4G3qssKf8aY3YiYoE4IJfZNTh9CsFZ4Ntu3mHtPr0WJF0DzW9prfi9O5BC?=
 =?us-ascii?Q?rkMpxokeZSurhO02YSWSvbzoxsEBYwqmEYJHANSyehDSiWrvJ1MdQ63NYVDF?=
 =?us-ascii?Q?EMwi2ONM2EefRY/yfaUFRotOLYrUJjS+yJwn52vRZzH45IZ1GCW2X2qaCh3I?=
 =?us-ascii?Q?aYG9AzoSba6leVSjVkmplhyDeNfDRj6zPsZC67Z2KVI5Fmdme75ANscgxRDX?=
 =?us-ascii?Q?9Jv+7RiIG1ZXECOWuJq+N+l0+5XZMFYOHQDkzTAV5kDyPWE4OQ6qq310CtBz?=
 =?us-ascii?Q?0TMFhnjC8IGtLduckI7FFUOOOSecX0DxLcE+Zb1PPH9SLKhPzxihicKYLz+u?=
 =?us-ascii?Q?y2XaFdEZx85tey4QYjzTwbThI75vBrSvm3T2SEqgyn7pswUgUYZd09QSvzKK?=
 =?us-ascii?Q?fV6tKmk75gpwt4w2ZWJbATxfSxPToHVYYvVRSyZ7hYBEY5P330NXSAmDxl4m?=
 =?us-ascii?Q?+Eh5NHUNCG+KtfUF1Ah17U+5HzCCwGsEQ+DrJ/F2C/YhhPwZ6Pz7Aew0BMlD?=
 =?us-ascii?Q?7M4nEWc/Z0TX+Ro91NF7M9JXZMPZDi2jFCXLVleks3rxzNAA72LRkNRzRMzL?=
 =?us-ascii?Q?MBrda/BfUbzh5cjGgMe1lCZ5J9QKlnoHU9gwxnxvN/80Im1AN/qMBZD5DSeL?=
 =?us-ascii?Q?cj5JiNewHfs12yHjSRR1BseG0dx5+4JHV72Y0+CioZwRkU9FyIdTM03L1tzS?=
 =?us-ascii?Q?A2sHynAw+HuQBhmZ5z6YC20RnhokA17F4GVu6s5CXvKZ5GeMezFvfk0VYy/K?=
 =?us-ascii?Q?B8x2RPFkzTxIfxrqqmeVsVkYpmnxtytiHisTJRDSAIxpzwsJlMbr5Vdp7jxX?=
 =?us-ascii?Q?6cvj8+dg39K1Xpb75/xmBlMOe7/SSb79ENOUtvibr+xvPsCnVlDi3stEAmBe?=
 =?us-ascii?Q?T4w9weqlX3x5j+KSjU6ixSiXwsltCnWieP/zbAdVZ1DWs2ezbsB5NEqRykzc?=
 =?us-ascii?Q?gznH6CfQGicCQRvpFxiLuYE94b7m6FDokD/0oTxu26E25Ot7dU1WQgmuQt/4?=
 =?us-ascii?Q?XBXHzClVda/sQ+5L2XVkbCpTfBx+Wh+iq4j5GiF9BhIir6y0wWn14jrIMckw?=
 =?us-ascii?Q?RZ6hG64hHSmj1jSa/Cngpgxi2TANKsmtfU5hcmCzY3MjfA1Yr/I02d1FGfNT?=
 =?us-ascii?Q?TkkUEKerAz9ZYmggLhMfnWUMD2T6jHfJCsgJorSW7vntteFqBNQEhsUm9775?=
 =?us-ascii?Q?bqdDp+myjOy9atcYwU7HiT1Xmqji7orNE4SSHrKWgztx1zVB8UNRFRhOGxIl?=
 =?us-ascii?Q?ft3spXp+rWRY/UWbCmr4kOaIa+WbuW9FYQOh9RwPO7eDBzNK2aIgsDpin/ie?=
 =?us-ascii?Q?CvlMN7ji2GVSWzz6ylRvrSUtULNEUqhc8SN0c9qilig2gkXweXDaGNqkWgI6?=
 =?us-ascii?Q?YUO3k+ZKLpH9s/FsQsS4x/f2cfqGG4PZ0fg+okAHX4yIGMtmbRmBYzJuiGCC?=
 =?us-ascii?Q?V5/Dmff4/JPs9YyiG8zp8dnmmpcouDgw856fgL2Ukd+7z1cTyn8PNA8Niwvs?=
 =?us-ascii?Q?eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92ce352c-c6b3-49da-98f9-08ddadf84946
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 23:40:05.0905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OS5iQo3dYnqt7/AjtsgoEM0EAV+kQlDKDZb6Bh8qELQO1s969CAewHRhY+uLbxKIc11aJu98Y2aJBFA3mrxZOToYfihbS+i4G8px5KvQGKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6334
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

On Fri, Jun 13, 2025 at 01:00:36PM -0700, Lucas De Marchi wrote:
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
>Changes in v2:
>- Rework the second patch so the default is kept in a single place and
>  the module description doesn't need to be repeated according to the
>  configuration. Suggested by Michal Wajdeczko.
>- Add a new patch to normalize all module param descriptions.
>- Link to v1: https://lore.kernel.org/r/20250612-guc-log-level-v1-0-51f124a3be6d@intel.com
>---
>Lucas De Marchi (3):
>      drm/xe/guc: Default log level to non-verbose
>      drm/xe: Annotate default for guc_log_level param

these first 2 patches are now applied. Last one will need another rev,
already sent.

Lucas De Marchi

>      drm/xe: Normalize default param values
>
> drivers/gpu/drm/xe/xe_module.c | 49 +++++++++++++++++++++++++++++-------------
> 1 file changed, 34 insertions(+), 15 deletions(-)
>
>base-commit: 4d016d6e602638e0ebc3895331224e057508c07a
>change-id: 20250612-guc-log-level-79f87ca03396
>
>Lucas De Marchi
>
