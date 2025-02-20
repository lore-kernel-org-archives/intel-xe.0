Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B62AC021B2
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 11:33:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5569010E149;
	Thu, 20 Feb 2025 11:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i96CbuYm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E7510E149
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Feb 2025 11:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740051238; x=1771587238;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tiIashOS730ZjWV1oi4pi3tN5IAsN531oiWZ62aj5KA=;
 b=i96CbuYm1nVx6ipM72w6k6eSeED7CtHCizAq+57ulvEjBZxp/PRAH2Td
 WFRgVgc8xJore7mnWainRdud4ey8yTgNctS9HwL4/Ip00Twj5HDGV1J59
 8bDwmtDh5jDCv79pBFVyyCJygyWXOvoUu0Wedvwi+PwDyzMUHhfMlo1sj
 6prKkt0IbaRD5I/AlCHoyzr3eMjAcBUbOGBvNKHYEuGmrHHSzHX5nhGem
 5fnsby7WfeD2oOwp4hXJ0YoWED7s5FfdBj1PeD68187hXeFNFhCGoGm+j
 d9t0vBrUGVC2KFCTQdOKhioPjYIz9fqAlF6llQ63j7nPYeNcgHEfO6f/W w==;
X-CSE-ConnectionGUID: jf4ZRCNUQPOTBB+QKFIs5w==
X-CSE-MsgGUID: trdK5slGTKiHbv8N7nbXog==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="40945661"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="40945661"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 03:33:58 -0800
X-CSE-ConnectionGUID: dUexea6tSzGgRswqk43NPg==
X-CSE-MsgGUID: KpDesvkqS+m6t5a3aAMuZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115909579"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 03:33:58 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Thu, 20 Feb 2025 03:33:57 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 20 Feb 2025 03:33:57 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Feb 2025 03:33:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C4mT7XkOS1vIMi+wzucsat8C7jGZbhw1e0aIp5yxyv49KoQ0c8RLPua1yOzscyXB8BDDn8ZyTiJBw0A7hWh9dPXzm7XK5mmEz70ecddOs0bK3nf/FX8psGcV9sMygXi6fTWwDug1OH+vbh5B4W3qP7HnKOGQ+LmcOzYslB6UYa8hr8L6aDhC6WqDPgzjyaOmqpCvKIO+I/FL1zaavv8/wn5+3PO32MQzgr7Kg6hDg1wiStAaq6X4UCJE7hJtGpKyNNS6Il03nOxau+/Rg9iP7CkPqpsrZr99B2yFBZumU9kv8ZWoZsDaEV2Ty6esRPnc55xj53q7hKsH4zSougKT7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+JxHJe/udfSGYvnvg9vwLud+sTRSdxOUxfdOzwBXfY=;
 b=QX4AATpdbs5s+l0mBVIURUGo4uoy0utnOqMYWf8ZLEj2Oqk6arwrFQINgryUYcTuKwXSkRUkODNUjXeOEkTfXzDReDoLFARqeF4GW+rLbDckGXF93g91JNRDSUsU52SyuGgkKYjq/VagnL1B5WWujCkBJWVcPeLCC4BpJqBN8/7levqmfrmsZ8KRdXXA0YV+pSuvC2XtOwyXHVUNfrobs3O41j5McAGyXDkmsRnwz01RfwzKqXgHFJKVPLFSaPkvhNgmZ0YotjIv2LjhzOBgkTgks0szz/xDbrVNfE01Ag+i96YmGeM3EgrA7Y0I+Xg2RCUIPcNj2Wqfbbd5F0jIGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DM4PR11MB5231.namprd11.prod.outlook.com (2603:10b6:5:38a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Thu, 20 Feb
 2025 11:33:36 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%7]) with mapi id 15.20.8466.015; Thu, 20 Feb 2025
 11:33:36 +0000
Date: Thu, 20 Feb 2025 12:33:32 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/pf: Create a link between PF and VF devices
Message-ID: <20250220113332.ugwr4i7ufm4xlqyo@intel.com>
References: <20250220064119.26623-1-satyanarayana.k.v.p@intel.com>
 <20250220064119.26623-2-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250220064119.26623-2-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: DUZPR01CA0306.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::16) To CY5PR11MB6138.namprd11.prod.outlook.com
 (2603:10b6:930:2a::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DM4PR11MB5231:EE_
X-MS-Office365-Filtering-Correlation-Id: 23a0e806-792f-495a-248d-08dd51a269b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aFB0OC8vVjE3c2Y3K0hobE5CbXJNcGxtSVg1Z2puVWc0MzNmSmFLcnYwRitL?=
 =?utf-8?B?NjVPOEptbHhwVEJzUkk0MkI1UVAweUJLVmlVZ0tFc3lYNGdESDQvUnBxNTRz?=
 =?utf-8?B?MDJpMDdBOGNFTEdCQnU0RjhRK0JkODdYcGt2V0pTLy9ibGtlTTJyK3JJNUxO?=
 =?utf-8?B?YVpvYmtvRVBCajBrM1ZDTWpqMWpsR1pNaFNhb1BWSVdCMnJsbnArZUdvMmJB?=
 =?utf-8?B?UndPR0xaNS9PSTJqSE02dngvTWNleEJJMzRNa1hDMzBDZ2xXV2dtcy9zOHlj?=
 =?utf-8?B?NmN2MllMVzN1Z0dhdDcrYUx3S2syYzFzNDd1bGVaM0czMWtvVGdva0pPbTJr?=
 =?utf-8?B?eDVRdC9vZ3gzVTRHNTB3UEUzRE5ZQUs0V0VsbEJKb21IYXJkUHc5R0NkQ2xR?=
 =?utf-8?B?MmxuUlJhaEd4dzVvclk1RE1tQk5YWnpsVHA4cmZrOWZ4c1JoQXoxMDNNWWhO?=
 =?utf-8?B?aXRNK0YyMCt5dHdreWZWVU9YUVd0QWZBQUJBejNHaWlnZGQ0RHMzblF3MDlz?=
 =?utf-8?B?WGdlT2NyeHdmaWx1bzM0TkRHc1Y0UjVtenpFS2dSa2tEOFBVZHV4cWY2Kzgy?=
 =?utf-8?B?eFVRcHErT0hCd3d5NVhvTEEybEhrdnFmb3UvNVJpaDFSZ0VOS3V5R2V1SVh0?=
 =?utf-8?B?ZEJZY29BTi9EdXI4dzNzbCtqR2NxQzBCUlVNcmcvb3Vxcyt6M2dNWEd5THV6?=
 =?utf-8?B?dFE1NHAzTnBRdjhPWDlkZUxiOGNJRkZsMFJ5YVh3K2ZxNkZxdWpwZlhlOVRq?=
 =?utf-8?B?emJkUzJWbk9ad2s4aTltMzM0MzdpYkFTV3o1cmo1ZWdZUXFWYjZDb0dXQ1o3?=
 =?utf-8?B?V0VudUxTNVZ6cEt4ZWhZWlFJVmVnRktjdVJHMHNKSElrMThuc29RblVTNzZK?=
 =?utf-8?B?dzhnbzVUUXYySVVKMjBmM3RQMFVXek5ZVjRLeWpNclFUNFBZMSszd2o5VDFT?=
 =?utf-8?B?Yk5BU2YxL3V5SHdVSGxia2VvNFJJV0Qvbi9tTk1EL2xYYU1rUlh3YlRIancy?=
 =?utf-8?B?TlFFaHgva2VHbzBvdlFjL3ZYcVBRSnJxdjE4UDJOdEwrK2duOXh2Sjg4cHhY?=
 =?utf-8?B?Ly9oZjZwa1licmlLc1BXYks3eG1xZi84KzVUV0ttVGRyc1RrTW5LL3V4aTVw?=
 =?utf-8?B?dUpqSm9ORDdlVnlycDVCV05CZzFVaGdLSHNadU8ycmVqVkhzeXJYaDBsUDdl?=
 =?utf-8?B?c3YyakZMR0JUMVlKK0NJbXgrbjkvRlZDT0VYU2FZL1Y0TldwaEpQM1htMXJz?=
 =?utf-8?B?YU0rSEdaQ0pwZ013bmxJV0c0b2VMdHhNaWw4UkE3SFEyUGxhS2JUUzM1TUZa?=
 =?utf-8?B?ZWlxeHlPTmFJa3gvaHBrUVdnNDlpOUhhUW1tY0xVQjFuYlpFQzB2ckpqMStu?=
 =?utf-8?B?ZVZxbDhIeFgrelc3aHlKcWplakpFRUVGbGtmQWV2Sk4xSVdabE9oTnhQZHR6?=
 =?utf-8?B?NVptNy9VMlpmQWh3YzY4TU1RVnErMm0xaTZYUlRiSGw3cjZOTnNUMHFwY2Y5?=
 =?utf-8?B?Tmw1eUFtZFBOaU5KQXNxcmxKK0pXb1c5OWYrczVpbksydDFPNlliMSs1Vk4w?=
 =?utf-8?B?NmhTQm9GRFdlbEZrNE5SVzh5R2RUdkhzWmMxamRKVDhHTWhuekJBRmpIUURk?=
 =?utf-8?B?THNQQ3RhT3NIaE5HYng3TmRxbElQRE1FZFFUeFpXWXR6WlR5VnpjMjVDdjZa?=
 =?utf-8?B?WlZSbCt1MFlSN0pySGp4MDNLeXVDbjBHcXNmMEtBeTdOOUlZWDNqek1hZzUz?=
 =?utf-8?B?d2lKRWlRRG00cklXajVPWk9aOUE3QTN2WG9JVkw3dHp4Mm1abGJ0bm9rSnVH?=
 =?utf-8?B?emUvU0VocWd6dDF3YTJxSXRHd1QzSWQrdVhwbUlnbnRVbnRFTUpCMjlWUEJj?=
 =?utf-8?Q?uGZ1SZhZm0ITi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVBtOWZIazlaRjR1cEtzZE9nSkhZVXR3MFl0S1lYd243c0prZVRNTEMvL1B0?=
 =?utf-8?B?Q2lnQWMySVk5UStFTitOR2YzcTl6ZituZW1BN3plR0FKZkJYZzBZUEQ1YU5G?=
 =?utf-8?B?b1czZTZ6RzlzNS80K1BHNm9yNmg2T0gvMEpVMUxTcmNxTFVsRk9ueGk4Zzdo?=
 =?utf-8?B?aWpLSmt3UEhFUWQyTzdWY2NxNDJsbSsrVU9hV0d3T0FheDhyUUtvSzd6TWxZ?=
 =?utf-8?B?Q3U5cTFxcWNvdkF6V2d2M2xIM3U4dXVBbWZMc0o1N2pTQVJIbDYyUWxTaWtj?=
 =?utf-8?B?K3hwR1ZUZ1VCcGYxTjRyMW1jWmZmWThYSCt1U3ZLd0ZIaHJBSUFpeXQvT012?=
 =?utf-8?B?clVkL1dlemU0cGoxZ0VKNEZpZGEyUTRzbG1jNFErRGNSQll5c054YmYxNnRl?=
 =?utf-8?B?emxibGQwclFJZUk2M1Fma0N5TWk5eGd4dVdUSFZyeElTWjZqWE1yREFhS3F5?=
 =?utf-8?B?M1RIcm9sckg4WFZteW92TzJpV1hxdUxMOURWWjA3SXF3UDNSSjh6VEZYbFph?=
 =?utf-8?B?RFdtT3oxbG9YdkdlVWp2OVFEcXQ5M0ZsSlpDSzBobC9VU3dXTW9oekFUTVQ4?=
 =?utf-8?B?LzBNTjRoTTFDUzhtTDdYcXROTkhUVTQ1cFpNWjd0WVBtMXZzRFRZYUVkVTdU?=
 =?utf-8?B?NUxlQ0Y2ZHdkY3BkdFZBUXY0eDNrellNckJOTTRGZGRPYnFCdWg4ZEo4akJM?=
 =?utf-8?B?WVJ2eXEvYXdBR2o0SVVBaW81azcwQjJtS1BjU3pHcUVtTExldXBpWWZ1WDhn?=
 =?utf-8?B?UWRCMUF3anVvSjBjTnh3VzhnbWJOcWduZFlibXExbVFUTUlrWVVld0JuVk10?=
 =?utf-8?B?aHRLSjR1VTlsaWgrSjVXVjYwRWtQTkRqYVI5YU5YMnBlTDJBb2YzN2gvODl1?=
 =?utf-8?B?M3JsSzRsWG84NWMwWVY0LzlmYjNjNVNEN093Z01QTEM5eDdpOUpFcGZqTTJ1?=
 =?utf-8?B?bldJaGd2eHE4QnlxNGI3NjNBU1I1eUMvQkxOZnlOcUlyRUtyU0VtMEVuMkhM?=
 =?utf-8?B?ejRCckhoOHI1Unpwd2ZZc0F5aTdmdFNjSEdoTk01Qy84NjlNUUpLN3hyUHZZ?=
 =?utf-8?B?Wks2TTFPM3VxQnZJMUU4VlJuQ20xK1BUVlJaemZGdnRiOU5vcGNDNGxyZTBS?=
 =?utf-8?B?d0NhS1MvelhHYWMwOVhuRWVSSFAveGROUGhKcm85d3BJSGI5NGt4bmI1RU9D?=
 =?utf-8?B?ODUvQkprams4anpXNjdGOHAxeFBsVzFsbW0wblgrcG9aakRKN285ZmE4eCtO?=
 =?utf-8?B?Y0phWmQ2TjFVRERFRFRqaWpuUUYvWDRMRXJCSmRVRklmdDZtNEo0QjBGWStX?=
 =?utf-8?B?NmRlM241VC9XL2t4U1B4YXVDM0pieWtBT3JEb2o0bllCanczdC94K1dGNnFU?=
 =?utf-8?B?d1hLdm1UeUVWRXVFdzZmVG5aMnBQSm4xWUNtQmQyWkJFOG4xUzFOS25KRXBk?=
 =?utf-8?B?dlRCYmpINGs2OWN6eC9NRmR1dTkwV3BCeEpOQm5mZWVGR3hwTWE4QWZ6SlRB?=
 =?utf-8?B?S0x3N0FTN1ZoQU45UVM1U3RtUHBFSkNmNFErTWhzQ3lWa29Dby81RmxGekFj?=
 =?utf-8?B?WVAxSmZxaVpsbzdrL2NZS3QxYTdCejV5cUVvZ25kd2k2YTdsdnpZR0M2ZjlD?=
 =?utf-8?B?T3ZmcFVCcWdhM2Y4Y3U3ckM3SzR0SlZyeDVqWE5ybTdqNFFkZXFJN2VDdUM2?=
 =?utf-8?B?blFjZ1ljb2JBTFJuNGpCL0RuUjNiL3dlTWhoeXEwekYzbUx0NDJKY0Njdzc2?=
 =?utf-8?B?NElnOFNjcGMzd2MvNVpWUEVNRFk3NFJvS0hIMEtxRUwrQVJUTlJGZ0RuYjNY?=
 =?utf-8?B?VTRSSUFrUXFQUzd3YkVlWUp0dmRsSXZORnllTSs2Y3Z5U1dVZ3lCNk01NXFt?=
 =?utf-8?B?czY1NWNpYm1KNk9VNFBQQnd4OWkvWmlaWTUrSEd4MDRndnhiYjUwWXBhVEJS?=
 =?utf-8?B?aTQ2QlBhQWhoOVRrYUpOVUJoOTUzbHdKcG81WHZhT1pYNHI2ZVk1UkpFWHov?=
 =?utf-8?B?RGo4V3JXL3pRUzBIWHQxNjlDaFFXSmNFMkY5R3FRQnVJL2VNUDFveTdTQzVO?=
 =?utf-8?B?czhPR0c0Qm5ZQnNhMHlmWXQwcldRaC9MdVpUMi9Qd01CTHd0Z01aM1pJbnhv?=
 =?utf-8?B?aDZHZ2xHQndHSDUrdEY5Rzc3bHlyakRUaWI1V1FiejVYaFprVXlOS2RqMlh2?=
 =?utf-8?B?dHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23a0e806-792f-495a-248d-08dd51a269b8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6138.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 11:33:36.6950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lghQJB1XCxKdISpFuk53MvqN+1K4TiDxzQ95nKMWiosmIlRW6MNZnq89wMmvFewIfHblrc5fBEpC5IknfkwdnHRakJuYKtGG95AJP8PgXlU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5231
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

Satyanarayana K V P <satyanarayana.k.v.p@intel.com> wrote on czw [2025-lut-20 12:11:18 +0530]:
> When both PF and VF devices are enabled on the host, they
> resume simultaneously during system resume.
> 
> However, the PF must finish provisioning the VF before any
> VFs can successfully resume.
> 
> Establish a parent-child device link between the PF and VF
> devices to ensure the correct order of resumption.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci_sriov.c | 37 +++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
> index aaceee748287..429e1c7909a1 100644
> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
> @@ -62,6 +62,41 @@ static void pf_reset_vfs(struct xe_device *xe, unsigned int num_vfs)
>  			xe_gt_sriov_pf_control_trigger_flr(gt, n);
>  }
>  
> +static void pf_link_vfs(struct xe_device *xe, int num_vfs)
> +{
> +	struct pci_dev *pdev_pf = to_pci_dev(xe->drm.dev);
> +	int domain = pci_domain_nr(pdev_pf->bus);
> +	unsigned int bus = pdev_pf->bus->number;
> +	struct device_link *link;
> +	struct pci_dev *pdev_vf;
> +	unsigned int n;
> +
> +	for (n = 1; n <= num_vfs; n++) {
> +		pdev_vf = pci_get_domain_bus_and_slot(domain, bus,
> +						      pci_iov_virtfn_devfn(pdev_pf, n - 1));
I think this function requires a call pci_dev_put when you have finished using pdev_vf
> +
> +		if (!pdev_vf) {
> +			xe_sriov_notice(xe, "Can't link PF and VF%d due to missing pci dev..\n", n);
> 
 I wonder if the log about the missing VF pci device is not a serious enough problem to deserve at least a warn 
Thanks,
Piotr
> +			continue;
> +		}
> +
> +		/*
> +		 * When both PF and VF devices are enabled on the host, during system
> +		 * resume they are resuming in parallel.
> +		 *
> +		 * But PF has to complete the provision of VF first to allow any VFs to
> +		 * successfully resume.
> +		 *
> +		 * Create a parent-child device link between PF and VF devices that will
> +		 * enforce correct resume order.
> +		 */
> +		link = device_link_add(&pdev_vf->dev, &pdev_pf->dev,
> +				       DL_FLAG_AUTOREMOVE_CONSUMER);
> +		if (!link)
> +			xe_sriov_notice(xe, "Failed linking PF and VF%u\n", n);
> +	}
> +}
> +
>  static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>  {
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> @@ -92,6 +127,8 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>  	if (err < 0)
>  		goto failed;
>  
> +	pf_link_vfs(xe, num_vfs);
> +
>  	xe_sriov_info(xe, "Enabled %u of %u VF%s\n",
>  		      num_vfs, total_vfs, str_plural(total_vfs));
>  	return num_vfs;
> -- 
> 2.35.3
> 

-- 
