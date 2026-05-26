Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF86ECD5BCF
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 07:58:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D7110E472;
	Tue, 26 May 2026 07:58:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n6p2Pwvx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 647E010E472
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 07:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779782320; x=1811318320;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=31PXeKf1CVabCkDzbhPAaX54d94qzpFarDrj0LcHT8g=;
 b=n6p2PwvxBDmHZG3m+RUX4QnCustti+NaJ0saAYb+QHKlzhdb//s96KM0
 iK5kEPx+MlwZd/geUjdUdr6EXmTzF9/UKPC2QSvxvYrBkk8dP+GNcM53K
 X8fTEJ76fqBdCQ2/6PPmnqTQMhnrmFJ6/kVcfE3eoM8KLHhImMiWcrTba
 2w1uUSN42F94F55tSIowKEz/sygYq8zEjgORpSw4FRPPwd6pysDVwDCfb
 TBPrt6Iu/gVv2JSoDQNWrvm1MNvOVfI8fw3N83/pc0Y6a6HHQOEWyMlur
 jyOxwDyYwf0LRI9hjbR6E9y/ThQCSNuzjcnkIeuWHo4ZaMf3h0a+f0P1h Q==;
X-CSE-ConnectionGUID: O+K1UI2tRkKajQkUHCmWuA==
X-CSE-MsgGUID: wrMV3ulQTfCJjViw43t7Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80647141"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="80647141"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 00:58:39 -0700
X-CSE-ConnectionGUID: CFq7O94NRU+TsjFckmtaQg==
X-CSE-MsgGUID: /Ximu6TnS/6Y8j7bYrVpHg==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 00:58:39 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 00:58:38 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 26 May 2026 00:58:38 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.12) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 00:58:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HJpswAfoYxBQbImUgQrQn+9MrGOlLAY0sUi95TZQsX6tWX5SoYmJjW7Tvr22QiF59mstgPi4BQ0WoQdxflO25ayJUXS/xBO9Nvy8p/f8BVDiNY1CcNsoKnXqpt+2uf3W7+ORncefgSsy96uMXCcvtO2CIV1WTbx8hdp2rH31qgwHFPOVbwGb1oZa0RB9tbKk/nvxcD0MrAI+BSLOiKQfNtuNLyHeMraXwSLjEllziacZHpPhdleRciqcg1BdQH0aEBKvpRlESXLyzlsNmJYVLmg+IBizfdZGhatKOoQP2e5VXQpVT6w7fG0itifj8vAhBK3lE4scw4GJcds8vjfGBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+BLEg1/7BlT3lHHNbrJpKDCQQto5Zg1VcRtFC2DKAvM=;
 b=TJwR7AuRVNPfp0xOdnSWG2R4TQWziJm/6HVZ3VN4IbC7v43Mb8qjEFF5PyBItWnJMBwixKnaDvPJtPcWWNSwgbBpvTUI3mk72ElItOTkVk0EE8s9yRDo/22m8o0sVpnAAewqi5QeGdeWn9q0+4t+qouglrH4Hj1Gb1MXAMNH5kgXrfN6iFVCLENN2p+YUCHhYPpoD4IGHEYi3xhGk+dYasGobAAp5oCkSoFULIKM0NXzmT/WXFrPHEcBLjWJfw0QVpigkYKiUo2yHuK/v4qGQt6Slm60a0g8v6druTV6gwVIEYYQXyaY1pacEfCuF06j/DvfEYHiWufFf+rnfzaXNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6)
 by SA2PR11MB5020.namprd11.prod.outlook.com (2603:10b6:806:11f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 07:58:33 +0000
Received: from IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::6021:79ca:45d2:ae46]) by IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::6021:79ca:45d2:ae46%6]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 07:58:33 +0000
Message-ID: <0bf13314-f5b0-4e00-85fd-445078ad927f@intel.com>
Date: Tue, 26 May 2026 13:28:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] drm/xe/xe_ras: Add support to clear error counter
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
References: <20260514052205.1340143-8-riana.tauro@intel.com>
 <20260514052205.1340143-11-riana.tauro@intel.com>
 <agtTMBeI6mk1d7Rd@black.igk.intel.com>
 <88f42243-af5e-469f-9769-aa5dfabd6740@intel.com>
 <ahVPukjUhC4Qrhs3@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <ahVPukjUhC4Qrhs3@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0258.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21c::11) To IA0PR11MB7955.namprd11.prod.outlook.com
 (2603:10b6:208:3dd::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7955:EE_|SA2PR11MB5020:EE_
X-MS-Office365-Filtering-Correlation-Id: 88ef1814-6ee6-4daa-32bd-08debafc953a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|3023799007|11063799006|4143699003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: FJ8+cmKYbzfMEHZx9Tfcs6/mmmKtB/Vd2vItDkmUle/wE84n19VQYmj1QGDi1uMmfzsUhm1V4JkzOcqT121he/+W2ybJKUujMiNSwtQt6bCQDKrP6x6uQqikgGHr3aplczXcR0KpTrDbrA/nYJM2MOaQRR4Nl5qEnjcybntoW9b8dOGV/o0xBG1skYA4IFA30L2Qiwkt492cdNdshG8eHgwju4DadZOK9n7w8IdTTJoziBSRPuJ9amblD1y5baN1D6N4y7Y9X7Y1M8N2IwaSDSROd9JlLoEWlGyQ92VkLCkpRKoTcb0oO1PhOLdr1NkyB8REWMo92QG6Ui3zID9QpjmlYu6tVC8UEasza9PInHR+dfRogWIEPk5SLwI235WKoC3qG7ZtFAaD2+L2AHEVhlTr+fqSRSkcNa4xNuNSOCFZRwgEquAJrLWzCyjg4qNXOyiKkY93iqrJVtEc9+tQALVdxoA0J7hvfgNPiaNgEMs32COmFI++TFxy/YVb7m37sPLDFPCsf4ZufPQ7xDBZBRogJ4geGGBSpRf2WgJgHanDKkwjPvdbVbb7VXBzynLc4IEelyDw8t8gncrhGjhbLKNuLo505EQNDa3S+ttfZGewMwnS+sHcmsiT5V9aNxQMbsKSDU7qWqpqfG+Vvy4bZZLIW/QtNCmGQRM7kWn1rKcwmMwXb3ck/fKwfEMJeKXx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7955.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(3023799007)(11063799006)(4143699003)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWVlRkRHdlVYejlOMGR0RnF0YkNuOG9ISzdPUjRkOFp2RlVmdklyT0VENWZq?=
 =?utf-8?B?YTdDYlFCU1J5SHBEbzBPK3J3eSsrR1JqZng2YUwwQktvN3Q3dDV4UmlYMTNY?=
 =?utf-8?B?Qis0bHdYRENnMkk4OHBKNTVkS3g4aFc2VERXcGdSTnBKTkNjbHRpeEtzdXQz?=
 =?utf-8?B?N2ExcmhtcDNzV0tmYVZ0Z21peTg4Njc1dkd6YU9YcUpPTEkxdW9hMzhMVkFL?=
 =?utf-8?B?a3lEUC9ROTlNN2JlZ2xvRkFybHVjY056T2dTVXZrM3JwSEwzTjNEMFJqNXlt?=
 =?utf-8?B?Ti8xVEFTS3lnWUJ0Z1Y5aXpEMll4VjhTVmxpUlVCeXFid01aVldNSml1MFNU?=
 =?utf-8?B?bEVhSDJpbUVNSFVjbHpDaG41UFVpd1RNaHJMNFBHa21YcVRpOXlCU1A4SmRS?=
 =?utf-8?B?YmgwWXJDQ0orU1VveUQyWURtNlFvWGVzS2wzT25Vank1a0xZc3psMWFJRkhG?=
 =?utf-8?B?OEJIekliSFlFeWk0Zkh6dTRDalhadFluUld5QkJnWWZCb0E3ZUZacGIvdVBD?=
 =?utf-8?B?aXoycVJUR3RuZ1lvZWhESTNwa1lNYjhxYWpob3lXU3c5ZUJibk9hbDBablFC?=
 =?utf-8?B?NURCb2l6dGtzMmc0clRXRHVMT09BR0c3bDN0ajN0RGQ1azEzNCtwOVoyR21X?=
 =?utf-8?B?ZlZFVmQwemxQdktHVXFyZU5Xdzg1VjkwNFNJanVGbnZ0RTVrN200b3dLWm90?=
 =?utf-8?B?RjhqSlVISU1ZS09DSFhFWGZKYUlnT2ZQRm81NURoMWFjeDFhU2tIMGdtN2Qr?=
 =?utf-8?B?NzhnTFFwQVo2UHl0OUNxQUpTM0FmUzJ4NDJrUHpzNExPbTR0dThmYTdIcVdB?=
 =?utf-8?B?OC85cjBsdkRXTmJDV0dvYnZDRlZkN2xqamwwaTZOSDVYRTIrWHBqSTBVUWpL?=
 =?utf-8?B?a2l0cEQ4SjloR3QyeHFWS1F6TU82VldEc243TDNRU3p2Q2hzR2lxTVlMdHFt?=
 =?utf-8?B?azh5cHRHY3k4a0JLTi9FdDRyNFFZYWM0dUpzNk9wRi91b092VitNZHpVZUFI?=
 =?utf-8?B?RmZaYyt4Rm9UV2JOYkd0UWE0WGhIdElvUFArcVZwelhqWW5mU0UyYUorQ2Vw?=
 =?utf-8?B?RkFHVUx3V1RMKy9BSkd5Ukx1aS9lSlZyN0pNT1hJUGhySkJnOUhBS3pFNnNx?=
 =?utf-8?B?ejJ4M1hjemQ3bC9sWGQ3anpmYVY4dHNlMzRSbHZZRHdqaEczeURXeEo2aFVu?=
 =?utf-8?B?QWIvSUdjUVBzUmdsZGIxRnBGbXVpbEdOdko0U245US8xYkFpS3QrVGFNR0xr?=
 =?utf-8?B?ZTdLSXRmSVorRW1IaW5zV2NWWWZUZndNRGRadUlCZS8zakZFSE5aQU1vQWh6?=
 =?utf-8?B?b0pMMFlTeTI5eDRlSXk1ME9pS1FhOW50QWNkU3NzTGZuR2l0NTlsSlc0WjN1?=
 =?utf-8?B?MGlENld1Ukg1ZzlPOGFtOTBXVGVJVm8reUFHVThrWFc2b21aUFF4eEVUQ2hC?=
 =?utf-8?B?Yno1UGhHWGtDdnI1SkNyL0l2SnNraG5kV1o4YXlMSExWQk5TYTF5bDZSeVor?=
 =?utf-8?B?Y3BsUUpEU2ppekRFY2dheUpEOHVOdnNDbGFHK0JZdmorM1V4aE03NmxBdzUy?=
 =?utf-8?B?RFppUjVnb2pzbUlqUWJUeE1MNkVtK0FObVR4RTZTa1R1UlhmY3lhS2ZHVHBU?=
 =?utf-8?B?d1FTa3FxYi9lQS9Td1VpVE9ZWS8yV1V4UlZ3YUM4c0dsMFRuSWRDdGpNR1Zu?=
 =?utf-8?B?UjMyaklaTXkvcWl0cFZSWHhiQkhpK0REaDZhOVQyeTl2TUlrWTRJWTg3RHFG?=
 =?utf-8?B?M3dZL3RWbS9DWmo2WGNnZ2d0dU9Gb2VKOFdSVXZKQ25mVDd0bEVpQVNOU1Uv?=
 =?utf-8?B?dE1HWi8zdTgyajhaV0dPdzE0Y0hlalpGUm5rbUZNRThGMllUajRoSmpZa0F5?=
 =?utf-8?B?RjNJQ2U4aTZ0L25EUGlWNTVyUEowa1U3a2NteVpvK0p6SE9OV0pIelV3ZmN5?=
 =?utf-8?B?cEtteER5dTAzUHYxTVhWaWZTdnRlQmhINjdkYTBwell2R0NkZjhMOCtDMS9z?=
 =?utf-8?B?cEZhVjBDNGFlcFNrNERGeTY2Z2VsbFZ0TjBFcUx4QlhuYlVRaXNMNXNya3Bj?=
 =?utf-8?B?SllWanJyOXVuNm1Bc2w5TzIyZU12K0o5OHIzSU51V2FMdnREck1rSVRZOVpK?=
 =?utf-8?B?c0o2dmhxVjVYdnZ2S3VmK25iYWRBcCtleHNLbkMwWWhydDhkQXA2S0t4UDUz?=
 =?utf-8?B?eVFXN3UrVHlHMlV5VFR5dTJoTWZ4WjczbkxYYnphL2RMenM5c3RYZFZMMDFr?=
 =?utf-8?B?eFhIT0F1ZGlVMEVkNnNNZXpYcHRRdVVrM2ovbEhYcVpCRWI3b01ISk1JMExR?=
 =?utf-8?B?ODRkZ2phN0M0MXhUSUk1STZrR05XcE16dXRFdXhieTBhcG04OWFZUT09?=
X-Exchange-RoutingPolicyChecked: JIRVCcj/IPybx0p3i54wnHnnI4pzAC3E9LY51AHN2HdlckYvo91YqD7c5jWsrkbKhMUe54yyxFRAUyducJ+jyfw19bEtJcXUKmZEKpdClDWuauU8OiMLZUwGxcWy3/UqQ6sFVgE18lZdBeIt/2VNMer9VQNyLu/dynmg9UunS44o0cvrFP0GEvMq66S1Gp5XNiHR1hieaUkrD1Jha8GGMWN/hQwDAvXmWesSUe+LkIs7cZEPsCPrrXgKMlOIxJa794ODbbIeVIZj5O+ep8KJfWykfZCx+h2Nj27xr5zM43Cw9Q6cNx//MV8GHhOb1ZYZON7my5nJmq9HSBwz5+1RwA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 88ef1814-6ee6-4daa-32bd-08debafc953a
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7955.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 07:58:33.2732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8brAxBpDkN4bi5NzOiauQYwVNMsX4+OjE2J/qpl9yO9G6qACp7QwNCO8tZn0F77ym2ide4VgrHdhbXH7TBByOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5020
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


On 5/26/2026 1:16 PM, Raag Jadav wrote:
> On Tue, May 26, 2026 at 10:45:24AM +0530, Tauro, Riana wrote:
>> On 5/18/2026 11:28 PM, Raag Jadav wrote:
>>> On Thu, May 14, 2026 at 10:52:09AM +0530, Riana Tauro wrote:
>>>> Add structures and helper function to clear error counter value.
> ...
>
>>>> +static const int ras_status_to_errno_map[] = {
>>> Nit: Redundant 'map', just use 'xe' prefix.
>>>
>>>> +	[XE_RAS_STATUS_SUCCESS]			= 0,
>>>> +	[XE_RAS_STATUS_INVALID_PARAM]		= -EINVAL,
>>>> +	[XE_RAS_STATUS_OP_NOT_SUPPORTED]	= -EOPNOTSUPP,
>>>> +	[XE_RAS_STATUS_TIMEOUT]			= -ETIMEDOUT,
>>>> +	[XE_RAS_STATUS_HARDWARE_FAILURE]	= -EIO,
>>>> +	[XE_RAS_STATUS_INSUFFICIENT_RESOURCES]	= -ENOSPC,
>>>> +	[XE_RAS_STATUS_UNKNOWN_ERROR]		= -EIO
>>> -EPROTO?
>> This is protocol error. Would be misleading to userspace. -EIO is better for
>> unknown errors
>> indicating an hardware error
> This will most likely end up in user land, so probably worth making it
> distinguishable from XE_RAS_STATUS_HARDWARE_FAILURE. We return -EPROTO
> for similar pcode cases, so I thought we'd make it consistent but I'll
> leave it to you.

I do agree with this. This was my argument in the previous series.
I had -ENODATA as return to distinguish but mallesh had a comment that 
it does not indicate no-response.
I can add -EPROTO with a print unknown status

Thanks
Riana

>
> Raag
