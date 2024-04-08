Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862DEC67861
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 06:03:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C1410ECB1;
	Mon,  8 Apr 2024 06:03:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B62O7kZ8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5D4010ECB1
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 06:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712556202; x=1744092202;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Ejm2UEqJP2snGalKyv9ARUq8CdDHiN1dEoHSIINiw64=;
 b=B62O7kZ8QQQB/NbX32W+WMW/0x9GhlANyku0rejTh4CVj+41s1pYxDaz
 p1pKwBVOfR7MMtFMKKhRm9VYYHzmkJG5OAvsE6YO0fUXnYwGXvNZUbw/F
 bruyZhjDxA4v8cLyOSOMBAlFZkXFtGo1PVQ5abzeEK6jlyFgBKb02ScNr
 0O9m83wLgDgBlk5JKCgjLnOE6UsC6rYqC9NLZxRLs0PpT/I5pp+5bQ7Nt
 7Ru03mrPSvuH6Gsx2FARPU1WvoMMq9vpqiPsM8fDi5Axhiebhk8Iwr6e5
 /MQ1FdxJiGLppMbozksNC4cmAlyA9SHbVbILP4JObVctokolxIkKBp4oK Q==;
X-CSE-ConnectionGUID: 3PVJamaITZalr32UuQsjKQ==
X-CSE-MsgGUID: TfJX4F8xR+2MnnX4ShjANA==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="7652357"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="7652357"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2024 23:03:21 -0700
X-CSE-ConnectionGUID: m4oKDy6RRoGMyKWyAO3zvA==
X-CSE-MsgGUID: qHRKhA0mSrqLcU70IcRj0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="24250736"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Apr 2024 23:03:21 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 7 Apr 2024 23:03:20 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 7 Apr 2024 23:03:20 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 7 Apr 2024 23:03:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nITX5TQ52pV8IDZHJGdFr5Mn0CiCwP/oT91ccuiI/v5zxfTI9qO0/OCC/7JP0qKTKcV6gTtC4KrXeCXkl5fGCOJzAe9Orodsrc275K50E4ri16TsBRpEFaEd2sDWkFeK7XIR7vy3GrJGto3fkmfoCwC/hi6oLPkmfqUEhZodEQkz8RLWUw7tyCC2zwKAWaMRovOorxFe9zPbZk/R0JV90+siHOLfYABU6AlYQ8nkGe7FkoDyAs/Qjq4W5tD6+vu2D1p8F5S1V/nh2N6G1bkKzUejKUrfV8ujBTMjx7ZRn55aeRCi5/4PY+m993jiS/GJeMjkk396/nda/TJ8yLqG4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vrGKHdhmsmETPMCuL4o9yxnZmYkgLqgisvVHUG2fqBc=;
 b=jAVgKeZUzUTyPxrYxg04LQZES5H4IpM/Ydjfzw6khCJ+21+vFWMTM/OjiwxYTDEC6l6gNAQ/7izOKvue6gg02FxPHswt3K7bC4w88f1uyxRDkDIiTm1ufdp0WYMybXCJTHUFhGH2hZQkHIXXWFYZUlZjv0+V5zzzIioW8h/dxqEVJRLcLonV7RYQosPvbicOqsqIyVVhINmxx9L+HPLrR2LznILbGpzmbRIaXHr/XSK/WyC4yyCc9M9L+L7a8XLQhNr6gSfBa164FzkJ0i+fz6kwwqbRuPY4/OMoeb6bqSO9NoSA+U9eP/mJkcv13XOgssf+Vgo4JKe54iz0+L2W6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CO1PR11MB5090.namprd11.prod.outlook.com (2603:10b6:303:96::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.22; Mon, 8 Apr
 2024 06:03:18 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a%7]) with mapi id 15.20.7452.019; Mon, 8 Apr 2024
 06:03:18 +0000
Message-ID: <1d3b74ce-5637-423f-83ca-43d3fde7548b@intel.com>
Date: Mon, 8 Apr 2024 11:33:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/vf: Don't try to read legacy GuC MMIO
 notification if VF
To: <intel-xe@lists.freedesktop.org>
References: <20240405133936.891-1-michal.wajdeczko@intel.com>
 <20240405133936.891-4-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240405133936.891-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0068.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::13) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CO1PR11MB5090:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IZM6LI2fKWX+k1LidVaqBm9QbeNTNCuYtDilxKcRAhdcjHlgLtSv7VNK1H5RTqWC6CcE2TqPRdAzEe9k6RIOy3xtO/kOZSz97zySLur7puGxwB8DuB1veR2ccPpnVkEEZGSUK9wvdQiSyEw8kvyfZ1qP75UTzUG1pviw+qAz/BS5LFZMYdnuzvnaCooqU//wjcokm3XsYAhMnkefuuW84d9GbU2+v+wbA1r7NM9IowXeYZVAWN9YkryrfJVAangIPimS7QxrFkHfsL41piyo0Ua0h91FwWLE8mswrQNvpiqWXNVKzIiWiLFCP7F2FgJZkSVyDTU344k0tQTcC4dl3KJE8a1jzqjwod4vHkqWDdiHk7vopo8SvK/M+EyoMElkqX/KbpGYYu+x4WcY9gB1H/H2+jJDle97QKr5dYAo8n966w575aw8tw0uB8u4kaqPtlVGdf6ZLS/w1S7yY8VMKUbITMyANjJuQESz89eXddIsEjM7gKrkQ6e4r2fmH6OmNS5Hhp74Jug6O4o//KnqRVJXtnKH/jbp/84Bpoa3P/zLw8nNp1M0iez4/4/6U+S8j/NmLY4OhcjlrZpZr8giBHtVVcaFy752mDApJT5dg4rV0TQ3y103HzpGxJlun9XnOg+CllWvNzlfpXJtpQdhDmVwchrcVwWy9enSfwmAbto=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTdwY2xqcmp6Rmp1UzljMVIxVms1YTBJb3pvN2xqUWorMWtNY1JjSERqc3l0?=
 =?utf-8?B?Z3FUdytrbjg0R1dQaG9MVUJWa3J0Nlp0cnd2MEc5b0tEMm1hSktIbkNlOWRG?=
 =?utf-8?B?UGhybFJyUlU4SWg5YTZSNExkeGFXWEFDOEpia2RuTUpDbDFNSWNJRVNOT3JV?=
 =?utf-8?B?bEdla29EYThIUE8yL2pzNjBBWm1IYkordEk2MFNiOURQNnB2TVVJRFhobEM0?=
 =?utf-8?B?KzRnM0tETFR5ektaMHZFTWRKUFptV3Bxd2NpeUZ4M2o5YjY3NDBEeUZ6Y1lJ?=
 =?utf-8?B?U3Rza3ZQT1h3SXRZSkE4OTFSWVNBWEZmQURDbG43dEFkV2lYOGVXTG1vKzdN?=
 =?utf-8?B?bVZuRTg3Uk9yY2x4UTFCcDR1K0svWGJkamdQZW5aWW8xUEVBZFQrZFNOcW5K?=
 =?utf-8?B?SzEzRlZFRjhOd04vL241VFovVkU2UHlmQ0FUMHB4WW1lRjI3aVJPaGZQeTg1?=
 =?utf-8?B?VjFHdGRZcml3RzBxam5xbHQ2eG9JUVk3a0RwL1NUOFVzK1dTMGh5eFFGbEZ4?=
 =?utf-8?B?ci80K1NZdEJWdnZrOWN2b3BNRXlvTzBIMUhCaVRkRW1EZ09kL1VOUGt1Lyt5?=
 =?utf-8?B?YTFNa2doQ21GRHBjUFVuTytDRUVNbWlQZGlBNjFrQkZQWFpVSEVHUG9RSTMv?=
 =?utf-8?B?WlBnVTBYQndqOWVnOTN2YkxWR1Y4MCtIOWxtazNoenJLSHYvZmw3Y290SlRq?=
 =?utf-8?B?VS9rNEJWZWNqQTdObWtoSnJpQVR0RWIvZEtCaE9SaE5iR3htaDYxY2prUzlW?=
 =?utf-8?B?ckpuNTNwTGcwMTM0UGNCeWx4R0dkWFFPaG1UZUFCZHpXSER4SE4xUTNQZ0pp?=
 =?utf-8?B?aVhaaml6djFMRndiQkJPbGcySVlhUkg2aWdncEZtMFR0bG9sOURQd3JVeXBk?=
 =?utf-8?B?dEJFOHdodU42QVJ2UDd3Uy9EQUNmY2M0RTdTWU5yVExPcGI0NXNxaHhqcE5E?=
 =?utf-8?B?SnkxbmJrZmVrWGU4OEU4alBRU1FSQ1ZkamNCNWxPbmVrNVVhZ2piZDdWS1Er?=
 =?utf-8?B?bzVTditsZTZIUzdLTEI3bDA2WDhjSE1FRG5TbmJsNkI1ZHhhdkYvQ2Y0ZzFP?=
 =?utf-8?B?ZUErSys4WkFWNjJxL3VkcWwwaWtHYnVpQVhlTTZMNXcyOGw2VndpdENYVEtE?=
 =?utf-8?B?bDdHZFRFUmVtWFIwaXZWRFJqMnlTb1BaUW5sUW1TcE8ySHJ0SEZ4Z0hWbFdE?=
 =?utf-8?B?S3U0cVpldHR2b084M2U2TEM2MU9KZWxzNGVWZXNnNjRpalVKNVg5Q1F3U05I?=
 =?utf-8?B?MnZBMEhPRHkwZlM3ek8xUHhuNTlYWE1tWVRyZy9RdFRvb2c0cXRnamM5emNV?=
 =?utf-8?B?clpXc1NrMUNDOUxKL2dFWHJJMTZVams3bGF6UXFnSURGZkdYZnk3Q0NDcnhz?=
 =?utf-8?B?VktSclBVOXJ6UUdRejhDajRIbWtyTWpIaS9RQ0RjZnlsYUFhWlNzanFLNHlZ?=
 =?utf-8?B?YWdvYUNVdzI5N2ZlM2VpNDE4Vk5zOVRaaEl0TmhpYnlsNmtsQ2JjTmVJNDA4?=
 =?utf-8?B?SjZBOXRpYmZkaEhXV3NvbW04SjBrcVBMUEYrWm1sd3FnN3ArOTZzMmpsSEJj?=
 =?utf-8?B?VlNRbFBxZjhkWHowZncraDl0QzZwbGcvcUNHMUh5TDVlcGZpNVdRNFMrNVpp?=
 =?utf-8?B?NFpkOUJLOFV3QzlsSFl5RFQydDk1UlRJVTNYQkp6Nk1Jb0Y0U0ROUlgzV3Q4?=
 =?utf-8?B?MEF0YzRmREEraXFCYTRFYmwvZGdLUWJDNXlicHBHR1RwTER6ay96VDFDUnNO?=
 =?utf-8?B?ZTdldUh2NlNuSFlGZjdaV1VvNGdDVjBLK3Boa2JSZTF0elZ5VTZ0dWNQTEtP?=
 =?utf-8?B?MzBxT0RtWFZDNEx0UXNScEEwVXo2OTVnVzZpdTZSWkNoZW81VEtNN2NxT1VZ?=
 =?utf-8?B?bDVLKzgzdFkvT0NESzk5T0RRQU5kVDE5a0xxSkl4SzBlMlROckIzSWl5U2xL?=
 =?utf-8?B?SnE5eU9lZXAxMW5LV1lkUnBZYWd0K0krdzl1K2ZVdTl1dEdiSzdHNnZvV1h0?=
 =?utf-8?B?SlM5T2JsTktjZzl2SFdMWnhuT2hScTJWR0ZDUlY4UWhMUG5CclJvY1RrZmtS?=
 =?utf-8?B?ZGhNRTFyTVdDRlBZS0toRWthVGMyR0NPeFJseHRiM2V2TCttb3NKRUJHeVFs?=
 =?utf-8?B?MXZPdEJNcFBxQzBtT0FEamZyMkJlcHhhM2dXME1VcmNUblg2MjR5WmFUKzdy?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64b17b82-8176-44f7-2920-08dc5791961a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 06:03:18.2820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5PlQ8Gc9qHgatsuXAsHiNq548NF1Hjb2s/XI1w53KbhDfE8urMAKArpYdrUpxN6TOwIIq3VfkV5OWLJp9y0jCdDkppkbVUXFypYLzcw1Iuo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5090
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


On 05-04-2024 19:09, Michal Wajdeczko wrote:
> Legacy SOFT_SCRATCH registers are not accessible from the VF. Any
> G2H notification posted there will be handled by the PF driver.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 59fe73770711..240e7a4bbff1 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -591,6 +591,9 @@ static void guc_handle_mmio_msg(struct xe_guc *guc)
>   	struct xe_gt *gt = guc_to_gt(guc);
>   	u32 msg;
>   
> +	if (IS_SRIOV_VF(guc_to_xe(guc)))
> +		return;
> +

LGTM.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>   
>   	msg = xe_mmio_read32(gt, SOFT_SCRATCH(15));
