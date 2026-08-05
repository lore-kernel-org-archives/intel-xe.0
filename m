Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED71BC55ABA
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 11:13:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD16510EDF2;
	Wed,  5 Aug 2026 11:13:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HQ2RbWSa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2766810EDF2
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Aug 2026 11:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785928412; x=1817464412;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=mnX1Nx6GZ9hdpVuRvyHIj+rapTPvgxxnOKXq7g9C1lk=;
 b=HQ2RbWSa9q4Z1QQa0GZZhTXFyRkM1IfsirpbPLhhllihViRAs5YeXTwV
 rK6qOQBkhl+W7V7Rx9T0QmgM+MBSsb6puLMZLx6lROP0D9oq/JE8G5zZA
 xciF8TCq152lZYFv3ZdqjuvnLUoPqNA0y+f4x4Ur8gI18Er5wIcJHZLm2
 564Pe8/K+bqVVAq8UwJzUBSIIUlc8CDwdRVp+4ypn+Kpo2OwgzwdV9OKO
 R6F9G6b0AFwh5cHuV41f6W1DKNFkrfk2Gc0PYITLz2azuOY7tN4BNUPsP
 BcokU7HgZVSuWHeDnXf58c1QYMHSb+VK/j/X1H5IL8EisuQ9NjADmAYy9 A==;
X-CSE-ConnectionGUID: Sc+VvbR4SmGlmmvxaxHihA==
X-CSE-MsgGUID: EDPxAWFERx+133WIvOabHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="90312711"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="90312711"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 04:13:31 -0700
X-CSE-ConnectionGUID: oFOYxJzTRp2ajvRVGbqw6g==
X-CSE-MsgGUID: k/iSC5Y0SymMF2nRb0x3ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="266018432"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 04:13:31 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 04:13:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 5 Aug 2026 04:13:30 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.53) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 04:13:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wxgmny+3RodOqEgyWgB6LvmYqZdwzp6/KQZKxUO2gP4TDSMMLC+dMdqbzfOD9MyEMSbhgU4djaVNeBB2WF8lYjF7ZB0SH54WVXDhVBUau3EDrW9Yu9evIrw+HnN7fcsI0V+erqqjFMT6uvUPU0Z6pJTrtoMs7Jl/uYcFq0YIgHevNWVhPB9R5ClJfZNNB2cwduwA0GotJGEi0jC+yXbnaoxnkhEgsQSVUCWIFb94+vbx/afL+eidgbQgcOyxjbEOphiEx54HH+TDSzS0YWAP0eriY9zgNXpEvHWdVZ6eY5Nq1wVIYepKr9r9EuEdVOKyThdLnfsTdhlfjIgMApYvLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RUu+0e0w9KB9y6Unk/LPJZHeiEK++Dj7pnyGXx8yBQs=;
 b=B1ssh3qZNPMg+ItPF3mYgsRDkovZ/jUrDudlMR/9GG1PqYYKIC1bm0sAxvpA6HrixIPQwrHQt1w7/fhVsajONA8UVtQrgfD64fRuTlpiGSUPgeixmIi2Qg5aRnPuuRvTf0zI0AElzyIFJZ4Bc6gTzaaKOOzzZckayWOpwSUs7jTZtyPdqPbgkeGOgL/sKDTQD2INlb91kQ6b8xuYemvKPPIer1iwcW+CieAKncA+yLMyicPn03rl6cR61slpU+BxupB8ZBD2QQvyuSrMfbrkPyeEW7DJiSl/p4HBQp0vlt2SEEgKj0tMqAyNaNWpDhPx/3+a/iIpjQvfxArgNfkUig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SN7PR11MB7437.namprd11.prod.outlook.com (2603:10b6:806:348::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 11:13:27 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 11:13:27 +0000
Message-ID: <6268b060-a01c-4f60-a74e-b47c2a740d41@intel.com>
Date: Wed, 5 Aug 2026 13:13:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] drm/xe/vf: Split submission config query helpers
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260728095026.2197333-6-satyanarayana.k.v.p@intel.com>
 <20260728095026.2197333-8-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260728095026.2197333-8-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0017.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::17) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SN7PR11MB7437:EE_
X-MS-Office365-Filtering-Correlation-Id: 65b81496-191f-435a-e323-08def2e2928d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|6133799003|22082099003|18002099003|11063799006|56012099006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: 0y70ARDl+sE780e9A4hfMnbpgTdzqU6GSxylp735Y260kXOWEch01GYHZXlqk2Of8JlBfcdS4NZuFFVpwdYDOXfwQ6+xk++YGK913OxkVo5H/T5G6bcdGw1TFXAXyMGJou+YTNbC7cC+xlIDmiUReRc5HSWk00YURjussjXK5HUAE864TvIvUgiP6ac4OEsmrdB5MKNqz/raSWQIVPKAg47FrPU9ABB2qAQpSjYZKQrvZdoFOWY17M+zd8vfB/qN4LElKWiPitTKKh7mpSVUsViHxiVAWUbY9NwN+WkggA1Sb0dlBiJmu06x9idWbic9vJgDQO+6zC+B402JrzqmGmOWC9Xc+3Eirm/3xj0hFBlwQpXg63kPg2Rozyzc3QnWQXbZfIGNp03b+lCFQYsC1O+XeKLgtebdZXbvL8R5mrWmXF/NOqklDlzF+YETyJ41wkoI2Tu8B2Oq39jKCnpmpiDPTmzkqwSauVoRU3zNe6N9TtdCG1LJe1k9yyKjPvukfoGO/JhMo5afcaBHEYlaT74dUR8POQYgKD4GcUvlQolTqivVSoJnVLka3g/Oe/X4ihTT28dAMhtfFUrKPVGAM4K+T+AVV809fmgfrnY0xBb8rs41rR6A94VUrGSW9peeeeZUaYF5YkdmV4TU2y+Eo8ZvHubEoESu+5ECepWrQpw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHpEWnUwWFNtdzF3dHB3aE96QWNsWUJ5UURzd0NVWUlYc0cvUDdvS0ROcFN1?=
 =?utf-8?B?VHU0RU9BV1Zjdk02WFdOT1M5eW5WVVpnSnRWSHhNUEtXL3VpekVNUGZkUDhi?=
 =?utf-8?B?dW0rL1JvZ3NXWFoyVDF5RVMvQmg0MVRKejFXTy9XalJDRHhmY21mZEcxVmhE?=
 =?utf-8?B?QmFEZy8yb2p2ek1LWTRWSERudytYbmRNak5pTkVPczh6MkJmU284YmxxamFW?=
 =?utf-8?B?SFlnRTlnSXhPcGtmQXVtRitPcDVsN2IzK1ljcmtDMFFzVDVEWGlybkdVODh2?=
 =?utf-8?B?b0ZSUTA5WVdkZUJpOHhOUWo5Q0g5cEpKNUxFRnM1Q0ZBUWZ5WXhwc3g5cHpU?=
 =?utf-8?B?SU5UWDhPbTlxNkdMclI5Qk1FcW10VEt0eEoxOFZKSURuWXZRVWE4Qk10N2No?=
 =?utf-8?B?cXJPbjVTU3FTT1JseW40SldUT2FnalI2MU5wcmQzTlFyeW9HaS90elcxNWpm?=
 =?utf-8?B?KzV1M3FHbCtKcG94UXQrS2k0d0c4VXBkUXNWUnJ6ZThpMGhMU0MxTm94ZVl4?=
 =?utf-8?B?NmpJdlMxazFRS0ZIa1ljVmFNMC9JQTJTMGpxWmxaamJ2TmlxWWdQZ1pwelpq?=
 =?utf-8?B?QkRSMU15djZ0eWlMUnRXeWlXeGh2bjkzdEJ4eTlnRG52allTU1dYQyt1bTVZ?=
 =?utf-8?B?ZUQ1T044TkE4S2I0UUcybXFQbmlQQTJZSUlRKzE4ZndNcHZzbWJkYytSTFNQ?=
 =?utf-8?B?N0JNKzRWU090cFNvK3dWdkdkdXlUdGZVN010Q0d0WU9Od2pNd29lZFVoSkZR?=
 =?utf-8?B?MGJ6ZEJQYXhSeHZwVG56YW9kc25Mdng3eU1oK1BUUGcva3Z3RzJwMEg4MUtQ?=
 =?utf-8?B?UXRyeVNjcm9ZUWN2NGpQcHVXRFBTSW5heUVJVFZwTXdsblFGR01xVHNsc3ZW?=
 =?utf-8?B?VzBTb3JueUlHZXFhWTE1dXBaRFNvSlZRRWE5bnVhaFBEemxFQUdiZEhhZEhL?=
 =?utf-8?B?TlVNYk5RcUVDSzVHNnZhSGtMMThaOUZaakRvYzdQWE5qbVpobE8xWG9sM3hD?=
 =?utf-8?B?dXdRbTVRWVJnWHVraVgvMlg5R1ZpQVYxTThWbHdNbE1rdEdMc29SZ0JLTWZ2?=
 =?utf-8?B?QnRSVWpjQ3VTZ2luTFpmNk96MTlhc1RUMkhoWHhtTlhvbllFSkplWTRWT1hQ?=
 =?utf-8?B?N0NhOFN2N2I4MU5Ma3YvWlZWMC9ZSTlVdXU2MnMrZ01ZUG5jVXA2aHc1Tmhu?=
 =?utf-8?B?eDMyTTh6bk02L3NsMkRYN0JJK2pZSHZ1TzB5L3JOK24vWitaeUJIa0F3bFp5?=
 =?utf-8?B?NVFrZTB5Q1BCOVF2NHVhaWFrcDh0MTZTeGFocm5oZVhFQ2JKRlEvcGFvenVz?=
 =?utf-8?B?L2d3Wm52ZEg2dlpVZ0sweDdVRDJrdDZMTDNHejJWakdBeU1LRkhqcFExUXpZ?=
 =?utf-8?B?R1hHaUdzakd6SmJpMUJrZXZLSzQvNEZoMkdrdHRMcVRVcTNlNDNtZUR4U1JU?=
 =?utf-8?B?R05JWlpJUDE3U1d2Q2FzSW5MQlg5eW1uTkthdEhCVmJSVExKLzFHRkRRbmhK?=
 =?utf-8?B?blRyMU1HVENiNTBISkZnamY0bHFrRG9LWWYwdzlIRzFYd09EdE1pOFp6d2FB?=
 =?utf-8?B?bzJybmFEbHNYOVhQaFdubzVvd3g1OTNoNFRXQXlodnczQ3g1dFQvNHkxNlFu?=
 =?utf-8?B?a250M3haMkc0dnpRSnJ4QXdrY01JbEJTNnBhc052aXhGTGNPT29hL0htRW9W?=
 =?utf-8?B?VmxaQW5RekgyMmJNcnM4MlowRWQ2VXBwUWxhWjlxa0t0cHRnc1ZSaDcyYkcv?=
 =?utf-8?B?ejU0WWFQVVlZTzlaZ0JrVGpnWEo3SWIzSnJ3UlRDaHFnbFg0YXVyZkRMOHF6?=
 =?utf-8?B?WGFFbG9tb1VBbVNJdlorS1B2VFB1Y0NQY3JRdWdwR1RwSEtLbDN6czBFWDcz?=
 =?utf-8?B?ZEtoS2IzMjFQSkNyYUdzU2hLREt4NVFrM1dFWUJwWGhYZ1dENHkzMVJsa0h2?=
 =?utf-8?B?bjlmNms2azhFREpGVjROYlZlTjQ5OFcyYlo5emE4cGtodWZQV2pHbkVmYXph?=
 =?utf-8?B?UVJDMk9NeUpMQmxQZHB0MGlBOTduQVU3MkpRRlVGZFZmQy9jTU1UK1A4ZVlC?=
 =?utf-8?B?ZjlvUm5SNEJqUHpocEF6ZDFQdDE0b0hzUW1UR2xqUzBVdVV3aDFrbjl0ZDB5?=
 =?utf-8?B?ZWZGMFRiUjVsUThkR0p3aDNZaXlaeFNobEF6SE5Fd0EwNFFzNzlGbUg3dHB5?=
 =?utf-8?B?KzFlOHFQRTRHYzV3VWZxRnMzb1NGYzdvWjJIQUorNEVYMSt3dnRVQzRFTTE3?=
 =?utf-8?B?RFJOWEY1VmsrN0MwbWxsdVdVKzJFTVZDdVNHUXJJbWRzWkgzRUZkMGhjY1hk?=
 =?utf-8?B?cWxWbEluMWhHeTdkSHVWWW9yQ3IxSmpIaVI5a3lUSHBPUDFmOW0vMlpTbDdC?=
 =?utf-8?Q?4v3nVBWFXW8tmBVw=3D?=
X-Exchange-RoutingPolicyChecked: azuPm48kARfsl2yXmzjNolJUFEcW/jPZr5YB8sO/P+dkyYtAlIc1feao9jLBgQ7d90z9UEMg1/4ETDHfrLcU98Jwm76RFjJYdfS6qLf3yEXMeJP1uMcIO4DgfvJXSkYeroH0h5IOHMdb0iVuMKQNToDNStvRBr7+ScdbNOw+5XFoF2zNBrTLib0E1blscX6W2bP4uPNd9uDivToBtX4Hn1JwpB/Dsg3+n7Ylapfcwsm7g431a/1QGYtROIlX1ze5UsMH5fKsr4Mi/Ku1kqH7H2UsunKBnAjv10//3NjhQNazvygLShJYkoV+HMgptKoooBriHT0PvjIDe6STaOdcog==
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b81496-191f-435a-e323-08def2e2928d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 11:13:27.0306 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1HMJa1nHpLbp1nQqkY9gT4DQjKHMMYSZ5ttUaFdCfrK4U0H0mHWBzgiwKPFi+kACAvnbXUwBT63e0nFIK5q2lFOUqOCP6cELjnOvwJQTONE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7437
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



On 7/28/2026 11:50 AM, Satyanarayana K V P wrote:
> Refactor vf_get_submission_cfg() into separate vf_get_ctxs_cfg()
> and vf_get_dbs_cfg() functions which allows independent error
> handling and validation for each resource, and improves testability.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> V3 -> V4:
> - Removed coverage for more error scenarios. (Michal W).
> - Updated fucntion names. (Michal W)
> - Added error scenarios in new commit.
> - Updated commit message.
> 
> V2 -> V3:
> - Added coverage for more error scenarios.
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 49 +++++++++++++++++++++++------
>  1 file changed, 40 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 37899fcf5b22..e96515766081 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -568,11 +568,11 @@ static int vf_get_lmem_info(struct xe_gt *gt)
>  	return size ? 0 : -ENODATA;
>  }
>  
> -static int vf_get_submission_cfg(struct xe_gt *gt)
> +static int vf_get_ctxs_cfg(struct xe_gt *gt)
>  {
>  	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>  	struct xe_guc *guc = &gt->uc.guc;
> -	u32 num_ctxs, num_dbs;
> +	u32 num_ctxs;
>  	int err;
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> @@ -581,27 +581,58 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
>  	if (unlikely(err))
>  		return err;
>  
> -	err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY, &num_dbs);
> -	if (unlikely(err))
> -		return err;
> -
>  	if (config->num_ctxs && config->num_ctxs != num_ctxs) {
>  		xe_gt_sriov_err(gt, "Unexpected CTXs reassignment: %u != %u\n",
>  				num_ctxs, config->num_ctxs);
>  		return -EREMCHG;
>  	}
> +
> +	xe_gt_sriov_dbg_verbose(gt, "CTXs %u\n", num_ctxs);
> +
> +	config->num_ctxs = num_ctxs;
> +
> +	return config->num_ctxs ? 0 : -ENODATA;
> +}
> +
> +static int vf_get_dbs_cfg(struct xe_gt *gt)
> +{
> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> +	struct xe_guc *guc = &gt->uc.guc;
> +	u32 num_dbs;
> +	int err;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY, &num_dbs);
> +	if (unlikely(err))
> +		return err;
> +
>  	if (config->num_dbs && config->num_dbs != num_dbs) {

hmm, this might be pre-existing issue, as any later change post probe time from 0 dbs to !0 is an unexpected config change

>  		xe_gt_sriov_err(gt, "Unexpected DBs reassignment: %u != %u\n",
>  				num_dbs, config->num_dbs);
>  		return -EREMCHG;
>  	}
>  
> -	xe_gt_sriov_dbg_verbose(gt, "CTXs %u DBs %u\n", num_ctxs, num_dbs);
> +	xe_gt_sriov_dbg_verbose(gt, "DBs %u\n", num_dbs);
>  
> -	config->num_ctxs = num_ctxs;
>  	config->num_dbs = num_dbs;
>  
> -	return config->num_ctxs ? 0 : -ENODATA;
> +	return config->num_dbs ? 0 : -ENODATA;

the config with zero doorbells is still valid, so IMO we shouldn't abort here

(doorbells are not required by VF to submit WLs, note that even xe is not using them today)

> +}
> +
> +static int vf_get_submission_cfg(struct xe_gt *gt)
> +{
> +	int err;
> +
> +	err = vf_get_ctxs_cfg(gt);
> +	if (unlikely(err))
> +		return err;
> +
> +	err = vf_get_dbs_cfg(gt);
> +	if (unlikely(err))
> +		return err;
> +
> +	return 0;
>  }
>  
>  static void vf_cache_gmdid(struct xe_gt *gt)

