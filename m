Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB20C021A4
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 05:37:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C04C10E14A;
	Wed, 12 Feb 2025 05:37:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QIHp11f5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFED810E14A
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Feb 2025 05:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739338644; x=1770874644;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bCCtGwivhCU0KvccQIoWFlHCsF+sFMnBx4OT70ZQAy4=;
 b=QIHp11f5iY6nd1AjKTEF+7gbXvo+tynB8GI1fLwd8kFwMH1RzirTRj2i
 T+Wm9Qcs/4xvDwMFy2ZBsfJTcvoGVViJfJeNOPfdXyBpVlnp7pbvVQrUC
 aosVRnfS+pHdhDyOvebkjYUrrpg4ZXkCi1StUXFKz5BIYfTIba3B3uVg0
 ouV2DsbOQZEy/UwV3m855+X+ml+wHqLujeweO37Ju88eKnPION4uSB7VN
 1rJr989vuj71AoUIzVQuZPF/nN9WvIXhQObsu56K2bLA9VNGDJ2R4KJtv
 B7RP69hZlKiCAbA0HQhT3blGduHWaoMU3Kpw1L6Fa9w78rL/hU5AZ0HKA w==;
X-CSE-ConnectionGUID: 4uOhUKDSTtShAd/gfUVMBQ==
X-CSE-MsgGUID: 2cj+bWUqSDiZaR/LApzpzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39171701"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="39171701"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 21:37:23 -0800
X-CSE-ConnectionGUID: Ju8LeX2eRCGOy6V80umdKw==
X-CSE-MsgGUID: rWI8byclQ4+OjY5jViH8AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117893090"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Feb 2025 21:37:23 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 21:37:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 21:37:22 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 21:37:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kk+OKFmdr1LcMCaq+yTskT6p4jRQUIiqSn7wrxfn+BjM6gZhBoBZ4VKJ3N9nYMfIlcRZpD2tt2W0LAnZOscDWDeuO+M9mPvgDs4wVQQHy+sGeweNMW6b1YsKPOXZMBwGJ/6X5j9/1asuugf1VrZoH8a9jXoT7cSM2kvcwROTYUHL0d58hcMOWtvM5UViNK5mPrzs3Hms0vRoCnQaQt4//7KFvI2RuetVGxrMdYxP//oCxm7cuuR/Tw57S8M5OpH44JIZisy8IUayP1JWRn2cbH5V93kyBQJ1RlopIIKrjmFW3AXCUvMDCb0+ZDrLj57kpuCea1FxZCYJRdC8oZ0mdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bGPQe3vAHQpVqidswqbuPdmmNH72ac0M1j1re8CnB8o=;
 b=SJBmdGf7PoahzgCyw5I+NwaE10aEWzjbo5ZBhDBCb3myXZGb38r7c+9oo4XNM5UQshCswvM5+dyskljU46uazDk5XvFfpQ3LRaUQ7g+CmtM/qX8Ki43ckY+Zokv3w4iTkN2f6tTNroYtPMC/dnUxEJsmce3io9vznZp3KpymJCF0sAgHObt+viXB0qhjL12TjjzNFD+ktK2jmjIB4og1m9SW491unJh92q9BI5/SHZVaj6s/KoxwUV6GASdv94bTc2seR6MqCUwFK9TlpzvJLEOd0utMYfNI6/v634nS7AveGuqJJ/F1Qur0+TjHYA+YbVJQc/O/NSkVupnnyq1DlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB4830.namprd11.prod.outlook.com (2603:10b6:a03:2d7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Wed, 12 Feb
 2025 05:37:18 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8445.008; Wed, 12 Feb 2025
 05:37:18 +0000
Date: Tue, 11 Feb 2025 23:37:12 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <niranjana.vishwanathapura@intel.com>,
 <ayaz.siddiqui@intel.com>, <tomasz.mistat@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe: Add per-engine pagefault and reset counts
Message-ID: <ywxrqrblg4fmyhpxluq46fdgyd6c3pol5ic5u5emehybvypmho@fs5jajwfogtp>
References: <20250210193657.96030-1-jonathan.cavitt@intel.com>
 <Z6u2uH9hkHyJ5kP4@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Z6u2uH9hkHyJ5kP4@intel.com>
X-ClientProxiedBy: MW4P220CA0005.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB4830:EE_
X-MS-Office365-Filtering-Correlation-Id: 253710bd-7904-4872-0514-08dd4b2750a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gKTCBnXMYwCWDDA91pqdv4wh7iO/zNAJel8OV849zQYrueG+BLzAVoE9tZ1U?=
 =?us-ascii?Q?veO30Vgs9VgYqg7QZR/Z52TFUxXJqr7lWD/zqleuHzTUPscdAiUCnNzqp5v6?=
 =?us-ascii?Q?SmAC8sv9VZr7OTBiJWpd5qChsPP8WN5usNE2vhd11v0itti8DQqI+pohe1QO?=
 =?us-ascii?Q?+0UXQtM9NpJV9io3KfFNovhfzF/iNB0HlDHlA1dKcxd+pJHOfAqdwIhLmplO?=
 =?us-ascii?Q?Y+TsCySIXqD5tF8Gz/q6WJZ2Tu4k4k/m9sJpqgF/FQjm6SHy12J6DVNCuFYr?=
 =?us-ascii?Q?pE3iDiKQzCK58FsOMXuB9f+WcCEY6piUwPbaWBIcCxkzbEpdVl2oxrjah1Wc?=
 =?us-ascii?Q?mSrJ/TAbPAZPzq+vZ9vdLBDJMHZl5eJy5nLv5i4bDFhqunxG6O8/y6EUOIsM?=
 =?us-ascii?Q?nXF7D7y1ttjFnpEpLUKIAybKm5z9CKoDcA9rcFaRM2EbQPZBU1RF954RFkKu?=
 =?us-ascii?Q?4F4Qg4619AEFa/X9d4iLB3H8OVg8YSbDcnFV8fYstOrhTY4mMnjh0qvqXOt5?=
 =?us-ascii?Q?RF7nP/YW2TVeYuIGKABlSQdwhRq9TvFAOCKIP2LwZIvbsdiS8n+2hbbJVk3L?=
 =?us-ascii?Q?vEr0uAOJ1KFpI+GP5NItkd+2Qb1nFWGNhYg+BoXOv7IkAgK+4w7bO/imnV/C?=
 =?us-ascii?Q?m22ZL3EKu8F58puoZlEik23EtEBAd3yzNS4V2peSUJAjZVmqaeWBPwvQsgfm?=
 =?us-ascii?Q?Di3WK9sezFNJvYdRSO+25HlFxojIWv540X++YTWp584guWzmzNZxmDoHY3c4?=
 =?us-ascii?Q?sNM1sTm9QO4QaOX2hVuKWq+42jVWbMdKLhFZ3MjlI/N+Zgxl48CUOS64P3v3?=
 =?us-ascii?Q?4RFr8vetmnL+AcEd/wN7+9CCemvreeBofBK7VR/v5n4SpF7WiVnM9OL53jkV?=
 =?us-ascii?Q?ssdHa747sCCEdmBHc6EwUTF+wOk0fzjnF/LfbnYMyv2wD0QkTHDwhE3wqIbC?=
 =?us-ascii?Q?Wr1TGyHxx8H136//B4UiwlenJbvb2Dhwngp55isFoP19pOa9b8rSv2KIACKr?=
 =?us-ascii?Q?dTWEoKkAYoxmWlpSKtM5dH+nMK1Gm39N25mvE0kGfJNAIbapoezfW3xs6vYl?=
 =?us-ascii?Q?UhI9Qq7YUN6u0VRpMPFU/nRiLbuuRqc+PvAnrl8VAlwEFmKVmirB67Tm+UDK?=
 =?us-ascii?Q?xruMNQfpU2Pqs60FklZsfum8pt8xDwTaiYd97brQ14hhtFMLpCFQ2yjOXLr2?=
 =?us-ascii?Q?LXQ78axAE+KxoTKb2Rg0hUUug9kpte3Ie0r01F+2BieRqytEDGn7x8UOb+zN?=
 =?us-ascii?Q?5EJvqfRHp/4avFy1DZhwYGdi4PoATnLYoTABeD00U6LX0st7HZPhi0QAJaXx?=
 =?us-ascii?Q?5w+1OFicEkaTpKaPFuwlSi1kId3egOjCbkXPB5czR8Z6hD4053/XzSQsxN2a?=
 =?us-ascii?Q?g5PM/QzukRGOtMBRq5qmbEC99Xuz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NDfTqdNgU2Jw8eKJ8P02K2SpK4IXTlu/pTj5R0beN3fseSTxG2WCQF9road6?=
 =?us-ascii?Q?gm7xq0uQmCr8aL3xtrQJkpgpkn3TGtOCqIdsV6O8B+6Hk20N6Fa9H1bqEEJI?=
 =?us-ascii?Q?kA+M0JEweDpY9ZWaEZ6X/jWhVYVur2+2MfPFN796WHtvge8tZyhB1zrJwd8G?=
 =?us-ascii?Q?EtuXDKIKN1N6AAYQ3L/nl2sUydJuzpB1b0wgCt3SLxyedK5yo2KYrobakIx4?=
 =?us-ascii?Q?QrhbIDUNdkXrDQq72dEU535ua7IadCJtTVfC9yC8RDUe3MntJ9kdfQ5HrfDJ?=
 =?us-ascii?Q?4zqyNugQ1diZWTDoeS6tgEDOWz0P/0ns2A7U8D/CaoMf1vwIJtitH3nxdEFz?=
 =?us-ascii?Q?j2bOfutXSmeNa49JRqJDfQRPpWt78r/30NR8CuwS6hRJMpIoYmokg2/KeYO6?=
 =?us-ascii?Q?k/nwA4YHcV+sLhq3aYvFDNPWvlI8i2efB+C5Tacl8ODRJFiwd1/mQss24hMV?=
 =?us-ascii?Q?HAztYRjFR7coAk9I8rOaMsusQQRAIofJqQcb3vat/bGCIehaBK+gOkkc0O5p?=
 =?us-ascii?Q?wfPqteAbXnmJOXEF3RiDbUXty71gaup/wpT5HwNtfcabsqqh8Irz3AUgyzUR?=
 =?us-ascii?Q?8cNyIRBSFRxd6zUWhyYDZPxIjpiUdwapeJyzqCJtwqnNYUS+7PnkcEA0Mmfw?=
 =?us-ascii?Q?CCQxibvqv7ZL5CMufyLAeQwHAB2AVz9E6u6XOIllNzpqzX0NzZetX4AGixXr?=
 =?us-ascii?Q?F78BwBcrA9UGT2iGdhOTTlf+X9x/6ISSC44p0LM3xL7rIvmcGs5pulIJ+ras?=
 =?us-ascii?Q?10XPo9JMH0GzQ2pNfSK/l9xkL1JvfEoNGuHNG/LUbxCBwokBJYTcoSXYPHzV?=
 =?us-ascii?Q?7DfIkVN4oTaGqwkKygHr3fivJLwcWY+rPdxFxLELhRNZxedULUiOsmMqtcVR?=
 =?us-ascii?Q?k40zVKEAGnIBDlFy5uMprzhyYBPx4RUuanmk3R/VtfytGMC8bpRxyZI5pOdJ?=
 =?us-ascii?Q?yIiIfHuCUzs9JiM+Hf8lAI1lDETBvc6PKDMhXWu0+Gv0VbmraAyk8NlBMHzV?=
 =?us-ascii?Q?2CM3WRjF9kobyMXCQr3FLSkNk6m4DLDsZZExDkxg/RRhFVOKW9mxpziG2I/m?=
 =?us-ascii?Q?/YH9rQmZgBxSUhCqDDCrVLkrz63KS9BfW1cS+wbB1k4P06VZcc5kNXGRSuPc?=
 =?us-ascii?Q?m0eot8RuZwA/GB7ILrgClMDsxiyGaYkDQvq+7DdNP0TTQPjb/RMKODccmCXv?=
 =?us-ascii?Q?YxThj4CDdI+4TEpYPxUyMpyQvP46fz2a7jhP/B9KDVBnazsuc9vWSaubooED?=
 =?us-ascii?Q?KZJBIrJWFOc2YvgJ3ugba3ltmS9MW7Nf/w+v5hwIF5xNgEacKYCP79q5aQMJ?=
 =?us-ascii?Q?YKlb63z6fWmOoSIF8QyCIKhTE9oBkGt6ke1XdIAWWC8FafE+71to01NlBIPO?=
 =?us-ascii?Q?7qQmad9oei7/NU/6AKbVeam1YnxCTz/fQSIAuyxBPH/R4PPZeOsqv6ttjtG2?=
 =?us-ascii?Q?W3q8I4gP2ymWsrLWe1d5EqHYfpMxEfSOGMnit0LWzoYghWxQq4w+/lqRoDC5?=
 =?us-ascii?Q?mj82kqjhekkjDVWb+Bo+Qg9T/avBxr9lbAKrvc9Yw2ino0bhglH1EtDlOlam?=
 =?us-ascii?Q?Qpm18qen81JSUmU3C4S6wYjKqftQC2bE6cErym529mSl7I8Uq0DZQer5afeo?=
 =?us-ascii?Q?lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 253710bd-7904-4872-0514-08dd4b2750a2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 05:37:18.7148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X7jDAOQpfLvEAMFZyjuHCrF8JMWrXA8fT7krMQmzUx1QtphUCiphGUuo5Ep70lNEqwA45rAjZUOP2/e5Bcv0jlbfhPeNRHRDOEBH+lkn7aU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4830
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

On Tue, Feb 11, 2025 at 03:44:40PM -0500, Rodrigo Vivi wrote:
>On Mon, Feb 10, 2025 at 07:36:57PM +0000, Jonathan Cavitt wrote:
>> Add counters to all engines that count the number of pagefaults and
>> engine resets that have been triggered on them.  Report these values
>> during an engine reset.
>
>My fear is that later someone start using this as some form of metric.
>
>Could we keep this behind a debug config?
>
>>
>> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> CC: Tomasz Mistat <tomasz.mistat@intel.com>
>> CC: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
>> CC: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt_pagefault.c    | 6 ++++++
>>  drivers/gpu/drm/xe/xe_guc_submit.c      | 9 +++++++--
>>  drivers/gpu/drm/xe/xe_hw_engine.c       | 3 +++
>>  drivers/gpu/drm/xe/xe_hw_engine_types.h | 4 ++++
>>  4 files changed, 20 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> index 46701ca11ce0..04e973b20019 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> @@ -130,6 +130,7 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct pagefault *pf,
>>  {
>>  	struct xe_vm *vm = xe_vma_vm(vma);
>>  	struct xe_tile *tile = gt_to_tile(gt);
>> +	struct xe_hw_engine *hwe = NULL;
>>  	struct drm_exec exec;
>>  	struct dma_fence *fence;
>>  	ktime_t end = 0;
>> @@ -140,6 +141,11 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct pagefault *pf,
>>  	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_BYTES, xe_vma_size(vma));
>>
>>  	trace_xe_vma_pagefault(vma);
>> +
>> +	hwe = xe_gt_hw_engine(gt, pf->engine_class, pf->engine_instance, false);
>> +	if (hwe)
>> +		atomic_inc(&hwe->pagefault_count);
>> +
>>  	atomic = access_is_atomic(pf->access_type);
>>
>>  	/* Check if VMA is valid */
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 913c74d6e2ae..6f5d74340319 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -1972,6 +1972,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>  {
>>  	struct xe_gt *gt = guc_to_gt(guc);
>>  	struct xe_exec_queue *q;
>> +	struct xe_hw_engine *hwe;
>>  	u32 guc_id;
>>
>>  	if (unlikely(len < 1))
>> @@ -1983,8 +1984,12 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>  	if (unlikely(!q))
>>  		return -EPROTO;
>>
>> -	xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
>> -		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
>> +	hwe = q->hwe;
>> +	atomic_inc(&hwe->reset_count);
>> +
>> +	xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d, pagefault_count=%u, reset_count=%u",

I don't think the message was accurate here about being an engine reset
and this is probably making it worse. +Matthew Brost

In any case, instead of polluting this, what about printing the counter
under the "stats" file in debugfs?

Lucas De Marchi


>> +		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id,
>> +		   atomic_read(&hwe->pagefault_count), atomic_read(&hwe->reset_count));
>>
>>  	trace_xe_exec_queue_reset(q);
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>> index fc447751fe78..0be6c38fe2a4 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> @@ -516,6 +516,9 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>>  	hwe->fence_irq = &gt->fence_irq[info->class];
>>  	hwe->engine_id = id;
>>
>> +	atomic_set(&hwe->pagefault_count, 0);
>> +	atomic_set(&hwe->reset_count, 0);
>> +
>>  	hwe->eclass = &gt->eclass[hwe->class];
>>  	if (!hwe->eclass->sched_props.job_timeout_ms) {
>>  		hwe->eclass->sched_props.job_timeout_ms = 5 * 1000;
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>> index e4191a7a2c31..635dc3da6523 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>> @@ -150,6 +150,10 @@ struct xe_hw_engine {
>>  	struct xe_oa_unit *oa_unit;
>>  	/** @hw_engine_group: the group of hw engines this one belongs to */
>>  	struct xe_hw_engine_group *hw_engine_group;
>> +	/** @pagefault_count: number of pagefaults associated with this engine */
>> +	atomic_t pagefault_count;
>> +	/** @reset_count: number of engine resets associated with this engine */
>> +	atomic_t reset_count;
>>  };
>>
>>  enum xe_hw_engine_snapshot_source_id {
>> --
>> 2.43.0
>>
