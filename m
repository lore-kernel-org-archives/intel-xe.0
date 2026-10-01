Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 130A9CA5FCB
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 13:29:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B638510F682;
	Thu,  1 Oct 2026 13:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="czbyPf5Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D1510F682
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 13:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790861381; x=1822397381;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=RIAjiZ3/oQK/p7sT2E9vZC7dsm1S8Vi5hv0I/RGNRBU=;
 b=czbyPf5QKLMmNdzfOCcuQ8jgbtKls0pO1vlWIFi+oXoG1vcXod1dYmNS
 d2EFu/nGVmgAwwVd6PVsZHATHAWAszzw/bgd4z2PRh20ewHJbSJKZHSRX
 sLSxSERMg/toWmpsiglAqbOi+yPQhvIw/tjPYYJC+EGhbZtbquO0Zt00b
 bNxJd24vWuvYUjaeWzFQ5rrkR4mIr58gh8+ZGLK/NQEAgs/kFY8IAQBRW
 3BorVpOjDjGT7hLoyx4eNSMc6ipp1IF8MLHEx82fyn4CdJ0lvcbPAu+3M
 VE9xkRLl/0LCPSFZ9IVyf9zY+4MKtdDhs+klhhtIPiYDAY+RfYeOhLo8n g==;
X-CSE-ConnectionGUID: atDYUuEjT9yPAb6+HbU/KA==
X-CSE-MsgGUID: wZ349OE7TcKAwmHPOtSkpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="91715648"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208,217";a="91715648"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 06:29:40 -0700
X-CSE-ConnectionGUID: PAucQ6avTXSBZrBllcwUJw==
X-CSE-MsgGUID: uRVgJdlqQJ6IqJ1MocvFxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
 d="scan'208,217";a="279222604"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 06:29:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 06:29:39 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 06:29:39 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.7) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 06:29:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l6lIfNi+Lo3LszRUeCelf6CHW/XL1px1Srv1Y5HRy0VzhO2GR7rXVdQ2vTlbJ7+aD0vj71theah78RDlgAhDNxdVbCRy7lfA9+30sIw9wOfPyLx83mLr1oFPKR/6OwpGW9RnGvOSvkiqivPUBqWKelrhDXxKQnJkJpHgtEYU+i1j22QPu6Ty6iW01bdli7TsIcCwbYmpHBrieatpSBlxTOl+4+JQCwMwr3V7caZJCMmYtHBTJneNnPQ0yb4pQcPr8xW1cL3WwCm9OpmEx8TQMcJHemgVI5ihFW2DFuDV7RoBDo9dZiiTILYj0u3UTZUUl+yIc/XEStqgNAlo+zlKxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qmqmSoBRoeExc4BNaQRYHjF67OZ11MKtzT3xYIClb5g=;
 b=wTHZOiTcJx1uuB60AyXhxw/iXGhBYh+dvjfafeLsaUwQW13QJMNjGsipD6sTFfVN3qBpXuDSrod3kSF2YhApuP2qVcB+nrOvCsek227/frepBfwqLC5Wc/cGHBF1OwgLNXkIx3DAAWfDPsYlR/G3VH8R8EtjkEi6CqG4UXwyK4mu2nAErxtUVHikWHqTKAJvy/9mHBf2RSfaU80A/Rf0qvjl8f31B9+57aPU0dUAHVZP4I/aR5rpPOZcsaeimX0CrrnxSpWZ00znFzbOcYig93GbzvKF1giFsZQ4CrDFlgxuhRZR9qlSsuO2udOHME2/2VhUqQ4RYhDYNjDB+IAMfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by SN7PR11MB6827.namprd11.prod.outlook.com (2603:10b6:806:2a2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 13:29:32 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0472.015; Thu, 1 Oct 2026
 13:29:32 +0000
Content-Type: multipart/alternative;
 boundary="------------ACJrzUNiqPdzZJLK158E001s"
Message-ID: <25a9e030-562c-4bbb-83a3-a5e5af5d666a@intel.com>
Date: Thu, 1 Oct 2026 18:59:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/i2c: Expose AMC Alert reason sysfs
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20261001121302.4102629-2-badal.nilawar@intel.com>
 <20261001120746.06F791F00898@smtp.kernel.org>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20261001120746.06F791F00898@smtp.kernel.org>
X-ClientProxiedBy: MA5P287CA0337.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21f::13) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|SN7PR11MB6827:EE_
X-MS-Office365-Filtering-Correlation-Id: 755fa38f-076b-449b-88bc-08df1fc006dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|22082099003|18002099003|11063799006|4143699003|56012099006|8096899003|10067099003;
X-Microsoft-Antispam-Message-Info: MggNnWpE8GypE5Z8Ucotn3xTjdhc/ld6bI+Cxg+uv77F95kwFkpFYb6KrdFTpuBprEoxfOlfn6DwD9lARbdgmKnlgShnz1XecOFhKId4eT0EeIufP2tF8/LatL3VbFylHIc7OOPGxBqZn3bsExCWBijTLkiSJz4OK+kXumUAhlnzRkqGwAFcMil0RQ75xu7Hig2Jv+4Oxu0gXrtOjQHBA1fvYrEnrShpGty8pMD/T+WzOFTrBWliQWsINcSS63SicDMOrEIFcnRYqiXUZvDuIGhzwVKNuBV1i0gxDAOfhrEbLcjM+rVWzNzb6yrFNjK9xHUMRfMHVUAtLZQyUpXqygpP5y706WNGMxTVeYGuePohdFQz5An4EsAxSqWKD4Tp6avObg4X+mIwcWBZaWj74nT0uCm46hWIM2P3msr6fgQDp24hcbuP+fBZMm+vxOWlSYQ28T20AnHBpsGEmSHpuXO8qARnPCnEMk41YF0MKB+aL1YxfZyKzSxz/ULb3JR0iWMdpA1qrNOfvo0A3kskPx5PztvDs35IVDnwOfh2dO2AWHGVJhPewrjNDukX4JOA8KRdSqsBfvCqD6hYD8qlrbw80lRD88GlYzH8iG3hMMx9abk0nNlhN0A1sQsXFxJ+SQ5qnF5Rf/Ptf1iCQydB+PdqI9zbWqU9ki9T93sbPNs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(8096899003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHRILzA2QWltT0w4c0VKWWl0YUUvMUZ3dmRpVW9lTXg4aVMyYmczcHhCQ1I2?=
 =?utf-8?B?c3lVcW9hNHFXaGtoVVNYQlVIV2hoVkxwTldsZllURUYyMHpDL2xCaEVSVEQ2?=
 =?utf-8?B?dTZJNGpyWlJEaEt1dytzVFJOd3U0LzR2ZFBIbUY2OWR0SWVxdGtOYXA2VE0w?=
 =?utf-8?B?clo0dnliY3FqMnZlUkhYSWNscmNiZlQrVTE3MnB1Y1BGUGVHaVduMG5vRVJE?=
 =?utf-8?B?RWhJMHpHdjg0eFhJSFhNamVuYlhPV0M4cCsvakREWmF6TjVDQnpUOWN0VnMx?=
 =?utf-8?B?NFJwRUhBalhEZ2VzdkxCc2c4WFVNMlZHTjNzRFZWVHZqT2JNN2xMWld3QzJx?=
 =?utf-8?B?RVh4eWdWbDhjKzBGSVV3eVRJWCtrd1hFakVkQkk4YnZGTEd4U3BzSlVWOEt5?=
 =?utf-8?B?WUUwSEFCUWVSOCtBZWowbk9HWXBFbXJQUEdQajc5STAyQis4SDdHbnNMUGxL?=
 =?utf-8?B?ck93SHFHdTE5SlQ5dGtzdXA2ekZXMS85UEIxR2JlS3ZBSEpGc205K1pDREJ5?=
 =?utf-8?B?UGQzQXd0N1Z0UGRYclE1RDIvZnJLYmVwd3Q3VzJ0WWtBYTc2ZU50RThMVnhT?=
 =?utf-8?B?QXh4ZkZmL3lWRnd6M0MvR2lWZGgzc1lXZ05UK3pHS3lVVHIwSDViL3d2UGtl?=
 =?utf-8?B?VXRNSGEvSDVkU3FZS21vcjZ5RmN2bGppd1RFRDVOYXlTSjFNeUhzeHFGeWVv?=
 =?utf-8?B?OGllYy9lS2E5RG5NNjNVSG5QZ29RNmRUSDZKWFpQQlR1RHBGSXZveUdzdW9X?=
 =?utf-8?B?bEtjTFN2ME5WMllOMnR3TzVPWlFUTllhOXA1NFdWRENvS0JiUjNYTVg4emNU?=
 =?utf-8?B?bUFRaWtpbndUYlh4NmwxbFdTTGhlaTBzNW1reWZpWjBRRWpocmdtZHdOeXR4?=
 =?utf-8?B?ZzJMU0JMckxJVW9oZHI1SzcydjNqRDNYRXExMUNEYjZyMUFhckhVNktFNUpF?=
 =?utf-8?B?OEFJMkpGdFR0MmVrKzBmSnJidHJZMHhDMDd1TDgrS0VjU3VCU2FWeE13Vnhi?=
 =?utf-8?B?NytiQTZaS3JuZjlab3dhUVJMeTRyT0dWb1hlbkpVa0VmSnVQaXMvdWVXSkFh?=
 =?utf-8?B?cm9keHpKU1E2OUlIS3JpTWdnd2ZEa3h0SU9YSzNLeGJBeitPT3EyNWN1N1Rw?=
 =?utf-8?B?cW9WRjE5Q1Z1cVhadzFRRmo2THVGRmFCdjhUUnVoa2VtMFZ2NkhLbWZiUUFL?=
 =?utf-8?B?c0NGMG9jSlE2RFRBZ3dLVmtpRXduTVNwYWE4L1prelQxd1RGd3N2RFAwc3Bm?=
 =?utf-8?B?NXZvdnd5MTB2MGtnUlZYNy92cjZFVkJKUWJoeXZKZDc3d2tETVBwckVHMERu?=
 =?utf-8?B?dFV6bW9WRnRUTWpvVDE2dldjUXFZZ3dtTkk2b05mbWtpLzJpcmNYQy9iclp1?=
 =?utf-8?B?UitmUmNsSVRvVHYxOW8yK1RZMksxR3hwMHFMbjdnKzRoNlRCV3RlaXdORk8y?=
 =?utf-8?B?QjBOYk9HVG5uVDVhRnc0cGtDT0NjL1lJK0Rvc0dvYkxoSFIwSS84RnBicXc3?=
 =?utf-8?B?TnhKTXExZ085SExhQkdqd3ZuY0xLcytEOXBCTVBod1c2UkdwZm1PUFNvOU9j?=
 =?utf-8?B?eFU3NjdKdk04ZFJYcjZVS1REUDdmT1VhKytEWEhzeHQ5VVJMTEt1UHJsRUhY?=
 =?utf-8?B?ck5VakhqalFFaUJlK3p4ekpOSmRhSndpL2tRK2ppVWdjS2p2T09lZjFVMFJk?=
 =?utf-8?B?SWdXQzhJWThMVmlQK0hwclFuQUZ5L2hEMGJ0N0tKa09Jc3pVUUdrSUlOdDVn?=
 =?utf-8?B?RE5jTWkvcFZteCtBdHdBTmYxSVRLRnhtWUVGWFBLVXBHYW1EY2U4OG5LbGFT?=
 =?utf-8?B?MzJaTkVjWkV3ZE1TeU9GSUVoa2NKWkR6NFhlMzJqd3ZDMlBwcHJLMm9OK0VV?=
 =?utf-8?B?YzFhM1ZHMkdzQXZETmdNcEhJbXp5Qlc4RWVGeTZuNTEzZ3ZVK0dGM0Zvbkw1?=
 =?utf-8?B?SjY0NHp1RzMydXU4RVIxMHJndGNTbzRodS9pRm1iSXRiSDVzdUh2TTFUWmx6?=
 =?utf-8?B?Y3FQVFJNWUZQVXFBUEU3NEphNHErS080MjZGYzZKdlJDWVI2Wk5TN1RHSDJE?=
 =?utf-8?B?eVRoVFR3SS9YQnNHSzZnS2JyaHJ5SXZ5MVhvaWxVNVdTZVoxMEJEWGlSYjA0?=
 =?utf-8?B?L2RGN25RSTE0dmc5ZlJUS0dGaFlML0R4ajlXd0lJYXZoVzVnS3Rad0J3N0VJ?=
 =?utf-8?B?YlZRV1drNDQzMlk4dVN1dGFsN3hHNjk1YmwxaG0rb0U5U1h4SS9vNnJlSUJW?=
 =?utf-8?B?VkJERkp2ZGtnY2QyZzRZSktFWTZOQUwzTnRRUkltWFVZSnBsTTZWL1k1U3Ra?=
 =?utf-8?B?K3I0d0gxMDAwUUpmOTRpS3BPQWs1ZVZoWU1xWG1YSktPWlQrT0c4dz09?=
X-Exchange-RoutingPolicyChecked: yIhHTDH5vM+54fDTWuCS49RmZ+C28MusPi+4pen+PYidn2cZBkz7faXIsdx31zW8soYdr12LzOxgNb7JZXkUVKzHGBjrBU3ESJ1a8ijkww6tSeUCxVk/BQaJzwPEN1IktzDVgtjPIe9qlr02iqDHsUShTu/Rtp8ET2VqXpPlodXXPgP7iQfEyIYrhCIkHYsUbHUTRKvBCkXvgEpiPbhsOO0Bl/+EfrhJ76FdwUej5IVB7Zo7MM/M0zLB/MoHWJ8LGEUR7/gUzFFDrTsEzBNhx7/PoUjv/FPOns9JdpfYevbpGVqXusULkSxWo4krvz/EwEPUwJQZ2RCIW6xqS4wUfw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 755fa38f-076b-449b-88bc-08df1fc006dd
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 13:29:32.0211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rkzCdjg8W4eHfhgNSjGC7EbyoRNbWtJye675kJo7yvYTLGbwMb2F5LFy4DY3xgO6SFXTGASeLUXbgh8XC1vMeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6827
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

--------------ACJrzUNiqPdzZJLK158E001s
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 01-10-2026 17:37, sashiko-bot@kernel.org wrote:
>> +static ssize_t amc_alert_reason_show(struct device *dev,
>> +				     struct device_attribute *attr, char *buf)
>> +{
>> +	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
>> +	struct xe_amc *amc = xe->i2c->amc;
>> +	u8 alert_reason;
>> +
>> +	if (!amc->alert_seen)
> [Severity: Medium]
> Could this read of amc->alert_seen cause a data race?
>
> The sysfs reader relies on this boolean flag to decide whether to read
> alert_reason, but it lacks memory barriers or READ_ONCE(). A concurrent
> sysfs reader might observe an inconsistent state here while a new alert
> is being processed.
|alert_seen is not intended as a synchronization mechanism. It only 
distinguishes the initial state where no AMC alert has been received. |
|The sysfs attribute is expected to be queried after the device is 
declared wedged, by which point the alert state has already been recorded.|

--------------ACJrzUNiqPdzZJLK158E001s
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 01-10-2026 17:37,
      <a class="moz-txt-link-abbreviated" href="mailto:sashiko-bot@kernel.org">sashiko-bot@kernel.org</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20261001120746.06F791F00898@smtp.kernel.org">
      <pre class="moz-quote-pre" wrap=""><blockquote type="cite" style="color: #007cff;"><pre wrap="" class="moz-quote-pre">+static ssize_t amc_alert_reason_show(struct device *dev,
+				     struct device_attribute *attr, char *buf)
+{
+	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
+	struct xe_amc *amc = xe-&gt;i2c-&gt;amc;
+	u8 alert_reason;
+
+	if (!amc-&gt;alert_seen)
</pre></blockquote><pre wrap="" class="moz-quote-pre">[Severity: Medium]
Could this read of amc-&gt;alert_seen cause a data race?

The sysfs reader relies on this boolean flag to decide whether to read
alert_reason, but it lacks memory barriers or READ_ONCE(). A concurrent
sysfs reader might observe an inconsistent state here while a new alert
is being processed.</pre></pre>
    </blockquote>
    <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px"><code>alert_seen
        is not intended as a synchronization mechanism. It only
        distinguishes the initial state where no AMC alert has been
        received.&nbsp;</code></div>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px"><code>The
        sysfs attribute is expected to be queried after the device is
        declared wedged, by which point the alert state has already been
        recorded.</code></div>
    <br>
  </body>
</html>

--------------ACJrzUNiqPdzZJLK158E001s--
