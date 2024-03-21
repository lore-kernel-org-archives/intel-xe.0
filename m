Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB129C54E68
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 11:11:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77CCD10E6ED;
	Thu, 21 Mar 2024 11:11:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="emWMe1af";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6F410E6ED
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 11:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711019469; x=1742555469;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=S/NhwuO7vKJVn/vAf4tJZaJa3RN0be/+aWq2WWZIzUo=;
 b=emWMe1afJ3iiWpPMv5r9tqSfpCKu+pHYWSq13/E7wwLyrlPtIX0g/dil
 ylasC0Ae6tWEw0HDMtl/Jn5Zfej8ZOTTdkvkPYUjDqYoUCQuuWrFKEYFx
 9VW2LH962QIcO8gZFR30RRlK3SaDJCgwe64M8OlCu7TT5Oh7+BJIeK2Jm
 3Q4mcLZaziSqtxRZuQiiVVc3t8B+m4XhQrjdriXXR+TYT6zqFohaCshUQ
 Cmm3efZ2+bbEncRua5PnHpdLMMTwYd1TNXexFxjrvchutEDXRyEwPnxWD
 a4QBARElMuKIg/M7Pc/7N9xHvsfe8DIxtfYQHRrfb0wvcThTIWnZFiWAH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="5831714"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208,217";a="5831714"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 04:11:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208,217";a="19188376"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Mar 2024 04:11:08 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 04:11:07 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Mar 2024 04:11:06 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Mar 2024 04:11:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UH9P7Yr475DXC5KszBk2Lz8u0baY+zuEc77hHutsut8K7eHxk3tEGAiXHN4j5eOdHxAcejG3xBWLDh4Hd8A9UFGrYSrKQkmDnczt5zAuvToAuWVp7UPdIY6qTPnyodZ9FvhXBDLS10Yf8gKzav+YsHYJr+8+GJEFnZgES0nMQ0tsuoEBG0JT5891ShPUsk5OWZqrVJaqMvU7mb5Uw49V/np/WvcMY78+bph5gtWefkH46LYgHbvO0vkxu2bGDe1CxwTy2zBL0BhhFuEbD/GhjVykKzUq+psq7yQU7xlzKcNRg+dPaQMznh13e/5ntYV+2S5T95mcp1gBYLHNtp1xIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wPq0AWoJoesaRhaBo8UvqNWsDB7toFeLXJNparvOvQY=;
 b=ckjKaJvQrnYBjsbAK10duM1fJPrHTNlWsC6auQaBSjPqtscNQ4NZDr0da8VLqdsUzHFVLxB9qF7d5eaa8x00Nia6BLlb4RT4UWSiT1jy2tbz0phj63tfXacIA0vnu7FfJA1yB4I0b5Fk+ZtFLJUxMq9Rw63ZRTta7l+wv118vUyOsP19qs7U/wWm67H99yVqYMyquxIdto+QkRV38e7TkEvuurBkwh1AwS3zGwUAgaVBlRV4FtBrYrdH5db5k+xcBZD2/G36EZQ5NsMu5HQGesQsBEMu2iCyXQl5Un5Je7a5SrtN98bkCMQLrfhiEMDk2jdUfFKx7+8Ir7Fi3TzdTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 SN7PR11MB6727.namprd11.prod.outlook.com (2603:10b6:806:265::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.12; Thu, 21 Mar 2024 11:11:03 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e%7]) with mapi id 15.20.7409.010; Thu, 21 Mar 2024
 11:11:03 +0000
Content-Type: multipart/alternative;
 boundary="------------yK4hp0vmdCfTckKc0ePreX8h"
Message-ID: <2ef68b2f-f227-443f-b863-d707ce6ff152@intel.com>
Date: Thu, 21 Mar 2024 12:10:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/query: fix gt_id bounds check
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <stable@vger.kernel.org>
References: <20240321110629.334701-2-matthew.auld@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20240321110629.334701-2-matthew.auld@intel.com>
X-ClientProxiedBy: DUZP191CA0052.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4fa::15) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|SN7PR11MB6727:EE_
X-MS-Office365-Filtering-Correlation-Id: b3cdddfb-089c-4851-c49d-08dc499798d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s7KslA6+yPx4uum14+np0snMgGTLRYc9G/aJUk7ucqmIl9x/ErDmDuw+n+4DoB8+ZWyW6UgBjxSN5qiYh3AZrwqSAtTOYex9I3waTBS4tDsIrtpXBKoVky3b4pwvk87KHDwuINa9ld64iDlEPgHNEAPefMdv1FQg3GbUTc08njBq+AelELN+5jhT5bf+b2JpmXCKGqJtJzbxaxLhJSfALXvcw/Mil9Ko7oElt2NGudWar9Mo+/lcFtiHbwmfpui2Tb2uKAGKkCWzcL9ksmcK2B489JsK5yNYCHVvdPldMrjVq+aBsJLONvjBfm6URx2GNqpedIX1z9FcWHsTXgAQ+8lPLAkh2zG8dxmpwL9QFIdENGuL3yaRY8mawkejUQxW5pb4enxuCc9UiQEdrusZENjxGMLn9of3TQYZeUD6rJXDTu2zEqDtjNIb1DZCU7nfdZF7Ja8PIPiouptNY22PdmdYr/F6YcEu9JnTGuSX3S+gX1DTfTm7B+noFsMINiUmT+/lN/jfVnovte7QPXHmS6sCmDQTIofaf3gYbLlWCLCo7r2Oe2aom2BY+cV7NxjPS7OZuoU2kybzqifzj7q/naqk4Pf4R4VpAjrWXAND9hvuMSOymty6k/5PMSS6hVhBhU7mePFGHgPwX2sNDkL6lLZdb+d4THxrEY3Kt8gtU8I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZndrdzlaRGlHMmFLRVRHRzRGakZLNUNEY0RwS2hlNEpZaG5uaWF2N1BLekdv?=
 =?utf-8?B?bTBhZURHcTZQMk9TRnh2SHRGWFVEUU9UeElqTS96RkFiWmdSUGlzUG1YZ0la?=
 =?utf-8?B?OGNnY0FvcGFYenVpUTY0cGRDS2RwbXIwbUd5ZmxmaW9EYWxJcmgzcDh0K3di?=
 =?utf-8?B?bEZzUitYWW1qVDkzcGlHZDZuWDdPK3FGRUVmRTNYV2lTUDhOd1ZJQmpqQUtv?=
 =?utf-8?B?dU1TMXBQRmdiNjd3WVlWbXBJejZ6OUxxV2xldnZnT0c5Szg1Sk01cXF1SU5w?=
 =?utf-8?B?RTJYRlR4T0Q4OExTR2NFNTF3SU90eW9hbVlNblRlbkY3U1YweWJkcnFpc09s?=
 =?utf-8?B?WTdZS0h0N2l4MmJTY0pyWm1lbmF3L1Fxa1BJTXAzcG5qZVdnV0ZIL2k5cGdF?=
 =?utf-8?B?RnNtVWNmZGprVDF5ZUd3MW9qZ0grNmI5VW5BaWg0NnZ3OU8xSGpjYWlxNHpJ?=
 =?utf-8?B?U0J1Z2ZSb2JibFNNd1JHdGxad0F5bzRJcFlLeGcrVFpjMkZmcUVsMHJpRWFI?=
 =?utf-8?B?Mlo4RzhnWFdIZEVNeXZ0V1pwVW1HMDBZeVlGSEJUNmY4T29SSkxnWjNNa2hB?=
 =?utf-8?B?d2doWG1vbFpibWFqaS9Bb2VnNWpmUExBNzlXU2RFUkRsSFlHL2JGWmo2TVhh?=
 =?utf-8?B?ZU1pU0k0bEJkS2JyYVJrVWt6cU4wSWdRTit4OFE1ak1SbC80ZHFzZy8xd1Zt?=
 =?utf-8?B?MS8rUGdxanVRbm8zSVgzUWNhWDNHdHBEbFdmYSttakRSS1dVQXBOVUtlVEcy?=
 =?utf-8?B?cXhjNEJMeFk1RjUvWjR0UllnaEVSR1U3TmJhaUhPTGRwQXNhcXd1NmNBc0o3?=
 =?utf-8?B?OHowclh1RkgxWEpOK0JDK0MwNjl3UklqU2pqamxPS3JlaHZpdDZiOGdQSFhx?=
 =?utf-8?B?c2hqc05LeGpEVTJKQkxTc1NKYXdqcW8wVXVNT3cvbGlXYmJDNm0rWFhZRlMv?=
 =?utf-8?B?cWtPWHJhUVR0NEZUQ2o5bnh6clhvNGE0RGhxUDF0cUdNTWJjak50THJaakFn?=
 =?utf-8?B?Y2RZT2pUU3d0eW1EV3dnRU1mdlhCVWdWZGhKTjFTOVcxUE9MQ1JLdjBsSTl2?=
 =?utf-8?B?RG1ObDMxSW1IWTloZHJ6aldiZ2hYVEwvQU52djRRNnJiWFE0aHZBb2lFeEoz?=
 =?utf-8?B?YytjRkRMZHpkbGorNUlmSjFtMk1TamtrMGhwS2dWUkFoblhFLzMrSkZsUVRo?=
 =?utf-8?B?bWtXR0tMVm92WTZEZFZEVzFyZXZGODVZVzVTQWhjbUVwSXZqMUxLVnFtdEw0?=
 =?utf-8?B?UjlNZ3pQRUhacS9PQ2gvUTN2ckdnUFgwdXluSG0vNU4wdERzUXB1cnBMNEl4?=
 =?utf-8?B?a2h0aGQvSm9CbWZEVjBHWnFhcnB3K2Fydm5WMnFCV2ZRRURuVXhhWkUrOGIr?=
 =?utf-8?B?N21qTGxDQjd0SU9pRHBFZnZrSytTZnlNUjdXSnBuYUJOZUp2N085cmFFTmFT?=
 =?utf-8?B?eUlsR2RKckRmMGd5OFVIaDRvQXRyNzBuUU1KVXYwQU5pcTV5bDFLRzNUekxi?=
 =?utf-8?B?K3dkV1VicitmN0thMEg5bG1rTi9kUDZFdmE1ZVdzaGRzNU55REFqQlJOWWhY?=
 =?utf-8?B?TDUvNU9mWmpQbjM4NFFVVWJEdFltdTBLQ0hHeEFOVjF5bldKU2hmTDMveGw1?=
 =?utf-8?B?Si94K2RLU3BlbWxiN0orNGF5NWxpcmZhbjAvamExZ2lCLzg1K0hNWTNuWkNX?=
 =?utf-8?B?MVZiYzdzZmtrMEtMbGtNZVdRVHU2cEpaUXpzbnpWdTRGcUk4S0g3NnVoL0VF?=
 =?utf-8?B?dWJFR0RrenhMMjdoNUk2dUdJV0tuSGdNM095Z2wvSG9tV21nOTZRUVFRVk9B?=
 =?utf-8?B?YmllN1kwOE5tbjFVakxBdWRGckhkVHBYV3NicFhyVG5GcWZINkQzUXpxTnF6?=
 =?utf-8?B?MjlzbFVzQ1k0Y1pDQzNJa1lJS1FGRXNLRmJydzE5Zkx4R3lrdjF3alNYb3ZG?=
 =?utf-8?B?TnkvclVTSlJDSVRwVFBheFhyU3doVGFVYU1hK1pLMUl0UE9NTVEraURQVEg2?=
 =?utf-8?B?MnczekZTRGxkVFNtMTQxUUhtZzdFZnhiaUVDbEpCN0ZNUVhVY2RUNnNIWCt0?=
 =?utf-8?B?Ty8vVWFuYndaVWFCWW5kTFZGZDNjaWlQcmw2Yk9oQStVaUpDQU9sajVFUkN5?=
 =?utf-8?Q?HVRdf99dfnlLfmhuadZXxk0YX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b3cdddfb-089c-4851-c49d-08dc499798d7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 11:11:03.4982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LWskRZeYLoJGOFF2l8DSNqMrOvZVlAyyqO/A1jVrIBn6I4QWxtLMTeePmJmlD3EbPEEY/5SMQRojdtCf6+aYrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6727
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

--------------yK4hp0vmdCfTckKc0ePreX8h
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 3/21/2024 12:06 PM, Matthew Auld wrote:
> The user provided gt_id should always be less than the
> XE_MAX_GT_PER_TILE.
>
> Fixes: 7793d00d1bf5 ("drm/xe: Correlate engine and cpu timestamps with better accuracy")
> Signed-off-by: Matthew Auld<matthew.auld@intel.com>
> Cc: Nirmoy Das<nirmoy.das@intel.com>
> Cc:<stable@vger.kernel.org>  # v6.8+
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_query.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index fcd8680d2ccc..df407d73e5f5 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -133,7 +133,7 @@ query_engine_cycles(struct xe_device *xe,
>   		return -EINVAL;
>   
>   	eci = &resp.eci;
> -	if (eci->gt_id > XE_MAX_GT_PER_TILE)
> +	if (eci->gt_id >= XE_MAX_GT_PER_TILE)
>   		return -EINVAL;
>   
>   	gt = xe_device_get_gt(xe, eci->gt_id);
--------------yK4hp0vmdCfTckKc0ePreX8h
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/21/2024 12:06 PM, Matthew Auld
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240321110629.334701-2-matthew.auld@intel.com">
      <pre class="moz-quote-pre" wrap="">The user provided gt_id should always be less than the
XE_MAX_GT_PER_TILE.

Fixes: 7793d00d1bf5 (&quot;drm/xe: Correlate engine and cpu timestamps with better accuracy&quot;)
Signed-off-by: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
Cc: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>
Cc: <a class="moz-txt-link-rfc2396E" href="mailto:stable@vger.kernel.org">&lt;stable@vger.kernel.org&gt;</a> # v6.8+</pre>
    </blockquote>
    Reviewed-by: <span style="white-space: pre-wrap">Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a></span>
    <blockquote type="cite" cite="mid:20240321110629.334701-2-matthew.auld@intel.com">
      <pre class="moz-quote-pre" wrap="">
---
 drivers/gpu/drm/xe/xe_query.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index fcd8680d2ccc..df407d73e5f5 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -133,7 +133,7 @@ query_engine_cycles(struct xe_device *xe,
 		return -EINVAL;
 
 	eci = &amp;resp.eci;
-	if (eci-&gt;gt_id &gt; XE_MAX_GT_PER_TILE)
+	if (eci-&gt;gt_id &gt;= XE_MAX_GT_PER_TILE)
 		return -EINVAL;
 
 	gt = xe_device_get_gt(xe, eci-&gt;gt_id);
</pre>
    </blockquote>
  </body>
</html>

--------------yK4hp0vmdCfTckKc0ePreX8h--
