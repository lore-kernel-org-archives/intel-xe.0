Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50600CDE032
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 19:01:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033B910EA74;
	Thu, 26 Sep 2024 19:01:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VESv5RCp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D034010EA74
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Sep 2024 19:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727377260; x=1758913260;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=B9zF/s100Cc/G69wYKN/qG46LzTByKKY8pqTCvq0Ux4=;
 b=VESv5RCp2BGz8zqqAF0rWV2aOybeILpwDthKXGBALQxB22gj9xo63lKy
 y1s3dw1rVQLxfPeMhVh1xTNYffHnfFeosHN83+W7Wl1V09vt6Vd9JaXhK
 6W2Ht41VN05tWJMUIV4GcirYNROUTmVvDIsuhALn/qfHhnqrL13zE2NV/
 q34+i9/dpstFkKXjUzp9ug8HCkWsHNtK3TtIFa3haRQZs+gEDLICYr3Jl
 xPLgyuFMcBoRkx6j2aeYAVu5Fb+MadUqMf0FEf5/8X7DhsS18oPulgP4c
 unl5DgBdOZzrK1UnX6cP37yNG9UCrQ2+MJnb42JaFGAGd6YLpplXzDZHi Q==;
X-CSE-ConnectionGUID: Y/tPE5J8TA+iKGF5HGghZQ==
X-CSE-MsgGUID: w2yrqiBARJ2i8sFWfiM3Bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26449204"
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="26449204"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 12:00:59 -0700
X-CSE-ConnectionGUID: xBCniaNKQUmoiKEiUbO+Gg==
X-CSE-MsgGUID: uKUIl4eMQ+eUQnsqNR+wpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="71866775"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2024 12:00:59 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 12:00:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 12:00:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 26 Sep 2024 12:00:57 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 26 Sep 2024 12:00:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gSs8riSn3U4wktRtsXx3PitUtgmD9YK7gJ/XskUieohvnlYVg/0s9brSTpqVjn0w1RG+qzlZo2mSUBTdIQ2VKMnEgV8au8w9Bo/wQi2+faXRjFtBjL+v3Bqqz7w8/2r47NYUHOCXJ/XGT1el3yVLnOY64wj/9vhdu2OnCa+28sjv3PoTRK9oJQPuoe0qUdlMOWHybPHS7qqwXtIAJUNCi2sTYOcRVTvpnjb5KlXu41ZryefiIFsSwn+yZ6Qy96pEi6Wsvv8CdVKEnvtGAnw9blCVxbJXIVTkL5FQqJjF1jvta2jz5v2W3D0VH5aDKTMhLgdazv9Y66vcc8vb5cDrGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yxfv9S9f+LUV5Sn/QeCHs9/DTV0cS8wvId0JXe67Bjc=;
 b=cSpDIsLwtu17Xp2CMe+kJ4qCZtJGc9YbEwqLXdbWIIU5VxSWcyo6GE33pq1sNSX5llidQkkVkrzeFnRgfV7omKsT/eD7STCW5CZTbl1ryr+ZVqbzuXWOYm1xk0BkMqp/4ZTSIMSTqD8BIFBk5yG+pt63/p8wD7ALOmXQ+blivhxn50PtHNTlDUXCuiCvaGpuna31NsWht8xWj83vj/KLBSuHR5+j7Gg2oDfaOzGIEdzeltdF+LSMGNv3LvcPOpahWdmfYNW/6cJV7uz5j+YkvTNrI7cV9OxS0FBci1hjtmsRYsgqxj3k293/vZqq3WkvhQMZQAPAp9ZVrWSTD4mN7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by MW3PR11MB4619.namprd11.prod.outlook.com (2603:10b6:303:5b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Thu, 26 Sep
 2024 19:00:50 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.8005.021; Thu, 26 Sep 2024
 19:00:49 +0000
Message-ID: <9f202095-4227-4fa1-917f-e22334156f1f@intel.com>
Date: Thu, 26 Sep 2024 15:00:47 -0400
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Preven?=
 =?UTF-8?Q?t_null_pointer_access_in_xe=5Fmigrate=5Fcopy_=28rev2=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20240925012110.493257-1-zhanjun.dong@intel.com>
 <172737483444.1107989.14748259119665945788@2413ebb6fbb6>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <172737483444.1107989.14748259119665945788@2413ebb6fbb6>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0298.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::33) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|MW3PR11MB4619:EE_
X-MS-Office365-Filtering-Correlation-Id: b3ab8169-c457-44fc-0312-08dcde5d8934
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?elFHT1UweVJUSjJJMW1VVEZFNnNKSE9kSXFKekZ5SFZyZzlpYTJUMXNFL2px?=
 =?utf-8?B?N0FtcjVHMEc3alg1QXlVbXRrV3M2c1M3SDNWMnRnMllqeVVJQ2dVdUVZWGVl?=
 =?utf-8?B?V2s4RzFHeWRwK1Vvem1JdUlSdUM4VWFid0RlNlNUYzlXZGhxRnR6YXdNNTZa?=
 =?utf-8?B?dE83RlYyZEs3TzZ1dkFXUElyVlJRRkxpREhQa0o0d1JCRHVOMWdzS0VxczEz?=
 =?utf-8?B?R0s1MmFPZ1lxblRJZmJSUmFrcTNRbU9JeEgxQ0FqQTBMS2JmVXNOMjNSRGtj?=
 =?utf-8?B?SUZJSk5peGRqSk4wMVdBdmtYSjdONmJMMjArODBoUFNkZ0cxM2l6cG53ZTFp?=
 =?utf-8?B?WSsyRW5tNnVxUFlvRG9oM3ZESVFEVWI1ejNWR1piSGdrVExtVTYxc0NqTEJZ?=
 =?utf-8?B?YTFDU3NxR0xCVkQ0a1hQaUU2REtEZnVkdFYwQXdVTlVtckY5ZWlqUlVzZ2VE?=
 =?utf-8?B?VllHUUJRMUNsQStCMlhBUys3WkhRWjhOMmZ2bm1nQ2VmMWo2czFXdXFqV3ll?=
 =?utf-8?B?bUlJbmsyUFNNcGRvaERiNUE5T1ZUamlXa3NJK3NSd2UvTmFFRWVXME1hYVhy?=
 =?utf-8?B?akNyblZmZTd0ZzdtK2hPdnNHRFo1QVZ2eHY4ZzJsTkJEeXFtSWExM2Z3ZzY3?=
 =?utf-8?B?WlhYY0tjTnU2akM1NGU1MjNmQUhoUFpHM0dRd1MvcnY1OUk4cE1IUnlGTGpQ?=
 =?utf-8?B?WnlXTXpuQURxWUhmL2FXanVkRWlUYnNUN1JMS2EyR3F0QzZubFVJTVBVR0FO?=
 =?utf-8?B?aWxSZFhjZTFZTmJzaWJId1ZCYUZJMHZ0Q2JZNWZkWnc1VUZXUDlqcUpXeExR?=
 =?utf-8?B?dDNFOXBrRWxwNm5teXhlOVpsQldSd1hCOFlVODVFWDcxQWZwb2U0VTZNR2NV?=
 =?utf-8?B?RkxVTy9CeEhOSWdMY2pFUHh1ME1ZbjBuQ2Y0QUtUbjFOUzZXVjhWUWVOb2Qv?=
 =?utf-8?B?RWpXRGdhSzBDUzJqMHZTY2pCbnpGN0IwblQreDNNUTM2dS90Y29McDFhZlVw?=
 =?utf-8?B?YVhSV1ZoSENPV0FqalpTdXN5SXltKzZEelVYamxuKzl5cmhCdXdjKzdhSytq?=
 =?utf-8?B?UFhxY1pocVo1NDlSV3FtRkpmMnB3UExLbVVYb0Q3RDhZVzZZbUdKZnBKRmR1?=
 =?utf-8?B?Rk1YTUdUYlpOUHRObVU5VmlnalorQ2txMmlURGk4WFI0dFg1VUk3N0hvbmo5?=
 =?utf-8?B?dk5TTWpNKy9PY2NrSjlCbGZrRlpnOU9QWTZ6L2RXaWlJallia1BsTk5lby9h?=
 =?utf-8?B?S282NzgvL2dBcUkxUVNYdWRjUnlZTERVdFdxZExGeGlsM3gwODlzN3pTbXZ3?=
 =?utf-8?B?azlyYzdnbkh1MlBMdG1TK1NDUnJnd1kycWkySXg5OWFrWG5kVjZUcEc5Q0l2?=
 =?utf-8?B?TmJLSzRWV3ZaS0M3ZHIwRFdiWnJOWkdSL053U2NtdG81eW5OaUs3VzZFdU1n?=
 =?utf-8?B?NXVtS04rWGJXQjU3QzF1bWkxQzRVTFY5RkkvNEE5aVgzVHNmQUtybk1RNldL?=
 =?utf-8?B?QWdpNXdxaVAxNDcxZ3Z3d1JpazdhbDJtOWhtOGhqQUVIMk5STllqZ1phTjdk?=
 =?utf-8?B?anhzYmg0S3VLT3VGNW1YbnNvVFpoNlBLVVVac3Btb0E4SFlFdUp4eXAxSmxU?=
 =?utf-8?Q?dg5r+p2poxB/nTmfr9CWymJ2DYcCfa/kdFQKm56xHo6M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N29qUnZ1M2xaQmZRdDY2RmR1TXR6bFpFbTBYMmpmRzY3b1ZLMks1bXoxdENH?=
 =?utf-8?B?UFl1UjNpRHNrSmgyZnBOQUNob2didDJpNlZNczExQndoRFVhUXZ5WUVyWnMy?=
 =?utf-8?B?VGpTckM4UVdnRVUwcEpOd29FR1VYdVlqWG5BSFhPcVVvb0RudG1nNWRyVGVN?=
 =?utf-8?B?RjkxVStwSDcraEpZRG9JZTQvRFdzU2FKMnd1S3RPYis1U2NZeEM1bWh6dzhU?=
 =?utf-8?B?ekxTYTZMcWNqUDROLzYzSHZ0Vnhnak15ZnNJbmNPUGMxK0pKM0tXM3VSNUcz?=
 =?utf-8?B?Z3lQRXlOYkh0T1FzZnFzY0pCMXRFc0JHRmFwTS9rZEh0ZVdFZHVIUHhOZHps?=
 =?utf-8?B?dzJYS1dYK1RIZ1JYY2Y4VFdUWlA0VHgyS3QxVnIvWnBkRDA1b2RMVTFPNm8y?=
 =?utf-8?B?WFZyNkdLdmVmcXlnYW1acHBzRE51K28wRUtvUmpUVHJQMGpEMHJXeFU3bFVv?=
 =?utf-8?B?U1pna3IwK2o5Nm5henczMXoxcHh0NW5IU01uN3dFb25lZFZEQkpPcDAwNXB2?=
 =?utf-8?B?TThtRkZLTkVzbTEwN2FXT2kzSElmZWVhaGxhZ1hQY2xLanJIVnRuZUYzVVdF?=
 =?utf-8?B?RnhCa1NYeTVEdENpTW9uS3J0UU9wK1FKWDdXeXJaT3hwUWtiKzBaU0s1VVlV?=
 =?utf-8?B?MGdIOWpBVlR1ZEs1NXUxeXZzT1ZhOUZGR0d4dHo0NUhjY1c5N1VRb1dZM2xH?=
 =?utf-8?B?Vm1RNUdwc1NVYlJiN2dXTGJMZzBHK1NtQjU2NVZjdExXbHowdDhiSHh0c2Uw?=
 =?utf-8?B?UEliT3VMWjA5NTNkd050bUpVelpyY0IrSlVoOTV6ZUE0bmtaemFHSWcya21H?=
 =?utf-8?B?UzAzVUNnNlVvcjZZdkxhWkdVWU1qK25rb2gzWmY3TXM5T0hiZjM5Qlk4RWlT?=
 =?utf-8?B?ZnFnemdsWVVlbXgwZFUvY1YzZXdYSEExNHRMUExhYTFmWlNlVVdwcXc5bHRJ?=
 =?utf-8?B?SE1sczBmY3dFNE01bVhIdFRXN2dPSDhPTklGdms2dDFXNk03Q05qdm9DU0RD?=
 =?utf-8?B?RUhVekV0SUVMRVFDUm92OGdtK1VVd1lWa1JXbUNOUThqQzBuNlBaQ2cvNUhj?=
 =?utf-8?B?dURhMW5uVHhTWHdGRTU5T0R4bGJsOFhFU2VsSjAyS3VRaUZpd0JscXVHb0c3?=
 =?utf-8?B?Mit5eDZKRDRCdFdyenUybUNwNmZ5c1h0cnV2d3Avd2g3NEJYMksrdDRaRTBo?=
 =?utf-8?B?SUdRYmRBUm5UZ0RyYzVBUy8rcUNuRkVsS0liTmtISFl4T2pYUnJTbFVBcGRl?=
 =?utf-8?B?M0FCRjNTRUF0VE9iZENncEZud3lsaTdnNWMwZXBCNnoxMGh2eGNSbGxwTjRY?=
 =?utf-8?B?Y3lNSmN1ZXVNa0hQdU51Y1FQRDllZ2RMMnZnV0ZuWE1iMWkzM2FhN29WdFd3?=
 =?utf-8?B?NzJoREVXaTI1N1N6ZlBUNW5TNjJXMUprTEw1elVhL0tIU016MFFNMEQ4ZE1p?=
 =?utf-8?B?NTh1VGZLVG9wTzJkbXEvS09udENTNFVOOVgyUlgraTJtbDVrWlhkUWFYTUtP?=
 =?utf-8?B?L0ErMHoxQzhzYVVqOGRPajh0SWlOWTYzbU1tOHc3Mi9TdGNYZkwrdnBoQ3Ev?=
 =?utf-8?B?dUM0TDVYRGNNVEdVemZqbWZKVDFWcmxHTnhMQ0p2cFdLbXdjQ2VWV3NER1h2?=
 =?utf-8?B?djIzWVlXYlB5T29wUGhjMktIUitnZ0h6d0dLSWhuOXBNcHJ3dkFQMmUzQzJp?=
 =?utf-8?B?ZkQwRTlOWWFLVlBhT1oraWxXZjZFNG5ZdEd3QWJkNUN5ckNObGFoMmJFcFV2?=
 =?utf-8?B?bjZmVEJWaVpnVnBzZlh2OHNoNUJpS1JpZHd5SWIrRithcXd5cXpvazdlT0RE?=
 =?utf-8?B?V0ZXUkpxSTUvaDhkelh3T2pnMFJiZGgwQlREZEZyNlRHWFlrdkdJem9BRnJa?=
 =?utf-8?B?SVUrYnZhQkpaWWcydjVzQ3N6SVdkTkZFNXc1ejllS2daMzRYdnIzNSswalhV?=
 =?utf-8?B?dTBteFJsQnJmbjFoanJUR010TEZ6NDhjeGZFbGhrQkZYaWtaZ2N6bGkzaEdK?=
 =?utf-8?B?V1VmdE9zRnU0d1h0Z2htNVdFR05SUjNrRzBNQ09vYTJ0dUsyQkowZGYvSXNI?=
 =?utf-8?B?ejVhSFFYcGlWUXlESUNxNDkyVjg3ZjNPUVZEZnNEOGxQdnFBRkJaZjVscHM3?=
 =?utf-8?Q?HAbO8Z6F8ESt/A8BtPSULVBqT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b3ab8169-c457-44fc-0312-08dcde5d8934
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 19:00:49.8270 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bErnwC2/qtHuHkF6B7/cJ3022yjOXH+09RyKCaQK2+DBRM4x/lZLN52JLN8gTBGGsoKVcVsX11JIiefdK4SF2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4619
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

All failed test is not related to this patch.

Regards,
Zhanjun

On 2024-09-26 2:20 p.m., Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe: Prevent null pointer access in xe_migrate_copy (rev2)
> *URL:*	https://patchwork.freedesktop.org/series/138889/ 
> <https://patchwork.freedesktop.org/series/138889/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/index.html 
> <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/index.html>
> 
> 
>   CI Bug Log - changes from
>   xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b_full ->
>   xe-pw-138889v2_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-138889v2_full absolutely need 
> to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-138889v2_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
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
> Here are the unknown changes that may have been introduced in 
> xe-pw-138889v2_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-1/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-lnl-2/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html> +1 other test fail
>   *
> 
>     igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-5/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-lnl-7/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html>
>   *
> 
>     igt@xe_pm@s4-vm-bind-unbind-all:
> 
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbind-all.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbind-all.html> +3 other tests dmesg-warn
>   *
> 
>     igt@xe_query@multigpu-query-invalid-extension:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@xe_query@multigpu-query-invalid-extension.html> +2 other tests skip
> 
> 
>         Warnings
> 
>   * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-464/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html> +14 other tests skip
> 
> 
>         Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   *
> 
>     igt@kms_atomic@plane-primary-overlay-mutable-zpos:
> 
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-4/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html> (Intel XE#2385 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-bmg-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html>
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:
> 
>       o {shard-bmg}: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html> +2 other tests incomplete
>   *
> 
>     igt@kms_big_fb@4-tiled-32bpp-rotate-90:
> 
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html> (Intel XE#2327 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-bmg-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html> +7 other tests skip
>   *
> 
>     igt@kms_big_fb@y-tiled-16bpp-rotate-180:
> 
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-bmg-6/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html> +16 other tests skip
>   *
> 
>     igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
> 
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html> (Intel XE#607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/607>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html>
>   *
> 
>     igt@kms_bw@linear-tiling-2-displays-2160x1440p:
> 
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html> +4 other tests skip
>   *
> 
>     igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
> 
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html> (Intel XE#2251 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-bmg-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html> +21 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
> 
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html> (Intel XE#2652 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-bmg-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html> +1 other test skip
>   *
> 
>     igt@kms_cdclk@mode-transition-all-outputs:
> 
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-4/igt@kms_cdclk@mode-transition-all-outputs.html> (Intel XE#2724 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-bmg-6/igt@kms_cdclk@mode-transition-all-outputs.html>
>   *
> 
>     igt@kms_chamelium_color@degamma:
> 
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-4/igt@kms_chamelium_color@degamma.html> (Intel XE#2325 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-bmg-6/igt@kms_chamelium_color@degamma.html> +1 other test skip
>   *
> 
>     igt@kms_chamelium_hpd@common-hpd-after-suspend:
> 
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-5/igt@kms_chamelium_hpd@common-hpd-after-suspend.html> (Intel XE#2252 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-bmg-6/igt@kms_chamelium_hpd@common-hpd-after-suspend.html> +14 other tests skip
>   *
> 
>     igt@kms_content_protection@atomic-dpms:
> 
>       o {shard-bmg}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html> (Intel XE#1178 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html>
>   *
> 
>     igt@kms_content_protection@mei-interface:
> 
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-3/igt@kms_content_protection@mei-interface.html> (Intel XE#2341 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-bmg-6/igt@kms_content_protection@mei-interface.html>
>   *
> 
>     igt@kms_content_protection@uevent:
> 
>       o {shard-bmg}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-5/igt@kms_content_protection@uevent.html> (Intel XE#1188 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-bmg-6/igt@kms_content_protection@uevent.html>
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-128x42:
> 
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-128x42.html> (Intel XE#2320 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-128x42.html> +8 other tests skip
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-toggle:
> 
>       o {shard-bmg}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html> +13 other tests skip
>   *
> 
>     igt@kms_dsc@dsc-basic:
> 
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-2/igt@kms_dsc@dsc-basic.html> (Intel XE#2244 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-bmg-6/igt@kms_dsc@dsc-basic.html> +2 other tests skip
>   *
> 
>     igt@kms_fbcon_fbt@fbc-suspend:
> 
>       o {shard-bmg}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-4/igt@kms_fbcon_fbt@fbc-suspend.html> (Intel XE#1695 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-bmg-6/igt@kms_fbcon_fbt@fbc-suspend.html>
>   *
> 
>     igt@kms_fbcon_fbt@psr-suspend:
> 
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-3/igt@kms_fbcon_fbt@psr-suspend.html> (Intel XE#776 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/776>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-bmg-6/igt@kms_fbcon_fbt@psr-suspend.html> +1 other test skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
> 
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html> (Intel XE#2380 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html> +5 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
> 
>       o {shard-bmg}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html> (Intel XE#2333 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html> +12 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
> 
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html> +41 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
> 
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html> (Intel XE#2352 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html>
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
> 
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html> +42 other tests skip
>   *
> 
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html> (Intel XE#2501 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-bmg-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-20x20:
> 
>       o {shard-bmg}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-20x20.html> (Intel XE#2566 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-20x20.html>
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
> 
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html> +1 other test skip
>   *
> 
>     igt@kms_pm_backlight@fade:
> 
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-2/igt@kms_pm_backlight@fade.html> (Intel XE#870 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-bmg-6/igt@kms_pm_backlight@fade.html> +1 other test skip
>   *
> 
>     igt@kms_properties@connector-properties-legacy:
> 
>       o {shard-bmg}: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-5/igt@kms_properties@connector-properties-legacy.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-bmg-6/igt@kms_properties@connector-properties-legacy.html> +136 other tests skip
>   *
> 
>     igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
> 
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html> (Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-bmg-6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html> +3 other tests skip
>   *
> 
>     igt@kms_psr@psr-cursor-plane-onoff:
> 
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-3/igt@kms_psr@psr-cursor-plane-onoff.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-bmg-6/igt@kms_psr@psr-cursor-plane-onoff.html> +18 other tests skip
>   *
> 
>     igt@kms_rotation_crc@cursor-rotation-180:
> 
>       o {shard-bmg}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-4/igt@kms_rotation_crc@cursor-rotation-180.html> (Intel XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-bmg-6/igt@kms_rotation_crc@cursor-rotation-180.html> +1 other test skip
>   *
> 
>     igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
> 
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-4/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html> (Intel XE#2329 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-bmg-6/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html> +1 other test skip
>   *
> 
>     igt@kms_scaling_modes@scaling-mode-full-aspect:
> 
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-full-aspect.html> (Intel XE#2413 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-full-aspect.html>
>   *
> 
>     igt@kms_vrr@seamless-rr-switch-drrs:
> 
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-4/igt@kms_vrr@seamless-rr-switch-drrs.html> (Intel XE#1499 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-drrs.html> +1 other test skip
>   *
> 
>     igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
> 
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html> (Intel XE#2849 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-bmg-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html>
>   *
> 
>     igt@xe_pat@pat-index-xelpg:
> 
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-2/igt@xe_pat@pat-index-xelpg.html> (Intel XE#2236 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-bmg-1/igt@xe_pat@pat-index-xelpg.html>
>   *
> 
>     igt@xe_pm@s2idle-d3cold-basic-exec:
> 
>       o {shard-bmg}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-bmg-7/igt@xe_pm@s2idle-d3cold-basic-exec.html> +11 other tests skip
> 
> 
>     Known issues
> 
> Here are the changes found in xe-pw-138889v2_full that come from known 
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
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:
> 
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033>)
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html> (Intel XE#1426 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426>) +1 other test fail
>   *
> 
>     igt@kms_big_fb@4-tiled-8bpp-rotate-180:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-8/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +5 other tests skip
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html> (Intel XE#1659 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659>)
>   *
> 
>     igt@kms_big_fb@linear-32bpp-rotate-90:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-6/igt@kms_big_fb@linear-32bpp-rotate-90.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +2 other tests skip
>   *
> 
>     igt@kms_big_fb@linear-8bpp-rotate-270:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-435/igt@kms_big_fb@linear-8bpp-rotate-270.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>   *
> 
>     igt@kms_big_fb@y-tiled-8bpp-rotate-0:
> 
>       o shard-adlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-8/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html> (Intel XE#1874 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>)
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1 other test skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +2 other tests skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-6/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#2191 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>   *
> 
>     igt@kms_bw@linear-tiling-1-displays-1920x1080p:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-8/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +2 other tests skip
>   *
> 
>     igt@kms_bw@linear-tiling-2-displays-2160x1440p:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>   *
> 
>     igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-435/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +13 other tests skip
>   *
> 
>     igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +3 other tests skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +29 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-8/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1252 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252>)
>   *
> 
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +5 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4.html> (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +20 other tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-8/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +19 other tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) +2 other tests incomplete
>   *
> 
>     igt@kms_chamelium_color@gamma:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-6/igt@kms_chamelium_color@gamma.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>   *
> 
>     igt@kms_chamelium_frames@hdmi-crc-single:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-single.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>)
>   *
> 
>     igt@kms_chamelium_hpd@hdmi-hpd-fast:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-8/igt@kms_chamelium_hpd@hdmi-hpd-fast.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +2 other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +2 other tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-random-512x512:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-8/igt@kms_cursor_crc@cursor-random-512x512.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) +1 other test skip
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-512x512:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x512.html> (Intel XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>)
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-max-size:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-max-size.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1 other test skip
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#309 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>)
>   *
> 
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +3 other tests skip
>   *
> 
>     igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#310 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/310>) +3 other tests skip
>   *
> 
>     igt@kms_flip@2x-flip-vs-suspend-interruptible@bd-hdmi-a6-dp4:
> 
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend-interruptible@bd-hdmi-a6-dp4.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
>   *
> 
>     igt@kms_flip@flip-vs-absolute-wf_vblank:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) +1 other test fail
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1 other test skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
> 
>       o shard-adlp: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +1 other test dmesg-fail
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +2 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
> 
>       o shard-adlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html> (Intel XE#1861 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +25 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +4 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +4 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +6 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +5 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +4 other tests skip
>   *
> 
>     igt@kms_pm_backlight@fade:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-8/igt@kms_pm_backlight@fade.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#870 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>   *
> 
>     igt@kms_pm_backlight@fade-with-dpms:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html> (Intel XE#870 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>   *
> 
>     igt@kms_pm_backlight@fade-with-suspend:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-4/igt@kms_pm_backlight@fade-with-suspend.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-lnl-3/igt@kms_pm_backlight@fade-with-suspend.html> (Intel XE#2625 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625>) +1 other test abort
>   *
> 
>     igt@kms_pm_rpm@modeset-non-lpsp-stress:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#836 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/836>)
>   *
> 
>     igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html> (Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>   *
> 
>     igt@kms_psr@psr2-primary-page-flip:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@kms_psr@psr2-primary-page-flip.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +1 other test skip
>   *
> 
>     igt@kms_psr@psr2-primary-render:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-435/igt@kms_psr@psr2-primary-render.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +2 other tests skip
>   *
> 
>     igt@kms_tv_load_detect@load-detect:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-8/igt@kms_tv_load_detect@load-detect.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#330 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/330>)
>   *
> 
>     igt@kms_writeback@writeback-fb-id:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-435/igt@kms_writeback@writeback-fb-id.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>   *
> 
>     igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html> (Intel XE#2849 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849>)
>   *
> 
>     igt@xe_ccs@ctrl-surf-copy-new-ctx:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-8/igt@xe_ccs@ctrl-surf-copy-new-ctx.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#488 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/488>)
>   *
> 
>     igt@xe_compute_preempt@compute-preempt-many:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html> (Intel XE#1280 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1 other test skip
>   *
> 
>     igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-5/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-lnl-5/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html> (Intel XE#2667 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667>)
>   *
> 
>     igt@xe_evict@evict-beng-mixed-many-threads-large:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-large.html> (Intel XE#1000 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000>)
>   *
> 
>     igt@xe_evict@evict-small-external-cm:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-6/igt@xe_evict@evict-small-external-cm.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#261 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/261> / Intel XE#688 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +3 other tests skip
>   *
> 
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +3 other tests skip
>   *
> 
>     igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-1/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-lnl-5/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate.html> (Intel XE#1069 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069>)
>   *
> 
>     igt@xe_exec_fault_mode@once-bindexecqueue-userptr:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-8/igt@xe_exec_fault_mode@once-bindexecqueue-userptr.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +23 other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@twice-bindexecqueue-imm:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-6/igt@xe_exec_fault_mode@twice-bindexecqueue-imm.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +1 other test skip
>   *
> 
>     igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>)
>   *
> 
>     igt@xe_exec_reset@parallel-gt-reset:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@xe_exec_reset@parallel-gt-reset.html> -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@xe_exec_reset@parallel-gt-reset.html> (Intel XE#2105 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105>)
>   *
> 
>     igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-6/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#2229 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229>)
>   *
> 
>     igt@xe_oa@invalid-map-oa-buffer:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-8/igt@xe_oa@invalid-map-oa-buffer.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +3 other tests skip
>   *
> 
>     igt@xe_oa@map-oa-buffer:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@xe_oa@map-oa-buffer.html> (Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>)
>   *
> 
>     igt@xe_oa@non-zero-reason:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-435/igt@xe_oa@non-zero-reason.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +1 other test skip
>   *
> 
>     igt@xe_pm@s3-d3cold-basic-exec:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html> (Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>   *
> 
>     igt@xe_pm@s4-vm-bind-userptr:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-1/igt@xe_pm@s4-vm-bind-userptr.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html> (Intel XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-adlp-6/igt@xe_pm@s4-vm-bind-userptr.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html> (Intel XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
> 
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html> +1 other test pass
>   *
> 
>     igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html> (Intel XE#1426 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-lnl-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html> +1 other test pass
>   *
> 
>     igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-433/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html> (Intel XE#1426 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-464/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html> +1 other test pass
>   *
> 
>     igt@kms_big_fb@4-tiled-64bpp-rotate-180:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html> (Intel XE#1659 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html> +1 other test pass
>   *
> 
>     igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
> 
>       o shard-adlp: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-adlp-4/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-8/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html>
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
> 
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html>
>   *
> 
>     igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
> 
>       o {shard-bmg}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-bmg-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html>
>   *
> 
>     igt@kms_cursor_legacy@single-move@pipe-a:
> 
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-435/igt@kms_cursor_legacy@single-move@pipe-a.html> (Intel XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-436/igt@kms_cursor_legacy@single-move@pipe-a.html> +1 other test pass
>   *
> 
>     igt@kms_cursor_legacy@torture-move:
> 
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-adlp-8/igt@kms_cursor_legacy@torture-move.html> (Intel XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-1/igt@kms_cursor_legacy@torture-move.html> +1 other test pass
>   *
> 
>     igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4:
> 
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4.html> +1 other test pass
>   *
> 
>     igt@kms_flip@2x-plain-flip-ts-check-interruptible@bd-dp2-hdmi-a3:
> 
>       o {shard-bmg}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible@bd-dp2-hdmi-a3.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-bmg-7/igt@kms_flip@2x-plain-flip-ts-check-interruptible@bd-dp2-hdmi-a3.html> +8 other tests pass
>   *
> 
>     igt@kms_flip@absolute-wf_vblank:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-8/igt@kms_flip@absolute-wf_vblank.html> (Intel XE#2631 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2631>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-lnl-1/igt@kms_flip@absolute-wf_vblank.html> +1 other test pass
>   *
> 
>     igt@kms_flip@blocking-wf_vblank:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-5/igt@kms_flip@blocking-wf_vblank.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-lnl-5/igt@kms_flip@blocking-wf_vblank.html> +4 other tests pass
>   *
> 
>     igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@b-edp1:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-4/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@b-edp1.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-lnl-3/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@b-edp1.html> +1 other test pass
>   *
> 
>     igt@kms_plane@plane-position-covered:
> 
>       o shard-lnl: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-3/igt@kms_plane@plane-position-covered.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-lnl-7/igt@kms_plane@plane-position-covered.html> +2 other tests pass
>   *
> 
>     igt@kms_plane@plane-position-hole@pipe-b-plane-2:
> 
>       o shard-lnl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html> +2 other tests pass
>   *
> 
>     igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-256:
> 
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-464/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-256.html> (Intel XE#616 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-466/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-256.html> +1 other test pass
>   *
> 
>     igt@kms_plane_cursor@viewport:
> 
>       o {shard-bmg}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-8/igt@kms_plane_cursor@viewport.html> (Intel XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-bmg-8/igt@kms_plane_cursor@viewport.html> +8 other tests pass
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:
> 
>       o {shard-bmg}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html> (Intel XE#2566 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-bmg-7/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html>
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b:
> 
>       o {shard-bmg}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-bmg-7/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b.html> +3 other tests pass
>   *
> 
>     igt@kms_rotation_crc@multiplane-rotation-cropping-top:
> 
>       o {shard-bmg}: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-6/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html> (Intel XE#2870 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2870>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-bmg-7/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html>
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak.html> (Intel XE#899 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak.html> +1 other test pass
>   *
> 
>     igt@xe_evict@evict-mixed-many-threads-small:
> 
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html> +1 other test pass
>   *
> 
>     igt@xe_pm@s2idle-multiple-execs:
> 
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-adlp-4/igt@xe_pm@s2idle-multiple-execs.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-1/igt@xe_pm@s2idle-multiple-execs.html> +2 other tests pass
>   *
> 
>     igt@xe_pm@s4-basic-exec:
> 
>       o shard-adlp: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-adlp-9/igt@xe_pm@s4-basic-exec.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607> / Intel XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-6/igt@xe_pm@s4-basic-exec.html>
>   *
> 
>     igt@xe_pm@s4-mocs:
> 
>       o shard-adlp: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-adlp-9/igt@xe_pm@s4-mocs.html> (Intel XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-8/igt@xe_pm@s4-mocs.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_big_fb@linear-16bpp-rotate-270:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-463/igt@kms_big_fb@linear-16bpp-rotate-270.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html> (Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +4 other tests skip
>   *
> 
>     igt@kms_big_fb@x-tiled-32bpp-rotate-270:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html> (Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-466/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>   *
> 
>     igt@kms_big_fb@y-tiled-64bpp-rotate-270:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-466/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1 other test skip
>   *
> 
>     igt@kms_big_fb@y-tiled-addfb:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#619 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/619>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb.html> (Intel XE#619 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/619>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +3 other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-addfb-size-overflow:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html> (Intel XE#610 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/610>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#610 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/610>)
>   *
> 
>     igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html> (Intel XE#2191 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#2191 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>   *
> 
>     igt@kms_bw@linear-tiling-2-displays-2560x1440p:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>   *
> 
>     igt@kms_bw@linear-tiling-2-displays-3840x2160p:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +4 other tests skip
>   *
> 
>     igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +11 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +7 other tests skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html> (Intel XE#1252 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1252 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252>)
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html> (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +41 other tests skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-6:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-6.html> (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-6.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +27 other tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> 
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
>   *
> 
>     igt@kms_chamelium_audio@hdmi-audio-edid:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_chamelium_audio@hdmi-audio-edid.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-435/igt@kms_chamelium_audio@hdmi-audio-edid.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +2 other tests skip
>   *
> 
>     igt@kms_chamelium_color@ctm-limited-range:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-464/igt@kms_chamelium_color@ctm-limited-range.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html> (Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +1 other test skip
>   *
> 
>     igt@kms_chamelium_color@ctm-max:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_chamelium_color@ctm-max.html> (Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-466/igt@kms_chamelium_color@ctm-max.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>   *
> 
>     igt@kms_chamelium_hpd@vga-hpd:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +6 other tests skip
>   *
> 
>     igt@kms_content_protection@dp-mst-lic-type-0:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-0.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#307 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html> (Intel XE#307 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>) +1 other test skip
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-512x512:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x512.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html> (Intel XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) +1 other test skip
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-512x512:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html> (Intel XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x512.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) +1 other test skip
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html> (Intel XE#323 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#323 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>   *
> 
>     igt@kms_feature_discovery@chamelium:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_feature_discovery@chamelium.html> (Intel XE#701 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/701>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-435/igt@kms_feature_discovery@chamelium.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#701 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/701>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +6 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +11 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +17 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-tiling-y:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html> (Intel XE#658 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#658 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +7 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#658 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +9 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@plane-fbc-rte:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html> (Intel XE#1158 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-435/igt@kms_frontbuffer_tracking@plane-fbc-rte.html> (Intel XE#1158 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +17 other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +5 other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
> 
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +19 other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +8 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +11 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
> 
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-adlp-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +29 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +17 other tests skip
>   *
> 
>     igt@kms_pm_backlight@bad-brightness:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html> (Intel XE#870 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-466/igt@kms_pm_backlight@bad-brightness.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#870 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>   *
> 
>     igt@kms_pm_backlight@fade-with-dpms:
> 
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-adlp-6/igt@kms_pm_backlight@fade-with-dpms.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-1/igt@kms_pm_backlight@fade-with-dpms.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#870 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>) +3 other tests skip
>   *
> 
>     igt@kms_pm_backlight@fade-with-suspend:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-436/igt@kms_pm_backlight@fade-with-suspend.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html> (Intel XE#870 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>   *
> 
>     igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html> (Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-466/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>   *
> 
>     igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-436/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html> (Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +2 other tests skip
>   *
> 
>     igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-463/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-466/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +15 other tests skip
>   *
> 
>     igt@kms_psr@fbc-psr2-sprite-plane-onoff:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +6 other tests skip
>   *
> 
>     igt@kms_psr@pr-dpms:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_psr@pr-dpms.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-435/igt@kms_psr@pr-dpms.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +6 other tests skip
>   *
> 
>     igt@kms_psr@psr-cursor-plane-move:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-463/igt@kms_psr@psr-cursor-plane-move.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@kms_psr@psr-cursor-plane-move.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>)
>   *
> 
>     igt@kms_psr@psr-dpms:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-466/igt@kms_psr@psr-dpms.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-433/igt@kms_psr@psr-dpms.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +56 other tests skip
>   *
> 
>     igt@kms_rotation_crc@bad-pixel-format:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-463/igt@kms_rotation_crc@bad-pixel-format.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#327 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-format.html> (Intel XE#327 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>)
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#362 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/362>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html> (Intel XE#1729 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729>)
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#362 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/362>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1500 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500>)
>   *
> 
>     igt@kms_writeback@writeback-check-output-xrgb2101010:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-436/igt@kms_writeback@writeback-check-output-xrgb2101010.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html> (Intel XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>   *
> 
>     igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-436/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1280 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html> (Intel XE#1280 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1 other test skip
>   *
> 
>     igt@xe_copy_basic@mem-set-linear-0xfffe:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfffe.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +12 other tests skip
>   *
> 
>     igt@xe_evict@evict-mixed-many-threads-small:
> 
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-adlp-8/igt@xe_evict@evict-mixed-many-threads-small.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#261 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/261>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-1/igt@xe_evict@evict-mixed-many-threads-small.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#261 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/261> / Intel XE#688 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +32 other tests skip
>   *
> 
>     igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
> 
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-adlp-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +47 other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@many-basic:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@xe_exec_fault_mode@many-basic.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-466/igt@xe_exec_fault_mode@many-basic.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +2 other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +3 other tests skip
>   *
> 
>     igt@xe_mmap@small-bar:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-463/igt@xe_mmap@small-bar.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#512 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/512>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@xe_mmap@small-bar.html> (Intel XE#512 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/512>)
>   *
> 
>     igt@xe_oa@mmio-triggered-reports:
> 
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-adlp-8/igt@xe_oa@mmio-triggered-reports.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-1/igt@xe_oa@mmio-triggered-reports.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +30 other tests skip
>   *
> 
>     igt@xe_oa@oa-tlb-invalidate:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-436/igt@xe_oa@oa-tlb-invalidate.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@xe_oa@oa-tlb-invalidate.html> (Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +3 other tests skip
>   *
> 
>     igt@xe_oa@oa-unit-concurrent-oa-buffer-read:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@xe_oa@oa-unit-concurrent-oa-buffer-read.html> (Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-466/igt@xe_oa@oa-unit-concurrent-oa-buffer-read.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +1 other test skip
>   *
> 
>     igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-434/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-463/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +20 other tests skip
>   *
> 
>     igt@xe_pat@pat-index-xe2:
> 
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-adlp-6/igt@xe_pat@pat-index-xe2.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-adlp-2/igt@xe_pat@pat-index-xe2.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#977 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/977>)
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-466/igt@xe_pat@pat-index-xe2.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-435/igt@xe_pat@pat-index-xe2.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#977 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/977>)
>   *
> 
>     igt@xe_pm@s2idle-d3cold-basic-exec:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-436/igt@xe_pm@s2idle-d3cold-basic-exec.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec.html> (Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * Linux: xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b ->
>     xe-pw-138889v2
> 
> IGT_8032: 8032
> xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b: 
> 88d592f72f7bc508d6a027b1f96aa2e53f803e1b
> xe-pw-138889v2: 138889v2
> 
