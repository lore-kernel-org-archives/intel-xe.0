Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2574ECD343F
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 06:06:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF26810F20D;
	Thu, 21 May 2026 06:06:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QKOUZqV9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 158C310F20C
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 06:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779343594; x=1810879594;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=n2BAQJJ0ZTQyN/SKfYVsaOIHwIR1iDypbbk8zVMcktQ=;
 b=QKOUZqV9hGALtSIKLCTeAUQpEy4wsQ8sy9PmAYWbbbTilEjI+Vn5QWXp
 lCXEOKATQdRECdFrb/q/Qs0QgJAhXDZpyDpCndbw+nMJVIh6fckPybvMV
 yYaaoBtoxf3CfUhmBwoHvKu8UEyUiHVTV6fPT5PshHKP3JwLhhFoo9svK
 sIdemz41qubR4BosyCgKELCxo1l2m8v7T4G02WD3Kku8P3pfqkOsf8E/1
 dpgIOlq5mGH8uQ7e6oAsIQLBcZqnI/QeHqPJlWRy6KLBV+WKigHrvZoYt
 Xr7n0K+Lnm6L3Cfebds1S8NVfgrmB6bfZ9MbPhn7rCCtgiFnwaWGONeJh g==;
X-CSE-ConnectionGUID: RQVtqnI3Qzi19+fWTY7z8w==
X-CSE-MsgGUID: Vr/V9YcXQlOsrxkYgiTfZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="79403641"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="79403641"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 23:06:34 -0700
X-CSE-ConnectionGUID: Gvjz88MkRYeztsA8QDW2fQ==
X-CSE-MsgGUID: SE6xFUOrSdqc5FBqZxIvuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="239426558"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 23:06:32 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 23:06:31 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 20 May 2026 23:06:31 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.0) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 23:06:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zfr3IfcHU8fwUlBw9rA1t/cQARtWye7PvIh2v3/NXT5v1V+NdmD3Zu+Kw+RI34Th4zU8p+BMIeNEOmBruTHc6/iEfdKIq0beoeOthOeqBvHIXNURWtftH7NUs+Gvr/ClIA6+MhzSGEzJdnZGlWvZLDOkrkXfZyKDd79U3MHNJiTyslFFbstelpRVRs9qO1yPn5OcJ1TWcEj5TXTaVMI2Dcyg/GImf/3DFwz6FbGuRqcM1DLNRPO+Ak2L1zBB6o17KOcmYLN+e3XiB7HiZME8K32RDyzf0r7xEsORE+zzk1HzST2lqb7prFX4y4gRVr9gdJKMr2OG67LmeXP7uasvEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+HoA1JLFfXrkoLywhMhgPrhIEHHOjZ2yyEpHZssx4sc=;
 b=dRlLRXT65d7LpnnICkKLG87/l8S6Q9hJaCmsLuTcY31awe6PdWCX/Lwy0zzrNlXI6Cr4D7CYWdLaE2JhjywBF7G29r21poJVc1NyEtb1D6+BkURmTB82vFOItyl/DBwJ8gUztEr8/JXOAT3dSJ5/Nx4BLMxRA9uwp803tBoqSocxNOrH9FA29BrwnPO1gOUnOh2Jp5VRiOT34qX813cZjaFzOr4v9BOtsDNtKB8iBVldUyToW1LBiT8Q7liNsIEzj5DrgmYYU53chrSbNVa8bUjdyxRa/RD4NhtrqSPcOAs8kazRvMP75v3cbJGWdIdLGbly3CByiaFV+LbLlz6Uyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CO1PR11MB5122.namprd11.prod.outlook.com (2603:10b6:303:95::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.17; Thu, 21 May 2026 06:06:24 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 06:06:24 +0000
Message-ID: <0648e5a6-88ee-4bbc-987d-88ac21d43c69@intel.com>
Date: Thu, 21 May 2026 11:36:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/14] drm/xe/xe_ras: Handle uncorrectable SoC Internal
 errors
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260511172908.1122252-16-riana.tauro@intel.com>
 <20260511172908.1122252-24-riana.tauro@intel.com>
 <5a19f206-3e68-4c24-bc18-c014123a0fc2@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <5a19f206-3e68-4c24-bc18-c014123a0fc2@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0176.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CO1PR11MB5122:EE_
X-MS-Office365-Filtering-Correlation-Id: f0a2af53-6bea-4018-618c-08deb6ff161d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003|6133799003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: t1t+A7H3sxwXWfFFTiJfdxUwdma/B0gIkQBnfX5GBZHH+C7c29Jmva3GUtI2JOJJ2SHnlXzRX4ES29grJ5y8mvuLH2kvqXYEJ2w4y+D8I348DL/0iZe1MYEXvB/wC3TIuKYLAuJsan5XwTfuM06nPe+VzlnFl2JwM80s8Gv1Da+w8AqC/SIw3IfbzTpIY3iYfm/BryAlVwvyljd5YyGrKJ9nNxB512knZOxbbcUaPXRCPWZ5TaH9tjScVAL5Gy3+fm27mul4XYa/qVjSYXJUwSLMrOQyAS9qMM2k2QkiItGSMqiNa09myvmN3McIspcmX8r1gyAmz4wYlqnK8CHpwpmAdOoUBIObjeZnf6PpKh4E0PV6VT48NQXphhrdzBx7jeIff7BooZxJwvFaH1GXqty/51P6MGWKXP1wPQMh0VWbVlpbKDxYGQwfRJ5JfGMa/+yDH0ZF2UEE5XUGnpfh0oqq7X/9tumuybPxXnZ+IF+zmENi/5KotImNEExjZRkOyp9TFSAPdCj3mUnEbZU6CqdwBB6xGAH3+jzyAykRKEaNkHSbBa4hYrvkbdftRm55ghxO1lgybxnwHlxBRaniHJEK4z22SGg7zZSXa84VKNe6nY4fHDh1ck+JZrx2rO+6sSwPDobuISu5sZdw7qoOGOSlSuPjhZxvCficgSyW7nLeR4TQ9dpxPiwe1TMYBRLI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003)(6133799003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2VvS00zN0w1Qjg0aVhZcVErZDgvczcydUJ6ZklOcW5GbmkveGdsRHZ5Y0tz?=
 =?utf-8?B?bDVTSEpzckdzaFFPQks3aUtlWk9wNld6bk9BMlBaTnY2YzYzeEdLYWh5T1lm?=
 =?utf-8?B?dG1pRmc5WWR2OUxPSDc2aEpWZEJpbE9RajZwMlVwUWsrUExuZnZ3MlRPZnFx?=
 =?utf-8?B?azh6TmNvdGxsL2twOGVnZTZWNWoyOGd5S0kyMDdXM1QzSkp4MTJVYnk2d0FK?=
 =?utf-8?B?bFVKK2wrdUhlUjdNVDFlS1gxWTcyeXc4Sm40TUM4cGNsMDNZSU13QWY3RVZ2?=
 =?utf-8?B?Y1VZcHArRzFOU3pRbTd1L054cXEyRlZJaEZkTDk0YWZkdnFCdTRKOUNwZk1p?=
 =?utf-8?B?VWNsYzM4RE5Pc2lGYndic0FlcGlveG0vWVdVTmtqMGhVRXFPN2xPbUx4WGF3?=
 =?utf-8?B?WEtBMlB0amNqSEVFN042cHZ3bDJlZXZZc2g2YVl4OGtOejVJUWdLYWFaUHhy?=
 =?utf-8?B?dndPSnJrNk5ralhqZGE5QVMxUUR2alM1eDNXenRvTnFBTVhpVFJDQ3Zpc3lX?=
 =?utf-8?B?dk8ydzRpd2FlQ3I0Vy9JQ1I5dGdjTHFVTlI0UmNhaVY0ZmxCVE1RbDR3N3Vo?=
 =?utf-8?B?RzBrM0p1NnE5aUlMYi8rR3JZQ0VmZDluNWlzQWQrSld2cEpubWV0eXlFUG1E?=
 =?utf-8?B?b1ZxWWVNbjBoM2RHKzBPbE04SjFIK1ZSRUdUVjdiY3FjWEVhM2xFb09sTzR4?=
 =?utf-8?B?SENxM2VPaVp5MXBpblVlaUh3R1NMZEJHMzdkSkJxRVNOR3BPNEJlZVhFK3ls?=
 =?utf-8?B?NHFvZTZVRlp2R05ob3FYZG9mazlpdEIvaXlVcXJxaFpkamE1Q21jSjJWS3k2?=
 =?utf-8?B?OWZjY0M1a0FDYlJHTWkrcTVPVEZIazlXLzZ4Wm4rdHBEaG1vV3RrRXlMbFRa?=
 =?utf-8?B?Q2hTWDJrd2VpSjZEcUF1ajloY01YYUtSc2Vrd3JRVUU4dXZFSTh5TExEVXVW?=
 =?utf-8?B?Y20rVFhyTmV5N2ZRWGNPcUtkUUg5ZGVFMDNYczZOa3o3N1ZBTDBmYjJWMEZ3?=
 =?utf-8?B?S2NSU1M2U3pPR0dFRDlCRVBTYU5tNG9YRFRkdElnWXd5elRGUjdneVhLVjRP?=
 =?utf-8?B?bDJTOWZTTlVUK01pekZDZkRPMXZyUEVINjZ0WEpBQ0hqRUJVRVQxMExOQnBZ?=
 =?utf-8?B?ejZZSDlkcVhKeW9QOGNoaDdxTFVXTnJnbEtoNnN5WmdUSmpCWkdFSmp5OUxv?=
 =?utf-8?B?a0lFM0Z0aExQMVExRXVJYzh0RUZpcmJlclZyTWR3bFBDbGpOVVBmQ2x2Q0ln?=
 =?utf-8?B?R3BENEZKOUVFRWNreit0TzhHNERGdndxT201N1VIWDh5czNPa0tmRFhzNkNz?=
 =?utf-8?B?b1ZiaVZrSEpPL2VCWUEwMm0xQTh4d2R4bDlzZTFRYjBlSGx3aG9GYzBmeFRW?=
 =?utf-8?B?dm1oenJYWmhUNmZCYmdUME5lUHF5dlZyOFNqMnhRN3pONGlwWS8xZ2t5T2w4?=
 =?utf-8?B?SXA2SzNldkNXaTFnMmRWd1lHQWdaSUE5M3k0RlBvdGY4RGxvcFpleU4rS25l?=
 =?utf-8?B?c3dDQzRsN3JjczZ4emk3SVNiZXdhYmpqbHNDOU9BUk0zZUF2MmdYQzBMT2NC?=
 =?utf-8?B?b25XUFM3SEFTSlRFVkd6c0toRU15RUpuWUZYZ21rY0ZFODlOZ0taWUdLQUx2?=
 =?utf-8?B?Y2hWeFJKODNTZFhaQkdQTDRtMGJNbjZsKzRmWDBxYXpZOEZabVlnQ0RMa3JY?=
 =?utf-8?B?MEo2aU5jcW5hcHJ1S1NaRmRIWklUNnVzdWZQUWFFTzh3NEVMTms5YUxEWEdE?=
 =?utf-8?B?eUxDdThxVlFROEM2bkFuRERGTVMvSW1BUU16QXhxK0pPMFNtWG1yNmVCd2JX?=
 =?utf-8?B?L09DaHU1WSsrQWxlcmxxSDVlUy9ocE55NkFLRWxJeFB2NThrMld5UUd6RUdV?=
 =?utf-8?B?cElXanpWWWY5OVlxY1lYalFRN1psbkVnU201MExqZllZcjgyTXNCZDNsN1FK?=
 =?utf-8?B?WThFam9nZjN6NitlM011Y0ZKckVkY0R6c2FTVVZMNGp6N21tZ1gwRDlNZ3I1?=
 =?utf-8?B?Wlg1MHFjWWdHT3FTWWtmSllRUS9yOW9ZNkVROGRRTFNsVmhRVGg3YWQ1RUpN?=
 =?utf-8?B?Q3NadytsR0hydGQ4eGRuQXVjRCtRd1NyQ1FRRnEvajIwNUFoUkhueEVTQXY5?=
 =?utf-8?B?S1o4aVRiM0k3UTNDekNYM3J0djAvK0JuMktKOTdMLzNJaTQxWFBuVFVGVlVR?=
 =?utf-8?B?WS81VFZpK3VBc0tnSWxIaWpaOHdsNUJra0dzSGcrN1V4K1cyUkI2aGRtMnpx?=
 =?utf-8?B?K096M2p6UFJzbENHMUV3MGFaVXR3S05JQmpwaS94K3hWWUR6Q01VTUJoRGZo?=
 =?utf-8?B?VFhCdk5ibjN1U09zVXJGZ280V1E4dE8yc2l5N0pYY0JpdnpSRFp5UT09?=
X-Exchange-RoutingPolicyChecked: UqYK9PpCsZmbBIxhrGNfcPQT3RBfzq/s0zhOlu8Phhyf+8mxrGUgaGBIb9vSU7cSEBdbkC5JYzT1M5AKEehjAdRUTnHtUcbyPediMwV4n7s9/5J2y/fLd6onIb5b83V+SCUupY06WV42oLxCqTy0rC3xOwBwLvjG8SC0Ur4Y5yCZwUWdM9mNZy5HCtwgF4Q651TVo5Lnz2v0Shc2tIkNVv2nasxJaXVtpqZwmfGaVqFLlzBCwLbTdDR3cJKQJuxS2HeQItikbuaq0oLfGYvVJnrRK8fLczF/TMybvpdO/5QPXLET/kZytzvfDIvcatGMWmqBwwPYjhOyJLqcZs5+jg==
X-MS-Exchange-CrossTenant-Network-Message-Id: f0a2af53-6bea-4018-618c-08deb6ff161d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 06:06:24.1046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IOk8O6OHWmGvCqJq5Gqy/dhHrbhX0ezNL1y9mhNhXEGSI1Pqa+24lyeyW1RaVxpeo5m/x+ewML85PnK+MFPuGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5122
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


On 5/15/2026 1:40 PM, Mallesh, Koujalagi wrote:
>
> Hi Riana,
>
> On 11-05-2026 10:59 pm, Riana Tauro wrote:
>> Some critical errors such as CSC firmware and Punit are reported under SoC
>> internal errors and require special handling.
>>
>> CSC errors are classified into hardware errors and firmware errors.
>> Hardware errors can be recovered using a SBR (Secondary Bus Reset) whereas
>> firmware errors are critical and require a firmware flash. On such errors,
>> device is wedged and runtime survivability mode will be enabled to notify
>> userspace that a firmware flash is required.
>>
>> PUNIT uncorrectable errors can only be recovered through a cold reset.
>>
>> Signed-off-by: Riana Tauro<riana.tauro@intel.com>
>> ---
>> v2: simplify soc structures
>>      return error code for each SoC error (Mallesh)
>>
>> v3: squash patches (Raag)
>>
>> v4: re-use csc work
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c       | 53 +++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_ras_types.h | 50 +++++++++++++++++++++++++++++
>>   2 files changed, 103 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index ecadad5857b2..0d4e2116ef61 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -103,6 +103,56 @@ static enum xe_ras_recovery_action handle_core_compute_errors(struct xe_device *
>>   	return XE_RAS_RECOVERY_ACTION_RECOVERED;
>>   }
>>   
>> +static enum xe_ras_recovery_action handle_soc_internal_errors(struct xe_device *xe,
>> +							      struct xe_ras_error_array *arr)
>> +{
>> +	struct xe_ras_soc_error *error_info = (struct xe_ras_soc_error *)arr->error_details;
>> +	struct xe_ras_soc_error_source *source = &error_info->error_source;
>> +	struct xe_ras_error_class *error_class = &arr->error_class;
>> +	u8 tile_id = error_class->product.unit.tile;
>> +	struct xe_tile *tile;
>> +
>> +	if (tile_id >= xe->info.tile_count) {
>> +		xe_err(xe, "sysctrl: SOC internal error reported from invalid tile %u\n", tile_id);
>> +		return XE_RAS_RECOVERY_ACTION_RESET;
>> +	}
>> +
>> +	tile = &xe->tiles[tile_id];
>> +
>> +	if (source->csc) {
>> +		struct xe_ras_csc_error *csc_error = (struct xe_ras_csc_error *)error_info->additional_details;
>> +
>> +		/*
>> +		 * CSC uncorrectable errors are classified as hardware errors and firmware errors.
>> +		 * CSC firmware errors are critical errors that can be recovered only by firmware
>> +		 * update via SPI driver. On a CSC firmware error, PCODE enables FDO mode and sets
>> +		 * the bit in the capability register. On receiving this error, the driver enables
>> +		 * runtime survivability mode which notifies userspace that a firmware update
>> +		 * is required.
>> +		 */
>> +		if (csc_error->hec_uncorr_fw_err_dw0) {
>> +			xe_err(xe, "[RAS]: CSC %s detected: 0x%x\n",
>> +			       sev_to_str(error_class->common.severity),
>> +			       csc_error->hec_uncorr_fw_err_dw0);
>> +			schedule_work(&tile->csc_hw_error_work);
>
> Potential race condition: If the PCI device is removed (after 
> disconnect) while csc_hw_error_work is still queued, the work might 
> run after the device is gone, causing a crash right?
>

PCI core does not remove the device on disconnect. It only sends an uevent.
I wanted to reuse bmg worker but looks like its unnecessary. Will revert 
back to previous patch

>> +			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
>> +		}
>
> We need to check and log hec_uncorr_err_status as well.
>

We are already triggering reset for csc hw errors below.
For logging, response is same as prev patch (07/14).

Thanks
Riana

> Thanks,
>
> -/Mallesh
>
>> +	} else if (source->ieh) {
>> +		struct xe_ras_ieh_error *ieh_error = (struct xe_ras_ieh_error *)error_info->additional_details;
>> +
>> +		if (ieh_error->global_error_status & XE_RAS_SOC_IEH_PUNIT) {
>> +			xe_err(xe, "[RAS]: PUNIT %s detected: 0x%x\n",
>> +			       sev_to_str(error_class->common.severity),
>> +			       ieh_error->global_error_status);
>> +			/* TODO: Add PUNIT error handling */
>> +			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
>> +		}
>> +	}
>> +
>> +	/* For other SOC internal errors, request a reset as recovery mechanism */
>> +	return XE_RAS_RECOVERY_ACTION_RESET;
>> +}
>> +
>>   void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>>   				      struct xe_sysctrl_event_response *response)
>>   {
>> @@ -193,6 +243,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>>   			case XE_RAS_COMP_CORE_COMPUTE:
>>   				action = handle_core_compute_errors(xe, arr);
>>   				break;
>> +			case XE_RAS_COMP_SOC_INTERNAL:
>> +				action = handle_soc_internal_errors(xe, arr);
>> +				break;
>>   			default:
>>   				/* For any other component, reset */
>>   				action = XE_RAS_RECOVERY_ACTION_RESET;
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
>> index e97026fd6ff9..c5a283317d90 100644
>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -10,6 +10,7 @@
>>   
>>   #define XE_RAS_NUM_ERROR_ARR			3
>>   #define XE_RAS_NUM_COUNTERS			16
>> +#define XE_RAS_SOC_IEH_PUNIT			BIT(1)
>>   
>>   /**
>>    * enum xe_ras_recovery_action - RAS recovery actions
>> @@ -125,4 +126,53 @@ struct xe_ras_compute_error {
>>   	u32 reserved[15];
>>   } __packed;
>>   
>> +/**
>> + * struct xe_ras_soc_error_source - Source of SoC error
>> + */
>> +struct xe_ras_soc_error_source {
>> +	/** @csc: CSC */
>> +	u32 csc:1;
>> +	/** @ieh: IEH (Integrated Error Handler) */
>> +	u32 ieh:1;
>> +	/** @reserved: Reserved for future use */
>> +	u32 reserved:30;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_soc_error - Error details of SoC internal error
>> + */
>> +struct xe_ras_soc_error {
>> +	/** @error_source: Error source */
>> +	struct xe_ras_soc_error_source error_source;
>> +	/** @additional_details: Additional details */
>> +	u32 additional_details[15];
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_csc_error - CSC error details
>> + */
>> +struct xe_ras_csc_error {
>> +	/** @hec_uncorr_err_status: CSC hardware error status */
>> +	u32 hec_uncorr_err_status;
>> +	/** @hec_uncorr_fw_err_dw0: CSC firmware error */
>> +	u32 hec_uncorr_fw_err_dw0;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_ieh_error - SoC IEH (Integrated Error Handler) error details
>> + */
>> +struct xe_ras_ieh_error {
>> +	/** @ieh_instance: IEH instance */
>> +	u32 ieh_instance:2;
>> +	/** @reserved: Reserved for future use */
>> +	u32 reserved:30;
>> +	/** @global_error_status: Global error status */
>> +	u32 global_error_status;
>> +	/** @local_error_status: Local error status */
>> +	u32 local_error_status;
>> +	/** @gerr_mask: Global error mask */
>> +	u32 gerr_mask;
>> +	/** @additional_info: Additional information */
>> +	u32 additional_info[10];
>> +} __packed;
>>   #endif
