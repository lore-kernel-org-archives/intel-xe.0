Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F071C5CFDB
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 10:53:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2089510E410;
	Wed, 12 Aug 2026 10:53:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fIlAWk5B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 286DB10E410
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 10:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786531982; x=1818067982;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=StuynqUc4GWw4CsurDwFaXT2V9mV7UcL8iSeuBDs8t4=;
 b=fIlAWk5BX+Eq/REUQMsOpxu2IIXs5b82rysHoBQyX7LQPNGLIvxFpjyF
 CnrgKmK4w0jVJqlvDCHrGhAJ5ssl1JzuGzS20cSkJV1/BmtSMZxOxkA3U
 PCtf5ZpCX63nku7mnnBxen+Tl4GWfolvwDiCphuQKVr4pc8g1tOSb2dwe
 KHW5aQ3MzqHli/63ZDSX3JqsBJDQXzSlLalwKeugIQ7XKclj70eHHygeK
 Kkrn73WS/OEmkV1Ezu23NrnLpcFNdPQcJtj8pNRiAQpHHcxnI5oFM23cz
 /pnfoDpov0WBGAvD4JyRonsG0u1SSFW9DJp5VzdHzfOMuhlhGY3Yf2Gja A==;
X-CSE-ConnectionGUID: xIMdTYetTc6mGj1rd0Ka+g==
X-CSE-MsgGUID: Stk2L5ddSRuubvwe6h7vpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="86956694"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="86956694"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 03:53:01 -0700
X-CSE-ConnectionGUID: 371lymgDSSu0x5iC+eD/1A==
X-CSE-MsgGUID: mXHwT0fQQOml3CdOtx+roA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="267867591"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 03:53:01 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 03:53:00 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 03:53:00 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.22) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 03:52:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gC90/j2fr9Aj7yqnYoBcAhC2ilOQyN4PPNQSM04KTYluhOp0o3ZpTS/I1m9PiNMYs73E9fLkVW/ttMMqesLsDz+mid+w5ZjluyFopCFJYe+hAnJnCN7U3drKQmAA7slCIcbh4/PdyhZKqm3AT7YbBgS/OXUSxCCceoWIWH7tdfd95M3kV5UYO1F83+50u8Ax8/SjTe3JFQebxTjw4HGS2yuvvfOiyKCup3ly6A27KMyzmUuLmePwlp4yqcarnTbksi6XrpB1Eyfz9wGwG6Q4ugkBEUGM2nTkCg2WoYhoLbbMLMOkarAMQs7hHByssKpbx1GltZOHu8QVBZADjU1IrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g55RvLyq1FMtwJU4KZXL03gF4X6zfbATZQ3pujhtfAY=;
 b=OjnbA2htlZdjxKmAM+AfcsDwZqh7iaoTyRChrwSzgsmwcnfCnwmkRDifkUcDL6jh+El0ysy2x1HIfm9cShAGB4GSm20g7QvqDHKYERVUm/2/z/d2n3igktnMkuVFmTBFC8W1Twm5qThMSumKW3sVzDoetnCjoFAp6kmzI0CxnQA/YMw7eITdaWUcQs0Z7AJi3j8H+kR3wlZQ7gzc7qnyywJhCCGCYjIeOWk9IVJXh5faGbNYRTsp463C5d5SMNIOUFLwXH53Wlhq9RZEfdfWkSY4DVUcePhzHhKCdw2jYFrwxWdBvGGxdv9rk81N2pe6ESm7ZbQHChxREmofviggMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by IA3PR11MB308894.namprd11.prod.outlook.com (2603:10b6:208:61f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 12 Aug
 2026 10:52:53 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 10:52:52 +0000
Message-ID: <87dd6f56-f517-480c-a076-7e796a46808d@intel.com>
Date: Wed, 12 Aug 2026 16:22:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/23] drm/xe/guc: Report 'GuC mmio' errors using SIGID
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-20-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260730152121.576-20-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0298.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:220::7) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|IA3PR11MB308894:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b9dd0a8-576b-4cfd-7b59-08def85fdbd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|10067099003|6133799003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 0tOMX8KT+PElU55X3I3zzbyHyZeS+w98EtiQHHA4OigNZ/8F6irH0mPpszPlP4nXgX07MuIj4J58Mr09mfiT1cXWrOVnABb2vOTd9Ehx2RXCS0BvidILBz/ZgDihhpbUYF/PQUKOWPQUmqsNacgpxqTkHz2MRpr0RJpqv4yOu4lAo4f0WW58oiofsRr0wfmy4mEKCCzEPq0djguJomyZT1hfGVT3txo2HxkaUMsYPFpOTdXozHg2FyXaCoI3ob0G/8gap5EacpQVZRdZe5GQ/KU8FHVs+rLgKA70Yn9wl+sUxmIxJmdjhEKMvTYnkeo+6p5oBFQHihDb0fo1hYyGtb+prMi70IRFbg82mNq5ETmoG7Z8hUSHeQ0XngM4ul7yFqjX+Va83Ve8lv9DUWg6wKVC00yUKszYFxQ9EBAh29NlNCMJKf/YErK0o5W8dspuHU3auc+eANF1N582Oi3G4A0WF3sHaPuAGIKW2KePWtdEu8EU1GYnn/2QYnkZPMKHnxnCRyp0fcdE35dfB0IwohHLn3u1S1Sw/SmGvJ1t1osL4sk7geW634XT4jiYpR5KqHSJeaw/pKutrt9SfFwtGkDZzr5lRTfdW/M9dSoCgREPxCoJUi+t1HKjZqE0gV2kBGi7eYqQRXpq38DKSxDnbIEsjDpVaOwCqe7odQdSPzQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(6133799003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1RoUjAreXNMK1ZjZ0xNK2hJQUJZbzhwQk1mU1AxV004Q2JMWkhJRHZkZStI?=
 =?utf-8?B?blNWMXRKRUZiQ1B0WlBTK0tSNW9kS2xCWUViWk5HSHl1Ly9aL003d3NYL1hx?=
 =?utf-8?B?djlFOXV6WTBScC95Z0lhbkxNbnh1NTRBNnVtRHl3YVFKNXV5czQ4MDVUSFkx?=
 =?utf-8?B?NWNlaEdFaXJ5V3o3TUlmcmxSUFhYTG9KTnZxdmJXeTg3RTdDSkRlS1I1SGo1?=
 =?utf-8?B?TVdndEFYdXBPc2tlMFhCaUgyNStkdnBwNU1SMk5rdlI5b3NCNmZDWW0wU1d0?=
 =?utf-8?B?ZjVJZzQ4OVloYVRpMDRQVXZQaTlnMzhrR09nM2FLT24vb1lhUEEwWEFMSUpj?=
 =?utf-8?B?MjdkM2RDNCsyd0V0clRxMS9yREs1YnNCQmJXbTFLbVQ2L2lEM2p6ajJjMjZE?=
 =?utf-8?B?akxnaFpkT0h4UHh0RWdpSDIwSGlFenpkS2UvRDhrc0JoM1FRWExOOUtuaWlP?=
 =?utf-8?B?RDNHS3Q0VUNvSkxLaldLM01lcTdIUFNnSzFVdU1wY1BOd3VZRVhiUHhBczR3?=
 =?utf-8?B?cVMxTnpIejg2ZkMrdVJRNThsN0N1ZytGbUpDYkhNZExQOC9ZOWRnejN2Z3pj?=
 =?utf-8?B?ZHZLajV4bmJVdmNGYVpRbkRNUWZFTmoxQTJmRDg0YmFxaWZNcW9ueDJVZjYw?=
 =?utf-8?B?b3RQY1M5YWZUa0RoQkRmRGJiVXVodUttcjJZdHNtN3I1NTVGWkJ3VitacERz?=
 =?utf-8?B?cVRrcEZ3ZmFOZ3oxV2FmOEpUYUY4SlJsZ3haWG5Za2g5bVZDMXhlNks0Lzh5?=
 =?utf-8?B?Q1owZ2VCV1NGRVZOQzg5YXRIZHBkbVZNWEdVOTduTnVkV1phUCtWUVNQQmF2?=
 =?utf-8?B?eE9DcnBBdDQwTk1mMUp6SmpSZUkxbWFWT1EyT1dNZEhCUHoxV3lxWGpIaFo4?=
 =?utf-8?B?ZlBZS2FxNWs5UElVOUl3eDQyL2NPVFhMMDRiUEhBMFZ1c21tbFNjaUNtSVRX?=
 =?utf-8?B?b0NLRVpKek8ybDgyVU9adXB3aStEK2RYR1UwUG5yMXBKR3dhcytvRTVQN09L?=
 =?utf-8?B?UWFVdFEzdGRob2hkejM5L0RLS1lWTXRveHFFNkl4R1VoWndWalNZYkRWQ0tF?=
 =?utf-8?B?MnFKcE54RmtBUUtDdlR5YTRCZUIrR3hmNC9uZUVkbXkzcExWQTVPMTNzNWpj?=
 =?utf-8?B?YUlMTmdnanFwRFY2RjBoWG82TjR3YjVnNTJ2cUtiNVVaU1pqbHNqOUdxNTRM?=
 =?utf-8?B?M05xemJZeW96T3pyTVU0VUMvS3hrZkxqRXk3MmF6OTJGVEp2NkdLVzNqdllC?=
 =?utf-8?B?OC9XSWF3eGZ0OXFBbHJPaHQraXhFdzJ4Rk9VUzNBQlJudHFUMWNBUDE1Y3Vs?=
 =?utf-8?B?TkgwWEQ5aDBMRWYvT01XeUhXUlppRnliTXJyQi9nTm1TaS94N2ttZllKQTNT?=
 =?utf-8?B?cWwwWGZuNWR6dkVlanF6UW93VmV0cktxZ3VjK1FTTndPWXhtdDlqQk0zVFFM?=
 =?utf-8?B?eHRsY045cDRCZi90N0pPZnJTM2ZpczlIMWZGeGVqb1BtWUxHNU90a2psQjJH?=
 =?utf-8?B?U0wrWHdOaVRNOUhBbStKdHF1RnR2MGZFbENlNDNtZWRVUHJsSEdqcTBHQ2U5?=
 =?utf-8?B?VVJROVJyTzAwWklOdys4aE5ibnpHajdqMU9VRkhxQmZCRjVHcFZVcnhEYUl2?=
 =?utf-8?B?Yjg3M2VodGlZMG1ENFFESzVFNzhwcnlieExIeVByRVdpdlFaNVZwWXFiN2s4?=
 =?utf-8?B?MytIdVpvUGx2RS9XeFIxVUVQWU1DNFN5T1hFamFjVi84UGNIU2t2ckhScEdX?=
 =?utf-8?B?dEZMQTVkUGtDRlBmcGZUUlhJQzZnUE45UWhkcEJOVlF0a1BhaDhNRnVIaTE2?=
 =?utf-8?B?YmdNU1I4bDMxUFEvME9EdXNaNjhneklCN0RaZ2lZbitqcVpSM0ptbkF1VThx?=
 =?utf-8?B?TmN0djFsMmJyVTYrWXV4Q2lhUUxQbWZHcVk1alRidkhzSEhFYjNqbkVZejFB?=
 =?utf-8?B?d25GanMrT25EelZ2UG5rclh0ZmV5S0VDTEQycDFKaUZBaGtTdE1kRnp6WEsr?=
 =?utf-8?B?Y0tzK3IvUEFaYmRqZWxEQ3IwaGV2RUVzR0JRS3A3dG1zSVh6akM0dXpaYUpu?=
 =?utf-8?B?c1JsSit3VVFLYmFsdWhqL21yY1dCRHpSUzhoaVJOUTBSQWd4MGdCYXFDTis3?=
 =?utf-8?B?REQ1OVo4M2o0eGJHZERHellBRytIVFU5RGhUTzFBdWIxV3lKR2c0Uk9xQ1N5?=
 =?utf-8?B?UnliTXVWcVpaaXFZaUxEeHFEVS9yYzBjUE14SlpTNGFCTVFDdnJLK0FGL0lP?=
 =?utf-8?B?VFZqNDFKSXV4WTBGWFRDTUwzd3VaZWU0aVVZUlU5MERKQWdsTHBISmMwajQy?=
 =?utf-8?B?RHJVQ0FwZUhIVmFLRnVQbGRZQWJ2VUowZmF6cTV2R0thdlk5ejg2QkVreHBq?=
 =?utf-8?Q?gAENamKcb6AkNkv4=3D?=
X-Exchange-RoutingPolicyChecked: BmlBP3ssJr3FAceQpPKJpwb9h/197sjvYKPcvutSzezhr9TGqNQjDT4ruCrgNRNM8Dqf5B3ulZxP0e0k66oEGFK3yd/sJL0MxJ33qTAwOJVFanMjA2QL5EyNUUJpTmpMzx9pLLzH3NCI60adSGqXLeFzDOIodtx18DmQHLSauWF2beHx9EeaMwQPHAqgIvZjxZJJNEkuILqwK7aSsoXu/rbadtYeC/r7XnU/XposiwqcsU6Wzb2IesJD76g2J3GNCg849ahQ2X0J69qoWbSsbESN2DQjiglgakJfzEDfh6d2ijg1v6zRDMvm8k08Vs8quFb26UEmJB5JTUgPtRZnyg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b9dd0a8-576b-4cfd-7b59-08def85fdbd2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 10:52:52.8608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2rjZtu8j4ckoYVk1Cv019ICOT36xObU6IK4FHjr8CpEY2Xs30fueyslFD813hVo5i1e5F7q/jadQ39tCNz10lWs/jL1K1sImyWX6QqvnLso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB308894
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


On 30-07-2026 08:51 pm, Michal Wajdeczko wrote:
> Report various 'GuC mmio' errors using xe_log() helpers.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc.c | 18 ++++++++++--------
>   1 file changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 4286bd05c686..c7f8bbd4cb92 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -39,6 +39,7 @@
>   #include "xe_guc_rc.h"
>   #include "xe_guc_relay.h"
>   #include "xe_guc_submit.h"
> +#include "xe_log.h"
>   #include "xe_memirq.h"
>   #include "xe_mmio.h"
>   #include "xe_platform_types.h"
> @@ -1542,8 +1543,9 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>   		/* scratch registers might be cleared during FLR, try once more */
>   		if (!header) {
>   			if (++lost > MAX_RETRIES_ON_FLR) {
> -				xe_gt_err(gt, "GuC mmio request %#x: lost, too many retries %u\n",
> -					  request[0], lost);
> +				xe_log_err(gt, GUC, -ENOLINK,
> +					   "MMIO request %#x: lost, too many retries %u\n",
> +					   request[0], lost);
>   				return -ENOLINK;
>   			}
>   			xe_gt_dbg(gt, "GuC mmio request %#x: lost, trying again\n", request[0]);
> @@ -1551,8 +1553,8 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>   			goto retry;
>   		}
>   timeout:
> -		xe_gt_err(gt, "GuC mmio request %#x: no reply %#x\n",
> -			  request[0], header);
> +		xe_log_err(gt, GUC, ret, "MMIO request %#x: no reply %#x\n",
> +			   request[0], header);
>   		return ret;
>   	}
>   
> @@ -1607,16 +1609,16 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>   			return -EREMCHG;
>   		}
>   
> -		xe_gt_err(gt, "GuC mmio request %#x: failure %#x hint %#x\n",
> -			  request[0], error, hint);
> +		xe_log_err(gt, GUC, -ENXIO, "MMIO request %#x: failure %#x hint %#x\n",
> +			   request[0], error, hint);
>   		return -ENXIO;
>   	}
>   
>   	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) !=
>   	    GUC_HXG_TYPE_RESPONSE_SUCCESS) {
>   proto:
> -		xe_gt_err(gt, "GuC mmio request %#x: unexpected reply %#x\n",
> -			  request[0], header);
> +		xe_log_err(gt, GUC, -EPROTO, "MMIO request %#x: unexpected reply %#x\n",
> +			   request[0], header);
>   		return -EPROTO;
>   	}
>   
