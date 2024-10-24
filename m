Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA14DD0BB7B
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 09:15:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6064D10E0FA;
	Thu, 24 Oct 2024 09:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X6ZT/HKE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C6710E0FA
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Oct 2024 09:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729761336; x=1761297336;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FzU3jW3wDwwvZgvrfoc/QGMwPz3A0Gbfzbl8/yGie1s=;
 b=X6ZT/HKE3lERpNItDtAIDQDje/mPcncoB5BRyve4uHL+vQMUOLrWebbk
 SRKVyxeebEewJCGRBC+EyG5rQV2o5+Zv8K9MnrgVCqAJlWVWsj20uL7te
 DAcuBRtaHbXMFOCNrxyHO/JyWsvo/hQOxiHD93p1VkUJ0xx6fhw9iIKTN
 FiHFQW/JTZYj+gYc2wrM+Bn9ykpmw5pdfY5HXUs0FT42k8igasP/R2e5Y
 ktRHxSMOYG8Xpu+pd9e7nosjbSu2bYvUFgp8QYkRnjnAGYKTDvyMuAHve
 4pOz4nEVKWiKrs6uwJ2ytyUkCOIZZ20hCVB+CsKRq/CNkK02KifmBJG0X A==;
X-CSE-ConnectionGUID: 1X10wsHWS9Gm9YWeb36v0Q==
X-CSE-MsgGUID: qoaQ6+1BQLWzv5YuyCLHWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="32241292"
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="32241292"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 02:15:35 -0700
X-CSE-ConnectionGUID: x71l+lzHR36QuQXQZV5csw==
X-CSE-MsgGUID: G4amLzxqSfClSePi+imsRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="81351097"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Oct 2024 02:15:36 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 24 Oct 2024 02:15:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 24 Oct 2024 02:15:35 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 24 Oct 2024 02:15:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WzxV6Tt4RrqnU4FHhjWdsriS4odZmeNKz9VvFV5Dmga7yVjSP711FNh9apG6ShGmu8ug6z74s2LLkMRhhbWRU14g0FgckJD0in8gjv+8z7BDB4lmPoFRaLjQAlwSHOz0ShHKbffhk8ZamWM3uut3qs4+EyTmQF30fFPqJj6P62wzKUyZW8rKEE+AzJyAwoo2t4AzE4tA5QytHAO/Bez9dA1emhn/Kx7+cFIVLdC1BBrIBP6ARfrPcwb0jUy7wgP7zO+yYXgaangc5mJbbHlNEqAos14WkkcfuG+vnXSJm4yTO50nS9EQulizV9XweKBA40sgtYzyONR6wfDZ/s8cYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FzU3jW3wDwwvZgvrfoc/QGMwPz3A0Gbfzbl8/yGie1s=;
 b=iWVWtrAOJ/EPSCkxqnOnXKqW3vb8DIkhQdCqhqqRgLVR9N9nQi34zKcTmWqAe7NvFC8PKi78O1jtjCHw7JGPdAawNNw+c8zUCtinKXz3OfznRiLzh5+CAiN+XXegDmpS3tQhsM+7OGXEOUaxsIFt3GVnpQR/bH+UEEMNEAEeF2oXif4a/6JDxA58lE5Lx03oI4zD6WWHYc4C2/LvyFV/NUNnMWBCOYITpmSlAF/u0v/rd/FTB/ZiZK+/ejBKZbKUaY7l+Neq4T2kxbWm6/wngTv9Jkh9RtTYbWX1+/xeEpkiN+LMQvd4pjBmZBTCDgZk9IALoPqVpJLwT6Z+wmUpFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 BN9PR11MB5228.namprd11.prod.outlook.com (2603:10b6:408:135::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.18; Thu, 24 Oct 2024 09:15:33 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 09:15:33 +0000
Message-ID: <226d2a53-b234-4904-9bcf-e19d6841392b@intel.com>
Date: Thu, 24 Oct 2024 11:15:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc/tlb: Flush g2h worker in case of tlb timeout
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Badal Nilawar <badal.nilawar@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Matthew Auld <matthew.auld@intel.com>, "John
 Harrison" <John.C.Harrison@Intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
References: <20241023151343.3463640-1-nirmoy.das@intel.com>
 <6e196751-c1bb-429c-a221-398d4dfbecf6@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <6e196751-c1bb-429c-a221-398d4dfbecf6@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0029.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::19) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|BN9PR11MB5228:EE_
X-MS-Office365-Filtering-Correlation-Id: c7352675-84ec-437c-d15b-08dcf40c69a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHA2YXhUZk9NaXlRZjAra3VzcXhkbUxxSnhrYVFDWG83dEhJdWhKZktidjJa?=
 =?utf-8?B?c1FoOS9pajlEL1M4OXFjRjNqMFpJcmtiUmdvRXAxamw5VnJ0NHJUeFNQUUs3?=
 =?utf-8?B?aVdNWWoraXpEQVNhZHdka3dVbjRiYXhJZ0tpUVRlbjlkYWdHOHUxNkdVVmlE?=
 =?utf-8?B?blRXQ2FMTnp2RjcyQTRXbDRML3JVUFoxRWZhZUpEdVBFNnhqV3pwZXF0YllK?=
 =?utf-8?B?M2FhUFhtRlE5VkZLM25DL0VrZUJZRkp6WlE0SkNYcmQvM0R4Y3R4QW1KRnJk?=
 =?utf-8?B?K2NvcTZlKzFFUUJWak02WjFNWGFFWlNSQmEzc0ozdExmVXFKWkplTnVxbWpK?=
 =?utf-8?B?OTdJZ3JYYko0UHlvdVd2MktmQnFLV1A5Q3A0L3hRWTVQUXIyei9kU0NmNzU2?=
 =?utf-8?B?WnJITXVTSCtRakhITDRkZzk4VjdiS3YzOWd6cXdiQ0NJN1FJNHF5WFBRa09X?=
 =?utf-8?B?dDBxTWJuS1dsbDd1ek9kK2pXNWFweHVWSk9UNkswVk9PNG5mM0ZpK29hY2xo?=
 =?utf-8?B?NXVLeXpoVGJoNVFJRHo1OUp2M2wzWFdJNmNCOWlCUjlsSVQrWTZDa1VTSXF5?=
 =?utf-8?B?TmpCN1lUY2RKZzZjN1Awb1dHbXNpbzl1aUw0WFVkYXJZYnU0UFZheFg0NzVO?=
 =?utf-8?B?cmhVREJSZ1NrMy9INmRlT3FxYjhQUDBVdG52VU11UERLbHBoYW56RlBvREpa?=
 =?utf-8?B?clBEMUpIamRsSUpKd3YwNXJrdEFHR2E4T1Q1bXY3c0ZUbXpJaHRyV2JadTZx?=
 =?utf-8?B?T2ZjOE9Tb24wRkIzNW9vSm1NdldqUHVON3hzSXc1MEUwUUU3YXZBSHFXK1FJ?=
 =?utf-8?B?YlpNRzVJUmJpVUtldDVDTGhzNDhZU1o0WGpJeTBLRDlIaXY5MkpReU5DYmtM?=
 =?utf-8?B?c1hmOU42VHJNZkszMzV4U1Bwbkwra0RqSXRNcTJRYzExaFJPZ1AzRGM1ZTNM?=
 =?utf-8?B?WTdZc2lwVnkzazhRS0NVazFNZ2hqL1NPT0NydkROdE44bHc0ZFpzOHkwUWx3?=
 =?utf-8?B?TVBNU1Y1aEhiNVJMbFRIQzZZSUw3Nk5jRkdKNHZFK0lpZFhyYThhVXo4U01l?=
 =?utf-8?B?OVdOVXBBMVdiNEJtNDNSOWpVSEYzQ3IwZDlkZCtmSmxiSVk5UC9DZEFaL0t1?=
 =?utf-8?B?bVR5RzgyTWNVWVM5OUhKTXdDTGdmcDJpa3Z6TmV5WW8wQUhENmtHTGlxZDZn?=
 =?utf-8?B?TzV5aW1TUnAzd0lFb0MxSmZKWmNPeGtMRkFLL0VsOE9FdkNFY3M2TUVCVEYr?=
 =?utf-8?B?azhCbVNqZjlkeWI4WXlaMHYvR2RiYzR3RW0wRC93MGhmclVUOG5CQ2lYbjZ4?=
 =?utf-8?B?RXdIR1RXU0lRTXUwaGNjNkdpVk5VSnB3V0pRNTVSWjNBc1RabUpwVmhNYWp5?=
 =?utf-8?B?NW53ZkpwcXJmRWpqSTIrRWI2VlRLTlpWb2Y0eEhoQXBwSGFIc0ZDVHFYb21x?=
 =?utf-8?B?MTZ5REhKdzVaM1dnWUlJc3Nlc2N0dzBjSW1kR1BpOGFSRm9Xb08vSHpxMVJK?=
 =?utf-8?B?clVxRWtlcVhwRFRLWXRyOEF4UHN3TnEvRWUvS25BNExmUEFUVVlZT0JxZDdy?=
 =?utf-8?B?SE1SNlVaUmNoSkZNWURIQlRURkVxNjlIY091dmNJd3JhamdFaUJ4dm0yT0x1?=
 =?utf-8?B?NExQalhIcXZrczZLMDA4QjdNQTJ3dU9sRDdPTzZ5ckljTExNZmdBYzBpUWtB?=
 =?utf-8?B?eTl2ajJRbXJFUkpNY0JRWlZNYXh4Q0pSMlloZXk5disxVm1JVUVoNjJRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THNMR00zVERUSW5oSkIrdWpzb011UEZ1cStDeFQ4THY2eXhBK3k3dzd4MzFC?=
 =?utf-8?B?cW5Sc2JReC9pN2s0aFFLbENjNDZQVWRhbGt2K0M4SXBuNnZZZ09GQ1NaVkZF?=
 =?utf-8?B?WTk5UFpkc3JLWUpSWXpLeXMvNDc5dmtwQ0pOekRnNWoxTzI5aTg3OXlhRFNY?=
 =?utf-8?B?TGw1Q1RBMVhsQjFLbmlLZzJvUTdEL2xiZTN3Tk5UUXA1SGI1R0VCeE9JQ0tL?=
 =?utf-8?B?U1dwdkVTZGRaby9aSnZWalVzN0ZiMkFodGJUZlpETzl0Y2djaFdJNFhNRTRh?=
 =?utf-8?B?eWcveDNGTFVQSEEwUVpSMWh1KzJ4alIwWGZkcUJNdHV4WHFremNvVjNyemZi?=
 =?utf-8?B?UEpxRFFHcDlyTldYUjZRVkxNS1Z6NkZjZ1dRZk1TMHR1UUNrRjdTaEpzRzFt?=
 =?utf-8?B?RzhLaTR3Y1cxWDVrVmNjdUdxWll2TURxa1Y4NlFkRjNvTmtZTm5PQ0oyMzE2?=
 =?utf-8?B?b0cvRnZMZFdUVDdJRmFhUFY5SGNFQUMvS3pLZWxhQVYrbzlzZUxpUVFOcWJ2?=
 =?utf-8?B?ZTF2TDYydThuVW9YVnFLTEYwYWVoSFZLRkthQ0ZlQVFCTGtEOGJSSmkzWkEw?=
 =?utf-8?B?bytqc1hZUlQzSnZ5VlJxVmVZMTBUYnRZVnVHUzFYMERja1VZVHNrTjhVTDVk?=
 =?utf-8?B?ZDh4Tm0wMmk2R0xWN1VBMVc2MWtOS2hKQnd2aHEydndvdWswem9PMzNzVHRy?=
 =?utf-8?B?YnRUY1p1OHA5QVp4b3k2cHYvOFRZQ1NuRUJQbktSbEp3Sm5xRFlkbXBBbEpZ?=
 =?utf-8?B?VURmNkl3WmpHeU12RFVPSk5IaW9hRVdjUkRXQlJYUlJHbDhqZWFWMC9JSW4v?=
 =?utf-8?B?a3h2eXltQ2h4Nm55RHVvM3Q4dG1Bam5MaTZCeVhHdkhTMDdFU2dJSldqaVU2?=
 =?utf-8?B?M28xeFhTQWZiMDZObGMrcjYvY3MweTR2WUNCM1FnWmRhd0I4L3ltNkhHYkpw?=
 =?utf-8?B?UDBDWnVxcGxqRFdsVVA1SzRNK0lWK25iMkVTajRUZVNJZ2JzQ1dneUx2d1RT?=
 =?utf-8?B?b3hGTFFHRGJhRFRIZmZqTWsrREtaNHRHcWtZSWlqMDNFbWt3YWR4dWtQRWVh?=
 =?utf-8?B?UUltQTZiTkp1SjFGZ2JibWFMall5V2VYTXJqWlJQS01LdFM5eWpoWW9qSjJN?=
 =?utf-8?B?Uk56Y3V3U2grTlFYQ3dPSlBTZitKK0JtZTRwSGIrNlVjUnNJUldaYlhIWFNw?=
 =?utf-8?B?SGlLVUJNUXRueUlEclFIbE1DQ3pZWkl5TnlnNWNlL3hvam1PeEtUeG9SMEFI?=
 =?utf-8?B?ZU90OFNmeWJjT0RWUEk2QlU5cXJTQ3p4QnR0cU9JTDJ2YkppTE82dytEVUs0?=
 =?utf-8?B?QWhvaUI1REdmVHNnQXhjWDc5M2loUnFEMUdFeC9oYzc5cVBQSzRMNUhGSWdn?=
 =?utf-8?B?eUt0VEU0eEF5MHdnWXV4VFRZVUowY1BCVS9vVG4vY28zN2NlMysvSSszaVkx?=
 =?utf-8?B?SHNFOEhqL3R4K1ppWG4zZDY0M0tKS2RKZW1rMHR3MGdkYlRLWkdJWHhKd1M3?=
 =?utf-8?B?Ky9MU3BINXB0Nk02bFVzVnVjNndoWTNCMlBVbTA5ZjBIYjFFS0ZMZTd0SkxG?=
 =?utf-8?B?ZDlNSzdnS2t6dWdWY3ZQOVA0cWoydlA1b3JZSlV5ditxbXE1RytWMmFEcitp?=
 =?utf-8?B?dStsOVlDTHFITVd0eVM0MFg2N2FSRk0raDVzVzVoUFgzbDhRQ1JRS1lVdjRF?=
 =?utf-8?B?cmdTNDRiNWhCbXVqa2VuZGlicS9KV0xJNk4rQjI1ZXFLVkxqclFkMmZRdENh?=
 =?utf-8?B?aldKL2xGQ3VReldTUnptNndoSG1jUmRjTXoxZHlCL2ZuTnJsT01NUkhiTEcy?=
 =?utf-8?B?aU5MWHRTd1lYY1NRa2VseURtZHNZTWMzcUtLa01QSmIvSkRVcnUwa1FYL0dV?=
 =?utf-8?B?MXd6amhvR0hYQ3k3NmJMQ2g2a1NwWDNVUXNoMXhjYmVLTUUwcGtpblp1Y05l?=
 =?utf-8?B?RkU5UDN5SGRQaVRQWHdXUngvUktoMzRKTi83NW14RFdOaC84TXIrb0IwOExt?=
 =?utf-8?B?VVRUYjZzRGJ2REptb2h4VHRDdWEyMWs4aUZyYVUyUFh5dEl6cTdDUnU1eE9p?=
 =?utf-8?B?VnpiVnhBU2FUYVNDQXpHVTl4Z1l2bm5IOFE2SWs5SmNpNEVPaCsyaFZtYjBR?=
 =?utf-8?Q?DPOidhHqMD3BymEbGH/kN6Dk2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7352675-84ec-437c-d15b-08dcf40c69a7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 09:15:33.1842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6hC5EaZBxhrzRqOVEY3skkT6Jd5FpSfEwYrLgoa0+opJXoW/M4aq3Mkz5TGI+PKMCG39KFyYTbGbnNWaxs1dMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5228
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


On 10/24/2024 4:02 AM, Ghimiray, Himal Prasad wrote:
>
>
> On 23-10-2024 20:43, Nirmoy Das wrote:
>> Flush the g2h worker explicitly if TLB timeout happens which is
>> observed on LNL and that points recent scheduling issue with E-cores.
>> This is similar to the recent fix:
>> commit e51527233804 ("drm/xe/guc/ct: Flush g2h worker in case of g2h
>> response timeout") and should be removed once there is E core
>> scheduling fix.
>>
>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2687
>
>
> The issue is not only limited to LNL but is also observed on BMG and
> DG2. As far as I know, other host CPUs are not eECORES, so the reason
> for failure on BMG won’t be the same.

BMG and DG2 could be running on Alderlake or later with E cores but I hope we don't have the

same scheduling issue like LNL.


On DG2 and BMG, the timeout happens after GT suspend which shouldn't as we hold the

pm reference so that is a different issue that I have to look into.


> In my opinion, we should limit
> this workaround to LNL and continue debugging BMG to find the root
> cause.
>
> Probably it will be better to add platform check even on e51527233804.

Yes, platform check is a good idea. I will add that.


>
> On BMG and DG2:
> https://patchwork.freedesktop.org/series/140267/ series from Matt might help solve this.


I remember for E core scheduling issue above change didn't help.


Thanks,

Nirmoy

>
> BR
> Himal
>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> index 773de1f08db9..2c327dccbd74 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> @@ -72,6 +72,15 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>>       struct xe_device *xe = gt_to_xe(gt);
>>       struct xe_gt_tlb_invalidation_fence *fence, *next;
>>   +    /*
>> +     * This is analogous to e51527233804 ("drm/xe/guc/ct: Flush g2h worker
>> +     * in case of g2h response timeout")
>> +     *
>> +     * TODO: Drop this change once workqueue scheduling delay issue is
>> +     * fixed on LNL Hybrid CPU.
>> +     */
>> +    flush_work(&gt->uc.guc.ct.g2h_worker);
>> +
>>       spin_lock_irq(&gt->tlb_invalidation.pending_lock);
>>       list_for_each_entry_safe(fence, next,
>>                    &gt->tlb_invalidation.pending_fences, link) {
>
