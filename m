Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1A5C3DA6E
	for <intel-xe@archiver.kernel.org>; Wed, 20 Dec 2023 04:37:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A8E10E02E;
	Wed, 20 Dec 2023 04:37:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D126710E02E
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Dec 2023 04:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703047054; x=1734583054;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Y/naXzEi2FpaCBkYEsizufQ7x/eXe8WcmbCQ6Mbg5bc=;
 b=kj0OzxHh1C6HgG0VOUFD2P/KB6QD9Fo76fbCPqwJZfkuhtc+xwzjIrmY
 aXdXjia5efKQ0YlA5SPfPV6yvq6iMaXMMUxljphP07BjFib7iGBICLMa+
 ODOzsz769bcE9o/xSBa71zm7hb3A2s53vhL0VrpNaYs2+5kj439h9rl3n
 SaAgJL+nFn5EA0TKba8JwY9cYrWj2/ueJZOSftaEb6S9CHkid5PRRKL7y
 rfIFkJxxiVRt5vbWE5cidO/pqnG7xZyK+ndk8fqyX+gNsSzNB2YESUI8Q
 7RAW3UMZSSM/++bc6tltuxnxCVI69fMom3nEhXL19UgGE1zlnzBvQmO8+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="2994012"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; 
   d="scan'208";a="2994012"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 20:37:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; d="scan'208";a="24439612"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2023 20:37:34 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Dec 2023 20:37:33 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Dec 2023 20:37:32 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Dec 2023 20:37:32 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Dec 2023 20:37:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dUqd2bg0yIyInBx4TA/h7c5Ef6YWC8YkJmtGOILrMdLRVqSPxnQqsnky5vlQ1r9CTHogScVLqR1lxEgHc4aXhziXjQw963ygJOgqn79T6Wx7GwO/glRrlBs05dg2GhhH6VmLBAB9cXdBtxkF46lbMQWpD9ST6O5xKx2z5f/ideqPQJrSl8eD9wQcI32M/9brdiBHUBmeDUoXS6+S+2Lg6MivHdiWqeEg+Juz1d5VhVKql1ePM8g6J/vVuQArX0LZP7T0XVIi4U3lA3dN5nqD6LUfbS521PdBmozKsGN1xeqcmtRpnVDqoifVauTHZ8tqkJ9t4B6yipzGdVmINf17lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8kyhfdyYBBRdg6vJ7TW6jGLsgZbR6QmYrDsZMNQnNfE=;
 b=lFE2pFBpV8qWbXKx1INZYxBicqEr9D9YHVXqaSXGa1IWr3YJA7UHMDa7HM3nk/pW2CraGRdxu04bACOOJpzZnnWy9mme6ITdNXmm+s7K5kO6UstRTLpMK99j6Cjg98HwP3sSZDliAhTWzewjsSDbtW5oHop4Jqzi4svdXxvtW/7Y45OMJWff8Xehxag3cYxqU6gDkYGNEMizgJ8UyjZxYPY4PuZ5Y3KRb2Z1wf0YZWL3x6YnDugArGSkP9Xe/LCC6dp5lFKdima3rsFD3LEOLo/S75SRmjRHZakTEUIVu8txgthyOePxxRgONRt/ykhDuyPfCxQohYZXrxWjRmLufA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 MW4PR11MB5797.namprd11.prod.outlook.com (2603:10b6:303:184::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Wed, 20 Dec
 2023 04:37:30 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9%7]) with mapi id 15.20.7113.016; Wed, 20 Dec 2023
 04:37:29 +0000
Date: Tue, 19 Dec 2023 20:37:28 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 12/17] drm/xe/oa: Add OAR support
Message-ID: <ZYJviPprkxJv0rhv@unerlige-ril>
References: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
 <20231208064329.2387604-13-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231208064329.2387604-13-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0250.namprd03.prod.outlook.com
 (2603:10b6:303:b4::15) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|MW4PR11MB5797:EE_
X-MS-Office365-Filtering-Correlation-Id: ad34f20f-9e43-426c-830a-08dc0115600b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XmO/FkeYnjXEoh3iUKgiBs+SWSSlbObr3QtzcuwXPneAeBO+WqhybMP3a5n0qRLcSJ5sMcpN8kwJgwlQ3nzZGJlBkuQSgBIzL2FY+EeD917wZP4VhVjig7QDHlfD+ACUu54o3ai2NutoFdp98sdSG8qaGVOpNkwMiIwJeXwVF1k596/km6+XsasaJIaJ3mFy+qUSGS5u8cga1oUVUMrpqS/e+HBRIuMx7Wv+1MVLPKC05Q+Pq1jn4enaJ+ATWNRUMxbvU+5NyIU2afVorgTxbb+9vELTViyRpy0Vazrty4r2XpEw5GY47fBAIW7XtlnPO9PohYVYLw7njjjOZWx+OA6C4o39MmG+zG+bhFjPG27KgrMWmrLkmN1d9yOCuO9YqumYnQtSh8WBNN3XjKG0njgIm0AH5AbXmc2fJt4xWu2DRjUdWVuOO7iBlGaFG8XCoLrFlscaodhMXgLoIGLkrlrfd+Urw6Aw1J+hFid/F7ZnIrQqWKZITElsw5e6n2DNDs6rWnh8kAI2lTcfB47AQshUyJCCwgAhk9OeLOeMIbZfPBK3Z7RoqCNaXwl/xFT4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(376002)(396003)(346002)(39860400002)(366004)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(66476007)(83380400001)(6512007)(9686003)(6506007)(316002)(4326008)(2906002)(6862004)(30864003)(6486002)(33716001)(478600001)(8676002)(8936002)(41300700001)(5660300002)(6636002)(66556008)(66946007)(86362001)(82960400001)(38100700002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVo3d2dLY2l2QUU0Ty9jNEFrd2kydU56UE9nRlRyUFduTWJWRlFrUk4xeXRH?=
 =?utf-8?B?c0RwT1N3TmxVSDZpRjJQeXRwVXBnNU1JZ1lyTVRIQWw1bU1SQTgwRjE0R2Yw?=
 =?utf-8?B?aGhNbFp6TFJabng4UWxHOHgyTk9ZbGxTM2JlMTIvTlNFcXNpSXNnUkp2eGtu?=
 =?utf-8?B?c291a1dKUWVoaWc0ZlRFN3h0ajk2L3RnN3ZFdUh1NnBpWEwwcWlTc1h1cm1x?=
 =?utf-8?B?QkV4TXQyWFhLMDZ3eE80NkRYdmVxL1pRMnpGKytTdmhzd0lmRnFOcG9OV2Z4?=
 =?utf-8?B?VG9GWGlyV3lVYWx1Tm1ZNnhTUUk0aUE5bzBKdTJkbmZsWUhqcW1FTVUvbFhy?=
 =?utf-8?B?Uy96bTlFSjBBU2ZPTmhucm9RRVJzOWtVRzEzakdMTFQvS3VMQnUxdWJBcTFF?=
 =?utf-8?B?NFFHcU9RNHJ5ZjRkU2ZWYWpWajRHWTVwdkF0M250Z2hqbXBiYzhVTkwvWWlZ?=
 =?utf-8?B?VE9qNmZYM2t1cUlzb1BUSDVBcStWbGlnallnZXdCU0VyRGI0Y1BSU0Eza1Ny?=
 =?utf-8?B?UTVxTkhFcTRnQjJiMWxRMVM2UWZGa3lHbXIzajk3L1BSQ2xkYndPYmYwandw?=
 =?utf-8?B?dmFKSDNuUmhaZEpXUW9WSmRORWdrTlRXdXAvK3ErY1d2NzM3SW1odld5dWpP?=
 =?utf-8?B?cThvdmxYOUM5OU9ucXVSMGwyUkNURDgwQkZkMmh5eUZTL1hmY0l5NUxER3ZN?=
 =?utf-8?B?ekVYc1NZbVJLNjZVL2lIYlVGVHl0VVp4RVRWU2FnSXFOZlBNTlJ4M1liOERs?=
 =?utf-8?B?ZXNTTnVBWFBpT0pRT3N1ajVrc0JYSUNNZ1ZXaThaakFLdkRYdlBoZWdBTVk1?=
 =?utf-8?B?UkxQV3hNTzRnem1lZVQ5WDFpOW5aNHo2em9vaHRFUHd2bWJwMWdCN0lDeGw3?=
 =?utf-8?B?dTQrZWRGU3MzWi9MYjZEZ3hWU3diRytWcm9vT3NDZkRlRjVzRUNMaVRaMzdY?=
 =?utf-8?B?cXZuTjBEZEZnOC9rY3oxa0xZVjRyeDZNaDFJRzJ1cUxBYktJUmdsOEE2Wk1C?=
 =?utf-8?B?QmZ6UmN6QnRIRUxQWW4wV05vN1QxcDRZcW8yVkE4ZTlTVXZ4R3RYNGd5VDJq?=
 =?utf-8?B?SVlqQnZZRUY2L2Q4UDdKYjFPWk9UMGVlTWJzNHgva254b0U5bjRRNUFGOHdm?=
 =?utf-8?B?MzNkOTNSMld2bEhuREpGdzBSRUljOE4wdXViVmw2Tmxob2pQOG5NUmptckxI?=
 =?utf-8?B?WTJDeHVpNllBcm96NmNBc0hnMmY3bCtFV3oyUmxrWVNEUjZ1SWExWEtJTlE0?=
 =?utf-8?B?TllScStud3c3N21KNEtlNEU0V1FwSEx0N3htdmRIKzltaGhrM1lRQ3ZGelpW?=
 =?utf-8?B?SXlNeWtBV2ljTHNuUHlMdm5EckdIQmdZRFVha1o5VVRTZGJad0cyU2RJTE8v?=
 =?utf-8?B?S1EvRW5ncVQwbnQ5QkZHU0QxQjY4czlrUkZidHJERzVVU0xxcEs5RHJvUWwv?=
 =?utf-8?B?SWxvVmFrUFNZQVpTd24wUitNdFE3a3BGYjZhRElCSmdzY0tZeTVwcytIKzdV?=
 =?utf-8?B?aTJKbnZEMk04ZnNLd01yQ1ppMEpCcDg5MUxGWFcvdE5EOTkzYy8vdDUvR3pU?=
 =?utf-8?B?YndtRzBEWHNDN09tMUJteUZVNUNJNTNKWHh0SmMxZGlFQnhZaTJ6eXBqc2ZQ?=
 =?utf-8?B?TFNUaER5OXJGcXBmK1JpYVIxNzVOMjk3MWtEL0dzZWdaWWRJVGdLU3BXT0hC?=
 =?utf-8?B?MUVaZlh2aTRjQ3QyZWx4WHNrMTZLQkJMaWxMMzRMSjVJcC9BSm9lWjgxOENp?=
 =?utf-8?B?cFJ1aWl6YnQyLzZNczZHYkZjeUxGVEQwVmRSU2FJMGJCTUgwanNKMld0WTFk?=
 =?utf-8?B?dUxlZHpTSDZLVnFyY3FSNFgydG9Hb0hSUkUwOXE2d0dySW5CUjJZZlJRSEti?=
 =?utf-8?B?U3J1cG95VytxVkkyWC9FYU1Zbm9zcjRCY2NlZStmMVdFUjNVTnpiaEhJNHpk?=
 =?utf-8?B?VlFTaFZVencvU05EM3BZakEzeGVJREM5KzFWOFpMOG9RODRCaWJKak5Fd3Nm?=
 =?utf-8?B?cmV2MDJ0SU8vYkV1TDhQenpaRTZOdFZRdmtwOUpCMmJPbXVjWG80OHVJeUpF?=
 =?utf-8?B?Q2N2eFFjOXZId3Vkajl2MHlNNk9NVHlGb3B0azFjWWF2RlByM1NaMHhsOFRQ?=
 =?utf-8?B?UXZHdDFiYys2SHZJYmRDMWcyZWVFTmFIOGMyREwxWGRjVkJrcytyM1BjZkg5?=
 =?utf-8?Q?Yg/Y9C4u0XTlxa6H1BC3YFQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad34f20f-9e43-426c-830a-08dc0115600b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 04:37:29.8430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VJ5hbZi0rnfnstrYr5efjGxmmWuWXfvRnHChHA4fugg5FmtnzoRdHKcZjC0VC9FjRND0MBZe2Z6RzALNkxaPVCIJeoKr85A8xCtUMv4mJlw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5797
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Dec 07, 2023 at 10:43:24PM -0800, Ashutosh Dixit wrote:
>Add OAR support to allow userspace to execute MI_REPORT_PERF_COUNT on
>render engines. Configuration batches are used to program the OAR unit, as
>well as modifying the render engine context image of a specified exec queue
>(to have correct register values when that context switches in).
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> .../gpu/drm/xe/instructions/xe_mi_commands.h  |   3 +
> drivers/gpu/drm/xe/regs/xe_engine_regs.h      |   3 +-
> drivers/gpu/drm/xe/xe_lrc.c                   |  11 +-
> drivers/gpu/drm/xe/xe_lrc.h                   |   1 +
> drivers/gpu/drm/xe/xe_oa.c                    | 216 ++++++++++++++++++
> drivers/gpu/drm/xe/xe_oa_types.h              |   4 +
> 6 files changed, 232 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>index 1cfa96167fde3..d333132b021e0 100644
>--- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>@@ -45,6 +45,9 @@
> #define   MI_LRI_MMIO_REMAP_EN		REG_BIT(17)
> #define   MI_LRI_NUM_REGS(x)		XE_INSTR_NUM_DW(2 * (x) + 1)
> #define   MI_LRI_FORCE_POSTED		REG_BIT(12)
>+#define   IS_MI_LRI_CMD(x)		(REG_FIELD_GET(MI_OPCODE, (x)) == \
>+					 REG_FIELD_GET(MI_OPCODE, MI_LOAD_REGISTER_IMM))
>+#define   MI_LRI_LEN(x)			(((x) & 0xff) + 1)
>
> #define MI_FLUSH_DW			__MI_INSTR(0x26)
> #define   MI_FLUSH_DW_STORE_INDEX	REG_BIT(21)
>diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>index 444ff9b83bb1b..76c0938df05f3 100644
>--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>@@ -71,7 +71,8 @@
> #define RING_EXECLIST_STATUS_LO(base)		XE_REG((base) + 0x234)
> #define RING_EXECLIST_STATUS_HI(base)		XE_REG((base) + 0x234 + 4)
>
>-#define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244)
>+#define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244, XE_REG_OPTION_MASKED)
>+#define	  CTX_CTRL_OAC_CONTEXT_ENABLE		REG_BIT(8)
> #define	  CTX_CTRL_INHIBIT_SYN_CTX_SWITCH	REG_BIT(3)
> #define	  CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT	REG_BIT(0)
>
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 17c0eb9e62cfb..8586e1f4a7fbc 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -565,12 +565,18 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
>
> /* Make the magic macros work */
> #define __xe_lrc_pphwsp_offset xe_lrc_pphwsp_offset
>+#define __xe_lrc_regs_offset xe_lrc_regs_offset
>
> #define LRC_SEQNO_PPHWSP_OFFSET 512
> #define LRC_START_SEQNO_PPHWSP_OFFSET (LRC_SEQNO_PPHWSP_OFFSET + 8)
> #define LRC_PARALLEL_PPHWSP_OFFSET 2048
> #define LRC_PPHWSP_SIZE SZ_4K
>
>+u32 xe_lrc_regs_offset(struct xe_lrc *lrc)
>+{
>+	return xe_lrc_pphwsp_offset(lrc) + LRC_PPHWSP_SIZE;
>+}
>+
> static size_t lrc_reg_size(struct xe_device *xe)
> {
> 	if (GRAPHICS_VERx100(xe) >= 1250)
>@@ -602,11 +608,6 @@ static inline u32 __xe_lrc_parallel_offset(struct xe_lrc *lrc)
> 	return xe_lrc_pphwsp_offset(lrc) + LRC_PARALLEL_PPHWSP_OFFSET;
> }
>
>-static inline u32 __xe_lrc_regs_offset(struct xe_lrc *lrc)
>-{
>-	return xe_lrc_pphwsp_offset(lrc) + LRC_PPHWSP_SIZE;
>-}
>-
> #define DECL_MAP_ADDR_HELPERS(elem) \
> static inline struct iosys_map __xe_lrc_##elem##_map(struct xe_lrc *lrc) \
> { \
>diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>index 28b1d3f404d4f..d6d8aa8fb51eb 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.h
>+++ b/drivers/gpu/drm/xe/xe_lrc.h
>@@ -23,6 +23,7 @@ void xe_lrc_finish(struct xe_lrc *lrc);
>
> size_t xe_lrc_size(struct xe_device *xe, enum xe_engine_class class);
> u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
>+u32 xe_lrc_regs_offset(struct xe_lrc *lrc);
>
> void xe_lrc_set_ring_head(struct xe_lrc *lrc, u32 head);
> u32 xe_lrc_ring_head(struct xe_lrc *lrc);
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index 073476721377d..9d653d7722d1a 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -12,7 +12,9 @@
> #include <drm/xe_drm.h>
>
> #include "instructions/xe_mi_commands.h"
>+#include "regs/xe_engine_regs.h"
> #include "regs/xe_gt_regs.h"
>+#include "regs/xe_lrc_layout.h"
> #include "regs/xe_oa_regs.h"
> #include "xe_device.h"
> #include "xe_exec_queue.h"
>@@ -20,6 +22,7 @@
> #include "xe_bo.h"
> #include "xe_gt.h"
> #include "xe_gt_mcr.h"
>+#include "xe_lrc.h"
> #include "xe_mmio.h"
> #include "xe_oa.h"
> #include "xe_sched_job.h"
>@@ -63,6 +66,12 @@ struct xe_oa_config {
> 	struct rcu_head rcu;
> };
>
>+struct flex {
>+	struct xe_reg reg;
>+	u32 offset;
>+	u32 value;
>+};
>+
> struct xe_oa_open_param {
> 	u32 oa_unit_id;
> 	bool sample;
>@@ -640,6 +649,119 @@ static void xe_oa_free_configs(struct xe_oa_stream *stream)
> 		free_oa_config_bo(oa_bo);
> }
>
>+static void xe_oa_store_flex(struct xe_oa_stream *stream, struct xe_lrc *lrc,
>+			     struct xe_bb *bb, const struct flex *flex, u32 count)
>+{
>+	u32 offset = xe_bo_ggtt_addr(lrc->bo);
>+
>+	do {
>+		bb->cs[bb->len++] = MI_STORE_DATA_IMM | BIT(22) /* GGTT */ | 2;
>+		bb->cs[bb->len++] = offset + flex->offset * sizeof(u32);
>+		bb->cs[bb->len++] = 0;
>+		bb->cs[bb->len++] = flex->value;
>+
>+	} while (flex++, --count);
>+}
>+
>+static int xe_oa_modify_context(struct xe_oa_stream *stream, struct xe_lrc *lrc,
>+				const struct flex *flex, u32 count)
>+{
>+	struct xe_bb *bb;
>+	int err;
>+
>+	bb = xe_bb_new(stream->gt, 4 * count + 1, false);
>+	if (IS_ERR(bb)) {
>+		err = PTR_ERR(bb);
>+		goto exit;
>+	}
>+
>+	xe_oa_store_flex(stream, lrc, bb, flex, count);
>+
>+	err = xe_oa_submit_bb(stream, bb);
>+	xe_bb_free(bb, NULL);
>+exit:
>+	return err;
>+}
>+
>+static void xe_oa_load_flex(struct xe_oa_stream *stream, struct xe_bb *bb,
>+			    const struct flex *flex, u32 count)
>+{
>+	XE_WARN_ON(!count || count > 63);
>+
>+	bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(count);
>+
>+	do {
>+		bb->cs[bb->len++] = flex->reg.addr;
>+		bb->cs[bb->len++] = flex->value;
>+
>+	} while (flex++, --count);
>+
>+	bb->cs[bb->len++] = MI_NOOP;
>+}
>+
>+static int xe_oa_modify_self(struct xe_oa_stream *stream,
>+			     const struct flex *flex, u32 count)
>+{
>+	struct xe_bb *bb;
>+	int err;
>+
>+	bb = xe_bb_new(stream->gt, 2 * count + 3, false);
>+	if (IS_ERR(bb)) {
>+		err = PTR_ERR(bb);
>+		goto exit;
>+	}
>+
>+	xe_oa_load_flex(stream, bb, flex, count);
>+
>+	err = xe_oa_submit_bb(stream, bb);
>+	xe_bb_free(bb, NULL);
>+exit:
>+	return err;
>+}
>+
>+#define OAR_OAC_OACONTROL_OFFSET 0x5B0
>+
>+static int xe_oa_configure_oar_context(struct xe_oa_stream *stream, bool enable)
>+{
>+	const struct xe_oa_format *format = stream->oa_buffer.format;
>+	struct xe_lrc *lrc = &stream->exec_q->lrc[0];
>+	u32 regs_offset = xe_lrc_regs_offset(lrc) / sizeof(u32);
>+	u32 oacontrol = __format_to_oactrl(format, OAR_OACONTROL_COUNTER_SEL_MASK) |
>+		(enable ? OAR_OACONTROL_COUNTER_ENABLE : 0);
>+
>+	struct flex regs_context[] = {
>+		{
>+			OACTXCONTROL(stream->hwe->mmio_base),
>+			stream->oa->ctx_oactxctrl_offset[stream->hwe->class] + 1,
>+			enable ? OA_COUNTER_RESUME : 0,
>+		},
>+		{
>+			RING_CONTEXT_CONTROL(stream->hwe->mmio_base),
>+			regs_offset + CTX_CONTEXT_CONTROL,
>+			_MASKED_FIELD(CTX_CTRL_OAC_CONTEXT_ENABLE,
>+				      enable ? CTX_CTRL_OAC_CONTEXT_ENABLE : 0)
>+		},
>+	};
>+	/* Offsets in regs_lri are not used since this configuration is applied using LRI */
>+	struct flex regs_lri[] = {
>+		{
>+			OAR_OACONTROL,
>+			OAR_OAC_OACONTROL_OFFSET + 1,
>+			oacontrol,
>+		},
>+	};
>+	int err;
>+
>+	/* Modify stream hwe context image with regs_context */
>+	err = xe_oa_modify_context(stream, &stream->exec_q->lrc[0],
>+				   regs_context, ARRAY_SIZE(regs_context));
>+	if (err)
>+		return err;
>+
>+	/* Apply regs_lri using LRI */
>+	return xe_oa_modify_self(stream, regs_lri, ARRAY_SIZE(regs_lri));
>+}
>+
> #define HAS_OA_BPC_REPORTING(xe) (GRAPHICS_VERx100(xe) >= 1255)
>
> static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
>@@ -657,6 +779,10 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
> 					  _MASKED_BIT_DISABLE(DISABLE_DOP_GATING));
> 	}
>
>+	/* disable the context save/restore or OAR counters */
>+	if (stream->exec_q)
>+		xe_oa_configure_oar_context(stream, false);
>+
> 	/* Make sure we disable noa to save power. */
> 	xe_mmio_rmw32(stream->gt, RPM_CONFIG1, GT_NOA_ENABLE, 0);
>
>@@ -814,6 +940,7 @@ static u32 oag_report_ctx_switches(const struct xe_oa_stream *stream)
> static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
> {
> 	u32 oa_debug, sqcnt1;
>+	int ret;
>
> 	/*
> 	 * Wa_1508761755:xehpsdv, dg2
>@@ -851,6 +978,12 @@ static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
>
> 	xe_mmio_rmw32(stream->gt, XELPMP_SQCNT1, 0, sqcnt1);
>
>+	if (stream->exec_q) {
>+		ret = xe_oa_configure_oar_context(stream, true);
>+		if (ret)
>+			return ret;
>+	}
>+
> 	return xe_oa_emit_oa_config(stream);
> }
>
>@@ -988,6 +1121,78 @@ static const struct file_operations xe_oa_fops = {
> 	.unlocked_ioctl	= xe_oa_ioctl,
> };
>
>+static bool engine_supports_mi_query(struct xe_hw_engine *hwe)
>+{
>+	return hwe->class == XE_ENGINE_CLASS_RENDER ||
>+		hwe->class == XE_ENGINE_CLASS_COMPUTE;
>+}
>+
>+static bool xe_oa_find_reg_in_lri(u32 *state, u32 reg, u32 *offset, u32 end)
>+{
>+	u32 idx = *offset;
>+	u32 len = min(MI_LRI_LEN(state[idx]) + idx, end);
>+	bool found = false;
>+
>+	idx++;
>+	for (; idx < len; idx += 2) {
>+		if (state[idx] == reg) {
>+			found = true;
>+			break;
>+		}
>+	}
>+
>+	*offset = idx;
>+	return found;
>+}
>+
>+static u32 xe_oa_context_image_offset(struct xe_oa_stream *stream, u32 reg)
>+{
>+	struct xe_lrc *lrc = &stream->exec_q->lrc[0];
>+	u32 len = (xe_lrc_size(stream->oa->xe, stream->hwe->class) +
>+		   lrc->ring.size) / sizeof(u32);
>+	u32 offset = xe_lrc_regs_offset(lrc) / sizeof(u32);
>+	u32 *state = (u32 *)lrc->bo->vmap.vaddr;
>+
>+	if (drm_WARN_ON(&stream->oa->xe->drm, !state))
>+		return U32_MAX;
>+
>+	for (; offset < len; ) {
>+		if (IS_MI_LRI_CMD(state[offset])) {
>+			/*
>+			 * We expect reg-value pairs in MI_LRI command, so
>+			 * MI_LRI_LEN() should be even
>+			 */
>+			drm_WARN_ON(&stream->oa->xe->drm,
>+				    MI_LRI_LEN(state[offset]) & 0x1);
>+
>+			if (xe_oa_find_reg_in_lri(state, reg, &offset, len))
>+				break;
>+		} else {
>+			offset++;
>+		}
>+	}
>+
>+	return offset < len ? offset : U32_MAX;
>+}
>+
>+static int xe_oa_set_ctx_ctrl_offset(struct xe_oa_stream *stream)
>+{
>+	struct xe_reg reg = OACTXCONTROL(stream->hwe->mmio_base);
>+	u32 offset = stream->oa->ctx_oactxctrl_offset[stream->hwe->class];
>+
>+	/* Do this only once. Failure is stored as offset of U32_MAX */
>+	if (offset)
>+		goto exit;
>+
>+	offset = xe_oa_context_image_offset(stream, reg.addr);
>+	stream->oa->ctx_oactxctrl_offset[stream->hwe->class] = offset;
>+
>+	drm_dbg(&stream->oa->xe->drm, "%s oa ctx control at 0x%08x dword offset\n",
>+		stream->hwe->name, offset);
>+exit:
>+	return offset && offset != U32_MAX ? 0 : -ENODEV;
>+}
>+
> static int xe_oa_stream_init(struct xe_oa_stream *stream,
> 			     struct xe_oa_open_param *param)
> {
>@@ -1008,6 +1213,17 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
> 	stream->periodic = param->period_exponent > 0;
> 	stream->period_exponent = param->period_exponent;
>
>+	if (stream->exec_q && engine_supports_mi_query(stream->hwe)) {
>+		/* If we don't find the context offset, just return error */
>+		ret = xe_oa_set_ctx_ctrl_offset(stream);
>+		if (ret) {
>+			drm_err(&stream->oa->xe->drm,
>+				"xe_oa_set_ctx_ctrl_offset failed for %s\n",
>+				stream->hwe->name);
>+			goto exit;
>+		}
>+	}
>+
> 	stream->oa_config = xe_oa_get_oa_config(stream->oa, param->metric_set);
> 	if (!stream->oa_config) {
> 		drm_dbg(&stream->oa->xe->drm, "Invalid OA config id=%i\n", param->metric_set);
>diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
>index 05047226af8d1..bcd8d249faaec 100644
>--- a/drivers/gpu/drm/xe/xe_oa_types.h
>+++ b/drivers/gpu/drm/xe/xe_oa_types.h
>@@ -13,6 +13,7 @@
>
> #include <drm/xe_drm.h>
> #include "regs/xe_reg_defs.h"
>+#include "xe_hw_engine_types.h"
>
> #define XE_OA_BUFFER_SIZE SZ_16M
>
>@@ -132,6 +133,9 @@ struct xe_oa {
> 	/** @metrics_idr: List of dynamic configurations (struct xe_oa_config) */
> 	struct idr metrics_idr;
>
>+	/** @ctx_oactxctrl_offset: offset of OACTXCONTROL register in context image */
>+	u32 ctx_oactxctrl_offset[XE_ENGINE_CLASS_MAX];
>+
> 	/** @oa_formats: tracks all OA formats across platforms */
> 	const struct xe_oa_format *oa_formats;
>
>-- 
>2.41.0
>
