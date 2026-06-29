Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9229AC43458
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jun 2026 23:31:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 466DF10EA8D;
	Mon, 29 Jun 2026 23:31:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XsjchDYd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 202A810EA8D
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jun 2026 23:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782775917; x=1814311917;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=VgphDc+Cskcww4/eac09C/Sd2NLqqg15qOB0oTM8C1o=;
 b=XsjchDYdXVMoTS+KE7CG5zkIj5OdBhrF7VidTGap1gepRQlXmCqHCFkq
 lNdyqDV5zHjam167k09pc4wP8a5xJXtAipaGH4hHo9gyTsMvbEpbCYQX+
 evRwZsPr/BYxLGoVR1ut1r/TFsvbx7SZpIeXzmb4YYeSMZVGxV3B3WUca
 s8mfc5uwdIpjHoZbH6GRLJOwzn4gB3N0eNDemnhXAfPDHtqqSo0FQviBV
 v0oqvZfsR0Tl6rziWJOTAgMVScnnLDrTYFO1B83/lDi506A5hXHLGVAOr
 6Cpy26csDN3yqWr9cnAfVzRJTkpAwVpvHaMHQepENlxBom7oNAS9uW8TU A==;
X-CSE-ConnectionGUID: SPNzatyXRImZVSS3qEo9QQ==
X-CSE-MsgGUID: 1eBG2oCTSAqs+trjV05TSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="86031187"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; d="scan'208";a="86031187"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 16:31:57 -0700
X-CSE-ConnectionGUID: 2+YUuLcnToKcChqNaEnHqA==
X-CSE-MsgGUID: yavGNxjWTU+W0XcpGNBAmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; d="scan'208";a="276363689"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 16:31:56 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 29 Jun 2026 16:31:56 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 29 Jun 2026 16:31:56 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.26) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 29 Jun 2026 16:31:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wbzwe6x+vZ7Vrc4gfQ39zbOWQXnG9cASr8DzclElMTu1t4Zdkz88RYOQ5t4PmdK5WgTIQOBe7LHFYZosDHp2dCXWMMkj6NmRd4FXPaTEKlrLJxFYLHywdLt3Sot3IN7ftT1/ngBBO4tHmyn/tn1b1RbFZqnqzwf1pu7OSQElNFtfTgeF8MwqUpg6chbFjmM2EyVIwGujYrhFtcOnR2nduVsP/dgCyKB4N3qkAeu8w+rDZ/IqDfnvdPcigDZcFLYMlEfvsC5ahIkqR0ui95FHqVxcjstpSBHdy2gK9n6XxoFgWO1J7MJCsDZ+JGlUjblL8giATG6VFGWXRGlwFmbg9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gxHA2zFIkERrvyUMK1nfe7giT6/O1VrEQLIBPcfAcso=;
 b=B0Z8c2nR5JucXFSOH+okY5PdNswI246MC2mriBDaFEeHpmULW5AHx75+eUwANGZlpHaOLby2Bva+655cyhAQRF+Pgd3JASxQ86J7cMX7b4390Rw6wquumh+akfYpQHhhSHblMiOrAuCizGx9yXIGgtQMWn7RuQP3rLLhquXLbfHQsfLecHQSNZMgPe1pt/2yN6++T4T6f2Cfnsjp8J4eriZt4X2o4sEGslG+DA7xhV1hSlmJyQ6Fjc1UIfQmF0I2WBJmBRXw8vqIhUPVxrftVFHydm0KMTFlOEHJ1WVmHbxsQYJGockZQ7RVMkYT/iHJvwl8Nt4hvJkKV7UgrN9w2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 by CH0PR11MB5266.namprd11.prod.outlook.com (2603:10b6:610:e1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Mon, 29 Jun
 2026 23:31:54 +0000
Received: from CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc]) by CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc%2]) with mapi id 15.21.0159.014; Mon, 29 Jun 2026
 23:31:54 +0000
Message-ID: <250d289a-3fd7-465e-9e81-e91601a5bc03@intel.com>
Date: Mon, 29 Jun 2026 16:31:54 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] drm/xe/guc: Preserve HW error state in wedged mode
 2
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260629140836.2074349-1-zhanjun.dong@intel.com>
 <20260629140836.2074349-3-zhanjun.dong@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260629140836.2074349-3-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0159.namprd03.prod.outlook.com
 (2603:10b6:a03:338::14) To CO1PR11MB4979.namprd11.prod.outlook.com
 (2603:10b6:303:99::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4979:EE_|CH0PR11MB5266:EE_
X-MS-Office365-Filtering-Correlation-Id: 26718cc4-6b32-47ce-c626-08ded6369a98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|6133799003|10086099003|56012099006|11063799006|4143699003|22082099003|18002099003|18092099006;
X-Microsoft-Antispam-Message-Info: zCmexPXvo5ngLm3Up1KXsXSCCacpzK4hqxawSuYfnKSeMIL3F80KnRqlivI6xT7ibki0ECTH5vcUqRs6utsxJADWLORRIv/MXe4BMUATLBkuz5KNRSpWBj7rO8L+mpLO00mQcPFN/lJCgzut2x1eg0ns/2/I6oOIa1VgI5udOhvXsbZUm2Iy7KZTUUBu66eAteZ4InL8gFQJuU8rhbuACxMjssixrn8PmthaFmAdnU1C3fmB50Gi0sfOx5BI/VgTZcgAhcYhoAP9SJ6qPWcg/pfWTvUQbaU/6xGqheViVnRYWnpoESa0keUVOa7LUnkZmrbF0G9VoIpulBvpmt7GtXbZ1kwmPbRNYtfRzYaUh6wr6nFSwgs4jD9h1aWvFErjhfQ9s0VpAeTNGiDsdnQAd9yx1/pec3i7lbEfcFYwhXH+LhbBWAAIi0hcxSUZcjp0ip9kSi33adB1QtoqCLFNu+Fxxl9RcGDMc68Ds/DQuhzRzJhelTTJ6hLN2KflnbosQb8iaGNRGSy+WJzKNaZoCjGRsJrnpvkh8p8ziX3QHVp3TcfM+Uad/1788qUbYdi4Lrb8cDCRsQ2uvVDyP2mUu5KXNmHvxxiqGG9pSkiCJ3Y4psuUtHdUWNcTTh+varn+HhghbpF9ONWaHq6oXuzgAl0Hy/Z8kYZLnL12mfcs7FQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(10086099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003)(18092099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFdTZEcxMEY0NG1WTHNlVFAvTFJVdi9KRVdyNmpWajNtYU9hSjNFN2MyWlMy?=
 =?utf-8?B?ODk3WWNmcmpSd3kwWEdyL1U4ZFpnemMyVWF4eCt5ZGRiUW5VcDkya1VpcUxY?=
 =?utf-8?B?WTBUNEFRczI0ejR6SUxGOFd4Rkp5dFlCUnVWSWplRG5PSitEcWpkWDJRejNm?=
 =?utf-8?B?SXRkZ2xYN0FQd3lZdThYR3JHc0hxckVBZEdWU0xGc1k4ZjhFejM5d2I4cktk?=
 =?utf-8?B?K1NXRlRtSXU1T3pZZ25EWCtFMTVRV29XQzI0azBwVEJoZlRmU0hQQ1E5NFUv?=
 =?utf-8?B?TjhheWlYV3ZmaGNBUURDZ1BtOUZYSGlkUHVtWUlhSTZySWkwNnQ1ZjR6bXJU?=
 =?utf-8?B?cUxZZGowWFhpK2p1UEpMdDhFTmM3Yk1uN0RZQzRRaEg2TVdDazh4NVA4TExT?=
 =?utf-8?B?TU9KMkVxc3RsdXd1OTJVc2JyUW9JSzZLOGF1eVpGM2lLaENpNEF0NjcxVkEw?=
 =?utf-8?B?TnlMWktQU2hGcm1FeG83VnhHVU5hTE01czdsLzdVdTd1Z1owakN3OGNnTity?=
 =?utf-8?B?eUFEdTd0bTBnd1RXSXVleS9vdDZGRm5wUU9NZXlaMWpaZHV0emF4bDlBcVIw?=
 =?utf-8?B?Q2NkNklkamwrQ1BUZ2RQT0c4eEVFV1VKVWNsTm00Rnd6bkVuMVVMUVVvZ2tX?=
 =?utf-8?B?LzFqclU3aGs5MWpNemJoa3RnOEhmVjltaTJRQ0RCWC9oeVRiYm12T0V4Nlk2?=
 =?utf-8?B?bUZlVDRMZGF2VkppL0EzQ1hpem9LaXBIalZON0haa3EzNllodHNvL3pZMlc5?=
 =?utf-8?B?M1pnSzgwYnpFUmVFcG4zN3JBSllLek1JS3pubmErZ0N1UlVyTmJUdHpNY1Jm?=
 =?utf-8?B?czQwU3I2RkJlWC90VUpEVDVZTVlFUmNnSmd5Wk8vRVdVcGVoQWhYYWxUeHBu?=
 =?utf-8?B?YlJLUk1qUWVJWk1wMTZUbHBWeVpCbngwWGVKTFpEZDk0a3JwNWdHeFdUTWVm?=
 =?utf-8?B?WEN6N0trS1FoenBBNXFLbDVtSzJyOFdNVXBIRmJpd3MyN2hyZ205cWU5R0Z4?=
 =?utf-8?B?R3ZTZ1kxb1gwK0NZcnRYMmY5LzhXNFlvejdNZVVkR1ZzMVRhUzFGaklTNklJ?=
 =?utf-8?B?T20rcldZUWJJUWdhRmR1NzdISDlHUVBZa2xrUGNnOENLNjIyUXVTMEo2Szkv?=
 =?utf-8?B?Y1BEUXNzVHNMRkFBTzE1T3MwR1FlSm5YMENuT0RuOHRMKzY2S2RzM1pFaDF0?=
 =?utf-8?B?U1BqUUx3LzJZTnpxTThrU2tBNCt6TzByY0dnOEJ4dm1vSjcyTG8wV1NyZncv?=
 =?utf-8?B?VUhJemNHdENyL2tGc3BSVWdmUzNRRTlSQWg1d09mR3FFWlY2WlNXcHNQb3I4?=
 =?utf-8?B?TW93cjhOL0tPYUljUjduVXZXM25jNmQrUWpyeHQrVnk4ZUVyQ2xtRFRmL3I2?=
 =?utf-8?B?N2Ircm1VdHU5ZkhzNFZTZCsxVHpPZnNNbmExS3FHYTBZajg0c2R0SGZ3NnNk?=
 =?utf-8?B?c2pjSmRndUxrUWswa2R0YUpaQkNsUHZWZU1QTVBYTnR3MnorRzd2YlFSU3p4?=
 =?utf-8?B?L3dFeVh0eml1cWhqL3BqdHM0aXN5Tk1TemtmdmRoOGgxWFh6Z01jNzhQU0xj?=
 =?utf-8?B?eDQ3QjU3aitKbm9PVDY4RmR0ZFdxTThpaTN3TkNoVjQ4bisxMUVOa2JMMFcw?=
 =?utf-8?B?bTlIQ25oQ0ZFK0RxYTdYLzJCcHhtdVQ4dG5UcjZrZ2krSVMvcmlxUlRIdExh?=
 =?utf-8?B?YVVQVlIxTFh3WHJyU3RnM3NIWjVZdFc1RXVVcC9tVWJGWituZ2Y3SjVwYTgr?=
 =?utf-8?B?WHFsN3c0Rmo1UmZwN3piRTAzWDh3UXJ3Y2gwckJzUFNqVStPT2tlT05reER4?=
 =?utf-8?B?UjJRQkxCcGVBQ24zNFpqaS9TbSt3UVM1UWdIMnh1cTgvaURtdnNlZFAzcERW?=
 =?utf-8?B?a0xyNEtUOUtYVGwyOWpNUmlUR085c0w3YXVKUkdRNzA4bVFKd3l2WTRtZ09E?=
 =?utf-8?B?dGV5SElMSTFlUUhCZmZpZ2U4TlRwRUtBQU1jS2JoZnBZUmJQcnQ5MWZhS2x2?=
 =?utf-8?B?cnIvTFFCRnU0Z0dqQXg4TjlHSWdqS01sdlpLRllpc1pDNkU1alB4SzU2VTUw?=
 =?utf-8?B?YTFZMVNrNjJXc0lsSGs1V2hwVnh2REszL3hOaE1Wb0hoU1NkTkNTM01vYkVP?=
 =?utf-8?B?dmVYUS93RXRGNnFUczhiRVlDaldJeXZMUzRiOVNxL1laMjM3VFA1Nm5zV0VB?=
 =?utf-8?B?eVhxaTlUd3VhVTd2NnplUDhrUjA2WmpCV1IyR2FScHBPZjZOb3crWjZmK0Qy?=
 =?utf-8?B?aG8xT21lWVo1aEYvNTN3d2R6bkc5dVpaUUhVaXVOTEsxTkM2Z21OYlkvOUd0?=
 =?utf-8?B?VDArMHR0UWlKcUFrMnl6MTVEbEhCVk01QWR1Q3BzTkdwenJYVEs1L3dVbnJ3?=
 =?utf-8?Q?kC6lQUYeB6l1zwdw=3D?=
X-Exchange-RoutingPolicyChecked: a5MbvdZZ+dozR4PnNa+TqGpOqp/4IZcsYx+d/+vZLpGintq039FYUi71zUiqV5iTL1xcWO1POCKsAModentBXa6wDzzjaG5OTbfq+VgAEK40H6yonGfvEPlQC6mAdtcDUaXw9ZTEKE2XX7SUuCusuQMfHlLXEX9kNl+7XAmivhrfb5eqQO05XsZdTX0O5BgxSeW27/YX3RICco5Q0KROMYcGOTa2RaXVRemOnvq2uDt+IBrBFeDck8ZJqOaqQ/bvkC9ZE/AKOP7W+X2EeOuX38OA+nDvZYtKq2choQjrepzLtf2UfcNtSDNJ0CsMGsdbEe7UvOte+KT6bu1Te6xzxw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 26718cc4-6b32-47ce-c626-08ded6369a98
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 23:31:54.4577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9u3wWOGBLQJ5aE6Vy9xGLrM5g4A6BUDulymlzHM0FFzaMw0X9DLhCi35fF8KzrhJylAVVNBNs3LBkKS1bWc3dIApoPgHmWu35Nh9L/T0pE8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5266
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



On 6/29/2026 7:08 AM, Zhanjun Dong wrote:
> When HW reports an uncorrectable error, debugging the root cause may
> require halting the GPU in the error state so scan dumps can be collected
> and inspected.
>
> Use wedged_mode=2 for this debug mode. In this mode, Xe already avoids GPU
> reset on hangs, so also skip the engine reset cleanup path for GuC
> uncorrectable error reports to keep the HW state intact.
>
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 29ccabc4b7a4..05fa4e466461 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -3024,8 +3024,10 @@ int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len)
>   
>   	trace_xe_guc_uncorrectable_error(q);
>   
> -	/* Treat the same as engine reset */
> -	xe_guc_exec_queue_reset_trigger_cleanup(q);
> +	if (guc_to_xe(guc)->wedged.mode != XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
> +		/* Treat the same as engine reset */
> +		xe_guc_exec_queue_reset_trigger_cleanup(q);
> +	}

This doesn't seem the correct place to do this. On one side, if we skip 
the reset call here, if the queue it's actually hung on the engine then 
the fence will eventually timeout and guc_exec_queue_timedout_job() will 
be called anyway. On the other side, 
XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is a generic flag and 
xe_guc_exec_queue_reset_trigger_cleanup is also called from the CAT 
error path, so we should cover that as well. The best way to solve both 
issues IMO is to add a check in guc_exec_queue_timedout_job to wedge if 
XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is set.

Daniele

>   
>   	return 0;
>   }

