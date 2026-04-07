Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC80BEDB7FE
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 10:58:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A39DC10E3EA;
	Tue,  7 Apr 2026 10:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ihb2Bm7Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DCA810E3EA
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 10:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775559533; x=1807095533;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=j8foWx7Y0ycvsBtInMlq9b6FrB/hhzddKo8LqLV5upU=;
 b=ihb2Bm7QsZIr7uV7nCpo0yowTlouNDQdFYm9jZQor1RQKhbQTEsDH58b
 4jKxg7cN29HDSaAJU0aAJZdcV2gV1W/PNA0Kf3awog6u9ntovNVzH/q+E
 VTFOMTzmYX6CiTPzZQgEjEJYeYf4u59GWDeqB3yRIh2MZasVxAR9xu9tU
 qEKu7Ge2SqgB1qR4pCIlrT7AwHfjAF+rbekEM+mEgboO113dAI4mqttRZ
 fXJkau62/VzPZY1pjjtRFyO8tPnIhbZAWjhqb4Icr2Qxny9ppBMIPJmNi
 +ZHRumSb64aGqnxuD144PFypYbGb8x8Lbah6Xysy/44oa5hlz/YrSx05q g==;
X-CSE-ConnectionGUID: whXWWYP2TsCzULncjRuFkw==
X-CSE-MsgGUID: xBqQoGQoSuGAR1syPufSaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="86811260"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="86811260"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 03:58:53 -0700
X-CSE-ConnectionGUID: dl8uYR7NRvCPbXIwiCVPEg==
X-CSE-MsgGUID: 3f71pyPHS2iQ+n0XgC2GeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="225382947"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 03:58:52 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 03:58:52 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 03:58:52 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.0) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 03:58:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g6GTXOttqOVXEBzkYckZpZipQx6OJUJCLwinP8ssYhCT+E+N9ennXVtRI9JQOCSDwYzoljrRNg8dMo7OFqvyNHH+NEZ1nIuNaw0cskgVsFLvovPbfqDN2cjgcPZ/b1FXDIFULeKpxvagHRccNEZD1OeRA2DQiAsiKAajNn5+gyCdnjcKtX+kjNqc46nqNAJ16vrZuYZVMVWDQNbJh9efmXCdNMsUZNaXkV7IhCQT4WHV9htKpmxg1ZF4GSd98EbvMuf+Tj/BlbHlkjwl76LpMwEEDZ3Vtmwq/ZbWAu4fnCz+fECtWVd+NGZ0MpNBKkNv2sdGdmjA+DsqmD25JRumVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FApfUbAuIeEyN130Q1NFFc+F8IwZlGgytSftOQXES7k=;
 b=BdIdLLFZrqyUuI8+eBeN1xH10oFUHQWGuxtV5ZOMufyYgCZdXq9Rb9vXT4eAJAIylZN3qD+krWS08Qp1jlZjy37OXffAStJS4Thzm/WIEYbz4Pnaexk3T0+X+6Rsx0SMGyVyvoYTHPDqgyQRisE6nu2KReo1Ll7TeU7ivmP2FwqKO+MXgBCPpMxb8+cMh1IMHLMnrr7/Q6IiGqKrDeN6l0IWLPlM5Y/2QWxCd44N26oHz6gNW4pESv1v9Or7nQALjCueZre9B1L+iYCEa3tK3g0uEmdjVilClg5RFHswUqzgMLm7AzvHOtxPD9B2UMoGLyxCXtF/BBZGB4pzJ2/Efw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CHXPR11MB9649.namprd11.prod.outlook.com (2603:10b6:610:2fb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.38; Tue, 7 Apr
 2026 10:58:50 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9769.018; Tue, 7 Apr 2026
 10:58:50 +0000
Message-ID: <3fc89f31-9ee0-4ae6-bf20-98d1f1fbc519@intel.com>
Date: Tue, 7 Apr 2026 12:58:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/3] drm/xe/tests: Fix pf_set_admin_mode() after
 sriov.pf.admin_only removal
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260406114515.1043145-5-satyanarayana.k.v.p@intel.com>
 <20260406114515.1043145-8-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260406114515.1043145-8-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0312.eurprd07.prod.outlook.com
 (2603:10a6:800:130::40) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CHXPR11MB9649:EE_
X-MS-Office365-Filtering-Correlation-Id: c2d54cca-5cbf-4131-aa52-08de9494a64a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: LF9mARdOSWq6h+TSHzLN2kcl4j7L7lYLAVicD10bebRqxoEhhIFBQjYHX7lEpOL+obTe3pt6k5HLIaKGPcmq3hnDVngRPA1TUT8PPfWij2E7ht7xCifyeP/VV5L+Y1EN0clJmRM5PhiEBaWQhjKlDAvh9n5ucigDm8HZrN7IE/VMaJYmbpy56jXcxjFchb7k3NwjWAYRPOR32x9f57s16EQoPhMj7GCxzxmvB0fcYGKLzqMiKN05zNcc97u+arwjjobckcUuAiBlO3SgtC4LHZd/fzxBPrV/sGYy2fUY1416rHtGuYOHFdtsWoHfblNetUBoHopkGlwfk1dHmijbPP3NS+e/IEi8ugY6YmIwhxdKzXDTKWxi8+GrXWZ3ZZaojQGEAguk/nhQsvowPD4datz+6hCFNsYNCVqGRwJ5Hm3chUr8czWcmErHyTMWskCFYWzsBQ7KPy3vj4+F1Gikc4GnFgeFTgqOGgpRat+2Apn8Sy3yLsGm/zDNqEadsRFZ1emWQd87FtH254E9VXOuV9AEJeviwCvX1fHe09ckMLBdhaD1lpTb+BYeFs0OgIuOWdTiroEC2B3FgKcoYNa4Mzb2AiI0PW/k/oSfTIvOTSB/k3OnuDsu6L5CyvHJOYdt7tJifOuyA6ofxLtc2OjoI7bNCbdwbCKvB0UIYUeDzaePJpXsSajWaR5qKKJYul0zzinVD82V0Z4jJFYnQ08BGdKBlwvwUC5WVp5+Bq9QjCg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmM1Mk93SzRVbVhyYVN6MzlrcWR1VDdEcFNnRlBlSEsyOVc0TUlna2JEbXVU?=
 =?utf-8?B?UWNaVjV4bHUzY2p4STZ6NkwxaFpFdnRUc3c2SkE3R2VDQU9teG9YbjRvM2Zk?=
 =?utf-8?B?akpGbXNJNW1iR09sYXErVWF1YWtvZnJsZlU3RWRWblVabnl0ZUJxaHlVNzAy?=
 =?utf-8?B?cGo2MDlQK3k2QWs0NS9HR205c1JMRHdaVjJ0cUp2L2Q5aGVJcTZHRkFjZU1H?=
 =?utf-8?B?S1Y0cHNjaThncDZiN3d5dXN3MEFxaWIzL2cxc29idmcycjRMQ0hnM2g3eXpp?=
 =?utf-8?B?OW93NWloanZEbVRkRmo1Tzk3aVo3ekZyZ01zcE9USHpORFVxUC9yS3Bvd2M0?=
 =?utf-8?B?RlZwYVRqcytKM3l2cVMyTkxUY2pmUDlDbjFsNG4rdTA3SFpJdVZhSm1Kd1Yy?=
 =?utf-8?B?VzNkdHpIVENIcXdlK1BuMXVQd25iQ2xCQ3pVUFFxaFloSHNiNktZUk1mODBq?=
 =?utf-8?B?bmJlQXNBY3c1Z3NweDUvRE9oYVZ3VXNsVlMvczljd3hqblJwUTFORkpwVDlt?=
 =?utf-8?B?OEorN2U5S0ZYNGNOZnJDRXd1ZE40UGt2Y1JVTDdkZloybCttWHAvZW5DTWVH?=
 =?utf-8?B?VzU0SVQwNi9QRi8rN2VMVzV2WFVWR2hOWGNPbDgvbk1DMVhCWmlqZTV5RVJi?=
 =?utf-8?B?TkYyTGJydnVTTlFuRHF5MHlJcGRpWkZTajJNL0pmM2dsZlZiTnduWElWYzc5?=
 =?utf-8?B?eEo1bG5uL3JoWUlxbTg2SnhWMit0Y0Vxbm5SN0I0U3p6a1lLdmpqcVRyME45?=
 =?utf-8?B?TkJ2cXBwWFZPSFllQTh4anhKVEVFSkUvVnFaK1pES1VwaG9TR1ZHcE9MaGZG?=
 =?utf-8?B?ZHVWL0VRQnNCN3FQdkQwZXdKRzEvV1dJc0NOYkRqVkVGRFJhUW1yL3E1VUFB?=
 =?utf-8?B?V2xNSnBqMDlhdUpwM3c2RVVJbktzWDFyMFJCMXB5K0c0alpDU2VTaGwydUlJ?=
 =?utf-8?B?T3A4MmgySWhLbHBwZUFrN1ZKdkM3Yncva1lUT1B3T2lOc3pndkpxTHRxQ0di?=
 =?utf-8?B?bjhmWGdsMXg1cDlnaUllajU3M0FQZ1VKRGRDa3BYQVYzSjV6MVZkZXVLSzRo?=
 =?utf-8?B?L25SblVYdzFXbGZrWGRyUk1IWVZWR0Rud0pHeGxLZkwxMUFBOWxSUHBTbFFJ?=
 =?utf-8?B?RGZxSVlvUlBRUmlONDZlOXNXTm9aaUtkTXZjNXUzK0FuN1RDNjVPTy8wYkg0?=
 =?utf-8?B?d0V6bHp0YmRkOG0vZm12L0x1OVFuNWFneDRnMWVTK2FEOHIxUEV2WGRweUJY?=
 =?utf-8?B?S09kMFc4R0Y2c2cxUGRUWUNsckVwZndBS0tibTdsUTdTa0tMV0RNSktZbGlG?=
 =?utf-8?B?U0Z4ZVB1VXBtS0Flc095TVNPc2c0Qmx2V01Pdkw5cFBSenlhQ1VVcE9CVUh4?=
 =?utf-8?B?NWFsZEtNVitVZnBISGU4ODJYNTRLbDBFYThDV1AxMFMvaGR2cFkxYjhsRHNs?=
 =?utf-8?B?NmFlcGlUcTRLb042SWFmazRuYUM0bzZoaEIzTnhLZFBNcm56WnMwSFZLTUZa?=
 =?utf-8?B?OUYrdXJNTDlTK2EwcERuT0Q1aGRJbGgrdmY5YXFqdzJ6UVMxbXVvc1YyYXRM?=
 =?utf-8?B?c2RvdHZoV1F0QWdKR1M0K1dlbHlRUXRYTkowMFhRQ3ZCeEpldGNHem5tSjcy?=
 =?utf-8?B?d2p6cHd2VkY5V3M2SzNpT0RzdGhXUlFibURNcyttcnpGSGZxUld4Yy80amxx?=
 =?utf-8?B?Z1ljRzFtSG9uY3JYVXRSTHV0alN1MDFQTnoybUhQS252Yk42VmxlMVNrK0tz?=
 =?utf-8?B?L0djLzVvbHZMRUF3SGpsWWxuaGQ3Mkh6SlEza1Q0WEwxVW12SkU4Tm1SUi9K?=
 =?utf-8?B?OVdLaVBvUUIzSWNiOTIrQUlLSHhaOHZqQkh0YmRDOEJhU2Vkc1RpSTg4azJC?=
 =?utf-8?B?amFseG16dW53aHVMWlFDQ05HWFpVeFdWT3Y5V0k0eEtpWUZDSmVTdTVRam0v?=
 =?utf-8?B?L09IcmRwQUhIU0FOMFl0Rlh5Skw2ZDMrMWtvaCtLRXorTC9DaC9BS0s1RGFD?=
 =?utf-8?B?WGFreUQzcmdZZWwwRG5INGU3ZW1BZkk4R203bk5qNmRWVHdKaEZZTHlPVG9p?=
 =?utf-8?B?WnpWNHVMampGOVB3UTZ1NURHc3BubWlRUVRmTVMxdlduUi82ejdPN0w1ZVpl?=
 =?utf-8?B?MDdZZFliNFV0b2ZOdWYyeEJGdWxwZmVvV2J0ZHNITnhka0lhNGkzdy9qVUpi?=
 =?utf-8?B?d1h3S3hMdVFiRExrOU1mT1hPZzBvUmMvS1ErQmF0bTAwNStKUXk5Zmh5UFVw?=
 =?utf-8?B?TmdQQ2ZKRVZQTUp3YWtiRnJPOXRXV2JqTzkvbHhKU3k1T3hmei9kc2o3cmFS?=
 =?utf-8?B?UEpiclJWL3RXQzRQYSs0LzNHWmRLN2RhRDQvK0tiVkZTU05XbGZoTjhqWEtp?=
 =?utf-8?Q?xYPKfgThqatL8Pes=3D?=
X-Exchange-RoutingPolicyChecked: hr5QWHHSv+ipJWdoSqONjvWzIkYziBZjvuC/cvXSTRyEwsXk/lNyNe5v9NF0z+ShUxI3V+nwj/P5kMv88FiajXCTF73PNGqDDolTeg3j468fLLHY5U/DoSEhvj2adO31cnT1f9PvvJYma/DZnAt1Iib6UKqPWxDZfU+teNeIUvdnB6QTlDdjKmEQsQOTR0IUELpNTyMem8TrjDP+3EZFzSsPlDhgcSuNW8TY+H+avY3qEhY6v3+MHiB4fKbap6FsDQrAD/blUeQohdjTjg6sCO/Q5SgdLE8R/8T+MDxFZ7p5FzvH2lAZyeBM+XMpBgknbPAU7d+EkVI/9ZAUS/dhlw==
X-MS-Exchange-CrossTenant-Network-Message-Id: c2d54cca-5cbf-4131-aa52-08de9494a64a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 10:58:50.0048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GWbS1sHtoyJ9miaGI93Va4WHg/BTnUKkdDI+DcsexctajVMQ2UZE/pivqKxp9qrSr/4EqZKeEGJwsSLrE35E41RCEQ865eSKZfdyJAVT+8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHXPR11MB9649
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



On 4/6/2026 1:45 PM, Satyanarayana K V P wrote:
> Admin-only mode is now derived from xe_device_is_admin_only(), which
> checks whether the device was registered under the admin-only DRM driver
> instance or not.
> 
> Update the kunit test to have a stub function to mimic the functionality
> of xe_device_is_admin_only().
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> ---
> V8 -> V9:
> - New commit.
> ---
>  .../drm/xe/tests/xe_gt_sriov_pf_config_kunit.c    | 15 +++++++++++++--
>  drivers/gpu/drm/xe/xe_device.c                    |  2 ++
>  2 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> index efa8963ec248..7b3c5733cede 100644
> --- a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> +++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> @@ -7,16 +7,23 @@
>  #include <kunit/test.h>
>  #include <kunit/test-bug.h>
>  
> +#include "xe_device.h"
>  #include "xe_kunit_helpers.h"
>  #include "xe_pci_test.h"
>  
>  #define TEST_MAX_VFS	63
>  #define TEST_VRAM	0x7a800000ull	/* random size that works on 32-bit */
>  
> +static bool sriov_pf_admin_only;

instead static bool you may just provide two stubs, one that returns
always true and the other that returns false and active the one that
matches test expectations

> +
> +static bool xe_device_is_admin_only_stub(const struct xe_device *xe)
> +{
> +	return sriov_pf_admin_only;
> +}
> +
>  static void pf_set_admin_mode(struct xe_device *xe, bool enable)
>  {
> -	/* should match logic of xe_sriov_pf_admin_only() */
> -	xe->sriov.pf.admin_only = enable;

hmm, so actually kunit would be broken after patch 2/3 until now
you need to reorder patches 2<->3 to avoid that

> +	sriov_pf_admin_only = enable;
>  	KUNIT_EXPECT_EQ(kunit_get_current_test(), enable, xe_sriov_pf_admin_only(xe));
>  }
>  
> @@ -82,6 +89,10 @@ static int pf_gt_config_test_init(struct kunit *test)
>  	xe->sriov.pf.driver_max_vfs = TEST_MAX_VFS;
>  	KUNIT_ASSERT_EQ(test, xe_sriov_pf_get_totalvfs(xe), 63);
>  
> +	sriov_pf_admin_only = false;
> +	kunit_activate_static_stub(test, xe_device_is_admin_only,
> +				   xe_device_is_admin_only_stub);

move stub activation to pf_set_admin_mode helper

> +
>  	pf_set_admin_mode(xe, false);
>  	KUNIT_ASSERT_EQ(test, xe_sriov_init(xe), 0);
>  
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index b70fa3af6d15..d2981e7c0d91 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -17,6 +17,7 @@
>  #include <drm/drm_managed.h>
>  #include <drm/drm_pagemap_util.h>
>  #include <drm/drm_print.h>
> +#include <kunit/static_stub.h>
>  #include <uapi/drm/xe_drm.h>
>  
>  #include "display/xe_display.h"
> @@ -444,6 +445,7 @@ static struct drm_driver admin_only_driver = {
>   */
>  bool xe_device_is_admin_only(const struct xe_device *xe)
>  {
> +	KUNIT_STATIC_STUB_REDIRECT(xe_device_is_admin_only, xe);
>  	return xe->drm.driver == &admin_only_driver;
>  }
>  

