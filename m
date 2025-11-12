Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE99CD3428
	for <intel-xe@archiver.kernel.org>; Wed, 12 Nov 2025 17:07:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39C1510E091;
	Wed, 12 Nov 2025 17:07:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WYS+sQFv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3452C10E091
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Nov 2025 17:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762967248; x=1794503248;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=C4fduPol82Dv5VZs3MoU84nW1OdZngIIS6MX1jVOd/8=;
 b=WYS+sQFv82SFMUIbfS7w6SB52OEaoxja2UKFl4f58PCdfxYuR9XmQRrH
 u43/MKL3A0IlDzf3yyDTFXQVU34W91SaxQFQSJ7iA514qrTm5OWFiqIg6
 yXMBKGfrwG7HumyMhtBsvIVayBm2Mpjn6Fu9GdIt+H7HbE/wYzd7aogXU
 blImLz32EDV+Dnmm+JLl3VEBcrxM2vgUvNUZ4+k3VdMk26pHEO97SdPyn
 NqUB8ePr7Iqrf7LvBxTUHZVaMOA/2ozNA/INdispubT3UuvVQ4p+UQGHd
 ugxP6vsTHudNvot4GwD6J7Ic1tUvXnRYF9XflbQ6qGD5erLrlOip9zAcm w==;
X-CSE-ConnectionGUID: aU29Uq6STpOYMTRm6sg7/Q==
X-CSE-MsgGUID: LsO8MBKSSc+iFVhj6sTNiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="65069607"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="65069607"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 09:07:27 -0800
X-CSE-ConnectionGUID: ohtuXYTAT9+1GT1YiUI0Yw==
X-CSE-MsgGUID: 4gN/fAk5Ssm69INWHvtUNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="193660777"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 09:07:27 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 09:07:27 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 09:07:27 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.17) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 09:07:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sL8v6r3/A35IO06UDBkCa/2oKvF3N64ofNHj9Li+n6kN5ClPHNEOtflvmDam4yGoTZH2WBkK/KZ+jNGhTxPsFwbbezgBfAhKAtd7betc7ExTsCJWtO60yj8zl/bxjQWraH2AitfTEls2eHlNQ4BMmuwux2KaFaeNEN9f9V28fG0tYFOeGr1aRF9OIjTWHY/Swl33brPUpZErq1BxBzQV8VOSJI0MQoBYI34htG7TvD4R0U5KW205UWMqWpzmkAtOKXJyvjmxmiCOrYq+K2wpbKRCrGZf7lFhhZpdoNwtitN7qYwe7ty1zf/vOH5g/Y75lIaeVZgr1i/LNF/p7Z05Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QlM804S0qXaA6Wpcy1kvh49F2jJXjUSKUAdkShEWeXk=;
 b=o42QIbYVlXIry58n5Sfke33hQc6sgjlC/114zlgyj1WGk5GYGY3TDwPPiOgL2mfSK3W7n4aFATn+mBBGONMxJXubvj8+R9Ui7eqsyGiWNltOEs+PXBGAs9ZYBCt5JJDlanjx3p+R66vqyNRGjLiVIQ/5JlO8Z34MAvV7Dixa+QK5w5CwDNoYOYyjpYRKo5gG0gsMirXykSucXgFhMg5UD11A43TAz8bs9Zibeqv5WsH6gGMdVIxygFBzMelvUrg8pRIt0hIO1VIhW0N0EdQ8OlH5uwGkEzgcy0Y8NeWe6urU6CbEbk1utfpIbM1x34uWte6ojYQFRE/NKnpviQQZTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH7PR11MB6748.namprd11.prod.outlook.com (2603:10b6:510:1b6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Wed, 12 Nov
 2025 17:07:24 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 17:07:23 +0000
Message-ID: <f009dd3e-7736-4357-b485-29699b2b27e1@intel.com>
Date: Wed, 12 Nov 2025 18:07:19 +0100
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBkcm0veGUvcGY6?=
 =?UTF-8?Q?_Allow_to_lockdown_the_PF_using_custom_guard_=28rev5=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20251109162451.4779-1-michal.wajdeczko@intel.com>
 <176271235200.33584.356440255027254374@10055242dc62>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <176271235200.33584.356440255027254374@10055242dc62>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0023.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::7) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH7PR11MB6748:EE_
X-MS-Office365-Filtering-Correlation-Id: f5211044-58f4-4e6e-399f-08de220df2c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WlpWM2xuc2xGa0hldTJUUjFFd2c4TVVTQlFjZnN3TzVXWHJtWmRJTkh0VWg4?=
 =?utf-8?B?aWR0QUNVYjB0bllGUkJsaU1kQitjc2RHOFB3Qi9BVEJXL1BuVE4zRzQxUkx5?=
 =?utf-8?B?M005aVNOMjJDVlN0dENsTFRGSG1WVUF0blQvUUVXeE1hQXdjMlE2dHBJZUlU?=
 =?utf-8?B?TXFZMWEzc2pFWlNzK3N2YzlLdEhBcllvTUF6ZnZ4MjBZOE9palFnQkY5Z21Y?=
 =?utf-8?B?VEd5K1o5aG9kVkdUTjVzZUFZaVFPWjh2WEtacjdsV2lqR1NFdFpxY3h2L2Vh?=
 =?utf-8?B?R0RoRzdpVk5tckp3cWlVTjdiMTFPL01aQk1JSy9aVEVvK1ljcHhPTTBNVW9j?=
 =?utf-8?B?SlNzM1dWM3JYNzB3cmlkcEdMcGdwOHN6d2VrZ1c3Uk1VWitseHRVVGxVZk9R?=
 =?utf-8?B?U1FObkxNZHpoU3pUcnJ0ckZ1dlN5WU9NWldPRGtuMzJMcXQ3L1V2VnR4TGlh?=
 =?utf-8?B?Nm5TYlhDTkNpdGF0cWlMdDhGMzFRRDRRMjBjTytBSTcyVDkyeW1lVy9tRHBD?=
 =?utf-8?B?VjV0ZThVeEhDQXd1WW5BaDZyZk1xLzM2OVUzRFRLMU1EVnhwZDhOY0ZlL1BC?=
 =?utf-8?B?ZVdxNVdjdWtZTm5xbDd0a0Y5U0tzY1NhSURJcFQvckNJY2Nxcjd0WjB0MGlH?=
 =?utf-8?B?YlluVVU4dUV1OVFNSXpjM2VNUU16VFo5ekR4K0hDd2JlSlIyUDliRGpnYzkr?=
 =?utf-8?B?VjVSUzFiV002UEZSOFlvVmRTSTFETkdNRHY4eW94NUFvTlVNbldJMHJQTlV2?=
 =?utf-8?B?TGxOaHZ4eEZWMDdPOTJKTDR1VVZ3VHJ6WmtMT0N4YTFWYUE5ZzBET0pobVoy?=
 =?utf-8?B?RTBYU0U4K3dIVG9PSjZLa2JSaU84UE5iWTR4clEyMzRNTWZFQUFwMkUwblJ0?=
 =?utf-8?B?OW9TZUZTT1A2RTkwR3NUUWZCZ2pIaG12bFJZTHBGY3F2OGhwYjB6d2RvZ28v?=
 =?utf-8?B?OU5wcnFJS2ZxY2pSd2xiaUljOFpybjYzaFRwZ3ZYNWV3enE0OVREQlhzdVFn?=
 =?utf-8?B?L0MzUWFVTlBZcFZGLzFyODhEd2hHczJEMkhrdDB4YW41b05LQWpNMzJobVZK?=
 =?utf-8?B?di9pamdPa09HRWdwS0dkNkV6NVpFbU5waDlpQU42MGlUdkZwTVRyYnFhTHlH?=
 =?utf-8?B?Mi9QYzFtNTlkSEx1QXYzYXJvZ0liTFpSYkx3T244cHp3K0tFb2tDcFFBT0E2?=
 =?utf-8?B?ZDE2ZXVLSkdNZ2hOVmp0ZFVINkVRNDBjL0ZlRC9MbWdmU2tuYUxxU1N3bGRS?=
 =?utf-8?B?MUVkSGtEemFadm5ubDhxN3VpV1FQQzlPUXJkNTM3UDVac2haQkkvYXNtNTdy?=
 =?utf-8?B?Ly8xQWRteXJGNEF1b1Q0Y2V0Ni9FSlRqbzNsVE9UWFZyYXZrL0kvUkswNU1W?=
 =?utf-8?B?WFdPUW5SM01ObVpUeDY2S2dmODVyOThYenc4RzMydzdXaVlvc2NBM21oT0lw?=
 =?utf-8?B?S3BBTjFXZWhNc3B3RU16ZlZJV2JBQTdzNlFXcHZVcUo5eEpYUEJ3WC9MdXM5?=
 =?utf-8?B?em5lQU85dis1SEhlU3AwM2gzdE9LMG5VdXlWSUdyQnRCVEFCNUd0TEFZU0gy?=
 =?utf-8?B?ZjlGVW93MzFISEFkOFM4L3ZZSHZwRWg3aU1VN2VYbStLNDcxbEpQekdla1lJ?=
 =?utf-8?B?TU15dkE5bXZtMFgyTmVHQ05XQVNQZ05mWllKNWtlQkQ0V0RyVXNlWndpUjhB?=
 =?utf-8?B?M2F6clRkbVRxNHhkczBraC9vVFRweEgvWjNWQXpmWmhldGtKbW9RMXBQU2Fo?=
 =?utf-8?B?SExTZGpndktmdkt5ZWFlOHNhd011c0VFNm9IZjcvUm1udVFqbVE5cFlSYUVI?=
 =?utf-8?B?Um5SUXR5elNNOVhNblIrU3hKM3JTTjl5aHB5Tm1OTTlYZjh2VmpPRXoxNFNm?=
 =?utf-8?B?Nmp5UHArU3lBT1VrSU03dDZUU1IyZTltQU1oT1RtK3NpVXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sm5UOFE5YmxWWmxUL1BETGNUU1VyeEc2NWNzVkFkeTVaMWNObEI5S2wrM1FX?=
 =?utf-8?B?eVdUWGg2czFaK0VpUzZqbmhkT1Z2RFVHbURQYTVSOE9Vem9LWEQyUWM3R2F0?=
 =?utf-8?B?dDR1UmVUK0FGU21JTWdmUEo4MGhjbXBKSE1UWVlCQy9BekIvbFdBS0RVSHV6?=
 =?utf-8?B?bW93bEc1UXIxWUZLSjR2ZTc3d2hWNURadC9paHVzM3UvRitSNXcwRWt6SzF3?=
 =?utf-8?B?R3BCanZYZG1icjdMeldZU3dpd2NEYis4aXlZT3piY2tTZ2FYNkxSd3hYbmw0?=
 =?utf-8?B?YzFBcnVUK2x1eUZtOXEyb2Q4RnNIV1hYTnFnV3JWTlNqZHB1bmZLRi85SGVy?=
 =?utf-8?B?bHVKSWxxTmxXcFF3eVRBWHphZkJMQmJ0M0NUQlJ2VExpdnhJY0dKMFpzUFpq?=
 =?utf-8?B?MTFGbWk1YWhJZWJhUk9MTUJhRmdaOGxjNkpQdUtDemJjSXM4NXBkWjJDbnRH?=
 =?utf-8?B?QjdQVmFublhJeXBUZ3JWcEpJT2JOc05LYm1FQmUxOFRjeGY5VHBaRCs3cGRm?=
 =?utf-8?B?SnZBL21USlpSSVA2cE5ISUFraFB4eGJybUFmUHppeHAvb2dXdFAvajhyaG1M?=
 =?utf-8?B?WERWQlFhdm1Pb21Tb2M2OHEzaW9uM0tUa3k0ZnhMb0hZY3R2aXdsMkRtN0JD?=
 =?utf-8?B?ZkhBUGQxWG5ucHFwSXRrVmJQRXZFZ0xadklhUkZucFBNOFE2YkZ5TUVQRjlt?=
 =?utf-8?B?WXVpd3JOc3RCZ1g5cmdicU1PNW56MDZTU2d5Ui81VTVDR1huVVJzck5EaG9M?=
 =?utf-8?B?RlRXaVpSSDRqZUVOTys0UzZWbEd4RDlqUWFYdGxsY2I4dk11UHdnMFNiUjZp?=
 =?utf-8?B?dllDL1RWWW5xdlZGTS9mLy83V2NQZG90bXhGSjFRZ05UVlgwaHVKL2hsS0hp?=
 =?utf-8?B?cnBSUTY0OGVjQnZmR2lMeEI3N3NDa01JTUdCazZJYVZVT0MySFNyZ2hxeEJK?=
 =?utf-8?B?R0gwYzJRZFlGRHNFeW85MFVOM25jZHoyZ0RGMzBROG8rTVJ4MTZlY2VDeHdY?=
 =?utf-8?B?amRqRDdQZU9MNnZzNGhueC9aVVRGM0ZnRE5FWFZCWGFPcG1yV1NjT3hENk5v?=
 =?utf-8?B?MHhXZ1hiNTk1dHNIalFEVE83dGJKS0RSSUxnR044SUVvWUI1TjNibGVJMGp3?=
 =?utf-8?B?cThZMWNuN3FCL005OVRZeTNRWm1DTDM5RDdiS0xrKzZha2FzbHg5NEVwZHNo?=
 =?utf-8?B?dWEweEtON01sVUt5YlhJOEl2eWljOGlUaVhuV2Z0ZmJKZUFWeFVJbGlHWitp?=
 =?utf-8?B?SlhQWWR6UTd1ckVQMVBPbVpteWJsUzEvWGt2VFhVRXZFVDBDTzJJOHR2aG41?=
 =?utf-8?B?bG9WczJ2eERTdithRjVGMkFyVTA5MGJTbFUxWU5qZytmeWpBRXRLZTFScmFW?=
 =?utf-8?B?L1p1SnlzaUxkSEZZbmF3UjdGWGhvVnlWUWo5Z1Y0T1VkemozM3JNUTR5UzRs?=
 =?utf-8?B?U2trcysvNE14R25nbTAvUisraThoWEQzdzRYS0tpUXdBRjY5NUdndmRUYUxh?=
 =?utf-8?B?dDNHaTBTaDlGaUxHUDl4TGV1QmxNVk5UcHdCTlhSdVd0MGQ0bVlLOUlLNy8z?=
 =?utf-8?B?ZGFUcy83TGEwMmoxeUFsakxzb0RKRGxyS3lJYnZUWWRMcWlWa1NsNmpIQXlS?=
 =?utf-8?B?U3ErNVFoY2FBTVBrMysray8wU3ZnY3lmRWxManZRSnk5Y1B1aFR6a2NSUmI1?=
 =?utf-8?B?d1ZuQ3Z0Vkh6eDJPeGFRM0VtWnAxbkxDZndWem0rTWltZ3RmN01MSzM5UDNv?=
 =?utf-8?B?QWd0UVhpaS83bUhrd1U3blJEdFRaNDBtOEV0a1JoUFlKdTc1MGtVTHE0cHpV?=
 =?utf-8?B?OUR5OGIxSHNWNnMwWVlSQVVOcHVScVJaQ1U0TGJHMnFkYjFsWU8rUWx2T09N?=
 =?utf-8?B?MUNMenllQmowVGpDakpaaldqWTZYQi91MmxKSHlLR2tGVnhENmpBSHZoRlpx?=
 =?utf-8?B?dVd0Q2N1TFBRdWs0elp3S1VtN2lFQXJLeDlIMW9hSTBFeERpMGQ1YlQwTHZU?=
 =?utf-8?B?UWE1cDFQZk9BMVZpTU11SWNScytLcVVSYTNPYU04b1UwbUxRa1JLK0hDa3Fn?=
 =?utf-8?B?MzMwYkdmeUpGc0FpWm9jNWRiMmtjMEt0RllIWUdGb1FJbmZvVDJzQW92ZFZZ?=
 =?utf-8?B?cVVTZ3lQd3VhOHhOb29iVkRLZ3FidDZXNWExQjJHejBKT0k4UDZQS1BjOEFQ?=
 =?utf-8?B?RFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f5211044-58f4-4e6e-399f-08de220df2c0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 17:07:23.8530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aqi70sUpTCk+8b9PojUFI1vT7PBtjgGBBGcAs161vZ67m4hw7na2zgh6JiDdbgJtArvKs6Ag0HgC4Bx7TeUOjLiXci3REqExUvDql69UgsI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6748
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



On 11/9/2025 7:19 PM, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/pf: Allow to lockdown the PF using custom guard (rev5)
> *URL:*	https://patchwork.freedesktop.org/series/156795/ <https://patchwork.freedesktop.org/series/156795/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156795v5/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156795v5/index.html>
> 
> 
>   CI Bug Log - changes from xe-4075-ed09c460ec22d447d1729ebbf913b7229e1f48ea_FULL -> xe-pw-156795v5_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-156795v5_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-156795v5_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-156795v5_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_cursor_legacy@torture-move@all-pipes:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4075-ed09c460ec22d447d1729ebbf913b7229e1f48ea/shard-dg2-435/igt@kms_cursor_legacy@torture-move@all-pipes.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156795v5/shard-dg2-463/igt@kms_cursor_legacy@torture-move@all-pipes.html>

unrelated

<4> [109.367857] xe 0000:00:02.0: [drm] Tile0: GT0: GuC load: excessive init time: 946ms! [status = 0x8002F0EC]
<4> [109.367864] xe 0000:00:02.0: [drm] Tile0: GT0: GuC load: excessive init time: [freq = 1300MHz (req = 1500MHz), before = 1300MHz, perf_limit_reasons = 0x00000100]


>   *
> 
>     igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4075-ed09c460ec22d447d1729ebbf913b7229e1f48ea/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156795v5/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0.html>

unrelated (non-SRIOV platform)

(xe_pmu:3651) CRITICAL: Test assertion failure function accuracy, file ../tests/intel/xe_pmu.c:625:
(xe_pmu:3651) CRITICAL: Failed assertion: (double)(100.0 * engine_activity) <= ((double)(100.0 * expected) + (3)) && (double)(100.0 * engine_activity) >= ((double)(100.0 * expected) - (3))
(xe_pmu:3651) CRITICAL: 45.599705 not within +3.000000/-3.000000 of 48.717342! ('100.0 * engine_activity' vs '100.0 * expected')
Dynamic subtest engine-DRM_XE_ENGINE_CLASS_VIDEO_DECODE0 failed.



