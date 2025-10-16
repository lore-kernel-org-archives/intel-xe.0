Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D64CCD194
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 12:31:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 381B010E9CB;
	Thu, 16 Oct 2025 12:31:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S8ijwvjj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34ECA10E9CB
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 12:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760617866; x=1792153866;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=LUPsUrtJh1JNo4TOHmEOT+z36EUvgVtjtHemOyHhMIo=;
 b=S8ijwvjjVQynKbtbwARR34TZjsA0GwGmK5ksZ1NCTrnPH+p2xZwq/2Bp
 ciwADcWdXwJCOVd539lpbpbvPYv5Tn7ZKOGx/NNk/Bnw7O1QXqKUsWAvV
 bnhmkfBlMbMCuICWkveNSOgK4uIfw5ezGWzZ/cvZtSrsDbhA9ITbk5c3N
 yzIkLDWmghknKjCTnggr20EvB+4aiz1nDBo6sHEYe45PRgouFiETcBqZ/
 EIRqA8nwBsuonuYWC783rdIORaxTBxkG79ctLmxVZq6L9W/ulu6OQ96gq
 SmLFwBjeFpSXIei6AY6A4yCXJnnCcKf8hh+6eSTP9uvzan+2W3g1e5tU2 g==;
X-CSE-ConnectionGUID: hlJN0dc5Tzm4nlK7Qe0ExA==
X-CSE-MsgGUID: ssTpqn9gTXeBedXo/ozAeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66457210"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="66457210"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 05:31:06 -0700
X-CSE-ConnectionGUID: xcBUQQqsQseCi38XXau8cg==
X-CSE-MsgGUID: Xw3uLk99R+aJoJUROARsUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="182387178"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 05:31:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 05:31:04 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 05:31:04 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 05:31:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X2kptm9VY0LBc2mSKSvvzSOZBCzAvm6PCokuKm8kwcMvYEH+KfH8+pn788IEdjSxo6EEUp/nbOT1otAtxkwbEnk/iqcYbOzPSJiGE8V4GjyFZeG/fvS+waf9DEgm7PRPBAjIhK9EIQDDfVivTnQOsk6Iu5krNFnz7yYtqZMfxyTOeLHScooEMLJxM12M9TD5SFQ/0L2sO9Opc1CI2vttnYaIKv+X/p2zTRgekYbIayL+ouLBaCEoP8ctr21FgqmESYe2a2x3kntNRlz5i+8jZxXEffCjDNlaFhuGRRVsXVX92AKIuKReL8nLZF1NHP8vtprGzLQewHZYJJJe3VSO/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PCnWXNQ+1vecPrFczOmBgI1UP4106jVparAD6tKvosI=;
 b=rKqwKlOOHaizbjpmtrrlNZhDw956GC72YF8/l6ExzJpCgx+geatq7ZQ7/zhgsHVtJjzHlzZt6S0XkicaRB9oCkz+AoG7TnahFz7AQo7LYA3nQRvgh8voNY09BMtvHzbwI0LsEqm+jhQikGEOFS+lfSjhA9JrVgfKFkrgcdZJtBTkT+jT2PO/ANzSSF8egoqET9QqjIhLNrU7XcxNrsDisTH2zYD1Hac5JoM+2eCpgcyL9fv538PMoxDNvxYto5nQ+mAnp7xJTJ2rN6ewV2Ctb3vuA3nh22vpIsL0Z2/0pn+oe+8o0ajgfEn2dvVWx+vuuMWYBqpbc/A8OkW6HXlIlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH7PR11MB6473.namprd11.prod.outlook.com (2603:10b6:510:1f3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 12:31:03 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9228.011; Thu, 16 Oct 2025
 12:31:02 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251015-xe3p-v2-20-b9189b3056a2@intel.com>
References: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
 <20251015-xe3p-v2-20-b9189b3056a2@intel.com>
Subject: Re: [PATCH v2 20/22] drm/xe/xe3p_xpc: Skip compression tuning on
 platforms without flatccs
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Thu, 16 Oct 2025 09:30:58 -0300
Message-ID: <176061785811.3168.4643994654849150356@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BYAPR07CA0052.namprd07.prod.outlook.com
 (2603:10b6:a03:60::29) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH7PR11MB6473:EE_
X-MS-Office365-Filtering-Correlation-Id: ca85593a-35fc-4c9e-4117-08de0cafde96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MjJtM2JVaWJnaG00TWM1OUFyb2dPUjNNWDNpTS9SQ1NvMnptczJsYlVaQ2lJ?=
 =?utf-8?B?Y3JXTnlhbHZlbTRJUzJBRitGc2tMNkxvZzFjU3BYSEhtanRKRDRnRDBnL01H?=
 =?utf-8?B?OG5obEoyNE5WdlBwOXB0VXRPZ3BERy9VMVdVSzZrSVh1SGJsY01HYTVKNXhx?=
 =?utf-8?B?aWZJeURQS3FkVUJUL3ZjNUhvMDNFN2VGQzRScjlLVlUzdnBua1V0ZGZkb3RE?=
 =?utf-8?B?eFp5Rnp5Q01tdDhEZTdwcWRmcnJFY2M3U1NjbW9jZ3psc1gwTlJrSmlzUk4w?=
 =?utf-8?B?dUZJVWp0N0U3WGNvZnh3QUZ1cUpKdkVseFNkZ1RLTWlxSUkwc0VqZUNsZm02?=
 =?utf-8?B?d1VNQmt2bkp5Tm1Wa0k3N2JqcDJtM083OXhBK2FET0hOQ2VyWWM0TzIvSjc2?=
 =?utf-8?B?elhTNlovaXIyb0Evc0o5RlltYmx3ZGdtaDBKQzlhSXFwK292aTExN1VTZnFM?=
 =?utf-8?B?bjg2bWgvTUNUcnRhOUlubnBrRWI0bVRERmxSeFdOMkxYamZ2dzdVMys0T3BI?=
 =?utf-8?B?bVFMMlNINVpkQ3RNblp4OEI1M1o5VTNoTnlreWZ5SHI1TjVyM0hWbUhIU1dJ?=
 =?utf-8?B?RmsvTCtFV2pSK1NWNndtYnQ3ZFo4b0s5UFRoV3VmcWtaWng4WHgvRElURkV0?=
 =?utf-8?B?a3JYcVduK2kzeWRnRE1UdUVKbFAzMXhpK09lQlBpV1RBdlVGdHNRYnRxbDhQ?=
 =?utf-8?B?Rm56K0dGVmxBbUZZK0hIOHRyei9nZWZYWkN6S2I1OWFkOEoxTDhsQTBFaFBE?=
 =?utf-8?B?WkxiVlVEL0Q5TExCdm9RWTBOVHU0bDZkRXBzaloyaGgyZFBINXNnd3MzQzhj?=
 =?utf-8?B?TjRpMGorS2ppeE85VEVlSFJRd0wreE9GVG5rQWVxWTB0NjZnc1VtNWVNRERW?=
 =?utf-8?B?dmkzSEFNaWJwWWM2SlNHOXIxSWE3LzhQeVFyNGdqU2h5WUM5UTQrcDdTcHE3?=
 =?utf-8?B?M09oVFRHVVhXOFBSZVdEbmpVTnNQSk9HNEdNSzA5N0tuK1JmZmV3SCtGZzdJ?=
 =?utf-8?B?VWE3dU5acnFobCtWK25IYkF1M2huU1RuMERMWndMUExGTlN1MGlPMjRsSHIv?=
 =?utf-8?B?a0Fjc0xSREF0YzVXQVREUCttRHc5ZVlJcUhVU1Byd2FNVXJwYnpodXdENVVv?=
 =?utf-8?B?TmVsN0Jzdkc3dnRTcmpWVmdnT2ZrNkYwc0c5RWpCdWpyaFBNeEFWVEltTFBR?=
 =?utf-8?B?VUVEL1VMUy95Sk1aVVNsYUp3cFZmaVdSOVFDa2tmNnQ2WnhJeW9BaWFXTmVi?=
 =?utf-8?B?YjdEWStvRVRQc1gxd2dzdk5OelRGQjdKL3hXcmlMc0djamJiaDNsMGk5R3J5?=
 =?utf-8?B?bjQrREVZK1BTbHM3Ym16bnFoMFhlaWZnbzFLc0tnOU9qRlN5SU5zdGcvaHVS?=
 =?utf-8?B?RW1VWHREQ2NGTXR4NVFYN2xRNmFHb09vRFNNRW1ybHB0TDYxVFk4Rkk4eTZy?=
 =?utf-8?B?N080b29yM1BuRldtV29RU0VwVGtGekoycHJmZzJsZkI4d3NiRDVEWmNIRG1S?=
 =?utf-8?B?VTFNY0RRT08xbkdyeEgrVVp4RUNZVys3ZC84WkpjV1J5S0ZDUEh4bVI5V3Ju?=
 =?utf-8?B?Y3JzTEJUUXNwbDZWYUN6K3lvd0k5V2dsUHVhTzVHSzlnRXM2czNHWDN4VnFr?=
 =?utf-8?B?UzhpRXljT3RlOC9WVWlLazk3dmVHcVQxQzl6WXB4REdPWVJFM3plK2R6azR3?=
 =?utf-8?B?b3V5dk5LWkxnUTdoVWlRMFBXQ3FxMmIvdER5MnErTWJJaEdjNzlwNkIzRHBm?=
 =?utf-8?B?cXM2S0c5NkJNODFwYzdxYzRuNVZTcHdDWkNXWmtPT25DbVBKdFVOc1NHTGFw?=
 =?utf-8?B?Mm1GdFlCM04welFYMnkzcHd4dUgxa3U4YVhIUktHMUw1NzM2TFkzWUtUS1di?=
 =?utf-8?B?QXljYXNxdE5UTitxcFFlUzNHdXUyb083VVhVMkZ4V0thRU91Y1dWYmd5RUtR?=
 =?utf-8?Q?gH2IrTu+hvJC3isSechv8/UM5sgkoUQB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjN1akwwVEhtQlRwdEl1MnlJNWtqRmVLQWx5V2xuYWNrL3hOU0NDRk45Uy9K?=
 =?utf-8?B?QkRWVkora09uM3NTWU1WY1RMZjNzK3pHaXh5ek8weGRtWWNscDhBaEhDLys1?=
 =?utf-8?B?ZUVoRG5vQlZER0RGeFVlYWlpdVJaZDdrcnFkem5qeUFBdmRCSDlCZTd4UXE1?=
 =?utf-8?B?NUtHOFZGRGExK3c2RStYb3ZKbStWWkFENE16V1ZHN3g1cDN1S09Qcy8xcVUx?=
 =?utf-8?B?dit4cUVnaGxTYUtPY1FJRkp4Wi80RnVtKzE2bkNXZFFxTWsweE85d2RJY0pk?=
 =?utf-8?B?UThRUmRRSkVFMjNIKzNVcWMrVzJYZitjUXU4Q1QzTXRYWjY5Rys3TzlBeUZt?=
 =?utf-8?B?TXdCa0tUdDA3ckJldXBuUG9BanFBaUlFUkRIMG16SFZTVFo5RWxxRmdZNXky?=
 =?utf-8?B?cHAydTZCOXR5OFRYaEhoNVl0S3IyMitkNlNKWDNMWTc1T2NkRk51cE5HSHZD?=
 =?utf-8?B?SWE4L1FPS3ZQN3lqODk1bDh0Q0FWd0UwKzVaRmFuNHZ2RUtublhtLzQzMUhi?=
 =?utf-8?B?V0JrYUVvMGZ5R0VJaEpHSkxLZnYwREhDczlOaDJyalhXc2JwWWZJbnVMeWV4?=
 =?utf-8?B?OU9TN2hhakxqZHN2Ty9DeXpmWEhNQjlublFqT1h6eEh4VFI4RDhBQzVwSGk1?=
 =?utf-8?B?Rk5MSHJLMStSak9PdjZnWkt3MElTMTZ4Z0N2TE4zMGZiN2NMdlhUTmlKNXNr?=
 =?utf-8?B?MFE4cVpsRkJDSGhTN0hYZDd6clhLdmtFSnlnT1pQRTZjTk9CODVWTU13THNW?=
 =?utf-8?B?bGVObUxtRWx2c0VGL2ZYS3oyRDcyZm52ci9TcExRZ2VDKzArU3ZGdUtuQVpM?=
 =?utf-8?B?WWxhenlNYXE5dFNXZi9UV3YxR0dEbmdpQmZYczN1eG4zalRFZGZEd0hCTW8v?=
 =?utf-8?B?enNqelhBYkxaSExtckRFTUJib2UwRk1TSkIrbElLbFJ6NlFRcTBaNjQ5WTFM?=
 =?utf-8?B?anI4VFgybTErZEwvWld2MllvK1BsVjRrdEp4NW9HRTNyMkY2eVF5OWt5VjJk?=
 =?utf-8?B?NURRekYyQzJaWW5NT21qd0RmM0hOd3RvZ0ttV0ExWUwyZVo1TTBzTFg1Qjk3?=
 =?utf-8?B?YU1pODEwdktHaUFjU3kwVXNvdXhsSC83cFZlVit1ZEdGNkpsQlUvRnFoQ3V5?=
 =?utf-8?B?VTNtMm1jT1QwOCswVnFIdEcybldMbkFDbTI0T0ZXeXlURm1Fc1pzK3l1WWVY?=
 =?utf-8?B?LzZRNVk2cjUyNWE4YkNmbk8xSTNoY1VXNXhBZU11ZTA3NUVQQzNqUFloMW5a?=
 =?utf-8?B?UGIyM0hQaG1zOXhCclhzYVpiRmxBWkxCZ0luaU01UUlwSnFVNlRuV1dYMS9C?=
 =?utf-8?B?czlLbHNUOGs3QlFsYTJ4RXlyVTdsMkJzVDBoNEN4NXJ4UU45Um0rN2xFeTZP?=
 =?utf-8?B?NVRBOU9mZ2dJQlZDKzh5MENSVzg3WnRuU1NaNTFlYkJtU2JTUXJZNnRORzhU?=
 =?utf-8?B?ZWxHeDJhK0Y3S05neVAySkxKVU1vNzlHckVFTUFNS0luWDV4cTJMRS9KVVdP?=
 =?utf-8?B?amNFa3ZoK3R4aWpMWGRSM3NNZHFqa0kwdXdmTEt2TzE0dEV2ZXdabWJNcmRW?=
 =?utf-8?B?S0VPWFNnZFBJbWVFMlJVcVY4WkhwK2pTOTU5TERJd1dsN285N0NEMGxqRnNQ?=
 =?utf-8?B?ekQvd3dBNjc5elVRblB0blJ0cXJsU25MaDAwZ0hacWRIWndwSlFCOTVBN0hL?=
 =?utf-8?B?U09XWmd1dExPWmxsTHlkbm5iZVdTckw1NkZsdjdqcjBDQ3RnQitXZFlSYWIx?=
 =?utf-8?B?ck9lOWhYb3pMRDFqMjBraWU2dmNUd1RqWDRIOVZTMXZzeDdDTzBrdWpZZUdJ?=
 =?utf-8?B?VHk4ekxsWWV5VWxUbWFXT0x2dCt2cjZ3UlBjbXEwTE9pTkJNbnRHREk3RE9B?=
 =?utf-8?B?MjMybk9mTERXcTR5WEhkVmhGeW1ZQkxzTDFrMXByMVVnOE5Pem1NaXhFYXda?=
 =?utf-8?B?dkIxZ2FCalZlTnUwV0gvUWRTWTcwWGdXY3IxSjZSc2h2RHpRbzRJNEJaQmZG?=
 =?utf-8?B?Q1Y2OWJDdnUyckhJeTNMU0tBcVlLbjZldndSeml5UW5qUkJoalJ0cjFtQUdO?=
 =?utf-8?B?ZGg1WlVuVWxOZXRCZ3FHMU9zaXFSdG13SC8vZk82SkVSbXYrNmVnZlphTUgr?=
 =?utf-8?B?UEFLd2lGb2lQRnJBcUFka1d5dUVSSTBmNWI3bG1oUFNlSWUwUG4xZjRLQ3dT?=
 =?utf-8?B?ZEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca85593a-35fc-4c9e-4117-08de0cafde96
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 12:31:02.8379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xUh6szzVzAMnOAh4YJUtBpU2J+1xZbABVjJPwe7aYDTsXoTOxkay9yb2ki3Pq4YouiAsllCkyCXSbzqZBfA2lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6473
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

Quoting Lucas De Marchi (2025-10-15 19:06:35-03:00)
>From: Matt Roper <matthew.d.roper@intel.com>
>
>The compression overfetch tuning settings only apply to platforms that
>support FlatCCS.  In Xe3p_XPC (and any future IPs that also lack
>compression) some of the registers being adjusted by this tuning will
>not exist or may have been repurposed for something else, so we should
>take care not to try to program them.
>
>Note that our xe_rtp_match_has_flatccs() function will also return false
>on platforms that do have FlatCCS in the hardware design, but have
>compression manually disabled in the BIOS.  On such platforms the
>registers still exist (and it would be fine to continue programming
>them), but they would have no effect, so skipping that tuning is also
>safe.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/xe_rtp.c    |  7 +++++++
> drivers/gpu/drm/xe/xe_rtp.h    | 12 ++++++++++++
> drivers/gpu/drm/xe/xe_tuning.c |  9 ++++++---
> 3 files changed, 25 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
>index 66707cc89ec97..ed509b1c8cfcd 100644
>--- a/drivers/gpu/drm/xe/xe_rtp.c
>+++ b/drivers/gpu/drm/xe/xe_rtp.c
>@@ -378,3 +378,10 @@ bool xe_rtp_match_gt_has_discontiguous_dss_groups(con=
st struct xe_device *xe,
> {
>         return xe_gt_has_discontiguous_dss_groups(gt);
> }
>+
>+bool xe_rtp_match_has_flat_ccs(const struct xe_device *xe,
>+                               const struct xe_gt *gt,
>+                               const struct xe_hw_engine *hwe)
>+{
>+        return xe->info.has_flat_ccs;
>+}

One possible issue here is that OOB RTP entries are processed before we
call probe_has_flat_ccs().  Not a real problem right now, because we are
only using xe_rtp_match_has_flat_ccs() in gt_tunnings, but this could be
problematic if in the future someone added a
FUNC(xe_rtp_match_has_flat_ccs) in OOB rules files.

--
Gustavo Sousa

>diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
>index e5b8a9452e29e..ba5f940c0a961 100644
>--- a/drivers/gpu/drm/xe/xe_rtp.h
>+++ b/drivers/gpu/drm/xe/xe_rtp.h
>@@ -491,4 +491,16 @@ bool xe_rtp_match_gt_has_discontiguous_dss_groups(con=
st struct xe_device *xe,
>                                                   const struct xe_gt *gt,
>                                                   const struct xe_hw_engi=
ne *hwe);
>=20
>+/**
>+ * xe_rtp_match_has_flat_ccs - Match when platform has FlatCCS compressio=
n
>+ * @xe: Device structure
>+ * @gt: GT structure
>+ * @hwe: Engine instance
>+ *
>+ * Returns: true if platform has FlatCCS compression, false otherwise
>+ */
>+bool xe_rtp_match_has_flat_ccs(const struct xe_device *xe,
>+                               const struct xe_gt *gt,
>+                               const struct xe_hw_engine *hwe);
>+
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning=
.c
>index fd58ea5e78bf6..7c140d8cb1e07 100644
>--- a/drivers/gpu/drm/xe/xe_tuning.c
>+++ b/drivers/gpu/drm/xe/xe_tuning.c
>@@ -40,7 +40,8 @@ static const struct xe_rtp_entry_sr gt_tunings[] =3D {
>                                    REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_M=
ASK, 0x7f)))
>         },
>         { XE_RTP_NAME("Tuning: Compression Overfetch"),
>-          XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UN=
DEFINED)),
>+          XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UN=
DEFINED),
>+                       FUNC(xe_rtp_match_has_flat_ccs)),
>           XE_RTP_ACTIONS(CLR(CCCHKNREG1, ENCOMPPERFFIX),
>                          SET(CCCHKNREG1, L3CMPCTRL))
>         },
>@@ -58,12 +59,14 @@ static const struct xe_rtp_entry_sr gt_tunings[] =3D {
>           XE_RTP_ACTIONS(SET(XE2LPM_L3SQCREG3, COMPPWOVERFETCHEN))
>         },
>         { XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only"),
>-          XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UN=
DEFINED)),
>+          XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UN=
DEFINED),
>+                       FUNC(xe_rtp_match_has_flat_ccs)),
>           XE_RTP_ACTIONS(SET(L3SQCREG2,
>                              COMPMEMRD256BOVRFETCHEN))
>         },
>         { XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only - media"),
>-          XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEF=
INED)),
>+          XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEF=
INED),
>+                       FUNC(xe_rtp_match_has_flat_ccs)),
>           XE_RTP_ACTIONS(SET(XE2LPM_L3SQCREG2,
>                              COMPMEMRD256BOVRFETCHEN))
>         },
>
>--=20
>2.51.0
>
