Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 337C8D68B33
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 16:23:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F37CB10E0AC;
	Thu, 14 Nov 2024 16:23:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kT4lh2W2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD31610E0AC
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 16:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731601387; x=1763137387;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5k88VnBxZhmsCeeB3CeB++5Ia1jM5D47L3z/cKQJKFs=;
 b=kT4lh2W2bsWG5Q16av+M7aQ/19+Phu7A2DNoK9OjqgD0u2ZfbASVM3Gl
 QEyWNo00WTBXD0HdPG/FmFkmqf9TbaLR0jbs0wjpc+Kw417gJKknE6Vtj
 hhN7UUyEVddINMIazirvbQvBuBItj6Vkiy4F6TpoHrY8a6qogVXfQgqb1
 DICf7GLbjvvvRC6ObFiQ46Vj70Q3zJyBzmEPrdUNK0z7glkrRCj5/TvjW
 ARCbra6sHAEHzGvGCmN8bzbmQ/b5XosV7V+v09hDs12YLw9Af5tagvOCK
 S06tEye0/e6svHmwBOovC3po+GGk4s0UgAhBzrlsZdNxv2TCoKzw3EJYl Q==;
X-CSE-ConnectionGUID: 4kdVzQ8nQbmHDtW3qBuv0A==
X-CSE-MsgGUID: itONGhF6SqK2WJUSvBhEmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="49080868"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="49080868"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 08:23:06 -0800
X-CSE-ConnectionGUID: Fu/WthMLSb+ZtcS4sttadA==
X-CSE-MsgGUID: 6XvrjEd8Tb+LsY5FwzwkDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="119073209"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 08:23:05 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 08:23:05 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 08:23:05 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 08:23:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K3nh//34VHj2ELjJc3FER3tBiwzaQA8fO6eATZdkuPnjQ6cvd6kigvKx7+bOUdUF7EocksBTN6GIsoag50Zrz1S12CWQDUVptKc1VCYairqJqn0wnSlrvmsEfZ+srSYMLMaYnVxnVEbkkzkIeDOFfBKUfC8X9jxahp4oP5wAe10K8QwCp6uK5IhN8LfG8nEKfGquBR+CkjADOo51kV5Y+mpVgfMkZhGtRXdSinO5oGe+EngRla/ZKJUDfSiumBSGz5pMKMw9NLbF+UTFecXwbRp3jpv776HsWFA/Jh/uYfoR/ISRw6MZPxv9SaCwaa2ojWxzHyeUoG3pAOe+MKcWjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XsPS1q6IJItFQGos/JqwqRWb9suVfGVtLu5LIGBxGKs=;
 b=FzlC2XhK9HoDO+ZweaMGTm4BOLbc+uEafuE9XAn3hgOWWazKV4dEWboKQvEOOLQr+VBrceWu6muBNbfTdtP0MAWr6UNjcdRz8jny73Y8MGDYrFNK4HQ3CtR6rmzRW0+/ghXkHQDdKiS8nQ32tsHHaifHHqZqSDIz9nATS0ONkznKY2+bZCT4zOwiuFmz4dRTHqqCTNH2ni4d8KW1PHEBwoXJdOCqvtOQDg/p48oivmEVlx819JXr67H1xuEzg3Fxa6epbpTyvelApIK51FPuOdkfAVr6Pkl1cVSP9ZD1AXqoTBqJwwtpi88Ht8SuwloTWY3LrNYUxxNSpbg/OzvgRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 DM6PR11MB4515.namprd11.prod.outlook.com (2603:10b6:5:2a9::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8158.17; Thu, 14 Nov 2024 16:23:01 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.8158.017; Thu, 14 Nov 2024
 16:23:01 +0000
Message-ID: <ab1cd1e3-0581-413f-88c3-a9a33296ccae@intel.com>
Date: Thu, 14 Nov 2024 17:22:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/ufence: Wake up waiters after setting
 ufence->signalled
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20241114150537.4161573-1-nirmoy.das@intel.com>
 <ZzYii99fHXfiWQ/L@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <ZzYii99fHXfiWQ/L@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TL2P290CA0005.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::15) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|DM6PR11MB4515:EE_
X-MS-Office365-Filtering-Correlation-Id: e5a77a49-582f-435c-c319-08dd04c89bf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bCtsdGR5QldsZmVhUFBiUlk4UTdYdTNGdzhjMDJSQzFEOW9BNDJhZU9DS3gw?=
 =?utf-8?B?c3JXeUdGY21hNUFiUGtyRHg4Z3Nna3ozQWZKWDE3STZQckxFSU93cU1WU3Bs?=
 =?utf-8?B?TmpoRnZtZERCWmVrQ29LQ2lkN3RRak9saE9aY1BRdWxmRytRKy9HVi9Md3p5?=
 =?utf-8?B?QnJWbkpGOVdQVnBzODZ0Qjkrc2hsdjQwNWRBMGZudGxqOFVRSkdtb2RHVDI5?=
 =?utf-8?B?WHMzTW1YT2Q5SUV5Vk4xVy9vVXFobEtMc3ZKWDJQZzhyNU1Zc3NrbjNBM2JV?=
 =?utf-8?B?bUw4U3pCTCtlaUZwYUhpMXJNaURyTUpmYzk5clg5YWFEaTZRNlVTdWNjSEdC?=
 =?utf-8?B?bFpWUlljdnhTRTFiblJRM3R3MkNBNjVBMmNNVzR5UjRweEFRYjFCNm9IUTMr?=
 =?utf-8?B?bnVoZ2hwS3JuUHBnZzlyOHhuL2svbUdoVWhuZFRydnJPQllBQnB2U2lkMnRj?=
 =?utf-8?B?aEo2a1lqVFUwUUltckY3OUdsbjlnNTVNTG0wYUtBWGVmcUZTcERmRjdkSmQ2?=
 =?utf-8?B?ZVBLcVB3S3h2S3h4S05BcFIxSlNFNWJsVVZsMkMwYm5lbUNXWmVjdExkMXN5?=
 =?utf-8?B?RXhlcXg4KzI4Z2FacVpNL2JKSGplMk9jMVJZNExxZExZbFU4SU5xUGZaNGVk?=
 =?utf-8?B?UWxzR01KZGRpSGF0cDhCWENTQW1jY2RJUnMrOUNIbW96QmNXajlJN2hpdDlN?=
 =?utf-8?B?SCtVL0UxTHB1cytDTktUTlZRZUw4NTZ4TSt6OHNCamVkVTFseXY4NWJpVjQz?=
 =?utf-8?B?emp5OUJaWUE4Ry81L3BpaEh3WmNlcmIxVy9uUTlKU05Dc28zYUJFQ1FpeEJr?=
 =?utf-8?B?eXMzWFd4dC91akNDUms5dFloT200emU5eUYzbmpObUNVbFJLd3l2a0ErM1E2?=
 =?utf-8?B?d0lvYjlBb3ZRNi92ektxdENVZHl1dUl5ZzBrOExNMHRHeGgwc3B4UFJWdllI?=
 =?utf-8?B?Ym5mRHpXak1NSEI2UGQ5RFBQMmdkYnU0d05BY1Q2Z25DK3JVRVJrL0kyQ0VL?=
 =?utf-8?B?RTk4Wno1WC9pcTB4WnJSWjh0c0lMU1dFUGJPaWgxVTBRL01UTCszbDJSa2Fu?=
 =?utf-8?B?eWxHcEhWNWY0aTB1UHNmaG9CbktxdFVmajRUQ2poZzNLcVZtRzZLZ0NxekVF?=
 =?utf-8?B?RVVQNVN4RTRlcWZMN2VSRlRjUmI0a2ZsYVlmZFArVUcxNTZQV1l3R0N6b01Y?=
 =?utf-8?B?TXFLRXB5VHRORVM5d1FmYjNQcUxJV3pKbXZ3MHJNMXdJMVZRNUpnUVN5d2Q0?=
 =?utf-8?B?UklZd2drS0IzbnB4OTQwWXZtK3o2MHhXL3EvSnB0U2Z1ejVpRzJuMks2ZWxr?=
 =?utf-8?B?MFRNVURqM0U2TjBHQWVhZS9VTTY4U1Q0bElWbU9oTiswTVlYTkx0cXUxOHYw?=
 =?utf-8?B?MkRKQ1ZCWVN4TzZCVDBDMHdxQ2Y5SW5NZmpRSzg4Uy9nUk9QSmk4Q00vdkYy?=
 =?utf-8?B?YXdwS0JNK0tWcDhzUlh4T2FaWHh1RGczUHgvTFQvdE9VTXNMd3VwZjl3d0Ju?=
 =?utf-8?B?MWpRVnNGY2pqVnluQnhZbS9sQkVka3VNVnFpYTV6VkFKYnhPbERQNnVuK0o3?=
 =?utf-8?B?TzRyY2lZOEg0RFNjcTc5UEF0S3g2VnVaT2hPZnpsMWVuaE5zeFZQYlpsb3FY?=
 =?utf-8?B?K2ZhSDZaRHZZclNaNzRqTUtVQjMzdklnaHJETFo0Q1hUd2dFR1FobDFheUdC?=
 =?utf-8?Q?RGypYpjun95IB1slyxQD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmtZSHZ3OWpjcWY2MzlVbnU1U0lLdExFdGtoeGdGSlBJNmw2UmxsUFpieTJi?=
 =?utf-8?B?QjJJWlVrWjZpYXBBdHdCU0t6TTA1cDRueHlNWUdIcjFzdHRnQ2hPbHNWTkw1?=
 =?utf-8?B?RG5yczlyalVGN1ZXYnlUMWhXOXlPYmhNclFpL2F5aUtCbjhUaDJZS05pVE5k?=
 =?utf-8?B?dHp0NGdxY3EyUjJmWHRxRVpLTExBaUNELzhDSkM3bi9Vb2p3YlR6VHEzSERu?=
 =?utf-8?B?YXl5QS9HRzFUNDdIWlNVQzdoaW1NZDBqRXhERlVEc1I1RTFhZDllaDlFVzJY?=
 =?utf-8?B?em1hcDQrcTRNMXo4M1ZrOGY2eUNvc0N6ek55Z1I2NEJodThPNVhaem9zbHpW?=
 =?utf-8?B?Qm1CZEpscWRJMWYwKzRpNm9OcmlQQ2JXMGd5LzJTZEVCdS95SXNVRE9ZMmtG?=
 =?utf-8?B?MUdtUHhQaC9odjZ6RjM4UHVqOEQxT1NwQU1Ua0hUUFBEVUhYb1RyYkdKbG9E?=
 =?utf-8?B?cmJnV2hhNVVWVWdKaWtEKy9jdkNpUG9aaDBXR0NuZU1kYzhWdDl4aHAxWjM3?=
 =?utf-8?B?eW55N3hEU2xLWUtUL1NOTWhnbHZmb3g4NmgrOXNnNndtVEE4ZEluMGJTbTlN?=
 =?utf-8?B?SWY4TlMwSkliTVNLcm9Ec2tzK2wxQW04UWZocElDdUFxODNqeVZzZG9XM0ZE?=
 =?utf-8?B?QXdyTCtveml3emZ0Kzg2QWYydHNIdVBoYlhkNnBBU000a0l2UUNTU1E2SGZU?=
 =?utf-8?B?RVRtNmtscUVzMnhiZlUrYVFSZm9sRXVEcEhVQzh1MjlGcDhTYnJEQXdSZDF5?=
 =?utf-8?B?M1VBN0dPTXpDWHJJVTU1eHJiOEhtOGpPQlNvMThwM01yVEFVTzFsaXBVb3Bj?=
 =?utf-8?B?VEZWZStXYy9aU2Y2bitvNEUwWm9FdUV5VytybmlvRFFtOWxTdW03MFQzNGRM?=
 =?utf-8?B?VjVFRjl0V1ZDWXNTVWxrK0lUb2t2YnFhcG15eE1ScnNmanViekJaMDcwV01R?=
 =?utf-8?B?NjNOeGFiZHJienZ6SGFLLzJaekpGTU12TTdXUGdiRW8wM2JYTFJaQU1DNnVn?=
 =?utf-8?B?anU4UWpyd0MrNW1aTm5DWklEY0Y2ZW1oUEwrMENwYzQycmJjQk8zMlFNVzhZ?=
 =?utf-8?B?R2FiVXhsQWsvQlM0ZTVtTFpnTTRhRmFnK0t0amZ5dTR2STVxZEVVd1ZvcDlh?=
 =?utf-8?B?OG5jeThHaHpYQ1MzQ1VnWm5CeUhZd1IxN3ljWVZ4Umx0MkNUVjlGa3gvUFJu?=
 =?utf-8?B?MzRmSGxSVG9nOGZOaWhPc0w2QlNqa0NxR3MvQ2hxcHRtNDRDQURacVRReGZM?=
 =?utf-8?B?ZTc0Ym1KQ28rZ0JrRk9OQjNMREVUUDNYQU5wZTlJVFhaV1N2VDZvcGJPRUtN?=
 =?utf-8?B?TjZmUW12S2c2SGtZbXhzbk4yU0pmNTgvRS9QN2tXL0ViOHFQQ2lUcit6dFhP?=
 =?utf-8?B?a3gxVTlOeW5WMURTRWlYQUVaekN6WmFIaDA3ZzJ4bWNjeEw5RDJGcGcvaUhP?=
 =?utf-8?B?eTZqaWZ5Q2tuT3JEZUZpcjh0eGowdzFYREh3c2F1SW9qL2tURHoyZXNsREhr?=
 =?utf-8?B?eDczZHdNZXlGdHB0VHpQSnRsZnhpR2ZvSDMrMXJQY253ckVCbEhKRGJ6alpm?=
 =?utf-8?B?b3hmMlJZU1RJOExRZFcvZWxvdTE2RzV6QWhtR0lFZS9sTktXY3U0ZkNudkkz?=
 =?utf-8?B?bUJOOEFhUWpzcytjWXF3SW9iYTQ5Y0hxZDg5eDdySm51SWNQRGJUSGxyTm85?=
 =?utf-8?B?M3gyaEFod2pBQ3VjNS9WOCtLOUJHUmlQZVVjVU54OGR2T2pYRFh1ajFWTmpn?=
 =?utf-8?B?MVVVNWsyVDVNR2tvYWgyU3BJZUM2QWJDNGNPamUxejBJS1FoSVBaOGpyVmNw?=
 =?utf-8?B?N05SN0UrN2pYbGJOSEhraFJ0MVdhVFpybDZ1TlN5aW0weHg4LzlxUC9zTzkx?=
 =?utf-8?B?YXZqVDA4bjUrTEhUOEVxSkNoVTdBNzl4eEQrUDhrSnU5QWlTT0xoeTliMThI?=
 =?utf-8?B?dEMyWlp4R3V2Z3lTM3R3NUxudXg3djV1N0tCQlJrdndSYThYcUcrZmh4OXF0?=
 =?utf-8?B?Z2JvTXlXZFRGWVo0ZlhVT2YxaVBvakNPRER6aml6eVVjaXFDY1FRaDVmVStE?=
 =?utf-8?B?ZTFpOXhvcElyQU9xWHdDbG55TTRmUHJIQk4xSmJMeFllYTBrejk0cTVpRDk5?=
 =?utf-8?Q?Snq7CLMP7fKYVurE+7D3bjPEP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5a77a49-582f-435c-c319-08dd04c89bf3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 16:23:01.6033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QHY7mvVe7x0ii9L2H6w+0eNkIGdA3i0vz+4HgsU2srBN82KA0Zxi5cWq116AqHu9vRU11JNmCzbDo2YkGyEQsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4515
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


On 11/14/2024 5:17 PM, Matthew Brost wrote:
> On Thu, Nov 14, 2024 at 04:05:37PM +0100, Nirmoy Das wrote:
>> If a previous ufence is not signalled, vm_bind will return -EBUSY.
>> Delaying the modification of ufence->signalled can cause issues if the
>> UMD reuses the same ufence so update ufence->signalled before waking up
>> waiters.
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3233
> Do we need a fixes tag?

Yes, it should have below:
Fixes: 977e5b82e090 ("drm/xe: Expose user fence from xe_sync_entry")


>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>


Thanks,

Nirmoy

>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_sync.c | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
>> index a90480c6aecf..42f5bebd09e5 100644
>> --- a/drivers/gpu/drm/xe/xe_sync.c
>> +++ b/drivers/gpu/drm/xe/xe_sync.c
>> @@ -87,8 +87,12 @@ static void user_fence_worker(struct work_struct *w)
>>  		drm_dbg(&ufence->xe->drm, "mmget_not_zero() failed, ufence wasn't signaled\n");
>>  	}
>>  
>> -	wake_up_all(&ufence->xe->ufence_wq);
>> +	/*
>> +	 * Wake up waiters only after updating the ufence state, allowing the UMD
>> +	 * to safely reuse the same ufence without encountering -EBUSY errors.
>> +	 */
>>  	WRITE_ONCE(ufence->signalled, 1);
>> +	wake_up_all(&ufence->xe->ufence_wq);
>>  	user_fence_put(ufence);
>>  }
>>  
>> -- 
>> 2.46.0
>>
