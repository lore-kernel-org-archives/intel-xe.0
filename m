Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A89D5C02193
	for <intel-xe@archiver.kernel.org>; Wed,  5 Feb 2025 01:31:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B0F210E023;
	Wed,  5 Feb 2025 01:31:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MlCEvsgY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A72D310E023
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Feb 2025 01:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738719061; x=1770255061;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=WEutmQgzfhvgwS09dinDoFkL0SQT62Wpa3yTEStq208=;
 b=MlCEvsgYcO7mJ/KPzi/HyDiiDRICYmblEobE4UPkQ1pJQGuZ0a3znmXv
 IrVQ3BcT3Cu/lmUb9M2iJsH4XEHoPKsBPfIkqIaxVRRxNnCaNXkeTN4Mw
 vUcZPREOWUiG7zLC0yaJ00fX6aJ797dojju9/UnUzwHaykADdemcfYn/a
 6fvlFz06FkXQBted/zKveNJ0QTilITW6rglK/pIpzon59HefKV+K+ojRW
 ey6dKmhiuw6zedN1mn6s7RH0xNepL38fR3T882KNiSRPdJMSbfI7n9Yxk
 Ua7f/l/+s8gFTC0KR5UwVB+P5CpwmJMhgg/UNJQd8tzIyrPsbrRTx4m3O Q==;
X-CSE-ConnectionGUID: geVrhkUqQZ6S0sqJUrjqwA==
X-CSE-MsgGUID: Ce713yZKRcCNXyybRnf//w==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38502913"
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; d="scan'208";a="38502913"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 17:31:00 -0800
X-CSE-ConnectionGUID: 33nxaCp1SaOcR+Io/U0KeQ==
X-CSE-MsgGUID: gSQSmR17ROGnrt+hkg1jOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; d="scan'208";a="110541679"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Feb 2025 17:31:00 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Feb 2025 17:30:59 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Feb 2025 17:30:59 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Feb 2025 17:30:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KVcl8aMr+3KnJKjn96xKeHoaalKK5mDKghZUllTQdlLqT3IGANmEth32ZpjDLbk70Hn7Uwq/+VmCyhx60fVat46WcXvVb+Nybh8j3zry5o/c1AYpyEMmPrtYURghttt8laKbSqyD9hDWeW0W4AoOMWEEgZdWmZIkM6c9kbkXWGQ7EwCgGDakDHVH1ftRuI31v0BN3g6xH1sPm1srvpspvcJUc8U3+HNFjag26XyBDIu0iNkPhYZxxHWBOQJ3LZjigtpZIEvg/bFqmKnOGOTri2trLGgQgpWuPavBkWErxLI04DkrDHPNp5rjDEGNUyJq+k2hUHIN5J9neWZ64TkbkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2840IJ6FrI+OTGH+JnDO/B22ZbZYprYun9gq+Fuqd7c=;
 b=FsI40Vpt+cI/2EU+c1W91VLvAWIeKBvZAor+bAuYjfiW7ewdNFDFasqB4w3+kaWqlc1bBN9n0vVgFbDGfuf9CcCZyVFdGre/DNYGOPgHPJsiv3kW7xyrIl9TlWFA6VFzhVIN0MjTKXFPVN3tzlSwpdj/6PHtnFmGO3WIw00dd5KX3eMfDps15sCvG9mrYXkgtrK7pHycHUtP7al40+xvY8Brx1SQRUPh7tIH5hqdefAz9ekYNmXiLVTKSJZK+C7p91vaQsdESc+S9Pr+qSJ5FGTG2e58+tJEsEXyZR4Gv+3eY9G2jTmC9QiuW2tfklD6LUmhFZRPaZej8P+6AHSWBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH0PR11MB7521.namprd11.prod.outlook.com (2603:10b6:510:283::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Wed, 5 Feb
 2025 01:30:57 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 01:30:57 +0000
Date: Tue, 4 Feb 2025 17:30:55 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v4 6/8] drm/xe: Add support for per-function engine
 activity
Message-ID: <Z6K/T6Gju5pWK9SU@orsosgc001>
References: <20250129101653.1976699-1-riana.tauro@intel.com>
 <20250129101653.1976699-7-riana.tauro@intel.com>
 <Z51iK9NZ6YDi4YTb@orsosgc001>
 <df3dc547-8740-45f2-85bb-2c6e889440b0@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <df3dc547-8740-45f2-85bb-2c6e889440b0@intel.com>
X-ClientProxiedBy: MW4PR04CA0311.namprd04.prod.outlook.com
 (2603:10b6:303:82::16) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH0PR11MB7521:EE_
X-MS-Office365-Filtering-Correlation-Id: fb0e6224-2150-4f87-e17b-08dd4584bd53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V1YrQktjQURvUzh6c0ZUTlNLS0oxemZmdDR5cjZGamlyeSt3aU5OcjBIWFZt?=
 =?utf-8?B?WU9ZdFBxMkc2djlKbGU4SUw5eGJDT0dSRWMrR0R0NVdxNU5sTTdjbVQ3SW1H?=
 =?utf-8?B?enMxSEVxSWlJOGh4NE5QOGsxVmdmN1I0ZUdSczNTY2NSMjVrenJseGxoZDkv?=
 =?utf-8?B?eTV3N3ozeHU4L1QvQ0J4dk1Td0NVcFVSM0xjREdqdzE3Z1hpdkFrQTdiQkxX?=
 =?utf-8?B?ZmpyS09TTFZ6Sm8xRlJGSTNhZFZjc3BoN25QUVp6eGRrK1pzV3dQOUVMUU9p?=
 =?utf-8?B?NTJybS9sK0prVW0zR1dMZ1dYRi9yekxvZklRK3cvZmhJOTRyZjNWeVA0dEVS?=
 =?utf-8?B?N2NoQ2lienpDaVFEVU5jaEVKYm9ZbGE1K3ZWOWdIWDVYSjFuUVlkQ2Z1ZExp?=
 =?utf-8?B?SVlLL0g1OEQ0WjlabmZXQnlPdXZmOW4yQ2VKNm1PMjZkamJmdDZ6UytTK2I0?=
 =?utf-8?B?cnphdmdtMXI4Tk85Rm5qZnE1UGVibG50bE1wTWFJaGZHMmNpdzBBY3EzNURx?=
 =?utf-8?B?NVhubGdwNUdTQ09JTmpoQS81VTRZRmdKSEdkbHIrdGh2bEllM3BGVVkvSUZ4?=
 =?utf-8?B?c2RYUVdBWTVrLzRnNXZvOWluV0p1RE5oK2RqQlNjZkVEMFJwbEYxTGdiUzAr?=
 =?utf-8?B?c2htbGxEb1B0STVTaW1uOWQ4ZTZldTk2YnI2U1pJTUtFT0NBdDlLdyswUTRZ?=
 =?utf-8?B?a3hybFVZZkwxZkljMC9VNW1yeG1GeFFoU2VSaWMxZUJrdWNIbEQwVEJOMG9S?=
 =?utf-8?B?aU5xRnJpM3R0aFdDcXpLODlCU2FBNlJNZkJiRjVSSHdUdWIxSTh4ODBDNDND?=
 =?utf-8?B?ZHlrbG5lMnQxa1FLcXVKZ095ZEdOdEJpOERWUzlDWXBkdjlldVNzYzZKbUV1?=
 =?utf-8?B?a0kyNEFxaTFvaEFKRlZGTVZ4VXBoQWU0aU52SzUwSUVZZ3haU0Z2WEpDbzhx?=
 =?utf-8?B?NjAvVm9HYVptQ2QyQktMOWVqbTlPN3NqUk9DOFJsRkYwMDJJbE5yb2FSWHlN?=
 =?utf-8?B?SmNrUjJHUmdUc0xUTEh4NCtIRENMRy9TVEZtclpiZzVhQmFRZjZzMjZiZXdP?=
 =?utf-8?B?L1lOaGN6RGlGdXF5czNQNHEvSHl2cVVCMDlITndSRXhwdHNOUXdUaE1vMXFy?=
 =?utf-8?B?dVh2cFlXdEhJVUh0b1I5cEdLUGRBeno4UlZDeXpRdDh5a3p4ZnUrOUdqVitT?=
 =?utf-8?B?NDEyNjFlbldQeVZBWnNmNE8vWklSL29XU21HT250d2JTZzMxeldkVWExUkNO?=
 =?utf-8?B?aUpwVjRsaHl4S2lxS2tyNzJKTFM4NXR4R3krM3RTU0RhN00zZnRzMlBmNlFP?=
 =?utf-8?B?SHMydFhHaTJhYXdoVHExTE1WbTNhWUxueHRHbG1yYktVc0JzRmJ3czNRdVpw?=
 =?utf-8?B?dkF4QXQxeEtTS2c0d2llZnE1TW94UFduODVDYkpSeXcvSVNlMmdyM2RCMTVI?=
 =?utf-8?B?UVc4dmtyV0tKem04MG1OM0IrNjVmT3hvdWtTWlZxVTlLSG8xVXlaV2srWlIr?=
 =?utf-8?B?aVQ1bEFTQmU1RFlsRXdGUlduNUVKSlZ6b0dSR0VFNXJjWGNnRXNaT3E0a1M4?=
 =?utf-8?B?bmpwZXRBNVBNSlRNZ05kUXNyeHFzanBKQlRmdjJUbjFzdlNUQXJCQjlvSzJM?=
 =?utf-8?B?a3BySHdWNStiaDM0OCtTS1krK1VEZFNKWnRBRlZkMVNVdVlxR0xYWWNBZHFB?=
 =?utf-8?B?YWNJWS9YcFY5T1RsVXdESk9sSCtvRGtlZFJxNkJCSEl1QTcrMVRlSzQwSU1C?=
 =?utf-8?B?VDZOVTJRUVc1YWpaeFNsWktXeHY5cnVaVWhjMjBkeklJRlF4cC9WU3JBbGRx?=
 =?utf-8?B?SmV6c285aUdVVDAwUDlBZ3NWT0Q1ZnJRYUNLWFQwWmFTaFRRbzhGaUlWMzl4?=
 =?utf-8?Q?WislnV9NLdpZ/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzdvcHUzaVp2Zno1NGNUajQwWnlpUmFjbkY4YXBMT2VlakJ3TGpad1Aycitl?=
 =?utf-8?B?TG5mNkZxeEhvUmhQR0N6T0Q5dm45L3FSWkJEMTVzeEJpY1JaZ095d2NBUVpn?=
 =?utf-8?B?RFJDalZIR3lTdzlRSjFvc2tia0Fxc0NLOUtNL1BJc1MwcHRqd3Fmd243d3d5?=
 =?utf-8?B?b0gzcWRDUndSckNGWnNJMUdPdFlqQ1d4NENONC9uUEd6OXhUNTM3RUkyS2hO?=
 =?utf-8?B?T2w0ZWFRRjZObmNSeDdudEVVSjFSZVJCZ1l6TmhSOTJQcDdlKzdtVE5BMW82?=
 =?utf-8?B?M3NSV0psTTdINUcyWHdURjR0ZzJnWWp2d2JvVHZaT0I5NHBzdEN0UksvSUxX?=
 =?utf-8?B?V3hIdkYxKzM1UVpyemQwMXNVS3NJNzMwYTdBbWRxOFpadkpJSUJBY0xJL05B?=
 =?utf-8?B?NlJNcnBQU25wNlUwOHBYOXdzdUQzcy9JS3EzSUdCWVI1TDlRSXlmZkxtUUMy?=
 =?utf-8?B?UjAwTEhheUltRzdIY0hXT0daOGppZUo4V0FMSGRIaEt4ZnV6eUVTMnN5Rnlt?=
 =?utf-8?B?cDJuRVhOMmk5SlIyd2RnOVNVM292amc3ZlN2cXJoeWJ4MXkrMFRQT1BUNHFU?=
 =?utf-8?B?WCtlcWdQYUdQTVEyMXVEWWhYd0FBS2VrVm14cEhGQks0SExzcEw5Rnl0TFRl?=
 =?utf-8?B?dk1wbmFnQ0cyeVhhMlMxRWdpOFdWUXJxTGJQcTdmU1BLMTVkWWFEZThwb2k2?=
 =?utf-8?B?S0lmV2tlM1g1SGgrdXVSWGRUdGNCRnN6VDV1UzdZdkhCbkVFWVNMenFjWkp1?=
 =?utf-8?B?dW1qS2hWTmpnZ1lqQTYyRXNPR0E3UVdPKyttZnJ4T09vd05pTmptVUVYSmQr?=
 =?utf-8?B?SzNxM0ZBTHNwQmJHTGhwRUNiSXlna3NteFNpM3BsYXdjTW1jRytMcGZic2Fm?=
 =?utf-8?B?RTkySjRpM21UR3pYQWQ1bHNmQVVKMzhzRFhwblpKaWJVV0RYdHl5dW9pU2t0?=
 =?utf-8?B?anRuQUFSZkozbXJNNnhVQ3BEbDd1dkRQVUExbzlXMGlkS1pCV3Y2alRubEJX?=
 =?utf-8?B?ajAvTzUxdHBkUy9ubk5tU1FtcDZHdk04OFdKcXhvbGdybVpMZFBuMGgwRFdn?=
 =?utf-8?B?dXMvVE5laGlNWmdIM1lrWWxxQzFEQmh1YzRqUmsvbUZOTlVYNlJIWmpoRW9k?=
 =?utf-8?B?SWJDTjFMcWVjQjY0Sm51MjhCVk9LUlllWGhkdjdUcGNwSUtoQVNORFBFcFBk?=
 =?utf-8?B?Y0JjYTRQUjhubi9aK0gybGRCa2RQeG5PL3lPRDU5cWhyQkVmVVZMaDV4N0Fy?=
 =?utf-8?B?dlM5SzZ2THYyLytuY0xhdll5d09rbndLc00za3R5ZkQ0TWVieG9HSGN6dDlV?=
 =?utf-8?B?WDBwRFk3LzV1VVhaZkVmZG15RndkWUhMTjFyclAvQ013QmM4Z1Q1c2lrNWxp?=
 =?utf-8?B?ZitsbHlCa29kaDBQNnlTdEwyZzhzSUIyUTl3enpyV0xJblNaQlpCdzJxUVlM?=
 =?utf-8?B?UXA1R0crclQvWW02VEs4VVVMUjlpT1Y5Q2orWUFxQmE2Yk1SV3Nja1RIT0Iy?=
 =?utf-8?B?aXVRTm5EdkdUR1Q4allIeE5zOHpCelJCUnhIa0NDcUk5a0NrY0Z3dXIyZ2tt?=
 =?utf-8?B?L0k5cVYwdlJnL0V3dXNVL05EVTduU0ZVR2FYelVmLzhhbjM0YWN1dkZpeEZl?=
 =?utf-8?B?dFNQUWJGemtSbllvbkhqUzhobEZGVFovalZJWDVuQitpQ1Axd3RzWVRYUG1V?=
 =?utf-8?B?ZHAvS3g1K2J2cEVGTFlhWHlCWUlHK29IQnR1RVhTM05hOGZVZ2djeVFHOUtt?=
 =?utf-8?B?aXAzK2JuRkthb2puWUt6bUQzb3k5MkFydDhLRHBpTnQxNFBtK2M0SERWeDJs?=
 =?utf-8?B?aEk3L1diL1loUmJnM25iQnlzNkJUZGtONjVyTTVMN2JiNjdVUGUrV3RqYkkz?=
 =?utf-8?B?ZWtzSUg1dmczSDB0SkhRSUsrYUtqZTFadk1LU1lVeExDcWhTYnpXWTJxVUVB?=
 =?utf-8?B?M3JjcElqZm9qR1lwY29VZytXU2tKUEJVY2t1M2JsRS9GbjE3U0t2SzY3c3dw?=
 =?utf-8?B?ajBkM2FKM3grd3E2S1dsbkFFZ29JOE04ZVFNay9jaGNXVm1hM3I4bnFjdDhS?=
 =?utf-8?B?L0FwbEVzZlhaN1BWRGhYRUZLTG5hRmRmNE5WSFoyaWc4YnZZNk5QT1hPMUM5?=
 =?utf-8?B?bFJreGJQbmRJSXM3dDg1c0FkdVF5M0lwaG83UHJteGh1ampZaGt3VkhEbllt?=
 =?utf-8?Q?OzuZVj2aXxBwSolTSnwt2DE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb0e6224-2150-4f87-e17b-08dd4584bd53
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 01:30:57.2905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: smVBVzk1l9AvfdcYFZ3JkKa6C3rHFndU0yF8/t3EsAQ4vR44JP9MyGbsM/PFHfd9KLtpyUdCA0tUN45iQj2e+Rb9DR5lqJUN7UALdLLGX7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7521
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

On Mon, Feb 03, 2025 at 10:56:03AM +0530, Riana Tauro wrote:
>Hi Umesh
>
>Thank you for the review comments
>
>On 2/1/2025 5:22 AM, Umesh Nerlige Ramappa wrote:
>>On Wed, Jan 29, 2025 at 03:46:49PM +0530, Riana Tauro wrote:
>>>Add support for function level per-engine-class activity stats.
>>>This is enabled when sriov_numvfs is set and disabled when vf's
>>>are disabled.
>>>
>>>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>---
>>>drivers/gpu/drm/xe/abi/guc_actions_abi.h      |   1 +
>>>drivers/gpu/drm/xe/xe_guc_engine_activity.c   | 200 +++++++++++++++---
>>>drivers/gpu/drm/xe/xe_guc_engine_activity.h   |   5 +-
>>>.../gpu/drm/xe/xe_guc_engine_activity_types.h |   8 +-
>>>drivers/gpu/drm/xe/xe_pmu.c                   |   4 +-
>>>5 files changed, 186 insertions(+), 32 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h 
>>>b/drivers/gpu/ drm/xe/abi/guc_actions_abi.h
>>>index ec516e838ee8..448afb86e05c 100644
>>>--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>>>+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>>>@@ -141,6 +141,7 @@ enum xe_guc_action {
>>>    XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
>>>    XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
>>>    XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
>>>+    XE_GUC_ACTION_SET_FUNCTION_ENGINE_ACTIVITY_BUFFER = 0x550D,
>>>    XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR = 0x6000,
>>>    XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC = 0x6002,
>>>    XE_GUC_ACTION_PAGE_FAULT_RES_DESC = 0x6003,
>>>diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c 
>>>b/drivers/ gpu/drm/xe/xe_guc_engine_activity.c
>>>index 4d720afd12ac..0ab716a58d5c 100644
>>>--- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>>>+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>>>@@ -15,35 +15,61 @@
>>>#include "xe_hw_engine.h"
>>>#include "xe_map.h"
>>>#include "xe_mmio.h"
>>>+#include "xe_sriov_pf_helpers.h"
>>>#include "xe_trace_guc.h"
>>>
>>>#define TOTAL_QUANTA 0x8000
>>>
>>>-static struct iosys_map engine_activity_map(struct xe_guc *guc, 
>>>struct xe_hw_engine *hwe)
>>>+static struct iosys_map engine_activity_map(struct xe_guc *guc, 
>>>struct xe_hw_engine *hwe,
>>>+                        unsigned int index)
>>>{
>>>    struct xe_guc_engine_activity *engine_activity = &guc- 
>>>>engine_activity;
>>>    struct engine_activity_buffer *buffer = &engine_activity- 
>>>>device_buffer;
>>You can drop the initialization here since it is being set below.
>yeah missed to do this. will fix it
>>
>>>    u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
>>>    size_t offset = 0;
>>For readability, you could set offset = 0 in the else part instead of here.
>okay will add it below
>>>
>>>-    offset = offsetof(struct guc_engine_activity_data,
>>>+    if (index) {
>>>+        buffer = &engine_activity->function_buffer;
>>>+        offset = sizeof(struct guc_engine_activity_data) * (index - 1);
>>>+    } else {
>>>+        buffer = &engine_activity->device_buffer;
>>>+    }
>>>+
>>>+    offset += offsetof(struct guc_engine_activity_data,
>>>              engine_activity[guc_class][hwe->logical_instance]);
>>>
>>>    return IOSYS_MAP_INIT_OFFSET(&buffer->activity_bo->vmap, offset);
>>>}
>>>
>>>-static struct iosys_map engine_metadata_map(struct xe_guc *guc)
>>>+static struct iosys_map engine_metadata_map(struct xe_guc *guc,
>>>+                        unsigned int index)
>>>{
>>>    struct xe_guc_engine_activity *engine_activity = &guc- 
>>>>engine_activity;
>>>-    struct engine_activity_buffer *buffer = &engine_activity- 
>>>>device_buffer;
>>>+    struct engine_activity_buffer *buffer;
>>>+    size_t offset = 0;
>>Same here ^
>>
>>>+
>>>+    if (index) {
>>>+        buffer = &engine_activity->function_buffer;
>>>+        offset = sizeof(struct guc_engine_activity_metadata) * 
>>>(index - 1);
>>>+    } else {
>>>+        buffer = &engine_activity->device_buffer;
>>>+    }
>>>
>>>-    return buffer->metadata_bo->vmap;
>>>+    return IOSYS_MAP_INIT_OFFSET(&buffer->metadata_bo->vmap, offset);
>>>}
>>>
>>>static int allocate_engine_activity_group(struct xe_guc *guc)
>>>{
>>>    struct xe_guc_engine_activity *engine_activity = &guc- 
>>>>engine_activity;
>>>-    u32 num_activity_group = 1;
>>>+    struct xe_device *xe = guc_to_xe(guc);
>>>+    u32 num_activity_group;
>>>+
>>>+    /*
>>>+     * Two additional activity groups are allocated one for global
>>>+     * and one for PF engine activity when SRIOV is enabled
>>>+     */
>>>+    num_activity_group = IS_SRIOV_PF(xe) ? 
>>>xe_sriov_pf_get_totalvfs(xe) + 2 : 1;
>>>+
>>>
>>>    engine_activity->eag = kmalloc_array(num_activity_group,
>>>                         sizeof(struct engine_activity_group),
>>>@@ -59,10 +85,11 @@ static int 
>>>allocate_engine_activity_group(struct xe_guc *guc)
>>>}
>>>
>>>static int allocate_engine_activity_buffers(struct xe_guc *guc,
>>>-                        struct engine_activity_buffer *buffer)
>>>+                        struct engine_activity_buffer *buffer,
>>>+                        int count)
>>>{
>>>-    u32 metadata_size = sizeof(struct guc_engine_activity_metadata);
>>>-    u32 size = sizeof(struct guc_engine_activity_data);
>>>+    u32 metadata_size = sizeof(struct 
>>>guc_engine_activity_metadata) * count;
>>>+    u32 size = sizeof(struct guc_engine_activity_data) * count;
>>>    struct xe_gt *gt = guc_to_gt(guc);
>>>    struct xe_tile *tile = gt_to_tile(gt);
>>>    struct xe_bo *bo, *metadata_bo;
>>>@@ -89,10 +116,17 @@ static int 
>>>allocate_engine_activity_buffers(struct xe_guc *guc,
>>>    return 0;
>>>}
>>>
>>>-static struct engine_activity 
>>>*hw_engine_to_engine_activity(struct xe_hw_engine *hwe)
>>>+static void free_engine_activity_buffers(struct 
>>>engine_activity_buffer *buffer)
>>>+{
>>>+    xe_bo_unpin_map_no_vm(buffer->metadata_bo);
>>+    xe_bo_unpin_map_no_vm(buffer->activity_bo);
>>>+}
>>>+
>>>+static struct engine_activity 
>>>*hw_engine_to_engine_activity(struct xe_hw_engine *hwe,
>>>+                                unsigned int index)
>>>{
>>>    struct xe_guc *guc = &hwe->gt->uc.guc;
>>>-    struct engine_activity_group *eag = &guc->engine_activity.eag[0];
>>>+    struct engine_activity_group *eag = &guc- 
>>>>engine_activity.eag[index];
>>>    u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
>>>
>>>    return &eag->engine[guc_class][hwe->logical_instance];
>>>@@ -109,9 +143,10 @@ static u64 cpu_ns_to_guc_tsc_tick(ktime_t ns, 
>>>u32 freq)
>>>#define read_metadata_record(xe_, map_, field_) \
>>>    xe_map_rd_field(xe_, map_, 0, struct 
>>>guc_engine_activity_metadata, field_)
>>>
>>>-static u64 get_engine_active_ticks(struct xe_guc *guc, struct 
>>>xe_hw_engine *hwe)
>>>+static u64 get_engine_active_ticks(struct xe_guc *guc, struct 
>>>xe_hw_engine *hwe,
>>>+                   unsigned int index)
>>>{
>>>-    struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
>>>+    struct engine_activity *ea = 
>>>hw_engine_to_engine_activity(hwe, index);
>>>    struct guc_engine_activity *cached_activity = &ea->activity;
>>>    struct guc_engine_activity_metadata *cached_metadata = &ea->metadata;
>>>    struct xe_guc_engine_activity *engine_activity = &guc- 
>>>>engine_activity;
>>>@@ -122,8 +157,8 @@ static u64 get_engine_active_ticks(struct 
>>>xe_guc *guc, struct xe_hw_engine *hwe)
>>>    u64 active_ticks, gpm_ts;
>>>    u16 change_num;
>>>
>>>-    activity_map = engine_activity_map(guc, hwe);
>>>-    metadata_map = engine_metadata_map(guc);
>>>+    activity_map = engine_activity_map(guc, hwe, index);
>>>+    metadata_map = engine_metadata_map(guc, index);
>>>    global_change_num = read_metadata_record(xe, &metadata_map, 
>>>global_change_num);
>>>
>>>    /* GuC has not initialized activity data yet, return 0 */
>>>@@ -166,9 +201,9 @@ static u64 get_engine_active_ticks(struct 
>>>xe_guc *guc, struct xe_hw_engine *hwe)
>>>    return ea->total + ea->active;
>>>}
>>>
>>>-static u64 get_engine_total_ticks(struct xe_guc *guc, struct 
>>>xe_hw_engine *hwe)
>>>+static u64 get_engine_total_ticks(struct xe_guc *guc, struct 
>>>xe_hw_engine *hwe, unsigned int index)
>>>{
>>>-    struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
>>>+    struct engine_activity *ea = 
>>>hw_engine_to_engine_activity(hwe, index);
>>>    struct guc_engine_activity_metadata *cached_metadata = &ea->metadata;
>>>    struct guc_engine_activity *cached_activity = &ea->activity;
>>>    struct iosys_map activity_map, metadata_map;
>>>@@ -177,8 +212,8 @@ static u64 get_engine_total_ticks(struct 
>>>xe_guc *guc, struct xe_hw_engine *hwe)
>>>    u64 numerator;
>>>    u16 quanta_ratio;
>>>
>>>-    activity_map = engine_activity_map(guc, hwe);
>>>-    metadata_map = engine_metadata_map(guc);
>>>+    activity_map = engine_activity_map(guc, hwe, index);
>>>+    metadata_map = engine_metadata_map(guc, index);
>>>
>>>    if (!cached_metadata->guc_tsc_frequency_hz)
>>>        cached_metadata->guc_tsc_frequency_hz = 
>>>read_metadata_record(xe, &metadata_map,
>>>@@ -220,10 +255,35 @@ static int 
>>>enable_engine_activity_stats(struct xe_guc *guc)
>>>    return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
>>>}
>>>
>>>-static void engine_activity_set_cpu_ts(struct xe_guc *guc)
>>>+static int enable_function_engine_activity_stats(struct xe_guc 
>>>*guc, bool enable)
>>>{
>>>    struct xe_guc_engine_activity *engine_activity = &guc- 
>>>>engine_activity;
>>>-    struct engine_activity_group *eag = &engine_activity->eag[0];
>>>+    u32 metadata_ggtt_addr = 0, ggtt_addr = 0, num_functions = 0;
>>>+    struct engine_activity_buffer *buffer = &engine_activity- 
>>>>function_buffer;
>>>+    u32 action[6];
>>>+    int len = 0;
>>>+
>>>+    if (enable) {
>>>+        metadata_ggtt_addr = xe_bo_ggtt_addr(buffer->metadata_bo);
>>>+        ggtt_addr = xe_bo_ggtt_addr(buffer->activity_bo);
>>>+        num_functions = engine_activity->num_functions;
>>>+    }
>>>+
>>>+    action[len++] = XE_GUC_ACTION_SET_FUNCTION_ENGINE_ACTIVITY_BUFFER;
>>>+    action[len++] = num_functions;
>>>+    action[len++] = metadata_ggtt_addr;
>>>+    action[len++] = 0;
>>>+    action[len++] = ggtt_addr;
>>>+    action[len++] = 0;
>>>+
>>>+    /* Blocking here to ensure the buffers are ready before 
>>>reading them */
>>>+    return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
>>>+}
>>>+
>>>+static void engine_activity_set_cpu_ts(struct xe_guc *guc, 
>>>unsigned int index)
>>>+{
>>>+    struct xe_guc_engine_activity *engine_activity = &guc- 
>>>>engine_activity;
>>>+    struct engine_activity_group *eag = &engine_activity->eag[index];
>>>    int i, j;
>>>
>>>    for (i = 0; i < GUC_MAX_ENGINE_CLASSES; i++)
>>>@@ -240,36 +300,103 @@ static u32 gpm_timestamp_shift(struct xe_gt *gt)
>>>    return 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
>>>}
>>>
>>>+static bool is_function_valid(struct xe_guc *guc, unsigned int fn_id)
>>>+{
>>>+    struct xe_device *xe = guc_to_xe(guc);
>>>+    struct xe_guc_engine_activity *engine_activity = &guc- 
>>>>engine_activity;
>>>+
>>>+    if (!IS_SRIOV(xe) && fn_id)
>>>+        return false;
>>>+
>>>+    if (fn_id > engine_activity->num_functions)
>>
>>This ^ should be 'else if'. Consider the Native case where fn_id = 
>>0. I believe num_functions will be 0 for native, so the check would 
>>fail always for native. Right?
>Only if it's greater it would fail. So for native it will not.

ah, sorry my bad. Looks fine

Thanks,
Umesh
>
>In case of SRIOV too. It'll fail only if num_vfs is not set.
>So there won't be two counters one global and one PF. Only global will 
>be present.
>
>Thanks
>Riana
>>
>>>+        return false;
>>>+
>>>+    return true;
>>>+}
>>>+
>>
>>Thanks,
>>Umesh
>
