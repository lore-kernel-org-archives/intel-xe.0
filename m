Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B87C44501
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jul 2026 08:02:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3575F10E57C;
	Wed,  8 Jul 2026 08:02:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KuI3YWHo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 263B610E57C
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jul 2026 08:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783497726; x=1815033726;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eAMK0fW3hIx5ZaFGGfbdEpAU6wyLwIcXl47RYMkwckw=;
 b=KuI3YWHorlxTWZLc7f8KUZEZ/3Q/pwGucq+AbOcQgWTVyrD1XiTsqFe9
 gnWtSzPP+IOVIl11qe0FUwuaoDLmXzZSyOvehNoSdcfb1XmA90BCmls3m
 pjxTTJAasSzRzseX+DJEw9sFakiUnL3I8FJoHHI2kxoOgbD0Zwcs6YOGu
 fvO2W6elRN4c7pLpxWr2PqmxOxHBTrHckERBYZByl3CAI8QoUBpF973Fj
 u5OJ0bz5rPAtNQmHkNgVBsP687bxlRDGQe3s9CMwSsngMatGgzdwifgsX
 /RxptiIAXJH0TTIv+qGMzUOXMBoIqVMBtAm4071w9wH2tsL5AqflizG7R Q==;
X-CSE-ConnectionGUID: DXk2Vn71S6CSR12MLkFlzA==
X-CSE-MsgGUID: XbL8/xfRRZGNfbGSHF2FWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="101702285"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="101702285"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 01:02:01 -0700
X-CSE-ConnectionGUID: MvLdGu0wTSiBZviVLvIX1g==
X-CSE-MsgGUID: M0RFQyYDS1uGNC+CVA507w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="247851882"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 01:02:01 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 01:02:00 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 8 Jul 2026 01:02:00 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.28) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 01:02:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pi+pQHs09E7IGHpjQ50AZkurMPYUUIFHvoLxZljfexdEHA8Yvseq9ssjx4y+VtnpRv9nFS+E7BJz/2UQS4Xi5RixBORzGb2RwIKngbnIQnduMiwmZ/9Cn2Bz4jOLQ1W6sCAx1ZqgG9ftyGPjgRzFqSJw7VCC0YH+urXBluu/3iwAyoQ+KOiTjddZOIVyRpZh62Phip1XU6eCzKgama1lqU4D3MzeAsmkZTRgpNHGZaZ9OQ943ZstmEhIDvwapNW/S3ye0RlSWqgcMJf1kvbztlP9lYIyg3Uw69b5JyEhWVQGxWLNep9ws04xIUwAdIhVbdwYNlv9+YXeAU6e5MTSwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T9OZE53vPtY88I6Kf4P93VOE4qPC8vuESmfzXTOk4cY=;
 b=UpK1YLyT52+ZQg6hG4ronfEDy2oUnLrtFM3H2wFRIhxvPU12ipDM7+52af57nLHzQSnF3ouHSm/RtjYuB6fiV79utXEMEMrttV1o+B9r4pc+xdGf9GFsq8MJjrG9uWQv0p1yBv4suMdeEGwW7Fu/WlnbjKCnwotqSyxKiKBIALgCWns22EF3BHq/x/BpLOJDE4GloEpHm5q8gL2VaD6NXdDQlSrTqgeCU+EAAjruarK9bLEp5KOJSMobKITL9piT3grLMvXlRdQvhW7dFyqzicL2eMGrtj6jChX5tm86Np0vFdRBUQNG2qfNg6Di5J4f3MeSMQgz+9ZoowCTOPymHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CYYPR11MB8388.namprd11.prod.outlook.com (2603:10b6:930:c2::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.8; Wed, 8 Jul 2026 08:01:57 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0181.009; Wed, 8 Jul 2026
 08:01:57 +0000
Message-ID: <2d2dff48-2955-441a-bd63-4f56a56cfabe@intel.com>
Date: Wed, 8 Jul 2026 13:31:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/1] drm/xe/xe_ras: Add RAS GPU health indicator
To: "Purkait, Soham" <soham.purkait@intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <andi.shyti@intel.com>,
 <rodrigo.vivi@intel.com>
CC: <anoop.c.vijay@intel.com>
References: <20260708061221.4006706-3-soham.purkait@intel.com>
 <20260708061221.4006706-4-soham.purkait@intel.com>
 <1642a35e-36f4-4930-b9f4-c4a64105fa06@intel.com>
 <9d18fe09-196d-4766-b82e-5561de15dec7@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <9d18fe09-196d-4766-b82e-5561de15dec7@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0073.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CYYPR11MB8388:EE_
X-MS-Office365-Filtering-Correlation-Id: 4112c3d4-09aa-4129-4a98-08dedcc72e8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|22082099003|11063799006|4143699003|18002099003|56012099006|3023799007|6133799003|921020;
X-Microsoft-Antispam-Message-Info: rRfY5nJg3+k3oOfQ88fo5LJJHaNYh/UTwLTFkaCfSlnbOKzQTmzSqZcWQYUf02rk/iSkiemrJvoeeTy2LVxMfQul75aJ+n+cS4t7Cg8NG4vqTJOphOJKLDKk7/9fzwTZMbJ7UXL4FH2r6Oou8ENkGDBGTgRyzIWEoaSiAs2pa6FAa+i/PboyOqWcb45y3qBLfb/GB3a/RJMuaupqQ58J2a4ZUFokVq7aehKMmfH9H8RqJKojjpe24YOFRSKOYT0corggkFv/D1LNfo7rCy61dWBECyZJ86qiTPem4jCAe4MMtoXQViZ6jxiFQxzjC/jxifAa+wyg/BJXmfTmFXigLA/MO7iXa/K1SNtbMxGT6uu7s5mBK1oN/s9B++04YLJoT42Y1NP0eLsYMBO/6BmBXYOCNSUOdDYv+LGivKoqnE2JkuuSR/4V7Plf1/qo3PL7enOZkiRgU/dX7QkdZ9KWKht//nMFZNWDEBafFlGSVTI6lQsUa1/IacZEvd8XRewBGdYXm0+46n/bn2jlO1iEi4mqCmd39KZrlFWItQHGtjCmXOicFp5DHZgXZd+Hvf1RFQSb2+3SN3O1MRZxTRJx0/pscCTsxOzOtcerjgjWxT3Vkby6hMTtM0UktEW89PvMTkc+xZ1WRqmT2f44YAH8dPpoICYQKUXdTr32HNzxtyZ9uKEg45YodnILrlPl5O4BigNST6hzraV7Ys4+1JBnjQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(22082099003)(11063799006)(4143699003)(18002099003)(56012099006)(3023799007)(6133799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QW1xU2FIZm9lVTNLTDFWRXQ0STY1QVFzSTROczd3NmVheUFUK2hsT21QYzE3?=
 =?utf-8?B?MmozWUc4RE1VYzdIcE8yeG5xSVh2UytIbUpNRzVaektxNzZHR3BQUi90eU1m?=
 =?utf-8?B?Wkx6b1JBUThZUW9yYWhoWFZiZnl5bFRZNWd0VndsWHJzdHFpREVjT1NIN01v?=
 =?utf-8?B?aGxiU3FLWmk3eXYwTE9tbmRWbzdqeUdxTWdmMzQrd05nVzZvTEZhaVpOeWN1?=
 =?utf-8?B?UG9QRm9NbTdQdWVRRDZDSlF2b1pTeHV5UjVTbDBsSEk1WEJuRVVpbmNQVDY0?=
 =?utf-8?B?SVNCVzJGbzQxMGdxVU92aEZmMEtiVW5KTGZHTEVQVDA5N1c2c0QwMGVUY09Q?=
 =?utf-8?B?UkNPckV6NWlEZkQ4Ujk2ZllPR3lpYXloQklVYkNkQUhqVWpwbHFFMU52NWdD?=
 =?utf-8?B?Q08wTmRrcEJnUHhVNERYQkhIN2JiUzdUNU1WYlNHK0lvWmdWdklJRCtSQTlS?=
 =?utf-8?B?YkpPQ2tzRnBDTUE2MmNwMVF5UUFrMVpvbWhFam1sVWJZaDZIY2QydlA0ckZO?=
 =?utf-8?B?eHEzSXhaT0Q2VCtobnJIMFZwQzJoeDZHMUd3WXg4QTdIZjZrQ3FNMEROSHB6?=
 =?utf-8?B?M3NjL2hpSEF0c3hMRGVVYjlsTFU2V1pZenpjYjFJTG5mNlRZSklJVm9VQXZY?=
 =?utf-8?B?RklCcmR0UHd6M2hzL3o1RkQzVnZ1cTROS0ZhWmZPMUhjekpkTDBEeWhLWFVi?=
 =?utf-8?B?azlFaGU2OVR3QXVnRXVWb083VU85eFIvNXhWL2l2Vk83YytDSG9vNTR3SG45?=
 =?utf-8?B?dUpqbzJ0VlhwTEl4dmxNeXRkWkZIVVRLUzh2Vm5zdjlNbDlnbXkzSnl2UUxa?=
 =?utf-8?B?c1lzTG9hYUdEekhiSU5mZWtuS05abGZkZzIyR0FvVFNhWXB5bWFKS0o1dkd6?=
 =?utf-8?B?dmRNcy96bmF1RDVtdlRPSmNkOFh0MjJ2Y2lFNmdLYTlwWjVML29BS3h6aVlO?=
 =?utf-8?B?aXRCblZ6Nnc4T3hTMTFtRlJpL2N1TUJIMkFoZWh4ZDgwNXBFZElJcThISFlS?=
 =?utf-8?B?eUVveThxUTJObmZtRmhTc3lwK2xtbDRlYzBOa01OYmtVaGUvZW5hME8rTE5O?=
 =?utf-8?B?d2plMVFqeFNmNGVVYUxhR3d3NWVuMGwyaGYzSXZEWUhoN1FkU1ZjNHkzZ3Rj?=
 =?utf-8?B?bmtaQjZqK1A3dUlnK25ZUC80MWJ1QVBZWW9VSW4vcVFUdTV6M0R1VWpDamJh?=
 =?utf-8?B?OGRKK1hZb0k4WFc4Z0tmVlZiZDR0NkRGSGVpNEVGSU9tSDFUSWo2dEF2TXg1?=
 =?utf-8?B?NTZhY0RIZmpPeWV1QkRJalVpQW40S2dxR2FEZzV4MGM0OCsxMFBvcXNvWDB1?=
 =?utf-8?B?WjByVE4vMndWdEU0Q203SkRQQWN1Y3U4aDM4Zm1pc3owRUR3eTJnSGlCcDJi?=
 =?utf-8?B?NzQ2c1hLVUFkS1V3WklBRE1OWCtCK2c2QzFQcmdTTHNhOXZaTC9XY2NDR2tD?=
 =?utf-8?B?SmduZGR2TnpoV0F3a2I1a3N3akl1OGJPZ2RLUzJzaWRFWE5FdmY5YkVmWEp2?=
 =?utf-8?B?M0FVZktVVWhjODR6MTNpMDA3dm1lTXdOYUs2NjFvakZ2SERxMFdTbjhXV2E5?=
 =?utf-8?B?MDZMSlg5UW1RSUFsNEpyTS9IVWd6T1drWXkyWG9TNUhCTjUyQkJhdlNlMHNu?=
 =?utf-8?B?eHNsMEdTWGk3VEVKLzZkQUJ3Y0JjakxGOExNQW1keUdUeUlVVlcvcjAxMUFO?=
 =?utf-8?B?RWh2dk83UUNwbDhLV0RPQVhHeDdzMnlvTm9RNkt6QVMwa3Mzd2NmMHQxUmZq?=
 =?utf-8?B?dnN2dzB6blZaREZNUFFBMWFyVVoveDU3c2Y0ekF5MWVnZHBTUUFPVlZMWXAv?=
 =?utf-8?B?VXlDdGdEdldwTFBON0RuNWZOclBmTTVPV25IU1pyTUkrSXV0bnMwQ25HZVBL?=
 =?utf-8?B?RDE1cE1hdDd1cStRanA0ay9vak5CeG1Ed0ZobDJFZlBsS2gvdCt4MlVvalFq?=
 =?utf-8?B?M2Z4dmo5a1RvRExpRHd0bExUYlQ3dVlETmdIWjkzTUxoT3JMWnNjLytrODVM?=
 =?utf-8?B?Z0FDT1RsbHlMSWlZNlBmZ204bUxCOG01bi91MUhGOHhLcmxHQXZ4dDJPYldD?=
 =?utf-8?B?Y2YzNksxTTUwemVRWGNNWDkxOG55V0cyMy9tZjlwK0phZ2I2d29pVFNkdk1F?=
 =?utf-8?B?SGR4L2hPQUJNNDB1clpUQkpuaU5iU3JueEpPa1pLY2Myc0NKTUFBTmpnSm9R?=
 =?utf-8?B?SUpXYTNQRmZ1YUZ1MElxRTZ6dTd4RklzTzZxbWpKOEFmV1hhTWo1bTZlR1kv?=
 =?utf-8?B?WHBmbjdsUS91NGhHTGJNS05WcFVzS0NHZW5MNHF5TWtPZlFTVWdPYTgyVWhk?=
 =?utf-8?B?cmF1ZkpwZExETkhQYnpncmswZTZ6LzkzbjYvS2h5SHBGSnY1WWVJUT09?=
X-Exchange-RoutingPolicyChecked: KjXD36pp3Iz5y1yF6L4u2IsVQOuEbhk/XLpCee0+8mxpf76cy8WrsAlZBkszePGb/mecg+UyB8Mujj13J+aTtzrpsziWzZtF49+sdjzrNGHxOpAzFvH7E+HNBlBx1ylo+k+IczNXDCTZ/dgMe7ZEHoUXP52bVhIgoSPPAWq1D3v/eubdVF90H8J9g4Csq0EOdqmDaqTBZE3gl9w8oWJFkJVrNpY90yffCj2djbRnZhBoJ2LACAAT7jeXc3sPOQSZjWlr3erTW3xzdF4moXAMzIVzr6nGk3U25eQM8HaDWvOLyF+DRl0bgmbZgTveOalXX3G0yeY7EkqjQ4ZAezZDIw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4112c3d4-09aa-4129-4a98-08dedcc72e8d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 08:01:57.4926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OT8uw6VuZ3SS72dRcGy6chL569EDMP19OzaqnlzKC1jCtg2Ob0MNHxZnlmBOObjJQUQvYhaAXR+D0lfTmwH+8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8388
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


On 08-07-2026 13:27, Purkait, Soham wrote:
> Hi Riana,
>
> On 08-07-2026 13:10, Tauro, Riana wrote:
>>
>> On 08-07-2026 11:42, Soham Purkait wrote:
>>> Add a sysfs interface that reports the current GPU health state and
>>> lets admin users and management tools update it but is readable by all
>>> users. Requests are routed through the sysctrl mailbox. The interface
>>> is present only on platforms that support the GPU health indicator.
>>>
>>> The interface is a single read/write file at the device level:
>>>
>>>    $ cat /sys/.../device/gpu_health
>>>    ok
>>>
>>>    $ echo critical > /sys/.../device/gpu_health
>>>
>>>    $ cat /sys/.../device/gpu_health
>>>    critical
>>>
>>> v1:
>>>   - Add enum for health status. (Andi, Rodrigo)
>>>   - Return error number instead of error message in _show/_store. 
>>> (Andi)
>>>   - Move GPU health sysfs init error logging to xe_ras_init. (Andi)
>>>   - Return only the current health state for sysfs read. (Andi, 
>>> Rodrigo)
>>>   - Add documentation for sysfs interface. (Andi, Rodrigo)
>>>
>>> v2:
>>>   - Make logs and structures consistent with their counterparts. 
>>> (Riana)
>>>   - Drop unnecessary variables. (Andi, Riana)
>>>   - Add correct KernelVersion. (Raag)
>>>
>>> v3:
>>>   - Add missing blank line before #endif. (Badal)
>>>
>>> v4:
>>>   - Add consistent "gpu" nomenclature to the gpu health indicator
>>>     DOC blocks. (Riana)
>>>   - Add Kdoc for gpu health indicator. (Anshuman)
>>>
>>> v5:
>>>   - Rename struct fields to response.health, request.health. (Riana, 
>>> Raag)
>>>   - Use devm_device_add_group instead of custom sysfs init/fini. (Raag)
>>>   - Rename health enum to shorter XE_RAS_HEALTH_*, drop redundant
>>>     invalid-input log, and minor log/format cleanups. (Raag)
>>>
>>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>>> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>>> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
>>> ---
>>>   .../ABI/testing/sysfs-driver-intel-xe-ras     |  30 ++++
>>>   Documentation/gpu/xe/xe_device.rst            |   9 ++
>>>   drivers/gpu/drm/xe/xe_ras.c                   | 139 
>>> ++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_ras_types.h             |  57 +++++++
>>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   4 +
>>>   5 files changed, 239 insertions(+)
>>>   create mode 100644 
>>> Documentation/ABI/testing/sysfs-driver-intel-xe-ras
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-ras 
>>> b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
>>> new file mode 100644
>>> index 000000000000..9612b97b0f88
>>> --- /dev/null
>>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
>>> @@ -0,0 +1,30 @@
>>> +What:        /sys/bus/pci/drivers/xe/.../gpu_health
>>> +Date:        April 2026
>>> +KernelVersion:    7.2
>>> +Contact:    intel-xe@lists.freedesktop.org
>>> +Description:
>>> +        This file exposes the current gpu health state and allows 
>>> the gpu
>>> +        health state to be updated.
>>> +
>>> +        This sysfs file is present only on Intel Xe platforms that 
>>> support
>>> +        the gpu health indicator interface for RAS. Reading the 
>>> current
>>> +        health state is available to all users, while updating the 
>>> health
>>> +        state is restricted to administrative users only.
>>> +
>>> +        Read returns a single line containing one of the valid 
>>> values for
>>> +        the current gpu health state. Writing one of the valid values
>>> +        updates the current gpu health state.
>>> +
>>> +        The valid values for the gpu health state are:
>>> +
>>> +            ok
>>> +                The gpu is healthy and operating within normal
>>> +                parameters.
>>> +
>>> +            warning
>>> +                The gpu is experiencing minor issues but remains
>>> +                operational.
>>> +
>>> +            critical
>>> +                The gpu is in a critical state and may not be
>>> +                operational.
>>> diff --git a/Documentation/gpu/xe/xe_device.rst 
>>> b/Documentation/gpu/xe/xe_device.rst
>>> index 39a937b97cd3..6fdba960c2d9 100644
>>> --- a/Documentation/gpu/xe/xe_device.rst
>>> +++ b/Documentation/gpu/xe/xe_device.rst
>>> @@ -8,3 +8,12 @@ Xe Device Wedging
>>>     .. kernel-doc:: drivers/gpu/drm/xe/xe_device.c
>>>      :doc: Xe Device Wedging
>>> +
>>> +.. _xe-gpu-health-indicator:
>>
>> Where is this used?
>>
>>> +
>>> +====================
>>> +GPU Health Indicator
>>> +====================
>>> +
>>> +.. kernel-doc:: drivers/gpu/drm/xe/xe_ras.c
>>> +   :doc: GPU Health Indicator
>>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>>> index 74d5016d9ffe..d1214a213d6e 100644
>>> --- a/drivers/gpu/drm/xe/xe_ras.c
>>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>>> @@ -65,6 +65,13 @@ static const char *const xe_ras_components[] = {
>>>   };
>>>   static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
>>>   +static const char * const gpu_health_states[] = {
>>
>> status or states. Use any one consistently.
>>
>>> +    [XE_RAS_HEALTH_OK]        = "ok",
>>> +    [XE_RAS_HEALTH_WARNING]        = "warning",
>>> +    [XE_RAS_HEALTH_CRITICAL]    = "critical",
>>> +};
>>> +static_assert(ARRAY_SIZE(gpu_health_states) == XE_RAS_HEALTH_MAX);
>>> +
>>>   static u8 drm_to_xe_ras_severity(u8 severity)
>>>   {
>>>       switch (severity) {
>>> @@ -332,6 +339,132 @@ int xe_ras_clear_counter(struct xe_device *xe, 
>>> u8 severity, u8 component)
>>>       return 0;
>>>   }
>>>   +static ssize_t gpu_health_show(struct device *dev, struct 
>>> device_attribute *attr, char *buf)
>>> +{
>>> +    struct xe_ras_get_health_response response = {0};
>>> +    struct xe_sysctrl_mailbox_command command = {0};
>>> +    struct xe_ras_get_health_request request = {0};
>>> +    struct xe_device *xe = kdev_to_xe_device(dev);
>>> +    const char *health;
>>> +    size_t rlen;
>>> +    int ret;
>>> +
>>> +    xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, 
>>> XE_SYSCTRL_CMD_GET_HEALTH,
>>> +                  &request, sizeof(request), &response, 
>>> sizeof(response));
>>> +    guard(xe_pm_runtime)(xe);
>>> +    ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>>> +    if (ret) {
>>> +        xe_err(xe, "sysctrl: failed to get health %d\n", ret);
>>> +        return ret;
>>> +    }
>>> +
>>> +    if (rlen != sizeof(response)) {
>>> +        xe_err(xe, "sysctrl: unexpected get health response length 
>>> %zu (expected %zu)\n",
>>> +               rlen, sizeof(response));
>>> +        return -EIO;
>>> +    }
>>> +    if (response.health >= XE_RAS_HEALTH_MAX) {
>>> +        xe_err(xe, "sysctrl: invalid health state %u\n",
>>> +               response.health);
>>> +        return -EIO;
>>> +    }
>>> +
>>> +    health = gpu_health_states[response.health];
>>> +
>>> +    xe_dbg(xe, "[RAS]: get health: %s\n", health);
>>> +
>>> +    return sysfs_emit(buf, "%s\n", health);
>>> +}
>>> +
>>> +static ssize_t gpu_health_store(struct device *dev, struct 
>>> device_attribute *attr,
>>> +                const char *buf, size_t count)
>>> +{
>>> +    struct xe_ras_set_health_response response = {0};
>>> +    struct xe_sysctrl_mailbox_command command = {0};
>>> +    struct xe_ras_set_health_request request = {0};
>>> +    struct xe_device *xe = kdev_to_xe_device(dev);
>>> +    const char *health;
>>> +    size_t rlen;
>>> +    int state;
>>> +    int ret;
>>> +
>>> +    state = sysfs_match_string(gpu_health_states, buf);
>>> +    if (state < 0)
>>> +        return -EINVAL;
>>> +
>>> +    request.health = state;
>>> +
>>> +    xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, 
>>> XE_SYSCTRL_CMD_SET_HEALTH,
>>> +                  &request, sizeof(request), &response, 
>>> sizeof(response));
>>> +    guard(xe_pm_runtime)(xe);
>>> +    ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>>> +    if (ret) {
>>> +        xe_err(xe, "sysctrl: failed to set health %d\n", ret);
>>> +        return ret;
>>> +    }
>>> +
>>> +    if (rlen != sizeof(response)) {
>>> +        xe_err(xe, "sysctrl: unexpected set health response length 
>>> %zu (expected %zu)\n",
>>> +               rlen, sizeof(response));
>>> +        return -EIO;
>>> +    }
>>> +
>>> +    ret = ras_status_to_errno(response.status);
>>> +    if (ret) {
>>> +        xe_err(xe, "sysctrl: set health command failed with status 
>>> %#x\n",
>>> +               response.status);
>>> +        return ret;
>>> +    }
>>> +
>>> +    if (response.health >= XE_RAS_HEALTH_MAX) {
>>> +        xe_err(xe, "sysctrl: invalid health state %u\n",
>>> +               response.health);
>>> +        return -EIO;
>>> +    }
>>> +
>>> +    health = gpu_health_states[response.health];
>>> +
>>> +    xe_dbg(xe, "[RAS]: set health: %s\n", health);
>>> +
>>> +    return count;
>>> +}
>>> +
>>> +static DEVICE_ATTR_RW(gpu_health);
>>> +
>>> +static struct attribute *gpu_health_attrs[] = {
>>> +    &dev_attr_gpu_health.attr,
>>> +    NULL,
>>> +};
>>> +
>>> +/**
>>> + * DOC: GPU Health Indicator
>>> + *
>>> + * On Intel Xe platforms that support the GPU health indicator 
>>> interface,
>>> + * the driver exposes a sysfs attribute at the device level as:
>>> + *
>> code block would be appropriate
>>
>>> + * ``/sys/bus/pci/drivers/xe/<BDF>/gpu_health``
>>> + *
>>> + * Reading the attribute returns a single line containing the 
>>> current GPU
>>> + * health state. Writing one of the valid values updates the same. 
>>> Reads
>>> + * are available to all users; writes are restricted to administrative
>>> + * users only (attribute permissions ``0644``).
>>
>> Can these be set by firmware too? Worth mentioning incase an admin 
>> had never set
> Does this  falls under the scope of this doc ? 


I am asking.  Do you know if firmware is allowed to set it too? Or is it 
only admin.
If as a admin i am reading this document i see that only i am allowed to 
set.

>> the value and sees a warning.
>>
>> Do we need to mention when user needs to use this?
>>
>>
>>> + *
>>> + * The valid values for the GPU health state are:
>>> + *
>>> + * - ``ok``:
>>> + *    The GPU is healthy and operating within normal parameters.
>>
>> Have you generated the document?
> yes.

Any reason for having the description and the status in different lines?

Thanks
Riana

>
> Thanks,
> Soham.
>>
>>> + * - ``warning``:
>>> + *    The GPU is experiencing minor issues but remains operational.
>>> + * - ``critical``:
>>> + *    The GPU is in a critical state and may not be operational.
>>> + *
>>> + * See Documentation/ABI/testing/sysfs-driver-intel-xe-ras for the ABI
>>> + * specification.
>>> + */
>>> +static const struct attribute_group gpu_health_group = {
>>> +    .attrs = gpu_health_attrs,
>>> +};
>>> +
>>>   /**
>>>    * xe_ras_init - Initialize Xe RAS
>>>    * @xe: xe device instance
>>> @@ -340,6 +473,8 @@ int xe_ras_clear_counter(struct xe_device *xe, 
>>> u8 severity, u8 component)
>>>    */
>>>   void xe_ras_init(struct xe_device *xe)
>>>   {
>>> +    int ret;
>>> +
>>>       if (!xe->info.has_drm_ras)
>>>           return;
>>>   @@ -350,4 +485,8 @@ void xe_ras_init(struct xe_device *xe)
>>>         if (IS_ENABLED(CONFIG_PCIEAER))
>>>           ras_usp_aer_init(xe);
>>> +
>>> +    ret = devm_device_add_group(xe->drm.dev, &gpu_health_group);
>>> +    if (ret)
>>> +        xe_err(xe, "Failed to initialize GPU health sysfs, 
>>> err=%d\n", ret);
>>>   }
>>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h 
>>> b/drivers/gpu/drm/xe/xe_ras_types.h
>>> index 6688e11f57a8..4c4fbc42c956 100644
>>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>>> @@ -10,6 +10,21 @@
>>>     #define XE_RAS_NUM_COUNTERS            16
>>>   +/**
>>> + * enum xe_ras_health_status - gpu health status values
>>> + *
>>> + * @XE_RAS_HEALTH_OK: gpu is healthy and operating normally.
>>> + * @XE_RAS_HEALTH_WARNING: gpu has minor issues but is still 
>>> operational.
>>> + * @XE_RAS_HEALTH_CRITICAL: gpu is in a critical state and may not 
>>> be operational.
>>> + * @XE_RAS_HEALTH_MAX: Sentinel value for validation
>>> + */
>>> +enum xe_ras_health_status {
>>
>> If you removed status from enum, remove from name as well.
>>
>>> +    XE_RAS_HEALTH_OK = 0,
>>> +    XE_RAS_HEALTH_WARNING,
>>> +    XE_RAS_HEALTH_CRITICAL,
>>> +    XE_RAS_HEALTH_MAX
>>> +};
>>> +
>>>   /**
>>>    * struct xe_ras_error_common - Error fields that are common 
>>> across all products
>>>    */
>>> @@ -121,4 +136,46 @@ struct xe_ras_clear_counter_response {
>>>       /** @reserved1: Reserved for future use */
>>>       u32 reserved1[3];
>>>   } __packed;
>>> +
>>> +/**
>>> + * struct xe_ras_get_health_request - Request structure for 
>>> obtaining gpu health
>>> + */
>>> +struct xe_ras_get_health_request {
>>> +    /** @reserved: Reserved for future use. */
>>> +    u32 reserved[2];
>>> +} __packed;
>>> +
>>> +/**
>>> + * struct xe_ras_get_health_response - Response structure for 
>>> obtaining gpu health
>>> + */
>>> +struct xe_ras_get_health_response {
>>> +    /** @health: Current gpu health, see &enum xe_ras_health_status */
>>> +    u8 health;
>>> +    /** @reserved: Reserved for future use */
>>> +    u8 reserved[3];
>>> +} __packed;
>>> +
>>> +/**
>>> + * struct xe_ras_set_health_request - Request structure for setting 
>>> gpu health
>>> + */
>>> +struct xe_ras_set_health_request {
>>> +    /** @health: New gpu health to set, see &enum 
>>> xe_ras_health_status */
>>
>>
>> Let's use short description . "gpu health to be set" or just gpu health
>>
>>> +    u8 health;
>>> +    /** @reserved: Reserved for future use */
>>> +    u8 reserved[3];
>>> +} __packed;
>>> +
>>> +/**
>>> + * struct xe_ras_set_health_response - Response structure for 
>>> setting gpu health
>>> + */
>>> +struct xe_ras_set_health_response {
>>> +    /** @status: Status of set health operation, see &enum 
>>> xe_ras_response_status */
>>> +    u32 status;
>>> +    /** @health: Resulting current gpu health, see &enum 
>>> xe_ras_health_status */
>> Let's use short description . "current gpu health" or just gpu health
>>> +    u8 health;
>>> +    /** @reserved: Reserved for future use */
>>> +    u8 reserved[3];
>>> +    /** @reserved1: Reserved for future use */
>>> +    u32 reserved1[2];
>>> +} __packed;
>>>   #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h 
>>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>> index 6e3753554510..d4da6e9ef774 100644
>>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>> @@ -25,11 +25,15 @@ enum xe_sysctrl_group {
>>>    * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
>>>    * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
>>>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>>> + * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve current health status
>>
>> gpu health
>>
>> Thanks
>> Riana
>>
>>> + * @XE_SYSCTRL_CMD_SET_HEALTH: Set new health status
>>>    */
>>>   enum xe_sysctrl_gfsp_cmd {
>>>       XE_SYSCTRL_CMD_GET_COUNTER        = 0x03,
>>>       XE_SYSCTRL_CMD_CLEAR_COUNTER        = 0x04,
>>>       XE_SYSCTRL_CMD_GET_PENDING_EVENT    = 0x07,
>>> +    XE_SYSCTRL_CMD_GET_HEALTH        = 0x0B,
>>> +    XE_SYSCTRL_CMD_SET_HEALTH        = 0x0C,
>>>   };
>>>     /**
