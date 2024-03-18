Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC2A2C54E5D
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 18:42:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA1E10F67C;
	Mon, 18 Mar 2024 18:42:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eJD75LtO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4036C10F67C
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 18:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710787373; x=1742323373;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=DGHsLvWsyjP3lk+OfaZZ3jw0HnAzOGuu4RUg5urhds8=;
 b=eJD75LtO5qHEpGcc8EMgCUenxAmxDfPB9NWgPCKJqoMHxhABVUM25tAL
 vfsxf9i4smZAsLH5QYVxYjkzvfB/H4jFGC4yK+e/9MRC4Ha2emTt2dJmm
 yXPZrRNpfN1yHnhgp5/2PYQgvEGcsdk6JbHXiPhsPCGhJlrXqtNBsJiQh
 BI0JYqFrx5SUi7q0rGO271uhlAGXoSGL4CTxuKXAbNPx6RxcptZwMGqfv
 enBazYzomvpSdjr1jfzlLrohVV/tF0VgJ+S98el9YBf4qFuXFY5l6htoG
 yp6eTZO5FsCM/R8Ed54u1zjsQKMQ9VoApcfLHZqZC+f7pYA2NTxq4GeGU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5836251"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208,217";a="5836251"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 11:42:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208,217";a="13595098"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 11:42:52 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 11:42:51 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 11:42:51 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 11:42:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QnGXwE+E5f+kr5UkHAZHIDNuqhgdAbhcHA/RUFzYIijIVkxlCUiWhJjaA9cEXmR1S3f/aS/idfN9LOUuU250BsJKYZMwcZ0fbGmQSugDSqYFOoD7VkUdmccW4MTOHQdqVTJYAJBTmfd0FHYN7KMTutKd8FSKN0q414ICDJG0I2fAnkf/c2uPo7dNuvUfBu8hHJ3ZaHw6hS6ubq1ch02UDkYnk7ZtAZPvDDSve6/J5lpOtZ+zfINdgFEwioPk3/txcrdFwYXb+D12a9BlUMZrdYMOUUAE3RBsBxSdJxoVjmjHh6uhNSLpdbx7VCWHL+UluZFNUw6SzM3ASo/Ez9RXWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VrAJh1JbfuS84BpG2BPDgksLCITgXbc3bFMoYrdpweU=;
 b=Jt6PdjGyPPhmQWoiT9a+4Gv5mEj52GSLPG1jEapqUHOLnzgFjN2qeibycCuyh7rC1S+O2kcCrtkT17Nap60+a1p7yjoOTelU2qB2bBLzXqrzJld+PQavrW+zPvzAAM9PqFdoybSUdaUNKvbItVDSyS0f4FX3lclLGW67CePIv7GMXgWr8FOreAulcEd5G6pVeMQr1d10VLYfMf0N/dH+VaSiWq8MHedyGQBySnNAX5BV9NVX/UymTle1nk3QglpA8F2IXQssXwb+0eXmdo9qiBMrAWDlaqKFPcx861q9jtkjKDXWHgbW/DH1/WrGmHxsTcouO2R8XoGNyyW0gL3AoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 MW3PR11MB4522.namprd11.prod.outlook.com (2603:10b6:303:2d::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.12; Mon, 18 Mar 2024 18:42:49 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e%7]) with mapi id 15.20.7386.015; Mon, 18 Mar 2024
 18:42:49 +0000
Content-Type: multipart/alternative;
 boundary="------------xJgl6QEQz3i7C7JQqPOoXwGn"
Message-ID: <caccd575-75a3-485f-aed2-7ff4fa7e5215@intel.com>
Date: Mon, 18 Mar 2024 19:42:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/device: fix XE_MAX_GT_PER_TILE check
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240318180532.57522-4-matthew.auld@intel.com>
 <20240318180532.57522-5-matthew.auld@intel.com>
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20240318180532.57522-5-matthew.auld@intel.com>
X-ClientProxiedBy: MI0P293CA0013.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::18) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|MW3PR11MB4522:EE_
X-MS-Office365-Filtering-Correlation-Id: bfb6affe-f28a-45a1-3560-08dc477b35c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mTePCrjayte6naO4sLjemG79Vj574ORdQWw0u2dn46K9S/c1XmtZvxtY+til9Z5u1omjV2iA8ogZuErEVvfkbZeJdtV8mjp3R6F6ecNjbqs6tMTQEY7nvSU2xWSlyloFNG4czFIIxVD1dl7IPXzRNRYd3clTT/M+ZnpKXGL+BvkgqqeRKAGkPffePfbfTFUqoV4lPq5Dodvvioi6sKiTQ8bziy6YO+yQqtGGopc6Y4aekQ2Yd5nplQ2o8DTehgo7cDj1baO5FJz7i8Mg5gVoa8m3wPOYEwkTF9jLtGx8rUPisIaBL3Q4hEd3yPbDZvfUU076TwJAjfKrfhlr4RSU8jD4l443z/Od2KklW5mI8XaaHmFBd0hBLiNwpYpkbtvSb1hNC+qM9MyuaUwGTr2uxln+rVCTbbIyfyFyoItu5TIakLL1vLlFr5A1T+WTdOL7Wis4v09UXDtVbvFB2Lkk1yOoIO4dF9NHXAbitEfNbv1Jol+xV1tAKjCFkl5Bmh4GLikWx5NhTSsLcTh5p7rcoS6fPW+VnwmUkVkMrYtZmCO3IEkqW7nlLUtmwlcSIKqYqxb5QiL6dDJiLgYWAjQQfyNurQOI/I0QJcochrEW2UvHO+dbMAqQaC4338t/Lm1KMefJBGuGbuaUN21RAEilAA7oacXmekjhs/ec//MiWYk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWZwWTFjY0d4Ymt6OEpnMXRhWENUSkE2YXVSc0s5Z0IzN2t5K0lWVFcrTlB0?=
 =?utf-8?B?bWp5YURTZ0RmL2dmbmxDL056Z2lvWlB5cDNISlgzdTlnUDRJVU5iY1BDV2pT?=
 =?utf-8?B?OWNEdWE1VzVWdEoreUdYZFFhWU9rMHBGNkNiWURndU44SWQ3VWExakRabzFv?=
 =?utf-8?B?OXdxaW9DQkFyK1RqWC9naEtzR3RjeXhlMDlnY0IrdnRHbjkvT2dnS0ZLdEdh?=
 =?utf-8?B?Y1FBNVVjZGRkM3kvODhGcXNCY09pdDEwNVBuR00vMHlXejZzS2M4c01nNjM2?=
 =?utf-8?B?Nm94RjdpdmNSNTJTWkUzWUFFRlZYR1lITzZ5S2FtMmVGNVRBcHZLV1djUWFw?=
 =?utf-8?B?cVlDNUMvZkZwZGRIamhDY2hWemRHclNmQS9tQlJ3TXJhRkpNa0dkSjYvVi8r?=
 =?utf-8?B?TjFSRWxQMkMwNzdNaWVTb0dHSTJKdW9BT29TaFBPNSt0ZzdReXNmaVM2c2pW?=
 =?utf-8?B?Y3BVV1FsL3Q5TEVBcVEyVDV2MzdpSjdDL2xZdHhDNHprL3liWmtjRDFtT3Q0?=
 =?utf-8?B?V2hwaklHMlQ2VHk2cllJY3pUazBLSml4eG1HbDhyeUtnUTFxaHJPNUxtQzRk?=
 =?utf-8?B?ZzJWQ3E5WmFxOEVzejBwZmsrYlVqKzZsaG9POVVZYWRQVFhaQk1XaVpscDNq?=
 =?utf-8?B?cUNnbXYxcTVKT1Q4eWRWcS9qVmlCS3Q2YnJBelBLSTRkSmJxR04yY05EZ3lQ?=
 =?utf-8?B?azBkTGVublA0SGUxbFptTE1zOHhicUJHY0dBMW9WZSt3VC93c1ZRNXh6RnZv?=
 =?utf-8?B?NndFWW1vNXRoQ291ZzR1TmpOQWFDWDducG4ya3JoN1ZWWmJlckw1U1hFcmNQ?=
 =?utf-8?B?ZThBb1Y0N2NVZ0duVHRFOUdpSmYzLzV3QnR5L2lBM042eFdka2NTMGhZNWVB?=
 =?utf-8?B?OEw1V2MyNm5jclB5bjN1YkNyMmFxYTFsRENIbTJBQzBHNEFHa0FZVU1wR0tC?=
 =?utf-8?B?RWhxV2FsbTUvSTBGWTQyK3pHTE9kQXlQSGdqU3FSbkRBeTFweDlMQjNvbnJm?=
 =?utf-8?B?VnhGcUZWNzQyRSsyZjhLZkhMNiticEdkSnBiTkJDNUY2L0x5UUwvZHU0Q3BM?=
 =?utf-8?B?WDh0UkxVbktvT0lpNldMYW42NTZnZ3BnU3VKMlpDTUY5RDJsSlNjUUJZSGcv?=
 =?utf-8?B?S05nSnZZSTE3SG1jMkRNUDJSNmpqeVJzSGg5ZVpoOExLbHVLRGV3RlRZZmxo?=
 =?utf-8?B?M2ZZQ2hYOUFEYk5NY1lheDBTWDVnMFRzc0VoU0lMdW5tUzgwRStkcjhJaVdJ?=
 =?utf-8?B?SEpDWnh3MmZRTlhhMGEwVDBqT2VKNXJEbzB2Mkg3L3lEZkd6bm5Pc20wQXZr?=
 =?utf-8?B?azJoUE95Q2RMUEpkTXN6eVY0Tkx0NDN5ZC9jRGRxaDBBWU1rRlVab0Rxa2VQ?=
 =?utf-8?B?SkNzWnVVUnJldXRMZk1GYUhrR1RZUDhlbWNGSUdEQW9aeEVzZG45RHVmSVRZ?=
 =?utf-8?B?UXlrRmZidHFTV0JnTFNvbjNYdUEwaHRiRTdTL0NEajJXS1BMS2ZVcmJUMTli?=
 =?utf-8?B?QUE1OFF1N0JzS0dEdEFqenBYMEhYZlhCMExpS1FHVkEwUGZQMzNkNEJLZzFr?=
 =?utf-8?B?SloyYjYwbzM4ZFJCd1F4bXJvZ1FLdmdBRjBaYUM4K2FVemJRZk9nTW0wMEtE?=
 =?utf-8?B?MnE3RXA5SCtkRTNaSmNYc2JSWDk1ZzZjUEJwSWpLeTMrdVpzWjFBMHRJc1hX?=
 =?utf-8?B?ZHJPRHV5alFjblFZOHpIU25zOERmRDJNc3pYUmdjL0lyY0llTVRwNDVWbmRB?=
 =?utf-8?B?UTdGWTJraXlFYXV3TExPRFZQd2IyVWQ1bjF3c0UrY014RDlPWTQ2cUNPYndn?=
 =?utf-8?B?WCtyNTJCbE5raHRUTml6SzVQb05qblNVMUU5RUt4ZCtVcXQzaXl1cXJCNDVh?=
 =?utf-8?B?bm5TY05JOENYZkRoN0NQYkh6N3hvWE9ScGNEYk4zVDF1dE9QMmh6ZWpqZmtH?=
 =?utf-8?B?V0twZ01ndC9YMDBvM0U5dUxKYUdXZnFxVm5KZU9qY09RY2JKNUc5ZmV6dlV2?=
 =?utf-8?B?THR3U3FmQldnVWlvazkxNnVxbHBDV2hpZ2QzWE9HWHI3cVVDYU5PNzhsam9l?=
 =?utf-8?B?cHNwZkhEK3lsWTgrYTJTUGJhdHFOKzFaVktHdUNsVTdnV0JJUEtTeFI4K28r?=
 =?utf-8?Q?L5z8Hwh/Gxsvrf067Hyx/LcNH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bfb6affe-f28a-45a1-3560-08dc477b35c3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 18:42:49.0984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VVJNgQDOs4BDH78cZeClZhHpJpA8NoIevZmtb9ShLoliog1Lf6X9M2mfqUaCnwKlOlYbQM0AhvtE7pW7FlJZdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4522
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

--------------xJgl6QEQz3i7C7JQqPOoXwGn
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 3/18/2024 7:05 PM, Matthew Auld wrote:
> Here XE_MAX_GT_PER_TILE is the total, therefore the gt index should
> always be less than.
>
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: Matthew Auld<matthew.auld@intel.com>
> Cc: Nirmoy Das<nirmoy.das@intel.com>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_device.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 14be34d9f543..5c254ec9c602 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -58,7 +58,7 @@ static inline struct xe_tile *xe_device_get_root_tile(struct xe_device *xe)
>   
>   static inline struct xe_gt *xe_tile_get_gt(struct xe_tile *tile, u8 gt_id)
>   {
> -	if (drm_WARN_ON(&tile_to_xe(tile)->drm, gt_id > XE_MAX_GT_PER_TILE))
> +	if (drm_WARN_ON(&tile_to_xe(tile)->drm, gt_id >= XE_MAX_GT_PER_TILE))
>   		gt_id = 0;
>   
>   	return gt_id ? tile->media_gt : tile->primary_gt;
--------------xJgl6QEQz3i7C7JQqPOoXwGn
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/18/2024 7:05 PM, Matthew Auld
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240318180532.57522-5-matthew.auld@intel.com">
      <pre class="moz-quote-pre" wrap="">Here XE_MAX_GT_PER_TILE is the total, therefore the gt index should
always be less than.

Fixes: dd08ebf6c352 (&quot;drm/xe: Introduce a new DRM driver for Intel GPUs&quot;)
Signed-off-by: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
Cc: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a></pre>
    </blockquote>
    <br>
    <pre class="moz-quote-pre" wrap=""><span style="padding: 0px; tab-size: 8;" class="hljs diff colorediffs language-diff">Reviewed-by: Nirmoy Das </span><a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a><span style="padding: 0px; tab-size: 8;" class="hljs diff colorediffs language-diff"></span></pre>
    <blockquote type="cite" cite="mid:20240318180532.57522-5-matthew.auld@intel.com">
      <pre class="moz-quote-pre" wrap="">
---
 drivers/gpu/drm/xe/xe_device.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 14be34d9f543..5c254ec9c602 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -58,7 +58,7 @@ static inline struct xe_tile *xe_device_get_root_tile(struct xe_device *xe)
 
 static inline struct xe_gt *xe_tile_get_gt(struct xe_tile *tile, u8 gt_id)
 {
-	if (drm_WARN_ON(&amp;tile_to_xe(tile)-&gt;drm, gt_id &gt; XE_MAX_GT_PER_TILE))
+	if (drm_WARN_ON(&amp;tile_to_xe(tile)-&gt;drm, gt_id &gt;= XE_MAX_GT_PER_TILE))
 		gt_id = 0;
 
 	return gt_id ? tile-&gt;media_gt : tile-&gt;primary_gt;
</pre>
    </blockquote>
  </body>
</html>

--------------xJgl6QEQz3i7C7JQqPOoXwGn--
