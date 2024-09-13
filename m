Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9D1FA3753
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 13:32:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3BE10ED18;
	Fri, 13 Sep 2024 13:32:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BrI607O0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 659C710ED1D
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Sep 2024 13:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726234320; x=1757770320;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=04Ha+wlFrD3Vbw847WD7A/YAbfygiUMzqM1UDs8jrB0=;
 b=BrI607O0UJOK44mxPnhDl8MK8tif4Yn3P6AR8V/puQPP6ATOuH+H0gaZ
 6s5ORqWDMyBAsuKPeb8vNSRqrDTpwXwBYdnEjDBICrI9zYUtvh3vQrV6q
 wJ3rqXRwW2YrQ23wLDuq9ZUVSVb6WmxbqzrjtGyHX+rWssnu10Y8n5OHe
 /aMKzAKrZ31Ik0QmtkKNW3FoMPsivSFAPyC9gclLtkzFqfnUt5VycZuGg
 mP0WF3kJp2La/+kfdmljNNl7eG356uB0LOVRWiTYG0OIJsKayHzRCeuWb
 hip+ixqH48hVfQZOnXhYsTvMKIBFRtgfliHyhxeZ8ppJmPAa2itMnVjN4 g==;
X-CSE-ConnectionGUID: AmxIGtEbRTWuNlHHndv96g==
X-CSE-MsgGUID: R4+MjcSMT4eiy9UT98wV/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="50547153"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; d="scan'208";a="50547153"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 06:32:00 -0700
X-CSE-ConnectionGUID: xfrl/7GATs2qsOv1S9yO5Q==
X-CSE-MsgGUID: EwMr4UqHRmKJvk6JOYGEjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; d="scan'208";a="68380090"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Sep 2024 06:32:00 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 13 Sep 2024 06:31:59 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 13 Sep 2024 06:31:59 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 13 Sep 2024 06:31:59 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 13 Sep 2024 06:31:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VI9XnEZn9MSs5tOp0lbjcM6RlPeVo283WYUmtOV66A8siDrp9BSA0EluDcznSLevRof+NnrA6x0Zw0+80FHTmS1npdDkKfX38OX7Mo9Fa27nFroUGV4jNSFv4MoK0pwpn/UN6sCK1w4psbzB7qO/XT5Dzt9aUZ/AFjWo8i1cum/clRp2e8PEef23vF3ZdM+bEhI3fDrPUnHcwd9qZgCV9NKJvWt+9nh4WcaLqledC+D+aq+7cQxKt3VmneXrx1sqM0ZNplGWLavaQEyE2z4BT114WSX78EYnfc5EEjGwBf7T8ubG4XWOVKsqjD8ytLZAGjG8N9pfTZD2XJUXbrjs4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LhyNZL3Th/euF5ZlQ9ueWaz3qZpt9ChT8wXppZ2Xusw=;
 b=Oewe70Zzqbn0RpK91mCP2bkaQ5Y8XLDBLKqZKdf6nxZUjFP6ZIboxe7rw0YrbpL2B8u+yIvUupi+8N0fTOtWMyD9rrHTUgsrV8mKoz4TXgmGanc/RpFGpwS9L7wYKRX55AW2sBzKWOq7hlUVK6fTfn4hiOSJ4NFXdByOMPOQ4045R0UPR0hG3i0X+rUNWZNp+UCqUvHTKFCbe35sytC38V8VUbzcJcLLVvoD/sg8Ozns6gkKXYwJSAkfO2JsHYzrUIv0bcCVMk85MwMdCb03N8EhaNrshbY4CqhYpkJZuT/6V3FF/PBoUvvWSHVtBG/fYVoP3qUcOP+Br0I1U0RPsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ0PR11MB4816.namprd11.prod.outlook.com (2603:10b6:a03:2ad::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.29; Fri, 13 Sep
 2024 13:31:52 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.7962.016; Fri, 13 Sep 2024
 13:31:52 +0000
Message-ID: <2d0ec8fb-1632-4e4f-a424-e53831c324d7@intel.com>
Date: Fri, 13 Sep 2024 19:01:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/23] drm/xe: Change return type to void for
 xe_force_wake_put
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Badal Nilawar <badal.nilawar@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, "Nirmoy
 Das" <nirmoy.das@intel.com>
References: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
 <20240912191603.194964-24-himal.prasad.ghimiray@intel.com>
 <126fdf77-e1b5-4db6-94fd-cb467971bd74@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <126fdf77-e1b5-4db6-94fd-cb467971bd74@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::9) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SJ0PR11MB4816:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b2a9f32-4052-4141-4076-08dcd3f86d69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VWNsUFAvdHo5VGpNYVBZaDdJMTdVTlo3SVBNbnFPMFBhc21sRjhEU1VzYURn?=
 =?utf-8?B?dlNKcytReEZyRlZyd3pIUVJoWUhIb0hDR3JDbU9IMXpyTTVhR0llWlUvT3ZR?=
 =?utf-8?B?TTljVUxDbFVkdW1xVkpkeUpmY2Z1SDIybjFtVmZFNS9BOWcrYVdWNTdTWFNr?=
 =?utf-8?B?aG9WMlJ1NFVoNjFwNUFiWW1PbnF0eXRKZU9kSElZNG1OY0NyZGlya1F2TXND?=
 =?utf-8?B?ZDE3NEdXOVpWMTFpYWZpY3ZJRmI4eVhCa1ZDdTFPbmhiV3lEd3RoSzFvWEJ1?=
 =?utf-8?B?QTJjb0lsL2d6dy9BRGo2eVhsVUFFeDhvb1c2NUhISk9UMHg0dzdsaXBsMWhX?=
 =?utf-8?B?RE9OM0xVeTdYaTJHVFMvcXVmak9RQ3Juc1Rpb3hrbVdGSTVmdFVYT0UzaFJ0?=
 =?utf-8?B?ZzNqVlhQTUpJaEl2RkpYd0c1bGZSZTZVMUpwbDNjOGZRNEdnNVdCT0Vzc0pG?=
 =?utf-8?B?TUkrcEdrWWdIQVdDS0RkbGZnaUp2VlNkUUJSQ1IyRWN6ZE56U2J5VU9JejlM?=
 =?utf-8?B?TEprcFgxMVoxNHByMVQyb1gzTGhFaHUvdUl4QTF5T0pqM3BVWFI3YkptS3dT?=
 =?utf-8?B?ZGhubkczQkZ6a3RWQWNDNitIb1QvVUdzT0dGZEplc2luK01uSVFpbUpnV3g5?=
 =?utf-8?B?ekxONStHSHQxQVJReXFOdUFmQVUzQ0kyRndRc0pYZ0wwZ0dYSjVYQXpSZzNY?=
 =?utf-8?B?dmVQRkh1c1BiRmJHZGQrbnNxZkhYbStZWllaemZOTldvZEUzYzhVM2JkNnk1?=
 =?utf-8?B?WGpQS0VPcjYzdWk2ditVeGZ1OUx5eWhZTTJYRE5HY3pVQm5xRVVMMTlNM0lq?=
 =?utf-8?B?aCtXSFV3Uy9tMVJhS3JGczhMNmdGOUpHNVZnbEs3MnFmVmtrQzFnQk8rTFJs?=
 =?utf-8?B?TldMaFRCYWFZY3IwSVRCSE5zNjhpaGVFUlI2TDhQY0hudmRZZ2tZdS9maXJ3?=
 =?utf-8?B?Nmw5dy9oU0daT0xuNjBGbXBJdUh1dVhHaTJ3S21sQmVDcFc4SzlTZEY4alZ1?=
 =?utf-8?B?REJVZitsejhnekN1RXE3ZGRtMWhyRmw1bGpnYzB2TjBCVEl2Nzd5L1lnM3Vq?=
 =?utf-8?B?SFJxN2swSVlueWVFaDhBMit1bUluNllkOFQyeTJHOHN4UWptK3BQT0cxVHoz?=
 =?utf-8?B?S2wzTkRpNzV1ZU5SbjBnTHJIU3NOalZxZGI5eWZiUHdXeUZTZVBhU1ZjNTVa?=
 =?utf-8?B?NzdGMlV0MVNFVDBkbzlob0lzSzk5RXRxd0pqbWZWR1IxZFpTN2JWbWI3M1kv?=
 =?utf-8?B?L3Y5LzB5UFFGNThHRXNpam9JT1ZNc1hqOXpNM2JLUTAyUjh2aWtIRlhPMTZ6?=
 =?utf-8?B?OW45dCtUR2VyU21BbXk3SHRnQVgySW1RemRDTy8zcUZiemJyRXM2MmFsU2pn?=
 =?utf-8?B?WUtyUHR4di90QVhRV2ZCSFJGRmFORmN3TnAyZUFBVXBUS0xGMzVGYlluL2d3?=
 =?utf-8?B?VHNWVVA3VEhadXMyZW5scGFNVjh4THlnNGlRYWdHNENvSDg2Y1lkdkQyL2Mw?=
 =?utf-8?B?SVFiNmR4MXJoRUdaTkJRK0hWQ21JUk9SdWhVRzhyclZmbzE1UExLVU1QWmlZ?=
 =?utf-8?B?VW5Ca2dMUVk5dVltZDh1cWIvVTZueVYyTU0rVzMzMTJOdjN1UzF6QlpNcE85?=
 =?utf-8?B?VjJhS0RBMWtDcisrU3daemFjMENqYlpYU21jUTkxVVI5bEtLRGN1ekNabnBR?=
 =?utf-8?B?blpBeTh4SkpXaW9qeTVjWTJxSW5SbGV5NUhoODNIeFV6TEY5SHdsN245YTN5?=
 =?utf-8?B?dWhaaytoUzROc09XVmhEeHRxYWxDZ0dGVDhvVmVrNmJwS3dtS2R2QkxFS2Iz?=
 =?utf-8?B?clNVUHVNb1piUWttaHhNQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEIwSHJPY1pPUVdBYTFDTzhRbnJNeXZPVnlGV1pLOXZ5R08zb1YvR0VOYzcw?=
 =?utf-8?B?UHJXUjdCV2p4TjNHckEybDllSmVCTlcvQmlNcFc3azJiR1A1Z0Y1Qks4UFRr?=
 =?utf-8?B?TW5odW90MVBSenFRUjk3WWNQOW1FazMrK2NIaEdGVG9BZ3M2L1ZTK29IMHY0?=
 =?utf-8?B?aG1nSzlGa2xHN04vamNkbkgxcWova2dTeGphQi92NVNod3VOeUQxWGVxajc0?=
 =?utf-8?B?MGVZa0lZdzlzdFRKbVV1YzI2RUlpUzFJWlBHMzNsNmdMakUrWEJEWnZFV1Fy?=
 =?utf-8?B?ZTlpQURsUUY2Q0kyMFpBb1htcGFoNE8zcndqNUdGNUJ6U0oyVThabk5SQWx3?=
 =?utf-8?B?d2M5QWJIZ2NuVFovS3pMWEJoTFpwNFdYanRPemxhOC9zbENBTUFEc1NrU0dF?=
 =?utf-8?B?VWV4dGJycnUyQW4ybUh5WCtKMzZCRVlFL0RlRFVkc2pPbFBSYzJRNzlmeWhM?=
 =?utf-8?B?NjBuTHpMYnhTVVhRYW9GaUlrS2JIWnl3NGphajdBZ0IyVW00czQ3LytKbFFD?=
 =?utf-8?B?SFpRZU1sS0JGT0JJUFU5MjZFMjhsT0ljR2dvdS9nZVNLcjdReVFxaTdFaHpi?=
 =?utf-8?B?bDRFdVdiVWowMnlzVCs4NFNhWXZyWit3NStUMXBUejhzK3hhd3EybytWazZ2?=
 =?utf-8?B?cnpQSE9LZG05WStycXJRd1k3d1FpVDRjbnowajBGWEJzYzZVU0pLY3Z1RGd5?=
 =?utf-8?B?SW5zMVVHQzdIL1RwdnNHTWJuenc0UzVhUzhIZHU5eWkrL3hDdGg1Y2h1VnAw?=
 =?utf-8?B?bVFGa2tVajBrazYraHlxbGpSZGJlNXhGWXB0d1BpYTV0Q2FOcDZSUjBrS0xN?=
 =?utf-8?B?RnE0RmQ2MjNMbWp4SFJXZzlzMVpBWnFOQTk1NW5nS1hXd1VSeDlOUDNvMGlt?=
 =?utf-8?B?KzRBZVI5MGw1R0pXUENRWEM5TmkwWGtnSGRzeGdPdEFTSnVSQkpvVlhPVUc1?=
 =?utf-8?B?T29EU3Q1TGNFNkxiQWo4SUgzWnRDdWptbzJ5a0Q3eGhDUTRpQ2wzWXIrV0NO?=
 =?utf-8?B?NHEwaHdjTDI5MkMwL3poMlQ3Z2NXa0VtTU5UMmVVMVVEVnFjSE9FQjllRjc3?=
 =?utf-8?B?UU93SXc0b0tVNm9iVjFmK29KYXJmVUVsRThaVG5JTitmdCtoY0x5WUJVMDhE?=
 =?utf-8?B?aUk5MzNJRXVUL3FjdUhwN2VUTHhRbmhOMzVvYVFxRmpFMm5iOHVQb0d0bUhU?=
 =?utf-8?B?Z29mSng5ajREZXBVeXRyUzNTRTBrNkVRby9ORWdRWUhOUDJXdDhpbnF5Mzda?=
 =?utf-8?B?OWdORllmOE1uRDZ3Z2hNVFNJSEk4SldwcWtRTm5KTFlXWFpIeDF0bnNKTkU5?=
 =?utf-8?B?c3pTZm1NVjZxRTl2Um80SkR2cFRweUtCMGV2bFd3ZzlIRFFFd1lCUkh5Qm4z?=
 =?utf-8?B?TUZIWlp6WGgxQ3hSd0t1WTYwRFhxWWE2elVuLzJ5NW11dUlKdFdZQi8xVk9x?=
 =?utf-8?B?OFBpU0JoTVdUT0FGc01FVVFUR2lVdzNrQzc1cVV1OW9Ya1AvazY5ODlZdVI3?=
 =?utf-8?B?RWdtNExJUjVrMTNZQjk5eVErMFAwK1M3QUlLbHJGb0dKdi9BUHgwS0RXS1dB?=
 =?utf-8?B?eXl0dmprTUh2cnZrWFJPb2w2RDM5anFuenpkSllhR3BPRktPRFk3cldTRFN2?=
 =?utf-8?B?aFlKMytqT0VBQzNvZzBNbHU4Y2Q3enhOYXVwVkcyeHR2bnpMWjhnQTJncGxv?=
 =?utf-8?B?UytlMFVOZUg3YkVLNzlqV1BtazVaNmFzUGFZbmdLaFo5STNqbnBFajJ5ZWo0?=
 =?utf-8?B?Z083czJWcTEyYjI2UVBaQS9RbEVyeGp4U0QvTU5zaGRTeDhGNDJDN0p2RTAr?=
 =?utf-8?B?T1FKQXl1ajBlWnlhc1lWeDlmNjRROFdlMUczcXp1Q1pqN3Q0NjNDVDBieG94?=
 =?utf-8?B?U3BKZiswZVRaQzRzRWd1QWwzYlgzQ0JZZFcwZmhneHgzSlZoanVCUVdzeHQv?=
 =?utf-8?B?WkNBdGVCVzBIRkMrbVREdnpveXF5NS9RTGhhK1c5MndWV2F1VVMyNTc2a2Z3?=
 =?utf-8?B?aUc1dXg2VmgzekpqSDVEZEErczRZQ1BmcnE1ZHQxZnpWOXlHTEhKSFJCakRC?=
 =?utf-8?B?SmVCWU11aUpqSTdNdWNjNHZBcXJlUjJPNHplWlNSOVdKZG15cE9TV1hMQmxI?=
 =?utf-8?B?VzZ0NzIvR2w4NVJOZDVNamJEMnhXWUFDOHNab21ya012VFJQakVrb1ZINjNU?=
 =?utf-8?Q?LIu+tmjll7FK2N8ykBBvTLw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b2a9f32-4052-4141-4076-08dcd3f86d69
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 13:31:52.2117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mcljrliZL1qGEsEX73wrKmh9AeUARO8r5BN7yyqSJFBGf7/KbapAYwHEoMrf9CuYpaEJ4w1TkuMI6c2iTLlBzyY+CUsBonST7tcByfqC/bU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4816
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



On 13-09-2024 15:54, Michal Wajdeczko wrote:
> 
> 
> On 12.09.2024 21:16, Himal Prasad Ghimiray wrote:
>> In case of xe_force_wake_put failure caller just calls XE_WARN_ON
>> and continues. Move XE_WARN_ON inside the xe_force_wake_put() and return
>> void.
>>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device.c     |  3 ++-
>>   drivers/gpu/drm/xe/xe_drm_client.c |  4 ++--
>>   drivers/gpu/drm/xe/xe_force_wake.c | 14 ++++++++------
>>   drivers/gpu/drm/xe/xe_force_wake.h |  4 ++--
>>   drivers/gpu/drm/xe/xe_gt.c         | 22 +++++++++-------------
>>   drivers/gpu/drm/xe/xe_gt_debugfs.c |  6 ++----
>>   drivers/gpu/drm/xe/xe_gt_idle.c    |  6 +++---
>>   drivers/gpu/drm/xe/xe_guc_pc.c     | 14 +++++++-------
>>   drivers/gpu/drm/xe/xe_oa.c         |  4 ++--
>>   drivers/gpu/drm/xe/xe_pat.c        | 30 +++++++++++++++---------------
>>   drivers/gpu/drm/xe/xe_query.c      |  2 +-
>>   drivers/gpu/drm/xe/xe_reg_sr.c     | 12 ++++--------
>>   drivers/gpu/drm/xe/xe_vram.c       |  3 ++-
>>   13 files changed, 59 insertions(+), 65 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 5edb1cf51ea5..cce754801e8d 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -620,7 +620,8 @@ static int probe_has_flat_ccs(struct xe_device *xe)
>>   		drm_dbg(&xe->drm,
>>   			"Flat CCS has been disabled in bios, May lead to performance impact");
>>   
>> -	return xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> +	return 0;
>>   }
>>   
>>   int xe_device_probe(struct xe_device *xe)
>> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>> index 01f643f6aaba..e5defce08281 100644
>> --- a/drivers/gpu/drm/xe/xe_drm_client.c
>> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
>> @@ -301,12 +301,12 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>>   		fw_ref = xe_force_wake_get(gt_to_fw(gt), fw);
>>   		if (fw_ref != fw) {
>>   			hwe = NULL;
>> -			XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +			xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   			break;
>>   		}
>>   
>>   		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>> -		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   		break;
>>   	}
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
>> index 73d37e79da9c..01b8bfdd748f 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>> @@ -11,6 +11,7 @@
>>   #include "regs/xe_reg_defs.h"
>>   #include "xe_gt.h"
>>   #include "xe_gt_printk.h"
>> +#include "xe_macros.h"
>>   #include "xe_mmio.h"
>>   #include "xe_sriov.h"
>>   
>> @@ -208,11 +209,10 @@ int __must_check xe_force_wake_get(struct xe_force_wake *fw,
>>    * and waits for acknowledgment for domain to sleep within specified timeout.
>>    * Ensure this function is always called with return of xe_force_wake_get() as
>>    * @domains_mask.
>> - *
>> - * Returns 0 in case of success or non-zero in case of timeout of ack
>> + * Warns in case of timeout of ack from domain.
> 
> maybe this cleanup should be done earlier in the series to avoid
> changing code and kernel-doc once again at the end?
> 
>>    */
>> -int xe_force_wake_put(struct xe_force_wake *fw,
>> -		      int domains_mask)
>> +void xe_force_wake_put(struct xe_force_wake *fw,
>> +		       int domains_mask)
>>   {
>>   	struct xe_gt *gt = fw->gt;
>>   	struct xe_force_wake_domain *domain;
>> @@ -225,7 +225,7 @@ int xe_force_wake_put(struct xe_force_wake *fw,
>>   	 * in error path of individual domains.
>>   	 */
>>   	if (!domains_mask)
>> -		return 0;
>> +		return;
>>   
>>   	spin_lock_irqsave(&fw->lock, flags);
>>   	for_each_fw_domain_masked(domain, domains_mask, fw, tmp) {
>> @@ -240,5 +240,7 @@ int xe_force_wake_put(struct xe_force_wake *fw,
>>   	fw->awake_domains &= ~sleep;
>>   	spin_unlock_irqrestore(&fw->lock, flags);
>>   
>> -	return ret;
>> +	if (ret)
>> +		XE_WARN_ON("Timedout for domain sleep acknowledgment");
> 
> I guess this should be xe_gt_WARN() instead, maybe like this:
> 
> xe_gt_WARN(gt, ret, "domain%s %#x failed to acknowledgment sleep\n",
> 	str_plural(hweight_long(ret)), ret);
> 

Agreed. Makes more sense, will update in next version.


>> +
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
>> index e17fe316dc3c..c2c729371b2a 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.h
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
>> @@ -17,8 +17,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt,
>>   				struct xe_force_wake *fw);
>>   int __must_check xe_force_wake_get(struct xe_force_wake *fw,
>>   				   enum xe_force_wake_domains domains);
>> -int xe_force_wake_put(struct xe_force_wake *fw,
>> -		      int domains_mask);
>> +void xe_force_wake_put(struct xe_force_wake *fw,
>> +		       int domains_mask);
>>   
>>   static inline int
>>   xe_force_wake_ref(struct xe_force_wake *fw,
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index b0126daee359..5f5760b60eac 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -446,8 +446,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>>   	 */
>>   	gt->info.gmdid = xe_mmio_read32(&gt->mmio, GMD_ID);
>>   
>> -	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> -	XE_WARN_ON(err);
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   
>>   	return 0;
>>   
>> @@ -533,9 +532,7 @@ static int all_fw_domain_init(struct xe_gt *gt)
>>   	if (IS_SRIOV_PF(gt_to_xe(gt)))
>>   		xe_gt_sriov_pf_init_hw(gt);
>>   
>> -	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> -	XE_WARN_ON(err);
>> -
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   	return 0;
>>   
>>   err_force_wake:
>> @@ -787,8 +784,7 @@ static int gt_reset(struct xe_gt *gt)
>>   	if (err)
>>   		goto err_out;
>>   
>> -	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> -	XE_WARN_ON(err);
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   	xe_pm_runtime_put(gt_to_xe(gt));
>>   
>>   	xe_gt_info(gt, "reset done\n");
>> @@ -796,7 +792,7 @@ static int gt_reset(struct xe_gt *gt)
>>   	return 0;
>>   
>>   err_out:
>> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   	XE_WARN_ON(xe_uc_start(&gt->uc));
>>   err_fail:
>>   	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
>> @@ -835,7 +831,7 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
>>   
>>   	xe_uc_stop_prepare(&gt->uc);
>>   
>> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   }
>>   
>>   int xe_gt_suspend(struct xe_gt *gt)
>> @@ -857,7 +853,7 @@ int xe_gt_suspend(struct xe_gt *gt)
>>   
>>   	xe_gt_disable_host_l2_vram(gt);
>>   
>> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   	xe_gt_dbg(gt, "suspended\n");
>>   
>>   	return 0;
>> @@ -865,7 +861,7 @@ int xe_gt_suspend(struct xe_gt *gt)
>>   err_msg:
>>   	err = -ETIMEDOUT;
>>   err_force_wake:
>> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   	xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
>>   
>>   	return err;
>> @@ -914,7 +910,7 @@ int xe_gt_resume(struct xe_gt *gt)
>>   
>>   	xe_gt_idle_enable_pg(gt);
>>   
>> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   	xe_gt_dbg(gt, "resumed\n");
>>   
>>   	return 0;
>> @@ -922,7 +918,7 @@ int xe_gt_resume(struct xe_gt *gt)
>>   err_msg:
>>   	err = -ETIMEDOUT;
>>   err_force_wake:
>> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   	xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(err));
>>   
>>   	return err;
>> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> index 86146de1d31c..2ecf3c87c6b0 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> @@ -90,7 +90,7 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
>>   	struct xe_device *xe = gt_to_xe(gt);
>>   	struct xe_hw_engine *hwe;
>>   	enum xe_hw_engine_id id;
>> -	int fw_ref, err;
>> +	int fw_ref;
>>   
>>   	xe_pm_runtime_get(xe);
>>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>> @@ -103,10 +103,8 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
>>   	for_each_hw_engine(hwe, gt, id)
>>   		xe_hw_engine_print(hwe, p);
>>   
>> -	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   	xe_pm_runtime_put(xe);
>> -	if (err)
>> -		return err;
>>   
>>   	return 0;
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
>> index 9af81b07ab7a..1a7ee5681da6 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>> @@ -144,7 +144,7 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
>>   	}
>>   
>>   	xe_mmio_write32(mmio, POWERGATE_ENABLE, gtidle->powergate_enable);
>> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   }
>>   
>>   void xe_gt_idle_disable_pg(struct xe_gt *gt)
>> @@ -161,7 +161,7 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
>>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>   	XE_WARN_ON(!fw_ref);
>>   	xe_mmio_write32(&gt->mmio, POWERGATE_ENABLE, gtidle->powergate_enable);
>> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   }
>>   
>>   /**
>> @@ -223,7 +223,7 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
>>   		pg_enabled = xe_mmio_read32(&gt->mmio, POWERGATE_ENABLE);
>>   		pg_status = xe_mmio_read32(&gt->mmio, POWERGATE_DOMAIN_STATUS);
>>   
>> -		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   	}
>>   
>>   	if (gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK) {
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index c7a00565216d..27ad412936f7 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -423,7 +423,7 @@ int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq)
>>   	 */
>>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>   	if (fw_ref != XE_FORCEWAKE_ALL) {
>> -		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   		return -ETIMEDOUT;
>>   	}
>>   
>> @@ -432,7 +432,7 @@ int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq)
>>   	*freq = REG_FIELD_GET(REQ_RATIO_MASK, *freq);
>>   	*freq = decode_freq(*freq);
>>   
>> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   	return 0;
>>   }
>>   
>> @@ -508,7 +508,7 @@ int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq)
>>   	*freq = pc_get_min_freq(pc);
>>   
>>   fw:
>> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   out:
>>   	mutex_unlock(&pc->freq_lock);
>>   	return ret;
>> @@ -870,13 +870,13 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
>>   
>>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>   	if (fw_ref != XE_FORCEWAKE_ALL) {
>> -		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   		return -ETIMEDOUT;
>>   	}
>>   
>>   	xe_gt_idle_disable_c6(gt);
>>   
>> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   
>>   	return 0;
>>   }
>> @@ -968,7 +968,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>>   
>>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>   	if (fw_ref != XE_FORCEWAKE_ALL) {
>> -		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   		return -ETIMEDOUT;
>>   	}
>>   
>> @@ -1013,7 +1013,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>>   	ret = pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
>>   
>>   out:
>> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   	return ret;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>> index 80e5c4ef86ef..8d7d9e7ade51 100644
>> --- a/drivers/gpu/drm/xe/xe_oa.c
>> +++ b/drivers/gpu/drm/xe/xe_oa.c
>> @@ -840,7 +840,7 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
>>   
>>   	xe_oa_free_oa_buffer(stream);
>>   
>> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>> +	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>   	xe_pm_runtime_put(stream->oa->xe);
>>   
>>   	/* Wa_1509372804:pvc: Unset the override of GUCRC mode to enable rc6 */
>> @@ -1463,7 +1463,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
>>   err_free_oa_buf:
>>   	xe_oa_free_oa_buffer(stream);
>>   err_fw_put:
>> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   	xe_pm_runtime_put(stream->oa->xe);
>>   	if (stream->override_gucrc)
>>   		xe_gt_WARN_ON(gt, xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
>> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
>> index 96d5ec1fbbd9..4372dd727e9f 100644
>> --- a/drivers/gpu/drm/xe/xe_pat.c
>> +++ b/drivers/gpu/drm/xe/xe_pat.c
>> @@ -182,7 +182,7 @@ static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry ta
>>   static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
>>   {
>>   	struct xe_device *xe = gt_to_xe(gt);
>> -	int i, err, fw_ref;
>> +	int i, fw_ref;
>>   
>>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>   	if (!fw_ref)
>> @@ -198,9 +198,9 @@ static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
>>   			   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
>>   	}
>>   
>> -	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   err_fw:
>> -	xe_assert(xe, (fw_ref && !err));
>> +	xe_assert(xe, !fw_ref);
> 
> xe_assert() shouldn't be used to track/report HW errors

Agreed, should we use drm_WARN_ON ?

> 
>>   }
>>   
>>   static const struct xe_pat_ops xelp_pat_ops = {
>> @@ -211,7 +211,7 @@ static const struct xe_pat_ops xelp_pat_ops = {
>>   static void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
>>   {
>>   	struct xe_device *xe = gt_to_xe(gt);
>> -	int i, err, fw_ref;
>> +	int i, fw_ref;
>>   
>>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>   	if (!fw_ref)
>> @@ -229,9 +229,9 @@ static void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
>>   			   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
>>   	}
>>   
>> -	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   err_fw:
>> -	xe_assert(xe, (fw_ref && !err));
>> +	xe_assert(xe, !fw_ref);
>>   }
>>   
>>   static const struct xe_pat_ops xehp_pat_ops = {
>> @@ -242,7 +242,7 @@ static const struct xe_pat_ops xehp_pat_ops = {
>>   static void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
>>   {
>>   	struct xe_device *xe = gt_to_xe(gt);
>> -	int i, err, fw_ref;
>> +	int i, fw_ref;
>>   
>>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>   	if (!fw_ref)
>> @@ -258,9 +258,9 @@ static void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
>>   			   REG_FIELD_GET(XEHPC_CLOS_LEVEL_MASK, pat), pat);
>>   	}
>>   
>> -	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   err_fw:
>> -	xe_assert(xe, (fw_ref && !err));
>> +	xe_assert(xe, !fw_ref);
>>   }
>>   
>>   static const struct xe_pat_ops xehpc_pat_ops = {
>> @@ -271,7 +271,7 @@ static const struct xe_pat_ops xehpc_pat_ops = {
>>   static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
>>   {
>>   	struct xe_device *xe = gt_to_xe(gt);
>> -	int i, err, fw_ref;
>> +	int i, fw_ref;
>>   
>>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>   	if (!fw_ref)
>> @@ -292,9 +292,9 @@ static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
>>   			   REG_FIELD_GET(XELPG_INDEX_COH_MODE_MASK, pat), pat);
>>   	}
>>   
>> -	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   err_fw:
>> -	xe_assert(xe, (fw_ref && !err));
>> +	xe_assert(xe, !fw_ref);
>>   }
>>   
>>   /*
>> @@ -330,7 +330,7 @@ static void xe2lpm_program_pat(struct xe_gt *gt, const struct xe_pat_table_entry
>>   static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
>>   {
>>   	struct xe_device *xe = gt_to_xe(gt);
>> -	int i, err, fw_ref;
>> +	int i, fw_ref;
>>   	u32 pat;
>>   
>>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> @@ -374,9 +374,9 @@ static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
>>   		   REG_FIELD_GET(XE2_COH_MODE, pat),
>>   		   pat);
>>   
>> -	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   err_fw:
>> -	xe_assert(xe, (fw_ref && !err));
>> +	xe_assert(xe, !fw_ref);
>>   }
>>   
>>   static const struct xe_pat_ops xe2_pat_ops = {
>> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>> index 7c866b736f00..df7bdf3822cc 100644
>> --- a/drivers/gpu/drm/xe/xe_query.c
>> +++ b/drivers/gpu/drm/xe/xe_query.c
>> @@ -153,7 +153,7 @@ query_engine_cycles(struct xe_device *xe,
>>   
>>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>   	if (fw_ref != XE_FORCEWAKE_ALL)  {
>> -		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   		return -EIO;
>>   	}
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
>> index 6ab6a48b1d29..874523f22f56 100644
>> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
>> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
>> @@ -202,14 +202,12 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
>>   	xa_for_each(&sr->xa, reg, entry)
>>   		apply_one_mmio(gt, entry);
>>   
>> -	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> -	XE_WARN_ON(err);
>> -
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   	return;
>>   
>>   err_force_wake:
>>   	err = -ETIMEDOUT;
>> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   	xe_gt_err(gt, "Failed to apply, err=%d\n", err);
>>   }
>>   
>> @@ -256,14 +254,12 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
>>   		xe_mmio_write32(&gt->mmio, RING_FORCE_TO_NONPRIV(mmio_base, slot), addr);
>>   	}
>>   
>> -	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> -	XE_WARN_ON(err);
>> -
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   	return;
>>   
>>   err_force_wake:
>>   	err = -ETIMEDOUT;
>> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   	drm_err(&xe->drm, "Failed to apply, err=%d\n", err);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
>> index 3b5256d76d9a..1384c97a75c2 100644
>> --- a/drivers/gpu/drm/xe/xe_vram.c
>> +++ b/drivers/gpu/drm/xe/xe_vram.c
>> @@ -263,7 +263,8 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
>>   	/* remove the tile offset so we have just the available size */
>>   	*vram_size = offset - *tile_offset;
>>   
>> -	return xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> +	return 0;
>>   }
>>   
>>   static void vram_fini(void *arg)
