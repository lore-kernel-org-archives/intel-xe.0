Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5E3C0015E
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jul 2023 10:29:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FF810E226;
	Mon, 17 Jul 2023 10:29:05 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AF3110E226
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jul 2023 10:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689589742; x=1721125742;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uGHMvSBxB9L2uVLYL1Gwl6ElBleB78sZgSbfSrr47QI=;
 b=nz6d85gVvq/YTPvJZbQ/PZDoIO9i16+hZpROCXtp9LByKnFXZzbmm1WM
 YSSgHYRJff/OJxMYK+zlabzyZaz4HIXR/mukNJ9Rk95Q5xDJYrUDJQ4X3
 dbsQDtQWj7v1Y3goRVC/XXKDm3Bfk6P0CYEIa+wXi4U2OLUp/PAW80Ov3
 OYyh86gdb99IAD1Ynngajo1pVzy4o66HcifxkfvXwp8RRYOaBVaow1JDL
 4QyyTFVfZip2uAFCfhdYCO2Fnvj2FC9hoF3Ca3TZ3Mv+n4RRgTN/hXTCk
 d7Y2OGhUbtFp5sz5cSDhi37xsA8y0nCu7tsZP2VeNNhQY775itunvVg8U w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="368538564"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="368538564"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 03:29:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="752842235"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="752842235"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP; 17 Jul 2023 03:29:00 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 17 Jul 2023 03:29:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 17 Jul 2023 03:28:59 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 17 Jul 2023 03:28:59 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 17 Jul 2023 03:28:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XLm5ZyjFqgTPqe9nRVkPzNEtoBTvChRhcWZsvN1X7HP+1DDOSoCzlYbiDa+DXz5zBIvDOU9+pHmrM+U3yhfS0waT84K37JNg4FJ0g0njfOGVHqZFVD1MRviumf1p9/bPqx76D8ccIxixvS8pbEF0bjwXn3QJa+YzRJZIUI6fc5fe0J0EeRb+osEmEBrhm0BA27R4Ely7sFYHsNX0JNt+XZwGJW6yftNwpl7CeEijs5D23q8vSK6MDEa4QC6DeU9rIhyR1NAz7AOWlYqR45WH866BfIGPz+ZjmeRsJ8MOmVNnxjfvNK1mYcIwjKXy+/mgQpcq17iMgj2Rt1PaSUwgmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+UQMm2BzMlNl6/EA/9O5Jaq2OjHWEP0PXlnrxGVE3k=;
 b=R/jiUJmb+WUwoTN8WG8nc26/oAxHvZ83j59h2aajnm0crk0ZAOdDgU9zvJZstS2XIvSuZ6FM/2mrzjwSz5FPWMj9dPVrSLmqn1Ha6WVCyQNvW5PNk7CaXAIy6Gc2punk8gZt4Z7KV3AYjt11URbryVrKClrN5xgJdvXFvWP2yN3pF43X/r4LgKk1e5hyn5SR9zaTJvqbRRlndylY10W+2upXSoqrg03rbkKRvLabowXEY/l9Se5vCpdMDs/LkbNCwWAkNxPO+l52BB1qa12rpmTRj+15+iBWfBLRnblFCGm2BjVIla0LBupTP5rhq03PpjPPxRS3MeUCJEJsANNWvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 10:28:50 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::f372:3cde:c879:be51]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::f372:3cde:c879:be51%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 10:28:49 +0000
Date: Mon, 17 Jul 2023 03:28:46 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZLUX3vrNrq83FXmS@nvishwa1-DESK>
References: <20230710214459.14708-1-niranjana.vishwanathapura@intel.com>
 <ZK4rtGVK9+HOyFfl@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZK4rtGVK9+HOyFfl@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR13CA0052.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::27) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|DM4PR11MB6360:EE_
X-MS-Office365-Filtering-Correlation-Id: 251baa17-5fce-4f19-f810-08db86b09bec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e/UoLLUvf+XsVTIOFDIb7s1y/Nn5sJ7gGc1jI+z6k5onqgV1G/VnLMMNWODGC7CEClzdjLl66fBhOEm3GT+qj+NXhg6U4SoMy06VOL+hDkSUHibVvivSrAvyS/Og8B5X9tNOVMN/LrhN1PwMultCt/wqDA8Sfe6o03C3xD8Esy/AYwAIzuuXa9VzpNyV6R9rP0pzrg5bpIuCfY6b8WU2FlRD/WJbKstf4ICrpCaq/3akGMaujpqWWClEf1Ii1LyftkW0H0Y0UCSt3kKi7v13gUQr1izB0qXl+Jf3Cmgf1LzFkbLgioV+hj84X3arDKnOrQAFhQs0PHMIWgnGo9lGuXAodhKYXIquWBW82Oo71WHdcxMFyrMHHr7Nw99h0ZI5paXxpgpZun9e7u2M2yUPzb3UvPVBO8N5W2uwC/1SoXEmkPCsme6vGwdYqyyzzZbDLhAXORwafxYnJ0i/W/V0GotbkIcM+VhYCHvArMxwPqF8++iMSvLIv/n2Ehx7klnbTpUubFfR65bqip0c1/uOfpp5qv96oYKNhcDljTc8aAVB75dWz7OQNWmPL3FyVjxi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(136003)(396003)(39860400002)(346002)(366004)(451199021)(6666004)(6486002)(82960400001)(478600001)(8936002)(6862004)(8676002)(2906002)(5660300002)(86362001)(33716001)(44832011)(4326008)(6636002)(38100700002)(66946007)(66476007)(66556008)(41300700001)(316002)(6506007)(26005)(83380400001)(186003)(6512007)(9686003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tE5iTl+wpFufOySRCu+QggG6t6izKrr4Fy+eDAoLDOt6ymYVN/6MzZzdwJ/L?=
 =?us-ascii?Q?Mama0fi9fnIl1uo+GHD4CrVQu2pnJlRciGYlX5dkGlEsZc4Wmkbyg+D7cEon?=
 =?us-ascii?Q?B/2uZtUa9tYfulDrsW/KbvHOxS8aSw7j6eMEAbU74+eW1vWB3iT8uWiHqFy3?=
 =?us-ascii?Q?Gfbp2zG5doay6kbHb4I0gPafQQt1GZWUhnub8npgI0ruj7CwSe6bk6FME2yQ?=
 =?us-ascii?Q?/PMRbWvUjBYKlxueCMwV3jqLqb9pY7EmAEzc/jYwcN2dWiNVnUIzLKlruUa2?=
 =?us-ascii?Q?rzVieRY090Pye+KrQqnqlQlwXqYUa+dkLLP0S5XZN5FllwaZSkYewJtwlvi2?=
 =?us-ascii?Q?eDQN81NG5sZKaQewx85+iOXpN74VO8G1fs4gALRdaZvSM2y8Lr5dCw/BIDxv?=
 =?us-ascii?Q?YPnFET8TVfct+kQnI7Jl0Vh9jkhSp2KuhnWXblMcr7qIcNtLAXzNSzTRIV5m?=
 =?us-ascii?Q?K9lQuzXe639C4jIoPKpuLpd9LBFYGVVUliRgwxqBAtPwgf9Iz4F4GBeox9Wr?=
 =?us-ascii?Q?uLciSSIKlo34A9CaeJCCoNiIBVhaNqdZu1lAse9Uq9QtPQSQ6yWgyW70lS25?=
 =?us-ascii?Q?JOwlhVliUdihQE/mob6+cFtCbNQ1mUOSxFBqtaqfCoLPkyJ3VnWFNue3Q7+3?=
 =?us-ascii?Q?C1Y92TkyR8HVBwjWdo34aeJzNWeZ3rHrTwaTx68gpH968sntrADzKEzewZVz?=
 =?us-ascii?Q?Lj5PtPADYx8TM4T63QivTsFbeBPYJgXRE7wbZl+FKisWArN/fyZLe+WzRxY+?=
 =?us-ascii?Q?PgUtNt0rjGL1YM/gcQrUUzaFuYbKiMjXf+U+ZEgA+Z3FzL7wr1nG/9AP+Vao?=
 =?us-ascii?Q?TqA5BmsPn7HgEDCcE7z6Q1v2pg49iQLi6npB8aZ+apCT3j06L/v/2NIPC6b9?=
 =?us-ascii?Q?7xwEXm3UKZtizkJDFEenHGrx571fjT1AS8Kztv9RIzNTMJr2oeEj/ZqTpf7x?=
 =?us-ascii?Q?chy3Zj80BUElIDTbThx7TyZXEpTG5qykBJ5GqVOpFTWRfmCCBJsOUnBWObnj?=
 =?us-ascii?Q?V8ylIKUd8ad5kqtMT1YFYTN/2YwGhFb7OmvHxdmzg8fIZG1+Vc1kutW+BWmj?=
 =?us-ascii?Q?vQuMFfpTZzQpfpGHTp5rf0jxAKKXFi5sSPzMrbgS53+sTA+oI4nUxbBXqA3K?=
 =?us-ascii?Q?5gDw1EziN4e40n+oIlmlMjKvY5njqihvM53RZBtv/pu5D/6f95sSr4KZE/G4?=
 =?us-ascii?Q?sFyuC410gxduSM7T3ZfC7fPX6Z+aeYGLtAibatn3eTRk8AU3UA9DRl7tCsXD?=
 =?us-ascii?Q?e/dCwd7dtYogtMxeNxMQ/ZVjP8qQDhcKIvskshTetGsXHl4nckiUappfwqSx?=
 =?us-ascii?Q?SN98rjjPLbyGdIbw89T0Jw/5QYxWPkCbJnPk/4sLEsPSt3NqcZnf7ZCR4Iy8?=
 =?us-ascii?Q?sVC2pxqYrsPrSRQAPuiALfoS7Sy68e5y59Q2DLcpvGFA/rcxuPL+HpwFvK6M?=
 =?us-ascii?Q?obKDYCAIS0Ur/lgn6WkuFS3c9nVwZ9j+PDCGsJ6pK86VGKVkD17UPZdhNFxO?=
 =?us-ascii?Q?lPZ3mB9+zd/Y81m0noRMbAwPRW9ybiyNLrBApWRNlQlCMy0QzNfVZODH1tYA?=
 =?us-ascii?Q?eO3lPr9jb4I8ufiBnIWqUPb8TD39nkdA4+bzKQkxwgMhtRj6bNFnzTNK1D66?=
 =?us-ascii?Q?/4lDNHD3OmXNTEJD+sNbLOA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 251baa17-5fce-4f19-f810-08db86b09bec
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 10:28:49.3909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YqqJP42OsnepNrq8CVSxk/xdY4Tu8a/K3lSGs7BS0049E7yf+Ld2piW4o9QZSgPqkBmbXcf03HLznZa8T6Bpv74xKS7SlSHerUbGVeEROv5dwAXbX1FuGcb7izgvwuPn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6360
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/pvc: Disable FPU Residue
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jul 12, 2023 at 04:27:32AM +0000, Matthew Brost wrote:
>On Mon, Jul 10, 2023 at 02:44:59PM -0700, Niranjana Vishwanathapura wrote:
>> To reduce the power consumption disable FPU residue on some specific
>> devices if total EUs are 1024.
>>
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
>>  drivers/gpu/drm/xe/xe_gt_topology.c  |  3 ---
>>  drivers/gpu/drm/xe/xe_gt_types.h     |  3 +++
>>  drivers/gpu/drm/xe/xe_wa.c           | 34 ++++++++++++++++++++++++++++
>>  4 files changed, 38 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index d654f3311351..16405b16fddf 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -316,6 +316,7 @@
>>  #define   DIS_FIX_EOT1_FLUSH			REG_BIT(9)
>>
>>  #define ROW_CHICKEN				XE_REG_MCR(0xe4f0, XE_REG_OPTION_MASKED)
>> +#define   FPU_RESIDUE_DISABLE			REG_BIT(14)
>>  #define   UGM_BACKUP_MODE			REG_BIT(13)
>>  #define   MDQ_ARBITRATION_MODE			REG_BIT(12)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
>> index d4bbd0a835c2..a2da443160ab 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
>> @@ -11,9 +11,6 @@
>>  #include "xe_gt.h"
>>  #include "xe_mmio.h"
>>
>> -#define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
>> -#define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
>> -
>>  static void
>>  load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
>>  {
>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>> index 7d4de019f9a5..e4b894bd28bc 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> @@ -25,7 +25,10 @@ enum xe_gt_type {
>>  };
>>
>>  #define XE_MAX_DSS_FUSE_REGS	2
>> +#define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
>> +
>>  #define XE_MAX_EU_FUSE_REGS	1
>> +#define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
>>
>>  typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 * XE_MAX_DSS_FUSE_REGS)];
>>  typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_EU_FUSE_REGS)];
>> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>> index 5eaa9bed9d12..2852eaef6043 100644
>> --- a/drivers/gpu/drm/xe/xe_wa.c
>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>> @@ -13,6 +13,7 @@
>>  #include "regs/xe_engine_regs.h"
>>  #include "regs/xe_gt_regs.h"
>>  #include "regs/xe_regs.h"
>> +#include "xe_device.h"
>>  #include "xe_device_types.h"
>>  #include "xe_force_wake.h"
>>  #include "xe_gt.h"
>> @@ -256,6 +257,29 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>>  	{}
>>  };
>>
>> +static bool xe_wa_match_fpu_disable(const struct xe_gt *gt,
>> +				    const struct xe_hw_engine *hwe)
>> +{
>> +	struct xe_device *xe = gt_to_xe(hwe->gt);
>
>s/hwe->gt/gt

ok

>
>> +	struct xe_gt *gti;
>
>Not needed, just use gt.

ok

>
>> +	u16 eu_count = 0;
>> +	u8 gt_id;
>> +
>> +	if (xe->info.devid != 0x0bd6)
>
>Is there a define for 0x0bd6 or another way to test for this?

There is no XE_RTP_RULE for devid match. I can add a comment here
that this turning applies to PVC devid 0BD6.

Niranjana

>
>Matt
>
>> +		return false;
>> +
>> +	for_each_gt(gti, xe, gt_id) {
>> +		u16 n_dss = bitmap_weight(gti->fuse_topo.c_dss_mask,
>> +					  XE_MAX_DSS_FUSE_BITS);
>> +		u16 n_eu = bitmap_weight(gti->fuse_topo.eu_mask_per_dss,
>> +					 XE_MAX_EU_FUSE_BITS);
>> +
>> +		eu_count += n_dss * n_eu;
>> +	}
>> +
>> +	return eu_count == 1024;
>> +}
>> +
>>  static const struct xe_rtp_entry_sr engine_was[] = {
>>  	{ XE_RTP_NAME("22010931296, 18011464164, 14010919138"),
>>  	  XE_RTP_RULES(GRAPHICS_VERSION(1200), ENGINE_CLASS(RENDER)),
>> @@ -518,6 +542,16 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>>  		       GRAPHICS_STEP(B0, C0)),
>>  	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS, DISABLE_ECC))
>>  	},
>> +	/*
>> +	 * Not a workaournd, but for tuning power.
>> +	 * FPU residue disable will lower the power consumption.
>> +	 */
>> +	{ XE_RTP_NAME("WaFPUResidueDisable"),
>> +	  XE_RTP_RULES(PLATFORM(PVC),
>> +		       FUNC(xe_rtp_match_first_render_or_compute),
>> +		       FUNC(xe_wa_match_fpu_disable)),
>> +	  XE_RTP_ACTIONS(SET(ROW_CHICKEN, FPU_RESIDUE_DISABLE)),
>> +	},
>>
>>  	/* Xe_LPG */
>>  	{ XE_RTP_NAME("14017856879"),
>> --
>> 2.21.0.rc0.32.g243a4c7e27
>>
