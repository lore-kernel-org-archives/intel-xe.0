Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4285C369CB
	for <intel-xe@archiver.kernel.org>; Wed, 23 Apr 2025 21:41:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B6AE10E26E;
	Wed, 23 Apr 2025 21:41:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WgGp5IhQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D63FF10E26E
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Apr 2025 21:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745444500; x=1776980500;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Mg41g3dLTLTSg0CfcQXPqN4dsmKicyDFTpZ4tTnW9FA=;
 b=WgGp5IhQ3vWe3/M3/Cd+ed5C8PiwN2KaWOFmAQjMxGl3Q6NphTB64zbU
 lZgqbP6A5SjAd+ZjjqmcZFRRJzP1iM/BksFVV4sL5tK00fJhZ2Vb2uOAn
 /k7pFzz/Cc9Yzdqs5uX1cpyY/gs1/8t4xSorH7zaO5V+BxJjduF2yFMgD
 KIlYiAwk8jL9y63Zf6z/xBqvC27iSG7q9Nlj+WEHui4WTN9Ss/OkIUT/P
 5t2iG5nPjPxWvGR1lr7l7daAD/rDzL6ML4+GBd3KJiZIQc9JPS9NO1hXp
 zKnHY/rOuIvKEIOM900sDeNaoM0FtxoJPLd3Y2c73x7JYbfD3rb+2Ymcq Q==;
X-CSE-ConnectionGUID: XwKI8UroQCW4cj4uKFUN6Q==
X-CSE-MsgGUID: 8Nt23Mj1Rke91IkGK4LcRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="58049567"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="58049567"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 14:41:31 -0700
X-CSE-ConnectionGUID: seW3/5IPS3aroKTz3KNgnA==
X-CSE-MsgGUID: 53N543FMRKO1+hIFBVuxXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="163468625"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 14:41:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Apr 2025 14:41:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 23 Apr 2025 14:41:27 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 14:41:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jHhrbdNREViZE/Mw3kk4ZQa1kWI1RBO0RqwJdus+eyyluUwipcmNuLYijAKeF59z/GJYJOkA6e/dbhDabj5A8AHsGGrDPdy4f4DZgAxqy6NJRKXdReMoiK0VfKP58n9751ABNqm2VHNz24Umog/mzwfCgwy8RxUaiz88LgxC93H1VC8Yza/NF1G5GR/gyQ6jveO3O3wScRsp9z/nGuZsKuP8IZDGBq+hPqKdE72aoshIdDp1vn87sXnvrIdxp5yyW04bKn52Bark616bMam3m4mRv3G3Ldas7lARbwd6CytH2b2durW2HI8BiwEX7h3kwggLlITQCcBz+LX8a9gGGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+yhsOTrkN1W8lKbCDVbAf2iFg95tGJuHSASElxmNrA=;
 b=eVP3Y7Q0DD03KTa0bhzZyJYKX8kZZIXdpk3he3IJp+Ct/NlfoP42AlSrwCLuvLunmp7SifxC/F8dXA8Bsu7+Ez1Y/C/JwvDm+r1HjvgvG+furhKsBQGgKgXJtG7grgezjXArOZod9DQzP/f8mib+1A+KA9aNTZwo4cegAbfuu3e3Ga1kA17w9Uu0ukAHW4a6Z7CtgpGpQ9YbcZkjxv/7eK0hMu1RtXNz+8DSCKrh43qdT6OAnYh50OIeaACaoVGmDaQ/7v4KivagCNs1Iqo1dsg80U6UVTEfkZtWASAkY/9Gj/hvF7m1s1Ie0hC2rLXAdt5F7WNzy9MMdibilFPvIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by IA1PR11MB7775.namprd11.prod.outlook.com (2603:10b6:208:3f3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Wed, 23 Apr
 2025 21:41:13 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%3]) with mapi id 15.20.8678.021; Wed, 23 Apr 2025
 21:41:13 +0000
Date: Wed, 23 Apr 2025 14:41:10 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.s.atwood@intel.com>
Subject: Re: [PATCH 1/1] drm/xe/eustall: Do not support EU stall on SRIOV VF
Message-ID: <aAledu4zlIpfE2_h@intel.com>
References: <10db5d1c7e17aadca7078ff74575b7ffc0d5d6b8.1745215022.git.harish.chegondi@intel.com>
 <87fri1105c.wl-ashutosh.dixit@intel.com>
 <87ecxk256d.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <87ecxk256d.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY3PR04CA0012.namprd04.prod.outlook.com
 (2603:10b6:a03:217::17) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|IA1PR11MB7775:EE_
X-MS-Office365-Filtering-Correlation-Id: e220352f-89f8-45f6-1daf-08dd82af918b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?LzRyNlNra2NjWkVaRExhdVpuWTlPNW5LSTIrRmUzUVFzbjdVRGI3bHBKQWdx?=
 =?utf-8?B?eUdvOTFIYnNVUTNaemtXRytPdVRLZjVOdFlMWldWMDdqeHlRS0g5MXhCaVAv?=
 =?utf-8?B?UXBLLzlNMUt0SjhVZVNGUzdoMWZRVENoL21EdHVsOFdUUkVNb2RuNS9qR1ll?=
 =?utf-8?B?ZDZkeXdjMzd2L3RpVFJxN2xxb1RLdzFMZ0VYc3gwRDlVeDJrWFNWeUNrS21o?=
 =?utf-8?B?Lzlxblo0MWlIaFVkVkFBS3N0UE1rcktoS0krTys3RGFQM0RKTm0zc0JZUGts?=
 =?utf-8?B?OTJsWTZtK1lZUzZ1dTIxNTBRTXZZcjdSekxvK0lRK25IbFRKUWdldzIxVFk4?=
 =?utf-8?B?SHlMM3BBZnk2cHhLYkRWbTdEQmZKSS9tOEJLcm9IcUx6Y2dCRmEzSVh3UHZp?=
 =?utf-8?B?dWoyZHl2bFlNSXpQWVNwZWZ2SktrVGwrRUJJcmphNGc2aVRIRUhXNWI2bGcr?=
 =?utf-8?B?a1VVOFFkOWRFbjVlM3o1MkpGdkszMWpvdEJsZEU4M0Jab3J3aWUxR29sM2RU?=
 =?utf-8?B?aUh2Q0FtUTlTRUJqdFYzUjhQRUROMVpCZGE3K0NWay9xbStuWlZYODB5VnJY?=
 =?utf-8?B?bHVibTJldzV5UHk4Y2NOdzY5YmhjV2w3cDZUTm96R0Vydkgyc1BDcjlKbG53?=
 =?utf-8?B?eDFINHdDOU9OUDUweUduQVRvV0VVL1AxQXdEeUNidTRDY1NnMHlaeW5zTmNv?=
 =?utf-8?B?NXZYNVVocmowQmlPSzVPYUNBSDZyMFVwc0RvUnVXQXdLK0lBQUpNR0hJdW50?=
 =?utf-8?B?Rlc2ci8zRE1wMUdCQmhjRHkyTHU5QVg2T05zWUc0SThCTms3VVZ5QjFJQzJk?=
 =?utf-8?B?RnN0b3hmV1g1ZTVoMHFrelQwOWhzYjhPZEFyNGtyMVhlQVFaNndzdUJseko0?=
 =?utf-8?B?dnBRNGdJeER2eHFmdXdVb21MMHV5K0ZabTA5WWhYSis4SDZrYUUzVVVOY0xw?=
 =?utf-8?B?WWJUNGYvdkFiQTRaZ3hwcjFMd2k3UGZoMnJNdGZKMndRemhnOUhoUnEzZjNz?=
 =?utf-8?B?Vm9pR3JLVEk2SFdmZEZUSGJaUUdWNUNmb0M2QkhzbXJnM2phdmc1blozaXlY?=
 =?utf-8?B?cGJhc1k1Zlcrd0lNRDU2WDNwUDA4MWlyTmREUjRtNEVMNUVqc0VOaEJrQzJE?=
 =?utf-8?B?WVdlTHRyRmREYzVmbHhacmZuTVZpKzlPR2hLS3I5Yi9GUm9QWTQxQWZmbTB0?=
 =?utf-8?B?U1RUNktCOFdwVzBHUVNmQTRyWkpkbzBqbE40N2s1aktxWXFwNkErTzRLL2J6?=
 =?utf-8?B?UXdXNndTMzExbituU2kxOGFPVnBHNVI0U1Q2VEM0M29KekZSWnlWdEJZaFg5?=
 =?utf-8?B?ZjJCMnZnV28xcEthek5xZUsxZG5DZC9GOHV1SGVSWnlQTE5oVmtMSHc3eVZB?=
 =?utf-8?B?RGlDMGFxTjNUeS9PdFBweEM2QWU5UktpcU1jMFdBK3QyaVNvbXNTU0VwM2tZ?=
 =?utf-8?B?T1EzbDJaWlRUTUdZaGRJNVljSitFci9kcUxYZ2xuSTAyZjFxMWtPQ081M0k5?=
 =?utf-8?B?dFZTamVvYWdMYnZhYUsra0RjZEtCQTVyWWxaREx3NzRydGtwMHh5MmxXL0xi?=
 =?utf-8?B?a3VMZTUxOVFLWC91c1lHb0tJdm9ZbW04OVF1SzZIWXhiajlTQ0hJOXAvMWNS?=
 =?utf-8?B?aHRDZDB2ZVFOeTU0V0tEZEk1T3djWkZxdHIyMkw3dXNhOUszd3VteGRJd3VR?=
 =?utf-8?B?c2I0eDN2TlRUVUUxZnh3RGhUcjFqYlNuS2h6ZVorRnEyM0tmUG5HbjQvS0Rz?=
 =?utf-8?B?bTdmWU9ENzVKV3pMUlEwNXhaSC9yczJHR3hISmlIM3ZUN3I1ZE16aG9HVVZS?=
 =?utf-8?B?U2pxVVh2VEVEWjNVM29TNCt2SG5iNzJrVEdBNnJ2Z1dzcTFReU5YdkVWMEpZ?=
 =?utf-8?B?dnVPYnI4ZDNqMEh2ZEgra1dHeWFIVmNqb1V0VVNaV0RNSWVEa0duYkc3eTA4?=
 =?utf-8?Q?Wxwa3nJYork=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1hGNytWMFFJNDAxbDRFVGpaV2dwOXZSNGttSUJMU3lnbVd3Qng5S3pGOHVs?=
 =?utf-8?B?bjA4b21YU255eVFiZExOdSt6RThKMzBYQXpDOElud25leGlMSzFGb3oxR2Uw?=
 =?utf-8?B?UE40V0VoSUlYVGMrRkxLR2ZIeHhqTzk5K0ozQUloYWVneTZ3eVNjZEk4NjNr?=
 =?utf-8?B?S1dWalZLeWlvMTZiU1NlRld3NTNnY2VldjZoTCthT0cxeEFmdWMyVHFRM1FM?=
 =?utf-8?B?RmZna0V3eG5CVVA0Y2x3emxPZDF0dTVaTzhiMThlWG9WT2lHcWJTVDFYdnVB?=
 =?utf-8?B?Y0FINDhEd3FSVmY4M0ljck1LNzgybjlUYmJFenc5YWk1UTQ1STlqUldUTW1Z?=
 =?utf-8?B?bS8rcFR6aWQ2M3IwVkNnTVNmTExxVmx3VE5tblZHa0tod05QNFNPUmExdFpF?=
 =?utf-8?B?dmtPMm50a1BHOStIc1hJeFEvZDdyV1VQeVdQUW0va1FkaUhJQWZ1bVQrV2V0?=
 =?utf-8?B?dWNpTXp5TEpKbW16RzBSOFdIdXBqakFzSW14bWNUZlNMT0JpR1pPY2MxeHBl?=
 =?utf-8?B?S0Y1QkdIYXlzQ1RLMmxsVmRBWUhoK29Jc1ZGZlkxR0FNT0VmRDFOM1E0NnhU?=
 =?utf-8?B?UEdmdHRqdktjM2pwM1hkRmZ0NlUvbDVLa2cxa29PemxtaWNqQ25NbDZVUk1M?=
 =?utf-8?B?eGVVSUtNODJtYXN2OFlHVXVZbFZURmVHZkhKOFFVaHJoR09vN0kvQm04VHZV?=
 =?utf-8?B?WlI1aVBRblJPZGVQZ0IzQS9uVGRUNGx4T1VQYXNGdnFBTjJPWG53dC9NV2lh?=
 =?utf-8?B?RlVVQ0Rvd0xab3ZUanV1VHg5bmVHM0pjL3k0N0ExdVNhYTBhWGpmTUlsSytv?=
 =?utf-8?B?K1NmbmYydUdReDJHVUpMVTlnTzZDWXlnZlliWmZCRFNwYXptV3YydW0yYmdm?=
 =?utf-8?B?aGpnYUVnQWI3R3lzVG9rTlVCcFVlOWhZb3VBS002YkYvVGw5eHJZeUUrODBa?=
 =?utf-8?B?OC85dUNEM3lEdzhtUllYOFRrcGEvTDVaanM1b1RqVWh4bU50Q2g5UTZEYm9N?=
 =?utf-8?B?OGtmVVc5Zi9MZXBONE5RNzJmd2Rtd2NWTHJwV2hiRHJYbkRWN0pxbS9TTUVM?=
 =?utf-8?B?ajhKT2FKODgvOVFFL0FoUFBGK05hamlmNitQNzVlT3NEVjZ1WjlrR2lPelhs?=
 =?utf-8?B?KzFQbHVBUlVrS0VxNnQzU1QyQW1pSjF2SGRjeDc0MHJ5WlVpbitaS1hkeFI3?=
 =?utf-8?B?K0kxWjQ5OGYzU3Y1YVo5dEs2RkFNOVBNQkxURFN0ME1SSVRxUzI1M3VWV0VB?=
 =?utf-8?B?WHVnNnBrM0FPeEUzT1Jhc2VPU0xNUUpvZVBUQUZlTW1PekxDdG0xY25zQWM3?=
 =?utf-8?B?VjV3cWV4ZUQwUmJnaCtZSC9vT0VzL29lQ1NCU29Vc1RuVi9ZMUNCN3ZsSnha?=
 =?utf-8?B?R2hNUktKWjRqeFRIV1VpR0pSOExURThIREhUK0NOYmNlMWNXNnpWWkw0SEww?=
 =?utf-8?B?NmV4NlFESUdVOC8yd0RyaUhTMERGT0lUM295MytCK3NhczFGNGgzdUVVTXVi?=
 =?utf-8?B?U2dRMy9oakliTjFIN0ZlTmJZdFlveGFnR0ozS3Q3MWtzemlOL3dtYjdOc3Vz?=
 =?utf-8?B?anJaU09vaGFYbzc2WUp3Nkk5NzRpZHpoVVk0N08wV3V3cGxUQ21uWVpwVC8v?=
 =?utf-8?B?T3RzbUJ5a2o0N1B6WTB5K0dPU00wN0dFNE5GTWkxVzVHUkx0Q1FkWkh1bnps?=
 =?utf-8?B?OGNrZ1Q5UDJVOGQ4Z3l2R0h6NG1KVDVLbEZNbUptTVhrL2FsT05zMHZWbWZv?=
 =?utf-8?B?Q3hGSW9GcmRUS0FLekRlWDFTY29EZjFobVZ3dURiQkxwZTFBbEgrMzI2Q1lN?=
 =?utf-8?B?anF1aExwemlIYmNVUW1zMGpzbEM3QWFqLzlrVHBSOEUrOTFYKzloL1pyQy9v?=
 =?utf-8?B?KzBwRkU4bmdacXhtRTdmLzNCWGNWTmR2OWRONHorZmtISC9LMFhrbXhUSFVI?=
 =?utf-8?B?K3ZxQnZKL3pUMCtwd0FDSnpSMVc2T0YxdUhlbzdlSnFJcjd5YkR5aG55WVEz?=
 =?utf-8?B?bk1lSW1oMVVIUWNjRWtNS29XSzdKMU1QWFRSNkhsYVRQLzFDM0xZZ2xBNCtB?=
 =?utf-8?B?MTE0czhGM2RoOUNpMkNlYUR6RlppM0M3dTBMWVlmVVdILzdWYy9tVlNkRi9H?=
 =?utf-8?B?d1lSbW5adFJhOVIrbkpDZHYyeHdhRko1VXlOYmNrSGk4OUVZQ29ZVXVIcm1l?=
 =?utf-8?B?cGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e220352f-89f8-45f6-1daf-08dd82af918b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 21:41:13.0280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TZCsSgeDH6fcJAnnyeYS0IkKFAn2ln7F2lE48AXq76pYKNt0pbpH82OoYpUsx2h8iftlwKCrVRV5/BzlU8TDPpqHoLhTjHkv/7X4I5VHOiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7775
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

On Mon, Apr 21, 2025 at 09:25:46PM -0700, Dixit, Ashutosh wrote:
> On Mon, 21 Apr 2025 17:59:43 -0700, Dixit, Ashutosh wrote:
> >
> > On Sun, 20 Apr 2025 22:59:01 -0700, Harish Chegondi wrote:
> > >
> > > EU stall sampling is not supported on SRIOV VF. Do not
> > > initialize or open EU stall stream on SRIOV VF.
> > >
> > > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_eu_stall.c | 3 +++
> > >  drivers/gpu/drm/xe/xe_eu_stall.h | 3 ++-
> > >  2 files changed, 5 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> > > index f2bb9168967c..64788277ea52 100644
> > > --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> > > +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> > > @@ -208,6 +208,9 @@ int xe_eu_stall_init(struct xe_gt *gt)
> > >	struct xe_device *xe = gt_to_xe(gt);
> > >	int ret;
> > >
> > > +	if (!xe_eu_stall_supported_on_platform(xe))
> > > +		return 0;
> >
> > This check is not strictly needed. If the check is not there, just some
> > unnecessary stuff will get initialized.
> >
> > But if you want to add this check here, you will also need to a
> > 'if (!gt->eu_stall)' check in xe_eu_stall_fini(). If you test this patch,
> > maybe you will already see oops when unloading the driver?
> >
> > So either remove this check or add the additional check in
> > xe_eu_stall_fini().
> 
> If you do retain this check, maybe change the
> xe_eu_stall_supported_on_platform() check in xe_eu_stall_stream_open() to
> also 'if (!gt->eu_stall)' check, I think.

I can change the if check to 'if (!gt->eu_stall)', but at this point in
the function GT hasn't been determined yet. I will have to move the
check later in the function after GT has been determined.
> 
> >
> > > +
> > >	gt->eu_stall = kzalloc(sizeof(*gt->eu_stall), GFP_KERNEL);
> > >	if (!gt->eu_stall) {
> > >		ret = -ENOMEM;
> > > diff --git a/drivers/gpu/drm/xe/xe_eu_stall.h b/drivers/gpu/drm/xe/xe_eu_stall.h
> > > index ed9d0f233566..d1c76e503799 100644
> > > --- a/drivers/gpu/drm/xe/xe_eu_stall.h
> > > +++ b/drivers/gpu/drm/xe/xe_eu_stall.h
> > > @@ -7,6 +7,7 @@
> > >  #define __XE_EU_STALL_H__
> > >
> > >  #include "xe_gt_types.h"
> > > +#include "xe_sriov.h"
> > >
> > >  size_t xe_eu_stall_get_per_xecore_buf_size(void);
> > >  size_t xe_eu_stall_data_record_size(struct xe_device *xe);
> > > @@ -19,6 +20,6 @@ int xe_eu_stall_stream_open(struct drm_device *dev,
> > >
> > >  static inline bool xe_eu_stall_supported_on_platform(struct xe_device *xe)
> > >  {
> > > -	return xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20;
> > > +	return !IS_SRIOV_VF(xe) && (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20);
> > >  }
> > >  #endif
> > > --
> > > 2.48.1
> > >
