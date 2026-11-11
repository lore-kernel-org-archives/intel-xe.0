Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFACF606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 04:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N93ZHGYY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 711A810E114;
	Wed, 11 Nov 2026 04:44:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A14310E114
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Nov 2026 04:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794372241; x=1825908241;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=avgOpsYp+McOqAcd0gfPk/AIiapWQ3RRaut+/UKomGo=;
 b=N93ZHGYYw7/PBb1lRjogmN3IkJiMGqv4p/iRxDEjOOULrr6sjOmdj1K3
 0sabUGtKZkapNcNt2NPkMC19f8TMAYfepdqe1MUqRsm7PCd6Pb9A6/67i
 ltrTO5NotTnxbXOJku/C21WpDKbgT2jvsDT9b/gRlgnX6tdPOFuwljpFL
 Iy0C2b7z8+s7KxPOrcs1bDAowabZHZ4ZXsjrldkbkoQk3pPnMFBKdYxU6
 PkZl+vYZLQLf1eEqrtgWz7HVXyle49lFXUyITKMm6WXK8pmvaIsKOHeP2
 Hs1j4zAVmmB8SPPHxUQuzgPhd2V0Kimf9tjxaKgnB6b9CpK9LgeyBbOHe Q==;
X-CSE-ConnectionGUID: MY+sOJZLTDaXShFXE8kHAw==
X-CSE-MsgGUID: uVPPBvnbRFCX2BH0bcPesw==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3172147"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3172147"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 20:44:01 -0800
X-CSE-ConnectionGUID: 7RRjIzqOQbOo+YVMy9wMpA==
X-CSE-MsgGUID: eNFs1mnpQzySRH1sIT4O5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8633787"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 20:44:00 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 20:43:59 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 10 Nov 2026 20:43:59 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.18) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 20:43:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aX55gdyz9AtfExZgMuaBCvH0uDn4OjhC/2FuAySttoartA0UsXXqqxw34y1MSK9EtywrP7R3Et9Cu05MFKTHuoyCSDcnFLkuo1BXoDy4yQPvOOXhFWzCqS7fSzsSKCw/6KCw4izPYcZI5EaBq9PKGSIY8dH2CKurCUxnbm2wGcNqyAxHAaO99KZTwmQb6HIE3SfGXWC4X6r0x3QGzbNzKdFWG/7fRIgFlZtcfYMm8oVfQum95y0fg4xdnfh8InOGQ7qE4hT/1ha2ILKlbKWcmuQPlWxjot+cx9PuxJDDf+/ZaFrXl/2WGU9x76IvqELw311juQV71pBC2aiv8sNSHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7QoTBy6JVmxMiXcQHL2IBp4YlMAA/dHPOwMaD6fSkfc=;
 b=y7Z2CyVLzcR3lPxP7Zlci3hrPrFD04CFVh86Shv9+VOfqWGPq6y9xCRjgpjYYPa2p0qRluDPaDm4yBEjO3m0xk61lQXKP4YW8GfHDdd+OvYh/mNP9qWu3t/f3I1cFyxu/sCARYFyAjdySkuOtb9IKdh+iFNodotacSBCvn/ssuOoKDLTMlfRy8n8mk9l56EWHZin6Ak+JQsNp5EZ0kZr9DQZFs6ISxLLN/77hRQ8rZ1x5QOHeFgZMlzxMheHlNUVsl2vzE1z+Bll2IoHMswllU7TSgiFPYwsDZYrRq7GDeBbPHsRNi3p/LumkpvyXOTEuYEXDWfcJeXOU79hR174zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 BL3PR11MB6531.namprd11.prod.outlook.com (2603:10b6:208:38e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 04:43:51 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 04:43:51 +0000
Message-ID: <02e5f319-4d40-4ec2-9d50-a15b4102b21c@intel.com>
Date: Wed, 11 Nov 2026 10:13:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] drm/xe/survivability: Guard runtime survivability
 enable against unbind
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <mallesh.koujalagi@intel.com>, <badal.nilawar@intel.com>
References: <20261106071944.2693854-10-riana.tauro@intel.com>
 <20261106071944.2693854-13-riana.tauro@intel.com>
 <avMTTzrY0kPJRChS@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <avMTTzrY0kPJRChS@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0073.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|BL3PR11MB6531:EE_
X-MS-Office365-Filtering-Correlation-Id: 866cf7f8-30cc-41c0-5ea1-08df3fae6222
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|11063799006|4143699003|261022075727099003|261022105027099003|56012099006|261026140227099003|261026121527099003|261028144727099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: yjaXqx47rgnKrHTlPoQKgbukkBMxMAZg2GCPsz/038Kx3f8605VBjbNzb72sz9Dc4Rx0CU8o38gYRWaqMc8r7tZehPRQMm4tALa4gAu7417qQoPxxgdnIHVtJTjn3PEnph9avSP0/nJRnJWQrhzvVggTiVddFPUGGkj6y+DAjKN8vYJYc5LrSmibBPA2Hc98i5G/c9SypS1GHvC0RZvFiWIx4iI6shjBKC/VkbDSEboycp7G09CWZKm+pBJvLPgzSEaAP+VFOwWPZfe2jQg6XgEpeEaNVxCmwsXndMV7dhs4FEGigq5xnrwby7imtwJXLwMI8hmth/S6SmBpovOgA+ftC3QWNqBdIGu2VGMQT+7r5msgHXk1dCvuA9fXF9IN90rX9w/3UAKN3poKXwFqqKAEq0RgIhH5kmcmZxUvey47N3Zi6ocuugOGBnXYDSx9MHAeULmtjorEzpkl3M6ESCYUQVeCO80SqmHV2sEtNNmg2zSnnqdvRH5XaKzM7j2X5oS4JjBumUzxiP0BqTFFhMDHCYb3UP4+0KgTbuhx8cW++bjVxRMr/I0GeE9W4z0Cyp6m8ilmRSN253ysejVswDS5CfcGfLE1rkIuo62Oha+1qiFFA9ZkGAKrpHlmvnH2dTuCKC+DtzRAe9WqX/KTkOS7B4SfQk/VTJ/xr2OfqL8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(4143699003)(261022075727099003)(261022105027099003)(56012099006)(261026140227099003)(261026121527099003)(261028144727099003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0p1MCtocmFaWTQ5Mzg4dWdsVEJ6T3FWbWNZS0NIYmZWVTJpUG1PaXd6YVRr?=
 =?utf-8?B?QzcxbzZiZ1hRVHhYdHg5dmljYmtkTHhIZy9Ra0FmaWRGMEhxREZ5RFpxaTd6?=
 =?utf-8?B?ZW1ySFhhYVdSelBMbE5CY2xFVUw5MVlndmtONWxCKzZwWTRqMkJnb0t5L3ln?=
 =?utf-8?B?ck9TNEVoL0l4a21wWXBuZVhhYURLVStqbTBZZ3hocG41L1pjK2IzQytJcW5M?=
 =?utf-8?B?V0FPYW5rYnZPZHhFcHJhRkxzL3c3dnliZllEVit3SHpselZOc1FDVldBZDM3?=
 =?utf-8?B?N3VtMStxNGV5TG9Mdkd4Y3hnTU5YQ3h0SWp2dm45N0IxZ2tPYXczMHF5cDUx?=
 =?utf-8?B?aGFtSTQrUnozWFJwTVBMVlEySWFzRkY4YU1LRWVFSEdXeG5sUUlWWUhzZGFu?=
 =?utf-8?B?TFF2dTI5bnp1WnRuWlVTWHNyYWhqVlcyb21uaEhkZGFwVnowV3hyaDJjd09k?=
 =?utf-8?B?US84eUpDU29RdzlVeC9YRmRTTU5nRVZJS1FDNTFTN2NGU0RtSGxyS29XSkM3?=
 =?utf-8?B?b1BQTEhuTDdUM0p1NmM3RGRYY1BJZlZoeFZaUnRyb1gzQzVQTW05dXMxY3hJ?=
 =?utf-8?B?ZkozS3pqSkw1OHFmWTVJZ3htdU9UZ3RPRFV5bmg1RVdIL3hIT0FibStuR1k5?=
 =?utf-8?B?OUFVR09SRERiZnROODlZOFFBUjkzQkJ1dHJOVWNNK3BPdkVIckZIL3lCSFpx?=
 =?utf-8?B?ajM2YjVYTDNxMGZtRDFob3JqaG0xYjJqSFVMVGUvKzIvUlV4ZE5aQkU3a3gw?=
 =?utf-8?B?U0NhYVI0NG5UeGxhbkl4eU9GSndFSlhSeERnNkRVbVF0MWJVK2drT2Q2bE1J?=
 =?utf-8?B?dHdtNW50Vkw1bmZrckNEcloyMFRRWVFKUzVUQUdob3hMVmNBRmVNTUsrMXor?=
 =?utf-8?B?cXNUa1p5aEI4aFFTSFp0QVArOGg5dXNUc3Y0Mkp2d3RiQWZxQmp1MS9hUE0z?=
 =?utf-8?B?eGx5eDZrcTY3OHBsc2M2eTF1WDUvSGMrVFRWdzdrV1BYNlVndSt1d1pwa1JK?=
 =?utf-8?B?T216eDVsT2FRMmt6MDBWbEFLSEQ4dWFqU1pWYkN6QW5EdUk0STRJMkprajY2?=
 =?utf-8?B?T3lteVNBcmk0dVNTV2ZTTXIveXIxRElNSWJoSjBsa05ub0ZPeGwrQUZyTnlU?=
 =?utf-8?B?TzVnVWI1bGlpL3lqNFZIUCtmRDlpenZ2eXRsL0gxbW5TZjl3UDBUZDJTcXZI?=
 =?utf-8?B?N0JFMmNyYUE5VXg5Q1ZFTEFXbjNTVE53QWR1UFJBRDBHeit1QjM3d2VNYkVC?=
 =?utf-8?B?UGNnOHI5RXQ2R1VyVUF4d1F3U1p3cTNZdVowZTBNQVNLSmRZcHNVY2g3MWpw?=
 =?utf-8?B?SjZXT0U1RE0wZ0psc0tlU0wvTjNqSUxxdFlqcVBTeUx4N25vbkxJK25BRlNI?=
 =?utf-8?B?OGVyT2hFMWtaQnRqMVIwck9KMFhoR3dFd1FpWU9Kc3JBaHpWcmlkbVVlSGlo?=
 =?utf-8?B?VFl6SjRKai82bnJtTXIycU4zQlBoVkVEUWNpdkphOWN1YmdqeGdnd3B6Sjg2?=
 =?utf-8?B?L0VvSHhieGVhU1c3c1IzZGJkcXlueTNsQXF1TmZ2ZE1GdE1TRlZFcyt1UmZN?=
 =?utf-8?B?R0tqN3BrVEJMMkdRcGMyVWorbEozWHVMb2YxalFha3pxQXNOaDZUYnNDQXlm?=
 =?utf-8?B?MzlCd2VYNEY0MDlMRnFPc2VUdEVwWVlOOGZaYUh4UFhnb013cjZqd3hKTkE1?=
 =?utf-8?B?Y1d4MXNISnlNWUEzNktIYVBwY3prdXF2dlhuWElvaWZrK01pdWZ5cVlpSEFy?=
 =?utf-8?B?bTBvMjRpMEY2RjVVQWlaQjdyajdDTkZidU5Gd1pHM2hDZExpc2g3OGN5Rm5p?=
 =?utf-8?B?ZDZsR09ZWU1QNG5FYnc5ZlpiTGIwd21kZisyYzgvTW9PUzJYajdZZ3VzTVYv?=
 =?utf-8?B?WWZEdHRwamRiNGR1NU5QZHgvQzk4VXkxdmJxQ0tWS3ZpWUpkeGdzN1IwVFB4?=
 =?utf-8?B?MWs0WlI1RWhydC82RVlNcm5FeHJMcXVIS29KNERtbGhzRGRNZUdyNGZNbFA3?=
 =?utf-8?B?WFV3YkR1QU85VXJqWElMaFdyZVEzOXJ2MDU4TnNHcFlSOStqcGhsYWhVK0pE?=
 =?utf-8?B?R1RnSW52TFh0Z2c1bTBnSWZ1UHFxb2dRVGRqdzM5MUJTSXYwL3hoMkJXdUpu?=
 =?utf-8?B?WjlPYmVSN2VjWEx4R09ORFRVMFF6dmx5anBrOG1ydnRPQWt0WHhNVFVHZldC?=
 =?utf-8?B?UCt0aWdhcWtKSEhKN1hqNVJnRlE5R1Vqa1pGRUJ0ZjdLaFVmL0dLQjM4bTJ0?=
 =?utf-8?B?V0dkREphSnU2UWhSVUhCT3A1NVRRQ0VPTzlTbzY5bFFhK2NuYndaVkJVM3Y0?=
 =?utf-8?B?MENiL3c5Wjg1endmNjFoRjNKWEJ0Yk1jV2dkQ24vVUROWUJJdlVlUT09?=
X-Exchange-RoutingPolicyChecked: y17k6DDQq5RddqQOn38CZ6TARWEDdIrlvRam2lh985bgzIMnAyIGsquVBUHLLbcalZ/ioDuWnqqFBanGgxQWxkvvVgO2wrw8xcp282ngMNUeIzeZww48DOxZ9Fy9VfD1evnz9PfD50P01V5cBZWvzoBvd9beit9lsHJMsb4iYN+uXozVZE56OzbgdetUGwg4OvS+b1N3sbBfJXAkxD7l31pzuh7S2sX37qhyHitakK5JuZ5c30R0xxeHmnO84G8y0WjSBVzosrP/A+dN1NV+zAtyl1GDMN++h+paW6Iku4VsNaB92vDxedjqIvqluLy7oCHlciV+G4wrsA/N8ezrBw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 866cf7f8-30cc-41c0-5ea1-08df3fae6222
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 04:43:51.4949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: StSfUiC3eFTGChpd6UXZ+mIeXW55VxzTG2ujjIocbmlyB11QL1NQYf/qFFSvKIDL3ZXTdQNZAxINBvIcVBWFgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6531
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
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 10-11-2026 18:21, Raag Jadav wrote:
> On Fri, Nov 06, 2026 at 12:49:48PM +0530, Riana Tauro wrote:
>> Runtime surivability mode creates sysfs and declares the device as
>> wedged in a worker thread. This can race with unbind.
>>
>> During unbind, devres actions such as disabling the worker run as part of
>> teardown. A runtime survivability enable that is still in flight or gets
>> scheduled in that window can create the survivability sysfs entries while
>> the device is being removed. This is incorrect, as runtime survivability mode
>> must not be entered once during devres teardown.
>>
>> Use the DRM device enter/exit protection so that the enable path
>> synchronizes with device unplug and returns early if the device is
>> already being unbound.
> I'm a bit lost here. Doesn't disable_work_sync() already guarantee this?

If the worker is already queued and there is a unbind in progress. The 
disable work sync from devm
action waits for the worker to complete. This causes the device to enter 
survivability mode during unbind
which is not intended.

Riana

>
> Raag
