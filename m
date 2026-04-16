Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E5FF433E3
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 05:36:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A208410E179;
	Thu, 16 Apr 2026 05:36:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B9N1zk6S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58EDD10E179
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Apr 2026 05:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776317776; x=1807853776;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=xCQ8cSwgVZj94CuoDnAl7lB/ofGohnfuQ8s1XiGYtFc=;
 b=B9N1zk6SGjrqAU1BTQyATulbY6oLOiThgMlfVrs4JyIVkXRuhbspAYY5
 IrvwutZcphaoUT7RIdWlH+u0kThvi+8wmLUi62kKh/n+ODwNHGPKdTsDp
 FrS98ESI4JGXHWQS/qVRlDNR/6EbdWuucCmPM18s50O2hqP8IV0RLNc80
 csMCQlzt2H15Ke5XGqx6kiWB89z79Irv5frqJXkHrVftk7vBCBm6CXzlP
 NeGrRuhsbdCc69OVx4WcSf8yaKEI0LkmVbSFsQZkBTvx4r7nUYhKy7ode
 4Eo+ejW241iAmVXRlv44jLYEw9OGCjILnj6SQgFiGJyJXSJwcSinA/pnP Q==;
X-CSE-ConnectionGUID: veQw9AYcS/mRhsnN0L/ftw==
X-CSE-MsgGUID: TVAJ5ci5RJG4i+iiqLPhvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="88007278"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208,217";a="88007278"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 22:36:16 -0700
X-CSE-ConnectionGUID: NoFijW+nSIiSIlCmvpJkaA==
X-CSE-MsgGUID: 6uO9EI7WRoq9XUcQBBLbRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
 d="scan'208,217";a="230874701"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 22:36:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 22:34:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 22:34:46 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.22) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 22:33:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JvJFf+D8dmr5Kh5caUyBw+9W/+dDyu5lk7ir/9P1K9EFVMul3y9P4Ub3YnQLqtAM5eziFR4Fb8PA8issAQdXlz8swhU7/UVgDTQ7iOYzCRFDttnZh4TOX57KnjTfeJ9p58nUH147fithE9Xx1PmYpbdDk7Vm4Qhg3XlgffHxkPyie5h+17SEFKy6mL5ZYFn5WoGA3H0z8yY91CVRB5arYE61/RaBg0cRfh8Lan5JLswsr2LtHiPOgoet1Vwpb1P0xa/XqccWygwTtTBu7P0ZpzNX654v3u1FkAzZ6WV/VhNeaaQBObmsLmnWdPwsViScgeIGmdlh8DgOJndcVL/How==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9YlUzaA9XC/cIZ+gNsmKBleCsq+4Z78fTNFOxB1QGKc=;
 b=e0Ik/P7U8QOYjNA58E8kTL4lHEJf/bNE/kgKS20bI1p8xl6+zPGNnpGJKJKvwArO+TkQVdqcvROxVP7KZ2BdIQpVC8Fb1cmbN/KTNjAe4KuauA3v0JdWRFT1o3kxjW5eS9ejaUuikvXFm383U4GQiurZx1HT3p8NhR7+ixjMWkxZbwqwhrK/3lP4npC/Tl0gBRlOP+Obk8QXWfdMuPkI6znCZ5loRVhFqDdSAeXDJc+87fefDdHW/xdvHDWEf0o5l0F8tJXJ6Idg0VLlWZW9seZc3W7Ym2JnpPBUU8Vcp+ZV0ww9yVxA2knYiZwzSMY+4BjBcDC2lgB6+cGWi/vitg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by PH7PR11MB6722.namprd11.prod.outlook.com (2603:10b6:510:1ae::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Thu, 16 Apr
 2026 05:33:13 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9769.046; Thu, 16 Apr 2026
 05:33:13 +0000
Content-Type: multipart/alternative;
 boundary="------------dNhLBAP8P85azqyl3K0GvYoT"
Message-ID: <3bb4ff1b-df7f-450f-8380-00fdb3088580@intel.com>
Date: Thu, 16 Apr 2026 11:03:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/10] drm/xe/xe_pci_error: Implement PCI error
 recovery callbacks
To: "Tauro, Riana" <riana.tauro@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <soham.purkait@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
References: <20260402070131.1603828-12-riana.tauro@intel.com>
 <20260402070131.1603828-14-riana.tauro@intel.com>
 <adSNMapnJqvfswlJ@gsse-cloud1.jf.intel.com>
 <4b50d8d0-a7fe-47b2-a8c6-5e9b920aac09@intel.com>
 <c36cdb7a-b8ad-496c-bf1c-61ec15c5ac29@intel.com>
 <a4946e09-bdde-4a9b-b9e0-d494698a3469@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <a4946e09-bdde-4a9b-b9e0-d494698a3469@intel.com>
X-ClientProxiedBy: MA5P287CA0279.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::10) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|PH7PR11MB6722:EE_
X-MS-Office365-Filtering-Correlation-Id: b3e5caa9-1c25-451b-4777-08de9b79a70f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|13003099007|18002099003|56012099003|8096899003;
X-Microsoft-Antispam-Message-Info: 0ft3xpiUezYncRQw4utX7tMGbMz02Fnbsgtvj1z87pIURfaJLwuQTFEj1d9pVmjqOC8RZp8Pr5EpkyyLugJg3NO+Nio4LudmlM5b3OZJ/iQ0XCzpiK28XiUs3mt8klVOorblxa6EFnZj5eG7mfOJLRp7001IpRglQ7mIUMNjW4yVx6M+R25UKwbOfKdnaUp+rH3BZNrarXSPGUmjxp3w/OTuMHeQ7NhqFPswMrnvE0VlYu9InthGoKwGJQtoq8VpGp5uvXEHZ6leSRhxfLldMswX9p46WNK9gqWOe9yMvgFjzzuSpsbYxzbPKb3yYC/pQIojOX7ytYtSmcLUicp1yHw2LrLvOZyJNV5jmJYIgfQ4vq8hS1yiaC8rFY4ZvgoJ9DJK/0I1ztXqXO+QMAJ/E1mSAA6rnpaMmClY/YznS3o1t1jh5lxjJxRmIrUFZL2kOgTttiB0U+4eB91gLQ0cVzj00kuZRZNpoG41BJJg7NCWtrV5XjSMarjwCGr/LGUnsj/CyySLNZkkk+phe+nIv8A/XVuHDIg3MqcdXRiCSFrnp5f1/Sq3ujfdgX7ZrHPNZwAa9wzHkeh+5bI2rsU5t9Q4W+vLzbIM0bVF6Fr+4m3rPNBbjBH8YZBM9Dl2FdWAW/U95jxQdMRwoL8CitClFtlA8h1aGC+HWT2jjs688W1G9g00+VbvMNWXx9fLToPg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(13003099007)(18002099003)(56012099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUVNWWZPOURZbENMc0VqTzM5cHdwR0pVTzdTODFLWCtqUW1oVnlaOWt1ZXZH?=
 =?utf-8?B?R2gycWY0NGZhekJvaWtUYzZaZlFOcGYwdkJTUVdrRkowTHV0VlBlbFU4NkRq?=
 =?utf-8?B?UzEyVWV0eU5HTHBab0hvWXJWOGtobG1MUTdHblhwaW04ZHJuWW1tSUQwM3lB?=
 =?utf-8?B?Ykh6NlJmRC9GUmQxSE1IYjlSMUk0NGkycS9peW9Lb0hTa0E4UGRXUEZSY2pB?=
 =?utf-8?B?RlpYaGZtWUNqeTRJWklDVmxXbEhFZzdxTkNsVS9sdm5ZUlBFZTYyOXkwRkZp?=
 =?utf-8?B?WVgvc2V4cDJRblcxZjNxeDFVV1ladlRHTWhJM21EMzNtL2NSY3hDaDU5SWhJ?=
 =?utf-8?B?MGUwRUZ2bGlqalp4V0IyZ2JNZDhtOEsyUFM5cHNLWis2dlgrU1NJdGp2V1Va?=
 =?utf-8?B?THNvOHBNSWxlWTBDNFFoYWZkRTNxeGR0TnVhYjhMQklTRi9YZ0VGa1c0bkg2?=
 =?utf-8?B?cndneFQxVERuMVV3Y2lIdnJKUWFLcFJuK1dJZ0VtdzRwR29hdlBxWG1LcU5R?=
 =?utf-8?B?S0lVSUw4WWMwU3B6WXJMUEFXbG0zNTY5alY0UytvcGl5ZWtyTURsZHkrTFZU?=
 =?utf-8?B?RVkzSktPRXRPT3Q3OUo4aGdMVTVHR013VWFhSnh4OVovLzV6MTI0c0dqa0sv?=
 =?utf-8?B?K2VxT3prdUI1TlQ0ZWNyUm1UMEdub0dXUUhSdmlFZ0ZXWTltSmJOV21pcE1s?=
 =?utf-8?B?OHdZQS9wMkhEQ1JmWXFodWlld1c3aUFoMWwxdDRYSmJ2dzl4YmdEbkEwYTRR?=
 =?utf-8?B?VCtMRjlaTU4ySDZya2xXUHRXZFg4cVlseVN3UWFVYjdSbElsL0E1T1d6ZG5S?=
 =?utf-8?B?cHRROGNPNGRFZTdqeUxhbGROVXlEOUV6RVI5d242ZFI1QXNwV0pxL2dOZVg1?=
 =?utf-8?B?bFJFYzZyMDhRUjJOZ0l6Q3VTaVV0Mlh3T1F3NmdDWDZiUHVBWkVkazlxZDVl?=
 =?utf-8?B?UnRJU1ZjbmFOUGVPTFE3SGsvQjZZdDdkODdFMkRibXBUS0pqSVNwbExVeDh2?=
 =?utf-8?B?MVlFd3RtSVlRN0NHZnZiUHJHSG8zOEhpK2xjZTduSFFsU3lPdWovRlZQdHZj?=
 =?utf-8?B?dktEZGtNRi9PS2ErRXZ1Umk5UGVzeFdMYmpzUWwvS2VOUUp2YVBTREpiWU4v?=
 =?utf-8?B?SnREUlZTMkY4MnpYL3RnakZOVjdDTjdEbWtNeVl1d01vUUJvM1lPQXdqYXI5?=
 =?utf-8?B?Yk1WT2NaZlRaaFM2Q3dnYUlrc2tiWmxFVm5GeW82T29OSzdtcmRUM0RZcXBR?=
 =?utf-8?B?SUpwSExQQUhmLzFBRUY1Qkg0Y0Z2MEU1STd6aXF4ZFMzZGFoTG1hOFpzeUFO?=
 =?utf-8?B?ZlRPNEs3MElLdGpVRjMyRnJYRmQrQ093VHVQbWQycFA5RFF3dENDSlRGVkV3?=
 =?utf-8?B?TDJmSHJnZnhJVFNjNDlKWWFXc0diL1BTNTV2SzZsOWYzd0FhT25mMmRHbk5T?=
 =?utf-8?B?QzE3S01pMkMzNmhSdWNTVnZyWjUxbXRkSU5CdmZadmIrb0dvZmw1WDBtWmdv?=
 =?utf-8?B?bURFWEhTNFNaajhzbDZyZmtwSHFTdHd0Ti9seFRGZ3pyMS95NTRQRFJlQUFi?=
 =?utf-8?B?ek54Nk9rRnJNcmlDbnJDM1N5WTdpNWdDNlNjZEFOSWlIdmRqcmpMaVlxSEFn?=
 =?utf-8?B?S1lDNkhQNE5ZVkpQMjJWcTFFWWljT2VJS1k1YkdicjN6N1hHeHcvcDB4OWlR?=
 =?utf-8?B?bVFiRUxUek5RRVVUTE9EL0NpWjhQSlEzOHJ6STZZNzB0NkQvektNbWFmV1NW?=
 =?utf-8?B?OG8xUkRKSFNXWEw0NmpYa0R5Zm5ONjVqbU16WlhmbW04cWpGTGFxR1VpL09h?=
 =?utf-8?B?ZFkzd1BWclhINTBIbTI3bnpLUmZhSXNNSzBFVHRCVmZPUEhEMStsOHczNkZO?=
 =?utf-8?B?RE9LYXFXOExDL1lSdzFna3V3TGl2ZGJKZFcwc0x2cnhMYnpYN29Ic2g1cnNx?=
 =?utf-8?B?VUp6YjhJMDR4aG1hT2tiaEhId0JFODdaRVpuSGlTUHM3S09sTzBQMm03OEFv?=
 =?utf-8?B?SUF4SmwvK3pzMzkvNE9CZ0NHdElHNkJGUlhVeHFyMmhCblJGSXZ4eXdMcG56?=
 =?utf-8?B?RFpuM0JyWHl5cjNSVEI2a00yY3pJZ3J0VjNtUGhOemRuWHkwWGlmeVd4MU1w?=
 =?utf-8?B?REtJRFZmZWNoTTVoYUxxODNCK3lBcVBtNjNUNEgzSitOMnFKUVhBUGxwcmZ6?=
 =?utf-8?B?QlR4d3dpaXJNaHIyNDFhQmpKTU1hbUk3NGc4QWYrUmZ2VEpkS0J6NUZBVXBw?=
 =?utf-8?B?LzBJYTZvT0FrcFg1VGtnRzg1WFNlSEl3bEFxd3Jsc1NxTStydzVrMmZOeGNj?=
 =?utf-8?B?TmRYWGE0M3pNVGpuOGF3MVExdUJ3eWhjWUlRV2VIZ0hhdXpuNGh1Rkl1cm5s?=
 =?utf-8?Q?B2SxNJecMYQC9lfQ=3D?=
X-Exchange-RoutingPolicyChecked: Zqd/Y3oFJCn6IU4rpeVY7VDkO4FHDHreQWA73dOwJPD5vvUnXFCI3NCUA6aF1QTTyUgnzQ9u+zlAkKty62LQdcUVvNJl+9YyydK+hV6aXyWrTcuz37saAcgF4sLx+rag/JI8iYdMYv9Y6zb8bLzqGOWjKGdTZdb3RalurPMOkdFpP/jMR720Mwg/V+tMnt16prlSxINss8vJZFP94jdvERuWAUhyxBh9Vt0vNMH6iGHMixwTKekIv5mlZL+TP7GDjCoezviXsV5YRYFx5zzGH+NnWHJBdO0XKKLACaO+4D/QnSSma7lAQQSfsqzc1lOzYRfCx5HlRbF8qWmzZmi1YQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b3e5caa9-1c25-451b-4777-08de9b79a70f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 05:33:13.4242 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wZaXPe9uw608d3eYgxQr/eJtig4cDuyFRLbRtrZYg8L7I7DxyvQnsKMXhBW3aEzVBzRnu5kJQE6LE5GCaS8yjEgd3HWwT4azrsXT1FTW5hw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6722
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

--------------dNhLBAP8P85azqyl3K0GvYoT
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 16-04-2026 10:18 am, Tauro, Riana wrote:
>
> On 4/14/2026 6:59 PM, Mallesh, Koujalagi wrote:
>>
>> On 13-04-2026 02:30 pm, Tauro, Riana wrote:
>>>
>>> On 4/7/2026 10:20 AM, Matthew Brost wrote:
>>>> On Thu, Apr 02, 2026 at 12:31:33PM +0530, Riana Tauro wrote:
>>>>> Add error_detected, mmio_enabled, slot_reset and resume
>>>>> recovery callbacks to handle PCIe Advanced Error Reporting
>>>>> (AER) errors.
>>>>>
>>>>> For fatal errors, the device is wedged and becomes
>>>>> inaccessible. Return PCI_ERS_RESULT_SLOT_RESET from
>>>>> error_detected to request a Secondary Bus Reset (SBR).
>>>>>
>>>>> For non-fatal errors, return PCI_ERS_RESULT_CAN_RECOVER from
>>>>> error_detected to trigger the mmio_enabled callback. In this 
>>>>> callback,
>>>>> the device is queried to determine the error cause and attempt
>>>>> recovery based on the error type.
>>>>>
>>>>> Once the secondary bus reset(SBR) is completed the slot_reset 
>>>>> callback
>>>>> cleanly removes and reprobe the device to restore functionality.
>>>>>
>>>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>>> ---
>>>>> v2: re-order linux headers
>>>>>      reword error messages
>>>>>      do not clear in_recovery after remove
>>>>>      return PCI_ERS_RESULT_DISCONNECT if probe fails (Michal)
>>>>>      only wedge device do not send uevent (Raag)
>>>>>      set recovery flag in error_detected and clear on resume
>>>>>      add default switch case (Mallesh)
>>>>>
>>>>> v3: do not set in_recovery for disconnect (Mallesh)
>>>>>      return if already wedged or in survivability mode
>>>>> ---
>>>>>   drivers/gpu/drm/xe/Makefile          |   1 +
>>>>>   drivers/gpu/drm/xe/xe_device.h       |  15 ++++
>>>>>   drivers/gpu/drm/xe/xe_device_types.h |   3 +
>>>>>   drivers/gpu/drm/xe/xe_pci.c          |   3 +
>>>>>   drivers/gpu/drm/xe/xe_pci_error.c    | 104 
>>>>> +++++++++++++++++++++++++++
>>>>>   5 files changed, 126 insertions(+)
>>>>>   create mode 100644 drivers/gpu/drm/xe/xe_pci_error.c
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/Makefile 
>>>>> b/drivers/gpu/drm/xe/Makefile
>>>>> index 9dacb0579a7d..7f03f06df186 100644
>>>>> --- a/drivers/gpu/drm/xe/Makefile
>>>>> +++ b/drivers/gpu/drm/xe/Makefile
>>>>> @@ -100,6 +100,7 @@ xe-y += xe_bb.o \
>>>>>       xe_page_reclaim.o \
>>>>>       xe_pat.o \
>>>>>       xe_pci.o \
>>>>> +    xe_pci_error.o \
>>>>>       xe_pci_rebar.o \
>>>>>       xe_pcode.o \
>>>>>       xe_pm.o \
>>>>> diff --git a/drivers/gpu/drm/xe/xe_device.h 
>>>>> b/drivers/gpu/drm/xe/xe_device.h
>>>>> index e4b9de8d8e95..60db2492cb92 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_device.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_device.h
>>>>> @@ -43,6 +43,21 @@ static inline struct xe_device 
>>>>> *ttm_to_xe_device(struct ttm_device *ttm)
>>>>>       return container_of(ttm, struct xe_device, ttm);
>>>>>   }
>>>>>   +static inline bool xe_device_is_in_recovery(struct xe_device *xe)
>>>>> +{
>>>>> +    return atomic_read(&xe->in_recovery);
>>>>> +}
>>>>> +
>>>>> +static inline void xe_device_set_in_recovery(struct xe_device *xe)
>>>>> +{
>>>>> +    atomic_set(&xe->in_recovery, 1);
>>>>> +}
>>>>> +
>>>>> +static inline void xe_device_clear_in_recovery(struct xe_device *xe)
>>>>> +{
>>>>> +     atomic_set(&xe->in_recovery, 0);
>> nit: Remove white space
>>>>> +}
>>>>> +
>>>>>   struct xe_device *xe_device_create(struct pci_dev *pdev,
>>>>>                      const struct pci_device_id *ent);
>>>>>   int xe_device_probe_early(struct xe_device *xe);
>>>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h 
>>>>> b/drivers/gpu/drm/xe/xe_device_types.h
>>>>> index 150c76b2acaf..c9fe86b670bd 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>>>> @@ -494,6 +494,9 @@ struct xe_device {
>>>>>           bool inconsistent_reset;
>>>>>       } wedged;
>>>>>   +    /** @in_recovery: Indicates if device is in recovery */
>>>>> +    atomic_t in_recovery;
>>>>> +
>>>>>       /** @bo_device: Struct to control async free of BOs */
>>>>>       struct xe_bo_dev {
>>>>>           /** @bo_device.async_free: Free worker */
>>>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c 
>>>>> b/drivers/gpu/drm/xe/xe_pci.c
>>>>> index 1df3f08e2e1c..30d71795dd2e 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>>>> @@ -1323,6 +1323,8 @@ static const struct dev_pm_ops xe_pm_ops = {
>>>>>   };
>>>>>   #endif
>>>>>   +extern const struct pci_error_handlers xe_pci_error_handlers;
>>>>> +
>>>>>   static struct pci_driver xe_pci_driver = {
>>>>>       .name = DRIVER_NAME,
>>>>>       .id_table = pciidlist,
>>>>> @@ -1330,6 +1332,7 @@ static struct pci_driver xe_pci_driver = {
>>>>>       .remove = xe_pci_remove,
>>>>>       .shutdown = xe_pci_shutdown,
>>>>>       .sriov_configure = xe_pci_sriov_configure,
>>>>> +    .err_handler = &xe_pci_error_handlers,
>>>>>   #ifdef CONFIG_PM_SLEEP
>>>>>       .driver.pm = &xe_pm_ops,
>>>>>   #endif
>>>>> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c 
>>>>> b/drivers/gpu/drm/xe/xe_pci_error.c
>>>>> new file mode 100644
>>>>> index 000000000000..cd9f39010278
>>>>> --- /dev/null
>>>>> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
>>>>> @@ -0,0 +1,104 @@
>>>>> +// SPDX-License-Identifier: MIT
>>>>> +/*
>>>>> + * Copyright © 2026 Intel Corporation
>>>>> + */
>>>>> +#include <linux/pci.h>
>>>>> +
>>>>> +#include <drm/drm_drv.h>
>>>>> +
>>>>> +#include "xe_device.h"
>>>>> +#include "xe_gt.h"
>>>>> +#include "xe_pci.h"
>>>>> +#include "xe_survivability_mode.h"
>>>>> +#include "xe_uc.h"
>>>>> +
>>>>> +static void xe_pci_error_handling(struct pci_dev *pdev)
>>>>> +{
>>>>> +    struct xe_device *xe = pdev_to_xe_device(pdev);
>>>>> +    struct xe_gt *gt;
>>>>> +    u8 id;
>>>>> +
>>>>> +    /* Return if device is wedged or in survivability mode */
>>>>> +    if (xe_survivability_mode_is_boot_enabled(xe) || 
>>>>> xe_device_wedged(xe))
>>>>> +        return;
>>>>> +
>>>>> +    /* Wedge the device to prevent userspace access but don't 
>>>>> send the event yet */
>>>>> +    atomic_set(&xe->wedged.flag, 1);
>>>> We can't blindly set '&xe->wedged.flag, 1' as this is tied to a PM ref
>>>> [1], [2]. The existing sematic might be wrong but we to normalize
>>>> adjustmets to the '&xe->wedged.flag' field with uniform rules, or the
>>>> cases when we wedge we also take a PM ref
>>>>
>>>
>>> If the device was already wedged from xe_device_declare_wedged, this 
>>> function returns.
>>> And the ref is released in fini.
>>>
>>> PM ref was added to prevent runtime suspend during wedging. But in 
>>> case of error_callbacks
>>> this is already taken by PCI core drivers/pci/pcie/err.c
>>>
>>> pci_walk_bridge(bridge, pci_pm_runtime_get_sync, NULL);
>>>
>>> I will add a comment here.
>>>
>>> Thanks
>>> Riana
>>>
>>>>   Matt
>>>>
>>>> [1] 
>>>> https://patchwork.freedesktop.org/patch/714622/?series=163948&rev=1
>>>> [2] 
>>>> https://patchwork.freedesktop.org/patch/715028/?series=162055&rev=4#comment_1315905
>>>>
>>>>> +
>>>>> +    for_each_gt(gt, xe, id)
>>>>> +        xe_gt_declare_wedged(gt);
>>>>> +
>>>>> +    pci_disable_device(pdev);
>>>>> +}
>>>>> +
>>>>> +static pci_ers_result_t xe_pci_error_detected(struct pci_dev 
>>>>> *pdev, pci_channel_state_t state)
>>>>> +{
>>>>> +    struct xe_device *xe = pdev_to_xe_device(pdev);
>>>>> +
>>>>> +    dev_err(&pdev->dev, "Xe Pci error recovery: error detected 
>>>>> state %d\n", state);
>>>>> +
>>>>> +    if (state == pci_channel_io_perm_failure)
>>>>> +        return PCI_ERS_RESULT_DISCONNECT;
>>>>> +
>>>>> +    xe_device_set_in_recovery(xe);
>>>>> +
>>>>> +    switch (state) {
>>>>> +    case pci_channel_io_normal:
>>>>> +        return PCI_ERS_RESULT_CAN_RECOVER;
>>>>> +    case pci_channel_io_frozen:
>>>>> +        xe_pci_error_handling(pdev);
>>>>> +        return PCI_ERS_RESULT_NEED_RESET;
>>>>> +    default:
>>>>> +        dev_err(&pdev->dev, "Unknown state %d\n", state);
>>>>> +        return PCI_ERS_RESULT_NEED_RESET;
>>>>> +    }
>>>>> +}
>>>>> +
>>>>> +static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev 
>>>>> *pdev)
>>>>> +{
>>>>> +    dev_err(&pdev->dev, "Xe Pci error recovery: MMIO enabled\n");
>>>>> +
>>>>> +    return PCI_ERS_RESULT_NEED_RESET;
>>>>> +}
>>>>> +
>>>>> +static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev 
>>>>> *pdev)
>>>>> +{
>>>>> +    const struct pci_device_id *ent = 
>>>>> pci_match_id(pdev->driver->id_table, pdev);
>>>>> +
>>>>> +    dev_err(&pdev->dev, "Xe Pci error recovery: Slot reset\n");
>>>>> +
>>>>> +    pci_restore_state(pdev);
>>
>> Is pci_restore_state() needed here? before invoking slot_reset, the 
>> PCI core already calls
>
> I have already responded to this in v1. [2/8] drm/xe/xe_pci_error: 
> Implement PCI error recovery callbacks - Patchwork 
> <https://patchwork.freedesktop.org/patch/700296/?series=160482&rev=1>.
>
> We have seen issues if we don't restore it after SBR. Maybe i missed 
> something.
> Can you please point to the line of code? I don't see it in 
> report_slot_reset or aer_root_reset.

Yes, you’re absolutely right. In the AER recovery path, the 
responsibility to call pci_restore_state() lies with the driver, and in 
our case the reset happens through the AER path.
In contrast, for non‑AER paths, the PCI core itself handles state 
restoration via pci_dev_restore() (which internally calls 
pci_restore_state()).

Thanks,

-/Mallesh

>
> err.c - drivers/pci/pcie/err.c - Linux source code v7.0 - Bootlin 
> Elixir Cross Referencer
>
> <https://elixir.bootlin.com/linux/v7.0/source/drivers/pci/pcie/err.c#L148>Thanks 
>
> Riana
>
>>
>> pci_restore_state() right.
>>
>> Thanks,
>>
>> -/Mallesh
>>
>>>>> +
>>>>> +    if (pci_enable_device(pdev)) {
>>>>> +        dev_err(&pdev->dev,
>>>>> +            "Cannot re-enable PCI device after reset\n");
>>>>> +        return PCI_ERS_RESULT_DISCONNECT;
>>>>> +    }
>>>>> +
>>>>> +    /*
>>>>> +     * Secondary Bus Reset wipes out all device memory
>>>>> +     * requiring XE KMD to perform a device removal and reprobe.
>>>>> +     */
>>>>> +    pdev->driver->remove(pdev);
>>>>> +
>>>>> +    if (!pdev->driver->probe(pdev, ent))
>>>>> +        return PCI_ERS_RESULT_RECOVERED;
>>>>> +
>>>>> +    return PCI_ERS_RESULT_DISCONNECT;
>>>>> +}
>>>>> +
>>>>> +static void xe_pci_error_resume(struct pci_dev *pdev)
>>>>> +{
>>>>> +    struct xe_device *xe = pdev_to_xe_device(pdev);
>>>>> +
>>>>> +    dev_info(&pdev->dev, "Xe Pci error recovery: Recovered\n");
>>>>> +
>>>>> +    xe_device_clear_in_recovery(xe);
>>>>> +}
>>>>> +
>>>>> +const struct pci_error_handlers xe_pci_error_handlers = {
>>>>> +    .error_detected    = xe_pci_error_detected,
>>>>> +    .mmio_enabled    = xe_pci_error_mmio_enabled,
>>>>> +    .slot_reset    = xe_pci_error_slot_reset,
>>>>> +    .resume        = xe_pci_error_resume,
>>>>> +};
>>>>> -- 
>>>>> 2.47.1
>>>>>
--------------dNhLBAP8P85azqyl3K0GvYoT
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 16-04-2026 10:18 am, Tauro, Riana
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:a4946e09-bdde-4a9b-b9e0-d494698a3469@intel.com">
      <br>
      On 4/14/2026 6:59 PM, Mallesh, Koujalagi wrote:
      <br>
      <blockquote type="cite">
        <br>
        On 13-04-2026 02:30 pm, Tauro, Riana wrote:
        <br>
        <blockquote type="cite">
          <br>
          On 4/7/2026 10:20 AM, Matthew Brost wrote:
          <br>
          <blockquote type="cite">On Thu, Apr 02, 2026 at 12:31:33PM
            +0530, Riana Tauro wrote:
            <br>
            <blockquote type="cite">Add error_detected, mmio_enabled,
              slot_reset and resume
              <br>
              recovery callbacks to handle PCIe Advanced Error Reporting
              <br>
              (AER) errors.
              <br>
              <br>
              For fatal errors, the device is wedged and becomes
              <br>
              inaccessible. Return PCI_ERS_RESULT_SLOT_RESET from
              <br>
              error_detected to request a Secondary Bus Reset (SBR).
              <br>
              <br>
              For non-fatal errors, return PCI_ERS_RESULT_CAN_RECOVER
              from
              <br>
              error_detected to trigger the mmio_enabled callback. In
              this callback,
              <br>
              the device is queried to determine the error cause and
              attempt
              <br>
              recovery based on the error type.
              <br>
              <br>
              Once the secondary bus reset(SBR) is completed the
              slot_reset callback
              <br>
              cleanly removes and reprobe the device to restore
              functionality.
              <br>
              <br>
              Cc: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
              <br>
              Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
              <br>
              Cc: Matt Roper <a class="moz-txt-link-rfc2396E" href="mailto:matthew.d.roper@intel.com">&lt;matthew.d.roper@intel.com&gt;</a>
              <br>
              Signed-off-by: Riana Tauro <a class="moz-txt-link-rfc2396E" href="mailto:riana.tauro@intel.com">&lt;riana.tauro@intel.com&gt;</a>
              <br>
              ---
              <br>
              v2: re-order linux headers
              <br>
              &nbsp;&nbsp;&nbsp;&nbsp; reword error messages
              <br>
              &nbsp;&nbsp;&nbsp;&nbsp; do not clear in_recovery after remove
              <br>
              &nbsp;&nbsp;&nbsp;&nbsp; return PCI_ERS_RESULT_DISCONNECT if probe fails
              (Michal)
              <br>
              &nbsp;&nbsp;&nbsp;&nbsp; only wedge device do not send uevent (Raag)
              <br>
              &nbsp;&nbsp;&nbsp;&nbsp; set recovery flag in error_detected and clear on
              resume
              <br>
              &nbsp;&nbsp;&nbsp;&nbsp; add default switch case (Mallesh)
              <br>
              <br>
              v3: do not set in_recovery for disconnect (Mallesh)
              <br>
              &nbsp;&nbsp;&nbsp;&nbsp; return if already wedged or in survivability mode
              <br>
              ---
              <br>
              &nbsp; drivers/gpu/drm/xe/Makefile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 1 +
              <br>
              &nbsp; drivers/gpu/drm/xe/xe_device.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 15 ++++
              <br>
              &nbsp; drivers/gpu/drm/xe/xe_device_types.h |&nbsp;&nbsp; 3 +
              <br>
              &nbsp; drivers/gpu/drm/xe/xe_pci.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 3 +
              <br>
              &nbsp; drivers/gpu/drm/xe/xe_pci_error.c&nbsp;&nbsp;&nbsp; | 104
              +++++++++++++++++++++++++++
              <br>
              &nbsp; 5 files changed, 126 insertions(+)
              <br>
              &nbsp; create mode 100644 drivers/gpu/drm/xe/xe_pci_error.c
              <br>
              <br>
              diff --git a/drivers/gpu/drm/xe/Makefile
              b/drivers/gpu/drm/xe/Makefile
              <br>
              index 9dacb0579a7d..7f03f06df186 100644
              <br>
              --- a/drivers/gpu/drm/xe/Makefile
              <br>
              +++ b/drivers/gpu/drm/xe/Makefile
              <br>
              @@ -100,6 +100,7 @@ xe-y += xe_bb.o \
              <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_page_reclaim.o \
              <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_pat.o \
              <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_pci.o \
              <br>
              +&nbsp;&nbsp;&nbsp; xe_pci_error.o \
              <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_pci_rebar.o \
              <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_pcode.o \
              <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_pm.o \
              <br>
              diff --git a/drivers/gpu/drm/xe/xe_device.h
              b/drivers/gpu/drm/xe/xe_device.h
              <br>
              index e4b9de8d8e95..60db2492cb92 100644
              <br>
              --- a/drivers/gpu/drm/xe/xe_device.h
              <br>
              +++ b/drivers/gpu/drm/xe/xe_device.h
              <br>
              @@ -43,6 +43,21 @@ static inline struct xe_device
              *ttm_to_xe_device(struct ttm_device *ttm)
              <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return container_of(ttm, struct xe_device, ttm);
              <br>
              &nbsp; }
              <br>
              &nbsp; +static inline bool xe_device_is_in_recovery(struct
              xe_device *xe)
              <br>
              +{
              <br>
              +&nbsp;&nbsp;&nbsp; return atomic_read(&amp;xe-&gt;in_recovery);
              <br>
              +}
              <br>
              +
              <br>
              +static inline void xe_device_set_in_recovery(struct
              xe_device *xe)
              <br>
              +{
              <br>
              +&nbsp;&nbsp;&nbsp; atomic_set(&amp;xe-&gt;in_recovery, 1);
              <br>
              +}
              <br>
              +
              <br>
              +static inline void xe_device_clear_in_recovery(struct
              xe_device *xe)
              <br>
              +{
              <br>
              +&nbsp;&nbsp;&nbsp;&nbsp; atomic_set(&amp;xe-&gt;in_recovery, 0);
              <br>
            </blockquote>
          </blockquote>
        </blockquote>
        nit: Remove white space
        <br>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">+}
              <br>
              +
              <br>
              &nbsp; struct xe_device *xe_device_create(struct pci_dev *pdev,
              <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct pci_device_id *ent);
              <br>
              &nbsp; int xe_device_probe_early(struct xe_device *xe);
              <br>
              diff --git a/drivers/gpu/drm/xe/xe_device_types.h
              b/drivers/gpu/drm/xe/xe_device_types.h
              <br>
              index 150c76b2acaf..c9fe86b670bd 100644
              <br>
              --- a/drivers/gpu/drm/xe/xe_device_types.h
              <br>
              +++ b/drivers/gpu/drm/xe/xe_device_types.h
              <br>
              @@ -494,6 +494,9 @@ struct xe_device {
              <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool inconsistent_reset;
              <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } wedged;
              <br>
              &nbsp; +&nbsp;&nbsp;&nbsp; /** @in_recovery: Indicates if device is in
              recovery */
              <br>
              +&nbsp;&nbsp;&nbsp; atomic_t in_recovery;
              <br>
              +
              <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @bo_device: Struct to control async free of BOs
              */
              <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_bo_dev {
              <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @bo_device.async_free: Free worker */
              <br>
              diff --git a/drivers/gpu/drm/xe/xe_pci.c
              b/drivers/gpu/drm/xe/xe_pci.c
              <br>
              index 1df3f08e2e1c..30d71795dd2e 100644
              <br>
              --- a/drivers/gpu/drm/xe/xe_pci.c
              <br>
              +++ b/drivers/gpu/drm/xe/xe_pci.c
              <br>
              @@ -1323,6 +1323,8 @@ static const struct dev_pm_ops
              xe_pm_ops = {
              <br>
              &nbsp; };
              <br>
              &nbsp; #endif
              <br>
              &nbsp; +extern const struct pci_error_handlers
              xe_pci_error_handlers;
              <br>
              +
              <br>
              &nbsp; static struct pci_driver xe_pci_driver = {
              <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .name = DRIVER_NAME,
              <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .id_table = pciidlist,
              <br>
              @@ -1330,6 +1332,7 @@ static struct pci_driver
              xe_pci_driver = {
              <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .remove = xe_pci_remove,
              <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .shutdown = xe_pci_shutdown,
              <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .sriov_configure = xe_pci_sriov_configure,
              <br>
              +&nbsp;&nbsp;&nbsp; .err_handler = &amp;xe_pci_error_handlers,
              <br>
              &nbsp; #ifdef CONFIG_PM_SLEEP
              <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .driver.pm = &amp;xe_pm_ops,
              <br>
              &nbsp; #endif
              <br>
              diff --git a/drivers/gpu/drm/xe/xe_pci_error.c
              b/drivers/gpu/drm/xe/xe_pci_error.c
              <br>
              new file mode 100644
              <br>
              index 000000000000..cd9f39010278
              <br>
              --- /dev/null
              <br>
              +++ b/drivers/gpu/drm/xe/xe_pci_error.c
              <br>
              @@ -0,0 +1,104 @@
              <br>
              +// SPDX-License-Identifier: MIT
              <br>
              +/*
              <br>
              + * Copyright © 2026 Intel Corporation
              <br>
              + */
              <br>
              +#include &lt;linux/pci.h&gt;
              <br>
              +
              <br>
              +#include &lt;drm/drm_drv.h&gt;
              <br>
              +
              <br>
              +#include &quot;xe_device.h&quot;
              <br>
              +#include &quot;xe_gt.h&quot;
              <br>
              +#include &quot;xe_pci.h&quot;
              <br>
              +#include &quot;xe_survivability_mode.h&quot;
              <br>
              +#include &quot;xe_uc.h&quot;
              <br>
              +
              <br>
              +static void xe_pci_error_handling(struct pci_dev *pdev)
              <br>
              +{
              <br>
              +&nbsp;&nbsp;&nbsp; struct xe_device *xe = pdev_to_xe_device(pdev);
              <br>
              +&nbsp;&nbsp;&nbsp; struct xe_gt *gt;
              <br>
              +&nbsp;&nbsp;&nbsp; u8 id;
              <br>
              +
              <br>
              +&nbsp;&nbsp;&nbsp; /* Return if device is wedged or in survivability
              mode */
              <br>
              +&nbsp;&nbsp;&nbsp; if (xe_survivability_mode_is_boot_enabled(xe) ||
              xe_device_wedged(xe))
              <br>
              +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;
              <br>
              +
              <br>
              +&nbsp;&nbsp;&nbsp; /* Wedge the device to prevent userspace access but
              don't send the event yet */
              <br>
              +&nbsp;&nbsp;&nbsp; atomic_set(&amp;xe-&gt;wedged.flag, 1);
              <br>
            </blockquote>
            We can't blindly set '&amp;xe-&gt;wedged.flag, 1' as this is
            tied to a PM ref
            <br>
            [1], [2]. The existing sematic might be wrong but we to
            normalize
            <br>
            adjustmets to the '&amp;xe-&gt;wedged.flag' field with
            uniform rules, or the
            <br>
            cases when we wedge we also take a PM ref
            <br>
            <br>
          </blockquote>
          <br>
          If the device was already wedged from
          xe_device_declare_wedged, this function returns.
          <br>
          And the ref is released in fini.
          <br>
          <br>
          PM ref was added to prevent runtime suspend during wedging.
          But in case of error_callbacks
          <br>
          this is already taken by PCI core drivers/pci/pcie/err.c
          <br>
          <br>
          pci_walk_bridge(bridge, pci_pm_runtime_get_sync, NULL);
          <br>
          <br>
          I will add a comment here.
          <br>
          <br>
          Thanks
          <br>
          Riana
          <br>
          <br>
          <blockquote type="cite">&nbsp; Matt
            <br>
            <br>
            [1]
            <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/patch/714622/?series=163948&amp;rev=1">https://patchwork.freedesktop.org/patch/714622/?series=163948&amp;rev=1</a>
            <br>
            [2]
<a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/patch/715028/?series=162055&amp;rev=4#comment_1315905">https://patchwork.freedesktop.org/patch/715028/?series=162055&amp;rev=4#comment_1315905</a><br>
            <br>
            <blockquote type="cite">+
              <br>
              +&nbsp;&nbsp;&nbsp; for_each_gt(gt, xe, id)
              <br>
              +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_gt_declare_wedged(gt);
              <br>
              +
              <br>
              +&nbsp;&nbsp;&nbsp; pci_disable_device(pdev);
              <br>
              +}
              <br>
              +
              <br>
              +static pci_ers_result_t xe_pci_error_detected(struct
              pci_dev *pdev, pci_channel_state_t state)
              <br>
              +{
              <br>
              +&nbsp;&nbsp;&nbsp; struct xe_device *xe = pdev_to_xe_device(pdev);
              <br>
              +
              <br>
              +&nbsp;&nbsp;&nbsp; dev_err(&amp;pdev-&gt;dev, &quot;Xe Pci error recovery:
              error detected state %d\n&quot;, state);
              <br>
              +
              <br>
              +&nbsp;&nbsp;&nbsp; if (state == pci_channel_io_perm_failure)
              <br>
              +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return PCI_ERS_RESULT_DISCONNECT;
              <br>
              +
              <br>
              +&nbsp;&nbsp;&nbsp; xe_device_set_in_recovery(xe);
              <br>
              +
              <br>
              +&nbsp;&nbsp;&nbsp; switch (state) {
              <br>
              +&nbsp;&nbsp;&nbsp; case pci_channel_io_normal:
              <br>
              +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return PCI_ERS_RESULT_CAN_RECOVER;
              <br>
              +&nbsp;&nbsp;&nbsp; case pci_channel_io_frozen:
              <br>
              +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_pci_error_handling(pdev);
              <br>
              +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return PCI_ERS_RESULT_NEED_RESET;
              <br>
              +&nbsp;&nbsp;&nbsp; default:
              <br>
              +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_err(&amp;pdev-&gt;dev, &quot;Unknown state %d\n&quot;,
              state);
              <br>
              +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return PCI_ERS_RESULT_NEED_RESET;
              <br>
              +&nbsp;&nbsp;&nbsp; }
              <br>
              +}
              <br>
              +
              <br>
              +static pci_ers_result_t xe_pci_error_mmio_enabled(struct
              pci_dev *pdev)
              <br>
              +{
              <br>
              +&nbsp;&nbsp;&nbsp; dev_err(&amp;pdev-&gt;dev, &quot;Xe Pci error recovery:
              MMIO enabled\n&quot;);
              <br>
              +
              <br>
              +&nbsp;&nbsp;&nbsp; return PCI_ERS_RESULT_NEED_RESET;
              <br>
              +}
              <br>
              +
              <br>
              +static pci_ers_result_t xe_pci_error_slot_reset(struct
              pci_dev *pdev)
              <br>
              +{
              <br>
              +&nbsp;&nbsp;&nbsp; const struct pci_device_id *ent =
              pci_match_id(pdev-&gt;driver-&gt;id_table, pdev);
              <br>
              +
              <br>
              +&nbsp;&nbsp;&nbsp; dev_err(&amp;pdev-&gt;dev, &quot;Xe Pci error recovery:
              Slot reset\n&quot;);
              <br>
              +
              <br>
              +&nbsp;&nbsp;&nbsp; pci_restore_state(pdev);
              <br>
            </blockquote>
          </blockquote>
        </blockquote>
        <br>
        Is pci_restore_state() needed here? before invoking slot_reset,
        the PCI core already calls
        <br>
      </blockquote>
      <br>
      I have already responded to this in v1. [2/8] drm/xe/xe_pci_error:
      Implement PCI error recovery callbacks - Patchwork
<a class="moz-txt-link-rfc2396E" href="https://patchwork.freedesktop.org/patch/700296/?series=160482&amp;rev=1">&lt;https://patchwork.freedesktop.org/patch/700296/?series=160482&amp;rev=1&gt;</a>.<br>
      <br>
      We have seen issues if we don't restore it after SBR. Maybe i
      missed something.
      <br>
      Can you please point to the line of code? I don't see it in
      report_slot_reset or aer_root_reset.
      <br>
    </blockquote>
    <p>
      <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style></p>
    <p>Yes, you’re absolutely right. In the AER recovery path, the
      responsibility to call pci_restore_state() lies with the driver,
      and in our case the reset happens through the AER path.<br>
      In contrast, for non‑AER paths, the PCI core itself handles state
      restoration via pci_dev_restore() (which internally calls
      pci_restore_state()).</p>
    <p>Thanks,</p>
    <p>-/Mallesh</p>
    <blockquote type="cite" cite="mid:a4946e09-bdde-4a9b-b9e0-d494698a3469@intel.com"><br>
      err.c - drivers/pci/pcie/err.c - Linux source code v7.0 - Bootlin
      Elixir Cross Referencer
      <br>
      <br>
<a class="moz-txt-link-rfc2396E" href="https://elixir.bootlin.com/linux/v7.0/source/drivers/pci/pcie/err.c#L148">&lt;https://elixir.bootlin.com/linux/v7.0/source/drivers/pci/pcie/err.c#L148&gt;</a>Thanks
      <br>
      Riana
      <br>
      <br>
      <blockquote type="cite">
        <br>
        pci_restore_state() right.
        <br>
        <br>
        Thanks,
        <br>
        <br>
        -/Mallesh
        <br>
        <br>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">+
              <br>
              +&nbsp;&nbsp;&nbsp; if (pci_enable_device(pdev)) {
              <br>
              +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_err(&amp;pdev-&gt;dev,
              <br>
              +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Cannot re-enable PCI device after reset\n&quot;);
              <br>
              +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return PCI_ERS_RESULT_DISCONNECT;
              <br>
              +&nbsp;&nbsp;&nbsp; }
              <br>
              +
              <br>
              +&nbsp;&nbsp;&nbsp; /*
              <br>
              +&nbsp;&nbsp;&nbsp;&nbsp; * Secondary Bus Reset wipes out all device memory
              <br>
              +&nbsp;&nbsp;&nbsp;&nbsp; * requiring XE KMD to perform a device removal and
              reprobe.
              <br>
              +&nbsp;&nbsp;&nbsp;&nbsp; */
              <br>
              +&nbsp;&nbsp;&nbsp; pdev-&gt;driver-&gt;remove(pdev);
              <br>
              +
              <br>
              +&nbsp;&nbsp;&nbsp; if (!pdev-&gt;driver-&gt;probe(pdev, ent))
              <br>
              +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return PCI_ERS_RESULT_RECOVERED;
              <br>
              +
              <br>
              +&nbsp;&nbsp;&nbsp; return PCI_ERS_RESULT_DISCONNECT;
              <br>
              +}
              <br>
              +
              <br>
              +static void xe_pci_error_resume(struct pci_dev *pdev)
              <br>
              +{
              <br>
              +&nbsp;&nbsp;&nbsp; struct xe_device *xe = pdev_to_xe_device(pdev);
              <br>
              +
              <br>
              +&nbsp;&nbsp;&nbsp; dev_info(&amp;pdev-&gt;dev, &quot;Xe Pci error recovery:
              Recovered\n&quot;);
              <br>
              +
              <br>
              +&nbsp;&nbsp;&nbsp; xe_device_clear_in_recovery(xe);
              <br>
              +}
              <br>
              +
              <br>
              +const struct pci_error_handlers xe_pci_error_handlers = {
              <br>
              +&nbsp;&nbsp;&nbsp; .error_detected&nbsp;&nbsp;&nbsp; = xe_pci_error_detected,
              <br>
              +&nbsp;&nbsp;&nbsp; .mmio_enabled&nbsp;&nbsp;&nbsp; = xe_pci_error_mmio_enabled,
              <br>
              +&nbsp;&nbsp;&nbsp; .slot_reset&nbsp;&nbsp;&nbsp; = xe_pci_error_slot_reset,
              <br>
              +&nbsp;&nbsp;&nbsp; .resume&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = xe_pci_error_resume,
              <br>
              +};
              <br>
              --&nbsp;<br>
              2.47.1
              <br>
              <br>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------dNhLBAP8P85azqyl3K0GvYoT--
