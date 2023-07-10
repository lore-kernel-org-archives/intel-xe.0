Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8996AEB64D9
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jul 2023 09:51:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B2410E225;
	Mon, 10 Jul 2023 09:51:14 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1589410E225
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jul 2023 09:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688982672; x=1720518672;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4PRfX7eGk4TrCPPAuVOuRqB3FJRy4RRDCnOYn/x919I=;
 b=Jik56ert2dh/g/KORtxwz7wcEVHhcrbbLEXZ48KY7Z/J6OyGCvw0gIBc
 ZhyIqQyw/xKaxask5JvJNA+svewlMXRmCUIig2dmRQhtSx9ReQSkqBeEX
 ZhhLVVGXjdoKfOwg/G3xiu5ousYqSzrxDV/g66MOe0r4sPslI8DjrpxlV
 XrUKSCpOii/mCV2BWizQmWMMvWmP3/0Ph5/dMgFm1hve6rJP239BmExh6
 9l76b8Z/ilJ/C5HlG5Gf51EcrY0ipK+bglxs4SdarNG+mEb0d5HyQW9tC
 CsHVLf5JtJ6wpLl57hcfYDAK82w3Ua2chkvHUGWgISWCcjVTExUv0Rdol g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="349102825"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="349102825"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 02:51:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="1051301613"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="1051301613"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 10 Jul 2023 02:51:09 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 10 Jul 2023 02:51:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 10 Jul 2023 02:51:09 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 10 Jul 2023 02:50:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XOSHeYBTvaVba3jqKq6VGoLbHC+OUTw4W2O2cjntlTlrFZYGY7P7midTXvywFd5cIZk1Gv4dUum3shv/WmNLFnMW52prBxAljM0FNG3h/VMdUh1hZ9Biy7h8136mm13R/g1h7n3zzgH5kSJ+GuyjFnZ9VLdhjUQWXsPtqvrYaCh7ldCM0WbFeQUU3VrvRuExLbWk/mPy4AH0D1ihqXDM9RP88fHcIOER0mOaQ2AFHsKn04MdmnCPNCHJDelyyxWqWIqAgWAqRtUP0T2ajcfe+ZCLJ55jK+HW8fSklV+Jsm8AhOSz8f/I+mLPXW9sy2kICd/zF9gObQP+XbEDfJnWzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RGQPRWR3aahMPRNLv1cDcxY32zRSvSBOAcqi2QJfypA=;
 b=Mx91AQb+jOEbgnIUiZuvAPD4nMIWsyW4nL8v6L+aJ6zkTAYeeNnZFDYnIdeDo1GXj6xqI+lOKetz8UJe6fgyzSSsp9D94Wb0+kieBYBV5jonWllGZ/bJvMYW62rFNUB1ugTdAMlR4VEA6PYKTRjaBIMHOz8mV2uFfFoOxWiQIpBaLMCPeslKHHwvQf18fHCEQcYJLW/iVRNu7XVeKbu84cw2KEIbWYu4HgxKpIZEbzI1a9l9YuOuzhgEUr8cRhsBm3w0Kva1P2ix6vQwURAzcnjRgfpvm8l+RD02g9zewDS9O8eOJTFShZ4CJIXfarTVDW2x+ZNo4kE9Cz0F4ly+vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 SA1PR11MB8474.namprd11.prod.outlook.com (2603:10b6:806:3ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 09:50:51 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::9d26:3f6:8afa:4543]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::9d26:3f6:8afa:4543%6]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 09:50:51 +0000
Message-ID: <f752470d-2c71-9545-7805-0d3128c3b04d@intel.com>
Date: Mon, 10 Jul 2023 15:20:41 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230530103421.2824622-1-sujaritha.sundaresan@intel.com>
 <20230530103421.2824622-2-sujaritha.sundaresan@intel.com>
 <87a5xlhxq1.wl-ashutosh.dixit@intel.com>
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <87a5xlhxq1.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0106.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::21) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|SA1PR11MB8474:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ce71b58-d591-413d-89ed-08db812b2527
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5GDyRnfnVR+5QZ9tk5F7mGQ44BjcQ30dhR2dJm2c5h+3VgMWKdmMbssi3B1t+4sPT7YJ8z2P5kozl/y25GukvLce/+u656d4npKNA95uEPcJIib9d3gvII5qQSvxtpjHo/Y/+iCrithGBSlLj6ctKIdDhMsvR1dfuRFvKeKsNb9D2aSEvYoE5nsUEVb2EADiSVWFoSfNf7OL4GYPwfripVoqBYF/j8F495SyPKZPgLlvK8VQ2KaKQHGUnHUgC5khX6Jiw0Gj3FGgljJM5RER8zr8q47BSPfkMDN0Ar2yzWz4VSxtKQ9cztajUuadZJW1XOojY0BTqvBmJDFrxZlLS/JfnXo4pLItXs1rWxvG99544YUXyaAdGFEY6215fyPP+/7HdVKOcaLLNq3cOrT4mZ+7auwAaaOLjZADMaGpW122TbVAaKcf88L5lcGOZhP92AgoVTuDS0VDdKiLCvikxULSe4UMTpY2hicXhuPMT0e4OPGiq6ozwf/FxUWlb7z1gNokC5i3jFnmeZ8wbFoJdI4mpjY61iETLTJf7wy12qFPkeG3JacSZPKLpPwDyVSRw7GriTQmn1a21WSD4BT6DNLUTExsod9FSJwN0CpLgiUZcZyXBfM3WNwd6Y/X0VfyWumgqbiLDF1evfRWdWNrdw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(39860400002)(366004)(376002)(136003)(451199021)(86362001)(31696002)(38100700002)(82960400001)(31686004)(36756003)(37006003)(6666004)(6486002)(107886003)(6506007)(53546011)(26005)(186003)(6512007)(2616005)(5660300002)(2906002)(66556008)(316002)(478600001)(66946007)(8936002)(6862004)(66476007)(8676002)(83380400001)(4326008)(6636002)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sk5iRU5SdTJMVFpLS0NIVXVEb3ZObzVnQnJaTVRNOWtUZEIxenRVcFY3dGRY?=
 =?utf-8?B?aWhBd0hLZ0dGR3JHWllkOWs5TTBPVzd6SEl6ejVSYXV1ZVhRcWs2K2FyL0pW?=
 =?utf-8?B?OXk5N3g1b3pFaXUvYnRidHBwd1dQYkhDQXJESEZQWGgvaEJFV0tsMXR3VHpB?=
 =?utf-8?B?TEgzTEdlK3ZIcXBpQWNwcWpJT04vaEk1NjBhQTQzd013UDVoMW9WanRxS0NR?=
 =?utf-8?B?QzJPUTh0dVJKSFYrL1E4Y0wxTWdPV21NVWdJT0w3ekE0V3NyRWM3Wm1RSk8w?=
 =?utf-8?B?K3NXSUd4VnZmRGk4WVFIRnZTNm5PbUNhRW9LVi92cFNySnE4ZC80eDFJTVFW?=
 =?utf-8?B?S3UxMi9mRUl1dXcwdC9ySUl4MTBMaWJkNFBJTjFwQ0w5NzZLQUs0VzZhc3k3?=
 =?utf-8?B?OU1tNks1TFFCcGRzWDk2dU5tTXA0RTJ6M0tTNitrTnhYbi9VNkNIWHNPSzZw?=
 =?utf-8?B?NkFyaDFydGNGamw4L2RSRkk4NUYvQ1M3amtWQVJJYllKVkloMnozWGxCL1NE?=
 =?utf-8?B?KzdwMSs0NjA1blAxNVFLTFNyM3czYUFreFRkRzRJaWV3TTh0Ly83QnpCSk1x?=
 =?utf-8?B?WVplWlZJKzZzVkh2MHEzRi9HeElLZ0Q2YU1JM0FXaTg2TXBsZTJhNVZ1TXI0?=
 =?utf-8?B?TDc3TWc4SEdDMXBqdlNWWjArdXp4cWZVSUxVOThyVURJcnpRU1FiUGRDdGVB?=
 =?utf-8?B?cTNCdUFoYUhvM05oanpmV1ZVT1lhcWRLWVNvczQrUGkvR1Vuck0zWnlYQXFu?=
 =?utf-8?B?c2xoZ3JQWnByeC9adGIreUcwUGFNdnd3dGFlTmFCRlp0bE1Ca1NwcTFDRGIv?=
 =?utf-8?B?SjhDSGhrUlRHd1NyRXBTUVIwRURSM2NlVXpEbzl2SUNiUFFHbkhVQ2o0WGlY?=
 =?utf-8?B?ektSQ0RGcnVXdzJhQ1liNEc1SjgxKzNlZmdmQzdpQ0JiWUZidGRvL00wY0pS?=
 =?utf-8?B?YWtOck9wM2ttZ01UNU9QTnlFTVhKek51V1dPSzFhSVNvWTltSlM3WWovNEIx?=
 =?utf-8?B?ekdBdXU0Wm9tSGt0SWZvaG5lenJCZVhpc3ZRdVBET0c2ODlUSVRPTDV3OGZO?=
 =?utf-8?B?NFA5U3VQT2tyN1E3bXUzV1FLZWxqUjdiRHV1OFpVbEpodlJEWWhuNnJWSS9N?=
 =?utf-8?B?TXU2TjJlcHEyUFV0d3NqNmZHZFBGN0VSRzVwbUdTa2pkT1d0UjBteEJsSVB2?=
 =?utf-8?B?OHJaTmxITE5QeFRsbnNxWTZDbEVKelF4M0oxbU1RV0J0T3IxQUp0b1VZT013?=
 =?utf-8?B?bVRuZTZscmVFZkZrSXBmYStwaUl5TXRubTRLUEFXL1FuM3Mvdkc1WStITTlB?=
 =?utf-8?B?OEJxTDlEMG5oQW11WGFBZVZNYTlxdkE1SC9qQTVFdUt3b3pUckNwd0hlL3Rz?=
 =?utf-8?B?dVdnZWs3YzhnOHZFMEI1SUpydGV4RXhJbm9NTk5kdnorMU9Pb3RXYlM2dGVV?=
 =?utf-8?B?cDZCemFRRXNpR3BtY2NXRVVEaGdGNEE2UStHZGJwWEFmYUtBSElTQnFoSUVM?=
 =?utf-8?B?ODRLbFZXeUc1NEhaNDQ5WC83czVFSFQrbGl4TzZkeDR4N1FoaG9qZzNvcUR0?=
 =?utf-8?B?OXVwem5nWjlCU2EyV0MxT3lWbVppMS9wZkR3T1dYNkhtNi84VW02Q3EzVGJ2?=
 =?utf-8?B?QjNlN0RPeE4xckNWQkxKMER1U1gvOHZuRkVYMkdieDRvMDV5VjFkMng5cjVt?=
 =?utf-8?B?a010VHYvRXkyZCtTdWJMbnk0dkhJTTQwWHlYUVRPTldNZE9GWEZybTVxbG1Y?=
 =?utf-8?B?REpVVnY4T212ZTBUM0NRQ1FrSE5HdVBDZmg2WERpN2hYclh3YkZ5cCtIa3BE?=
 =?utf-8?B?VDhGenhWYTNod0JMNjFqQ0VwblNKZUtreDNvN0dRTzdoSXAvQ2JDV25vU1Ux?=
 =?utf-8?B?SmtEa01CYSsrS3RhZnh6RExtaU9IbnRtWlZxeHJMcHFxV3RacDNXZE44UTl1?=
 =?utf-8?B?OWdHRWZ5UzNjbE12VDdWOWlZakpiWnJLblU2dlByeitpMU9ET1ovSll0cXc5?=
 =?utf-8?B?Qy9YQ2FFVHFCbG8rZEpjWlFrWGZHRGVtSzdjYXA2Nm1VcjBBSmx6cVZVZTNw?=
 =?utf-8?B?TytSNWkyV2VWRHdiNmNWdisyUTRZeHhBSHJreGd1Yk04TjRGR1Z0T0wybjhD?=
 =?utf-8?B?L00yK2JkUDc0bG1ZZzhob20rU1dDbDI0Vm01Slc4SVF6VlQvNGZCTXM1cHZq?=
 =?utf-8?Q?zEsoXBV4D7ya88/HTKBJrMo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ce71b58-d591-413d-89ed-08db812b2527
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 09:50:51.3518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ciTt9fbWMrT+pX+1xRa9QzSJCeBfgJYMvolFwqi0CZ51olX5ysd61L2a6nyU8Kkt0+WppFWkYnOvq0NDnPk53nB8UsoRVCxIPaqtuAodF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8474
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/1] [RFC]drm/xe: Adding throttle reasons
 sysfs attributes
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
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 5/31/2023 11:02 AM, Dixit, Ashutosh wrote:
> On Tue, 30 May 2023 03:34:21 -0700, Sujaritha Sundaresan wrote:
> Hi Suja,
>
>> Adding throttle reasons sysfs attributes.
> I am not sure about the location for these sysfs files. And whether or not
> these are being exposed using hwmon or not in xe. I believe the patch will
> have to wait for someone like Rodrigo to look at (unless another xe
> developer knows) but we can fix other things meanwhile.
>
> Also one more comment: didn't we want to expose the upper 16 bits too (the
> log bits) or only the lower 16 bits (status bits)? Though the log bits can
> be a separate patch too.
>
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h | 12 +++++
>>   drivers/gpu/drm/xe/xe_guc_pc.c       | 67 ++++++++++++++++++++++++++++
>>   2 files changed, 79 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index e64e5c0733d6..e7fe8a3e348e 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -374,4 +374,16 @@
>>   #define XEHPC_BCS5_BCS6_INTR_MASK		XE_REG(0x190118)
>>   #define XEHPC_BCS7_BCS8_INTR_MASK		XE_REG(0x19011c)
>>
>> +#define GT0_PERF_LIMIT_REASONS			XE_REG(0x1381a8)
>> +#define   GT0_PERF_LIMIT_REASONS_MASK		0xde3
>> +#define   PROCHOT_MASK				REG_BIT(0)
>> +#define   THERMAL_LIMIT_MASK			REG_BIT(1)
>> +#define   RATL_MASK				REG_BIT(5)
>> +#define   VR_THERMALERT_MASK			REG_BIT(6)
>> +#define   VR_TDC_MASK				REG_BIT(7)
>> +#define   POWER_LIMIT_4_MASK			REG_BIT(8)
>> +#define   POWER_LIMIT_1_MASK			REG_BIT(10)
>> +#define   POWER_LIMIT_2_MASK			REG_BIT(11)
>> +#define MTL_MEDIA_PERF_LIMIT_REASONS		XE_REG(0x138030)
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index e799faa1c6b8..363332881e4d 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -638,6 +638,73 @@ static const struct attribute *pc_attrs[] = {
>> 	NULL
>>   };
>>
>> +static inline
>> +xe_reg_t xe_gt_perf_limit_reasons_reg(struct xe_gt *gt)
> I don't see xe_reg_t being typedef'd anywhere, only 'struct xe_reg'?
>
>> +{
>> +        if (xe_gt_is_media_type(gt))
>> +                return MTL_MEDIA_PERF_LIMIT_REASONS;
>> +
>> +        return GT0_PERF_LIMIT_REASONS;
>> +}
>> +
>> +struct xe_gt_bool_throttle_attr {
>> +	struct attribute attr;
>> +	ssize_t (*show)(struct device *dev, struct device_attribute *attr,
>> +			char *buf);
>> +	xe_reg_t (*reg32)(struct xe_gt *gt);
>> +	u32 mask;
>> +};
>> +
>> +bool xe_mmio_mask_read(struct xe_gt *gt,
>> +			xe_reg_t reg32, u32 mask)
>> +{
>> +	return xe_mmio_read32(gt, reg32) & mask;
>> +}
>> +
>> +static ssize_t throttle_reason_bool_show(struct device *dev,
>> +					 struct device_attribute *attr,
>> +					 char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	struct xe_gt_bool_throttle_attr *t_attr =
>> +			(struct xe_gt_bool_throttle_attr *) attr;
>> +	bool val = xe_mmio_mask_read(&gt->rps, t_attr->reg32(gt), t_attr->mask);
>> +
>> +	return sysfs_emit(buff, "%u\n", val);
>> +}
>> +
>> +#define XE_GT_BOOL_ATTR_RO(sysfs_func__, mask__) \
>> +struct xe_gt_bool_throttle_attr attr_##sysfs_func__ = { \
>> +	.attr = { .name = __stringify(sysfs_func__), .mode = 0444 }, \
>> +	.show = throttle_reason_bool_show, \
>> +	.reg32 = xe_gt_perf_limit_reasons_reg, \
>> +	.mask = mask__, \
>> +}
>> +
>> +static XE_GT_BOOL_ATTR_RO(throttle_reason_status, GT0_PERF_LIMIT_REASONS_MASK);
>> +static XE_GT_BOOL_ATTR_RO(throttle_reason_pl1, POWER_LIMIT_1_MASK);
>> +static XE_GT_BOOL_ATTR_RO(throttle_reason_pl2, POWER_LIMIT_2_MASK);
>> +static XE_GT_BOOL_ATTR_RO(throttle_reason_pl4, POWER_LIMIT_4_MASK);
>> +static XE_GT_BOOL_ATTR_RO(throttle_reason_thermal, THERMAL_LIMIT_MASK);
>> +static XE_GT_BOOL_ATTR_RO(throttle_reason_prochot, PROCHOT_MASK);
>> +static XE_GT_BOOL_ATTR_RO(throttle_reason_ratl, RATL_MASK);
>> +static XE_GT_BOOL_ATTR_RO(throttle_reason_vr_thermalert, VR_THERMALERT_MASK);
>> +static XE_GT_BOOL_ATTR_RO(throttle_reason_vr_tdc, VR_TDC_MASK);
>> +
>> +static const struct attribute *throttle_reason_attrs[] = {
>> +	&dev_attr_throttle_reason_status.attr,
>> +	&dev_attr_throttle_reason_pl1.attr,
>> +	&dev_attr_throttle_reason_pl2.attr,
>> +	&dev_attr_throttle_reason_pl4.attr,
>> +	&dev_attr_throttle_reason_thermal.attr,
>> +	&dev_attr_throttle_reason_prochot.attr,
>> +	&dev_attr_throttle_reason_ratl.attr,
>> +	&dev_attr_throttle_reason_vr_thermalert.attr,
>> +	&dev_attr_throttle_reason_vr_tdc.attr,
>> +	NULL
>> +};
> Also don't see these attributes actually being created, using
> sysfs_create_files etc. So has this patch been compiled/tested?
>
>> +
>>   static void mtl_init_fused_rp_values(struct xe_guc_pc *pc)
>>   {
>> 	struct xe_gt *gt = pc_to_gt(pc);
>> --
>> 2.25.1
>>
> Thanks.
> --
> Ashutosh


Hi Ashutosh,

This was just a very basic non functional RFC patch meant to clarify the 
path/location of these sysfs attributes.

It's not a usable patch.

Rodrigo, could you help clarify whether we are intending to expose 
throttle reasons via hwmon in Xe ?

Regards,

Suja

