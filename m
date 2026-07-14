Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F333C43458
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 21:47:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21CCA10E0D9;
	Tue, 14 Jul 2026 21:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D+mdDZev";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BD3510E0D9
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 21:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784065664; x=1815601664;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hj1yRPYfJc2u6rcdSpOSN88t6lW97/TwcWkq7396Bn8=;
 b=D+mdDZevCiOUVKeqfXyrGq4k4DcDqhxXSugKZVa5c+p3kxzPJpgAlwPa
 dueJS45aYATWRVgULhiEq7aHbm925snrK9jzQaaVHmnzDxOgKeQm95s2Q
 rSKqqwVXccuMSv+RFSfooewMd+QziZP0ghrsKOIrKhUBKaqu6ibjY0FFD
 Xd5R1seyDEvpRumwpC17+sDEk+zCRQIQ0fx+aoy48KKek21noAc3BudRT
 CI2g2FIRVtc1/f3IWVShA9F22KDn+uoPTohYIhjn2X8e4qziQILzO0BM6
 jHBjvPob2PW2mN5/dD9QM9GlaUVWEW5KR72k2MIxj1DfNSENUcf+HBqcj A==;
X-CSE-ConnectionGUID: ZuDN/B1AQESKkHvseChnsw==
X-CSE-MsgGUID: g5BXfD2bQyOzNlTjhgxeWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="88596575"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="88596575"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 14:47:43 -0700
X-CSE-ConnectionGUID: hwZzU5tlTdylQObimhrvWA==
X-CSE-MsgGUID: ouPq9zAVTgSwWhYGwEvTLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="257927535"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 14:47:43 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 14:47:42 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 14 Jul 2026 14:47:42 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.11) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 14:47:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P80XXTJit8C1P/HAl96s8ajRj8c2A53GeOn7zXAWIAnWL28KBsUpcyP2kQvuiahXNA9UlAQ/MRg5UB8fuAZ1g/51I4LEWH1cxFeJ0RgY1r4k6zW91c6nZcb53vu/q7Zx6FbDWKJIVvsbGv+vS97TmfEGy7frqJInfyBmsQU2HEggaE0CxYN6WWudCdLutbzKOi5yAkOCFfM87wcTxgRV7buhion32UIH9mYQLamUeS75E71WB21GpHRGTXWPujHK/4MvE9Vsd6z8LCDyhBOdz0T8Ddlgb3FtAqoipS8fOe4U3DtX/vuPRGKIRcnJA6qnJIremk3kJ4N2drZDG/l1NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v6TwT62E7DmmnqziWmzYnIuTsXsBSnpPX4ftfQSxdqI=;
 b=rbScb/01EDKrutV69whUtSYZCd0Xc8mwyIws089AKwT3v8v95EzNNd4gQu+Ze+MO1aDgzM7QsC1w/fLbJRuoe9BT+e2VkEQH53Z31TMmKAVXGSYvNW3iTPAxMwVyM64ZfMSgWtz3ndm+a8f73FEECCMgXEnKXqAjrhKR9ADnUiVRrHDI7ty95c3LqukcUu9kfS8mAyZyrCg+9MJZQ2zGEea/IRjquvclVSWKUBMY/Inldw0G72rLt/37Ak/jHqSB+1DK72Sd8VG4te67jMu69T4Az5e4TWLPV+d5bkVNz8jkwElkYqcKtcpcREDS9rrH89uf50pBvoer+dleggoSnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 by SA0PR11MB4607.namprd11.prod.outlook.com (2603:10b6:806:9b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Tue, 14 Jul
 2026 21:47:39 +0000
Received: from CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc]) by CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc%2]) with mapi id 15.21.0202.018; Tue, 14 Jul 2026
 21:47:39 +0000
Message-ID: <351145c1-5b82-4b91-85fe-e66cafcb033b@intel.com>
Date: Tue, 14 Jul 2026 14:47:38 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/wopcm: fix WOPCM size for LNL+
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
References: <20260713221758.3285744-2-daniele.ceraolospurio@intel.com>
 <DM4PR11MB5456397EC19AD088168820DDEAF92@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <DM4PR11MB5456397EC19AD088168820DDEAF92@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5da::10) To CO1PR11MB4979.namprd11.prod.outlook.com
 (2603:10b6:303:99::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4979:EE_|SA0PR11MB4607:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ab22a85-599f-4ba3-f5ad-08dee1f186a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: Gp3/svUV/HnIAolPDq7zre4s8R/9E8ciAsPVy94mPDLHqY4Y68JW84KGebgE3h5G9EgM4NWniyPkcjLo67O+8okDaDI0Do6HxHeyC8//JQpkrInM03fBQGjJ4zXsYK31kwXp4g6FECg9CKua6fAMmD9hVRLLggxESP8Gusis0yoOYOmg5cLkNP2HDr/gG5Ef4a/39cGTpqtR1xICr95u5QdVpsl2FnJJQphszhPk08UWClAzVF8PtjM+k9k9+UTcHq+Hgtl82MPEe8o574m98MnoxkfWV8lvvDyzga4ealtU36MwwIuO8hdxdLMysYf9fJEZeGkD/nKWNDyF5WiPrWvVkejxNpNlynZt/ppvxdx63xlpVxhAh12yFmdWTVzuFtPzzgv/dBwqB986BR0W83nTnJQgfhv1/Fch3XRG6NhIGWgSuysU12iqJAionTbJ79bFC7e1SA+ct0OhE1eBuWKs1J2e2scKuW/uoyePle2ZOop0M4+Z/gYAi5QcLdFwWqP2he096CxWILWVENmDlUdVMbjoCz9jKBVAo6IfUUBlplg8G5KYemmvv9+gIHO5TbSgbT8r9Hd1lraPPZUUD2IIe4WrMeNVF4ljI4Y7hTjz7TevkuVI8tB6202n8CBTPJBzabHwU2m7Kxr5P7Wu1mcyaDMU3GVm4ZmLELC25Zw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djVVZWltYkZpeEw5amgvLzVKUm9YZDlaNE1LYzM2R3lQKzNXOGJHd0NMcTNa?=
 =?utf-8?B?T3VBbHpPQ0JRQzc2ZkQyVllyUDF5Rmd6YnowU1k0dnZxYVh2N2FRaVNyYitN?=
 =?utf-8?B?RHcyZUJzVmNnYURKVk0zTm92bXdSTnRqN0NhS05QazV2bVJzemtVV05SUXUx?=
 =?utf-8?B?RStFVXNBMzFOTGs5ZE5GWVViRG1Qd0cvbGpodUVQb1RXbTZVV3RsQ3NHQkZ6?=
 =?utf-8?B?Vmw2WlRJb281TDhrdXAra3R3ajdqRXhUNGlWWTNKY1RaVE5nbi9adlMrYjZK?=
 =?utf-8?B?dDNEWTNiTEZ6SnRjMmZUOTA1UnBWZTNleEI4T2hHZElMZENPcXdpeW1qdy8z?=
 =?utf-8?B?TzlWQkNTMDJtNEtyVTdIWUhIK0tLNmx3SEhzaGFISUNvT1YwSzQxL0hZRi95?=
 =?utf-8?B?cWpUeDc2Snp1eTBlNEU5QVN6YURpUjRHbVlqMlJQTXE1Z1RKNzRLNSsvQzNy?=
 =?utf-8?B?a0JQbmVmUDhLamhQRDdGN2h3OUFiYzMraDZVVzY5S3pjYnBMeW1VUGZIdXVU?=
 =?utf-8?B?ZmEzeldIc2ZtbnVhM29qQUpWOUJmZjBnTWNMK1FpNEpTME8rL2dmOTJ1aTBv?=
 =?utf-8?B?eHlZZnNJWW1hS0c5SnBFc2dnOU5JN1M1Y25ueEtyTFRodm43UlRpYUhXcEtT?=
 =?utf-8?B?L1Y5ZW1tY3FTdTA3aE5KMnVaNUtmcmdYVklzZEhwZWtJWlgyMkhqK3BoVk5w?=
 =?utf-8?B?a2IvTlNucFN3Y0FEcDVFRFJzbXlHNG0wRnpxQVdsOXBPem5NanZhWkJSeU5i?=
 =?utf-8?B?TEN6WGNaNmp6cm45aExMSGdCY0dLMkExTWZQMEJoeVE1Z1BTQU1xNWZGeHRu?=
 =?utf-8?B?eXlPRDR5QlkwdVJJV2FKZWtqY215REZWQXA3QXdrRDFXbjN4TTRXK3h4eFFn?=
 =?utf-8?B?UmgxLy9XZ1J3bHdUNG5VYjRpS2F0WUU5Z3RHNEx6VHdVTDhLWmtjM3hyc2xq?=
 =?utf-8?B?RUtpRE96STdwTnNvWkkra3g4NHZKYm5ncnhZS2ZOMTdLRFJoc0ZlbGVnYUZa?=
 =?utf-8?B?ZG1oaEdYSGNsMFNvMk5hTTZBc2ZGZ3VndGxoM2ZJdkExcTNpOE9oUldmVkcr?=
 =?utf-8?B?Y3Z3UjF4UzZIRmJ6d2dUUkpEMHV0Qnl0T2Iyd3kzQ2Z0L1hGUlRMdm0xYmMy?=
 =?utf-8?B?bms3RTJFZTYyVnh5Z0xvTXdsdDlrcWVNSFpkL1NLRlVQQ2t1aDlkb29HR3Rj?=
 =?utf-8?B?ZVREWGZzbUxGVVkvVWgwemZyazk3eFNwdkFjK0MyWEdCWVAyQWFiSjhQZ05D?=
 =?utf-8?B?YzlxY2VaR1RGWThJZlNiZmpUT0svdmRmTUwrZXpwMkgyU0YxQkk3dGtRSnpC?=
 =?utf-8?B?OTZjQTRKSmw5enkwVit4YkR4d0czbFYzcFY3WFM2dzdvQzIrZFRnSWpvVXBl?=
 =?utf-8?B?WCtHQ0FjaHlGdDlqUkEwQTNRNlZzakhaZW43R29md0kyeXNGazk3bmlLL2kz?=
 =?utf-8?B?aFBTUUpMdDFkL2RzdEhVZHdRODNyTm9TTTBySGYycnE5ZE5LTmFSSXdnazNT?=
 =?utf-8?B?Vkc3cyt4WXdLNzMyT1h0SGVLdnQ4ampHcGg1MGtIQUJ0cWo5STA5NVdacGYz?=
 =?utf-8?B?NmtISi9ZUGh1NStGdWprOEp2SFZqQWJkVzZYQXVKRCtzMUpjSllFOXlacFFq?=
 =?utf-8?B?dTBnR1NUNG1Nbm5kVTVGK2wxaTFWVzErOVlWVElxYjZSOCtFYkloTXpaQWF1?=
 =?utf-8?B?Vi81c3gvYlRJK2VER05NSitwQysxZXp6dGs5dGsyMzBzQW14L3dVZ0FZQXZN?=
 =?utf-8?B?eFU5N05hbnhTUkNYYjBpSk9oSlJSTmwvSkFLN2V4UHVwMVNjR1A4cWZZalJ1?=
 =?utf-8?B?UU1ydmlEc1JnZWRIOEpnNXFDdm5YV1d6eXJGMTZDSWg0S3VzZXVIWEE2UHNn?=
 =?utf-8?B?dTg0WlM4TXZ6V1V0UGJIZ1NlQ1F6dkZIRldBM1BLbG1oMzZhd0l2eVJqSlRv?=
 =?utf-8?B?M1JvSUhQY2ZzMEE0N21UbXd5UGMxUFAvanFDN3EzMDBZNkZXeWU0U1RzNmJz?=
 =?utf-8?B?UkpMTmQvbEhacmtnUkJOY3JZZFMraXFRdFVjU1ZEbzFmeFprN05YRzIzWVlj?=
 =?utf-8?B?NnhBKzUwa0haYTkvY2tYSEdxS25rRG5EdHNGZlE5azZ4ZmNLU1VvT0JoZ3F6?=
 =?utf-8?B?SHUxYmFXRUNkVGtsclFuNWJmSFNSYjBiN3VHZDlNaEhGMzEvcXU4MzBVUHlK?=
 =?utf-8?B?S3JuekNtckZ2cnhIak5aQUZ0ZjV3aWlaRTE2SnpkMTBnL2UzTjg5RjRjMll1?=
 =?utf-8?B?Q2tGU29FS0dRODZ2Nmlack95c295QUovNVU3TGU1UTAyK3ZUTFczYXRHaCtn?=
 =?utf-8?B?SFM5RU1jbHlWNUsyeDZLeEdyVXY4VXdESWlNaTZMRmRQWmd2VDFHdVM4NnFQ?=
 =?utf-8?Q?xEZM5YIbrmxvAn3A=3D?=
X-Exchange-RoutingPolicyChecked: LQau58d7Ecdkc58AVHKpwbfv4TKElxPh21dX58Ge2uIvOGN+H17zMkWyVSTHnrbjv3N2unyd8L0LShOpIH+I3zrQdtKmQT7hobfQaCnb0OANBocFgqzG89sx1gPQ1UdMXS4zwmDe+UEC87gl2mgBsY2PyTf1/QXcqo/vo3VYRUtzqmlyqeGydRfxKh66wFbNfcEwaw94ag+mL7RxHBPWwL7SLmzSJOgZMlzogZFhncUeowzOgh0siFMvJsBl8IE3QH+AW7ynRNbPELTl9whVmbLMmomIAasofa+vhY8DHADS0Ejt4jr6owNMHsAFkLDyH05Ks/yAP9nsZwXOxksqRw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ab22a85-599f-4ba3-f5ad-08dee1f186a5
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 21:47:39.7794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u1/xRPnxO2LHi/mVWyn697nJTQ1ggZEwCOTutiZZP9Pt3qRsnd1OxUVwxJC+J3XUA69XiYkJFDqV0rEDnoV3wviN0rILIU4kk/Pu+lS5iKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4607
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



On 7/14/2026 1:58 PM, Lin, Shuicheng wrote:
> On Mon, Jul 13, 2026 3:18 PM Daniele Ceraolo Spurio wrote:
>> Starting on LNL the WOPCM size is 8MB instead of 4, so we need to avoid
>> using the [0, 8MB) range of the GGTT as that can be unaccessible from the
>> microcontrollers.
>>
>> Note that the proper long-term fix here is to read the WOPCM size from the
>> HW, but that is a more serious rework that would be difficult to backport, so
>> we can do that as a follow-up.
>>
>> Fixes: 9c57bc08652a ("drm/xe/lnl: Drop force_probe requirement")
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> ---
>> I am planning to follow with the proper rework, but I'm still trying to figure out
>> some complexities that come in with multi-tile, so I'm sending this on its own
>> in the meantime to fix the bug.
>> ---
>>   drivers/gpu/drm/xe/xe_wopcm.c | 15 ++++++++++-----
>>   1 file changed, 10 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_wopcm.c
>> b/drivers/gpu/drm/xe/xe_wopcm.c index 900daf1d1b1b..fe65ed246775
>> 100644
>> --- a/drivers/gpu/drm/xe/xe_wopcm.c
>> +++ b/drivers/gpu/drm/xe/xe_wopcm.c
>> @@ -49,9 +49,9 @@
>>    */
>>
>>   /* Default WOPCM size is 2MB from Gen11, 1MB on previous platforms */
>> -/* FIXME: Larger size require for 2 tile PVC, do a proper probe sooner or later
>> */
>> +/* FIXME: Larger size require for some platforms, do a proper probe
>> +sooner or later */
>>   #define DGFX_WOPCM_SIZE			SZ_4M
>> -/* FIXME: Larger size require for MTL, do a proper probe sooner or later */
>> +#define LNL_WOPCM_SIZE			SZ_8M
>>   #define MTL_WOPCM_SIZE			SZ_4M
>>   #define WOPCM_SIZE			SZ_2M
>>
>> @@ -179,9 +179,14 @@ static int __wopcm_init_regs(struct xe_device *xe,
>> struct xe_gt *gt,
>>
>>   u32 xe_wopcm_size(struct xe_device *xe)  {
>> -	return IS_DGFX(xe) ? DGFX_WOPCM_SIZE :
>> -		xe->info.platform == XE_METEORLAKE ? MTL_WOPCM_SIZE :
>> -		WOPCM_SIZE;
>> +	if (xe->info.platform >= XE_LUNARLAKE)
>> +		return LNL_WOPCM_SIZE;
>> +	else if (IS_DGFX(xe))
>> +		return DGFX_WOPCM_SIZE;
> With this order, BMG is changed to 8MB also.
> I checked BMG's hw register wopcm size, and it does with 8MB wopcm size.
> So, the LNL+ apply to both integrated and discrete gfx, is it right?

Yes, 8MB WOPCM is for both integrated and discrete starting from LNL. 
NVL-P further moves the size to 16MB, but I'm going to handle that by 
moving to a HW read instead of changing the size here, so I'm limiting 
this fix to released platforms.

Daniele

> Thanks.
>
> Shuicheng
>
>> +	else if (xe->info.platform == XE_METEORLAKE)
>> +		return MTL_WOPCM_SIZE;
>> +	else
>> +		return WOPCM_SIZE;
>>   }
>>
>>   static u32 max_wopcm_size(struct xe_device *xe)
>> --
>> 2.43.0

