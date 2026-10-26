Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE64D606A912
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 11:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QPXYIhTS
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B75910E1E1;
	Mon, 26 Oct 2026 11:18:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42CC710E1E1
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 11:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793013475; x=1824549475;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gaTTWh0igrnrN4le0Rpt/wWj35pBejZ48Eg6FbI51yg=;
 b=QPXYIhTSQ4pPV0n/8h+CRDzJgClS6BVQnGQ49WPjvVfMJyJT15KrrZpU
 M2IU2u8gIBCkLCEj/mzvQEo9l+PyF6ptJpHsXDcTqlVagNfbAAjVty5bn
 deJfQTnDaamE92OzYTF0Puqy1WvJi7PjhrVTnf2GhUZaRIhWeTiEopi5m
 qp+NJGVrXldOm6xC0j8eseXdzkIUixNIDiCcWVmAY3i5HNv6jj0s5CRBw
 0qigXmfzN5MFg6YnW5YyRKBbCmDLONn8M1uDfGMt2/jtLj0zJt2VtSYU5
 aHE7iZ2v8qt+4z6zK7OptVIFkf4l2X9FYtMXFXYZNwPOZE9VE4i4OA8Os A==;
X-CSE-ConnectionGUID: ZuM6bolfS1CZ/EFPRg5byg==
X-CSE-MsgGUID: WbJaf+5GRtStsezWstiEUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1689110"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1689110"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 04:17:54 -0700
X-CSE-ConnectionGUID: 2ojvpo4zTUiVGxArkHXSKw==
X-CSE-MsgGUID: YdOcC6qSQQaU+e1RzBMD9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="6061481"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 04:17:53 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 04:17:53 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 26 Oct 2026 04:17:53 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.15) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 04:17:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U0dAhAE11Xppq6EdtsvSwXnygFHLVpEncKNjeNoDkzN95l/RIgDMIDhbgl4kW59RYM2mcgj3QXpi8u+JruL05PsBSRvSmuD9RPxWvGNqo4u2PPU+PScjOP3svL+PDSzbJRj7WcUuATnsnENm3OVVjBqIc7C8stMgsOz8vfuIdrRjOUE94FBIyzJjTQqNB54VwpNoYLSLUR1c7xo0/N6RbAO3/Nsjd3bXCqE0iUGl9h6gXzb/ZDoOUc6/XpGikiz4zB8MyF2eTzzNirJOZLl5AS5GBylH1n13HkHjALkBN23Gn4okDRMOpt6VKTJAVBwlQHTClByULjsoptKVCbChEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MS1nelfammaFEhCBcv3HgrRLvJcnvN2cWFJZPxxmDW4=;
 b=NRW68FR/fkYNmXEdskKHQ5dVJqS+trQcmZfnMlFI5hW/kXUSD7e155r51JwgYmwtxJMIL2hkBCzNJO8BTs1kLBqsk//ri2g3GAm4QeMWAwnIH1QZPCpxjZKHYBliHlVif03jVDmhn1LlOos2MNNMtcPZRm62hatWZQugD+5tArAZgjm9HyzsNjGIrwGcPx7mEStNWEun6nVzcpJSojdBbZlYz6GDrrVCY19jexjBqQRIPjr7TBkBkFvKouh3dV0KEmcQF4WFWk9m0gEYDUGZ2EYtDfVKJEAuUZ7gISVonWQVRrmgYCbSTs+ZPDvO5+BxMSKqoJ2lqw9hHZ4Wz7X+SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB8856.namprd11.prod.outlook.com (2603:10b6:8:253::22)
 by CO1PR11MB5041.namprd11.prod.outlook.com (2603:10b6:303:90::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.21; Mon, 26 Oct
 2026 11:17:50 +0000
Received: from DS7PR11MB8856.namprd11.prod.outlook.com
 ([fe80::6613:5e2:a45:1111]) by DS7PR11MB8856.namprd11.prod.outlook.com
 ([fe80::6613:5e2:a45:1111%4]) with mapi id 15.21.0546.012; Mon, 26 Oct 2026
 11:17:50 +0000
Message-ID: <5f4ec40b-ae68-4a04-8f57-573e02a29d3c@intel.com>
Date: Mon, 26 Oct 2026 16:47:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/hwmon: Store mailbox temperature data as bytes
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
References: <20261023103631.432279-2-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20261023103631.432279-2-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0331.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:222::9) To DS7PR11MB8856.namprd11.prod.outlook.com
 (2603:10b6:8:253::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB8856:EE_|CO1PR11MB5041:EE_
X-MS-Office365-Filtering-Correlation-Id: a447ceec-4cee-415e-212e-08df3352c506
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|22082099003|18002099003|10067099003|56012099006|11063799006|261022115727099003|261009223027099003|261022105027099003|261021121427099003|261021123027099003;
X-Microsoft-Antispam-Message-Info: Yb/38wEjreg4koO4+aMtd/TSkjM4WvgWDhIvYQmtE3JEwSFIhLfRMfcx30g8Y6jgoepRmfG809jY+cx1b9JbqlXiCgpb/wR3tsqW8ew7Rx2mTOnrFbHHF5ESJz61in76ATk5Pgwi/r4vpgwFCyGs++tqPGWlXADuvFBC2JGDP0LS56U/2zdOwVffrSNHy0xK3yYrQzwy/9Ae0rjVXqMmS23W4Ra03+R7G1lQVxUw7ACkQ206MeVrph5j+G3I/3bSE9gIcD8aSCVAO5VcPgD9Ygnde8RqmNZFCBnWllsRwXfCA56qRRRRk03FcTpiDWhQSs9+elCQ3CB9RGPT9G/bwiz3eknNlaOgCM1P/qaQiExqPBjJliFlIp+KPnXQxwtQDPDIn3f+vyG/72UzxJ6TYUn8OVoWKLtvCQULrOIhh37adCi0pjDE0be4Qz7zoGPS7ENIyhUu+eCUOn4dOK45ahH9w3H4d7Kj8C8cQOcaXJsa7BFDitKDF7DDSvzVv9BkCSA0h6smLGcM55nilmWJlB6mEwRGHhdfoRDE2OenTuzgdXuKj5SYoLD1a0MjvB2IcFwyH0kL5gtrY7tT9KnyKUPB/FEXnfFECxinVjEDUzZyFIx9HB696poCZrt1Filii6K5saQf46GwstoRRcC4i0Mq77zRqMHUQZJn/DbtKrw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB8856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(261022115727099003)(261009223027099003)(261022105027099003)(261021121427099003)(261021123027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3B3ZytUbVN1a3VjRFhueGhJdHpoN2h2ZktJSy8yTEt1OWZsL1FHanhva29r?=
 =?utf-8?B?SDdyaGYzbWhLKzVxUTBpNVJ0N1pONFV1SUtSeFhCaWc4aUpodElUNWtWekhV?=
 =?utf-8?B?cUJZYUZjcWpnZE8wUDNkaVQ4anplRFI5UnpyaExlOVgrZW9ZZlpYSTVrem9R?=
 =?utf-8?B?OElGYzZhbG0rUHUzTUlHTGRhNFkwdjFPUUpKSE5yamVnVW1mWHFRK1QxZm9I?=
 =?utf-8?B?V2xWWm5UWDVCRHA5ZUVUSXlvWkFYOHF0bllnYUpZN1FmS2NUVFBTVXVhUnky?=
 =?utf-8?B?dkxDL29IUnhCRE9iSlhsMGpLMDF6emRCYVFpWS9tVFVjcFJENkNQcGkxekRW?=
 =?utf-8?B?RlVBN1VwMTA1QlhIdWxhWStWTkdLUm5uK1JwdCtLekd0N0xRWUVSdmFBdnJW?=
 =?utf-8?B?b0xHL1dNcEc3SWtvenBPKzVPTkNNS2IzTHZiMm1vdlhseVIwcFlkQ3FjZHNn?=
 =?utf-8?B?dkZaa0FXNFRZMzlUTWhwZ0xWaDRoM09ybmRLOEFGbWt2NExRVGVjQnRWbTZ0?=
 =?utf-8?B?K3NxNmhYSUpiVXRsanBvZzAwbGljVDlUcElEdnMxQUJSbXRsTGVFUGF4ajRa?=
 =?utf-8?B?WlFhY2F1cGJQaWVCVVZJMFhUVmdCMkQvRWpMR0huUWlwbDdvQk1jeThiS0ZU?=
 =?utf-8?B?WHpBb3NDMlh4WHBUc1BKa01FNU9pS05leE5GbFVYY25LUTJnbjg0UXBxV2xz?=
 =?utf-8?B?S3UzR3BsT24wOGdmYUdXMmRFbVV0UUh6emlmSUsrUWhnWERIQ003TFMzQ0Jy?=
 =?utf-8?B?RGkrMVlvR1p1NnFYWG9mbGFKckxsZkhzeERJZm1mWTBvaWJrTmJycnRPbGo2?=
 =?utf-8?B?OUJCVXpJK2V6aE1PV2pKUkpHSTZMZlFXNW1ScFdFM2tOemF4eldxcGZkdjNz?=
 =?utf-8?B?Mi90bmxNQTRwdzFLKzhiZ0xwTVZtYnpaQnR5R0xlZ1kxbDBWelFkUGxGQ1M1?=
 =?utf-8?B?MzcwMUlyczBVMmpUc0psNVJhSEYwRHpQeUpTM2lOeXJuQXdrRjQvZ25rUVpI?=
 =?utf-8?B?SGtZNWFveXdoblNNZFRqeHAwS2FMcWxhTVZsMXpuOGozeDJpcUJ6cXROUGlY?=
 =?utf-8?B?dm5zVzd1Y0l6Sk9XbUVtcFAzbk9QZjd5ZjJmaGh6enpGbXc5VTd6TlFEYU41?=
 =?utf-8?B?VXRyeHJkQ2wxUVo1RFZCZnFXMGdoTytMYnl6Y2tuWEZNd3RLZkZheVJ5ZFFV?=
 =?utf-8?B?R3dNcmxNb1AxaEpMck5FY1AxYng0YVdjNlVibHhYcXMyNHRGeHZSU2ZOb3Mw?=
 =?utf-8?B?YVZ5UGdCZytnRkdWM2hrcEwrQ0R1ZzlOTzUvS1RKejBsaGNQRU13dWRGcUFG?=
 =?utf-8?B?MWlHNS9GdmhIZmk2UVBaUTJ2Nld2TUJlUm9iaitOc1Zxa1J6VktuOHRndGQ4?=
 =?utf-8?B?cHgvUWdEVzl1OG1IaytLY0ZyNkd3ckVwR0xQaW5MMlhDWnBNSUF4VGova24w?=
 =?utf-8?B?UlJKSHRVbVdBN29KcFZ5QlhZUFZSbUE3bExRQXNMei96OG5vMGdNbmk2eFVR?=
 =?utf-8?B?bHZiOXRWYzV6UzhzLzE2b1V2VUJ0VlN2N1E5VHFkajUzRlk1TlBHeldOS3Jq?=
 =?utf-8?B?bXkzZGV5cGNNd2MySTJkMy9Pa3kyeG9vdHZnZ3JQc3pHZDcyMm1UckkzdDVv?=
 =?utf-8?B?VGg2NGE2dW9UY2xSYS9KZWNyVDY0bDRVeUc3RUhMclpxVDdkWUM0Z3Q0R2tT?=
 =?utf-8?B?Sk1nOE1nMkwwL01kbGswZTVtMDVkWFBKQlFQdGNmaTN3LzZsUlFicXEzSVBI?=
 =?utf-8?B?TStCb0t3ZGtrczFmQUhLbUdVVDZCL2lTNENRektnYTkrOTZIWG4waS9VRnRO?=
 =?utf-8?B?bVppeExJRnljdm1ESnNPRDIzVVNiSklkaHZxNEhldzRMNkZxVy94S1hkSzVG?=
 =?utf-8?B?S3VKWXNiMjNnTWltUXJmVStjSGpQWWZYcDQxajcvQmZrYzhqRDhyRkNVV2Rx?=
 =?utf-8?B?dnFVOURKMEJrblhoR3RNYzMyU3FxZ21aUy9DZmx2V2trZlpIVGFjajBmLy9G?=
 =?utf-8?B?NUZ5dTV5c2daS3hDckNsWkw4dHNWTVJ2YXVNMmZhR1Y4L0M5cVBTZzMwSXU1?=
 =?utf-8?B?cVMwSnpVSDd1Zkh1TDBJUVl5ZHNRTEg2ZFNSdU5qN3J5ZHlpbUI4dGdFRmI0?=
 =?utf-8?B?djVwS3lGVmorRWVoQlRjZTNKSFVweDV1eWYzVUZVa1lqYlVxWXE1NWx0dDZt?=
 =?utf-8?B?d2x2NGZDbTdOY3h5NnBLbjFiak0xVVV3L3pzcEdPL0krakR5S3ZEVFRtODRh?=
 =?utf-8?B?b0pUV09FU2x0QkZ1MUdHYXRnRjdtdUwxWkRPcWhoay95QVI2WkdLOHhLelNa?=
 =?utf-8?B?SkU5Y0JjUHNOVGlIMVlUUmMxNVVqRmhLZWdrVnFXeS91b1B0MmRNdz09?=
X-Exchange-RoutingPolicyChecked: UPr0AuT34tUWcv1YtOblVglf4FWuItIg6Par67P13nRnnD365n5I4dj6l7tus8ajpJEZspxbIBVpY0m023lLOR7jkan/ai8Y1Yh3jqojJamQvGKweRMvoWQwbY5L2+oGNVXPVQH3HIhdNCX8ZGHOSBK/mydXXUf8uqwViAKWzAwM67/u/Kt/CfYXpSWPdEcMkxZ4tmBKp6fLulGH7Mo/kfAR8ao7o8lQOBUV8EdhGDvtqckr9FVQ3/Th89XHhLO8sYjqxAR7+aLaA4FphkWlcxWhU7tGaIM37hE+1ufm0JLEiMieYecM4uTYMO3hHmLy5YmXYMQXEpmenrkT2QMJ3g==
X-MS-Exchange-CrossTenant-Network-Message-Id: a447ceec-4cee-415e-212e-08df3352c506
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB8856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 11:17:49.9697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 05gBfjWfY4nOXLk8Q+4orhaSls2k6o0FWbmtCN2Pjkr0Er6ShHplXWMtf/5933GAxz5ER4OsH951dyoCIF0Cow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5041
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 23-10-2026 16:06, Mallesh Koujalagi wrote:
> Store pcode mailbox temperature data directly in the byte array
> using put_unaligned_le32() instead of accessing it through
> different views of the same storage.
>
> This keeps the layout unchanged and makes the data access
> consistent and endian-safe.

1. Is this patch addressing any issue reported by a static analysis tool?

2. Given that |cpu_to_le3()| already handles endianness, do we still 
need this change?

>
> Fixes: ca6e33701de8 ("drm/xe/hwmon: Fix thermal sensor data handling")
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_hwmon.c | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 42acfeb8818c..7bb1223dc30b 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -7,6 +7,7 @@
>   #include <linux/hwmon.h>
>   #include <linux/jiffies.h>
>   #include <linux/types.h>
> +#include <linux/unaligned.h>
>   #include <linux/units.h>
>   
>   #include <drm/drm_managed.h>
> @@ -165,12 +166,12 @@ struct xe_hwmon_thermal_info {
>   	bool available[CHANNEL_MAX];
>   	/** @msu_mask: VRAM subsystem enable mask read from MMIO */
>   	u32 msu_mask;
> -	union {
> -		/** @value: per-sensor raw mailbox temperature; bit7=sign, bits6:0=magnitude */
> -		u8 value[U8_MAX + 1];
> -		/** @dword: sensor values as little-endian dwords, u32-aligned for pcode reads */
> -		__le32 dword[DIV_ROUND_UP(U8_MAX + 1, sizeof(u32))];
> -	};
> +	/**
> +	 * @value: per-sensor raw mailbox temperature; bit7=sign, bits6:0=magnitude.
> +	 * Written one dword at a time via put_unaligned_le32() to
Written -> Write
> +	 * avoid inconsistent union access between dword and byte views.
> +	 */
> +	u8 value[U8_MAX + 1];
>   	/** @vram_label: vram label names, dynamically allocated based on vram_count */
>   	char (*vram_label)[MAX_LABEL_SIZE];
>   };
> @@ -995,7 +996,7 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>   		if (ret)
>   			return ret;
>   		drm_dbg(&hwmon->xe->drm, "thermal data for group %d val 0x%x\n", i, data);
> -		hwmon->temp.dword[i] = cpu_to_le32(data);
> +		put_unaligned_le32(data, &hwmon->temp.value[i * sizeof(u32)]);
>   	}
>   
>   	for (i = start; i < end; i++) {
