Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08804C5B572
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 13:36:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF73C10E142;
	Fri, 14 Aug 2026 13:36:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V5Jd4V0G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A096A10E142
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 13:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786714605; x=1818250605;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=/q7AWAW6nPRRyFmzbTO+XC2EaGrP6lG/8rH+Stey6/s=;
 b=V5Jd4V0GfrHuPxNhlVLlumk+QOqMoARWlW3hQwnp07Cu06hY2nuQy06t
 90XsHbMyhiFXESvFErqI5D8mX0i6gqtJTO5CRVBHvKX1l+f9qE8aJFfZA
 xT1sgCkHQ/iE1+bM/wHvLaca7GFLs7Y41VDFc2XXPArnoISqCN70z9sKZ
 PpSfWG380uSODLKlkldBLMCGI8zgNscmmCCAJtc+ysTakoCxEdMLxmUdc
 7w47r5YPCDsnXRgwJt6jNwY41pKfAegkh18w4Ha3G6HX4UUI4yt7Z0E7r
 bF0akKRLgjbMWnFSsiGiJh/oEk2w5VFWDCh0pEcE3HXzR33sL1JH0wPEX w==;
X-CSE-ConnectionGUID: fKV72MAYTjmHrGdTiwJA4A==
X-CSE-MsgGUID: 3Fss1BoZTIK3OkeFiGtzDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87311199"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208,217";a="87311199"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 06:36:44 -0700
X-CSE-ConnectionGUID: lpiqAeCvRh+44lPRxtVisw==
X-CSE-MsgGUID: Wk8oOcbrQhCNdpVo3SfFSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
 d="scan'208,217";a="260955440"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 06:36:44 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 06:36:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 06:36:43 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.49) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 06:36:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H9k9fiOTMmb4V2aXsB5uiauj0phTFlNKdK4NLQ5RDnfcg4Yxf/oYxgGQFqGLuykJ8v8yiQVxzDbIkSs7DVKuBfsRG9XV25ReN/1DTtnQ4l9tu8DNhX3svsfRn1q8KarbPRJ1Sx/z2MabIk8oK5TH06ksXGiyoZ4MCFq+EgA3JN5w+CrIdbK5mXbYzCqskGOoSSL8BtcKuZEVLgRU0jUPLUfIZheP8gp8pwy/e+AM71D9gIOz2acwYAEBQMJ4rjYI2YPRrs2Xap+BzofhayO3VxEH8s0SQHyX1jCbSFob9OU+fMTa7+xuV6AwV2d5YWIck+MHwkq+/W5hLicLTazpIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UAjKkK0dHE/1AgN8e4ny1PGJLnt+pnAbEdb2sgDyG8E=;
 b=fOMBN9GKT+nb8ncLon9/3ukvVwe+PGFLG0Nns4KH8cLqBPwHDhhCrBU5nxGVkF2usI4QoA7H7+OVSNs3WQKXToEG0ORoUA0/YHFsxq3yTH7f9vthBZSuvrGqd/o5J68JKkkQ0PHGWQWPiCXBTf3UKyN/UBvaV9XYhvSrBUgkXFQ11Uxq93iwVtDwoyk4LSHiEpisNRp5LyETznaILemCmq1XB1nGUMUIwlOZe+q1Er92z6Q6MHnQOrLBFn2xBGnkvkwaDYCDLSBcAoEbvKD84dS3vOXml/AHdWqoNSzDnX1S0PbW45ga7TPl249aRI12MPDfJNVqROmF5vNU9hkkbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by CH3PR11MB8444.namprd11.prod.outlook.com (2603:10b6:610:1ba::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 13:36:35 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 13:36:35 +0000
Content-Type: multipart/alternative;
 boundary="------------7nKgpf6jpUGqOYiorcRfnbHc"
Message-ID: <802481a5-d5da-4ae5-abdc-2c90a7951f56@intel.com>
Date: Fri, 14 Aug 2026 19:06:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/32] drm/xe/tests: Add Kunit tests for xe_log
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>, Yoni Levitt <yoni.levitt@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-17-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20260812191450.11690-17-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MA5PR01CA0160.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::11) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|CH3PR11MB8444:EE_
X-MS-Office365-Filtering-Correlation-Id: 96fb641c-a076-4e98-f2e1-08defa090f67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|18002099003|22082099003|56012099006|3023799007|8096899003|6133799003|10067099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: Xma2Roq624JVos/VDL+LSTQdyAnGTeIwT4ST1KwUkIqQT5LYTGapLZB4D3GtuZOhx+H6aJQi9juBpHYONNXQY8kEP7IWvl7nDe2Rim+5o7KZt4aoH2BxDGhgaY47XJ56lXvbwsvZDr9Q+mbOteSk/VpD/hQRD2spsr1uXvFpzuWB2D8pVF2FsiLzJIMJOtlqNPplBtVbELTQ4S6wcqfUvwTP849mitf4PtI8r2t/QTT3aXU1Mx/ZG9cmYWwLzyHsZ7rfFkg1+MTKI+ilmnrwM1GFq/fArDZfSDioD9OSYSknvNytqjrkJy/AWMnGtB2P+wTSt8RyA/R5grS1D3pgS98bFlx/heIS27nGmvs8TpoXddH3l9iAEvrOgTgjqPX33O4AtmExiABRO/kRpjMykMhgOykYcmRUVk8qeXioVhsgbT4JMRAVfGzH8+xF5/r2UcCWPGE6VWBMJ3hXqNjHs6V1bcbQd1rpVGWEJULNlYsHhaiygRubDZa8ZenLQHDqghHR+lP0cXij2JVR4ddbxZ9B3ifXW/virYoYb5nm+LYSCodjPFWAncL/XjwviVUvarZxL+HdUEeC6nyTO55iwxbTNMySaRdeL7IjiAws7IC8vHYIGLdlGlcVceOnIyjDDKdQXxEF+GuRYIJW/0/x7dodlZXcaCjRrp7G0/6qOa4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(56012099006)(3023799007)(8096899003)(6133799003)(10067099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWpXZmdpRUtBbGxvdXllbER4bkJJTnE1aGx6R2QyYjUwTEFVWXpFNUxvZlNK?=
 =?utf-8?B?YjNOS3NrWXVkeTBCNHdmTkNmVDlxWDM0NjY0eWZ4QnRpN2c1VlVFTVdwNXdq?=
 =?utf-8?B?T0M1Y0NLeWx3M1RrNjhVcS9rbDZPLzlDdlVWRElBUWhXcE1xbitBakJBU0xz?=
 =?utf-8?B?MlR1V292RFk1SEVkWFFwTWlEbW9OMFhnRS9GMGRzVFBpcit2Q0FMbjNla2NO?=
 =?utf-8?B?NTdGN2xhQ3lsQ1R6eGFwUGkvQXVOQU5KRGluZkV4ditqZjVUWURSejdsbG1K?=
 =?utf-8?B?NEpnREhOUG93eGZTbjlyVmZiMXNvSHVZTlNNVS9oMGRvRERDNGRIenM3YURz?=
 =?utf-8?B?aU1nQzFGeDl5MHNUZWFKZUJhdUVrU0psVTNhNUQvOEkxNi9nbC9weGFlOU5Y?=
 =?utf-8?B?TU5ZM1ZZRk45QlRqSXdoSDRhVS9JaUZnZkRVeDZ5QUZRbzgzTzBXVE1pRCtV?=
 =?utf-8?B?UDloM1NVS1BNYm1WM1lIZVR3eTRUenR4Q1dnaFNQZVUyUFRqMXNPTWJENHd3?=
 =?utf-8?B?UjRCdC9kV2w3TUxKc05GUVZUSW9LOVdTd2JIZEwyL1dNU2hHbmRYMERjL0Fs?=
 =?utf-8?B?R095Y3hQY2dkMU4vRUMvVk1Kc2JDaDBSTnpmVHRGd29BWm9lb1hEUmZyODh3?=
 =?utf-8?B?NUlpZFF5VnNoKy9jN0Z6cWo5N2NmMkFlN3J5T2Z1OE5jY2ZsOHZJYzh3am52?=
 =?utf-8?B?RTNkM1VpemtLNUd5RmF5dlJNRWw0WjM0MjIwTzJTVThDZHNuT2plQjAyMExQ?=
 =?utf-8?B?NUtRbEc2aVdBc05uTlBTNVg1R1NVRHhBeDBMRldSY0VEdkxUNTlBZXdIaExl?=
 =?utf-8?B?Y1FKQnhuTG90aHRmQ25KcEJ0SlFFam5paEhqYVlIclI0RURFa0FreC8wenpE?=
 =?utf-8?B?WUcyQ2Y4Q0RXMXQ2QmY5dXNHcUlseXh0RTlwNFlXenZ0cmpJUmE0UktodkpF?=
 =?utf-8?B?ZURSMmorSnZyWlNDd0lCOE5XKzFpY01qRFFKcU9OUS9pMkVVZ0pXRHpGKzRn?=
 =?utf-8?B?TXhISlpzd0FScUxueXJtZU9oNzlqajRmTzFEL2c4TER2bHMyY3JwOWx4NWlJ?=
 =?utf-8?B?eldZTmVVZFZuNzdMbXhtdzNRN2hDU28zbWtVNWh5YjI5YmdtaVJKS1ZTMVIv?=
 =?utf-8?B?ZU1zOEtTSm9NcDFmK3lFaU5FTkJSM0xzMWpERzVpVFlNWUFDSzZEcCsvRG9M?=
 =?utf-8?B?NzNNRmJLU29wUXZ6YU1vWDNQaXVpMUNPaW12ZTJPTDBtQk1aUGI3UkJKdmhV?=
 =?utf-8?B?bFVGMlpJWXRmWGxNRXFCUktkZ1BSUzlYTGhqWlpCdDAzWGpsWitUNElnVXlL?=
 =?utf-8?B?cmdHYzVMMHJORUdQSTYwUEFvMkJ3Zm14Q3liWkFNR0dTTmFYd0lWUHFiYlFY?=
 =?utf-8?B?OG9jRENJTEp2SHhFUFdMd3ZnZTN3Yy8zVFV1dXFiZ012UnJKTk4zeTMrNWdi?=
 =?utf-8?B?SVVQMDZBM012ZytYUGpOREtUYmxCOGhDTVZSSG0yOWhzZGw4TU1OM3BTSjdt?=
 =?utf-8?B?ZVlydFF1ODlrRFd5TVJCRTh2SjU0UmlJd0dlWUFXL2dTekJ2VzNIbE1EMU52?=
 =?utf-8?B?WGV6bFA3ajQyblBlMXl0MkM3YUV1RWlINVFmZlhKWDFvSjRIZzZWUExIcTNK?=
 =?utf-8?B?ZDVDUlRicjFrNTVPUS9nWGNjeUd3eU5ITDFKNzBtMG1tay9UQnVEbUd1Y254?=
 =?utf-8?B?U1U0d1J0R1BZRnE1NHpBdVZvb1QzMG1Fc1NOb1EwUjY3cUcxUWdSNTJ3d3dQ?=
 =?utf-8?B?bk0waytneW5nNkViUUQ5Mk13ZmwwcGRnanJOSlFLZ1c2NENXS29lOEF4SzZQ?=
 =?utf-8?B?dHZYMFNOY2ZtT1BRNStqRGV4OVBlL0svNWdvbHYyaWRDVGxUcHhBMTFVL1hn?=
 =?utf-8?B?RG9jaTlMZXpFcTBhUGYzY29HdDd5TWpESTd1N25CV3pMRTRFT0tOTys3VWxW?=
 =?utf-8?B?N2dTVEd6UzQ5T1I0Wm9ITGorVTRtUUhSLzJTS09GZm5FRU9YbjU0N1k2akVD?=
 =?utf-8?B?YUhrWi80U2U3TVk5aGVvcE41aFlXdEN1UDgvcVlqVE50R2xGQ1RzMmdKMzgy?=
 =?utf-8?B?Tmxvc01SWVZvZ0hLK1NtYjYvK1pPRjdhSS9GajJpRFNFSitVZ3duN243Uk0r?=
 =?utf-8?B?Z09MZWVhcUZhVUl5enhpRDN5cUl6R2w3SVl6cVdrK3hCUDRJQ3VobjJJeWJw?=
 =?utf-8?B?L3R0SnEvcC9NZ1U4YTg1VWhRWldkNGZNb0k2WDFlYXZHNjdLS0pHakl6M25V?=
 =?utf-8?B?YUV4aWZMOGdBZ21CNHZpbThyQU5pM0FBeFpabHlveHFyTEJIY3ZmajQ3N0M5?=
 =?utf-8?B?UVdXQmwvOTJpZ05iYkhLakwwZlpSRGJKZGx2N0theXR5aXFJcFV5UT09?=
X-Exchange-RoutingPolicyChecked: D8AOSOb2SvoPnlf/fhP16McJIFcyBqYzcqvwgKrkgqV7iZnLw+2t6EdXMNMLhVIPJzPisNRxvIaX9qMBSVKEEZT/RH/uelfMVHSEUJn8Vwy2fNh9mVboU6C1400vaxBXfsgdmGh5awt1sYaDK+5lOzd5syALdYbkKCmDze4gCIDXfruEY4mOTjPjriIa6CUayyc1P7XAP+kHcfrOVmvLCuc+TByH6TQeP9IjIlC/fqLzQ9+bXmLcEDJT0//OcT6ACTPbAwIK7kALBDjla2gfF1PZmNq0ZuwdU+kCx7kEM/5Yry2R2ofJopaL9mREDcPgDoBMvB/+WaZc4lpa2XTSRA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 96fb641c-a076-4e98-f2e1-08defa090f67
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 13:36:35.6209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c9Q29QEARjGLAZ4JY2rvrngv0/878BNsBnSxE3NRscyZ5c511moOlz6U8WCpNkgW3ZdWr/+MTUobiF5xzochFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8444
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

--------------7nKgpf6jpUGqOYiorcRfnbHc
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 13-08-2026 00:44, Michal Wajdeczko wrote:
> All dmesg log lines generated by the xe_log() functions or helper
> macros are expected to have a stable format. Add tests to verify
> that generated output is not accidentally changed. Add demo pseudo
> tests to show how to use all variants of the xe_log() helpers.
>
> Signed-off-by: Michal Wajdeczko<michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi<rodrigo.vivi@intel.com>
> Reviewed-by: Mallesh Koujalagi<mallesh.koujalagi@intel.com>
> ---
> Cc: Aravind Iddamsetty<aravind.iddamsetty@intel.com>
> Cc: Yoni Levitt<yoni.levitt@intel.com>
> ---
> v2: less demos/more tests (Michal)
> v3: expect tile.id is already set (Michal)
>      add invalid params test (Michal)
> v4: move/drop err local var (Mallesh/Michal)
> ---
>   drivers/gpu/drm/xe/tests/xe_log_kunit.c | 543 ++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_log.c             |  11 +
>   2 files changed, 554 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/tests/xe_log_kunit.c
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_log_kunit.c b/drivers/gpu/drm/xe/tests/xe_log_kunit.c
> new file mode 100644
> index 000000000000..b524db818f8b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_log_kunit.c
> @@ -0,0 +1,543 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <kunit/static_stub.h>
> +#include <kunit/test.h>
> +#include <kunit/test-bug.h>
> +
> +#include "tests/xe_kunit_helpers.h"
> +#include "tests/xe_pci_test.h"
> +#include "xe_device.h"
> +#include "xe_log.h"
> +
> +static void nop_dmesg_vprintk(struct pci_dev *pdev, int cper_sev, struct va_format *vaf)
> +{
> +}
> +
> +static void nop_emit_cper(struct pci_dev *pdev, int cper_sev,
> +			  enum xe_sigid sigid, u32 component, u32 location,
> +			  const void *data, size_t len, struct va_format *vaf)
> +{
> +}
> +
> +static const char *component_name(u32 component)
> +{
> +	switch (component) {
> +#define make_component_tag_case(_CLASS, _ID, _TAG, _SIG, _NAME) \
> +	case XE_LOG_COMPONENT_##_TAG: return _NAME;
> +	DEFINE_XE_LOG_COMPONENTS(make_component_tag_case)
> +#undef make_component_tag_case
> +	}
> +	return component ? "???" : "";
> +}
> +
> +static const char *location_type(u32 location)
> +{
> +	u32 type = FIELD_GET(XE_LOG_LOCATION_TYPE_MASK, location);
> +
> +	return type == XE_LOG_LOCATION_TYPE_DEVICE ? "DEVICE" :
> +	       type == XE_LOG_LOCATION_TYPE_TILE ? "TILE" :
> +	       type == XE_LOG_LOCATION_TYPE_GT ? "GT" :
> +	       location ? "?" : "";
> +}
> +
> +static void fake_emit_cper(struct pci_dev *pdev, int cper_sev,
> +			   enum xe_sigid sigid, u32 component, u32 location,
> +			   const void *data, size_t len, struct va_format *vaf)
> +{
> +	char msg[64];
> +	int n;
> +
> +	pr_info("\n");
> +	pr_info("CPER SEV=%u SIGID=%u\n", cper_sev, sigid);
> +	pr_info("CPER DEVICE=%s\n", dev_name(&pdev->dev));
> +	if (location)
> +		pr_info("CPER LOCATION=%#x \t# %s.%u\n",
> +			location, location_type(location),
> +			FIELD_GET(XE_LOG_LOCATION_ID_MASK, location));
> +	if (component)
> +		pr_info("CPER COMPONENT=%#x \t# %s\n",
> +			component, component_name(component));
> +	if (IS_ERR(data))
> +		pr_info("CPER ERR=%ld \t\t# %pe\n", PTR_ERR(data), data);
> +	else if (len)
> +		print_hex_dump(KERN_INFO, "CPER BIN=", DUMP_PREFIX_OFFSET,
> +			       16, 1, data, len, false);
> +
> +	n = vscnprintf(msg, sizeof(msg), vaf->fmt, *vaf->va);
> +	print_hex_dump(KERN_INFO, "CPER MSG=", DUMP_PREFIX_OFFSET, 16, 1, msg, n, true);
> +	pr_info("CPER END\n");
> +}
As I understood this is to validate parameters passed. Otherwise, the 
optional CPER dump would simply contain the raw CPER buffer, for example:

|[ 12.413289] xe 0000:03:00.0: [drm] <cper dump> 43 50 45 52 00 01 ff ff 
ff ff 02 00 00 00 00 00 ...|

Thanks,
Badal
> +
> +static const u8 blob[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 };
> +static const u8 dead[] = { 0xde, 0xad, 0xbe, 0xef };
> +
> +static struct xe_tile *to_tile_safe(struct xe_device *xe)
> +{
> +	return xe ? &xe->tiles[1] : NULL;
> +}
> +
> +static struct xe_gt *to_gt_safe(struct xe_device *xe)
> +{
> +	return xe ? to_tile_safe(xe)->primary_gt : NULL;
> +}
> +
> +static struct pci_dev *to_pdev_safe(struct xe_device *xe)
> +{
> +	return xe ? xe_any_to_pdev(xe) : NULL;
> +}
> +
> +static void demo(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = xe_any_to_pdev(xe);
> +	struct xe_tile *tile = to_tile_safe(xe);
> +	struct xe_gt *gt = to_gt_safe(xe);
> +
> +	/* SW errno */
> +	xe_log_emit(pdev, CPER_SEV_FATAL, XE_SIGID_PROBE,
> +		    XE_LOG_COMPONENT_NONE, XE_LOG_LOCATION_NONE,
> +		    ERR_PTR(-ENODEV), 0, "testing %s signature\n", "software");
> +
> +	xe_log_err(tile, PROBE, -ENODEV, "testing %s signature\n", "software");
> +	xe_log_err_corrected(gt, PROBE, -ENODEV, "testing %s signature\n", "software");
> +	xe_log_info(gt, PROBE, "testing %s signature\n", "software");
> +
> +	/* HW data */
> +	xe_log_emit(pdev, CPER_SEV_FATAL, XE_SIGID_PCIE,
> +		    XE_LOG_COMPONENT_NONE, XE_LOG_LOCATION_NONE,
> +		    blob, sizeof(blob), "testing %s signature\n", "HARDWARE");
> +	xe_log_emit_recoverable(pdev, XE_SIGID_FABRIC,
> +				XE_LOG_COMPONENT_NONE, XE_LOG_LOCATION_NONE,
> +				blob, sizeof(blob), "testing %s signature\n", "HARDWARE");
> +	xe_log_from_corrected(tile, XE_SIGID_DEVICE_MEMORY, XE_LOG_COMPONENT_NONE,
> +			      blob, sizeof(blob), "testing %s signature\n", "HARDWARE");
> +	xe_log_from_info(gt, XE_SIGID_CORE_COMPUTE, XE_LOG_COMPONENT_NONE,
> +			 blob, sizeof(blob), "testing %s signature\n", "HARDWARE");
> +}
> +
> +static void demo_dmesg(struct kunit *test)
> +{
> +	kunit_activate_static_stub(test, log_emit_cper, nop_emit_cper);
> +	demo(test->priv);
> +}
> +
> +static void demo_cper(struct kunit *test)
> +{
> +	kunit_activate_static_stub(test, log_emit_cper, fake_emit_cper);
> +	kunit_activate_static_stub(test, log_dmesg_vprintk, nop_dmesg_vprintk);
> +	demo(test->priv);
> +}
> +
> +static const char *test_fatal(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pdev_safe(xe);
> +
> +	if (pdev)
> +		xe_log_emit_fatal(pdev, XE_SIGID_PROBE,
> +				  XE_LOG_COMPONENT_NONE, XE_LOG_LOCATION_NONE,
> +				  NULL, 0, "testing %d\n", 123);
> +	return "SIGID=101 FATAL testing 123\n";
> +}
> +
> +static const char *test_fatal_tile(struct xe_device *xe)
> +{
> +	struct xe_tile *tile = to_tile_safe(xe);
> +
> +	if (tile)
> +		xe_log_from_fatal(tile, XE_SIGID_PROBE, XE_LOG_COMPONENT_NONE,
> +				  ERR_PTR(-ENODEV), 0, "testing %d\n", 123);
> +	return "SIGID=101 FATAL (-ENODEV) Tile1: testing 123\n";
> +}
> +
> +static const char *test_fatal_gt(struct xe_device *xe)
> +{
> +	struct xe_gt *gt = to_gt_safe(xe);
> +
> +	if (gt)
> +		xe_log_from_fatal(gt, XE_SIGID_PROBE, XE_LOG_COMPONENT_NONE,
> +				  ERR_PTR(-ENODEV), 0, "testing %d\n", 123);
> +	return "SIGID=101 FATAL (-ENODEV) Tile1: GT1: testing 123\n";
> +}
> +
> +static const char *test_fatal_comp(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pdev_safe(xe);
> +
> +	if (pdev)
> +		xe_log_err_fatal(pdev, PROBE, -ENODEV, "testing %d\n", 123);
> +	return "SIGID=101 FATAL (-ENODEV) PROBE: testing 123\n";
> +}
> +
> +static const char *test_fatal_comp_tile(struct xe_device *xe)
> +{
> +	struct xe_tile *tile = to_tile_safe(xe);
> +
> +	if (tile)
> +		xe_log_err_fatal(tile, PROBE, -ENODEV, "testing %d\n", 123);
> +	return "SIGID=101 FATAL (-ENODEV) Tile1: PROBE: testing 123\n";
> +}
> +
> +static const char *test_fatal_comp_gt(struct xe_device *xe)
> +{
> +	struct xe_gt *gt = to_gt_safe(xe);
> +
> +	if (gt)
> +		xe_log_err_fatal(gt, PROBE, -ENODEV, "testing %d\n", 123);
> +	return "SIGID=101 FATAL (-ENODEV) Tile1: GT1: PROBE: testing 123\n";
> +}
> +
> +static const char *test_fatal_all(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pdev_safe(xe);
> +	struct xe_gt *gt = to_gt_safe(xe);
> +
> +	if (pdev)
> +		xe_log_emit(pdev, CPER_SEV_FATAL, XE_SIGID_PROBE,
> +			    XE_LOG_COMPONENT_PROBE, MAKE_XE_LOG_LOCATION(GT, gt->info.id),
> +			    ERR_PTR(-ENODEV), 0, "testing %d\n", 123);
> +	return "SIGID=101 FATAL (-ENODEV) Tile1: GT1: PROBE: testing 123\n";
> +}
> +
> +static const char *test_recoverable(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pdev_safe(xe);
> +
> +	if (pdev)
> +		xe_log_emit_recoverable(pdev, XE_SIGID_RUNTIME_FW,
> +					XE_LOG_COMPONENT_NONE, XE_LOG_LOCATION_NONE,
> +					ERR_PTR(-EIO), 0, "testing %d\n", 123);
> +	return "SIGID=104 (-EIO) testing 123\n";
> +}
> +
> +static const char *test_recoverable_tile(struct xe_device *xe)
> +{
> +	struct xe_tile *tile = to_tile_safe(xe);
> +
> +	if (tile)
> +		xe_log_from_recoverable(tile, XE_SIGID_RUNTIME_FW, XE_LOG_COMPONENT_NONE,
> +					ERR_PTR(-EIO), 0, "testing %d\n", 123);
> +	return "SIGID=104 (-EIO) Tile1: testing 123\n";
> +}
> +
> +static const char *test_recoverable_gt(struct xe_device *xe)
> +{
> +	struct xe_gt *gt = to_gt_safe(xe);
> +
> +	if (gt)
> +		xe_log_from_recoverable(gt, XE_SIGID_RUNTIME_FW, XE_LOG_COMPONENT_NONE,
> +					ERR_PTR(-EIO), 0, "testing %d\n", 123);
> +	return "SIGID=104 (-EIO) Tile1: GT1: testing 123\n";
> +}
> +
> +static const char *test_recoverable_comp(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pdev_safe(xe);
> +
> +	if (pdev)
> +		xe_log_err(pdev, GUC, -EIO, "testing %d\n", 123);
> +	return "SIGID=104 (-EIO) GUC: testing 123\n";
> +}
> +
> +static const char *test_recoverable_comp_tile(struct xe_device *xe)
> +{
> +	struct xe_tile *tile = to_tile_safe(xe);
> +
> +	if (tile)
> +		xe_log_err(tile, GUC, -EIO, "testing %d\n", 123);
> +	return "SIGID=104 (-EIO) Tile1: GUC: testing 123\n";
> +}
> +
> +static const char *test_recoverable_comp_gt(struct xe_device *xe)
> +{
> +	struct xe_gt *gt = to_gt_safe(xe);
> +
> +	if (gt)
> +		xe_log_err(gt, GUC, -EIO, "testing %d\n", 123);
> +	return "SIGID=104 (-EIO) Tile1: GT1: GUC: testing 123\n";
> +}
> +
> +static const char *test_recoverable_all(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pdev_safe(xe);
> +	struct xe_gt *gt = to_gt_safe(xe);
> +
> +	if (pdev)
> +		xe_log_emit(pdev, CPER_SEV_RECOVERABLE, XE_SIGID_RUNTIME_FW,
> +			    XE_LOG_COMPONENT_GUC, MAKE_XE_LOG_LOCATION(GT, gt->info.id),
> +			    ERR_PTR(-EIO), 0, "testing %d\n", 123);
> +	return "SIGID=104 (-EIO) Tile1: GT1: GUC: testing 123\n";
> +}
> +
> +static const char *test_info(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pdev_safe(xe);
> +
> +	if (pdev)
> +		xe_log_emit(pdev, CPER_SEV_INFORMATIONAL, XE_SIGID_DEVICE_FW,
> +			    XE_LOG_COMPONENT_NONE, XE_LOG_LOCATION_NONE,
> +			    NULL, 0, "testing %d\n", 123);
> +	return "SIGID=105 testing 123\n";
> +}
> +
> +static const char *test_info_tile(struct xe_device *xe)
> +{
> +	struct xe_tile *tile = to_tile_safe(xe);
> +
> +	if (tile)
> +		xe_log_from_info(tile, XE_SIGID_DEVICE_FW, XE_LOG_COMPONENT_NONE,
> +				 NULL, 0, "testing %d\n", 123);
> +	return "SIGID=105 Tile1: testing 123\n";
> +}
> +
> +static const char *test_info_gt(struct xe_device *xe)
> +{
> +	struct xe_gt *gt = to_gt_safe(xe);
> +
> +	if (gt)
> +		xe_log_from_info(gt, XE_SIGID_DEVICE_FW, XE_LOG_COMPONENT_NONE,
> +				 NULL, 0, "testing %d\n", 123);
> +	return "SIGID=105 Tile1: GT1: testing 123\n";
> +}
> +
> +static const char *test_info_comp(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pdev_safe(xe);
> +
> +	if (pdev)
> +		xe_log_info(pdev, PCODE, "testing %d\n", 123);
> +	return "SIGID=105 PCODE: testing 123\n";
> +}
> +
> +static const char *test_info_comp_tile(struct xe_device *xe)
> +{
> +	struct xe_tile *tile = to_tile_safe(xe);
> +
> +	if (tile)
> +		xe_log_info(tile, PCODE, "testing %d\n", 123);
> +	return "SIGID=105 Tile1: PCODE: testing 123\n";
> +}
> +
> +static const char *test_info_comp_gt(struct xe_device *xe)
> +{
> +	struct xe_gt *gt = to_gt_safe(xe);
> +
> +	if (gt)
> +		xe_log_info(gt, PCODE, "testing %d\n", 123);
> +	return "SIGID=105 Tile1: GT1: PCODE: testing 123\n";
> +}
> +
> +static const char *test_info_all(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pdev_safe(xe);
> +	struct xe_gt *gt = to_gt_safe(xe);
> +
> +	if (pdev)
> +		xe_log_emit(pdev, CPER_SEV_INFORMATIONAL, XE_SIGID_DEVICE_FW,
> +			    XE_LOG_COMPONENT_PCODE, MAKE_XE_LOG_LOCATION(GT, gt->info.id),
> +			    NULL, 0, "testing %d\n", 123);
> +	return "SIGID=105 Tile1: GT1: PCODE: testing 123\n";
> +}
> +
> +static const char *test_hw_fatal(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pdev_safe(xe);
> +
> +	if (pdev)
> +		xe_log_emit_fatal(pdev, XE_SIGID_PCIE,
> +				  XE_LOG_COMPONENT_NONE, XE_LOG_LOCATION_NONE,
> +				  dead, sizeof(dead), "testing %d\n", 123);
> +	return "SIGID=201 FATAL (deadbeef) " HW_ERR "testing 123\n";
> +}
> +
> +static const char *test_hw_recoverable(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pdev_safe(xe);
> +
> +	if (pdev)
> +		xe_log_emit_recoverable(pdev, XE_SIGID_DEVICE_MEMORY,
> +					XE_LOG_COMPONENT_NONE, XE_LOG_LOCATION_NONE,
> +					dead, sizeof(dead), "testing %d\n", 123);
> +	return "SIGID=202 (deadbeef) " HW_ERR "testing 123\n";
> +}
> +
> +static const char *test_hw_corrected(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pdev_safe(xe);
> +
> +	if (pdev)
> +		xe_log_emit_corrected(pdev, XE_SIGID_DEVICE_MEMORY,
> +				      XE_LOG_COMPONENT_NONE, XE_LOG_LOCATION_NONE,
> +				      dead, sizeof(dead), "testing %d\n", 123);
> +	return "SIGID=202 CORRECTED (deadbeef) " HW_ERR "testing 123\n";
> +}
> +
> +static const char *test_hw_informational(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pdev_safe(xe);
> +
> +	if (pdev)
> +		xe_log_emit_info(pdev, XE_SIGID_DEVICE_MEMORY,
> +				 XE_LOG_COMPONENT_NONE, XE_LOG_LOCATION_NONE,
> +				 dead, sizeof(dead), "testing %d\n", 123);
> +	return "SIGID=202 (deadbeef) testing 123\n";
> +}
> +
> +static const struct log_test_param {
> +	const char *(*func)(struct xe_device *xe);
> +} log_test_params[] = {
> +	{ .func = test_fatal },
> +	{ .func = test_fatal_tile },
> +	{ .func = test_fatal_gt },
> +	{ .func = test_fatal_comp },
> +	{ .func = test_fatal_comp_tile },
> +	{ .func = test_fatal_comp_gt },
> +	{ .func = test_fatal_all },
> +	{ .func = test_recoverable },
> +	{ .func = test_recoverable_tile },
> +	{ .func = test_recoverable_gt },
> +	{ .func = test_recoverable_comp },
> +	{ .func = test_recoverable_comp_tile },
> +	{ .func = test_recoverable_comp_gt },
> +	{ .func = test_recoverable_all },
> +	{ .func = test_info },
> +	{ .func = test_info_tile },
> +	{ .func = test_info_gt },
> +	{ .func = test_info_comp },
> +	{ .func = test_info_comp_tile },
> +	{ .func = test_info_comp_gt },
> +	{ .func = test_info_all },
> +	{ .func = test_hw_fatal },
> +	{ .func = test_hw_recoverable },
> +	{ .func = test_hw_corrected },
> +	{ .func = test_hw_informational },
> +};
> +
> +static void log_param_get_desc(const struct log_test_param *p, char *desc)
> +{
> +	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%ps", p->func);
> +}
> +
> +KUNIT_ARRAY_PARAM(log, log_test_params, log_param_get_desc);
> +
> +static void check_dmesg_vprintk(struct pci_dev *pdev, int cper_sev, struct va_format *vaf)
> +{
> +	struct kunit *test = kunit_get_current_test();
> +	const struct log_test_param *param = test->param_value;
> +	const char *exp = param->func(NULL);
> +	char msg[64];
> +	int n;
> +
> +	n = vsnprintf(msg, sizeof(msg), vaf->fmt, *vaf->va);
> +	KUNIT_EXPECT_LT(test, n, sizeof(msg));
> +	KUNIT_EXPECT_STREQ(test, msg, exp);
> +}
> +
> +static void test_dmesg(struct kunit *test)
> +{
> +	const struct log_test_param *param = test->param_value;
> +
> +	kunit_activate_static_stub(test, log_emit_cper, nop_emit_cper);
> +	kunit_activate_static_stub(test, log_dmesg_vprintk, check_dmesg_vprintk);
> +
> +	param->func(test->priv);
> +}
> +
> +#define INVALID_TILEID	(XE_MAX_TILES_PER_DEVICE + 1)
> +#define INVALID_GTID	(XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE + 1)
> +
> +#define PREP_TEST_LOCATION(type, id) \
> +	(FIELD_PREP_CONST(XE_LOG_LOCATION_TYPE_MASK, (type)) | \
> +	 FIELD_PREP_CONST(XE_LOG_LOCATION_ID_MASK, (id)))
> +#define PREP_TEST_COMPONENT(class, type) \
> +	(FIELD_PREP_CONST(XE_LOG_COMPONENT_CLASS_MASK, (class)) | \
> +	 FIELD_PREP_CONST(XE_LOG_COMPONENT_TYPE_MASK, (type)))
> +
> +static const struct {
> +	u32 comp;
> +	u32 loc;
> +	const char *name;
> +} invalid_params[] = {
> +	{	.name = "no-component no-location no-warn" },
> +	{	.loc = PREP_TEST_LOCATION(0, 1),
> +		.name = "reserved location" },
> +	{	.loc = PREP_TEST_LOCATION(255, 0),
> +		.name = "unknown location" },
> +	{	.loc = PREP_TEST_LOCATION(XE_LOG_LOCATION_TYPE_DEVICE, 1),
> +		.name = "nonzero-device-id location" },
> +	{	.loc = PREP_TEST_LOCATION(XE_LOG_LOCATION_TYPE_TILE, INVALID_TILEID),
> +		.name = "invalid-tile-id location" },
> +	{	.loc = PREP_TEST_LOCATION(XE_LOG_LOCATION_TYPE_GT, INVALID_GTID),
> +		.name = "invalid-gt-id location" },
> +	{	.comp = PREP_TEST_COMPONENT(255, 0),
> +		.name = "unknown component class" },
> +	{	.comp = PREP_TEST_COMPONENT(XE_LOG_COMPONENT_CLASS_SYSTEM, 255),
> +		.name = "unknown system component" },
> +	{	.comp = PREP_TEST_COMPONENT(XE_LOG_COMPONENT_CLASS_HARDWARE, 255),
> +		.name = "unknown hardware component" },
> +	{	.comp = PREP_TEST_COMPONENT(255, 1),
> +		.loc = PREP_TEST_LOCATION(255, 1),
> +		.name = "unknown component and location" },
> +};
> +
> +KUNIT_ARRAY_PARAM_DESC(invalid_param, invalid_params, name);
> +
> +static void test_invalid(struct kunit *test)
> +{
> +	struct xe_device *xe = test->priv;
> +	typeof(invalid_params[0]) *param = test->param_value;
> +
> +	struct pci_dev *pdev = xe_any_to_pdev(xe);
> +
> +	if (!IS_ENABLED(CONFIG_DRM_XE_DEBUG))
> +		kunit_skip(test, "requires CONFIG_DRM_XE_DEBUG\n");
> +
> +	kunit_activate_static_stub(test, log_emit_cper, nop_emit_cper);
> +	kunit_activate_static_stub(test, log_dmesg_vprintk, nop_dmesg_vprintk);
> +
> +	kunit_warning_suppress(test) {
> +		xe_log_emit(pdev, CPER_SEV_FATAL, XE_SIGID_PROBE,
> +			    param->comp, param->loc,
> +			    NULL, 0, "testing %s\n", param->name);
> +		KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, !!param->comp + !!param->loc);
> +	}
> +}
> +
> +static int xe_log_test_init(struct kunit *test)
> +{
> +	struct xe_pci_fake_data fake = {
> +		.platform = XE_PVC, /* with max_remote_tiles != 0 */
> +		.subplatform = XE_SUBPLATFORM_NONE,
> +		.graphics_verx100 = 2001,
> +		.media_verx100 = 2001,
> +	};
> +	struct xe_device *xe;
> +
> +	test->priv = &fake;
> +	xe_kunit_helper_xe_device_test_init(test);
> +	xe = test->priv;
> +
> +	KUNIT_ASSERT_NOT_NULL(test, to_tile_safe(xe));
> +	KUNIT_ASSERT_NOT_NULL(test, to_gt_safe(xe));
> +	KUNIT_EXPECT_EQ(test, 1, xe_any_id(to_tile_safe(xe)));
> +	KUNIT_EXPECT_EQ(test, 1, xe_any_id(to_gt_safe(xe)));
> +
> +	return 0;
> +}
> +
> +static struct kunit_case xe_log_test_cases[] = {
> +	KUNIT_CASE(demo_cper),
> +	KUNIT_CASE(demo_dmesg),
> +	KUNIT_CASE_PARAM(test_dmesg, log_gen_params),
> +	KUNIT_CASE_PARAM(test_invalid, invalid_param_gen_params),
> +	{}
> +};
> +
> +static struct kunit_suite xe_log_suite = {
> +	.name = "xe_log",
> +	.test_cases = xe_log_test_cases,
> +	.init = xe_log_test_init,
> +};
> +
> +kunit_test_suites(&xe_log_suite);
> diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
> index 50a9b35e5b3e..5b56f69ce559 100644
> --- a/drivers/gpu/drm/xe/xe_log.c
> +++ b/drivers/gpu/drm/xe/xe_log.c
> @@ -3,6 +3,9 @@
>    * Copyright © 2026 Intel Corporation
>    */
>   
> +#include <kunit/static_stub.h>
> +#include <kunit/visibility.h>
> +
>   #include "abi/xe_log_abi.h"
>   
>   #include "xe_device.h"
> @@ -13,6 +16,8 @@ static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigi
>   			  u32 component, u32 location, const void *data, size_t len,
>   			  struct va_format *vaf)
>   {
> +	KUNIT_STATIC_STUB_REDIRECT(log_emit_cper, pdev, cper_sev, sigid,
> +				   component, location, data, len, vaf);
>   	/* TODO */
>   }
>   
> @@ -132,6 +137,8 @@ static const char *log_sev_prefix(int cper_sev)
>   
>   static void log_dmesg_vprintk(struct pci_dev *pdev, int cper_sev, struct va_format *vaf)
>   {
> +	KUNIT_STATIC_STUB_REDIRECT(log_dmesg_vprintk, pdev, cper_sev, vaf);
> +
>   	if (cper_sev == CPER_SEV_INFORMATIONAL)
>   		pci_info(pdev, __LOG_DRM_PRINTK_FMT("%pV", vaf));
>   	else
> @@ -222,3 +229,7 @@ void __xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>   
>   	va_end(args);
>   }
> +
> +#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
> +#include "tests/xe_log_kunit.c"
> +#endif
--------------7nKgpf6jpUGqOYiorcRfnbHc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 13-08-2026 00:44, Michal Wajdeczko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260812191450.11690-17-michal.wajdeczko@intel.com">
      <pre wrap="" class="moz-quote-pre">All dmesg log lines generated by the xe_log() functions or helper
macros are expected to have a stable format. Add tests to verify
that generated output is not accidentally changed. Add demo pseudo
tests to show how to use all variants of the xe_log() helpers.

Signed-off-by: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
Cc: Rodrigo Vivi <a class="moz-txt-link-rfc2396E" href="mailto:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>
Reviewed-by: Mallesh Koujalagi <a class="moz-txt-link-rfc2396E" href="mailto:mallesh.koujalagi@intel.com">&lt;mallesh.koujalagi@intel.com&gt;</a>
---
Cc: Aravind Iddamsetty <a class="moz-txt-link-rfc2396E" href="mailto:aravind.iddamsetty@intel.com">&lt;aravind.iddamsetty@intel.com&gt;</a>
Cc: Yoni Levitt <a class="moz-txt-link-rfc2396E" href="mailto:yoni.levitt@intel.com">&lt;yoni.levitt@intel.com&gt;</a>
---
v2: less demos/more tests (Michal)
v3: expect tile.id is already set (Michal)
    add invalid params test (Michal)
v4: move/drop err local var (Mallesh/Michal)
---
 drivers/gpu/drm/xe/tests/xe_log_kunit.c | 543 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_log.c             |  11 +
 2 files changed, 554 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_log_kunit.c

diff --git a/drivers/gpu/drm/xe/tests/xe_log_kunit.c b/drivers/gpu/drm/xe/tests/xe_log_kunit.c
new file mode 100644
index 000000000000..b524db818f8b
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_log_kunit.c
@@ -0,0 +1,543 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include &lt;kunit/static_stub.h&gt;
+#include &lt;kunit/test.h&gt;
+#include &lt;kunit/test-bug.h&gt;
+
+#include &quot;tests/xe_kunit_helpers.h&quot;
+#include &quot;tests/xe_pci_test.h&quot;
+#include &quot;xe_device.h&quot;
+#include &quot;xe_log.h&quot;
+
+static void nop_dmesg_vprintk(struct pci_dev *pdev, int cper_sev, struct va_format *vaf)
+{
+}
+
+static void nop_emit_cper(struct pci_dev *pdev, int cper_sev,
+			  enum xe_sigid sigid, u32 component, u32 location,
+			  const void *data, size_t len, struct va_format *vaf)
+{
+}
+
+static const char *component_name(u32 component)
+{
+	switch (component) {
+#define make_component_tag_case(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	case XE_LOG_COMPONENT_##_TAG: return _NAME;
+	DEFINE_XE_LOG_COMPONENTS(make_component_tag_case)
+#undef make_component_tag_case
+	}
+	return component ? &quot;???&quot; : &quot;&quot;;
+}
+
+static const char *location_type(u32 location)
+{
+	u32 type = FIELD_GET(XE_LOG_LOCATION_TYPE_MASK, location);
+
+	return type == XE_LOG_LOCATION_TYPE_DEVICE ? &quot;DEVICE&quot; :
+	       type == XE_LOG_LOCATION_TYPE_TILE ? &quot;TILE&quot; :
+	       type == XE_LOG_LOCATION_TYPE_GT ? &quot;GT&quot; :
+	       location ? &quot;?&quot; : &quot;&quot;;
+}
+
+static void fake_emit_cper(struct pci_dev *pdev, int cper_sev,
+			   enum xe_sigid sigid, u32 component, u32 location,
+			   const void *data, size_t len, struct va_format *vaf)
+{
+	char msg[64];
+	int n;
+
+	pr_info(&quot;\n&quot;);
+	pr_info(&quot;CPER SEV=%u SIGID=%u\n&quot;, cper_sev, sigid);
+	pr_info(&quot;CPER DEVICE=%s\n&quot;, dev_name(&amp;pdev-&gt;dev));
+	if (location)
+		pr_info(&quot;CPER LOCATION=%#x \t# %s.%u\n&quot;,
+			location, location_type(location),
+			FIELD_GET(XE_LOG_LOCATION_ID_MASK, location));
+	if (component)
+		pr_info(&quot;CPER COMPONENT=%#x \t# %s\n&quot;,
+			component, component_name(component));
+	if (IS_ERR(data))
+		pr_info(&quot;CPER ERR=%ld \t\t# %pe\n&quot;, PTR_ERR(data), data);
+	else if (len)
+		print_hex_dump(KERN_INFO, &quot;CPER BIN=&quot;, DUMP_PREFIX_OFFSET,
+			       16, 1, data, len, false);
+
+	n = vscnprintf(msg, sizeof(msg), vaf-&gt;fmt, *vaf-&gt;va);
+	print_hex_dump(KERN_INFO, &quot;CPER MSG=&quot;, DUMP_PREFIX_OFFSET, 16, 1, msg, n, true);
+	pr_info(&quot;CPER END\n&quot;);
+}</pre>
    </blockquote>
    As I understood this is to validate parameters passed. Otherwise,
    the optional CPER dump would simply contain the raw CPER buffer, for
    example:
    <div class="section level5" id="example-driver-detected-event" style="box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, Calibri, arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
      <pre style="box-sizing: border-box; margin: 15px 1em 15px 0px; font-size: 13px; white-space: pre-wrap; line-height: 19px; overflow: auto; background-color: inherit;"><code style="box-sizing: border-box; white-space: pre !important; font-size: 13px; font-family: &quot;DejaVu Sans Mono&quot;, &quot;Cascadia Mono&quot;, &quot;Lucida Console&quot;, &quot;Courier New&quot;, monospace !important; display: inline-block; background-color: rgb(248, 248, 248); min-width: 50%; padding: 0.6em; border: 1px solid rgb(226, 226, 221); border-radius: 3px; overflow-x: auto; -webkit-font-smoothing: none; text-rendering: optimizelegibility;">[ 12.413289] xe 0000:03:00.0: [drm] &lt;cper dump&gt; 43 50 45 52 00 01 ff ff ff ff 02 00 00 00 00 00 ...</code></pre>
    </div>
    <div class="section level5" id="out-of-band-printout-bmc-sel" style="box-sizing: border-box; color: rgb(51, 51, 51); font-family: Roboto, Calibri, arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"></div>
    Thanks,<br>
    Badal
    <blockquote type="cite" cite="mid:20260812191450.11690-17-michal.wajdeczko@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
+static const u8 blob[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 };
+static const u8 dead[] = { 0xde, 0xad, 0xbe, 0xef };
+
+static struct xe_tile *to_tile_safe(struct xe_device *xe)
+{
+	return xe ? &amp;xe-&gt;tiles[1] : NULL;
+}
+
+static struct xe_gt *to_gt_safe(struct xe_device *xe)
+{
+	return xe ? to_tile_safe(xe)-&gt;primary_gt : NULL;
+}
+
+static struct pci_dev *to_pdev_safe(struct xe_device *xe)
+{
+	return xe ? xe_any_to_pdev(xe) : NULL;
+}
+
+static void demo(struct xe_device *xe)
+{
+	struct pci_dev *pdev = xe_any_to_pdev(xe);
+	struct xe_tile *tile = to_tile_safe(xe);
+	struct xe_gt *gt = to_gt_safe(xe);
+
+	/* SW errno */
+	xe_log_emit(pdev, CPER_SEV_FATAL, XE_SIGID_PROBE,
+		    XE_LOG_COMPONENT_NONE, XE_LOG_LOCATION_NONE,
+		    ERR_PTR(-ENODEV), 0, &quot;testing %s signature\n&quot;, &quot;software&quot;);
+
+	xe_log_err(tile, PROBE, -ENODEV, &quot;testing %s signature\n&quot;, &quot;software&quot;);
+	xe_log_err_corrected(gt, PROBE, -ENODEV, &quot;testing %s signature\n&quot;, &quot;software&quot;);
+	xe_log_info(gt, PROBE, &quot;testing %s signature\n&quot;, &quot;software&quot;);
+
+	/* HW data */
+	xe_log_emit(pdev, CPER_SEV_FATAL, XE_SIGID_PCIE,
+		    XE_LOG_COMPONENT_NONE, XE_LOG_LOCATION_NONE,
+		    blob, sizeof(blob), &quot;testing %s signature\n&quot;, &quot;HARDWARE&quot;);
+	xe_log_emit_recoverable(pdev, XE_SIGID_FABRIC,
+				XE_LOG_COMPONENT_NONE, XE_LOG_LOCATION_NONE,
+				blob, sizeof(blob), &quot;testing %s signature\n&quot;, &quot;HARDWARE&quot;);
+	xe_log_from_corrected(tile, XE_SIGID_DEVICE_MEMORY, XE_LOG_COMPONENT_NONE,
+			      blob, sizeof(blob), &quot;testing %s signature\n&quot;, &quot;HARDWARE&quot;);
+	xe_log_from_info(gt, XE_SIGID_CORE_COMPUTE, XE_LOG_COMPONENT_NONE,
+			 blob, sizeof(blob), &quot;testing %s signature\n&quot;, &quot;HARDWARE&quot;);
+}
+
+static void demo_dmesg(struct kunit *test)
+{
+	kunit_activate_static_stub(test, log_emit_cper, nop_emit_cper);
+	demo(test-&gt;priv);
+}
+
+static void demo_cper(struct kunit *test)
+{
+	kunit_activate_static_stub(test, log_emit_cper, fake_emit_cper);
+	kunit_activate_static_stub(test, log_dmesg_vprintk, nop_dmesg_vprintk);
+	demo(test-&gt;priv);
+}
+
+static const char *test_fatal(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pdev_safe(xe);
+
+	if (pdev)
+		xe_log_emit_fatal(pdev, XE_SIGID_PROBE,
+				  XE_LOG_COMPONENT_NONE, XE_LOG_LOCATION_NONE,
+				  NULL, 0, &quot;testing %d\n&quot;, 123);
+	return &quot;SIGID=101 FATAL testing 123\n&quot;;
+}
+
+static const char *test_fatal_tile(struct xe_device *xe)
+{
+	struct xe_tile *tile = to_tile_safe(xe);
+
+	if (tile)
+		xe_log_from_fatal(tile, XE_SIGID_PROBE, XE_LOG_COMPONENT_NONE,
+				  ERR_PTR(-ENODEV), 0, &quot;testing %d\n&quot;, 123);
+	return &quot;SIGID=101 FATAL (-ENODEV) Tile1: testing 123\n&quot;;
+}
+
+static const char *test_fatal_gt(struct xe_device *xe)
+{
+	struct xe_gt *gt = to_gt_safe(xe);
+
+	if (gt)
+		xe_log_from_fatal(gt, XE_SIGID_PROBE, XE_LOG_COMPONENT_NONE,
+				  ERR_PTR(-ENODEV), 0, &quot;testing %d\n&quot;, 123);
+	return &quot;SIGID=101 FATAL (-ENODEV) Tile1: GT1: testing 123\n&quot;;
+}
+
+static const char *test_fatal_comp(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pdev_safe(xe);
+
+	if (pdev)
+		xe_log_err_fatal(pdev, PROBE, -ENODEV, &quot;testing %d\n&quot;, 123);
+	return &quot;SIGID=101 FATAL (-ENODEV) PROBE: testing 123\n&quot;;
+}
+
+static const char *test_fatal_comp_tile(struct xe_device *xe)
+{
+	struct xe_tile *tile = to_tile_safe(xe);
+
+	if (tile)
+		xe_log_err_fatal(tile, PROBE, -ENODEV, &quot;testing %d\n&quot;, 123);
+	return &quot;SIGID=101 FATAL (-ENODEV) Tile1: PROBE: testing 123\n&quot;;
+}
+
+static const char *test_fatal_comp_gt(struct xe_device *xe)
+{
+	struct xe_gt *gt = to_gt_safe(xe);
+
+	if (gt)
+		xe_log_err_fatal(gt, PROBE, -ENODEV, &quot;testing %d\n&quot;, 123);
+	return &quot;SIGID=101 FATAL (-ENODEV) Tile1: GT1: PROBE: testing 123\n&quot;;
+}
+
+static const char *test_fatal_all(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pdev_safe(xe);
+	struct xe_gt *gt = to_gt_safe(xe);
+
+	if (pdev)
+		xe_log_emit(pdev, CPER_SEV_FATAL, XE_SIGID_PROBE,
+			    XE_LOG_COMPONENT_PROBE, MAKE_XE_LOG_LOCATION(GT, gt-&gt;info.id),
+			    ERR_PTR(-ENODEV), 0, &quot;testing %d\n&quot;, 123);
+	return &quot;SIGID=101 FATAL (-ENODEV) Tile1: GT1: PROBE: testing 123\n&quot;;
+}
+
+static const char *test_recoverable(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pdev_safe(xe);
+
+	if (pdev)
+		xe_log_emit_recoverable(pdev, XE_SIGID_RUNTIME_FW,
+					XE_LOG_COMPONENT_NONE, XE_LOG_LOCATION_NONE,
+					ERR_PTR(-EIO), 0, &quot;testing %d\n&quot;, 123);
+	return &quot;SIGID=104 (-EIO) testing 123\n&quot;;
+}
+
+static const char *test_recoverable_tile(struct xe_device *xe)
+{
+	struct xe_tile *tile = to_tile_safe(xe);
+
+	if (tile)
+		xe_log_from_recoverable(tile, XE_SIGID_RUNTIME_FW, XE_LOG_COMPONENT_NONE,
+					ERR_PTR(-EIO), 0, &quot;testing %d\n&quot;, 123);
+	return &quot;SIGID=104 (-EIO) Tile1: testing 123\n&quot;;
+}
+
+static const char *test_recoverable_gt(struct xe_device *xe)
+{
+	struct xe_gt *gt = to_gt_safe(xe);
+
+	if (gt)
+		xe_log_from_recoverable(gt, XE_SIGID_RUNTIME_FW, XE_LOG_COMPONENT_NONE,
+					ERR_PTR(-EIO), 0, &quot;testing %d\n&quot;, 123);
+	return &quot;SIGID=104 (-EIO) Tile1: GT1: testing 123\n&quot;;
+}
+
+static const char *test_recoverable_comp(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pdev_safe(xe);
+
+	if (pdev)
+		xe_log_err(pdev, GUC, -EIO, &quot;testing %d\n&quot;, 123);
+	return &quot;SIGID=104 (-EIO) GUC: testing 123\n&quot;;
+}
+
+static const char *test_recoverable_comp_tile(struct xe_device *xe)
+{
+	struct xe_tile *tile = to_tile_safe(xe);
+
+	if (tile)
+		xe_log_err(tile, GUC, -EIO, &quot;testing %d\n&quot;, 123);
+	return &quot;SIGID=104 (-EIO) Tile1: GUC: testing 123\n&quot;;
+}
+
+static const char *test_recoverable_comp_gt(struct xe_device *xe)
+{
+	struct xe_gt *gt = to_gt_safe(xe);
+
+	if (gt)
+		xe_log_err(gt, GUC, -EIO, &quot;testing %d\n&quot;, 123);
+	return &quot;SIGID=104 (-EIO) Tile1: GT1: GUC: testing 123\n&quot;;
+}
+
+static const char *test_recoverable_all(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pdev_safe(xe);
+	struct xe_gt *gt = to_gt_safe(xe);
+
+	if (pdev)
+		xe_log_emit(pdev, CPER_SEV_RECOVERABLE, XE_SIGID_RUNTIME_FW,
+			    XE_LOG_COMPONENT_GUC, MAKE_XE_LOG_LOCATION(GT, gt-&gt;info.id),
+			    ERR_PTR(-EIO), 0, &quot;testing %d\n&quot;, 123);
+	return &quot;SIGID=104 (-EIO) Tile1: GT1: GUC: testing 123\n&quot;;
+}
+
+static const char *test_info(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pdev_safe(xe);
+
+	if (pdev)
+		xe_log_emit(pdev, CPER_SEV_INFORMATIONAL, XE_SIGID_DEVICE_FW,
+			    XE_LOG_COMPONENT_NONE, XE_LOG_LOCATION_NONE,
+			    NULL, 0, &quot;testing %d\n&quot;, 123);
+	return &quot;SIGID=105 testing 123\n&quot;;
+}
+
+static const char *test_info_tile(struct xe_device *xe)
+{
+	struct xe_tile *tile = to_tile_safe(xe);
+
+	if (tile)
+		xe_log_from_info(tile, XE_SIGID_DEVICE_FW, XE_LOG_COMPONENT_NONE,
+				 NULL, 0, &quot;testing %d\n&quot;, 123);
+	return &quot;SIGID=105 Tile1: testing 123\n&quot;;
+}
+
+static const char *test_info_gt(struct xe_device *xe)
+{
+	struct xe_gt *gt = to_gt_safe(xe);
+
+	if (gt)
+		xe_log_from_info(gt, XE_SIGID_DEVICE_FW, XE_LOG_COMPONENT_NONE,
+				 NULL, 0, &quot;testing %d\n&quot;, 123);
+	return &quot;SIGID=105 Tile1: GT1: testing 123\n&quot;;
+}
+
+static const char *test_info_comp(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pdev_safe(xe);
+
+	if (pdev)
+		xe_log_info(pdev, PCODE, &quot;testing %d\n&quot;, 123);
+	return &quot;SIGID=105 PCODE: testing 123\n&quot;;
+}
+
+static const char *test_info_comp_tile(struct xe_device *xe)
+{
+	struct xe_tile *tile = to_tile_safe(xe);
+
+	if (tile)
+		xe_log_info(tile, PCODE, &quot;testing %d\n&quot;, 123);
+	return &quot;SIGID=105 Tile1: PCODE: testing 123\n&quot;;
+}
+
+static const char *test_info_comp_gt(struct xe_device *xe)
+{
+	struct xe_gt *gt = to_gt_safe(xe);
+
+	if (gt)
+		xe_log_info(gt, PCODE, &quot;testing %d\n&quot;, 123);
+	return &quot;SIGID=105 Tile1: GT1: PCODE: testing 123\n&quot;;
+}
+
+static const char *test_info_all(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pdev_safe(xe);
+	struct xe_gt *gt = to_gt_safe(xe);
+
+	if (pdev)
+		xe_log_emit(pdev, CPER_SEV_INFORMATIONAL, XE_SIGID_DEVICE_FW,
+			    XE_LOG_COMPONENT_PCODE, MAKE_XE_LOG_LOCATION(GT, gt-&gt;info.id),
+			    NULL, 0, &quot;testing %d\n&quot;, 123);
+	return &quot;SIGID=105 Tile1: GT1: PCODE: testing 123\n&quot;;
+}
+
+static const char *test_hw_fatal(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pdev_safe(xe);
+
+	if (pdev)
+		xe_log_emit_fatal(pdev, XE_SIGID_PCIE,
+				  XE_LOG_COMPONENT_NONE, XE_LOG_LOCATION_NONE,
+				  dead, sizeof(dead), &quot;testing %d\n&quot;, 123);
+	return &quot;SIGID=201 FATAL (deadbeef) &quot; HW_ERR &quot;testing 123\n&quot;;
+}
+
+static const char *test_hw_recoverable(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pdev_safe(xe);
+
+	if (pdev)
+		xe_log_emit_recoverable(pdev, XE_SIGID_DEVICE_MEMORY,
+					XE_LOG_COMPONENT_NONE, XE_LOG_LOCATION_NONE,
+					dead, sizeof(dead), &quot;testing %d\n&quot;, 123);
+	return &quot;SIGID=202 (deadbeef) &quot; HW_ERR &quot;testing 123\n&quot;;
+}
+
+static const char *test_hw_corrected(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pdev_safe(xe);
+
+	if (pdev)
+		xe_log_emit_corrected(pdev, XE_SIGID_DEVICE_MEMORY,
+				      XE_LOG_COMPONENT_NONE, XE_LOG_LOCATION_NONE,
+				      dead, sizeof(dead), &quot;testing %d\n&quot;, 123);
+	return &quot;SIGID=202 CORRECTED (deadbeef) &quot; HW_ERR &quot;testing 123\n&quot;;
+}
+
+static const char *test_hw_informational(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pdev_safe(xe);
+
+	if (pdev)
+		xe_log_emit_info(pdev, XE_SIGID_DEVICE_MEMORY,
+				 XE_LOG_COMPONENT_NONE, XE_LOG_LOCATION_NONE,
+				 dead, sizeof(dead), &quot;testing %d\n&quot;, 123);
+	return &quot;SIGID=202 (deadbeef) testing 123\n&quot;;
+}
+
+static const struct log_test_param {
+	const char *(*func)(struct xe_device *xe);
+} log_test_params[] = {
+	{ .func = test_fatal },
+	{ .func = test_fatal_tile },
+	{ .func = test_fatal_gt },
+	{ .func = test_fatal_comp },
+	{ .func = test_fatal_comp_tile },
+	{ .func = test_fatal_comp_gt },
+	{ .func = test_fatal_all },
+	{ .func = test_recoverable },
+	{ .func = test_recoverable_tile },
+	{ .func = test_recoverable_gt },
+	{ .func = test_recoverable_comp },
+	{ .func = test_recoverable_comp_tile },
+	{ .func = test_recoverable_comp_gt },
+	{ .func = test_recoverable_all },
+	{ .func = test_info },
+	{ .func = test_info_tile },
+	{ .func = test_info_gt },
+	{ .func = test_info_comp },
+	{ .func = test_info_comp_tile },
+	{ .func = test_info_comp_gt },
+	{ .func = test_info_all },
+	{ .func = test_hw_fatal },
+	{ .func = test_hw_recoverable },
+	{ .func = test_hw_corrected },
+	{ .func = test_hw_informational },
+};
+
+static void log_param_get_desc(const struct log_test_param *p, char *desc)
+{
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, &quot;%ps&quot;, p-&gt;func);
+}
+
+KUNIT_ARRAY_PARAM(log, log_test_params, log_param_get_desc);
+
+static void check_dmesg_vprintk(struct pci_dev *pdev, int cper_sev, struct va_format *vaf)
+{
+	struct kunit *test = kunit_get_current_test();
+	const struct log_test_param *param = test-&gt;param_value;
+	const char *exp = param-&gt;func(NULL);
+	char msg[64];
+	int n;
+
+	n = vsnprintf(msg, sizeof(msg), vaf-&gt;fmt, *vaf-&gt;va);
+	KUNIT_EXPECT_LT(test, n, sizeof(msg));
+	KUNIT_EXPECT_STREQ(test, msg, exp);
+}
+
+static void test_dmesg(struct kunit *test)
+{
+	const struct log_test_param *param = test-&gt;param_value;
+
+	kunit_activate_static_stub(test, log_emit_cper, nop_emit_cper);
+	kunit_activate_static_stub(test, log_dmesg_vprintk, check_dmesg_vprintk);
+
+	param-&gt;func(test-&gt;priv);
+}
+
+#define INVALID_TILEID	(XE_MAX_TILES_PER_DEVICE + 1)
+#define INVALID_GTID	(XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE + 1)
+
+#define PREP_TEST_LOCATION(type, id) \
+	(FIELD_PREP_CONST(XE_LOG_LOCATION_TYPE_MASK, (type)) | \
+	 FIELD_PREP_CONST(XE_LOG_LOCATION_ID_MASK, (id)))
+#define PREP_TEST_COMPONENT(class, type) \
+	(FIELD_PREP_CONST(XE_LOG_COMPONENT_CLASS_MASK, (class)) | \
+	 FIELD_PREP_CONST(XE_LOG_COMPONENT_TYPE_MASK, (type)))
+
+static const struct {
+	u32 comp;
+	u32 loc;
+	const char *name;
+} invalid_params[] = {
+	{	.name = &quot;no-component no-location no-warn&quot; },
+	{	.loc = PREP_TEST_LOCATION(0, 1),
+		.name = &quot;reserved location&quot; },
+	{	.loc = PREP_TEST_LOCATION(255, 0),
+		.name = &quot;unknown location&quot; },
+	{	.loc = PREP_TEST_LOCATION(XE_LOG_LOCATION_TYPE_DEVICE, 1),
+		.name = &quot;nonzero-device-id location&quot; },
+	{	.loc = PREP_TEST_LOCATION(XE_LOG_LOCATION_TYPE_TILE, INVALID_TILEID),
+		.name = &quot;invalid-tile-id location&quot; },
+	{	.loc = PREP_TEST_LOCATION(XE_LOG_LOCATION_TYPE_GT, INVALID_GTID),
+		.name = &quot;invalid-gt-id location&quot; },
+	{	.comp = PREP_TEST_COMPONENT(255, 0),
+		.name = &quot;unknown component class&quot; },
+	{	.comp = PREP_TEST_COMPONENT(XE_LOG_COMPONENT_CLASS_SYSTEM, 255),
+		.name = &quot;unknown system component&quot; },
+	{	.comp = PREP_TEST_COMPONENT(XE_LOG_COMPONENT_CLASS_HARDWARE, 255),
+		.name = &quot;unknown hardware component&quot; },
+	{	.comp = PREP_TEST_COMPONENT(255, 1),
+		.loc = PREP_TEST_LOCATION(255, 1),
+		.name = &quot;unknown component and location&quot; },
+};
+
+KUNIT_ARRAY_PARAM_DESC(invalid_param, invalid_params, name);
+
+static void test_invalid(struct kunit *test)
+{
+	struct xe_device *xe = test-&gt;priv;
+	typeof(invalid_params[0]) *param = test-&gt;param_value;
+
+	struct pci_dev *pdev = xe_any_to_pdev(xe);
+
+	if (!IS_ENABLED(CONFIG_DRM_XE_DEBUG))
+		kunit_skip(test, &quot;requires CONFIG_DRM_XE_DEBUG\n&quot;);
+
+	kunit_activate_static_stub(test, log_emit_cper, nop_emit_cper);
+	kunit_activate_static_stub(test, log_dmesg_vprintk, nop_dmesg_vprintk);
+
+	kunit_warning_suppress(test) {
+		xe_log_emit(pdev, CPER_SEV_FATAL, XE_SIGID_PROBE,
+			    param-&gt;comp, param-&gt;loc,
+			    NULL, 0, &quot;testing %s\n&quot;, param-&gt;name);
+		KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, !!param-&gt;comp + !!param-&gt;loc);
+	}
+}
+
+static int xe_log_test_init(struct kunit *test)
+{
+	struct xe_pci_fake_data fake = {
+		.platform = XE_PVC, /* with max_remote_tiles != 0 */
+		.subplatform = XE_SUBPLATFORM_NONE,
+		.graphics_verx100 = 2001,
+		.media_verx100 = 2001,
+	};
+	struct xe_device *xe;
+
+	test-&gt;priv = &amp;fake;
+	xe_kunit_helper_xe_device_test_init(test);
+	xe = test-&gt;priv;
+
+	KUNIT_ASSERT_NOT_NULL(test, to_tile_safe(xe));
+	KUNIT_ASSERT_NOT_NULL(test, to_gt_safe(xe));
+	KUNIT_EXPECT_EQ(test, 1, xe_any_id(to_tile_safe(xe)));
+	KUNIT_EXPECT_EQ(test, 1, xe_any_id(to_gt_safe(xe)));
+
+	return 0;
+}
+
+static struct kunit_case xe_log_test_cases[] = {
+	KUNIT_CASE(demo_cper),
+	KUNIT_CASE(demo_dmesg),
+	KUNIT_CASE_PARAM(test_dmesg, log_gen_params),
+	KUNIT_CASE_PARAM(test_invalid, invalid_param_gen_params),
+	{}
+};
+
+static struct kunit_suite xe_log_suite = {
+	.name = &quot;xe_log&quot;,
+	.test_cases = xe_log_test_cases,
+	.init = xe_log_test_init,
+};
+
+kunit_test_suites(&amp;xe_log_suite);
diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
index 50a9b35e5b3e..5b56f69ce559 100644
--- a/drivers/gpu/drm/xe/xe_log.c
+++ b/drivers/gpu/drm/xe/xe_log.c
@@ -3,6 +3,9 @@
  * Copyright © 2026 Intel Corporation
  */
 
+#include &lt;kunit/static_stub.h&gt;
+#include &lt;kunit/visibility.h&gt;
+
 #include &quot;abi/xe_log_abi.h&quot;
 
 #include &quot;xe_device.h&quot;
@@ -13,6 +16,8 @@ static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigi
 			  u32 component, u32 location, const void *data, size_t len,
 			  struct va_format *vaf)
 {
+	KUNIT_STATIC_STUB_REDIRECT(log_emit_cper, pdev, cper_sev, sigid,
+				   component, location, data, len, vaf);
 	/* TODO */
 }
 
@@ -132,6 +137,8 @@ static const char *log_sev_prefix(int cper_sev)
 
 static void log_dmesg_vprintk(struct pci_dev *pdev, int cper_sev, struct va_format *vaf)
 {
+	KUNIT_STATIC_STUB_REDIRECT(log_dmesg_vprintk, pdev, cper_sev, vaf);
+
 	if (cper_sev == CPER_SEV_INFORMATIONAL)
 		pci_info(pdev, __LOG_DRM_PRINTK_FMT(&quot;%pV&quot;, vaf));
 	else
@@ -222,3 +229,7 @@ void __xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
 
 	va_end(args);
 }
+
+#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
+#include &quot;tests/xe_log_kunit.c&quot;
+#endif
</pre>
    </blockquote>
  </body>
</html>

--------------7nKgpf6jpUGqOYiorcRfnbHc--
