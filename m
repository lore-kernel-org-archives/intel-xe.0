Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 582C2C61DD6
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 14:35:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A8A10E55B;
	Fri,  4 Sep 2026 14:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jpxc1q0q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C4510E55B
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 14:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788532511; x=1820068511;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XIM1VGVPLQmOpQdVG6/4ynnQfXUDO3Orp6GdeJQF5XU=;
 b=jpxc1q0qOD7SP6+FVlKTQabIkC3AKW6YeQr6Ktq6dAIpvbos7+S6h35+
 9Nus8UNZlzcW2YaIKAkJnyTudZfkmcAYgD8tOpUMOMDFoiKeU9SK8WqN7
 j0VOV+tsYD/BM6fMq0nA1R6eV+NllTV0Yl7oYAuaR41/LhVjwM4w770aD
 dAqkAb0JvJg85jImxqDtYzxjcwtLN9KwdLdQEfaYFob4fEUo5xzUX2MI/
 LBY3WA5Gbvlq0a6MFJxNpc0+aaS9QdGKLJcG1iA+svCuONZRvj4+5fHDD
 QkqvtPKhLDD52Iwut8G5aEVHJWvYXARhUfrKmVUD7KbuS665Yya0RhUtr Q==;
X-CSE-ConnectionGUID: tsmCVzDiRk2IKBrm5RGz+w==
X-CSE-MsgGUID: +RLeOOg3RGW75KvOVhzAzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="87972953"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="87972953"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 07:35:11 -0700
X-CSE-ConnectionGUID: aAwXVr8yRnOo5z/2zJHXHA==
X-CSE-MsgGUID: RIiISBlnQ5KYeS9kvKkXaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="268316027"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 07:35:11 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 07:35:10 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 4 Sep 2026 07:35:10 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.46) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 07:35:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OSUT6saJoyEIJ70bAvpqmYKzgr1i/XmO/BOFx+BA6BgwBkYlRvlNbU6GboZUPKJgoDerkTHWeJv3DZsPDDn/7J26DQMBlDbph91QCAvXAB24Gf7mGNIvbFhBeie2tLCZA5fCXeSRKvBu10Q4nY+gIWTjzXOXwJq5N2jfcrYPskRPmgbHMkqGtuKeWIPPCrq6QkArjpd5lLDoaGqXWh0lUWCe23MvTfpNmgxakFG9TZ4OB6C8maTmDCAS+PQvlHTWSbJe0xu/4QReTvGbRC8c3bUoJmituFxEBob9A1MIJ0+L3S6v6Tqd0y/RxEqMD691d4NrRAefovXqYaTELTDXbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6NDqLK2DjohB3mATQZdsaP+vCdq29f54eTo6YRizxIE=;
 b=K662vGrLjOlhIZvTe3RnoFb/SatjZsz+G3jRHz04SiVC7mDXNRYb2nU8KMzO3/otk9x1hHi04kTrkuD/a4kIW63U4Jyiyf4Uu4rJbqLGV8ERy6yi4YpzI4QZj4xW5WdEqtYhIE27s90RZMLxX9v8SFaPZKhKGEeFkeVFzUHgVjrhn5koi4llYZBGu+djN3PooLPM/qykZhzlmGJNd7qwbBsw0mGl+L/KAj7cfLdMkNewJhT+qe6Pa5mb0sIDbRxbpXlgRcVRWpp34yJEL5M4ZURIPQGPEPINfPjKxT7mAPigJYfBvriNW13TMST+7Q5gVwYggtYe6TqpoIc9QlkPZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by BL1PR11MB5955.namprd11.prod.outlook.com (2603:10b6:208:386::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 14:35:08 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%6]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 14:35:08 +0000
Message-ID: <b07e327d-4ee7-4b04-9455-29acaaf3772a@intel.com>
Date: Fri, 4 Sep 2026 20:05:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] drm/xe/hwmon: Add kernel-doc for fan control
To: "Purkait, Soham" <soham.purkait@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>
References: <20260717041757.2759084-1-karthik.poosa@intel.com>
 <20260717041757.2759084-8-karthik.poosa@intel.com>
 <5082034f-13f5-419e-98d0-a558a6f8d111@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <5082034f-13f5-419e-98d0-a558a6f8d111@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0238.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::11) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|BL1PR11MB5955:EE_
X-MS-Office365-Filtering-Correlation-Id: 30ce8443-ece4-4880-0a7e-08df0a91b7ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|56012099006|10067099003|4143699003|11063799006|6133799003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 0cnN5v/wHaQipbUpWq31En7qf2PBDXgpdO5fjoDF9r1K4PS7QPbxkvUmjtG3YeUltNeGQZouF1D62JrfIXYc82757zUsJpX9zjnz7RISV33mWbDlL5VenCYyhKZEQwB5qh4uDMmH/Ben0cmjoeYopWoAcbgG/sbv6F0RJDGiLixkV3wxUHvk0sKCN4qZ2DgHbWswjqjBFj550YVzdBnw0ayWOsp5/pE0YEt7mRqdbY5OHsVYaOajDDpoUDMT8Pu+yWPXp8N+cWSAbBcTSaq8igzlw5xL8bVygUurwJ1THTgeCOfZiUQIz81U/3U2LwYTVUS1JJ7vnim4Od0voD0gnyowc1SD74vsFdTR+2Ooa7a7B6PceS4pCauwacPyWCrzdPrgBXfVHz7JodXD88LgHW5hgbo7P0KVDgIDYPhfwq5BxLU4FCoOEvtqCwMzRQRz7PUDxJHcM/DaIr+jFJdRr/ZBEuvpiv5NhScrASxa0I2rXrZMs8qcIF6TU0ITnDnKaXABAiZgMs/LWd8K0e2Jkf01slxZFvW4GKk88GdTYyUSdx8ohqi2vVbh3vnYQr8xCH3sag7AD6a+RRalGjHys8XbNUwIfGvxS4loCBIlYl56P4u9zMkoMXr2kZ7LOhX0O1Cn1JYHQ/j7MQ8+eu75+fdBARXddT2w0v3PoweFj/g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(10067099003)(4143699003)(11063799006)(6133799003)(3023799007)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0pyamtCWnhWWG15cUVZMjlPZTZKT2dMOHZybHBpcHRSNVYvZHhyckptZWNl?=
 =?utf-8?B?cjFJMURhYzBxODR3aUxvdS84aytkdkNhRFFtTHQvc3UvRU10UkFVWjE5MVdj?=
 =?utf-8?B?WFlLK3NUMnFBd0lFTHY4VXBsMHYxaFJBMDdpbXFOc1RlaFAxSkdkWjNxcmhC?=
 =?utf-8?B?WE43azhGOEg5TS9KWEZDSlVKU0VkKzgrTkRWNUlTYzIzM2VoV0EzeDI3cmZ6?=
 =?utf-8?B?cEhKN2NlNDBUbVdXWlZRN3hBVUlpM05NQmRaeVFXd1RDN0U1b3NGS1BFN2lj?=
 =?utf-8?B?SmU3RVpnOXlDc09BR2VJWEYzYUorS3dtWFdlZHEvVWJxaHYyN29Ia3plaUM3?=
 =?utf-8?B?MXdXaERTc2l5czlSVlkvZ3R6YWxObVJVZUxtdVV2WnY1b09ES0V5bmRXK3ZO?=
 =?utf-8?B?SFg5Q0VmT2JlNVpta1dObzVReXFSTEV0TGhkYURRcEQwb3NFTUNEb1RsNUNW?=
 =?utf-8?B?QlEycmFwenZ0NjQ3NXhDQjhVWlN6WjcyTW13cS81SXRaMUcraS8xdVRJZGdD?=
 =?utf-8?B?bzV3WC8wcUxCT084MEFBN0M3eGFESlBSYjRMZmxaZU5NY292Y21URXVXUm1O?=
 =?utf-8?B?SlFPVUg5cW0yS2g3QTFXcXFqRVhqVVlZUGNPUmo5a204bWZ6VVhvaUVWbDFM?=
 =?utf-8?B?c094ajlCN1JhUDV3cjNCanczSWg0Rnphdmt3Wm1VazZETW82L05sa3VXdFQv?=
 =?utf-8?B?cWVqMGlFc1FlMTJOeGw3T21kNEpXSmRCRTNCUEhuNzUyUjFzOVp3cCtjNloz?=
 =?utf-8?B?WDdhcnF6S1ZKWEJUWnlsK3lMbUtia2tYYXlKSEh3dkVWSlorZVpsUXNRcWc4?=
 =?utf-8?B?WkJpdEhGU1BzNHMvRC9lSm1tblptamFxNGF6VjZ5aTFVSnVseldtOWdtdnU4?=
 =?utf-8?B?cFZLQmF1YTJqRE1pdWg1TGVvMDE0Rlh2dWdUSkR6Zm93T3VwM2I0a1ZlVUh4?=
 =?utf-8?B?a3I4bndxRTAwVXpQMHVSQ2xKdktDai9pZ05KdFBIRmg5R0hLWFZycXgxTmxI?=
 =?utf-8?B?NmZPY2htSStuc212VFFqeGQrT2ZPTDB5ZGJhK2ZsRGx2WXg1amxJVUdxK3Ft?=
 =?utf-8?B?TDE4cFE5VlUxTWVmSVZMcGhIUVVvem9IcWY0alljdVdEY0M2OWhDdVNSdFF4?=
 =?utf-8?B?c0Y1NlpFaHZHQjNsTmpjV3MxZ3NEZ0hSb2RrU3hQaUxsNjMwYzNxVXhpWm5i?=
 =?utf-8?B?bFRhY2U0NDBFRHZYYUIvSUdJZThTY0Jyano2N2lUV2pvMlNoT2F3T2FwSGZS?=
 =?utf-8?B?MkdhUzI0Q0tEbUw2WVAwNDcwQTJqT09wUmd3cVFlQ0lQSjJod1NtY21YZlB5?=
 =?utf-8?B?SUI0dXRiaXhuWVdLbVcwbk9ZVnZkdGlURHhYczBvd0FXRUpLRmh0UEZhMnBR?=
 =?utf-8?B?UDh4VlpBTWRNaWZEYlNmWlkzeGFYa3poSTRwS2NwRG8yM1pZMjZvVGpEOTdS?=
 =?utf-8?B?V2hwVDZrT2NlVDc0N1lMemI2VE4vaTVUN3hxR2F0NGZCd2ZEMFlIK3h1bFdE?=
 =?utf-8?B?bm9COHN0M0h6WmNsTjkvWHF2Q3JDd0dKMlZwRXZhcXNacFNjdjROSHRmM2xH?=
 =?utf-8?B?RThmSmVVRk83dFF4Nk5BeGRxWld4ejVuNUFaVXBSbGJkbzZvVElKWkc3NDNv?=
 =?utf-8?B?MlZ4SHlIdmtBR1J6QlBjN0M5MFcxZkNxWHFKaU9wc0k3TFRwQ2dqdG05dUln?=
 =?utf-8?B?WVlaM01rdzVsT0dHS0FGS04zaFBiandUVzJUMVVpREJONVVZcDkvSGZleGQ3?=
 =?utf-8?B?MXRXTXM1aFFaSHR5cWpEUW51RThoVHZiSlZlcnNVei9hTXZwQUZIUkpkM1FB?=
 =?utf-8?B?UWpyZWZnZ0w4OGd6OTBFT09aTERobEVGTkMzV3dpdUFnOFRyLzIrU21IT3VM?=
 =?utf-8?B?ay83RG84d3o2emVJT0I3NHhjUktPY1YrVEdpVzNrSDlEeGJGU0p0NWNQUlJU?=
 =?utf-8?B?dFZGeGR6OHQva0MrRnlZT1dVTTc4NzhiWEVWbnRTMDgweFhFNGZvRm11d3Fx?=
 =?utf-8?B?OUFudmU1NEZ1Tk5GcTJXdlMrckdFTVY5M0l0Ylo1ZmZaK0V4YmQ0YXNraDRo?=
 =?utf-8?B?Uk5HZDlOTFo3S3FFd0tyNDNncFVZMmJaVTJBL1JhcThkZzkvb0J5b244bGRi?=
 =?utf-8?B?RGVqTXM3ZjZXVWxQak5CbEo4TXE4OGpnVVdoTEdPWFR2NVphczZWMmtNYUR6?=
 =?utf-8?B?QXNVTEh1d1Z3RzQ4bStxWGVKNkpRZmIvUHNZeElNcHBIL2FaSmowYnM2V1Q0?=
 =?utf-8?B?Ync3SHFrLzRuZC80Z3Uvb0pKV25sWGV0YnBVSXJPcE9uL3FpMUlVNmZHWWo4?=
 =?utf-8?B?d1dyQWh6a282Q3hVam4zcDBPMTByT3NCOVVQbXl2M0JaYndpdHFuUT09?=
X-Exchange-RoutingPolicyChecked: 4SB2hUSeuIa+zL2wU53mBUcW4l1mvyFK+dZLJ39vUaw52Xdkprgw3of0yiRp5tomgeeus/vxU1B0wLekTyplSfBokP7SP5a8eF6jWgoemlZA3kkHut9qg3b4RSIagASglOK5ESua/57LskkhRV/kNK9HIOs7m0VMjmXUMFm4K+4FZvrqsKSTsCXLjLb+2E62OBCgRBtkZ+7yPSeYNJSVLE75eNEbWalb3iQpYnrqoIl5FdMmKlJbYFopT4YXHxmil5idCxfkEUBXQ0JFZNwIc+BmQh/UrZCE6RinOnM8Z0EaP6MjPSFywo1VoXgdm4vh+J+prJD1uqrEoyphZLoXug==
X-MS-Exchange-CrossTenant-Network-Message-Id: 30ce8443-ece4-4880-0a7e-08df0a91b7ad
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 14:35:08.1923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m+gDeh2puDQj1h1RYYLx/605ruHR7iE4mtnysvM43e79XdAnO14uyOLxTbYLiiP+6dUY4Sh+W9MRs8JPeDb3ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5955
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


On 04-09-2026 09:32, Purkait, Soham wrote:
> HI Karthik,
>
> On 17-07-2026 09:47, Karthik Poosa wrote:
>> Add kernel-doc for xe hwmon fan control and describe the fan control
>> model built around firmware stock tables and driver-managed user tables.
>>
>> Document the exposed sysfs files for fan speed, maximum speed, pwm
>> control, pwm mode selection, and per-point fan curve temperature/PWM
>> programming.
>>
>> This makes the hwmon fan control userspace interface easier to discover
>> and understand.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> Assisted-by: Codex:gpt-5-4
>> ---
>>   drivers/gpu/drm/xe/xe_hwmon.c | 43 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 43 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>> b/drivers/gpu/drm/xe/xe_hwmon.c
>> index a3ed139ad446..770f07fb6511 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -123,6 +123,49 @@ struct xe_hwmon_energy_info {
>>       long accum_energy;
>>   };
>>   +/**
>> + * DOC: Xe fan control
>> + *
>> + * Xe fan control is exposed through the hwmon pwm and fan 
>> interfaces when the
>> + * platform advertises PCODE-backed fan management support.
>> + *
>> + * The implementation tracks two fan tables per fan:
>> + *
>> + * - A stock table read from firmware through PCODE.
>> + * - A user table cached in the driver and programmed back through 
>> PCODE.
>> + *
>> + * The pwmN_enable sysfs mode selects how those tables are used:
>> + *
>> + * - ``XE_FAN_PWM_AUTO_STOCK_TABLE`` restores automatic control 
>> using the stock
>> + *   firmware table.
>> + * - ``XE_FAN_PWM_MANUAL_USER_TABLE`` enables the user table for 
>> manual control.
>> + * - ``XE_FAN_PWM_FULL_SPEED`` reuses the user table path but 
>> programs every
>> + *   point to 100 percent duty cycle as a full-speed override.
>> + *
>> + * The fan-control sysfs files are:
>> + *
>> + * - ``fanN_input`` reports the measured fan speed in RPM.
>> + * - ``fanN_max`` reports the maximum supported fan speed in RPM.
>> + * - ``pwmN`` reads or sets the manual PWM duty cycle in the hwmon 
>> 0..255
>> + *   range. Manual writes are accepted only while ``pwmN_enable`` is 
>> set to
>> + *   ``XE_FAN_PWM_MANUAL_USER_TABLE``.
> Could you please double check this claim ? Seems like in 
> XE_FAN_PWM_FULL_SPEED mode of pwmN_enable also accepts the manual write.

you are right,

we shall restrict pwm writes for FULL speed mode also.

current we are checking only for auto mode in xe_hwmon_set_user_fan_pwm()

1206         if (fi->pwm_enable_mode == XE_FAN_PWM_AUTO_STOCK_TABLE) {
1207                 xe_dbg(hwmon->xe, "fan %d manual table is not 
active, cannot set pwm\n", fan);
1208                 return -EINVAL;
1209         }

>> + * - ``pwmN_enable`` selects stock automatic mode, manual user-table 
>> mode, or
>> + *   full-speed override.
>> + * - ``pwmN_auto_pointM_temp`` exposes the temperature threshold for 
>> user-table
>> + *   point ``M`` in millidegrees Celsius.
>> + * - ``pwmN_auto_pointM_pwm`` exposes the PWM value for user-table 
>> point ``M``
>> + *   in the hwmon 0..255 range.
>
> Is it always user-table point ? What happens when mode is set to 
> XE_FAN_PWM_AUTO_STOCK_TABLE ?

1. Yes it is always user table point, stock table is read only from 
pcode mailbox.

2. fan curve point writes are allowed only in manual user mode,

see, xe_hwmon_pwm_auto_point_temp_store()

1388         if (fi->pwm_enable_mode != XE_FAN_PWM_MANUAL_USER_TABLE) {
1389                 drm_err(&hwmon->xe->drm,
1390                         "pwm%d_enable not in manual mode; cannot 
update temp point %d\n",
1391                         fan, point);
1392                 return -EINVAL;
1393         }

xe_hwmon_pwm_auto_point_pwm_store()

1492         if (fi->pwm_enable_mode != XE_FAN_PWM_MANUAL_USER_TABLE) {
1493                 drm_err(&hwmon->xe->drm,
1494                         "pwm%d_enable is not in manual user mode, 
cannot update pwm point %d\n",
1495                         fan, point);
1496                 return -EINVAL;
1497         }

>
> Thanks,
> Soham
>
>> + *
>> + * Writes to pwmN_auto_pointM_temp and pwmN_auto_pointM_pwm update 
>> the cached
>> + * user table entries. The driver commits the full user table once 
>> the last
>> + * point has both temperature and PWM values, which keeps 
>> intermediate sysfs
>> + * writes from pushing partially updated curves to firmware.
>> + *
>> + * Writes to pwmN provide a constant manual duty cycle by rewriting 
>> every point
>> + * in the active user table to the same PWM value, clamped against 
>> the minimum
>> + * duty cycle reported by firmware for that fan.
>> + */
>> +
>>   enum xe_fan_pwm_enable_mode {
>>       /** @XE_FAN_PWM_FULL_SPEED: force all user table points to full 
>> speed */
>>       XE_FAN_PWM_FULL_SPEED = 0,
