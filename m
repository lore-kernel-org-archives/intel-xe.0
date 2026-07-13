Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3D5C44501
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 18:13:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ECD210E0FF;
	Mon, 13 Jul 2026 18:13:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SJNzvLj2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2650310E0FF
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 18:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783966401; x=1815502401;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ee7lofhPlQhjexJKmscBpBtxjvCALs//TODhCz3TvNA=;
 b=SJNzvLj2sG+EmTsiPnF6/ItDjEpqx6R23hVfVc4TjOUao3/XUMR8xdP4
 TCtMW36blP3EEgFWhvVNB5MBpMC1wv6m/G+/ajY46//XvqrnixtoXqgEM
 +Wex5aU+mP/S1J+zqdO8W2vwCflRB5/w9icfOrrxRLuxKk1pcc+f0sV0o
 KKiwSQOFLHzoiYxJM/sdVJG28qvzju4qPWyRTMBTsLD6xBjaR4TJWKwRy
 EbFAuItya820R8b5QqmmQImNNaMchYVbqZUF5D2EswsIAF+rp5TufBd/d
 YhonzzRPkJ3oqY34b7Q+5YHPJLKQ1R0gzZCvLnPFJx2hhd8KM0hwf35Ch g==;
X-CSE-ConnectionGUID: /XwZKmrNTpqaqKSrBur0tw==
X-CSE-MsgGUID: O5fj0wHXSharBzkJH/8V+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84776351"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84776351"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 11:13:20 -0700
X-CSE-ConnectionGUID: CK8nR287TGua673wNvudgQ==
X-CSE-MsgGUID: CSqBj1KrQz27QVNyWfffPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="252238559"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 11:13:20 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 13 Jul 2026 11:13:19 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 13 Jul 2026 11:13:19 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.61) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 13 Jul 2026 11:13:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iJyZBGj21Nu2vAp82x7Oo4NIzr7gIjmyxZx3GaABlcQOwDAsTJYsfCwjvD81RAKkDMEQ3J4RiYOIn5WL5OpVuOn/cbBtexpzHkt5yqIllio9/03XSF4xZw99HKfd8p+NuaNKs2FsfmSrAfg9OTSEDKyBulxTOHk0pglG0aP8ZP8pimoVVl27CD1IjHFjftV3Hs26ej0+fGgczFwDWGau0W+aK68fM7/NFjGC+JKENdHMdSjoxWZIV0Ba/sb2+w93C9fCTzr5WIxKh3KA0PImwZ59hxN5LaX9/o1zHikjSTxVzx7jBekoEIWoboWOMscBrQbdZXwS9ISwsWDNIviPcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sGIhjmCLtgAee+Comep/4rwqi+wPuICxCDQKvRHYBTM=;
 b=sNRxqvmC39TU2ptOv14lK8cudnTJEEKp/mH9fq7tepu49C2QCQtKv+gazyEvnwfl7haYYNmEfUA6Jd2oL8GaOhyMhKQRJ7TuDz0j6sUlwu/85eVmSm+J5tiCcInqlilEkzd1iPq8h3vwNl5yj6X5vwpPv+XFvnt4VIQEhUoIehmhdD1XVhM+b6ARZAxzEnFHQmlCETDdHB/XvsUZRaIeTpbW+uqypPH2GE2CIC6ioTmsanS/ZcCX1/x3CuIGwpUBzdVupnwurv9E4ymT70OzthrQcw2Pt/sTJD9/kQ/3Q6Oc63KD94fHmAo/pBK8tCzUSO2x58vegpLJEyKvGBg8Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by LV3PR11MB8578.namprd11.prod.outlook.com (2603:10b6:408:1b3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.23; Mon, 13 Jul
 2026 18:13:15 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::e0e6:a2f:a53b:4414]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::e0e6:a2f:a53b:4414%4]) with mapi id 15.21.0202.018; Mon, 13 Jul 2026
 18:13:15 +0000
Message-ID: <0f86b9a4-7aff-44e8-808c-eff0b6ce3428@intel.com>
Date: Mon, 13 Jul 2026 14:13:12 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe/guc: Compress GuC log and CTB dump with zstd
To: <intel-xe@lists.freedesktop.org>
References: <20260629172239.2377117-1-zhanjun.dong@intel.com>
 <20260629172239.2377117-3-zhanjun.dong@intel.com>
 <akNG5Nv/dp6+m4mP@gsse-cloud1.jf.intel.com>
 <81ecaed7-47cf-4b13-9c0a-31e7bf189a54@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <81ecaed7-47cf-4b13-9c0a-31e7bf189a54@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0358.namprd04.prod.outlook.com
 (2603:10b6:303:8a::33) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|LV3PR11MB8578:EE_
X-MS-Office365-Filtering-Correlation-Id: 25e28ff4-eb09-4370-1cfa-08dee10a686d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|4143699003|11063799006|6133799003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: cQarM+C9qJkAZ+NApehZ+N6CpBsPXEmkTJqsn3uQOIbCzRqjau/qVytmOWWa14qaXg2x8kEUcp//2iEILOOAGa+HUlMUNbcHK0Ye9typYUzpGphfLnDAeHilSONi/kzA1CJAn6vZWyPfq79aeDDmcKQSpuwanCcjjU2GuKKoHLMAo+seStSuHyXTOqkctO6blQYM3Z5X82WBazVq6TBjNZSo7QLOeYoGfR7dhrELfm6B5pOCsS9Wfy9s5bv17pdneQP6V1ItS6izSIR8SybxxbcqBZm+s0D0HUVVc1MRDq7J5z753b6hgDqwYYg9iI7Me//v8QUXobu5jFEFSLsFSPsfVi8F/yu4Aq1PAYEbdf53MtvoIu/pzXICGQM6DP+Wo/n7upv1v0hZtruAQrf3SgEcMUytShRYMzCcKb7+zZB9kru9o1Wt9Gmb9z+HzeKY6QchS8FvBhkCutC7oZa/Z3NKqHnnErLH56ZXOSqtIk9UzQRT7qW6AWYXd6JAqtRzxvPcPAlXqdu7C+ftqOS0+VtdZ5Mhh87P3t0D4UCW49933VN0akF0syRa2pT0pmvolXhx0+W8n7mXpQNwMeVky5tfiHo/jwhKZLdMEYVV+pDTiOPNIWB5nr5uzXkVYXVgdSo4+p5wyZt/uy3rgSzRcpuvC4giDF17imbptIJiRT8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(4143699003)(11063799006)(6133799003)(56012099006)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REN2MFhYelVMTEl1V2h4MFpYUXMzNWpPVnZ4cG9zY1FObDBuSmJ2WFAzbG00?=
 =?utf-8?B?bS9BbDUrSFoyZTUvbEdwbktTd3NnRndNU0t4Wi9HWUJOVTRzcUtxZks3VWNy?=
 =?utf-8?B?YVVrMkdLclhFa0lhL0RLbjJvcWZTL1RGRFVQeGl4OWVrR1h5TXRSMGIvclpO?=
 =?utf-8?B?RnFwWS9zTDgzTjRYZFlWY1ZkRUpKOHovSlhydmRVVzRrWUhSRXdMKzAzalVr?=
 =?utf-8?B?UXl0c2VBN29tSG41ZkZNWGhlc2dJSWlOQmFjY2dPYVRGLzJKamJtNkZKYSto?=
 =?utf-8?B?ZmZQNllndUhlN0tTdnc1SkkwOFNOL0dRRkJmYUtqR2d0M3lwVHZzeXdVZzUw?=
 =?utf-8?B?YVZrUFdyMG4wWm1ncnRIeW5EaHZJQnZ0N3NjMlRYZm5USDRXQVI1dWkwOEVO?=
 =?utf-8?B?N1cxNlVuakc1ZWRTODdsenZ1RWxlVEgxSFZtc3cvbFFDN3ZQbmE4Zm1hUUhN?=
 =?utf-8?B?WlZCcWg3bWJNTXNESHJsVWkySzFWV3JISzlpVytBeFQ2Z1EwT2N0WnVZcSt5?=
 =?utf-8?B?NGV0MXYyWWVKMm5IZ3Uya2hsUE95YXhNYnUrQjUrQm0wbmRqazVvNGlSNFNv?=
 =?utf-8?B?QjRlV0U3VVVqdFpYVW5YaElXUC9qVGJNUVNNM1FQR05McldESExTV2p2WTZw?=
 =?utf-8?B?Z0lBbHNOalkwandkTTljK1BrRzdadnArUVBGV2JIOW9pU25RMmdLZkMrdjdr?=
 =?utf-8?B?NDA5WW5JWnp5UTQ2aVRkZHh6eHBtUnp5YUZITVMwUlJRMkVSQnp0cUdWbWFm?=
 =?utf-8?B?NWlBTkVDQ0xqVzN1dFpZQzdSbVlCb2NyWmNFaUg4YWk1eDQ1VWlLcHcwSnVy?=
 =?utf-8?B?RnlhNFlOaGNtdHpzeFFkK0IwSFFqV25xSG5WdmJSM3d3dm5oSUdvVTZhdGdw?=
 =?utf-8?B?azh6QkRWQ21EVkdPSklmMWhPM3gxUWlJb0EyMjNBeTllaE8yc3hESnF0c1NC?=
 =?utf-8?B?SjNXd0hCZFVjL2hnTVIyZ2xEZGl5c1ZtZVFtajBkZHRwT2lrcHdweXdLSWR2?=
 =?utf-8?B?SnFTUnk5YXhJcDlUYXppM3FGRnlKbDBGVllQSGpaYU9hd244dVl0bUNMaWpD?=
 =?utf-8?B?ZExlYU8vOEVKcmdQaHRPaXJ2Q2dZeEN2aU1ZVzU2a0w1QktVckJkYkZwRDQ5?=
 =?utf-8?B?cGpDWnFwOFJoSG9XdE5oK0pTV2xnUENoWlY5dDJtUEtKT0JINnVGSE8vcTc2?=
 =?utf-8?B?TWlUbjJFSzI3M1ozNWJseUlDV1dxR2RpWndHVGs1TGhwMTNGNTJQa1BDK1lE?=
 =?utf-8?B?UzluSTZEQ2oreWF2R1RPRWJSRUU2UzlQMFl0S241RGJIMVV6c1N3VDVFTlln?=
 =?utf-8?B?OFZFNHJHRUI0bTVUMXh4OXJ5NXJPK2RBdE9UUzlQS3hJUitXTnZzQXNHbFJP?=
 =?utf-8?B?QjNtUkg3cWVGSjdLcVRSTWl0bjNJYkxvV0xOVVZYOHVQNVZkdFNCdnFCMmlx?=
 =?utf-8?B?bnZLNGFXUUUzWFZ6aFc2UXNwUEpvSnNwcXo3eDlKVWFtbEhya25SVlZKLzlO?=
 =?utf-8?B?eFZ2VWZQSzY0NXAwREhKL0RxbGJqd1FCVm1wQjBtUDByNFZ0Qm0wQnJXS0oy?=
 =?utf-8?B?dVVqRlpIQWd4ZnpYUmFHNkUwYkdNdVErM2h0bW5MK05EbVlmU2dodVplR0hm?=
 =?utf-8?B?OTNIaDJYSHZCbTVRbk1QMnl3TmR0RFBraTRzWlBwVFBqaDNYV2lpNThzQ096?=
 =?utf-8?B?amlXUTZEMVoreC9DZHpzZHl1cXFZTEJFeDMwUXp6U2FrMjc4Rmo2dHZMaEN1?=
 =?utf-8?B?UUxKdXZ2R1dVUDE2WHVGNEJ0WExqTXFycVkwYzFLdzNHOVBISitQWEZzcU1G?=
 =?utf-8?B?alc4TWNEWWVoVnhEbXJqZ0krUU1yREJQY05hOU5NdmNWbVY5LzdwUDB3ZGVM?=
 =?utf-8?B?cXd0SjBMYzJIS3RJdGFFWDNEOUs5V21uamlBUGVrMGxjVHluekwzNWJkeXhW?=
 =?utf-8?B?eTUxTHBwYlRONUJMSWZJVHl5ODlqR0Z2WEFoaDJrMEQvVjZVQTZBMm40M2t4?=
 =?utf-8?B?c3l6ejFPUFVNQlhWdy94UStvb2tCZ0ZuOUsvcWZ1QnJYbjd5WmtLZ0diWURk?=
 =?utf-8?B?NkZrdFpJUnVMaEk2NTRFZTdETFJDSHhvR0JTQ2p4ZTB5cU9NWUt4cTJEMGNh?=
 =?utf-8?B?VHo3OEVhSGJsV21vSU1VUjVoVitzbXJKclQyNFdFVlZJb0xxWUwvcjRpTm51?=
 =?utf-8?B?SzBXcjcxK1FWMUhYaXFyNmwxV2I1ZU56bXlFZ2RoK24xaGhUVUxnTTVvbHZt?=
 =?utf-8?B?dkRLZXFXelVlOWtxc05MM1krTHJxL3IzSnFiV2N6RStadlFqaVB1Umkxcitx?=
 =?utf-8?B?cDluQ081ZkxwaFlURnA2RmxQaWtnQ3V0eFhhYXZiYWZuNm1uUHFJQT09?=
X-Exchange-RoutingPolicyChecked: ofjF+zwysEPcg+NvYy/JhIVt8mOg7FPtSrhBxO6YehPaS/yCzQ0Bpg8CtPHgSE9S5NjO/AUlzcTUK5CpiO8jr+Zuxt/yCNB6bd8VjbXnPK7z6gbsHifS6mtL27RJWIkrlXz1JaiDvnwtFKGKzzhl5w3pdMlU6O1CCbcsZomFx8RQxF5Xi3tyHgGJSzTaM1kuV33l3K5/iUcH7Cvb70BIuU+62vEKboUgvjR1aQYHzwIzj65Su5nKyNfa3LEJeUjqGg9aXLx6p69/+EE1XF8a8bZp2UVrCjTqy3DACGG9lMy8h8R+loCoO49pdhSbu1+5O/0GjGTzySw1EXnyLbWq8w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 25e28ff4-eb09-4370-1cfa-08dee10a686d
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 18:13:15.3545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ndd010LbCY3FvLTlEuUAc0DyrYrVPv/pAFHjSagtRmv9OnXyl3BlGMX4ehYxf5GWRK5FVdCdgxzutvWGmCDUPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8578
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

Hi Matthew,

I wanted to follow up on this thread to see if there is any additional 
feedback on this topic I shared a few days ago.

If there is anything else holding us back from moving to the next stage, 
please let me know. I'd be happy to provide more context if needed.

Best regards,
Zhanjun Dong

On 2026-06-30 1:35 p.m., Dong, Zhanjun wrote:
> Please see my inline comments below.
> 
> Regards,
> Zhanjun Dong
> 
> On 2026-06-30 12:32 a.m., Matthew Brost wrote:
>> On Mon, Jun 29, 2026 at 01:22:39PM -0400, Zhanjun Dong wrote:
>>> Replace the raw ascii85 dumps of GuC log snapshots with a
>>> zstd-compressed ascii85 stream and reuse the same helper for CTB
>>> snapshot output.
>>>
>>> Use zstd streaming with default level-3 parameters and an estimated
>>> source size of 0 so the compression workspace stays bounded even for
>>> multi-megabyte logs.
>>>
>>> Add a new Kconfig option DRM_XE_COMPRESS_DUMP to control whether
>>> GuC log and CTB dumps are compressed with ZSTD. This allows users to
>>> choose between reduced dump sizes or lower memory usage.
>>>
>>
>> What is the advantage of doing this the KMD vs. getting the dump and
>> compressing it in user space before sharing it?
> 1. Timing impact
> There are KMD runtime challenges about dump too many data:
> a. Skip unused data.
> Existing code dumps whole buffer, which also prints out area not used 
> (Like lots of lines of "Z"). This patch only print valid range in buffer.
> b. Compessed size
> Test shown a typical 75% compression ratio about valid GuC log data.
> 
> Print out 10MB debug data in ascii85 take quiet a lot of time, 
> especially when print out to dmesg. Too long print out might cause 
> timing impact to runtime, which is bad for debug purpose.
> With fewer data, this relifes KMD pressure when triggered.
> 
> 2. UMD utility required
> Do it in UMD requires an utility running in background and check/receive 
> for data. If through debugfs, all above timing impact is not skipped.
> This add extra step for CI and user, in case of utility missing/offline, 
> the valueable issue data would be lost
> 
> Meanwhile, there is discussion to have that kind of utility, will keep 
> monitoring it.
>>
>>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/Kconfig          |  16 +++
>>>   drivers/gpu/drm/xe/xe_devcoredump.c |   4 +-
>>>   drivers/gpu/drm/xe/xe_guc_ct.c      |  19 ++--
>>>   drivers/gpu/drm/xe/xe_guc_ct.h      |   4 +-
>>>   drivers/gpu/drm/xe/xe_guc_log.c     | 161 +++++++++++++++++++++++++---
>>>   drivers/gpu/drm/xe/xe_guc_log.h     |   9 +-
>>>   6 files changed, 184 insertions(+), 29 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>>> index 4d7dcaff2b91..3af15a0c14f7 100644
>>> --- a/drivers/gpu/drm/xe/Kconfig
>>> +++ b/drivers/gpu/drm/xe/Kconfig
>>> @@ -33,6 +33,8 @@ config DRM_XE
>>>       select ACPI_WMI if X86 && ACPI
>>>       select SYNC_FILE
>>>       select CRC32
>>> +    select ZSTD_COMPRESS if DRM_XE_COMPRESS_DUMP
>>> +    select ZSTD_DECOMPRESS if DRM_XE_COMPRESS_DUMP
>>>       select SND_HDA_I915 if SND_HDA_CORE
>>>       select CEC_CORE if CEC_NOTIFIER
>>>       select VMAP_PFN
>>> @@ -101,6 +103,20 @@ config DRM_XE_PAGEMAP
>>>         If in doubt say "Y".
>>> +config DRM_XE_COMPRESS_DUMP
>>> +    bool "Enable ZSTD compression for error dumps"
>>> +    depends on DRM_XE
>>> +    default y
>>
>> Are tools to decode GuC logs updated to handle this mode?
> Current intel_dump_decode only support i915, we need more Xe debug 
> support.>
>> Matt
>>
>>> +    help
>>> +      Enable this option to compress GuC log and CTB dumps with ZSTD
>>> +      compression. This can significantly reduce the size of error 
>>> dumps
>>> +      but requires additional memory for compression workspace.
>>> +
>>> +      Disable this option if you want to save memory or prefer 
>>> uncompressed
>>> +      error dumps for debugging.
>>> +
>>> +      If in doubt say "Y".
>>> +
>>>   config DRM_XE_FORCE_PROBE
>>>       string "Force probe xe for selected Intel hardware IDs"
>>>       depends on DRM_XE
>>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/ 
>>> xe/xe_devcoredump.c
>>> index 5f2b90b18f97..27473c25aad2 100644
>>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>>> @@ -115,9 +115,9 @@ static ssize_t __xe_devcoredump_read(char 
>>> *buffer, ssize_t count,
>>>       drm_printf(&p, "\tTile: %d\n", ss->gt->tile->id);
>>>       drm_puts(&p, "\n**** GuC Log ****\n");
>>> -    xe_guc_log_snapshot_print(ss->guc.log, &p);
>>> +    xe_guc_log_snapshot_print(ss->guc.log, &p, ss->gt);
>>>       drm_puts(&p, "\n**** GuC CT ****\n");
>>> -    xe_guc_ct_snapshot_print(ss->guc.ct, &p);
>>> +    xe_guc_ct_snapshot_print(ss->guc.ct, &p, ss->gt);
>>>       drm_puts(&p, "\n**** Contexts ****\n");
>>>       xe_guc_exec_queue_snapshot_print(ss->ge, &p);
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/ 
>>> xe_guc_ct.c
>>> index 21e0dad9a481..4cedbcdb831e 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>> @@ -2094,11 +2094,12 @@ struct xe_guc_ct_snapshot 
>>> *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct)
>>>    * xe_guc_ct_snapshot_print - Print out a given GuC CT snapshot.
>>>    * @snapshot: GuC CT snapshot object.
>>>    * @p: drm_printer where it will be printed out.
>>> + * @gt: GT structure for error reporting
>>>    *
>>>    * This function prints out a given GuC CT snapshot object.
>>>    */
>>>   void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
>>> -                  struct drm_printer *p)
>>> +                  struct drm_printer *p, struct xe_gt *gt)
>>>   {
>>>       if (!snapshot)
>>>           return;
>>> @@ -2112,11 +2113,10 @@ void xe_guc_ct_snapshot_print(struct 
>>> xe_guc_ct_snapshot *snapshot,
>>>           drm_printf(p, "\tg2h outstanding: %d\n",
>>>                  snapshot->g2h_outstanding);
>>> -        if (snapshot->ctb) {
>>> -            drm_printf(p, "[CTB].length: 0x%zx\n", snapshot->ctb_size);
>>> -            xe_print_blob_ascii85(p, "[CTB].data", '\n',
>>> -                          snapshot->ctb, 0, snapshot->ctb_size);
>>> -        }
>>> +        if (snapshot->ctb)
>>> +            xe_guc_print_blob(gt, p, "[CTB]", "[CTB].data",
>>> +                      &snapshot->ctb, 1,
>>> +                      snapshot->ctb_size, snapshot->ctb_size);
>>>       } else {
>>>           drm_puts(p, "CT disabled\n");
>>>       }
>>> @@ -2150,9 +2150,10 @@ void xe_guc_ct_snapshot_free(struct 
>>> xe_guc_ct_snapshot *snapshot)
>>>   void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, 
>>> bool want_ctb)
>>>   {
>>>       struct xe_guc_ct_snapshot *snapshot;
>>> +    struct xe_gt *gt = ct_to_gt(ct);
>>>       snapshot = guc_ct_snapshot_capture(ct, false, want_ctb);
>>> -    xe_guc_ct_snapshot_print(snapshot, p);
>>> +    xe_guc_ct_snapshot_print(snapshot, p, gt);
>>>       xe_guc_ct_snapshot_free(snapshot);
>>>   }
>>> @@ -2250,10 +2251,10 @@ static void ct_dead_print(struct xe_dead_ct 
>>> *dead)
>>>       drm_printf(&lp, "\tTile: %d\n", gt->tile->id);
>>>       drm_puts(&lp, "**** GuC Log ****\n");
>>> -    xe_guc_log_snapshot_print(dead->snapshot_log, &lp);
>>> +    xe_guc_log_snapshot_print(dead->snapshot_log, &lp, gt);
>>>       drm_puts(&lp, "**** GuC CT ****\n");
>>> -    xe_guc_ct_snapshot_print(dead->snapshot_ct, &lp);
>>> +    xe_guc_ct_snapshot_print(dead->snapshot_ct, &lp, gt);
>>>       drm_puts(&lp, "Done.\n");
>>>   }
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/ 
>>> xe_guc_ct.h
>>> index 767365a33dee..2005d1a0cd6c 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
>>> @@ -10,6 +10,7 @@
>>>   struct drm_printer;
>>>   struct xe_device;
>>> +struct xe_gt;
>>>   int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct);
>>>   int xe_guc_ct_init(struct xe_guc_ct *ct);
>>> @@ -24,7 +25,8 @@ void xe_guc_ct_flush_and_stop(struct xe_guc_ct *ct);
>>>   void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
>>>   struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct 
>>> xe_guc_ct *ct);
>>> -void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, 
>>> struct drm_printer *p);
>>> +void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, 
>>> struct drm_printer *p,
>>> +                  struct xe_gt *gt);
>>>   void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
>>>   void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, 
>>> bool want_ctb);
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/ 
>>> xe_guc_log.c
>>> index 538d4df0f7aa..d20be1a064f1 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>>> @@ -6,6 +6,9 @@
>>>   #include "xe_guc_log.h"
>>>   #include <linux/fault-inject.h>
>>> +#if IS_ENABLED(CONFIG_DRM_XE_COMPRESS_DUMP)
>>> +#include <linux/zstd.h>
>>> +#endif
>>>   #include <linux/utsname.h>
>>>   #include <drm/drm_managed.h>
>>> @@ -225,16 +228,148 @@ struct xe_guc_log_snapshot 
>>> *xe_guc_log_snapshot_capture(struct xe_guc_log *log,
>>>       return snapshot;
>>>   }
>>> +#if IS_ENABLED(CONFIG_DRM_XE_COMPRESS_DUMP)
>>> +static void xe_guc_print_blob_compressed(struct xe_gt *gt, struct 
>>> drm_printer *p,
>>> +                     const char *length_label, const char *data_label,
>>> +                     void **chunks, int num_chunks,
>>> +                     size_t chunk_size, size_t total_size)
>>> +{
>>> +    zstd_parameters params;
>>> +    zstd_cstream *cstream;
>>> +    zstd_out_buffer outbuf;
>>> +    size_t wksp_size, dst_size;
>>> +    size_t remain, ret;
>>> +    void *wksp = NULL;
>>> +    char *dst = NULL;
>>> +    int i;
>>> +
>>> +    /*
>>> +     * Pass 0 as estimated_src_size to use zstd level-3 defaults
>>> +     * (windowLog=18, 256KB window). Passing the full total_size would
>>> +     * cause zstd to inflate windowLog proportionally (e.g. 
>>> windowLog=24
>>> +     * for a 19MB log), making the workspace tens of MB.  With 0, the
>>> +     * workspace stays ~1.5MB, well within kmalloc limits.
>>> +     */
>>> +    params = zstd_get_params(3, 0);
>>> +
>>> +    wksp_size = zstd_cstream_workspace_bound(&params.cParams);
>>> +    wksp = kvzalloc(wksp_size, GFP_KERNEL);
>>> +    if (!wksp)
>>> +        goto err;
>>> +
>>> +    dst_size = zstd_compress_bound(total_size);
>>> +    dst = kvzalloc(dst_size, GFP_KERNEL);
>>> +    if (!dst)
>>> +        goto err;
>>> +
>>> +    cstream = zstd_init_cstream(&params, 0, wksp, wksp_size);
>>> +    if (!cstream) {
>>> +        xe_gt_err(gt, "failed to init zstd cstream\n");
>>> +        goto err;
>>> +    }
>>> +
>>> +    outbuf.dst = dst;
>>> +    outbuf.size = dst_size;
>>> +    outbuf.pos = 0;
>>> +
>>> +    remain = total_size;
>>> +    for (i = 0; i < num_chunks && remain; i++) {
>>> +        size_t size = min(chunk_size, remain);
>>> +        zstd_in_buffer inbuf = { .src = chunks[i], .size = 
>>> size, .pos = 0 };
>>> +
>>> +        while (inbuf.pos < inbuf.size) {
>>> +            ret = zstd_compress_stream(cstream, &outbuf, &inbuf);
>>> +            if (zstd_is_error(ret)) {
>>> +                xe_gt_err(gt, "zstd_compress_stream failed: %s\n",
>>> +                      zstd_get_error_name(ret));
>>> +                goto err;
>>> +            }
>>> +        }
>>> +        remain -= size;
>>> +    }
>>> +
>>> +    do {
>>> +        ret = zstd_end_stream(cstream, &outbuf);
>>> +        if (zstd_is_error(ret)) {
>>> +            xe_gt_err(gt, "zstd_end_stream failed: %s\n",
>>> +                  zstd_get_error_name(ret));
>>> +            goto err;
>>> +        }
>>> +    } while (ret > 0 && outbuf.pos < outbuf.size);
>>> +
>>> +    drm_printf(p, "%s.length: 0x%zx -> 0x%zx Algo: ZSTD\n",
>>> +           length_label, total_size, outbuf.pos);
>>> +    xe_print_blob_ascii85(p, data_label, '\n', dst, 0,
>>> +                  DIV_ROUND_UP(outbuf.pos, sizeof(u32)) * sizeof(u32));
>>> +    goto out;
>>> +
>>> +err:
>>> +    drm_printf(p, "%s.length: 0x%zx Algo: ERROR (compression 
>>> failed)\n",
>>> +           length_label, total_size);
>>> +out:
>>> +    kvfree(dst);
>>> +    kvfree(wksp);
>>> +}
>>> +#endif
>>> +
>>>   /**
>>> - * xe_guc_log_snapshot_print - dump a previously saved copy of the 
>>> GuC log to some useful location
>>> - * @snapshot: a snapshot of the GuC log
>>> - * @p: the printer object to output to
>>> + * xe_guc_print_blob - Print binary data (compressed or 
>>> uncompressed) as ascii85
>>> + * @gt: GT structure for error reporting
>>> + * @p: drm_printer for output
>>> + * @length_label: label prefix for the length/metadata line (e.g. 
>>> "[LOG]" or "[CTB]")
>>> + * @data_label: label for the ascii85 blob (e.g. "[LOG].data" or 
>>> "[CTB].data")
>>> + * @chunks: array of pointers to source data chunks
>>> + * @num_chunks: number of elements in @chunks
>>> + * @chunk_size: nominal size of each chunk; the last chunk may hold 
>>> fewer valid bytes
>>> + * @total_size: total uncompressed byte count across all chunks
>>> + *
>>> + * If CONFIG_DRM_XE_COMPRESS_DUMP is enabled, compresses @total_size 
>>> bytes using
>>> + * zstd level-3 streaming compression and prints the result via @p 
>>> using ascii85
>>> + * encoding. Otherwise, directly prints the uncompressed data.
>>> + * On failure the function returns without printing the data blob.
>>>    */
>>> -void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, 
>>> struct drm_printer *p)
>>> +void xe_guc_print_blob(struct xe_gt *gt __maybe_unused, struct 
>>> drm_printer *p,
>>> +               const char *length_label, const char *data_label,
>>> +               void **chunks, int num_chunks,
>>> +               size_t chunk_size, size_t total_size)
>>>   {
>>> +#if IS_ENABLED(CONFIG_DRM_XE_COMPRESS_DUMP)
>>> +    xe_guc_print_blob_compressed(gt, p, length_label, data_label,
>>> +                     chunks, num_chunks, chunk_size, total_size);
>>> +#else
>>> +    /* Compression disabled, output uncompressed data directly */
>>>       size_t remain;
>>>       int i;
>>> +    drm_printf(p, "%s.length: 0x%zx Algo: RAW\n", length_label, 
>>> total_size);
>>> +
>>> +    /*
>>> +     * Print each chunk directly without merging into a single buffer.
>>> +     * xe_print_blob_ascii85() supports multiple calls - use suffix=0
>>> +     * for all but the last chunk to omit the newline between chunks.
>>> +     */
>>> +    remain = total_size;
>>> +    for (i = 0; i < num_chunks && remain; i++) {
>>> +        size_t size = min(chunk_size, remain);
>>> +        const char *prefix = i ? NULL : data_label;
>>> +        /* Add suffix only on the last chunk */
>>> +        char suffix = (remain == size) ? '\n' : 0;
>>> +
>>> +        xe_print_blob_ascii85(p, prefix, suffix, chunks[i], 0,
>>> +                      DIV_ROUND_UP(size, sizeof(u32)) * sizeof(u32));
>>> +        remain -= size;
>>> +    }
>>> +#endif
>>> +}
>>> +
>>> +/**
>>> + * xe_guc_log_snapshot_print - dump a previously saved copy of the 
>>> GuC log to some useful location
>>> + * @snapshot: a snapshot of the GuC log
>>> + * @p: the printer object to output to
>>> + */
>>> +void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, 
>>> struct drm_printer *p,
>>> +                   struct xe_gt *gt)
>>> +{
>>>       if (!snapshot) {
>>>           drm_printf(p, "GuC log snapshot not allocated!\n");
>>>           return;
>>> @@ -248,16 +383,9 @@ void xe_guc_log_snapshot_print(struct 
>>> xe_guc_log_snapshot *snapshot, struct drm_
>>>       drm_printf(p, "GuC timestamp: 0x%08llX [%llu]\n", snapshot- 
>>> >stamp, snapshot->stamp);
>>>       drm_printf(p, "Log level: %u\n", snapshot->level);
>>> -    drm_printf(p, "[LOG].length: 0x%zx\n", snapshot->size);
>>> -    remain = snapshot->size;
>>> -    for (i = 0; i < snapshot->num_chunks; i++) {
>>> -        size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
>>> -        const char *prefix = i ? NULL : "[LOG].data";
>>> -        char suffix = i == snapshot->num_chunks - 1 ? '\n' : 0;
>>> -
>>> -        xe_print_blob_ascii85(p, prefix, suffix, snapshot->copy[i], 
>>> 0, size);
>>> -        remain -= size;
>>> -    }
>>> +    xe_guc_print_blob(gt, p, "[LOG]", "[LOG].data",
>>> +              snapshot->copy, snapshot->num_chunks,
>>> +              GUC_LOG_CHUNK_SIZE, snapshot->size);
>>>   }
>>>   static inline void lfd_output_binary(struct drm_printer *p, char 
>>> *buf, int buf_size)
>>> @@ -598,12 +726,13 @@ void xe_guc_log_print_dmesg(struct xe_guc_log 
>>> *log)
>>>   void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
>>>   {
>>>       struct xe_guc_log_snapshot *snapshot;
>>> +    struct xe_gt *gt = log_to_gt(log);
>>>       drm_printf(p, "**** GuC Log ****\n");
>>>       snapshot = xe_guc_log_snapshot_capture(log, false);
>>> -    drm_printf(p, "CS reference clock: %u\n", log_to_gt(log)- 
>>> >info.reference_clock);
>>> -    xe_guc_log_snapshot_print(snapshot, p);
>>> +    drm_printf(p, "CS reference clock: %u\n", gt- 
>>> >info.reference_clock);
>>> +    xe_guc_log_snapshot_print(snapshot, p, gt);
>>>       xe_guc_log_snapshot_free(snapshot);
>>>   }
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/ 
>>> xe_guc_log.h
>>> index 4649a260755e..3e97647ee8b5 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_log.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
>>> @@ -11,6 +11,7 @@
>>>   struct drm_printer;
>>>   struct xe_device;
>>> +struct xe_gt;
>>>   #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
>>>   #define XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE    SZ_16M
>>> @@ -59,7 +60,13 @@ void xe_guc_log_print(struct xe_guc_log *log, 
>>> struct drm_printer *p);
>>>   void xe_guc_log_print_lfd(struct xe_guc_log *log, struct 
>>> drm_printer *p);
>>>   void xe_guc_log_print_dmesg(struct xe_guc_log *log);
>>>   struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct 
>>> xe_guc_log *log, bool atomic);
>>> -void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, 
>>> struct drm_printer *p);
>>> +
>>> +void xe_guc_print_blob(struct xe_gt *gt, struct drm_printer *p, 
>>> const char *length_label,
>>> +               const char *data_label, void **chunks, int num_chunks,
>>> +               size_t chunk_size, size_t total_size);
>>> +
>>> +void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, 
>>> struct drm_printer *p,
>>> +                   struct xe_gt *gt);
>>>   void xe_guc_log_snapshot_free(struct xe_guc_log_snapshot *snapshot);
>>>   static inline u32
>>> -- 
>>> 2.34.1
>>>
> 

