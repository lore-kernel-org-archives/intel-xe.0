Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8492CF6497
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 07:37:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D1910E3AA;
	Mon, 30 Sep 2024 07:37:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eEjELPte";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BEE510E3AA
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 07:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727681820; x=1759217820;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=YRXD1FkB0HF4F/8dZ57BhF7y/Smi64JhDEQMAT2uYjo=;
 b=eEjELPtelvQTzRlKaP7mo+DSFmHpTxvW/dp8QmZ6XyHAamriUM91oWcn
 ZkxTFrVcQMjph/Q+bznb8ZKbphcsdV9Mtq07NO1nOnvqxaLnB+M+3Qc4s
 7BigO+fZq8gNXj0AbqkOe+JCwrS0i9EBZuOkStxraPq8UzhG07xE900gR
 ADbQlhojafM7A6yyPBQ01+zY99X2bXhaHaIwvdEAAUBFYf8QoOQ2NOOrJ
 2ZufY929BTkI/+sQLVUQXhvNtSaEGVA6qRjKxRM3k+Sf4pa3cIYuSiYeV
 Xfs8nxvVrocERTOqbWF5h3zHKpdDiMg6OIgMOLisQiui7S1exYmZSRoGT A==;
X-CSE-ConnectionGUID: qdhtYIOlTZuOBRiNS3Z5/w==
X-CSE-MsgGUID: 7aR43TVMQfiptqtYl3/bNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="26632757"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="26632757"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 00:36:41 -0700
X-CSE-ConnectionGUID: Czz3g+g9RyiSzz79rFuS6A==
X-CSE-MsgGUID: GEMgA8JLSb67jDgi+TxC2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="77288502"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Sep 2024 00:36:40 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 00:36:40 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 00:36:39 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 30 Sep 2024 00:36:39 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Sep 2024 00:35:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OaYVEdzdpjl2a9rOyivbkE9V8G6HcR4j3QktXlUDSl5/tRuO5u52YHET2thsBBEUJQ7/XLpo9crmE5Nge5cNlWBTSKuvHO6JfraGGBNAUhcfg5JZc2GjVrz3oN2bT1uxYoA0yetvr2WJEWW/iRaahgCZKrXN2kXNchQNGCI3kNnxZuQfZO/FwvAt65r5G1XnxOcP9sRYtD3ZLVGiOHYSgnwZkdcQ7B/KpGhPsxM4+moxE2ZGE6ADVA882d9e9hL/Ru53KhzXsMH2jIERnE02DUYAbezBMtqlPjZEnx8hpubsZy+7fF8oXusKskar+Il6vjYtJ+VC9Pw95vaq3W7ONg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u5A1dg5QeaFbOBXs8eI01ycA6ipDJrloM1o3/XokT80=;
 b=NcI5xLyGMkFape4l01AjTTLGwNSBq5xpjpFT3OrA3AKanML9ofsrgoZwB0SNtIVkDn7Pwyj8bRz5DLa1ICXUqgLf5IqyIuNH73dkSlBDX8kOXpElrCgF8Zh3EELMARbSzXQ+1orKcYkXFTsmCeWaxcK3kn1Foy9yX3XUTRJDYlMO0mVxLofAgu/IL2kIwxDxWzW4f8WmnhOTxsG2oO3LNtZWCdhw47mjbUzCBZBA4/UbgPrXBED2YZKvxirg/07ckHILVj5/cLgJ/hKWNUZ7HTWqAgGeCAbd8pf0ROIhYF9BQGLQMVmonb9bymwazlM4w+ejwshOIu7Hv1I8A+WHtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM6PR11MB4755.namprd11.prod.outlook.com (2603:10b6:5:2ae::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Mon, 30 Sep
 2024 07:35:54 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 07:35:54 +0000
Message-ID: <d9fab8c6-9943-481a-839b-e95950bcc142@intel.com>
Date: Mon, 30 Sep 2024 13:05:48 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EKUnit=3A_failure_for_Fix_xe=5Fforce?=
 =?UTF-8?Q?=5Fwake=5Fget=28=29_failure_handling_=28rev6=29?=
To: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
References: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
 <172767623196.1133357.14970746584647639652@2413ebb6fbb6>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <172767623196.1133357.14970746584647639652@2413ebb6fbb6>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0067.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::13) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DM6PR11MB4755:EE_
X-MS-Office365-Filtering-Correlation-Id: d9ccb044-75ec-443b-4ef5-08dce1228412
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RE5ENFhwcjRnYWJnZHpkQzkyM04yVzFUUm1YRHlIU0twaEh2cWs1MU55dy95?=
 =?utf-8?B?U3AwZ0JJa2RBMm9pb2dkOXJPbGNicnZ4QVBuZXVRdnZWZ3FSQnZ3TlVwUktt?=
 =?utf-8?B?OGd0TlVBTjlYM3VsOE83ekJaWTNoRi9wOTczZVhTK2ZRRURLME14dXFoYUJV?=
 =?utf-8?B?YlRsUDBYRi9EUWtXdEtuTGpPUGNVNjZFeWNrVERBb0lJVVNzOFllZXl2c3pZ?=
 =?utf-8?B?Q0hEOXhwbHM3aS9scTFhamZVVTh1SG1UbFUwWnF6L3A1R0RKNUtJMUUwMnR4?=
 =?utf-8?B?TFpiL3UrR3p1dkJtclpXTHE2V1ROcnN1dzlBVDJZMk9OdmNFdWMvZUJSa0hs?=
 =?utf-8?B?ejBLSTkrTDlJYnJ2UG1RVW16OUxJY21oSkN2MlZUVXNjQ0M3Yi9mY014SEtz?=
 =?utf-8?B?ekNkZXpUOTNIdUZUM0lRYTRqODVmZzFPWmp4SWVpYXJPbXhkeUN4elNlanU3?=
 =?utf-8?B?by9hVHNhZnU0b3NmQVIyVnhoZFZ6VVNSbzJlYnd3M2srd2EyMVMzQUFBZ0Js?=
 =?utf-8?B?L0JDQnNydm45Vk9ySXo4NkV6cU5qeFRMSDZDbkFrMHVRQ3ByNmZTZEMxLzVY?=
 =?utf-8?B?anFJZm9YU1FwcHpxU09ERDJaVTR6S1JieDZVa0tkaEJob1dCZW40ZzJsREF3?=
 =?utf-8?B?S04vUjB0Zm1CTWhVSStObFVHeUtqWmlMZEVMaS9kTEw3MXZ3Vi9JUzVTNzlO?=
 =?utf-8?B?eGNwb2p4UGZiY1FWWXg4b0xNZW1saVlOdndOb1FCdGI5WEVGUnh1OGdIcUpP?=
 =?utf-8?B?S0J0Tk5XamZLSGRiL0h3M3ByRXJualdDSU9vYk1kdWxoS2FwUmZ3akJxMi9I?=
 =?utf-8?B?SExTYXUvb25tZmNBVXQxQmFtWjJSY3N1NUxRbmZwbFBCcWd5MEFsR3R0T3FL?=
 =?utf-8?B?ZXBhYXVwSWtGaExmbUc4OGQ3STRWdXMrQUNPWGZpdld6ZjdIdU1tOXJlTVhu?=
 =?utf-8?B?dEVBN0xvM2wzVmE5bnNpMUpYZXJnczZWN1V1eWJNQ2lNYXFmb2I4Umo0cFgx?=
 =?utf-8?B?eUkrUnZhVFJITWFrcy8rOVR3WStxWDk1N0F6YTJZaTB0TmhBUXhzQ1RLS2Jr?=
 =?utf-8?B?aWVXZ2V4aFBhWmFMZjVVRlhEK3BNUEFBb3RBL3lLNkdzRUJxWktFckNWVlVw?=
 =?utf-8?B?S2hRYWZXdVVqL25iVjFFOEovK1p1VGR6eUVPajJIVmxLYzlaeW9wN2FTclRw?=
 =?utf-8?B?T3VaZGJLVGpVaDk5YWplK0Z0cG8wRDBwRVlSelNXVWxFbWJuQjY5NDF1WWJm?=
 =?utf-8?B?RUlBUWpYYm1MdWJyTXRQY0U3UnZCTXVueHMwNjRSNFZYZnRhcnRYN3hEM3FK?=
 =?utf-8?B?M3pSV0xvbVBvZll6bWxJS0gwRjV3b084Zld5UzVTNDFMWDVwNTRQdHBuVWhS?=
 =?utf-8?B?MHl4Z2VaWGFQQ3hDSzJha1dEM09xdVJUdjdjRUc1UURLdGRGOXFSZXFzVWFz?=
 =?utf-8?B?TnpOdDhQck9QMDA4eTNJZXNTYjNVZGd1NzJ5UE1zS3ZWeTAyb3BxRDVBbGhZ?=
 =?utf-8?B?VldZdVZIeTVodCtqWkJjbjNLRVNnaDZranJtTVRzSHg5UTZvcFAwd2t4bGVq?=
 =?utf-8?B?QXhyUVRwRkJzTmoyaUVTbktveWdrTCtVbE9KUGhrUU5jNFRqUDNTeXI1b2U2?=
 =?utf-8?B?YUtjN28vRHYweHRpam11ZFE4aHhWZHBjRVlha2dFT0oxc2JlSmE4WFBURTFB?=
 =?utf-8?B?bFdQbXRBc0ZwMUtmYzMrRnhVZWlBZ0l2ME0xWXhPd2x2bHR3RVVueU9lZjZX?=
 =?utf-8?Q?y3IJeGhiC/3hx2TT8I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0NlYVNzb2xGbWFmajNwb0RIMHlsVjJpZ1RBeDM4WWsyeDczUGRWanU0ZDZL?=
 =?utf-8?B?dmZudXJIRG5xTVAzVVZFNnhOQ25BaWpobGh3RU9IOG82ekpBSDBqeHk1ajI2?=
 =?utf-8?B?dWdxVS8zQ0hrYUZsSHlaYmZMZ1lzR3R0bVF2WGJkNTFkaDcyeS9mNzF2S3lq?=
 =?utf-8?B?UU5sclhkOXZ3Unhhc3QyUjE0ZkZNRmdVT0t2dSt1WFV1OUNkYjhwajRkMDZp?=
 =?utf-8?B?cklJSXA4Q1N4dGRSY1hRd2h3Wms4bmtIRUlVWVIrQzB6SzcxSzJPUkFWVlFi?=
 =?utf-8?B?TFpWRndVSlJaNjQ1eStQY0JRcncySTFxT29qaXBrSHRrUnk1dzhzaFBzWitW?=
 =?utf-8?B?YUdMOGpHWGlaVkJ5NGFEWjRqdlYxc094cks2RmdWSWw1Ym0zd0t3K2tETHFi?=
 =?utf-8?B?MlpwTU1YbVVnSllieFUxaTJsQk1RMVY0Tkl0TlhwcmtNSnBkcHV6MXJKTzVW?=
 =?utf-8?B?dVhhSFphTTczWmhwek9KS0VxbEdoT29pRnJRODBzcnhVd0FCZ0VUQjNoWWp1?=
 =?utf-8?B?eGw2T0FFTlFlcWkxNHh0SE5uc2hRWGIzL0xtT3RTR0RnbVdoV3p6a0luZ1Vh?=
 =?utf-8?B?WGRmUWtVYmE2ZEk4dmpLT0gyZ0FObXBZdGUyblpTb3lPRUpYTGE5eFdnbmZx?=
 =?utf-8?B?c3k2YStyRHFEQngxSHVIQjEzNXBuZDFiZkcvc1hvSDRpTXRVZ3NSSkpRenZK?=
 =?utf-8?B?NUxBNDlrQUFjNWJyMlRRR2xocmNyeWtVSjVjWC8rTVY4SEExMCt4VjlyTm5n?=
 =?utf-8?B?UDlUeUY0Ny9YSitiQ2lDcldxNHVJdVFsZi8zNHJIWnJsN1kwSUU2YnhmMHlU?=
 =?utf-8?B?YU9MemdaajQrTWY2MVphckNCdnhPL21FYmxETkhwSWpSRUVLUnVtQnI0NG5X?=
 =?utf-8?B?SDlISlUvaTRyNm1IY1AvUldSN1FjZFlUQnZlaXh1Y05ISXJlU3ZUbmlZWnBn?=
 =?utf-8?B?TER2QisrMWVwcDkyb0dEODhvQytSaGpoNi83eE5pRnlzdm5rMS8rclgya0N3?=
 =?utf-8?B?bEs4RWh6c0dnRmhoM3hzUmhXYlNKbXI2aHdGR2poRloyam5YeU81dmhyUzRn?=
 =?utf-8?B?eVNMekxEQkJXMVVvaHduU1Y5Y3ExM1ArNmdLei91SUF1L2tCREtPcFFyY2ZT?=
 =?utf-8?B?SitFemhBSGdjVmVXa1FSTXpINzNrNWxVN3NYWFdXaDJMcTROVnlOZjQ5Q2xT?=
 =?utf-8?B?dFZKRkZvVnViLzR5ZlBXL3Z4aEhoc29PaENBZHlzY2ZxTXNiRElTc0xrdXk5?=
 =?utf-8?B?N1lCNWtTekszUC9nUGFjeEdtZE9MY0lQOXJCb2JsdkZQUUJpTnJPempCbHhH?=
 =?utf-8?B?MVBtdWRRT2xWay9aQmtEVGVaMkJYdjl2ODRSazFrYWpFUU1uNysrdnlYcGgv?=
 =?utf-8?B?VVd4ZC82bkoyYldoaWFzc08vOGJvWVliUFAydXRNY0dPM29UR2kwZXJmTVp2?=
 =?utf-8?B?YzAyd3BPbkxVSXQvMnlLQnZaa0NYY3RzOGRsbDVKNjVwUEpkWVJkRUlFWjFl?=
 =?utf-8?B?bW1rSzQvaUwzKzY3VW5rMnJrYXN2bkN0SGVYdEhpNm12cG5aMkZHVVVkcTUv?=
 =?utf-8?B?bW1xeTBobGtPdmRHU1BJL29OWnZBb0xBRjNKc3V4MVlURmlNK0tCMThKVVNv?=
 =?utf-8?B?RlNvZ21wYldEQmg0UDVWMVhZRG91UG9WSG5QTlVYNXl0SjdEMmRnRG43ektw?=
 =?utf-8?B?eGQ3Ni90NCt5UVdZRVdkNmpRWXBaand3amx0Q3ZVUXNqSUtXV2VWalpSTXNr?=
 =?utf-8?B?bmRUQWFQeEtVcFFJelZHY3dqOUZlUzVyU0dwcXk2bTJvVnNUbkRLcTJDcVdy?=
 =?utf-8?B?amI2YnQ3UUtJZlJhZlRFeUU3QWlpUlYzSGRIZkk2dGFOOHdkUEhIUW96V20x?=
 =?utf-8?B?WEtMeHp4SlU0enVnbm44akhENTN0RnY3Uk5WSndnQXVDcDRoaDR6ank4Y0FS?=
 =?utf-8?B?SmkzdE5MUUVMNWVucWY0RFRQcXNNM3g0c2oyR2hvbkdQRTRtYWlJNktWWkk3?=
 =?utf-8?B?RzVHYkU5azcyMkkxMEdwN0MxcFJSWS9pZVVNQUczYUM0SU5Ic2hIemlJTWw3?=
 =?utf-8?B?aEF0T0FuaDJMaGJ4RFRBaUhUcnBOMFloU0E3TE9hYlBKR1huVGZqUzBRSldY?=
 =?utf-8?B?SmI5b0RpZTYyWWhYaEVUMHB4aCtaSjh0QVozMzlkREp6TTFmTFE1RWpTbEJu?=
 =?utf-8?Q?aDKLd7rfRHaNxyRRQuOsg8Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9ccb044-75ec-443b-4ef5-08dce1228412
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 07:35:54.3426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XYqHO7GuvjK4t6vstwhy+kSohhQKLY2WxkdfXqX2aXiWlSQL0/JDPVAfcbdHZZH0YbHpwKd/Fn/ooyExNy4ncQz0ZQcYmaByJBhGk0i26T8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4755
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



On 30-09-2024 11:33, Patchwork wrote:
> == Series Details ==
> 
> Series: Fix xe_force_wake_get() failure handling (rev6)
> URL   : https://patchwork.freedesktop.org/series/137982/
> State : failure
> 
> == Summary ==
> 
> + trap cleanup EXIT
> + /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
> ERROR:root:../drivers/gpu/drm/xe/xe_gt_idle.c:56:27: error: redefinition of ‘str_up_down’
>     56 | static inline const char *str_up_down(bool v)

Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   10 weeks ago

     lib/string_choices: Add str_up_down() helper

     Add str_up_down() helper to return "up" or "down" string literal.

     Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
     Link: 
https://lore.kernel.org/r/20240725101841.574-1-michal.wajdeczko@intel.com
     Signed-off-by: Kees Cook <kees@kernel.org>

Is merged to drm-tip needs to be backported to drm-xe-next, along with 
removing local copy of str_up_down from xe_gt_idle.c.

Failure is not related https://patchwork.freedesktop.org/series/137982/.

>        |                           ^~~~~~~~~~~
> In file included from ../include/linux/string_helpers.h:7,
>                   from ../drivers/gpu/drm/xe/xe_assert.h:9,
>                   from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
>                   from ../drivers/gpu/drm/xe/xe_gt_idle.c:8:
> ../include/linux/string_choices.h:62:27: note: previous definition of ‘str_up_down’ with type ‘const char *(bool)’ {aka ‘const char *(_Bool)’}
>     62 | static inline const char *str_up_down(bool v)
>        |                           ^~~~~~~~~~~
> make[7]: *** [../scripts/Makefile.build:229: drivers/gpu/drm/xe/xe_gt_idle.o] Error 1
> make[7]: *** Waiting for unfinished jobs....
> make[6]: *** [../scripts/Makefile.build:478: drivers/gpu/drm/xe] Error 2
> make[6]: *** Waiting for unfinished jobs....
> ../lib/iomap.c:156:5: warning: no previous prototype for ‘ioread64_lo_hi’ [-Wmissing-prototypes]
>    156 | u64 ioread64_lo_hi(const void __iomem *addr)
>        |     ^~~~~~~~~~~~~~
> ../lib/iomap.c:163:5: warning: no previous prototype for ‘ioread64_hi_lo’ [-Wmissing-prototypes]
>    163 | u64 ioread64_hi_lo(const void __iomem *addr)
>        |     ^~~~~~~~~~~~~~
> ../lib/iomap.c:170:5: warning: no previous prototype for ‘ioread64be_lo_hi’ [-Wmissing-prototypes]
>    170 | u64 ioread64be_lo_hi(const void __iomem *addr)
>        |     ^~~~~~~~~~~~~~~~
> ../lib/iomap.c:178:5: warning: no previous prototype for ‘ioread64be_hi_lo’ [-Wmissing-prototypes]
>    178 | u64 ioread64be_hi_lo(const void __iomem *addr)
>        |     ^~~~~~~~~~~~~~~~
> ../lib/iomap.c:264:6: warning: no previous prototype for ‘iowrite64_lo_hi’ [-Wmissing-prototypes]
>    264 | void iowrite64_lo_hi(u64 val, void __iomem *addr)
>        |      ^~~~~~~~~~~~~~~
> ../lib/iomap.c:272:6: warning: no previous prototype for ‘iowrite64_hi_lo’ [-Wmissing-prototypes]
>    272 | void iowrite64_hi_lo(u64 val, void __iomem *addr)
>        |      ^~~~~~~~~~~~~~~
> ../lib/iomap.c:280:6: warning: no previous prototype for ‘iowrite64be_lo_hi’ [-Wmissing-prototypes]
>    280 | void iowrite64be_lo_hi(u64 val, void __iomem *addr)
>        |      ^~~~~~~~~~~~~~~~~
> ../lib/iomap.c:288:6: warning: no previous prototype for ‘iowrite64be_hi_lo’ [-Wmissing-prototypes]
>    288 | void iowrite64be_hi_lo(u64 val, void __iomem *addr)
>        |      ^~~~~~~~~~~~~~~~~
> make[5]: *** [../scripts/Makefile.build:478: drivers/gpu/drm] Error 2
> make[4]: *** [../scripts/Makefile.build:478: drivers/gpu] Error 2
> make[3]: *** [../scripts/Makefile.build:478: drivers] Error 2
> make[3]: *** Waiting for unfinished jobs....
> make[2]: *** [/kernel/Makefile:1936: .] Error 2
> make[1]: *** [/kernel/Makefile:224: __sub-make] Error 2
> make: *** [Makefile:224: __sub-make] Error 2
> 
> [06:03:18] Configuring KUnit Kernel ...
> Generating .config ...
> Populating config with:
> $ make ARCH=um O=.kunit olddefconfig
> [06:03:23] Building KUnit Kernel ...
> Populating config with:
> $ make ARCH=um O=.kunit olddefconfig
> Building with:
> $ make all compile_commands.json ARCH=um O=.kunit --jobs=48
> + cleanup
> ++ stat -c %u:%g /kernel
> + chown -R 1003:1003 /kernel
> 
> 

