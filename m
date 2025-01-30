Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22366C0218A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 06:33:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E1410E8F4;
	Thu, 30 Jan 2025 06:33:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YNlQGj22";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 705B110E013
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 06:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738218810; x=1769754810;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qwbQGwabjToS63LeO3J03+tINl/uBuJtt9HK51yXB/M=;
 b=YNlQGj22oTYErngDJz84tRWcCA3Y4WI/AvCENKyV6+koYOdRJQZyPGVe
 Yn2G51lUFrjYnigo+WY6IuekrrrWnkXDDks05dQNAzCX+RlQoIHU2Ov7W
 Sy5XsJ/iNlwUI9JflC5YOj21LjuVvn+cM1E907J44WMHRvLlQZ2Tj3xsj
 8XFi1PwEnwjtzLEluMSSGn+DU171xNLfCav+ywMPFb3RN54ObKAQeAZH2
 8PpVEbp1Awf2wpvryR/Sq202BcdBogo5OQl/6U43JillUXwV+pResTELu
 6OvCz2qDmunyRJVALoJ7ULWwNZiWdk99KwEEcAza9Tm3dM1uIbbQrGLyJ g==;
X-CSE-ConnectionGUID: Ct9bRhrlR4mEeLx2SatJ+Q==
X-CSE-MsgGUID: Qu5vhtx9Q4WaoBD5vwueHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="37956461"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="37956461"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 22:33:29 -0800
X-CSE-ConnectionGUID: fkImVKqoSm62ckMg1/+T/Q==
X-CSE-MsgGUID: JkLJT+zUS6aHpqIbgtskMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114392929"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2025 22:33:28 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 29 Jan 2025 22:33:28 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 29 Jan 2025 22:33:28 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 29 Jan 2025 22:33:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OXkxGo/p3Kuzwu0i14oYz0m86rbybRZwSR2BUnhYIQtPPTgxJTomjpQ368tJsVdjOkWp5CGfxUK/08QDdEaQQ/8lxAu9z4uc5feuo6ZEy7jwxZxZ1VguJGL6dhfNANSeoxV+Vne3j7OypuGIA/BUWlwXvbSyXoIQ6Ll4MW9M72Z7tzc1rOWSQG8elbtFBi3eoBLO5jgDFO24wTVGkHT0Sk01FhehXzlPum9P2fYB3RJ69f/1CYytloz41rIfriY1jlxjn4rMYivJuZ44teKZQU7VEw0wuJhF4LKd3MCdvvSaxFbHIT8lLVC+A7Ka9K+p4NYWUIkwreeUDtOGnAC7Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yrdsBcFkASujqPlaX0XzE2B0uFaLqIMb55XgMti6u7U=;
 b=gCkjzkshYpZpIJYVL6rjEYugyEijtQMmGehlbqQLs46F+hvxwUnSCxdGtcdnDXjhg+jZ8YhzcqU+F+cCNgzvYTTmcWmPlxy2KhlCZTG3gfJw6Yvq0qnTBNX6NB3B1kko6Nssur3LLTlGxSay0fFNxiXJgf84c0gmWJMXB8fBtAly0hF1Qd6/Adq9s6PBNDps9sOw1mSxHrtOu4hUJwWr1T+FxAoZPuia/9TJ3144x+PMeIpOwk1BpgLqiS+X+yfONiJKSQV4PA2g4OO6ZwtSsGj/wZvZdHYK3pA3K1NmlxWwklcTJ4F9F//IU07lRRVlDDYvSFghgeIjjUUzmkQe6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA0PR11MB7379.namprd11.prod.outlook.com (2603:10b6:208:431::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.18; Thu, 30 Jan 2025 06:33:06 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8377.021; Thu, 30 Jan 2025
 06:33:06 +0000
Message-ID: <df142c48-704b-4b79-9e65-61937a4cce40@intel.com>
Date: Thu, 30 Jan 2025 12:02:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] drm/xe: Enable Boot Survivability mode
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
References: <20250128095632.1294722-1-riana.tauro@intel.com>
 <20250128095632.1294722-3-riana.tauro@intel.com>
 <LV3PR11MB8695E4F9F25BC4D3E1638459F9EE2@LV3PR11MB8695.namprd11.prod.outlook.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <LV3PR11MB8695E4F9F25BC4D3E1638459F9EE2@LV3PR11MB8695.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0108.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::12) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA0PR11MB7379:EE_
X-MS-Office365-Filtering-Correlation-Id: e37b61c6-16c0-467b-9c4d-08dd40f7f464
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dEZiN2dmdzFuQmVqRktpTVR5MTdqbGNtNGRqb2ZGbGtuUktPenlMN3R4Ujk4?=
 =?utf-8?B?cUFKNGpuM0VoMXZJeWZzSm8wcjkvc3lBUm85WUx0UTBwcjhQTlFsU01IaktY?=
 =?utf-8?B?MlVlNnJKU1hzL2hqR2xEeERCa1lQOGJUdjhkMytLWjYvRllLWXZsalR4V0hw?=
 =?utf-8?B?NVpSMjBlaVNyT0p1RVdaYnFZTWNFblhGNW1HRlpLeTZjMzZuZkpOQTFxNEpT?=
 =?utf-8?B?YldQWlRjRE9XMlNqTkYxamxsQWlwNnRPV1BidjVtYytRUGRIaFgxRlZkSGhD?=
 =?utf-8?B?YVZJSXBLVythMzFZNmpsWGFTdWtRUnpPU0VUYWt1L1VwSDdSanVyM3lLSU1G?=
 =?utf-8?B?NVh3dktIdyt1dU93TWhVaysvTXowM1B0RnlNY2RiVXZrN1d6V0VMdWVidFZh?=
 =?utf-8?B?MTlFYmNPeTNNNXBsa0d4bVhUWnpLbER4WDFiNmZrRUErdVNkNVBQeHE2VWFG?=
 =?utf-8?B?V1c0L3p3WEhSMm0zYTA4SUpBaEVYNlU2R045Y2lUWlZBQ2hpdmF0N1M1ZkxD?=
 =?utf-8?B?U01hb2tpTytDVUFaK214dGppS0RjTGxXRTVNbjJIbk9nUFdKbWZLd0NyNUJG?=
 =?utf-8?B?NHVaZWRCMHZ2bjVTczJmQkxzamdOZUdSdFVSeWZxSTBnUUZIZTRKbUtxdnp4?=
 =?utf-8?B?YXFFOHVkK0d4WGIzSnFVTGlQbUJMSnZvajF3TzhNeTRXdU94VGN6czJUaTVY?=
 =?utf-8?B?VFBnL1J5aTZiSFdLMUN5NjdjS2J2SHlIdzkzM1lGSTBSMU9IQ2VHUTAyZExY?=
 =?utf-8?B?Z3RKN3ZUUFR2bVJBSGN5SzBpZVh2Sy9IQ3djZDhyZjNrVzRsYXRKSXJNMDVS?=
 =?utf-8?B?Y2JXdE5QZ3AvTVpRSVQva3MzS0Z1ekhSVytKdVRZYVZVWmZ1R1pYeFBJZWFI?=
 =?utf-8?B?ZlhaN2lWNkdTUUpJUzNMQ1pLVy9uVW1EQXZEWEFlNEtiZUFMd2czczFZREti?=
 =?utf-8?B?SWlxYmJIU3hIWlhROFl0eVI4dFJqbjZXdXBRTkVWbDFKZjRZRnR6cmJVcXpy?=
 =?utf-8?B?VmVXT0dFWUVVeHhJdVpWMEZxdWpkMkcyTXZjUmxrMlFzZUl5UFc5S3JCNUkx?=
 =?utf-8?B?WVQyZ3ZoMDJyRE5YN0FVcVdRVnF0YzRoSXcxQ3ZCNGtiZ1FLN1BVQUlkeU9m?=
 =?utf-8?B?OFVHeW5Sc3l3MnhneUNXUjBIRi9hS2RBRENZWHJxN3BwejBTS2FCaU80NE1E?=
 =?utf-8?B?WVBFcEJYUVdUOU9KSlJPb2hnT3MrNDdzOHVjbEZBOUFQTDVqbHJBZCtxVmFw?=
 =?utf-8?B?ZWJkU21SREcyd2xMc1lEdm5lT01EMjlGUWlGZnlSSnY4dENQdnJaVmoreCtN?=
 =?utf-8?B?UFJ3UVZBZDJyVC84T0dTVFloeTBJZDFCMzJJZmU3dzhnZGtOVG5lSW9kQ2Fv?=
 =?utf-8?B?emhsU3pQMlRVdDNEL2Y0RDZKSmFjRng1MUc5L1JqMmVqbFE3UEhDemlqekhT?=
 =?utf-8?B?OEFjbzlPWDUrM1JWNENRZnhiOTVNMmE0VnB2NTBQVVZST05LbEhUR2lxMFRG?=
 =?utf-8?B?dWVpbUVRVWs5LzgwSXY3NEVFMktkN0ZWWjU4QU0wdDd5UlVmRVBIdDMzRXVz?=
 =?utf-8?B?OFA3cFhXd2ROMTZlU2M2Z2psY09saHJDcXlqenFHR28vNkp3ZFJrenJEQVBk?=
 =?utf-8?B?YXpFdTZxa2FvNS9ST2ZLS21LZFpHN1c2aWpyclZZT0ljMXY4SGdwVStJem1F?=
 =?utf-8?B?UTQxL3I4TUFWZ2pPWEJlL2xGRVZtSGNBdkhnTFY2bUlPeHZTRjYwN3JiNlVk?=
 =?utf-8?B?Q2NJNTYyaFRDQXFyK1dkSVVkaXBGNG54TFd3aTB1OVNLT2QyOURXcEMxL0Nq?=
 =?utf-8?B?MVlVeWxOTW5heHRPRngxT0dDOEp1V2FKZkJodWxyeERYTEk4ZHVBSnZnSWVR?=
 =?utf-8?Q?wfUPXQ+Id5m+W?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEloZk03SkppUUtPTStGZkVKbVhBbzFWZWhBWW1Hb2drQ2xDY0xUejFiVWhp?=
 =?utf-8?B?TEgzUEdOaFR2NjdibXBmb0YrVWIweEtnMkhWOVVQbXVjSk9lY1h1ZGRJOWk0?=
 =?utf-8?B?RGlIVDdZbDZlK0JhU3V6NDk2bTlBd0JPRzBrQndwWXp4TmQ4YWNMc09aTmo3?=
 =?utf-8?B?OWwvM3V0ckZvZEQ0WitjL3lHSXhDcFBYUWJ0SjBXanRDOUkvV0JOSVZxR083?=
 =?utf-8?B?eURnVDBsM0tjdkxuaDJLV2FtRlVJVHF6OHl0YWdoYUszSEN1U0VlYVZlc0hk?=
 =?utf-8?B?Yko4RnlBcnRnS3l3S0tzR1lFelUrMUNtbjdKU2ZibFYrdTkwLzZXeDV5SFJl?=
 =?utf-8?B?TkxlTGpvMzJLT1RxNU4yMWc5Tm1KeStMQ0k0NFV3WVh6K1dyOTVIRCtnQzdG?=
 =?utf-8?B?M3hIOTFZak9hRkRGZzdQTGNCSFlqTDIrdDhSd0Rrd1ZhNFdSZjNORy91aU5z?=
 =?utf-8?B?VndiSXBQemorcG9nT25KTk1wTnJzV0F6T2dTM3Z5eDF1bzBBV2RZbjE2V2x3?=
 =?utf-8?B?ZGZxSTYzK3BqNTNGQWh3SHJjU295MG80NEdYYU9yS0dObHBpK3QxZVU5Q2xH?=
 =?utf-8?B?Y3RZdm80cUhWbGNYNlJKSVZLbHpwb0dGMk96T2l1LzlMUUV2L3Zzbmx6RnNw?=
 =?utf-8?B?Z2RPcFdlTUcxWWFMb1IzNHdieTc4UVpJbjdDUXh6MzZUbGg3TlNKdUw2c2RO?=
 =?utf-8?B?Z3ZNVXpuRHozdEN2OCt3V2pBR1VkVWIyYkVySC9lL3kzTzRiaVIzT1JZVjRr?=
 =?utf-8?B?ampsZmltaEZ3dVp3bnVLTVFFdS82R1hlbWNlc1ZCOXRjb1A0VzhJTDhkQjdQ?=
 =?utf-8?B?dFdYSm5raFpWNmpWaFpXYlp3WmtMTGhaMGtBUXBMVjRWRngyUGEzd3J1Tm4z?=
 =?utf-8?B?UjdFUkt3WGNtUmsxc2ZqZGRQcHJvaDZXMU1qNlBKK3pNSy9PV0VYSWRhbkVI?=
 =?utf-8?B?TDlHTklxbG1VeXU0OGIvaElQMzM5YUN0amUwOExhajY3Y3N5Zm4rK3RwUHRZ?=
 =?utf-8?B?UzRTejNVWVhzTzI5QTh2RUM2OXg5V0lsSHk5cmJLbmhKeHM2T0N6eVVSUnYy?=
 =?utf-8?B?QTlkTWR3QVBDM1FKWC9kQ0FwS2FGYWtKSmZFZmFONVB0VUhhRWIxOUVjcit2?=
 =?utf-8?B?ZlV6NmFpTGpOUTQrY3FCRFhCQjlraDA2czNBZUgzNjlSYVV4NjIzWk1pMFM1?=
 =?utf-8?B?WE1ZN2thY2ZpdmhYZkNzVTlsdXlRd0VDQjVySjhQSG1yRXp2cEdIOVREK1Bj?=
 =?utf-8?B?V0cxeExpS1o4eDhXNDh4VzI4dkFrTFVaNS9tSEZZUTBXL3QwdUQ5RWYyM0hC?=
 =?utf-8?B?b2l3aFRvTjlLQXF5ZkFad1B0b2g3cld1ck9tVEgrVEY4L2pSMjNLV2VLcTJV?=
 =?utf-8?B?R1lUcXdSUVlSN2d0TzJqWkc2bndTSjlQOU8rRlJZWlNTNGppTFZGdmNZQ3A3?=
 =?utf-8?B?K0NCWlF6V0hhYnlNNitNT1Erb254ditVQVdnNklVcTF2enkxUnZLYThGNHVY?=
 =?utf-8?B?OUI3TnZvdW4ydjZxUEZjaHJEMHI4bWxvQ2ZWczFZL2hpdFo3YWg0T0dRVXFx?=
 =?utf-8?B?QTJoK2hjMTRBNTB5V0FBbTREd0FRSDVxU1NIVzdDKzJoRmNOcDVuYjl4ZVg1?=
 =?utf-8?B?bndkNmM3cUNwb2NGWGN1cWVqbXRSK0Z2ZXpwM0UzOVhFaG5pbURmM2xkcm52?=
 =?utf-8?B?a2x5S3ZXUDQxV0YreXlOV0JkTjRtRmZ4UVJRVERDNXg1b1Z5bkpOdVlJaW5h?=
 =?utf-8?B?SVB1eUh0VklNNmJIQ2tKMTNKZ253OFJLdUFwSFA2V0RUb0NtNHBsOE9XVlB5?=
 =?utf-8?B?Rm5ZZStBRzNDUnV4M1Btajk1MWw3WnJGY1llUWEvM2V4dHBYREpUdWVsUVVR?=
 =?utf-8?B?TzkwUEp2UzlBdm5FTVZuZ3J2dFdtY1NPTDFnYmJmV0x4UVpqRjA1empDb1BV?=
 =?utf-8?B?byszK3I1ZFRiNWt2cFl2b3lYRzM0QVZOcExwa1lPNDBpZjRQb0s5UnZESE5B?=
 =?utf-8?B?UTVNWjRPMUl2OXhxbUJZR0toaVRWVEtUM3BKdm5HQVpITlgrSUZEWkorZ2wy?=
 =?utf-8?B?TFNFWGFabzRDOWJqQjk2TEthYjdYM1VycjlRUjV6THUwMlFaV0RIZ1UrR2Ra?=
 =?utf-8?Q?1uzhXZ4rD69uyWDLLS/J0/pIb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e37b61c6-16c0-467b-9c4d-08dd40f7f464
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 06:33:06.1127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DlHrjyKpRTNq9hZ1ya4bdnPoZD2vJdM8qio7RBGIJOQXUDKH/po2/qImtYNiY7NaA70npQN9se9P3rZI9WP+5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7379
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

Hi Satyanarayana

Thanks for the review comments

On 1/29/2025 12:57 PM, K V P, Satyanarayana wrote:
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Riana
>> Tauro
>> Sent: Tuesday, January 28, 2025 3:27 PM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
>> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
>> Subject: [PATCH v6 2/3] drm/xe: Enable Boot Survivability mode
>>
>> Enable boot survivability mode if pcode initialization fails and
>> if boot status indicates a failure. In this mode, drm card is not
>> exposed and driver probe returns success after loading the bare minimum
>> to allow firmware to be flashed via mei.
>>
>> v2: abstract survivability mode variable
>>      add BMG check inside function (Jani, Rodrigo)
>>
>> v3: return -EBUSY during system suspend (Anshuman)
>>      check survivability mode in pci probe only
>>      on error
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device.c             |  7 ++++++-
>>   drivers/gpu/drm/xe/xe_pci.c                | 23 ++++++++++++++++++++--
>>   drivers/gpu/drm/xe/xe_survivability_mode.c | 16 +++++++++++++++
>>   drivers/gpu/drm/xe/xe_survivability_mode.h |  1 +
>>   4 files changed, 44 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index f3f754beb812..8fedc72e9db4 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -52,6 +52,7 @@
>>   #include "xe_pmu.h"
>>   #include "xe_query.h"
>>   #include "xe_sriov.h"
>> +#include "xe_survivability_mode.h"
>>   #include "xe_tile.h"
>>   #include "xe_ttm_stolen_mgr.h"
>>   #include "xe_ttm_sys_mgr.h"
>> @@ -693,8 +694,12 @@ int xe_device_probe_early(struct xe_device *xe)
>>   	update_device_info(xe);
>>
>>   	err = xe_pcode_probe_early(xe);
>> -	if (err)
>> +	if (err) {
>> +		if (xe_survivability_mode_required(xe))
>> +			xe_survivability_mode_init(xe);
>> +
>>   		return err;
>> +	}
>>
>>   	err = wait_for_lmem_ready(xe);
>>   	if (err)
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index e6ad189294c1..b483c5c90132 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -30,6 +30,7 @@
>>   #include "xe_pm.h"
>>   #include "xe_sriov.h"
>>   #include "xe_step.h"
>> +#include "xe_survivability_mode.h"
>>   #include "xe_tile.h"
>>
>>   enum toggle_d3cold {
>> @@ -766,6 +767,9 @@ static void xe_pci_remove(struct pci_dev *pdev)
>>   	if (IS_SRIOV_PF(xe))
>>   		xe_pci_sriov_configure(pdev, 0);
>>
>> +	if (xe_survivability_mode_enabled(xe))
>> +		return xe_survivability_mode_remove(xe);
>> +
>>   	xe_device_remove(xe);
>>   	xe_pm_runtime_fini(xe);
>>   	pci_set_drvdata(pdev, NULL);
>> @@ -838,8 +842,19 @@ static int xe_pci_probe(struct pci_dev *pdev, const
>> struct pci_device_id *ent)
>>   		return err;
>>
>>   	err = xe_device_probe_early(xe);
>> -	if (err)
>> +
>> +	/*
>> +	 * In Boot Survivability mode, no drm card is exposed
>> +	 * and driver is loaded with bare minimum to allow
>> +	 * for firmware to be flashed through mei. Return
>> +	 * success if survivability mode is enabled.
>> +	 */
>> +	if (err) {
>> +		if (xe_survivability_mode_enabled(xe))
>> +			return 0;
>> +
>>   		return err;
>> +	}
>>
>>   	err = xe_info_init(xe, desc->graphics, desc->media);
>>   	if (err)
>> @@ -926,9 +941,13 @@ static void d3cold_toggle(struct pci_dev *pdev,
>> enum toggle_d3cold toggle)
>>   static int xe_pci_suspend(struct device *dev)
>>   {
>>   	struct pci_dev *pdev = to_pci_dev(dev);
>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>>   	int err;
>>
>> -	err = xe_pm_suspend(pdev_to_xe_device(pdev));
>> +	if (xe_survivability_mode_enabled(xe))
>> +		return -EBUSY;
>> +
>> +	err = xe_pm_suspend(xe);
>>   	if (err)
>>   		return err;
>>
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c
>> b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> index 9911e9f6b99b..633f5effa349 100644
>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> @@ -144,6 +144,19 @@ static void enable_survivability_mode(struct pci_dev
>> *pdev)
>>   	}
>>   }
>>
>> +/**
>> + * xe_survivability_mode_enabled - check if survivability mode is enabled
>> + * @xe: xe device instance
>> + *
>> + * Returns true if in survivability mode, false otherwise
>> + */
>> +bool xe_survivability_mode_enabled(struct xe_device *xe)
>> +{
>> +	struct xe_survivability *survivability = &xe->survivability;
>> +
>> +	return survivability->mode;
>> +}
>> +
>>   /**
>>    * xe_survivability_mode_required - checks if survivability mode is required
>>    * @xe: xe device instance
>> @@ -158,6 +171,9 @@ bool xe_survivability_mode_required(struct
>> xe_device *xe)
>>   	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>>   	u32 data;
>>
>> +	if (!IS_DGFX(xe) || xe->info.platform < XE_BATTLEMAGE)
>> +		return false;
>> +
> 
> The survivability mode is not needed in case VF. Make sure to return false in case of VF as well.
> if (!IS_DGFX(xe) || xe->info.platform < XE_BATTLEMAGE || IS_SRIOV_VF(xe))
> 	return false;

As discussed offline, survivability mode is set only when pcode 
initialization fails. So if it fails for PF, it will not continue with 
sriov_init.

Thanks
Riana
> 
>>   	data = xe_mmio_read32(mmio, PCODE_SCRATCH(0));
>>   	survivability->boot_status = REG_FIELD_GET(BOOT_STATUS, data);
>>
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h
>> b/drivers/gpu/drm/xe/xe_survivability_mode.h
>> index 410e3ee5f5d1..f530507a22c6 100644
>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.h
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.h
>> @@ -12,6 +12,7 @@ struct xe_device;
>>
>>   void xe_survivability_mode_init(struct xe_device *xe);
>>   void xe_survivability_mode_remove(struct xe_device *xe);
>> +bool xe_survivability_mode_enabled(struct xe_device *xe);
>>   bool xe_survivability_mode_required(struct xe_device *xe);
>>
>>   #endif /* _XE_SURVIVABILITY_MODE_H_ */
>> --
>> 2.47.1
> 

