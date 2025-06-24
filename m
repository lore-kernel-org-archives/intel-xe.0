Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19AF5C7115B
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 00:15:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC1B510E484;
	Tue, 24 Jun 2025 00:15:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h5YzRXhy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A37710E484
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 00:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750724131; x=1782260131;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=448VgXa3l/WeuflY8xK/K7HY1/1dm/kMdqM7by8G1rg=;
 b=h5YzRXhyvncxcWgoAo+bCyQ1UxvO7G1W1bnfrOT2Z0/AL17jVfbUd7oz
 N/n4PeI8WVzEm+9P6eCNakv23T2m+cu4MFQL/mLY+JTQyX/xE9NzBOVgu
 QrKMHqNbeSjxXX1bk/lXaQbOUacNjodkHK7xyCAoRCGDreCPmPKL43XTH
 o6waRLY/5iXKytwEjyawFcLP4gTmHuZO5JZp8eVJ8hHlHMyBcjT9rdM00
 9884ZD2HZEgdietbXai49FecjR5+//uv9SBuve278VpeEg71lk0L/mGMT
 K6Y50OBv+VgaCPy5DVItZWoIcan2r+eeopGL960MkOvQ1ntut22qIETew Q==;
X-CSE-ConnectionGUID: E5oaeCv4Sv2xOPfdcAlKAg==
X-CSE-MsgGUID: pU1LvJgASI+eSkuNYMm1wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52819951"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; d="scan'208";a="52819951"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 17:15:29 -0700
X-CSE-ConnectionGUID: b4qSiOdHRjytK43Xqq7oQw==
X-CSE-MsgGUID: PAWPsOOSS0uTxqE0VOWAZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; d="scan'208";a="155757973"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 17:15:28 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 17:15:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 17:15:27 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.51) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 17:15:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z3FLNKp7EpHH5y94oPqb3u+hZVv4rPbLWZXuglANiT4m5tpmvVtUqXfoMI1+H52b3+wpIZhlZCTwV6ZCgkpiPiD6jSUrMTBMmPWBKPmnDmqodIR5duju3CO5fYKgoERt1rWNzQW8bZx1J5BlmZPCNQc+jM3jySxtM2JBOzIUU5wIFrUtmtFMALiopp4dQTACTslzC+8yy6NXCXxEAznD+4zWh9ThWW/Wypdx84fdHbeW0FrK63hdoesrrWNPbe2Cjd7LMXneqMtsR0+Zjm6XagPfYAW6K4PKxXzHD34sGcP5bp1GVU5UGN1QW3ZVqxBN8PEUsd/8qOrTloBuUdgDAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GLpUfP5DRclU9JIAJd9GWQ7HNqmdzbcULjtoR1ZKhCI=;
 b=fkGW4gLSWid2ortnN/i5HHAljLvzv3CXi7CtV0XhGCwby5A7n6k+Tas5L0BykIlXXnecjyf+sKmw2gyytHecFiayIUDj8CYv0258bbJUN79qUPxe+u/2OCPYQFRXvIBQUd8VlQN2rZFh0Mj6mIDsk/fB0IFjW9VMvWfOQBhdbsG0ktlyijEpgYty855eUcDBNpERu/jbKZaBS3x5EM7MtS84fJe+M1Lr3ZYHm7aiV8vgZ6BCRQG3IWx0yUNdmFkXsBm+Ch4A2kVm68NY/EtwpiWcHdbOn2jJq6s2jw58Jfj1UJogvK68FF4oQG6DdFBMkobJm0ofxtphlYCVn904rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by BL3PR11MB6436.namprd11.prod.outlook.com (2603:10b6:208:3bc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Tue, 24 Jun
 2025 00:15:23 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%7]) with mapi id 15.20.8857.025; Tue, 24 Jun 2025
 00:15:23 +0000
Date: Mon, 23 Jun 2025 17:17:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <joonas.lahtinen@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH] drm/xe/uapi: Add
 DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY
Message-ID: <aFnufaHVIGrdyLFr@lstrano-desk.jf.intel.com>
References: <20250623064036.785908-1-nitin.r.gote@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250623064036.785908-1-nitin.r.gote@intel.com>
X-ClientProxiedBy: MW4PR03CA0222.namprd03.prod.outlook.com
 (2603:10b6:303:b9::17) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|BL3PR11MB6436:EE_
X-MS-Office365-Filtering-Correlation-Id: 58ebebb2-cdf3-4078-ff47-08ddb2b4361b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VnpUaGFCMWJZY3o1ZFhPZnA3SE0waHI3V0dRNVFPSjIwdjk0Uk8rOWZjY2NI?=
 =?utf-8?B?Ums4ejhZcjFpZ1N1WGFjTytQamxrL3R0eHg5VmtqUEoyaTFSUUZQaW1BN0NZ?=
 =?utf-8?B?WEZzeDZNZ0hsS3gwcmROVU9RbzA0bWk5OHd5Qk9ITFZJVDVLT2lxRU53aTQz?=
 =?utf-8?B?TW9ydTVlSng4MkRBSUdqU3NNNjI3NzNIT0hTbVBPS1pveFdxQ3F2bGFRZmpJ?=
 =?utf-8?B?Qzdxa3hheE5VZktsL3JuMFBFdm1seStIdTV2dHBWZm1RNDNINUZLd0NBcVpq?=
 =?utf-8?B?Y2s4Wk1yM1BVdTlCdDR2V21kNTc4amkzMEVlOEpRRDhweGJPakNJRU5iM0Ns?=
 =?utf-8?B?S3ZNMG8zTnQwaUczckkvSGQwSDZ3YWY5d1ZBUXFMOWhsMGpIWkJpa2JqMkor?=
 =?utf-8?B?b3Qyc1ZZUTdOV0VMaHZCRi9Fd2pHVkNWNWZyMmNUdUE1ME1qcUx6d1VTN2h0?=
 =?utf-8?B?MjlSTFRvbThCRDA4M0ZKSi9vVG85TnBqVjlTQ1diRGJ4cG8wc2F2TUd5aFhn?=
 =?utf-8?B?Z1U5NmtYQTVuWGRQODlyaGh2TlhsWG91YUdZVmpWYjQybTl5aUljeCtaMmc4?=
 =?utf-8?B?Vno0ZnFEUHJ0cGYwcnVJU0dzSHFpRjczbERJczRoVXIyaWxJYWd3Y25sQjlC?=
 =?utf-8?B?TGhmWXowZUNFYWV6MEI2VW9UQld5c3FJL1VGTEt3cm5ZSXY0bnNBTG9mNHFL?=
 =?utf-8?B?WVhmZldxY1pXRmpIN3VkbTd0bmtOTTB5dG5lMTlzTE9kUmVWYlorTjFyUTVG?=
 =?utf-8?B?L09jMENsd0VZQUFlcURUaG9xL1dNeTNMaWdCR3BkUWVGOXhhcysvMkRhMjNS?=
 =?utf-8?B?czlNYiswV0hyNGxzRzl2Ky82SDFYMVJWRUlydXFjUW1TYTVyNzlDZlhGSmkr?=
 =?utf-8?B?RGZwOWNaa0g4Tmp2Qm9iejFnVlRqY1d4YlRIaE5SOGlVd3V3RG5sVDFTNEx1?=
 =?utf-8?B?QS84bWNsSmpQNVo3SFJMME9IMm9yd0FTR2lBcXBtbWlWRTUwbDFRek1BZVFF?=
 =?utf-8?B?L3UwNVExMVowcStDVi9rK0svQWk3RHVYSWdmekFaaFNtMUtMTjBOREludUYr?=
 =?utf-8?B?WlpBbWd4a01rSmg3dXZwYzR6ejUzU0p5OTNRREJtV2hTeG8rekhMZjVuWVRC?=
 =?utf-8?B?Zld4QWg5MnRReStPdVE3V2NLejU4d3J4S0JrMmZwL1F5bCs3bk1ldVRWVWRK?=
 =?utf-8?B?RU1hKy9lS1pOM3dXRXNpalJkVEN2SDVzeWdVWnd6K0pIRjhKVjhaYWxWVURJ?=
 =?utf-8?B?eXJwMVdVT2xZUzdXMnQxYWluUnhEOVE5NGFPckxXSlZudEFGMDhCZUF1UW43?=
 =?utf-8?B?RDFhdFZYbnlJRHZ0S3BFMlNTK0lCaEhHVzJFNE9pNHlNWjVRUTBnUkUySnVi?=
 =?utf-8?B?YnNFTmdnSDZRQm15YmdCNTRLL3JhcCtDT0xkUDNsbThpOUhRSjZJOHJTOVh3?=
 =?utf-8?B?ZDFrU0thZ2I4Ky85OGRyb0tGRWNhYzJIc3JoWGJBNVlKdkhPYnMwTGoyck1X?=
 =?utf-8?B?Y1M4cVdkSkNCc2RnTGovcm1ubkV3d29uWk5CTjBGZVYwaHN5a2k4VlA4QTJq?=
 =?utf-8?B?THpuOFlFaERuZEtvN01KVEUzN0NwdXpXZWdsN2ZPVlVLMG00bkord3JpSEUy?=
 =?utf-8?B?bGxvaHNXMURabzlIM0NyVGloSHdPZ040NnFpcTYxWThKM0JxRGI4NjFmVEhZ?=
 =?utf-8?B?Sk1iSmd2REIzNDRjVkhtbkN1NHlTQktzMjRSZTBYV1ljWkEvUlF1RHA4Tmxo?=
 =?utf-8?B?V2xKQkpQS0IvdVpISXpqTm44SGhFQkRtRGxhVzNJQ3FPS2ZkRW5XYStQbDlW?=
 =?utf-8?B?YUZTdlcyWXh4MWtZVHpMbTUyQ3FvcmJadGNIV0xjMTRuU0lSc21FVlNzRHhS?=
 =?utf-8?B?VVVaNWs2Q3pqS3ZXSTlQUHMyeGtlZDltVll0VFFqcEdJVVpGMnl1OG1oeEpU?=
 =?utf-8?Q?5qxjmrOQYw4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1lHWEVBMlM5STNBSTdxbWFvNmlMS2hzdDVYK1NQckkyR2wwK2ovZUFWYkxp?=
 =?utf-8?B?OHFUS2tXZUZ1b3ZFdEwxVlpjdDAyL2hCQWViYkwvNEhQeDZrNGJXYmUzSEY0?=
 =?utf-8?B?bzllTHBSQWZMOWxXWXdKbGpNbDQzaDFsejRpMVJIWmZidEJ2R0F5ZUZJQXEz?=
 =?utf-8?B?Sitkc2pEQXhvOFRzTmpWNDB0TWlmVTFmRGFyVEdra2xvdXBLOXd6bGdJaldO?=
 =?utf-8?B?QTZCWXR6QTBZeFp1OS9kbmNUMDJybG9jK1F5K3I4YUxtTGc3MENsNjNDMkhx?=
 =?utf-8?B?dHhSUXVzQklHRzBoR0F2dGs1aU5iZ2U2UUpmeDk1bzVrM0FMNHo0bjFyUFhF?=
 =?utf-8?B?Mk0rQVk3UTQzSW0yYWtGNVJvOVRkSmIzOElEczZvRG5MOEM5Unl6Y0hjYVps?=
 =?utf-8?B?NmxvM2gyeEt0UjFEZ0FXZUtOWC9mcWgwcngxQnpQeXdaRWszdTRZR3FQSGsr?=
 =?utf-8?B?cEtGTTN5cE9uK0k3ZkpCZEQwWEc4bjBJZ1JkOEdYRUVZSFhldU1qclNkcWhk?=
 =?utf-8?B?YXJ4M1BIOTdZU0RlSWxQMC96eWo1djE1eFVsWERSSU9IQUZvVy96SjVYeUhy?=
 =?utf-8?B?RHRyT0ZLdzdxbHhwdjM1V0NkclhsUDE0Um5Hc0Ztb1VQUWU0Qkp3dXYyS2NW?=
 =?utf-8?B?MklqWThNMzF5M1B6eUJHTGpDNVBpaUkvSmY5MXBmT1RyejFtbndWclAzd0xj?=
 =?utf-8?B?RFRpL0tFQzV2UTZ4RUI3SGRKcWFYRFRzT1gvRmsreTQwTkpOaWEwWU1IbHBM?=
 =?utf-8?B?K29ra002ZFBtNGkrNUlTT1VxRzNjQkhmSVgvQWhZLzVrQ1FEbVpjQWloNUpX?=
 =?utf-8?B?eDJuNHpoRGVWNHVLUUM2SUg5Z2VsTmpuaWFvbEt6aVVmMzR1MkM0ek1iOTRO?=
 =?utf-8?B?REpuTWNUQXh1VnJuUFNFRmx3RERtYVBWdDFsc250dUV4V2VrZ3hzQTk1Uzls?=
 =?utf-8?B?aDU5aHI2MDdZVFRsYU95TlROcHQ0dUJ1MjNGbGphWTUreU1MZ2lTOU1JaStC?=
 =?utf-8?B?SGJMSWtIU3JybkFvZllQMlJtSWwxUUtxNHBuQVViVE91RmR6RzFlMU5VdWhH?=
 =?utf-8?B?M3lEaFBSaFhTUHlRblo4VUtUaHI3RVJXVlpZNXYxLzlpSDdRY3VwcCtNeXNN?=
 =?utf-8?B?QlZGS2NQYkEvbmtRMk5ab3FJU1FCTHRGYU5PKzY2VHhIeEZwVVdOSDRRbjRO?=
 =?utf-8?B?Rk9lNE5tdmJPSWp3L0JlSzYxUGIyRzFBdmpOK1IvTzdOSXo1cmMrL3BaWDZo?=
 =?utf-8?B?REVYRmthVThGc2FPVzZkMFU1dGF3UmdOcFB4L0d5bUJldjYvUC9oVnRuL2xQ?=
 =?utf-8?B?OWYzZFRSWXFrUVBDMTRTdWdZU0hwbnBMdXNjNS9BVkhEcmZwckRieTJvbGxY?=
 =?utf-8?B?V2d6ZERyb2RzNkZVaVVxdUE0WlBPV0ZHc0VrMSsrNWFEQ0pFcUZDT0pPTE9Q?=
 =?utf-8?B?cTlraGM5elU4TVE1MUVnQks1NUtEUEwrR1RSVi9uM1RJby9IalJwTnFCa3cx?=
 =?utf-8?B?SzZ4ZGowQXhQNVJYaVphSmZ4T2Vvd29JNFJiV0FXNGpRb004eHgyOTMyaDI1?=
 =?utf-8?B?QmtQQWYvUkp5ZUhYN1BSQUNGdTVFUkhXOS9oQWNManZMd00vczYrMUhZV2RK?=
 =?utf-8?B?MXJWL0FxZnZxeTJhZzRDdFBrd1JPL1Exd2grMzVhNnNPaTl1MmUzWmxkdUNL?=
 =?utf-8?B?cnU0Y1JhaDVlUzBXVkJsVWYrMDVxOUd2VWJ5bFVaZUtJSllBcWFBWjFuNTAz?=
 =?utf-8?B?NmtEb3VweTMyeUQ0Uy9OU2NvSzlZZnV5dmJtM3JTOWRyZkNlMWRZWks4T3Jr?=
 =?utf-8?B?d3dwWEladGtXdWlEaklRdFVweG5lNGYwRnF0cHVBYjduZG9IS3Z2VVJ6SldS?=
 =?utf-8?B?ZzhpamVCdTV5MFNlRVd4NHhmbE9uRU1XWFVJS3kxZHd3bzI5V2hMSy9DNTIr?=
 =?utf-8?B?L1VFeHVFSU5SQ3VuOEdxK3ZIeHBlSmloRWJUSUhaOS9iNkdQYmlHRk1lNG5G?=
 =?utf-8?B?bVpBR3NvQnJPRm9rSytWaVd2b2p3R3Q4aUFkZTFNQi9tUzdXd3ZobE1QUWZi?=
 =?utf-8?B?VjZwZlBGRHJ4L0toMVYzUDFIY1ZDUGFOQm9IM1AyL1U2ZlRNVlROL015QmY3?=
 =?utf-8?B?b1VOMXZYVzNOQjR4V3hDbDl4d2RhakJRYnlqcVFuck9HV0p4NURJYmV2eStv?=
 =?utf-8?B?N3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58ebebb2-cdf3-4078-ff47-08ddb2b4361b
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 00:15:23.3531 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4pZg9Zp6AApw4KEBDo6UbOH4E0J9cy1ZUXBz8glE4J+yd+/eLNJK9PJxqiO3KLyoo3mou6G0GrGaR6IRobed5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6436
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

On Mon, Jun 23, 2025 at 12:10:36PM +0530, Nitin Gote wrote:
> Add the DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY device query flag
> which indicates whether a device supports DIS_NULL_QUERY (Disable null

s/DIS_NULL_QUERY/DISABLE_NULL_QUERY

> anyhit shader query mechanism). The intent is for UMDs
> to use this query and opt-in DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY flag
> to disable null query mechanism for anyhit shader by setting
> DIS_NULL_QUERY bit of RT_CTRL register for Xe2 IP.
> 
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 9 +++++++++
>  drivers/gpu/drm/xe/xe_query.c      | 3 ++-
>  include/uapi/drm/xe_drm.h          | 8 ++++++++
>  3 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index fee22358cc09..519f36db7cd0 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -26,6 +26,8 @@
>  #include "xe_trace.h"
>  #include "xe_vm.h"
>  #include "xe_pxp.h"
> +#include "xe_gt_mcr.h"
> +#include "regs/xe_gt_regs.h"
>  
>  enum xe_exec_queue_sched_prop {
>  	XE_EXEC_QUEUE_JOB_TIMEOUT = 0,
> @@ -693,6 +695,13 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  		}
>  	}
>  
> +	if (((GRAPHICS_VER(xe) >= 20) && (GRAPHICS_VER(xe) < 30)) &&
> +	    (args->flags & DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY) &&
> +	    (eci[0].engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
> +	    eci[0].engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)) {
> +		xe_gt_mcr_multicast_write(q->gt, RT_CTRL, DIS_NULL_QUERY);
> +	}

You will hit an error before you get here because of the if statement
above (not shown in the diff) that sanitizes args->flags.

You don’t need {} here.

Also, a register write implies this would affect the entire GT, not just
the exec queue flagged with “disable NULL query.” Is that really the
intent? It doesn’t seem correct to me, but honestly, I’m not entirely
sure what this patch is trying to do. If the intent is for this to be
per-exec queue, then I think this needs to be implemented as some ring
instructions in the LRC WA BB.

> +
>  	q->xef = xe_file_get(xef);
>  
>  	/* user id alloc must always be last in ioctl to prevent UAF */
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index e8e1743dcb1e..c5002b8c9ac0 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -344,7 +344,8 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>  		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
>  			DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR;
>  	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
> -			DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY;
> +			(DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY |
> +			DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY);
>  	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
>  		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
>  	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 8e8bbdec8c5c..a5bfba121360 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -397,6 +397,8 @@ struct drm_xe_query_mem_regions {
>   *      has low latency hint support
>   *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR - Flag is set if the
>   *      device has CPU address mirroring support
> + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY - Flag is set if the
> + *      device has null query support for anyhit shader.
>   *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
>   *    required by this device, typically SZ_4K or SZ_64K
>   *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
> @@ -415,6 +417,7 @@ struct drm_xe_query_config {
>  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
>  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 << 1)
>  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR	(1 << 2)
> +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY	(1 << 3)
>  #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>  #define DRM_XE_QUERY_CONFIG_VA_BITS			3
>  #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
> @@ -1271,6 +1274,11 @@ struct drm_xe_exec_queue_create {
>  	__u32 vm_id;
>  
>  #define DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT	(1 << 0)
> +	/*
> +	 * DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY flag is
> +	 * use to disable null query check for Anyhit shader
> +	 */
> +#define DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY	(1 << 1)

We should add proper kernel-doc for this flag.

It looks like we’re also missing proper kernel-doc for
DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT. While you’re at it, could you add
that as well?

Matt

>  	/** @flags: flags to use for this exec queue */
>  	__u32 flags;
>  
> -- 
> 2.25.1
> 
