Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE3AC5B56A
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 15:38:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A17510EC81;
	Tue, 11 Aug 2026 15:38:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I+Cyy3rE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26EBC10EC80
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Aug 2026 15:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786462692; x=1817998692;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=qINAAKd9jNecWhsJI0F3KLTk+ZOR2u4wa5yYehlwdrQ=;
 b=I+Cyy3rEReJcivlbcuVCUSux9Bf0sCLL972b3sqiuIsMU/NVLDWl1Wkc
 NJDyqg5cohby1Qlm+EHovFRbTYt7Mh2eNVpCH+y6p+5PQH2DSNsI3zmmi
 vaNv93xnLHNwWnZZaG/5FWF4cUPw11b8QKJypLDlBdmfBXHJNQpT2+MEq
 qDyZoGJyhfp1KykJT0zKdY6F8eFgbyU8kItRAl51YF0lxXuOPP+6JdrCj
 dyzsT1Xz0LFUDiMbc8Bmo/briuQ4bQJUwCvJYlFXspQaVGlijY3kCohZk
 AOnwVroKc/p4H+0YDOZ0nEaf3G6yjCRRWuGiRTaZM9DSNp73n4PhbtBxh A==;
X-CSE-ConnectionGUID: 4fB8gKqWSXed/rJrAnI7Bw==
X-CSE-MsgGUID: 0sBUKE/hS9OjNvjbyNW5Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="86119438"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="86119438"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 08:38:12 -0700
X-CSE-ConnectionGUID: CAPxhO50SA63hJzLJGMeEw==
X-CSE-MsgGUID: 12HP28eIT1WCliPGO2AcKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="261613650"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 08:38:12 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 08:38:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 08:38:11 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.51) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 08:38:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mCSszKxK3HDqbtPN26uh4b9lhk2CJeKj3/pcTOXn+abY5gNmzclEVFM3kd5x5+K2pJoRFiVi7QycSj0oF/cmcHpeeoQpI6PGg9kweknrD+AcCA8IQ5b9wwbp4hkjVbTCWRaxpaomgW9Mxo3izDk8OMNLHGiS+YfJ22jr2LR8gZwPORs3z3Ta3C0n/IbS3FRf0pItUgHrLlBWBR2mKpFF8uDPsUBLqG+rxsnglu0XoA9JqMEhvSMwTZGmFMp9N/sEKyVtG2y6cMhyuG/IuN5+AaJWnZwVcLj4X6W4NJFUcOPuDgNeWWP5oo/NUa3xowAP011bmodz0FxU1ICNkrXJUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXNUecHvpG3ZV51/nP3Oqnmck2A1QXlnHjBbeGlEGl0=;
 b=gsxNih077N6XIwCrnPphOe3bATDx4DNQrL19pnt+tgJKO6QH3g++WeWcRYY9o4QzZi7xj4LOlKnZoQycrJ3FBMm4XC0DmgTZq5HxumnGLF9pSPF09bQ0JGMW3WXMflKABy8VNe43RQ0gNn7F4v30RumH//6KCq//y0di+5+pN+wKXD0qO4oLU+qCHvWIiZtAsaz0iwAyAEI51sFEra9ftra6nrqiNblQe/PpzwWRaDuB9+psvXIQKXEx3ri0mu+Pa0wg28eRWtmE4TYCQOmN5X1wvHfBx4kWw555Vnf7U/8PqaFKnfzT0idsZ9DOHPZFEx0d7XqE8lqMjqXyHL3rNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by MW4PR11MB7128.namprd11.prod.outlook.com
 (2603:10b6:303:22b::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 15:38:08 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0270.017; Tue, 11 Aug 2026
 15:38:08 +0000
Message-ID: <41a7c5a6-b184-43b5-b5c2-2e5514f22c7e@intel.com>
Date: Tue, 11 Aug 2026 21:08:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V15 05/14] drm/xe/bo: Make xe_bo_is_user() public
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260811124016.3614699-16-tejas.upadhyay@intel.com>
 <20260811124016.3614699-21-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260811124016.3614699-21-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0015.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::18) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|MW4PR11MB7128:EE_
X-MS-Office365-Filtering-Correlation-Id: e4a966cf-a25f-49a7-2bda-08def7be8b00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|22082099003|18002099003|4143699003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: kpFe+HFmlVAG6UzhcBOdrf0EPVbv7r7msTCI5GozTvcWbTDHj9f8e9uNVduiLUQ3m6prbP3GheOcWNLsdax6JvKKCGjmEjFaOf6eu3lPocEfbWoqhO08uSx+qQQGehkuYmFw1xvrjGhqVDfW7Wsa2fuZ3C7eNSdeUUbrl2BaV/Ny2IID0T57njYmswZH6BWq7hZ2D15foAIN0S8nNhhwfDaGni8ncNTUqAgGNP8KKH5nxzEHEP5aFL7mpc7/J5Jgclt9SPN/afD0Fn0kYekspRzW5GPbGrWk66V92ZWh90oNzrDvypddq32QLNSgNxC0dQGvMIvwW9E0bTDjlb1VhGRXaHCEnE03Bgy1THvCZb2c/zZ6WJteqn/IS1gUJgEsT/mU7vQqZ9iOmJhS9pLpH6P8uMY3ipnbdZ45jJuSniAkjSRgmOXbRrcr23kWKhIJCPm6YuZ0vrYApbQxZ48bM+r5qUyMSklW9GjyTW/YJVdxMs+P9lrAOPRMACVdSkJqeyoAbchOT47I6D59O3FQIEXSWxLmqPrOPBGT40ZsgIQ0xh+tIa2ovo4d2sg/bBc4LzdJeay+ESWev5V//myQaz47UHlPrI3pnRxIT2oD8O4hclFlq6wePCeO6yOy9csediIx2OgkjUyF554XGRg0PwN1Q/iEARaTJVubY2ZsVj4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(22082099003)(18002099003)(4143699003)(10067099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzJtNks4QXQ1Q3hEdVJEYkVPK2FCOENvTjBtV3VCdEZNWkYvYlV5SkdEMDVG?=
 =?utf-8?B?cTFmaUdIS0VBQVdHL2pxdVFlYXVaNDF3UzBGMzZEV1pQNlFXQUd6L3pqZ1Nl?=
 =?utf-8?B?cmJiVWdWVTUwaE5LTHNJcTlIWVhjNi9OMDA0bjlGRzVHOVBFeGc1QkJhaHVl?=
 =?utf-8?B?LzNvRXlNVGcrVkpkaFZtUHMxSkVMM0s3K2pTaS9mZlhRUldva053Z05ZVUhO?=
 =?utf-8?B?Y2ZPZmV6WWtXLzlyVXQ1aVNCLzg0aXY2L1VZc2lYS0pRWmZrYTc5Q3BIUmVN?=
 =?utf-8?B?U29ScUtRZVdTcFZ0Y1dVejhOTWozRnErZFZhVDB5c0YwQmJjdEZwSXV3RVBS?=
 =?utf-8?B?RnZRcEkwL2cxVEdDN2hOK1E1czNLdDRNUU9iQkZMWVgzSUZMcjhJS3FPcjFs?=
 =?utf-8?B?WFBrMmpjNFh0MVhEaXcvZ1RIV0VjRU9pTFY4emxBWk9WM00wTjUyQzdsNGlT?=
 =?utf-8?B?Ni9RbzhtNnpFbmZmOWM0UXRtWTZ0RkVsRmJnMi8wY0dXcnZ3eXUvTkcyaGZv?=
 =?utf-8?B?QkJXTk0xN2tqTGxMSlFsZ1BFVXpNMndybFZQaHc1N1JuS0gvdU5XVEx4YXNm?=
 =?utf-8?B?TDVrVVJkaHlPMkhFTXVpY3dOb1NsTVc3OFpCQXRDVmNzUTZKWmgwQnNNMG9x?=
 =?utf-8?B?bmNHYzVzUlpYUWwvcjRVUFlLakJramRLbC94cXgwVlBqTmJJU1VmUTlGSjJ0?=
 =?utf-8?B?THBoSnNDTmg3VnJyYVhkSk9iWjZFOWRaakdIOTVYQmgyU0Q1VGxUdDgxd04v?=
 =?utf-8?B?b3p2RzdXdHV1M0JTbUJsZ01nN3JMNFlXSEtxVFlRajQxc2kxelptNzlzVnY5?=
 =?utf-8?B?Vk8yWTZtYWxGMHFmTlJsN0N3QXliaFFEU0xZL0lwN05BSlZ2QnpkTERhQjlS?=
 =?utf-8?B?U2ZIWkhoUHgraHFmY04ybTFTalFJQW9nc29KejRJL1lvN2JiakVBYVFPVmJr?=
 =?utf-8?B?SzdFcldoWmtCT0dOUFk3WmRXaEExNVJPN1ZKYXZ5Ykp5UWpiNDRMZitoeXp2?=
 =?utf-8?B?Yi92bUY4ODB1dDZVS1hWNGpzMTJCWUU5NWxEa0t1bldWTjgvZklnT3hZbkNq?=
 =?utf-8?B?S0p6QXVCdW5Mdkl1djloVCtSTVp3SGRSdEFpNmE2S3pBak5LdHFqbEJxaW1L?=
 =?utf-8?B?OG5uaUlXaHJ2cmhCY2NFQk0rWmZBOEdsTkxLT0t6all5Ni9CQkNicU9LdXlv?=
 =?utf-8?B?Uk5DSFk2bnQyelArN21MRm9JVTcxNkNJb1d6NFNrc1R5UUQ3Z3U5RFFSNG1S?=
 =?utf-8?B?SmxBR0hZaVBPZS83QW02Z0FjeXk1TVVqc1NFcVZCVEtvUktWekZQYTRYQjBW?=
 =?utf-8?B?b3p1eStnUExGTTNyYzd2V3ZKVE5udDdqdlhCZ3ZVanliUVVOTExkUmdBRUp4?=
 =?utf-8?B?cEhwY3lrM0t4Y3ZSZ2tsamk0Nm04dkRKWEtqU2JuZURpc01KdzZtSWtpbFRJ?=
 =?utf-8?B?MC9lM2EwczgxT24rSitPV2V2Qy9sbHJxbm4wbjA0SXhYOWpWUVVBQVRGRlNC?=
 =?utf-8?B?R1NaTWxzZWw3UjFvcU9nUkJ3RjU1b211NWhiMG9GQVJTV3RkMEtIVFFUWEFr?=
 =?utf-8?B?eW4xZ3YrZHVydlJ0bnZxOTRMdU1Vb1lPaFhYZVIvVWpVUDNsUGJvc0Z0dHpQ?=
 =?utf-8?B?eHI4L2hkQWxNTy9WQVhQMUpqcUpKYjExT0hCR2xaOFg5UWlUQjZEWHhYZlhS?=
 =?utf-8?B?eUpMZjljVmRTK3Z4SUE1cjRycExXczN2T29jNXljUWpaR3hsRUtmUWhrdjlU?=
 =?utf-8?B?Q1I1TGM5aXFEYlJnZmI2S2tRdHJ5dUwya21tblZWaWlGSzBkNnh6T2Q3RHBJ?=
 =?utf-8?B?ZWFBdHpoQldxZlN6cXgxSm5LUUJibHh4VTB2MUF6MElwd3NkL3cvaFJRa2Vo?=
 =?utf-8?B?UFVKaVBYcmVkazFKS21qYTlGMW1BNEpsNjRIVUJVbzhWWGpZM3JpRTNqbXRj?=
 =?utf-8?B?VXBDUVNDSGhGMXRRNDlIYmJiWmVwRUlmNFBOTmNaMVpRM2w1elYxYzNKQXFt?=
 =?utf-8?B?emZGMWd3REthc3Q1VUFFUmR1U0N2akR1T0xJYVlCeVgwTDJqWldOR24xSzd6?=
 =?utf-8?B?WmxZa3lhNFN3TEFYOHp3SVpJWXgvanUxS3dvTm5BaGlPMDJlcFBGWlFIMVRZ?=
 =?utf-8?B?cFh3bFZYZnVSMVg0NnlzdFExdHJMV3lOTGh3Q1RhMCtLYlY5dnNxc0NUN09t?=
 =?utf-8?B?YUE5QnFKaUVSTmVtVnJxR0ZvTUxid3B5UG5sKzBrUUdJUitIcVVDT1N2Mmc2?=
 =?utf-8?B?a1puWDZud2xtY1RpTlJ6NTZkZkJadzg1bFhZU3orNmNTOFRxZmNXSTBaczhD?=
 =?utf-8?B?d0ttbnpuaCt3b0VVblhWQkpsNlN1aDkrZFEzRjd5d3d6WTR0VG9jSlBOVmYx?=
 =?utf-8?Q?rSk9wgRpZ3XBlm5E=3D?=
X-Exchange-RoutingPolicyChecked: V/M2p94x+Kue41g/qKTDbES41FoG5wCZIcvG7qvRT8X/iKhDp+vToOreCgGjwIOIrfclDoZ6MfsBZ05+kUnjjr9wgDndOBIOn9L6mXOxqnJKS3Y4SljfmVDluZx8uP0b35Pc32Ll5Q6Dmka0sdVk3+cz4CmtJG/hdC6AwsazvQ8sL4HrXbJhCriyzyqukIXCIvxWxK7ElHjozk9ueJWUBu+0F4KRxVAKZ4x8T/eXc8mNlIVbHzWLNb2ftz7BY89+HiXQnhHMbzpfyzaRi/75cdJ7mNxPcKaXdn5wJIaEoK2ZfKbxBnFFo3XvMGjEzbEMlHJhEWHEJddtupBLO9ec+g==
X-MS-Exchange-CrossTenant-Network-Message-Id: e4a966cf-a25f-49a7-2bda-08def7be8b00
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 15:38:08.2585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BS8dLh1v3QNqL0PIdtgX4ey24lDP8mAm48DY5X0z5sJ1U5Sy4SFyS2La0V+yFIt8TFj7wd7CdFRL1fWXIOmq67VYAFrenlzdlQgC/9TE8VU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7128
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



On 11-08-2026 18:10, Tejas Upadhyay wrote:
> Export xe_bo_is_user() so it can be used by the VRAM page offline
> code to distinguish user-created BOs from kernel BOs when deciding
> whether a faulty page can be safely purged or requires a full reset.
> 

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c | 8 +++++++-
>   drivers/gpu/drm/xe/xe_bo.h | 1 +
>   2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 52f81e972ada..b077d137da57 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -158,7 +158,13 @@ bool xe_bo_is_vm_bound(struct xe_bo *bo)
>   	return !list_empty(&bo->ttm.base.gpuva.list);
>   }
>   
> -static bool xe_bo_is_user(struct xe_bo *bo)
> +/**
> + * xe_bo_is_user - Check if BO is user-created
> + * @bo: The BO
> + *
> + * Returns: true if @bo was created by userspace
> + */
> +bool xe_bo_is_user(struct xe_bo *bo)
>   {
>   	return bo->flags & XE_BO_FLAG_USER;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 90b15fff36c7..eede678ad303 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -601,6 +601,7 @@ long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
>   		  const struct xe_bo_shrink_flags flags,
>   		  unsigned long *scanned);
>   int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx);
> +bool xe_bo_is_user(struct xe_bo *bo);
>   
>   /**
>    * xe_bo_is_mem_type - Whether the bo currently resides in the given

