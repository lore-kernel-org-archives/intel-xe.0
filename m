Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E554CC36011
	for <intel-xe@archiver.kernel.org>; Fri, 28 Mar 2025 17:52:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77CBB10E062;
	Fri, 28 Mar 2025 17:52:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JccxE3YY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7029210E062
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Mar 2025 17:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743184352; x=1774720352;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:mime-version;
 bh=SEMu69DnpogDemB82w+4VOVicjH9UascVbuX3lZBMzE=;
 b=JccxE3YYeGPHtZdXMrmBhhhb5tMy6Rgn7nGro/w8BOD3SgNQQpfry09/
 kQ61cExDJAjvWvUYiaS1EiW7k/HfolKYeRBGUmWLZDDFZuOn8/ezv0t0R
 HZIi6SdkdsD78jE6q+kG3l0AmZVS3I4eyEDygwnLVdCk4XKwje1NMGqsq
 c9XoNbTr/erHjz0LWfFSp/O9lsfQgYU6JY4n3oM/1f6vO0rrLzhIhjwAN
 pQpxhxV5l+f2K0Kp7De9gg+PYdx8ljhbaSZE0ZFfNCvW78DLn6PZcLwft
 7IA0NHI6BMRjUr7dXj3dsv7283RFJd066cSg3iHPv1e6/li9Q0V1hrWgi A==;
X-CSE-ConnectionGUID: fA46K2smT6aZWnwRauIcPw==
X-CSE-MsgGUID: kQNvoAf9S1SqIwKskWeLAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="55202628"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208,217";a="55202628"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 10:52:32 -0700
X-CSE-ConnectionGUID: O4emDlHHQMOi3+WE9VFwRw==
X-CSE-MsgGUID: 3xh3Izu0THGmWpmJYkxv7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
 d="scan'208,217";a="125328809"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 10:52:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 28 Mar 2025 10:52:21 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Mar 2025 10:52:21 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Mar 2025 10:52:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bpGZv6vNouAks3S9eKrwH0FbVDCgauas4+wVsV2ZfZepmRW/F9jRAYpBaopy8t0OJbOzUS6VfLfMcUjScIgx9PLzASFsxjx2xjOYs0GSuolOz/PQG4PgWh8uPK4VFVdxMDdp3Qd/WNt0kreA86l65izvMY8y56qVPALO09ONmHofvMcLGZuG+5YtYfWCkKLp5IN6TD+YLfte1u9AZ7FHIsz+i2fI/MBMRbeY8DcXC1hi7QQKUIAq0C2PhOZ5xEqPxPi55JRiy2UJWWIe7h2ap9qkU62ptbiQCc9CUJIL59My4Rqd4ElyKwDrpM4owb85l0Raww5/+pf0qmt0kwG+iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iB9WAPaRLXzCIXvV0G+0K3MSXp6D1svUUeJ+fZHg3ro=;
 b=N73/JXAOpnp5zVnCrkl+WajNUV5jUhMu9yfWoxw7HgrH583Khtsnvv6ORIEU9WxlWnXNgTYXZxVsJmTCk0Orl6IcG4g4+pdbDXLE6FO7Dmp4BWBp1/0LpYwbpQQsUPBzWjudxHmSuBLWbgfZQOEHptrEnEHS+I/Xw8Ppv60O3Vek4SXfbjGjeoNOKJh4UZc5bK4r41D8Wqw9JJ5K54xQI7+EBLVkP+y2uPhG7h/jWqhxXjT8OGx1j+abGnzagdLyQAEYvaqpMCLyW3kniuu5Js456n3xr1s3b9bThHa/hn6Ik91V8g1tLzDgRsnYKr3ui7wWAri8PKwg4u8z3da+rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by CY8PR11MB7059.namprd11.prod.outlook.com (2603:10b6:930:51::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.47; Fri, 28 Mar
 2025 17:52:18 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%4]) with mapi id 15.20.8534.045; Fri, 28 Mar 2025
 17:52:16 +0000
Content-Type: multipart/alternative;
 boundary="------------Itue0Wt80MMsA7tiRNwz9ym5"
Message-ID: <71620253-6ed9-4a77-bcc4-bf7591cf18aa@intel.com>
Date: Fri, 28 Mar 2025 18:52:14 +0100
User-Agent: Mozilla Thunderbird
From: "Lis, Tomasz" <tomasz.lis@intel.com>
Subject: Re: [PATCH v4 3/3] drm/xe/vf: Fixup CTB send buffer messages after
 migration
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, Lucas De Marchi <lucas.demarchi@intel.com>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20250306222126.3382322-1-tomasz.lis@intel.com>
 <20250306222126.3382322-4-tomasz.lis@intel.com>
 <667cbea4-3891-45e3-be19-f3a0cafa0ff1@intel.com>
 <d0597e0f-7222-4d4c-8982-380ecfc69451@intel.com>
 <bbdffe55-a658-43be-b46a-5f1c9846daeb@intel.com>
Content-Language: en-US
In-Reply-To: <bbdffe55-a658-43be-b46a-5f1c9846daeb@intel.com>
X-ClientProxiedBy: VI1P189CA0005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::18) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|CY8PR11MB7059:EE_
X-MS-Office365-Filtering-Correlation-Id: d4c8223b-85b0-4a7d-81fb-08dd6e214728
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|8096899003|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NG1TT2dIcXp0ZVpGK2hGeVVaaXIweFF5YlFGZUxFOHcxRDAxWGtWV25hS2t6?=
 =?utf-8?B?WllwWXlKOXFkK1BGQkhwSm1tZjVLeXd6UkN3dVdLTGdTNXczcTZXK3VtQWkw?=
 =?utf-8?B?L0hVY1FNc0ZWWWdTVFdrcHhsbmorZFNzZEpuU1QxdnJnU1kwNjFoVytuRDFy?=
 =?utf-8?B?VnByL1RoZjZQS24vTHpKTWR0ME03Q0dKaUtJRkcrOWhSalA3bmFOa2pkcmwr?=
 =?utf-8?B?TjZMeUoyZWNiVSt1b1FqL0pnbCtWOUxSQkZRc3djTUxJb2tZZjl6aFJQemRE?=
 =?utf-8?B?Um9JK1NSOFBCdFM1WEhPSEFIR3pnalFHMUZOOStZT0N6aHhaenBxL3dsMUpx?=
 =?utf-8?B?YzVkR2xKYnUvMUkvdHVRcytMMkxKbjZhWnZLYjl5UUs4MGRoY01XRU82aTdS?=
 =?utf-8?B?SXFhTUIxcGw4ekREMXhLdnF0eWtnRGR1bnlXTGZCZWd6akRzREFhRGlmeVI5?=
 =?utf-8?B?ZkV6ZXgwM2VNK1FHZFpGaUhNckhxcldOcE1qVWdnbDhWQzU1OWFjYlpKWmJl?=
 =?utf-8?B?ZnpaWTRLRmFINGNtZ3FUS3lXRnRyK1lPN1d1WGNqV1VseTdOVVBDNWZhRjgw?=
 =?utf-8?B?K0ZMREVZeWcwem9BTFZta3VIcDU0elJWSXlUL2E1MnNWQzRXMzdMMEZlNG4w?=
 =?utf-8?B?aTlvWDdJR1ZsVXV3THlISTN5RVNIM2p2SWxHUHdwSHA3V040clhJdzNWa2dm?=
 =?utf-8?B?dUhQRUNDK1RsUWFNUEpIYm9yMnNodG1Ed1dCY2s4c2FTZlhRV2cvRVlVcjFB?=
 =?utf-8?B?RnFQMThRNVFneiszWHBKdTd0UmpIdXB3NnBpaG1yTEhhU3F6UG4xbVB2ZzJk?=
 =?utf-8?B?R0hOWTliR05vbjdrbDdiMm5yQisyTEZIcG1jaXY0QlNjMDREVlNxYjgxREcz?=
 =?utf-8?B?aFlLNXpLZTRGVGsyTmdoaE9TeHduSmRCaXhsZDVTb3djQWlCUGlGVkpveFdN?=
 =?utf-8?B?czk4eGtQek9HWGE2b1NkVzhwZWJTY1IrSHQzNElqNWczOXpjdlNiRGlBeXE4?=
 =?utf-8?B?ZDEvY1V3cHVodkw2dlp0MlBnTHBITkdEcGFDVkN2b3hJRWVMdFI1TDI3QWR2?=
 =?utf-8?B?WHhKZGw5Y0VwRk5CVThMdDJhNGhYdFBrekpBOWRCTStOa1h5WGU4cWhpdlFJ?=
 =?utf-8?B?K0IxbmJVbjFzaXR5S2VYbk00ZGdmZlVwMzZvZytLQ3Q5QWF6eWpFS1psVmMw?=
 =?utf-8?B?K1YxSTRvL0drUXhUeExtblNjRml5UDVnTTFHUEIvbWFwNEYrYk1LZzRGYndT?=
 =?utf-8?B?dzlqM1FWSVhCZ0p5aUtPWXFkYUtLNWt4b0YyaHdUSU15Zkl4blhXNzYwb1FU?=
 =?utf-8?B?OUtEMkJhcHN5eHp0OWk1cGtLQWhpZzJvdVNmc3AzWmdRTEJuQmNDZXh6Z0c3?=
 =?utf-8?B?a2lUMUxIWHBnaGRYOTRDNjZCcEs1bUhpaFRGbi9CUUJ2UlB1OHVhd0RKNTA2?=
 =?utf-8?B?NGtpVGNneGM4ZVV4eDluTEVFQm1USW1mUWNkVFpQMXRiWjRMOTM4YUNPQmxM?=
 =?utf-8?B?ZU1wMWxiVmxweU92dnRXZ1NISENzQjhPb1FsUitIRmlhbVhiLzdwSmUzbkc2?=
 =?utf-8?B?Tys2Q042bzBKTUxSeHhLck9NRi8wcVZxYjlBdVNNTi81UmhSUG9NbUFZU2dw?=
 =?utf-8?B?aVNsUXIrdmxhTm1qS2kzV0JZcXpBMVVHNUFhVjVPS2RmbDFRaTV0cFUvZWR5?=
 =?utf-8?B?M2M5UkExdmc3RzVXam80azc2UElkRVNXYU0zbE1pWlVFbmliVXQvK2pZMXM0?=
 =?utf-8?B?dGZQQTFxZ2ppS0E2bUVYRlg2MFJONmlBaUpHZEFnTjdxYXFHTS9UcUFzQVdO?=
 =?utf-8?B?T2FSK1p1QWgwdmNzMHVIdTUvNm1Na243SmVhYmdJZTVtc2VQMEtHMWgwRk04?=
 =?utf-8?B?OWxianFxYXp2M1ZmVE92cWl1b2JDNm9xTkpNN1NtMkhDNURKRHhtWnhGcXZ4?=
 =?utf-8?Q?o86nU4Ts3Dc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003)(13003099007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWYweE9KTk9rbGNXOHVOaklySEtTcDNKZ3dJS0xiNm5tNjJjRURHSnc2WFYw?=
 =?utf-8?B?eUs1MnpEK2lZcWFUTFk5UThTb2RGemZSb2JoNDVCTmFyS0pIUTlmS00xbklC?=
 =?utf-8?B?VlNUUTV0OGd4UTBpR3FKMVhTUFVvbVlyUm5YM3JTRVRhNCtGaVNtcS9VY0NC?=
 =?utf-8?B?dEJoTndBRFJEME9vZ1JKVlptbU1TblgwUmViTzRxUVFyTmhobXErL2xUY3Y2?=
 =?utf-8?B?QXJaMVJjK3VnaTV3am9ad1Bvd3IxKzJUQlJweGZwVWpBOE4rcVB6RFAwVE95?=
 =?utf-8?B?UExMQnUvUS8xZGl4YzlIUjFod3NhTjRrbERhaVNFQThKWklBYTRQNU91NXda?=
 =?utf-8?B?VC9GZXM3MnFXQlpXWDNhWjhjdVhmcVVSNHJCNVhVYzY4VFJ2RXBIWi9XNmVZ?=
 =?utf-8?B?dENsNXIvbHBHTHIvYjdsWFdMeXhhMTFDVE1uUlBJdElhZGpJMzRNdVYvUGlW?=
 =?utf-8?B?WXJ5T05GNmh0cmtTV1A2SXNXUXNPaG14dzljVDdEWHRkcmg3enRTYmRsYnEv?=
 =?utf-8?B?U0dxU3UwdktmY1pBSTZWRUkrbkFtbDgwQzc2Mis3enhZbktqelRRSGUrbGVI?=
 =?utf-8?B?blBCMU1DZzZDSmJNWmJWUEMwRG1pRTVsVnM0dFNaRjFoRUF1UzVnSWtxREhB?=
 =?utf-8?B?Z0k4VDRHTDFXQW9HQk1yM0FOQlNlOEwzb0VKczFrRkdjeCt3cUdJazRORTB2?=
 =?utf-8?B?aGM1K3VUT05nUldBQU0ra2ZKbDB6ZThBbUEzVHl5OUUrVDcxWlU1aVFqUlBS?=
 =?utf-8?B?T0FBMm9DWDNQOThkTUtlSGlNNE05NVUvNk42dzZobysvQllNcGJud1pTcU9q?=
 =?utf-8?B?MGZOWGpsRkkrZVk2Skt4VmV6Z0szSy91T2NpNldRbFQ5dExUbDNUQ1JFZGdV?=
 =?utf-8?B?QUtWV3l6dXpUdkIxR3VPWDdyVllDWVV3OUJTMVlFMmR0dU9JNjcwWndMMmZ6?=
 =?utf-8?B?MVVkZUtJbzIwLytzS3Q4SStiYnFWcCs2Qm1UcmZKU1lJVVdnMzFEd2NJYWJp?=
 =?utf-8?B?ZXhSc3VhVlNYM3NwSm9jYmc2UGcvb2pNSVFBamtkcERkd3dLeWZHaWd3M3hT?=
 =?utf-8?B?djFQUXRKNTJubUF0M1NXb25YbEpkV2NTalhGNG1DcFZqblVuRWk3bkVlTlVh?=
 =?utf-8?B?dzRxRTdPREppZXU4cmVTemNWeTZQUitYMmlJQitOTDdSYXZMU2RZZjgrekJp?=
 =?utf-8?B?THBYYVZTaFVNdkJpc2lMZ2sxV0phTDVwQmU0dTZpNW1kN2RLUHBqNEtBOUtw?=
 =?utf-8?B?c01yZ0xESDdHNHdiRlc3SmRJRHNpdEcwMFNnYzlzOHkxWWJSWkhxUTlRcFNr?=
 =?utf-8?B?UURvUGZKTnEzem53REthdng4SndRYi9qVFgwQWVuRmRqSFBLYXJ0MytOREt3?=
 =?utf-8?B?cU01OFNoVjJ4VmZVdXJ6UUE1anQyUWlndmdMR0FSRTFHSFBVVlNoV0l4bnZ4?=
 =?utf-8?B?MzJCcW84ZDdnODVSd1RQR09Bd0NiZXZxSXI1ZDQ3d3BDeG5tQ2liUml5ZDd5?=
 =?utf-8?B?UFg1ejR6ay8rS29ETDhtS0lRMDhwUFE1b3paN3c3QTZNcDhBUkszbk8waTU2?=
 =?utf-8?B?TDdONnFrRXg5ZzBVUnVLamtZaVRQVm15eStRSXB5N0E0Nm5QUWlNRFYyS3dW?=
 =?utf-8?B?a3BIYnVsc1g2SndHVUpaUHdHcmQwN0JCeHR1ak1hVWxxRWR6RjFTN0ZqVE1Z?=
 =?utf-8?B?YjRaT0I0cjlrZ29kbHZYcG5DRnJ6MkpSd0ZtWXRveTFrSlM3R3JZM3RLZGJq?=
 =?utf-8?B?WDVraUhKTzJJUkgwVzhiTXlQOUZTVmJkMXkyQ0I1SFZrNXlSbWViNjIzNExT?=
 =?utf-8?B?c2RObHYwWFRFdmlsOGloYy8wUlhOK0FyNWhrZm5qMHdLc1o0a1hubWNCRGJu?=
 =?utf-8?B?alhWTFZVd3BZcUlQMzlWZlA3a3dOTWRjUFRmWCt4WHpIZEZnQmJsRnJmVHNC?=
 =?utf-8?B?TkhYTWVlVUR4ZEZtWGt0TXVTQlMyb2YzWFpDb1RwUnZoeE00NzkwZFphY2pw?=
 =?utf-8?B?MGhNNWYyZW4vdW5pdXRvcGwyMzg5aUhjNkNFT3RINVBKeTErUm9tT2FTWUMv?=
 =?utf-8?B?RUdabDJhazRuOTlFRlZ6Q2ZwaHp4MXlWQldKQVNsZlpZUDMzcEZobmRWdTl2?=
 =?utf-8?Q?xUomkr+8pBFInsp6GPNPkm/xq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4c8223b-85b0-4a7d-81fb-08dd6e214728
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 17:52:16.6522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3dqC66AnPy7PECQ3gY5KaFXML5sG9u1ZfNHLJaoK2PE8F3fnSv4ELMtJxWeyFXKOdXNfwE5yjMpFkeOPl8c6sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7059
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

--------------Itue0Wt80MMsA7tiRNwz9ym5
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 15.03.2025 13:59, Michal Wajdeczko wrote:
> On 14.03.2025 23:11, Lis, Tomasz wrote:
>> On 14.03.2025 21:46, Michal Wajdeczko wrote:
>>> On 06.03.2025 23:21, Tomasz Lis wrote:
>>>> During post-migration recovery of a VF, it is necessary to update
>>>> GGTT references included in messages which are going to be sent
>>>> to GuC. GuC will start consuming messages after VF KMD will inform
>>>> it about fixups being done; before that, the VF KMD is expected
>>>> to update any H2G messages which are already in send buffer but
>>>> were not consumed by GuC.
>>>>
>>>> Only a small subset of messages allowed for VFs have GGTT references
>>>> in them. This patch adds the functionality to parse the CTB send
>>>> ring buffer and shift addresses contained within.
>>>>
>>>> While fixing the CTB content, ct->lock is not taken. This means
>>>> the only barrier taken remains GGTT address lock - which is ok,
>>>> because only requests with GGTT addresses matter, but it also means
>>>> tail changes can happen during the CTB fixups execution (which may
>>>> be ignored as any new messages will not have anything to fix).
>>>>
>>>> The GGTT address locking will be introduced in a future series.
>>>>
>>>> v2: removed storing shift as that's now done in VMA nodes patch;
>>>>     macros to inlines; warns to asserts; log messages fixes (Michal)
>>>> v3: Removed inline keywords, enums for offsets in CTB messages,
>>>>    less error messages, if return unused then made functs void (Michal)
>>>> v4: Update the cached head before starting fixups
>>>>
>>>> Signed-off-by: Tomasz Lis<tomasz.lis@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/abi/guc_actions_abi.h |   7 ++
>>>>    drivers/gpu/drm/xe/xe_guc_ct.c           | 147 +++++++++++++++++++++++
>>>>    drivers/gpu/drm/xe/xe_guc_ct.h           |   2 +
>>>>    drivers/gpu/drm/xe/xe_guc_submit.c       |   4 +
>>>>    drivers/gpu/drm/xe/xe_sriov_vf.c         |  18 +++
>>>>    5 files changed, 178 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/
>>>> drm/xe/abi/guc_actions_abi.h
>>>> index ec516e838ee8..dde6cb5a6be9 100644
>>>> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>>>> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>>>> @@ -160,6 +160,13 @@ enum xe_guc_preempt_options {
>>>>        XE_GUC_PREEMPT_OPTION_DROP_SUBMIT_Q = 0x8,
>>>>    };
>>>>    +enum xe_guc_register_context_multi_lrc_param_offsets {
>>>> +    XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_DESC = 5,
>>>> +    XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_BASE = 7,
>>>> +    XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_N_CHILDREN = 10,
>>>> +    XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_HWLRCA = 11
>>>> +};
>>>> +
>>>>    enum xe_guc_report_status {
>>>>        XE_GUC_REPORT_STATUS_UNKNOWN = 0x0,
>>>>        XE_GUC_REPORT_STATUS_ACKED = 0x1,
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/
>>>> xe_guc_ct.c
>>>> index 72ad576fc18e..6f19bf9565ba 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>>> @@ -84,6 +84,8 @@ struct g2h_fence {
>>>>        bool done;
>>>>    };
>>>>    +#define make_u64(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
>>>> +
>>>>    static void g2h_fence_init(struct g2h_fence *g2h_fence, u32
>>>> *response_buffer)
>>>>    {
>>>>        g2h_fence->response_buffer = response_buffer;
>>>> @@ -1622,6 +1624,151 @@ static void g2h_worker_func(struct
>>>> work_struct *w)
>>>>        receive_g2h(ct);
>>>>    }
>>>>    +static u32 ctb_read32(struct xe_device *xe, struct iosys_map *cmds,
>>> maybe to make this function more "ctb", pass ctb instead xe?
>> You mean `struct xe_guc_ct *ct`?
>>
>> I don't understand, why would we do this? We don't even need `ct` there.
> if it doesn't need 'ct' then don't use 'ctb' prefix
ok, will change.
>> That would just add another `ct_to_xe(ct)`.
> maybe not another, but just moved, as then the caller doesn't need to
> have it
>
>> If we're adjusting parameters to what looks nicer rather than what is
> it's not always just about the look, but it's about proper layering
>
>> really necessary, then why `xe_map_memcpy_from` accepts `xe` and not a
>> `bo`?
> feel free to ask authors, this was introduced (without review) as part
> of the initial Xe commit dd08ebf6c352
>
>>>> +                 u32 head, u32 pos)
>>>> +{
>>>> +    u32 msg[1];
>>>> +
>>>> +    xe_map_memcpy_from(xe, msg, cmds, (head + pos) * sizeof(u32),
>>>> +               1 * sizeof(u32));
>>>> +    return msg[0];
>>> and looks almost like our deprecated xe_map_read32 ;)
>> yes, it does look similar. But I assume we don't want to reuse that?
> well, it depends.
>
> since it is already there, IMO we should use it.
>
> OTOH, during some other review it was said that maybe the whole xe_map
> layer will go away, so then no need to use it, but equally, no need to
> use _any_ of other xe_map wrappers, so need for having a xe is also gone
>
> but as there are no signs that xe_map will be removed, we should
> continue to reuse existing code
>
> unless @Lucas has some more recent news
ok, will use `xe_map_rd()`.
>>>> +}
>>>> +
>>>> +static void ctb_fixup64(struct xe_device *xe, struct iosys_map *cmds,
>>>> +                   u32 head, u32 pos, s64 shift)
>>>> +{
>>>> +    u32 msg[2];
>>>> +    u64 offset;
>>>> +
>>>> +    xe_map_memcpy_from(xe, msg, cmds, (head + pos) * sizeof(u32),
>>>> +               2 * sizeof(u32));
>>>> +    offset = make_u64(msg[1], msg[0]);
>>>> +    offset += shift;
>>>> +    msg[0] = lower_32_bits(offset);
>>>> +    msg[1] = upper_32_bits(offset);
>>>> +    xe_map_memcpy_to(xe, cmds, (head + pos) * sizeof(u32), msg, 2 *
>>>> sizeof(u32));
>>>> +}
>>>> +
>>>> +/*
>>>> + * ct_update_addresses_in_message - Shift any GGTT addresses within
>>> nit: as this is *not* a real kernel-doc, then maybe drop function name
>>> and keep only description plus params?
>> will do, even though I don't know why we break the sibling rules which
>> could be easily kept.
>>
>>>> + * a single message left within CTB from before post-migration
>>>> recovery.
>>>> + * @ct: pointer to CT struct of the target GuC
>>>> + * @cmds: iomap buffer containing CT messages
>>>> + * @head: start of the target message within the buffer
>>>> + * @len: length of the target message
>>>> + * @size: size of the commands buffer
>>>> + * @shift: the address shift to be added to each GGTT reference
>>>> + */
>>>> +static void ct_update_addresses_in_message(struct xe_guc_ct *ct,
>>>> +                       struct iosys_map *cmds, u32 head,
>>>> +                       u32 len, u32 size, s64 shift)
>>>> +{
>>>> +    struct xe_device *xe = ct_to_xe(ct);
>>>> +    u32 action, i, n;
>>>> +    u32 msg[1];
>>>> +
>>>> +    xe_map_memcpy_from(xe, msg, cmds, head * sizeof(u32),
>>>> +               1 * sizeof(u32));
>>> ctb_read32() didn't work here?
>> It would. For G2H and H2G messages we always use FIELD_GET on an array,
>> and field name contains index in that array.
> hmm, not sure if I follow here... what was wrong with:
>
> 	msg = ctb_read32(...)
> or
> 	msg = xe_map_read32(...)
>
> you could still use FIELD_GET from the 'msg' var

As I explained, currently FIELD_GET is consistently called on an array. 
To confirm, use:

```

$ grep -R  'FIELD_GET[\(]' drivers/gpu/drm/xe/xe_guc_ct.c

```

You will find either `hxg[0]` or `msg[0]` in all lines.

>> So, I consider this way of writing it more standard within Xe, and
>> therefore easier to understand. Though no strong opinion - let me know
>> if you want this changed.
> but then you are little inconsistent, you defined new helper but then
> decided to access data without it

The helper was defined on your request:

 > those macros are quite ugly and violating many rules maybe they 
should be converted into inlines?

I did not intended to have such helper.

>>>> +    action = FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, msg[0]);
>>>> +    switch (action) {
>>>> +    case XE_GUC_ACTION_REGISTER_CONTEXT:
>>>> +    case XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC:
>>>> +        /* field wq_desc */
>>> as we have enums that describe field offsets, we don't need to add those
>>> small now redundant comments
>> will remove.
>>>> +        ctb_fixup64(xe, cmds, head,
>>>> XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_DESC, shift);
>>>> +        /* field wq_base */
>>>> +        ctb_fixup64(xe, cmds, head,
>>>> XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_BASE, shift);
>>>> +        if (action == XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC) {
>>>> +            /* field number_children */
>>>> +            n = ctb_read32(xe, cmds, head,
>>>> XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_N_CHILDREN);
>>>> +            /* field hwlrca and child lrcas */
>>>> +            for (i = 0; i < n; i++)
>>>> +                ctb_fixup64(xe, cmds, head,
>>>> XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_HWLRCA + 2 * i, shift);
>>> did you run checkpatch.pl ? line is quite long
>> it does complain. Will fix.
>>>> +        } else {
>>>> +            /* field hwlrca */
>>>> +            ctb_fixup64(xe, cmds, head, 10, shift);
>>>> +        }
>>>> +        break;
>>>> +    default:
>>>> +        break;
>>>> +    }
>>>> +}
>>>> +
>>> nit: no short description here ;)
>> why would it need one? sub-function (ct_update_addresses_in_message) has
>> documentation, caller also has documentation.
> well, it was just inconsistency, in other places you seems to add
> documentation even if there is no

Functions which need documentation are documented. This is not an 
inconsistency, this is

context based decision which completely aligns with both kernel 
documentation rules and recommendations.

What is inconsistent is using custom documentation format, not defined 
in any kernel guides.

If we want a function doc to not be visible by kernel-doc parsers, it 
makes total sense to skip the one

asterisk to make it treated as an ordinary comment. But following that 
by also changing format of

the comment into some custom idea, that is questionable and inconsistent 
with existing rules.

>>>> +static int ct_update_addresses_in_buffer(struct xe_guc_ct *ct,
>>>> +                     struct guc_ctb *h2g,
>>>> +                     s64 shift, u32 *mhead, s32 avail)
>>>> +{
>>>> +    struct xe_device *xe = ct_to_xe(ct);
>>>> +    u32 head = *mhead;
>>>> +    u32 size = h2g->info.size;
>>>> +    u32 msg[1];
>>>> +    u32 len;
>>>> +
>>>> +    /* Read header */
>>>> +    xe_map_memcpy_from(xe, msg, &h2g->cmds, sizeof(u32) * head,
>>>> +               sizeof(u32));
>>> ctb_read32() didn't work here?
>> Like before, for consistency. Will change on request.
>>>> +    len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) +
>>>> GUC_CTB_MSG_MIN_LEN;
>>>> +
>>>> +    if (unlikely(len > (u32)avail)) {
>>>> +        struct xe_gt *gt = ct_to_gt(ct);
> btw, no need to have local var here, since you can do ct_to_gt()
> directly in the xe_gt_err() below (it's the only use case)
will change.
>>>> +
>>>> +        xe_gt_err(gt, "H2G channel broken on read, avail=%d, len=%d,
>>>> fixups skipped\n",
>>>> +              avail, len);
>>>> +        return 0;
>>> in caller we do mark ctb as broken, why are we silent here?
>> Incorrect head/tail of a CTB is an issue of completely different caliber
>> than a message with invalid length.
> not sure if those errors are that different.
> see CTB descriptor status codes:
>
> 	GUC_CTB_STATUS_OVERFLOW
> 	GUC_CTB_STATUS_UNDERFLOW
>
> which are used exactly to classify those kind of errors
>
> if we are able to read msg header from the CTB but there is no payload
> data on CTB then it's a CTB protocol bug

We are not in CTB write function, we are fixing the existing CTB messages,

stored there by the CTB write function.

But this situation should never happen anyway, so I don't have any 
reason to push

a specific solution. Just write how you want this handled, and I will 
adjust the code.

>> The invalid message is actually more likely to be a racing condition
>> rather than CTB damage.
> racing with what?

With CTB write function changing the tail, and GuC changing the head.

Both should be normally locked/stalled of course, but there are corner 
cases,

around migrating again just after vcpu started from previous migration.

>>>> +    }
>>>> +
>>>> +    head = (head + 1) % size;
>>>> +    ct_update_addresses_in_message(ct, &h2g->cmds, head, len - 1,
>>>> size, shift);
>>>> +    *mhead = (head + len - 1) % size;
>>>> +
>>>> +    return avail - len;
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_guc_ct_fixup_messages_with_ggtt - Fixup any pending H2G CTB
>>>> messages by updating
>>>> + * GGTT offsets in their payloads.
>>>> + * @ct: pointer to CT struct of the target GuC
>>>> + * @ggtt_shift: shift to be added to all GGTT addresses within the CTB
>>>> + */
>>>> +void xe_guc_ct_fixup_messages_with_ggtt(struct xe_guc_ct *ct, s64
>>>> ggtt_shift)
>>>> +{
>>>> +    struct xe_guc *guc = ct_to_guc(ct);
>>>> +    struct xe_gt *gt = guc_to_gt(guc);
>>>> +    struct guc_ctb *h2g = &ct->ctbs.h2g;
>>>> +    u32 head, tail, size;
>>>> +    s32 avail;
>>>> +
>>>> +    if (unlikely(h2g->info.broken))
>>>> +        return;
>>>> +
>>>> +    h2g->info.head = desc_read(ct_to_xe(ct), h2g, head);
>>>> +    head = h2g->info.head;
>>>> +    tail = READ_ONCE(h2g->info.tail);
>>>> +    size = h2g->info.size;
>>>> +
>>>> +    xe_gt_assert(gt, head <= size);
>>> we shouldn't trust GuC, assert is not enough
>>> goto corrupted; if this happens
>> ok.
>>>> +
>>>> +    if (unlikely(tail >= size))
>>>> +        goto corrupted;
>>>> +
>>>> +    avail = tail - head;
>>>> +
>>>> +    /* beware of buffer wrap case */
>>>> +    if (unlikely(avail < 0))
>>>> +        avail += size;
>>>> +    xe_gt_dbg(gt, "available %d (%u:%u:%u)\n", avail, head, tail,
>>>> size);
>>>> +    xe_gt_assert(gt, avail >= 0);
>>>> +
>>>> +    while (avail > 0)
>>>> +        avail = ct_update_addresses_in_buffer(ct, h2g, ggtt_shift,
>>>> &head, avail);
>>> maybe pass &avail like you did with head?
>> do we have a precedence for this approach being preferred?
> I'm not sure what you are looking for..
>
> my point is that it looks inconsistent that one in/out param is passed
> by pointer, the other by value and then it's new value is returned

No, that is one of normal approaches. Inconsistent with what?

It is actually consistent with how we handle such situation currently in xe,

for example timeout value in `dma_fence_wait_timeout()`.

That only one value can be returned this way is a fact embedded into C 
calling

conventions and basic design of C functions, having only one value 
returned by

a function is consistent with C language specification.

> if you pass both by ptr then you can use return value to indicate some
> error condition (which seems to be already there but silenced by
> returning 'no-avail')

If you want the function to also return negative error codes and handle 
them here,

let me know and I'll do it. This has no impact on the ability of 
returning `avail` value.

>>>> +
>>>> +    return;
>>>> +
>>>> +corrupted:
>>>> +    xe_gt_err(gt, "Corrupted H2G descriptor head=%u tail=%u size=%u\n",
>>> shouldn't we mention that "fixups can't be done" ?
>> Makes sense, the messages will be still received by GuC after all. Will
>> change.
>>>> +         head, tail, size);
>>>> +    h2g->info.broken = true;
>>> returning an error code wouldn't really hurt ...
>> Since when do we return error codes which are not going to be used?
>> Didn't you asked for a change to `void` in previous round of the review?
> if code can fail and caller might make some decision based on the
> success/failure then IMO we should return error code
>
> if the code can't fail, then it should be void
>
> but right now I just can't judge which scenarios that you implemented
> could fail just because of our coding mistakes, where asserts() would be
> sufficient to cover them, vs real scenarios that we should treat as
> serious recovery failures

Ok, so we agree it should be void.

I don't see any scenario where the xe kmd is expected to bail out in the 
middle of fixups procedure.

>>> +    for_each_gt(gt, xe, id) {
>>> +        struct xe_gt_sriov_vf_selfconfig *config = &gt-
>>>> sriov.vf.self_config;
>>> +
>>> +        xe_guc_ct_update_addresses(&gt->uc.guc.ct, config->ggtt_shift);
>>> this function returns int, shouldn't we check for errors?
>>> if not then maybe make it void
>>>> +}
>>>> +
>>>>    static struct xe_guc_ct_snapshot *guc_ct_snapshot_alloc(struct
>>>> xe_guc_ct *ct, bool atomic,
>>>>                                bool want_ctb)
>>>>    {
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/
>>>> xe_guc_ct.h
>>>> index 82c4ae458dda..5649bda82823 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
>>>> @@ -22,6 +22,8 @@ void xe_guc_ct_snapshot_print(struct
>>>> xe_guc_ct_snapshot *snapshot, struct drm_pr
>>>>    void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
>>>>    void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p,
>>>> bool want_ctb);
>>>>    +void xe_guc_ct_fixup_messages_with_ggtt(struct xe_guc_ct *ct, s64
>>>> ggtt_shift);
>>>> +
>>>>    static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
>>>>    {
>>>>        return ct->state == XE_GUC_CT_STATE_ENABLED;
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/
>>>> xe_guc_submit.c
>>>> index b95934055f72..4442fb00d0aa 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>>> @@ -469,12 +469,16 @@ static void __register_mlrc_exec_queue(struct
>>>> xe_guc *guc,
>>>>        action[len++] = info->context_idx;
>>>>        action[len++] = info->engine_class;
>>>>        action[len++] = info->engine_submit_mask;
>>>> +    xe_gt_assert(guc_to_gt(guc), len ==
>>>> XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_DESC);
>>>>        action[len++] = info->wq_desc_lo;
>>>>        action[len++] = info->wq_desc_hi;
>>>> +    xe_gt_assert(guc_to_gt(guc), len ==
>>>> XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_BASE);
>>>>        action[len++] = info->wq_base_lo;
>>>>        action[len++] = info->wq_base_hi;
>>>>        action[len++] = info->wq_size;
>>>> +    xe_gt_assert(guc_to_gt(guc), len ==
>>>> XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_N_CHILDREN);
>>>>        action[len++] = q->width;
>>>> +    xe_gt_assert(guc_to_gt(guc), len ==
>>>> XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_HWLRCA);
>>>>        action[len++] = info->hwlrca_lo;
>>>>        action[len++] = info->hwlrca_hi;
>>> nit: maybe this chunk, together with introduction of above enums, should
>>> be a separate patch?
>> Ok, can do that. It was introduced on your request, after all.
> but I didn't say it has to be all done in single patch
>
> if some changes are logically independent they deserve a separate patch
>
> this is also to help getting reviews sooner as patches will be smaller
>
> [1]
> https://docs.kernel.org/process/submitting-patches.html#separate-your-changes
ack.
>>>>    diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/
>>>> xe_sriov_vf.c
>>>> index 4ee8fc70a744..cd759579b9b4 100644
>>>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>>>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>>>> @@ -10,6 +10,7 @@
>>>>    #include "xe_gt.h"
>>>>    #include "xe_gt_sriov_printk.h"
>>>>    #include "xe_gt_sriov_vf.h"
>>>> +#include "xe_guc_ct.h"
>>>>    #include "xe_pm.h"
>>>>    #include "xe_sriov.h"
>>>>    #include "xe_sriov_printk.h"
>>>> @@ -158,6 +159,20 @@ static int vf_post_migration_requery_guc(struct
>>>> xe_device *xe)
>>>>        return ret;
>>>>    }
>>>>    +static void vf_post_migration_fixup_ctb(struct xe_device *xe)
>>>> +{
>>>> +    struct xe_gt *gt;
>>>> +    unsigned int id;
>>>> +
>>>> +    xe_assert(xe, IS_SRIOV_VF(xe));
>>>> +
>>>> +    for_each_gt(gt, xe, id) {
>>>> +        struct xe_gt_sriov_vf_selfconfig *config = &gt-
>>>>> sriov.vf.self_config;
>>> instead of open coding just add a helper to query the ggtt_shift
>>>
>>>      s64 xe_gt_sriov_vf_ggtt_shift(gt) { }
>> This is already a small function so I can't say I see the point. But
>> sure, can do that.
> the point is that in the 'xe' level function you are directly accessing
> a VF internal field stored deep under 'gt.sriov.vf.self_config' structure

a static function, starting with `vf_*` and stored within a file ending 
with `_vf`, is a 'xe' level function. Ok.

I will define the helper as requested, and let's just leave it at that.

>>>> +
>>>> +        xe_guc_ct_fixup_messages_with_ggtt(&gt->uc.guc.ct, config-
>>>>> ggtt_shift);
>>>> +    }
>>>> +}
>>>> +
>>>>    /*
>>>>     * vf_post_migration_imminent - Check if post-restore recovery is
>>>> coming.
>>>>     * @xe: the &xe_device struct instance
>>>> @@ -224,6 +239,9 @@ static void vf_post_migration_recovery(struct
>>>> xe_device *xe)
>>>>          err = vf_post_migration_fixup_ggtt_nodes(xe);
>>>>        /* FIXME: add the recovery steps */
>>>> +    if (err != ENODATA)
>>>> +        vf_post_migration_fixup_ctb(xe);
>>>> +
>>> do we need to have for_each_gt inside every step?
>>> maybe the loop should be here?
>>>
>>> for_each_tile() {
>>>      shift = vf_reset_ggtt_shift(tile->primary_gt)
>>>      if (shift) {
>>>          vf_fixup_nodes(tile)
>>>          vf_fixup_ctb(tile->primary_gt)
>>>          if (tile->media_gt)
>>>              vf_fixup_ctb(tile->media_gt)
>>>      }
>>> }
>> What is the benefit? Doesn't the current code look cleaner?
> IMO current code access self_config.ggtt_shift from too many places

Why would that be a problem? Where exactly is a precedence for avoiding

access of such a variable? If we didn't wanted to access it, we would 
make it

local from the beginning.

We do have `xe_gt_sriov_vf_ggtt_shift()` now, so we can use that.

>> Isn't it better when all drm_mm nodes are fixed at the point we start
>> applying fixups to other places?
> hmm, ok, so do we expect that there could be cross-tile references to
> the other tile GGTT? if yes, do we have at least asserts that can
> confirm that we are not doing fixups on the tile with un-shifted ggtt nodes?

We are shifting all the nodes of all tiles at start. Are you saying we 
then should check

if the nodes were really shifted? Why this specific operation requires 
such strong verification?

Do we expect iterating through tiles to be an operation which changes at 
runtime?


The fact that further fixups are preceded by  drm_mm node fixups is 
enforced by code flow.

If you think there should be additional asserts, please describe where 
and what the condition should be.

A check whether first balloon ends at config->ggtt_base wouldn't make 
much sense.

-Tomasz

>> I don't think it's a good idea.
>>
>> -Tomasz
>>
>>>>        vf_post_migration_notify_resfix_done(xe);
>>>>        xe_pm_runtime_put(xe);
>>>>        drm_notice(&xe->drm, "migration recovery ended\n");
--------------Itue0Wt80MMsA7tiRNwz9ym5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 15.03.2025 13:59, Michal Wajdeczko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:bbdffe55-a658-43be-b46a-5f1c9846daeb@intel.com">
      <pre wrap="" class="moz-quote-pre">On 14.03.2025 23:11, Lis, Tomasz wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 14.03.2025 21:46, Michal Wajdeczko wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 06.03.2025 23:21, Tomasz Lis wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">During post-migration recovery of a VF, it is necessary to update
GGTT references included in messages which are going to be sent
to GuC. GuC will start consuming messages after VF KMD will inform
it about fixups being done; before that, the VF KMD is expected
to update any H2G messages which are already in send buffer but
were not consumed by GuC.

Only a small subset of messages allowed for VFs have GGTT references
in them. This patch adds the functionality to parse the CTB send
ring buffer and shift addresses contained within.

While fixing the CTB content, ct-&gt;lock is not taken. This means
the only barrier taken remains GGTT address lock - which is ok,
because only requests with GGTT addresses matter, but it also means
tail changes can happen during the CTB fixups execution (which may
be ignored as any new messages will not have anything to fix).

The GGTT address locking will be introduced in a future series.

v2: removed storing shift as that's now done in VMA nodes patch;
&nbsp;&nbsp; macros to inlines; warns to asserts; log messages fixes (Michal)
v3: Removed inline keywords, enums for offsets in CTB messages,
&nbsp; less error messages, if return unused then made functs void (Michal)
v4: Update the cached head before starting fixups

Signed-off-by: Tomasz Lis<a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a>
---
&nbsp; drivers/gpu/drm/xe/abi/guc_actions_abi.h |&nbsp;&nbsp; 7 ++
&nbsp; drivers/gpu/drm/xe/xe_guc_ct.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 147 +++++++++++++++++++++++
&nbsp; drivers/gpu/drm/xe/xe_guc_ct.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 +
&nbsp; drivers/gpu/drm/xe/xe_guc_submit.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 4 +
&nbsp; drivers/gpu/drm/xe/xe_sriov_vf.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 18 +++
&nbsp; 5 files changed, 178 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/
drm/xe/abi/guc_actions_abi.h
index ec516e838ee8..dde6cb5a6be9 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
@@ -160,6 +160,13 @@ enum xe_guc_preempt_options {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_GUC_PREEMPT_OPTION_DROP_SUBMIT_Q = 0x8,
&nbsp; };
&nbsp; +enum xe_guc_register_context_multi_lrc_param_offsets {
+&nbsp;&nbsp;&nbsp; XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_DESC = 5,
+&nbsp;&nbsp;&nbsp; XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_BASE = 7,
+&nbsp;&nbsp;&nbsp; XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_N_CHILDREN = 10,
+&nbsp;&nbsp;&nbsp; XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_HWLRCA = 11
+};
+
&nbsp; enum xe_guc_report_status {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_GUC_REPORT_STATUS_UNKNOWN = 0x0,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_GUC_REPORT_STATUS_ACKED = 0x1,
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/
xe_guc_ct.c
index 72ad576fc18e..6f19bf9565ba 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -84,6 +84,8 @@ struct g2h_fence {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool done;
&nbsp; };
&nbsp; +#define make_u64(hi, lo) ((u64)((u64)(u32)(hi) &lt;&lt; 32 | (u32)(lo)))
+
&nbsp; static void g2h_fence_init(struct g2h_fence *g2h_fence, u32
*response_buffer)
&nbsp; {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g2h_fence-&gt;response_buffer = response_buffer;
@@ -1622,6 +1624,151 @@ static void g2h_worker_func(struct
work_struct *w)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; receive_g2h(ct);
&nbsp; }
&nbsp; +static u32 ctb_read32(struct xe_device *xe, struct iosys_map *cmds,
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">maybe to make this function more &quot;ctb&quot;, pass ctb instead xe?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">You mean `struct xe_guc_ct *ct`?

I don't understand, why would we do this? We don't even need `ct` there.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">if it doesn't need 'ct' then don't use 'ctb' prefix</pre>
    </blockquote>
    ok, will change.<br>
    <blockquote type="cite" cite="mid:bbdffe55-a658-43be-b46a-5f1c9846daeb@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">That would just add another `ct_to_xe(ct)`.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">maybe not another, but just moved, as then the caller doesn't need to
have it

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">If we're adjusting parameters to what looks nicer rather than what is
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">it's not always just about the look, but it's about proper layering

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">really necessary, then why `xe_map_memcpy_from` accepts `xe` and not a
`bo`?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">feel free to ask authors, this was introduced (without review) as part
of the initial Xe commit dd08ebf6c352

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 head, u32 pos)
+{
+&nbsp;&nbsp;&nbsp; u32 msg[1];
+
+&nbsp;&nbsp;&nbsp; xe_map_memcpy_from(xe, msg, cmds, (head + pos) * sizeof(u32),
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1 * sizeof(u32));
+&nbsp;&nbsp;&nbsp; return msg[0];
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">and looks almost like our deprecated xe_map_read32 ;)
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">yes, it does look similar. But I assume we don't want to reuse that?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">well, it depends.

since it is already there, IMO we should use it.

OTOH, during some other review it was said that maybe the whole xe_map
layer will go away, so then no need to use it, but equally, no need to
use _any_ of other xe_map wrappers, so need for having a xe is also gone

but as there are no signs that xe_map will be removed, we should
continue to reuse existing code

unless @Lucas has some more recent news</pre>
    </blockquote>
    ok, will use `xe_map_rd()`.<br>
    <blockquote type="cite" cite="mid:bbdffe55-a658-43be-b46a-5f1c9846daeb@intel.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+}
+
+static void ctb_fixup64(struct xe_device *xe, struct iosys_map *cmds,
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 head, u32 pos, s64 shift)
+{
+&nbsp;&nbsp;&nbsp; u32 msg[2];
+&nbsp;&nbsp;&nbsp; u64 offset;
+
+&nbsp;&nbsp;&nbsp; xe_map_memcpy_from(xe, msg, cmds, (head + pos) * sizeof(u32),
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2 * sizeof(u32));
+&nbsp;&nbsp;&nbsp; offset = make_u64(msg[1], msg[0]);
+&nbsp;&nbsp;&nbsp; offset += shift;
+&nbsp;&nbsp;&nbsp; msg[0] = lower_32_bits(offset);
+&nbsp;&nbsp;&nbsp; msg[1] = upper_32_bits(offset);
+&nbsp;&nbsp;&nbsp; xe_map_memcpy_to(xe, cmds, (head + pos) * sizeof(u32), msg, 2 *
sizeof(u32));
+}
+
+/*
+ * ct_update_addresses_in_message - Shift any GGTT addresses within
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">nit: as this is *not* a real kernel-doc, then maybe drop function name
and keep only description plus params?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">will do, even though I don't know why we break the sibling rules which
could be easily kept.

</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+ * a single message left within CTB from before post-migration
recovery.
+ * @ct: pointer to CT struct of the target GuC
+ * @cmds: iomap buffer containing CT messages
+ * @head: start of the target message within the buffer
+ * @len: length of the target message
+ * @size: size of the commands buffer
+ * @shift: the address shift to be added to each GGTT reference
+ */
+static void ct_update_addresses_in_message(struct xe_guc_ct *ct,
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct iosys_map *cmds, u32 head,
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 len, u32 size, s64 shift)
+{
+&nbsp;&nbsp;&nbsp; struct xe_device *xe = ct_to_xe(ct);
+&nbsp;&nbsp;&nbsp; u32 action, i, n;
+&nbsp;&nbsp;&nbsp; u32 msg[1];
+
+&nbsp;&nbsp;&nbsp; xe_map_memcpy_from(xe, msg, cmds, head * sizeof(u32),
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1 * sizeof(u32));
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">ctb_read32() didn't work here?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">It would. For G2H and H2G messages we always use FIELD_GET on an array,
and field name contains index in that array.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">hmm, not sure if I follow here... what was wrong with:

	msg = ctb_read32(...)
or
	msg = xe_map_read32(...)

you could still use FIELD_GET from the 'msg' var</pre>
    </blockquote>
    <p>As I explained, currently FIELD_GET is consistently called on an
      array. To confirm, use:<br>
    </p>
    <p>```</p>
    <p>$ grep -R&nbsp; 'FIELD_GET[\(]' drivers/gpu/drm/xe/xe_guc_ct.c<br>
    </p>
    <p>```</p>
    <p>You will find either `hxg[0]` or `msg[0]` in all lines.<br>
    </p>
    <blockquote type="cite" cite="mid:bbdffe55-a658-43be-b46a-5f1c9846daeb@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">So, I consider this way of writing it more standard within Xe, and
therefore easier to understand. Though no strong opinion - let me know
if you want this changed.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">but then you are little inconsistent, you defined new helper but then
decided to access data without it</pre>
    </blockquote>
    <p>The helper was defined on your request:</p>
    <p><!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:AllowPNG/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:View>Normal</w:View>
  <w:Zoom>0</w:Zoom>
  <w:TrackMoves/>
  <w:TrackFormatting/>
  <w:PunctuationKerning/>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:DoNotPromoteQF/>
  <w:LidThemeOther>EN-US</w:LidThemeOther>
  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>
  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:DontGrowAutofit/>
   <w:SplitPgBreakAndParaMark/>
   <w:EnableOpenTypeKerning/>
   <w:DontFlipMirrorIndents/>
   <w:OverrideTableStyleHps/>
  </w:Compatibility>
  <w:DoNotOptimizeForBrowser/>
  <m:mathPr>
   <m:mathFont m:val="Cambria Math"/>
   <m:brkBin m:val="before"/>
   <m:brkBinSub m:val="&#45;-"/>
   <m:smallFrac m:val="off"/>
   <m:dispDef/>
   <m:lMargin m:val="0"/>
   <m:rMargin m:val="0"/>
   <m:defJc m:val="centerGroup"/>
   <m:wrapIndent m:val="1440"/>
   <m:intLim m:val="subSup"/>
   <m:naryLim m:val="undOvr"/>
  </m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="false"
  DefSemiHidden="false" DefQFormat="false" DefPriority="99"
  LatentStyleCount="376">
  <w:LsdException Locked="false" Priority="0" QFormat="true" Name="Normal"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 1"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 2"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 3"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 4"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 5"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 6"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 7"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 8"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 9"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 1"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 2"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 3"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 4"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 5"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 6"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 7"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 8"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="header"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footer"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index heading"/>
  <w:LsdException Locked="false" Priority="35" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="caption"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of figures"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope return"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="line number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="page number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of authorities"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="macro"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="toa heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 5"/>
  <w:LsdException Locked="false" Priority="10" QFormat="true" Name="Title"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Closing"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Signature"/>
  <w:LsdException Locked="false" Priority="1" SemiHidden="true"
   UnhideWhenUsed="true" Name="Default Paragraph Font"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Message Header"/>
  <w:LsdException Locked="false" Priority="11" QFormat="true" Name="Subtitle"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Salutation"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Date"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Note Heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Block Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="FollowedHyperlink"/>
  <w:LsdException Locked="false" Priority="22" QFormat="true" Name="Strong"/>
  <w:LsdException Locked="false" Priority="20" QFormat="true" Name="Emphasis"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Document Map"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Plain Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="E-mail Signature"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Top of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Bottom of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal (Web)"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Acronym"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Cite"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Code"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Definition"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Keyboard"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Preformatted"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Sample"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Typewriter"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Variable"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Table"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation subject"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="No List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Contemporary"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Elegant"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Professional"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Balloon Text"/>
  <w:LsdException Locked="false" Priority="39" Name="Table Grid"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Theme"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Placeholder Text"/>
  <w:LsdException Locked="false" Priority="1" QFormat="true" Name="No Spacing"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 1"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 1"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Revision"/>
  <w:LsdException Locked="false" Priority="34" QFormat="true"
   Name="List Paragraph"/>
  <w:LsdException Locked="false" Priority="29" QFormat="true" Name="Quote"/>
  <w:LsdException Locked="false" Priority="30" QFormat="true"
   Name="Intense Quote"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 1"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 1"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 2"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 2"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 2"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 3"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 3"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 3"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 4"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 4"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 4"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 5"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 5"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 5"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 6"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 6"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 6"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="19" QFormat="true"
   Name="Subtle Emphasis"/>
  <w:LsdException Locked="false" Priority="21" QFormat="true"
   Name="Intense Emphasis"/>
  <w:LsdException Locked="false" Priority="31" QFormat="true"
   Name="Subtle Reference"/>
  <w:LsdException Locked="false" Priority="32" QFormat="true"
   Name="Intense Reference"/>
  <w:LsdException Locked="false" Priority="33" QFormat="true" Name="Book Title"/>
  <w:LsdException Locked="false" Priority="37" SemiHidden="true"
   UnhideWhenUsed="true" Name="Bibliography"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="TOC Heading"/>
  <w:LsdException Locked="false" Priority="41" Name="Plain Table 1"/>
  <w:LsdException Locked="false" Priority="42" Name="Plain Table 2"/>
  <w:LsdException Locked="false" Priority="43" Name="Plain Table 3"/>
  <w:LsdException Locked="false" Priority="44" Name="Plain Table 4"/>
  <w:LsdException Locked="false" Priority="45" Name="Plain Table 5"/>
  <w:LsdException Locked="false" Priority="40" Name="Grid Table Light"/>
  <w:LsdException Locked="false" Priority="46" Name="Grid Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="Grid Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="Grid Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="46" Name="List Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="List Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="List Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hashtag"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Unresolved Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Link"/>
 </w:LatentStyles>
</xml><![endif]--><!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-parent:"";
	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
	mso-para-margin:0cm;
	mso-pagination:widow-orphan;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ascii-font-family:Aptos;
	mso-ascii-theme-font:minor-latin;
	mso-hansi-font-family:Aptos;
	mso-hansi-theme-font:minor-latin;
	mso-font-kerning:1.0pt;
	mso-ligatures:standardcontextual;}
</style>
<![endif]--> </p>
    <p class="MsoPlainText">&gt; those macros are quite ugly and
      violating many rules maybe they should be converted into inlines?</p>
    <p class="MsoPlainText">I did not intended to have such helper.<br>
    </p>
    <blockquote type="cite" cite="mid:bbdffe55-a658-43be-b46a-5f1c9846daeb@intel.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+&nbsp;&nbsp;&nbsp; action = FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, msg[0]);
+&nbsp;&nbsp;&nbsp; switch (action) {
+&nbsp;&nbsp;&nbsp; case XE_GUC_ACTION_REGISTER_CONTEXT:
+&nbsp;&nbsp;&nbsp; case XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC:
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* field wq_desc */
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">as we have enums that describe field offsets, we don't need to add those
small now redundant comments
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">will remove.
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ctb_fixup64(xe, cmds, head,
XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_DESC, shift);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* field wq_base */
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ctb_fixup64(xe, cmds, head,
XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_BASE, shift);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (action == XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC) {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* field number_children */
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; n = ctb_read32(xe, cmds, head,
XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_N_CHILDREN);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* field hwlrca and child lrcas */
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i = 0; i &lt; n; i++)
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ctb_fixup64(xe, cmds, head,
XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_HWLRCA + 2 * i, shift);
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">did you run checkpatch.pl ? line is quite long
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">it does complain. Will fix.
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* field hwlrca */
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ctb_fixup64(xe, cmds, head, 10, shift);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;
+&nbsp;&nbsp;&nbsp; default:
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;
+&nbsp;&nbsp;&nbsp; }
+}
+
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">nit: no short description here ;)
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">why would it need one? sub-function (ct_update_addresses_in_message) has
documentation, caller also has documentation.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">well, it was just inconsistency, in other places you seems to add
documentation even if there is no</pre>
    </blockquote>
    <p>Functions which need documentation are documented. This is not an
      inconsistency, this is</p>
    <p>context based decision which completely aligns with both kernel
      documentation rules and recommendations.</p>
    <p>What is inconsistent is using custom documentation format, not
      defined in any kernel guides.</p>
    <p>If we want a function doc to not be visible by kernel-doc
      parsers, it makes total sense to skip the one</p>
    <p>asterisk to make it treated as an ordinary comment. But following
      that by also changing format of</p>
    <p>the comment into some custom idea, that is questionable and
      inconsistent with existing rules.<br>
    </p>
    <blockquote type="cite" cite="mid:bbdffe55-a658-43be-b46a-5f1c9846daeb@intel.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+static int ct_update_addresses_in_buffer(struct xe_guc_ct *ct,
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct guc_ctb *h2g,
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s64 shift, u32 *mhead, s32 avail)
+{
+&nbsp;&nbsp;&nbsp; struct xe_device *xe = ct_to_xe(ct);
+&nbsp;&nbsp;&nbsp; u32 head = *mhead;
+&nbsp;&nbsp;&nbsp; u32 size = h2g-&gt;info.size;
+&nbsp;&nbsp;&nbsp; u32 msg[1];
+&nbsp;&nbsp;&nbsp; u32 len;
+
+&nbsp;&nbsp;&nbsp; /* Read header */
+&nbsp;&nbsp;&nbsp; xe_map_memcpy_from(xe, msg, &amp;h2g-&gt;cmds, sizeof(u32) * head,
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sizeof(u32));
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">ctb_read32() didn't work here?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Like before, for consistency. Will change on request.
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+&nbsp;&nbsp;&nbsp; len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) +
GUC_CTB_MSG_MIN_LEN;
+
+&nbsp;&nbsp;&nbsp; if (unlikely(len &gt; (u32)avail)) {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_gt *gt = ct_to_gt(ct);
</pre>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">btw, no need to have local var here, since you can do ct_to_gt()
directly in the xe_gt_err() below (it's the only use case)</pre>
    </blockquote>
    will change.<br>
    <blockquote type="cite" cite="mid:bbdffe55-a658-43be-b46a-5f1c9846daeb@intel.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_gt_err(gt, &quot;H2G channel broken on read, avail=%d, len=%d,
fixups skipped\n&quot;,
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; avail, len);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">in caller we do mark ctb as broken, why are we silent here?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Incorrect head/tail of a CTB is an issue of completely different caliber
than a message with invalid length.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">not sure if those errors are that different.
see CTB descriptor status codes:

	GUC_CTB_STATUS_OVERFLOW
	GUC_CTB_STATUS_UNDERFLOW

which are used exactly to classify those kind of errors

if we are able to read msg header from the CTB but there is no payload
data on CTB then it's a CTB protocol bug</pre>
    </blockquote>
    <p>We are not in CTB write function, we are fixing the existing CTB
      messages,</p>
    <p>stored there by the CTB write function.</p>
    <p>But this situation should never happen anyway, so I don't have
      any reason to push</p>
    <p>a specific solution. Just write how you want this handled, and I
      will adjust the code.<br>
    </p>
    <blockquote type="cite" cite="mid:bbdffe55-a658-43be-b46a-5f1c9846daeb@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">The invalid message is actually more likely to be a racing condition
rather than CTB damage.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">racing with what?</pre>
    </blockquote>
    <p>With CTB write function changing the tail, and GuC changing the
      head.</p>
    <p>Both should be normally locked/stalled of course, but there are
      corner cases,</p>
    <p>around migrating again just after vcpu started from previous
      migration.<br>
    </p>
    <blockquote type="cite" cite="mid:bbdffe55-a658-43be-b46a-5f1c9846daeb@intel.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+&nbsp;&nbsp;&nbsp; }
+
+&nbsp;&nbsp;&nbsp; head = (head + 1) % size;
+&nbsp;&nbsp;&nbsp; ct_update_addresses_in_message(ct, &amp;h2g-&gt;cmds, head, len - 1,
size, shift);
+&nbsp;&nbsp;&nbsp; *mhead = (head + len - 1) % size;
+
+&nbsp;&nbsp;&nbsp; return avail - len;
+}
+
+/**
+ * xe_guc_ct_fixup_messages_with_ggtt - Fixup any pending H2G CTB
messages by updating
+ * GGTT offsets in their payloads.
+ * @ct: pointer to CT struct of the target GuC
+ * @ggtt_shift: shift to be added to all GGTT addresses within the CTB
+ */
+void xe_guc_ct_fixup_messages_with_ggtt(struct xe_guc_ct *ct, s64
ggtt_shift)
+{
+&nbsp;&nbsp;&nbsp; struct xe_guc *guc = ct_to_guc(ct);
+&nbsp;&nbsp;&nbsp; struct xe_gt *gt = guc_to_gt(guc);
+&nbsp;&nbsp;&nbsp; struct guc_ctb *h2g = &amp;ct-&gt;ctbs.h2g;
+&nbsp;&nbsp;&nbsp; u32 head, tail, size;
+&nbsp;&nbsp;&nbsp; s32 avail;
+
+&nbsp;&nbsp;&nbsp; if (unlikely(h2g-&gt;info.broken))
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;
+
+&nbsp;&nbsp;&nbsp; h2g-&gt;info.head = desc_read(ct_to_xe(ct), h2g, head);
+&nbsp;&nbsp;&nbsp; head = h2g-&gt;info.head;
+&nbsp;&nbsp;&nbsp; tail = READ_ONCE(h2g-&gt;info.tail);
+&nbsp;&nbsp;&nbsp; size = h2g-&gt;info.size;
+
+&nbsp;&nbsp;&nbsp; xe_gt_assert(gt, head &lt;= size);
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">we shouldn't trust GuC, assert is not enough
goto corrupted; if this happens
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">ok.
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+
+&nbsp;&nbsp;&nbsp; if (unlikely(tail &gt;= size))
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto corrupted;
+
+&nbsp;&nbsp;&nbsp; avail = tail - head;
+
+&nbsp;&nbsp;&nbsp; /* beware of buffer wrap case */
+&nbsp;&nbsp;&nbsp; if (unlikely(avail &lt; 0))
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; avail += size;
+&nbsp;&nbsp;&nbsp; xe_gt_dbg(gt, &quot;available %d (%u:%u:%u)\n&quot;, avail, head, tail,
size);
+&nbsp;&nbsp;&nbsp; xe_gt_assert(gt, avail &gt;= 0);
+
+&nbsp;&nbsp;&nbsp; while (avail &gt; 0)
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; avail = ct_update_addresses_in_buffer(ct, h2g, ggtt_shift,
&amp;head, avail);
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">maybe pass &amp;avail like you did with head?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">do we have a precedence for this approach being preferred?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">I'm not sure what you are looking for..

my point is that it looks inconsistent that one in/out param is passed
by pointer, the other by value and then it's new value is returned</pre>
    </blockquote>
    <p>No, that is one of normal approaches. Inconsistent with what?</p>
    <p>It is actually consistent with how we handle such situation
      currently in xe,</p>
    <p>for example timeout value in `dma_fence_wait_timeout()`.</p>
    <p>That only one value can be returned this way is a fact embedded
      into C calling</p>
    <p>conventions and basic design of C functions, having only one
      value returned by</p>
    <p>a function is consistent with C language specification.<br>
    </p>
    <blockquote type="cite" cite="mid:bbdffe55-a658-43be-b46a-5f1c9846daeb@intel.com">
      <pre wrap="" class="moz-quote-pre">if you pass both by ptr then you can use return value to indicate some
error condition (which seems to be already there but silenced by
returning 'no-avail')</pre>
    </blockquote>
    <p>If you want the function to also return negative error codes and
      handle them here,</p>
    <p>let me know and I'll do it. This has no impact on the ability of
      returning `avail` value.<br>
    </p>
    <blockquote type="cite" cite="mid:bbdffe55-a658-43be-b46a-5f1c9846daeb@intel.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+
+&nbsp;&nbsp;&nbsp; return;
+
+corrupted:
+&nbsp;&nbsp;&nbsp; xe_gt_err(gt, &quot;Corrupted H2G descriptor head=%u tail=%u size=%u\n&quot;,
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">shouldn't we mention that &quot;fixups can't be done&quot; ?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Makes sense, the messages will be still received by GuC after all. Will
change.
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; head, tail, size);
+&nbsp;&nbsp;&nbsp; h2g-&gt;info.broken = true;
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">returning an error code wouldn't really hurt ...
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Since when do we return error codes which are not going to be used?
Didn't you asked for a change to `void` in previous round of the review?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">if code can fail and caller might make some decision based on the
success/failure then IMO we should return error code

if the code can't fail, then it should be void

but right now I just can't judge which scenarios that you implemented
could fail just because of our coding mistakes, where asserts() would be
sufficient to cover them, vs real scenarios that we should treat as
serious recovery failures</pre>
    </blockquote>
    <p>Ok, so we agree it should be void.<br>
    </p>
    <p>I don't see any scenario where the xe kmd is expected to bail out
      in the middle of fixups procedure.</p>
    <blockquote type="cite" cite="mid:bbdffe55-a658-43be-b46a-5f1c9846daeb@intel.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">+&nbsp;&nbsp;&nbsp; for_each_gt(gt, xe, id) {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_gt_sriov_vf_selfconfig *config = &amp;gt-
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">sriov.vf.self_config;
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">+
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_guc_ct_update_addresses(&amp;gt-&gt;uc.guc.ct, config-&gt;ggtt_shift);
</pre>
        </blockquote>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">this function returns int, shouldn't we check for errors?
if not then maybe make it void
</pre>
        </blockquote>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+}
+
&nbsp; static struct xe_guc_ct_snapshot *guc_ct_snapshot_alloc(struct
xe_guc_ct *ct, bool atomic,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool want_ctb)
&nbsp; {
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/
xe_guc_ct.h
index 82c4ae458dda..5649bda82823 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -22,6 +22,8 @@ void xe_guc_ct_snapshot_print(struct
xe_guc_ct_snapshot *snapshot, struct drm_pr
&nbsp; void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
&nbsp; void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p,
bool want_ctb);
&nbsp; +void xe_guc_ct_fixup_messages_with_ggtt(struct xe_guc_ct *ct, s64
ggtt_shift);
+
&nbsp; static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
&nbsp; {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ct-&gt;state == XE_GUC_CT_STATE_ENABLED;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/
xe_guc_submit.c
index b95934055f72..4442fb00d0aa 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -469,12 +469,16 @@ static void __register_mlrc_exec_queue(struct
xe_guc *guc,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; action[len++] = info-&gt;context_idx;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; action[len++] = info-&gt;engine_class;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; action[len++] = info-&gt;engine_submit_mask;
+&nbsp;&nbsp;&nbsp; xe_gt_assert(guc_to_gt(guc), len ==
XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_DESC);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; action[len++] = info-&gt;wq_desc_lo;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; action[len++] = info-&gt;wq_desc_hi;
+&nbsp;&nbsp;&nbsp; xe_gt_assert(guc_to_gt(guc), len ==
XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_BASE);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; action[len++] = info-&gt;wq_base_lo;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; action[len++] = info-&gt;wq_base_hi;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; action[len++] = info-&gt;wq_size;
+&nbsp;&nbsp;&nbsp; xe_gt_assert(guc_to_gt(guc), len ==
XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_N_CHILDREN);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; action[len++] = q-&gt;width;
+&nbsp;&nbsp;&nbsp; xe_gt_assert(guc_to_gt(guc), len ==
XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_HWLRCA);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; action[len++] = info-&gt;hwlrca_lo;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; action[len++] = info-&gt;hwlrca_hi;
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">nit: maybe this chunk, together with introduction of above enums, should
be a separate patch?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Ok, can do that. It was introduced on your request, after all.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">but I didn't say it has to be all done in single patch

if some changes are logically independent they deserve a separate patch

this is also to help getting reviews sooner as patches will be smaller

[1]
<a class="moz-txt-link-freetext" href="https://docs.kernel.org/process/submitting-patches.html#separate-your-changes">https://docs.kernel.org/process/submitting-patches.html#separate-your-changes</a></pre>
    </blockquote>
    ack.<br>
    <blockquote type="cite" cite="mid:bbdffe55-a658-43be-b46a-5f1c9846daeb@intel.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">&nbsp; diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/
xe_sriov_vf.c
index 4ee8fc70a744..cd759579b9b4 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -10,6 +10,7 @@
&nbsp; #include &quot;xe_gt.h&quot;
&nbsp; #include &quot;xe_gt_sriov_printk.h&quot;
&nbsp; #include &quot;xe_gt_sriov_vf.h&quot;
+#include &quot;xe_guc_ct.h&quot;
&nbsp; #include &quot;xe_pm.h&quot;
&nbsp; #include &quot;xe_sriov.h&quot;
&nbsp; #include &quot;xe_sriov_printk.h&quot;
@@ -158,6 +159,20 @@ static int vf_post_migration_requery_guc(struct
xe_device *xe)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;
&nbsp; }
&nbsp; +static void vf_post_migration_fixup_ctb(struct xe_device *xe)
+{
+&nbsp;&nbsp;&nbsp; struct xe_gt *gt;
+&nbsp;&nbsp;&nbsp; unsigned int id;
+
+&nbsp;&nbsp;&nbsp; xe_assert(xe, IS_SRIOV_VF(xe));
+
+&nbsp;&nbsp;&nbsp; for_each_gt(gt, xe, id) {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_gt_sriov_vf_selfconfig *config = &amp;gt-
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">sriov.vf.self_config;
</pre>
            </blockquote>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">instead of open coding just add a helper to query the ggtt_shift

&nbsp;&nbsp;&nbsp;&nbsp;s64 xe_gt_sriov_vf_ggtt_shift(gt) { }
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">This is already a small function so I can't say I see the point. But
sure, can do that.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">the point is that in the 'xe' level function you are directly accessing
a VF internal field stored deep under 'gt.sriov.vf.self_config' structure</pre>
    </blockquote>
    <p>a static function, starting with `vf_*` and stored within a file
      ending with `_vf`, is a 'xe' level function. Ok.<br>
    </p>
    <p>I will define the helper as requested, and let's just leave it at
      that.<br>
    </p>
    <blockquote type="cite" cite="mid:bbdffe55-a658-43be-b46a-5f1c9846daeb@intel.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_guc_ct_fixup_messages_with_ggtt(&amp;gt-&gt;uc.guc.ct, config-
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">ggtt_shift);
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">+&nbsp;&nbsp;&nbsp; }
+}
+
&nbsp; /*
&nbsp;&nbsp; * vf_post_migration_imminent - Check if post-restore recovery is
coming.
&nbsp;&nbsp; * @xe: the &amp;xe_device struct instance
@@ -224,6 +239,9 @@ static void vf_post_migration_recovery(struct
xe_device *xe)
&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err = vf_post_migration_fixup_ggtt_nodes(xe);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* FIXME: add the recovery steps */
+&nbsp;&nbsp;&nbsp; if (err != ENODATA)
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vf_post_migration_fixup_ctb(xe);
+
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">do we need to have for_each_gt inside every step?
maybe the loop should be here?

for_each_tile() {
&nbsp;&nbsp;&nbsp;&nbsp;shift = vf_reset_ggtt_shift(tile-&gt;primary_gt)
&nbsp;&nbsp;&nbsp;&nbsp;if (shift) {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vf_fixup_nodes(tile)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vf_fixup_ctb(tile-&gt;primary_gt)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (tile-&gt;media_gt)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vf_fixup_ctb(tile-&gt;media_gt)
&nbsp;&nbsp;&nbsp;&nbsp;}
}
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">What is the benefit? Doesn't the current code look cleaner?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">IMO current code access self_config.ggtt_shift from too many places</pre>
    </blockquote>
    <p>Why would that be a problem? Where exactly is a precedence for
      avoiding</p>
    <p>access of such a variable? If we didn't wanted to access it, we
      would make it</p>
    <p>local from the beginning.</p>
    <p>We do have `<span style="white-space: pre-wrap">xe_gt_sriov_vf_ggtt_shift()` now, so we can use that.</span></p>
    <blockquote type="cite" cite="mid:bbdffe55-a658-43be-b46a-5f1c9846daeb@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Isn't it better when all drm_mm nodes are fixed at the point we start
applying fixups to other places?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">hmm, ok, so do we expect that there could be cross-tile references to
the other tile GGTT? if yes, do we have at least asserts that can
confirm that we are not doing fixups on the tile with un-shifted ggtt nodes?</pre>
    </blockquote>
    <p>We are shifting all the nodes of all tiles at start. Are you
      saying we then should check</p>
    <p>if the nodes were really shifted? Why this specific operation
      requires such strong verification?</p>
    <p>Do we expect iterating through tiles to be an operation which
      changes at runtime?</p>
    <p><br>
    </p>
    <p>The fact that further fixups are preceded by&nbsp; drm_mm node fixups
      is enforced by code flow.</p>
    <p>If you think there should be additional asserts, please describe
      where and what the condition should be.</p>
    <p>A check whether first balloon ends at config-&gt;ggtt_base
      wouldn't make much sense.</p>
    <p>-Tomasz<br>
    </p>
    <blockquote type="cite" cite="mid:bbdffe55-a658-43be-b46a-5f1c9846daeb@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">I don't think it's a good idea.

-Tomasz

</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vf_post_migration_notify_resfix_done(xe);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_pm_runtime_put(xe);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_notice(&amp;xe-&gt;drm, &quot;migration recovery ended\n&quot;);
</pre>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------Itue0Wt80MMsA7tiRNwz9ym5--
