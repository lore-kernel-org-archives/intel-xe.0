Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 875D6CD4F3C
	for <intel-xe@archiver.kernel.org>; Wed, 20 May 2026 14:30:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 492F010F07D;
	Wed, 20 May 2026 14:30:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WbwOnnrQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2554B10F077
 for <intel-xe@lists.freedesktop.org>; Wed, 20 May 2026 14:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779287441; x=1810823441;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9S46uB/s4i6M0iNMh+/kefGB6/ao/ijnX6uAzSkOe5Y=;
 b=WbwOnnrQu9DFDMM5NHo/aH2SB5L4+kKU2U9Ng1QJjUKHslUK8ycN9/Ht
 Ta8munpM2bRqEZvWjCifl2xiZJ3Mu7cP9Va+Wn+A7u1RdGnFltRoy25c5
 qkAEa1zI9HC8v+/OIaGTKz3hlL32pKbr6qUQARLWdkF6YBoRCYrWcR6qC
 y+kNORzsOihv9/nG3+hYQju7g3lHcQOczS5R9dCOYVfTWxkgf9w9AjNII
 R10RcFRRffg2OgyMD/S4tIyfx5wr3p0uWIVQ5syNoayeK1oDGZVzZ5pzW
 TXHW/aGot7gjHxqzZQfs55gw3oVqAB5Y22RIbw984RYfBaYBqJJHUHGYU w==;
X-CSE-ConnectionGUID: MCnxERy6SbCIHchPPms4ww==
X-CSE-MsgGUID: 8bRfmBhmS92kaLI0uAJPaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80169277"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="80169277"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 07:30:39 -0700
X-CSE-ConnectionGUID: L2DTOnqzTRePPmfwp2Cmfw==
X-CSE-MsgGUID: /6nYFFaLQoS49pIEy9ZnjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="237594395"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 07:30:39 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 07:30:38 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 20 May 2026 07:30:38 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.46) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 07:30:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZfGrJKF3MKP3OqULUT3l+u6eAgeQUYaax4xPtz/78lFoFjfHoKMwzSQGTPEAECGAvnCQW8lVOhfhqdwziy6ZfJIhuj1qTg1unuhxzhjJt0ZOtwdTlety9R3pvISpDKgFy7pupfLprnyV+W2xdcRvprFpD/6w6Ntzi0r1XNBMDsfRxzS/qTc0BeSA8u0WqwFNbW94gXstdAZZ4wOwrwcehxqdxLzw7dhGNWbrrDcgQOPqwTJ/QtZuFTqZ3hkRb17GcEHjpYMgoTu/epwuTXYQUdDnkBp6Jz5daa9Sx/S0RrAgPRKr5+UzNyEF6wzN9oflaujVViK1unlbhQ/y3P2Xzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kx2jEOSpUTSEHY3aZWh+rCUvQJd7P3sd3cggC+HmqEc=;
 b=KdVfgJhFmkC98+uxHDjJFqCGn9WgBvifNl2m2y+yNaTcOwx0XkTesLzJdhKOGS/sw57GksQEz+x+PxKFkEG6iDhoQZK2Wt6ZqzEKZVwfeIW8sGKd0lbuZ/iUthy0G9tBRKNQfgbhi/j5dNaUjytpNOiF65px4OfM4QReP5SVBuPj9YthxRZI9BJPfmX2VdXPvLKsNP0scp+ZcOavrufdhThbbNQELT2e0LC5SvWzSFgxi08fPECZ5EoRKEvPVxz8jBIgtUCFBxUp2CFf0xvFZGWUSmM24Si9++qlb8sxp+RZXp158EJUNd9TLEuyuLHxJpS7NFuf5ufc2rKsY0y6xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS3PR11MB9647.namprd11.prod.outlook.com (2603:10b6:8:38e::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.14; Wed, 20 May 2026 14:30:36 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 14:30:36 +0000
Message-ID: <ce8a32bb-c41a-499f-805d-84fca6941db0@intel.com>
Date: Wed, 20 May 2026 20:00:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] drm/xe: Unify fault injection hooks for CSC, GT reset
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <karthik.poosa@intel.com>,
 <sk.anirban@intel.com>, <raag.jadav@intel.com>
References: <20260518134658.113460-2-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260518134658.113460-2-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0273.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS3PR11MB9647:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e1b9c65-24d6-477b-ee67-08deb67c5b5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: r1Piew4ut0FekRaIgiWt5S7kecNUfWb0LVSFpQnk7W4S16JLgqyq0gQX5Y7qoUZmL2E+NKfdDN/47Aw9EfHgDddUP923rDcNNCo+2a8PtirqDId6Tzt5RtnJ/umXAQSj3VNUqpkW/GlDdPr0R37cDol4X7xVERvYkeMN8fDmJ1hlWGgKxYazSeoCPySA1h2InUBQIHsdQ492unVQ1gwFfKdZw4Z5vZDRt3Nl9DgD26hKqz6BPrEsMQji+qRBIxgvF+f2IAS07pDQtCWdUCTGWVmQSocGUpjDTnjqNG+Gjmnxbu+q00eGfz76CZvoK7IBss5Yl6BMJlnwIJbZ7KfklXmS5oNhDIp7cd6dMlK93wC1qdMn1sJzGhW4TpBWFDIyHZ59dyLH/jiinYEBgI0BQ6Ajr6kz10gqykvkE1NjL/ydyCbd03NeRhvlRf/o+UUidonyN2KNEuKPrU/ZcE7jSjEBJioTWLa5B9ynVxikjSF1EH6GJ4IC5UG8bS5M7JBO5f3rua7JyXGfM3LsJtAw7vofYy+pYkkupFoDGGy35/xK1QHocGwb1rp0q9vOZ5uSVxT2UXEkYPrCWKOv52YoZmTekCCTZWN1GHnXLjyvJqpaFzrQFap3cgD4ZErZLhlxMuwc+0rXVdKU/VKyl3HYHW45uvXnH/P2bW1ulOtJZLxi+HkzIQivsVgzFT9xiwLZeNFjGy1Nyf9NjDp5QaczZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWxESTZhMGxhd0Z0RVQ4RFNsNlFyeVpZejNkUXI3YUlEd0dlNXpYRHBwQVNE?=
 =?utf-8?B?b25oYmJwOHlqUm1WcUV1NDd4eENMUGp0QTBscTF3dzV3RERjUHZ5eEVSeDMr?=
 =?utf-8?B?SGo5Sm5ncGlTY04zbmFWRVhHRFNxWEs3YjVQd2xzMlp5QmE4bVFjYzRnaEs4?=
 =?utf-8?B?Mlc1ZzhsZW5kME1WOWJYN05zblAwU3k3TDFZSmUvVzNGN0tyT1BKZDNteit5?=
 =?utf-8?B?dWYxSGxCT3BJSHBEQm9ObGNIbjNCR2hwWGVWVFZCRUtQaTNZNjdwZjhIVG9B?=
 =?utf-8?B?ZUM2RzNIRXBWcTNkU2hwbVNjRzJhK01MZnhMSWdYN0h5VjJnUHJod3FJSEhT?=
 =?utf-8?B?UWR2NkpXL1ZaaHlMNnlpTE15cjZyUFpISkVXL1lqbm4yV2xFWDE2djdCRXU0?=
 =?utf-8?B?WGg4WWJ3dEE3TmJOU2I0UGdOTER5K1ZQQkcxQ0JENTF5anAwZXhYQzNmVmdq?=
 =?utf-8?B?dFovaGoxYzVKWTdYckd5cFB3aFN4Rlptb1U4ZVZlMWdoSmZ6UFdWNllqdjB6?=
 =?utf-8?B?VS9VSUJ1alNFKzlnRkFLQnZvUUdRL1pITnR2N2lCSUJDOVVEUmwybEEyZW5Q?=
 =?utf-8?B?dHhsclV3Z2J2TklFNk5DazBxOW9OcHRIbzcvTFdKMmxzWTlDbVBUcUJLNHFR?=
 =?utf-8?B?ZFV5eExHby9SVUJGVUJpU1hIdzZ0dTZyQzVJVm5KcVhrdlFYUUpMOS9pUVFi?=
 =?utf-8?B?cEx1akRibWUxdDk2Z2I4TU5CMDM1eXQwOGF4WFcySlJKUHdjbFplTUk5N0VG?=
 =?utf-8?B?bEk1NFZ0K1FKMHYwbjEwSFNEWHZ1RGJzMVphNVZ0OE1Va1FaWXpDL0pHeVJ0?=
 =?utf-8?B?ZUxvOTZ4QkMvaWJTczNUVmpZVVFhYU5sais0Z2hzM0V5OEI0SjFuYXpxWWRt?=
 =?utf-8?B?T3J6Y1hqejVhV1lrM25uSjRGQTN2blFSTUVDMGVRQTRiK0lxSTZxdkpFVjZh?=
 =?utf-8?B?U1ZFVHZ1a1RHT1FaeHFiUWFWLzJxYnljdmo3cnY1SFRZUmVpRDAwb0FHZFVj?=
 =?utf-8?B?SjRRaVE4TGhNS2x0UDQ1WEJrWEZiQzRZd3p3U0g0ZEVJVVExNmFtWXpKNU13?=
 =?utf-8?B?VG5tOTdrZ3p0TU40aE1HYTFUMlF6WTZkM3kyMEJzZWc5b0J6aFZQV3pSUTdl?=
 =?utf-8?B?MEY2aGNidG1OREZkUktjcjRRVTdJZUcxd0ZTT1VVK1czWVFzVWlWZ3RPd1F5?=
 =?utf-8?B?dHY2NFc2Uy9Vb2x3d1hIaHBMTFVyc1lHSDRML2tZdUp4SlFOajl5Tld6RUJt?=
 =?utf-8?B?TVFUQXo0MzF2dXNBaXB2N0xPNld6b3FuSFpTR3lWV1pBbm5vRWhRSVVxdllO?=
 =?utf-8?B?c3I3T21XVmZ1VTJKTitvMlRsaVpmNkZNN2tBYms4ZGpPYXQ1UEIvK3FRRlli?=
 =?utf-8?B?TDNWQm9ndjd2VkUxeE8vV2VKL1ViVDRURUJtc1FsaWY2OTdreGVrN2JsVEVk?=
 =?utf-8?B?MThMTzEycmt6TE1GOXgySHpnclpzSThScmZlQytGaHVwbTdxbDlJRTdTMUtO?=
 =?utf-8?B?cXpXZHljdTUvODVmUjBBZGRmdmJCS3gzWVM0TW9nemdmZkx5eDRTS1F0dVNx?=
 =?utf-8?B?dXZtNXkwZzM2dFpRSVZHdTlBWlBxWjdLTTBmL1NJWi9wWHhrQjZVUktLbTJO?=
 =?utf-8?B?OHJ0dTJnSUhWYWJ5UzlWVzdRTGdYOVdZdEwxNi9xSHg3K2IzbEVnUGRLNUc5?=
 =?utf-8?B?YXhsOUd1MjZMb1d0SnNXV21adGFhSjRrYWx0UWxjUmNqWkFXTHhaMTJaZHNs?=
 =?utf-8?B?ejVvaWZTOHVkSUVDZDVQU2liejdGQ0drK0dldE1aU3J1WkNsaFZ2VXFoZzhR?=
 =?utf-8?B?UDNzMmNWcitFWHJidnExYlVPN1JvOUFMWnZscG5UMUFmenFDS2NWUUlzRE1B?=
 =?utf-8?B?YUZ6b2FtNllnWVRrZnY2amxERFUzRGdFdW42Z2pVVXpWWkdtZmthYXhUSWJP?=
 =?utf-8?B?clZua2ZQYlNaZElGekhwaldsZzJPVzdxeGgwUlBuc3RzK2p4Z21meDBGSHUz?=
 =?utf-8?B?bkwwYTVLZXdUQVZuYUlka3VnU2FCb1l6cXJuSGlzV3dmNC8rdk5tZEVvZlQr?=
 =?utf-8?B?blRXVHd0TGlsbzh5cnRPZnQ5UDRTN1B2UmRjcFBFRVBkR2ZhdzlONnBjTUE0?=
 =?utf-8?B?OFhNSGMxS3NJbnVtd2phSkE4bGhiS09kT3VOaDN2T1dST0NYaGRYWllFOVpz?=
 =?utf-8?B?TS9EOVZ3L0VMamxUbkQ0OEJsSHdvRGVuOUFsV2pmanJJUnZESUhpUGRaWTBo?=
 =?utf-8?B?Z3NKdDNYVEVDaHk2Z2gvdWo5ZlNlRENxTkF1dE9nV2R5MGVBb1VMNzhOWDN1?=
 =?utf-8?B?R2V1N3ZUOTNSZmQwenUrbFdTcmYrdXV1WlNxcmFiQ2xkRnBqQUNaZz09?=
X-Exchange-RoutingPolicyChecked: aLRW0tgAnNomQtcvUGWe4gZq9bLvibrFVEU3eJFWx3zvHRxnaSfNLfDKaWylRhX3Qehcw46jBU5Bz1N6VvKeDlw0iI0XgR5bDztQINJLhfOaFt06int4eBhEgsIZk2Bbpe2CugJ/Pm8gyQbpPS9aKBpm3t9yPuMeegWETiDXX/3pYtjjmRoxuGBJvjNGE6y9GDGzlwsCCvksDCSSDSKufgGb8T1Mj88FKvhEG9CHJNNIn5BR6i5GdS4QGjOWPVpmbmZxij84e1sYC0y8AgWgg11KJ7XiOnK47aZbv4zgsa+tpz1AzV7G+7sVtZlOkl1V3g+UZLPCn0rLb9DA2Y4V7Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e1b9c65-24d6-477b-ee67-08deb67c5b5c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 14:30:36.1997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nVkDPDm5ek1smvDF/3UrSMGQZUo2PdRa/XlwBFfPe9CNRDEQSNqQ1J/qXNr1ZxyM/YiAs9S+oygcuIBhAQHgag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9647
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


On 5/18/2026 7:16 PM, Mallesh Koujalagi wrote:
> The fault injection code was scattered: the GT reset
> hook lived in xe_gt.h as an inline function with its own global
> variable, the CSC hook had a separate global in xe_hw_error.c with
> an extern declaration,

Since they belong to the components they were added there

>   and each was individually registered in
> xe_debugfs.c. Adding a new error type meant editing many files and
> copy-pasting the same boilerplate.
>
> Create a single, centralized fault injection module
> (xe_fault_inject.c/h) that manages all fault types through
> one table.Each type is just an entry in an enum and a one-line
> row in a descriptor array -- no more scattered globals,
> externs, or per-type inline helpers.
>
> Debugfs interface (under /sys/kernel/debug/dri/0/):
>   - fail_gt_reset         - GT reset failure
>   - inject_csc_hw_error   - CSC firmware error
>
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
> v2:
> - Add multiple platform support. (Vinay)
> - Handle VF properly.
> - Rename to XE_FAULT_GT_RESET/XE_FAULT_CSC_HW_ERROR and
>    create xe_fault_inject_types.h file including those name.
>
> v3:
> - Solved patch apply issue on tip.
>
> v4:
> - Add proper header file.
>
> v5:
> - Properly refer FAULT_ATTR_INITIALIZER. (Vinay)
> - Change xe_fault_inject_descs to xe_fault_inject_entry.
> - Change 2025 to 2026.
> ---
>   drivers/gpu/drm/xe/Makefile                |  2 +
>   drivers/gpu/drm/xe/xe_debugfs.c            |  9 +--
>   drivers/gpu/drm/xe/xe_fault_inject.c       | 68 ++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_fault_inject.h       | 31 ++++++++++
>   drivers/gpu/drm/xe/xe_fault_inject_types.h | 21 +++++++
>   drivers/gpu/drm/xe/xe_gt.c                 |  5 +-
>   drivers/gpu/drm/xe/xe_gt.h                 |  8 ---
>   drivers/gpu/drm/xe/xe_hw_error.c           | 11 +---
>   8 files changed, 129 insertions(+), 26 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_fault_inject.c
>   create mode 100644 drivers/gpu/drm/xe/xe_fault_inject.h
>   create mode 100644 drivers/gpu/drm/xe/xe_fault_inject_types.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 09661f079d03..d4acb8e9c3b7 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -361,6 +361,8 @@ ifeq ($(CONFIG_DEBUG_FS),y)
>   
>   	xe-$(CONFIG_PCI_IOV) += xe_gt_sriov_pf_debugfs.o
>   
> +	xe-$(CONFIG_FAULT_INJECTION) += xe_fault_inject.o
> +
>   	xe-$(CONFIG_DRM_XE_DISPLAY) += \
>   		i915-display/intel_display_debugfs.o \
>   		i915-display/intel_display_debugfs_params.o \
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 22b471303984..8402189b24ef 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -6,7 +6,6 @@
>   #include "xe_debugfs.h"
>   
>   #include <linux/debugfs.h>
> -#include <linux/fault-inject.h>
>   #include <linux/string_helpers.h>
>   
>   #include <drm/drm_debugfs.h>
> @@ -14,6 +13,7 @@
>   #include "regs/xe_pmt.h"
>   #include "xe_bo.h"
>   #include "xe_device.h"
> +#include "xe_fault_inject.h"
>   #include "xe_force_wake.h"
>   #include "xe_gt.h"
>   #include "xe_gt_debugfs.h"
> @@ -38,9 +38,6 @@
>   #include "xe_vm.h"
>   #endif
>   
> -DECLARE_FAULT_ATTR(gt_reset_failure);
> -DECLARE_FAULT_ATTR(inject_csc_hw_error);
> -
>   static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
>   				   u32 offset, const char *name, struct drm_printer *p)
>   {
> @@ -563,8 +560,6 @@ void xe_debugfs_register(struct xe_device *xe)
>   		drm_debugfs_create_files(debugfs_residencies,
>   					 ARRAY_SIZE(debugfs_residencies),
>   					 root, minor);
> -		fault_create_debugfs_attr("inject_csc_hw_error", root,
> -					  &inject_csc_hw_error);
>   	}
>   
>   	debugfs_create_file("forcewake_all", 0400, root, xe,
> @@ -610,7 +605,7 @@ void xe_debugfs_register(struct xe_device *xe)
>   
>   	xe_psmi_debugfs_register(xe);
>   
> -	fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_failure);
> +	xe_fault_inject_debugfs_register(xe, root);
>   
>   	if (IS_SRIOV_PF(xe))
>   		xe_sriov_pf_debugfs_register(xe, root);
> diff --git a/drivers/gpu/drm/xe/xe_fault_inject.c b/drivers/gpu/drm/xe/xe_fault_inject.c
> new file mode 100644
> index 000000000000..405dab10c942
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_fault_inject.c
Add a documentation for the fault injection entries
> @@ -0,0 +1,68 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/fault-inject.h>
> +
> +#include "xe_device.h"
> +#include "xe_fault_inject.h"
> +#include "xe_platform_types.h"
> +#include "xe_sriov.h"
> +
> +static struct {
> +	const char *name;
> +	u32 platforms;
> +	bool skip_on_vf;
> +	struct fault_attr attr;
> +} xe_fault_inject_entry[XE_FAULT_MAX] = {
> +	[XE_FAULT_GT_RESET]	= { .name = "fail_gt_reset",
> +				    .attr = FAULT_ATTR_INITIALIZER },
> +	[XE_FAULT_CSC_HW_ERROR]	= { .name = "inject_csc_hw_error",
> +				    .platforms = BIT(XE_BATTLEMAGE),
> +				    .skip_on_vf = true,
> +				    .attr = FAULT_ATTR_INITIALIZER },
> +};

Instead of this. why not just check skips and platforms in 
xe_fault_inject_debugfs_register? What will happen if there are more 
checks in the future.?

> +
> +/**
> + * xe_fault_inject - Check if a fault should be injected
> + * @type: fault injection type to check
> + *
> + * Returns true if a fault should be injected for the given type.
> + * Controlled via debugfs fault injection attributes.

Return: true if fault injection is successful. false otherwise
Also return should be the end statement.

See Kernel-doc comments — The Linux Kernel documentation 
<https://docs.kernel.org/doc-guide/kernel-doc.html#function-documentation>

> + */
> +bool xe_fault_inject(enum xe_fault_type type)
> +{
> +	if (type >= XE_FAULT_MAX)
> +		return false;
> +
> +	return should_fail(&xe_fault_inject_entry[type].attr, 1);
> +}
> +
> +/**
> + * xe_fault_inject_debugfs_register - Register fault injection debugfs entries
> + * @xe: xe device instance
> + * @root: debugfs root directory
> + *
> + * Creates debugfs fault injection attributes for all supported fault
> + * injection types. Platform-specific entries are only registered on
> + * matching platforms. Entries marked skip_on_vf are not registered for
> + * SR-IOV VF devices.

Function description should be brief. Do not mention everything the 
function does

> + */
> +void xe_fault_inject_debugfs_register(struct xe_device *xe, struct dentry *root)
> +{
> +	int i;
> +
> +	for (i = 0; i < XE_FAULT_MAX; i++) {
> +		if (IS_SRIOV_VF(xe) && xe_fault_inject_entry[i].skip_on_vf)
> +			continue;
> +
> +		if (xe_fault_inject_entry[i].platforms &&
> +		    !(xe_fault_inject_entry[i].platforms & BIT(xe->info.platform)))
> +			continue;
> +
> +		fault_create_debugfs_attr(xe_fault_inject_entry[i].name, root,
> +					  &xe_fault_inject_entry[i].attr);
> +	}
> +}
> diff --git a/drivers/gpu/drm/xe/xe_fault_inject.h b/drivers/gpu/drm/xe/xe_fault_inject.h
> new file mode 100644
> index 000000000000..91883ffb5f4b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_fault_inject.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_FAULT_INJECT_H_
> +#define _XE_FAULT_INJECT_H_
> +
> +#include <linux/types.h>
> +
> +#include "xe_fault_inject_types.h"
> +
> +struct xe_device;
> +struct dentry;
> +
> +#if IS_ENABLED(CONFIG_DEBUG_FS) && IS_ENABLED(CONFIG_FAULT_INJECTION)
> +bool xe_fault_inject(enum xe_fault_type type);
> +void xe_fault_inject_debugfs_register(struct xe_device *xe, struct dentry *root);
> +#else
> +static inline bool xe_fault_inject(enum xe_fault_type type)
> +{
> +	return false;
> +}
> +
> +static inline void xe_fault_inject_debugfs_register(struct xe_device *xe,
> +						    struct dentry *root)
> +{
> +}
> +#endif
> +
> +#endif /* _XE_FAULT_INJECT_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_fault_inject_types.h b/drivers/gpu/drm/xe/xe_fault_inject_types.h
> new file mode 100644
> index 000000000000..d5402b5a3fd6
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_fault_inject_types.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_FAULT_INJECT_TYPES_H_
> +#define _XE_FAULT_INJECT_TYPES_H_
> +
> +/**
> + * enum xe_fault_type - Fault injection types
> + * @XE_FAULT_GT_RESET: GT reset failure injection
> + * @XE_FAULT_CSC_HW_ERROR: CSC hardware error injection
> + * @XE_FAULT_MAX: Number of fault injection types
> + */
> +enum xe_fault_type {
> +	XE_FAULT_GT_RESET,
> +	XE_FAULT_CSC_HW_ERROR,

Inject_csc_error?

Thanks
Riana

> +	XE_FAULT_MAX
> +};
> +
> +#endif /* _XE_FAULT_INJECT_TYPES_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 783eb6d631b5..242683cd5906 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -25,6 +25,7 @@
>   #include "xe_eu_stall.h"
>   #include "xe_exec_queue.h"
>   #include "xe_execlist.h"
> +#include "xe_fault_inject.h"
>   #include "xe_force_wake.h"
>   #include "xe_ggtt.h"
>   #include "xe_gsc.h"
> @@ -923,7 +924,7 @@ static void gt_reset_worker(struct work_struct *w)
>   
>   	xe_gt_info(gt, "reset started\n");
>   
> -	if (xe_fault_inject_gt_reset()) {
> +	if (xe_fault_inject(XE_FAULT_GT_RESET)) {
>   		err = -ECANCELED;
>   		goto err_fail;
>   	}
> @@ -980,7 +981,7 @@ void xe_gt_reset_async(struct xe_gt *gt)
>   	xe_gt_info(gt, "trying reset from %ps\n", __builtin_return_address(0));
>   
>   	/* Don't do a reset while one is already in flight */
> -	if (!xe_fault_inject_gt_reset() && xe_uc_reset_prepare(&gt->uc))
> +	if (!xe_fault_inject(XE_FAULT_GT_RESET) && xe_uc_reset_prepare(&gt->uc))
>   		return;
>   
>   	xe_gt_info(gt, "reset queued\n");
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 4150aa594f05..f8e3ca63aabb 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -6,8 +6,6 @@
>   #ifndef _XE_GT_H_
>   #define _XE_GT_H_
>   
> -#include <linux/fault-inject.h>
> -
>   #include <drm/drm_util.h>
>   
>   #include "xe_device.h"
> @@ -38,12 +36,6 @@
>   	xe_gt_is_media_type(gt_) ? MEDIA_VER(xe) : GRAPHICS_VER(xe); \
>   })
>   
> -extern struct fault_attr gt_reset_failure;
> -static inline bool xe_fault_inject_gt_reset(void)
> -{
> -	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&gt_reset_failure, 1);
> -}
> -
>   struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
>   int xe_gt_init_early(struct xe_gt *gt);
>   int xe_gt_init(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index 5135e8e4093f..192e68e847a5 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -4,7 +4,6 @@
>    */
>   
>   #include <linux/bitmap.h>
> -#include <linux/fault-inject.h>
>   
>   #include "regs/xe_gsc_regs.h"
>   #include "regs/xe_hw_error_regs.h"
> @@ -12,6 +11,7 @@
>   
>   #include "xe_device.h"
>   #include "xe_drm_ras.h"
> +#include "xe_fault_inject.h"
>   #include "xe_hw_error.h"
>   #include "xe_mmio.h"
>   #include "xe_survivability_mode.h"
> @@ -25,8 +25,6 @@
>   						 (PVC_COR_ERR_MASK & REG_BIT(err_bit)) : \
>   						 (PVC_FAT_ERR_MASK & REG_BIT(err_bit)))
>   
> -extern struct fault_attr inject_csc_hw_error;
> -
>   static const char * const error_severity[] = DRM_XE_RAS_ERROR_SEVERITY_NAMES;
>   
>   static const char * const hec_uncorrected_fw_errors[] = {
> @@ -167,11 +165,6 @@ static_assert(ARRAY_SIZE(pvc_master_local_nonfatal_err_reg) == XE_RAS_REG_SIZE);
>   						 pvc_master_local_fatal_err_reg : \
>   						 pvc_master_local_nonfatal_err_reg)
>   
> -static bool fault_inject_csc_hw_error(void)
> -{
> -	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&inject_csc_hw_error, 1);
> -}
> -
>   static void csc_hw_error_work(struct work_struct *work)
>   {
>   	struct xe_tile *tile = container_of(work, typeof(*tile), csc_hw_error_work);
> @@ -507,7 +500,7 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
>   {
>   	enum hardware_error hw_err;
>   
> -	if (fault_inject_csc_hw_error())
> +	if (xe_fault_inject(XE_FAULT_CSC_HW_ERROR))
>   		schedule_work(&tile->csc_hw_error_work);
>   
>   	for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++) {
