Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C08BD29FAB
	for <intel-xe@archiver.kernel.org>; Thu,  4 Dec 2025 18:22:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB4110E9A5;
	Thu,  4 Dec 2025 18:22:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DcoaH5cC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C4B310E9A5
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Dec 2025 18:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764872573; x=1796408573;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=taRr+IEEX70uVFMk+RLOOfFgXCfecChYkyk09mscQeY=;
 b=DcoaH5cCxr52TJAbCOFbE82LXud9IwoyyQVReU6rk74IvyBFOkJMDqNF
 WmbkozqPyhF2RNFNbdJH7LLJ7J70rtLcm4O0DvDZma3iDJD7HdPJQuTUl
 +b6Poxg/+GCXhcg7+FPmj/MZbXEnGsfjxPRld1SRqiyIOpaoJGzjkzvVZ
 glBxtAc2chlL31zqOXgkCP9gOo0FWhwGavDnqZFhGyFDO9En3SeLXBTM9
 tE8kb8KoNtor2ZW5WRcuvt8RI4lZtcGN22I5r5M/IdErWmq+0QVO33VGq
 CaAMtrABAn6JlpFE89lRb3iNHXwVXXUdmwiRXYwzFaglmttp/VARtWQpV g==;
X-CSE-ConnectionGUID: xxNa8/AESg60YVKwrBBZXA==
X-CSE-MsgGUID: V0wzcNQEQySb+7w9+j0f1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="65900152"
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; d="scan'208";a="65900152"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 10:22:53 -0800
X-CSE-ConnectionGUID: OU9eqIocQOa7oIyGN5+wqg==
X-CSE-MsgGUID: C+fjZBqvQXWk3a6GVRiB5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; d="scan'208";a="200018190"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 10:22:53 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 10:22:52 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 10:22:52 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.71)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 10:22:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iIkozusB48dA/ewKMRK7gLgJ71YO2zwPb8+D8brMh+n0JACeWBtoRhlAIlDwDWSLckcSwplEmYON6JwWbMnRvC5qymxd0JE/Gw2QXCUntsJwPjntBFua9J0lPON6g5Qoj63RujgkhK/l2Z81HgGKXIsliVyiXRIoLNDTMZzzf69Ji0zb0RjtvNJDnkTgrvQh8d3cp7AKqxSm09IOVYsb2RKf0yxa2S5poGBci46trsLH+eM9KKZIiI7GioApcb89/SD81Xx+tG7C2HAdPMFVxjDZE2xLR68B9uybu0gFPDwT18xMWkSNxzDptAvlTpN9HFTyhdkMK9TfC3rCkBo87A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9r8JQEl1COYLSrKCVkPHkhx2Tau3BIThWKav3M8A3g=;
 b=rDoN3OVJKfApzDnHFYXubLP9Sli6Zmp/Waxc5buoXdhZ7lweNgcBw89O3WPJtU5j/hjvO6AnCz4TaGXOPiWVRraB6PD8rr9FyRfhTTweNJH5lLD+mAXzcfZu7LE5+xJ5abzcTsfRojTU8KZ2mTK9MVMD34vzu8xCbd0/XXldZ6g2nhSC7pyUbfK642kwrhRZSVHNK+fbbvVlK2840Kq2KgAvQqFPLkdrEqXLY/FuX/OWqgw3rxBkCGvlTxMSV8yOZVLzncNT0utT2lczzpLRZJMKZC+Jo8TkQeWZYHeO/9OB6KmLAFuJB0iIBoE4sVxGTcRjQ2PTe13JIQQZb2qhXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CO1PR11MB5185.namprd11.prod.outlook.com (2603:10b6:303:6e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 18:22:50 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 18:22:50 +0000
Date: Thu, 4 Dec 2025 10:22:47 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Wang, X" <x.wang@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "Nikula, Jani" <jani.nikula@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH v5 2/2] drm/xe: expose PAT software config to debugfs
Message-ID: <20251204182247.GD4164497@mdroper-desk1.amr.corp.intel.com>
References: <20251117230156.366860-1-x.wang@intel.com>
 <20251203225355.24972-1-x.wang@intel.com>
 <20251203225355.24972-2-x.wang@intel.com>
 <20251203231115.GQ4065316@mdroper-desk1.amr.corp.intel.com>
 <SA3PR11MB8046FC1CA452CD5ABFD81F8586A6A@SA3PR11MB8046.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SA3PR11MB8046FC1CA452CD5ABFD81F8586A6A@SA3PR11MB8046.namprd11.prod.outlook.com>
X-ClientProxiedBy: CH0PR13CA0049.namprd13.prod.outlook.com
 (2603:10b6:610:b2::24) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CO1PR11MB5185:EE_
X-MS-Office365-Filtering-Correlation-Id: 9926020c-386f-422d-1902-08de336221b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M3Uwckt5QkVPbDdpQ1hqci9xaG9vM2lFMmR3OVpVeCttLzFhbW0vcUNtUC9q?=
 =?utf-8?B?RGlPUlhhVnF1cllEMm4wb2FkVXlFUUc5TGdvcndtcEFNSEVIVTE3MzJaVmVN?=
 =?utf-8?B?U3FKSnArOFR4djNFVElDOUJBYkV1ckx4QzVqV2VheW9JeUZ3aXhQR3krcGFP?=
 =?utf-8?B?VnE1RXYxNGYrUjJ3cDdtT2t6K3VpRzZRWkx0N0tlYk9UUzk2T1d5OHpWZzhl?=
 =?utf-8?B?Tmw5OHlRcFc1SVgvVHljb05qUUFFVnRjWi90ODJsQXpVRWJSSUU1bFE1TWVT?=
 =?utf-8?B?YjJYTHZqZVlEZ1ZYdC82S2pQbXB3a21PYnRTdXE0eFNPNTYzSVBkb3l1V3VP?=
 =?utf-8?B?R1d3QWptSDRHbkt0Vy9YWjdBRm5BUWVLQXFBWHJEQmpjNGNGQTBaSmFwZUdm?=
 =?utf-8?B?TVkydElaTzRvV1NhV1VoT29QK2dvdGFlT2N1bExPL0phc0lyNWdkVVlYdGpj?=
 =?utf-8?B?cXcySFZ4TzZidXdabUVYVlIzYlgxc25ENWswcVlTUXVRLzJtZkhjdkxJcWZU?=
 =?utf-8?B?clFUMFgzS1l6dmZMelNtb3pTK1M4eGdSSmxTN1oxdEtFRXBTdGpmSFh2cU1l?=
 =?utf-8?B?TlhIOVBLRmJOWHNISDI2VXdzS1IwdU5iNk9ZL0FjaHJtK0JLczhyM2VXdGxQ?=
 =?utf-8?B?RTVGSEI2K2NnaURES25reU5KK2hONTdmcjJBcVpwOG51L1VoWmhHQkVMQ3N2?=
 =?utf-8?B?UERSNXhVSVFaa2ZPTWc1ZVB4UFkxb1FsNmhYUld0elZHN1VKZ0Jldy93RmVW?=
 =?utf-8?B?NGs2bERlS3NiVkpXUTRKQm1BRDMrYWxVeldLOVlyNHZIOHJ0cnorVFMzcWUr?=
 =?utf-8?B?Q0FGYkVlU3BWOUJuNlgrcmdYZWNtUktHdGhOR2FpNFJ4Zk9jU2RrWlB5Z01M?=
 =?utf-8?B?S1Q1NGl0YlU4a3gzcXFNd21lMndnZ2pqcXpNbnRZaFFyc21vRlBuYlpOSEU5?=
 =?utf-8?B?cmNYYzZIZUVZODROWnJSKzlvMUVFNG5OUksvdXBtdDRyYVg2SkpGWHZuZlJo?=
 =?utf-8?B?dGVzNHkyT3I4VXk2QkVFQXhBdER2MS8wTnRGenVob2s5TkxvbGdsY1Z3dGRP?=
 =?utf-8?B?QlBwS2pldTFUUE1HZ0lGbldkV25DbFhKZDJ5N1dzUXFoYUNHUHJMalk4YkF1?=
 =?utf-8?B?aENYZzhyeEVYUkdRRC9NZE1zTk9yUTdyQ3NBb20rT2daQUJ1dlo5b093VEwv?=
 =?utf-8?B?TmFBck5CVlpXb3E4dHZ0d3NYL29adVZERkVMQW5UMG9xQSsvRmhVYWM1WlBW?=
 =?utf-8?B?MHNLNHdpd2VVUHV3VVNvcUtOWlovSXJTL0g0b1ludWpyeXVRUWFGOXZkQzRt?=
 =?utf-8?B?Z2htNmtuZFRvdDdRMTZFN2dRMG5tL0dkZ2kxNnRTKysrcFN6bkxEdzlzMXdE?=
 =?utf-8?B?MkdOQlpRNHMwa0pFSnVncEJyQkdiOG8xZkxDVDFVQ2NqbzcxeHlZMk14Kzly?=
 =?utf-8?B?YXV6bG5TQW9FWkw2a2NiQTg3azRsU3QxSEVPSURIMTFwcCs5UEhjTlU2N25r?=
 =?utf-8?B?SFhNcmhqbEpVaVJhU1E3eStGS3V4bjl1eXUzS3p2MXdlbFdwd3hTOSt4d3JF?=
 =?utf-8?B?bGx6MXJyZ1cwQnFlTUNYRGNMaDRIZjVrenlEU0laMXdSVVYya1Zrc3M0YTlL?=
 =?utf-8?B?YXZXaGF3REs0QUFETzB3M2taYk8xdTZzbHc0K082ZDlnbGR5b082MDAwQlNh?=
 =?utf-8?B?NC9idExBZ2RzVUFGc1pLeWVqOEVlRFhXWkw5dEVCaVE3bXJkZEl0Y0dNdmFE?=
 =?utf-8?B?YTRNb3B4TGlmNnYxVTQzNHdSd0ZUOWNSaVRTUkxnOXFvZHZMMUlTZkFyalI3?=
 =?utf-8?B?UnF2enYrV3JjMjBvaXE1NWYrNWpYeGlOUlJPNDVHbU8zOXJvM3pVUk1taU5i?=
 =?utf-8?B?amVXUFhsY0JiZzhQVTYxcVpiNitORGY1cWtOb2lnMlVaSGFaalEvbFhCN2Rs?=
 =?utf-8?Q?lPc+tW+hXQYK4u9G061Ktu3yoE/GxusB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QU01OGlnTjZpNS9kQ2tZSmdVV3JsUXF4TTJ2OGYremEvNEc3OVlRaFRlSVhK?=
 =?utf-8?B?UkNJMnBCRi83YU5CTEFOd2RmRGdPRnJTK3ZsREVDNkMwODQ4Q0RSWFIwekFO?=
 =?utf-8?B?cGVJRjI1ZjRrRzZjNERUYXBOZlVBbmM0YlM3Tk50ZDFXYURDYnNhNVFKS2I2?=
 =?utf-8?B?NXc5dVlhV29sbU5QQ0d1aHlmVnBVWHlEVnZKS0FKUGpaYmJ2c2NlMEFqc2N4?=
 =?utf-8?B?TlNTQ01YL3Y1eDBxWlBlN1hycTZpdjdqZzRYYUpLaUxVbWpGaWordDh4cm82?=
 =?utf-8?B?WGszVzF1UGk4SllkSGhtWTdPanc2YjRxd2Zia2NKSEIvdmtySmZ3aGtJR1FP?=
 =?utf-8?B?MDZUKzVmMTIvVk5KKzZBbW1BZ2J6WUc0RTkrV3g3MXhCcjJDdnpzc045NEsw?=
 =?utf-8?B?K3pjN1MwbGU5Z0hPdHRBRTZZWXh4Z2ZMUkRPRTZaZVByT3VnZ2lBN0ZhdWxB?=
 =?utf-8?B?YnR3VHFkR0xUdHp3SEthdzJqYi9qQ2dmVm1BNDRVaGZzZHlnZGYzRlAraGFC?=
 =?utf-8?B?U0JNcExWSWVxeGdkRk9zM0hrRVFKd0NDNHgxd0lCMis4V3Q2Q2NQcGw0YUxO?=
 =?utf-8?B?WnprVjlmUkFvb2dxTnBRMVFHQWhRYnJhaS9jNkQ5QU16U3NMb3J5czRNOHl1?=
 =?utf-8?B?VXNqK2czSFF4MnQvazg2eFU5K3VyNmxjSnFoSjlKaDNjYkNqbU1teXdyMGlX?=
 =?utf-8?B?ME5HMmkwcHRkVktBWVFYNVk3bSt5RDZ5UVdWZi93WC9FQXJzSytYYzIwK2ZI?=
 =?utf-8?B?NGpPYXJOWGQvcHdJeXRtTHc0RGthaGpsZFJieFVGb0lpVzdUWFQ1c1A3ZVhr?=
 =?utf-8?B?OEJ4dTFVSjNuOUt5aW9hWlM5MVl2Unhra1plMG1Yb3psSm90Tk41YnF3ZEE3?=
 =?utf-8?B?UVpYV2huQ2RzVHNybXJiTFZEa1JuYTBYNFZuejkrNklCNTIrK1BoRGI4ajR2?=
 =?utf-8?B?VFplUHlMMmoxRit3djVpT2ZlVVB2bVJsYU02bEhtb2FXTkhtUFNtYnd4d1Jr?=
 =?utf-8?B?ZU9sbEthc1luaTBVaExiNUFRSFVVdjZOY3BiMEZXUm9aUktIUnVqWUJmd3ZC?=
 =?utf-8?B?OG5KbERLWkJicVc0UlpyL0dsSjVhc3cyYU5pUkUyYVZaVVU4dE94SUc5N3RX?=
 =?utf-8?B?a00wT2hEMEM1cGhaNjVFbDVHd3ZuVnQzZjFJeFpJUVZDNTMxd1RveERhV3pZ?=
 =?utf-8?B?cWl2VVRiNnpIbTU0YmZlVWo2MjcyNnJ2VkRnT1Y5MzV2S0FENWFWOWZmK0Jx?=
 =?utf-8?B?L3AxVHF5UzRxN0NJQWV2MUNpOUxHb1Fqa21WYWNBSnVYV3pwd2tZV2VmaUpY?=
 =?utf-8?B?ZHF3L3d4Y3RaRlVVb1Y1TEVwaUZBVGJlbzVUMG1palJSY1lFdDVEaFlEWW96?=
 =?utf-8?B?RTlUMXRhU1dNR0gwTWJBSGgrb29sK0ZUQmozUWJwRkVuNWFTL2QrcFEvUDI4?=
 =?utf-8?B?RXNXWUZybDJ0MUxnNVZjV1VwNzRxUFpUU2Q5UDduVjBsWnFMZEhjWkRPZFFa?=
 =?utf-8?B?ZC8zc0d1b3VtTkRxSmcyYTA5YS9sdXNkK3BramtQNWVPRXpLN0Flb1FodXBJ?=
 =?utf-8?B?SUhDUUF3WVNvUjV1cXZ0YmpheWtCQWxCUUtpQ1ZYazl3MXltQnZINlN5M29E?=
 =?utf-8?B?UVFrQTQra2tRQlNjZXYyL2tKL3orTW5adEFCTFpHR2N4bWRycHN4MjVENXZj?=
 =?utf-8?B?MGVKOStWMDgxU0laTlRoRDhVYW9IOTlTeElsYkhWYnZzVWR6SjdyS2I3c3Fu?=
 =?utf-8?B?RG5ZVmhlQTI3YXpzcitkeUliWE4vSmVQbGQ3emdCWGNjVlpxdFNjOVNsZGFB?=
 =?utf-8?B?eGVyU2llUVRsV3U5R3hFYzBMRlBtSmxDQWlHZGgwckpxM1krRVZlSHVRNVBH?=
 =?utf-8?B?RGJDbGRqTlpKcGQrQmVUeGZ1S0dsWWw5dy80c1ZXQnQyUGNmNUZLamQvZERa?=
 =?utf-8?B?VzFGSWFYbU91NXd0Y3EwNk9Mb2QxRWtubW5lNytwdDU4dFd0aTNkTWIrZjVU?=
 =?utf-8?B?UHluTm9VQ2prUUpVb0tMYmRaM0J3MjVNL2N4cWo3eWREcm1FTnVkNndtcERn?=
 =?utf-8?B?Vk9zYll1ZUgxMCtVSFpkcHdQNXZnSVFCUEhmZFpVYkxnRVlBa2dTYmFrenBT?=
 =?utf-8?B?TE1XVFZ6UGtaa0VrSXZuVzFaVDFnanc4Ulh2Q2NoR1VkNTI2MnR2T1BUZUQ0?=
 =?utf-8?B?K3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9926020c-386f-422d-1902-08de336221b5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 18:22:50.0962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JGV6OxTPhhcAmVboiFguBiT9rp2ymtYHzLAcFL50uk2mSkKXs3I1xLIBMfJ+FDhzvH9aBvKGKvvsjJPY486in55gu8xEJlf7FwKAU+42Er0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5185
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

On Wed, Dec 03, 2025 at 08:30:14PM -0800, Wang, X wrote:
> 
> 
> > -----Original Message-----
> > From: Roper, Matthew D <matthew.d.roper@intel.com>
> > Sent: Wednesday, December 3, 2025 15:11
> > To: Wang, X <x.wang@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Lin, Shuicheng <shuicheng.lin@intel.com>;
> > Zuo, Alex <alex.zuo@intel.com>; Nikula, Jani <jani.nikula@intel.com>; Cavitt,
> > Jonathan <jonathan.cavitt@intel.com>
> > Subject: Re: [PATCH v5 2/2] drm/xe: expose PAT software config to debugfs
> > 
> > On Wed, Dec 03, 2025 at 10:53:55PM +0000, Xin Wang wrote:
> > > The existing "pat" debugfs node dumps the live PAT registers. Under
> > > SR-IOV the VF cannot touch those registers, so the file vanishes and
> > > users lose all PAT visibility. Add a VF-safe "pat_sw_config" entry to
> > > the VF-safe debugfs list. It prints the cached PAT table the driver
> > > programmed, rather than poking HW, so PF and VF instances present the
> > > same view.
> > >
> > > This lets IGT and other tools query the PAT configuration without
> > > carrying platform-specific tables or mirroring kernel logic.
> > >
> > > v2: (Jonathan)
> > > - Only append "(* = reserved entry)" to the PAT table header on Xe2+
> > >   platforms where it actually applies.
> > > - Deduplicate the PTA/ATS mode printing by introducing the small
> > >   drm_printf_pat_mode() helper macro.
> > >
> > > v3: (Matt)
> > > - Print IDX[XE_CACHE_NONE_COMPRESSION] on every Xe2+ platform so the
> > >   dump always reflects the value the driver might use (even if it defaults
> > >   to 0) and future IP revisions don’t need extra condition tweaks.
> > >
> > > v4:
> > > - Drop the drm_printf_pat_mode macro and introduce a real helper
> > >   xe2_pat_entry_dump(). (Jani)
> > > - Reuse the helper across all PTA/ATS/PAT dumps for xe2+ entries to keep
> > >   output format identical.
> > >
> > > v5: (Matt)
> > > - Split the original patch into two: one for refactoring helpers, one for
> > >   the new debugfs entry.
> > >
> > > CC: Jani Nikula <jani.nikula@intel.com>
> > > Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> > > Signed-off-by: Xin Wang <x.wang@intel.com>
> > > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_gt_debugfs.c |  1 +
> > >  drivers/gpu/drm/xe/xe_pat.c        | 59 ++++++++++++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_pat.h        |  1 +
> > >  3 files changed, 61 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > index 7c3de6539044..e4f38b5150fc 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > @@ -209,6 +209,7 @@ static const struct drm_info_list
> > vf_safe_debugfs_list[] = {
> > >  	{ "default_lrc_vcs", .show = xe_gt_debugfs_show_with_rpm, .data =
> > vcs_default_lrc },
> > >  	{ "default_lrc_vecs", .show = xe_gt_debugfs_show_with_rpm, .data =
> > vecs_default_lrc },
> > >  	{ "hwconfig", .show = xe_gt_debugfs_show_with_rpm, .data =
> > hwconfig
> > > },
> > > +	{ "pat_sw_config", .show = xe_gt_debugfs_simple_show, .data =
> > > +xe_pat_dump_sw_config },
> > >  };
> > >
> > >  /* everything else should be added here */ diff --git
> > > a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c index
> > > b8146724a60e..21f053c41899 100644
> > > --- a/drivers/gpu/drm/xe/xe_pat.c
> > > +++ b/drivers/gpu/drm/xe/xe_pat.c
> > > @@ -581,3 +581,62 @@ int xe_pat_dump(struct xe_gt *gt, struct
> > > drm_printer *p)
> > >
> > >  	return xe->pat.ops->dump(gt, p);
> > >  }
> > > +
> > > +/**
> > > + * xe_pat_dump_sw_config() - Dump the software-configured GT PAT table
> > into a drm printer.
> > > + * @gt: the &xe_gt
> > > + * @p: the &drm_printer
> > > + *
> > > + * Return: 0 on success or a negative error code on failure.
> > > + */
> > > +int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p) {
> > > +	struct xe_device *xe = gt_to_xe(gt);
> > > +	char label[PAT_LABEL_LEN];
> > > +
> > > +	if (!xe->pat.table || !xe->pat.n_entries)
> > > +		return -EOPNOTSUPP;
> > > +
> > > +	drm_printf(p, "PAT table:%s\n", GRAPHICS_VER(xe) >= 20 ? " (* =
> > reserved entry)" : "");
> > > +	for (u32 i = 0; i < xe->pat.n_entries; i++) {
> > > +		u32 pat = xe->pat.table[i].value;
> > > +
> > > +		if (GRAPHICS_VER(xe) >= 20) {
> > 
> > I think we're missing a "GRAPHICS_VERx100(xe) == 3511" check at the top of
> > this ladder that would use the xe3p_xpc dumping function.
> > 
> > For consistency with xe_pat_init_early()'s logic, you might want to make this
> > condition "GRAPHICS_VER(xe) == 30 || GRAPHICS_VER(xe) == 20" so that
> > both are using the same selection logic.
> > 
> I have made the  xe3p_xpc dumping function using the same format as the xe2_dump in the first patch, so here we could just use the  GRAPHICS_VER(xe) >= 20.

Oh, I missed that on the first patch.  That breaks our ability to
compare the output of these debugfs directly with the bspec (since now
we're printing an undocumented COMP_EN value that isn't present in the
spec.  I think it would be better to keep a separate XPC printing
function so that we stay aligned with the spec and don't confuse people.


Matt

> 
> > 
> > Matt
> > 
> > > +			xe_pat_index_label(label, sizeof(label), i);
> > > +			xe2_pat_entry_dump(p, label, pat, !xe-
> > >pat.table[i].valid);
> > > +		} else if (xe->info.platform == XE_METEORLAKE) {
> > > +			xelpg_pat_entry_dump(p, i, pat);
> > > +		} else if (xe->info.platform == XE_PVC) {
> > > +			xehpc_pat_entry_dump(p, i, pat);
> > > +		} else if (xe->info.platform == XE_DG2 ||
> > GRAPHICS_VERx100(xe) <= 1210) {
> > > +			xelp_pat_entry_dump(p, i, pat);
> > > +		} else {
> > > +			return -EOPNOTSUPP;
> > > +		}
> > > +	}
> > > +
> > > +	if (xe->pat.pat_pta) {
> > > +		u32 pat = xe->pat.pat_pta->value;
> > > +
> > > +		drm_printf(p, "Page Table Access:\n");
> > > +		xe2_pat_entry_dump(p, "PTA_MODE", pat, false);
> > > +	}
> > > +
> > > +	if (xe->pat.pat_ats) {
> > > +		u32 pat = xe->pat.pat_ats->value;
> > > +
> > > +		drm_printf(p, "PCIe ATS/PASID:\n");
> > > +		xe2_pat_entry_dump(p, "PAT_ATS ", pat, false);
> > > +	}
> > > +
> > > +	drm_printf(p, "Cache Level:\n");
> > > +	drm_printf(p, "IDX[XE_CACHE_NONE] = %d\n", xe-
> > >pat.idx[XE_CACHE_NONE]);
> > > +	drm_printf(p, "IDX[XE_CACHE_WT] = %d\n", xe-
> > >pat.idx[XE_CACHE_WT]);
> > > +	drm_printf(p, "IDX[XE_CACHE_WB] = %d\n", xe-
> > >pat.idx[XE_CACHE_WB]);
> > > +	if (GRAPHICS_VER(xe) >= 20) {
> > > +		drm_printf(p, "IDX[XE_CACHE_NONE_COMPRESSION]
> > = %d\n",
> > > +			   xe->pat.idx[XE_CACHE_NONE_COMPRESSION]);
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> > > index b8559120989e..5749a488d9a9 100644
> > > --- a/drivers/gpu/drm/xe/xe_pat.h
> > > +++ b/drivers/gpu/drm/xe/xe_pat.h
> > > @@ -49,6 +49,7 @@ void xe_pat_init_early(struct xe_device *xe);  void
> > > xe_pat_init(struct xe_gt *gt);
> > >
> > >  int xe_pat_dump(struct xe_gt *gt, struct drm_printer *p);
> > > +int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p);
> > >
> > >  /**
> > >   * xe_pat_index_get_coh_mode - Extract the coherency mode for the
> > > given
> > > --
> > > 2.43.0
> > >
> > 
> > --
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
