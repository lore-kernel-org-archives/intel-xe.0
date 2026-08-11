Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB21C5CFCF
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 11:05:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D23B610EB48;
	Tue, 11 Aug 2026 11:05:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XIOONj6z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4947F10EB48
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Aug 2026 11:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786446335; x=1817982335;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=4TtfX/j4VcCBV0c5wi7CQGGRqRL8T4Rx96JshD5a8xU=;
 b=XIOONj6zB5zF2apVTdYTZ+2LXi1Pt/VfvlDWIm9dHxUSEc9h463orp/8
 VtrNjwFJEiVqSIW2BSB/kYd0gx2NPiN4Pq9E0RxXFkhJD0AtQ/l1ZaweM
 AZgu3pT1Lko8BC2i49cir4WWQ0DHBsA6fxf68uUgCAWWzJYbKTp28BnOR
 wRiNkprjImSiGDpmMdUG6XuhLT/zwSlOAJI5zX6okLMF/754CTRIXOeSN
 4sdO4LPFqHwza8S7gOpxWNTuhCrFRJEO/xzGQBb+LcTe4Dff/hM6M5wcC
 y3rR9PkVjzPBk+BXoIw7rspcc964TTE6OWLBzLJ7qucTVFRKrgEmzQaua A==;
X-CSE-ConnectionGUID: 4lHb11lISAqP/jL08+TeAw==
X-CSE-MsgGUID: iNpph6/DSNaK0J4o9WrZdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="98488803"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="98488803"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 04:05:35 -0700
X-CSE-ConnectionGUID: BtO3K7d4TdaQFvyjdFkGmg==
X-CSE-MsgGUID: 8pDbw0FYRkK98faDRTytJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="257095054"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 04:05:34 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 04:05:34 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 04:05:34 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.35) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 04:05:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u+e2h6AyvUaCvtTucpU2/flvq3dk9/EHu0piTEgHtlWEcVEu0i476FEiN8jMaMAH39BPvcRcCdMWgi7pc80iwKEkUwJPfNTmfNSeAXe9FFf4kp8sOmsZIS0wnedB+O5uf9MVeQsQLXXe5qktVd08ZF8uOJJiOxKqK1mu4x2E5YGk3uKaHki8+WaWjvuGges6OW2BoOW1C5Id9Gkitfq+af3Y8ueTCubA8zfb609LicY+BSlqu64W1XDYLwxdqaWlICK2fpA5FE8pGKrsAED57FZUl6ZLhBd0QwlYsnI3G04ODGk6unBbm+a2+gWX8B1BA1AorHKnHytdUgRjPcipyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ucfkmexikR678oHLMYtKRSNkRbyCZOhmbon/zstCi4=;
 b=ZXZYnrNacnAQoqMpPKrNHuLg6CvC4awbiYnRClLGB0P2HK31C2LoO4x8CCxB56Cb0SzbfYFRKNQMU+ZG7+n+saHpkGA8hIl48DGqmNPIxlgS8mPwiE1ialZMtIHVH48pwECbSovapviYh7443/BI6gW4eFNMtjkQpYgcxil7eBkkiju4t5H6HKu8GemmmM77EiaHzmX2t+XWFykn6EDN7CCGzuaA70MUFC8UJr4epEN6FwQPAr/ru2Hvz5UkEO8snp8zovzXl+eJlRsahLrIGc0ZbxVnuATxREUPNstEaRk/U59zzSIMaP45Evx4rJftFFv6U9XcSAkJxyvzk+7WaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by IA6PR11MB690409.namprd11.prod.outlook.com
 (2603:10b6:208:5e4::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 11:05:32 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0270.017; Tue, 11 Aug 2026
 11:05:31 +0000
Message-ID: <e1d26c73-b31a-44a2-a4a8-e389e82781a5@intel.com>
Date: Tue, 11 Aug 2026 16:35:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V14 3/9] drm/xe: Link LRC BO and its execution Queue
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260730101132.2770752-11-tejas.upadhyay@intel.com>
 <20260730101132.2770752-14-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260730101132.2770752-14-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0001.apcprd04.prod.outlook.com
 (2603:1096:4:197::12) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|IA6PR11MB690409:EE_
X-MS-Office365-Filtering-Correlation-Id: 13a6b891-e60b-4e0a-d871-08def79875cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: LtSxSEXGyKlsiP26T4+8lQmTXTPKo7ljk8C+lbSLj3wXnMWWo1BLeN5zqQfBFn+mOhd+k/2Ris+hx2PaRqNGdg5mCzZVLi1itvSgGHlj345xT2VTXPjyk6CIFcsnBjQqdB7q4A79bPMcBkSJzHsYig7ByonosaAC4nClmvVmVnbWZUwuPt0C3kXqyFhGzGjjDVSwVvBfVq5CRkIpvq9EPL+HRfo83Dt1BxNEpf6SToIJV9m2cM4YpRtahik3ZlLTjtFUr0QL6XoTxw50y8GO70fukmTFK5LVSW7VJFlYCXXSQ4vsh3P29YDu6sZ2Z3ni/8o/G1acU5xJbsZyR3i6z8+zsSJw+qciP3kg3qplWQCFCQd2bnN00GOAwFgwJauR4ABObh4yL3HgCbxw1He3u8BWmoPAQnZZ8lLtTINu0R4KNVlDJHXLBCfXqPJOe73EEgMBTz4QvV7hTcBWZaN3foAvVTXyTx0t+UdaQaMIJWdvdF4xVScwi23joc1TPrD3usTyJ/ErdpRfAC0Cf+uZBuIrL2zeG2ci41QsDT1UmHoy0j6jPKKGExx82GjowsTSrfrdKZZRAlTqtaCRXwnw7Auk4pUsBQQfRGTG7pPVWeS8RBA3q5XIMPzK7ihphtRwdXKbZeycU2Hyf8ZRw6Xy+KZ0ofQ00IjONje2So/z78U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cytEZ3lPVXRCbDkyK3VXL2tQb01MVTdiQTFoUTNTeFcwdS9HeWV0TWkxQ0VC?=
 =?utf-8?B?TkNYUHhCLy9JTEhCRys4emhhbXRta3RjbTBQVWZUNUpOSXV2ZUx1bDhCUXpO?=
 =?utf-8?B?eDladjg2LzR6RngxNHp1K1BUWWEyVFlxbjd2VVA2S1BlSVFkaFN0dk15Zy9E?=
 =?utf-8?B?eDdSWVdTQWt0ejk5bGxva0NKZkIvTnJzRUtvQk1XSjN1TnNFQ3NUNGM3Q2tV?=
 =?utf-8?B?WDhvelk0TjNKUkIxUGFRd1pDcE1CZ0Myb1VsSmpqMTRaRnVoblllZmdoQStO?=
 =?utf-8?B?WnBmSjdWT05zUW5ud0JpODF0Wi81Rk0xK3g5OExIckZ5ZWlEeWczZVJLeWJj?=
 =?utf-8?B?WUI0aDFBeWhhejZ1VWZ6UGtwLzB6TVNIbUZYRU5uK3F3cWZpWlJjcmVRdzJU?=
 =?utf-8?B?VTFjK2JsZkVlQlovNFBsUVFxbFNXbE5nYkVnN2xwdWRyU3FOQys2VUduV0wx?=
 =?utf-8?B?dnpXSmQvVGgvSVhFdm80NEZNSkI0ZlJNdXZkOFdJYzN5TStMTjNVREV0NXVl?=
 =?utf-8?B?N2QrMGp2RmpTbGVSOEFKYi9MV1pkcThXUWMxZnJTZnpWcGF0NWp2Y0Z1RTZs?=
 =?utf-8?B?OWJHTjlWdmlHSTRUamRlWGhHV3NqMmx1WUlzc010RGJSMlFDQjUzSmxMUTJ4?=
 =?utf-8?B?dmpZRy9OTkJ3WVVabUE3WWJ5amZ1d2NvT1Uwbi9HaDZObi81aVZjcDVsdytl?=
 =?utf-8?B?eTNJeDV5MUNYd09vZXJXRGhocEJTVXU0eWUxUSt1TFpjbUhYVGRyUmZlSVpT?=
 =?utf-8?B?MXZucE5ZRXI0VVdxU25HdXJnemd6NmxKZkhHc1JQNjRPSnRiQUdWZUNpRUlk?=
 =?utf-8?B?ZUVid0tYM0hvUVMvM2V3VVNva3I5QTc0dmp0VytpV28xalptV2hlaHJ1dVdZ?=
 =?utf-8?B?bXRRSVUrcEY2MzlteVlheTNpYzhCUDJJWWdwVWoyZitwNkx3ZXpWOUpHMkdJ?=
 =?utf-8?B?ODRvaFpUeHZ4aWZkL2FFTkpyRWczRUJTQkMraVZ4WktrUHJCaThPQ1NWZDMw?=
 =?utf-8?B?RzhEVGFDVXVvcnFJQi9SR0xKUllBMDFBRm5CSU11WXNHc0MzRWUzT3E4U2l6?=
 =?utf-8?B?MU8yYzRJQWpCNUpodEoydjd3aFA4TWhxWkxjbjBGeHJ6TU9WSzNJekZzUnRN?=
 =?utf-8?B?OUU5c0JndW1MVlRNMFJvdTJNU2hIUHg5V3hpNEQvUEwwQnFpdTBVanovYmlu?=
 =?utf-8?B?S2VEUy8yQW5hQU5mL1lZQnJlYTZ2bTJuUG9qLy8wKzR6WVJUbnNsdGJKQmZX?=
 =?utf-8?B?Vkhwc1VoVWpHUFNHWU1UV2FWRGhMdERmV0tKR2tLQzcwbmNTNENhK25IMXo3?=
 =?utf-8?B?S1NENFhScFF0R04vT0NxL2thcTRMSFpwcmo0YnZYMnhDTmNEZ0lJWVMwdzBo?=
 =?utf-8?B?QXhIQ2w4dStqTWllRER0cmg3a0tqRUlZQzhTS0NmU2JkTUU5b0lyeHQvcEpx?=
 =?utf-8?B?YS9FK3l0dlNpNHUxVnhQRkhVU3hhaGQ1aUxjOXNSUC8xTGhvN2Z4ZFNCR2Nw?=
 =?utf-8?B?T3JqaDhkY0hZd05lS3hjRHR1c0dhMnhTYlh4b3Q0ODRUNFVIMDF6UmZwQXJX?=
 =?utf-8?B?alllek51d1dIY3NsUUZDRFQwVDVuZDArV3Q2bG9EMC9zRnh2M291OERXMTIr?=
 =?utf-8?B?WWh1YnZ4UDJXT2hlOGtIMFg0VHhLd2wrNGJBMDB0SlZyNmF4VW1ZZllPYXVi?=
 =?utf-8?B?d0ZZMnpJT2VHU05Na3ZZMlhPazFvTXZQdkJDb1E2ZTVQYWN4WHRSZWdlMjRj?=
 =?utf-8?B?K0I5Wlg4cEJudkczUGtOdy9iUHFJdG15Vm9mOWJnaU95Y1NqOVlkdTl3dmdL?=
 =?utf-8?B?T3FCWmNVS0JIeERqTU05cUptVy8yTk9JYlduQ1BQM2t1bTRjN2RZTGV4UVVV?=
 =?utf-8?B?Sml1M3hGQngxMmpvVHZrUFRDNGpublJ4ZVkzT3kwc1VQOFpPQXVCbVR6ZXVn?=
 =?utf-8?B?U1ErcjNlS2FRNFAzZXVhTHlZRWU0TlVsM1FaWjNnMnBVRHZFVDFsUGJhMUU4?=
 =?utf-8?B?ai9iUS9OMlhadmNMNkpSZDUvNmpiS1YwaHBNdWhMTnpYcEJFZWJCTmp0aTZE?=
 =?utf-8?B?K1VtdStwUTFiSUtIZW9Dc3hFVVRLL1FNSURlZzgrSUxkKy9hS0hlN3hhZGt6?=
 =?utf-8?B?QUtKRTA2UU14NngraXRMNnlUMy9iL1RndmxaM2JHQXVDQ1NTZEtydnVlYjYz?=
 =?utf-8?B?R1pTbkltZ1VZU1ZrMnFudHhyQ0p2Z29JNXdHQWVDdVJWUHZHUWxqUGxvU1Rl?=
 =?utf-8?B?R3hYQy9GOTU5WjFpaTRHMTVhcEk5aE9tbEc5bXpJVXhGNDgvUytGc2dzQnVZ?=
 =?utf-8?B?RThUTW5lTnlRc1pMNHBTdGxCdCtaeG5kMkVCQU5TdGptTWk4Q2NzVGFTMExP?=
 =?utf-8?Q?w5614qe3EJ7qtUyY=3D?=
X-Exchange-RoutingPolicyChecked: EkWEuIIpOpbtuc+fHx0TWSnUpl5t2l1PtmRiSantUm4ML5cBlb3URrkMZWjck8PeFEnFMGbww2RbLPVAjzEd4h2M7AQQoXRwOVGzroB6JPsGxrYR4m9BxhLGFpMOqRkBpziGFgWW5L1fFAStL7HOqeSLS7nTrigDOIL6FzQUzjWSZ8FeKQAC6Bn/rAEbj/dTBEHZLqKhysMmUaa5KizJR1CcUGg8gch21Wm+mDWphhtioIf+g2+gZTVLvcAaolwlv4xmJKYJ0KAWq1HJU56Mw8lnJDA5HLN10EX0Bz2gnoabYEm1UB79yDzN5FyiizFo/lHVg7w+p6uIKiAPu5yMkg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 13a6b891-e60b-4e0a-d871-08def79875cd
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 11:05:31.8540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hO/XxytylPmafGKoFfnE3dnpBkLlqR2gUBcvU6qhfZy3URLP196W8KOQF8pVpSjcab+5SBMGNbWtp9bnFSLGms73Wp5eXe8b4FMREDbEczk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR11MB690409
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



On 30-07-2026 15:41, Tejas Upadhyay wrote:
> To establish a link between an LRC BO (Logical Ring Context
> Buffer Object) and its corresponding execution Queue in the
> drm/xe driver, you need to store a back-pointer to the queue
> within the BO's private data structure. This allows the
> driver to identify and take corrective action on the specific
> queue if the LRC BO encounters an error (e.g., memory
> corruption or eviction issues).
> 
> V3(Sashiko):
> - Placeholder of 8 byte for non-lrc bo is acceptable
> - Assign bo-q is safe just use READ_ONCE/WRITE_ONCE
> V2(MattB):
> - Handle multiqueue
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo_types.h   | 3 +++
>   drivers/gpu/drm/xe/xe_exec_queue.c | 6 ++++++
>   drivers/gpu/drm/xe/xe_lrc.c        | 1 +
>   3 files changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index e45f24301050..a9c48e440669 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -20,6 +20,7 @@
>   struct xe_device;
>   struct xe_mem_pool_node;
>   struct xe_vm;
> +struct xe_exec_queue;
>   
>   #define XE_BO_MAX_PLACEMENTS	3
>   
> @@ -42,6 +43,8 @@ struct xe_bo {
>   	u32 flags;
>   	/** @vm: VM this BO is attached to, for extobj this will be NULL */
>   	struct xe_vm *vm;
> +	/** @q: Queue this BO is attached to, mostly for LRC BO, NULL otherwise */
> +	struct xe_exec_queue *q;
>   	/** @tile: Tile this BO is attached to (kernel BO only) */
>   	struct xe_tile *tile;
>   	/** @placements: valid placements for this BO */
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 38972b6e6d37..ab81a512fb41 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -390,6 +390,12 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
>   				goto err_lrc;
>   			}
>   
> +			/*
> +			 * The queue ref counts the LRCs, thus it safe for the LRC BO to hold a
> +			 * pointer to queue without reference.  The reader holds dma_resv (
> +			 * xe_bo_lock) which serializes with xe_lrc_finish().
> +			 */
> +			WRITE_ONCE(lrc->bo->q, xe_exec_queue_multi_queue_primary(q));
>   			xe_exec_queue_set_lrc(q, lrc, i);

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   
>   			if (__lrc)
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 3e7c995085d0..ee77106b06bc 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1066,6 +1066,7 @@ static void xe_lrc_set_ppgtt(struct xe_lrc *lrc, struct xe_vm *vm)
>   static void xe_lrc_finish(struct xe_lrc *lrc)
>   {
>   	xe_hw_fence_ctx_finish(&lrc->fence_ctx);
> +	WRITE_ONCE(lrc->bo->q, NULL);
>   	xe_bo_unpin_map_no_vm(lrc->bo);
>   	xe_bo_unpin_map_no_vm(lrc->seqno_bo);
>   }

