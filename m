Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25161CE7AA5
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 03:04:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6D0710E8A5;
	Fri,  6 Sep 2024 03:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j6XRp4c9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0670410E8A5
 for <Intel-Xe@lists.freedesktop.org>; Fri,  6 Sep 2024 03:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725591873; x=1757127873;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iv6yCZjY6iLFNUI/QH4NGSq8TF/cmNu8zb+ySZ6R6S4=;
 b=j6XRp4c98Zgz5OKJHpRtVKMOvCx5ku0dIAntjtbMCT7OXA83OQBa7Pmi
 US9r69Px463KQ8gJ+aJUhdk73k9hsGrHpdYddCE/PeexGHqKT29aJyImp
 nyR62S3pSpGZqHm62O7iQCWDKupE5MXZBJ6OBU4a+vDZrQOPshU4GuDzD
 Fg7tdwPirAAb7tJNOg+iv5JgIGWgrXmFAXGnGUVTccTyYyjPYobQIb+aZ
 EmzSQVd7yuANrsLWOP38Jxv+QzX3BgeBVICm0rGIyVpkqv9uvhaxQ6eXP
 Wg6/0W7NxZChr4PCtRrKlqIlXfcPrZpeHOoJ61PeaVzSe7Zhhuo32NkGH g==;
X-CSE-ConnectionGUID: udM3kOJmSRWo138ys+FWvA==
X-CSE-MsgGUID: YynCUlxpRi6d9y/xVlRMzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="35694614"
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; d="scan'208";a="35694614"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 20:04:33 -0700
X-CSE-ConnectionGUID: JckYB+MIQLW2oJg4qgleag==
X-CSE-MsgGUID: MN8Wm79tQMCuH4ZpLzX8AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; d="scan'208";a="65813734"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2024 20:04:33 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 20:04:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 20:04:32 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Sep 2024 20:04:32 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Sep 2024 20:04:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VG810zTxjfxx8qK2hPSQ1frVm8p4c1llgdwK9yL7myut69kN9Bd36BTXmsRpjCp27fI4aVGuWh2F5ojEyaB8WDCMcmm5wNfK2m9Btq9FfMPR+7CHRqZrbmZZ6IPXr6EyQtzNWCFiU538Y7Vilvw/9FB/xA9A8VHRUjQKh4dfxW03S3sWwqcMgWq8P1tepJHPsV/bdwEtg/Q6eEr/g6Sa/cMnBJnim2VFYMUU3X+HXPhFHYNMPFGkHm0xPmgh7q6zcQ8OlgcWTQiVbzcgTtFYn0exRS2pyM782DYolM4P+S8nWOsymJ6gOcmH8wRGunDhXKzMvXgTbQi+oDTRm1iKIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1bNfhhH5Qpb5otVzCmAcECaMFZqRkWTZKEwW6NqghEs=;
 b=uDhENSBzIQxEN40JcdmmIZkxiFLTIYcdGz8jJkc08bvE6YaUTisatV8/A5a2/M6p9h+hZriFYHn+Bi059xAXJlL3/b7d+efE1gQzGOJRX59tCU1BWBUcXplisc6y/z5y12VFkZQnCe/xbPUjtwj6Yl3nP0qRuLZJ0aOcPfoUQ9qol0q1FB6UpmRbPhUqf7DU90pnXKf74DG9vMx2btk6QoTAr5xHc2LNxem6VgK9dEhf5IhqSv/LFe8fKnDe46Eyw5aiWsLxSC8XU13bFE2R/MyoFREN1cZ6/MrH4GJicQ4zLIweI7h2ols8q5BQB7sWbknWDg5bJg/YnjjqT+WwNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB7617.namprd11.prod.outlook.com (2603:10b6:a03:4cb::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Fri, 6 Sep
 2024 03:04:29 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 03:04:29 +0000
Date: Thu, 5 Sep 2024 22:04:26 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v7 03/10] drm/xe/devcoredump: Add ASCII85 dump helper
 function
Message-ID: <avsxdhqepybtshgp3zfhdtv2beqaub7mg3nvkj7yws7utc5e5p@44uqzzgz6h3m>
References: <20240905205106.1063091-1-John.C.Harrison@Intel.com>
 <20240905205106.1063091-4-John.C.Harrison@Intel.com>
 <sm6iyfzcaq6vbgytgueqqbjjzjniarulya6xzsuo7gyollceyj@iovrnktwvloq>
 <d80bec85-adfe-4410-ae04-e6bb0f41c764@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <d80bec85-adfe-4410-ae04-e6bb0f41c764@intel.com>
X-ClientProxiedBy: MW3PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:303:2b::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB7617:EE_
X-MS-Office365-Filtering-Correlation-Id: 0998d5db-2992-41bd-9b46-08dcce209fb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XKEFmSbEj3CDlwU8oNe8nR4TD0L05YLW0Kstd1ItFJHWzxNL2rnQgOSk+w1p?=
 =?us-ascii?Q?Cb2lXKGwx6bh8ITDmbRihEvBr8VGZdWZaLgCOOSK54KrawussSnH6RLIYDFD?=
 =?us-ascii?Q?3aQeU3lIpYy9L8YKR/dH4K2sYR9yvo2bA6jT3T29yXKsUKGi5AVV9bf7N6Zy?=
 =?us-ascii?Q?QZWX9e9sSc1l8GQY6onufB/6mks1JjFDj+nzpbepTqB0feU1OQqprgL1a0j5?=
 =?us-ascii?Q?07Cy3L68Jurh0mV4aRZ3DgoKdpozQCvXufCMEF16+9qNwh/lwox8MtX1mnxB?=
 =?us-ascii?Q?cYyHddnOio6tA+C31luupz+GMgE+g5pjOlB9FPFTMQ9h4vJzharUFWTexuCH?=
 =?us-ascii?Q?a/QlC+SoOp/KaLh291tIUY02PJNKnGO4f+XObclXePGg6hoYCk7IlCv48qOm?=
 =?us-ascii?Q?FlssqZQEsaCMz3Vx5SjnwG+NTgvDhmJ+J6v2sxSGOqF4M1VTw70hKgcyGUc/?=
 =?us-ascii?Q?OWUK+faqgvodcFA00zneiVaDCTsQDnlnL+51i4bDnIXXUnMmPTWVEuhdtVaI?=
 =?us-ascii?Q?TtUVoGl4oxmXt1bi/HWGNabkhDoIz/zUGVYLc1AxzaF3cgGW9TGn8nrYJx26?=
 =?us-ascii?Q?kYN7I+nhdS9l8GjIY1uRWgsKa3N62cG/21md8qGbRyv+EaYDnHqBkWu0/QlU?=
 =?us-ascii?Q?6x73AkQGlHe4mlJUlvC8iXLJSBnwJr1ty9vdbY9AMaU4ToPKlFflvrrv53Ah?=
 =?us-ascii?Q?Cqwtzhu665eTEV+RCIQxvwYiTVDcQKnSqfspOAuZJj7TWS5kcD/YrA66p/fQ?=
 =?us-ascii?Q?SmW/JsV5xhPF4kfClaZ8bi/RlZcDqhJuGiWx0Xa7UOg56bE03CxEfR2uGD4j?=
 =?us-ascii?Q?IhySuy/s7D9M+BUuZD6fQXOOqeZ6m7ddeWYzc2rKMxMC4OvQ6PEdVfTogwPM?=
 =?us-ascii?Q?NNKkHeBMKcCDXW2gmbD0zB/EbCxMcXspJsTNP7I05dBsIS05Ii3j+zwNH5K6?=
 =?us-ascii?Q?ApfHbmQNxtHi/HIBoT1ZpuFiJr4dXBmEnETxmd6/mV1rTJoLw4u2IPkDW14J?=
 =?us-ascii?Q?J5LMJQp6i4sYARj/RP0PhTPe1DV9CfjOZqtALl7bS0Nd4nvz0ydK2qN43Jx/?=
 =?us-ascii?Q?LeGIdklJ5uZMbXM7GVWwDWW1aorvpNUWYZQTfCoz3DpqccJ4hce9CMMh3bpi?=
 =?us-ascii?Q?2WneCNCgZQk3/kxVEHqHeR1F8ttoNSkr5FjpNK/rxFsPCKn+wDInlnzHr/A5?=
 =?us-ascii?Q?ye8fYaOeQtea0UNZ/aaLnZt+yeAQpZ/60FjcBXomUtQfzdco42DQ/Uubd7pE?=
 =?us-ascii?Q?jccro+JDB1EgxJhO1DOuq9BG+wIpfBM9JJBDkY1cTnk9LW5D2ltpBOTaLSNS?=
 =?us-ascii?Q?x610nnzxISkyCXtSPrb+MtVLxO+flDE8DVEWdujDw9zyeQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X2rwWcKxw+eioW+5RfG+5MuG4S7dUH03NTADeBj0npWBxbaGxL4Hiy4h0bVr?=
 =?us-ascii?Q?wm0hM2iAKed+tMiDZDJlDvOXdztIR/7guXarXOpLus8Mc+qqvwLcxBYS/RWl?=
 =?us-ascii?Q?5B2vrSOlruh3tnny2RTkmaUtC2lE5l3LMP/sw4PRuAwLI8ZJyJZx4x6dX5Vc?=
 =?us-ascii?Q?dGJbe355gApKgxngcw3Y4qdeVLGKZXPbCgBzB0CToKsjnQo6daGQbEK6hD1L?=
 =?us-ascii?Q?aNAiSYIV+htSJb8P0t34lIes/JYoFX/26UaBLfVH75SIRo7GfsEn+puwsuV/?=
 =?us-ascii?Q?WcD6nZ8URPDBiqOMVy38FJvkL2OtELQixYnGFojAG1EMBVOGvvPQzi1MMUBK?=
 =?us-ascii?Q?6otvEvan3AHrsNncOXfGte2O5X41dvN1RJvIErhrGTkhI9Z3v6T3qZ4E7GrG?=
 =?us-ascii?Q?eazcpIjhfsFq//d9FJVKcwVEiUu9qkVdTL3dgUC1KKPiXcFbN4ATG1Ny/a74?=
 =?us-ascii?Q?mKKgMoBvHefIEIL0U9Vufz7IbSx7wSrSHLuCxvr7/hkr75hlTS/S3LXePzc/?=
 =?us-ascii?Q?6rMb4laRFk5etj1He+ovK9a3gzPz33JBocJEstySP9itEP/AL4P5o9BLlkP+?=
 =?us-ascii?Q?QpBbKStfNfcQZp5DYaNH8zog6hWxt7bLN8Edf04ioYiJ8ncqT2I+Lkbqn5ll?=
 =?us-ascii?Q?1tZvcYhtRdh/D5sC5l99URWJYvtmfGplrMfdv+DASuAwzDdx8b4yEFwlMBm/?=
 =?us-ascii?Q?8kZTYD/QopSQLcE2QyuUsXc0ozjgRXQS/+KQ6nuvxcgzIWrPjDbpjiDBNjwg?=
 =?us-ascii?Q?LSbfuJmdz0F1y+vU1BYxQYW1R/3LoT+Be6E7BXQTYU9p4acrZLIm1JTPhs8Q?=
 =?us-ascii?Q?WIFzLeZqmAGrfM78Knb7lwy/2/Zs8UuZZrkgNaLAhq3S5NF0/ZWwNEhqhmIc?=
 =?us-ascii?Q?MX0v5lWatvNNjJQA6Sv8lQin6ileUVR51d9/d/UEWEhrbbPXoDrZbKsbB+V+?=
 =?us-ascii?Q?q5utyHWs5ynqsVHCnQC0P7+jmBjyeBWjpTtZ8qxthvDuxO8ofU8ToqMIcvwH?=
 =?us-ascii?Q?osfgW0SXtS6ss4il/d+opYsoNBdOho6CZgvEe2v8m2qxtngHvB0cEx7vKTJn?=
 =?us-ascii?Q?vkQz+1xQOkQDjumOPT2KZgZEJ2JKnNKlpbLWC0o6c2/VGm4oea6rnvCIQGij?=
 =?us-ascii?Q?bClZj9WWJrAlYUkE/mpqL8a+DX4XPN9SQYZV3sX77MY/A37gBwOo8m+IJP2o?=
 =?us-ascii?Q?R1MPWQdg/d6bQmmgIy/QFQl3Na+f80+lUELt+Y6ehuM4eH6ErjTSWt40hpF6?=
 =?us-ascii?Q?KFkq9zGqIsuCz7vzW+dxjItV14oiTPRuqbOQt0StfHAqO7FRPiq4WwIGkKkK?=
 =?us-ascii?Q?JaapKbOpIlgiW4hq9CXoT3G2ccOJ0SnNkmpsdkBbs1oUD/FNi+ATANxe0VR9?=
 =?us-ascii?Q?MX+TBnDVDOMxOLWr795eUxPHEc8fXEwToQjwcMk9AP7lCjFQDz2ejNAjf8Ah?=
 =?us-ascii?Q?K3+d88NLsQirv1PXXoC5YOQ+nkuESiiwmn5yjaxw/1tWC0T6EkueQtJu5cOV?=
 =?us-ascii?Q?JnFN2wxafk4ThZXWv+x2PfjpvTJ4rw1cjMawzsbq8oXwqqTyOEWgXqKc6z2i?=
 =?us-ascii?Q?WyJdIfIRnljHL5e5dJq1aFSkXR49jZXae4Kygt/HI97q+7YgGqoLreOWSxbu?=
 =?us-ascii?Q?SA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0998d5db-2992-41bd-9b46-08dcce209fb4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 03:04:29.4965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NhfxgBtq3fYpiwTnV7K/8ZH2cMMJT4nWcv2ahhA1ENM0mqKFbkoi2L/ZKMOKqCRBXmPMbp1K731/UED/dCEKsZShDkP2wKh7k2fuPr2zUB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7617
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

On Thu, Sep 05, 2024 at 07:01:33PM GMT, John Harrison wrote:
>On 9/5/2024 18:54, Lucas De Marchi wrote:
>>On Thu, Sep 05, 2024 at 01:50:58PM GMT, John.C.Harrison@Intel.com wrote:
>>>From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>>There is a need to include the GuC log and other large binary objects
>>>in core dumps and via dmesg. So add a helper for dumping to a printer
>>>function via conversion to ASCII85 encoding.
>>
>>why are we not dumping the binary data directly to devcoredump?
>As per earlier comments, there is a WiFi driver or some such that does 
>exactly that. But all they are dumping is a binary blob.

In your v5 I see you mentioned
drivers/net/wireless/ath/ath10k/coredump.c, but that is a precedence for
including it as is from the device rather converting it to ASCII85 or
something else. It seems odd to do that type of conversion in kernel
space when it could be perfectly done in userspace.

$ git grep ascii85.h
drivers/gpu/drm/i915/i915_gpu_error.c:#include <linux/ascii85.h>
drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:#include <linux/ascii85.h>
drivers/gpu/drm/msm/adreno/adreno_gpu.c:#include <linux/ascii85.h>
drivers/gpu/drm/xe/xe_lrc.c:#include <linux/ascii85.h>
drivers/gpu/drm/xe/xe_vm.c:#include <linux/ascii85.h>

>
>We want the devcoredump file to still be human readable. That won't be 
>the case if you stuff binary data in the middle of it. Most obvious 
>problem - the zeros in the data will terminate your text file at that 
>point. Potentially bigger problem for end users - random fake ANSI 
>codes will destroy your terminal window if you try to cat the file to 
>read it.

Users don't get a coredump and cat it to the terminal.
=(lk%A8`T7AKYH#FD,6++EqOABHUhsG%5H2ARoq#E$/V$Bl7Q+@<5pmBe<q;Bk;0mCj@.3DIal2FD5Q-+E_RBART+X@VfTuGA2/4Dfp.E@3BN0DfB9.+E1b0F(KAV+:8

Lucas De Marchi
