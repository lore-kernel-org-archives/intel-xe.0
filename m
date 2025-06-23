Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E5EC7115B
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 06:21:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B4710E186;
	Mon, 23 Jun 2025 06:21:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bm8Y7Jfj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 280D110E186
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 06:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750659660; x=1782195660;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rgH8IwkUT4XAqb/unWxXOz8GiwmpPRgnOuP+BO6ClHA=;
 b=Bm8Y7JfjdTLQrOuXSbqTc7ao2tNJZF0NoBcNv80qy+VOyo4/C3ki/JuH
 2u0J6FiYwgsgFc2cmO8Klr3WnFXCusoLnX+9lxiuzy+rUxIJ1m3xHZKWi
 dJE2JySQNpkUyFlTnr5sW6Z0QyT3ZZs+VYnBeKXZY7cVGrA7hiXGF/joc
 yKN2vBBpoj80CsAKhjPhCdcl2Ehw6VSE4CFpsf9toAeji6xKraIcYKBxO
 JiaRwhGKjFcjs/PJ5oFG6Pt1LMn5bBFyy7laf+NPm1s2sYaR1nPxOXM4p
 bo85B6JmuI9y+L/xVkxD+ZJFzuVoH6g/iIBIBAdgCPLgeDUcRJdvudgFk Q==;
X-CSE-ConnectionGUID: Dcd7hjQ9TBunLOeEhR7s6g==
X-CSE-MsgGUID: bPnYwPlUTe2oMlnona+gPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="63908326"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="63908326"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2025 23:20:59 -0700
X-CSE-ConnectionGUID: i9YzRxYtTVG4yamuNRa8NQ==
X-CSE-MsgGUID: u7RhxnakTCWaxvK+GNmiTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="152176462"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2025 23:20:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 22 Jun 2025 23:20:44 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 22 Jun 2025 23:20:44 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.83)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 22 Jun 2025 23:20:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JNflgffwV0H5yMmzr+XXz7taFFZVyftndhrX/vDcIhbAbtwnSzJkMWHx/Hkv8qJ+dTYsY2n8VESaIu5+OpDde1QM1gM5UokrfATV7fyJiWT5LJGln2Jx4+1R1o1AKIS4YVwYuEia1lx1fB5aXJ9BibjhWl+EEgn31FxMaW/26hhMtuqquqnXvdKHkAn274TEfyOoWJ0SEs0nAndiJQODktWtgh3OpVPrKZnqZ5FdG+uMwq8WpcNtTrvcXzqvFbtXAodv5mbi22GMJQhotjNU3oAN1CDboIkimImarW1LzPRYjTkx3AngQB/l0p8Bm43d1IL6VNntxLyGU+1kCAcfuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l4yRomdCzOxWNN0lEcPaNgbOxShItvE05BfVadJnbAQ=;
 b=jspO99GJfDrwgHR0Hqn1yawpBEGnlK/gY6Cb6SGhtH2rn78ZyuoUmXfwZ0drDA6yIriL+phi6G7zDN1gUm4IS6xxRPCjIjXd4axyYQIamheDE7ddJYwPMrTVGDvVYd4OUEbnRRnEFUmv4Y6mqmPdYqkg8RdwZ9ctt3C+dAYx34ezMi1tVQqlV7uyyFCUqVQIroe34MsNUd3k/8K/wMLnEyJXpn5zJNat8fE/YNUwx715aIQtlD2XDTVs+IoP8EApqk8aIml6hhX/QjK/fpz7Qzj1XWbgiFtg3kojgBJMFbCQke0q4QBxSDrk7bS+YKNmSkJ8KPWy4PhBDdO8fFizGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by MN2PR11MB4520.namprd11.prod.outlook.com
 (2603:10b6:208:265::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 06:20:28 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed%6]) with mapi id 15.20.8835.018; Mon, 23 Jun 2025
 06:20:28 +0000
Message-ID: <53291701-bd80-4813-bc4f-11b8e2ecd8d5@intel.com>
Date: Mon, 23 Jun 2025 11:50:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/20] drm/xe/uapi: Add madvise interface
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
 <20250613125558.2607665-3-himal.prasad.ghimiray@intel.com>
 <aFjYdUYGIazU3XZZ@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aFjYdUYGIazU3XZZ@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0122.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::16) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|MN2PR11MB4520:EE_
X-MS-Office365-Filtering-Correlation-Id: e8c9fa2d-8765-4a14-0335-08ddb21e0c38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXpZQU8yUG9UNytUVVBEZmc0a25KMTBKTmcwdGtxU0xzcmdXSXhjdStSdTlO?=
 =?utf-8?B?SjdCWDAvQ0pOWmU2RW42TWl3VGl5WVg1VTZOaEFlLzVBMi9EWG5TNGpsb0pQ?=
 =?utf-8?B?bndyZzNNUnVaOEltenVnaXZKTEZUcDh0eGVXSVdVeU95ZmpHWnRUaVdXNTJm?=
 =?utf-8?B?cUJReHIwdWsrbE9MTm8zdEdUZ0Q2Z1M3MGl6bEcvQ2Q2NzFwYkliQ2gwRUt0?=
 =?utf-8?B?ZE5ybnp6YmhaZ29uNlNZNGhtSE93aDBsaTZ5Q096aXdHQ2M3TUU2ME5OVktK?=
 =?utf-8?B?YTBzMzlHRkxIRnhDTlJqeEt3WUdrQWZVUVUvbGE4MHBUYUw0OUJZRlJ1VXB3?=
 =?utf-8?B?TzlpYjQrTXRJRUp4RDVKSWw4ZTRMN1U4NW8vMjBadGdaUkM4d2RQRW1jKzMy?=
 =?utf-8?B?bENua2YrM3RTSGg4MVd4YzNLaEJuZlVIbzRFSnNEZy8vUTB3UEN5MW5UNGJt?=
 =?utf-8?B?SVNZOHBhcS9iY2hpTUJ2SlZRenlsczM4TkdtNjJ1bDU1d3B2T0wwR1htRWlj?=
 =?utf-8?B?Ujl2UUpFZmVuODFMalhoMC9yRHhUVFhGVHJ6NlpjK09JTVRSc0xlUlQ3b2E1?=
 =?utf-8?B?QktwcHNFc2ZEVGpnN25wNk1uSHEzVUV2cjZRNEM1ME9PMm9OYzhuVXgwdnht?=
 =?utf-8?B?OFRqMVhuRlB1TU9yR2REL2lzVWRrTS9GaU51YVBac3ljd0NmN2JaRnB2WG5t?=
 =?utf-8?B?dlpNMHpCc1IrUEpFN0ZZWmJOVEx6dXNUTkx4aEFzYUx5WE1sU0lxbnZldWFZ?=
 =?utf-8?B?TFFUZ2pDTWYyUGZTREpRdmdQODhwek5oOENKT09LTERHYUxoZTdITGEwUFE3?=
 =?utf-8?B?blFjTEJhY2huSllyU3NmaktmTzhYMitnalNlR09KNXhRSjRBSUpHeUx2S0FL?=
 =?utf-8?B?eDlycFhwb29PQVRiemVvYndBZlUyYUp1WktMUzhFNStvOVRrMDkySlAzN01n?=
 =?utf-8?B?dmc3NlJhbEIrUnFYalZUemptWlZ2MURYTE56bUlQb0pYelFtNWtCNWNLYlZy?=
 =?utf-8?B?SVllY2dhUDNhNEd0VWJaTHdXWG1PSS9LRDJUV25NdmVoN1dCSWsyRGoyQmFC?=
 =?utf-8?B?Y01VSG0yZ0I2YWRFRWEwZGxUYTdLYnRIcUJicjlmNGhZcWlFcUorT1lpcDAy?=
 =?utf-8?B?QTE5c3dmdDZqd1BNYWFGakdqUXZpb3REeEZsalV3K1h5MEIvTjJ6eks1V00v?=
 =?utf-8?B?bmJIbUU3dk5UZktxbFBsb0JVQmVydThkR2c0VllXSytiYmRoSHhBVE9nRU9R?=
 =?utf-8?B?QlVmQVNmTytjdGdRVUo4U09rVVZ1b3BEVXhOM3RPeHlaN1NLNjI1S3hwOTc4?=
 =?utf-8?B?bzBmWjNLUFo3WmloNzh5Z3V0QWdtLzduUElacTJYQTVaTUYyUVVFRTlnL29o?=
 =?utf-8?B?Y3gxUnRnclRwbUlFNUJybGovRVVWcXVuMzIvOG9WRloxL3Y5WW5HVFVYT3NC?=
 =?utf-8?B?YTgzVEJ6TWlZenBuRkd4eEphcTgyS3BQM2Q5bWRqcThwUGxyVzV2SGhKdDRJ?=
 =?utf-8?B?NllSTFM1YUxtdHlGTUFhd2V5UVY0dWdPNk9xaVdNWW1hcG5TM0U5aitQNzBq?=
 =?utf-8?B?UnZHK2FFbzJkV3pMNkxZWFdFRm9TM05XNnZNZTdRVDZLNHJWUCtJTTVrd1VM?=
 =?utf-8?B?NTAxN2hsWXdDaVFXTEZaRTVCSllGS2RsVkkvSDE5azVhS2k1bUhoRDFKS3Nw?=
 =?utf-8?B?NFQ0UFl0SkU2ZkRWcGlpMkM3aS84WUNGY2QyT0ZSUlpxQk5zVUVMNHJqeW9T?=
 =?utf-8?B?d0ZLSHNNZGxOcXUxODRqUUh6dDFiS2tkcFhSMWhudWptR1NkZzhyeFU3Njk4?=
 =?utf-8?B?YjBValZuVG0vM3FPdVlJdWtkdlRZZ1loN0hkYVlDNytiZU5kbno2b2ZNMllv?=
 =?utf-8?B?akVucU02MW1qZVJBa1ozMStPKzhLMy9XaXhzQnJ6SnJOa2c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2tJWVZ0QmtETHdPZi8vYmt3enU4aEZ3aUxCRVZmTmtveXhHeG40TmMzTmpR?=
 =?utf-8?B?ZzNzcjVNeUwreHFrOEloZ0VGM1RkdXN4bVlPMGMycDFMckZIaXBkL3lnSFEx?=
 =?utf-8?B?dHg1V21PZlhLT283S25MdHRHTHlseXZxT2Uwa091cFJWeXpSSjFJRnU0T2Qr?=
 =?utf-8?B?V01OblFkWHluUDN4eUlqbm5BZDVvcjdPZGExVTB3SEhNcTdTS29UYVFKVVJR?=
 =?utf-8?B?cVdYOVc4MzBldnZWamxhaHNVWjAvOGxjY0dUUmx4UWFJdWk2WTJjclpTRElF?=
 =?utf-8?B?ZzJPRlRkTlNqWldOVHZJZ05wN1IrUkxFeWZLYVBNbEFlYWtaRkdMUUZzQ1ZX?=
 =?utf-8?B?cnIyZEc4MFBSWmVwVE9FRHJkUzhwd1ErOXBITHpIVVJLNVZ6VGZhNGlvMjdT?=
 =?utf-8?B?ZUVSRm1hTWtrM1lpNGk1V1JQZWs3N0Y0dHE4NS9iNnBBTGUreHJaN0xzNGNX?=
 =?utf-8?B?eUpsNkQyM2J3K29uZEVnN1VkY1E1bkZlMUpFTHhHZDBxS0RHbWM4MUtRK0ZN?=
 =?utf-8?B?aEU5RncwUzZORWtuQ2xsdnA5U1lXMjNDbVpZdzh3ZGtycS9NQTkreFBuU1hI?=
 =?utf-8?B?Lzc1RWQ0dC9heWU3WGdkU3ZIK1BRTHlyU3BvdFZvV050TmVZb3B4TStaSDRs?=
 =?utf-8?B?cXhRTjBoaGxnTTBqR2VZVGZBNGlGNCs0VGZCRnBwN3RhT2lVYjl6TE9TS0t1?=
 =?utf-8?B?RVVCUkVnTGVwaDhrZDdhYWlsZ1pHVEwzL0NlRE0vTDlremdreUIvdmRPOHFN?=
 =?utf-8?B?aWV5ZlN0Uk9sMStaM1lpS1VVMCtCSi93OStCY0pjUG1sVGFvdHk0U0ZPbnNH?=
 =?utf-8?B?S0RBR0FraGw2NTExcXY3dDhDSm55ZkJ5ZE5yL3ZmTCtEV2lLZUJ0QXN1RVJr?=
 =?utf-8?B?UEFHTWtjODhUV2F4dlY3cmIydkUwa1V0VVNGYTZzekt5aHZkeUFzWU5zUTlE?=
 =?utf-8?B?MFAzSGx2YytydDdDWHdSRTZpdTlvT1BjQThMVTFNTU9LUmdUaGNnZWV2L01P?=
 =?utf-8?B?My9GM1E1eU40alVjbENIcmdXYUpNQnRJUnNmZ3pXNjIvcHp0R255djBMbWg5?=
 =?utf-8?B?MG4yek5uQUxQLzdicTZoYStNTE13dHRudlRTdzZqbThHbFl1WHlsdFF2VW1k?=
 =?utf-8?B?bGRLWHVrdFU0eU9LSTNCU3NiOWt3RFNLRHBSR0xWM0c1MTQ4TmVwV1h5U3dp?=
 =?utf-8?B?djRFTWI4ckNGVitTVTBGL2UvUG1RdmFZNEpKVkd4bDhrdTgrOHZUQWl5ZldX?=
 =?utf-8?B?eFFPWGg4MlRMeEdFTkhNbmw4VWxMY2tneXlhd3p5USt3cUNVZ3JNaTZsam9l?=
 =?utf-8?B?bUZGMHJXdFY5MEszQW9Pajg4elhEYlpUV0xlYzZEL3o3U2pXSTR3L29mOGpS?=
 =?utf-8?B?WEZma2ZZM1RZQS9wSjczMnpqOHB3cjFQeW56UHR0R3ZmV0U1MU9SWHhyR0lY?=
 =?utf-8?B?NmE2SEdnc1E4TFB6QXJNTXRLdWJXSlhjdVdLSDNZUzhmN0hlWWludUxvaDNx?=
 =?utf-8?B?RGhVUTBGam5CYlhuMG4xWWlVNGphTFByOTdQTUJoMktac3IwcUQrSDNqS2Jw?=
 =?utf-8?B?SzhsL05QZm5xVzR1N2s1WVQwVmtqMmVqTytIdGRaUkUwQ1k4Y3RNL2tlNXlr?=
 =?utf-8?B?ZGVPRjhiRTFkRGhGK2VRRjcyRFJVTHJVZDRrZHNqdXMxeGpUYTl2SkRFd1pk?=
 =?utf-8?B?MXBkQVNteXBJK0xGK0pWazZqK0FzSTluakE0Z285amFKdFBDVXRmdE0xN2Jn?=
 =?utf-8?B?Q3JxTmFabTBiNjZRZ255OXdqVGQyN1paQXE4MXVIbnZvK3M5aCt6aExrK1lk?=
 =?utf-8?B?cStrMTVGeGg1bmsxcXI1dmE2S3p4YVR4TGlWYWdvNThCL2lVdnJrMnV2QXg0?=
 =?utf-8?B?djBYQnBaT25BS29jS1JwVDArV3FvL2ZPaTlJNVU0Q0pLQTloWEVZSXozUm5X?=
 =?utf-8?B?K1NoVWlrNEY4d1VFVGhNdHV5YTRhenBjajVFbGl2czZDTFJXeFo1cU5haitt?=
 =?utf-8?B?YThmT0ovQWpnL1Jka0Q3d240TFNsaUJqdjk2L3JvOWN4NC9rcWN4VDhVdzN4?=
 =?utf-8?B?U2ZBK0FCYVllclYwRlRqbmlBakxXV3ZXb3dZQnBQQ3VsTFFibVpmMlRMTmIv?=
 =?utf-8?B?RHN0ZW1kUFFVR0s4NWhhVkVud29meGZ3eEZZZmxJWHpjaVAwbmdxNjZ0TExx?=
 =?utf-8?Q?Uo5iol2ZAW0+vVV98aa3fRw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8c9fa2d-8765-4a14-0335-08ddb21e0c38
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 06:20:28.4068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JoyLZehsY0KOQ9s+Iy7pLAZtT2lmN+fB9dIJbv2Q4tUTATKp4EaNqiwrhiM0xYSgaZo1zqZuPWTHmDGkmwuNxDQ3sNiHzZLDt8fK+oNuHoc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4520
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



On 23-06-2025 10:00, Matthew Brost wrote:
> On Fri, Jun 13, 2025 at 06:25:40PM +0530, Himal Prasad Ghimiray wrote:
>> This commit introduces a new madvise interface to support
>> driver-specific ioctl operations. The madvise interface allows for more
>> efficient memory management by providing hints to the driver about the
>> expected memory usage and pte update policy for gpuvma.
>>
>> v2 (Matthew/Thomas)
>> - Drop num_ops support
>> - Drop purgeable support
>> - Add kernel-docs
>> - IOWR/IOW
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Acked-by: José Roberto de Souza <jose.souza@intel.com>
>> ---
>>   include/uapi/drm/xe_drm.h | 118 ++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 118 insertions(+)
>>
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 6a702ba7817c..b5f8d11faaa8 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -81,6 +81,7 @@ extern "C" {
>>    *  - &DRM_IOCTL_XE_EXEC
>>    *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
>>    *  - &DRM_IOCTL_XE_OBSERVATION
>> + *  - &DRM_IOCTL_XE_MADVISE
>>    */
>>   
>>   /*
>> @@ -102,6 +103,7 @@ extern "C" {
>>   #define DRM_XE_EXEC			0x09
>>   #define DRM_XE_WAIT_USER_FENCE		0x0a
>>   #define DRM_XE_OBSERVATION		0x0b
>> +#define DRM_XE_MADVISE			0x0c
>>   
>>   /* Must be kept compact -- no holes */
>>   
>> @@ -117,6 +119,7 @@ extern "C" {
>>   #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
>>   #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>>   #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
>> +#define DRM_IOCTL_XE_MADVISE			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)
>>   
>>   /**
>>    * DOC: Xe IOCTL Extensions
>> @@ -1970,6 +1973,121 @@ struct drm_xe_query_eu_stall {
>>   	__u64 sampling_rates[];
>>   };
>>   
>> +/**
>> + * struct drm_xe_madvise - Input of &DRM_IOCTL_XE_MADVISE
>> + *
>> + * This structure is used to set memory attributes for a virtual address range
>> + * in a VM. The type of attribute is specified by @type, and the corresponding
>> + * union member is used to provide additional parameters for @type.
>> + *
>> + * Supported attribute types:
>> + * - DRM_XE_VMA_ATTR_PREFERRED_LOC: Set preferred memory location.
>> + * - DRM_XE_VMA_ATTR_ATOMIC: Set atomic access policy.
>> + * - DRM_XE_VMA_ATTR_PAT: Set page attribute table index.
>> + *
>> + * Example:
>> + *
>> + * .. code-block:: C
>> + *
>> + * struct drm_xe_madvise madvise = {
>> + *          .vm_id = vm_id,
>> + *          .start = 0x100000,
>> + *          .range = 0x2000,
>> + *          .type = DRM_XE_VMA_ATTR_ATOMIC,
>> + *          .atomic_val = DRM_XE_VMA_ATOMIC_DEVICE,
>> + *         };
>> + *
>> + * ioctl(fd, DRM_IOCTL_XE_MADVISE, &madvise);
>> + *
>> + */
>> +struct drm_xe_madvise {
>> +	/** @extensions: Pointer to the first extension struct, if any */
>> +	__u64 extensions;
>> +
>> +	/** @start: start of the virtual address range */
>> +	__u64 start;
>> +
>> +	/** @size: size of the virtual address range */
>> +	__u64 range;
>> +
>> +	/** @vm_id: vm_id of the virtual range */
>> +	__u32 vm_id;
>> +
>> +#define DRM_XE_VMA_ATTR_PREFERRED_LOC	0
>> +#define DRM_XE_VMA_ATTR_ATOMIC		1
>> +#define DRM_XE_VMA_ATTR_PAT		2
>> +	/** @type: type of attribute */
>> +	__u32 type;
>> +
>> +	union {
> 
> Nit: I'd make this union is same order as the defines (e.g., preferred location
> first, atomic second, pat third).

sure

> 
>> +		/**
>> +		 * @atomic: Atomic access policy
>> +		 *
>> +		 * Used when @type == DRM_XE_VMA_ATTR_ATOMIC.
>> +		 *
>> +		 * Supported values for @atomic.val:
>> +		 * - DRM_XE_VMA_ATOMIC_UNDEFINED: Undefined or default behaviour
>> +		 *   Support both GPU and CPU atomic operations for system allocator
>> +		 *   Support GPU atomic operations for normal(bo) allocator
>> +		 * - DRM_XE_VMA_ATOMIC_DEVICE: Support GPU atomic operations
>> +		 * - DRM_XE_VMA_ATOMIC_GLOBAL: Support both GPU and CPU atomic operations
>> +		 * - DRM_XE_VMA_ATOMIC_CPU: Support CPU atomic
>> +		 */
>> +		struct {
>> +#define DRM_XE_VMA_ATOMIC_UNDEFINED	0
>> +#define DRM_XE_VMA_ATOMIC_DEVICE	1
>> +#define DRM_XE_VMA_ATOMIC_GLOBAL	2
>> +#define DRM_XE_VMA_ATOMIC_CPU		3
>> +			/** @atomic.val: value of atomic operation */
>> +			__u32 val;
>> +
>> +			/** @atomic.reserved: Reserved */
>> +			__u32 reserved;
>> +		} atomic;
>> +
>> +		/**
>> +		 * @pat_index: Page attribute table index
>> +		 *
>> +		 * Used when @type == DRM_XE_VMA_ATTR_PAT.
>> +		 */
>> +		struct {
>> +			/** @pat_index.val: PAT index value */
>> +			__u32 val;
>> +
>> +			/** @pat_index.reserved: Reserved */
>> +			__u32 reserved;
>> +		} pat_index;
>> +
>> +		/**
>> +		 * @preferred_mem_loc: preferred memory location
>> +		 *
>> +		 * Used when @type == DRM_XE_VMA_ATTR_PREFERRED_LOC
>> +		 *
>> +		 * Supported values for @preferred_mem_loc.devmem_fd:
>> +		 * - DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE: set vram of faulting tile as preferred loc
>> +		 * - DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM: set smem as preferred loc
>> +		 *
>> +		 * Supported values for @preferred_mem_loc.migration_policy:
>> +		 * - DRM_XE_MIGRATE_ALL_PAGES
>> +		 * - DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES
>> +		 */
>> +		struct {
>> +#define DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE	0
>> +#define DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM	-1
>> +			/** @preferred_mem_loc.devmem_fd: fd for preferred loc */
>> +			__u32 devmem_fd;
>> +
>> +#define DRM_XE_MIGRATE_ALL_PAGES		0
>> +#define DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES	1
> 
> I'd double check with Thomas / maintainers if they want this (migration_policy)
> to be included in this version as still more or less unused in this series.

Sure

> 
>> +			/** @preferred_mem_loc.migration_policy: Page migration policy */
>> +			__u32 migration_policy;
> 
> Could we future proof a little, maybe migration_policy is a __u16 (or __u8?) and
> stick a reserved __u16 in here?

OK

> 
> Matt
> 
>> +		} preferred_mem_loc;
>> +	};
>> +
>> +	/** @reserved: Reserved */
>> +	__u64 reserved[2];
>> +};
>> +
>>   #if defined(__cplusplus)
>>   }
>>   #endif
>> -- 
>> 2.34.1
>>


