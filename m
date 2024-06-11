Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D05C4C27C75
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 20:16:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FAD410E004;
	Tue, 11 Jun 2024 20:16:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dr+GD9GY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA46E10E004
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 20:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718137005; x=1749673005;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WajSHrLs1UYDmbifMDK7EpOLJjWmvr2l6GWJ8/LZyZ0=;
 b=Dr+GD9GY7/KsX3cbkjbn36hnEc1P2wATb8sn3HpouaC8mLzMbk3EcuHN
 baQsqKqn74veRTk0CfMwzsODziFuFsbh1qmwkI8QvkTBzyAXTXaJFft5q
 Yv7jkidBhKlAOjZX5exEnWKPepTciqk+3yLmJvdZ1gnOkKn96cU/MIP8e
 4dg/Lo+1h6r9Kw6PWhjmGQse1w5/+VtqSJYyMUMBz3F+yNBrDI3AVJ5Ne
 Cn9F4gcHlr9Oa+gXnV2H95c0ENv8c23/vuO9BaufWzQuZQi00pw+L7wJV
 opmNS9F1uSEMunkWOwq/IOkcROLSk3E6Jq0/uFR67Yj14cNXOhakSDIHh Q==;
X-CSE-ConnectionGUID: qEJ4ozqDQIarge/PyAaL6g==
X-CSE-MsgGUID: y8m/JTbKTmaVRQlPMGj9Jg==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="15100139"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="15100139"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 13:16:45 -0700
X-CSE-ConnectionGUID: oZDcPacAQKaCD1CxHdt+Vg==
X-CSE-MsgGUID: HaZukj8NTv2CR9qQ8r3Iyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="39651026"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jun 2024 13:16:45 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Jun 2024 13:16:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 11 Jun 2024 13:16:44 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 11 Jun 2024 13:16:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hS/pnnvmKoXBqfhNWIgF55B0tecKEO4GMdzZowBBj7bEiG8iarhWoIh9OYpvZtvSk10fe12FW+fgVa3oBvjBkfOGMiGniwQl9LdVeSJhmiIyWqh1Ng17f3ADy7qVlwOaW1a5eIq5sZctr9cBYlHczL0tzQeO+Fx8aHTqXY2FkO/fyfEq6SmyP9a3zk9KFgAPTbLnrgwIzLVDu+JuC0PZGUZ7DeGLyTe1g/eJWvipG3di81a8Sj0qhtuutTxk9YSy+DeiHFtf64jd+QdJGKSN2SriB/QUWHS9XNI0V3uqFZ4PEopAfc0SjuLaOHuJ+0G44Cnv9EKLFqgsBGRrXs9OpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7q88vSe2af0Nke2uXQohSX9TojDNFVZ8wVW9kLpYaE=;
 b=XlVSEXg7aeHCH8Vod12IKPYYl6CJT33d41/hwXunUfuPCfWGAJY+zzdjKPNX8hVR2FBfko4EQ3RFva4i6cr8Pz8dnf4kIdmgQsVf1++nfVvuVzkArNrwA9JTKnYXQy2GRd7Z2EGVNjW1LqdQ4pkKPCUS+M2Sg9ZXHCsvUcK1y03OswyV4ZY97aCPFtIptozJtgJD5j5cvFQ34AJpwq3gL+/72u9gcb4IEz+hhrClfFNwsaWGwaXWtcSZjEiBACWHt8ikQMUbrVSDX0+ihkBdkEE2B/b4Fmf8HdM56so0Mo5m7+FcJ8ttzdfr38kCPFF/sVE6kS5TsPQ6Au/ijSQy+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CO1PR11MB5108.namprd11.prod.outlook.com (2603:10b6:303:92::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Tue, 11 Jun
 2024 20:16:41 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7633.037; Tue, 11 Jun 2024
 20:16:41 +0000
Message-ID: <ff5024c2-a973-4a04-a41f-d0197ea74561@intel.com>
Date: Tue, 11 Jun 2024 13:16:37 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/xe/guc: Avoid named enum types in GuC KLV ABI
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Badal Nilawar <badal.nilawar@intel.com>
References: <20240611180735.1988-1-michal.wajdeczko@intel.com>
 <20240611180735.1988-5-michal.wajdeczko@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240611180735.1988-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0266.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::31) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CO1PR11MB5108:EE_
X-MS-Office365-Filtering-Correlation-Id: b58327c3-9372-42a9-0823-08dc8a53682f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230032|376006|366008|1800799016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vjlzd1NXclNqSmZRenZGS3hNNlBDeHl0alVZRUNTMnhaUytHWjY0N1dWWGFB?=
 =?utf-8?B?dUZuNzBLNWdRQTA0UTduMm80V25kNkFvOVc4WVE1T2NIYjZVQ0YrcGtvS2E3?=
 =?utf-8?B?a0tmWkFyTHZWK3NDNE9IQnBnREg5VmVVVUI4Z2xMK1NFcCtJTkxZdmhhV3JQ?=
 =?utf-8?B?MjhTWFBhWklZUkZCdkRuVnNTejFPVkNqMi9UNDBFcjArSUpzREFoVXVGamY3?=
 =?utf-8?B?Rk03cGFkelBXa2x3VmFrbTRYNTZreUdBR2tqa095T0lRMGVqckRxZWhPZERr?=
 =?utf-8?B?R0wxaE8zU2pRQlNJb1ovYTR4WnY3TElKVmtrQnZ6UzJyUWNQY2h2WnV5YjBM?=
 =?utf-8?B?SHVxU3ltZFRmbDl3eFRHek9jVUhiUHl3YXRmZEgrc0o1UlkxanlucUdlWEIv?=
 =?utf-8?B?ekNBVWdlOXB4UnVFdkprVGJUSkxBN05DRmtwalhuZmp2N3FwS0VMRFZkenZZ?=
 =?utf-8?B?TE82YThmV2dEUm5ZKzQzaHkvQWwvRUpHSGRFNnpnSmpEc0JKcENET0NMdU1t?=
 =?utf-8?B?OUxSOGo0aXMybzZHQkMrRFI2N2lUbmIvd1dabWtlUkNhcnVWcFd2RDhudWVG?=
 =?utf-8?B?c2hZS3EyNVFyTGIwYkl2Wkl6a0dob2MvYkdUbHhDa0t2NDJmUkNsQ0RsaGM2?=
 =?utf-8?B?dFZLaVhmbkE3Y1JsUGNIMWh3NXhNTVNndHhXUXFKdzBwbGdMTWI4VFd4RXRM?=
 =?utf-8?B?cmdVMmcxRGJJUjhVWGxrSktyZHpVQ0pPc29lQzBUek1NejBvT01waExsQVBK?=
 =?utf-8?B?Yy9RM3lEYUV4VS8wbHprWjZuS28wUmRWZW1uYWVzMUgyRmR1QmNJUTRUSmRj?=
 =?utf-8?B?aEhPVnN4dGdSQTlXOSthUWVIS09Tek5PYjlMR2NRNU5Zcy96cE1yZ1dYNzJN?=
 =?utf-8?B?WFRZWmpmZDUvWjdaMXF3ZXJYOGxCVXRoei9BalpPa3FwZ3VBZkxxTXEzVlh5?=
 =?utf-8?B?WkpMRVQ1ZVU1RmNZWDAydzMzeW5TempRSVgzRDYvL3V2MXdqUk5kUkIxdW9Z?=
 =?utf-8?B?cFpQSnlCV1VuMms3R0ZnUDhxc0tqWFhnSWgwS3kzQktCN3lGNGVmMkdjRFli?=
 =?utf-8?B?TjdMTjM4U1ZNTUFNTVF5SE9hZjBFYmEzT2JoRVh4NnZOYklVV1lyMlZUUGhZ?=
 =?utf-8?B?NXEzdi81dkI1elJRd0VqNlAwdlErZTUvaytWM1R6R1Y2TVE5TW1EaXZncW1z?=
 =?utf-8?B?c094Z2kvUnhhSVNIUFpqaDlSdThVZE13eXpNUGdSSzZtYmkvbThhL0NXb3hT?=
 =?utf-8?B?UTZjbUorRVRjUWZJS1NRTWwxcDVyZEpWcFB2SE9kNFVoTzU3UTg0L2NMRDY0?=
 =?utf-8?B?eTJZcVdXb1VIUFBMT3gyRmNHZlFDUGwrNXZ5eFVid2c4a0Z5TWlrcENHTmwz?=
 =?utf-8?B?SHlpTlRFQTcvelpVYzZCQlQwN2s2WHo5M2FBdHpxMDR0R3R3VllTVHNKUVla?=
 =?utf-8?B?dE43NWlIMUlTTnJibTQyWlFpeVpXbncxY0FxQTVKYWFUUVJWb1dNWnpndENY?=
 =?utf-8?B?d2FTV1NsR1hqYjI0VkpFTkdVc213Y25QYW9mc29RMG9vRnlZbXoyYkFJYWcv?=
 =?utf-8?B?bTV0cXhOdTZtYXNIRllTbnVyQlh3TnhuUUdoTFNHa3lUMXFQUTN3Tm9JRUd5?=
 =?utf-8?B?ayt5ci9ISVI5dHAzcm1JM3RvcVR1UWQ2RXZBWXpuQUE1SGN5QXRZdHUvYUhX?=
 =?utf-8?B?SkRXaUtCSmxLVkVzZFRWaUZWMEYzODlsQk4xd21ONnI0eGcwdEZHNkN0MGFP?=
 =?utf-8?Q?a4G+P9d2qYS/7hPUQSLaXypuFqL6Hk1D8sAhjFx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230032)(376006)(366008)(1800799016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rm0xVEVDYVEwWWZ4TkVpSlhHa3Q1QUk1RzRqNkxZV0lPbFkzZHoxa2lwR0ZY?=
 =?utf-8?B?cWVORlhrcm5lQTJlVFg2NnFhUWRBZFVzaEZXWkZNaTM0ek1MQm1hd3ZuSlFG?=
 =?utf-8?B?WlI5M0pRYTA2cFNmT3o1ekwyQUVNYnBRTi8zWFowcnkzR083elJTU2Q1THNU?=
 =?utf-8?B?Q1hncjBXc0RpWUhkZVNMU09CSXYyaWJxcHlQRGtBYjZOUGpuYnF2UjJENXRr?=
 =?utf-8?B?MFNCQ3FVb0VLSHB5d2wvZVozaVNtR1BRVEtQWDY2OFZpQk90UUh1dmptdVhu?=
 =?utf-8?B?b1JiTmVwRXpZZnJNaXFhVlNsWU9LWGdBQ1paYnYzYWxNdFlKNGNZWnJtODkw?=
 =?utf-8?B?V2t1QWVEbk5OdWVRdjNuMElGcUNEaDRQWWhHR3JhOFV5d2JSRE1OVnhtOXhK?=
 =?utf-8?B?NGtSNUhHMkxZaVo3ODZUMUV4N3pHY0p1akx0cVFuSkZ5VVRTYlZjVThsYWxz?=
 =?utf-8?B?NHhSdjNVV2NrclhFa01mWjdFTk9maU1xT2phUGtFNXRFVHR4bCsxN3F3TkIx?=
 =?utf-8?B?WWtXUTVxZmdVYmdEdEVHRzA5Vm1PVVR6QktKSWpOcmY0ZFRLa3ExZ2FLSFdu?=
 =?utf-8?B?QWlXN2RmNXpOOFl1ZTRlQ3V0ZmRueUE4TnIrdjNUQU1MSmhFak1MZVdPd1o2?=
 =?utf-8?B?S2lwWjNBZG8vRDNpUXVUZDRVdndHTm4xdEZlaHRhUStObnBGUXI4dEM3WTdG?=
 =?utf-8?B?OUFHTzM5a1VCVlBrN1poWFFKaUpoZEV6TktxK0dBclp1eGFsZGVKdzVRY1Ew?=
 =?utf-8?B?U2xVR1phZHNvOHc3bVA5SjNhaXpqR1lkQnM3S1NVc1BzMDN4TzFHK0pSZ3Jl?=
 =?utf-8?B?WWZaZUFBZmlKNjFBRjUzalVrRzg4Nk1SZVF2WXZhRGNnWVNMdldmN2RpY0lR?=
 =?utf-8?B?WERLS2NYN1E4VFNUV3AyYWtUaTJJK2M1bEZpSUpvQmFvdC8rZ2xVOUtFYzJh?=
 =?utf-8?B?OThEcDNXSkwyK0xEZkErL3p5ZS9ZYXJYV3pUcGl1NklwTGt6cUZWL2k5RDNQ?=
 =?utf-8?B?VXZDREV0MjFMYk03c3pHN003bG5ES2RTYmE4VHRrVFRDck4yK3F0TjgvTjRj?=
 =?utf-8?B?emZwdGV2NS92dUREV29qZFRndjBjT2FQZGtIUUFNaXRtcjVCZksvektOdUpO?=
 =?utf-8?B?QjUxWGtLazJsUkxGK0RYa2FqK3gvY2dlSVZYMm9ZR1NQMnVtenVWQ2ViQm5X?=
 =?utf-8?B?bVdZZ09lZ2IxQWdnYzZjZGpNOE5ib0FKV0M4dzJLODJJdnd1SEFBeXRHNDZY?=
 =?utf-8?B?NzlkMDhXNlJaSWlNZm5JL0lIaWhacmlOMjZVaHdmZ2NhMzFLVnFjMjJ4UmZt?=
 =?utf-8?B?NFdjM1QybWpkdUhZYU5uMWlPbUlVMGNkNnFxQmc4L1RsTCs5R0VJa2hSOGpz?=
 =?utf-8?B?aGFsMnc4QVVLcWhrMmh0OGo4Ly9sTXI1cC9NbnJqMVZkVGk1L0IyVXNTN1ov?=
 =?utf-8?B?MFN5VWh2MXVLMC9FNjBpV1Z3Mkl0MGtXWFlyejN4NG0wbEZaQTh4QlJwQVl0?=
 =?utf-8?B?MThXL2UvZEcrNFdhYlpUdnhkekVwNGFudlUwb1BKZCtwdDhEWk0vOEdIUHNW?=
 =?utf-8?B?RnVMbG1XMEZnK2RuWnl4U1dLZlhjZXR0eHhXSmJRYnVGU3lBQVN3SzRMQ0pQ?=
 =?utf-8?B?YzY5d05PRnZ2TVRBeG5UTzFlZk12Wm5ScElGcVFmeDFDZ2hlZzBEbmFwdFNi?=
 =?utf-8?B?dmdRNllFaDl2c0liZlA1SEZhN2RldlBUQVBOK3ZNNTZBYUMyR2RQaEZud1pY?=
 =?utf-8?B?TUJ0YXJ1aWJ2VUhHbHNXdmQ2RC81VlhrM1gyUmFFNWpyQWVYbkV0QU5QTnM5?=
 =?utf-8?B?eTZxVlFtUHlLb2xBUDdobkF3dDRJUjVXbzQ0VHdMWFZaOWl6QkNJTFFEdXV0?=
 =?utf-8?B?RjdjN2RKOUZuL3ZLT3VVMVV1cDBiS1ovekZ2YThYT0RMUGROakFibjB6SmNp?=
 =?utf-8?B?SlJTTGp3V0krODloKzBSOExFL2VLYTFhbmVkKzN0OWJ3b0plTTRsbnpkVDFH?=
 =?utf-8?B?V1pIMzlIMW9SZjYzQ1p4R0RUUTJOdTB6UUtkcHFlcjZXMnIxVXNLVGlENi9q?=
 =?utf-8?B?bWpkb3Z3OFFzNmx4TEJVWHFiVzZ2ZFpZei9WSGpMRFVocTh4UFZiUjBUTS9U?=
 =?utf-8?B?MHN6azRhYjZlb1J3Q2hRUEY5c1Z5dkU3Y1huZVIvSFZ2QXM1YjlKL3YyUml1?=
 =?utf-8?B?WlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b58327c3-9372-42a9-0823-08dc8a53682f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 20:16:41.6853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sI4DV74vhVyJv6pWxgOk7vbIZ/v/JqvRLXD+G+UxT8nl27Vi7lrQbDLWqaw6IJDbMORocmNkM6yI385jFsoLqvu8QR9iykHZMQAICH9q+aY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5108
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

On 6/11/2024 11:07, Michal Wajdeczko wrote:
> The xe_guc_klv_ids name just for workaround keys is too generic,
So rename it to xe_guc_wa_klv_ids?

> as workaround keys are not the only keys used by the GuC firmware.
> Other KLVs keys are defined as plain defines or anonymous enums.
Just because other instances are done badly doesn't mean we should break 
the good one to match.
Having a named type gives you an extra level of compiler type checks 
that you don't get with a u16.

John.


>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 2 +-
>   drivers/gpu/drm/xe/xe_guc_ads.c       | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index a0b80c9fc5ef..831a2b57f308 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -346,7 +346,7 @@ enum {
>   /*
>    * Workaround keys:
>    */
> -enum xe_guc_klv_ids {
> +enum {
>   	GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED				= 0x9002,
>   	GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING				= 0x9005,
>   	GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE				= 0x9007,
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 1c60b685dbc6..a3de00e92b4e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -285,7 +285,7 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
>   }
>   
>   static void guc_waklv_enable_one_word(struct xe_guc_ads *ads,
> -				      enum xe_guc_klv_ids klv_id,
> +				      u16 klv_id,
>   				      u32 value,
>   				      u32 *offset, u32 *remain)
>   {
> @@ -312,7 +312,7 @@ static void guc_waklv_enable_one_word(struct xe_guc_ads *ads,
>   }
>   
>   static void guc_waklv_enable_simple(struct xe_guc_ads *ads,
> -				    enum xe_guc_klv_ids klv_id, u32 *offset, u32 *remain)
> +				    u16 klv_id, u32 *offset, u32 *remain)
>   {
>   	u32 klv_entry[] = {
>   		/* 16:16 key/length */

