Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 068A6C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 05:15:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B68D810FAA2;
	Thu, 18 Apr 2024 05:15:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GVrfy33D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D12CA10FAA2
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Apr 2024 05:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713417334; x=1744953334;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=nkP5i2n/ncGbOGYth2VEJ844JPwSs/O3X5cV7LUuMV4=;
 b=GVrfy33DFCDoME/cDxNrONekR+8WnaN54e/eq5QJ1QZTXUtOOstQJKFc
 VyxXAU/OhaLxEj6aFT9YcxTex2LQ+lIRI9sFMBe6xhzg9Q1oqpWq7MRby
 rQTTIFyBhBGt/KsujQfSWcV3HsMcU1DM0YZ6KYQI3+tjktnVt9aUqBtCQ
 veU+ngv5lDZnkYwUyvSSEJM8p0cOlL31cwFcb+A3N8tjXNIB2eAE7qnEm
 vc555PS6+YCyzoahsxwJqNRSgO6V5aWKT55ir6KzyQdrOWxp2zY3wvYd1
 Q8t3BVaDUhiF/lnscNBsLwxhLyTFwhDa2TcS2mp1WrQLSWvsQzfVa74bZ A==;
X-CSE-ConnectionGUID: y4lzTPsIQISm6fxngyD+gg==
X-CSE-MsgGUID: W7iCDa6PRWeuhjXYmm7N8Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9066999"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208,217";a="9066999"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 22:14:34 -0700
X-CSE-ConnectionGUID: CGY12RdnRIeViKXqOnOkXg==
X-CSE-MsgGUID: BJKOwfqYTwuYM+ZmpIsydg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208,217";a="54064831"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 22:14:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 22:14:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 22:14:33 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 22:14:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ELMf3+IdI9SkjUPDEmIjEIbemxTau+ZT8gk/dNjxspQrULpjPqVf7E9ND69SwUhK8SsyF62d18ARRyUjatYVPmoY1VdEr/gBWhRD5FCuhP5wKH3SHM7Y9rDIQmVgSSEspbeELqW9Jjgh7PjBOCh7cbud9TLyt57HKvoZRBeU7h3/+T6IEa2YS6v1dqwwEW3g2KsZA/jnyU0f2thpcKv0piCdo7Byqf+FlEmxK7udcULiOrOyFpgoMdJsoAzISzx/GRpdk13YSZaFcqphWX08zRz/OeEGXLNP21kzY60mDA6ojjATJ06DSwU6ut/uuCN4LkADCuF8+cjIdJK58qmi6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8TnWBq5DymCa4R6jilb5kW6NtC1PG2wjPaKOgUhyg6c=;
 b=IYOXUvtXJlbU8H+/AucXIG3inSMXVSiaVATFmHYBgKe/ErqA24x8CTzjlG1QhzlDnpDdHZkN18BbQubroJQ5nI9qxzLsi+AZ8qA8lE3yYF6dpTq3+Brgl1VY++uoixB2A8KjYjNX06ypoOUm6GreHzTgnzggNBvmS/6vy88leouWkeCgNaAOq6q9iuhWdRlqPx0MaLJz1yXg8oGEMAshssp7UmNedTdh34HyWEWahPdm16Enjv4BEn3QZwf/ZIMSTsF1OBb+H/BecUV5pqZh84FY80na3/lujuTxPA1Sj8PcYrqbv8oGY9VIu0SzNxV3Eh0OH+fVbtRaktSXHY69sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DS0PR11MB7531.namprd11.prod.outlook.com (2603:10b6:8:14a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.37; Thu, 18 Apr
 2024 05:14:30 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 05:14:30 +0000
Content-Type: multipart/alternative;
 boundary="------------iSbUA0bIlX3PusygvKqMyIJ3"
Message-ID: <b8c12b29-ecc1-42e6-9329-0c8e466472fb@intel.com>
Date: Thu, 18 Apr 2024 10:44:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/xe: Introduce the wedged_mode debugfs
To: <intel-xe@lists.freedesktop.org>
References: <20240409221507.1076471-1-rodrigo.vivi@intel.com>
 <20240409221507.1076471-4-rodrigo.vivi@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240409221507.1076471-4-rodrigo.vivi@intel.com>
X-ClientProxiedBy: PN2PR01CA0191.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::18) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DS0PR11MB7531:EE_
X-MS-Office365-Filtering-Correlation-Id: f0da7eb7-6e8b-41cc-bd7e-08dc5f666d1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aCCo9+wpJRw6N0UXKjlTobw8iiDawbi5jr+hForg2tvnhFdWlSnYcvd2iPTRj0Xe9dYIO92Ojd7e2TA4GdbY+mVzvjUVZ08Iq98356hlpoCQCS+QnKB8n5S0pbV3H3oufnTYCu1fkqNVUCOv1ClWdvrwgM3QhkOKMpCqgA33czgKor+aim482yaRhuJFD5AGDiEbVuDB6PclP40vRN0sM4ogJieiGn6HL/gJSVeNWvw1MYPbOVqI7gw9DeokhisWABXwr6rCliFUrzoW9KWpAqUmsVTPLInmkO3AABWVEby4y7BvOWAQDIG4ZWJUpua22iYnWhtCn4vDLTBdlxFfLzWxi2o8rgLRnCfCrl9keqm44j5kWWbeYL0R/qnU47Xa7hPQmOC8QucOd0QptqWP+P1F5S57+anuA1VG2ZwoWBX9UJmo0SnLON2EhCiy0ENxsvBZLq88bh94yBCFGcvgkcBYhdwUjQrKbP16pk5Xw5mo7BvbYb2iBpPCz47f4M2AfiC+XWlAqOHmLWYGdbeVFpx9QQjkB/uPE9wpGJvaKgt60z7ZffTB3cVOwKCd55h1GDDIq2FmkS6Hg5DgQ9Dx0iWE5hY0KKxy/Em63JStGp5ZKjWGan1c2V/dRF19beHTFlUcPudyujDVx8pwGfyKSfsG/YHYonzfxdNR6W+bCZs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlR5OUVOaTllV0pna1NqWVB2UTNFZEpxd3RZM0E5ckVCd0syQVE2enJGMVRO?=
 =?utf-8?B?dTFCUGMzeHViQkxQMzhkcXRhRnFOYjRJa28rSTVxVEwwV2xDMFl0M01PRGpv?=
 =?utf-8?B?amNia2dOYW1XZmY0bnMyR1F3UlBwOFo5ekpQbXZlYmlnRlhZWEpLRVhXZUpm?=
 =?utf-8?B?dmZ2RWpmUXFwdm83OXA0dFBLOGNhZHoySjJOZlFsUGhJNTJPRXVwYVhjUVRa?=
 =?utf-8?B?bUcxR3k0ejBXMDEvSUx6NGwwWTVPU1lnSmRjanh4TlN5azEvaEpQcTh0K21J?=
 =?utf-8?B?cWhYSHZxcnVNL0hRSkFCTFJ6R292TG5JQlhiQkMyNyttNkVYVTJzRitjQ0VK?=
 =?utf-8?B?aW1MOUZUb3pxZHprVWZ6RGJyanc1QSs0d1phUmhtVXB1VllpbUY3Vng0QjZw?=
 =?utf-8?B?QUF2UWNnbEF1Vmw4MSsyNForWmdBTExBTVRPMnJCaEhmMHpSQkFxUHB3RnJR?=
 =?utf-8?B?UnJCaEdLYW5FeHMydDVOMzZPVThwZnJGN0htN2FqazhuMGVWNmFBZ1dkNHB0?=
 =?utf-8?B?OFVVMUpDeUdXYXJQb3UwbnRFVE9qZHNZaWh6NVVxVmZLUjVDaVpNV2JGd1M1?=
 =?utf-8?B?azNDdmx3U3JxZGUxNncwUTdRVjRSSE1VbHd6ZFNYbzREVFAvclh6dnNtUkQx?=
 =?utf-8?B?d1pLZHBnNldQYnZmS3NGZncxSXNZbkNLc1BKd3hsZ2tWc25qNTJLZk95bXds?=
 =?utf-8?B?Z1pZT25pVWxZOVd5OVc3bEJaR21rQ1E2OGIwbW1tVloxbnltUkJ5amp3d1Rz?=
 =?utf-8?B?Zlk0N2lEV3RFb0dHK2VtaklESmxBU0lOd3FGeHFOcTA5cmFKWmF3SW5hVHJP?=
 =?utf-8?B?Zk13V0EydjlEbjVnWDd3RHpRenBid2U2OHZpcXVoY1RtUlV2OGVERExPcElk?=
 =?utf-8?B?c0Q1TXEybjFWMElHYjAwaWFibmgzc2h3TTQwZERzTWdCQWw0WEFaUHNqVXVq?=
 =?utf-8?B?SGhZNGRXNVovVmIvRURJYWl2RERHUmtlVW92WjNnWWlmVXBGbzBVRElTaVZj?=
 =?utf-8?B?eDZDazI1L0RVMFdMQlZ0WjB6c2J3YmhteDQwc0JBNk5tNXFlcDRoU1NrK0pK?=
 =?utf-8?B?aXFRcXROSktveSsvbEZNYUpmNWJLSGcrUUVxQzcxZGI2ZjJoTEFmSEVSYU13?=
 =?utf-8?B?eStOeDArZkxrRnpOcDVEckxLSGFsN1BHdGJndjhHRWhzZWdSTkNlLzJCNC8v?=
 =?utf-8?B?UEJxcmRZUFR5QjMvdDJucXhQM3lRNXZPcVB0ZlA2TlZOUGFPWEdPdHlrdTBJ?=
 =?utf-8?B?azZXYVdDWGczcXd0WGNSM3NsNXg5TURTbzUvbFlPeFl2YzFsbU1ZcVA3NFZO?=
 =?utf-8?B?RXZqVEVPdy8xT0xhVXNUVzZmUkc5dFRFVmtSMk4yZ3RVRnhwOTdaSVVoQWxs?=
 =?utf-8?B?QmpvOHF6VHQ3RjIzY2J6cFR5Ym9hWVJKR0Q4ZWhPUERhODRPb2hSUk5SYVd5?=
 =?utf-8?B?dWZtazRsdzhXbGhGMUJPdFZqUDRsMUNoWStPV254d1I1NXRIejA2ZXlhSkNa?=
 =?utf-8?B?L1ZSYzdndkFsWlZsSm9sM3ZlVGtPVFNRYjE1QVZrQ093SS9od0JUQ3NiTENa?=
 =?utf-8?B?SUpkcXhvbSt5RktTU2orNlR3SWlZTG8zOGc3UEZ5cjFLaGtPYlNMajU5elh4?=
 =?utf-8?B?MHg5MHRTRENTV3pqcFl4d3c1a2tCajhRZlY0RTNNUE9vTnRKUDhsalcwZXRZ?=
 =?utf-8?B?b0VvdTlSRWNJMGFPVElCYzhOc0ZRS1lPUGJqN1JQc2VFYm9wSkE2RHJCYWhZ?=
 =?utf-8?B?dFhwcXVkWWFyc2hORUdvd0xQK2hLT0pzNHN1R0ZrRzJjUEx0ZW5lUktNcFpL?=
 =?utf-8?B?TmJKNzlnY0YxSGhycGpobGxWaGdUTlNLeU1VdTVPaUwwQTVjNlFyOGJ6ejFo?=
 =?utf-8?B?blI4VjlZSmpTT2FjSHcxby8xdFYrckFWRXltWVdWOHdzbEdXSmFnOEZEQ3h5?=
 =?utf-8?B?NG1kalBuVnRvcHFubDJEZlJWTlQ5c1hVSHZoY2xsNWtIMTZteFBSUkZKRC9y?=
 =?utf-8?B?dUVKZzg3aVJvbnBpZUJld2F5TURnRllzNzhNU0FCK2JvQmJhRkJwbFpFNXY0?=
 =?utf-8?B?QVVheGJIN3dvejZRZElXQUUvaHpIYnpGeVpRanF2RlUrUElRYUtPRGZ2MGZO?=
 =?utf-8?B?SllrdFNtUFJHbFFUUjRBRFhZVlpRWVR0ZTAzZzhGQ2NyWnJGWEtJZGdDSnd4?=
 =?utf-8?B?NWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0da7eb7-6e8b-41cc-bd7e-08dc5f666d1d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 05:14:30.4592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DVCrNrhE7LhYkwn2ojKFu9+P8sw5dY4TepZa9udlRFfRGEVDayOWApUlNs1HmiSCA0jXVIoRmNa8tSOOND2RxnWvXXcm9jCTp93XB/AQiOE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7531
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

--------------iSbUA0bIlX3PusygvKqMyIJ3
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 10-04-2024 03:45, Rodrigo Vivi wrote:
> So, the wedged mode can be selected per device at runtime,
> before the tests or before reproducing the issue.
>
> v2: - s/busted/wedged
>      - some locking consistency
>
> Cc: Lucas De Marchi<lucas.demarchi@intel.com>
> Cc: Alan Previn<alan.previn.teres.alexis@intel.com>
> Signed-off-by: Rodrigo Vivi<rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_debugfs.c      | 56 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_device.c       | 41 ++++++++++++++------
>   drivers/gpu/drm/xe/xe_device.h       |  4 +-
>   drivers/gpu/drm/xe/xe_device_types.h | 11 +++++-
>   drivers/gpu/drm/xe/xe_gt.c           |  2 +-
>   drivers/gpu/drm/xe/xe_guc.c          |  2 +-
>   drivers/gpu/drm/xe/xe_guc_ads.c      | 52 +++++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_guc_ads.h      |  1 +
>   drivers/gpu/drm/xe/xe_guc_submit.c   | 28 +++++++-------
>   9 files changed, 163 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 86150cafe0ff..6ff067ea5a8f 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -12,6 +12,7 @@
>   #include "xe_bo.h"
>   #include "xe_device.h"
>   #include "xe_gt_debugfs.h"
> +#include "xe_guc_ads.h"
>   #include "xe_pm.h"
>   #include "xe_step.h"
>   
> @@ -106,6 +107,58 @@ static const struct file_operations forcewake_all_fops = {
>   	.release = forcewake_release,
>   };
>   
> +static ssize_t wedged_mode_show(struct file *f, char __user *ubuf,
> +				size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe = file_inode(f)->i_private;
> +	char buf[32];
> +	int len = 0;
> +
> +	mutex_lock(&xe->wedged.lock);
> +	len = scnprintf(buf, sizeof(buf), "%d\n", xe->wedged.mode);
> +	mutex_unlock(&xe->wedged.lock);
> +
> +	return simple_read_from_buffer(ubuf, size, pos, buf, len);
> +}
> +
> +static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
> +			       size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe = file_inode(f)->i_private;
> +	struct xe_gt *gt;
> +	u32 wedged_mode;
> +	ssize_t ret;
> +	u8 id;
> +
> +	ret = kstrtouint_from_user(ubuf, size, 0, &wedged_mode);
> +	if (ret)
> +		return ret;
> +
> +	if (wedged_mode > 2)
> +		return -EINVAL;
> +
> +	mutex_lock(&xe->wedged.lock);
> +	xe->wedged.mode = wedged_mode;
> +	if (wedged_mode == 2) {



The transition of |xe->wedged.mode|from 2 to 1 indicates change in 
wedged state , yet the GUC policy still retains engine reset disabled, 
which seems incorrect. How about calling 
|xe_guc_ads_scheduler_policy_disable_reset|for both modes (1 and 2) ? 
For mode 1, this function will reset the GUC policies to default settings.

If we agree on calling above function unconditionally, it might be 
better to rename |xe_guc_ads_scheduler_policy_disable_reset|to a more 
suitable name, as for mode 1, it won't actually disable reset.

> +		for_each_gt(gt, xe, id) {
> +			ret = xe_guc_ads_scheduler_policy_disable_reset(&gt->uc.guc.ads);


Given this debugs, where users have the option to choose whether to 
disable engine reset before submission, is the modparam introduced in 
[PATCH 3/4] really necessary? This also ensures post rebind we have 
default policies.

> +			if (ret) {
> +				drm_err(&xe->drm, "Failed to update GuC ADS scheduler policy. GPU might still reset even on the wedged_mode=2\n");
> +				break;
> +			}
> +		}
> +	}
> +	mutex_unlock(&xe->wedged.lock);
> +
> +	return size;
> +}
> +
> +static const struct file_operations wedged_mode_fops = {
> +	.owner = THIS_MODULE,
> +	.read = wedged_mode_show,
> +	.write = wedged_mode_set,
> +};
> +
>   void xe_debugfs_register(struct xe_device *xe)
>   {
>   	struct ttm_device *bdev = &xe->ttm;
> @@ -123,6 +176,9 @@ void xe_debugfs_register(struct xe_device *xe)
>   	debugfs_create_file("forcewake_all", 0400, root, xe,
>   			    &forcewake_all_fops);
>   
> +	debugfs_create_file("wedged_mode", 0400, root, xe,
> +			    &wedged_mode_fops);
> +
>   	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
>   		man = ttm_manager_type(bdev, mem_type);
>   
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 7928a5470cee..949fca2f0400 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -445,6 +445,9 @@ int xe_device_probe_early(struct xe_device *xe)
>   	if (err)
>   		return err;
>   
> +	mutex_init(&xe->wedged.lock);
> +	xe->wedged.mode = xe_modparam.wedged_mode;
> +
>   	return 0;
>   }
>   
> @@ -787,26 +790,37 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
>   }
>   
>   /**
> - * xe_device_declare_wedged - Declare device wedged
> + * xe_device_hint_wedged - Get a hint and possibly declare device as wedged
>    * @xe: xe device instance
> + * @in_timeout_path: hint coming from a timeout path
>    *
> - * This is a final state that can only be cleared with a module
> + * The wedged state is a final on that can only be cleared with a module
>    * re-probe (unbind + bind).
>    * In this state every IOCTL will be blocked so the GT cannot be used.
> - * In general it will be called upon any critical error such as gt reset
> - * failure or guc loading failure.
> - * If xe.wedged module parameter is set to 2, this function will be called
> - * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
> - * snapshot capture. In this mode, GT reset won't be attempted so the state of
> - * the issue is preserved for further debugging.
> + * In general device will be declared wedged only at critical
> + * error paths such as gt reset failure or guc loading failure.
> + * Hints are also expected from every single execution timeout (a.k.a. GPU hang)
> + * right after devcoredump snapshot capture. Then, device can be declared wedged
> + * if wedged_mode is set to 2. In this mode, GT reset won't be attempted so the
> + * state of the issue is preserved for further debugging.
> + *
> + * Return: True if device has been just declared wedged. False otherwise.
>    */
> -void xe_device_declare_wedged(struct xe_device *xe)
> +bool xe_device_hint_wedged(struct xe_device *xe, bool in_timeout_path)
>   {
> -	if (xe_modparam.wedged_mode == 0)
> -		return;
> +	bool ret = false;
> +
> +	mutex_lock(&xe->wedged.lock);
>   
> -	if (!atomic_xchg(&xe->wedged, 1)) {
> +	if (xe->wedged.mode == 0)
> +		goto out;
> +
> +	if (in_timeout_path && xe->wedged.mode != 2)
> +		goto out;
> +
> +	if (!atomic_xchg(&xe->wedged.flag, 1)) {
>   		xe->needs_flr_on_fini = true;
> +		ret = true;
>   		drm_err(&xe->drm,
>   			"CRITICAL: Xe has declared device %s as wedged.\n"
>   			"IOCTLs and executions are blocked until device is probed again with unbind and bind operations:\n"
> @@ -816,4 +830,7 @@ void xe_device_declare_wedged(struct xe_device *xe)
>   			dev_name(xe->drm.dev), dev_name(xe->drm.dev),
>   			dev_name(xe->drm.dev));
>   	}
> +out:
> +	mutex_unlock(&xe->wedged.lock);
> +	return ret;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 0fea5c18f76d..e3ea8a43e7f9 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -178,9 +178,9 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
>   
>   static inline bool xe_device_wedged(struct xe_device *xe)
>   {
> -	return atomic_read(&xe->wedged);
> +	return atomic_read(&xe->wedged.flag);
>   }
>   
> -void xe_device_declare_wedged(struct xe_device *xe);
> +bool xe_device_hint_wedged(struct xe_device *xe, bool in_timeout_path);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index b9ef60f21750..0da4787f1087 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -458,8 +458,15 @@ struct xe_device {
>   	/** @needs_flr_on_fini: requests function-reset on fini */
>   	bool needs_flr_on_fini;
>   
> -	/** @wedged: Xe device faced a critical error and is now blocked. */
> -	atomic_t wedged;
> +	/** @wedged: Struct to control Wedged States and mode */
> +	struct {
> +		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
> +		atomic_t flag;
> +		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
> +		int mode;
> +		/** @wedged.lock: To protect @wedged.mode */
> +		struct mutex lock;
> +	} wedged;
>   
>   	/* private: */
>   
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 0844081b88ef..da16f4273877 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -688,7 +688,7 @@ static int gt_reset(struct xe_gt *gt)
>   err_fail:
>   	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
>   
> -	xe_device_declare_wedged(gt_to_xe(gt));
> +	xe_device_hint_wedged(gt_to_xe(gt), false);
>   
>   	return err;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index f1c3e338301d..ee7e0fa4815d 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -495,7 +495,7 @@ static void guc_wait_ucode(struct xe_guc *guc)
>   			xe_gt_err(gt, "GuC firmware exception. EIP: %#x\n",
>   				  xe_mmio_read32(gt, SOFT_SCRATCH(13)));
>   
> -		xe_device_declare_wedged(gt_to_xe(gt));
> +		xe_device_hint_wedged(gt_to_xe(gt), false);
>   	} else {
>   		xe_gt_dbg(gt, "GuC successfully loaded\n");
>   	}
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index dbd88ae20aa3..ad64d5a31239 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -9,6 +9,7 @@
>   
>   #include <generated/xe_wa_oob.h>
>   
> +#include "abi/guc_actions_abi.h"
>   #include "regs/xe_engine_regs.h"
>   #include "regs/xe_gt_regs.h"
>   #include "regs/xe_guc_regs.h"
> @@ -16,11 +17,11 @@
>   #include "xe_gt.h"
>   #include "xe_gt_ccs_mode.h"
>   #include "xe_guc.h"
> +#include "xe_guc_ct.h"
>   #include "xe_hw_engine.h"
>   #include "xe_lrc.h"
>   #include "xe_map.h"
>   #include "xe_mmio.h"
> -#include "xe_module.h"
>   #include "xe_platform_types.h"
>   #include "xe_wa.h"
>   
> @@ -395,6 +396,7 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
>   
>   static void guc_policies_init(struct xe_guc_ads *ads)
>   {
> +	struct xe_device *xe = ads_to_xe(ads);
>   	u32 global_flags = 0;
>   
>   	ads_blob_write(ads, policies.dpc_promote_time,
> @@ -402,8 +404,10 @@ static void guc_policies_init(struct xe_guc_ads *ads)
>   	ads_blob_write(ads, policies.max_num_work_items,
>   		       GLOBAL_POLICY_MAX_NUM_WI);
>   
> -	if (xe_modparam.wedged_mode == 2)
> +	mutex_lock(&xe->wedged.lock);
> +	if (xe->wedged.mode == 2)
>   		global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
> +	mutex_unlock(&xe->wedged.lock);
>   
>   	ads_blob_write(ads, policies.global_flags, global_flags);
>   	ads_blob_write(ads, policies.is_valid, 1);
> @@ -760,3 +764,47 @@ void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads)
>   {
>   	guc_populate_golden_lrc(ads);
>   }
> +
> +static int guc_ads_action_update_policies(struct xe_guc_ads *ads, u32 policy_offset)
> +{
> +	struct  xe_guc_ct *ct = &ads_to_guc(ads)->ct;
> +	u32 action[] = {
> +		XE_GUC_ACTION_GLOBAL_SCHED_POLICY_CHANGE,
> +		policy_offset
> +	};
> +
> +	return xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> +}
> +
> +int xe_guc_ads_scheduler_policy_disable_reset(struct xe_guc_ads *ads)
> +{
> +	struct xe_device *xe = ads_to_xe(ads);
> +	struct xe_gt *gt = ads_to_gt(ads);
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct guc_policies *policies;
> +	struct xe_bo *bo;
> +	int ret = 0;
> +
> +	policies = kmalloc(sizeof(*policies), GFP_KERNEL);
> +	if (!policies)
> +		return -ENOMEM;
> +
> +	policies->dpc_promote_time = ads_blob_read(ads, policies.dpc_promote_time);
> +	policies->max_num_work_items = ads_blob_read(ads, policies.max_num_work_items);
> +	policies->is_valid = 1;
> +	if (xe->wedged.mode == 2)
> +		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
> +
> +	bo = xe_managed_bo_create_from_data(xe, tile, policies, sizeof(struct guc_policies),
> +					    XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +					    XE_BO_FLAG_GGTT);
> +	if (IS_ERR(bo)) {
> +		ret = PTR_ERR(bo);
> +		goto out;
> +	}
> +
> +	ret = guc_ads_action_update_policies(ads, xe_bo_ggtt_addr(bo));
> +out:
> +	kfree(policies);
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.h b/drivers/gpu/drm/xe/xe_guc_ads.h
> index 138ef6267671..7c45c40fab34 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.h
> @@ -13,5 +13,6 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads);
>   void xe_guc_ads_populate(struct xe_guc_ads *ads);
>   void xe_guc_ads_populate_minimal(struct xe_guc_ads *ads);
>   void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads);
> +int xe_guc_ads_scheduler_policy_disable_reset(struct xe_guc_ads *ads);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 0bea17536659..7de97b90ad00 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -35,7 +35,6 @@
>   #include "xe_macros.h"
>   #include "xe_map.h"
>   #include "xe_mocs.h"
> -#include "xe_module.h"
>   #include "xe_ring_ops_types.h"
>   #include "xe_sched_job.h"
>   #include "xe_trace.h"
> @@ -868,26 +867,33 @@ static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
>   		xe_sched_tdr_queue_imm(&q->guc->sched);
>   }
>   
> -static void guc_submit_wedged(struct xe_guc *guc)
> +static bool guc_submit_hint_wedged(struct xe_guc *guc)
>   {
>   	struct xe_exec_queue *q;
>   	unsigned long index;
>   	int err;
>   
> -	xe_device_declare_wedged(guc_to_xe(guc));
> +	if (xe_device_wedged(guc_to_xe(guc)))
> +		return true;
> +
> +	if (!xe_device_hint_wedged(guc_to_xe(guc), true))
> +		return false;
> +
>   	xe_guc_submit_reset_prepare(guc);
>   	xe_guc_ct_stop(&guc->ct);
>   
>   	err = drmm_add_action_or_reset(&guc_to_xe(guc)->drm,
>   				       guc_submit_wedged_fini, guc);
>   	if (err)
> -		return;
> +		return true; /* Device is wedged anyway */
>   
>   	mutex_lock(&guc->submission_state.lock);
>   	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
>   		if (xe_exec_queue_get_unless_zero(q))
>   			set_exec_queue_wedged(q);
>   	mutex_unlock(&guc->submission_state.lock);
> +
> +	return true;
>   }
>   
>   static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> @@ -898,15 +904,12 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>   	struct xe_guc *guc = exec_queue_to_guc(q);
>   	struct xe_device *xe = guc_to_xe(guc);
>   	struct xe_gpu_scheduler *sched = &ge->sched;
> -	bool wedged = xe_device_wedged(xe);
> +	bool wedged;
>   
>   	xe_assert(xe, xe_exec_queue_is_lr(q));
>   	trace_xe_exec_queue_lr_cleanup(q);
>   
> -	if (!wedged && xe_modparam.wedged_mode == 2) {
> -		guc_submit_wedged(exec_queue_to_guc(q));
> -		wedged = true;
> -	}
> +	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
>   
>   	/* Kill the run_job / process_msg entry points */
>   	xe_sched_submission_stop(sched);
> @@ -957,7 +960,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(q));
>   	int err = -ETIME;
>   	int i = 0;
> -	bool wedged = xe_device_wedged(xe);
> +	bool wedged;
>   
>   	/*
>   	 * TDR has fired before free job worker. Common if exec queue
> @@ -981,10 +984,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   
>   	trace_xe_sched_job_timedout(job);
>   
> -	if (!wedged && xe_modparam.wedged_mode == 2) {
> -		guc_submit_wedged(exec_queue_to_guc(q));
> -		wedged = true;
> -	}
> +	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
>   
>   	/* Kill the run_job entry point */
>   	xe_sched_submission_stop(sched);
--------------iSbUA0bIlX3PusygvKqMyIJ3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 10-04-2024 03:45, Rodrigo Vivi
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20240409221507.1076471-4-rodrigo.=
vivi@intel.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">So, the wedged mode can be sel=
ected per device at runtime,
before the tests or before reproducing the issue.

v2: - s/busted/wedged
    - some locking consistency

Cc: Lucas De Marchi <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:lucas=
.demarchi@intel.com">&lt;lucas.demarchi@intel.com&gt;</a>
Cc: Alan Previn <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:alan.prev=
in.teres.alexis@intel.com">&lt;alan.previn.teres.alexis@intel.com&gt;</a>
Signed-off-by: Rodrigo Vivi <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_debugfs.c      | 56 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.c       | 41 ++++++++++++++------
 drivers/gpu/drm/xe/xe_device.h       |  4 +-
 drivers/gpu/drm/xe/xe_device_types.h | 11 +++++-
 drivers/gpu/drm/xe/xe_gt.c           |  2 +-
 drivers/gpu/drm/xe/xe_guc.c          |  2 +-
 drivers/gpu/drm/xe/xe_guc_ads.c      | 52 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_ads.h      |  1 +
 drivers/gpu/drm/xe/xe_guc_submit.c   | 28 +++++++-------
 9 files changed, 163 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugf=
s.c
index 86150cafe0ff..6ff067ea5a8f 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -12,6 +12,7 @@
 #include &quot;xe_bo.h&quot;
 #include &quot;xe_device.h&quot;
 #include &quot;xe_gt_debugfs.h&quot;
+#include &quot;xe_guc_ads.h&quot;
 #include &quot;xe_pm.h&quot;
 #include &quot;xe_step.h&quot;
=20
@@ -106,6 +107,58 @@ static const struct file_operations forcewake_all_fops=
 =3D {
 	.release =3D forcewake_release,
 };
=20
+static ssize_t wedged_mode_show(struct file *f, char __user *ubuf,
+				size_t size, loff_t *pos)
+{
+	struct xe_device *xe =3D file_inode(f)-&gt;i_private;
+	char buf[32];
+	int len =3D 0;
+
+	mutex_lock(&amp;xe-&gt;wedged.lock);
+	len =3D scnprintf(buf, sizeof(buf), &quot;%d\n&quot;, xe-&gt;wedged.mode)=
;
+	mutex_unlock(&amp;xe-&gt;wedged.lock);
+
+	return simple_read_from_buffer(ubuf, size, pos, buf, len);
+}
+
+static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
+			       size_t size, loff_t *pos)
+{
+	struct xe_device *xe =3D file_inode(f)-&gt;i_private;
+	struct xe_gt *gt;
+	u32 wedged_mode;
+	ssize_t ret;
+	u8 id;
+
+	ret =3D kstrtouint_from_user(ubuf, size, 0, &amp;wedged_mode);
+	if (ret)
+		return ret;
+
+	if (wedged_mode &gt; 2)
+		return -EINVAL;
+
+	mutex_lock(&amp;xe-&gt;wedged.lock);
+	xe-&gt;wedged.mode =3D wedged_mode;
+	if (wedged_mode =3D=3D 2) {</pre>
    </blockquote>
    <p><br>
    </p>
    <p><br>
    </p>
    <p><span style=3D"color: rgb(13, 13, 13); font-family: S=C3=B6hne, ui-s=
ans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, =
Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, A=
rial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Sego=
e UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-styl=
e: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-=
weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-in=
dent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text=
-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, =
255); text-decoration-thickness: initial; text-decoration-style: initial; t=
ext-decoration-color: initial; display: inline !important; float: none;">Th=
e transition of </span><code style=3D"border: 0px solid rgb(227, 227, 227);=
 box-sizing: border-box; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0=
; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0;=
 --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y=
: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradien=
t-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position:=
 ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric=
-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-wi=
dth: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5)=
; --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transpare=
nt; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --t=
w-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-ro=
tate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; -=
-tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; =
--tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert=
: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia:=
 ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-c=
ontain-style: ; font-feature-settings: normal; font-family: &quot;S=C3=B6hn=
e Mono&quot;, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, mon=
ospace !important; font-size: 0.875em; font-variation-settings: normal; col=
or: rgb(13, 13, 13); font-style: normal; font-variant-ligatures: normal; fo=
nt-variant-caps: normal; letter-spacing: normal; text-align: start; text-in=
dent: 0px; text-transform: none; word-spacing: 0px; -webkit-text-stroke-wid=
th: 0px; white-space: pre-wrap; background-color: rgb(255, 255, 255); text-=
decoration-thickness: initial; text-decoration-style: initial; text-decorat=
ion-color: initial;">xe-&gt;wedged.mode</code><span style=3D"color: rgb(13,=
 13, 13); font-family: S=C3=B6hne, ui-sans-serif, system-ui, -apple-system,=
 &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sa=
ns-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;,=
 &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color =
Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: n=
ormal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal;=
 orphans: 2; text-align: start; text-indent: 0px; text-transform: none; wid=
ows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre=
-wrap; background-color: rgb(255, 255, 255); text-decoration-thickness: ini=
tial; text-decoration-style: initial; text-decoration-color: initial; displ=
ay: inline !important; float: none;"> from 2 to 1 indicates change in wedge=
d state , yet the GUC policy still retains engine reset disabled, which see=
ms incorrect.  How about calling </span><code style=3D"border: 0px solid rg=
b(227, 227, 227); box-sizing: border-box; --tw-border-spacing-x: 0; --tw-bo=
rder-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0=
; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pa=
n-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proxim=
ity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-grad=
ient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figur=
e: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --=
tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: r=
gba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shad=
ow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0=
 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-graysca=
le: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw=
-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-back=
drop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --t=
w-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --t=
w-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contai=
n-paint: ; --tw-contain-style: ; font-feature-settings: normal; font-family=
: &quot;S=C3=B6hne Mono&quot;, Monaco, &quot;Andale Mono&quot;, &quot;Ubunt=
u Mono&quot;, monospace !important; font-size: 0.875em; font-variation-sett=
ings: normal; color: rgb(13, 13, 13); font-style: normal; font-variant-liga=
tures: normal; font-variant-caps: normal; letter-spacing: normal; text-alig=
n: start; text-indent: 0px; text-transform: none; word-spacing: 0px; -webki=
t-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255,=
 255, 255); text-decoration-thickness: initial; text-decoration-style: init=
ial; text-decoration-color: initial;">xe_guc_ads_scheduler_policy_disable_r=
eset</code><span style=3D"color: rgb(13, 13, 13); font-family: S=C3=B6hne, =
ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubun=
tu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot=
;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;=
Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-=
style: normal; font-variant-ligatures: normal; font-variant-caps: normal; f=
ont-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; tex=
t-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-=
text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 2=
55, 255); text-decoration-thickness: initial; text-decoration-style: initia=
l; text-decoration-color: initial; display: inline !important; float: none;=
"> for both modes (1 and 2) ? For mode 1, this function will reset the GUC =
policies to default settings. </span></p>
    <p><span style=3D"color: rgb(13, 13, 13); font-family: S=C3=B6hne, ui-s=
ans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, =
Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, A=
rial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Sego=
e UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-styl=
e: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-=
weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-in=
dent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text=
-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, =
255); text-decoration-thickness: initial; text-decoration-style: initial; t=
ext-decoration-color: initial; display: inline !important; float: none;">If=
 we agree on calling above function unconditionally,  it might be better to=
 rename </span><code style=3D"border: 0px solid rgb(227, 227, 227); box-siz=
ing: border-box; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-t=
ranslate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-sk=
ew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw=
-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-p=
osition: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-=
ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing=
: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px=
; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-r=
ing-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw=
-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: =
; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; =
--tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-back=
drop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-bac=
kdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw=
-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-=
contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-s=
tyle: ; font-feature-settings: normal; font-family: &quot;S=C3=B6hne Mono&q=
uot;, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace !=
important; font-size: 0.875em; font-variation-settings: normal; color: rgb(=
13, 13, 13); font-style: normal; font-variant-ligatures: normal; font-varia=
nt-caps: normal; letter-spacing: normal; text-align: start; text-indent: 0p=
x; text-transform: none; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 white-space: pre-wrap; background-color: rgb(255, 255, 255); text-decorati=
on-thickness: initial; text-decoration-style: initial; text-decoration-colo=
r: initial;">xe_guc_ads_scheduler_policy_disable_reset</code><span style=3D=
"color: rgb(13, 13, 13); font-family: S=C3=B6hne, ui-sans-serif, system-ui,=
 -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto=
 Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Col=
or Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &q=
uot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-varia=
nt-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-s=
pacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-trans=
form: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; w=
hite-space: pre-wrap; background-color: rgb(255, 255, 255); text-decoration=
-thickness: initial; text-decoration-style: initial; text-decoration-color:=
 initial; display: inline !important; float: none;"> to a more suitable nam=
e, as for mode 1, it won't actually disable reset.</span></p>
    <p><span style=3D"color: rgb(13, 13, 13); font-family: S=C3=B6hne, ui-s=
ans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, =
Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, A=
rial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Sego=
e UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-styl=
e: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-=
weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-in=
dent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text=
-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, =
255); text-decoration-thickness: initial; text-decoration-style: initial; t=
ext-decoration-color: initial; display: inline !important; float: none;">
</span></p>
    <p><span style=3D"color: rgb(13, 13, 13); font-family: S=C3=B6hne, ui-s=
ans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, =
Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, A=
rial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Sego=
e UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-styl=
e: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-=
weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-in=
dent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text=
-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, =
255); text-decoration-thickness: initial; text-decoration-style: initial; t=
ext-decoration-color: initial; display: inline !important; float: none;">
</span></p>
    <blockquote type=3D"cite" cite=3D"mid:20240409221507.1076471-4-rodrigo.=
vivi@intel.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
+		for_each_gt(gt, xe, id) {
+			ret =3D xe_guc_ads_scheduler_policy_disable_reset(&amp;gt-&gt;uc.guc.ad=
s);</pre>
    </blockquote>
    <p><br>
    </p>
    <p><span style=3D"color: rgb(13, 13, 13); font-family: S=C3=B6hne, ui-s=
ans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, =
Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, A=
rial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Sego=
e UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-styl=
e: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-=
weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-in=
dent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text=
-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, =
255); text-decoration-thickness: initial; text-decoration-style: initial; t=
ext-decoration-color: initial; display: inline !important; float: none;">Gi=
ven this debugs, where users have the option to choose whether to disable e=
ngine reset before submission, is the modparam introduced in [PATCH 3/4] re=
ally necessary? This also ensures post rebind we have default policies.</sp=
an></p>
    <p><span style=3D"color: rgb(13, 13, 13); font-family: S=C3=B6hne, ui-s=
ans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, =
Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, A=
rial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Sego=
e UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-styl=
e: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-=
weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-in=
dent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text=
-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, =
255); text-decoration-thickness: initial; text-decoration-style: initial; t=
ext-decoration-color: initial; display: inline !important; float: none;">
</span></p>
    <blockquote type=3D"cite" cite=3D"mid:20240409221507.1076471-4-rodrigo.=
vivi@intel.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
+			if (ret) {
+				drm_err(&amp;xe-&gt;drm, &quot;Failed to update GuC ADS scheduler poli=
cy. GPU might still reset even on the wedged_mode=3D2\n&quot;);
+				break;
+			}
+		}
+	}
+	mutex_unlock(&amp;xe-&gt;wedged.lock);
+
+	return size;
+}
+
+static const struct file_operations wedged_mode_fops =3D {
+	.owner =3D THIS_MODULE,
+	.read =3D wedged_mode_show,
+	.write =3D wedged_mode_set,
+};
+
 void xe_debugfs_register(struct xe_device *xe)
 {
 	struct ttm_device *bdev =3D &amp;xe-&gt;ttm;
@@ -123,6 +176,9 @@ void xe_debugfs_register(struct xe_device *xe)
 	debugfs_create_file(&quot;forcewake_all&quot;, 0400, root, xe,
 			    &amp;forcewake_all_fops);
=20
+	debugfs_create_file(&quot;wedged_mode&quot;, 0400, root, xe,
+			    &amp;wedged_mode_fops);
+
 	for (mem_type =3D XE_PL_VRAM0; mem_type &lt;=3D XE_PL_VRAM1; ++mem_type) =
{
 		man =3D ttm_manager_type(bdev, mem_type);
=20
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.=
c
index 7928a5470cee..949fca2f0400 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -445,6 +445,9 @@ int xe_device_probe_early(struct xe_device *xe)
 	if (err)
 		return err;
=20
+	mutex_init(&amp;xe-&gt;wedged.lock);
+	xe-&gt;wedged.mode =3D xe_modparam.wedged_mode;
+
 	return 0;
 }
=20
@@ -787,26 +790,37 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *x=
e, u64 address)
 }
=20
 /**
- * xe_device_declare_wedged - Declare device wedged
+ * xe_device_hint_wedged - Get a hint and possibly declare device as wedge=
d
  * @xe: xe device instance
+ * @in_timeout_path: hint coming from a timeout path
  *
- * This is a final state that can only be cleared with a module
+ * The wedged state is a final on that can only be cleared with a module
  * re-probe (unbind + bind).
  * In this state every IOCTL will be blocked so the GT cannot be used.
- * In general it will be called upon any critical error such as gt reset
- * failure or guc loading failure.
- * If xe.wedged module parameter is set to 2, this function will be called
- * on every single execution timeout (a.k.a. GPU hang) right after devcore=
dump
- * snapshot capture. In this mode, GT reset won't be attempted so the stat=
e of
- * the issue is preserved for further debugging.
+ * In general device will be declared wedged only at critical
+ * error paths such as gt reset failure or guc loading failure.
+ * Hints are also expected from every single execution timeout (a.k.a. GPU=
 hang)
+ * right after devcoredump snapshot capture. Then, device can be declared =
wedged
+ * if wedged_mode is set to 2. In this mode, GT reset won't be attempted s=
o the
+ * state of the issue is preserved for further debugging.
+ *
+ * Return: True if device has been just declared wedged. False otherwise.
  */
-void xe_device_declare_wedged(struct xe_device *xe)
+bool xe_device_hint_wedged(struct xe_device *xe, bool in_timeout_path)
 {
-	if (xe_modparam.wedged_mode =3D=3D 0)
-		return;
+	bool ret =3D false;
+
+	mutex_lock(&amp;xe-&gt;wedged.lock);
=20
-	if (!atomic_xchg(&amp;xe-&gt;wedged, 1)) {
+	if (xe-&gt;wedged.mode =3D=3D 0)
+		goto out;
+
+	if (in_timeout_path &amp;&amp; xe-&gt;wedged.mode !=3D 2)
+		goto out;
+
+	if (!atomic_xchg(&amp;xe-&gt;wedged.flag, 1)) {
 		xe-&gt;needs_flr_on_fini =3D true;
+		ret =3D true;
 		drm_err(&amp;xe-&gt;drm,
 			&quot;CRITICAL: Xe has declared device %s as wedged.\n&quot;
 			&quot;IOCTLs and executions are blocked until device is probed again wi=
th unbind and bind operations:\n&quot;
@@ -816,4 +830,7 @@ void xe_device_declare_wedged(struct xe_device *xe)
 			dev_name(xe-&gt;drm.dev), dev_name(xe-&gt;drm.dev),
 			dev_name(xe-&gt;drm.dev));
 	}
+out:
+	mutex_unlock(&amp;xe-&gt;wedged.lock);
+	return ret;
 }
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.=
h
index 0fea5c18f76d..e3ea8a43e7f9 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -178,9 +178,9 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe,=
 u64 address);
=20
 static inline bool xe_device_wedged(struct xe_device *xe)
 {
-	return atomic_read(&amp;xe-&gt;wedged);
+	return atomic_read(&amp;xe-&gt;wedged.flag);
 }
=20
-void xe_device_declare_wedged(struct xe_device *xe);
+bool xe_device_hint_wedged(struct xe_device *xe, bool in_timeout_path);
=20
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_d=
evice_types.h
index b9ef60f21750..0da4787f1087 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -458,8 +458,15 @@ struct xe_device {
 	/** @needs_flr_on_fini: requests function-reset on fini */
 	bool needs_flr_on_fini;
=20
-	/** @wedged: Xe device faced a critical error and is now blocked. */
-	atomic_t wedged;
+	/** @wedged: Struct to control Wedged States and mode */
+	struct {
+		/** @wedged.flag: Xe device faced a critical error and is now blocked. *=
/
+		atomic_t flag;
+		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
+		int mode;
+		/** @wedged.lock: To protect @wedged.mode */
+		struct mutex lock;
+	} wedged;
=20
 	/* private: */
=20
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 0844081b88ef..da16f4273877 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -688,7 +688,7 @@ static int gt_reset(struct xe_gt *gt)
 err_fail:
 	xe_gt_err(gt, &quot;reset failed (%pe)\n&quot;, ERR_PTR(err));
=20
-	xe_device_declare_wedged(gt_to_xe(gt));
+	xe_device_hint_wedged(gt_to_xe(gt), false);
=20
 	return err;
 }
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index f1c3e338301d..ee7e0fa4815d 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -495,7 +495,7 @@ static void guc_wait_ucode(struct xe_guc *guc)
 			xe_gt_err(gt, &quot;GuC firmware exception. EIP: %#x\n&quot;,
 				  xe_mmio_read32(gt, SOFT_SCRATCH(13)));
=20
-		xe_device_declare_wedged(gt_to_xe(gt));
+		xe_device_hint_wedged(gt_to_xe(gt), false);
 	} else {
 		xe_gt_dbg(gt, &quot;GuC successfully loaded\n&quot;);
 	}
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ad=
s.c
index dbd88ae20aa3..ad64d5a31239 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -9,6 +9,7 @@
=20
 #include &lt;generated/xe_wa_oob.h&gt;
=20
+#include &quot;abi/guc_actions_abi.h&quot;
 #include &quot;regs/xe_engine_regs.h&quot;
 #include &quot;regs/xe_gt_regs.h&quot;
 #include &quot;regs/xe_guc_regs.h&quot;
@@ -16,11 +17,11 @@
 #include &quot;xe_gt.h&quot;
 #include &quot;xe_gt_ccs_mode.h&quot;
 #include &quot;xe_guc.h&quot;
+#include &quot;xe_guc_ct.h&quot;
 #include &quot;xe_hw_engine.h&quot;
 #include &quot;xe_lrc.h&quot;
 #include &quot;xe_map.h&quot;
 #include &quot;xe_mmio.h&quot;
-#include &quot;xe_module.h&quot;
 #include &quot;xe_platform_types.h&quot;
 #include &quot;xe_wa.h&quot;
=20
@@ -395,6 +396,7 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ad=
s)
=20
 static void guc_policies_init(struct xe_guc_ads *ads)
 {
+	struct xe_device *xe =3D ads_to_xe(ads);
 	u32 global_flags =3D 0;
=20
 	ads_blob_write(ads, policies.dpc_promote_time,
@@ -402,8 +404,10 @@ static void guc_policies_init(struct xe_guc_ads *ads)
 	ads_blob_write(ads, policies.max_num_work_items,
 		       GLOBAL_POLICY_MAX_NUM_WI);
=20
-	if (xe_modparam.wedged_mode =3D=3D 2)
+	mutex_lock(&amp;xe-&gt;wedged.lock);
+	if (xe-&gt;wedged.mode =3D=3D 2)
 		global_flags |=3D GLOBAL_POLICY_DISABLE_ENGINE_RESET;
+	mutex_unlock(&amp;xe-&gt;wedged.lock);
=20
 	ads_blob_write(ads, policies.global_flags, global_flags);
 	ads_blob_write(ads, policies.is_valid, 1);
@@ -760,3 +764,47 @@ void xe_guc_ads_populate_post_load(struct xe_guc_ads *=
ads)
 {
 	guc_populate_golden_lrc(ads);
 }
+
+static int guc_ads_action_update_policies(struct xe_guc_ads *ads, u32 poli=
cy_offset)
+{
+	struct  xe_guc_ct *ct =3D &amp;ads_to_guc(ads)-&gt;ct;
+	u32 action[] =3D {
+		XE_GUC_ACTION_GLOBAL_SCHED_POLICY_CHANGE,
+		policy_offset
+	};
+
+	return xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
+}
+
+int xe_guc_ads_scheduler_policy_disable_reset(struct xe_guc_ads *ads)
+{
+	struct xe_device *xe =3D ads_to_xe(ads);
+	struct xe_gt *gt =3D ads_to_gt(ads);
+	struct xe_tile *tile =3D gt_to_tile(gt);
+	struct guc_policies *policies;
+	struct xe_bo *bo;
+	int ret =3D 0;
+
+	policies =3D kmalloc(sizeof(*policies), GFP_KERNEL);
+	if (!policies)
+		return -ENOMEM;
+
+	policies-&gt;dpc_promote_time =3D ads_blob_read(ads, policies.dpc_promote=
_time);
+	policies-&gt;max_num_work_items =3D ads_blob_read(ads, policies.max_num_w=
ork_items);
+	policies-&gt;is_valid =3D 1;
+	if (xe-&gt;wedged.mode =3D=3D 2)
+		policies-&gt;global_flags |=3D GLOBAL_POLICY_DISABLE_ENGINE_RESET;
+
+	bo =3D xe_managed_bo_create_from_data(xe, tile, policies, sizeof(struct g=
uc_policies),
+					    XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+					    XE_BO_FLAG_GGTT);
+	if (IS_ERR(bo)) {
+		ret =3D PTR_ERR(bo);
+		goto out;
+	}
+
+	ret =3D guc_ads_action_update_policies(ads, xe_bo_ggtt_addr(bo));
+out:
+	kfree(policies);
+	return ret;
+}
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.h b/drivers/gpu/drm/xe/xe_guc_ad=
s.h
index 138ef6267671..7c45c40fab34 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.h
+++ b/drivers/gpu/drm/xe/xe_guc_ads.h
@@ -13,5 +13,6 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)=
;
 void xe_guc_ads_populate(struct xe_guc_ads *ads);
 void xe_guc_ads_populate_minimal(struct xe_guc_ads *ads);
 void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads);
+int xe_guc_ads_scheduler_policy_disable_reset(struct xe_guc_ads *ads);
=20
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc=
_submit.c
index 0bea17536659..7de97b90ad00 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -35,7 +35,6 @@
 #include &quot;xe_macros.h&quot;
 #include &quot;xe_map.h&quot;
 #include &quot;xe_mocs.h&quot;
-#include &quot;xe_module.h&quot;
 #include &quot;xe_ring_ops_types.h&quot;
 #include &quot;xe_sched_job.h&quot;
 #include &quot;xe_trace.h&quot;
@@ -868,26 +867,33 @@ static void xe_guc_exec_queue_trigger_cleanup(struct =
xe_exec_queue *q)
 		xe_sched_tdr_queue_imm(&amp;q-&gt;guc-&gt;sched);
 }
=20
-static void guc_submit_wedged(struct xe_guc *guc)
+static bool guc_submit_hint_wedged(struct xe_guc *guc)
 {
 	struct xe_exec_queue *q;
 	unsigned long index;
 	int err;
=20
-	xe_device_declare_wedged(guc_to_xe(guc));
+	if (xe_device_wedged(guc_to_xe(guc)))
+		return true;
+
+	if (!xe_device_hint_wedged(guc_to_xe(guc), true))
+		return false;
+
 	xe_guc_submit_reset_prepare(guc);
 	xe_guc_ct_stop(&amp;guc-&gt;ct);
=20
 	err =3D drmm_add_action_or_reset(&amp;guc_to_xe(guc)-&gt;drm,
 				       guc_submit_wedged_fini, guc);
 	if (err)
-		return;
+		return true; /* Device is wedged anyway */
=20
 	mutex_lock(&amp;guc-&gt;submission_state.lock);
 	xa_for_each(&amp;guc-&gt;submission_state.exec_queue_lookup, index, q)
 		if (xe_exec_queue_get_unless_zero(q))
 			set_exec_queue_wedged(q);
 	mutex_unlock(&amp;guc-&gt;submission_state.lock);
+
+	return true;
 }
=20
 static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
@@ -898,15 +904,12 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_=
struct *w)
 	struct xe_guc *guc =3D exec_queue_to_guc(q);
 	struct xe_device *xe =3D guc_to_xe(guc);
 	struct xe_gpu_scheduler *sched =3D &amp;ge-&gt;sched;
-	bool wedged =3D xe_device_wedged(xe);
+	bool wedged;
=20
 	xe_assert(xe, xe_exec_queue_is_lr(q));
 	trace_xe_exec_queue_lr_cleanup(q);
=20
-	if (!wedged &amp;&amp; xe_modparam.wedged_mode =3D=3D 2) {
-		guc_submit_wedged(exec_queue_to_guc(q));
-		wedged =3D true;
-	}
+	wedged =3D guc_submit_hint_wedged(exec_queue_to_guc(q));
=20
 	/* Kill the run_job / process_msg entry points */
 	xe_sched_submission_stop(sched);
@@ -957,7 +960,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_j=
ob)
 	struct xe_device *xe =3D guc_to_xe(exec_queue_to_guc(q));
 	int err =3D -ETIME;
 	int i =3D 0;
-	bool wedged =3D xe_device_wedged(xe);
+	bool wedged;
=20
 	/*
 	 * TDR has fired before free job worker. Common if exec queue
@@ -981,10 +984,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_=
job)
=20
 	trace_xe_sched_job_timedout(job);
=20
-	if (!wedged &amp;&amp; xe_modparam.wedged_mode =3D=3D 2) {
-		guc_submit_wedged(exec_queue_to_guc(q));
-		wedged =3D true;
-	}
+	wedged =3D guc_submit_hint_wedged(exec_queue_to_guc(q));
=20
 	/* Kill the run_job entry point */
 	xe_sched_submission_stop(sched);
</pre>
    </blockquote>
  </body>
</html>

--------------iSbUA0bIlX3PusygvKqMyIJ3--
