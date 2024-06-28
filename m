Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6456CC2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 18:41:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA6510ECFB;
	Fri, 28 Jun 2024 18:41:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hmoaSWFp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C0DB10ECFD
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 18:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719600081; x=1751136081;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cdKViqJ4ZuAZzYJ/A0IwocAesV71dOj0Pj5Pb8zPvL8=;
 b=hmoaSWFpxFwAr9F46N4mJUd2kakLp4soyaauEBMJYnHfqMZAXRCRsVBu
 FDJ++W9f+MLNR51jcLSLYPveq/oL2Cq3E165hqK2ul1a/7VyQQUGvKCCw
 kvDNyD24WPidWxzjx4/ylKPiR3uTZgIVSwWGMwMGWzFzagztPUvqgk7rG
 +S8rhFskkcJ2C7vV7N8haxSIZUWyvigGfCxgfDCUK0ScOiVVJsgntWxEn
 ZPJc2dDqgBDWFXN/ZXJix94jsMFLzojl/FEP8QbnZ2B2GHE1HF+WrSgm3
 4t1SxU039Ekg7OFuJsAw5DYCTKeQoIZn2mU+WtCc9lr74oIFwbhMtnp1k g==;
X-CSE-ConnectionGUID: gS1XdaglQWaTfwyLEq4qHQ==
X-CSE-MsgGUID: RTuu8ddQTA6kNy733Ot/QA==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="19697217"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="19697217"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 11:41:20 -0700
X-CSE-ConnectionGUID: 1hqdVjYISGebLEufpxlBow==
X-CSE-MsgGUID: g3oewLtcQeWULiIoa3l8/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="45485028"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jun 2024 11:41:20 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 11:41:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 11:41:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 28 Jun 2024 11:41:19 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Jun 2024 11:41:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HayE61OR7ZGL0TmOee3wASDPrNMw1rMKcrcVV/vImRJGDLxgVWWePj8uRRWgdJpAFk3g7uqpYFyTNyzYUpQPzvzkcKY5QMGRLsj08pwXLlf1X3MfWKNdeVuOGwKGzrH2pOZExJFFbZJsW48fouXg36UMOxFF82hzt9ZSVNBp4xj/Pi2eZhj1R0fFAtpunLTtGMSENvrb+KMTIgKhdFIPaPB2hvzCsyj80tsQcL0ysmfZEmEmstkst/cnOI49gXBNGhehu6868myg+pGywiATeejeyAe+VDrhqdkytG3dFmDshYgwk4CoZp5zjwQjqpdaWfzSLl22in8siZtaxMnwUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GXOlcErfh5s9lRauokL8I2qAdtzDrHECBbPg8YTgt8c=;
 b=ZuK3Y15CPHXKrx5kPhvC2KjPRWksw82NQtf9u5BC686gGq3bAkKqPKImVPlKA7k58Does+LC6wYs1BeKDCkOmWKs3Dlp6+tIYKvsrRNvox2dOLzEteQyNfFkssxN1UtJjxKDS30qFfiC4Fn1PviBjZK1FRA81+gR12gyL9ko7kOkgRipslfG12PS/MHui1g7fbYImEMzI2sTuA93iLaY4HPpyF1ZbBrbLKjqB/eiyYzZY89H43rxXqkuAReMkZiT4TKt+092ON9CvrVw2Z4bna7REFQ9YPsiIbTvcnL92SaIIcPN99+0Tggw2Q4I09x8PBBZ+6tm9l6ER6B6mt9KjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by IA1PR11MB8248.namprd11.prod.outlook.com (2603:10b6:208:447::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.34; Fri, 28 Jun
 2024 18:41:17 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7698.033; Fri, 28 Jun 2024
 18:41:16 +0000
Date: Fri, 28 Jun 2024 14:41:13 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Mika Kuoppala
 <mika.kuoppala@linux.intel.com>
Subject: Re: [PATCH] drm/xe/rtp: Fix out-of-bounds array access
Message-ID: <Zn8DyRqMDxKr8EWF@intel.com>
References: <20240628161726.836734-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240628161726.836734-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR08CA0021.namprd08.prod.outlook.com
 (2603:10b6:a03:100::34) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|IA1PR11MB8248:EE_
X-MS-Office365-Filtering-Correlation-Id: 711ac843-c3a2-4b2c-1b39-08dc97a1e4d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vN40mDy9SMkGSEvSuik91wiSMeXJbwqugIlWqQSfjmqySQzp0aewrYhnwP8X?=
 =?us-ascii?Q?1h7nnitUe25crYQ7qcW/1MNsNTuaF4o61qZI0ZK8mqkAozkIE8+YIqR+t89B?=
 =?us-ascii?Q?UteRNmn+XZY0E8xB7TSFfI0jeUBBJp2BpX4nibLQGQhX0LMfye4Ci5M4+Zvb?=
 =?us-ascii?Q?KWAYCISiczJvYa3a0pcBt7JJu3ZuWhXDbKPFPSWvBpXgs4Y4ajA5BcoqajS3?=
 =?us-ascii?Q?KbvZ0lN9apaV87g3tlpMFNR+slHxZbZZvuMSqjRdtFjshnU54UXc8MdNySYu?=
 =?us-ascii?Q?0xEtWmle0Fexoxx4o7Mgya2DabOHhcqjyeJLApHBJOqnEVQRS6y2KPx205lL?=
 =?us-ascii?Q?5L6gDcWwLlY+uxyEEnslNCfkQihSsTDkOynj3gKQ5mcZRlDdMlXJEVDm4T/B?=
 =?us-ascii?Q?Ov/LlrJZMaFtr/xwkBxYKO2DXrZ7sttxvlIOXlNfiHBOz7AB0dje4+LdufdJ?=
 =?us-ascii?Q?OOG5nPsDVvTdx/H21mphYyuuTboeXZnZFUJ+H90iXA6XCu/AH8U4u7BJ2Qdo?=
 =?us-ascii?Q?xtz6ULK1D0sqvVbhKvryZed6Wya2pemhP1XBKUo2hxZ+331AKuZo0Gqa89/m?=
 =?us-ascii?Q?Je+PWuqmYA0uspKotVdMCXy0CzLaV5U4BZT1MakItFQDhfuLzpgmo88SAfpa?=
 =?us-ascii?Q?ijyg1jsAJxd0CysEokMXMNnU4zQ04w9z6XWGnIqwT9clsGz+WqLsXQNkW8r+?=
 =?us-ascii?Q?GCkX/WijyoK/rzFHotrycQORoGxMplM/wE74+PZ6t394Elgakjd1vf9Y+Ff2?=
 =?us-ascii?Q?CbcuOVO1H8YwSonRGlrgpgynVG/oKxXIiBOl93h8TVA3dPJQNG45wND32qe2?=
 =?us-ascii?Q?yLSmQzRoGUlWZSaCB49Em0LDGcUtkerMDaxE7jcrXBy9lzyJ8fWxNfYadXzU?=
 =?us-ascii?Q?e7JLC10Von+c34I3BRIgVpmCpruakIB8WK/C8uSig+uUwa9o/wohQMhXcxLV?=
 =?us-ascii?Q?PmtzvgZy6fsfum9TudIwVLXt3q57ilqY0USNb2GARKHGtV/PGqKBPDbdfXBI?=
 =?us-ascii?Q?Ia5qq0vbOLe03Z8Hm8pZD4kxmlr6G4YGmnJ4yjq4RoVpBfkLjpx/kK3HZR89?=
 =?us-ascii?Q?/Xxi79kgn3NGiIX1ehEAGFs19vxXr9+wAGZ8O7ZTYvEOlvcp5GhUySMWt79o?=
 =?us-ascii?Q?K+GqigNaONpbLYNk+xnNJ756rG7zlMvxRlLhSGnhQ/+OMMC03dANsQN4FL9C?=
 =?us-ascii?Q?fxssESwNCdVQ7/GAX4qoXeK26I5GWCbosChvrqGS1uXOizZXdIjwfilP/t2+?=
 =?us-ascii?Q?5/1ItZgq4zgv+wLb1z1vhMmpXlG88VRieA8RepoavTnnc4h0/VUEDExC/X+C?=
 =?us-ascii?Q?ra7PpjijGF1kBRGeJgB8jxEpT9ixFY/daNpm6b3Zw9IfNQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pQapPn3x+IpcKzW0wkPv6KWxvH9mGD9eBUvzB/rgkji5V90v5gmTiixu9Lfr?=
 =?us-ascii?Q?7XRVJaC/29JKrLyfy3t2fMmH117F0dvdJz2zZu9W0uvzasbzwXOiTl330h6Z?=
 =?us-ascii?Q?J9K1MptDfYJyO6084UDdWk14OgPdIRzEvXqsF7uHtWzeFSzMFhQrxcbjT30j?=
 =?us-ascii?Q?VGA5acyAhxQ4T/fFWFuuzewQ+Weze/refKJWOB9z84JjeBFi+6TckKc28uhE?=
 =?us-ascii?Q?5zoVAseiKD2qtULGvFeT5oqv0CUSbGpyoqwVJotT/YsuB4vnTLycc8VRU0Yu?=
 =?us-ascii?Q?FA1I1xIB+MBH4OHVNpgLOwI9f+e1QHmJqu90Mtz2DlWcQXoKDI17cayXczu1?=
 =?us-ascii?Q?sz3JJN2MHKOFj/4N9K7Efyo56AWE0XNgvl9GPh0ESs/bnEd1V0owB+QH8uVF?=
 =?us-ascii?Q?NczRhDZz0UrnEq8dyUKQ35RhAyS50mcR8cQ84iUZqLtsX/7FdyEuDKC9AWRb?=
 =?us-ascii?Q?JFbfV2h5iCij6oMY8s+n7M79AQpgobz3XsFFX0LE24E9vrlzq77w6bPjeKIz?=
 =?us-ascii?Q?krT6CmSUZMBBXjp7KKoLgwhdaUYn7Glx6f9zLF4eaWQK012+3HOM/hKddVYA?=
 =?us-ascii?Q?Hll5Dz0cvyN0OivXQvUVlsG4Kzj6beF6QXp8mdWOOfGFzHgNSblPVlb17XVk?=
 =?us-ascii?Q?Eg0qkDRxOkU6NS5K7+GdUmMOZeoaTOqxmDgZ84cDEm/4fBVs9yjajEgS/y5V?=
 =?us-ascii?Q?+m1jqCCCvLvsqddd89rm1Db99iJU+Y31B7CJXiuHLvZJoYOVe19z6PBjKSfS?=
 =?us-ascii?Q?3m2kmUNRxLPp6/egr0TyWPDWG2J2mR4O6gJw83RjA+43oby1PP5lVFNBto+A?=
 =?us-ascii?Q?UWGNwUJEBOlqBPykkzZboB6CCsv2XFHYLIsleje7Rqyi9Q/BS8t1Km4krLOL?=
 =?us-ascii?Q?W2o2N6293Hw6kZYb1XQDYhrytfkojci3OG529t4tpNP3Kz71+IY1A14WZPXp?=
 =?us-ascii?Q?4QZ3IWcZHwEqOPkqYJ1Du+6CBKagOPDySfi18s5ir9cxZpqlG4asURIFDOPy?=
 =?us-ascii?Q?15omZlVh+ilhkuAbm4xdf6DgKOuwFs+PSgceJRo4L06nUW+Dq6KUAHDTTJil?=
 =?us-ascii?Q?mjIWwnBiz1YA5GCczNr5c+qjvX7hmrs+DVquT2cYyeigxUdduimmr+A8Dgft?=
 =?us-ascii?Q?KZNTreD572fPzw9qoLDS9H/36lFMXo+WQYJ8U4aJCXNFHUXLdzWGKGzj7RBh?=
 =?us-ascii?Q?9irPRhqxmLPNo6DtSjpOn0J+50KWJVLamp8Ac3rz5r2Y/i2sGNG8JbGPJ8Gm?=
 =?us-ascii?Q?b7FVRULvW3m4nkk15aIMPySz92LgVoczwKbXZ4EWu3zgzTwniuwr30p6DmA8?=
 =?us-ascii?Q?vYWKJ/enTK5dUYyyWtOn7/eSXkJYXqXLW/Mhl19NNEhCZnQHJdXvAgcZ3Rxo?=
 =?us-ascii?Q?bzUi1pzyD8oEH8ott1U00e3JkhWBMe+6aYsTc+JODPGLVW1+dmAcK0mQLuE2?=
 =?us-ascii?Q?J4GMrT/TQG3QDyIEo2XDQ3/BIvVR7B8crYYCLz6zT49695fSsdxsUjq2hOwL?=
 =?us-ascii?Q?BZr/wr4tMqnLVUSIm2pXhurQS0+Ha5+jx+5LjioRrwd40soYG83gUi5M+pB9?=
 =?us-ascii?Q?HaTxdbuDlH1k0eS5zmW1ulQ2acdOO1mjcg54fzkI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 711ac843-c3a2-4b2c-1b39-08dc97a1e4d3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 18:41:16.8541 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x7dfrDwahER54Aca7bG1Ochr2Gh8X/Zin+5cJmn5InOyGb/ij6Zucoz4lTzXVBOlfH040W/ThZBT/CwqmFaUcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8248
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

On Fri, Jun 28, 2024 at 09:17:26AM -0700, Lucas De Marchi wrote:
> Increment the counter before checking for number of rules, otherwise
> when there's no XE_RTP_MATCH_OR an out-of-bounds access is done, as
> reported by kasan:
> 
> 	BUG: KASAN: global-out-of-bounds in rule_matches+0xb6d/0x11c0 [xe]
> 	Read of size 1 at addr ffffffffa0a50b70 by task systemd-udevd/243

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Fixes: dc72c52a42e0 ("drm/xe/rtp: Allow to OR rules")
> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_rtp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index 5b27f7c45ea3..02e28274282f 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -121,7 +121,7 @@ static bool rule_matches(const struct xe_device *xe,
>  			 * Advance rules until we find XE_RTP_MATCH_OR to check
>  			 * if there's another set of conditions to check
>  			 */
> -			while (i < n_rules && rules[++i].match_type != XE_RTP_MATCH_OR)
> +			while (++i < n_rules && rules[i].match_type != XE_RTP_MATCH_OR)
>  				;
>  
>  			if (i >= n_rules)
> -- 
> 2.43.0
> 
