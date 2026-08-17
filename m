Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81442C5B572
	for <intel-xe@archiver.kernel.org>; Mon, 17 Aug 2026 16:06:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F093C8826D;
	Mon, 17 Aug 2026 16:06:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G4sq1dM1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E41528826D
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Aug 2026 16:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786982798; x=1818518798;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GGwXzlD+Xl67MTyem8z895kA9zSktn9qvnbg/834kcI=;
 b=G4sq1dM1bW68819LeXhiJJHYOYOGE5aHz1o5+XGIAzkEQn7nOGTclBuG
 z1BFA1ut7W23YdrdSJuvJ6kiyU7NxBIcLa4li+N80/hoN/fGWgHuED1U+
 e27k+yrwM9sJA2GrHZZq1YQHR1YXOY7cBeBq0DDxE7F9EG7VkHcJZ3SUS
 0VkDyPp2QT5B7rUYkgbaJ/7h2P/yxAlL3tGR27+Zn0cUGwjZ4z0Nky0qs
 So3w2GuHgbdqjKbK6uhRj70TE0juT9137U2tUBmWcK3S+SPTKAHh97ke8
 ZUE9+XMzq7KZs0btdVbHKgHC/ihgFoRPC2NPsQODGbI8X17srNsyWE6Da w==;
X-CSE-ConnectionGUID: 2plkFDtvSqiwLHac5ldimA==
X-CSE-MsgGUID: r2I1frpeTGKTqsUqxCMwOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98976497"
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; d="scan'208";a="98976497"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 09:06:37 -0700
X-CSE-ConnectionGUID: S5Q6OqI7SpmPgS1R4PQhQg==
X-CSE-MsgGUID: A37DGNXFTXGJRwkby/HMmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; d="scan'208";a="266938083"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 09:06:37 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 09:06:36 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 17 Aug 2026 09:06:36 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.10) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 09:06:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T7+AW3AELJPRs0/J/xN0xw84oFHX3yLWVq4qh5azGi5LhtCCoIcuZ3Ybactqnd2DWpIAAErzuKiFVpBH2E5PHkzTajEWqttAW/qZ8WnLwJZEHjSda4qUaQH8SLFCTuk3HXDlU/Ht+pmnmxP28ilPN8jcFNMN9fAxzsgf7L5x4oDder9bT7gsjINbP3NZ30G/hl77Ae40bGmvuzS9qfQVHxpDETisGqEafwAYRuDqyI91wWbzWxExjQ2DVrdScIuKyYg2DP5IlSfKcyis5oTfipUEjrStI7jCwUlPwHw1gh9tWljcZjRaBCO4Sntv3aWl1gOuump2d2ZoffY1KRTlMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TEqzeNHGRiGC/iZUKXyNjg0ex9L+3errUR4/jQNRxH4=;
 b=Asmzk94Ek5YS6zF6xGB+pUo1FBtVb4UcwfEWQ9ZGbVonclEs7neUBqGjcezSmxaGfWKfVyHm/OXSHuOo6lYBVQzvRYnxCACYnhk30QQarPp5/htPJO0OV27gcKBsLP/Y80J0IegJid6iyYtTwIaxqaGv3mah/L39nwYGDh30TvyhWaxgN88+DAd4syocNKV7ooG0i3T55/qA9oNhIG/J0HLaKnlY2TxQ++HszBPBBiekdRxvMpKSzFbrZnUCav1KummlAmUB3rOiAJGNr55kvTLMbk0OOlzuActiQ1dNFxQsVVWSp/tjX2T+QEEeuL/bLdUhgCiIMZ0tz7I+W14VTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20)
 by DS6PR11MB567341.namprd11.prod.outlook.com (2603:10b6:8:52a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 16:06:35 +0000
Received: from IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce]) by IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce%7]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 16:06:35 +0000
Date: Mon, 17 Aug 2026 12:06:31 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "Wajdeczko, Michal" <michal.wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH V16 10/12] drm/xe: Add sysfs interface for bad gpu vram
 pages
Message-ID: <aoMxh3bh1WEf8SF6@intel.com>
References: <20260817065055.3734576-14-tejas.upadhyay@intel.com>
 <20260817065055.3734576-24-tejas.upadhyay@intel.com>
 <a670328d-b5dc-48b4-bb02-ed7dfa2d48f1@intel.com>
 <DS0PR11MB871812022E070C0052F5AF3F81A72@DS0PR11MB8718.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DS0PR11MB871812022E070C0052F5AF3F81A72@DS0PR11MB8718.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR05CA0183.namprd05.prod.outlook.com
 (2603:10b6:a03:330::8) To IA0PR11MB7752.namprd11.prod.outlook.com
 (2603:10b6:208:442::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7752:EE_|DS6PR11MB567341:EE_
X-MS-Office365-Filtering-Correlation-Id: e5a061f3-83a9-4001-53ab-08defc7982c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|6133799003|10067099003|4143699003|5023799004|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: M3D0VRylIQCq4nlINTjPPY2I63dpejWtvCt2iWclO9CNNpMAhHtmhK0qeQjKvk3hSOubMC6GQa4wARVCmFJlxiW8hfaKNir4zZ6q+e04pDmaGNoduIIHFcqpRUtLwmGN+3zWABpso2m9aptRYlQQ9ZsPYy/tdca8hDXcRSHkEadAEiRSY+6dv75OhA491u8xJTaIg2DdriNiY1qFGvoG/h9XB2/+504ZNr0m6h6qjX2qFN+n1sMwXKI92Wj0WXp9DvSq8Mi40j91uGNB8w0U8O2lZKA7NHiYiprmunpxRpjIpoe3bPanLrfvNfNmZ/5JS+cKEGyJxS6Jy+TYPQKDKPiQr5EBkLNhRxieaR5EoanVXkipX/lqRJpHlzCh9sd7Jt36e34tc5nhXMhSX5eGyIj3FMsOKvqW7wz+NxicM6GRnvuylfv2wXQrS+OobE46Cawf/XaD5mCyOuSHSrZ0Miy7tAyiTJztmn/C4ezCql77LaQhj/W8kEQgHwjYTAaBn+TtLHAbXLnlVP/21adazdcaymT8DmcQLz/qWuF0RKoTUUv9lfT7ZgI3a7O7p/no46UDRb8VMu1CY1KRYOejUuXhKNFrtZh7KDwzKvDyJKiVg9KO8/P/W1JCBq/41W94
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7752.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(10067099003)(4143699003)(5023799004)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzVjeG9xSEFFOVJsUmo5MDYycHBoOWNuZzRqbkNPL0YxK1FFaUtrbUFzYXNQ?=
 =?utf-8?B?N3I2YVBwT2s1YmFCUWVkUmhmcldoYk5ydG9BSzc1YjY4MmlRS1NNanc0aTlT?=
 =?utf-8?B?cFdLelJXcDVsYjZ2M2FIclJtYnBxcFpjeUlKTDY1Z0J2RXhPL09INGpyZ0w4?=
 =?utf-8?B?Sjd3dFkrUndDVTFvRTZMKzJiQzI3WklJWWRWS2tGNDZvYjlxdXBwWTZqRmNv?=
 =?utf-8?B?dlZ4NkpjR2h6bXk3S1UxS2JqaXdYd0szNDJuY3BBZzc2MnNjSC9Fb0NyREYr?=
 =?utf-8?B?UmZmVEUwRHcrazE4elpBQm1Qd05tRmhHdlZKTU1FazQxOEtlL01OV0M1bVo3?=
 =?utf-8?B?SktMeDRyZnpiZzhEalFSTXNRMlM3RlBJSXM3SVhNSjNuRDNUQVpGeGwycUps?=
 =?utf-8?B?M3RGRzRJYlRCendUeElNWXB3dGJaNmRPYVlFRHkrRjllVGRCWU92RXRvakhp?=
 =?utf-8?B?RzlUS01kUDRzd2ZyNVJsbE94M0NYSW9Oc0ZsQzV4UUUrQjFvWUVqNTBkcURI?=
 =?utf-8?B?T0d2ZGU2TENRUE1qSmRCbWEyb1EyZHlVYU96R0gyeERQbzY0YktpQnJ5eGN4?=
 =?utf-8?B?aGVvWlp5ZHdhek1Ebzl1b0o2Ty9NR1VKaWt5UkFnUmh0WjJTUG8rL0JjYWw3?=
 =?utf-8?B?NmU3Z3pvQ3RzNnI2dGxNZnpidmo5T2FrVUs5aW8rekFuKzFxZldaWEhEUkUy?=
 =?utf-8?B?cTh2Sk9WWVhIV0RKN25oNS9xSURRYzNUTzRyODI4N3hTaE9jQmNoM2tpbGNo?=
 =?utf-8?B?blNyMTFQeFNHTkhzSUR2cS9TVDlyZTBUN2M5VDliNDRqYVozaDh1OGZYQWdt?=
 =?utf-8?B?VjFnQ3kwd3FNRVFidm1TYjRRMkF3dXp5SytaN0ZOeXhOK29aSGs5TU8xNVZk?=
 =?utf-8?B?ai9DS2Zjc2tGZ29VMmUyMTFNOGZwbTUzSGo5RkN1dFl6aUszSXhXRldXK3dj?=
 =?utf-8?B?Z0NyNTZ0ckRoakE0UFpOQ3VWZjVSNkZPTDIvRmhOZk15RnNDNGsybUp3OERs?=
 =?utf-8?B?MjRIazc3bXRvYmdqRzgra2NNUjltejhnc0VLWkQwTC85QU1QTDY1U05uLzA1?=
 =?utf-8?B?OUZjVUNQRFk4TlVXTmtaTUhoY0c2R2QwTzVsTGNmalNENkZhTkZqczNJTUdh?=
 =?utf-8?B?ZjlwZjB1UVpWUGRoaDVzczJQK2ZFMWMvQ0ZCb05kcWZDM1BKbHJvdjlyQmox?=
 =?utf-8?B?WEVPeWI1aE9pVHRkVnMyOWRzdkFOR3FWclZabkMwejJGVkgvazNlYncySUI5?=
 =?utf-8?B?K0FYV2M5elRnYnA3aVdHaCs3WEFaNUJxVGlSWXBEOWFSNWYxeTVuT0x1Z2c3?=
 =?utf-8?B?aS9rVjEzMkdhZkRaR0RaZTZiNnhmeWdBamVrY1VjcXdJZFUrbDFsL3VJd0dM?=
 =?utf-8?B?QW1mcCtITWZrcDdNV1VxMkVxZzVXc05CQTJDU0x1OFA1TXdGVDBKNjdnaEFs?=
 =?utf-8?B?cmFkNXJHNVBkN2JOb1A4NEFXLzI4RVlGeldjY2w0NDd4WFM1YXhzZ3FPcE9Q?=
 =?utf-8?B?Y1daQklOZUZxVFMvSUVMRGwvSkdmWjE5S1FPQ3JHb1FyTFZEa09CdXI1Wm52?=
 =?utf-8?B?SnRUOURwZmpGK3Z3dHJRMVRFL1g0MmM4d3BHdTF6MHFIcUJLdkpWOFNXamNF?=
 =?utf-8?B?Ymp0NWlrMG9qMHJqNlZNUmJVRjVJaGlZYnE3T1FJVXY2a2VYaE9TT2tnN1ZX?=
 =?utf-8?B?SlJ6bTV4OFF4bmQvS2oxTVFSRS9ZeXhiQS9SVGMyZGtLcmZ5Qlo5RFJpQVZ1?=
 =?utf-8?B?bnNyTFQ0YUZ3YjNreWU0Rk9OUG4yQnhBRzU3SGNvOExPRjRjMUhWc1lJcXI3?=
 =?utf-8?B?c0hZRHFJMURRa082RXdQM2RQU1NMb3JQWVpCSDRmako1THhrN3lsbEpZSVMw?=
 =?utf-8?B?SXBpMnpheG5FYld6WTRqbEJXWVQrUUZRM0x0OGIwRWoyR1V5RGpvOW9oK0Na?=
 =?utf-8?B?SG1WWkNLSVEvSkVGdjdEV1FKMTE4U1pmRmV5eDhzbFlDNTdkVUpqdWFsT1NN?=
 =?utf-8?B?ejdoMElWM0VISmtIM3BLNFVBbHlhNGpRZEFuZjM5OFExTDI3SnExdnVxOHlH?=
 =?utf-8?B?NEc1dFltUmlabzVzTEN5OW5SRHMzc2RFOGZuQ3ZMV0VrTjZ6M1A0RURCbVFm?=
 =?utf-8?B?dzFyU2RwSkpmMGM5cEkvVklQd2tTSjFkS1hNd3J6bnRJNi95YWZ1eWFQY3dH?=
 =?utf-8?B?eWlnWVNxdXFnMmNueGJVaktxdmdTZFZqdG9sb04rbjl3dkdVQzhWeFlhaEo5?=
 =?utf-8?B?Y3VjcUlJT0lVVXlwS3NEQzd5NE1IRGtVVEY0MFhUSGpGQkZxZllQS3cyZE5R?=
 =?utf-8?B?bWhkMDYxQllHVDdtRkU0N2Fob2E1SCtLdjliWkM4OW5VQWJQV3NMdz09?=
X-Exchange-RoutingPolicyChecked: Q66wTYUDVOgO1OtcUxLaf9sLUR8g5B5fcgD6/KJRLg0boefr7iFzF3kco/BmiB5OUUdt7MjOCHUwp6sepAaVZuuCdSp0VQbWcuPxkN7361LrM85oCLlNgDcR0Xyi9wKru9byidca8XayL2QZjFvAbLy8Wyj1ygBgN2kPA3q33idwZu44+RBim3R+SVj4YFe4ypECpdPDGYj9J9xBvvLSDtGt4lTEN06oLaYrNooC7gV9ZGO7X/uMm7Plwj4aOEojH+JAoFmXuyFOIVaNW+AKh36d3R0d35lQ0y6CFHWp1HwfIiK6pN23reBLL4+x5EgWGRbAYsoT9OHZIFRFQ5jMVQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: e5a061f3-83a9-4001-53ab-08defc7982c8
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7752.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 16:06:35.2721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DHrfufsUeGqRcJ3L/1aOgUw4169QfP8kwpIhQcykS0RFhm589BoHRInwCVPREBeV9LyBazgYmnmuk6ZxJ5TqMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB567341
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

On Mon, Aug 17, 2026 at 02:58:31PM +0000, Upadhyay, Tejas wrote:
> 
> 
> > -----Original Message-----
> > From: Wajdeczko, Michal <michal.wajdeczko@intel.com>
> > Sent: 17 August 2026 16:57
> > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> > xe@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Thomas
> > Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> > Subject: Re: [PATCH V16 10/12] drm/xe: Add sysfs interface for bad gpu vram
> > pages
> > 
> > 
> > 
> > On 8/17/2026 8:51 AM, Tejas Upadhyay wrote:
> > > Include a sysfs interface designed to expose information about bad
> > > VRAM pages — those identified as having hardware faults (e.g., ECC
> > > errors). This interface allows userspace tools and administrators to
> > > monitor the health of the GPU's local memory and track the status of
> > > page retirement. Details on bad gpu vram pages can be found under
> > > /sys/bus/pci/devices/<bdf>/vram_bad_pages.
> > 
> > since those new files are xe driver specific, shouldn't we refer to them using
> > 
> > 	/sys/bus/pci/drivers/xe/<bdf>/vram...
> > 
> > >
> > > The format is: pfn : gpu_page_size : flags
> > 
> > kernel documentation [1] says
> > 
> > 	"Mixing types, expressing multiple lines of data, and doing
> > 	fancy formatting of data is heavily frowned upon"
> > 
> > [1] https://docs.kernel.org/filesystems/sysfs.html#attributes
> > 
> > so to follow the guidelines maybe we expose the separate files:
> > 
> > /sys/bus/pci/drivers/xe/<bdf>/vram_page_size		u64
> > /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_count	u64
> > /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_reserved	u64[]
> > /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_pending	u64[]
> > /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_failed	u64[]
> > 
> > or
> > 
> > /sys/bus/pci/drivers/xe/<bdf>
> > |
> > +-- vram/
> >     +-- page_size	u64
> >     +-- bad_pages/
> >         +-- count	u64
> >         +-- reserved	u64[]
> >         +-- pending	u64[]
> >         +-- failed	u64[]
> > 
> > then
> > 
> > /sys/bus/pci/drivers/xe/<bdf>/vram_page_size:0x1000
> > /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_count:5
> > /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_reserved:0x000000000000
> > 0000
> > /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_pending:0x0000000001234
> > 000
> > /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_pending:0x0000000001235
> > 000
> > /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_pending:0x0000000001236
> > 000
> > /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_pending:0x0000000001237
> > 000
> 
> Thanks for comment, this is documented format by design doc. Sysman also depending on this format. So I don’t see this can be done without design being changed for everyone.

Internal design docs don't superseed upstream documentation.
It is the other way around.

But also, the files will be there one way or another. Both paths
are valid, so I don't believe that change in here force changes
in the userspace. Although, yes consistency is good...

That said, I don't have a strong feeling for one way or the other.

Since we are adding to the device level anyway, I believe it should
be okay. But Michal, do you know any doc or any precedence that kind
of force us to go the other way?

> 
> Tejas
> > 
> > >
> > > flags:
> > >   R: reserved, this gpu page is reserved.
> > >   P: pending for reserve, this gpu page is marked as bad, will be
> > >      reserved in next window of page_reserve.
> > >   F: unable to reserve, this gpu page can't be reserved due to some
> > >      reasons.
> > >
> > > For example, cat /sys/bus/pci/devices/<bdf>/vram_bad_pages:
> > >   max_pages : 10000
> > >   0x0000000000000000 : 0x0000000000001000 : R
> > >   0x0000000000001234 : 0x0000000000001000 : P
> > >
> > > The sysfs binary attribute is created under the PCI device kobject
> > > when the platform supports it and the configfs bad_page_reservation
> > > policy is enabled. Uses RCU-protected list traversal so reads never
> > > block normal VRAM allocation operations.
> > >
> > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_device_sysfs.c       |   7 +
> > >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 141
> > +++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |   1 +
> > >  drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |   2 +
> > >  4 files changed, 151 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c
> > > b/drivers/gpu/drm/xe/xe_device_sysfs.c
> > > index a73e0e957cb0..47c5be4180fe 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> > > +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> > > @@ -8,12 +8,14 @@
> > >  #include <linux/pci.h>
> > >  #include <linux/sysfs.h>
> > >
> > > +#include "xe_configfs.h"
> > >  #include "xe_device.h"
> > >  #include "xe_device_sysfs.h"
> > >  #include "xe_mmio.h"
> > >  #include "xe_pcode_api.h"
> > >  #include "xe_pcode.h"
> > >  #include "xe_pm.h"
> > > +#include "xe_ttm_vram_mgr.h"
> > >
> > >  /**
> > >   * DOC: Xe device sysfs
> > > @@ -267,6 +269,7 @@ static const struct attribute_group
> > > auto_link_downgrade_attr_group = {  int xe_device_sysfs_init(struct
> > > xe_device *xe)  {
> > >  	struct device *dev = xe->drm.dev;
> > > +	bool policy;
> > >  	int ret;
> > >
> > >  	if (xe->d3cold.capable) {
> > > @@ -285,5 +288,9 @@ int xe_device_sysfs_init(struct xe_device *xe)
> > >  			return ret;
> > >  	}
> > >
> > > +	policy = xe_configfs_get_bad_page_reservation(to_pci_dev(dev));
> > > +	if (xe->info.platform == XE_CRESCENTISLAND && policy)
> > > +		xe_ttm_vram_sysfs_init(xe);
> > > +
> > >  	return 0;
> > >  }
> > > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > index a48196ce303f..73cd06c22d37 100644
> > > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > @@ -820,3 +820,144 @@ int xe_ttm_vram_handle_addr_fault(struct
> > xe_device *xe, u64 addr)
> > >  	return xe_ttm_vram_reserve_page_at_addr(xe, addr - vr->dpa_base,
> > > vram_mgr, mm);  }  EXPORT_SYMBOL(xe_ttm_vram_handle_addr_fault);
> > > +
> > > +static size_t serialize_bad_pages(struct xe_ttm_vram_mgr *mgr, char
> > > +*buf, size_t max_len) {
> > > +	struct xe_ttm_vram_offline_resource *pos;
> > > +	struct gpu_buddy_block *block;
> > > +	size_t s = 0;
> > > +	int printed;
> > > +	int count = 0;
> > > +
> > > +	rcu_read_lock();
> > > +
> > > +	printed = scnprintf(buf + s, max_len - s, "max_pages: %d\n", mgr-
> > >max_pages);
> > > +	s += printed;
> > > +
> > > +	list_for_each_entry_rcu(pos, &mgr->offlined_pages, offlined_link) {
> > > +		if (count >= 10000 || s >= max_len)
> > > +			break;
> > > +
> > > +		block = list_first_entry_or_null(&pos->blocks, struct
> > gpu_buddy_block, link);
> > > +		if (!block)
> > > +			continue;
> > > +
> > > +		printed = scnprintf(buf + s, max_len - s, "0x%016llx : 0x%016llx
> > : %c\n",
> > > +				    gpu_buddy_block_offset(block) >>
> > PAGE_SHIFT,
> > > +				    gpu_buddy_block_size(&mgr->mm, block),
> > 'R');
> > > +		s += printed;
> > > +		count++;
> > > +	}
> > > +	list_for_each_entry_rcu(pos, &mgr->queued_pages, queued_link) {
> > > +		u64 pfn, blk_size;
> > > +
> > > +		if (count >= 10000 || s >= max_len)
> > > +			break;
> > > +
> > > +		block = list_first_entry_or_null(&pos->blocks, struct
> > gpu_buddy_block, link);
> > > +		if (block) {
> > > +			pfn = gpu_buddy_block_offset(block) >> PAGE_SHIFT;
> > > +			blk_size = gpu_buddy_block_size(&mgr->mm, block);
> > > +		} else {
> > > +			pfn = pos->addr >> PAGE_SHIFT;
> > > +			blk_size = PAGE_SIZE;
> > > +		}
> > > +
> > > +		printed = scnprintf(buf + s, max_len - s, "0x%016llx : 0x%016llx
> > : %c\n",
> > > +				    pfn, blk_size, pos->status ? 'F' : 'P');
> > > +		s += printed;
> > > +		count++;
> > > +	}
> > > +
> > > +	rcu_read_unlock();
> > > +	return s;
> > > +}
> > > +
> > > +static ssize_t vram_bad_pages_bin_read(struct file *filp, struct kobject
> > *kobj,
> > > +				       const struct bin_attribute *attr, char *buf,
> > > +				       loff_t off, size_t count)
> > > +{
> > > +	struct device *dev = kobj_to_dev(kobj);
> > > +	struct pci_dev *pdev = to_pci_dev(dev);
> > > +	struct ttm_resource_manager *man;
> > > +	struct xe_ttm_vram_mgr *mgr;
> > > +	size_t allocation_size;
> > > +	struct xe_device *xe;
> > > +	size_t full_data_len;
> > > +	int active_entries;
> > > +	char *temp_buf;
> > > +
> > > +	xe = pdev_to_xe_device(pdev);
> > > +	man = ttm_manager_type(&xe->ttm, XE_PL_VRAM0);
> > > +	if (!man)
> > > +		return -ENODEV;
> > > +	mgr = to_xe_ttm_vram_mgr(man);
> > > +
> > > +	active_entries = READ_ONCE(mgr->n_offlined_pages) +
> > > +READ_ONCE(mgr->n_queued_pages);
> > > +
> > > +	if (active_entries > 10000)
> > > +		active_entries = 10000;
> > > +
> > > +	allocation_size = 64 + (active_entries * 48);
> > > +
> > > +	temp_buf = kvmalloc(allocation_size, GFP_KERNEL);
> > > +	if (!temp_buf)
> > > +		return -ENOMEM;
> > > +
> > > +	/* serialize_bad_pages uses rcu_read_lock internally */
> > > +	full_data_len = serialize_bad_pages(mgr, temp_buf, allocation_size);
> > > +
> > > +	if (off >= full_data_len) {
> > > +		kvfree(temp_buf);
> > > +		return 0;
> > > +	}
> > > +
> > > +	if (off + count > full_data_len)
> > > +		count = full_data_len - off;
> > > +
> > > +	memcpy(buf, temp_buf + off, count);
> > > +
> > > +	kvfree(temp_buf);
> > > +	return count;
> > > +}
> > > +
> > > +static const struct bin_attribute bin_attr_vram_bad_pages = {
> > > +	.attr = { .name = "vram_bad_pages", .mode = 0444 },
> > > +	.read = vram_bad_pages_bin_read,
> > > +	.size = 0,
> > > +};
> > > +
> > > +static void xe_ttm_vram_sysfs_fini(void *arg) {
> > > +	struct xe_device *xe = arg;
> > > +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > > +
> > > +	sysfs_remove_bin_file(&pdev->dev.kobj,
> > &bin_attr_vram_bad_pages); }
> > > +
> > > +/**
> > > + * xe_ttm_vram_sysfs_init - Initialize vram bad pages sysfs binary
> > > +file
> > > + * @xe: Xe Device object
> > > + *
> > > + * Creates a binary sysfs file under the PCI device for reading
> > > + * offlined and queued VRAM pages. Supports large entry counts
> > > + * via offset/count pagination.
> > > + *
> > > + * Returns: 0 on success, negative error code on error.
> > > + */
> > > +int xe_ttm_vram_sysfs_init(struct xe_device *xe) {
> > > +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > > +	int err;
> > > +
> > > +	err = sysfs_create_bin_file(&pdev->dev.kobj,
> > &bin_attr_vram_bad_pages);
> > > +	if (err) {
> > > +		dev_err(&pdev->dev,
> > > +			"Failed to create vram_bad_pages sysfs: %d\n",
> > > +			err);
> > > +		return err;
> > > +	}
> > > +
> > > +	return devm_add_action_or_reset(&pdev->dev,
> > xe_ttm_vram_sysfs_fini,
> > > +xe); } EXPORT_SYMBOL(xe_ttm_vram_sysfs_init);
> > > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > > index d5392beff30c..eb55b0f74ef3 100644
> > > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > > @@ -32,6 +32,7 @@ void xe_ttm_vram_get_used(struct
> > ttm_resource_manager *man,
> > >  			  u64 *used, u64 *used_visible);
> > >
> > >  int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr);
> > > +int xe_ttm_vram_sysfs_init(struct xe_device *xe);
> > >  static inline struct xe_ttm_vram_mgr_resource *
> > > to_xe_ttm_vram_mgr_resource(struct ttm_resource *res)  { diff --git
> > > a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> > > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> > > index dc97b0ad0e51..efcf3e1d4e80 100644
> > > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> > > @@ -37,6 +37,8 @@ struct xe_ttm_vram_mgr {
> > >  	struct mutex lock;
> > >  	/** @mem_type: The TTM memory type */
> > >  	u32 mem_type;
> > > +	/** @max_pages: max pages that can be in offline queue retrieved
> > from FW */
> > > +	u16 max_pages;
> > >  };
> > >
> > >  /**
> 
