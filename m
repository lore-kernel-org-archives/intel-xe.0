Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3FC9C4452D
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 23:09:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C2B10EBAA;
	Tue, 21 Jul 2026 23:09:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mxErbycT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8477010EBAA
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 23:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784675370; x=1816211370;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7pxEdmNqAcEur2fZff36zKBSOU7KcFGPc+N0hPm4VGI=;
 b=mxErbycTPx0bY75MQhMMx4aps8HiC+fz/kluHYPe5iSyszA3Tx3FuLJI
 y6TxPVgja/oJ7p9y1TDx5h15LNfpdKXcJy7IbmDUySUQZqw068JhYvnHc
 A45yXaMhHQQ5lMBLY+29ok30P2JCL78AaLvTttterZMkaFEPp4szzf2xM
 6QdL02fk18s4CRp/qOhZTUD2CdwIBgVnwc9Ytoew7Np65L3JB73DuLTPQ
 HVFw+kdQbrK4TH3gI6kpz/ZRZ+/s8RtrC8cQLt4kKv342zaYy4kEMTyB9
 TK6rpD8TF0jB5mMw+ZplNI2aSpFB5nMvMjGOyTzuqDEnV5oorhEnQpelX Q==;
X-CSE-ConnectionGUID: Lah4sKnIT9uDil1SAJrYWg==
X-CSE-MsgGUID: dV0ovXYLS5uGwqIJIEirYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="84273797"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="84273797"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 16:09:29 -0700
X-CSE-ConnectionGUID: LsPypOdYRxO//ClYM/0AKg==
X-CSE-MsgGUID: NL6juoZLSxigbILK3ICHQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="255260680"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 16:09:29 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 16:09:28 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 16:09:28 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.17) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 16:09:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mcdE08joyQTWdk2xObnHDRkug8HsCK0LiXq2QIhu+9any+LC4hvpb3G/MTbNSCWsjEvKdPR9bxWzhIcSUWjNiX/Xzugf4yxVSrnc7UlhH58Gf/xjuRKGV/G0wtwfaxWs6svMAJejZNWs4JJ7nw0TMarqZhOQqumO70qq1mnhTEw11Fp7kM+x9H0B3cw6gpxBRLHnqU62wuCl3+NgIB/kAXHcZ6sxoa1JCNB8TgQMuLsArT2bE/0kUwBlEcvDsBfbnfXrPsoyaq49trVJGTmYmJjQl+YWOCYJ1WLEP7p6/ouJh63kDmh1+YY4lz9NFIMlFws5KhjVQVERXN71sOOnAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MAyeBjaYRH9E5anKHHsGiaBe7TdoIymHsSDKZkEEl1Q=;
 b=YrxU+CW/Lr+6iI0aoRBrRO50bD24YyntsdRkKkXm7xGO75VYXcWsNc2T2nx5ZD0mLq4bDhQ/Y27cbHgo4P+r6d+fLFRC5o0X1MdlHjnTXVztU0QxSTIDRdK89eZ63OQn3KMt60vzGkFAJyiXsZhpi1sTAHGmEVMEH+c7+LLG+Z+MJda3WaiR3eXqZhwOznZgbH39f/eVmU3lIsX4hFn5CNzKOpANvrpbnkniNYE7qKlWsBFpU1Rx0mAOfgUorQ4K9Y676kp2lK1gfITzF7oPeoauLYeEiIvjqSqtK9QdQgjsE7m9rmLUdxMqKcsKXZ9S6QuQ/QuxOVDUBAg0op3oVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8177.namprd11.prod.outlook.com (2603:10b6:8:17e::22)
 by CYXPR11MB8753.namprd11.prod.outlook.com (2603:10b6:930:d5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 23:09:21 +0000
Received: from DM4PR11MB8177.namprd11.prod.outlook.com
 ([fe80::5c75:19e7:62d9:80fb]) by DM4PR11MB8177.namprd11.prod.outlook.com
 ([fe80::5c75:19e7:62d9:80fb%4]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 23:09:21 +0000
Message-ID: <47b38d6c-a26c-4dc0-a69b-4e6c75913a90@intel.com>
Date: Tue, 21 Jul 2026 19:09:18 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] drm/xe/guc: Compress GuC log and CTB dump with zstd
To: Julia Filipchuk <julia.filipchuk@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
References: <20260716155114.1427366-1-zhanjun.dong@intel.com>
 <20260716155114.1427366-3-zhanjun.dong@intel.com>
 <37a77d86-16eb-4319-a4c7-7e448d6c7d9e@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <37a77d86-16eb-4319-a4c7-7e448d6c7d9e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0117.namprd04.prod.outlook.com
 (2603:10b6:303:83::32) To DM4PR11MB8177.namprd11.prod.outlook.com
 (2603:10b6:8:17e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8177:EE_|CYXPR11MB8753:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b547e72-c8df-47ca-de91-08dee77d18cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|22082099003|18002099003|10067099003|4143699003|11063799006|56012099006|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info: 3UzKfl3rlFWx6GsqUVih/k/P3HGS/6hOrPCiDHSFjq/NaboDdfGWCjEnVdwkHPPl90o4Hf3J7YAvHSQ95uVnOZGQcrGTQlNZWUmOLpD84BALtW1EWm0mcoevEKz8+S9fq1pQ/Ux2N86v6x93N05NQcdIuITbtGrjKqUgycz+0tqUVdl7/wQo02yVi/YMvmhI2Sv/RpQEEK4KcLbumeUmSpBWhfIlnWGUaN4Qc22m9d4jJ2Hkq9X6xhrqFpPVFUWRy4Uevr8o6nlfJuC4FR5/VrJ4ohh3Hm2OV8d31Pw11xAl1et6YgezrDhgafxFMgtwP1HETa/grA5xYZewbl3i0LctZUdZiGEPemDgqYeMIjyk5Z/zCV4o6zV71bwjatIgAdYtEq7k9Xj3PV0XRYOweATaGnsPWv59noCLJgRNttdk66mI8qEKxcvj69Wnm9ka8wNiVOFmCKnHZ0Ae08/5CJn4GvjfkjYpTmrgMVkbIX/eUZUjK3jlUwunCguEuEgOoAEnF95bIUqUFywWSWa30etDN0xha3XsiJdxJBk3hx9ty8wbVUucG1XDfMFstC9X9KVGEndvOx8VnbCK2V4Iej2WnkSDvZ0ybdbgD7Adk1dqS/qzpJnkl+x1EdbNn/e6hK/AHKtF6qgrMAkHkRZxfzFiHuZvh/N/LnNhs02fObE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(22082099003)(18002099003)(10067099003)(4143699003)(11063799006)(56012099006)(3023799007)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVc5RGllZUwvbndHcCtoZktTd3ZDaE5tQkJzYUhNZk5OQ2NNcnM1dGNwK1Rt?=
 =?utf-8?B?ekdNaW5JdVBBdkpQWVg2a0llUXdrU0JSOFZucGZwYTVPUjJENFpNR1dLTnE0?=
 =?utf-8?B?WDFOd1RvU0F0RXIvRS82R1owUVJoOE1BVTZlZi9MYVZMQ0RWSkcyOUlBR3lM?=
 =?utf-8?B?WURVNWF5VnYxTzBSL3Ixa0VJMTJzYnhYbFRyNytxVkR0QU1leHNKUmpwQVJn?=
 =?utf-8?B?REVOS2FYYzNOTmNIT241MmsrdXBITjhOTW96cXN3TnFOWEZXMEVyVVAxOVV0?=
 =?utf-8?B?STV3TnhKZlJLbWJkQktJM2trSUJJNHVIRlNxaVRSWE8vSlUvU0diczA4Z3Jo?=
 =?utf-8?B?aTdNMTduTnNUclg0VFY4VHc2SXRDVkdiK2JROXVCSVdoOUZJMkJiaTN6c0ZL?=
 =?utf-8?B?bWVBR21jcEYzOVc0Y2J3UmV2dWljTHVYZnNuUWdsQ0hXSjIyVkNtQ01XU0FE?=
 =?utf-8?B?b0VBVlo3djJrOHhpN1Z3TlBxOGozVzFTN2pMUTFldHYzUUpFQUJQeSttYjZv?=
 =?utf-8?B?SElkYm9udzJLVm1BMkR4czVvVWtPT1pzcjZ3eHZUYmticGd2bGlYdS9scmxx?=
 =?utf-8?B?azcwWUpsVDNUTkphRUVvZU1wYzBSa3o1VU1tYllsbGd4dmVFNHJCQ0lZcG4x?=
 =?utf-8?B?U01tZTRydzZBN0gyVklET29xbEJOZXRzMDBsK0Y4TG5SQ0k3aHkrOHZxUG5R?=
 =?utf-8?B?V1o2Qi93RWl1aGxFU2ZkUm1XZTBpbm9SQ0g5Q0hxU2dUNHFiMENiOWdJYURX?=
 =?utf-8?B?OTFDREQ2YlF2K2MxQjlvR2pKTzFwWG5kdXNrYzFFTXZvK1k3dSthYk4xNUhp?=
 =?utf-8?B?eVAxcDZZV0RsbEdWTmhHOEo0ZDhReE5KYm5hWDhuMGliVWg5VDBUd3A1eXI4?=
 =?utf-8?B?UWMrY0V5bGg2M1IvSng0N0U4UkMvUjFURXRaSmxUN2pTWFl0OEgzYlJLRFFN?=
 =?utf-8?B?Z0Y3bEI2V0dHcFNXaGlYc1d5WDlCTXVlUTFwUEdyLzZCenhZaWdWSWViS25w?=
 =?utf-8?B?VksySVhWb3VENlFPcis4NDZkdFFmRHlLYTF2OWxCYnBnYm1UdjVLUEl5MVA0?=
 =?utf-8?B?ZHpqRGxiZDZGZ2VvaENWenpyRGwxVldUbW1VYjZ2bzFiNkpqS0dMTzM3d0hj?=
 =?utf-8?B?Mmp0czR3OW43TTJjcE5HU1M2RHlHZFJKdmRrbDZremlqVW16T1MreG0wS044?=
 =?utf-8?B?UXNYVVRpSXpBdjhIVjVQL1hGRXRpRTM0YXBKNFhRZzh6aU9QdDE3ZjlzdXdy?=
 =?utf-8?B?MEFOb05pRkUxTVFNZXVDR3BYSmRyS0M5V2tqWWFjSHpsajhnSytWYUI2OUc4?=
 =?utf-8?B?aCtKbGx2QjczYlBiRlluUHNvNmxHdUtneHZIQk9RbzA2S3pmK29uUmNucjlG?=
 =?utf-8?B?bmphNXpJK0lXVFcrMWh5aWFPNCtHOXhaSXM4NXdxbFNkOEJ2eEU0Qld6UHFB?=
 =?utf-8?B?cDYvTzVKZFNwZHBiSlNkWUhuc0NHRjB0WE1jbnNCc3ZoYXhSVzZCUmY1ZEtH?=
 =?utf-8?B?SHhEUUwvR28zWHIxR2tmNzdUQVN4RERUNWhqNUcyWnFCQ0VPZFY2UVpRRXdq?=
 =?utf-8?B?MmU1dWEySnBucm5sZGJNcS95a2ZyNFcrVG42UzdIZnprdnpHS0lqRzRsQ05P?=
 =?utf-8?B?Ly9UdVhXWkxSejJsMTZrdG9hamZldW5mb2o5cTVOWVRIQjkzbExMY2FaSVhj?=
 =?utf-8?B?WmpBV01nWExpM1RhOHkxWFhmbEhEL253NU0wTlN2MmM2ejFsMDhuSzJSakxF?=
 =?utf-8?B?ZDVVbWg0V0l6ZDJ6RjNRN1Bab3BvQlNkNmxMNk5tdjJrdEVUUnUzUHJyU3hM?=
 =?utf-8?B?RkJ2RGlnd1lMUElBcFNkeUI0Q1FzTjNmUTRSNExTN2lTZTdzaXBNTzR3aUJi?=
 =?utf-8?B?eUVuODYvQjhLeCtGNlZyTFhKaEx4VXlUcit6eTlJM0ptQTFUTDB2MktTOXNC?=
 =?utf-8?B?NGFVOGwxYlVMUlEzL0w3SG1URm4wWlozY1FOemU2dkd5bi95VXVoWEZkUUY1?=
 =?utf-8?B?RTUreWFTVDdaQlpnd1M5YUlFblJuNEsyLzhQUk9YeENyNWRWcmJ1c3E4UVp5?=
 =?utf-8?B?ZlVWeU1jb3MxMElwdEtmSVNXN2cvQmhJSndOc0hTQUM3YjhXak9IV3JmWmp3?=
 =?utf-8?B?aDVmZng2M01KV3dqT1YrVXZMdHRtMlhVSjJRRGlINTRTR2J5TlFVRVA5Tmcx?=
 =?utf-8?B?QzdmV1Niam1yVlFydFE5eE1VbmZXNzRjTGRsQUVjRW8vSEU5S2RMNlVPVUNN?=
 =?utf-8?B?SGZPaXJlajh4bjdHRGJlQ1dkNENVVHR6VFRHdGRCdll0TU53dCthWXlCeDUy?=
 =?utf-8?B?Q3A0ZkFXWUFnc0FKaU8vTHc1UDJkaG9ycFM3SkdaeEZ2bzRLN1M3Zz09?=
X-Exchange-RoutingPolicyChecked: ViKrakKUuo1FeOVbIlnOYYDqlnIEdfPLm3CHhONMY9cFKLXmoZglWDmX5LJDUUwRQqgcmE7BbJSx0lGtXBz+xc7oI7r2uZs695yiEqsTlZUEibjaQy9X06Hm/1HzV0qnd4ubUVzlIuCU1jEnplOfOeEwWsOrEobcRZWrll2szjomLeAYaYas7ND/nsZqDDEuJOmGA8TMj/doGmBtPyIkxG/x3PNbxF0eMWBi3mUjo6gif8GHUjrD3Gu6At+Sq5NN8xfks0stYLfF5WuItq7dEOHiwRgQbCKwlIUQxTGYbMJd66n79UDXcIlfUaEpv/gSb6CDHm4EVfVSAP6QIR1rNg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b547e72-c8df-47ca-de91-08dee77d18cf
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 23:09:20.8739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6UQJ0bHSkaeStOKF3aYW7aKPq72JjXdBUtNuxJkXqTzuOwrMC6ll5V8/cdvPoOQ+BtPL692kWZ/yUFBdh2DHFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8753
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

Thanks for review, please see my comments inline below.

Regards,
Zhanjun Dong

On 2026-07-21 12:29 p.m., Julia Filipchuk wrote:
> Patch looks generally good.
> 
> Please check deallocation in xe_guc_print_blob_compressed().
See my comments in that area.

> 
> Please remove added build files.
>>   kernel/build64-debug/Makefile             |   3 +
>>   kernel/build64-debug/scripts/basic/fixdep | Bin 0 -> 16936 bytes
> 
Oops, to be removed.>
> 
> On 7/16/2026 8:51 AM, Dong, Zhanjun wrote:
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
>> index 538d4df0f7aa..d0325c4f7b86 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>> @@ -225,16 +228,149 @@ struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log,
>>   	return snapshot;
>>   }
>>   
>> +#if IS_ENABLED(CONFIG_DRM_XE_COMPRESS_DUMP)
>> +static void xe_guc_print_blob_compressed(struct xe_gt *gt, struct drm_printer *p,
>> +					 const char *length_label, const char *data_label,
>> +					 void **chunks, int num_chunks,
>> +					 size_t chunk_size, size_t total_size)
>> +{
>> +	zstd_parameters params;
>> +	zstd_cstream *cstream;
>> +	zstd_out_buffer outbuf;
>> +	size_t wksp_size, dst_size;
>> +	size_t remain, ret;
>> +	void *wksp = NULL;
>> +	char *dst = NULL;
>> +	int i;
>> +
>> +	/*
>> +	 * Pass 0 as estimated_src_size to use zstd level-3 defaults
>> +	 * (windowLog=18, 256KB window). Passing the full total_size would
>> +	 * cause zstd to inflate windowLog proportionally (e.g. windowLog=24
>> +	 * for a 19MB log), making the workspace tens of MB.  With 0, the
>> +	 * workspace stays ~1.5MB, well within kmalloc limits.
>> +	 */
>> +	params = zstd_get_params(3, 0);
>> +
>> +	wksp_size = zstd_cstream_workspace_bound(&params.cParams);
>> +	wksp = kvzalloc(wksp_size, GFP_KERNEL);
>> +	if (!wksp)
>> +		goto err;
>> +
>> +	dst_size = zstd_compress_bound(total_size);
>> +	dst = kvzalloc(dst_size, GFP_KERNEL);
>> +	if (!dst)> +		goto err;
>> +
>> +	cstream = zstd_init_cstream(&params, 0, wksp, wksp_size);
>> +	if (!cstream) {
>> +		xe_gt_err(gt, "failed to init zstd cstream\n");
>> +		goto err;
>> +	}
>> +
>> +	outbuf.dst = dst;
>> +	outbuf.size = dst_size;
>> +	outbuf.pos = 0;
>> +
>> +	remain = total_size;
>> +	for (i = 0; i < num_chunks && remain; i++) {
>> +		size_t size = min(chunk_size, remain);
>> +		zstd_in_buffer inbuf = { .src = chunks[i], .size = size, .pos = 0 };
>> +
>> +		while (inbuf.pos < inbuf.size) {
>> +			ret = zstd_compress_stream(cstream, &outbuf, &inbuf);
>> +			if (ZSTD_isError(ret)) {
>> +				xe_gt_err(gt, "zstd_compress_stream failed: %s\n",
>> +					  ZSTD_getErrorName(ret));
>> +				goto err;
>> +			}
>> +		}
>> +		remain -= size;
>> +	}
>> +
>> +	do {
>> +		ret = zstd_end_stream(cstream, &outbuf);
>> +		if (ZSTD_isError(ret)) {
>> +			xe_gt_err(gt, "zstd_end_stream failed: %s\n",
>> +				  ZSTD_getErrorName(ret));
>> +			goto err;
>> +		}
>> +	} while (ret > 0 && outbuf.pos < outbuf.size);
>> +
>> +	drm_printf(p, "%s.length: 0x%zx -> 0x%zx Algo: ZSTD\n",
>> +		   length_label, total_size, outbuf.pos);
>> +	xe_print_blob_ascii85(p, data_label, '\n', dst, 0,
>> +			      DIV_ROUND_UP(outbuf.pos, sizeof(u32)) * sizeof(u32));
>> +	goto out;
>> +
>> +err:
>> +	drm_printf(p, "%s.length: 0x%zx Algo: ERROR (compression failed)\n",
>> +		   length_label, total_size);
>> +out:
>> +	kvfree(dst);> +	kvfree(wksp);
> 
> Possible free of unallocated pointer? I don't think kvfree checks for null.
> 
> Maybe add checks before free. Or implement full error unroll via gotos.
> 
> 	if (dst)
> 		kvfree(dst);
> 	if (wksp)
> 		kvfree(wksp);
> 
kvfree calls vfree and kfree, both can handel null.
Double check with Xe module, no "null check" for kvfree, so will keep as 
is.>> +}
>> +#endif
>> +
> 
> 
> 
> 
>>   /**
>> - * xe_guc_log_snapshot_print - dump a previously saved copy of the GuC log to some useful location
>> - * @snapshot: a snapshot of the GuC log
>> - * @p: the printer object to output to
>> + * xe_guc_print_blob - Print binary data (compressed or uncompressed) as ascii85
>> + * @gt: GT structure for error reporting
>> + * @p: drm_printer for output
>> + * @length_label: label prefix for the length/metadata line (e.g. "[LOG]" or "[CTB]")
>> + * @data_label: label for the ascii85 blob (e.g. "[LOG].data" or "[CTB].data")
>> + * @chunks: array of pointers to source data chunks
>> + * @num_chunks: number of elements in @chunks
>> + * @chunk_size: nominal size of each chunk; the last chunk may hold fewer valid bytes
>> + * @total_size: total uncompressed byte count across all chunks
>> + *
>> + * If CONFIG_DRM_XE_COMPRESS_DUMP is enabled, compresses @total_size bytes using
>> + * zstd level-3 streaming compression and prints the result via @p using ascii85
>> + * encoding. Otherwise, directly prints the uncompressed data.
>> + * On failure the function returns without printing the data blob.
>>    */
>> -void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p)
>> +void xe_guc_print_blob(struct xe_gt *gt __maybe_unused, struct drm_printer *p,
>> +		       const char *length_label, const char *data_label,
>> +		       void **chunks, int num_chunks,
>> +		       size_t chunk_size, size_t total_size)
>>   {
>> +#if IS_ENABLED(CONFIG_DRM_XE_COMPRESS_DUMP)
>> +	xe_guc_print_blob_compressed(gt, p, length_label, data_label,
>> +				     chunks, num_chunks, chunk_size, total_size);
>> +#else
>> +	/* Compression disabled, output uncompressed data directly */
> 
> Minor nit. Above comment line seems unneeded with funciton description already
> covering the topic.
Sure, to be removed.

>>   	size_t remain;
>>   	int i;
>>   
>> +	drm_printf(p, "%s.length: 0x%zx Algo: RAW\n", length_label, total_size);
>> +
>> +	/*
>> +	 * Print each chunk directly without merging into a single buffer.
>> +	 * xe_print_blob_ascii85() supports multiple calls - use suffix=0
>> +	 * for all but the last chunk to omit the newline between chunks.
>> +	 */
>> +	remain = total_size;
>> +	for (i = 0; i < num_chunks && remain; i++) {
>> +		size_t size = min(chunk_size, remain);
>> +		const char *prefix = i ? NULL : data_label;
>> +		/* Add suffix only on the last chunk */
>> +		char suffix = (remain == size) ? '\n' : 0;
>> +
>> +		xe_print_blob_ascii85(p, prefix, suffix, chunks[i], 0,
>> +				      DIV_ROUND_UP(size, sizeof(u32)) * sizeof(u32));
>> +		remain -= size;
>> +	}
>> +#endif
>> +}
> 
> 
> 
> 
>> @@ -248,16 +384,9 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
>>   	drm_printf(p, "GuC timestamp: 0x%08llX [%llu]\n", snapshot->stamp, snapshot->stamp);
>>   	drm_printf(p, "Log level: %u\n", snapshot->level);
>>   
>> -	drm_printf(p, "[LOG].length: 0x%zx\n", snapshot->size);
>> -	remain = snapshot->size;
>> -	for (i = 0; i < snapshot->num_chunks; i++) {
>> -		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
>> -		const char *prefix = i ? NULL : "[LOG].data";
>> -		char suffix = i == snapshot->num_chunks - 1 ? '\n' : 0;
>> -
>> -		xe_print_blob_ascii85(p, prefix, suffix, snapshot->copy[i], 0, size);
>> -		remain -= size;
>> -	}
> 
> Variable remain may now unused with this block removed.
After patch, variable remain not exist in this function>
>> +	xe_guc_print_blob(gt, p, "[LOG]", "[LOG].data",
>> +			  snapshot->copy, snapshot->num_chunks,
>> +			  GUC_LOG_CHUNK_SIZE, snapshot->size);
>>   }
>>   
>>   static inline void lfd_output_binary(struct drm_printer *p, char *buf, int buf_size)
> 
> 
> 
> 

