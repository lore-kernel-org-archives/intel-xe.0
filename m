Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2602C47DB3
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 11:57:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B1510E125;
	Fri,  2 Feb 2024 11:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DL5ahyib";
	dkim-atps=neutral
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Fri, 02 Feb 2024 11:57:40 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CACC10E151
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Feb 2024 11:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706875061; x=1738411061;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5aN/gY0vYAiuN8JlULIdZBYhXAmlPgxzo2LBlfkU6ws=;
 b=DL5ahyibpqoLLnk+tbbBnyA3iaonYm7RdKhwnrO3bnQYnygFtNAsHf+N
 v1ssEiqwkaUI5sxYOpzNAcaYCFeM/X6dqosHVvkCFPv4v4/bs1/rcSfVT
 V/TPCI/h61J1IWS+n+PU+0B/yksEd6Q0dVrLCGImCHhhOXv9jSXGebR4g
 iTpyK7RSeJK5qlW9m1chWNfdWV3JlARwEXzkwJzFs3j75k65/9PcHRf8V
 VbiIo3NxWtBfglirG6c1XaFsWtnqamEhdEzkHVbExM6Rii3xPLJVX7OC1
 Zy4b/BGUw5JIYsyfv73kNcNzdaECRyl9Dvh/5HnE2gG907UnBVTZGqL5h A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="307820"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="307820"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 03:50:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="4676591"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Feb 2024 03:50:33 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 03:50:31 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 03:50:30 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 2 Feb 2024 03:50:30 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 2 Feb 2024 03:50:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TNmAd/WpEUgS+m5XsiA7bhH0tNBp0050Y04uh3ful/gfG3ttJtdQZIoAqZPcX7rwqUKb/YR9cTWO+5HL5ubP7ceBmJ8UcJL2xDrrsVNmemgPqGWnooBQrOCYuApYjkTTIB5WqIthdjmB9TYn2evcYdPcEM5bcxCJGdqKWNkOoOsl1aEjQ/9PnmFDVYXy2EiczQLnCUPjmH4ArWf25gaLN6ANZJ0mgEAa6n5ctsCPyfTvx1ZjYveoxT2axHgGc5jgDo1b5RHhGnq3nauAePAmaM0aOqpPo8Y/b1A9bxpKiSJTogEPKBSU618Gw5E3NaZWfyxPZXAogfzw+zE1cRWcBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oEco9lZ3GbNhjyRD8wGpvGiLlSthus47RGFTQ5G/kvc=;
 b=LwehzPpW2kJGOhS1OCgS2/0e22PQIHSc1icwa7cxv+OYoZeAU2tDNvOzCZkYz1rXb9PQA6TNuRFTtMv5gUWwGKkz+4djHxoDeKzv9IIj8PwHCCSkQUX3pOXQPaAzfx4AtO7+6+ds1SdvvJO81zCoVGxjMt8Dnas2Z3ridsKBbn+g6GSFEoLgfmyr/srnFbWtLAMRBqcp2hixR/ThBlgFyLK8Qbz5owlKEyZE4GXK/Lme+Q0vE4BbGRG344trZL1dO1uDjxEusS3zFcXLVTmUbehmbmoWKreSOXNRCxN85fnW6ohlspaY3qilLie6sj63vy9cPiL2/3rBhtXKBfDFLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SJ0PR11MB6814.namprd11.prod.outlook.com (2603:10b6:a03:483::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.30; Fri, 2 Feb
 2024 11:50:29 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::c3f1:7053:cb08:737e]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::c3f1:7053:cb08:737e%3]) with mapi id 15.20.7249.027; Fri, 2 Feb 2024
 11:50:28 +0000
Date: Fri, 2 Feb 2024 12:50:22 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, Thomas Hellstrom
 <thomas.hellstrom@linux.intel.com>, <John.C.Harrison@Intel.com>, "Ashutosh
 Dixit" <ashutosh.dixit@intel.com>, <tejas.upadhyay@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Always allow to override firmware
Message-ID: <ZbzW_g0kh8HKm39H@fdugast-desk.home>
References: <20240201224724.551130-1-lucas.demarchi@intel.com>
 <20240201224724.551130-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240201224724.551130-2-lucas.demarchi@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: FR5P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::12) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SJ0PR11MB6814:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d197935-bdea-4b96-a647-08dc23e526f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TgE4wzLQFzo6NCuviUkUdgnO0Imbd9qS6jcyVH/YOuyXhSGUA3yEkjqwqdJ3zLw6aF3MzJhTMdYos4/xRIN0Qw9pOe0N6R6oV4d9HIPvgou0pkxpD+FyHubIyccPnJ9biiJ0GyDW69uJI8uQEgPYnIPmvjoUTBULnaXq/eunon847SfULGHpeUssvhEy2rRY3frqYX6hsF6hY4ftDjuySQA3Urdng96haZyru1LY1rVyzyjCV5iqfG/BfUm7mG7B5E+d+2ZWwGDTI20zywzvx3lsnGar9LwHgLlYKar3UOU6ZOSI1cRM9kFttguIRcszWWLmP4asC775lJBiufY5X6IzJJJJ48FXzFpOregRB/6A14B6ka8ttDsGI9OVr9KRPSxd5YNZZNwca+JdMds+yiTlt7z2neyGJBBRGIfM3ofJOgws9DXbvxerVW17Xd98iiqBHEBx+Kz2N8lJdfJpyeFVJm72tAEdqac9YV98N47psRrc+liMWRZKQpHQjUkX8waSM2s1A+cDWxHRN/RXmJvoKngtqHrLfNvhQJLo8MPc9aH7uNce0wNnBfKuSv7L
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(39860400002)(346002)(136003)(366004)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(26005)(2906002)(6862004)(4326008)(8676002)(66556008)(8936002)(5660300002)(66946007)(44832011)(86362001)(54906003)(6636002)(316002)(66476007)(36756003)(6666004)(36916002)(6486002)(38100700002)(82960400001)(9686003)(6512007)(478600001)(6506007)(83380400001)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FRN+UR+mOkl+agc7FA6GYNi5bj/r2M+15edHsF+Dd6UVMJMiorSbB/RebZ5H?=
 =?us-ascii?Q?Og5wd/K5t/QfH5wcGBfKb6EeFyHua9IIni/nCvJpuN0vcOO+umSdb8UQ5rff?=
 =?us-ascii?Q?wIMm3iXgzV6+jm4AUCBWMqcFdg8HB0z6BJ33y255KyQACipCMdiy0u4W25EA?=
 =?us-ascii?Q?wPag7Zgl7PXlEJt0gSyS5go3tjlwWE9a8dwGrAJbiubn6OEVoeu+DOX6rN11?=
 =?us-ascii?Q?YMzsPVOOZbKZBgiKDyvsSSF28pxoDXRIJXUlAjFoMs6fcy50+RrLtDjmiFln?=
 =?us-ascii?Q?msgHYggIS6PBQ2XfgZCZ8A+M5ax112/R2apwEeXM2mlHob4yP4OQnNdNLr8i?=
 =?us-ascii?Q?vviEY9VWSMqDwPs0ZC/LCC0EwVQbHvOMhE4QGcYZQ3Abs06aVHUahpYr9/F7?=
 =?us-ascii?Q?7fhfkTSNPR6F68KmsrfMeuJvTJMdFaY1N7f0uWOmWDpvUmXXTde0awNXceny?=
 =?us-ascii?Q?4384zaXDgZiH5P9kFH81lf3y4XQXa59jYa6V7WjFhjuOkKMb5EsYXkjj/HZj?=
 =?us-ascii?Q?K2pIV9l2YHVok5XtjhFlq8pVQqa9V0bhZULfvZddoWQH2COsEh1F/D8snI8Z?=
 =?us-ascii?Q?CBLcsoFnGaoWD6rlaQslHi5WRxyDceo22nWgYga97jWIAvHbaw2Jgd9PgptD?=
 =?us-ascii?Q?ISqGaYvU9RnNKAY2vqtRibOsciN+AFzmc0h51m2ZnOlZjIi7IDadFMKLMYi6?=
 =?us-ascii?Q?jcwNBCA0qk/FCp89pvOb/alQWT0tcTXb8I8ESp/XUkjK2Vl3t5IOe5A2hQHO?=
 =?us-ascii?Q?6pKJFjR+W8bHmRFaxeISZj8Lgz6kzVx2tlJ0Pf3aWWJd4kDm2MUq+kbdbnLM?=
 =?us-ascii?Q?XckNT5cEirNesd8M+MIvd0UKoy3BLfifWBpOk0s0UbsQpM2LRObL0cEudJkD?=
 =?us-ascii?Q?VYZSEDqv0wqYqRFGKOuG/vbwxykYp1mcWAtYiKTo8A3YphQOpbUvxDjN2cR0?=
 =?us-ascii?Q?F+k6QF3XmrRjEQUAnvaJM6pzGefGQorQihePxXBXE7983AFLwACR3wBATt+7?=
 =?us-ascii?Q?jFeY0G0w16EwKUSPHlq9xFFWwR6y85iBNXG71snRGuLItpP6hCPr4i+idA7p?=
 =?us-ascii?Q?gd6kkPQqLylp/gC8YL6/xqyA03W+/Chw9CKppNVLXzUPNwah3Gr5t/St2kPe?=
 =?us-ascii?Q?6Hf4x3U1gAC4Xxkke1nUHlYqYuD8fT0ZnYOALi9FPl2OUl1hACLrtTcnnbMC?=
 =?us-ascii?Q?NYgzzpJeObpF+nAOYIcZlg+08YCCMRFSGkziqpegMA5bEPtRC4gM+YuT+Q3E?=
 =?us-ascii?Q?VLcIHzxmPnYw9tURH3e1T4BojMSHTBLqi7iTLJ/Tkzmey7EvqyljrV8M+8+X?=
 =?us-ascii?Q?WKaHSAL4P4T6sWXsy1WBELbIDe+xxJv0IcVPxSTlPgqXr6f/PTIYKiUaOTPm?=
 =?us-ascii?Q?oxNp7/lcZFSU9Xt939KO48k6HYjFAMikf6rdDvmYW5Td/Q8WgvTIrMsA2AQQ?=
 =?us-ascii?Q?2kPJXu04IJktCPeQTZ2qJvJ002T+pc61Dezw0HIN5M+tqwe1LUJpDPplXaiB?=
 =?us-ascii?Q?7DAU2uCrW0R1UGrMNYqeN9lFOFHXnCbPClI4JAXSKbaXHYkjfBRCIRhrUed5?=
 =?us-ascii?Q?MI85qmNVLHRBSTW03VVee3THYFM2bgGdDYT4F8oM/2C/rOf3tleY/3yYMBxC?=
 =?us-ascii?Q?nA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d197935-bdea-4b96-a647-08dc23e526f2
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 11:50:28.8768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cF+skbd8ZgXEk8IipjY9Hl8a1Z5sk5kMqJCckTQb+m9jf+DA73GWsUthWneZ/gEoQci8IKBj8Z1iUYIUyAXK3YPm53i3I8MIwKw8rYIAJYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6814
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

On Thu, Feb 01, 2024 at 02:47:23PM -0800, Lucas De Marchi wrote:
> The current logic for firmware selection is reminiscent from i915 where
> there are 2 backends and several platforms support only 1: execlist or
> GuC. The xe driver has only the GuC backend and it simply doesn't work
> without it. Allow developers to override the firmware path even if there
> isn't a firmware entry in the table yet: this allows developers to more
> easily test the very first firmware before adding it there.
> 
> The justification above is only true for GuC, however those override
> paths should really be viewed as developer aid param. Simply make the
> same logic for all firmwares and allow the override path to be used
> for all of them.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_uc_fw.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 8debea47a5b4..c7541f1a5c0b 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -660,6 +660,7 @@ static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmwar
>  	xe_assert(xe, !uc_fw->path);
>  
>  	uc_fw_auto_select(xe, uc_fw);
> +	uc_fw_override(uc_fw);
>  	xe_uc_fw_change_status(uc_fw, uc_fw->path ?
>  			       XE_UC_FIRMWARE_SELECTED :
>  			       XE_UC_FIRMWARE_NOT_SUPPORTED);
> @@ -667,8 +668,6 @@ static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmwar
>  	if (!xe_uc_fw_is_supported(uc_fw))
>  		return 0;
>  
> -	uc_fw_override(uc_fw);
> -
>  	/* an empty path means the firmware is disabled */
>  	if (!xe_device_uc_enabled(xe) || !(*uc_fw->path)) {
>  		xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_DISABLED);
> -- 
> 2.43.0
> 
