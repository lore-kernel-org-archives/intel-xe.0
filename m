Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C5AC87FCA
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 16:49:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE3B810E123;
	Fri, 25 Jul 2025 16:49:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a5/nhRiS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B34010E123
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Jul 2025 16:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753462142; x=1784998142;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=U7D/SNtXtHIW4lc7/i2JmbgvnikOw2I4a9NCg4vO434=;
 b=a5/nhRiSmOMyRL6hcsnJ5MsOcuSIBfdace53FLc5FqsCy7PQSfGhC0rg
 ezaLowhl6CmbS/5+Ray9j+ky4/LnZ8RCKy7iRkb8kdy2P3D6PpwxghAI7
 uY24PqG6HfJtj+K3k4maBkyQaxYkoS+3ZSCDeTS1qYCQO2K7YltyhYaXC
 PGBoJiyn3loIod47cboA9MLfrDhsc4F2uoWt5WYPhXU5paDg5RbR3ydUy
 s1m0pPy6rfZHP2uZMEmFfblKlnhzxWgsslc/nbdq/DDmmHHBydEb6u91x
 gCZM9nq/JtpqNzgJhWWMaEgWl0QYS55ktaws7KipRZh1udvcuBTkxJkBN A==;
X-CSE-ConnectionGUID: JfzgKR5TQo6dITi3s/oRYg==
X-CSE-MsgGUID: 1e2xnO1PSrKiWtgYrshO1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="54885440"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="54885440"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 09:49:01 -0700
X-CSE-ConnectionGUID: opaHmWdNR3aGQYuzhibDQQ==
X-CSE-MsgGUID: ePTpjR6MQSGNNtkeYpK9zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="191909860"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 09:49:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 09:49:00 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 25 Jul 2025 09:49:00 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.59) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 09:48:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bnGxtuCOxWf+xBQ9s+dgxQtinHRxHFgZ/oavmsFnGbgVlZE4IZACXvWRoq5GSMJ3I9ourcAADfDGPw9s0nOLev+O0oAPxMBSfG7qlCCdq5t2azjtmyLR2XJztwsEhCurtp2LJDCpCGusWeVTJTIHZwXkPedlvSFe+lHMeArZHCymKfd+qFXuawxmwT1o2oSG7l7acyWvWNzfOHOo3BK+RtFqX+QJ3GZimz34sP4vTGVvoxsyMznEaPJS/5x6nD/rbbRfsloez9hVDKzeju/LbVCtQLepRCPJvMS5dPhD6MtFcHjuTZFgAn9IkLLXQqCTYpoH4sjaYvaD/4VSBS9wVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LhiVGZwcpuLDEVBeVbctRxAGbpuXoWPhFZVW90HEKVM=;
 b=ROtpe/lny4DwRDASTnj6yEPTReuWjrX0b+D63I1/gM9bc3EzbspoFOZqxO+Gga3WqBWUQKlfg2wOfhTmSTIWDxot7HIQ3JwHamzfnFfTyLfQMd74NgpAkJXrq30oY2NtcDy5AxgPdNJKK8QAW4C7qXXqjVDVytPYo9gkY3/DCVxitSEdb/NEO6AHEDkj+GZqECNbP3IfGAQy7DuxcETqU/ArSUTgKnu1P4ee/tnRO3bSm9V1FtG+ClDJXr5iUXHNOF69S2R1pGYE9r9KUc8PkV2T+MBohfsWUhS1B+OixAfIs64V+Zq0rs0uHUN2EcOWTVEkhNnAsduYjLHr9R1DHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH3PPF55C5E51F2.namprd11.prod.outlook.com (2603:10b6:518:1::d20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Fri, 25 Jul
 2025 16:48:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8964.021; Fri, 25 Jul 2025
 16:48:57 +0000
Date: Fri, 25 Jul 2025 13:48:51 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v10 0/8] More missing XeLP workarounds
Message-ID: <6sbhybfp5ogndgrlxobnbutexyrsc5grqav63axmohctkpqhs5@dvznze3senlt>
References: <20250711160153.49833-1-tvrtko.ursulin@igalia.com>
 <guk2rrsfewvqw3rcknnnhmgjk77ug7gwycu3thi2yeiw4j7bdx@r4lpcrs7lwxv>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <guk2rrsfewvqw3rcknnnhmgjk77ug7gwycu3thi2yeiw4j7bdx@r4lpcrs7lwxv>
X-ClientProxiedBy: BY5PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:a03:180::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH3PPF55C5E51F2:EE_
X-MS-Office365-Filtering-Correlation-Id: de3af468-36d6-4b6b-c15f-08ddcb9b25fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xK2t7RrcJa3EGyVHiLozNvv1B2SkpWeZr0lhH6RMVE7fsh9zFQMNAtQvWx7R?=
 =?us-ascii?Q?5Y0RiW4OaN4PbY2EAYI9NReBhva8mk9Tws9BQoGLfiigZ0ycYTQ4GxOdNC7P?=
 =?us-ascii?Q?Jw5c7Giu1BxGZn0kVg3Dw9Hm2vaBZMApitK5NNtAqI1F7lQYHlD/u+rlDxMJ?=
 =?us-ascii?Q?B7rH+KaR+2VR0/jiE1L0qojFOq2N2Px+PJ1OahYqIx2B6Ui/Al3UYgc0+0Fg?=
 =?us-ascii?Q?hzCaL46jXhf75VbTeyun61/dGlBtik09RhnKFbqnqbCurjzA7E8nACGSGvKF?=
 =?us-ascii?Q?rUqpSS5qu6fM4wq8YHtc8aa1al6ctRNmJ9zx0dCZmTEYeb/zNHwX9BJTpa6Y?=
 =?us-ascii?Q?sirNODo3NBTTEkIo9zw7fryAEsy8CZeLBvF1ScSwwh0BQwLsDS802pW0gh+r?=
 =?us-ascii?Q?wuiJhlkSFjU0t0Ewic2RjQQbi1ELmEBxbmXmukTI/I4NT7UJrLCkIFr3iyS6?=
 =?us-ascii?Q?/xGuwQ4fOBG76PmjbiHRxkNh3Y9y0pAQWagLhYcsOHklm7sTc7JRl2QRj0wr?=
 =?us-ascii?Q?qtzUGWzCFEKLEBbYzfReqJQVdnvuxPYtv6z3oz7NYcBf09L0fw7O/MTO+Han?=
 =?us-ascii?Q?Re0I6uGsNsGztUNDplA4acc/PBroiTRJ5YurlcZARTSNkZZB8v0pQcMH3v/3?=
 =?us-ascii?Q?2/HwwsNk5lBrWOp7leP+nCmsTqeA/Vb1qmsnH/DqMgXiP0Hos1FuuCvtkqHD?=
 =?us-ascii?Q?PQb+hTupFCNCJVbT3CHZejTt+4P0ugMVQEboZAhGnq1JrOaaWLE7p5rsD6yv?=
 =?us-ascii?Q?30xIt9mqAtPBq1kWiwcyLBIkU91FVhmaO+qRpJu7k9Qy12ViFjmYyS3TQqv5?=
 =?us-ascii?Q?+d8jc0w4OZHdlaDKhSnJLplh6NQWA2ZtfIUXR+5s0zEPVSBe2oIr9XfDY4dU?=
 =?us-ascii?Q?lIoWDdWNkrZt5EfscIU/NSnNrpLPlkaVzvHX7ZL1ufl88pSfPBGc5vBso+SP?=
 =?us-ascii?Q?O184wi+/DotR2bKlj2A2JSoEXys3OY3DVD1xpnnauZrHnuwl3e/ZseI9TikZ?=
 =?us-ascii?Q?GT1BHOeScWT+4sWDGcgiRImLySb2YzLwFFmpP640aEL+EFgfjQDSDSbFhE6F?=
 =?us-ascii?Q?FzBnlwqq4F0F/HK70UoB909HhqP4ZOYbPycsnEpa746Zi7QZ+dmxa3jlmMuH?=
 =?us-ascii?Q?K2NDHampuzr4HW2Y6zJsLYGfT26VIol9qMaMoo/cMFxkeCBKjQahAOmBAIEK?=
 =?us-ascii?Q?9+rWMmnXSicyV8axvWDdqOgPOupK5katm4IL3NSlbzAdcrEoor03ronNXdHm?=
 =?us-ascii?Q?2QwSPaoUvFoaWqu0QEOQhfITE7diMNvwPkXehvkSXJFoz92grpSvAgKA9IHi?=
 =?us-ascii?Q?SHl0qxKmdDvFgevRwuA2HLB4GuOJLyR122jY3OgmuL49VFvpbB8yQm9/vbbM?=
 =?us-ascii?Q?yEEuo1qZzA3ZoQ7WT3+CsbYVJwEp7Cicdhiy+bNM7YwzjXBW76T9liVGOwIn?=
 =?us-ascii?Q?Ef60xWxBfws=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jy7jv50Sys9Orj61FA0yJVEYBiyfnd/VS50iW4frdK28Y2rVusO/oHl73AUA?=
 =?us-ascii?Q?K7a1v/xno/6oqLSdE+peaHJ3bylDFnLOLzs9cG7xmjzh9V4lINnm0Ita6iNE?=
 =?us-ascii?Q?Yxw0TwqFFPTccXLhe5x/pKgq+d+kN9adKH4nbQ6Kf48isH1eXI0CcCBpvLCt?=
 =?us-ascii?Q?MqQ8n9tN9oPPozKgl0qPqelK/o3gmFB9cXH0FJQywWTHLp/faqWkX9tw8Tqm?=
 =?us-ascii?Q?19ZNVdCchLStokMNJUo+6GmG0ElTMwOYPCkCBlaBrmlOQhzdXNfA9uL8JcRw?=
 =?us-ascii?Q?NSNoiK1guN8GIpQra4/E4t2dJNvagk4kssM9S7TNQi9AgaIPHA9SQZ0Z1JeX?=
 =?us-ascii?Q?9QHQCcAKV2o/yKlwdzkKK1aTPbF4Q01SPPNhWGdENHGr9K6ne0dVMU0j2Lyq?=
 =?us-ascii?Q?nErd4Ymto7/PXzs4alNijTL+QxzBsss59cMTfQVCEY/NaDlKRUQW9MDzQg2l?=
 =?us-ascii?Q?uB7OmpSOMKc15HnBzezNus/bwr8Ms3fT+oIwuKDvItF/VtqHt/rnVFY2Fe1W?=
 =?us-ascii?Q?ar7iFOyN7gCP1DpHUz/H+0Wov3GI7EoQZb89iYrps/ARB/iY0HSBx/KnLDrk?=
 =?us-ascii?Q?3cygUKwiZJNX2g16GG5kA2BynOCCl01ZAUVitkv1rjNalJp5cJA8i/hgl+At?=
 =?us-ascii?Q?guEGKbvRNE4JYGOBBnNG9OwYbjk1sAx9nXY2IK6Vt+amnRupwnOP8R3qgFbV?=
 =?us-ascii?Q?UrN25Rls6tBE/NUOzEZnqRBxJTTzkWIB5v39K5bsFedessnC9zDF+bnRR9fr?=
 =?us-ascii?Q?DA5eZpwGnwRF7nYdP0H28waorJWbNmXrjM8oWvD62TLQ1pnKJfsGg109hDc7?=
 =?us-ascii?Q?Ny32C/Q5iqlppcg/yssnjr6pMPOfz/qecrUznMLT4yjdH0etnHTikwIRsiEa?=
 =?us-ascii?Q?a3IC23nJUegS1K92yHx5cwTkt62JB7TP8ZCBjBD43ZhWHd5h4WjrjnySgddA?=
 =?us-ascii?Q?qyovP0ALLdFNIZvqN9pd8A2Z4GrnxMnDw2ZY06ZyO6Jpi0y9vggSyrJE4yXL?=
 =?us-ascii?Q?TvmDa/P7GguBXa3YjKmUxjk5QI6A6jWQHN3RWccfEkaPVPPTle8ca3RQfW78?=
 =?us-ascii?Q?3kB/GtvVHfiT3N9UlZDC3+3nDzAPVnAyFLWYDinJE9v5H5sTfD1OC5drge9b?=
 =?us-ascii?Q?hE5PR0X0lDaaAmhOVR/xctlDMj7w+1B9WxPRR98FXyncuWd7KLHIXZf0llSW?=
 =?us-ascii?Q?dHaOJtUc+xMksIcoInHyn1xdvENF8sxlcMHnfRzRWrLooMi0KAQzgsjTNlDq?=
 =?us-ascii?Q?7jtypXBlHOHuwNIk4a6DPPR2IqKvd5GkJRDTNFL459nrrwyPhAeYWVh1FCWQ?=
 =?us-ascii?Q?1EsJPhsZXLIg6nOLU4yigh1INVRxo+4WsJZEPwVJyXTuaZehrh1ebcLWDqtS?=
 =?us-ascii?Q?lkjucKHlnuJpwSUOutMnJHA17hS8Y3kw6tfE/Y5Pzz5BErHxt3JFiOvUIQUm?=
 =?us-ascii?Q?X2A79cJignsSWwyZ8295tFH2nv3HyPsjRIekq6ucKcARaklRpqfa2MGAlSMX?=
 =?us-ascii?Q?9l2bP/mXA/FByf/D3/GEIOUrlxPfBo3oK/2rLBVQSqRxxkotqEWX3icu9x38?=
 =?us-ascii?Q?ErTQEFzleeBOG8CGeohmzIx+kQR2ecJ5R1fF1a53PDFAmpimyLhOTcIxQGME?=
 =?us-ascii?Q?EQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de3af468-36d6-4b6b-c15f-08ddcb9b25fe
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 16:48:57.8058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UiLyJIqQCPlWW7TLTJJiM+HpISRuLhH5boeVpfP9WJq2lbvDAeInab9zqoTLJHFPHaxSGV6aE2AtKNDMRrL2V4JSWsWOG+rf5YJmoZuPaYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF55C5E51F2
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

On Mon, Jul 14, 2025 at 10:27:54AM -0500, Lucas De Marchi wrote:
>On Fri, Jul 11, 2025 at 05:01:45PM +0100, Tvrtko Ursulin wrote:
>>Some more missing XeLP workarounds. This time including some which need to go
>>into indirect context, which also means some plumbing had to be added.
>>
>>Includes a fix to use iosys helpers for existing wa bb emission since there is a
>>code dependency on it.
>>
>>v2:
>>* Use iosys helpers.
>>* Split indirect context plumbing as a separate patch.
>>* Tweak where and how Wa_16010904313 is emitted.
>>* Move Wa_18022495364 into the wa_bb.
>>
>>v3:
>>* Rewrite on top of Lucas' wa bb changes - use same infrastructure.
>>
>>v4:
>>* Rework due 3a1edef8f4b5 ("drm/xe: Make WA BB part of LRC BO").
>>
>>v5:
>>* Fix indirect ring state offset calculation.
>>* Removed extra space in one patch.
>>
>>v6:
>>* Fixed indirect ctx MI_NOOP padding to 64B cacheline.
>>* Do not add negative errors codes to reported emitted counts.
>>* Renamed workaround emission functions. (Lucas)
>>
>>v7:
>>* Rebase for removal of bo->size.
>>
>>v8:
>>* Rename bo emission helpers. (Lucas)
>>* Drop XELP prefix from LRC layout define. (Lucas)
>>* Drop first patch from the series as it was merged.
>>
>>v9:
>>* Contain emission helpers arguments in a struct. (Lucas)
>>* Use REG_FIELD_PREP for CTX_INDIRECT_CTX_OFFSET_DEFAULT. (Lucas)
>>* Coding style tweaks. (Lucas)
>>* Improved comment. (Lucas)
>>* Split indirect ctx bo size defined from maximum hw supported size.
>>
>>v10:
>>* Tweak code formatting in last two patches.
>>* Drop LRC_INDIRECT_CTX_SIZE. (Lucas)
>>* Use reserve_dw = 0 for the indirect ctx. (Lucas)
>>
>>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>Cc: Matt Roper <matthew.d.roper@intel.com>
>>
>>Tvrtko Ursulin (8):
>> drm/xe: Generalize wa bb emission code
>> drm/xe: Pass wa bb setup arguments in a struct
>
>there were a few checkpatch warnings in this that I fixed up:
>
>	-:34: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
>	#34: FILE: drivers/gpu/drm/xe/xe_lrc.c:982:
>	+^Istruct xe_lrc ^I^I*lrc;$
>
>	-:37: WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
>	#37: FILE: drivers/gpu/drm/xe/xe_lrc.c:985:
>	+       unsigned                offset;
>
>	-:39: WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
>	#39: FILE: drivers/gpu/drm/xe/xe_lrc.c:987:
>	+       unsigned                num_funcs;
>
>
>
>> drm/xe: Rename utilization workaround emission function
>> drm/xe: Track number of written dwords from workaround batch buffer
>>   emission
>> drm/xe: Allow specifying number of extra dwords at the end of wa bb
>>   emission
>> drm/xe: Add plumbing for indirect context workarounds
>
>and in this one:
>
>s/CTX_INDIRECT_OFFSET_MASK/CTX_INDIRECT_CTX_OFFSET_MASK/
>
>I don't like the repeated CTX, but if we are using it in the other
>define, we should use it here too.
>
>Pushed the patches 1-7 to drm-xe-next. I'm still waiting to hear from
>hw/validation about the WA. I expect to get this applied next week.

I actually applied patches 1-6 at that time. And now I just pushed
patches 7 and 8.

thanks
Lucas De Marchi
