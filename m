Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB77CE8E78
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 13:56:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F0810E949;
	Thu, 24 Oct 2024 13:56:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iySPZozP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC6110E949
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Oct 2024 13:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729778201; x=1761314201;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=L9xJdyJLcL2Swk5KIZ4j6zY7u3/gj8S7adI8SJ3kmRY=;
 b=iySPZozPKdXTsP0UOUavIAxjANrf3XtzaRzeydURt3BGfUZBcrSBgbfD
 PmsGtfo2jV3T3egxOiraqv4SEY05GaHlZ/usH9LRdIlUz992L6gAzvoj2
 HjwGCrCpfNnM0G5W54f6+xJnr1TMAqQL58sKkowgO1nF2TTUY38CDgn+s
 cjGDqNEolclV+kWZOCM3YcDbHEDCkZjaKdsd2JcC9O0Ab0lQsccVk5eue
 KxaUWniHdVUs/XtDzmJ5uMr79dlUTih/QjBHNgZdEuIYXgFv6nqdn+pSV
 KfaoCUTfE9V+MCa+T/9liZWneUkhJY5HbbNV9F8aXEKw0xBO4oLFscjp1 A==;
X-CSE-ConnectionGUID: gKVhmao1Q7uiE8rAK6V0tg==
X-CSE-MsgGUID: QEydwCC8Sgipdxidiwb1hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="46895065"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="46895065"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 06:56:41 -0700
X-CSE-ConnectionGUID: W4GexQLETqmBsHx/7j25hQ==
X-CSE-MsgGUID: l3y/w6ccRqymH7sP7mSAdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="118056496"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Oct 2024 06:56:42 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 24 Oct 2024 06:56:40 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 24 Oct 2024 06:56:40 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 24 Oct 2024 06:56:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AYUP/8uEs7SrH+TLkz21eoBdXPiQ75pBPlK7AhAILVgus9qVdEmVkcfXkRevHX77NLshYSLZ7qumbNSNopDzi/5f1jWqByr+a02xltXaTIGn8mYreqOWfQKwWMWPdhVrONNd/dmZcIyuGDobalklkwx44H0VWTF4Vfjv8tpkigIKVWmAXw73SkNH78vnRbbN599vs0xFdIBK1oBrZhVKV2do53sOMMTouwGnucH9Ujng4lGSLjxsAuNXbVG/TU4q2i0RN3MIeS6zyFFJnoI0Gchm/K1OGkbttjpmwDDnd++OqxAOJ7lLWAIrzkMU2+cnw+pf4Rc1rYB2epHxUnilrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=30n/nXc5FwhRPClC6bDiCDqr+lbAzpBMC3Nx/WM/t1U=;
 b=AA4tcDruZQqwjZ5msSymdvRqsnQzHyn8BcAMaF8KIlGowlhoDz+R1XwsbwfiL9m94RQSfsga6VmtRP9njz8C2+8HZLJJIs3bNCyjr2e/5xXbQFyMdFjhT/c5Q9M+burNQBTKKC9AzmYw0yV6Wsw8TA2JKZN8KWo7/6SOsRO1CSUuGLq3VfQYFLbDQuC2QSE+JqWXN6DS2kwhVCmVY7tLg8MFNQiFtVybeFaiYSCG/oa/p+WNTCJ94HyLfDm4hQ4rrmCJm+xI4ZBIdp+irQfskbOcL7qJITymPTCc7TeXQUB4ymCg5N6measqwRJ4lFJ1RrtD0pgjUkKpASdS7rR+MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15)
 by CY5PR11MB6089.namprd11.prod.outlook.com (2603:10b6:930:2f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Thu, 24 Oct
 2024 13:56:38 +0000
Received: from DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::e353:636a:37f:21ef]) by DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::e353:636a:37f:21ef%3]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 13:56:38 +0000
Message-ID: <b7ca0d74-2aa9-4c42-b397-6dee36a4da7b@intel.com>
Date: Thu, 24 Oct 2024 19:26:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc/tlb: Flush g2h worker in case of tlb timeout
To: Nirmoy Das <nirmoy.das@intel.com>, Nirmoy Das
 <nirmoy.das@linux.intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, John Harrison <John.C.Harrison@Intel.com>, "Himal
 Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Anshuman
 Gupta" <Anshuman.Gupta@intel.com>
References: <20241023151343.3463640-1-nirmoy.das@intel.com>
 <20af74cb-1ade-4f75-b73c-7e75b3651a00@intel.com>
 <6179d84e-a746-467e-a0ef-a04567dc0554@linux.intel.com>
 <24bebfeb-ffee-4c3a-8ab2-5ca76d086e59@intel.com>
 <ee0cff12-721e-497e-9a23-81b9dbbe26da@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <ee0cff12-721e-497e-9a23-81b9dbbe26da@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0106.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::16) To DM4PR11MB5536.namprd11.prod.outlook.com
 (2603:10b6:5:39b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5536:EE_|CY5PR11MB6089:EE_
X-MS-Office365-Filtering-Correlation-Id: cce9698d-3fa5-40a9-00bc-08dcf433ae47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGsyclVubFRwUXNReUxmVFBFM2NLU1BheU92MGR6eWhjb0VzMHh2ZFRJeUth?=
 =?utf-8?B?RWJVM01Ea2F6dkRnUlVKY2IwSTdLb2h2cFVwWnJoSHFYdDVML0ZKL25SRlJO?=
 =?utf-8?B?QkdiQlJVcXdqSFVnV3V0dFZoRjFTSEE1clBhWHRialU4ZEpUb1JFcFJsY2tk?=
 =?utf-8?B?YkJvY21hVW4zMUNQa3hmVGlLblhvUlloNEhUaTlkbExYSmNjN1IybHVnZWNl?=
 =?utf-8?B?dDNHTExsc1pkNExtQzV3Z1EyR2l0bHFJK2hvY3FhMnpnek9hcFhYY0FKbXdH?=
 =?utf-8?B?SmEyZ1VhMWtEbFg0TGNselBmR0l1TXpLWkg4YVBXaDdQRTFpRDZSSHBySmdY?=
 =?utf-8?B?cFJheUk0b1VZbFlZeCs0bGZEZzJWOUhLeXJXNlZ6U1Z1SlpDcmpIelA1U3dO?=
 =?utf-8?B?cURIS3lQWENFZDZ5UkV2TTQ3WENyelpGakJxMzFmTmNFS04yUmc2cFFSOGRl?=
 =?utf-8?B?ZWZzV2pZVVFIZ0hlSmhSKzhodkpPdmdSaDZYUmxXNEljanN6Sm9YUEtqS2NW?=
 =?utf-8?B?MGZYVTZCMTRFWFdUNEdmb1NOWnA1aUdwRlhmemRsLzlrcEYyU1l4RGd6a1Fk?=
 =?utf-8?B?dFBqSFdRNXg0NnZWTlNURlk3YUJjUkVjeUZHSHFDQ1dFMTltVE1YQWk4QkFV?=
 =?utf-8?B?TXBsZW5JTTlUVU9DU2xqZGFRYS9UWk0vNVk0bElWQ08wZFdQUzh4RmhTZktt?=
 =?utf-8?B?Umtna0VzdFRyMzR4b3Vsdk5jL0ZZb0pQK3Q5cDA1bXdBTHZrMG9rdThRVGxO?=
 =?utf-8?B?MVdKMnBRSE1IVStBVjJXN04zRGlZUHBIMkpYM00yN2pjRVYzWGpxbWZWMHlk?=
 =?utf-8?B?aXhDTWREUmJBRkl6dmpMRWFCY3g2azdycHdnWTZ6NlVPMlF1S3NQTlp6RGhn?=
 =?utf-8?B?WVFBbVJRajNFcUlCR0tZQTRQa2ovd2ljUzlOZEd5WVZmQmsydkNJODk3Y2VH?=
 =?utf-8?B?NW9DcFF4WGNrWWhPODdRd2pOMWVLbW5JdDhlU0xBb281ZTN3Yi91MDQ5Zkp2?=
 =?utf-8?B?S20yS3FZcGpTMVUveHpDeVdlTnFUNFdyOTFnemFCRnNnN1dRVkN0VjdubzZO?=
 =?utf-8?B?TjkyOGNMWGdTN2ROc3BVUkowaUE3eU5WUncwU0JPbXF3cFYrSEl3RVF6K0E5?=
 =?utf-8?B?ZlIzMnRKSm04Zys1NGw5NHlUMlAyVlZDOXI1eC93UnRISnVBRDMzOG40TjRy?=
 =?utf-8?B?Myt0TUhrWWZTWFJERkc0ZWxScEFsaVJZOWxqVVNzcWVkTWo3UHV6VUxoNkcr?=
 =?utf-8?B?K3BYUitDMTlUVm9lMUFBSk5UdUp2aTVmNWxyS1g2Z3pnczlhWjYxWWZ4dkxW?=
 =?utf-8?B?UER0NzJ5bFZqQm10NXZvSjRZRVhCS0JVRmlQTjdXcG5mSGkyZGtVQmp0SUs0?=
 =?utf-8?B?ZnBaSWI3TnYvNkRHeHhBLzFWNFowR1l6bHhkcnN0aEVlYURIUGpWVitCRE5L?=
 =?utf-8?B?ZE0zMGxyaTRLRTR1U2NZZzVORUZ1d1lKRWl3SzM0eVJWeTJTVTM1dHJNazhZ?=
 =?utf-8?B?SnZVQTNJTndZbmpOWE5hVUR4S2w5eUlvTUkxbGlyOThIVm9qdFpRbytSZXY1?=
 =?utf-8?B?OTg1c3FTeWNFSTlXdnh3bW5QRkpzQ0NWYnJUKzRNSVMzQWlqeW1Ld01iZDBI?=
 =?utf-8?B?S3FtODZVek9nWG5NMGlFL2hHUkRoN3dFa3kzQ2c2NEtjRTB1SzF1cFQ4dWlI?=
 =?utf-8?Q?qNi964FmwBJc0iE10YWf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5536.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akNSMElNUE45Qi84ZUNzSFZBaXB3TkhxZ3Nmb01mdi94MVRzVEVkOG9oMmha?=
 =?utf-8?B?aisvRzlRYmtNOWl4SkxQSU9XMEk5NTdBaldDb0NnUDlsQW0zVEsyQWNsYjVL?=
 =?utf-8?B?T2NjeEJMMXhFMnNKNGpNTFJhUTlIUWl4M0VXRE9DenRpT0hDOEdWWXVLSElt?=
 =?utf-8?B?N2hWazFaME15U1NyeXJXekJ0bjU4Tm13aERobEx3YmlOWE9OUlBUWi85blBy?=
 =?utf-8?B?N2c5aHJuVW8rV1NlZGFRcTUwWmRycnNPbmVLdjZvMzRJNERqZTBxOGcwMnVo?=
 =?utf-8?B?SXcyZzhFeE1TbzZ4aTE1ZGphRXNlS3JCRmczeHY0cHY3WU1qanF0UXk4SlAv?=
 =?utf-8?B?S0ZWdUhMZy9tR0gwbXdWTU1YRFIxc2NoL3g1YUYxejY3U2V5THUwWVZ4Tkh1?=
 =?utf-8?B?Q1JLREh3MGZUamdvbUtvektIMGpkTnB2TUZzdkpiL085SjV4S2NjYlNSdHFt?=
 =?utf-8?B?U3oxOFZhSmdwOHVQQXBTSmNsajh2SUhMZkNjUmMxZDlvZ3p3QW9YS3ZJUE52?=
 =?utf-8?B?cUIrZnVIRk4wNjJaYndJMTkySzhWTUtOTHRuNEl0YzVYMGM3S0RSLzVudXZz?=
 =?utf-8?B?Ti9nVVc1Q3pDQXpTNUpMYWViNzQrVGt4TTdjL1EyRUJoVGtHbncvVmo4V1ho?=
 =?utf-8?B?VFgxcEtzY2RsajAzTTVUYWVvSlBSQTFpYW5lOWdJczF2SjRiUVIvOENYd0dF?=
 =?utf-8?B?bmR5M2hwdjVGbHlNcjhpV3hOeFpFMEVNb2U0bm5tZnVMMnJQREltYzlLVFBP?=
 =?utf-8?B?dWtVeEhiUER1WHlpeFliSU16dDc2MENCRTZlcnNabkRoaFRqOTZrRTR2aXR4?=
 =?utf-8?B?UXlMVzd6MFYxR0ZSREl0WXRiRnA5WjVwODFJaEoyaXlUSGRWZjVnQnVKdVJm?=
 =?utf-8?B?OVpxVWlMVXY2enNOWjEvVzlHUG1scEZMT2lRWWRzMWZ3MENNYkdHSnVQM0V3?=
 =?utf-8?B?SEpxQXV4SFF2cWRJU3AvRVBDbGpqUWwwVlJIcmluNlVqNVRudnRhWEdlaEFC?=
 =?utf-8?B?ZUJqNGVOMmVub29lMWhwRjYxNEpmS2VUWHdXTXloZDF1YlpMeUhSbTJDb3Bu?=
 =?utf-8?B?bWc5S0paMWJySEFXNlJsd3JDNXBKUjRjaytHN25QcVM0QmpSdTdBYnlFcUxW?=
 =?utf-8?B?YjBpMTlrRHgxR2JRK2dyN2tVWi9jQWhPWitNKzFFQUhPOHRZb3dQQUJ6ckUz?=
 =?utf-8?B?QkkzNkNxSFFvV2NGQ0Y2NE1qaElRQnh2dUpSWW0veW0rRFBzUEZRZmI3SkFS?=
 =?utf-8?B?eEUzSXcwOEc3eGNFZFdOQ0VDWXJOSWhMNFlpZ0c0dTRQM0RkZlM5cGUvVFlW?=
 =?utf-8?B?KzVnaDBMbU5rQzRKalpQaTg5SkNyaG9DZUhJUGtFNXk2QUJ5bTArL3p5ZURu?=
 =?utf-8?B?MzJkTCtvdzcxc2NDZEVBWjk4RGhCTTZqUlNCaHRzWGhwNkJjNnVDU1lmWUlp?=
 =?utf-8?B?MHQzeDBaekkxYXZsWjZzTzhhNXloaDFKV3I3dzBCdnRFQnJ6VUZnMGROYWI0?=
 =?utf-8?B?eUxZcUxZMUQ3MFZTM3M3NytpNEVXU2hZYll1amtWdk9adExoLzBpUFlGT253?=
 =?utf-8?B?cmtibGx2L3ZMRUJUTFh3TnlTTzg0SHNua3lyejVNWmhLRm9kdDdDaHo1bmFL?=
 =?utf-8?B?c2FLR2xueWgxRHJRT2w5SmhWRU16WElsV3lqY1NiMlA3eUxROEdmUDZlekJa?=
 =?utf-8?B?OTV1T0wxTW9tYmZOeEJrRG4yZ3FLblZES0MwVUtMYWFsc3dudHlxZHFyWVZF?=
 =?utf-8?B?NTBJdXpXdWQzZTVFWnFGekxDY0lVSUhSbHlGYktHZ0lkeFZuWDhFU0xkTzhm?=
 =?utf-8?B?b0t1aGNPQXd2R3cwVlV3YWN5dDdwakw4OFphNGlrVC8yRTVqUXZDQ2ExTjZt?=
 =?utf-8?B?QzNwdWI3SFJEWE1jdnBwK2QxYUlTdElaSnllc0RERW5FNjVnMW5RTjNWK0dw?=
 =?utf-8?B?QU5oY3BOb3N5NGJsZURFL0hPT0xpcnhTblJ0dlA0N1ZQbjdpM2pMc0Z4WXYy?=
 =?utf-8?B?cVVtenlxeXovNEtPbzNkMVFScWZhQ1o5V0d6YURHbjh4dCtPS2Q2R3lWbkF5?=
 =?utf-8?B?U1BLVDQ0dVZneTdaOU1XSTVuUkFnVHl0OThwRVphMFpjL0FkTFE0cm1EdndN?=
 =?utf-8?B?UzlLWjFiNGQ3OEVMMkhRVUVFcVZCeUdtVElZczNUWEYwQzBTRmFCLzYxRHpn?=
 =?utf-8?B?cHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cce9698d-3fa5-40a9-00bc-08dcf433ae47
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 13:56:38.7959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: emgMbQcsxxkXh1jW1se6jgGclMRE5Zj4LS2u5Aida8cjVag+SS9+is6Zh5+ihWqLivWQjuHSIGmLaYMwhx7QfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6089
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



On 24-10-2024 18:42, Nirmoy Das wrote:
> 
> On 10/24/2024 3:00 PM, Nilawar, Badal wrote:
>>
>>
>> On 24-10-2024 15:47, Nirmoy Das wrote:
>>>
>>> On 10/24/2024 12:02 PM, Nilawar, Badal wrote:
>>>>
>>>>
>>>> On 23-10-2024 20:43, Nirmoy Das wrote:
>>>>> Flush the g2h worker explicitly if TLB timeout happens which is
>>>>> observed on LNL and that points recent scheduling issue with E-cores.
>>>>> This is similar to the recent fix:
>>>>> commit e51527233804 ("drm/xe/guc/ct: Flush g2h worker in case of g2h
>>>>> response timeout") and should be removed once there is E core
>>>>> scheduling fix.
>>>>>
>>>>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2687
>>>>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>>> ---
>>>>>     drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 9 +++++++++
>>>>>     1 file changed, 9 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>>> index 773de1f08db9..2c327dccbd74 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>>> @@ -72,6 +72,15 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>>>>>         struct xe_device *xe = gt_to_xe(gt);
>>>>>         struct xe_gt_tlb_invalidation_fence *fence, *next;
>>>>>     +    /*
>>>>> +     * This is analogous to e51527233804 ("drm/xe/guc/ct: Flush g2h worker
>>>>> +     * in case of g2h response timeout")
>>>>> +     *
>>>>> +     * TODO: Drop this change once workqueue scheduling delay issue is
>>>>> +     * fixed on LNL Hybrid CPU.
>>>>> +     */
>>>>> +    flush_work(&gt->uc.guc.ct.g2h_worker);
>>>>
>>>> I didn't get the idea of flushing g2h worker here. Moreover AFAIK tlb invalidation is handled in fast path xe_guc_ct_fast_path i.e. in IRQ handler itself. Is this change solving the issue.
>>>
>>> AFAIU g2h worker can also handle TLB_INVALIDATION_DONE message from GuC(process_g2h_msg). This indeed fixes the issue from me for LNL.
>>
>> Agreed, it does handle in the slow path as well, but upon receiving an IRQ, it will be managed in the fast path.
>> So I suspect this is a case of an G2H interrupt miss rather than a G2H worker delay due to the efficient cores in LNL.
>> For now, this change can proceed as it is helping out, but considering the possibility of an interrupt miss, I suggest debugging from that perspective.
>> In another thread, Himal mentioned that this issue is also observed on BMG, which strengthens the possibility of an G2H interrupt miss.
> 
> 
> on BMG and DG2 the signature is different, TLB timeout happens after GT suspend which shouldn't happen. So I am treating both(platforms) as separate issues
> 
> and for LNL the issue appears on BAT so targeting that 1st. On LNL, we likely have both issue, scheduling and possibly the interrupt miss. This helps on LNL
> 
> and I am going send a v2 with platform check so this doesn't interfere with the other bug on BMG and DG2.

Fine, platform check make sense.

With that this is
Acked-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal

> 
> 
> Thanks,
> 
> Nirmoy
> 
>>
>> Regards,
>> Badal
>>
>>>
>>>
>>> Regards,
>>>
>>> Nirmoy
>>>
>>>>
>>>> static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
>>>> {
>>>>           if (!xe_guc_ct_enabled(ct))
>>>>                   return;
>>>>
>>>>           wake_up_all(&ct->wq);
>>>>           queue_work(ct->g2h_wq, &ct->g2h_worker);
>>>>           xe_guc_ct_fast_path(ct);
>>>> }
>>>>
>>>> Regards,
>>>> Badal
>>>>
>>>>> +
>>>>>         spin_lock_irq(&gt->tlb_invalidation.pending_lock);
>>>>>         list_for_each_entry_safe(fence, next,
>>>>>                      &gt->tlb_invalidation.pending_fences, link) {
>>>>
>>

