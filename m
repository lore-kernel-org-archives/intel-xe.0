Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5A9CD343F
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 00:09:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C2710E060;
	Wed, 13 May 2026 00:09:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SsROnG43";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53EA810E027
 for <intel-xe@lists.freedesktop.org>; Wed, 13 May 2026 00:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778630946; x=1810166946;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JEivUMASB6x/EyPgSOxRhAKLVcRgwWrrOsnPUIIeZ7M=;
 b=SsROnG43Kcxlvfd643LJOwgqbKt1W12LgS3ddxwJ/JV7Px5njJ97KdNY
 HR7o9UIOrdv3FEi7TtfDUXoGAi6REycjazJShJ/rw+ukFcOEO7DQvhBrm
 JUG6fBsW7lqbyjNypJGMlEb9GH0aMg+Ej9psmQ/Bf6PvensY6Alfa7Vpb
 PBLtQz/LjnbYjyTg2A7lrc/FyJBo9kfhq+oEmM+p0KZeqIni5T7RyLodp
 BFu7mGq/97Y0gAYcjGgpNTuNHhbwtdJUm6luCAymv2DXxmPiqsHecCm9k
 EHx+VWw6O1GBnXGhpzNxn/6YOjFXJlrNs4HNE5ccOhJDr1+G8ljI9nWPo g==;
X-CSE-ConnectionGUID: urJn92sxRIq6L1fgKiiRtQ==
X-CSE-MsgGUID: D8HTJ3L3Q3KGDZdJWFUxew==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79572617"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="79572617"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 17:09:05 -0700
X-CSE-ConnectionGUID: lplNyM3HQeCJbNSGjADzag==
X-CSE-MsgGUID: iK44JtzlQGWeVD1nRVVpzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="268266320"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 17:09:05 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 17:09:04 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 12 May 2026 17:09:04 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.24) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 17:09:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wr33+PuPzB9QzPVJV1g5mSDevXHfcKRHi8/00tMJ7n4DytEEQanNJFsWpV5Nx/P+JFzTr76jhG8X1HmHsqMx6B7fbdz4D8wLErYDCdBJ0Zn779JR53tpZvpeKa6YvoNwBjadoQY+t7njyPa5AbR5K9+4Rt14mUvRx87lVW485Qouy6s2jVgdCFvVVKQL0wJKckoX2OVXtIxkXNyA86oPe0yLwIpYcY1YtfCI6Cqdfa00Vs7JkCAhVtcT0MUj6mVrhae4bLuJAHoxzR8Ry9OtZWsbXoVfL6SXuklAXOfRzVnMln26zuwjGM9fHWPzz9IgBqdxuiXAV4pd/x19LLeosQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9SHBNyv3R33Xxae++Cl0lkZY6thW3vsRlLiAdZcH1o=;
 b=c/IiDCkAUmZVDTq2zb8YSeYRsB6qfZ6NXwxeaIX+W0WKBrwucapSFz6k6mtZ2j5oxaUJjaW5dIFM4h1BR79FmWq8BZjbl2HjSKaoZdxN9kC7EDMspLTZqwsC20enOUYDvsnWomumgmR9eG+CM9nDMFe1p6+25YHBTf90onXChcxGozI9vns9NDCeCpCHs3LlbnroINdTn0X9BLnhuj33qpsX56Ag77D8scI2aIE9kXc0nfAg7G4cQsl7K1DDD1zUXlam7WVIauZQdi4FoeDDeFmlWALqfadQPvYsht4ZFlvqSKVBZQ1b4e0QbpYetjD7UeWHifqH6FTifBqNtPDsnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by SA2PR11MB5146.namprd11.prod.outlook.com (2603:10b6:806:116::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Wed, 13 May
 2026 00:08:56 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::4efd:8324:f06f:5b70]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::4efd:8324:f06f:5b70%4]) with mapi id 15.20.9891.019; Wed, 13 May 2026
 00:08:56 +0000
Message-ID: <827126ad-ed22-4f2b-909c-b21c8df8925c@intel.com>
Date: Wed, 13 May 2026 02:08:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/sriov: Mark NVL as SR-IOV capable
To: Matt Roper <matthew.d.roper@intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>, Dnyaneshwar Bhadane
 <dnyaneshwar.bhadane@intel.com>
References: <20260331152259.58270-1-jakub1.kolakowski@intel.com>
 <20260331220744.GD183713@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20260331220744.GD183713@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI4PEPF0000015A.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::879) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|SA2PR11MB5146:EE_
X-MS-Office365-Filtering-Correlation-Id: ff2e50ea-ffe8-4bd7-4bc2-08deb083d310
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|18002099003|11063799003|22082099003;
X-Microsoft-Antispam-Message-Info: rrncxCfh732Qa9FX1HeHhMaEAYfAZtEuUtatJnckO6BA2gRTUPJB8JOWDm4TVgNPZL/SdosdWY2qjlewggRRa7HXTRlchXTseRbC7NEqVLlh/qSEIm5zU4+QBo4NrB+3JwQxmejdwWe0+gXv/4txWefqIuROALnZxTrnbKceLbVAqBcr4eGLGOzAYsSCM5rqV80ZRaYJd+meQf50CAt5P9DF6Vx1NMsP6iZ1D05lKtzqbHiQF3/0pLz7Y+jqjfHgsAx64PAitRGe0rPpIO9zJykFjl593MXGt0DR12U62fWOalbna+xagUbsXn6fBLTv3ZzyaYrA2xwHOxC/M0KEAWaij06ebVAqaqsHUSf4l4wyK+7VXWYZ9RQx8EepTraRTJl0II1V8pp67HmNRItdUsw1xDMfLgCd05eju+nNfIdMikPgG6UbvFgKoOU8JBjq0IvG1Fk2N/XrlJQEK538FCWFzG7sUk4zvIzJK2csWxADGh0WYwwJXeGgPzzXlE6RrAt+SNNvYr26PzMKdff1vItekCor5aK7EqYtGUQfv/VlmbKXxu0G7H93VRibAU/3O7jcJiTw9PuDTupQfvSKiyyo7El6DKHNLGRszzmohesMbu7y6kR6+C48oTmV+YmWU3CK/qBL/oXsLyWYU9gaLWFYLO4SzLslk/8KMM9HxinvLxg1xFhuG5vnk7qftKGm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(11063799003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b256REVqUi9ja3Nya1U5emVGdFVHMXZHRDd2ZWpaaFZLM2psQzBKeHNjU0VM?=
 =?utf-8?B?cStpcU9NUmcvZnYwRy9udjJwSjRmdGRYMEV4RGl2ZzViS0xzamQxMTl0czl0?=
 =?utf-8?B?bUM2aWxvbDE1SUVja2pvSk5wR1RUTWE1OVg1N0hMMjU2ZHAvSENwek1BM0VJ?=
 =?utf-8?B?REh2U0oyRHdGNTFlM1dXbkdMdWJtc1JxK2c3VElCakFkUDUyOURJNGtTVm0w?=
 =?utf-8?B?MlRxYlhFeXBtV3l4SGVSSkkvWEdDeUJGRzlTa0ZsMkpZa210ZFBLd3pTMk9F?=
 =?utf-8?B?WjhORTQ2N3VOdW1JKzBDcFdhUjZCYXlaR1lKcXRjWUNudmx4dEdLOXZrei8z?=
 =?utf-8?B?aGp1cFlNd3VKUVdVcW9zcHFoVW14VHRpdW5YTmlNc1NPcHZxNStocGtmQkdO?=
 =?utf-8?B?cVZYajA3eVlsdzROYkI1UzJqSUdSam1SUy9RUEx3bVlJeWJSQldRWW1oaExK?=
 =?utf-8?B?RDMyRm5jQUlpaERBVGlqTjJTMHgwSTNuYWJRbEt4ZTdNRnN0N2ZKVzdFZEJm?=
 =?utf-8?B?MTRYM3B2Ui9KRi9ieW5JNG1IODlTNCtIdUhwbDVVT0kvWTRCWGhUMFg2M1dj?=
 =?utf-8?B?eFBydGZVYXhMaUlTYjErT1lNMjN0SERPS2xjbmduSkZSV25NUVlVMW5zYzhS?=
 =?utf-8?B?YnZ0ZGZGcHhRSHM3aklEelMxNFgrdGYwdUM2ajV3RktuZEliQWtFcWlvSVdy?=
 =?utf-8?B?YzVoUEl5ZUZBOXNYcFo2aGpxOUdhN1N6N2xpVWYyWnpkYWRWMnF4RGVrRm05?=
 =?utf-8?B?enBlNG9oelJiNTBWc0pTYVNzemR6VmhPZXR0OUFJWTdWczdJT1hYakhvV3NK?=
 =?utf-8?B?eTJBay9jUXNaeEhLVDg2bWRQU3ZXSkFiOURBZHZhSkk4L1o1SU5YVEtvTWRL?=
 =?utf-8?B?RzNxbS9qWGIySTlNZlFEWGxBNXg1UnFaTjNTUWNjRHgya0tLZHQzWWZZMVFE?=
 =?utf-8?B?QVNyOVdpdkFmWklsNU95S0pzRE14SS9tVUlrSXRmdStQMVIrWVRZUzNSRWtC?=
 =?utf-8?B?WThOL0ZYL3VITngxemhUYXVTcStaTVQzZllHNWsyaVZMd21qZlNKR2Q5Vjky?=
 =?utf-8?B?cjNwNExQU0F0bkkwbzZySTFQS01PTTIzbVN6dW96T2RsR2VpZWlleGFkcjk5?=
 =?utf-8?B?bVhWM2k2SnZMampmNVZURGVIaWs1Nyt6d1ViOHdldkJJQVQrY1VmUVU2KzdF?=
 =?utf-8?B?eHZZK2QvM2pUZzB4aUR6aHhBZkw3VVdwdTJGM2Jnc2VPbXQ2VWZ4dDFPbERY?=
 =?utf-8?B?WU1IeGhMN1d1TitPV2hHUWFxekZ3TmpiczJ0NlFqalQ1bE9RT2F6aHZzbGxM?=
 =?utf-8?B?bVI5elR0T0NyWWtqaXlCQ3VmbDM5Y1l6cXdkRTNvUG9aVGl5eTE2RndNRm9U?=
 =?utf-8?B?djczeVNYOStsZEIzRlJWTDNTWUM1ZGNmRDBpZ0lBTk5pVlBIQkNZeGN1bkpl?=
 =?utf-8?B?ZGRWbG5uVEF1UTUwUXhoR0tJVkdzMWZrNG5TRnpEeFJkZWtkeDZ6MTQyWDdC?=
 =?utf-8?B?NTFiZVN4c3BTR080VUNabE5qajZhNlFWZTFzalVyOVRZUzY5MW9LYkc3M1JV?=
 =?utf-8?B?YXJRVkN5QWZqQ1B6K1Bkb0lTSEtCVU9JYmV2M1krZGpCclcxSTBCdk1GaVha?=
 =?utf-8?B?dGpMdEpVcXJuQldzUTd0TytnajFFRDhHcEEvSGQ5SEZOZmpMTERMdFJZK0xD?=
 =?utf-8?B?aTNoa3h3UFNwMnlQdlhhVGsvdkU0dVJPZ2ZFYThhTXlNWU5ObkhDaVRNY0cw?=
 =?utf-8?B?ZG5QOFdLYVhDYUhzelpaWGRsbXZnblRJZk8yMGtzRUFwbzJrNFU2OVBNMktj?=
 =?utf-8?B?RWNiM2x2c25XQlIzVHpEMFRPVHh5OUFrdHNmNTBaUXd0RVcveHNSM1MveStY?=
 =?utf-8?B?eWNHMnFPMFFsTHlSTyt1NVFlcXpJdWJvSWpNUXVEcWJwdDNmSzMrZ21nWXR4?=
 =?utf-8?B?VTV2ZHFsZjZpSlBsc2VCdkJBYVk0RHBQQXJ4Y3oyUENWUCtWT2NIUFRqV25o?=
 =?utf-8?B?dkpiTmVDY3NQSG1ZZEpEeVhMNUl2UEQzRDlsZUt6RHFCcWRlaVFZblhITlR2?=
 =?utf-8?B?c0V2bEJvWEdwZDdWZUc3UVB0RmFvODA2MGRhbTNrb1ZXQ2hGSEtqMk1GN2Ey?=
 =?utf-8?B?VVZmUEt0N1hUNUZOMXd2TkhiZVFXQ2dVNER6V1VxcXJneTU3SnBGVzZXY1d3?=
 =?utf-8?B?dSthZGFYZlVLaFY0R2x2eDZLc1J3NjZFZWlUVkVid29kelR3YlFVRmVCRDJq?=
 =?utf-8?B?NFhFMFk4cStoTnZNSVgzLy9IZ003QjVRMnI0eVBIR3hOcFNQUFA3V1hXWWNr?=
 =?utf-8?B?UnFoc3R5MmxOV2llWHVSTlZtM212K0J0Uk1adjFac3VsVXY2M3Rmdz09?=
X-Exchange-RoutingPolicyChecked: UU9HpI5IOxYH0KqYeev7DSph6+7T6jM5/VvUBmF0QK2jWvJBnNEGKU6Bc/oDcsz4w89SCmAAErCJR7iFks68QbDw/sovLxpt5GabIr9BjzHrMNtlAvqDAIxmn7F9r7OScxX8CV9ZG1xv6YtNOOsq963L5xlgUvd7Y09+iHXWKYsItyv5oz4Gw0jGto/XifxdBkB/+VI0ti4f68TuJdNU5nhVG0RFfuMEq2QfoOVu84sWnBe+4IFMDMk7j4n2awWo726R7eCLc8jVp/U0tEDi4T6nidlAvCPiFbfKU71vgQo3a5/2+mMtJQNO17ek8IPcNH9CHV5T9dMKj5a7Xm/LwA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ff2e50ea-ffe8-4bd7-4bc2-08deb083d310
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 00:08:56.3987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PVFR+qzP18pJKfjCXKL44AarJjBgKw7XqQZR/LVNTvpEJgz4oWER8T/68K9UPgpe8s3gjvsxrXu6tOmIPBIQQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5146
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

Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>

-Tomasz

On 4/1/2026 12:07 AM, Matt Roper wrote:
> On Tue, Mar 31, 2026 at 03:22:59PM +0000, Jakub Kolakowski wrote:
>> Enable SR-IOV support for NVL platforms.
>>
>> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
>> Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pci.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 1df3f08e2e1c..e7d7f0b6b998 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -443,6 +443,7 @@ static const struct xe_device_desc nvls_desc = {
>>   	.has_display = true,
>>   	.has_flat_ccs = 1,
>>   	.has_pre_prod_wa = 1,
>> +	.has_sriov = true,
> Since the structure field is defined as
>
>          u8 has_sriov:1;
>
> it might be slightly more idiomatic to assign 1 rather than 'true.'
> We're a bit inconsistent in the handling of the other flags in these
> structures as well.  Anyway, it doesn't really matter that much, so up
> to you whether you want to change it or not.  At some point we'll
> probably do a general cleanup to handle all of the flags in a consistent
> manner.
>
> Since we don't have CI setup for this platform yet, I'll let someone
> from the SR-IOV team give the formal r-b on this patch confirming that
> we have everything in place necessary to flip the switch here and start
> allowing SR-IOV use.
>
>
> Matt
>
>>   	.max_gt_per_tile = 2,
>>   	MULTI_LRC_MASK,
>>   	.require_force_probe = true,
>> @@ -481,6 +482,7 @@ static const struct xe_device_desc nvlp_desc = {
>>   	.has_flat_ccs = 1,
>>   	.has_page_reclaim_hw_assist = true,
>>   	.has_pre_prod_wa = true,
>> +	.has_sriov = true,
>>   	.max_gt_per_tile = 2,
>>   	MULTI_LRC_MASK,
>>   	.require_force_probe = true,
>> -- 
>> 2.34.1
>>
