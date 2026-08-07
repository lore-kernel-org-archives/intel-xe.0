Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 174CFC5AC7C
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 12:14:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B51F810E401;
	Fri,  7 Aug 2026 12:14:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OWcABHYH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D14210E401
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Aug 2026 12:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786104861; x=1817640861;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0a8+CZ4nWg3XhzoDNgEImPmHTcy2R7sViFarlj7WKBc=;
 b=OWcABHYHquqyJ2pFctOy7EQ+FFCVEtFCu+nKhaX/Ou4FNxOFMlKBxk2X
 gAZdKzLtJeU68SDrWc/467rmlu7FX5CzfrqzVIbOzM0BcHApWNDYuZ+HT
 cHSkJqS2yh0r83j7ZX/ntSjYTPz4NfOOBGsvrA+405RkXTx30j8nc4HU4
 8QXChJXk5zjfW61xnbS5Ri/F2E1dQOuEYjucLBN0Hk5J5mq8mdzhRouy6
 P2sHbQ67doV9ozy9Fp85ZLNJdygDXYvU/ODQXwYTKIJWhEK3OfTlr1aHW
 /migL41ZfBaUF0OD3vQFN0ra/lQes7qTKq2B2DnH5uNrdXFXAoUIS+9Ce Q==;
X-CSE-ConnectionGUID: ui2+sXIPR9+fJnc8/Z9tSQ==
X-CSE-MsgGUID: aERHWEtFRsSZ/9sQESi7jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="98071896"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="98071896"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 05:14:21 -0700
X-CSE-ConnectionGUID: dVzNFTHJQ8+Vs2b7/GK+HA==
X-CSE-MsgGUID: JwpHnAmLTq6He7gfQjRVNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="262431540"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 05:14:21 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 05:14:20 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 7 Aug 2026 05:14:20 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.71) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 05:14:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TrYyeNy4dh1PYeNAs1Yeqiyi4bWWJHK8DDqE9z6wzi7wykrDzeTGm/J7OhbhHaQKLfvarI+vPlNr3Tb2dumzPmJGjMqwf/zfAo7kmcDGZWicsDtqevaOZcNwBedJF1O1xlxyUUmKMDmlwKZ1wqV1NQI52HEh8kuCqLTbU5SCHL0ZqZ79WbdXiBsntGJN0Lz1+qTBW8x6d4UMHxHBOCzNNyYygWAWvqiBUZ/Jymc1CHFaNaC4GGXgyMnOxix0gTOtWHoNAzlHX8+kNK3WjKjZIYGIBeCMogmi2ZtSLXoMtgg/BulAv5n/25TwK50vDcIG5oVUfsHy/qlGk6xJwVPDWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RqVRq1eVcAsxoEmUi8U6IE2GiDb6wA8d0s0Npi6sVTs=;
 b=uqQWG9LfWbLv+w5xmT/Ll5gX6FIlBzztIKH7x6LDCwlWN9EiY/Tvs0A1PIXNjKKm63R78SDM4Vm+nVZwNp8Yfb9vNpfCMxC5nFX/nD3IfVuf0FvpLRyGtRaF8Wys5rgClcq+jOj1CQXkvkKxLOIBD6d58SYHEpYxT2wKsJ9+KuTqEo41maxKAUPRwBFWI6jaNv84kTOnF00Is5dnA3IWhjsmHjBcUUpDoPwf+F2dnJUzyxGLda3OG1cN7ASeKogem8cKr/tm0jtE4liXFJHu95iOJaEfNcm06QtiR78Cz9roDQjzyFjaKbBZ56YAoZOI2y6FTYWMSZnDFP0FanqgJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ2PR11MB7504.namprd11.prod.outlook.com (2603:10b6:a03:4c5::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 12:14:15 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0292.018; Fri, 7 Aug 2026
 12:14:15 +0000
Message-ID: <092a6287-e2ff-478c-8d33-ca65ed5b3c30@intel.com>
Date: Fri, 7 Aug 2026 14:14:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/23] drm/xe: Report 'Survivability Mode' errors using
 SIGID
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, Summers Stuart <stuart.summers@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro
 <riana.tauro@intel.com>, Aravind Iddamsetty <aravind.iddamsetty@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-19-michal.wajdeczko@intel.com>
 <ca3dd4a6-91f9-410e-8142-53256de9e817@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ca3dd4a6-91f9-410e-8142-53256de9e817@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIUP296CA0151.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34c::15) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ2PR11MB7504:EE_
X-MS-Office365-Filtering-Correlation-Id: f872c4bd-d0a4-480c-a5c3-08def47d662e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|10067099003|56012099006|4143699003|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info: vS19xQysC/g0ZgWiIpU1zW2+VPkG+2LV+9ypI9uPAp5LuN8/U1abWE0X/TG5d+7gJKwVRI2rGJXq6eDoCBeRmrQJR4FVeNP9aKfp0j2hLFqRLhMUyaiAO2kzL2VMajG6cLHzfoGp4iXA7+XDaLBLz1E/FbWiE2VN6RT38lgxB6BRtrjzCE+3MViGngtQ2zXZ8BdZEwTEbvpmRlxQ/hwpqUgeQfReRA9+1XSrej+qzNRRpiQYxZXiBV8FVqIdSSS3Ak/kQg9OjrRLUtOLbBCXo+M0rHe4osMCNBrN0uJfTRJBGcio2ODnK4hT+y4Mec/JUR48ILBqPtkERkZq3S50F/TA2Q+yJJdHbBeKb78SzFaTR7dlcuc43yS4AUOwEZYz9TS2K3UzEpfhDQfFO6VsvIrwuAhTJK56nUYfKoon4/bvssgedX14x6WoQYvclsEZY+piANSTZYDTkmFh3TfacCwr7R5h+1E8JdPlAjDp/8qmoPiba9K91hCMnflIZgfPUjVvVrdfejDwJUfvTx4GuvnzDpN6EWtwsFTdKme9Y4HsqY7dcZ9p0Rq5a9G5CGmLjirgoJfE9aa6N3ozYWGMb/m06xaLyJdz3gn33fkRGUQhQhujmJmf2CiSima3U3WB89QGYmbHnfI1nPgZZulSCHEYFTGvf0/Jtow4ws2Dyw4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(56012099006)(4143699003)(6133799003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmg0WjI5VTJ3eVlJYUh0OTY4TjBXNUR1U01nQkppR3c5Nmc1Vk1CMlh4aDk2?=
 =?utf-8?B?bDk5UnJUUUdGM3NQZzhVV2QrcnRMMy9BM294WGRGZTMyM1NnVmdEZGxReWQ3?=
 =?utf-8?B?MzNnVGZLZkl1YkUrbDZnNUpFT0xrL3ZiRGQyS1NFS3lJNEZtU1J5SmVVR0Z4?=
 =?utf-8?B?UWRGMnlaQlA3N0pjcXBCZEcyanVKWTk5UGs0QS9vdU5YREp3eDZSUUtEa3A0?=
 =?utf-8?B?YlRTWVRMeHRiYTRpWFdFZ0hYVW43Nm5RSkw4bTFGUHhMdXFsQ1FRQ1laWnpX?=
 =?utf-8?B?RndxVzI2R2NVQ1JlMlhkTjRQM0poWTB2OGRyeit6YTFsbERZc0pxL0hJLy9r?=
 =?utf-8?B?L0ZHcXB6UlQwT1JUNDE4VjB1OHRKbmh6TVdyQ3Z2dG1weGQyTTAwZTYwelp1?=
 =?utf-8?B?ejdrL0srcFY4SG0zTlpXSlFSRVl3TWlKdmdMNWc3Wkp0Qk1aY0h4RVFZNWdN?=
 =?utf-8?B?dko3M0w2dmR3TFFyTXlnQm9YSGZHb3pTeDlQQUczZDlzT2d5SFBsV3ZZL0N2?=
 =?utf-8?B?S3p3Rk95Mmk2THpVbkFKR3dpR0REZDhzaklRL1ozd0V3alNCbCtmYVpSemFQ?=
 =?utf-8?B?MlkyZmwrTTdQTXZaazlmaG5PRU9vbTNUQjVLZDJiaGpnQUhzVC9RWTFWZXEx?=
 =?utf-8?B?VFBaN0Z0RUpIeW90eTg2RzRDYjNRUWRDZUppTVNYN01odnkrM1RLZVRjcW1L?=
 =?utf-8?B?bVBHVXFraFAwbmd4dlZzVFc3bC9HZ3ZhNzJFck9RVUQ4YkhWTGtQU3puclQw?=
 =?utf-8?B?VDJkZXZuMGdZT2NLazlBZXlUd2ZqRlZ1WEpNSVBPYlBJejNVbUlGSDZGd2Vv?=
 =?utf-8?B?eGtuVGxEUXZGaGZzMmFBZWRKK2h2YmZETk42Yk5vMnhWT21aS2R4L0JoZktX?=
 =?utf-8?B?S0lRVURSUXp5WGEyZFJHUk9LRHZ0aXRocGIvNEVjcUx2NmRGM0Y3bjN3aS9p?=
 =?utf-8?B?LzBINzUwMUJqMjIzSFBIMkdWamdYSXIweDZaUGZrWkpWeUJ1eGxEcGdlOGwv?=
 =?utf-8?B?eThud05MaERjQkF4bmd1RmJtYW55ZTVkODhzekZibWdONkYyaXRacGkwNmhL?=
 =?utf-8?B?UG5HL0hDa0RXckN4bUJ0N1BEZE1HNG4yVVdXTmtscSsvQXdGL3dhZURiY2VW?=
 =?utf-8?B?eEt6MDlLSDFVQ0ZNd0N4K3Q2KzBkQVJMK3VhRzZXMXBrVFhrV0NjSlZRZWMr?=
 =?utf-8?B?cjN6S2M4ZldXVHJFdjJqUTV5a21NR1NZUmxwZ2x0bkpYWlZicTlEWElFN1Zj?=
 =?utf-8?B?SGcvSC9xZ3RvT0lxUFREZ2IxaEZ2RjVxWnVKZi9SdERGR0ZSdHYzYUJIZ0F3?=
 =?utf-8?B?bitjZ2YrUjJlbEhOODF2aS81dE5SR2lCK3A4U2tDNmR6dyttUy9TWFhGQVlr?=
 =?utf-8?B?WVRCNjk4VzZWVlZhbTNMZ2tDSG9PSmZPOTlBdS9xOUV1ZlNGa2R2dWVpRmNr?=
 =?utf-8?B?cDgweUFKOG9VRGRYWDZjdUJ0T1FFbjFvNXY2SnNTOEZKWWpROHk3ZGdEYmdU?=
 =?utf-8?B?eFlNTlhVVGVWL0gxeGlCdUNrYWNvY2s1TzRIM0ExbW5lbFB4NHB3MHB5dWlm?=
 =?utf-8?B?TnVpeWhyTlR1dWNQN1VpUG9VSTJDdTlsclhoSE1IemV1YjVDb3VOM2hvRktx?=
 =?utf-8?B?U3M4WkJ2TWszNXlObjRON0oyMW9HUXNpUERPMEQxZHZCVjRINUdNc2JwQVVM?=
 =?utf-8?B?Sjg1OFpnUkNZSjFMM0tmbXg0WjVKR3hXTDhlMmNiLzg0MTVtbDVTREtDM3hC?=
 =?utf-8?B?TWRCMk9SNzE1VG1vV1Z3cnE5MHgvWXR6TDU5Zjg3c0RpWVhvY2hKMFRGajYv?=
 =?utf-8?B?U3cwVnJmUW9ieUF2ZDFMNWRaSUV5K25MRVVUT1psZHZ1YzBhNkdvc2lFbTQr?=
 =?utf-8?B?QlB5cmNubjE0RW5pWExwU2tNQzBpM0NhZUtUd3FFdmRVZ1dsVFB3WDNORFF2?=
 =?utf-8?B?NWFad3ZJZzV4UERSVU9CVm1tdXd1WDVxZWxhTnRPaVFuODRsWDJDY1QzS2Z6?=
 =?utf-8?B?akpnNTlyMi9aWUY0U2VxSnBINCs2aTk3ZmdPZGhhVVFvY0p1VEtwcFNNUnVt?=
 =?utf-8?B?WUlZS1Y1UHZXUHcxTGRhT1ltemwzS215djFLWE5HN2FGZFVzMUkvaTkvN2h3?=
 =?utf-8?B?UVpMYUJoM3lUb3Q5dWNnSjl3SFY5bkZka2NDMzhGUlg1bi9QOFg0RHRpZ2tj?=
 =?utf-8?B?ekZ5bzhiTFVCbFNVMWpKcHZDQ2ZSdEc3N05WSms4SW9sSXJ5VUpXeEZReE1j?=
 =?utf-8?B?eUptdGdTb2NGNEZuUkEwblVYY3RlUS9EaEtUZjdIaDFhZFQwbEZvYitUalhY?=
 =?utf-8?B?SFkzQVRWVTM3c05lUUg4K2lsaldYUjRlUkEzT2Nud3pmRXNyTlhrNGwyUmo5?=
 =?utf-8?Q?wPJ+vQjd+1fa92NQ=3D?=
X-Exchange-RoutingPolicyChecked: RLtLO5Lu77ce0zn9JI9tADAM4PC7GQuMQbrhxdXy6Yexih5QSv9JitKiE7hubfgLyl5fdc3tvrdtX03E5Tkpq7Jx2DAbsQQ0GmkzcWyT58/n52SvFfwFFp6U0n5Wd9Kksa7xi6ABlfTsX+nvvEeJLxHQxYQUnb1n94AIVv4B9aHALoMB0A/DGJX8DSE91jkZCU6GTBQcXq/5XeobHWZ4FfHiVblkRFDfpbeMCEtzyeJ9y0+8BFeqrtp/9lR+RyXE05X7Wi7SDXQjEKxxoar0yCxdtpD/gHTM1Bb5KOLVTTYao7Ed7ttj8PFKDynBaQscKRTAQHTE13PVK6o+Ayn+hw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f872c4bd-d0a4-480c-a5c3-08def47d662e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 12:14:15.7728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ye8JwX5yVAKQ2b80zv/Nm/1WRz0d3NRG/eK+QIp9QUapk2Bnz2WDUSefSOWofXIzXSPCvkAW/M2y6fFdtmpqaZ754tkvIjbv/YWUmXEsfao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7504
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



On 8/7/2026 1:18 PM, Mallesh, Koujalagi wrote:
> 
> On 30-07-2026 08:51 pm, Michal Wajdeczko wrote:
>> Report various 'Survivability Mode' errors using xe_log() helpers.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_survivability_mode.c | 24 +++++++++++++---------
>>  1 file changed, 14 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> index 4c506027fa94..788b7e8137a9 100644
>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> @@ -14,9 +14,11 @@
>>  #include "xe_device.h"
>>  #include "xe_heci_gsc.h"
>>  #include "xe_i2c.h"
>> +#include "xe_log.h"
>>  #include "xe_mmio.h"
>>  #include "xe_nvm.h"
>>  #include "xe_pcode_api.h"
>> +#include "xe_printk.h"
>>  #include "xe_vsec.h"
>>  
>>  /**
>> @@ -179,11 +181,11 @@ static void log_survivability_info(struct pci_dev *pdev)
>>  	u32 *info = survivability->info;
>>  	int id;
>>  
>> -	dev_info(&pdev->dev, "Survivability Boot Status : Critical Failure (%d)\n",
>> -		 survivability->boot_status);
>> +	xe_log_info(xe, SURVIVABILITY, "Boot Status : Critical Failure (%d)\n",
>> +		    survivability->boot_status);

btw, is it OK that we use INFO level for "critical failure" ?

>>  	for (id = 0; id < MAX_SCRATCH_REG; id++) {
>>  		if (info[id])
>> -			dev_info(&pdev->dev, "%s: 0x%x\n", reg_map[id], info[id]);
>> +			xe_log_info(xe, SURVIVABILITY, "%s: 0x%x\n", reg_map[id], info[id]);
>>  	}
>>  }
>>  
>> @@ -316,7 +318,6 @@ static int create_survivability_sysfs(struct pci_dev *pdev)
>>  
>>  static int enable_boot_survivability_mode(struct pci_dev *pdev)
>>  {
>> -	struct device *dev = &pdev->dev;
>>  	struct xe_device *xe = pdev_to_xe_device(pdev);
>>  	struct xe_survivability *survivability = &xe->survivability;
>>  	int ret = 0;
>> @@ -342,12 +343,12 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
>>  	if (ret)
>>  		goto err;
>>  
>> -	dev_err(dev, "In Survivability Mode\n");
>> -
>> +	xe_log_emit(pdev, check_boot_failure(xe) ? CPER_SEV_FATAL : CPER_SEV_INFORMATIONAL,
>> +		    XE_SIGID_SURVIVABILITY, 0, 0, 0, 0, "In Survivability Boot Mode\n");
> 
> Please make it cleaner and simpler.

sure

it was one of the earliest examples of the new xe_log API,
and that's why it was using the base xe_log function
> 
> if(check_boot_failure(xe))
> 
>     xe_log_err_fatal(xe, SURVIVABILITY, .. );
> 
> else
> 
>      xe_log_info(xe, SURVIVABILITY, .. );
> 
> 
> OR
> 
> xe_log_emit(xe_any_to_pdev(xe),

we do have pdev already, no need to cast back to xe

>             check_boot_failure(xe) ? CPER_SEV_FATAL : CPER_SEV_INFORMATIONAL,
>             XE_SIGID_SURVIVABILITY, XE_LOG_COMPONENT_SURVIVABILITY,
>             xe_log_location(xe),
>             &survivability->boot_status, sizeof(survivability->boot_status),

cool, but isn't this already printed in log_survivability_info() ?

>             "In Survivability Boot Mode\n");

btw, as we use SURVIVABILITY component, the dmesg will already
have "SURVIVABILITY: " decoration, so maybe this msg should be:

	"Boot mode enabled!\n"

with dmesg:

	<3> [drm] ERROR SIGID=103 FATAL (04) SURVIVABILITY: Boot mode enabled!
or
	<6> [drm] SIGID=103 SURVIVABILITY: Boot mode enabled!

> 
>>  	return 0;
>>  
>>  err:
>> -	dev_err(dev, "Failed to enable Survivability Mode\n");
>> +	xe_log_err_fatal(xe, SURVIVABILITY, ret, "Failed to enable Survivability Mode\n");

and here:

	"Failed to enter Boot mode!\n"

with dmesg:

	<3> [drm] ERROR SIGID=103 FATAL (-ENOMEM) SURVIVABILITY: Failed to enter Boot mode!


>>  	survivability->mode = false;
>>  	return ret;
>>  }
>> @@ -412,7 +413,7 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
>>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>  
>>  	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe->info.platform < XE_BATTLEMAGE) {
>> -		dev_err(&pdev->dev, "Runtime Survivability Mode not supported\n");
>> +		xe_log_info(xe, SURVIVABILITY, "Runtime Mode not supported!\n");
> We can add xe_log_err(xe, SURVIVABILITY, -EOPNOTSUPP, ...);

hmm, actually I was wondering if this dev_err() was correct
maybe it should be just xe_dbg() as we are not doing anything
related to SURVIVABILITY ?

>>  		return;
>>  	}
>>  
>> @@ -422,11 +423,14 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
>>  		dev_err(&pdev->dev, "Failed to create survivability sysfs\n");
> need to use xe_log_err(xe, SURVIVABILITY. -EIO, ... );
>>  
>>  	survivability->type = XE_SURVIVABILITY_TYPE_RUNTIME;
>> -	dev_err(&pdev->dev, "Runtime Survivability mode enabled\n");
>> +	xe_log_err_fatal(xe, SURVIVABILITY, 0, "Runtime Mode enabled!\n");
> hmm, Logging error as fatal, however passing err=0 (Success). is it right? or simply we can log as xe_log_err or xe_log_info ? any thoughts.

passing 0 instead of errno to xe_log_err() helpers will just omit
printing anything in ( ), no %pe nor %phN

whether this should be info/fatal/recoverable it's not me to answer
your initial documentation [1] was saying that all XE_SIG_SURVIVABILITY
should have CPER_SEV_FATAL

[1] https://patchwork.freedesktop.org/patch/732271/?series=168333&rev=1

>>  
>>  	xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
>>  	xe_device_declare_wedged(xe);
>> -	dev_err(&pdev->dev, "Firmware flash required, Please refer to the userspace documentation for more details!\n");
>> +
>> +	xe_log_err_fatal(xe, SURVIVABILITY, 0, "Firmware flash required!\n");
> ditto

ditto ;)

>> +	xe_info(xe, "Please refer to the userspace documentation for more details how to flash the firmware on %s!\n",
>> +		xe->info.platform_name);
>>  }
>>  
>>  /**

