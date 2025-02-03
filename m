Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E4EC02192
	for <intel-xe@archiver.kernel.org>; Mon,  3 Feb 2025 20:23:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C370010E561;
	Mon,  3 Feb 2025 20:23:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OdSYW5Eu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D0210E561
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Feb 2025 20:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738614237; x=1770150237;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RvY0IA22SKyXtfSSAHAty9CBR4WiV3qn4HUm/+0quyM=;
 b=OdSYW5Euyw842UqOOFGKoud9mYeb/Z0UOT/YR3kGtWp7fWkSBEjKHEPK
 v3y+ukefH7WEAjo1c1h45jRsqrJeFiMy9HKzc5sf/A2sjxSrfRMYqBzEZ
 6pi0uMl8EeJ4SbnbtUAjQqh5quwdXz8mExg4fGAVsAcTQZ3SqRvgJjJUY
 wkgTcLbcOS6jHN7zm0YTXnZkAs7GC3BpUT+l05+SMMD7CAPPkh/vWteMl
 +tboE24jYXkkuCpkDOAqQyYhzphBcG42nt9Gzzg60ep2onYvGi42kNxrV
 EF8Krhdz1X2Z85AniaRgJfg73pbPx64+n1fwnWIKJ1HvawhgvmgHpTkV4 Q==;
X-CSE-ConnectionGUID: Wy+5QygAQuW+JZFZp/l1Bg==
X-CSE-MsgGUID: 80HUEh98QvqjJ3q8OhWZ5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39001698"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; d="scan'208";a="39001698"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 12:23:56 -0800
X-CSE-ConnectionGUID: IJ36K+hsQbuoT9x/uQpnFA==
X-CSE-MsgGUID: Wz7mk0SPSZW8UKXq/HT3aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115546121"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Feb 2025 12:23:57 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 3 Feb 2025 12:23:56 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 3 Feb 2025 12:23:56 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Feb 2025 12:23:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yNJC9QuXa2NyktRBQHPV9jZapK9FbhgwtYakgiHZUS+322274asEAZ2E+PVwnVTLbmS6PSlmXGKZoo6gJgyJU5MPaYtCmDSaFDUrQRvWMOvSJMlp9vlQUSDswZ04hgw9uSdtkdZuvchPk7r1mHtKGaI3aR/T4+IEFOPzQ3eA7KncPbEo1KZQUo8Gn9O/AXsn0P2XZ5kS+MNFLzYyn1dWfC2CbZR77Mw8VlWbqStFUvwBTWc+htQp6h/SwecCwY2bKcVRS2E/sBdQg+HyAB/o6eCTlHNptQkq7dKztlvITRbkIUThZsPa43XKV8LvRFDJruhoQw/QHQd6hHiBD9Wnog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WO+Gxxde9Dfga5SZdl0r/0WWvfyT3hggQm9AEWkoC2s=;
 b=TE/BJysShZrvOV+ZJycfvgOJWt/JEFKs4l536ne98/ySkZP3a9ZYDHYh9MUnVCh76/WEwDS+Ev767ZDlGwtGgdj6p4a5FhWjIH/dwR0tjoavYjNsleRSQIkBiH5NFzSb/wfnUZ2jDixFOtWjIfXiunVm8d0B0yOr8dgrbvV6We8SO0tYhSPgqCNCh0mbxR53RTxV9nGwmTDNQIHoJahgsMEwDuOfv4GSnYuORsOrNHjClh3NXQnuxhe0PChnaNhOjxmBRs1Fmt7sY5xMMQopjkKhAKObC27bQo6a+uoAjU1iXThbsQNdLqBNjPp6l0JfFsKDCLArJF0llNsuCtpahA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by LV1PR11MB8792.namprd11.prod.outlook.com (2603:10b6:408:2b5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 20:23:51 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%4]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 20:23:51 +0000
Message-ID: <6de6da2e-82b0-422b-bc74-c3845e108e00@intel.com>
Date: Mon, 3 Feb 2025 12:23:49 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pmu: Add GT frequency events
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250131044728.4107618-1-vinay.belgaumkar@intel.com>
 <vgfnvvmhwgnqmzitjkdi2zv6wo6ygyu3cck5dia3nbjszmjuvc@6zvmk5s3z35t>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <vgfnvvmhwgnqmzitjkdi2zv6wo6ygyu3cck5dia3nbjszmjuvc@6zvmk5s3z35t>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0019.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::32) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|LV1PR11MB8792:EE_
X-MS-Office365-Filtering-Correlation-Id: 5504be47-4b56-42ec-0c3d-08dd4490ac21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UXYyTVlBdmRPZ2RBa2dnalB2QlVHdlF1bDlEalAvV0MySkIrcmhuVHJwMkVJ?=
 =?utf-8?B?M2ZqMkx3NkxRZjVJaVhGZEdtL0k0QXhibXI0ZnhvNEVFZjlBTWFhbjBNNU9C?=
 =?utf-8?B?QnhhUmFIR2ZOd2pGM0FrcHNDMlRET20xWnFvaWcwOVVLUVh5NUg3cEhrZ0Va?=
 =?utf-8?B?ZXRDd3UzS3NWZHRVc1JxUjcxZEdIRW1QQnNDbWxSOWxHMDBRV3ZzODMvUzVr?=
 =?utf-8?B?Yk5qSi9VSUlNemFxWnZNQk1pZXlqbEllMjgvTGFwclhnNk1Fa0tFTVhBUnVo?=
 =?utf-8?B?SUVhTFhpNkt5ZlFuR2NQZ3JBbTlqWktqbmo4ZUZqZEtNRWloeGl2dlFWdk1V?=
 =?utf-8?B?L0dnS2hDZWdlcVluV09QUGJ0QTBKTElpSXdmVnVtNStqMkgzYkxsVmMxTVRJ?=
 =?utf-8?B?RUJlWXFua3U2TCtXdDg0b3dHS0dZVU5VSWRZNkNVc1I2c291NzFOczc2TzlY?=
 =?utf-8?B?Q0IvMGRtWFNaRytkTWhoWVEySFF6WFlkeEFpdnc1czVPOUFLWUxjcm9kMTQ5?=
 =?utf-8?B?TEFYbENyNld5N0xSOXVhOWx4R3BPWjVVTVNwNldLTHRpMTNsSGo4K3JEcnoy?=
 =?utf-8?B?NU9IdHBvcFBITjZaNUNDUjdQeHlkOXBsaTZaNnVJZ1NkNGd2cjBkWWRkVmg3?=
 =?utf-8?B?M3dmVGZSYWNuZVZYL3IzWmdlUTdHR0FRSlg5THFoMGNJdUVFWG1qdEJuS0Fk?=
 =?utf-8?B?L0RlZTBucTB2UjZvUXFUN2JzbGQvZ3h2L3hWY25NVytRV3VwNWRrNU5iTVZq?=
 =?utf-8?B?VHpyWW01clV0TVRkaytJajFWdGNwV3Y0OXdhcXNXOEtYdmcrSDRFN1llZWl2?=
 =?utf-8?B?Mms1Y1k4ckpKYWNZVDNsTGtxVmN2WXNNR2tmdnM1TjdOSjdFYWxGK0h0STB3?=
 =?utf-8?B?MG42WG83dmNKcEdWNFFCcXUyR2w0ZVBkeC9KMzFBNi9WMWVBSXhYbEJRZ0xM?=
 =?utf-8?B?ZHdJaFlFcUM2b3hlRVU5RUhwV2pzRm5ScE9Ha3RaQzBmTm5rZlNzZkpPUXJX?=
 =?utf-8?B?R2pQaUhCeHRoRjhjcHVrYjQwcFdkTWZCQTNCaWs1aUZWcHJxb01GVHZ6amgw?=
 =?utf-8?B?dzNVcGc3VzZoZjlKU0xFVzIxeVErSDlHRnl6VFo0Z2JLS0JiSjFFWjIxK2di?=
 =?utf-8?B?RGo5bE55S3ZWQWtQcVJ0cWtaazBzWFlTWFVIMlIyd0VSTk1yQlNiWmpxajho?=
 =?utf-8?B?K09sZ3NuTVYvSERWWTlWQzJENDYza1dCTUwra2o4M210WHJjeWg3aHlMZkdu?=
 =?utf-8?B?eCtPcmNyb2trNW52QTRIbFk0QUxWb0tEMWRYQWxxRFlwSHQwUWNueGFxa3NQ?=
 =?utf-8?B?ZFlvdUVHdmp6RVE2NHVmWDZPak1BZnUwNzcrazZQblBFYjc4aEd5N1oxUDZG?=
 =?utf-8?B?cVJ2OEhTcGJmT0F2Sy91eEdRNjFPZkUyNkV6aGlDZVlGKzVoMzVYaTdVMm5M?=
 =?utf-8?B?bjNCdTFyNkp0VFhKSU5maWkvRmVxR25BM3ZDNXhIeTd1eWZmNmw5cElENU4v?=
 =?utf-8?B?WDhSaFpMa1RRamRiZHRRS2VXb2NHd3RPUU1YYkNleThYRk8xNWNySHc2Mlcz?=
 =?utf-8?B?c3MxeGZ6SFVYTktES01qL0xkaU9pcFphUzI2WHlUUUhUaTkwbUpjU0RuZmhP?=
 =?utf-8?B?elcyN2k0UCtBZmlYS3lFa09TTkE4dUpSaFVkbWVodVp0UmRIbGhBTmZXOFZS?=
 =?utf-8?B?a3VFbVV4eituY1lVSWJxMDZOUGkxdVIxSXJjM1BBOWRvQXcxSXc3TWdXNjgr?=
 =?utf-8?B?RWRMYXJvQTdzUHpGYS9vYURFSktkTWhUb2N2UHJ5RHFoQWx6S1Y0U2NiS2w3?=
 =?utf-8?B?aDNmVkZsU04zb2tsdEdQNWxWbW1hMXIyTUlINDJBcFFaNXNqOFUxWlRSQmlO?=
 =?utf-8?Q?5OK/JdDxKud1S?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUJoZ0EvTTF2RXNacWZ4c21kRmkxckZWWjF3K3Z0NWN4SnpnSEExTWgzWDg4?=
 =?utf-8?B?aDgxM2IwM0x6Uk9HNEkvd1BCaVNSdVoxSnl4U1BWU1JoS3M0NFJycEw0L0pV?=
 =?utf-8?B?QnA1ejVkOFV6aS8yb1R3NDhYK1JIemJvcXpydXcwbkdTVUJ4TkVQU2dnaDM2?=
 =?utf-8?B?VVpHVjU3dGFvdmE0T3Y4ejlYV1QvVG1UeGQ4RGYzMENxV3BVajg4b3dSZkJW?=
 =?utf-8?B?VTJWZW5YQnBMTU1MQnBhK0drRHhLazdVQzJEeFFFSldWMkU3NXlKWEZRMXdW?=
 =?utf-8?B?ZldNb1dxQUNRQmdZOGIvT3Y3dFlWZkpuaWpZT0VWY0gxNGo3M25SNllITDhE?=
 =?utf-8?B?VkpGdE02MHFnZlgraHNHb2FicGtsOXAxUU9YQ2hza1UrYkZFTzdkVzU5ckhU?=
 =?utf-8?B?dFB1THBSNzl3SytkclJiTktUbXNXelhFZ2ZFZjJla2NtVC93UkZYUDRIY2d4?=
 =?utf-8?B?TmU0RFM4dFgwbkVWREhWd0tzRS9rQzVTc3VrR3lTNjZLWUtOVklldlBwOE1Y?=
 =?utf-8?B?Q2NSQVdMZDYveW94elBEOGg2ZkZzT0ZNVnpmM2VHNURHUGg1eS9iU0dtbCt3?=
 =?utf-8?B?ZEFUdnAwL1hVMFJtVmxaQTFUaWU0bWt0eVVPMkJYRlVHcTBaS1VFVmtiWklj?=
 =?utf-8?B?dlRDMzlyLzhHV05LUThvNzhYUUNRaDh4K0d2U1BiMFNOcnFXZStxYi8zSEta?=
 =?utf-8?B?QW1vL3QvazFxTXY1L3ZEenpDNVc5M1dybVJXV2RBdG9VSnpza3lYakN2U3cz?=
 =?utf-8?B?QmQ0d2M4MHZ3WDJvMnlzVWxqb1hpWC9TckZmSklHR0orTEhsaDkwRENpVVlr?=
 =?utf-8?B?b1NONUdYVjJWUjg5WTk1bUlzVk5qZHhYTHB0MnlzYkc0dWpUL1ZIZ3pVTG9Y?=
 =?utf-8?B?ZGd4LzVPKzd1ekhWM3NUdFJldEFNOGxrUUxuZis3Qm9UM0FVTWNST094ZmFF?=
 =?utf-8?B?NnBOTUk5NzhrYTF4OEl5WCt4WDZoRFhWRHV5Vk1NeTFYMkY4RVFYcWUyVUVV?=
 =?utf-8?B?c1k5YlhrUmVqU3R6bHVoRFVNTWZCQ2oxb3VsTC9LZ0NDU0F2MVY4aks2WGFE?=
 =?utf-8?B?T2pCTFZhOGRJb0lQbHhxSVZFNU5WVVBwdmxsVVI1bDZsOGthUi8weExDQ2w2?=
 =?utf-8?B?KzhXMWl2dXVhVXB0MXIzRCtuSGxjeFczS2Vpd09pQlZDanEwQWFNOW84MmFm?=
 =?utf-8?B?Z0lkakw3YTNtVWR3ZitrOWo3OCtvTit6SUFuRFBtMWFFdWIyNzRoK3ZZTVc1?=
 =?utf-8?B?R2Q3WUZKMkI5cGlqS3ZMQ0F5bDRMUU9WditjMU1SRmc2bnBFOU1BdnFIRTZX?=
 =?utf-8?B?MnlxK2pCRGx6WE9Rcy9Sb0owREhKUjZoTnkrbDBmdElwM1JCTmRUNmN5WVFn?=
 =?utf-8?B?TWVCZVRVaVZCT0pveGlTV21HZkhxL2MwVGJNLy9yVmhhU29leWYrUURrdFlo?=
 =?utf-8?B?NUNWWnpudEswQ1NwOStwMkc1cGw2aTJOSlVuYVJWcUVXcklyMVVQdnVjejIx?=
 =?utf-8?B?VnhKSXJXbkszZlhJcDdkUVZSSk9KQ25FOE0vR3FFY2JaNU15SFdJeDd2M0l5?=
 =?utf-8?B?ajlJc1Y4bk0xUGU1NWZMYTVqMWNhUEp1WnNzNlEyZW5jSTMwOXg2QUFvcG5W?=
 =?utf-8?B?V3dzYjNCMnBtM3dFOS9GR01QUXc2S242eDFMV1E5TlJsTkxNMUk1N0JRQmp2?=
 =?utf-8?B?UE0rUWplMUVFU2haNXBwa2pxdVlpdlJHK3hjY2pZUzJVYnNyYWNVNGhtRDB6?=
 =?utf-8?B?ckp0OWpZOGdLV1NVSUtyS2E0cHFJMGNlTmVhaldKTWJCcXFYY2VkWHZLMnJl?=
 =?utf-8?B?UzZJUTFDWUw2K3NYWjE5eTVXZmIyWWlSSFkzZm01RWtaTFNLeE5Gc2xPN3VL?=
 =?utf-8?B?cjdEQTFtc0pqZXl6S3pOeVprOWhlSnlPa1VqazhLUFJUSzFlV1UvSW40cXJh?=
 =?utf-8?B?bWo4ZWJUZ1liWmRlZW1IQlpxL3lmYTVUYzVpN1VRakV4QlptVlVkTjdWdWpH?=
 =?utf-8?B?WFpQa2UyV2xsZFgrKzV5TkFCZmhBWXJPcktFVFNYTGE1RFBlclN4MGp0YmpW?=
 =?utf-8?B?d1NHaDYydUs4OElRRVk2OHBtcjJBUURhMUZzWGFOU2VvN1JHbWl5b2VoeTQz?=
 =?utf-8?B?bHhOelpsdjBPUXRxb2VsckMwdkp5K3E5SWxOMnJ3c3F2dDBTL21ZR0U3SFA2?=
 =?utf-8?B?WkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5504be47-4b56-42ec-0c3d-08dd4490ac21
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 20:23:51.2103 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: COn8VOeAzLF3zWSIbkf83cEJPkS5GPBB8npCLBZPfxun+tJ70yhZQTYa9CIlGK+cM4DG1GOcy17OiJ4Cs0Nt9qWNDSHvT47S+lZh8SyQfTk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8792
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


On 1/30/2025 9:41 PM, Lucas De Marchi wrote:
> On Thu, Jan 30, 2025 at 08:47:28PM -0800, Vinay Belgaumkar wrote:
>> Define PMU events for GT frequency (actual and requested). This is
>> a port from the i915 driver implementation, where an internal timer
>> is used to aggregate GT frequencies over certain fixed interval.
>> Following PMU events are being added-
>>
>>  xe_0000_00_02.0/gt-actual-frequency/              [Kernel PMU event]
>>  xe_0000_00_02.0/gt-requested-frequency/           [Kernel PMU event]
>>
>> Standard perf commands can be used to monitor GT frequency-
>>  $ perf stat -e xe_0000_00_02.0/gt-requested-frequency,gt=0/ -I1000
>>
>>     1.001175175                700 M xe/gt-requested-frequency,gt=0/
>>     2.005891881                703 M xe/gt-requested-frequency,gt=0/
>>     3.007318169                700 M xe/gt-requested-frequency,gt=0/
>>
>> Actual frequencies will be reported as 0 when GT is suspended.
>>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_pmu.c       | 157 +++++++++++++++++++++++++++++-
>> drivers/gpu/drm/xe/xe_pmu_types.h |  26 +++++
>> 2 files changed, 181 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> index 3910a82328ee..31ce575c834f 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu.c
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -8,6 +8,7 @@
>>
>> #include "xe_device.h"
>> #include "xe_gt_idle.h"
>> +#include "xe_guc_pc.h"
>> #include "xe_pm.h"
>> #include "xe_pmu.h"
>>
>> @@ -37,6 +38,12 @@
>>
>> #define XE_PMU_EVENT_GT_MASK        GENMASK_ULL(63, 60)
>> #define XE_PMU_EVENT_ID_MASK        GENMASK_ULL(11, 0)
>> +#define SAMPLING_TIMER_FREQUENCY_HZ    200
>> +
>> +static struct xe_pmu *event_to_pmu(struct perf_event *event)
>> +{
>> +    return container_of(event->pmu, struct xe_pmu, base);
>> +}
>>
>> static unsigned int config_to_event_id(u64 config)
>> {
>> @@ -49,6 +56,8 @@ static unsigned int config_to_gt_id(u64 config)
>> }
>>
>> #define XE_PMU_EVENT_GT_C6_RESIDENCY    0x01
>> +#define XE_PMU_EVENT_GT_ACTUAL_FREQUENCY    0x02
>> +#define XE_PMU_EVENT_GT_REQUESTED_FREQUENCY    0x04
>>
>> static struct xe_gt *event_to_gt(struct perf_event *event)
>> {
>> @@ -113,9 +122,18 @@ static int xe_pmu_event_init(struct perf_event 
>> *event)
>>     return 0;
>> }
>>
>> +static u64 read_sample(struct xe_pmu *pmu, unsigned int gt_id, int 
>> sample)
>
> please reserve the word "read" for when we are reading from hw
> get_stored_sample() would be better.
ok.
>
>> +{
>> +    return pmu->event_sample[gt_id][sample];
>
> this is read by perf, written by timer, you will need a lock to
> synchronize as a u64 is or may not be atomic.
yup, i think the locks got dropped during the rebase.
>
>> +}
>> +
>> static u64 __xe_pmu_event_read(struct perf_event *event)
>> {
>>     struct xe_gt *gt = event_to_gt(event);
>> +    struct xe_device *xe =
>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +    u64 gt_id = gt->info.id;
>>
>>     if (!gt)
>>         return 0;
>> @@ -123,6 +141,14 @@ static u64 __xe_pmu_event_read(struct perf_event 
>> *event)
>>     switch (config_to_event_id(event->attr.config)) {
>>     case XE_PMU_EVENT_GT_C6_RESIDENCY:
>>         return xe_gt_idle_residency_msec(&gt->gtidle);
>> +    case XE_PMU_EVENT_GT_ACTUAL_FREQUENCY:
>> +        return div_u64(read_sample(pmu, gt_id,
>> +                   __XE_SAMPLE_FREQ_ACT),
>
> if you index it by the event id, then you can pretty much group them
> here. However I'm not sure if the design is correct to store the value
> read in one place. What happens when you have 3 clients reading the same
> event? You are only storing the hw value in one place and returning it
> in all of them. However the old value read is kept per perf_event,
> so it will calculate the different deltas... maybe it's ok, but you are
> definitely missing the lock for the hw sampling, which will need to be
> a raw_spin_lock.
yup, lock is needed where the samples are stored. Also, sampling will be 
common across all clients per GT.
>
>> +                   USEC_PER_SEC /* to MHz */);
>> +    case XE_PMU_EVENT_GT_REQUESTED_FREQUENCY:
>> +        return div_u64(read_sample(pmu, gt_id,
>> +                   __XE_SAMPLE_FREQ_REQ),
>> +                   USEC_PER_SEC /* to MHz */);
>>     }
>>
>>     return 0;
>> @@ -154,8 +180,109 @@ static void xe_pmu_event_read(struct perf_event 
>> *event)
>>     xe_pmu_event_update(event);
>> }
>>
>> +#define CONFIG_EVENT_ENABLED(config, event) \
>> +    (FIELD_GET(XE_PMU_EVENT_ID_MASK, config) & event)
>> +
>> +#define CONFIG_EVENT_ENABLED_GT(config, event, gt) \
>> +    (CONFIG_EVENT_ENABLED(config, event) && \
>> +    (FIELD_GET(XE_PMU_EVENT_GT_MASK, config) == gt))
>> +
>> +static bool pmu_needs_timer(struct xe_pmu *pmu)
>> +{
>> +    return CONFIG_EVENT_ENABLED(pmu->enable,
>> +                    (XE_PMU_EVENT_GT_ACTUAL_FREQUENCY |
>> +                     XE_PMU_EVENT_GT_REQUESTED_FREQUENCY));
>> +}
>> +
>> +static void xe_pmu_start_timer(struct xe_pmu *pmu)
>> +{
>> +    u64 period = max_t(u64, 10000, NSEC_PER_SEC / 
>> SAMPLING_TIMER_FREQUENCY_HZ);
>> +
>> +    if (!pmu->timer_enabled && pmu_needs_timer(pmu)) {
>> +        pmu->timer_enabled = true;
>> +        pmu->timer_last = ktime_get();
>> +        hrtimer_start_range_ns(&pmu->timer,
>> +                       ns_to_ktime(period), 0,
>> +                       HRTIMER_MODE_REL_PINNED);
>> +    }
>> +}
>> +
>> +static void
>> +add_sample_mult(struct xe_pmu *pmu, unsigned int gt_id, int sample, 
>> u32 val, u32 mul)
>> +{
>> +    pmu->event_sample[gt_id][sample] += mul_u32_u32(val, mul);
>> +}
>> +
>> +static void
>> +frequency_sample(struct xe_gt *gt, unsigned int period_ns)
>> +{
>> +    struct xe_device *xe = gt_to_xe(gt);
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +    int ret;
>> +    u32 cur_freq;
>> +
>> +    if (CONFIG_EVENT_ENABLED_GT(pmu->enable, 
>> XE_PMU_EVENT_GT_ACTUAL_FREQUENCY, gt->info.id)) {
>> +        u32 val;
>> +
>> +        /* Actual freq will be 0 when GT is in C6 */
>> +        val = xe_guc_pc_get_act_freq(&gt->uc.guc.pc);
>> +
>> +        add_sample_mult(pmu, gt->info.id, __XE_SAMPLE_FREQ_ACT,
>> +                val, period_ns / 1000);
>> +    }
>> +
>> +    if (CONFIG_EVENT_ENABLED_GT(pmu->enable, 
>> XE_PMU_EVENT_GT_REQUESTED_FREQUENCY,
>> +                    gt->info.id)) {
>> +        ret = xe_guc_pc_get_cur_freq(&gt->uc.guc.pc, &cur_freq);
>> +        if (!ret)
>> +            add_sample_mult(pmu, gt->info.id, __XE_SAMPLE_FREQ_REQ,
>> +                    cur_freq,
>> +                    period_ns / 1000);
>> +    }
>> +}
>> +
>> +static enum hrtimer_restart xe_sample(struct hrtimer *hrtimer)
>> +{
>> +    struct xe_pmu *pmu = container_of(hrtimer, struct xe_pmu, timer);
>> +    struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +    u64 period = max_t(u64, 10000, NSEC_PER_SEC / 
>> SAMPLING_TIMER_FREQUENCY_HZ);
>> +    unsigned int period_ns;
>> +    struct xe_gt *gt;
>> +    ktime_t now;
>> +    unsigned int i;
>> +
>> +    if (!READ_ONCE(pmu->timer_enabled))
>> +        return HRTIMER_NORESTART;
>> +
>> +    now = ktime_get();
>> +    period_ns = ktime_to_ns(ktime_sub(now, pmu->timer_last));
>> +    pmu->timer_last = now;
>> +
>> +    /*
>> +     * The passed in period includes the time needed for grabbing 
>> the forcewake.
>> +     * However, the potential error from timer callback delay 
>> greatly dominates
>> +     * this so we keep it simple.
>> +     */
>> +
>> +    for_each_gt(gt, xe, i)
>> +        frequency_sample(gt, period_ns);
>> +
>> +    hrtimer_forward(hrtimer, now, ns_to_ktime(period));
>> +
>> +    return HRTIMER_RESTART;
>> +}
>> +
>> static void xe_pmu_enable(struct perf_event *event)
>> {
>> +    struct xe_pmu *pmu = event_to_pmu(event);
>> +    struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +
>> +    /* Save the event config */
>> +    pmu->enable |= event->attr.config;
>
> same concern as above... what happens when you have 2 clients reading
> the same event? You storing here the same bits, then when any of them
> stop, you stop updating the other as well.

Added an enable_count as per the previous implementation.

Thanks,

Vinay.

>
> alternative is to have a linked list of active sampling events and use
> the event->active_entry to track that, like done in
> arch/x86/events/rapl.c.
>
> Lucas De Marchi
>
>> +
>> +    /* Start a timer, if needed, to collect samples */
>> +    xe_pmu_start_timer(pmu);
>> +
>>     /*
>>      * Store the current counter value so we can report the correct 
>> delta
>>      * for all listeners. Even when the event was already enabled and 
>> has
>> @@ -176,15 +303,27 @@ static void xe_pmu_event_start(struct 
>> perf_event *event, int flags)
>>     event->hw.state = 0;
>> }
>>
>> +static void xe_pmu_disable(struct perf_event *event)
>> +{
>> +    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>> pmu.base);
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +
>> +    pmu->enable &=  ~event->attr.config;
>> +    pmu->timer_enabled &= pmu_needs_timer(pmu);
>> +}
>> +
>> static void xe_pmu_event_stop(struct perf_event *event, int flags)
>> {
>>     struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>> pmu.base);
>>     struct xe_pmu *pmu = &xe->pmu;
>>
>> -    if (pmu->registered)
>> +    if (pmu->registered) {
>>         if (flags & PERF_EF_UPDATE)
>>             xe_pmu_event_update(event);
>>
>> +        xe_pmu_disable(event);
>> +    }
>> +
>>     event->hw.state = PERF_HES_STOPPED;
>> }
>>
>> @@ -270,6 +409,10 @@ static ssize_t event_attr_show(struct device *dev,
>>     XE_EVENT_ATTR_GROUP(v_, id_, &pmu_event_ ##v_.attr.attr)
>>
>> XE_EVENT_ATTR_SIMPLE(gt-c6-residency, gt_c6_residency, 
>> XE_PMU_EVENT_GT_C6_RESIDENCY, "ms");
>> +XE_EVENT_ATTR_SIMPLE(gt-actual-frequency, gt_actual_frequency,
>> +             XE_PMU_EVENT_GT_ACTUAL_FREQUENCY, "Mhz");
>> +XE_EVENT_ATTR_SIMPLE(gt-requested-frequency, gt_requested_frequency,
>> +             XE_PMU_EVENT_GT_REQUESTED_FREQUENCY, "Mhz");
>>
>> static struct attribute *pmu_empty_event_attrs[] = {
>>     /* Empty - all events are added as groups with .attr_update() */
>> @@ -283,6 +426,8 @@ static const struct attribute_group 
>> pmu_events_attr_group = {
>>
>> static const struct attribute_group *pmu_events_attr_update[] = {
>>     &pmu_group_gt_c6_residency,
>> +    &pmu_group_gt_actual_frequency,
>> +    &pmu_group_gt_requested_frequency,
>>     NULL,
>> };
>>
>> @@ -290,8 +435,11 @@ static void set_supported_events(struct xe_pmu 
>> *pmu)
>> {
>>     struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>>
>> -    if (!xe->info.skip_guc_pc)
>> +    if (!xe->info.skip_guc_pc) {
>>         pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_C6_RESIDENCY);
>> +        pmu->supported_events |= 
>> BIT_ULL(XE_PMU_EVENT_GT_ACTUAL_FREQUENCY);
>> +        pmu->supported_events |= 
>> BIT_ULL(XE_PMU_EVENT_GT_REQUESTED_FREQUENCY);
>> +    }
>> }
>>
>> /**
>> @@ -306,6 +454,8 @@ static void xe_pmu_unregister(void *arg)
>>     if (!pmu->registered)
>>         return;
>>
>> +    hrtimer_cancel(&pmu->timer);
>> +
>>     pmu->registered = false;
>>
>>     perf_pmu_unregister(&pmu->base);
>> @@ -334,6 +484,9 @@ int xe_pmu_register(struct xe_pmu *pmu)
>>     if (IS_SRIOV_VF(xe))
>>         return 0;
>>
>> +    hrtimer_init(&pmu->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>> +    pmu->timer.function = xe_sample;
>> +
>>     name = kasprintf(GFP_KERNEL, "xe_%s",
>>              dev_name(xe->drm.dev));
>>     if (!name)
>> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h 
>> b/drivers/gpu/drm/xe/xe_pmu_types.h
>> index f5ba4d56622c..8dc235e1b6d3 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>> @@ -9,6 +9,12 @@
>> #include <linux/perf_event.h>
>> #include <linux/spinlock_types.h>
>>
>> +enum {
>> +    __XE_SAMPLE_FREQ_ACT,
>> +    __XE_SAMPLE_FREQ_REQ,
>> +    __XE_NUM_PMU_SAMPLERS
>> +};
>> +
>> #define XE_PMU_MAX_GT 2
>>
>> /**
>> @@ -34,6 +40,26 @@ struct xe_pmu {
>>      * @supported_events: Bitmap of supported events, indexed by 
>> event id
>>      */
>>     u64 supported_events;
>> +    /**
>> +     * @timer: Timer for sampling GT frequency.
>> +     */
>> +    struct hrtimer timer;
>> +    /**
>> +     * @timer_last: Timestmap of the previous timer invocation.
>> +     */
>> +    ktime_t timer_last;
>> +    /**
>> +     * @timer_enabled: Should the internal sampling timer be running.
>> +     */
>> +    bool timer_enabled;
>> +    /**
>> +     * @event_sample: Store freq related counters.
>> +     */
>> +    u64 event_sample[XE_PMU_MAX_GT][__XE_NUM_PMU_SAMPLERS];
>> +    /**
>> +     * @enable: Store requested PMU event config.
>> +     */
>> +    u64 enable;
>> };
>>
>> #endif
>> -- 
>> 2.38.1
>>
