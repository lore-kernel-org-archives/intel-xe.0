Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53779CCD1BF
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 16:05:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 123EE10E5FE;
	Tue, 28 Oct 2025 16:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CgmEPnPG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AAC210E5FE
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 16:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761667503; x=1793203503;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pFRnS4BUX5XqmFJjENmztf/Im0M1mf6zWM60lMCiGHk=;
 b=CgmEPnPGW5e5hhcmZ+kSavEzqeA8ucW/kF7IidetOmWGUonSNRX2TXHf
 CbWwRq4CId1X3cM934OxsHEZr5CbP2yNGhSHNa8g2Pq5Ibv9ONkYw/r3b
 eUdqTaPESiNgrte5JOyoNbpGP9hltIbrQbk22xmyVZgxC0Q+lflc7HACH
 zLJy9IzdFQvI5KOxvClq73VQbA3+3WmrSi/VZ2UGQMNQ673bFh4L5OpPC
 fHdMRW2+E0SOamSVE8OZGjJhCXb7U8Gp5k6KiT4/ae35oTyW1BMD0oPJC
 KGiHD+KinxMlNO8Br6lv8IZghqi4fsIiUmHMn8P2LG3zo3YpvUxXHAAvO Q==;
X-CSE-ConnectionGUID: azMUE06xTZm9WZ4qvnVA6A==
X-CSE-MsgGUID: 0WjhQaqDQziaPiLAWaDXQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62801566"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="62801566"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 09:05:03 -0700
X-CSE-ConnectionGUID: 3mj6Em30R/yKXKL1YZor8A==
X-CSE-MsgGUID: PPFvy4xkR1GGRWZc6DRcww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="222607798"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 09:05:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 09:05:02 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 09:05:02 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.37) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 09:05:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KI6fvTbivejXSWmND3avKti3uUwSXKrN2EGwJRfu437sfXvpDBSBzi19ebfWpuLhradcgzY1p3rZm9HhtQDThPwSRyhLA6/Inr8L8MXjXcZqLcFdoQBOY9ybSmXxhtImrxzuGRmIFaicvB7H87vVILzSTSfuUb+9Fcaxed6wo6DTeFRhJUlafdOJcS2Kb6Dgis9XQWs1Yo6gS8aEn8FE5fclaQRmZXR9HkHSfVJzw4WDOjznynr9LkTXqM0QycyMLbvSgjStsKFdgF7x9R5nWQNCby2JgvIZ3crtw7Dh1c7KWlwKXO4mku5oqDIzY+9a1UXv6bOMQ6CEX2ev4LdkEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nWRJrOqSkBu7m+4DAA5q4PhfGjsULNvgM7FJvMVUTA8=;
 b=JcYkMWMUs5I0xRF0iC/x/e3p3aaELHskqjHsBcetlcqIK8L4bVOE+oQ7eLvQY3rstDQm44JKG0BZCFkQswC+nNgZ5xOyG2mEOKWMV407YE60HRSl04U2Q4WbYsRvOXH3QpQBk9XIwUgXwaBp15gYNB+9XLXi5EUWMVdxDkE97UpRu2SWleoASOg2qhFdoKbNaFeFliChXQzpPmHQWaLBRRF5Jpj/glibC65hrxPks5AsboIghepkKeK6j8heA5OMgUnES3VNP2EDkTjh9S+oPd9QFLccFOMyC3kI83g1sSamEn+1QVE9BeBZLy3aNP5Xin+qBfNcsz3vA5Ui79QWaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB6373.namprd11.prod.outlook.com (2603:10b6:8:cb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 16:04:59 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 16:04:59 +0000
Date: Tue, 28 Oct 2025 11:04:56 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Raag Jadav <raag.jadav@intel.com>
Subject: Re: [PATCH v2 8/8] drm/xe/gt_throttle: Avoid TOCTOU when monitoring
 reasons
Message-ID: <q23qstnnvuocvqru7xmev4s7ke23qflgdekfkb2jx6kltuu2l7@b6xg7yt7cx3a>
References: <20251026-gt-throttle-cri-v2-0-41f8288a71a7@intel.com>
 <20251026-gt-throttle-cri-v2-8-41f8288a71a7@intel.com>
 <aQDNBR28h6o1hM4O@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aQDNBR28h6o1hM4O@intel.com>
X-ClientProxiedBy: BY3PR10CA0004.namprd10.prod.outlook.com
 (2603:10b6:a03:255::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB6373:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f3a37f2-49a9-4d48-eb26-08de163bbe99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9PxNJfIO6E77pLMWxPsEEDopeQ3LVodi/sMNcTaPAxLW+MgbwA8BOMIMZlJz?=
 =?us-ascii?Q?VgCdza3fQn3hJRpi2EBjRCwASFgLn3NvNSdKVzYFOGW6jJX69V0u4/d4jue+?=
 =?us-ascii?Q?gcuWCHR1eePivuZ8IiHkp06vpyTCJAbZelXDvfmISbH2Wq++zP+sSlgr1ZyZ?=
 =?us-ascii?Q?W8YRU8JydCYXY9gDlYrKL6zkR2yHK4O0Hg89gTgWRcdB8UtDvQHc4I/IJ3gA?=
 =?us-ascii?Q?WzKt5cjS1kFcr59JlvU1SRgxlTZ6XceGWFlJG2s0vBWNgXdzmSJE8HYp3xxv?=
 =?us-ascii?Q?bpTJ5p+NU7RHJGDCvEShHGVqD1TRwN7Em8wuEtXjoj10gZBoxvjSv4sw3yec?=
 =?us-ascii?Q?IVmTSwvg0aCnAN6rP8rgSLyWwcBAhm7xTg6zRtlLZgVisFpDVTxiz+I4mv9W?=
 =?us-ascii?Q?z4u7t5IdVmcRvtbjY4r+q1IvyyoPfG92iTtDEoWYi5LzX/yMQ8alEzixhbQG?=
 =?us-ascii?Q?8XUstyiQajMbnJX8oJubip9ZkMindp8c6lr0UDKh1F8wVsvpsFfmwwSwh55C?=
 =?us-ascii?Q?0T2xo/tdHyEsFXkO/NqiCJWhvJkxxrYlcNPznRuT81fx07yc65flANOapawj?=
 =?us-ascii?Q?D/p/EW2pRsytk9pY6GJUxG7n27wNZ+OgjDRt30IOMIBSBnOdQ/P0XifKSjBC?=
 =?us-ascii?Q?qJsLU+zu3ROjW2MOYZwP5N9ieujuucM1ShkwIjf0RwFhe6ENSz87FgZjkDJM?=
 =?us-ascii?Q?9RdoQfHmZoRa61PWPayfXlPUlX+O2XTFBHjYg/ffamidyx2PrfAYUNjBFR+1?=
 =?us-ascii?Q?fyUcfR75EHvonxShVUdF5I8+HDIwnX5nWUPkrYNWqI25wdx2PzA1u8zuFB5x?=
 =?us-ascii?Q?SskGCzO5PstF5vthA0H2PcEai4uWak+V/edcvQqV+6NCkvkwntNb3XLJ0KV1?=
 =?us-ascii?Q?h80dNpl+4ShxOBlKRzozahdN96Q4uNXofFNuZNQqAQEihaVWLs8VBiYPA87I?=
 =?us-ascii?Q?zWKWg6CnDePTVqrGrlJhW92p8H1nbEG6XNp6TBNd1tt8txbjAKc6ePJVFF0V?=
 =?us-ascii?Q?nDZ9Ph78KfGE1ZCvDgtfqUufQUjp8tpoV0i+0CVGeF4Gx808gb9vyD/wkyoz?=
 =?us-ascii?Q?jnyw/evqeXsiaQeJqmP9woYmosN5WITKb+jFmfAoWKBfhGVfXNTPaem/WOLc?=
 =?us-ascii?Q?X399eOIpnGT/rjsi3y8K6CIW0xEjbijQlXXsNWUZaZazSdN96uOfbt21XtGB?=
 =?us-ascii?Q?NuF0k6b/YeNfGc3gCKzBMh+BODwhrqegIzkIsDtQD+1WqUIVoSpzwdkoHnui?=
 =?us-ascii?Q?otL+aMZS/pm156b6q4etRy7IN+v7UTJqzL3rTTZx0XCrIc4r6misqK7AF04t?=
 =?us-ascii?Q?FHklTth+XDaFCMB12otG+xS01TXcrMDni/TR45/p2HZamOpK9nisdp2XHaAI?=
 =?us-ascii?Q?MdB3xcADJXojl0T+Yp7UrQ0VXQfqH1M02AWD5ixJERUzoSUJEMqIre4oz1f2?=
 =?us-ascii?Q?2LmeKbbuU5diodwXVcbg0X/ycb73qeQsNIFKOnNq8u5Y1u3x4zoaGA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ARiRN9g2erNWgWBeNu+T+5QIrK3b6z8MdebmSiZtwwL9cjQ/PjDv2HIsqL0D?=
 =?us-ascii?Q?5B3ocoshpfJ7skFTYK13zyQWEnfYVTeftypOrsH18d9NPbxotqRi/t4ntAI4?=
 =?us-ascii?Q?VngMADS+hgzDf01kmYfCtLkFjHLXmCmsvZNkfTxOWNNA6dk1DkWZEbe8f/E3?=
 =?us-ascii?Q?Fok5cBrbdcrZFWzGRx35r95lgyZCxlmXP0BULqW7cEi1yLFco9EXEyZxIKWg?=
 =?us-ascii?Q?V73cFwrTolG21YjgDhycy5qgOIu0sBL0Tq8GS11L6ZCYyBqIvpHaKwJfg8iY?=
 =?us-ascii?Q?DUx+lIar3Ow6at8xp+7VOqrrGc39VlvyJNXGi8B9gejcRIpLjjASicJkZsNR?=
 =?us-ascii?Q?i3AdyJejqiDSW3pfI1G6u2q+UxS/6hOlcfLNoUZjFBdH+5iH1HPuWsbwYjNK?=
 =?us-ascii?Q?C5uwRrEP07GGGzNfBa/yUMuM4GraZLo40Qc/YfIS3IqYOxQzKR+hvg0dgT8K?=
 =?us-ascii?Q?OZH6hO5p4cWvooGa/0+957q1l+jGGJglsS95X/r+MnnutCi2fNm5ZiEwN4q4?=
 =?us-ascii?Q?+IN4RkssRP5rdeHgINMcdpbpAUW040Ywes6AUbk5opI1G979qPBdi0Hn0Eci?=
 =?us-ascii?Q?iQOYEiQYtcEszrmvg9W3W75nYyxqGySbUsa/5ADx3GMYObAtkGFdVScrn1bb?=
 =?us-ascii?Q?xFtNXWFdVP+mGq6ZPrn/wB+kO+SZKKvZpDVauMiXxw+Zt9VAZMTOPVuk3BVb?=
 =?us-ascii?Q?lLqeyPH4y07AGKe1UTdA99aEgc2AXSDwl03eFt505rve8iHbcwnTFy+kt5K4?=
 =?us-ascii?Q?idzQ00D9ThqQ9Mx9gJAY4F1sZI7SWyBApwVv0o5Clb3rjPH5pSh4cdsl90mw?=
 =?us-ascii?Q?wWEFhvnEeSXBLcq2ke54cluHJF8z13HvWpkdW1PIq9ntRf1pwwTO+1blJV9x?=
 =?us-ascii?Q?6bZHRNTUpv4LBpIdFpykPEDgEnQw3wwlCCSpI6QH2CzirG2G6qBlCi0CT4+X?=
 =?us-ascii?Q?QNCTKr4ZzlNfgzxzD6Dm9rThicnirJKwLal11MPAvNm9SQxR3dMXksFHFogn?=
 =?us-ascii?Q?04SQ0xU/R+toxyTyI9D0UvgvTytZXOlV+hfvo7M8sOdcg+OKGa88oK09wsM9?=
 =?us-ascii?Q?bI8dOICt6ueqd2i9KsoWjUU3ot4NaRZuKt8g4NY9PvA509n3DOv3toTYJ3P9?=
 =?us-ascii?Q?AXh0D0aQ/wr4Q3tmN3aB7nCvgRwYu3nECvYhMmELKrcNEdhqd227I9KK7gC4?=
 =?us-ascii?Q?Y/kEEIkrtS4CyhEQEB61DvLSiOx0d9BPThDHRUNZZ3fmzfgm6P2wB5SiFygw?=
 =?us-ascii?Q?SFyOw1/VhpoCUsnXHoi38zqqCoF7XE9UsJr/hOp6hNMEAu7B5bYgXkMlurxO?=
 =?us-ascii?Q?lgwUZqNxs0jxuKov0vxJhfGhMnqApOnmrTKJohHWtPyyolRSQr3ak8fHFkJS?=
 =?us-ascii?Q?uxZbbQFN8UeyUhm0R2UlDae18Unuyg1lNDbY/VkbLqJMvIueQ76eJB0jxXY7?=
 =?us-ascii?Q?DUDFzPq4nMkwNkhIvtlDdsScfJfpphtNNpATQU0p6MBaT4dln/C3fCdf7Vqj?=
 =?us-ascii?Q?T+ArpXLeQT4CVm5vjDYM53sVvrora2jbA1ouo4kQbeCHLc2kf4+d6ydRaI3X?=
 =?us-ascii?Q?H7k27FkZWKanlb2bBFghU8Y/RzFqrkdb8og4AuXEtZTg901ymERxrAhH0Df+?=
 =?us-ascii?Q?0A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f3a37f2-49a9-4d48-eb26-08de163bbe99
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 16:04:59.2396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kJWdybGZG8oTMzT4frEZgTAkO/m4Ad8VO/YmKUt3VI8Ih2Belz07XIth4kHCJG0/1Z8/HVHFgeccs0ViMiJhL1R2LtJ9b+xe11WpNxVTTuo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6373
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

On Tue, Oct 28, 2025 at 10:02:45AM -0400, Rodrigo Vivi wrote:
>On Sun, Oct 26, 2025 at 10:57:20PM -0700, Lucas De Marchi wrote:
>> It's currently not possible to safely monitor if there's throttling
>> happening and what are the reasons. The approach of reading the status
>> and then reading the reasons is not reliable as by the time sysadmin
>> reads the reason, the throttling could not be happening anymore.
>>
>> Previous tentative to fix that[1] was breaking the ABI and potentially
>> sysadmin's scripts. This takes a different approach of adding and
>> documenting the additional attribute. It's still valuable, though
>> redundant, to provide the simpler 0/1 interface.
>>
>> In order to avoid userspace knowledge on the bitmask meaning and to be
>> able to maintain the kernel side in sync with possible changes in
>> future, just walk the attribute group and check what are the masks that
>> match the value read.
>>
>> [1] https://lore.kernel.org/intel-xe/20241025092238.167042-1-raag.jadav@intel.com/
>>
>> Cc: Raag Jadav <raag.jadav@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt_throttle.c | 46 +++++++++++++++++++++++++++++++++++--
>>  1 file changed, 44 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
>> index fa7068aac3344..fd2988dacbbb6 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_throttle.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
>> @@ -22,9 +22,15 @@
>>   * Their availability depend on the platform and some may not be visible if that
>>   * reason is not available.
>>   *
>> + * The ``status_reasons`` attribute can be used by sysadmin monitoring all
>> + * possible reasons for throttling and reporting them. It's preferred over
>> + * monitoring ``status`` and then reading the reason both for simplicity and to
>> + * avoid TOCTOU.
>
>Perhaps add something like: TOCTOU (time-of-check to time-of-use).
>

ok... just to be clear, this is not about any security issue that
sometimes the TOCTOU abbreviation is associated with, it's just a
"normal bug/race" in the interface.

>> + *
>>   * The following attributes are available on Crescent Island platform:
>>   *
>> - * - ``status``: Overall throttle status
>> + * - ``status``: Overall throttle status (0: no throttling, 1: throttling)
>> + * - ``status_reasons``: All reasons causing throttling separated by newline.
>>   * - ``reason_pl1``: package PL1
>>   * - ``reason_pl2``: package PL2
>>   * - ``reason_pl4``: package PL4
>> @@ -43,7 +49,8 @@
>>   *
>>   * Other platforms support the following reasons:
>>   *
>> - * - ``status``: Overall status
>> + * - ``status``: Overall throttle status (0: no throttling, 1: throttling)
>> + * - ``status_reasons``: All reasons causing throttling separated by newline.
>>   * - ``reason_pl1``: package PL1
>>   * - ``reason_pl2``: package PL2
>>   * - ``reason_pl4``: package PL4, Iccmax etc.
>> @@ -111,12 +118,45 @@ static ssize_t reason_show(struct kobject *kobj,
>>  	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, ta->mask));
>>  }
>>
>> +static const struct attribute_group *get_platform_throttle_group(struct xe_device *xe);
>> +
>> +static ssize_t status_reasons_show(struct kobject *kobj,
>> +				   struct kobj_attribute *attr, char *buff)
>> +{
>> +	struct xe_gt *gt = throttle_to_gt(kobj);
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	const struct attribute_group *group;
>> +	struct attribute **pother;
>> +	ssize_t ret = 0;
>> +	u32 reasons;
>> +
>> +	reasons = xe_gt_throttle_get_limit_reasons(gt);
>> +	group = get_platform_throttle_group(xe);
>> +
>> +	for (pother = group->attrs; *pother; pother++) {
>> +		struct kobj_attribute *kattr = container_of(*pother, struct kobj_attribute, attr);
>> +		struct throttle_attribute *other_ta = kobj_attribute_to_throttle(kattr);
>> +
>> +		if (other_ta->mask != U32_MAX && reasons & other_ta->mask)
>> +			ret += sysfs_emit_at(buff, ret, "%s\n", (*pother)->name);
>
>perhaps a space instead of the \n to keep only a single line?

I'm lazy and I don't like the additional space that the lazy approach
would cause in the last entry :-/. For printing arrays to sysfs
doesn't seem there's a uniform approach. Some use \n and some use
space.

do we care about the extra space? if not, then it would be:

	ret += sysfs_emit_at(buff, ret, "%s ", (*pother)->name);

if we do, then:

	ret += sysfs_emit_at(buff, ret, "%s%s", ret ? " " : "", (*pother)->name);
or
	ret += sysfs_emit_at(buff, ret, "%.*s%s", !!ret, " ", (*pother)->name);

thanks
Lucas De Marchi

>
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>>  #define THROTTLE_ATTR_RO(name, _mask)				\
>>  	struct throttle_attribute attr_##name =	{		\
>>  		.attr = __ATTR(name, 0444, reason_show, NULL),	\
>>  		.mask = _mask,					\
>>  	}
>>
>> +#define THROTTLE_ATTR_RO_FUNC(name, _mask, _show)		\
>> +	struct throttle_attribute attr_##name =	{		\
>> +		.attr = __ATTR(name, 0444, _show, NULL),	\
>> +		.mask = _mask,					\
>> +	}
>> +
>> +static THROTTLE_ATTR_RO_FUNC(status_reasons, 0, status_reasons_show);
>>  static THROTTLE_ATTR_RO(status, U32_MAX);
>>  static THROTTLE_ATTR_RO(reason_pl1, POWER_LIMIT_1_MASK);
>>  static THROTTLE_ATTR_RO(reason_pl2, POWER_LIMIT_2_MASK);
>> @@ -128,6 +168,7 @@ static THROTTLE_ATTR_RO(reason_vr_thermalert, VR_THERMALERT_MASK);
>>  static THROTTLE_ATTR_RO(reason_vr_tdc, VR_TDC_MASK);
>>
>>  static struct attribute *throttle_attrs[] = {
>> +	&attr_status_reasons.attr.attr,
>>  	&attr_status.attr.attr,
>>  	&attr_reason_pl1.attr.attr,
>>  	&attr_reason_pl2.attr.attr,
>> @@ -153,6 +194,7 @@ static THROTTLE_ATTR_RO(reason_psys_crit, PSYS_CRIT_MASK);
>>
>>  static struct attribute *cri_throttle_attrs[] = {
>>  	/* Common */
>> +	&attr_status_reasons.attr.attr,
>>  	&attr_status.attr.attr,
>>  	&attr_reason_pl1.attr.attr,
>>  	&attr_reason_pl2.attr.attr,
>>
>> --
>> 2.51.0
>>
