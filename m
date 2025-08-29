Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36AFBCA0FF9
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 13:53:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED4DA10EBC2;
	Fri, 29 Aug 2025 13:53:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RvGUJ6PQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD6FB10EBC2
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 13:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756475609; x=1788011609;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iWKah5I8dPVqw8FmOCvSysfYjXt+QS3lVcxfoFWiK7E=;
 b=RvGUJ6PQobwSOcx+xlQQMZI+0ARX1gJ3lUGPfkltTNee6YZZv31zQ03V
 8GRYP90SN8jqTXkvVoyzQmhmzVjtb99pntIV5cWAKREZlx+0GRdJoAUxL
 1BYY0Paeyz11go/m01+Jg6+U2q9DBPl6tqqgVE7TXDOUJRO2/Qa/KAQbU
 VZZ63ruc+i5+EKqJXeO0h9z8t5HQWCmLkqPLG7E7P35HCjlbyHLEgI4LB
 +QRRFYNbGcTkWG1Vb9CI3mg4NwwoQqX99nrLx6hi419PnLziWKgVORXZ0
 QF7GFnpeFQSkzpuTv1lVXsEIZ9ipnjk6o7rd9NYPzyv09vLkawzJKtLnz Q==;
X-CSE-ConnectionGUID: Mzso2RAqQWSzwirYWcGuKg==
X-CSE-MsgGUID: i8imkd0qRq2eAnzbZv/xyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="69863358"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="69863358"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 06:53:28 -0700
X-CSE-ConnectionGUID: 2000R1hFQC2x3g9FOotnPA==
X-CSE-MsgGUID: o+wJSlMfTIm1hLZfSoF+ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="175679271"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 06:53:29 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 06:53:27 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 29 Aug 2025 06:53:27 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.87) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 06:53:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jSAPaC6dFA9dhcAmX2OONkcmYZcow9GlL5JHHowuQKT2I6ATYvuR1MRCpEn1FCfJhiLLIpXPFSdcFpG0tJLloU1EP+HsJVHoKv7KOXh/e2uHm6M5ll2ic1+p1WtO4CaB9eliLOPSpYdv1tT92xkA7ceNVXPTKMni12ZPjIddGa6nmpJy4Hhzh+v2C7yzWmlGJbdVvFVIjEitb8jK5zlvW1gIYvhE0cn1l/Gu1/xcpLzND4N+LQPothLJBJqBJ+wOyHz1qM8W1Wkt/TddBadxS7wFq8/lvdFTRt85TjjXa5EkAqYRjqaEwZHCj5nBfiK06kPh3oe0HBqhJfxTGDUjoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=469vPLJmR2G1ENqCL7PgxTHBsZbVWCpR31p3g0txHVE=;
 b=lGmbAL/6DLfIVgUuw72C6A+cXPHFpx6kgB6szn8/CTJAWQkWoGDYtsiIo8fU8ZVQCcpa1kv12py9yvOBFX5LRSBFDCiUm0TPXmV5GqQ78pSxOMUjkmHpYx5+Y3OJhSc3+1hIyxJqn63s6Svw0011sEFIChI46OceymCv8EqxOFeKZIWVhz+HqfGqCCCBz7G5mGKL4W93yl3O7/DtyVow1d0NKLukzoePpdcOmNqhxWyL/tg8hOSpmAA2L5qRk86gL0dMY943D9FHnnSSYU9rdfoPXUIaW7i3Yj0mwV5Rbq/bVRF6Ge/6TF2XVDB0Xw7bOoQlMtttosjuda7mRFqiRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6141.namprd11.prod.outlook.com (2603:10b6:8:b3::13) by
 DS0PR11MB8762.namprd11.prod.outlook.com (2603:10b6:8:1a9::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.21; Fri, 29 Aug 2025 13:53:23 +0000
Received: from DM4PR11MB6141.namprd11.prod.outlook.com
 ([fe80::31fd:4de2:2775:396f]) by DM4PR11MB6141.namprd11.prod.outlook.com
 ([fe80::31fd:4de2:2775:396f%4]) with mapi id 15.20.9073.014; Fri, 29 Aug 2025
 13:53:23 +0000
Date: Fri, 29 Aug 2025 08:53:19 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>, "Vinay
 Belgaumkar" <vinay.belgaumkar@intel.com>, John Harrison
 <John.C.Harrison@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 4/4] drm/xe/pcode: Refactor pcode_try_request() to use
 poll_timeout_us()
Message-ID: <ljtjibcl6ivqeva66d2rsofgwu7o4vt4zrx7qumb3s5gw65vbv@mclxcipdw5jf>
References: <20250828-xe-iopoll-v1-0-9832ccd1c8b1@intel.com>
 <20250828-xe-iopoll-v1-4-9832ccd1c8b1@intel.com>
 <1896b8fb-74de-4549-a531-d76989dcbfb9@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <1896b8fb-74de-4549-a531-d76989dcbfb9@lankhorst.se>
X-ClientProxiedBy: BY3PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::13) To DM4PR11MB6141.namprd11.prod.outlook.com
 (2603:10b6:8:b3::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6141:EE_|DS0PR11MB8762:EE_
X-MS-Office365-Filtering-Correlation-Id: 81bb3fbe-2cda-4919-503a-08dde7036ba2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?skiGXpY94mTn90mlJUoRJjJ6Jp2IkiHk86IuczZkpdr9NE+VK36UvuB4LKIO?=
 =?us-ascii?Q?a0WIibTx8HM1bjBQBz20gglpXUL5Cs+3GRfUpACbUV1VTLKySnZr6oRUX7a5?=
 =?us-ascii?Q?pEOt3t0tYN0b2ltPjtmefdbnkRdJRT8nLmpaeEN4x55xw4iejQQboWgH4aS0?=
 =?us-ascii?Q?JcjErKbyzFTxKhHdIrG0ETPm6cM1JTH2bm7I5Bs0XfXbvF18oQyqsupQQ9cJ?=
 =?us-ascii?Q?cWh5uGtX4sTuYrUJcVR3yqMG+RaaESHVqbsZz7MPiJQ0EUb6M8NMW9mhZI3L?=
 =?us-ascii?Q?lZ+22Tb8crfjQuILeqONj6b1RmWpofw0zS6bVLlNNnJMaFtpiuUfhOheKqqN?=
 =?us-ascii?Q?MmzK+GijtoAWyc9oXA/appCzp0sPaEQEa8UqqBt1iV0svXF/i7bMk9xZBb9b?=
 =?us-ascii?Q?iEGG5vsXno6fpoMEoaXsd9dyc+7SvR+as17ocLLupRdqjSskbY604Nc46nfV?=
 =?us-ascii?Q?zqvBCJVymrXpUDyvtHCDVS333OXNSR6t1U84Sd9fskYVEvBt36WMoIQ+sMC9?=
 =?us-ascii?Q?3RrcJ4SMm0mzx0nEncgk+iPcKUDpdHeQ5+U8uab5IDkrNyUZ0qZFkUgOTQRc?=
 =?us-ascii?Q?oIhUfxVfwTgK1q/nAA8a2foubMIWxVMCujU8nTPydguX95lLuQoeoO9Qfo0O?=
 =?us-ascii?Q?xh+r4uW3A4pKHvTvXTkUkHnuWtG/7eg1GgK11DoqerX88OprZLgOhHR7vB6d?=
 =?us-ascii?Q?qyr8RTkwXr5cRtiOznvlQ3IaiPxFtpuORdjjlpa5wYGegzPsWlgwyAh925Nm?=
 =?us-ascii?Q?tHS3zcO1fUxAnvuWyne8MxYsr9HDtD+cncQcg/jQ4xWQKIJlOZ1C0S1mrkqz?=
 =?us-ascii?Q?4Babs82IBwj6oy98rdizkjgrmZavkQYZiVLSyn9cbICLNS96dGxa6JOp+H8b?=
 =?us-ascii?Q?gFdod/dDZAS07JWKpcaBi0J51SY2c6apMhZC8PIjrljmn9IYlK9AyRA8o5Lk?=
 =?us-ascii?Q?rrrQYkMN3g9yivNd/VXY0baK5uadP/LOzFwqKqUFr1gQ8mub4guipCuujm7a?=
 =?us-ascii?Q?tdsMhWf5VGijeU3m8ZXcYc6NcpfWoySJQwlupP2pb+WUOF/uuDJkxVd94ABC?=
 =?us-ascii?Q?tc1KUo7ETumpNpXQYNCCr+i701FSQY6URyVBdC6gmNuMWe8omFg6Rv8pyV/t?=
 =?us-ascii?Q?0t1jxGT5M4YnmSCfeALeZg5tD8/3AVyqqDHKKF3x27vCHTbvLB71BSEpJvyh?=
 =?us-ascii?Q?6oP4ebLtv1JnXEG1zlL7tF3YdqKTecKl72t5BmCd+DVatQK7LHEPTUx51+Vc?=
 =?us-ascii?Q?C2lSnZgo5JufeBjVfYAlzclNWrF24GwuS37oWwHQY8clfjhCMVNWdMAPFv+v?=
 =?us-ascii?Q?nhHldbYvYvhH8Eof6lzwjIXsMp6f5vRUqHIrmZx612P0XMVaZQV8hjZ3evHz?=
 =?us-ascii?Q?MDeDJZ+JWu5U/z5a3wkcAp8pVAbJUARazp3/yQSuqTmXA6836HyllWQWEHWZ?=
 =?us-ascii?Q?egoC/klpU8E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6141.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2+gSfM6YlZCnDXEqgmL4SIYhSC9lzQWECMoAR6YaNv2U+0/14Lfesj3K+2xE?=
 =?us-ascii?Q?ITXzOuaRrQNrwsXlCLnxMV0WY7lV80zJNqXTajEJV/Gvdd5mnPcCVfASsF/W?=
 =?us-ascii?Q?2TptRgps/9eKEL67p1vXONyp63FlRv8AHc1/eVjpljWVmMQ/fXts39s4qf0V?=
 =?us-ascii?Q?Vr/qeOCgknrtnJsHDet6V0n+fHUl68M+rUha7q8MOzSaMoym5s2wOrxZqrSN?=
 =?us-ascii?Q?m3DTnfyq/KjqYFqk5yTGi9jdrLovCh5Wq0IJ4WEv03gXtOxflH7PSCGFPuIh?=
 =?us-ascii?Q?KNjKlEsWARBPIKGTrQVOerbjNanA3vUqgpkLMiZy1QW8mxsBjpl2tgUhlI7C?=
 =?us-ascii?Q?S9qSzDtY8tNRTbXJdGLkuk54GDyMBtTvgVgk5bLkT/ZOgR4k06FL06c0Xway?=
 =?us-ascii?Q?AfkCKzpTzE9WpWpBhYUSAB9kiEdJ7HJSPgm2Dop9QCwPrwqUrDeANBsctori?=
 =?us-ascii?Q?HXn97ty/+3BlZBy1u9DGIFYzVJnJoVkbcLfDMDmggaepA4QMos9mnXmX/8fu?=
 =?us-ascii?Q?xpzcG3vNtFl6hYxG//8PyC5AGyhHWhJSJwafysb6lC6HIq6KPWQvSxaKxkeH?=
 =?us-ascii?Q?bNnAJoe7pnbvnsh1E0c8SAIaV/KFvO+OY0SlTGW3/UMYlhRNndcHfeSLeqFP?=
 =?us-ascii?Q?CGyfh/Vb0E7g24vABnHtxccdnTfrNCBZJL7tzWqinVdpigp9clh2OIsAUctw?=
 =?us-ascii?Q?E0d4rO4q9qFZWaaKFAftdAY/qQ8DBl2HnYMW0sERx77twq74xZ5gqDajo+lh?=
 =?us-ascii?Q?KZ0GnMAqUWPP8BQ6vg6l6eiceK3QXSJ34kH1OExN5StV3QNdUqqGn00wC+r/?=
 =?us-ascii?Q?JfJ527e5386+xwhic900RpXrjKULbdg6lOKYW2/MWFg7d01Sy5rnQ02utwVQ?=
 =?us-ascii?Q?T2DbT8WWn7yDeekOvUmiUaCiFg7Nq6/s0LUzWejZSKiK/7+yz8QdqWHplbPK?=
 =?us-ascii?Q?I+STLiRMxjnRJYKo0glYHZs3VY2qJ+Oc4p0ufSrQ3GvaXypwXeiIsO5gla3b?=
 =?us-ascii?Q?wYpkIHlzhzBXY5XHw6kMQ974956Mg64iwrCGBpf7dybvfkwlN824cp9stK38?=
 =?us-ascii?Q?QvQvi/vxv2VJk/KpVH1u3OYs8CkYwsmKOkejN+/eZaGUVd80Ft4I2/sWRtix?=
 =?us-ascii?Q?e4MyFlNpB8JxEmzDG4EFd3gLy6uUaOIuBsSWGPM9ubNaGj5sjpImLnqxxQc9?=
 =?us-ascii?Q?y0Gv2VyTkI3gImfNnuT2/uyLQ6Epbbmu8OTZbkstdhGI4oQwKvjD4KrScpf0?=
 =?us-ascii?Q?JqGDwY1NJLJjXjaz6trMs3KcXIs0HqWdhflt/eiv0RDzekb1omuX66N1Qskn?=
 =?us-ascii?Q?OTDB9sJP1Oci74fPa7U0UxtzFzmIBrZAE3ZQhrINHz+/gsXw4LYpRe5Nl7dC?=
 =?us-ascii?Q?lIHUpIYgJMRjtEbCxxl8BMM8MMC4BegAFUN8cjplCCBFVHCdnnaNLTQ9dX1h?=
 =?us-ascii?Q?ig8KqmJ5NRlwtIV1R7POxoAQZOP/UKFgbMa0dPWskn157l7d41V9JhVQG5ZK?=
 =?us-ascii?Q?WrOMDGmdPaVzN7P769BDe5R7vhtjGLp4ad3ozb4OQIp05PAc+frUabcp67eD?=
 =?us-ascii?Q?atpUeA6fDMh1l6YI3rQo9HZU2rZYqEjo7m712/XHH6xr+3uB2mEdOKAXybIh?=
 =?us-ascii?Q?4Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81bb3fbe-2cda-4919-503a-08dde7036ba2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6141.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 13:53:23.5479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XP0Za7dZs8Zj6pQ6E4n1SQYIKs6s465G/ET5ZCXGSxQHFHFRxwZuqCGCnXdHmYAx4nKnxK+qCgT7rrzU4IC37CdCcUEygRW/ZsF48Xa9Zz4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8762
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

On Fri, Aug 29, 2025 at 01:35:12PM +0200, Maarten Lankhorst wrote:
>Hey,
>
>Den 2025-08-29 kl. 00:04, skrev Lucas De Marchi:
>> Refactor the hand rolled wait to use poll_timeout_us(). Do a 20us wait
>> between reads instead exponentially growing from 10.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_pcode.c | 33 ++++++++++++++-------------------
>>  1 file changed, 14 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
>> index 6a7ddb9005f99..7bf5d3b9c0cc1 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode.c
>> +++ b/drivers/gpu/drm/xe/xe_pcode.c
>> @@ -5,7 +5,7 @@
>>
>>  #include "xe_pcode.h"
>>
>> -#include <linux/delay.h>
>> +#include <linux/iopoll.h>
>>  #include <linux/errno.h>
>>  #include <linux/error-injection.h>
>>
>> @@ -135,28 +135,23 @@ static int pcode_try_request(struct xe_tile *tile, u32 mbox,
>>  			     u32 request, u32 reply_mask, u32 reply,
>>  			     u32 *status, bool atomic, int timeout_us, bool locked)
>>  {
>> -	int slept, wait = 10;
>> +	int (*req)(struct xe_tile *tile, u32 mbox, u32 *data0, u32 *data1,
>> +		   unsigned int timeout_ms, bool return_data,
>> +		   bool atomic);
>> +	int ret;
>if (locked) lockdep_assert_held(&tile->pcode.lock);
>
>and then use __pcode_mailbox_rw unconditionally?

yeah, that would be much better indeed. But it seeems the locked arg
has different meanings here. In xe_pcode_ready() we do:

	if (locked)
		mutex_lock(&tile->pcode.lock);

That looks like a bug introduced in commit 933fd5ffaf87 ("drm/xe: check
pcode init status only on root gt of root tile")? It doesn't match its
kernel-doc neither in that function.

Lucas De Marchi
