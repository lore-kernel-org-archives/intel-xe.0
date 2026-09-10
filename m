Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4768EC79FBB
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 21:52:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4FDC10E97F;
	Thu, 10 Sep 2026 21:52:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XPBalejl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B004510E97F
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 21:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789077147; x=1820613147;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8/s+NdG6Csw1c7QXvsoHOCCSA36HhdYzvKK+OiK/Lao=;
 b=XPBalejlK0rd39D+5+oRFsQJscVEC4De8aajqwaKT98/R0wPozqPVDfK
 xrPtP+nO6sRAXkpzyALFBzXhTXh1Dp9B6g6wHBNfdWszwcbADk3chPczn
 TnCqj1lsN+atx0nuVudGtNMmzyDWevjjGDtqDPoZVgLs9Q4+cAPgayShI
 IjXu08U7V+b/IWjtriOuvGoPlTpBYEwZ8Ni71TJ7TsYS2zXysSv8fVdcg
 3bEftz0Fe7UnwaEkAiq+zhT/JCN78oXsjZ2sDAdtHHd7f0Hm5+at5rzOt
 m8Frcr4FzjLOIVxUmyV2kvHQMR5cnY0A6fhfguEZgLg9aSlk5RHuxRvR6 Q==;
X-CSE-ConnectionGUID: H0ZGD5V4SeqrMksUC+0avQ==
X-CSE-MsgGUID: u0roIJFXQ5WmY1ECETbSeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100135104"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="100135104"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 14:52:07 -0700
X-CSE-ConnectionGUID: ExIwLBw0QpWrTig0MHxG4w==
X-CSE-MsgGUID: lEREjArxT/OLC7AGjsPErw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="275528488"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 14:52:06 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 14:52:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 14:52:06 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.66) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 14:52:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wUMFwdFo0pjebuxJhHhAB9KB4bXU7DeZE8ereahlSULDxy2bc8MocebxFjLPUtuz8nbqO8lO4tB0pKQO8Sm7Ntihtl7jnb/FR6xkYXA5aGvzuqs9rNQEjozgpsHEdW8YfVvIxMKgJroSiEoXF6cEzCaji7p9ZOeoymmDmzeXlrhFuSEYU36EWXDoAQ46bWenSyPiCwdvJ4cK+yBrhrk+u/YrUVx7wXlRzdD4Mwz1tBBsmPoG4bTCl33tMXqT36HsdJivEIoUZlZCm4g9DlE1dwFL0zh2IN6Gv5uTqSfB0oq2SyL7um0qRFdH3zr2VbHzaG/MbXpN7hVdw6GzankJqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SwiekuoPyp4IAdK6bMracki2xTeQbgGiOqYgq5Y4G4k=;
 b=ftb3YxejMWVr19BfpKbnag/MDp+60vHUFMs0t3JAcnsgwJfKYvDwy0JCJiXXXX2SdO4HBA2obYKePlLp581KzC4d5T1gf7sDwsNzq70baQUrqO9bzS3blGCKpcS5yGHceGXDf93qMLI4CfO/PEpvj9BInxMpW580r0oXSpudaql/VbopA70SkkE3bwAH8ysP1gfKiFIau27UrXNDnYh7FIlEGnikj+hbrdHGqoLbP0QbVm/mYKY2irX6qvgEl+esXBqBWiACfwC5BN0yKRGZiocsvT/VMX7FF4tXzyOQyWCQar4OMkLNOO2xjWSfjHdAgXOiP5mF8Ha6s8ZnElq9zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by DM4PR11MB6144.namprd11.prod.outlook.com (2603:10b6:8:af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.14; Thu, 10 Sep
 2026 21:52:03 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 21:52:03 +0000
Date: Thu, 10 Sep 2026 17:51:57 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <umesh.nerlige.ramappa@intel.com>,
 <badal.nilawar@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v5 1/3] drm/xe/sysctrl: Add sysctrl debugfs
 infrastructure and loopback test interface
Message-ID: <aqMmfXAvPQUYmNp9@intel.com>
References: <20260910175619.3176089-5-anoop.c.vijay@intel.com>
 <20260910175619.3176089-6-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260910175619.3176089-6-anoop.c.vijay@intel.com>
X-ClientProxiedBy: BY5PR04CA0009.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::19) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|DM4PR11MB6144:EE_
X-MS-Office365-Filtering-Correlation-Id: f3f368e3-2ff4-4c16-acba-08df0f85bf8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|10067099003|3023799007|56012099006|22082099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: 0ue0z3XaJPWtRXhrJJwWBwmaNkhyxITBKR5+99r/j2mqmnaPWpMQWZTlTrKpHHZIrilXgpAWYozeQxnipz3SHEFURo5h5P+CBgLeJJR0THJZuMlm+7pwbb24PAenvOH6UO44iKOjIxLYmggqxKHBjZeb9wmKtcKkjuxwTfFwwrKfhwLA6EcNj/ZYeaQiFbQDfTTl06e2BmB7QumYw9SEwmwCa2mcd9P3HMOr7mCIIlmkLVg6bfI9MXwK6u6peq/9Wf5t5JNruhBHGiK/XElZQ3VDDUSo1S2OF+Q0be051CLXY5IwBqkElu3uF7RG0gm4j2MIyn9Y400SkXjjUhbtHlGl8rjQVFw0ceBUQrNzMXaZgbg59BGPK0W38O2JNq0eSnIkUjLoCnkgpUNTCM+llqQ4kme61/K5J8ccr7SQ33pdQZMAPOaimFozTgfjA4oK1SVGXW61cqU1n4cuxTcL+cQsY09flst5cyn0IFKgknalAuz+50plhiB1lNr08QFBMmW6J05JTJasyLJ2U2jEW83u22kWXlsj9fFx7/IE6IeJbjcDu1hvLT8jSgdNPLqQjbGvTSWgzUXs+t9F7vKsuOBPcSPD44bfzSM8A/0TOqHEnlFbiDgtOcuLohyJIh2VqCrj1e0kxHNZSFDpV7lGsCUvbEmX2qbPsXL6Iy4GCy0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(3023799007)(56012099006)(22082099003)(18002099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?aWwCnPQ6wZWAOMLYt7ERepZGxFlNA8mOX4+Ahea0TuCd0MKzZTWEGar1Kz?=
 =?iso-8859-1?Q?U7/ZV8nGvyA+YNSjDj+ymuD61/iP0bAMOFpl1fQDwhj3eTM2w1fhO92G4/?=
 =?iso-8859-1?Q?fIJvqfMoQnS0mgDpIzM6ewSsqRbSDi0TXCV0SO3tFnXai/LHz0BJMuF3hh?=
 =?iso-8859-1?Q?tuww8Aq9JnNRAypgAsHn6RjtU44RDQmRzBjzsViQIhMi62Rmmh4S3ZPji1?=
 =?iso-8859-1?Q?MCflvFw9/8tH43J3Q45eSh+50FhWxpg/PEahACoWkfS+trYB9w3hP3UEgk?=
 =?iso-8859-1?Q?LpqpgxkQtQRbSK0RFS3kMz0r+BkSdbU5zs0X6ga+8ogpmJ3X91yxwtWVCi?=
 =?iso-8859-1?Q?uKI9g1c70T5TyUl+SWtEK5vR8AX5vI+nBlV0qMcghYoOlih6azrXfvWjWS?=
 =?iso-8859-1?Q?zJRXAOwz198XiGLNIKUHKvtAVlJgwpaz/6nD1y6Va9HwoxVVRnJnjM6WBd?=
 =?iso-8859-1?Q?zn2UbcJJEBIKcaLRWRY1APKK8Xisnkiq8Y3mj5gNbuLB8gXRMzEaDsr1hh?=
 =?iso-8859-1?Q?hWO7XJN8jP9JOdzZVX8QAHGfwtnia9Ckj8Hv7bWpfofcC22/+HKGnqXCv9?=
 =?iso-8859-1?Q?SytDl4a3rjT1VUycilf1n6nclcefQlUTVv84uHdhWXNwUwFE4/WbKOd5/C?=
 =?iso-8859-1?Q?0oSwu1MAvz0YgxYNbxrvG2L0tpCd6niQl0F9mi9rmgGVPxGK1dWyU5otrz?=
 =?iso-8859-1?Q?YEd5MugTY8snxRs8HP/TtywlQ4n1EDq9EasP8noBSsVR4HtOl+e7Z5elc+?=
 =?iso-8859-1?Q?8zvqBz+Z2yiANY3OuF5zoOXSURAdco63Lz8emZFmqvalUQoU2OdvYaMfUo?=
 =?iso-8859-1?Q?8+xXcKAtY4pQqqAWR7Rbw2DaAYpIr/MqLI1Fx4+n/bm13/fc5eKnBcGp+E?=
 =?iso-8859-1?Q?Qh8h6H1k0p/Eckw2Z8kKaIwR5NX0QpWsvQdPcLU7BvsJ+5sEoOnSoAT475?=
 =?iso-8859-1?Q?z5eQtFULihttnQv2KavWcgAokNLuZd1clJC5YuSQhjpi3vDZglUU9864D8?=
 =?iso-8859-1?Q?ipUa69ObXdcB7SFEaCsS8wNHd53uhC57sbRvTyHLMbQYAfbgA2yOCSVdOo?=
 =?iso-8859-1?Q?lrJ2hLwzkn14vBPqlE9l6psEPS9YewkfbLv1sbTacgITSIFwoH9J3U7u8G?=
 =?iso-8859-1?Q?TkMIx3fK5iXZxQaMA/7xESybDQLFuW0d+pNfZyJwG5Hlcb8VB7649+iUpm?=
 =?iso-8859-1?Q?jwNtS+/JVSp1j2yFQ8VXoVCy23ZeFBM99icxIwe9vj7sF4itsghFwvnpBr?=
 =?iso-8859-1?Q?nyo8K3vygC2R4YqoCzkAYPvE28vRtFiSs2nBmgg2XYijSBgOtxJ25MDbRt?=
 =?iso-8859-1?Q?YxMFRSbGxFLG74lH2HDarFBEa9S7I4/TWCvzLLO2FY9Eptyq+VARPBtgS+?=
 =?iso-8859-1?Q?69vuds+Zrf/J0NQhOanlif+OO7HwLWVciGuSkILQSqratAT8/uLp4Az8xg?=
 =?iso-8859-1?Q?7Rcpmvj0vPd4SvuPdmMD1sFZjnP8Rm65QWzFiibk1UWgoX+1nS1+6dPp6t?=
 =?iso-8859-1?Q?RPRvTpir6DpqvpsyaAeKsFBttrnKQHVF2Sb93nc2cYdZGnNb/oHmcv0iEw?=
 =?iso-8859-1?Q?tEfkH+ncRVlDIn9Z9VX8MZTb/xS0V2hkKZtF5eO6XW16dy8My3IE2/IGTZ?=
 =?iso-8859-1?Q?f152jSoTmQT1Fpbr5MXY843P5shngdYiMIvCsZONcfqesHUzcUI2YOWuy6?=
 =?iso-8859-1?Q?ECFBWMcNRQcRJVAEeo3GkSUxwf8VaQj945Hb0Xqbq2eM6TVPwhD4RrC453?=
 =?iso-8859-1?Q?01NGQRIQSbVxcx8nPb1XWo8AXhcI/zSb2m46iA8dQ9w5O65tEbEKqfqdLN?=
 =?iso-8859-1?Q?9pf0ycG13Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: Tm6AstgFjGPWNnp1MrMczk3Kqc/zkN168e1SNAxYuynmW+drXp0gC8TB//0JmUMXl5rjZwE+bEkUGk3aj4BhAXU7lEvKX2Q5AWBUqoQZrkuz/sUQC/puviws/YPF08aPKFKNnJ2CMU+gCvw4eZ+A2mnBfLO+Vsy/9Nn2M1chWNc+J0DXpSEU4Ys9xOaxkkhQmjgihRcI4HJCciD6oiQhQ4y2DoPAQ04x4NctF/Tt2KBJYvnq/0pjShexJqtoCEOuRzHEUw9odzuU/UDrVQo7tp2qdl105sFUz/P6KbYn9XBQXkGqSaA7Bley8JFjYtbnoF/n13jm0iXJo5hodmZN2w==
X-MS-Exchange-CrossTenant-Network-Message-Id: f3f368e3-2ff4-4c16-acba-08df0f85bf8a
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 21:52:03.1574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/VW4kiCuRNgSjIBYI+2+7ptdXtY3RX9LUkqMQjsl7MClnjG35h2CIJg+l8u/Da0kY1uu1kKqL9BhAr4EuG7Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6144
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

On Thu, Sep 10, 2026 at 10:56:20AM -0700, Anoop, Vijay wrote:
> From: Anoop Vijay <anoop.c.vijay@intel.com>
> 
> Add debugfs support for exercising System Controller mailbox
> interface from userspace. This adds the "sc/" debugfs root
> directory and a "loopback" entry that sends an arbitrary byte
> payload to the Core group's inverted-loopback command (group=0xFF,
> cmd=0x03) and reports the response:
> 
>   echo "0x11 0x22 0x33 0x44" > /sys/kernel/debug/dri/0/sc/loopback
>   cat /sys/kernel/debug/dri/0/sc/loopback
> 
> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> ---
> v5:
> - Add per-entry locking for debugfs accesses
> - Drop unused xe_device.h include
> 
> v4 (Rodrigo):
> - Squashed debugfs infrastructure and loopback support into a single commit
> ---
>  drivers/gpu/drm/xe/Makefile                   |   1 +
>  drivers/gpu/drm/xe/xe_debugfs.c               |   5 +
>  drivers/gpu/drm/xe/xe_sysctrl_debugfs.c       | 167 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sysctrl_debugfs.h       |  14 ++
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
>  drivers/gpu/drm/xe/xe_sysctrl_types.h         |  38 ++++
>  6 files changed, 227 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_debugfs.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 67b8b5477639..3484e9a523d1 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -128,6 +128,7 @@ xe-y += xe_bb.o \
>  	xe_survivability_mode.o \
>  	xe_sync.o \
>  	xe_sysctrl.o \
> +	xe_sysctrl_debugfs.o \
>  	xe_sysctrl_event.o \
>  	xe_sysctrl_mailbox.o \
>  	xe_tile.o \
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 80f62634fae5..7c6af4f7a3fa 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -31,6 +31,8 @@
>  #include "xe_sriov_pf_debugfs.h"
>  #include "xe_sriov_vf.h"
>  #include "xe_step.h"
> +#include "xe_sysctrl.h"
> +#include "xe_sysctrl_debugfs.h"
>  #include "xe_tile_debugfs.h"
>  #include "xe_ttm_vram_mgr.h"
>  #include "xe_vsec.h"
> @@ -836,6 +838,9 @@ void xe_debugfs_register(struct xe_device *xe)
>  
>  	xe_fault_inject_debugfs_register(xe, root);
>  
> +	if (xe->info.has_sysctrl)
> +		xe_sysctrl_debugfs_register(&xe->sc, root);
> +
>  	if (IS_SRIOV_PF(xe))
>  		xe_sriov_pf_debugfs_register(xe, root);
>  	else if (IS_SRIOV_VF(xe))
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
> new file mode 100644
> index 000000000000..c0454c4c0ae0
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
> @@ -0,0 +1,167 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <linux/cleanup.h>
> +#include <linux/debugfs.h>
> +#include <linux/err.h>
> +#include <linux/kstrtox.h>
> +#include <linux/seq_file.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/uaccess.h>
> +
> +#include "xe_pm.h"
> +#include "xe_printk.h"
> +#include "xe_sysctrl.h"
> +#include "xe_sysctrl_debugfs.h"
> +#include "xe_sysctrl_mailbox.h"
> +#include "xe_sysctrl_mailbox_types.h"
> +#include "xe_sysctrl_types.h"
> +
> +static ssize_t xe_sysctrl_loopback_write(struct file *file, const char __user *ubuf,
> +					 size_t len, loff_t *offp)
> +{
> +	char *kbuf __free(kfree) = NULL;
> +	u8 *input __free(kfree) = NULL;
> +	struct seq_file *m = file->private_data;
> +	struct xe_sysctrl_debugfs_entry *entry = m->private;
> +	struct xe_device *xe = sc_to_xe(entry->sc);
> +	struct xe_sysctrl_mailbox_command cmd = {};
> +	char *token, *tmp;
> +	unsigned long val;
> +	size_t input_len = 0;
> +	size_t max_input;
> +	size_t out_len = 0;
> +	int status;
> +

probably worth adding here:

        if (*pos)
                 return -ESPIPE;

> +	if (len == 0 || len >= PAGE_SIZE)
> +		return -EINVAL;
> +
> +	kbuf = kmalloc(len + 1, GFP_KERNEL);
> +	if (!kbuf)
> +		return -ENOMEM;
> +
> +	max_input = min_t(size_t, len, XE_SYSCTRL_MB_MAX_MESSAGE_SIZE);

don't you need to consider the header as well here?
Or it might pass here and fail in sysctrl_prepare_command()

no?!

> +	input = kmalloc(max_input, GFP_KERNEL);
> +	if (!input)
> +		return -ENOMEM;
> +
> +	if (copy_from_user(kbuf, ubuf, len))
> +		return -EFAULT;
> +	kbuf[len] = '\0';
> +
> +	tmp = kbuf;
> +	while ((token = strsep(&tmp, " \t\n")) != NULL) {
> +		if (*token == '\0')
> +			continue;
> +
> +		if (input_len >= max_input) {
> +			xe_err(xe, "sysctrl: loopback payload too large (max %d bytes)\n",
> +			       XE_SYSCTRL_MB_MAX_MESSAGE_SIZE);
> +			return -EINVAL;
> +		}
> +
> +		if (kstrtoul(token, 0, &val) || val > 0xFF) {
> +			xe_err(xe, "sysctrl: invalid loopback token '%s'\n", token);
> +			return -EINVAL;
> +		}
> +
> +		input[input_len++] = (u8)val;
> +	}
> +
> +	if (input_len == 0) {
> +		xe_err(xe, "sysctrl: no loopback payload given\n");
> +		return -EINVAL;
> +	}
> +
> +	xe_sysctrl_create_command(&cmd, entry->group, entry->command,
> +				  input, input_len, entry->response_buf, input_len);
> +
> +	scoped_guard(mutex, &entry->lock) {
> +		guard(xe_pm_runtime)(xe);
> +		entry->status = xe_sysctrl_send_command(entry->sc, &cmd, &out_len);
> +		entry->response_len = entry->status ? 0 : out_len;
> +		status = entry->status;
> +	}
> +
> +	return status ? status : len;
> +}
> +
> +static int xe_sysctrl_loopback_show(struct seq_file *m, void *data)
> +{
> +	struct xe_sysctrl_debugfs_entry *entry = m->private;
> +	size_t i;
> +
> +	guard(mutex)(&entry->lock);
> +
> +	seq_printf(m, "Command: group=0x%02x cmd=0x%02x\n", entry->group, entry->command);
> +	seq_printf(m, "Status: %d (%s)\n", entry->status, entry->status ? "FAILED" : "SUCCESS");
> +	seq_printf(m, "Response: %zu bytes\n", entry->response_len);
> +
> +	if (entry->response_len) {
> +		seq_puts(m, "Response data:\n");
> +		for (i = 0; i < entry->response_len; i++) {
> +			if (i && (i % 16) == 0)
> +				seq_putc(m, '\n');
> +			seq_printf(m, "%02x ", entry->response_buf[i]);
> +		}
> +		seq_putc(m, '\n');
> +	}
> +
> +	return 0;
> +}
> +
> +static int xe_sysctrl_loopback_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, xe_sysctrl_loopback_show, inode->i_private);
> +}
> +
> +static const struct file_operations xe_sysctrl_loopback_fops = {
> +	.owner = THIS_MODULE,
> +	.open = xe_sysctrl_loopback_open,
> +	.read = seq_read,
> +	.write = xe_sysctrl_loopback_write,
> +	.llseek = seq_lseek,
> +	.release = single_release,
> +};
> +
> +static void xe_sysctrl_register_entry(struct dentry *root, struct xe_sysctrl_debugfs_entry *entry,
> +				      struct xe_sysctrl *sc, const char *name,
> +				      u8 group, u8 command,
> +				      const struct file_operations *fops)
> +{
> +	struct xe_device *xe = sc_to_xe(sc);
> +
> +	if (devm_mutex_init(xe->drm.dev, &entry->lock))
> +		return;

should we propagate the error up or at least warn here?

> +
> +	entry->sc = sc;
> +	entry->group = group;
> +	entry->command = command;
> +	entry->response_len = 0;
> +	entry->status = 0;
> +
> +	debugfs_create_file(name, 0644, root, entry, fops);
> +}
> +
> +/**
> + * xe_sysctrl_debugfs_register - Register debugfs entries for System Controller
> + * @sc: xe_sysctrl instance
> + * @parent: parent debugfs directory
> + */
> +void xe_sysctrl_debugfs_register(struct xe_sysctrl *sc, struct dentry *parent)
> +{
> +	struct dentry *root;
> +
> +	root = debugfs_create_dir("sc", parent);
> +	if (IS_ERR(root))
> +		return;
> +
> +	sc->debugfs.root = root;
> +
> +	xe_sysctrl_register_entry(root, &sc->debugfs.loopback, sc, "loopback",
> +				  XE_SYSCTRL_GROUP_CORE, XE_SYSCTRL_CMD_LOOPBACK,
> +				  &xe_sysctrl_loopback_fops);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.h b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.h
> new file mode 100644
> index 000000000000..d1414ac3562e
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_SYSCTRL_DEBUGFS_H_
> +#define _XE_SYSCTRL_DEBUGFS_H_
> +
> +struct dentry;
> +struct xe_sysctrl;
> +
> +void xe_sysctrl_debugfs_register(struct xe_sysctrl *sc, struct dentry *parent);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index c236e5377f30..501a4a4c16ff 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -47,9 +47,11 @@ enum xe_sysctrl_gfsp_cmd {
>  /**
>   * enum xe_sysctrl_core_cmd - Commands supported by Core group
>   *
> + * @XE_SYSCTRL_CMD_LOOPBACK: Loopback test command
>   * @XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID: Retrieve application status by ID
>   */
>  enum xe_sysctrl_core_cmd {
> +	XE_SYSCTRL_CMD_LOOPBACK				= 0x03,
>  	XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID		= 0x05,
>  };
>  
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> index 98c2f473f7c6..9ad3c40de97a 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> @@ -10,7 +10,36 @@
>  #include <linux/types.h>
>  #include <linux/workqueue_types.h>
>  
> +#include "xe_sysctrl_mailbox_types.h"
> +
>  struct xe_mmio;
> +struct dentry;
> +
> +/**
> + * struct xe_sysctrl_debugfs_entry - Debugfs entry for a raw mailbox test command
> + */
> +struct xe_sysctrl_debugfs_entry {
> +	/** @sc: Back pointer to parent sysctrl instance */
> +	struct xe_sysctrl *sc;
> +
> +	/** @group: Command group ID */
> +	u8 group;
> +
> +	/** @command: Command ID within group */
> +	u8 command;
> +
> +	/** @lock: Protects @status, @response_len and @response_buf below */
> +	struct mutex lock;
> +
> +	/** @response_buf: Response data buffer, sized to the maximum mailbox message */
> +	u8 response_buf[XE_SYSCTRL_MB_MAX_MESSAGE_SIZE];
> +
> +	/** @response_len: Actual response length from firmware */
> +	size_t response_len;
> +
> +	/** @status: Last command result */
> +	int status;
> +};
>  
>  /**
>   * struct xe_sysctrl - System Controller driver context
> @@ -31,6 +60,15 @@ struct xe_sysctrl {
>  
>  	/** @event_lock: Mutex protecting pending events */
>  	struct mutex event_lock;
> +
> +	/** @debugfs: Debugfs entries */
> +	struct {
> +		/** @debugfs.root: Root debugfs directory */
> +		struct dentry *root;
> +
> +		/** @debugfs.loopback: Loopback test entry */
> +		struct xe_sysctrl_debugfs_entry loopback;
> +	} debugfs;
>  };
>  
>  #endif
> -- 
> 2.43.0
> 
