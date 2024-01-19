Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C730FC4725D
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jan 2024 09:57:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6354210E99E;
	Fri, 19 Jan 2024 09:57:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C26F10E99E
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jan 2024 09:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705658259; x=1737194259;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bNeMhihz3Mft4ZcPTxHuk8QCByYc0+zdYz+e2LcbLSQ=;
 b=T859/iGgOVarVQow0PjO0gk5OKJuj3EDzEODQkD6X8mG/qRbt9uf/4v6
 1QoOEU+bpxHkqsPp8zqmwlcRLq94zcgKMYq/yveYLH9xnE1ZKf92VPvKh
 tiaLzwBUvYpRS3oX6ND1+v3TF6Q82vvj8OFmnwI96Y1R3/s9bWOkAmBAa
 awna5K59d6dNGOVVTeSVEwbZdOcRkEqwIOtl6h2bMTxYRik7eRe8viXfx
 QJ2yL2ulUnouI3AR89DW9jgUWGMnqFK1sPd3tjPJzadgHsMIzRVoiDZJH
 w410HGEWs9l6k2RTuRI+adFn7vhs8BebaOE7QyDpJyWWAP+dl+QHtl4I8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="467082567"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="467082567"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 01:57:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="875332254"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="875332254"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jan 2024 01:57:38 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 01:57:37 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 01:57:37 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Jan 2024 01:57:37 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Jan 2024 01:57:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lMbHmCoy7eTtvAMN0/wYqHpcee6u3RJIbI65i/tjPuSwivPsJUFMAeKdoDA/6h8iChbc07jrHxiWr5PhCCe548hE6pdX+YvYKHXBqe8sI4n+FusuxQyO/WhlXUYt2eGKWvdmAigbTV9yy2Hphlva1a/slgiJbfwAD1MTT8tvOSMoJ91k6r0vHcsdC6a6HeViXBWORtqRC4zuS3BRdVwkR0WuN9LCUn0zEJeaW8q4zgHZjlgSI1lvGOLhjareJ49SXZhXXxLdR3soTb8IV8Z6Q7Vz3cVwoXHqNTCuP3BNsZh3hYBZCZKRF2hB5M3oKF48GlDd3rJNKE2NsNCmCIEFTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mFJqvcW7V7StdTbxNkGiOsPpZhj03tQC+y8zwtlMidA=;
 b=n4qlq4HNyFvcRfYnNJvpROd0/EN9fxp/HOSBI1Y0GOgvEy7SWwLmb8DvcLwRwYRWh1HLqqYuL1TkI2Qs7Qk/Ybx0H53gXtbTZgO/o/HmtW/buLyyxbiFIWKW7oG8JrmjrEyMvO1knUVDZGD15piSkWHpMwHZHGGJuO5tNGsH5t5jU3uxUpN+occSlx7nVYRspaDLY3qqWsQrt0Z0kd+mXf5AgBgxt9IPBmf5BPUPmGAvPGgF/a4USl62IBaqMiFHwxJEjsM3a2mmkvFUQ0t3jmNBea+sVYg8Bm2cPjszmKrsZNFCQy61oyP6CidJ3ulyDDMRpt7d1hBzjmt3wXL0vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ2PR11MB8452.namprd11.prod.outlook.com (2603:10b6:a03:574::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Fri, 19 Jan
 2024 09:57:35 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6%7]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 09:57:35 +0000
Message-ID: <ca722743-8006-4195-9172-730c5886a7e6@intel.com>
Date: Fri, 19 Jan 2024 15:27:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/debugfs: Expose debugfs entry to check guc pc
 support
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20240119081852.1858212-1-badal.nilawar@intel.com>
 <CY5PR11MB621172B0F827E4FD706646DB95702@CY5PR11MB6211.namprd11.prod.outlook.com>
 <d4620fae-0316-4881-ac03-cb4d6f99b01b@intel.com>
 <CY5PR11MB6211834CA364535838F7EC8095702@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <CY5PR11MB6211834CA364535838F7EC8095702@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0168.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::8) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ2PR11MB8452:EE_
X-MS-Office365-Filtering-Correlation-Id: b11d8b9b-94cb-438d-7c12-08dc18d50f83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZzwSxQaA6j8GaXXUIhGjpolfwMfMPb9Ffm4m7j5xJfDTDZyNpd9F15xeFHwglAmVtM3mpH1u133jilsiHXZQlOO1WlDbMhjDMITKbfrONY2R/JZgz9TLSy2J8BgcCmN/z15Qzc9wiV90sr5XLVIwNGGm9/yZtcfdJIv8t03qCY8uUENG1NCWlxy0FFGp90igIgIWpyfvlcGdEsaKo30cgVQ56zH8vZHFnCE5sv9uOkiqhSNvu9fNIcP7SEenP5gsDyFa9EMzAt6cFmB8ybWOkeH1Ev5jMRhb6AzOw2AQiVN9DCiyIBxY5bPexJE1HfcluUenPZihJrXSDpDgL0o7ndLdYuApjlm/AMUwrcfvzJxdIjs6p7thuhgyT/HQBsrQNACukOmxrkx9QlsGFF1cezl3lFrq/ti/0RVk7LPrs4UqGy2oCMtkLwn4huw7t/SZoqrlidkr/uDWyOUSRi2Q9Bg6sGNDvYPDYrL1rOOA+CBipR6wQ3Rk3yM+WdJpewOgCJP3l+usPIdTEitHwhsd21fwrY4aEr8TEvCwrF2ZSj8gTesC8DKMOK9CJpMU7wrt0xQ0NVN6Pj54SBW3amF2DPPFQ2cqTqZI5EGpJaYfDXTTM/J/bFQVLz4+h8WjViJ9xHg8p8Suf9uTZSQ50k9nrg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(346002)(396003)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(478600001)(31696002)(41300700001)(86362001)(38100700002)(82960400001)(36756003)(2906002)(5660300002)(66946007)(316002)(6512007)(83380400001)(6486002)(54906003)(6666004)(2616005)(6506007)(66556008)(66476007)(44832011)(8936002)(8676002)(26005)(107886003)(4326008)(110136005)(53546011)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2prZVNtVzRUOVh4RW45cW4xV2dDN0tna2xCSDh6M2I3VlJ5bXNFclNMTmRx?=
 =?utf-8?B?Wk1HSHhOUzZsYlZHOEREaVRPeVBhUDFZdVpBL2dJSy9xNThKY0thLzU1V0Zk?=
 =?utf-8?B?UUVXRTk4a1pHUTEvclVzTVkxRXA5NDhrT3pkb3g5RVZXTkxSUXJOU01rTXdY?=
 =?utf-8?B?bUl6bXRWT3hxRnN3OXpXVlMzRnkwQzd1VUswSGNwZDdEeCtVdkRpQnI2VUs3?=
 =?utf-8?B?dElCdnNuMHdFcVh5RDJUWVYrclRjWFBIQVUrMHFzbjViUTlPRU9XblM0aHpT?=
 =?utf-8?B?Q1RUaGtFZ2pJR3hUOWE0c0Q4SlpGUWRRMzlQMVQ1VFN4ampURUE4Wml1NDAy?=
 =?utf-8?B?NWViZHBDTGg2OVlHYnBDelJ4RTRqVHZ1N1Z3bzJDckRqYjZoNGdlUGk5MGFK?=
 =?utf-8?B?bGo4b1FkY1lDRUhNb1hZUlZKR1duWFZkZXdLT2lCc2pNdmJmZVdTRVRndGM0?=
 =?utf-8?B?QlJxV2pSMHMzSTk2Y0dQZ0VKNXd2bXprb1RENVVIYzFmWUdZT3ZVdy9ObDZX?=
 =?utf-8?B?ZEIzTWFEajBuK3p4RkpXc3lCK2lyRmh2R250bDA0eUZDMkxVdVhqcjFXWDNH?=
 =?utf-8?B?VE1TZ01HS3dqRnJUTVU2cjZnT09wdzZBMHpTWm02VlZOT1g2a0wxQlc5ZitI?=
 =?utf-8?B?V25BT1hqTmkrbHpxM2g0MlpEVmtXZTYzc012blQ0RmNmL1hmYUZDejdlVm84?=
 =?utf-8?B?Q3lhbndEK2l3Rkl0Ny9VREUydDNCSjgwRXZYRFgrU1Q3V3RyMTczRll5VnhH?=
 =?utf-8?B?TUcrd3pQbHhnQjg4S1E3VWFBYW9Td0l6VFRnMVFPcmFqdGt4UFdYd2NCS3Na?=
 =?utf-8?B?Z09hN1FHNDhsaXd3UEIrZUg2TXViUkJmVi9CVWsvQnlmMnl1RFRBSzFnV2VO?=
 =?utf-8?B?RU1ZTFVxdWVUaXd3dlQ5bWZaRHFsNks1RGp5SmtRRHN1OU9BWVN6RHl5dmNv?=
 =?utf-8?B?Ykc5QlNZdEFMODhiRThMeW5aOXJ2TWJLbFMvSjdUZWEyN1ozR3VUbGJZMDFl?=
 =?utf-8?B?OERUTGlxRkRDUk1mRGNWb2pMUnFhdkl4eUFXdy95dUQyN0UrM1FpTmRibUY4?=
 =?utf-8?B?M0xPRGZHK3U0OXNqbm5Ua2cwQldwcDlDc0c5UlJ2R3lVc2hHUWt5SUcxdWs4?=
 =?utf-8?B?ek9sNnVNd0ozYlNaMms4STJVaVYycFpPM04vR2p5UlhlQS9sVTRCT0ZEenBE?=
 =?utf-8?B?K3BlRTBCd0MvbnBuQUs0MDQ4NnpveUN2Yng3cFVTQWRoaGF3SWpaV0laN1F3?=
 =?utf-8?B?bFVhOWhrc1hrd1gxYTNBWkZxVlNva3hOTEVDcC9lRHdXTmtIVVRCVkNVYUVE?=
 =?utf-8?B?clJ6V2dyaEM4OFU3NFpXSmlsSG5qRWkySVBKT1NFWFVDa0t1NjQydUQ2aDFh?=
 =?utf-8?B?dHFrZjdOMDVWTXp5Mys1RmM1MnNUdkpCM3hhMmFlVzV3ZHpNcytGQllYYjg1?=
 =?utf-8?B?UU9iMWV0NkVIaVRZTFNBVDdVTGFSZlY0T3prSHFhRmdtTXo1OVpzUnU0VkJD?=
 =?utf-8?B?dG9vZDN5eVgwZVdqaDZhK0pTQ1dzZEpYd3l3a0lNNFhHVFpkUEFwS3dGMnRi?=
 =?utf-8?B?ZGd3c0RFbW9PSitQNlZhYjV3b3lKZGZTeWVxVXg5Z0JnbnRqNS9Tak1ZQ3lV?=
 =?utf-8?B?TTNaZzdQY1lNRDVnS1ZNVWZRQmprbkR5eHNnd3FXeitBVHh4M0JNN1ZLdGkx?=
 =?utf-8?B?ZGQ1STlSY0xkYlY1Vzc5bVJONHFlUU1ZdGFwUlZ0ajJHUTkwaDNUQWsxa0NH?=
 =?utf-8?B?WWVMSHVXWitOM0JMcUFPRWF3VXR3VkM3Qk42eUhjL0xXQ1gxc2VsY1l6VHN3?=
 =?utf-8?B?blQ2QkRSc0tmL1BWYnVIcHdGNngrN2gyanpTamZSby8rNDhEMXRMZXZLQjhu?=
 =?utf-8?B?NnU2Q3dZMU1mbERYZTh4Y21qM3pBQnI5M1ZORDNhcm1Ca2hzeWtVdmFqMHEr?=
 =?utf-8?B?MmtQMTVvZTZORjl6Uy9Ydk1oV0xCZUFjNndFNTN3cEltM21kM3k3dDVoNXg2?=
 =?utf-8?B?ZWdVaXYrUE1zSzlRNHlabkpRaStLQkQ0TDhwQURSRFRpVk8wWE5MaWxWZ2NU?=
 =?utf-8?B?VzY3eS94UEhaNUJGU2JZRm9tUHQvdHBkbXZITVYxN2RSYWFHODhndG5vTWNx?=
 =?utf-8?Q?QVUDKNQIQZTdFdo4BGsk0zbxJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b11d8b9b-94cb-438d-7c12-08dc18d50f83
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 09:57:35.0457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dEut7qa44oXZ690IJT7RjlLSSZ8Wp0KzQp2iTEGhv13SkWxdbXzqXMi9yATw+peNgfA7f61V71Af17u1MTpjiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8452
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Badal

On 1/19/2024 3:05 PM, Gupta, Anshuman wrote:
> 
> 
>> -----Original Message-----
>> From: Nilawar, Badal <badal.nilawar@intel.com>
>> Sent: Friday, January 19, 2024 3:01 PM
>> To: Gupta, Anshuman <anshuman.gupta@intel.com>; intel-
>> xe@lists.freedesktop.org
>> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Roper, Matthew D
>> <matthew.d.roper@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>;
>> Belgaumkar, Vinay <vinay.belgaumkar@intel.com>
>> Subject: Re: [PATCH] drm/xe/debugfs: Expose debugfs entry to check guc pc
>> support
>>
>>
>>
>> On 19-01-2024 14:58, Gupta, Anshuman wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Nilawar, Badal <badal.nilawar@intel.com>
>>>> Sent: Friday, January 19, 2024 1:49 PM
>>>> To: intel-xe@lists.freedesktop.org
>>>> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Vivi, Rodrigo
>>>> <rodrigo.vivi@intel.com>; Roper, Matthew D
>>>> <matthew.d.roper@intel.com>; Dixit, Ashutosh
>>>> <ashutosh.dixit@intel.com>; Belgaumkar, Vinay
>>>> <vinay.belgaumkar@intel.com>
>>>> Subject: [PATCH] drm/xe/debugfs: Expose debugfs entry to check guc pc
>>>> support
>>>>
>>>> Expose debugfs entry to check if platform support GuC PC (SLPC) feature.
>>>>
>>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_debugfs.c | 8 ++++++++
>>>>    1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c
>>>> b/drivers/gpu/drm/xe/xe_debugfs.c index c56fd7d59f05..2f474bf0e7c7
>>>> 100644
>>>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>>>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>>>> @@ -30,6 +30,13 @@ static struct xe_device *node_to_xe(struct
>>>> drm_info_node *node)
>>>>    	return to_xe_device(node->minor->dev);  }
>>>>
>>>> +static int is_gucpc_supported(struct seq_file *m, void *data) {
>>>> +	struct xe_device *xe = node_to_xe(m->private);
>>>> +
>>>> +	return (int)!xe->info.skip_guc_pc;
>>>> +}
>>>> +
>>>>    static int info(struct seq_file *m, void *data)  {
>>>>    	struct xe_device *xe = node_to_xe(m->private); @@ -67,6 +74,7 @@
>>>> static int info(struct seq_file *m, void *data)
>>>>
>>>>    static const struct drm_info_list debugfs_list[] = {
>>>>    	{"info", info, 0},
>>>> +	{"is_gucpc_supported", is_gucpc_supported, 0},
>>> Above debugfs is per device.
>>> We need this debugfs for each gt.
>> The field skip_guc_pc is device specific so kept debugfs device specific.
> That make sense but then it is better to have a print in existing info debugfs
> as this is filed in xe->info ?
>  From igt we can grep the skip_guc_pc either "Yes" or "No".
> Thanks,
> Anshuman.
> 
But shouldn't this be under gt0/uc/? if its named as guc_pc_supported
or instead should we have something similar to i915 gt0/uc/guc_slpc_info?

Thanks
Riana
>>
>> Regards,
>> Badal
>>> Thanks,
>>> Anshuman.
>>>>    };
>>>>
>>>>    static int forcewake_open(struct inode *inode, struct file *file)
>>>> --
>>>> 2.25.1
>>>
