Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 195E4CA0FF9
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 13:35:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4D8410EBB5;
	Fri, 29 Aug 2025 13:35:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JgTQ6qdA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC4710EBB5
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 13:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756474539; x=1788010539;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=w/NVAN8969inHVYViVrNikW7RJk3Tf+yWfFeLx1W8tI=;
 b=JgTQ6qdAnLektbUz8tz3u2gDFo0vMHVFUyVS/wR8GQmoZ3vJ5js9XpCN
 lu3OISRI+iDhKGWMjxZ4qlOuUJRChvMsv0v8HvB3MeHXhpDw2GVuuXwV4
 9aGjHC93jiSL6UzCBbSdf7QRqgauqSKRyHoCBLSOa4ZFOhNqXeHoPDwaM
 qz8hcSkXU3asbMVZnS2zsFe1v486C29Vtdg7KEQ0i/6jLdMD6z+1HVvaD
 JQGbQE7+0Fc+2Cdu3e7Ntga59jxVB2dE4TM2Jpr6nbVd/7oSEmMyDM9yp
 yg74OwckAWsbh362Qw41UVgsKR8FetkNmjFFDXA/flp6/47nePgrVflHp A==;
X-CSE-ConnectionGUID: kQV0RoR4SWysixcuYMsRjA==
X-CSE-MsgGUID: dC375xyDTaCqlO2pqi8XBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="69860733"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="69860733"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 06:35:39 -0700
X-CSE-ConnectionGUID: 0K4xblvvSHm8NiEwUTmpzQ==
X-CSE-MsgGUID: B7i3cMxXQ7uWvCJ737QQNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="170287625"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 06:35:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 06:35:38 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 29 Aug 2025 06:35:38 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.71)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 06:35:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dSqsKthG4tpctmS9cIqLb3rWTy4pyDttaeLU3ge6QQ/ViH3tyykHlTZpz7d555dyYmXeOzPYIw9mBCSWJxFA+AVEvVVWhO8kzP9n2zTtmN7b6RzWm2Jmy0/H7L3ulrRKnCqFJ2BjqcnLt6Mwek7ntoke84AS86eDQaR0So6Vr0GmiF4PCDCjy+eqK77T6p2aH7Ua6O34DWhlAoUKWI52RfrW2EmnKNBChNG7a00DN1SyjP010OO7VNw1dpbnujLIt3UC0fDlskK7sC21LHTQhhlkkR3rU5Fi0DYZasIBAHvxq4X34D5IdHkeaT96w8IPn3qNbVgqzq8G74T9f0y8UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=juqZ8G98dC2Nq3pQ+a5/YvWATD6/TGMroQIunN8jmTQ=;
 b=rleaxxf1txKijx+7UydpCoTvdW3PQRNJvVY+yKug9Z7R/qDWsYxGsxUyWevkLQ44jj+/tf3YyxkwZoPDybmtDozif65J6o+OCgIh2kSQXi+6KHIqfCRI5rZhwTZ5WVGMm+H7TIKd5ZJ8XI+wsFRUvXOBP+V8QfA9MYrjZw7qHLX6ivo8h1Li/aAtGnDko418E+weGJWoUmYP1fqZMInXfiJvOUbN02SVXR5FGm8xVjRXq0xxc4wnRGVkoC6yeJHTVsPeHscmbfiF0tMDctNno9nuHTRIY910XhvK5w67sjziUX/yRNm63TOWhwV3S7Ok6BIIZ4idEGTKs3HUvMd97Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6141.namprd11.prod.outlook.com (2603:10b6:8:b3::13) by
 SA3PR11MB7979.namprd11.prod.outlook.com (2603:10b6:806:2f9::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.20; Fri, 29 Aug 2025 13:35:35 +0000
Received: from DM4PR11MB6141.namprd11.prod.outlook.com
 ([fe80::31fd:4de2:2775:396f]) by DM4PR11MB6141.namprd11.prod.outlook.com
 ([fe80::31fd:4de2:2775:396f%4]) with mapi id 15.20.9073.014; Fri, 29 Aug 2025
 13:35:34 +0000
Date: Fri, 29 Aug 2025 08:35:31 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>, "Vinay
 Belgaumkar" <vinay.belgaumkar@intel.com>, John Harrison
 <John.C.Harrison@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 1/4] drm/xe/device: Use poll_timeout_us() to wait for lmem
Message-ID: <fn2cfyx5yhi6aloybfd5lhjfksgj6ywbigjl3ikvl5bwjgh52l@ae6xb34s6i6q>
References: <20250828-xe-iopoll-v1-0-9832ccd1c8b1@intel.com>
 <20250828-xe-iopoll-v1-1-9832ccd1c8b1@intel.com>
 <0249c60d-5232-4531-93d9-2a20e5eda7a4@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <0249c60d-5232-4531-93d9-2a20e5eda7a4@lankhorst.se>
X-ClientProxiedBy: SJ0PR13CA0230.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::25) To DM4PR11MB6141.namprd11.prod.outlook.com
 (2603:10b6:8:b3::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6141:EE_|SA3PR11MB7979:EE_
X-MS-Office365-Filtering-Correlation-Id: e29220f5-ea14-418b-6718-08dde700ee94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YMyPzMcxCoKPmlXQqxExjsPb8Up/jTb6Ijo0356ZJX9IBRi0vh8RBf/ndfjp?=
 =?us-ascii?Q?19XzqdRqS7fEAZQ3UKACj0WFv8gza1AtuxNC4W5EB8ex6/MEVazHFn7Ge2ko?=
 =?us-ascii?Q?XaebRaF1LyMNEcfOQPYIvjhp6/d32z3v2yXDCghcn+jTYt5IEwoGgawAEMDK?=
 =?us-ascii?Q?1kDwS6lSne/FAJ+OchaqvMpYirvzaqB8u58FqKmcXqOg+AVbJFbwcsj/cRkO?=
 =?us-ascii?Q?Y+iCSulX8S38XXvrF2jAM9bJU/OHUM4cXwUrQS7r0EnSUnNLUZnVOc4ve1Ol?=
 =?us-ascii?Q?tTSHp+Ts99vgBzgqPJMMcBcQLqg87sSAqI77x6tnU0nzqmYqlS22lf36RREZ?=
 =?us-ascii?Q?WkKhj2yPaKmOECizmiEsL09d+H1vdK5d3JFMl4flY5DeNZDHuI6kFMLQgfZ1?=
 =?us-ascii?Q?TInS3neNZMnIAPEPMPKAUW4guHB0Qcuh4AvkutBk1sUZXLpNhrec2+0J1jdl?=
 =?us-ascii?Q?6LQ7jSreDIvkLeL6Eb/8yjxrowBs3jos/zU1pZaNjcBJjw374521oE3bgBX4?=
 =?us-ascii?Q?1UvSMPdbSf1ChFdMEAQuHfIp1zc5TPh5ybc8ftXKYCjtDt3eytoVbyWS/hdF?=
 =?us-ascii?Q?81nBNZdbHL2KjZDS8DqXCIpIAMsXcpDvC9/8ufSPZkKhitbnSkCRcPtTIs7u?=
 =?us-ascii?Q?inEaiMpFdlyEovCPiJJSdlzrzf+iUwhWMzL/tleDXGygW2s0WrtcGQL66FSU?=
 =?us-ascii?Q?eIBWXpYFh6gWQDYBz/DrLS26GyzxPYON8PiLrV7ZnhkhuYkirrexWdcFTDAz?=
 =?us-ascii?Q?oWqE4yX/BbBF7RtAELxU8SxLsR6wSETKYXCsExuLMM321eUUy/vGw9ygGITX?=
 =?us-ascii?Q?+4y+K/6DL9Bm6coQnks3ns63dtmDIJhkogHDOu8Q/dAzGlojBxdFXDhCRsgR?=
 =?us-ascii?Q?AJUG+ZNmlaw7DDoLrHAI2oMtRWrUChPQbgxCCTheU1hcdLiIXZFRx9SoW2aj?=
 =?us-ascii?Q?GarYw/tbo4xdVjXfFEwj8lgKKDZuZD82hK+GJ34QLADTZJ47tSxhqiXmZb+d?=
 =?us-ascii?Q?/LCYORrFSXN09GO0+PPs+SsADJDKERhIGL9Z13+/+QGs64lPeXXaWcUfT7Qg?=
 =?us-ascii?Q?9wnfDJQrXha+iM6OnAGzk7sVPgmWLqrIPUjfJv0JJy562qWHLsRZdK9nyB44?=
 =?us-ascii?Q?N5zc58yz6Msvg/5PmOF8j6OAraXS+6b64Pb2GuL3IYDcanMQmQ1R8XNt0Ya1?=
 =?us-ascii?Q?QsUdZoGAX3ZEMZclBNSZr5dt9pdJeBqQS1y109F4tUo9qFftRRdCv41YRmlL?=
 =?us-ascii?Q?PXOboZhkklWrWDl9wNy3dJuzHaI+ZmNcLd0fvww2ZvZPdza5+iB3Eo2BZayA?=
 =?us-ascii?Q?14WkUOeQnOjUNsYv1WV64DkvvMV6qATnxWgvq4u/2hVCFetn1S1Kngi/dDEc?=
 =?us-ascii?Q?LH/+AahwmDzB9D8VJfuQeUxe9iQYboYEJsDX9yZuIoEoKEuLLNXp7eVERLDA?=
 =?us-ascii?Q?GQ3wo0vvsI0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6141.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bGhOjGBt+Wy4w5It39twnRXttYCtTt9bx6p+PYpWwtUElkqyk4g7q7WZc6uz?=
 =?us-ascii?Q?T0pyPqr8EwYlERccvD+p1HZ+9vZjAPxYDQ5rizyuGpIA4QZxhx+TlFgT7BVg?=
 =?us-ascii?Q?So2/IF5Zy0U9tYkozqkyMQHnVQrFSyklGgrHQdV2ShahU4qsFpUFx6F/Za3A?=
 =?us-ascii?Q?rqYOeqUPQXQ6rtmlzciWAwIWSQpVioovOQ+GvniqiikDdpr+IvDVAQy2L84l?=
 =?us-ascii?Q?lmLbku2Vz8whU5Ip7fhMkRkd8C+ZSJ31DpQM0RIumEBBoMoIFNlErecnlQIy?=
 =?us-ascii?Q?dl0fXWREdVKFwdCD903DsdhRXxI/0meIxpsJ/hZudPb995dnQnojohlD9SPg?=
 =?us-ascii?Q?kJixgiB2rRh+t38wRiJBt0q9hZkvv5iP6nD/r2cFre2zWLEKW+sk1u03EfP4?=
 =?us-ascii?Q?Vo/MfV4jsnnPY/s3KPTQ8awizjCS7f8NXxF1VjAmgaMY9hNqPRMdm5DpQJGM?=
 =?us-ascii?Q?IB6sr/vwcAXrTj7KLcEQwyHfLdLlcFbqsebSirBJnPeHxZSDVKobXJosAb9G?=
 =?us-ascii?Q?RASk4Ur9s0Xjl/hEqjtwIcj0V9yB5Agh2MZOKu9kVqAHbTtox5MGh/xC8Wj8?=
 =?us-ascii?Q?U8G2x6zmkJEfgJlCBMJwlwNp+WzgXbVHHn9SFLXiwXZty3csIquVx6THVArg?=
 =?us-ascii?Q?AUU6Q8uO4uVmCQKuhYDvsbj80XBA3L6+Pdha4bgpHsfqewC+xqL2yhOKu8lg?=
 =?us-ascii?Q?HOnrBR7rnfvk61c0csB2gQ6NAFP1W2wt89HxfJ1zFw5EUoMob9ykTMQa7ghj?=
 =?us-ascii?Q?YetQBZqvwQbe5nCR5oeT+1BlRoKPJ9IoTfX/Hh+Te7MC4i4ek4OoNWjAFRFW?=
 =?us-ascii?Q?u65BlAWvxoiRn7h6YxZ75uNYAoK8PFyfEu1YKnG/YtlDn+nHVE9ngRh2oPoI?=
 =?us-ascii?Q?20dppBHBl1Qsr/uCIXk3qVeE0xJwv/6dQGbNaFXWvpx9JyoDugLKS9sxXKSD?=
 =?us-ascii?Q?X4dUNtBUBClQ4SBkrGaN6CsTHOJuP93LUQq+EHabl9IuFvtGO3JuNbPGOsTw?=
 =?us-ascii?Q?RnRbRirHbFw/MhCWdhMQmMJMSiM22wUS5nFKAP7ySaKwGIzmdRqHBU5Dgfdw?=
 =?us-ascii?Q?VVx6bU/sXPwBpHJoe12FkvljE35pCF2Y4E9XJpXSqW8O016ttawljwJJiAYU?=
 =?us-ascii?Q?5d0qu//dlpOTuFgpZowMuRoaGmcv0dcVVJhCMZkBY6VaWtNRexD9EpevQHmV?=
 =?us-ascii?Q?Yp366oUstTM0i5GpKHx004Zh55taF4aMuFr1MxPiUf9+aIkCRGA1KqWEQCX1?=
 =?us-ascii?Q?Fmn1Nc82VQK262Ww7pKIVWdH90RNDh1BP+7UxX8Hec8wvh6k84yp83Telm1B?=
 =?us-ascii?Q?VXy8OzTa3f9Bd5dlhvVjfD1nGFEOJsZvjJ77U7/HnDRJsAr5/OZnJizMmAeF?=
 =?us-ascii?Q?eFOut5K6qbAJCeyBOJgNLxOkVIgYepk3xoMlKEXQFXI2F/i9v2A3nkh9Alb2?=
 =?us-ascii?Q?y5SnNPcJneT1x5e3kteNU2WuHpOL+QPti0/FTAJtKh1Wi1u7Fn7OSYNFW8cs?=
 =?us-ascii?Q?JOXU2aknp8hh3tD5MQfjyF9u8oit5LT4/Nfptuu9Rxv3gKZvq7/xMjqKuuzb?=
 =?us-ascii?Q?CVf1JgIzVwoiNL0IhiVq8H+KVDx9fIt8TGZWdbsohZFi6vwrB1vV4R3IlS4t?=
 =?us-ascii?Q?FA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e29220f5-ea14-418b-6718-08dde700ee94
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6141.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 13:35:34.8133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VcZaEnlsPqAJlBZJLgtl/Qi8bsg6a5UQhPclk4CjugdfW8IZ1LAX+MrNyQKU2Cywun6/UI8fdQH8eWCpOuY96XEqjaNSFUXvh5pim3qxpp4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7979
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

On Fri, Aug 29, 2025 at 01:17:13PM +0200, Maarten Lankhorst wrote:
>Hey,
>
>Den 2025-08-29 kl. 00:04, skrev Lucas De Marchi:
>> Now that there's a generic poll_timeout_us(), use it to wait for
>> LMEM_INIT in GU_CNTL.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device.c | 50 +++++++++++++++++++-----------------------
>>  1 file changed, 23 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 9e4773a17ef8d..ffcd3d04ebbf7 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -8,6 +8,7 @@
>>  #include <linux/aperture.h>
>>  #include <linux/delay.h>
>>  #include <linux/fault-inject.h>
>> +#include <linux/iopoll.h>
>>  #include <linux/units.h>
>>
>>  #include <drm/drm_atomic_helper.h>
>> @@ -636,7 +637,9 @@ static bool verify_lmem_ready(struct xe_device *xe)
>>
>>  static int wait_for_lmem_ready(struct xe_device *xe)
>>  {
>> -	unsigned long timeout, start;
>> +	unsigned long prev_jiffies;
>> +	const unsigned long TIMEOUT_SEC = 60;
>> +	int ret;
>>
>>  	if (!IS_DGFX(xe))
>>  		return 0;
>> @@ -648,35 +651,28 @@ static int wait_for_lmem_ready(struct xe_device *xe)
>>  		return 0;
>>
>>  	drm_dbg(&xe->drm, "Waiting for lmem initialization\n");
>> +	prev_jiffies = jiffies;
>>
>> -	start = jiffies;
>> -	timeout = start + secs_to_jiffies(60); /* 60 sec! */
>> -
>> -	do {
>> -		if (signal_pending(current))
>> -			return -EINTR;
>> -
>> -		/*
>> -		 * The boot firmware initializes local memory and
>> -		 * assesses its health. If memory training fails,
>> -		 * the punit will have been instructed to keep the GT powered
>> -		 * down.we won't be able to communicate with it
>> -		 *
>> -		 * If the status check is done before punit updates the register,
>> -		 * it can lead to the system being unusable.
>> -		 * use a timeout and defer the probe to prevent this.
>> -		 */
>> -		if (time_after(jiffies, timeout)) {
>> -			drm_dbg(&xe->drm, "lmem not initialized by firmware\n");
>> -			return -EPROBE_DEFER;
>> -		}
>> -
>> -		msleep(20);
>> -
>> -	} while (!verify_lmem_ready(xe));
>> +	/*
>> +	 * The boot firmware initializes local memory and
>> +	 * assesses its health. If memory training fails,
>> +	 * the punit will have been instructed to keep the GT powered
>> +	 * down.we won't be able to communicate with it
>> +	 *
>> +	 * If the status check is done before punit updates the register,
>> +	 * it can lead to the system being unusable.
>> +	 * use a timeout and defer the probe to prevent this.
>> +	 */
>> +	ret = poll_timeout_us(ret = verify_lmem_ready(xe), ret,
>> +			      20 * USEC_PER_MSEC,
>> +			      TIMEOUT_SEC * USEC_PER_SEC, true);
>> +	if (ret) {
>The 'ret' re-use is a bit confusing here, on a quick read it looks like the if (ret) would also be true when verify_lmem_ready is set.
>
>Furthermore we're losing the signal pending check, which is useful when aborting module load early, instead of waiting the whole minute. This is saves minutes when debugging memory initialisation timeouts.
>
>Perhaps
>ret = poll_timeout_us({ if (signal_pending(current)) return -EINTR; }, verify_lmem_ready(xe), constants) ?

I thought about adding a check inside the function called rather then
use this syntax above, but ended up forgetting to add it in
verify_lmem_ready().

As per return value, since poll_timeout_us() is a wrapper wait around
the check for readiness, I don't think it's bad to re-use the control
variable to break out of the loop.

Looking at other poll_timeout_us() users I prefer to keep the first arg
as the op and the second as the condition, rather than inserting a
return in the first arg that will actually return from the caller
function, not from poll_timeout_us(). That I think is a much more
surprising effect than the ret re-use.

Lucas De Marchi

>
>And drop the early check, change true to false?
>
>Kind regards,
>~Maarten Lankhorst
