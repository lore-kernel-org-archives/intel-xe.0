Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5FBC54FB3
	for <intel-xe@archiver.kernel.org>; Mon, 26 May 2025 09:31:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F8A10E2CA;
	Mon, 26 May 2025 09:31:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h+40w/dG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 143D110E2CA
 for <intel-xe@lists.freedesktop.org>; Mon, 26 May 2025 09:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748251895; x=1779787895;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=wmDag2JC89cHd7oGHydv0Yd5XkNFTG3+H4oZ/MHNV/I=;
 b=h+40w/dGIDZl1IzxbJgijZJ31N8XYqjTzB+TGuyZvFX9EFCiPjAGT2wH
 tvnBHELY+0ah7aM2HwSOpLqgU7CHFZAmS76BmabmJlbz0pMAeOINbS9eH
 UmdoMgzdBybXO78zq8h2DV2E3gHI30P8A5taYY5TKVJ94abHJHrE8MLCv
 6icerLetFFmR5bgdnbXXfvp/8jmyodPMSDEtFYtIdQeuqtRrFG38PgryN
 DxzN75Y1AqYxcqadzE/qRUOZ1NkMli2fhLH0KJ24KB9OF51dHQXte2pq7
 KeKGX+QrjXiGYMQjGPS7TMLR/Dlt/tYLlQcw4+qv32+gcptAn4SuIa59w w==;
X-CSE-ConnectionGUID: URwzS38QRlqPVMHi2Dli+w==
X-CSE-MsgGUID: lwBDll4GRCiTq87yWFxe5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="61576595"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208,217";a="61576595"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 02:31:34 -0700
X-CSE-ConnectionGUID: oze3IFx/Tf29H9NC+W5l3A==
X-CSE-MsgGUID: 3jepUYCwThimRzNUUYf1GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; 
 d="scan'208,217";a="143245197"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 02:31:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 26 May 2025 02:31:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 26 May 2025 02:31:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.50) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 26 May 2025 02:31:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XnKKhpxhvQAfekP7wDZ1ITcvcWc0zWwZcV/GQluCQGnj+TcGNUGI9dCgRod3iR111uYxoacywBSSCmdP0TxbCAqUGHFfY4/wGy13ALT9eo6syAykzG/ZgqujovHvurUWg6u3tiFv1QNBVxwZZr4bbY9zNWS4Jkt+41aJQ3HlKsTJ0sN30V6J/yAWwIqokqHl2wBNqqHEfIpffsBVcu5x9CJ71WaVkf+Nt6eccDikmzbp3H5KSOf7X3o/pP4KSJlUnnSbJyAMxb0gnqQq8YehH8s+NNHVlFmcE8YjKrLHwZmDpZVM7d6IHSV8YtlKFQ/FHyarTddJKfDQyLNXyNOMog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bKrMP5zfpJd6BB3tC5x5n9Mb1bgQwqEDuBYQIweJvlM=;
 b=ZiL61rIeQJIxjTryt1BNJP7jexAxcyPXakLWaOYJtreJPApGgAZV5GPjrbmcc2o0bVj+Qn3SPS2j112rXRKS1FnbsMei0xOaJZG1YjIrRElIZHgqrZv3IXZ/FFMoTqRtEMBL8igUpnySIp2/vGFgT3wQWw9obpDK4+lpE7Q7Jzl1J0RdEFWDRCVMbA4zaO+7FtFM2MZHWVBCBVrDpT4b9xWmjO1CclWF48oZ5PfKfKu45pFbSNw93Z9vFa7whEjSGdpSqEyZ5vDiaqnBPQrSZ6NJfmt00xvmENS0NxSWPgfAtCEbEWg4pHAsGfF6W36TENraM0oSGHIvjCI7GDDtbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 CYXPR11MB8754.namprd11.prod.outlook.com (2603:10b6:930:dc::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.25; Mon, 26 May 2025 09:31:13 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%5]) with mapi id 15.20.8769.025; Mon, 26 May 2025
 09:31:13 +0000
Content-Type: multipart/alternative;
 boundary="------------QkkIe7mkikZCNAYKcsbSJHqe"
Message-ID: <7419aec3-da5a-400d-8277-c4457d4f6015@intel.com>
Date: Mon, 26 May 2025 15:01:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/5] drm/xe/hwmon: Add support to manage PL2 though
 mailbox
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>
References: <20250523150014.2101869-1-karthik.poosa@intel.com>
 <20250523150014.2101869-4-karthik.poosa@intel.com>
 <aDCtfnqRqs27adSg@intel.com>
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <aDCtfnqRqs27adSg@intel.com>
X-ClientProxiedBy: MA0PR01CA0084.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::18) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|CYXPR11MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: c4130810-bd22-4db8-b2be-08dd9c380e9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SStkcnVGRWxpUEw2VUJSV3hGcDB3bFpJNmFwMER1bm9DYytlYXRCejlSRHNy?=
 =?utf-8?B?d082aHZ0OFdmTGZYdEVuaVJGU0d1OWVRYWFzTDM4ZmNyMytINmJVRXkyOHJ2?=
 =?utf-8?B?WWRPMVdYMi93TVVKWWRWWHFCUWlrZ3RpWnc3ZXZJV0xZL3k5bEtSWjBnNGJ5?=
 =?utf-8?B?MmkxbE9lM0wzZVRWdkIrZVhINnFNQnhTWTE3dktvU1NYYWFKbE9RNDhzWjNz?=
 =?utf-8?B?UlRYeGVMbnZudWNVbVkzblVWOUFiY1pieGpHVGtJVytENHNablhUZzBYK011?=
 =?utf-8?B?YXAwWFUrWmFCTDdRUENBbEtKT1VKZGVlUzJISUpHYXRyTk5EVUF1eGJtaXYv?=
 =?utf-8?B?OEExZW5kc1BkSWlOTmhlbytCaXE3Q2RlbGNnU3M0RlBuMUhSQjdHSkJRb05y?=
 =?utf-8?B?TGRWWHZ2QllvT05OdjVnN3lYT1BmSzdESUZsZW1kN3dxaVVJNnc2NnFWZzgz?=
 =?utf-8?B?TW9QL2ZwOWp1UTB4TXhnV0xMcHlXdlljd2NnbUZQNlpxdUxNNm1Gc3o5Mndv?=
 =?utf-8?B?b1c0MHJMYWJTRG5KY1hVUUhWMEVKMktjTHY3U3B3MHM1MFJnZDB6dUhiWnVk?=
 =?utf-8?B?NVNLSi9WbE5RS2VEamhBclFlRjBISFZOM3RLc045cmJIQVRIMGNOMW92UHBj?=
 =?utf-8?B?dzI2b2o5clJLTHFqemhvRzBnTE9ScE9DM0pWbENTUUR4TWt6RTNEbTR0YUxi?=
 =?utf-8?B?cVBpMCtqQTUvdlFzVjBjL3pvQlpyZy9ueTcyWHMxd3M2dVdqZXp4OTRkVU4r?=
 =?utf-8?B?bWYvWWQrZHN5NnhESVE5cXFlZ25GQS9PcmNJSkFHdnV1RW01SUpob0l2eW42?=
 =?utf-8?B?bTFIVlFvOUtVQmd6bDAvQlVqQ2NLOEhIWWpwTzlPTGZTa0VJQll5Mmp5emEv?=
 =?utf-8?B?WmVpT0k5M0VVR2tyR0w5aGdqTzc1cUMvOVFMTHYxN0pnKzlxK3VsdndvVTNk?=
 =?utf-8?B?N3I2Rjk1dU5PMGMrQW04U2xDVnJ4SFJsSHp5TzdYU1U0SVdsNTRLQzVsdGkw?=
 =?utf-8?B?b1IxRG4vSUFHejZVQllReGxDK2IwOXpQOGFOYnhCdGk4WUJwaE9CaVdwZkNr?=
 =?utf-8?B?RzFOUCt2MUNHaElYbzNnMStGVy9McW5mTGh5dFdsWmdqeUpnalRUenIwU0Vh?=
 =?utf-8?B?S1ppa2VxT1F6Q1BiWm1GSjkzWHlSRXpmaWtiSzBYQ2RwMmQ5NDA1ckYrWHQ2?=
 =?utf-8?B?QlpEbW91VlhybGNiZTdyOGdrL2VLdzgySStqbTRpeHdJeUJUbWpYNk9nSmt3?=
 =?utf-8?B?N2dWN201NTBQOHVzdlJPVVh3UG1WRXl6STY2Q1FObmYrQzJIdnZhTnJPa1Fu?=
 =?utf-8?B?RVhIdmlhNU5zaXV1ODJGTWxXbVNBaVlHR0pxZm93WjNIUWxLeXBaVno3SzUv?=
 =?utf-8?B?VWMzN3Bua0g3SlkwaTFUeko0WEJHZ1RwaDJVbHZScTRNcE80alNWTG9kUjR4?=
 =?utf-8?B?ZTdqUjN4R3FKWGtuR0ZwNU01bEtBeGJ1WVVVY1AvVDFXcDh5c3ZCcXBDN1hM?=
 =?utf-8?B?Y0pTeXloZ0VJRHRrUVR1dEdycXFhM0pvN2N4L1d1cXBUMFpXbEdlUlJOL3dC?=
 =?utf-8?B?alNPK0ZQVGRPdU1VSEdjTHRNTEhPWjdxN1UxWXlueTlpNzBjV1JhVFdVdHcw?=
 =?utf-8?B?L0wrUG93QjhnYmRGejZrV0FudDA2ZkwwbzUyeUlVcnUvUXZYYzhRUm9OUjZy?=
 =?utf-8?B?d2lMWnVOd2ZDY0ZBMER4b2Q5R1llQVJNOGk2T0VXUDNxOWY2cDJSZFB3TEpl?=
 =?utf-8?B?azJwd1F4aGdhamdERStqYUhQTE1nbzVlR0wrZDZzRlliaDY5MUhEQVphZ1lS?=
 =?utf-8?B?K1VHZCt2TkdsS0JsS0t0K0ZSZ1pVMzVvUVRrSlBiZ3pwaHBXUVgwdktNdGM5?=
 =?utf-8?B?MzYzY1Q1dnlTTjZ3amVzcUVHa3ZxNm9ldlZCV01MeGlYV2o2aDBSK2NqZ3BM?=
 =?utf-8?Q?hdYAo6Hthx0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXkvYmI4ZHRmcTAzcEFLaDFUOTNwTjROZnRMY3RVa3JTdHFuakRlRHcyMEdR?=
 =?utf-8?B?VlBRcXY3Rk1qOHBDTXprNHBFaHdiMTBUYzhybGxmQ2ZPTmllbEtEaiszTDRJ?=
 =?utf-8?B?M1gxeExaQVZERDAzMUZYZ05MdG1QMlIwUlZMeGJaSmEwNUhubEk4UnltbEZL?=
 =?utf-8?B?STUydG8vYU1sZ2xwOVdvS0FhUTFIdUpsU1pnUnFmbUw5bnpvQXR5UjhEQ1FG?=
 =?utf-8?B?bURocjg5eHJXVHlGNFFIVnN4R25HSzFPdWRROEUxU2w0OHdFbzJpNmd2cXZY?=
 =?utf-8?B?RjM5aVBQWTMvZ3RWa3JMV2N5di9RU2FUMW05dWRwK0ZpRDBsbit3RUNhQm83?=
 =?utf-8?B?UmRWUVhteEZxZXBaVjRNZUw3aE1ONHgwZkJJRkZBTEhmckJmZEdFcHdncDly?=
 =?utf-8?B?bUJRS2Y1RHhreTI5SUtrclZLVU51SlJ6a1hWV2pORnFpSXR3L1JzTmJmSlJL?=
 =?utf-8?B?cVR2V3lPdW9rK3huQjRGQ1plTFd1V2pXL3dGMUZXZUlHL1NvbHlFNVFaSklm?=
 =?utf-8?B?azJ2Wm1sd3FFMEVVMVhXc0JySE53RjFHbmwwL0d5bzdYUTl5RFMxQWFGZWpp?=
 =?utf-8?B?ZEhSdlcyMmJoeFZLK2RuZk5PL3FRd2djUHE0dkJOT1gwZlpYbXJvbzBtM2Np?=
 =?utf-8?B?bWVXekpXK0xxL1RsNWhVUmgwamc4eUkrWStVdnliRTAxSi9Cd2toRy80OVJD?=
 =?utf-8?B?TXF0VjlhZDdUWnpNaEk2dFAyYjliUUVadnFHNnYzaFhhT3JYYjBWQ2RxWHgr?=
 =?utf-8?B?TzdXZ2dnWkMwZFRDdEcyNkxIQU9QS1FOYW84aGF3VTM0MENlV1dneGVLcllw?=
 =?utf-8?B?TnJWRmw5eU5tbE1JTUdYcFVyakpzMlFXUmIraVdsRFJkbXp5Z3lxbFU3YzJB?=
 =?utf-8?B?WXdnd3VyUWRjaVpuQjdhcytNdjQxcG9CdnpieWQrYUhPc2dicFBLTlo0cGFj?=
 =?utf-8?B?REU2UVNZbmJTYnJuUUc1S1lrc3MwdjIxRFQ2S1lONFIxdVk4TVYySzFWTHN2?=
 =?utf-8?B?eXRLa1BOVkkwNk9UaUZNbWJGeHkvR3gvVXNQY0o2aUpuc3ZoZy91dGQ5bSs4?=
 =?utf-8?B?QUlMenFsaTZ6WjF1UEFWTmZ3SjhSZER5SmFBd3RDOEVJYkhJU1kvV2FVdEFX?=
 =?utf-8?B?azRvM201cmhKUk44MDRtUlNvSUFpYlZXUDFOamVHZXFjSE9nVlIzZnRwSmdI?=
 =?utf-8?B?TzFZek5NbVU1Z3RGZWNGeGhGZDgxendyUGFjU25oK3ZmZmlSM0ZlVVJTWlg1?=
 =?utf-8?B?WTRUcUU5eEFSK3AyWXlEamV1S2VtaURqc1NiVk5DVXNpUWo3OWFaZTNtSzVX?=
 =?utf-8?B?QW0wWDFhQkVleEIrMFdSejNROWx5YUFDZWhDUnRzUkRmSEhYTTNpLzVpOHV5?=
 =?utf-8?B?alBpL0lKZXJQM1g3enJwNG40MkFlQUczaDdvRzdNR3NEdWFUWjJZMTdETXQ2?=
 =?utf-8?B?VEVtYVdDMS91cnhUeGhDdmdxY0lOWi9qYlVxOUVrOTlZMEJhT21ON1ZjMmxk?=
 =?utf-8?B?Nnp5bEI4NGNOQnhBUmNDc0RBZytSYXNuVWxuZEZMbHJ3M3JySldzblhmSElH?=
 =?utf-8?B?L2VlNUhVVmY5SWJ2RjMvaVptWTFUQzBWQkxma0M2YXgxQ05Wd25IRGJtYVBx?=
 =?utf-8?B?aEpYMExhUVFtZkR4MU1wVTd4RHVpanlkdERPam9reUxjZmxMdGc4dE1Ddkdt?=
 =?utf-8?B?SXVnTmRnQm9wRzJQZng4ODlRbTg0emNGU2F6T1ZNMmZQUFlwakROaktuUTNG?=
 =?utf-8?B?RUVZYjVDNlNYemxGSDFMN0hiL0R2akRVRXBpQjBaTm9QQWpReTliRm9BWllt?=
 =?utf-8?B?MlIzc2x4aG5KT0Z5dXdSMTRtWExzVzczc3ZaSXo1U0FHYWtDc1JKVlVWSnRt?=
 =?utf-8?B?a21yaE1FVm1PcUJiVXRxTlB4THpqZFljdnNBZFI1QWVWWnh2UzMva1NFZnEy?=
 =?utf-8?B?ajluMFZhTmx4OFNRalRwb1ZwVDE4SXVnbTUwYThTMkE5WlJpOVJtYWtwNHIw?=
 =?utf-8?B?eFVGL1U5b0FBMlhKWk8vd25ka2I0Y2pVSWs0N05ONmVKTDZ2elJTQ1FZcWly?=
 =?utf-8?B?eC9SVE1HdE05UnBhN0hFR21vRFkvY3U1bGpMY3ZXeksvcjZsWE44eVlrUWtq?=
 =?utf-8?B?YVhhTUlSbTIvdXQ2VkJwWitycm40TUlKSVhCbExydFRtc1FOYUNFeG5vN3Ja?=
 =?utf-8?B?dkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4130810-bd22-4db8-b2be-08dd9c380e9b
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 09:31:13.7159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RbLeJc5xZ/7nVB2lav1lupKapHgO865oF8tIy9QlK240j2tgHudmH8UAzqlvP76N0rZrANG2w2tbShGrccnGtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8754
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

--------------QkkIe7mkikZCNAYKcsbSJHqe
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 23-05-2025 22:46, Rodrigo Vivi wrote:
> On Fri, May 23, 2025 at 08:30:12PM +0530, Karthik Poosa wrote:
>> Add support to manage power limit PL2 (burst limit) through
>> pcode mailbox commands.
>>
>> v2:
>>   - Update power1_cap definition in hwmon documentation. (Badal)
>>   - Clamp PL2 power limit to BIOS default value.
>>
>> v3:
>>   - Activate the power label when either the PL1 or PL2 power
>>     limit is enabled.
>>
>> v4:
>>   - Update description of pl2_on_boot variable to fix kernel-doc
>>     error.
>>
>> v5:
>>   - Remove unnecessary drm_warn.
> Please let's not merge this series and calm down here and stop trying
> to rush things in.
>
> If drm_warn is not necessary, please have it in separate commits explaining why.
>
> Think about the use case. When the user are reading 0 because the read failed,
> don't we want a splat?
> Why it would only appear when debug is enabled?
> In this case is zero a meaningful value?
>
> Well, I'm not telling that one way or another is right here, but
> I'm seeing that this series is trying hard to bypass CI and rush
> things in. We need to calm down here please.
>
> Think about the cases were the reads are failing. Is it really
> only when it is enabled? Then shouldn't we check for the enabling
> before attempt to read? no clean way to inform the user of errors?

The below log appears when the power limit is disabled, indicating the 
IFWI/BIOS power limit configuration.

It is not due to a read failure.

if (!(reg_val & PWR_LIM_EN)) {
	*value = PL_DISABLE;
	drm_warn(&hwmon->xe->drm, "%s disabled for channel %d\n",  PWR_ATTR_TO_STR(attr), channel);

Sysfs entries are created if MMIO register available on the platform.

We could avoid creating the sysfs entry if power limits are disabled in 
the register.

>>   - Rectify powerX_label permission to read-only on platforms
>>     without mailbox power limits support.
>>   - Expose powerX_cap entries only on platforms with mailbox
>>     support.
>>
>> Signed-off-by: Karthik Poosa<karthik.poosa@intel.com>
>> Reviewed-by: Badal Nilawar<badal.nilawar@intel.com>
>> ---
>>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 30 ++++++
>>   drivers/gpu/drm/xe/xe_hwmon.c                 | 97 +++++++++++++------
>>   2 files changed, 96 insertions(+), 31 deletions(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> index 5a91dcccd3ac..dffd6443664a 100644
>> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> @@ -148,3 +148,33 @@ Contact:	intel-xe@lists.freedesktop.org
>>   Description:	RO. Fan 3 speed in RPM.
>>   
>>   		Only supported for particular Intel Xe graphics platforms.
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_cap
>> +Date:		May 2025
>> +KernelVersion:	6.15
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:	RW. Card burst (PL2) power limit in microwatts.
>> +
>> +		The power controller will throttle the operating frequency
>> +		if the power averaged over a window (typically milli seconds)
>> +		exceeds this limit. A read value of 0 means that the PL2
>> +		power limit is disabled, writing 0 disables the	limit.
>> +		PL2 is greater than PL1 and its time window is lesser
>> +		compared to PL1.
>> +
>> +		Only supported for particular Intel Xe graphics platforms.
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power2_cap
>> +Date:		May 2025
>> +KernelVersion:	6.15
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:	RW. Package burst (PL2) power limit in microwatts.
>> +
>> +		The power controller will throttle the operating frequency
>> +		if the power averaged over a window (typically milli seconds)
>> +		exceeds this limit. A read value of 0 means that the PL2
>> +		power limit is disabled, writing 0 disables the	limit.
>> +		PL2 is greater than PL1 and its time window is lesser
>> +		compared to PL1.
>> +
>> +		Only supported for particular Intel Xe graphics platforms.
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 7cfb233ac9a2..caf6a43ac92b 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -51,6 +51,14 @@ enum xe_fan_channel {
>>   	FAN_MAX,
>>   };
>>   
>> +/* Attribute index for powerX_xxx_interval sysfs entries */
>> +enum sensor_attr_power {
>> +	SENSOR_INDEX_PSYS_PL1,
>> +	SENSOR_INDEX_PKG_PL1,
>> +	SENSOR_INDEX_PSYS_PL2,
>> +	SENSOR_INDEX_PKG_PL2,
>> +};
>> +
>>   /*
>>    * For platforms that support mailbox commands for power limits, REG_PKG_POWER_SKU_UNIT is
>>    * not supported and below are SKU units to be used.
>> @@ -72,8 +80,9 @@ enum xe_fan_channel {
>>    * PL*_HWMON_ATTR - mapping of hardware power limits to corresponding hwmon power attribute.
>>    */
>>   #define PL1_HWMON_ATTR	hwmon_power_max
>> +#define PL2_HWMON_ATTR	hwmon_power_cap
>>   
>> -#define PWR_ATTR_TO_STR(attr)	(((attr) == hwmon_power_max) ? "PL1" : "Invalid")
>> +#define PWR_ATTR_TO_STR(attr)	(((attr) == hwmon_power_max) ? "PL1" : "PL2")
>>   
>>   /*
>>    * Timeout for power limit write mailbox command.
>> @@ -124,6 +133,9 @@ struct xe_hwmon {
>>   	bool boot_power_limit_read;
>>   	/** @pl1_on_boot: power limit PL1 on boot */
>>   	u32 pl1_on_boot[CHANNEL_MAX];
>> +	/** @pl2_on_boot: power limit PL2 on boot */
>> +	u32 pl2_on_boot[CHANNEL_MAX];
>> +
>>   };
>>   
>>   static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 attr, int channel,
>> @@ -151,8 +163,10 @@ static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 att
>>   	/* return the value only if limit is enabled */
>>   	if (attr == PL1_HWMON_ATTR)
>>   		*uval = (val0 & PWR_LIM_EN) ? val0 : 0;
>> +	else if (attr == PL2_HWMON_ATTR)
>> +		*uval = (val1 & PWR_LIM_EN) ? val1 : 0;
>>   	else if (attr == hwmon_power_label)
>> -		*uval = (val0 & PWR_LIM_EN) ? 1 : 0;
>> +		*uval = (val0 & PWR_LIM_EN) ? 1 : (val1 & PWR_LIM_EN) ? 1 : 0;
>>   	else
>>   		*uval = 0;
>>   
>> @@ -180,6 +194,8 @@ static int xe_hwmon_pcode_write_power_limit(const struct xe_hwmon *hwmon, u32 at
>>   
>>   	if (attr == PL1_HWMON_ATTR)
>>   		val0 = uval;
>> +	else if (attr == PL2_HWMON_ATTR)
>> +		val1 = uval;
>>   	else
>>   		return -EIO;
>>   
>> @@ -273,7 +289,7 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>>    */
>>   static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *value)
>>   {
>> -	u64 reg_val, min, max;
>> +	u64 reg_val = 0, min, max;
>>   	struct xe_device *xe = hwmon->xe;
>>   	struct xe_reg rapl_limit, pkg_power_sku;
>>   	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>> @@ -301,8 +317,8 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, u32 attr, int channe
>>   	/* Check if PL limits are disabled. */
>>   	if (!(reg_val & PWR_LIM_EN)) {
>>   		*value = PL_DISABLE;
>> -		drm_warn(&hwmon->xe->drm, "%s disabled for channel %d !, val 0x%016llx\n",
>> -			 PWR_ATTR_TO_STR(attr), channel, reg_val);
>> +		drm_dbg(&hwmon->xe->drm, "%s disabled for channel %d\n",  PWR_ATTR_TO_STR(attr),
>> +			channel);
>>   		goto unlock;
>>   	}
>>   
>> @@ -327,7 +343,7 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
>>   {
>>   	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>>   	int ret = 0;
>> -	u32 reg_val;
>> +	u32 reg_val, max;
>>   	struct xe_reg rapl_limit;
>>   
>>   	mutex_lock(&hwmon->hwmon_lock);
>> @@ -355,20 +371,24 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
>>   
>>   	/* Computation in 64-bits to avoid overflow. Round to nearest. */
>>   	reg_val = DIV_ROUND_CLOSEST_ULL((u64)value << hwmon->scl_shift_power, SF_POWER);
>> -	reg_val = PWR_LIM_EN | REG_FIELD_PREP(PWR_LIM_VAL, reg_val);
>>   
>>   	/*
>>   	 * Clamp power limit to card-firmware default as maximum, as an additional protection to
>>   	 * pcode clamp.
>>   	 */
>>   	if (hwmon->xe->info.has_mbx_power_limits) {
>> -		if (reg_val > REG_FIELD_GET(PWR_LIM_VAL, hwmon->pl1_on_boot[channel])) {
>> -			reg_val = REG_FIELD_GET(PWR_LIM_VAL, hwmon->pl1_on_boot[channel]);
>> +		max = (attr == PL1_HWMON_ATTR) ?
>> +		       hwmon->pl1_on_boot[channel] : hwmon->pl2_on_boot[channel];
>> +		max = REG_FIELD_PREP(PWR_LIM_VAL, max);
>> +		if (reg_val > max) {
>> +			reg_val = max;
>>   			drm_dbg(&hwmon->xe->drm, "Clamping power limit to firmware default 0x%x\n",
>>   				reg_val);
>>   		}
>>   	}
>>   
>> +	reg_val = PWR_LIM_EN | REG_FIELD_PREP(PWR_LIM_VAL, reg_val);
>> +
>>   	if (hwmon->xe->info.has_mbx_power_limits)
>>   		ret = xe_hwmon_pcode_write_power_limit(hwmon, attr, channel, reg_val);
>>   	else
>> @@ -452,8 +472,9 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
>>   	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>>   	u32 x, y, x_w = 2; /* 2 bits */
>>   	u64 r, tau4, out;
>> -	int channel = to_sensor_dev_attr(attr)->index;
>> +	int channel = (to_sensor_dev_attr(attr)->index % 2) ? CHANNEL_PKG : CHANNEL_CARD;
>>   	u32 power_attr = PL1_HWMON_ATTR;
>> +
>>   	int ret = 0;
>>   
>>   	xe_pm_runtime_get(hwmon->xe);
>> @@ -506,9 +527,9 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
>>   	u32 x, y, rxy, x_w = 2; /* 2 bits */
>>   	u64 tau4, r, max_win;
>>   	unsigned long val;
>> -	int ret;
>> -	int channel = to_sensor_dev_attr(attr)->index;
>> +	int channel = (to_sensor_dev_attr(attr)->index % 2) ? CHANNEL_PKG : CHANNEL_CARD;
>>   	u32 power_attr = PL1_HWMON_ATTR;
>> +	int ret;
>>   
>>   	ret = kstrtoul(buf, 0, &val);
>>   	if (ret)
>> @@ -535,10 +556,8 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
>>   	tau4 = (u64)((1 << x_w) | x) << y;
>>   	max_win = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
>>   
>> -	if (val > max_win) {
>> -		drm_warn(&hwmon->xe->drm, "power_interval invalid val 0x%lx\n", val);
>> +	if (val > max_win)
>>   		return -EINVAL;
>> -	}
>>   
>>   	/* val in hw units */
>>   	val = DIV_ROUND_CLOSEST_ULL((u64)val << hwmon->scl_shift_time, SF_TIME) + 1;
>> @@ -582,11 +601,11 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
>>   /* PSYS PL1 */
>>   static SENSOR_DEVICE_ATTR(power1_max_interval, 0664,
>>   			  xe_hwmon_power_max_interval_show,
>> -			  xe_hwmon_power_max_interval_store, CHANNEL_CARD);
>> -
>> +			  xe_hwmon_power_max_interval_store, SENSOR_INDEX_PSYS_PL1);
>> +/* PKG PL1 */
>>   static SENSOR_DEVICE_ATTR(power2_max_interval, 0664,
>>   			  xe_hwmon_power_max_interval_show,
>> -			  xe_hwmon_power_max_interval_store, CHANNEL_PKG);
>> +			  xe_hwmon_power_max_interval_store, SENSOR_INDEX_PKG_PL1);
>>   
>>   static struct attribute *hwmon_attributes[] = {
>>   	&sensor_dev_attr_power1_max_interval.dev_attr.attr,
>> @@ -600,7 +619,7 @@ static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
>>   	struct device *dev = kobj_to_dev(kobj);
>>   	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>>   	int ret = 0;
>> -	int channel = index ? CHANNEL_PKG : CHANNEL_CARD;
>> +	int channel = (index % 2) ? CHANNEL_PKG : CHANNEL_CARD;
>>   	u32 power_attr = PL1_HWMON_ATTR;
>>   	u32 uval;
>>   
>> @@ -609,7 +628,7 @@ static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
>>   	if (hwmon->xe->info.has_mbx_power_limits) {
>>   		xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, &uval);
>>   		ret = (uval & PWR_LIM_EN) ? attr->mode : 0;
>> -	} else {
>> +	} else if (power_attr != PL2_HWMON_ATTR) {
>>   		ret = xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT,
>>   						       channel)) ? attr->mode : 0;
>>   	}
>> @@ -632,8 +651,9 @@ static const struct attribute_group *hwmon_groups[] = {
>>   static const struct hwmon_channel_info * const hwmon_info[] = {
>>   	HWMON_CHANNEL_INFO(temp, HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
>>   			   HWMON_T_INPUT | HWMON_T_LABEL),
>> -	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT,
>> -			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL),
>> +	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
>> +			   HWMON_P_CAP,
>> +			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CAP),
>>   	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL),
>>   	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL),
>>   	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
>> @@ -754,17 +774,22 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>>   static umode_t
>>   xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   {
>> -	u32 uval;
>> +	u32 uval = 0;
>> +	struct xe_reg rapl_limit;
>> +	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>>   
>>   	switch (attr) {
>>   	case hwmon_power_max:
>> +	case hwmon_power_cap:
>> +	case hwmon_power_label:
>>   		if (hwmon->xe->info.has_mbx_power_limits) {
>>   			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &uval);
>> -			return (uval) ? 0664 : 0;
>> -		} else {
>> -			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT,
>> -				       channel)) ? 0664 : 0;
>> +		} else if (attr != PL2_HWMON_ATTR) {
>> +			rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
>> +			if (xe_reg_is_valid(rapl_limit))
>> +				uval = xe_mmio_read32(mmio, rapl_limit);
>>   		}
>> +		return (uval) ? (attr == hwmon_power_label) ? 0444 : 0664 : 0;
>>   	case hwmon_power_rated_max:
>>   		if (hwmon->xe->info.has_mbx_power_limits)
>>   			return 0;
>> @@ -772,11 +797,9 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU,
>>   					       channel)) ? 0444 : 0;
>>   	case hwmon_power_crit:
>> -	case hwmon_power_label:
>>   		if (channel == CHANNEL_CARD) {
>>   			xe_hwmon_pcode_read_i1(hwmon, &uval);
>> -			return (uval & POWER_SETUP_I1_WATTS) ? (attr == hwmon_power_label) ?
>> -				0444 : 0644 : 0;
>> +			return (uval & POWER_SETUP_I1_WATTS) ? 0644 : 0;
>>   		}
>>   		break;
>>   	default:
>> @@ -790,6 +813,7 @@ xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>>   {
>>   	switch (attr) {
>>   	case hwmon_power_max:
>> +	case hwmon_power_cap:
>>   		xe_hwmon_power_max_read(hwmon, attr, channel, val);
>>   		return 0;
>>   	case hwmon_power_rated_max:
>> @@ -806,6 +830,7 @@ static int
>>   xe_hwmon_power_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
>>   {
>>   	switch (attr) {
>> +	case hwmon_power_cap:
>>   	case hwmon_power_max:
>>   		return xe_hwmon_power_max_write(hwmon, attr, channel, val);
>>   	case hwmon_power_crit:
>> @@ -1132,7 +1157,11 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>>   		if (xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_CARD,
>>   						    &hwmon->pl1_on_boot[CHANNEL_CARD]) |
>>   		    xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_PKG,
>> -						    &hwmon->pl1_on_boot[CHANNEL_PKG])) {
>> +						    &hwmon->pl1_on_boot[CHANNEL_PKG]) |
>> +		    xe_hwmon_pcode_read_power_limit(hwmon, PL2_HWMON_ATTR, CHANNEL_CARD,
>> +						    &hwmon->pl2_on_boot[CHANNEL_CARD]) |
>> +		    xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_PKG,
>> +						    &hwmon->pl2_on_boot[CHANNEL_PKG])) {
>>   			drm_warn(&hwmon->xe->drm,
>>   				 "Failed to read power limits, check card firmware !\n");
>>   		} else {
>> @@ -1144,6 +1173,12 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>>   			xe_hwmon_pcode_write_power_limit(hwmon, PL1_HWMON_ATTR,
>>   							 CHANNEL_PKG,
>>   							 hwmon->pl1_on_boot[CHANNEL_PKG]);
>> +			xe_hwmon_pcode_write_power_limit(hwmon, PL2_HWMON_ATTR,
>> +							 CHANNEL_CARD,
>> +							 hwmon->pl2_on_boot[CHANNEL_CARD]);
>> +			xe_hwmon_pcode_write_power_limit(hwmon, PL2_HWMON_ATTR,
>> +							 CHANNEL_PKG,
>> +							 hwmon->pl2_on_boot[CHANNEL_PKG]);
>>   			hwmon->scl_shift_power = PWR_UNIT;
>>   			hwmon->scl_shift_energy = ENERGY_UNIT;
>>   			hwmon->scl_shift_time = TIME_UNIT;
>> -- 
>> 2.25.1
>>
--------------QkkIe7mkikZCNAYKcsbSJHqe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 23-05-2025 22:46, Rodrigo Vivi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aDCtfnqRqs27adSg@intel.com">
      <pre wrap="" class="moz-quote-pre">On Fri, May 23, 2025 at 08:30:12PM +0530, Karthik Poosa wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Add support to manage power limit PL2 (burst limit) through
pcode mailbox commands.

v2:
 - Update power1_cap definition in hwmon documentation. (Badal)
 - Clamp PL2 power limit to BIOS default value.

v3:
 - Activate the power label when either the PL1 or PL2 power
   limit is enabled.

v4:
 - Update description of pl2_on_boot variable to fix kernel-doc
   error.

v5:
 - Remove unnecessary drm_warn.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Please let's not merge this series and calm down here and stop trying
to rush things in.

If drm_warn is not necessary, please have it in separate commits explaining why.

Think about the use case. When the user are reading 0 because the read failed,
don't we want a splat?
Why it would only appear when debug is enabled?
In this case is zero a meaningful value?

Well, I'm not telling that one way or another is right here, but
I'm seeing that this series is trying hard to bypass CI and rush
things in. We need to calm down here please.

Think about the cases were the reads are failing. Is it really
only when it is enabled? Then shouldn't we check for the enabling
before attempt to read? no clean way to inform the user of errors?
</pre>
    </blockquote>
    <p><span style="color: rgb(66, 66, 66); font-family: &quot;Segoe Sans&quot;, &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(250, 250, 250); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">The
        below log appears when the power limit is disabled, indicating
        the IFWI/BIOS power limit configuration.</span></p>
    <p><span style="color: rgb(66, 66, 66); font-family: &quot;Segoe Sans&quot;, &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(250, 250, 250); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">It
        is not due to a read failure.</span></p>
    <pre wrap="" class="moz-quote-pre">if (!(reg_val &amp; PWR_LIM_EN)) {
	*value = PL_DISABLE;
	drm_warn(&amp;hwmon-&gt;xe-&gt;drm, &quot;%s disabled for channel %d\n&quot;,  PWR_ATTR_TO_STR(attr), channel);</pre>
    <p><span style="color: rgb(66, 66, 66); font-family: &quot;Segoe Sans&quot;, &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(250, 250, 250); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"></span></p>
    <p><span style="color: rgb(66, 66, 66); font-family: &quot;Segoe Sans&quot;, &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(250, 250, 250); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Sysfs
        entries are created if MMIO register available on the platform.</span></p>
    <p>We could avoid creating the sysfs entry if power limits are
      disabled in the register.</p>
    <blockquote type="cite" cite="mid:aDCtfnqRqs27adSg@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> - Rectify powerX_label permission to read-only on platforms
   without mailbox power limits support.
 - Expose powerX_cap entries only on platforms with mailbox
   support.

Signed-off-by: Karthik Poosa <a class="moz-txt-link-rfc2396E" href="mailto:karthik.poosa@intel.com">&lt;karthik.poosa@intel.com&gt;</a>
Reviewed-by: Badal Nilawar <a class="moz-txt-link-rfc2396E" href="mailto:badal.nilawar@intel.com">&lt;badal.nilawar@intel.com&gt;</a>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 30 ++++++
 drivers/gpu/drm/xe/xe_hwmon.c                 | 97 +++++++++++++------
 2 files changed, 96 insertions(+), 31 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 5a91dcccd3ac..dffd6443664a 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -148,3 +148,33 @@ Contact:	<a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a>
 Description:	RO. Fan 3 speed in RPM.
 
 		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon&lt;i&gt;/power1_cap
+Date:		May 2025
+KernelVersion:	6.15
+Contact:	<a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a>
+Description:	RW. Card burst (PL2) power limit in microwatts.
+
+		The power controller will throttle the operating frequency
+		if the power averaged over a window (typically milli seconds)
+		exceeds this limit. A read value of 0 means that the PL2
+		power limit is disabled, writing 0 disables the	limit.
+		PL2 is greater than PL1 and its time window is lesser
+		compared to PL1.
+
+		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon&lt;i&gt;/power2_cap
+Date:		May 2025
+KernelVersion:	6.15
+Contact:	<a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a>
+Description:	RW. Package burst (PL2) power limit in microwatts.
+
+		The power controller will throttle the operating frequency
+		if the power averaged over a window (typically milli seconds)
+		exceeds this limit. A read value of 0 means that the PL2
+		power limit is disabled, writing 0 disables the	limit.
+		PL2 is greater than PL1 and its time window is lesser
+		compared to PL1.
+
+		Only supported for particular Intel Xe graphics platforms.
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 7cfb233ac9a2..caf6a43ac92b 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -51,6 +51,14 @@ enum xe_fan_channel {
 	FAN_MAX,
 };
 
+/* Attribute index for powerX_xxx_interval sysfs entries */
+enum sensor_attr_power {
+	SENSOR_INDEX_PSYS_PL1,
+	SENSOR_INDEX_PKG_PL1,
+	SENSOR_INDEX_PSYS_PL2,
+	SENSOR_INDEX_PKG_PL2,
+};
+
 /*
  * For platforms that support mailbox commands for power limits, REG_PKG_POWER_SKU_UNIT is
  * not supported and below are SKU units to be used.
@@ -72,8 +80,9 @@ enum xe_fan_channel {
  * PL*_HWMON_ATTR - mapping of hardware power limits to corresponding hwmon power attribute.
  */
 #define PL1_HWMON_ATTR	hwmon_power_max
+#define PL2_HWMON_ATTR	hwmon_power_cap
 
-#define PWR_ATTR_TO_STR(attr)	(((attr) == hwmon_power_max) ? &quot;PL1&quot; : &quot;Invalid&quot;)
+#define PWR_ATTR_TO_STR(attr)	(((attr) == hwmon_power_max) ? &quot;PL1&quot; : &quot;PL2&quot;)
 
 /*
  * Timeout for power limit write mailbox command.
@@ -124,6 +133,9 @@ struct xe_hwmon {
 	bool boot_power_limit_read;
 	/** @pl1_on_boot: power limit PL1 on boot */
 	u32 pl1_on_boot[CHANNEL_MAX];
+	/** @pl2_on_boot: power limit PL2 on boot */
+	u32 pl2_on_boot[CHANNEL_MAX];
+
 };
 
 static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 attr, int channel,
@@ -151,8 +163,10 @@ static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 att
 	/* return the value only if limit is enabled */
 	if (attr == PL1_HWMON_ATTR)
 		*uval = (val0 &amp; PWR_LIM_EN) ? val0 : 0;
+	else if (attr == PL2_HWMON_ATTR)
+		*uval = (val1 &amp; PWR_LIM_EN) ? val1 : 0;
 	else if (attr == hwmon_power_label)
-		*uval = (val0 &amp; PWR_LIM_EN) ? 1 : 0;
+		*uval = (val0 &amp; PWR_LIM_EN) ? 1 : (val1 &amp; PWR_LIM_EN) ? 1 : 0;
 	else
 		*uval = 0;
 
@@ -180,6 +194,8 @@ static int xe_hwmon_pcode_write_power_limit(const struct xe_hwmon *hwmon, u32 at
 
 	if (attr == PL1_HWMON_ATTR)
 		val0 = uval;
+	else if (attr == PL2_HWMON_ATTR)
+		val1 = uval;
 	else
 		return -EIO;
 
@@ -273,7 +289,7 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
  */
 static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *value)
 {
-	u64 reg_val, min, max;
+	u64 reg_val = 0, min, max;
 	struct xe_device *xe = hwmon-&gt;xe;
 	struct xe_reg rapl_limit, pkg_power_sku;
 	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
@@ -301,8 +317,8 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, u32 attr, int channe
 	/* Check if PL limits are disabled. */
 	if (!(reg_val &amp; PWR_LIM_EN)) {
 		*value = PL_DISABLE;
-		drm_warn(&amp;hwmon-&gt;xe-&gt;drm, &quot;%s disabled for channel %d !, val 0x%016llx\n&quot;,
-			 PWR_ATTR_TO_STR(attr), channel, reg_val);
+		drm_dbg(&amp;hwmon-&gt;xe-&gt;drm, &quot;%s disabled for channel %d\n&quot;,  PWR_ATTR_TO_STR(attr),
+			channel);
 		goto unlock;
 	}
 
@@ -327,7 +343,7 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
 {
 	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon-&gt;xe);
 	int ret = 0;
-	u32 reg_val;
+	u32 reg_val, max;
 	struct xe_reg rapl_limit;
 
 	mutex_lock(&amp;hwmon-&gt;hwmon_lock);
@@ -355,20 +371,24 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
 
 	/* Computation in 64-bits to avoid overflow. Round to nearest. */
 	reg_val = DIV_ROUND_CLOSEST_ULL((u64)value &lt;&lt; hwmon-&gt;scl_shift_power, SF_POWER);
-	reg_val = PWR_LIM_EN | REG_FIELD_PREP(PWR_LIM_VAL, reg_val);
 
 	/*
 	 * Clamp power limit to card-firmware default as maximum, as an additional protection to
 	 * pcode clamp.
 	 */
 	if (hwmon-&gt;xe-&gt;info.has_mbx_power_limits) {
-		if (reg_val &gt; REG_FIELD_GET(PWR_LIM_VAL, hwmon-&gt;pl1_on_boot[channel])) {
-			reg_val = REG_FIELD_GET(PWR_LIM_VAL, hwmon-&gt;pl1_on_boot[channel]);
+		max = (attr == PL1_HWMON_ATTR) ?
+		       hwmon-&gt;pl1_on_boot[channel] : hwmon-&gt;pl2_on_boot[channel];
+		max = REG_FIELD_PREP(PWR_LIM_VAL, max);
+		if (reg_val &gt; max) {
+			reg_val = max;
 			drm_dbg(&amp;hwmon-&gt;xe-&gt;drm, &quot;Clamping power limit to firmware default 0x%x\n&quot;,
 				reg_val);
 		}
 	}
 
+	reg_val = PWR_LIM_EN | REG_FIELD_PREP(PWR_LIM_VAL, reg_val);
+
 	if (hwmon-&gt;xe-&gt;info.has_mbx_power_limits)
 		ret = xe_hwmon_pcode_write_power_limit(hwmon, attr, channel, reg_val);
 	else
@@ -452,8 +472,9 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
 	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon-&gt;xe);
 	u32 x, y, x_w = 2; /* 2 bits */
 	u64 r, tau4, out;
-	int channel = to_sensor_dev_attr(attr)-&gt;index;
+	int channel = (to_sensor_dev_attr(attr)-&gt;index % 2) ? CHANNEL_PKG : CHANNEL_CARD;
 	u32 power_attr = PL1_HWMON_ATTR;
+
 	int ret = 0;
 
 	xe_pm_runtime_get(hwmon-&gt;xe);
@@ -506,9 +527,9 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
 	u32 x, y, rxy, x_w = 2; /* 2 bits */
 	u64 tau4, r, max_win;
 	unsigned long val;
-	int ret;
-	int channel = to_sensor_dev_attr(attr)-&gt;index;
+	int channel = (to_sensor_dev_attr(attr)-&gt;index % 2) ? CHANNEL_PKG : CHANNEL_CARD;
 	u32 power_attr = PL1_HWMON_ATTR;
+	int ret;
 
 	ret = kstrtoul(buf, 0, &amp;val);
 	if (ret)
@@ -535,10 +556,8 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
 	tau4 = (u64)((1 &lt;&lt; x_w) | x) &lt;&lt; y;
 	max_win = mul_u64_u32_shr(tau4, SF_TIME, hwmon-&gt;scl_shift_time + x_w);
 
-	if (val &gt; max_win) {
-		drm_warn(&amp;hwmon-&gt;xe-&gt;drm, &quot;power_interval invalid val 0x%lx\n&quot;, val);
+	if (val &gt; max_win)
 		return -EINVAL;
-	}
 
 	/* val in hw units */
 	val = DIV_ROUND_CLOSEST_ULL((u64)val &lt;&lt; hwmon-&gt;scl_shift_time, SF_TIME) + 1;
@@ -582,11 +601,11 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
 /* PSYS PL1 */
 static SENSOR_DEVICE_ATTR(power1_max_interval, 0664,
 			  xe_hwmon_power_max_interval_show,
-			  xe_hwmon_power_max_interval_store, CHANNEL_CARD);
-
+			  xe_hwmon_power_max_interval_store, SENSOR_INDEX_PSYS_PL1);
+/* PKG PL1 */
 static SENSOR_DEVICE_ATTR(power2_max_interval, 0664,
 			  xe_hwmon_power_max_interval_show,
-			  xe_hwmon_power_max_interval_store, CHANNEL_PKG);
+			  xe_hwmon_power_max_interval_store, SENSOR_INDEX_PKG_PL1);
 
 static struct attribute *hwmon_attributes[] = {
 	&amp;sensor_dev_attr_power1_max_interval.dev_attr.attr,
@@ -600,7 +619,7 @@ static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
 	struct device *dev = kobj_to_dev(kobj);
 	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
 	int ret = 0;
-	int channel = index ? CHANNEL_PKG : CHANNEL_CARD;
+	int channel = (index % 2) ? CHANNEL_PKG : CHANNEL_CARD;
 	u32 power_attr = PL1_HWMON_ATTR;
 	u32 uval;
 
@@ -609,7 +628,7 @@ static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
 	if (hwmon-&gt;xe-&gt;info.has_mbx_power_limits) {
 		xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, &amp;uval);
 		ret = (uval &amp; PWR_LIM_EN) ? attr-&gt;mode : 0;
-	} else {
+	} else if (power_attr != PL2_HWMON_ATTR) {
 		ret = xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT,
 						       channel)) ? attr-&gt;mode : 0;
 	}
@@ -632,8 +651,9 @@ static const struct attribute_group *hwmon_groups[] = {
 static const struct hwmon_channel_info * const hwmon_info[] = {
 	HWMON_CHANNEL_INFO(temp, HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
 			   HWMON_T_INPUT | HWMON_T_LABEL),
-	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT,
-			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL),
+	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
+			   HWMON_P_CAP,
+			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CAP),
 	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL),
 	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL),
 	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
@@ -754,17 +774,22 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 static umode_t
 xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 {
-	u32 uval;
+	u32 uval = 0;
+	struct xe_reg rapl_limit;
+	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon-&gt;xe);
 
 	switch (attr) {
 	case hwmon_power_max:
+	case hwmon_power_cap:
+	case hwmon_power_label:
 		if (hwmon-&gt;xe-&gt;info.has_mbx_power_limits) {
 			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &amp;uval);
-			return (uval) ? 0664 : 0;
-		} else {
-			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT,
-				       channel)) ? 0664 : 0;
+		} else if (attr != PL2_HWMON_ATTR) {
+			rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
+			if (xe_reg_is_valid(rapl_limit))
+				uval = xe_mmio_read32(mmio, rapl_limit);
 		}
+		return (uval) ? (attr == hwmon_power_label) ? 0444 : 0664 : 0;
 	case hwmon_power_rated_max:
 		if (hwmon-&gt;xe-&gt;info.has_mbx_power_limits)
 			return 0;
@@ -772,11 +797,9 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU,
 					       channel)) ? 0444 : 0;
 	case hwmon_power_crit:
-	case hwmon_power_label:
 		if (channel == CHANNEL_CARD) {
 			xe_hwmon_pcode_read_i1(hwmon, &amp;uval);
-			return (uval &amp; POWER_SETUP_I1_WATTS) ? (attr == hwmon_power_label) ?
-				0444 : 0644 : 0;
+			return (uval &amp; POWER_SETUP_I1_WATTS) ? 0644 : 0;
 		}
 		break;
 	default:
@@ -790,6 +813,7 @@ xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 {
 	switch (attr) {
 	case hwmon_power_max:
+	case hwmon_power_cap:
 		xe_hwmon_power_max_read(hwmon, attr, channel, val);
 		return 0;
 	case hwmon_power_rated_max:
@@ -806,6 +830,7 @@ static int
 xe_hwmon_power_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
 {
 	switch (attr) {
+	case hwmon_power_cap:
 	case hwmon_power_max:
 		return xe_hwmon_power_max_write(hwmon, attr, channel, val);
 	case hwmon_power_crit:
@@ -1132,7 +1157,11 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
 		if (xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_CARD,
 						    &amp;hwmon-&gt;pl1_on_boot[CHANNEL_CARD]) |
 		    xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_PKG,
-						    &amp;hwmon-&gt;pl1_on_boot[CHANNEL_PKG])) {
+						    &amp;hwmon-&gt;pl1_on_boot[CHANNEL_PKG]) |
+		    xe_hwmon_pcode_read_power_limit(hwmon, PL2_HWMON_ATTR, CHANNEL_CARD,
+						    &amp;hwmon-&gt;pl2_on_boot[CHANNEL_CARD]) |
+		    xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_PKG,
+						    &amp;hwmon-&gt;pl2_on_boot[CHANNEL_PKG])) {
 			drm_warn(&amp;hwmon-&gt;xe-&gt;drm,
 				 &quot;Failed to read power limits, check card firmware !\n&quot;);
 		} else {
@@ -1144,6 +1173,12 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
 			xe_hwmon_pcode_write_power_limit(hwmon, PL1_HWMON_ATTR,
 							 CHANNEL_PKG,
 							 hwmon-&gt;pl1_on_boot[CHANNEL_PKG]);
+			xe_hwmon_pcode_write_power_limit(hwmon, PL2_HWMON_ATTR,
+							 CHANNEL_CARD,
+							 hwmon-&gt;pl2_on_boot[CHANNEL_CARD]);
+			xe_hwmon_pcode_write_power_limit(hwmon, PL2_HWMON_ATTR,
+							 CHANNEL_PKG,
+							 hwmon-&gt;pl2_on_boot[CHANNEL_PKG]);
 			hwmon-&gt;scl_shift_power = PWR_UNIT;
 			hwmon-&gt;scl_shift_energy = ENERGY_UNIT;
 			hwmon-&gt;scl_shift_time = TIME_UNIT;
-- 
2.25.1

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------QkkIe7mkikZCNAYKcsbSJHqe--
