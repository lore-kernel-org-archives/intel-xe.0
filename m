Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C8BC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 21:59:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3450610EBB8;
	Thu, 11 Jul 2024 21:59:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KBtllHA0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4933210EBB8
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 21:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720735148; x=1752271148;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Sg87xlzDMyss8jGmtHssTj/KEqAV0yb9q9cVU0w7JP0=;
 b=KBtllHA0DLK2OoOKSY3Oh4vAeTo2FzG+BZzrq5sZS2LuMQNZbhrFcBxe
 MOZMbePTOzr5aTgxuQnLn2pOL3GC2YKfIL/JH2RJLpJjzaOcNWshOxhR2
 /qnbTJNJ4dL6VBgepOkCu/27L+x8fnHmcD0qNujcyVctrDu71HlPRjQBD
 00weaPGzqZVpXvY4kbMlHrpiLjrLDv7ymhsi/7BVKh410asHN06P1Lbcy
 7IBbY5GYzeUbP4tZp50GbGFzhmDv+lvvPGP39jXBKz5h/TL7ZsWxwafQ6
 Vq+2F/jKQCUXJichX06v2pPJFjeRKH16zoY+6o+KGxXNK4+Qm1GWRhTic w==;
X-CSE-ConnectionGUID: uXCLxVRnSnW6Wdm6BgYEtQ==
X-CSE-MsgGUID: R4vV10/TTjO+7330FD+Wnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18300732"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="18300732"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 14:59:08 -0700
X-CSE-ConnectionGUID: Bbnw/2wNQqecQh9M+YHpcQ==
X-CSE-MsgGUID: z9oqf4FxTuCU+9RD6OfQ2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="48795705"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 14:59:08 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 14:59:07 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 14:59:06 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 14:59:06 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 14:59:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OcAwthQkQuosuqTFB+qdHjtIn2UFEBwULtVORFNlu8b+M/T10h0naly2eF4gXbUIeYU9YyoSEmJb9wLBJXqD8YMZ8Pe/T2gfT2rck6cY+odCTlNaPgApzYYiFqKNbphEGyMP7hdDiFGuBKJ8HIZ4Gzkp5np5Y3cT2Kk4R4fjsLSIKRK8npjSqnLFci5zKPuQKPUXuXGH/0EBeUXgoXODWAQsM1dGyTKPhAOjOjI4n5Mp63O+bsTA+eYkDLdIm/MaBdRgkUSsDOMx5dQ5ICqB2JuPgkTtUCxebG+8+fsu/RSsZDgROZVR0N55T7/T05PcXXI6etHT8rqOS+oJsMkbbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sg87xlzDMyss8jGmtHssTj/KEqAV0yb9q9cVU0w7JP0=;
 b=GlmDZZtgQnUyhW3CM0C1693Zawud7sn5cSwNm1MuVWGR2nVFb6dxtzbYWTgznvDST5kQt84rJ0PwGn0gUWt3zC30nBRsz4kz1u5vfuWRrlnYgfOCILQgObdBQEdpToPSNVRspErYXOvcChDbGYkueR5MKS9wtWSbJK3aKw4SI1odKmZ1SKNCVBkeEP4FJhOMVGJj8FdvM0pkgRYBGSpuTo7HM3dHhCcsc44pIA4YXfW7qeM59Qln3SOqzt5sZ1QrTK6DdtkhluqfLxUqui/nrAOLTj2zjfSPCggPtBtTKREF95+2dLwwsoIq7ghnYkw1VScrhePNFL5b0laM+/YSeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB8292.namprd11.prod.outlook.com (2603:10b6:303:20c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.33; Thu, 11 Jul
 2024 21:59:04 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7762.020; Thu, 11 Jul 2024
 21:59:04 +0000
Date: Thu, 11 Jul 2024 16:59:00 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Subject: Re: [PATCH 4/4] drm/xe/kunit: Simplify xe_mocs live tests code layout
Message-ID: <up2v6esf5iyvkfioj7ciswvfw4myfm4ozlg5hl7i523lfi24th@zo4o35stqqqp>
References: <20240708111210.1154-1-michal.wajdeczko@intel.com>
 <20240708111210.1154-5-michal.wajdeczko@intel.com>
 <e4nrt3j4tq7tuoz3umqcyodyahdgevcf3rggysn72f7kcapdqs@ds7vo4t5gb2b>
 <MW3PR11MB4748C172CF07100F2CE9DE6CAEA42@MW3PR11MB4748.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <MW3PR11MB4748C172CF07100F2CE9DE6CAEA42@MW3PR11MB4748.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR03CA0204.namprd03.prod.outlook.com
 (2603:10b6:303:b8::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB8292:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f5e5584-e40b-4ab6-1617-08dca1f4adb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bDlu78lHpWyPFLJG58VFOovl92bqo0cVnONn4wZ0hmVYG+34hhwnRDp9f9og?=
 =?us-ascii?Q?PGJCtpvrDRwKshbyiqpW0jaieUf9YywA97DdImsQrQnlGHcZx4qtRYIS7BiK?=
 =?us-ascii?Q?pCECR7j+afMBnUVP5ia6fDvchESMH5+r8pddVg07xKLe8+xBhxmQX0LtvZPH?=
 =?us-ascii?Q?I6zMXj2Ulq3ZsB58fTRDNPTSdvWcd7Wc3hE/y8OY1U9tEWJpJ+yeB5Qgl6GY?=
 =?us-ascii?Q?pqik6nccrsev5jOaXY1ISC89hB2e8bKhabRvN525V6Lf9lPDQBRZgYiwTwPb?=
 =?us-ascii?Q?E8XM0sXLvLHG8wljujK3rPT9ICQIksbKsiBqEJCqbYxAgaoiu9WSd2fWXC1e?=
 =?us-ascii?Q?2z2d5t2oQy+tvRRldvAcKNjKsoQUreqG+1SRjvCb1U1QhSKo7vLnp+hsFFjc?=
 =?us-ascii?Q?iN8IvtgLuCmPUlzlcUM3i8/Z1qzWh5N6snt4VZQN/yZQycaWk3sEjBJ/oR3d?=
 =?us-ascii?Q?qFvMKsx5nU6DIuS23K9hgMkBjuhKlif2x/0Pg8qZ5dQTOocx9m3FCp5ouf/s?=
 =?us-ascii?Q?eTL1VgCuOU/POHrx3LHv7jIIa3YMWxTHYgHx6G9Y/yRsZXOPWnsZk5G/SuGs?=
 =?us-ascii?Q?e5T4yZocBw3mtKMHz7yObQ6H6BrIpfAbWuelG2Qfc5W7EfYPcHzMBhxW2olE?=
 =?us-ascii?Q?9rCxt/w93fuT7QzRF69ZmcRFXL39IZrYIs3znLRZS0/AmUFNFtr/kE8WW2bA?=
 =?us-ascii?Q?oLrPJAD0kn6/T6PBqWwt4ghwymkh3s/c2uUDMbuURDUkSoigYfEn4BquaMUC?=
 =?us-ascii?Q?JmVWn8NOcNyJc0boRslmAc11ILeq9kKWXDYmc9hFso3TY5OzWhJe7Paxfj8X?=
 =?us-ascii?Q?+ir1E702hCFqlDh/qz5MmF4vYc8dtAzqNG2nh9JgFGcBOE1YfXfZsf+niDXj?=
 =?us-ascii?Q?LZsqgg1pzDe2RN7zA8mYjXsiQJ12qQlm/F27ApRer2xnia+I9Kc6eCrzQInO?=
 =?us-ascii?Q?ZDSe03PzTTqYJCHzrVAkxnd91q/TVeuzoq9Lcv2QgNMK9Q8mrHESWXtzQ9B2?=
 =?us-ascii?Q?NHxMeLh5WmdIXyXNIwfZqx1VKNXT9aO99kJqPRt81ptQ2TPKy9WCE3kl+4b5?=
 =?us-ascii?Q?UdqzmULlgeGu5ve6WCOx5kWiJs5TW2soph37G+JSFIdn/rgQXa/malW7ojHW?=
 =?us-ascii?Q?V9p0GwY35xAjtvFiBLvnthdB7OhS+NlBYwJ/zSsO3Pv9S6BOi9f5qUwIFp6J?=
 =?us-ascii?Q?/CbKDiWsIaMpO6yjLB0T9Kg3HtW8+8Pi9O7Rj2DFAFeKxFiiFDZVcoys3rTS?=
 =?us-ascii?Q?1G9AMEWqaKpkCLwuPS5HqQu8cos1HHj3e12kp3eC7C6oaqy/25lfodgbIiQU?=
 =?us-ascii?Q?Tj1h9x8WwgyV+qX6k0qpIEmzOnnYQyblF+wAHkH9d3Kh9Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SYJ6B2UNfUz0IP/sw8O0a0s65Iu3IQxqwW2j3eGAl27IwxPenYg/9dV5uYjo?=
 =?us-ascii?Q?njWt5RHFKoezFtnC65yj6au2QdMwIPS9frjKl/TZTNkjfLyRX5WnYFJkWjVB?=
 =?us-ascii?Q?EGK4JS9DTXlYpRzEgZeWcVGFReXMbXXAkl0vPpisBk2xJV4S1VYaCg8JCnfR?=
 =?us-ascii?Q?0ZG6mlpqfm96A0S2vARSbcHPW1p3pDkvP5zaml7H02iiXT8/okcTvnjFBF0T?=
 =?us-ascii?Q?/R83YO2bFBGspCc3iLqPCUPzpgBWRQi8hFRFUkRXqP1sJmSuXjl9CAuIBlmc?=
 =?us-ascii?Q?KGdbqSy0PVQ44Zg3QkJKmBdbsoqyAs7ddCOO3IiLfUJzzhwoAc0oSdkEDMyL?=
 =?us-ascii?Q?daEeR3T0g49Owpb7zPD6RCSiQqfBT7LZ2YzBCu8vzBge2v9xRqJyrEPGB+3/?=
 =?us-ascii?Q?UM/2/MnuxBYdF3g0N1BFppevmqdQS96GxwGIFUF195qhcs2FdgK5vArME4KP?=
 =?us-ascii?Q?hYg5LGovRohL9HtuEDGha9s097NtX/0F6IN7PLbYd1qJmjTz8quSNzuNzRWN?=
 =?us-ascii?Q?G5d+F7fFgvDxpy09CWpfFLt7+U4ju66kzY5nBuzxRV03QwqKqsVBq++R0hiv?=
 =?us-ascii?Q?BW+x+mrpujK7TBEBZ9G9c2DUfsLE1Eg8NOrgLF5ezjlFVRj9GxPSLkctbaPT?=
 =?us-ascii?Q?s4oJPcVPC0SkjAG+Oais/hshKFA1VdwAkOMb4rPgAF3CkNrEDOEeoXfE24yQ?=
 =?us-ascii?Q?9JiZ4ziKAAKARnmcO2XhCQS5pxTRNcqfKqKE5pX+/5KPosIhJEYpqmg6Znb/?=
 =?us-ascii?Q?wEvrHg9vygissEud0rzA5aJdXdLS9TG9fQeWt+A0PXwtLj7tcaY2f/vng0x7?=
 =?us-ascii?Q?IdaltuZdRbp+QcDJuwu7vZaeYr+aV17qZvoucuLPF8PyroPUn9IFBjAE2He1?=
 =?us-ascii?Q?KLAGE7q3pcnoOh7gNis8pBQHCqLEA76PMoRgdzoDSvoBg4JD6c6ZwmGqXdPj?=
 =?us-ascii?Q?3lQHEqq9WiPtSGx3TdoSOBSxX9K3CCc4SLPZKerKjUeBu5gDgUpYGRM7YMET?=
 =?us-ascii?Q?p4xDXT0LH9ZfAZ9pL2ZC4pQfKtStOLIfA9506cii74XFOo9GR2sBYrseyzBB?=
 =?us-ascii?Q?hrlTxlA0txTVb38PK0Pu9mUPGVgk5kdHwpPDwrUhuRbW6UqzIPONO/teniL9?=
 =?us-ascii?Q?bpe2ECoyr1CnNNm+gWcM1j0l3sU8+0e85uId6M0Hinv/fQXs6qGZFZKbsizL?=
 =?us-ascii?Q?rvEGBa+G9UeC5/+tpx81u5HIVdc+QQgrXl2gd8zLuUsGSX4rvehhI3Uu9Q9f?=
 =?us-ascii?Q?y2a6DUuHvTPRiUfbHCpd5KK2xGVdUokEuFAllcYm0Xhe1HczY41cte02c7OE?=
 =?us-ascii?Q?q0eBYDDKegJxlme1NzuBzffjXopuT7EXWgeJ54B+BB5XR/uJ3I1e1nmCgm6K?=
 =?us-ascii?Q?e0VB9PQ3pMmaC+qBHu6HIxmHQPKKU35iWud92ucAx9tWHAwNHYeUagKGYv+b?=
 =?us-ascii?Q?KKr/K5ZGpSlkwUZL9MJKeN5l5YETpSoow/9ng1j2aisJxg5Iu8c6z12mmICW?=
 =?us-ascii?Q?YptxYKqA128qsth6tE5HmVCky5EuU2jhYqQfzKd8uAvM22jKyC0v0iumY/9B?=
 =?us-ascii?Q?lgZJhJi1lF1sSxVDSDbOl5ka97D2Gr3ZMkswmIu6/i9cTZh9h/ap0IJkIQpU?=
 =?us-ascii?Q?rQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f5e5584-e40b-4ab6-1617-08dca1f4adb8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 21:59:04.0020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7AZ1RdJuKvW5/LPbZjkS40hCQtiJ64co/PFjjAA5Xt0YGZj7wOwSAjYuqci+ev+VbxC6GXCuvID1zRzGdqsI7Dkkb4k4ftBDtyKz5NWl6ec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8292
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

On Wed, Jul 10, 2024 at 08:03:10PM GMT, Kumar, Janga Rahul wrote:
>
>
>> -----Original Message-----
>> From: De Marchi, Lucas <lucas.demarchi@intel.com>
>> Sent: Tuesday, July 9, 2024 8:22 PM
>> To: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
>> Cc: intel-xe@lists.freedesktop.org; Kumar, Janga Rahul
>> <janga.rahul.kumar@intel.com>; Roper, Matthew D
>> <matthew.d.roper@intel.com>
>> Subject: Re: [PATCH 4/4] drm/xe/kunit: Simplify xe_mocs live tests code layout
>>
>> On Mon, Jul 08, 2024 at 01:12:10PM GMT, Michal Wajdeczko wrote:
>> >The test case logic is implemented by the functions compiled as part of
>> >the core Xe driver module and then exported to build and register the
>> >test suite in the live test module.
>> >
>> >But we don't need to export individual test case functions, we may just
>> >export the entire test suite. And we don't need to register this test
>> >suite in a separate file, it can be done in the main file of the live
>> >test module.
>> >
>> >Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>
>> +Matt Roper, +Janga
>>
>> We ended up implementing the mocs tests on the igt side that can test
>> additional things like keeping the values across reset. Is there any additional
>> value in keeping the kunit live version?
>Mocs Reset IGT tests are not yet added. I will be working to add those igt tests.
>Once added will remove these live tests. Till then we need these tests to be running.

fair enough, then this patch is


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
