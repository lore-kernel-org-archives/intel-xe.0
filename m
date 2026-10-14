Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B2BCC6B1A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 10:07:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA9410E11B;
	Wed, 14 Oct 2026 10:07:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49DB010E11B
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 10:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791972446; x=1823508446;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=SyoM5yG5d913syAVWe3pMMNWgPxfD/9AkvUxy2DZ9W0=;
 b=HfFn1IHfiIaXdjbHkKIH+8XXzq+MimwoPJkqRYR/uB8O8mVNkjL6pwDh
 ShYre1BHNHJmpzhqoN6+fpCRBdyzTTOmEolyFt8N35vOpwzWBa9wyHP0a
 SCrmKtEMBD+/JdRMHMDT+FayjNDKjJs/RswL69dLxtNCxP2VdoveaE8cU
 WEYNTO7wScTx9QKYnRko9U6qwv8iw6p9phiTouOHbvL8diLd1b7g0IFo2
 iC4d6yj86/1FdhBYdOIpS22tb48ADV4bdRl+OnMFu4olq+RxVpip377CW
 fPlHG5TcYFTvYWwBvcVZH0e7P4RkYi4xiIlLuVKTfIn2yuaqjZ8CEz8JC A==;
X-CSE-ConnectionGUID: PdTTF5m1Q4GVAaAPSPuJyw==
X-CSE-MsgGUID: WxLCfNjDQtuzaBpwFwnbuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="617460"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; d="scan'208,217";a="617460"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 03:07:25 -0700
X-CSE-ConnectionGUID: QeP8i7PIQ9eht9gd1Mfc8A==
X-CSE-MsgGUID: YVW4auOjSLuHDW1E4IdRkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; d="scan'208,217";a="1475174"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 03:07:24 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 03:07:24 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 03:07:24 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.43) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 03:07:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XIbt9o7yHdb+E3ueqCO9YrtqQgddscgsV9UrCEGbpsPz4a/NCfOashx1SyYqELxFoNRWY6FyezeVt1VOTw+pNSleMMMhrbA7LULUAOuup85PML4M8ieLnxGMdO27R+I5UXmxshrUV32jFGbIwrdUX/YvOu4QtSQH+XniNDKMB3An8qgWdgHsE13HP2gUFE9Gua8sOlAXz7PpoqiIomY6UjB/U0VHQQauTcf2LQZyzC2fSbsUWFLaal/q3wCGRBF/9Qehehqk7c/O662IfW1po9GTCv0Zjx1rWXp6aQnTr1mmZQK0zEQz8xK1twyjeOKI6bZoT8sVVYHmmBkXQEtd6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+OW1FZPjOdT3s/i9NcNGYy/paWmtDj/wPMPl4z/qSI=;
 b=uvC8RzODh9KBP+WXzL7jeQp4gMHvYkzZ3sWDgkJUX2oAeoTHXGJGYRa/7AokH+vOzrF0Ggoz75LRKerEHfaQLqcKF2Cdt1PMMgL8D3vc4wXpvl1DrsBq3Qlc6qLrAKePa+odI1/gd+o/nX2K4gwY6ndqkpOrNO1trjCkMuMltYkuzPC62SFa9dG4o74bFO++A7PwUfffx2sn8VtEK4X+tUYfm6u6aN8yVKLvgBSHrG0vm87y35dAKNayNYMiMDweEKKNlI+iajrRAqU9olLMfJolkc3DDLZSsNnQXkFTCxAmY8FUC7a70GrQiL5sd+bgMsCf7gaqduWYXL2hRxtFZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH8PR11MB852307.namprd11.prod.outlook.com
 (2603:10b6:610:32c::22) by IA0PR11MB7283.namprd11.prod.outlook.com
 (2603:10b6:208:439::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.25; Wed, 14 Oct
 2026 10:07:21 +0000
Received: from CH8PR11MB852307.namprd11.prod.outlook.com
 ([fe80::5f8e:c1ed:445a:a4b7]) by CH8PR11MB852307.namprd11.prod.outlook.com
 ([fe80::5f8e:c1ed:445a:a4b7%4]) with mapi id 15.21.0522.011; Wed, 14 Oct 2026
 10:07:21 +0000
Content-Type: multipart/alternative;
 boundary="------------AZya5QY56WrYzpi6uuyIjU0h"
Message-ID: <f48951fd-9d98-47d9-a403-3edd0efc308d@intel.com>
Date: Wed, 14 Oct 2026 15:37:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 04/16] drm/xe/hwmon: Add helpers to validate thermal
 sensor readings
To: <sashiko-reviews@lists.linux.dev>, <intel-xe@lists.freedesktop.org>
References: <20261013184939.694945-1-karthik.poosa@intel.com>
 <20261013184939.694945-5-karthik.poosa@intel.com>
 <sashiko-outbox-170367@kernel.org>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <sashiko-outbox-170367@kernel.org>
X-ClientProxiedBy: MA5P287CA0026.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::9) To CH8PR11MB852307.namprd11.prod.outlook.com
 (2603:10b6:610:32c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR11MB852307:EE_|IA0PR11MB7283:EE_
X-MS-Office365-Filtering-Correlation-Id: 72e10128-df6e-4290-777c-08df29daef68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|261009223027099003|5023799004|11063799006|4143699003|10067099003|8096899003|56012099006|22082099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: WGQuWEliELpN6TkEohQ/M+hMJBNabdqIN3OoBfufYyUPH3xUoqkmUfM9CtYUVQP3OeBHwztP/HI01lW9l3oxvX7DSPlZ93CbmwLw5POCfDefXFIWItHmeAtTEEtXP91pqDXHxNJaz4FEeHTqQfNoywQWyqQ+O0ZbY1H/PyqJqYYP+PFU8fdDPmGgRurwV9ppyz7TjwqnhSsRVY/nb3mQyoO12u7VjygHqn+JofUMhWEKI/voR2Wpt7ifvlW+njQva8lUV116T7Hu3DtS+bryKi+mnpV1CkKNXJg2T+HDOiyN5LrE8HrznzVyeGfZPEiafTym8U5RtspAnYXfmcnAKTT2gChBH9RmcPV0RBA6Hkg63kHIAOpZUS/hIvR+N+LX6mzUJJ3riZY6pCMaBg3yFu9K6kvlFfzvTdm7/zbHreC4VabPku2xBhzFIyK9R62FeIQPhM2IyJJnQlc0CnbX7rXr92VLKJwWbBOpvtaJkSgBC7hv+B7uxyOUR23M+sEYdcildPX7bDx5cx1/eIogu21egbwvncWe8zjU6jbucn3CPNlvY48XJQGM32yzv+srVl8aJDFBTSKF44sEo+O4G64T+FaGMbs/cpOYi7FSiQi15VFjxk4nfTjJ2R5Q1xFEBf5dCacHgL3BFHg6xR6ToQ34US8tcwUqUYz3H1ZsFS0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH8PR11MB852307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(261009223027099003)(5023799004)(11063799006)(4143699003)(10067099003)(8096899003)(56012099006)(22082099003)(6133799003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVEyM2I5eDRsblpKTnhvVEUzaEg3am1TcXRMSW8zbkxndHY4NlVxTmtaU2ZT?=
 =?utf-8?B?aTQ0UlNnWEZVMHNhMFFVSGM2OHZzK2VvRkZCdWhpdzZINXNIY01rVHFWOTQz?=
 =?utf-8?B?emFYSk5NRHdGWFp3amxybUtxczQ5NGtTU1QrWGU2WU5jSU1ROW96YktvVlZC?=
 =?utf-8?B?NmpnWk0rT2YwMkc5alNYa3d3cjlselFYWEVwRVpYOS9lS2tCKzhkajhXbW4y?=
 =?utf-8?B?dlgyTHNWb1hMdXVrbW1Tb3lRd2pVdUlFWDR4TWZHMjZhV2JMbUJoL0h0bktQ?=
 =?utf-8?B?OWhQWWNRTlJ5MmljMzJoWDRNM3V6SXdTQTZPam1wYjJFSXBiZGNJMkpURk1N?=
 =?utf-8?B?NHZ0U3dxdHBadTV1S1B4UW5FRkkrOWxEbTF5cFc1R2hLbjlxYzlXOWhzRTlB?=
 =?utf-8?B?K0wwQkdja3ExMDczYTkrc3FqRHRxTTI1cUdxSkhibndyOTZxM0VaTEhNSVZR?=
 =?utf-8?B?SVBYVGtTTzBZZ0RNZGdyQms2Qk5LZmZDZEtyaDc0RlpGU05lUU9UbUtReTdy?=
 =?utf-8?B?UmY0RzZUeExwZFd4UDVMUjl0SkNBS2ZaR3VGWFF5YWhEMEZ4N2hMb2RRcjE1?=
 =?utf-8?B?NVNZc3hvTGEreXAzblZ0ZjlyZ1lwSjVVcU1icDBMbU1zODBST1hHV0ZvaS8z?=
 =?utf-8?B?TW5NeC96TG45YjVOVndGa1pXMS9vYnM2ankvanNVYmovQnBTOENQRW9RcWVI?=
 =?utf-8?B?UEgwTk5hWVAwS3JYa3p1VWo1Y1FYZnBvSlJpVVgydnZiTHJYSkM4SDdWNWpa?=
 =?utf-8?B?eXA2Mkhndlk3N0M1OU9YZDRGZmwzRjFxNU9UNG0xdkV5ODQvMFQvOVlGdGF5?=
 =?utf-8?B?dkUxTWw0UElPajRWWURITndQRldtMjdyeU9vNmdvZVRkbG1CY2N1WGF6WnRo?=
 =?utf-8?B?VEwxZ0lDb0lNcUFtQXdpb3JibHBSZnhGV1lsQVZ5dWs0QVo3K3VYT05oUW1o?=
 =?utf-8?B?SGRXMUZlQzlKSUxENXhQRE8xUnFUQXlRTGsySjMrbnltM0RiVUhnS2xCTjJ3?=
 =?utf-8?B?RzNkcTdScmFtbnNEZEpHRkt6UVJIYkE3MHIvNVBmdmFydEZwVGwwWFQ1cXlq?=
 =?utf-8?B?VXhjeElNVGJwMVB5WTVqT3R6TjduM2pXSmZheXZoQmlsTUdleFo4K0gvZWx2?=
 =?utf-8?B?R1FJNEJJNUtESHVDZkxCNnp3NHdyNFlGR0FXM3VmS1ZraWJ4aEQxLzdpS0FF?=
 =?utf-8?B?cXhDSS8xbFkyS2lvNGYwaDJaZjBTQWhudTNBTmJNd2gyYU50WmJaNkwvM0V1?=
 =?utf-8?B?N293Tk92TUxieGM2VDFKa2pEVHBvM2xuK0xJclhtN0ZHcSs2NFFSM3Q2V1lT?=
 =?utf-8?B?NUN2cjJOS1U1Uy9tcDFtbEt6T1JEaTBLdGdhOVFzNURsd3JLNjI5Z0dtVHgy?=
 =?utf-8?B?THlLQzRxeHByTkJ4emhmYzFZU3N1OXZzR2hXNHd6Y1hxYmdodDRIVS9yNm4z?=
 =?utf-8?B?OEIxSnNvRm5iSzZ6TG5nbTZUVnNLVkM1cUtEaUFTeVhscHE1ampLSDZBZjB2?=
 =?utf-8?B?RSs5dStNNzdPbFRQaHdPdjd1bStrc1p0b0JBUVR1RWh2Ty9YVUhXdWMrNGJL?=
 =?utf-8?B?YTlVbTU0YmZLcGg2UHhCVUNobzJYL2MxcTNNMTFzYXRjcitOcVIxYm5rakNi?=
 =?utf-8?B?RVZXT1RDQy9UdzlGalp0b2hYbnFuYTlYSXVLMk9YQWhkNElBbXdmZFNxMmpl?=
 =?utf-8?B?WHorTGpqWFIvTVBFeFQzOTJZTWorWjh3R1hMbnh3L0Q2WnFSQU9mN2ZHVy9r?=
 =?utf-8?B?eGZoVmhGOEtLQVpBbUdLTktucVZBSmZiOERGTlZpVGs4bzhxaW5xeVlxbUtQ?=
 =?utf-8?B?ZWloR3I4TTNndnFRa1gwR0QwRk1vc0dlU2RPZDlnUUdHQ3ZvNisrak5JMHF3?=
 =?utf-8?B?Sm1jM1VOclR1RFIyT0lyUDF0Y01HUFVNV3BxaHVNdGVCdnF5VFpLWXVMd0k4?=
 =?utf-8?B?QStyZFM4Zi9NNFd5YUJhUW9BVG5udHU2czYwODFlZU1qT1l5UWdKdGdZRHhu?=
 =?utf-8?B?M0FLd21nYUo5RitrckJuRWlseml0YUE0SjJoOVRueTY0N25lNkE5SlJzMmU2?=
 =?utf-8?B?SWx2alZ5M0RPa2dtNXpOTDVHcVg2Z2FWSURobWkyZlRxT1J2cjBLbVFMbmVa?=
 =?utf-8?B?MVZTVC9yVkI5VytJOUVvN3NtSDVSNktjY0h0bnBlKzBkVTk4WXk1NXMwRVFN?=
 =?utf-8?B?ZWU2amRIazI5M08vakJBMnFZQWZ4aUpmbG1NMU0va2htZXlqM1J3ZDFKYWpj?=
 =?utf-8?B?ZDZVKys2NUlHM0VGN3RnekxuY2VCZm1SWnd2SC94WXl2Q3Z1MnpUemZjNnZI?=
 =?utf-8?B?dHhiclQyaFBRcFQvd1VXWGhIUHhhTnlFUXE4S2ZJNWVQU3hhOVdxUT09?=
X-Exchange-RoutingPolicyChecked: zzwKcXAhpnNtvZEFh/Yorzw76S/u8pUvnod1fKJ8vQQLOY++TG0AZNGqR/ThFZcvzw/YjOAX0R5JMuLGVgKhZPST9P16WK6lEzBcYmah0gjnjCcwpa51QNShaTl4jHCUi/PlqbfPtPYg4NvGj3C5BUAHsq3Vb6uTey8FdFhtg5hTSOL8wzEHYtZ349JJ4gycKTr5KdSF7v/nab/ymXLrU0ISCkzz400qPya4XtDDhGZ5nOHR3Etphmp8D/UiLBYZRsSFoMeIbZp5CjBYW5VzkhLQF+CPAwm1jzSHZlBBhnM0a2aFjF/E7a+2S0fASw42P/y2YqANrQmeLbsRd5OcyA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e10128-df6e-4290-777c-08df29daef68
X-MS-Exchange-CrossTenant-AuthSource: CH8PR11MB852307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 10:07:20.9596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KyvT/nSopkqRf0sQHtIjp908mvAPxSXNebeBOzJZXYPxkJNjDYcKxt/teKcW2alP0IYFDiAeKjlbfQLehGWvig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7283
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

--------------AZya5QY56WrYzpi6uuyIjU0h
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 14-10-2026 00:31, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] hwmon: Validation helpers fail to filter U32_MAX/0xFF on pre-CRI platforms
> --
>
> commit 3734bfcfc0e55f578f66176481a816cff2820aea
> Author: Karthik Poosa<karthik.poosa@intel.com>
> drm/xe/hwmon: Add helpers to validate thermal sensor readings
>
> This commit adds mmio_temp_valid() and mbx_temp_valid() helpers to validate
> temperature sensor readings. It introduces has_temp_sentinel to use U32_MAX
> or 0xFF as invalid indicators on supported platforms, falling back to checking
> for 0 on other platforms.
>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index b1d57f4910579..418e1c503eb5a 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> [ ... ]
>
>> @@ -825,6 +828,23 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>>   	return ret;
>>   }
>>   
>> +static inline bool mmio_temp_valid(const struct xe_hwmon *hwmon, u32 value)
>> +{
>> +	/*
>> +	 * On platforms lacking temperature sentinel support, a value of 0 is treated
>> +	 * as invalid. While 0°C is theoretically possible, it is highly unlikely for
>> +	 * a discrete GPU in normal environments, making it a reasonable fallback
>> +	 * indicator for invalid or uninitialized temperature readings.
>> +	 */
>> +	return hwmon->xe->info.has_temp_sentinel ? value != U32_MAX : value != 0;
> [Severity: Medium]
> Does this allow standard MMIO read failures (U32_MAX) to bypass the filter on
> platforms lacking has_temp_sentinel?
>
> If a device on a platform before CRI encounters a PCI read failure returning
> U32_MAX, the ternary fallback (value != 0) evaluates to true. Any userspace
> read of the hwmon sysfs nodes during such conditions would expose bogus
> extreme temperatures instead of properly returning an error.
We could add check like this for tihs.

+static inline bool mmio_temp_valid(const struct xe_hwmon *hwmon, u32 value)

-    return hwmon->xe->info.has_temp_sentinel ? value != U32_MAX : value 
!= 0;
+    if (value == U32_MAX)
+        return false;
+
+    return hwmon->xe->info.has_temp_sentinel || value != 0;
  }

>> +}
>> +
>> +/* Mailbox temperature is sign-magnitude (bit 7 sign, bits 6:0 magnitude). */
>> +static inline bool mbx_temp_valid(const struct xe_hwmon *hwmon, u8 value)
>> +{
>> +	return hwmon->xe->info.has_temp_sentinel ? value != TEMP_MBX_INVALID : value != 0;
> [Severity: Medium]
> Does this allow 0xFF (TEMP_MBX_INVALID) to be treated as a valid reading on
> platforms lacking has_temp_sentinel?
>
> If a device reads an unpopulated or unavailable mailbox sensor returning 0xFF,
> the fallback check (value != 0) evaluates to true. This would bypass the filter
> and erroneously decode the reading to -127 degrees Celsius.

similar thing as above could be done here.
  static inline bool mbx_temp_valid(const struct xe_hwmon *hwmon, u8 value)
  {
-       return hwmon->xe->info.has_temp_sentinel ? value != 
TEMP_MBX_INVALID : value != 0;
+       if (value == TEMP_MBX_INVALID)
+               return false;
+
+       return hwmon->xe->info.has_temp_sentinel || value != 0;
  }

>> +}
--------------AZya5QY56WrYzpi6uuyIjU0h
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 14-10-2026 00:31,
      <a class="moz-txt-link-abbreviated" href="mailto:sashiko-bot@kernel.org">sashiko-bot@kernel.org</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:sashiko-outbox-170367@kernel.org">
      <pre wrap="" class="moz-quote-pre">Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
- [Medium] hwmon: Validation helpers fail to filter U32_MAX/0xFF on pre-CRI platforms
--

commit 3734bfcfc0e55f578f66176481a816cff2820aea
Author: Karthik Poosa <a class="moz-txt-link-rfc2396E" href="mailto:karthik.poosa@intel.com">&lt;karthik.poosa@intel.com&gt;</a>
drm/xe/hwmon: Add helpers to validate thermal sensor readings

This commit adds mmio_temp_valid() and mbx_temp_valid() helpers to validate
temperature sensor readings. It introduces has_temp_sentinel to use U32_MAX
or 0xFF as invalid indicators on supported platforms, falling back to checking
for 0 on other platforms.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index b1d57f4910579..418e1c503eb5a 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
[ ... ]

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -825,6 +828,23 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
 	return ret;
 }
 
+static inline bool mmio_temp_valid(const struct xe_hwmon *hwmon, u32 value)
+{
+	/*
+	 * On platforms lacking temperature sentinel support, a value of 0 is treated
+	 * as invalid. While 0°C is theoretically possible, it is highly unlikely for
+	 * a discrete GPU in normal environments, making it a reasonable fallback
+	 * indicator for invalid or uninitialized temperature readings.
+	 */
+	return hwmon-&gt;xe-&gt;info.has_temp_sentinel ? value != U32_MAX : value != 0;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
[Severity: Medium]
Does this allow standard MMIO read failures (U32_MAX) to bypass the filter on
platforms lacking has_temp_sentinel?

If a device on a platform before CRI encounters a PCI read failure returning
U32_MAX, the ternary fallback (value != 0) evaluates to true. Any userspace
read of the hwmon sysfs nodes during such conditions would expose bogus
extreme temperatures instead of properly returning an error.
</pre>
    </blockquote>
    <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">We
      could add check like this for tihs.<br>
      <br>
    </div>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">+static
      inline bool mmio_temp_valid(const struct xe_hwmon *hwmon, u32
      value)<br>
      <br>
      -&nbsp; &nbsp; return hwmon-&gt;xe-&gt;info.has_temp_sentinel ? value !=
      U32_MAX : value != 0;<br>
      +&nbsp; &nbsp; if (value == U32_MAX)<br>
      +&nbsp; &nbsp; &nbsp; &nbsp; return false;<br>
      +<br>
      +&nbsp; &nbsp; return hwmon-&gt;xe-&gt;info.has_temp_sentinel || value != 0;<br>
      &nbsp;}<br>
      <br>
    </div>
    <blockquote type="cite" cite="mid:sashiko-outbox-170367@kernel.org">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+}
+
+/* Mailbox temperature is sign-magnitude (bit 7 sign, bits 6:0 magnitude). */
+static inline bool mbx_temp_valid(const struct xe_hwmon *hwmon, u8 value)
+{
+	return hwmon-&gt;xe-&gt;info.has_temp_sentinel ? value != TEMP_MBX_INVALID : value != 0;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
[Severity: Medium]
Does this allow 0xFF (TEMP_MBX_INVALID) to be treated as a valid reading on
platforms lacking has_temp_sentinel?

If a device reads an unpopulated or unavailable mailbox sensor returning 0xFF,
the fallback check (value != 0) evaluates to true. This would bypass the filter
and erroneously decode the reading to -127 degrees Celsius.
</pre>
    </blockquote>
    <p>similar thing as above could be done here.<br>
      &nbsp;static inline bool mbx_temp_valid(const struct xe_hwmon *hwmon,
      u8 value)<br>
      &nbsp;{<br>
      -&nbsp; &nbsp; &nbsp; &nbsp;return hwmon-&gt;xe-&gt;info.has_temp_sentinel ? value !=
      TEMP_MBX_INVALID : value != 0;<br>
      +&nbsp; &nbsp; &nbsp; &nbsp;if (value == TEMP_MBX_INVALID)<br>
      +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return false;<br>
      +<br>
      +&nbsp; &nbsp; &nbsp; &nbsp;return hwmon-&gt;xe-&gt;info.has_temp_sentinel || value !=
      0;<br>
      &nbsp;}<br>
      <br>
    </p>
    <blockquote type="cite" cite="mid:sashiko-outbox-170367@kernel.org">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------AZya5QY56WrYzpi6uuyIjU0h--
