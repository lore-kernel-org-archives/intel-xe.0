Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197F2606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 11:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Z7OxtuGv;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=e0nV1aOA
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D524B10E28A;
	Thu, 26 Nov 2026 11:26:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D131D10E28A
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 11:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795692356; x=1827228356;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xaEk0nE5xqT4yGYfCAzZIRYeeh28RAhVPSU1CE6YS1E=;
 b=Z7OxtuGv8qleznLJFoF3t0uc2sMAEeB8mvp3XLwUvpQJlhZ3fsMU8Vl7
 rINA+TcckJANGmAzD+nTz1ueKT9g+u07ZrMS0+70Momc1fIE1VdrNbj+Q
 QPyMCH8wsyVXoEc4Bx9VgRLQC/yRvi0zCsVJ43Ei643+gyVF5QwIjRHon
 Vq0R7q6gWhgumBDFHQASfxfnxVs6EkQdJ+0wa4bLx9FcHOkFrGorFiD0H
 aM7bHx2E+1KYz10I9SH53UjdSDHMtOnBMZpqDnhsMW76BR6bHiuni0v/o
 h6IavBXjA2SLlQpvaucDcAQ6KLYrKZc2Z5VTmNyqKdGmImsK2lD8BEYRB Q==;
X-CSE-ConnectionGUID: crHbyLEuQFSBKuyXTJa4ww==
X-CSE-MsgGUID: cZcCJcMwSbKFyvr1h+Z/0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4567622"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4567622"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 03:25:55 -0800
X-CSE-ConnectionGUID: INFPOzeTQbaA68ZfEcfRjQ==
X-CSE-MsgGUID: KvNY5+e1QVa4Dl+pFHvkdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12175020"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 03:25:56 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 03:25:52 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 03:25:52 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.16)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 03:25:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s/Bas91A+M0W2E3QCa2I+qHiu0bK6hKOTQgwvraS+yrly4f5pTM6yTcOxlJ0V2N5xZdvbkExn9YCQ3ztMS1wkpThI5ji3KTWtWYPNWzNEWzoNTAReLFTeu3BHCzhuAmeEYqz8NiyuEI5PquEj2giI6bKCwGxY0l9OvEtS+PTWNRW/92D51FwEkaaS9xo72J00ctUErtSYzQqRRfyKVBMOvRpzMWeKsO8zxXDKg4xZpYfFQ2uJ07Sn602GpaxjQNnxpC4S5DPfAZcMQ931fzO0tdw8lUFbSzJevxM5ZxWGggb4jy87eJ4VChP/ohDt78VCkVn42Vk8hysTFq3syaQwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u4XIl2Gy3eZfL2mFuSC5vZZqsHBy/7It9L/3tZsUTzE=;
 b=gnanMj9C/An09azjVV+5f+jIndYhfXY2rkyTb+7Zo7Js4isZNiBX1kfqEyAw/F5tLOUMYNFKdy2/dq1grcfbHz3FdUqAizP1wVTYnXADks1XkZuFXaHDNag9A9jx8GkNYeAiDwisFBWVd0Ulw22xKL/uVnhU+xcbu2HZdzw4d4idLeWyOd+hJv5OWf6VyqXXV33o3owAO/IWVNRbCJqqVadtuZRnJEw8+KX2Q43oCntYgW7ngp5D76Z3H445PglczhXR2Q0xo9FfdPUV1nUumhT7o+KQUiGCJO2FQ/DG34RHb+PQOu5AT0+4+EV1nmaaJhDg3/nv2PP7uvAS9WXscw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4XIl2Gy3eZfL2mFuSC5vZZqsHBy/7It9L/3tZsUTzE=;
 b=e0nV1aOA4xosYEUZcSGpOWm6oVQW1wJ5uWBrfAK3tC5Rlx70L9S7spih32tq0N17/EA0J0zPoHDvc00+K5Z1c9r6wedpuQyaxqQkjhWBH2oGrLkwq4mhaIA7Eb2DxbQFWYmw3JBhEzYu7iy8Px9/AHIPBt63jPLNK3rNNainjmE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 by SJ1PR11MB6131.namprd11.prod.outlook.com (2603:10b6:a03:45e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 11:25:49 +0000
Received: from IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f]) by IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 11:25:49 +0000
Message-ID: <6ccd001b-150b-41a3-a6be-ca49d16ed9c0@intel.com>
Date: Thu, 26 Nov 2026 16:55:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/ras: Add SIGID logging for fabric errors
To: Riana Tauro <riana.tauro@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20261126095356.2153941-2-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261126095356.2153941-2-riana.tauro@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0004.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::14) To IA0PR11MB7862.namprd11.prod.outlook.com
 (2603:10b6:208:3dc::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7862:EE_|SJ1PR11MB6131:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eabd97e-7909-4497-b205-08df4bb005bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|10067099003|56012099006|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: Pe0DrVbb3nB90b5C1Q0S/A9nvwqNR7aV/Nt9srrnWpd/JyAP4H5yKYx/LrRm5LTlCIuoVxI4jHefcM8zIUoB/ikFyKp3NWHIL3DVEvwH5j4/+k2u7xQyQYIMS/1q1LxYOsPFSks8BRiE6/aVFX5MjL6ni+tl03I2XfcyK7gAYo6NpFas0wKhqb5chb+L643n9Rins8qb//0+UmbiWIcK1+9x9+uQ6RDTdHMc2pVMJgm+qYd3UECK5saNnM8hVkBKWGmKdbovvPnl2pjKwg9AwB7kcwMIL3TsqC4cxZmPjGgyxTHPhyZZpiPGOxTlBjN6eAihbT+R3+WfB06pKZiH5Zp7Bb079ZEsTvQTR2qnJ8tLMXVCRxbNtzal43qy+Wuxa+1zfSXhlAshoC71RXQ12OJSzgioc+qOy/Y/ocEabXsPO3OgHLtm79lAbXm0py7Yyd33DDxBQQZTMM/hwPT3geacWlIipYj1TGbImUF9RskywUziTne3pOgImhuyrGjXXbvVgcXuKWtR0/Hqbwj1TsJmF81RjogDdgXERz12bdM65Kyg+bj8pjh5c8naghhB8Bp0mStp/tq49qn+YzEs53mTAy6RV/qo9LloLd6zYA7Mo/Cl3t2MuUWzVYdrlTcvsDdNSmKRtQ6EKMTOZx4ZzEd7Eh47lQaIEDm+5cJD8O0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7862.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(56012099006)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2QxZjBGanNYVU9oOG1FWnFEOFIreXBQcHdVeHNjTi9Qak1hUnJOWDBNMDRN?=
 =?utf-8?B?NzRSY01oTUhIUVZzdXgydTVoZ0kwajhCVXN2SXVTZGJNeWJKajUvU3lRKzRM?=
 =?utf-8?B?OElQWXppdHRKWDExUTByVlM3a1NGcW9VUWRYMjlBY2liRVVxSCtIMVU3ekV4?=
 =?utf-8?B?dndxc2c1Uzc2RmNLTjJMdzNTVUYvd1JReXM3WGJ0am5mTk1iR3hDbnpqQTFn?=
 =?utf-8?B?OHNFVThxbEd3TTZTc2pOVnY0MVY4R3lqZnBRejR6NlRQZldVWm9Rc3d2YnNo?=
 =?utf-8?B?enY3a2RPb3ZLR1BDK3VSVktRdXJvelhPMG9lWHA3K1lPbHUvTjRDOFhEdHJE?=
 =?utf-8?B?dEkxalZSYmFDckZuelVpa045bzMwT2NGaVVQS0RvbVRnTklNZWVaZG9oQ3pr?=
 =?utf-8?B?NEV0YmNMVURkdWxvNStMR01rbUxSU1h5bDN2U1dOQW4zaWlNSmNNYkVadjNs?=
 =?utf-8?B?VlN1cnA0Q1JMUFYyWTdHNCtnZmc0ZzlvanJEMnlMdmJKTnZTSUMwY2ZkUkti?=
 =?utf-8?B?Ky84a2VTcEpWMVljQ0RIazJpd1FEd01FMmQxbEVMRmx1blJxRFpyS3hiSVk1?=
 =?utf-8?B?UGFnOUp1NTVZWEpudXhKVXJRM052Qjd6YWkra1BOTTJta0YrbmlCRnJ1UWRT?=
 =?utf-8?B?V21xR1J5NVdKZHUvRkdyYmhlKzFLcm5VYm55T2orU0xWemJnN0YwUEg0REF0?=
 =?utf-8?B?RUVKTEdoSjV4dWg1WUF3R1E3Mkdyd0NvRHRDY2lZZlBUUzFVZ3Z1cW9HWko2?=
 =?utf-8?B?bjZwQjhQWUhETlNEMjRycUdkWnBWdUFET2x6d2tkb1JIZVNvc3VrYVByTjRV?=
 =?utf-8?B?Z2xoUiswbnZyWkRBSkcxQjVhb2hjRXJnbXhBeXpvcUlORnJhZGdjVllscmlT?=
 =?utf-8?B?ZnBEUXpreGR6VER0VG1Oc1IxREk1K0dqV1FuODVCSjY2UXJvd2h1WHRqTkZO?=
 =?utf-8?B?MDdGSzU5TDhnRy8rYmR0dnlEd2VhbSt4N0p0bEF6ekc3WE1vWE1HYjd1cUZ3?=
 =?utf-8?B?Z0dBVVNrRnFPdkNaczQ2YXdYeiswVVhVYjdWc1dNM293WnBQMlY0ek9FZXlv?=
 =?utf-8?B?bld2WHErRHBiMXJNUHh2UkVlR0JFNnh5My9uWXBsMmg2cGJiUzl6dDZrVGND?=
 =?utf-8?B?WC9GZ0RGQmFDT0ZsU0U3Y0R0Z1FVcVl6MjZjU2xCQTU1eUJPMGdBZjZROExF?=
 =?utf-8?B?Mno5cmEycmoraWloMmpxYXgrR1BKUHhyS0l5K1NVTEt6c2U5V25WNHF5UXNQ?=
 =?utf-8?B?TzVEUk5DMnJNOVNKQzJKby9vbUNwZWFrTjh2Z1MrR0J2aWRHdE9SV3V2V0U5?=
 =?utf-8?B?QUZNcjlhUmtXSW5qRGF2VFdUVklVeStLK1JkakIzdUxCSVFIcUo5dytLVU1x?=
 =?utf-8?B?OU9FLzg2ZGpoUFYxUUQrNXVJTkwySDFqQUduOGhQRGxvTzhJSW14UGNNRlZO?=
 =?utf-8?B?dUtQWjNRMEhFTnhJQndIMmZLdXBEbWROL0R3dEhKVm5MZEJ1ZldlTnJWMlk5?=
 =?utf-8?B?Zys0enI5N21jNWZ4R0YyR3kyU1NwTTFEZUIvcytTSk5BdEdaNGlZeUx2OGZ2?=
 =?utf-8?B?c2VINHlkVTZVQXd3cm9HRDlTdjdkVjhBbFBoZHg1dXdlN2tZQkhJQVNRMFEz?=
 =?utf-8?B?Z1E3MkUrUkpaR3B5Tk9mVzkzSTE3d2MrS2dhMXZaaU1rbFc4MXlIMEFxNkM3?=
 =?utf-8?B?TlloVEs1dUNLNDlsbTVDOGF5TnltYVFrZ0FkaUxHeDF0ZllKbnlKck1KbnZV?=
 =?utf-8?B?K1g5blo2aTBHUitxUldIU2UyRVkzamV4Zzl0bU4weUM3bjRCZGgzMHJqZW40?=
 =?utf-8?B?dmxzTzMzbmxPZ000UFhvY2RDSkZGc1VVbm42cDNxS0QxUnJRMFNaeDJSdnFq?=
 =?utf-8?B?cGtnU1FMelNLSmw2eGZDZ1BhWnRxcnlUdkpLUlR0RmpNcmFnM2NublBiOW50?=
 =?utf-8?B?elY5dXg2dXpUSXpRMDdRV3lQbVZidGM0V2wzVzIvWkMxVVlWSndEKzRsNm1z?=
 =?utf-8?B?R0VVT2xGVk8yS2p4TEVMYU5IWWdoYmpQeUszdWtpZFgvL0JtZ2xDR0xaYUo2?=
 =?utf-8?B?VVZ5ZDBsd3J4Z0VTOXFZN2FJUVBsTEsxUzNKVzVSbjNwUU4xWWFmYk9GUGFB?=
 =?utf-8?B?ZjFyV1pwdy92Z2YyUlJiRlhQaWxlbTQrNnBubzkrSjIvUVd5ckdaVWxXRmtn?=
 =?utf-8?B?L3hvREw4bGIxbEFxc0VSRktmS1AwUmp3L0pjbmNwSFZQaDRZZFRNd1JQa0lv?=
 =?utf-8?B?WGNZNllSVUExbFJldjNBNXhpdGtKM2FmT3l6SHFsUUo5cFc4K0tNVUlrVm5I?=
 =?utf-8?B?RGRxR083Ukd6R0VTYW9MOXVyOXB0Qk1iTWZFNzBxbGFLWnRDNnJZWW91VG04?=
 =?utf-8?Q?QX/OuCvmRqggnDSs=3D?=
X-Exchange-RoutingPolicyChecked: g6ooIctwFBW5IOSsg3DzhKR1WCnOJW/yqyndwPS05FdAWJ82ZZi74fwApV+NWrZEWb+UhMh5OTKYTyLAWrhTP7h1wgAwoX1fmRD6zSUcRrLUp7TjJKPG48pHeeTgGDjn71Pgp1LDyPi7W2W7CaoPpGdXKOaM5siwpM6lntZZkFPt+kaL/QbzSCQXF9ei+MMkEBD+4QpttfMqbJOGa4HUQd+jsYnZKqTFaJcEX/Q6bbVPo7Q/MXCG9jzW/EiE+dXhlU4YtWPzouzjp53LfLzJ53oZihJ7BFlHrW8Fz8cd1SlIZs0qg4Gd/7m6i05Oxh4Xc7rIcSi2oRDKkE4n3mVV0A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eabd97e-7909-4497-b205-08df4bb005bc
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 11:25:49.6553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gCPEtRZLpY3dnnrCjjAKpslya/M3lI2xMHEGhN1KTcUJEPaarh0nO7xIClT68vUBwNdjPB3YDbMyFg8Na2E52uos4Ob3teQxO8hnaNzuXzI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6131
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 26-11-2026 03:23 pm, Riana Tauro wrote:
> Fabric errors reported by the system controller fall through to the
> default case without being logged and without generating a CPER
> record.
>
> Add SIGID logging for fabric errors, which also generates a CPER
> record.
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>

Looks good to me!

Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_ras.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 9b04be3405ca..87e721a7fd74 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -888,6 +888,11 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>   			case XE_RAS_COMP_DEVICE_MEMORY:
>   				action = handle_device_memory_errors(xe, arr);
>   				break;
> +			case XE_RAS_COMP_FABRIC:
> +				xe_log_comp(xe, ras_sev_to_cper_sev(severity), FABRIC,
> +					    &arr->counter, sizeof(arr->counter),
> +					    "error detected\n");
> +				fallthrough;
>   			default:
>   				/* For any other component, reset */
>   				action = XE_RAS_RECOVERY_ACTION_RESET;
