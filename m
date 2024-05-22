Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F370C25B79
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 16:29:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BEF010E138;
	Wed, 22 May 2024 16:29:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QbdMKwXa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A3510E1BB
 for <intel-xe@lists.freedesktop.org>; Wed, 22 May 2024 16:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716395369; x=1747931369;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Kz7c/KB+o+uB3st7B5uxQD6LS52qA122MGoeQnIQa1U=;
 b=QbdMKwXa/y3tKFniYIHbI3340Ui6Q8gifySO408VTFrFHg3mSXBUryU7
 coYncYmIk2PIcM92p4m5YgBw6Rnnmi09xfNMLhcpHDPA8bivUakQgRWN3
 Jq/6fkWksoUjN9tfbzxatTiHOEM5oByZXWPUjbsFj3Slhawm5meX955DK
 nXXXByiQBtZBCDdXnTa0tN9xRoWOD2bkQ1bgOGdrxG12KvbdclIhtcTkN
 albs29gL7tElEwYfhxSuo4yC0d9P79Aem1+dS5hI+sQSB4Iv3Y5OQj3VD
 7lpsxnPu6pkq79PnXLCEtCmFIajqRDzwoz04Si+stW1Y2fn2z7yM4Znpu A==;
X-CSE-ConnectionGUID: /rz7y81pSmy8vlqeMlVboA==
X-CSE-MsgGUID: P84dRiaBTR2byWe6y8weRA==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="30192390"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="30192390"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 09:29:29 -0700
X-CSE-ConnectionGUID: StSTsGhRSpqVrmh4Dx2Nuw==
X-CSE-MsgGUID: lbAQsQqNQZKMDOpnmWMVfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="33209354"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 May 2024 09:29:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 09:29:28 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 09:29:28 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 09:29:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VSEtfgKyqQ2ku0qMFCEhh4IV4VFkSvw49pOZz4pcqyUsDJlrMkbTmOHV6F7YFdkiW1EkqkLKvFKs9S0yLaqaAAgx23R72T99cLI3VZK+2bH2zmcmEUMDPV12gNEp8JRfVpGcb+4HpbWD/vbYMF8iJI58/NlFKZJWupEt6g97MjrokVCR+OqR8yDD2M73ijhVHB4GBPum88TOP5FHwr8X4lcH9ac3zquRFxGtovg+J18pINEWW68FFpRa5K2L5qYAwi4+y0kDTbMggmd5zHAbh2NK19wNiHuHGKyO5MxzICU/YIpjppWx1AwhGxeXsEThyj99yye1G9j9cY/qa1oQnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qoMjt6GausSPzdhUO90FBx97EX/H3yA1l5TEur68vbw=;
 b=RiCat5UNZcK6yt83rUy5UyWXywvyCtzATdRRACHoEZ0Z9PyuZSlDkbxtOYvR3yZXYkFKRzdYfNoPVoEvgittA9aMHeAp+0SKNMm9pIrvRwkbb5kl8y3sXiW6bmw9WaigEguxQ+qrwgYC3PrVqB//wb7X/XZYELNx0LmnLCe4A00eKVNNsueBk8BgKjEu4S7Yna8cfFgc0rDJzEdCM6Spe+LG/SenLUjxamOJ6Loa+zqJJFohAbk7i5bHChRRBfbDpoF1iu2vGl/27t1hDciKYGorg3hR9/l6My7I/BZ6MfJ18xm64XUKgEl4Ib9FeW5DvxPhr7WfxaMstPkeMbhxyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH8PR11MB6926.namprd11.prod.outlook.com (2603:10b6:510:226::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.34; Wed, 22 May
 2024 16:29:26 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 16:29:26 +0000
Date: Wed, 22 May 2024 12:29:22 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 3/3] drm/xe: Use platform name in xe_assert()
Message-ID: <Zk4dYh9XMezCFZvf@intel.com>
References: <20240521142257.756-1-michal.wajdeczko@intel.com>
 <20240521142257.756-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240521142257.756-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0174.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::29) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH8PR11MB6926:EE_
X-MS-Office365-Filtering-Correlation-Id: ac248790-3365-4f18-fefe-08dc7a7c5869
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OtUN1E07yy+ZsnFDDhg5H/2StjDQ/PvzTbaGCnwIBwOIqIZOkluUuOmk8os4?=
 =?us-ascii?Q?4DQA+8Ld7O2ecoOScbLbfxaSXVUlnRuNBD/7gteosoEn/RI4sJFCejR8iAH0?=
 =?us-ascii?Q?nZrXm1HbCnalcz/bksADHG5MUvdjp70QUQUMaT5lOrFKM8nThZrGYy68Fco/?=
 =?us-ascii?Q?xFAKEE5TEd1mth0gWEskS2/UAq8lKRVb4AA8OEjScZbb1XAPWBDt+koc9hMy?=
 =?us-ascii?Q?Kg+IrZNp9c3ZQ0iRt5kZLHtnvdHeg68CgltJX4Ahx7OaTYnOwB2vKWWiwnC4?=
 =?us-ascii?Q?auhNHTpcbkESMeTR2RQaTref4s/3HlAvjVAleLHG2isHBjDI6PIMPlA6Bg3O?=
 =?us-ascii?Q?uCdF69luG/MpNrMUFL90+wlBtPL7ogckVWcE7uASMELdUdZQUo5maGBG4KGR?=
 =?us-ascii?Q?cF7aAN07Us4fUAyjGRAjcyESuyzXgCkq1rCrQt3vP8xYpaNS/25n+Szj6Vpp?=
 =?us-ascii?Q?CIvbDKly5sGHmxI1hjMWVLv1vD+NUwR5VXVCgwIitTodKuYw+RCvZQJfPEC3?=
 =?us-ascii?Q?FYN42GeKE/oU3kwJYTtxhnRClt3x8wwxiYdWlmmf/kuVcf4fTN5oMgY8KXHH?=
 =?us-ascii?Q?7M5bKbhrbQGcDwL5tEdci72U1eah7qJvJQegLeudmXILWIUHo9uxo0BmpP3e?=
 =?us-ascii?Q?8VDSSYcClO7asQGEWCjlupvYG7jPKxoJyQWaAqxNnN5VWmJ2PKk6ObJ8iyBF?=
 =?us-ascii?Q?Pe09JLSmHmC4ddzdrk1M4sQKuR+KYbTl/kNbObBDR1GK84UFIdyc6hbL4MM0?=
 =?us-ascii?Q?7krMPoWRu+oAcMzeJ7ToDblWOCGII9BnxBQYsBFUKm3UpIwAXhmVdGoOtqXf?=
 =?us-ascii?Q?VPHgXFgyoxcVv89a+5nbYe4keMNv92U//wH7d3RAtci+PY38tujXFGZqaX33?=
 =?us-ascii?Q?k0XTpDXJal9SryfcxivNoRINTpvvEU5oknaxXxN5h991OCRZMsRTI2Xuqp9w?=
 =?us-ascii?Q?iDL5rPrQtbQNXelilsAeFBIBFIwbdXVP810wU0FSOAcdbxmsv3lIjiwSjNL4?=
 =?us-ascii?Q?kmWCyIBGArariGjPg2iTpYtFwbZEm/9UuREFmChQ7QDLfLPO29NYssVEcwzl?=
 =?us-ascii?Q?Z7G+mOhbN2qvdav2UvYhHl0N8/1r+HAm/Enc/dd8qlnaFgL/w9/5z2E7PqLo?=
 =?us-ascii?Q?TTvSSTs6iOY1WAndPKQKo8hknlBf6Fqk8G9lxSsgvhn6f5X3fDKkM1mjXGeN?=
 =?us-ascii?Q?C7m13ZgDt7rm8ADST/h5RsTIaYYUqF2tjO3K8eIcWtcCRNs987XkPCrMdkvf?=
 =?us-ascii?Q?p4FadQ3W7sRcGN4YUIJtEL6ohbGa7dy+EKZaYWCTjw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VIzGV5/fdVPXuwwUXVikttpZAgUZbfA/mb59xggKaM15AjZEEFTIFS6aJD3M?=
 =?us-ascii?Q?AQoaiDe5C02zMaXd8U18gaEEIHZ/I1FOKSH15sq/gwA6Ccxhnbigj54+rHbm?=
 =?us-ascii?Q?ahY7Qn416hEbb2i0HfVfE0XsUISr8cn+D5vMJmFgmiR76ggg16JQ1Y1xa4h0?=
 =?us-ascii?Q?6PBTMLTBK11VVJSH+H8aSEakkzIM7/yigK7tmsp1brz4W3zqExLGyem2s90u?=
 =?us-ascii?Q?CAzPhxWzi1L0UAsN5MkWPUSKkIGg1U1txC9mpW+b11iIJxLmhz6J7Q3M+iAW?=
 =?us-ascii?Q?+X+RJzDcaiZDDc9/sTrPEpECivp+FMn6scfWzYgIetT0+MHXeLD2NnTTeJdW?=
 =?us-ascii?Q?TbxLAZ6MLQwV0PrMNnZCB496F/mOx3Ol74hEzfHF1swOVHJcrNCWx+vFaUbb?=
 =?us-ascii?Q?WXayldVs6dt5xX821EjiZzHxMW+r1426refzKIUAIf0Io6+lBZrSWmbPC6F7?=
 =?us-ascii?Q?2iR2lV1lVMiFqH+ktZOR3jxRCiu9g43qPkbhGSEvH8BpSP3oJGB8yi65Go8A?=
 =?us-ascii?Q?SQT0/PSst26pp5KchbFRsrDQG6C1Wwt6tdFI5rtzgFcwkfaJW2IrgH2EiUm5?=
 =?us-ascii?Q?UBrrddHPB83wFi9jMwr+DYxii5KY163g52627I1morRkVc2Zb2nb//ZbcoE0?=
 =?us-ascii?Q?ZaNY7KLBVv1FefS59cMRIajblZBlnE08n96VVZrYBvdC3mK39XyojBhflXfu?=
 =?us-ascii?Q?SC+1qUKDIUb9Aq4h7+maYPkVFp3rs1bymtUGJSjOKeBKNB7knZ2bdbkEb685?=
 =?us-ascii?Q?1V5x4YAOYr5Beg3AxXwGts509zutOvnmu1QLu5BA8RXHGhxZBc3/g3BB3f3V?=
 =?us-ascii?Q?/4QzWnzHh7tw3ONAdQhKTLQn+vbqGXEh6O4Co/5UVfCUZnDCqB7muf7yxiX5?=
 =?us-ascii?Q?QktwNQrb4RCUT9s2ZPfPacgd8FksW2arrXiU1mXVMxm8n2+ebAs4XSA2YmEc?=
 =?us-ascii?Q?KaYNeajWoi3G7B/eo0qzshHUQiGqZXgxNWDac6ksh3GufB8xnZTtD3BIM1Or?=
 =?us-ascii?Q?hke7yFOXlFzF6s4n3IM1N3NYlaH7pszpKq/7dbdacE5iyng0aSnJ5nXKSkFT?=
 =?us-ascii?Q?bz2w7wq6yT8As/qeh1KEpTJKifvB+Jfs1CwcpffN0WgZV8j/OZHUzVk0Kin8?=
 =?us-ascii?Q?aZgzjrbpwGVzuWEDWjZHjSHBPGPXuNtWZ2wBMP4ZsAyw6KKaXTI55RYzWdSO?=
 =?us-ascii?Q?WhHZVhiOwApLsqqKB++0TGiLBxHJ3gkCRn0+qRkAcPBXNLGn8PPtTNZL5MoD?=
 =?us-ascii?Q?54RLbFtV54ArsPQK02xDQ7Z4DIZ0qGVE3VZpvFa+88QUcD87fi9LYViULH7p?=
 =?us-ascii?Q?mTHmvQ1OCDP3zUR8GGj1SaHh/7sDUP3NHP4cN+fOXcXEUUr4BYFfhX+6YZqQ?=
 =?us-ascii?Q?2OmZmk6wd91PMpztgYeyzyNmUtEC+0s/gjOASHvRVP0IjWRimEzH7A0NHjNi?=
 =?us-ascii?Q?u4Ic2XR7IcFyLqdain7IaSCDsUxTqfSWXNqDxYIh9Oc7uv2Lek6oco7IW2rb?=
 =?us-ascii?Q?dgiWaUNDVEym9elT9/nxysij57nYeCfyxclU/gfsi2ebPDtDUKceJpGAJBS2?=
 =?us-ascii?Q?ifvOwrror9AxhTOVELx0SezwV1QsSCURN4Wr9hb2nEOJ+M/Bq/z/35alIOhD?=
 =?us-ascii?Q?Ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac248790-3365-4f18-fefe-08dc7a7c5869
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 16:29:26.0918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S4DSsnq/TlWGG1uE5G7BuG3xxVsy/rSFPu81hXrmdh7UWSkUYvC+yTaMZEPysQ+caGUKcrq6fJ+hLbhkWY/7+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6926
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

On Tue, May 21, 2024 at 04:22:57PM +0200, Michal Wajdeczko wrote:
> We can now use more user-friendly platform name instead of
> previosly used magic platform enumerator value:
> 
>   [ ] xe 0000:00:02.0: [drm] Assertion `false` failed!
>       platform: ALDERLAKE_S ...
>   [ ] xe 0000:03:00.0: [drm] Assertion `false` failed!
>       platform: DG2 ...
> 
> vs
> 
>   [ ] xe 0000:00:02.0: [drm] Assertion `false` failed!
>       platform: 3 ...
>   [ ] xe 0000:03:00.0: [drm] Assertion `false` failed!
>       platform: 7 ...
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_assert.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
> index 34c142e6cfb0..8b0cc1bc9327 100644
> --- a/drivers/gpu/drm/xe/xe_assert.h
> +++ b/drivers/gpu/drm/xe/xe_assert.h
> @@ -109,11 +109,11 @@
>  #define xe_assert_msg(xe, condition, msg, arg...) ({						\
>  	const struct xe_device *__xe = (xe);							\
>  	__xe_assert_msg(__xe, condition,							\
> -			"platform: %d subplatform: %d\n"					\
> +			"platform: %s subplatform: %d\n"					\
>  			"graphics: %s %u.%02u step %s\n"					\
>  			"media: %s %u.%02u step %s\n"						\
>  			msg,									\
> -			__xe->info.platform, __xe->info.subplatform,				\
> +			__xe->info.platform_name, __xe->info.subplatform,			\
>  			__xe->info.graphics_name,						\
>  			__xe->info.graphics_verx100 / 100,					\
>  			__xe->info.graphics_verx100 % 100,					\
> -- 
> 2.43.0
> 
