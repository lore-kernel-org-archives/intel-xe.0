Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C121CA1012
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 22:15:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A46610E2AE;
	Wed,  3 Sep 2025 22:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eCWaiKaz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF8B510E2AE
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Sep 2025 22:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756937701; x=1788473701;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eHnA+5st/MBq96P8GI0+lm/ExcTyO/JRvZAVRwbreq8=;
 b=eCWaiKazepPaI0lV1E6YTLRWiTKpklTZPS9eCH+SmnVW4MRIdxqK0Thk
 eSu/vX/TisoPNJdWR6UixFYJW5Bg+/McTIVyxtgMSWM2HuGD3F4FnR98v
 vvgqtPq4dx1NstwXoMu8LZml0vL5glTAU/cncb7EV3FTS2Y0Qb9Y0ItB+
 /7JbTgmRbZ3j0ldVWUxEkpASYj5FhvaHfwbnzglpnXBBJX8ijcsvAUX54
 5o2asBCh8g7K3IUl1+nVS/BtLWyQU/Wqqj9SX2dnoGn2fxpQQviP361aY
 jCHWUWMD2oShUk2frEghWBEtic7/YV7HrhBnyD3A7CdDOsHYI7q+dmqH9 g==;
X-CSE-ConnectionGUID: uq9HC0TITx2CI/aEU/TQSw==
X-CSE-MsgGUID: z4HeZCxhQ82C0Q5grBLDng==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="59206539"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="59206539"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 15:15:00 -0700
X-CSE-ConnectionGUID: iRLL4u7jSXihnI0GcXWwxQ==
X-CSE-MsgGUID: emoh4h+0QyeF2SvxpBoEAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="176065059"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 15:14:59 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 15:14:59 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 3 Sep 2025 15:14:59 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.53) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 15:14:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=latX9bI2jtVVicK5jxJksxRSPemYjFC0qcRs1TPI27OVNMYHgmy/uckjhOSIQa0+nTyXNwCCWMwcH/zpt93LAJR/Q3O/d0V1oPPJgZF4Xxoti/TTC0NOpsXNXpXsbfg6U1rsXhMXvaQpQ2wS6YqvVYKhyR5Nqm1eKDL2WH0/fnTds/WO+pRMtVSW1KVQTGrT/XPxwMu3K1+Fwlt/hr/bls0UciVgQMfqI/Nx9QxHXf8ZSi4Q7VTVgvYiApKmdgIC7lWGYmv5bNF8SKZ2qV0R93LyIc2/A7ZJhsYLPYY/j5xx4vf+H+o/itbIBBXZKLybNjrY3dO0W7ERn/jsok58AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zkjn/WyDFe7YqnlgvDyd83BIYX8t63NzvMPyhH2GC7o=;
 b=arQBD3JiWCtc4ahRKksMJpjXd2z5x+RY+AvD6MvQRL6S1wA0N7sQKrIwOUOlECPqVmUJvZCPb9HKqBBKCpdV/MP650F3zVAiamqKbZZbisW0+3oRgXGFQYrzlhtfEfRtBfc8KzsaNE/P5r0x0BrYVUBVy+sMcoJPVrLP2/iepgcMs+7bj7OZy2mSSP+7IRbDPh5MtKBxBNQOLaa2lTMILFRIjR5SB3dOJvocPGRZYbXEY/Ajxf7ozTCP5kkolbIuj9iRnALjk4TO3ZSbglwqMvhVlnOMYFtXYKPtsoJnN6NWOviMjBBUvoKQF5iRf+uQQ1rADWc/aswKAaegoAoMJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by LV3PR11MB8725.namprd11.prod.outlook.com (2603:10b6:408:21e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 22:14:47 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 22:14:47 +0000
Message-ID: <23b32a25-e157-435e-8b23-ccacb59be55f@intel.com>
Date: Thu, 4 Sep 2025 00:14:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] drm/xe/kunit: Allow to run tests against custom
 platform
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250829171922.572-1-michal.wajdeczko@intel.com>
 <20250829171922.572-8-michal.wajdeczko@intel.com>
 <gwaifbohn7ocyslucdwns5mlqywlzte74x6ngop3cqilxc6oo5@capvsl2qcxz2>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <gwaifbohn7ocyslucdwns5mlqywlzte74x6ngop3cqilxc6oo5@capvsl2qcxz2>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::11) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|LV3PR11MB8725:EE_
X-MS-Office365-Filtering-Correlation-Id: 290401a1-d4c4-4e26-9c39-08ddeb374b47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?djZiWnQrcEhLT1Y0L1NGYmN0NzE5eXAya0N4SE9MVUJXRWVWTXAxUmppTTdU?=
 =?utf-8?B?R1FpQWk2Z3hHVndkVDA4bTVEcWVnbThpdVcreDFPQU45ckx1Z0ZYZERBTlpB?=
 =?utf-8?B?UkpMV29ucUZxZkMyN2ZuRTdSeHdTSUJuS0M0YzBXV0tpL2ZpOXJPQ3FOSVhG?=
 =?utf-8?B?eG1BajlkT2RMb1VtVGVoS0RXL2FSbmQwSWxONWlWL2N4eGs0L0kwY2dGMTla?=
 =?utf-8?B?L3gzdHkzYmdybGtDck9oSnRuOXBJbjkxMWJnU0lreHRkSlByM1N5bTFDZ2JI?=
 =?utf-8?B?cnBSM09OcGtQRnVWS3RxNE9iTGZXZDQ1dGhZU1V2ZXJCdWhYTVRYRjViYWRU?=
 =?utf-8?B?aGl3ZzBweVlLck9UNEh4NThkMERwREJTN3pQclEwRHRTUFFtZ1VrSmcvcm8v?=
 =?utf-8?B?dGF4V1BrNE4rMDNRdThUQ3h5RloxalpMOWxkaXFxYlZ1bVJxVUhIT2k4cnpK?=
 =?utf-8?B?MFR2c01CWjFNeGtNRkovQ1FxTlp6aTFxelB6dmJNTWhobFJHRGwxNTU3ZzZq?=
 =?utf-8?B?YUMvaHlUZ3djdkNMc09EeUY4WGtNNXBnR21qVjBENGxLTHFHQkRTS21weEtX?=
 =?utf-8?B?U2dMYTc4Q09JZjRXTUVqWXNLOEJTOHc3dFVrK0l1VUI4Vnh6Mzd1ckZEdEVl?=
 =?utf-8?B?K29SN1lNdFowVHhHZDFXVS9ZV1puc1VMUlhodWtyNkpQWGtES0h3RXRBeXlV?=
 =?utf-8?B?dU53OVgrRmg0bFRybTg4U0VaME1BWVFiYk5oUGFJQmFaSWpGODZZUXdDWVhC?=
 =?utf-8?B?aVEyaGcvNjRrL1MrNVZFaFg0dERRSlpzSFp0L3E0UVQwekJQSE82T1JNNmty?=
 =?utf-8?B?d1JLZmRXUSs3WmlQVHE3dzIydjR6OEVwTmQrRjFQVEFVSW10cHcwWXp4QzJK?=
 =?utf-8?B?Z0dRVXNZQXcxWXNqdXRRcTF3RXh3WGo0ZlpHUUtQd1ZyOE5TbS95R0Q2ODdi?=
 =?utf-8?B?MEFiZTdDSXBNOWVZMVZiK3BkQzZicWVNSmFYOUdvekUxUTNXaVdpWHdNelZS?=
 =?utf-8?B?U0ZjY1RoSW9WTHhpZ1dNb3B0eG80eXA3dEp0eDI5NW1yVFh0Vmx1NVBvaXBH?=
 =?utf-8?B?RytXM1RXT0NpbUU2VVpPNHRTdUFHSEZLZ21hS1prZXZYZFRmSHFQRnVzNVRS?=
 =?utf-8?B?a2NEWUhDRDBCbDhnMGJCYWx6VjhwdTFDNGF6WDB4R0tha2pKZm41TWtVY0Zw?=
 =?utf-8?B?ZFJDbjZHQmNOVituMVdlSk4vMzRXUVJweDUyU3I4RGFZNFZCd2VSbitpNzFv?=
 =?utf-8?B?NDE3QndwN3hHMjRzc3hmTE1PWmhTbDhmckRRMTVENm5WeEFaZFdCU0pSS3p3?=
 =?utf-8?B?YndGTjhnaWhEQ1h3M2lIYTYreXFjemN2a1JWbEtxaS80dkIzT3JuNG1LQ096?=
 =?utf-8?B?TWwxc3p5MlVPcWtxeGhJRytlLy9mMHVlZUlsaTRheXVaekRyT1dDeDI2MHpv?=
 =?utf-8?B?N0dkZzk4dktIcGFrNGRtYnJmSlRUaWJTc25uek1kc3lvaGJBaWZEd1lMQzA5?=
 =?utf-8?B?Y0lwYnJTUjZKRlIvZ0tsSm44TkdGZG4wQ3BJeXkrVnk0cjlYK1AvN3hnSHkr?=
 =?utf-8?B?WDV6czkvWlZXWVJMOGRwZm5RUExXUlk2UEg1YTVCU3hLNU5uazJKbkJoYlNQ?=
 =?utf-8?B?czFoT2lSZmVkQ0ZWSkJlNUdNRXZQUGZINzQyTGdxLzFENTRzbTU3cE9HN0VY?=
 =?utf-8?B?cE9RVTR6M1E0Z0NvTHdYQzk4cks4b1JFL1hFSmYzNWZYdTZXSzVoNlZod0du?=
 =?utf-8?B?Z0xFWjFBLzFmck5uY2g5VXdnSTh4V3BFQXpzN2trSnVsVnhYOHJjb1ozaE4v?=
 =?utf-8?B?aXowVW4rYTZFOWlEUVVBUFhudEtqWUUvN25LVDZTa3BYZ1pPZlpNbkhpSUNt?=
 =?utf-8?B?LzVRT2RjRldVY0JLWFlTMEFBRlU3S1RLdllZMlc0YlV4MmJrUzFmVG5pbHQw?=
 =?utf-8?Q?Ha4toWH4VkU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REV2WWg1SVhMSUZaVklFb3Rla2U3SGdiTEw3UjhsWERGdnFZVUF1Q09OUkdp?=
 =?utf-8?B?czJJY2VXMVpSTEhqMHI4NkxyTFJwME9WV3dQYnJ0cDFvbUQ2aFRPSTlwakl2?=
 =?utf-8?B?UWdFYzVBR2RMeTJiTjZlVHZKdXdHckFHUVB5cEl6UUxaU2NqNUJwY0ZCL0ls?=
 =?utf-8?B?UXlwMDJFZTZwQWRGNCtYZGxydFMweEh2cW53REpFNU9zK29VQWNmSjg0WXpy?=
 =?utf-8?B?V0t4V0FjWlZKbzByRTQxSHdtckNNM2tDR1hPRCtmZi9FWWIyK25DTWg4dXlB?=
 =?utf-8?B?VWwyRjhYL3d1aHA2VlA2bGdLN2YyZGd0SUxGYjdZMFVsT1NkMTNDUGc2aHVv?=
 =?utf-8?B?WFZQMisrOVZsbTF5czBNbEtkaDRCWmIyN20wL2U0cTJlbWZnU0JzWCtHdEM5?=
 =?utf-8?B?Y2VkdkFmWVprYVg1R3dDdmV2NkdNait3NDY0Zktadm5XcVRUNjgyeWdSWjNP?=
 =?utf-8?B?MC8xNmcrYWFFUm41OTJnTnAwMVErUGRrWStXSEdiZU1kSTFIMk1YZy83Vyt5?=
 =?utf-8?B?ZHVJSTNkVVJUZE1hcm9CKzRRTUo3eUo3dk05RE5aV2M0cGhiQzlyMGg2VzhI?=
 =?utf-8?B?ai85ZEtmUjJuRk54dUVIanAxRVlPazVTY0lCdDB0YUVOaGdTeElZRkhoU21l?=
 =?utf-8?B?eHB3Rlc5bzk5bmRHZzJZMW5Ja1RuYXc2MzBzKzVhc2RoZ2czY3NzdWlvTnNk?=
 =?utf-8?B?L2ZxZXh2dEQyZitSanVUdjZJWDZkYmhIUDdtOTlMTXFubXRnY0hCWGV4UUpm?=
 =?utf-8?B?Ym4wNGRDb2JkVUpBclppeHVuNENDMUJYaTZQMXRJN0pKNFhRa1hzTk8rTy9F?=
 =?utf-8?B?US9xUCtRWmJndEx0M2FEQ2xuRVpPRHhpbkprWC9CMEZwOHBrbEFnUExBK21H?=
 =?utf-8?B?TEM0bDFMODJoOWhta0lHZU1vam1DVkFLb2ZsSDRObmlmenRQOG13QzlDU2xl?=
 =?utf-8?B?OW1lSjBJUHB0dVRPOEdESHJma21QeisxMHZoM3d1dEIxdlBqQStVTWdsdUdj?=
 =?utf-8?B?SmcweGtWdHEzNXphZ1pPdmhKM3hhVXZpbUZucU1xWkF6ekJwYjVKbUhac2xN?=
 =?utf-8?B?VmhZRk5SbTcxV2JubVJuWkIrc2xpdGFjMFZ2QlAzRW1IazZYZS9WeXR1elRv?=
 =?utf-8?B?UXR6ZzY5aVc5Z2pGODdwYzZSd1d4V1VERU0rL2tZTXgwSzdTUm8wL1JSNkg0?=
 =?utf-8?B?QTU5Qk5lYTdVanBkczBiandHYm94SitqUFVvL3VkbE1LazE0Y2ZQT3pDeisz?=
 =?utf-8?B?bkFsSDh4bHNhN0pJcE9YNEZJbTVCcHh6Zk10N3dPaTA1ZExGL3hnZ0Q4cTdu?=
 =?utf-8?B?aDd5Sm1VVFFadVMrYXViZGtlMElQdWorbG5lNXZKdEdIclZWYTFQUEFUaUZB?=
 =?utf-8?B?dWJWdU0zaEdPeWtmdTAwZE42RVJLZWQyZEd2eFo5bTBta1JWRDcyS3laTHp4?=
 =?utf-8?B?UFE5dVhwZ3piWGhiRkRZSTdjdmgxTU1NK0Y2RmdoTTBaZ1YwVW0vY2E1M3lW?=
 =?utf-8?B?bms0b3JuU0FUOFFlU0MwTjc1VDFsbWdTQVR5OEFjQmJLTHZSZ1Z1OXIxTCt3?=
 =?utf-8?B?ZVIyQ0YrMVBVTXN0UXFMZHloSnhQL01NdnRWYitPREZzbm52QnBMTE4wd3FH?=
 =?utf-8?B?NFF1N3A5VEpuMm9kd0o3UGxDS3kzbGJlbGdpdUtkSmFmZTBvU21sSEpZbGIx?=
 =?utf-8?B?enRNbEVyOVhieUtqTmZaVVA2a21mU29MUVZhUDRab0FzV3NPaG91a2lTbVl2?=
 =?utf-8?B?VUloTGRxTU4ycUJGR3VZNURMcU94Z0xMazcwZStyMDFhMlcvRmZqVzlYditV?=
 =?utf-8?B?RXJxdnF4eTYvOVhVdG90TlhNVzNkU1o2K29JZFlIYU1LSlRqZzZSWDQydnlT?=
 =?utf-8?B?bWVOYW8wSkFoNk9JallTZWZrbnl6N2Z0Ui9BdlFCdmEwajNCZ3pMY0pEZUFN?=
 =?utf-8?B?YWVyUngzamo2czU2YVZEeWhRYnhTZ3BYVEdpSkl5QzZEM2NuNXdBajVic1Fy?=
 =?utf-8?B?V29Oa2tEc2RXUHZNRFFCYnBnQ1d6YlJKYStVam5RWjRNdXhTdnB5ZWlyTXFW?=
 =?utf-8?B?Vjc3aVN4Z0FtS1cydGVGN3d6djE1RElHNVNBUndQYjZCMWdRaFZzYkwrR1dT?=
 =?utf-8?B?azl1WWJRM3djdVVRVHlKTURjVnZIVDJIWlhrd2Vwc0tlaWtBcVEyQ3p2dEJM?=
 =?utf-8?B?UWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 290401a1-d4c4-4e26-9c39-08ddeb374b47
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 22:14:47.7409 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uByZJHLn7TNYZKa/lXeJIZFtyhDk6CSkaWapcj0yeUO7x2IcAlbSysvAPEWF0Q2BxBazhTokj8I6ttZ+inMxSdJ6LgalyRb8EgxfloYgqLk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8725
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



On 9/2/2025 9:34 PM, Lucas De Marchi wrote:
> On Fri, Aug 29, 2025 at 07:19:22PM +0200, Michal Wajdeczko wrote:
>> We might want to run our KUnit tests against not defined yet
>> future platform that differs from the existing ones only by
>> new GDMID versions being used, but otherwise it is similar
>> to existing graphics and media IP.
>>
>> Add kunit-only "dut" modparam where we can specify GMDIDs to
>> be used by param generators:
>>
>>    $ tools/testing/kunit/kunit.py run ... \
>>        --kernel_args=xe.dut=LUNARLAKE:2025:2025 \
> 
> I don't think we should polute the module params for the xe module.

but this extra modparam would be only for CONFIG_DRM_XE_KUNIT_TEST
so the driver is already not in a production quality, do we still care?

> I'd rather have this in xe_test_mod.c and then it may call something
> from xe to set the behavior we want.

I'm afraid this could introduce cross-dependencies, maybe we should
move some code to xe_kunit_helpers.ko ?

until that time, maybe I just push patches 1-6 and try to experiment
with this last one patch separately if this extra modparm bothers you?

> 
> Another option is just not to be a module param and simply inspect the
> kernel command line. It should be fine if this is done from a test
> module rather than the real one.
> 
> Lucas De Marchi
> 
>>        "*xe_[wp][ac]*.*_??"
>>    ...
>>    KTAP version 1
>>    1..2
>>        KTAP version 1
>>        # Subtest: xe_pci
>>        # module: xe_test
>>        1..2
>>            KTAP version 1
>>            # Subtest: check_graphics_ip
>>            ok 1 20.25 Xe2_LPG
>>        ok 1 check_graphics_ip
>>            KTAP version 1
>>            # Subtest: check_media_ip
>>            ok 1 20.25 Xe2_LPM
>>        ok 2 check_media_ip
>>    # xe_pci: pass:2 fail:0 skip:0 total:2
>>    # Totals: pass:2 fail:0 skip:0 total:2
>>    ok 1 xe_pci
>>        KTAP version 1
>>        # Subtest: xe_wa
>>        # module: xe_test
>>        1..1
>>            KTAP version 1
>>            # Subtest: xe_wa_gt
>>            ok 1 LUNARLAKE 20.25(Xe2_LPG) A0 20.25(Xe2_LPM) A0
>>        ok 1 xe_wa_gt
>>    ok 2 xe_wa
>>
>> Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>> drivers/gpu/drm/xe/tests/xe_pci.c | 125 +++++++++++++++++++++++++++++-
>> 1 file changed, 123 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
>> index f19b1a64128b..0ab3f71b0fb7 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
>> @@ -12,6 +12,91 @@
>> #include <kunit/test-bug.h>
>> #include <kunit/visibility.h>
>>
>> +/* defined as arrays to allow reuse param_gens macros */
>> +static struct xe_pci_fake_data dut_pci_data[1];
>> +static struct xe_ip dut_graphics_ip[1];
>> +static struct xe_ip dut_media_ip[1];
>> +
>> +static bool has_custom_dut(void)
>> +{
>> +    return dut_pci_data[0].graphics_verx100;
>> +}
>> +
>> +static enum xe_platform find_platform_by_name(const char *name)
>> +{
>> +    const struct xe_device_desc *desc;
>> +    const struct pci_device_id *ids;
>> +
>> +    for (ids = pciidlist; ids->driver_data; ids++) {
>> +        desc = (const void *)ids->driver_data;
>> +        if (!strcmp(name, desc->platform_name))
>> +            return desc->platform;
>> +    }
>> +    return XE_PLATFORM_UNINITIALIZED;
>> +}
>> +
>> +static const struct xe_ip *find_similar_graphics_ip(unsigned int verx100)
>> +{
>> +    size_t i;
>> +
>> +    for (i = 1; i < ARRAY_SIZE(graphics_ips); i++)
>> +        if (graphics_ips[i].verx100 > verx100)
>> +            break;
>> +    return &graphics_ips[i - 1];
>> +}
>> +
>> +static const struct xe_ip *find_similar_media_ip(unsigned int verx100)
>> +{
>> +    size_t i;
>> +
>> +    for (i = 1; i < ARRAY_SIZE(media_ips); i++)
>> +        if (media_ips[i].verx100 > verx100)
>> +            break;
>> +    return &media_ips[i - 1];
>> +}
>> +
>> +static int dut_param_set(const char *val, const struct kernel_param *kp)
>> +{
>> +    char buf[32], *s = buf, *tok;
>> +    const struct xe_ip *origin;
>> +
>> +    strscpy(buf, val);
>> +    tok = strsep(&s, ":");
>> +    dut_pci_data[0].platform = find_platform_by_name(tok);
>> +    if (dut_pci_data[0].platform < XE_METEORLAKE)
>> +        return -EINVAL;
>> +    tok = strsep(&s, ":");
>> +    if (kstrtouint(tok, 10, &dut_pci_data[0].graphics_verx100))
>> +        return -EINVAL;
>> +    tok = strsep(&s, ":");
>> +    if (kstrtouint(tok, 10, &dut_pci_data[0].media_verx100))
>> +        return -EINVAL;
>> +
>> +    dut_pci_data[0].subplatform = XE_SUBPLATFORM_NONE;
>> +    dut_pci_data[0].step.graphics = STEP_A0;
>> +    dut_pci_data[0].step.media = STEP_A0;
>> +
>> +    origin = find_similar_graphics_ip(dut_pci_data[0].graphics_verx100);
>> +    dut_graphics_ip[0].verx100 = dut_pci_data[0].graphics_verx100;
>> +    dut_graphics_ip[0].name = origin->name;
>> +    dut_graphics_ip[0].desc = origin->desc;
>> +
>> +    origin = find_similar_media_ip(dut_pci_data[0].media_verx100);
>> +    dut_media_ip[0].verx100 = dut_pci_data[0].media_verx100;
>> +    dut_media_ip[0].name = origin->name;
>> +    dut_media_ip[0].desc = origin->desc;
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct kernel_param_ops dut_param_ops = {
>> +    .set = dut_param_set,
>> +};
>> +
>> +module_param_cb(dut, &dut_param_ops, NULL, 0400);
>> +MODULE_PARM_DESC(dut, "Specify fake GMDID platform to be used during tests:\n"
>> +         "dut=<PLATFORM_NAME>:<GRAPHICS_VERx100>:<MEDIA_VERx100>\n");
>> +
>> #define PLATFORM_CASE(platform__, graphics_step__)                    \
>>     {                                        \
>>         .platform = XE_ ## platform__,                        \
>> @@ -64,6 +149,13 @@ static const struct xe_pci_fake_data cases[] = {
>>
>> KUNIT_ARRAY_PARAM(platform, cases, xe_pci_fake_data_desc);
>>
>> +static void xe_pci_fake_data_desc_nc(struct xe_pci_fake_data *param, char *desc)
>> +{
>> +    xe_pci_fake_data_desc(param, desc);
>> +}
>> +
>> +KUNIT_ARRAY_PARAM(dut_platform, dut_pci_data, xe_pci_fake_data_desc_nc);
>> +
>> /**
>>  * xe_pci_fake_data_gen_params - Generate struct xe_pci_fake_data parameters
>>  * @prev: the pointer to the previous parameter to iterate from or NULL
>> @@ -77,6 +169,8 @@ KUNIT_ARRAY_PARAM(platform, cases, xe_pci_fake_data_desc);
>>  */
>> const void *xe_pci_fake_data_gen_params(const void *prev, char *desc)
>> {
>> +    if (has_custom_dut())
>> +        return dut_platform_gen_params(prev, desc);
>>     return platform_gen_params(prev, desc);
>> }
>> EXPORT_SYMBOL_IF_KUNIT(xe_pci_fake_data_gen_params);
>> @@ -152,14 +246,14 @@ static const char *sriov_name(enum xe_sriov_mode mode)
>>
>> static const char *lookup_graphics_name(unsigned int verx100)
>> {
>> -    const struct xe_ip *ip = find_graphics_ip(verx100);
>> +    const struct xe_ip *ip = find_similar_graphics_ip(verx100);
>>
>>     return ip ? ip->name : "";
>> }
>>
>> static const char *lookup_media_name(unsigned int verx100)
>> {
>> -    const struct xe_ip *ip = find_media_ip(verx100);
>> +    const struct xe_ip *ip = find_similar_media_ip(verx100);
>>
>>     return ip ? ip->name : "";
>> }
>> @@ -207,6 +301,14 @@ static void xe_ip_kunit_desc(const struct xe_ip *param, char *desc)
>> KUNIT_ARRAY_PARAM(graphics_ip, graphics_ips, xe_ip_kunit_desc);
>> KUNIT_ARRAY_PARAM(media_ip, media_ips, xe_ip_kunit_desc);
>>
>> +static void xe_ip_kunit_desc_nc(struct xe_ip *param, char *desc)
>> +{
>> +    xe_ip_kunit_desc(param, desc);
>> +}
>> +
>> +KUNIT_ARRAY_PARAM(dut_graphics_ip, dut_graphics_ip, xe_ip_kunit_desc_nc);
>> +KUNIT_ARRAY_PARAM(dut_media_ip, dut_media_ip, xe_ip_kunit_desc_nc);
>> +
>> static void xe_pci_id_kunit_desc(const struct pci_device_id *param, char *desc)
>> {
>>     const struct xe_device_desc *dev_desc =
>> @@ -232,6 +334,8 @@ KUNIT_ARRAY_PARAM(pci_id, pciidlist, xe_pci_id_kunit_desc);
>>  */
>> const void *xe_pci_graphics_ip_gen_param(const void *prev, char *desc)
>> {
>> +    if (has_custom_dut())
>> +        return dut_graphics_ip_gen_params(prev, desc);
>>     return graphics_ip_gen_params(prev, desc);
>> }
>> EXPORT_SYMBOL_IF_KUNIT(xe_pci_graphics_ip_gen_param);
>> @@ -249,6 +353,8 @@ EXPORT_SYMBOL_IF_KUNIT(xe_pci_graphics_ip_gen_param);
>>  */
>> const void *xe_pci_media_ip_gen_param(const void *prev, char *desc)
>> {
>> +    if (has_custom_dut())
>> +        return dut_media_ip_gen_params(prev, desc);
>>     return media_ip_gen_params(prev, desc);
>> }
>> EXPORT_SYMBOL_IF_KUNIT(xe_pci_media_ip_gen_param);
>> @@ -292,6 +398,16 @@ static void fake_xe_info_probe_tile_count(struct xe_device *xe)
>>     /* Nothing to do, just use the statically defined value. */
>> }
>>
>> +static const struct xe_ip *find_dut_graphics_ip(unsigned int verx100)
>> +{
>> +    return dut_graphics_ip[0].verx100 == verx100 ? dut_graphics_ip : NULL;
>> +}
>> +
>> +static const struct xe_ip *find_dut_media_ip(unsigned int verx100)
>> +{
>> +    return dut_media_ip[0].verx100 == verx100 ? dut_media_ip : NULL;
>> +}
>> +
>> int xe_pci_fake_device_init(struct xe_device *xe)
>> {
>>     struct kunit *test = kunit_get_current_test();
>> @@ -332,6 +448,11 @@ int xe_pci_fake_device_init(struct xe_device *xe)
>>     kunit_activate_static_stub(test, xe_info_probe_tile_count,
>>                    fake_xe_info_probe_tile_count);
>>
>> +    if (has_custom_dut()) {
>> +        kunit_activate_static_stub(test, find_graphics_ip, find_dut_graphics_ip);
>> +        kunit_activate_static_stub(test, find_media_ip, find_dut_media_ip);
>> +    }
>> +
>>     xe_info_init_early(xe, desc, subplatform_desc);
>>     xe_info_init(xe, desc);
>>
>> -- 
>> 2.47.1
>>

