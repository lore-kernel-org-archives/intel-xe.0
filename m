Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4198FC88E77
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 13:25:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECCE310EAED;
	Wed, 16 Sep 2026 13:25:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d/ddUmbU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C96F10EAF2;
 Wed, 16 Sep 2026 13:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789565139; x=1821101139;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0bXrYl8VVx1HZAw8EoOBUD+kOoa/lVv2KmHByLn/vK0=;
 b=d/ddUmbUdwjuuqS28yKqTt/ieah7k+Tvx591eQGCoSMZyZtjb49c6Kvx
 vykAkojj3IfuzLZh/lV7hB3PFanj6hi0vDFOoHD7/TtZfupzuTPZUuPrF
 oH4Kizq5HNO5Lae/AZli1UWpjwWnLwYobg82AnhtQO+buEJeuPN+I4yrl
 7A464hk+edY/IJTJ4oh/eys9IVTdOy/sXOhaR/Ya57/H2yLJrV0pWPPo9
 0HIouhFtMtH36yCv4ojNc51+mJqO4s422dHgbaCVnTyzKh33WBJJjVxkf
 MGjzy/hCs8JZV0qEYbNc27yfxMiQrtPFkdEZ/B4wrSxPzsXY8wBa2ES8O A==;
X-CSE-ConnectionGUID: cYp8P8WCTciMzm97ZZqxEw==
X-CSE-MsgGUID: y6a6H0Z4T5q+0BF9HnJGBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="449468"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="449468"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 06:25:39 -0700
X-CSE-ConnectionGUID: 5VNZfVzkRx2QhURJ/xyN4Q==
X-CSE-MsgGUID: YnyHSBZUTd+G6T3pMlrpow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="298408503"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 06:25:39 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 06:25:39 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 06:25:39 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.13) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 06:25:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q32r5RLyT4xBsnyHsGtzvWkZKwuzKnHT8oC+7NTH9BfYykenrxdC0CzdNfENle2dDFoXnnPVFOH/xyx7Kei2A056gVgsdUsa3VD7LH+cFI54yS/8T+1Mjzm2C2qhYh98tcCP28QrQIBipLMcUL0zcPUe954+kGHo4gEUDM4pP/927eOmOXIXpVwdh2/6L07j9oCxWbcQjDxki2MMIiBWzUI6x3YFkULP3ZkYm6RspnOzt5QXKbzShCwKurxbKWDUVIeC3dGK4Qq4LsMdW8cuDEPq0cbM5sFmi3czO4B6ndoKqpYp73852IAsn6kUebVpMyCttDBInQTXWZXYMMy9tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zxq2g8L9OQ4TEdbEZTbqPqrMeyTOauMMNb3Er+vlewo=;
 b=fZvhatw+74yMi21qVv/MnvCJVLDxLdvy0OXF2+11kY9Kn8zwq6yTtd+hPwpJCC2erQUfQJmTNYlfF1fnL5mr2eXPux6B0dI4zwo/JtmK49O+iavrI460S3YDQZBJeWNGfHTKnz1t7uAm/Rvi8NNFQORYhUxXnvMoqx9azzdh/ZnuBXmxzji/G8i3JUSYNsPPxihU9FszA19CL3K/TTa6pbodoXC4e+YKwZKNXCYV+IXYStf1Nal4oHzPdgXzHqAbxSB1la64PWIWqZ3MKS+y79mRSG0oy/BG6iF/vZ78JQps156L7jQWSXQ8hjYMO5dLMbbpYfPPn6T5C/MftjXl+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by CH3PR11MB7868.namprd11.prod.outlook.com (2603:10b6:610:12e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 13:25:33 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 13:25:32 +0000
Message-ID: <6d6c8430-aeb0-497d-9003-8fd075c92b4a@intel.com>
Date: Wed, 16 Sep 2026 18:55:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/13] drm/i915/dsb: Add tracepoints for flip queue
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>
References: <20260909161730.12969-1-ville.syrjala@linux.intel.com>
 <20260909161730.12969-14-ville.syrjala@linux.intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260909161730.12969-14-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0037.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::11) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|CH3PR11MB7868:EE_
X-MS-Office365-Filtering-Correlation-Id: 94970f3f-975d-481b-9533-08df13f5fb69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|4143699003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: FyjmOvVixu2a3kX2dviYteMA3eWh7uEWLQxjBX+/CpW/ZuIcdDTFXBfRYQPduenw5IV1JTqWykJ8JSgNZg2QrjQRa2GyzXXlwZ9vHVk3/JG52QXqGG0UL0Pid8/V6mSHLUSRtakZ6OcbxfZgmWkV5BzFz83+tI7GL2XH5I6SzCFfm+ftCrWIJTO6XO7D3MCjkOZYoYk1giiyJki/X/QxLHpDX0qgr1tH/AZuLaB2GqILjcG83r8es+ZmfB2D5FOaI1DH/ct1T+rF1DgUnLQR0sR54r+PnSR3gavMh5Bz2cx2cx9uzMGpOFh7NW2vmoQyPQoiCdFH29swRR/4F7mOZZTLDhHf6rwf9QPlwAb+m5mPXo0pboXNLa9MA3GVkV74dKKhDQ7ikUFIj44uRxbvAJqBU4LkAgImgkgLdgXRprcnyCuuaqoOS5n/BhVgMatPFZibkfo8DWNMzwqmZHlIJO6ybtn01t1oQV51KD8oUQZU4Osi4/6EuGMwovZPxy1JudIImRiZv+EmwEHP5wgUGF8x52m97OCLP06dZ1oMVhvCdGtPocUt7rqlCOB5o66rQjq4SQGOi/qvb19REEufm27ZsacAN5ikfGRuzmwQI3wNtKUM0/jkv4/mIXByQBHtnKvOZT83RiJLqipMtPLHJg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(4143699003)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K256WHpidnpTazJIbVY3S3JZV3hmQUhFRjZTeDN0WGNYNUJMeExEWnMvV1F0?=
 =?utf-8?B?VklvTXMwdDBPZEhMV1dWYnVkR1hxakFRVWQrTG5FSWZ2M3lJck90WjlvNkI4?=
 =?utf-8?B?U3paTHZFcHZyMUdUVGtVWWkzOVh0R2xYNVVJd2l6U21RV1dIL21FVlhYOU9r?=
 =?utf-8?B?QjE5UFY3aytLUWFyY3pmaEU4OTUrYm9YMEQyMzVzR2kwMTl5ZXRNd3crdGJT?=
 =?utf-8?B?OXlzbTRZRFA5cGY2OFdPTGtndEl6c3kvaHR5YUxodWIrcXJHTUs4YzBHRmdw?=
 =?utf-8?B?NGx5azVWYzRiLzRoS3laVzQxN0Z3dHkzMEh5L2tVeDhJRjlET1IxbjMyaHpO?=
 =?utf-8?B?Tkt3SmpZVWxzTlZsMzJvU21HM2kvdXFJTWZ3M0RQeitvZUowdVNYQy9IZ3pO?=
 =?utf-8?B?cjlmZlNQTmNVSlJJcThwUVBuME8zbjFqNy9WZ3Z5Rk0xL3ZtREdKK2Y3QWlS?=
 =?utf-8?B?WmJoQ05CanU5N04wQXB3bWFObnh6Ym1iWXV0ODZMLzhjaG5XUkliSWEvMnNl?=
 =?utf-8?B?MzAvMkJITTBXeHFtSmk3dGZ0NUFWRGR4aUwxS3Z0THR6Kzg0NEQ4YjFvWGQr?=
 =?utf-8?B?akZqMytINnAzaGVNQjdheGFLSG5MZEEyZE16T1hmeFpVQmlySXJLbGprQmlG?=
 =?utf-8?B?bUNWVk42azZJUy9VNVg1TW1kWDZ0NmMzL1hPYnFrSnpwUXNSaWNJdkxWQnl3?=
 =?utf-8?B?RTZWa1JLV0QzZ2V6SWo1SnR5ampyYkpwb3hwMUhZZTJCbEF6aFpsZ0dock9y?=
 =?utf-8?B?U3N4dzh4c1V3T25ESmhGcUZlTnUyY3M5Yld0WkhBNmxCZjRnMXJ1Z2YrTHpC?=
 =?utf-8?B?QXgzK2ZEUi85VDB3RUpacTZOcXErdEVIR3R1OHR5WnFHME5DcFBBbUN2cTdp?=
 =?utf-8?B?SEZkM2pzVm5CY1lycjEzV3FBVlZuTStaU0p6Y0hhaVlkMk5uRGFQSVJQbnZQ?=
 =?utf-8?B?TEZJb2wvS1MzbWR5czFCSzQvRzJ1L05LTzZZSjM4ZnBaUWZ2Wi93R2NERERQ?=
 =?utf-8?B?VEV2Z0E2VmxqbU56amJKQ0NrVUJwS0ZPSWtmS2xLamJTbS9nQjJ6R3BCOHAv?=
 =?utf-8?B?ck45dGJqN0xqNFdOdVNLYVJSSGtsb0gxdzMvb0NiYzhoVEVPQjF3dTZlSWJ3?=
 =?utf-8?B?RmFZWnJaa3RONDh1Y2p5NkpGUTV2bjFjaWx5Vlg3Nk45N2tWWVZmTUlLNkVD?=
 =?utf-8?B?MWpTWnNHS1kwenpmRGx3ZThEakJNSWZlK0V2NzkyRDBFcTcyK0psMkoxYUh4?=
 =?utf-8?B?bVpCb3B6S1pxa2xrTGE0U1lzZkpSYVN1MHZoQ2pub2ZhVjk1cE5aNWJvMEs2?=
 =?utf-8?B?VlpJbG1nTE16ZzFPZDBlR0RMYlo5TzVsL1l1WE9sN2REM05MZi9OMjRzUFdI?=
 =?utf-8?B?NncvcWhJbkNBN01nUzNvRHpMU3VaeVFSL0RMODQvZVlibUNXcU1rUVV0ZkdK?=
 =?utf-8?B?WUF4a1NPUEJZNjM5ZjVqaFRkTWl2cUlEalVjZ0d3TzVyNVZmdVhmVHF3ZmhR?=
 =?utf-8?B?cGJGZ0JwTk5LaGc0OFFPMW9yQ3dTKzRJM2lhZXNwdHlGam4xdXlFaVM3RWht?=
 =?utf-8?B?ZE5aWWI4eS82T2pQSzJmRGMwOGJsaWNZemZiV21jdXU2MmJodmFFYk9uNzY5?=
 =?utf-8?B?TG9rRExqRnZ3bjlDTTRMNlMwWnF3YnI5b3hQVFp5V3FsSzN1QlJDeWdDa3kr?=
 =?utf-8?B?L3pCa0RqdXdJaTJVK3ZkK2FDUHEycXJjZytPM0svWitkQzU4alR1bitEcFh2?=
 =?utf-8?B?V2NxMTNWcVN3a1hMYXR2QXZnQVArMDlJWjlGb25FdHBMN01VTVFDeWx0bzZC?=
 =?utf-8?B?ZnNUTFFPRGdrdGtFK29tVWhBbFBJL1YwZUtjZGZ3dGxZcm5KenNML2pWWXJs?=
 =?utf-8?B?bHc0RVdwdWV2YytnWC9sNVNlckw4OFZuTkRYdCs2VFRiU05lWUpwNjBuVUxB?=
 =?utf-8?B?cEh5b1JtU0FHYzJvMzRjYkFVZERkYS9HMkw1T2lwZlBYVVd3UnhkT2RCUEQ1?=
 =?utf-8?B?d2w0SGs3cXp0RVVqNFJ0VlhFazZBRDcra3k4VHI3TW5GOHBHM2pmQlcwTFBp?=
 =?utf-8?B?SXhMZGlNMHJqQUdTUkF1aXNxOWlyaU5peHlXdzI4TTFjRjdhMnh4RDFhUTll?=
 =?utf-8?B?eUp5Q0lkSlBiblRUdjlMcHhLLzhaMG82ak90QStZQ2tKdmFjdXB4aUhidXow?=
 =?utf-8?B?dVdwblFFblpiRWdYNGdNSk1LMEhnUlpXcTBTLzQ4UGprWmJVQWdpVDJkZ1k0?=
 =?utf-8?B?RW1ZL3FIZXVrTVFEbWRDWllIbTUrY1Jvd0FXeXQxVWVjNEN2Q2dVMVgxbGtz?=
 =?utf-8?B?ZGNBU2h2ZHVNM3YvR1h0M2hvcGtGMERtUWpTVTRiNG40SU5hREovOGNwajNk?=
 =?utf-8?Q?zQfg8UcCyjxIz/c4=3D?=
X-Exchange-RoutingPolicyChecked: YSoamme0RV+YTvJYH3owh9VmfUuvZu8xzesIZQ+rja55OxTwGGQWYIiZL++ckjDQPi7DFF0t8mMJUtwhBlxbp1QZf+y68ssXVqpS7wH9Hi3c5muIKq8ePwl8L4kQ2OdhBm723o0Q9lJcCezNZApgpPDZPIIyZ0vPWUMrYC2zGwlA+25mPuzrzWBQ3jhitmKzWW6fVC3BVrtBdYy/OLVf50DOnctk4nxgkpzFNe5rypONEZ/Xq8gNu2bV5t+zmI/w57PylGmn94HtXeL5CciwGxbX4GAmpl+n+mr3vb0gVhSDL0PMFG76ekGG4050aZ4R0n2Ja0ginPxf7et3pdF/Iw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 94970f3f-975d-481b-9533-08df13f5fb69
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 13:25:31.9822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MuND89H5CxH97bu4dwtjxN0CO7GDBaBM5nv8ghAYu+rO46KeKe6AAJno4MucqH1WeM8REaMn7y1P9Mmudzas77lyaVReF2umr5iQ5l7odUc=
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
> Currently flip queue based commits don't leave any breadcrumbs
> via tracepoints. Add new intel_flipq_add and intel_flipq_done
> tracepoints that at least indicates when we something happens
> via the flip queeu.
> 
typo: queue

> We might want to improve this later somehow to have a slightly
> better idea what the flip queue might end up doing. But at least
> this now shows that *something* is going on.
> 

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   .../drm/i915/display/intel_display_trace.h    | 60 +++++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_dmc.c      |  3 +
>   drivers/gpu/drm/i915/display/intel_flipq.c    |  7 ++-
>   3 files changed, 69 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_trace.h b/drivers/gpu/drm/i915/display/intel_display_trace.h
> index 06cf662931fe..98ba7e20ca30 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_trace.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_trace.h
> @@ -23,6 +23,7 @@
>   #include "intel_display_limits.h"
>   #include "intel_display_types.h"
>   #include "intel_dsb.h"
> +#include "intel_flipq.h"
>   #include "intel_vblank.h"
>   
>   #define __dev_name_display(display) dev_name((display)->drm->dev)
> @@ -732,6 +733,65 @@ TRACE_EVENT(intel_dsb_done,
>   		      __entry->frame, __entry->scanline)
>   );
>   
> +TRACE_EVENT(intel_flipq_add,
> +	    TP_PROTO(struct intel_crtc *crtc,
> +		     enum intel_flipq_id flipq_id,
> +		     enum intel_dsb_id dsb_id,
> +		     u32 pts, u32 curr_pts),
> +	    TP_ARGS(crtc, flipq_id, dsb_id, pts, curr_pts),
> +
> +	    TP_STRUCT__entry(
> +			     __string(dev, __dev_name_kms(crtc))
> +			     __field(char, pipe_name)
> +			     __field(u32, flipq_id)
> +			     __field(u32, dsb_id)
> +			     __field(u32, pts)
> +			     __field(u32, curr_pts)
> +			     __field(u32, frame)
> +			     __field(u32, scanline)
> +			     ),
> +
> +	    TP_fast_assign(
> +			   __assign_str(dev);
> +			   __entry->pipe_name = pipe_name(crtc->pipe);
> +			   __entry->flipq_id = flipq_id;
> +			   __entry->dsb_id = dsb_id;
> +			   __entry->pts = pts;
> +			   __entry->curr_pts = curr_pts;
> +			   __entry->frame = intel_crtc_get_vblank_counter(crtc);
> +			   __entry->scanline = intel_get_crtc_scanline(crtc);
> +			   ),
> +
> +	    TP_printk("dev %s, pipe %c, FQ %d, DSB %d, PTS %u, current PTS %u, frame=%u, scanline=%u",
> +		      __get_str(dev), __entry->pipe_name,
> +		      __entry->flipq_id, __entry->dsb_id,
> +		      __entry->pts, __entry->curr_pts,
> +		      __entry->frame, __entry->scanline)
> +);
> +
> +TRACE_EVENT(intel_flipq_done,
> +	    TP_PROTO(struct intel_crtc *crtc),
> +	    TP_ARGS(crtc),
> +
> +	    TP_STRUCT__entry(
> +			     __string(dev, __dev_name_kms(crtc))
> +			     __field(char, pipe_name)
> +			     __field(u32, frame)
> +			     __field(u32, scanline)
> +			     ),
> +
> +	    TP_fast_assign(
> +			   __assign_str(dev);
> +			   __entry->pipe_name = pipe_name(crtc->pipe);
> +			   __entry->frame = intel_crtc_get_vblank_counter(crtc);
> +			   __entry->scanline = intel_get_crtc_scanline(crtc);
> +			   ),
> +
> +	    TP_printk("dev %s, pipe %c, frame=%u, scanline=%u",
> +		      __get_str(dev), __entry->pipe_name,
> +		      __entry->frame, __entry->scanline)
> +);
> +
>   TRACE_EVENT(intel_crtc_vblank_work_start,
>   	    TP_PROTO(struct intel_crtc *crtc),
>   	    TP_ARGS(crtc),
> diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
> index a191eee240d9..a16560f94986 100644
> --- a/drivers/gpu/drm/i915/display/intel_dmc.c
> +++ b/drivers/gpu/drm/i915/display/intel_dmc.c
> @@ -34,6 +34,7 @@
>   #include "intel_display_power_well.h"
>   #include "intel_display_regs.h"
>   #include "intel_display_rpm.h"
> +#include "intel_display_trace.h"
>   #include "intel_display_types.h"
>   #include "intel_display_utils.h"
>   #include "intel_dmc.h"
> @@ -1715,6 +1716,8 @@ void intel_pipedmc_irq_handler(struct intel_display *display, enum pipe pipe)
>   			spin_lock(&display->drm->event_lock);
>   
>   			if (crtc->flipq_event) {
> +				trace_intel_flipq_done(crtc);
> +
>   				/*
>   				 * Update vblank counter/timestamp in case it
>   				 * hasn't been done yet for this frame.
> diff --git a/drivers/gpu/drm/i915/display/intel_flipq.c b/drivers/gpu/drm/i915/display/intel_flipq.c
> index 45788234fc83..e7cfacd8a5ef 100644
> --- a/drivers/gpu/drm/i915/display/intel_flipq.c
> +++ b/drivers/gpu/drm/i915/display/intel_flipq.c
> @@ -11,6 +11,7 @@
>   #include "intel_crtc.h"
>   #include "intel_de.h"
>   #include "intel_display_core.h"
> +#include "intel_display_trace.h"
>   #include "intel_display_types.h"
>   #include "intel_display_utils.h"
>   #include "intel_display_wa.h"
> @@ -430,11 +431,13 @@ void intel_flipq_add(struct intel_crtc *crtc,
>   {
>   	struct intel_display *display = to_intel_display(crtc);
>   	struct intel_flipq *flipq = &crtc->flipq[flipq_id];
> +	unsigned int curr_pts;
>   
>   	if (!assert_flipq_has_room(crtc, flipq_id))
>   		return;
>   
> -	pts += intel_de_read(display, PIPEDMC_FPQ_TS(crtc->pipe));
> +	curr_pts = intel_de_read(display, PIPEDMC_FPQ_TS(crtc->pipe));
> +	pts += curr_pts;
>   
>   	intel_flipq_preempt(crtc, true);
>   
> @@ -446,6 +449,8 @@ void intel_flipq_add(struct intel_crtc *crtc,
>   	flipq->tail = (flipq->tail + 1) % intel_flipq_size_entries(flipq->flipq_id);
>   	intel_flipq_write_tail(crtc);
>   
> +	trace_intel_flipq_add(crtc, flipq_id, dsb_id, pts, curr_pts);
> +
>   	intel_flipq_preempt(crtc, false);
>   
>   	intel_flipq_sw_dmc_wake(crtc);

