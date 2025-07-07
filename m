Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C42D6C8303C
	for <intel-xe@archiver.kernel.org>; Mon,  7 Jul 2025 16:11:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7463310E4CB;
	Mon,  7 Jul 2025 16:11:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BIYTV5xK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 705EA10E4CB
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Jul 2025 16:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751904708; x=1783440708;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rffUkftQoH753VLv0FPnmq0eMX9i6bnuTnb48Zxu87c=;
 b=BIYTV5xK4iXZ19H4zCOJwELKGO1Lsu96k7eyT/zjGDwPd/Hgl4By80+d
 ZXTaVaFTLZ89gqi4/fy7p0+2kIg114Xf86r4ijz6LJSq62zkhmPR6QIcX
 qmHuxbSH2xvrK2xkNEcp4X1n+MyOTNFgZfy75iMy1LL4TwqvJNYNttPoc
 MZSUb9Mnw8kozXuZIqoKSwzOXXNPcNovo8QPm2Vufjmti/J7e28btAVAy
 Bu27/QlDavaAK4b77N1msdTon7rq6iXTgIT0O56zgVkZSSsGx36YAwuAE
 WW1Bjb+T9NSq2vdjhpe6YlId32CZ/bnnbs5t9KiiXyehYdfgsc13p0BgG A==;
X-CSE-ConnectionGUID: 6xKlcrncSN+3oNFhLrAypA==
X-CSE-MsgGUID: WVul7fc7R/2mxOw9gO32rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="65479927"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="65479927"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 09:11:48 -0700
X-CSE-ConnectionGUID: YtmaOl7BQ5uIcmjlLqWzwA==
X-CSE-MsgGUID: srFWk6MwQTGjH/RE8gvKJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="159588787"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 09:11:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 09:11:47 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 7 Jul 2025 09:11:47 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.88)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 09:11:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bv2zays1V0OK9hOG2i/ah/GnwOQD3pdgVu06zbyXPySIMZwFulKkw143LTQWJ2KMfZ0pfEF10uW/R392pFevqg6SVaXoXnjnc2ajixlKMy6HCmiNEZ/FCqUCuWxGWHMtSzGuyG6U9XkOKyNHwRVc61qJu210nW/B43AreXL+PA9rkJlw6YfFdrjuFXiXcaq/tmsN00EMx2Qm7mcuKtfDVspxPnlMGcqWD6JD7zm7ohlL5WY0AZaFJfZLrRGPXqo+hClRsv32wXlz4I2vrI1PH8zBR9M3IgpP70TxnQIeCM1ALx5bfWu9eCdcCmqhI8j9DoBpXI9S4kO47vU8Ww4zgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8CaWbgnl01jem9rebVewArmm8jzYhoiKJR80Iyj6vc=;
 b=tGvike9dSHQ47dFdDt5IlhbbzTeZ5BaHexKZKn3IXu0N2MyMc+WNnP8kdj42k384iEbB/LB2q5Gf5xcI/Ay75qVn52BSEaJJe6FXhlmvO2KPd+K77dsGUDnNH7oKQx3BxYFdLTm59rwDBAYnqt71UW1CGU80w3fjx2QRkOvfr9cW/OdK3SB2GAySYmp4zhzBaKQMUH22V4sSoADesWHUeLlYcWJ7GyBfqElgVPEqlgj6klxHmLMTZLUJ9zhlB1ndngjgsJXZAzlWhMq+i14nlxtJsHhDp3Ii5tAskst+9uvac3nsUWyHom6porwvgs87LvZG3bQauN/FDYXpDM4DUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CY8PR11MB7947.namprd11.prod.outlook.com (2603:10b6:930:7a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Mon, 7 Jul
 2025 16:11:43 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.8857.025; Mon, 7 Jul 2025
 16:11:43 +0000
Message-ID: <1094c4f1-3273-4832-b282-7489d938eb25@intel.com>
Date: Mon, 7 Jul 2025 09:11:41 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pm: Restore display pm if there is error after
 display suspend
To: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
CC: John Harrison <John.C.Harrison@Intel.com>
References: <20250707015825.3522467-2-shuicheng.lin@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250707015825.3522467-2-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0148.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::33) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CY8PR11MB7947:EE_
X-MS-Office365-Filtering-Correlation-Id: 0102c498-56e0-4834-b1e3-08ddbd70f723
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YzZRRkVBa1VrMTJGYXN5RmVpQVhoNXMrZ2QyMTgzZnZtWjZQZ2lBckZsMU1j?=
 =?utf-8?B?UFBzTnFRWk9uallVeVc4STRWdkFHYUVKSVc5TXNONEdxcGJLTjV5UGtzOFg4?=
 =?utf-8?B?Mi84WHo4SXBkUUQ5Z21hQ1VyUU9idy9LVHNDWWNPMlo2Y2V2cTdSZEVCOFov?=
 =?utf-8?B?U2NnSjBPTmVMaTgzdjNuUjhKUFI3SFAvUVNEZVVKaFhpQWNqWEcraVdzNWYv?=
 =?utf-8?B?R0YwQm5GYllWaU1rR1F1TUtDNEVxcnJqdUdiZURJeWhldUVhSzJqRk12Wndv?=
 =?utf-8?B?NTFyY3Z3dWlXMzlGdkxZVU5HTHUxU1pQb0NVZVpmUmdoazMybWxoVE1XVTIr?=
 =?utf-8?B?TWt3SUk5aTZrV0N4aS9NU0gza2NyN2lBa2trdjlHK1lsYy9WTlRiREJiRkUv?=
 =?utf-8?B?QldERmJYZDVlTmZUK1lrajRjUzBydkRDRzRoOTd6bkJQOTZmbCs2SmM1MWJI?=
 =?utf-8?B?a01NSFp1elF6QUdTL29qRDNSY3JHaXR4STZQTmoxV3dIb2o1ZmhwT1BkNnFr?=
 =?utf-8?B?UHZJY2NiSjkrdndSRUdmcHN2OHJWMDdCN1hSNGx4N0xHSC9XY3pZTWh2R0pp?=
 =?utf-8?B?dHB6azBwOWVtOFdMZy8rZldrSlJqOWVCeTJ3RkdFYkIvL2tWbkVCdk9RUEZR?=
 =?utf-8?B?cWxpcGlJcUZZdSs3a2NoTDdDNlozUXhudE1mSDdRVTd0UnNPY0o3NUxTc0tl?=
 =?utf-8?B?VmRIMlQrL1hWNUg3NTBMN1JpS0FSbUpRcG1oZUU2NVJoL253ZFVhczZYbkxm?=
 =?utf-8?B?NEV5V2JXOEFYNXVWOFg4bTZMa2NjVnBWZ3hGU3dySzhTUzFTNmtHYlAzNVZP?=
 =?utf-8?B?Tk5PUkFZU1EzNzRXL21rN3I1R0VjdU56Vmh3MERCS3o2QUMyWU5nR3V4MmNq?=
 =?utf-8?B?Vm00ZXJpMkJRQlJRL2crQ2pvU1dCM2pWKytQQkIyYnc3R0labEpkYlgvUmx3?=
 =?utf-8?B?Z0lPM2NEWjZPK1dWM1NrbVJicUt4OGlGNjl3VmhyK0FlN1BFM3llWDM0OTN3?=
 =?utf-8?B?Z2VSZDA3MEFmN3FBZllyMWVJb2tmQkZkenlyNXpVSkJKZWwxMDNNZ0FEOUt6?=
 =?utf-8?B?SUlLbzdNVmZ2UWxFN2liRWUrZlFuVnMwbitzVkw1dUhER1QvVzA3d1VKR0Iz?=
 =?utf-8?B?Q0hIdkRwWGZKblFxWkh1SGZmUGZ6U00wWFhMY2EwUE1YLzVPcHZhVzRPcENi?=
 =?utf-8?B?emRyczR6c29YWkNLYUJ4djU3SC8zRGozNVZzdFRWTTFrakl3RFkwb2pTSnJy?=
 =?utf-8?B?TXZZL2pjdTQ1UkpEUGVZUk9LVy9CT0RHYjFUQzNJZEdQVWUwb0dFMHEzSDhH?=
 =?utf-8?B?WlZZeTVNWFFJeitSVXRYbExLck83bE94QWUwekEyR3lGNVBIenRQbEVJQ2lE?=
 =?utf-8?B?U0F1akxpQjBVaVNIenpZeEljT1p2WkZmZGdvRUFpRTR3aVVDMFQ4U2JpTVd2?=
 =?utf-8?B?MGhhUUlyV3pWcEZxYUpIUWJDMEd4d2ozTzVqV2ZwcTVyRTlhMHJESmpOeVpR?=
 =?utf-8?B?VTR0SWNOdWJRbGlxYXdwckgxcjhBenBMMU1KVlZIaHFjNk91NDVKWUNFUEhH?=
 =?utf-8?B?RFNpNlRyVm1NcWxXUkxwKzJZRS9kR0ZpbE1nOFI5dWZvWWRzWm5rWm5FZXRq?=
 =?utf-8?B?ZEV0QmxielFJWjgrWjJDWUJmWHZwbHZLdjZPemhobU40TzBwNjZHMXhKS1I0?=
 =?utf-8?B?Z3QyZVkyeWpvNnk5WU5CT3J5aHZ3UlRINXFsREpiTFVzRXJMblRORzdGZXlX?=
 =?utf-8?B?TGMvZ0U1Zzk3ODdpZnFzbnRIaCtRRldad0RFcU5zK09mZzlwb0JHTThUUjdr?=
 =?utf-8?B?R3JZM2FKNHNXWlZYS2ZhMmZsc3lkZzFEdlB0S2tvdEczU09jQU1laTgvMTdS?=
 =?utf-8?B?VEZUZlVuUmU1cG12RXBEYWJhclhFY0h4OHFnV0Vjc3Q2MWYwWDkveGg4VzE1?=
 =?utf-8?Q?NyK0F7MtjKo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TldUZFJneTlzTTNHSzZRd2x2NkZNbTYzMGhaejAwWG5SUHJtWTNDc2tKTHM2?=
 =?utf-8?B?bVJOY1RRczBsN1ZtdUhYL3ZGN3d1b3lac2tBYWMrN21HRzRxQVVYTkdvUkd5?=
 =?utf-8?B?dTh1Zkswd2JLMDFnRCtOWG0yS1BkQkZwQ2NrUm1EV0FWbnM2dUZMcWF2TDhT?=
 =?utf-8?B?dXpvTkRNdkExc0UyczNFeEhXMXdrMGNMZDdqRFJTSnVXa0tsTm5xcXZKUUZE?=
 =?utf-8?B?eU5OTWFDSStZUTdkOS9PRjFyaW1WWUJmODNxR0F4WUpEMkpnZ2ZyM1lQTWR0?=
 =?utf-8?B?Yi9VMjNGTmlBaWlXUjI4T0k2VE9FR21KdVYvditLOVRNOUcrQVNEQmIrc1Rs?=
 =?utf-8?B?eHlPZnhHa1BHQk5aV0Nacm01VnFTU2pxT1R1eWZabzdzNXpZLzlYcEtYVTNz?=
 =?utf-8?B?OGVkQW1URzdxZlN1Y0NmUmwyMjBjS2dCZHVKVnh2M1g0TTZvbkwwamxucytL?=
 =?utf-8?B?ZGJWSmxuV0FBMGRWUnZ4bTJQeHNsYWlIaVZScjRBeGVaOGt2Umk1empwcmt4?=
 =?utf-8?B?Uk1vdXRDQm5TNzBqODB6VnBJdFhnZnlML1VQWE1nSktkQVdlZ1JORVpwclpk?=
 =?utf-8?B?d3J2TjZPRm9oSHdPWlR2TncvUkJmb0NBRy9tc3NtYjd1MUdvTkgxOTlrOS9q?=
 =?utf-8?B?Y1lqdjl5bzJCOVJjaDRoNWx2YzFJUGU0dXozT2JMVGVLQnZvaWxvb25ETE00?=
 =?utf-8?B?Wnk5VlF0R3JkYUI1Z09tcnNFQ1NyMFhmSWVhMDd5Q1FyRHN0eTl5elQ0VFBl?=
 =?utf-8?B?dWM2bk5DWTN3NC8zazQxRmlERlNycWFKQVBjUEpMMFcvZnAxZE1JVGxJTmVQ?=
 =?utf-8?B?MGhSR0dNZEJFQTRmaENuWmM5UDhscHk5VjFpQkpYeWlJWlQzZy9va213VXVy?=
 =?utf-8?B?Y212MmQwQk1aVmlTNUVjbFBsdGdqSkVlczBFZmdxcHdvYm1iRU0xaVp4cFVN?=
 =?utf-8?B?RDZXZjFtRnZvQXZ6UTF2MXpUdno3bHlDRHFYNUQvYnFVYnF5QWl5ZlM5RUhm?=
 =?utf-8?B?Zlp0K3pYZ1JGWm1qZytMd2tTV0VtOC9uMlV0R3RLZDd3cDZQZHcvUmpLczhQ?=
 =?utf-8?B?R25OK29QYjNVNmJmeDQ4dU1pZ052eDlGU3RkNkFLc1E4cTRDSXhtWlM3bVlU?=
 =?utf-8?B?bHcwVkMvMWtjaW9LeHk1OHNCaFZJbVRwb0IwYXNRL21tSUdDWnNuR25LVUYr?=
 =?utf-8?B?MW9rc1ZFd294SnU1ZHNHUXhTZVM4RkVFbXRheXcrTmdYNTZQcVhvaXB1UnlV?=
 =?utf-8?B?UytTYk01TVNYc0s3ZGhXYW54dFZlenZmaXhMRjllckFxNVd4WWxPSlI4N3Zm?=
 =?utf-8?B?MGxxK3BySmZCMjFXeDh5SDhlV045aGk1eGdVcHlTWWhGRDZvUTFneFc1Qkkr?=
 =?utf-8?B?UmY1MGNBeEk1RVFaL2kyVVhTS0RkLzg1NUh1a0UzeEZkb0hmY0tiQmZYaGpr?=
 =?utf-8?B?OVJJL3M1Z2ZvVStyUm5PcWlZY080TG8xVVM0VHRja3NHSFo2QWdIeUlqSXlJ?=
 =?utf-8?B?UTZzaTNxSUJEY0NWbE1OcVA2TnVNRE1qa3o5Nm5pVUtrbkR5MmFSTURlM3Ux?=
 =?utf-8?B?OEpXcnZTVmczM29GYkJtRUl0Y0FOSmpVTEd4cXArdmJ4Y0I4N21pSGtXMkdp?=
 =?utf-8?B?RXhoYkxZdnNuN0FYTGdUcXMzUldSOHZEa0RCWWtmb2xwSGdsSk1ac24yK3ZR?=
 =?utf-8?B?OWxSSTRXeHIvS1F3eXpJMHppU2c4R1RyQ3p5RVlPWDlpclV6cFBqM0tQbWFW?=
 =?utf-8?B?SkgrTnc2RCtVbWJVV3o3OVhHNTNWM0VURXRZbnVUVWVOVkN1ak1UdWVpVzNR?=
 =?utf-8?B?VkUxTVcyR2hIWSt3RXNjeTZ0UW0zRU1rMVg1T0p4Mm9XeDB6UFQzc3NIeU42?=
 =?utf-8?B?QTBPSEF3Rk1vTkdETklJenN1VC82dUlwTk1XU2JNMnZyVjB0Q3c4YzRDanJ2?=
 =?utf-8?B?YmlhRHBkbzU2Rm43WFRYMW9WNnI3b1ROckt5Njk0Y0hTM2NqR0JKYnd6aytY?=
 =?utf-8?B?TkR3NG1aWFNOK2pkR3RaanlmeTBzMUg0aU5ydzBDY0swaWFqYkZJUWZEZzZD?=
 =?utf-8?B?eUpVNEJhcUFlWHpVYlRpT0ZwbG55RGxOeCtHbEp6RGNOb29yRlVFaHZNOXhM?=
 =?utf-8?B?dDJtZGpXd3hGUTdSMWY5R1MrNWlxRVRac1llOTRBVm9TblRQWHZGRnh0dGVO?=
 =?utf-8?B?dHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0102c498-56e0-4834-b1e3-08ddbd70f723
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 16:11:43.7990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vmnFB5PDBq2uhw/ECXBG/u1/EZ7hqwDHBGRo5h3GPz9zsa/THFl94eopzbWJAHk/WN2G3K7ToVWJ/mR8Eci3F/5IlS96OkM67N/p/64gdEM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7947
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



On 7/6/2025 6:58 PM, Shuicheng Lin wrote:
> xe_bo_evict_all() is called after xe_display_pm_suspend(). So if there
> is error with xe_bo_evict_all(), display pm should be restored.
>
> Fixes: 51462211f4a9 ("drm/xe/pxp: add PXP PM support")
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

If you look at 51462211f4a9, you'll see that before the PXP changes were 
added xe_display_pm_resume was only called from the error path of 
xe_gt_suspend (even though xe_bo_evict_all was already there), so I've 
kept that behavior when I added the PXP changes.
That pre-PXP behavior is still present in the 6.12 LTS kernel, so if 
that's wrong it needs to be fixed there as well.

Looking at the history, it looks like the patch that moved the call to 
xe_display_pm_resume to before the evict_all without adjusting the error 
management was this one:
cb8f81c17531 ("drm/xe/display: Make display suspend/resume work on 
discrete")

Given how different the code is, I don't know if it is better to send a 
separate patch for that to the stable tree, or to update the fixes tag 
on this one and send the separate patch when it fails to apply.

If you want to go with the former, this is:
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

But please also get an ack from someone on the display side to make sure 
this was not intentional.

Daniele

> ---
>   drivers/gpu/drm/xe/xe_pm.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index ff749edc005b..bcfda545e74f 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -134,7 +134,7 @@ int xe_pm_suspend(struct xe_device *xe)
>   	/* FIXME: Super racey... */
>   	err = xe_bo_evict_all(xe);
>   	if (err)
> -		goto err_pxp;
> +		goto err_display;
>   
>   	for_each_gt(gt, xe, id) {
>   		err = xe_gt_suspend(gt);
> @@ -151,7 +151,6 @@ int xe_pm_suspend(struct xe_device *xe)
>   
>   err_display:
>   	xe_display_pm_resume(xe);
> -err_pxp:
>   	xe_pxp_pm_resume(xe->pxp);
>   err:
>   	drm_dbg(&xe->drm, "Device suspend failed %d\n", err);

