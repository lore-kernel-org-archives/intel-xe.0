Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE97109316E
	for <intel-xe@archiver.kernel.org>; Fri, 20 Mar 2026 04:00:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C74B10E886;
	Fri, 20 Mar 2026 04:00:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ll3evev/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFEF610E886
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Mar 2026 04:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773979228; x=1805515228;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/MSVy6Hcsc3LppJAPKE2naleVL4nwt71byrC6bIxPgA=;
 b=ll3evev/FE60E8kC6IubF37lvWpKa7MaDerQoHSmQr4b2i8IebPVVLEB
 9G0Txr/vfDOzNIwYNLvVCdyt4rTv9mdHuiTkb3KLt77N8mmsVHU/3Z9o5
 BZJmxooXGXFohsRQ4/kP4WKqCstfjcmVk1TDaCooBAZbuqtM2WkGDSV3A
 Nna3rxs7y9rDKei4mIpt9OL8A5LGL752vvqkAdkiuAExPzNfFAmaPMDDl
 hU3N1NO/jNJSquAIUkJB1gVPpdkd+Nz4UJM6j4bRyytMQsGloKLIhxjt6
 5gvA/xO0dnBquaWGkp20EzSVoEsys/521XIS47hZdpWNYcw1WkEozuTcG Q==;
X-CSE-ConnectionGUID: DupZB/r3ShuX4rz9WF+ncw==
X-CSE-MsgGUID: mH6q39hfS9O5Nx9iyIjf7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="74241666"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="74241666"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 21:00:28 -0700
X-CSE-ConnectionGUID: AH2w+3wgQCOce8U+FLwpRg==
X-CSE-MsgGUID: daOWFCEJR5ayalvD0Ynqbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="246195591"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 21:00:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 19 Mar 2026 21:00:26 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 19 Mar 2026 21:00:26 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.55) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 19 Mar 2026 21:00:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=THHInK3ROrRUp0S7Iy9aBrUEUSdUCUbqr71YqwREFfhH4gVl5211qdnlyCizJwExO815ei6tM0G9IXY0mOyH1IQPM43025ks+2S1IZ0iiP8C6BxKsMdr5W2M+8RQDuqabdcLCQwkIK65wby1w4CIhQO+xrIBMFcIAZNGTihZi2UTbwQPND6cKyAx74KOb6ZjyADJv6sdzp3BFPvbIeKf3vpBuQ3fKocsNLehx8ZeRuXnA+AmhpwE2X43jjMbxdnV7I5DO5cJ61tEeTqV1zJuwLLLDRTKJafj49njJOwxoqhYa66g+9c10d1Mtbf1EdgpAZuEZa40y8gZFJkSoIammg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a76YjEf3vIWOXMAb/dwURSm9ScnFsqKRCk1G8l1MLXM=;
 b=FM8oVy67aNAxB+VlmUr6O2BQnfulfK/fplko9zSNp71LGR/FPMs4SldtXEgrePIL0j0rXhBSe9+Xf6JM/6Un9DZhfqWmgLyaDPNFmimQVnPXnQpxVbcjHWP4zHVmn0T02qSLtpK0+DylzshB2kxjwfY+7TNtKhzlWB19a/i7Nk9mEMZ5rKSmR518b8p0Wv65nJ5aSnKBouSvPVEu/r2EyB0Up1D8hlCRxzBQYKISALkDmdChMN3L+UllV0vuCdUEWndrqpmht3YfIX0mTKtlxFz+nbkN/ZGZPjGK8gh+yu/RA7zUDGWKJW5+TcOpmQskjsJzYtpvH7QO7TuA1jbDAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by SA3PR11MB7655.namprd11.prod.outlook.com (2603:10b6:806:307::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.12; Fri, 20 Mar
 2026 04:00:23 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.20.9745.007; Fri, 20 Mar 2026
 04:00:22 +0000
Message-ID: <ee0e37c6-f07d-455a-aab3-7443c59a7d33@intel.com>
Date: Fri, 20 Mar 2026 09:30:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/12] drm/xe/uapi: Add UAPI support for purgeable
 buffer objects
To: "Souza, Jose" <jose.souza@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Mishra, Pallavi"
 <pallavi.mishra@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
References: <20260303152015.3499248-1-arvind.yadav@intel.com>
 <20260303152015.3499248-2-arvind.yadav@intel.com>
 <7d5dbd23cf8dc8ef9f3acd2331f343d933852297.camel@intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <7d5dbd23cf8dc8ef9f3acd2331f343d933852297.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0071.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::16) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|SA3PR11MB7655:EE_
X-MS-Office365-Filtering-Correlation-Id: 761cdcb0-f3a8-4ca2-e869-08de86353547
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: ZxjAMF2IlkwtK63S8q4TizoCzbnQ0RanmqqpGPy+C/VaeuXGOK5fNH1DkEAy5b5OsxMeilqRSxqvSd3dNXWzJtmhvgfnLzLE7KnnRTUkygx3yPqz19mQ/hDBkzEM1FXQbr0Y7xQXcKa/Hujr3g2INycTnFGCUW4cqMj5Fb5/Vo+AFFIiNnXpzQmLewJL7LCae1YCXC/99Etm6CkJqzKwCcN/CNTif+OsiuBQMcNGqaIEijDWN284ZrjNivn8u/YYVrCF+qaKty4JhYgS3s+T/QWhdmfaWwHr0pUDnXBoWq3cLNVOz8N7IInprDOIZxiTu/KeucRWKmyZwqYSiAtgtoUyTezVAE9DEfwTSEbdq+HqUcoXlCvItg9r1GxvyQpAfVXTBcfmMnp+rKOnTVXvDjufZIhshLhruAuN4XWcMlYf/cEEjShLlK2q1YvONPPKnuXuCrU9zP+msVJHdd2sVfWPir32haPAb/8fKMb4W7YdbzNRsQAGXutExjOyrmH2PMGLvyvCEDeEdMXBe4uticLMmsUesjSEr0xtnHPhJ1jwbR8YXaGFRvdkeNjv0xIWKFpP0vuwWcYlbYQa9DhKR0Vpqqc17STICWjbB0NgPFrLvGK0EUYoH3QoWUxjeD0v9EapRRTKQJ6c2GCkvzpOf3Denu0w8xYIBxlWmV75kAkMXLuMfswtunJUICv7JTcgSZOoQclC4+gONPRHFCYH8yMGyXRa+o7+/XRuha8qk3w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wk1MajJkMmlLZ1RCS1JoSml5ay9VNCt2Rk8zK2NkZGZxUVNwZ25CNEdYbnkz?=
 =?utf-8?B?cDlNb2R1eUhiM3c5dkUxMDBXRWp2cm1MZHA3engxWW10YjNGWUpTczJTdzRn?=
 =?utf-8?B?OWFJSVRUdjIxaUQzQXNYWkpCWUNyN2MwaXBOcHE4YWhnL0VHTi9JenlZemwr?=
 =?utf-8?B?VVY4N1VZbmMxRU9ZN0lUejVJOFRNTjlybnY0VkROdGFHTVVVWVRRMDBIUll6?=
 =?utf-8?B?eXhtZXZ5SHFtc3JJN2ZTSmpaOGkrdVNHaHZHYTlTa2IrWWlNTmpJeTdsSWx1?=
 =?utf-8?B?Q3pMZC8wbWhnQ25JSktyY2ZVbkovK1h2aWViMFRDY2JmcW1CTDFMOXpwQjNo?=
 =?utf-8?B?L0MyNlpMNTNhd3I4VlVjV1dEKy9BWWdqM3Z4VG42WlY4cEtTbnlON1d5c3gv?=
 =?utf-8?B?TzZld2F0eENqSlowT1pPayt3YTNsOXd2VEhFTXdrcmFSMldCM0cxNktvVUM3?=
 =?utf-8?B?NlhGcHFmQjU2dE8ySXNZc0d2bDZvVHcwdW5tcmYzQ1Q2Wk5TZVM1T3YremNJ?=
 =?utf-8?B?UHI5WGVBMG1GSys5QjBqZ1B6MENhbmdmWGxERzVSMHd2R0pSaUkzQ3VKTHRz?=
 =?utf-8?B?WnRYc080RFFoSk1iZFJEaGdEQmlaTnRUcnlPT0Yxc0J2NE13N3lGQUx1Ym10?=
 =?utf-8?B?QzAxbDBNbGppR3dCVHlyMDdjVnFvVG44THRGY3lSQjY1NjNBaXk3SEQ0c1pQ?=
 =?utf-8?B?NVQxV0MwcW1wZCtKeTRnSVljbFE5QlZuU25rRzNBVUJDTW5iUmJIVzZ2N2NE?=
 =?utf-8?B?RVVCZEI4c3V0bnZlWnhVUzFjZ2VJNmhZZGM0eGVQMnkxRnpvY0hwR1VRQk9t?=
 =?utf-8?B?WHRINUVJVGZRY2F3b2YwMUE1d3BuYkJDOWhtUmw4dUhnUHAyV2VKd0F1Qkdr?=
 =?utf-8?B?NDY5cjM1L3B5amx5bDBIUGZNWWZ0UW05Q3d0MFRaQXRjWXg1MURrTTVFMlMw?=
 =?utf-8?B?dCtYZ21OejVIU1AzZHh4SDl5LzJGeHFvL1ViT0FzREVhZ3Y4d0dIOTgzRHBH?=
 =?utf-8?B?Y2RGazlLTFNtbkhHZzRUUGJrM28rR1lGTzZ6YVlrM0dPZXZvMWVDUEw0czd6?=
 =?utf-8?B?elFWZzZHdE9BRkVIaHNyYlZiRzhhd1ZaV25uUkNuVWZrMFVMa0hzaDJwOVk2?=
 =?utf-8?B?aEIzRjhOVTF1TUtNVk1MTFBMUE0vLzArbmVjRGFlb1A1cTVYY1h2em5BZDZ1?=
 =?utf-8?B?amJJZVJwWExGb2ZWejFGOHEyaStlMjRMWmlsWFhIL3czNENwNDdJZkZLcm1N?=
 =?utf-8?B?MmRKVnRUSHg1ZGpVY1BIKzk5YllEZTIwLytEWnE2Y05KSi9ycmttQm52MVhu?=
 =?utf-8?B?dDRyTjlacjlpZ3RwWVpQK3VjMk9CeEhqU1RxUUxIU0Z2Q0ZUL1Q1R2J1WTY1?=
 =?utf-8?B?c3MzTS9IWFV4ZG1VdnFHSENXeVR2OTNveFB3OXRocVFKQVdQdDhrYll1b0k5?=
 =?utf-8?B?cGdmT0pPTzhhbnhJL1JXd2syOHVITnB4NWJpWTJsK1NPdFRpR2RmZFRheFFI?=
 =?utf-8?B?VjArWEY4aWIzSHlIb3ZwSktFY1RnVW83a1kzblM1N2lDb1ZremxCaWJPV2Fu?=
 =?utf-8?B?QmVVV1lWQjJ0TDVRU0hIeStzSklHQU8wSis4dTRuY2thdkZoVDc5K29SU3pK?=
 =?utf-8?B?VnVsK0Yrd2hCc0JnZHlWRUpVLytzZ05IRFZSWXNVanR1cVhaR1djVnZ2MkZw?=
 =?utf-8?B?ZWdOeFE3SkdMVktlUnJrbDVHdUM3ZWJqckNiZGEvV3dlK2JqUnNXakxGeEo1?=
 =?utf-8?B?czVNTjZrVng5dGxyRGhFd1BqeDdDS1BRMno2ZERIY1VLYkhiTzNkQnRuaG41?=
 =?utf-8?B?ZE14QzhpRTUvbTJlOU5INWNJekNtZzRuV3NPeUFVbGpidjZacTJKbDJadit3?=
 =?utf-8?B?TGZRUktnVTlOc1RpbWtFRWVhQktXZkdOMC83M3BBajJZV0ppMmVVR1VWemF2?=
 =?utf-8?B?T2VBNGxzdUc2L3lPdlArRTNQK09Fcmwyemo0QURVSDJmTUU3dDFMbTErclJH?=
 =?utf-8?B?K2hPdmFISXluOHlUdk8wQkNDdktsem5saVAxUkZ2Q0NydDI4REZCaDdBRXNr?=
 =?utf-8?B?TmlOQ05pci9vejFIUGRFV292WXpOSGZkTXNGanJVTjZHdXhDdzFlOXNOVjZV?=
 =?utf-8?B?K3JxTHY4OVMzV08vMHFrTmJkTVM4bGRWcWRERUUxT05KbGNBVkJXTG50TEh6?=
 =?utf-8?B?Z3h0c25BODMrZE93SjQ1RHJwZmhvZkNMOGw2SmIzeDVTZFFEYjEzcTl3UmhU?=
 =?utf-8?B?eFRoSEZLL3VFY2kraGVPaUdSKzM3by94Wm5EZkZCZm1UL3lQaExwRnFkUklS?=
 =?utf-8?B?RlJ3dG5nTGlPS1kvN0FMOTNlaUNpQ3hscXlleElreUNMQ0xBbVpvQT09?=
X-Exchange-RoutingPolicyChecked: ncyvFXsQgH0mairHd8pzVjhD7Sb7jxgXDlQ/RzXHsbWESlFxhsvBD5Hv/rZ2qyzi87McqogM7c4/KmOYW2gWAXUDI/KViwVP9UvVQA4UyC0oDfNuT+vlGGHRjVNUxCD/sg9lqPiHt4u7qKIogbzNiB+qtdERdDNOAP8yI2t52POAawfDvapCVt3WCIWwHgHY0CLkJQeq16j+T7Cgsz0hK4o8/erm0XiK19/8Qq/pTtgzOu7i70A+v/+EoPWoI58SXmprX1ukZsEn37G7FJO+vUF+2IVmaJwg7kaqUiHweebR3FBGaJFk/hHh1aLhum/xdexJpwC3vZoYhRohNclA0g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 761cdcb0-f3a8-4ca2-e869-08de86353547
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 04:00:22.3099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TTGyoRQxdeH8/WXO0CLxGdli/A2QLrSpkV80/s6vswdSQjA+OFvawPD42sjNniAlL7QBh9LKshTQ50zqn+YgIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7655
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


On 03-03-2026 21:23, Souza, Jose wrote:
> On Tue, 2026-03-03 at 20:49 +0530, Arvind Yadav wrote:
>> From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>
>> Extend the DRM_XE_MADVISE ioctl to support purgeable buffer object
>> management by adding DRM_XE_VMA_ATTR_PURGEABLE_STATE attribute type.
>>
>> This allows userspace applications to provide memory usage hints to
>> the kernel for better memory management under pressure:
>>
>> - WILLNEED: Buffer is needed and should not be purged. If the BO was
>>    previously purged, retained field returns 0 indicating backing
>> store
>>    was lost (once purged, always purged semantics matching i915).
>>
>> - DONTNEED: Buffer is not currently needed and may be purged by the
>>    kernel under memory pressure to free resources. Only applies to
>>    non-shared BOs.
>>
>>    To prevent undefined behavior, the following operations are blocked
>>    while a BO is in DONTNEED state:
>>    - New mmap() operations return -EBUSY
>>    - VM_BIND operations return -EBUSY
>>    - New dma-buf exports return -EBUSY
>>    - CPU page faults return SIGBUS
>>    - GPU page faults fail with -EACCES
>>
>>    This ensures applications cannot use a BO while marked as DONTNEED,
>>    preventing erratic behavior when the kernel purges the backing
>> store.
>>
>> The implementation includes a 'retained' output field (matching
>> i915's
>> drm_i915_gem_madvise.retained) that indicates whether the BO's
>> backing
>> store still exists (1) or has been purged (0).
>>
>> Added DRM_XE_QUERY_CONFIG_FLAG_HAS_PURGING_SUPPORT flag to allow
>> userspace to detect kernel support for purgeable buffer objects
>> before attempting to use the feature.
>>
>> v2:
>>    - Add PURGED state for read-only status, change ioctl to DRM_IOWR,
>>      add retained field for i915 compatibility
>>
>> v3:
>>    - UAPI rule should not be changed (Matthew Brost)
>>    - Make 'retained' a userptr (Matthew Brost)
>>
>> v4:
>>    - You cannot make this part of the union (purge_state_val) larger
>>      than the existing union (16 bytes). So just drop the '__u64
>> reserved'
>>      field. (Matt)
>>
>> v5:
>>    - Update UAPI documentation to clarify retained must be initialized
>>      to 0(Thomas)
>>
>> v6:
>>    - Document DONTNEED BO access blocking behavior to prevent
>> undefined
>>      behavior and clarify uAPI contract (Thomas, Matt)
>>    - Add query flag DRM_XE_QUERY_CONFIG_FLAG_HAS_PURGING_SUPPORT for
>>      feature detection. (Jose)
>>    - Rename retained to retained_ptr. (Jose)
>>
>> Cc: Jose Souze <jose.souza@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Himal Prasad Ghimiray
>> <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   include/uapi/drm/xe_drm.h | 60
>> +++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 60 insertions(+)
>>
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index ef2565048bdf..42aedd30189d 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -425,6 +425,7 @@ struct drm_xe_query_config {
>>   	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1
>> << 1)
>>   	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR	(1
>> << 2)
>>   	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT (1
>> << 3)
>> +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_PURGING_SUPPORT	(1
>> << 4)
>>   #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>>   #define DRM_XE_QUERY_CONFIG_VA_BITS			3
>>   #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
>> @@ -2067,6 +2068,7 @@ struct drm_xe_query_eu_stall {
>>    *  - DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC: Set preferred memory
>> location.
>>    *  - DRM_XE_MEM_RANGE_ATTR_ATOMIC: Set atomic access policy.
>>    *  - DRM_XE_MEM_RANGE_ATTR_PAT: Set page attribute table index.
>> + *  - DRM_XE_VMA_ATTR_PURGEABLE_STATE: Set purgeable state for BOs.
>>    *
>>    * Example:
>>    *
>> @@ -2099,6 +2101,7 @@ struct drm_xe_madvise {
>>   #define DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC	0
>>   #define DRM_XE_MEM_RANGE_ATTR_ATOMIC		1
>>   #define DRM_XE_MEM_RANGE_ATTR_PAT		2
>> +#define DRM_XE_VMA_ATTR_PURGEABLE_STATE		3
>>   	/** @type: type of attribute */
>>   	__u32 type;
>>   
>> @@ -2189,6 +2192,63 @@ struct drm_xe_madvise {
>>   			/** @pat_index.reserved: Reserved */
>>   			__u64 reserved;
>>   		} pat_index;
>> +
>> +		/**
>> +		 * @purge_state_val: Purgeable state configuration
>> +		 *
>> +		 * Used when @type ==
>> DRM_XE_VMA_ATTR_PURGEABLE_STATE.
>> +		 *
>> +		 * Configures the purgeable state of buffer objects
>> in the specified
>> +		 * virtual address range. This allows applications
>> to hint to the kernel
>> +		 * about bo's usage patterns for better memory
>> management.
>> +		 *
>> +		 * Supported values for @purge_state_val.val:
>> +		 *  - DRM_XE_VMA_PURGEABLE_STATE_WILLNEED (0): Marks
>> BO as needed.
>> +		 *    If BO was previously purged, returns
>> retained=0 (backing store lost).
>> +		 *
>> +		 *  - DRM_XE_VMA_PURGEABLE_STATE_DONTNEED (1): Marks
>> BO as not currently
>> +		 *    needed. Kernel may purge it under memory
>> pressure to reclaim memory.
>> +		 *    Only applies to non-shared BOs. Returns
>> retained=1 if not purged yet.
> Nothing is returned, I think this need to be updated to reflect that
> the backing store is updated to 1, same in
> DRM_XE_VMA_PURGEABLE_STATE_WILLNEED.


Noted,

>
>> +		 *
>> +		 *    Important: Once marked as DONTNEED, touching
>> the BO's memory
>> +		 *    is undefined behavior. It may succeed
>> temporarily (before the
>> +		 *    kernel purges the backing store) but will
>> suddenly fail once
>> +		 *    the BO transitions to PURGED state.
> Just to make sure I understood correctly, if I want to change from
> DONTNEED to WILLNEED, I do the uAPI call and then check if the backing
> storage is set to 1?


Yes, correct. Call the ioctl with WILLNEED and then check the __u32 at 
@retained_ptr: if it's 0 the backing store was lost and the BO must be 
recreated. Added an explicit paragraph explaining this flow.


> By default all VMAs are in WILLNEED state right?


  Yes. By default all VMAs are in WILLNEED state.


Thanks,
Arvind

>
>> +		 *
>> +		 *    The following operations are blocked in
>> DONTNEED state to
>> +		 *    prevent the BO from being re-mapped after
>> madvise:
>> +		 *    - New mmap() calls: Fail with -EBUSY
>> +		 *    - VM_BIND operations: Fail with -EBUSY
>> +		 *    - New dma-buf exports: Fail with -EBUSY
>> +		 *    - CPU page faults (existing mmap): Fail with
>> SIGBUS
>> +		 *    - GPU page faults (fault-mode VMs): Fail with
>> -EACCES
>> +		 */
>> +		struct {
>> +#define DRM_XE_VMA_PURGEABLE_STATE_WILLNEED	0
>> +#define DRM_XE_VMA_PURGEABLE_STATE_DONTNEED	1
>> +			/** @purge_state_val.val: value for
>> DRM_XE_VMA_ATTR_PURGEABLE_STATE */
>> +			__u32 val;
>> +
>> +			/** @purge_state_val.pad: MBZ */
>> +			__u32 pad;
>> +			/**
>> +			 * @purge_state_val.retained_ptr: Pointer to
>> a __u32 output
>> +			 * field for backing store status.
>> +			 *
>> +			 * Userspace must initialize the __u32 value
>> at this address
>> +			 * to 0 before the ioctl. Kernel writes a
>> __u32 after the
>> +			 * operation:
>> +			 * - 1 if backing store exists (not purged)
>> +			 * - 0 if backing store was purged
>> +			 *
>> +			 * If userspace fails to initialize to 0,
>> ioctl returns -EINVAL.
>> +			 * This ensures a safe default (0 = assume
>> purged) if kernel
>> +			 * cannot write the result.
>> +			 *
>> +			 * Similar to i915's
>> drm_i915_gem_madvise.retained field.
>> +			 */
>> +			__u64 retained_ptr;
>> +		} purge_state_val;
>>   	};
>>   
>>   	/** @reserved: Reserved */
