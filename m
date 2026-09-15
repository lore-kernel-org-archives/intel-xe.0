Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE02DC88E75
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 11:12:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DAF910E270;
	Tue, 15 Sep 2026 11:12:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P5PT27/o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49AC110E270
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Sep 2026 11:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789470761; x=1821006761;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=31Vt6zzQ/ie1iaM7icJwrIPJ2Iws+lXgaV/tD42N2jE=;
 b=P5PT27/o6ah2Gjt6LY0j0RIbWvIZH01nkKJiIFsq81tFLD0kDJTTlnOf
 qyVNSRMofu3KreCi+QhOx11tw5bEATBzq0gyNodjdD058DimQHSgJ0uWX
 RB8NknfJpAH+XWMgLTAPAjl+eaiEPuY7/E6BgtVa9t6jIPcUuvCRH0X3/
 9UGta/rLHFvC9nA9rtTO+cVybew/ItXw6YVwmjr8QdshZ8P13Aqs06lZZ
 0FynyMtzkGuDfX2C3lzrkrPJsf/cE75LMFPAtoQzKp/FwKeILrQXCXFEq
 Hbk9UBVsj4KCxaZvAZ6PIOsYBeVxaStr4vy4UZ31J6bZQiHyDm2Q2mpZj w==;
X-CSE-ConnectionGUID: aE6klfvLRMeH1zm3vnJQ2Q==
X-CSE-MsgGUID: 0P4/D8XgREyJzutZX/nPlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89855994"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89855994"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 04:12:40 -0700
X-CSE-ConnectionGUID: YCImUGg5SUm7RZbuJRQbuQ==
X-CSE-MsgGUID: Pbr8PBlbRrWXldu7osByyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1204241"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 04:12:40 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 04:12:39 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 04:12:39 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.7) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 04:12:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b2s9PK33x9h+J6Rp3kX7iGtQaCKft56sc4ZT4OKK2t1NqBGBiPyCUelcrLHRcOgpHfafW96sIdkbJaJ3ZUUOgaBUW5LY+1HNjL6pA2REYFe77zmxRlnbUC5lTcZTb2h2LNLa2p+xVf2KKYHOrZ811XpkZbSRYID9Rhvz2TJqLrSknvUh2O5pONwhSEe4rZv1O5RERD10ZRXCiOJ+t89oGhBQUqc9GChNCEpIxW6lSQBzwBzpQEVYiOf348ZvWxWOC3osyx+z4jCkYShkdPXAuT4hKzUdE9B7a6dK2njMm/L0W041v0kFf6k9NRfnblG9G/VmLElyyzsCSYK7Gu1niw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qVpjmt0vWw7tpOzcTMF/e5tz2+/sYs3mL/QMwWBqQ6I=;
 b=QZTu2PKKKxJOiVqb1eAG2YZky+3W+ask6UKtdhP7e3KaU9x3u6xTHKflMrXHnEtehAUzZI+jm5ZfFA0Aee/SmGic62ohJCAKCZ15yGqOyiSdOEfl4S6koZKbF3Snhb3ZURTC5FJcKS4ttyNSaa2bSn4ii+1EiggTpkmDLYcxaGii1/2P+/u2TePtPUMH/NOkRz3ionZyWNtrVCZQau8i9FnjMdRTS7r5ZEmI4kM1vYyZU24unG5maPLf7uq2LgtQ7gsFDivDCJUBw9I/PZ7glUyIPKjNBnfPKtZkIZsA5prHJENVM7Vg7s2HEDeXsr4D9u2+mf3gLgo0a7/wcGjf2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by IA3PR11MB291754.namprd11.prod.outlook.com (2603:10b6:208:620::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 11:12:34 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 11:12:34 +0000
Message-ID: <a96e5f1a-0e89-4b7a-99c5-0794e5e54bd0@intel.com>
Date: Tue, 15 Sep 2026 13:12:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/10] drm/xe/vf: Add bounds checking for queried
 context and doorbell counts
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260915071159.51402-12-satyanarayana.k.v.p@intel.com>
 <20260915071159.51402-15-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260915071159.51402-15-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2PR04CA0299.eurprd04.prod.outlook.com
 (2603:10a6:10:28c::34) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|IA3PR11MB291754:EE_
X-MS-Office365-Filtering-Correlation-Id: 8796d329-ca4d-4033-b2bb-08df131a3dff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: sZ5VKgqV8XORE0TlPqaIQYsMnQjszclNkzwL7fXzeeGBQrrCUU5qp8FIRVSDI9iY7H1XRszhMdcKXb8W+cnYanU6TGUoT8OsHbcjSZsma4H+PYis548hx3zPqgN2hed/KHBM/2cgVfxN75VSh7+dOsVSeXF59Q9QaBWNu1937lJHA+aMEvwy1qyDhzrADYu0awqWj3dHtDyD/4PSlckIKeQQOy4zHTmgQngOn1Eaw14+Ucny5nR1fUXmQtI8wmlcxfESnoUkUskVgu011bYkR+j5GaEktGBwEJaTodxhfe4AIJ2PKDqw4RSLcEu1bppIS3bnqH2+BM/Di/IQyjR/ZE7Fk8cz90aOC/1TDECl2yUVPuExVGkQzAs+O0DAZYUdIYfDHz+CzOPtDgCueTkJZ4PYi3LvARSgguxfIhrfwue7SQnPG1ikkbXAlxH8c12cyBd/LyUro7pghJR0/pVM97q2xJDgDYQMi4o4beNJ3DrorsjWE/EG9qFad0xG82VJqJBDHF25345jLZt0B+Tk5UHQQOB2trOoqtKjsVGSyoyBEW/lcDjIi3cLx9VnVQoy7GdLXDjlCZGExiompC3WOrXJrPaFLr2GNDrG8ERmR9cXXN4IK9xK/z1MuF/XOdW0XE58bJ3iy6j7wucePxeFJDTEWLlGa6a9HsBtMsPyyL8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXFNVzdzK1JBSVJKYmpJQUM4QkpnYkwzRElma1RIeG5qS0R4ZXhocGJFdGlt?=
 =?utf-8?B?bC96UVZURU9UQWVTMG9YSzl4WktZYjA5TlhsZTAyZVJmQXdjNm1GbXM5V1Nr?=
 =?utf-8?B?ZGJLZVRBN0R0MDNLZGpyZi9XS0o0N2Z5Tlo4MW05U3l1OHdRSC9wc3YxeUti?=
 =?utf-8?B?TmdIT2krbUZlOWtiMllIMlFpSEtjOVROYXJVSllTMTNVS1BqYWxydTFUOTVZ?=
 =?utf-8?B?TGJZUEV3N1dTaUxaSUVmQmxnampCNFdYSUxydGtNODlDL1RNTklZZjJneXUz?=
 =?utf-8?B?enBkL3BZUVZBaHdPcmw0MXc3cmRKZE1zOVN1YVVyY3Ixb3E0WEljQkZ5T01i?=
 =?utf-8?B?MmdLWUIyNlBsQ3lRaW02Z2J0VkxGRXpTU01vOThkUEtRb2crTWNVKzRPMkpt?=
 =?utf-8?B?ZVRMLzRvRmQxOTZ1aDVrdTYxaGZpQmVoOU9udEJRN2hBVmRDL3NVTkkrOHh2?=
 =?utf-8?B?cFNzVUlNYVQrNlVGdmcxMktyejlTTEN3bzFWRHdjSHJsemhMQXJLR2I1YU9j?=
 =?utf-8?B?aDM3MVNYVEZPTjFMVmJPU04xTDRKQkE5d0RaUmdjVEtUNm90MnhQeG9hWk96?=
 =?utf-8?B?QW0vNlJLTGp2NUxub0ZsVlNYRitCOFUxWjhlQlN2Wmp4bkMrMmlENDdGckpW?=
 =?utf-8?B?SW5rVnZqTGJpOXQ0WDJVeW5OVU01QWFvbTI5OGl6by8zeXd1akVqbEZWMXg4?=
 =?utf-8?B?Z2VEbWJWS2dRYmVxYk9sQWNrT3g5b3RlN2hiOGFwc0YxK2lZZVpZUFA0dTQ2?=
 =?utf-8?B?UE4zQ2JSU0FUTVlkRnNmTnlHRURLOHlmY3JOeXJhenNNQUZJU1BzRzNQc05B?=
 =?utf-8?B?eHBpdnRaV0lxNUk3eS9WaFY3SkN2MzdlZHdDaEF4ZkdKbDl3U2hreUlJVStv?=
 =?utf-8?B?OFJza1l3c0lNVFBlaEtuamN3eE1ZdWM3Y3lCYStqMFlLNWthVWo2V2VCOWhS?=
 =?utf-8?B?NVBaWHg0dGtDT3RWN2VTSmNDM3V6c3lnSTRCNUc3dUM1bVNyNTdzalBzQmZH?=
 =?utf-8?B?MDN1Y0tYeWsyNVk3LzIzcGVPNzZ3dVgxUWNxdzRsUmxNSlZBdmJIaHJzTmZE?=
 =?utf-8?B?TkdpemQyOERqZWk1MzFmWjZ6dEhROS8xZUo1SXppclloYjF2Z3dFWnFodWRs?=
 =?utf-8?B?M2M2ZE13bUtNUGNtdE1yL3JESTlaYmx5SUNJSDlNcnFocjY5aURIQnY1TC93?=
 =?utf-8?B?a2pzY1hOcUhCekJBZDlxS1lLOE55a29UOTNCV3JEbm9LV0J1eWR6Ny9FTGJS?=
 =?utf-8?B?SnorU05oUEpiWE9DaHFwUkhwMTJFaHZ0ZGQyeXFQV2tEYkNrZERuZ3FRWi9u?=
 =?utf-8?B?dFVQN1ljRC8zejR1UWRTaEJYVkVweDVnRWhNNHlyTDR1TGJKS21OaUpDSnJy?=
 =?utf-8?B?MHBPbk53WHJDZ1BtdkN2V0Y5YlFGaXJOanpWcHJQUUxrVnZQSmE5SmFRZE9z?=
 =?utf-8?B?bTVSd05KS1h4alpDb1pNT2Q1NWE5Tm0wV1ozOTNDWDRSaDhHWUVzRTh6QnBk?=
 =?utf-8?B?M21iNnNodUNPeXo1Q2hlZHNPRVlZbjQrdTd6NGo4aEFIVldDT3lENTZ4TU0w?=
 =?utf-8?B?ODBsK1dxQlBlenh1OTArUHJ3VDltWXpaeTg4cXZQVlFZb2JWTDN1YTVzdWl1?=
 =?utf-8?B?RU1yZ0E3OHJwODNubXBuclppZWxWb25UT2Y4SldtQ2JkUFFqN1JYRkNKT0Z4?=
 =?utf-8?B?YWIwVjR4MEdMVzJTN1YwcGt2TnBUL24xVGZpYXdmQkM3aWFtSm1KNG9yQmk0?=
 =?utf-8?B?WTZqcjd5RE84WDVQV3p4cU5pZmROdDhaU214WExxT2VueDlLSW9vVVJrdlNU?=
 =?utf-8?B?SkQxclk3Uk5EWUJSMEk0Qkdsd2Z0QU4yaU1kdWpMU2huU1BIZlpRd0h1bmls?=
 =?utf-8?B?NXRyT2FUUHFJWWlxYTNQSGpTMXh3ZGsrcElxcHBQaFJSUjV5NTRWRm1CS2wz?=
 =?utf-8?B?OU5KVVNKWnZQRjkxRGNvTUhUbm1GLzhlSmM0NEt6ekNpRCtXSm9tZDlicS9u?=
 =?utf-8?B?bkw0REhMOWNUdXAvVENPS200TFNyOWZPWVBtWVVUMU5pYlQ5MVkvZUZpTmJY?=
 =?utf-8?B?aWZqdThvL0tTNWFXQ0Z0OVd0RlJnbGRHRkgxSllIY1A0NjY4YS81cEJZUlRJ?=
 =?utf-8?B?eElsNVVOSlR1Z0s1TC9GNXgyRzZwZ0ZwaGpkU3NuLzlneTZaZHdJUVpHQm0r?=
 =?utf-8?B?eVA3cldlWk4wODRCTlpsNGVhWlNtTWNmdER2d0RBK3djSzlWenE5Z3dLNU1y?=
 =?utf-8?B?VzBRbTAvVFhxVk1ENCt6aXFaanZLVXBrRXp5eW9FUEprK2VrUjZuZDVTNWRL?=
 =?utf-8?B?NVUzbFN0S0FFUE40am1UM213dWg2eDBIN0Q5Qit0elZLc3ROOTArajZiSUd1?=
 =?utf-8?Q?7vRXpqO07QB7Hfn0=3D?=
X-Exchange-RoutingPolicyChecked: u1Uv235ZW2Nk+MMMEyVHKhE7ZIhUxuhg/TO+JzXneBVVjQwP5DPYSFJeOXYHimD+0OiVfnLB7AdMTUtgiecGatALyetzNO4AFxmRmX+c5KsFMxnzLeo4Q6D1DLRZ6IgnCU8eRzY09C+q4XUdEZhZNBzF8t6WtzbRJfzLuNy0eatx601/jKc0o4DTAwk7nexuAJF1usdAzUwT0j/8/Zf45Lh5v0lzYHjLH2RgbTSBQ4zAIeVPKJMX7ZYix/WUbtfyNUEFT4egVw4S/q81fGQQpdEh4yS6aXJxNVllQUohRenCUUYJPfV4mZ5tIS77fOtndDDiVw9CvMULZghMzxn9hg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8796d329-ca4d-4033-b2bb-08df131a3dff
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 11:12:34.1150 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rBV3NTkP0v3nqeVtIvc+EtIFJhdEJ0FGN/TrvFEAW68mlNDmzUxVQ2SeIv9j92WUcQSfPY1LHnQN5l83wK0V652GKrD465OwNMZJEUKtzcI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB291754
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



On 9/15/2026 9:12 AM, Satyanarayana K V P wrote:
> Add explicit bounds checks for context and doorbells which can detect
> and reject invalid configuration data from a misconfigured or
> malfunctioning PF, preventing protocol violations and protecting VF
> initialization.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 339ea0d3344c..81d68fe5ad7c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -15,6 +15,7 @@
>  #include "abi/guc_klvs_abi.h"
>  #include "abi/guc_relay_actions_abi.h"
>  #include "regs/xe_gt_regs.h"
> +#include "regs/xe_guc_regs.h"
>  
>  #include "xe_assert.h"
>  #include "xe_device.h"
> @@ -581,6 +582,11 @@ static int vf_get_ctxs_cfg(struct xe_gt *gt)
>  	if (unlikely(err))
>  		return err;
>  
> +	if (num_ctxs > GUC_ID_MAX) {
> +		xe_gt_sriov_err(gt, "Out of bound CTXs %u received\n", num_ctxs);
> +		return -EPROTO;

btw, as we are trying to make error code consistent across
the driver, and -EPROTO is mostly used in CTB to indicate
HXG ABI related errors, maybe we should use here -EINVAL
or -EOVERFLOW or -ERANGE ?

> +	}
> +
>  	if (config->num_ctxs && config->num_ctxs != num_ctxs) {
>  		xe_gt_sriov_err(gt, "Unexpected CTXs reassignment: %u != %u\n",
>  				num_ctxs, config->num_ctxs);
> @@ -607,6 +613,11 @@ static int vf_get_dbs_cfg(struct xe_gt *gt)
>  	if (unlikely(err))
>  		return err;
>  
> +	if (num_dbs > GUC_NUM_DOORBELLS) {
> +		xe_gt_sriov_err(gt, "Out of bound DBs %u received\n", num_dbs);
> +		return -EPROTO;
> +	}
> +
>  	if (config->num_dbs && config->num_dbs != num_dbs) {
>  		xe_gt_sriov_err(gt, "Unexpected DBs reassignment: %u != %u\n",
>  				num_dbs, config->num_dbs);

