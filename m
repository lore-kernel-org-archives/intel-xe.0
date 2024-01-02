Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 184E4C46CD2
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jan 2024 10:49:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE09710E0BC;
	Tue,  2 Jan 2024 10:49:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE3810E0BC
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jan 2024 10:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704192580; x=1735728580;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ZQ0dolDn9CuneNHA/cWWVDSJxQJ/myEuXUvmCOelnmI=;
 b=RsZACRbOooAU7yglWL/o6XrKC0+nlWMN5VomCfSrxq7oRcUvMjJDWBJ3
 GhZW1hE8KIYm52sj7rJr3Y7t7ntHWfoDmAtB3N6qn+knmfm7A2+v59L6+
 oaykrr3EsQRrB/Ejw3hvhPLf5+ugQLs88wnjOOKRSSJ7iVphJaSq02gZw
 KHs9kTy5+kjfc4JnzhC+x1kc2VTnWssLfGEufFpgde0aqMMRtmasRocHP
 Yan9QIDFL1Fajz/giAH+TiB382PGHGPVvtU/SfUspa9bL1TWjB8GSToBR
 p7qFvq/bIHQzkFKmpoag7lCDAcrtVVUY6UcKUf8wTzcWYHytvN3k27VB0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="377023410"
X-IronPort-AV: E=Sophos;i="6.04,324,1695711600"; d="scan'208";a="377023410"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 02:49:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,324,1695711600"; d="scan'208";a="28037411"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jan 2024 02:49:40 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Jan 2024 02:49:39 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Jan 2024 02:49:38 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Jan 2024 02:49:38 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Jan 2024 02:49:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WnUTleAGpi8MqKPMLCPJKkZLqPTLPYXY0U522CIHVl+AxV4hy0qPx02kXe75xMis9SnHQl1PvSj5GvtzJE78w58jnnyZL/gD0Jm+DHG5CBZwPMUnlHKU7uQipLwf7eKpX7EkvQYjHOI7Z4cKvnFxiT3g1cG9Ps43rAXkDRtoElfVkH0fQG8YFOKdMGgKTOZKJ/XmUwZamA1RgpQUXM0lzVGxOV8ohisUPPwnRwGGH7/vYR3/l3aEEdWfbeAuVK3fOPRbwKoRPtIyqgT4cgN31QbodRTphSWg04HhPAqxIfjcW7QMYjdNwwCxQDlJUT4pc94VPhJNhWJZVitdt6AAsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fRnBUTWv2LX62bSupV9uCOLCukbY+JyioCGbHT6rNJw=;
 b=EyctpI0EBKu/yenP8TZZMwtda6e5zbmm3/iSE8tGkqWIqETZZ0vmsXWjsuwxLJwsgu5flJ+/QNTLCfhXK6NfDGjZ0Xcv8mbbwugX1T+MoxTSrU+ZHcnUpE5tmByV7JYT7xlsK+YsYZrlmVL6ty4R5tdjbC6isiESOWsF/IioAejovZo2mIAnjrUC+ngz5ciTilyJGarIUPWE5M0BvDocrxkP77J7vu2G6w+oc5fNwucGR+lrVMKwR6kjJbvGbcoBg16CmUbFjGxIntAOi6CATbyZawP1e6evz/8BsDHtzovFcUNmcCLj0Do+JwovQbRFyLNqjPO+49Dx5P26Ey/+cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH0PR11MB5141.namprd11.prod.outlook.com (2603:10b6:510:3c::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7135.25; Tue, 2 Jan 2024 10:49:31 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6%7]) with mapi id 15.20.7135.023; Tue, 2 Jan 2024
 10:49:31 +0000
Message-ID: <9fc522b9-4dc3-4fca-868e-bade09eb9df9@intel.com>
Date: Tue, 2 Jan 2024 16:19:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v7] drm/xe: Add vram frequency sysfs attributes
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>, "Gupta,
 Anshuman" <anshuman.gupta@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20240102052748.1598057-1-sujaritha.sundaresan@intel.com>
 <CY5PR11MB62112ED786C7B196DCF70BF79561A@CY5PR11MB6211.namprd11.prod.outlook.com>
 <c1086ea1-eeda-434e-8627-b28103eaa3be@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <c1086ea1-eeda-434e-8627-b28103eaa3be@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0014.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::23) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH0PR11MB5141:EE_
X-MS-Office365-Filtering-Correlation-Id: 64f20aae-4e89-4d8e-e199-08dc0b807fc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R5SBi9Wa3PwN+LwKD6eC0QfHE6YLz23VRLj4v9TKNd7ElwIxOOV0R5ltg9n3ps7XPP9i9KqhUCvw3o31dBEmSC8NcMA/DeD0I7FD9NOtUfB3UQ77Dc8GuEj5XKTDVf4CLd/4WhVHAJFMc54oOXR/Z57OA8kFZQmdEgU7pJ/piW5VlN+DZI28Nf5ukVK9v/WVHq9Q0muTvxWcez7u7MqWtVfOWGeoHkV8qYVoTEJ2nmKzmx0jgPH7q5k/2bBTsODJTua7UkmkpnsH0I1Rly7K6OV80m2Tq0ux6BV/zeR0cbg1z/ZTN1KePHiyzWVkJadiPWkQ5r2VIao6DxLJ7xXVvWBb+oELQ1dzUgYGKgczTLIAFoPQI7eaj7gJugE8TeDuV+CKsfqqN6Vz57xFqYR58zE+jKB1JKJ9qduAUTlwEbSQUYXQCa21XM21eAxT/6h2a0p/y9S9Gs9iDlxrvZN1JxkdqWTLXSvUZNDDGbrb9ta2W7T3Lh6hMHvTr+wAq5Sl8N2DCoTFEEGSoE0bKf8hN1NHCsp2NNCZkPfE3444Nz6ALcx6s1YKwXLY8136Eqw7g3mpY/+s5zKX7rJl/4Zv8Xk3hEGsy09GE7qxFkadCLKS7O/TbNxfjZkdQyZqCyLmOwsoNyhq3f5P24eg1cwAKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(346002)(396003)(376002)(39860400002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(6486002)(38100700002)(478600001)(2616005)(41300700001)(44832011)(31686004)(36756003)(66476007)(110136005)(316002)(31696002)(86362001)(82960400001)(66946007)(66556008)(6506007)(6666004)(26005)(83380400001)(6512007)(8936002)(8676002)(53546011)(2906002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVQxL0owdS9Dc3lrcFBKUW5zL2dQOFNMbmFXZ1Z6R1JrUjFlOEFtSnUxd2hB?=
 =?utf-8?B?VXQrMXV0YUUzVUtkYTNMVHlTZE1HSXoyMGNNazdCV2E0YkpCa21lcDd5YWVj?=
 =?utf-8?B?SjRZYWRoeE01bi95b2tEbEJNR0g4TDlJNlQ5WjNxdjNsWmZQK3Vqa3J0eGtM?=
 =?utf-8?B?eHdySzhsRWpiY3doVVY0SlVFb2hxRTA5dGdsa2o5VW5MdFVuVGtkK2cvOG55?=
 =?utf-8?B?ZTVjWFM3c2FzN21oS1Z2bWtOR0p3a01zVW9pQWc0UlRxMXBHNWJPKzBVcTBH?=
 =?utf-8?B?WklpbGpRckpRNGJ3Y3dDODN1U0svdHZKcUg2cG9ZY1BsSTUwRUpkRmwyczMr?=
 =?utf-8?B?NEhJMEMxOUptZFJ6S0kxZERsc2lncWprK2xzQjdUU044QWhTUjBDK1RoaERv?=
 =?utf-8?B?eFV4VDArajF3aDAwbUZMWXM2OWhXT0xuS3BnQzFGbnhPY1JEVkNidDNHd2pB?=
 =?utf-8?B?c01qdllPVG02UmpBYXp6aEdYbWd0TnFkVkIvMnRYcXB2S3RTQTRxOFp4eDQ3?=
 =?utf-8?B?S3Z4QmhYTGI1a0pNSklnVmRrNk1DQUIvdk8rajhZZFMwOXhuRnMwSndOc3lJ?=
 =?utf-8?B?MlZMWTFIUm5YUHg2aHprU2VmT0o3MXZQbHhMT0tWN1lVSXREQjU1bk5WMXVo?=
 =?utf-8?B?aGkrRGhOMEs1Ri9WNFVBL2hiaG1NMFRSVEtub1JUSUJoNGdEU2VZZFVhUzRP?=
 =?utf-8?B?TEFhcHYxeFRIeloyOEI3dFFGMStDL0VacG9nV2FUUjN3ek93RnlScGdXTUNL?=
 =?utf-8?B?RTVlU2ozaWxDSzBuQnRGZzQwd1BOdjgxRDZHOEhndWR2Wlh4bDZxVDhra3hs?=
 =?utf-8?B?V0xROUFZSnJuSkJjYjFIeGxobXl5YXRwWWs1ZCtJbXFKVjVRUytXWnFHN09l?=
 =?utf-8?B?bW9uYnMyTUd0YkltSWlQcDRYVG9YMEZYSWZsMDFzaElnb3dlTktHL0NkZ1lV?=
 =?utf-8?B?c01MQTh2SUhMbkp0eGZWb3pXc1VneWl5WFpjK1BDWjZTRVA0YnkvdktxbmNL?=
 =?utf-8?B?OGJnRmdjdXJKWmZnRmdHSmsvMHdVZUJmNWo3aFpnRnRLNFBiUGxCb3hBRFB4?=
 =?utf-8?B?WnJ1ZnhlOGNIeVdObFFDYnBKa1ltemF6eGNvMGRxRWlDTkpncGxnNzZNYTlz?=
 =?utf-8?B?aU5XZ1QxeVFFREZzdTFJRlVMUFRjR1pQeGw2K3NEY1BPbitFYW1aMVV6RlRN?=
 =?utf-8?B?NEpSVzRndytpM01BMTk2aTZTRTBZMDBhUGhLZHU3L29tV2VSSDQxcElnMlMr?=
 =?utf-8?B?RVl5ZTIwZllwK1MxaW9rRXFsYm9GdHIxaVNDM25Dc2dsV1Z4aEsxRFcxN3Ax?=
 =?utf-8?B?SzhIYzdoYm9aKzJTS2dCUmNoV3lJRG9NcGE5SW1tUGpmOFV3UzRwRVBBWGpB?=
 =?utf-8?B?T0pxWnJsdytNNnhqS255V2toa1BhaE05dDF6UmdlYXlGaEczMFFuS0EwaDdU?=
 =?utf-8?B?VG54QmgxVlRleS9QblpaR0hjejgwSjUyWWZlemF3dTUxNGdDeFhNNTNrM1l1?=
 =?utf-8?B?aWtpQjRvOHFFWDdUMGcvU1JYWUVydldWa1FJS0RiMDhhYXlDSGxGbDVmNnB0?=
 =?utf-8?B?cEFyRGZsSjcvak9ScHoxbDZCNlEwSkZGT28zdXpHSWNtcXRPaUFKbEZ3Z3ps?=
 =?utf-8?B?ZFp4T3RmNmlndXFCa1BjWFJQUGtFRlYxY09pZjBUdXFMVmVsK2hiUEZQNmtl?=
 =?utf-8?B?WndBeXpORkVsQ2dHR2ZJN2JnS1hReitUcHViZ3M1MUEvS3lZSVBsYkt6MDh0?=
 =?utf-8?B?QW1mODJmc1RTaUw1V3Uvc0ZrclRIc2NOWjBCTjkzWDBIR1ZFS3NnSktJSmFF?=
 =?utf-8?B?bDFWSFdORDFwZ0xsQllPVUFzeTlYaDZzWW9Sa3gwWWp6R2svbW1vMmxVK2ZS?=
 =?utf-8?B?ek03UDk3YmNPd1ZSb09weThtUHBrVTJ5ZGlrUVJBLzkwV3pyTlA3STNpZTNs?=
 =?utf-8?B?U3hYZHM4eFF0WFZYck9lNkFrQmthb2ZPTkpVMk5Ib0RTUWtOcTd5cHF0MUx0?=
 =?utf-8?B?OWtjQktTL0JiZjNsZnc5NWFPdDJKQi9FY2lUazdLY1dvOWNEV2NodlNhc0hL?=
 =?utf-8?B?VTZhSWJsbER5bDk3Y0NUUjlFSDlBUnI5dnVzWjNqV0Z6aTdGaW50VGdCWXBz?=
 =?utf-8?Q?W906n4RVfD24pgWwvAnieO/w/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64f20aae-4e89-4d8e-e199-08dc0b807fc8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2024 10:49:31.5912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LvtpOAIepVWg++GT4wjvZeRfe4qHEZej22CdXV6bl+Gd04nGjp7qh7ezDPTO4tU3oEIZTd6JEHhFAE6w+YXZXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5141
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


Hi Suja

On 1/2/2024 3:48 PM, Sundaresan, Sujaritha wrote:
> 
> On 1/2/2024 3:39 PM, Gupta, Anshuman wrote:
>>
>>> -----Original Message-----
>>> From: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
>>> Sent: Tuesday, January 2, 2024 10:58 AM
>>> To: intel-xe@lists.freedesktop.org
>>> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Sundaresan, Sujaritha
>>> <sujaritha.sundaresan@intel.com>
>>> Subject: [v7] drm/xe: Add vram frequency sysfs attributes
>>>
>>> Add vram frequency sysfs attributes under the below hierarchy;
>>>
>>> /device/tile#/memory/freq0
>>>             |-max_freq
>>>             |-min_freq
>>>
>>> v2: Drop "vram" from attribute names (Rodrigo)
>>>
>>> v3: Add documentation for new sysfs (Riana)
>>>      Drop prefix from XEHP_PCODE_FREQUENCY_CONFIG (Riana)
>>>
>>> v4: Create sysfs under tile#/freq0 after removal of
>>>      physical_memsize attrbute
>>>
>>> v5: Revert back to creating sysfs under tile#/memory/freq0
>>>      Remove definition of GT_FREQUENCY_MULTIPLIER (Rodrigo)
>>>
>>> v6: Rename attributes to max/min_freq (Anshuman)
>>>      Fix review comments (Rodrigo)
>>>
>>> v7: Make docuemntation more verbose
typo
>>>      Move sysfs to separate file (Anshuman)
Separate file will not be needed if drmm_add_action_or_reset is added
similar to the file xe_hw_engine_class_sysfs.c
>>>
>>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/Makefile        |   1 +
>>>   drivers/gpu/drm/xe/xe_pcode_api.h  |   7 ++
>>>   drivers/gpu/drm/xe/xe_tile_sysfs.c |   3 +
>>>   drivers/gpu/drm/xe/xe_vram_freq.c  | 127
>>> +++++++++++++++++++++++++++++  drivers/gpu/drm/xe/xe_vram_freq.h
>>> |  16 ++++
>>>   5 files changed, 154 insertions(+)
>>>   create mode 100644 drivers/gpu/drm/xe/xe_vram_freq.c  create mode
>>> 100644 drivers/gpu/drm/xe/xe_vram_freq.h
>>>
>>> diff --git a/drivers/gpu/drm/xe/Makefile 
>>> b/drivers/gpu/drm/xe/Makefile index
>>> df8601d6a59f..17884e422cec 100644
>>> --- a/drivers/gpu/drm/xe/Makefile
>>> +++ b/drivers/gpu/drm/xe/Makefile
>>> @@ -139,6 +139,7 @@ xe-y += xe_bb.o \
>>>       xe_uc_debugfs.o \
>>>       xe_uc_fw.o \
>>>       xe_vm.o \
>>> +    xe_vram_freq.o \
>>>       xe_wait_user_fence.o \
>>>       xe_wa.o \
>>>       xe_wopcm.o
>>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h
>>> b/drivers/gpu/drm/xe/xe_pcode_api.h
>>> index 5935cfe30204..f153ce96f69a 100644
>>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>>> @@ -42,6 +42,13 @@
>>>   #define        POWER_SETUP_I1_SHIFT        6    /* 10.6 fixed
>>> point format */
>>>   #define        POWER_SETUP_I1_DATA_MASK
>>>     REG_GENMASK(15, 0)
>>>
>>> +#define   PCODE_FREQUENCY_CONFIG        0x6e
>>> +/* Frequency Config Sub Commands (param1) */
>>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0    0x0
>>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN    0x1
>>> +/* Domain IDs (param2) */
>>> +#define     PCODE_MBOX_DOMAIN_HBM        0x2
>>> +
>>>   struct pcode_err_decode {
>>>       int errno;
>>>       const char *str;
>>> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>> index 0f8d3e7fce46..ed60d12f5cf0 100644
>>> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>> @@ -9,6 +9,7 @@
>>>
>>>   #include "xe_tile.h"
>>>   #include "xe_tile_sysfs.h"
>>> +#include "xe_vram_freq.h"
>>>
>>>   static void xe_tile_sysfs_kobj_release(struct kobject *kobj)  { @@ 
>>> -50,6 +51,8
>>> @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>>>
>>>       tile->sysfs = &kt->base;
>>>
>>> +    xe_vram_freq_init(tile);
>>> +
>>>       err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
>>>       if (err)
>>>           drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed,
>>> err: %d\n", diff --git a/drivers/gpu/drm/xe/xe_vram_freq.c
>>> b/drivers/gpu/drm/xe/xe_vram_freq.c
>>> new file mode 100644
>>> index 000000000000..166d41a6b222
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_vram_freq.c
>>> @@ -0,0 +1,127 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2023 Intel Corporation >>> + */
>>> +#include <linux/sysfs.h>
>>> +#include <drm/drm_managed.h>
>>> +
>>> +#include "xe_gt_types.h"
>>> +#include "xe_pcode.h"
>>> +#include "xe_pcode_api.h"
>>> +#include "xe_tile.h"
>>> +#include "xe_tile_sysfs.h"
unnecessary header
>>> +#include "xe_vram_freq.h"
>>> +
>>> +/**
>>> + * DOC: Xe VRAM freq
>>> + *
>>> + * Provides sysfs entries for vram frequency in tile
>>> + *
>>> + * device/tile#/memory/freq0/max_freq - This is maximum frequency. This
>>> value is read-only as it
>>> + *                    is the fixed fuse point P0. It is not the
>>> system
>>> + *                    configuration.
>>> + * device/tile#/memory/freq0/min_freq - This is minimum frequency. This
>>> value is read-only as it
>>> + *                    is the fixed fuse point PN. It is not the
>>> system
>>> + *                    configuration.
>>> + */
>>> +
>>> +static struct xe_tile *dev_to_tile(struct device *dev) {
>>> +    return kobj_to_tile(dev->kobj.parent); }
>>> +
>>> +static ssize_t max_freq_show(struct device *dev, struct 
>>> device_attribute
>>> *attr,
>>> +                 char *buf)
>>> +{
>>> +    struct xe_tile *tile = dev_to_tile(dev);
>>> +    struct xe_gt *gt = tile->primary_gt;
>>> +    u32 val, mbox;
>>> +    int err;
>>> +
>>> +    mbox = REG_FIELD_PREP(PCODE_MB_COMMAND,
>>> PCODE_FREQUENCY_CONFIG)
>>> +        | REG_FIELD_PREP(PCODE_MB_PARAM1,
>>> PCODE_MBOX_FC_SC_READ_FUSED_P0)
>>> +        | REG_FIELD_PREP(PCODE_MB_PARAM2,
>>> PCODE_MBOX_DOMAIN_HBM);
>>> +
>>> +    err = xe_pcode_read(gt, mbox, &val, NULL);
>>> +    if (err)
>>> +        return err;
>>> +
>>> +    /* data_out - Fused P0 for domain ID in units of 50 MHz */
>>> +    val *= 50;
>>> +
>>> +    return sysfs_emit(buf, "%u\n", val);
>>> +}
>>> +static DEVICE_ATTR_RO(max_freq);
>>> +
>>> +static ssize_t min_freq_show(struct device *dev, struct 
>>> device_attribute *attr,
>>> +                 char *buf)
>>> +{
>>> +    struct xe_tile *tile = dev_to_tile(dev);
>>> +    struct xe_gt *gt = tile->primary_gt;
>>> +    u32 val, mbox;
>>> +    int err;
>>> +
>>> +    mbox = REG_FIELD_PREP(PCODE_MB_COMMAND,
>>> PCODE_FREQUENCY_CONFIG)
>>> +        | REG_FIELD_PREP(PCODE_MB_PARAM1,
>>> PCODE_MBOX_FC_SC_READ_FUSED_PN)
>>> +        | REG_FIELD_PREP(PCODE_MB_PARAM2,
>>> PCODE_MBOX_DOMAIN_HBM);
>>> +
>>> +    err = xe_pcode_read(gt, mbox, &val, NULL);
>>> +    if (err)
>>> +        return err;
>>> +
>>> +    /* data_out - Fused Pn for domain ID in units of 50 MHz */
>>> +    val *= 50;
>>> +
>>> +    return sysfs_emit(buf, "%u\n", val);
>>> +}
>>> +static DEVICE_ATTR_RO(min_freq);
>>> +
>>> +static struct attribute *freq_attrs[] = {
>>> +    &dev_attr_max_freq.attr,
>>> +    &dev_attr_min_freq.attr,
>>> +    NULL
>>> +};
>>> +
>>> +static const struct attribute_group freq_group_attrs = {
>>> +    .name = "freq0",
>>> +    .attrs = freq_attrs,
>>> +};
>>> +
>>> +static void vram_freq_fini(struct drm_device *drm, void *arg) {
>>> +    struct kobject *kobj = arg;
>>> +
>>> +    sysfs_remove_group(kobj, &freq_group_attrs);
>>> +    kobject_put(kobj);
>>> +}
>>> +
>>> +void xe_vram_freq_init(struct xe_tile *tile) {
>> Please provide a kernel function doc for this exported function.
>>> +    struct xe_device *xe = tile_to_xe(tile);
>>> +    struct kobject *kobj;
>>> +    int err;
>>> +
>>> +    if (xe->info.platform == XE_PVC) {
>> Drop these platform checks(including below ones) , instead use a early 
>> return at starts of this function.
>> If (xe->info.platform != XE_PVC)
>>     Return.
>> With all of above comment.
>> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> 
> Will make the changes. Thanks for the r-b.
> 
> Regards,
> 
> Suja
> 
>>> +        kobj = kobject_create_and_add("memory", tile->sysfs);
>>> +        if (!kobj)
>>> +            drm_warn(&xe->drm, "failed to add memory
>>> directory, err: %d\n", -ENOMEM);
>>> +    }
>>> +
>>> +    if (kobj && xe->info.platform == XE_PVC) {
>>> +        err = sysfs_create_group(kobj, &freq_group_attrs);
>>> +        if (err) {
Need kobject_put here?
If there is failure in creating freq attrs, memory dir will be empty.
Should be removed.
>>> +            drm_warn(&xe->drm, "failed to register vram freq
>>> sysfs, err: %d\n", err);
>>> +            return;
>>> +        }
>>> +    }
>>> +
>>> +    if (xe->info.platform == XE_PVC) {
>>> +        err = drmm_add_action_or_reset(&xe->drm, vram_freq_fini,
>>> kobj);
>>> +        if (err)
>>> +            drm_warn(&xe->drm, "%s:
>>> drmm_add_action_or_reset failed, err: %d\n",
>>> +                 __func__, err);
>>> +    }
>>> +
>>> +}
>>> +
>>> +
>>> diff --git a/drivers/gpu/drm/xe/xe_vram_freq.h
>>> b/drivers/gpu/drm/xe/xe_vram_freq.h
>>> new file mode 100644
>>> index 000000000000..94b04178a798
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_vram_freq.h
>>> @@ -0,0 +1,16 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2023 Intel Corporation
2024
>>> + */
>>> +
>>> +#ifndef _XE_VRAM_FREQ_H_
>>> +#define _XE_VRAM_FREQ_H_
>>> +
>>> +#include <drm/drm_managed.h>
>>> +
>>> +#include "xe_device.h"
>>> +#include "xe_tile_sysfs.h"
unnecessary headers. Use forward declaration of tile

Thanks
Riana
>>> +
>>> +void xe_vram_freq_init(struct xe_tile *tile);
>>> +
>>> +#endif /* _XE_VRAM_FREQ_H_ */
>>> -- 
>>> 2.25.1
