Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09478C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 17:45:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B00610EA17;
	Mon, 25 Mar 2024 17:45:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JdnX3V+/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 307DE10EA17
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 17:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711388733; x=1742924733;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8ahIEcgPwv5qsvB35TjHWiofbdfzh26xNVx9UbWfTeM=;
 b=JdnX3V+/2PbNFNrb5MYyAZr1Sc6SrK9ICBKZPRGU738ffy0lWgEI8I8p
 8EFL14MAVqc5WdTqTNEcyJnS1V3vePQWw+iLrqPMJOmNDCJCsvecAXNiK
 E5mkbvcGsG0vhzFwrdQ6wDW/39hPzEgSyOr9f7DPAgPV63Pa8zc6Upn0j
 sJlVa5/8BGQ3H68S/0oUxb21wHS9wteZ1HI/ochkHW54YveQqAhGLQ3um
 wSkH5Pt+lB6xpXF6q+S7LL9t4mWRPKilqaw0XyS0R0WfwA8zyERU2a1Yp
 JZ++1jZGBpxtQi54+QpJEfTekV7b775re1J6CEEKZCvSdrMHKfqNqK2kU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6618071"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="6618071"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 10:45:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="46691592"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 10:45:33 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 10:45:31 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 10:45:31 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 10:45:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g4xCsvuir/lryED7yN9yzDi/xjxXixkstbYrRWO6mB08rdLanrltbK18JngUQAcuBJB2uf19BLg0NowDMErGV7J/vhyr4jmAA+q1Aw6eVQXxLKac2RL4IIHoMc+TUW9SaRvUmqHrRnpmgKHYzRLzUzfrACm6FHSPl+lk4LBXCc95jrYFDGuZXs4Xn61DWIoo/o9+oCtTJBG6MGcSp6dOsHLVQK0ZuZ1eOKeXgyfjQ9EyNnOs83G4dg3TwEQ1yddLOWXAlKPrk4GC7ZPI3C+NteG9gjPLLMyAZEVXLOSA5LWe5AEpM9eY8h8coxtLqmGHgFcpE4xCIN93mCX1ESyWnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ezwjv6DFMJddy32iKw6ML+vYNC5Hq7oZGajBA89nUaU=;
 b=lQFKykrSDaraAn7EmPVJkVwGHV2a12jY/78T/tLEorfGtuWx4Q3f5QQ/MXKVoBXYLJr9954FciThEJlXUly4KMCK4p6HJNFxjuUEhs+4KeDRFzRciHz35PxzLMS/hWlxG/zIt52nEPv4RVd1k20aTjqhaa5yC41JotWdDjqZMPywmPC1/KoIwsTha78JGAW4AuH8N8ZOXM3bdlQQPCXWXby3jZLVBSLcx7YzQz3dDKFEYa+ws4t1pc5kDwpR50ESVZ2tp+X6Q92+DMPxkL2SYG7fMr8TWvgaUr7OZhdJc5IE/JSXLEpKbJVRpPCv9Sv73K8F1K944xSdH4v/aRQdEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by DS0PR11MB7189.namprd11.prod.outlook.com (2603:10b6:8:137::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.26; Mon, 25 Mar
 2024 17:45:29 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::8778:d67d:55f9:f68a]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::8778:d67d:55f9:f68a%7]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 17:45:29 +0000
Message-ID: <555e83d8-e86b-487a-b86a-022fac9e5968@intel.com>
Date: Mon, 25 Mar 2024 13:45:25 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] drm/xe/query: Define and use a constant for the
 number of masks
To: Francois Dugast <francois.dugast@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240325111439.7-1-francois.dugast@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20240325111439.7-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0017.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::22) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|DS0PR11MB7189:EE_
X-MS-Office365-Filtering-Correlation-Id: 2918dac9-c6e1-4322-db3e-08dc4cf35ca6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jyK2xcUJAG16z5woY4elDv6IlNY4NsqEv80p5nMOy50ll9KVSIa7amwrNLTbiQFO8lHP+6+TMWphCoa5iYCac2CFcFBc5GzKZG0j6MNgUUYogyhztfrZZN/ojSQI0EjRqNAYE/N9DyWOyqcaGjbhnKk2l5xUO6vFV/XxVV4PJPyyGLUkKzny0cQcqKWOuUn2gmzfS/H8ISzmI6cmIQgJ5vycI6vE3Y6otCwK34qmId7wPq/rFSAqEy6c92Le9QJkT4rDRvQNx/kHWKiDu+GL1tAKXFzp9roXl1poxcvwuv5uRVNHo5PdOSdWVgjPVoQI1o2HLlDN2DjiaUVIm+XvSIF7ksWN7z/B/3EaaCpNhPF8wytWoJ85p2zMJSlOIdjcyY7cK69QjhgZUl2CMLDnsLBSinlm5NYvJliwPSOJ2J7a+3pk0P5dzUyGASxKNNp1PxiBO8BcmBm9yCxHMbcxcSpy2yxD11QoffkG5HdOBkxR5QT04mP++tC0Z1skJ1VFZ6a8QTJ+/cUHTPciuUUPdG8tKThqs+N6ZCExvo8q7Dg0mB1SrXFjJCvZXMPlYL34IGZulsfDgOUOc/02cxhT/Z8Wa5nTJJZo+fJnBFkpAP9GSLo+unbFHG/dRpPeKwLn2Ql4FVIXtMpM2QoScLtDDqpU/1ncj0MOgWcg/OEup4Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0JrL2pHS1JvcjQ2a0FMbGtZMEEyK2R1SG9yVzhVTFR4NkkvYUpLUy9JZi9F?=
 =?utf-8?B?L3ROMXNYanIwZnZHMXFva1lqSFY2RFo0QlR0SW5neDJSbmovdUcrMVRZakwz?=
 =?utf-8?B?RWM0Rld2YzB4WldhbnlabUhOaVA0Vysrb0d5MENQVENVaGsrR0FhYmZHVklW?=
 =?utf-8?B?Y1lWcTU5UzdjbnZkem1zbVl3QmhWSUo5dVZrb2JpcVZNRFRlQU9VeDB4WjJa?=
 =?utf-8?B?cDE5VGpDWUJ0WGxkb0NRdXNCSnd5K0QvZ3lXTFg4Y3Nma0J3YkFuS0dOcWlQ?=
 =?utf-8?B?dmEvTHdrQVVNYTZ2Qk5ZTlltVHFpaXhFYitDcTFGSWRHSU05dGRJRlNINXND?=
 =?utf-8?B?MmNXdGNibWFucEFVZENVKzFtTUNUeHF1NldyNVFxeXdhTjAwaVhleURtRWZP?=
 =?utf-8?B?MURraHJHQitxV0t2SE5xQmRobkRnM01UMlJjSkYyTVlsVXZOMnhQZUY1VjJS?=
 =?utf-8?B?WVdmK0kwZm5Md0JybXd6WTQ1R0REU3BDY3BWWEtqN0YvbWFyZnFBS2hEejBp?=
 =?utf-8?B?Q1BWZ09kOGdqdjVQSFh5bWxqRHE5MXN5c3hOcjBGMnBsTkorT2I0dmZhNUJ6?=
 =?utf-8?B?RndrSjZNYVRndk1EMnMreWpFM2N0ZGlBK1dQTG0yQWYvQ2lKU3oxUEhORjAv?=
 =?utf-8?B?VGF0MVNqTTgzMVgzVElmMUpPWGlvN0lRTFI1UHdKOXJhU3dnN3oySFUzNURJ?=
 =?utf-8?B?QzAxMEcxOGJnRDFEVWRqaytVVWVqdm9Vd1FUc1ZhOXFZd0s4dmtTdis3cjhN?=
 =?utf-8?B?eXNzSFhyM08yTUpKRE44YTl0MnlSczV1YWc1UFZKRnljSkowSkM2TnBURml6?=
 =?utf-8?B?OE5wdExDcC9vTmRUdTFCL3BQSHlSTXZMdEZoNXB6UmtRRlBhV0lYMSttSFFQ?=
 =?utf-8?B?QTVraDEzaTlzOGtoODl4cXo0R2xIUWd6ZitsVXNwWEJxS2dmUVJESnRHZ0c1?=
 =?utf-8?B?c2NtOXBZUE9oWE9xSnlaK283TDJkcWt5dEdOZ2t2M3ZNd0xmYkk0emk2VFRm?=
 =?utf-8?B?Qis1Y3gzd0tVaVBZeUNCeGpXbHJCSWxtYmlDNHF4d3hsTm40NWg1cTlpaDhE?=
 =?utf-8?B?VG55UWozenZLR0x6U29seVpQZ1JhNnZWNUlUZlA2MGdWMFEwQ3RWZjB2ZVRT?=
 =?utf-8?B?WW1LeEkyWHg4eUtXNlJMMDVzKytVY2JRcFRiY2VlN0xDaUQ0SVRFaXlxNnlU?=
 =?utf-8?B?SVhpdHk4UWxqcXAxbEs1ajRxVU5RRFY5bFFYZkpxdjA3TnNpTFB3SlNwUjN2?=
 =?utf-8?B?L1BmMXVKKzRrWFhuQzFQV25pOG0yU0VYZWl4TjZxZHEwRUQ3VDc3UVpaSlM3?=
 =?utf-8?B?N3RZRjdJbk1aYmR3QjJyV1RobUg3dCsxWlhtdlRsTUFCZjRVREF2akZNSXBp?=
 =?utf-8?B?aGVwTHg3ckRaSWFzeFhZSFhqbGp3N2Vqa0xnUzg2YW44NzJESzJkYXBsaitx?=
 =?utf-8?B?b3VvbkpvY1p6YW56MXhOcE9EcmZFZ2FJaDcyZXByL01xQzF1SXVTNlNIU1c0?=
 =?utf-8?B?bTQ2cTlDaVRIdzZuQ0Z1MDVCa3NkZ0VjZVlGRjl2aEpFNTRTUVRKV3BEWlNK?=
 =?utf-8?B?QnJqRUZWazUwU3plN3JyeFZXSE5CRzcvL1Bqd0N1bkRLYm1nWkRpeWZxV0Ir?=
 =?utf-8?B?KzRDTlJTaXBHM1ROakszYXdkNGdISDhzMkYwOFZCTnMzTElYVHZPZHFqajZ6?=
 =?utf-8?B?d2tNQUwrcWFjZjBBaFVGais1U2ljdXovWTY1TS9CWnh1WXVqWWR5NlhweTM1?=
 =?utf-8?B?OG81ekZ2SFBsb2dGRWhqUEVUTjdWUXdFR1JXN3NjbU8zNEx2R0Y0QmNrYWM1?=
 =?utf-8?B?NFhPT0dUU01CQUR1S3BWNVgrNkk1SmswQjBzMkV3MGtYZGU0QVl2a0hkdmZO?=
 =?utf-8?B?bkRTczVxc3VKNElhUmJ4cnZCWjZyeFRUbkpDNlZaaHkyaHF4aG8ycmZrTTVM?=
 =?utf-8?B?OVZBNE5jM3BMazVKUW81NnFrMFhMeEI5V0pzaFZ3SC9Cb3J4bEVaZVhxbDRh?=
 =?utf-8?B?M0NzT1FISVkrNTdVYm1sRXJrbE9CWktVVVFlNG90Wm5kZ25ZajFPYThkdllx?=
 =?utf-8?B?RmdiZDVCcllDSVNsSTBDZ2M5YnV4VWNNYklON0g5VWhaY0pWNWhtalM1RzI4?=
 =?utf-8?B?Q1NsVElSZldOdm9RbXNHVGlZenRTakZEVVFLTUY4ZnhSbDFRWUxqbUFET081?=
 =?utf-8?B?YVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2918dac9-c6e1-4322-db3e-08dc4cf35ca6
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 17:45:29.6544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NBCd5OToozweYIF481Cp5H+sWmIqOmhF/mgh5agK3jpeRnwIXxrxgWBfMHf669L/ywNv95FHGj24NKiYSX1BqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7189
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

LGTM for this patch 1/2

Reviewed-by: Zhanjun Dong <zhanjun.dong@intel.com>

For the 2/2 in this series, I see an CI.Hooks failure you might want to 
check:

+ find drivers/gpu/drm/xe/ -name '*.[ch]' -not -path 
'drivers/gpu/drm/xe/display/*'
+ xargs ./scripts/kernel-doc -Werror -none include/uapi/drm/xe_drm.h
drivers/gpu/drm/xe/xe_gt_types.h:374: warning: Excess struct member 
'l3_bank_mask' description in 'xe_gt'
1 warnings as Errors
run-parts: /workspace/ci/hooks/20-kernel-doc exited with return code 123


On 2024-03-25 7:14 a.m., Francois Dugast wrote:
> Replace a magic value by a constant with an explicit name to make clear
> what it stands for: the number of masks returned by the topology query.
> 
> Suggested-by: Zhanjun Dong <zhanjun.dong@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_query.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index df407d73e5f5..109a96212310 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -23,6 +23,8 @@
>   #include "xe_mmio.h"
>   #include "xe_ttm_vram_mgr.h"
>   
> +#define TOPO_NUMBER_OF_MASKS   (3)
> +
>   static const u16 xe_to_user_engine_class[] = {
>   	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
>   	[XE_ENGINE_CLASS_COPY] = DRM_XE_ENGINE_CLASS_COPY,
> @@ -454,7 +456,8 @@ static int query_hwconfig(struct xe_device *xe,
>   static size_t calc_topo_query_size(struct xe_device *xe)
>   {
>   	return xe->info.gt_count *
> -		(3 * sizeof(struct drm_xe_query_topology_mask) +
> +		(TOPO_NUMBER_OF_MASKS
> +		 * sizeof(struct drm_xe_query_topology_mask) +
>   		 sizeof_field(struct xe_gt, fuse_topo.g_dss_mask) +
>   		 sizeof_field(struct xe_gt, fuse_topo.c_dss_mask) +
>   		 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss));
