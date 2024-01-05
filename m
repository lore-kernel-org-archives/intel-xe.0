Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4B8C47074
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jan 2024 00:36:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E92C510E010;
	Fri,  5 Jan 2024 00:36:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DFB210E010
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jan 2024 00:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704414985; x=1735950985;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GLIwnbV6Eeb0qcFg00SyaLwxz4KKzefmFYvRBm46JRw=;
 b=e9y0Cf5Te2b2tOIXBX/nuJ8wo/FMw26kXucEuEh+zZ2nU08ST+k/x87S
 TSJWL8eHE7AYHZ8RY5kJtvuIB0ptOpghaE9cgM04W+h7lKcBh7SmdZekx
 g2hh73QQuhQrsWu2oIMTvq7tpg5FxCzz+qlYhjfV6aVfcsmTQheKUihrM
 XSoc2+OLyQieap8tjgFkACZLnHV/5IZG3aCcoGmK3imn+6p0AhPJsVcU6
 DHdNX7dXil2Z86JVdVuHwoxgnjDye/Pe1/ZFWbU2Q6PutYHCWuFfSFdgr
 xt2QTVbpvFkUOrqe1K2RWb8CB05tNKDQk0GPQQM9EpgwySwvHUE4e3CKV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="18911460"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; d="scan'208";a="18911460"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 16:36:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="871095642"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; d="scan'208";a="871095642"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Jan 2024 16:36:23 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Jan 2024 16:36:23 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Jan 2024 16:36:23 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Jan 2024 16:36:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BRcIZtWPupCZFiMeUDVAsJUMBMcDQ0H0esqaBeqXS9lv0g9yGtUnToUXWdGlTlrq/rBmUjLkO6VhHFGCc1+cP1sVllXSapIgzzBFan+/X+6VkWDSmn/41htXElmZsgda8uvsFDQ/vVG4d6CCe52DOGYT7iSRCFP6l8ShAV6tVXSfs6z6lJT0gYbSMACQjkMYm3aj616eFuX+glt8Bt4WF5uLhMr3tCw5TFMi8h7MJc0xoGtvUsYwqRu7KwuRk3UGcosTmv0J2/wHyWwR/Lg7qPjlWkqLR8Iy9y5gdFlm6UrEpcPFvx4ltxeOvmbVTNOpoIsEFGmGLIe7B7d58/jf3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mH+TfswnJr3Sdzy5RPca7iq+bp3p9cGLju0SlN4aiZI=;
 b=B2FtiMe06g20dAthFLmtRJ8+siPUN0p91kdy8om8o8Fm9XDRoh88SZL76K99Tld8Dc8/yRmiASUVB9IX+ti2QUHkf/wPTSJVnV4sTLvz6ody59wd3ue2NLUzDdg94cuTNv++gQdqW84lTve4Aucwpzh9FeAZxK+Lge85fmxlk31vEZnGCmSzizGE/q9cZ4sf3DziXjib3GLJAyHB+ayqfUSwXpUenCmTM6o7cV5pMuK+QIkChQfzPH9WsupIm533v7ePFOIuH5ivPymXIJNySKzwEtufOYCcOATJRFSJ2LGc66dIgGRkjDV7SPm+z9jODbQNZcYCy/TSVQXve1QhDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.15; Fri, 5 Jan
 2024 00:36:21 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::16a8:c3ae:ef16:3d13]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::16a8:c3ae:ef16:3d13%7]) with mapi id 15.20.7159.015; Fri, 5 Jan 2024
 00:36:21 +0000
Message-ID: <c88c2ab6-e75e-4c02-9d23-d5375cf9279a@intel.com>
Date: Thu, 4 Jan 2024 16:36:19 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Check skip_guc_pc before setting SLPC flag
Content-Language: en-US
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231222210109.533215-1-vinay.belgaumkar@intel.com>
 <dd42753d-5cda-4e95-a299-0cda55df4184@intel.com>
 <5c890fd0-1731-4fa2-a714-6859cfab7874@intel.com>
 <8c632706-4cfd-4836-939f-15c830c3ae2c@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <8c632706-4cfd-4836-939f-15c830c3ae2c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::10) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|IA1PR11MB8200:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e57adb8-4e71-45eb-555e-08dc0d86568e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p0Wo0IyFWobm0cFj+UecsfdK24Bhll9Yg/D9DqpSlbwPQoDSBhXRGS+DX+tyxe7AqqFzf6GW5PKBTlTMitngUgRUNnIW7cDRQbK7RwZACFLskj7LqbLAttUTU26zEIeLLObzKGsw7JQbibYyTaLHnfRERDc0aY999cH91Icdkrqjmk88+jFToPh1bHG/aqgXI108uF6nII4mPG/VqG+oIAnj5byx4qsGsLrdh02WO3mYEYpTgVrUO5VBj3TG1UkgFTk9nawJidaOu+lOYi0g4+HOKvWEIWyqvhpLHXdPjrqUh/02Dv8Kt19xmtXwCOiTzeF84cnNEi09/wtjHK6zcp4yyM+CApwZ/MpNZjkxjH6aK7hQsBYgdOGdDQldcBpVZm96gFDXC8OP4tg9yy8dVhNrLWM/odazYcGPVD8ouZPJw9hPdJ0LTUuxM6jRe+hYjfRBRwhTKYAECTtQLUP4H6n5Gf9tABKmjptuu5oq+jMr2/wCTpm6ppktb5Jl5SxYvf68tiafdTQoxSKduRyolKh8+pD1u98tY3ADolE+Mo3Y4p9juIB/v9PErS97VD+MncZDQ5qvmLzqGlVaahCMc1lPPQl8jP5ywF0KNunZlcmCPDPG95zIy5+4psr4bSYjAmk4VLPIBTb0PmQc2qtuQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(346002)(366004)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(6486002)(2616005)(26005)(53546011)(478600001)(6512007)(6506007)(83380400001)(66476007)(107886003)(2906002)(41300700001)(66946007)(8676002)(316002)(66556008)(8936002)(4326008)(5660300002)(38100700002)(86362001)(36756003)(31696002)(82960400001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3RuWUlHNnlkWStMa2h4bi9nd09uOFI2OXNJc3pvSGxoYkh2WjNhb2NaRFN0?=
 =?utf-8?B?Vyt3TlFNY0xMaWIya3RWODBqMVVRbWlkd0tpaFpMaUhkTmVNcEVFWG9KbTR5?=
 =?utf-8?B?Qlc1UytaUVBFVGFiV2RReTBSclA2VDgxSG83UytSVkg5S0wwblBQci9pTDBC?=
 =?utf-8?B?c1lCam0wYUh5cTZXcllSSU1nRU5selpQeGNMSXVzRW5qYWFZd3gvaVBVN1hP?=
 =?utf-8?B?TXFiVDEvTURKZHZhRU5WMHVsTkRGb0Y3NGFVeGNaU0ozWkRzcU1IeFh6em9x?=
 =?utf-8?B?UkJqVGwrMElobXFHVjF4VFc4MkV5Y0oyMnRuYmcySDFtQ1JJeVVaV3lpemlE?=
 =?utf-8?B?K05uM3RteW9Od28vSHEwQ1BrM0xTdlkzZ3FidnY5UG1raVNTYVlwaUEwZ3Bq?=
 =?utf-8?B?MkN3Y2hJTWJudWcvb1VuVlhIYnI2MTJIeUJJSGFycXRXaHIvNEY2ZnZ2ZGVS?=
 =?utf-8?B?TWhNbDAzcnhUcXljNFVXbTVXYktJdWVveXRYNm04Mi9VcmxCT0ZkNlRNL1RV?=
 =?utf-8?B?SmQ0THpOcnpURDIyZTNHcUVuSkhnTTQrbzZJTU1sSW0zYklMUHprR0RsdENQ?=
 =?utf-8?B?blpvZDdpTXZmMm5zNTFWOGV5bTE5UXhOL2tLTlY3MjI1UmxiWDNLSjdmUTRW?=
 =?utf-8?B?VmlENThTMGZQR2xpcGQyYWRJRUlFNXNQTUJ1RlYxOXdOaHdhTTcydW94SWxy?=
 =?utf-8?B?SjJIMnI5TjBMdjNSY1NCbkdid1VYbkhYZ2U0QXFoZ3N0NjBQK3V1U0tRQzdj?=
 =?utf-8?B?M1ZQT1AvdkI2bWhFMTRZOHdkRG9Za1BCRUxxaldIU055QXFaTGxKdWxmaEU2?=
 =?utf-8?B?UkdEbm1MVUxzOENDZmRTRXo1RDRPMGhqM0hKc0xHWDI4bHROcy95NDdxU2c4?=
 =?utf-8?B?bWNhT3NINDdlWm4vNFlXWXRjVlF2RlVrelNROU92b3JWVVJ5eTRyV1NLUzVz?=
 =?utf-8?B?bWN4WU1zUmxGN1podlpmZWp4QlJuRnpJZTkwbCsxbUl3NkRJc3RUZFV3Kzd1?=
 =?utf-8?B?bXZQTlNIMGRRVERsbnZCekxuQTh4cGNuWFcxd0o1ZnQvUWNYV0lqTzUvQUUy?=
 =?utf-8?B?NkxiOW1xOVc0Mk1IZkhzK3FHSkpndXlNWXlyaXBBdXFOS25lWmxqMnZnVUdj?=
 =?utf-8?B?aXhUamdHT1IrWk1BeTkyaENDTHF2eTRwcit2WHpwWUhDUGRsZEdYQWExMHIw?=
 =?utf-8?B?VFgwT1kySzFhU3loZS9ySllwdHIzR1BSQWY4QVNaanFxVE9ncXFKQ1JRMlF0?=
 =?utf-8?B?VWlJclVTNjBmWGQwbENjZVpWcnB0ZGMrdGJhS2lpQlE2MVNKMTl0K1hObEww?=
 =?utf-8?B?NFdGRE9neTRiSkhmWEdYWGhXbXVjak15cEdBOG00UVgvaTNCRkxGb0FaSC9C?=
 =?utf-8?B?VmJjaEJ3TStHN1ZldVVGMG40QWpmUjJtcXdBWThNdlVvalc3dGs5S1A3V0Fo?=
 =?utf-8?B?UVNjNmtDanRlRFh4M29rSWhJdXZDd2pFN0hlNW8renZrQTY1RzRvb3dDbWtw?=
 =?utf-8?B?Y0MxUnhCalVWS21EZHBzMjNqOXZyc2ZEb2tvcnpxU1ppK2txNjJuODNLSW9P?=
 =?utf-8?B?dzBMWHJxMnBzMzdnSnlUaDJMaFNQeC8xYkJ0c3k5Wnhta0hhYlBkMnVGWWgv?=
 =?utf-8?B?WlhveHpORGNNNmlDblFqSklTUW1ZZGdSRCs3NFlzUGZuNDZEai9mT2hMR3d5?=
 =?utf-8?B?UXJkRkp1bWxEWWxRQ0lPTE95Y3Zaa3JYYTJ5ZHhDQzloQTYvT2JOekJONXZR?=
 =?utf-8?B?REZ1VXd0UFp3Tmhnekc3QUZUKzdBVS9ndjJmNG5hWTl6Z1I3Zk1VN2J2VG5D?=
 =?utf-8?B?VFF2N1pwYXZCeWZQcUtqcmJCcnhnbE5JWHkxdmNIa1hNWWpCWDYrTjVyRHY1?=
 =?utf-8?B?SDI0WXZOakFJS2ZlNFRJTER0OHl4Z051MDJPWEdBQ203cFAxSWVNZnNlTU9S?=
 =?utf-8?B?SGVyL1BmMkpTa0pubnBjN05ScTVRWnVGNmx0aCs4NFpQRnBqOGJNNkJxbDFU?=
 =?utf-8?B?blVtSnhUY2NMVjkyc1Z4WXRwbG8rYmxYZFJGS1ljV1k2V1R2a2I5RGdlN1hI?=
 =?utf-8?B?d1lNNDNzU0g2eHNWWHR2NUxzV3pqWnBkekNDdm1qcXN2UWE2WTFiK1J0bXlP?=
 =?utf-8?B?RExqZjRDNjNlelB5NGE5VWc3SVRISFE3VG1kNXdGeCtSUHg2VzRMcUFKUWJN?=
 =?utf-8?B?d3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e57adb8-4e71-45eb-555e-08dc0d86568e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 00:36:21.0086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iT+1uNTFcynxuvhUuHlZbQUzbkW3ZdVnm6WMXmuYBkps3az807sURWgTyF11OGRM/ZxIYOOswQuKLeD2axGU88/VrnKRzt35RrB0mHYtUV0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8200
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 1/3/2024 10:15 PM, Nilawar, Badal wrote:
>
>
> On 04-01-2024 11:36, Belgaumkar, Vinay wrote:
>>
>> On 1/3/2024 8:56 PM, Nilawar, Badal wrote:
>>> Hi Vinay,
>>>
>>> On 23-12-2023 02:31, Vinay Belgaumkar wrote:
>>>> Don't set SLPC GuC feature ctl flag if skip_guc_pc is true.
>>>>
>>>> Fixes: 975e4a3795d4 ("drm/xe: Manually setup C6 when skip_guc_pc is 
>>>> set")
>>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_guc.c | 7 ++++++-
>>>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>>> index 811e8b201270..0e112b144ec8 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>>> @@ -62,7 +62,12 @@ static u32 guc_ctl_debug_flags(struct xe_guc *guc)
>>>>     static u32 guc_ctl_feature_flags(struct xe_guc *guc)
>>>>   {
>>>> -    return GUC_CTL_ENABLE_SLPC;
>>>> +    u32 flags = 0;
>>>> +
>>>> +    if (!(guc_to_xe(guc))->info.skip_guc_pc)
>>> Frequency attributes freq_min/freq_max may not work when skip_guc_pc 
>>> is set. freq_curr also may not work. I think these freq attributes 
>>> shouldn't be exposed for skip_guc_pc case.
>>
>> We already skip pc_init() (whihc creates the sysfs attribs) when this 
>> flag is set, that was in a previously merged patch.
> With recent changes in bef52b5c7a19 ("drm/xe: Create a xe_gt_freq 
> component for raw management and sysfs") attributes are created by 
> xe_gt_freq_init() which is called in xe_gt_init().

Yup, good catch. These patches were merged after the skip_guc_pc flag 
was added. I have sent another version of this patch with the fix for it.

Thanks,

Vinay.

>
> Regards,
> Badal
>>
>> Thanks,
>>
>> Vinay.
>>
>>>
>>> Regards,
>>> Badal
>>>> +        flags |= GUC_CTL_ENABLE_SLPC;
>>>> +
>>>> +    return flags;
>>>>   }
>>>>     static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
