Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D197DC3ABB2
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 03:06:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BDD910E1C6;
	Thu, 29 May 2025 03:06:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BASEM4nN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26FE610E1C6
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 03:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748488004; x=1780024004;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AFxW/C+AI+6GpRb/xSG24Qzs5gpV/HqCV4/M0gwkmC4=;
 b=BASEM4nNIbHu55JyCj/hNgETjgcVOs8Mt/3Nr8HB+fexz5TgfdV5NOU6
 ogLjtZtOzEgj1ydJKMg18AJnb2Ba6NSZoqGasXKkGZzU19qiOlUJRObaP
 C83KPjYsrIgX6jCVNXpBvnm1qqHNQpAPX475gwaVLDHLUPhLInv1OL3/8
 hErKxBs7x3/J5QAdcui4LjJuw4+rYr3Kri+4zoB6dtvpedFSlzAK1rQUh
 NU55IM4jBTyqRW8N00tU7OQT0sKZkBS5rldyN7zle562m7mtVH/bduHhW
 K51obKQrS0dqQDk/9KHbyTQtHEs4b+8Q2f3UXRZTlbTJoNNRVDAwzk/2G w==;
X-CSE-ConnectionGUID: 10nlXuekRXaKF2LjTYufEA==
X-CSE-MsgGUID: MwUpKnvZRAW/VR6DVsqLDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="54330786"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="54330786"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 20:06:44 -0700
X-CSE-ConnectionGUID: KHj09MpER4Knwy91Tw6vxw==
X-CSE-MsgGUID: EbT4eadZTOu/zxwPX2u8MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="143327902"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 20:06:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 20:06:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 20:06:43 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.64) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 20:06:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TrCJCpXkONhY3HR6809R5rc3XoqrzJBRYmQt4W0e66RPlwCZ990tcl5Tkt99TLxrlSAhDCTQcw6TCt7J3f5DCPsnPWsSK1GNjSK4711TBN1oYnvpNHUXXaB/8N9GpkfpE1rYTarTtJBR6FK2pVZO21Kv/pSJbhK5x9BD2pAc0rFyZczFLBo706KXqsr7jFdvYOpDAS7Ac/Jo2VskgpSas1ST3OynkkHybe/E1TA3U6T9eIVp15Pl0HYBpOfZv41yTi5dZ7Soi9FjBdrzBk/hdq8WXgLN39FxB3OBWc5qCMgdsoUnkuEfPH+RizKRMr+VhSdnTaufiKRM5KsF4q2B5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UgHwy5ed43g5z9Q3AX+uKRoFEHJGE1dZztEHLc4hv+4=;
 b=vpC1JJWraKhfzFGJXvM6gcW0GHwyUeRgI0Yk1LZ7YSC61Zu+aHLuTYrfRSX3b2TgD21QF4+BO89BdAaPx+BsRLDoU8EEj0eXMbLssjN/pqZok56IvBDIEw1gUg6MsHBSOvFDJt1kb/8+SdgT0LXJU1WPpRjSMTYT/h1RvEsjaUb1dGPX9H/FouXS5NGxXAAwQAwGVdDlhXyoQ6nBgRGjWb6m8OuAmMEDZ90rVsJrPYfQ0kZOIKgdZ+7b5e/E6niKS/N9qCb1ODJ4GSlqqzlj3889uL3M4YyXDtDNhd+LWYeIbvnNX7v9tTa6VYSB7WID9A2RRaV46ckPk5Qvsrcujg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7038.namprd11.prod.outlook.com (2603:10b6:806:2b3::22)
 by CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Thu, 29 May
 2025 03:06:35 +0000
Received: from SA1PR11MB7038.namprd11.prod.outlook.com
 ([fe80::d13f:aaf4:415e:4674]) by SA1PR11MB7038.namprd11.prod.outlook.com
 ([fe80::d13f:aaf4:415e:4674%7]) with mapi id 15.20.8722.024; Thu, 29 May 2025
 03:06:34 +0000
Message-ID: <adc4f3d7-7a75-4672-8ba4-7269f6e71b2e@intel.com>
Date: Thu, 29 May 2025 08:36:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/19] drm/xe/svm: Add
 xe_svm_ranges_zap_ptes_in_range() for PTE zapping
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
 <20250527164003.1068118-9-himal.prasad.ghimiray@intel.com>
 <aDeZHeonaIwMzu0j@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aDeZHeonaIwMzu0j@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0116.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::34) To SA1PR11MB7038.namprd11.prod.outlook.com
 (2603:10b6:806:2b3::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7038:EE_|CYYPR11MB8430:EE_
X-MS-Office365-Filtering-Correlation-Id: e98c30aa-66ea-495e-9caa-08dd9e5dd1af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dWRVWTVxYzVFMWtWUkVkT2tiODE4UjNZOUFqR0lwVUJOQktIVmx6UURKemFo?=
 =?utf-8?B?YVo0M0V3UVBCakJUNWZTL0sxcnVBd3hseU5yNTVJbWNNZ3ZwREc5WVp0eUtB?=
 =?utf-8?B?cmRTNDl0c28xak9OeHNqdHdiMzVZVnlZR2Ftb3hNVmd2VG1FamVHVkFtenpy?=
 =?utf-8?B?cDdrS3R6NEhOeTgzclA3RFNnZnJqd0VDbW9pa0NxLzhTWWZOQnV6R0htV1Fl?=
 =?utf-8?B?QjViaG9VaUIrbERHYjFvSHJ0T3FFaFlSR2ZmTVB2K1lTVVlTTTdjN1dLanhp?=
 =?utf-8?B?eWxhNm9KMXZkUzRlVzUybGkzTzhhUGNXMWljTjBRYUQwMEZ5TTdUQUpWemNS?=
 =?utf-8?B?NWszMnpMaW5DZ1RUZjA1YUtzd2t3WEM0QzZEaFcyMHVZZXBURVJnTlZWUzhG?=
 =?utf-8?B?Szl2dkN6cVFNWktMZ3dzcDVvTGJWYnMwelM5QXFqbDMxMzNKQVJDV1pqT2Zp?=
 =?utf-8?B?cHNlZjVMNUFPQjNVYllwbDNkaFhyM3NmUFNqRElGVWo2eTUrVmZaRmJIQWtB?=
 =?utf-8?B?dkNmZTErNVJoQzFNMzhMMlRNUDdndjc1VlJiYlNVdHNSbkwxQzlRKzQ5cU1B?=
 =?utf-8?B?K3JNSWlWblhwL1VRUUtjR0hNTkNKNHVQdUNNRS9sU2hHM2N0QndjOHBleXlV?=
 =?utf-8?B?WTNJWDI2cEZTRFVVeUtuYUxJaTFMVFAvNEMwZmdkbkppbnVqbHROR3AvYURh?=
 =?utf-8?B?dEhEdm9PZ0grVTZsTTBVdUNtTmpOeTNpMC9SeFNENHBFVkhHQXU1czJwTUlB?=
 =?utf-8?B?ZnlBRlloNmNXK0hBRTR1emY3VzZqZEJ1REMrMmJXY0xBVWRDWDh1cC9kTHUz?=
 =?utf-8?B?RWI2eUc3TlNWeWdkbGNwTFJwbFFzbjNFUnRJTmdSUHFyeDJZd2F0QTNEU0ZC?=
 =?utf-8?B?bmVqcFNtRUZwa1NRNHViK1VoUHVXN1NqSnBJTWhtY3YrbW1Eem03UkZsL2kz?=
 =?utf-8?B?QXgzYUpXdi9EVlNhbHd6QUp3QlNkeWMyckJtK05uVGdSSXgwNWNxNWQ1aUlB?=
 =?utf-8?B?SDAwM1JYRExZVHNla0Rpak51YWhQSE1VeWFxajNpREhaYlV3UTh3MmUwaERD?=
 =?utf-8?B?Uzh5UVBaTjdobERlOHpDREZoUXhWTWdOVzZ2RnUzeWg5eis2VUlPQ25EejRE?=
 =?utf-8?B?NGF1S0h5U1d4OEF3UDlLUTdoNUxkZHVzT2ZqV1RKUjVySDNoUTVjV2ttenFx?=
 =?utf-8?B?bk54dlp2NW9ZdzExTjBlS2hYWHBqbUVZaVFSTjNSMmsxOW1yS2Q1OHBOR3Zl?=
 =?utf-8?B?ek5rZEYrV2lNcVV3b3VNVE5Wa0NuOVgxTnR1TE1CTkJKSWdzTFB2U0pTYXBU?=
 =?utf-8?B?WVpadEFPOUdpdy91a3VIZk5ncEJCVzJKZVg3bm5mY0lVUXIxMnF5VjZHamlB?=
 =?utf-8?B?ejJCY1B2b3NXUTROYWZYUVo5bUpSclRIUkpEaEdDeFlhVXczemFLdGZGRFNW?=
 =?utf-8?B?UnhieldFRmw4QnQwRkdzNkl5MUlVVUZLTE1RTlVsWURsME1ock84Q1lUYndD?=
 =?utf-8?B?VUxITkxXQk9vMnJsejZQcWduN3MxbG9qajViRmJ5cW9MNXQ3ZGVpbGdZU2ph?=
 =?utf-8?B?N1dpNFEvOVhsM3ZmN1M4UURId3BwZUp4ellvNE02ZDIwS1RBdWI2VTA3RXR2?=
 =?utf-8?B?eTlWbW1mQ01ZOGdsRlVSLzRxQW16M0ZrczNQMkM4Wm9FWFF4ckF3VGZ3eUNO?=
 =?utf-8?B?WTZMei8yT3Y1emRQd1psVjBsUW01eFErUll0T21DVnZWVnJUUzF2WWZFWUtV?=
 =?utf-8?B?T0pIMk54Z3BOMUtLbC9qUm9FMVBIZDc2TUZucGF0OVhORzhINmZuRHVaS1VY?=
 =?utf-8?B?UXFueFVsdGx0c28yTDc4MHA3Sy9ucWtWdU5wL2drcFVHOXZuUEs1Smt2Rms1?=
 =?utf-8?B?QVc1ZVV3TVBqdTNyRHZtWEw0Z3lydG1DcXE4VW40dGxTdGVUTXFwNEtEV0tW?=
 =?utf-8?Q?XrFj2liH9Ds=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7038.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTEycjg3MFQ1bmF4N1BsRnhyVk5HbW0vUGxPYTc0U0VHbzd3V2F0U0ZOQ1Na?=
 =?utf-8?B?TnBkaDdYL3I5bk85eldSUFQvNEVrY1AvbkI3ZkRSWEJJQ1NvVmQ5U05sTm96?=
 =?utf-8?B?RWpNVFhwQXU2U29RSTZnN0pJTm9EZEJMS2djSktvVm9xbzQzNXBPM05EZU1Y?=
 =?utf-8?B?TlhVWGZDQjV6dFNNWnBvRGNHWHBPdTJoeWpWckVkYkQvdkJxS1RBelFQamRw?=
 =?utf-8?B?RWZ2dS90dU5XNTlOUVNDdENSRlhwZzkzbXlrZFQ3WHFJYk9UdjBZcVVhaitO?=
 =?utf-8?B?M291NnNvSzh1QkE0QVlpWnRIaUhneUM5b2VsVDBuQU0vSXFiY2Y3eUp0aWRP?=
 =?utf-8?B?L1V5cFVxYTE2TjFBRUZDSnBNT3ducUlpQ3N5bDc4a24zYTlQa1FRUWx1aisx?=
 =?utf-8?B?TnFSRVh4c3J4QzBCV3VHYStLUnp6cnNGQUJHZjhPQlh0NFhXUDZLQWdkRmpP?=
 =?utf-8?B?ME9Nd0VBSHZVZ0dxQUNzWVovL0FER1Jjajd6OXFEYksrZjhUTUJCc2FwVEZj?=
 =?utf-8?B?RHFkRXlXMjVJTzNSUGZqcXMrV25KOHdMVENlcFlaV0ozaXp5Vmg5OTVjVVl2?=
 =?utf-8?B?bWhiWVpNcHlSNjFnSk5QZDl5cHlGOVdVMW5lNTZ1ZWJta1EwYW15djE4a2R5?=
 =?utf-8?B?V1Q0Y3Fad2xwam1uOGNkcTY5N2E1NDE1cUQvTjdiSy9RWFV1SHp3ODZXYW0z?=
 =?utf-8?B?cThCeitmTnBQampaNCtqZjhISStHU21POXhQcTdMZ29hNk1JcUlCVG1YcmRj?=
 =?utf-8?B?bUNvTjBmVC92T0lsUkgxQmdHTlhUZDVZblJSTnd0S25ER044WnZhMkNKeFg1?=
 =?utf-8?B?N3p2d1cwNnlJTDBzZVZJcWlJdTEzVWJCQldQbjFFWGdhR01JV0t4eVdCNUoy?=
 =?utf-8?B?bE50NDYwaXdFWFZTWU1mNDA1Q2gvSzdHeFFhSEl1MVV4T3FqNHcxMHY5dHRi?=
 =?utf-8?B?cUhFL1kwLzU4NEp3MFBGNmJXNjY2OWdwTmJzWXVpR0Q3RFhabGd0OElSeGhJ?=
 =?utf-8?B?OUpDb3JGaFF2UEJpOEtJbXZ5NDBISSs3b1VlK2lPa24vajd3T08wNUdIOG00?=
 =?utf-8?B?aWxNalJ2S0ZFWG15NlhjRndkaUQ3UzNNaW5KN09odzF3MU03cjhVU3ZEQzY0?=
 =?utf-8?B?elZNQ1pJYTBzYzYzcHFja2p1ZnpqSDJuZW5JNXV5clcwNWVSMjhnM2EzMXVW?=
 =?utf-8?B?OEIrYmozUjE1eEdqUlVsYzcxQVhwRWJ3ZGtQZHpYVHk0bDkzT2pvbmszbWFM?=
 =?utf-8?B?RHpvVEg3K2c3eHgvaitnMGI0eC9OdXg2Zm5GVnZBWWJuOHNUSXRNblVxbEll?=
 =?utf-8?B?OEVNei9BSDVwbmZmUHVmUVlNbVd1SkZMdStrZXhQcU5tNGRuZTNKa0dNV2Jk?=
 =?utf-8?B?OVljM0NCNk1DeTJrTFl6ZExyMWxDNkoyS1pFSjI1NEdXZTBSM1ZjTS80Uzkz?=
 =?utf-8?B?OXViRGpSejdkZXJoSjhNTmVTQ3JuUzJrdEtSeHpvL3B4anFFSE1xa2lSSDNZ?=
 =?utf-8?B?ZGp4S2FUK0hsVEpOb213djdVRWRJbU1TUVBwYlNkL0Z5Z0xLZkF2MGlWY2dB?=
 =?utf-8?B?UWFzcUR1cTY0TW1FQ283SW9ZUUFncVQ1MnN6bVh5NjFIWnN0M0NVMHhUQy9V?=
 =?utf-8?B?OGM3ajN1SHpYMUpwWEZLaDdhdWJoU1RvRmt1N1lnbS9ObVVDS010L045NlQw?=
 =?utf-8?B?OUsrS2lQQnVKVk1SVzd4OWhlVGh6ditzRWVwUm1pZmJ2NUZkTDQyb25ObTgr?=
 =?utf-8?B?dVA2OW5MSkN4ZStQQTlsN1VZWk1YNTdnY2ZyUmExUENzU2xBSUw1TWY1bHp1?=
 =?utf-8?B?ZCtQUWE5RVdYZkg2WTFKcGR2VnhPRUIyaGhWN3dTMHRzK1V3aldDUTYzWEJs?=
 =?utf-8?B?T1dacTduczJLTTlyS1c4aXEraFV2WGkva05LVENoUjR6T2tyOGNsdk8zQjF0?=
 =?utf-8?B?TE55dzlON1BwT2tXQS9XNGQvemZHVFFjTGI2V2NpUU9lM1k3bXc4b0VEY2JQ?=
 =?utf-8?B?dUE3eDUrNE5KZnErRUQyV3BEYVo1ZWQvR3BiVnMzZGc3c0ttTklaZW1LaVVT?=
 =?utf-8?B?cU8zQlBOM3ZVSmxUOTY3Rm9nWnZlSGVMd3RHZjIyRHZ1TjJnaFp4emdZa3g2?=
 =?utf-8?B?VW9Jc0g5N1J0UWpXQUdZWEwrL29mQk5UTEVDcUVCZDVMZ21oRTV2ZHpHaS9n?=
 =?utf-8?Q?9RtTWm0O4Jto2qYoS2IvSzM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e98c30aa-66ea-495e-9caa-08dd9e5dd1af
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7038.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 03:06:34.6885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7NiwFOlZ/smIub5CBVL1RtE+Dw1HD/3YYkQoGnfjPV3VMS87dx0bbnAlXp5mF6V5LD5NbqsCAyK/MejN6D/GGrtcvdQaXAjFUBOXkm2KdXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8430
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



On 29-05-2025 04:45, Matthew Brost wrote:
> On Tue, May 27, 2025 at 10:09:52PM +0530, Himal Prasad Ghimiray wrote:
>> Introduce xe_svm_ranges_zap_ptes_in_range(), a function to zap page table
>> entries (PTEs) for all SVM ranges within a user-specified address range.
>>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_svm.c | 43 +++++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_svm.h |  7 ++++++
>>   2 files changed, 50 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>> index 59e73187114d..a4d53c24fcbc 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.c
>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>> @@ -1006,6 +1006,49 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
>>   	return err;
>>   }
>>   
>> +/**
>> + * xe_svm_ranges_zap_ptes_in_range - clear ptes of svm ranges in input range
>> + * @vm: Pointer to the xe_vm structure
>> + * @start: Start of the input range
>> + * @end: End of the input range
>> + *
>> + * This function removes the page table entries (PTEs) associated
>> + * with the svm ranges within the given input start amnd end
>> + *
>> + * Return: tile_mask for which gt's need to be tlb invalidated.
>> + */
>> +u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end)
>> +{
>> +	struct drm_gpusvm_notifier *notifier;
>> +	struct xe_svm_range *range;
>> +	u64 adj_start, adj_end;
>> +	struct xe_tile *tile;
>> +	u8 tile_mask = 0;
>> +	u8 id;
>> +
>> +	down_write(&vm->svm.gpusvm.notifier_lock);
> 
> xe_svm_notifier_lock

xe_pt_zap_ptes_range needs write_lock, whereas 
xe_svm_notifier_lock/unlock provides read lock.
  >
>> +
>> +	drm_gpusvm_for_each_notifier(notifier, &vm->svm.gpusvm, start, end) {
>> +		struct drm_gpusvm_range *r = NULL;
>> +
>> +		adj_start = max(start, notifier->itree.start);
>> +		adj_end = min(end, notifier->itree.last + 1);
>> +		drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end) {
>> +			range = to_xe_range(r);
>> +			for_each_tile(tile, vm->xe, id) {
>> +				if (xe_pt_zap_ptes_range(tile, vm, range)) {
>> +					tile_mask |= BIT(id);
>> +					range->tile_invalidated |= BIT(id);
>> +				}
>> +			}
>> +		}
>> +	}
>> +
>> +	up_write(&vm->svm.gpusvm.notifier_lock);
>> +
> 
> xe_svm_notifier_unlock
> 
> Matt
> 
>> +	return tile_mask;
>> +}
>> +
>>   #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
>>   
>>   static struct drm_pagemap_device_addr
>> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
>> index 19ce4f2754a7..af8f285b6caa 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.h
>> +++ b/drivers/gpu/drm/xe/xe_svm.h
>> @@ -91,6 +91,7 @@ bool xe_svm_range_validate(struct xe_vm *vm,
>>   
>>   u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end,  struct xe_vma *vma);
>>   
>> +u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end);
>>   /**
>>    * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
>>    * @range: SVM range
>> @@ -305,6 +306,12 @@ u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end, struct xe_vma *vm
>>   	return ULONG_MAX;
>>   }
>>   
>> +static inline
>> +u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end)
>> +{
>> +	return 0;
>> +}
>> +
>>   #define xe_svm_assert_in_notifier(...) do {} while (0)
>>   #define xe_svm_range_has_dma_mapping(...) false
>>   
>> -- 
>> 2.34.1
>>

