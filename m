Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434B5FCC05D
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 19:01:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0ADA10EDFF;
	Fri,  6 Mar 2026 19:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X0uTBEWg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E1E10EDFF
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Mar 2026 19:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772823679; x=1804359679;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=gvskVXWb66XtC226NvgbmvD1Eb+kvW4kDXWP2q2unFU=;
 b=X0uTBEWgwvgFXOQs8fZLWH+LCzOZfgkFF7AM1nPSpAass0iEFOMeptZR
 8KXtyx+We0gKiWvEmbp7aTcO7ouHDoxtHb7HdNOZSop0z96OXfmIsxvcB
 5/BvqSsOjkCSSv25tmZOAGQLVykMppK70Uy9HTCb7xCdAmgPFI/+RWcWx
 zGNV8Ebh2VlLID8a18U0/iDXEKn0DKLqN8FRQy7tNVHh59tJvcZ2vPdFg
 L7JLNMUVTCxMrumHSSg7ydIBe+Y1KKghFZu2DKwPsPfFo6QlvnkloAE2Z
 TGyPghsTgS6pxapEhZec704WmuuTMiDDQ4ofixghDZGMrzGmfj/0auSkW A==;
X-CSE-ConnectionGUID: 9Y9qxVSUSnKHHUImW49Nrg==
X-CSE-MsgGUID: jGDjJ7BqQT+qsgSAUuaPGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="73986613"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="73986613"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 11:01:18 -0800
X-CSE-ConnectionGUID: pf24h5rtSMSDpToZk0R0vw==
X-CSE-MsgGUID: I/Bh6eWOQFyOMoG/lh0hqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="219212841"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 11:01:17 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 6 Mar 2026 11:01:16 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 6 Mar 2026 11:01:16 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.45) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 6 Mar 2026 11:01:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wnrQh+H6o/zLG60DdmOtyLH2V3arB/YwUdonA5QmMrDGjVe8sRBu5/vmw8mMzhBy7k5D+GpHdiOmzjF28QJnC8n+X0Ikfrc7DHWTuwEGhXhAgjKibJtf8Jr9qtHMKCYbYraNCoicd+mrI0UWgTyJGg7Kdgp0r7bFgURwjt6kKPBkGbf4Y3NYg9HWpUTWHk+Cf3bUy9h3whzHF1HwQpQ8nZmTRhvUdsakg2ao2vUCHiTbNdxFE18l0nIXyi6sebjsBcVFqhoItgL0wUh2Dx1rPbp0G77h5xbdSh/hAMAV3ION28aK9l4eS+18HNv4kJfrfAbmjOwkIhzwTFY8skRlGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ED0wFqr6CDf+n4DZtkeApzNiVB1t1XWsV+B1uvvjrEY=;
 b=TZrj/aO4VKhEhd36fGwQtVXMHI3upoo1o6+Ye6ug5SIaLo3L7p+ehm1Dv/MQ0SCGZmjYNt4WcNWycjWOxYfdbgV45i+M3LHv37w5hwyBIB+bGPmYQ6bTWAT0RQdvT27Hl/Hq3EYO97ybd6Ha8F4GaAoXMjZf4rxxkMImVaF0UunryHdFbXPfLQn5cColCL1UUpwmrXuOLQjnaTwPIbZXM++7MUft0WqzYKiCjcT8lysCgKGGRE1KM8HMJSwiS1UNlymwlGHazrKXZ2pPQAaoEdhOydjc97G8lWcxFhU33/sApUhJhnGnUiez1TKL4JNo23dboycyUNwLaRCB9sPirg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MW4PR11MB6887.namprd11.prod.outlook.com (2603:10b6:303:225::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Fri, 6 Mar
 2026 19:01:10 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%3]) with mapi id 15.20.9678.016; Fri, 6 Mar 2026
 19:01:10 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 5/7] drm/xe/nvlp: Implement Wa_14026539277
In-Reply-To: <20260306183953.GY52346@mdroper-desk1.amr.corp.intel.com>
References: <20260306-extra-nvl-p-enabling-patches-v2-0-53dcfa6b44e4@intel.com>
 <20260306-extra-nvl-p-enabling-patches-v2-5-53dcfa6b44e4@intel.com>
 <20260306183953.GY52346@mdroper-desk1.amr.corp.intel.com>
Date: Fri, 6 Mar 2026 16:01:05 -0300
Message-ID: <87y0k4wzny.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0070.namprd08.prod.outlook.com
 (2603:10b6:a03:117::47) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MW4PR11MB6887:EE_
X-MS-Office365-Filtering-Correlation-Id: a926acd8-0451-416c-e30d-08de7bb2baa4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: xLQ5HAHyl2UWcLoX8AuNMUA1XICkgiWP8Qm93yW1dwY7A9TfGB4F3EfdoQHbSwYhj1fgKKeMlYG0eIwvZc4b2zq4z4To6+IukNWuUZMu5SnXfhGorwbSF+0LQyJsmavwVcOi5fwX5eTd3AwzuVXjfnSc6PCisIF/84T7TSfytWAQO+n6fdXwrbQBQ8YO/z5fYLAlPnBiM94UDCKJyJ8qQFntDzE/WteukN9bEFdJviDyav8aBFM8hciEkgj7p4FkNyOmF74z+qY4e9BixAD8B6qV5CewWIEfOEeKPPDFJrPD9giWPYx76164qGCnFsy5//11Z1SqKIs9aL/k7dYbnwVZWkHYv/J19M6KhXxbHf3oVyJjg+AhrJ/6NcMzpHARmVKqOEieKRI0EOorX0WrCOEqET2IoU/U06YVA2AJA2LA4UI2XQphm1wRxSuFFJvpzgk4er7QheeKqq9ooWtClBs4b1y1HHiof+oMNAypiPZvJre84EVz0OtM6yMCyvfs5NdRJcrxJ8I8Qd42NMAaoouCy06lPkEtwXy9U39o7M/2zJxej3EWSwj5zcvyAYwRf80lurqY9B3Awfv1c8bH2R2v7ldODasP8RmKWxXeLvsFK+5GHmmLZEOiQN43uwuxeaI/qCj6j++WeopIV3lU0Eb17kGO/tT17cQ08PgN0EEF4Dgg4A+TcxkBusYqKdp2DjODHfmTwzX6am540mWSgBsVVjC7xZcMOilfabrKXjk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F0DC8QH8NmxDq2Buns2Sne9HoSVONgO7+3Xx/8u4oIMe6Wkzv9tJgYBdqws6?=
 =?us-ascii?Q?RTzAPSPnrf/9/8f9BUhoN2klP/cztuQtBoAPJPw7J3lMxpxQuqQ+qwk9bNMU?=
 =?us-ascii?Q?R3FxrRxUKSLEarbSxOrJHLUJ2hLk4TxHyC1jKOyKIbqD093OTSsoUdqAWGNM?=
 =?us-ascii?Q?KxDuhV6PRVQ0GNiqQJaWaeMFG4RX2/+gsFwSxkjsk7nAh3xg+xvsNM/Y7BOo?=
 =?us-ascii?Q?l4yyIAI7sbd7D2sQi1RsDybUf0wEmodmF4E2VMve9tYND+b+gGSaNtnGM20r?=
 =?us-ascii?Q?CTsycfTQp+gABKLIAWkA8WEBngDktgYyK+8dBWTRi6xj+48Byl26DetaaxPu?=
 =?us-ascii?Q?GGaHSSeTA+rya3F1byjTCB90NijJhexWO0zUs47U581eo/o+eTo/E7pC28EY?=
 =?us-ascii?Q?Ey45XB68hEjpQ9O34a5JOSlvr4FClu5NCUhNX4hC0UFxWBl00o9c6ASvQB5n?=
 =?us-ascii?Q?h+czTxjbVKjBNkpMSLkHEiC7e3J1H+O77d4uSz4mpi6EpuypPto7Pw4dqA6M?=
 =?us-ascii?Q?cxD12ncE22REc0EA4beQg01ciIpMW3/HN7Tu4Haia03VDSSE7AJjZ4YHf2xw?=
 =?us-ascii?Q?DyAO2sb9upTLo9BskICtHbYFaollTeaUeOHCsxs3uzgKXo1IcNL907osW1+v?=
 =?us-ascii?Q?bM5LOGUiYVqd3Je9yf+LJdRIHfSHVCkiy/6/cpnhRVuwhwwvp7/Gf2z0mn0p?=
 =?us-ascii?Q?ABT6CziL2wiuC3HNeXKnQ7GWMfFELnrRxGyYYY3KcOfb3DXdzJyK07jD/Ysm?=
 =?us-ascii?Q?EEAqr1M8rGREV2f096Pj1W13vOxeg7cBUoGqYBY+wjkoyuqE3MqgjexIJ+7O?=
 =?us-ascii?Q?jq/bH4P7EvNtagoVcxFsxzLmzh7dB1lmiN/pSRDAQzGWhEb2P1u1y5tCbIud?=
 =?us-ascii?Q?N6kK6uDUAR3PthnCQfqm/6SC6ns1XCqQ2JynT6/PGsL9iNfyffmtP4mCOTC1?=
 =?us-ascii?Q?5d1T3CuCEZrqOjKVwWTE4FfUbT+EE+7G+8LlMAXtNNka7klTXeKEsuOg4879?=
 =?us-ascii?Q?mlOTWMia1XbkBiquMF0MbK99WYZ1DqxXk87XUHv1N6hrNclEAxsr6NWOW6eY?=
 =?us-ascii?Q?vBHQBcyHerzuOsbSrAxOrIdrAmAtwrp1Yamkf56RAcxxiRo/2VA1sJUvOteW?=
 =?us-ascii?Q?bKtOM/X2ZFGkopHv9tE7k3eNoi3W5o+q19innGDFP0yEAZeU2KMAHcBzLHs8?=
 =?us-ascii?Q?sowGIubIj+d4vafTlZwPd+ykbbPjMm/0AKeAo9Mt4fO3jyZGW0kjsokYTlGh?=
 =?us-ascii?Q?j8yNfa2yAETGey906Pcna5YBtxiln0H02cPj5j1Tchsevf7PCnerAv5/7Xyw?=
 =?us-ascii?Q?deKgcLPi5ZClVc/LnHuo5VaC5FM9Z/a+Yane8zMNc7FcLGPV9UK2UFvHc10n?=
 =?us-ascii?Q?i1NAAMQPnPz3lkBpuZ5WVC7K7FTztAnCg8bCExzTKrebb8ohMBts/THxt27k?=
 =?us-ascii?Q?GTJXVD9cxu+uze117nzqtpBWDvh00TuYDbNt0iPXO9eSGSajksEWZoV/oyOa?=
 =?us-ascii?Q?Arbt/2c6A7Zrg1eqE13E6+faaQ8YmWfHDkN15L3+56Bmubq+CQ5mmgsMC4Zw?=
 =?us-ascii?Q?rfJn1Y2l2Hua5H1AbKFP7kaAu7APXmQnjp7DIQ7yEbkEBHXFwiRiE+1SxjIU?=
 =?us-ascii?Q?7SL/ti13UYP98TlfNYZOa5Ddg3NDbIbKKsUUHVcdxDwc20gxmEYBu/U6Trza?=
 =?us-ascii?Q?GnhQRyi3yZVcrdmrH2ZFhin43Fw5Dur8JWj3KB96MaKkF7089sKjnBJONyuA?=
 =?us-ascii?Q?M6zqHDkSgQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a926acd8-0451-416c-e30d-08de7bb2baa4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 19:01:10.0157 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0PY0B5J1tBtv+hXQiMpWcPAXlw856Lw8zbXGw5uguiFSJQsG6GIHZyawbZK7M+q3Awzakw1EbBmCq+i0ZwtcPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6887
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

Matt Roper <matthew.d.roper@intel.com> writes:

> On Fri, Mar 06, 2026 at 02:28:25PM -0300, Gustavo Sousa wrote:
>> Implement the KMD part of Wa_14026539277, which applies to NVL-P A0.
>> The KMD implementation is just one component of the workaround, which
>> also depends on Pcode to implement its part in order to be complete.
>> 
>> v2:
>>   - Add FUNC(xe_rtp_match_not_sriov_vf) to skip applying the workaround
>>     to SRIOV VFs. (Matt)
>> 
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  4 ++++
>>  drivers/gpu/drm/xe/xe_gt.c           | 27 +++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_wa_oob.rules   |  2 ++
>>  3 files changed, 33 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 66ddad767ad4..a83cafbe03fd 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -452,6 +452,10 @@
>>  
>>  #define XEHPC_L3CLOS_MASK(i)			XE_REG_MCR(0xb194 + (i) * 8)
>>  
>> +#define L2COMPUTESIDECTRL			XE_REG_MCR(0xb1c0)
>> +#define   CECTRL				REG_GENMASK(2, 1)
>> +#define   CECTRL_CENODATA_ALWAYS		REG_FIELD_PREP(CECTRL, 0x0)
>> +
>>  #define XE2_GLOBAL_INVAL			XE_REG(0xb404)
>>  
>>  #define XE2LPM_L3SQCREG2			XE_REG_MCR(0xb604)
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index b455af1e6072..3c8692f9b8cf 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -450,6 +450,25 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>>  	return err;
>>  }
>>  
>> +static void xe_gt_wa_14026539277(struct xe_gt *gt)
>> +{
>> +	u32 val;
>> +
>> +	if (!XE_GT_WA(gt, 14026539277))
>> +		return;
>> +
>> +	/*
>> +	 * L2COMPUTESIDECTRL has a specific offset for media and the GSI offset
>> +	 * does not apply.
>> +	 */
>> +	xe_gt_assert(gt, xe_gt_is_main_type(gt));
>> +
>> +	val = xe_gt_mcr_unicast_read_any(gt, L2COMPUTESIDECTRL);
>> +	val &= ~CECTRL;
>> +	val |= CECTRL_CENODATA_ALWAYS;
>> +	xe_gt_mcr_multicast_write(gt, L2COMPUTESIDECTRL, val);
>> +}
>> +
>>  int xe_gt_init_early(struct xe_gt *gt)
>>  {
>>  	int err;
>> @@ -575,6 +594,14 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
>>  	 */
>>  	gt->info.gmdid = xe_mmio_read32(&gt->mmio, GMD_ID);
>>  
>> +	/*
>> +	 * Wa_14026539277 can't be implemented as a regular GT workaround (i.e.
>> +	 * as an entry in gt_was[]) because we would get the hardware already in
>> +	 * a bad state by the time it would be applied.  Hence, we implement it
>> +	 * as an OOB workaround and apply it early to prevent that.
>> +	 */
>> +	xe_gt_wa_14026539277(gt);
>> +
>>  	return 0;
>>  }
>>  
>> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> index 80b54b195f20..03a0bf0aeb6e 100644
>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> @@ -58,3 +58,5 @@
>>  
>>  14025883347	MEDIA_VERSION_RANGE(1301, 3503)
>>  		GRAPHICS_VERSION_RANGE(2004, 3005)
>> +
>> +14026539277	PLATFORM(NOVALAKE_P), PLATFORM_STEP(A0, B0), GRAPHICS_VERSION(3510), FUNC(xe_rtp_match_not_sriov_vf)
>
> I don't think it's right that we have both platform matches and IP
> matches here; that's not something that should usually happen because
> the workaround is either tied to the platform (NVL) or tied to the IP
> (Xe3p_LPG).  For device workarounds, the handling in our graphics
> workaround database can be a bit confusing since what we're looking at
> is really just a proxy/placeholder ticket for something that was filed
> in a different database originally.  Due to how the databases work, they
> have to slap some IP release on the proxy ticket, but in this case we
> don't need to add a match for those to our driver rules; just the
> platform information is sufficient.
>
> That would also mean that this should probably be an XE_DEVICE_WA()
> rather than an XE_GT_WA() and the workaround function we're adding here
> should be renamed.

Hm... But are we meant to apply the programming to the media GT as well?
I thought the issue for this workaround was observed only on the primary
GT.

So, should we make this a device workaround and add then make sure that
we apply it only on the primary GT in the function that implements it?

We will probably need to rework device OOB workarounds in
order to make this change, because stepping information is not ready by
the time device OOB workarounds are matched (i.e. when
xe_wa_process_device_oob() is called before we read the stepping
information into the device info).

--
Gustavo Sousa

>
>
> Matt
>
>> 
>> -- 
>> 2.52.0
>> 
>
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
