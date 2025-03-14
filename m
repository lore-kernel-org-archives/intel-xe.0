Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B6FC282EC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 18:10:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B75E10EA2F;
	Fri, 14 Mar 2025 18:10:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X10KfX+b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA5710EA31
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Mar 2025 18:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741975807; x=1773511807;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jjA+alSRdTq64I/j/Vi2JR5xoVmYuCQa0yE4P1XNBXM=;
 b=X10KfX+bi7/O3LlZXbIdMT1Z2yRvoN1yby2qVaPoAGHokMw4wIbgFaJ7
 sNnT38y5f1ZskcBkGCEiQfuc2BUWNi7l3WGbkuQSB009k750ilBv3MHkq
 KALH9nj5XZk+pz8YJxS+S+Mz96oNNa1RB3b/o0X6cKn5EJhGmaL00j8qj
 SSdFNRAKD2Ve3B3+C4q7MIuAmj6m7OcYROXBpjhM0SYMTOBqVFXpEdJGH
 4rAJezachXDntdlh3KjJKfEzIVkfTwMCH2o3i3Yf5xK9P4Oqn0KsCsAFi
 xgCVBiYrK3jl3qrr1HcZnPlV4sFjGFBxI3zUziWcCb2lr54y9CCQFZX7D w==;
X-CSE-ConnectionGUID: xVFLnrT8QOuJWr9aSsiPAw==
X-CSE-MsgGUID: o+BiPFcLQ5yzebZqcgCQfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43177208"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="43177208"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 11:10:07 -0700
X-CSE-ConnectionGUID: 6+31o4BlS+GAHMK5Sk1h+w==
X-CSE-MsgGUID: GIxNAo7HSCq/5jMxAXVqUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="121544542"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2025 11:10:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Mar 2025 11:10:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Mar 2025 11:10:06 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Mar 2025 11:10:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z9txvQBy9/w4nqBkDgIpeT8fZBcx390W9gSSqOvFSbGHbRtKh/upBpxvXF7ay7eixFzTwZJJujJeavwLbD2N370UpokLexe74quWEaqf6kIzbw7eTw/UKTYUGbEe80oQ7EwQUR2w+mnr85t1nW2XyZoCHsNj6YP13EZxOWTx1zFUZym8kOVhZqwc0W20j+NcZBTCYG6+J8pHww+Irbt2xxLXlNEO+P095rgXXS5yceVVTaDZC+PI4TanTPGVFj2OxFdtgVUBLVEPZPeKa9Cilm/IhkyBURVfGpgwnoWehPj80E4hgsJmoRKoSxSP9hWt0Lhn9XREIgB8HobX5WLJoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u4imyA6wU4xUDiHFdG3j0gSleuY1z9qswUHqijypoW8=;
 b=VdO62wbrM4Q0qsgOCTOvkVC3karEvn+K2ShGVGvwKUupme6dDT9IKNn3uoqOffqls+thxIqCvAKmI2ASOWY5+06DL9VKBZImOdgdjRIRXkJfLaPnBdKZ1+hw+PkAnXcS8crtBBhU9oVCEXXOE3bbMdxn3fLt/iR5rLRvh3bwKk6xixR7/NRN0nQaW0GGruboHUZ422X4CS3XJjyxycn+3F49SqQN7gjNZ27FoOMQm8o7U/8idl11tX0zSBOZhdF8MJEE034VNp/R8DDW2o71ms+zKvFaG4QKXAgVvb+hWy9qPW1KbcB42K++ntzTnfe+2+VZuQRTi8qkgvhL1IGapw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH8PR11MB6707.namprd11.prod.outlook.com (2603:10b6:510:1c6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Fri, 14 Mar
 2025 18:09:23 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 18:09:23 +0000
Date: Fri, 14 Mar 2025 14:09:19 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <matthew.d.roper@intel.com>,
 <andi.shyti@linux.intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <badal.nilawar@intel.com>, <karthik.poosa@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
Subject: Re: [PATCH v3] drm/xe/hwmon: expose fan speed
Message-ID: <Z9Rwz4rboZ7T1T73@intel.com>
References: <20250312085909.755073-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250312085909.755073-1-raag.jadav@intel.com>
X-ClientProxiedBy: MW2PR16CA0063.namprd16.prod.outlook.com
 (2603:10b6:907:1::40) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH8PR11MB6707:EE_
X-MS-Office365-Filtering-Correlation-Id: a61ddfad-e669-4e44-66de-08dd63235967
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2Tor53SRVeguvvf7TC7kd+9x/w196lMWa2H8Uo13po0C5YFALkLpM2493erU?=
 =?us-ascii?Q?lX4chb3gN1b8HVJxf7FRREmNeODmXih8VFkJyexJ5DTSFM5WwjeO0nhzpxcP?=
 =?us-ascii?Q?nHrgE9zy5n9T5B5j/kxvHXbDX9/oZ+PqbisztRyJTbOm1P7W+6MUt916FYj/?=
 =?us-ascii?Q?MoZiihpIzQJqffLWsuE5nrMN6Aoi/tnJJLGa8S0ZPgfuczBBGpHMNtBWGzzz?=
 =?us-ascii?Q?3029LaMYIIXGFgs8YmHw3UaRxyZtgpk8RGs1V8RIwL69tJMeV51tExAx+l+i?=
 =?us-ascii?Q?UpGYR5ynA1u+7gA5lkalH0p2Tg2KMDfFCuosd9J4542ix9Xth88mG7qCzMZ0?=
 =?us-ascii?Q?ayw7FGpMPTBxdWwQcWnIktsexOL8MAyzWQQCQxIn5TzEMb3PyoPHm1bocR/v?=
 =?us-ascii?Q?zC0pr6KXo+VBIByk/+PPY4IKG2KOYEhzvWK9fhueAKsEGffeCTovoq2rulPR?=
 =?us-ascii?Q?1rjmvL1vqTbXDweaSBMuJ+ZNFgeCpIUNJhCbZfhinyg3CnpD9UVN/gQsEN24?=
 =?us-ascii?Q?NtoYg+s5S2oYvktT9JRctRhLCaLAnhmsbjCMDZoF97KmOdaEFlUWgloN+mRc?=
 =?us-ascii?Q?5HNEIvCOwB5eiK3rR6uBohWJb/zjdRhoCQMKsOtRuM8rQ0d0U6f6utXQZGSA?=
 =?us-ascii?Q?Wylmz0tN/PwddSgTtZAz40cggiG4yua+kz4VR7Vp4u1zD3YHKIaSmxUnzxCS?=
 =?us-ascii?Q?1aI6nPAlXbMNuEjor87jd9Lf9nHo3R8lFp/YMuTg1rCulGr4u2dDYJFQr5La?=
 =?us-ascii?Q?DGY189zzorBF8ibn6GlpjUstMbo8QUQMwg0BNTCHuIjeDjbbAOqf8wr3ci8N?=
 =?us-ascii?Q?Uc74G8TMiK6pyrVMbNJk2g4QiyFJTIyVi4ZXPWUfsX/Xx0HJoD0+FFmOOykh?=
 =?us-ascii?Q?kbXFgouRfVoxoSBYyeyV6w/TurJM4rY6wmBkXvDl+7F9oNc+4TpyS3QGeeVH?=
 =?us-ascii?Q?bFnhgl9ZhjbjWv2zhu5cd4B2iRruf9R3cChdT7hBgWGx5jmjgs1sGHiEkKgd?=
 =?us-ascii?Q?T3FQRsYoVIV1iUFTkrYHFMh0/g05JVRuC8HJyRLjFlxL5YecP85Zv9dD9RDf?=
 =?us-ascii?Q?JW1kq6983vFg7ChYB0ZGzR5ISE2LayFM0Xm1QBx5xQUBH59hlYgNeJl+OCE4?=
 =?us-ascii?Q?f2Fpjk5NzGFdmUTPEMDZRuupb0aQlj2/zQmysKGXFzB9KR4N6ZrlO3Wocie/?=
 =?us-ascii?Q?JWoZ7kubsUWleq0HH6t6gqzQ9yJAWnlTekguD67b77rhp/egr11E2Am1lB4D?=
 =?us-ascii?Q?ZQzuxYXaK2RKxJXktF0w/JC18hAkVoyf/CA2KjiBLMvQ3/3i+Xmr1t06qRV2?=
 =?us-ascii?Q?obUaKPbbJp1uI3XatAETs2peJsYmQvtNH1VjXZE6RQQcwQGAqzqrjJv94dv4?=
 =?us-ascii?Q?fagEbySg61tSp3IejbfTjmQk+yIc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XBKDleAo9KDB49lniEfuDq18YKXskeu6Q1wRKupmQ+RPp2fTkRDACxQb+Mhv?=
 =?us-ascii?Q?f0F2+qigqi2wUNiZ2Wn3j2LCetuUZ5C7h7Guwl5A1JdIKdMVgLPurCa7+XEn?=
 =?us-ascii?Q?o4EH+5VRYkUcJYj2O5NoyoKy8TDqqp8JE0xizhCg6RWnktqDbiIkiRom7EzZ?=
 =?us-ascii?Q?z6YdDXKSj/aVBYeOaa8fqZTRIsJ3oWyJM/my9rsZE6cLhZC16zZ2E/IE6CzZ?=
 =?us-ascii?Q?fmZDSIocAHXN+6bgTBGEEK+N4T1jXeROTllt0TG/Io73/fcDtz44TYrpidc4?=
 =?us-ascii?Q?VQOPCObgZ+qr/BsBLgRed/gON+eNGPnrMGzmv6AVvd32gJCUb9k98RQo8A+U?=
 =?us-ascii?Q?kHCT2DtjKvS0vxtFMXHhtBQ/FYsu2xbD5YP+m+WnaxKZq/bQU72Zvx4x8oGO?=
 =?us-ascii?Q?D4yAWPnBiptai/do5jjsiBTUqsTMzPDVVKs1PTaQBCsUyBgJA7xaY3D1tcvS?=
 =?us-ascii?Q?JyNkrndc20CSo7CoXVQlDIvv0dMcW5a2fU/mckjwbbaMFpGSZ7WKjaugbQr5?=
 =?us-ascii?Q?p/28ZCHTM1FrRT22iYxyFJi7FMGLyjQs62PKfTf1GwoB2u3sexps6JnyKMht?=
 =?us-ascii?Q?Q+Fpo8x1dByWMLPiZqpGdN9coY9H3o9cQMXyADmLf1vIHvRIp4cV+BgAiSH7?=
 =?us-ascii?Q?ozmN7r5yKQKch2ntGpiYaDjmqG2ntMVxMA6TREXwBEHhU66/RH3S33aO98gs?=
 =?us-ascii?Q?B9p5NG3CPYEz5/5xzL50LyyD9yTRrAwi7oVfXQiR35FHZRM+gbd9I/z1n9sk?=
 =?us-ascii?Q?auHJZyjLx5CL0SFd8NWuHoMWHUpKwdyVz6Pe001A9Ga+JKJFpaW2GwD7jN69?=
 =?us-ascii?Q?yGKEXSx//9Ngi+kgF26Qanb8zssz2nLSgcFp5vRkYDme0elKXRLs3RtrzxLz?=
 =?us-ascii?Q?2zIsT0jD4VnPIoAd5iMSq9aG8fsN/YRCAea3bcq8Z+B5UI58o5vvNDa5MQP4?=
 =?us-ascii?Q?qwpCIGpJ9cA4hoHRJ2b1LkBbOrZikVSS0lcSpKhLudWR0fwvA9DPOef21/s9?=
 =?us-ascii?Q?2qZco923kVPPWPfmYN1CmB2VTFW6H7JdUBKS8qEdKcza0jaqFVWf0eKqAmXp?=
 =?us-ascii?Q?AJ3AT7I0GlA8W5YsJQV3FWzXLahqCzURUDVgIJcT+g3djNhxeQ+gXLNW6Pn2?=
 =?us-ascii?Q?m6ufr4VF+JVZzsXmU0bHru/d+B4MVtxob5lY7VTrLfTNB5IN6/Rwr0n/dDPG?=
 =?us-ascii?Q?5nr0SrcbO213su+uyW5b6b+RfAifvCHFltNQV5bxN/W40Is5HKLobDGfJGfz?=
 =?us-ascii?Q?YhbxncTrbWoEY7lEvvjx1t7oB0IxZ5soKIcitKXokUBi3ZDJeU3URAULTd0j?=
 =?us-ascii?Q?avDMCLNDVMcaWFq5CIAQ7wDc9SpL84Qk+/pWfCdU3XILwiOCUswPOMj+6MN3?=
 =?us-ascii?Q?wLNIv7DxGzGoeL7lBr8M5SZtWvdemEMwgo3kJM3A3AbeYNQzuIGK1gwYToGm?=
 =?us-ascii?Q?0KAVXiR3utgPZSIb15j4yep/bp+AOmAPcPIdQjz/aJHRe2DOYl7eFnVYxula?=
 =?us-ascii?Q?TWj0ZiQU3w7IvAW8KX/iaoRQ8D2o/H1cE1aWTypL26psh5xsRZ+CWoaRZsZT?=
 =?us-ascii?Q?Wg952swLBFQndXR/F9JGgTQgWb/lzJQbOR38sY6Njkk0E8tuPa4cRn6x2oNh?=
 =?us-ascii?Q?iA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a61ddfad-e669-4e44-66de-08dd63235967
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 18:09:23.4177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ELki+JRA94ye736Th6w/eZlRgqT3dXiUks1PgGDkeYaKs2Hoo8brLwiCKae/K0Pi2wdpwJkz0p/RMtjQKJTdWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6707
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

On Wed, Mar 12, 2025 at 02:29:09PM +0530, Raag Jadav wrote:
> Add hwmon support for fan1_input, fan2_input and fan3_input attributes,
> which will expose fan speed of respective channels in RPM when supported
> by hardware. With this in place we can monitor fan speed using lm-sensors
> tool.
> 
> v2: Rely on platform checks instead of mailbox error (Aravind, Rodrigo)
> v3: Introduce has_fan_control flag (Rodrigo)
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

pushed to drm-xe-next, thanks for the patch and reviews

> ---
>  .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  24 ++++
>  drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |   3 +
>  drivers/gpu/drm/xe/xe_device_types.h          |   2 +
>  drivers/gpu/drm/xe/xe_hwmon.c                 | 125 +++++++++++++++++-
>  drivers/gpu/drm/xe/xe_pci.c                   |   4 +
>  drivers/gpu/drm/xe/xe_pcode_api.h             |   3 +
>  6 files changed, 160 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index 9bce281314df..adbb9bce15a5 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -124,3 +124,27 @@ Contact:	intel-xe@lists.freedesktop.org
>  Description:	RO. VRAM temperature in millidegree Celsius.
>  
>  		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/fan1_input
> +Date:		March 2025
> +KernelVersion:	6.14
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. Fan 1 speed in RPM.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/fan2_input
> +Date:		March 2025
> +KernelVersion:	6.14
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. Fan 2 speed in RPM.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/fan3_input
> +Date:		March 2025
> +KernelVersion:	6.14
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. Fan 3 speed in RPM.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> index 8846eb9ce2a4..c7d5d782e3f9 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> @@ -21,6 +21,9 @@
>  #define BMG_PACKAGE_POWER_SKU			XE_REG(0x138098)
>  #define BMG_PACKAGE_POWER_SKU_UNIT		XE_REG(0x1380dc)
>  #define BMG_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
> +#define BMG_FAN_1_SPEED				XE_REG(0x138140)
> +#define BMG_FAN_2_SPEED				XE_REG(0x138170)
> +#define BMG_FAN_3_SPEED				XE_REG(0x1381a0)
>  #define BMG_VRAM_TEMPERATURE			XE_REG(0x1382c0)
>  #define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
>  #define BMG_PACKAGE_RAPL_LIMIT			XE_REG(0x138440)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 833c29fed3a3..6bde5b5e45f9 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -300,6 +300,8 @@ struct xe_device {
>  		u8 has_atomic_enable_pte_bit:1;
>  		/** @info.has_device_atomics_on_smem: Supports device atomics on SMEM */
>  		u8 has_device_atomics_on_smem:1;
> +		/** @info.has_fan_control: Device supports fan control */
> +		u8 has_fan_control:1;
>  		/** @info.has_flat_ccs: Whether flat CCS metadata is used */
>  		u8 has_flat_ccs:1;
>  		/** @info.has_heci_cscfi: device has heci cscfi */
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 48d80ffdf7bb..eb293aec36a0 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -5,6 +5,7 @@
>  
>  #include <linux/hwmon-sysfs.h>
>  #include <linux/hwmon.h>
> +#include <linux/jiffies.h>
>  #include <linux/types.h>
>  #include <linux/units.h>
>  
> @@ -27,6 +28,7 @@ enum xe_hwmon_reg {
>  	REG_PKG_POWER_SKU_UNIT,
>  	REG_GT_PERF_STATUS,
>  	REG_PKG_ENERGY_STATUS,
> +	REG_FAN_SPEED,
>  };
>  
>  enum xe_hwmon_reg_operation {
> @@ -42,6 +44,13 @@ enum xe_hwmon_channel {
>  	CHANNEL_MAX,
>  };
>  
> +enum xe_fan_channel {
> +	FAN_1,
> +	FAN_2,
> +	FAN_3,
> +	FAN_MAX,
> +};
> +
>  /*
>   * SF_* - scale factors for particular quantities according to hwmon spec.
>   */
> @@ -61,6 +70,16 @@ struct xe_hwmon_energy_info {
>  	long accum_energy;
>  };
>  
> +/**
> + * struct xe_hwmon_fan_info - to cache previous fan reading
> + */
> +struct xe_hwmon_fan_info {
> +	/** @reg_val_prev: previous fan reg val */
> +	u32 reg_val_prev;
> +	/** @time_prev: previous timestamp */
> +	u64 time_prev;
> +};
> +
>  /**
>   * struct xe_hwmon - xe hwmon data structure
>   */
> @@ -79,6 +98,8 @@ struct xe_hwmon {
>  	int scl_shift_time;
>  	/** @ei: Energy info for energyN_input */
>  	struct xe_hwmon_energy_info ei[CHANNEL_MAX];
> +	/** @fi: Fan info for fanN_input */
> +	struct xe_hwmon_fan_info fi[FAN_MAX];
>  };
>  
>  static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
> @@ -144,6 +165,14 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>  			return PCU_CR_PACKAGE_ENERGY_STATUS;
>  		}
>  		break;
> +	case REG_FAN_SPEED:
> +		if (channel == FAN_1)
> +			return BMG_FAN_1_SPEED;
> +		else if (channel == FAN_2)
> +			return BMG_FAN_2_SPEED;
> +		else if (channel == FAN_3)
> +			return BMG_FAN_3_SPEED;
> +		break;
>  	default:
>  		drm_warn(&xe->drm, "Unknown xe hwmon reg id: %d\n", hwmon_reg);
>  		break;
> @@ -454,6 +483,7 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
>  	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL),
>  	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL),
>  	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
> +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT),
>  	NULL
>  };
>  
> @@ -480,6 +510,19 @@ static int xe_hwmon_pcode_write_i1(const struct xe_hwmon *hwmon, u32 uval)
>  			      (uval & POWER_SETUP_I1_DATA_MASK));
>  }
>  
> +static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 subcmd, u32 *uval)
> +{
> +	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> +
> +	/* Platforms that don't return correct value */
> +	if (hwmon->xe->info.platform == XE_DG2 && subcmd == FSC_READ_NUM_FANS) {
> +		*uval = 2;
> +		return 0;
> +	}
> +
> +	return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, subcmd, 0), uval, NULL);
> +}
> +
>  static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, int channel,
>  					 long *value, u32 scale_factor)
>  {
> @@ -705,6 +748,75 @@ xe_hwmon_energy_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>  	}
>  }
>  
> +static umode_t
> +xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
> +{
> +	u32 uval;
> +
> +	if (!hwmon->xe->info.has_fan_control)
> +		return 0;
> +
> +	switch (attr) {
> +	case hwmon_fan_input:
> +		if (xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_NUM_FANS, &uval))
> +			return 0;
> +
> +		return channel < uval ? 0444 : 0;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int
> +xe_hwmon_fan_input_read(struct xe_hwmon *hwmon, int channel, long *val)
> +{
> +	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
> +	struct xe_hwmon_fan_info *fi = &hwmon->fi[channel];
> +	u64 rotations, time_now, time;
> +	u32 reg_val;
> +	int ret = 0;
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_FAN_SPEED, channel));
> +	time_now = get_jiffies_64();
> +
> +	/*
> +	 * HW register value is accumulated count of pulses from PWM fan with the scale
> +	 * of 2 pulses per rotation.
> +	 */
> +	rotations = (reg_val - fi->reg_val_prev) / 2;
> +
> +	time = jiffies_delta_to_msecs(time_now - fi->time_prev);
> +	if (unlikely(!time)) {
> +		ret = -EAGAIN;
> +		goto unlock;
> +	}
> +
> +	/*
> +	 * Calculate fan speed in RPM by time averaging two subsequent readings in minutes.
> +	 * RPM = number of rotations * msecs per minute / time in msecs
> +	 */
> +	*val = DIV_ROUND_UP_ULL(rotations * (MSEC_PER_SEC * 60), time);
> +
> +	fi->reg_val_prev = reg_val;
> +	fi->time_prev = time_now;
> +unlock:
> +	mutex_unlock(&hwmon->hwmon_lock);
> +	return ret;
> +}
> +
> +static int
> +xe_hwmon_fan_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
> +{
> +	switch (attr) {
> +	case hwmon_fan_input:
> +		return xe_hwmon_fan_input_read(hwmon, channel, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
>  static umode_t
>  xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>  		    u32 attr, int channel)
> @@ -730,6 +842,9 @@ xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>  	case hwmon_energy:
>  		ret = xe_hwmon_energy_is_visible(hwmon, attr, channel);
>  		break;
> +	case hwmon_fan:
> +		ret = xe_hwmon_fan_is_visible(hwmon, attr, channel);
> +		break;
>  	default:
>  		ret = 0;
>  		break;
> @@ -765,6 +880,9 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>  	case hwmon_energy:
>  		ret = xe_hwmon_energy_read(hwmon, attr, channel, val);
>  		break;
> +	case hwmon_fan:
> +		ret = xe_hwmon_fan_read(hwmon, attr, channel, val);
> +		break;
>  	default:
>  		ret = -EOPNOTSUPP;
>  		break;
> @@ -842,7 +960,7 @@ static void
>  xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>  {
>  	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
> -	long energy;
> +	long energy, fan_speed;
>  	u64 val_sku_unit = 0;
>  	int channel;
>  	struct xe_reg pkg_power_sku_unit;
> @@ -866,6 +984,11 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>  	for (channel = 0; channel < CHANNEL_MAX; channel++)
>  		if (xe_hwmon_is_visible(hwmon, hwmon_energy, hwmon_energy_input, channel))
>  			xe_hwmon_energy_get(hwmon, channel, &energy);
> +
> +	/* Initialize 'struct xe_hwmon_fan_info' with initial fan register reading. */
> +	for (channel = 0; channel < FAN_MAX; channel++)
> +		if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
> +			xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
>  }
>  
>  static void xe_hwmon_mutex_destroy(void *arg)
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 8b6658b214be..2eaee2476c65 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -62,6 +62,7 @@ struct xe_device_desc {
>  	u8 is_dgfx:1;
>  
>  	u8 has_display:1;
> +	u8 has_fan_control:1;
>  	u8 has_heci_gscfi:1;
>  	u8 has_heci_cscfi:1;
>  	u8 has_llc:1;
> @@ -322,6 +323,7 @@ static const struct xe_device_desc dg2_desc = {
>  
>  	DG2_FEATURES,
>  	.has_display = true,
> +	.has_fan_control = true,
>  };
>  
>  static const __maybe_unused struct xe_device_desc pvc_desc = {
> @@ -356,6 +358,7 @@ static const struct xe_device_desc bmg_desc = {
>  	PLATFORM(BATTLEMAGE),
>  	.dma_mask_size = 46,
>  	.has_display = true,
> +	.has_fan_control = true,
>  	.has_heci_cscfi = 1,
>  };
>  
> @@ -631,6 +634,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  
>  	xe->info.dma_mask_size = desc->dma_mask_size;
>  	xe->info.is_dgfx = desc->is_dgfx;
> +	xe->info.has_fan_control = desc->has_fan_control;
>  	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
>  	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
>  	xe->info.has_llc = desc->has_llc;
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 2bae9afdbd35..e622ae17f08d 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -49,6 +49,9 @@
>  /* Domain IDs (param2) */
>  #define     PCODE_MBOX_DOMAIN_HBM		0x2
>  
> +#define   FAN_SPEED_CONTROL			0x7D
> +#define     FSC_READ_NUM_FANS			0x4
> +
>  #define PCODE_SCRATCH(x)		XE_REG(0x138320 + ((x) * 4))
>  /* PCODE_SCRATCH0 */
>  #define   AUXINFO_REG_OFFSET		REG_GENMASK(17, 15)
> -- 
> 2.34.1
> 
