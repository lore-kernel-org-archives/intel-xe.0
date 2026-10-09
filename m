Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F8ECA6012
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 06:44:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7719810FEB7;
	Fri,  9 Oct 2026 06:44:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NaTJPk95";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC6D910FEB7
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 06:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791528249; x=1823064249;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=ZXaTvStkVzZ2Kr1DGw6P2v2s7yTAJX70iLrsiBgrruw=;
 b=NaTJPk956rbPxBH40AU6PPWl7YLguMWvK0nR3KShWDUFlHEe6CsbqEsD
 rQED5ZpYc1W50p7ng6JhEMCh/yweBUITxYupnvKssPQTOSQdoxCchmSLi
 e8HmFruHw0204FNxTh3zb8pYMeJLXqhwQ+8vSpmUGcqgfkeh8SiWdipWd
 bFOILXcEr5dTn7O0W5EXJMt2jeahCl0Ulknk8l+drImwiWq2ontv8tCE9
 EC/HQpGPEG29sQ2ZiZaYRFN3a4rtmfLd/wULwg1gPvbUmAXk6Lvvmtuph
 lCL+myqiXaSqwXeVBUvoKi+7lrwFHgd1H1poD9UIB4ew3mrdT5huSBJvi A==;
X-CSE-ConnectionGUID: yHyVqdPLT+CT1L210GJIuQ==
X-CSE-MsgGUID: 5zU+dzTKT9+XAIfbUW8Kgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="322444"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; d="scan'208,217";a="322444"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 23:44:08 -0700
X-CSE-ConnectionGUID: +0k8GrDjQ4G37x82hv62CA==
X-CSE-MsgGUID: fcQEMdF5S++zQzXDZ08mQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; d="scan'208,217";a="389014"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 23:44:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 23:44:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 23:44:06 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.16) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 23:44:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SZ8+W+DzkUSz/X00oNrkhmZ0Xg+bg1DcJ+8h5nu13m/dKjeRiubhS3+OWbYIPi5NZQMES/+Aayi4OdFJy7LtdEXB3ErHo6/ONG4sE29imn+PnMREY+YnqPgeQAGtTKpcRf6px+4QSeC4Pwk728/Z5mXJzNolPZmt2ck1KOdk/Oi+Tt2YWf+Vua2RaplPX7CLDNa2YlLQba2PUnNrAn5e9w8xzA+KEBr9cyqq0jve1mpJqv9RUDp+LGtaPI7ZEydmuabyvUhxdHpvnr4dc7C/DyuMoV/SIdbtdmXoNCyR4RlRgVPXOZff4F8jpmnMFj9DWx7jku88IFXWUCsIhYftEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8kF2A9Jo0rRAXhc6wimRhzuObKJ25HLuqh+4ErXagOw=;
 b=V7LOM5Dv/0uRsspmJNbGaOtCrRBc5/s+or1rYRNM2oCw5KDOaEok4i8gicNSpwCJTcTIUC+ezNmNZK2aHmod1GAHWG4FB2bd6r45XRkLTz5BHivySKm0fNQm/k2rUdD0fL01pWTWV8q6Q8+WpyzcRXsZ/SjxXDsbM5gD03o6N53s6bpEo9FVB5PIF+DH2ekHW/TK4sXoWtsvn/z+y+xuApPmWu/yerXjLcl+sn6eyznCkQ35i1m0/Btn6fuf52aJsho5Nu84Ge7RbfFWjJ7CzsS3NfY6rpVtuym9kyUkliYpC6gXzdUL28wt9dZdnoKeC86e/PT882VsmCtiJFGNVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB7556.namprd11.prod.outlook.com (2603:10b6:806:31f::21)
 by SJ0PR11MB6789.namprd11.prod.outlook.com (2603:10b6:a03:47f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Fri, 9 Oct
 2026 06:44:03 +0000
Received: from SA3PR11MB7556.namprd11.prod.outlook.com
 ([fe80::3b95:cfb:be21:788c]) by SA3PR11MB7556.namprd11.prod.outlook.com
 ([fe80::3b95:cfb:be21:788c%6]) with mapi id 15.21.0472.016; Fri, 9 Oct 2026
 06:44:03 +0000
Content-Type: multipart/alternative;
 boundary="------------PrCVbtXE10ekAk0zaXKf4EQA"
Message-ID: <f95ed6a1-a849-4a46-82da-49dbcb4ad744@intel.com>
Date: Fri, 9 Oct 2026 12:13:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/sysctrl: Add mailbox control state to error
 messages
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nasim, Kam" <kam.nasim@intel.com>, "Luse, Paul E"
 <paul.e.luse@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>, "Koujalagi, Mallesh"
 <mallesh.koujalagi@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>,
 "Nilawar, Badal" <badal.nilawar@intel.com>, "Ruhl, Michael J"
 <michael.j.ruhl@intel.com>, "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>, "Nerlige Ramappa,
 Umesh" <umesh.nerlige.ramappa@intel.com>, "V, Mohamed Mansoor"
 <mohamed.mansoor.v@intel.com>, "Wajdeczko, Michal"
 <michal.wajdeczko@intel.com>
References: <20261008170710.3584183-2-anoop.c.vijay@intel.com>
 <21d4bf46db2bbd21562a695037733259d4ed4383.camel@intel.com>
Content-Language: en-US
From: Anoop Vijay <anoop.c.vijay@intel.com>
In-Reply-To: <21d4bf46db2bbd21562a695037733259d4ed4383.camel@intel.com>
X-ClientProxiedBy: MA0PR01CA0050.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::7) To SA3PR11MB7556.namprd11.prod.outlook.com
 (2603:10b6:806:31f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB7556:EE_|SJ0PR11MB6789:EE_
X-MS-Office365-Filtering-Correlation-Id: 27877cb6-f8e1-4203-60d6-08df25d0b51e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|6133799003|18002099003|22082099003|8096899003|10067099003|3023799007|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: VpLCLB8tK1wQI9FBZTTeAHHu/B9dBm9ErARhJFYM6hCjPALwgc7QpW1wOO7kcA4gQpPYz6uc9va1MEytTrf0rywcgpL2fPi8trnthPLlSKNlBFlPhWgHGoTGALOMfMj925ifgNN3K/cSyIlii+FeX7DcI1s5W2hkSzwYCHFZdgYKqSlLTU6kgTBt6K9Otn0tPL2hGkd5txeSsNsuogCdfKkDCX2PO45cWuicPGWKW8dIrh0t1g87/KPPVNGtO1E0WqMCBHA+UwMyhLlAJ1a9TZixRJmaTMwjhm8ldy1DOSLIt2jt8jN06eQZaWyRmWVRUCWWhKSqYYRrYBIILzUcLaHHzu9Ao8kM1OCIcCVclF8LUp4/n5Vfp+zWDGfvXlFVPKlxo2FgTFYvASNBiJxKjwV81owIpy360lGdquiq5Yo5Oh10aumrDjdyeCJpow931Xc+x0MeQ7x4+o2QeEQzLqVb0OnOAwUX1BAAWlkBSnBzSYE1bAXpkP7hO9Ieczigf5Flqud0zUcmY4R81I1VwzvKslyzAeVB4sTRog7frLHvugB6h/aFDnhssfEfKL3PS7vqgOQ2V1nItI/1ny/0DPu0K0xOouCzHLJUlnz/IhSrdGakfLkTciUw/4GP+xIMkbwwLnClw8uQ/HZsRDCARHmf20CnVo0vArhgP4HwMoI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB7556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(6133799003)(18002099003)(22082099003)(8096899003)(10067099003)(3023799007)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0RxSDNkaWQvcmpmQW90UWNKRXRRanAzRzZvak8vWHdxWnRudXdEbU1XdlY2?=
 =?utf-8?B?YmhvL3FTN1AxR3c1U3ZpTlNySkJXQTBBSnU3SFhFTVFXNDBtVHc3VWlTZ1Jx?=
 =?utf-8?B?V3ZkZURRcUdldXFSaDE1M05GY21oYjRneFp2RWt6Nk1oYkJ0RTk1dzlMSTRw?=
 =?utf-8?B?ZkhrcmdIWXlsNDA5T2lhYTIzQmE3M0xHdFZmeGpsNytTNUdiSEMzT01FNXg1?=
 =?utf-8?B?NlE4TkpSZEo3SGtnd0FoTkVtcnQ3d2QvVllkdWZKQzRpNHFQNjRQU0hKaUJo?=
 =?utf-8?B?NEVjcnpWZTc1OUNSU3BuQVN5RFhuMnZYVnFrZEg1T3p1Y0ZJYndDbHlUOWdV?=
 =?utf-8?B?QWI0MmJwRWZkZWVSUVA0eUJ6cTZ6OElucjJxL2RhSVZzK2Jwb0o2NnI2SW0v?=
 =?utf-8?B?Wjc1MkxHNktsdk5sZW9zQ1JNelQ4QVNUSnBQQlRLVHlLL0tudWZpQzNQTW5n?=
 =?utf-8?B?cWtMdFd6VHFqUFl5UzhYaDBkdU1vKzZwelh0NUdWYU5CTE9lOHFkUUxUbDg1?=
 =?utf-8?B?bnZuMnkvaFNldGNRZE41b1MwR3FMZDNOQkZYdGRJK2MzKyt1UkIvcExGd1kw?=
 =?utf-8?B?YjNoTnU4LzIxemxWMTNjQ2lLSWxWUytPTllxS1c0Y3dkZ1Raa2FRaXR3bzda?=
 =?utf-8?B?N1RqbC9zMWNETFNOeXdXbHBwVlNEWHZLRG5YQzZ1MjVjTXUvUGpLYW5CTjRy?=
 =?utf-8?B?YzJtWEY4clNqZTNadFNlT0ZBbW9DZWp1Z0grK1YyV0hYZ01qSGxOMHdYdjJO?=
 =?utf-8?B?c3ZDK0psbHMyMnl4NjZxcFNMeUNUV0dUNDJ3WHRpS0dtOW1GL2M4a1JMdHRu?=
 =?utf-8?B?MXl5WTlXckF3MWhCKzFjYkhWdzUwU25oNlJ4VGJHbkkzazE0SHYzVHFWMjVJ?=
 =?utf-8?B?LzdJVG1NMzVBMVk0eXh1akEvK3p6WHJkNUZqdllRK0NWZDJDVnBPQXdMdVVl?=
 =?utf-8?B?V1k0VXZBbzJ3NHB3NUNzYmxzb2ZVVEs1cHdOYkx0YVFHYm1OaVNBenZsUHVa?=
 =?utf-8?B?YWZxNUhpLyt3VWN2R0NHZ2l5bTJ5NnpYdW1RTDhkY0ozd1pwMVNmd1dSUHp5?=
 =?utf-8?B?NFRtN0ZJZjFFb2ZDNmVEU1pHRm1UL3pmRDBsWCt4SUFCc0xvbXo2cTc2NkpK?=
 =?utf-8?B?MUN2SS9aTzZTczR6L2dpbzJnUUhmWDNXTkw2OG1RNkNMSzkwRERmTytnMTRJ?=
 =?utf-8?B?T0RGd0VLOFpDS3g3QzVkY1hXU0pPRHRNODN3ZUZSbHdYeTlmaFcvUTlzYlpp?=
 =?utf-8?B?ZlFxWnpJdGFqS2ZyeDFTZVZtQmluZ1pXc0hyZFAyaExNSytoVFU2OERLT0E5?=
 =?utf-8?B?NTByby9SQU5WVC85enZ5LzkzZW1IeUR0WjVqTHYrdkQ4MUdWOW5ZZ3Z0TFFs?=
 =?utf-8?B?WVdncHhlcEFSeTlxNUdQdG53aVc0bTEwQnd4T3hGUm96TlRWd2c1dUttRjYv?=
 =?utf-8?B?a2FTU0dVWWpjSTM0SDRTWUhaZkpIVkNzbVJpc3Z0VEhoQURRRGpYaU5KbEp6?=
 =?utf-8?B?OHNMQllpR0VVZ21JbUZVQXFpclQ4UDRyZXh1SVB0cHh2Vk9lSVVKZG5VTmY3?=
 =?utf-8?B?M1dXMEZFSFE0WjFFQ0NubDVmRUlmUHhHM1NQWUNQK1Y3YXJqOHhndEc3SXNR?=
 =?utf-8?B?cXhUVUU3TlVCaEd5M3I2cFJVRVJCbERudXl6M3Jsa1Q2UnVSOWNxZnE5MHNq?=
 =?utf-8?B?TVZRUmZMTTlJdWUrVWFIZFFsOHNRYUlWREVoQ1JXbFJ1clI5YW5xRDBqT0gz?=
 =?utf-8?B?alpCR3hFd25PNjduLzVmRzRuVkNYWm4wQnZ6THVVdU96VGRMaDltR0VrdnFk?=
 =?utf-8?B?QWtOcE92OFA4TEUvRFFjT2hZMC9Qc0JJdSt3ejBzTWRHMitqUzBPU0laUXBP?=
 =?utf-8?B?VUw5TVB6SEpuTlo4T1VhOWlhQTlYRmdNeTVmaE9DWDB5NzNyakpVT2RSMWhZ?=
 =?utf-8?B?WmF4UEdEa1VCV0JqdnkxQXUzUzhqNzFNYXJrcmxOVVFNU08yMDJKN0RCbm1F?=
 =?utf-8?B?N2FxdkFOZXo2VDlxMS96NDM3dXZhQ1dzVDdHa1EzRkV2K3Z3cVhhWWVmMzRE?=
 =?utf-8?B?NkhnbGY4Q2RsdC9TbU5kS1hwWXUyUm5SdjI2Tkh0Qnl3T0NFa3U3R1hGNWY4?=
 =?utf-8?B?K240VEh6STkzUUhrUWE3TjhBVzk0a3BJNnhoTE1TdVlSendCWVpYbXlWVDJ0?=
 =?utf-8?B?NkViaEVNZTZONlpabkJkaXZTUVRnYzV6OFA3Y0QyR3M2MmhxdWhrckpjV2pG?=
 =?utf-8?B?YWdiNG96S3libnhaK2JLUDhmMzhEeFp3NVBtY252K3BMMmVRajZja0JrWTQw?=
 =?utf-8?B?UFlZZlZyQ2N1amIxbThFZ2ZEQnB1VHVvNjliZDRQcTJ2SStxdEllQT09?=
X-Exchange-RoutingPolicyChecked: Bkp0uA6wq+4I6EJpJYilKjKQek+RDi8OTcZEvMlaubkH/57Z/I8gQ85njQ5PYist8Pqgr6dR1VWljjLTnryIga6wZyX1RbgahH0lMPqmxDdjb+fHUoZ6YslqUexmrFbHnKbn60yZYY5zy+wCgxZ7X3Q8QMyE8LrlIiEAtHYRV7xWxfzpJvLjf2MWC7SoPskt/o1HL+FReepTS7OWQfVNBDYS4c0n7ZMimQ8EUSVz3wUozcTkmwrAO1iW8Dvhcz0bNta71Ky9zzutXCAG5cYHerheG4N9WQs8VxQRUOb4wjtoz2DQIlNMuoIXPZyBzoKKO9xxhFBgo4qSEOYQZfOzDw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 27877cb6-f8e1-4203-60d6-08df25d0b51e
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 06:44:03.3472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5eWdka+5XxUkJPUOp5ReBg5hIDkH+dFTZrFOEOjQJ0dfcH6YsR+db/uY07365ETanSciCDBvn1H239TybAEQGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6789
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

--------------PrCVbtXE10ekAk0zaXKf4EQA
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 08-10-2026 23:10, Teres Alexis, Alan Previn wrote:
> On Thu, 2026-10-08 at 10:07 -0700, Anoop, Vijay wrote:
>> From: Anoop Vijay<anoop.c.vijay@intel.com>
>>
>> Include decoded mailbox control register information in mailbox
>> busy, timeout and firmware error paths to provide additional
>> context for failure debugging
>>
>>
>>
>>
> alan: snip
>> +
>> +static void sysctrl_mb_ctrl_desc(u32 ctrl_reg, char *buf, size_t size)
>> +{
>> +	scnprintf(buf, size,
>> +		  "frame=%u/%u busy=%d resp=%d ctrl=%#010x",
>> +		  (u32)REG_FIELD_GET(SYSCTRL_FRAME_CURRENT_MASK, ctrl_reg),
>> +		  (u32)REG_FIELD_GET(SYSCTRL_FRAME_TOTAL_MASK, ctrl_reg),
>> +		  !!(ctrl_reg & SYSCTRL_MB_CTRL_RUN_BUSY),
>> +		  !!(ctrl_reg & SYSCTRL_MB_CTRL_RUN_BUSY_OUT),
>> +		  ctrl_reg);
>>   }
> alan: btw, are the meanings of the ctr_reg values based on a predefined hw-protocol spec?
> if so, could we include a helper for hex->string conversion? (ofc need to also check for
> size of the char_desc - which isnt in this function (dont want an overflow if future
> develoeprs decided to add more content). Im not too familiar with the mailbox register
> spec but from code i thought the same ctrl register bitmasks mean different things
> depending on read vs write - so might also need to have two helpers or extra param?
> I understand this provides little benefit for a developer who knows the code well,
> but provides a lot of efficiency when someone else is debugging the code.
Control register fields are defined by mailbox protocol and have the 
same meaning in both Tx and Rx paths, so I don't think separate helpers 
are needed.
The sysctrl_mb_ctrl_desc() helper intentionally reports both RUN_BUSY 
and RUN_BUSY_OUT to show full mailbox handshake state at the failure point.
As for buffer safety, the helper takes destination buffer size and uses 
scnprintf(), which bounds the output to the supplied size, so there is 
no overflow risk.
>>   
>>   static void sysctrl_write_frame(struct xe_sysctrl *sc, const void *frame,
>> @@ -128,17 +140,24 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
>>   			       const u8 *mbox_cmd,
>>   			       size_t cmd_size, unsigned int timeout_ms)
>>   {
>> +	const struct xe_sysctrl_mailbox_msg_hdr *hdr =
>> +		(const struct xe_sysctrl_mailbox_msg_hdr *)mbox_cmd;
>>
>>
>>
> alan: snip
>>   
>> -static int sysctrl_process_frame(struct xe_sysctrl *sc, void *out,
>> -				 size_t frame_size, unsigned int timeout_ms,
>> +static int sysctrl_process_frame(struct xe_sysctrl *sc,
>> +				 const struct xe_sysctrl_mailbox_msg_hdr *req,
>> +				 void *out, size_t frame_size, unsigned int timeout_ms,
>>   				 bool *done)
> alan: are we using 'done' in this function?
Yes. |sysctrl_process_frame()| sets |*done| on the last frame 
(|curr_frame == total_frames|), which |sysctrl_receive_frames()| uses to 
terminate polling for multi-frame responses.

Thanks,
Anoop
>>   {
>>   	u32 curr_frame, total_frames, ctrl_reg;
>>   	struct xe_device *xe = sc_to_xe(sc);
>> +	char ctrl_desc[48];
>>   	int ret;
>>   
>> -	ret = sysctrl_wait_bit_set(sc, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, timeout_ms);
>> +	ret = sysctrl_wait_bit_set(sc, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, timeout_ms, &ctrl_reg);
>>   	if (ret) {
>> -		xe_log_err(xe, SYSCTRL, ret, "Response frame timeout\n");
>> +		sysctrl_mb_ctrl_desc(ctrl_reg, ctrl_desc, sizeof(ctrl_desc));
>> +		xe_log_err(xe, SYSCTRL, ret,
>> +			   "Response frame timeout %#x.%#x %s\n",
>> +			   (u32)XE_SYSCTRL_HDR_GROUP_ID(req), (u32)XE_SYSCTRL_HDR_COMMAND(req),
>> +			   ctrl_desc);
>>   		return ret;
>>   	}
>>   
> alan: snip
--------------PrCVbtXE10ekAk0zaXKf4EQA
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 08-10-2026 23:10, Teres Alexis, Alan
      Previn wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:21d4bf46db2bbd21562a695037733259d4ed4383.camel@intel.com">
      <pre wrap="" class="moz-quote-pre">On Thu, 2026-10-08 at 10:07 -0700, Anoop, Vijay wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">From: Anoop Vijay <a class="moz-txt-link-rfc2396E" href="mailto:anoop.c.vijay@intel.com">&lt;anoop.c.vijay@intel.com&gt;</a>

Include decoded mailbox control register information in mailbox
busy, timeout and firmware error paths to provide additional
context for failure debugging




</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">alan: snip
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+static void sysctrl_mb_ctrl_desc(u32 ctrl_reg, char *buf, size_t size)
+{
+	scnprintf(buf, size,
+		  &quot;frame=%u/%u busy=%d resp=%d ctrl=%#010x&quot;,
+		  (u32)REG_FIELD_GET(SYSCTRL_FRAME_CURRENT_MASK, ctrl_reg),
+		  (u32)REG_FIELD_GET(SYSCTRL_FRAME_TOTAL_MASK, ctrl_reg),
+		  !!(ctrl_reg &amp; SYSCTRL_MB_CTRL_RUN_BUSY),
+		  !!(ctrl_reg &amp; SYSCTRL_MB_CTRL_RUN_BUSY_OUT),
+		  ctrl_reg);
 }
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">alan: btw, are the meanings of the ctr_reg values based on a predefined hw-protocol spec?
if so, could we include a helper for hex-&gt;string conversion? (ofc need to also check for
size of the char_desc - which isnt in this function (dont want an overflow if future
develoeprs decided to add more content). Im not too familiar with the mailbox register
spec but from code i thought the same ctrl register bitmasks mean different things
depending on read vs write - so might also need to have two helpers or extra param?
I understand this provides little benefit for a developer who knows the code well,
but provides a lot of efficiency when someone else is debugging the code.</pre>
    </blockquote>
    Control register fields are defined by mailbox protocol and have the
    same meaning in both Tx and Rx paths, so I don't think separate
    helpers are needed.<br>
    The sysctrl_mb_ctrl_desc() helper intentionally reports both
    RUN_BUSY and RUN_BUSY_OUT to show full mailbox handshake state at
    the failure point.<br>
    As for buffer safety, the helper takes destination buffer size and
    uses scnprintf(), which bounds the output to the supplied size, so
    there is no overflow risk.
    <blockquote type="cite" cite="mid:21d4bf46db2bbd21562a695037733259d4ed4383.camel@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
    <blockquote type="cite" cite="mid:21d4bf46db2bbd21562a695037733259d4ed4383.camel@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 
 static void sysctrl_write_frame(struct xe_sysctrl *sc, const void *frame,
@@ -128,17 +140,24 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
 			       const u8 *mbox_cmd,
 			       size_t cmd_size, unsigned int timeout_ms)
 {
+	const struct xe_sysctrl_mailbox_msg_hdr *hdr =
+		(const struct xe_sysctrl_mailbox_msg_hdr *)mbox_cmd;



</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">alan: snip
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 
-static int sysctrl_process_frame(struct xe_sysctrl *sc, void *out,
-				 size_t frame_size, unsigned int timeout_ms,
+static int sysctrl_process_frame(struct xe_sysctrl *sc,
+				 const struct xe_sysctrl_mailbox_msg_hdr *req,
+				 void *out, size_t frame_size, unsigned int timeout_ms,
 				 bool *done)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">alan: are we using 'done' in this function?</pre>
    </blockquote>
    <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">Yes.
      <code>sysctrl_process_frame()</code> sets <code>*done</code> on
      the last frame (<code>curr_frame == total_frames</code>), which <code>sysctrl_receive_frames()</code>
      uses to terminate polling for multi-frame responses.</div>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px"><br>
    </div>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">Thanks,</div>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">Anoop</div>
    <blockquote type="cite" cite="mid:21d4bf46db2bbd21562a695037733259d4ed4383.camel@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> {
 	u32 curr_frame, total_frames, ctrl_reg;
 	struct xe_device *xe = sc_to_xe(sc);
+	char ctrl_desc[48];
 	int ret;
 
-	ret = sysctrl_wait_bit_set(sc, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, timeout_ms);
+	ret = sysctrl_wait_bit_set(sc, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, timeout_ms, &amp;ctrl_reg);
 	if (ret) {
-		xe_log_err(xe, SYSCTRL, ret, &quot;Response frame timeout\n&quot;);
+		sysctrl_mb_ctrl_desc(ctrl_reg, ctrl_desc, sizeof(ctrl_desc));
+		xe_log_err(xe, SYSCTRL, ret,
+			   &quot;Response frame timeout %#x.%#x %s\n&quot;,
+			   (u32)XE_SYSCTRL_HDR_GROUP_ID(req), (u32)XE_SYSCTRL_HDR_COMMAND(req),
+			   ctrl_desc);
 		return ret;
 	}
 
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">alan: snip
</pre>
    </blockquote>
  </body>
</html>

--------------PrCVbtXE10ekAk0zaXKf4EQA--
