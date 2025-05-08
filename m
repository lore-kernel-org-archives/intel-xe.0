Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16EFEC3ABC5
	for <intel-xe@archiver.kernel.org>; Thu,  8 May 2025 23:01:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D006910E222;
	Thu,  8 May 2025 23:01:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WBDZiSjo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D1E10E222
 for <intel-xe@lists.freedesktop.org>; Thu,  8 May 2025 23:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746745280; x=1778281280;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fTJ+rWGTmumi1ZBsMYnfqmiDkDpPoyPE0qSjSgFES0M=;
 b=WBDZiSjo/s+3zjJveiad5LD92x5ENiBXKBRqeTlg4E1Z9sBBqVhgOATV
 GOwlhIJ96wPgSiGZObkTIV4Fo1cQEdCHwGEYFOkQgki56RUYPTr8qRYi7
 icHfyYONWnO9GIWRNhv5TvSSszyuA1WH0+GGqXGmrQethgpLJnP1m7eSj
 +4KNd70UYHyKDv6JQjOp27HM8GRCxAavJKyoDJ2m2k+UoV4Hcjt3wdF5d
 u2RdsYL00HUwAKTgPSmqs9I8BrN0FWrUZ6DaY6eZlM8A/V/d8ii0J/jxB
 x1j5UAL76WBM1WzpHhzopUDbrHbi6BIdk6lwlttEH1/N+IKR+pAbq0YE4 g==;
X-CSE-ConnectionGUID: Yun2f7U0Q9GZW2KQfyft4w==
X-CSE-MsgGUID: Ye+gavs9RDeFaQ0ChZf0Hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48714475"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; d="scan'208";a="48714475"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 16:01:18 -0700
X-CSE-ConnectionGUID: LTVv66BnRKOD0L/wj8xbig==
X-CSE-MsgGUID: vQPj1/S0RlKMkkv3NXFZxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; d="scan'208";a="136395617"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 16:01:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 16:01:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 8 May 2025 16:01:09 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 8 May 2025 16:01:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t8gQ9ydbb8T5I5rqF4lWBrhdBS84YznB2aiB0mxeQ1BFFU+pNATisdkkABrNInZCmTcnmlXy+Ung0JI3GduDIIQA72dc21k6IGi2mRwn4Z/aLEyw3SFOLNYZC8qgAeLPq8OyKzTM4c/V7b/3hL0vN9BndrlTennGOYkoxPkUDjP5YQ/Ykg3ooG2QbDoePkNMv9u7j/Ar2s/AlYIFKuddO6DKmxD3mFH6AtseRrkwyhGLZyhbEByjVfnhtT4p3jYpn8L2i3U8frucA87GG1FXm5JsySk1t+73KvyhudWvpuHis12duFe4+i0/JL8Rifdpax9QZ/TAaWruuyD97YEj9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xBXGn+Bpzs7fYlmseoRga0p6nq3lXiXZv4+8HrkTpvM=;
 b=icaESy4/J72zumhelrhscaVVVeNdgHcpcinVfM3H6ScqShj7Xuc2EjAqb8l50F5OZqLdbZBnDt3oEnU3w8v0GXKnBhZFkKkWx+EkTwCYbvMZaACkA2URhvJJJj+vwORGBR3ElUlW4ySQcGRjKGYEEwrJJSIztKmdgTktDaeFr/FUxFnhhMhzzSWV3cDHzjrErjSs06fC9uMPc0HoS6pEO6YFwA6QbDuRVLSHbGIwXZ5ycy8No5n+RA4S0n+6532smQlmJq1n/Kr2akmennI1xVDEcDDmTSOZ0H6KddbJTLrAR1H6UT1q1UZcTNkReRT2SYt2vLwi7s+Nif7r9iBV/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CH3PR11MB8364.namprd11.prod.outlook.com (2603:10b6:610:174::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Thu, 8 May
 2025 23:00:20 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8722.021; Thu, 8 May 2025
 23:00:20 +0000
Message-ID: <27e579db-94fa-4c2f-96e6-e72110758501@intel.com>
Date: Thu, 8 May 2025 16:00:17 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Add helper function to inject fault into
 ct_dead_capture()
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Chauhan, Aditya" <aditya.chauhan@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
References: <20250430131710.20532-1-satyanarayana.k.v.p@intel.com>
 <ac18b7a1-c149-4182-bc6d-6b73b943525d@intel.com>
 <LV3PR11MB86956B506EAD9EF55A9D841FF988A@LV3PR11MB8695.namprd11.prod.outlook.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <LV3PR11MB86956B506EAD9EF55A9D841FF988A@LV3PR11MB8695.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0149.namprd04.prod.outlook.com
 (2603:10b6:303:84::34) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CH3PR11MB8364:EE_
X-MS-Office365-Filtering-Correlation-Id: e861884c-abe6-42cb-ff76-08dd8e841b70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFFNUGNQeXptbTlSZ01NVGZGRkRkbzVURHpHSU1TOGFncUlNbDdTOGNPRDN6?=
 =?utf-8?B?ZE5mVjNhcURjbExXUm1pN3J0Zldab1BHZHg0ZXVRdHNkazRxWWtVaWhjaDQz?=
 =?utf-8?B?VDc3YmpNQldFWnhpdktNTDZ2OWpHNlZJV1oxdzUwUWlmbS9EdUpwbDZrMW1k?=
 =?utf-8?B?RnkrN0F2aThIeFFoWVhFM2dhY2JrSDRjeFlDdjNrZkpudGtxbWc1WEZFN1RO?=
 =?utf-8?B?emIyUm54TEpBVXJZbDVRd0lxQnpEUUtGYm5HNkx1T0FrK3Z5RGlpZlkyN014?=
 =?utf-8?B?OFpaNGt4MUdTVWZ2a3R3emhKODRjRUs5bkp1WmlGd1kvNUhnNWtLY01MWmg1?=
 =?utf-8?B?R0tDM0FMK2hmZzFzWHlYZGNNaVB3M1pqbnJJM0VpZEY1V3RaYXJkbmJDVHhy?=
 =?utf-8?B?cHM0YlJtZ2c5ZU1NSFd1T1pVM3U3UmtlcWkwNTVtOE9GdVR0T2lBMmowNGxs?=
 =?utf-8?B?UVlnNjNZUTN2TG5xRG9tS1IrTFRwYlZxTzV2RUdOSjhWYWJpU3RNODcyaGp3?=
 =?utf-8?B?M2FicUhXZE85azRURzZZUmdZdXJHMGE1TS84b2tXKzgzdUtnR200aVk3NG9E?=
 =?utf-8?B?Wk5TdDVaUVh6Y21MUlUwUE53S1dQcDg3SUN2Tmw1SnNCaVdROUZwK1RVMjN4?=
 =?utf-8?B?bU8yNjBWVkdxL2gvMUthOGhkaksxY1JCQTRmOHRZSzFFZ3JEYjhteEVkWmts?=
 =?utf-8?B?NXo2L2FXZnFBSG9qRmJPdWNDcG15ZUxhc3hPNFlMekpMeEtVV280N1Evcm1S?=
 =?utf-8?B?OUVuSGJyZ08xaHlsWk00RWFidTNLTm8xQk5Nbm5CakZwMFlsMHU3L0JjUmYv?=
 =?utf-8?B?YWI2Sk9DNXN2eGZ4ZEo3WGtmMDM4ZHJ3aFA4OFpIb0czOVJ6NkJjOFRkellK?=
 =?utf-8?B?N1BaWE1UVXdIRmlXQlRyME9OMnpjSVdMR3RwNklKd25mbm1zNHFrWXVlZlJJ?=
 =?utf-8?B?MVZQSDc3TFNPaU1pNWpqM2xhbjdXQzhGeG85MExPZVdUcytoT2dDMGJ0T1hl?=
 =?utf-8?B?cTRwa1J6RmxzemFwenJGUkVJa0kxWFZhS0c0QXAvNXJBdzhiOE9XT3Vwdks5?=
 =?utf-8?B?R2M2dk5qM3AxKzE5TURKdkRkaEMwTENpeW1DV2ZYR2NRNjRHM0M3TVo1Z2U4?=
 =?utf-8?B?aWREbGhqb3JqYkhkT25tT3JBMTAvV1d4WktUcWZYcTVvT0NFUmtYNzZiN2la?=
 =?utf-8?B?ZGlHTXJtbjgwaGpMQVMxaFRLampUb2t2K0FvVForLzF3VExrL212L2RPaXRi?=
 =?utf-8?B?NThhYUc3OVBpbSs5WHM3SmhHWGpMMTM3NWdKK2RFM0NEZUJYSGtSWkxpZnVw?=
 =?utf-8?B?RjhrTVIxRXF6VFJhVnU5a3RaQlBIMjJhRDNlSks3cDg1b1ROTW9rTDFFQmtT?=
 =?utf-8?B?cll0YkdqUE9QUy9oZUl6UnhRZVZhd0ZJbWlyamtJTGN3dWp6Z05aUHFHL1lr?=
 =?utf-8?B?WDRmSy9Eb0Fza1U1STdTWTE2MW40WnE4MmN4VTVHdlRaSWtqN3lGSHNzUlVU?=
 =?utf-8?B?ZDQzZUs2c3dxYjZOeEJyak1mcy81ZVVrVXgyZFJtOTdTcGVkbXYyZEQxYTEw?=
 =?utf-8?B?eDlkaWJoSDJIMmt3L2djRndad05ndldXTHBld09YK3grQThmZkZiK2Z3MDY4?=
 =?utf-8?B?WE5NajJvbERYWnNLRWxiWUNSdE12b09xcW01WUpVK2l4OEhRc2c3VE10YXJY?=
 =?utf-8?B?RkZ5OG9VdnE1L0J3WUM0VVhIUytqTmNEWGhHSml1SEJ4VmROVHZaUkk2cHJ6?=
 =?utf-8?B?MHZkazNhNkZFcm1nT0tEOG1IQTVxTzE0RXdoNzZYbWdybS9IYzdMeFd4c3gv?=
 =?utf-8?B?ZGNVd0NiK0xUdmtMRTliaUhGbmJETHVSQjdOajFEM0lWdGlOd28xMFBUN3BS?=
 =?utf-8?B?S2xwQndKQjI3Y0QreUJLUlBRQWUzUjErdFpTRGIvNXJSRU1uekx6NW5IckV5?=
 =?utf-8?Q?L9EDTGYrEzU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aG10QU9CODQ2TnpiNFR2aGdmMUcrSGNXNi9TODhGdjJ2ZnoxSVk4MjhrdTVG?=
 =?utf-8?B?UEp0djFhcEVPb1NCNVdFb2N2R3QyOWh4SDM2bldBT1V2TE40TEFDYVZEZXFX?=
 =?utf-8?B?QXYvRWpsNllQQlRjdElhQjk5S2lkNHlscmVrVTRkMWk3eE1JRForNzVEMzZx?=
 =?utf-8?B?a1dFUXRndElzcDFXSlQrVHRzRkE0bHFWQThrd3NNZzNFWk96ZGY2N1VFVVdJ?=
 =?utf-8?B?WDNGRWtaY3RBazJLZlltbVE5enBzU2h3enc4bkROOElReDM0ckVKakJyNkFt?=
 =?utf-8?B?TEM3bVJDRkxMU0xVTkdoRVVWN1hZdjRsbU4vNStJTnlDaXhsaWNNS3hyVzJ4?=
 =?utf-8?B?aFJhbjlsSmVVVkI2Z1FvY3dMcE4rbmxYSU5CZG9Sanc3Tkl0MWZyMm9hUnlX?=
 =?utf-8?B?LzVVWlZzYWVNMEJnemlhTVd0WllheEc2VVdJYktZeFNWV3Q4eXVESUVuS050?=
 =?utf-8?B?dU4rVlNlQklMU0Y2ZnhydGJ2cTM5elE3UU8vSGVvMEpWcjB3MkI4YURtYUFM?=
 =?utf-8?B?WDA5Y3BZbDRITzZPNE9JWnQrR2F4TnlOR3UxaFRkQWZESlpKZ0tITEdxME92?=
 =?utf-8?B?VEw1Q1VoTG4xNzFpUkNITHlOalM0SEZaYjZJbVNsSHJ1V2RvMEkxajBQTWNG?=
 =?utf-8?B?QnUyRjRHUGw1cG5qV2dvenVVQmdDbUpxdWZLVWVmRlNZSnFxeUxMbWdEMXo3?=
 =?utf-8?B?aGdmVjhkT0w3MThUdVEzbVArZUg3d21mWGR6dmJWc3U1NjZmek1EUThvUHJK?=
 =?utf-8?B?c2hkSUxocXdoNnFWa1hnSWVmQ0xCUlhuWjVlWmxwU255YVloYWUvRDFTckx5?=
 =?utf-8?B?OUxLWlNJMVhETTlCaGtOVUNIRzd3QUFuTEhTVHIyTXZTWXhxTlZTTW1jVTlX?=
 =?utf-8?B?VEhsWnR1Y1Z0bDViazRyQmFsalRaM3VJSmRRa29UMW5rWHRFaVZVby9pWEJI?=
 =?utf-8?B?OTByVjN1WlowN2ttVWVQeVd3T3d1anRsbEtnaVBBbmdKOTZ1ZnFMWUtmcHE5?=
 =?utf-8?B?bWNEWXBOdlBHL3NobmM2cXpYY1UxUmtMUHZPd3VuZ0NWWDdhMmhoMzVsNXI2?=
 =?utf-8?B?WmV3eUpHSE1GU0JYZ2tSeC9Mdk9HREIxUTh2ZTF4TVUyT0d3TTlpREJQZlFj?=
 =?utf-8?B?R2JSd2VhSU5FZ2VXd3NtTGpZdWRsaHZTc1d4bWszWmhvTEsxbVNpclpJWmNC?=
 =?utf-8?B?MkZ0S0ZBK2NVN0daWmQ3VDlPZFdFSXorVG9YYWpRcVk0LzkybkNqU2tvUnFO?=
 =?utf-8?B?QW93bSs0ZXkrRXU0N3pTRXhuZEFpZ1NsdFVFRkxKeUdzMG11R2h3dVk1cGEz?=
 =?utf-8?B?UEMwakdUaWd4REkydGFUSTQvdC92NU9RdkgxaXo5aXFBNGIxVTNuWHdjeEhN?=
 =?utf-8?B?MnBhN2pncW1mTmZWOFhBblZNRHJ3VUJYbEIxUXhaU1BDV09wdFVKWndJZjdN?=
 =?utf-8?B?S05yWVgrdFVGRVBWM1F4Y1RqenV4aFFna2lCWE8wT0g5T0gwMkMyT0p5c2ZE?=
 =?utf-8?B?eVdvbHF3Mi8vaXg5aHVUZHRjR3NVNzFZT0cwQWVzNVNIaDdtSlNKNEk4OENO?=
 =?utf-8?B?aXQ3bGtkU3FLU3pmN0tEMTljY0ZrVkxOUm04M3AzT3pyczZGdldSV0RRakRR?=
 =?utf-8?B?d1hSemlud0xyOFhWS0hLK0grdW5PUGtIWVVoYlBMOUFEUlFDdytla21sK2cw?=
 =?utf-8?B?Q2RibmduUGlJYVJOSklmQjJiOU1YRFVyRnJCQlVXRDdoN0VlRFR6NzFydWtE?=
 =?utf-8?B?V1ZudlVORWRJOVFiVVpZTnBlUjRpUHBVOTAzaDc5c1pWMnplKzlwaEw3SXJC?=
 =?utf-8?B?c0J4eVd5Rit2dGVQSFJuSVBJWFFUNmpjSkI3b0NmZXlueDlCYTdsR0h4QUJu?=
 =?utf-8?B?UFRSMnBsQm9lNGZiOTR1bVVCRUFYWGxRSzhPWDdSWkFXeXN3ZnFVNk1QQUhC?=
 =?utf-8?B?SHc5cDhMSUJNYm0vT0pYQUMvTEl5V2QyL0ZOOVBtaWpBYk1ScVRSeVljc3ls?=
 =?utf-8?B?TGdYVEhuQU1lb0R3R0w1TzR5L25vTVZIRnB0bTYwWWUybENPaVNBM2VVb2xw?=
 =?utf-8?B?Z0RkcGpueXdwUlcrQSsrTUZodEVBWll3ZzBQenVaMkU0aSt1QU9QdnJEcFJH?=
 =?utf-8?B?U0FZOGRYd1EwTEMwbUhRL2htUnB1ODFtSGFIaTFaZkprL0twVEZvQ1loT1BB?=
 =?utf-8?B?UHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e861884c-abe6-42cb-ff76-08dd8e841b70
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 23:00:20.6800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dzD4Cx8a2gLzt57IXvzwhtN9D656UQMg8tpjXzHMg2evXeZZd2cu3Otf2emwlxQLEwT8dqSNlyQFhHde+TdzJIgRzY10xg4rK7eWyce44gM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8364
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

On 5/6/2025 10:13 PM, K V P, Satyanarayana wrote:
>> -----Original Message-----
>> From: Harrison, John C <john.c.harrison@intel.com>
>> Sent: Wednesday, May 7, 2025 4:50 AM
>> To: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; intel-
>> xe@lists.freedesktop.org
>> Cc: Chauhan, Aditya <aditya.chauhan@intel.com>; Nikula, Jani
>> <jani.nikula@intel.com>
>> Subject: Re: [PATCH v2] drm/xe: Add helper function to inject fault into
>> ct_dead_capture()
>>
>> On 4/30/2025 6:17 AM, Satyanarayana K V P wrote:
>>> When injecting fault to xe_guc_ct_send_recv() & xe_guc_mmio_send_recv()
>>> functions, the CI test systems are going out of space and crashing. To
>>> avoid this issue, a new helper function is created and when fault is
>>> injected into this xe_should_fail_ct_dead_capture() helper function,
>>> ct dead capture is avoided which suppresses ct dumps in the log.
>>>
>>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>>> Suggested-by: John Harrison <John.C.Harrison@Intel.com>
>>> Tested-by: Aditya Chauhan <aditya.chauhan@intel.com>
>>>
>>> ---
>>> Cc: Jani Nikula <jani.nikula@intel.com>
>>>
>>> V1 -> V2:
>>> - Fixed review comments.
>>> ---
>>>    drivers/gpu/drm/xe/xe_guc_ct.c | 21 +++++++++++++++++++++
>>>    1 file changed, 21 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c
>> b/drivers/gpu/drm/xe/xe_guc_ct.c
>>> index 2447de0ebedf..d6e7a8b80d8c 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>> @@ -1770,6 +1770,20 @@ void xe_guc_ct_print(struct xe_guc_ct *ct,
>> struct drm_printer *p, bool want_ctb)
>>>    }
>>>
>>>    #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>>> +/**
>>> + * xe_should_fail_ct_dead_capture - Helper function to inject fault.
>>> + *
>>> + * This is a helper function to inject fault into ct_dead_capture().
>>> + * As fault is injected using this function, need to make sure that
>>> + * the compiler does not optimize and make it as a inline function.
>>> + * To prevent compile optimization, "noinline" is added.
>>> + */
>>> +static noinline int xe_should_fail_ct_dead_capture(void)
>>> +{
>>> +	return 0;
>>> +}
>>> +ALLOW_ERROR_INJECTION(xe_should_fail_ct_dead_capture, ERRNO);
>>> +
>>>    static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32
>> reason_code)
>>>    {
>>>    	struct xe_guc_log_snapshot *snapshot_log;
>>> @@ -1778,6 +1792,13 @@ static void ct_dead_capture(struct xe_guc_ct
>> *ct, struct guc_ctb *ctb, u32 reaso
>>>    	unsigned long flags;
>>>    	bool have_capture;
>>>
>>> +	/*
>>> +	 * Huge dump is getting generated when injecting error for guc
>> CT/MMIO
>>> +	 * functions. So, let us suppress the dump when fault is injected.
>>> +	 */
>>> +	if (xe_should_fail_ct_dead_capture())
>> Is it worth making this a more generic 'is_error_fault_injected()'? Then
>> it can be used by random other bits of code if/when necessary. And maybe
> I do not think we can have a generic error injection function. If the generic error injection function is called at multiple places
> (may be in future), then we may not inject error at point where we intend to inject as the first call will inject the error.
Not following. The point of 'xe_should_fail_ct_dead_capture' is really 
just to say whether a fault injection is in progress or not. If so, then 
don't do any of the dumping because this is not a real error. It is not 
actually any part of the error injection process itself. It doesn't 
matter how many bits of code call that function, the behaviour won't 
change other than to skip the code we don't want to run. E.g. if there 
are other 'dump on catastrophic failure' type code paths either now or 
in the future, they can all use the same 
'is_this_an_error_injection_test' function to skip when the error is fake.

John.

>> also have an inline/#define version for when
>> CONFIG_FUNCTION_ERROR_INJECTION is not defined?
>>
> Will do and send new patch.
>> John.
>>
>>> +		return;
>>> +
>>>    	if (ctb)
>>>    		ctb->info.broken = true;
>>>

