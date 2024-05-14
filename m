Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 111B7C04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 06:49:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B456B10E1E6;
	Tue, 14 May 2024 06:49:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cnunk3Cp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A3C110E1E6;
 Tue, 14 May 2024 06:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715669354; x=1747205354;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=a2Xl2NXicieKV3WpRXG7VBz7Y6mhLg2xs84pMj81P4c=;
 b=cnunk3CpPoPmr4Enj4FvFv9736wSU22uTN84YBvHYcA3cMUlg0TnjHRL
 jUKVNIc0fvj+U107fcLjUC+4DOckTH1xIVul9Bmyx8JwqB/0CJUK0zZE2
 4VGuCsfCmT8FvHTrgol7NRJ16MTdkzwVxFx1eUwYgn4lNfwKeiNCJQlHX
 u8pk5WXbYq0NwplWYRV14kQvx6Va4Th5KGZ4d6f6Hyc88JYetXq0+Z5Np
 0AWITkUkCgnWleMY1Zkq3phxulM4dTIr4v0QzhztcBGCDPYs4GRiwyHSV
 Ltu0FxFoSGHMQWEAXb6gp1ClwZhUEHBUKNKi9ttm0urfidMie9QNntveU g==;
X-CSE-ConnectionGUID: rU+fzkUJTwWpGSwOVxn3xQ==
X-CSE-MsgGUID: qxpzzfYJTLq1IC5jCeFiGQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11490079"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11490079"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 23:49:13 -0700
X-CSE-ConnectionGUID: aVzmoMAtTOCfxmM0vlB64A==
X-CSE-MsgGUID: zhiyMC3oRvaPDMLylQEFtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="31136021"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 May 2024 23:49:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 23:49:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 13 May 2024 23:49:12 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 13 May 2024 23:49:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a4Pni1/LZbkaO3z4gej/JeEQlHpidoqHWo3nJ8RfCwX4ESfiYe0daJVyhZttKg8zpAtGanvxS1/hVY4CMoRa0o9WRMWzIe7KzE7SqZrYIK6yEEMJBQADp/p4ldhuHTAgKEw/Xy4UAb0mbZ/MSTkaB8ogylDHmBZc7VaUH3TlwX1kH89uFdd+i004vpBWJPT+R1DBCsz6vqlSxgj3qoqyh/eDvtDBAd+AYmcKpOXx8arC8Q3X4q6BONdsHyJ+ieEqql+4rgXozUrw2M1wRDb8sqKnwflY6is2m/fVtgTXYUNgPcQ5M0dfk5oYE1AsW+FZJo/zlfkVuX0PTQWUIR06WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lo/IMuMzIDPEPOsym84x0orVQs5pC9HY+sr7Tw0+NEA=;
 b=EHtTvocn6112Ey3gbZjBJLZChTyFHVDuPjavv/Zy+KX+Lh2TuBnOW6ieqRawNTQquvAqZPQ4cmdKeHgKIoSFDuteYsiGOA9ymXuxpIH+472KsulNSje/noaoqyWZIdPPr3/NifMH5c7TMF4xWml2XglNlSqqbvuVseoZAxMarxBwVdQhW2Ey36+/HdyQb8GECiP9JXZgAR7oCy15t0OoHY2LU2XssHAs/ynKGS5AGGXIffYqCL4eFk+3hUm67pHThd6E+Vlflr485sUQJeJOGAHVgbTd0BpP8Ix0MOJkOeCNKlyrgK9Y6C19bv31QivYjBWh4M4Nybxr+B9YIDkZbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 BL3PR11MB6481.namprd11.prod.outlook.com (2603:10b6:208:3bc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 06:49:09 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::301e:5fa8:50a3:3824]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::301e:5fa8:50a3:3824%3]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 06:49:09 +0000
Message-ID: <dda185b2-1098-4eec-9747-f3da68493387@intel.com>
Date: Tue, 14 May 2024 12:19:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/5] lib/igt_pm: Fix and standardize IGT PM library
 documentation
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
References: <20240513185518.772398-1-rodrigo.vivi@intel.com>
 <20240513185518.772398-2-rodrigo.vivi@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20240513185518.772398-2-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0045.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::8) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|BL3PR11MB6481:EE_
X-MS-Office365-Filtering-Correlation-Id: d2cc0651-c073-4794-4883-08dc73e1f4ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UTZ1NXNRTFNOb1VVd2c3L1RmWDcrdlpUc0hhV010MjlaTXNVRzIyNUg5WTdq?=
 =?utf-8?B?dVJmaGtvQVBhcy9JUXRtYmgxMm1uVGFpYXZsWGRGaEZlQ0ZtOEdwcjBxbFM4?=
 =?utf-8?B?VUY4L0UrUkdNcnpqK3F3eW01eFBvTE5SUGgwL2xjRU5qU013Vlg3dFBDaTRv?=
 =?utf-8?B?dWdVd28zamVyVXI2U1RMVzhjamtTK01BWDdtZE9GdG1tTXpicjl1SkNnM2J4?=
 =?utf-8?B?ZThEeFRWcFhkRk1OZmZmQmZpT2FOdW1jZk42TTlsYkJDYzRaQVJoeUxodkxM?=
 =?utf-8?B?c2MwVVZhZ3N3ZXFBelJoR24yTTRkcHJqSTlUaGMzRkcxTjBzeWFRQTUxbzlE?=
 =?utf-8?B?VGtDWms4NEEyZkJBR2xOWVNIVEhwQW5YZ2VSQVdZaGxuK2RhU2RLNEd1RjN3?=
 =?utf-8?B?OVR0RDBLZC93a2RqaU9kUCtVRVFjUUVSd1hwdTFmOFZmNU9VMWpZT2JmQ1FC?=
 =?utf-8?B?d3lzbG16YjR2eExpaGZ3ZFg4emg3SlUrL0hOUE9ubjIrdEd6QjIyTE83NFJq?=
 =?utf-8?B?VVRrWFlVZy9JbU1JSzk1aVVGOWcyekVnV0lpYWVtUlRtWWFnNHR6QUNMZU9N?=
 =?utf-8?B?UDdSTzBQQ0RKV1hsWFg5Y0RCM1IrM0owaDd1QktuV3dKekdQZUtqeVk1SERv?=
 =?utf-8?B?VHJGTmtTb1BRUkhYY0g2TWJmcUZ2L0swS212TS91U2lFQys0ZUxHeVYwb0c1?=
 =?utf-8?B?SmhCN1dVd1hjbWZ4alhJRkl2MTVGeHI1SFY0aW4zUzdDeW13bmVkd25WUFhl?=
 =?utf-8?B?RmxtbTV6NzFwZWx3M2RTOGY3TDNwS0lYRkYvbWQ5dm53MGtyMGNZMkJzb3BM?=
 =?utf-8?B?Z3JWUTZBMDZIYjBXZDJJSlI5VUswajNINnlnZ3BZK3BIbS9FUjhmNTg1VGJK?=
 =?utf-8?B?VWJWK2FsZ0RGWFQ0SS9FaktqeWJEbEljOWU5b0hwalJLMDNwU3F2TjJ4cFVi?=
 =?utf-8?B?aytxYkJEQVNQSk43TEI0NFJzTXNCMFpyRC9na1ZsQStOODBEazBUaURrMG44?=
 =?utf-8?B?anVrbkp1SUtxNzBRQVBhVy8vRUxlbHlvWitQOG5SVHlqbVU3ZGx6ZVo5VUN6?=
 =?utf-8?B?b092Q1FNUGpWZU9XenNUZjAzM3NsVGMrNGpITGxMRjh0OEpKNU5KRm9Pd2NL?=
 =?utf-8?B?K1VwY3YrOEJnNHgzbGJaeC80N3RsVjVKTCtFZGw3MitpTnhTM21aUVhNWVhE?=
 =?utf-8?B?QmQrWDl6NUdaSzNWeDVCODNzeDRGaVFwcFBpL05ZejJtQWE0TUdFSHRiYUNh?=
 =?utf-8?B?bnk4eDVrRXdOVzRaRlg2cmNNZnRpNjVUeHg2SVFlNm9EdTNRS2Z1OExIdEw0?=
 =?utf-8?B?SlFINVJwOFFoVzE5N1lSVVRzRXptbWoxbGErR3RLSGVQZmFQTXhlWENoaS9k?=
 =?utf-8?B?ckpOdm5YTks5UHBUT0hTUUp3cDBUZjd1N1VSZ2JlNCs2LzhlaC8yMmVGT0lz?=
 =?utf-8?B?V1VrS093MDlDeXRkU2VDL0RwUUFQQUxLcHkxWDJNVi9VcVVXV095bVJqVkFT?=
 =?utf-8?B?ZzJPeFVKZ0pqQ2VIUnNpS3RrQmM4UWNsWEZnWU91ZUpjNkFYb1NhZ3JuU1dk?=
 =?utf-8?B?Q3M3L2ttUlNVMHY3SEhOaUk3SDZ3Z3M4azV4Q0hMTUhVRVVTc2J3YWdlbEFV?=
 =?utf-8?B?UnYzVStHOFg0SDYwV24xaVR4dlkyM2pTaHB1WHhoWDYvTjVURFVWaVMvOHQx?=
 =?utf-8?B?dms3S1pXOGkvdmg1RkJEMXI2b2pvQ0JKVTdYNE8vSHM2RC9SbGtPb3l3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFZIbEtSR0E5Z1V6ZEJhZTFUTFppcDZZUkpacGxoMjBwRk1mSk5tVVNqL1NH?=
 =?utf-8?B?WXVFa1pvRnhBT2YyVmFxeFJOaGxjY1kwOENFREtJQ1hsRk43YjV5NW5nTk5u?=
 =?utf-8?B?SCt3KzJmcFJRMGpLR3QvUHVlUlJ4emlZcnVaeE1lVTZ2TEtKSmw3RE9YWEta?=
 =?utf-8?B?aWQ0LzFVNGlTZ0FqQzNCWENDeVplMzhFNzJ0SzRSeWlQT2lzMzdpUDRneGlR?=
 =?utf-8?B?emI2OUhOTS81RGp4dUwxZUN1RDdXajZsSGdreFMybUEvSVBmY2VMYlFLU216?=
 =?utf-8?B?SDUyaCtLTnRPTVR4blQzQ3lnVnY1cmc4S0g3cFI2L0l5UU5ub3NaZnFDK2ZS?=
 =?utf-8?B?STlsNHlRQVhmL3Z5NEFvb2pxMnNsbkREVjZGaEk3YWo1dG9lYlkwWWtXYjVr?=
 =?utf-8?B?RXduR1h4RzRLOTFXekFYek5ncjhyVitCbEJTYlNyWGwyd3lhMjZyVmNpSE43?=
 =?utf-8?B?THRqQ1VDKzcxa1lzVUpWU2FNMGVadTdqTTIxYXN0eStaTi9KNzlMcGh3RXV3?=
 =?utf-8?B?cVdqSDBnMTBtMDFYTmF1Mmo1UTRrLzM0Y1hMYjJXaUdVak9IaUFDL1QvZGxu?=
 =?utf-8?B?a2JwcjVOSnNJMThrU2xSaFFMOE8zZlkzUkFiL3NXTHNhM0pxYkhiNENkSFhD?=
 =?utf-8?B?Wk5RWlF4bEw4NGFYenEzQWl5U0ZSSWhHQXdmWUErR3N6YVRaNm5lV296MVp5?=
 =?utf-8?B?U1dDRzB3ZngyRUw1K01PeHZRTEllaFBrc2RTRUswSC9WMFVZenJDS09ZUWFZ?=
 =?utf-8?B?YmFodEtjQVhlYjlDaXBwZTdQelJzc1c3U2JoQ25PTitZczZXUmZQaFZMTWt6?=
 =?utf-8?B?OEpVL2JveHczbFBhTzJwRFNJaENmUDhnM25XS1Z2elBDTDdzZ1RtT2Q5di9Z?=
 =?utf-8?B?VVFvR29SZHQwR3BkN2FjSjFudlhnVlc5NVFPNnIybWJLM1ZpRmV2bHlGaXNB?=
 =?utf-8?B?eUtMWjFLWmZGdkF0MHZySTAwdUJHN0Z5T3F0cE9oM1RoRkROMlQ4MmQrRThU?=
 =?utf-8?B?Y0ljelJ0OHZQTTN1ZFppa1ZTY1ByNy9pczgzMEFMWlJPTkZkb2dUa0tEdzBK?=
 =?utf-8?B?QmkyWUNRNFdjV2NqT1VINTRObzRnajFTL0NKL3NzT0t5SC9JWUxDaGppWDJO?=
 =?utf-8?B?NVVWKzlkY2gzTjllUEw4YzhiamlpT2g1ZDBpMG5nMEttR1RmSmdMTzRiZUgw?=
 =?utf-8?B?dmZLTmJnNitLeE1RM0IzcDg0ZFBLTUhaMU5ES0tMMlR5b3pzd0V3TGNwNGhz?=
 =?utf-8?B?VTZQakZzYnI1U3Fkak9YdjFDYjFES244aVBrTWNIa0dxWDBxOE5NSUd1dG16?=
 =?utf-8?B?dlAwWUNqRTBLTHo4WHRqUkcvWnJPWnpMdWQ5QzJLa01CeUJCc0V3VnB6U3ZC?=
 =?utf-8?B?SFJzMGhHM3ZqdXdCMG9SbkNDWm5PUFhHSWFpVzBIYjduU2tlNXh4RmxuQTRP?=
 =?utf-8?B?aTV6S1dka1BYSTVkajErRk9GbHRRZ2FPVTZ2Y1EwdG14dHdBb3gyeFM2eUJq?=
 =?utf-8?B?U0piSGtZc05VRUdWU0JFVXh1ODhYeTUxZHk1SlI3QndQRXV5dG81dkNVVDlp?=
 =?utf-8?B?MmFYUlJWbTFKSWdkZFlGN3lGYy9Rcm9kWmVwdXcvckdXVkFtVjdjNDR1Wmc5?=
 =?utf-8?B?UXJ1VThMUllTWFN4cUlaUDNSR0VKOGdnMWp3N3Fwek1rRTVHcVpvR1FTY0Fp?=
 =?utf-8?B?RHNLR3lYbDNmVEZRcHU3dlV4M2VEQTdEMndUWmlDNkp1ZHl4THEyaU54dHA0?=
 =?utf-8?B?dzJhQ2dIdCtacE5xeWNsQ3Vaa3V5QTFUSnk1VXBnSllzNFN4UHo1WCtXbVkx?=
 =?utf-8?B?OHFUNTA4eFZlRmh1R21kTlUzKzJEUm5uSXRybTd5Y2FoMXF2K3R6WHNqQTVZ?=
 =?utf-8?B?Sm9iNFlzV3dTTlhjSmxoMmFmVWd0ZVZhVlB1aUEvQUxadyttbGNyY29rVmJi?=
 =?utf-8?B?UnpSYXFQVEMzRTRmZEt2Y2k3L2U1STBPanhWZlRQajhPMUtSZklPWkVYQXhh?=
 =?utf-8?B?UktDcUR2M25XcG4xQjZ6SW5QTnAyazYvcDBQWWg4RncwMHZWU1NEZmlPZVEy?=
 =?utf-8?B?YlR3MU4zQUVDUlVheFp2SkhBWVAyMGROZVdMRzlBbjEzK282Tk04eGNBMVBX?=
 =?utf-8?Q?+9jcgDtLeoTn/52g3TJL0AJHO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2cc0651-c073-4794-4883-08dc73e1f4ec
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 06:49:09.6894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iKncHX8vskpWBGisTE+wGz1zbGs82GXqWoXkBClM5IlCUTiJ+k1oU9Wd1FzmoE52fRhYHLh3SQoNtsynUxCfFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6481
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

Hi Rodrigo

On 5/14/2024 12:25 AM, Rodrigo Vivi wrote:
> A revamp to get some kind of standard in the various exported
> functions in this library.
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   lib/igt_pm.c | 148 +++++++++++++++++++++++++--------------------------
>   1 file changed, 73 insertions(+), 75 deletions(-)
> 
> diff --git a/lib/igt_pm.c b/lib/igt_pm.c
> index 928b72685..2c91aeb33 100644
> --- a/lib/igt_pm.c
> +++ b/lib/igt_pm.c
> @@ -454,7 +454,7 @@ static void __igt_pm_restore_sata_link_power_management(void)
>   /**
>    * igt_pm_enable_sata_link_power_management:
>    *
> - * Enable the min_power policy for SATA link power management.
> + * Enables the min_power policy for SATA link power management.
>    * Without this we cannot reach deep runtime power states.
>    */
>   void igt_pm_enable_sata_link_power_management(void)
> @@ -469,7 +469,7 @@ void igt_pm_enable_sata_link_power_management(void)
>   /**
>    * igt_pm_restore_sata_link_power_management:
>    *
> - * Restore the link power management policies to the values
> + * Restores the link power management policies to the values
>    * prior to enabling min_power.
>    *
>    * Caveat: If the system supports hotplugging and hotplugging takes
> @@ -566,8 +566,7 @@ static void __igt_pm_runtime_exit_handler(int sig)
>    * Sets up the runtime PM helper functions and enables runtime PM. To speed up
>    * tests the autosuspend delay is set to 0.
>    *
> - * Returns:
> - * True if runtime pm is available, false otherwise.
> + * Return: True if runtime pm is available, false otherwise.
>    */
>   bool igt_setup_runtime_pm(int device)
>   {
> @@ -658,7 +657,7 @@ bool igt_setup_runtime_pm(int device)
>   /**
>    * igt_disable_runtime_pm:
>    *
> - * Disable the runtime pm for i915 device.
> + * Disables the runtime pm for i915 device.
>    * igt_disable_runtime_pm assumes that igt_setup_runtime_pm has already
>    * called to save runtime autosuspend and control attributes.
>    */
> @@ -683,11 +682,6 @@ void igt_disable_runtime_pm(void)
>   	close(fd);
>   }
>   
> -/**
> - * igt_get_runtime_pm_status:
> - *
> - * Returns: The current runtime PM status.
> - */
>   static enum igt_runtime_pm_status __igt_get_runtime_pm_status(int fd)
>   {
>   	ssize_t n_read;
> @@ -711,6 +705,11 @@ static enum igt_runtime_pm_status __igt_get_runtime_pm_status(int fd)
>   	return IGT_RUNTIME_PM_STATUS_UNKNOWN;
>   }
>   
> +/**
> + * igt_get_runtime_pm_status:
> + *
> + * Return: The current runtime PM status.
> + */
>   enum igt_runtime_pm_status igt_get_runtime_pm_status(void)
>   {
>   	enum igt_runtime_pm_status status;
> @@ -728,12 +727,6 @@ enum igt_runtime_pm_status igt_get_runtime_pm_status(void)
>   	return status;
>   }
>   
> -/**
> - * _pm_status_name
> - * @status: runtime PM status to stringify
> - *
> - * Returns: The current runtime PM status as a string
> - */
>   static const char *_pm_status_name(enum igt_runtime_pm_status status)
>   {
>   	switch (status) {
> @@ -757,9 +750,8 @@ static const char *_pm_status_name(enum igt_runtime_pm_status status)
>    * Waits until for the driver to switch to into the desired runtime PM status,
>    * with a 10 second timeout.
>    *
> - * Returns:
> - * True if the desired runtime PM status was attained, false if the operation
> - * timed out.
> + * Return: True if the desired runtime PM status was attained, false if the
> + *         operation timed out.
>    */
>   bool igt_wait_for_pm_status(enum igt_runtime_pm_status status)
>   {
> @@ -791,15 +783,14 @@ static const char *yesno(bool x)
>   }
>   
>   /**
> - * dmc_loaded:
> - * @debugfs: fd to the debugfs dir.
> + * igt_pm_dmc_loaded:
> + * @debugfs: FD to the debugfs directory
>    *
>    * Check whether DMC FW is loaded or not. DMC FW is require for few Display C
>    * states like DC5 and DC6. FW does the Context Save and Restore during Display
>    * C States entry and exit.
>    *
> - * Returns:
> - * True if DMC FW is loaded otherwise false.
> + * Return: True if DMC FW is loaded otherwise false.
>    */
>   bool igt_pm_dmc_loaded(int debugfs)
>   {
> @@ -821,11 +812,11 @@ bool igt_pm_dmc_loaded(int debugfs)
>   
>   /**
>    * igt_pm_pc8_plus_residencies_enabled:
> - * @msr_fd: fd to /dev/cpu/0/msr
> + * @msr_fd: FD to /dev/cpu/0/msr
> + *
>    * Check whether BIOS has disabled the PC8 package deeper state.
>    *
> - * Returns:
> - * True if PC8+ package deeper state enabled on machine otherwise false.
> + * Return: True if PC8+ package deeper state enabled on machine otherwise false.
>    */
>   bool igt_pm_pc8_plus_residencies_enabled(int msr_fd)
>   {
> @@ -847,10 +838,10 @@ bool igt_pm_pc8_plus_residencies_enabled(int msr_fd)
>    * i915_output_is_lpsp_capable:
>    * @drm_fd: fd to drm device
>    * @output: igt output for which lpsp capability need to be evaluated
> - * Check lpsp capability for a given output.
>    *
> - * Returns:
> - * True if given output is lpsp capable otherwise false.
> + * Checks LPSP capability for a given output.
> + *
> + * Return: True if given output is LPSP  capable otherwise false.
                                            ^ extra space has to be removed
>    */
>   bool i915_output_is_lpsp_capable(int drm_fd, igt_output_t *output)
>   {
> @@ -887,14 +878,13 @@ static int igt_pm_open_pci_firmware_node(struct pci_device *pci_dev)
>   
>   /**
>    * igt_pm_get_pcie_acpihp_slot:
> - * @pci_dev: pci bridge device.
> - * Get pci bridge acpi hotplug slot number, if bridge's ACPI firmware_node
> + * @pci_dev: PCI bridge device struct
> + *
> + * Gets PCI bridge acpi hotplug slot number, if bridge's ACPI firmware_node
>    * handle supports _SUN method.
>    *
> - * Returns:
> - * PCIe bridge Slot number.
> - * Returns -ENOENT number in case firmware_node/sun is not supported by the
> - * bridge.
> + * Return: PCIe bridge Slot number or -ENOENT number in case firmware_node/sun
> + *         is not supported by the bridge.
>    */
>   int igt_pm_get_pcie_acpihp_slot(struct pci_device *pci_dev)
>   {
> @@ -928,11 +918,11 @@ int igt_pm_get_pcie_acpihp_slot(struct pci_device *pci_dev)
>   
>   /**
>    * igt_pm_acpi_d3cold_supported:
> - * @pci_dev: root port pci_dev.
> - * Check ACPI D3Cold support.
> + * @pci_dev: Root port PCI device struct
> + *
> + * Checks ACPI D3Cold support.
>    *
> - * Returns:
> - * True if ACPI D3Cold supported otherwise false.
> + * Return: True if ACPI D3Cold supported otherwise false.
>    */
>   bool igt_pm_acpi_d3cold_supported(struct pci_device *pci_dev)
>   {
> @@ -958,11 +948,11 @@ bool igt_pm_acpi_d3cold_supported(struct pci_device *pci_dev)
>   
>   /**
>    * igt_pm_get_acpi_real_d_state:
> - * @pci_dev: root port pci_dev.
> - * Get ACPI D state for a given root port.
> + * @pci_dev: Root port PCI device struct
>    *
> - * Returns:
> - * igt_acpi_d_state state.
> + * Gets ACPI D state for a given root port.
> + *
> + * Return: igt_acpi_d_state state.
>    */
>   enum igt_acpi_d_state
>   igt_pm_get_acpi_real_d_state(struct pci_device *pci_dev)
> @@ -1155,12 +1145,9 @@ igt_pm_setup_pci_card_power_attrs(struct pci_device *pci_dev, bool save_attrs, i
>   
>   /**
>    * igt_pm_get_autosuspend_delay:
> - * @pci_dev: pci_dev.
> - *
> - * Get pci_dev autosuspend delay value from pci sysfs.
> + * @pci_dev: PCI device struct
>    *
> - * Returns:
> - * autosuspend_delay_ms.
> + * Return: The autosuspend delay time in miliseconds.
>    */
>   int igt_pm_get_autosuspend_delay(struct pci_device *pci_dev)
>   {
> @@ -1177,10 +1164,10 @@ int igt_pm_get_autosuspend_delay(struct pci_device *pci_dev)
>   
>   /**
>    * igt_pm_set_autosuspend_delay:
> - * @pci_dev: pci_dev.
> - * @delay_ms: autosuspend delay in ms.
> + * @pci_dev: PCI device struct
> + * @delay_ms: Autosuspend delay in miliseconds.
>    *
> - * Set pci_dev autosuspend delay value through pci sysfs.
> + * Sets the autosuspend delay value for the PCI device through.
>    */
>   void igt_pm_set_autosuspend_delay(struct pci_device *pci_dev, int delay_ms)
>   {
> @@ -1201,26 +1188,28 @@ void igt_pm_set_autosuspend_delay(struct pci_device *pci_dev, int delay_ms)
>   
>   /**
>    * igt_pm_enable_pci_card_runtime_pm:
> - * @root: root port pci_dev.
> - * @i915: i915 pci_dev.
> - * Enable runtime PM for all PCI endpoints devices for a given root port by
> + * @root: Root port PCI device struct
> + * @gfx: PCI device struct of graphics device
> + *
> + * Enables runtime PM for all PCI endpoints devices for a given root port by
>    * setting power/control attr to "auto" and setting autosuspend_delay_ms
>    * to zero.
>    */
>   void igt_pm_enable_pci_card_runtime_pm(struct pci_device *root,
> -				       struct pci_device *i915)
> +				       struct pci_device *gfx)
>   {
>   	int delay = -1;
>   
> -	if (i915)
> -		delay = igt_pm_get_autosuspend_delay(i915);
> +	if (gfx)
> +		delay = igt_pm_get_autosuspend_delay(gfx);
>   
>   	igt_pm_setup_pci_card_power_attrs(root, false, delay);
>   }
>   
>   /**
>    * igt_pm_setup_pci_card_runtime_pm:
> - * @pci_dev: root port pci_dev.
> + * @pci_dev: Root port PCI device struct
> + *
>    * Setup runtime PM for all PCI endpoints devices for a given root port by
>    * enabling runtime suspend and setting autosuspend_delay_ms to zero.
>    * It also saves and restore power control attribute for all PCI endpoints
> @@ -1234,11 +1223,10 @@ void igt_pm_setup_pci_card_runtime_pm(struct pci_device *pci_dev)
>   
>   /**
>    * igt_pm_get_d3cold_allowed:
> - * @pci_slot_name: slot name of the pci device
> - * @value: value to be read into
> + * @pci_slot_name: Slot name of the PCI device
> + * @value: Value to be read into
>    *
> - * Reads the value of d3cold_allowed attribute
> - * of the pci device
> + * Reads the value of d3cold_allowed attribute of the PCI device.
>    */
>   void igt_pm_get_d3cold_allowed(const char *pci_slot_name, uint32_t *value)
>   {
> @@ -1258,10 +1246,10 @@ void igt_pm_get_d3cold_allowed(const char *pci_slot_name, uint32_t *value)
>   
>   /**
>    * igt_pm_set_d3cold_allowed:
> - * @pci_slot_name: slot name of pci device
> - * @value: value to be written
> + * @pci_slot_name: Slot name of PCI device
> + * @value: Value to be written
>    *
> - * writes the value to d3cold_allowed attribute of pci device
> + * Writes the value to d3cold_allowed attribute of PCI device.
>    */
>   void igt_pm_set_d3cold_allowed(const char *pci_slot_name, uint32_t value)
>   {
> @@ -1294,7 +1282,8 @@ igt_pm_restore_power_attr(struct pci_device *pci_dev, const char *attr, char *va
>   
>   /**
>    * igt_pm_restore_pci_card_runtime_pm:
> - * Restore control and autosuspend_delay_ms power attribute for all
> + *
> + * Restores control and autosuspend_delay_ms power attribute for all
s/attribute/attributes

With the above fixes
Looks good to me
Reviewed-by: Riana Tauro <riana.tauro@intel.com>


>    * PCI endpoints devices under gfx root port, which were saved earlier
>    * by igt_pm_setup_pci_card_runtime_pm().
>    */
> @@ -1342,8 +1331,9 @@ static void igt_pm_print_pci_dev_runtime_status(struct pci_device *pci_dev)
>   
>   /**
>    * igt_pm_print_pci_card_runtime_status:
> - * @pci_dev: root port pci_dev.
> - * Print runtime suspend status for all PCI endpoints devices for a given
> + * @pci_dev: Root port PCI device struct
> + *
> + * Prints runtime suspend status for all PCI endpoints devices for a given
>    * root port.
>    */
>   void igt_pm_print_pci_card_runtime_status(void)
> @@ -1361,8 +1351,9 @@ void igt_pm_print_pci_card_runtime_status(void)
>   /**
>    * i915_is_slpc_enabled_gt:
>    * @drm_fd: DRM file descriptor
> - * @gt: GT id
> - * Check if SLPC is enabled on a GT
> + * @gt: GT ID
> + *
> + * Return: True if SLPC is enabled on a given @gt.
>    */
>   bool i915_is_slpc_enabled_gt(int drm_fd, int gt)
>   {
> @@ -1387,13 +1378,20 @@ bool i915_is_slpc_enabled_gt(int drm_fd, int gt)
>   /**
>    * i915_is_slpc_enabled:
>    * @drm_fd: DRM file descriptor
> - * Check if SLPC is enabled for the device
> + *
> + * Return: True if SLPC is enabled on the device.
>    */
>   bool i915_is_slpc_enabled(int drm_fd)
>   {
>   	return i915_is_slpc_enabled_gt(drm_fd, 0);
>   }
>   
> +/**
> + * igt_pm_get_runtime_suspended_time:
> + * @pci_dev: PCI device struct
> + *
> + * Return: The total time that the device has been suspended.
> + */
>   int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev)
>   {
>   	char time_str[64];
> @@ -1438,9 +1436,9 @@ int igt_pm_get_runtime_active_time(struct pci_device *pci_dev)
>   
>   /**
>    * igt_pm_get_runtime_usage:
> - * @pci_dev: pci device
> + * @pci_dev: PCI device struct
>    *
> - * Reports the runtime PM usage count of a device.
> + * Return: The runtime PM usage count of a device.
>    */
>   int igt_pm_get_runtime_usage(struct pci_device *pci_dev)
>   {
> @@ -1455,12 +1453,12 @@ int igt_pm_get_runtime_usage(struct pci_device *pci_dev)
>   }
>   
>   /**
> - * igt_pm_ignore_slpc_efficient_freq
> + * igt_pm_ignore_slpc_efficient_freq:
>    * @i915: open i915 drm file descriptor
>    * @gtfd: open gt sysfs fd
>    * @val: value to set
>    *
> - * Ignores/un-ignores SLPC efficient frequency
> + * Ignores/un-ignores SLPC efficient frequency.
>    */
>   void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val)
>   {
