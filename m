Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59ED3C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 14:36:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1761E113D00;
	Thu, 18 Apr 2024 14:36:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k3dWdcuN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4655113D00;
 Thu, 18 Apr 2024 14:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713451006; x=1744987006;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2lC+MzgZP9iL63RPCdZWeVvtzswx5606p1rXmrYqnZ8=;
 b=k3dWdcuNd/5RLvlPIumXkaoTB+D08Au2b+XmZGS6Ad8x7MnCS/Ip3jax
 Lm6hxlnwqQW7Z7j7v3F1GHLWjV995gpgItyw39sPzmbnoCo3lEDxeL9sc
 B5OgJ9MvbDAJV2/TDGXMVffVdSjIXO2ZsYZGZjs86Y0YRoTfaNM7nTw3j
 0tiN5/Cuk0N44coHjA4KyDQH7p2Qb5k8re9Iv+DD3jhmCZQNaxwlCDnsM
 BsajVoLW7dj9CSbuSjq3kLr07rfC7OE09WTFGLexbpRANMmQnAwUyiKJV
 fScAtATJWoCrVEmKh/GrQU0oKl9MCaobwYGHZiTVOqLX+EshzqLWh/Gb9 w==;
X-CSE-ConnectionGUID: SCxWvRnoSeqAyv4g9o6Q+A==
X-CSE-MsgGUID: O22V14mZS2+BsxYWXKcStQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="19609144"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="19609144"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 07:36:10 -0700
X-CSE-ConnectionGUID: FyZGF0j9QpObPdwlg2c9xA==
X-CSE-MsgGUID: x99qHP5CSI2zpM93PrQZGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="46294714"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Apr 2024 07:36:10 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 07:36:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 07:36:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 07:36:07 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 07:36:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HnUsN/tbte91sBjJJytdlp0m7NIjs7DHKty08ZIzGArKlpy9k0fyZfSK3UPmdbd2fULKzlpT93EG5w5UKdU43aCgS+PpTVL0hGTDS3wL7iUNHCkD7hXDOWJcN8saRtFvzcbXylMoOeRFIXa9w0lVWJhdjk6ODs5wnbEZ/1+AukyleuiBJmpcvslsituuMMvRO+zjz0IF9hyiRkXULyZF/lp+CurE3llCX/VrJqd6uFmeQxg33lHZkI3/TOqjL+rwLL8gbu9X+nEsW/qPvO7cS6qvOxTF18UzrhMlGPLfwskMfeG+AIpjyJnXld+5CT0QQYRXqjJ9r33fpGB0v6u+Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=57mPYpLFFV9l2dGq3JSR4LItLL85tl6TfTD0gEzwmsY=;
 b=S/XzXKpAGByqTia2TNefHE/K/Lnm0ENqtvLEg+tISYRERErHoYZYXeE2AyymXJvQJau8I4DBp0QhMAf9BhlXHQvRG08weoagOIb7ieFZKidnKNbXMiztg/q7iqna8xapayOmiXxL9Zw8WKRBKPwGBajotsw0iTJvuu3GYCOF8quz3kAmyagKh4GMd974w0+i4ttMmvQnuybB4xhc0uSE6anGvLb7TKkpX5r0NwLIIbikZiK/ECYyiNr7gHXWdfM6uJOWdTLcsJrr9CI90nN/BAVERqXsu1k0L4lc7NUYGi4o5KV5L1uAWuhyQt2qRO4JreIxvMZkgCaPDB2ydzMBHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH3PR11MB8658.namprd11.prod.outlook.com (2603:10b6:610:1c5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Thu, 18 Apr
 2024 14:36:04 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 14:36:04 +0000
Message-ID: <d12f1bea-b014-4967-9b3c-81cca01fdf35@intel.com>
Date: Thu, 18 Apr 2024 20:05:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] tests/intel/xe_wedged: Also add a simple exec
 to confirm GPU health
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>
References: <20240409221908.1077893-1-rodrigo.vivi@intel.com>
 <20240409221908.1077893-2-rodrigo.vivi@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240409221908.1077893-2-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0081.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::20) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH3PR11MB8658:EE_
X-MS-Office365-Filtering-Correlation-Id: 68d91d8d-e75c-4148-8d4a-08dc5fb4e008
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DIhsh+mDM/kJ+FxlaoMX+YRtaBUZ5UTK5UGms8SNzojStA6fzC6RiIvtKXJtzYMS0Bz42Thwc8ARyGI7aYp4DS2GwO5RGyYAhBQXTOLQuc4a/ShgyNu2I5c+lt7yXg3/0+c+dsLqLuC2jr8/wx22bw6c4vneLC7NuLmVwbFbK4JCJPbWwdPs5YEvwLAtVedwitGXZnMhruDqY5c5PDrkuzWNqRMAgvyYEkaEsqLSIrxaijnHg+1iTW4AHzKqTtmvtcKEPkClNMrFnwTOTC9C/fVAx6JTpg1D2MWSWJFHLyLz1BVewNAApZzahHsgwHs3no9kLVeX2WnFQ8s87YtZV+vlVDJwmShxsHCwnG0iIee71PE93fO3GjrqisUKZ9y1OGEteSQ9qqBzhw9XKGa1If+JuhCeu3/WIjhHZ47QYWiDTWZgfq6PSmshEByi1QDOni6i2VakVgmJl6g1gG1pSPoTMCcYqn/azjx7G3bcS9xIMlkfpMnJk6eEHTAoWLRLAJcrEP+4dEwVLOl6OaMdOHXR2Q2VSpBQD8qgARKy/1mEMwZcvlHBqctOg+18OmOHZCviepUOD7cmJDC9nLneIoSfblFNu0UDyiEvyIp7yKjSUcUxkRAVgQN+wDJD8R/2wBZiG+eoIL45I9LFxkinP8jmo6Fswma4oFF33i5trJo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VThpejN5UlM3MDRRdVBrT3ZDUFk2Mm54ODZIenNQcWhwd29aTkUwQUI0YUQ3?=
 =?utf-8?B?N05RbU9IVnIvVEFheHVKVG1kVjJKdGpsVHhISHpnV05aQ2FlNnpkOVQ5aWJJ?=
 =?utf-8?B?anBIeW9Fb0RQcjhmdjN5WERjN1Fyam5JdndvK2o2b3V4TWl5aktqcllia0ww?=
 =?utf-8?B?YXY3TDc5UlJ2dld3dEo5cDBQblJrYWRNcHRFRXB3bGordVE5cmQwWFJTWHhr?=
 =?utf-8?B?R0tWc1NHeXFCdTNTNUQ3cFBSNVN5aTBDZVJROEg5aHpJSUp5NHZQNDNDV3RK?=
 =?utf-8?B?UG41SG9vOWNacTNOdGl4LzBnTU5pTTU3Yk5HMlJnVTA4V3R3V1JnRDJZaTk3?=
 =?utf-8?B?ZVpKQjg0UENUa2J2dHBnY0ZyaWtobGcyUW82YkF1RWdrNGIvV252TDVUWVVK?=
 =?utf-8?B?djBPazFPaDlrYWNyYTBOOEIvWm9TQUZQQXNpNDFmcDJiNGpnMkdkQnVtYzB5?=
 =?utf-8?B?YjBTazRQY1UwaGVVUkJuTHMwRWVtc0pNck1PdFRFSEwvZ0plNmMrSVZIS21m?=
 =?utf-8?B?d3NtK3pDcFhRSVgrTzB3WXFXbGVzZGVhTFcyanZzWEtOVUI1bzZXNUswUXFV?=
 =?utf-8?B?TGJLLzNsdThXOHNkRmNWZTlUTUtYd3NVRzF1aTNJcHVzOXJuRlRDUTArTUR3?=
 =?utf-8?B?ZWNpaWFuZHpYQWhyOGcxV1FBVnNKeExtK3hDdVQ1eFlWQm43MU9xNXdiV014?=
 =?utf-8?B?NVR5M3d4OGgrNERNR2UzWlRySTVpUyszSU1kbCsyRzZCZWpjbU8zeXBUSjZV?=
 =?utf-8?B?LzI3Qy9qQklsZlRMYzZqTGVMY0Jxam1URnVmUEMwTTVHRkpuWmovUG1Eb292?=
 =?utf-8?B?REdiMFluOGkxSjlnSGsvNkJ0K2FwbXFLRXhMcnFrL0xKTWtaYlJVaHZ6MFM3?=
 =?utf-8?B?elNMVWxCVzh2K2g0K0ZENFluNHVZNkFEajNjWGE1STg1MjQyak5IT1BGaC9t?=
 =?utf-8?B?VnBwaG11Vi9tMDZrRVdLQWRqYk1DMWM0b0NnY2w5NE5ycTJiOUpqZkxjbG8y?=
 =?utf-8?B?NTU3N3lGcFQrK2trY0VYVkVMV2VGNHZnOWd2RmFTS2ZOVFE1ME0vcThiMGVU?=
 =?utf-8?B?NndBVm1rbnUrU2JsQ2g3OFlvMGd6TlZmdGQ2eUszZ0RvVWxSejRKMytDdEZE?=
 =?utf-8?B?VnJYNzZuRzlYaldZUU5PcjJWUDdHL1NhUDBxWjZKZEJLSmtwOTlBOFQ0ZXli?=
 =?utf-8?B?V3g1SHVpY2RuYk9NdWdJLy9YMEZpV1pBM3FZdkYwYWhFbXlLUyt2TkZqV25a?=
 =?utf-8?B?bmVxdjBoVm9RTDJVY2E1VmJNVk5ZYjBMVWs2UVJ6eWsyTFZ3ZVRvOFJOVjVT?=
 =?utf-8?B?YTFuOTRSdzd3L1hxZUtCTHZQeDNiWlpmTW1xWnJhenlyVW04MHMzcy83TUQy?=
 =?utf-8?B?WXRjY1lVWUFqcDRDSjdjSUhFL0lwaiswOUdjZXgxeWlRSzRTRzExWXZMNmF5?=
 =?utf-8?B?SWZZZVdjWmpYTHlzSjFhVkYvelk1RDRBZEgxSzNFYnlzMWZyL0ZZZDZYdnFy?=
 =?utf-8?B?RkZkUVNzNVUvbUFDRjc4OG5iZG1EcFRwK2Rqa3I0SWFPcEY1V0QyK2F4aEhL?=
 =?utf-8?B?dzBiWEhzOVBxbXhtZ21FVWFVais3RWtmS2N1VTAvcW5aK0dCN1NpaVZvWDcr?=
 =?utf-8?B?MDUyV0hkSXFtdTNkaEJRWUM5U21WWmRzRHpLc1U5TElWampLcjhiNWF6aWxB?=
 =?utf-8?B?Y0dhNm5MR2NMalduUTBkOXAxS0ZnVTBLSEk4a1ZpQURGdnI1RmhwbmdWb0Js?=
 =?utf-8?B?ZE0zNHBLbXhIbWRZRU01dmdXSEdxQU5hL001U2hQMDJUS1UyNm9Gc01HKzBV?=
 =?utf-8?B?S3RWbFkvZmpLZGdmdDRBdU1JOExpakJDVFcxYXVpSEZQSWsrdk9sRk1KRW9j?=
 =?utf-8?B?dTEwMlltcWNZWTBHQlVjRHc2OEl4bnVTRmdaa3oyanJ6cG5QYUZjTFRrR0xU?=
 =?utf-8?B?SHFnVVdiYW5jMjNmUEVFM1lKV2RGcnZrdFNQUkJHN3dJYTdEMFNMelpncGlI?=
 =?utf-8?B?YVJsWTFzdU00Tjc5ZDhkdElvS1p2dklPMzBHVVRtTXZMenhNRytMVDdHOXI3?=
 =?utf-8?B?MEIrUm53SzJqcERHbzdJai9TMEwwc2ZsMjBzL05oZXdyUGVHOUt3aFpGZ0pF?=
 =?utf-8?B?WUxmZFlxRXJiQXhMYlR6Mko3cHNUWUZXa0FhNm9OY1dnSWRBMWQxK1doWnVh?=
 =?utf-8?B?aUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 68d91d8d-e75c-4148-8d4a-08dc5fb4e008
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 14:36:04.1278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KE1H4VmFzWauTLaBfMu/xUkNuOG8dzMtrYeIpJOpe0d/DogR9LxHgWM1gR1HJSh6k5/LOJf6sJtxVV6a2UE+7orQmmP1Y3iIINyuh0PHpqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8658
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


On 10-04-2024 03:49, Rodrigo Vivi wrote:
> Besides confirming that the rebind puts the device in a state
> where we can send IOCTLs, let's also ensure it can really
> perform some basic exec functions.
>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   tests/intel/xe_wedged.c | 90 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 90 insertions(+)
>
> diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> index f2587cc43..ab9bf23d5 100644
> --- a/tests/intel/xe_wedged.c
> +++ b/tests/intel/xe_wedged.c
> @@ -17,9 +17,13 @@
>   #include "igt.h"
>   #include "igt_device.h"
>   #include "igt_kmod.h"
> +#include "igt_syncobj.h"
>   #include "igt_sysfs.h"
>   
> +#include "xe_drm.h"
>   #include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +#include "xe/xe_spin.h"
>   
>   static void force_wedged(int fd)
>   {
> @@ -75,12 +79,96 @@ static int simple_ioctl(int fd)
>   	return ret;
>   }
>   
> +static void
> +simple_exec(int fd, struct drm_xe_engine_class_instance *eci)
> +{
> +	uint32_t vm;
> +	uint64_t addr = 0x1a0000;
> +	struct drm_xe_sync sync[2] = {
> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 2,
> +		.syncs = to_user_pointer(sync),
> +	};
> +	uint64_t batch_offset, batch_addr, sdi_offset, sdi_addr;
> +	uint32_t exec_queue;
> +	uint32_t syncobjs;
> +	size_t bo_size;
> +	uint32_t bo = 0;
> +	struct {
> +		uint32_t batch[16];
> +		uint64_t pad;
> +		uint32_t data;
> +	} *data;
> +	int b;
> +
> +	vm = xe_vm_create(fd, 0, 0);
> +
> +	bo_size = sizeof(*data) * 2;
> +	bo_size = xe_bb_size(fd, bo_size);
> +	bo = xe_bo_create(fd, vm, bo_size,
> +			  vram_if_possible(fd, eci->gt_id),
> +			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	data = xe_bo_map(fd, bo, bo_size);
> +
> +	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
> +
> +	syncobjs = syncobj_create(fd, 0);
> +	sync[0].handle = syncobj_create(fd, 0);
> +
> +	xe_vm_bind_async(fd, vm, 0, bo, 0, addr,
> +			 bo_size, sync, 1);
> +
> +	batch_offset = (char *)&data[0].batch - (char *)data;
> +	batch_addr = addr + batch_offset;
> +	sdi_offset = (char *)&data[0].data - (char *)data;
> +	sdi_addr = addr + sdi_offset;
> +
> +	b = 0;
> +	data[0].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> +	data[0].batch[b++] = sdi_addr;
> +	data[0].batch[b++] = sdi_addr >> 32;
> +	data[0].batch[b++] = 0xc0ffee;
> +	data[0].batch[b++] = MI_BATCH_BUFFER_END;
> +	igt_assert(b <= ARRAY_SIZE(data[0].batch));
> +
> +	sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
> +	sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> +	sync[1].handle = syncobjs;
> +
> +	exec.exec_queue_id = exec_queue;
> +	exec.address = batch_addr;
> +
> +	syncobj_reset(fd, &syncobjs, 1);
> +
> +	xe_exec(fd, &exec);
> +
> +	igt_assert(syncobj_wait(fd, &syncobjs, 1, INT64_MAX, 0, NULL));
> +	igt_assert_eq(data[0].data, 0xc0ffee);
> +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> +	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +	igt_assert_eq(data[0].data, 0xc0ffee);
> +
> +	syncobj_destroy(fd, sync[0].handle);
> +	syncobj_destroy(fd, syncobjs);
> +	xe_exec_queue_destroy(fd, exec_queue);
> +	munmap(data, bo_size);
> +	gem_close(fd, bo);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>   /**
>    * SUBTEST: basic-wedged
>    * Description: Force Xe device wedged after injecting a failure in GT reset
>    */
>   igt_main
>   {
> +	struct drm_xe_engine_class_instance *hwe;
>   	int fd;
>   
>   	igt_fixture {
> @@ -96,6 +184,8 @@ igt_main
>   		igt_assert_neq(simple_ioctl(fd), 0);
>   		fd = rebind_xe(fd);
>   		igt_assert_eq(simple_ioctl(fd), 0);
> +		xe_for_each_engine(fd, hwe)
> +			simple_exec(fd, hwe);


LGTM

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


>   	}
>   
>   	igt_fixture {
