Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5953FC54E5D
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 11:40:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 110AF10E292;
	Mon, 18 Mar 2024 11:40:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I5deTzHv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7405110E292
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 11:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710761999; x=1742297999;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=atGWy3OFZ9VZcFlSHRJy0TEhmjtJephQxE5e3k6870Y=;
 b=I5deTzHvfRTMuUuxuh3N8fVILnZwuDXYyNb0hCUgTrdc9IfTcXEJhCY5
 10ehR3HcOUIh2Lm6mGgQ81H7XtH+oMSI3WAg12d9kqtR8cBlIVTODnWo+
 Q8QmfVdsMEzwU0up2Bi0aBpnPew9i3w5CMQjiT4Sb7HWTDMc5HMqg9TMH
 c24dKkOQKV3CWPXN0aA17zqW1sB5Dbcm1hhZzcCd3oVhblBsQY8zg6XIs
 0BlehBa1iF0pzikrGs3VuMgaXt9OXxmnN8orEO7SnuJTk9nLJUg+8ePQw
 a6QbS1K0Yrsi+lsGimuK9NG6Z9W/Gd5ngpDj3T+AbtRE4m7A0+GGsdHAJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="16965507"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208,217";a="16965507"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 04:39:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208,217";a="44500505"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 04:39:59 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 04:39:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 04:39:58 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 04:39:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gf7DVT19K8jai1/i44RcT622PInJaQITlP5HvqGb0PvBKv2juDnmZekyZJSpxNlX2HEUsLxiLiKesvjNHyKABOj0+AJJbv7C2CQ5jyn5ywBGzMjqQa1176XEfb0TPYsYJM5FrPSLl5I2GTeGDHl0JWa8jKvZx5ngeeZI8RFCzuduaGRF0pg2Jb2l0vj5qii7JvX2xJjTVd55J1yR+cfujJ0nH1/+XXpBfVCXn32NwnE58WdQ84wi1pIG2fJMalkWyV++RaJsmeIVJ5OtANOCWwolbIGcak1SGjKf+oFQnhjKk7EYz8WyTUbRHfv0DdALzLqmi1DgY7AX4HfUpSGkGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tocZGsDg/Pa4Q8/QcFkq3Q8w2zMIafiPWDPslficTTw=;
 b=Z8HwTyRnSHWcdxDOMnpAyUZ8B2upLY5j/vlMM2GvWdDNv1Ml+tm9prZEUhPK3wkdzHmNhNWBEKw0Wky1ZDK6S5KNeqNWOB1o6mwJ8rzdXcFGEk2H1Ewotbsn2F2cU7gAMo8UpO3I4iSNyeenM3Pp5GJYoWVvSAAojre9T36WNDMxSeuUyE6C8cKnp2gouOQD4c21/rWiSNBbzUChHAC4SZ8YVH7+qVp6AoDSlAxSsbojFnjQWQrHaIJM6JnkoF6lsC/858UR1el/Vr5UcMV4mNB985xXaH414AKDRVjLDKZa10XWWTosSQbHecAM+lyapqw8/syjVECHtRMNZJtvuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 MW4PR11MB7055.namprd11.prod.outlook.com (2603:10b6:303:22b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Mon, 18 Mar
 2024 11:39:55 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e%7]) with mapi id 15.20.7386.015; Mon, 18 Mar 2024
 11:39:55 +0000
Content-Type: multipart/alternative;
 boundary="------------j7Si97s05CdXk5Po0JVHoP0q"
Message-ID: <e471b14f-958b-40be-a8f5-1d30b924a3e5@intel.com>
Date: Mon, 18 Mar 2024 12:39:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/device: fix drm_WARN_ON() check
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240318113708.32938-2-matthew.auld@intel.com>
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20240318113708.32938-2-matthew.auld@intel.com>
X-ClientProxiedBy: ZR0P278CA0095.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::10) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|MW4PR11MB7055:EE_
X-MS-Office365-Filtering-Correlation-Id: 3246cc76-da9a-4281-a155-08dc47402213
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MWxOAg8WiyWAJ6iKyNEJQJxBk+0tqgBGsUTz2aLgB9yNY9lnAuWJB6XEO5rQTynBUldIGEOWXkR2+s5XDUoq7BW3IbbIHDEt7xJYXZjgNwpDZPYqod8M7wdIf7smPkbdx7rt0Q3brKIKKuCwmSLu4qMT5bgvEkBLXK6y3T9g679DthJKmoVUkLgHvnWkg7NQKh/7iMxHWdZb38i7spPANdJu40epLgLiKLZfmqkdCiFBHwOVYvVYXc7i9lTmKEO4wu8IrlmjpImDuE3GdMligoPxWOHEEasvLTx/tCf3a6JZ9gG4gBZigLWoLu6zlRD+J8ohuxGQYBRdqEDq4zmi/ujcVK7UVFP8KdH6+jMaSgVDvbd6/FCM51iOwR0CnHGh8PYcYRSATvtYLTObFbArZoqGexeWwKAJZj4eMjB0Q+7SxSLntB7sgY0ibGmhSboV+9P2rbAxx1r0EDTBInAjm0+c2bAcQYjp1ucz1G9QLgKEFJwc253C0jD7ywu1RNaihcmGzEtIT9rRV81Y8K6H6KIvOTddMmhW1TQvjoFe+EnbMGCa7OOdJkpDVg0w1QxHmeYacVThY7nFXPcj2OAP/3A8uIgyMg0VKRw7fMNDqogL/E/eIHLSBKvnO+2xFV1buXA6ANA0wUfM38kr5Zol/y0oSeNf7+3GxPJnLZUf2EM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGVkSWU3dEFIUlRPbmcySzhxa1RzdEo0NHhrVGIvTU5hdFFBa3ZZK2lZL1Fj?=
 =?utf-8?B?M2pITzhCS0tpeXZPU3BER3hpQVp4VWRWQzVNU0R2aE1hU2FDUmdLWGt0QXJl?=
 =?utf-8?B?ZWZKYTdGeVRUTC9LbDlhc25yemdYNHVhZHNvYkFKZWwwZ3VzZEY4a09QalBm?=
 =?utf-8?B?cTMvUWV2dzQzL20rcSt4SHp0MkZ0SFV2TFRZUUR3bkt5ZWVXM1hEY3Z6TG0y?=
 =?utf-8?B?Ti9Da0JwOE1UdXFEaFg1bWtyWVAvUVVzMjNMZmd1anBpSXhPbnJiZmo1YkdB?=
 =?utf-8?B?eGNJRE12aEpXT0VIbUdOTkZ2bzJOMlJDKzJMUWNwdUcvV2hBVUhlalZOV0sr?=
 =?utf-8?B?dHlGemhtSFNkZGdaR3o3aEtjRUV0UGh1NkRXNS9NYVd2alV0dHc4cnNTc2dG?=
 =?utf-8?B?WGtyVTFKVE0rN3dyZWJ5SHRVV0JQWDVFMkRTaWIvU1U0NzZQMG9FMWxwVWFn?=
 =?utf-8?B?MXgyQmlVWEJTMStIRTMyR2p6TXkvWkovSzY4dC9XV0xBdTY2SDZvSG9DbmpD?=
 =?utf-8?B?NlJWYllxTVB4N1AyOUJXZVV6bXVQS0dOdUcwdCtYMzhUYWl4Q09HZUFBMk4v?=
 =?utf-8?B?NW9QcUpSbklVMXpNb29vSXIvNlA4NFVhaGppYzR0ZFMxSmo5R1JGd2xGd1ZN?=
 =?utf-8?B?ZTJUOEoxZmYyVmt5Rng4TFZyWHJOa2tBb0k3WnZMMFhUNk1NV0EyRkxIejhT?=
 =?utf-8?B?RmNuZGs1SFF6NGg4eGluOUl4cStlY1JmeXpmUHJ5d0Y5Ty9jUzduN3dVVHZB?=
 =?utf-8?B?NmJ1TnRLOUFxWnN2bUxzVnZsNHZBOXlvbHdqYjZsMUtDZmYxbkE0Z0Rlbmx5?=
 =?utf-8?B?MWkxVG43M2tMY1BBMEJ1eEh5bXdpU3pYUUdRS1E1MHpQZnREV0MvaS8zMm9H?=
 =?utf-8?B?Wm0zZ052SVJkWlNSQ3NZRk9DSTdhYXVHNFZVZzZsa3hlTk5kc0tzRXkvZGxB?=
 =?utf-8?B?SlhsTkdiMU4zT1kvNmcxejlSSC9EaGZpVkg3VHNSalBURjdha3lCQk5hTGFM?=
 =?utf-8?B?OUlrVExuZzI5c1I5b3ZJNmlnQU02WmxRNU95TGpkMXhCbWE3cVBpTGVzeEpO?=
 =?utf-8?B?V1kvZGxnckpQNHliVzFKeUpveEJka0JJdHp0Smh6L1hBK1RXVHIxbXpQUFg0?=
 =?utf-8?B?MFVsMGRDK0RDdjlSVHUzL1NnNG1sRnhHcXVSZStQWlRJZkU3ZWNNN1VZbVp1?=
 =?utf-8?B?UktOQ3QrYmUra0k4MXlxL2FMeDV6SzdRQ041N3RlaUdFdnNqZGJFME84ZlRV?=
 =?utf-8?B?MnhleStWNGZBZWoxV1ptU2pJWTg0U1FCbHBvRHZVRXJ3NzJTcE9GN0dBTWFI?=
 =?utf-8?B?SEk3V1QxR2VKbzhxazBCK1EwdGlHRGFmaGNkN2llckc2VGExY3lkZytLTjJT?=
 =?utf-8?B?RlhPOW1PWVVEVnJKcG9nbEFTbUQwb2g0NkxOYUdhT2hMZlVSK0Q1R3lCeDQy?=
 =?utf-8?B?LzNsejZyMCs5T2ZpYlJMNzZDcGFubWJFcFhMbnBGM1hidEc3aklTRkp1MWRO?=
 =?utf-8?B?K1FFNnJIV2E2TU1kTTR4dXlVWEt4cEtXbGw4MTlyUVFkd0JwS1NvQlNpUFNv?=
 =?utf-8?B?TTdQQzNRbXhYQkhiTW9rVnk4Nk5kQm5KZGk3TlNhSUZQNXlrTER2ekU2UjBy?=
 =?utf-8?B?Nk5sS0ZITlU1K3c1ejNHb2pkS1EvZWtDYlZUNTVZTGR0eUJKQmRYekFOd0lZ?=
 =?utf-8?B?VnZudWN5S1p4dC9mVEFDWFVPMi9iVUZGQ1pRVU1Ub3JxeGVBRWVuTWhCVEZ1?=
 =?utf-8?B?TENYYloyRUlOR0hOQjBiaTkrRjhYTE4vTkRhd3RWTERoZmowN1dEcTMrRDMr?=
 =?utf-8?B?VzEwb3p4ZUxlaFFsNWlQaGIvT0t5ZHl2R0tjd2l2cDl5M1BSSTVaVDc4TjU5?=
 =?utf-8?B?VTN4T01ZQmcvTjNvN0RkSGtZeUZHZ3QvMDVoYU04TXJKR3FmaW5Ybk5oQWdy?=
 =?utf-8?B?UytEb3NlMTdxK2NaNDlKVXh0NXhXc1loa1R6cG8xaUJySWU1ODF1NHdiOHRE?=
 =?utf-8?B?MnJRbXdyNTAvbC9oWkZwQUxMUEY5NUhTdDMzZ3BhUkgvcTJGVjI0WEN4L3R1?=
 =?utf-8?B?b3ArNlcyOG1zVGp2RS9lMWpwbmgzbVJKRFNldytiSUE0WjVqSTF1YjJLOWZi?=
 =?utf-8?Q?6MftyZmdTe1MCvOfEcgAKKeVp?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3246cc76-da9a-4281-a155-08dc47402213
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 11:39:55.7125 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1tqxBmEScoUMP7K1FCqAjxKR3cBmdSKhRGVDbWZiVN3lcuxiRO5RkTUwGMhbuZo0gFig0Jf1EjMxw5Yrw/JIuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7055
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

--------------j7Si97s05CdXk5Po0JVHoP0q
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 3/18/2024 12:37 PM, Matthew Auld wrote:
> Here XE_MAX_TILES_PER_DEVICE is the gt array size, therefore the gt
> index should always be less than.
>
> Signed-off-by: Matthew Auld<matthew.auld@intel.com>
> Cc: Nirmoy Das<nirmoy.das@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 14be34d9f543..6b32f09a4c89 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -79,7 +79,7 @@ static inline struct xe_gt *xe_device_get_gt(struct xe_device *xe, u8 gt_id)
>   	if (MEDIA_VER(xe) >= 13) {
>   		gt = xe_tile_get_gt(root_tile, gt_id);
>   	} else {
> -		if (drm_WARN_ON(&xe->drm, gt_id > XE_MAX_TILES_PER_DEVICE))
> +		if (drm_WARN_ON(&xe->drm, gt_id >= XE_MAX_TILES_PER_DEVICE))
>   			gt_id = 0;
>   
>   		gt = xe->tiles[gt_id].primary_gt;
--------------j7Si97s05CdXk5Po0JVHoP0q
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/18/2024 12:37 PM, Matthew Auld
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240318113708.32938-2-matthew.auld@intel.com">
      <pre class="moz-quote-pre" wrap="">Here XE_MAX_TILES_PER_DEVICE is the gt array size, therefore the gt
index should always be less than.

Signed-off-by: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
Cc: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a></pre>
    </blockquote>
    Reviewed-by: <span style="white-space: pre-wrap"> Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a></span>
    <blockquote type="cite" cite="mid:20240318113708.32938-2-matthew.auld@intel.com">
      <pre class="moz-quote-pre" wrap="">
---
 drivers/gpu/drm/xe/xe_device.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 14be34d9f543..6b32f09a4c89 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -79,7 +79,7 @@ static inline struct xe_gt *xe_device_get_gt(struct xe_device *xe, u8 gt_id)
 	if (MEDIA_VER(xe) &gt;= 13) {
 		gt = xe_tile_get_gt(root_tile, gt_id);
 	} else {
-		if (drm_WARN_ON(&amp;xe-&gt;drm, gt_id &gt; XE_MAX_TILES_PER_DEVICE))
+		if (drm_WARN_ON(&amp;xe-&gt;drm, gt_id &gt;= XE_MAX_TILES_PER_DEVICE))
 			gt_id = 0;
 
 		gt = xe-&gt;tiles[gt_id].primary_gt;
</pre>
    </blockquote>
  </body>
</html>

--------------j7Si97s05CdXk5Po0JVHoP0q--
