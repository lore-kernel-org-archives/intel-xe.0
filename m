Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7B2C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Apr 2024 18:09:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DDD9112CB3;
	Mon, 22 Apr 2024 18:09:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kngB85hV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 066B110F52F
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Apr 2024 18:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713809366; x=1745345366;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vuxIkpiv0JWiNCWT0ZK0kqCFzqhrZ7wIsBaUxSAOwOk=;
 b=kngB85hVScBiTdfkNrmSt2l4S7kJnWj6g5hOc87F8uADZObs5LVGxqlI
 FnopLtv7DZ0+WI2UpopNgHd69o9NiAwT/pCOYIsLxTQsjxvMrCXDpyHrv
 UIbAntC+/pB3sRa45YMeZ5RJCUIObeRc9iUplthv8VFljX4m+OaqPFLNQ
 g8aSbsKFJPMRAEaUT4k8rQuK3VS9JkC7VgXtYuwgjPXFqiuefxHRSWAh+
 JtnLnW6iUQG8exDg5XqbRYO8tBnSw+bNGVR1s4APLJvIT/nYT+wa4lKPD
 F3ag3kF57oEKe0k/Ic8QHxTWXNYTiPk6sQauKjyP84hCKq7qsoImxw/yC g==;
X-CSE-ConnectionGUID: o3OJsMsfTG2/kCYj9Hv4rQ==
X-CSE-MsgGUID: Cbj4YJz3Suqj5ASaz0Fwpw==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="34762110"
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="34762110"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 11:09:25 -0700
X-CSE-ConnectionGUID: N/2XsED+Sf24eMAUdKv7+A==
X-CSE-MsgGUID: vLrhSVUKSwSCRpetsiO0jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="24168145"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 11:09:25 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 11:09:25 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 11:09:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 11:09:24 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 11:09:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cp2XEHEqJYmhEyBwtU5uC5I0DotD7w6hbvS/7thzjWN9M18B67ssgQnLsMNCuSou2969oNYzOIOQ02KYrOC4ovQNRrGiURomSRjuIbeM9oHo7cIeY++yQztdLVWi0OC++IhSWkOkioulIH5h9/JKpxIcBrMYzrAkGGiPnX4e8xypKbIFTLM6yZ3Y2C9/zqJRMCJbK8PPTF/BKHL0wGz12GcFAOjcgytoTA4koExH5A3p++6j8hF3Mux+kuNZCEYlPQfdUsmuEYXjWzBTMSwzcPGy4wgevncaOeK1sPpqTCumqOR0RC4+N77/+lu6PdSKII5wONfQs7Er50nDZPvUew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5c2rJWpesxYVCrOG/dNFoKhwrejpXeXKm+AgPGxOhrY=;
 b=l6NdfZMSArhX6Gyj328rbcI8Td4W5jd+vDne271khEgMsiO7z/QICt/GCAGPFP9ccgfQtjtyHOg088Ut91N5mnhVvtF5No6Ha520MvAGwwRbREBy1zemlAuvf4a4UZTxz5TOuZXG3k8YCF156UI20l+bCalj/ioCi5w/o/+qAlIDv+EWyvptbQke+p5Xwwyi8XRbrm4tw1E6v3gnuYfFk8TIUYwJ6ZTIrCMjNKxv3LFLRep8GlYtwK/zq8nBnV9dWCu/9fQfJBwXXLWzHr0LTYzebk8cHKFmMahDa5xrFCzN9RxX0aKmKifCEOBoyPlHHPqp9gfnWjaYizLjWO/MxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB6996.namprd11.prod.outlook.com (2603:10b6:806:2af::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Mon, 22 Apr
 2024 18:09:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7519.020; Mon, 22 Apr 2024
 18:09:22 +0000
Date: Mon, 22 Apr 2024 13:09:19 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/lnl: Apply Wa_22019338487
Message-ID: <k3jikyitmhmgwboorl4f76iio744risyg2qradk4p44lhsaqdt@whn77wuihwtt>
References: <20240419201344.2467569-1-vinay.belgaumkar@intel.com>
 <20240419201344.2467569-2-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240419201344.2467569-2-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: SJ0PR13CA0080.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB6996:EE_
X-MS-Office365-Filtering-Correlation-Id: 0abda11c-478b-495b-ea10-08dc62f755e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pfV8puUpAQ45vqA6/r37C7evxglagGpxbeFh7rZphhyFCAQigAzE9znZIyq+?=
 =?us-ascii?Q?Q6ka/DDb+XV1LrzrUAWv/cAxaYqs+ykelbKJWTT4WtN75ny7R2LpT3qZu3ML?=
 =?us-ascii?Q?BJ1xtjhUCqNZK2+zA9tEkbFDxtvZvmmggmbUIBGruWbgTk+iBen5d958VdaZ?=
 =?us-ascii?Q?u96eQySyWyDC4ESMwOkuQz6Pg0Sw4OCcqRtl3ynl1ViB6yNJYaV5ZP5DgOki?=
 =?us-ascii?Q?VwTVsJW/L7gLUF9MlDl/3InzEqKlVjFkw5veJCxZNJt/KJxsz1uW/AJFBQVN?=
 =?us-ascii?Q?SAXYa8WiJA/Et408dptosgaDbKHdhA0+lMArqtyWYAFWipvIfNqxLF40cV3J?=
 =?us-ascii?Q?ufUGVTLsi12zmXuUKvP5kpVbIJH5pdDjv9aGK6VjQ+ebl2m3VCcfwDMr4NSZ?=
 =?us-ascii?Q?nHKg2wuwTffKCQvkQ4TKTOgtXfQzmg3XjlSi0iCQTztyjB2+gNr3gVt64Mf2?=
 =?us-ascii?Q?MsnES4mQX0aTxExitE1Q7YSPniXxCyQsmoAqRpj7bB0jfs5vHYpu4V419TYe?=
 =?us-ascii?Q?DiWXMOg+l29u+jDQ7Xv5Y0k2P64/mnOz6aOMr//s4CsfVZDUpgL+A5vW3UtJ?=
 =?us-ascii?Q?kMrpNAfZ6HMrUihVEOxj+BtSEOQLoDSjHPmL2Bobrx0KGM160jaQBVoNQl5q?=
 =?us-ascii?Q?ouMjJqHX5bi2oAhzFRaxTQCE/JNZHZX6VdX9TJs9PnaE7jMeDhy3U6Fqxtfd?=
 =?us-ascii?Q?37ZAqfxD5c9ezPS7e2MQKXkD9bo0NlakKMphMSp3mBSs8NsNC4X80paBsThu?=
 =?us-ascii?Q?li9+0unHxOFJ8CUH1WcOVUn8uy+U0Qgk/qafhe8jCCKJZLx7Tjb3tui0DIRs?=
 =?us-ascii?Q?dLznQ+U5T1xzF3IUT443GVnSyy7mrmjuEXQI/slNvsyiFvCay5gztBP1NxeP?=
 =?us-ascii?Q?w2IH/T/iP3OjZ53Y++wa+mZiY8gcNbBOxP+VlS6GpiaqHsiFHt9yg49+YUj1?=
 =?us-ascii?Q?cI18v7fAJk4LPjrHL7bgSBP2ZJl3OtxSuXeL9UgKPt0pvNpx8d7pgfbjxD0Q?=
 =?us-ascii?Q?FwBusTVEppOutgzYg7BttMQT5sJE/3iAtOO58cx56QtfQNcquoKKG5xSwrfv?=
 =?us-ascii?Q?cUbsiuTlJLoOgyOnnvOE0dJigE+qYMIPeyOw7A3+XXOFIl9rm3pFZyfsmmVo?=
 =?us-ascii?Q?XjrrPHOlmhnzjHD3/SLVInuNM/iFmLCQg9V6wy9Dbv9BkgaDsNel5OsmUGJH?=
 =?us-ascii?Q?qCFI9nUhOgTUxH5Jdxyl3xorpGrJV6zuDbE//ldaauf0p+UEKq0WxP9joh0N?=
 =?us-ascii?Q?g+lw05qOHMmUTtouFl2N/PnXhItPcpIaOWiQroMeVw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uA4BqkqaPElINT9RbhOnCSGFsvP4xBfYHYo/OmQ/UqzCjA6sUMinJ5ilgL2I?=
 =?us-ascii?Q?DQFKkG/64NwXKRzLQIkekFGu7PMfTue4xpEmZNhPFSUgKW68O+QpHH0H2MQA?=
 =?us-ascii?Q?84sNzgYO1eW5xZFIOs3eUwwgcrXXXHiYAYsgyiTrcuEkrTDYAad9PytS8NfX?=
 =?us-ascii?Q?WpKsu7XdoqAsSFtaUdl5MVBOtbrCFDtTvCGQuLS8Xw2RIMmdhaftA38hbaOk?=
 =?us-ascii?Q?GCXDCLzwxeR/CS4nPcCOWClVgk6kYNGd3BAF2tYsbe443ynWCR93V031aYm5?=
 =?us-ascii?Q?/Hk2q7ZapmeY82mfIsDFbAHOTUWXB/ZIx96kbhucx7SnnQu8/jExhZtOEQZj?=
 =?us-ascii?Q?ZXufS8f4SFkBHgReeebW+AQCNFWLa4yyHhZi8HGAPt6/BeGYui7r8Sz6e0bo?=
 =?us-ascii?Q?VzrIPmL+TEUIjaq0hc+EYtu38mWybROtyrhjgJKLqdQtBuhPMjiXazqcGu7P?=
 =?us-ascii?Q?heubuxTrMxShCe01BHqbh6loMUlx1TXwXvwoCOOdl+hkKAbQtwNPjYvAJ0Fn?=
 =?us-ascii?Q?kJFMq2tPly2IpqHOT+ZpO6Gj6k+00Y3hornFFGliUFpucri3nHhRnvAVKwC6?=
 =?us-ascii?Q?9vGyWSkSomRIQtPn9lEL3m82BGlvfaTvI7rOBTNE/Lxri2Ujv3suHxsFbCou?=
 =?us-ascii?Q?/Pyq2LL3dgTOnDb1GOsGxGf/zJUPJ279HHe9+1TomY9Sh4QTaAIsXPdDkpPl?=
 =?us-ascii?Q?F++eZBsAScpBZzHNJ6wfRJnp1gTeShkGgSXEqjN2PakaOyd3+/bHAwzx1VY+?=
 =?us-ascii?Q?EJBeDrFHTaoe6JXSvQDbQB4b8nhxQggrV/MleP0BS8NHCcqYsoBJ+eKHgSTn?=
 =?us-ascii?Q?i36CiwJ45d+Ipz0OxoD2mmz4fQwdsGLGlLjGe5iWuRnzYfO8+f27QBUvZ02N?=
 =?us-ascii?Q?v+iVGrIEqQPNx7zG5rHJTdS4PTDPXZS+/JoZN6QjpUrYIo4dLOLchldx5bMh?=
 =?us-ascii?Q?ZXZs+PfPJbOBZQ9LVnTTvev3U/e/2yrMAhzeBhjjeP0Qd95rRnfvj+EWdO2u?=
 =?us-ascii?Q?EV8NM1vNJGSvu0BFGnaiUPFbzz/49Ps2FRburIkStrcIOOLBuG5SrgisQCT/?=
 =?us-ascii?Q?Fp+34QIvrlGtJeO1X6K76a6YaOqlqpJAXYwC+lJXFrwPeRaPBD/ks4VpCdZr?=
 =?us-ascii?Q?JNJbl9eOQHnlvovZdD/ynb/ZOQ++uSs5bgG57eJHooHg6EfGDW9vwTyiwR1A?=
 =?us-ascii?Q?vS21+vfKGb7F4BkBUVpDrTU7hwIu1MBqIeOa8Pv/DenwbgZQ+wLs0PGHu62b?=
 =?us-ascii?Q?JW3iycZXqRGsHHGq5+r40JNZCrY3Hok93uuR2RQqEY7CHmdAm50cF2GSO2J2?=
 =?us-ascii?Q?SDJAshWGPSS+sdl8T2jOXbJ/f/G8bYeErQAzWT+WQ/JN6xna7C6Vy+FPdwsA?=
 =?us-ascii?Q?FAekEI3sL97NgBJqBsL5RKEZwNogVH7WwVm8yJ9m5k0iX+Tf9/oseYR+bxxF?=
 =?us-ascii?Q?+2WsIPNYwr/RFar5dj6VEJm9rnb4yBN9ko1l5qz6SK8lMFO/JzK9xRfmIWmq?=
 =?us-ascii?Q?ZSCIHA/It+ANJuLIMHi0YW97GWcGSuBWTm9B97WrXa8obtMmuHifvbtlIu/c?=
 =?us-ascii?Q?bzT0OB/YC4KpULRc6x4h4jt/TvrPTqs5r6RXXcLtselMw13vbocxQgGKPP7i?=
 =?us-ascii?Q?+A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0abda11c-478b-495b-ea10-08dc62f755e5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 18:09:22.0379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ly61r+f8fsTcj8Vm2rWAIEqQmALaMnOzoxe017up0gNFlDowZ0ymlL4z8LM+UZW4BHwX3ch17OPmF32Ak1GiaoR0XxhP5AHewLkk6BnV8WA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6996
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

On Fri, Apr 19, 2024 at 01:13:43PM GMT, Vinay Belgaumkar wrote:
>This WA requires us to limit media GT frequency requests to a certain
>cap value during driver load as well as after driver unload. Freq limits
>are restored after driver load completes, so perf will not be
>affected during normal operations.
>
>Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>---
> drivers/gpu/drm/xe/xe_device.c |  6 +++++
> drivers/gpu/drm/xe/xe_gsc.c    |  8 +++++++
> drivers/gpu/drm/xe/xe_guc_pc.c | 40 ++++++++++++++++++++++++++++++++--
> drivers/gpu/drm/xe/xe_guc_pc.h |  3 +++
> 4 files changed, 55 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index d85a2ba0a057..e29c152a6c4e 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -30,6 +30,7 @@
> #include "xe_gsc_proxy.h"
> #include "xe_gt.h"
> #include "xe_gt_mcr.h"
>+#include "xe_guc_pc.h"
> #include "xe_hwmon.h"
> #include "xe_irq.h"
> #include "xe_memirq.h"
>@@ -336,6 +337,7 @@ static void xe_driver_flr(struct xe_device *xe)
> {
> 	const unsigned int flr_timeout = 3 * MICRO; /* specs recommend a 3s wait */
> 	struct xe_gt *gt = xe_root_mmio_gt(xe);
>+	struct xe_guc_pc *pc = &gt->uc.guc.pc;
> 	int ret;
>
> 	if (xe_mmio_read32(gt, GU_CNTL_PROTECTED) & DRIVERINT_FLR_DIS) {
>@@ -343,6 +345,10 @@ static void xe_driver_flr(struct xe_device *xe)
> 		return;
> 	}
>
>+	/* Set requested freq to mert_freq_cap before FLR */
>+	if (xe_guc_pc_needs_wa_22019338487(pc))
>+		pc_set_cur_freq(pc, min(xe_guc_pc_mert_freq_cap(pc), pc->rpe_freq));
>+
> 	drm_dbg(&xe->drm, "Triggering Driver-FLR\n");
>
> 	/*
>diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
>index 60202b903687..556e73fca813 100644
>--- a/drivers/gpu/drm/xe/xe_gsc.c
>+++ b/drivers/gpu/drm/xe/xe_gsc.c
>@@ -19,6 +19,7 @@
> #include "xe_gt.h"
> #include "xe_gt_mcr.h"
> #include "xe_gt_printk.h"
>+#include "xe_guc_pc.h"
> #include "xe_huc.h"
> #include "xe_map.h"
> #include "xe_mmio.h"
>@@ -339,6 +340,7 @@ static void gsc_work(struct work_struct *work)
> 	struct xe_gsc *gsc = container_of(work, typeof(*gsc), work);
> 	struct xe_gt *gt = gsc_to_gt(gsc);
> 	struct xe_device *xe = gt_to_xe(gt);
>+	struct xe_guc_pc *pc = &gt->uc.guc.pc;
> 	u32 actions;
> 	int ret;
>
>@@ -367,6 +369,12 @@ static void gsc_work(struct work_struct *work)
> 	if (actions & GSC_ACTION_SW_PROXY)
> 		xe_gsc_proxy_request_handler(gsc);
>
>+	/* Revert the min/max freq limits as we're done with GSC/driver load */
>+	if (xe_guc_pc_needs_wa_22019338487(pc)) {
>+		xe_guc_pc_set_max_freq(pc, pc->rp0_freq);
>+		xe_guc_pc_set_min_freq(pc, pc->rpe_freq);
>+	}
>+
> out:
> 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
> 	xe_pm_runtime_put(xe);
>diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>index 521ae24f2314..7f82b6c2ad3c 100644
>--- a/drivers/gpu/drm/xe/xe_guc_pc.c
>+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>@@ -40,6 +40,8 @@
> #define GT_FREQUENCY_MULTIPLIER	50
> #define GT_FREQUENCY_SCALER	3
>
>+#define LNL_MERT_FREQ_CAP	800
>+
> /**
>  * DOC: GuC Power Conservation (PC)
>  *
>@@ -237,7 +239,7 @@ static void pc_set_manual_rp_ctrl(struct xe_guc_pc *pc, bool enable)
> 	xe_mmio_write32(gt, RP_CONTROL, state);
> }
>
>-static void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
>+void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
> {
> 	struct xe_gt *gt = pc_to_gt(pc);
> 	u32 rpnswreq;
>@@ -673,6 +675,25 @@ static void pc_init_fused_rp_values(struct xe_guc_pc *pc)
> 		tgl_init_fused_rp_values(pc);
> }
>
>+bool xe_guc_pc_needs_wa_22019338487(struct xe_guc_pc *pc)
>+{
>+	struct xe_gt *gt = pc_to_gt(pc);
>+	struct xe_device *xe = gt_to_xe(gt);
>+
>+	if (MEDIA_VERx100(xe) == 2000 && xe_gt_is_media_type(gt))

that's what xe_wa_oob.rules is for. Why are you adding it as a separate
function that won't allow debugfs/.../workarounds to match reality?

Lucas De Marchi

>+		return true;
>+
>+	return false;
>+}
>+
>+u32 xe_guc_pc_mert_freq_cap(struct xe_guc_pc *pc)
>+{
>+	if (MEDIA_VERx100(pc_to_xe(pc)) == 2000)
>+		return LNL_MERT_FREQ_CAP;
>+	else
>+		return 0;
>+}
>+
> /**
>  * xe_guc_pc_init_early - Initialize RPx values and request a higher GT
>  * frequency to allow faster GuC load times
>@@ -684,7 +705,11 @@ void xe_guc_pc_init_early(struct xe_guc_pc *pc)
>
> 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
> 	pc_init_fused_rp_values(pc);
>-	pc_set_cur_freq(pc, pc->rp0_freq);
>+
>+	if (xe_guc_pc_needs_wa_22019338487(pc))
>+		pc_set_cur_freq(pc, min(xe_guc_pc_mert_freq_cap(pc), pc->rp0_freq));
>+	else
>+		pc_set_cur_freq(pc, pc->rp0_freq);
> }
>
> static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
>@@ -715,6 +740,17 @@ static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
> 	if (pc_get_min_freq(pc) > pc->rp0_freq)
> 		ret = pc_set_min_freq(pc, pc->rp0_freq);
>
>+	if ((!ret) && xe_guc_pc_needs_wa_22019338487(pc)) {
>+		/*
>+		 * Setting min to RPn disables use of efficient freq
>+		 * which could otherwise interfere with this WA for media GT.
>+		 * We will also bind max to MERT_FREQ_CAP until driver loads.
>+		 */
>+		ret = pc_set_min_freq(pc, pc->rpn_freq);
>+		if (!ret)
>+			ret = pc_set_max_freq(pc, min(pc->rp0_freq, xe_guc_pc_mert_freq_cap(pc)));
>+	}
>+
> out:
> 	return ret;
> }
>diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
>index d3680d89490e..25fe693c7ee3 100644
>--- a/drivers/gpu/drm/xe/xe_guc_pc.h
>+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
>@@ -27,4 +27,7 @@ enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
> u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
> u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
> void xe_guc_pc_init_early(struct xe_guc_pc *pc);
>+void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq);
>+bool xe_guc_pc_needs_wa_22019338487(struct xe_guc_pc *pc);
>+u32 xe_guc_pc_mert_freq_cap(struct xe_guc_pc *pc);
> #endif /* _XE_GUC_PC_H_ */
>-- 
>2.38.1
>
