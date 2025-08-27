Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5FFCA0EFF
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 21:44:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20FBC10E8B8;
	Wed, 27 Aug 2025 21:44:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AuD3wIKj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 736C310E8B8
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 21:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756331094; x=1787867094;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=RgluQdw7OHN6BIaLYNXyapTOm6x3imQlBpQoWM4nszg=;
 b=AuD3wIKjeJOM7h2fkzs6cFTBAA+3HtlwSXnwSYgKKs5F70Z8rMUb0LyU
 nPrD0Yetf6DM8e0LV9ByyOgUOX62Y4fa7OLjSezq+ZNpbX9+aH4yT2l7L
 zjrLIWQDI1d4BBxQimInEPiMhGFDX+jGnQvPo1tuaB5XZOQFr1UqL7qCf
 ZmOzB5kBmHSUDq3Uzv0VlVBySWo1S935M86sFPp02nUu8gRMDpM5btcFg
 uEyWVJK4qviCp05S37HUdHBORbPzLZbzMi3hNgFGG/OqZYt84q+ktXdAs
 G/ri3st/Q3xR7In/pXYBb+3a8tMOQj2D1/Pp7sFxwF5fbFs9DIFCErt8t w==;
X-CSE-ConnectionGUID: iRgJe/BnTyWUGtvO4F7T9A==
X-CSE-MsgGUID: kgY/w9qJTvyWEP8ZuEkZEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="69961864"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="69961864"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 14:44:54 -0700
X-CSE-ConnectionGUID: RBz26Em9TZqO5/oQYvXVbg==
X-CSE-MsgGUID: yinECY73SXmbeqVxpp6vmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="169243783"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 14:44:54 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 14:44:52 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 14:44:52 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.44) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 14:44:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R0kqZwhO1uN0rLMnnGznT5hR506ZHsnDl8XnwWXRdEQA1H+7+mb/opE4mWcW0W1zb64O89CpGjV7edd1cO9nH8x3hc/KNHlfAiV8w2yNNvr5uclbmyslBAD0Y8uMqSToGTaCNDwmRYRAWAC0gTRxl76ENCW4Ml80fVPBdKBXbEMAaUPVjw+4sRJ4k+BlajyalHdWG4OTDlIy5Oivpim01d5kqsF0ZxyEnJnENc0mapIUWBPB0vm7Phyu9U5vS30XbIP2qsQlm6Rsh74UC/p5zf5+8th9NgDf5vY6DBmtD1Ca/KRmnTEFBVjmAavSMxsaMP6lcS77N0/InAgJcKmkgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hRSGl9BzaJz0p+SD9Md36phccQ+q0uXJw5SwkNlsEto=;
 b=QELS4U3Omo/Ri6Zp+y+ZT1eczBiGIS2lRKMREvrqnOM43FQujwrlS8N1eAp7Jv3wTrdWKJQ3LufrQqUVH3Nzj/h29c64OfyJibAjKCC7hP4LYwLW4itYdGOinuzF0rQR+DA9m5WSQM+VI+J5QCEhJpW0oPQWzKm7+bnS9cqn+/PeKhUUS+rRaudjs10z3cYaLPfxc1A9xiYSBwhyTVBP5XSw5uxlhbq/TvqWYU+81EXscvPS9nm6z7wJycKSxgdgfNAApz+nbWROMjGopiHehFI3WK+EqHzrs/DZ8Slq8N74wiOIqy/KKfLm0ZV7kyk6uXYdx77w9jsG79rZ7mFByw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA0PR11MB4653.namprd11.prod.outlook.com (2603:10b6:806:94::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Wed, 27 Aug
 2025 21:44:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 21:44:49 +0000
Date: Wed, 27 Aug 2025 16:44:45 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/uapi: Fix kernel-doc formatting for madvise and
 vma_query
Message-ID: <on7fswevb2jgayd2oeg5v2eie7tbs7bswkswuhbqngwle3d7ix@m3brk2ovi7fe>
References: <20250827190136.3810508-1-himal.prasad.ghimiray@intel.com>
 <aK9SPl80UTjp5Cvt@lstrano-desk.jf.intel.com>
 <c04c5641-f724-4416-bd6a-08d5a0dcd159@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c04c5641-f724-4416-bd6a-08d5a0dcd159@intel.com>
X-ClientProxiedBy: BY3PR04CA0013.namprd04.prod.outlook.com
 (2603:10b6:a03:217::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA0PR11MB4653:EE_
X-MS-Office365-Filtering-Correlation-Id: e91be2dc-0dff-437d-91bf-08dde5b2f2c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?4IxLvnQOlMneG8vQlCYvtSRxsoyZSRfSjEPqghzBZEae/Kcupzlref+Yve?=
 =?iso-8859-1?Q?N8keOkUAn731A6YYCURLbGuR6T03IYJjyq3pPnxCLsspQiOgeCaZQs6zFq?=
 =?iso-8859-1?Q?tmCgC+hjw1g3QD9YPJVHf9l5SIFT1XvPU5PV2c4ZUuzfbNBgzUkW3piMAh?=
 =?iso-8859-1?Q?4LROHUPwb6elafD9EsuJNAZC8ulzBlRA21YtCmS+dAaxLVa2csZ7ZqyXZM?=
 =?iso-8859-1?Q?h57mrf33niYB0UAZ9J+0YQJtyDXSd5MaHWGY+Oj7J49P8XBe0YFkdolEQe?=
 =?iso-8859-1?Q?DFWgXcrU7XFr8vLOw0rB9ssU/GGxDJ0n2GLHKr7JmHTR1SClI1ypQn0LUv?=
 =?iso-8859-1?Q?FYPmMzyoOGGdaMTqV09+aqaaJJC/EtZ4sFYptzXnoJhJ422m3NyTBDJdVG?=
 =?iso-8859-1?Q?ovVpqHpXjvMIBwUurBsOt+THPKONyCDUum1Fjf+VuNuP8jwpCkUOIE2w+k?=
 =?iso-8859-1?Q?/ofXQt9i2dNC4dN0PKv3ZFhdmBX542DLfG6StRJANyj6R8+YjZACMO/Plj?=
 =?iso-8859-1?Q?swYtcrRe0h4YACRQ4aUR4IuHhjW+syuieAyL9np3R5LGi3E6V9LuKUpnNu?=
 =?iso-8859-1?Q?1clf/kUAmupG1/KGMzEvKJOkEQfcEgzE+W5+JrYHluimDmSt8b1yF2wJAC?=
 =?iso-8859-1?Q?kd2wfNYra6KK9aKBHFy8w/Bhd+m5EI0WW6LzZvgca4tCaw8opaj5z/x+g3?=
 =?iso-8859-1?Q?LZIF4qacrk0vPhDA05mb1TTzSSvFvuO4X6MpJoHwqSDcFHaHRbhlKVgIY7?=
 =?iso-8859-1?Q?3Jm9eERYJ7VoL7en8Jn3Hu5cKiR/YkGmz8Jo6eqYd1l62vGGfDhBBGwWOU?=
 =?iso-8859-1?Q?vOqmwgCM9vlAuGTUh3l1Nap0o35QDIu2Lb7pfsPj/NcU4vzrAdrM08E3nK?=
 =?iso-8859-1?Q?yzOSIbe5s9x/JVy952K7DWUx3rPoqzL9MBFhl0YHL6wRgwAfE+JJPbPhFo?=
 =?iso-8859-1?Q?Z3Li7rR1/Btz9HXeHtBb/jkDlIof8GJR0JFiZM4GXwwBNxtmgJTtBb7sCS?=
 =?iso-8859-1?Q?NSHPXvzqgmhshzwPobDJQzmAleUF0+uwQwhHfbrT9Qa54gx4otxfpR3/ha?=
 =?iso-8859-1?Q?tGMGBpPTKdFocZlQGc2GlaJthjzQ0Tnv6tpAaFrpONWUvydpOGnVZ+TDlt?=
 =?iso-8859-1?Q?6kUe+8Mc30sFDfaZl4Wd55a+GjllJQ1AjSc3aJPwMelg5TgP0YyTkj6jTV?=
 =?iso-8859-1?Q?0bCg8ZYw7Lf0gdAiIrnMk+6wadlp65HZg2mG62CGSkIicpqSPJtgDc/7u7?=
 =?iso-8859-1?Q?BXJOqhu4HIgnxUBsfHyGmkDQ3VOh3bLUrM6BOJ+S5jxdHjzlnwZ6w1Rc0W?=
 =?iso-8859-1?Q?ATSR7hTLrqJpCddKOjHCbePcXjwa/TM7BnEwKSt0EFC7hBjFNM0fz5ZI3H?=
 =?iso-8859-1?Q?OA487CsC/+jVeHgRm2Lubz3r5gZM7Dlo0da6910YHgES3VOtkvzTCxoi6C?=
 =?iso-8859-1?Q?ZTT3NhdrkUKPtgJXigGpvPLEOcebnxMitzLPssHSpalVRoazkvTMR494oM?=
 =?iso-8859-1?Q?c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Fnk9CmpuOlxojGO3Gv1P4k8ox8+oZSZUSCJNy365jU0MyecghLXuxSmH2t?=
 =?iso-8859-1?Q?naxxR1QcqkqTmKm3FRwIbidZ1kLt+PRZ6UgOuQCB3FvXtandSZoM1Nr3DL?=
 =?iso-8859-1?Q?CN2B1IoweXP2xTzb++nFjzWENAckLvWUxi03BjYkKAgs4FejuwTsJuDLU4?=
 =?iso-8859-1?Q?92xxoYV3uAeb5gUI1w44HDfr0LknI1Ohp7uQ4hbFJb0IpFZvB6m2+8Xcm4?=
 =?iso-8859-1?Q?NplCJ1Am/5/vzauaNJdrzSiSGibAhCVP/ehp+c5ruTwlXPhexuIyfaMrUF?=
 =?iso-8859-1?Q?Z/4rgNx9Wr3dzHJczdTAWz+7QTgtAOJCTZERIcIao5BWonsbocX9HAAxTp?=
 =?iso-8859-1?Q?Rj1YYrAKxqnVqWg179NMYIN0mri5ZjoiNIgics6Wc6PYn40Wo+IlFFu3++?=
 =?iso-8859-1?Q?8BpD03Vn0V2RoOwBxC254MpQvV+MjiWrGIM1D22e11w6ASKfHiRqRsVR9f?=
 =?iso-8859-1?Q?tn5XbIRjyion+nLHKRbsVqUCmVGHU+aSpTyHEbXeBh5m1Vs8oEOf3nrvtJ?=
 =?iso-8859-1?Q?SEjbCSs9BeQdSzEiMdchq1vE3+FX2Bxy0UpoWiLDaBiNJfxwkCYs++F73l?=
 =?iso-8859-1?Q?IrIco7AIkL6Sam8Rpq1Z8E0XYKpHvJosVW7HKqQMgYmTQ/9HKIvmdT0ren?=
 =?iso-8859-1?Q?ukGqeAfp3Yj5sIy4poCoYVtkSUNpOoX/r3k2dzvic6AMxspYU/+jhnQR4C?=
 =?iso-8859-1?Q?sqgsSdoMNSHLLLWI/DvUjKnyqA3zGh2dN+vf5V5sUh5x3IAgQLLOQXz0k1?=
 =?iso-8859-1?Q?tKlpJ+XuDNPOZJ69c5IA4zpTwHRApymlAPLqj772kPae4HJFcCiKD7IhQe?=
 =?iso-8859-1?Q?hyi/9AvoUjsTCeiCdoZ8hZI9Yjv8exSedMDfaymSWAezh/Dokf9/7n6hMz?=
 =?iso-8859-1?Q?lKtf4kp++okkThFiQifod4R511mv4en+GAQ7pfwwLtmLDGug8zZcYhbG5g?=
 =?iso-8859-1?Q?NdlJRcJFqdj1lsZ2UElNhcvWXSfEH1pAy9at7jfoguVVxb5KcCGi5AsAtJ?=
 =?iso-8859-1?Q?Apl74XYiAWph5AKF1utsxzPRLKiuaxus3jtcUc+3NDSL8mEiRU7SeZOPqt?=
 =?iso-8859-1?Q?S5Zc7/hXPp5LUX9mbekvcoZ1DRAvFgWKqYSgSHv1RlnslPVdkKEmOrPWth?=
 =?iso-8859-1?Q?s/GLK9I+R+E4/5OSpgFRQC4mcFPGyJmiN2Yz/fZ+QKYovIs0xlqA4owL5D?=
 =?iso-8859-1?Q?VKe7khws6gRIC+imKW4GGqnnaTNTRKxCF1d4eMJ4Jx9HO85V6fRbenOhTh?=
 =?iso-8859-1?Q?cbmKxmFHaAc4YsRlx8xn4gnWpWfrNVqgvGzu+yjWzDE7R7/MkPNWtqsr5x?=
 =?iso-8859-1?Q?GQYI5qexYkA2bY2QMXQn9B+fFjYmZ83B4MrtQNQLzp0XQyAOwjeLwstxn3?=
 =?iso-8859-1?Q?W1/CsTEd7vsfAyTb+bs+ucqE1GojjEhmujTWFz/QkVGd/MQ9LS8+ywnY/T?=
 =?iso-8859-1?Q?3HuDvdPynd3YV2ypEWgy030wDRD3JWawfYX9RSX+FeFVk5rf7hZ43b4RN/?=
 =?iso-8859-1?Q?0ca3p+r6nLV01TBiFObRbGxWMBD5GUtne+MUfRmsOSOO2SSUxTy9ll6XqD?=
 =?iso-8859-1?Q?298E+U39LrRbgBP0tAnacYPMjaBT08cOJi4JT4nDaYUHULq+WtdO+Ikr3y?=
 =?iso-8859-1?Q?GTzqGvEDophHZu1qGoS5LX/7Yx1RptPpElzfRq5wgcJ7x2O2xtW4+qZQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e91be2dc-0dff-437d-91bf-08dde5b2f2c7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 21:44:49.8213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6YnEntr79L6duh8XsaPwL3VglUjj4bh9b7MgP5tKtFjhpOcr2Dt1rt6U5atm+yDwC54EpYpme5eqi9c8l6MIGuS2QNt/HzkFjLigCPWoem0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4653
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

On Thu, Aug 28, 2025 at 02:12:28AM +0530, Ghimiray, Himal Prasad wrote:
>
>
>On 28-08-2025 00:15, Matthew Brost wrote:
>>On Thu, Aug 28, 2025 at 12:31:35AM +0530, Himal Prasad Ghimiray wrote:
>>>Correct kernel-doc formatting issues in the UAPI definitions for
>>>madvise and VMA query interfaces to resolve docutils warnings during
>>>documentation build.
>>>
>>>Fixes: 418807860e94 ("drm/xe/uapi: Add UAPI for querying VMA count and memory attributes")
>>>Fixes: 231bb0ee7aa5 ("drm/xe/uapi: Add madvise interface")
>>>Cc: Matthew Brost <matthew.brost@intel.com>
>>>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>---
>>>  include/uapi/drm/xe_drm.h | 29 +++++++++++++++++------------
>>>  1 file changed, 17 insertions(+), 12 deletions(-)
>>>
>>>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>>index 7dedd45ab995..a164deedae33 100644
>>>--- a/include/uapi/drm/xe_drm.h
>>>+++ b/include/uapi/drm/xe_drm.h
>>>@@ -2006,12 +2006,12 @@ struct drm_xe_query_eu_stall {
>>>   * .. code-block:: C
>>>   *
>>>   * struct drm_xe_madvise madvise = {
>>>- *          .vm_id = vm_id,
>>>- *          .start = 0x100000,
>>>- *          .range = 0x2000,
>>>- *          .type = DRM_XE_MEM_RANGE_ATTR_ATOMIC,
>>>- *          .atomic_val = DRM_XE_ATOMIC_DEVICE,
>>>- *         };
>>>+ *     .vm_id = vm_id,
>>>+ *     .start = 0x100000,
>>>+ *     .range = 0x2000,
>>>+ *     .type = DRM_XE_MEM_RANGE_ATTR_ATOMIC,
>>>+ *     .atomic_val = DRM_XE_ATOMIC_DEVICE,
>>>+ *     };
>>>   *
>>>   * ioctl(fd, DRM_IOCTL_XE_MADVISE, &madvise);
>>>   *
>>>@@ -2073,12 +2073,16 @@ struct drm_xe_madvise {
>>>  		 * Used when @type == DRM_XE_MEM_RANGE_ATTR_ATOMIC.
>>>  		 *
>>>  		 * Supported values for @atomic.val:
>>>-		 * - DRM_XE_ATOMIC_UNDEFINED: Undefined or default behaviour
>>>-		 *   Support both GPU and CPU atomic operations for system allocator
>>>-		 *   Support GPU atomic operations for normal(bo) allocator
>>>-		 * - DRM_XE_ATOMIC_DEVICE: Support GPU atomic operations
>>>-		 * - DRM_XE_ATOMIC_GLOBAL: Support both GPU and CPU atomic operations
>>>-		 * - DRM_XE_ATOMIC_CPU: Support CPU atomic
>>>+		 * - DRM_XE_ATOMIC_UNDEFINED: Undefined or default behaviour.
>>>+		     Support both GPU and CPU atomic operations for system allocator.
>>>+		     Support GPU atomic operations for normal(bo) allocator.
>>
>>Missing a couple of * here?
>
>sphinx was throwing "WARNING: Unexpected indentation" for multiline 
>bullet for * usage in other lines apart from first.
>
>Removing these * docutil doesn't throw any such warning.

but it doesn't format it correctly in the output. Trying it locally it
seems more like this:


diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 7dedd45ab9957..96620916b33ec 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -2005,15 +2005,15 @@ struct drm_xe_query_eu_stall {
   *
   * .. code-block:: C
   *
- * struct drm_xe_madvise madvise = {
- *          .vm_id = vm_id,
- *          .start = 0x100000,
- *          .range = 0x2000,
- *          .type = DRM_XE_MEM_RANGE_ATTR_ATOMIC,
- *          .atomic_val = DRM_XE_ATOMIC_DEVICE,
- *         };
+ *   struct drm_xe_madvise madvise = {
+ *   	.vm_id = vm_id,
+ *   	.start = 0x100000,
+ *   	.range = 0x2000,
+ *   	.type = DRM_XE_MEM_RANGE_ATTR_ATOMIC,
+ *   	.atomic_val = DRM_XE_ATOMIC_DEVICE,
+ *   };
   *
- * ioctl(fd, DRM_IOCTL_XE_MADVISE, &madvise);
+ *   ioctl(fd, DRM_IOCTL_XE_MADVISE, &madvise);
   *
   */
  struct drm_xe_madvise {
@@ -2073,12 +2073,12 @@ struct drm_xe_madvise {
  		 * Used when @type == DRM_XE_MEM_RANGE_ATTR_ATOMIC.
  		 *
  		 * Supported values for @atomic.val:
-		 * - DRM_XE_ATOMIC_UNDEFINED: Undefined or default behaviour
-		 *   Support both GPU and CPU atomic operations for system allocator
-		 *   Support GPU atomic operations for normal(bo) allocator
-		 * - DRM_XE_ATOMIC_DEVICE: Support GPU atomic operations
-		 * - DRM_XE_ATOMIC_GLOBAL: Support both GPU and CPU atomic operations
-		 * - DRM_XE_ATOMIC_CPU: Support CPU atomic
+		 *  - DRM_XE_ATOMIC_UNDEFINED: Undefined or default behaviour.
+		 *    Support both GPU and CPU atomic operations for system allocator.
+		 *    Support GPU atomic operations for normal(bo) allocator.
+		 *  - DRM_XE_ATOMIC_DEVICE: Support GPU atomic operations.
+		 *  - DRM_XE_ATOMIC_GLOBAL: Support both GPU and CPU atomic operations.
+		 *  - DRM_XE_ATOMIC_CPU: Support CPU atomic only, no GPU atomics supported.
  		 */
  		struct {
  #define DRM_XE_ATOMIC_UNDEFINED	0
@@ -2196,6 +2196,7 @@ struct drm_xe_mem_range_attr {
   * Example:
   *
   * .. code-block:: C
+ *
   *    struct drm_xe_vm_query_mem_range_attr query = {
   *         .vm_id = vm_id,
   *         .start = 0x100000,
