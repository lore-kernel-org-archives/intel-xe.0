Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7909CD4851
	for <intel-xe@archiver.kernel.org>; Sat, 16 May 2026 19:41:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1698A10E1FB;
	Sat, 16 May 2026 19:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BEiYIsYm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2032B10E1FB
 for <intel-xe@lists.freedesktop.org>; Sat, 16 May 2026 19:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778960493; x=1810496493;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KkFORejIEgOlAHQzcAzximAkpb1+BkQGjZkJhvv+/Ww=;
 b=BEiYIsYmlJnRp4KejMZ7N+31apmfq24+EL95TfSA8JBnQZiAeg99zn5s
 BPftgtj7ypSV9dMiDa36jAN9sjJay9KqUaTt6OttWxkyGHYGoTWdAoXi8
 qO5jPT4GaxrY26ZHaaelM40OXEnK0RNkhpDdlvhD29SI24a3bKHyVoxvW
 p6mySXsxnKvZ2S/CwcADouygsvsA+gu9DGuvbHQJSN0XF/pmYzduxO9Mo
 cd9BiaK5EqKzLntzKsly3OqYnwB1JJqlDpUBrZ8HQ4vVFPW1va+OPQowq
 UljzBWeiVx39wB1vQMHnzX1LdkrKrcLzoKsr9J4fLDvzDn7ldztiAxh7M w==;
X-CSE-ConnectionGUID: Xfv/h9qVQBWyyPelbL0cXg==
X-CSE-MsgGUID: OCaKASZGR+aBtn9379VH9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="82441101"
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; d="scan'208";a="82441101"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2026 12:41:32 -0700
X-CSE-ConnectionGUID: myeGMSPQQeWm18nJSV32ow==
X-CSE-MsgGUID: 7bbA9Gh6QzqhchsqtPK/Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; d="scan'208";a="238892149"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2026 12:41:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 16 May 2026 12:41:30 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sat, 16 May 2026 12:41:30 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.38) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 16 May 2026 12:41:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ng/4Wpj6zht9jM9kJnsI9g8wCLOkrMkpQmwUTynmf8oaDYvxQ8kXT0NcB5aTbDQX/aiY01/9sV9+MTwQsBma346DX7k/Q8qUVhF7j02HHupvu5iNhlGqKCrJRbdTJazVZPPBOMRIocpu271z7qS89+7RdL6UvvCs0qJjdgY5tauu8s8VynHzIK45xYDoJP3jv8A2TzW0MyLZANL9B5Y/lcXUDxKHNE2gxUAG4W0AApyhqMAtIe0REVYpRPdW15Cy14N0M61oiWUpnPargL3nWBBA3uStuCkNGFWxeUbhyAz4GnpYir8u9RvOdz2v2CSU+581QnGxA7gDgoS8OW+bWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ChGphikgwS61Xh1NOJd1oznVxjZSw+rkpylIQyMhcJo=;
 b=jGsknkwvCNp7lD00dg+APIr5PJ3NH1D0/B1b5WAEfOOZpfxxLU1FPGcxxOF6wtAuvJxKjYTr4NStE0IWIry0c0ZK6DWDRuoF3oR6JG2TrBzbcSBqEIybkvGapq9HBvO6dp5KCGhfF/g8PXH7IVyQ+8QY/ePCbvQMC0ZMDkXMhS1Y5KwF3JSRIcjDsiyquPtW3Uhacx2JIVLJwf3I4IyMBg8Q46kygYpIooQThM22Qc1N1h75gG9omT/39YOlI+2bN1vbjFmfKeJPz/velgQMbFk5aWkVYnZJjtaWZzl6LiNiRFPz4nky8bWfIWMIi2kdZAxjvABEPxZq8qvDO2k8Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by MW6PR11MB8391.namprd11.prod.outlook.com (2603:10b6:303:243::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Sat, 16 May
 2026 19:41:22 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%4]) with mapi id 15.21.0025.020; Sat, 16 May 2026
 19:41:22 +0000
Message-ID: <54bccd8e-c9a6-41da-bd8f-5f0e130c6c1f@intel.com>
Date: Sat, 16 May 2026 12:41:19 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/xe: Unify fault injection hooks for CSC, GT reset
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>
References: <20260515101950.1894669-2-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20260515101950.1894669-2-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR20CA0030.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::43) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|MW6PR11MB8391:EE_
X-MS-Office365-Filtering-Correlation-Id: f70ec9fb-b286-43c8-0fd6-08deb3831b8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info: d4BtGXQn8Ev4Te2G+6ixkT7AMFkK9vZtWqrjKEouzVdddMbv/AyQZu9vxMs+nWu7a3mKoXRZgqhiHH3t4FmKUbR5eBJxCbMgNGz5Z15S49Kzgtcwt0JFfsdN8r2Y0WMqYEO9kljX6XyBLv+RU2JQsqlvuHqnBWlpxn7T0fvDVXHqSArTx81YoYcKcmlO8Um27uQ7RnLAIn3AMdmYeDLhNfsRFN5Q+FeqotReOGiBGgRDoGp8Og0bycQ+1o8uIto2EDlGKnlmJ4eY++IerTJ1oXD6f5aLLixHOocY4cJYuQbUzN6XyYCUdwMbMDuNkXPL6MMzZ0bFW/EP2chmGYX3eGXv0ElYbn3DhX1URwhnSP7/oYpHmWZxIvKTWFY7mPggZVxn3OnDSyb7KbmP2cDzOOzwRsKbAv1+QoyqPND0aDNHheKgMRBQ9n+hCg0i/NBL8WoDm4lAxZCuTR54haWRiV3ynEM0MzUTmyj81LZXe6vgyAn3fneLs/m3VrkPRUkrbKNszQFoncwMgJBjdY1BwC2qbRsJvfD1nrPSyADUlf6OES0+N3zOq45h8GLiqMcQjnRv8+K2wXd5X2W1ml1EUiz7stTPEFpkZW1h4sh8+GAdxGVQxUqG9QWISAIXrWcJIugT54ncqY6uipbz5M9vFrNLC0lGU/tboV9Ub6mWoWtjxiuOHUMW8t733MBtJ1Dh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUtNWVphclY4ZGRpbGtIYWVEaFVjOTcybTI3cWlZZFFaWE5Bdi8yWTVSS0hn?=
 =?utf-8?B?TXZYTXpSZHk5RU4xOFRyNkgxMzJ1UksydGtweVhjWnJuOUhBOEF2UGFzVFJP?=
 =?utf-8?B?M0twcjMvQTFtTFhlZFdzNTdiUC9kUXJ1UXdFb1kyZGZHTVFMWlkyeDRIWk80?=
 =?utf-8?B?NFRTb3RqbW9mN3VuUkZ2UXZDTGtQWEJOQkhPNzdJQjNDUThjUkZNWTBSSXl3?=
 =?utf-8?B?UG1kMWFiczgzTlhTMG1ZWUJjSlBXS3djSW8yWjdJUHdrWmtaSFJBVk8yUEpU?=
 =?utf-8?B?YUpIT2lGeUNWdGc3Y1BIN2FnSWV5N2JtVG5wWE9USVU4VCtGNS8zcEN4elBK?=
 =?utf-8?B?ZHo4MlNvd0gvM0YwMmd5N3RQRzZGR1N3VGwxd2F3Qkhqc1pxcmtvbWpUT0Rv?=
 =?utf-8?B?bkJpUmNKNnoxZjQ3Qjg4c1JraHNYWmQxalc1RytpcjM1VG9mUmhUZ2YwU2Rx?=
 =?utf-8?B?L09oWTd1bDZnZnlad3gxRFRQcWJQTlR5V1JHbkxvT0lOdmVKWVcxdU1TVnA2?=
 =?utf-8?B?VjhacklhUkVUTjFzMHF1TzZyZkVFR3c1bWlOeFJyM0pCSm9yL0NzbFkzNGkx?=
 =?utf-8?B?dTRJRTM1TnB6Kzlja0tzN3dxS0JmckNHL3lZSUJQQVgvODNoaXhRU056VXZN?=
 =?utf-8?B?L2RXekkvWEZoaGE0bGpvbFFhMVl5RTQ4N3ZucDQ1eFhKbGhxT2RCL0ZvUnhy?=
 =?utf-8?B?c3NUaENvMzJGRWV0bTdhZFpCN21WNnlUYWJhdUlTbFJ3azVmUk1BckVwcjZn?=
 =?utf-8?B?UmRDSlFUSmNzUUNXRGhjY3ZpRGZLTlcrOGsvNnhLRVBmSUdneVEwNEJ0YTFM?=
 =?utf-8?B?QWpCRGRicTJrbEFrOHEvZE1jOGVLSm5RKzU0VVlQTEhRYlRBak1hZkQrSmFh?=
 =?utf-8?B?aHpxSVJwaDBsOFJyaFVSY2pUbGRVSURETkZMcm5oWm1neXpaU1pQTDNnMGcw?=
 =?utf-8?B?bDZidjBSckQrOU0rbkhJT3FpTjlxeXNUVVI1cHQwMjk0WVNwamJ6ZWNjZUhw?=
 =?utf-8?B?dmxZYy9ldEppSTlMWnM0TUVWRi9FTXNaS2RXR3kzQ1FSd2dGMWtxRk1CZlFw?=
 =?utf-8?B?YWRXT25zK1lmWElQTC9nSkF2T1dxcXdVVVpneSs1elc5dGVCbHhuYjlKdSty?=
 =?utf-8?B?akE3UGY1a0pDOXl3cllFYXVxSENpTW92ZXc0aG8zbk0zUWxQTGluUlVpdHhv?=
 =?utf-8?B?RkJRazNOYURYaEhQdlVJSFZiSGRSSWNyZGpPd0dUTzYvdlZGeXRNSi9ndUxp?=
 =?utf-8?B?eTZXcDFwU1NBaXNiUzB0Vm02amhGNFloY3hBZnJKay85Z0lhNkF3OE9SclNt?=
 =?utf-8?B?WUE1S3BjTG1LSzVDdU85T29WN3V4OFdJN1lDY3JjY2l5WURQSFhZVzRXZ1hO?=
 =?utf-8?B?Z09WcVZtNVVjTzhLVjRlb3RkL2x3ZEJmbFF0UHdEUUF5bjc3QVZOWlBhYTd4?=
 =?utf-8?B?c1pBYURlSHVjbTVOMGZDVTBXbXNzTjhDYy9BUEFhSmVoOE02N2Y4U2oraXhL?=
 =?utf-8?B?dGV5ZWt0OHIybzRBMEhVcldRM0xVSzE3YmwyMDBJS0ZDQlJNOXZQZk9TYzho?=
 =?utf-8?B?UHJSRkVIM2RUeUhBNnl2ZUUzTXVyRGlOVTFkN0g2ZTlDU1VsOEFKWXg3WjZm?=
 =?utf-8?B?QnF3QmVjZmdKRFFEa2pWSjM5OUFnTnE5djVxWGtYN1gvcG1hK2dId3lpQlNR?=
 =?utf-8?B?VWNUZWMvb3JLenU3ejZBWnJ3MEZ4RHFMTVZaa1AzeExHbks4OFd2bDBLYkN5?=
 =?utf-8?B?WUJNWllaTEw1TzJXNjk1emZ6QUFMOGwraXNtV1J4Z0lNNU9rditaYm9kK25Q?=
 =?utf-8?B?NGZEUzIycUtQOEUrM1IzNlA1ZlhhSjQ3VHA3NVlFUk5kT3huRHZWUDhhdEk5?=
 =?utf-8?B?c0NHV2JDbVZzSlQzd01BSE41Tm5XL3ZNOXBNMUgzTTVaT1NBTFluRjh2ZVBh?=
 =?utf-8?B?eGdPaHZwVTh6bktsQWR2ZkVqMS9kUGVCVFVHcG5zbnVvcDdOQ1V4R1VMK0s0?=
 =?utf-8?B?SFRUdjQyOUk5b3BlaVRON1ZRUmUwSm1ud2JLaFhZYkQ5V3YvU0t0d0tKdUFz?=
 =?utf-8?B?Q2tzaFRsMkxKcEtZTDFTTHRyLzFHNzF3cDdTYzJmY3FLSDN1VmFJV2tJQ0M2?=
 =?utf-8?B?a202c2dCdnVMdGVFeVFSUTBleDdmMlJTQVh4eDNOTnpnLzg1ZmRqaERRMGpM?=
 =?utf-8?B?ajRVWUFucGJLcVZlVE5sRW1ObDE1TzA1dkRJVzFTRVRpTjF0eG1Nbis4MDIy?=
 =?utf-8?B?WVpkdmZURi91MmZpUlVXRTA0bERwZ1VYa0lMRzlrVkU2Z2EvRyszTTFldmE3?=
 =?utf-8?B?M2JyS0t0VWR5TEsvd3p5VmM2aklsZXFjaVdMWTJRa29NR0szbk1vR2dJVllW?=
 =?utf-8?Q?AoNxokcrfCFwSZpk=3D?=
X-Exchange-RoutingPolicyChecked: mDLxCaTJsLu1JyFrYn6hEEgjuxepCdWkvVvXJqZatrDRYqRiqlQDhsYwr0Ses00YNSrtrGU5KoEjgwj2rwi4aNjviaQ5YaFSE13Wi5q7rl4Dw07ZmhQsFJG78S3z13LWrhTG7yMjuNb4Xp42dfYayFgtnu/QxPOsPPjH8NNKuWfajq//qcNLLCFp1Gt1HUj10xPDAl9IxTXEerC08tAJ1iy3Rfl63fy3gp0JcREB1lCivfk49G8zrtCKVPLI0QFcMmK1mhBaOQtkRM9rpObtn3NOXWmX/K2Krqfexo7nA3PcL3Q++tsAYnf318T91U+Vj2Iz5E8y7t2DOGj2vDEFEQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f70ec9fb-b286-43c8-0fd6-08deb3831b8b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2026 19:41:21.9367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w52WPgpMcwqh+V5U/eCw8hH3RAb+2UOnHYBfPFPQIZwOorHBXE1Ls4zs7RiAPxxATVslvn4gWdrBmnmB/2lL1MrY5jYZiWw8aT6/ZhFTcz0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8391
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


On 5/15/2026 3:19 AM, Mallesh Koujalagi wrote:
> The fault injection code was scattered: the GT reset
> hook lived in xe_gt.h as an inline function with its own global
> variable, the CSC hook had a separate global in xe_hw_error.c with
> an extern declaration, and each was individually registered in
> xe_debugfs.c. Adding a new error type meant editing many files and
> copy-pasting the same boilerplate.
>
> Create a single, centralized fault injection module
> (xe_fault_inject.c/h) that manages all fault types through
> one table. Each type is just an entry in an enum and a one-line
> row in a descriptor array -- no more scattered globals,
> externs, or per-type inline helpers.
>
> Debugfs interface (under /sys/kernel/debug/dri/0/):
>   - fail_gt_reset         - GT reset failure
>   - inject_csc_hw_error   - CSC firmware error
>
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v2:
> - Add multiple platform support. (Vinay)
> - Handle VF properly.
> - Rename to XE_FAULT_GT_RESET/XE_FAULT_CSC_HW_ERROR and
>    create xe_fault_inject_types.h file including those name.
>
> v3:
> - Solved patch apply issue on tip.
>
> v4:
> - Add proper header file.
> ---
>   drivers/gpu/drm/xe/Makefile                |  1 +
>   drivers/gpu/drm/xe/xe_debugfs.c            |  9 +--
>   drivers/gpu/drm/xe/xe_fault_inject.c       | 68 ++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_fault_inject.h       | 31 ++++++++++
>   drivers/gpu/drm/xe/xe_fault_inject_types.h | 21 +++++++
>   drivers/gpu/drm/xe/xe_gt.c                 |  5 +-
>   drivers/gpu/drm/xe/xe_gt.h                 |  8 ---
>   drivers/gpu/drm/xe/xe_hw_error.c           | 11 +---
>   8 files changed, 128 insertions(+), 26 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_fault_inject.c
>   create mode 100644 drivers/gpu/drm/xe/xe_fault_inject.h
>   create mode 100644 drivers/gpu/drm/xe/xe_fault_inject_types.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 09661f079d03..b36cf511a537 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -351,6 +351,7 @@ endif
>   
>   ifeq ($(CONFIG_DEBUG_FS),y)
>   	xe-y += xe_debugfs.o \
> +		xe_fault_inject.o \
>   		xe_gt_debugfs.o \
>   		xe_gt_sriov_vf_debugfs.o \
>   		xe_gt_stats.o \
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 22b471303984..8402189b24ef 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -6,7 +6,6 @@
>   #include "xe_debugfs.h"
>   
>   #include <linux/debugfs.h>
> -#include <linux/fault-inject.h>
>   #include <linux/string_helpers.h>
>   
>   #include <drm/drm_debugfs.h>
> @@ -14,6 +13,7 @@
>   #include "regs/xe_pmt.h"
>   #include "xe_bo.h"
>   #include "xe_device.h"
> +#include "xe_fault_inject.h"
>   #include "xe_force_wake.h"
>   #include "xe_gt.h"
>   #include "xe_gt_debugfs.h"
> @@ -38,9 +38,6 @@
>   #include "xe_vm.h"
>   #endif
>   
> -DECLARE_FAULT_ATTR(gt_reset_failure);
> -DECLARE_FAULT_ATTR(inject_csc_hw_error);
> -
>   static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
>   				   u32 offset, const char *name, struct drm_printer *p)
>   {
> @@ -563,8 +560,6 @@ void xe_debugfs_register(struct xe_device *xe)
>   		drm_debugfs_create_files(debugfs_residencies,
>   					 ARRAY_SIZE(debugfs_residencies),
>   					 root, minor);
> -		fault_create_debugfs_attr("inject_csc_hw_error", root,
> -					  &inject_csc_hw_error);
>   	}
>   
>   	debugfs_create_file("forcewake_all", 0400, root, xe,
> @@ -610,7 +605,7 @@ void xe_debugfs_register(struct xe_device *xe)
>   
>   	xe_psmi_debugfs_register(xe);
>   
> -	fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_failure);
> +	xe_fault_inject_debugfs_register(xe, root);
>   
>   	if (IS_SRIOV_PF(xe))
>   		xe_sriov_pf_debugfs_register(xe, root);
> diff --git a/drivers/gpu/drm/xe/xe_fault_inject.c b/drivers/gpu/drm/xe/xe_fault_inject.c
> new file mode 100644
> index 000000000000..80811850a2ef
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_fault_inject.c
> @@ -0,0 +1,68 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
s/2025/2026 here and elsewhere.
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/fault-inject.h>
> +
> +#include "xe_device.h"
> +#include "xe_fault_inject.h"
> +#include "xe_platform_types.h"
> +#include "xe_sriov.h"
> +
> +static struct {
> +	const char *name;
> +	u32 platforms;
> +	bool skip_on_vf;
> +	struct fault_attr attr;
> +} xe_fault_inject_descs[XE_FAULT_MAX] = {
Nit: Descs are more for descriptors, maybe xe_fault_inject_entry?
> +	[XE_FAULT_GT_RESET]	= { .name = "fail_gt_reset",
> +				    .attr = FAULT_ATTR_INITIALIZER },

Should have some reference to the patch that introduces 
FAULT_ATTR_INITIALIZER. Can they both be in the same series?

With the nits addressed and copyright year fixed, this patch is-

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

> +	[XE_FAULT_CSC_HW_ERROR]	= { .name = "inject_csc_hw_error",
> +				    .platforms = BIT(XE_BATTLEMAGE),
> +				    .skip_on_vf = true,
> +				    .attr = FAULT_ATTR_INITIALIZER },
> +};
> +
> +/**
> + * xe_fault_inject - Check if a fault should be injected
> + * @type: fault injection type to check
> + *
> + * Returns true if a fault should be injected for the given type.
> + * Controlled via debugfs fault injection attributes.
> + */
> +bool xe_fault_inject(enum xe_fault_type type)
> +{
> +	if (type >= XE_FAULT_MAX)
> +		return false;
> +
> +	return should_fail(&xe_fault_inject_descs[type].attr, 1);
> +}
> +
> +/**
> + * xe_fault_inject_debugfs_register - Register fault injection debugfs entries
> + * @xe: xe device instance
> + * @root: debugfs root directory
> + *
> + * Creates debugfs fault injection attributes for all supported fault
> + * injection types. Platform-specific entries are only registered on
> + * matching platforms. Entries marked skip_on_vf are not registered for
> + * SR-IOV VF devices.
> + */
> +void xe_fault_inject_debugfs_register(struct xe_device *xe, struct dentry *root)
> +{
> +	int i;
> +
> +	for (i = 0; i < XE_FAULT_MAX; i++) {
> +		if (IS_SRIOV_VF(xe) && xe_fault_inject_descs[i].skip_on_vf)
> +			continue;
> +
> +		if (xe_fault_inject_descs[i].platforms &&
> +		    !(xe_fault_inject_descs[i].platforms & BIT(xe->info.platform)))
> +			continue;
> +
> +		fault_create_debugfs_attr(xe_fault_inject_descs[i].name, root,
> +					  &xe_fault_inject_descs[i].attr);
> +	}
> +}
> diff --git a/drivers/gpu/drm/xe/xe_fault_inject.h b/drivers/gpu/drm/xe/xe_fault_inject.h
> new file mode 100644
> index 000000000000..bc4d856407e8
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_fault_inject.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_FAULT_INJECT_H_
> +#define _XE_FAULT_INJECT_H_
> +
> +#include <linux/types.h>
> +
> +#include "xe_fault_inject_types.h"
> +
> +struct xe_device;
> +struct dentry;
> +
> +#ifdef CONFIG_DEBUG_FS
> +bool xe_fault_inject(enum xe_fault_type type);
> +void xe_fault_inject_debugfs_register(struct xe_device *xe, struct dentry *root);
> +#else
> +static inline bool xe_fault_inject(enum xe_fault_type type)
> +{
> +	return false;
> +}
> +
> +static inline void xe_fault_inject_debugfs_register(struct xe_device *xe,
> +						    struct dentry *root)
> +{
> +}
> +#endif
> +
> +#endif /* _XE_FAULT_INJECT_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_fault_inject_types.h b/drivers/gpu/drm/xe/xe_fault_inject_types.h
> new file mode 100644
> index 000000000000..cf0cd0974be1
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_fault_inject_types.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_FAULT_INJECT_TYPES_H_
> +#define _XE_FAULT_INJECT_TYPES_H_
> +
> +/**
> + * enum xe_fault_type - Fault injection types
> + * @XE_FAULT_GT_RESET: GT reset failure injection
> + * @XE_FAULT_CSC_HW_ERROR: CSC hardware error injection
> + * @XE_FAULT_MAX: Number of fault injection types
> + */
> +enum xe_fault_type {
> +	XE_FAULT_GT_RESET,
> +	XE_FAULT_CSC_HW_ERROR,
> +	XE_FAULT_MAX
> +};
> +
> +#endif /* _XE_FAULT_INJECT_TYPES_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index cdc678d1ae1f..f900c252a523 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -23,6 +23,7 @@
>   #include "xe_eu_stall.h"
>   #include "xe_exec_queue.h"
>   #include "xe_execlist.h"
> +#include "xe_fault_inject.h"
>   #include "xe_force_wake.h"
>   #include "xe_ggtt.h"
>   #include "xe_gsc.h"
> @@ -923,7 +924,7 @@ static void gt_reset_worker(struct work_struct *w)
>   
>   	xe_gt_info(gt, "reset started\n");
>   
> -	if (xe_fault_inject_gt_reset()) {
> +	if (xe_fault_inject(XE_FAULT_GT_RESET)) {
>   		err = -ECANCELED;
>   		goto err_fail;
>   	}
> @@ -980,7 +981,7 @@ void xe_gt_reset_async(struct xe_gt *gt)
>   	xe_gt_info(gt, "trying reset from %ps\n", __builtin_return_address(0));
>   
>   	/* Don't do a reset while one is already in flight */
> -	if (!xe_fault_inject_gt_reset() && xe_uc_reset_prepare(&gt->uc))
> +	if (!xe_fault_inject(XE_FAULT_GT_RESET) && xe_uc_reset_prepare(&gt->uc))
>   		return;
>   
>   	xe_gt_info(gt, "reset queued\n");
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 4150aa594f05..f8e3ca63aabb 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -6,8 +6,6 @@
>   #ifndef _XE_GT_H_
>   #define _XE_GT_H_
>   
> -#include <linux/fault-inject.h>
> -
>   #include <drm/drm_util.h>
>   
>   #include "xe_device.h"
> @@ -38,12 +36,6 @@
>   	xe_gt_is_media_type(gt_) ? MEDIA_VER(xe) : GRAPHICS_VER(xe); \
>   })
>   
> -extern struct fault_attr gt_reset_failure;
> -static inline bool xe_fault_inject_gt_reset(void)
> -{
> -	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&gt_reset_failure, 1);
> -}
> -
>   struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
>   int xe_gt_init_early(struct xe_gt *gt);
>   int xe_gt_init(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index 5135e8e4093f..192e68e847a5 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -4,7 +4,6 @@
>    */
>   
>   #include <linux/bitmap.h>
> -#include <linux/fault-inject.h>
>   
>   #include "regs/xe_gsc_regs.h"
>   #include "regs/xe_hw_error_regs.h"
> @@ -12,6 +11,7 @@
>   
>   #include "xe_device.h"
>   #include "xe_drm_ras.h"
> +#include "xe_fault_inject.h"
>   #include "xe_hw_error.h"
>   #include "xe_mmio.h"
>   #include "xe_survivability_mode.h"
> @@ -25,8 +25,6 @@
>   						 (PVC_COR_ERR_MASK & REG_BIT(err_bit)) : \
>   						 (PVC_FAT_ERR_MASK & REG_BIT(err_bit)))
>   
> -extern struct fault_attr inject_csc_hw_error;
> -
>   static const char * const error_severity[] = DRM_XE_RAS_ERROR_SEVERITY_NAMES;
>   
>   static const char * const hec_uncorrected_fw_errors[] = {
> @@ -167,11 +165,6 @@ static_assert(ARRAY_SIZE(pvc_master_local_nonfatal_err_reg) == XE_RAS_REG_SIZE);
>   						 pvc_master_local_fatal_err_reg : \
>   						 pvc_master_local_nonfatal_err_reg)
>   
> -static bool fault_inject_csc_hw_error(void)
> -{
> -	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&inject_csc_hw_error, 1);
> -}
> -
>   static void csc_hw_error_work(struct work_struct *work)
>   {
>   	struct xe_tile *tile = container_of(work, typeof(*tile), csc_hw_error_work);
> @@ -507,7 +500,7 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
>   {
>   	enum hardware_error hw_err;
>   
> -	if (fault_inject_csc_hw_error())
> +	if (xe_fault_inject(XE_FAULT_CSC_HW_ERROR))
>   		schedule_work(&tile->csc_hw_error_work);
>   
>   	for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++) {
