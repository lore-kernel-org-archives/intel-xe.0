Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01CEC61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 16:16:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9122010F2B5;
	Wed,  2 Sep 2026 16:16:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gQcrfoOH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C52110F2B6
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 16:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788365809; x=1819901809;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nENT0LF/sFcoRnKpI+NPwL4ZhCrzOMYy44qPaG4Yek4=;
 b=gQcrfoOHBlneIGLJuT+9AqjrCggfzFr0FM1aVKBd7QZqVLUy8rsp7y3V
 ycYJKZmSl7teO/dt5y1rNsxi2i0iiImmBxDvlCOFMTxArl6Cv2p0igiJR
 o+RT3dTIKSp/SCiWMDAGJiJC/GpUBFkO/R7eKj8/baRDImkmts3ZFmWwc
 hcoEP5U1w/Do5VMCfQQM4bglQhhPzHHD1ShlWyY6ep4JfyimTBd2QbPFf
 MK+wfjWO9RCgsCZS877cpVw45TLIgEDvH+65VGGEKQ0CLO+U6lxLE1OIf
 6ye977bFYRMICI6+uNx2+hS1istePltee+1xY5/219irECBeJhA4qdJmw Q==;
X-CSE-ConnectionGUID: 4cBAue50SgiPgMUAI9CUqw==
X-CSE-MsgGUID: W/YFaxNrRY2oSr9K7W47JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88865826"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="88865826"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 09:16:48 -0700
X-CSE-ConnectionGUID: u/t8+/VXR4We6iC2YZ/8wQ==
X-CSE-MsgGUID: qgXpJ5gKQHKAVnnBrv21GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="265138461"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 09:16:47 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 09:16:47 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 09:16:47 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.4) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 09:16:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YSDSPH7XqTrBmUswIdIyIX0fNn9Qv0y4gFrR/y6p5Hjjqilmxi7qUlxLgmtpH57bvy3vG5xVJaCUmTy8Y475a9+yCynpGi5ZTdvniAWCkv6Wjg1VpXm09k9eC9OhhKzT6V+2jXfKrzHzslieP0irpuHHnxwKn0iOAwo/h26Mzn1x+kAFxx3bhwx4hCuFIIisgYrBrcbO3rKFII/9noUh2C7jfrFI6oqPN0W1/yPK3NS3bxwObWzv1a9q1xZ8yJIsN/dZhwM7P5UQrr19IspGlSVFL3gewS3RXGlMzZPHGYCLhk9+R3+sNZ2yX3zvKelP2cHTc3wzUe76n26PMDnH2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9OOZ+ShyC2KqXTAeHKc6wDg/Al9dCvdeoDV9uJojJFg=;
 b=LICrriXG/W9JrMB6LQPA3Jua2PEP8HH4u3HT76WQNYk4Ov5fw/2spIakIs4Syoh/2k6JALuaP38ODaFobwUs/VzMXH2MgjhaEqXOH91X9pX6QUBp8Ql3wzkLRn26hK9QuudeWK32U8BG5Q/YNoeWJXO98fsJpjb6NWpzMRMvLYKsNMaLFNh3U8b7QsX/4Z5VWbcIjhlYgx7Cayqv9+ICiWkk6LFqJlrulAZDymTjCEj1d2EnRscHtRoz4jkwSJfHZG11+mKCg2KcAdjwqIOLTFbKKQRW+nLSdLXQbUEORYMXd+Reg6sq7a+rWeAwxDrlwzmYVi5gKmfeD2Lif0Th2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by SA1PR11MB5921.namprd11.prod.outlook.com (2603:10b6:806:22a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 16:16:45 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 16:16:45 +0000
Message-ID: <acd3d811-fa93-4d93-b21f-1ebeadc58099@intel.com>
Date: Wed, 2 Sep 2026 18:16:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/9] drm/xe/sysctrl: Make sysctrl_read_frame() void
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, <anoop.c.vijay@intel.com>
References: <20260831104456.1770605-11-mallesh.koujalagi@intel.com>
 <20260831104456.1770605-15-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260831104456.1770605-15-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P195CA0018.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d6::15) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|SA1PR11MB5921:EE_
X-MS-Office365-Filtering-Correlation-Id: 23a5e3fe-b35e-49c1-20f0-08df090d94f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Rf8wsHyXz8yOeNHPrpvFynZt5IOxc+SVzp/ertFwF2UVndqVDFlQuQrruaBgAAQCotgrBzeAMwLv6+n5zWN7fxFUPIrK+f3GHUxIKWYJeMZ27tDuBwDH+3OhWPOabZPQY3w2d0hS5oclQBn4KW16UOxvQM/s87XwGDzLbIopJtZlRJIQ+141o1J3swG11PYyPNshlTtY9yKqeNZLFwqMBMhxuInI7DgQ0hlYGqBOSxpDfNd7DW5QU1yh4LAXh66LqgVujwjGyy0Dbw5FZJGWEit0vc6PTOBNNIw8UUXBdRntydsuE6zuuEtDbwkXrnIaG8/FMeKjBu4dkEiAuaac/BVMbRlWRHQL2X4XUKFV1Jset1r4QziQAHW2oTyzwxCGj5t0pwZb40fxJxzvP5uRV4TAFrkoLcKDLxR0e8fPytAFI+fbNYnhKznr24JZK4hxf2gZA+Ve97MuheifMGExztolOoH21g5t9IuK6qLS23dqnr67mLVjxDk3jLlhFT9E7CiBl3uYgHo6AJbEM19lQSK89qE2q3aoBFFxgxwOqNMmipxPOmeGxGggF6kZwo50PgPbPbVnBxw5Iyny+UHfMdT9058AbSlvfYTJwcokKypen0TRFe7UD1kUg9JPHD/IXK3G3LvzQCSp7zmpsSBACsYDOALRf5PljbkYubotwfM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTByUzhKS29idzczWjF0c25KZmR0NTE1L0UvUFZaY0NySHNWN21hWFp1dFNi?=
 =?utf-8?B?SnhGL0kxcllGckRyQnBlcHdkc2dpQnUvc3BrWkZvampDTEJZdDhoRWVZSEh3?=
 =?utf-8?B?dncyb2l0dWdGemEvZksydkwwMEVTNUJYZ25kV0tnSEtuUFdKWkJxdC9lYm5a?=
 =?utf-8?B?SW5QckJwQ1FheU5lU3h3eWJiandqOVYvbERmbXh1Q2RLMWl2bTFyNUMxVzNU?=
 =?utf-8?B?VWdPYVltbHRhSjllckhvZkZKd2NaUWVaSkVFZXNldHgweTBqUXJXeS84OVIx?=
 =?utf-8?B?N2FDQzhLMmdmTlBUVXF3T0tvdG1icjkrdE9oRjkvUEF4TldxajI3Qi9lQ0d2?=
 =?utf-8?B?dkxOYm53aDRQT1RhWm0yY2M4MnN6ZFVxaGwxWXhPditSdG50VDV1Tk9IVVAw?=
 =?utf-8?B?VGNOTWJUUGRtS1RSZ3hvTGFIL2F0K2hQUXpMYzNDRXU2YnVmZm1lbnUwbzdr?=
 =?utf-8?B?QXM2YUY2MWhKOGxMZXRyUmxWN1BsWitRRjhLdDVsM2Jyam92WjNyL3FyeFBm?=
 =?utf-8?B?Q01qTWtwWURZVW4yM3BiN1pvVVVYeDVMZmQxWEM3YzNwdlJ3ZmFYVDhhWjl6?=
 =?utf-8?B?SGlqTU9WSFIyT284a2tNQThkaTZ0RXRmaDFHaWpJQ3plVEpFUVlYQjFRcXI3?=
 =?utf-8?B?TE9TQldSaTdDYnhmTzZGTkNuTHZWY3FubE9ITXdZUHU2MThYbGdKSUF3TXYx?=
 =?utf-8?B?aTVFZnVqZDlzTnU3MnBjYlVVeEZuUklCMEdGamlsYy9TTlN2OThlYmZzc0RE?=
 =?utf-8?B?dVhZMHBkSkovSEJSb21FU1JEcFVLOTlWN2psVHJCV3o1bmVidjBmdDB6bmEy?=
 =?utf-8?B?K0hWWDVFdEdOa3pkTjdISEhsYjZMZ3RkV2FBSU9uWERjOGtPbWhnbzYxZXc1?=
 =?utf-8?B?TUtNZWtKbXdia25RVlV4UHc5NU9HWnhmM0xzTm5Zc1EzblJwaVRVVnVBaDh1?=
 =?utf-8?B?OVYwZlU0UVBCRmRVUU5oUmNwcUNFWloxeHJlRllxOHF2N2Y1aVpPZjYxbUh0?=
 =?utf-8?B?b0lXcjUwUnFnbjkreVZIZklBdDM3Snpmc21CWmY0VGlBOWVNM2J4U1k4OE9x?=
 =?utf-8?B?SEFFdWV3bThwQUhOZUFsTUNyZ2I3Qmo2Mit6aXdwWTRzbm9zRDl6N2wvUVZ6?=
 =?utf-8?B?U3Q3UVJyS3V2QUt2UzBDSHh2Q1NCQUpoZ1pQTjRLa1BnYzdYcEhocFNXWW81?=
 =?utf-8?B?UHNXTjdJQktNdWNmMjIxUzNNemVzL3MxYnlOTzl3cnV6UFpZV2daaWRVelJQ?=
 =?utf-8?B?c1FRUkorMnNGTEZyRmxha2lSN0ZHcWY3RTJpN3dhZmZKQXE4U3VPSldsNjdy?=
 =?utf-8?B?ZnZUOEJZeWdPcDhTdzRRdzVsSzd2d3lBcmxXQUhheGs2ZjlBdDBweWQ3QTQw?=
 =?utf-8?B?Y2tuNDFmVTBjNGQ4bEltZlVZRkdpcDRmeXd2K3JrbVAvQ3p0K0RSNS9vYWNT?=
 =?utf-8?B?RWVnYTA3RkVqa0pyNXIvU2lrOVVTVVpucyswc2UrRU96RWYzaWp2aWtrRGEr?=
 =?utf-8?B?RlIyZjUzUDlkZHY0cTZYamd1dnhZc0F6UFcra2xMZDUyVzExbmoySXozejc5?=
 =?utf-8?B?bUFGQnQ4SXdZSzQwMXZYUG5OSzBwUGRGZ0VmOTZPaElHM2Z1MW9Cc3Noc3ZD?=
 =?utf-8?B?L0NaSC9VenU3cmR1MEg2ZnlmN3RMVnFNb1ZoeStVT3hJT0FKL1JpM0EzV3M0?=
 =?utf-8?B?dFFTMTNYYjBURDRGekJoU0ZUWXQ0TTFaZEExcDUxamYwdWNoL08wV1VObHRJ?=
 =?utf-8?B?Yng4ZGZmUkdwekxmaVVadm5LU0t5YmxPcjBSNWZzcnB0d1l0OWRzVXpFUTl0?=
 =?utf-8?B?K2Ewb3dneTc1KzBKTTZkWlJMbGVOVXZvb2JQc05iS1p4VTBKeVY0SEhmRmRB?=
 =?utf-8?B?dFAyN3lXNG52eHRtVXlmUmg1NUYrTVJvMElNK2cwSlpzN3VDeWJmNFVzS3VP?=
 =?utf-8?B?ZDJmUWk5TUUzNjV0NjdYTE5MYmFiVWZNU2l2WmZhaWg2Y3hkYTZsYmJqeWFy?=
 =?utf-8?B?QVRtQXMxWkVRa1lMZnNIZVZMeVNMMnhib2tVUFBjZTQxNVA4MEUwSmFaa01s?=
 =?utf-8?B?b3prVFBRWVNuVkJFNkdKT1MzbW9MQ2wycXI4dzl1K0FXc3FtYkZRdVF5QUZ2?=
 =?utf-8?B?VHZKOUhXYzQyRVZhUUd0RSs0TzgvemJUYUZmOXdoUXIyZlVuMmNpSXM5VXhu?=
 =?utf-8?B?WEJhdU43YlBCZGcrK1drcFZ2NWVWRXlnaXhpclVyMFZLQ2dya3BXRjFCa2pk?=
 =?utf-8?B?aWloL2ExOW5sbTV4d3I3NlJlMkUwaEZsNXVDQTFNYUxVQm5BYkRxSm5vVHFG?=
 =?utf-8?B?UklNdjdJQjRNTWpJRS9xL281bzBUZE90MGp6NGpNajF4Vk85cWtaSitWeEdr?=
 =?utf-8?Q?uJuQ5MfKwrIQA6IA=3D?=
X-Exchange-RoutingPolicyChecked: tXijRP21OzZvSQnmWgGlKC4yCIFpNYJFhuuY/b+/HK/z0Cw34zPOoBAt0XmD4MEAyUpPSe96QqlrLyppAF/7plwtu8uUf1Zt4wocwgmHZ5yIF1kcgMtSy2kCS9F1EoizarYpgv1V308AkURpA0N6KLLzb8ffKD5bz0YpFHQLAqBbIbjCKZr/HfrBmeViNv9o8BNrJseeJeMVOXdLoYsy8UG42ic3rvhyfh4TqVA6RdjohvudXmvHvFbGsYoPq8+EfXpxCv9IO+LfpxtMs/EJyxNwH6LKeQOkUKIMe9KU4mXM5yZ4ds4bfq7g9Fta+wXkMTINAwzfRHJ2BsNJLN9pBw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 23a5e3fe-b35e-49c1-20f0-08df090d94f2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 16:16:44.9039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jOdTHF2RA5DHKntT7BBTRE5cEd36UH0zpLUzU3vwmdY6BVaj5AP8gxbzGU/vAqrhK3ISjEZlAJ3IVNdnzG6/WEwJnQrwLAp2KIRsjY9NATw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5921
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



On 8/31/2026 12:45 PM, Mallesh Koujalagi wrote:
> Convert it to return void and remove the unnecessary error
> handling in sysctrl_process_frame().

... as there are no places where this function can fail.

> 
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

(a few tags Suggested-by: wouldn't hurt either ;)

> ---
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> index 3ef60067e226..4841dd7f2724 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> @@ -68,8 +68,8 @@ static void sysctrl_write_frame(struct xe_sysctrl *sc, const void *frame,
>  		xe_mmio_write32(sc->mmio, regs[i], val[i]);
>  }
>  
> -static int sysctrl_read_frame(struct xe_sysctrl *sc, void *frame,
> -			      size_t len)
> +static void sysctrl_read_frame(struct xe_sysctrl *sc, void *frame,
> +			       size_t len)
>  {
>  	static const struct xe_reg regs[] = {
>  		SYSCTRL_MB_DATA0, SYSCTRL_MB_DATA1, SYSCTRL_MB_DATA2, SYSCTRL_MB_DATA3
> @@ -85,8 +85,6 @@ static int sysctrl_read_frame(struct xe_sysctrl *sc, void *frame,
>  		val[i] = xe_mmio_read32(sc->mmio, regs[i]);
>  
>  	memcpy(frame, val, len);
> -
> -	return 0;
>  }
>  
>  static void sysctrl_clear_response(struct xe_sysctrl *sc)
> @@ -194,10 +192,7 @@ static int sysctrl_process_frame(struct xe_sysctrl *sc, void *out,
>  	total_frames = FIELD_GET(SYSCTRL_FRAME_TOTAL_MASK, ctrl_reg);
>  	curr_frame = FIELD_GET(SYSCTRL_FRAME_CURRENT_MASK, ctrl_reg);
>  
> -	ret = sysctrl_read_frame(sc, out, frame_size);
> -	if (ret)
> -		return ret;
> -
> +	sysctrl_read_frame(sc, out, frame_size);
>  	sysctrl_clear_response(sc);
>  
>  	if (curr_frame == total_frames)

