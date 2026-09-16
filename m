Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A59BC88E77
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 13:25:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C40C10EAED;
	Wed, 16 Sep 2026 13:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LKGIsYje";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A4910EAEC;
 Wed, 16 Sep 2026 13:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789565129; x=1821101129;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hhtalcKoYLOZCdHT4cS+UHN4up6bTGTXSfRlb5otJ2g=;
 b=LKGIsYjeBjrxRv/v+j3diRNWnaqjRYlAGbLNnZVq5uMMNuwrSJzSU0ZH
 DtdYQcWpQWGgyR3Q5vyvfI33SlwFmupwFxu+nqHaUFC6I52iAH6D3IrGl
 VBt8iq77tbfgbKIpz7lId36EEoxyzyoy/1vHRzEVoLkFoGoyU82Hc9aSW
 RHWCRB/CGANtm1WivFhwpWEd5iy4fMIx1Uw++R1sNmoBmKB/wvMLDxltI
 dgIDy6zsYZ1pkjE6yB0E3N6gX48EYuw1+Z70P39lwQCKHaIStqT0B9Mab
 Jrzhiwf2jpMR+37U2cxUaDH+z5J8ZGCH5uVuXapIvuu+0Obp65XYMp6bR w==;
X-CSE-ConnectionGUID: bLFmiRXjTvWKlHIC/m1kgg==
X-CSE-MsgGUID: nRvEwv7LQpq2L3Y85nL6lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="88877875"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="88877875"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 06:25:28 -0700
X-CSE-ConnectionGUID: L6P0AfMxST+/aeF+eDcZ5w==
X-CSE-MsgGUID: wdT8+tRkSBa2bOeapDySIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="311627454"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 06:25:27 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 06:25:26 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 06:25:26 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.42) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 06:25:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nhYYontLNqGNHUL50mTwA+tF6KFIRZ/kBAZVvq5desJgFvccEft3sciNMKY/S99KjMthmbUoHDRnEz+7nWMOc5y/GYwDyyF+Icdo6kLGZa4h5qK6SVRElYoJ89CEYtpIKqL01WaRhXhqtwS8gjtTU7FuCuFP5uRvzkJRk1g+XoI9DuwnIfTCev3um8EN9pe7JczCyuo6ymb3ssrmFFIZwtHwH9tmVj6OjlsTckuI6HJEzArzn6FujA6c2lgYEVNIGaY5Y+7ZnicBCLgH+hJnk3qHqP0v1INY6ollS49RCAEA3A4s2L8pZCq+iNvcQd+0yLZTUvLHLqg1FnuDUKjO2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3FdZzNhl4z5hdvlOkAKiDYz26d5nvcSyoePYlgLvg9E=;
 b=FajkEpj8Zo3b6lIGIXly6BrgQ1DNpi6k9Vc5NhgPM4xnlmEQSz9c9c80RfpbEj1yDMnY5M8zwyvpioI+8GqooHsHaMO/jo5XrlVHUv6UyLhP+RHF0LlwR7XO9y/jpodXYxm5Bw1QyXChPbyxwXnmyvyDeoNRf8+O4q+RN/LyYPXztzeUyubEHs3RTmHpnihQKSc6VZHWJVSQPfaJnIFc9CLz9VOTDslx5K8irmDH6Vjv7rDWO3tJi8cCb8LY+yZXWUmBx54opvGg+x9H1G9TPMfjwOEouJQJKgBx7H4eAPgQCmUJyF49ujr4LJWucW8A3qaWbn3FsrbvDdY5TR/gsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by CH3PR11MB7868.namprd11.prod.outlook.com (2603:10b6:610:12e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 13:25:23 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 13:25:23 +0000
Message-ID: <0e70bfe1-8da7-43b9-bab4-31b2c93aa92f@intel.com>
Date: Wed, 16 Sep 2026 18:55:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/13] drm/i915: Carve intel_atomic_commit_type() up a
 bit
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>
References: <20260909161730.12969-1-ville.syrjala@linux.intel.com>
 <20260909161730.12969-12-ville.syrjala@linux.intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260909161730.12969-12-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0037.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::11) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|CH3PR11MB7868:EE_
X-MS-Office365-Filtering-Correlation-Id: 39af95ea-c487-40a4-4f48-08df13f5f66c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|4143699003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: xBmf89RG3pXlUlb6xTquheMY7rMBCuATkM3w5mJr4nHK45idV4fgWkloedNaY07dRRVuJALM/0QmwjX/hQWsRn5TSD93fJaB6o5LtO9wYuRn0sPoBWCYygII3qvibfTO3z4jNRzf7gmdh234YhdCip9XanWjV+rEuu46E28wDy/zSt0EthhcpG9I7PY9qvkpfBQR2SKa3Y9x6AQEq8yVphrwDQ+bwkpEODiM27nSpvTKuN1f3GKyWnW82uDOHytqdvCXZaCepwSq56O7Xh3j2NZOy8d9SiVheZZYzH/XC6/P2QPyCJlrM8RC4mzm4q2JMADj8DVPsynZtub7kDoR58tnIxKhjESGxXoHiXTdf70eRs8RWWNyImfec0WEPAuTJKpzwlB/OGyXLDJNmdHtZBxBMCQoBtoS7daQGN4MhU0BClWd8+DoiGREyJc+uZIsNIB+TdhQV7KrIuBYbW/E7OUqWhQoGgncARiUy8D72F2OlxVb3Syu8hc1wVggUpVWxVj5+qHztnOCgUP6i8r6G2zdjmbVjuuP3G2P08g9Rzuir5oET3aYu7MTMbbFCaLbl5sykKNMmaYLQkC0e44qB6ZgwR/fVf50i0CBvqa0OkWOA6Qg5nzmYSoYTvHSgX7Wsmy+BqqUPScNhm5HT2nUa/72gc22BjIHa8uARiLr42U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(4143699003)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzE2ZTVnNWJod0w3eEZYUno2czAwNTAzNStxWGk0bU13NkFiWmFBeUp6RWRO?=
 =?utf-8?B?Q3ZzeHZId3hCbTk4QzRYVWNBWmloM2l2MHBmaDlMelcwdFIyMGRmNysvUm0r?=
 =?utf-8?B?NEF6YkxUM3BxbXh4VStHbnVxNWppWXVWWERWNklqRmxOZm1UU0xZTDBtZTZz?=
 =?utf-8?B?NWo0YnZ1VGpodDBkSzN2K0g1YUNHQjB4dGtpNVhBTFJWcVF4REFSSkZYM3l4?=
 =?utf-8?B?S1MzVDhsWDlKZ1Z2c0FRbVRQOVE1OU11N0lEdHlYQW1QSEFRN2NGMno1dEtT?=
 =?utf-8?B?YzRxSjFPZit5b01xZlBUVExhQUpzcGJ4NzdEbHVna3hlVStlKzNCSld3VU1N?=
 =?utf-8?B?TEtiNWovdlI0bmlrcHBJeVZ2VmphMmhyeFVZenV2azVkdVJaVWpDMkpoVTRw?=
 =?utf-8?B?V0JScnc4Z2xjdEJKUWo4WXZuMzI4NzljWGExZjRFYjFTL2lLOUVuc0hoekRu?=
 =?utf-8?B?c05mNkZIQjZLT3BZVHR6M0pkY3dWTGZUYnJFUmd4MmVySm1wYlYwZFdXYzhs?=
 =?utf-8?B?bndpMWpSeU1QdjFKT2MxMHVmOHU3RjYxZDRYeXhXMk1QZS9DN21RVGNxQjli?=
 =?utf-8?B?TENURWJ4RDZlMlcvdHdubk54Qi9xWDR4VzRCU3J1WTgzcDBwTitLcUI4MDU1?=
 =?utf-8?B?WER0c2tpUVF0cUM1a3JqN2gvNDZXUllDdzVFWE1adm91emRLbVRFZzVjbmRS?=
 =?utf-8?B?MEUxM2lzRFI0N0tScUx3U0Q1UkNkRkVDcy82amRzOEVHZldaTDZFRVVaZ2w2?=
 =?utf-8?B?aG0vU0hicWx1Tkc4UDRNZ0I0RktLVjBnak9hcTdTNGc5SUhIWjIwdkdXN0tu?=
 =?utf-8?B?YWk5N2FoQ1BqNUwvdG9XMnYrZ0Job1NIcGhEeStBVjNiRkN2SEc0NkdCdVJ4?=
 =?utf-8?B?dU1lZjY3YWVvOHlqMEZnK01mREE0VVJjYXljdkl4SkgxZ01mdkFjUXFDdlRZ?=
 =?utf-8?B?T0h0eXNKOXY4dC9xS1FqdTU3QVRQT0RjVStacVpHSGtsY3l4UWVvUGlVaVZU?=
 =?utf-8?B?RTAzVytSaE9QRHd2OVVWMGhaVUNPNUNSUmM1OVpZVER4SjZsZmwwMXBTSlgr?=
 =?utf-8?B?VmluQ1dyVGNwQ3RJR1JseFR2OG5oemViYXJPaTlFNllib2JKNUc3R0JvWmpw?=
 =?utf-8?B?Qm9TZkp3YXRRUG1nWWRWd1dZY1F5d1Ntdkl5NHJqcWFWZWJRcXNhaHgvVC80?=
 =?utf-8?B?MDNnbWFYeXc5bmQzS0dwdVYzem8wcThqV2VCNS9JYUFhOGNwVXRjRHFkYzFQ?=
 =?utf-8?B?cHNIV09CaElYWCtma2U3elErZnZLQmlrWVFVZTZKR2tTZjZqSHN2Z2tlQ3ZH?=
 =?utf-8?B?RTJNck1pTS8xUkJjVjZ0RWRmSjVLSkwvYWV0TjVnMjVhaHI4ME5zZmVmWnVu?=
 =?utf-8?B?VDhMa2ZGTWZNTlppN0ZSMnNuZ21TbFZKYUJmY21NZ2NNNXNuQXB5d29nNWpk?=
 =?utf-8?B?a3VhdUhxeFdYTmhvSStweGRHV2Jyakxlb3MycWlReCtxUlJtVWQ1TTNHeW1O?=
 =?utf-8?B?TWMxK2RrV0wvVnVEWkJpM01DWlFIdXdLYy9Gcmx0dG44enVDRFNHK1FYbUNq?=
 =?utf-8?B?bVMxR2lJTDVXWWZVUCs2Y2xGWXR1WkJabVdpc3NoZzhoVVl0ZnQyellWY0xX?=
 =?utf-8?B?ZHNDcFpTK2lEZ3hiNFREZGRSOWhNR3lNZmZKSGFDclhQc1VXSDc0WFMxWTNM?=
 =?utf-8?B?QnNEK042Qmw0d3BaWklHS21DSkdraXZNc0ZkRVZINXFNQ3lDSHZsRlhhUXF2?=
 =?utf-8?B?dk00Nzg3MWZGU2I1RGFyem4vUDgwNTQzZ2I2TVFwclo4SkZkNXBERVdvY0pW?=
 =?utf-8?B?aDR6cVdpOWNjYy9hNG9uazB5bzhjbXhHWTRaOC83cUlVU1RQZFAySVVrZmZF?=
 =?utf-8?B?N2tnbUt1WXNkTkF6T2ZGekJrR2tsWFVTSWdGMG0yRXhBM0dtdjNYclVqS2xm?=
 =?utf-8?B?V1hOYVZmejNsQWdOUCszd3BVdGxRQ2FaRy9TNWo3dUlONDZzSmZFS3RkS01P?=
 =?utf-8?B?c1E0dTlBcmZ4dkdOVHlhWWkyMnBmUUU3c2NFajJGWXNEeVZkeEhzOG96NHVi?=
 =?utf-8?B?QVpkN2E4eC93WFRUSDNJaVFPWHRNcUpwYkZkRmFtQ3lOd3pteUNydnEvaVJV?=
 =?utf-8?B?K0dQRkFDOEdrWG9MalpkMjRtdnNxT1MwR2xVOGdsSmdyNXJQc1drOVVIbjNp?=
 =?utf-8?B?L3dmMnZpMjN1NlZRK3FHMkNBR1JOVndvSmx2QWlqckFmR3ZFOTBpMHd5OCs5?=
 =?utf-8?B?WGcxZXVtSktHMTMxR2ttck9SYjFhR0VhdEtEeDdrYjhPQ05UZ2NPeEMvbEZ4?=
 =?utf-8?B?U1kxdmhIMXc1VkZidE5IZnJlem5CSDVNemJ4eUZBWEZHNGE4L0dVU1VsNXlv?=
 =?utf-8?Q?875lEsD6K6EagQhQ=3D?=
X-Exchange-RoutingPolicyChecked: G1zLWPOD93jtVy0d/KYwjmMhQaJq4OGv7eNSW8LCKubeNqhQ0NtRsEZ/eiHLaUL9TzCYyyJGRxPXdR8L9ljqRyhxFL0RfCuiUQOupQ1+LNrgRrYK+rPVLHaPbqHQ/4mLaDNLsBvpE+WNH7P/qr6RpvdfZQEcKjrb7fAKwFo4TRM68InK3c/cABqqmYJ58dEq9RNJtF5UAl9z4N8K8nqw+ks/v9ETUbaMTcffCIYZd2aPzUgo7bwxdYeMnZK+LN17NtjigRpDAvWfQh36Nrmy42vCChcL6uH4zVBisWUrgYe4nT+l3mTeEE8TMNIJ0zC73WzP/E8smmReDGisTKMORw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 39af95ea-c487-40a4-4f48-08df13f5f66c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 13:25:23.4780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b6M5tDn1wofNMOhh4OpOIWBARMVaRyqwRRxvE+2BKD1AvB4+Sh3kxK9MMqn6NM3uiqGbBmsYD3n+MoQinLe9AQAOa+NFVKQHdmKF97F8aYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7868
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



On 9/9/2026 9:47 PM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> We can't currently do full modesets, fastsets, nor async
> flips via either DSB nor flip qeueu. Let's checks for those
> up front to reduce the clutter in the if statements.
> 

typo: queue, check

> And while at it, throw in some TODO comments to remind
> us that we may want to implement these via DSB/flip queue
> eventually.
> 

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_display.c | 22 +++++++++++++-------
>   1 file changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 9a24eb16025a..eea2c2b40304 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -7388,21 +7388,27 @@ intel_atomic_commit_type(struct intel_atomic_state *state,
>   	if (state->base.legacy_cursor_update)
>   		return INTEL_COMMIT_MMIO;
>   
> -	/* FIXME deal with everything */
> +	/* TODO maybe enable/disable planes via DSB/flip queue during modeset? */
> +	if (intel_crtc_needs_modeset(new_crtc_state))
> +		return INTEL_COMMIT_MMIO;
> +
> +	/* TODO implement fastsets via DSB/flip queue */
> +	if (intel_crtc_needs_fastset(new_crtc_state))
> +		return INTEL_COMMIT_MMIO;
> +
> +	/* TODO implement async flips via DSB/flip queue */
> +	if (new_crtc_state->do_async_flip)
> +		return INTEL_COMMIT_MMIO;
> +
> +	/* TODO handle VRR with flip queue */
>   	if (intel_flipq_supported(display) &&
> -	    !new_crtc_state->do_async_flip &&
>   	    !new_crtc_state->vrr.enable &&
>   	    !new_crtc_state->has_psr &&
> -	    !intel_crtc_needs_modeset(new_crtc_state) &&
> -	    !intel_crtc_needs_fastset(new_crtc_state) &&
>   	    !intel_crtc_needs_color_update(new_crtc_state))
>   		return INTEL_COMMIT_FLIPQ;
>   
>   	if (intel_dsb_supported(display) &&
> -	    !new_crtc_state->do_async_flip &&
> -	    (DISPLAY_VER(display) >= 20 || !new_crtc_state->has_psr) &&
> -	    !intel_crtc_needs_modeset(new_crtc_state) &&
> -	    !intel_crtc_needs_fastset(new_crtc_state))
> +	    (DISPLAY_VER(display) >= 20 || !new_crtc_state->has_psr))
>   		return INTEL_COMMIT_DSB;
>   
>   	return INTEL_COMMIT_MMIO;

