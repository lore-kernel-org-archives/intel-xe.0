Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A1E1061B1B
	for <intel-xe@archiver.kernel.org>; Mon, 30 Mar 2026 18:30:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C22A10E160;
	Mon, 30 Mar 2026 18:30:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B2LfDaiB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A084110E160
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Mar 2026 18:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774895408; x=1806431408;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y+hgotEcPVzEYIhJbLo+7PrsKuoQJPHo6ZP7n2uYWyM=;
 b=B2LfDaiBeWaEicmhJos96d/q2QTmE0nP4Ecq8St0MKCQ9LLvdHE8l/3h
 /SyjPaSTwvyN+h59eUAWm36KugPykG6emxriiOCvc5378yLtrBH2SYwEa
 hWXTCNg48hXU6tgWffw4WjQraLtoeNkV1Wp/aij4yEijqnuADHH+ZApzT
 eOX3SZd/OY/csEYC6fDkyJ08O3JrO86+WmiW9W/X/lHF2gYIiiJywQ9SC
 xXiNqUo2zj0vyd62GyKDiPurwunvzKwmWw+otZEFYK73Rv9/MIaJOENxA
 oYT1+qmvRMwKnwxtzNi1sPQAy0qmfPaMCcbwZDQRvOExG7gPMb7s48PK0 A==;
X-CSE-ConnectionGUID: om0xWPwTTNmSrZkYWdnKmg==
X-CSE-MsgGUID: 6Xx4O2VpS8u7eSmKN6TQzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="74928454"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="74928454"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 11:30:08 -0700
X-CSE-ConnectionGUID: Aeb1G+/GQ2mWJ791Utl3mQ==
X-CSE-MsgGUID: sZEUv1D+SIiUL8mphvnvxg==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 11:30:08 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 11:30:07 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 30 Mar 2026 11:30:07 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.54) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 11:30:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VXHlz+sczBg/3yyHLgE23zeoQCqOe3QYBdhaxFSGHOeaAfzETH8xG8lqByZ2CxewiJueD65aXsA1oMVDfrb8eLiGFMFkIeh+2DUYum02p6k3MkpH0CnK3Cc3UjjB07IDrPA1q3SpeTF4+IXiLxT9urpoX+i01WHovNEqvduUdOCsLbKWVyCaCacM7yGunoS//RavIJqgwBezEKdGAA2MVRvLnsvyHRV3wiukMbP5JiJQPvoEKRU7vC3wnTS7/DzXG9j8oVtuepV5+wNDy4jLrdIgSgW/4j/XIUzdGwlPl9XaYa6cs3zZT7kainATfHPQCKf38eL13qbgATPSqjbaXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RIel4Vm7KnwhKpOueP8d1dXn50GZM6IvKKqxa8JhwpA=;
 b=NHVgZ5H7dr7nVxYp/2nkWxshMRPyAE9B4QPHfqK1TWR1laHMik+bD2l6f1/xm20dj+4yAaEpb05MQi69We5xziwHf4JjULyB5SDtERK8aRjpq+vLxUwKn9L/K7VwCjRzoeRwE6BUTyxO0j1fuHQlVs0HEx2DZZAS0Y6FKyHvt1A7Drm5dA0puVRruxm+OppYr65ujiQwa03MoER0WeaBlTg+TZJqvD97ls7evsS5tbnmn8B/VJ5VYsYPGgmW7Ajco/A1H3FmLoUtZE07W3dZzyV+hcc2svv/NkVJE2WaCibbXR8btTACKSHttrfjgsnYn4QuU4iXusTZbVqSdvmu0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by CH0PR11MB5297.namprd11.prod.outlook.com (2603:10b6:610:bc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 18:29:50 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%3]) with mapi id 15.20.9769.014; Mon, 30 Mar 2026
 18:29:50 +0000
Message-ID: <d7fc009d-d965-4733-bafa-2a2c3c6a9dd4@intel.com>
Date: Mon, 30 Mar 2026 11:29:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] drm/xe: Set GT rp min frequency as 1.2GHz default
 for BMG/CRI
To: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <thomas.hellstrom@linux.intel.com>, <stuart.summers@intel.com>
References: <20260326063407.985568-3-naresh.kumar.g@intel.com>
 <20260326063407.985568-4-naresh.kumar.g@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20260326063407.985568-4-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:a03:40::27) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|CH0PR11MB5297:EE_
X-MS-Office365-Filtering-Correlation-Id: af618070-a7be-4eeb-d3e6-08de8e8a5462
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 9+A4ShrE0R6bchAg/WWdXMGD1Aya2IylA2AILVrRgeDNJnGEvqRS8dnwTUi0Ixfh+dRQdEp22H0WQTcVFdLWivSnJy4UIprEbDlZN570ExCHkXox5ULkBeRvipcnJyq/R0xZW33oFpsIQaPXyNuUDEaazBOl6A+cYRZS2/BB1o53P58+C5LfIDewF8M0FkgXLzhWTLQRK1YaOcm4X5WToWTcglvf2R9Yxf1lvU7XMm9Bl1aausXyCW+jDZ87F3BHC8GK/1VOXrIxb04HHFwhFQUJ2AM/7+nooWqtpFCZYh5nB/0VabewnyKXoMay4gzjmInBOhIkhu/EIVmIPC8i1npJ1BtnAnhsK9NPDHFWlTbQsRemtTTETuvJRCOrAODo6RxzpRkeMMeFBMkIiOWzINCgPQZSsHCRaGedwHBOr9m67deFkul/vQ3iN0j8uRJ7F02ac4xlTvpu+yGDrW1fW/EfKdrlDlFWOJOAkgqJQzsCQhaZP5Ykj/DCIs8jwENr/XKIAvB+XIKpZI2BVYzgnujwyEGQ0vFauk6mTEBbIr9PVCYfyzD/f+2sZ0paiawh2rbtroemKVlj+Nkv1c/YrQeoAZTiu1QGMYkrCQPfdefT/cPO8TG66rurxfJnb6oG/2fPzUwCwcuSe2eHzNhTgnixDtj8P7xqtA/bMk1QMq7R6b0lntVdJeOCqOcT5tNq6mp4WtFjtqR07Mz+H9j7OWgaIiIFJKmAs/U7LoCGpVg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEVqTnc0RmFvUkVyLzcyelQ3U2RiWDFKR0p5TkZnVndrdXpGT0ZmV0NReGJs?=
 =?utf-8?B?UGZWcjA1ck5WNEhYRWc2WGtnY25yQVFKbVhwb2dIOUJaMWFRV2VyZDF2bkZo?=
 =?utf-8?B?U0NRcFRlalFBTk12ZG53NW9HRDFrVnc1YzlGeGNic3IzVnA2eDdWejdEZHAr?=
 =?utf-8?B?ejl4NDFvS3NoOS90VUtKc0l1ZDkzZ2JwVUd2d2tYMEFTVnVtcGk5cmQzUWxq?=
 =?utf-8?B?dmtzNGxUMXFPUTdoS1FMd3FQc1BIdkZrK2RkbGVkejdQRUFObWU5ODlCNlFO?=
 =?utf-8?B?Y0o5VG1qb1E4S3EvSDEwY1EvWlo1K1lWVmJQZG9OMmVKeG1pMk80Q0drMWxF?=
 =?utf-8?B?UG9PMGxBdUkvMnJuM2RiUlFOSnJkTnNxbjN3NHhzalUzMktteHdNK21aeTNn?=
 =?utf-8?B?VkRMNERGeUQzaWpNUDZSczBabldBd1FTblNIc1F4bEptaHR6VEd6ZUtOdHJK?=
 =?utf-8?B?M3V1UUFQTW4ya1dFUjlJcnZVRmVEVkR1YjhTZHBNdEs1NWM4c0JtU1FNbk9k?=
 =?utf-8?B?aXFHa1lGbmE2bVp0ZlpmTnRQa2lUTTNTWDA3N0ZoMytIU2o4ai9UNVZ2ZEJV?=
 =?utf-8?B?eXdBdEp5WUdrNWJKckpmYUZCdFo5WHNZR0dQWENTR0FFa2FHR0VNNUwyUXdk?=
 =?utf-8?B?SGs1R2cvc01RbTNIa3JFVnJRdEZuOU16eGZRdGE1R3pQbFFUbFVMTSs3OXlD?=
 =?utf-8?B?UUdSSHJiSVhydEhFZ1VFeXM2VjVxQWVhY042RHI0L0l6TUswRWJIVjFpNWpE?=
 =?utf-8?B?a3R1ZlNwenJnYVpPZjdHMHl3UENKZkMwbFVvak5acjlraW12ajFjdjhKVkpy?=
 =?utf-8?B?Q0tBM3JoRloyZzZKMTYrZThtNnd1VHlJaytwRFVLZkx5ZkRVWWxuRS8vVzl0?=
 =?utf-8?B?WGhTY1JhSStmMW9yYnZIeWNlT3lyK0xWM1BFcXZ0dXN3VmxzYmJPTXJxSzRr?=
 =?utf-8?B?RExXVlFDNFRydlhWZlV3YmZZU3p2YnJxMkpSYkdQUGZWYVBReEljK1NuMThK?=
 =?utf-8?B?NXN6LzYrY2liUUZ5eTBFSXhSNDF2aU1LNFRCNGZHSlVqODFCSWtRY2Q0YW9H?=
 =?utf-8?B?WDdLdjM0RmtxWm9hN2Jwb0JXOGpqQytjVVBxOVl0c2xwNHFxYXZnV0p3OXA3?=
 =?utf-8?B?RG90anB3c0NPY1pyNHN4a2NqaWdqMHhva1RXSWZMcVJrK1JBWTRpTEFDb2tY?=
 =?utf-8?B?cGVIclJFSVEwdGNRdjRqVHpNSncrWk9aNmsydzBkd2JtbUxMWUdEbHc4ZDU2?=
 =?utf-8?B?Tkg5Q09YWStkSVcrUlBXSksvUjBlaElCb1p3SzMyNW5mcVNXUERubFRkdzBB?=
 =?utf-8?B?UFpkbWJFMktSMTlsa09WN0pEMXMzcnN0SFkrako1eHdiaXNHSUcrOUNQcGZu?=
 =?utf-8?B?VGR5YnpMT3hTWnRHRlNCL3dJM1NBQjN0WnhOTTVoUFZqYzZ3SUVJa1Qwc0lW?=
 =?utf-8?B?TkNEOHNDWnBoQjExVVkrdHRKVXJGTnFtOFRwd2JMSHlvSnBScjJDSlJRQmdr?=
 =?utf-8?B?U2lFY0Fud2JPOTlYL09MbUtwRElvOTZJQ3NXTjV3aER2QXdWdk9VNTBwM3Vp?=
 =?utf-8?B?eGNpRGJGR2diSXlORTAvbWtPUXhSazQ3RklXK3BuOGxjNzVOYm9xejlWVVJO?=
 =?utf-8?B?eXJGMmtaeDNDRjNMd1lrNXMzVEs0VXNERllwRVo2c0k5NnFTbnZ0dTFxU0Z1?=
 =?utf-8?B?US9wczA4bTY4dTFRTFhXT0lzejE1ZEc4bHR4TXlYQTh5NVhuTHZ2bVQvT2Q0?=
 =?utf-8?B?VWdsUUtmOE1aekdDU3g2SWdVVm5OcXdYdklDNmcxbnBjYjI5c2U1czY0b2JY?=
 =?utf-8?B?S1FjVnJqbFVYR3c3dU9LVFZWVkdHSFhrSW04VzRjRk5yVlNuOXpObWwxTlli?=
 =?utf-8?B?bjZUN2N5MTlvK3FHSkJCc1VXYWszaFRvVFhjdlAwY0U0MDJtQVE3Vy9qQlFG?=
 =?utf-8?B?Y3duZU1XZlhSbWpLVUtCUjRWR0VTeUFGN0RjdXliWEVLYlFvMlFPQi84OEFW?=
 =?utf-8?B?d0ZiK0pVSzNtMUoydTZLaHZGYmtRbGZNaG5DckRlaHg3eC9QUXdJMUNnbENo?=
 =?utf-8?B?RFA2ZnVlMGFFL3I3MUVyUnc0VkFVRWVJMXAwNmJYcTVtRERTTnY4eUNNVWRT?=
 =?utf-8?B?VGhpZFUyYkpPT0VPMENHR2pJNzBtNnRoVnd4VnFZRS9kcEloWVI3a2d2VDlh?=
 =?utf-8?B?OXhjUWMzRWFKcWNJZmN2Yi9mS2hTWTV3b2VhUi9oeXRaaFdraUU0YVdjeldW?=
 =?utf-8?B?VjJsVWdxZmxkTTMxTFAyNlFkV3RNc2xOQlJveG1qdjF5OStwWDlscDJ6U09O?=
 =?utf-8?B?Ymw3QWhoQWc2TFZ3K2poUHJxZGxiTnd2bnRaOENYbkZRQjVhYWtVRGVzM01Q?=
 =?utf-8?Q?X2LHxOzFWtjwUrTA=3D?=
X-Exchange-RoutingPolicyChecked: div8k244vc9y3WcogHayQzdl8Rv5oYMRhtWVfMuowbSqM0t9p8BjFxqRHtakPHpF/Ip9zTk928quiXR8zkNtJCKVUlojPr6wtuJbDUuC1MDfxQEL7l0lv/I30dJYaIIN2UFDex8R0P2kXPJNuzs/nDzsZmUXwNqXnd0eKoA1legamNcP47yAm0MpVZc99eJdCFcEAIqTFk9ctEJ2Yl/n9qvQLOmgH5x1bcmh5pX3aRzPRtv5ds35ASxljrgKfEf7wkz87tqxTvxH4NGGNJaZWSVZpRDwb3jhMAgDfCMhUK+i39Db6FNVnGYTZts8wv8Y5aTpcWaFDVf+xbjh8U2QfA==
X-MS-Exchange-CrossTenant-Network-Message-Id: af618070-a7be-4eeb-d3e6-08de8e8a5462
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 18:29:50.7289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TqbXycGIOUwvyO3ck8F8aRVdvAvbne+OIvwZ3Kc6xUsjYoVWcg6cw2/z+OevEuFj6efvPL1LI86X4LgmEgIU0riUpHe5ss++nwY7XpcNYA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5297
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


On 3/25/2026 11:34 PM, Nareshkumar Gollakoti wrote:
>   While previously applied only to both tiles GT0(Graphics) and Media(GT1)
>   the BMG G21(Battle image) platform via workaround Wa_14022085890,
>   this 1.2 GHz minimum is now the default for GT0(Graphics) tile
>   of BMG and CRI platforms.
>
>   Setting this frequency floor(1.2GHz) default is critical in multi GPU
>   environment for supporting effective Peer-to-Peer(P2P) transactions.
>
> v2:
> - Fix Indentation(Thomas)
> - Add comment about power impact(Stuart)
>
> v3:(Thomas/Ankur/Matt Roper)
> - Add setting frequency to only GT0(Graphics) Tile of BMG/CRI
>
> v4:(Stuart)
> - Move WA check to pc_needs_min_freq_change function
>
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_pc.c | 32 ++++++++++++++++++++++++++++++--
>   1 file changed, 30 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 5e5495a39a3c..f92feee3592d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -856,9 +856,26 @@ void xe_guc_pc_init_early(struct xe_guc_pc *pc)
>   	pc_init_fused_rp_values(pc);
>   }
>   
> +static bool pc_needs_min_freq_change(struct xe_guc_pc *pc)
> +{
> +	struct xe_device *xe = pc_to_xe(pc);
> +	struct xe_gt *gt = pc_to_gt(pc);
> +
> +	if (XE_DEVICE_WA(xe, 14022085890))
> +		return true;
> +
> +	if (xe_gt_is_media_type(gt))
> +		return false;
> +
> +	if (xe->info.platform == XE_BATTLEMAGE ||
> +	    xe->info.platform == XE_CRESCENTISLAND)
> +		return true;
> +
> +	return false;
> +}
> +
>   static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
>   {
> -	struct xe_tile *tile = gt_to_tile(pc_to_gt(pc));
>   	int ret;
>   
>   	lockdep_assert_held(&pc->freq_lock);
> @@ -885,7 +902,18 @@ static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
>   	if (pc_get_min_freq(pc) > pc->rp0_freq)
>   		ret = pc_set_min_freq(pc, pc->rp0_freq);
>   
> -	if (XE_DEVICE_WA(tile_to_xe(tile), 14022085890))
> +	/*
> +	 * Setting GT RP min frequency to 1.2GHz by default for
> +	 * GT0(Graphics) Tile of BMG and CRI.
> +	 *
> +	 * While BMG G21 WA will apply min frequency for
> +	 * both GT0(Graphics) and GT1(Media) Tile.
> +	 *
> +	 * This is an active frequency, so if the device is idle
> +	 * we aren't expecting high power output across board
> +	 *
> +	 */
> +	if (pc_needs_min_freq_change(pc))
>   		ret = pc_set_min_freq(pc, max(BMG_MIN_FREQ, pc_get_min_freq(pc)));

LGTM,

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

>   
>   out:
