Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2030CD1288
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 16:15:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8087A112C66;
	Wed,  3 Apr 2024 16:15:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ReGQzgUO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98276112C66
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Apr 2024 16:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712160916; x=1743696916;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Fh6e/MS8lR7UFXTphS6yKwgiiTjMj3EvNbSrf7azfFE=;
 b=ReGQzgUOtjKXmUcWO8PAl0jSo2YPli2afITC7rZHFa+qbH9u28a4BKKw
 ch/Ex1Ityi2wT+P9gDTE3s7Hnz/wpCQ0PNtEmZXdVWysiFjHKx1GZshN3
 AWr9U5dDjhf2Ho0i1KdyfUh1y4VwcH52i01eAMzA+tJ0cVJ7cbmGXJ3nW
 /2FhAgy0PbSLUbpoiL1TRtgewl2/psWEIEFXZVXD8QwfcIdGxm91SnaB9
 ytNdydnhZ20HMGQIAa6Ynm7joh7eJCMrykIab2mSuViFFezub39JNOmFD
 U4QpSnbCIoRHrxQZ9zzhDfvoHgUwaH5MqZGYfLPdgb07B7PWOANnpa36R Q==;
X-CSE-ConnectionGUID: djI+H55hQWWEnkRhKAtpVA==
X-CSE-MsgGUID: DwOJ2LRJSZqyoRMCgPU5eg==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7593971"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7593971"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 09:15:16 -0700
X-CSE-ConnectionGUID: mpE2srkZSbWzhgY64qq6XA==
X-CSE-MsgGUID: KeFp/CFnSAqJEsTDPc1ClQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18550597"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 09:15:16 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 09:15:15 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 09:15:15 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 09:15:15 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 09:15:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SGvcotjhOLn9mgX/f8o1x8LAxMINZ6l4ZljLfZQPMjbTQydjBVdaYh7T7b6hDw9EINm46mWSuxWbbxdzuZE244/fXbzknnI2OAf1JkrP6CSpmH2NCloOjFb4FdE4VltsDDl7kCYHiOAwJ4W90CI8akKkwL2DHEC1B7+mmVVb+b+2BgL5sIZCG8HAUyuwT0Y65u91ohS7bXmSGoGVuJXsElT5/VFq40Xuo6JmgRCLqzdcs/bAF/J5pQu2eEK5o98wq1MNPH5boWC8G55P8xxKvLRkfHaGWt/+qj1FR2e0ataEq6M76JbkGS6EJNpuyXbEcabK8Dn5dQKr1B05hf2wtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T8fcsEmBQ6Ta5eZ3eS83HW7V27ithFon7xKv7QleuoM=;
 b=gbPOCVXPEjCfbWBmlA69UQPSsgJK/jbLc3tv6MC84+j8oQBqZiVtN5eQB68RIGimAWPH/Y5vnMP2eSE1g/sQxAlMcZmlPVLpm3Ko3xlCh9ZnXvQK/XSzR9Pezpcq4bSU4RMlCqDr5E27tWD/nt7cgLCf56Fiv+X1febxPE9zlIe60lQHbznQCTtJWUbF9++t4VFTmxMa78hzpbif87xuloJZjoKZSjABf8gDgKaA9nKCNCJ11g6oSv8/JvqXoJwTLLUNCh8Qk7fxevVVzsKnTa4c3DWh+6HpD9sCgqDuYRXusFyDFtaPpa4wG0xlAilJw68D7cBIXmNDzKZhlBG53g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6054.namprd11.prod.outlook.com (2603:10b6:510:1d2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Wed, 3 Apr
 2024 16:15:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 16:15:08 +0000
Date: Wed, 3 Apr 2024 11:15:11 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Nirmoy Das <nirmoy.das@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/tile: Set default memory placement for BOs
Message-ID: <3ipwbawutbtzsed7vycppvg435o6czsvn6c234gdwqpj7245qz@2gwf66k62l5o>
References: <20240402215455.1839828-1-lucas.demarchi@intel.com>
 <20240402215455.1839828-2-lucas.demarchi@intel.com>
 <8e1632b4-658b-49fb-817f-99b889d0cea4@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e1632b4-658b-49fb-817f-99b889d0cea4@linux.intel.com>
X-ClientProxiedBy: BYAPR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6054:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XGqqQdszyXLzNMA5lKgRxpVHbYa+LGuixFQqYYEgUbEMsP57HvG2V4R0emhvL3FaUCfyPHAks41nHN4fjhM1NigNtDURtHjIUUn+xXxmDke0Sy35haArIj2AY3mEIMJ5eiD7K9T9Prv5kBCD0HdT99aw7rWyKg8ejJ5yJXqHx5Glr3TiXhWg3hyxn1LxmuvBKD0UZbAjRFkQa/T3bZml+L8a+U7YzVsCNuhI4Zbn/jHv1vf0kEvOL7MSaXcnhwFsVL9HB5cMLe+PbtVy4loK1KSnR2zoCUbCnJlu4f/wHIsPEityG1yQCH6oNJiHE7/dJzDhmRZn6tbOnqAJF5QwMRMLjqBq35eJqJ+a5x9usioutH3V3A+DCGVJ08k871Zk8DERudcch2b1r6hA0NSQ6sdcedG8IM2G2tiJ/qCTf92eelMlJsRUS3yaoT9e1B3V67LSupapM4RjIIdlBG95It/SeNApiH6elUKQp5jXGQtZj6Z+5J4ufyy8I4Sr9xu6heUGKPL8YIlUzPm/TkVKUmnLqBAvuz/aQthtO7XroAQLrRgCCekIXmdkHx4uT4umfVNZaZqMvlZHDyK0jghBOsHOniqPyz11NCynBx+hBPGx0YtqVs+xsExpdBaZZkdt/Sk0AfuqnqqizGq/rxhAXLvlwn+6xz+0BDwePsVBSM4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?fsh95LUhREk2Q8GF5hYY51h2Qugc9BoGELRN9lZ/nzCCr8isASe1u2q3Gn?=
 =?iso-8859-1?Q?S6OYryDt82WNLjQ62Ed8e0dfHqL9q0Wsniu4syJxBd11/YOdbUi2xWGTZ6?=
 =?iso-8859-1?Q?fmjQccguW22dNxJPZJkjWT1ohC1ZaqJTeZvD4TAlBZxExOAJlLQ0mZZq3l?=
 =?iso-8859-1?Q?VktMAu1mJoUZzfcsLSD9ty53OBKJh0iX7USj0dQt/BU2PRfM1T72aY4PFM?=
 =?iso-8859-1?Q?IR/1EeIH4Zyedyu9BqF7EpncBcl0pjA+VkxLVchRiCp9DBtK4+jcpHpok0?=
 =?iso-8859-1?Q?D0x/0mKOxxKCdnmyHFlhoPs3/uVbDVuOcHuzhoLnvuGY42yFq9tX3gBCFy?=
 =?iso-8859-1?Q?1SXEiI9e8A5XT92S6G8wJMgOhc9DOAQlUGdQZtHxFNIWIKskgF/zn5SuAi?=
 =?iso-8859-1?Q?Rpc/s/utTO40xu7yqtfXABou9owgd09ehqLznId/BpCffL8Xp296+UjbtM?=
 =?iso-8859-1?Q?uhWhTd/XGUw/PYHtw7NtZMjLzgHv1uycRs1scsmcJHejGJsCHeJTa1dHPV?=
 =?iso-8859-1?Q?8q5VxDMJdUw4DbAT+b9ozeFE2s031yOiWprGHsg/8Tm567ORDLR/TZ6GDG?=
 =?iso-8859-1?Q?5Ijo9p0a0pR35Ve4miC13YpVu1vLkq8uhpQmYC9HM4PXs4fBskawzaWdE8?=
 =?iso-8859-1?Q?1Dg+Lb2gPNW7CiBssPAKspD9fIiTBUPfMogXJ7aDviQHbtaZ6zVnmxD9t7?=
 =?iso-8859-1?Q?QjD9uYGjYSUypI/bPOZ1tbqmAPnbyguTUUYei3XbkslgBNQ64iN4/3nmW7?=
 =?iso-8859-1?Q?+AUZyVib2avvhQ71fzaQ5XgsTPxtoEyy3kLurm98hQGZrp/FxPAwNzjSY4?=
 =?iso-8859-1?Q?JZSi5SwNUVqjQhKGh4fK+MeXXzyMkYoTcFQlXsWDG0NBF9jhpuiwXI26Je?=
 =?iso-8859-1?Q?/g3PExC7hPuLkUlgsXxYRfxtsTM8Ig8GfmKtjf0JORRXlEH0vuvbtLykp5?=
 =?iso-8859-1?Q?y0YGDCXdiXMoRDYVJOMYx9ArblEPFwKCPVpIWxazfO5ZpxtgTBqX61A7ya?=
 =?iso-8859-1?Q?XXyC3gVPp4eYg483BCkyMDrFkVQX79g/h9IP5MrbOnvNVa2xIoaL02NMbL?=
 =?iso-8859-1?Q?JyXi7Zp90GJkXaVUS2IbxKesOwkyNCjXxSbCE9Cj0Y5IqNfs4SBEb7EAVc?=
 =?iso-8859-1?Q?8j6F4Yv7v9PMG11x0YgEkWeEKGBwE60l0u7RSEgra0E62SSqw+Z/+CLc3L?=
 =?iso-8859-1?Q?N4XYvGeV925225mPqUOrH72WAnn2ndfcoErx294ztGRgVp12rZUYOA8f/A?=
 =?iso-8859-1?Q?dbto2vdZxZzbVEqlxuxeQ2LCzHcAhskaHqsU9N28ZpZCa1yN8Jk4c/mOFD?=
 =?iso-8859-1?Q?dTSzvGKh9VybT3zw7pswAhRHH68+c3p2gmTN5zv7PtmK3dgfE9KZOnaa9n?=
 =?iso-8859-1?Q?zgjgnCKsFI4QbAYQwXr2HdfCBH8anGIjly7CyevMBTBJyUZlyMAme2O6/U?=
 =?iso-8859-1?Q?Lb7lqh5DzYu33/ooousGp7k8djOp8lQlku37XDXvlkBWF6ruOS7Y2jx4+Y?=
 =?iso-8859-1?Q?Yyi/jMgcgsVQtri1H/iG2ZwAqEDjZU14NA5Xcrv8f87V0uLhWWZU+EfSns?=
 =?iso-8859-1?Q?pI860zYSO7ZL7QRSZa8GtZj+V8vUvBUfq60Tvel07BSLkF1zVKWlCz3vfQ?=
 =?iso-8859-1?Q?MNQDhCk0XyboVOcuOpoxb4wfjg/ZX8xm/4xzZaiPgeMgNR+VBIy6AgpQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09a0881c-5405-40e6-9cd6-08dc53f93b57
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 16:15:08.9089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ovx3flbOfuqKkS4LbAOsn0JlpQNRksZ5hc7oU3JcqvOQcR5Be9/3XXzcG7varx+vjml349gumrccUqk1Cvi7G0OXfqAGflJY6cppKTs+oDI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6054
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

On Wed, Apr 03, 2024 at 05:47:58PM +0200, Nirmoy Das wrote:
>>diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>>index bae042b35fa8..8781ee15c253 100644
>>--- a/drivers/gpu/drm/xe/xe_bo.h
>>+++ b/drivers/gpu/drm/xe/xe_bo.h
>>@@ -23,17 +23,16 @@
>>  #define XE_DEFAULT_GTT_SIZE_MB          3072ULL /* 3GB by default */
>>-#define XE_BO_FLAG_USER		BIT(0)
>>+#define XE_BO_FLAG_USER			BIT(0)
>>  /* The bits below need to be contiguous, or things break */
>>  #define XE_BO_FLAG_SYSTEM		BIT(1)
>>  #define XE_BO_FLAG_VRAM0		BIT(2)
>>  #define XE_BO_FLAG_VRAM1		BIT(3)
>>-#define XE_BO_FLAG_VRAM_MASK		(XE_BO_FLAG_VRAM0 | XE_BO_FLAG_VRAM1)
>>-/* -- */
>>  #define XE_BO_FLAG_STOLEN		BIT(4)
>>-#define XE_BO_FLAG_VRAM_IF_DGFX(tile)	(IS_DGFX(tile_to_xe(tile)) ? \
>>-					 XE_BO_FLAG_VRAM0 << (tile)->id : \
>>-					 XE_BO_FLAG_SYSTEM)
>
>This should happen in the following patch.  Otherwise this looks good 
>to me.

oops, yeah. Bad squash on my side.

>
>Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

thanks
Lucas De Marchi
