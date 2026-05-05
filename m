Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD748FF885A
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 05:22:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A3FF10E0AD;
	Tue,  5 May 2026 05:22:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B87m0A/Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242E510E0AD
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 05:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777958564; x=1809494564;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vjArMcxMISGtchFPNOWb6/2hUgRttYj0ka6mLrsyglY=;
 b=B87m0A/ZGwNUASV0/NFdWEVtH5g4JZZV7JTkC+QQYbbt6Cnn5fRHk+mB
 JO4N0+U3maoql3UijkJ1Jg2pn84SGJRUJzhXiJXHbY7EpNRYZJw5wd6gK
 IufZZwDr5xHS9lt8/xJCld3slwxhoIJcL9QydU+QJGiMPYLwSy7WYYAKb
 x4VtPSPQUahmTot5OldrG9UrNocDfCK/ALQMSxCGUdnNK2notun8Vbxnk
 degbKQqdX8MkOL505Bv1rFjCl9A5Nk3ejy9NwQNzynI/fiiKdTMqripP3
 7acd2jzNW/alHSzYCZebojA3bM4hrTzaTjBhR8JZ6bEpmQfcPpKLnqPo5 g==;
X-CSE-ConnectionGUID: 4hEv7buFSjW6x72zUqueqg==
X-CSE-MsgGUID: th19a2RQTBqAtrJrI53nzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="89410027"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="89410027"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 22:22:44 -0700
X-CSE-ConnectionGUID: T7JmVAEXTEqJCCW8HiCWZw==
X-CSE-MsgGUID: orDv9iVwR8SsILw22yb/8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="273834348"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 22:22:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 22:22:43 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 22:22:43 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.29) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 22:22:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N7mvkXqEjuMofLWA04OgDpp4oYLdyriGrcKumVoHaz+c9g40rVpQ1MlX1qzvKdrH+DTfaNzKSWeF3AkJJkiqlHjWtkWO1ChkBvtZDXLJuVpm3WeOnisn5giE2F3jauIOEoA0vh5LcQkvym+6ppoXFNhG+Rp5Va2lkojhH4rvNjiuiUPyExQmyKuxipQoGLYKduzfCB3ZEWxT+kNrlwfbTxuLOu6kiGG4R73R7oSty/pAFqZi0xrz5rZoxA87deL0hYYgplg1+CQgcet2mcP6uRNNz72svd6vbQx/F8OIfQqaHY3DdliF6Y+tOhQMw2lDRBBuCgGdHUJUwLWlfqCs4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gD8ZfPN8e2uaJoeuos0D56SmHWc/p1/k0dNjI9WPAIY=;
 b=n1ekOuLPRpItXJ7GQTNszmPHyn8QfE+hclq6H4Kw6c319HcR1OTJ8r5rBLUiwgtmtbd97pAk3m2C3qcdqcTJLAO77FeOmcf6uzLwWbda6/vml+7yEuHiLFORpc9dCvfyCw6WhKZkgSq7GeJ3mluGSfF12y/WsyyFPzsQE2fQ2lVEFm9hYKWxim9YTdWjAE1G/FuW5xLp5UynQ5pQKJM0Ag1q0IJQESnnnbGu3OncOgXnzzcaFU6crTt2PqJ4sCCcuCgIFLqH0nmKaY6mmewaR1n5RwMDG+jsUL3qm++3ArycfJxf1prL7Q2gNyS9uS+vFgq/PaRoS6qS0TfJh+uLJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.25; Tue, 5 May 2026 05:22:35 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 05:22:34 +0000
Message-ID: <5f1bc117-d6a2-4547-8fce-73cd920bf2e2@intel.com>
Date: Tue, 5 May 2026 10:52:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/13] drm/xe/xe_ras: Initialize Uncorrectable AER
 Registers
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
References: <20260417085812.4013309-15-riana.tauro@intel.com>
 <20260417085812.4013309-20-riana.tauro@intel.com>
 <ae8WrfTLjnJiSW4C@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <ae8WrfTLjnJiSW4C@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0129.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::14) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA0PR11MB7862:EE_
X-MS-Office365-Filtering-Correlation-Id: 14bdccee-2684-499e-fce9-08deaa665011
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: Wo7iykDg84zN6STxKs2KT5wQaj4gVd2QdbmBJcKX40xGZZruzhCh3SaIPy7iMgslKoplu2lwL1gXCitGQImQAfuaOAZyWSm4HFysu8E6TIj2n/KKa4dHyynCDV/y3brOjVgh7P207TaxQtYJYlINw02ZF9aiTS1Xiczjm9Kb6p9TjLyweMdR5jta7tacn6K7cHxBcaOF6EFhBT0EIfV1msN2XV1YM4BIZ05TMuiGshrE/kaKFVPE/d1iSspWKH1LYt6+a/b3r4hmSDqG2cR6OPqRaP5eQecRLe4IkXytCeA9dGgdkEDq1dz7IErJR9CXtFEWQWNsj9KL0TvJhrY1gUDFNFe5jjTEtOVWrWUJguLaf6btpUCV2sFum7p1CyakelPf5K/swr5w7vOZZySU/Q4uxX/i5YQ2Wu7B5Dadrtm5pXvMG/xbT50VWploYuE5bLN0GFbH2SlVRwz6TDTb5u8iuwMlYZbKCqr0NtchNg1xeO8jRJi5AGoCcIDNRqIrbnZ+dbT1tsLHzOvNWyUGrCQB+Wo9rCE+dbD2F2PQPNe9dCljeBmdmYoafVIYP0nD88W5lCrGaMrTi4dEbK4+Svishh2X8g449ji46xMMPhOsEweHyFwGnfBh9C9EaGG2iiIRKnIQsi1CHkC27HFiWkuGAn8YLh2X4QHUnW39Tnv/hYwzmH2D91WF3CWD9hoK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDlnZ2hRSWNHcHBuamlwQmh6QlpyMHlBM0pCVXl5ZHlqM092WHlYQm5mTisz?=
 =?utf-8?B?cm9JbUZiUUI2R2ZEQm1LNGRTRE1ua1NyaW04Y0hGd0FCc1ZBandFaHMzcmlz?=
 =?utf-8?B?K3BCUng3eUk5RTF1cElBTjh4RHg3UnNsbmc3K1d1ZmIvOGlsQ2h3eWhWOFR1?=
 =?utf-8?B?eFRhU3hnazhPdnYzTEZoQWcvdCs1VXRaanJpazhaTFhjOFhRdS9xVzhhb09i?=
 =?utf-8?B?VjJYUmVXTTM4eGFaaUpBcGZFbkRLdUNaUWdYdCtYTzc4Z1F3bWxONjAxY2Jn?=
 =?utf-8?B?YmZHNEJVVG9RZDdGVXVXc2Q1dkVHK1JIYkUva2FOK3RsemlBNGg2RkRORVM2?=
 =?utf-8?B?VVgzRzFoOXJ4SnRuL29YeGxBT3JtbTczcW9YaVFZUHdQVDdNaFJuQUJKZXcr?=
 =?utf-8?B?RFNZQlp3RnRMaCtvN2lGaVlSWnJ3MHprOTFlTVpLTFhPbjZXbFgydkZ0L1Rq?=
 =?utf-8?B?L2hsc3JHUEowekxubk1OL3I2ak1TUU1kR1R3MHhHc0xHNEUzeDZXcnZMcW1L?=
 =?utf-8?B?dUY3RW1yRFp4V2cyMDB6ZHBzZjZJUU1nTzNWTFZMbjNHUTI5dGQ0c3psTDVN?=
 =?utf-8?B?ZklEQzN4NVhpSFA2STZxM01nQW41UTRlYWVXMU15K1BqYmVIUWcyUHUrK09S?=
 =?utf-8?B?U3g1bklsYlpTREFURGhjdk5jWVJ5NEdYWmg5MUNiVFdsdVRMRVVmYUtPUU5l?=
 =?utf-8?B?ODRFQ0J3bFlwQXNLc3BMTmx0ZjN5bGRKVnBEZEZPbzZzNnJvNk5GSFVqR2NK?=
 =?utf-8?B?NmUybzhuUXVDVGlXc0VGcXUzV1NOa0tDRmlrNUVXSVIzVzRVWHZSSnVlV2xJ?=
 =?utf-8?B?TWhrdWFZT3RyNHZ6bnE2a3B5NHNpaGdxNGsyWkowc2lqZitNMUxWZCttaUVE?=
 =?utf-8?B?MUZiTFRhNU5zUUJpbmNkUVlCRmpnMlZPSGZiK2ZXdUkwWjlEVDZxNWsvSEhx?=
 =?utf-8?B?VFBzR1c0OWxlV0FObzV3cnZqQ05BYitXWEl4S0JZSUR0UE8rNG9XaWY0aTRU?=
 =?utf-8?B?KzM2ckpFU29ZVkk1c0tGZ0RvMWVxSVFqMHg1SlJFODR4TXVRM3hKVHNEWEZP?=
 =?utf-8?B?d0wxVXBQWERVNkdYeFNDODE2SmdvUW8zYkdpSCsxZFE1Zm5DeU9qZTJFandJ?=
 =?utf-8?B?dW00NWZKSFJyalcyVWE0OHNRR05WVVFVTG5yNkh5T2R1d25aazUrdjh0ZU5U?=
 =?utf-8?B?SXU0V0RvWFNLZGFTSlZBREZGOG93TDdDckl6R2lyNStxQXBQeUEzdHZCejZB?=
 =?utf-8?B?UllVdE1nUGVxNzV5aDVRT2tIazI5UVhNQVlkTERrTWdGV0pQVU9od0hoMTlq?=
 =?utf-8?B?c3dWNVFORlErM1RJalZUTHBwY1p6azlkcVhxKzc3VmRsZS91bWlyYjdOcjRK?=
 =?utf-8?B?UXJLVGw2WE5OOGRsZUYvZXREUjQ0WXJvVm9PZHBHdDIybGpZQVYwSTBtOCsw?=
 =?utf-8?B?a3hkNzM5WlQ5MkV3WUphMlB4K1ZIdDhHdVNnMnBBOXBndXFVeGo4aFRjQmVF?=
 =?utf-8?B?K2k5TGIzQksvZWJ0OFZXeU1zTklKVEtNM3dpQUJoTUFuK2t3N2dCeVNuYnFa?=
 =?utf-8?B?ckpNZ2FUWDF6VHkzVFJLa1FtY204TjlWY2xYdjNPRm1rMWRhZzYrMWRMa291?=
 =?utf-8?B?QUtSVjJWclRvRnlIeTd1bFdwS2c2U1RMWjJLWnZzZGxmVG90aCtVK2ZVS1NU?=
 =?utf-8?B?M0ZSOGtXMXJKeUpYUnVkS01Lb3gvcURhQk5pZ1JsS28xWldBd1BJUStNTHNC?=
 =?utf-8?B?ODdTbHZHRWI3MS9sYkNHbXIvZG1ham9xcDJHcmFIOHFQd002VkFDTkE3MkNU?=
 =?utf-8?B?eTFGVXR1UkxOWFdyd0U1ZFdoK2VibnZ2bzRWZysrTTRYOFRrSjltY1VBM0s3?=
 =?utf-8?B?a0J1Wk0vKyttNWQ2dEpkMXk1SnYyQ0tpQVNqT3BPOXhCOGpMS2hwMjNHczVI?=
 =?utf-8?B?MW1Hdk0yTVBaWCsrWnIzNG1QVUpWZFhrT01vekovVU5KUzFZblFCd3VadUlH?=
 =?utf-8?B?cVlJajhWZEdoa3RHcDFOb2kxK2JrUTQ1ODlwTERDRGRjUzNkbXdXSjUza1Ba?=
 =?utf-8?B?TlM0QVZmT1l6SHp5S28za1ZjVmw1azZiQUdCTHFuQjBWWlhqYTZXWVRjNGx5?=
 =?utf-8?B?eURrOFp3VnplVnd0YjJpODZlVW5HNmdMVmJOZGxFUjhTUjl4dm5NRnE5b3BK?=
 =?utf-8?B?WUxTOFY2OXVVZEIvRE1RQ0RmS3E4eGVCL1BVNk1CSjllUmgwYVNWWkRhekdp?=
 =?utf-8?B?RmJrY0Z2elRHbktJSCtINVdFaEFMaDZFb2F0V2g3ZmsvTm9tQjFDb1k5QnNj?=
 =?utf-8?B?anNJcDZrblEzenNCUEM2Wm1hdXZwYnRoOWl2SlJkWWtKRmJqTmNPUT09?=
X-Exchange-RoutingPolicyChecked: fVd5BpyGj1J1UyYv3U8qzHHE6Scg7mRrtlvDW6f2tXY3GjwuuvPkWq7cQ7AaU3fJ+zyWO1pfaYuWTjyZbygiQH9sXKN2sCceFAgqp80loiCD01rSWpmxgQCDPACbZCEQ3n04oKqdbD0iVZ+iHiO9hDGm2OYfOdtY881TVZV3+2Qgf2HJj+qpeDtMGxymmY9bPjBldYoyoPON+7Fn6KO2IjFF8J0XlSHuTdsCIaVbeQHv9oAkNjhIL3noWmkkNlK7th5a0S5KSG7rGYBaRLXU91J27zHFX7AGDmbSqKnCF6GDQ85D9OpL2uVGqJJxu/xKTgUG1XYsKKmuFGGTraj2Gg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 14bdccee-2684-499e-fce9-08deaa665011
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 05:22:34.4875 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K3MBfpr6KHgGsjc+DbznF+1PyvZeDfOY9n79PhyNxxC/muJtcXSzNmmQ3olPA1/HhrfTbOad2WLYFv56+6TUpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7862
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


On 4/27/2026 1:26 PM, Raag Jadav wrote:
> On Fri, Apr 17, 2026 at 02:28:17PM +0530, Riana Tauro wrote:
>> Uncorrectable errors from different endpoints in the device are steered to
>> the USP(Upstream Switch Port) which is a PCI Advanced Error Reporting (AER)
>> Compliant device. Downgrade all the errors to non-fatal to prevent PCIe
>> bus driver from triggering a Secondary Bus Reset (SBR). This allows error
>> detection, containment and recovery in the driver.
>>
>> The Uncorrectable Error Severity Register has the 'Uncorrectable
>> Internal Error Severity' set to fatal by default. Set this to
>> non-fatal and unmask the error.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> v2: clear stale uncorrectable internal status in status register
>> (Aravind)
>>
>> v3: Abbrevate TLA's (Raag)
>>      Add a info message if USP does not support AER
>> ---
>>   drivers/gpu/drm/xe/Makefile    |  1 +
>>   drivers/gpu/drm/xe/xe_device.c |  3 ++
>>   drivers/gpu/drm/xe/xe_ras.c    | 84 ++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_ras.h    | 13 ++++++
>>   4 files changed, 101 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_ras.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_ras.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 69c233d9a488..e29a4ae99ac6 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -113,6 +113,7 @@ xe-y += xe_bb.o \
>>   	xe_pxp_debugfs.o \
>>   	xe_pxp_submit.o \
>>   	xe_query.o \
>> +	xe_ras.o \
>>   	xe_range_fence.o \
>>   	xe_reg_sr.o \
>>   	xe_reg_whitelist.o \
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index cbdf7426e09c..c1c54836ac73 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -62,6 +62,7 @@
>>   #include "xe_psmi.h"
>>   #include "xe_pxp.h"
>>   #include "xe_query.h"
>> +#include "xe_ras.h"
>>   #include "xe_shrinker.h"
>>   #include "xe_soc_remapper.h"
>>   #include "xe_survivability_mode.h"
>> @@ -1074,6 +1075,8 @@ int xe_device_probe(struct xe_device *xe)
>>   
>>   	xe_vsec_init(xe);
>>   
>> +	xe_ras_init(xe);
>> +
>>   	err = xe_sriov_init_late(xe);
>>   	if (err)
>>   		goto err_unregister_display;
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> new file mode 100644
>> index 000000000000..4f705deaeefa
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -0,0 +1,84 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#include "xe_device_types.h"
>> +#include "xe_ras.h"
>> +
>> +#ifdef CONFIG_PCIEAER
>> +static void aer_unmask_and_downgrade_internal_error(struct xe_device *xe)
>> +{
>> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> +	struct pci_dev *vsp, *usp;
>> +	u32 aer_uncorr_mask, aer_uncorr_sev, aer_uncorr_status;
>> +	u16 aer_cap;
>> +
>> +	/*
>> +	 * Device Hierarchy:
>> +	 *
>> +	 * Upstream Switch Port (USP)--> Virtual Switch Port (VSP)--> SGunit (GPU endpoint)
>> +	 */
>> +	vsp = pci_upstream_bridge(pdev);
>> +	if (!vsp)
>> +		return;
>> +
>> +	usp = pci_upstream_bridge(vsp);
>> +	if (!usp)
>> +		return;
>> +
>> +	aer_cap = usp->aer_cap;
>> +
>> +	if (!aer_cap) {
>> +		dev_info(&usp->dev, "USP doesn't support AER capability\n");
>> +		return;
>> +	}
>> +
>> +	/*
>> +	 * Clear any stale Uncorrectable Internal Error Status event in Uncorrectable Error
>> +	 * Status Register.
>> +	 */
>> +	pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_STATUS, &aer_uncorr_status);
>> +	if (aer_uncorr_status & PCI_ERR_UNC_INTN)
>> +		pci_write_config_dword(usp, aer_cap + PCI_ERR_UNCOR_STATUS, PCI_ERR_UNC_INTN);
>> +
>> +	/*
>> +	 * All errors are steered to USP which is a PCIe AER Compliant device.
>> +	 * Downgrade all the errors to non-fatal to prevent PCIe bus driver
>> +	 * from triggering a Secondary Bus Reset (SBR). This allows error
>> +	 * detection, containment and recovery in the driver.
>> +	 *
>> +	 * The Uncorrectable Error Severity Register has the 'Uncorrectable
>> +	 * Internal Error Severity' set to fatal by default. Set this to
>> +	 * non-fatal and unmask the error.
>> +	 */
>> +
>> +	/* Initialize Uncorrectable Error Severity Register */
>> +	pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_SEVER, &aer_uncorr_sev);
>> +	aer_uncorr_sev &= ~PCI_ERR_UNC_INTN;
>> +	pci_write_config_dword(usp, aer_cap + PCI_ERR_UNCOR_SEVER, aer_uncorr_sev);
>> +
>> +	/* Initialize Uncorrectable Error Mask Register */
>> +	pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_MASK, &aer_uncorr_mask);
>> +	aer_uncorr_mask &= ~PCI_ERR_UNC_INTN;
>> +	pci_write_config_dword(usp, aer_cap + PCI_ERR_UNCOR_MASK, aer_uncorr_mask);
>> +
>> +	pci_save_state(usp);
>> +}
>> +#endif
>> +
>> +/**
>> + * xe_ras_init - Initialize Xe RAS
>> + * @xe: xe device instance
>> + *
>> + * Initialize Xe RAS
>> + */
>> +void xe_ras_init(struct xe_device *xe)
>> +{
>> +	if (!xe->info.has_sysctrl)
>> +		return;
>> +
>> +#ifdef CONFIG_PCIEAER
>> +	aer_unmask_and_downgrade_internal_error(xe);
> If we fail silently we'd most likely be clueless why RAS isn't working.
> So either add error log here or have an explicit success log inside
> downgrade function.

We already have a log if AER is not supported.  Handling ret for 
pci_write/read
is unnecessary. This fails only when device is disconnected or there is
something wrong with the device.

yeah i can add a debug success log.

Thanks
Riana

>
> Raag
>
>> +#endif
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
>> new file mode 100644
>> index 000000000000..14cb973603e7
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_ras.h
>> @@ -0,0 +1,13 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_RAS_H_
>> +#define _XE_RAS_H_
>> +
>> +struct xe_device;
>> +
>> +void xe_ras_init(struct xe_device *xe);
>> +
>> +#endif
>> -- 
>> 2.47.1
>>
