Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1CB5C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 00:24:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A1A310E060;
	Thu,  7 Dec 2023 00:24:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F63210E060
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 00:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701908661; x=1733444661;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kwinzxdm5jX1oNBZSnhvKpAEyx12tICxwYcNDWo0fmk=;
 b=k+g/7jqEq/FR8gHZ3E99Mfmu9/bQUe6mragkjn6E2cebocnhMfqcBmvX
 XGdaH7PLckwX3X0Sb4F+TahDDnuytUwE8vbVD3LojQbeWwBacpKQPaGFe
 sErjbDYRFQjvzAkg7IiYkxdUxCYwQM6//zEM7fdh4covJapSxaXP+WSls
 bb4+U/xSeM++gkp1RGHaoEZX2n/5oHMr4rcu7m/+YCZ86spoXBaagk5If
 9ppbNXP5BUIOiCmPPkq2ZLo+igVsA7D+Uwaes/AnXMqg4UfWm1zSrQwc8
 1EwxAVArhtkrQCbFzprbka5YpeXU3J7jxI3+SOwFZXMeSYj/QFvAnlV9A w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="15698671"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="15698671"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 16:24:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="800530764"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="800530764"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 16:24:20 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 16:24:20 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 16:24:19 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 16:24:19 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 16:23:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IrBTARI5w6LXf+Ce2Zwpdr0yxsI5KdgO2Z3XaQrXzJwVOg9pOzKykxoDJFxMvvuEVFJCIV+9jQP+FXZFZAsJwhznY3vLCQbnVO2AdPzrSbzPZBOSROaq6xlGgIGyoepwzsrvv23RY7gT/z0rKLfJszsPpfSeSrhcFNSD2hdb5D+woTdF0bqjOn9EkT+4v/PFj+Xg0evoN80UbkVdU0OKteD5ycL5yfvtWfoXzv+0EuCU1cjtd3Y0oYAbO4V3IIIYtlOjNMx4CQJvGpwgv5pjPbLqLcX6Q1ap/N0FfUZY2krcIQQ3VjgDUE5oYlsQLk2IofhNjkFHRevVoS0joQ0Pfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NcnPYfPjZTdkKzu6FUOBhZFPpHorG9gbcbT8BfFJUHo=;
 b=iaemzW+tjz+6A08mUvWwcOwgjH8kKzhMlNh+vkqjmFfmoO0F+TWFnLTayeL3k8BfKHgifgbq3P7khcOmL+0OpDC8c9xIZjpuAYdazJ+t0jL9lg8zJ1Qu9dCeGJdhxAg/jyOywwlX92+MZtjUx1H5SHPwqakJr1pfOXF1VWDWnRLsRuK0hYPla4a7TRLXYp9Rx9+QGbaXj/zOGIfT9vm4/f83hlRIOhQCTd/VMDuwVIqh5JEPrGV9ByQtXp28l+2a0H3I/d2XOh2zmePajaBG49jTqEZHwSlavDyI3xrOSylvluOfr4oypo9yUGcIqBf4OlsGKZ5pvx3I4oLKB8QZ6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5365.namprd11.prod.outlook.com (2603:10b6:208:308::18)
 by BN9PR11MB5226.namprd11.prod.outlook.com (2603:10b6:408:133::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Thu, 7 Dec
 2023 00:23:48 +0000
Received: from BL1PR11MB5365.namprd11.prod.outlook.com
 ([fe80::a5ce:4516:92b4:43ae]) by BL1PR11MB5365.namprd11.prod.outlook.com
 ([fe80::a5ce:4516:92b4:43ae%6]) with mapi id 15.20.7068.025; Thu, 7 Dec 2023
 00:23:48 +0000
Date: Thu, 7 Dec 2023 01:23:27 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <2roji3l3lacipnthgtqdqe2nip22b2wrwypujye3h4ucseqkp6@hdb3ws6f2drp>
References: <20231128151507.1015-1-michal.wajdeczko@intel.com>
 <20231128151507.1015-6-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231128151507.1015-6-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BE1P281CA0295.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8a::18) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5365:EE_|BN9PR11MB5226:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d726b2a-6a0f-462b-1aaf-08dbf6babe8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mbC1rBtMkMv/Uv720/rrq6xtIE/HHU8CcsarK4hzcyPw+sZAsIl4wCFq7cN0siCmrlnd+TMgCaU7LIyA+oJY+wAgGXQrFH743X/qbhWC2o+RBdB1Gvf1y0u9Ejjj7d34pmUZyg9xS8g4wbIlbvqx14G3a9wTIw3LeZD7jrBQTsokI65wgsvz5hP/w5UHDzGW29w+/MSgKqNd1lMZ9i4N7MbwbUnBE30v1P4o/UmPPm0DeXs8qpCMhzJO39cpSotRD+6uQGMSGalOoXYCQ0A6R7mB8zHs5XVvD55YKw5owgkrNtEYzmsVjkmSrKGfTCcQ8E1vHItSaPKO2C63pjJsru6zLBrPQoSX2w7w+8Hcv0/iuO4que3Z5piglKwpjR1ew36IgLSaats5sQVVxtX4Rtdaln1+rOpPeaT0UCIoNktTzwKlo2Yze/r3U0OVfiQpJEMvUf4NA4SdVx8wyF4pKInrxsRBcrH+ED7P9CFDzKi2EawB/BHWxHdBBc7VvHtPx8aySOxDlrSjHRy1OUYmkBLf22KAwVcPzvDq70efoQ5RmifmdWwlj5i2KazmMSby
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5365.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(366004)(346002)(39860400002)(376002)(396003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(38100700002)(2906002)(33716001)(4744005)(26005)(86362001)(82960400001)(5660300002)(6512007)(6506007)(6666004)(8676002)(6862004)(8936002)(4326008)(9686003)(41300700001)(316002)(6636002)(66946007)(478600001)(66556008)(66476007)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEVIZDE4NHhHRDB4R1pmREVnTXFlcDh4RXU4V0JDWW9KM0R1TkFmYmlHSnU5?=
 =?utf-8?B?RmlOSys3UURQV1RyUGJQRDNLUG15ZUd4MS9yWlBtWXduQUorU3FKaytENHpT?=
 =?utf-8?B?RlZIb0xqZGg4RWFrVm1xUG80cEhreExlTGl2YXVndHpYV2o5d3JQN1hDVkJE?=
 =?utf-8?B?VFVWbnRIbEV3SXVQV2ZhdDZKWnl1U3lZOUh3OGl1eUMwajhLL2tVUi9qd0Zx?=
 =?utf-8?B?UENCb2xQei8yckJxUHBVblRpK2M3VkhDa2o4ak1XVjhYZmpyZC9SYnh1Y2xE?=
 =?utf-8?B?b3RrL2MyZzBjdTRNd0hVaTZIK1cvSEZ4bEJ2TFF5UTFtZTIvSzJiWWNOTnVM?=
 =?utf-8?B?T3BENXJCZHRWdFc3MU1HZXR0amhibVVMamJVcWRyYkIwMlVSWlVOWmlyL3Jj?=
 =?utf-8?B?VzF3SXFFQzAzcFNKMTlJYmhWcTk1Zk5aN0VEeDJ4WVJ5ODRCc0FJeTY1Y0NV?=
 =?utf-8?B?dC9rdVBFaVB0Tmh5SGt6MWpTMkkrbHQvbndQSm1MTGQ1SFdyNVlIUDdHOVJT?=
 =?utf-8?B?VCtXU0g0d1g5UTcyUDVzTDlsbXdGdW0zNnVGVmlEcE4wcVM1VGRkaGYvSWpq?=
 =?utf-8?B?L04zeEV6eFIxZmxTaG1CaFZ1V2FjM2pnSUhyOHZ5WDloNEYwZmRCbkFYTE5U?=
 =?utf-8?B?WTJqS0gyRkx3MmJPZnF6VU1MOVZNRFdySXY1TmNBK1JnQ0orQlVzNFdGb0pE?=
 =?utf-8?B?Y1JBZEU3WWxmSHo0SkdWQlR0WGtsS0RGaTF3cGVKUlQ2ckZFRHV1K0gxeWVF?=
 =?utf-8?B?d0RNSTBQbDhmWFdxVEVQeTgrUEQ4RHArbmhiVTVhUHRENUxHQkQ3ZVRjVkhN?=
 =?utf-8?B?NE5UUlVnU0txajROV2VRenRSYVRNWnZOaXR4TXFIOHVLZFpRTWJCVVhLWllU?=
 =?utf-8?B?VWhZbVlXVmY2a0t2Zk1zN1F3N0YwZTNtcEtxSGtJOUJpT1NCRmhCcVU3OWRR?=
 =?utf-8?B?VWhtYTVaMzVXUDBNUmVDWDJXNnRaQjFRc3ZTWStaczZnWks3NGRzNHg3SmM1?=
 =?utf-8?B?a01ZbXk5Q2Z1bkQ1cCtBaXBTU2trdEpFanBTSUUwRXBIZlZsM2lDT05RMHc3?=
 =?utf-8?B?ZjhVZ0NMSXBiRFRiOEZBUi9scGlZQjc3V29xNG95ZjFWMVk3dTdOMXJFVnZp?=
 =?utf-8?B?ZFNpSXBMVzBHVm1zWUI0bHl6ekh5Z2UvVGc3U3RHSFVrSXhIVjQyWFFOUjBw?=
 =?utf-8?B?K3BWSE91TkZFTmFnYzdUa0VoMjVISE5LbUMzTHZUeENIWHl3VENMOGtRaFRx?=
 =?utf-8?B?REloa1FMbGl5TE80N01sbkwvTVRycEZwNEVleUtWVTN4ZEdFWWxCTmpLQzlD?=
 =?utf-8?B?L1JUUitmZjBpdUpDVXhDb0FSNVZSOUV1UFV2ZjdLa1VIdmxzOVZnN2oybUNz?=
 =?utf-8?B?WWRZeUI0VXNlRlZMSDZJTFltRVFxVDlkSkc3Ty9KeGVGRjAvWEtWYlYrOHZL?=
 =?utf-8?B?SUYxVEt5Tlg0MTR2cDRIb0ZqVkFkbklWQ05tSUluaTdFWjF3NWxiZ0ZaNmNB?=
 =?utf-8?B?cWhZRVFHN1plYlhrRFhVRVArVStqTXRWZDRqOTdESHRuaGc3eVpBekgrN1c1?=
 =?utf-8?B?cnhEdHV4K0xYZFowUUR4dERPL2dHdlFRYlRGVFZRZkltQVZsYlZrSk1TbTR6?=
 =?utf-8?B?c2Zxd1J6WDJ3a0dhRDA1K1VtUmVQZytyenhIUGhDS1ovbFRXdzBXRGFRcHE3?=
 =?utf-8?B?VlQ0dDJERTJvK2ZNYjNoYjQ0UGJZNmtCajE5OFdRZVFXOXduVzV5UnFqeHRh?=
 =?utf-8?B?Z0o0T1MrL1FNTHVxWmRmOVhaa1FwWktabmJZWjVFTDRkaXhLVG1NZVFJYVVH?=
 =?utf-8?B?S283R1FjMkdhM0lDWkMvcWN4bzJQeWlIMlY3UnNZakI4b3hZd0lNZ3JxcU1B?=
 =?utf-8?B?RFBDaXQvT2ZuYlVCaC9jeWQwWnN3WHhIVkdocjhqWldSdklONktMQW9Ed2d0?=
 =?utf-8?B?dTgzdzc5UDNGajd2VVZqRHRaVFJjZWlCSjg0NU5SM05peXg4QTlMTnUvcXVq?=
 =?utf-8?B?UDBJMzJUN1V4Z0IvaW9oZUtvZkRhNDZjRGFTM25QUzE2emZvdHlVVlJkc3pP?=
 =?utf-8?B?a1lDUXB5VXBZdU9TTWR4R0xORWF4YWFiejlURU84WGNUR2pGclVBNHhHRmUy?=
 =?utf-8?B?UHdmZTN1ZEltamgzOXFFelMwQStVQ05lWGJUeXI0K0xlNnNoM09rL1RMUFAy?=
 =?utf-8?B?L1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d726b2a-6a0f-462b-1aaf-08dbf6babe8b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 00:23:48.4987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WVlGyxtkwljIpX97w+YL85WxoiYuyLsErhcn5QwUHQ4VdI9NPBwSjO6HC+yhrYmdBrhwJCqKvcdFuMZzXjZkJrsf1A39+BYDd2xMWNViU8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5226
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 5/5] drm/xe/kunit: Add test for LMTT
 operations
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

On Tue, Nov 28, 2023 at 04:15:07PM +0100, Michal Wajdeczko wrote:
> The LMTT variants are abstracted with xe_lmtt_ops. Make sure that
> both 2L and ML ops implementations are correct.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

-Michał

> ---
>  drivers/gpu/drm/xe/tests/xe_lmtt_test.c | 73 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_lmtt.c            |  4 ++
>  2 files changed, 77 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_lmtt_test.c
