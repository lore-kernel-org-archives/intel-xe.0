Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F004C0218C
	for <intel-xe@archiver.kernel.org>; Mon, 27 Jan 2025 09:22:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E78A310E225;
	Mon, 27 Jan 2025 09:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aTfqaDaH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE3B010E225
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Jan 2025 09:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737969751; x=1769505751;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=spLJKoXjPw5qGYSMbGya6MF/Lvc5RuqjJKb7WjgBYnc=;
 b=aTfqaDaHtFJTLq+6u64zQgQKeMNPGMYtPneqDja6OL6F573NCf7nNSq/
 KmsGdNecJKw5iTgjYFRlS2zQ09HMsnK/aqaWGBZSchGb0q4siglfWNoBb
 /3T/XdD/cXbOoovoLvEJ45VL3EZXI+YbPM8UsGlE0k8cp0oENGWtZlSoS
 oCjsK/Dsv3r3VZdmj9piyANrhyCMqPC/Ho2ATSxuKFh7HjaDyn6OVdCAq
 N/sLXj3C0EdXQqGscbpPp96fFH5K9JXd6RAMEkA8yzhHdnC/cnHtP7dmJ
 sNqH7PDhPHjMg6VFW4GFxa1ckCugVYn2DyKghJjAKXSEZKwnX8rvUY7nf A==;
X-CSE-ConnectionGUID: /dM2k7MrRgy8iyx/LtRmtw==
X-CSE-MsgGUID: eyEaIcPURNS0ri2hWklZhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="38673552"
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; d="scan'208";a="38673552"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 01:22:31 -0800
X-CSE-ConnectionGUID: qeNwRdSHTfSpjrGfyYu/2g==
X-CSE-MsgGUID: kW2lqZk6SgKQcWjfuRWbJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; d="scan'208";a="108194536"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jan 2025 01:22:31 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 27 Jan 2025 01:22:30 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 27 Jan 2025 01:22:30 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 27 Jan 2025 01:22:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aifin8q+4GNosLdQJ4GftUXX7qB8kVpB5wWvA/hI0m7WFLu/zEqyXG1ebR3I7Rc4ApX2wPKUcP2pL3kB2Kz/8chesvkFo57LDOC6ZkBZc6oQ9M8INy2QzM6VzDvOpLtPwRqGEinxIJ6afDxYl47+J1POOcUvBPi8KPnW1gOV3Z9P5gOEvdBtPdyptVFlAyI0TkOB1FVfmY6cug9hjp2FHPdWwkzE0bS6tOh4RUoH9BnaKcPo5pqEasqPZsqSF1Pwcokmel/o4IA2VYSUJ6YcUdnXq8gTvyI1BBVzY+1QufwEqt4akOreaFbT3z4iobp9QVQ1lGYpWHit3Gpqgl5jQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L289dO8zVH8jRjOFf+z8sRn/E+UCHpCDYlhYH6rz2yM=;
 b=rBCg+gJKZpBl5t7TsO2aWiysPA7eQwEBhuciiF322qwFfTjnsI45Pukcjq55Qkbyoean+ov/oWohcnmmyFXQw1AeWxvoP1lyEssnhfwPY6yMsaVDZZ4GAB7zoBhb0UxsHaZ5Yx3jksLJjxmUowa2JsHIWA448dWDP20HRknh+zCIaCcsyvvwUgFKoX2ho/u2O2qEA9CFLjP7h6ftJgkcAZhE6WyxwDjpO1ghQZzC7Pr3F5NuadgFVyjY7yYTj1tnhkW8jx19knnIYUKKOw1ivCY4W4921aYnidgH/KwZwRVhpVNwJtdquIoTw3CEDk1AnkOBeAuAHRmJWAMViafrvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by CY5PR11MB6509.namprd11.prod.outlook.com (2603:10b6:930:43::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.20; Mon, 27 Jan
 2025 09:22:15 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::3bc7:767d:bb72:a6d0]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::3bc7:767d:bb72:a6d0%7]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 09:22:15 +0000
Message-ID: <b5e29aa7-415f-465d-9be7-33d6ebe006ab@intel.com>
Date: Mon, 27 Jan 2025 11:23:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/xe: Move display reference timestamp readout
 to display/
To: Matt Roper <matthew.d.roper@intel.com>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, <intel-xe@lists.freedesktop.org>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
References: <20240913162910.4145142-4-matthew.d.roper@intel.com>
 <87jzfad88n.fsf@intel.com>
 <rgsiho6xglvsrbgrc5ik3ylw3xhln7zlmfllsjhubdr2czyxk5@big4bvtcxtfg>
 <87cyl09d5p.fsf@intel.com> <ZuwGsRmKpY4u7b8A@intel.com>
 <20240930232652.GF5725@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20240930232652.GF5725@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0161.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::20) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|CY5PR11MB6509:EE_
X-MS-Office365-Filtering-Correlation-Id: 31bb5051-f836-4d5d-f6ce-08dd3eb41669
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ry8rTDAwdVZCdE9ocDdWZnBuMWxjR2VWR3Y2Q2M5RlhkM2ZmUTJ1MzhtYVZ6?=
 =?utf-8?B?SkJuWUx4eTNRMnlXVkNzbHdpTkxobnJpVmp4MEd6a1ZJUUtNSkxDdmtKWFlh?=
 =?utf-8?B?T1h5L1hQYUxFVGQrRTNwcm4rUWVXNDRNWXZwQ0F0TFpJcDViN0RJNE84Q0RJ?=
 =?utf-8?B?QXlSNVlJYXgvZEZpbUNobDk3a2RCWU5NTm1xSWNIQ2toT2YwY0pQRTZlS1RW?=
 =?utf-8?B?aEo4d0lDNXRMVktXTE4yaWFkQWxxZU9sRytPN0pWYlgwQjVMdW9nTXBDa2pT?=
 =?utf-8?B?VDhHaXpjVDF6Nm9lM0VHcGtFeDZxTld0bmNPQmdyQzk4WFgxODZQN04xMzkx?=
 =?utf-8?B?UE1uUHRzMXhhRWg3OVBEZDlTK2hFV2lWeTBhK21CWHJwTnVwcStaaU1GNWg2?=
 =?utf-8?B?WVEvQkZMQnkxU2tVbVp0T3hhK0h2dFBCRkVteUh2SUJLZUlPUnk2eGdxN2VQ?=
 =?utf-8?B?d2V3dGZabERFTy9uWmp6Um9nVnlkWHJodXBiNnpkUDcyZjJGYStjRDVuWVph?=
 =?utf-8?B?K1NzN2dqVjcwTzJzTWs3ZnNnTC81bWYvU3ZXR1VxTGxPK1ZFa0g5UFcrRmZt?=
 =?utf-8?B?VEg4R014elY3U1VpanZCN1dKT255WUpkQ0R6M3lUVktlV3RFL2xhYm9vUmVl?=
 =?utf-8?B?cC83VTVPZFN0NlN3VlhVbldrcjdSek1PWHFJUmRQT3U2MnhVbXNVS0hrYzhu?=
 =?utf-8?B?cCt5MzRvRExQUk9CNUVtZWk3VTV2YmZBT045WTltV1Q0VUI1eEVNZWpmZnY3?=
 =?utf-8?B?TDdQM3hVelE5aE90Ky95S0VQTUNac0wxYlhvWS9XaUxLZ3duZjFGT1pLQW96?=
 =?utf-8?B?RHJnd2VVMG0rdFlCcHBxUUh1cC9mU21XcjRDRTJCVjRSaUVIRFZzRjVNUnBy?=
 =?utf-8?B?R1U3c0t5SmNIcHVhQW5DbW1zblB2ZkVIQUt2VFJNZHcwZDVsM1RLelpKMmtT?=
 =?utf-8?B?ZUZNSS9mRE5Wd3k3cGdiQURCSzdaNERFcTgyOEJ0bm9jTGdkRmVWZGVWRTdE?=
 =?utf-8?B?SW5UNXZ3WDh0RlFPV0NLS1hSaFdJZ1M4SWtLK2s0WjhJMTF6cUhBbldYQVpD?=
 =?utf-8?B?UTFndmZtZ1RTZWpKcWlmaWMzTzg2aU9yK1Y0cW1xS1MvRU5wZ0pRWFgzdlhJ?=
 =?utf-8?B?ZTM2Vm5TZnI5Q0ttaTc4Q3hKTEErUFY3ek8xanJPMkJYbkhHSXZtazZCaW1j?=
 =?utf-8?B?VThEeDBMZ3JkZlJEWS9XdW91STR3d2o4ak5jMXh4M01pVTQ1ME9lVHNGVHJO?=
 =?utf-8?B?N2pnckdTaG5hRTZpUEJ6SlZybzZGTXVmTzhxZkkxcUp5NEMxVmRRY1QzQXQ0?=
 =?utf-8?B?aEh4UGkvK29uZytENkxEN2xkTDZXcnhXYkZiaXovTVJ1dTdWRVdJT1BpOVV5?=
 =?utf-8?B?bUIvMm5SN3NtMGw0RGt0YjYxeUhTcHJHVEg3QXhCQ1p2KzdsK2lpVU1lRHU5?=
 =?utf-8?B?dmFKcjZIUk95VzhXV3FBaCtQa0JlSkdlNENrZGxwV0F6U2JiM0VMZ3BXdWNz?=
 =?utf-8?B?OWtZVGYvK05PWWUyZUtCSGNlODljdnFxcDNUMjl0dDRFMFpIbUh2L3lBRUMz?=
 =?utf-8?B?MmJjdjdsV3QzQXJTTzZMZVFjOFF0dFkyRkU4L1Ztejc3a1E1M2lxWUVLRWVW?=
 =?utf-8?B?SlNQWGxxbVU1M2ZvY051bzl4SUhoYnA1SkRsTkFTYnh1cWllSUYrbWRzRVlN?=
 =?utf-8?B?SG9BYS9iSThUY295REZRdllGM2gwak1yZi8xM2VDUWZlNzJFQzVDQytGQ1R3?=
 =?utf-8?B?bXd2RG9keCtkdHF3ZW1mWGgrYVFud0ExWFZGeDlGc0hJZzgvVmYyaE1iMysx?=
 =?utf-8?B?QUNScXZ0S3FHaGQvNVEyckJ2WGkwSi9NdVROKzdFcStpUkU4NTRJWGtiY2xN?=
 =?utf-8?Q?GiFNlG4f2KBB3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NW1VS2JibkFvTm1MYWRHZ2ZYNUN3YTg3bHpZYy9uTEVyVWJMM255aFlYQjUx?=
 =?utf-8?B?VUw3cGJacU9haVVwTWlpNFZTeXcrOHd5RHk5K3ZRM1V3R1NBazRvbWZyZEFt?=
 =?utf-8?B?TmRGZUNCUEI5NHpNS1JldUk1MytUTTdGUVJ3a2dYaFhUbCtLa256UTBYTkxy?=
 =?utf-8?B?YWtDakxkRTJXSzFyelB5WkJhbDVHcXAxUGw5SDJTVFlhZmlFQ3JMTkZON1RK?=
 =?utf-8?B?am1PY0p3OUN2MXlsWTVOaFZrcnVpV2R6OG9pbWgzNis2blJWQTJ1d3loOTU5?=
 =?utf-8?B?M1lsQ2hiRTdmVnFrT0ZjM2d3bWgwWGdZcXNSNjB1TzZ2bDVZL3hUVEZjZjVH?=
 =?utf-8?B?SnRoUkIzcHRzN253Y1ZVd2lQVmM4SkY2dEdpdHM1SHpQSzRMWnlWOTE3MlY2?=
 =?utf-8?B?SWxtdmE3bnRpajBNNmtRcnF3czliMUxiemoyN3Q2aE8yUW5uRWRTUEF2NFpw?=
 =?utf-8?B?MWw0dEhCcm1GVHBHUE9La05JbUkrNjdESnc2ZSs2Tk9OTXNCZmdSSW8yN2J3?=
 =?utf-8?B?UytvYWdzL05XQXIzblRSWVpKMy9hYlBlNC9vZERhcksyQWRweGlCL2JoK3Zt?=
 =?utf-8?B?cFZzSHFXUzFrNzMrUVY3VWF5T0dBQmwvZmF2ZEwva3VWQXdpV2dwVlVaemdB?=
 =?utf-8?B?YThyam1MOTIwbEVsRjlGc05PcTZoU0tYbWFJcXF1d1RvVCsrMHhaTzJOa1R6?=
 =?utf-8?B?dEYvdmZtdHY5VDd1TmRqMmhneEtxTjRsNXdTR1FNSy9NemRwT2RzZ0w0N0F6?=
 =?utf-8?B?WWYxUGxtR2R2cXZMRE5lY2REeWM1QkdiUU1hb1o3SFFGTjBiVFlvbkNwWVZI?=
 =?utf-8?B?Y2tJb1BHaXNZR2VrWUVOaUc1U21tOFNnb3M0NzVyYjZpRDlXMlAvQkExdG0x?=
 =?utf-8?B?NEpidTZBWVBaUDJvcnFQdVh5djBEUDdqWFJuaUhwTDNXVExHcXdreFFTWHZY?=
 =?utf-8?B?SFIyejY3ams0Y0YyS1VYK3NTdkZ3Ukl5Vjh3TWJoSzRPTlpCbks1ZWxZbDFV?=
 =?utf-8?B?OGJXT1pzUXpneGRuOGVPdGd1YVlFU21ZVDFEZmp6eDdNb2hWQmhWa00zUG9D?=
 =?utf-8?B?Z0FhblowYlNidkZKbU5IbTZtZjJCWTZ2YkdDWndlL2IvRXZOUVZyUFZNeVlT?=
 =?utf-8?B?MkFjcWNDdUJFQ0d4WWxlcHB0c2Z3TFVGWjBnbjcxN255eHhORHYxV0dibERJ?=
 =?utf-8?B?RkU0bk5HZlpFaHNhcmtLQnU4ZEh0RnhuM2pKcmowbi9DWWJIcVg4ZlAyanVu?=
 =?utf-8?B?Zm1Id0U1RmNycmE0MTlzbHhkd1U3N2l4QXpHK25QRnJqQmMvbFNhSXlNZ205?=
 =?utf-8?B?emNRMGRvb3NJc0dpZUZFdFpGcUhqY1dkb3MwQndaS1FYRUFtdU1IUnl3ZXpm?=
 =?utf-8?B?Uk5DbjhIUHFjak5LQ1JuZThidjNVMnAybk1qZktZckxyQkxlbFB1bGFvOXdl?=
 =?utf-8?B?dGIwOFZHaEc5QmFiaVpkb09pK2lkWER4aUZXRmtKNFQvRFpLOFUxTHdzNWtU?=
 =?utf-8?B?MnMzVjhwTlhuMGJsQmdudmZLZkVOM3dpY0VpS1hyUjRzeVo3UGorUDVwa2ht?=
 =?utf-8?B?WUk2Y0V4NnloOGNROThwLzZpWmZQWllsMUtxdGIyZDRkNGhJb3pSM2pYdjNV?=
 =?utf-8?B?NTNGaS9xTDNBYm53TFV3WnljSGI3WVRMZzhSN0VvaE9kNDk2TytITit2djI1?=
 =?utf-8?B?NU84Qko5YmR6R3JWeVJEd3Fha0RrVTB1TmpPU0lSZndta3daQW9JRG9VUlhj?=
 =?utf-8?B?VEdLS21KWk5pTVFwZ0tHUE9TTjdvZmI1TFVIaDYyUEZUZGlPSEJkeTNLR3li?=
 =?utf-8?B?QWpIWE9FR0k3d3BCWTlqemJaakJIaEpkeHdFd01wbzJZQkpHZGZ3MzBoRjJh?=
 =?utf-8?B?TFY3UU02QkFwSjN4VGF1RFk0elZwNkpiTVpkSTQ3VEs1NjZETDV5MXFMVXg0?=
 =?utf-8?B?OFhFSmZCa0hDcFFybjZQMDFqamVHd0lCQXUreGo2TDJmSDA4RFBLRlh5ZUpW?=
 =?utf-8?B?bHpLeXdXRndRYmxYL255aTB1VnliWnVWaVFhWFhVOTFPaUdlaU9XUHNoeFM0?=
 =?utf-8?B?VS9HSU00RGNOTGErU3ArMjZ1Y0pPZE93ZnZ3T0toaDhDelZmTkNxeGJoSWh4?=
 =?utf-8?B?eXZMVUtUc1VRVVNJZmRxMjZmeVVPKzdHTWQrcml4Q2xkUXMvYWVVVjR6S05O?=
 =?utf-8?B?ZlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31bb5051-f836-4d5d-f6ce-08dd3eb41669
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 09:22:14.9224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mcWgzRF/EieFAao9+htwNnF8unlRZ1N4R1oKAYp+gpjNVyXeUDdKj6yN7+VTCwmW/KhI0i9WtnGcEgcclChr2ADJK2LNBuB01SmGtV89tek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6509
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

On 01/10/2024 02:26, Matt Roper wrote:
> On Thu, Sep 19, 2024 at 02:10:41PM +0300, Ville Syrjälä wrote:
>> On Thu, Sep 19, 2024 at 01:00:02PM +0300, Jani Nikula wrote:
>>> On Wed, 18 Sep 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>>> On Tue, Sep 17, 2024 at 10:55:52AM GMT, Jani Nikula wrote:
>>>>> On Fri, 13 Sep 2024, Matt Roper <matthew.d.roper@intel.com> wrote:
>>>>>> It's quite unusual to read display registers as part of GT
>>>>>> initialization, but use of the display reference timestamp is one
>>>>>> approach to calculating the GT clock frequency on older platforms.
>>>>>> Rename the function that does this readout and move it to display/ to
>>>>>> make it more clear what's actually happening when this route is taken.
>>>>>> Also add an assert that we've probed display before calling this
>>>>>> function since we never expect this to be the route taken on platforms
>>>>>> that lack display.
>>>>>>
>>>>>> In the future we may want to move to an intel_display implementation
>>>>>> that can be shared with i915, but we'll leave that for later.
>>>>>>
>>>>>> Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>>>>> Mixed feelings about this. On the one hand moving to display seems
>>>>> appropriate, but adding any new stuff to xe_display.c means more stuff
>>>>> to clean up for later.
>>>>>
>>>>> As you know, i915 does this as well in i915 core. The next logical step
>>>>> is then to have this in i915/display, and share the code between i915
>>>>> and xe. Adding another interface for i915/display.
>>>> humn... but what would be the alternative? Move the i915 one to
>>>> i915/display and then make both xe-core and i915-core use that?
>>>> If we move it to display/ here then we can land this and finish the
>>>> cleanup later.
>>> The alternative would be to keep it outside of display/ in both drivers,
>>> because display doesn't appear to need it. The annoying part in that is,
>>> obviously, that display should take care of display stuff.
>> This whole code seems rather dodgy. I see Windows has similar code
>> so I presume that's where it came from. But does anyone know what
>> this "Broadwell divider mode" actually does?
> +Lionel, since you wrote the original code for this in commit
> dab91783338b ("drm/i915: expose command stream timestamp frequency to
> userspace") do you happen to remember if there was any other
> documentation on the CTC_MODE setting?  I.e., what "Broadwell divider
> mode" (the description in the bspec) actually means and how we should
> know to use a display reference clock in that case?


I don't remember this stuff having anything to do with display HW (is 
TIMESTAMP_OVERRIDE part of the display HW?).

And yes, I had to read the windows code to get what register to read 
based on the value of CTC_MODE because there is no documentation about 
that afaict.


-Lionel


>
>
> Matt
>
>> If we assume that it means the display refclk is also used to
>> generate the CS timestamps (I'm really suprised to learn that
>> maybe there are systems with different refclks for display vs.
>> GT) and that TIMESTAMP_CTR is always generated from the display
>> refclk then display already reads that out from
>> DSSM, no need to read out the TIMESTAMP_OVERRIDE.
>>
>> Also the current code that reads TIMESTAMP_OVERRIDE doesn't
>> even seem to check whether the override is actually enabled.
>> IIRC I saw bit 30==enable at least on some platforms...


That bit seems deprecated since 396385 398004 (Gfx9 era)


>>
>> -- 
>> Ville Syrjälä
>> Intel


