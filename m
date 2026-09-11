Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A763C88E4D
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 17:39:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27B1110E16A;
	Fri, 11 Sep 2026 17:39:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lpinem13";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E12A410E16A
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Sep 2026 17:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789148376; x=1820684376;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=s7uP79Lu8ru+vZvfndR6nPDJSde3ND510PbqFaLxTj8=;
 b=lpinem137OT2W24NV91inyM7HhiOOAAffLE2Ct7G8oD0P9NOzk23rzw3
 bWeBkMKNe63gDGuyeDkQ8Fj8x0GbfXOH2aDGGuH2S58edAyb9HTTBs4Ie
 XpTIybzaXWQcOELV33+Zk5yU3uus22BaKPx+CQBvCoi8EpeLXFMWZZH7o
 4bb7gHZ5mgzCHYfysbp8iIYw7VYaWo+gJ3Dr3MovkpBEGO7PDaoQtiux5
 RCeUkbxODoaE0zendgjIc0Z26k+FQ2Xf5WsnOXyxMoI3b7CppgCbcJje0
 5wsvvfBnhazcJfiZ7nJMGL6cIOfwI3jCWQ/DK9YbAPMZfomWCS8w836at A==;
X-CSE-ConnectionGUID: D4hRCt7OR62qGqdO16C71Q==
X-CSE-MsgGUID: WrAi0PDTQy+jeOtobxlXeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="100208778"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; d="scan'208";a="100208778"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 10:39:35 -0700
X-CSE-ConnectionGUID: g6vmkrDzQbePs76Xyt5pxA==
X-CSE-MsgGUID: fyyXhHVMSHOg4QfnEy3bkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; d="scan'208";a="268697275"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 10:39:35 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 10:39:34 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 11 Sep 2026 10:39:34 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.71) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 10:39:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FQ+hLj15liqaKQURDFbx/6AXKjUbruqHisJUpS4COL1o1YgeN3UcmqLbiXsCLW+NW8bvcJL3e75/fZv1DvtdddkRi/bIlosCepAbIbRXQrTFZ3Kyg+41Lp29vrnpKrVebp8n+ucXHwNASZeGxZNEAyL2AFaRLbXe606+T7onk322+qfUf6L1XwCgDuzc+PUR9JLKdYcfMQuIKjKonH3xCLtgu9pQldhI4xhZhcyjqeIPj8QfkUZ3BL4oRMMVA8dS1cidUlP2/YXvs+0DteEKDqY282lQyNj1cA8eT5KM3OkV+oo8q7/P4YWKJhwPfKveD7juUXZQbQxSqJxlyj7gug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iqvlvCNHNNVEXo0tBZjivKxXPIeqbP6kC9XVzcO45h0=;
 b=KHG5qkviAUW83zfhM+ivYDNlDSnFPiUjkKJx4mHYtgl+/FFAedxlbKoF3wZyf9p9jcxP9x97uD5IEgOmioWS7B+QUEIC/eAGEs6lPaa5zCskXFXTMUEH2iTRL6qI5/dyJqxfR/4cDtcFl+FTXkYQbFZooc0++ytNLH7X+YvttX795VOLSMkNDn06wMzbzz2TZXRNy1d/hVB6ozUrsTCjqepuYC4H1LKh9ceCxAfeQXt2PXLFalNiWh1PsjywDCodslzylJIuEib1V7kITbh1YV/TFCpB6Nd3qSfkmT9YXBTS/Sq38GrjKS+b1O/ZfOATX+tcQxuueTco4VCXo7XvBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by DS4PR11MB682247.namprd11.prod.outlook.com (2603:10b6:8:53e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 17:39:31 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%5]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 17:39:31 +0000
Message-ID: <8ad01b22-8f27-4971-85ae-a806c5910769@intel.com>
Date: Fri, 11 Sep 2026 10:39:28 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: harden adjust_idledly() against
 divide-by-zero and overflow
To: <tilak.tirumalesh.tangudu@intel.com>, <tejas.upadhyay@intel.com>,
 <gustavo.sousa@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260909161844.125147-1-tilak.tirumalesh.tangudu@intel.com>
 <20260909161844.125147-2-tilak.tirumalesh.tangudu@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20260909161844.125147-2-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0121.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::6) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|DS4PR11MB682247:EE_
X-MS-Office365-Filtering-Correlation-Id: e81b6f9f-9677-4111-856c-08df102ba2a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|18002099003|22082099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: tKZAbxntITRl6nd4xmd80jTTIk00kedp5jQRSnrE4J3DZIsK/8w3hBcXNoMIhucE+/ZSB+nx+k5v+bkKFCRMJxaKvETVS73fmSizG/YdF7WlNR/nzPfOh6k9KGj86R6mUaCiIzNdEh0R4oEZs/fq7PahkUTWRBYrC6Blxy5A0Btw0gtVsTmU2gNAjMR2LJXIAWY3mbT656u3YjNsxrHnkCJFx7TlmgX8skIT2e+GoO6MYZDjpLRw5Tt9fc/EMFxwr4mGpv8fimq9Fw8/rrQttEqJXAO/pVmWdWGr/VP/7TbrVhxVNJ6GVe2mBHyCybT7wgKOLYasXgvVbcAC13qtY+aRTKogrtxU8Qr3SpgbB6J5U17vxgZeRc7Qdy3R1pThJIVqYe1jf9owKSfpCNuyQJheNtMM9+RMpKMmBxV/aLZ3zmas0fOgMs2rtf/dX2tjXnjYfe6FOWGqHBIV201cfSJgtZhFkITymaRD/WrpU1fEO2ESmkOezUmQMmZZkaYMtPRRwMdQbe5SqnPR4IhYkD6AW3YzSx47aRRlfuBzJXJGrPpmkWl8R5sBe2ZkIEXcxtQWFkVNo6P47t/TqdVz/setz03peik1o1UgjPrN3Jbs8/0ivYJucZ2HE4fFmpjKAXRZj9UrlV30ZmTJuNPHqaxgwF3UpNJtc9/SQ/uD0wk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(22082099003)(4143699003)(10067099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0xpcHhiVjZTaHpVOVpUUWFRQVJvSlFYdHFzZFU0emI0NSt2U2tJbTYyR1U3?=
 =?utf-8?B?Tmp1bUlVc3d1YnIrYldkejl6elhIRGt1bk5NdWJCSGRmWXBrN3BxVTUwSC9i?=
 =?utf-8?B?NWVUV08wNXpIMzJmQTdiNnZEWmtqU1pNM1V0LzJHbjhEdTg2b1FNd3Zaay9a?=
 =?utf-8?B?dU5pTTZvc25MS0duUUxSczZLWHF6dXZRYjBtTytIaWkyQXh6UGtmOGlIM2Nr?=
 =?utf-8?B?dnpjL1hCVlprWUJSbFRNb1dNL2Rtcm9EQ21ZY2RRY05mTzVaVXIwaWZLTlVh?=
 =?utf-8?B?Qlc5TTB4U3VJSWRsdDE4bW10L1ZqZXZwcDJLVHVxMXBxZ2RSWkFGaThxRkhM?=
 =?utf-8?B?Uk8rMmZyRUVhVmdjalJ2NytUKytJSysvNTF2OWhYUG9QeUhFbXJkY1kyZDFK?=
 =?utf-8?B?VUd1THMyRjJUVEtFWmpmVzRCMEJON1ROclZuN1h2MFBkUWtiMU9Gam5GaWx2?=
 =?utf-8?B?OHNDcEJaQnV3SHBmUHVzMWZKdFI3enFkUUVnTmlYZDl4UlNma3pJcjJKblN0?=
 =?utf-8?B?RTB2NXNhUnpMSFdLaS95ZGpOaVdTSWlnMkYxbHpVWmNqRlFtRkR4SGRobWZC?=
 =?utf-8?B?NEh5aERlTmlKVWRCREVrZEtoN243WlAyZ21FeE91YXBxYkNMOEpvM1JNV2lL?=
 =?utf-8?B?b2FyWXBMRlBOcyt3TmdjYzBIR25PcDRKR1pQeXF4SEk2emRFcnM0SXRKbVMv?=
 =?utf-8?B?aVJUYmJzeDhIRVR1OEVZNjlkQkpWYUlDWk5abXc0N2F4TEhRUnZaMUNDS1Nm?=
 =?utf-8?B?cU45dFlqR0R6Z3pZNmFCazNXeTFrZGt3YWtaWHc4Q2JLQjRnbkhYLzdqYS8x?=
 =?utf-8?B?V2gxeEZhdGNGNXNoNlJkWit1QXk5Ny9JTi8zTjRPT1NmakRDRkhzQ3BsSHNI?=
 =?utf-8?B?Z0ZLdm1ESnJQbStwODdzQkVySHBSNEtsdUtQZU1uZnN6djJnYkQvaXZ4LzdX?=
 =?utf-8?B?cE1PQ0FMdHFYQTEyQ2hTRGtyYzA0RmtkSWdNZEpmRm5sa21JSUo3WWEyL3pU?=
 =?utf-8?B?LzdLV0dCQTRvUkpYTEVaaFcxc2dMMWlBZFFpeGNncXRBVkZrYXMzdWdaWjJp?=
 =?utf-8?B?T0YraGdhbFplRUp1d0NyOWdtbmV2amFrNWxIaExwbE0yV2RQTENhSXRSdEhG?=
 =?utf-8?B?L0QvSy9YQzZnemx1ME9TTUFlNjVMcVRJVVE4Z2tJNDJiMmpERktUWW5hc2Ix?=
 =?utf-8?B?bEtLTUxHT0hnV2NqK1dkZ3pxWkN0YktRYm9oYkFHclUzTVRzL09iVjNFSlZX?=
 =?utf-8?B?d3JOckxEdG5YVERlNWlzWUlqa0RiZTFtazhDaGNvZEpaZkF6WXBjcitFL0Uz?=
 =?utf-8?B?UUFDbUNmQ2V3bGdaNVFFUEpiNVpPei9kaTRxb0NicHJXZndWUlBwSDFTUCs0?=
 =?utf-8?B?cG9Va2ZGZ3hmWUwvcXNVQ0FEOWJCWFFSVUxVRE9nc29kVTdKUGxCZml5WkFk?=
 =?utf-8?B?WklXS1J0ZW4rK3FWaE1ONlRHdGdvbXh3ekFCbFRZRkErRmxwK3pZTGZpVW5y?=
 =?utf-8?B?ZzBZbUhueks1UFgzVC82Q3RxN3pQNUdocmx4aDJTd1EzVEs3a1AwV0IvQ0d5?=
 =?utf-8?B?Sm1lb1YvajFHSE90NEVwRGc2WU5WU0JIbmtSNjYrc1ZkbEdFVkQ4QlhXRDcx?=
 =?utf-8?B?V3gvZGJ1TzVmeHFRUERoeTcxZ3NEODhKTU9OMHQ5SDUwaU9LR3ZmUk5XSHBr?=
 =?utf-8?B?RDB5WWRmeVY0dWo0ZnJYaUJMaWE1OTR4aGd4NVoxZ2dvY1RPdGowSi83K2M5?=
 =?utf-8?B?a3dORld4UVdUbUF6bVoxQ2pGTzU3bkVuQUFrak1jWUJHTGRHV09GbXAzRHVz?=
 =?utf-8?B?OUpXOHU3K2ZiY3UyMmJtWGRPenQ0cnZhZVZRcTNKQlNMTGg0YlJjSm1IeURG?=
 =?utf-8?B?M05aYWkvOTNZbmlBeDUvRlU5MGJuRjhwT1B5WklQZFd3Z0MveUY0ZWd0UkNo?=
 =?utf-8?B?VGVmNGwxeWZyaFVOUzhjYy8wcVNOa2Y0VTNlNGdUUzdrK2Urb1hYcHNZNGk1?=
 =?utf-8?B?b3B4ejZ5MXU0Q1hLb0tJSGQ2cFRrY0hzMTJUYXBrSDZKcnZEOFBqRDJDcmZD?=
 =?utf-8?B?SzFuWmtrbSt4YnNKMm5BbVQxa1h3bUVRL090OG9xQzR3aVhrMmwyU21zM2ND?=
 =?utf-8?B?Z1RVdTNJdkpaTDZzRUV5ak1TN1c1RnV5WTV2NURuWmpGeXlTZXAwWm5PM1Bt?=
 =?utf-8?B?V3FUWkQwWU9kQXJBTHRtZS9zV1VMRTF4blJnSkhsaTlHLzcyRjJXbFBSMjk4?=
 =?utf-8?B?bHJmYXlQMnlQMkIyb0Y0WS9weDJ4blNBaVlVTGp4Vys0eWd4c1hjQnV1QmtD?=
 =?utf-8?B?VXIxeDhRY0hUMDVHRXU5dDlLK3lPYkVkYkdmSlp5VHJTOWpNb0tpRUFNVThI?=
 =?utf-8?Q?/7MjUfEGmfiwLmcI=3D?=
X-Exchange-RoutingPolicyChecked: Gv14t9ym42DxwtXalHYIoIqHaYksqGhsoRNYMsi4q/DIJH1fx2qEoGuF1h4E4fjV6VdQa/JL4wUCDJu3Y5u6moEAHDmuMZxcRjjo9D5WBtxGhvaQxeP+FSBWT9aFH7xoKUjUHLFnv8Yp9xNXhGK8TfTgFI0Jxy8e8tUlZG0TuY7t2nOqFxcZ+51rK7RRJE55yG7uMrSJLw23+vmkKztSQdJDGXWwgeSLXaVDTzWa8+FA3tBvPWvc2DA2ZoVqEwov11qdFY7pq7LeB+MSR65wvPzZP57Raqxs8AdQcPWzAH3OTXMvp1Bvv88Ju1r6ZdanDXrd5kZC1nUcZqeYoq4bBA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e81b6f9f-9677-4111-856c-08df102ba2a8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 17:39:31.2744 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T4nbKbEmDhXTI10oM5VkarO2dyHf4zMxrRMLpJo3KthNRoURDqqIC3e8y6QkCwVIfrGbpSLUsyiB8Q0ga7/U7BdHqKA+1fG6v1XXYbn4uS0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB682247
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


On 9/9/2026 9:18 AM, tilak.tirumalesh.tangudu@intel.com wrote:
> From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>
> adjust_idledly() has several corner-case issues flagged during review:
>
>    1. If xe_gt_clock_init() failed to recognise the crystal clock,
>       gt->info.timestamp_base is 0, which makes idledly_units_ps also 0.
>       The subsequent DIV_ROUND_CLOSEST(..., idledly_units_ps) is then a
>       divide-by-zero and panics the kernel.
>
>    2. The tick-to-ns conversions are done in u32:
>          idledly * idledly_units_ps, (maxcnt - 1) * 1000
>       Both overflow u32 before DIV_ROUND_CLOSEST() sees them.
>
>    3. If IDLE_WAIT_TIME reads back as 0, maxcnt evaluates to 0 and
>       the maxcnt - 1 clamp wraps to 0xFFFFFFFF in u32.
>
>    4. The register only stores whole ticks, so the clamped ns value has
>       to be converted to ticks and back. DIV_ROUND_CLOSEST() can round
>       that conversion up past maxcnt:
>
>         maxcnt = 640 ns, one tick = 666664 ps
>
>         clamp:        maxcnt - 1        = 639 ns
>         ns -> ticks:  639000 / 666664   = 0.958 -> rounds to 1 tick
>         tick -> ns:    1 * 666664 / 1000 = 667 ns
>
>       667 ns is programmed into RING_IDLEDLY, but 667 >= maxcnt (640),
>       so xe_gt_WARN_ON() fires again on every subsequent init.
>
> Warn and return early if timestamp_base is 0 (the unknown-crystal path).
> Do the conversions in u64 via the *_ULL() helpers so they cannot wrap.
> Clamp with a floor (DIV_ROUND_DOWN_ULL) so the programmed delay stays
> strictly below maxcnt, and guard the maxcnt == 0 case with a zero delay
> while still writing RING_IDLEDLY so INHIBIT_SWITCH_UNTIL_PREEMPTED is
> cleared.
>
> Fixes: d2de4410a88f ("drm/xe: Apply Wa_16023105232")
> Cc: stable@vger.kernel.org
> Assisted-by: GitHub_Copilot:claude-opus-4.8
> Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_hw_engine.c | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 010499766fce..c86890e09b55 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -594,18 +594,26 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
>   	bool inhibit_switch = 0;
>   
>   	if (!IS_SRIOV_VF(gt_to_xe(hwe->gt)) && XE_GT_WA(gt, 16023105232)) {
> +		/* xe_gt_clock_init() zeroes timestamp_base on unknown crystal clock. */
> +		if (!idledly_units_ps) {
> +			xe_gt_warn(gt, "idledly WA skipped: timestamp_base is 0\n");
There is already a xe_gt_warn in xe_gt_clock.c when timestamp_base is 
set to 0 in xe_gt_clock.c, so this is redundant. CI failures will happen 
if this is the case anyway.
> +			return;
> +		}
> +
>   		idledly = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
>   		maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
>   
>   		inhibit_switch = idledly & INHIBIT_SWITCH_UNTIL_PREEMPTED;
>   		idledly = REG_FIELD_GET(IDLE_DELAY, idledly);
> -		idledly = DIV_ROUND_CLOSEST(idledly * idledly_units_ps, 1000);
> +		idledly = DIV_ROUND_CLOSEST_ULL((u64)idledly * idledly_units_ps, 1000);
>   		maxcnt = REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt);
>   		maxcnt *= maxcnt_units_ns;
>   
>   		if (xe_gt_WARN_ON(gt, idledly >= maxcnt || inhibit_switch)) {
> -			idledly = DIV_ROUND_CLOSEST(((maxcnt - 1) * 1000),
> -						    idledly_units_ps);
> +			/* Floor below maxcnt; write 0 to still clear the inhibit bit. */
> +			idledly = maxcnt ?

shouldn't this be idledly >= maxcnt ?

Thanks,

Vinay.

> +				DIV_ROUND_DOWN_ULL((u64)(maxcnt - 1) * 1000,
> +						   idledly_units_ps) : 0;

>   			xe_mmio_write32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base), idledly);
>   		}
>   	}
