Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2588C47258
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 22:29:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 833D110E8CF;
	Tue, 23 Jan 2024 22:29:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2225F10E8B9
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jan 2024 22:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706048964; x=1737584964;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NCtG+Ahq7+6iSjMB7UmTKXJJWNm0uJu/M+sNm8L6P9I=;
 b=NPMieGVIPYt1ul8QS37kGySv/n66zXw2pwdDri3yUXzaAXTfKoiXRAxo
 y16xCasGuQ7FKv/6AKq42Gc68DJ+2tocZkeoQhHLkX9GA2DqI208/ApNq
 YRw6aw6G4oBouKW+fkI6DpOl+VHHfeIEzESN1Oz1PztD/10iEctCfCLbm
 vJWWVSe395TeVqVMMSmKtNdgIP9wldqRuxRryHOXygah3X/v68LV5stt7
 463uvsk8MO/J3qhWoQUXTxneT2wdjZuvHDmOZ+LSed8wPSnXsJsWxNzfB
 jXAJuugcfWoEx+bEFYmhanLcBeHLzYUoGa6YYlCPKFnSV4JtAdJXnQ7Xg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="1558590"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="1558590"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 14:29:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="1117426483"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="1117426483"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2024 14:29:12 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 14:29:11 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 14:29:11 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 14:29:11 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 14:29:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iiDkK1jSiH2NSz/aW1g3chA9iUlrZx49E4hC8syUAmFRE9YjuqipIAIDJ5Rthtj53atbncdGvs9chzJQfs10gm209L2QCZDQgBFQa+25MBUhk/xZalZQoL9Upk+MjP+WkjtmKfBSDU2oCe/cYZO/jFmNkwNQBD3Blp3QzhYoW2BBZiDa7BphiiWQ6Nht3N0hq7FZwrlHDZTWfyifszQNXavyULSraSLbr9pjEyIGTr3d5uWaFy2nebhxtfDC8Zo61Wc8iXdYpqzIDqGj2YB1ZFpMb45QwJeRKpk13uwBCVSf/g9mMoKe9/cteMAghl75Uof8EIPR2jhA7cTfa2156g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4hvHqmWls49TaQDkC4juosD+fNBQPswQJ9xYO9SEVLU=;
 b=WKfnSshaywv0+kKGn+2nxlnbfoMtr9k/glN1irnJ9h7jL1vyKt73Chfb23uln9PRdMN+zjshMWdgaPlTMpWWguuv1A4ai04VA9pcBa94Tvbi1H8GvCt+iAMSZSiO0eEAVK3I2zx/o4/8Zbb3aSwWnJeHVE6ym70gHY9oPT64Ijx2yN8Ymq4DeyTlZPzb5NNj7VvGg5IYqy5anDVmT/pNBqZzFB0h2MmaFOpbvaLX2CBT1DKOGMlyWZLooni4plPvDtsL1mjXg2cWTAclEjBVQbgUu59iO+NXEUONQF7jURKuQYrXRW3lAuzWVsb61x5QlyFE60wqbZ+uexWwBzfCaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8177.namprd11.prod.outlook.com (2603:10b6:8:17e::22)
 by SJ0PR11MB5055.namprd11.prod.outlook.com (2603:10b6:a03:2d9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Tue, 23 Jan
 2024 22:29:07 +0000
Received: from DM4PR11MB8177.namprd11.prod.outlook.com
 ([fe80::b615:c59:8ca6:160d]) by DM4PR11MB8177.namprd11.prod.outlook.com
 ([fe80::b615:c59:8ca6:160d%6]) with mapi id 15.20.7202.035; Tue, 23 Jan 2024
 22:29:07 +0000
Message-ID: <88ff92ca-99cd-42f0-ad99-3263a0e097b3@intel.com>
Date: Tue, 23 Jan 2024 17:29:04 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] drm/xe/guc: Add register defines for GuC based
 register capture
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20240119004203.393262-1-zhanjun.dong@intel.com>
 <20240119004203.393262-2-zhanjun.dong@intel.com>
 <20240122213956.GB7083@mdroper-desk1.amr.corp.intel.com>
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20240122213956.GB7083@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0087.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::28) To DM4PR11MB8177.namprd11.prod.outlook.com
 (2603:10b6:8:17e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8177:EE_|SJ0PR11MB5055:EE_
X-MS-Office365-Filtering-Correlation-Id: c18a0c5c-f20b-4e31-c4cd-08dc1c62b682
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zbFRP3sNHlkDGtk45+Lk3Ed6ZjeDZ5sNj23DtKBoMiLfJZnnDcqVV09V+jsNnzhBfCFB29U+CvKgiwEOVS1/evHIoX6Alneq5hPXAgVAnC9OYAeQRyAvm191FsYPbQNHY6xiWNDi4cNB4jFqTm9DY+er9l8gjpcZVHkKoaQWSZwWh6n/l6ruOe8jQKa7+931OT2br1P/VxIg3K5KweUVtkMFztqFU53swnl3RzrCLMAFqUCskg+bqJfIJXSbTpaCsx/6vF6pqDrOD2YbBfaPDBGTdLWEpP49hsdUQLQ5/NA8USF7cQtyT5Ff7vj839vf+18sJ24rTm4wDUpkpRBoX7t5y/u//2tm1Z8oTRFI8jUjCucudl9q9h3d0rHXdNxN+HXYDCgSWVYJTOsuFLoT54byNQ95A/hgCD5dUhKcbFmKrHm4pYZFrsmaWT6EsONVTry4Dm5WPpeDTCRAVtl9Ggr/m9pCgQR1qFm+EeH6QlD7TfsHB+ZAgPFhLQC7Q0aakTSzYNhUnRkbuc/mFL4YiVXJmr5A6/hBaYmTDyP4zpiC2MCEbG3zyl77hdg0YBhIolcK9VMRbfnx8wQRe+TFECH8Op5+wdRaN0g1r3TaX4r3mIXVztBgQKjH7bWlmGsYSIvY+AZu5GNf6/aInQtllg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(366004)(346002)(376002)(396003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(53546011)(6506007)(26005)(83380400001)(30864003)(2616005)(41300700001)(6512007)(8676002)(8936002)(31696002)(4326008)(36756003)(6636002)(37006003)(316002)(2906002)(5660300002)(6862004)(66556008)(66946007)(66476007)(86362001)(6666004)(6486002)(478600001)(82960400001)(31686004)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ni9SRkdjZk1iQzVZMGdHS1BKNElkZmZFZE9rNDgySFN6aFhidFYvT1pDQ2hT?=
 =?utf-8?B?ejJuTzBEaVRvNWo4Q0ZWbUZqcHNoZ1M1YlJmRzZDWEI3dENHdE13d3JxUm8r?=
 =?utf-8?B?NnRjRmJzSm1mZUVXeS9MMWFTQklReXRRcWhiT3FiKzJHMWVSa2dHRGo5Z3F4?=
 =?utf-8?B?OHRzdnJ6Q3BmczRBT1RPTmtYeFVqTkNta3JGMS9KQVZTNmR1THVHaGF3eWRV?=
 =?utf-8?B?YkVlam9yZlcvazcwTU95R3BWYUlveG5WNGdQcHZUeDJ1S3g4SHBBdDMrL2Zi?=
 =?utf-8?B?QmpmWGtPVDduNnhKS29uVXBLV1ZsK0xmTUtWUUE2d0YvaGxMZkxWeVVhK0NW?=
 =?utf-8?B?VXd2RGNwdVZWQjV4dmRYYUxPREttRHhuT0oxZ0FGUWh1WTd3Nlg4MjluamVZ?=
 =?utf-8?B?a3RrdGhHMWZ2dDBncjZMLzh2K0FaaEF3ZFJvOTB1OGsra0Z4cGgrbit3bWQy?=
 =?utf-8?B?NzY5VEVkRlg5ZklZUmloTE8vRi9oa3E5N1IySldjQ2szUm9lUDZpNkt0VVVi?=
 =?utf-8?B?MkpTVThyWk9IWnNacmpFZ0c4Ynp3V0p4Vjc2RGtKQlBNUkYzbWNPSGgrZTFB?=
 =?utf-8?B?QkNDa3lPbnFVN0JHMXdZWXNEYklBRHZLTUwvaWJFZmVGbi83VERtMU5MQW9Z?=
 =?utf-8?B?R3VWMnArcDFQVk8rQ01rbVBVRnBuQU93RC9YRUkwNm9nU3ZRYStENFBYMHRH?=
 =?utf-8?B?dWE5d2ppTlh3cXh3cnNvUlpaclhlR2pFV2NZYlgwNnVYck9jR1RjL0xFMGpP?=
 =?utf-8?B?YkpONnpWMS9HeUtDMmNFWVM5MWNlckR3OUk4djM5ZzA4VnR6QU1ld0tTc1Ri?=
 =?utf-8?B?YTVUU0RWaTFpZDBRTFVBM1NmQVYvT3dibXk5K3FDY2lQbzZoQktCdC9CbnBj?=
 =?utf-8?B?NFBKeFBZR2tUSDh1Vk9yNlN3Rk5iN0k5Zi9SNlN0cVdpdzZiZFJheTU5NXVB?=
 =?utf-8?B?ZFhpb2k5WDBnWTMreEQxcnRJVFU0ZmswMVp4RkovRjJVaUhCdzdoVmhwYlVX?=
 =?utf-8?B?eExEWlU0UXBGVWQyMmdRcThCN2I3dXpiTWo4NHpKWVY3SUhxSU92ZFFDNU90?=
 =?utf-8?B?dzJQK2N2eEdPZjd0cnkvNFVUMWk5U1JGRjNCNG9ISUcrQzRXeFFCSHRTMW12?=
 =?utf-8?B?NnBSWkZGUkFnVzNleit1ZXAvVThkOUhROXdkd3o1aDl0Y0toY2RSREFDayty?=
 =?utf-8?B?SzdCdGJsRHhwQ1VneEdnYnJDNG50RTdTRjBtK1pna1UrVXVFSDZReWtaUzBs?=
 =?utf-8?B?ZlJXMlVUWXhKY1FIMWkyVEEraHAra3lVa2VHSFIzMjZzNHJWZGVOelZCb2Rw?=
 =?utf-8?B?ell1R3NQVW9YOHhUZHRZSXViY1RhQnhrMFZwcUQwNFUrRTVpbWplYVZzQU10?=
 =?utf-8?B?OXF4MWRYRjFjVHRhUkpvaFNOYnpkMlZHMEJmem9sVkxkTUN6RnNubnA5aXZy?=
 =?utf-8?B?alFrdTk2OWhDT0FJcUdBaUVyaVJ0YVV5Q2cwVUV2SzZHUWlsZFpnWDYrVEpw?=
 =?utf-8?B?TGhLNGRkblloUStOL2NNY3pQRTNHNTdXaHViUVlhYkY2TkJmNGZJejI5SjZ4?=
 =?utf-8?B?aGQ0VzF3L29MYXdtN3VvWm5nakdMSVhPckN2T2JoSW5JcTRXS3lxY1VMSlJr?=
 =?utf-8?B?Qnh1WkRsZEdTaDNkWEhOMUhNWjgrMHNzUU5VZlRtVjI2dGJmNnZ6SlA1MlpD?=
 =?utf-8?B?R2UvMW1Kdi9QNDN1RUJWS0dzNW5VbG8veG8vVlZKS0ZTYmRlSk9FSmxKaGhT?=
 =?utf-8?B?SkJlaUswSTczNUV0bmNxU3dpUVhSZFhnZnZTeCtFQWI0WkxhcTNKOWUvdVUz?=
 =?utf-8?B?RmtUVW9MNHVHUXd3cFRuZWovR0t4ZlhnS2lxY0psSG9kNjQ2MFFpYzhiVzVM?=
 =?utf-8?B?Z0YzZ1ZDZzZ3K3BtL3NyUllrSWJVZXdSRm9uVjNjbnFINGM0cEdlNlRHSTVQ?=
 =?utf-8?B?cWZhNDZJbzlQVWtCMFF5d3FWb29xVVpKSzBDcVRZRU8vUUN0MUpqeWRhQUxQ?=
 =?utf-8?B?Nlh4bHZpRGpUTzkwZllpRDNZVFlYNkJZNU04aWR1UXRTZGloSUdJcWQydnJO?=
 =?utf-8?B?N21vZFVoRWEySHhmeWVyZjAvYnRWOVJBRSt0YUpHblphTGlEWEllYjRSTW5P?=
 =?utf-8?Q?zxsIkAbhvQuK2J0XZq9mW3DFj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c18a0c5c-f20b-4e31-c4cd-08dc1c62b682
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 22:29:07.6283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ettIMZkkKFycOgjJjNysvhdkWJCJifYgNXD9o4MKSG+3ogqAMVoH43EA3Hkn9FM0aIaxjOmThdDq93vI1lWrSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5055
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

Thanks for the review.
Yes, I totally agree with you that from i915, there are many registers 
dumped out on capture, but is for old platforms. We don't need it on Xe. 
Although I already filted the register list, there are still many 
registers not needed as you pointed out.
Let me review again and reorgnize files to make it more clear.

Regards,
Zhanjun


On 2024-01-22 4:39 p.m., Matt Roper wrote:
> On Thu, Jan 18, 2024 at 04:41:55PM -0800, Zhanjun Dong wrote:
>> Add registers defines and list of registers for GuC based error state capture.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Kconfig               |  11 +++
>>   drivers/gpu/drm/xe/Makefile              |   1 +
>>   drivers/gpu/drm/xe/regs/xe_engine_regs.h |  12 +++
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  20 +++++
>>   drivers/gpu/drm/xe/xe_guc.c              |   5 ++
>>   drivers/gpu/drm/xe/xe_guc_capture.c      | 108 +++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_capture.h      |  15 ++++
>>   7 files changed, 172 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.h
>>
>> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>> index 1b57ae38210d..236763569877 100644
>> --- a/drivers/gpu/drm/xe/Kconfig
>> +++ b/drivers/gpu/drm/xe/Kconfig
>> @@ -83,6 +83,17 @@ config DRM_XE_FORCE_PROBE
>>   
>>   	  Use "!*" to block the probe of the driver for all known devices.
>>   
>> +config DRM_XE_CAPTURE_ERROR
>> +	bool "Enable capturing GPU state following a hang"
>> +	depends on DRM_XE
>> +	default y
>> +	help
>> +	  This option enables capturing the GPU state when a hang is detected.
>> +	  This information is vital for triaging hangs and assists in debugging.
>> +	  Please report any hang to your Intel representative to help with triaging.
>> +
>> +	  If in doubt, say "Y".
>> +
> 
> The commit message said that this was just adding register defines, but
> you're actually adding new files and build options as well.  That should
> probably all happen as a separate patch.
> 
>>   menu "drm/Xe Debugging"
>>   depends on DRM_XE
>>   depends on EXPERT
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index fe8b266a9819..6182f89a6bd5 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -92,6 +92,7 @@ xe-y += xe_bb.o \
>>   	xe_gt_topology.o \
>>   	xe_guc.o \
>>   	xe_guc_ads.o \
>> +	xe_guc_capture.o \
>>   	xe_guc_ct.o \
>>   	xe_guc_db_mgr.o \
>>   	xe_guc_debugfs.o \
>> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> index 0b1266c88a6a..06015703a33e 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> @@ -64,10 +64,16 @@
>>   
>>   #define RING_ACTHD_UDW(base)			XE_REG((base) + 0x5c)
>>   #define RING_DMA_FADD_UDW(base)			XE_REG((base) + 0x60)
>> +#define RING_IPEIR(base)			XE_REG((base) + 0x64)
> 
> There's no such register on any platform supported by Xe; BDW (gen8) was
> the last platform that had this.
> 
> As a reminder, i915 dumps a whole bunch of invalid registers and data
> that don't actually apply to any modern platform.  I think cleaning that
> all up has been on the todo list for a long time.  At least with Xe
> we're starting fresh so we can make sure that we're dumping just the
> registers that actually exist and are useful for debugging, and make
> sure that we're dumping them accurately; we don't want to just blindly
> copy/paste register dump stuff over from i915 since a lot of it is just
> unwanted bitrot.
> 
>>   #define RING_IPEHR(base)			XE_REG((base) + 0x68)
>> +#define RING_INSTDONE(base)			XE_REG((base) + 0x6c)
>> +#define RING_INSTPS(base)			XE_REG((base) + 0x70)
>> +
>>   #define RING_ACTHD(base)			XE_REG((base) + 0x74)
>>   #define RING_DMA_FADD(base)			XE_REG((base) + 0x78)
>>   #define RING_HWS_PGA(base)			XE_REG((base) + 0x80)
>> +#define IPEIR(base)				XE_REG((base) + 0x88)
> 
> This looks like the same register as above, but a different offset that
> hasn't existed on any platform documented by the current bspec tools.
> That means this is probably an old gen3 offset of something; definitely
> not the kind of thing that we should be putting into Xe.
> 
> You also don't use this definition in the tables at the end of this
> patch either.
> 
>> +
>>   #define RING_HWSTAM(base)			XE_REG((base) + 0x98)
>>   #define RING_MI_MODE(base)			XE_REG((base) + 0x9c)
>>   #define RING_NOPID(base)			XE_REG((base) + 0x94)
>> @@ -111,9 +117,12 @@
>>   #define   FF_DOP_CLOCK_GATE_DISABLE		REG_BIT(1)
>>   #define   REPLAY_MODE_GRANULARITY		REG_BIT(0)
>>   
>> +#define RING_BBSTATE(base)			XE_REG((base) + 0x110)
>>   #define RING_BBADDR(base)			XE_REG((base) + 0x140)
>>   #define RING_BBADDR_UDW(base)			XE_REG((base) + 0x168)
>>   
>> +#define CCID(base)				XE_REG((base) + 0x180)
>> +
>>   #define BCS_SWCTRL(base)			XE_REG((base) + 0x200, XE_REG_OPTION_MASKED)
>>   #define   BCS_SWCTRL_DISABLE_256B		REG_BIT(2)
>>   
>> @@ -129,6 +138,9 @@
>>   #define	  CTX_CTRL_INHIBIT_SYN_CTX_SWITCH	REG_BIT(3)
>>   #define	  CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT	REG_BIT(0)
>>   
>> +#define RING_PDP_UDW(base, n)		XE_REG((base) + 0x270 + (n) * 8 + 4)
>> +#define RING_PDP_LDW(base, n)		XE_REG((base) + 0x270 + (n) * 8)
> 
> What is the goal of dumping these?  I don't think they're relevant for
> modern usage are they?
> 
>> +
>>   #define RING_MODE(base)				XE_REG((base) + 0x29c)
>>   #define   GFX_DISABLE_LEGACY_MODE		REG_BIT(3)
>>   
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 0d4bfc35ff37..46e3395f57ef 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -67,6 +67,8 @@
>>   #define VE1_AUX_INV				XE_REG(0x42b8)
>>   #define   AUX_INV				REG_BIT(0)
>>   
>> +#define AUX_ERR_DBG				XE_REG(0x43f4)
>> +
> 
> This is a multicast register.  Also it doesn't exist anymore on Xe2 and
> beyond but you have it on a "COMMON" list that implies it would apply to
> all platforms.
> 
> Dumping registers incorrectly (e.g., printing a single value for a
> multicast register that actually has several different values) is more
> misleading than not printing the register at all.  That's why it's
> important to make sure each register is being dumped accurately.  We
> also need to justify why we're including various registers; i915
> included a bunch of garbage that nobody cared about (which was obvious
> since we dumped incorrect values for some registers for years and nobody
> noticed).  We should keep the Xe list restricted to just the registers
> that we and our userspace partners would actually find useful.  Adding
> unwanted registers just increases the maintenance burden and will lead
> to Xe's error dump turning into the same kind of graveyard i915's
> became.
> 
>>   #define XEHP_TILE_ADDR_RANGE(_idx)		XE_REG_MCR(0x4900 + (_idx) * 4)
>>   #define XEHP_FLAT_CCS_BASE_ADDR			XE_REG_MCR(0x4910)
>>   
>> @@ -94,6 +96,8 @@
>>   #define   FF_MODE2_TDS_TIMER_MASK		REG_GENMASK(23, 16)
>>   #define   FF_MODE2_TDS_TIMER_128		REG_FIELD_PREP(FF_MODE2_TDS_TIMER_MASK, 4)
>>   
>> +#define XEHPG_INSTDONE_GEOM_SVG			XE_REG_MCR(0x666c)
>> +
>>   #define CACHE_MODE_1				XE_REG(0x7004, XE_REG_OPTION_MASKED)
>>   #define   MSAA_OPTIMIZATION_REDUC_DISABLE	REG_BIT(11)
>>   
>> @@ -110,6 +114,10 @@
>>   #define   FLSH_IGNORES_PSD			REG_BIT(10)
>>   #define   FD_END_COLLECT			REG_BIT(5)
>>   
>> +#define SC_INSTDONE				XE_REG(0x7100)
>> +#define SC_INSTDONE_EXTRA			XE_REG(0x7104)
>> +#define SC_INSTDONE_EXTRA2			XE_REG(0x7108)
> 
> These are multicast registers too.
> 
>> +
>>   #define COMMON_SLICE_CHICKEN4			XE_REG(0x7300, XE_REG_OPTION_MASKED)
>>   #define   DISABLE_TDC_LOAD_BALANCING_CALC	REG_BIT(6)
>>   
>> @@ -299,6 +307,11 @@
>>   
>>   #define XE2LPM_L3SQCREG5			XE_REG_MCR(0xb658)
>>   
>> +#define FAULT_TLB_DATA0				XE_REG(0xceb8)
>> +#define FAULT_TLB_DATA1				XE_REG(0xcebc)
> 
> Also multicast.
> 
>> +
>> +#define RING_FAULT_REG				XE_REG(0xcec4)
> 
> Ditto.
> 
>> +
>>   #define XEHP_MERT_MOD_CTRL			XE_REG_MCR(0xcf28)
>>   #define RENDER_MOD_CTRL				XE_REG_MCR(0xcf2c)
>>   #define COMP_MOD_CTRL				XE_REG_MCR(0xcf30)
>> @@ -317,6 +330,11 @@
>>   #define   INVALIDATION_BROADCAST_MODE_DIS	REG_BIT(12)
>>   #define   GLOBAL_INVALIDATION_MODE		REG_BIT(2)
>>   
>> +#define GAM_DONE				XE_REG(0xcf68)
> 
> Ditto.
> 
>> +
>> +#define SAMPLER_INSTDONE			XE_REG_MCR(0xe160)
>> +#define ROW_INSTDONE				XE_REG_MCR(0xe164)
>> +
>>   #define HALF_SLICE_CHICKEN5			XE_REG_MCR(0xe188, XE_REG_OPTION_MASKED)
>>   #define   DISABLE_SAMPLE_G_PERFORMANCE		REG_BIT(0)
>>   
>> @@ -484,6 +502,8 @@
>>   #define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
>>   #define   GT_RENDER_USER_INTERRUPT		REG_BIT(0)
>>   
>> +#define SFC_DONE(n)				XE_REG(0x1cc000 + (n) * 0x1000)
>> +
>>   #define PVC_GT0_PACKAGE_ENERGY_STATUS		XE_REG(0x281004)
>>   #define PVC_GT0_PACKAGE_RAPL_LIMIT		XE_REG(0x281008)
>>   #define PVC_GT0_PACKAGE_POWER_SKU_UNIT		XE_REG(0x281068)
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 2891b0cc4f7f..63587db6a548 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -17,6 +17,7 @@
>>   #include "xe_force_wake.h"
>>   #include "xe_gt.h"
>>   #include "xe_guc_ads.h"
>> +#include "xe_guc_capture.h"
>>   #include "xe_guc_ct.h"
>>   #include "xe_guc_hwconfig.h"
>>   #include "xe_guc_log.h"
>> @@ -290,6 +291,10 @@ int xe_guc_init(struct xe_guc *guc)
>>   	if (ret)
>>   		goto out;
>>   
>> +	ret = xe_guc_capture_init(guc);
>> +	if (ret)
>> +		goto out;
>> +
>>   	ret = xe_guc_ads_init(&guc->ads);
>>   	if (ret)
>>   		goto out;
>> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
>> new file mode 100644
>> index 000000000000..cacd50f4718a
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
>> @@ -0,0 +1,108 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2021-2022 Intel Corporation
>> + */
>> +
>> +#include <linux/types.h>
>> +
>> +#include <drm/drm_print.h>
>> +
>> +#include "abi/guc_actions_abi.h"
>> +#include "regs/xe_regs.h"
>> +#include "regs/xe_engine_regs.h"
>> +#include "regs/xe_gt_regs.h"
>> +#include "regs/xe_guc_regs.h"
>> +
>> +#include "xe_bo.h"
>> +#include "xe_device.h"
>> +#include "xe_exec_queue_types.h"
>> +#include "xe_hw_engine_types.h"
>> +#include "xe_gt.h"
>> +#include "xe_gt_printk.h"
>> +#include "xe_guc.h"
>> +#include "xe_guc_capture.h"
>> +#include "xe_guc_ct.h"
>> +
>> +#include "xe_guc_log.h"
>> +#include "xe_gt_mcr.h"
>> +#include "xe_guc_submit.h"
>> +#include "xe_macros.h"
>> +#include "xe_map.h"
>> +
>> +#if IS_ENABLED(CONFIG_DRM_XE_CAPTURE_ERROR)
>> +
>> +/*
>> + * Define all device tables of GuC error capture register lists
> 
> The tables below don't really make sense yet because they don't get used
> anywhere yet and it isn't even clear what the structure is (i.e., the
> the "0, 0" part doesn't relate to anything else in this patch).
> 
> In general it would probably be better to approach this from the other
> direction --- add the general infrastructure to just dump the registers
> we already have definitions for first, then follow up with extra patches
> that add additional registers and include them in the appropriate lists,
> along with an explanation for why each set of registers is useful to
> dump.
> 
> 
> Matt
> 
>> + * NOTE: For engine-registers, GuC only needs the register offsets
>> + *       from the engine-mmio-base
>> + */
>> +#define COMMON_XELP_BASE_GLOBAL \
>> +	{ FORCEWAKE_GT,		    0,      0, "FORCEWAKE" }, \
>> +	{ FAULT_TLB_DATA0,	    0,      0, "FAULT_TLB_DATA0" }, \
>> +	{ FAULT_TLB_DATA1,	    0,      0, "FAULT_TLB_DATA1" }, \
>> +	{ AUX_ERR_DBG,		    0,      0, "AUX_ERR_DBG" }, \
>> +	{ GAM_DONE,		    0,      0, "GAM_DONE" }, \
>> +	{ RING_FAULT_REG,	    0,      0, "FAULT_REG" }
>> +
>> +#define COMMON_BASE_ENGINE_INSTANCE \
>> +	{ RING_PSMI_CTL(0),         0,      0, "RC PSMI" }, \
>> +	{ RING_ESR(0),              0,      0, "ESR" }, \
>> +	{ RING_EMR(0),              0,      0, "EMR" }, \
>> +	{ RING_EIR(0),              0,      0, "EIR" }, \
>> +	{ RING_EXECLIST_STATUS_HI(0), 0,    0, "RING_EXECLIST_STATUS_HI" }, \
>> +	{ RING_EXECLIST_STATUS_LO(0), 0,    0, "RING_EXECLIST_STATUS_LO" }, \
>> +	{ RING_DMA_FADD(0),         0,      0, "RING_DMA_FADD_LDW" }, \
>> +	{ RING_DMA_FADD_UDW(0),     0,      0, "RING_DMA_FADD_UDW" }, \
>> +	{ RING_IPEIR(0),            0,      0, "IPEIR" }, \
>> +	{ RING_IPEHR(0),            0,      0, "IPEHR" }, \
>> +	{ RING_INSTPS(0),           0,      0, "INSTPS" }, \
>> +	{ RING_BBADDR(0),           0,      0, "RING_BBADDR_LOW32" }, \
>> +	{ RING_BBADDR_UDW(0),       0,      0, "RING_BBADDR_UP32" }, \
>> +	{ RING_BBSTATE(0),          0,      0, "BB_STATE" }, \
>> +	{ CCID(0),                  0,      0, "CCID" }, \
>> +	{ RING_ACTHD(0),            0,      0, "ACTHD_LDW" }, \
>> +	{ RING_ACTHD_UDW(0),        0,      0, "ACTHD_UDW" }, \
>> +	{ INSTPM(0),                0,      0, "INSTPM" }, \
>> +	{ RING_INSTDONE(0),         0,      0, "INSTDONE" }, \
>> +	{ RING_NOPID(0),            0,      0, "RING_NOPID" }, \
>> +	{ RING_START(0),            0,      0, "START" }, \
>> +	{ RING_HEAD(0),             0,      0, "HEAD" }, \
>> +	{ RING_TAIL(0),             0,      0, "TAIL" }, \
>> +	{ RING_CTL(0),              0,      0, "CTL" }, \
>> +	{ RING_MI_MODE(0),          0,      0, "MODE" }, \
>> +	{ RING_CONTEXT_CONTROL(0),  0,      0, "RING_CONTEXT_CONTROL" }, \
>> +	{ RING_HWS_PGA(0),          0,      0, "HWS" }, \
>> +	{ RING_MODE(0),             0,      0, "GFX_MODE" }, \
>> +	{ RING_PDP_LDW(0, 0),	    0,      0, "PDP0_LDW" }, \
>> +	{ RING_PDP_UDW(0, 0),	    0,      0, "PDP0_UDW" }, \
>> +	{ RING_PDP_LDW(0, 1),	    0,      0, "PDP1_LDW" }, \
>> +	{ RING_PDP_UDW(0, 1),	    0,      0, "PDP1_UDW" }, \
>> +	{ RING_PDP_LDW(0, 2),	    0,      0, "PDP2_LDW" }, \
>> +	{ RING_PDP_UDW(0, 2),	    0,      0, "PDP2_UDW" }, \
>> +	{ RING_PDP_LDW(0, 3),	    0,      0, "PDP3_LDW" }, \
>> +	{ RING_PDP_UDW(0, 3),	    0,      0, "PDP3_UDW" }
>> +
>> +#define COMMON_XELP_BASE_RENDER \
>> +	{ SC_INSTDONE,		    0,      0, "SC_INSTDONE" }, \
>> +	{ SC_INSTDONE_EXTRA,	    0,      0, "SC_INSTDONE_EXTRA" }, \
>> +	{ SC_INSTDONE_EXTRA2,	    0,      0, "SC_INSTDONE_EXTRA2" }
>> +
>> +#define COMMON_XELP_BASE_VEC \
>> +	{ SFC_DONE(0),		    0,      0, "SFC_DONE[0]" }, \
>> +	{ SFC_DONE(1),		    0,      0, "SFC_DONE[1]" }, \
>> +	{ SFC_DONE(2),		    0,      0, "SFC_DONE[2]" }, \
>> +	{ SFC_DONE(3),		    0,      0, "SFC_DONE[3]" }
>> +
>> +int xe_guc_capture_init(struct xe_guc *guc)
>> +{
>> +	return 0;
>> +}
>> +
>> +#else	/* IS_ENABLED(CONFIG_DRM_XE_CAPTURE_ERROR) */
>> +
>> +int xe_guc_capture_init(struct xe_guc *guc)
>> +{
>> +	return 0;
>> +}
>> +
>> +#endif	/* IS_ENABLED(CONFIG_DRM_XE_CAPTURE_ERROR) */
>> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
>> new file mode 100644
>> index 000000000000..3caea2c6fffe
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_capture.h
>> @@ -0,0 +1,15 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2021-2021 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GUC_CAPTURE_H
>> +#define _XE_GUC_CAPTURE_H
>> +
>> +#include <linux/types.h>
>> +
>> +struct xe_guc;
>> +
>> +int xe_guc_capture_init(struct xe_guc *guc);
>> +
>> +#endif /* _XE_GUC_CAPTURE_H */
>> -- 
>> 2.34.1
>>
> 
