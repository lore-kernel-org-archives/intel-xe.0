Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76368C369C8
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 10:28:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F6E10E7DD;
	Wed, 25 Sep 2024 10:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YUNUiS4q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64BB110E7DD
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Sep 2024 10:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727260088; x=1758796088;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1yOphY5cQmZGQ0Gmw5VOLHTFFGuOnbRXN/avGkmnQEo=;
 b=YUNUiS4q6gd1+mLfgtiiwy7Y2kg1HMgGVgv42lZbUSanfayO/b2Yyz0N
 NrmW1+DYghn29v6mnV54s+QUTtL3PHkhk1nFY9WbXRkZyw25F8GP++qpX
 +1p+uOSnpr+wbeP7c4c/DSEmGpv6qfSAOUY0jZMZ6K/TzFPfvSWrwq0vU
 aju9pJAnapLhf6KvtxFjXVsQcZA5sCJikq44B6Ko6818Ia/G/9pDYPTVz
 kTvbbY67C5Ee7rtHLL6Mxe0+E6jPXHyJHS4a6OnPiF8vMQySD080/FUSy
 zasbqMWcXWp7ryXi4kkyoTv5RBhYn0S6yZlotrAZ3NKdLdh1IWs29tAZb w==;
X-CSE-ConnectionGUID: d6VVyFGpQx6S312EiElo1g==
X-CSE-MsgGUID: YuQTg+iXRoyt8cWmAYfe/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="30008419"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="30008419"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 03:28:07 -0700
X-CSE-ConnectionGUID: Qv3Dx9fZRO6NNoBPtLq4pw==
X-CSE-MsgGUID: Wvbap/7wRySannD1ZyXOBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="109188813"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2024 03:28:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 25 Sep 2024 03:28:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 25 Sep 2024 03:28:06 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 25 Sep 2024 03:28:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nYHsYF6BftAm9IYCvO4jrsMXKERe7rO1mloXMsMtRxDsL6lR/1p5Qdq9pubRnGv0O/Fxu6lQCbhcYAVYvinUMTwXtBr/POxXnOuJoOP9SQdZb+tZZ1IbEZ0/AznUAF1e4vcL6O2IjS9WQN2uFIf1nk6MZNGTZlqf6IY2hsC2n7iVmxyVcvD3+iNlc+CtlzTgjVNCmwWxD/NkSMOZC3ox9gSnMyDoKKlbSSlbl3vDCs2gj1ykJ7C/wxNwyuR1xhkMfKVEQppVwU7K3anSA6SftEx7p33DLcbzSidjMgXVXQfuKgmVMNQ+DdSq85fD/xdSQxuENEGIHp+7Inqfm3t8bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6LdoiFYls/nVFXVw3wes0W2JV3DLYnTKvfGje3+IzI8=;
 b=wYUGnMVqOxUqXElwgLCH//FDwL15mixpqfH7PFjhpqXmvie9X5JI5NJsvb7w9/92oXnJV2OAk+XnVceEWnJeU1JNuhI8Iho0H9049ECl+JqoeaJr+G8nXYc9zedcyB6Dj7DUu01bzFzKY2dsTk7cPyFNDuYDzoCxwlyJSYfXZodEMRxbP2ZRRRHwtbaE6pBMSHAirai5faxbA1ghnYJkd5n74/blFG+/5wCb71JhNv7jFdGiI5CTVJleCtWscG4EMHEjzViejsDi8C+ofDhPEWyGzVx1a6TsCCEeTxVKmjmzhZZEUs6Z1gcLZ6Fz4mlOBA1CVOV12j+3JB3cv5H8aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH0PR11MB7658.namprd11.prod.outlook.com (2603:10b6:510:28d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.26; Wed, 25 Sep
 2024 10:28:03 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 10:28:03 +0000
Message-ID: <68bb4de9-be89-4bba-becb-1a36f23b31b6@intel.com>
Date: Wed, 25 Sep 2024 15:57:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/23] drm/xe: Modify xe_force_wake_put to handle _get
 returned mask
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, "Nirmoy
 Das" <nirmoy.das@intel.com>
References: <20240924121641.1045763-1-himal.prasad.ghimiray@intel.com>
 <20240924121641.1045763-3-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240924121641.1045763-3-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0017.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::12) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH0PR11MB7658:EE_
X-MS-Office365-Filtering-Correlation-Id: 07c00c1e-7a52-4341-a814-08dcdd4cbcb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3Mvc1FuTkZYdGJzdVZ0THM1U3lyUGFDVW5QWDJoRU4vVks2dWU1TEMvdE1h?=
 =?utf-8?B?Q0svM1l0VjdkaHpZWWNZR2dHcmtMdURzSkErUVVzdmV5dFlDZVVpekQ2SU9R?=
 =?utf-8?B?c0F2eW9neEhoaUhmcmZmV1JxKzcvQkFUS1g5SWtCRVlmQ203dUtlaWFrdHhq?=
 =?utf-8?B?dU1zcEdkdTlsZmg0NE1BSHYxZ0tFME5wK25JaktiTjZCc1ptd25MSWJkWUIv?=
 =?utf-8?B?SWdIQ3d1ajQzSk4rb0svUUUwSWNwWEFvZllWRmk3cWFlSUVGTWg1ZlViOW9a?=
 =?utf-8?B?ZXJQNEZnU2NZRFlrQUhtQUh4NnVmRkFTcTZWUS9PK1Nvdk9vKzhZOFBOMHJK?=
 =?utf-8?B?aEZOV2l1bVhTdlduZEgyYU1CU2JlV1QxVG43MUJ2NENPQ2xzblFrU1RscDZJ?=
 =?utf-8?B?ZGxFMWNkVkpOdnBhT3Z3KzZZa0Q3YVdHRzIxWmEyanh3emVxUFQzWTJ4dlgx?=
 =?utf-8?B?S1NiTmhXaXJhOHByT3lSa3NSL3AzQWYrUy9UV1RQZU1OSEN4VTQwSWFIZWtq?=
 =?utf-8?B?QWpRT0FoaVEwY0w1VDMzRmlKTzY0WFhpbWx0RmJaU21scVNiTlBpbUdWRU9E?=
 =?utf-8?B?cFdFVnpQNWRhcks1K3I4aGJhVmJCaG14a0FkRkhPd0plbVh0cHJQaXdhdDBJ?=
 =?utf-8?B?eHpyM2tkVjJlNDRWU0pyblhKN0ptY0NCYVRDOXhvTTJFeVVnaFB3dTJZRCti?=
 =?utf-8?B?dTV4Y1FBaWpLbU92L1dZWDNXZUpnNVlZWmFZM3JEY3hWMG1TRm9kRUtVcWE5?=
 =?utf-8?B?RWNMUW5hNTViTkFxTUVDMk9rUGJqT05hUzRZZGZEaVdjb3hBb2R4dFkwMFRI?=
 =?utf-8?B?TFRzdWxMdi9VVHpGa3dVb1hhbkphOHh1RHJEMUViSVQ3L3pzVUtzVG5tQjJW?=
 =?utf-8?B?aXhhdzRrbWRodWd0MlFUZVd3YXlmMVZRUzRwSVVnQll3dmZUcTBMT2YzU1BF?=
 =?utf-8?B?RHRTekVpdTdXWVBEUkdwblRWbXIyQ3A0bjBJQWFBeWVaWVppNXNtLzJLZWty?=
 =?utf-8?B?bjE0QStrWmx5M2RyVTlKVVp4NDhjUHJnMDJDRTR3TTJXUGlrbEt3R1VKM0dC?=
 =?utf-8?B?aTd6K0xzQm9nQXorODJ4aDloMjlKTWtPMGtPZ0x4WjZ4S29FaHZrSHFqdWZK?=
 =?utf-8?B?MnJLL2VpaUxSRiswK05PMGpQaTg2a3UzL0QwM1hvM3JRTHc2UEs4R2xpbTdw?=
 =?utf-8?B?ZE1BbzUzZFdnYk01c3hSRmpCUVVUT2Y4VnNXRk1PVDZwTFZscGhpZi9Fd243?=
 =?utf-8?B?M1NWeDBEaW5XZnZ1bGtDbnpJR1FxZEFFb3FzY1NUSlQ2elJKeW1mbHpFRHkx?=
 =?utf-8?B?RGlFTGxhWEEwS1BWSzM2bGtReVppWllVVk1aY1Uvbjlpa1dQOUVTeHlTK1hw?=
 =?utf-8?B?c0pRa0tjb0tSbWZwTCtiM1ZEaC9vOVVyM1J4MWJGbkoxeXdFWFVwTit0Wjcw?=
 =?utf-8?B?YUVlTUJsYTBYNDNMN3JUdHJzZHdwVTNCR2QwUVhIRTh5WUdLU2tuYllzOWQv?=
 =?utf-8?B?Ty9pc0c2d3lPdXNPZXZnZkordUdRVS9ON3plQ1hZWXFXc0RJVDNwWEZKQzhz?=
 =?utf-8?B?ZUIxRzBIVE51VEQ4ZFo3Lzk2d0JuWWZRTXBQYUo1STBBbW1LbHhNMUIvMHBP?=
 =?utf-8?B?ZndaaVBLb3F3ZU5uSUIrZVZweVdIVm1NNmRuSzVnV1k2MFl1YWlYU2NQdzNC?=
 =?utf-8?B?MEZraXFnZDhjWmRWaThyVjkwdkt5Q2pFckkvQ3ZtaDBTK2gxWXNWcXVSaHNz?=
 =?utf-8?B?ZW5EYjIwQURvQ3g2eE0yV0laRlJ6alBhR3VUQ3A0YmkxS2V3ZXRBbjJyVCt3?=
 =?utf-8?B?dUltNyt2TmxaNmtORXRDZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3BqYlloblU0SnRYUlRybXE0Z3c3dGJMUkRnN3g0V0FDcTdkb2hvZ3dWc3VN?=
 =?utf-8?B?RkY5dTV3bHFHSy9KTERhY1JPKzJWQ29RUkxLbElTazlDTVM0ZHRvcnYzcGh2?=
 =?utf-8?B?KzFBTjZUSk0vSHRmWDJuR2xPSFc5aXJkakVxSGY1MFp3MFg2M01FTVFWck5G?=
 =?utf-8?B?UTY0ZzQybWduZWdNRDhadHhUMVE5Z3ZsL0NHSUJCUnczVDBwRXZQQTUzVTB6?=
 =?utf-8?B?OTBpcHNKVG81cWkzb3BNelZGUEpkZ1IxdTVLVGlCQStqbmdIV3JiTXFMRkVp?=
 =?utf-8?B?czcwaGMwdy9aN2xMdEliSndIL1hhaTBZNGFqcGZyeUhrQTFSc3VqT0lHSUZ3?=
 =?utf-8?B?TmNob2ozUzhSejhJSVNJZlJUTGVmbm5BUGc2Z1kyc203aysvcFlxK0thOGhy?=
 =?utf-8?B?alluNHk2OEpWSFdIaXloSnFaOHJsK2FTTXNkVktjK0JSTnhpLzJvV2FqZXlN?=
 =?utf-8?B?VElQZmRGeHdYaGVEbER2YjF1cUxHZnFkNTNJaWVlWmJqWHBZTHpVRTZkSDB6?=
 =?utf-8?B?b0xUc0lpTEtJUE1Hd1hxdStZLzVPem13eW9JcFVOT1d0OXNja2VzRUk0UTR0?=
 =?utf-8?B?VjgvaUdhZU5jVGJ5R1ZhdGwrT29uVlhpYzNCQzNkalpNSStaQ01GenBwSWJN?=
 =?utf-8?B?eXhqb1NMc3BKbEtsZ05qeTJlM3puVm5Ma0hQcmh5Vi92Q1VQeCt6bkZLSVJy?=
 =?utf-8?B?V0w1eFFnc0cvWUI3ZkNBMTJjcVJDcEdPcHBpdk9VRS9VbUlZSmY0TFBHOXls?=
 =?utf-8?B?eWVLcG1PaDBwWmJxVFQ4MlhUaUVPeStZM1czOXJCRHFsV0M1cUllcG80NHhT?=
 =?utf-8?B?VzcwMGJtZk5EcW9Dc0U1UUc0c3dLUkRUZFBUVlRtN25nL3IxNjNJUENLUEZC?=
 =?utf-8?B?dmtad2l2RnpOR1gyNzhJejFScXlLNmZzSldHRzJpVE9KOUdWSkZKTEtaTy93?=
 =?utf-8?B?V3ZuVVFnT2w4eUpHWkhOa3A0UmxYK0RIM0dDbEpUeXVBeVZhTHVJTlp2d0x4?=
 =?utf-8?B?MWJnMmFpS1ZKR0NRcDRFVWRac0N4ckpPUERtRTZnS0RhQTloQ2V4R01GanpE?=
 =?utf-8?B?UERjSzUydElTaWFPUEFmdUVyM1RtLy9zUkNCMkdRemY4d0J2NCtLb1cvVEI2?=
 =?utf-8?B?RlJnMGVhalZVV0tQY1N0c3cxRUgvbnpZQm5HZFFIWk9LZzlWWk5rMGR5aUhu?=
 =?utf-8?B?Y0pUcmJ1SW1OWjFGbmhWR2dRb2lhVS9yTlBTaDNyaFFzV3drdTJJam44ejI5?=
 =?utf-8?B?S1F3WWpDU1Y1UHBoTmlRajNBZ0IxRVZqMlpSM3JNM2NIZDE2V0gxQ2pxSjRv?=
 =?utf-8?B?Z1AvWXVBU2NXeTVVcW1Zbk9xVHh6Y05MNFloZUFiVllFR2N2TERQbjU4YXhV?=
 =?utf-8?B?aFI5VnBmZnIzM2NMY2NBZFV6bjFTeDF2WUJvUDFibEFTTE14L0FUekdvZlpQ?=
 =?utf-8?B?R1dvdzB3TkZINXFqM0kyMCtZalRNREpjYVdaSnFGa0RtVUE2Vk5hQW5BSG45?=
 =?utf-8?B?YXVQYTlZUnkxSGlsVzVjZnhuYUpkUkc4V0gzRDlSUE1JTlZKTG5UNzJJelJ0?=
 =?utf-8?B?NTFFdFVtUXdnbDdEb0RQbjYrd2tCMEJnamNEdkVWdTFLM1ZSbUZYdEtoamlY?=
 =?utf-8?B?ZllRbHpjWUFKK015aGVWVk4vSXIwb0lMZWw3QytZWXhTOEcyd1h2VTBGRC9P?=
 =?utf-8?B?Zjk1RDh6KytqV0VaTmQzRDM1YW9pNld3ajFCWkV1VFpUQW5lbkZIaWZ4Z1Z0?=
 =?utf-8?B?bFVMMWVqamZzR2JSZmtUaEtpZlZKMndGUzRoZnl5Q3UxZTRrbnhYbERLNldu?=
 =?utf-8?B?UWlaeERMcHFoNkRRb2haMHdlTlpMeHhSZHcvMFU4aUhmZnNEY1JjS1VZVS9W?=
 =?utf-8?B?TEVDWEtsbllmUlA2L2RLK3pCbG84MWJSbnhWZTFWbHdwblF4UEZHVHp4WHBW?=
 =?utf-8?B?RTlxVXdhdzVIYkoydlZvYlBKMXU3TUtWSCsxL3gwaGJVQUtST3RKT0VvOEE2?=
 =?utf-8?B?VmJITVcwdmhKeklTaHhUYmtJNUtjRi9uaTJKb0hVUmN2YUYvK1hSR2MvZTZU?=
 =?utf-8?B?MndNZ2hVS3lDZ3lIczJZYmVtUmE2d0JZMDZiM0hMSHRaNnlxeUxteVlGWnNs?=
 =?utf-8?Q?jjaZGmtM/mbDdfI8asFAUCSB1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 07c00c1e-7a52-4341-a814-08dcdd4cbcb2
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 10:28:03.5996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d94mgDwd8+EJbrFf9P8MJkWWD/rx6EmMAIwFWdESkSZMsOScG5bCtwEp9vVv5wtFPIFCYElpbXW4pHs1pmmlBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7658
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



On 24-09-2024 17:46, Himal Prasad Ghimiray wrote:
> Instead of calling xe_force_wake_put on all domains that were input to
> xe_force_wake_get, call _put only on the domains whose reference counts
> were successfully incremented by the _get call. Since the return value
> of _get can be a mask that does not match any specific value in the enum
> xe_force_wake_domains, change the input parameter of _put to xe_wakeref_t.

%s/xe_wakeref_t/unsigned int/

> 
> v3
> - Move WARN to this patch (Badal)
> - use xe_gt_WARN instead of XE_WARN (Michal)
> - Stop using xe_force_wake_domains for non enum values.
> - Remove kernel-doc from this patch (Badal)
> 
> -v5
> - Fix global awake_domain
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_force_wake.c | 21 ++++++++++++++++-----
>   drivers/gpu/drm/xe/xe_force_wake.h |  2 +-
>   2 files changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index d190aa93be90..c805214bc348 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -197,26 +197,37 @@ unsigned int xe_force_wake_get(struct xe_force_wake *fw,
>   }
>   
>   int xe_force_wake_put(struct xe_force_wake *fw,
> -		      enum xe_force_wake_domains domains)
> +		      unsigned int domains_mask)
>   {
>   	struct xe_gt *gt = fw->gt;
>   	struct xe_force_wake_domain *domain;
> -	enum xe_force_wake_domains tmp, sleep = 0;
> +	unsigned int tmp, sleep = 0;
>   	unsigned long flags;
>   	int ret = 0;
>   
> +	/*
> +	 * Avoid unnecessary lock and unlock when the function is called
> +	 * in error path of individual domains.
> +	 */
> +	if (!domains_mask)
> +		return 0;
> +
>   	spin_lock_irqsave(&fw->lock, flags);
> -	for_each_fw_domain_masked(domain, domains, fw, tmp) {
> +	for_each_fw_domain_masked(domain, domains_mask, fw, tmp) {
>   		if (!--domain->ref) {
>   			sleep |= BIT(domain->id);
>   			domain_sleep(gt, domain);
>   		}
>   	}
>   	for_each_fw_domain_masked(domain, sleep, fw, tmp) {
> -		ret |= domain_sleep_wait(gt, domain);
> +		if (domain_sleep_wait(gt, domain) == 0)
> +			fw->awake_domains &= ~BIT(domain->id);
> +		else
> +			ret |= BIT(domain->id);
>   	}
> -	fw->awake_domains &= ~sleep;
>   	spin_unlock_irqrestore(&fw->lock, flags);
>   
> +	xe_gt_WARN(gt, ret, "domain%s %#x failed to acknowledgment sleep\n",
> +		   str_plural(hweight_long(ret)), ret);
>   	return ret;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
> index 6c1ade39139b..731a9a5a29a4 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> @@ -18,7 +18,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt,
>   unsigned int xe_force_wake_get(struct xe_force_wake *fw,
>   			       enum xe_force_wake_domains domains);
>   int xe_force_wake_put(struct xe_force_wake *fw,
> -		      enum xe_force_wake_domains domains);
> +		      unsigned int domains_mask);

Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal

>   
>   static inline int
>   xe_force_wake_ref(struct xe_force_wake *fw,

