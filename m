Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98AE7C44508
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 13:14:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B83F10F04F;
	Wed, 15 Jul 2026 13:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GyB3Lac6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CDE810E1A2;
 Wed, 15 Jul 2026 13:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784121283; x=1815657283;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5O/N3+8Fdsy9MdgRgQCCkOueXY1w/648owj0aoxGCJU=;
 b=GyB3Lac61BLisgXPmS4goV9ZqSRj8ZH1HIvYk60bDr8hzrKdeLn0H77R
 Kz3jhm50cl5hlggACh1cXXHuM1Yjs7yLFHlYVlNmsXxP6wAvQycBfjkbg
 YVRKVP1ImXbxVbjrQWVEyjFY9YjDSfYZE2XqKTk5kw+KdLPT39ugCrz/i
 7BShyGUeIcfh8/jQ7izHTLFOfReXPO00UDz0mclQcCkqWMh5XMLGzR9+q
 VeWHQbmwXUwUbvsRW5tnkFaTIYKNFG+w4KNhDrFPrJyQyomUNBIcOJP3f
 KGa6reccKYSvFQMmZm8UbPMd1pZZkIFkVUGRDlBFjPnXeV9275r3ik4QC w==;
X-CSE-ConnectionGUID: 2ebys6hFT1W6udSkavQ/TA==
X-CSE-MsgGUID: FGaDBbgWRvuZBSvhwSrhpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="95403876"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="95403876"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 06:14:43 -0700
X-CSE-ConnectionGUID: 3CCGh9ytSbiIVfhs8d0MXA==
X-CSE-MsgGUID: LFX+O/6mTnaFtAO4iADw5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="258138437"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 06:14:42 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 06:14:42 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 06:14:42 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.66) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 06:14:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RRvM/MlxxURmFbmnhNksievNJraFHtnslzztoWrcITtuLwsmXlPH4YEzrBlfLghiNXi3YEcz4GxbN/g7Z9JEf28zKLIjU/zvC8Ac/Bnz+r6ezw9UNGazJ8cu+Rm7OqMqzF/g4GtNxNDTrajELkfi+0rHfDOwKhlcLKZFqjYtpZwU3M80XBrRUri3+d6LclZ7TH6oYCqiXx6wTPmO+zntx5Ua1SnLPh0uUR5a3PWKZQlcOAx3kuCspwhMqf26zIPXwS4Tcbha7Upyb/Y2UYBaZdaP9K8sbbjrw+hNsnOMUOgfbCBghCWTTijGW5LFNpyWdzUnRz31e1mGLWZ1Y4/Xkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kix/LAgMXodQl5XVjSZdJpT8IvXD7Vqcwbj/UKBu4Kc=;
 b=iqjba3quee1kCYBL+rYNfvyhc8rWWfH2xEXpw/5AT2U0oCmfWJPkxrsGpv/TEAk8xT3FQ4OrB1yImROslgb3bXdzjj/sqEh6b2gMD3/kJ9HqZPpUnUuDO5nEoDOHU/CVWGg0xnM6Z/mnvqRsMjR3ukb+hoiFSywgYHA+BYwAdWUNHZQJjqB4PXw3vKzGVT3QebUNUyFXp9+OBmgyPV6AbfnmeppMVj2U5CpgsHk8gHA43nfyhX5W+sRjxjjUIlEcaKY5R7AdrhrLUwQ2hMpGO/E2AvrJTUPQL4iVrq+ul6K9WRwvUdaqGW01PdUIgzWooax/5VlxZhLz+YvHiE4QAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by SA1PR11MB5779.namprd11.prod.outlook.com (2603:10b6:806:22b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Wed, 15 Jul
 2026 13:14:39 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 13:14:39 +0000
Message-ID: <3e1a9201-2ba4-4247-a38b-c23e7ad76388@intel.com>
Date: Wed, 15 Jul 2026 18:44:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] drm/i915/vrr: Dump CMRR state in the crtc state
 dump
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, <uma.shankar@intel.com>,
 <ankit.k.nautiyal@intel.com>
References: <20260714103938.2371448-1-mitulkumar.ajitkumar.golani@intel.com>
 <20260714103938.2371448-5-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260714103938.2371448-5-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::7) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|SA1PR11MB5779:EE_
X-MS-Office365-Filtering-Correlation-Id: f771337c-c8e8-4b0d-1c4c-08dee2730670
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|10067099003|6133799003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: hvrOIt9gblNC6woYk1se6D2sDlQJVatmrl8n7FNbYvfuL/66yKkFYyI33O4XWx+pmvGxjvSCJiewG/UU6tHcblaw4PPn9QpPN59TrKOOl7HK0fnQxAwiivEuvXy3CSETSsddsXg2+Tdd3zt/OaLc2xescSE62AtEQ1ikaEXJIZM8+EjFJJd6ZsoaME3ssfeax0ALafQgIhRxks/n0nUNsJ11YVozNbf/ec+I3BQAI6+Adn5l+9Fd9P0BChPjdtJNIZ8S2pMYKxyAFLZzqs8AWhJGKE3O9EhheswxAkIDXXiArS+n/ArdDslmqk0MClEageiG364hBSUJvNXcDzFLhNHCftYJQUK7DkM7j0L9cN3e0XVE+QwoDc8f8z+klJrg+U/zgzIcdnYsR2gfq+n8YU1g3/u+/JKSJ1goKfCOCfVFr8ljxpSycMROi53drGwlUG8ssdlqD13WHsVtAaoXDEcnspjavUullgQlNcwZ5xwc2brS860C4ol/5sHbnIbLrwHL5gV7JKVbKbU/7TCUXKTox1UfbiS7SopzUv8vQTVpeeCp5kfKFQd/ZgbVeuDkwNOD2wh1f0kfo8Y7v/fPdcQCdMaH0zl7fkdEiJRUdj6zljthTk3Xnetv5zGla7SS6VA1EZplsQKuCtLCKInda2yFelWtheZ1jThwjOJFBmA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(6133799003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2kycmI3aUdobFBZUE9hMnJLeUhIVVg3NVlJNGE0R2hoY0FrVkNrU0YrYnEy?=
 =?utf-8?B?UDJVNjZ4Zm14TzNsWGRDMU5zNmtBaFFGcEgrdHBMcU5VSVJ4a1A4MlBsVDUx?=
 =?utf-8?B?YzZjRkJOUHFxUlZxTW1ndGRHYVFKRFhXbkNYenNaN3N3QWdNYy9xcDdrY0Na?=
 =?utf-8?B?akVJUXgvczVXNVZhcFJ1K2syVGNMTVhkbUxyME5wK3BBYTZsclBHM2E3SFk0?=
 =?utf-8?B?MUN5VFhRMkFPeEVjOVVxVnZpMVNkZjlydm9VME4rN2VjNXVJalZDT0Y2czdi?=
 =?utf-8?B?UEJhZ2RzZDFwcUZ3VGhwYml4c0RRbmpqdFFzdUJ1UUFITzh3OGRqTW5XV1Iz?=
 =?utf-8?B?amJQZUNkTVZDamlrZEhRNGNMajVFM09yNWlTaWxGalJEMkRER3hZb2Qwc3U4?=
 =?utf-8?B?MXN5UnhTZ3hpa1hnU3hxd09Db09jM2xybTFQZXJsWXlwR1I4aGRnT2FrS2Nt?=
 =?utf-8?B?ajVnWTd5TDlSRzV6QlFoNy84Y2pEMzFPeUE4SWZ4RkpicjBLdytZRkFnL2Vo?=
 =?utf-8?B?amFOODhGT0doazg1NWRrUUNvbFlmT2UzWG1xSXEwVTRQSWhDeDB2WFVYYWs4?=
 =?utf-8?B?QkdKTGR4L3lpc3Y4ckNrdHo5dmpsOS9YeUo5WU5LeE5oL2JMR3l5M2x1czhu?=
 =?utf-8?B?ZG11MllmTm5DQmJpbUdpWVVmdlZRVmc1MG8ySnNsQXFma1UvRXFDemg3UExY?=
 =?utf-8?B?RUlpcDJRQUtydEhKNTZsczhXc1lDSVEvdXZMWlpEQmE0OGJXaFFyREJwRUR5?=
 =?utf-8?B?MlVKeFFrSWdpSHpIVS9ydkZCNE9Wd2g3Y0N1T3BVcFVNb0NXanMyRGNSbkND?=
 =?utf-8?B?bytxOEMvVzZxektYcStRQWxCQ2wySUEyT3YyWlBhY2QzZTBEQXQwdnNINEhB?=
 =?utf-8?B?QlBpL2J3ZS9WVUNoRkxSdjZWMjVmR0dhQTRkVkpWNGo2a0N4dnFHTjJQSEdw?=
 =?utf-8?B?NXRhc1VEZTJIdVFkaFJ1MTQ0VnJKL3pHS3FHLzI1cDUrRmNQMisyNkNwbFla?=
 =?utf-8?B?c2tXeWthcGxBdGtScVMyZlJzelZjVmFSbWNuTmxabHBJcngrM2lnVTh4SWVJ?=
 =?utf-8?B?OTY3RU9kVjgzTWhkSVpranZRMDZZMGdSOUE1c2IzVS92ME8xQWdPSXRMM1hN?=
 =?utf-8?B?M29ONERXVU5wSlErSXFWR3BsdlhpaDI4Tmxha3pNbHdvL0FQTy9RRU9FdW1T?=
 =?utf-8?B?YXJmaGpFa1pnRmxlTmhjSm5VYTNLK3lTVUhZbFFONmZvcHJnQVNRbURGSTAz?=
 =?utf-8?B?NmhZSVJ5K0N6OUpBanNHdXJOYVF6am9GOHZDMXpkQTRTcFZJUFJUOTdkZHo3?=
 =?utf-8?B?RnZLbC9raEhYME9LeE1NQ1JGRFIzalBkdjRkeU5DUzFXODBYaDB1RDlpT1Nk?=
 =?utf-8?B?eFlRRmdMN3FVUWt2dzFBakZEdU5WaUdtSHFFdWFkZVp0R0I2aXhvM0FLSDFO?=
 =?utf-8?B?MzBRczMvOFliWFVNeVlLV3JuQ29sVkYrWHpabXlFS01kQjJOUTh6Q0JDbmZW?=
 =?utf-8?B?L3VaYzF2NDYrb0pzR21HTHYyc0dQR1Q1OXd4UUVycUMzZmRsdjZkKzRnczgz?=
 =?utf-8?B?WExnYmNUL3B1cXk2cE5zYlZoRkd1dFVvaWdSOVlEQ1pMMnBwZ3h0cHhaSzNX?=
 =?utf-8?B?QW12R00zZjBTV1lGY1ZBREh4MEJzb0Q2SUxmSElCc2J1NzNzaUxQa3AwUVla?=
 =?utf-8?B?VGx4ZzN2QURkWTlQTDdBZmpRY1VSZ3R2eFlibTViUksxVGlNdHF4SVJWNU1w?=
 =?utf-8?B?UmRXWERNTUs5WnpNazBoaWxaUVJYMkZqbCtWeS9JVXVaVFFSd3p2Zkp1RjBE?=
 =?utf-8?B?VlRjbWVWc3hhMWZBcWhoaExVbVpTOWJ4R0tKWlZyMmpSSlFPT1RSYXlJdzhj?=
 =?utf-8?B?bU02TnozV0VCa2x4eXpFejcxazVYbGd0c29ZWi8vMU9lUmRMZXFWek8zSE5z?=
 =?utf-8?B?SUtvUk9yQ3luWitpWU5uVGJQT29lNEtTWTc3MTNoMzhkL1FQN25zZVdDQVRi?=
 =?utf-8?B?eTNuSFpFR1VHZXoyTHNwcUIyOXBURDVyQVJlS0p0UzQ2bFl1RDcyU2MrUUpi?=
 =?utf-8?B?RURtYVJLNGdlcmo1ejdLV2xoT2ZwLy9pZ1pNS3Y2WHdUZXMvOHF0eUJQNEcv?=
 =?utf-8?B?QmFDcHh5T1ZDV2Fnd2EzUlM5OXNYNFZYekVjK2MzZm1zQTd4bVp0dHpxWDNZ?=
 =?utf-8?B?UThPaE9LV1BGcEU0QThRMXNRQXFyeGNReGlOODZNc0hFMG1vam1Va0pseW9Z?=
 =?utf-8?B?Y2dUeWRFTkp4SnZHNXV3TlUrQ2RtZ1NUeFdBeGdnWVVIOXE4aWYzSk5Hcnpu?=
 =?utf-8?B?cUFkKzltL0dsb1RYRk1rTVRGNXk2T3NiSE4xTEg4L3ZvbmhUL1lPUUZvZlhY?=
 =?utf-8?Q?NVyXAzEOs9IZAqK5qV7ggJ+NAvN2WogGoS+fu?=
X-Exchange-RoutingPolicyChecked: DT2DoRHe6R8Pz6UMOgdmVn9i1Eu+i3eSrrlKHUmNG+/MZN/dfzyzL/zrXowkd/6QUhHXjwv1Y1zJsz+vCXjSmm9BXKHLi8RxaDt6aoHZjKIQ90Fv7kIQuG+nRa21iCDkLSR8g4lAVBklGMONRh7xp2vwA7LhyujBRrerV05B7KXTjGAvC3rUQ8olojtwH1VG7FlPpMI8DhgDupgiEzrJxZGuT7BdKU7xlAp/JfkAlouFlTA4iqY17i2gwQcSnKaue97gw9stpHrTkRFvezClNEegFGgUf98V96FRYWk7eMZAqCpJvC65UY1mgmDe7P2UPNXSzO6Suc8tAhWJ755JGw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f771337c-c8e8-4b0d-1c4c-08dee2730670
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 13:14:39.1157 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sIB6Smz7NIVnibkXXZpVnZOVZV/h1PrhKaXQB99xz4NigXCw59HwBb2+jqdTtww9QWqqaPHV47QdkKkQamu3R1nFSBl9Ot1f2kZDlAoZ04k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5779
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



On 7/14/2026 4:09 PM, Mitul Golani wrote:
> Add crtc state dump for CMRR.
> 
> --v2:
> - Remove video mode state checker.
> 

LGTM
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_crtc_state_dump.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> index 4493483f10a9..ad4f362e0c09 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> +++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> @@ -311,6 +311,9 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
>   		   pipe_config->vrr.dc_balance.max_increase,
>   		   pipe_config->vrr.dc_balance.max_decrease,
>   		   pipe_config->vrr.dc_balance.vblank_target);
> +	drm_printf(&p, "cmrr: %s, cmrr_m: %llu, cmrr_n: %llu\n",
> +		   str_yes_no(pipe_config->vrr.cmrr.enable),
> +		   pipe_config->vrr.cmrr.cmrr_m, pipe_config->vrr.cmrr.cmrr_n);
>   
>   	drm_printf(&p, "requested mode: " DRM_MODE_FMT "\n",
>   		   DRM_MODE_ARG(&pipe_config->hw.mode));

