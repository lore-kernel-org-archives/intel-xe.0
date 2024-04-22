Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA31C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Apr 2024 03:13:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 382EC1126BA;
	Mon, 22 Apr 2024 03:13:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T4RvxZhM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABDA21126BA
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Apr 2024 03:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713755586; x=1745291586;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=d1oc8bL6a7klIl7gVDkQZnHgvj9s0+9fr/lz7ZJwRtQ=;
 b=T4RvxZhMTsl4w1Uj+qe07TKo7dZan8Ae2E/yiN3OmU4iIj2pOHuqN//b
 NsEt9u6P/4ZNSqkDbxhDzvVi19L/IAXmCaoQBVPLOOGo7Aq18fhwfgCnN
 EBR33lzXfsGVjXAb5wHPuf5S2QdB9Y5+U+2CAePOF/h2vFXx+G7xknZze
 /4aJyWjOTxXe0ZOA/ifU2xJr51kHVFrvrJmXkPrbTSPuWJ0d/qT1bATq1
 KUaeP+5Ck+aqwMZ5NVWZtx/fN6nY5+bA4jggt3hh+vED8oBUebQ46j0yW
 R94sj51IbevxnffNGa2APefBJMYta5C1KF5JoxVj0OjvCeziE23bhujRp A==;
X-CSE-ConnectionGUID: qVXLttnbRgu0XwhIgRjRvg==
X-CSE-MsgGUID: gqPC3PB6SZm4kiVnqGgzoA==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="9432480"
X-IronPort-AV: E=Sophos;i="6.07,219,1708416000"; 
   d="scan'208";a="9432480"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2024 20:13:05 -0700
X-CSE-ConnectionGUID: lRRcL6QcS5S5/jo6JJb7Mg==
X-CSE-MsgGUID: /UlRNzVzScmo226KWZCiew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,219,1708416000"; d="scan'208";a="23933750"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Apr 2024 20:13:04 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 21 Apr 2024 20:13:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 21 Apr 2024 20:13:03 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 21 Apr 2024 20:13:03 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 21 Apr 2024 20:13:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eq6wUiitGmUZGEr7wlN36ovo7EEcXABZKccQ4RrCH5Z0Mj2ciZrYsqDNXk+MEYeewHjnvQHupaLLYBmwFP/L4CPCw69AsU4g4gDEQ0ZHqEwbmy9B/FW1vosb3+egSOHtSbkfbXmVbe+KJjJeAj12qMUf9JjcvpHOn5ujDkgPSFraGPEmj4/chdBHBHHpb8OZCkjQhhbUBfSdO0vVK0TVLWAHMDWQRZJIBI6o+jzYpFK5juYCNjhWzlwl3pb8Be8/jOp/Yt2qgyAu8q8x1FweFqHKn+Ud+0VZTn8veA3N7bRcDUOApJ5H7GpNiDcWPzwVysdPrxtfZEoK8feerUb56w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YEJz6U5sSuofIqd8kiqUZciJMy8Wf6J98+8BvR/pmHk=;
 b=kadsTW7PLYgzNVbLsmYaigqhpYZO4ZkI42/FX47S2AvR6RwQ2eCOzgi0JsV2+pny/Uh5zDPVKptY4wC5PPI1m5BCinpAu4nOuC1PW2QEpUrTbCxGhMyuvkI4mo2+dlBt39I682amX2onp5JRET+9xdBooQPimB25pb1LD2KKDVcpofkfnfaYpZ92269dk6UApzKOA6R1HUlwMxepbJLIZlSCn/leNRGFsiLZgNSfU/+LOQsIdpUBpeOmgGshzeAzG1irlxfwiYHyBz1lrcLT9T9MVA+iV7CGCx5yrGTI74DoFlSfpTLhlu6GGwQPY2TL7MfZMxTwdEO+iI5LQOFbdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.20; Mon, 22 Apr
 2024 03:13:01 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::cea4:315b:52ce:11f2]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::cea4:315b:52ce:11f2%3]) with mapi id 15.20.7519.018; Mon, 22 Apr 2024
 03:13:01 +0000
Message-ID: <841b8f76-06d6-41ce-b58b-f55d79abba98@intel.com>
Date: Mon, 22 Apr 2024 08:42:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Define all possible engines in media IP
 descriptors
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20240417152621.3357990-2-matthew.d.roper@intel.com>
 <vwpy2sr62wcnwkjslreseee37kpi47msw5l4mbvos7dxuavnqa@cohkzrvkkddv>
 <44845ee2-79bf-4641-ad73-ffb88a23ce0c@intel.com>
 <83d66294-c089-467b-a65c-e90314613caa@intel.com>
 <20240419142347.GA5615@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
In-Reply-To: <20240419142347.GA5615@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0206.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::17) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|CY5PR11MB6139:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ed7e23f-7dd6-4830-dfe2-08dc627a1dea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UG1tS25WTVhzQVp1NjhzenJVSGdMYTdSV3p1Q1JYeDVQNUNMd0xRb1lqa0dy?=
 =?utf-8?B?MlJqMStPdFVySEt0SzhpZ1BUUlVGRG9oQnUzcGdENGk0Nm9qTCtmQmh4Q2po?=
 =?utf-8?B?dEJ6dUV3RjVLUERJSjZ0OGtGSFJzZ3cvZUhkQnQybHdWaFZraEt2MXVUam9t?=
 =?utf-8?B?cUNvbGxQMzhHWEJCZVErTzNqbWVLUVJDSkdKR0xPeEVCeWRGQTBnZmVlRFlG?=
 =?utf-8?B?SVF4aVFOcXBLVjdRS2c4bEY2cVFSMUk1ajhtWGNZWlVvR0FNV1ZHckxLRjI0?=
 =?utf-8?B?VjA3Y1pnV2k1RUpCWHI3bHo4eTlVT0Y2WTlDcitTclV2QlZuVWxLOHpGcWtq?=
 =?utf-8?B?amRkbjFSY0t5dkw0SldCK3I3K2VQYUFkcEdYU1NBZ00zNHlqbUkxMkdjYjh2?=
 =?utf-8?B?dktweS81R2tMamVmU1pocEUxNmE0ZnU5YmV0VC9jZ3pwQ2Z1WkMwUGhSK0h3?=
 =?utf-8?B?OTlHYnpIa1Bwaitic2M4UmhUOEZaOFRPSUJoTTlhM1h0R1pML3pQT2tXaFJ2?=
 =?utf-8?B?S3U5eTN6em5YSEtDM20vQWxSMkpRUlRRUUVDV0srcFNySEd1OGZBdURGQVlG?=
 =?utf-8?B?a1ZvRFpodzBHK1lhZWg3WE9nQzYrbjhuSVhtMXBuaXhRVjJVOXFFTmFxNDhK?=
 =?utf-8?B?N3RoZ0ViR2s4Ujg1dmgxckRna2RaQ0RVWGtJM2tma2dFek9XSzk3aEJIdStS?=
 =?utf-8?B?NTFmdkVLSDJiSi9TdWlIczJyZXo3OEZGVkpsYUZHdEppbnFNeDBKUjRjWExq?=
 =?utf-8?B?eVkrc2o2RTUyK1lvMGMrYXJkekNMYko2bEJaQ0FqeVlhOVc2c2treUd2a0lH?=
 =?utf-8?B?UXhPazNlbStHRWtOZGM2R1RGWE1lWW9aVzNLcXdxaG1RS3A3bkh3MGQyZGFU?=
 =?utf-8?B?K1BvaUdMMEtOdXloeU9VbTk4OG82azRhdVY2eDROYkI0blBvTGhINjZ4c1N6?=
 =?utf-8?B?T1QvcElvSHdHUnZVNHZGSkFXNmdLQVR1OGdzSWlVUkJXbWRQZ3lxL005cFln?=
 =?utf-8?B?VnpBb3R5QXYrMTk0eWc4M3ZLemxWZitvSXowVzNWZTBnK0Z5QUpXbzdnSUt3?=
 =?utf-8?B?c0YrNUtIYnJUWE83RDBhN1dwV3UxOEZNalRuaUQxVXNzUnNjQmFCNWZFNThC?=
 =?utf-8?B?TFdSTmF1VHJxNmFOT0h0N3lKblJ0Q1VLQ0k1TTZSa2VpclZDdUdVMnYvZVF4?=
 =?utf-8?B?S2lWeUkxUlM5VmE1WGRDUysyUjBLN3RWK29Fd1dDbTJRL3Bvc0VUdFduVUNT?=
 =?utf-8?B?c3lLcVo3dHpucU1IOHQzRjBDdGVKblJidVBhTWZZUzZQMFp2NGc2ZnA1dGkx?=
 =?utf-8?B?Qzh1NmpBK29vWDhxRGFGcm9MY21UZFl1M2twbjJuWDNDRFV4ZzVDTUthOU5L?=
 =?utf-8?B?dDA0T1Rva0x4c3VMQnRZQ3lzQmNLSERwQk45S0dtSHhKZHhxYmMyT2xyYU0r?=
 =?utf-8?B?T0hPVHU4bmVQN0ljNUptaDU3WHhDcmNndkZRc2N6SmtBODNveU9oMzA5Zm1k?=
 =?utf-8?B?MFpDUjU2Q2xqSm9iRFhRbUhNRmM0UjhkbzZ2QzdNMEtyb2lCdEZJZzB5UE5s?=
 =?utf-8?B?MVNaQjBhaEpHU3Q0aUtsdFB1d256ejluL1AzQ2pLenhSUFVwSm9xNkc4emZS?=
 =?utf-8?B?WDB1b2hIbGdnZ1BOUUI1ZVFQSkJwVnIxUnQrMkxxTXI2L05HNWxtekpQN1dF?=
 =?utf-8?B?VWp0eXpuU1JaUTBBNk1XT3ZCcUVzZCswenlwSHVkVllVNHNDN29sQlBnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2xWWUlmWnNmREgyT0VRWFZRMGEyREE3WDNJbmJQallDK0lEckt4U1dvelRG?=
 =?utf-8?B?WWpscVduWFFUMU1ic2pkcThWaTRLQS9JUUpIdjM2M1VZNnNBaVNKSUhSb2JH?=
 =?utf-8?B?R0NDQlVOMlhHNUVJKytETlRLNUtFQjJPQ2RpaUM2azJKaUlpUXl3bnJGT1Bm?=
 =?utf-8?B?YnJPdkVwbTlIekcrQnoyV3QvZ09vd0xVdmFKMGVxVldVdlZCbXMzTjk3NHE4?=
 =?utf-8?B?NEh5cUlwamxaSTZONUNTbXljK3N5U05sM09VVjQ0TXVDS3o0NDk5cmlXSnVY?=
 =?utf-8?B?QmFPenlqVnZpODc3Uk1IKzJNNTNjZ0ZvNW1DYXV1OEtUUGxFOGErZTBzY0JN?=
 =?utf-8?B?R25ldVZTQWkzcFNKQjYyVGNwMlBmRUNRTVZ2N3M2WUJCNDdJMjRhUjVwOFNy?=
 =?utf-8?B?RUZIbkhnK3NsZnN1dXRQOG80blE3cURyUWt4Tmo1YzhSMTM3YW5CY0p1ZkVj?=
 =?utf-8?B?WGk2L28rMS9lVmZFcEtpc1E5UUs2REcyQ0VPR1NmVzBSNFBEWm9HUUxqdWh2?=
 =?utf-8?B?MzRsVGxQU2pxU3MyODh2QXE4YnptbDRWbWEwK0tybGFqZlA1T21waGRCcWxp?=
 =?utf-8?B?dU5sVmFkZVBtTXIvQUplTi9rSW9rM1grUHFpUUQ4bHFwdk1GbEdUOXEva2xl?=
 =?utf-8?B?SVZIVXh6Q3VVZ2ZpR05QVGp2dUQ4akJscGZzVHhlenBMS0FiOXZBNFlaQUZK?=
 =?utf-8?B?Sm5UOE5JQmpGTUozYmdtR2haeElCdHBzQm9mYU1INHczaE12QU96cmlsSlRT?=
 =?utf-8?B?MjdoVzkzaWdrNkErQ0N0d1A4Wk9KSmd6YmlzU21CbkliUm56MXQ3Z1RuNlFa?=
 =?utf-8?B?eTUwajJIOTFQLzBwMmdaMjJVR3BJdSt3dEM0RnNqM2RtcnRRd0hXQ0NkQ3lo?=
 =?utf-8?B?alM0K2UvaFo5U0hNQzllN1RjQmFHMEpJNG9NN1hsczhCc1ZIM1kvSHZpSDls?=
 =?utf-8?B?c1BUT3Y3ajYvekVRNVhtbE1lclNXRFR4Z213cytyTHdxYWl1VHFhVHAxcTBa?=
 =?utf-8?B?bVZ2dkRvb3FINGc4RGtwWFlCZG9zb3V0S1ZPSDRIRjhpcitPb09SY2Z1bDY0?=
 =?utf-8?B?QUdHcXBDM3ZYbGM0R3JSdDl0S25HM3ZuZE01SGtlcVdNZ1FQc1RUZis1T2xI?=
 =?utf-8?B?QVRQaHVFbCtYa0swMkVFanlOS0lxWlRGaWxmd1RyemhCUVBJTG1jNlRkWU1k?=
 =?utf-8?B?VzNOY1lPWHpnV1BRc3EvV0RBQVFlZFVGUlllOEF5QXBRQU1lNjFQU0xSbDFH?=
 =?utf-8?B?QTJLNG9BRUdYczdSRk5mVjJEYnZWNFRmVStWc2UrNHV6MnZJNHE4dGFJOC85?=
 =?utf-8?B?UEd3WHpzaWhLV2h1M0E3MmlxTnl4RVdhMHc3ampPM2crSXRlYUlaSTRFRk5D?=
 =?utf-8?B?dGs2VDdrZFp1VWJDTGR1cDhsa2kySWRieDZuQXRoaUdTa3FPSUswVS9KSW1W?=
 =?utf-8?B?L0FmZlFOM3MzcWNBdHQ3SVlFc3pvcXozWWJQbjRBMVpnNGY3bGxOdE8ycGFN?=
 =?utf-8?B?ZVBQWHhqOSttVWtLd1owZDIwZHFWcUwyMjd1M1RTV0VxTnE0Q25MdnlTV1pj?=
 =?utf-8?B?SGxRYTJ5SzkyYmdEVmtGSFA0aW5IS2hLeDJMMFVoazk2c05IRkY0N3FSR085?=
 =?utf-8?B?NHBZMWh0aEI1ZCsyNFRvOWxoTDhiQ28vVmg4MTh6NzM1d2dwQzkrWW5DVWFC?=
 =?utf-8?B?K2N4alZteE5odzBGZ3ZucW1xN2NzMU9FZHdBRFc4YU9lbS8rTjVaTXRiQkpJ?=
 =?utf-8?B?bmdmaE9EZ3FROC9LdkZQdzYyWk1mNmJES2t4NG9YdFJKZmErT2dwMlRDTGlX?=
 =?utf-8?B?NldlV25TbFh6dzhzR3psR3pOdlg5RDNwVjVzUzB5OVNyS2NRMDBtYnJHNFJ4?=
 =?utf-8?B?K0FraWJQNDlwYjRtRmh3eE9mR0ZnTnRYbFcyU3hLNTdneHgzUEZ0OVYvOHZM?=
 =?utf-8?B?a2gyU1NwaWJNSkpYZllYeWlIdW1tRDBHUFJFSkl5Ym1OOHduK0s5V3graksx?=
 =?utf-8?B?QjNHRm93T1ZxV0VPVThpeDlLQlBCYTFjREtObFlJaTVZZW9PT3ZpUU9KZy84?=
 =?utf-8?B?dmExYjBsMHk1YUJWYWc0VW8zZGl6Tk5sUWIvaG5vUjd0dW9QRFRWa2c3bTBI?=
 =?utf-8?B?azVUdGdDRllTMGd3N2NTUGhCejFBOUJpVGxpeTNIZzRITTlsNFA3RkVvdkpZ?=
 =?utf-8?B?UFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ed7e23f-7dd6-4830-dfe2-08dc627a1dea
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 03:13:01.0425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: skoQYboZG3Jderq4snZzIL8dHKXWC+hSkjLGONu52r0SP7gis6XU1Kx/1SFXAhQRH/vIYeDYaRxTsx/9j0reljMRK80ANb6DBwYPKUmAbwM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6139
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


On 4/19/2024 19:53, Matt Roper wrote:
> On Thu, Apr 18, 2024 at 09:48:37AM +0530, Chauhan, Shekhar wrote:
>> On 4/18/2024 09:46, Chauhan, Shekhar wrote:
>>> On 4/17/2024 23:48, Lucas De Marchi wrote:
>>>> On Wed, Apr 17, 2024 at 08:26:22AM GMT, Matt Roper wrote:
>>>>> Rather than trying to identify exactly which engines are available on
>>>>> each platform in the IP descriptor, just include the list of all media
>>>>> engines that the IP could theoretically support (i.e., 8 VCS + 4 VECS).
>>>>> We still rely on the media fuse registers to tell us which specific
>>>>> engine instances are actually present on a given platform, so there
>>>>> shouldn't be any functional change.  This will help prevent mistakes
>>>>> with engine numbering (for example ambiguity about whether the 2nd VCS
>>>>> engine on a platform with exactly two engines is numbered "VCS1" or
>>>>> "VCS2") and will also future-proof the code a bit more in case new SKUs
>>>>> or platform refreshes extend the engine list in the future.
>>>>>
>>>>> Note that the media fuse register technically has an 8-bit field for
>>>>> VECS engine presence starting on Xe2.  However there's still no MMIO
>>>>> register range reserved for VE engines above VECS3, so VE0-VE3 is still
>>>>> consider the "maximum" VE engine mask that the driver can support for
>>>>> now.
>>>>>
>>>>> Bspec: 52614, 52615, 62567
>>>>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>>>> I remember we tried something similar for BCS and had to revert. However
>>>> for media it seems we have fuses available on all platforms, so should
>>>> be better handled by the current code.
>>>>
>>>> Assuming CI is happy,
>>>>
>>>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>
>>>> Lucas De Marchi
Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
>>>>
>>>>> ---
>>>>> drivers/gpu/drm/xe/xe_pci.c | 16 +++++++++-------
>>>>> 1 file changed, 9 insertions(+), 7 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>>>> index 3b30353dbc09..0d21306f8995 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>>>> @@ -185,8 +185,8 @@ static const struct xe_media_desc media_xem = {
>>>>>      .rel = 0,
>>>>>
>>>>>      .hw_engine_mask =
>>>>> -        BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS2) |
>>>>> -        BIT(XE_HW_ENGINE_VECS0),
>>>>> +        GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
>>>>> +        GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0),
>>>>> };
>>>>>
>>>>> static const struct xe_media_desc media_xehpm = {
>>>>> @@ -195,21 +195,23 @@ static const struct xe_media_desc media_xehpm = {
>>>>>      .rel = 55,
>>>>>
>>>>>      .hw_engine_mask =
>>>>> -        BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS2) |
>>>>> -        BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_VECS1),
>>>>> +        GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
>>>>> +        GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0),
>>>>> };
>>>>>
>>>>> static const struct xe_media_desc media_xelpmp = {
>>>>>      .name = "Xe_LPM+",
>>>>>      .hw_engine_mask =
>>>>> -        BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS2) |
>>>>> -        BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_GSCCS0)
>>>>> +        GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
>>>>> +        GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0) |
>>>>> +        BIT(XE_HW_ENGINE_GSCCS0)
>>>>> };
>>>>>
>>>>> static const struct xe_media_desc media_xe2 = {
>>>>>      .name = "Xe2_LPM / Xe2_HPM",
>>>>>      .hw_engine_mask =
>>>>> -        BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VECS0), /*
>>>>> TODO: GSC0 */
>>>>> +        GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
>>>>> +        GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0), /*
>>>>> TODO: GSC0 */
>>> Are we correct in excluding the 4 new additions that are part of a new
>>> HSD, stated in BSpec 62567?
>> Correction: Not new, rather, different*
> That's what I meant by the second paragraph of the commit message.  The
> fuse register has 8 bits for VECS today, but it would be a problem if
> something like VECS6 were to show up without us having defined the
> engine itself in engine_infos[] with details about interrupt bits, MMIO
> base offsets, etc.  So whenever we finally get a platform in the future
> that defines all those various details about VECS5-8, we'll add them to
> the mask here at the same time we provide the rest of the engine
> definition details.

My bad on missing it out. Thanks. Other than that, LGTM.

-shekhar

>
>
> Matt
>
>>>>> };
>>>>>
>>>>> static const struct xe_device_desc tgl_desc = {
>>>>> -- 
>>>>> 2.44.0
>>>>>
>> -- 
>> -shekhar
>>
-- 
-shekhar

