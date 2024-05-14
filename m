Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE313C04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 15:28:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 812EB10E68C;
	Tue, 14 May 2024 15:28:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WFOQ41TF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE8F10E68C
 for <intel-xe@lists.freedesktop.org>; Tue, 14 May 2024 15:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715700501; x=1747236501;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OeR78H6101TmDcrKUmmw9vaU/PhKlAvfRJLRIkny+J0=;
 b=WFOQ41TFXh4kXdS6nppfWxZl6mpr2VDDYIuu9ocScAnZf29EFKy+H4Y3
 BLdyHkBYAKp5c390OiTEwgJ/SxveIJ1t0NwGtFi9e6jn6g0VJETdDoxqe
 ERyo06sT4/gA4O35bkCPBRJ2e3u0pgpY8yoS+eaUUEOmaPF8divOwX1tm
 +ObAlfJ3/C5/aD68NEnTyaoCU65bc2kRlvcRZKfqzPUdgxifETkmvSzhj
 oc1Ck3r4kQ97ciprOteuzfZZ8e/nBJI8dfN9r4kUH5+Mmr9jAt1UaiiVD
 eCHix/SdO69TOVNGY+l3+2gHf7tkyaeheIITakZuNpTkz3aZKJfRp6iyz w==;
X-CSE-ConnectionGUID: csorGi+cRMibiPh17VVB6Q==
X-CSE-MsgGUID: c8GiGAIjQo+9fvGExbyzXw==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="34204328"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="34204328"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 08:28:20 -0700
X-CSE-ConnectionGUID: xnhwyIUGT86ReW83F0eJyA==
X-CSE-MsgGUID: y+2QGMfpSZ+swXliKiLGxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="35237529"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 May 2024 08:28:20 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 08:28:19 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 08:28:18 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 14 May 2024 08:28:18 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 14 May 2024 08:28:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vol2kMTXSjhZeIxMufRy5FQ+jBckZH3KPCPQAhLaqtGoMmOY+zW0eUhl2l5MxoIEeBGoofoHXmMHJNgDRn7HX8tMbkFyUtQ5rNWhEqOCjokFSvlDW9ADIncYq8fbsd0R+7mkKkXpvvnF4/rcPU86yLDbhO37F7Gp2k/GNC5gjSp3c21v0OVFdMwtRTgJhbyi19aWpFEgKiUYD8GS0kmtldd9U2qTXiu0Kmiad+pXef/Z45jk99AF9sNz+Vru/4SS8XWIv6qTmxPM9Gl8FSHLJ0ShMKryQAaHTxT3tdSfZGrVxx4IjsdYQs++jiJQCeuOjsSWlcoGMNJSwgDlhUKXrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EAQ5pIuLA2sNwwIGS714TwQYQ9ru6rwu67dbcZa2+AQ=;
 b=R5ch5NkKU36to3jZUDZx7vmUJwQkKl3kzdMfeLpP1CJJIAII+B12qQG/2gDxAQptYgIg+ib10yczjYKNg1j6W3IfrR3v3LGUdA/4CRsAjossVqo47Xe0SplrAFBQDZoIYVJBrmpvR09iU/lE66u8G9LXIw6u9UE96oNnvQ/byQ1Eh445v2sWrt7G3dDbD9VKo+W4qFejgZ6k08tKk/76cAOTf9xPq7rfGWahkKxEFDl4wDpNaHBfOqUX/f1hX1zpVAoQ4JTFw4oJNBL99xw09/z+WGuKVZGoM8hP685uy/8/PuPZqaid8Xpz9+JX8Hew/Q0QX7OEpyIb/nPpLzVgjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH8PR11MB7071.namprd11.prod.outlook.com (2603:10b6:510:215::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 15:27:59 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 15:27:59 +0000
Date: Tue, 14 May 2024 11:27:54 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: =?utf-8?B?4pyXIENJLkZVTEw=?= =?utf-8?Q?=3A?= failure for Fix
 xe_pcode_request
Message-ID: <ZkOC-jd1cf0U-q-L@intel.com>
References: <20240508152216.3263109-1-himal.prasad.ghimiray@intel.com>
 <171521923191.2023278.7126118573052648504@8e613ede5ea5>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <171521923191.2023278.7126118573052648504@8e613ede5ea5>
X-ClientProxiedBy: BYAPR11CA0072.namprd11.prod.outlook.com
 (2603:10b6:a03:80::49) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH8PR11MB7071:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cb8b359-0f42-49c0-c7b3-08dc742a6f92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXV6c2RldGhvM08rRzVWRGRwNDRpN0pGS3NmcmxhdloyRENpNk9zQUlnYkpp?=
 =?utf-8?B?NVJnVmlVeHF0Q2M4NTZwRVNKWW5wRzZZeWVoRFJsdnRwUlBCa3hwRGRLRXE2?=
 =?utf-8?B?UVlrQjUvTXRtN2Q3Z2N2cW9lQUUvaUlCYzFGbUNYT2N1V2U5cXJkc3R3QnRM?=
 =?utf-8?B?bW1sT1dWL21lM3UrWEpmWThMQlA0eTNzMlRaTDh4Y1ZsN0s5b1pFVWdqVlEr?=
 =?utf-8?B?dElqTUdKWnZRbmVZUWxKd3FscEtPd0NQVHd6b2ZLQzUrU0U2Vk5Rbm1KVC9o?=
 =?utf-8?B?elFnNy9tbXJNeFA2eSt5ZTBKc0cvMk10ZWNjRUhMMGlMOTFFWXdqc0VqbGRL?=
 =?utf-8?B?WDVjU0pJL0JPazJiRXVyeGprZ2VjREF6TnE3WGtlYi9iV3NtWmUyRTFlMnhP?=
 =?utf-8?B?VEMxOWZvQko5ZzJuK2lMYWtkM2d4ZjZoRWFjeTlqSVlSekhZSXIzM0pWRHkv?=
 =?utf-8?B?NlNzNjBlN3B5cFJVNGlzbFIweUJPc0ZCdmE4YlJvZzdsNGd6dGpDTENBZTVN?=
 =?utf-8?B?VUVVWFExQ1Z5TlRQeW1RMExyV3JMWGhWdHFxV045bmlQLzlpc2JZYkx5ZWxZ?=
 =?utf-8?B?SDZqNHp5c0E0RUd6ZkZJclFqUWdZU0laZGpDdllocmdiejRrS3F3SXRadzFW?=
 =?utf-8?B?S3ZGU0kvTjJRYXRwNVRNNzJwTStCSlFpb0JUY212TytFSWc0a2JNWU84aFZj?=
 =?utf-8?B?MjQ4d2ZEZnhVNzdya1NZL0NGcVhvempWRzJsZ09KRDlFZzF3WGFQRTk0NkdW?=
 =?utf-8?B?VXZNaHJqdklNbUpPbjZZRjdFRFJHR095dGNzK09lWTRsbGU2emEwbnZ0Zzlp?=
 =?utf-8?B?OEF4KzJpZ0hZZ0ZPbEtmK0MvaThISmVCKzVFZUk4UlgzRGJOL2JLZUJqQ1Jq?=
 =?utf-8?B?K2tOMkRITktWSVR0akNUT3RteE5Mb0QwTFR5Uk5xaEZNWW8zR0NaWnd1eHBz?=
 =?utf-8?B?YlRsZ3BtcHJEZnZHK0s2U2tTTjh1T2xSU25va3RDZmVJNnpIdHB6NTd0L3Nt?=
 =?utf-8?B?Szl6N3RIclVyN2RYcjdYY0cvOERwa2cxcFhjYmZWK0hSYlQ5bmtRRUk4YUxC?=
 =?utf-8?B?OU8vMktUQ3RibDNJbmx5ZS9ndzBQZCtmTStScE5oMUhFYjlXRUViOStZSVRj?=
 =?utf-8?B?aTZoWGhidkszNVpHbVJFdGdaaVZVekU0QktIV3lwV0pZS1RLMEF0UzJiY1Zn?=
 =?utf-8?B?dlRzcFRYWEhUM0c2K3JGVTUvVytkejlLNkZYVXVTeWlCaDlJdHN2ZXpoWWZL?=
 =?utf-8?B?VVlpOFBQR1VhSUJJWldxM21GQVdtVFErQXFORnc3bWI2Um5GVHRkVXV2VlAy?=
 =?utf-8?B?ZHNMcmkzZDcreHVYNE9OSldsL003Nlc0TSsxZjJOL0FrU0NoTHIrRHo5RmNm?=
 =?utf-8?B?Mmd3bGtPSXBwY1daSnh6TTFOSUNyVGUyS0I3ZnRWQ1RyRWg2WXJkV28yMXUz?=
 =?utf-8?B?aVZhSG1hVmYrT3pxT2kwZ0RGM1NqYk8vZTVqVGdZOTRISDZaMTZHRlRDL29l?=
 =?utf-8?B?U1NBenpNWHZlTU9UeWttbFlKcGpkMVFLUHdtc3NpODlKWGFqOWZpakM2Myt6?=
 =?utf-8?B?ZnFBSGI4Z0N5Vk11a0JMSmh6YUdQVWNkSlZ0Q2lqWG5ydWVRYnNmVTFBcmd6?=
 =?utf-8?Q?VZqBpQ1En9AS+LkDLRZuoO9m8GBMi2Qo37u/1D/2bJl8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2pwaFA2eUxRTjJ4MVdDeTZ3WWpYUjJMTTB4MWJzZHZSbGNHdGYxazNSd3ZK?=
 =?utf-8?B?QUpNTjQ1UTFnSDFTN0RjWUM2clJhNDZLTUh1UEdGR2ZqQ1NYWjhCYzBlY3pp?=
 =?utf-8?B?VEZKdGxrU1phSnlOd0hHbmxwWjVwQlY2SnVuay9JMFJIb1dnclI5Wm03a0I4?=
 =?utf-8?B?ZFE4WE53eVVvTU11ckVqRnFnbFhxSWh2M09OZlphZTYxQVBwQ2xRdzJYRVhz?=
 =?utf-8?B?Q3ZvdTFmdzQxV3NTRkV3TUUzSTlrV2JuRFMvZ2pMNWYxRmVlbE92ZG1ubnpX?=
 =?utf-8?B?aTdiMC9iOEc5VjZUbjVPemcydThXZkdiaDhHQ2RrRXoyb0NIYjhwdEpYMk1z?=
 =?utf-8?B?UFM3VWlMbmJuUEF5YXVoMktwbGtNYjVJV1pRYmRQZVNaRFhUVjE4N2pDakdU?=
 =?utf-8?B?Q2hXZkZ2azFnajhpZ3dPTDFVRXZhZ1ptZ0U5MlZSeEgwaEd2TnR2ZXU3Z0h3?=
 =?utf-8?B?S3dFNkJ0VTd3WUo2enZLTFFuM3hLa3pBY2tlRGplSGsxZWE0WFlqSDVuT2tU?=
 =?utf-8?B?SDNnT3hXOXJuSUlHdUVzemNBdFFrcVFCNWhCeWRlMDBoREdzbmo0elhNd2pU?=
 =?utf-8?B?aU1lNUhobDFkamFnRXhUY1pNM29WMWdNOFZxaHhiRExwRS95UFAxWmFEbnhS?=
 =?utf-8?B?bzUrUzkxYlBXR0tPVFQ4UWZyY3JvV0d1RmE2UDVPZHczOW5qMGkyeGs4QTNz?=
 =?utf-8?B?ejdkcVM0T3dGdVM0TFpkSEVXRkw2MkQ1V0N4Vk9uOFc4SzRkL240NDRxY0NG?=
 =?utf-8?B?LzVZWlNUQlZJMEZyRElXdmJ5VU9wSmt0WlgyOEpWb0lXSzVuT08xY0ZaQS9J?=
 =?utf-8?B?VzRLWThIN0tpdnJqUUp2akN6aGtKYzJiNTJNb3VGTGJTamhWQnNPb1ByTGxl?=
 =?utf-8?B?N1ZUZWhKWlFjWGNEdER6dWZXMC9ad3pHOElyTm1ZQzlFc1c4bmczWTllQVlS?=
 =?utf-8?B?bU5vSHBmWStrQU1Bam4waWZJNnhSclpSa2Q3VXpvNW80YzUwUGR0eXBvdDBm?=
 =?utf-8?B?OGdRckxiQjgzaXlqbEJXdXJUQlRLamZPZERBK2RneEJodFNzVjNaa25wbkhC?=
 =?utf-8?B?Ym14REEvQnlZQW9kcndIV2FUbDRFS3pnZVFoZHlsdmlIa2JoZ3J1WVhScFBQ?=
 =?utf-8?B?cFpmMmFEUm9wYk44azE3MlplTkttbGtZeDc3YjJaQzlmVDFJbXZhaXdqTkZ0?=
 =?utf-8?B?N0I2TTBzNHllckc2eG5Ua0FOeGR5L0NFbXpzcFFrSER3SGtPMmxRMUMyZlc0?=
 =?utf-8?B?b1JRV0F1Y1JRVGNqazcvK2JQVnhHNC95b0JWK0xKR2J6d1NqQmZnY05RRys0?=
 =?utf-8?B?Y202UXVVT3VybUllMldoaXF6RSt2eTZUeklVV3lrd2NXWUt4UGMva2ZjNms0?=
 =?utf-8?B?OStzVlJjSFdwcTJ5SzQ3KzZ6NFZheGN3MzVlK1o5TXQrMTFaMFFQSGZUTUZz?=
 =?utf-8?B?VjZvYjcwTW81Sjhqd3dZSkYyTE5WQXgwUWFwT2xKWm9XUEJjRHV5UFVSTFFl?=
 =?utf-8?B?c3hjcE9rNmcxUG5xbzlQYXpBdWs1b2VSa1hTOS8yT1piVjhRcmFia1RMYWRt?=
 =?utf-8?B?RmthUkN2dFYwZUtpNjZVd1ZFSFRoVnRXVWhOamN0M0Q4eVc4RjIvM1htMHdT?=
 =?utf-8?B?eVRCZnpzOG5Xd0hTMmk2ME1KUlJ1WHgzKzVMZVZ5Szgwa2pyaUtjYnRCZFhF?=
 =?utf-8?B?aWgrc2dHTjhCcjlhbHlOTjM1RFlRQXUzVElDcjVPM3VNcnZ4RWhhbkNZaDha?=
 =?utf-8?B?UGZWZE1KK2RxcEtLalowdVNUMTFDQUFGYWFWYnpMK0hRT1BCaVF1ZmQ4MENs?=
 =?utf-8?B?QldsbDVteWJNY1ZGZElYTExXNCs5eEVGSGpKdG02T3BPUmxrcy8zTXljRysx?=
 =?utf-8?B?RDQzaVRjMkRyQUM2Rmg2bTQvYVlWTEtVd3RTazNTTDhnUThsNlVCcG54VkFm?=
 =?utf-8?B?MjdhdXpOb3ByUS93azlSekxKajZEM042NU44blJpcnNUeWYxM0tMM01aRjFy?=
 =?utf-8?B?aUZaQVZFNThJWjNVS1ZTVDFlLzlUTFFRd2dRNnU1aUFiOHRyemtnSVY0bUE2?=
 =?utf-8?B?ZlJHSkdmbkprMnpkaTAyanphMFhjMEVzWHVHSnJOMzcxeUFaT3h3dW93cis5?=
 =?utf-8?B?UUo0MUt0YzlIOWF6ZmpTNmNzZHc3K3FaajJvTHljQ3QwbDZ0aVNKbVJUSmtn?=
 =?utf-8?B?emc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb8b359-0f42-49c0-c7b3-08dc742a6f92
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 15:27:59.2858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dQCGhYEYH65UkXft8+BvfaSErqsafa/VhL7mVF87f1iCHNArBbXjQTVzQjpzhK8oONbn/ET1qi/7urKzry0Rkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7071
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

On Thu, May 09, 2024 at 01:47:11AM -0000, Patchwork wrote:
>    Patch Details                                                                
>                                                                                 
>  Series:  Fix xe_pcode_request                                                  
>  URL:     [1]https://patchwork.freedesktop.org/series/133329/                   
>  State:   failure                                                               
>  Details: [2]https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/index.html
>                                                                                 
> CI Bug Log - changes from xe-1257-34d52122a69076639d526b035c8edd5b43201f84_full 
>                              -> xe-pw-133329v1_full                             
>                                                                                 
> Summary                                                                         
>                                                                                 
>    FAILURE                                                                      
>                                                                                 
>    Serious unknown changes coming with xe-pw-133329v1_full absolutely need to   
>    be                                                                           
>    verified manually.                                                           
>                                                                                 
>    If you think the reported changes have nothing to do with the changes        
>    introduced in xe-pw-133329v1_full, please notify your bug team               
>    (I915-ci-infra@lists.freedesktop.org) to allow them                          
>    to document this new failure mode, which will reduce false positives in      
>    CI.                                                                          
>                                                                                 
> Participating hosts (3 -> 3)                                                    
>                                                                                 
>    No changes in participating hosts                                            
>                                                                                 
> Possible new issues                                                             
>                                                                                 
>    Here are the unknown changes that may have been introduced in                
>    xe-pw-133329v1_full:                                                         
>                                                                                 
>   IGT changes                                                                   
>                                                                                 
>     Possible regressions                                                        
>                                                                                 
>      • igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:     
>                                                                                 
>           • shard-adlp: NOTRUN -> [3]FAIL                                       
>      • igt@kms_psr@pr-cursor-plane-onoff:                                       
>                                                                                 
>           • shard-adlp: NOTRUN -> [4]ABORT                                      

I just pushed the series as this cannot be related.

>                                                                                 
>     Suppressed                                                                  
>                                                                                 
>    The following results come from untrusted machines, tests, or statuses.      
>    They do not affect the overall result.                                       
>                                                                                 
>      • igt@core_getversion@basic:                                               
>                                                                                 
>           • {shard-lnl}: NOTRUN -> [5]CRASH                                     
>      • igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:                     
>                                                                                 
>           • {shard-lnl}: [6]PASS -> [7]INCOMPLETE +1 other test incomplete      
>      • igt@kms_psr@fbc-psr-cursor-render@edp-1:                                 
>                                                                                 
>           • {shard-lnl}: [8]PASS -> [9]FAIL +2 other tests fail                 
>      • igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system:      
>                                                                                 
>           • {shard-lnl}: NOTRUN -> [10]DMESG-WARN +1 other test dmesg-warn      
>      • igt@xe_exec_threads@threads-hang-fd-userptr-invalidate:                  
>                                                                                 
>           • {shard-lnl}: [11]PASS -> [12]ABORT                                  
>      • igt@xe_module_load@many-reload:                                          
>                                                                                 
>           • {shard-lnl}: [13]INCOMPLETE ([14]Intel XE#1767) -> [15]INCOMPLETE   
>                                                                                 
> New tests                                                                       
>                                                                                 
>    New tests have been introduced between                                       
>    xe-1257-34d52122a69076639d526b035c8edd5b43201f84_full and                    
>    xe-pw-133329v1_full:                                                         
>                                                                                 
>   New IGT tests (2)                                                             
>                                                                                 
>      • igt@kms_pipe_crc_basic@read-crc@pipe-a-edp-2:                            
>                                                                                 
>           • Statuses : 1 incomplete(s)                                          
>           • Exec time: [0.0] s                                                  
>      • igt@xe_exec_compute_mode:                                                
>                                                                                 
>           • Statuses :                                                          
>           • Exec time: [None] s                                                 
>                                                                                 
> Known issues                                                                    
>                                                                                 
>    Here are the changes found in xe-pw-133329v1_full that come from known       
>    issues:                                                                      
>                                                                                 
>   IGT changes                                                                   
>                                                                                 
>     Issues hit                                                                  
>                                                                                 
>      • igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:             
>                                                                                 
>           • shard-adlp: NOTRUN -> [16]SKIP ([17]Intel XE#1124 / [18]Intel       
>             XE#1201) +1 other test skip                                         
>      • igt@kms_big_fb@y-tiled-32bpp-rotate-90:                                  
>                                                                                 
>           • shard-adlp: NOTRUN -> [19]SKIP ([20]Intel XE#1201 / [21]Intel       
>             XE#316)                                                             
>      • igt@kms_big_fb@yf-tiled-64bpp-rotate-0:                                  
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [22]SKIP ([23]Intel XE#1124 / [24]Intel   
>             XE#1201) +2 other tests skip                                        
>      • igt@kms_bw@linear-tiling-2-displays-2560x1440p:                          
>                                                                                 
>           • shard-adlp: NOTRUN -> [25]SKIP ([26]Intel XE#1201 / [27]Intel       
>             XE#367)                                                             
>      • igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:       
>                                                                                 
>           • shard-adlp: NOTRUN -> [28]SKIP ([29]Intel XE#1201 / [30]Intel       
>             XE#455 / [31]Intel XE#787) +5 other tests skip                      
>      • igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-7:        
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [32]FAIL ([33]Intel XE#650) +7 other      
>             tests fail                                                          
>      • igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:         
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [34]SKIP ([35]Intel XE#1201 / [36]Intel   
>             XE#455 / [37]Intel XE#787) +8 other tests skip                      
>      • igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:       
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [38]SKIP ([39]Intel XE#1201 / [40]Intel   
>             XE#787) +27 other tests skip                                        
>      • igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:
>                                                                                 
>           • shard-adlp: NOTRUN -> [41]SKIP ([42]Intel XE#1201 / [43]Intel       
>             XE#787) +8 other tests skip                                         
>      • igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:                             
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [44]SKIP ([45]Intel XE#1201 / [46]Intel   
>             XE#1252)                                                            
>      • igt@kms_cdclk@mode-transition-all-outputs:                               
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [47]SKIP ([48]Intel XE#1201 / [49]Intel   
>             XE#314)                                                             
>      • igt@kms_cdclk@plane-scaling@pipe-b-dp-4:                                 
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [50]SKIP ([51]Intel XE#1152 / [52]Intel   
>             XE#1201) +3 other tests skip                                        
>      • igt@kms_chamelium_color@ctm-0-75:                                        
>                                                                                 
>           • shard-adlp: NOTRUN -> [53]SKIP ([54]Intel XE#1201 / [55]Intel       
>             XE#306)                                                             
>      • igt@kms_chamelium_hpd@dp-hpd-storm-disable:                              
>                                                                                 
>           • shard-adlp: NOTRUN -> [56]SKIP ([57]Intel XE#1201 / [58]Intel       
>             XE#373) +2 other tests skip                                         
>      • igt@kms_cursor_crc@cursor-onscreen-32x10:                                
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [59]SKIP ([60]Intel XE#1201 / [61]Intel   
>             XE#455)                                                             
>      • igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:                          
>                                                                                 
>           • shard-dg2-set2: [62]PASS -> [63]DMESG-WARN ([64]Intel XE#1214 /     
>             [65]Intel XE#282 / [66]Intel XE#910)                                
>      • igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:                     
>                                                                                 
>           • shard-adlp: NOTRUN -> [67]SKIP ([68]Intel XE#1201 / [69]Intel       
>             XE#309)                                                             
>      • igt@kms_cursor_legacy@cursor-vs-flip-toggle:                             
>                                                                                 
>           • shard-dg2-set2: [70]PASS -> [71]DMESG-WARN ([72]Intel XE#1214 /     
>             [73]Intel XE#282) +2 other tests dmesg-warn                         
>      • igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:              
>                                                                                 
>           • shard-adlp: NOTRUN -> [74]SKIP ([75]Intel XE#1201 / [76]Intel       
>             XE#323)                                                             
>      • igt@kms_feature_discovery@psr1:                                          
>                                                                                 
>           • shard-adlp: NOTRUN -> [77]SKIP ([78]Intel XE#1135 / [79]Intel       
>             XE#1201)                                                            
>      • igt@kms_flip@2x-wf_vblank-ts-check:                                      
>                                                                                 
>           • shard-adlp: NOTRUN -> [80]SKIP ([81]Intel XE#1201 / [82]Intel       
>             XE#310) +3 other tests skip                                         
>      • igt@kms_flip@flip-vs-panning-interruptible:                              
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [83]INCOMPLETE ([84]Intel XE#1195) +2     
>             other tests incomplete                                              
>      • igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a7:                    
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [85]DMESG-WARN ([86]Intel XE#1162 /       
>             [87]Intel XE#1214) +4 other tests dmesg-warn                        
>      • igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:     
>                                                                                 
>           • shard-adlp: NOTRUN -> [88]FAIL ([89]Intel XE#422 / [90]Intel        
>             XE#616) +1 other test fail                                          
>      • igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:           
>                                                                                 
>           • shard-adlp: [91]PASS -> [92]FAIL ([93]Intel XE#616) +3 other        
>             tests fail                                                          
>      • igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:      
>                                                                                 
>           • shard-adlp: NOTRUN -> [94]SKIP ([95]Intel XE#1201 / [96]Intel       
>             XE#651) +2 other tests skip                                         
>      • igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:         
>                                                                                 
>           • shard-adlp: NOTRUN -> [97]INCOMPLETE ([98]Intel XE#1195 /           
>             [99]Intel XE#1330)                                                  
>      • igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:     
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [100]SKIP ([101]Intel XE#1201 /           
>             [102]Intel XE#651) +2 other tests skip                              
>      • igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:      
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [103]SKIP ([104]Intel XE#1201 /           
>             [105]Intel XE#653) +3 other tests skip                              
>      • igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:     
>                                                                                 
>           • shard-adlp: NOTRUN -> [106]SKIP ([107]Intel XE#1201 / [108]Intel    
>             XE#653) +4 other tests skip                                         
>      • igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:       
>                                                                                 
>           • shard-adlp: NOTRUN -> [109]SKIP ([110]Intel XE#1201 / [111]Intel    
>             XE#656) +11 other tests skip                                        
>      • igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:                       
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [112]FAIL ([113]Intel XE#616)             
>      • {igt@kms_pipe_crc_basic@read-crc@pipe-a-edp-2} (NEW):                    
>                                                                                 
>           • {shard-lnl}: NOTRUN -> [114]INCOMPLETE ([115]Intel XE#1330 /        
>             [116]Intel XE#1595 / [117]Intel XE#1602)                            
>      • igt@kms_plane_multiple@tiling-x:                                         
>                                                                                 
>           • shard-adlp: NOTRUN -> [118]FAIL ([119]Intel XE#616 / [120]Intel     
>             XE#654) +4 other tests fail                                         
>      • igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:                
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [121]FAIL ([122]Intel XE#361) +1 other    
>             test fail                                                           
>      • igt@kms_pm_dc@dc5-psr:                                                   
>                                                                                 
>           • shard-adlp: NOTRUN -> [123]SKIP ([124]Intel XE#1129 / [125]Intel    
>             XE#1201)                                                            
>      • igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:        
>                                                                                 
>           • shard-adlp: NOTRUN -> [126]SKIP ([127]Intel XE#1201) +1 other       
>             test skip                                                           
>      • igt@kms_psr2_su@page_flip-xrgb8888:                                      
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [128]SKIP ([129]Intel XE#1122 /           
>             [130]Intel XE#1201)                                                 
>      • igt@kms_psr@fbc-pr-primary-blt:                                          
>                                                                                 
>           • shard-adlp: NOTRUN -> [131]SKIP ([132]Intel XE#1201 / [133]Intel    
>             XE#929) +4 other tests skip                                         
>      • igt@kms_rotation_crc@multiplane-rotation-cropping-top:                   
>                                                                                 
>           • shard-adlp: NOTRUN -> [134]FAIL ([135]Intel XE#616) +1 other test   
>             fail                                                                
>      • igt@kms_rotation_crc@primary-rotation-90:                                
>                                                                                 
>           • shard-adlp: NOTRUN -> [136]SKIP ([137]Intel XE#1201 / [138]Intel    
>             XE#327)                                                             
>      • igt@kms_vblank@ts-continuation-dpms-suspend:                             
>                                                                                 
>           • shard-dg2-set2: [139]PASS -> [140]DMESG-WARN ([141]Intel XE#1162    
>             / [142]Intel XE#1214) +3 other tests dmesg-warn                     
>      • igt@kms_vrr@flip-suspend:                                                
>                                                                                 
>           • shard-adlp: NOTRUN -> [143]SKIP ([144]Intel XE#1201 / [145]Intel    
>             XE#455) +11 other tests skip                                        
>      • igt@kms_writeback@writeback-invalid-parameters:                          
>                                                                                 
>           • shard-adlp: NOTRUN -> [146]SKIP ([147]Intel XE#1201 / [148]Intel    
>             XE#756)                                                             
>      • igt@xe_evict@evict-beng-cm-threads-large:                                
>                                                                                 
>           • shard-dg2-set2: [149]PASS -> [150]TIMEOUT ([151]Intel XE#1473 /     
>             [152]Intel XE#392)                                                  
>           • shard-adlp: NOTRUN -> [153]SKIP ([154]Intel XE#1201 / [155]Intel    
>             XE#261)                                                             
>      • igt@xe_evict@evict-small-external:                                       
>                                                                                 
>           • shard-adlp: NOTRUN -> [156]SKIP ([157]Intel XE#1201 / [158]Intel    
>             XE#261 / [159]Intel XE#688)                                         
>      • igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:              
>                                                                                 
>           • shard-adlp: NOTRUN -> [160]SKIP ([161]Intel XE#1201 / [162]Intel    
>             XE#1392)                                                            
>      • igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:                   
>                                                                                 
>           • shard-adlp: NOTRUN -> [163]SKIP ([164]Intel XE#1201 / [165]Intel    
>             XE#288) +8 other tests skip                                         
>      • igt@xe_exec_fault_mode@many-execqueues-rebind:                           
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [166]SKIP ([167]Intel XE#1201 /           
>             [168]Intel XE#288) +2 other tests skip                              
>      • igt@xe_exec_fault_mode@many-userptr-rebind-imm:                          
>                                                                                 
>           • shard-adlp: NOTRUN -> [169]SKIP ([170]Intel XE#1201 / [171]Intel    
>             XE#1562)                                                            
>      • igt@xe_pm@s2idle-multiple-execs:                                         
>                                                                                 
>           • shard-adlp: NOTRUN -> [172]DMESG-WARN ([173]Intel XE#1191 /         
>             [174]Intel XE#1214 / [175]Intel XE#1608)                            
>      • igt@xe_pm@s4-d3hot-basic-exec:                                           
>                                                                                 
>           • shard-adlp: [176]PASS -> [177]DMESG-WARN ([178]Intel XE#1214)       
>      • igt@xe_query@multigpu-query-invalid-extension:                           
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [179]SKIP ([180]Intel XE#1201 /           
>             [181]Intel XE#944) +1 other test skip                               
>      • igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:                   
>                                                                                 
>           • shard-adlp: NOTRUN -> [182]SKIP ([183]Intel XE#1201 / [184]Intel    
>             XE#944)                                                             
>                                                                                 
>     Possible fixes                                                              
>                                                                                 
>      • igt@kms_addfb_basic@too-wide:                                            
>                                                                                 
>           • {shard-lnl}: [185]INCOMPLETE -> [186]PASS +3 other tests pass       
>      • igt@kms_big_fb@4-tiled-64bpp-rotate-0:                                   
>                                                                                 
>           • {shard-lnl}: [187]FAIL ([188]Intel XE#1659) -> [189]PASS            
>      • igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:                 
>                                                                                 
>           • shard-dg2-set2: [190]DMESG-WARN ([191]Intel XE#1214 / [192]Intel    
>             XE#282) -> [193]PASS +7 other tests pass                            
>      • igt@kms_flip@flip-vs-wf_vblank-interruptible:                            
>                                                                                 
>           • {shard-lnl}: [194]FAIL ([195]Intel XE#886) -> [196]PASS +1 other    
>             test pass                                                           
>      • igt@kms_flip@modeset-vs-vblank-race-interruptible:                       
>                                                                                 
>           • shard-dg2-set2: [197]INCOMPLETE ([198]Intel XE#1195) -> [199]PASS   
>      • igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:           
>                                                                                 
>           • shard-adlp: [200]FAIL ([201]Intel XE#616) -> [202]PASS +1 other     
>             test pass                                                           
>      • igt@kms_hdr@invalid-hdr:                                                 
>                                                                                 
>           • shard-dg2-set2: [203]SKIP ([204]Intel XE#1201 / [205]Intel          
>             XE#455) -> [206]PASS                                                
>      • igt@kms_psr@psr2-primary-page-flip:                                      
>                                                                                 
>           • {shard-lnl}: [207]FAIL -> [208]PASS +1 other test pass              
>      • igt@kms_universal_plane@cursor-fb-leak:                                  
>                                                                                 
>           • shard-dg2-set2: [209]FAIL ([210]Intel XE#771 / [211]Intel XE#899)   
>             -> [212]PASS                                                        
>      • igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:                  
>                                                                                 
>           • shard-dg2-set2: [213]FAIL ([214]Intel XE#899) -> [215]PASS          
>      • igt@xe_evict@evict-beng-mixed-many-threads-small:                        
>                                                                                 
>           • shard-dg2-set2: [216]TIMEOUT ([217]Intel XE#1473 / [218]Intel       
>             XE#402) -> [219]PASS                                                
>      • igt@xe_evict@evict-mixed-threads-large:                                  
>                                                                                 
>           • shard-dg2-set2: [220]TIMEOUT ([221]Intel XE#1473 / [222]Intel       
>             XE#392) -> [223]PASS                                                
>      • igt@xe_evict@evict-threads-large:                                        
>                                                                                 
>           • shard-dg2-set2: [224]INCOMPLETE ([225]Intel XE#1195 / [226]Intel    
>             XE#1473) -> [227]PASS                                               
>      • igt@xe_exec_reset@cat-error:                                             
>                                                                                 
>           • shard-adlp: [228]DMESG-WARN ([229]Intel XE#1214 / [230]Intel        
>             XE#358) -> [231]PASS                                                
>      • igt@xe_exec_threads@threads-hang-userptr-invalidate:                     
>                                                                                 
>           • shard-dg2-set2: [232]FAIL ([233]Intel XE#1081) -> [234]PASS         
>      • igt@xe_pm@s4-exec-after:                                                 
>                                                                                 
>           • shard-adlp: [235]ABORT ([236]Intel XE#1358) -> [237]PASS            
>      • igt@xe_pm@s4-multiple-execs:                                             
>                                                                                 
>           • {shard-lnl}: [238]ABORT ([239]Intel XE#1358) -> [240]PASS           
>                                                                                 
>     Warnings                                                                    
>                                                                                 
>      • igt@core_hotunplug@hotrebind-lateclose:                                  
>                                                                                 
>           • shard-adlp: [241]INCOMPLETE ([242]Intel XE#1195 / [243]Intel        
>             XE#1667) -> [244]DMESG-WARN ([245]Intel XE#1214 / [246]Intel        
>             XE#1667)                                                            
>      • igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:  
>                                                                                 
>           • shard-adlp: [247]DMESG-WARN ([248]Intel XE#1033 / [249]Intel        
>             XE#1214) -> [250]DMESG-WARN ([251]Intel XE#1033 / [252]Intel        
>             XE#1214 / [253]Intel XE#324)                                        
>      • igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:        
>                                                                                 
>           • shard-adlp: [254]FAIL ([255]Intel XE#1231) -> [256]DMESG-FAIL       
>             ([257]Intel XE#324) +1 other test dmesg-fail                        
>      • igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:  
>                                                                                 
>           • shard-adlp: [258]DMESG-FAIL ([259]Intel XE#324) -> [260]FAIL        
>             ([261]Intel XE#1231)                                                
>      • igt@kms_flip@flip-vs-suspend@a-hdmi-a1:                                  
>                                                                                 
>           • shard-adlp: [262]DMESG-WARN ([263]Intel XE#1191 / [264]Intel        
>             XE#1214) -> [265]DMESG-WARN ([266]Intel XE#1191 / [267]Intel        
>             XE#1214 / [268]Intel XE#1608)                                       
>      • igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
>                                                                                 
>           • shard-dg2-set2: [269]SKIP ([270]Intel XE#1201 / [271]Intel          
>             XE#1226 / [272]Intel XE#1234) -> [273]SKIP ([274]Intel XE#1201 /    
>             [275]Intel XE#1234) +2 other tests skip                             
>      • igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:     
>                                                                                 
>           • shard-dg2-set2: [276]SKIP ([277]Intel XE#1201 / [278]Intel          
>             XE#1226) -> [279]SKIP ([280]Intel XE#1201) +19 other tests skip     
>      • igt@kms_vblank@ts-continuation-dpms-suspend:                             
>                                                                                 
>           • shard-adlp: [281]DMESG-WARN ([282]Intel XE#1191 / [283]Intel        
>             XE#1214 / [284]Intel XE#1608) -> [285]INCOMPLETE ([286]Intel        
>             XE#1034 / [287]Intel XE#1195)                                       
>      • igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:             
>                                                                                 
>           • shard-adlp: [288]DMESG-WARN ([289]Intel XE#1191 / [290]Intel        
>             XE#1214) -> [291]INCOMPLETE ([292]Intel XE#1034 / [293]Intel        
>             XE#1195)                                                            
>      • igt@xe_gt_freq@freq_suspend:                                             
>                                                                                 
>           • shard-adlp: [294]DMESG-WARN ([295]Intel XE#1191 / [296]Intel        
>             XE#1214) -> [297]INCOMPLETE ([298]Intel XE#1195)                    
>      • igt@xe_pm_residency@gt-c6-freeze:                                        
>                                                                                 
>           • shard-adlp: [299]DMESG-WARN ([300]Intel XE#1191 / [301]Intel        
>             XE#1214) -> [302]INCOMPLETE ([303]Intel XE#1195 / [304]Intel        
>             XE#1349)                                                            
>                                                                                 
>    {name}: This element is suppressed. This means it is ignored when            
>    computing                                                                    
>    the status of the difference (SUCCESS, WARNING, or FAILURE).                 
>                                                                                 
> Build changes                                                                   
>                                                                                 
>      • Linux: xe-1257-34d52122a69076639d526b035c8edd5b43201f84 ->               
>        xe-pw-133329v1                                                           
>                                                                                 
>    IGT_7842: e2a63accde6e8f3196013ab4809bf07f343fcf1e @                         
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git                         
>    xe-1257-34d52122a69076639d526b035c8edd5b43201f84:                            
>    34d52122a69076639d526b035c8edd5b43201f84                                     
>    xe-pw-133329v1: 133329v1                                                     
> 
> References
> 
>    Visible links
>    1. https://patchwork.freedesktop.org/series/133329/
>    2. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/index.html
>    3. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html
>    4. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-8/igt@kms_psr@pr-cursor-plane-onoff.html
>    5. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-lnl-4/igt@core_getversion@basic.html
>    6. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-lnl-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html
>    7. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-lnl-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html
>    8. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-lnl-6/igt@kms_psr@fbc-psr-cursor-render@edp-1.html
>    9. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-lnl-4/igt@kms_psr@fbc-psr-cursor-render@edp-1.html
>   10. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-lnl-6/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system.html
>   11. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-lnl-3/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html
>   12. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-lnl-1/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html
>   13. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-lnl-5/igt@xe_module_load@many-reload.html
>   14. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1767
>   15. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-lnl-3/igt@xe_module_load@many-reload.html
>   16. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>   17. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   18. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   19. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-8/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
>   20. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   21. https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   22. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html
>   23. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   24. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   25. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-8/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
>   26. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   27. https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   28. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-8/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html
>   29. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   30. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   31. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   32. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-7.html
>   33. https://gitlab.freedesktop.org/drm/xe/kernel/issues/650
>   34. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
>   35. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   36. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   37. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   38. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-dg2-436/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html
>   39. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   40. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   41. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html
>   42. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   43. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   44. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
>   45. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   46. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   47. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-dg2-466/igt@kms_cdclk@mode-transition-all-outputs.html
>   48. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   49. https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
>   50. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-dg2-436/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
>   51. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
>   52. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   53. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-8/igt@kms_chamelium_color@ctm-0-75.html
>   54. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   55. https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   56. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-8/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
>   57. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   58. https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   59. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-32x10.html
>   60. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   61. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   62. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-436/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
>   63. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-dg2-463/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
>   64. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   65. https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>   66. https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
>   67. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
>   68. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   69. https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   70. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
>   71. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
>   72. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   73. https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>   74. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
>   75. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   76. https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   77. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-8/igt@kms_feature_discovery@psr1.html
>   78. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   79. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   80. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-8/igt@kms_flip@2x-wf_vblank-ts-check.html
>   81. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   82. https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   83. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-dg2-466/igt@kms_flip@flip-vs-panning-interruptible.html
>   84. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   85. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a7.html
>   86. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>   87. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   88. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
>   89. https://gitlab.freedesktop.org/drm/xe/kernel/issues/422
>   90. https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   91. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
>   92. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
>   93. https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   94. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
>   95. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   96. https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   97. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
>   98. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   99. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
>  100. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html
>  101. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  102. https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>  103. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
>  104. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  105. https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>  106. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html
>  107. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  108. https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>  109. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
>  110. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  111. https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>  112. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-dg2-434/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html
>  113. https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>  114. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-lnl-8/igt@kms_pipe_crc_basic@read-crc@pipe-a-edp-2.html
>  115. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
>  116. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595
>  117. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602
>  118. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-8/igt@kms_plane_multiple@tiling-x.html
>  119. https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>  120. https://gitlab.freedesktop.org/drm/xe/kernel/issues/654
>  121. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
>  122. https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>  123. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-8/igt@kms_pm_dc@dc5-psr.html
>  124. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>  125. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  126. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-8/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html
>  127. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  128. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-dg2-466/igt@kms_psr2_su@page_flip-xrgb8888.html
>  129. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>  130. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  131. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-8/igt@kms_psr@fbc-pr-primary-blt.html
>  132. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  133. https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>  134. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-8/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
>  135. https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>  136. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-8/igt@kms_rotation_crc@primary-rotation-90.html
>  137. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  138. https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>  139. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-464/igt@kms_vblank@ts-continuation-dpms-suspend.html
>  140. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-dg2-466/igt@kms_vblank@ts-continuation-dpms-suspend.html
>  141. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>  142. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  143. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-8/igt@kms_vrr@flip-suspend.html
>  144. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  145. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  146. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-8/igt@kms_writeback@writeback-invalid-parameters.html
>  147. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  148. https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>  149. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-464/igt@xe_evict@evict-beng-cm-threads-large.html
>  150. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-dg2-464/igt@xe_evict@evict-beng-cm-threads-large.html
>  151. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>  152. https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>  153. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-8/igt@xe_evict@evict-beng-cm-threads-large.html
>  154. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  155. https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>  156. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-8/igt@xe_evict@evict-small-external.html
>  157. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  158. https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>  159. https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>  160. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html
>  161. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  162. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>  163. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-8/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html
>  164. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  165. https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>  166. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-rebind.html
>  167. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  168. https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>  169. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-8/igt@xe_exec_fault_mode@many-userptr-rebind-imm.html
>  170. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  171. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1562
>  172. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-8/igt@xe_pm@s2idle-multiple-execs.html
>  173. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>  174. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  175. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
>  176. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@xe_pm@s4-d3hot-basic-exec.html
>  177. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-4/igt@xe_pm@s4-d3hot-basic-exec.html
>  178. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  179. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-dg2-464/igt@xe_query@multigpu-query-invalid-extension.html
>  180. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  181. https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>  182. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-8/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
>  183. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  184. https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>  185. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-lnl-3/igt@kms_addfb_basic@too-wide.html
>  186. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-lnl-6/igt@kms_addfb_basic@too-wide.html
>  187. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-lnl-3/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
>  188. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>  189. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-lnl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
>  190. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
>  191. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  192. https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>  193. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
>  194. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-lnl-7/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
>  195. https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>  196. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-lnl-6/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
>  197. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-466/igt@kms_flip@modeset-vs-vblank-race-interruptible.html
>  198. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>  199. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-dg2-464/igt@kms_flip@modeset-vs-vblank-race-interruptible.html
>  200. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
>  201. https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>  202. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
>  203. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_hdr@invalid-hdr.html
>  204. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  205. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  206. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
>  207. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-lnl-7/igt@kms_psr@psr2-primary-page-flip.html
>  208. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-lnl-6/igt@kms_psr@psr2-primary-page-flip.html
>  209. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html
>  210. https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>  211. https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>  212. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html
>  213. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html
>  214. https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>  215. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html
>  216. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>  217. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>  218. https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
>  219. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>  220. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html
>  221. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>  222. https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>  223. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-dg2-436/igt@xe_evict@evict-mixed-threads-large.html
>  224. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-463/igt@xe_evict@evict-threads-large.html
>  225. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>  226. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>  227. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-dg2-435/igt@xe_evict@evict-threads-large.html
>  228. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-6/igt@xe_exec_reset@cat-error.html
>  229. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  230. https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
>  231. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-6/igt@xe_exec_reset@cat-error.html
>  232. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-434/igt@xe_exec_threads@threads-hang-userptr-invalidate.html
>  233. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
>  234. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-dg2-435/igt@xe_exec_threads@threads-hang-userptr-invalidate.html
>  235. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-9/igt@xe_pm@s4-exec-after.html
>  236. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>  237. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-8/igt@xe_pm@s4-exec-after.html
>  238. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
>  239. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>  240. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-lnl-1/igt@xe_pm@s4-multiple-execs.html
>  241. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-9/igt@core_hotunplug@hotrebind-lateclose.html
>  242. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>  243. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1667
>  244. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-8/igt@core_hotunplug@hotrebind-lateclose.html
>  245. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  246. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1667
>  247. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
>  248. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>  249. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  250. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
>  251. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>  252. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  253. https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>  254. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>  255. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>  256. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>  257. https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>  258. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>  259. https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>  260. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>  261. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>  262. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-8/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
>  263. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>  264. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  265. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
>  266. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>  267. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  268. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
>  269. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
>  270. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  271. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226
>  272. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234
>  273. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
>  274. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  275. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234
>  276. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
>  277. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  278. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226
>  279. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
>  280. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  281. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-6/igt@kms_vblank@ts-continuation-dpms-suspend.html
>  282. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>  283. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  284. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
>  285. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-1/igt@kms_vblank@ts-continuation-dpms-suspend.html
>  286. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034
>  287. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>  288. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
>  289. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>  290. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  291. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
>  292. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034
>  293. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>  294. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-2/igt@xe_gt_freq@freq_suspend.html
>  295. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>  296. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  297. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-9/igt@xe_gt_freq@freq_suspend.html
>  298. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>  299. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-6/igt@xe_pm_residency@gt-c6-freeze.html
>  300. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>  301. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>  302. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133329v1/shard-adlp-9/igt@xe_pm_residency@gt-c6-freeze.html
>  303. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>  304. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1349
