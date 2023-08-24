Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA81EC7EE2C
	for <intel-xe@archiver.kernel.org>; Thu, 24 Aug 2023 18:04:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 755F310E5A0;
	Thu, 24 Aug 2023 18:04:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF0610E5A0
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Aug 2023 18:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692900261; x=1724436261;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=y5ooF+M18tqvPVHGKwWLfejjCVzTpiUsqPb6gQ7RH4w=;
 b=iiuZsxrlRWehvP6pYquYdWPwiLTtZpntQopsHn0UtcbvF15EYxUT8RrW
 UPcO5nLNo/gkfjI4zGoKjlXECWPcqrQQU8Pehcfauwg9Q+E1PEK9H+NWU
 aFpLXIhYCBFlP274IwQWB1RktmMdXQykyGVyOqkovy/aZQ1xnmPYtRog6
 ZlOuVGqYsFxUIN2mGktbb3uyG36JRW499lbdhAOCwktYE9qMP0kMOfRM4
 ZqqvxqF4ixlRHYJvMOzm7BKb6cEAubPKMeeWnB6ONlsMqFjsuoaZ1AZft
 IO+Wbyh8o5/BCHJlZQAwr3x0XLJsJ0HzDIEHRxHCn06Dcixuyzh/t7fUE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="374496248"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="374496248"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 11:03:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="737145216"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="737145216"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 24 Aug 2023 11:03:30 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 11:03:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 24 Aug 2023 11:03:30 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 24 Aug 2023 11:02:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PytV6AnNq76eSg1PsCovglwSlukV79HET5tJTuT+/oyRl/eU8YWL7gIk606oKnQ5jZx7usUUDLwZ4LQfEtSjLHOjJrXbnv5gzDgp+e58NuP6FD1FEy7G5KyXG8UDkUzpD2bHQ4zgPbv1LmBPJyAJ+uqEB0bRR2kULSyVvfGK1+zR69/8gAD7IGDyDVcEM1AQBroBJR2TK1reHlVgyULTMdOgqLsYTtHT2nwCwZ4l5sG5mElLoX6iHSfbTHRnlbwAJWpWc0kl14xMRtqKMKx6y3i6j+d9h1sYetJs36GcOr5C+MsWk57U4IAaoDwWFxGZyHcUmCv+gbN78X1Q7JdPyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rKBi9lWgmdliJ9VgussSycXlqRE5S8BONO95Fm83Wno=;
 b=MEgjbe7CKWFl4zKgvGbwiYGxAhN5MmT7MHnyWzVXKw0lhCk6rp+D2+8hZ/QTTK0I84H7Q1PeHj8TZLV3zxqnShPIHnjCI0RzoLcDtvCM243Q5QVqh0znCHYGQ6ZkukuaMgnFzMpk87+kLM3fiL1N2p0GBG+uWKRzgFQAtqYaijkcDAo68zLisQOzVoU0UrjIMG5HTl1LDjFV1JN+UFKSlQHWrhGq9k+KPHtALkGshQFT3CpTYtM87NYuzgIdk6uIgvsMMkMbfkkxlB/BN5dpXY5AXtSbvqkc3BvjNfbDIKUEGw29gLHnXBjOwr9SOJAQaS/PA4WUyDwBiEdpd3ZqGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by CH0PR11MB5300.namprd11.prod.outlook.com (2603:10b6:610:bf::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 18:02:46 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::f7ed:4327:5d1a:b8fc]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::f7ed:4327:5d1a:b8fc%4]) with mapi id 15.20.6699.022; Thu, 24 Aug 2023
 18:02:45 +0000
Date: Thu, 24 Aug 2023 11:02:43 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ZOebQzkej7SrIsSS@nvishwa1-DESK>
References: <20230823114040.31769-1-niranjana.vishwanathapura@intel.com>
 <20230823114040.31769-4-niranjana.vishwanathapura@intel.com>
 <20230824162328.GW1529860@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230824162328.GW1529860@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY3PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:a03:254::30) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|CH0PR11MB5300:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a2f510c-002f-4f35-d9a1-08dba4cc51d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Iqh9aoYkqgWG9eatzryjydLJtM8iiOdxhcwhxOgiAhfy9GWuUJo7tHIvLzwkujERC3sB7tfDdA6TxgFB62khPJ6tsGkZewYDyE3XEjJiqk/mjONgw+ubtvj/1QRTSRK/gJU75n244mYRCaiGSD+zWSfLbrs3F9VP0DbXneL0KCcY3HAFab7pdcDhE87JSaqYQ2wQGLEs2rROysZr6wFFNCuzg3G9ub25CFLq/Z9Aveonk1DAbO7wNldk3sKp7UZ1M4VxTuoTiXf3j3fmhcbMoh3x/5B9hnu0KJ3UEcOcfkswHU07CuGWDCQ7F2U+SPFA2jQHz5wor9FJRPQfrtrypFCWOipLxywB2WE07nFTmTDdlbvLnEl9GCFa/7+Zik1xNDM2NKeUsFlHLbehORblbPN4HJkRWKu8jr0vcL4DG1Zw8Mh6k580VR5oxUiQ59Y1WXcfblLb4+I7rVAVnrXFlNwUXXPTYIo0ylpIgaILhYH4E9HnReIOG5dcXZkKgqkCpQ75jAuqmqrRU/qewgM0i7XB7yS+Nh7G18OVk/Rz5S1NdsoKUGH3kbabER1XS94Y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(39860400002)(396003)(366004)(136003)(346002)(186009)(1800799009)(451199024)(5660300002)(107886003)(8936002)(4326008)(8676002)(6862004)(83380400001)(44832011)(26005)(38100700002)(82960400001)(66556008)(66946007)(66476007)(6506007)(6636002)(33716001)(316002)(478600001)(41300700001)(2906002)(6512007)(9686003)(86362001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7qwEgS4qt9DMJRZ5JxqesE/dAQe5iUdOXxjOguOJ7GrL8u8PiLlQuBte+cr8?=
 =?us-ascii?Q?+PJBIk+uVVRzSegl/g/7eni22SkOYpZWdP/asTjiwRuMR6EYRICJrC0+VvoT?=
 =?us-ascii?Q?1v7oX6vxSsyIrRNcLi3nZS4qpPjzsZej7fotCQEX2GKg24OwG0yEtjB0XUKh?=
 =?us-ascii?Q?mUJOjPvFLr1E567Drv1oP+u77PGvPq9eTmFzJReWbMg+Pll+KXfK71BB5oVb?=
 =?us-ascii?Q?jGpeGN33Q7gJTW5ephbONSyEsF5oqJdXzCCIRIpWm62Byq+oV0odItPGzjBx?=
 =?us-ascii?Q?+/qaSiLuRI+caLTs7AvM7adFqw9ts37RcC5gN+ExWIBbv+J90T7F0y6t0SAD?=
 =?us-ascii?Q?J4t1MRpwKboC/MCF5cJoSyUGHadWUk33JdNdjEurIqQUcPTqvxAQPluq+5bo?=
 =?us-ascii?Q?Ejoppck+8OToj8+PV8+UFVfVDgO3j629u/sQVy28ciVgKrkKyDPa8D16Euub?=
 =?us-ascii?Q?v+tjfjCOKhx+DwrK9EZdKj2IYCuRSqnGcxfIgqIcxe9FudwQjegTZXJrB1EH?=
 =?us-ascii?Q?LWZI3uWcNtXgMGsxjiphRYHcRdTPhf1pt6xNee4DWO7xx/bpFfWy3HGhM9pM?=
 =?us-ascii?Q?2yi1i9NleSugLbUHXewmcRVeSPDvi8QK4xoI45XhheMEdiyqTzDbQl838Lop?=
 =?us-ascii?Q?HCBJ8KWydq40PFD91uAvg7YCG1AhuNVyMSHRuhyWlf+i3VK6w7Aq+76IxRVJ?=
 =?us-ascii?Q?QuealZ9q9hLZAXWAVWl//V4tM9/KzBmPlvmHVwcNiunwFbhtvxpanG/FKghs?=
 =?us-ascii?Q?LlJOI7oanhFLUk9trG6QNWDrLJ9H7HNEw4OAes7qv3Uki7hrr54fRVzcnp8A?=
 =?us-ascii?Q?EbjlDzwDEIhOAPcOc5qbLuwgFvYTQn7thFFFaMj0nVmVqE/gI/s973Jsh8Gi?=
 =?us-ascii?Q?LwAZG2M0F7G3MZ4b0AGe9F5j86UClG8zF+7M3UhR6Pz3H104Zoz/fXRLpv6U?=
 =?us-ascii?Q?gJh2tHnK/BTbX2SS4YXuTsckOFCcGfwParlWScwCxN7N/3YXP6uuEMbXAPr8?=
 =?us-ascii?Q?BHRquqi3MVvfQSMexo/+lvRLfBRNgDvx37GoZ5joTSz7ZCo7HFitLWj4dVHj?=
 =?us-ascii?Q?fLTpbG+Ja/lFSmS4qoXU4/jQoLiBeKP8wrYakvyKKHhsqBovaP9vXkOWMx8X?=
 =?us-ascii?Q?e9Pfopn08XOlcfYiS/cwuSchF6L9AAALSgOapIecDgJz4bkeuOaCqlpCVXGZ?=
 =?us-ascii?Q?8IFk/LtRZOilRZwL6Z9RJfLfWEy1wxT0TodkoAuxmRJQoYil2gnkU2JaYCUN?=
 =?us-ascii?Q?O5RjvlogabG+8NNzuzPW6HdmvtYvf1g3mFmOs5t5iw2BXvtWCaHgW2YUSzUL?=
 =?us-ascii?Q?axZykuvnFGllqgEg1omeDwikDv8Y51ijNBDXLm1RMQNIUn3YQKRP9r5bhabV?=
 =?us-ascii?Q?qqfGU2hYkLyT3qudniazwWJzrM8taRj9RP9RJ5tEbDJXcrqV6bt0MhgeR6+Z?=
 =?us-ascii?Q?VTz/SvFq5M22YoAT9ME+CAlppoSAJGDBXpoGWv3dZ423x2ULm4CoEytVky/z?=
 =?us-ascii?Q?V65376pyC10HX2CgA9q4/Ttgn0bgREuYcaNgT70PXJsh0WU/FxOPkMOXHhzc?=
 =?us-ascii?Q?hcS4Pw50TzCucDvKXXpfGP3E+/3pqMAjCuxWg5S1e7vr7mufe9WgurRwcED4?=
 =?us-ascii?Q?BdNpdABEPTX3JT/cBCcZp1A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a2f510c-002f-4f35-d9a1-08dba4cc51d3
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 18:02:45.7663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ty3IPBITNpnVFKWfAjdy7Ht6u+ju11k91KPH/wzoef7xii+LJHy9OFO8VoymcBLUit/o+yPP7lTedmk3F1MP0m/hNBkvwCJpcGbEvs1SmxqaSKzCTXXoi2Vz99B/jOrf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5300
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 3/3] drm/xe/pvc: Use fast copy engines as
 migrate engine on PVC
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
Cc: lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Aug 24, 2023 at 09:23:28AM -0700, Matt Roper wrote:
>On Wed, Aug 23, 2023 at 04:40:40AM -0700, Niranjana Vishwanathapura wrote:
>> Some copy hardware engine instances are faster than others on PVC.
>> Use a virtual engine of these plus the reserved instance for the migrate
>> engine on PVC. The idea being if a fast instance is available it will be
>> used and the throughput of kernel copies, clears, and pagefault
>> servicing will be higher.
>>
>> v2: Use OOB WA, use all copy engines if no WA is required
>>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_migrate.c    | 39 +++++++++++++++++++++++++++---
>>  drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
>>  2 files changed, 37 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>> index 956a96b38346..60f4e0a60b71 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -12,6 +12,7 @@
>>  #include <drm/ttm/ttm_tt.h>
>>  #include <drm/xe_drm.h>
>>
>> +#include "generated/xe_wa_oob.h"
>>  #include "regs/xe_gpu_commands.h"
>>  #include "tests/xe_test.h"
>>  #include "xe_bb.h"
>> @@ -29,6 +30,7 @@
>>  #include "xe_sync.h"
>>  #include "xe_trace.h"
>>  #include "xe_vm.h"
>> +#include "xe_wa.h"
>>
>>  /**
>>   * struct xe_migrate - migrate context.
>> @@ -298,6 +300,36 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>>  	return 0;
>>  }
>>
>> +/**
>> + * xe_migrate_usm_logical_mask - Return logical mask for usm migrate engine.
>
>When you make this a static function in the next version, you can also
>demote this to a regular comment.  We generally don't use formal
>kerneldoc on static functions.
>
>You already noted that the pr_info needs to be removed and this function
>needs to be made static, so aside from those changes,
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>

Thanks, fixed and pushed.

>
>As a follow-up should consider changing the logic used to pick a
>reserved engine instance?  Should we try to always pick a "slow" engine
>as our reserved engine (which is basically just a backup for when the
>faster engines are all in use by userspace)?  Right now it looks like
>the reserved engine is always the last one that isn't fused off, so it
>might either be a fast engine or a slow engine depending on platform
>fusing.  If we have to take an engine away from userspace, it might be
>best to make sure it's always one of the slow ones?
>

Yah, makes sense though it is PVC only issue.
Will try to comeup with a patch later.

Thanks,
Niranjana

>
>Matt
>
>> + * @gt: gt instance
>> + *
>> + * Due to workaround 16017236439, odd instance hardware copy engines are
>> + * faster than even instance ones.
>> + * This function returns the mask involving all faster copy engines and the
>> + * reserved copy engine to be used as logical mask for migrate engine.
>> + * Including the reserved copy engine is required to avoid deadlocks due to
>> + * migrate jobs servicing the faults gets stuck behind the job that faulted.
>> + */
>> +u32 xe_migrate_usm_logical_mask(struct xe_gt *gt)
>> +{
>> +	u32 logical_mask = 0;
>> +	struct xe_hw_engine *hwe;
>> +	enum xe_hw_engine_id id;
>> +
>> +	for_each_hw_engine(hwe, gt, id) {
>> +		if (hwe->class != XE_ENGINE_CLASS_COPY)
>> +			continue;
>> +
>> +		if (!XE_WA(gt, 16017236439) ||
>> +		    xe_gt_is_usm_hwe(gt, hwe) || hwe->instance & 1)
>> +			logical_mask |= BIT(hwe->logical_instance);
>> +	}
>> +
>> +	pr_info("NNV %s logical_mask 0x%x\n", __func__, logical_mask);
>> +	return logical_mask;
>> +}
>> +
>>  /**
>>   * xe_migrate_init() - Initialize a migrate context
>>   * @tile: Back-pointer to the tile we're initializing for.
>> @@ -338,11 +370,12 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>>  							   XE_ENGINE_CLASS_COPY,
>>  							   primary_gt->usm.reserved_bcs_instance,
>>  							   false);
>> -		if (!hwe)
>> +		u32 logical_mask = xe_migrate_usm_logical_mask(primary_gt);
>> +
>> +		if (!hwe || !logical_mask)
>>  			return ERR_PTR(-EINVAL);
>>
>> -		m->q = xe_exec_queue_create(xe, vm,
>> -					    BIT(hwe->logical_instance), 1,
>> +		m->q = xe_exec_queue_create(xe, vm, logical_mask, 1,
>>  					    hwe, EXEC_QUEUE_FLAG_KERNEL);
>>  	} else {
>>  		m->q = xe_exec_queue_create_class(xe, primary_gt, vm,
>> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> index ea90dcc933b5..599e67169dae 100644
>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> @@ -17,3 +17,4 @@
>>  1409600907	GRAPHICS_VERSION_RANGE(1200, 1250)
>>  14016763929	SUBPLATFORM(DG2, G10)
>>  		SUBPLATFORM(DG2, G12)
>> +16017236439	PLATFORM(PVC)
>> --
>> 2.21.0.rc0.32.g243a4c7e27
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
