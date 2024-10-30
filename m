Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C03E4D5CCAA
	for <intel-xe@archiver.kernel.org>; Wed, 30 Oct 2024 13:31:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6838010E7AD;
	Wed, 30 Oct 2024 13:31:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CpCCfJbz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A954E10E7AD
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Oct 2024 13:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730295073; x=1761831073;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zuG/ZweEpjq+SE4Knn916JdYLxZHfEyA49EKdKgJwdk=;
 b=CpCCfJbz0CLKZISnTS9uTM6Ro1BuwsO5LDaIKr3aYq2dLDXRGB4hW4D2
 0dFRkSIL5ibKR60a8brYbhRbdsh3CiO21vIHMmCwe6CK1/FtcecoAZqPg
 MLFR8hhuRFk1y+l9N6onyTNzU78QzB0JfIX8y74qaKlGk3+HlyY5Cr1U4
 C9Rc4FnPj9AhbC4uiEPWiYGGh1qIYIWljGuxTMQvCzl8zWhVMyTYFhlGF
 yGpyqPd4BsKTnTElhrQdsEVFKzbuZH0JGBFhqAQdKcGYIC7AdjugOeFYs
 sNG3oNLDqjFKy3aUBAXX2QbVpp7RhemOljWKKIr22PvqRqPzZoySAD61h Q==;
X-CSE-ConnectionGUID: oAf2SnJAS06Tr0wOe7tSbA==
X-CSE-MsgGUID: 6XSNjXjyTvuXCLSwy9KXpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30143607"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30143607"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 06:31:12 -0700
X-CSE-ConnectionGUID: xvKQqTEXT52RwSjFhTdEoA==
X-CSE-MsgGUID: BEAWvlQ0Rwe5lFG5yn/npw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; d="scan'208";a="86922771"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Oct 2024 06:30:58 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 30 Oct 2024 06:30:57 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 30 Oct 2024 06:30:57 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 30 Oct 2024 06:30:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DknQxjw5CoZ798Z010xvrAaOALgtGHI66xCmu/3Jhe6pQLENA5LIu8IIpih9Hv/3+2oxdSEwbohUCwNDZmWlcH4kd99iqCoJey1SbHpmjwiZ8e3GWWXDwT/eyPkLxou51hYYfF5OZcW1O6usJTvNvjprq5i9q/stuIfsQNJzRI6DMpZOQ6Pw7aUrQxp8/kUN9XFP3S7rYn+5/CCMqqI2EyzoPFZH9f/ILFnIXppU1xh001LV+HO+QPVzN/ODL1jtKXj8Xv7Miw+Ug6BZotlRyGnY781o18Mf9ZpgmnfBoLH0JhU6Lf0rzzNOMfcijyVJci+guT0Qp42fmviRnR9UHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdHeoIHaS8nI7v3TLSLdHrXphlzTZ7LvJLEvkZtItuM=;
 b=Tc4fStRoYWRBcLUan9UCX/GPuSxl4F8FdKGGcAgtbaq9r5SITMuMtbfHKSVEtJc/K9MAsHFudB8YaopjC3D5DmpC2Dxaw2Sb40aapy2N626ntT6WC8Ez1nmiAyYuSmQuPbLX+q9bvV25x6l0PfzV2m1Sh67yfPYN5PgaQBGoTh5NTcVEBfNbvhebYhyWV9rbuQtmzLLtobRsagfcH9i9TSgNDgEvkV6LQnXR21vugAPvtYR8pQzvrOkJuqpiPp3+GsCz/TaSImgg5MHVVX8YdI/rzp4fw27f2SHKZBmtNZJar8oJwUNasGMp0lJqSp9kZMg+sCMFLO5bwAevogEchA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Wed, 30 Oct
 2024 13:30:51 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8093.024; Wed, 30 Oct 2024
 13:30:51 +0000
Date: Wed, 30 Oct 2024 08:30:43 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v2 4/4] drm/xe: Wait on killed exec queues
Message-ID: <rxxmxcl26blbbisnr3samefvo6jayx36rmwt4jzkuyk2kzioip@6fyeruiork6m>
References: <20241029214351.776293-1-lucas.demarchi@intel.com>
 <20241029214351.776293-5-lucas.demarchi@intel.com>
 <b4b37380-caee-4a46-bedd-78f32f622698@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <b4b37380-caee-4a46-bedd-78f32f622698@intel.com>
X-ClientProxiedBy: MW4PR04CA0250.namprd04.prod.outlook.com
 (2603:10b6:303:88::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB6909:EE_
X-MS-Office365-Filtering-Correlation-Id: 26bc354a-f6fb-487a-7ff2-08dcf8e71271
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AiKC210P7AD8ZdIczRP4Eeqo0ejpsPz0WtISTN/qykRv4XUzTVqdbIivEj34?=
 =?us-ascii?Q?ReCr4N1cTDXLRkMoFi1ZJ9jDB+Ulg/caU3H9djpKAz10yBrxtRVzA5cTvYv7?=
 =?us-ascii?Q?mu6gZ40Ay0UNhJ4EofK0MEfVK03OesNKNzr9206z5nJx+f35G/JOkmoLXYel?=
 =?us-ascii?Q?/4iMMkphHDRn956Xpl38JKpY9I8OpOAxayPfNeSaEganrJGz11De7xT4KYu2?=
 =?us-ascii?Q?IvpAl0L3GKE5G+fzdhArnQFWYjewACs3CTeG4hvjWNGKe1vMHnTZ5XOeyJMD?=
 =?us-ascii?Q?UFdnlZq1rdouJhMh64yPqb5Sy7Cjm3cEpS76TmqSKhlbFXZ5crFBzqtkc/h4?=
 =?us-ascii?Q?bbfgOQBBN9YDMn3qO8j0RFA+XxOvqDq5nDg2TNb4G20qGKaA9oXnP7d+GwsO?=
 =?us-ascii?Q?wcWitONH+oyd31AuuQhAupRJBZDnccet9J2PsjJaxViAej8/ltxO2gpb1G5o?=
 =?us-ascii?Q?HmUGvxqMVSGOaxFcgwGdfGgRoQ57G5x9xKOT1lwpj0x/TbH7kKZHrFh8ZzJY?=
 =?us-ascii?Q?2YsG1kGciZJ0P3cdySceIlxbmyNH5Q5MesFnNoMzEIGUvKa0+9Xpq3w0PYBE?=
 =?us-ascii?Q?Prk4U3uK60puMrBo7X7RqalJ2wVB/RxJB+b7mr6hYsMKlsamyRgUHVjy5Gxg?=
 =?us-ascii?Q?KomKm1e82JAr75QyiqYszegxp9We0etcy4yol2oPlXWMhSPlG0KOpKY6cnD4?=
 =?us-ascii?Q?8ww3J8K4vpF6mfCqYkitNXo77o18UXLzOaRLNFxG18zZIwgiiFAr6cWByX0S?=
 =?us-ascii?Q?ES0hjaMZRGqXDC1iEQwlKj5b2RCcBWue6aVfkjxKrQ/Ju/5j9MbIodbCZ0vR?=
 =?us-ascii?Q?c2LzveCh5pTB/YGiL+7MFQS59f3GiB0bmAGQUQDmNBV5/mpWttiHVqHp84Mc?=
 =?us-ascii?Q?PvcESJ+bcJPKzKW4YGABmdJhh1x9Z/g3sKoK52NhSY1xOBcJHMCNySvnUgrg?=
 =?us-ascii?Q?7mC2P//RSy8B1D4sX039uNPRM+c41qx7RnQqV7m2qkBLHYMAMyGxiSp0JtzN?=
 =?us-ascii?Q?93VdMX5ApJhLB2+KvaItG60Jnap5TpIaZre2EGguYcfoFBiMNfrgz6vhlHWh?=
 =?us-ascii?Q?u76Qpl7SKhTTpgnZShfZua19BrPyrHGg3pFCdKh6+Tzl2Txvk2GDDsYydWH6?=
 =?us-ascii?Q?VxVnXxxCAwv8d0wDsLhPls8XvTCKE8fuJIxwEehY66cl6Ul9mcCy4cwJV0mr?=
 =?us-ascii?Q?Dhq0ljDICWsvD8qI6dw1sYfyLJdnET81lZkxIdg1fUuUFqvy/T1XQLNE0R5s?=
 =?us-ascii?Q?cjbreynYhGqxit6hErr8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CN4JrpjEijTABFdmQuyYSA1LhVHhfSpfEdAkTxGBWneohvuj7KexG8AvOiwy?=
 =?us-ascii?Q?zn/p0pKNiUpwe1nmZJnFl1dzwntMMY5ttcWni3pAi6dvxARC1VbxxxVgQtb3?=
 =?us-ascii?Q?m20tyLRDH0rKxzBQGirX3cGDImfNh8lWmfvfmf9RRyES0a3+fJvAgfKXo0KX?=
 =?us-ascii?Q?sPQx88GPxPGY5Mfbj7F1gobckMQVtEutMrqc35GHQSH9WZVMfsVDBCoBAGW5?=
 =?us-ascii?Q?PMoXh0o+ukvpOr/RiMRbUF/J9RALx5O4mOtQx4i4Tzn8fJE118bBTgcyehoX?=
 =?us-ascii?Q?3gnjqw0X2umvZoTpgSdEFstOw8CnLM7Idcyjw/gIxWt0yQ5Yeiy/3N01VDZ8?=
 =?us-ascii?Q?AAFgxP+M0Riih+5qmR/Ud7JPyQqSpvyyTgKRRrKLQ70OfPWIzjTjI88Z+EP/?=
 =?us-ascii?Q?Q6Ri3GjE557Kk8qa/PZQDhFwhvo9rslGIBs+u7mLb+B0Esviuaj1OvgC0N1i?=
 =?us-ascii?Q?arVpM5FnK/iHtDucl6DRilE6DuSigHznkL2Sek4s0nBUTBJ8kGHV88qfsCuq?=
 =?us-ascii?Q?wnHlOkVM2m3HYdA/5XzPRMVyl6pl9xoDWpzL8hPN4vMH5deIJdEy9TWeaRq+?=
 =?us-ascii?Q?HqaP2c0xDaxt6hBUMu8E9KvAr4FdTaGV8DPc5RYqEkjaOWiuLPHVXMtHslmg?=
 =?us-ascii?Q?5L3VdijHaKy5hIMIkOE5lPIErFahdzwdH18HT4zgEw1XaURENMf2Md2dlpHH?=
 =?us-ascii?Q?qw1JA1I0COI/tmkH9T1078nkjpbuSS5C2tFDyABAelYWIGSUwSoafq1JD57U?=
 =?us-ascii?Q?TSp4FbAc7YR9pP44jr+tWQSTp879KwGZcocv/liFTnOdAb7WnF9ksoxO0DWg?=
 =?us-ascii?Q?4x69P0kKGKgFXuwdJYASc6HD0ruN8M3xhMQUXWZDtpLaAyMUvw0cBYto1Y4m?=
 =?us-ascii?Q?g9yVyYdgSZMs/FL78GKQ4d6n8fI95k10ISYh9pl2nJnNHzQNMuTG0w6hccSU?=
 =?us-ascii?Q?SSZh0fCpa+vFJJB34wPBCxVV+vzHud6w+vSU0Q7QYHBms78oo9B9g8ohqvsp?=
 =?us-ascii?Q?wjL6A+CKMD7d4ie64QF4FsI9WsveWpgGbl3tzIwiJOtqBbMWTiUigRGz1BwC?=
 =?us-ascii?Q?nbuqK1O1P22TCxZqN+h5DH60VdUArx8I0Qb0CxJgoCCWTvaQBElI0MLcbjG8?=
 =?us-ascii?Q?GOt6lBRsizunh+rsUqta2MxsJEh27uppnKe3zv5RlMVon0G2k8mTuvaPtY3F?=
 =?us-ascii?Q?jwTle7N+q32jtgYlKArVoS7Y5lf6C3FPGIFqnWE6WYdeeP7tT44FctAdGS/Z?=
 =?us-ascii?Q?dADWocM3ojlu8Z/KTc+jTICzpBxc3mN1H3edDUZwXm0LEn5VF3paVLnZWsT3?=
 =?us-ascii?Q?dXkFFD+NMidwnM7Dg1pPSKovCsa37u80p3aDK1mCO0iD8W19G63qzst0hemR?=
 =?us-ascii?Q?UDM1K6yFoPcyR45HM2tNqy1Ob9BnRzUWEUOEet/FOOy8+V1xpQMGpRU0CK15?=
 =?us-ascii?Q?wET60/k1H/vuRmMVCZIWVY/lZiKgO+JQ1P6lRZgCAxUJJNukkcoDb3jKOW/3?=
 =?us-ascii?Q?q+3M+6Zkt7sZ65TR4Wp7NWHyBf+tYvERJQAYgkxhQxdE4t72HYsINvvJavFJ?=
 =?us-ascii?Q?xaveXNl2qhdW0+AQsDQBqQg2w7JNZvagEtDOsUre8fC+x/fDtNPE4XgLz+9K?=
 =?us-ascii?Q?pA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26bc354a-f6fb-487a-7ff2-08dcf8e71271
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 13:30:51.2503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5yaKvJC6MsI4AJfB1tMIqbVheGEB+o2+WjfF9reVRZUJp791sUN2FlQxhygqygBgRMh/aS+ZolrJ6rXS3mkMpEiqej6ID2Oo7BKn3sByHso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6909
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

On Wed, Oct 30, 2024 at 10:56:27AM +0000, Matthew Auld wrote:
>On 29/10/2024 21:43, Lucas De Marchi wrote:
>>When an exec queue is killed it triggers an async process of asking the
>>GuC to schedule the context out. The timestamp in the context image is
>>only updated when this process completes. In case a userspace process
>>kills an exec and tries to read the timestamp, it may not get an updated
>>runtime.
>>
>>Add synchronization between the process reading the fdinfo and the exec
>>queue being killed. After reading all the timestamps, wait on exec
>>queues in the process of being killed. When that wait is over,
>>xe_exec_queue_fini() was already called and updated the timestamps.
>>
>>Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2667
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>  drivers/gpu/drm/xe/xe_device_types.h | 5 +++++
>>  drivers/gpu/drm/xe/xe_drm_client.c   | 7 +++++++
>>  drivers/gpu/drm/xe/xe_exec_queue.c   | 4 ++++
>>  3 files changed, 16 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>index ef7412d653d2e..b949376ca388a 100644
>>--- a/drivers/gpu/drm/xe/xe_device_types.h
>>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>>@@ -614,6 +614,11 @@ struct xe_file {
>>  		 * which does things while being held.
>>  		 */
>>  		struct mutex lock;
>>+		/**
>>+		 * @exec_queue.pending_removal: items pending to be removed to
>>+		 * synchronize GPU state update with ongoing query.
>>+		 */
>>+		atomic_t pending_removal;
>>  	} exec_queue;
>>  	/** @run_ticks: hw engine class run time in ticks for this drm client */
>>diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>>index 22f0f1a6dfd55..24a0a7377abf2 100644
>>--- a/drivers/gpu/drm/xe/xe_drm_client.c
>>+++ b/drivers/gpu/drm/xe/xe_drm_client.c
>>@@ -317,6 +317,13 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>>  		break;
>>  	}
>>+	/*
>>+	 * Wait for any exec queue going away: their cycles will get updated on
>>+	 * context switch out, so wait for that to happen
>>+	 */
>>+	wait_var_event(&xef->exec_queue.pending_removal,
>>+		       !atomic_read(&xef->exec_queue.pending_removal));
>>+
>>  	xe_pm_runtime_put(xe);
>>  	if (unlikely(!hwe))
>>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>>index fd0f3b3c9101d..58dd35beb15ad 100644
>>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>>@@ -262,8 +262,11 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
>>  	/*
>>  	 * Before releasing our ref to lrc and xef, accumulate our run ticks
>>+	 * and wakeup any waiters.
>>  	 */
>>  	xe_exec_queue_update_run_ticks(q);
>>+	if (q->xef && atomic_dec_and_test(&q->xef->exec_queue.pending_removal))
>>+		wake_up_var(&q->xef->exec_queue.pending_removal);
>>  	for (i = 0; i < q->width; ++i)
>>  		xe_lrc_put(q->lrc[i]);
>>@@ -824,6 +827,7 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>>  	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>>  		return -EINVAL;
>>+	atomic_inc(&xef->exec_queue.pending_removal);
>
>Probably need to move this down, otherwise I think user can supply 
>bogus queue id or perhaps just accidentally supply an already 
>destroyed queue, to get many increments per queue which is then 
>unbalanced with the fini() and then show_run_ticks() gets stuck 
>waiting forever?

right, thanks for spotting it. This will need to be inside the mutex
then, because we need this to happen before releasing it for the fdinfo
read. Like this:

>
>>  	mutex_lock(&xef->exec_queue.lock);
>>  	q = xa_erase(&xef->exec_queue.xa, args->exec_queue_id);

	if (q)
		atomic_inc(&xef->exec_queue.pending_removal);

>>  	mutex_unlock(&xef->exec_queue.lock);

Lucas De Marchi
