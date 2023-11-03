Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79BC9C4332F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 04:59:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3879A10E388;
	Fri,  3 Nov 2023 04:59:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B4510E388
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 04:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698987573; x=1730523573;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rfzPd+2CLl7k96UYTxzpvWhTfTnDw7bOHiSXJdSzcCI=;
 b=jjVFHCyh4tOn+7FmcBW90PjtAytPZtx4kltVqpETzbr3zLA1EzwRBtXT
 LVEmdrnMD72oslbqtOlSQgSFj9tFJvwgNR49cepR2iTDp8S/rxWHPUPL+
 pysccnvbmiqKO5N+qCen7geDb6Ak7g4NE+azS7D7JUSi9zGdTBvfuusT7
 DHXnBvhNAX0ASvoJoa9PXwHs0EQBqFAn8hERW4vx/+3LzE6rQgf+e95P3
 PrAR+N+7ffHXe/3+WRA+7w127qwPkzpOUCw84Yc7AP932N5O8QV0OxTBz
 4RMvWqwkAtSLBVsc/sLHQ416RMlBJZOvy1fLmHJU5eW1LzLab0k/eqT7H w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="387767861"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="387767861"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 21:59:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="737966452"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="737966452"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Nov 2023 21:59:31 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 2 Nov 2023 21:59:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 2 Nov 2023 21:59:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 2 Nov 2023 21:59:30 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 2 Nov 2023 21:59:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SUXndhkASUt1eGWo+zUohKXya8Xub5TqG5QzapaVE9T3ZGmrEuWOp57hrCQ6pekyPQprfQzLWu0yWaCW7kQGnoGv6B2j4TiGslGGH9KVm99C1cZeD+2PILWyqor1jJK8Cg7+pyOpScC+nXZdRUPuwmUh5itDpIRdi/oB7EzE3lJbQ0+HcsLImGSou0aRyCSMHltA8BeMJ9dJl0Uz5xq3eNXZJbhtJ6nKc8pupXWxDZgODG5mjl8Ug1pcOkvUT4O5DhjgBFFAQb8wLS2REYQ6V8aJQod4YaZv1v0uRZP7uZ1k44+62X5SSNpHzJLrmMagWR+7rNk1FLmCNiQV7v8w0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WhC1aUTL98lyKkErkinXzgs1BwgeKXopb9a7krLO7LE=;
 b=IK51Mmvh0Sbf0/dP3wmKnXcyzJMdXWO3Omd7HddmG29OIWIaDKhDfSdUv16BHw5QPYQQTa6U1NXiBNsi1DU5UFLJ35fcywWnUYo2xuA6w3X4K3azdmEzwsmAJF2cqwp2nFRzB8qxGU88iO1vCty9mxlGbBePZXcsr/+PjH687mlLWs9+H6JFLOmb5CKNjJjOXNIKIqvMYoh8/7VuAyCgerb7ng9OYC6RyF8L+PgdK23qEO5J1gKzJuzD1N+FbN8ClgGOf2uDZYmAKvmcnIWRYXasLke03P7AImTYNjWdq3/onnfyWWX1GJ0zSBiSGA82qCFHPkZA1eAKU4SA1inT4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by IA0PR11MB7188.namprd11.prod.outlook.com (2603:10b6:208:440::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Fri, 3 Nov
 2023 04:59:23 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::787c:c5fe:c197:443c]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::787c:c5fe:c197:443c%7]) with mapi id 15.20.6954.021; Fri, 3 Nov 2023
 04:59:23 +0000
Date: Thu, 2 Nov 2023 21:59:20 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ZUR+KCMHW+V1nUsq@nvishwa1-DESK>
References: <20231101235749.4720-1-niranjana.vishwanathapura@intel.com>
 <20231101235749.4720-2-niranjana.vishwanathapura@intel.com>
 <20231102214002.GG5757@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231102214002.GG5757@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR05CA0075.namprd05.prod.outlook.com
 (2603:10b6:a03:332::20) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|IA0PR11MB7188:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d4dc711-481f-4434-eb88-08dbdc29a512
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: itCzIkUciaviOPiYDI3H0k3M8rHtWAnNgv5fXSyN51uWtL5owVwx11MwBxouXP5kJU9qLdEaJXwXS5EFk/gKX2TYeL7v/M5qiif7EOLBaUk7bYyZ8VJjFKHwPDpUurI6SXM3wEQPMbIqDl4AoKjrWIDIuBhf3wyq2YPXorTtrjE76H6rkPjEEbMeJCjQxXuGtZH/ELRrQelgA27LQFUfw7fnWAkkTonHAUQZwOiblKUMWd3gI2rgZL6iAgmSEb9UqPpPANh7tvxQUgidEGFHusGnPE0F2CAHFo83xo0VCLMfZYP9Tzj3YZO0FfVwfj92tuaTpO8Bkbhbu02ROt/MspkMyBk21x/apv+j59z74l/CaDsaIoU4VNoQTizcrDhXoGbrloVMrvEpsiO+R9k7adGgRRGwdMmoTN+VaqKSf4xfbobdd0QZfbONjaYqKy6LmUZJO+p5MCbRztiTVtSc3D+4h4vudhb8mRwWIyfcn/MSzgtvjTQZTfGl0rTomQ1QUktOQuflCZVXpyS+RtLKiZLjHIkUDOkQcqI/Js+dfvFaaOJHS51IravLZ9y8xDU3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(396003)(376002)(136003)(346002)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(6862004)(8676002)(6486002)(478600001)(2906002)(86362001)(26005)(38100700002)(82960400001)(33716001)(83380400001)(9686003)(6512007)(6506007)(5660300002)(6636002)(66476007)(316002)(66946007)(66556008)(41300700001)(44832011)(8936002)(4326008)(30864003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?oqeFUGGPsx+XvM2XYuvflirEQU+3ha2a/zY/wEZkD+x+MZxrFuR07KaT8K?=
 =?iso-8859-1?Q?5d61N0xRLhxRH1PXCVGtKChNx74PD+pTMYqSOLGQ1GbrDaYBILBEaCeNMM?=
 =?iso-8859-1?Q?J0XH3jWCLYkq2JBDivYCAqVWyrgTa456WxcyWSqVCe7mO2qRaGqtJWyIFk?=
 =?iso-8859-1?Q?LIZ6gSlirWYiee03mXB62TaKaNP2nXQkd/mxW3LkyUJ5HWBsjRG3HPioZ/?=
 =?iso-8859-1?Q?Us4vnVKLmzz0V+qLMYOUYYQ+/MBznfvdCdPyf1U8yd1DBnEOEYTeCDIGQy?=
 =?iso-8859-1?Q?66dKyGfnoTB3ukZ1B2lYTJYl8eW9rkH6Bk+t0L2+BBQ9HT/5iitOLg1XCX?=
 =?iso-8859-1?Q?5BnidP6+5DISQHGOA2rXyIm2olIrpA0cRcUsGJW+zXCwLnfOBXnr9Ch3D+?=
 =?iso-8859-1?Q?Z3/R2JtXJ2+GQj5v4BO11EIK4vDzWSOH1PkNb7R+SN0FdBKUGQB2LMjZvq?=
 =?iso-8859-1?Q?Q7jplMbPAYdrIxtv7eGkXvxnzSiGeBisr7N56u6Mv4Rk8Ym4omUZSPbzjP?=
 =?iso-8859-1?Q?uUeYFOQSqEUeoCFGZXMXSjUzTA8lLtPssvfObctNz08qNy3gTNrMnN1sr5?=
 =?iso-8859-1?Q?Wqwhf6JU/Slu2MT9DfBaRLxhhaJoSgYEBw3RR0BYnizaiJ4Ukf7xrQHxrM?=
 =?iso-8859-1?Q?/NHXtDfifY04G3M0RLoLrvfJRXcmzn3EFJUGNG775OLHG5QYcsMnChzqDq?=
 =?iso-8859-1?Q?NBV2AobJmKIQShXkYsiKrFRrC/XEajH3YM8FLUzEKUyCzNcjepriHG2aP2?=
 =?iso-8859-1?Q?TvQgyLgzjoEiF3ama+LKBRDF9tSHOkr98M9nB4BauqJKZTPuklqkhUP7mb?=
 =?iso-8859-1?Q?q8ND+pI2fsnYHo+Tg5UecbEr797Hl6Wj7Em9vdgEEuRWSVf3DbtEkFCLRF?=
 =?iso-8859-1?Q?UJq9yfxB57wJmdymScrRldOR9RrI/n+NCm+3sHb0DIoa/+0K0KchpRF/0B?=
 =?iso-8859-1?Q?XLcVUOzT4HxGBg+PCoYLi5rv9m7sTm3fXJoZ1Hb4motXC8BPu6ggrNHjis?=
 =?iso-8859-1?Q?qO9vxXmzAB4FqkNoLQADyKlcdlMMch4npv4lBZHaa0xN2bq1wcNBhxzsFU?=
 =?iso-8859-1?Q?W2LuatQaDwyL62/8IBQhSpb7AI81he44MTPRPCoVnx8EIEfMUpKo5HVZOJ?=
 =?iso-8859-1?Q?68K5BChYUJLio/XGY6ZIpctNlID8bOlRze1UwQwbGxfDtFTSG3UMqW5CLK?=
 =?iso-8859-1?Q?hMyByz6QFyS5L1WmEZw1Jcv0hWx9nIiMNe24LBWmsVdb/VubyNu+eUU9KF?=
 =?iso-8859-1?Q?n7nwbL50Eibdm26DrgjKTBfPsPTV1/RMCBQrBbHv8YsjjYKArSbtU/KZvJ?=
 =?iso-8859-1?Q?n3pQiZ7tQR8F5p7MdqF2DLm1lGbZq0COmcGrUnFHqMysCYkPbD2MdPAKdW?=
 =?iso-8859-1?Q?xLVuYbpoNR95jrdPDVz+PYLvPVX1EvHVFAd12Ov6YA5+KAEEMsd3/Jx03H?=
 =?iso-8859-1?Q?gGah1q+wbmQH1xM//uMG/n3PpRex+X7UOEGzBqJtuvqHb3o0bd/zaexLa4?=
 =?iso-8859-1?Q?KIxCu5FwFiBg5ua3xK1Wuj1VhJjfce1EqjYXHvftuEz/KNS3tYHp6w+AZe?=
 =?iso-8859-1?Q?/WQEo4W/TmOay1ON0KFBn97rloJqEqd1/iGEMWLsrd9kGaxtDGmBNCxMk+?=
 =?iso-8859-1?Q?8YQUtzXfmhsTD2DAOiZoNOa9KSX0ODyvg3+F47+2Jk28xxii5fs/fwI7j5?=
 =?iso-8859-1?Q?x3kH35lUGvhsutQJ934=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d4dc711-481f-4434-eb88-08dbdc29a512
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 04:59:22.5585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PO2eiLxOgIvAhKe8ou7y2E1dr86CqpM4LEmsWaWv2EiIVnPHhqa276VkkFoquVd/CTI+fASAGb/QBjVznsd2dto4vG0kLoWgxJElwtHXMLuJTFV3gfs+/xeq98/1RVkz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7188
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC v2 1/2] drm/xe: Enable Fixed CCS mode setting
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

On Thu, Nov 02, 2023 at 02:40:02PM -0700, Matt Roper wrote:
>On Wed, Nov 01, 2023 at 04:57:48PM -0700, Niranjana Vishwanathapura wrote:
>> Disable dynamic HW load balancing of compute resource assignment
>> to engines and instead enabled fixed mode of mapping compute
>> resources to engines.
>>
>> Allow user to configure this CCS mode setting through a 'ccs_mode'
>> sysfs entry.
>>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/xe/Makefile          |  1 +
>>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 14 +++++
>>  drivers/gpu/drm/xe/xe_gt.c           | 27 ++++++++--
>>  drivers/gpu/drm/xe/xe_gt.h           |  2 +
>>  drivers/gpu/drm/xe/xe_gt_ccs_mode.c  | 79 ++++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_gt_ccs_mode.h  | 22 ++++++++
>>  drivers/gpu/drm/xe/xe_gt_types.h     | 16 ++++++
>>  drivers/gpu/drm/xe/xe_guc_ads.c      |  3 ++
>>  drivers/gpu/drm/xe/xe_hw_engine.c    | 14 +++++
>>  drivers/gpu/drm/xe/xe_tile_sysfs.c   | 54 +++++++++++++++++++
>>  10 files changed, 227 insertions(+), 5 deletions(-)
>>  create mode 100644 drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>>  create mode 100644 drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 776c31e73f29..a335d8762741 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -58,6 +58,7 @@ xe-y += xe_bb.o \
>>  	xe_force_wake.o \
>>  	xe_ggtt.o \
>>  	xe_gt.o \
>> +	xe_gt_ccs_mode.o \
>>  	xe_gt_clock.o \
>>  	xe_gt_debugfs.o \
>>  	xe_gt_idle_sysfs.o \
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 7a6407e38265..b15aca465fc9 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -388,8 +388,22 @@
>>  #define   COMP_CKN_IN				REG_GENMASK(30, 29)
>>
>>  #define RCU_MODE				XE_REG(0x14800, XE_REG_OPTION_MASKED)
>> +#define   RCU_MODE_FIXED_SLICE_CCS_MODE		REG_BIT(1)
>>  #define   RCU_MODE_CCS_ENABLE			REG_BIT(0)
>>
>> +/*
>> + * Total of 4 cslices, where each cslice is in the form:
>> + *   [0-3]     CCS ID
>> + *   [4-6]     RSVD
>> + *   [7]       Disabled
>> + */
>> +#define CCS_MODE				XE_REG(0x14804)
>> +#define   CCS_MODE_CSLICE_0_3_MASK		REG_GENMASK(11, 0) /* 3 bits per cslice */
>> +#define   CCS_MODE_CSLICE_MASK			0x7 /* CCS0-3 + rsvd */
>> +#define   CCS_MODE_CSLICE_WIDTH			ilog2(CCS_MODE_CSLICE_MASK + 1)
>> +#define   CCS_MODE_CSLICE(cslice, ccs) \
>> +	(ccs << (cslice * CCS_MODE_CSLICE_WIDTH))
>> +
>>  #define FORCEWAKE_ACK_GT			XE_REG(0x130044)
>>  #define   FORCEWAKE_KERNEL			BIT(0)
>>  #define   FORCEWAKE_USER			BIT(1)
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index d380f67b3365..5f3e2d3d63c3 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -22,6 +22,7 @@
>>  #include "xe_force_wake.h"
>>  #include "xe_ggtt.h"
>>  #include "xe_gt_clock.h"
>> +#include "xe_gt_ccs_mode.h"
>
>Nitpick:  We usually try to keep the #include's sorted, so "ccs" should
>come before "clock."  Some of the other #include's farther down this
>patch also need to be moved too.

Thanks Matt for the review.
Yah, I tried to keep #include's sorted, but looks like I missed at couple
locations, will fix.

>
>>  #include "xe_gt_idle_sysfs.h"
>>  #include "xe_gt_mcr.h"
>>  #include "xe_gt_pagefault.h"
>> @@ -78,6 +79,7 @@ static void gt_fini(struct drm_device *drm, void *arg)
>>  	int i;
>>
>>  	destroy_workqueue(gt->ordered_wq);
>> +	mutex_destroy(&gt->ccs.mutex);
>>
>>  	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
>>  		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
>> @@ -447,6 +449,12 @@ static int all_fw_domain_init(struct xe_gt *gt)
>>  	if (err)
>>  		goto err_force_wake;
>>
>> +	/* Configure default CCS mode of 1 engine with all resources */
>> +	if (xe_gt_needs_ccs_mode(gt)) {
>
>If we're making this the new driver default, that's a pretty big
>behavior change.  That's probably fine right now since Xe is still under
>development, but you should probably get ack's on this change from the
>relevant UMD devs just to make sure everyone is on the same page here.
>It might also be good to put some justification in the commit message
>too about why we think this is the best default.
>

Yah, compute UMD is fine with it. Sure will do.

>> +		gt->ccs.num_engines = 1;
>> +		xe_gt_apply_ccs_mode(gt);
>> +	}
>> +
>>  	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>  	XE_WARN_ON(err);
>>  	xe_device_mem_access_put(gt_to_xe(gt));
>> @@ -468,6 +476,7 @@ int xe_gt_init(struct xe_gt *gt)
>>  	int err;
>>  	int i;
>>
>> +	mutex_init(&gt->ccs.mutex);
>>  	INIT_WORK(&gt->reset.worker, gt_reset_worker);
>>
>>  	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i) {
>> @@ -477,11 +486,11 @@ int xe_gt_init(struct xe_gt *gt)
>>
>>  	err = xe_gt_tlb_invalidation_init(gt);
>>  	if (err)
>> -		return err;
>> +		goto err_ccs_mode;
>>
>>  	err = xe_gt_pagefault_init(gt);
>>  	if (err)
>> -		return err;
>> +		goto err_ccs_mode;
>>
>>  	xe_mocs_init_early(gt);
>>
>> @@ -489,19 +498,24 @@ int xe_gt_init(struct xe_gt *gt)
>>
>>  	err = gt_fw_domain_init(gt);
>>  	if (err)
>> -		return err;
>> +		goto err_ccs_mode;
>>
>>  	xe_force_wake_init_engines(gt, gt_to_fw(gt));
>>
>>  	err = all_fw_domain_init(gt);
>>  	if (err)
>> -		return err;
>> +		goto err_ccs_mode;
>>
>>  	err = drmm_add_action_or_reset(&gt_to_xe(gt)->drm, gt_fini, gt);
>>  	if (err)
>> -		return err;
>> +		goto err_ccs_mode;
>>
>>  	return 0;
>> +
>> +err_ccs_mode:
>> +	mutex_destroy(&gt->ccs.mutex);
>> +
>> +	return err;
>>  }
>>
>>  static int do_gt_reset(struct xe_gt *gt)
>> @@ -549,6 +563,9 @@ static int do_gt_restart(struct xe_gt *gt)
>>  		xe_reg_sr_apply_whitelist(hwe);
>>  	}
>>
>> +	/* Get CCS mode in sync between sw/hw */
>> +	xe_gt_apply_ccs_mode(gt);
>> +
>>  	return 0;
>>  }
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>> index caded203a8a0..1c2a1d35a2c1 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.h
>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>> @@ -17,6 +17,8 @@
>>  		for_each_if(((hwe__) = (gt__)->hw_engines + (id__)) && \
>>  			  xe_hw_engine_is_valid((hwe__)))
>>
>> +#define CCS_MASK(gt) ((gt->info.engine_mask & XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)
>> +
>>  #ifdef CONFIG_FAULT_INJECTION
>>  extern struct fault_attr gt_reset_failure;
>>  static inline bool xe_fault_inject_gt_reset(void)
>> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>> new file mode 100644
>> index 000000000000..cec552e823b6
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>> @@ -0,0 +1,79 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include "xe_assert.h"
>> +#include "xe_gt.h"
>> +#include "xe_mmio.h"
>> +#include "xe_gt_ccs_mode.h"
>> +#include "regs/xe_gt_regs.h"
>> +
>> +static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
>> +{
>> +	u32 mode = CCS_MODE_CSLICE_0_3_MASK; /* disable all by default */
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	struct xe_hw_engine *hwe;
>> +	int num_slices = hweight32(CCS_MASK(gt));
>> +	int width, cslice;
>> +	enum xe_hw_engine_id id;
>> +	u32 config = 0;
>> +
>> +	lockdep_assert_held(&gt->ccs.mutex);
>> +	xe_assert(xe, GRAPHICS_VERx100(gt_to_xe(gt)) <= 1260);
>
>Why a <= here when the other checks elsewhere are ==?  Actually, if we
>think we might extend this to other platforms in the future, it's
>probably best to just pull out the version matching to a dedicated
>function now so that when new platforms need this in the future we can
>just make a single change in one place, rather than hunting down all the
>1260 checks in the code.
>

Yah, and that one place is the function xe_gt_needs_ccs_mode().
Ok, will call this function in this assert.

>> +
>> +	xe_assert(xe, num_engines && num_engines <= num_slices);
>> +	xe_assert(xe, !(num_slices % num_engines));
>> +
>> +	/*
>> +	 * Loop over all available slices and assign each a user engine.
>> +	 *
>> +	 * With 1 engine (ccs0):
>> +	 *   slice 0, 1, 2, 3: ccs0
>> +	 *
>> +	 * With 2 engines (ccs0, ccs1):
>> +	 *   slice 0, 2: ccs0
>> +	 *   slice 1, 3: ccs1
>> +	 *
>> +	 * With 4 engines (ccs0, ccs1, ccs2, ccs3):
>> +	 *   slice 0: ccs0
>> +	 *   slice 1: ccs1
>> +	 *   slice 2: ccs2
>> +	 *   slice 3: ccs3
>> +	 */
>> +	for (width = num_slices / num_engines, cslice = 0; width--;) {
>> +		for_each_hw_engine(hwe, gt, id) {
>> +			if (hwe->class != XE_ENGINE_CLASS_COMPUTE)
>> +				continue;
>> +
>> +			if (hwe->logical_instance >= num_engines)
>> +				break;
>> +
>> +			config |= BIT(hwe->instance) << XE_HW_ENGINE_CCS0;
>> +
>> +			/* If a slice is fused off, leave disabled */
>> +			while ((CCS_MASK(gt) & BIT(cslice)) == 0)
>> +				cslice++;
>> +
>> +			mode &= ~CCS_MODE_CSLICE(cslice, CCS_MODE_CSLICE_MASK);
>> +			mode |= CCS_MODE_CSLICE(cslice, hwe->instance);
>> +			cslice++;
>> +		}
>> +	}
>> +
>> +	xe_mmio_write32(gt, CCS_MODE, mode);
>> +
>> +	drm_info(&xe->drm,
>> +		 "tile-%d CCS_MODE=%x config:%08x, num_engines:%d, num_slices:%d\n",
>> +		 gt_to_tile(gt)->id, mode, config, num_engines, num_slices);
>
>You probably want to use xe_gt_info() here so that it will print out the
>GT identification automatically in a standard form.  Then you can drop
>the tile ID part of the message (which could become confusing anyway if
>we ever have multiple GTs with CCS engines within the same tile).
>

Yah, makes sense, will fix.

>
>> +}
>> +
>> +void xe_gt_apply_ccs_mode(struct xe_gt *gt)
>> +{
>> +	mutex_lock(&gt->ccs.mutex);
>
>What exactly is ccs.mutex protecting?  From a quick glance it doesn't
>look like racing calls to this function without the lock would be any
>more problematic than racing calls with the lock?  And this only gets
>called during init / reset so is it even possible to have a race?
>
>> +
>> +	if (gt->ccs.num_engines)
>> +		__xe_gt_apply_ccs_mode(gt, gt->ccs.num_engines);
>> +
>> +	mutex_unlock(&gt->ccs.mutex);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>> new file mode 100644
>> index 000000000000..793f3bbb4937
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>> @@ -0,0 +1,22 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GT_CCS_MODE_H_
>> +#define _XE_GT_CCS_MODE_H_
>> +
>> +#include "xe_device_types.h"
>> +#include "xe_gt.h"
>> +#include "xe_gt_types.h"
>> +#include "xe_platform_types.h"
>> +
>> +void xe_gt_apply_ccs_mode(struct xe_gt *gt);
>> +
>> +static inline bool xe_gt_needs_ccs_mode(const struct xe_gt *gt)
>> +{
>> +	return GRAPHICS_VERx100(gt_to_xe(gt)) == 1260 && CCS_MASK(gt);
>> +}
>> +
>> +#endif
>> +
>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>> index d3f2793684e2..5342aff9dd68 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> @@ -185,6 +185,22 @@ struct xe_gt {
>>  		spinlock_t lock;
>>  	} tlb_invalidation;
>>
>> +	/**
>> +	 * @ccs: Fixed mapping between CCS engines and compute slices.
>> +	 * Through the per-tile 'ccs_mode' sysfs interface, the user can specify a
>> +	 * fixed number of compute hardware engines to which the available compute
>> +	 * slices are to be allocated. By default all compute slices are allocated
>> +	 * to the first available compute engine instance. This user configuration
>> +	 * change triggers a tile reset and it is expected that user will ensure
>> +	 * the tile is idle while doing so.
>> +	 */
>> +	struct {
>> +		/** @mutex: Serialize CCS mode access */
>> +		struct mutex mutex;
>> +		/** @num_engines: Number of CCS engines enabled */
>> +		u32 num_engines;
>> +	} ccs;
>> +
>>  	/** @usm: unified shared memory state */
>>  	struct {
>>  		/**
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>> index 88789826e781..74b550be0e36 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>> @@ -8,6 +8,7 @@
>>  #include <drm/drm_managed.h>
>>
>>  #include "regs/xe_engine_regs.h"
>> +#include "xe_gt_ccs_mode.h"
>>  #include "regs/xe_gt_regs.h"
>>  #include "regs/xe_guc_regs.h"
>>  #include "xe_bo.h"
>> @@ -454,6 +455,8 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
>>  		{ .reg = RING_HWS_PGA(hwe->mmio_base),			},
>>  		{ .reg = RING_IMR(hwe->mmio_base),			},
>>  		{ .reg = RCU_MODE, .skip = hwe != hwe_rcs_reset_domain	},
>> +		{ .reg = CCS_MODE,
>> +		  .skip = hwe != hwe_rcs_reset_domain || !xe_gt_needs_ccs_mode(hwe->gt)	},
>
>I don't think CCS_MODE exists on older (pre-xehp platforms).  So I think
>this will cause either an invalid register (or possibly an unrelated
>register if there's something else at that offset) to get saved/restored
>on older platforms like TGL, ADL, etc.
>

yes, that is  why we have '!xe_gt_needs_ccs_mode()' call here. ie, if ccs_mode is not
needed (like in pre-xehpc platforms), this register will be skipped.

>>  	};
>>  	u32 i;
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>> index b5b084590888..0058bbf8fd06 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> @@ -8,6 +8,7 @@
>>  #include <drm/drm_managed.h>
>>
>>  #include "regs/xe_engine_regs.h"
>> +#include "xe_gt_ccs_mode.h"
>>  #include "regs/xe_gt_regs.h"
>>  #include "regs/xe_regs.h"
>>  #include "xe_assert.h"
>> @@ -283,6 +284,13 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
>>  	hw_engine_mmio_read32(hwe, RING_MI_MODE(0));
>>  }
>>
>> +static bool xe_hw_engine_match_fixed_cslice_mode(const struct xe_gt *gt,
>> +						 const struct xe_hw_engine *hwe)
>> +{
>> +	return xe_gt_needs_ccs_mode(gt) &&
>> +	       xe_rtp_match_first_render_or_compute(gt, hwe);
>> +}
>> +
>>  void
>>  xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
>>  {
>> @@ -307,6 +315,12 @@ xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
>>  				 blit_cctl_val,
>>  				 XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>>  		},
>> +		/* Use Fixed slice CCS mode */
>> +		{ XE_RTP_NAME("RCU_MODE_FIXED_SLICE_CCS_MODE"),
>> +		  XE_RTP_RULES(FUNC(xe_hw_engine_match_fixed_cslice_mode)),
>> +		  XE_RTP_ACTIONS(FIELD_SET(RCU_MODE, RCU_MODE_FIXED_SLICE_CCS_MODE,
>> +					   RCU_MODE_FIXED_SLICE_CCS_MODE))
>> +		},
>>  		{}
>>  	};
>>
>> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> index 16376607c68f..a0162744ce24 100644
>> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>
>Engines are a GT concept, not a tile concept, so you probably want this
>in the GT sysfs instead.  Otherwise we're going to be stuck with a
>problematic ABI down the road if we have a platform with multiple
>compute-capable GTs within a single tile.
>

yah, makes sense, will fix.

>
>> @@ -7,8 +7,12 @@
>>  #include <linux/sysfs.h>
>>  #include <drm/drm_managed.h>
>>
>> +#include "xe_gt.h"
>> +#include "xe_gt_ccs_mode.h"
>> +#include "xe_mmio.h"
>>  #include "xe_tile.h"
>>  #include "xe_tile_sysfs.h"
>> +#include "regs/xe_gt_regs.h"
>>
>>  static void xe_tile_sysfs_kobj_release(struct kobject *kobj)
>>  {
>> @@ -34,6 +38,51 @@ static DEVICE_ATTR_RO(physical_vram_size_bytes);
>>  static const struct attribute *physical_memsize_attr =
>>  	&dev_attr_physical_vram_size_bytes.attr;
>>
>> +static ssize_t
>> +ccs_mode_show(struct device *kdev,
>> +	      struct device_attribute *attr, char *buf)
>> +{
>> +	struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
>> +
>> +	return sysfs_emit(buf, "%d\n", tile->primary_gt->ccs.num_engines);
>> +}
>> +
>> +static ssize_t
>> +ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>> +	       const char *buff, size_t count)
>> +{
>> +	struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
>> +	struct xe_device *xe = tile_to_xe(tile);
>> +	struct xe_gt *gt = tile->primary_gt;
>> +	u32 num_engines, num_slices;
>> +	int ret;
>> +
>> +	ret = kstrtou32(buff, 0, &num_engines);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/*
>> +	 * Ensure number of engines specified is valid and there is an
>> +	 * exact multiple of engines for slices.
>> +	 */
>> +	num_slices = hweight32(CCS_MASK(gt));
>> +	if (!num_engines || num_engines > num_slices || num_slices % num_engines) {
>> +		drm_dbg(&xe->drm, "Invalid compute config for tile %d, %d engines %d slices\n",
>
>As earlier, we should probably use xe_gt_dbg() and drop the
>tile-specific number since the function will print the GT identification
>automatically.  Same for the other drm_info (xe_gt_info) and drm_warn
>(xe_gt_warn) messages below.
>

Yah, makes sense, will fix.

>> +			tile->id, num_engines, num_slices);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (gt->ccs.num_engines != num_engines) {
>> +		drm_info(&xe->drm, "tile-%d: setting compute mode to %d\n", tile->id, num_engines);
>> +		gt->ccs.num_engines = num_engines;
>> +		xe_gt_reset_async(gt);
>> +	}
>> +
>> +	return count;
>> +}
>> +
>> +static DEVICE_ATTR_RW(ccs_mode);
>> +
>>  static void tile_sysfs_fini(struct drm_device *drm, void *arg)
>>  {
>>  	struct xe_tile *tile = arg;
>> @@ -69,6 +118,11 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>
>We'll want to move this to xe_gt_sysfs_init as well.
>

Yah, will fix.

Niranjana

>
>Matt
>
>>  		drm_warn(&xe->drm,
>>  			 "Sysfs creation to read addr_range per tile failed\n");
>>
>> +	if (GRAPHICS_VERx100(xe) == 1260 &&
>> +	    sysfs_create_file(tile->sysfs, &dev_attr_ccs_mode.attr))
>> +		drm_warn(&xe->drm,
>> +			 "Sysfs creation to set ccs_mode failed\n");
>> +
>>  	err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
>>  	if (err) {
>>  		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
>> --
>> 2.21.0.rc0.32.g243a4c7e27
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
