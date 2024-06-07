Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1622AC27C53
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 12:09:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA7C10EC1D;
	Fri,  7 Jun 2024 12:09:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cZDrEYMJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3740110EC1D
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 12:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717762192; x=1749298192;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vrZLcuhya9o8pW9I73WebfTcry1N3Q2167/inLl2txk=;
 b=cZDrEYMJCwDPUTJERcBEROmrXLVBgl1B9hNx+MYQFD4D5kbsEpYxLY1J
 fsMgMF5nVpLV3Qff5fWZFVY0qxirIG7BXAKvQ8UxqKwhI6nxFgQG+XVgk
 s7D5fj9I1Jh5/nBqzcTMcP9iM8jqrtj6QLGLHM5vCayb2Oea0BisSawey
 S0fn1oSW5YB/xqafzPn0Eoh40D92FjS+UPQpz7T/dXaL2/sK0fwGbb0B6
 6Dqpd+dcGPd+logg2TIDIxD8bKd+Ji+ouzcXdCeoBDafWf6b54Tow5VbE
 eqBCQ2062I0DiJAWF1xyPPxKbX6Y87CjpkWA1oNqaWMKqSexuVVtq2Eyw A==;
X-CSE-ConnectionGUID: O4AAsJ4zTgK6BH+QgAUZ3g==
X-CSE-MsgGUID: nESmybCgTzmxVqbrNidoow==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="18306783"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="18306783"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 05:09:51 -0700
X-CSE-ConnectionGUID: DWX1kHRnT2iypDIACwkl2g==
X-CSE-MsgGUID: EoYm+1AZRCeSb/kOB+iokA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="42721093"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jun 2024 05:09:51 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 05:09:51 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 7 Jun 2024 05:09:51 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 7 Jun 2024 05:09:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GY/rCXq/mwpUwsaEfifvHxtUYRG1I0oytEieetKmDg84CJnOXCT39XOWoquP4RzGtSUpsVeuH2clY1eQzayd5A/IUvo8wB55wa2h/wcuAkH6uyw7lb4nPbl99K7ddMtdcLF12dkc7lrNejeWRZAB1pOewI6mgD23FbiI7FXYLVkEOtGushwKFJH/rfuB2gUbj950UQrRRVuTV/Jr2jia4mCsdpYLgdB44HkQtfbLQgcieGECJ/FR8Kn6XkheOeFx2wNwLkgL9zK0EpJr6t9/2PRABAhva8VdtnXPNlytRcXSsNGAh0bfbOZusXNoP1NpS+C6E2iVtWrwFsyaDhwjSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KlhvIhgtJqcV9SPlkiqrPw34t5zQ8aQgv5FXNOiuXT0=;
 b=alF2dTGw507jwzpcIOD6dptd5gUUHh83pRBKPxEBn+KfBbe96oJxXEY6pLHesd8bmo1frddT0VlH7tqzas82H46zXmP2xo+N/COCQ2vj+qnRHRcR8HYhSjjKJcebr51hMJ5hKirTJFkk8W+lunWcA0Yga0sJzsU8Jkl/QeA5/eQ9H78lx54+WM3NbAF0IqpW6e193Ir63a9adi1C2p514M9ZeEyA68UV7igUInGqwwDasyDSkKdG8QHRz/rhpC4OzJ64QgcU9i5shmkXe2M49+ykZMAYxDNsbYP98QhBRPvNNQ+HdsICDmzIJck29csqw7iruuQ1afoZQyY5+4/nQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH7PR11MB6746.namprd11.prod.outlook.com (2603:10b6:510:1b4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 12:09:47 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%3]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 12:09:46 +0000
Message-ID: <9a6c33ca-b0b2-44d8-a9c4-e1b23966b2b0@intel.com>
Date: Fri, 7 Jun 2024 17:39:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe: Check valid domain is passed in
 xe_force_wake_ref
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Badal Nilawar <badal.nilawar@intel.com>
References: <20240607052213.1391082-1-himal.prasad.ghimiray@intel.com>
 <20240607052213.1391082-3-himal.prasad.ghimiray@intel.com>
 <cbb037d2-43fd-491d-b8d1-d023b32c9758@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <cbb037d2-43fd-491d-b8d1-d023b32c9758@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0169.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::21) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|PH7PR11MB6746:EE_
X-MS-Office365-Filtering-Correlation-Id: 05557cb5-d2f0-4a3b-519a-08dc86eab8f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TVUxcmxZbktSUDVXaENxL2ExQXFOVDBPN2E5MXJWOWNjdmY4dFpNR3c0VENB?=
 =?utf-8?B?TS9YT3ZRWk43dGtmSXoxVGZLTnNvRjVhRy9iMFZnUFRZVjFjRXQvZkViZEVD?=
 =?utf-8?B?eWNEeE9UMDRBaFk3eFlnU0FRcEFZREpuWGVVZDU1L0xiOWJ1eVBlWUFwWjdy?=
 =?utf-8?B?QjAxS05LTnNOK1hwQWtyQkQ1NnBJcXlUTDQrKzdMVXdZSmc2cFpaM3Y3QURx?=
 =?utf-8?B?MHZMem1HMDJ5TjFob3pwYTRPSzRqSzRGSU53NjhNbXV2VHd4UnF0d3F2Tk5I?=
 =?utf-8?B?OUZBL0o4a08zLzE5SitEOFN3aENFRStUdUozT0dYOTJQeGJ1VW9CNXY1aUd5?=
 =?utf-8?B?TmhjOGoxU0VCQ3BTTlNjUDcxb2wza1ZpU0hSTitYYWFuL1doNW81NTArMVJa?=
 =?utf-8?B?UFg2RFhrYmo4aDlNNE5wN0I0UTBJem1POUhHOFg1ZU5tODBXS3RNaVhoNDU1?=
 =?utf-8?B?SHp4aFFVVnlRNEZHdmxwOVJMVGJ5ZWpUQlFWMGFGd0pKZFNjcmtDVlJTUDBq?=
 =?utf-8?B?cmI4V1lyL2hQU2hsTHhTNzZ3ajJURndYeC82RmNsUDRIZC8xd0tTOFI3cE1B?=
 =?utf-8?B?TzhpS1ZNN3NqNUpueVZLeDEzVDFmaWd6TEdDZ095MlhvMXJEMTd1RDRzVkZB?=
 =?utf-8?B?MEJmRTdndDFTSUVKZUJReWFjb0JFVVNaYklUa2RyOUZKUC9GS2h4ZnJMOWMr?=
 =?utf-8?B?aXV2ekVaWmRNSWxZRVBwYzZ0eHNoN1Z2Wmx6THdiTENIaGZydDhZeDRmMHl5?=
 =?utf-8?B?cnBEZnBEdzFvL2g1MWFQUGNTbkQySmZHOHNSNmNnNXJ1Ym5zR25BeUlLN2VM?=
 =?utf-8?B?elNIRWZjMTNGZUpHbmxKV0VCYXlJTm15SHA3ZE00dGJVcXczaWtEeHYwZytS?=
 =?utf-8?B?Q3ZQSCtaa1NRMCtpSW5uME41K3YwaEFVVGdLaUp4TXFaNE9Xc1Z0SE1aWXdw?=
 =?utf-8?B?RWI4dFVRaDg0NWhURk5KUWZsalVHc2w1TjNHTzIzcUJRcDdQYzVFQmdDbWNQ?=
 =?utf-8?B?RXk5bitOYmNkaFJuVkxSejN5Q1dUNk82QTcwM2xBem1XdjhvRnJhSE9ZYVZv?=
 =?utf-8?B?WThuWkhNNnJoaGRUNTdqVWtxRXRiRWhsczljSjBncVpFMy9BUHB0NVpIZFZS?=
 =?utf-8?B?UHI0ZmxjeGpuRE1ZRU42K1J1UGZlVGUrdno3cUEwSG8vbEp3QSswR2h3OUhN?=
 =?utf-8?B?bVJqQm92clp5MmIxbGdLblFtVzdoSFdkelVubzF4YStTak9IdzF2UW4yYm9S?=
 =?utf-8?B?WkhDdVFTd0g2SUxRVzdacWphL0crdjFKQnN2S1lKZ1RQUzNMMC9UZHJaTHg4?=
 =?utf-8?B?Y1JlRUVJZlhvQUpOTUJMM1Z0MDduOTd2YnQyZVdQbVVFK1pSUEdXWXNSRk9U?=
 =?utf-8?B?ei9kQXBnNHBoSHUzcDJYTmVaSHJpVWFTWnRvejNxaHZhTkxtdUdCNmlySEdF?=
 =?utf-8?B?cjdhdXgyQjdzV29MNis3NW40Rm80bjB2dVA3bnJSckNxMWIwMkl0WGpLOW1M?=
 =?utf-8?B?aEprRzlVQzk5d0UzdExsWk9NSFRPdUJWSVFwZzJsWFRFbGVQWTd1aEh6SFdQ?=
 =?utf-8?B?K3lsd1llbUFxQ29pNGRiL0ZKYnM1dzZabVh2OThERW93QWFGcndMdHZIS3Ro?=
 =?utf-8?B?S0xSSXJkVUpXV0pEMFZVeGN2N2hPZkdTR2UrRkVmWmg2QjdGNk5FdDc2UTZJ?=
 =?utf-8?B?Nmg5dFdMRmhESHgwQXhjWE9sMGlZaWFqcTB3ZDd3MFB0WGFWS3ZRWkI3UTlC?=
 =?utf-8?Q?7Zp0m7Lu2tBM0lQ510vfZc114jN7MDN0luY+eRK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WG0ybTl0Ri9LbjRKVHV6MDdoWCtPRWVLRFM2bm9TMFRMd3JCVm5TREZIVnc5?=
 =?utf-8?B?U29UVHUzNXFaSHhSOUhNMWl3K0tpY1k2QitvMkdLd05VeVhjaW5PNUJ4TTlC?=
 =?utf-8?B?eWFPT1RGSyt1cHpqTEY2VHVIdUtSUjd2TS9Zb3AyVjdQMndZbGtjZHlmQndP?=
 =?utf-8?B?dFAwNFZPTWZ2dDBMS0tGSFBVWGtsOWlkOG14c1Z0RWI0d3hZeHdwTEZtMEdN?=
 =?utf-8?B?eHV2UDFTaXIzcjhPVE80VTh4eTRYOU5RQUJqVnFhWEhSekh4WFduYkwzSzdJ?=
 =?utf-8?B?N3YzTjd4UG02NjlIREpNYW9SQmJwa01XL0h2eDByZFhFQk85bzJuZXA1MkFZ?=
 =?utf-8?B?MS94dHRPNzQ0ajIrUksvVEg3a1dHOWdqdXJubFBEcUk0LzBJMEo5a2E3K0Zm?=
 =?utf-8?B?TnVyQkNoNkhDLzdXZCtVRjg3aUU2YSs0L05Gam9KRTRqV0JzWGlXZDFTTlZi?=
 =?utf-8?B?YTMzMFJJY3JXMDlrU3FOT0NrcENDVVpVQWJYNnAxU2JqRnBQMmlSSnJBWDlh?=
 =?utf-8?B?ckpvZStKby84OFJOMVBhM3dydHBjREdPVnJNSWsxRXVSZ3M4OEl5ZEhhZ2tr?=
 =?utf-8?B?Rkd1cWlEd1hUTTVxeEJ0RFlNZXNqRzZnRytYbHNLc2d0Mk12bjBWczhCN0l4?=
 =?utf-8?B?eVI5OVJaWVJxT29DMmZOWXdJbnpzazZqSVp6Y3Q4N1AxczNadmp4aGY3enp2?=
 =?utf-8?B?SGRxZ3JzbS9IdUp1UW9hbEdwUmtZUG1iOWtYV2tWQWFKOGJlaGpWOTdRNldS?=
 =?utf-8?B?NUNNOS9SeDRweDdKN1gxYWVrM2RhVTNQSHlEbWpaNXBOWS9iYzFNNThSK1N3?=
 =?utf-8?B?aC8rUm9RdmVwRmh0b1Y1M0xJa2wrc2lFRDRqbVAyalhQRnZ3SlNLajZqa0tp?=
 =?utf-8?B?ckpQazV5ZXlSVFJqd3RNRkNsbGQ1WUVjQnBvTlpWVWlpYm15aDhaNWhMYWsz?=
 =?utf-8?B?d0RXUGhFWVI0QUptM3lZbkRlYnhKT3plcStCTUJBY1BMWGp3a2g5dytRdDZp?=
 =?utf-8?B?aWt2UnZzVWkvYmNQbGM0Y1dOUW9pWWhZclFoUHFwT2tEbnN5OVpPMVVocDNN?=
 =?utf-8?B?NWlHQ2FmNWpiSllYb2dDMVI5T01SVGtvQllobDlXNHhWNW50Q0lNRUVkUjRN?=
 =?utf-8?B?OEpSdW5FVkRoZDExZStYOHNOTms0UUJwdXhHSjdubVZ2OVJrRUZGL1FXSzNZ?=
 =?utf-8?B?K3Q0bk1SM2pPbGQ0dWRHcFJiaW1ybXVyUUE2RFgxMmNjWTJqRFU2WUVSWGpF?=
 =?utf-8?B?RGF6Q1dBWFRuYktka1RTRUhqWlQxL2ROWnFVVnJKM1cyOWhvVisrbSt2Tllk?=
 =?utf-8?B?Ymw5d1AvMXRzaFlDRm5lRm9yU0MvaStOdkoxRGJzNXNGMDVzaWlnSUhjaitV?=
 =?utf-8?B?K0lWaDR6S0o4bnd1cTZJckV1ZFlpVnZzWlB3M0xjeHo3a2Z0R2o1a0VvQUNJ?=
 =?utf-8?B?M2I0RVE4OVhDMXd4VktTajdkRVJrTHBiNElLRWlBUTFHRVdTckp2eDg3ZEFm?=
 =?utf-8?B?OUQ1T3NMV1hPb3ByaUc1dEY5UE5IR0pzWkhxYVh0clZuejhrOHJ6K01scXI2?=
 =?utf-8?B?ZUFJSDVwK1kyK0E1Ly9raE5Ga3ZmZE0xWUFDY1NGMFZncVpxYU05Tjd1SmlK?=
 =?utf-8?B?bVdiQTRzd1J3bTJXYTlCMTZWa2hVSk5hcWU0TWg2MElxWG5CVXdLcE1JTDlu?=
 =?utf-8?B?ejJtdUQ3enMyZlFoZlJLODlYaFNsVDR2R0ZQZDQ0K3I1Zk15R1VPSy81THla?=
 =?utf-8?B?Q1lZbFlmOUw1Y0Y4SGltSFhFQVVIUk9SbnVBMTIvU0NVVGFmMzNMUDlYSHBG?=
 =?utf-8?B?OE1LblhzQUVLZFJvZTVreGZ0Q1ZiaWhZYUdKTkN6SW9XY0YzZXhtakRMSyt0?=
 =?utf-8?B?TFM2c2I2dWVSbDRFTmQvOUhHT2NzOGs3d05WSWxMWGM0NVhId2RjaHV5Qlg3?=
 =?utf-8?B?N25LWDYyODNUNTRTNFNtT3F4Tm9hQlhtK0Q3bWt1M21NS0RkendiNUdDeXMz?=
 =?utf-8?B?UEtXOUl2aVFHdTAxcnAyRzBNMm9nSHZYNW1kTlBzUjgrMHNIUmNLclF1Rzkv?=
 =?utf-8?B?ZjVVblJZOEhCSHAySi84UVZsM2VLdUQ4L2JBSHhMVzFNNTc0ME1nbmNWaVBx?=
 =?utf-8?B?ejI4UDlSUWRHVit3T0pIMlk3UFdoaFUxZ25hZC9VTElBK2FiVlZUMHRFSzZB?=
 =?utf-8?B?SUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05557cb5-d2f0-4a3b-519a-08dc86eab8f6
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 12:09:46.7715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +DgebjBpJRZnlsCcF7XLU2pQ3iPUbRQA4GnaDV7ph3I94EK8d0RvIynAntyaejn16BX0J+pa0RL7mM1frY/DSPgIhuG3A4Tsxg25XecjSMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6746
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



On 07-06-2024 17:20, Michal Wajdeczko wrote:
> 
> 
> On 07.06.2024 07:22, Himal Prasad Ghimiray wrote:
>> Assert in case of XE_FORCEWAKE_ALL is passed.
> 
> We assert that XE_FORCEWAKE_ALL is *not* passed ;)

Oops, Will modify it.

> 
>>
>> v2
>> - use domain != XE_FORCEWAKE_ALL (Michal)
>>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_force_wake.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
>> index 651ea1e62c63..346785df3b49 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.h
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
>> @@ -24,7 +24,7 @@ static inline int
>>   xe_force_wake_ref(struct xe_force_wake *fw,
>>   		  enum xe_force_wake_domains domain)
>>   {
>> -	xe_gt_assert(fw->gt, domain);
>> +	xe_gt_assert(fw->gt, domain != XE_FORCEWAKE_ALL);
> 
> IMO we still need to document our assumptions about enum values (as
> kernel-doc for enum xe_force_wake_domains) that all of them but ALL are
> single BIT values, so below trick to convert it back to index must work
> by design
Sure.
> 
> then we can also add code more consistent with such description:
> 
> 	xe_gt_assert(fw->gt, is_power_of_2(domain));
> 	return fw->domains[ilog2(domain)].ref;
> 
> but this patch is still a good move, so
> 
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Thanks for the review.
> 
>>   	return fw->domains[ffs(domain) - 1].ref;
>>   }
>>   
