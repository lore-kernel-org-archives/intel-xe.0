Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49712CF34B2
	for <intel-xe@archiver.kernel.org>; Thu,  3 Oct 2024 16:10:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E0D10E8A8;
	Thu,  3 Oct 2024 16:10:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ctgh0FVz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DAC910E8A2
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Oct 2024 16:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727971821; x=1759507821;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YJ9gIAS9O0dgYc2iwCPqmj3ftbUyZnQmv5EjHfvT18w=;
 b=ctgh0FVzexmsHaFgFkRHmA4H3f4T4QT8j3lZPCQnX2WdrGmuMVnfpbpn
 8XWMqc4KGUV+IdPsVJ2oHuuaWbFKnwHWS6Sabb+awCdnZIWmh14pkMilK
 4HWxcDv61Cvasika0K5MfqY+5+4tcHFWH/bLgzrZdo/YYs8gc84BrA7HJ
 xXIaFYs92WE7neqRxdjAbGziy0Xa2dwWvQMeliI/ipRgpnpiHyuxrACjd
 eM/5brTVVXKat9R+MsWmpwR/akr7/KaGNx8EVnboC+4LRkIzmHAycSVlR
 YguWIv0g7b8+iQa/OsPPjD4QjejUkQ5N+qrH1b7v4j2efwyTPZSyQHz0C A==;
X-CSE-ConnectionGUID: dHBCOMTgQTOw4++UOSj+4g==
X-CSE-MsgGUID: qAbRXM7LQO6lCAXvA28KfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27063035"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="27063035"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 09:10:12 -0700
X-CSE-ConnectionGUID: gG934UnTR2GLmId0mX6+3w==
X-CSE-MsgGUID: 5exofC/3SSC+jMlpABGm8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="78956401"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2024 09:10:11 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 09:10:11 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 09:10:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 3 Oct 2024 09:10:10 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 3 Oct 2024 09:10:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GmJ2ev8LeQIrxL7oTkKYgRnWD6bKFnyqrx1+sNqd0E1BZsZfrZhoAPxdA13i4vd90X5bJItzm/3Em95k9266wZpHG9wPaZohpksBngLp4Vh8cJ9/FAO2hHJD3JKljmQEgFyPQFuZn61NL35uHMhF8ff/wuguyLPke08GNSlBfG6jMd/37jhdKjKhpQ85F7d+Mg//CW8xxAb1dNNsNq/4Ek8tiTQVqZAT/fV+Uj32sKsk56v1ah215cVbF+7JBDOY+ICY92laRNEvnexs0dhAC3Iy5d+oJMtHOxa8sygpYXGZ7s7NEO68mnyElBhIe5Bo0NWrr5IGyZRvpjFEeucL/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CZnkiWKPOT2KYyhCuaXtmeCJ9yOdFppykQ0w9PlOY8M=;
 b=NVImM7QanO1xT/caYgBHi1i/GtP/3bUPRlDD1Cc3eiyN/BWQ8x0uUbx0asgna6qArjgsdcN2mV/xxm/gmjNtsJKxYZgYB2dfWvFRue0qiT+hZQ3g5A7FNGtMvx1HgFYrKQO/lE7beSajFapoudJ1YPR74UB+wf2BhxlbCtRP+70DgEElkttbY4hduX+O1fEkpYoHDDtFyTeYZELiXlEF892iBF/SbfSwFsnCDPfSDKOrjmxFbtxxOe2WcC0TnBFru6lLhrXuMPEdxhRRFTiOfSjcFB1dfOyKSSvqvy0edZWQm5PKcU4hfG1pFjD83BcH5OP5LANqOwW9+GQoXF84Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by MN0PR11MB6109.namprd11.prod.outlook.com (2603:10b6:208:3cf::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 16:10:07 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8026.014; Thu, 3 Oct 2024
 16:10:07 +0000
Message-ID: <fd421437-87da-4b9e-b6e4-523723898965@intel.com>
Date: Thu, 3 Oct 2024 21:40:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/25] drm/xe: Error handling in xe_force_wake_get()
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, "Nirmoy
 Das" <nirmoy.das@intel.com>
References: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
 <20240930053149.1246339-4-himal.prasad.ghimiray@intel.com>
 <232163cc-1978-45b7-a920-2890a014cb95@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <232163cc-1978-45b7-a920-2890a014cb95@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::14) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|MN0PR11MB6109:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f99037f-86be-4aa2-a1a4-08dce3c5d8fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z2p3MVdsZ3Qwd3FRaVJjeTNmc1hzbWowYXBtRGdKZ1VwQk5sYlVPNlVPYWhq?=
 =?utf-8?B?M3oyRHU1WHRMV0hWbmREMkUxL0hUUkp5RHE0UHlXL1VxUVo5L1BkMGcwWEdG?=
 =?utf-8?B?WXF6bytCRk9Kbkd3MWx4Y3I1N3pVRWo2cEFwQzUwSUVOVHJRdUFmYjVUOFRy?=
 =?utf-8?B?K2dETzRaWm1tZDNTWW9EUTJ0MjJaVmVDNEczS2RnTy9ISmEvRk1nakY1NU40?=
 =?utf-8?B?WmlNN1lqTEVxUEFrblVEa3hiTlViUTYxRlIzYnlyUjBTRW9Qa3VLR2ZydUhU?=
 =?utf-8?B?RzNzeWI5bG5HQkhJWW5Hak9xRXJGRjdwRU4zSEwxVmdxM0c1aml0d0lLdDNk?=
 =?utf-8?B?TThYSGVsT011dzduNUN1dk12MjlKcGo4aFhyM1lzTmR4WDRmSjgzcVNJT3BZ?=
 =?utf-8?B?VE5UaE1KVFVjNDJjZisrVmlvNDZRemVoQ0l5MFo1MitmTjh5dWdzNXV4cVF3?=
 =?utf-8?B?YkNCMmFJb3dsZ09pMFlQU1hScjRZL0hjME9IdjBMRW1KdFZoYy9qWm9QQzRP?=
 =?utf-8?B?T1V2a3Y0OTF6bTI1SkRmc2Zwa2dsZUdTTTRoa0RVcG02aThrYmhZcnlZNGVL?=
 =?utf-8?B?OGN6NXdQdE00bnVhZG95bXVXY2ZpNFg4bkpTelVpajJjQlhSR1BvNDQ4Y3hs?=
 =?utf-8?B?NnI1Y3lvRnovcDhsUWVQTW0zT1k5VkZmM0g0Ym5QSHQ4dDRKODFvR2phNU9r?=
 =?utf-8?B?cmtmOUxCNzNuK3RVcys3bGxQb01hNGdnV0FTY0JmdGxZVVEvZHF4QkJQTjVl?=
 =?utf-8?B?dWpWSFVjMGMxdWFRU2wzcWQrRUxxRFJVVkNvQi9QWkE2VThhNmh5L05PazhP?=
 =?utf-8?B?RjdtOG9oWTdGOHhtck10RDdkWXpWbEVlWXVjRERZN0Uyd2xXcitYMTR1VkVZ?=
 =?utf-8?B?dklYOXltZklvdkJETUFHQ3lCK3JkdHdNWHdLTTZlYVJjbittU1VtTURZWFN3?=
 =?utf-8?B?OGhKclBodUhXUy9CQUh6UWhjd0trcnAwWUY5UEtIQ0FzSExKZ1N1YTJocnpC?=
 =?utf-8?B?R2tGU2tLb2xhVnVGRnpNV1QvRmlDVXM2ZStGU0tXMGlmbkJuZjV1QmxhRkVD?=
 =?utf-8?B?UGlmeVBjZkd2MHF4dzdaajRac1NIRWVvU3cvNG55MUViNnh4aDQzTkNiVk5r?=
 =?utf-8?B?Rkc4R09obFZaSTdibThmSmVaYWVtV1R3eXVneHUxYzJHc3FwVy9YRDBTVk9q?=
 =?utf-8?B?Rll2MDY3aDNaNTE1WEJHYjNVbHJENWJJUlVjaGx0eDhrNUg2Z2ZWeVB2SkJW?=
 =?utf-8?B?NFRHWmUxZFl5T3VOWTl4MEVMMHJ2WDUwRk1mVjlPSFBUMU01djJqbG16eHJp?=
 =?utf-8?B?RXN0TmRDOVdOVHF4OU4rcmdiSzJURStNUTlYM1JLUjJkVEZEWXdSem1leU5m?=
 =?utf-8?B?NFU4d2FDWVhCRHdGOVY3YTBEbFVIeDFhWUpFWURkcDg2Y2Vqcm5lWEoyQ3h2?=
 =?utf-8?B?VlNGWWZrK1ZiZ1FpRjltZGtrSmZReHRiTFFlY0ZYZlh5eDBRK05vL1dDKy9B?=
 =?utf-8?B?MGx0WENCN2pzQWpJYnBZbmRIeHM2eVh1ZzREY2lwRFRUQmNHbGhKUTZVc0tz?=
 =?utf-8?B?L0U0OE5IcFpsaVFCbGJHUmZNanlHMTJuYWUzYlUvYVJmVld0TldqanBPdGVl?=
 =?utf-8?B?VU1YQUozbVROSHl4ay9oVVEvK1dmc1BWcERPUVc3a2RTWnZDYlUwTTB6blht?=
 =?utf-8?B?SUs4QUtkQVQxc0xQU1M3MGpGSFVYa2lyK2JrcnZjNTdHUnJZTkhYSU5BPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUFJYTZ4eGF0TExadzY1WTJ2U0x0T0EwcEVxYnY5MnpMMHdpNXp3cGd1NUtJ?=
 =?utf-8?B?WFJQR3p5cFlpdUc1d2JpZU1XMVgxTjhVQkIxZGw2MUpvT2pZMlY3a0NBMnhj?=
 =?utf-8?B?S3R2VDhFUmQyTVZlSmhUNm10dkoyUFBXU0gwMVdVRmEwbm5MTzdrcDJHLy9q?=
 =?utf-8?B?cys0UitNNU1WcGppa1pBZCtkcVN2YjR6WHA0QitESmxyd2l0UzRsVHNKWW12?=
 =?utf-8?B?b003bEh0VVdRUUU3dEhoMFUrZU94U21FRWR3a1E1UVhpZzczZ3U3N05ZcXVh?=
 =?utf-8?B?dzNPZEluZTNVTDI0bnJndUlFRHlnaCtXY0NzWlJkWUNQd2ZnZEhnN1RIRVZU?=
 =?utf-8?B?U2I1Ni9ybFMyNjhwRG9HcisrWFJHb0lSVXZZMmo2OU1RYVlBWjd1Vy9RKzN6?=
 =?utf-8?B?bW1DYlJtMUQyWUdEelRLRzlKaUpvRXRQaUtzZk12VXBxbUh3VXZJSzBPUlJV?=
 =?utf-8?B?MGlZU1hDcnUwSEplTkorRmUrK1U1Rnd0Y25pYytlY1lJU004Z3hlQnBtUEVh?=
 =?utf-8?B?cVhSRVZsQUlYVjh4bkN4cDBjb2RwSGpPZExVV1lYanBYYjlRbDFpQ3pyUEVv?=
 =?utf-8?B?ZVVWLzRTK285eG1zZ0dHQTRGc0JoSnJGelJGeU9ud0dKbmY4Qk9oNERFMkM2?=
 =?utf-8?B?QS9hTk1HTUdENHdlTVU1WFNSKzhxcmxTZEZrOHhFMlBRdE5taDF2NzFzMGow?=
 =?utf-8?B?WW1EdHlDTTdGNzYyMmpDN2M4Y3UxanpnYTlXZFJaY3Q5MVJVZVU0SW9jeUJh?=
 =?utf-8?B?V0lpcXV5RmFGRUF1bk54bU1sZVRtV0pjRmE4bVNzLytXQkU4bUZ4aTBRTXY3?=
 =?utf-8?B?aWdyMk80anJTdUZqUW80TVRSdFNGazNaNno0YVR4czJCbXFWb3hjeGFoeTdL?=
 =?utf-8?B?RjcvSVdrbnJNMFUxdVAwbkZ1bjJoRi92Wlp5TUY3Z05tVjRSVWRITlVpL3Qr?=
 =?utf-8?B?SG02VXk0Q1BmT2U2NHJ5YnJVMGRrY1dCT0pqZFBRNU9sc3ZOM2ZiS3FvTlJ1?=
 =?utf-8?B?akpOc1VEb2M3ZEdieWZVT1NremdiVGdQRWo2NnlJMFZURWczbkpmNk0ySXVX?=
 =?utf-8?B?R2sxWWYyL1Y3Q1c0L1BheEY3UDJjbVI3TTBKdWJPYzBDZmhYL1dCYzhmTkhn?=
 =?utf-8?B?SHBiSWxnUk5xYW5QWm1Za1JZVnBFaGdNQnJQRXdBUnpzNUVxREdVS0U0Z0Jk?=
 =?utf-8?B?T3NsS0JlMEEvNzJuNVk0R0wzSDNpV0hPK0tFSm92SUY3ditaOWwvNjhBQ1Q2?=
 =?utf-8?B?SVljRGV5YU9hWHNYUlUxUWUrbzIzUmw1b3dOdUx0cGFoWnhVWDJoWXdjRC81?=
 =?utf-8?B?ODFIcnBHSnFvVE9vVGFWelBtcVpMdnMrZjhlb2hwR2g4RVRzSHc3VFpET1p5?=
 =?utf-8?B?dnltS0FXcUNBcm40aEh3dnBqRUNRSjBWS3Z2RWc5Q1J0V3YrVWhiUUNwa1Az?=
 =?utf-8?B?QWxYd2tvb01mSU9BbmNHSmp3ZlplWERIcCtNbjZRaTlvek1hUk5PNE1GNlk2?=
 =?utf-8?B?VS8yWlFVd3pMaDBHa3hSVThJUmNzakZPeERBK2hSaXo3U2FVdEl6YTd1bmtE?=
 =?utf-8?B?TWlNRTgxbDczUnc5MFUvR3FCZC90VWpoclFHN2x3M0p6MzdRbDVqZjExNE5R?=
 =?utf-8?B?N3pvVElkMTgzQ2lsUUJ3bXZWOE12T0lSUEVTR3NCbmU5YU1uRHdKUk15Yytw?=
 =?utf-8?B?VGpaaHZtV01sUzE3dmY5VWNtVGNQRVNxb0FEYUlLVDhBVlFxZllmRTMzNFNX?=
 =?utf-8?B?TlFBOFZURWgwMjJYRCs3Q0RZMGJnZitpVitBNE9NRUVVaGo1SUFjdHRiRmU3?=
 =?utf-8?B?MHFpMXpQSGlrQ2FJbFdMdHVSV25ad1FsUUtaK3N2WnhwblNyMFpSUllKT2Nl?=
 =?utf-8?B?bGNHZCtZOWdKVjVtOWVmbmo1ZlZkZVFIL2Z3SUNPVDQvbUNFT0RpUE8zYm4y?=
 =?utf-8?B?c3ZoSEFBb0Y2dE1seXV0TW9KUWkzSmJUeEFEbEhScVlzRzUwWldESWlxeUlH?=
 =?utf-8?B?TXVzUGEzWnE3WElIVzlnL3dVZ2dSb0dLRXZGWTVFcE1wK1pSVVFUdTJqMWxD?=
 =?utf-8?B?SGxqQ0dGSVBYS2VsenVMVFRQbHloVkRLd1JmS3RySjkrVE1OMlMwZUhmSWdB?=
 =?utf-8?B?b1cyOWZyQzZNZSs5NkJKNi9Iek1lOWVRRzlWOHdPeUdEejBIb2Q5V1k2YWdt?=
 =?utf-8?Q?4WCByT3/r+XU3jkv+PcGaV4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f99037f-86be-4aa2-a1a4-08dce3c5d8fd
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 16:10:07.1205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QcDoRXtsTAh6Gz85Lm7A8Vd/YL2EEX2TKbk7mRaT8Tpg28fPdhDL58s6h/MlKn9vUmtTOSI90nDKimkRM0UIoqfqI8Ly4ibzo71mHnP9qQE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6109
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



On 03-10-2024 17:53, Nilawar, Badal wrote:
> 
> 
> On 30-09-2024 11:01, Himal Prasad Ghimiray wrote:
>> If an acknowledgment timeout occurs for a forcewake domain awake
>> request, do not increment the reference count for the domain. This
>> ensures that subsequent _get calls do not incorrectly assume the domain
>> is awake. The return value is a mask of domains that got refcounted,
>> and these domains need to be provided for subsequent xe_force_wake_put
>> call.
>>
>> While at it, add simple kernel-doc for xe_force_wake_get()
>>
>> v3
>> - Use explicit type for mask (Michal/Badal)
>> - Improve kernel-doc (Michal)
>> - Use unsigned int instead of abusing enum (Michal)
>>
>> v5
>> - Use unsigned int for return (MattB/Badal/Rodrigo)
>> - use xe_gt_WARN for domain awake ack failure (Badal/Rodrigo)
>>
>> v6
>> - Change XE_FORCEWAKE_ALL to single bit, this helps accommodate
>> actually refcounted domains in return. (Michal)
>> - Modify commit message and warn message (Badal)
>> - Remove unnecessary information in kernel-doc (Michal)
>>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_force_wake.c       | 45 ++++++++++++++++++------
>>   drivers/gpu/drm/xe/xe_force_wake.h       |  4 +--
>>   drivers/gpu/drm/xe/xe_force_wake_types.h |  2 +-
>>   3 files changed, 38 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/ 
>> xe_force_wake.c
>> index 5ce9e912818a..7f358e42c5d4 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>> @@ -160,29 +160,54 @@ static int domain_sleep_wait(struct xe_gt *gt,
>>                        (ffs(tmp__) - 1))) && \
>>                        domain__->reg_ctl.addr)
>> -int xe_force_wake_get(struct xe_force_wake *fw,
>> -              enum xe_force_wake_domains domains)
>> +/**
>> + * xe_force_wake_get() : Increase the domain refcount
>> + * @fw: struct xe_force_wake
>> + * @domains: forcewake domains to get refcount on
>> + *
>> + * This function takes references for the input @domains and wakes 
>> them if
>> + * they are asleep.If requested domain is ALL then only
>> + * applicable/initialized domains will be considered for refcount and 
>> it is
>> + * a caller responsibilty to check returned ref if it includes any 
>> specific
>> + * domain by using xe_force_wake_ref_has_domain() function. caller 
>> must call
>> + * xe_force_wake_put() function to decrease incremented refcounts.
>> + *
>> + * Return: opaque reference to woken domains or zero if none of 
>> requested
>> + * domains were awake.
>> + */
>> +unsigned int xe_force_wake_get(struct xe_force_wake *fw,
>> +                   enum xe_force_wake_domains domains)
>>   {
>>       struct xe_gt *gt = fw->gt;
>>       struct xe_force_wake_domain *domain;
>> -    enum xe_force_wake_domains tmp, woken = 0;
>> +    unsigned int ref_incr = 0, awake_rqst = 0, awake_failed = 0;
>> +    unsigned int tmp, ref_rqst;
>>       unsigned long flags;
>> -    int ret = 0;
> 
> As we have fw->initialized_domains lets add check if valid domain is 
> being passed and assert otherwise.

Sounds good check to have. Will add it.


> 
> Regards,
> Badal
> 
>> +    ref_rqst = (domains == XE_FORCEWAKE_ALL) ? fw- 
>> >initialized_domains : domains;
>>       spin_lock_irqsave(&fw->lock, flags);
>> -    for_each_fw_domain_masked(domain, domains, fw, tmp) {
>> +    for_each_fw_domain_masked(domain, ref_rqst, fw, tmp) {
>>           if (!domain->ref++) {
>> -            woken |= BIT(domain->id);
>> +            awake_rqst |= BIT(domain->id);
>>               domain_wake(gt, domain);
>>           }
>> +        ref_incr |= BIT(domain->id);
>>       }
>> -    for_each_fw_domain_masked(domain, woken, fw, tmp) {
>> -        ret |= domain_wake_wait(gt, domain);
>> +    for_each_fw_domain_masked(domain, awake_rqst, fw, tmp) {
>> +        if (domain_wake_wait(gt, domain) == 0) {
>> +            fw->awake_domains |= BIT(domain->id);
>> +        } else {
>> +            awake_failed |= BIT(domain->id);
>> +            --domain->ref;
>> +        }
>>       }
>> -    fw->awake_domains |= woken;
>> +    ref_incr &= ~awake_failed;
>>       spin_unlock_irqrestore(&fw->lock, flags);
>> -    return ret;
>> +    xe_gt_WARN(gt, awake_failed, "Forcewake domain%s %#x failed to 
>> acknowledge awake request\n",
>> +           str_plural(hweight_long(awake_failed)), awake_failed);
>> +
>> +    return (ref_incr == fw->initialized_domains) ? ref_incr | 
>> XE_FORCEWAKE_ALL : ref_incr;
>>   }
>>   int xe_force_wake_put(struct xe_force_wake *fw,
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/ 
>> xe_force_wake.h
>> index de720881a300..eb638128952d 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.h
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
>> @@ -15,8 +15,8 @@ void xe_force_wake_init_gt(struct xe_gt *gt,
>>                  struct xe_force_wake *fw);
>>   void xe_force_wake_init_engines(struct xe_gt *gt,
>>                   struct xe_force_wake *fw);
>> -int xe_force_wake_get(struct xe_force_wake *fw,
>> -              enum xe_force_wake_domains domains);
>> +unsigned int xe_force_wake_get(struct xe_force_wake *fw,
>> +                   enum xe_force_wake_domains domains);
>>   int xe_force_wake_put(struct xe_force_wake *fw,
>>                 enum xe_force_wake_domains domains);
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/ 
>> drm/xe/xe_force_wake_types.h
>> index fde17dc3d01e..899fbbcb3ea9 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake_types.h
>> +++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
>> @@ -48,7 +48,7 @@ enum xe_force_wake_domains {
>>       XE_FW_MEDIA_VEBOX2    = BIT(XE_FW_DOMAIN_ID_MEDIA_VEBOX2),
>>       XE_FW_MEDIA_VEBOX3    = BIT(XE_FW_DOMAIN_ID_MEDIA_VEBOX3),
>>       XE_FW_GSC        = BIT(XE_FW_DOMAIN_ID_GSC),
>> -    XE_FORCEWAKE_ALL    = BIT(XE_FW_DOMAIN_ID_COUNT) - 1
>> +    XE_FORCEWAKE_ALL    = BIT(XE_FW_DOMAIN_ID_COUNT)
>>   };
>>   /**
> 

