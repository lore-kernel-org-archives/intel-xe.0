Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150E5C83F1B
	for <intel-xe@archiver.kernel.org>; Mon, 14 Jul 2025 15:04:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD2A810E0BB;
	Mon, 14 Jul 2025 15:04:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O0/HPzh8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F9B10E0BB
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Jul 2025 15:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752505443; x=1784041443;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HwoI8ix53pLGb/y8acBJXK3EihKGYwEBBEVVQIwBisk=;
 b=O0/HPzh8QeEzGbjBkM6ae6aE1KXQ+yEAj0enKVIFXKDXQf+FrPm3FHwB
 GBfcweLLrG3M0D2wfgo0ssCyctn2OYA3HG8Lk8iNsn6t1dr+t1ZoyuSqE
 OU8GgFEwNihsmzx/BAScLwWDJcTV2lG5hfacFiNCqMrOH7cggwdv2kAdn
 nN6N0xVmCKCou5TdI9xliL4ZmbGdbnKDvnQUnutjYEpsuKjOaF9jNnVqO
 /cfFW3CNfPwJxsdpA12lv8dwpkWGrs1XMmIKbY4hC6BLYnEGiUyofWFhj
 TxUESmmPr0SEdY8yzIcLlgX1aIu3fZriNX+p1FKkF4v7orkOO2rFDxrcU A==;
X-CSE-ConnectionGUID: lYp6Dy2FTaSCHfZLhUTh4Q==
X-CSE-MsgGUID: 6GothSDWS5KmbThAARRdyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54790544"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="54790544"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 08:04:01 -0700
X-CSE-ConnectionGUID: Dj0YNkjASry3mz2jlPjiGw==
X-CSE-MsgGUID: ZCKMMsA0SzmGzUC5eUd8Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="156367489"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 08:04:00 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 08:04:00 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 14 Jul 2025 08:04:00 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.65)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 08:03:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZCyXnrVdhhwAiffESIia1OVfBBCjagAn4aY0ProhZ0bMvVF28O2auPAXAb9CmeBdPei3ouzTkaVDgMIeiCQN32k0J4ssAoJzRT+uzaVxOeAEBMncK6kOocB7/jUfttTVHVdjq302dEsIk17g+LXjuOuGDUk4G6kFd0226a897Ggd/ODf5nK5HICyC4uzGzGCygchzJ1r4/+iQzbjv0l7UgJco4mBcqrzsV/nZZGbhzP5A/wPCmUbAfOsbTJ0D4oA1ARdCJMY+LtmabAEjg/Zb/C5y8IxDPxodpcV0wkXOB3chCQ2QXWM2s6lUHMZCpW8U12a/Pp2KwEmt0s1cOo7ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aqkRUgAEX+MZq72Fkmawk3gNYnatYARo+RqLW42mK5Y=;
 b=nTVGva5YLr+5lT8qPFGNC3lHNVi7xcBv59HIgYGEhYpI2TdPY3OfTnV5MxfpX85r6G99VGiUbQ5FsPg6KzblfmHUWGcy6X0ktF50WKZMZkVuH5QH99QSRhwUqBMwIzkRl4yIPymSEQPl4NVwp0k+UUczRNTRgjRb9ojbrYXlaim6eSv65C4/2CrQbSRXak6cBCnogBnQJdxdgTK3k9EXHDVzLs4AdwVI7GZCGbEPNAGYP7z3jsmBKYrRRXAGXKr72pEy1UAMuF5i9oi7rqmzHfoBggAhKoKR+Bpc+RN0Kbvw6NQ9K8DhBe+dp9yzS63ApC5oucxObT9TYGfMuFtIiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB5091.namprd11.prod.outlook.com (2603:10b6:303:6c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Mon, 14 Jul
 2025 15:03:06 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8922.028; Mon, 14 Jul 2025
 15:03:06 +0000
Date: Mon, 14 Jul 2025 10:03:03 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Atwood, Matthew S" <matthew.s.atwood@intel.com>
Subject: Re: [PATCH] drm/xe: Fix missing kernel-doc
Message-ID: <fow33gjpn6xkj6cba7eiogyswqnrp4pgfrxohc7bob2kquuzj7@lfqodviywtmx>
References: <20250711214911.2009714-2-lucas.demarchi@intel.com>
 <CH0PR11MB5444576BBA4AB83532308C8DE54BA@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <CH0PR11MB5444576BBA4AB83532308C8DE54BA@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB5091:EE_
X-MS-Office365-Filtering-Correlation-Id: 00d0f384-a8c4-45ac-e699-08ddc2e78994
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|27256017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Q24hgJkKC0EIiiE0UAP0w7YZZuYkAEeaXmecEOd+Tb1kfgcBdio84zCRN5GO?=
 =?us-ascii?Q?KONXCQ3ZE0ywSRem+grnddsCCEW3yIChD+LO59331q4xsnvzR4z8dBHtvODv?=
 =?us-ascii?Q?Q7QOiYT4qeS4mTcIf+iR9Xa67SQ9SDV6vjz5MZjIs4KCAoscQ30Scy4DhsJb?=
 =?us-ascii?Q?H5djokW10OnY9pp5y+c/zjcgDVqxPRbTO2gqQET9lJEvzGWxZbVNTP0FnLgU?=
 =?us-ascii?Q?iGZV7Td5GBQUU1J8RayGs3kolU3uIO5T8XeqRlBFP2HPOL2Q5jSFAHhdF2to?=
 =?us-ascii?Q?fXMvGN1d2xgs9g1f3bv4BLpXOl8bZ5TAaISeBAFbpysZhsWAj8mOWfFbLPeN?=
 =?us-ascii?Q?LP1GFTSXocgUYoMPcK0DGBf8RT3ifuKKrS5aRILtY4HRXm8LnLd+uaSBJVhd?=
 =?us-ascii?Q?x0xONhlClbwRQBE3p9HUbMt+K3MH/0DHHuVsY2iatFXmXRl6fvp55ws6jSie?=
 =?us-ascii?Q?z2JFrAis86MTCA5Oyn/fR0v1Mf7FOMfIRBH4KHAfwy6UqqfDBbjIk3vkHcYx?=
 =?us-ascii?Q?/UUS64SgGnC854dFPWTaVxKoOo9+I/BOHlCJc/sp9y2vMcQxVyocMXEQY4HB?=
 =?us-ascii?Q?02XqG/JS/fS9zvEW71pDTc5MDCaF6PMzBswP79hUOABUhLSLUX0gINuMWfAM?=
 =?us-ascii?Q?NDz6JpwMuSYP412bJP9At8Pbf/YOeOhcjWYp2G/+ZVstsTx4XLDljscwFtmE?=
 =?us-ascii?Q?YrMqvFyW5sMmPUfHX4qijnvMAh/jfNrQAqjN/n4A0U5oflfpb8x449yRmspS?=
 =?us-ascii?Q?TxkoX+pBGFPZugyMTe7mHGZAN5THuwnqoziFNz/RH+HVCuTtOGRvRvO9gj8N?=
 =?us-ascii?Q?I1TJaPjnWBDSFZHVZ4rmZK+thCgqBFULUN5oFAWYgRRTSIGykhZ9Qk7qu661?=
 =?us-ascii?Q?N0Ue4OzWqfZOqtw1ibt6iDzB0NgLLSUJ2lZ5QJ+VN2VBbQHrd7oUAXXpaxNU?=
 =?us-ascii?Q?yuT0JGUfjoKid2dIWj3mCDARpPsG0Uanqq7CiemktpUJh1sI58MsAPYI7QLQ?=
 =?us-ascii?Q?8G/n2IV+7kqVrKW3PxThSPi0ta+yecU8JDX+6A+LbjY2Bem4Oqx+22FtmELu?=
 =?us-ascii?Q?UI+Y2R+l/hTFnqrYjSFk2JgLmxYmNVbp+ysBLWjUrZIRLcdaOFe9Bd5qTpQ6?=
 =?us-ascii?Q?heX2pHgSZeNjuwFuzeVLI8U9XQ+k95IuuORPqkGPBy5KzLQL5rc7p8KCHSn6?=
 =?us-ascii?Q?JsMJ5IYMAQlxiNtc5Om+zDhYZ7mVyat+ZBNa6Hq1iatqyPY8Y4gWvZMD2+8+?=
 =?us-ascii?Q?LfIYkOPgn71DQx4EeEoE63D7M9kmkmxebytfW/aun4WBIpN5i8a9XVYRoX16?=
 =?us-ascii?Q?V6EV+3Len+ihzZO6el5W3xXbC6q6hU22JFeHtcWyKOvCoI3wEb6mwouQ/sIz?=
 =?us-ascii?Q?RssafVQwM03CBI1+yl7sWGOyyrbgrYBz9L8Q6xrWaMs+bnu9mQzFiWjJCLsq?=
 =?us-ascii?Q?01FbQDglSaceDJwp4ol59+Hv/1JpXfM3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(27256017); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m7JicJYGk5ClkdPvTMH1FeM3jsjdugzeEqpPnYEA1SNem2voOa9e4jsubhES?=
 =?us-ascii?Q?r1InHV88GxQGJFHrD8F4lxs829E6na4as4f4OFHkHlOrumhFCcZx71Ot8lTP?=
 =?us-ascii?Q?GGKNmGcUzpWR/gUk1lcgalMZZlYXKb4MqeFPSMGpQKf4+Esd5042vJQCCybO?=
 =?us-ascii?Q?0FqKA6MF9bcQ4NnkOqnv7gABa8IhxRhb8TSi5Ho1QuWmmSHu9lbb3E5zXVNN?=
 =?us-ascii?Q?aDTEIMhnq3vC3vc6X7HOFoemKPWeNykaHIlBiICn3hA3/GQaeSFbnxvgmQNp?=
 =?us-ascii?Q?dPS+xnHBCLmvG5Q+Qe3zqvioyWKThUFeeIVYCuHNbiYugKJCDPGPTKdM3ntu?=
 =?us-ascii?Q?6ItXvuKTK6AlvdiX0H4GOGa6MdBSU6VOyny6WvcbPKkwKaPU4IeNvXP6ROaS?=
 =?us-ascii?Q?wDZzbWuwSyuMEVmXsCgCEzvrpruQjfq+jPndjagwUWEgCfhoSG16R7SfTGHm?=
 =?us-ascii?Q?VGhxs8r1kRzaN3Wpy2kmkG5TvfooEffai0QnE3iT877ZjfDOfOFK720bcohZ?=
 =?us-ascii?Q?9IJlg6eCI1r+ca2NOKdB55veoubDDrRTbWiK7EMq9ApDuSHTpyUDKZlWb2cZ?=
 =?us-ascii?Q?W7jsgee4pHk/hLQ0/0lQMog5Sn13pYmPZQwhZEu+YvHNZ0PHK4yshMbOHwMY?=
 =?us-ascii?Q?Bc060Nvgh1XscS2YO1x8keEcj6m/bMOyg5ZXwA29D6G4bT460DZurMshmfi/?=
 =?us-ascii?Q?OdoqjK5s+1+su186qixIQUmhVHtvRNoCW1kx0EEiybL3Jbu0dUhVzoal/grt?=
 =?us-ascii?Q?fPovO5vigsSSY393JXlqDfRgNqESROOFmiMORRDaj1bGYbMKKaXXEIf5DJon?=
 =?us-ascii?Q?nQcj6GGGBTRukzLBdTsuloVHymmkG1t3v3ADjdeMRjJX9d9ut/FYmWjRrtdl?=
 =?us-ascii?Q?eoY7Bl2drTWHKyxgTUO9EZ4+Jq+v/9KBA2+oGbPwEgy93ZqFpwstCli5lrBw?=
 =?us-ascii?Q?Eb3p83C4ht63PrceL5MOYjmQBqkFaOtnoh/Yb9D8+yyGVWRpJs82bUDnFdPT?=
 =?us-ascii?Q?Ex2SezYTA+/WpbI5b6EZDoO8FmqSAakDyY4N3cnsh+AoyMk3ojm/+4onZbjv?=
 =?us-ascii?Q?awY9kQjHgHN3ttTWjMay/PC2OICYuN0tYhqDTJ0iLw6j+UxXqHVJuw1u21Ja?=
 =?us-ascii?Q?kob0VNMk2aD8hvJqxXHM7Wz3Am/S4dwdVOK6AopDXeWsmPHAgJVw46z3FImS?=
 =?us-ascii?Q?XE1WL831yhDHWHAUo/CjSgajUlH2tiJjLocoWLPsMrYT9ttqjfpb5jOHvEkE?=
 =?us-ascii?Q?K1zLBRnic/Omp48LncudnlZ5QhxpDoUnZI0NGaHbRoLVCNHrHQ40c4K4XkLo?=
 =?us-ascii?Q?MnOTl1HicabnquInXmrK93HIkpEG6HEWazWMD2bYcwUqZiv7VZTTJmhV4ZIp?=
 =?us-ascii?Q?82x/dgr+DRZxBMOZT9XEPH4zpJ5nQ6EeggIlFC34m2xg1VPiVnNqzjndGa29?=
 =?us-ascii?Q?1s06wfC1thyTeWyvZEOKh19K7q/W+f62cQF/e2Hv/f7ANYOZP7MzvYKSarJl?=
 =?us-ascii?Q?K85Gc041FwrCxQKaEee+Zj48dAOBd3YnI7HVVO1/Ag6OmWhqVwUKI5eCsuZQ?=
 =?us-ascii?Q?UnP9EKt496xETG0/Fu659j3aNqI3bdwsyIGablt0Eh0iu68zeeCUqlNZGKNs?=
 =?us-ascii?Q?nA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 00d0f384-a8c4-45ac-e699-08ddc2e78994
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 15:03:05.9781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q16kLZ7ndK1ttxYDtFK9ZTU7aTQ9StIPmZVvI+bWI57GjDxCfL9C63USLVCzcW/p79tlhV8Bp2R2ss1jmQeMmfqkSx/fIP99xWEGnHygkCI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5091
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

On Fri, Jul 11, 2025 at 09:56:08PM +0000, Cavitt, Jonathan wrote:
>-----Original Message-----
>From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Lucas De Marchi
>Sent: Friday, July 11, 2025 2:49 PM
>To: intel-xe@lists.freedesktop.org
>Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Atwood, Matthew S <matthew.s.atwood@intel.com>
>Subject: [PATCH] drm/xe: Fix missing kernel-doc
>>
>> Fix warning:
>>
>> 	Warning: drivers/gpu/drm/xe/xe_device_types.h:658 struct member 'wa_active' not described in 'xe_device'
>>
>> Fixes: 661a6950e061 ("drm/xe: Add infrastructure for Device OOB workarounds")
>> Cc: Matt Atwood <matthew.s.atwood@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Reviewed-by: Jonathan Cavitt <joanthan.cavitt@intel.com>
>-Jonathan Cavitt

applied to drm-xe-next, thanks.

Lucas De Marchi
