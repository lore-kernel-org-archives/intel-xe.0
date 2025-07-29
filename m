Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D38C87FCA
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 19:08:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F03A010E090;
	Tue, 29 Jul 2025 19:08:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ioVwsq8C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9930F10E090
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 19:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753816114; x=1785352114;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=lgBFNPBl1O+5UrbQwxuX8cmRARX5Gb9aClZt3bgQ2l8=;
 b=ioVwsq8C7PZtvpzcDVSqSU1e4q/njUxK34q9WMjVDrRzk98XrzKdRi5y
 3S7URWuz4T7AnF6CF+PaB/RmqMcvtYi5YmV9TDTb4wfY2GP5QOWaYCFJ2
 1aUNxyHxhWVdhyHh3xoXwZnofJJdbRsX2jZE6nb7tNFac9NBcHYJZ8aQO
 RmOUFxGcMkwZBcS3Kz6LtrkmkBqxwYSCXLryhS2SLpF5/7XY0JRG6eTDo
 JHINmMZnr+hWmN5KJK163z5ho5ZubQAWbk045MkxbszSXvYAhiNcxUuB3
 bcXCwHsI0q0RBKxNpSdyq36vs4KpeLBnyM87TYOcM7wphkDjB0T4a/zOO A==;
X-CSE-ConnectionGUID: AEEB2ZkbSB2x5f5k96JWCw==
X-CSE-MsgGUID: FPHpSWbERDG/YnGn0tzFvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="56072739"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="56072739"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 12:08:33 -0700
X-CSE-ConnectionGUID: KXmFq7ESSUSwpdB5pcMJGw==
X-CSE-MsgGUID: 6KE9uCscQi2pOD1MaKRClQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="162046933"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 12:08:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 12:08:32 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 29 Jul 2025 12:08:32 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.59)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 29 Jul 2025 12:08:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AgSnvZseA6xTI/R76Zl/0o5njp9LggQ1Fqop1egmEgTN94vvk42xXag9VDgu6e1XMhPnXb/OmfaatFtHuawEti60r3Pe77AjNIT2VoXr9y2wYKmN2V9VqUGNOMhXBFFH6+kMwOPMvVbPA/Jd82Kzq3i27e0SX7Ql9JQtxWFi36AOI1Q80k9Q/IpY2dKXRlkNOk9x8EYjip/sAMChtAWPBT/hO8Qzfvb0PqQu+z7s9JYrm10Hsz3o6ef77RAZ92qBG9cYQGVCx9lHkYhC/9sTEDjghhq62bVEIbJ6Y7X4oAQvyxyDeOaz3aVKzbtvth1aeB4iX5iyLKbWx2l80Shypg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ee7niCo/5yoYUk3YLx21FJm3HVJK4POV4KUwIReC6NI=;
 b=f+7Zcl51ot/Q9NTfWfIm4Jx+tTyDwb3mXnfBZolgcA0ptvMAdf7fpF7DcKWXoFJWusLcqKn4cEEI79Mibnsexhb4M7ui9sE3O9hgnb8DtJgkh7PtZH6N9KL1n6C3ZzwpHly3vIG80GWADdazjzicmiAi73Rwx6vMm+jB6NOVadrc8cj67Ii/iHdsrFbhCy5d6SmthWxzEaJ7fea++1e9yVH+ai0yQelG4kGjfCVy1hMmHPUnpIqPujv86f8ICJeug7GXfRF+kY1enX7kMRdWeijZXrRcaPPRwG7dfBC8Sei33w+XNZli5jZbeEH06jG6Lm/r1WYSxTWbLoSG0wNXAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 by SN7PR11MB7091.namprd11.prod.outlook.com (2603:10b6:806:29a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Tue, 29 Jul
 2025 19:08:30 +0000
Received: from CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2]) by CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2%7]) with mapi id 15.20.8964.026; Tue, 29 Jul 2025
 19:08:30 +0000
Message-ID: <662c3ac0-0fef-4c66-9827-9b6cd20b2d4d@intel.com>
Date: Tue, 29 Jul 2025 12:08:28 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/6] drm/xe/guc: Add LFD related abi definitions
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250722013553.1266218-1-zhanjun.dong@intel.com>
 <20250722013553.1266218-3-zhanjun.dong@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250722013553.1266218-3-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0294.namprd04.prod.outlook.com
 (2603:10b6:303:89::29) To CY5PR11MB6391.namprd11.prod.outlook.com
 (2603:10b6:930:38::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6391:EE_|SN7PR11MB7091:EE_
X-MS-Office365-Filtering-Correlation-Id: aeb37dae-4629-4bb8-d605-08ddced34e64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dDVqSUxEcWhFNEpyY2ZqZFh3TjhPZ1I4dXZyRWI3VFVOOHJoVGlRc25hc1Zv?=
 =?utf-8?B?MDU5VTlMMUE2Njl6RTV3c1FWaXJnL3JNTTJuclhaVEJXMXlUZ2FodkwwcXl2?=
 =?utf-8?B?cFBKc0Q3ZmlVbWFDOTlmc2hXbmJGVEoyTVJmYXM1MkZUaXZrNzF4cDRZSDhF?=
 =?utf-8?B?VjU0REFleGM5QWJWZGQyZ0VUVlBzY0tNSTJWYkFwK2hwVlFidS9hdjVvdXBI?=
 =?utf-8?B?VHIrY1lzZG9HTEV3ei9UU01pbXlsS05YZHI2MCtoWVRoYmNOc05BRlRjRVUv?=
 =?utf-8?B?dnFucjVRYlJoMjBaeFViOEc1NHFzRGI0M2t6K3MzU1kveDZwU254TVRjVHJE?=
 =?utf-8?B?MW9FMmQ5VGhQeTRLaXFNWHliOUpLQlNtYUxRbkdUWGJVVVM0VW9hZ1c0WDBw?=
 =?utf-8?B?MEMzdGQwODVJZWxHUXdBd0tERllsRDVOczhsUDNkUEQxblBLZkRSUmRMWndV?=
 =?utf-8?B?Vi9Wd1dGV2xXYkFudTRQb256bEhUKzRXMCtDVU5iTVZzYVRMS21Xa0pRUUpL?=
 =?utf-8?B?aTI4MWpYZE5Zc3JhejB6bmVJL1BraHJWOFZMSDRxazN6UzBPSk5kUzUxQmt2?=
 =?utf-8?B?RXRhd3FjTCt3YnBRTFA2UWVpSlluQmZyT2lMRVR3dHAzaXQ4b200K092bHc4?=
 =?utf-8?B?ZWVOS2xyMEhnOTlVcVlBWlBWU3VGcGNlTnpWSWVTUExHRVBHQTNweDllYlRO?=
 =?utf-8?B?a0hwRlcvM3N0andDOE9TL251Z2R3V1AwNUZiSzRsKzBtdXpyb2M3QVpKUysv?=
 =?utf-8?B?NUpJRUJCUEtUSVBjREJZUGw0Ukgwby9vZDBxcTA2MXpZdEdYalpseElIamk3?=
 =?utf-8?B?M2N0TDJsWWRNZmZ1dDB5UE9IYnZ1dlZIRHNHYnRNUWtyMGNXdUZDZ1NGVnQy?=
 =?utf-8?B?TzdDZmZQTWRPa3FPQlNsTHFkV2lYSnlxdzJMZW5sR0ZWK251aUxESHA4OFNa?=
 =?utf-8?B?VjFlcGtHVnA2WXNURlB2VEc5ekpyc3pJbGxNRUFIQ1ZKWENOemtHUnpqL0tF?=
 =?utf-8?B?RmhOdEd1alR1bzR2QkR1cXNxR1E3eEw0eTJieTRqVSs3eDgrQmw0VHE4N2ho?=
 =?utf-8?B?ZFJkREVZcGpKTW5USkduKzJaQkdpeCt6WTRtTW5VNFlrM3dDTDFod3RnYTB5?=
 =?utf-8?B?dDRHak44L3pwK1laUUNEWUp4RnI4aUJta2d4TUNKak5yYTkram9paWxxMks1?=
 =?utf-8?B?ZytIcXZXbDVXZnhGcmJXRHJoNE1oL3NUZThqczJnNkJJd1M4T3dIeERveTZz?=
 =?utf-8?B?RmNnN0NMWEpnN21xRjdUL2U2YUhSQmpaU1QzTG9MOFBJeEpMZzRkdE54ZVFh?=
 =?utf-8?B?a0dya3dHMGZPRnRMRDF0Rm1PNENQR0RobG9hcHdiMnptQUVEQ0xMcDRUS0ZX?=
 =?utf-8?B?L0kwcTFGa3RvQWxhMklxZncyTG1XWlgvZXlWYldqMnltUms4RXA4STd3aDlW?=
 =?utf-8?B?RmV1WG9zNXFkY2VabUlMcHZlcW5jd1ZBNW85czcwWmxzaEk0QzhLT3R2VmxJ?=
 =?utf-8?B?UHJtM28zRHF4ZlYrc3ptTm90QlkvcjRtODZ6eERReEdRYUttWGUvaGxuTlM2?=
 =?utf-8?B?d3dVQlZPWFpiOUlBUzJOL2FjSk40QlNkalFGTzE5dXh5V29tcXM1WXJrQTVm?=
 =?utf-8?B?REZTOXl3a2Q5aGc0eGkycG9XRnFWYjN6VGJ3b2VjUTBGbmhzS0I5S0JkWitk?=
 =?utf-8?B?OGVHelY5UVRNT0RQU2FnNW4rQ1JUTVA2ZTh3L2cwcmsycWFzZ1BQb25GYktZ?=
 =?utf-8?B?MDNBcyt1QTNvcXJmMlkwOHdOSHpYT2ZCdHMwcGFEMm1tVWdabzM3cmFBQkRG?=
 =?utf-8?B?dUxFbWxVVFptYXlDNjlsN2Ixd1k3VFVNa09kcnpXbGV6YWlLUElGS0dHbmF6?=
 =?utf-8?B?UkE1RVBSM0g1V0xHeU9lMkVCRERwcldvYlBtS1RqSU1yOUE2MHcrdVRtUGNC?=
 =?utf-8?Q?rF3p5tYhhuE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6391.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXg2ZGh2NHhxdmo5UXAvRitCYXZJNlJteFNvWEsyY01ocVlvSm1IK0RZaktT?=
 =?utf-8?B?S1hFMFpSNnQ5QWJtUk1GMzBRUHJqcHUxTUNJeEk0VzB2SmJEZzVJQlQzL0ph?=
 =?utf-8?B?Z0JiVHN3cldzSUtqSFU3bFhkemJPZ0hGNGZvWDZoT0t6TEY0Z2FpOWpMeE54?=
 =?utf-8?B?cWhpSEVKWGZUakxmNGRrVmpDM29yd29jMjlMeDN1LzlWVjhveWU5RG5UcXRE?=
 =?utf-8?B?aW9ZZzl1R2pjOUt5RFZKM1RERDFYc1BDUzdiSm8yWWk5dmpsT1RJSHJQbkFq?=
 =?utf-8?B?dW9TUE5Id1p2b2R2cTNpWmpHd1FRZnppODJPVHg0WURGcUVpM0lnUFl4TWMv?=
 =?utf-8?B?NC8vVUt6ZTF6UDZhc3JiRmxLaTdvd2xYR2tsbDQwNU1rUCtVa1FMMUhpT2Qx?=
 =?utf-8?B?bEpxRVR5dmR6WjFMdk1wUGlBOHg4SjFJb1BsZWdIYlF1Uno3b1BWdWtRZStL?=
 =?utf-8?B?S0Y4c1ZGSU44b0FOc1FNZzZlK281SUVRbTBCZkJZWWR3bExpUm1wSEFRcWhy?=
 =?utf-8?B?Rkp6VCs4TzRJaUNjWCtDUlowbEcrSUk2UFlUbUVLWm85MVJyb0FDTUxXcVB3?=
 =?utf-8?B?Y3diLzJaWnJNd2JQYVM2M3hQTVZPRUJTVGZaanJUSlE1WlhoOHI1NU50dUtt?=
 =?utf-8?B?ZUJtdkhNcDBqNGhLc3JqbGdwU1FaQjRsK1o5S0hJV1djUFg0NUk4ZjRUTnpl?=
 =?utf-8?B?QVdaRTZQWjZ6Y2NEZU51SG1ZamQ2SEZ0cWtNVm5yeU9sOFVBK00wcTAxR0lk?=
 =?utf-8?B?ZXFHZkZEWlNaWUJlamZyUXZEVWdmemI2aVVUdUVmMUZCaEIrL3Rsemx6VGVi?=
 =?utf-8?B?R2NGQzNPTWlldDlpZnAxV0Q2Qnl1VkRzVDZvamVyQXo4MnowRzNzSGd5LzQx?=
 =?utf-8?B?NzFKcmRVN3JtWUNXS2hjSjlxdWtCUXpyZmpUcklOZjZ6Z3ZoQ2d5NzhFczlq?=
 =?utf-8?B?Q0daYnVlOWVpQVdRWEh0K1Z0eWxBWUcxL1VONGlXa2JoRjZjc3I1Y1MwUzdT?=
 =?utf-8?B?UlpaRXUrczhCOFU0NW9YTGh3V3U2QkVvSVIyVE5La2xIWEFjL0g1cTBrajli?=
 =?utf-8?B?d1JLVmRKZ2VDQVk0emdVem9WL0hLUkRNaTROclJrTitoOUx5SUNpbkV4ZXM5?=
 =?utf-8?B?ZWNEWkdtRGI2NDgvTExtNzdRcWswQ3pMcmhkVUlWWmVoNlIvYndMakJsc3N2?=
 =?utf-8?B?UXFqTzFIdVNxbUZMY1VRN3J1bW53QVFySkkwVmtmK1pYVGZ6dGVSMzZzR085?=
 =?utf-8?B?VjBzK2FkSlI5NHVlaUZkV0pRRlZaYi84M1p3OHRWWEI2RVJlaUFMWVFacC9K?=
 =?utf-8?B?VE1ycWloam02aGVoVUZzN1NTYjFhTjhUSU9JMUpCajkvMnpBMVhzVjh0NENL?=
 =?utf-8?B?OE1EcXBEUHlaSnUrTVg0eXdwQUFsMFNSNEtNTjBVYnpmYW1EZWJRL2dyWDJX?=
 =?utf-8?B?WFV3K1duZjJqN29CVkVrYmpYckFEMjNETXZleXBmTGxGUXU4c3NmdUY2WTFL?=
 =?utf-8?B?VEhXbU56S3hnbVdkcWRVWW4wQnRCcytXR0RTclJQWm9aQXpCUUtFMmlrVmlp?=
 =?utf-8?B?b0dBZFE2M1hGWU5QNXdmUUhWMlEyRVhiWEkzd0JCeTdkdmNPS0xRK2tORDcz?=
 =?utf-8?B?M3Z5ZFZ4MFVhU2VneFNLTzRqYVIwM2pEbEVYSWhaMURUSTJZVXp0eWhDR1ls?=
 =?utf-8?B?ZWpWc2RGYkdSOWJoa1ZTVW0xK2tDVmh2Tk1sRDgyU3FHd1o0WksyUHpCMHVB?=
 =?utf-8?B?ZXp2U3pUaDZUU1d5cFVKVUtHbzhLVUtnR0NWSTk1VVFwZjM4eFVKWVFKcTRj?=
 =?utf-8?B?dzZkZmFwZmhQOURQYkpzdXBIcVlxTkJDbndwMTZhTWFsWEowTVQyL2VGQmtI?=
 =?utf-8?B?TVJOUXV4L3g0eWlmd0E5QkhtOC8xVnZUMDloTVRoOVJ3a3Z0RnVCNmpscnIw?=
 =?utf-8?B?QVZOY016d1FEUUF1SkwyVFJTR1JXbk1OWUx3cjc2UXdhbXVFaUpmZUQvZGlX?=
 =?utf-8?B?cFovall2SnJpZTB4UFFiY3k1WTZORURoVFFDZ0RGd3h1VEV6OFp1V2phSSs2?=
 =?utf-8?B?S1poQWRleXVlK0RkbkNBMU04Y1pqOVBtQVNDRlBYcmdVdy9INFp3eTBGYUhy?=
 =?utf-8?B?NUgyRnpKd0k3YWlybjZIMFcyUVRCQ2VpNXpLZzViWjExQ2R4NWVoVUtTWTg3?=
 =?utf-8?B?VWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aeb37dae-4629-4bb8-d605-08ddced34e64
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6391.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 19:08:30.6308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: poPkgUpjWPU9zRwPqx81gDov3BE+U6IdBsSdCm0BZxAatWyMCtkzL7Pc7acTjzleo3um/RbHVcPROXU52SPcIdGDQCmlTFh3Mm8dIV/JDwo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7091
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

On 7/21/2025 6:35 PM, Zhanjun Dong wrote:
> Add GuC LFD (Log Format Descriptors) related ABI definitions.
>
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>   drivers/gpu/drm/xe/abi/guc_lfd_abi.h | 282 +++++++++++++++++++++++++++
>   1 file changed, 282 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/abi/guc_lfd_abi.h
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_lfd_abi.h b/drivers/gpu/drm/xe/abi/guc_lfd_abi.h
> new file mode 100644
> index 000000000000..b6888ab47e25
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/abi/guc_lfd_abi.h
> @@ -0,0 +1,282 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _ABI_GUC_LFD_ABI_H_
> +#define _ABI_GUC_LFD_ABI_H_
> +
> +#include <linux/types.h>
> +
> +#include "guc_lic_abi.h"
> +
> +/* Magic keys define */
> +#define GUC_LFD_DRIVER_KEY_STREAMING		0x8086AAAA474C5346
> +#define GUC_LFD_LOG_BUFFER_MARKER_2		0xDEADFEED
> +#define GUC_LFD_CRASH_DUMP_BUFFER_MARKER_2	0x8086DEAD
> +#define GUC_LFD_STATE_CAPTURE_BUFFER_MARKER_2	0xBEEFFEED
> +#define GUC_LFD_LOG_BUFFER_MARKER_1V2		0xCABBA9E6
> +#define GUC_LFD_STATE_CAPTURE_BUFFER_MARKER_1V2	0xCABBA9F7
> +#define GUC_LFD_DATA_HEADER_MAGIC		0x8086
These are not LFD defines. They are the in-memory buffer header magic words.

> +
> +/* The current major version of GuC-Log-File format. */
> +#define GUC_LFD_FORMAT_VERSION_MAJOR		0x0001
> +/* The current minor version of GuC-Log-File format. */
> +#define GUC_LFD_FORMAT_VERSION_MINOR		0x0000
> +
> +/** enum guc_lfd_type - Log format descriptor type */
> +enum guc_lfd_type {
> +	/**
> +	 * @GUC_LFD_TYPE_FW_REQUIRED_RANGE_START: Start of range for
> +	 * required LFDs from GuC
> +	 */
> +	GUC_LFD_TYPE_FW_REQUIRED_RANGE_START = 0x1,
> +	/**
> +	 * @GUC_LFD_TYPE_FW_VERSION: GuC Firmware Version structure. LFDs
> +	 * payload is guc_lfd_data_fw_version
> +	 */
> +	GUC_LFD_TYPE_FW_VERSION = GUC_LIC_TYPE_GUC_SW_VERSION,
This equality is coincidental not a definition. Indeed, the original 
spec had different numbering for the two enums. It only change to match 
due to an implementation bug! So you should not define them as being 
related and should not make any assumptions in the code about them being 
related.


> +	/**
> +	 * @GUC_LFD_TYPE_GUC_DEVICE_ID: GuC microcontroller device ID.
> +	 * LFDs payload is guc_lfd_data_guc_devid
> +	 */
> +	GUC_LFD_TYPE_GUC_DEVICE_ID = GUC_LIC_TYPE_GUC_DEVICE_ID,
> +	/**
> +	 * @GUC_LFD_TYPE_TSC_FREQUENCY: Frequency of GuC timestamps. LFDs
> +	 * payload is guc_lfd_data_tsc_freq
> +	 */
> +	GUC_LFD_TYPE_TSC_FREQUENCY = GUC_LIC_TYPE_TSC_FREQUENCY,
> +	/**
> +	 * @GUC_LFD_TYPE_GMD_ID: HW GMD ID. LFDs payload is
> +	 * guc_lfd_data_gmdid
> +	 */
> +	GUC_LFD_TYPE_GMD_ID = GUC_LIC_TYPE_GMD_ID,
> +	/**
> +	 * @GUC_LFD_TYPE_BUILD_PLATFORM_ID: GuC build platform ID. LFDs
> +	 * payload is guc_lfd_data_build_platformid
> +	 */
> +	GUC_LFD_TYPE_BUILD_PLATFORM_ID = GUC_LIC_TYPE_BUILD_PLATFORM_ID,
> +	/** @GUC_LFD_TYPE_FW_REQUIRED_RANGE_END: End of this range */
> +	GUC_LFD_TYPE_FW_REQUIRED_RANGE_END = 0x1FFF,
> +	/**
> +	 * @GUC_LFD_TYPE_FW_OPTIONAL_RANGE_START: Start of range for
> +	 * required LFDs from GuC
> +	 */
> +	GUC_LFD_TYPE_FW_OPTIONAL_RANGE_START = 0x2000,
> +	/**
> +	 * @GUC_LFD_TYPE_LOG_EVENTS_BUFFER: Log-event-entries buffer. LFDs
> +	 * payload is guc_lfd_data_log_events_buf
> +	 */
> +	GUC_LFD_TYPE_LOG_EVENTS_BUFFER = 0x2000,
> +	/**
> +	 * @GUC_LFD_TYPE_FW_CRASH_DUMP: GuC generated crash-dump blob.
> +	 * LFDs payload is guc_lfd_data_fw_crashdump
> +	 */
> +	GUC_LFD_TYPE_FW_CRASH_DUMP = 0x2001,
> +	/** @GUC_LFD_TYPE_FW_OPTIONAL_RANGE_END: End of this range */
> +	GUC_LFD_TYPE_FW_OPTIONAL_RANGE_END = 0x3FFF,
> +	/**
> +	 * @GUC_LFD_TYPE_KMD_REQUIRED_RANGE_START: Start of range for
> +	 * required KMD LFDs
> +	 */
> +	GUC_LFD_TYPE_KMD_REQUIRED_RANGE_START = 0x4000,
> +	/**
> +	 * @GUC_LFD_TYPE_OS_ID: An identifier for the OS. LFDs payload is
> +	 * guc_lfd_data_os_id
> +	 */
> +	GUC_LFD_TYPE_OS_ID = 0x4000,
> +	/** @GUC_LFD_TYPE_KMD_REQUIRED_RANGE_END: End of this range */
> +	GUC_LFD_TYPE_KMD_REQUIRED_RANGE_END = 0x5FFF,
> +	/**
> +	 * @GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_START: Start of range for
> +	 * optional KMD LFDs
> +	 */
> +	GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_START = 0x6000,
> +	/**
> +	 * @GUC_LFD_TYPE_BINARY_SCHEMA_FORMAT: Binary representation of
> +	 * GuC log-events schema. LFDs TLV payload is
> +	 * guc_lfd_data_binary_schema
> +	 */
> +	GUC_LFD_TYPE_BINARY_SCHEMA_FORMAT = 0x6000,
> +	/**
> +	 * @GUC_LFD_TYPE_HOST_COMMENT: ASCII string containing comments
> +	 * from the host/KMD. LFDs TLV payload is
> +	 * guc_lfd_data_host_comment
> +	 */
> +	GUC_LFD_TYPE_HOST_COMMENT = 0x6001,
> +	/** @GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_END: End of this range */
> +	GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_END = 0x7FFF,
> +	/** @GUC_LFD_TYPE_RESERVED_RANGE_START: Start of reserved range */
> +	GUC_LFD_TYPE_RESERVED_RANGE_START = 0x8000,
> +	/** @GUC_LFD_TYPE_RESERVED_RANGE_END: End of this range */
> +	GUC_LFD_TYPE_RESERVED_RANGE_END = 0xFFFF,
> +};
Personally, I find the above impossible to read at a glance. The 
comments add nothing - GUC_LFD_TYPE_KMD_REQUIRED_RANGE_START is 
described as "Start of range for required KMD LFDs". Well, yeah, I can 
get that from the name. I think this whole section would be much easier 
to read if was just the enums:

+	GUC_LFD_TYPE_KMD_REQUIRED_RANGE_START = 0x4000,
+	GUC_LFD_TYPE_OS_ID = 0x4000,
+	GUC_LFD_TYPE_KMD_REQUIRED_RANGE_END = 0x5FFF,

The structure definitions and such for the individual entries can refer 
back to the define they are associated with. But this section would be 
more use if it is a simple list of enum values that is quick and easy to 
scan through.

> +
> +/** enum guc_lfd_os_type - OS Type LFD-ID */
> +enum guc_lfd_os_type {
> +	/** @GUC_LFD_OS_TYPE_OSID_WIN: Windows OS */
> +	GUC_LFD_OS_TYPE_OSID_WIN = 0x1,
> +	/** @GUC_LFD_OS_TYPE_OSID_LIN: Linux OS */
> +	GUC_LFD_OS_TYPE_OSID_LIN = 0x2,
> +	/** @GUC_LFD_OS_TYPE_OSID_VMW: VMWare OS */
> +	GUC_LFD_OS_TYPE_OSID_VMW = 0x3,
> +	/** @GUC_LFD_OS_TYPE_OSID_OTHER: Other */
> +	GUC_LFD_OS_TYPE_OSID_OTHER = 0x4,
> +};
> +
> +/**
> + * struct guc_lfd_data - Log format descriptor (LFD).
> + * A type of KLV with custom field-sizes + magic numbers.
This description tells me nothing that I can't immediately see from 
looking at the contents. Maybe just say "A generic header structure for 
all LFD blocks".

> + */
> +struct guc_lfd_data {
> +	/** @dw0: A 32 bits dword, contains multiple bit fields */
> +	u32 dw0;
'header' would be better than 'dw0'.

> +	/*
> +	 * Expected value: GUC_LFD_DATA_HEADER_MAGIC.
> +	 * Helpful in detecting file errors.
Why 'expected value'? Indeed, I don't think this comment is worth having 
at all.
> +	 */
> +#define GUC_LFD_DATA_MAGIC		GENMASK(15, 0)
Calling this 'DATA_MAGIC' implies it is related to the 'data' field 
below. Assuming that 'dw0' is renamed to 'header' then this shld be 
'GUC_LFD_HEADER_MAGIC'.

> +	/*
> +	 * File descriptor type (the 'T' in TLV) is used to identify how
> +	 * to interpret `data` below. For the range of types, see
> +	 * guc_lfd_type
Again, this is a redundant comment. Also, the KMD uses KLV not TLV.

> +	 */
> +#define GUC_LFD_DATA_DESC_TYPE		GENMASK(31, 16)
Again, GUC_LFD_HEADER_TYPE would be a better name.

> +	/** @dw_size: Number of dwords the `data` field contains. */
> +	u32 dw_size;
data_size

> +	/** @data: Data defined by File descriptor type. */
Defined by GUC_LFD_HEADER_TYPE.

> +	u32 data[] __counted_by(dw_size);
> +} __packed;
> +
> +/**
> + * struct guc_lfd_version - GuC Log File Format Version.
LFD is Log File Descriptor not Log File Format.

> + * Major-Minor is not a fractional number (i.e. Ver 1.3 would be older
> + * than 1.12)
> + */
> +struct guc_lfd_version {
> +	/** @dw0: A 32 bits dword, contains multiple bit fields */
> +	u32 dw0;
> +	/*
> +	 * Guc-Log-File Format minor version. Must be
> +	 * GUC_LOG_FILE_FORMAT_VERSION_MINOR
> +	 */
> +#define GUC_LFD_VERSION_MINOR	GENMASK(15, 0)
> +	/*
> +	 * Guc-Log-File Format major version. Must be
> +	 * GUC_LOG_FILE_FORMAT_VERSION_MAJOR
> +	 */
> +#define GUC_LFD_VERSION_MAJOR	GENMASK(31, 16)
> +} __packed;
Again, no point in having a structure defined for a single u32. Just the 
bit field definitions is all we need.

> +
> +/**
> + * struct guc_lfd_data_guc_devid - GuC Device ID.
> + * This is mandatory fw LFD data
"fw" meaning firmware? But this is the LFD as created entirely by the 
KMD, the firmware is not involved. Should just say "This is a mandatory 
LFD block."

> + */
> +struct guc_lfd_data_guc_devid {
> +	/**
> +	 * @guc_devid: GuC microcontroller device ID defined as described
> +	 * in GUC_LIC_TYPE_GUC_DEVICE_ID
> +	 */
> +	u32 guc_devid;
> +} __packed;
> +
> +/**
> + * struct guc_lfd_data_tsc_freq - GuC TSC Fequency.
> + * This is mandatory fw LFD data
> + */
> +struct guc_lfd_data_tsc_freq {
> +	/**
> +	 * @tsc_freq: GuC timestamp counter frequency as described in
> +	 * GUC_LIC_TYPE_TSC_FREQUENCY
> +	 */
> +	u32 tsc_freq;
> +} __packed;
> +
> +/** struct guc_lfd_data_gmdid - GMD ID. */
> +struct guc_lfd_data_gmdid {
> +	/** @gmd_id: GMD ID as described in GUC_LIC_TYPE_GMD_ID */
> +	u32 gmd_id;
> +} __packed;
> +
> +/** struct guc_lfd_data_build_platformid - GuC build platform ID. */
> +struct guc_lfd_data_build_platformid {
> +	/**
> +	 * @platform_build_id: GuC build platform ID as described in
> +	 * GUC_LIC_TYPE_BUILD_PLATFORM_ID
> +	 */
> +	u32 platform_build_id;
> +} __packed;
Again, not sure these four are worth having structure definitions for. A 
comment that says LFD_DEVID maps to LIC_DEVID, etc. would be sufficient.

> +
> +/**
> + * struct guc_lfd_data_log_events_buf - GuC Log Events Buffer.
> + * This is optional fw LFD data
As above, this is not a firmware generated data stream. Should just say 
"This is an optional LFD block.".

> + */
> +struct guc_lfd_data_log_events_buf {
> +	/**
> +	 * @log_events_format_version: version of GuC log format of buffer
> +	 */
> +	u32 log_events_format_version;
> +	/**
> +	 * @log_format_buf: If `log_format_version` == 1, array of
> +	 * guc_log_format_version_1. If `log_format_version` == 2, array
> +	 * of guc_log_format_version_2. Dword size determined by
> +	 * guc_logfile_lfd.`desc_dw_size` - 1
This does not match the name you used in the parent LFD header 
structure. Should just say "Size in dwords is LFD block size - 1".

> +	 */
> +	u32 log_format_buf[];
> +} __packed;
> +
> +/**
> + * struct guc_lfd_data_os_info - OS Version Information.
> + * This is mandatory host LFD data
As above, this is all being created by the host so no need to specify.

> + */
> +struct guc_lfd_data_os_info {
> +	/**
> +	 * @os_id: enum values to identify the OS brand (1=Windows,
> +	 * 2=Linux, etc..). See guc_lfd_os_type for the range of types
Should not repeat a subset of the enum definition values here. Just 
reference the enum name.
> +	 */
> +	u32 os_id;
> +	/**
> +	 * @build_version: ASCII string containing OS build version
> +	 * information based on os_id. String is padded with null
> +	 * characters to ensure its DWORD aligned. Dword size determined
> +	 * by guc_logfile_lfd.`desc_dw_size` - 1
As above about naming.

> +	 */
> +	char build_version[];
> +} __packed;
> +
> +/**
> + * struct guc_lfd_data_fw_version - GuC FW Version.
> + * This is mandatory fw LFD data
> + */
> +struct guc_lfd_data_fw_version {
> +	/**
> +	 * @guc_sw_version: The full version of the GuC microkernel that
> +	 * generated the logs as described in
> +	 * GUC_LIC_TYPE_GUC_SW_VERSION.
Except that the log data block is optional and so not necessarily 
present. Should just say "The full version of the GuC firmware.".

> +	 */
> +	struct guc_sw_version guc_sw_version;
> +} __packed;
Although, again this is a single u32 structure, which seems pointless. A 
comment description would be sufficient.

> +
> +/**
> + * struct guc_logfile_header - Header of GuC Log Streaming-LFD-File Format.
> + * This structure encapsulates the layout of the guc-log-file format
> + */
> +struct guc_lfd_file_header {
> +	/**
> +	 * @magic: A magic number set by producer of a GuC log file to
> +	 * identify that file is a valid guc-log-file containing a stream
> +	 * of LFDs: Expected value: GUC_LFD_DRIVER_KEY_STREAMING
> +	 */
> +	u64 magic;
> +	/**
> +	 * @version: Version of this file format layout as per
> +	 * guc_lfd_version
> +	 */
> +	struct guc_lfd_version version;
> +	/**
> +	 * @lfd_stream: A stream of one or more guc_lfd_data LFD data
"LFD blocks" is a better way to describe them than "LFD data". Data can 
mean pretty much anything, whereas block implies a discrete unit.

> +	 */
> +	struct guc_lfd_data lfd_stream;
Technically, this is just a single LFD block, not a stream. And you 
can't really do 'lfd_stream[]' because blocks are variable in size. 
Would be better to just say "u32 lfd_stream[];".

John.


> +} __packed;
> +
> +#endif

