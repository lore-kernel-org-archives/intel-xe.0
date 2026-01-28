Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4185BD2FEF4
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 00:13:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C9F10E115;
	Wed, 28 Jan 2026 00:13:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dGIyq3cX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B0EF10E115
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 00:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769559224; x=1801095224;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wmS2iFcfX+J9M4NQRSou4QiQKAyemYiQCQyxnCrPk+0=;
 b=dGIyq3cX/TtyZiK4+CNx/XC9F6m4uPtzMGyrgqmPOcjgbkhU90lHwwFh
 W3nWNOJXl7fhrfCJSrjpJNg23o7PW4iw03uOghUTC4JrvCfv5So5UUa4E
 Vv9R9Andv260Po8DZetOS563q9iu8nbVHzCDiQ6UmrbaE+a/qmhmQ6OBA
 O4SwHKtNtA+7oGijpCLcjp0H3/ydxhqI2NJosbL1EYrbRC/fyMDZCztWn
 0SjnaqgdZfnDSXEWuVm6dDN74ccsFuxWTyV7TpOIbowjnnn6YHw9a8mmE
 K2X+1PA2pn6yExi1fKK+NZ+YVssWmmiumPDMzwtfZtjW2RPL95ULW/nPg w==;
X-CSE-ConnectionGUID: CQY5pVMcTeawReRWS9ZJpQ==
X-CSE-MsgGUID: jgu733SMRUiX/0+RPgnzDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70661671"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="70661671"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 16:13:43 -0800
X-CSE-ConnectionGUID: Wlz8mVEQRtWKv2Dcb8TVKA==
X-CSE-MsgGUID: IZXE0cdpTH2aCmBD38rrsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="238814384"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 16:13:43 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 16:13:41 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 16:13:41 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.4) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 16:13:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SELMz4gGS6ulFssvWvpOMtSnxn9N8zOkrnoH7Hx8NyoluJWmRqcfbtYMzBudJLKyqdC8iBREadBe0iNSTWuwg5LTthPoJvDh722K/5Mret3k8iNXsQQHV18r9INHzzcdDEtdJU7WI4FyDOzPIHgxvH0y2zz/PFp/akmD0jqSwLAU87wo9mZnkwFY89df3wXL7eg7C+jghHvtFSnT0ZcTJiru+qK8lNSQysmHX2+J1s/8vzON/SvPVZaLuvjNC2wgc8mzAeWaBPjWK1zxfdIbRrdKs68GslUu47q8mhFV7LOts+ME/yUwWwqftOvuwwzAeEw0GEqseI/oEPPX/ZQKOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aLz5mzI8mn+r4mI7G+jx46rI+n6yC++VCkK1TsOdz30=;
 b=KZflCK+1QgGRW7t2x0qJesF6/gVYQYeKPrgtc4QE7y606+hKSSHEf7O1FIPEnfOMMYtgYHAKgeYg5uc2Uazjol3Ae0klce3ndwUJZfz+WZI2IoO5AvfwhXSJ++PHMCwmdPeKLZttl5rGqnSJaSHZhUxFUQCZF03ZSxrWkBsFDaSGoAANnHunTFZKNZ4FfwxHqxqLNrwaWuWyUx855eJ0pASOhZ11UIAi9btSoyX3cqh30GPUM76F5AFiihMIg3hmpO17L/njlEQP6jLfX55dpEhffxHszKUyT8EQMqXi5h1Mjt/N8yV1Uyt0dc7pf8i4jDIc3etBFTbj6aPADOTneA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7755.namprd11.prod.outlook.com (2603:10b6:208:420::18)
 by IA4PR11MB9180.namprd11.prod.outlook.com (2603:10b6:208:56e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Wed, 28 Jan
 2026 00:13:39 +0000
Received: from IA1PR11MB7755.namprd11.prod.outlook.com
 ([fe80::a90e:4fd2:5f61:66b7]) by IA1PR11MB7755.namprd11.prod.outlook.com
 ([fe80::a90e:4fd2:5f61:66b7%7]) with mapi id 15.20.9542.015; Wed, 28 Jan 2026
 00:13:39 +0000
Message-ID: <d515821e-0401-46f6-8e57-7aa419a16207@intel.com>
Date: Tue, 27 Jan 2026 16:13:37 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] drm/xe: Add a wrapper for set/unset params
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Riana Tauro <riana.tauro@intel.com>
References: <20260123235027.379891-1-vinay.belgaumkar@intel.com>
 <20260123235027.379891-3-vinay.belgaumkar@intel.com>
 <48a4d279-5cc0-432b-8398-295116419cda@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <48a4d279-5cc0-432b-8398-295116419cda@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0070.namprd07.prod.outlook.com
 (2603:10b6:a03:60::47) To IA1PR11MB7755.namprd11.prod.outlook.com
 (2603:10b6:208:420::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7755:EE_|IA4PR11MB9180:EE_
X-MS-Office365-Filtering-Correlation-Id: 26750ad2-60eb-4a80-2d3a-08de5e02165a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|1800799024|18082099003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OThrem5Fdll2UldWT2FOQmo4b2dtR1Vod3MwQ0RuYTlMK0t0Z3BUZEJrNGRD?=
 =?utf-8?B?UTYrVUlJVGdvNExkT2U5cFZuZ1B4R3AwTDF6MWE2S1kwRXBYUUMvMFhXNDNq?=
 =?utf-8?B?bTlPY3pCZ3VBQ2hKSlhyWk1BbThSM1dmUE9qZW1CTktINkhNRHFSNDh2OFJs?=
 =?utf-8?B?RzFiTmZ6WXhITnovVVhhc0daYTNtekxkMVFnaHVNaXQ5ZjQxTDVQWHFaSVg2?=
 =?utf-8?B?NGJlaWVvTnFFSXlZWC9ieFlMcDNXVWhicTkzMnhmSml0WXBHYkxZdnVLckVT?=
 =?utf-8?B?UWRVTDVoSkRKemJZV3ZIQWxIbDhEYTliMk8vQU5pRThCdE5BOWRyMGE4TTFY?=
 =?utf-8?B?aHV5ZEZDMnp2dmIrUGpKa1ZET2YvVkhSeHZMTlRMZnNwU2VnS0RPMUdUV1Vh?=
 =?utf-8?B?WWFUckVtcFN0cW02bmlXdHZvOVZMaTZMaDhtUmxGMllYa2Rwa2J0T3dSekhP?=
 =?utf-8?B?VWoxV05XY1hLU1dFOWwxQzJBWTRDYklJLzk3QTFEcGZiMENVbitaY3lySHNP?=
 =?utf-8?B?NlBqM3g1Tndaa0RlYmdzanhWOStFZENQdWFwVDlYYUU1M3c2UVFBTDlPQS9p?=
 =?utf-8?B?aXEyVzUxaEsxci96WHhMQVpkbDJmaitiTjExNlkwNjZtWklnRXdCc2pNejU2?=
 =?utf-8?B?Q1dnZjFHN2c3blV4WW83NkUvbEZTOTE4TW5OZnBQR1FLMEN1VG1aOTRBMm1o?=
 =?utf-8?B?eGRSMmVHdmlhZ3IxK2Q5aFRKRE94K3Z5UmJaRVBUaDAycWtUT29iTjV6dUZl?=
 =?utf-8?B?aXJZSDI2OVFUME9GbE8vNXJaS2l4VTJoWVc3emVWem43MXgzTnNjOVMwSnBV?=
 =?utf-8?B?T3BVUXJTVE5qVlJlRU9XWmdobWg0cDd5dzFWNm5sSjhHcEhLQ0FuOFFqVGg3?=
 =?utf-8?B?Q3p1cElzOVd2ci95VWJBQzc3MlYvMi9OUGNkamF2OERXaDJwQUQvbmx1QWRD?=
 =?utf-8?B?VkdyQ29LMTRyQkFQdEp2S3h0Ly9XYVlSM0pPczIvWGU0SGh6S1N0amJCbGFF?=
 =?utf-8?B?SG16M3N6NE1MN3NCeXFhZWJRdmpvajhVR3RHRXh5c3RiV2Nad1BJQ2FEaVZ1?=
 =?utf-8?B?cnBmS0QvaWp4SGlQUTlrVkMrMElCY29vUjJ0dmZXUTlQVWpXbXllcmloVGpD?=
 =?utf-8?B?TVRkNTgrNGlEUEwwWkQ3OFVMbEdXZE9tYzArKy9YRWtIMUZQWUNZRDZneVpS?=
 =?utf-8?B?b3Y5TjlPTkFNN0Nzdm4vR3B5NEJkOWZmY3pxUU5hSFdldlNhbVlZSVlwVzFw?=
 =?utf-8?B?em9qbVZONkY1dzZubVNMdHc5QVZDdWlTMzV4aE9VY05kcWhkSzJ4dGMxNThC?=
 =?utf-8?B?YllqYUpwYWR3UllaQ0pOQVFmdmhSL00ycTYwWm9wV0NOcVQzL0FaRXJtQlVY?=
 =?utf-8?B?RC9Yb1NaRWRRekV2aXZ0TWQwZlhoTFEybHluQ244SHB0UFlOeFJ6WTZtMjBq?=
 =?utf-8?B?TytNWmtxQXZLeGQ3NGgyL1dobSsvSVM4ZmxJRUFnTGNkODg0TnNLRzl0bTB0?=
 =?utf-8?B?Y3cyZUZwL1kzS1JPcHBJZ3BhVFFHZmJLWlBrMDlvVmV1YTJyL1RUeFV3c09Q?=
 =?utf-8?B?dmh6c0hIYlYwT0F4NW03UThtKzF4TEcyVmtTbitKd1J0REoycTR2OUxqV1Iv?=
 =?utf-8?B?ZUJKT0VlUExCalBINytCWEFoKzVwY0Vnd09ZeDlOWnZmc2JBdVYvNWU3U0Fw?=
 =?utf-8?B?SExVcS90d2kzZlFncnhEcnhZcFl2UmlkUml3ZmN2U3I4anRBTHZQazM4Y3Fl?=
 =?utf-8?B?UGlDMy8xVWgwaDdLeGNNNTVzZEVuY0pDVjVmbXBFVWozNjdzVXdTYUJkeERa?=
 =?utf-8?B?NEN3T0tPT3dKYnFjVVEzVzdRMlNJQS9Iemk2Qk9zOTZ3UHpvaVh3TEhGNWc1?=
 =?utf-8?B?c3diZXRTSGNsRWRxZVZTYWk2dnNoeEU4M1lTVk4vc3BUZFVuY2ppNmIxRGhX?=
 =?utf-8?B?aHEydTJvWXc0OWowblNqS05lU1Z2OFR2Z0RoVE1kZXR4VmpXYUFuNkVnTU1L?=
 =?utf-8?B?QjJSWnNQTUx1cEtsVlgvakdtQ2VIM2ZDbXlWdloyaWFIMW9odU1iRjY3a1Iw?=
 =?utf-8?B?TmZ1dVdVdTJ2L2RlK0ZUaVBnVDA5V2wwRnJ3NkdrMzBKL1pGdEw2UllLNkZH?=
 =?utf-8?Q?uaB0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7755.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18082099003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3ZicjkzdkdPUGpXMjltdEZOS1pFVzVOZzY5b2d3WE5OcHlxQVZYZHBtMVAz?=
 =?utf-8?B?bG1ybnZ5d2YwaitkUW4zaFRWRUk5RUIxTW5lbi9JaWt6ejcwd2FLV0FrRXhI?=
 =?utf-8?B?VzVXNTJNbnFJTDdZcmZsbjJ2blBsQjZUS1MxcWNhYUNiWFQ2UjNWMkZKYUlU?=
 =?utf-8?B?YTJZRy9QWDVJQWdMcjdrS2lNRTlrU25md0lFZ2l6RitBU3Njam95WlhSNXVo?=
 =?utf-8?B?R1dOT1poRFo1U0pBMXEvb1Q1TlhaNmNGQ2xGYVBCTUY0MzhheldhSGoyY0lE?=
 =?utf-8?B?RlNsQXQ0V1hHZGxmZHducjd1NWZnbG5WR29MSlpqVEtNQkx0cjdTTjhOWjJM?=
 =?utf-8?B?TnpLbWNQeUMreXVyL0pkQlVNcHV5bmxRYy9CcFJhZzlmTHY0MkViQitqN2w0?=
 =?utf-8?B?VFkrNVBuTzl1VW84VmMrWTdhYjlrZEcxRkVRT3JrSnNUMzZqN3R3TSs0eVBy?=
 =?utf-8?B?YlMwMXlEZmZvaWx1WFljVVAxcXBOTXRPY2FReEZnZzQxVEFYUU12N0ZZZm1C?=
 =?utf-8?B?YWRQVmtzSjc5ZXZoMC9HUWI4emNFenVqMU5YejRnSUVCMHZhM3FLY0JPbndK?=
 =?utf-8?B?Vi8yQzFPQ0t3clh4UVVuNWtFWFF3TUk4c0hwRlhQTnFjbFRBaWZjcDk5OER3?=
 =?utf-8?B?cnU4NDVDZklnb1FZWlhlOWR6aWhCZGRldHdCU0lkaDFXSmJxanZRYWlsM3JS?=
 =?utf-8?B?dWRJSTJvYzZYZWpIcTY5RlltQnB2T3FrVFIwWkt0Sk8rY2x2Z2xDbENFdlBW?=
 =?utf-8?B?czJraVZYVFo3NmJVRVBqL09rVjRDMVhrb2NpM2xrZ3k2ekpXcnVIMUlFOFpz?=
 =?utf-8?B?K1ZYTDY4cjQyd1BUQU1ucXRaS210M2VRTHZybkNmejRKZkVLdFZ4d25DUFF5?=
 =?utf-8?B?MVRocFRuY3BMK3BGSUszUDdhbFpFRVhGUUV5SW5ZU2twVWg3WnJVYURNWVRa?=
 =?utf-8?B?eXFsa09FdEVzalYxT1Q1L1pneFFZVmp3NjRvdGU3N2MyQkpOQW1GaFNWT1JP?=
 =?utf-8?B?MDQvTSttSXJpNXg2eGxFZk80eTJvK0U1MDNsYXpLR1huR2ZlTmg0U1VtQXYz?=
 =?utf-8?B?d1dlVncwVys0UkE4MHh2ZTZmN2tPUU51RXhBeHgyK0NTQW03SlIwQXpJKzlS?=
 =?utf-8?B?c3RMSUdudGFKNnZ0WStrZHVQNkRzWVdHbWlWL1dFcE5wRzhseGtrelFzYXE4?=
 =?utf-8?B?KzJ1MjF0RGRGazdTM2FuOVVVRDEyWjlhcDJNM3pxbDYwaXlvaU9uVzgyYzgx?=
 =?utf-8?B?VUVKNVBZWlpoNVBWdDkvZ0J1b1Y0MEJKTDNlTEV3bk1Nb3d3cHRNTGlIb0Zm?=
 =?utf-8?B?VG9acWE0VWxwZmpWVTRUZFNEUFRBZlMva2dCc1ZpaEFnVUpDZVE5ei9IaTZH?=
 =?utf-8?B?VnB3WGtleHR4UFNCNnNMNWd6dnliY29oazlsVmc2SEtFVlJabkNkdjI1TVlk?=
 =?utf-8?B?cmlHMzZNNVM4OGg4N2ZQTmQvUU0zM2FpTU8rUnVCUHZWMHpzQUh3T3ZQMWVK?=
 =?utf-8?B?Sjlnc1BNQmREbmVqWVlZYzk1cngvLzF6T2MvRVFQTHpSK0FwalQvMklncW9I?=
 =?utf-8?B?WVJoaXFzR09GZlNDeFdtc3NpNTdKaDRHV0grWjBBZ2RXMVcxOFlxQmF5amJF?=
 =?utf-8?B?NWtPL1VqYU9ybEl1ZWcyVTA0aFB0UTRDR2xReFlZMXQvSVplUVlUTHJHMTJR?=
 =?utf-8?B?cHduVXJ5VE95ZGJUUlVQVVc2bEpRQ0hGcytjNlNGV3dpZGxWajBsR2hVWmJr?=
 =?utf-8?B?L2t1TWVCUVM0Y1ZkU3J5Z3dFSHMrTmYvNmY2VmsrcFU1N0xwSmZpTGVNaVhG?=
 =?utf-8?B?TkpLZVpRQlgxQnFubVdyZHlid004R2lZQkJqT0VBS04wYXRtNnJvMUR0dmZO?=
 =?utf-8?B?Q0JWVm4zY3R0QTFZYXNOcENDeUpSNVllcVpjdjVRS2M5YXI3ZGdpOUQyb2kx?=
 =?utf-8?B?aUYyYnFDL2dIM1VrT0xXTzlrSkpYNVlxcUVNa1p5c0djVHRpSXFKaHVTZEdV?=
 =?utf-8?B?bWI1OUJkaFhVYVJDNmpQVHhpY2RRWngzVXBSUnZYTGErSy9tZUxvajl1ZlE2?=
 =?utf-8?B?bHBhVVNacXBzSWFnSDZDc0ZLWi9rcTk2ZnYzKzJpTlRsR3BIY0FuY1kvWmYy?=
 =?utf-8?B?ZlpJdWtkTlRORjhCa0tuaWM1Uzk4ai9FUk5XeExTbnNGQThnSGdRYm5ja1lu?=
 =?utf-8?B?dXYvSDRDdFBLVDBXR2VWZm1OTDNwYmJBaTVUYjFER3Fua1NRZ25menRsZzlT?=
 =?utf-8?B?WG41M2MzZVVnYnNraTRtQUFBYnVtRnU2TGJ0R05QU1lLSUx0OTZFbUZQb0d6?=
 =?utf-8?B?SGp5bjJGeXFaT0lhZUVvaVZuc0VaL0kvU05lQzEwWkZrcXV6eTliWGYvQm0v?=
 =?utf-8?Q?n04P0ireqDAF9AfU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26750ad2-60eb-4a80-2d3a-08de5e02165a
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7755.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 00:13:39.2839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G3k2lj0u6KA1EuR60Q3Qr3pcoZ6T5XuamdXicvguXm3j2SMS1gKq99INmxZM9WtjKRSBi7H87VSf9pAS4K3SRs2rosFz3fE0Uv590o0Ljd4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9180
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


On 1/27/2026 3:32 PM, Michal Wajdeczko wrote:
> subject is too generic, maybe mention GuC/PC/RC ?
>
> 	"drm/xe/guc: Add wrappers for set/unset SLPC params"
ok.
>
>
> On 1/24/2026 12:50 AM, Vinay Belgaumkar wrote:
>> Also, extract out the GuC RC related set/unset param functions
>> into xe_guc_rc file. GuC still allows us to override GuC RC mode
>> using an SLPC H2G interface. Continue to use that interface, but
>> move the related code to the newly created xe_guc_rc file.
>>
>> v2: xe_guc_rc functions to use guc pointer instead of gt (Michal W)
>> v3: Assert if runtime pm ref is not held (Michal W)
>> v4: Review comments (Riana)
>>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_pc.c | 56 +++++++++++++++++++---------------
>>   drivers/gpu/drm/xe/xe_guc_pc.h |  5 ++-
>>   drivers/gpu/drm/xe/xe_guc_rc.c | 30 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_rc.h |  3 ++
>>   drivers/gpu/drm/xe/xe_oa.c     |  9 +++---
>>   5 files changed, 70 insertions(+), 33 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index cf02c53ca3c5..31c6cb111916 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -264,6 +264,37 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
>>   	return ret;
>>   }
>>   
>> +/**
>> + * xe_guc_pc_action_set_param() - Set value of SLPC param
>> + * @pc: Xe_GuC_PC instance
>> + * @id: Param id
>> + * @value: Value to set
>> + *
>> + * This function can be used to set any SLPC param.
>> + *
>> + * Returns: 0 on Success
>      * Return: 0 on success or a negative error code on failure.
ok.
>
>> + */
>> +int xe_guc_pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
>> +{
>> +	xe_device_assert_mem_access(pc_to_xe(pc));
>> +	return pc_action_set_param(pc, id, value);
>> +}
>> +
>> +/**
>> + * xe_guc_pc_action_unset_param() - Revert to default value
>> + * @pc: Xe_GuC_PC instance
>> + * @id: Param id
>> + *
>> + * This function can be used revert any SLPC param to its default value.
>> + *
>> + * Returns: 0 on Success
> ditto
ok.
>
>> + */
>> +int xe_guc_pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
>> +{
>> +	xe_device_assert_mem_access(pc_to_xe(pc));
>> +	return pc_action_unset_param(pc, id);
>> +}
>> +
>>   static u32 decode_freq(u32 raw)
>>   {
>>   	return DIV_ROUND_CLOSEST(raw * GT_FREQUENCY_MULTIPLIER,
>> @@ -1045,31 +1076,6 @@ int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
>>   	return ret;
>>   }
>>   
>> -/**
>> - * xe_guc_pc_override_gucrc_mode - override GUCRC mode
>> - * @pc: Xe_GuC_PC instance
>> - * @mode: new value of the mode.
>> - *
>> - * Return: 0 on success, negative error code on error
>> - */
>> -int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode)
>> -{
>> -	guard(xe_pm_runtime)(pc_to_xe(pc));
>> -	return pc_action_set_param(pc, SLPC_PARAM_PWRGATE_RC_MODE, mode);
>> -}
>> -
>> -/**
>> - * xe_guc_pc_unset_gucrc_mode - unset GUCRC mode override
>> - * @pc: Xe_GuC_PC instance
>> - *
>> - * Return: 0 on success, negative error code on error
>> - */
>> -int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc)
>> -{
>> -	guard(xe_pm_runtime)(pc_to_xe(pc));
>> -	return pc_action_unset_param(pc, SLPC_PARAM_PWRGATE_RC_MODE);
>> -}
>> -
>>   static void pc_init_pcode_freq(struct xe_guc_pc *pc)
>>   {
>>   	u32 min = DIV_ROUND_CLOSEST(pc->rpn_freq, GT_FREQUENCY_MULTIPLIER);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
>> index 1b95873b262e..0678a4e787b3 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
>> @@ -9,15 +9,14 @@
>>   #include <linux/types.h>
>>   
>>   struct xe_guc_pc;
>> -enum slpc_gucrc_mode;
>>   struct drm_printer;
>>   
>>   int xe_guc_pc_init(struct xe_guc_pc *pc);
>>   int xe_guc_pc_start(struct xe_guc_pc *pc);
>>   int xe_guc_pc_stop(struct xe_guc_pc *pc);
>> -int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode);
>> -int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc);
>>   void xe_guc_pc_print(struct xe_guc_pc *pc, struct drm_printer *p);
>> +int xe_guc_pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value);
>> +int xe_guc_pc_action_unset_param(struct xe_guc_pc *pc, u8 id);
>>   
>>   u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc);
>>   int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.c b/drivers/gpu/drm/xe/xe_guc_rc.c
>> index fc57e5290635..0a900c309ecf 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_rc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_rc.c
>> @@ -14,6 +14,7 @@
>>   #include "xe_gt_printk.h"
>>   #include "xe_guc.h"
>>   #include "xe_guc_ct.h"
>> +#include "xe_guc_pc.h"
>>   #include "xe_guc_rc.h"
>>   #include "xe_pm.h"
>>   
>> @@ -112,3 +113,32 @@ int xe_guc_rc_enable(struct xe_guc *guc)
>>   
>>   	return guc_action_setup_gucrc(guc, GUCRC_FIRMWARE_CONTROL);
>>   }
>> +
>> +/**
>> + * xe_guc_rc_set_mode() - set GUCRC mode
>> + * @guc: Xe GuC instance
>> + * @mode: new value of the mode.
>> + *
>> + * Function to set GuC RC mode to one of the enum values.
>> + *
>> + * Returns: 0 on success, negative error code on error
>> + */
>> +int xe_guc_rc_set_mode(struct xe_guc *guc, enum slpc_gucrc_mode mode)
>> +{
>> +	guard(xe_pm_runtime)(guc_to_xe(guc));
> are we sure we want to do full resume here?
> maybe it should be:
>
> 	guard(xe_pm_runtime_noresume)
>
>> +	return xe_guc_pc_action_set_param(&guc->pc, SLPC_PARAM_PWRGATE_RC_MODE, mode);
>> +}
>> +
>> +/**
>> + * xe_guc_rc_unset_mode() - revert to default mode
>> + * @guc: Xe GuC instance
>> + *
>> + * Function to revert GuC RC mode to platform defaults.
>> + *
>> + * Returns: 0 on success, negative error code on error
>> + */
>> +int xe_guc_rc_unset_mode(struct xe_guc *guc)
>> +{
>> +	guard(xe_pm_runtime)(guc_to_xe(guc));
> ditto
ok.
>
>> +	return xe_guc_pc_action_unset_param(&guc->pc, SLPC_PARAM_PWRGATE_RC_MODE);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.h b/drivers/gpu/drm/xe/xe_guc_rc.h
>> index c980b0fce472..d76dfad8e26c 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_rc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_rc.h
>> @@ -7,8 +7,11 @@
>>   #define _XE_GUC_RC_H_
>>   
>>   struct xe_guc;
>> +enum slpc_gucrc_mode;
>>   
>>   void xe_guc_rc_disable(struct xe_guc *guc);
>>   int xe_guc_rc_enable(struct xe_guc *guc);
>> +int xe_guc_rc_set_mode(struct xe_guc *guc, enum slpc_gucrc_mode mode);
>> +int xe_guc_rc_unset_mode(struct xe_guc *guc);
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>> index abf87fe0b345..f7752719b74f 100644
>> --- a/drivers/gpu/drm/xe/xe_oa.c
>> +++ b/drivers/gpu/drm/xe/xe_oa.c
>> @@ -29,7 +29,7 @@
>>   #include "xe_gt.h"
>>   #include "xe_gt_mcr.h"
>>   #include "xe_gt_printk.h"
>> -#include "xe_guc_pc.h"
>> +#include "xe_guc_rc.h"
>>   #include "xe_macros.h"
>>   #include "xe_mmio.h"
>>   #include "xe_oa.h"
>> @@ -875,7 +875,7 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
>>   
>>   	/* Wa_1509372804:pvc: Unset the override of GUCRC mode to enable rc6 */
>>   	if (stream->override_gucrc)
>> -		xe_gt_WARN_ON(gt, xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
>> +		xe_gt_WARN_ON(gt, xe_guc_rc_unset_mode(&gt->uc.guc));
> as return real error code, not bool, maybe we should also print it?
We already print it in the lower level function pc_action_unset_param().
>
>>   
>>   	xe_oa_free_configs(stream);
>>   	xe_file_put(stream->xef);
>> @@ -1765,8 +1765,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
>>   	 * state. Prevent this by overriding GUCRC mode.
>>   	 */
>>   	if (XE_GT_WA(stream->gt, 1509372804)) {
>> -		ret = xe_guc_pc_override_gucrc_mode(&gt->uc.guc.pc,
>> -						    SLPC_GUCRC_MODE_GUCRC_NO_RC6);
>> +		ret = xe_guc_rc_set_mode(&gt->uc.guc, SLPC_GUCRC_MODE_GUCRC_NO_RC6);
>>   		if (ret)
>>   			goto err_free_configs;
>>   
>> @@ -1824,7 +1823,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
>>   	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
>>   	xe_pm_runtime_put(stream->oa->xe);
> we should just place guc_rc calls when we still are holding rpm

For now, that seems to be true. But if someone introduces a sysfs 
interface later on and forgets to add a runtime_get(), it's better to 
have it in the guc_rc function as well?

Thanks,

Vinay.

>
>>   	if (stream->override_gucrc)
>> -		xe_gt_WARN_ON(gt, xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
>> +		xe_gt_WARN_ON(gt, xe_guc_rc_unset_mode(&gt->uc.guc));
>>   err_free_configs:
>>   	xe_oa_free_configs(stream);
>>   exit:
