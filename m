Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3664606A331
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 12:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CingQVPZ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD661125F3;
	Thu, 22 Oct 2026 12:51:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B719F1125E0
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 12:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792673488; x=1824209488;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=u0nGKekE3GTC0kGMPx5OUu3ycHH2X/wDNBtskPGup8E=;
 b=CingQVPZVXkRMSR54M4xF64SYO9w0+ZeLsVkN5So7buNbjJtCHvGJogN
 Y6eZqP7KPqFIi1BQWxcEgOZa1GaxIvPj8ZiIgvbxX2clDFNEyXE+5Q0JJ
 iWKXYogRgw+VfhY1bO+WcSgmjpLdRqHq9wFAU0Q64gSB6/hAT2B+BVOgr
 xRocCYcfFsd4JH5m6fIX7HvuKBVIYwbhY/jylHInlWCgKjp+RmlBrZOrp
 DEqkD61JRvXjQw12Bxg0Ms49LwzTXLEgnUOTQfYLWVaqg5+138/iCLgga
 GD+CWOWKr4Z+l5VlA2rP1o81rU3S1VzVhobGt9ogig3WSGqJSK0QQv238 g==;
X-CSE-ConnectionGUID: dhGY1ivEQYiTkXafdfU6UA==
X-CSE-MsgGUID: QR4eyu3gS16yWR5hpk4ktw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1408236"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; d="scan'208,217";a="1408236"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 05:51:27 -0700
X-CSE-ConnectionGUID: HDdzra2GRfiE8M0q9SOJjg==
X-CSE-MsgGUID: +LpRi0OQSOiR4PfGgnC9SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; d="scan'208,217";a="5197323"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 05:51:28 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 05:51:26 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 05:51:26 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.3) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 05:51:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f3W3bK+mp2Jl0edQi6qrFno3vr7fpFpo01qelHtfrDu3dNhKSCG3/XBMTpoqFIYLLfUmoPfaC0G9dBQ/aw3VgU3QYMM/LsBSsnXirl7yQi9dtneVlmHSL+pyVIIdmivJW/HEhT6ZHW6apRx3JXCi9PcKRZlyjY5ZwfGwbqzfK/ytC+tJEp/n0wFCJV5bSBHeWKqzeEo0fsRg2M9TS4LmLeEQoS1RZfSDiLK/La0fQS2LrT6liMEizFvFe59nLgGRUD6dvGtBfr64ChLd5qR+zLHQt1FMixwQmsAU32qIabdlC+IiiLob1XAAAPte4Rf9JaFu4WgcS1+j/OvmCoBgDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QH/OkY8EwDkwd010UCl8a8+hO2ateE0VNlt/8rnWmOI=;
 b=Cz6OctUXg7Cwl4N4ud88qrvxCXCXDrgfPwz4KUc5wvDCkp2IBZk4QTBb6nRTDoliDbGwUXPKIe3BdpU+Yco3RhNnaxo+388mnsH2JwE1HfRHt6LsO6qhIx5YSU2opLRYkuSDJ1BrHM4Cxj8WlLP+ASicbXL3Ap7MzzUM3fgQ1UcK4tqXSjK19HTGwKfYLIrKpq3M2fQ3vrarm/PiHn00n5aPPVoUbneNATc/iqEtXV7ipuJjtB5/1rke/4en25hfA6LbtkmnUxcmycQeQ52BpYVRUJlIzRFX46gojqvGDnAXc3E7MiMYjdAs2QuEjmL1ihPf6Z6+yWFpBiD8vBAwvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by PH7PR11MB6545.namprd11.prod.outlook.com (2603:10b6:510:213::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 12:51:23 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0522.017; Thu, 22 Oct 2026
 12:51:23 +0000
Content-Type: multipart/alternative;
 boundary="------------F2HbzEBUkGa4m4EbVvi5UHUJ"
Message-ID: <3832b282-b83f-4f34-9c62-6e98b46c13d8@intel.com>
Date: Thu, 22 Oct 2026 18:21:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Enable CSC fault injection on CRI
To: Sk Anirban <sk.anirban@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <soham.purkait@intel.com>
References: <20261022122708.625136-2-sk.anirban@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261022122708.625136-2-sk.anirban@intel.com>
X-ClientProxiedBy: MA5PR01CA0171.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::12) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|PH7PR11MB6545:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eacc860-f71c-41f7-bb0c-08df303b2d5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|10067099003|22082099003|18002099003|261021121427099003|8096899003|261021123027099003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: TYkSZLIdZVwQnevyFpI1xWvN0YZqdiRInevUT2wkHqBJZXaCXWeKcLiDacKJPnkUe78teM28xUfd2A3mqPukNu7NFUnxtvJGk2VDAhuRoorz0EdmekKlLU+VXXXVfZ31QPm/1xE/AJWPKQXRlXGmuwn40o1A4SkJIGHAryFxew/teFWQM2w+/Q2OzjNpxNTymmkpd67qewv/vKga0DyevT0YcVNvd+sOUamceLzCjRQ7g/eanibHN0lVpCtBIkQVkCTDNyhK88u6vktRpCeJck7Iw68ZhOuHFKQp38w0budXHDVb4uhiXcev2Xuy6v0lzF1VKZAmDnUUFs0VMDxf2sNPHEPHlZRPsdtl/jth5qyTLj7hJPB1j+osONg6Ta5AZwcvGbZMODb4EdSzcGmjYouSrX1mmBch9zAz/mhksJ+UdHya4hzJAmcSiApEssQlvpGZHSLSxz3RRAJjpG5U6m24OLv98GbcCuq+CkVw+MRPOSIhP3kI5K6gCeaNP3/b9rMfJ9S1qgZgqcKxK4E1W+fhUuRhH0ylG62bXZUPI4xQE1/MWv9p0FklcbW1DaXQvPdqLEXsvyIlIKKK78QgupWFES5Ym78R0QjMGq9vlb6KY1brs5Zpq4GA1uHOAKPYIJQ30KeHs1j/gPbTJcXxQdrfp0xtZIeiRSGg3bAhV5U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(22082099003)(18002099003)(261021121427099003)(8096899003)(261021123027099003)(261009223027099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aytmcGJuSVArcTNibGkzaE1ZdVdCQ1dqTVpWVFFzaS9hSkQybW5vRnhXVXYw?=
 =?utf-8?B?aDRRMVZvMThqY0FUb2FYejRPYlVlbzVjM0VDQlByNDNZZGcyWTJ5OElqeEQx?=
 =?utf-8?B?L1owRURVdUs4TENKTFFRVjJQQ2N5WVhXaE9MeUFvYlVPbGNXQmJKN0E5SmRF?=
 =?utf-8?B?ZCtmcm1YMWM4VHZYVHBSTFN0TG1Hb3hYcElvcGNKbzV3MFlUNmxsSHNCWkhy?=
 =?utf-8?B?SHhlcWhoUzFNNi9pNWV6YUJGUHRXSzFZV00ybUhCTjJtbHZSUmFER2ZLaGs5?=
 =?utf-8?B?U2poS3AzVjFVbVlEU0gvcmk0UlVpZC8rSzE5WE0raXc3enRmY014bEVQY1hS?=
 =?utf-8?B?LzNLcFhrU0tQMjM3YU9mcVUxdVN0R0xHTWVLSFdZamtWQnpOVnl4UVYyNXZu?=
 =?utf-8?B?d1F5d0s1blA0Yk1TWHFIOTZXQ21mbHIyNng5VEkrMTVuL1hhMGVYRGtkZG1Y?=
 =?utf-8?B?d1V4ZUdEcUFRcnpPTWR2c2VaREdteDZBbUpvK3B6MW9CZ04wK0hZRmlXYlo4?=
 =?utf-8?B?aE81VXJPblljV2RwMTBydGVFRlRCSlM0M29VOE9Bc2IzaUFxaGt3MDhxSzlt?=
 =?utf-8?B?b3FvWmluTDNvQ1YvWWdEN1BxU0FaTVkwSUNWNnJkdG8vczNIblJmbmw1Ui9h?=
 =?utf-8?B?VEN3aWp2eTQrdWxPVUdSUG5JblVHbzBUWXlnRUo5RlhuS1NjT3F2NnpWanZ5?=
 =?utf-8?B?SXl6ZzBmN25QSms4aXJzTm42ZGMwV2NXM0JoT0Q5TVdiNGhqc015cTdGZE5a?=
 =?utf-8?B?c0JxQ1o1WVJzbGpNK0txU1VSeDB1YjVDcjlTVS9JSDF1Ui9SSWcyNkZuWGVH?=
 =?utf-8?B?aExpOFliZTFVOXV4UFVFdS8rSmovUkZBbGRJZHJLak1qUksvekk4RytYQStG?=
 =?utf-8?B?M1BTKzcySXNaVVFadFNadzFRdnRudXNXTlE4Y3c4d1JoaGtuWEFzSkRIU01P?=
 =?utf-8?B?VWJiSHJxTEZGbzR3aVd1WFBDMFJpblh5VjBFaWcza2k5MDVya3FHTzltaXhk?=
 =?utf-8?B?TDdFVUVaWW1MZHpVUmFDbXd0eElKWjRpTm4yeS9oRnBXMndiZXFYTHJ6SU9x?=
 =?utf-8?B?cWVrME1PZjlLQkhsUkV2N3VjRkdrbWw0dFlqNG5uMW1HRW4xd0pyU0J0NDVp?=
 =?utf-8?B?QnNFcUdrZU00ZUxZbU5Pdk15K0NqTVpSZEVRakd6QXByUDh0WjRkUyszV0tU?=
 =?utf-8?B?YU4wZDdlZE5qdStRRmVjT0hQT3crdFlkMGovbVlLQi84MHRkdjl4bFZmK0lY?=
 =?utf-8?B?aDVHT0RnUHlQTWYwZEVROUhBSTFVZlpkOUhVUnlPYkJPSGtzaEJyVHJIbElo?=
 =?utf-8?B?NG9NUWxpTk5IZnVXa29GZjM1WXE3TjlkOTRHeEJHTlpzRGp1MktVRk1XVlRD?=
 =?utf-8?B?SFZ0R05xUk9UNkpqNWFJTFZ0NEN3RFdZbG9PT0dlSG9XVllVWXA3WmVJMEZI?=
 =?utf-8?B?aWprZURqV2ZlSnBiWDJYdzdWdTdaRDJZRHVFWWtXNVlmRlc2QkIwQ0hVNEdQ?=
 =?utf-8?B?S0FYZGdoZmhYTGl0Uk82MzlHbGJydjlmZjBSR1NZcmNUdjdnelNDZEE2WGd6?=
 =?utf-8?B?VDJXNVZtSEVjOTMxWEVpZHA4bDZkZ0xYZ1Q3L0VmdVR2Wm9VMm9NUjVLeEo1?=
 =?utf-8?B?QVhnTS9EamZ2UEpOV0xzUWJ5ZTlTaFlCTytyYSs0MVZtZTNSM2dYNmtIbUQ1?=
 =?utf-8?B?c3VOTzEvUUE4aVQ1T0c3bndGNmVoWTg0Nk9oQnZJMzNXZjg1cU5hMHFFUnhw?=
 =?utf-8?B?bEI5cDlpZnE2a0VrS2E3RU5sZ3JoMzUyQlRvQUY3SGpiUXlvb1VxaWRlM01u?=
 =?utf-8?B?WE5aMmZ4dFR0T3B4RklxYTF4UmwwR293OHhYb3BNZWM4MTBZWUhlUVgyTHpt?=
 =?utf-8?B?NFNFeTd1QWVodzFxb1g2d0dLMEJGb3I1SEZrajdOUThIbzFJTVlWTkppNzVR?=
 =?utf-8?B?ejFTc1ZYVmRSSzBDZFFwOGZXdWpDV2Foem16dE1KWkRVTDJ3NzFsV0d6elA1?=
 =?utf-8?B?YktTODZYSnFKUmxNNVNnajBzR2xGc0MwT2xYT3EzeE1Wam1jbkFzMStpWEpJ?=
 =?utf-8?B?Q0x1Ymhab1YzNzUrSGg0Z2NFaG1RcVNvQ0FtdWc2K3RIWUt0Q0tWdDZDUkxs?=
 =?utf-8?B?aHlGN1lIdXB5T0pDS1h3dE1mdHdkamVVc200VkY3VVpwaSsvZTdiRXVsdmlJ?=
 =?utf-8?B?NmttdEw5cFVPYStIdmlOdGNQZUVkcUpBREpPNkRQcTQ1bUcyTFpRVzFKcFgv?=
 =?utf-8?B?U0pUTWhsb2lNeG0wai9UZnpmNHlMaWx6dXlwRks1OTdXM1JPRVBVU2xmbXds?=
 =?utf-8?B?Smd3ZWlQeXdXeDhaUGZGOGpoLzRGUG5VTVZ2RGQ4TTliNExTS2tpd2hscXZm?=
 =?utf-8?Q?xCdgexTyh0RBQo94=3D?=
X-Exchange-RoutingPolicyChecked: MmTRTvniPYuOrAlJE+i9IReumnnSZRLJoaVJbsX/dgxHIs7iLmUI80IueXp0PFKo2vU/SdXUPnfV1TgsOf0gvIw972dP/IxMDVTLoga+7RJwBoFxB6w6Z0lmrzd4rUMsw7kmJfjwYkXl6CDPVEEVM072Xzzs9zpQmv9vUH7gFpoC2Dl3nLWfX1MxmHjhlgpdpiThjyLZmnjOn73lLHqp6vXhGliVsDKdNwoHaN5D+duHnxlpJi/Vo+mAMygYhSMKbgPn0FGoyx5uoUhAFbhUPsrQmbuROQgD+LW2MntcQS8T3pT19n9qRFayQhGXYKAmB6EtAPZjS+LzyGqZCiyObg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eacc860-f71c-41f7-bb0c-08df303b2d5f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 12:51:23.6189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iGEt7SZPk6uiSMaGAci3WKJySwhXxb8vpNZBEmmj069ftzHVdrTpi5O0iJpLMJyfHsuZrbqN9EG1AK9Wz/TRi5VrzMZhCX9wdmLcYbZnbH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6545
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
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------F2HbzEBUkGa4m4EbVvi5UHUJ
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 22-10-2026 05:57 pm, Sk Anirban wrote:
> Enable CSC fault-injection debugfs on CRI, in addition to Battlemage.
> Preserve the SR-IOV VF exclusion.
>
> Signed-off-by: Sk Anirban<sk.anirban@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_debugfs.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 926020c7526e..31b71b34eade 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -50,7 +50,9 @@ DECLARE_FAULT_ATTR(inject_mempage_offline);
>   
>   static bool csc_hw_error_available(struct xe_device *xe)
>   {
> -	return !IS_SRIOV_VF(xe) && xe->info.platform == XE_BATTLEMAGE;
> +	return !IS_SRIOV_VF(xe) &&
> +		(xe->info.platform == XE_BATTLEMAGE ||
> +		 xe->info.platform == XE_CRESCENTISLAND);

Please check and confirm, fault-injection debugfs enable on CRI platform.

with that

Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

>   }
>   
>   static bool is_crescent_island_pf(struct xe_device *xe)
--------------F2HbzEBUkGa4m4EbVvi5UHUJ
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 22-10-2026 05:57 pm, Sk Anirban
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20261022122708.625136-2-sk.anirban@intel.com">
      <pre wrap="" class="moz-quote-pre">Enable CSC fault-injection debugfs on CRI, in addition to Battlemage.
Preserve the SR-IOV VF exclusion.

Signed-off-by: Sk Anirban <a class="moz-txt-link-rfc2396E" href="mailto:sk.anirban@intel.com">&lt;sk.anirban@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 926020c7526e..31b71b34eade 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -50,7 +50,9 @@ DECLARE_FAULT_ATTR(inject_mempage_offline);
 
 static bool csc_hw_error_available(struct xe_device *xe)
 {
-	return !IS_SRIOV_VF(xe) &amp;&amp; xe-&gt;info.platform == XE_BATTLEMAGE;
+	return !IS_SRIOV_VF(xe) &amp;&amp;
+		(xe-&gt;info.platform == XE_BATTLEMAGE ||
+		 xe-&gt;info.platform == XE_CRESCENTISLAND);</pre>
    </blockquote>
    <p>Please check and confirm,&nbsp;<span style="white-space: pre-wrap">fault-injection </span>debugfs
      enable on CRI platform.</p>
    <p>with that</p>
    <p>Reviewed-by: Mallesh Koujalagi
      <a class="moz-txt-link-rfc2396E" href="mailto:mallesh.koujalagi@intel.com">&lt;mallesh.koujalagi@intel.com&gt;</a></p>
    <blockquote type="cite" cite="mid:20261022122708.625136-2-sk.anirban@intel.com">
      <pre wrap="" class="moz-quote-pre">
 }
 
 static bool is_crescent_island_pf(struct xe_device *xe)
</pre>
    </blockquote>
  </body>
</html>

--------------F2HbzEBUkGa4m4EbVvi5UHUJ--
