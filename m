Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B3DC88E77
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 13:24:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1EF410EAD1;
	Wed, 16 Sep 2026 13:24:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VeA+/Z6I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B03310E0FA;
 Wed, 16 Sep 2026 13:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789565042; x=1821101042;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hWpUxOZ0COhToWj68UBvADqDSGIL6OcgfRd0byxN1ng=;
 b=VeA+/Z6I47if+YFFt1u6nWfKWdP6gOppJmQ/Yts86zDRzDm1JjDWPkhz
 G4jsA4rf+tXVHS3ow5k0ANjquPBxz67TQIV6YPhnb9qOonpTHPFHQo037
 9hzdMEghslu3TU29skqJw7su22OGvzZUsoc3CIzFBgF9N11g5RWvyY6L7
 iP+chm18R93Vn6uVSx9NkI2grTJ/kLwzzU5Caa42ExzEOR4b6eMiQbFzK
 9hO3Ls5hc/2JStqNBAZrBPNSZpCDZBlhpnM1WJ+aJv+TDU4GlrAj/a2gD
 X9lLaKNvDfw25VAI7jhXqlcPkgafGQYhBDU8PnjDpfY4YFor8TUNoODK9 w==;
X-CSE-ConnectionGUID: +giHCuYhTFm6CXO6Edavgw==
X-CSE-MsgGUID: Lp7wzQaeTgOjHx471TMIwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="88877612"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="88877612"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 06:24:02 -0700
X-CSE-ConnectionGUID: Qm7Ez7gLSdunst0FwNp3lA==
X-CSE-MsgGUID: mm4z5JdpQ+yyOapsbTuuZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="271559238"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 06:24:01 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 06:24:01 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 06:24:01 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.16) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 06:24:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KM7UUmuFWI0FNkj4LavZLUcOIMT1+5qMlVeQ2UOGcHLMMocJajebR+wj6pjwkWvgNCFJdWb3XW7FszQadWi8JVuz0TzXnUP3TAUzYT4RUdmlSBhpcr7BMug3Knvi955zLQpaPLNNRqDKSFYHRzerEtdhuDaNnrFgsQUKBGZAVw2UF0lSVGZIXYZcN3jHIaVmPvey3lSm58n2R6HSEf/FH/NQWOcIQ73itqYDNs0f7fGZITBzFzsYri4ja0k+MZ4ojnzZYj+NMQ3xHgvAItz1ghSt0BlPH3PWFdkmcby8QFvp4FAvEtHNmR2Pnh5zCS/wtEUsQDj68HTHxynNrcu+EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bNie3dp+jaRyLcVmmQSp8VHmcIcaWcVDmAqXMkw4sNM=;
 b=ArqKdJOBNICrCzkNqwPiOcR8jDcbRz2DbvApG9wZ6EVE5zbq4z/vrB9swCZQDguDyLnK/WqO/1k3cFV8dXYGpoz6MVVF22UzuWJ+y9HwDg9Ym61cODdaAL5Q3PfaUDQOoVYOtwxqpclnCR3ZCRU1UY/P+yTOvXZvqayW/ywf9IYHEWlPoE/cumnjHMiIQAqsaMUrCl+CcqF6PT6i01sjlwZtgUgiWxY+4sOQ+jfGqVEpbqi0aW7NUj97NsKlyurvdF/sdkMGC+7AB6lLKtNltZzm3a+6z184a1VSsWxeEJfs/eUu2oVbXGGdQXXvWAWdy9mcdPcYgEJ+fi0bCBUmmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by SA3PR11MB7534.namprd11.prod.outlook.com (2603:10b6:806:305::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 13:23:58 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 13:23:58 +0000
Message-ID: <775f1018-7f32-4319-a30d-c72b0c4809c2@intel.com>
Date: Wed, 16 Sep 2026 18:53:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/13] drm/i915: Extract commit_dsb_max_cmds()
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>
References: <20260909161730.12969-1-ville.syrjala@linux.intel.com>
 <20260909161730.12969-10-ville.syrjala@linux.intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260909161730.12969-10-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0131.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::19) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|SA3PR11MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ec6a9a2-50bb-4d86-0ce1-08df13f5c3bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|3023799007|4143699003|56012099006|11063799006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: JskNqe6NrCKmAXpvG25g/gs0Vupn1mvjVKChei9MhH4LldNIyo231+4mHD/sMFNBggRMCJA8Ig9rDch60SSoSsTEslf21QVjphC0/Z1+LDvpZGegWc53ZHBPn5HmZYDrNxzwijnEQ2xGSgg1h2qhkhock+ji0x6smxi83z5lWCNmlkXkoO48nzyVKulYvzNRyOrar+ZM8nMJhqh69DOhXAMrTIT7jf7TTuNgwBRg+wYtlCcJuWW0a3vSA7nECgBKbPPcWIoXlLpPewL5oA6BWVjwMrL4p7th7XOlvx9heEmZBj8QEzNT4vLxw6VC6cUER2UsCY1olSuFiwj0kRBM/YVLwVRE3wFUuBvqgAnK4eLQ1nIMCbfKE3tD5cv5kjgzRgnTgybhhMijnij4wElkGp2iKZIC9qskePFx3Of1szYARJksSOgkv54xe3b8DUFSBRNk+kQJxWmQR0uuYABO+GcmiwI3HVfgBPa8Jyg01xSaZmQwrWzmN4S3GbZ4yXbFbK30tvUg8jUvKBR9uXD91QUWGIhLU6/L89XRr7+0R0XyL/yOjMb7Kvlxwn1tVxdP/Gh6Q2NuyQ6cMfBWXuz6yEbDdB0aLcjx8NiLDn6bA0DCs1Ibo/8qA13qIUkyBS6nxxNfjqQaimWeHBMdRrDB3DqWk9wZd1gQHFgR6anHlvo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(3023799007)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHBleitNQWhyeC9xTHhhaVpnZDExSDltZHU0ZVk4bGovRWdaYWJORllGcTE4?=
 =?utf-8?B?eEF2RzBHejlmekQranRkazRRdittZ0kyVWdXRDVERDA5M1dqT211VFErSHdW?=
 =?utf-8?B?M2JiR2lCUTUwQWxDTW9VaGxWVG1XWEY2WXQ3bUtBZ3RadndscXJWL24xOHN1?=
 =?utf-8?B?VG5udk9tVm9Zc2hla1JkK0k4bmRGTHNjUlUxem1McWtIeVUxUE5ZdnVDRWJh?=
 =?utf-8?B?a0h1SzA1MElsU3p2UEtWdFFEZVBlYjNBTlRsL0hTM1ZHSEtaZnhkYWQ0NmNs?=
 =?utf-8?B?MHAyM09ZQjJZcjAwK3UyV1dCWW9JYWVleDM5R1RadzRRV1pQTVUyVjBJK3NL?=
 =?utf-8?B?UjhDU1VNbGcyV3E4NHNuTy9VbStKcFBzRFJWVmlnaVZxL2VJanlEYmZ5TTRr?=
 =?utf-8?B?ZFVucU4rS3NLZ3NLelMza0pvVnhIYi9YUTFUUVB5a0NaMk9YRFkrSEkxQlFH?=
 =?utf-8?B?RWU1MDJhdThyMXlRKzdvUHdzb1ZWNzJmZ09NdnJBaTNUbEhEYi8ySm5WOWVv?=
 =?utf-8?B?dVhROVhUQVFvS01xUmU0cDFzRXJ2WldJUWw1SDROQ2pHb2JSL3hxeXNpS2N5?=
 =?utf-8?B?UENIdThyK3ZHYTVQcEZ3bXcvU3l4NHI3MEdPcVBjZHlkWGVYM3NLUGFHSjNr?=
 =?utf-8?B?YzVjN2RJdlRwMU1FTmdtZGdnakF6cmVubHU5ZHQ5M2dxYjRlbVFNc1NuRlBO?=
 =?utf-8?B?am8zcFkrYnFwN0xCTXltR0hyOE13S1ZyZzFCOGtmeHNxSlZPcUcxM29LYld4?=
 =?utf-8?B?R1V0em1VYW5WVmgzczRkSHhYYS80Z2dBVlNwakNCR3RObnlkY0xocWpOOWhH?=
 =?utf-8?B?U0RCbXUvVlRsS0FDbVl3Ti9rcFYzMXBGaTcxSUVncHpoalNuYktmSnJMTFRo?=
 =?utf-8?B?SndXYkhPT3FqUGpVRU4vZkwrRFlVMHlISzNwS0svZENiYXNUTmdvODFkaGN4?=
 =?utf-8?B?UjFJVnJXRFFjdFRPc2E2ZkNHUDluL2J1bFJWRlhKTHRpeTVHVGFFdERDZ1dR?=
 =?utf-8?B?RlR2M3p5WEZNL0ZvNWUvd3kwby81ZE90MjVydUdEaHF0TVMxZkE1aXAxeFEx?=
 =?utf-8?B?c2paSm44aVhXcGlPUVNuRzBrQ3JMWTlRRW8wT2djbXF0dDA4TjNyZDhWVnFZ?=
 =?utf-8?B?QXE3cTV6OUJmdlNyZ1FCVnAvMUplWWFzMmNyK0lmY0Z1L0JwUy9nQTRTakZ5?=
 =?utf-8?B?WWJxcEFoODl4LzRtUTRxRVpucURocVBKM3JOV0xHSjhjRDNhS1BvNEE4WFpW?=
 =?utf-8?B?OEpZeGR2QmJGS2tMMFNXdjVhSkNBZnpkb3JhWkpNQytZSE8ySitlREJQVk1Z?=
 =?utf-8?B?SzljUjhOd3JHWWRFVmZlai9VQ2lEcWlNcG42SE1iVFNTYlFTT2VkYUVnWWdM?=
 =?utf-8?B?eGVNWERFTWdNYThUWWtkbnRhRDJzb3g4RVJnQ3B4T1dHQmtMbzlmd2I4bWR4?=
 =?utf-8?B?V1NCaUMvcUNWY29XVGtpMjQ0R0F4U0VFUzNCZy9YMmc2Y2k5UFllblJRd2s1?=
 =?utf-8?B?UlJMS211YVk5cmhtQUovUGJCUW45YWF0TVlHazZ6RHRKa3JVYnlmRkMva1lo?=
 =?utf-8?B?N3NGUkw0OGFUeElkdzdJMk5oNVFPWkZmYnZGRUJtYmxRdlNGSUEvZytSZURE?=
 =?utf-8?B?eC9KMml1VHg2VXVFMmtGcmpLdWE2eTB0VmRINmdZaEIwUUJwRFRWbkFpZW81?=
 =?utf-8?B?TmhEcVJEMHlvSlhBZzNPMEYxV2hLNzBXRTVyZlJsYXh5OU5DdkYzYmRFejZ5?=
 =?utf-8?B?d0dMeFBPam1iYzl0SFJXbHptV0JMK1RsWWxiQnNFNGoweDgxN1FrbCtPckhY?=
 =?utf-8?B?K2VpTVVsK2MwOGNvczZXbzJkYlpncW43QUZUNXJKYXdQMDJnOHY0ckFaYkhv?=
 =?utf-8?B?RTNNaU9pMEVXbjRmM3J2ZFNXUmtENjA0Ty9qdXVCcXV4VXhjYStRYkoyUFlN?=
 =?utf-8?B?VXIxSkM1N3E4a1UvU1hvWm9NQzk0ZGVsOEVZdDBsaVhOTnN3NDVnYlVsSkEr?=
 =?utf-8?B?Yk8yRloxMHBRVHJsTmNBR2dWVTNEekhRQXUxS05OL2M0ZkZtRjFtRmhvQWYy?=
 =?utf-8?B?c1Z3VmhydUN6MDNIa3lQZG5aSU1kWFJwWkhOdndZUXArWGpVRCtpaTkySVZK?=
 =?utf-8?B?ZFZpNTFVdFdETEcvTllEeDZQakU2aEVaeEJ6Y2hwZlBHVTkwSWRuWlZkdlh3?=
 =?utf-8?B?cTVPdENxN001blU1TjZtaHZhRlgwbHY1U1Q2a1h1VjVJUDhtV2k0UUFpdVB2?=
 =?utf-8?B?UmEveURVb2hESHFVT1pUVlR1RFZPTVRKT0MxeDJ0aWVCSmRHY0VBYTd2WFpX?=
 =?utf-8?B?NVd5alZSVWVYR3QyK3VSQjdqZVhid0g3R1ZKc3N2MzZ4anllQXNMZ1VZSG1K?=
 =?utf-8?Q?3JoKaFtDT2+4hrf8=3D?=
X-Exchange-RoutingPolicyChecked: easGH0qcJvYjBOpE1CS0vL4MsqcPWGe7q4Ypr+RieC97U+wIvS8CuWxZu6784N3e0mds4+P28mjh+FoGnnVEX1FNuR0F51dUdeSs3yZcXoYja+yLSOZVzvRsbQSeX5RJGlksddOHwWXhwva20XPjwrrlVFvAjTtEqCUEtCdIpmzhEXPTl4c7DfTgkYy+WbtL/gdqwSxyBa7TOVvHZu1SWQYwfwCwiZ2CbcpN/K+vdMVyYbDiJQPLvoV0Fww8zA9vBnhu898Q/46cTqWZcQC1WKG6+NUsZr4xQn8jGw3sq+mDcAwYsO2hrXRa+iztzC211HLhBhEuUfu7FzdSYRSP8A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ec6a9a2-50bb-4d86-0ce1-08df13f5c3bf
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 13:23:58.4513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8s1kbSDftrRrHYU1KOcyG0OhnMMvWY3Zhd9vWtTJQ5A99+vSqZypZP2QPe2ZWB4kRNEsstZJ1c1+oKErQNF80OdlK24kzBRAAQ9rlUQ+3z4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7534
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
> The code to determine the number of required DSB commands for
> the commit is now split into two parts in a messy way, and the
> comment explaining the numbers is completely ditached from the
> place that actually has those numbers. Consolidtate it all into
> a single function that makes sense.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_display.c | 31 +++++++++++++-------
>   1 file changed, 21 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 7741f1395375..d7bd1b862aa9 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -7402,29 +7402,40 @@ static void intel_atomic_dsb_prepare(struct intel_atomic_state *state,
>   	intel_color_prepare_commit(state, crtc);
>   }
>   
> +static unsigned int
> +commit_dsb_max_cmds(const struct intel_crtc_state *crtc_state)
> +{
> +	/* just enough to start the chained DSB */

nit: more accurate to call it color DSB, since this can be true for 
gosub too.

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> +	if (!crtc_state->use_dsb && !crtc_state->use_flipq)
> +		return 16;
> +
> +	/*
> +	 * Rough estimate:
> +	 * ~64 registers per each plane * 8 planes = 512
> +	 * Double that for pipe stuff and other overhead.
> +	 * ~4913 registers for 3DLUT
> +	 * ~200 color registers * 3 HDR planes
> +	 */
> +	if (crtc_state->plane_color_changed)
> +		return 8192;
> +	else
> +		return 1024;
> +}
> +
>   static void intel_atomic_dsb_finish(struct intel_atomic_state *state,
>   				    struct intel_crtc *crtc)
>   {
>   	struct intel_display *display = to_intel_display(state);
>   	struct intel_crtc_state *new_crtc_state =
>   		intel_atomic_get_new_crtc_state(state, crtc);
> -	unsigned int size = new_crtc_state->plane_color_changed ? 8192 : 1024;
>   
>   	if (!new_crtc_state->use_flipq &&
>   	    !new_crtc_state->use_dsb &&
>   	    !new_crtc_state->dsb_color)
>   		return;
>   
> -	/*
> -	 * Rough estimate:
> -	 * ~64 registers per each plane * 8 planes = 512
> -	 * Double that for pipe stuff and other overhead.
> -	 * ~4913 registers for 3DLUT
> -	 * ~200 color registers * 3 HDR planes
> -	 */
>   	new_crtc_state->dsb_commit = intel_dsb_prepare(state, crtc, INTEL_DSB_0,
> -						       new_crtc_state->use_dsb ||
> -						       new_crtc_state->use_flipq ? size : 16);
> +						       commit_dsb_max_cmds(new_crtc_state));
>   	if (!new_crtc_state->dsb_commit) {
>   		new_crtc_state->use_flipq = false;
>   		new_crtc_state->use_dsb = false;

