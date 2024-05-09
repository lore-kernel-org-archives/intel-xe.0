Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49222C25B75
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 03:39:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D982C10E10A;
	Thu,  9 May 2024 03:39:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n0yg6MPs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B3D10E10A
 for <intel-xe@lists.freedesktop.org>; Thu,  9 May 2024 03:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715225951; x=1746761951;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dX5Ys2+Q3x5qAkz2B/DUNgFSr8kQADszIQy5qClDoEI=;
 b=n0yg6MPsWMfhS5Cwen01m7BMKwea3qTreJUiwW+Ena4cvGnYXXVD+pXt
 LCI19nhbbRTuUaMTmwek3lBBm7ROptyOp0i9ZJ/znx4fBUPow4Q91yIQ3
 1DgqNntFWmaguDRvlehoGU+pacSN/MwBVG0ctFevkdDORIfzWPABuNOAs
 DzbgUzkOZ6MBYLB50Houe43Tm0BjSJRcltvLL8BJQHOQGIj5dSk/qVlDm
 tAyfpG1GJrRBBlSGJ7L4Ig2eQwgf+xwuKW/kz7mYnjgE0mfwqn2g4bs4i
 j67mUUJ2Jw8fRU/dUYhw5buTmmAqeA/kMiu4q4jRsp9FUu0Y9VkKNiv1V w==;
X-CSE-ConnectionGUID: 8nIiqKRvR2qpAbFBCX+lBw==
X-CSE-MsgGUID: 68BcEh7JR1ysgHZKA9Ns1g==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="28636147"
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="28636147"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 20:39:11 -0700
X-CSE-ConnectionGUID: JDPTlPGJRBeGX0JHQvLDJA==
X-CSE-MsgGUID: 23WciH78T3ix+PP4wWzmGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="60262893"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 20:39:11 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 20:39:10 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 20:39:10 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 20:39:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LUKBJiXZi3Ql6gY3pBhQp2oBwUo/S2aCfiSj09MMke84Y+LdMsxEqFw8zL98CRIuAke28U81FUJqZuWJ54+yLOHHYJiy+Cf5hfsVr6IwK8pSgAvJGHyfLliIrWiyI1AhEcO2RCocuLxnX7vabilhMbv6//y6RJWcEELQBN3T2Gn0wi1jxahtZrQ01PzV4q/IiLZBefdWDDgG8xJjSTDwEBxbQEEWrCqaT3lEEBtTYPdV69lAB3ddXG4UMz91+mNX+FCYP2wjwb5fs0dLzcJhwmYPrOlwSBCUhUFqfvGjPzJNN9D921UY/sMVeCMXc8As8QHiqjTHC2m6qaI/AgRncg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IbjFdp/aNhJ0YK/p4FwVQjpOu9s52CNNBKBv5FnCCHY=;
 b=djIPJjLbRQ1MihiNv3r6E0+6z6BfGhmfkkDK7svuGHB1f/wntUowc4nIBgTg+19NRV6PgJ0Y/N/7LhhAumIJMOylQiRjj24ebPPOvgB7kLdfKrfr2By9GvTOIt6TXJBqlJwWBeQ6WykZkQewJkMfDHU8TTT3y642tAOGAwdQWeTX5U2AQSWTTQIaFRvKDb/AQtjgVcF37yEoCo/FPYsaSawazHcLighKWWXbtXXFd1aLX4iMx1A8clPSf/0KfnQqXDnswnWGNgl4RQ1f8eXOi9Izl6i1L8Ku7RlKw9t7LIU7NGCK1B0zoMJvqetrZkbBFXpEJ0CZMNNKaGZmh/DxQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB4945.namprd11.prod.outlook.com (2603:10b6:303:9c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.46; Thu, 9 May
 2024 03:39:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7544.046; Thu, 9 May 2024
 03:39:07 +0000
Date: Wed, 8 May 2024 22:39:06 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
CC: Nirmoy Das <nirmoy.das@linux.intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Das, Nirmoy" <nirmoy.das@intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe: Fix UBSAN shift-out-of-bounds failure
Message-ID: <c2tkhqhxf5zr25p3cj6ibljqzvltrb7lwiaauep5dlphhu4k4g@gwitycdsle6u>
References: <20240507080456.613786-1-shuicheng.lin@intel.com>
 <20240507130411.630361-1-shuicheng.lin@intel.com>
 <8e7aa310-25f3-4318-aa99-20b39c6e438e@linux.intel.com>
 <DM4PR11MB5456DE457A372789DE992861EAE62@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <DM4PR11MB5456DE457A372789DE992861EAE62@DM4PR11MB5456.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR04CA0343.namprd04.prod.outlook.com
 (2603:10b6:303:8a::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB4945:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cc437b1-02b6-4898-441f-08dc6fd994ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VtIBbZ02YRTzva4Tqg0RgZ8nk5/qu8NUYbSC3fk7Y6xRmFAeOKKcFzUrlqwi?=
 =?us-ascii?Q?y81p6xA2fbuKR8L9yUj9jXsOk49eH3qq7xVpx80qHUGuOkBSz3MLO4z5KH9G?=
 =?us-ascii?Q?KEpcloKe6aMrzPA6a6rgj+tP1kKjPDv/7GqpwBcp5syaIOPbx3mN2xmtBMDF?=
 =?us-ascii?Q?sz7r5LxDyEc66tz3iUq1DvlbzFTAOh/COKuACiC8CX3wMOJWKkqFUDXE1mdq?=
 =?us-ascii?Q?4pEh7Tixx9VEvsBmc/s3joQK28Ou89DIMcbXmPGprDje4CmSwUpiBASlJ+T1?=
 =?us-ascii?Q?mxbBy2DUozQxm3rNPnWqyxa41YNi7DsDcS9usxRAadHFSSx/ofoo4bLrCZs2?=
 =?us-ascii?Q?DiyH/bFNoHVO26jqP+bGjIQTo97hytFCXFb62vTNd7Q1xYHhZTXW07M+G62E?=
 =?us-ascii?Q?A+uQ8hPYy4hIwfAy1hVGSdptVO6+dNeAne3b6ncM8jTaGCwVvSWKuY8S0Yzy?=
 =?us-ascii?Q?qMreLCcTxGJOaMY6z15y6rHwGKpjmCxDks5/hNhajJs2oaT3RtMOBty7o4VN?=
 =?us-ascii?Q?a7I4WfrbBFqmfck5u6jAzurKDaYmoqgqNDTzsY4F3oMG6MXs9UqyGR0fPb3L?=
 =?us-ascii?Q?hIM4fsX1BSVxwb22mSzLV4YJ6I3LW7vC8jRV3Mu1bwyb0twBnJVcN5vNfpPV?=
 =?us-ascii?Q?QTzs2RYlAgxtG95U9urOcj7Zyvn/Xu1JIQfgAOAI2dqdVG3tDHLMxzHJPZDY?=
 =?us-ascii?Q?AP64zgRB+5DUL2P/7Ic9UEEDvfcwWbbZgGFUJ4DKZSKFErr+oSYfkX1XPi1y?=
 =?us-ascii?Q?Bkt34u+57IJ0B1XanbLhwGx2iJOogBVxPjjSX5fyqOK1E9hlHP57wIuxFZbt?=
 =?us-ascii?Q?XjhLAvXy4VtkML/kBoWIzRnXD3vegUatNlBz9KQ0IUmy5BL+CUJ4aNtHYVaE?=
 =?us-ascii?Q?cx//2+IrsoVd1zt3LblwpG6KF3TTMQhngON9ibCF9OWNPkos8RTHDJxCUp5V?=
 =?us-ascii?Q?F3Sa3ovQ3oJmbmHLcdG9Vl6QQFUSbCJbPtd1smT1rEc2X7CqA5SkviwiUTaS?=
 =?us-ascii?Q?jeDi8QKd5GX60UbU2+XTjR0PX0obp7GWEhgQUhSxdq6YqQEPE6oCdPc8mhnW?=
 =?us-ascii?Q?aBMW2rWt936v3//2Ydd75CYO+ZZwvN9yp7X1epJTiNkU1ycJXH/VvP2T7faO?=
 =?us-ascii?Q?/NGyS8SZf3cnW7zfL1mw9XHaeOFW3a4nXJLqW1ZUgrGfJpQbTmLAsLXgNcvV?=
 =?us-ascii?Q?IprTZ34hevNEpSD9n1WdNON6UdtZ1DmBJs9LBXM4TI2V0/LpoJDf0sruh/gF?=
 =?us-ascii?Q?f04qO1nH+O0+EB8sYNjbKhIK58xKjUXIpGH1uVj6wQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d/PVhpVYScVvBlapwCAHiVCVKPd1sxfj4XxOrJ7c/GDE9R7I63nRWr3Cz3hk?=
 =?us-ascii?Q?Cl7di0k4hoSHBRnUjtzlZ3ccVAmBv5dnj8hG1sVyNX7znB90CuBykX8dcwzm?=
 =?us-ascii?Q?Uzsbdk+vJPiQyKjxeIlIIU/LcJvz+WFsHrtSjSB58Fp/QL7ITvKQ/h4OTK0I?=
 =?us-ascii?Q?EXbr4K5LfYOuAYTbMDhomVShXLONHKydqxq8mGcbfRQ0oy/ond+Rd+05ETw7?=
 =?us-ascii?Q?94ynApyGD27qajNMVd9Q7bCbr9T1ETCE4KBAh9Bhnp1NDDSNqnxGykhVnBxk?=
 =?us-ascii?Q?K07pm5RZuiuTiCWaWstXCYdClkJVE9E/eltkPFWOBKhjWVUaGjS7Qt37W4v8?=
 =?us-ascii?Q?EQm1F82Sfoy6AxO8fLYfTubinUDCRNyS8DGYoqEj96vC5D+FquaST4IEgjZN?=
 =?us-ascii?Q?rj7uhF/kUgGrEIeHb3qOO3vL4ThQ1Om89ZEX6KohIAgL82NPW+YrsvUY+kc0?=
 =?us-ascii?Q?xbVaBwHXO3UUbG883PUEJsW/AjTrsX6cuFmXSRSUdIYp7f/RurhEB+LmkFFG?=
 =?us-ascii?Q?D6L7MHaxbS251vngr0SaABlybDN+JH++tTJwH69YHICs/ggwTgLJkmH0q7F4?=
 =?us-ascii?Q?XJV7ovb7wgd+Mt+gv0iShn/GGwVQeP729ivNbM8NDs9YJkS/KnBa9uEHxX0z?=
 =?us-ascii?Q?7wti28c5zpOl/8NSwsIfUOxh9x9rLDHfUSBLQEYfep2Grctb6xW77DpTCGVy?=
 =?us-ascii?Q?EexGjLcD+FtDsVfXoYDx8APsYEkIzsLnhF6kjvdABhDVoxvXQsEvFPmwSySw?=
 =?us-ascii?Q?frsP/pLHcBxEgjwJ5WvcgsxbK52cmeu17V4M8fUcRdJ0x3zOZdxfbZJ6VyGS?=
 =?us-ascii?Q?VYBgREtmR5KOTUYnDcThhiXV7xFRQrphDajNDmHEMqjPppyMmoi9WfNoMPmW?=
 =?us-ascii?Q?uUhF/ARss6RBMMu5JFF6aycqYgjMnUoUyAeCZiFNVLWj7UK1t/v1qgBxtdJk?=
 =?us-ascii?Q?AQb1/TezBmsHIKXrSkFb45o8YL6CTOTh5P5gyyfrG15yYxBPBH5bezmRQRy9?=
 =?us-ascii?Q?dRstxoGmC2tGYC7EvtVsTX02S3nY9nbE7BI/OmYpciZLz9bLiAbASfJKRrJM?=
 =?us-ascii?Q?XnYbEsi0FvGyrCTxTXM3zXzVPErwyq6+A3Ypd5tL8fBIRoySAUVJP5+W7SzB?=
 =?us-ascii?Q?dUET2cJuLZL7pEhWz8XnZANau/1fNLi7Jfrhz5l8RCakOMe8M1Xsp7Tjf8LO?=
 =?us-ascii?Q?+M+cFely2Y/bn+xJLMlKiDzlU/GCO09JT4txfBIOY1vDMTMBxpZabivAiQj5?=
 =?us-ascii?Q?IrOQq9QPl0mv/j9Y5h5PqB0IcsvmJAwP63p3tf7/C3YQ6a8wWoZW3isUUdSr?=
 =?us-ascii?Q?YwxxFGt3Qzxx8JvM6WcPECLtLu29PNE+3jLxn1LvHY6Trf/plgCar7OX8pqD?=
 =?us-ascii?Q?nRVYAFOBldD9fLCgKTEjmD/D1cVc9o9GlpgsjQ/mWTJfCarIK4M79I4nkRa4?=
 =?us-ascii?Q?8NWyyEwZbFL0pWeiZGNZBub1BlBs40OkduGiS9SGHeI4VICMzNkvZxdfFc1C?=
 =?us-ascii?Q?XRIcdw7ham8D7aWfoCLP+2yiJGx0MABO5nuwUY+KlXxpkYXTqf1V4Dc8DDsz?=
 =?us-ascii?Q?0by2jr1U0/LOgZMMzyyHSTLt8PmNwFciO2yZjIN9irCRrzriGUZEz+AA/pZ5?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cc437b1-02b6-4898-441f-08dc6fd994ab
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 03:39:07.4330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W3fjb79hY8E3D5zEeaaFnyr8P1s5pEpF/aNHevL6Sn7ORbUizQv25AdNRJV4g17EP/1bpb7TuReb/xoZgjTZr74mXhFDd0eESy8+CuvSzMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4945
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

On Thu, May 09, 2024 at 12:25:39AM GMT, Lin, Shuicheng wrote:
>Thanks Nirmoy for the review.
>
>Hi all,
>Anything should I do in order to get it merged?
>Thanks.

sorry I had replied but I guess it failed to send and got saved in my
drafts. I just sent it again.

Since it's just a commit message change, if you are ok with the reword,
I can just do it while pushing.

Lucas De Marchi

>
>Best Regards
>Shuicheng
>
>> -----Original Message-----
>> From: Nirmoy Das <nirmoy.das@linux.intel.com>
>> Sent: Tuesday, May 7, 2024 11:13 PM
>> To: Lin, Shuicheng <shuicheng.lin@intel.com>; intel-xe@lists.freedesktop.org
>> Cc: Das, Nirmoy <nirmoy.das@intel.com>; Brost, Matthew
>> <matthew.brost@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>
>> Subject: Re: [PATCH] drm/xe: Fix UBSAN shift-out-of-bounds failure
>>
>> +Lucas
>>
>> On 5/7/2024 3:04 PM, Shuicheng Lin wrote:
>> > Here is the failure stack:
>> > [   12.988209] ------------[ cut here ]------------
>> > [   12.988216] UBSAN: shift-out-of-bounds in ./include/linux/log2.h:57:13
>> > [   12.988232] shift exponent 64 is too large for 64-bit type 'long unsigned
>> int'
>> > [   12.988235] CPU: 4 PID: 1310 Comm: gnome-shell Tainted: G     U
>> 6.9.0-rc6+prerelease1158+ #19
>> > [   12.988237] Hardware name: Intel Corporation Raptor Lake Client
>> Platform/RPL-S ADP-S DDR5 UDIMM CRB, BIOS
>> RPLSFWI1.R00.3301.A02.2208050712 08/05/2022
>> > [   12.988239] Call Trace:
>> > [   12.988240]  <TASK>
>> > [   12.988242]  dump_stack_lvl+0xd7/0xf0
>> > [   12.988248]  dump_stack+0x10/0x20
>> > [   12.988250]  ubsan_epilogue+0x9/0x40
>> > [   12.988253]  __ubsan_handle_shift_out_of_bounds+0x10e/0x170
>> > [   12.988260]  dma_resv_reserve_fences.cold+0x2b/0x48
>> > [   12.988262]  ? ww_mutex_lock_interruptible+0x3c/0x110
>> > [   12.988267]  drm_exec_prepare_obj+0x45/0x60 [drm_exec]
>> > [   12.988271]  ? vm_bind_ioctl_ops_execute+0x5b/0x740 [xe]
>> > [   12.988345]  vm_bind_ioctl_ops_execute+0x78/0x740 [xe]
>> >
>> > It is caused by the value 0 of parameter num_fences in function
>> drm_exec_prepare_obj.
>> > And lead to in function __rounddown_pow_of_two, "0 - 1" causes the shift-
>> out-of-bounds.
>> > For num_fences == 0 case, drm_exec_prepare_obj is the same as
>> > drm_exec_lock_obj in function, so call drm_exec_lock_obj instead to solve it.
>> >
>> > Cc: Nirmoy Das <nirmoy.das@intel.com>
>> > Cc: Matthew Brost <matthew.brost@intel.com>
>> > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
>>
>> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
>>
>>
>> > ---
>> >   drivers/gpu/drm/xe/xe_vm.c | 4 ++--
>> >   1 file changed, 2 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> > index d17192c8b7de..c5b1694b292f 100644
>> > --- a/drivers/gpu/drm/xe/xe_vm.c
>> > +++ b/drivers/gpu/drm/xe/xe_vm.c
>> > @@ -2692,7 +2692,7 @@ static int vma_lock_and_validate(struct drm_exec
>> > *exec, struct xe_vma *vma,
>> >
>> >   	if (bo) {
>> >   		if (!bo->vm)
>> > -			err = drm_exec_prepare_obj(exec, &bo->ttm.base, 0);
>> > +			err = drm_exec_lock_obj(exec, &bo->ttm.base);
>> >   		if (!err && validate)
>> >   			err = xe_bo_validate(bo, xe_vma_vm(vma), true);
>> >   	}
>> > @@ -2777,7 +2777,7 @@ static int
>> vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
>> >   	struct xe_vma_op *op;
>> >   	int err;
>> >
>> > -	err = drm_exec_prepare_obj(exec, xe_vm_obj(vm), 0);
>> > +	err = drm_exec_lock_obj(exec, xe_vm_obj(vm));
>> >   	if (err)
>> >   		return err;
>> >
