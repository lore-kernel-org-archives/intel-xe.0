Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A98C531DC
	for <intel-xe@archiver.kernel.org>; Fri, 23 Aug 2024 13:18:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FD6310E828;
	Fri, 23 Aug 2024 13:18:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d80vmoH/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8329B10E828
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Aug 2024 13:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724419093; x=1755955093;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+XnwWmiJqo+UcP1mPYbva531MFCMTA31to/9jwt0q8I=;
 b=d80vmoH/3B0luu3HiU3b6mAufv4iDT2boHcgEjoOuOC68XvSIV1W5cfo
 +vN9qUfAKPtlZospYjAjEeYKVr1LetocLuJ5jsvxAGAv3QwgR0rVzDUN+
 KPuhZVIbW3hfQwKCVRnAdiXhnHrAtBBTTkja6zZOI7SSNjl1qHWQ3Id4K
 7hNb7eB5TmYzzUTYTSBH9O96wdxoPZnz2we29o7pxNs0fV6YzB2KtNUwU
 sxedxIg2gUySimbfE56e8JMUX3j4RAc5fguSIwzqPtMAXMyu2MTNKdfch
 HiplCdK/KPi7sn7APT5MhBDm5TSWYg1T0qWOuhKhBki8Z7xwp+9H5iZ5G A==;
X-CSE-ConnectionGUID: 7u7HZZXGSnOq72lD0dfPdw==
X-CSE-MsgGUID: 5TsD4zLwRFaE5OsjEvbeuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22852357"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="22852357"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 06:18:13 -0700
X-CSE-ConnectionGUID: uobC9Nw/RFC+EMouV63TSg==
X-CSE-MsgGUID: SfNm3yeZSbq5akWG/FZwdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="61956681"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Aug 2024 06:18:11 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 06:18:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 06:18:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 23 Aug 2024 06:18:10 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 23 Aug 2024 06:18:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S7HUMQ1FP03AHEmJAFwXNxFlUnz15KUiSzkNBfBW99GYoBgnuWIpXmcHVpbYSAK2N8xB4J9HjHg/MFteiTdhOVb91M6m3zBIuRmewAyJnnHmRyWWHkdLIBFE58ddhHGJLDqPwC4IZkSouUp8SliuafEJZF6kLvzrucoEZedZTrJ3bdUytuW6qlGsiAa6OvhDHRTdHDwpUi2KPQqWb4P8772OzNMLZT8zven0y2w3bR0AJB1/FCHbmNPsib5uyVsciNDIXJVKr83PBdQtshf+2MYxzHMGhWU+w+SrTIETNGtFgbq240FhukXKSEapc2WSz9VZ4Hnc9NynEcQjKpulQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=828quwKrywkHi6DXOPieikg92m3mFP+xS66TwX00nUw=;
 b=oj7DPP/w3uTfkb+bRun/47pZpWXjKvTp7g1A5Zcp3EwIkQWcyLv87V+RKB9ZPlTTZf6UWR0xMSf5P7s3ZXsvNxqTfxendgq79d0P3O9R/ks/9XwxBs6sLNRjG3DYixNlKTCgekcj7RtyB5l/Ujbx5DFDJ0dIEDxH28sIkOx+wavFbrKlRv+vPCa+ezGA+sbZRvt0wdhMEd2Y27OWr+t29c6bxCIesO3JxtcMr7kVcuQhZN58IU03YLFB2qocExg0o/Gs6Ql2E1pTxKisiQKrVMwoBKG59Kc8mwK/BQxzCfkqHms5dyi1kJkqVD+5gjwzls2F3DyJ33GHEk+a4myHmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by MW6PR11MB8310.namprd11.prod.outlook.com (2603:10b6:303:249::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 13:18:08 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%3]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 13:18:08 +0000
Date: Fri, 23 Aug 2024 15:18:05 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 12/12] drm/xe/tests: Add KUnit tests for VF control GuC
 messages
Message-ID: <20240823131805.sf5rf2k3onbvez3p@intel.com>
References: <20240809165159.662-1-michal.wajdeczko@intel.com>
 <20240809165159.662-13-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240809165159.662-13-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DU2PR04CA0160.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::15) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|MW6PR11MB8310:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a35f693-5092-40ec-9f40-08dcc37607dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U3UwWDZrN1pKSGlvL1VFa3g3TDFNeEZYZGw5MWFRWkFKNEtaMDJOU0Z3RmNi?=
 =?utf-8?B?R2FsSDk1UzZicE9mOWdWQVZYazg1Q2dUb1o5bDc5VWhRYUgvM2k2VFNlQ3py?=
 =?utf-8?B?ZWdnTDBxY1RkYTR0RkZpNmkxTFZYNmY0WmQ0bnNBb2NFK1o5QVNqUENhRFNt?=
 =?utf-8?B?NnVtUUtsOEQxUmxnczFXWGkyNldQbkVvKzRteHVZZEV6cGhVUmdGQXpYek9q?=
 =?utf-8?B?VG0vbUhJWjJ2aGZnT2F5blFPbG5oSGlIcy9NTTI5d3JIWGk0YUJTQ2tpTFFE?=
 =?utf-8?B?Q1NIRk1KZHp6MFhnbWFrRURyMXpMSG9zRnRhUmRGZE8vWHE2Q3JlNTJENnFi?=
 =?utf-8?B?RjJZU0FEdHhsRGxtK3FHd1Y3WUtpV1VlVzBxWWQrREJCeHVtS011SzA0aHM4?=
 =?utf-8?B?cmVhcEwybVJUUzM3eUM2VVpKVHRsbkkxNE1QSU1kdWxWQitwbDBCU2gyeHlT?=
 =?utf-8?B?TWNTSitxaUFKS2Z4dXpOY3VLSHl1dXVnOFQvVGVvZG9DMWNXVjBRbE5PbFJC?=
 =?utf-8?B?WDB0VFpEOXBaclg4SnRPZG94WWpDUmFMb1pHTG9JTUpvb3IxRUpXczY3eURM?=
 =?utf-8?B?bm5uazREUitTSDBHSlN5a2VZcWFNb1dXNGoxZGF3UlZ3K1ZzUVQwd3BSV2lx?=
 =?utf-8?B?Smdrb0RHOCtaMnZNemV3L3VMZUd3VFkzNjhLZ3BNSkVreG9xVXRXUG1EVU9Y?=
 =?utf-8?B?bWJsdU1MZ01iN0lqdXpZZzNtVUZIYnB5KzlLdTdNUE5VSE41U1pocWYzVFdt?=
 =?utf-8?B?ZVVYazRMU1BBVnF1WmY0SHRJWGlhczVUeUg1MGJpRXpma1UxcVVmdExNTkpD?=
 =?utf-8?B?VnJraXlmdXd0cUdsSjVhWThsNXpFODNGRUt6SzdCMTJHckQ2Qm00eFlrbHZM?=
 =?utf-8?B?QktsZXlEV1RGcEM3SmR5NFNpVEo0bDlYcXU5Z2tpaXlsN1FFV29FVC83NDZt?=
 =?utf-8?B?enBIa3gyNWdmaEpiQTRBMVA1dTRqR1BqNDNjeEp5aHpkbzRISEw2RUdJcEht?=
 =?utf-8?B?QVFndEVHaE1WUXlvTjlGeEw3ZUFJaG52akVuWW5INVhiNnpTeFZIT0lLSGp0?=
 =?utf-8?B?ODlGNVplcW90UWMrMGhNd0EzOUtHUUQ4K1ZKNjVBVG5GUytZYmJGRXBjOFhp?=
 =?utf-8?B?eDU1Q1MwY0xpY2FVWlFIMGpqQmc2T1JrMkhaeDFmencrK2ljRjJLVndlSjhL?=
 =?utf-8?B?MFFqZmhCQyt0YVVZRzFvc2h2ZzYwem1PREZTWFZVSlU0QUhUd3VXSzVUdTN6?=
 =?utf-8?B?MzdIcnBlcVlROUdiUmVvQmFpaGRZVEdXckhubmIzTXMwcGc3Snk5dTUwQk5a?=
 =?utf-8?B?Mk9OTTJBYXhVZ3FVNTRkU1EwNkZhUkdXd2VYK0k0bWs1SnVab1liUmh4NnJR?=
 =?utf-8?B?ZUlDQmlBdWE0VUZ3WURDZ3NtTWcyU3JSMElRMWs2b3hXbjMzSEhxMVUwblIx?=
 =?utf-8?B?K1A1alRCRmJMZGQ0MDBhb0tWaHd2cHlvaTIrdzJmMWZlNVhueS82blhIMDNo?=
 =?utf-8?B?dzFwSlFBQU9yUTRKS0ZxYWI2QUNSNVBDdGNyZHZZcTU3Szl4SVh4Z1pzNFlS?=
 =?utf-8?B?OTFOMGhmVWJLTU5BcmhGb2JLbFFkY0tEMzFFTGgxQ3BlYzJmd0JJUm9ORVNl?=
 =?utf-8?B?K1VFT05SR2RZNnc2Y21UdS9tY0hOSVd3WE9UVmEwVXZXWlFHUHFWMDA0TEth?=
 =?utf-8?B?VU53OVpTMTBIRGNTenlPZEdpWXllWUtKekFjRkVaVVlrMlp3andpMjRTcEJW?=
 =?utf-8?B?NGRkcHpKSjJxVGhuSUZHaUdKekF0Z3pva3BmN3RmMjIzaWRZNmluMDd4ZFU0?=
 =?utf-8?B?UHl2VzlQcjVpaHpIMjl6QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkpEbXM4NWpxNlpMTlZaMWd0SjYwaVhTVU5GWjNMS1BsL0dlQXZTVjNSbk5E?=
 =?utf-8?B?TnJJS3B0TGZpQUdzcXMrQytjSDVRcnFxbVNuV3FycTU2TENDNi96QTFMc0Z1?=
 =?utf-8?B?eW9jQm9oM1JsVDVRYU9FMFphT2VGMHZ6cjd0Q01yWUF0NVE2UmZFV2VZWjBq?=
 =?utf-8?B?Nzh1T0o1c01TaWNHcmxMVThPQ1RTWEoxRjFEZjNpVGUreGFjZWxybmU4Y294?=
 =?utf-8?B?OWkvT05YVHZsaTR1SmNLdVlsU05MUlkzd1dLdW5HTEo3cUY1alVVOTVkbW1N?=
 =?utf-8?B?SW92SUVCckc4bGVGYlBDMUpsUmZmMHRRQ0VOUFVZRGllUXRWeVhiVEY2a0Uz?=
 =?utf-8?B?cE83bXdZVHhCOTV0OHMyNGJFVFR6YTVsV0FycDd4SGVQNWJpSEE2WVk0SE5u?=
 =?utf-8?B?OVkzT3lQYUFWSDJiS3dWblc3OU80elZFZDgzQ0tTRmcrYUpmYzg5ZFVnbmRs?=
 =?utf-8?B?aUErdnRzVWhlNGdkTTU1V3RNaUJiUWFBTy9CVzJSMnY2bjhLaWZraVgyQ0h3?=
 =?utf-8?B?NE5UVHZsMldvVVdDajVtOVNXRjdTeHdqcU9hUzVoZWdzY01VK0NCdzN3UmRz?=
 =?utf-8?B?dEV0WVhpckQycWpReUJNQitWb3ZKaWxhaGlmeEhxdFRGcUkvWWpFSEQ4bG8w?=
 =?utf-8?B?Rk9yWTR6ajNxUHRyN3hlSmQ2WDRsV2xQQXgwU1h6NGJ0bmxPNytzMXFoQ2du?=
 =?utf-8?B?d3ZRVXFtdVRiQTVrRXBmR0xXdmZhQXcrd05pNEJhRXFqTmxuNzRqRXIwVzdD?=
 =?utf-8?B?MHRHOGQ3MjI5NnF5SXZ0b1BzckR2dzg2SStEUlhmNWYwcSsvcW1FT2p0SmVC?=
 =?utf-8?B?bThHZXJwRzdvQWREbmFJUncvUVhLU1JHWlVOL1Y5YW1WS3UrWXU0V1FvNzh4?=
 =?utf-8?B?bDNnWXZObWVXSyszZVEweXhVZGFYRHlZbktpUVQ1YVhPdFpFTEtpT1BMa2gz?=
 =?utf-8?B?azFyeEhGNFNLdVpCZXY5WE92Z1FBcGVrRTRqRDVkalFOUFhVT2FaVXdjTWNj?=
 =?utf-8?B?UXhaNHk4UkJQMFlWbk1RbW5XVlFtU2pXTWI1aGpHZDJPU0JPbUcyS2FlWWlm?=
 =?utf-8?B?ZjJ5N0JGVzJJZFNjRysxMDZNcWJFeHpRYmVFUDZsbXFJTzRBRXJKaHd0bFU0?=
 =?utf-8?B?SVkwdjFLM1pnSW1QcFdJRGlyQUVUVGxZQzlQZXluWExTMitkRWJ2cWlkZDd0?=
 =?utf-8?B?eGZaeGE4SkR5VjRHc0FQeGtDRnRycmJpQlpDOTNZU3YvSFFmcXNlKzl4OTR0?=
 =?utf-8?B?UHBQT3VwbERKVlY5NHU3Y1pPYVhBQ3lzVFJMQVRYOE44dkxURkZSSU1Jall4?=
 =?utf-8?B?V01wM052ZzFKQzJiNDFtWXkxdmFPdXk5RnRTeE15Ykd4U3ZrL1ovaDY0dzdF?=
 =?utf-8?B?WVFJSVppejRsVm1QNENTQ2szQjRyVEltYXlka2l3UzJGSEtVYnhFcVgrRmtZ?=
 =?utf-8?B?TW91Yk8xc0p6QVNqemllUmxWMk05UkU3OTRVZzNJdm5JRWNHQlRpQjl6SVQ5?=
 =?utf-8?B?K2NBZ1g4bUlJZ1hKbWVrVHJtVDU0Sk1DSmFYdEdhbVRuNFhFYUtlQm5BdUdB?=
 =?utf-8?B?aVAvck1oQndNS0Nxd3hjMXA1M2RDRkh1VTYvcWd6SWFEVXlGZ1dBbTk0ZFRr?=
 =?utf-8?B?K01QelNJRVg3eEFxRllBMVdtbWZKVTc0Ym84dVN0M0trQTJ1dUNLQ0FMMWxQ?=
 =?utf-8?B?aC9QWHZXMDRpK0pobWlqMkEzTm5wb3JCQzlieUpweGZwOU1ZUFpsbkF4eTNW?=
 =?utf-8?B?ZGZWNitNaXdycUoyNGRqYlpnSk5RNUx0cE1Ncjg2NmpxZ0JPMVRYdS81Ylh0?=
 =?utf-8?B?Yk5TZ0Jza0tFK2pSWFAxTkpOc3lYT1hFWUF2dWJQdWMyY0E4SU5iYzFoSEJP?=
 =?utf-8?B?dGtTOXZnWm5zQWxGNDRiSFFOOFVZY2pHcm5NZ0Z2anhlWjU0b0FpS0Z1TDVE?=
 =?utf-8?B?VFVjc3FlcWlWVThMeXJydmhNbXRsNmc5eVlhL3pnWnZGWjkyZ0Zld2V2WFhB?=
 =?utf-8?B?anVQZTB1Q0FnR3ExNklhNEpFTFhZcFBhRFpLWjlweDV3OS9tdmNuZytYZ3ow?=
 =?utf-8?B?ejRuQ05NckJ6d3pyS3l4QVVYYUR6Uy9KQTgvc01OMmh0bTFRdFZMdGo2QWM0?=
 =?utf-8?B?bTRpWXN6ME5kblExSGpZaW1SaGpOT2JZMVdXK3hxc1MwUGZqVDU5VlU3Q0Z0?=
 =?utf-8?B?Mnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a35f693-5092-40ec-9f40-08dcc37607dc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 13:18:08.6400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZXHygYG7LYK0NPOfsP54kWr3eS0MwJD1osaAc4ZhWWF5tAXvzzosM0+XlYdQsV5sB9nyuKSkQnTmdZo/OfZO1FnShu/1SYHXUzGyg7nmtAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8310
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pią [2024-sie-09 18:51:59 +0200]:
> Add KUnit tests (~50) to cover all possible VF control messages
> that could be seen by the PF, either expected or corrupted.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  .../xe/tests/xe_gt_sriov_pf_control_kunit.c   | 194 ++++++++++++++++++
>  1 file changed, 194 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_control_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_control_kunit.c
> index 4252577b4bbd..194fcf5687d1 100644
> --- a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_control_kunit.c
> +++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_control_kunit.c
> @@ -1358,3 +1358,197 @@ static struct kunit_suite pf_control_suite = {
>  };
>  
>  kunit_test_suite(pf_control_suite);
> +
> +#define PREP_MSG_0_VF_STATE_NOTIFY(mbz)							\
> +	FIELD_PREP_CONST(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_GUC) |			\
> +	FIELD_PREP_CONST(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_EVENT) |			\
> +	FIELD_PREP_CONST(GUC_HXG_EVENT_MSG_0_DATA0, (mbz)) |				\
> +	FIELD_PREP_CONST(GUC_HXG_EVENT_MSG_0_ACTION, GUC_ACTION_GUC2PF_VF_STATE_NOTIFY)
> +
> +#define PREP_MSG_VF_STATE_NOTIFY(mbz, vfid, e)						\
> +	PREP_MSG_0_VF_STATE_NOTIFY(mbz),						\
> +	FIELD_PREP_CONST(GUC2PF_VF_STATE_NOTIFY_EVENT_MSG_1_VFID, (vfid)),		\
> +	FIELD_PREP_CONST(GUC2PF_VF_STATE_NOTIFY_EVENT_MSG_2_EVENT, (e))
> +
> +static const u32 msg_pf_enable[] = {
> +	PREP_MSG_VF_STATE_NOTIFY(0, 0, GUC_PF_NOTIFY_VF_ENABLE),
> +};
> +
> +static const u32 msg_vf_flr[] = {
> +	PREP_MSG_VF_STATE_NOTIFY(0, VFUT1, GUC_PF_NOTIFY_VF_FLR),
> +};
> +
> +static const u32 msg_vf_flr_done[] = {
> +	PREP_MSG_VF_STATE_NOTIFY(0, VFUT1, GUC_PF_NOTIFY_VF_FLR_DONE),
> +};
> +
> +static const u32 msg_vf_pause_done[] = {
> +	PREP_MSG_VF_STATE_NOTIFY(0, VFUT1, GUC_PF_NOTIFY_VF_PAUSE_DONE),
> +};
> +
> +static const u32 msg_vf_fixup[] = {
> +	PREP_MSG_VF_STATE_NOTIFY(0, VFUT1, GUC_PF_NOTIFY_VF_FIXUP_DONE),
> +};
> +
> +static const u32 msg_pf_bad_mbz[] = {
> +	PREP_MSG_VF_STATE_NOTIFY(1, 0, GUC_PF_NOTIFY_VF_ENABLE),
> +};
> +
> +static const u32 msg_pf_invalid_event[] = {
> +	PREP_MSG_VF_STATE_NOTIFY(0, 0, 0),
> +};
> +
> +static const u32 msg_pf_unknown_event[] = {
> +	PREP_MSG_VF_STATE_NOTIFY(0, 0, GUC_PF_NOTIFY_VF_ENABLE + 1),
> +};
> +
> +static const u32 msg_vf_bad_mbz[] = {
> +	PREP_MSG_VF_STATE_NOTIFY(1, VFUT1, GUC_PF_NOTIFY_VF_FLR),
> +};
> +
> +static const u32 msg_vf_bad_vfid[] = {
> +	PREP_MSG_VF_STATE_NOTIFY(0, VFID(DUT_NUM_VFS + 1), GUC_PF_NOTIFY_VF_FLR),
> +};
> +
> +static const u32 msg_vf_invalid_event[] = {
> +	PREP_MSG_VF_STATE_NOTIFY(0, VFUT1, 0),
> +};
> +
> +static const u32 msg_vf_unknown_event[] = {
> +	PREP_MSG_VF_STATE_NOTIFY(0, VFUT1, GUC_PF_NOTIFY_VF_FIXUP_DONE + 1),
> +};
> +
> +static const u32 msg_no_data[GUC_HXG_EVENT_MSG_MIN_LEN] = {
> +	PREP_MSG_0_VF_STATE_NOTIFY(0),
> +	/* only header, missing both VFID and EVENT data */
> +};
> +
> +static const u32 msg_pf_too_short[GUC2PF_VF_STATE_NOTIFY_EVENT_MSG_LEN - 1] = {
> +	PREP_MSG_0_VF_STATE_NOTIFY(0),
> +	PFID,
> +	/* missing EVENT data */
> +};
> +
> +static const u32 msg_pf_too_long[GUC2PF_VF_STATE_NOTIFY_EVENT_MSG_LEN + 1] = {
> +	PREP_MSG_VF_STATE_NOTIFY(0, 0, GUC_PF_NOTIFY_VF_ENABLE),
> +	0, /* unexpected extra DATA */
> +};
> +
> +static const u32 msg_vf_too_short[GUC2PF_VF_STATE_NOTIFY_EVENT_MSG_LEN - 1] = {
> +	PREP_MSG_0_VF_STATE_NOTIFY(0),
> +	VFUT1,
> +	/* missing EVENT data */
> +};
> +
> +static const u32 msg_vf_too_long[GUC2PF_VF_STATE_NOTIFY_EVENT_MSG_LEN + 1] = {
> +	PREP_MSG_VF_STATE_NOTIFY(0, VFUT1, GUC_PF_NOTIFY_VF_FLR),
> +	0, /* unexpected extra DATA */
> +};
> +
> +struct msg_param {
> +	const char *name;
> +	const u32 *msg;
> +	size_t len;
> +};
> +
> +static void msg_param_get_desc(struct msg_param *p, char *desc)
> +{
> +	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s", p->name);
> +}
> +
> +#define MAKE_MSG_PARAM(X) { .name = #X, .msg = X, .len = ARRAY_SIZE(X) }
> +
> +#define LIST_MSG_PARAM_VALID			\
> +	MAKE_MSG_PARAM(msg_pf_enable),		\
> +	MAKE_MSG_PARAM(msg_vf_flr),		\
> +	MAKE_MSG_PARAM(msg_vf_flr_done),	\
> +	MAKE_MSG_PARAM(msg_vf_pause_done),	\
> +	MAKE_MSG_PARAM(msg_vf_fixup)
> +
> +#define LIST_MSG_PARAM_INVALID			\
> +	MAKE_MSG_PARAM(msg_no_data),		\
> +	MAKE_MSG_PARAM(msg_pf_too_long),	\
> +	MAKE_MSG_PARAM(msg_pf_too_short),	\
> +	MAKE_MSG_PARAM(msg_pf_bad_mbz),		\
> +	MAKE_MSG_PARAM(msg_pf_invalid_event),	\
> +	MAKE_MSG_PARAM(msg_pf_unknown_event),	\
> +	MAKE_MSG_PARAM(msg_vf_too_long),	\
> +	MAKE_MSG_PARAM(msg_vf_too_short),	\
> +	MAKE_MSG_PARAM(msg_vf_bad_mbz),		\
> +	MAKE_MSG_PARAM(msg_vf_bad_vfid),	\
> +	MAKE_MSG_PARAM(msg_vf_invalid_event),	\
> +	MAKE_MSG_PARAM(msg_vf_unknown_event)
> +
> +static struct msg_param valid_messages[] = {
> +	LIST_MSG_PARAM_VALID,
> +};
> +
> +static struct msg_param invalid_messages[] = {
> +	LIST_MSG_PARAM_INVALID,
> +};
> +
> +static struct msg_param all_messages[] = {
> +	LIST_MSG_PARAM_VALID,
> +	LIST_MSG_PARAM_INVALID,
> +};
> +
> +KUNIT_ARRAY_PARAM(valid_messages, valid_messages, msg_param_get_desc);
> +KUNIT_ARRAY_PARAM(invalid_messages, invalid_messages, msg_param_get_desc);
> +KUNIT_ARRAY_PARAM(all_messages, all_messages, msg_param_get_desc);
> +
> +static void xe_rejects_all_g2h(struct kunit *test)
> +{
> +	struct xe_device *xe = (xe_kunit_helper_xe_device_test_init(test), test->priv);
> +	struct xe_gt *gt = xe_device_get_gt(xe, 0);
> +	const struct msg_param *p = test->param_value;
> +
> +	KUNIT_EXPECT_FALSE(test, IS_SRIOV_PF(xe));
> +	KUNIT_EXPECT_EQ(test, -EPROTO, xe_gt_sriov_pf_control_process_guc2pf(gt, p->msg, p->len));
> +}
> +
> +static void vf_rejects_all_g2h(struct kunit *test)
> +{
> +	struct xe_device *xe = (xe_kunit_helper_xe_device_test_init(test), test->priv);
> +	struct xe_gt *gt = xe_device_get_gt(xe, 0);
> +	const struct msg_param *p = test->param_value;
> +
> +	KUNIT_EXPECT_FALSE(test, IS_SRIOV(xe));
> +	xe->sriov.__mode = XE_SRIOV_MODE_VF;
> +
> +	KUNIT_EXPECT_TRUE(test, IS_SRIOV_VF(xe));
> +	KUNIT_EXPECT_EQ(test, -EPROTO, xe_gt_sriov_pf_control_process_guc2pf(gt, p->msg, p->len));
> +}
> +
> +static void pf_rejects_malformed_g2h(struct kunit *test)
> +{
> +	struct xe_gt *gt = (pf_control_test_init(test), test->priv);
> +	const struct msg_param *p = test->param_value;
> +
> +	KUNIT_EXPECT_NE(test, 0, xe_gt_sriov_pf_control_process_guc2pf(gt, p->msg, p->len));
> +}
> +
> +static void pf_accepts_valid_g2h(struct kunit *test)
> +{
> +	struct xe_gt *gt = (pf_control_test_init(test), test->priv);
> +	const struct msg_param *p = test->param_value;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_pass_no_reply);
> +
> +	KUNIT_EXPECT_EQ(test, 0, xe_gt_sriov_pf_control_process_guc2pf(gt, p->msg, p->len));
> +}
> +
> +static struct kunit_case pf_control_guc_test_cases[] = {
> +	KUNIT_CASE_PARAM(xe_rejects_all_g2h, all_messages_gen_params),
> +	KUNIT_CASE_PARAM(vf_rejects_all_g2h, all_messages_gen_params),
> +	KUNIT_CASE_PARAM(pf_rejects_malformed_g2h, invalid_messages_gen_params),
> +	KUNIT_CASE_PARAM(pf_accepts_valid_g2h, valid_messages_gen_params),
> +	{}
> +};
> +
> +static struct kunit_suite pf_control_guc_suite = {
> +	.name = "pf_control_guc",
> +	.test_cases = pf_control_guc_test_cases,
> +};
> +
> +kunit_test_suite(pf_control_guc_suite);

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.43.0
> 

-- 
