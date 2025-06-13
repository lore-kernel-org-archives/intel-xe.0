Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584D8C71148
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 19:36:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DECC10E5F9;
	Fri, 13 Jun 2025 19:36:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MoJ2hLTX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6C3010E5F9
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 19:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749843361; x=1781379361;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bauz9VdLmGU25//1ahQvacZvTVDcmNjOWa1S/Jk4/M4=;
 b=MoJ2hLTXH9LTVLbhug6pa/QVmnFHQ+RjWf85LH3+BDHAxixOqaAbTg8n
 zNWpfyxgncCfipIFXRBpjb+7/wfK4SVOlSuWeaiZLHhG7Jz2Py/hFv9dw
 2IB9haHEqpqHANDyhTkz6iPOVcEBZLWoLuxR7C/piOevkA/JjkDGQrJiv
 lsRh1W4lkbbk+roh8doLf41S7BlAB1rBZwyjnw0NfuIbEL3JINMPdbGEO
 IyUkW9Y870fyRr+TZp3yxGornLGszlrvDIOSQIslYokC4Q9gZo4CSAC2q
 CHpVT6QIk4RKjAmM0oWb/6LKalEX/lu+jY3slfbKONg4UoOYjKyXH7ArQ Q==;
X-CSE-ConnectionGUID: 20cOvLaDSUGtclREMZ0Clg==
X-CSE-MsgGUID: 4xa0copaQGOcxLR+ebO5BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="52206319"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="52206319"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 12:36:00 -0700
X-CSE-ConnectionGUID: Xu/96BPcTzCrwN0ysW8Ipg==
X-CSE-MsgGUID: uMJEKUN+RB6pV13oqdFaYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="148279256"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 12:35:55 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 12:35:55 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 13 Jun 2025 12:35:55 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.78) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 12:35:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=foqaD+kGM/NjhTfYgggXp+eHyyRKXgSXVPmLDcsmU52AVfAn8OmIwuCAc4i876bZCM7QhRIH+qKDNtv8cg4l6sneu9s4i/RWtIar8bYENDq2+QXxh1PLL4T2INeWMPDz8PURhh/uIc9zIas7xysBKgDkpXp+HI/6I+LIpJsV6cO1tk+ZfNhK0StMcGrFhD0BmZid4SCDpxW3gd6Ga8VVWfFnxSN5t4NgJSvTu2218DnrBlSDc6u5maOf4MDTiAdqxK/0SrFfVb6OaJQc8hgdc6JrDsolLFMkn62w1mtl7A4FVo1/au5LkJen7bLFC7JgJD97739ejNIUAUIEoxiV9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sPLkb/aATIT3iLMbBy+KGPuh5slqkC7i2/rRdo4IcJ8=;
 b=c7MSTvmSKik5ZKn7t36jEAzF5lD9z3GU4z068PhdWZWPf9k6k/voOPm4jyLczw8RBm1FWKZsCTrmbz0jITkU8AGP1zKNXXryUJDX93IZztOLEFYe1eBqVKyI4+EkqAvtcYijtED3ITgbFcn4wd3/KAupIrp8qDDbbyQEroD8deOLh6N+lNaaneSDSIUga19Iyz9e6S1w4/9l5mdckG+/s1/8XGfAmCqN27Mb9cERWfATZU4LqLZrp5eSXN5H45LaApGFwo34ppeKIGWEyxg0CDkwGuGmCV0j0vkVizF/7Vft/9tPyOypbUMhINzEPATmjdTmCtFHA9nMwmYZDET5nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by BY1PR11MB7984.namprd11.prod.outlook.com (2603:10b6:a03:531::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Fri, 13 Jun
 2025 19:35:52 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 19:35:52 +0000
Date: Fri, 13 Jun 2025 12:35:49 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/tests: Drop unused xe_device_fn typedef
Message-ID: <20250613193549.GW5080@mdroper-desk1.amr.corp.intel.com>
References: <20250613191938.1980-1-michal.wajdeczko@intel.com>
 <20250613191938.1980-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250613191938.1980-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0129.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::14) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|BY1PR11MB7984:EE_
X-MS-Office365-Filtering-Correlation-Id: 63c45062-5b83-4d88-9e5e-08ddaab181f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8oSOkK/U0E74JKPXpIBAxuA/HdIEHqKdlpaKz0KUKu9N3PIdaBErV4IoLqnH?=
 =?us-ascii?Q?qOKbjtN9OuyeSx9I3lfg8MDQWPf8YVxHPS9LURlyyB3Z02YnJru2nlnyXMzU?=
 =?us-ascii?Q?2dZVLYkMbLwGdyFxhUz6yiXI3BXGkrv4MT9rrRRuDRfAs7PqZO/aIHOALIuV?=
 =?us-ascii?Q?qKKtroof3ddoJzB5Y80ljzMfWGbb4nU4QpujwhdV9xMBnsKP7GDNwIwyiT7n?=
 =?us-ascii?Q?OUUekssQQDKOHo1z/EKpFNlwTQHHFJzAhfKkdxTaBN05WpLdBYvgFBmEqi1F?=
 =?us-ascii?Q?r5QPijiY0Z+EzFehC/biTvQaXl1Mwj7iKbKCiAEuPZUmj6sexlENrI1sk3Mw?=
 =?us-ascii?Q?jLCPiZVyskofHpuVxTHK162vLGfPAG89yWWX8x41N6qcPHaMqkFnkuHBY46Y?=
 =?us-ascii?Q?70OFo5fD/1oJ8tVyrU4Im86tGohY7XqnQIvwxPD1zgHNiUmCFASwyohkRVaC?=
 =?us-ascii?Q?gCJlrIc/ifQ8h7m3DI6+W3oCR6TQ2rrQMAU4ysgFUeieRQprv3LHz2SCJ5l2?=
 =?us-ascii?Q?0SbJxGtEdekyJ3BODghE0PG/ZyElPO4sZVrwUO0y1o7sxpmGTSi5JnwDsYD1?=
 =?us-ascii?Q?7ZRS0xhXvu2sGB9YOQt8NSCEIRR6zFbdTNXkoSTFrV1Cbev6RBP7I2QALyUn?=
 =?us-ascii?Q?L6Gm0l7bJovXb7Q+YsmytdtWhgSmUu0Eeby2FW1cTFaw9VKbwmOLM3ZkrUak?=
 =?us-ascii?Q?gnWzppdyXvgRIM7pQXGBgIDXWliiGx7Fiqxtz3hnCq4D0I5vnouev/sf/gyF?=
 =?us-ascii?Q?qyTIyHpORBT6qv05ZPh8PKzbh9TUZKptsYC1fnxMAmMryeiQ+/1hQNCq4WpR?=
 =?us-ascii?Q?pUdGqUEAG2/1XiWc2eBAv4wcFQmVql9+Sq6yKUoUgjdGkOwxPei1ZNZ2L0za?=
 =?us-ascii?Q?15PnN/89O+NKUjXSG06Hg7ZA3aKWHfgdxEn0iosH+Yj/CvyVXyskDgIwFvz5?=
 =?us-ascii?Q?8GX+3sSLs5uOBFE4CpGwp/7LENCzdpSB+Kq1SzGDB3w9XKAexUnJO3SFSK2C?=
 =?us-ascii?Q?uSiy+wH+w/70w7Gz+amHPr3phoZyPTxza/8AzHiDAhCSMLQMvlWUEy4gyPKP?=
 =?us-ascii?Q?bMdVeHNZSrfrjdd0XNa8lzYa8XC0b5o31enZZBx6cgqpON9fUVxNIXTNKP+2?=
 =?us-ascii?Q?KYu7HmjW2e4m4Np3PI53yn1Y3GxF7ctJipqJ9spFF22qQadeIIEsOuXV83O7?=
 =?us-ascii?Q?oYCVst9e7DnTDRDXIQo5mCVwsavY14+/1erPhScOp0LhC+TZpEk3zMbK65/C?=
 =?us-ascii?Q?I00bgabqISkndmtAt6V9Tk0JTYEnHjAueZZMGg9rP+IGflsZrk6ILqnxs1iC?=
 =?us-ascii?Q?oOZses6fwAC85AVQvsg/Lfl2CE8GqcXjR9RJ9oLVrtNRNW3NWsGsk1oujoej?=
 =?us-ascii?Q?XGeN8axvhvkhhD2wopA89B4vTZt2aZ814eMxsV84d+QA3Ub5FNM2GXgenURA?=
 =?us-ascii?Q?nuGIvVrF0tM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LmIj2Wup5jq7ikkFpS3MBaHup5SMaYPXncFGeVRbRASdRiyDYbY0zlJjiQkV?=
 =?us-ascii?Q?2n6DNOf7EPcJ6whFRZxR0gJnJEEgR56O/1hNGY2kcheXCDS50k/0AWlzhORF?=
 =?us-ascii?Q?vPQ9l0lrrBmh0w/DUyyqUAT5Qcye7XlL0y4vcbSmPKtpSzxsgZbqmd4fXwor?=
 =?us-ascii?Q?iyVR8gapNE2JwCP6RcWH0b392ekUwAcvq5lmCcZzROs4S/bvrZjseX7XNVe2?=
 =?us-ascii?Q?6AsAoDi2NzOIiN1Yr4BompRVrYI56We4YzptSzsTN4FVyqut3HGolagwH5xh?=
 =?us-ascii?Q?nsr6j/L3pSqFVi6Hf+P6PC4T92T80HIYPiI/IcGqKVQk0EimQXVcMmWs5ZQI?=
 =?us-ascii?Q?90nCIgaC+4NuhMKk3jWPfYqpKd05/QBjotqN82COckCFsm5dTKiTuYr6lcNB?=
 =?us-ascii?Q?lHXj+xcZN4b7kE8uRJaKLf1+VFcjKIXM82TMx4FzRhJhuOyIQY7DABTpsQQu?=
 =?us-ascii?Q?JokxoVt3pZTT6Vabzj+1jEJw897V6KxB9BfOw1209oZ1//L2NMJD+GgrwaqX?=
 =?us-ascii?Q?LYkb8AiU329ZLxe6Wn7kSWMEUsBNp4E81qkq6qG/F/jP7Ao5DUFzds8b/X5H?=
 =?us-ascii?Q?k/P+lt1xyGWEJMd7upCdNl84kTgWFSzxPw6RKSZj8M8R8jO1DXUOk9/+umyK?=
 =?us-ascii?Q?npA0IkVhpSRp4JTDjeA62jNf8Ke9kVn+5/ZkH1qD1j3OAL9NW2paK0kzO1EU?=
 =?us-ascii?Q?/TrNElld3cSuIgauUpFwGZBMxUwRolGAbpjvrbjeAjP/zkVXUEPU1CltUIOz?=
 =?us-ascii?Q?PjZ6bGdwjtTct1syIoeM2fzyLQGTQ8HPTzggzYW95YtAgweD1M+e2gRJLv3o?=
 =?us-ascii?Q?4uCkIynqD10kyhxXl/tVHE28oC4r8TjD8QNcHJKPJ5s1nc/+3Ba52ZYrPBZk?=
 =?us-ascii?Q?qOiqFnVimwS+MUofY+X2waPXfuM3OIETExAJom1uCfArTCaZSKJHFTYRZWSY?=
 =?us-ascii?Q?Qr/Xv1Rjn+SViR7Ct+FvAAArfUgi39AYwqST91M3ezdIMmIcuWeoNaRjbFq/?=
 =?us-ascii?Q?i8UDLELgX7yhY1EyOYKPVQbKjhV0U9JR4IT5MuRxcosrXQ7AgQxPGBhXA3aW?=
 =?us-ascii?Q?TKvfx1tYl95oVSLnjwQUZHplOn41LByRQ71wKaqe9vZIBqRTra5fj8lXFA3F?=
 =?us-ascii?Q?V8miygH/Lxd3wSMv7sj8Z2iRCxcgQQl/ompNMDvbaxRitFNCW9xFcO1ONotw?=
 =?us-ascii?Q?xOgcnEdnHJHkvBJvWTpXy/dhKE9lZYFxQ+6cCVEGAmv2CJ+u5Fi6/l2XHHcV?=
 =?us-ascii?Q?n+M2v7xipmCMFjEM96jI6Q+sR1ZBiKv6kDiAteoqKcu3y2A7qrJOysuHu/55?=
 =?us-ascii?Q?Eir/LJJYMUJ6pAdsW+g5GCgSGwwCm0O/k08TgJeqKfrUwsFqSK1XYAkGEAjJ?=
 =?us-ascii?Q?02M7wCUaAnauOjzBrc+tUHFdU1xp5fATfkH/MwQlQl4hUKTJQBgX8nKXZqwh?=
 =?us-ascii?Q?CYchiW49BKos2PSdC3G2nq1EpSO7IgrNI0Kag4PNOsV+Xfsdj4WMGAnCcHOn?=
 =?us-ascii?Q?bwL+2CqmKw+t6apSoJy1VtHFFvvG9rY8XxfHF4RGUJE/WSa99/ACmqEVp8Zd?=
 =?us-ascii?Q?dRqaP9LK0nnnSudISHREqLohrjVfEl+AhmVjPtoPA7pM8dLGYjxIWiyb0rdR?=
 =?us-ascii?Q?zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63c45062-5b83-4d88-9e5e-08ddaab181f4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 19:35:52.4251 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 00i/CcgX3WGi6LmMxuoa/1/bCHGOAk4M/wKtUozbyZQAtcjA8IQrN3majxaGLBV6mxGxg6wUx2a32vVP9lDw/MIzxfvacaxbHRLD8c8K+aE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7984
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

On Fri, Jun 13, 2025 at 09:19:37PM +0200, Michal Wajdeczko wrote:
> We missed to drop it in commit 50680d1698f4 ("drm/xe/tests: remove
> unused leftover xe_call_for_each_device()") so drop it now.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/tests/xe_pci_test.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/tests/xe_pci_test.h
> index ede46800aff1..65ac0295d435 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
> +++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
> @@ -15,7 +15,6 @@ struct xe_device;
>  struct xe_graphics_desc;
>  struct xe_media_desc;
>  
> -typedef int (*xe_device_fn)(struct xe_device *);
>  typedef void (*xe_graphics_fn)(const struct xe_graphics_desc *);
>  typedef void (*xe_media_fn)(const struct xe_media_desc *);
>  
> -- 
> 2.47.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
