Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FDBEC43458
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jul 2026 11:11:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB0510F7AA;
	Fri,  3 Jul 2026 11:11:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iTsszm2s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C13810F7A9
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jul 2026 11:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783077068; x=1814613068;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ajj6Slxnupt/eyy9a+8ZKb1ipAQ2UVRBGv/Ee7206yg=;
 b=iTsszm2scoDlIflEpIDggFakuWEQKOpqZsTTPgMPrjgdcB5+K1/K26KF
 m0/Dg8QGOGVeMc5ity7GoYhtQ13j4WJt48Zg445oODOEJEpb5g1TKOAq3
 vX78O/Nv7vyEaaNwQM0sPyB5oBd9u6XGwjhtKg+HaBja+Bnf4z21ZlTOK
 6t5r2kL7AgG+P6fjmtLzQWd490/LPK+EceyYi51C1ZzdonlUwFvQECEj9
 Rh2DcR2ne+ZXjePDqgS7N/01X1fhboHBKPYe51NDpnIgsPdsNKl+VpTZC
 ofH6SD9vHnIPcLx/Gad8y2Cijr9prDMbT2hk1J0k6kmz+6dFGCi8n6JVV w==;
X-CSE-ConnectionGUID: V/gkfSlRR4m3XWkbWYOXNw==
X-CSE-MsgGUID: gHxlrOY1TWW4ZtZMbbedvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="95207552"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="95207552"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 04:11:08 -0700
X-CSE-ConnectionGUID: 1+dK4shLRrmRpFUkaAulhQ==
X-CSE-MsgGUID: VL4EKaozS1SCgZtrC+0x0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="255008172"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 04:11:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 04:11:07 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 04:11:07 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.9) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 04:11:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kj+p/3D5R830gpZS4akwu7cN3WstzpUG0wte5kKreQGqmEjclg8RJiSwlCW4ZG8NqBJBLl2frebI7tnao2bmpHmYJ+uf4SqrycJNeVYSYrRq6FX9I+lQEIU1AEpBBUmBXMZbOinE+nJE3eWE1RgPA8GiHyagu2u490a6pb+J5ScUTDKJXSzteBuUMWF6ok8mBWA6dLWOJ6EwbUIDU8RxZOBSdrqdUxDcRPp6jE+GYpcvi2MFp7t6l/rtwYePdBNb5ngD8Z1ebFqD+fjF5rNwd8jFZedD9P98UfckuDAuIKScsOE4X6BOCQ+dvQHaO7JxhMskHN2oNnnNBGQdYul+6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPPFSCA7e8FO8T1g9ETCkfSG+VwTtoQYgoGOfbg7OKY=;
 b=quoPrDmN5emZyOivWBCFVEjt3A3dkKk/PhGhyo/bZTH9Fn0Ck9VZn4/AulAkLJpfftFdeL6hJPFRhyJEuGA9wsOSoP1EXH7XtyCtxIDWHWsCGY1rGW+oTVcdP8T3+M5aeo5zY5x88TyixRIkbLX/T6Ond15V1eLHB0B217ScTqghwmX/VlY4IP+CvZxnMHDjOhJcvnm7yGe0VDEibhe3J2EbZLUDHsEBu4iyd9kjmsBGDO9sCcG2VWYqhj13ACkvVfQ9o2D8viAx2bBviKRTI/MPtDt4veskuFe8qcqaGcXMlUyLZfR+lHCJWa2D8BS5loBF7mlkQsto7J9Bdu1JzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8132.namprd11.prod.outlook.com (2603:10b6:8:17e::13)
 by SJ0PR11MB6624.namprd11.prod.outlook.com (2603:10b6:a03:47a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 11:10:57 +0000
Received: from DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac]) by DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac%3]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 11:10:57 +0000
Date: Fri, 3 Jul 2026 13:10:53 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 01/13] drm/xe/guc: Allow to print single KLV
Message-ID: <akeYmV_mjo593yWI@nostramo>
References: <20260630132633.32804-1-michal.wajdeczko@intel.com>
 <20260630132633.32804-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260630132633.32804-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: WA1PEPF00005B9A.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::638) To DM4PR11MB8132.namprd11.prod.outlook.com
 (2603:10b6:8:17e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8132:EE_|SJ0PR11MB6624:EE_
X-MS-Office365-Filtering-Correlation-Id: 602c4766-a7b9-448c-08bf-08ded8f3c183
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|56012099006|22082099003|11063799006|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info: 255ugWmXDeFd2OQxy9yu1+itqUmVx+mA9/WFgHLpVeefSGxuRoBrBayMZYOYhzsr6YvFbzhow713wOI1sl9I8wYx6xBe1e9lQ5IzQKzuJN1dOhSuuT7rcdahhR7Qf+JyO2O+lipKYmD2L1eNA4bdBgolTeaaDjGtC72YFyM54Xwlel7BKVM90AOmgGPMI4Wl30YhHxU7BdetDwNo35S1SoN5yRb8FcbW7JtU5xOuO6Fc6IPLnP6XZzR8KBNeU3GGxDDVou+N/RtLKEopr5Vgfxm9prL2175/By+QqwK4Legh4dBF1OwgsswIOaxEmRXONmQSYF6RO38hRtbqJYfo2lQEDf2vByb0GPMfQpCOekOqGuzC19bCO9dK414Sp6EjRytHpwC6ggn242NpnMPhX0ohkC3EQHHO0nZQCTLuDc1X+duo/uYVPa72iCUVvQzE8EuF6sGjJAwXSZaxDVBV200uQuyjmwseWLMqeAvHPMX8sjyPVmxH2zcpCcup18nDgLwq2QaNs4wLsVK5bS2Ra5ownTzRvsLVIhRa/MzmCgkviWxz5JDPouSbQXdKl0N4UscNgHvISsaMOQwaDiT+FxkMpy6n9R+882PGPZpbIdBg9Fc6nyV98+mogIYwoFJlGL5e1GRPVABau4wCBy/BGNhAq4kvI6Nbl7sLLWK3sfg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8132.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(22082099003)(11063799006)(4143699003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cW9oMitYaEZQMHpncUltaTJkZ1lKeUFxdk9ra2RNUXpuQzRUSzZlcTNjTzhI?=
 =?utf-8?B?MzdLYVNLc21hNFBqeWFqN241MUtmTVRDRjdMQjIvcGs1anZsdUFmRHJGVjly?=
 =?utf-8?B?VWFkYzRsUWxtU3habUhtdlB4NU5SM2RkN3kwcjFCdEx3bHlVSlFCQ2N5Nlgz?=
 =?utf-8?B?aFNjMmxhME9UTXhMNHlxSmh6WUNqY0h5KytLTDhqUkJ4Y3RvUEZDS01NWitV?=
 =?utf-8?B?OG4xbERLRmhtb2JuVXFXNHhpU1ZXVklqSVhEQ3I2TGZKa2NKL1BWS1grUVBK?=
 =?utf-8?B?ZmxrZTdXV3BTcE90STltM1hBT1FDTnNtZ3dhSHdUKzFDY2VucjVZN0RuRXQ3?=
 =?utf-8?B?cTl6WTZWS0Z3clhxWnVEb3NTaWQxalNxUmtRb1A4MG12MmlNb3kvN2IvMzhG?=
 =?utf-8?B?dSs0QnhqUHo2Ny9idVhZN09lR1B0cWJNejF5L3V0M1RtejFMR0Z4OXNyaWUx?=
 =?utf-8?B?c0dNcW5tZ1ltU0U1SzR4NDduUXE3b085dURMcVYwYXpIQXRyTE5GNEFlZTZp?=
 =?utf-8?B?WVF1TGxkRkJMLzBwV1hhQUVrN20zUFl3bnlocWxQMFdKK3U3dzZyTlpyNXJO?=
 =?utf-8?B?ZG5HamNkajJQbllLTGFqQlc1MG9KR2Y1T2REcWVWNEtpVXQ3YzBRWHJvNE5I?=
 =?utf-8?B?SDIxTC9vNmJMWmltQUJ5dVk4TFE5cFp4ZmxIaGNlVW4vNG1jMndZSkM4N2FF?=
 =?utf-8?B?SVlyT3U5aGlyaGY5Vnd0WElFZDB6QXdJNm9ZT3pCVDNLSWFMT1pPN2JkUS9T?=
 =?utf-8?B?N0xmRHIvdzc0N3pSNnozcWhKbUNSZWEyRWhGbnVOLy9CMkdKQzBWTGpkZnVU?=
 =?utf-8?B?SU9LeHpYZXdRVWtnYnFRUW9EOU9tUmlER0drL3lTRFNmZW0xdy9IZ3MrMHZy?=
 =?utf-8?B?K3l4ekRWdEFoRHVjTEhQTkxrREV0S2YwbUxiZzJCYUVCeU91T0R2akZ4MGF0?=
 =?utf-8?B?eG9mQnY3L3BOejdaMG54eFloUTcreGpQbGFWbEFtL1YwOStvRkhOYUw5cFVF?=
 =?utf-8?B?VGRsSHBBVzFxd251cVgvdDUySTZhZ29KbnBzRlcvSGRrc2hIalRoa1UzNXFW?=
 =?utf-8?B?alpTbkNKU1RhR1JBTnd1N0FuK3R2WWdzVlh4YTNLTEJxSW9DRnlhTUxrTmJr?=
 =?utf-8?B?a3IwZHlVS0h5TzV3cDhHSDhCaGVMUkwyNnhLdnBuWTNXL0tZcXdpU1B1NlJx?=
 =?utf-8?B?NitUTjkxZ2d2bXZtSkRCN2NNRjFUNG5uYnY4MGhqeStXYWFuZHZodDdrLzdw?=
 =?utf-8?B?ZFpqVkNJZUdzTCtwY2o1SmhDMDQzODVWc1hoL3ord256UzNZTGFqWUNSNjVk?=
 =?utf-8?B?UUU1VWorZGxjUzVRWjhiQldySXpuRE5veUROaTl1R0xnMjJVUmQ4RWY5UVMz?=
 =?utf-8?B?aTkwK1E4Y0xWQ2taeGNhZGRXLzJhNWJIZkpubkhBc012aVhNYk1LTGJCR05m?=
 =?utf-8?B?Q0FWaFU1cUE4K2FZU2ZYUWJ6N2RXQ3lDVHFweDhvb0N1YVhuOG5BWGk1cmgv?=
 =?utf-8?B?MUgwSXdabUVtRTJ4c1dkYTdmaU9pa3F4Q3lNbGhQRHlPcVZGQW5sRXVuMFZD?=
 =?utf-8?B?czNNdnN5Q0x3cG80RUsxN3NZTTlsS01PaFVxbks2em16VlZoQzhaRmYwak1x?=
 =?utf-8?B?RDZnUE9yaGpsWElVMFFZMXhnR2NUMkNDY202bmdlaXNSK2o2UVNIN1RtSURh?=
 =?utf-8?B?WnR5TEJmTWJIWENwaW1hNjN6WWZhNlArVGw2bnFNU0U0V2g5TTA3T2dVUDMv?=
 =?utf-8?B?V3R4NWVSNkM3YXRQbFRJS1d1OG1BZzg3SEQzK21tdGZ2R2V0ZldXVzU1MklW?=
 =?utf-8?B?aWo5WFRVb3NRMFRWWVdwSmNYeUM5SERhbm81TmhwRjRuRkpuZ2kwMXgwQWp4?=
 =?utf-8?B?cHZLcW5vY3czc0pHc2pMY09SNzE1M2NLN0lCNDZhOGNkYUh5Z0htQkJ0NlNi?=
 =?utf-8?B?Vm55WlIyZzZ4L3d0SnhzQTJtRVFzU1hiT2NmS3dHU1lMdXJoSFIwbXVpRmRl?=
 =?utf-8?B?T3c5WWZmSXlyR0NqK1FJU2Rvb29ZYmZBdGNYSzJSWDY5bStWZXQ3LzZmUzg0?=
 =?utf-8?B?ZlpOSmxwMVJ6TmlOTWhJY1VzK2JLQ0RTeWxCZHRmQUpsUFNXd0N4aUlZekxO?=
 =?utf-8?B?Q0hNTW5PSU5OQ0NZMUQ4TzFZV3pFajI4ckw1WWcxanZNYWFBZ3ZCcEVHdmNv?=
 =?utf-8?B?YmVSS0pFcnBRbXdOaTNjOWk0ckwwbDVyT0RQR3JGOUVFTW1DOVpGRWxvZmxM?=
 =?utf-8?B?Y3lNdWdKa3NiYW9vSDVwVXhsenFZWUZDbFFoTU5VWVBuSDluZUJRNSt1emU3?=
 =?utf-8?B?QzA1b2dHeHZHcFo3UVFsRHRvNlZGVFdiU2g0YXM0SFN6S3NtKzBHa05LdnZ4?=
 =?utf-8?Q?XvtJGJ5dXdje2N7g=3D?=
X-Exchange-RoutingPolicyChecked: cd96NxAZNSL5CiuZ6LoA3CSE6rIqR9sPex27OAhi9p8jDlEXeCnAuKSvrg5gHVLArheGlV8tdxfojX1nwO24mTVHDvOjNzCtKw3nne29HKJ8KMc8YKsrSd8idcTNdxVs+d2bVZ9sRfEl+Jf5Ckz0V6kyiGZi5EAAPomH0mmGB/T15SQ/r/G9bGNJvbXE0NMkNo8cmBWqEl/Bxlk7BG/BUCPrEecjjvyYDC9LDg59b4LxT6xiENoq4R5uRJPRkH9KMtKSdYiLBtDdK94MJc2F4MGTKjz0JpgXqnXhzjU+FpWJkC1FVzIKEBx2VdFYMIr11YCsWstWsmIxqeBN0dFScw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 602c4766-a7b9-448c-08bf-08ded8f3c183
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8132.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 11:10:57.0729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zAvvNN5IrgR47UxK8tiEf3vq+G3OaH0Os63MpMK1oKQdukx2M8zBkKD0T4F/gLun+2Y95ehGiX69YhiJo3xoPajyFK7vQhsy0wPKITzaEaM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6624
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

On Tue, Jun 30, 2026 at 03:26:20PM +0200, Michal Wajdeczko wrote:
> We can decode and print all KLVs from the buffer, but it might be
> helpful also to allow printing just single already decoded KLV.
> Extract existing code into new function and make it public.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

Thanks,
-Michał

> ---
>  drivers/gpu/drm/xe/xe_guc_klv_helpers.c | 54 ++++++++++++++++---------
>  drivers/gpu/drm/xe/xe_guc_klv_helpers.h |  1 +
>  2 files changed, 35 insertions(+), 20 deletions(-)
