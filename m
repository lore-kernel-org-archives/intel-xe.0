Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD919CF11C7
	for <intel-xe@archiver.kernel.org>; Thu, 10 Oct 2024 16:03:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8062710E973;
	Thu, 10 Oct 2024 16:03:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZfeFRvbQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1916D10E973
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Oct 2024 16:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728576189; x=1760112189;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UgFEHg8vIOd27qozg3ccuZwe06orvatCTGx85zYFUjE=;
 b=ZfeFRvbQtki9pW83rFY4oWOv8hktLNwZuuy/ifWq+CRlBxyllHRR47z+
 YS1cclZeupTaeoyEFpOnzIm5LMwbRYGBr36FxYiqEpFxVCM0ufFcjQXiu
 bzJPjpqh03YU5y2+kPxaPQ3bEZDmlCHj1VfgsyJxTIqSVf4Irs64/MtAc
 jYk1xAavTroquwghK9gk2150K0pilXuKqW4/NeceVCBLzIF8rQAWD98nJ
 EHiwUJcaWirGD0sMAVm2gMuDNMltdteI9pMISM+e6dSbds/fOY2dyyGEy
 /+woWGsA1brv1t2oSIrpiWxUq9zAKgZojISALm+6kdQAyUN1Dn+h2zgwq Q==;
X-CSE-ConnectionGUID: cltdmvQsSpmgogn1fGdKZg==
X-CSE-MsgGUID: fUMY9CHAQoOGNA+HwP8quw==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27841771"
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; d="scan'208";a="27841771"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 09:03:08 -0700
X-CSE-ConnectionGUID: 03+lFrDSQUGeKi8r6u+u0Q==
X-CSE-MsgGUID: 7H/xnNkFQiaToVpRFIhyLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; d="scan'208";a="107363033"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Oct 2024 09:03:07 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 09:03:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 09:03:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 09:03:06 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 10 Oct 2024 09:03:06 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 10 Oct 2024 09:03:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q5NP2J97+y3N6a9gWIW1WIYlHNh4aCNmiJaJcyncnz1SU+LB6lNh2th6AW5kY7EqqmiL+TPbJicGpZ95tl74Cd1YI+U8O7cwQLA3ewA4Uqm5OWhNv2Hmpvxe9Xuhuy7Vnf5bYo2feKK4Wv3+1y6bZCzXMBcMmtFdhHstGrZRrThrJjf4Mo0u+aSwxXZefDutrHZddNIdLFemS0B8wuk0ydqWxRtw1Td/Eb9XvOT7T/uidq5Dr77L7h8qoUuZh1OaKb9xbv5ESxXI3bI7R+xElK34BEvDf8zF16VW8hN2/6dVz+8qMtLmzTX/TmpKwmJZ/3JEW7+98aAMJjH4FiahkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ASyreJPrNj8eTFe1Vks6Ym+y5R9nqrzG6SjI9CDHyaw=;
 b=EROtkE4CASt5+Lrw60g8EmfhwDBZjPyXr5pxgs7dnynD8M230cN4S+YeEazYiK+PU0rZ2GxEevSGS408bBEg5fk544O72IwiGX+5GZOSRE0TtDppf1TRiKA3jnigXar3qd95mDcgQRuqbrEPYDZjDfcMYNRdlt2/hz2+TEcClhzbrkpyvaf7CNx4GfV5Ofqm6G9gKYkLb281eJSgnOOB6jK5TN5sPBLORFA0/zIhsLWXkHgT9NkP5Lu+r+FDtZKGXAPWToh5ltgZTx18fgf56QpGYZwdPojvnT6qDQY80HkcCvvV+BknDHLbkzfxVi44DsENN/lg/hRc0sWenPzPAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW3PR11MB4716.namprd11.prod.outlook.com (2603:10b6:303:53::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 16:03:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8026.020; Thu, 10 Oct 2024
 16:03:02 +0000
Date: Thu, 10 Oct 2024 11:02:56 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>, "Tejas
 Upadhyay" <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe: Use the filelist from drm for ccs_mode
 change
Message-ID: <qkxumw627jw4ukxsdywxhlzziub2324ydn43isdrp7yn5cfwta@vpipjndue5is>
References: <20241008073628.377433-1-balasubramani.vivekanandan@intel.com>
 <20241008073628.377433-3-balasubramani.vivekanandan@intel.com>
 <ZwVHmw8KPluuPgvC@DUT025-TGLU.fm.intel.com>
 <bl3ildwwdjswvvfpim4fgqdmlqvonccfbavdxymyxr4bdp53bn@xwd5njyqad4d>
 <ZwVS0eVGUaa8Z3v3@DUT025-TGLU.fm.intel.com>
 <l2a4np3y6htwcp7emufsrajyrozpmguwm4ucosbu2ne444jpwa@2ohs4dowlmr6>
 <ZwVq0JIEz64OhROM@DUT025-TGLU.fm.intel.com>
 <ZwVzOahncbCljo1f@DUT025-TGLU.fm.intel.com>
 <Zwe0bJJkKs3p-9Q8@bvivekan-mobl1>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Zwe0bJJkKs3p-9Q8@bvivekan-mobl1>
X-ClientProxiedBy: MW4PR04CA0036.namprd04.prod.outlook.com
 (2603:10b6:303:6a::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW3PR11MB4716:EE_
X-MS-Office365-Filtering-Correlation-Id: cd9abec4-38c8-42f5-b5b4-08dce94504c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xg/ZU1PU+mEUwMPOU6Uta+e2cVNXV50K2xnSDhYXJT7igsPaumlCqeShNQcY?=
 =?us-ascii?Q?2lEARBLt2dD5KQsM/lEg4xmhs6I+wHTjiJv3mnwsTPPwsV7FXh8wT0zaNx6C?=
 =?us-ascii?Q?TWB3qDcPzrZgcuwf/50N9yHYmoXBr6b3vbp8M9odabBEvgw8uv/+FQMhxMg5?=
 =?us-ascii?Q?pjIScEMf+uLNpnFUCimC6YU4OiGQlnxXlMCXI3zRj0ZOUMZc5r/SwKD46KVZ?=
 =?us-ascii?Q?n76podBW49NGLCyfHt1q3kO5MF0N+6iPOF9Sq+2ycwqEb7ZcG6X6tX0RNuXa?=
 =?us-ascii?Q?U5gopXWAbbhZ4jG5sliVsYzgyfaMbLxe68fCmVqe5jd5Mv7f1U48N647Owb8?=
 =?us-ascii?Q?UbmgWavrFs8fVayuc0yxE5CShsWX0pMQgmd26reQaOdIDg9jd1B2USARr3xi?=
 =?us-ascii?Q?3zKrXhs2BPbo0dv11Xl5bhOE32SMxMrz5QtBLDzdm1uTTMb8P0mkWWJ8UMUE?=
 =?us-ascii?Q?d+VIKoOuuBFZXMGidmFPDoYaM23bpFobthZsbeyK9QD8rMGG+VOC1eJuFiTH?=
 =?us-ascii?Q?rtyIS4yis7XjOZHhQRjYf3Uw+TBTfdx0HTe7Hht5O3KVcVKSyJq1CqrNroEn?=
 =?us-ascii?Q?sd5OjBHiZlkwQIhCibhmEabEHXYMgN6Ch678cIGgO8h/XQIO6CtJ3dqu/ea3?=
 =?us-ascii?Q?oflJsE8fp5wQgTw48nkSDB1b/NSuKPXQIZx2K2x5iJhq5QqkA0gSy2lt2tK1?=
 =?us-ascii?Q?TaB41v3uJmIMq9joMBGXVqJGgi/v2mVVWyqdVOpLN4MpjuedeWRQ3Y/MWZr9?=
 =?us-ascii?Q?7uVp140NGbmb3HKyPP2Wiimpj05Xl/qagqP3mtoly9IjEhBHKON5dnUNeDwa?=
 =?us-ascii?Q?M+xCzalPPr2zmQA2OmXoTWdFj84kzMhs396q7j2nN6FB8ge926Ehf3Y2w2v9?=
 =?us-ascii?Q?fnrWlQIe8uHBrM9fCyakCZBH3HetMTIpTPyEC4yiX7u21OMJP0ggf7vJCVdq?=
 =?us-ascii?Q?QOhdkUwKSSoBhjC+ItaxZpc+qhE3HRWQ5OkxVhPWP3peRVDpRFkiLQM34fkf?=
 =?us-ascii?Q?Le3aVtAIbDVfof6J7ZLLB+MznBFLJkRPAvb+4ce3Ga43fWfpCdE5qoQ3MLES?=
 =?us-ascii?Q?twCCpJeh5QlMHm5IJUSNDfQCrXm9au+57CDLZ0XK7YB8XoQ+7z0hyh7QnUH8?=
 =?us-ascii?Q?ECDVFfStxKmoDfglNlI06/eGbqsASARwVJ9E+29d0vwa4wUfjYlOTMbZdNAt?=
 =?us-ascii?Q?75HbUiJfhCKt6r8KRxJhxbzs0zbLFbQPFGSg6lsVLnnEiB/vInxsJ6vc4MMy?=
 =?us-ascii?Q?XaU0K8f8C7j6OtsB2IyI7NLYslLejdJp4fqfk56wCw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q85yS5Q3q4DAH5J6gLysAYMEOnHk0wRSflPyn1Dl18bvLXdiS8TBeKi7Txkt?=
 =?us-ascii?Q?oZ/abOj+2DOtO2q8McqUMEQAdqTdt0O37ZwTfuqldRo1HCJt0wPKx2ybAQKB?=
 =?us-ascii?Q?tBzYPNoQ43R617mARqBp0hZLsxmlvAR44AcWbxWJJ2UT4KycuAKCTJPWga7x?=
 =?us-ascii?Q?Nvdi627sn4RpSh9KSU66PgnlMAIs2wIoVstWZXPr4Cs6VsZ/wGNEuTRmm26f?=
 =?us-ascii?Q?x3Qa26a1GWXEnzboO8TX8Sm8J7Vlv+2ZnrwSWclCbn0tkycvRq8PiSdJxLpB?=
 =?us-ascii?Q?sHh7yE1QOHf8N06R/Yyyhwkxdpcoljp80yP2PMSahYt+SExD/Z2oCsU8TnwQ?=
 =?us-ascii?Q?CYkYAltyxi+mipJ+Do/Aga1M0aOxPSoklKA92n1Fz1zI5E1Rfd1/tPvwShJg?=
 =?us-ascii?Q?ver5UMnHdH3FL2Th3zrOPkXba4cfC+Rzw7N5oxvZI69c+Ar9e0a4XFAimWYr?=
 =?us-ascii?Q?4w1Qgs84hEWLxYa8fjEAQGIbUWaruk+AuL2Cd+1J1dD3kWZ3D87P5+0F/kb6?=
 =?us-ascii?Q?3OLb+BRVqRx3Zk0ySuWuVTJ9vbFu6EFubVL9hmyzqyTnvuYh1jkT4cukzdA3?=
 =?us-ascii?Q?Sft/QQP9mUiIB9eNZYeLiacqPFonK7GKz8AYSBIQlmEPbuo6YzelG1YiORs4?=
 =?us-ascii?Q?3MenMkyqHdIzvk0nxypultUzJUy6OLLimEhV0gq5LjO7kMts+YBPrxz05E5V?=
 =?us-ascii?Q?kJ+4cvVYO6nhDs+lIdBDAacT+s2Ese1BHaKY0G4bF6YoMy8mivNXknjdGZvY?=
 =?us-ascii?Q?V+6nBLebKKuNdddk0/SEgzzhgYGBDicGmAdXN9s8Fkb84pwSK/Egwz9CavjA?=
 =?us-ascii?Q?ppvq6kUBHU18OSMbp27QpYExa6xLp/j33xxHnM1l18/KsyTZeuQnSGeudV0F?=
 =?us-ascii?Q?rsinoYYfa2M0jiZPheOwLNW2Y/wWExvoOcRIg/PmDk13yo1AaR5zPZ8AAW1i?=
 =?us-ascii?Q?yxpEscqEVT38nH0S3v4oSV3sPR44fL+OTYu5lrEiLlqMQ2xAKpU50viatjdF?=
 =?us-ascii?Q?S3q3m2aoW+jpxf1Yjpl3wdXcIPgJputiJ8lLPvCm9b8DhDMdPpEYgvWRKsPf?=
 =?us-ascii?Q?8z8zOph+zs+NKqx/SaFk2LA46xeWVCwPy37HNmyCOW8Ncp7p4vStzLqkj7CK?=
 =?us-ascii?Q?+s5bM9+nPIKQIFub5UV3YGf5ix2PiH47J0vFbYPTeiR0FyKWmRppUnhQu9tk?=
 =?us-ascii?Q?WWwMcfVbtiDfrWF25744opZSRggm0EOHRsXhAfVUOOgHZzA6I8GqBlFsHQ4s?=
 =?us-ascii?Q?q8GWlp2QoYWXKGG08fapUCgbK8XRS1qgFWrdoW86//6qACqO7oPVwJvN5mTX?=
 =?us-ascii?Q?AuxxfUko8p+L02t6+jq3/fCvaqes00ls22ADFUI/QiLm4pSER4yZkhRomFFv?=
 =?us-ascii?Q?sB7nVwKuL6sACzL8pT04sCjPXHCFCkIZglcicU6zG1w8w33/31Sbjinu15PX?=
 =?us-ascii?Q?8EnL4O0rAvoidANwdfZ56/ZDnr1swj+JfFBMeCkxuPKjyWIB5pXFBjO1bGjj?=
 =?us-ascii?Q?vicUs8DXyG+nErR0QgWI4c9jsf4o4iDae5U9EnbxSn15Pd9L2Rexes7ph9Ft?=
 =?us-ascii?Q?fGSl3gvaTBTMRNV8FZF7WNYclOWYN+kN9lJ6LBREX+VfZ0401zCVZc6Uq+kY?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd9abec4-38c8-42f5-b5b4-08dce94504c6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 16:03:02.4211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M2WgZypm31HubpiUHybPOtfy4KI5i04yZpq/kIh32QnYGNp/fWBD0RETNcMGRUTtFe5l2FBiC0N6B8NZeqFvUffoJgfH4OkMAiaIqmJ+qf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4716
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

On Thu, Oct 10, 2024 at 04:33:08PM +0530, Vivekanandan, Balasubramani wrote:
>On 08.10.2024 18:00, Matthew Brost wrote:
>> On Tue, Oct 08, 2024 at 05:24:32PM +0000, Matthew Brost wrote:
>> > On Tue, Oct 08, 2024 at 11:55:03AM -0500, Lucas De Marchi wrote:
>> > > On Tue, Oct 08, 2024 at 03:42:09PM +0000, Matthew Brost wrote:
>> > > > On Tue, Oct 08, 2024 at 10:20:15AM -0500, Lucas De Marchi wrote:
>> > > > > On Tue, Oct 08, 2024 at 02:54:19PM +0000, Matthew Brost wrote:
>> > > > > > On Tue, Oct 08, 2024 at 01:06:28PM +0530, Balasubramani Vivekanandan wrote:
>> > > > > > > Drop the exclusive client count tracking and use the filelist from the
>> > > > > > > drm to track the active clients. This also ensures the clients created
>> > > > > > > internally by the driver won't block changing the ccs mode.
>> > > > > > >
>> > > > > > > Fixes: ce8c161cbad4 ("drm/xe: Add ref counting for xe_file")
>> > > > > >
>> > > > > > Is this really fixing anything. As far as I can tell nothing upstream
>> > > > > > opens a file internally (i.e. xe_file_open) is never called directly.
>> > > > >
>> > > > > should fix this case:
>> > > > >
>> > > > > 	open()
>> > > > > 	close()
>> > > > > 			<---- race here
>> > > > > 	change_ccs_mode()
>> > > > >
>> > > > > because the close is not completely sync - the cleanup where the
>> > > > > previous number of clients is decremented is executed too late and
>> > > > > subject to a race fixed here.
>> > > > >
>> > > >
>> > > > Ah, ok. But then IMO just move the clients.count decrement to
>> > > > xe_file_close. I try to preach solid locking / layering and this seems
>> > > > to go against this idea.
>> > >
>> > > why do you want to track the exact same thing in 2 ways, one in drm and
>> > > the other in xe? "Are there clients connected?" is something drm_file
>> > > answer and doesn't need to be duplicated in the individual drivers.
>> > >
>> >
>> > Well layering, making assumptions about the file list means, and not
>> > randomly deciding what we can and can't do with locks we don't own.
>> >
>>
>> I looked at this a bit more, if we want to do it this way then I think
>> at a minimum we need a drm helper for this.
>>
>> e.g.,
>>
>> bool drm_device_user_clients_open(struct drm_device *dev)
>> {
>> 	lockdep_assert(&dev->filelist_mutex);
>>
>> 	return !!list_empty(&dev->filelist);
>> }
>
>Still the driver would be required to use the filelist_mutex outside the
>drm layer. So will not solve the layering problem completely.
>Otherwise we can define two helper functions in drm, the first one would
>check there are no open files and returns true holding the mutex.
>The second function can be used to release the mutex.
>Does it sound too invasive?

yes, and I'd rather prefer not adding these helpers.  If someone wants
to add helpers later and convert the current use cases, that's a
cleanup/refactor that can be done on top. For me, these helpers are not
really helping.

Rodrigo / Thomas, any thought?

Lucas De Marchi

>
>Regards,
>Bala
>
>>
>> Matt
>>
>> > > At least it's also used for similar reasons in amdgpu and vmwgfx:
>> > >
>> > > $ git grep -l -e "->filelist" -- drivers/gpu/drm/
>> > > drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>> > > drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> > > drivers/gpu/drm/drm_client.c
>> > > drivers/gpu/drm/drm_debugfs.c
>> > > drivers/gpu/drm/drm_drv.c
>> > > drivers/gpu/drm/drm_file.c
>> > > drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
>> > >
>> >
>> > The AMD / VMWGFX usage certainly looks wrong to me. If the file list was
>> > meant to be traversed by drivers there should be an exported iterator
>> > IMO.
>> >
>> > Matt
>> >
>> > >
>> > > Lucas De Marchi
