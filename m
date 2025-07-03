Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 628B4C77B7C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 05:18:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1414810E004;
	Thu,  3 Jul 2025 05:18:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jMubzv45";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93EF610E004
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Jul 2025 05:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751519898; x=1783055898;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UkyEDnsADbajUpxtbpG8hzsDTsCUpRBC2Ir92ec/7WU=;
 b=jMubzv45la51xUfWULKoXPYSw4nBhYGVDmPWacmflS1W9gpLarlptn2O
 zLjUNBV46t5smYZQ2IZ1+NQsx/QTCsyMm+YUkIVIZqqDhoXTqbuUCXVJM
 mx+OueJiHdqARg75ovkEMd368yL6XN4K6vcd0ZWFUAAFLsnOLZHDM7e7q
 1OfLERRSCZn/achQNeeykl3Ctx9GQBttSH24XhdHFSBY11QR3OEpzxDOI
 Y+jtRyh4KmOGS3BmH/6Sili77ehBYnKh/62pkeMEb/6SlxhHC41Ivlsfe
 iZc+pvUEC1ousS1J6sakCueHp/Z7vt+avi+kkKuR74mzr7wKQNAbe8dBz A==;
X-CSE-ConnectionGUID: YWizVN64Q3eO0gy5DxlC8g==
X-CSE-MsgGUID: +AT+qNnhRBSWlYOJYO2awA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53800282"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="53800282"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 22:18:17 -0700
X-CSE-ConnectionGUID: H2BMAv/CT7y/3pCjlOI9lg==
X-CSE-MsgGUID: jstCuecKRaOFGOjoU6OvIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="155012629"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 22:18:17 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 22:18:16 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 22:18:16 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.42)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 22:18:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TPGpWD0oXXqLR6bFEds61qY1nnpSexnncLlKWtFhOFlbyfEVeKn13p0JU9gj+KuQuJN5k5PwMCjhj44p6zvolVoXHzG9ckUcnRZUvBGcWANYF2aFeRO1eH7ZrI/UF8rlZ/uHQLKvVV7h8hnk9mKwT/v0Ewys4Uwm1a+1HL273z554sxftKLUpLW7KObC2Uo39BxiULDtBGuNQ9BO4/EVFBQrWHhegcJozKETngZVfdi1R9P8EKlzmNrUfnXgHlbtA79R1FIm84c1tnsZZRHlijriqI5GPvUPiqd0TssFSTgXgcqbyFnlA/ECp2xKiTGS0+kG9Bj11pMwFQ4ulDeF+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wqvErTeSOt2sffntTp7giCLOjOsoK2fqGkk7RxV8NiU=;
 b=nzfETFfs3t/h2mLYId07geiHDRzFo84FH3f0upZkhHt3BSuIlfQfONx2J069kgf0nAs+mLinCb0SicLdMbJdhu65R249UZOBE3vBlG+fbQOLL2o6nao/hpHoGwnygpfvIoQhwWzzhd2NA/A52BH4IUlsqq8QiZPLOuBfVGi/4ETW4hs+MWKyaGm8rRxwHwxbDS4kS899VnvsiSeaLlOB9EQTdB03ztpkuXvu2E0He0pxVoWhGmvnHuz9KSjINX3CRLhZO1ltm54/E1zLERa2S9IdCmHlNLw+H5Uy3egEoEmSqNSjxhP1qGzLZ7EpXmtp14q4MsaYzaHwwlIHh9ZyWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH8PR11MB6777.namprd11.prod.outlook.com (2603:10b6:510:1c8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 05:18:14 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8880.029; Thu, 3 Jul 2025
 05:18:14 +0000
Message-ID: <bfb862d4-145a-46ba-a944-2214db388eca@intel.com>
Date: Thu, 3 Jul 2025 10:48:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] drm/xe: Set GT as wedged before sending wedged
 uevent
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <lucas.demarchi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <frank.scarbrough@intel.com>, <sk.anirban@intel.com>
References: <20250702141118.3564242-1-riana.tauro@intel.com>
 <20250702141118.3564242-3-riana.tauro@intel.com>
 <aGYEh4xOlqnB1AoY@black.fi.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aGYEh4xOlqnB1AoY@black.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH8PR11MB6777:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cef2464-e34d-4e33-7c9b-08ddb9f10293
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YWw3Y0RGb0diWWsvR0RYVERPWUJ0OVFMWUdVMStuWmp2TUsrUHh1YzJzTFZZ?=
 =?utf-8?B?WnlNQ0FSUHpJNGg4TkxuVnRZMndkU0p3QUxtMWlmVkM4dDZrM3g2ZURtd09r?=
 =?utf-8?B?a0FZcSt4Tkd5eTI1elRvTy9iMDdoZ20xek9ESkdROEduUTcwZVIvNkMwcG1p?=
 =?utf-8?B?bGlFa2F0ZW02RkQzSGx5VElJaEN0YmNnNndVOTRXYTZSOFFodUwyUWF3cUor?=
 =?utf-8?B?bTJOSm8xdGtBaVhwQ1BncXNjWGNVeTYrcWJnWldnNEZkUUpFcVF4L2NJTTA2?=
 =?utf-8?B?QnY2bTdjNHZ3aVlBWGFLcXQrQkxzT1hYTzVkMHdMRWhIU053enZKTm1CKzFx?=
 =?utf-8?B?Z2JlaHZtVnNHMFcrOGhNdXJQYVBWMWxMRHZHL0tqUkpTL1VpaTlNdzBOOGE5?=
 =?utf-8?B?d0FKcGVkYzRXaC8rdFBCVkVpdjJEWXh4a2hqcjRBUVc4WW4xQUFkMEhnUWJk?=
 =?utf-8?B?RmdTb1NWUkRUQ2pNRXdUR2JsM2lyK21lRC84bGZxWHlVS1cvSkJQSTJxVWJY?=
 =?utf-8?B?dDFlakhUY29SYTUxODdINER2bWhwVmJWKzVwV29xRERDL2RvWXdRc3ZPOTd1?=
 =?utf-8?B?b0RlRTF0ZFQwcC9sNHhadjNudnlpdlJyZVViS2p0Z09hakx1OWlYb0ppdmRh?=
 =?utf-8?B?ZE14WDRDOEYra1FRZlpQM3E3ZTQyY3VaUFQvL0VmOFUwaFA4ZXREeTk0azE2?=
 =?utf-8?B?WTgwQWhWaWRUYjROc2dtY2NyNDB2TVY5QWdtY1huR1JBb1ZSZkJBcGkycU03?=
 =?utf-8?B?UHNTMlJFNGowb0dCdHJ2UWxwYitDdEhaOGFWcDBGSXA1RHpiL1FlcWhKWkxG?=
 =?utf-8?B?TE9sV1JYZ1BkM1lFT1g4RzJISDgyQ2FsSFF5RnM1M3lwNnMycUlUUjcxTVlq?=
 =?utf-8?B?YXRJQjNMTjR3MHllQVFPVUNHOGkxQVBwclFNUktBQzdLU0Z0eU16d3VkUXdF?=
 =?utf-8?B?dDA5ZFh5Wld0bzRRSTlkWitZRUI4QS8rU3RvUEVDeEhxeGNNeGZmTW1aZUdl?=
 =?utf-8?B?RnNDNzBlLy9QNS9OV0lLdVE3b0o1UkJsNEVsUVl5OWhyOFVmNHE2MWNsdXlx?=
 =?utf-8?B?NHgwY05KMmlpbUVKcDN5UjQvSjRvcTBuVCsyMk55b25WTE0xYVNxa0RrQzJR?=
 =?utf-8?B?Ty9kNm45U2lKVjRoQmJHY01UNWJuK1c4QzVWYzh5ZUc3RkF4THVPc00xWkRn?=
 =?utf-8?B?b3V6N2x5TGhLN1ZkT0UySTg5R0hoZ25YN3J0Rm1ZSndHbHpMSVRvZmVMamt2?=
 =?utf-8?B?cDkwMUkxcUprYUVMVXZnMTVpN3QzY1c5KzFKeG92eGJGdG1RQmQza3lRSjRL?=
 =?utf-8?B?bmRXZDVld0V2b3R6RnYrcmhxa1FIL1Uyd2FLRnZoY0RJUDJBRkNGYStZMkFK?=
 =?utf-8?B?VXR1TW1xSmdmT3FnanFjLzNpRW1uTERTYUhVWVFaemgvaDQ3c2RYS0pDSHRK?=
 =?utf-8?B?WUhpWGR3N2lJZkI2UUs0LzVzUThtNDlpOXA4NFpWM2NaWGVwMk40SjJEei9G?=
 =?utf-8?B?UU5TOTRKZVh1K3dDc3NhdFBKMHNUWXZqakNFd2hlMVB1Z0RLTVFtTlZ4YUM5?=
 =?utf-8?B?TDNDTkhHdjM1MmVHVEkvMVUvb0Q4WnV3OU4yRXF4TXdoU2VsakNTZ3MyYnJm?=
 =?utf-8?B?VDJZeHJ5L3BIUEN4Ky9aOFJmWXErNDR4Vmw5QnhtV2kxbkw2S1ZONU5aMmJL?=
 =?utf-8?B?WTBvNXpUMmZGRXZKaUVWNXdWdGdrdVlhcUVONnFEbHpkQjY2Vlo0ZzM4RENk?=
 =?utf-8?B?NUtsZnc4dENNbXVESmMrTWlXYVN6aFhZZ3R1NTRHRi93bUtqMEhzdkZMRFJY?=
 =?utf-8?B?SVMxSy80SWZGYkdyMGtMaU16MzZudFVpS3NFRmZRZlBVTUVaaThsZXIxQ3k5?=
 =?utf-8?B?aWNnQW4ybnZ1RDl1ZzlrVDU0ZWtCeExVS2F1d3N0SWtQNnJhbjVMTmpyM1Jn?=
 =?utf-8?Q?ydH91+cwNqo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHBweGRtMWpTY2FtdGpPUUtsdGFLOE9VdXJXNmt0b1p4TXg4NHJULzh0c0Yr?=
 =?utf-8?B?VVhjalBNWldxS09ZY3ZMcERRUVhveE5zRXRtdThIM0YyU0U2SEUzK3U2VCs1?=
 =?utf-8?B?UXFxWlB2RUhmSVdYYzJvQ3RYOGdRZk1uSUp3a0NJQ2RLdEtlRisyYXhBOE9R?=
 =?utf-8?B?VHhLRG5sVjE1UmRyb3NkL1o0ejlFcFJQNFA3dTFNc0Z6SmdFbE1uUnY1bjhw?=
 =?utf-8?B?bTY3NXRmUHBWc09ubFU2eU9uMlZSTE96NWRQUzc3Z0FqRHlDUTZLRS9iOG1z?=
 =?utf-8?B?dzcyUnlWU042NG1PZjI3ZlRrNktrMFlpdE1KSml4VjNUZ0NYWWZ0dDREWWJS?=
 =?utf-8?B?cmUxYlpacGdYQVF2S2RFajBsUjI1bFRZTFhKQjdud0N0SUxhMFJwVUNNMDNp?=
 =?utf-8?B?ekRrSzJqT1BNQUlUVXQyU2JHYzBHdDlqTmNwaDIwUnd0cjBxeEdMOHZkTW1R?=
 =?utf-8?B?eE1ITG1NbW9DTC9peUpRd3NrOUE1dURPOHQ1cEFuaG5WMEE4NXp3c0VKdW1u?=
 =?utf-8?B?d09JZmR6WmJoUTNaR3FsSFNaTm92MTR4YnF0a1AvaDhWdWQ0YmQzUkxsTW9h?=
 =?utf-8?B?T1dwYm15R09YZ0xzZG9QU0VJcnBWTHZaVjMrc2lFYm5TbjcwblJMa3RPMnI3?=
 =?utf-8?B?KzVqTXlYZS9yTmVITWxsaTV1enc5OUtiSkJRaWdlVEJwZlZvbXZFeVV0YkE3?=
 =?utf-8?B?UGJhOGR6TTVxUkh0WVRjbmtiQy9pUUwxMFdHVEJsMTZlSDAvUlB3YkY3ajl5?=
 =?utf-8?B?cDYxVUhWUStlZzRtRjUwZEdsQThGcU9ZRDdKSzR4ckdPTU8raURYRzJkS0lX?=
 =?utf-8?B?RVQ5eHlVQWZITUljYlo5bHZZUW5OVDYrZ0cxeGdOZE9BaEZmTzloYXU4NUNv?=
 =?utf-8?B?SGRSWlQ5dTl1VEFpTkZMNTlyRFdTdlRJaGYrQTNUYUhiWUFpZ1gzRlNVRWRC?=
 =?utf-8?B?dUpPbHFSa2xsZFR3aXVSR3RXKzFYK1FzL0J1NE1CeTRoalpsMC9VSnpSUVF3?=
 =?utf-8?B?Sm14Wis0MWpVbG9mOWFEbWVqVUJQM0xHYW82TzVDVzd4MnR1KzQzeVZPaDRk?=
 =?utf-8?B?WTg3U2c4dTVmOUxQMUNqdEMxUGR4K1k5d3dvS1VJMmVIOW52N3NWb2lzTDJR?=
 =?utf-8?B?cHVld0wrelIyQXZkSFpSTjJ0aEtQUG03QmY4WlR5V1RCOEdBT0dOUGZ2bzBo?=
 =?utf-8?B?UVk2QnA4RDB5ZXFRekhtNEdxanpZWG9WcHdtUVJqVloyV1daaTRTaVV1Y0RG?=
 =?utf-8?B?aklYeEx3ODlQdU82dFhCTHRIWGREWlJIcmQ1K1FKTkRpOGExOU43blZOSDlS?=
 =?utf-8?B?WlkvZXAxbWJIUnBnRWZpTzFTR3VRYXZ6UUxDd3cxa0ZxdGlOSVQ2Skk0Vzh0?=
 =?utf-8?B?Nm50Q3gvQ0RqWWJVMVVHUTQzSmNaSmszMXJKK3M3aXZNNGJqYmNqTW1DZGhG?=
 =?utf-8?B?QTZ4c3N1NUdkS05HSkt6ZjkwT0c1d1kwSTFVZmNXb3FEUk1Pa0lDU3VKQStT?=
 =?utf-8?B?UXBsRFV4NFU4Syt1YTZTWXQ5MmRLUW9STGpOMDZiMGZyNUZnRHRjL00wUjRM?=
 =?utf-8?B?VzA1bTJROUgwUE5CZFYxUTJLOVpkSW1CSE9BNlNoZnEvUFhJN2xrMWo5UVA0?=
 =?utf-8?B?bURsQ2tYZEZ4em9wTHZhZExhMGh5WjlnUGdTWFd4S21KNXdQSkI4SG5yVTdo?=
 =?utf-8?B?TnJqK0cvbHNNbDVjZXJyNVE2emwxM0o0TjhZclEreE5kV2ZYWjZOUkU0dERn?=
 =?utf-8?B?aC9HYjgwNk9tWlcvTG1JQ0lkQWNRVlB1WVI5M1NSSi9lOWsvbllMRWN3Y2Q0?=
 =?utf-8?B?Q0g2c0d3UGtVYUJZQjZuazJrclJWaFdyd3RyZ2FjTEJyM1V5V1pzR2pSOG9B?=
 =?utf-8?B?ZlNxN1JtM2NncXRldk1yUXlSZU1LeS83Y2p0TWxyWWc2emMxOUYrcUpMcTJu?=
 =?utf-8?B?MFNXY29aZlZqc1p1YTN6MHRINDMxcFF2cUFMblZCZC9UNm1CSGlwemZTdzJw?=
 =?utf-8?B?K2tKazdha3dQV1BzMVFwOTlhVjkrQ0ZpM2w1QytMaFduODZQOS92dDhuaDc3?=
 =?utf-8?B?blg2bzdWeSt4NTdEWDRsVmNkeU8zcEVjUFNrcGJQNFQweXFQV212WG51MFYz?=
 =?utf-8?Q?vcZGwn94zUqg/5IbH4KZNXi6Y?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cef2464-e34d-4e33-7c9b-08ddb9f10293
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 05:18:14.1908 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ULh2pQ/UE428moOHl+DxqpPeSXKTNv+pa9Mvr/i1dWhYYehm+hLRvznbeJkBFi7s64z5bQmgnuM/Gvnu0qR3Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6777
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

Hi Raag

On 7/3/2025 9:48 AM, Raag Jadav wrote:
> On Wed, Jul 02, 2025 at 07:41:12PM +0530, Riana Tauro wrote:
>> Userspace should be notified after setting the device as wedged.
>> Re-order function calls to set gt wedged before sending uevent.
>>
>> Suggested-by: Raag Jadav <raag.jadav@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device.c | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 0b73cb72bad1..4a38486dccc8 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -1123,8 +1123,10 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
>>    * xe_device_declare_wedged - Declare device wedged
>>    * @xe: xe device instance
>>    *
>> - * This is a final state that can only be cleared with a module
>> + * This is a final state that can only be cleared with the recovery method
>> + * specified in the drm wedged uevent. The default recovery method is
>>    * re-probe (unbind + bind).
>> + *
>>    * In this state every IOCTL will be blocked so the GT cannot be used.
>>    * In general it will be called upon any critical error such as gt reset
>>    * failure or guc loading failure. Userspace will be notified of this state
>> @@ -1151,6 +1153,9 @@ void xe_device_declare_wedged(struct xe_device *xe)
>>   		return;
>>   	}
>>   
>> +	for_each_gt(gt, xe, id)
>> +		xe_gt_declare_wedged(gt);
> 
> This is changing GuC CT state and can race with ioctls, so I think
> the sequence should be
> 

Then isn't the previous flow better. The ioctls are blocked anyway 
before sending uevent.

Thanks
Riana >   	if (!atomic_xchg(&xe->wedged.flag, 1)) {
> 		...
> 	}
> 
> 	for_each_gt(gt, xe, id)
> 		xe_gt_declare_wedged(gt);
> 
> 	if (xe_device_wedged())
> 		drm_dev_wedged_event();
> 
> Raag

