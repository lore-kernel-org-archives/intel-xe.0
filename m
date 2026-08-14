Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498EEC5CFC1
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 17:31:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AFCF10E193;
	Fri, 14 Aug 2026 17:31:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BEaT3aYS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 444EF10E589
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 17:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786728686; x=1818264686;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ptml9o2ScgqYQV21GiCbIUMmEGq6142O8s8v1TJP9j0=;
 b=BEaT3aYSaaGppFqfsAzXggJu6nXNSgQ9OEPxBB0jkT7vaP0/7X5HlPRR
 jNX2sIp8V4DhHG+LHeNqSSbdwk4QC5ObBWTlwkPBFZqu1zrgtlNHpMfRx
 urljDnaogE42l8S1mdhe6uVhzscrjhyL7GBuKWCpUq5REnZL8UYrkOWZv
 DT0+IyFy7U50/ZvvC4f+2JQpkrMzDSp3AP1QUi1D8YRRZw7mGKdjxsU75
 wrQYDEC5dQ3AbhJP39FnplJ4d59QbUkRSQT8Cy0F7cxnPi0wtMSo/qOud
 96rK4xs/jo+Jsxu7XMLakKwHKQAM+pI7HvRv/tC55mmlHDVBrno52jA2P Q==;
X-CSE-ConnectionGUID: h+uuphy0SvS38/ERCanJRg==
X-CSE-MsgGUID: cRbMO/rpT/yE+Dd+wl/0ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="91183713"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="91183713"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:31:25 -0700
X-CSE-ConnectionGUID: UsfhE+HfTJWqb5ujjVCndA==
X-CSE-MsgGUID: iLM6+8SiQYCfYxlFpUFCOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="266275587"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:31:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 10:31:24 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 10:31:24 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.25) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 10:31:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wuXCUlDKfADf1Oz5dN8J6jMUjBwIZBA+A5E9X+1oOGiHWLkAlhxtvE5zSQEVpCRpmRplUgl+MrkacfeI8v217ycvpeTu3r9rCnuBC3v1YX1QxKxDb5QE6zszQ1c/Vb8SVglycjCLexKSEq3KSl9cacFWnJVMl+m9B9iFAaglyjsCW2xMVskn0Itfd7jYEME7i0uJTe7OZPVIxzmS7sIEYv1qtkRkRidIQ+cFAjENkYisOlsplHBUPwy3wtraJFuHqNHEqd+qwDc7/Zj+ymu7oJke5jlQEP5vma+FnVwUK3j85BUNJNZMYCmFj1NjSHt2AHhvgN8hUC8zaTB8B7oaIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dTuQPjVOCtvi5RaugvMUDw2asaCvdj//OUIuYFoG2W4=;
 b=KSKKfjqLEJ0O0ffjci7oi+VPj2u+yWrrGewWyoT3Ql+5nJoHip838l2/mAYIVkhOA0fxTk5fezNeNjQzOBR7YrMR5ZN8yHyJxDYsON/CYrBlOq3/p0oqV0KZpUZE3CEk64+FP4+P1lbJjbtUvTrH9fNUABXbNAH3ALEzii/nLnkAjHkk4WneIaBmwN+4gaTplN7wh0bimgDKn9FOtexyLNxmYEYxH0Z2veHcian3LAYXkXVJ1ofzdaU4Su+eSVEUvujyOkOddk8xLUY/zREIOjii8DKkm6/Ph8bYBx1qEObQkBmw+DUITpK6C5cCHttG4kZbCqyauNfIGs3k234Bsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by IA1PR11MB8100.namprd11.prod.outlook.com (2603:10b6:208:445::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 17:31:21 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 17:31:21 +0000
Message-ID: <ce492bcc-e18c-49ba-b9b0-449e484a9e58@intel.com>
Date: Fri, 14 Aug 2026 23:01:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/33] drm/xe/log: Add structured SIGID error logging
 infrastructure
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Mallesh Koujalagi <mallesh.koujalagi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Riana Tauro <riana.tauro@intel.com>, Stuart Summers
 <stuart.summers@intel.com>, Yoni Levitt <yoni.levitt@intel.com>, "Aravind
 Iddamsetty" <aravind.iddamsetty@intel.com>, Raag Jadav <raag.jadav@intel.com>
References: <20260814171801.13347-1-michal.wajdeczko@intel.com>
 <20260814171801.13347-3-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20260814171801.13347-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0151.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::14) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|IA1PR11MB8100:EE_
X-MS-Office365-Filtering-Correlation-Id: 4083625d-7091-4b70-96e0-08defa29db4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|6133799003|10067099003|4143699003|5023799004|56012099006|11063799006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: nMiZCf+Pb8KO9UofOLBsXdK1lbcjmVvVwnmvc6IpLbpPzPuWPbOHiy3RS+Ru7T7faO0fKtsVG9IurMrklsQDmWGbKllsUk59HaSvbHturZWYUdLpLIRrqO1dyQFVlzPZv4xb76igOoZRmq1KmV2mFt/MdaL1a8a0Kw/nYcRflOxF9tQzEr7pv8d0AkxisW+IG9a6KLwTxF92W6ORBJZOtIJjTet+oVgrLUBgIt7jnJYdiYNXDUAshNI8Zh3cHww8Drbd0JoVYY/CqC2XKNooKyOiXI0uMTvJ4NRdpLc2uNj0XNI9u4TRA0jTSCF7GOaMDiFpWcCP0Gfzfd6kBAoHA8tN4W7TrmUgA/tXilPSGgfamC0t467K5vdLDyVWYKhwZ6b/Ygy80Y/PmUiR0CrZY5ZgrqrmlIfatSaKEpgqdNXM3G57avFiDsPrAERlX6zbTAOjx4INlX/A14WTWwrDMtG7PSskZbfFeSo+RzD27U564Ezaq4fKxUS5dfhx4963pVUmxa9avtJ8IVBKVPK+M77hPhEYehW8RZj8by+o2ujuFHEoxfsgHFtiaxjTpdXy2xO3eYZyfvm/h5aKoWOzmlTPn06FQPfxH4dwANsW8SugLtf13ZbNfXmd8Pwli0ntKJARii87DqYsmPTUc5tn5v3naaNDXLiZxzdbnrvcl84=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(6133799003)(10067099003)(4143699003)(5023799004)(56012099006)(11063799006)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZStqQVNYdEgwd3hmWDIwbk04T0dNUWNsOW1vcFVwblMxeHNub2VJWFpZeVJB?=
 =?utf-8?B?NFc1M1Y4cUE4TXF6WTFFckpIaWJJNENHbDhnTVhkVWszZkpiTWtzZU1oWFZh?=
 =?utf-8?B?Mm1GLzJKNGpuRVFxbGRPVTNmZGpLbVRQK1pCNlY1bENkelhQQkpqQVRuUkw5?=
 =?utf-8?B?SnY5Z29KR0trOFIzb3kwUVFkbFlrR2d4NUZVQllLOFJqUlZtUnRPZExPR2pO?=
 =?utf-8?B?WU9rMTdTeHJ3R2xTNVdLb2x6dEFjMWFDMHJKcnZ1WWlySUFlbjFIMEpxNG80?=
 =?utf-8?B?bXowSHdxTTR3c0I0L1Y1SmlibmlNMFdWcHV5VXZxbUdDRFhpN2RIdmk2N0Nx?=
 =?utf-8?B?OFZIQk9Gdzg4N21iM0JFd0pla3R2c0FDL0lwWkZIV1FqZVh5eFZiVDZTY0Ns?=
 =?utf-8?B?OU5PeW9nTUdCUWZYMUQyckx1T3RGeG95NU5jcktpV1N3bXo5aXdkYVppYjhL?=
 =?utf-8?B?eFFBOUpGd2VTVzZ2RExVTzI2M3lId2M3d1Zxb0dUTjljWjQ3WGF0TG0rcm9M?=
 =?utf-8?B?VGFUaFBDaXlWdlpMR0xHVFAzdVgya01MNmRib2ZGWTFuaWdsUkkwMGp6aW5X?=
 =?utf-8?B?eWNIOFQzMUVXbC9wOFEwbjVIVmRQYXVEMllURy9WNFNhME1IZ0x6NHZpWGN5?=
 =?utf-8?B?VHMrUk85aDJVSC9VbWh3UHp6WWdkeWYxb0o4dXowVDJ0RVk4UEZGampkOC9S?=
 =?utf-8?B?RkI0ZVFYVUlDM3AzUkhWOEthQzEyK1hzZ3ZMWEVQSHk0Rk0wWmNNZDJyZ2ZT?=
 =?utf-8?B?aWQ5elorcGQ3UEdvZVlTVk8vU04vZE5OM2hqZVR1VGhkTGU5cGRDaEtoRGZ0?=
 =?utf-8?B?QTZkMEdYOFRYYXkwZTFNd3JRY0hsZHRWdVN3L1VoR0JTR0tuZU9KVDlCQllV?=
 =?utf-8?B?RmdxUWg2SHFpQmZQaDVhMlp3WFlBTlpEV3VBWVl1RXVOSDhONDIxa2MrRjhR?=
 =?utf-8?B?WUpUdlQ2Q3JvQ3R3eHhEeVQ4STlWTXE4a1RkWkZjZnNTbE9vSldsTjJYVEFi?=
 =?utf-8?B?Ykg5YXZvejc1c3JVYzdBbU1GSWtjaVVCZ0tFejA4anFyTVI4MGMzUFNwZFlP?=
 =?utf-8?B?ZTlzM3BTb09CTjJFcFo0SDd6b3d6NkZ0a0U2U3lVQ3NpWXJWRFVqY05TKys3?=
 =?utf-8?B?THIzR1JyOWJ0V3lkUm9xQndPMEMvQ3NJVDhPTTI3YnVDNkJQWU03bTNFaWdV?=
 =?utf-8?B?QjRpOVNST29OTFdRQ3N1Z3hHeGdjaGlIcHNHemVXdEFENjFvczBUaGdIOGsx?=
 =?utf-8?B?RkxrNWNSU1hpcHpOWk5BYW1tY3dFR1pGdVlhMy9JRzdkYkwvbWxmYVcrRFV6?=
 =?utf-8?B?UEVBUTJ0UnY3R2Z1VGFEbUhOWk5iaGNqTVlsYjM5SndWK0QvZzV3NFp3cm5B?=
 =?utf-8?B?YXI0bjVvejdBU0hhcGV5cFJ3Y2piOTJXWE9XRXVscDhiS25uaFl5UXVQTlFP?=
 =?utf-8?B?SlNyZW1EMi9JdUMweXdnL3hBNnlBK0pNdVhNNW5tU0ZVbjlCSG8zZC9MSmt3?=
 =?utf-8?B?T1BEQndGUUZqUytsVEkzRlRRVDBnRW8zMjdMQTNpQjRSZDBlWlZuYTBjWFNE?=
 =?utf-8?B?UnZVWk9oVnl1eDNyem5lZ2QwbVZxell4ZVY0ZXZQVDB6alVZc09hMi9teUt6?=
 =?utf-8?B?K3pZejdVeVllT2FUS3FTZkJrRFJGdllRVXJBbmUwdmdDK0FiSUpSL3p4Tkpy?=
 =?utf-8?B?ZGc4cFYvTkp6UjU5Zy9YSHFHRTNONVhWdGtBS3NrZUhNQW10MnZRdW8zK1Vp?=
 =?utf-8?B?WTNXWmEyQko1UmdNOE43QmFTU2plVVFYZ0pQZXdzcW8rU1BsRVR1QjNNRkxu?=
 =?utf-8?B?Y1czcDB3dzdoLy9jS3VMMDRnWUhQRElFVXF2STB3ZU1naU9rUmZqOWlUNjJV?=
 =?utf-8?B?QWZBaURNN1NiOC9LdGkzY0NmMHdWUTBSTkI4RGJUa2xwc2JQNUg2TDltaHZK?=
 =?utf-8?B?VHN1eFptK3hkVDlaM1QwSWZPeGYvekxKRHJWTlo4Tk1xSUcwTU1BQ3BXRUxt?=
 =?utf-8?B?UUM4U0hyWWZGOUVDdE1CRXhFaDJFbDlIK1Bsb2wzY2lHUk1VSGxjL254WnVD?=
 =?utf-8?B?YWxVbXhPaHZiZ3RtMmxTZ0NFSXFiUFliOEJoZ1VnNENOa2dJV1FIM0RPRFgw?=
 =?utf-8?B?eEZmR3VEckNhQlFNSkdPdElBUGFtQWJhZGlYandmN2RhRlBhdkZuak5hNVdI?=
 =?utf-8?B?SEVVNnFSQmRHSG1TQXQySDlDNkxjc0NPY3ZxR2M3MUZvREtTVnRYak1WSXVL?=
 =?utf-8?B?VXJDdG5YRWxKZWtOMjRhd2VOVDVIaTFSdTBNSi85ZHRaTEU4UW9ydElrWExj?=
 =?utf-8?B?eThrRHVURm1uenFldVBoQ0tZdkhFMXlNVXVPMDliNHQrTEVpdVluZz09?=
X-Exchange-RoutingPolicyChecked: sDt396saGG4UvF2ToYkGqO2PsdcnZtqnEHDymEbPWFZKZ1ryv/jiw/h4UEr5LF4J1KKbi/r+E8wHttGSHOK/44HcR1TjdpmvNWpnM5Ztex4AsoeCTxCuAMGpqdH5lholPSj/CuKLdaQDeAsmfTx2PgEEINnfH7zBDHioA/Nt9iEcTNlUfbK3xIcW81mqZ7RIUFZeEUEboOt9qZtQXWwpeUMsbQdaENcHuJnhf2iJ8POti3CTjqXX3Owl0UiFz1OkcY5fG0dHp/jl8A5fTWfK6iPV/mNTyQ3Jo7uM79pNPaUw8kcNEl5JKMp6aJpwnkDFQhKlxtIgBZlNXXUCPFNvOQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4083625d-7091-4b70-96e0-08defa29db4c
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 17:31:21.3711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eBV4vGHeXubrPZ2j5eAfKAXb3SMfDdfgQAcpJa7o2FBWYn3ffdgXGV8AvODV3sk0aqazIUvk9p6am4AxIKi1pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8100
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


On 14-08-2026 22:47, Michal Wajdeczko wrote:
> From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>
> Today the driver reports faults with ad-hoc drm_err()/xe_gt_err()
> strings that have no stable shape. That is readable for a human, but it
> gives fleet tooling nothing durable to match on: the wording changes
> between releases, lines can be rate-limited or dropped under an error
> storm, and there is no consistent way to ask "which recognised fault
> just happened?".
>
> Introduce a signature identifier (SIGID): a small, stable integer that
> names one recognised Xe fault site and serves as the primary handle for
> triage. A SIGID maps, through published end-user documentation, to a
> description and a recommended action; the driver only has to emit the
> right SIGID next to the usual human-readable text.
>
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Assisted-by: Copilot:Opus-4.8
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Co-developed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> cc: Badal Nilawar <badal.nilawar@intel.com>
> ---
> Cc: Yoni Levitt <yoni.levitt@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> ---
> v2: CORRECTED is still an error (Michal)
>      prepare to decorate dmesg with comp/loc (Michal)
> v3: update SIGID DOC section (Riana/Aravind)
>      warn about unknown severity (Mallesh)
> v4: fix typos (Mallesh/Rodrigo)
> ---
>   Documentation/gpu/xe/index.rst        |   1 +
>   Documentation/gpu/xe/xe_sigid.rst     |  14 +++
>   drivers/gpu/drm/xe/Makefile           |   1 +
>   drivers/gpu/drm/xe/abi/xe_sigid_abi.h | 159 ++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_log.c           | 138 ++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_log.h           |  20 ++++
>   6 files changed, 333 insertions(+)
>   create mode 100644 Documentation/gpu/xe/xe_sigid.rst
>   create mode 100644 drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>   create mode 100644 drivers/gpu/drm/xe/xe_log.c
>   create mode 100644 drivers/gpu/drm/xe/xe_log.h
>
> diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
> index 665c0e93601c..0247a255f7e6 100644
> --- a/Documentation/gpu/xe/index.rst
> +++ b/Documentation/gpu/xe/index.rst
> @@ -35,3 +35,4 @@ The display, or :ref:`drm-kms`, support for drm/xe is provided by
>      xe-drm-usage-stats.rst
>      xe_configfs
>      xe_gt_stats
> +   xe_sigid
> diff --git a/Documentation/gpu/xe/xe_sigid.rst b/Documentation/gpu/xe/xe_sigid.rst
> new file mode 100644
> index 000000000000..45d84a62f185
> --- /dev/null
> +++ b/Documentation/gpu/xe/xe_sigid.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +========
> +Xe SIGID
> +========
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> +   :doc: Xe Error Signatures (SIGID)
> +
> +Signature Identifiers
> +=====================
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> +   :internal:
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 44ed055439d4..92134709d998 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -87,6 +87,7 @@ xe-y += xe_bb.o \
>   	xe_hw_fence.o \
>   	xe_irq.o \
>   	xe_late_bind_fw.o \
> +	xe_log.o \
>   	xe_lrc.o \
>   	xe_mem_pool.o \
>   	xe_migrate.o \
> diff --git a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> new file mode 100644
> index 000000000000..ff7c97b4a78e
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> @@ -0,0 +1,159 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _ABI_XE_SIGID_ABI_H_
> +#define _ABI_XE_SIGID_ABI_H_
> +
> +/**
> + * DOC: Xe Error Signatures (SIGID)
> + *
> + * What SIGID stands for
> + * ---------------------
> + *
> + * SIGID is short for *Signature Identifier*. It is a small, stable integer
> + * that names one of the *recognised fault sites* -- nothing more. It is the
> + * primary handle used for triage and maps directly to a specific report site.
> + *
> + * Numbering
> + * ---------
> + *
> + * SIGIDs are a single flat list numbered sequentially within the assigned range,
> + * in the order the fault sites were introduced. Values are stable: once assigned
> + * they are only ever appended, never renumbered or reused. A retired fault site
> + * SIGID value is deprecated in place, never re-purposed.
> + *
> + * Why this exists
> + * ---------------
> + *
> + * Today the driver reports faults with ad-hoc ``xe_err()`` / ``xe_gt_err()``
> + * strings that have no stable shape. That is fine for a human reading dmesg,
> + * but it gives fleet tooling nothing durable to match on: the wording changes
> + * between releases, lines can be rate-limited or dropped under an error storm,
> + * and there is no consistent way to ask "which recognised fault just happened?"
> + *
> + * A SIGID answers exactly that one question, identically across driver and
> + * firmware versions, and (eventually) across other Intel devices in a node.
> + *
> + * What a SIGID is not
> + * -------------------
> + *
> + * SIGID deliberately does not encode the detailed reason or the outcome. Those
> + * are carried alongside it::
> + *
> + *   SIGID    -> which recognised fault site is being reported
> + *   severity -> how serious this instance is
> + *   errno    -> the failing operation's error, if available, shown with %pe
> + *   message  -> free-form human-readable context
> + *
> + * Severity is independent of the SIGID. The same SIGID can be reported at
> + * different severities depending on the instance and the recovery taken.
> + *
> + * When to use SIGID logging
> + * -------------------------
> + *
> + * The xe_log_*() helpers are for these recognised fault sites only --
> + * important, operator-relevant faults and events. The driver's only job is to
> + * emit the right SIGID next to the usual human-readable text.
> +
> + * They are not a replacement for ``xe_info()`` / ``xe_dbg()`` / tracing, nor
> + * for one-off diagnostics; using them for ordinary logging would dilute the
> + * fault stream. Not every ``xe_err()`` needs to become a SIGID report -- only
> + * those that correspond to a published fault site.
> + *
> + * SIGID log output (dmesg vs. the machine record)
> + * -----------------------------------------------
> + *
> + * The dmesg line stays close to a normal xe error message so it remains
> + * readable for admins; the only stable, machine-matchable token on it is
> + * ``SIGID=<n>`` (``dmesg | grep SIGID=``).
> + *
> + * The full dmesg line is not an ABI: the surrounding text may change freely,
> + * and lines may be dropped. The durable record for tooling is the CPER record
> + * carrying the same SIGID (generation is a planned follow-up).
> + *
> + * How to pick a SIGID (the uniqueness rule)
> + * -----------------------------------------
> + *
> + * Pick per *report site*, not per incident. Each site emits the single most
> + * specific recognised SIGID *for that site* -- so the question is never
> + * "classify this whole failure", it is "what does this site detect?", which has
> + * one answer. A single underlying failure therefore legitimately produces a
> + * *chain* of reports from different layers, each with its own SIGID -- e.g. a
> + * GuC communication failure is reported as %XE_SIGID_RUNTIME_FW by the firmware
> + * path, the failed recovery as %XE_SIGID_GT_TDR by the reset path, and an
> + * aborted bind as %XE_SIGID_PROBE by the probe path. That chain lets triage
> + * follow a fault from origin to final effect; it is not a duplicate.
> + *
> + * If a site does not match any defined SIGID, keep using the ordinary
> + * ``xe_err()`` / ``xe_gt_err()`` logging rather than forcing a SIGID: a wrong
> + * or over-broad classification is harder to retire than a missing one. When a
> + * new report site is genuinely worth triaging, add it to the list below.
> + *
> + * Usage of the existing SIGID reports must reevaluated according to this section
> + * after making significant changes to the site that emits this SIGID.
> + *
> + * Scope: software vs hardware emitted signatures
> + * ----------------------------------------------
> + *
> + * Some SIGID represents fault sites that the *driver itself* detects and
> + * reports from the software POV: probe abort, wedged, survivability, driver-
> + * detected firmware failures, engine TDR, memory faults and IO/bus faults.
> + * These are the only values the driver assigns on its own.
> + *
> + * Signatures that *originate* in firmware or hardware are a different thing:
> + * they are produced and identified by the firmware or the hardware itself
> + * (e.g. via their own records or error counters), and the driver merely logs
> + * them as they are given to us. They are deliberately enumerated separately.
> + *
> + * The two driver-detected firmware report sites below (%XE_SIGID_RUNTIME_FW,
> + * %XE_SIGID_DEVICE_FW) are software signatures: they mark that *the driver*
> + * observed a firmware problem, not a signature reported by the firmware.
> + */
> +
> +/*
> + * Top level Intel Error Signature Identifiers.
> + */
> +#define INTEL_SIGID_INVALID			0
> +#define INTEL_SIGID_BATCH			100
> +#define INTEL_SIGID_RANGE_START(n)		((n) * INTEL_SIGID_BATCH)
> +#define INTEL_SIGID_RANGE_END(n)		(INTEL_SIGID_RANGE_START((n) + 1) - 1)
> +
> +/* SIGIDs 1xx are reserved for Xe GPU software and 2xx for Xe GPU hardware */
> +#define INTEL_SIGID_GPU_XE_SOFTWARE_START	INTEL_SIGID_RANGE_START(1)
> +#define INTEL_SIGID_GPU_XE_SOFTWARE_END		INTEL_SIGID_RANGE_END(1)
> +#define INTEL_SIGID_GPU_XE_HARDWARE_START	INTEL_SIGID_RANGE_START(2)
> +#define INTEL_SIGID_GPU_XE_HARDWARE_END		INTEL_SIGID_RANGE_END(2)
> +
> +/**
> + * enum xe_sigid - Stable Xe Error Signature Identifiers (SIGID).
> + * @XE_SIGID_SW: Software component failure.
> + * @XE_SIGID_PROBE: Device probe/bind was aborted.
> + * @XE_SIGID_WEDGED: Device was declared wedged and is no longer usable.
> + * @XE_SIGID_SURVIVABILITY: Device entered survivability mode.
> + * @XE_SIGID_RUNTIME_FW: Driver-detected runtime firmware failure, GuC/HuC/GSC.
> + * @XE_SIGID_DEVICE_FW: Driver-detected device firmware failure, PCODE/sysctrl.
> + * @XE_SIGID_GT_TDR: Engine hang / timeout detection and recovery (reset).
> + * @XE_SIGID_MEM_FAULT: VM bind, page fault or GTT fault.
> + * @XE_SIGID_IO_BUS: Runtime PCIe / IOMMU / MMIO access fault.
> + *
> + * Each SIGID represents the report sites the driver detects and reports.
> + * Values are numbered sequentially, are only ever appended, and are never
> + * renumbered or reused.
> + *
> + * Firmware- and hardware-originated signatures are not listed yet here.
> + */
> +enum xe_sigid {
> +	XE_SIGID_SW			= INTEL_SIGID_GPU_XE_SOFTWARE_START,
> +	XE_SIGID_PROBE			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 1,
> +	XE_SIGID_WEDGED			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 2,
> +	XE_SIGID_SURVIVABILITY		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 3,
> +	XE_SIGID_RUNTIME_FW		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 4,
> +	XE_SIGID_DEVICE_FW		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 5,
> +	XE_SIGID_GT_TDR			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 6,
> +	XE_SIGID_MEM_FAULT		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 7,
> +	XE_SIGID_IO_BUS			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 8,
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
> new file mode 100644
> index 000000000000..37963fe4c59e
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_log.c
> @@ -0,0 +1,138 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include "xe_log.h"
> +#include "xe_printk.h"
> +
> +static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> +			  u32 component, u32 location, const void *data, size_t len,
> +			  struct va_format *vaf)
> +{
> +	/* TODO */
> +}
> +
> +static bool is_hw_sigid(enum xe_sigid sigid)
> +{
> +	return (int)sigid >= INTEL_SIGID_GPU_XE_HARDWARE_START;
> +}
> +
> +static bool is_sev_error(int cper_sev)
> +{
> +	return cper_sev != CPER_SEV_INFORMATIONAL;
> +}
> +
> +static const char *log_hwe_prefix(int cper_sev, enum xe_sigid sigid)
> +{
> +	return is_sev_error(cper_sev) && is_hw_sigid(sigid) ? HW_ERR : "";
> +}
> +
> +static const char *log_sev_prefix(int cper_sev)
> +{
> +	switch (cper_sev) {
> +	case CPER_SEV_FATAL:
> +		return "FATAL ";
> +	case CPER_SEV_RECOVERABLE:
> +		return "";
> +	case CPER_SEV_CORRECTED:
> +		return "CORRECTED ";
> +	case CPER_SEV_INFORMATIONAL:
> +		return "";
> +	default:
> +		WARN(IS_ENABLED(CONFIG_DRM_XE_DEBUG), "LOG: unknown severity %d\n", cper_sev);
> +		return "";
> +	}
> +}
> +
> +#define __LOG_DRM_PRINTK_FMT(fmt, args...)	"[drm] " fmt, ##args
> +#define __LOG_DRM_PRINTK_ERR_FMT(fmt, args...)	__LOG_DRM_PRINTK_FMT("*ERROR* " fmt, args)
> +
> +static void log_dmesg_vprintk(struct pci_dev *pdev, int cper_sev, struct va_format *vaf)
> +{
> +	if (cper_sev == CPER_SEV_INFORMATIONAL)
> +		pci_info(pdev, __LOG_DRM_PRINTK_FMT("%pV", vaf));
> +	else
> +		pci_err(pdev, __LOG_DRM_PRINTK_ERR_FMT("%pV", vaf));
> +}
> +
> +static void log_dmesg_printf(struct pci_dev *pdev, int cper_sev, const char *fmt, ...)
> +{
> +	struct va_format vaf;
> +	va_list args;
> +
> +	va_start(args, fmt);
> +	vaf.fmt = fmt;
> +	vaf.va = &args;
> +
> +	log_dmesg_vprintk(pdev, cper_sev, &vaf);
> +
> +	va_end(args);
> +}
> +
> +static void log_emit_dmesg(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> +			   u32 component, u32 location, const void *data, size_t len,
> +			   struct va_format *vaf)
> +{
> +	const char *hwe_prefix = log_hwe_prefix(cper_sev, sigid);
> +	const char *sev_prefix = log_sev_prefix(cper_sev);
> +
> +	/* TODO: add component/location details */
> +
> +	if (IS_ERR(data))
> +		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s(%pe) %s%pV",
> +				 sigid, sev_prefix, data, hwe_prefix, vaf);
> +	else if (data && len)
> +		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s(%*phN) %s%pV",
> +				 sigid, sev_prefix, (int)len, data, hwe_prefix, vaf);
> +	else
> +		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s%s%pV",
> +				 sigid, sev_prefix, hwe_prefix, vaf);
> +}
> +
> +/**
> + * xe_log_emit() - Emit a structured SIGID log entry
> + * @pdev: the &pci_dev device
> + * @cper_sev: CPER severity (CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, ...)
> + * @sigid: signature identifier, see &enum xe_sigid
> + * @component: component identifier
> + * @location: location details of the @component
> + * @data: pointer to the additional details, or ERR_PTR, or NULL if not applicable
> + * @len: length of the @data in bytes, or 0 if not applicable
> + * @fmt: printf-style format string
> + * @...: format arguments
> + *
> + * Emits a dmesg line that includes a single stable, machine-matchable token
> + * ``SIGID=<n>`` followed by the optional severity token (like ``FATAL``) and,
> + * when @data pointer is set, either the error printed with %pe or a packed hex
> + * dump of the @data binary blob. The dmesg line will also include printf-style
> + * text message.
> + *
> + * Note that the full dmesg line, with the free text message, is only a debugging
> + * aid, not an interface! Only the ``SIGID=<n>`` token is stable there.
> + * The durable machine record is the CPER carrying the same SIGID.
> + *
> + * Note: generation of the CPER record is a planned follow-up.
> + *
> + * Examples::
> + *
> + *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=104 FATAL (-EPROTO) Invalid GuC reply
> + *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=106 (-ETIMEDOUT) Engine 'rcs0' hung
> + *   <6> xe 0000:03:00.0: [drm] SIGID=103 In survivability mode
> + */
> +void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> +		 u32 component, u32 location, const void *data, size_t len,
> +		 const char *fmt, ...)
> +{
> +	struct va_format vaf;
> +	va_list args;
> +
> +	va_start(args, fmt);
> +	vaf.fmt = fmt;
> +	vaf.va = &args;
> +
> +	log_emit_dmesg(pdev, cper_sev, sigid, component, location, data, len, &vaf);
> +	log_emit_cper(pdev, cper_sev, sigid, component, location, data, len, &vaf);
> +
> +	va_end(args);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
> new file mode 100644
> index 000000000000..d475e816ee0b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_log.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_LOG_H_
> +#define _XE_LOG_H_
> +
> +#include <linux/cper.h>
> +
> +#include "abi/xe_sigid_abi.h"
> +
> +struct pci_dev;
> +
> +__printf(8, 9)
> +void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> +		 u32 component, u32 location, const void *data, size_t len,
> +		 const char *fmt, ...);
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> +
> +#endif
