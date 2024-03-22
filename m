Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83271C54E71
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 07:03:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C3810E3A3;
	Fri, 22 Mar 2024 07:03:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K+jo8Lsn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF8810E3A3
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 07:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711091003; x=1742627003;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XtKIcj3/lq12lg0sp2ovatFneXQm/g02SEmProuowKY=;
 b=K+jo8Lsn1jYgpuuw06jjqrmWyi4+n5J+PFFO73purLOhtyWasstCJBjt
 FTUiaoZwPiRITtsWGDO1dmhYw8oJFXETGJ2rHiGMWFPQeFCy1B73dpmk1
 MHFuBQskxsipg2mH2IBGG2F73MDUHAS+nqJXu03cklVRo8NpnI1j7HSVW
 fBMCVHdpg5jyb95MqV1p9mGEqSoniIiw/jhB1FZ5owhbLehVUtVq+i9ld
 upjGltk4ShFB059aknsMbq2X4nn8tYX7w8JaKnXvXPX8C83HstWw3/gkN
 BjWFJfdFAGiFVnEy1/oysohFRyXGbwXIA2khPql1HvW0qkqal9qOIuATJ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="5989317"
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; 
   d="scan'208";a="5989317"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 00:03:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; d="scan'208";a="52227855"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2024 00:03:22 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 00:03:21 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 00:03:21 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 00:03:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AU+IQN1cR39ZmwnExJqaGqRQ5/E93hezspNi4Fa1Js4xN5zVsaeNafD7Uo2AeRLtvXQr4Rgx2lKI2WmOjo1DQCwrIYtkNLxGhWs5BgyfKBX8RPicOq9bzWYbpfpB7l4WM7eyIXjKZH/ilaWpaEPhJWM9YAcPHPWkXDwtiOxHyDrhIS5LKHyZAE3L9fuayw/Y4N4zxSItTlbxpB8CYjdrABoFjMGTEevORSmQp8EpTo0x2lX9CnF5mQ/OyZepkUib7CwD1t3lBIedDp+HN9qEbW8K8k8A2cJNJhfCld7xbzqd3s5UHK1xTTUZ/5+b2UgcQYd1LiQBWutz9Oc4JrLXqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KYpmDMZQ4coeeYIZM9YE6F5JykXr8ESE0jkGqVZ41H8=;
 b=V2ZG7nwAZu7k52EJpyZOQjbP0CeaZT4FVI3Sa2GPdd2lJtnCYqHFfpasf7Eaz4wPpu+oLLZpC6nHxYZgiBBGH+cCe3PIlEzJL2bxd9nj+MDkpD2NP7liXHPPhwADlvmUVPqjRzv5NngYeiPC2KJbGZQdXu050DZH3FwhEh3zw54r5u5ud+mNpPJWSvVl4XMtkEPMXRs+m4nNbUdzVejdSGNcoJm/NBvwffJhvodOy8m+TUhSiq9KvXzbZRygF1QsiW6xYjORMB/f7fv4/bvqZlX0+lT3CE32f3Unh4KFVyzgSRLBSFBDEotOAr/SzELy9obB+PhPRI8/OJLJuvAHgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CYYPR11MB8308.namprd11.prod.outlook.com (2603:10b6:930:b9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 22 Mar
 2024 07:03:19 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::eb80:5333:fa3e:cb6c]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::eb80:5333:fa3e:cb6c%4]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 07:03:19 +0000
Message-ID: <a604bd75-bf2b-4c7e-94d8-15db5ad3f32e@intel.com>
Date: Fri, 22 Mar 2024 12:33:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/hwmon: Add infra to support card power and energy
 attributes
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <--cc=rodrigo.vivi@intel.com>,
 <ashutosh.dixit@intel.com>
References: <20240322042746.2357531-1-karthik.poosa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240322042746.2357531-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXPR01CA0079.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::19) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CYYPR11MB8308:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e4c39b9-07ea-4ea8-97e1-08dc4a3e2742
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dGF22+jKwrMPrLCkRhaWzYCHdTJSmgceYRUJbfcNEzLT2O483G9g/5AOXFipmfdE2NmYl6jz//0MCVITqJfWARswYNViYKN6vUkLqf2I46I0d2dGwet9s6PbqBTfiuFVQNcl1uiXtpSNGoHUNsrQVjeUYMoslivO3Piwpz4VHCAoqXDLETeJ+DgOfCidv6IkDBlWP43MOVsW/Xf6n+xxmX0gW8/puboLLFss4l4cyhddkx4kEeaFtWCCENPv87QUdcKARIPs44pqa9JijQXBvIBY2lbJfsL3srJRAR7TG62RT9o9Ifld8R+VPSEHCzXQxbesIcYxhua9oNb0OIMwpspYuF4ozs5z5y598DtfmRvZOy8V1aGnEYUHEKTCq2zs0+AMJ3F7UQGJO7XD+7pH5M4qztin16MvT9OBVyzFu0JkAW7no4rlp2hVWUZ7FGndxYwc/lk/pY8METRpZvtDN6/vqtIjoo/4qoOexRThYiA1dVEDJgMR8UAyP/PbNfezDLMP0wu59zF19IyTZuJWYaSqfoizvzyTzt92XQkidQy6vg2J0EkKmmluAvwKz6++SvGChe/hznpXf3YHYaVyzVW2G9mF5xVmONEQjHCr5McSuAF0ybuSA7WFSH+giazKlvbFo9YbgfDcq1KB9cePdixAyWa5e6J8ek+WJQv28yc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZENiQnNyTTlzV1daOG9vR3VtQzAxaGYxS3crZHQ1TmRQMnVNWjFCWWt1RDVC?=
 =?utf-8?B?Y1NMTmZqQktXQTU5VFFtcmZLb3JtSFVvcXJZZk55SU9OREptdkZ2NmpvU3g2?=
 =?utf-8?B?VnVkSjJzcEFqY1RQdXpzQnNBVWludXBvMUh0MzVuYUI4Mlc0NElqSVRESEFq?=
 =?utf-8?B?ampUa3N1Yk9MdXpodnVrSy91V2grWmFUdHVOVGJtRW5CazNVR0k0US9MMER5?=
 =?utf-8?B?ZEFuSTMyQkUyZVE1NjJoa1VKek85VEN5UWEyamwrU1dmOVhiV2N6SndGZjVh?=
 =?utf-8?B?ODdsL2RRSjdPSkpmNFhVNDRrSkNxYStGTGIzTmZ5SzMxQzNxUEJLWmhhZHVv?=
 =?utf-8?B?OHo5N3hReHpWU1ljOFJ1bElkcjJ2Smg0dGg5K1VQTTYvR0xKa2dnL3F4L1Q4?=
 =?utf-8?B?WkpIK050RzJPY210dDlodDBPZElFL0EvZXg4SjdiR3Bpa2wyNjN6cExJYmkr?=
 =?utf-8?B?ZWJtc213Tlk3MUJvUTNaN0NjNXB2MVlLMjRicTFPS21sMmxHMHdaOFFCTEZ6?=
 =?utf-8?B?MEVtcE1DQTA2WFN5aTU1TVNBQ2pVbldMTW5Ja1V6SzN2YkVTOUZYMjBTL0Rr?=
 =?utf-8?B?eW5wejMwR2kwWTk1Umd0anVYZVhjN240ekhxLzg2U1B0dVI0bWdVSk80SHZv?=
 =?utf-8?B?ekxaY1ZFcHI2N3MwWjVkeG5mVE9WaVByRnNHcG5LR1FmeExrS1R5eEdMdTls?=
 =?utf-8?B?aHhhbVJSZDEzWDE4WVp6cU1FTWQ1bUxXK3FZRW5QRTFHcUU2VjBheEx1YW84?=
 =?utf-8?B?Tk5zT0FMbGhoMnZyZmlUb2M5b2J6bzF5SkM3QzVJOHpqcE1XZ2tYL3A5NTIx?=
 =?utf-8?B?Sm1ORVI5WE5DM3BQdVRqMGFwOGNtTDZlRENoVEZ0WDZGZWF2U0hnMW03em5Y?=
 =?utf-8?B?RUp0SW5ZeElGRzZCakVseVcxdXVlbTQrWVl3SmE2dG9BQ0ZUb1pRLzZNdzF0?=
 =?utf-8?B?cFh0d3VPbExyeTFGZUkxaGZzaVFzQURyZ3FCUlZna2hVU0J1b1l6SmxnY1RO?=
 =?utf-8?B?TkVZREYyaFBWMXRoQTFPRVBuYUYvMHFic2orZHN1MlhIVTRONzUrY0xxTTRz?=
 =?utf-8?B?d2x4bi84b25JM2J2dCtUS3RGbzd6SE01cU13R3FDdVR2TGhnS2JGUkFJVmts?=
 =?utf-8?B?OTd6SjM3Q3I4UmdzMHIzYm5FcTdzMUgxNVBDUlF4Z3VjbEJUZVlrZU9YTlIw?=
 =?utf-8?B?OUhWc1lGNkNuY0d4MHB4cEk0S1dFVW04ekJhM2VteWxveDB0TGd3dVBUTjVl?=
 =?utf-8?B?dG4rWEhGZG5kKzZuNzBDMzdIRTY1UG8vc1F4ODgrRnMyWGpsaEtxN05xSHRz?=
 =?utf-8?B?L1dhWTJ4RXViUXB1endTek9zSzJYNGdvemo1cjJOTDVPU1N0bUdEYVJjdTZD?=
 =?utf-8?B?TUo1MHNpb3FqK3g4WUVyRHp4RklaTnFVWjAxckZra2kxKzVPYit0eE81QmJu?=
 =?utf-8?B?VTZtMFpOZEU3eWtyVWtuNEx3MUZ1MkgyWUU3WFJsSHNzSGpidnNScDJCcVR5?=
 =?utf-8?B?SkdDdi84VGRVVFBsN2paMXVsZTFkTWtmNUNYNVZ4c09NMFZZTUU3MW42QnBo?=
 =?utf-8?B?T0dkQ3F6Mm5KMkRoNm0rK2F2bHdzRFZSSE5rODlpSStHQlFnRW8rdmpBUkVu?=
 =?utf-8?B?NTVyWWVEd1J0Q2JHR3poU21iVEwyQm1ybXdTWXpnT0E5SjFIejJqNC9HT3Zv?=
 =?utf-8?B?ZzFlZ0lTWUxNdWJBcHFuQXpKYSt5N21NR1hmd09FKzNtOUtEaUovMSt5eTBN?=
 =?utf-8?B?YkUyMU4xOFpsZ0N4ckY2aUdmVm40RzRya1dUSVFWRnNxZzRsZENjNTdSc1M5?=
 =?utf-8?B?ZHp6VURicTRzN1lVblljNS9DM3F3WVhURE9Gdm5EQ01SNTBoNndxMkhHQXVv?=
 =?utf-8?B?dE0veUNQcWo4NnBvQmI5UUlxZU5nZFlkVHdGK1hDTytqWklUUVYwR0lBYkgx?=
 =?utf-8?B?ZnJHVlJhMDFKODlzTHZzYzFQUk5nR21zLzNyQXUrc0hoSzY2ZnBObjhMT0pt?=
 =?utf-8?B?TzFxTDlQY3JBVnlQSjRlbGgydUM1RnVzV3RJbFMwSS8yRjdObUtaNDJFSXRL?=
 =?utf-8?B?Yk1JREFNcXlTS080SGxXR2NYajdrb05kMlZ2cnphRmFJU09Ka2VWaDdSN0lB?=
 =?utf-8?B?SHVnZ0VzbW84MGxTVWFsLzhNTkN6TUFNc1R5N29JelBkSk9sVUdubXlDVi8x?=
 =?utf-8?B?MUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e4c39b9-07ea-4ea8-97e1-08dc4a3e2742
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 07:03:18.9877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uf3HPjy7idEHEWr0TWowoiOR6RanRKGD5WFgcFRMJq623JANful7IAP3cgeA6i+jV6strJfdqQ/hJxSgoaqcww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8308
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



On 22-03-2024 09:57, Karthik Poosa wrote:
> Add infra to support card power and energy attributes through channel 0.
> Package attributes will be now exposed through channel 1 rather than
> channel 0 as shown below.
> 
> Channel 0 i.e power1/engery1_xxx used for card and
> channel 1 i.e power2/energy2_xxx used for package power,energy attributes.
> 
> This would be needed for future platforms where they might be
> separate registers for package and card power and energy.
> 
> Each discrete GPU supported by xe driver, would have a directory in
> /sys/class/hwmon/ with multiple channels under it.
> Each channel would have attributes for power, energy etc.
> 
> Ex: /sys/class/hwmon/hwmon2/power1_max
>                             /power1_label
>                             /energy1_input
>                             /energy1_label
> 
> Attributes will have a label to get more description of it.
> Labelling is as below.
> 		power1_label/energy1_label - "card",
> 		power2_label/energy2_label - "pkg".
> 
> power1/curr1_crit and in0_input moved to channel 1, i.e power2/curr2_crit
> and in1_input as there available for package only.
> 
> v2: Updated intel-xe-hwmon documentation as per above changes.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  83 +++++--
>   drivers/gpu/drm/xe/xe_hwmon.c                 | 213 +++++++++++-------
>   2 files changed, 192 insertions(+), 104 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index 023fd82de3f7..768e03e22aae 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -20,49 +20,88 @@ Description:	RO. Card default power limit (default TDP setting).
>   
>   		Only supported for particular Intel xe graphics platforms.
>   
> -What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_crit
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/in0_input
Should this be in1_?
> +Date:		September 2023
> +KernelVersion:	6.5
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. Current Voltage in millivolt.
> +
> +		Only supported for particular Intel xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/energy1_input
>   Date:		September 2023
>   KernelVersion:	6.5
>   Contact:	intel-xe@lists.freedesktop.org
> -Description:	RW. Card reactive critical (I1) power limit in microwatts.
> +Description:	RO. Energy input of device in microjoules.
>   
> -		Card reactive critical (I1) power limit in microwatts is exposed
> +		Only supported for particular Intel xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_max_interval
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RW. Sustained power limit interval (Tau in PL1/Tau) in
> +		milliseconds over which sustained power is averaged.
> +
> +		Only supported for particular Intel xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power2_max
> +Date:		February 2024
> +KernelVersion:	6.8
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RW. Package reactive sustained  (PL1) power limit in microwatts.
> +
> +		The power controller will throttle the operating frequency
> +		if the power averaged over a window (typically seconds)
> +		exceeds this limit. A read value of 0 means that the PL1
> +		power limit is disabled, writing 0 disables the
> +		limit. Writing values > 0 and <= TDP will enable the power limit.
> +
> +		Only supported for particular Intel xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power2_rated_max
> +Date:		February 2024
> +KernelVersion:	6.8
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. Package default power limit (default TDP setting).
> +
> +		Only supported for particular Intel xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power2_crit
> +Date:		February 2024
> +KernelVersion:	6.8
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RW. Package reactive critical (I1) power limit in microwatts.
> +
> +		Package reactive critical (I1) power limit in microwatts is exposed
>   		for client products. The power controller will throttle the
>   		operating frequency if the power averaged over a window exceeds
>   		this limit.
>   
>   		Only supported for particular Intel xe graphics platforms.
>   
> -What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/curr1_crit
> -Date:		September 2023
> -KernelVersion:	6.5
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/curr2_crit
> +Date:		February 2024
> +KernelVersion:	6.8
>   Contact:	intel-xe@lists.freedesktop.org
> -Description:	RW. Card reactive critical (I1) power limit in milliamperes.
> +Description:	RW. Package reactive critical (I1) power limit in milliamperes.
>   
> -		Card reactive critical (I1) power limit in milliamperes is
> +		Package reactive critical (I1) power limit in milliamperes is
>   		exposed for server products. The power controller will throttle
>   		the operating frequency if the power averaged over a window
>   		exceeds this limit.
>   
> -What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/in0_input
> -Date:		September 2023
> -KernelVersion:	6.5
> -Contact:	intel-xe@lists.freedesktop.org
> -Description:	RO. Current Voltage in millivolt.
> -
> -		Only supported for particular Intel xe graphics platforms.
> -
> -What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/energy1_input
> -Date:		September 2023
> -KernelVersion:	6.5
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/energy2_input
> +Date:		February 2024
> +KernelVersion:	6.8
>   Contact:	intel-xe@lists.freedesktop.org
>   Description:	RO. Energy input of device in microjoules.
>   
>   		Only supported for particular Intel xe graphics platforms.
>   
> -What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_max_interval
> -Date:		October 2023
> -KernelVersion:	6.6
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power2_max_interval
> +Date:		February 2024
> +KernelVersion:	6.8
>   Contact:	intel-xe@lists.freedesktop.org
>   Description:	RW. Sustained power limit interval (Tau in PL1/Tau) in
>   		milliseconds over which sustained power is averaged.
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index a256af8c2012..cc1fbffa1d1c 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -34,6 +34,12 @@ enum xe_hwmon_reg_operation {
>   	REG_READ64,
>   };
>   
> +enum xe_hwmon_channel {
> +	CHANNEL_PLATFORM,
> +	CHANNEL_PKG,
> +	CHANNEL_MAX,
> +};
> +
>   /*
>    * SF_* - scale factors for particular quantities according to hwmon spec.
>    */
> @@ -69,26 +75,26 @@ struct xe_hwmon {
>   	int scl_shift_energy;
>   	/** @scl_shift_time: pkg time unit */
>   	int scl_shift_time;
> -	/** @ei: Energy info for energy1_input */
> -	struct xe_hwmon_energy_info ei;
> +	/** @ei: Energy info for energyN_input */
> +	struct xe_hwmon_energy_info ei[CHANNEL_MAX];
>   };
>   
> -static u32 xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg)
> +static u32 xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg, int channel)
>   {
>   	struct xe_device *xe = gt_to_xe(hwmon->gt);
>   	struct xe_reg reg = XE_REG(0);
>   
>   	switch (hwmon_reg) {
>   	case REG_PKG_RAPL_LIMIT:
> -		if (xe->info.platform == XE_PVC)
> +		if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
>   			reg = PVC_GT0_PACKAGE_RAPL_LIMIT;
> -		else if (xe->info.platform == XE_DG2)
> +		else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG))
>   			reg = PCU_CR_PACKAGE_RAPL_LIMIT;
>   		break;
>   	case REG_PKG_POWER_SKU:
> -		if (xe->info.platform == XE_PVC)
> +		if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
>   			reg = PVC_GT0_PACKAGE_POWER_SKU;
> -		else if (xe->info.platform == XE_DG2)
> +		else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG))
>   			reg = PCU_CR_PACKAGE_POWER_SKU;
>   		break;
>   	case REG_PKG_POWER_SKU_UNIT:
> @@ -98,13 +104,13 @@ static u32 xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg)
>   			reg = PCU_CR_PACKAGE_POWER_SKU_UNIT;
>   		break;
>   	case REG_GT_PERF_STATUS:
> -		if (xe->info.platform == XE_DG2)
> +		if (xe->info.platform == XE_DG2 && channel == CHANNEL_PKG)
>   			reg = GT_PERF_STATUS;
>   		break;
>   	case REG_PKG_ENERGY_STATUS:
> -		if (xe->info.platform == XE_PVC)
> +		if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
>   			reg = PVC_GT0_PLATFORM_ENERGY_STATUS;
> -		else if (xe->info.platform == XE_DG2)
> +		else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG))
>   			reg = PCU_CR_PACKAGE_ENERGY_STATUS;
>   		break;
>   	default:
> @@ -117,11 +123,12 @@ static u32 xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg)
>   
>   static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
>   				 enum xe_hwmon_reg_operation operation, u64 *value,
> -				 u32 clr, u32 set)
> +				 u32 clr, u32 set, int channel)
>   {
>   	struct xe_reg reg;
>   
> -	reg.raw = xe_hwmon_get_reg(hwmon, hwmon_reg);
> +	*value = 0;
> +	reg.raw = xe_hwmon_get_reg(hwmon, hwmon_reg, channel);
>   
>   	if (!reg.raw)
>   		return;
> @@ -151,13 +158,13 @@ static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon
>    * same pattern for sysfs, allow arbitrary PL1 limits to be set but display
>    * clamped values when read.
>    */
> -static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, long *value)
> +static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, int channel, long *value)
>   {
>   	u64 reg_val, min, max;
>   
>   	mutex_lock(&hwmon->hwmon_lock);
>   
> -	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ32, &reg_val, 0, 0);
> +	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ32, &reg_val, 0, 0, channel);
>   	/* Check if PL1 limit is disabled */
>   	if (!(reg_val & PKG_PWR_LIM_1_EN)) {
>   		*value = PL1_DISABLE;
> @@ -167,7 +174,7 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, long *value)
>   	reg_val = REG_FIELD_GET(PKG_PWR_LIM_1, reg_val);
>   	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
>   
> -	xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ64, &reg_val, 0, 0);
> +	xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ64, &reg_val, 0, 0, channel);
>   	min = REG_FIELD_GET(PKG_MIN_PWR, reg_val);
>   	min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
>   	max = REG_FIELD_GET(PKG_MAX_PWR, reg_val);
> @@ -179,7 +186,7 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, long *value)
>   	mutex_unlock(&hwmon->hwmon_lock);
>   }
>   
> -static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long value)
> +static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, int channel, long value)
>   {
>   	int ret = 0;
>   	u64 reg_val;
> @@ -189,9 +196,9 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long value)
>   	/* Disable PL1 limit and verify, as limit cannot be disabled on all platforms */
>   	if (value == PL1_DISABLE) {
>   		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32, &reg_val,
> -				     PKG_PWR_LIM_1_EN, 0);
> +				     PKG_PWR_LIM_1_EN, 0, channel);
>   		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ32, &reg_val,
> -				     PKG_PWR_LIM_1_EN, 0);
> +				     PKG_PWR_LIM_1_EN, 0, channel);
>   
>   		if (reg_val & PKG_PWR_LIM_1_EN) {
>   			ret = -EOPNOTSUPP;
> @@ -204,17 +211,17 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long value)
>   	reg_val = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, reg_val);
>   
>   	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32, &reg_val,
> -			     PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val);
> +			     PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val, channel);
>   unlock:
>   	mutex_unlock(&hwmon->hwmon_lock);
>   	return ret;
>   }
>   
> -static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, long *value)
> +static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, int channel, long *value)
>   {
>   	u64 reg_val;
>   
> -	xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ32, &reg_val, 0, 0);
> +	xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ32, &reg_val, 0, 0, channel);
>   	reg_val = REG_FIELD_GET(PKG_TDP, reg_val);
>   	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
>   }
> @@ -237,16 +244,16 @@ static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, long *value)
>    * the hwmon API. Using x86_64 128 bit arithmetic (see mul_u64_u32_shr()),
>    * a 'long' of 63 bits, SF_ENERGY of 1e6 (~20 bits) and
>    * hwmon->scl_shift_energy of 14 bits we have 57 (63 - 20 + 14) bits before
> - * energy1_input overflows. This at 1000 W is an overflow duration of 278 years.
> + * energyN_input overflows. This at 1000 W is an overflow duration of 278 years.
>    */
>   static void
> -xe_hwmon_energy_get(struct xe_hwmon *hwmon, long *energy)
> +xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
>   {
> -	struct xe_hwmon_energy_info *ei = &hwmon->ei;
> +	struct xe_hwmon_energy_info *ei = &hwmon->ei[channel];
>   	u64 reg_val;
>   
>   	xe_hwmon_process_reg(hwmon, REG_PKG_ENERGY_STATUS, REG_READ32,
> -			     &reg_val, 0, 0);
> +			     &reg_val, 0, 0, channel);
>   
>   	if (reg_val >= ei->reg_val_prev)
>   		ei->accum_energy += reg_val - ei->reg_val_prev;
> @@ -260,19 +267,20 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, long *energy)
>   }
>   
>   static ssize_t
> -xe_hwmon_power1_max_interval_show(struct device *dev, struct device_attribute *attr,
> -				  char *buf)
> +xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *attr,
> +				 char *buf)
>   {
>   	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>   	u32 x, y, x_w = 2; /* 2 bits */
>   	u64 r, tau4, out;
> +	int sensor_index = to_sensor_dev_attr(attr)->index;
>   
>   	xe_pm_runtime_get(gt_to_xe(hwmon->gt));
>   
>   	mutex_lock(&hwmon->hwmon_lock);
>   
>   	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
> -			     REG_READ32, &r, 0, 0);
> +			     REG_READ32, &r, 0, 0, sensor_index);
>   
>   	mutex_unlock(&hwmon->hwmon_lock);
>   
> @@ -300,14 +308,15 @@ xe_hwmon_power1_max_interval_show(struct device *dev, struct device_attribute *a
>   }
>   
>   static ssize_t
> -xe_hwmon_power1_max_interval_store(struct device *dev, struct device_attribute *attr,
> -				   const char *buf, size_t count)
> +xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *attr,
> +				  const char *buf, size_t count)
>   {
>   	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>   	u32 x, y, rxy, x_w = 2; /* 2 bits */
>   	u64 tau4, r, max_win;
>   	unsigned long val;
>   	int ret;
> +	int sensor_index = to_sensor_dev_attr(attr)->index;
>   
>   	ret = kstrtoul(buf, 0, &val);
>   	if (ret)
> @@ -326,7 +335,7 @@ xe_hwmon_power1_max_interval_store(struct device *dev, struct device_attribute *
>   
>   	/*
>   	 * val must be < max in hwmon interface units. The steps below are
> -	 * explained in xe_hwmon_power1_max_interval_show()
> +	 * explained in xe_hwmon_power_max_interval_show()
>   	 */
>   	r = FIELD_PREP(PKG_MAX_WIN, PKG_MAX_WIN_DEFAULT);
>   	x = REG_FIELD_GET(PKG_MAX_WIN_X, r);
> @@ -360,7 +369,7 @@ xe_hwmon_power1_max_interval_store(struct device *dev, struct device_attribute *
>   	mutex_lock(&hwmon->hwmon_lock);
>   
>   	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32, (u64 *)&r,
> -			     PKG_PWR_LIM_1_TIME, rxy);
> +			     PKG_PWR_LIM_1_TIME, rxy, sensor_index);
>   
>   	mutex_unlock(&hwmon->hwmon_lock);
>   
> @@ -370,11 +379,16 @@ xe_hwmon_power1_max_interval_store(struct device *dev, struct device_attribute *
>   }
>   
>   static SENSOR_DEVICE_ATTR(power1_max_interval, 0664,
> -			  xe_hwmon_power1_max_interval_show,
> -			  xe_hwmon_power1_max_interval_store, 0);
> +			  xe_hwmon_power_max_interval_show,
> +			  xe_hwmon_power_max_interval_store, CHANNEL_PLATFORM);
> +
> +static SENSOR_DEVICE_ATTR(power2_max_interval, 0664,
> +			  xe_hwmon_power_max_interval_show,
> +			  xe_hwmon_power_max_interval_store, CHANNEL_PKG);
>   
>   static struct attribute *hwmon_attributes[] = {
>   	&sensor_dev_attr_power1_max_interval.dev_attr.attr,
> +	&sensor_dev_attr_power2_max_interval.dev_attr.attr,
>   	NULL
>   };
>   
> @@ -387,8 +401,7 @@ static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
>   
>   	xe_pm_runtime_get(gt_to_xe(hwmon->gt));
>   
> -	if (attr == &sensor_dev_attr_power1_max_interval.dev_attr.attr)
> -		ret = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT) ? attr->mode : 0;
> +	ret = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, index) ? attr->mode : 0;
>   
>   	xe_pm_runtime_put(gt_to_xe(hwmon->gt));
>   
> @@ -406,10 +419,11 @@ static const struct attribute_group *hwmon_groups[] = {
>   };
>   
>   static const struct hwmon_channel_info * const hwmon_info[] = {
> -	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
> -	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
> -	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
> -	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
> +	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL,
> +			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT | HWMON_P_LABEL),
> +	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL),
> +	HWMON_CHANNEL_INFO(in, HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL),
I think this should be
HWMON_CHANNEL_INFO(in, HWMON_I_INPUT|HWMON_I_LABEL, HWMON_I_INPUT | 
HWMON_I_LABEL),

and let visible function decide whether to create attribute or not.

Regards,
Badal

> +	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
>   	NULL
>   };
>   
> @@ -432,7 +446,8 @@ static int xe_hwmon_pcode_write_i1(struct xe_gt *gt, u32 uval)
>   			      uval);
>   }
>   
> -static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, long *value, u32 scale_factor)
> +static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, int channel,
> +					 long *value, u32 scale_factor)
>   {
>   	int ret;
>   	u32 uval;
> @@ -450,7 +465,8 @@ static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, long *value, u3
>   	return ret;
>   }
>   
> -static int xe_hwmon_power_curr_crit_write(struct xe_hwmon *hwmon, long value, u32 scale_factor)
> +static int xe_hwmon_power_curr_crit_write(struct xe_hwmon *hwmon, int channel,
> +					  long value, u32 scale_factor)
>   {
>   	int ret;
>   	u32 uval;
> @@ -464,117 +480,127 @@ static int xe_hwmon_power_curr_crit_write(struct xe_hwmon *hwmon, long value, u3
>   	return ret;
>   }
>   
> -static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, long *value)
> +static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *value)
>   {
>   	u64 reg_val;
>   
>   	xe_hwmon_process_reg(hwmon, REG_GT_PERF_STATUS,
> -			     REG_READ32, &reg_val, 0, 0);
> +			     REG_READ32, &reg_val, 0, 0, channel);
>   	/* HW register value in units of 2.5 millivolt */
>   	*value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 2500, SF_VOLTAGE);
>   }
>   
>   static umode_t
> -xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int chan)
> +xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>   {
>   	u32 uval;
>   
>   	switch (attr) {
>   	case hwmon_power_max:
> -		return xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT) ? 0664 : 0;
> +		return xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel) ? 0664 : 0;
>   	case hwmon_power_rated_max:
> -		return xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU) ? 0444 : 0;
> +		return xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel) ? 0444 : 0;
>   	case hwmon_power_crit:
> -		return (xe_hwmon_pcode_read_i1(hwmon->gt, &uval) ||
> -			!(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
> +		if (channel == CHANNEL_PKG)
> +			return (xe_hwmon_pcode_read_i1(hwmon->gt, &uval) ||
> +				!(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
> +		break;
> +	case hwmon_power_label:
> +		return xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT, channel) ? 0444 : 0;
>   	default:
>   		return 0;
>   	}
> +	return 0;
>   }
>   
>   static int
> -xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int chan, long *val)
> +xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>   {
>   	switch (attr) {
>   	case hwmon_power_max:
> -		xe_hwmon_power_max_read(hwmon, val);
> +		xe_hwmon_power_max_read(hwmon, channel, val);
>   		return 0;
>   	case hwmon_power_rated_max:
> -		xe_hwmon_power_rated_max_read(hwmon, val);
> +		xe_hwmon_power_rated_max_read(hwmon, channel, val);
>   		return 0;
>   	case hwmon_power_crit:
> -		return xe_hwmon_power_curr_crit_read(hwmon, val, SF_POWER);
> +		return xe_hwmon_power_curr_crit_read(hwmon, channel, val, SF_POWER);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
>   }
>   
>   static int
> -xe_hwmon_power_write(struct xe_hwmon *hwmon, u32 attr, int chan, long val)
> +xe_hwmon_power_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
>   {
>   	switch (attr) {
>   	case hwmon_power_max:
> -		return xe_hwmon_power_max_write(hwmon, val);
> +		return xe_hwmon_power_max_write(hwmon, channel, val);
>   	case hwmon_power_crit:
> -		return xe_hwmon_power_curr_crit_write(hwmon, val, SF_POWER);
> +		return xe_hwmon_power_curr_crit_write(hwmon, channel, val, SF_POWER);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
>   }
>   
>   static umode_t
> -xe_hwmon_curr_is_visible(const struct xe_hwmon *hwmon, u32 attr)
> +xe_hwmon_curr_is_visible(const struct xe_hwmon *hwmon, u32 attr, int channel)
>   {
>   	u32 uval;
>   
>   	switch (attr) {
>   	case hwmon_curr_crit:
> -		return (xe_hwmon_pcode_read_i1(hwmon->gt, &uval) ||
> -			(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
> +	case hwmon_curr_label:
> +		if (channel == CHANNEL_PKG)
> +			return (xe_hwmon_pcode_read_i1(hwmon->gt, &uval) ||
> +				(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
> +		break;
>   	default:
>   		return 0;
>   	}
> +	return 0;
>   }
>   
>   static int
> -xe_hwmon_curr_read(struct xe_hwmon *hwmon, u32 attr, long *val)
> +xe_hwmon_curr_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>   {
>   	switch (attr) {
>   	case hwmon_curr_crit:
> -		return xe_hwmon_power_curr_crit_read(hwmon, val, SF_CURR);
> +		return xe_hwmon_power_curr_crit_read(hwmon, channel, val, SF_CURR);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
>   }
>   
>   static int
> -xe_hwmon_curr_write(struct xe_hwmon *hwmon, u32 attr, long val)
> +xe_hwmon_curr_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
>   {
>   	switch (attr) {
>   	case hwmon_curr_crit:
> -		return xe_hwmon_power_curr_crit_write(hwmon, val, SF_CURR);
> +		return xe_hwmon_power_curr_crit_write(hwmon, channel, val, SF_CURR);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
>   }
>   
>   static umode_t
> -xe_hwmon_in_is_visible(struct xe_hwmon *hwmon, u32 attr)
> +xe_hwmon_in_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>   {
>   	switch (attr) {
>   	case hwmon_in_input:
> -		return xe_hwmon_get_reg(hwmon, REG_GT_PERF_STATUS) ? 0444 : 0;
> +	case hwmon_in_label:
> +		return xe_hwmon_get_reg(hwmon, REG_GT_PERF_STATUS, channel) ? 0444 : 0;
>   	default:
>   		return 0;
>   	}
>   }
>   
>   static int
> -xe_hwmon_in_read(struct xe_hwmon *hwmon, u32 attr, long *val)
> +xe_hwmon_in_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>   {
>   	switch (attr) {
>   	case hwmon_in_input:
> -		xe_hwmon_get_voltage(hwmon, val);
> +		xe_hwmon_get_voltage(hwmon, channel, val);
>   		return 0;
>   	default:
>   		return -EOPNOTSUPP;
> @@ -582,22 +608,23 @@ xe_hwmon_in_read(struct xe_hwmon *hwmon, u32 attr, long *val)
>   }
>   
>   static umode_t
> -xe_hwmon_energy_is_visible(struct xe_hwmon *hwmon, u32 attr)
> +xe_hwmon_energy_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>   {
>   	switch (attr) {
>   	case hwmon_energy_input:
> -		return xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS) ? 0444 : 0;
> +	case hwmon_energy_label:
> +		return xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS, channel) ? 0444 : 0;
>   	default:
>   		return 0;
>   	}
>   }
>   
>   static int
> -xe_hwmon_energy_read(struct xe_hwmon *hwmon, u32 attr, long *val)
> +xe_hwmon_energy_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>   {
>   	switch (attr) {
>   	case hwmon_energy_input:
> -		xe_hwmon_energy_get(hwmon, val);
> +		xe_hwmon_energy_get(hwmon, channel, val);
>   		return 0;
>   	default:
>   		return -EOPNOTSUPP;
> @@ -618,13 +645,13 @@ xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   		ret = xe_hwmon_power_is_visible(hwmon, attr, channel);
>   		break;
>   	case hwmon_curr:
> -		ret = xe_hwmon_curr_is_visible(hwmon, attr);
> +		ret = xe_hwmon_curr_is_visible(hwmon, attr, channel);
>   		break;
>   	case hwmon_in:
> -		ret = xe_hwmon_in_is_visible(hwmon, attr);
> +		ret = xe_hwmon_in_is_visible(hwmon, attr, channel);
>   		break;
>   	case hwmon_energy:
> -		ret = xe_hwmon_energy_is_visible(hwmon, attr);
> +		ret = xe_hwmon_energy_is_visible(hwmon, attr, channel);
>   		break;
>   	default:
>   		ret = 0;
> @@ -650,13 +677,13 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   		ret = xe_hwmon_power_read(hwmon, attr, channel, val);
>   		break;
>   	case hwmon_curr:
> -		ret = xe_hwmon_curr_read(hwmon, attr, val);
> +		ret = xe_hwmon_curr_read(hwmon, attr, channel, val);
>   		break;
>   	case hwmon_in:
> -		ret = xe_hwmon_in_read(hwmon, attr, val);
> +		ret = xe_hwmon_in_read(hwmon, attr, channel, val);
>   		break;
>   	case hwmon_energy:
> -		ret = xe_hwmon_energy_read(hwmon, attr, val);
> +		ret = xe_hwmon_energy_read(hwmon, attr, channel, val);
>   		break;
>   	default:
>   		ret = -EOPNOTSUPP;
> @@ -682,7 +709,7 @@ xe_hwmon_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   		ret = xe_hwmon_power_write(hwmon, attr, channel, val);
>   		break;
>   	case hwmon_curr:
> -		ret = xe_hwmon_curr_write(hwmon, attr, val);
> +		ret = xe_hwmon_curr_write(hwmon, attr, channel, val);
>   		break;
>   	default:
>   		ret = -EOPNOTSUPP;
> @@ -694,10 +721,30 @@ xe_hwmon_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   	return ret;
>   }
>   
> +static int xe_hwmon_read_label(struct device *dev,
> +			       enum hwmon_sensor_types type,
> +			       u32 attr, int channel, const char **str)
> +{
> +	switch (type) {
> +	case hwmon_power:
> +	case hwmon_energy:
> +	case hwmon_curr:
> +	case hwmon_in:
> +		if (channel == CHANNEL_PLATFORM)
> +			*str = "card";
> +		else if (channel == CHANNEL_PKG)
> +			*str = "pkg";
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
>   static const struct hwmon_ops hwmon_ops = {
>   	.is_visible = xe_hwmon_is_visible,
>   	.read = xe_hwmon_read,
>   	.write = xe_hwmon_write,
> +	.read_string = xe_hwmon_read_label,
>   };
>   
>   static const struct hwmon_chip_info hwmon_chip_info = {
> @@ -711,14 +758,15 @@ xe_hwmon_get_preregistration_info(struct xe_device *xe)
>   	struct xe_hwmon *hwmon = xe->hwmon;
>   	long energy;
>   	u64 val_sku_unit = 0;
> +	int channel;
>   
>   	/*
>   	 * The contents of register PKG_POWER_SKU_UNIT do not change,
>   	 * so read it once and store the shift values.
>   	 */
> -	if (xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT)) {
> +	if (xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT, 0)) {
>   		xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU_UNIT,
> -				     REG_READ32, &val_sku_unit, 0, 0);
> +				     REG_READ32, &val_sku_unit, 0, 0, 0);
>   		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
>   		hwmon->scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
>   		hwmon->scl_shift_time = REG_FIELD_GET(PKG_TIME_UNIT, val_sku_unit);
> @@ -728,8 +776,9 @@ xe_hwmon_get_preregistration_info(struct xe_device *xe)
>   	 * Initialize 'struct xe_hwmon_energy_info', i.e. set fields to the
>   	 * first value of the energy register read
>   	 */
> -	if (xe_hwmon_is_visible(hwmon, hwmon_energy, hwmon_energy_input, 0))
> -		xe_hwmon_energy_get(hwmon, &energy);
> +	for (channel = 0; channel < CHANNEL_MAX; channel++)
> +		if (xe_hwmon_is_visible(hwmon, hwmon_energy, hwmon_energy_input, channel))
> +			xe_hwmon_energy_get(hwmon, channel, &energy);
>   }
>   
>   static void xe_hwmon_mutex_destroy(void *arg)
