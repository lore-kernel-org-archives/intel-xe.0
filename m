Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C82AC021A6
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 16:43:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE54A10ED0F;
	Fri, 14 Feb 2025 16:43:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EVuhlUTO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C03310ED0F
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Feb 2025 16:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739551399; x=1771087399;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=O6DFMcsfDAkQL9sCHcd+HDA2CsB4XlN3m2A3qsUNMuo=;
 b=EVuhlUTOU0KsursOfRJ+uSOMdl49XoZR1UMCAf8osqPdtAAONB/rjWug
 rySMA+TeyyJhuhicevoqJB0Z7fOpVGedpQwW4eTXizyAGsqwuO/MKrwwK
 aCohkEqnPdXEpbuewpwuVfgjZI1x4MQfgsZKvP/2rMkm812tYxbpJc7q/
 SmpzEASbbqT9x6ufY6k8hONkBSMe+Nck+3O79/jVM3Xu3heefR5euvroH
 rbwd9rSxNpDqRh3lex8MHNA8LELo8p2e2wgE6YZ+Yus7ZnJefZYxz/w3f
 ZlBUAloA2eRJDTsC3gleQgyeDj+fM0U0hdZqO+iDFUq/bnX5LoRVvhAih g==;
X-CSE-ConnectionGUID: d3IETJasSYSNInQpYV08XA==
X-CSE-MsgGUID: ZiJT6RxARE+EOAGpdstVzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="57712470"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="57712470"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 08:43:18 -0800
X-CSE-ConnectionGUID: JYiSnDvoQx2Fk3RRZgph5g==
X-CSE-MsgGUID: E+IW4c0iQcSnfnMC7qMrDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114408906"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 08:43:18 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 14 Feb 2025 08:43:17 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Feb 2025 08:43:17 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 08:43:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DSulicIMI77vNA1uLck9VCjlWXep5Z4XWi/s3S+TFoJC6IBzdWncbImBVpQuhR6ba8U7YNxLJIkDQ1S9iMuVnKQCehXbtBUmcmXw3d8Ki1lNQK2UwyeDyuLngshhePLIm9LbfK5M01T1Y0fKPMTjHSGi39S/djgVLTbT4T65RRzJxQ7AmUa1hcMq8CZ5SHQ+AENj8T/RZp0rLRAFdlVKVS0uN7RTfUeXvGqBe2otFM6UaXNNNNRgGV15hwc+CgeVbYbzgWaHvId72w0nNghaL3MqhAzfHvucorGs7sfSwixqF7TQpQZbIqrEaVlvB9DhoMzRfYipst9SlqgfoiQ9lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQNG0UVyfUWahQuheD1ZCRy561PXXx/9OyUCgGy7n+U=;
 b=f+KqlPLxWriSaxr5BVzeM9dubMZAa0cfTYkILYniaKKFLwlXNQB7UKaCdPpo066p62lc6c19wlokGfR8J5beNw5RT1WyGafhhHDVHfqUzb/JIK7NFXiGSJZZhEceH/XBm+7PaiWTSDxXfEuJsxBxI4QM6Cx+HTdHt9FUPsAzbqjFkf9YCIRlRNpu41gkYaJN+qyjxsdgiztXWxjhoPG7OADA7jIN8aF6PrXnGp157KpA3VZNIToUXDXA0OE5Gao6N0JulFMFMHYcbHhgLxjj4/X8Dv3M80bNTZTignSh8r2KVxDQ/KYnyHw5LgZ2RWEInRofT4sRtUBOgd6XCl7bIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH0PR11MB5190.namprd11.prod.outlook.com (2603:10b6:510:3c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Fri, 14 Feb
 2025 16:42:34 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.8445.008; Fri, 14 Feb 2025
 16:42:34 +0000
Message-ID: <beeccc27-ba1b-4e25-98f2-66ec97bb3dd1@intel.com>
Date: Fri, 14 Feb 2025 08:42:32 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Stop reading masks from device memory when
 populating the ADS
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250213214053.2191635-1-daniele.ceraolospurio@intel.com>
 <ad9268df-0e8e-4cbb-9a04-6cd4a41030fb@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <ad9268df-0e8e-4cbb-9a04-6cd4a41030fb@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0190.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::15) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH0PR11MB5190:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bf9e827-2d50-45c2-6de5-08dd4d16954c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajZjd1p1dnBMSUtVSXRmTDhzSVoxTE9EN1pPSG9ySWIxME5tWThjWUhOMEhO?=
 =?utf-8?B?WG9lQ1dvakU4SXBpOUhhMzlUcFJuZFpnamlXaUFWSmUyOW53S0pwVGtlejds?=
 =?utf-8?B?VVVJcUsvZVVrUXJHdGdKQ1QyZ3RJVk9xK0paOFVzSlZRV2tSQS9YdVdJeTgy?=
 =?utf-8?B?ZlUwY2FhSGFpYURaTGFmS2ZzZ0hzN0RJN0NwbFhjcVpZWWw4K3hROXVpbVpy?=
 =?utf-8?B?R0l0T2ZtSldCWks3Z1FsSkE3M0hiblVvaG1mWUE4ckhHc1YxbDhYcFR5Wjh4?=
 =?utf-8?B?VnRmaTRraFl3TnlCQUZ6ZlN6NHd2VUpzNGtWN2taWjBKSkUwSWgzYWJ2Z3Fm?=
 =?utf-8?B?c2pUTFdkQUVtemEzVkdvdmhkYWZYQk1PbFhMMEh5K0RkZEt1SldkTTVvL0g3?=
 =?utf-8?B?YXVvemk1OFRIUE5aNk5SakRqQTFIWnYzeC9GdEpuNnozYm8ySmQ5dEh5NFlN?=
 =?utf-8?B?dlpOUzVJdmZlOEVoQS9TRFh5bWxVcndoNkxpUWs0NDlpQXJHZjFaVEdvSjlE?=
 =?utf-8?B?M0hoQVJJU2FhSkpNYjljWTVNc0U2M1M2eWtaa1pJVDNXbFh0amtDRWx4QkZT?=
 =?utf-8?B?bUE2SStZZkh0L3hQelFqeCtWVkdPUXQyTERhcEsxRDBVQURycjBsc2tnN0lY?=
 =?utf-8?B?d2NCckdJZUFLSXhQV1llUnBpUi9HZktPWld5WnlOQ0huUUVDd3E5dTJJeEZT?=
 =?utf-8?B?K1ZKcmY0N0JFdklhdUEvYUpMMkN6czhiM2cwanhFQmUwV04za3VteGZ3b0Js?=
 =?utf-8?B?dWxwUEJlOUhKT1N4MWJmU3E0NkQ3MXRtTjMwdmpsTVhsVnVWT2k1Y3I0Z05F?=
 =?utf-8?B?dlFZR0xQM0puS292eTlFTHpmQkZnVS9SY3VjTmwrZVc2Z2dLUEYraTJ5TGpx?=
 =?utf-8?B?anBhM04reTliQ0VWYURHaEgrZk0wRVRuZ25DdjF0WEUvVjZHTWRzYjdFTFB4?=
 =?utf-8?B?NTRnMWwzbzUrMzBYYUMrWndSZkExVVpEc2s0bzloN3lxcXR5MDBmN0JLK0Nj?=
 =?utf-8?B?cm5zYi9wRTgrcFRjWWVqY2xad1ZnK2tZQWtjTGhIdlpzZytObGk1d2cvSjAy?=
 =?utf-8?B?TS84NUVRRDdXWFRHMy96bnZmTUQ4N1M5MjFLTXBYbDZiVzhlVWx6ajVsYU1v?=
 =?utf-8?B?ZTZFalNwY24rNUYwaTRscHFwaEVnWmU0ZGpaMmJaMzFEcjZzWXlYRExHcStX?=
 =?utf-8?B?MzBNNEhEcHFNZFJ5V1FPVGNGa3YwbnJHeDU2REtDb2Ria0pzU3R3Q1ZKV3lR?=
 =?utf-8?B?Q1YzZmJ4a0lFbStCL2JXTStUQ3MyNXo0RUpNdjFJQ3RvZE1iYktpcHJEdjJK?=
 =?utf-8?B?RlJqVnR2OVJHMEFVb25QdXkwMlVsOVd4QWg2aitubi9mK0lFdHYzd3cwMXpw?=
 =?utf-8?B?RkhqbXduU3Z0RXp0KzVzSTFidTFxQ0Z0di9DYkVHandKQUZjc0I2UjFmQklG?=
 =?utf-8?B?Qjlvcmk3Tk1HMmZjaGhVK0QzLzErVmdmeUNDWTRUS0xsSnhCSHpBeUtBSzBk?=
 =?utf-8?B?T1c0eGdueWxkQ3VpSzFIUFB0b3JiaGlybGMyZE9NZk9wQVBJV2MrLzNHNDZT?=
 =?utf-8?B?YktyN1krV2ZPV3pvZ004alNwU1drSkhJbTRpR3E2WVNadk5oYVQ5c28yRzRP?=
 =?utf-8?B?L09Jckt5TXIzdHZsaTcvbDREampiTWF1ZC9NREQ2dTJzRnN5QlQ4ZWJDaXVD?=
 =?utf-8?B?NmdEeXB1VUNTdm1NWEpIVURRMzdqRjBzMWgyVzNJUjJPZ3ZEcmhydlI4Tlht?=
 =?utf-8?B?U3VOK08wM3I4V0pCTVd2dUFjUmJQbXFaUlRSM0EzbSttVVdqc2VGelgzUjNj?=
 =?utf-8?B?eVFKbVBiS1BBem1QRnVGZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXVONVlJMDM0K0c5TzREbTFuQUh3Y2ljTnpxODNGWWN5eWF0dGJrZWFESlhq?=
 =?utf-8?B?OExyYzluSVUyRGZOWGdpNnVqWk9adWszZ0ovQkdyZUdQUnZSaXRUMlB1dDAy?=
 =?utf-8?B?VHZ6R1MxM0c5c0lYaDc2R29sQ1RKSGE4QjQySmU5bFNiQzRxdFlZS2dIbzFx?=
 =?utf-8?B?bDBQMGFvYVIvOWIvcm5zTThmZTdJb2grc3hZRGdWQTFZc2kvU0NmVExNT2kr?=
 =?utf-8?B?Y3dRNkl5Y0RaU2VDVzBLSFBLM01iR2VuV1ZCTnFmTEp0Q3MyRlRrd3kvZ1ll?=
 =?utf-8?B?a3NlUUdqQnlsMmFqVlR2RzBGZGNUbFhjRDB2cWo3b0YxMWxBaWdjV0w5S3ZV?=
 =?utf-8?B?WjdaN29oOThEOHAvbFBHYTVQSG80UjZPSUJKT0taUDhJTkFQaDM1NW5jRlRS?=
 =?utf-8?B?RnI0QVArUHlQL04rQVNqK2NVWFp0UG1TZzFRREZMYk4wU09pZUl3Q3NIeGFo?=
 =?utf-8?B?RUFhd3dsRHhvaUFRR3hpZ1RmNmdpamFjb0FEWWVETmtseC9ZdS9FNzVPUGZE?=
 =?utf-8?B?OGlpTU9yUUwrRHl1VndYWXJiL09CVjhENFo4dVc3UlcxelBGTkNqMU9tUmho?=
 =?utf-8?B?U2hJYmZ6cTJBN3ExYlIvZjdneDlRL211a2ViMmZ1dDJqUnU3OHVxY0NJNVZk?=
 =?utf-8?B?L0E1a3FUdnRFYkRoaEVSWjhIVjZaalArQXJkWVZvdVd5S3hYZ0dWYll0aXNE?=
 =?utf-8?B?VUU2VWVSMW84NHl5cTRQajJqNklRK2M3R1lvb1JxN2tydjFiZkZFYWlNTHdU?=
 =?utf-8?B?U21wdXFCVTdLMGFnU2ZRWEJJcEY0WVlaVStHTTZpMFFQanhqcmgwc2VEWVl1?=
 =?utf-8?B?TWoyWGxVdmQvbldleFYxRXM3UU9KdkdzbU45MzQ1U1VxSnp0b0xaWGtjbDZ4?=
 =?utf-8?B?SUJuSFRFUjcyQnplZXhOR3RCMlpmaEkrQ25RNEp0cHRDMFIvTEhzU1BkRlg4?=
 =?utf-8?B?RVVUS3NWUlNjMnJNN04zNzZ1cGx1L3VjM2F0V1NqOWQ5REZaTHZWR1Q0dTNF?=
 =?utf-8?B?RmFVOWh6YWhUTXo0Qk5MZnBGY1NQdjdHOHBPL2g2MjY5SUQwLytHaldRdlJm?=
 =?utf-8?B?ZUpWZ1VsTG9iWmw4bTJmTUZKWG5jZ1VYVWZVTkpqbzZVRVUwb0xBOXBLNTRP?=
 =?utf-8?B?ei81SFNyYUh4THROMnA1NTBnc05IdGJSWU1RVFNWMlRPWTEzamlkYUxIMjdP?=
 =?utf-8?B?amttZURScXRVM0JkeVFua2Z0Q1FhQjhROUszR3kwdDVUTzQ2Mmx2SHI0eTBl?=
 =?utf-8?B?ZFQxb3lIaDRBenFFQ3NMSDl5VjdJVHFidmlFN3pSc2hoU0kyN3kvTS9JWU02?=
 =?utf-8?B?QWdENmNBbHRiZXpTOVhuOG5kK1BRV1kraGYwMUw4NkNoa09neitXYlF2K3Rh?=
 =?utf-8?B?ditRelQxcDBKdTVONDF1NzVuZTFiSW9SZWxZMTZxazg2cXlBTkN3K0xCSUYr?=
 =?utf-8?B?b1daVTNHK3VITzYrYkJDWERTZGErbC9jQU1uT2FzZ1M1czEzNXpzQ3hmR0FC?=
 =?utf-8?B?dkhCOWRQWmM0Yy9OZlJCYkkvWXdhMGFBTGFEYWxiUmtqOFpnRGRwRkhJcEZw?=
 =?utf-8?B?N2UwaEprdlNzQnBKVVM4VXQ1dlhWV0hDOHNHZmM0K3VBTmpyejYxOE1PNzMv?=
 =?utf-8?B?SHR1WENKc01Kc1FzVDZ6V0EzZ0tFSyszaVFaTS83RitKd1RTdnY0dy91QnBr?=
 =?utf-8?B?TEVnVGZZZk1jSFRaeDVrb3F6UWZxK1VoMndrZDRIT055NEtRdzQvNmJJS2do?=
 =?utf-8?B?eldmY3FBdjN6WDNmR0lBUEJaOGFZS09TVys0ZUFzNXBpb2swVnNjVHBpMEww?=
 =?utf-8?B?MURUbjBQZ3pqcjRTeXJUbDVSWVFDaVAwOFBoVkxOeE1obEVDN0RwTmpkOHFD?=
 =?utf-8?B?YWsyZThvVGZ2Rkt2eEFlRkJQR2duNGgwc2dndXkrTzRpSkRYcy9pRlpxN0JQ?=
 =?utf-8?B?MGE1QmdzZFdkSGFieE5RUk1JS0VmVWxpcjBrNTNZVDRUTjB6Y1V6UGJldDF4?=
 =?utf-8?B?bk9RcW45WjgvbXJaMW16dlcrZ1ArSkFNajhDT3UxNVRKemExTU4rZUJhOU1o?=
 =?utf-8?B?STdTTzhjNlg5d1hPSDBjVFFBZUE1RUw0RWZCOEF1NThFMEtUTHRXNFFWeEwy?=
 =?utf-8?B?eWtLOXpxZW8wTXdCdU5HRDNkT2VudFd4YVo2UjB0MXNYQlFPOVFZMWJCWWg4?=
 =?utf-8?Q?50z0OI8kRQfC5i1RA4coJ4M=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bf9e827-2d50-45c2-6de5-08dd4d16954c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 16:42:34.7602 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b2p+yZFZ5JEfxgMzgkDMqEwOfEJEcjgXyZR1uh9vDZnZJE8B93A0dhZ4gF2OPqYvLRjOZvfmctTHX+EBD5AGi1qJeg1xUWy+m+UeoPo/SbI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5190
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



On 2/13/2025 2:50 PM, John Harrison wrote:
> On 2/13/2025 13:40, Daniele Ceraolo Spurio wrote:
>> If the device memory is corrupted during the suspend/resume flow, the
>> masks might end up being random values and using them might lead us to
>> trying to set values for engines that do not exist, which in turns might
>> lead to invalid memory accesses.
> Which is all bad and should be fixed, but that is not the only 
> problems we would get from a corrupted ADS blob. E.g. GuC itself is 
> going to have exactly the same problem given that this is where it 
> gets its engine masks from.

The aim here is not to make the driver load successfully, it is to avoid 
the kernel doing an invalid memory access. The GuC load will still fail 
afterwards, but we'll handle it gracefully.

>
> Is it worth adding some kind of check on the memory being valid? Add a 
> magic word somewhere unused and check that it is still correct? And if 
> not, fail the re-init with a meaningful error message.

I think I worded the commit message incorrectly. We do re-write the ADS 
on resume, including the masks. If we find an invalid value (like it has 
been reported in 
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4037) it likely 
implies that the local memory is not functioning correctly. If we wanted 
to catch this, the best approach would be a memory health test on resume 
(which is probably a good idea, but unrelated to this patch).

>
>>
>> Given that the driver does know which engines are available, we can just
>> calculate the masks instead of reading them out of memory.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_ads.c | 36 ++++++++++++---------------------
>>   1 file changed, 13 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c 
>> b/drivers/gpu/drm/xe/xe_guc_ads.c
>> index fab259adc380..10e2ab5791b7 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>> @@ -129,9 +129,6 @@ struct __guc_ads_blob {
>>   #define info_map_write(xe_, map_, field_, val_) \
>>       xe_map_wr_field(xe_, map_, 0, struct guc_gt_system_info, 
>> field_, val_)
>>   -#define info_map_read(xe_, map_, field_) \
>> -    xe_map_rd_field(xe_, map_, 0, struct guc_gt_system_info, field_)
>> -
>>   static size_t guc_ads_regset_size(struct xe_guc_ads *ads)
>>   {
>>       struct xe_device *xe = ads_to_xe(ads);
>> @@ -493,13 +490,12 @@ static void fill_engine_enable_masks(struct 
>> xe_gt *gt,
>>   static void guc_prep_golden_lrc_null(struct xe_guc_ads *ads)
>>   {
>>       struct xe_device *xe = ads_to_xe(ads);
>> -    struct iosys_map info_map = IOSYS_MAP_INIT_OFFSET(ads_to_map(ads),
>> -            offsetof(struct __guc_ads_blob, system_info));
>> -    u8 guc_class;
>> +    u8 class;
>>   -    for (guc_class = 0; guc_class <= GUC_MAX_ENGINE_CLASSES; 
>> ++guc_class) {
>> -        if (!info_map_read(xe, &info_map,
>> -                   engine_enabled_masks[guc_class]))
>> +    for (class = 0; class < XE_ENGINE_CLASS_MAX; ++class) {
>> +        u8 guc_class = xe_engine_class_to_guc_class(class);
>> +
>> +        if (!engine_enable_mask(ads_to_gt(ads), class))
>>               continue;
>>             ads_blob_write(ads, ads.eng_state_size[guc_class],
>> @@ -546,25 +542,24 @@ static void guc_mapping_table_init(struct xe_gt 
>> *gt,
>>   static u32 guc_get_capture_engine_mask(struct xe_gt *gt, struct 
>> iosys_map *info_map,
>>                          enum guc_capture_list_class_type capture_class)
>>   {
>> -    struct xe_device *xe = gt_to_xe(gt);
>>       u32 mask;
>>         switch (capture_class) {
>>       case GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE:
>> -        mask = info_map_read(xe, info_map, 
>> engine_enabled_masks[GUC_RENDER_CLASS]);
>> -        mask |= info_map_read(xe, info_map, 
>> engine_enabled_masks[GUC_COMPUTE_CLASS]);
>> +        mask = engine_enable_mask(gt, XE_ENGINE_CLASS_RENDER);
>> +        mask |= engine_enable_mask(gt, XE_ENGINE_CLASS_COMPUTE);
> Seems odd to have '; mask |=' rather than just '|'.
>
> Not a blocker, but given you are changing this anyway, might as well 
> clean it up?

Sure, I'll update.

Daniele

>
> John.
>
>>           break;
>>       case GUC_CAPTURE_LIST_CLASS_VIDEO:
>> -        mask = info_map_read(xe, info_map, 
>> engine_enabled_masks[GUC_VIDEO_CLASS]);
>> +        mask = engine_enable_mask(gt, XE_ENGINE_CLASS_VIDEO_DECODE);
>>           break;
>>       case GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE:
>> -        mask = info_map_read(xe, info_map, 
>> engine_enabled_masks[GUC_VIDEOENHANCE_CLASS]);
>> +        mask = engine_enable_mask(gt, XE_ENGINE_CLASS_VIDEO_ENHANCE);
>>           break;
>>       case GUC_CAPTURE_LIST_CLASS_BLITTER:
>> -        mask = info_map_read(xe, info_map, 
>> engine_enabled_masks[GUC_BLITTER_CLASS]);
>> +        mask = engine_enable_mask(gt, XE_ENGINE_CLASS_COPY);
>>           break;
>>       case GUC_CAPTURE_LIST_CLASS_GSC_OTHER:
>> -        mask = info_map_read(xe, info_map, 
>> engine_enabled_masks[GUC_GSC_OTHER_CLASS]);
>> +        mask = engine_enable_mask(gt, XE_ENGINE_CLASS_OTHER);
>>           break;
>>       default:
>>           mask = 0;
>> @@ -907,8 +902,6 @@ static void guc_populate_golden_lrc(struct 
>> xe_guc_ads *ads)
>>   {
>>       struct xe_device *xe = ads_to_xe(ads);
>>       struct xe_gt *gt = ads_to_gt(ads);
>> -    struct iosys_map info_map = IOSYS_MAP_INIT_OFFSET(ads_to_map(ads),
>> -            offsetof(struct __guc_ads_blob, system_info));
>>       size_t total_size = 0, alloc_size, real_size;
>>       u32 addr_ggtt, offset;
>>       int class;
>> @@ -917,12 +910,9 @@ static void guc_populate_golden_lrc(struct 
>> xe_guc_ads *ads)
>>       addr_ggtt = xe_bo_ggtt_addr(ads->bo) + offset;
>>         for (class = 0; class < XE_ENGINE_CLASS_MAX; ++class) {
>> -        u8 guc_class;
>> +        u8 guc_class = xe_engine_class_to_guc_class(class);
>>   -        guc_class = xe_engine_class_to_guc_class(class);
>> -
>> -        if (!info_map_read(xe, &info_map,
>> -                   engine_enabled_masks[guc_class]))
>> +        if (!engine_enable_mask(gt, class))
>>               continue;
>>             xe_gt_assert(gt, gt->default_lrc[class]);
>

