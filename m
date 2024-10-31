Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D10D767CF
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 14:15:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A2B010E8A7;
	Thu, 31 Oct 2024 14:15:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ed5pmEfq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4313710E8A7
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Oct 2024 14:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730384142; x=1761920142;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=bwWTe7DPKhIAOxUvdXmcXd5SGA+tCs9vkCD7VO0ziYQ=;
 b=Ed5pmEfqKiUk8s405Q3VRtvIpfyaQqiAD71r7sdo0zvKoernnr/JzPKK
 tZeXDtlnJlMqg/0SunmGK4RBM5fNNy5sT5KxmUqmRGsqPogCtrWpsLlq2
 l43SNwxSEvD9XEPf1hcS++QkF63uzH5F6YHrPnG2qiTyEJjAhfmZso0VI
 w/11Gv4G/3IyVTL5ihkRpYe5hJqTM6/nZ00n8jPHR2tBz7yuA8OvDXsVI
 EXBQL5AxHcs4AflHDIEidkQyUjcI98PneDsAz60DTXIfAD/OzRfxMmZLu
 EMJHFet+0v+qyXJvaMjN3ZPLokEoP9598JvSeWiwWkTNckoZeLri81cLV w==;
X-CSE-ConnectionGUID: nMff3AyaRESGfbLHKqj3dg==
X-CSE-MsgGUID: AzKmnaYmRAe/lGc/6atBCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="47595259"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="47595259"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 07:15:41 -0700
X-CSE-ConnectionGUID: +qutNYAPR3auWH7Q8lUECA==
X-CSE-MsgGUID: dNzVHEtaSiGh8+ZAc5lc+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="120096700"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Oct 2024 07:15:40 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 31 Oct 2024 07:15:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 31 Oct 2024 07:15:39 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 31 Oct 2024 07:15:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XCYAasTRKz9+9cx9b7pBMTeS/qseuVz8wAf5BMkYQuSWYxoUwPzUC8TxcVH5QFWQwxYUiSj/7AA/Z1t3k34xtVpltQCx64ZaKHm5Ew2vTllnfMbnM2+SpixgU/FEA6mKo2CYRnumGPfHo2btnJZ5yQJvTc4ByjMMtWDRIAg5OPPhqlHrsj5z0sJw41Ot1qcJyaWuR6p0vz1o6ziE0ZrRfF1LKe1vUkt1CqDl7asRiCPUsSY9uWw35mZfF2Yy0Z6nu13Ip/HR82+RE90HO8bPhRvv/kioswuIPYgrE8p0xVpuzxxb592tPbf78tKh07194XNC6aadhb7j1CWF4KDhjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eom++jX7prE1oMjn0n+FS87SGxJMcfAxzrNfkg4+n28=;
 b=lZbhE2JfDBBMS0dtKIVVdm4YM5llAiOCtfP7i1OHzIHdmvyAN1h2YbpJwKBjGKJ/Wu4wq/BdFUOi5gDfKefaKMeBWtd7/bPylUBwHJJO87rDIVZObutopEYq4WU0q6I0h79Ly5dSAXENiS0QtLz6kNV9Y+8mzKCWuMIIKG/Fv8KxH1jIdaLkMIzT6+4kGL6QerGEmZj+XrzYQKDdnMGXq8NY7F4i1U40R4iFwrGpn+FGnKu0LA3ZgRvH0zUjwaltvFnfWSmUTgF75KcLUsyv7hghRPGYWMN9MPaZOnTsoCZNzofJ6Zr1mWSMGxJMkbdWqFBmNH+13k6XmO5M9FBXvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by MW5PR11MB5812.namprd11.prod.outlook.com (2603:10b6:303:193::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Thu, 31 Oct
 2024 14:15:34 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%6]) with mapi id 15.20.8114.020; Thu, 31 Oct 2024
 14:15:34 +0000
Message-ID: <6fc6d10c-3b3e-4fff-986e-e7bb703fd5fd@intel.com>
Date: Thu, 31 Oct 2024 10:15:31 -0400
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/guc=3A_Fi?=
 =?UTF-8?Q?x_dereference_before_NULL_check_=28rev6=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20241023233356.5479-1-everestkc@everestkc.com.np>
 <173033374980.1364410.16519419016201730085@2413ebb6fbb6>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <173033374980.1364410.16519419016201730085@2413ebb6fbb6>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0025.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::12) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|MW5PR11MB5812:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f950e43-3319-4200-3db7-08dcf9b67c48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MDBwcVpzRU9ZNzBoZk5oVWI5MThJeXlsemR3L3NKTE4rTjNtOFlhUzB2S2xW?=
 =?utf-8?B?RzVOa3JRSkFTS1J4V2FEcnc2RGl3VWFkRjdENWIza0E2Q2EybEcyanFOSWph?=
 =?utf-8?B?WXJwWmNPUm5ITk5QSW91R1JkcnY0U2xEQk0wQW5oYzJieEE0L1ZYT2JMaTln?=
 =?utf-8?B?R0VZM0lxU09xckRyVnowY2l4clR3UzBOb0xkbTlwdWFJc0dVYThMWkpxT0Zs?=
 =?utf-8?B?aGFmeWRWdzJFaTAxUGpaWThqK1ZnZjFCL0ZISTIzTFVsaFdqU014dk5mUy85?=
 =?utf-8?B?RVRCaVQ3TGVVTEc0MDVMdzBlUTB1K0g1Q3pTMVd0ZTVLa0luVG1GZHFxWHdY?=
 =?utf-8?B?VUwrdWpnSVpZaURiTk1EaGltY0IwUUF0NjIyM2NFYVVUQXJhZDNuWk5jaDlv?=
 =?utf-8?B?OFMvZGVnUjIvNkFHWm9XZjFZQWFTblZwbjV5VUpBYUVNU0kwckJ0Vlp2dXFE?=
 =?utf-8?B?MHFiWkRaOFFKQlMxZ3B4aWJaSFJnb0ptNWQ3M3lGVUZIc3pSVGVDTll5a0Jh?=
 =?utf-8?B?Y09LY2hpVFdHSFZWZWxjaGFsenF1WUlNQ0xjY2djMTRkQmQxdjk3c0FIRGRP?=
 =?utf-8?B?RE5XUGFUeTIxMGhnVHB6SC8yNlo4Wi9NTzdUY1l5N0ZENUIzQ3RqTklMenhQ?=
 =?utf-8?B?S1B5bXJvV2oxdEhOZlU5VXBSL2lWQW9NWm9nSTJJdFo1SFVkeERWN1FBQy9J?=
 =?utf-8?B?WDlxNkIwNkxmMVpuamU5ejVreU9JOWtNYys3b05FUGV1UGR2Y2pPZ01OZ0Ir?=
 =?utf-8?B?S0w3dG05OW50S28ybU9tQTE4VlJ2MWdqUlpKOUoyRy9rVmtvU05ERi9HYnVX?=
 =?utf-8?B?S3pjNTk4MDRTM1lLV09FUDZEYzY1Y2FJMzE5aTNXMHJMVzdaWDd0a0dKQVhk?=
 =?utf-8?B?djFqQTRjTzBxZnRWNXhVbFpXbnFMSmVHLy9KazUzRkUrNTA2QXFWWWsvaW1h?=
 =?utf-8?B?cU9OYlhPbFdjUUNpa3puOFBObHBDZDlBdG53b3JYQmR1Y1duYUdXM1ErQ21l?=
 =?utf-8?B?ZDhHYzd2NjZ5MmdTdzkrR0dCcnp1bmZHKzNVODYyTDRxUzZOTkllTk10Wm9h?=
 =?utf-8?B?akUvOW1xM2FVcFZHaElGMkRudzdpNW15MnRMNEJZRG15VU1ucHRON1lsRU05?=
 =?utf-8?B?UjdKaDVXS1ZUbjBCcllvaGU1c2gwMnI2bFY0dk9UUTM5bHJhQWhZblM5ZFpG?=
 =?utf-8?B?UXEwU3J2QjV0TU9KU1Y0OFlJNGJqWEgrem41eUxaNUxoSWo5RlhSbjF1R0tL?=
 =?utf-8?B?NWxlSWJ2UElac2tQYlJMZzNVQUxjNkU2aERZM2dsdCtmYm1yVlRvRXV5dC9p?=
 =?utf-8?B?WDh1R2NRWEt0MWxrM2xhdWZseUdTV1ZpWnR6T0VxcUpPbW9ZQ1EvOXRYcCtV?=
 =?utf-8?B?M3dLQjBrR0ZuT08rRkgyUUZ1Sk8wKzQ0MTcxWXVPMHAvL2o3bS9iSWVPTy9O?=
 =?utf-8?B?YVJwelZaeHJpKzA0WVFyWkZRcnlJSVhML3hhMUhxOFJoTlI5emxYaE5Va1Jn?=
 =?utf-8?B?K1J1MzVVM3lVZTJTUVdPUDMyMVV0NjZIT2ZFcFZVMWdkMkVIQXRCUjhxYm1C?=
 =?utf-8?B?bUo4WUdIUElhakZYcUdWNTFIa0l4R210b0ZPQkNFUGRBRXhIY1JJYnlvN3lq?=
 =?utf-8?B?cDF3TFNWMFBHd21UbE9ZK2taRTJpT3F0M2IyUEswM2hKVTdqbVNYaWZ5WEZ4?=
 =?utf-8?B?MWQrdDgyU2tjOHNEK1g0S29USXBZd3hSbWc0ZlY4K1NnbGRva250bVhRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0JIQ1k0YlNaZGFLSDh5empsUVEvOGdncmRvNkNmWUtBY212WXRYcFp3NzZu?=
 =?utf-8?B?NGRRYy9YdC9JY1lWYWtYTys0VVRNUkpWUXZ6YU1xbjVxWG1WQ0k2M3BsWk1T?=
 =?utf-8?B?UXlPVzJ5cVNFNGlEZWpqTDhEcWNkQ3N0bXVhaE9XbDQ3WDBQMzFWbFJkdUNU?=
 =?utf-8?B?RDIvR2lWRTNhUDZMYmFsZHNBVXBienVOd0ZQaGRzK1l4QkVDOVBtbVJ0Zlhn?=
 =?utf-8?B?ZG5xSzZBY3JtdEJxbDMrNEEybkZFbXhheW1DeUpQNHgxNjBXQUdPZnJXWlVp?=
 =?utf-8?B?REI3dHo4Ui9Tb2M5Vkh6OXNyTkluQnJoY2RQclRidlpValVGUjFZeDBrQVc4?=
 =?utf-8?B?V3dqbDlraU9MTGxYbmRUUThaTHlwKzZ5SWRKZ1VDdGhDNS9YUk5UL21ET0lv?=
 =?utf-8?B?WFBsMklTYUE4V0lqY0xHdGFwc3N5ZjJodVdabVk3UjJIS2ppREtxTUpxV3l4?=
 =?utf-8?B?cFVuTVFIYjROTmdRNkQ2WDMycDBEcjI3b0RJQXNwdWsxZ3dGTVpxUE40MjZr?=
 =?utf-8?B?QW84RHBqZ1JtbkFhbjlYbGxFNzhQYUtiRlhiRFgySzVhU214YWNrcC9YRDJs?=
 =?utf-8?B?dnJaSGxoSDFpU1U5Z2l5RnFvcUhiUG8vUnNHTUMzUkd5S05HWmNwWkh6cFR6?=
 =?utf-8?B?NnZWNC9NeXVCa3hzcVcxRlF1bXhBdnpUWjlEVmdOZ25sbE5IaDY0ak0rVTEv?=
 =?utf-8?B?WEF6S013b1UvWFZwZG04N0czZnF4NHpQQ3FSdzU2a2VnMmF5MlFOdWtPRmNo?=
 =?utf-8?B?ZXRCV1hSUC9USkh6WURXOVZrQmt4Nm0xQWZrZ2dXd0RJdWhDQmxaa0NnUjY2?=
 =?utf-8?B?MElKVjRJYzZZOEhvZ05NZCt0dUQ5b0dUVi9ROUo1VmlKT1AyNmZTcU5LWW9L?=
 =?utf-8?B?WWNWanZ6OVJ1dE1SZUkySG9xRTZMNmdONm9DMjErY2NUaTlKbU5PRWptNFEr?=
 =?utf-8?B?aTIyaTdtR0lUSE9NbHBlYUJOdUdXY0VrdDB6UHo5VGE4OEVyTm1sV1Y4V3lI?=
 =?utf-8?B?SnJlLzYrYTM4dXhyaDRCRTJac0Q2dVB6bDRvbnlkaGlPZllMUk85WGREYXAz?=
 =?utf-8?B?R0M4RDU5a3lBWG96TXNCTDlMQ280aHFqbm1yWXdVcWlhSC9RSFZ5MzNvWjA0?=
 =?utf-8?B?TVdYN1lUTmhGazZtS3Z3aTN1S1p5VlJONnBvNFI2N0ZnSzZRclRqMnovd3BM?=
 =?utf-8?B?OHVQcW9JS013V1FXN1M2cVNlNTRIS2JPaTkzdjBINGVjQWZoU2tyeUEzRjlO?=
 =?utf-8?B?ckxkMG9CTytsUjNvMHhUR2pFRzN4cGdkRXk2S1VBRUxhMmhwL1U5NUc2eld1?=
 =?utf-8?B?cTFBc0JaWTNndThQQ1g2dGZHRXRaSVFsaEtpRDNrWEtva0lVbTQxU0VXRWlC?=
 =?utf-8?B?Ly8vbjRmUjM3K29IWW1CMEM2a080eWhkWkhCU29lUm9venh5b1UwTzR2bDNu?=
 =?utf-8?B?QkFQT25CSFppTFkyZG5ObnpEd0Y2WlU1cCtJYmh4OG1DUnpDTEFlclVpT3B3?=
 =?utf-8?B?NkhPYlVNQ3B3UHF6TGR6UjM0dS8xcUM1Vy9VSW9jOFBWQjRhQk9BNXhiS1Bu?=
 =?utf-8?B?dVlVSXpIRmRTb1k5K29DbmZ3OW9QSnJPbDJzcnZ1Tkd6TC84akZLZStEeGk1?=
 =?utf-8?B?RytSY25BcmFBZk00cmZyaGZhbTJEbGg4WHZXMjMxSWV1cFJ4WUQ5TU9CUk1E?=
 =?utf-8?B?ajE3ZXhwNXZhdC9zQU9pei9Sdk1yNzZCdndpY2x6c1dpallPajcveVEyalFw?=
 =?utf-8?B?UlpGTVI4dElJNEZzL3JaelN6YUZtM3R3S2ltd3FkQ3RKcGwyRG01T1BFUUJO?=
 =?utf-8?B?NXpaaDFJU1RlZy9YWkdkVnlQNmdRcWhJS2hPUGo1Qm5seEtKNnRQa2RZMy9m?=
 =?utf-8?B?Ti85UElpUTM3Zmh5WXU4c3dMczZERXV4bUtjdnpjcE9meXQvS3ppdk05MVFZ?=
 =?utf-8?B?SGhoUjhvYW13cGN0SUlXajZpNXFEd2xIVXh5R2JieWVEMWhqdVJ1TUQ0c2xD?=
 =?utf-8?B?M3pqdnczNDRaYTFZdk1sVVFWNnU1SUJZNkcwelRyVURpT1QyZHlOQ1RXd2RS?=
 =?utf-8?B?Uzh2WmZvNkxOUU14QjBNb0QyQXFGa1NFZjkwNnNOSEtPcDRvUGNFTTFQYVlo?=
 =?utf-8?Q?5yVw6ti1PCmvWSaL4GCMEebnq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f950e43-3319-4200-3db7-08dcf9b67c48
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 14:15:34.7366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5jCopghH4Rwygz7i4umnOU6HUMbDxFZRCGIhPfpKGb6TpbFTLjLTpGxuP3nK8Zs7MADriKSSaDvb4DpaL08tYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5812
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



On 2024-10-30 8:15 p.m., Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/guc: Fix dereference before NULL check (rev6)
> *URL:*	https://patchwork.freedesktop.org/series/139890/ <https:// 
> patchwork.freedesktop.org/series/139890/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v6/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v6/ 
> index.html>
> 
> 
>   CI Bug Log - changes from xe-2147-
>   c245557007af0a1c23da00c47732ae1dadda7dd3_full -> xe-pw-139890v6_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-139890v6_full absolutely need 
> to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-139890v6_full, please notify your bug team (I915-ci- 
> infra@lists.freedesktop.org) to allow them
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
> Here are the unknown changes that may have been introduced in xe- 
> pw-139890v6_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
> 
>       o shard-bmg: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139890v6/shard-bmg-7/igt@kms_ccs@random-ccs-
>         data-4-tiled-bmg-ccs.html> +1 other test incomplete
>   *
> 
>     igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-lnl-2/
>         igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html> -> DMESG-
>         WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v6/
>         shard-lnl-2/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html>
>         +3 other tests dmesg-warn
>   *
> 
>     igt@xe_drm_fdinfo@utilization-others-full-load:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-lnl-7/
>         igt@xe_drm_fdinfo@utilization-others-full-load.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v6/shard-
>         lnl-3/igt@xe_drm_fdinfo@utilization-others-full-load.html>
> 
> 
>         Warnings
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-adlp-8/
>         igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-
>         flip.html> (Intel XE#1242 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1242>) -> DMESG-FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-139890v6/shard-adlp-2/
>         igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-
>         flip.html>
> 
All above failures is not related to this patch.

Regards,
Zhanjun Dong
> 
>     Known issues
> 
> Here are the changes found in xe-pw-139890v6_full that come from known 
> issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@kms_async_flips@alternate-sync-async-flip:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-bmg-2/
>         igt@kms_async_flips@alternate-sync-async-flip.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v6/shard-
>         bmg-4/igt@kms_async_flips@alternate-sync-async-flip.html> (Intel
>         XE#827 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/827>) +1 other test fail
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-bmg-4/
>         igt@kms_atomic_transition@plane-all-modeset-transition-
>         fencing.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-139890v6/shard-bmg-5/igt@kms_atomic_transition@plane-
>         all-modeset-transition-fencing.html> (Intel XE#1426 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1426>) +1 other test
>         fail
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-lnl-3/
>         igt@kms_atomic_transition@plane-all-modeset-transition-
>         fencing.html> (Intel XE#3279 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3279>)
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-lnl-3/igt@kms_big_fb@4-tiled-max-
>         hw-stride-32bpp-rotate-0-hflip.html> (Intel XE#1407 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1407>)
>   *
> 
>     igt@kms_big_fb@y-tiled-32bpp-rotate-90:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-adlp-3/igt@kms_big_fb@y-
>         tiled-32bpp-rotate-90.html> (Intel XE#316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +1 other test skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-lnl-3/igt@kms_big_fb@yf-
>         tiled-32bpp-rotate-180.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +2 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139890v6/shard-dg2-435/igt@kms_big_fb@yf-
>         tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html> (Intel
>         XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1124>) +4 other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-adlp-3/igt@kms_big_fb@yf-tiled-
>         max-hw-stride-32bpp-rotate-180-async-flip.html> (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +2
>         other tests skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-lnl-3/igt@kms_bw@connected-linear-
>         tiling-2-displays-2160x1440p.html> (Intel XE#2191 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>   *
> 
>     igt@kms_bw@linear-tiling-2-displays-2160x1440p:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139890v6/shard-dg2-435/igt@kms_bw@linear-
>         tiling-2-displays-2160x1440p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +1 other test skip
>   *
> 
>     igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-lnl-3/igt@kms_ccs@bad-aux-stride-
>         y-tiled-gen12-rc-ccs.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +1 other test
>         skip
>   *
> 
>     igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-adlp-3/igt@kms_ccs@bad-pixel-
>         format-4-tiled-dg2-mc-ccs.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +7
>         other tests skip
>   *
> 
>     igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-adlp-3/igt@kms_ccs@bad-pixel-
>         format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html> (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +11
>         other tests skip
>   *
> 
>     igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-bmg-7/igt@kms_ccs@ccs-on-another-
>         bo-y-tiled-gen12-mc-ccs.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-dg2-432/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html> ->
>         INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-139890v6/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-
>         dg2-rc-ccs-cc.html> (Intel XE#1195 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel
>         XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-dg2-432/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-
>         dp-4.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-dg2-436/igt@kms_ccs@random-ccs-
>         data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html> (Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-dg2-432/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-
>         a-6.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-139890v6/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-
>         tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html> (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139890v6/shard-dg2-435/igt@kms_ccs@random-
>         ccs-data-yf-tiled-ccs@pipe-b-dp-4.html> (Intel XE#787 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +55 other
>         tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139890v6/shard-dg2-435/igt@kms_ccs@random-
>         ccs-data-yf-tiled-ccs@pipe-d-dp-4.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +15
>         other tests skip
>   *
> 
>     igt@kms_chamelium_audio@hdmi-audio:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-adlp-3/
>         igt@kms_chamelium_audio@hdmi-audio.html> (Intel XE#373 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +2 other tests
>         skip
>   *
> 
>     igt@kms_chamelium_edid@hdmi-mode-timings:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139890v6/shard-dg2-435/
>         igt@kms_chamelium_edid@hdmi-mode-timings.html> (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +4
>         other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@vga-hpd-fast:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-lnl-3/igt@kms_chamelium_hpd@vga-
>         hpd-fast.html> (Intel XE#373 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/373>) +1 other test skip
>   *
> 
>     igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139890v6/shard-dg2-435/
>         igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html> (Intel
>         XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) +1 other test skip
>   *
> 
>     igt@kms_color@ctm-0-50@pipe-c-edp-1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-lnl-8/
>         igt@kms_color@ctm-0-50@pipe-c-edp-1.html> -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v6/shard-
>         lnl-8/igt@kms_color@ctm-0-50@pipe-c-edp-1.html> (Intel XE#2929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929>) +1
>         other test dmesg-warn
>   *
> 
>     igt@kms_cursor_crc@cursor-random-512x170:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139890v6/shard-dg2-435/
>         igt@kms_cursor_crc@cursor-random-512x170.html> (Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>)
>   *
> 
>     igt@kms_cursor_crc@cursor-random-64x21:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-lnl-3/igt@kms_cursor_crc@cursor-
>         random-64x21.html> (Intel XE#1424 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1424>)
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-512x512:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-lnl-3/igt@kms_cursor_crc@cursor-
>         rapid-movement-512x512.html> (Intel XE#2321 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2321>)
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-bmg-5/
>         igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html> ->
>         DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-139890v6/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-
>         varying-size.html> (Intel XE#877 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/877>)
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-lnl-3/
>         igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v6/shard-
>         lnl-4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html>
>         (Intel XE#1475 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1475>)
>   *
> 
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-
>     transitions-varying-size:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139890v6/shard-dg2-463/
>         igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-
>         transitions-varying-size.html> (Intel XE#323 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>   *
> 
>     igt@kms_cursor_legacy@torture-bo:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-dg2-466/
>         igt@kms_cursor_legacy@torture-bo.html> -> DMESG-WARN <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v6/shard-dg2-463/
>         igt@kms_cursor_legacy@torture-bo.html> (Intel XE#3184 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3184>) +1 other test
>         dmesg-warn
>   *
> 
>     igt@kms_dsc@dsc-with-bpc-formats:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-lnl-3/igt@kms_dsc@dsc-with-bpc-
>         formats.html> (Intel XE#2244 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2244>)
>   *
> 
>     igt@kms_dsc@dsc-with-formats:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139890v6/shard-dg2-463/igt@kms_dsc@dsc-with-
>         formats.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/455>) +2 other tests skip
>   *
> 
>     igt@kms_feature_discovery@display-4x:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139890v6/shard-dg2-435/
>         igt@kms_feature_discovery@display-4x.html> (Intel XE#1138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138>)
>   *
> 
>     igt@kms_feature_discovery@dp-mst:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139890v6/shard-dg2-463/
>         igt@kms_feature_discovery@dp-mst.html> (Intel XE#1137 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1137>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-dg2-434/
>         igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-
>         dp4.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-139890v6/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-
>         vblank-interruptible@cd-hdmi-a6-dp4.html> (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +6
>         other tests fail
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-bmg-2/
>         igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html> ->
>         FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v6/
>         shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-
>         a3.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/301>) +3 other tests fail
>   *
> 
>     igt@kms_flip@2x-plain-flip-ts-check:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-lnl-3/igt@kms_flip@2x-plain-flip-
>         ts-check.html> (Intel XE#1421 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1421>)
>   *
> 
>     igt@kms_flip@2x-plain-flip-ts-check-interruptible:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-bmg-2/
>         igt@kms_flip@2x-plain-flip-ts-check-interruptible.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v6/shard-
>         bmg-4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html>
>         (Intel XE#2882 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2882>) +2 other tests fail
>   *
> 
>     igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-lnl-8/
>         igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v6/shard-
>         lnl-4/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html>
>         (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/886>) +5 other tests fail
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-bmg-7/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-
>         upscaling.html> (Intel XE#2293 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2293> / Intel XE#2380 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2380>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-
>     upscaling@pipe-a-valid-mode:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-bmg-7/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-
>         upscaling@pipe-a-valid-mode.html> (Intel XE#2293 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2293>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-lnl-3/
>         igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-
>         blt.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/651>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-adlp-3/
>         igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-
>         blt.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/656>) +2 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-adlp-3/
>         igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt.html> (Intel
>         XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/651>) +3 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-rte:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-bmg-7/
>         igt@kms_frontbuffer_tracking@fbc-2p-rte.html> (Intel XE#2333
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-lnl-3/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-
>         render.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/656>) +5 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139890v6/shard-dg2-463/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-
>         blt.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/651>) +13 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139890v6/shard-dg2-435/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-
>         mmap-wc.html> (Intel XE#2890 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2890>) +4 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139890v6/shard-dg2-463/
>         igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html> (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +10
>         other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-adlp-3/
>         igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-
>         blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/653>) +2 other tests skip
>   *
> 
>     igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139890v6/shard-dg2-464/
>         igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-6.html> (Intel
>         XE#3312 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3312>)
>   *
> 
>     igt@kms_joiner@basic-ultra-joiner:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139890v6/shard-dg2-463/igt@kms_joiner@basic-
>         ultra-joiner.html> (Intel XE#2927 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2927>)
>   *
> 
>     igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-dg2-433/
>         igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html> ->
>         FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v6/
>         shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-
>         size-64.html> (Intel XE#616 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/616>) +1 other test fail
>   *
> 
>     igt@kms_plane_multiple@tiling-none@pipe-b-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-139890v6/shard-dg2-434/
>         igt@kms_plane_multiple@tiling-none@pipe-b-hdmi-a-6.html> (Intel
>         XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1195>) +1 other test incomplete
>   *
> 
>     igt@kms_plane_multiple@tiling-yf:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-adlp-3/
>         igt@kms_plane_multiple@tiling-yf.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +2 other tests
>         skip
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139890v6/shard-dg2-435/
>         igt@kms_plane_scaling@plane-downscale-factor-0-25-with-
>         modifiers@pipe-a.html> (Intel XE#2763 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +2 other
>         tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139890v6/shard-dg2-435/
>         igt@kms_plane_scaling@plane-downscale-factor-0-25-with-
>         modifiers@pipe-d.html> (Intel XE#2763 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2763> / Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>   *
> 
>     igt@kms_pm_dc@dc6-psr:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139890v6/shard-dg2-463/igt@kms_pm_dc@dc6-
>         psr.html> (Intel XE#1129 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1129>)
>   *
> 
>     igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-lnl-3/igt@kms_psr2_sf@fbc-pr-
>         cursor-plane-move-continuous-exceed-sf.html> (Intel XE#2893
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893>)
>   *
> 
>     igt@kms_psr2_sf@pr-cursor-plane-update-sf:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139890v6/shard-dg2-463/igt@kms_psr2_sf@pr-
>         cursor-plane-update-sf.html> (Intel XE#1489 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +2 other
>         tests skip
>   *
> 
>     igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-adlp-3/igt@kms_psr2_sf@pr-overlay-
>         plane-update-continuous-sf.html> (Intel XE#1489 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>   *
> 
>     igt@kms_psr@fbc-pr-dpms:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-bmg-7/igt@kms_psr@fbc-pr-
>         dpms.html> (Intel XE#2234 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2234> / Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850>)
>   *
> 
>     igt@kms_psr@fbc-psr-no-drrs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139890v6/shard-dg2-435/igt@kms_psr@fbc-psr-
>         no-drrs.html> (Intel XE#2850 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2850> / Intel XE#929 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +4 other tests
>         skip
>   *
> 
>     igt@kms_psr@fbc-psr2-cursor-plane-move:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-adlp-3/igt@kms_psr@fbc-psr2-
>         cursor-plane-move.html> (Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>)
>   *
> 
>     igt@kms_psr@fbc-psr2-primary-page-flip@edp-1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-lnl-6/
>         igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v6/shard-
>         lnl-8/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html> (Intel
>         XE#2808 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2808>) +1 other test fail
>   *
> 
>     igt@kms_rotation_crc@multiplane-rotation-cropping-top:
> 
>       o shard-adlp: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-adlp-4/
>         igt@kms_rotation_crc@multiplane-rotation-cropping-top.html>
>         (Intel XE#1874 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1874>)
>   *
> 
>     igt@kms_rotation_crc@primary-rotation-270:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-bmg-7/
>         igt@kms_rotation_crc@primary-rotation-270.html> (Intel XE#2329
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329>)
>   *
> 
>     igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139890v6/shard-dg2-435/
>         igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html> (Intel
>         XE#327 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>)
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-lnl-5/
>         igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html> ->
>         FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v6/
>         shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-
>         edp-1.html> (Intel XE#899 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/899>) +1 other test fail
>   *
> 
>     igt@kms_vrr@max-min:
> 
>       o shard-lnl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-lnl-3/igt@kms_vrr@max-min.html>
>         (Intel XE#2443 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2443>) +1 other test fail
>   *
> 
>     igt@kms_writeback@writeback-fb-id:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-lnl-3/igt@kms_writeback@writeback-
>         fb-id.html> (Intel XE#756 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/756>)
>   *
> 
>     igt@xe_copy_basic@mem-copy-linear-0xfffe:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139890v6/shard-dg2-435/
>         igt@xe_copy_basic@mem-copy-linear-0xfffe.html> (Intel XE#1123
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123>)
>   *
> 
>     igt@xe_eudebug@discovery-empty-clients:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-lnl-3/igt@xe_eudebug@discovery-
>         empty-clients.html> (Intel XE#2905 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +1 other test
>         skip
>   *
> 
>     igt@xe_eudebug_online@breakpoint-not-in-debug-mode:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-bmg-7/
>         igt@xe_eudebug_online@breakpoint-not-in-debug-mode.html> (Intel
>         XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>)
>   *
> 
>     igt@xe_eudebug_online@reset-with-attention:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-adlp-3/
>         igt@xe_eudebug_online@reset-with-attention.html> (Intel XE#2905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>)
>   *
> 
>     igt@xe_eudebug_online@stopped-thread:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139890v6/shard-dg2-463/
>         igt@xe_eudebug_online@stopped-thread.html> (Intel XE#2905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +4
>         other tests skip
>   *
> 
>     igt@xe_evict@evict-beng-large-multi-vm-cm:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-bmg-4/
>         igt@xe_evict@evict-beng-large-multi-vm-cm.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v6/shard-
>         bmg-5/igt@xe_evict@evict-beng-large-multi-vm-cm.html> (Intel
>         XE#2364 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364>)
>   *
> 
>     igt@xe_evict@evict-mixed-many-threads-large:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-lnl-3/igt@xe_evict@evict-mixed-
>         many-threads-large.html> (Intel XE#688 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/688>)
>   *
> 
>     igt@xe_evict@evict-small-external-cm:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-adlp-3/igt@xe_evict@evict-small-
>         external-cm.html> (Intel XE#261 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/261> / Intel XE#688 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +1 other test skip
>   *
> 
>     igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-adlp-3/igt@xe_exec_basic@multigpu-
>         once-bindexecqueue-userptr-rebind.html> (Intel XE#1392 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +1 other test
>         skip
>   *
> 
>     igt@xe_exec_basic@multigpu-once-null-defer-bind:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-lnl-3/igt@xe_exec_basic@multigpu-
>         once-null-defer-bind.html> (Intel XE#1392 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1392>)
>   *
> 
>     igt@xe_exec_compute_mode@once-userptr-invalidate-race:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-lnl-7/
>         igt@xe_exec_compute_mode@once-userptr-invalidate-race.html> ->
>         FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v6/
>         shard-lnl-3/igt@xe_exec_compute_mode@once-userptr-invalidate-
>         race.html> (Intel XE#2754 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2754>)
>   *
> 
>     igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-lnl-8/
>         igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-
>         race.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-139890v6/shard-lnl-3/igt@xe_exec_fault_mode@many-
>         bindexecqueue-userptr-invalidate-race.html> (Intel XE#3160
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160>) +1
>         other test fail
>   *
> 
>     igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-
>     invalidate-race-prefetch:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-bmg-2/
>         igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-
>         invalidate-race-prefetch.html> -> FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-139890v6/shard-bmg-4/
>         igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-
>         invalidate-race-prefetch.html> (Intel XE#3160 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3160>)
>   *
> 
>     igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139890v6/shard-dg2-435/
>         igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-
>         prefetch.html> (Intel XE#288 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/288>) +10 other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-adlp-4/
>         igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html>
>         (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/288>) +5 other tests skip
>   *
> 
>     igt@xe_exec_reset@parallel-close-execqueues-close-fd:
> 
>       o shard-adlp: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-adlp-4/igt@xe_exec_reset@parallel-
>         close-execqueues-close-fd.html> (Intel XE#1081 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1081>)
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139890v6/shard-dg2-434/
>         igt@xe_exec_reset@parallel-close-execqueues-close-fd.html>
>         (Intel XE#1081 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1081>)
>   *
> 
>     igt@xe_exec_threads@threads-mixed-shared-vm-userptr-rebind:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-adlp-2/
>         igt@xe_exec_threads@threads-mixed-shared-vm-userptr-rebind.html>
>         -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-139890v6/shard-adlp-8/igt@xe_exec_threads@threads-mixed-
>         shared-vm-userptr-rebind.html> (Intel XE#1033 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel
>         XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727>) +1 other test timeout
>   *
> 
>     igt@xe_module_load@load:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139890v6/shard-dg2-435/
>         igt@xe_module_load@load.html> (Intel XE#378 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/378>)
>   *
> 
>     igt@xe_noexec_ping_pong:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-adlp-4/
>         igt@xe_noexec_ping_pong.html> (Intel XE#379 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/379>)
>   *
> 
>     igt@xe_oa@mi-rpc:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-adlp-3/igt@xe_oa@mi-rpc.html>
>         (Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2541>)
>   *
> 
>     igt@xe_oa@non-privileged-access-vaddr:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139890v6/shard-dg2-463/igt@xe_oa@non-
>         privileged-access-vaddr.html> (Intel XE#2541 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +1 other test
>         skip
>   *
> 
>     igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139890v6/shard-dg2-463/
>         igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html>
>         (Intel XE#1173 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1173>) +1 other test fail
>   *
> 
>     igt@xe_pm@d3cold-multiple-execs:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-lnl-3/igt@xe_pm@d3cold-multiple-
>         execs.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2284> / Intel XE#366 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>   *
> 
>     igt@xe_pm@d3hot-mmap-system:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-adlp-3/
>         igt@xe_pm@d3hot-mmap-system.html> -> DMESG-WARN <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-139890v6/shard-adlp-4/
>         igt@xe_pm@d3hot-mmap-system.html> (Intel XE#2953 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2953> / Intel
>         XE#3086 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086>)
>   *
> 
>     igt@xe_pm@s3-vm-bind-unbind-all:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-dg2-464/
>         igt@xe_pm@s3-vm-bind-unbind-all.html> -> ABORT <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-139890v6/shard-dg2-432/
>         igt@xe_pm@s3-vm-bind-unbind-all.html> (Intel XE#1794 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) +1 other test
>         abort
>   *
> 
>     igt@xe_pm@s4-basic-exec:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-dg2-434/
>         igt@xe_pm@s4-basic-exec.html> -> ABORT <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-139890v6/shard-dg2-432/
>         igt@xe_pm@s4-basic-exec.html> (Intel XE#1358 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel
>         XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>   *
> 
>     igt@xe_pm@s4-mocs:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-adlp-4/
>         igt@xe_pm@s4-mocs.html> -> ABORT <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139890v6/shard-adlp-9/igt@xe_pm@s4-
>         mocs.html> (Intel XE#1794 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1794>)
>   *
> 
>     igt@xe_pm@s4-vm-bind-unbind-all:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-lnl-3/
>         igt@xe_pm@s4-vm-bind-unbind-all.html> -> ABORT <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-139890v6/shard-lnl-2/
>         igt@xe_pm@s4-vm-bind-unbind-all.html> (Intel XE#1794 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>   *
> 
>     igt@xe_pm_residency@idle-residency-on-exec:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139890v6/shard-dg2-435/
>         igt@xe_pm_residency@idle-residency-on-exec.html> (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +2
>         other tests skip
>   *
> 
>     igt@xe_query@multigpu-query-invalid-size:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139890v6/shard-dg2-463/
>         igt@xe_query@multigpu-query-invalid-size.html> (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>   *
> 
>     igt@xe_query@multigpu-query-topology:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-adlp-3/igt@xe_query@multigpu-
>         query-topology.html> (Intel XE#944 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@core_hotunplug@hotunbind-rebind:
> 
>       o shard-lnl: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-lnl-8/
>         igt@core_hotunplug@hotunbind-rebind.html> (Intel XE#2910
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2910>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v6/
>         shard-lnl-4/igt@core_hotunplug@hotunbind-rebind.html>
>   *
> 
>     igt@kms_addfb_basic@addfb25-y-tiled-legacy:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-
>         adlp-8/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html> (Intel
>         XE#3086 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3086>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-139890v6/shard-adlp-2/igt@kms_addfb_basic@addfb25-y-
>         tiled-legacy.html> +1 other test pass
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-
>         adlp-3/igt@kms_async_flips@async-flip-with-page-flip-
>         events.html> (Intel XE#3194 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3194>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139890v6/shard-adlp-4/
>         igt@kms_async_flips@async-flip-with-page-flip-events.html> +2
>         other tests pass
>   *
> 
>     igt@kms_atomic_transition@modeset-transition-nonblocking:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-lnl-6/
>         igt@kms_atomic_transition@modeset-transition-nonblocking.html>
>         (Intel XE#1701 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1701>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-139890v6/shard-lnl-8/igt@kms_atomic_transition@modeset-
>         transition-nonblocking.html> +1 other test pass
>   *
> 
>     igt@kms_atomic_transition@plane-toggle-modeset-transition:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-bmg-2/
>         igt@kms_atomic_transition@plane-toggle-modeset-transition.html>
>         (Intel XE#1426 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1426>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-139890v6/shard-bmg-4/igt@kms_atomic_transition@plane-
>         toggle-modeset-transition.html> +1 other test pass
>   *
> 
>     igt@kms_big_fb@4-tiled-64bpp-rotate-0:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-lnl-5/
>         igt@kms_big_fb@4-tiled-64bpp-rotate-0.html> (Intel XE#1454
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1454>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v6/
>         shard-lnl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html>
>   *
> 
>     igt@kms_big_fb@linear-64bpp-rotate-0:
> 
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-
>         dg2-463/igt@kms_big_fb@linear-64bpp-rotate-0.html> (Intel XE#877
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v6/
>         shard-dg2-464/igt@kms_big_fb@linear-64bpp-rotate-0.html>
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> 
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-
>         dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html>
>         (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-139890v6/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-
>         tiled-dg2-rc-ccs.html>
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:
> 
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-
>         dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-
>         dp-4.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-139890v6/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-
>         tiled-dg2-rc-ccs@pipe-d-dp-4.html>
>   *
> 
>     igt@kms_color@ctm-0-75@pipe-c-edp-1:
> 
>       o shard-lnl: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-lnl-7/
>         igt@kms_color@ctm-0-75@pipe-c-edp-1.html> (Intel XE#2929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v6/
>         shard-lnl-7/igt@kms_color@ctm-0-75@pipe-c-edp-1.html> +1 other
>         test pass
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-bmg-8/
>         igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html> (Intel
>         XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/877>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-139890v6/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-
>         flipa-toggle.html>
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-toggle:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-lnl-6/
>         igt@kms_cursor_legacy@flip-vs-cursor-toggle.html> (Intel XE#1475
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v6/
>         shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html>
>   *
> 
>     igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-lnl-8/
>         igt@kms_cursor_legacy@short-flip-before-cursor-atomic-
>         transitions.html> (Intel XE#1541 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1541>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v6/shard-
>         lnl-8/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-
>         transitions.html>
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-dg2-433/
>         igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html>
>         (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/301>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-139890v6/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-
>         vblank@ab-hdmi-a6-dp4.html> +5 other tests pass
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-bmg-2/
>         igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html>
>         (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/301>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-139890v6/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-
>         vblank@ad-dp2-hdmi-a3.html> +1 other test pass
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-dg2-433/
>         igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html>
>         (Intel XE#3267 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3267>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-139890v6/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-
>         vblank@bc-hdmi-a6-dp4.html>
>   *
> 
>     igt@kms_flip@basic-flip-vs-wf_vblank:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-lnl-6/
>         igt@kms_flip@basic-flip-vs-wf_vblank.html> (Intel XE#886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v6/
>         shard-lnl-8/igt@kms_flip@basic-flip-vs-wf_vblank.html> +3 other
>         tests pass
>   *
> 
>     igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-
>         dg2-464/igt@kms_flip@flip-vs-absolute-wf_vblank-
>         interruptible.html> (Intel XE#1195 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel
>         XE#2049 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2049>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-139890v6/shard-dg2-434/igt@kms_flip@flip-vs-absolute-
>         wf_vblank-interruptible.html>
>   *
> 
>     igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a6:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-
>         dg2-464/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-
>         hdmi-a6.html> (Intel XE#1195 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1195>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-139890v6/shard-dg2-434/
>         igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-
>         a6.html>
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-adlp-8/
>         igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-
>         x.html> (Intel XE#1874 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1874>) -> PASS <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-adlp-1/igt@kms_flip_tiling@flip-
>         change-tiling@pipe-c-hdmi-a-1-y-to-x.html> +1 other test pass
>   *
> 
>     igt@kms_hdr@static-swap:
> 
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-bmg-1/
>         igt@kms_hdr@static-swap.html> -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-139890v6/shard-bmg-7/
>         igt@kms_hdr@static-swap.html> +1 other test pass
>   *
> 
>     igt@kms_pm_dc@dc6-dpms:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-lnl-7/
>         igt@kms_pm_dc@dc6-dpms.html> (Intel XE#1430 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1430>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v6/shard-
>         lnl-3/igt@kms_pm_dc@dc6-dpms.html>
>   *
> 
>     igt@kms_pm_rpm@legacy-planes-dpms:
> 
>       o shard-lnl: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-lnl-4/
>         igt@kms_pm_rpm@legacy-planes-dpms.html> (Intel XE#3184 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3184>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v6/shard-
>         lnl-1/igt@kms_pm_rpm@legacy-planes-dpms.html>
>   *
> 
>     igt@kms_pm_rpm@legacy-planes-dpms@plane-50:
> 
>       o shard-lnl: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-lnl-4/
>         igt@kms_pm_rpm@legacy-planes-dpms@plane-50.html> -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v6/shard-
>         lnl-1/igt@kms_pm_rpm@legacy-planes-dpms@plane-50.html>
>   *
> 
>     igt@kms_pm_rpm@universal-planes-dpms:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-
>         adlp-6/igt@kms_pm_rpm@universal-planes-dpms.html> (Intel XE#2953
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953> /
>         Intel XE#3086 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3086>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-139890v6/shard-adlp-8/igt@kms_pm_rpm@universal-planes-
>         dpms.html>
>   *
> 
>     igt@kms_psr@fbc-psr-suspend@edp-1:
> 
>       o shard-lnl: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-lnl-7/
>         igt@kms_psr@fbc-psr-suspend@edp-1.html> (Intel XE#2761 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2761>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v6/shard-
>         lnl-3/igt@kms_psr@fbc-psr-suspend@edp-1.html> +1 other test pass
>   *
> 
>     igt@kms_psr@fbc-psr2-cursor-render@edp-1:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-lnl-7/
>         igt@kms_psr@fbc-psr2-cursor-render@edp-1.html> (Intel XE#2948
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v6/
>         shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html> +1
>         other test pass
>   *
> 
>     igt@xe_evict@evict-beng-mixed-threads-large:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-dg2-466/
>         igt@xe_evict@evict-beng-mixed-threads-large.html> (Intel XE#1000
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v6/
>         shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-large.html>
>   *
> 
>     igt@xe_evict@evict-threads-large:
> 
>       o shard-bmg: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-bmg-5/
>         igt@xe_evict@evict-threads-large.html> (Intel XE#1473 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v6/shard-
>         bmg-2/igt@xe_evict@evict-threads-large.html>
>   *
> 
>     igt@xe_exec_compute_mode@once-userptr-invalidate:
> 
>       o shard-lnl: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-lnl-6/
>         igt@xe_exec_compute_mode@once-userptr-invalidate.html> (Intel
>         XE#2687 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2687>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-139890v6/shard-lnl-6/igt@xe_exec_compute_mode@once-
>         userptr-invalidate.html>
>   *
> 
>     igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-
>     prefetch:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-bmg-5/
>         igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-
>         race-prefetch.html> (Intel XE#3160 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3160>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v6/shard-
>         bmg-1/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-
>         invalidate-race-prefetch.html> +1 other test pass
>   *
> 
>     igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-lnl-1/
>         igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm.html>
>         (Intel XE#3160 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3160>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-139890v6/shard-lnl-4/igt@xe_exec_fault_mode@many-
>         userptr-invalidate-race-imm.html>
>   *
> 
>     igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:
> 
>       o shard-dg2-set2: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-
>         dg2-433/igt@xe_exec_threads@threads-cm-shared-vm-userptr-
>         invalidate.html> -> PASS <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-dg2-435/
>         igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html>
>   *
> 
>     igt@xe_pm@s4-d3hot-basic-exec:
> 
>       o shard-adlp: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-adlp-9/
>         igt@xe_pm@s4-d3hot-basic-exec.html> (Intel XE#1358 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel
>         XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1607>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-139890v6/shard-adlp-3/igt@xe_pm@s4-d3hot-basic-exec.html>
>   *
> 
>     igt@xe_pm@s4-vm-bind-prefetch:
> 
>       o shard-dg2-set2: ABORT <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-
>         dg2-432/igt@xe_pm@s4-vm-bind-prefetch.html> (Intel XE#1794
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v6/
>         shard-dg2-435/igt@xe_pm@s4-vm-bind-prefetch.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
> 
>       o shard-adlp: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-
>         adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-
>         async-flip.html> (Intel XE#3194 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3194>) -> FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-139890v6/shard-adlp-6/
>         igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-
>         flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1231> / Intel XE#1242 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1242>)
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-adlp-8/
>         igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-
>         flip.html> (Intel XE#1242 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1242>) -> DMESG-WARN <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-139890v6/shard-adlp-1/
>         igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-
>         flip.html> (Intel XE#3194 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3194>)
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-adlp-2/
>         igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html> (Intel
>         XE#1874 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1874>) -> TIMEOUT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-adlp-8/igt@kms_big_fb@y-tiled-max-
>         hw-stride-64bpp-rotate-0.html> (Intel XE#1033 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel
>         XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727> / Intel XE#402 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/402>)
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> 
>       o shard-adlp: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-
>         adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-
>         async-flip.html> (Intel XE#3194 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3194>) -> FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-139890v6/shard-adlp-9/
>         igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-
>         flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1231> / Intel XE#3052 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3052>)
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-adlp-4/
>         igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-
>         async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1231> / Intel XE#1242 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1242>) -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v6/shard-
>         adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-
>         hflip-async-flip.html> (Intel XE#3194 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3194>)
>   *
> 
>     igt@kms_flip@2x-plain-flip-interruptible:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-adlp-2/
>         igt@kms_flip@2x-plain-flip-interruptible.html> (Intel XE#310
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/310>) ->
>         TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-139890v6/shard-adlp-8/igt@kms_flip@2x-plain-flip-
>         interruptible.html> (Intel XE#1033 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel
>         XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-adlp-2/
>         igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-
>         mmap-wc.html> (Intel XE#1861 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1861>) -> TIMEOUT <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-139890v6/shard-adlp-8/
>         igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-
>         mmap-wc.html> (Intel XE#1033 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1033> / Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-adlp-2/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-
>         move.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/656>) -> TIMEOUT <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139890v6/shard-adlp-8/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-
>         move.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1033> / Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
>   *
> 
>     igt@kms_plane@pixel-format:
> 
>       o shard-adlp: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-
>         adlp-1/igt@kms_plane@pixel-format.html> (Intel XE#1035 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1035> / Intel
>         XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1195>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139890v6/shard-adlp-3/igt@kms_plane@pixel-
>         format.html> (Intel XE#1035 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1035>)
>   *
> 
>     igt@kms_vrr@cmrr:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3/shard-adlp-2/
>         igt@kms_vrr@cmrr.html> (Intel XE#2168 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2168>) -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139890v6/shard-
>         adlp-8/igt@kms_vrr@cmrr.html> (Intel XE#1033 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel
>         XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
> 
> 
>     Build changes
> 
>   * Linux: xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3 -> xe-
>     pw-139890v6
> 
> IGT_8089: 2339a396e8c38ba1582a6fc18fe4f7ed178979cc @ https:// 
> gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-2147-c245557007af0a1c23da00c47732ae1dadda7dd3: 
> c245557007af0a1c23da00c47732ae1dadda7dd3
> xe-pw-139890v6: 139890v6
> 

