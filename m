Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F4ACD342F
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 08:15:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0001510E150;
	Tue,  5 May 2026 08:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gtUhD5PM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 525CA10E150
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 08:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777968914; x=1809504914;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=a8wSk0MU4CyGyiQxiXgq7XtJsCOTJaTEODg40hhg81g=;
 b=gtUhD5PMqxWRWBuNjtqhjdBG7NrjfrDFiOF40hm1AafzZTBkyo8ow4gN
 saOmAiuXzEcKcmblYIvSswyKRNwqxXYV/0tSpi0pAi+/sBTGwZPUEEjKJ
 1cUs9iKBQ3/4q+LUSX2c7p4RAm8PFu9eex3YA55fEBp7eFX4V/WfrsgLd
 IFSdt0ikkZRz9iklyYmk5bmOZ7GHoYm15lHwdoEd5kPph8NjTwLWhMpNK
 7tt3JdmH7nFkFKHNOJnoaYECfal+GWDV7SCaEfMxlycrc5IOODNnkNjFG
 IVOOZq+eWc0MW1nTNOuHMaPj4BOLDsga7lvdrwSFy1wiqQEUxCZkTRPar w==;
X-CSE-ConnectionGUID: UTbljE6oRlGkmimx8TdnoQ==
X-CSE-MsgGUID: vbdl5jreT2unbPVvRF5xdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="66360491"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208,217";a="66360491"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 01:15:14 -0700
X-CSE-ConnectionGUID: 1DQDru55TauWz35sBVXMFw==
X-CSE-MsgGUID: lMTifv9iRuqBONRsRAyC+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
 d="scan'208,217";a="232610466"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 01:15:14 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 01:15:13 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 01:15:13 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.54) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 01:15:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eG0fC3g0OSuQ6We0iDLDL5HnqataNWuaLbvMohbP6GwWm1QRm/Aoo9/vjQvcwCW1AgyUU0EUn/ZiSee4JFKyWwbYKavXFdR4oPWL4cDO2lQi6p75+n4RCtLcCewMQ5RAL3KNgMQj8ZVDCrggdfB5AI3KAQi2npglwF2jr5tCHNWo6gaDT1fb7UmttugvXu9gWbuGsDxSh0QMnaYdHo1B4fJSLrpCms/uyfAm884Pjq9FyNMlg4zxTvcJ4/Qy36y6qKO7w6giUC8K+ZW7yEpC9GRPcYbkis9khJeXdUZMIJkdYeW9g0SW7XAJRgKgrprNNpbp4gvTJU5xbFm9dL1WVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DOVwiADn3XUS78F/7ggp+vDNuBKLZSsdzEpa1ZXAuD4=;
 b=A+/aOm/YPBf7mLE+qweqhOav79K/x4ovYfcZ5KUGfq7Zbb9GRBRD9RDUIgmAxFu0KR6kgzaJ4DrWj8jqE/rh2FYJLZNBOU06Uu9oiGqLdpOVO/X0C4+Jenu1QhpN0dOS/rgcdVIPIxvEm8BvySpO/hD+D7o9umP1G5qjUKkvxdlAZVzY1l32k2Lzcq0M0BgYlDGDwU9h/yvyi47gw2hFACZu3FsBeu/tksCrcHS+tW31ohZkDqVkJfjnhxOF11fVGX1XVIkdI4Tz/SKsC2fa6s1SMK8A6O+TQpnr+JgFKbAYH/bLKF7FadaNjnaTrcmVd1SXmdCNmmHboXpIX+qQXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by PH0PR11MB5048.namprd11.prod.outlook.com (2603:10b6:510:3d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 08:15:10 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%5]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 08:15:10 +0000
Content-Type: multipart/alternative;
 boundary="------------DGniJIYmai0VhKvJOmxfgtsO"
Message-ID: <a6bc1c52-e070-4c4f-a331-b1fe008632f6@intel.com>
Date: Tue, 5 May 2026 13:45:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH V7 05/10] drm/xe: Extend BO purge to handle vram pages
 as well
To: Matthew Brost <matthew.brost@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <himal.prasad.ghimiray@intel.com>
References: <20260416074958.3722666-12-tejas.upadhyay@intel.com>
 <20260416074958.3722666-17-tejas.upadhyay@intel.com>
 <afLQGypRcDWYSAjb@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <afLQGypRcDWYSAjb@gsse-cloud1.jf.intel.com>
X-ClientProxiedBy: MA5P287CA0177.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::10) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|PH0PR11MB5048:EE_
X-MS-Office365-Filtering-Correlation-Id: 77e97433-bd6b-4b1b-482f-08deaa7e6c89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|8096899003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: x9CQsG8X7bt0wCBTIqsF9wWX9TFw7DOwJqLvqEvv5HRdqbzXlaxLpqT6U+mtNoraImsgsh61t8zgNoyWcBVtV3rJMKIVP/iznUKxk7C1hVPro2k1IOVcuK2p4PXkdoWyhKDc8BubzhwPqy/HFQV8jHzjULpn5nuwVvAref+f5I4DGIalnJGBW3AcfPJKc5oPVjd6Wvm03rdPe9hl7IAFyNByeoUpmPBKxAOIHIUlaEZL4UpXQcGim4uC+NKfmySHobLy1hhlM+8jd674IoPnqQm8EOO5e+aYWKASztGkrqrzNRzsZDGehleBZnASjyAs8adtnquCa//OzNhaIAU+9FPVsRPotAxN2xfkvRZrnGoufYIKBZT2ht4BJSMEgVef1aWmlzEIOaHlFCLDVjKPixyVmc03nnncKZCTYSqt2cDnYLvSFLT2t+FublIwPT9Dhi/UoPQB9wXuYs5dplA3yJmRWRzIJ/3aqTDxaaj/PAUOMyziVbb20ZU2qAmY9JdzckAa5MbxIST0+GTW6q+czyLVm0uWbeCDHQ9AVUKReu+xYPZ9sF2ftu1uULh5VAYi/msIw+/bgxLlW9SB1jeQ7ADKKxc64IdpSeEjj57pATf2E+LR1tDzqe1P3tKb8ksPUamITY9A4xXtvNP+YMwZWxEDMSLPAqXv68SrexpLWlKsUCUsz3095cGrx55w7Uzz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(8096899003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDB4YmdNamVMTWlaUnNJZE03aGxCWlZDUElhWHROcTQveTJ5dThZaG5PZkZG?=
 =?utf-8?B?YUNZRlV1aWpXTG1HMmpER0gyUmlBVmhhdDBhZ21zellhb0hmWUQyVER4aXJ4?=
 =?utf-8?B?Q3NJL2dQWTZIcVZWY2piVjd2YXcvYXdPd0hXY3NaVVFBTXVFMWNJUnBwcnVu?=
 =?utf-8?B?MVVpZEVvZ29TN1pyeVVYMW01cmNPdncxMnFMS0V1aFhacjVJazFoeDhneVJo?=
 =?utf-8?B?Qmhuc0htSkw1alJJOUJ4a2VENjRHVFd4YllTY2g3SWxocXMxMHdSTi81TENz?=
 =?utf-8?B?MGUzTFo1a0dXWXhEVlpuMzYxZzNiaHl4WmpsemVtV1IybnJ2SU00Yk1lbXgv?=
 =?utf-8?B?dEhLZDJLbXF6TGVsS2dGUGZyZGJEZUVJNWZIS2pKaGhnS3dnZitxR0J3b2Vw?=
 =?utf-8?B?cm9WeTkxTEp6OEx4cENPVElEMWN2cmZmR3c5Zm91SG5oL2NiRkJ4SmlLZTBW?=
 =?utf-8?B?RVVkai9DcTdtczhlMjU5NExHdVdmb1BLeTJ3WmVzZGU3NmdiUTVHeE9QUERT?=
 =?utf-8?B?UVNOR2ZLcTlhZk1TRWlxWit1U2RTcXJ6REswNE5ZVldiRStWWWpGdmpUV0NV?=
 =?utf-8?B?cEg4K0liVm0rYmV5b3JGeXEvU0xOd243eVpQM3YrRkUwbEk2bzNPalZ3RzZk?=
 =?utf-8?B?K3Q3SWFsOWJ2ck9uOFY2aGdBYWtXaUsyZEF0MUlNcEtBN01uZk0rUk1SUVF2?=
 =?utf-8?B?aGtOR2hDalRiT1BhK0ZXVTBqWllKT2xkMCtuUStBajBUVEJUY1ZPU05uSG9U?=
 =?utf-8?B?UHNGK05ENEV4cGRkY0ZNem1Lbmk0ZVJQODdybElsZjZqYm43NWZDSzFTbUVP?=
 =?utf-8?B?ajNzb3lGTTVHUUYyR0dUOFRQZXRwWWZ5K1NoMGZuS0U4VnNVVXR6Q1ZiUk5P?=
 =?utf-8?B?emRlUFlqd1hDamJYYWxwVGFlTU9CY0YvSU5CdHVsanAwaVhDYUhobkEvdlpq?=
 =?utf-8?B?K01wK0hEWXNPdEQvb09sQ1kydHlON2VjeVNRZkdjUUp0ZjF3MlFlZWJBNVcy?=
 =?utf-8?B?L1k1NXdKMjZpWFFrZysveGUwbmxwTEhkSGVNeVp1TE1MaGNTb0ZpL015N0pZ?=
 =?utf-8?B?Uk1pQ0wxL3BGd2VTdThvcXpvRVFOaVFQTUoxdEkxMk5qVVRWSkg3TE1MK0tu?=
 =?utf-8?B?blBrQ25nQk1rdEgybWxPQm5adFJPWS9UcnVLd3RKeEE4dEZ0RXFHRUUycEx6?=
 =?utf-8?B?MG9xcXhDZkgwdE15amRrNzNNNG1EMThsemxiczk2OGNSMjI4MEsvK3oySnBn?=
 =?utf-8?B?V1c1SFErWk9QVlZEaUdWQkxiRWVZRDhkNzNsYkhNT2gzTUd6YVRGMXFpQ3Yy?=
 =?utf-8?B?VzdjWVptR0tFTE84S0dxeGRMU1RmRUhIY0dPZXpiR3FIUjBXS3YvaGFaM1V3?=
 =?utf-8?B?UTdOS1RlU0Z4NXBvUll6STE2c2tMVDhtU2lrc1ZQMDRSOWE1dHFPa3IwdktM?=
 =?utf-8?B?ZmMvQURLaUlMeHhRekVyOGo5dWtXSTlYcFJvYXd2dU1BNUxWVnpsdU1Dd0Z5?=
 =?utf-8?B?UnRldFJRQ0ptTnZVR3N5Tk9FL0M0QjFwVGFEbnB2Wi90c29pWFRaZS8wOFhQ?=
 =?utf-8?B?RjYwK210bno4OWdKRmg5U2dBNkVKenMvbU52K2pMNFhiVFMwRmJidHhPTWJn?=
 =?utf-8?B?RXE0aUpQNUtVMjU5QU9qQXFYRWRSaVhxaDdnMThkbkJGSmViUnI2VHlrOWlG?=
 =?utf-8?B?OHNHVzRiT21ST0srUEpWZW5JakhQTTduUFMwUkJ4WkpRY0FBWFVCR1hOR1BG?=
 =?utf-8?B?WVZlOHRkUGRWamRrSTRFOVpINFEwSmNsYmI4cTZhWWxNRzhXc0N3cGl3UFpl?=
 =?utf-8?B?MUhSdVhrOVVXbFQxcW1keHhnR3VPZUNrK2xJanFJMEZOVWc5WmxHdU04Q2R0?=
 =?utf-8?B?RVFWMGl0WGhJNGZ2OElUaW9WZHEwV2l2bmRJU1hRNEZvcTZrNGZaTHpmMm1H?=
 =?utf-8?B?Q0h6c1BRZ0hka0RpT2JScGZBQW13M3Zlc3hDQisrN2pxeXZlSll0UzdxcFZC?=
 =?utf-8?B?S3JxeE1Odi80QVZwV1VWOXhiUkJnZ2Q2eVp5U2h1Y2pObUx2K1ZnV0t6bEdG?=
 =?utf-8?B?MFVXMlJaVHdVZlowSitEY253MFlvdlc4L3djak5paXl5MDlac1l1RkNuTTdo?=
 =?utf-8?B?SWh5TlpoYVM0VnJDcHN1ZDJ1QnlGYzlLcXBnRkhRNFNtWmFPQ05NUXRQendx?=
 =?utf-8?B?OTk4WTk3QU1kQ3lOUG00MFlrWkhweVR4SEkzT2FNQnpXSEQ4TWhhM2RSbXR1?=
 =?utf-8?B?K3ZtNHIxN3k5NWFpWUhlWXRUazRHU2F5OFp4L0xTZUFFMmdPODY1KzFrWnBt?=
 =?utf-8?B?NmJUd1FyNjlCMjFJOWs0ay9lUG9YdGphNGNBWldkQW1xRXpNQjNMZz09?=
X-Exchange-RoutingPolicyChecked: HHjmrSy0i8kpl7ViiL5LWxE/xJ75TvvI2DuCEnInTbNJ0eafvxNFf7LVP9yG8KaDWiir5CGmEDMQB/OCsnYNSqng+8RKhBbKLU0lRF6lwUWhGDJxrriBvWfmULr60zDf5THTLNpHQ3cDHP+XJQKQA7tzA8LxoznwRTNgljuYycKeMhF0M6sbdaiL6wuyF/v6xqbQhvgY6sdNNGlxjt6LrWhX/Ff1tW19hjzYN/HLL0XSv5yqTgqxQ/7woAfxuzqcqtAqmrC94zjr3BWdheGaHDs6+8mRVP9J3zmCCl8x5js4fmDhqRtedlJV7adKRxJqVz31h4j0f4CijD1PBdFzzg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 77e97433-bd6b-4b1b-482f-08deaa7e6c89
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 08:15:10.5749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EymSGWrQq+RPhO1dR6qPkApfNL/gOoaDlWwWOQEk6CjIYfyx3YSQOIpVHIkFGqB7NoerZpdB/0IlaAlqamEqqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5048
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

--------------DGniJIYmai0VhKvJOmxfgtsO
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 30-04-2026 09:14, Matthew Brost wrote:
> On Thu, Apr 16, 2026 at 01:19:54PM +0530, Tejas Upadhyay wrote:
>> Recent driver update introduce support for purgeable buffer
>> objects (BOs), extending the API to include VRAM pages to
>> better manage memory pressure and enable memory offlining.
>>
>> Signed-off-by: Tejas Upadhyay<tejas.upadhyay@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c | 5 +----
>>   drivers/gpu/drm/xe/xe_bo.h | 1 +
>>   2 files changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 5ce60d161e09..04d3b25c7c8e 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -903,7 +903,7 @@ void xe_bo_set_purgeable_state(struct xe_bo *bo,
>>    *
>>    * Return: 0 on success, negative error code on failure
>>    */
>> -static int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
>> +int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
>>   {
>>   	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
>>   	struct ttm_placement place = {};
>> @@ -911,9 +911,6 @@ static int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operatio
>>   
>>   	xe_bo_assert_held(bo);
>>   
>> -	if (!ttm_bo->ttm)
>> -		return 0;
>> -
> I think blindly deleting this is fine but I'd run this by Arvind to make
> sure in normal purge flow this won't do anything bad but afiak in normal
> purge flows ttm_bo->ttm will never be NULL.


The purge paths (|xe_bo_move(evict=true, DONTNEED)| and |swap_notify|), 
|ttm_bo->ttm| is always non‑NULL. TTM allocates |ttm_tt| before invoking 
|->move| on a populated BO. So removing this check is safe.

~Arvind


>
> If not then adjust the existing call...
>
> @@ -978,7 +978,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>           * The move_notify callback will handle invalidation asynchronously.
>           */
>          if (evict && xe_bo_madv_is_dontneed(bo)) {
> -               ret = xe_ttm_bo_purge(ttm_bo, ctx);
> +               if (ttm_bo->ttm)
> +                       ret = xe_ttm_bo_purge(ttm_bo, ctx);
>                  if (ret)
>                          return ret;
>
> Matt
>
>>   	if (!xe_bo_madv_is_dontneed(bo))
>>   		return 0;
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>> index 68dea7d25a6b..9f55b3589caf 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.h
>> +++ b/drivers/gpu/drm/xe/xe_bo.h
>> @@ -500,6 +500,7 @@ struct xe_bo_shrink_flags {
>>   long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
>>   		  const struct xe_bo_shrink_flags flags,
>>   		  unsigned long *scanned);
>> +int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx);
>>   
>>   /**
>>    * xe_bo_is_mem_type - Whether the bo currently resides in the given
>> -- 
>> 2.52.0
>>
--------------DGniJIYmai0VhKvJOmxfgtsO
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 30-04-2026 09:14, Matthew Brost
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:afLQGypRcDWYSAjb@gsse-cloud1.jf.intel.com">
      <pre wrap="" class="moz-quote-pre">On Thu, Apr 16, 2026 at 01:19:54PM +0530, Tejas Upadhyay wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Recent driver update introduce support for purgeable buffer
objects (BOs), extending the API to include VRAM pages to
better manage memory pressure and enable memory offlining.

Signed-off-by: Tejas Upadhyay <a class="moz-txt-link-rfc2396E" href="mailto:tejas.upadhyay@intel.com">&lt;tejas.upadhyay@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_bo.c | 5 +----
 drivers/gpu/drm/xe/xe_bo.h | 1 +
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 5ce60d161e09..04d3b25c7c8e 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -903,7 +903,7 @@ void xe_bo_set_purgeable_state(struct xe_bo *bo,
  *
  * Return: 0 on success, negative error code on failure
  */
-static int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
+int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
 {
 	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
 	struct ttm_placement place = {};
@@ -911,9 +911,6 @@ static int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operatio
 
 	xe_bo_assert_held(bo);
 
-	if (!ttm_bo-&gt;ttm)
-		return 0;
-
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I think blindly deleting this is fine but I'd run this by Arvind to make
sure in normal purge flow this won't do anything bad but afiak in normal
purge flows ttm_bo-&gt;ttm will never be NULL.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>The&nbsp;purge paths (<code>xe_bo_move(evict=true, DONTNEED)</code>
      and <code>swap_notify</code>), <code>ttm_bo-&gt;ttm</code> is
      always non‑NULL. TTM allocates <code>ttm_tt</code> before
      invoking <code>-&gt;move</code> on a populated BO. So removing
      this check is safe.</p>
    <p>~Arvind</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:afLQGypRcDWYSAjb@gsse-cloud1.jf.intel.com">
      <pre wrap="" class="moz-quote-pre">

If not then adjust the existing call...

@@ -978,7 +978,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
         * The move_notify callback will handle invalidation asynchronously.
         */
        if (evict &amp;&amp; xe_bo_madv_is_dontneed(bo)) {
-               ret = xe_ttm_bo_purge(ttm_bo, ctx);
+               if (ttm_bo-&gt;ttm)
+                       ret = xe_ttm_bo_purge(ttm_bo, ctx);
                if (ret)
                        return ret;

Matt 

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 	if (!xe_bo_madv_is_dontneed(bo))
 		return 0;
 
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 68dea7d25a6b..9f55b3589caf 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -500,6 +500,7 @@ struct xe_bo_shrink_flags {
 long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
 		  const struct xe_bo_shrink_flags flags,
 		  unsigned long *scanned);
+int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx);
 
 /**
  * xe_bo_is_mem_type - Whether the bo currently resides in the given
-- 
2.52.0

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------DGniJIYmai0VhKvJOmxfgtsO--
