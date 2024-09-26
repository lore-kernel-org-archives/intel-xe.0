Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713C0CDE038
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 21:33:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 380E410E1AA;
	Thu, 26 Sep 2024 21:33:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W/hRVEkZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5392410E1AA
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Sep 2024 21:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727386392; x=1758922392;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=puXDUZ3zGVNPE2uCb0TfW0xRyGLmSC2Bcj3oPp1QIq8=;
 b=W/hRVEkZVADMTqYicSjW4GxZwwL/nr7fNLhOwu9sGoZg2S2ZmNckhXtD
 dUU4ESQWsGj9Q4mPA3EG2V4Gy2BOF0939pX0AEuhASq/CnTKA/DIpJTSp
 WYZjNGnPBWwVyZdzOvJoHFFqV0zcMQpQ9tHV1UUIQszMe8zmiwzeCaOCg
 uaHTXQUEOsxbgv7PNzg7R64pnOZuE0mX6PoO76HlfmP6fWg2pAT+4yTrC
 zs4XV4S2l1qPbrGWQL+zR+jm5MWLn7LRNk9s8zA+ZeT0CxzsiYitcgnTA
 swhEun2RDikLGhmSAwHo9a1CYBdGiOxflmlZED6+TJd+SSG0LH7/pcOTW g==;
X-CSE-ConnectionGUID: CayhMecdTwqV/XfiTAltog==
X-CSE-MsgGUID: ur3bfO8BSYm31JYCDBlJgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="51931109"
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="51931109"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 14:33:11 -0700
X-CSE-ConnectionGUID: 1UgP2Y8AS+eEr0GUI+rArQ==
X-CSE-MsgGUID: cs4jTzELR+Sdbw60i4m7Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="72608819"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2024 14:33:00 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 14:33:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 14:33:00 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 26 Sep 2024 14:33:00 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 26 Sep 2024 14:32:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dYuwkLbjhiQvRgdxhHUIfB9tDabyXPBialBNVoODBAHX6Mkt+oQ0zZr/c/ubSBh/4TJhXsIE74ZgSbur4QL2BXpatyiJVv0onyJbc4mnKK0M+NbwnJbWyHg6ypFvRtg/FwEKtMcEB8I5J+Lm4D1scUHo15m1ylhA93UCdehY4bUXlmQecz2UIIgBL4het+a1gtEQ8fBrXWR3hCqvWoSqvCQQVe3nc4aOwQcWLod7IssKICo3vz48Mz9ND1dPCb5xmqtHBMP9QxoaLlnvQeVCZNaN526mJ/picywaVNqRfz+kanRZmP2kWSQ5s8BBmRahzhwIe11ZrtRUbXwEs24dWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dk/uiFT95OVEZSRs2sarcCYogsAS998HHN3BWf4RXe8=;
 b=mWdurExJb+biA9d6yZ9vIDSwZ2hrn2SgILLkbp9A8gRq5jiswZ6SAZTcKwr78rKguglAu4qfhT0w7EbXHpySxNcm/JdtU87x6vrVNOPPfRgmBjPZTev0MnnQxiD8RGpjudX0DIQNKaWX37YF6nfm46gS6Ih66cs4PO6Jle/J/Cvi+jBSynQKFptPdtlS7lg97yxzzeywagq3RRCv1ZwTHiep5woiql4vt5n2w0R/zjrJzENPpGJLoQJZp+M+nEukqLJf6dBxByRcOuLRn9VoUZS3xT+D10XR2ioVMXXv3QmPZdz0vEtqFbHUdiJpq8uPLIdu1WRyeN3B0rA2uHq3hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by CY8PR11MB6987.namprd11.prod.outlook.com (2603:10b6:930:55::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Thu, 26 Sep
 2024 21:32:49 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%7]) with mapi id 15.20.7982.022; Thu, 26 Sep 2024
 21:32:49 +0000
Message-ID: <19f4d72f-9e69-4c19-b264-e7207537f3a2@intel.com>
Date: Thu, 26 Sep 2024 23:32:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] drm/xe/vf: Start post-migration fixups with
 provisinoning query
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
References: <20240924202553.1541574-1-tomasz.lis@intel.com>
 <20240924202553.1541574-4-tomasz.lis@intel.com>
 <a41bb1ba-0f14-4616-967d-9ad8ef014b63@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <a41bb1ba-0f14-4616-967d-9ad8ef014b63@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::29) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|CY8PR11MB6987:EE_
X-MS-Office365-Filtering-Correlation-Id: ca87ec5e-11a0-491b-288c-08dcde72c4aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NDlLMnVFN00rUEVWcWwvU0lpelh0YXltd0U5Q0RXMlV0V2k3aVhQb25rdmVu?=
 =?utf-8?B?cXlpZHpwaWQyMU12bkUxQmtnRkh2WktkK0FvcmZNSU9BZEVGZjVKa3Q3N1Q1?=
 =?utf-8?B?czdHcWcyUjdUSHoyZDB0YUt1YlRGempqV0M1M1BNbWVUcHg3d3hDNjRONklZ?=
 =?utf-8?B?YjgwbXB1NWN0ZHI4UmZZODRtbGp2QmpvZjJEbm9pM05yZ1dvOGh3bmhhMFQ3?=
 =?utf-8?B?UUJQdlhOM05nMjJQOHlGZ2ZuSVlmVG1acUlONFJlaFl0Vzd2VVZXNEUyUHAy?=
 =?utf-8?B?aXBZdTduMlJ1UmFNYjZJZDdCbEc4bysrTlJkdTljWTkxbUxUaklvVitESVA2?=
 =?utf-8?B?VnV5MDFFQ2hiYTJlczZjV0VjeEFiQWlDWHNOMzBxbjhZLzRtWkN2ZlpTSzhr?=
 =?utf-8?B?WXY4REFWRWdNcjRNcTFJaU9GWnV6Q3dEWUpOajAxZkFOY0ViQmVTVDRpTUxu?=
 =?utf-8?B?YXQ3MVV0MGhnSndXcTE3VU5rRVBtRksvN1F3Wml6ZEYyYnU0bFdLZmkxcnBC?=
 =?utf-8?B?TDJVY2RNc2s3aENReWhrN3BuS0VFT1M2MHIyZnN1a1lkMDRPT3BRSnpYS0V3?=
 =?utf-8?B?TE14L0JicFZyL09VZ0tRWGloblpMYWIyM2orcERWNmZPMjJURlQxbENVK0hR?=
 =?utf-8?B?WitLY1dVblkrUGQxNm5MNDFKQWVVQTdnSFhrQmhlM2o3cXJyZ2U2enV2SHFE?=
 =?utf-8?B?QlZLbVJqZDM5cThMQXhTZ0FpL1dCbElrWDh2bEx1ZnJGd05WVFJoOTY3YkNz?=
 =?utf-8?B?U0VEQnRmTFltZzliN2J5bnZrNGpMdTlRYlBVbThBQlIyaUk2KzIxZFZIa3VL?=
 =?utf-8?B?MVBJTW8vNlcyTTQzUEpaS1E3b1FobTF2bm9yaGFTMTFwM013SzRiRzdHalJi?=
 =?utf-8?B?VTVqMHoxVTFBK3FRcnVPUXZ3RmllRnVwWVJZVDhobDdTZi9aVWZvUmk0bWFX?=
 =?utf-8?B?dlJhRGRNd1dwcnBhTjFrWXdzblJJWG1xMUMwOVFmYWEvSXdUd1MyVm5UU1hk?=
 =?utf-8?B?d2dnditpa2s2Y2FOMjFOeEpkUUlJZlBHMDNqN0Rmcm84RmYwem85eWdwNGJR?=
 =?utf-8?B?Mlhsd0krUkNlaERGandMSHFwTUlsVXBUUE9lODd1czFiSHV4QlBBcXd6em4x?=
 =?utf-8?B?dFluWlFTTDRXRVJBUFpKNlp0QTZnWGFMaytueHY1VXQxR1drOHU5NWdhcjc3?=
 =?utf-8?B?MnFHdk02RkJrK2ZQTGlGTk00LzNKMmlQVW5LL0twT1BjN051VzU4TVpBZ2Fi?=
 =?utf-8?B?M1dCOU5CWTJsM2xyMVhvNllyMEhuY21pamF2ak8vS2FKNE1GNVJXS3RVMy9t?=
 =?utf-8?B?VUdTL2tPOEl0VldUSXd3bTFNYjRmSGxTM2E5eXVrSzlaL3BSekJoamFMbDZQ?=
 =?utf-8?B?WFRqbnFOdjJRVGU0YlRSWVpNdDI0STBpUm1LMjZPOFBzZEFUc3dSQmVCQVpO?=
 =?utf-8?B?eGdoQUt1bDB5YUs1ckJQK0wwTHhSYXU5SEF4OXNEeVUvZjBiWDhjR3RpYzYr?=
 =?utf-8?B?Y3pTbDZHK0w5bitvUmNHSWdMQlAyRkZxaS95ZE95VC9oZXEzcWRHdFAwQlZl?=
 =?utf-8?B?NjlESm1ON1FlSXZSL2svQ2NtNHhtZ1d1bXBQb2lLcGZDNndCV2dWWEZ5Ump2?=
 =?utf-8?B?dTRZQ1Fib1pQRnhtMkdUWjNjZUtHU20xNUtCQnZBajV1NTRMSDJONVMzS21S?=
 =?utf-8?B?dXQvVWhldkNMN1lMN2k2ZkdxQWJtMVE4d0RQakVLUlFmWTJZWjdjT213PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmErL0hUeDJWc1hOVkZEWU8zQW5QczhuN2xBN1RjYWIwMmRMREpuUzI0cmZn?=
 =?utf-8?B?aGhnb08rWjFFYlljOXpXVjBwUHFFU2pTc0NJVnVEQVF6TFhtaEw4bEtkZEgy?=
 =?utf-8?B?bS81RG9XaXpPQ0FTZXZrTHNCZWJscm5abUxqVlBXY1ZvTFVmYmJCN3kxTlQ2?=
 =?utf-8?B?SDVOS0hGdXBDL2tWd2djbjRHWjJ1REp0VjZ3bExsWWdPWWdkUUUxRFkwYmto?=
 =?utf-8?B?cHIyR05Mang5S0l2RnhLcE5UdjNWcDdLTUxrQUFEa3lHSGRxa1JTZW04aE1N?=
 =?utf-8?B?NjJDT3RURHhzOURyK243eHFBYXZFVHhUdzlaU3JqZDJiWk9Yb0FRcml4b0po?=
 =?utf-8?B?U3p3UCtMSGp2MG1qcklHeWFpTDM3WXU4WGRxR2pYbDBOb3AvcE5SYmIxNlZm?=
 =?utf-8?B?ek1IMUx3OFNVR1EyWVhnRmVWTWtvbFBYaFZJRS8xYjZlSytpdmJsZHF2T3RZ?=
 =?utf-8?B?Y1Y3WDNkS25qb3p5NWNoZER6cXVZMmNPcDh6bk95RWc1NmM4Tk83djZsbTlW?=
 =?utf-8?B?NmtBMHJjdXBQRVRQSldXbUlGVkptQjUwS1NBb0d2Y0VmT0J4eWZEdXJsN01s?=
 =?utf-8?B?bHRLNjV2M2JoOWxhYWp3VTJyWmcvNVJHWlowWTI3SlRBcXpUSXV1Nk9CN3p6?=
 =?utf-8?B?Nm1PcjcxTU5TQk5VRnJaRHNoMXRMZU05a3QvajNRVzBiaW8xNDMzRndoZytJ?=
 =?utf-8?B?R0RqQnQ2dUlmUlF2aFdybjdMYTMzZlJvUy9mbVBxLzNsZ1p3UTBFd0tJNVZp?=
 =?utf-8?B?V1JIdjNMSm9XMDduanRjbTQ1K3F2Z09JeS9aTWpIbFRWNGZhN3l4RDdIaVc4?=
 =?utf-8?B?UnNuQnF3RlpVbjEwaGsxaUZPY2hQUjF0VnovN25pVEp2WFEzSzZmVVdMNUNN?=
 =?utf-8?B?bXZWZDVmaUVIZ2JiQkoweFpWUGk5UnlqaDEwL0gzK0Z2WjNRUy9MUzZZMUJp?=
 =?utf-8?B?cklJV2RRc2VvTTdPN2NNNEQ4REh2WUg5aU9BSHFNdGduc3BSYnY3OTltdWJh?=
 =?utf-8?B?MWtoMVkzbFR3aGVsTWFGbm5iZXZzZDJBTjV0Q3FXUFNUcnNoVFZFcTVoOEh6?=
 =?utf-8?B?UnFLbkpWdU94UXppV1RqNkxzYnNJMzEzK1ZwK0VJOFRJWFZLY0NiVEtlYjVj?=
 =?utf-8?B?RlZOY0VneEFlZkxTeUw3WUZpYW51VEJqeDNKQWUxYTFieVNxV2YzYUVXOFR4?=
 =?utf-8?B?VmlyQ2VBeVVFQ2RRSW5XdWJXVVBvME9MclJSYzRueGFKOUkxdGQxY1lxaVg5?=
 =?utf-8?B?WURDUlg4ODc4aVJpWGhNS2Vvd0pDTzQ4M2RraTA5SlQxbXhiOGdGNFB0NGNI?=
 =?utf-8?B?cW5Dbkxhdmg5MHFiYXdkT0kyWE9DaUdRUjR1TEtMa2hVRzJtRXJVVDRxOERN?=
 =?utf-8?B?MVo1Q1JUSUJuS21vVjh4UFdIbWZGVFA3Unp6dFJyZzI3eG9oRklRUU5YbFJY?=
 =?utf-8?B?dEE4M25YaWk0NFpoVXNwZXlZQjI1eHFHOVFac0ROTENMQ1R4V2hoWkFsQ2JP?=
 =?utf-8?B?cHZqZDVKRk5MbEZjSWppYVVNQ3NOSDVZNGloQ3Q5NGRiY2VWV2xXeHFEdlF5?=
 =?utf-8?B?NWNQcUplK1Z3Zk1CeTdEV3BwQUg1S3FidlNycWhaWHJsMENnUHB3bnNsYlJx?=
 =?utf-8?B?dktqOHF0RnlPNmpNUFBHU0tuZWQ4SVJoT0k5R1lWejBpNXk5VUwrbU50Zjh2?=
 =?utf-8?B?K0h1cXJUYnNYU21LYngzMlhFMHE5aktrSituMkM2bzRabGYwT2JzUmhwRVVP?=
 =?utf-8?B?VWNqU2o5VDcva2pWUkFOaVkvVDFBSTZ6d3ovNmpJWW1lQWtTZDF6MFVRRldL?=
 =?utf-8?B?N0pLQ2dTc3RCWk5DeXFjQURqRjVwQ0xYK0MxRXBBZUZmVUg5M2dTbjFWN3Ux?=
 =?utf-8?B?Qjh0Y2xjWjVaVkp4T3JOMTZZZyt4eThMZ2Y2UnhURFVEeS9HbXFWVG5GdG1t?=
 =?utf-8?B?ZTlkZU9EN1NEVEZoRHQyYXhwU05xMXp6SHdyWXI2bkxiMVZ4M3Rjc0hVRW1Z?=
 =?utf-8?B?K1JSU1B1b0FVS1doQzF2MGZWTldhN0kwajFpNW9JYi9IOGIwQjBSbjB5d3ZG?=
 =?utf-8?B?VGdaWjNTZU5PWHlKamV4emdZNzV3UllxcDNmZFFmUExTL2pCTndManFvWWlO?=
 =?utf-8?Q?XfmUpnKO/lPifn7GDAmDAcju4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca87ec5e-11a0-491b-288c-08dcde72c4aa
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 21:32:48.9261 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gOQ1OEFonklVUuMQHwQxCP0KKmVknNWR2whyToEX+u1EqfBeNqQpcJxTyVm6NWBcQSB3H2MBGMlwFJV7KxVTSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6987
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


On 26.09.2024 16:27, Michal Wajdeczko wrote:
>
> On 24.09.2024 22:25, Tomasz Lis wrote:
>> During post-migration recovery, only MMIO communication to GuC is
>> allowed. The VF KMD needs to use that channel to ask for the new
>> provisioning, which includes a new GGTT range assigned to the VF.
> you likely need first to remove below assert from the
> xe_guc_mmio_send_recv()
>
> 	xe_assert(xe, !xe_guc_ct_enabled(&guc->ct));
>
>> v2: query config only instead of handshake; no need to get pm ref as
>>   it's now kept through whole recovery (mwajdeczko)
>>
>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_sriov_vf.c | 39 ++++++++++++++++++++++++++++++++
>>   1 file changed, 39 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> index d0c5a0b7e170..fe5eefa736c8 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -24,6 +24,34 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
>>   	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);
>>   }
>>   
>> +/**
>> + * vf_post_migration_requery_guc - Re-initialize GuC communication.
>> + * @xe: the &xe_device struct instance
>> + *
>> + * After migration, we need to reestablish communication with GuC and
>> + * re-query all VF configuration to make sure they match previous
>> + * provisioning. Note that most of VF provisioning shall be the same,
>> + * except GGTT range, since GGTT is not virtualized per-VF.
>> + *
>> + * Returns: 0 if the operation completed successfully, or a negative error
>> + * code otherwise.
>> + */
>> +static int vf_post_migration_requery_guc(struct xe_device *xe)
>> +{
>> +	struct xe_gt *gt;
>> +	unsigned int id;
>> +	int err, ret;
> 	int err, ret = 0;
>
>> +
>> +	err = 0;
>> +	for_each_gt(gt, xe, id) {
>> +		ret = xe_gt_sriov_vf_query_config(gt);
> 		err = xe_gt_sriov_vf_query_config(gt);
>
>> +		if (!err)
>> +			err = ret;
> 		ret = ret ?: err;
>
>> +	}
>> +
>> +	return err;
> 	return ret;

ok, will do. But that doesn't seem any better than it was before.

Well, maybe except the ternary operator, that does look better (though 
it's not a part of c89).

>
>> +}
>> +
>>   /*
>>    * vf_post_migration_notify_resfix_done - Notify all GuCs about resource fixups apply finished.
>>    * @xe: the &xe_device struct instance
>> @@ -44,12 +72,23 @@ static void vf_post_migration_notify_resfix_done(struct xe_device *xe)
>>   
>>   static void vf_post_migration_recovery(struct xe_device *xe)
>>   {
>> +	int err;
>> +
>>   	drm_dbg(&xe->drm, "migration recovery in progress\n");
>>   	xe_pm_runtime_get(xe);
>> +	err = vf_post_migration_requery_guc(xe);
>> +	if (unlikely(err))
>> +		goto fail;
> shouldn't all this be below "add the recovery steps" line ?

If requery failed, why would we continue with fixups? We don't know the 
new GGTT range in that case.

-Tomasz

>
>> +
>>   	/* FIXME: add the recovery steps */
>>   	vf_post_migration_notify_resfix_done(xe);
>>   	xe_pm_runtime_put(xe);
>>   	drm_notice(&xe->drm, "migration recovery ended\n");
>> +	return;
>> +fail:
>> +	xe_pm_runtime_put(xe);
>> +	drm_err(&xe->drm, "migration recovery failed (%pe)\n", ERR_PTR(err));
>> +	xe_device_declare_wedged(xe);
>>   }
>>   
>>   static void migration_worker_func(struct work_struct *w)
