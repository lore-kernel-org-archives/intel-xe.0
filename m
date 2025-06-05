Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A966C5B543
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 10:02:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3581010E803;
	Thu,  5 Jun 2025 10:02:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XzcUvkfn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F5F310E803
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 10:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749117774; x=1780653774;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/ycL+t42RSHXUrEtnhiIt2Mr0b7Xwm6ytkJEL8XpIfc=;
 b=XzcUvkfnAnApDyV0YZmbOqoR9P79BpPHoHBu2jaKXc1rquSZRGy+b5FR
 pcewIlnbD/IddCfbTRtiSYFt1TVZkzpqMk/IA5G5qnVUwL5El8CK7hqLX
 Aq02pyH8CFvoj7L3vcnQw4EPZQzp0crPg2bLGHXEdru9l4dONtfvS6t6d
 ol5Ovon1Eu5DswnFufX7YzvofwQw7+fFtCI5y9Mw4dJXhhF63ImfoG3O1
 5OfgBpo9/wxNX26ZvIVH8GJgzkZWVdArlVDj3a6mdz6xDhEVCTrpqXZWH
 94Vs09m2TYSl1/Bpa5qpksIsKgjI6Os/V5bXy7lV+uxbd0mnheBC5ZD8o w==;
X-CSE-ConnectionGUID: Frc3AMouRECkrdGDpnM3Hw==
X-CSE-MsgGUID: 4pfBN/bbS8i+LNjRaRUgfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51321229"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="51321229"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 03:02:53 -0700
X-CSE-ConnectionGUID: KL68hZXAQq+lHmK5BFz3rA==
X-CSE-MsgGUID: h/zYfpYQTaa2mjIeMKumPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="145801621"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 03:02:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 03:02:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 03:02:53 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 5 Jun 2025 03:02:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jrL4lF4xCvBZRnwCReDlxDfgeodCcgDlKii+mSqLJ9oznXIPy/fN6fIeKLfZEbZpLoT7AJ+HC4S4tSSWdpVA/FnNUi3hOsLBDix6aWaE1LWY8Q00CKeAjKFp6e9KLM0lFMGxNxOpTV/wW4TwxOJB7yfQ1iN2v7hfH6VSite4uiOSGNzJ8aGXg/Uj0JrtLqC0h35xqX/CY7FIgaO9weZ6HW6dqFJbrtMjtbdH7hXl7MlgJj9CBGqjGz/hDTBDx7LA0P7XNAtk/6Q0g01MCa/Gbg2yQBQxp+DrgF1nnSdstw9hlMehHtGVIjpvkCGSiSRxz15CyYm4geqxlo/RLwobuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9g4XMAyMzfSDhS+m7csi++5ssi2lEgBWV68mMwTQDtI=;
 b=Xx/UyIPpqydldIWamwUblND5ll+IEZNXlZGXjiKS90Qqr+o556lXBJzFmhRQ90sJfYHQc0iYJZkSIIAnf/VC+mpYjsjirWP8YA/Wc6a1/2dN7tyt/gDPmZDttJe7r16PhcMIKo9Vje5Tu/d90uYzLwl2flc0qyF2jwX+2x5lBdm5OyLmoEokxGKTBBXh+IL3iOQ7muHBVaDpkzjpnFVyKT7Vgce96OKcE1deoReqZ64WmW7QX9qKF0cFrWOH5SpU7iXke3mMlgzaZc0Bq148oycHCiFXCLzzEEi73cE2cxoEjp9Jb+qgtLvfq+kYeHyDdYBLVs8AOpjt2PXEDJ/8ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 CY8PR11MB7034.namprd11.prod.outlook.com (2603:10b6:930:52::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.29; Thu, 5 Jun 2025 10:02:51 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%5]) with mapi id 15.20.8769.025; Thu, 5 Jun 2025
 10:02:51 +0000
Message-ID: <8c096d90-9ed6-4789-a8d2-0189fe4699c7@intel.com>
Date: Thu, 5 Jun 2025 15:32:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Add debugfs node to expose G-state and pcie link
 state residency
Content-Language: en-GB
To: Soham Purkait <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>
CC: <lucas.demarchi@intel.com>, <ashutosh.dixit@intel.com>,
 <riana.tauro@intel.com>, <jani.nikula@intel.com>
References: <20250603181205.1680363-1-soham.purkait@intel.com>
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20250603181205.1680363-1-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0121.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::11) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|CY8PR11MB7034:EE_
X-MS-Office365-Filtering-Correlation-Id: 231dcd22-59fa-460a-c614-08dda41821b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bFlQM3FyNHBhKzVWZkxnd2R3d0wzd21pbmJFbDNNcEFXU3VGVkNlNDNvNWVu?=
 =?utf-8?B?SkdCMjN2VGRzZGtjQUtRUXhMdDJkS2J0ZEs2WHh4RmU4bUpYY2F6YTNCZjc0?=
 =?utf-8?B?b0IzNUFoaVdMQ2FEaWxnQnpxRVdPV0RjRXA3R3N6NXlyVVpXRkJmWmJobTRi?=
 =?utf-8?B?ZVZxSGtkdndqejNSYUV6bnFoUXpRbWRPUFBsWlVhZGRTU2hUVDdnZUVDelVx?=
 =?utf-8?B?cG55NFl0NWxPMTU4SmF2ci9BcVlNc0tUeGpIZ2hSUUhRMmRDNUJyREZzYzBs?=
 =?utf-8?B?S1lkZDJYUXdOSzJ1RTJHUDM1MXBmRk1RWTRJUTlnd3c2ZUN6bnExMWdkeFBB?=
 =?utf-8?B?WitLRUszK2hBL3E1dDc4U1ExUWE3SmRYMCsxMWxTUlRRTE5BQzVzUWhKallD?=
 =?utf-8?B?QW03emhQUHM1aklORjFjc3c4cnhrcmFtOWN5Smg4anhieVlLNC8zK3V3eW5U?=
 =?utf-8?B?YVl1SHNTdkhSVjhKc3VhQjBIMmNyRHNta0hsaXNVNTZuditzSVJUWEFUSGdr?=
 =?utf-8?B?cjRlRFN2MzRZUTc5Q0p4MmljcFpWalJweWVFVDQ4OVMxTW9tcVhIWmtlUEpw?=
 =?utf-8?B?VDVHY0hJaExJNG41YkRJT2JyUldQSlBwRG9tQ2tWMlBuR1lhcW5MN1JxdW9t?=
 =?utf-8?B?bFFBRWxoUUdPYzNseE05WUd1WmZiVXhnRmFFdmpiMDg4aU1GVDJGUmp2dmxz?=
 =?utf-8?B?aW5GWC9RZHZGblhRcEhVM1d0MmwwVThsQUVBWEY4TGlMRy9MT3g2Y1FiVGpw?=
 =?utf-8?B?RjZyUTdQT0NkejlVVjcycUZBekowY0Rnck9GZisrdE4zT01FMnV2QUdMYVJK?=
 =?utf-8?B?YVA1ODdtYXVGK0VDTU5jZUxnT1NWcitzeVdwUGFvZDJkWjhCV09PK3NPdkM4?=
 =?utf-8?B?S0pyTDdsVGZMNFpRbUZmelRlZXg4Ujl3TU9TV1cyOGIzeGVSRmhWZGhGRnZt?=
 =?utf-8?B?UVlqc25nR1pDT0ZYSDZIMWE5YXg2MFJMb1doUERBem9CdFRxMFRJc3VSbmRt?=
 =?utf-8?B?REZJTENDN3pyQkNGdnVpVDVodW9UU0RMdzlhY3dhNlB1dXdQT1BCWDRmdFNj?=
 =?utf-8?B?VnpYekpWNzF2bWd5eDRWbWFoY09LVTV4OWVFbzVzWGs2UVRRWXpLWGpUZ0kw?=
 =?utf-8?B?M2o5S2pSbzZNZEw4TkM3cEpkU0txY2ZWMDR0YU1QZ291WGJIc0hFL0txZGQ2?=
 =?utf-8?B?a24wTzNNTW91RFNHdmh2U0NxVHByMWNkZDlUcFJJMTV3NHdoV3Bxc3E2L2hs?=
 =?utf-8?B?STRZT29VVjY1QzhNNWdrL2JFbFI3bW8zOUJ6NnB6eVUvTDhBZ3Nma083Sjd6?=
 =?utf-8?B?c3hTbll1RzNKTHVQYlFJZU5HY3FPTjlhRnQ1WGNxWUVlSXpGaVdNM1c5aFZV?=
 =?utf-8?B?MEZwa2JuNlZaZ0pzcHlWOVozSjVTUy9PaEwxVGdTTjB6ek03YWlva1FUajBY?=
 =?utf-8?B?UzlmeUd1RXVwalVBNmJmTVRpQlV4akFJeGRPSEtaZFM0TnZDZzBNa3lMNW1x?=
 =?utf-8?B?cXFLYW45aWhOOVJsenF3WjBFMUkwWHNza3pPTElGdGthYVdNN2EwSEZwQlRG?=
 =?utf-8?B?OWNsa1ZNNnNEQlArYzRST29SQ01JampjcGp3elM2dGdPQldzdmlSbmxlRFZR?=
 =?utf-8?B?UWFSeHR3UzJiY285T2hKM2JjNUV1YnhPeVI0U283SnE2VlFBa0xpaUpqNkVZ?=
 =?utf-8?B?NTJNQzdMZHZsNml0NFhoSjVKdG44b0loTU8xcEgxQ2NXblNLai9PdHo2T0cz?=
 =?utf-8?B?VHJrL3NpNHZxMGluZEZMVTIwbzk3V1Y5UmZZY1dtYlNaTjY4ZEovY0g2cFRH?=
 =?utf-8?B?czY3clFTYm01TXZzTnU2RTc0NjUzUExGUUQwdy9wTkZYYTcyZ0N2QzlNbXFH?=
 =?utf-8?B?bWhFa2pCcUNLL1FYU1N1dU5MTFlBbnlJNGxWQ0NKKzJNT2ZXZEhUK3lySjNq?=
 =?utf-8?Q?mKZ+oKjDXQY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cE5qN1VoVTZOVjJIaVpsRGpMc2hSMWI3UjdjZFJtU2ZaTVpqT1JmVlRwOXRH?=
 =?utf-8?B?cE9wdVRjVnkxN2RENi9wVXdtbHJSd0I3aHZ5YVdES2psOXp1RHZ3T1B1YUJ4?=
 =?utf-8?B?YzBCanY5R1FoWldHMmplakF0SVdldnd1ZUhrMW9nRmNTMUw1MnNlZWNNcWJi?=
 =?utf-8?B?clFuNWdSOTRobWVteFhCTHZvZE9hNVZvdXdxRnlKOE5Pd0E4TlF6dmVpK051?=
 =?utf-8?B?NUw3Myt6K29iVmdROEJOZEdic3E1ZlVINVM0OExRMWx2VlN0Q0NCMExUTFlr?=
 =?utf-8?B?YjF0QTRnNTFuVmQyVTJ5VjZySXNJNGl0V1VoZVpUTVAwdjB2OFZ3ZUdEWENu?=
 =?utf-8?B?ZUo5WDk4cWk4YTEyTHVJSTBnY2RobUJCYmFlYW9IK3hrdEhhUzh0NVByOGxD?=
 =?utf-8?B?aU43aVFRV1VxTWxHaW13b1kzU2lCR0hVU0xzVTBzbTFtSWhtSlRDQlZqdDAr?=
 =?utf-8?B?OEFEQWFoRGUzaGcxZDlMWmlabXJmSDhPdGlwR2x6OWF0bGtRZ3lyZFQzakxH?=
 =?utf-8?B?NmdGSXZlUUZCQ05ZMmdDeisvNTErcTcrY2Y2Z1IvMXUxKzQvWmVZRUw0V012?=
 =?utf-8?B?WFVmeU9sMXo5YkNmVjdmWGV5UEY3R043dldxcS9XdTE2aHIvckxZSWtvUFhN?=
 =?utf-8?B?SXRoVGlTa1dMbWZISEg0VzVQVmJqT0xOM3JWVUpjR1V6U2dyejJnNXFQbG93?=
 =?utf-8?B?SVVIR21rSVVJdXZPV3FRL3lvcHhEbVhZQ2IvNlpPYVM4T1VmTVZ1bHhrUDhM?=
 =?utf-8?B?NzRGd21kN080TTc5SmFHT282aEF6aGt1UXBGRGpwdjdReGlpRXpHNE5sNHNp?=
 =?utf-8?B?ZnFOMjBSNXVadWxJaDllYk1EMWZrU1F6ajR4dmpveU9GN3ptcmpMWnBQeEtW?=
 =?utf-8?B?bHV2ZG1zenV1WnFaSVFjcEpzbVl1Qm9jaGt4bWw1SXpBYjA3VHFwUnpuR0ZW?=
 =?utf-8?B?UGtNSmtLbFFFY0lJc0x0U3hZOW1xa0psOWdiMHNPZ3MzL0crZUNnKzZ2aHdO?=
 =?utf-8?B?YjYvUXNMS3FPaHZLREdHUE9KRVo5aGVJYk1OUWVoSURWREJpQllodVhsaXJ0?=
 =?utf-8?B?WlphRzE0YkFjZHRkdFovaGdqVWtuVHQwa0RPZjVPWWFUYUVPYWE1dkJFNlMw?=
 =?utf-8?B?QXUyM0paSEtHOUxIa3V2LzdsTGhranZWZFNHYnpsK0N1dEE3akNNQjhEdzg2?=
 =?utf-8?B?MzVzY01Wdnd2TFArVGV2L3k2RzlLMSs0OEduY3Vxc2Q1bWJ4anBKMSsxK3V3?=
 =?utf-8?B?Tk80WGZveXlBOEFQYWFWSkFNUkc2MnBrckozZ2RnSFhXdCtCTUdXcjV5RGdG?=
 =?utf-8?B?REtNOWxWZm53YkgxWHpjYkJtd3pudFpGbUltT3J5cTE3Ly9lV3RTRExqb3Zj?=
 =?utf-8?B?RVU0U1BEVENWQTJTRDNnaUJyU25WV3lhbkdrY29ZRXY5MG5hQ1QwbkdPcXBZ?=
 =?utf-8?B?SGtOdUZ5V3U4Y05OUkpLanVaZDNZdDgvUGZKbmh4T1lJcmZvSTdsNVhZUGoy?=
 =?utf-8?B?S2ZNZVo5blA2Q1htamNiOVJEaGVZLzJicEtlbEw5bFNMS3lBOE1kR21pNkxQ?=
 =?utf-8?B?SjJFdW5pZnJhUGE1cEtnS1JVbFJuYXhqNGJ0dDZFVXp5VlpzUXc5T1B6NGhK?=
 =?utf-8?B?WGVnQWNydFFiTFFXODQ3QnRHODdBOEc1UmxBa0pveFZ2RVVrblVwekl6bkll?=
 =?utf-8?B?dUtIUkhrczQyNWVyMXdjRFJNakZuUVRjcHRzY0dOdlVvZTJ4Qmt6UUxRTDJp?=
 =?utf-8?B?eEtpU0dDZURGQWdvMEUraTQrbTgyTzZDQjRLT3hydGUrb3BnQ0RybGtnY1JE?=
 =?utf-8?B?UVBBM0JVWWlnaVdzV0RCT1V0YmVoeTBoZGx1YlloMVhGak5YOHdVYW9iN3pn?=
 =?utf-8?B?L1BQQTlMS2tCdmlZeFZaSjlkN3hTTWFwai9CYkt1dkdXKzRUb3FjQ1ZwVUNU?=
 =?utf-8?B?RmhxRHFabXBYb0toQjcybG5zUUNWY3V1WXQrdVplVFB0dEVhZy9qeUtsSXl0?=
 =?utf-8?B?K2pVYkdRazZUdEFVZGpJT3hMMEpmcFBzTFkzOE8zL1M3WmFFTmY5cFZuSlpJ?=
 =?utf-8?B?WlpBaXc4aGdHU2dLb29sWTUzemhrRUJGcmJjc1ZCcDY3L3U1NGU1QVZHV3c2?=
 =?utf-8?B?dXBHRWlsNzg4REd4OCtKUTNIWGk5ZVVIZ1BVOWViZzVzK3VkbGtmYXhOaXc2?=
 =?utf-8?B?bWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 231dcd22-59fa-460a-c614-08dda41821b8
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 10:02:51.2016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pZqI2TYnNHbJhdCCKQr7aDkTzJ9ghOsQcQ2lVH8wtVsIH0+jb5SwCNS4dlMNQ/mrQb/ZprmVXEwU8nPib3JX6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7034
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

You can simplify cover letter title to: Add debugfs for G-state and PCIe 
link states residency

On 03-06-2025 23:42, Soham Purkait wrote:

>      This patch exposes G-state and pcie link state residency
> counter values through debugfs for G2, G6, G8, G10, ModS and
> L0, L1, L1.2 respectively.
This patch series creates debugfs for dGPU G-states (G2, G6, G8, G10, 
ModS) and
PCIe link states(L0, L1, L1_2), residency counters.

>
> Soham Purkait (2):
>    drm/xe/xe_debugfs: Exposure of G-State and pcie link state residency
>      counters through debugfs
>    drm/xe/regs/xe_pmt: Macros for G-State and pcie link state residency
>      offset
>
>   drivers/gpu/drm/xe/regs/xe_pmt.h | 10 ++++
>   drivers/gpu/drm/xe/xe_debugfs.c  | 99 ++++++++++++++++++++++++++++++++
>   2 files changed, 109 insertions(+)
>
