Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0032C5DF85
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 09:05:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A07FA10E72D;
	Wed, 19 Aug 2026 09:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OK6g9f2Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F8410E72D
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 09:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787130359; x=1818666359;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=LD83YQANINY5HUIFjpVbdmZIS5CO8gaLaKownF/lcZI=;
 b=OK6g9f2YrseE3I/dl3YLSfungS4jYpn6Mgols64P7qMvaRbQKcCLi0z4
 s5XFjfl6qWMWE0H1+SIiEZTML9ceZoWWSBF+Ph3YzWN14vqyuln5eja7B
 l4etBYlUZ6PYqliEqZ0ZoILCLEzP/ceUW9zGgU7umKP4ARI2dHundvqxP
 WvqGrtuHfMwkzd1ATzK3EmlnmfKnAhJkNPogkjQifSUkCg31ElQyzxVBX
 DQJztSdeGI11gznJkXVzN8bv7dsZigncat/pm2OQSDunoJIbt6DDGUshB
 7AOYcz1oWE9/lkIHIEryRxCXYTJsD61zflGikIh9tvBrgC5qJtPub6+bp w==;
X-CSE-ConnectionGUID: POBEcKrJTNqLhV9maRfPVg==
X-CSE-MsgGUID: jfrPwsB3SCW8oCKsL6E2tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87842517"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="87842517"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 02:05:58 -0700
X-CSE-ConnectionGUID: SWmXVsQDSN6dfrAJrS8LpA==
X-CSE-MsgGUID: 5QUmfc1WRD+M9uXjFp8V3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="290293723"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 02:05:58 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 02:05:57 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 19 Aug 2026 02:05:57 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.44) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 02:05:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CdXk7wUtk1ZdznYIJ9FhtujJLH0vRas4L9wR3Ucp4ZpvwGYVwC33r6lJHU3I2rNRtdApmhgCwJYw9nxNx9k79IwdvjLEholKZxDx8F9epSb8+11gkuDVIpi/NvmWWWlmBDUunv33xuGoPEc1LrIG+azUYvJlZFb2ONPIRxiA39TXaWTl0ebRX8U+g0hE5XCwOJ0C9tMaFbTJZ30GGvpW8B5FcSeI3Ty5lbZPCNttxQYDGHt6gPZ+lLm5Oqr41Ofo1TBrimKMr5TPO+yErliEeYCCX0PjuLLwcuBaWvLqMRe1BvsGsF5iQvXf6gngmrNUEZda1wvNz9gh6Xz7rN7KoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZ3k6GAmW6C7EP5HoctD7Q7Atg0EyGg3gPZg2+5+dUM=;
 b=BLvfYMFBOZ3/UCjZS8B8+9gl81tUxCVt/ZPv5laCSvdx2lAK41YgcC/d0Ra1iwQvOv2IYGmvOIa6chiw0LgFpK3IRCBr39XWsG7eMG5M3cDk9WqnvhrspCrcUY8PU5BSjsjbpVpHCn2obkSDNAeGJsmjOgQvyXcnL2Y+aClZbdNHJhbRKqDO1jaeRNLFefASl0cu4ajznoqO/EUEOvK+oPwZJcsbUvLqv5GVfcm/E5kNibL7d02dmGADXZZ2UYAciOIiFNO9XdsiGTtoQbAWYUu+R5Pyl+wzeU5mqRtcjY7wNvPS8DNgzcnyc2T04TatT9HBXsrBGOJ4J/PSi89QNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by SJ0PR11MB6622.namprd11.prod.outlook.com (2603:10b6:a03:478::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 09:05:53 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 09:05:53 +0000
Message-ID: <cf79e487-327f-4d24-af63-7986944ba1fe@intel.com>
Date: Wed, 19 Aug 2026 14:35:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/ras: Report internal HW errors from CSC
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <aravind.iddamsetty@linux.intel.com>
References: <20260818231716.731788-4-umesh.nerlige.ramappa@intel.com>
 <20260818231716.731788-5-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260818231716.731788-5-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0108.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::18) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|SJ0PR11MB6622:EE_
X-MS-Office365-Filtering-Correlation-Id: b4e4670d-e174-4ee4-9fd5-08defdd1123c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|10067099003|56012099006|6133799003|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 2eHxiCuSRhESaq/numXIIlKkcwk+ZdVSFOJdPGNvRjmf0dWNE5s5+k/hUqnurYnCL/kLcBapmGtF89/AJ1HXYJ6vQRahD6xet8ychYgt99xLrASobsGw6wJFCBlJGpb5ws9uEc0XM7roUyV1AP1phwQsEf2PbQ0U3/sGtJCKAyZbzRMI4IfsyCfzFsH7VT+qfeUa5NuDZpt0WG9vlEbYEZC8hx1jYVEU8zka11WRuFt/9C+qgkGcz9AKbVrfCj25JkMPF6ArFustlWy6IxbkmACs+fJq2pp0t9pmQ9CwuKXN7gNDgzDuHXJJEbFd1JbNUF5ohBFLpYq7hTXY4zlOUgDFceavdtjpbqu//cW3dgeFFhDzdiCVEf0yemTMZ5CJP8badmirK71Ik6aPj7xiFsJTDi/xhWZ6yr8vt4YenP/+yRXe7wwVuQHe0mPJBHP3aqHyyZDKGEpbCpAozugX6T0uDr2Vucy2jJGNGGlOojF8JPmKX6ysRkTkavkrCrg4UEyhEojgghM7upNxGg394maI/oVBePgzZ2GZ6ZqwS6JTFkr7HU6iThc8NfcEllJZ6rejBxWKm2KzxmkanaxMyck3SCvlQ/FIDzdeyw6AondArd3yodw+SZY2vI0knhi7U7LV9Vdea8hZKFSb6m2sF6urVEPNZGwJkp6aVxOg3f0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(56012099006)(6133799003)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmFsZENERFpsTlBRV09mQXUxVCtQczRrZW54Q05maUFMMmJjSVpVaTc1K0JL?=
 =?utf-8?B?ZEF0TjFFR1pjKy8zbEFVYXUzZGxyV09COGpWR3cyTk50MUVWTzczeE9MZDVw?=
 =?utf-8?B?Tk51VlZ0a3FuMCtmY1Qra3lLWFhjZmt4RDFJclltQ1VsTmZ4cE84QU9zQk42?=
 =?utf-8?B?bU9KVndYT2hDM2VaY1FIcGN2d3Q1em14U1hsZDkzVVBUQVR4NDBKS3BBSkxm?=
 =?utf-8?B?ZGZBNStDbUgxbnJxckw5NlpVb3dPTS95Si9VTnZsaFlkSHJZNGpybXU0cURx?=
 =?utf-8?B?VnpRc01hczIvRCtuMmVVd3ZiY1hFTUk5T2Z6VWdnUDhML0xMUnI1TVhUaG05?=
 =?utf-8?B?aVVGQzdtVWFGdG9OREhUNlNBc2ZaV1pDM1YyUDEvazlLd2NQRklScVIwVjRU?=
 =?utf-8?B?NmNoQmhIUE5uZkhFVGlVQWpRSWtaZTVKN0hYbmJMam00Sko0VjNzR2lmRTM5?=
 =?utf-8?B?V0lLVnBKaVFuVk9kYkk1bStaMDJ3bjdCeUNRaUVHQlMyc2NqQWwwUmVZbWl1?=
 =?utf-8?B?SmxuU2xVbVhtVVA5Ukt3c0NXVldmTVphZG4rY2hlYTRmWVhJNzJBbHNwUGkr?=
 =?utf-8?B?dlpFL25QOHY2eEM3SWpOVFRWcS9Mck9QSkxUcDVscForMDdsRlhrdTdaUnA5?=
 =?utf-8?B?UGE1bEN5NmxQVHVLMVNtSmgwaUdrdTJoT1AzbmxTNDBIem5pT0lwSXFTdjV4?=
 =?utf-8?B?TUZ3amp3OGdFVWpNdmRWajB6S1pMVmpIQ28wOFFUUGczSGRLMGJCR3VlR3ZX?=
 =?utf-8?B?cFVGMUpqVCt2STB6SnVKcDE3eCtmWTZzOFlWVG4vTWFsU1V2OEtSTG1CTjQ5?=
 =?utf-8?B?Z2dQK0c1SGxiZ3hJeTVNRGtKMUpoRDVUWlRDTks3UWZjRkROMFlscGtXOUdL?=
 =?utf-8?B?eWdQNkNiNGZPcVRqak0rcUZ5OHpUYnZwNkdWRVZYZGtTdXlWa3J4dG1kdzJB?=
 =?utf-8?B?MUN5OFgxWjU5UDVmaDJ4cXhmL0tQTG5pRFl3MVFuM2hMZ3dkYkYxZ2ZWUFRz?=
 =?utf-8?B?UU4vM3RjVjRYdTNuR1dacGFjcEttcm82UEttMjA2WXBtNGdocXNISlJkL2FO?=
 =?utf-8?B?NzhhSXFOUDlWdVcybmZ3WXRQYjEwbEd4TVBrbXVwTUR0ditoN0RlTzhxK2FC?=
 =?utf-8?B?ckZaeUl0bXVNeEN4amtGd21VVkJjQkFSWU1seEYvK3JBZ3BNQlhIc2pDUU1x?=
 =?utf-8?B?VFo2QTJyK0I2YmFRc253TTgzZTZ5NEpPUzVDMERQRFlpc1BiNG9tVnhDUUc4?=
 =?utf-8?B?cjdjWW91alhEM01STkpKNGtYTm9wRzdSbHIxbDRBOWdIWTdPMWk2MUYwUW1x?=
 =?utf-8?B?RFFuL0RnRkg4L0xTdXBOMVBSTXliOVZGRFEwSHVYYzBnOEZUTzM2S2FzakJ6?=
 =?utf-8?B?ckVrenpCMTdOalliYm9ZK1JmN0luL0YvYmkwUDlEcXlnRzZHRi9qZjhGcUdj?=
 =?utf-8?B?Y2ovYUZvRWE3MVVUU05yQXJkZ2NzUWxUazd0WFNXenQzZEV2R2k4Y25jQnV1?=
 =?utf-8?B?VEpmRDFzby9mUGlLdXNma2x4MERPazB0SEpvSnVxY255ZmZXVmgyVTh4a3RP?=
 =?utf-8?B?L0xWTmYxUEo0em9XTmNYVnNPMFBZNnp6MW1FYWkzQWczMjd6SDB1djRzWHE0?=
 =?utf-8?B?ZU9mc1JoZDVNTkJEVko4MHZncnpUNzhlZEhCbEY3Q0hqd3hNVW1TVmI0VmVM?=
 =?utf-8?B?MGhNZXVBK2lBcTBqbG01am1MNWtLcGtnZUQwNzVuSHdFN3ZONFN2VXBheDNK?=
 =?utf-8?B?bjNCVCt3MlNlanB4Mk9MaFc3d0pmNHN0NmM1ZTZBT0UvSmxCWFFwVTN4Y1lY?=
 =?utf-8?B?UjFRTFRJeUk5SGxrVUtsemdKK09MUW8rRjNMMHQ1UXNaSi93eFhYenpUNEpx?=
 =?utf-8?B?dnY3OGlXMGY1cnM5c1UwTlFQU3I3NDhXZUVvMWlDRGo3VGg1dHdIU0ZzcWhO?=
 =?utf-8?B?Y1lRSnlCZ2xFVWtod25pVzZVS3FnalI2Y2k0UitCd1M2a29hQjE2ZFRnSzhZ?=
 =?utf-8?B?UDl3emtmaGJmY0txdHZlOThIczJVU2MvL2lLcENSaXdkMzc5SkRYRDhXUWVj?=
 =?utf-8?B?eGRXbFp3dEd0V1FYL0lFbk5WY3YwYTUxMG9zemlKU1dET2paSHk2a29seno0?=
 =?utf-8?B?U0J0dUtTZVUzK1hYaXVQdTJ3bWFaYmNwekRKdVRiVXAzaUZ4alVZQitOQ2sr?=
 =?utf-8?B?TXRjTW4xZ0NFanZCTzZIQWdEWTh5NUJBaGVYOVhxaDhMeU1lSXJ5VTBOM1pq?=
 =?utf-8?B?TWtoMEQ2cUhRRVgrYWFiRVY1K0ZqbjQ0aWt6L0FVaW80cjlHUEgvRjl6Mmgw?=
 =?utf-8?B?WUVnQVFmVFBPU0s3czVIaXZ6UmJyZHhuYkVSLzluQmR0emZnOGNodDV6YUZX?=
 =?utf-8?Q?IUnMTLocN3m0POeE=3D?=
X-Exchange-RoutingPolicyChecked: jHpTZJebHCqSKUxKwtj18dh67gaqpDqmCIUyLb1ivtF5J4hBRGFTrVWfQ9Fm5wESvFb0eSRQynZDad8xmCSSUXLDIVnAmkNjf0vjrREazG0EOKoYO4LcCxYRA1hDbUZkazLkqpNs9MLebQGLiSjfevSZxl/DAs3v0YUH4vXCEeSEWRgm9f6vSjhy5wh0QPIPE9Y20MHIlbKn93LI2ZKZLrhkeGLwZJZBoqchLHK87RGrHDRkdXnSdrzyNyQbpB8YGbWAsi+E1Pb/OTJkZfKDsEKTAbQ0PjhaLHV8f7fwvJcDFpZosBw6bGSCSbCQFWgNEB64v7MihPy307N411zbLQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b4e4670d-e174-4ee4-9fd5-08defdd1123c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 09:05:53.1871 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EZPwpnrEf/De673LGgMWtaHsKGQvI12vfyqQkbK1F8PbEp1O76YMzl7nhM/9po+D10yCuEngayQ12b6s6TkjJ8B9Z6wTKKoSgyQ97M64DN8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6622
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


On 19-08-2026 04:47 am, Umesh Nerlige Ramappa wrote:
> Report internal HW errors from CSC using the xe_log_comp() helper. Since
> the error triggers survivability mode, use CPER_SEV_FATAL as the
> severity.
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ras.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index d25d25f77531..13ae54afedf7 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -342,9 +342,10 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
>   		 * is required.
>   		 */
>   		if (csc_error->hec_fw_error) {
> -			xe_err(xe, "[RAS]: CSC %s detected: 0x%x\n",
> -			       sev_to_str(counter->common.severity),
> -			       csc_error->hec_fw_error);
> +			xe_log_comp(xe, CPER_SEV_FATAL, SOC_INTERNAL, counter, sizeof(*counter),

Better to use HW severity rather than hardcore.

@Badal

Please comments on counter ( as I know, you need counter + response for 
cper preparation).

> +				    "CSC %s detected: 0x%x\n",
> +				    sev_to_str(counter->common.severity),

Once passed correct severity, no need to log severity.

Thanks,

-/Mallesh

> +				    csc_error->hec_fw_error);
>   			xe_survivability_mode_runtime_enable(xe);
>   			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
>   		}
