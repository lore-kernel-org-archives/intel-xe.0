Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF32FCA180
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 20:20:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF94710E5B9;
	Mon,  9 Mar 2026 20:20:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cS7xiv/r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B2E10E5B9
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Mar 2026 20:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773087643; x=1804623643;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=GAx+IR3J8l9zd/MJcDv03A1DmHJNjM8sKUkaPtDARLg=;
 b=cS7xiv/rYLWy/BLsl6da+XnFp4eJfv6eyBJhTrGED2RHxjtCow4IUHWc
 3UUZ/tXH+PBtwIu39my4k8LF+pPRaWeJmEEqbzpVbBGBh8ZQTMBJj5N+b
 TGmAJ2FTXxW8gjk436ACoYXoOGPzKCG/Om8yTGf36GZQ9/tcO2QPGYS9I
 N3JhhkDza0jpusVsmQXKMdEoUxx0GCFQ9fJvqdEvt35bUQJ7v/FH0HVYV
 XDX3vFZL5WL3R0wYaYFSWUenGL61/UdqLc8wxxKXFfnUzn3ymCf+yocpz
 ITow6Vl0MpC0uHbX/Ga7VQbSdWjHm2YVFfRigW13Wqvi+0WG8dnWIB4qv w==;
X-CSE-ConnectionGUID: y0LSOkQTT56ibppZcMvpOw==
X-CSE-MsgGUID: AyQT9vtUSEmnokvd6bwlJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="73146680"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="73146680"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 13:20:43 -0700
X-CSE-ConnectionGUID: DvISyKYVQ2y8AkKnwdiCMQ==
X-CSE-MsgGUID: txUCJ4D5RYaC37nsw18mJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="245757986"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 13:20:43 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 13:20:42 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 13:20:42 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.1) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 13:20:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZQe1qp0tQatKqIQKfgHcpA9ZseURKIpUA4plUUCU01vRHPS7KAMmEV2fkI4cKy5lnFOgJJYCStm/uqED5MHKuQyrSmxiSZiPdHk5Ex1CVu95NJPMpdhGIVhAgXu6r31yV74rii1vLi+otin4Ypf+Ng7vN5NDn3y3EHw1UPqrp6EEBci5AJxEJ1I9NxWo8W/unzwtLpJ5IUzlDu3m2+zIV+V5LSWjR/61ee2kBNVa+I2V4EtOc0cyWX9xJa5uIkZjWMT35x1Bd4jBvGfqSvb+RQrcnYyD4S9i/qxETocSLVISuXFfPny0oJJWW6J+uSJLC/vF1Sp0N5W2A7T99nD7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZLQpyYeyA53sLcRa5g7ctZu8BdONW3Z6a+0G5NMRWsQ=;
 b=MeqJ8/O0agQ88Li5+sZiRjo+mFeBPlPI6CHLLeetuUXAJfjtHrjWxuw/in7cU0Kw2Jsj9OfS0VdKM/eC5qH8oyIb4CYw6I+0WvrKAEGL6Zk6RkOEeq0A39u+Cy1sSyvbVokkxbiV5tVNnfrVty2RClj4MLCBRj0Vhywa7K7JmfDBoHOqA4H+UsqRa3H7p7QsltEypB8VrtyeKvZ9zjxR0WYkdPufv5EKC66c5RYvBSt+UqxnEEyIjYFsyxIs8lat3aCTnNBf8csiNk7jCIipHXDP8j5x42TcF87diitBbeUcLgR4xnkf/gJp8x3zFPMfbspWx4fvk2r+kPFGgAcwEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA4PR11MB9297.namprd11.prod.outlook.com (2603:10b6:208:56f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 20:20:40 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 20:20:40 +0000
Message-ID: <39d0a9dc-0e17-4571-8ab8-7abac07e6196@intel.com>
Date: Mon, 9 Mar 2026 21:20:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] drm/xe: Call xe_wa_process_device_oob() after
 xe_sriov_probe_early()
To: Gustavo Sousa <gustavo.sousa@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260309-extra-nvl-p-enabling-patches-v3-0-0416900dd498@intel.com>
 <20260309-extra-nvl-p-enabling-patches-v3-5-0416900dd498@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260309-extra-nvl-p-enabling-patches-v3-5-0416900dd498@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0110.eurprd09.prod.outlook.com
 (2603:10a6:803:78::33) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA4PR11MB9297:EE_
X-MS-Office365-Filtering-Correlation-Id: b3b4e454-4e28-408e-075e-08de7e195509
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: q79e58+XTF+cIPwwAqAjEHJ7u+BhzsCED3oMBV7I+6hK3BMfHDvKA1O2SBVUHr1V24fKF82L8FVa3M/dLDNSoYC0JioeLo60Y5rgWbslAO4pJwPvcZxp0yrIN9K6A2qXZqInJA3K4yuEdftMmBZLxmULZf81Aoi3gipJLg4qg/9wQit1x05My+YiOPSNMrWTLmee6BnXa8Q0xQGgd4X0aQeNhqfIAiMfi+TzBE+LNaxkClPNDrx0Ps07I1WEdka6vUUSuQLkcQawvh+xDrFQZ1pmUW9tnB2bkdSJX1x3nNVLckFhsi1mXk6AX3oikOui9SE8eAh1qYs2o0Hv0FMMHXTdkpVZXiIADn/bAySz9Czt0dVQ4vmmWRJFW2+6X/LEaDTqkwRRnNRvSIkYsA/6txgIiV830R2XypCyzopbJayL2UTbb8BbBEM3/dL6KUHkeSVJyr0DS5wBKPD9Yng6W0m7kE3isVPv3kH4IHVBrfqHDl4A5X60bHwy3qpO/4b9weRoNgMLZ3YVNVyzmF2Rhiy/1MjIwMYmOVxGcd6/MM+Sy4lAB799KOz+YKpH6WU1ibgRhIsB3/u2MJyxp7mbwPmZwKlS9DTEeucW9n02B/fx3v2MKWZzPnit8b9YcqXqp3t5Vl3Vq2JHISAqcVsfHjB17dktMofMHz+9N/Y8lJ6ajxdmbZWzgN0nLmGWqeipM9HOQh9qd6hlEmIEBcrQFs3fiv4llS2xRLkCzTNfJ2A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUhobjJIeHNJazNvVDJUbUdKVmdvUkpXTnhMWUw2M1kwMlNOMkJ1Q2R2eUhZ?=
 =?utf-8?B?blE4QmJwMXNMdlNSMk1mbWxQbloxRnhUblpiM2FLa3lZSHh6MEV5cVFZcFhB?=
 =?utf-8?B?UFppYU1JZ2RkZHFpV3Qrc3ltYUlvVWNGSFVkcnd0aHEwWlVBYUhqT2hySU9p?=
 =?utf-8?B?dFpQWXUrQ0NidVoyQVY3SkxvdXNmNFlkckJrL01zYTdUdXpmWFp1R0dlOTBl?=
 =?utf-8?B?djc4SWVqcXl5Q2VxcGVwRk1pWFRiZUFJVkVhb0IwMFdsOHdvU0o1SnFLaXlu?=
 =?utf-8?B?NnMrcHhuYy9uU3FCRi95K3RweXhsaUNCcENpNG4yakdzVExSOURRTFZzd3BX?=
 =?utf-8?B?YXJJa3ZTblFhMHVjb3ZPWi9HWC8vY0lWRFlKejNSRitncnpGY1lWbXA0SURh?=
 =?utf-8?B?cy9WQ0RtUU1Hd0paeHo1WXExbXVaZ0Mvd2tTRGt3Sm9LQ2JZVmh4NEpBeFJB?=
 =?utf-8?B?aGlPY1RsQ3pDQ1Vpb3daSTVMek84NWxUMEJDWHBMalVJMHk1dHpsSFQyV2t1?=
 =?utf-8?B?bkY5UmdpcnU1d0FRY29hblJFemtsK2lleGtBdmlRb3kzamNSU3pPT3pMM1JZ?=
 =?utf-8?B?V3QyeUZGVnVGcU9EekNXSmdqVWxueDg0MmtxdG90SUpBQ0NXeDMyeHB4bnd0?=
 =?utf-8?B?dHJCQmNYbW1yQjhJY0ZlTC9IU05ZVU8rN2VQbURtU2hoSzJvNkEzK2l6aUkv?=
 =?utf-8?B?RmUwYStITTZuRzBKSFdNQ0FSdWg1WVBDL0NvV0dqK3hieXFyUUJxQVpqaEtM?=
 =?utf-8?B?aDFVSmtiaWFQdjRCb0Q3SWZVb3NCU1JoR3V3MGpMdGduZ1k3SVF3bnZXdGR2?=
 =?utf-8?B?K2FnVmhDNVBYNWpxMUFvS1FXN1ZwT3R2TFdQWmY0eWdLR2EwdFVuN2VqOEQz?=
 =?utf-8?B?MzQrQnJVM1J1Rk9wUTdNSStBbVk3VVhRZnY5VGlsSklVcVdpMENYTm1CRWxm?=
 =?utf-8?B?RE5VMDVmK29MQ2hrdk5JM3d0RTk4M3llYVIxcDUvMHNEVEFZaHI3UG9OT2Zj?=
 =?utf-8?B?Y0pEOVFLaU9GOXhQU1dWN1Q1NWFxWkRRbkl3Y2NUV1dkRmpJemJITU5xR3NL?=
 =?utf-8?B?aCt4czBzQ1JvUUo4dUFxNFJ2dmVROXlzd1lnTU5HNU1UTy9taUQ5Ti9WRzFZ?=
 =?utf-8?B?VVo2TjdKUTFZaFdQSE5XOG5URzlnbWxlSlNoV0ZwYVRocVFEVy9YVXBtakVy?=
 =?utf-8?B?L0tHeWxJL0VwR21DaEpCem9TSUQ0aEhJWnZaUWd1YWI0a0duRVlRc2U3ZW5N?=
 =?utf-8?B?VkpHZGJGcUVRb0REOFpFb1kwaHVScFkvUDlQck9vTjFpcFFXTFBXcm1uOGJF?=
 =?utf-8?B?STlucWwzN1dBYnFpV3dHbE1sdDZCRHFkeHhqY2ROY1lBYkJUQ0lsVzhWTnJh?=
 =?utf-8?B?aWd4am9uRjBBbHRYcFdZMkN1cVp2WDVXK1MrZVlSMElxMWZ5VldTbEJWejhI?=
 =?utf-8?B?NGZpMFg3RndWV1ZxMzhYTDNCNnEwblRTamRFVG13Y1lmeUhGNHZRb3dPRTQv?=
 =?utf-8?B?ekhZRUkvUWF5QTV1TVI2VzMrRHlGcm92YWpKRER2aTd5c3M2OG85VGFSOUJn?=
 =?utf-8?B?YThaWHhjVlJUN05TeVBlWTVWOWRwVGdwQTk2d2EzcXo4NnpScTMxUnBpQTN2?=
 =?utf-8?B?bGtCc0thVy94MzdVaklKcEhTUkJtN0lEUGlDZWphYW95Ky91UWl0b2RNVFU1?=
 =?utf-8?B?RFZwQnNmU3FvczA4Q0NycnAxUVY1NmpKMXF1bk4wbCtBWlVWdGRRekpNZ0hQ?=
 =?utf-8?B?RnlQNHBMaktrT2c1TXJBdEN0cHhFYkhEUnpDY21QNnlIeVhBM0FWdnIvQkxO?=
 =?utf-8?B?dzZTdEtHdnBDdzNaNDVPQUlGWGQvTGV5RUlwOEoxdDZEeTZNZHlPNzh0dzhh?=
 =?utf-8?B?SXlKR0FLdGdtQjNvRTZ0Tmh5TzNQY3RNVnZEdUcyTkh0OGZDbEpuNjEzVStv?=
 =?utf-8?B?dFNEOXEzU3l2MFlMVGhGd0MxR3ArYi9JeFRtKzQyN09ZRHBoNUJNZlhBemlm?=
 =?utf-8?B?WUJQa21mMHdDemRaMGVnWVh2OGFzdUZIU2t2czNRZVd1M2h4L3BMYS9KRlVI?=
 =?utf-8?B?Z3pzWU1DT0w5em13by83Vm9rSGdETlNJdi82R1M3RU94YzNIMDIydER5R1Zs?=
 =?utf-8?B?Rktib0ZuMkZhRU1GWGMzYXRYaDQ0VW16Rmc4cHFKVWJPVC8vanZ2bjBrRzhq?=
 =?utf-8?B?YkZrbzZjaHF0T21XYlpUeFRKTEt0RU1yK3VBS3dVYnJjSzJqcm90bGFRY0tX?=
 =?utf-8?B?bnhtenNWNk53WDBvK0g1d1lDcDZ4OGwrMDhXR2xRbTZ3WGNyd1ZLbXptazEw?=
 =?utf-8?B?dUdPSzlZOHliZlBQaWFKUnM2M0dJWSt5MzYzMWJia1J4NzRKK2t6TkZTY0dl?=
 =?utf-8?Q?QU3jSbdQne+bKCJs=3D?=
X-Exchange-RoutingPolicyChecked: ZbOqWofwbkRbv3qyaz89Zgb3tMojrHEDRQTAs4P94xo9m/SCUvoY5IlIgL5b+DsUwjX4GseBbRgsH/hJDvjCJ6gi6306+hl7CAse1Y0d1va73onjFA3dedm/nxz+UkF4kQrvUmB1tihcSyW8/76i818ssrFZ43ur7CP57SiHEjS8ceF9JsHBHQdQiTad7Ux/p/bJTAjE0Awi1PEmCkB5snOxFmeOG0v5OSHczxQdFM4aIeDb/AKfxVrOmGa6xe2QRlx12DbGfcijeQXdDXUEoAqCO/QyKCW8N2Tol6IClURfC7FFs9yRA16u6Hek1wg3rsdxBFEX0AkHOt5fEG+ESw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b3b4e454-4e28-408e-075e-08de7e195509
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 20:20:40.1638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1LneR4Ja6pATUli1/LJ3vE474BVM3zyrTphiBECTqt2Le1y36lX7gTO4+O2fTIBkVDxEJFV333NfF//NMmUr6+bNMx6UXxT9oOS3BVz6VSE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9297
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



On 3/9/2026 9:07 PM, Gustavo Sousa wrote:
> We will need to use FUNC(xe_rtp_match_not_sriov_vf) in an upcoming
> device OOB workaround and we need the SRIOV mode already defined by the
> time that workaround check is done.  Move the call to
> xe_wa_process_device_oob() to happen after  xe_sriov_probe_early() to
> allow usage of FUNC(xe_rtp_match_not_sriov_vf).
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 3462645ca13c..5651bcdc6752 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -699,15 +699,15 @@ int xe_device_probe_early(struct xe_device *xe)
>  {
>  	int err;
>  
> -	xe_wa_device_init(xe);
> -	xe_wa_process_device_oob(xe);
> -
>  	err = xe_mmio_probe_early(xe);
>  	if (err)
>  		return err;
>  
>  	xe_sriov_probe_early(xe);
>  
> +	xe_wa_device_init(xe);
> +	xe_wa_process_device_oob(xe);

maybe it would be better to move wa_init after below vf_update call
to keep SRIOV related functions together ? also the vf_update will
clear some feature flags, maybe it's also better to do that before
any wa processing?

> +
>  	if (IS_SRIOV_VF(xe))
>  		vf_update_device_info(xe);
>  
> 

