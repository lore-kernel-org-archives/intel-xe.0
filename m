Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFAF2C001DF
	for <intel-xe@archiver.kernel.org>; Thu, 19 Oct 2023 23:46:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F84F10E068;
	Thu, 19 Oct 2023 23:46:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 709C410E068
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Oct 2023 23:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697759183; x=1729295183;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iaLGtCzbkEr7BCLbMVFg/BSbr9OwvZFudfV1o3s5yoc=;
 b=CJBjH/d3bxLcyutQfokISXbGwN9K2zM8ntHFZrEsXgvtcT0bY06A7pHH
 r+najty6fuJiF/kRaGLgvKEiElNmJShTOKc4rZlgc22H1gWpBdLFLhHhz
 JrmpEANIDWG13C8FeCq7JmTH2NbrPesXc+yUCdWNo3ng5Hcfh+XHNv7c4
 Mmk8gHENoiEfAdzM9T+DGSZM+nacsxQ7D6U+Ccx8aEN3gzcaaqJlysWQ7
 UgRwsFbC3Uyj6VehQi8hHH4I78vY5BXQzWxzI0VeW3HyXSuNYkfajuu/x
 iRGG677d6iavF/K8fLNvX6jDY0sEs+F2c5VH10QJaHnkLpK360Errbhn5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="385269441"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="385269441"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 16:46:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="1004411899"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="1004411899"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Oct 2023 16:46:22 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 19 Oct 2023 16:46:22 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 19 Oct 2023 16:46:21 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 19 Oct 2023 16:46:21 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 19 Oct 2023 16:46:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F2NdAtvNw3qqVqKcnUwygshmPC8EhxODjtLKgpbhM6XlNLQT/gk5zT78oUJhtS/nZA/0VP6NW8lXwbfH4Zh5BKDsrDq/RH9CqVJ8FGNw43Tbz7cGncwxocE8H33CSUFXlgvnkDg7XqV8YGvPfQIHZcNUGGCrU5lq75Mh1OBCbffp9duWdlMTANL429bKvUe2K2lrP4pGiysTsNRlIh4e4glcd/IhxKW+xfTFbaGeF9iQyP8y4H8zhDSCIECpKaUzB27HVwrBvGr6+VoVPDkwfu0P1sWox0/IJDl08y+wc8tWRSdNC54VoHlUmEWlaa/7rSBu+mrXVnW5+EVZ/hK/1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5mEWPEqEhpbifaB62c91MGg0LpGg/HMqpxCdEuk4mw=;
 b=F+p30sfgJLUFvXcnaIpluElR6E/MgajHJESfAH1NEO+xz6xT0rUNQKUXiNkCDkNgnSaXVbELS0ceiDcFp61w3fimcBnNo+pF/JntJkNfzubtuyMqyJFMOULccYZCYrTHRje6dN8LROO1gZrddsws1pMF7J0SQXUWcTAWONRaKZk93GzPbpAumgBXuEixliwI7semDkVJxdadMj7aE8vCGqXlKTSlnscr4ltH+Utq/PDbJ0hSTS5E0yDG2HzfpLh2Io82zJ6elh4MZXKMzZRWS9oe+HmjJvAaXNXEP06FMQPUo8lbL58uC1297tSdGL/SNLtjEDlY/7YRcaurFrsEIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by IA1PR11MB7386.namprd11.prod.outlook.com (2603:10b6:208:422::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Thu, 19 Oct
 2023 23:46:12 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48f3:57b4:7dce:f17a]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48f3:57b4:7dce:f17a%4]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 23:46:12 +0000
Message-ID: <58c52812-da5e-4730-bb02-dccaaf96f4bc@intel.com>
Date: Thu, 19 Oct 2023 16:46:10 -0700
User-Agent: Mozilla Thunderbird
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20231018225707.1685294-1-daniele.ceraolospurio@intel.com>
 <20231018225707.1685294-3-daniele.ceraolospurio@intel.com>
 <nddgbye2i6ysxx7wnj23abe4tqbtdgwvezql2oeob4cgh7ocw6@pwnj26tya736>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <nddgbye2i6ysxx7wnj23abe4tqbtdgwvezql2oeob4cgh7ocw6@pwnj26tya736>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR02CA0014.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::27) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|IA1PR11MB7386:EE_
X-MS-Office365-Filtering-Correlation-Id: 646bbbda-a827-4405-8f06-08dbd0fd9366
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CaESYBlyuMnyMYucO6vJFpncN78oTW9sTpEhRWLkCo3C3ybJNUfxXIPaBw0i9lPbwZvyp+wEJpw3NvGjDZS+5loEx8Q+03TPblXY8S3v1Lj1fQ2ZFG6qG9pEbRDH7nL0zOAuRS4ozgiAKD27eKiOdmzxKeQ2dO9V1a7uPwqofm7eZOevUzkvXA2srmoOGoiKjw1l00+/UBlpi2103GUTnEviDoWtfaCtH/uuBrZ+c9B4MGyF2/4WuJejbE5Pi/tBrM8olAu0KhrbyWbuf1TJ1je3z8/nEJC6BGAeKNGoCSJ3QNUFraRD8q81KGY4+B6yyxDDM1zeuD3k6Fa5KEJr3cMa43TNcQ1EvCEFt3sLe/IUb9WQXCGUY5m8lBbYTgOlyP1tJSVwm8PnFvvNBWJaqEyKHAIXDwX2xvTJaoPg6FY0L6Jak6R90uOFgrx+Pb3Q/Nk3ZIxoqve7bsQ3MnQcF9Jsoah/8dolXHEbG1wPp65TUjWuejxVoIh0uS+0ZwGjG+BMFT1+uljMm/WqwVF+MDA58EKqFmBQewWWi8qBFRYqTfHd1xyv7RJQRibbDCC5okrFLcblwVM2mA10Eut4pYnTGnYgwMMqjX45rOPDlDZr+18M5OGwGSnThfR1GOpxUmVDFqGF0MSda8cP/laHGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(396003)(376002)(346002)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(66476007)(66556008)(38100700002)(31686004)(66946007)(26005)(83380400001)(478600001)(6486002)(6506007)(53546011)(41300700001)(316002)(6636002)(37006003)(2616005)(4326008)(6862004)(8676002)(8936002)(6512007)(5660300002)(31696002)(82960400001)(30864003)(86362001)(2906002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzF3N3UwUWsxZ3ZESlkzRUJhSFpXNXNvZS8xVDNDL25UbjI0UzJPcFRBV0ZF?=
 =?utf-8?B?Vy9YdkgxbkZCdkljZG52NFVkTnI4SWhNRzh0SW4zdWpvK2NHMEJBZTFVaW01?=
 =?utf-8?B?MDBiNXJWUUNBbEdIRGhjTElpRS9aME5mTFF3cGVxMUlRSDU1VXQzUWRNVFlO?=
 =?utf-8?B?ZTBMU2pFaDFLbVl4VmxET053MGFzWU0zdXExbXZvV0x4YnJlenJkRStyaUlw?=
 =?utf-8?B?SXc0UVZoU1dkR25CVURjQmNCeUxVMkQ0MS8wY1AxMkQzeHUxM3lhN3FDVkc3?=
 =?utf-8?B?VXlZUXhmVGU1OHF4YmtRa2lxdTc5RWxsdThydjZmU0ZvYXVFamNCejQwS3VK?=
 =?utf-8?B?NnRrZk5IVGlSY0ZaMnBSMkhyL2tFSkdCZDU2azlUMnZQaldORzRPdzVlQ2w3?=
 =?utf-8?B?MWNPUFNHc0ozcXdiK0VodTlQYzExVFlkVnhZQmsrNjR2TGpEOExUeUxUMzVV?=
 =?utf-8?B?MHRCcERTYUl4M0NtMXZsKzQ4UzlHc0FQUmM1UDljRkZHWkY1NExVcHJSMlFa?=
 =?utf-8?B?bThWWE5GK0J1RUVMSHlVOVA2UVZUV2pXRlVRS1R0NG5vR1JYMnVVeUJzd3RG?=
 =?utf-8?B?Z3Jmei9iK21hQjFqK1NuZ2VjR2xtZFFpTlJNYTFpWmN5OVppR3Z6WlRpWHlp?=
 =?utf-8?B?QTBhdHZKaGswR0NuSGxCY2JxbnhnUGxHK3FqNjJBMnZSS1M3Q3M2bFoyc1Jk?=
 =?utf-8?B?TWxnTE1PR3RHUldmd1ljSUZWMHgzRnZFSjJFT2UwUkRqWkcwT2Q0WUttZ2Iw?=
 =?utf-8?B?ajdrVkZHellKZi9LSjUxT1h1L2JyYUErVURueEdNWjBBSXV6R0RST2F6OWNv?=
 =?utf-8?B?Y0REc0Z5ajdUbVNpcFpMak1FOTc4bFNyVHRKZDVLOUZwZTdRcWtraDVRT3RN?=
 =?utf-8?B?dUw5THZtVGR0bkN3UzRPb05JOC93NTlEcXdra3lHNWlRc0sxK0RaaUhGam9p?=
 =?utf-8?B?cWhCeWlXdWZHdEtHbExXS2N6cGFRd0pnc28rZUJLRENGU0RBY2dKOEVmQ20z?=
 =?utf-8?B?blhZWEk1NnVXL0pMejJQbmdxYmRYc0QyTTNMRitFWjNFeG1sMG9hK1YyMU13?=
 =?utf-8?B?dEVZaTZLRk44ZjJsa0w1OUFXQ0pNQmJzSXZpSWZsWmQ0dHo5NFBLN1BmaGcr?=
 =?utf-8?B?TUNHdjA2TUwvYzY4bjBFUkVxc2VUZkZJUjRCb2hxMEE0QWtSZjUwalVINDRs?=
 =?utf-8?B?OFBkZFJLeW5KNnRCYlJHVjBnS0VTMGp1NXNuRG9HV2c3NXRzakpabFR3aXpv?=
 =?utf-8?B?d3p0U2xaQVJDcjJISHdRNWZDQXdrMHdNSjBBMnlkSzBydGEzYko5QW1mZHBN?=
 =?utf-8?B?SzltMytHSUcySnQvbjdEL2NHRnk3cExNc3FVeTBOMjdsWGdzYWRkZDFLNnZO?=
 =?utf-8?B?amlMcUJPbS9hVmdYN0M0NDNRRU9wVE82M3VrbmRiUW9JejNBcFVTTW9nUU02?=
 =?utf-8?B?SmNRamdPNUFTbEdIbUEzeG5teHJZdndWa2hVaWdHWXpqeUxBSkJxWldDOG9W?=
 =?utf-8?B?aW1nM25YenUrVzV1TFV5eEdYdDBSV01IMG1Vcm0wQk93enEzV0pnV1NsSXlS?=
 =?utf-8?B?VDZSazdXT1FuUm1sbDNpc3IrZEtwMmxFejZUVGRKSGUra1hzajNuTzBWWE50?=
 =?utf-8?B?blVHZUxrRVZYYjhJS3pFeDFwclh5R3BpczlEWUJVNFkyWTRld0Y2amVqRi9J?=
 =?utf-8?B?RmdOWXRFNmJtcEkrcGE4WUpIZGlFZnhaY0t1QXA2WUhyWGViTlhta2NiYkRR?=
 =?utf-8?B?ZFBwcnhuWVNPbnNJSFFjbzBudnpQUFQ4VFB6NUJqaG1sTUNHQVo2SEFWK2ph?=
 =?utf-8?B?V3FHakNHRFM2bXlRWDhLR1RrdzVMeEd0eHNVQm9XZDQzYUJMV28vdEZlQmJp?=
 =?utf-8?B?ay9OcThoRUMzN1Q4Nkd0RDVoblE3YkN0V0pEYlNiVmlGS3FKTVcrS3R1aFk5?=
 =?utf-8?B?dnROandrWG44MndKQmpRVEozcVE5RTFrRXBDWVdhY1UxQW9SbmhRTlpaVjRI?=
 =?utf-8?B?eGliZFhxTjV4K1pyb3F1dFlxa042b2E3TVZFMkdwS2FHWXdKSTMzYktrcXc3?=
 =?utf-8?B?ME43YUVYVE80aWNKVHlSUWxIY1kzcHE3MzFmeTErcnZadUU3KzBOUzVqRkFJ?=
 =?utf-8?B?bnpmSW9tVWNEK3ZvZ3lXTWVPMkQzcWQrNFpJdDU3cWlEZVNISHZ3T3lBdFM3?=
 =?utf-8?B?Snc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 646bbbda-a827-4405-8f06-08dbd0fd9366
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 23:46:12.3156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rJT4e9QQ5YdIKxFCqiiLsJIAc2XiUzaFclbQc/SAgDiDjWv6oAAkurNDxalO67DOBD5OQvEAvRehiDS22xLdu4ExtWM2gXWGfUuMq+BcIwo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7386
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/5] drm/xe/huc: Extract version and
 binary offset from new HuC headers
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 10/19/2023 4:07 PM, Lucas De Marchi wrote:
> On Wed, Oct 18, 2023 at 03:57:04PM -0700, Daniele Ceraolo Spurio wrote:
>> The GSC-enabled HuC binary starts with a GSC header, which is followed
>> by the legacy-style CSS header and the binary itself. We can parse the
>> GSC headers to find the HuC version and the location of the binary to
>> be used for the DMA transfer.
>>
>> The parsing function has been designed to be re-used for the GSC binary,
>> so the entry names are external parameters (because the GSC uses
>> different ones) and the CSS entry is optional (because the GSC doesn't
>> have it).
>>
>> v2: move new code to uc_fw.c, better comments and error checking, split
>>    old code move to separate patch (Lucas), move headers and
>>    documentation to uc_fw_abi.h.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>> Documentation/gpu/xe/xe_firmware.rst |   3 +
>> drivers/gpu/drm/xe/xe_uc_fw.c        | 137 ++++++++++++++++++++++++++-
>> drivers/gpu/drm/xe/xe_uc_fw.h        |   2 +-
>> drivers/gpu/drm/xe/xe_uc_fw_abi.h    | 120 +++++++++++++++++++++++
>> drivers/gpu/drm/xe/xe_uc_fw_types.h  |   2 +
>> 5 files changed, 261 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/gpu/xe/xe_firmware.rst 
>> b/Documentation/gpu/xe/xe_firmware.rst
>> index f1ac6f608930..afcb561cd37d 100644
>> --- a/Documentation/gpu/xe/xe_firmware.rst
>> +++ b/Documentation/gpu/xe/xe_firmware.rst
>> @@ -10,6 +10,9 @@ Firmware Layout
>> .. kernel-doc:: drivers/gpu/drm/xe/xe_uc_fw_abi.h
>>    :doc: CSS-based Firmware Layout
>>
>> +.. kernel-doc:: drivers/gpu/drm/xe/xe_uc_fw_abi.h
>> +   :doc: GSC-based Firmware Layout
>> +
>> Write Once Protected Content Memory (WOPCM) Layout
>> ==================================================
>>
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>> b/drivers/gpu/drm/xe/xe_uc_fw.c
>> index 7345f0409cf9..2680b5082ea0 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>> @@ -403,9 +403,142 @@ static int parse_css_header(struct xe_uc_fw 
>> *uc_fw, const void *fw_data, size_t
>>     return 0;
>> }
>>
>> +static bool is_cpd_header(const void* data)
>> +{
>> +    const u32 *marker = data;
>> +
>> +    return *marker == GSC_CPD_HEADER_MARKER;
>> +}
>> +
>> +static inline u32 entry_offset(const struct gsc_cpd_entry *entry)
>
> no need for the inline. Let the compiler figure it out.
>
>> +{
>> +    return entry->offset & GSC_CPD_ENTRY_OFFSET_MASK;
>> +}
>> +
>> +/* Refer to the "GSC-based Firmware Layout" documentation entry for 
>> details */
>> +static int parse_cpd_header(struct xe_uc_fw *uc_fw, const void 
>> *data, size_t size,
>> +                const char *manifest_entry, const char *css_entry)
>> +{
>> +    struct xe_gt *gt = uc_fw_to_gt(uc_fw);
>> +    struct xe_device *xe = gt_to_xe(gt);
>> +    const struct gsc_cpd_header_v2 *header = data;
>> +    const struct gsc_cpd_entry *entry;
>> +    size_t min_size = sizeof(*header);
>> +    int i;
>> +
>> +    if (!manifest_entry)
>> +        return -EINVAL;
>
> should this be an assert since it's a programming error to pass this as
> NULL?
>
>> +
>> +    if (size < sizeof(*header)) {
>
> min_size
>
>> +        xe_gt_err(gt, "FW too small! %zu < %zu\n", size, min_size);
>
> or change this one to be sizeof() and only assign min_size for later
> use.
>
>> +        return -ENODATA;
>> +    }
>> +
>> +    if (!is_cpd_header(header)) {
>> +        xe_gt_err(gt, "Trying to CPD parse a non-CPD header\n");
>> +        return -ENODATA;
>> +    }
>> +
>> +    if (header->header_length < sizeof(struct gsc_cpd_header_v2)) {
>> +        xe_gt_err(gt, "invalid CPD header length %u!\n", 
>> header->header_length);
>> +        return -EINVAL;
>> +    }
>> +
>> +    min_size = header->header_length + sizeof(*entry) * 
>> header->num_of_entries;
>> +    if (size < min_size) {
>> +        xe_gt_err(gt, "FW too small! %zu < %zu\n", size, min_size);
>> +        return -ENODATA;
>> +    }
>> +
>> +    entry = data + header->header_length;
>> +
>> +    for (i = 0; i < header->num_of_entries; i++, entry++) {
>> +        if (strcmp(entry->name, manifest_entry) == 0) {
>> +            const struct gsc_manifest_header *manifest;
>> +
>> +            min_size = entry_offset(entry) + sizeof(struct 
>> gsc_manifest_header);
>> +            if (size < min_size) {
>> +                xe_gt_err(gt, "FW too small! %zu < %zu\n", size, 
>> min_size);
>> +                return -ENODATA;
>> +            }
>> +
>> +            manifest = data + entry_offset(entry);
>> +
>> +            uc_fw->major_ver_found = manifest->fw_version.major;
>> +            uc_fw->minor_ver_found = manifest->fw_version.minor;
>> +            uc_fw->patch_ver_found = manifest->fw_version.hotfix;
>
> continue;
>
> if we can't ever have css_entry == manifest_entry

Yeah they can never be the same

>
>> +        }
>> +
>> +        if (css_entry && strcmp(entry->name, css_entry) == 0) {
>> +            u32 offset = entry_offset(entry);
>> +            int ret;
>> +
>> +            /*
>> +             * This section does not contain a CSS entry on DG2. We
>> +             * don't support DG2 HuC right now, so no need to handle
>> +             * it, just add a reminder in case that changes.
>> +             */
>> +            xe_assert(xe, xe->info.platform != XE_DG2);
>> +
>> +            /* the CSS header parser will check that the CSS header 
>> fits */
>> +            if (offset > size) {
>> +                xe_gt_err(gt, "FW too small! %zu < %u\n", size, 
>> offset);
>> +                return -ENODATA;
>> +            }
>> +
>> +            ret = parse_css_header(uc_fw, data + offset, size - 
>> offset);
>> +            if (ret)
>> +                return ret;
>> +
>> +            uc_fw->css_offset = offset;
>> +        }
>
> do we want to stop the search as soon as both are found? maybe even as 2
> loops instead of one.

I like the 2 loops idea. There shouldn't be many entries anyway, so not 
a perf issue.

>
>> +    }
>> +
>> +    if (!uc_fw->major_ver_found) {
>> +        xe_gt_err(gt, "Failed to find %s version in manifest!\n",
>> +              xe_uc_fw_type_repr(uc_fw->type));
>> +        return -ENODATA;
>> +    }
>> +
>> +    if (css_entry && !uc_fw->css_offset) {
>> +        xe_gt_err(gt, "Failed to find CSS offset for %s\n",
>> +              xe_uc_fw_type_repr(uc_fw->type));
>> +        return -ENODATA;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> static int parse_headers(struct xe_uc_fw *uc_fw, const struct 
>> firmware *fw)
>> {
>> -    return parse_css_header(uc_fw, fw->data, fw->size);
>> +    /*
>> +     * Quick check to make sure there is enough space for the 
>> headers. FWs
>> +     * are expected to be hundreds of KB big, so we can keep it 
>> simple and
>> +     * start by checking that we have at least a page (which is 
>> enough for
>> +     * the headers), while further checks will be done based on the 
>> headers
>> +     * contents.
>> +     */
>> +    if (fw->size < PAGE_SIZE)
>> +        return -ENODATA;
>
> functions below should be able to survive with no crashes if they always
> check the there's enough data in the buffer to cover what they are
> trying to access. I don't like much checking for an arbitrary PAGE_SIZE
> number and eventually failing that in future platforms when/if the
> header grows.

This was here to avoid having to put a size check in is_cpd_header(), 
but I can go with your suggestion below instead and move is_cpd_header() 
inside parse_cpd_header() and remove this check.

ack on all the other comments, I'll respin once CI is back online so 
I'll be able to get results for merge.

Daniele

>
>> +
>> +    /*
>> +     * All GuC releases and older HuC ones use CSS headers, while 
>> newer HuC
>> +     * releases use GSC CPD headers.
>> +     */
>> +    switch (uc_fw->type) {
>> +    case XE_UC_FW_TYPE_HUC:
>> +        if (is_cpd_header(fw->data))
>> +            return parse_cpd_header(uc_fw, fw->data, fw->size,
>> +                        "HUCP.man", "huc_fw");
>
> alternative to use one specific error number like ENOENT in
> parse_cpd_header(), so you know to fallback on that
>
> case XE_UC_FW_TYPE_HUC:
>     ret = parse_cpd_header(uc_fw, fw->data, fw->size, "HUCP.man", 
> "huc_fw");
>     if (!ret || ret != -ENOENT)
>         return ret;
>
>     fallthrough;
>
> then the is_cpd_header() can just be inside the function actually
> parsing the cpd_header and you can remove the extra error message from
> there.
>
>> +        fallthrough;
>> +    case XE_UC_FW_TYPE_GUC:
>> +        return parse_css_header(uc_fw, fw->data, fw->size);
>> +        break;
>> +    default:
>> +        return -EINVAL;
>> +    }
>> +
>> +    return 0;
>> }
>>
>> int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>> @@ -511,7 +644,7 @@ static int uc_fw_xfer(struct xe_uc_fw *uc_fw, u32 
>> offset, u32 dma_flags)
>>     xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>>
>>     /* Set the source address for the uCode */
>> -    src_offset = uc_fw_ggtt_offset(uc_fw);
>> +    src_offset = uc_fw_ggtt_offset(uc_fw) + uc_fw->css_offset;
>>     xe_mmio_write32(gt, DMA_ADDR_0_LOW, lower_32_bits(src_offset));
>>     xe_mmio_write32(gt, DMA_ADDR_0_HIGH, upper_32_bits(src_offset));
>>
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h 
>> b/drivers/gpu/drm/xe/xe_uc_fw.h
>> index a519c77d4962..1d1a0c156cdf 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw.h
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.h
>> @@ -21,7 +21,7 @@ void xe_uc_fw_print(struct xe_uc_fw *uc_fw, struct 
>> drm_printer *p);
>>
>> static inline u32 xe_uc_fw_rsa_offset(struct xe_uc_fw *uc_fw)
>> {
>> -    return sizeof(struct uc_css_header) + uc_fw->ucode_size;
>> +    return sizeof(struct uc_css_header) + uc_fw->ucode_size + 
>> uc_fw->css_offset;
>> }
>>
>> static inline void xe_uc_fw_change_status(struct xe_uc_fw *uc_fw,
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw_abi.h 
>> b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
>> index edae7bb3cd72..d6725c963251 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw_abi.h
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
>> @@ -85,4 +85,124 @@ struct uc_css_header {
>> } __packed;
>> static_assert(sizeof(struct uc_css_header) == 128);
>>
>> +/**
>> + * DOC: GSC-based Firmware Layout
>> + *
>> + * The GSC-based firmware structure is used for GSC releases on all 
>> platforms
>> + * and for HuC releases starting from DG2/MTL. Older HuC releases 
>> use the
>> + * CSS-based layout instead. Differently from the CSS headers, the 
>> GSC headers
>> + * uses a directory + entries structure (i.e., there is array of 
>> addresses
>> + * pointing to specific header extensions identified by a name). 
>> Although the
>> + * header structures are the same, some of the entries are specific 
>> to GSC while
>> + * others are specific to HuC. The manifest header entry, which 
>> includes basic
>> + * information about the binary (like the version) is always 
>> present, but it is
>> + * named differently based on the binary type.
>> + *
>> + * The HuC binary starts with a Code Partition Directory (CPD) 
>> header. The
>> + * entries we're interested in for use in the driver are:
>> + *
>> + * 1. "HUCP.man": points to the manifest header for the HuC.
>> + * 2. "huc_fw": points to the FW code. On platforms that support 
>> load via DMA
>> + *    and 2-step HuC authentication (i.e. MTL+) this is a full 
>> CSS-based binary,
>> + *    while if the GSC is the one doing the load (which only happens 
>> on DG2)
>> + *    this section only contains the uCode.
>> + *
>> + * The GSC-based HuC firmware layout looks like this::
>> + *
>> + *    +================================================+
>> + *    |  CPD Header                                    |
>> + *    +================================================+
>> + *    |  CPD entries[]                                 |
>> + *    |      entry1                                    |
>> + *    |      ...                                       |
>> + *    |      entryX                                    |
>> + *    |          "HUCP.man"                            |
>> + *    |           ...                                  |
>> + *    |           offset >----------------------------|------o
>> + *    |      ...                                       |      |
>> + *    |      entryY                                    |      |
>> + *    |          "huc_fw"                              |      |
>> + *    |           ...                                  |      |
>> + *    |           offset >----------------------------|----------o
>> + *    +================================================+ |   |
>> + * |   |
>> + *    +================================================+ |   |
>> + *    |  Manifest Header |<-----o   |
>> + *    |      ... |          |
>> + *    |      FW version |          |
>> + *    |      ... |          |
>> + * +================================================+          |
>> + * |
>> + * +================================================+          |
>> + *    |  FW binary |<---------o
>> + *    |      CSS (MTL+ only)                           |
>> + *    |      uCode                                     |
>> + *    |      RSA Key (MTL+ only)                       |
>> + *    |      ...                                       |
>> + *    +================================================+
>
> awesome! much easier now.
>
> Consider the comments above just nits and feel free to incorporate the
> suggestions or leave as is.
>
>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
> thanks
> Lucas De Marchi
>
>> + */
>> +
>> +struct gsc_version {
>> +    u16 major;
>> +    u16 minor;
>> +    u16 hotfix;
>> +    u16 build;
>> +} __packed;
>> +
>> +/* Code partition directory (CPD) structures */
>> +struct gsc_cpd_header_v2 {
>> +    u32 header_marker;
>> +#define GSC_CPD_HEADER_MARKER 0x44504324
>> +
>> +    u32 num_of_entries;
>> +    u8 header_version;
>> +    u8 entry_version;
>> +    u8 header_length; /* in bytes */
>> +    u8 flags;
>> +    u32 partition_name;
>> +    u32 crc32;
>> +} __packed;
>> +
>> +struct gsc_cpd_entry {
>> +    u8 name[12];
>> +
>> +    /*
>> +     * Bits 0-24: offset from the beginning of the code partition
>> +     * Bit 25: huffman compressed
>> +     * Bits 26-31: reserved
>> +     */
>> +    u32 offset;
>> +#define GSC_CPD_ENTRY_OFFSET_MASK GENMASK(24, 0)
>> +#define GSC_CPD_ENTRY_HUFFMAN_COMP BIT(25)
>> +
>> +    /*
>> +     * Module/Item length, in bytes. For Huffman-compressed modules, 
>> this
>> +     * refers to the uncompressed size. For software-compressed 
>> modules,
>> +     * this refers to the compressed size.
>> +     */
>> +    u32 length;
>> +
>> +    u8 reserved[4];
>> +} __packed;
>> +
>> +struct gsc_manifest_header {
>> +    u32 header_type; /* 0x4 for manifest type */
>> +    u32 header_length; /* in dwords */
>> +    u32 header_version;
>> +    u32 flags;
>> +    u32 vendor;
>> +    u32 date;
>> +    u32 size; /* In dwords, size of entire manifest (header + 
>> extensions) */
>> +    u32 header_id;
>> +    u32 internal_data;
>> +    struct gsc_version fw_version;
>> +    u32 security_version;
>> +    struct gsc_version meu_kit_version;
>> +    u32 meu_manifest_version;
>> +    u8 general_data[4];
>> +    u8 reserved3[56];
>> +    u32 modulus_size; /* in dwords */
>> +    u32 exponent_size; /* in dwords */
>> +} __packed;
>> +
>> #endif
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h 
>> b/drivers/gpu/drm/xe/xe_uc_fw_types.h
>> index 444bff83cdbe..1650599303c8 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
>> @@ -113,6 +113,8 @@ struct xe_uc_fw {
>>     u32 rsa_size;
>>     /** @ucode_size: micro kernel size */
>>     u32 ucode_size;
>> +    /** @css_offset: offset within the blob at which the CSS is 
>> located */
>> +    u32 css_offset;
>>
>>     /** @private_data_size: size of private data found in uC css 
>> header */
>>     u32 private_data_size;
>> -- 
>> 2.41.0
>>

