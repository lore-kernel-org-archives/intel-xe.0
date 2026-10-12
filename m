Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E614CA9EC5
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 06:27:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58CF310E448;
	Mon, 12 Oct 2026 06:27:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D788110E48A
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 06:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791786431; x=1823322431;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/9jtaOfsoML0OjwGOvE6kN4up4Un23dicZTY64zhOWQ=;
 b=ZWCtgmzYj7cqj/MTpHv+D9JWsEqcyMhDszYr/GKziCdKH6CR9CPbtnEY
 Q5yGl+Lk+hStrbEKDuPJVbLmQiv0I71SFGuivPH+/h4FPOMjAa4ad3SOg
 gy3GDxKsulES4SP2Yw4tps/7UtkO+ClqOPWHGMYSncVaY4+ZLpRKcbFJ4
 WEq6vYDkRDuS4RAzH+4672U9/NGPCDq3B367kYX86rpSN6z3RGq20G//l
 LHpe7LDytQ4TTlNm1WfpVYw/jFSXENW8j3bjxRcXiAM6P7wRZuoil9uI9
 W3FkMnxDbPXjqRofmOURZ9eUiRi1YTCMZMu8oQPNsbLJz0LP4A8PPLLC+ A==;
X-CSE-ConnectionGUID: AnoUHrnqQuWdV3uUbMtcaA==
X-CSE-MsgGUID: OCREyc9/SXayv0b9WYCpLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="372678"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="372678"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 23:27:10 -0700
X-CSE-ConnectionGUID: EcIJ5hzMQSyNyLZU7YDl5w==
X-CSE-MsgGUID: qiPRYC9xSC642t8HTrUeqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="2645534"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 23:27:09 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 11 Oct 2026 23:27:09 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sun, 11 Oct 2026 23:27:08 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.38) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 11 Oct 2026 23:27:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tBDdefSbQQeih5KnXNUoPC7x54RsIZZrcRmoApWMBDukDKDZ2Gh7YEiTwxMGIxS7Um5WjC4Y6yuk81VA4X4zZZY2G9mQSxqEVr1I2A5YGqbB3HWVhPr6c0jzyPx6yF3KyXFQCw7GeGfFw+pEX7E2ferU+1rGwPWs5uRlKW6Y3UVnO1sex8/oIioAfxtW4WiYe3LyPNyZWhAXLK1UEkgrQsSg7NqkODJN5uM5KAMsnd6R8g8BIYHsnX5qFB6bQI3he8Xlif0UOE++/nxpFSYOGJHZ53YuW5100brkmqqJ84hGdUV7ZK2cOv+YlMnhcuA60KqtFFmsLbfWPnmBrATbrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxFbIqbLU/P6YQUYhPcYUyJC2+sQ2e/g9aovkqGd+FU=;
 b=dEwHPYVC3aCI2iDq79mGoFiSLr7BbRnCFa2R7tKstfLhMDwtDuY7sFpPaepY+jdAKxJZJjSRinL8r/mzaho7CkiFPAQrAzjpPyfcrKAVx2iSmUBGn+5GImX6UpTfJroHkrpql8KdObGha+lvnZa0nUotIFdKKNFcuLp4IHQREhgTnvY2OGwD/BSiHFbERlo5fK5YrIa7UkqrRUoiUyJNAuNY3cNZc3RKXSbvK0A1Sv+EsXIcfuAWEDnVramoc0oanXeyL8QtNKkNdXKsdbW9V1twqYrkQbR13fj+vCShHQo6cF12WBtUAHO7nFkVuDuZ1gVIFyZfwm7bzPNmcc5Z4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CHAPR11MB9653.namprd11.prod.outlook.com (2603:10b6:610:301::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.18; Mon, 12 Oct
 2026 06:27:01 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%5]) with mapi id 15.21.0472.016; Mon, 12 Oct 2026
 06:27:01 +0000
Message-ID: <6764bc5b-a252-4817-9bff-41bbb727108f@intel.com>
Date: Mon, 12 Oct 2026 11:56:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 08/10] drm/xe: Introduce temporary device wedging
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <michal.wajdeczko@intel.com>,
 <matthew.d.roper@intel.com>, <michal.winiarski@intel.com>,
 <matthew.auld@intel.com>, <dev@lankhorst.se>, <jani.nikula@intel.com>,
 <lukasz.laguna@intel.com>, <lukas@wunner.de>,
 <daniele.ceraolospurio@intel.com>, <badal.nilawar@intel.com>
References: <20260821112436.545405-1-raag.jadav@intel.com>
 <20260821112436.545405-9-raag.jadav@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260821112436.545405-9-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0105.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::7) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CHAPR11MB9653:EE_
X-MS-Office365-Filtering-Correlation-Id: 0515d288-87de-48ae-c95b-08df2829d327
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|10067099003|261009223027099003|261009223327099003|261009220027099003|261009221227099003|261009221727099003|4143699003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 6kApTMgYQhl3/AMHW5yQNWtsUZ41xpFLKjmXWAW60g8V3GdvgLh2JxzTTOTUMBYfDTXL7XMpq6h4A59F8xdmJDPOlr23iCRsYAughvkNttkvoqKXCCtypjgouPHPR0rpCUSOV7wWHHgticCFN6CL3/AfiNkU4Xy8ED9z/9zcHw7yMH85UOQIOn8h+Kz9mBf2ckblKW/yN5X1PzatQynuIgwJ12NwYNfAWVD8VxKCCiJUsFqkzKWvTFIqbQgnaQOl00SZkGvnhSn2zN5IlSYszsaQyrl2NnEZ5zAVstXYT3ik4uHYmoM8BFXHlDkddeP7GlrneYwF9+Rcr8mEBg9ogQdT6bA7+AOwI+CLAW3ZscZNfyonJuumOZms8p2nxehwyVL/lV0mG1AcvO+6/M7lteXxikYlxgmlQ3m0uoWTbDHa3bO0ZJC/2YCa7f2H7/698pNNjJZ2uQ4O8S3wGETzo7wZf15eeRPj6CBcmgJQ1eaKazoh1DJHST0AM+iKKpa2mEAiMp4l/R6UXCqM38lHjNdiQXQtLgEThdFhvrGGOZEtM5Kie+txGX4IrsXgw/UMsbg+VSJZ5NA+ACoR8bbzHuPGE88tTfkNc2gpbgJf0Cp+OthbaE5eYez7TkjlVwqnA7ZrYa9eFYFBzBA38aROucoOP7ATUIGwXuMXesuzzbs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10067099003)(261009223027099003)(261009223327099003)(261009220027099003)(261009221227099003)(261009221727099003)(4143699003)(11063799006)(22082099003)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjBpSDBOZGVVd2pkV1NHNkg1ZEVTQUtJRHYrTTNNc091RlVobWlTZUNEYmV0?=
 =?utf-8?B?WGIzVktINHdINm1SbjB3cHJrMzRGMHdXc2tWMDc5eTBmTnZQZUM4MmJNUlRp?=
 =?utf-8?B?bmdQMVJiUm16SWdUblZWckpiaEdRUDR4a3M5VWMwSlhIZUozaWV6MkF0OUlw?=
 =?utf-8?B?RE93MVdQSnRoelBQZk16NWhDbmlrc1VKSWRFMS9peDBPNHplc21DaHVkWW12?=
 =?utf-8?B?UGhFZGw4OUFCU3RTeTgrd0M3eFpTNmtCNHVzdUhXM3VzYkg4a0YxSEcvVXBr?=
 =?utf-8?B?YUl4ajhIZ1Zmc0V3SVFNalNyeXk5b09yWDFiR3RJbnJ5Wjkzc1JnRjRiNmxP?=
 =?utf-8?B?U0lZaVk3ZzAxMWJNZVJFdVI5aE5JYnI3SEptYzNzK0FDUGRsSFpDckZRTnRs?=
 =?utf-8?B?RHBzRmcyNjVlQkFEVzBYQTFhb2pFVmk2eENtY3NZMmh3RlRWOHZQeTlFSGUx?=
 =?utf-8?B?M3JkMTZkenJRWjdnWXMwOTNTbVF3V3hSMHFZMmJTOTdrODc5TFd3VEVscThY?=
 =?utf-8?B?WmU1QTY2cTlmbzcwaENhNlNqbHo0VW1vT2Y0NG9raXphZisyUittQjJ1RVNB?=
 =?utf-8?B?dmE2WnV3UVFDTmVLbmQ3NVM1VU1SbWN6RzFDK0s2dm11T3JMOW1EaFB4M3JE?=
 =?utf-8?B?VDB2OUtHZENxU01sL0tTZVhDWmdXN3ZtN3JUVmEybzlxazk5UmRlTC9hZzlK?=
 =?utf-8?B?aEVCMXRrWXg5RitIVWpyQldDc29saG9XSDNSSUhSaWpMdGZVSitiNGlHbDNI?=
 =?utf-8?B?elBWa2ZMNDl1dFNQc1JkeWRWRkFXemw0akk2MVZNbzZSaHh1K3cyNUt3VEVi?=
 =?utf-8?B?eFM2eGFkTkhhN01kbVRZREc0MXlnaHg1dTNBejZtSytTZzFBWkJzWDBuL09m?=
 =?utf-8?B?d25CRW5QbHhSMDZvRE1XcWw2T0lMMVZnb3FibmdlbmJUTWtCR0M3aEJ6bWRW?=
 =?utf-8?B?Y2t3dStrTXlIZ3N6SlhaUWRpbzhoak5kdFVxVmlZT2JLR2RqUGkyM1g5eEE5?=
 =?utf-8?B?SXNrRmQwVjRRU1N5ZG40S3cvTVM4MlpIdFdYN1NqenF5NFUvbmFMakwxeTBF?=
 =?utf-8?B?TU5va1RwelYzZ3kyWnFPai9rMnBLbnQ3M3g5ZU9TNGFZSGdtNVplVnhTWEln?=
 =?utf-8?B?Ryt1N3R3M21lUzdGeGVyQnE5Tis5eUNlQVBUZlhUQ3A4NjlXczdJellnUU1n?=
 =?utf-8?B?VFlibVN3eVViYmlrb2x6RVkyYkxmZWM5aWYzVDBtdUhsMmV4M0FnU2tCWGRh?=
 =?utf-8?B?U1AwMFVHZ0diY2QxV1JPYWlRLzgzakcrQUtXMzc2YVBUMWY3U0p4VVZ5Z2ho?=
 =?utf-8?B?VWZQVDBTcGNXWWdmYUxvbHJzZnl2ajZIbzdCdkxvdzl6andLU3F0clBZRkdB?=
 =?utf-8?B?TTFpZU9VcW03NXY5R0tJMWN4K0F5Z2IveUJyVDUrSDd3aEpzUFNJcU1FdUFm?=
 =?utf-8?B?elZUSTcrT1FnRXVCekxlS1JSM1V6SkFFYVM2cDhKTUFmRlJzOTJwMHJPcHg4?=
 =?utf-8?B?b0F3L0hqM1JlME9TSFM0RWUvbUpyQzcxUWEwZm5iM1gyNEl4RG0wN3Fxcm56?=
 =?utf-8?B?ZEhzanB4emQrU1pRcFM5MnhMRGd1U0dVN1RjT1l0QWRnY0kwb3YwanRkYnRw?=
 =?utf-8?B?SDZiQU9xMXJoTWFneG9iblZrZ3ZIL3A0TjMzczA5VkZLclZUZjZWdkJMbWNV?=
 =?utf-8?B?bWJ1MFdFQ1NzdHdnTWh5YkZkL1diUHYvNWdmTGNtenlzWURaVjdkN2NSd0o3?=
 =?utf-8?B?ei96VVZSL1dqYTEyVG1SdzRBbWpZcW5rYmI2dUVsWXJUVVB2UW5pSkNnQTZF?=
 =?utf-8?B?cHgreFlhZTJNeUxmcmIzbXAveWR0M3J1L0ZRMGpXQktBc0p3ZUtzVWtaZTRR?=
 =?utf-8?B?SEdlOVpqdGJXK0NuaGNDeW02azlpR2NxeTB6aWV3NjlsQjk2eGdLOGkrc1Ro?=
 =?utf-8?B?OUh0Vmx1bHFvUXEyMW5Kcm12OVRaSDA0dVcvVUIyOEEzZk12eU53MER6ZjVE?=
 =?utf-8?B?Y3RoRHljdGFvY0JPMXVpdXk1QjhuaXVjaDV3cU41N1NqZ2l6bjBXZm5ybWd6?=
 =?utf-8?B?dDhDOWU4dkpXSXVFOCt3TnBlaWZJT0V5MDczYk1TVTRMTHhnNDM5djdOdWFj?=
 =?utf-8?B?UjVoamoyNFNMRzZoL3VpL2N1dStjMTE4V0J3NVRIUTlDUnVnZVBnQTJqWnVs?=
 =?utf-8?B?WlV5Z1ZTMGIwU3lGVmQvU0hNK2YzRFBCOTRBdUs1bGplSEcyVE9xLytmTVIv?=
 =?utf-8?B?ZzU5a2oyTUZ0a210S2Uyek4xYmwrdm43WUpRbXF2cjdHUXZhZ0wrcklGS1pY?=
 =?utf-8?B?Ujg0d0NWY2VFK3dlRS8yaXNsUWl1ZFV5ZjgxemVqcUNqTE9YM0FEZz09?=
X-Exchange-RoutingPolicyChecked: X+BbjEea3ZoyCXrS6i9IF5kh59jk1qKcfQXDdQDU36fKdbR5Uv1tg4IwSUKH8D3CRSmoGB1RFNzYFrWyVh3GOaZ2T/3IyKn7iy2T7tLknMoR1o8Nc9hb6tGFlIrupw2J8kE/pJQsHIghFyyZctY8z1j0PlPJl21KNYGSJ0NsJhLkvakbbxS27CgwOKd+A+Itvq1gCCmDSdgLmccLpRAClT/tQkgFaNPKUQ+20soiBd7vCuWG9ZvAzKsAc2ANVfheE0Gr9piMoZL8zHRj6M1TzNkGss48wZgb5VKmxx/DqwJyf234dqiJrGe4Lq6yHkDE8NnEu3OejMvde8pCLZXYHQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0515d288-87de-48ae-c95b-08df2829d327
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 06:27:01.5127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ulY3IhGJKMjhndOv2CLWun2GTdFNpxjLoUq7qjrSWMsP4bdO3wqaQlHj2LdKqDnhafT9dg/Ep3tElff1Mz2Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR11MB9653
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



On 21-08-2026 16:53, Raag Jadav wrote:
> Currently, wedged state is serving a single usecase where the device is
> permanently declared wedged, but this doesn't allow any wedged state
> management for runtime usecases. In preparation of usecases which require
> to facilitate temporary device wedging, convert wedged.flag to wedged.ref
> which serves as a driver internal refcount for wedged state and blocks
> critical path execution during device lifetime. While at it, introduce
> wedged.perm which signifies permanent device wedging and operates
> independent of the refcount allowing relevant cleanup action on unwind
> path.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>   v9: Redesign to prevent races (Sashiko)
> v10: Spell out temporary device wedging in subject (Lukasz)
> ---
>   drivers/gpu/drm/xe/xe_device.c       | 106 ++++++++++++++++++++-------
>   drivers/gpu/drm/xe/xe_device.h       |   8 +-
>   drivers/gpu/drm/xe/xe_device_types.h |   8 +-
>   drivers/gpu/drm/xe/xe_pci.c          |   1 +
>   drivers/gpu/drm/xe/xe_pci_error.c    |  10 ++-
>   5 files changed, 96 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 0ffed5d1cadb..8317bb9b81b4 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -607,6 +607,10 @@ int xe_device_init_early(struct xe_device *xe)
>   	if (err)
>   		return err;
>   
> +	err = drmm_mutex_init(&xe->drm, &xe->wedged.lock);
> +	if (err)
> +		return err;
> +
>   	err = xe_pm_init_early(xe);
>   	if (err)
>   		return err;
> @@ -930,8 +934,10 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
>   {
>   	struct xe_device *xe = arg;
>   
> -	if (atomic_read(&xe->wedged.flag))
> -		xe_pm_runtime_put(xe);
> +	if (xe->wedged.perm)
> +		xe_device_wedged_put(xe);
> +
> +	xe_assert(xe, !xe_device_wedged(xe));
>   }
>   
>   #ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
> @@ -1433,6 +1439,50 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
>    *   firmware and restore device to normal operation.
>    */
>   
> +/**
> + * xe_device_wedged_get() - Acquire wedged reference
> + * @xe: xe device instance
> + *
> + * Get runtime PM reference and block critical path execution.
> + */
> +void xe_device_wedged_get(struct xe_device *xe)
> +{
> +	int ref;
> +
> +	/* We should not be runtime suspending as long as critical paths are blocked */
> +	xe_pm_runtime_get_noresume(xe);
> +
> +	ref = atomic_inc_return(&xe->wedged.ref);
> +	xe_assert(xe, ref > 0);
> +}
> +
> +/**
> + * xe_device_wedged_put() - Relinquish wedged reference
> + * @xe: xe device instance
> + *
> + * Restore critical path execution and put runtime PM reference.
> + */
> +void xe_device_wedged_put(struct xe_device *xe)
> +{
> +	int ref;
> +
> +	ref = atomic_dec_return(&xe->wedged.ref);
> +	xe_assert(xe, ref >= 0);
> +
> +	xe_pm_runtime_put(xe);
> +}
> +
> +/**
> + * xe_device_wedged() - Check for wedged device
> + * @xe: xe device instance
> + *
> + * Returns: %true if device is wedged, %false otherwise.
> + */
> +bool xe_device_wedged(struct xe_device *xe)
> +{
> +	return atomic_read(&xe->wedged.ref);
> +}
> +
>   /**
>    * xe_device_set_wedged_method - Set wedged recovery method
>    * @xe: xe device instance
> @@ -1476,36 +1526,40 @@ void xe_device_declare_wedged(struct xe_device *xe)
>   		return;
>   	}
>   
> -	if (!atomic_xchg(&xe->wedged.flag, 1)) {
> -		xe->needs_flr_on_fini = true;
> -		xe_pm_runtime_get_noresume(xe);
> +	mutex_lock(&xe->wedged.lock);
>   
> -		xe_log_err_fatal(xe, WEDGED, -EIO, "Device declared wedged!\n");
> -		xe_err_once(xe, "IOCTLs and executions are now blocked!\n"
> -			    "For recovery procedure, refer to %s\n"
> -			    "Please file a _new_ bug report at %s\n",
> -			    WEDGED_URL, XE_BUG_URL);
> -	}
> +	if (xe->wedged.perm)
> +		goto out;
> +
> +	xe_device_wedged_get(xe);
> +	xe->wedged.perm = true;
> +	xe->needs_flr_on_fini = true;
> +
> +	xe_log_err_fatal(xe, WEDGED, -EIO, "Device declared wedged!\n");
> +	xe_err_once(xe, "IOCTLs and executions are now blocked!\n"
> +			"For recovery procedure, refer to %s\n"
> +			"Please file a _new_ bug report at %s\n",
> +			WEDGED_URL, XE_BUG_URL);
>   
>   	for_each_gt(gt, xe, id)
>   		xe_gt_declare_wedged(gt);
>   
> -	if (xe_device_wedged(xe)) {
> -		/*
> -		 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
> -		 * hangs, so wedge the device with 'none' recovery method and have
> -		 * it available to the user for debugging.
> -		 */
> -		if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> -			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_NONE);
> -		/* If no wedge recovery method is set, use default */
> -		else if (!xe->wedged.method)
> -			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
> -						    DRM_WEDGE_RECOVERY_BUS_RESET);
> +	/*
> +	 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
> +	 * hangs, so wedge the device with 'none' recovery method and have
> +	 * it available to the user for debugging.
> +	 */
> +	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> +		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_NONE);
> +	/* If no wedge recovery method is set, use default */
> +	else if (!xe->wedged.method)
> +		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
> +					    DRM_WEDGE_RECOVERY_BUS_RESET);
>   
> -		/* Notify userspace of wedged device */
> -		drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
> -	}
> +	/* Notify userspace of wedged device */
> +	drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
> +out:
> +	mutex_unlock(&xe->wedged.lock);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 67083915320a..8fff3fd489c7 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -209,11 +209,6 @@ bool xe_device_is_l2_flush_optimized(struct xe_device *xe);
>   void xe_device_td_flush(struct xe_device *xe);
>   void xe_device_l2_flush(struct xe_device *xe);
>   
> -static inline bool xe_device_wedged(struct xe_device *xe)
> -{
> -	return atomic_read(&xe->wedged.flag);
> -}
> -
>   #ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
>   static inline bool xe_debug_page_size_supported(struct xe_device *xe)
>   {
> @@ -262,6 +257,9 @@ static inline bool xe_debug_page_size_mode_is_mixed(struct xe_device *xe)
>   }
>   #endif
>   
> +void xe_device_wedged_get(struct xe_device *xe);
> +void xe_device_wedged_put(struct xe_device *xe);
> +bool xe_device_wedged(struct xe_device *xe);
>   void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
>   void xe_device_declare_wedged(struct xe_device *xe);
>   int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 180d450a6deb..7be3f15bf7a0 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -526,14 +526,18 @@ struct xe_device {
>   
>   	/** @wedged: Struct to control Wedged States and mode */
>   	struct {
> -		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
> -		atomic_t flag;
> +		/** @wedged.ref: Refcount for wedged device, blocks critical path execution */
> +		atomic_t ref;
>   		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
>   		enum xe_wedged_mode mode;
>   		/** @wedged.method: Recovery method to be sent in the drm device wedged uevent */
>   		unsigned long method;
>   		/** @wedged.inconsistent_reset: Inconsistent reset policy state between GTs */
>   		bool inconsistent_reset;
> +		/** @wedged.perm: Permanently wedged, needs cleanup on fini */
> +		bool perm;
> +		/** @wedged.lock: Lock protecting wedged state */
> +		struct mutex lock;
>   	} wedged;
>   
>   	/** @devres_group: devres group */
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 1e04e8ef2611..9a6c8e16a0b5 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1390,6 +1390,7 @@ static int xe_pci_runtime_suspend(struct device *dev)
>   	 */
>   	xe_assert(xe, !IS_SRIOV_VF(xe));
>   	xe_assert(xe, !pci_num_vf(pdev));
> +	xe_assert(xe, !xe_device_wedged(xe));
>   
>   	err = xe_pm_runtime_suspend(xe);
>   	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
> index 79ce0c671549..48466d726eae 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -25,8 +25,10 @@ static void prepare_device_for_reset(struct pci_dev *pdev)
>   	 * xe_device_wedged_fini() releases runtime pm if wedged flag is set, so acquire a runtime
>   	 * pm reference to avoid underflow.
>   	 */
> -	if (!atomic_xchg(&xe->wedged.flag, 1))
> -		xe_pm_runtime_get_noresume(xe);
> +	xe_device_wedged_get(xe);
> +
> +	/* TODO: We shouldn't be doing such ugly hacks, reuse FLR helpers and drop this. */
> +	xe->wedged.perm = true;
>   
>   	xe_device_set_in_reset(xe);
>   
> @@ -126,7 +128,7 @@ static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
>   	xe = pdev_to_xe_device(pdev);
>   
>   	/* Wedge the device to prevent I/O operations till the resume callback */
> -	atomic_set(&xe->wedged.flag, 1);
> +	xe_device_wedged_get(xe);
>   
>   	return PCI_ERS_RESULT_RECOVERED;
>   }
> @@ -137,7 +139,7 @@ static void xe_pci_error_resume(struct pci_dev *pdev)
>   
>   	xe_info(xe, "PCI error: resume\n");
>   
> -	atomic_set(&xe->wedged.flag, 0);

Since there is an assert in xe_wedged now. Can you please add a check to 
check if device is wedged before releasing ref
in xe_device_wedged_put
Thanks
Riana

> +	xe_device_wedged_put(xe);
>   }
>   
>   const struct pci_error_handlers xe_pci_error_handlers = {
