Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D75FF8860
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 18:28:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ACE810E8C6;
	Mon, 27 Apr 2026 18:28:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UzdM1q6k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E721B10E8C6
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 18:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777314492; x=1808850492;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zHeS0R1wKnw1SH7J5DsnRp82ZRkfTNQtnoSrmhDSBic=;
 b=UzdM1q6koBLYcolBsRko2kZR1usAwePHrlDeoKwABa4m8zfeCns5EaD1
 /nPxAjbWb9/Ic7J8leQUqX4/a31Iaatpv0OZzzEROJvm2+HPzJQuE50VC
 yAoVK0+aUXJRnPt8IOJCAvF9EYcZW2l861/XCCiGza0Y/uxv1jasMzVJT
 yAxUNSn5jvo/+i85hXAM2EsrkfHft4LAz83qvl3j/dLDKwRSnLX7+4BSd
 6x+7i538NNZbcBmSbzCOLPYHmv3kR77M1rUWOBTSjWXzsukO17G4uwlcC
 p7vVvn03fhv8gJeOpT4Wlcxc9HMl7ZDHlIMw1lqCD6rXzKvQAmYQIJ0iD g==;
X-CSE-ConnectionGUID: lbrH8eKOSS69e24uUFTA2w==
X-CSE-MsgGUID: Dqv1wSp7REqz7KG4vaiQYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="89674349"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="89674349"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 11:28:11 -0700
X-CSE-ConnectionGUID: JHI5PDeESO+0V5kwmpWmYw==
X-CSE-MsgGUID: DoDtDZQTQmmA0chw18sukw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="257246569"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 11:28:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 11:28:10 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 27 Apr 2026 11:28:10 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.68) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 11:28:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BtD0WQufm79Xu8PlieZoU3FQ+bYjFLETRwkkDwouM/QyA9g9a25I3eV3eseO2riqwRQdEkbeJeTfwUYWehpYiZfpMger/V6FAs5+JlsG2sOHAMw+0LCHEpaiV3/IOZfd4O+n4cSYHxhyr2NqHzJA+rRMRqWyq93WM9IxbH4HnHeqoG5QtgUcJxtK5jaJXYLYZQ6i26hEuiyCmOCamwkSp7QSfPmqmMQ8AySTGatsFeSuqx+qkzI1Q83H38eVZlum5w5HDe3EJww7saG9IG+F463YugHArS7NZsd2zEd5vlPyb1LGLjlrVRaZFb86k5id6WEn9DW09bi2qwNudrpKlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NrDC1UkFAWRIEN3xYBUVxt8AjE1UTV2Mt6IL6QlYFDU=;
 b=iqrjxK1ye86GcCOr8Z7CiKaPeB/deETZyLfr8Yi/YEhBjFd8MdntX6bYnkCpWjNK8GMmbB4VkqSRGP7r8RRdhBnxFnR5B6tq7IXcHBcaflrdbckYrYe7+bKNGOHQTUa26z/7dfu3HdVzgFCGB+GN4fyq/t0xp4onvuGFh/7A5vWfDFUIJjrhgOMd7qpQKtkGFwM55TgqQMrKl3aL0hA7OID7ZbAAvZmx/ukjM+fgJel4ytT8lPtPuGeLmGyaJdtBSy92/10iu+QzAbFna9kUfMQftgE6r8SxXEc72gVNFbvZYmHzgxADYWT0+WFCexYbglAEAb5o3tOSGIIpTzVYBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH7PR11MB7025.namprd11.prod.outlook.com (2603:10b6:510:208::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.15; Mon, 27 Apr
 2026 18:28:06 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%4]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 18:28:06 +0000
Date: Mon, 27 Apr 2026 11:27:59 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe/oa: Use xe_map layer
Message-ID: <ae+qrxnvG2ZawZD7@soc-5CG1426VCC.clients.intel.com>
References: <20260415020342.782987-1-ashutosh.dixit@intel.com>
 <20260415020342.782987-2-ashutosh.dixit@intel.com>
 <aevbDGmDb7QlHG+0@soc-5CG1426VCC.clients.intel.com>
 <87jytvud4b.wl-ashutosh.dixit@intel.com>
 <85tssznbbj.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <85tssznbbj.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0052.namprd03.prod.outlook.com
 (2603:10b6:303:8e::27) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH7PR11MB7025:EE_
X-MS-Office365-Filtering-Correlation-Id: c5c942db-c4bb-4495-f632-08dea48ab9b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: 2OjRLyD+h/08JbWhPHKj65sew/fg3AIyUtZfFSuTusgszZFpy7s45IxfCPBDtbevSh5gtsoUVO+uBc+cekqpKxNtmbtGPZqNr/DAlBLVCPSDJBhboZpJmOvPQ3ZmOsN3zFIMeeXi9B/GhOGkVd9liUuo2mTOPixomwkFvMaYJAQSU4pSrxx0dumVVNTltM2eW9Pk/GaBYb+NngMjgsY+5upvKoVCmNwvWx/ce9qOZzBPtay9GqBhcY9i2ms3vmKNJQia8DX79F0EerTyKKxgyF+5OpnItn2gpRhlFIeyTkGVdks25cr4hUT89XWjfo0J1yRPcRb3F47u1ddUv/Zd7OeR/5TJD3O/FIYtZ0Bz2qzWgYAVNacjqkmrn7GMkoO3AB/slfFicoIoq2el87R+4Im9d0WeTpeTass4aPcf36oAXHIyO6uFE+IyeinV379Ompn5QDZqtDhC0FWXVuI6opnHH7hRCQVoUytQxwa1iMgorMVfA4AVs0HxdQaeEuOHFQj81c6aj5WWZe9+4Wbt4B4qIPJB6c0SkufGIiGgd7GyXzKECFReG78ez2mTzeQNggpsc7EA4VcgrbwJOjYRs7S+EtvnnTp+y2W3KtpybooyeVw8BNL3Uo710QOFfbipP07/kjeN10Cj1vrts1PphXpLYANggUP6MnJol+H10Z3dJo0efccomh08FJDMCIleSqPAVzFaNyLYe+0onILKmIt7KO4jSoRyePU6D6KEnOQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDBIcTg0N21JOVllbnVndk1EQzJTdmsxd0doZVg5bDBuc0JobHFQTnhGNFBu?=
 =?utf-8?B?VzkyRUx3TG5SdTBSTklQYlZIUXVaSFhlcXJJMmYrWGtKcG8yQWFyZnZlWU94?=
 =?utf-8?B?dk9RbG9Oc0I3ZThXOE9FK05JcG1mYkVqdExZc3lLbVFGMVR3NlMwaFZqaVBE?=
 =?utf-8?B?U09LUXpNTFh5azRZOStZeDBNby9jNW8wMWtaejFBR0pSdmFHRW9YZjB3VVRz?=
 =?utf-8?B?SWYvZWwyWk1jSWR0TFlSWjFOTk8rNHVQQ1dHUlZuMnBhaDVUMlRaWnV4TEIr?=
 =?utf-8?B?dnNtb0RDTHRSakJ3K0ZOZFIraWFLTWNMMCtUVVdOSW0yb043d1NhbkZOWG4z?=
 =?utf-8?B?bE01Q1NtYkpUNFR3U3NIRGh2c1V3MUxvT2MrOXliWCt6SHZGZDd3UG9GZ21j?=
 =?utf-8?B?bGlhTnJIMllkTmwvcms5UkFqTFVzM0JzU1BGYWV0TGVnTkRRYVFya2Exb2J3?=
 =?utf-8?B?TGRIL1lPK1l3QlJNV0xvWW1QMStmS3ZsVE4zMGpXMlRYR2d2UFJOczNSbTV5?=
 =?utf-8?B?aFF2OWJDR1c1cEpxcysrNGtxeUM5N25rdUk4V3RHVWxnM00rWi9oNEw1dVJO?=
 =?utf-8?B?VW5TeVlDV3Boc1I0NXFHeklGYWp6V2pZVXRDMFlHRjQ2Tm40Ly9JeFlORXBV?=
 =?utf-8?B?dS9qN0FHTWt5UW9oNG9IdkQ3bnhmOGRjSkNkUlR6cGQwRHJDcldZL0dSYmM4?=
 =?utf-8?B?dVI4eUJsbzBCSGVycWxpY1p0dmNlcVZzcUxBdGp3QzdHSzczL2lwSCthb3Zx?=
 =?utf-8?B?MWtKdElLcStubEMrZms0NFovZEtFL2JKVW56YzZWelRHUXlPWWlKRkxjUFVp?=
 =?utf-8?B?M3pRcnNnOG0rWnA5OU5oV3hjcXFvR25lUEVrQVZtYzJOcjB2R010Mm1VUmVj?=
 =?utf-8?B?ZTFYY3dTMG43QVR6SXc0aXFvamRBRTVBb0wrOXpvb2trOXc4M1RORk1POEVk?=
 =?utf-8?B?VnRUVVhRNTd6ZTJQSnRVdHd4VHlRR1c1M3NvVGlPajgvdmdaT1gwTFRNWTRv?=
 =?utf-8?B?SEswbUtGNy8rZStNWDJQY0Jwa1EwZUg4T0Y4azBweFlDTytaK3I3RU9GalM0?=
 =?utf-8?B?MGhLbFpIdVphVzRXaXlaTWhxeUZQNFpaRW1hczhjZUJTaHE3Q0RYdjBkL1FR?=
 =?utf-8?B?cWpNUmFGTmZwVVlLeGRMZU9mQVdFY1JjbTJLWHFMeS9oQkdycmtMcFlDS2lX?=
 =?utf-8?B?Y2pjampTZ0h1Wm1uSVFlMFZCS2ZucHVyanJVSXh2NkZ0UHZEWmYvemNOT3Zy?=
 =?utf-8?B?allMR3FMWFdqUDVkazlPazJXdkV0RUIzOVJ2TlFMK0RxZW8vaVNWQjk2UEE4?=
 =?utf-8?B?RG0zcVFWcE5RZ1BkNkQ1M0hoU2svN2VNRmYrODBnWEtiNVBWVjJQWFFjTHJv?=
 =?utf-8?B?eGI2US9RenYycXBBNTZMOHVvaGNOb3c4ODI5NXVPMnpyR1JtWm53YmtIWG5v?=
 =?utf-8?B?UC8wdDBXc0J5T2czb2JiVVRiRXZPQWFUVzJFa3grbmd4RlNzKzAyTTMzeGtj?=
 =?utf-8?B?ZzZxTUxpdFlreWdqb3lrSTFKZUU3VmdTWEEzbFdvVHc1amtybE1tZzFNSmJJ?=
 =?utf-8?B?QW10ZnJBVVR0MXVHTDAxOU9hM3A5M01mbFlXOXNoN0ZSc0FtWGNicWlwV3Ey?=
 =?utf-8?B?OVA5ZHZoTHRuSWFDUEZuOVhPdVk5cjBCV0YvMHFKd2IwcWQvTlF6WUg5ekNL?=
 =?utf-8?B?a3VkUGlTRDJiUE1ham81MUVreThWOTJ2dWhkeitDcVF6WGRTeVd3K01LUTZT?=
 =?utf-8?B?TG1VaVFoM0hkcWRiRlJKdXhCSzNENWhwVlFUSWhZUDA2bzl1UVRoc05qUzNT?=
 =?utf-8?B?bU5zNXhPYk0yU3JDMWh1Y1NBQlNIV3VFWTE5cnVEUXhmcjlvbm0xa3JLU0NY?=
 =?utf-8?B?SDBTWkdaWGxjWDlQN1k2QXh6RGhINk1PNFV2Zks3TXlNRFZwZjR1VktMTU1N?=
 =?utf-8?B?VXQ0OElOOTJBL1hlRmVCbjRKKzVKb3prZEhoRUpuOFByV1pwR3B0NnRnc3B3?=
 =?utf-8?B?ajBRMjhiMzlVRFc2eWNLcUhnK1JITmVYcFFGcWZtMWVqOGhmOWFwa005YXE2?=
 =?utf-8?B?ZG05eVRjR2ErSkcxMHIvT0xmQm4yZXVtd295bm5NMktINmp3VlJuQ0d2OEZ6?=
 =?utf-8?B?bUwxT2xYOG1sV3VVWnNFNVprb050REFxRW5nNDNnelJxQTFJU2xERmJxcEVB?=
 =?utf-8?B?VVdaVkZ0NTFQNUJwQWd2dkVla2hwQnZPaXF1Q0FhWVZDMXl6TklFVUtvbnhz?=
 =?utf-8?B?cU5iQU9KanVhcCsrTDI2T3ZhbEhRbmVjNTlEVVYyOTdLcElRZlBlN1k5bTFi?=
 =?utf-8?B?WDZSWFhzQkpDaGJEUHozQjMyb0ZSK1pNTUpkUlFMVXpMQnkySWZoV0lOZElH?=
 =?utf-8?Q?0Vm7ohv+7pXmT4Wp3iSxf+U9xTufwFhWEQYD3?=
X-Exchange-RoutingPolicyChecked: HKr4L9mZh73PIHEshOv9Eesx4XPpcWRE7dI4BjuvMaBgPYL8/FlFMgjDKa+jtlwzgD+uVizHiK4g8/pBC2ux6ZW4v4AA9RZFImLCT6e4B6XKAF3PDMpzTiTCWkDXTF7CJcsJNRK2pVMWiTtwkM19BMS4ekX0AwiNqqY/nZbMpj8nSZrs++Via3WWd5bxywZk4n5SHg2sjtt+Huw9Kd8ABR3od0DC7NOHN9q5iiOdbaTSKe1SEXi1nu4ip5dKKox8dxZTCRaaWhUV83090JPZ1UXNHEh5eMH6tHlUieAIGj9I3QbgTMIihwqviKWWb6uvLQ0f+yLOSjF39Lk6jGhNyQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c5c942db-c4bb-4495-f632-08dea48ab9b9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 18:28:06.3776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iWUuEOeATZS/l22LZ/38Ej82fvCZP64nPAaFf4SdaCV/zbJOrBKouZVSn09jxd09ALCch06Y8INBIdHBtCOwAVscCuCVEdUMQy0t32bRE1s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7025
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

On Fri, Apr 24, 2026 at 05:16:48PM -0700, Dixit, Ashutosh wrote:
>On Fri, 24 Apr 2026 16:56:04 -0700, Dixit, Ashutosh wrote:
>>
>> On Fri, 24 Apr 2026 14:05:16 -0700, Umesh Nerlige Ramappa wrote:
>> >
>>
>> Hi Umesh,
>>
>> > On Tue, Apr 14, 2026 at 07:03:40PM -0700, Ashutosh Dixit wrote:
>> > > OA code should have used xe_map layer to begin with. In CRI, the OA buffer
>> > > can be located both in system and device memory. For these reasons, move OA
>> > > code to use the xe_map layer when accessing the OA buffer.
>> > >
>> > > v2: Use xe_map layer and put_user in xe_oa_copy_to_user (Umesh)
>> > > v3: To avoid performance impact in v2, revert to v1 but move
>> > >    xe_map_copy_to_user() to xe_map.h
>> > > v4: Use bounce buffer and copy_to_user in xe_oa_copy_to_user
>> > >
>> > > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> > > ---
>> > > drivers/gpu/drm/xe/xe_oa.c       | 95 +++++++++++++++++++-------------
>> > > drivers/gpu/drm/xe/xe_oa_types.h |  4 +-
>> > > 2 files changed, 58 insertions(+), 41 deletions(-)
>> > >
>> > > diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>> > > index 6337e671c97ae..4d13d8ef8103f 100644
>> > > --- a/drivers/gpu/drm/xe/xe_oa.c
>> > > +++ b/drivers/gpu/drm/xe/xe_oa.c
>> > > @@ -213,32 +213,40 @@ static u32 xe_oa_hw_tail_read(struct xe_oa_stream *stream)
>> > > #define oa_report_header_64bit(__s) \
>> > >	((__s)->oa_buffer.format->header == HDR_64_BIT)
>> > >
>> > > -static u64 oa_report_id(struct xe_oa_stream *stream, void *report)
>> > > +static u64 oa_report_id(struct xe_oa_stream *stream, u32 tail)
>> > > {
>> > > -	return oa_report_header_64bit(stream) ? *(u64 *)report : *(u32 *)report;
>> > > +	struct iosys_map *map = &stream->oa_buffer.bo->vmap;
>> > > +
>> > > +	return oa_report_header_64bit(stream) ?
>> > > +		xe_map_rd(stream->oa->xe, map, tail, u64) :
>> > > +		xe_map_rd(stream->oa->xe, map, tail, u32);
>> > > }
>> >
>> > (1) The helper is just returning the report id for a report passed. In this
>> > case it is tail, but the code would work for any report. I would keep the
>> > name as report or report_offset. Let the caller use specific names like
>> > tail.
>> >
>> > >
>> > > -static void oa_report_id_clear(struct xe_oa_stream *stream, u32 *report)
>> > > +static void oa_report_id_clear(struct xe_oa_stream *stream, u32 head)
>> > > {
>> > > -	if (oa_report_header_64bit(stream))
>> > > -		*(u64 *)report = 0;
>> > > -	else
>> > > -		*report = 0;
>> > > +	struct iosys_map *map = &stream->oa_buffer.bo->vmap;
>> > > +
>> > > +	oa_report_header_64bit(stream) ?
>> > > +		xe_map_wr(stream->oa->xe, map, head, u64, 0) :
>> > > +		xe_map_wr(stream->oa->xe, map, head, u32, 0);
>> > > }
>> > >
>> > > -static u64 oa_timestamp(struct xe_oa_stream *stream, void *report)
>> > > +static u64 oa_timestamp(struct xe_oa_stream *stream, u32 tail)
>> > > {
>> > > +	struct iosys_map *map = &stream->oa_buffer.bo->vmap;
>> > > +
>> > >	return oa_report_header_64bit(stream) ?
>> > > -		*((u64 *)report + 1) :
>> > > -		*((u32 *)report + 1);
>> > > +		xe_map_rd(stream->oa->xe, map, tail + 2, u64) :
>> > > +		xe_map_rd(stream->oa->xe, map, tail + 1, u32);
>> >
>> > (2) I think this should be tail + 8 and tail + 4. Can you please double
>> > check? The u32/u64 is only being used to access the data at the offset
>> > rather than determine how to calculate the actual offset.
>>
>> Hmm, you are right!!! I don't believe I made such a basic mistake :/ And
>> all the xe_oa tests work fine even with this.
>>
>> Anyway thanks for catching this, I'm fixing this in the next rev.
>>
>> >
>> > > }
>> > >
>> > > -static void oa_timestamp_clear(struct xe_oa_stream *stream, u32 *report)
>> > > +static void oa_timestamp_clear(struct xe_oa_stream *stream, u32 head)
>> > > {
>> > > -	if (oa_report_header_64bit(stream))
>> > > -		*(u64 *)&report[2] = 0;
>> > > -	else
>> > > -		report[1] = 0;
>> > > +	struct iosys_map *map = &stream->oa_buffer.bo->vmap;
>> > > +
>> > > +	oa_report_header_64bit(stream) ?
>> > > +		xe_map_wr(stream->oa->xe, map, head + 2, u64, 0) :
>> > > +		xe_map_wr(stream->oa->xe, map, head + 1, u32, 0);
>> >
>> > Same here - comment (2)
>> >
>> > > }
>> >
>> > Same comment (1) for all the above helpers - the name can be generic -
>> > report_offset. I see similar change in other functions below as well. If
>> > you think it is necessary, I suggest trying to move it to a separate patch
>> > with commit message explaining why you want to rename them. That would also
>> > help review this patch easily.
>>
>> So, as we know HW writes to tail and SW reads from head. So the helpers
>> with head as the arg are invoked from the read side only and the helpers
>> with tail as the arg are invoked from the write side only. That was the
>> reason for naming the arg as head/tail, rather than just "offset". I
>> thought it will make the code easier to understand and also maybe prevent
>> mistakes in the future.

To me, the report_offset (or offset) is clearer. When I read the code I 
would remember this helper as returning report_id/timestamp given any 
report offset as an argument. The tail/head names makes me wonder if the 
caller has to be accounted for as well.

Anyways, please add the above description you have to the commit message 
and you can leave it as is.

Thanks,
Umesh

>>
>> So anyway, let me ask once again if you think I should change it. Of
>> course, there's no problem changing the arg name in the helpers.
>>
>> I'll also see if it's possible to split the patch some way to make the
>> review a bit easier.
>
>I just sent out v5 in which I have let all this stay as is. Anyway, please
>let me know what you prefer. Thanks.
>
>>
>> Thanks.
>> --
>> Ashutosh
>>
>>
>> >
>> > >
>> > > static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
>> > > @@ -275,9 +283,7 @@ static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
>> > >	 * they were written.  If not : (╯°□°）╯︵ ┻━┻
>> > >	 */
>> > >	while (xe_oa_circ_diff(stream, tail, stream->oa_buffer.tail) >= report_size) {
>> > > -		void *report = stream->oa_buffer.vaddr + tail;
>> > > -
>> > > -		if (oa_report_id(stream, report) || oa_timestamp(stream, report))
>> > > +		if (oa_report_id(stream, tail) || oa_timestamp(stream, tail))
>> > >			break;
>> > >
>> > >		tail = xe_oa_circ_diff(stream, tail, report_size);
>> > > @@ -311,30 +317,35 @@ static enum hrtimer_restart xe_oa_poll_check_timer_cb(struct hrtimer *hrtimer)
>> > >	return HRTIMER_RESTART;
>> > > }
>> > >
>> > > +static unsigned long
>> > > +xe_oa_copy_to_user(struct xe_oa_stream *stream, void __user *dst, u32 head, u32 len)
>> > > +{
>> > > +	xe_map_memcpy_from(stream->oa->xe, stream->oa_buffer.bounce,
>> > > +			   &stream->oa_buffer.bo->vmap, head, len);
>> > > +	return copy_to_user(dst, stream->oa_buffer.bounce, len);
>> > > +}
>> > > +
>> >
>> > Still need to look at the patch below this point. Will send that out next
>> > week...
>> >
>> > Regards,
>> > Umesh
>> >
>> > > static int xe_oa_append_report(struct xe_oa_stream *stream, char __user *buf,
>> > > -			       size_t count, size_t *offset, const u8 *report)
>> > > +			       size_t count, size_t *offset, u32 head)
>> > > {
>> > >	int report_size = stream->oa_buffer.format->size;
>> > >	int report_size_partial;
>> > > -	u8 *oa_buf_end;
>> > >
>> > >	if ((count - *offset) < report_size)
>> > >		return -ENOSPC;
>> > >
>> > >	buf += *offset;
>> > >
>> > > -	oa_buf_end = stream->oa_buffer.vaddr + stream->oa_buffer.circ_size;
>> > > -	report_size_partial = oa_buf_end - report;
>> > > +	report_size_partial = stream->oa_buffer.circ_size - head;
>> > >
>> > >	if (report_size_partial < report_size) {
>> > > -		if (copy_to_user(buf, report, report_size_partial))
>> > > +		if (xe_oa_copy_to_user(stream, buf, head, report_size_partial))
>> > >			return -EFAULT;
>> > >		buf += report_size_partial;
>> > >
>> > > -		if (copy_to_user(buf, stream->oa_buffer.vaddr,
>> > > -				 report_size - report_size_partial))
>> > > +		if (xe_oa_copy_to_user(stream, buf, 0, report_size - report_size_partial))
>> > >			return -EFAULT;
>> > > -	} else if (copy_to_user(buf, report, report_size)) {
>> > > +	} else if (xe_oa_copy_to_user(stream, buf, head, report_size)) {
>> > >		return -EFAULT;
>> > >	}
>> > >
>> > > @@ -347,7 +358,6 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
>> > >				size_t count, size_t *offset)
>> > > {
>> > >	int report_size = stream->oa_buffer.format->size;
>> > > -	u8 *oa_buf_base = stream->oa_buffer.vaddr;
>> > >	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
>> > >	size_t start_offset = *offset;
>> > >	unsigned long flags;
>> > > @@ -364,26 +374,24 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
>> > >
>> > >	for (; xe_oa_circ_diff(stream, tail, head);
>> > >	     head = xe_oa_circ_incr(stream, head, report_size)) {
>> > > -		u8 *report = oa_buf_base + head;
>> > > -
>> > > -		ret = xe_oa_append_report(stream, buf, count, offset, report);
>> > > +		ret = xe_oa_append_report(stream, buf, count, offset, head);
>> > >		if (ret)
>> > >			break;
>> > >
>> > >		if (!(stream->oa_buffer.circ_size % report_size)) {
>> > >			/* Clear out report id and timestamp to detect unlanded reports */
>> > > -			oa_report_id_clear(stream, (void *)report);
>> > > -			oa_timestamp_clear(stream, (void *)report);
>> > > +			oa_report_id_clear(stream, head);
>> > > +			oa_timestamp_clear(stream, head);
>> > >		} else {
>> > > -			u8 *oa_buf_end = stream->oa_buffer.vaddr + stream->oa_buffer.circ_size;
>> > > -			u32 part = oa_buf_end - report;
>> > > +			struct iosys_map *map = &stream->oa_buffer.bo->vmap;
>> > > +			u32 part = stream->oa_buffer.circ_size - head;
>> > >
>> > >			/* Zero out the entire report */
>> > >			if (report_size <= part) {
>> > > -				memset(report, 0, report_size);
>> > > +				xe_map_memset(stream->oa->xe, map, head, 0, report_size);
>> > >			} else {
>> > > -				memset(report, 0, part);
>> > > -				memset(oa_buf_base, 0, report_size - part);
>> > > +				xe_map_memset(stream->oa->xe, map, head, 0, part);
>> > > +				xe_map_memset(stream->oa->xe, map, 0, 0, report_size - part);
>> > >			}
>> > >		}
>> > >	}
>> > > @@ -436,7 +444,8 @@ static void xe_oa_init_oa_buffer(struct xe_oa_stream *stream)
>> > >	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
>> > >
>> > >	/* Zero out the OA buffer since we rely on zero report id and timestamp fields */
>> > > -	memset(stream->oa_buffer.vaddr, 0, xe_bo_size(stream->oa_buffer.bo));
>> > > +	xe_map_memset(stream->oa->xe, &stream->oa_buffer.bo->vmap, 0, 0,
>> > > +		      xe_bo_size(stream->oa_buffer.bo));
>> > > }
>> > >
>> > > static u32 __format_to_oactrl(const struct xe_oa_format *format, int counter_sel_mask)
>> > > @@ -699,6 +708,7 @@ static int num_lri_dwords(int num_regs)
>> > > static void xe_oa_free_oa_buffer(struct xe_oa_stream *stream)
>> > > {
>> > >	xe_bo_unpin_map_no_vm(stream->oa_buffer.bo);
>> > > +	kfree(stream->oa_buffer.bounce);
>> > > }
>> > >
>> > > static void xe_oa_free_configs(struct xe_oa_stream *stream)
>> > > @@ -889,9 +899,16 @@ static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream, size_t size)
>> > >		return PTR_ERR(bo);
>> > >
>> > >	stream->oa_buffer.bo = bo;
>> > > +
>> > >	/* mmap implementation requires OA buffer to be in system memory */
>> > >	xe_assert(stream->oa->xe, bo->vmap.is_iomem == 0);
>> > > -	stream->oa_buffer.vaddr = bo->vmap.vaddr;
>> > > +
>> > > +	stream->oa_buffer.bounce = kmalloc(stream->oa_buffer.format->size, GFP_KERNEL);
>> > > +	if (!stream->oa_buffer.bounce) {
>> > > +		xe_bo_unpin_map_no_vm(stream->oa_buffer.bo);
>> > > +		return -ENOMEM;
>> > > +	}
>> > > +
>> > >	return 0;
>> > > }
>> > >
>> > > diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
>> > > index b03ffd5134834..99a04b8d586b5 100644
>> > > --- a/drivers/gpu/drm/xe/xe_oa_types.h
>> > > +++ b/drivers/gpu/drm/xe/xe_oa_types.h
>> > > @@ -162,8 +162,8 @@ struct xe_oa_buffer {
>> > >	/** @format: xe_bo backing the OA buffer */
>> > >	struct xe_bo *bo;
>> > >
>> > > -	/** @vaddr: mapped vaddr of the OA buffer */
>> > > -	u8 *vaddr;
>> > > +	/** @bounce: bounce buffer used with xe_map layer */
>> > > +	void *bounce;
>> > >
>> > >	/** @ptr_lock: Lock protecting reads/writes to head/tail pointers */
>> > >	spinlock_t ptr_lock;
>> > > --
>> > > 2.48.1
>> > >
