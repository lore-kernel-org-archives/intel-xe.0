Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF86CA601F
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 18:26:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9822C10EACD;
	Fri,  9 Oct 2026 18:26:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d2sSyRwM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E54310EACD
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 18:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791570372; x=1823106372;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nIQnicEsM6qs2fuj4zn1TLwOsoxBW8ksL+vMQOm33aQ=;
 b=d2sSyRwMkoTGsf5EERxFTHGyVsxTP9/UrMg8/v1YJP4VA6b5fpuL8F6i
 mbZVSnS/KI97ODt7tL2sogT5FF8MrlOQjPaZp/vVLjNSsQzNhrC/4f5NN
 WeHRjVx5bm8iLc6cGKx8HA0wt+6/Oy+vXj05Hb8VL23dzHgvifuuuk4ZA
 CouMu9vQMPpxhFhAb+WwVjfGqndgpm12/nVLubK9xput+HIGwVusP+hqf
 5yEnAfjNZJhynHea3DkllpcLdpAmvu4b5+3KlNGvoA47BkAPeRfnva9E9
 YYOkRPA7zf/qrh0PgdBgT00L3YYnDuvBiGu/n3JpZall9twCxiyO4TPdy w==;
X-CSE-ConnectionGUID: Sj6NPaoYQCObe0Amtq1nPQ==
X-CSE-MsgGUID: 3OSDoCsZTmuO6acZq5ntHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="369294"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="369294"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 11:26:11 -0700
X-CSE-ConnectionGUID: 77c9HwcWTfaZTvIJdDXbUQ==
X-CSE-MsgGUID: haMqZCOUTBeC2FiCGM4JhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="2172774"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 11:26:08 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 11:26:07 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 9 Oct 2026 11:26:07 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.12) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 11:26:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VMrXID68ozh+myi6BYupP+Tpsou4o9QGeWtarf8h0YlydEdXg5PFfxHB/q1RF6XoutBbM0hVBaxcg3pcFvoTVaBPlbZmbLwCqUmsLTsVN8S6D4ebjB+oXI0Bt3j3EdvihyeGSwNi56TsqshsaEzYZd6+TBK5GhFF8t1KqsI1Q42a+QghZuOMXiYeWp52xCDDwRzUJSJ4VjFKmvbrT1+FOpWNJJ5PvdQhTpCuB5144KlaMu+pv6UorCC0IOGThextQji0PKQN6ERG6qRrWtmGw90vDWGipn/QADttQTikR2e/34yw2pzX5yhVNgK6kTDlJJDNu/BkMg/I1GjyHlFXQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pz23kRhh6lt3HwuQi7By1HjZjiFs9P3U0kgdnpzqlMM=;
 b=YdClLuCi91s0+9s5Ph+Dxcl6E7f60XRuRNw4g+mXHkehqx22xCKDbGu+hYwpf98GqcZMFnINzHXONIgNaMaRkgM93hEHwJCaD1Hstf4Aii/jxob9cRIiDJ1eT3+Xp91EbLsQDXad2Oq1KjitBGvXKhYdGys6J75KN74l8524fuRQZzQAwOjKEgRAPD9vrv0MKKpLutCdm92Ap/U6Ghy+A9JvCCi1+h2axQu0uOLg+SqlOiLALByeP5ms8vm2kFYFf5rZo5Kpq4yZ1eevQPUDF+NppGngD7vV9cubkOjmb+vv+o4PWEPsLbTR6z0bbWJXjS5ixSlfRiLXqMNtspiW+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB4985.namprd11.prod.outlook.com (2603:10b6:806:111::8)
 by LV8PR11MB8608.namprd11.prod.outlook.com (2603:10b6:408:1f0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Fri, 9 Oct
 2026 18:26:02 +0000
Received: from SA2PR11MB4985.namprd11.prod.outlook.com
 ([fe80::4fb4:c6d2:2c42:1e4f]) by SA2PR11MB4985.namprd11.prod.outlook.com
 ([fe80::4fb4:c6d2:2c42:1e4f%3]) with mapi id 15.21.0472.016; Fri, 9 Oct 2026
 18:26:02 +0000
Message-ID: <40510a3f-1800-48bc-85e6-00b3e1aec932@intel.com>
Date: Fri, 9 Oct 2026 11:26:00 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/uc: Add missing HuC firmware entry for Alderlake-N
To: "Kumar, Sachin" <sachin.kumar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <matthew.brost@intel.com>,
 <Kumar@freedesktop.org>
References: <20261005081549.1594153-1-sachin.kumar@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20261005081549.1594153-1-sachin.kumar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0172.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::27) To SA2PR11MB4985.namprd11.prod.outlook.com
 (2603:10b6:806:111::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB4985:EE_|LV8PR11MB8608:EE_
X-MS-Office365-Filtering-Correlation-Id: 62860ad9-63d9-48ac-dffe-08df2632c5ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|56012099006|6133799003|3023799007|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: G5sOBbxbD2m5uFkSN9o2naIKbdjMURtQ+k2tYaxJHSwLQFTQrNlastOLVGQ23yP2ulQSfXyThjrarQ8x4bUlOHO3Oe3o0w9jYWHiCL7xHUHQWPBY2sn16Lua/M/0i8qXBfVOf73XYNRE1dtlxVZDznMOExIaJoQZY/T0VWJUDkhFDrbir2E881tYmSGraMujul0cLbi7mMdQUzDdLHkNfAQwUTmVSTSYcUN3HQccl3qd6u5esHmlWDI4wos8ls+tBPEVgy3Rd+TzfOJ2QJnJgvRdIQ45oN4eE2Lwm+Tf5hcbPwE9VN6P3hi9RzXivLHUh8xOBi/C59SJbhheXbkvZzWqscjvkuyj39GxRD9z1vjVb1z+4NH7PYuvjKEAJ5WGqkHpphetO/NJBKSNhxaX4kymJLDDbu4kb7DdelpwBnHSbLMELA3KM7OZjP9TI9gI0TckawllHlZJtDg5G+nD2aHRDKkRGmr029R1tihVs0Rh/xP1JqK59eqPOtnPH9czfx40ItzBK0smtL1JjsLI52nMuoofHQIwv6NLnpc1/0DwUhsnVEvPAxOTLABJo9hlR/Wxj886yH8qxJBEGh7RYv3olj+v5KEgVdaPMsxNxgWmeRBlB1sFw/XNTIR8PQMVtipQF7+0dPITnYpzUSPD+yMbFjbtLRFIEw3k17sPjf4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4985.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(6133799003)(3023799007)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUpPQ0VJZzdPWFB5ZytJWEltRHBMKzJEWjlsVjd5UTZKajBJbWtyK0JzWmhx?=
 =?utf-8?B?bEhKZFZvUDVoQ2NqMG0vN29nOER0UlRHbjYvdlZxMkZWZUtySmlSRDROMFNi?=
 =?utf-8?B?TWk5SnhSeEVPUEROQWI5d0tHS1VwazF5L2ltSlJtN1BESDBTQlNKZ3N5eTd4?=
 =?utf-8?B?dFBzYjlZaW1pM2pwNXVWQ0ZUZUNjbmE2Si9vU1Y2WHNiQm4vTC9nNngxS05N?=
 =?utf-8?B?RGpNaWxSbWt5eTlaSGhucWIrOXhCVnVzV0I4KzIycWZndVlabmdma1JRaURN?=
 =?utf-8?B?ZFhZTi94cWV0bklkUjhQSU9PTXZqRmxWbWJQa2V3UXdBKzMyMXpGUXlaVmVn?=
 =?utf-8?B?TzhoekhMSUh0cEM4SWNRRkVkVFl2bVhoVFM3Y0loUlpaSWl3UjRmS2NjWmg3?=
 =?utf-8?B?RndiT2dLOVVOZzNUby8xdFN4dHRiQnRsTExBcCtJVFcwMVpUSEJuMHQrRU9q?=
 =?utf-8?B?azJldnRFOElDTWc0VVNzWlh0dFpWNStEcE9HeGRhUEZqR0tLQzl0SUxBWDNx?=
 =?utf-8?B?L1FkTHRqNStLMmYyT2w3NzZ0NlV3bWpmWkJRV0FBOXFHaWdKcVBSYlhFNzlY?=
 =?utf-8?B?MWtjR3RYN0p6KzNuTkRzL1NwNWxlbXhPTlZRMlhhZ1EwMjREMU9CN01vOVp4?=
 =?utf-8?B?ZUZMZCtzM1JoZjR5dXNrcEVlQ2g2QlNSeTF6RjlMeCticExxYkZRUE9kWmpY?=
 =?utf-8?B?RVZFUmZCMDFUdmZ3eVhvYUxGbXpvakJ3KzRwdDR3Lys0Szk0VlIvcnB1Rmda?=
 =?utf-8?B?cng3ZkRQYS9rNXp4YnRhdlU0QTRyZDlMTlV4ZHNMeHRqdGhxRG5kZXh5QXZB?=
 =?utf-8?B?Zlo1YXo1SnAxMTdOazZkcktaVkFYR3JpKy9rUFBMQzJncExnTnJNQkpiZFFa?=
 =?utf-8?B?TUN3L3pHWmNpemtldDFnTFBjYm90N1F1VHhrUU1pRTRnQ3RreXlmU2Jydjhj?=
 =?utf-8?B?S1RhalcrbGFlOWZ0NVJpdHg5bmo1S2Y1OWFhOXhsVkI5MWVTb29NYWFUZzE3?=
 =?utf-8?B?SVNPdno2dTBzVk9ENHlEeFRpZ0JUeDdTanZGMElVTzFEUmM4KzlEZTllOHZM?=
 =?utf-8?B?dFNQUWdyOUxnbktTd2xxclViSlB2WjFlZVBqaVkxeXJzWWNEUFk2N3N6cnlD?=
 =?utf-8?B?T1VyVlBLV2xqa0pNa2NQek53ZEhlL1laQXllY0RKNlZvNnFneU9YV3A1cE9y?=
 =?utf-8?B?V3BQMXJqZlBEYzZYQUxlSFJqL0x1bWwxZGxWdG1JdVQ2QkhyV3QrQ0gxeDRU?=
 =?utf-8?B?NW9NaU1oZU1nSHhyTktlUkRnSFYxQW5vYlBZbEVMblIrSVdaOXZSWEc2U0ZK?=
 =?utf-8?B?ajArbW1IdVVZeHRqLzBYUUhJbU16ODhwRVVIRkJWSmpudVZjU05RbjBxWG1x?=
 =?utf-8?B?a21GZE1jZFFKSVhUWENFL1NrS0Y4Vk50QXI3S0tRMlZ3OHJXbFNlMzVGVlJK?=
 =?utf-8?B?L1JYMHhOaTJCMlNQZDBUV05tOEFIMzA1Qm1COFBqWWJ0S1VNRXhHWHcrdS8v?=
 =?utf-8?B?MlNsM2d6b3ovUVUwOGNYWkROVjlOQUhQMTFiOTZvZ1U3NXNsMWpSa2Q5TkRu?=
 =?utf-8?B?UHRFTGJ1NzhCWDlIOUpIRlFxR3hiN1FjTHhjcWp0WUxZa21QaDZISlBybHZz?=
 =?utf-8?B?M2tDQ01xZVBtQSsrUkJhR3FwZ3dSQ2I4WHlYY3krbDZIT1MvN0d4cDlWTGpu?=
 =?utf-8?B?ZWMvR1lwZS9jTDk1ejlydks2Y0Q4OWEvL3Zaa3BoQ0l2SHplUEZLbzBzcUhk?=
 =?utf-8?B?eVgvMS85cjlQTmtPUU9FTE1tUEtDdXhGZ0xzNEdRL0x1YXZTYzN1N2dQZnV4?=
 =?utf-8?B?cmdmRGQ5NG5rUXFOZkdSdjF4RGVaUEFwOTMrdWtCRnZsRHZJNHczSVFyRjJD?=
 =?utf-8?B?b1MzRkpVNmFZc0NNUmR6US9kOGdmZXE2SDNndlFWQ1pWTHk1TXlBZjdCWmVQ?=
 =?utf-8?B?T0F6WTJzcXdjVE45YUFlcXplcWVnRUVDekdzeHYzRmlhL2VXUmpIaUhzUmRp?=
 =?utf-8?B?M0RENnZDY2J2cFRvTmFKbHkrRmRpWlB4S1dhM2NqNytpOWgzVGhZZm1zQzds?=
 =?utf-8?B?dlNwaEtxVnkrUU5lN3F4KzdEbTNVbkZIL04vUWZxcUdOdzZzYTR1enpYN2lJ?=
 =?utf-8?B?VUF3aXJvU0RieWpOTmNMYjI1UXR2UkovSjA4Nnl1UE1CbWgyaVRKNlovYSs5?=
 =?utf-8?B?cVp5WnhlTkFEU2hDbmtJV1ZPZms5N21TMmdJR3dyNFhsdy9aQjBFaHJpNjY0?=
 =?utf-8?B?b25JUDB6M3JzTU81UTZsY01PSnViK3N6T2FVY290dndTMHJiZlpPSUV6VDFW?=
 =?utf-8?B?T1VQNlFnQkcyTkowdHB4em9wWllYSFpEZzhuZ3FEcTJIb1V5Qzk5RmhJd0xG?=
 =?utf-8?Q?YSKB3Mtvf0ic3r7c=3D?=
X-Exchange-RoutingPolicyChecked: geuQadmYGDan2U3nEaz8dlk6ZLvNqPC0EePLGMEkMogFj1/NYPuNjqKZ6TT7NZUtAbSP0er3+uB51N4TO6ehCX2nMw0KEe+bbbLcHzEezZzMSyDzpm0C981728VTakGvZV7YGEq7Tyb0wf202QjuL2I6JFRV0gkKCbVG5kEqIa3mxV003zg9Ny4BnPuy3TSqVv0iV24GofOw6+GoV75X+3YPlR9HvPEywptTADZIHItRRfjRBDqER4zfXThvkM7ixRoSXoFMc8Rqvtdu2QSedIIJLTkrxfnwu0kfBCKlnq7H4cRYn23+76ePt8WJNJgS5EFN3ilgnWzv1dpwhLxcBg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 62860ad9-63d9-48ac-dffe-08df2632c5ce
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4985.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 18:26:02.0374 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e+5fSFjLZe37oc5ZPEkqb9JRIfm3gERCWv07r/tEJKQzyLx+QNbC/PYfpqWCRG96jTAXVje6o66uAtIFVSpwy5rogW/cL47EaqT+STOFsq8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8608
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



On 10/5/2026 1:15 AM, Kumar, Sachin wrote:
> ALDERLAKE_N is listed in XE_GUC_FIRMWARE_DEFS but was missing from
> XE_HUC_FIRMWARE_DEFS, so uc_fw_auto_select() never finds a HuC blob
> for this platform. xe_huc_init() then silently treats HuC as
> XE_UC_FIRMWARE_NOT_SUPPORTED and returns early with no log output,
> so the gap is invisible in dmesg.
>
> Media encode that depend on HuC (e.g. VP9 VDEnc BRC/header
> probability update) assume HuC is available and still program
> HuC-dependent HCP/VDEnc commands for the VDBOX engine. With HuC
> firmware never loaded/authenticated, the first such command stalls
> the only VCS engine on this single-VDBOX GT1 part, which shows up as:
>
> xe 0000:00:02.0: [drm] Tile0: GT0: Engine memory CAT error: class=vcs ...
> xe 0000:00:02.0: [drm] *ERROR* Tile0: GT0: GuC engine reset request failed

I noticed that we don't expose whether the HuC is loaded via the query 
ioctl for UMD to check like we did in i915. However, AFAIK there is also 
a way to check if the HuC is loaded or not from within the batch, so 
maybe that's missing from the UMD side? Might be worth asking.

>
> reproducing on every run, on the very first VP9 keyframe, at both
> 1080p and 4K. H264 encode is unaffected since this driver's AVC VDEnc
> path does not depend on HuC. ADL-P/ADL-S/RKL/TGL are unaffected since
> they already have a HuC table entry.
>
> Note i915 never hit this: i915 has no distinct ALDERLAKE_N platform
> at the GT/firmware level (ADL-N is only a display subplatform of
> ALDERLAKE_P there), so it inherits TIGERLAKE's HuC blob automatically.
> xe gives ALDERLAKE_N its own top-level platform enum, so it needs its
> own explicit table row.
>
> Fix by adding ALDERLAKE_N to XE_HUC_FIRMWARE_DEFS, reusing the same
> "tgl" HuC blob already used by ALDERLAKE_P/ALDERLAKE_S/ROCKETLAKE/
> TIGERLAKE, which share the identical Gen12/TGL-LP media IP block.
>
> Fixes: 500f90620cce ("drm/xe/adln: Enable ADL-N")

not sure if we want the fixes tag, as IMO turning HuC from off to on by 
default is not something that should happen in a point release. I'll 
leave it to a maintainer to ack or nack it.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

>
> Signed-off-by: Kumar, Sachin <sachin.kumar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index a8e6f18cc9b4..80f657ada0ac 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -134,6 +134,7 @@ struct fw_blobs_by_type {
>   	fw_def(LUNARLAKE,	GT_TYPE_ANY,	no_ver(xe,	huc,		lnl))		\
>   	fw_def(METEORLAKE,	GT_TYPE_ANY,	no_ver(i915,	huc_gsc,	mtl))		\
>   	fw_def(DG1,		GT_TYPE_ANY,	no_ver(i915,	huc,		dg1))		\
> +	fw_def(ALDERLAKE_N,	GT_TYPE_ANY,	no_ver(i915,	huc,		tgl))		\
>   	fw_def(ALDERLAKE_P,	GT_TYPE_ANY,	no_ver(i915,	huc,		tgl))		\
>   	fw_def(ALDERLAKE_S,	GT_TYPE_ANY,	no_ver(i915,	huc,		tgl))		\
>   	fw_def(ROCKETLAKE,	GT_TYPE_ANY,	no_ver(i915,	huc,		tgl))		\

