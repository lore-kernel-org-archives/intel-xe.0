Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D70C04FFE
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 13:53:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C526B112AB3;
	Wed,  8 May 2024 13:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="feEABdXY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6891210F695
 for <intel-xe@lists.freedesktop.org>; Wed,  8 May 2024 13:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715176434; x=1746712434;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=EQACvu1z75yZ1Ajuov/AavLHMSetk9Dm7FUBcWiPSDk=;
 b=feEABdXYj1LddOOtKIqsdxe4K6HFWwrrJqeSZnJETVCwEPcGME5sGwi8
 9Nso2WCtB08mEfX67hQ4itmv9b1QBxnvuFcEzw94UrvGPosBqO3gyGX2q
 aOLUsD0j6GEsqEZe6t7+NB95t8ixSSVsty+VYjbKC0fNL4SntiHFaDK3u
 jh2geSUORROQETLBo4qb6hoJWsLtod9IiHK7m0a1KAKbDK/Z1qj+vb00x
 v0YMFCKgV5fxtRRdGGeau/xR3O+PIEe8TsyuBH0vMTNJvTnhLff8C+EL9
 bozU6vgi2vPeh3P7c0GRc6vLgfA/QmtMOwjrJsKOpSrOrNio6tHxZBMEr g==;
X-CSE-ConnectionGUID: mBuP7MYBSTq5oZLjI1ZrAQ==
X-CSE-MsgGUID: gmEsfpppSMOJLUYLaTSMGg==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="22443842"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208,217";a="22443842"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 06:53:54 -0700
X-CSE-ConnectionGUID: Tfh2taTZQx2+JaDtj5mlnw==
X-CSE-MsgGUID: VwaWj5gkTP2OPcAuQIphXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208,217";a="28856305"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 06:53:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 06:53:53 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 06:53:53 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 06:53:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nTw4zUIYMkfxFPR7br2l8Ns9WaM+C9jL9In4jakpGZgupNZWpkwuPvD493Lrqmrp6NR0xwzFwUu99tX2yAippUhgsAXpCUWNE5N865EoDrqu2FO+YQ7Q3kMLfWYuUeU0Ql0N3k1E+k+J6alZW2NnqW7yMRBr3bUpVrYMZqKDd8hKvXmeEzfn32CBwNfJWU89VNPS+c8drChh2sTCzBCl6SHocEmpQhl6V7bE/BiQY3NxnOq7Zc4MLWjwCC886wXzW/DbwmYOcIo+L8MR3aYnUta3M5tkXaFT6UuVVEa1UjpoTrBhNynDKIFHoUVchJgmAz3Q9c+SfN0OFgS/juf61Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sjq4jiZt17qkOKBx7xzz9XtjxW/EJBD/dtWgBC33elo=;
 b=lvfelutpT5iFefWQ5oQmfgLJmsc7mtf7LeBAkb8XqW6ypZIdpg2AIkk1DGZMQKAeO4e2DbtZ/t0AhcG6GrnTGPvf/81vpy2wW5H7QNYsE2iXfk/eJdPh7ycG1XC+XQNzoe/vkm7W/uFbNoAoQkSdrc6a5YAkCkrSv8Grd/MPjuPf2jq6u1P/ApCzL6zLdeB5okKbpyvxdmyNXSB4Mn7K9gixYyWvqgil/zo8DqzbDL5ZGVitPlFJNe0hLPDsw8w3diWDyZVJqBpa3g2ZHT7KVzRqbpG2XFOUlt3h9NnjUG/c/QDz5Slq7WX96QU52O1jBDer0oqUL2JiMRTE3ToUTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH0PR11MB4839.namprd11.prod.outlook.com (2603:10b6:510:42::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.43; Wed, 8 May
 2024 13:53:51 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7544.045; Wed, 8 May 2024
 13:53:51 +0000
Content-Type: multipart/alternative;
 boundary="------------gfmtHH0WQSFVZ989e8vxlRkI"
Message-ID: <5c7532e7-27a7-4247-9884-b13f280142e4@intel.com>
Date: Wed, 8 May 2024 19:23:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Change pcode timeout to 50msec while polling
 again
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20240508034328.3233072-1-himal.prasad.ghimiray@intel.com>
 <wqypeux2mnfci7vunszwywbjnvb6t7bmva4egb2u2kcbb4oe3g@244w2z3fnogz>
 <Zjt3P84Fn5mMDn9w@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <Zjt3P84Fn5mMDn9w@intel.com>
X-ClientProxiedBy: SJ0PR03CA0269.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::34) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|PH0PR11MB4839:EE_
X-MS-Office365-Filtering-Correlation-Id: c4dc1d10-a6d1-49ff-1eb6-08dc6f664adf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OTdwMFZaSk9wMXc4ZUpWaEsvUDdSeWE0UmpQaXBzcGhrYkRHcFhoeFlOeU5n?=
 =?utf-8?B?cWpMZ1RUU0duVnYrR3dqb054R1BvTVVrL3pnWmJxd1U5akJ2OUN5NEZlN1lq?=
 =?utf-8?B?SHh6Mkw1Rk1uVGxEUUx2dE9BU1FDOEkzOEgzQlNKV2FZMEpMK3loYmY0SmEr?=
 =?utf-8?B?RUN5cDROcS9wMC9KR3RtUWRtVVQrMXNGM053RHcySlQ4aXhiVDdBWG1US002?=
 =?utf-8?B?VjZVUk1nVzhUWCtjd1gwL0YrWXVETjA2UWRiS3RvSjFlZ010V0VsaXFLTDI2?=
 =?utf-8?B?N2p4WU1FSHF1cTNLWFJSQlB5bi9OOVZqd0Jvb3QwbU56Z2pSSGgxQ25TYWVL?=
 =?utf-8?B?NThJSkZHTjRYamg2ZnZ0OVRabzNhem1hMDVOUkdJUTRZZU43QmFXbnF6TkpI?=
 =?utf-8?B?N0UrVGdmWElzQzcrdXREYzdUa04zeTZ0L0VTK2xKY0hKT3BEWjJkTjFvY3VJ?=
 =?utf-8?B?cHF4TlhlVUlibE0ybUZzdHU1TzhtbG03RkFuSVR6L29qUHExbS9FMUlFdXdN?=
 =?utf-8?B?dkRQRDRMeXAyNlpldDlWaUtIQzZMVTVYWXBvRmttRHlMUHFaSXFYSFJLSXlH?=
 =?utf-8?B?Q2tDZUcvRVovV0lQSWhic2lyUnB3VE1XVU9kN1VuaEVPVS9TbjFuUENNNW5t?=
 =?utf-8?B?bjlvS2xZS0kyT001ZXZqUEJ1V21xVnVtKzkyalZ2SzJybmVOMlR5cVZ1NjBn?=
 =?utf-8?B?OTJRTFpqNDUzL2Z3QXpNbVd2NWhKWTVCa0VOVUdHNStyNEh2OXY5SXpLdWJm?=
 =?utf-8?B?ejJMQlVyYmk4SWlYU3k1NDlJS0dFdDFJdEJNd1NCWUV5aVQxaWRleHE5YUM4?=
 =?utf-8?B?VDlOL3JDM3VaK0IyVWxhaG9ReklhbU0ya2JxOFl3MGlxTklQcmNGNm1EY1dz?=
 =?utf-8?B?cm42WkhJbGcvbDJKaVVaSUc0c2hlT05RZmd1citENmR2bkhxWUxaU2JTdU9M?=
 =?utf-8?B?RTZ0ZVVFK0pWUmhEUXNwSFJWS21PYzl6R2FjT2VLeWlwa2YyVXVRWUNaR1NR?=
 =?utf-8?B?M0hPQXQ2Qjl5NXVzaTVIM2huS2hKLzJyYTJ6OWhZcVdxMk41c2pGdjVXc09G?=
 =?utf-8?B?WVVDVjZvbnlMWmFVSTY5WC9HbFN2bVZmbjV0QmRJcXp6VURWT0VmTGtyOFQy?=
 =?utf-8?B?dGNhdUY4QzUrWGt3eXFkUldTZHJBTyt0NS9TTTkxWU12d3JGOEpoODZQVExM?=
 =?utf-8?B?UVBDanVXNWNBMzdvcHRkTlczbVV6c1hwTWR6Z3BoaUdhWUNDODBFV2dvcEpm?=
 =?utf-8?B?VkJHcmZrMlRYRHc4MEZWTWtIdlpyV3lsTEJiM3VSSlZTb05IZ1FsZjlncTFC?=
 =?utf-8?B?S1BzTE9pYjcxVitHd051ekNyS1ZlWVgzVDN3ZWRobTZGcGd4ZVlVa3BzcDRp?=
 =?utf-8?B?RE1vT1owWXh2YWd2SzNVb25IdVpLVnQ5a2V0emV0N2N6WTR6Z2l4Z2xTQy9Y?=
 =?utf-8?B?dzkzbWxqNTFSSExCRHN0bm01QTV3Nlp5Zk1uTnNXeHFjdU91dm1HQlgzWExN?=
 =?utf-8?B?VUlsc2dUQ3NzdUtxTG0xSWxrL2xybmdyYkQvRzEzc1VkRDNuaVBjYnMrVWFV?=
 =?utf-8?B?bmZ0NFZqeTZ5bnlKQm40SkZ6RHl1and6RlVyS3MyOFY0TSsrVnZHWEpJMEVo?=
 =?utf-8?B?ZmpkNzREUm1QcklON2YzT3Y4cFJ0MzRpeTE0U0RTeTJpdUthUDFQb0NZVHhX?=
 =?utf-8?B?NXdLVzcyUnRIV0NjRlZYVWNLSXhFNGZ1WVFudGNCWTY4eXRwMFgwQk53PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFlCSlBWcjNUYXduYnVBNFRQOTJULzFLOGtqWk9YVUM5TkJuWVM2eUFxd3g1?=
 =?utf-8?B?cmFncFVvUnNjSVViY24wbExER2J4cWRRSjZiNTQrTjl4WE9xbmZFRWlCbjl4?=
 =?utf-8?B?SXQrdit5ZUliR3FmM0k5dGEvMkxqVmZGQlVJbjRIOEZBV2htQ0ZGVktPOXdw?=
 =?utf-8?B?WGFOUE5BYW9TRVZCT1JzeVNES3FNdmM4RkVkYXlhTXdRUUovOXlGREN0c3B3?=
 =?utf-8?B?T08rRDdoREZZQUx6dmF1bDBSVG1TYlNoOXhHSXFuYTExazVGUTh6ZTlTQnUv?=
 =?utf-8?B?UjBtZGpIaFJ5WU4xZk5wcE5CcXpkaWg4dFhjZDZrNkcwUGpBc1JpbmNvLzV1?=
 =?utf-8?B?Rm5JMUZQUDl0b2N2d251SitkMzlsNjdMdWw2VDZYN2kzWkZuUGZ6MlhxSXpF?=
 =?utf-8?B?K0JnbFNyYVlCVUFmNCtzOUJjZkFZQTQzRmFwWnVrZEZvcTNqQnh6WXAxNVJk?=
 =?utf-8?B?M3NFTml2Q2NtRFRxZ2sxdnVpbTlLU1NuQmUwYmFVaFRnbE9rSi93bTZld0RD?=
 =?utf-8?B?U1JzUkdjZzZQM2FFRFRJNTdLTXg0azh5WWNWc3NPaHRhcUE4dHV0ZThBdUpv?=
 =?utf-8?B?Y3VLWXJtYjJQT0s0MEdTMEcyT1RKL1NBZXp0RG41YmVFbzhTZ1lJYVV3YlJ2?=
 =?utf-8?B?emVtVHVNK2N4WHdYYkJhSkFBTmVqRmt2OXc0UmxwSEJTMzF5M1pXZkw3OHM1?=
 =?utf-8?B?NXN4KzgyN3ErYjNPems2V2J0VElvTWJCY2xDcUNsMElJaFFYNlRYS2g4WXRa?=
 =?utf-8?B?MWhOM1h2Z3FjcktQbFhkT0NvSThHTWVHYmhyd240Z0dxZzA4d2JkTmNYSjJl?=
 =?utf-8?B?YWtJK05vR3pHSTFtcGdjZlJUK1ZNWk5yY01raW0vcG5VR0xiM2RxOWIxSjZk?=
 =?utf-8?B?cWxqblpBMmF0SVhpNlVzK1UvcS82TTYrWGkxUlBhUFVQTzhIOTRQdlJzU1Jv?=
 =?utf-8?B?QVBSNWtOL2paLzdMd3U5L20vOTBkaDdkRklpMHJHVFlMMXNKckFLdldEMWEr?=
 =?utf-8?B?bkRjZkh4bDVnNFBReHovTEc1bStjZWtWdVpVMXR1QUlsbFJpVFRNa21iRW45?=
 =?utf-8?B?NSt3OERiL1phblUwRlRjN1oxc0R3MTR6MWNtKzdZSUF2OVp0MUM0aW4yNlR6?=
 =?utf-8?B?UTRkalZsQ3lkcG5Ra3l5UlVGY3JpeXlJbDJUUGdIbGpuSXFPZUk1c0orTjV6?=
 =?utf-8?B?NWNHdyt1WENWREJqN1JlY2NTRE9qRFFUb3drZlJ2T2hET015N0RSaVVKM0pO?=
 =?utf-8?B?bnMrVFBsWWFjOVBFdkljNGd1YlA4ck0wNjU1cW9GWmtpOWFjQytLTVJ3eU5H?=
 =?utf-8?B?VEo2OXh4UCtqRWowcCtkNVRmcXpDb3ZTdG05TVU3Uk9NcGU0My9qbEFLUlBE?=
 =?utf-8?B?cU9pUmx5R2VqbC9MZ3duRGswTUN6RlpiZVpoQStzNnI5MmNWR1JkcmxCckJz?=
 =?utf-8?B?QjBXYTB3Yk9SWEppVUx5cnpHRXNONzJTRGpEYUdUQkQ1MWFSSnpUWlpxS1ox?=
 =?utf-8?B?TkRhYWZWUDhzbUZFYzgwaUZXdHlFeFdLTEU2OVRoNnFyVDdVNWo2UExPRHUx?=
 =?utf-8?B?cjFOZXRONkhzTkROQkVOeVFSd2JyMjdJU1Z2MzExRlVqOG1Ub2dkbmhBZUwz?=
 =?utf-8?B?ZWlaSCs2VTVQK3RJYk84U2JMODJHL0RUNGJqRGFtUjBUblhYUnQ2a0F2MllV?=
 =?utf-8?B?YnU4Y2NFK0c1M2s4Q3lNVG5SdnlBTFJSbXpreTZCbzhEVHZoVnBkd3ZPdTJG?=
 =?utf-8?B?SFhMNnAwZ2FLNkpYdTdXZzk1L0ZsN0hScktETTdLWmhmcTZhRjBJbnNVSTN6?=
 =?utf-8?B?T2tyOEluVTN1RGFNaEprZE5MdmtpbzE4QUlaVVA1WFhhL2lYbTJ4ZjluS0RI?=
 =?utf-8?B?MUxuU29wbGYzMzI0REtaNVVtR2kvcEVmV3BjZGZacXdycWptNGNvOHhxOXI3?=
 =?utf-8?B?bGlzQ0M5L2dhbFovOUpvbjlqL3NQVXZnVkZOZUZ2U0RXeHAvVmsyUjEyc00x?=
 =?utf-8?B?a1BWUXJNOU5yN3FjSXB4eEFWV1htY1R2SGFzSnVIcUFUT2FURVY2ZmtYNng0?=
 =?utf-8?B?b2VmMkU1NHo3WDhIM0RpRlhOK3JjSkgwNWtkVVNjcG9QVzl6cjBjYjl1NERk?=
 =?utf-8?B?WVYyLys2UzV6b1VEd2tmWW92Q0RYYTNIdHViVUZQajgxTW0rS280dFZYZXBL?=
 =?utf-8?B?c1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4dc1d10-a6d1-49ff-1eb6-08dc6f664adf
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 13:53:51.4448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R5D6z738VLe49UKoy7NCt4HiclaBLcKYB7uBIJSqEueCvQQwxJH3S+PvHfv/kmi+szteLZoKC9+H7l9V3+c13BPZmHrivNlX4U3xempZmGc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4839
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

--------------gfmtHH0WQSFVZ989e8vxlRkI
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 08-05-2024 18:29, Rodrigo Vivi wrote:
> On Wed, May 08, 2024 at 07:55:10AM -0500, Lucas De Marchi wrote:
>> On Wed, May 08, 2024 at 09:13:28AM GMT, Himal Prasad Ghimiray wrote:
>>> Polling is initially attempted with timeout_base_ms enabled for
>>> preemption, and if it exceeds this timeframe, another attempt is made
>>> without preemption, allowing an additional 50 ms before timing out.
>>>
>>> Display driver can request for timeout of 3 msec, hence modify the
>>> warning condition.
>> this seems like a separate fix?
>>
>> afaics below we have:
>>
>> 1) fix the warning to consider the display case ... and shouldn't the
>>     warning be before the first pcode_try_request()? Why do we want to
>>     warn before a fixed-duration rather than before the variable duration
>>     passed as argument?
>>
>> 2) change the second timeout to be a fixed 50 msec rather than 1msec so
>>     it follows what was actually documented in that comment.
> (for the 1 and 2 I was okay with having the squashed patch tbh, but
> yeap, probably better a separate one)

Sure. Will separate out.


>
> 3) status = 0;
> (this was not even mentioned in the commit message, and I noticed
> after the fact when I was about to merge it. Sorry about that.)

Oops, I missed removing this in the patch. I'll make sure to address it 
in the next version. Thanks for pointing it out!

I have also added assert |xe_gt_assert(gt, timeout_us > 0);| to warn if 
the user sets the timeout to 0.

Do you think we should include this check in patch 1 or patch 2, or do 
you think it's unnecessary?

>
>> or maybe I'm missing something here... could you clarify?
>>
>> Lucas De Marchi
>>
>>> v2
>>> - Rebase
>>>
>>> Cc: Rodrigo Vivi<rodrigo.vivi@intel.com>
>>> Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
>>> ---
>>> drivers/gpu/drm/xe/xe_pcode.c | 9 ++++++---
>>> 1 file changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
>>> index c010ef16fbf5..2771eed1e45f 100644
>>> --- a/drivers/gpu/drm/xe/xe_pcode.c
>>> +++ b/drivers/gpu/drm/xe/xe_pcode.c
>>> @@ -10,6 +10,7 @@
>>>
>>> #include <drm/drm_managed.h>
>>>
>>> +#include "xe_assert.h"
>>> #include "xe_device.h"
>>> #include "xe_gt.h"
>>> #include "xe_mmio.h"
>>> @@ -124,6 +125,8 @@ static int pcode_try_request(struct xe_gt *gt, u32 mbox,
>>> {
>>> 	int slept, wait = 10;
>>>
>>> +	xe_gt_assert(gt, timeout_us > 0);
>>> +
>>> 	for (slept = 0; slept < timeout_us; slept += wait) {
>>> 		if (locked)
>>> 			*status = pcode_mailbox_rw(gt, mbox, &request, NULL, 1, true,
>>> @@ -166,7 +169,7 @@ static int pcode_try_request(struct xe_gt *gt, u32 mbox,
>>> int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
>>> 		      u32 reply_mask, u32 reply, int timeout_base_ms)
>>> {
>>> -	u32 status;
>>> +	u32 status = 0;
>>> 	int ret;
>>>
>>> 	mutex_lock(&gt->pcode.lock);
>>> @@ -188,10 +191,10 @@ int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
>>> 	 */
>>> 	drm_err(&gt_to_xe(gt)->drm,
>>> 		"PCODE timeout, retrying with preemption disabled\n");
>>> -	drm_WARN_ON_ONCE(&gt_to_xe(gt)->drm, timeout_base_ms > 1);
>>> +	drm_WARN_ON_ONCE(&gt_to_xe(gt)->drm, timeout_base_ms > 3);
>>> 	preempt_disable();
>>> 	ret = pcode_try_request(gt, mbox, request, reply_mask, reply, &status,
>>> -				true, timeout_base_ms * 1000, true);
>>> +				true, 50 * 1000, true);
>>> 	preempt_enable();
>>>
>>> out:
>>> -- 
>>> 2.25.1
>>>
--------------gfmtHH0WQSFVZ989e8vxlRkI
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 08-05-2024 18:29, Rodrigo Vivi
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:Zjt3P84Fn5mMDn9w@intel.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Wed, May 08, 2024 at 07:55:=
10AM -0500, Lucas De Marchi wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">On Wed, May 08, 2024 at 09:1=
3:28AM GMT, Himal Prasad Ghimiray wrote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">Polling is initially attem=
pted with timeout_base_ms enabled for
preemption, and if it exceeds this timeframe, another attempt is made
without preemption, allowing an additional 50 ms before timing out.

Display driver can request for timeout of 3 msec, hence modify the
warning condition.
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">
this seems like a separate fix?

afaics below we have:

1) fix the warning to consider the display case ... and shouldn't the
   warning be before the first pcode_try_request()? Why do we want to
   warn before a fixed-duration rather than before the variable duration
   passed as argument?

2) change the second timeout to be a fixed 50 msec rather than 1msec so
   it follows what was actually documented in that comment.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
(for the 1 and 2 I was okay with having the squashed patch tbh, but
yeap, probably better a separate one)</pre>
    </blockquote>
    <p>Sure. Will separate out.<br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:Zjt3P84Fn5mMDn9w@intel.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

3) status =3D 0;
(this was not even mentioned in the commit message, and I noticed
after the fact when I was about to merge it. Sorry about that.)</pre>
    </blockquote>
    <br>
    <p style=3D"border: 0px solid rgb(227, 227, 227); box-sizing: border-bo=
x; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0;=
 --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-=
scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ;=
 --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --t=
w-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --t=
w-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numer=
ic-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-of=
fset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-sha=
dow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 t=
ransparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightn=
ess: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ;=
 --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; -=
-tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscal=
e: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opac=
ity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: =
; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ; margin=
: 0px 0px 1.25em; color: rgb(13, 13, 13); font-family: S=C3=B6hne, ui-sans-=
serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cant=
arell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial=
, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI=
 Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: n=
ormal; font-variant-ligatures: normal; font-variant-caps: normal; font-weig=
ht: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent=
: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-str=
oke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, 255)=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;">
Oops, I missed removing this in the patch. I'll make sure to address it in =
the next version. Thanks for pointing it out!</p>
    <p style=3D"border: 0px solid rgb(227, 227, 227); box-sizing: border-bo=
x; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0;=
 --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-=
scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ;=
 --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --t=
w-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --t=
w-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numer=
ic-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-of=
fset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-sha=
dow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 t=
ransparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightn=
ess: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ;=
 --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; -=
-tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscal=
e: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opac=
ity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: =
; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ; margin=
: 1.25em 0px; color: rgb(13, 13, 13); font-family: S=C3=B6hne, ui-sans-seri=
f, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarel=
l, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &q=
uot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Sym=
bol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: norma=
l; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: =
400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0p=
x; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-=
width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, 255); te=
xt-decoration-thickness: initial; text-decoration-style: initial; text-deco=
ration-color: initial;">I have also added assert <code style=3D"border: 0px=
 solid rgb(227, 227, 227); box-sizing: border-box; --tw-border-spacing-x: 0=
; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-=
rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1=
; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictnes=
s: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; =
--tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-nume=
ric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-in=
set: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring=
-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-=
ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-col=
ored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --t=
w-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepi=
a: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; =
--tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rota=
te: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-satura=
te: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --=
tw-contain-paint: ; --tw-contain-style: ; font-feature-settings: normal; fo=
nt-family: &quot;S=C3=B6hne Mono&quot;, Monaco, &quot;Andale Mono&quot;, &q=
uot;Ubuntu Mono&quot;, monospace !important; font-size: 0.875em; font-varia=
tion-settings: normal; color: var(--tw-prose-code);">xe_gt_assert(gt, timeo=
ut_us &gt; 0);</code>  to warn if the user sets the timeout to 0.</p>
    <p style=3D"border: 0px solid rgb(227, 227, 227); box-sizing: border-bo=
x; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0;=
 --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-=
scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ;=
 --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --t=
w-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --t=
w-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numer=
ic-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-of=
fset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-sha=
dow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 t=
ransparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightn=
ess: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ;=
 --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; -=
-tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscal=
e: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opac=
ity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: =
; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ; margin=
: 1.25em 0px 0px; color: rgb(13, 13, 13); font-family: S=C3=B6hne, ui-sans-=
serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cant=
arell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial=
, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI=
 Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: n=
ormal; font-variant-ligatures: normal; font-variant-caps: normal; font-weig=
ht: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent=
: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-str=
oke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, 255)=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;">Do you think we should include this check in pa=
tch 1 or patch 2, or do you think it's unnecessary?</p>
    <p><span style=3D"white-space: pre-wrap">
</span></p>
    <blockquote type=3D"cite" cite=3D"mid:Zjt3P84Fn5mMDn9w@intel.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
or maybe I'm missing something here... could you clarify?

Lucas De Marchi

</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">
v2
- Rebase

Cc: Rodrigo Vivi <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:rodrigo.=
vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>
Signed-off-by: Himal Prasad Ghimiray <a class=3D"moz-txt-link-rfc2396E" hre=
f=3D"mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@inte=
l.com&gt;</a>
---
drivers/gpu/drm/xe/xe_pcode.c | 9 ++++++---
1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index c010ef16fbf5..2771eed1e45f 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -10,6 +10,7 @@

#include &lt;drm/drm_managed.h&gt;

+#include &quot;xe_assert.h&quot;
#include &quot;xe_device.h&quot;
#include &quot;xe_gt.h&quot;
#include &quot;xe_mmio.h&quot;
@@ -124,6 +125,8 @@ static int pcode_try_request(struct xe_gt *gt, u32 mbox=
,
{
	int slept, wait =3D 10;

+	xe_gt_assert(gt, timeout_us &gt; 0);
+
	for (slept =3D 0; slept &lt; timeout_us; slept +=3D wait) {
		if (locked)
			*status =3D pcode_mailbox_rw(gt, mbox, &amp;request, NULL, 1, true,
@@ -166,7 +169,7 @@ static int pcode_try_request(struct xe_gt *gt, u32 mbox=
,
int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
		      u32 reply_mask, u32 reply, int timeout_base_ms)
{
-	u32 status;
+	u32 status =3D 0;
	int ret;

	mutex_lock(&amp;gt-&gt;pcode.lock);
@@ -188,10 +191,10 @@ int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 =
request,
	 */
	drm_err(&amp;gt_to_xe(gt)-&gt;drm,
		&quot;PCODE timeout, retrying with preemption disabled\n&quot;);
-	drm_WARN_ON_ONCE(&amp;gt_to_xe(gt)-&gt;drm, timeout_base_ms &gt; 1);
+	drm_WARN_ON_ONCE(&amp;gt_to_xe(gt)-&gt;drm, timeout_base_ms &gt; 3);
	preempt_disable();
	ret =3D pcode_try_request(gt, mbox, request, reply_mask, reply, &amp;statu=
s,
-				true, timeout_base_ms * 1000, true);
+				true, 50 * 1000, true);
	preempt_enable();

out:
--=20
2.25.1

</pre>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------gfmtHH0WQSFVZ989e8vxlRkI--
