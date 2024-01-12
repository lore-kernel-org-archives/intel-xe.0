Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB44C4707B
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 00:41:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DC7D10E99A;
	Fri, 12 Jan 2024 00:41:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BAF210E99A
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jan 2024 00:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705020086; x=1736556086;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lThtfWCyP38pU3W5JIVFiujmdcx12KXAZqL0a3o544Y=;
 b=KVqN7JE9acTiZkKByiasbUrDwhWmJLOMNeeILskr/8KninT4UKSfNLAV
 69blW6vGQ8Z7YJvQjSgyyKflVTNvlwVoeq4m4HmujLgmmMZdZNdgAsMCO
 fsEpu4wwJNESQwb5DUcf6HzO0SMeQDcTrsReFp2zCo4y5SvinYg8D7j9b
 XZGgs0h1CmRuVdEjt8iSwEN2K8quI39JyFgDRfO9ZZAt/qsg5dIC9qBrL
 KC6BZtF8QKP5S0H7U000qAxMiU3m543v3kQzwBEss0GJMn/zR9K1b8yJu
 OU1fvXLi4E5Avy+bBOADne7vXcpKCcP/+wBrxo1ptPJpjhmWSIUmQwDTa Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="6128353"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; 
   d="scan'208";a="6128353"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 16:41:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="786179632"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; d="scan'208";a="786179632"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jan 2024 16:41:25 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Jan 2024 16:41:24 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Jan 2024 16:41:23 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Jan 2024 16:41:23 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Jan 2024 16:41:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MwUWu6Bb5X0N8iRn0RKPfSkp1V85VEIpvrhGWMs35cnwFxk8pa/7ZiQxs/utSBRSDRPWvdflvu9YBfNa/pAHE2adZXbvoshljvurh+I09nGlIpBgf2SkJAVooNjTk0aVqHa4Q6JHnoPIkM2D3Sfz/kWYuP7tluG4YVhG6mDS3aQFoLkfMn8Y7S8mkFpUOpfVrKqPVQzGTKcZMgoCyNmNaKGlWcTGsLm7zMgcp7e4NvT2UCy6qyD8gSaxsQqKS645XFSzr/LxQ5o5zf4Q1PldwkXQrciPH1hbcd8Pelspz46ERPZCCg860X5yrPzcrog23LuvB4EHs3iTJlrkzjCTVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HOTYhaHXipcvjSn+ALegrqYRVd5Izi1F3nvAUc7LGJ4=;
 b=M0713uqLJ9x7cwnvAg0h1ToS4wo0fKuCJp/S/eNoAxGGDTGJjmrlZP6K8+P/6dlEQCh5KiZFoAv1TWCOtq/RAvuX7oIXe3v2Bd5wUZPTynQvHvv5AhncZOwxWFMMcckXba/o0SVBnUwWDJPWvp9mxWw+bsXPGKDyTvj5flLATJIvX7O/TUCPxzgpHGivYx8C7hy+MY49okZy7kNMI88QKURHTWkN/hoVnjxgjPZdAFbKJ6bHuIBj7lfnRUaL8Jzg+I0gUdXt+/SW0GsaSYf4kyai1cBLsZdbkkMubAOmkhmne+A93l9qEFe2YE9tZidKd7XYhtDN4exR87KcUnIMNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by DS0PR11MB6445.namprd11.prod.outlook.com (2603:10b6:8:c6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Fri, 12 Jan
 2024 00:41:21 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c947:cbd4:3870:c36e]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c947:cbd4:3870:c36e%7]) with mapi id 15.20.7181.019; Fri, 12 Jan 2024
 00:41:21 +0000
Message-ID: <df268f04-a8b2-47da-935d-4c83ed73bc7b@intel.com>
Date: Thu, 11 Jan 2024 16:41:19 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/xe: Introduce xe_clos.c
To: Pallavi Mishra <pallavi.mishra@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240109235758.1432987-1-pallavi.mishra@intel.com>
 <20240109235758.1432987-3-pallavi.mishra@intel.com>
Content-Language: en-US
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20240109235758.1432987-3-pallavi.mishra@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0158.namprd05.prod.outlook.com
 (2603:10b6:a03:339::13) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|DS0PR11MB6445:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e63d6c0-9d35-430e-4275-08dc1307325e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8iqI+LR5YMDHkXjdZp1oXSiDotizNLHy47OIFgul2YDiXorhhMBDqOrdNIinba/Qa+eWhvSTJHXt3XQ6Wx1LXtlFja5bqO75OTG32mcHgILOyNMdZnQC1/cunlemJX2GXol0CJMDTZS1cVvNLOeyYJm2nCK/MZxfdDeq6gzQRFyKEyD2j0S9rRwskWjBZU20u1cybo84xeF9Lp0G43oTKxRI7dgNUZr+GToyoz19s9aeS/OwHqhQIllrNIxVVk/GBwVy1r0gvx7yi41Px04Rr+/5NgJWgo7Z/jbK1meSaLYKShipTiwoTqGxN7Carw5DAAM7CC/VsYf5tRp5wp7I1G362peUbRFXHDBD7PSoC7BtT9wOrBXYw8l7Jf3D3Pz9h+EZ8sRnKSUxiyIgpJv06WqM4nCIoMR3ZqZcgsGA2D6ZDh92buWUNydrAaDE1bzWo1Z4Qcnf1507lrXUTY/1tF+De6tXAf+dDRHs/O2AIxbIKHXCGK/9IthfwK7nxOcDruVFfqz6V9vc9A+30kYpErNFNgj8nQ7k+pucJOBLmzLtKAKPDzrdOGWOdyYdMV9D6ObLiSAedO4XxglhRZmESKaScLdN7C/o65UWPh7FeC2Lmb06qS5jnI7Jx+n3I4Z3yG0SHJQtVhLIVXE5HymzoA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(396003)(346002)(39860400002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(5660300002)(30864003)(478600001)(82960400001)(86362001)(2616005)(31696002)(6486002)(8676002)(66476007)(6506007)(6512007)(41300700001)(66946007)(8936002)(66556008)(316002)(53546011)(36756003)(38100700002)(83380400001)(26005)(107886003)(4326008)(31686004)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3lUVklId3pvdGdJTjdRSmpvd0RaUm1WSG8wTU4zK2dhcGgzLy82MkVXaXo5?=
 =?utf-8?B?cWNrajREZm54OVpIZFlkaFZBN0FZeFg5V3V6ZnlyRldLWjdGUlBSdC9kZFpJ?=
 =?utf-8?B?SG9DVnFrMlJOVVIvZlVqSWxOenJHZVEvY3pMMks2RFM4MmpPLzErU3pRc2tJ?=
 =?utf-8?B?bThnUzczNkxIQmV0OURLanVIeS9wRE5zU0FDNnNKUktXRkplR2hwQmVlQ2Vx?=
 =?utf-8?B?UmNWZU1ScWI3N3lXZ1l5bkZWRFc0VExKTzR5MzRTak93ZXNRT2lYMm1wQzQ0?=
 =?utf-8?B?V1B1Y0N2Zk1zOFd1aXRtc0hkemZVNkZzQlRSK0xSNldIUy8vaExXR2JOTDhh?=
 =?utf-8?B?Q1Z5b1RNVkptd3B2NU9jVTlqUkU4NThaMDF5Mi91VVd2bksrUWVTUEU2RFFX?=
 =?utf-8?B?M2xjT09UZEFOWC8vUHZUbHZ6bWlHWnA1REQvU3FHZ3NRM1VKbURNaEh0ak11?=
 =?utf-8?B?dkpnaGZQUnBEOUxpb3lLb21OeXNadCs2WW5DM0RwSWN1alkyUkpCQitVeXBo?=
 =?utf-8?B?dmgyd2NtQ2d3LzI2a3Y5ZlI3cFhIaVNOQWtNYjZ0M0ZSZkVWUVc1Y2oxZ1Ux?=
 =?utf-8?B?aGtXQk1LWHovYW5hbVNKYjRiNG9ZOENBd0pHQzVjbVgyUGRhVVczZVJvUGFX?=
 =?utf-8?B?Mm0xYkU1VHZLNGMyd3NZbU9pZmxuS3o5UG1RY1ovekEyWW1DcnBrZHlFcDZE?=
 =?utf-8?B?RnZDRlBtcElKMUZZUGtOWXYzWFpSNUx0U3lOMzRXdU5YV1RIZlFjbUxuYzYz?=
 =?utf-8?B?NzNUZWRqMFpELzV2T25udldNdzJZeVh5cUFWSEtXUUwrVGh3cFhzV0NzUkpm?=
 =?utf-8?B?cmlYOGY1VGNpMHZZdno5ZmNHc2o0MkdUL1hiSnNYNlpjd0NWOVd1eUVQSWQ0?=
 =?utf-8?B?N0FOQ2FjL25XWWUycW9lSkhRc1ZVci9QZG1ZVHg4MGliSXN5QzdRa05GdzBQ?=
 =?utf-8?B?UlFjNktVdWNjN3ZXL2g5QWlLQlY1cFY4U1ppbU5lZmx2aS9nY2Jpb1BLR0lG?=
 =?utf-8?B?bHpNVjh1eHptZUhabVZOejg2QytzNFdWZmg4bnV0NkNVRmR1LzlmT3dNaktj?=
 =?utf-8?B?T3hXNVFPWWY5d24xc2dxSTV0d01KZTU5OWw4UVpwRURKWDViRytVY09PSlVL?=
 =?utf-8?B?cnZQV2hUcDUrUkZOcXBBWmZkZFd3U1M3Q2tsSTVrN3dFRitMRmlXRG5XYjJt?=
 =?utf-8?B?Q1VNa3FNU2xZcEVRbDJpdjFqaTdOWCtKZzBwMVZDSTZLa2ZhMVdoTWZRbnFm?=
 =?utf-8?B?Q0R2YjVCQVJHUkxWYU9ncDFROUNQR2o1THcxdHhTdkhxUWhXdWk3eWREWFB4?=
 =?utf-8?B?eS80M3d1c2FBd3MvZkdqaGRwczJXVFBwcm1qcXI3b2NvajR0cGh3cHppdVd2?=
 =?utf-8?B?d05PTG9WcTVNTzV1TStqTUs3NXdvbGw5dUloZGIySkpJU1JQalRhM2N6ZmNK?=
 =?utf-8?B?ejBEa0FleWVYN2o1STRZQU9ZSWM3K0Nld0lQek12bmh6WnM3TGRvQ3lhSEZN?=
 =?utf-8?B?c3ZDaHEwc1FmTE5QeWVVMjhOWXV0VXV2MElITVZkQVJyYjA3WjhuQ2VvVkxG?=
 =?utf-8?B?RDB6dTVCR3dtMXJ5VG9ISWdpaTlHU0FBVXFuWXlvVjUzVG80V3J5cTJqVlkv?=
 =?utf-8?B?SkVZVk9sMGtFcmtCaTRrWnFhbWJ3SUdPZUVnN0srK2xUdzBhYWVYTTJ1TjFm?=
 =?utf-8?B?Yi9QemFSZzRpaW9KMURUV2NDWGhycUJMOWFzUXBYNkkwWkd3TVh2aVZOMGFV?=
 =?utf-8?B?ajYzeXhDdTlMcnltZFJFcjdJRThyVlh6Sm1ZQ0lZM0pjSk9teGJNM0RhelNL?=
 =?utf-8?B?cVp2a2ovNmEwSFFlYVN4OVBMNHJxYkdiMmpyTkUwa0tYbjJSZ0p5cVhwQmI3?=
 =?utf-8?B?aG94bWRseFNhTXBkdmRHcWk0Wm9iZ2hicHR1bkcwcDhnUjlYWDNhK3d2REI1?=
 =?utf-8?B?dnFabmtHc3FWLzQ4REZlRjZuREtYeVdPMVZhcXFBMWp3QUl4RkxnaG9IcjZt?=
 =?utf-8?B?VnZ3cXhXZWJUaWhMVlNiMDc5M3lmVXEvbVZzcnoyaG0yNGQzOFBNWGw4YkFC?=
 =?utf-8?B?S1V1KytNR3hSZXNoSVhhUmVzcjlUUGJyd2xVMEZTTkJ2UFY4MmVFeWtQdEF2?=
 =?utf-8?Q?Vmga5SbFkVGJJ6nJKhnNYEYG2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e63d6c0-9d35-430e-4275-08dc1307325e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 00:41:21.1663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UCCxrdhuJwo7HU1gLSxdKfF9z++ILErj5ju8snhlei+eLvBfqMROM/yEyNDPdPcuThHGEUKUI1S3NfSv7x7NCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6445
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



On 1/9/2024 3:57 PM, Pallavi Mishra wrote:
> Add CLOS specific operations in a new file.
> 
> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile          |   1 +
>   drivers/gpu/drm/xe/xe_clos.c         | 264 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_clos.h         |  31 ++++
>   drivers/gpu/drm/xe/xe_device_types.h |  22 +++
>   drivers/gpu/drm/xe/xe_pci.c          |   4 +
>   5 files changed, 322 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_clos.c
>   create mode 100644 drivers/gpu/drm/xe/xe_clos.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 6952da8979ea..d85a252e404b 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -64,6 +64,7 @@ $(uses_generated_oob): $(generated_oob)
>   xe-y += xe_bb.o \
>   	xe_bo.o \
>   	xe_bo_evict.o \
> +	xe_clos.o \
>   	xe_debugfs.o \
>   	xe_devcoredump.o \
>   	xe_device.o \
> diff --git a/drivers/gpu/drm/xe/xe_clos.c b/drivers/gpu/drm/xe/xe_clos.c
> new file mode 100644
> index 000000000000..e51dba96e2c0
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_clos.c
> @@ -0,0 +1,264 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <drm/xe_drm.h>
> +#include <drm/drm_managed.h>
> +
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_gt_mcr.h"
> +#include "regs/xe_gt_regs.h"
> +#include "xe_clos.h"

Maintainers prefer to see above list sorted (xe_clos.h first).

> +
> +static void clos_update_ways(struct xe_device *xe, struct xe_gt *gt, u8 clos_index, u32 mask)
> +{
> +
> +	drm_dbg(&xe->drm, "clos index = %d mask = 0x%x", clos_index,  mask);
> +	xe_gt_mcr_multicast_write(gt, XEHPC_L3CLOS_MASK(clos_index), mask);
> +}
> +
> +static void update_l3cache_masks(struct xe_device *xe)
> +{
> +	u8 start_bits = 0;
> +	int i;
> +
> +	for (i = 0; i < NUM_CLOS; i++) {
> +		struct xe_gt *gt;
> +		u32 mask = 0;
> +		int j;
> +
> +		if (xe->cache_resv.ways[i]) {
> +			/* Assign contiguous span of ways */
> +			u8 ways = xe->cache_resv.ways[i];
> +			mask = GENMASK(start_bits + ways - 1, start_bits);
> +
> +			drm_dbg(&xe->drm, "start_bits = %d ways = %d mask= 0x%x\n",
> +				  start_bits, ways, mask);
> +			start_bits += ways;
> +		}
> +		for_each_gt(gt, xe, j)
> +			clos_update_ways(xe, gt, i, mask);
> +	}
> +}
> +
> +#define MAX_L3WAYS 32
> +void init_device_clos(struct xe_device *xe)
> +{
> +	if (!(xe->info.has_clos))
> +		return;
> +
> +	mutex_init(&xe->cache_resv.clos_mutex);
> +
> +	/* CLOS1 and CLOS2 available for Reservation */
> +	xe->cache_resv.free_clos_mask = 0x6;
> +
> +	if (GRAPHICS_VER(xe) >= 20)
> +		xe->cache_resv.free_clos_mask = 0xe;
> +
> +	/* Shared set uses CLOS0 and initially gets all Ways */
> +	xe->cache_resv.ways[0] = MAX_L3WAYS;
> +
> +	update_l3cache_masks(xe);
> +}
> +
> +void uninit_device_clos(struct xe_device *xe)
> +{
> +	if (!(xe->info.has_clos))
> +		return;
> +
> +	mutex_destroy(&xe->cache_resv.clos_mutex);
> +}
> +
> +void init_client_clos(struct xe_file *file)
> +{
> +	if (!(file->xe->info.has_clos))
> +		return;
> +
> +	file->clos_resv.clos_mask = 0;   /* No CLOS reserved yet */
> +	file->clos_resv.l3_rsvd_ways = 0;
> +}
> +
> +static bool
> +clos_is_reserved(struct xe_file *file, u16 clos_index)
> +{
> +        return file->clos_resv.clos_mask & (1 << clos_index);
> +}
> +
> +static int
> +free_l3cache_ways(struct xe_file *file, u16 clos_index)
> +{
> +        struct xe_device *xe = file->xe;
> +
> +        if (xe->cache_resv.ways[clos_index]) {
> +                u8 num_ways = xe->cache_resv.ways[clos_index];
> +
> +                file->clos_resv.l3_rsvd_ways -= num_ways;
> +
> +                xe->cache_resv.ways[0] += num_ways;
> +                xe->cache_resv.ways[clos_index] -= num_ways;
> +
> +                update_l3cache_masks(xe);
> +        }
> +
> +        return 0;
> +}
> +
> +static int free_clos(struct xe_file *file, u16 clos_index)
> +{
> +        struct xe_device *xe = file->xe;
> +
> +        mutex_lock(&xe->cache_resv.clos_mutex);
> +
> +        if (clos_is_reserved(file, clos_index)) {
> +                struct xe_device *xe = file->xe;
> +
> +                free_l3cache_ways(file, clos_index);
> +
> +                file->clos_resv.clos_mask &= ~(1 << clos_index);
> +                xe->cache_resv.free_clos_mask |= (1 << clos_index);
> +
> +                mutex_unlock(&xe->cache_resv.clos_mutex);
> +
> +                return 0;
> +        }
> +
> +        mutex_unlock(&xe->cache_resv.clos_mutex);
> +        return -EPERM;
> +}
> +
> +void uninit_client_clos(struct xe_file *file)
> +{
> +	u16 clos_index;
> +	struct xe_device *xe = file->xe;

Best to insert a newline here.

> +	if (!(file->xe->info.has_clos))
> +		return;
> +
> +	for_each_set_bit(clos_index, &file->clos_resv.clos_mask, NUM_CLOS) {
> +

Best to remove the empty line above.

> +		drm_dbg(&xe->drm, "uninit release mask = 0x%lu clos= %d\n",
> +			  file->clos_resv.clos_mask, clos_index);
> +		free_clos(file, clos_index);
> +		file->clos_resv.clos_mask &= ~(1 << clos_index);
> +	}
> +}
> +
> +#define L3_GLOBAL_RESERVATION_LIMIT 16
> +#define L3_CLIENT_RESERVATION_LIMIT 8
> +static int reserve_l3cache_ways(struct xe_file *file,
> +				u16 clos_index, u16 *num_ways)
> +{
> +	struct xe_device *xe = file->xe;
> +	u8 global_limit = L3_GLOBAL_RESERVATION_LIMIT -
> +		(MAX_L3WAYS - xe->cache_resv.ways[0]);
> +	u8 client_limit = L3_CLIENT_RESERVATION_LIMIT -
> +		file->clos_resv.l3_rsvd_ways;
> +	u8 limit = min(global_limit, client_limit);
> +
> +	if (limit == 0)
> +		return -ENOSPC;
> +
> +	if (*num_ways > limit) {
> +		*num_ways = limit;
> +		return -EAGAIN;
> +	}
> +
> +	file->clos_resv.l3_rsvd_ways += *num_ways;
> +
> +	xe->cache_resv.ways[0] -= *num_ways;
> +	xe->cache_resv.ways[clos_index] = *num_ways;
> +
> +	update_l3cache_masks(xe);
> +
> +	return 0;
> +}
> +
> +static int
> +reserve_cache_ways(struct xe_file *file, u16 cache_level,
> +		       u16 clos_index, u16 *num_ways)
> +{
> +	struct xe_device *xe = file->xe;
> +	int ret = 0;
> +
> +	if (cache_level != 3)
> +		return -EINVAL;
> +
> +	if ((clos_index >= NUM_CLOS) || !clos_is_reserved(file, clos_index))
> +		return -EPERM;
> +
> +	mutex_lock(&xe->cache_resv.clos_mutex);
> +
> +	if (*num_ways)
> +		ret = reserve_l3cache_ways(file, clos_index, num_ways);
> +	else
> +		ret = free_l3cache_ways(file, clos_index);
> +
> +	mutex_unlock(&xe->cache_resv.clos_mutex);
> +	return ret;
> +}
> +
> +static int reserve_clos(struct xe_file *file, u16 *clos_index)
> +{
> +	struct xe_device *xe = file->xe;
> +
> +	mutex_lock(&xe->cache_resv.clos_mutex);
> +
> +	if (xe->cache_resv.free_clos_mask) {
> +		u16 clos = ffs(xe->cache_resv.free_clos_mask) - 1;
> +
> +		file->clos_resv.clos_mask |= (1 << clos);
> +		xe->cache_resv.free_clos_mask &= ~(1 << clos);
> +
> +		*clos_index = clos;
> +		xe->cache_resv.clos_index = clos;
> +		mutex_unlock(&xe->cache_resv.clos_mutex);
> +
> +		return 0;
> +	}
> +	mutex_unlock(&xe->cache_resv.clos_mutex);
> +
> +	return -ENOSPC;
> +}
> +
> +int xe_clos_reserve_ioctl(struct drm_device *dev, void *data,
> +			  struct drm_file *file)
> +{
> +	struct xe_file *file_priv = file->driver_priv;
> +	struct xe_device *xe = file_priv->xe;
> +	struct drm_xe_clos_reserve *clos = data;
> +
> +	if (!(xe->info.has_clos))		
> +		return -EOPNOTSUPP;
> +
> +	return reserve_clos(file_priv, &clos->clos_index);
> +}
> +
> +int xe_clos_free_ioctl(struct drm_device *dev, void *data,
> +		       struct drm_file *file)
> +{
> +	struct xe_file *file_priv = file->driver_priv;
> +	struct xe_device *xe = file_priv->xe;
> +	struct drm_xe_clos_free *clos = data;
> +
> +	if (!(xe->info.has_clos))	
> +		return -EOPNOTSUPP;
> +
> +	return free_clos(file_priv, clos->clos_index);
> +}
> +
> +int xe_clos_set_ways_ioctl(struct drm_device *dev, void *data,
> +			   struct drm_file *file)
> +{
> +	struct xe_file *file_priv = file->driver_priv;
> +	struct xe_device *xe = file_priv->xe;
> +	struct drm_xe_clos_set_ways *set_ways = data;
> +
> +	if (!(xe->info.has_clos))		
> +		return -EOPNOTSUPP;
> +
> +	return reserve_cache_ways(file_priv,
> +				  set_ways->cache_level,
> +				  set_ways->clos_index,
> +				  &set_ways->num_ways);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_clos.h b/drivers/gpu/drm/xe/xe_clos.h
> new file mode 100644
> index 000000000000..9df0febbff48
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_clos.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2020 Intel Corporation
> + */
> +
> +#ifndef INTEL_CLOS_H
> +#define INTEL_CLOS_H
> +
> +#include <linux/types.h>
> +
> +struct xe_device;
> +struct xe_file;
> +
> +struct drm_device;
> +struct drm_file;
> +
> +void init_device_clos(struct xe_device *xe);
> +void uninit_device_clos(struct xe_device *xe);
> +
> +void init_client_clos(struct xe_file *file);
> +void uninit_client_clos(struct xe_file *file);

For the 4 functions above, as they are non-static functions, I believe 
the maintainers want them to have a 'namespace' (common prefix).
Can you rename them to have xe_clos as prefix?
For example:
    xe_clos_device_init and _uninit
    xe_clos_client_init and _uninit


> +
> +int xe_clos_reserve_ioctl(struct drm_device *dev, void *data,
> +			  struct drm_file *file);
> +int xe_clos_free_ioctl(struct drm_device *dev, void *data,
> +		       struct drm_file *file);
> +int xe_clos_set_ways_ioctl(struct drm_device *dev, void *data,
> +			   struct drm_file *file);
> +
> +#endif
> +
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 8404685b2418..b2f1ba77595f 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -257,6 +257,8 @@ struct xe_device {
>   		u8 is_dgfx:1;
>   		/** @has_asid: Has address space ID */
>   		u8 has_asid:1;
> +		/** @has_clos: device supports clos reservation */
> +		u8 has_clos:1;
>   		/** @force_execlist: Forced execlist submission */
>   		u8 force_execlist:1;
>   		/** @has_flat_ccs: Whether flat CCS metadata is used */
> @@ -458,6 +460,18 @@ struct xe_device {
>   	/** @needs_flr_on_fini: requests function-reset on fini */
>   	bool needs_flr_on_fini;
>   
> +#define NUM_CLOS 4
> +	struct cache_reservation {
> +		/** Mask of CLOS sets that have not been reserved */
> +		u32 free_clos_mask;
> +		/** lock to protect cache_reservation */
> +		struct mutex clos_mutex;
> +		/** number of cache ways */
> +		u8 ways[NUM_CLOS];
> +		/** clos index */
> +		u8 clos_index;

Where is clos_index above used?   I see reserve_clos() is storing
the last reserved clos_index, but otherwise this is unused?...
and could be deleted?  Or it has a use?


> +	} cache_resv;
> +
>   	/* private: */
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> @@ -563,6 +577,14 @@ struct xe_file {
>   
>   	/** @client: drm client */
>   	struct xe_drm_client *client;
> +
> +	struct clos_reservation {
> +		/** Mask of CLOS sets reserved by client */
> +		unsigned long clos_mask;
> +		/** Number of L3 Ways reserved by client, across all CLOS */
> +		u8 l3_rsvd_ways;
> +	} clos_resv;
> +
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 4de79a7c5dc2..5922a94a3e6f 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -60,6 +60,7 @@ struct xe_device_desc {
>   	u8 require_force_probe:1;
>   	u8 is_dgfx:1;
>   
> +	u8 has_clos:1;
>   	u8 has_display:1;
>   	u8 has_heci_gscfi:1;
>   	u8 has_llc:1;
> @@ -319,6 +320,7 @@ static const struct xe_device_desc pvc_desc = {
>   	.graphics = &graphics_xehpc,
>   	DGFX_FEATURES,
>   	PLATFORM(XE_PVC),
> +	.has_clos = true,
>   	.has_display = false,
>   	.has_heci_gscfi = 1,
>   	.require_force_probe = true,
> @@ -333,6 +335,7 @@ static const struct xe_device_desc mtl_desc = {
>   
>   static const struct xe_device_desc lnl_desc = {
>   	PLATFORM(XE_LUNARLAKE),
> +	.has_clos = true,
>   	.require_force_probe = true,
>   };
>   
> @@ -548,6 +551,7 @@ static int xe_info_init_early(struct xe_device *xe,
>   		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
>   
>   	xe->info.is_dgfx = desc->is_dgfx;
> +	xe->info.has_clos = desc->has_clos;
>   	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
>   	xe->info.has_llc = desc->has_llc;
>   	xe->info.has_mmio_ext = desc->has_mmio_ext;
