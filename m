Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6CF7C54E49
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 15:10:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 694A010E911;
	Tue, 27 Feb 2024 15:10:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FMtmDbZc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 055CA10E907
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Feb 2024 15:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709046626; x=1740582626;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Yj5wPMIUyjBXbYv/VxwRnm8/AJNjllqI/IBTS9hiv6k=;
 b=FMtmDbZc83uV7tPv5e0NBA7jQhfgjTo/Oa2LcPIfYcCJTXmtl44TBOUC
 1JgC+DICURgsGki1xrEkP9torX+gF4V6YXTmLN+bmALPbCIS2VM3nZP6b
 yRuUXM+H7Zw1D0jyogzL0T+DAx1ro5RNI0xyCj/dYYOSRHV6DQs4K7oZG
 raZFM20Q4omjJFLK2jg7CcysaozZV16Sur03in/ye78x0nDPpORxv53OL
 g/GkvjUfOOfUn3TDwx+X1hGCQqjZ2R+KQR1zMtGX3rtAdMmVv1aVyHvKL
 VOPBO8QOyKSixhjiy5ii6kGbVvaOUUyEU2PWUSVDl8QR4feYm6MQJ6imR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3550436"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="3550436"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 07:10:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="7504909"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Feb 2024 07:10:23 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Feb 2024 07:10:21 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Feb 2024 07:10:21 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 27 Feb 2024 07:10:21 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 27 Feb 2024 07:10:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AevyKJHBjBFZzyIgNpYHm+4HOaLuCR/CWckVAgkrq+Kc3QtkYGLEAHi5+Glp36WbrI+nDOpLpZij81wJe/VawrDJCzM5cpNVPliG3Q9H86QtYsers4kFBmik+oa0/oKZ/BweEVcjXF01M7xIGSykp6iRxcRN0odONqAmy1V05Yx0Ht96HQNROkVGZvCmhQWsRdSFtjeIXTtXvG1G1QcvIy9/rg6mRFC0KhJGAlmb3f6qPRtdqiUTXBzRny5HkXLcEQIyNzsBMsK9vaga0lDOgE+ZUe6XBcrn+dqk+2uFpio7vsS4KaonLJe37dmEitBalVC5xj+JdEdprvEBjymlyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bFzu4AuKQNSlFkg+w1/HvGFtWu0fQ6RUsIopwDltLfA=;
 b=mEnudtNeuYr2iSq0i55xYcW/a93SLT/K97k3uJ751XwnLrHQfnKSB9wKAQGscU5zgBncYj6TfsktRY1m0xNya4LZef3w/heYKTPwfwLB7Ibxt/YqiPuLV0C2xbPuSjiUipGKTOpgAVL6IrJQrh2IOFdnOJi9GVaOuVG4HSodSKex76PVXmdhK2VsXeOgar1epFpKSxnP2Vx5jpkf+KpeNNJmzwIwvbETvexARkc6fP6Y3Zuw68znAZMUOuLQ5f+G/tOu6T+/2cyp/sb4cYyobE4ixyVkDrdMYEej6OQ+KeNJfkENqx31fQJKPZXROz49bb0Icsd5DoAqhnSlfatnXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA0PR11MB4608.namprd11.prod.outlook.com (2603:10b6:806:94::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.23; Tue, 27 Feb
 2024 15:10:19 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01%7]) with mapi id 15.20.7339.024; Tue, 27 Feb 2024
 15:10:19 +0000
Date: Tue, 27 Feb 2024 09:10:17 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe/xe2_lpm: Rename media descriptor to media_xe2_lpm
Message-ID: <sht5w2dg2etoee72cmu3vkix3nqnkjmtun4yy6zks3hnxfn6q2@eqepllzat37h>
References: <20240227143209.346005-1-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240227143209.346005-1-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: BYAPR04CA0030.namprd04.prod.outlook.com
 (2603:10b6:a03:40::43) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA0PR11MB4608:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fe21650-9781-4fa6-e24b-08dc37a6363a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tykSKAxQIM4WTgXUiHWBgfCG6kf361UbqpdohAMBdmdBDI+SOGMkGXIZldFZpsh03a/HP4XF6PtwFjgEqBKpkthPr1z3o4fzSyvaI8pPYo3hqOZHzonGi539whgXfso/SD8qNonmw/nGoPz9H/GAzKAJxzQeIqrGafas812pBI4Zl13yXRSwcErKkuEwQSeTNwtgLD6mnz4k5jt1g9FSFtYJc6E2G08tWpUf/NZB9gFTy1zmbvtgt9RsX6w3kNhLWAvKVql1nwTA2LAdHgxRx0+e3cIdLkJbHgdicJ9wNZvPY/4447SdS98ilM196RMWhwJjSz9bRxtmL79TdV2BtKpyDeOrZUaAnmddNtxkkG0uQGXO/7g7va9vZR/ElMoYxzowyAa0WhDNr8retqnx96pVM55+Tw7emg/Ll9BfWEnjQ0g/QYP+3qqx5CaqEtWvn2g7vB4QS4RoX35c7FrT9TLhfGQMf+8OGho/Z2tFujI47upLmKb1bDJCHS1omGPfeaBH5kMbkBo6z0FkPYReLkLIvAjN6sUQZ0eoyJ9H7lCX8CiUbIvEORMSvd6+DG5GJvH4QsZQQpf76YxCSHdY2Fm3NRTmPOr4dskRAT1qMR2J2JdS0H5sAD+NhX7EbuK/9oZjvHeWCYKZ7J8oCh8wVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D8cJUdy7Vd0GN+Uulzq/Uz5uLCzkqgrAtZzZ29AXDkgMRhvR6tZo4TOYK106?=
 =?us-ascii?Q?zr+JtHBbjIeeou9rJo5S7m5dckCqpDjkzzsv1yIzfmhDpbG1kbWyXSwTRGql?=
 =?us-ascii?Q?dhkUi666HK8JmfE3kXzrxq3Ijs1WGovsS46NLdfDDRS3RSKysFoQvLUeZnkY?=
 =?us-ascii?Q?Aw8lPDNTP9BF28tRHge0eEtmBXWrklzmxlQBBSYPNJn2obxqychh2VJc+9iu?=
 =?us-ascii?Q?Z7J2c+wl4M02V6Airb+D+HVkzKJmWv9ksecMsaR7DohEFgoqMnK9sTDRYFGd?=
 =?us-ascii?Q?sqMIvTDruCKvJi2Xe+4DnPiypmtUfKF+bh2sqFV2RQBUM2q6KXsiVC03phiU?=
 =?us-ascii?Q?AXSVbd4iFoQAsQ28qfiHx+EbJsuPOaEjSIh3kF1dzvqD95I9hZ2EXFuY5bIi?=
 =?us-ascii?Q?vuNbu9y3ZeWZmRG4Rrjy74Z7aF59Re2kAZDUBcBlFqg4zvoT5FObnyuJ75nl?=
 =?us-ascii?Q?1QtetZSfsyMwAiz5ColwHGi9dSjzwY5v3F91TIgTnW/bhsmhrdMexQnEXXFu?=
 =?us-ascii?Q?vR4M36jsC4gDjN1qMF56iDKg8btEFCVOh8ye1oS/JjvIckTy2cH933q+SWT8?=
 =?us-ascii?Q?xqpgvHW2M+7AWgQ0PGNaCKo2m94qfZKT2ltz2EXsYIPHs4it0azkgK4TQqXa?=
 =?us-ascii?Q?wOUIbZ7RcA87LfLGX6rVBFVgbqAJ3zI826I1I62rZ3u3PwRag7JwXQviyCIp?=
 =?us-ascii?Q?2Th+a5GZBs4ttKpMHDDTfV5+fAewNl0SyERlk483mzPFceMz9t+PUQtzFJzT?=
 =?us-ascii?Q?9rtTK9xGJofTyHKUGAp4rocETm3OFd1zWbgTxBCs+ecrEQRsIU37cYCZACzu?=
 =?us-ascii?Q?Er+ZMNngyJbzdHuHA9dKGXfpbpwm9j7No5CItMTwMP/+OFszMrBiBiodCBWd?=
 =?us-ascii?Q?pwyv8zkuJ1s85kQPeT5OJ+Ceo+nB7P7kMvAbIYQPhCjR7GYzmOJ0tO29WUsn?=
 =?us-ascii?Q?B+IkizkPV5qxdbFwszkZZ/YHYFftkdXxHNgRah8oKdobIc/lFBri3A0Vhw08?=
 =?us-ascii?Q?VC/tu69c/20jMf36HtwNE/2mPgDZ46v+YoNSjdMy2GLdFZyh/tphj7gWblwM?=
 =?us-ascii?Q?CsUMmQ8OVuWTYruNway4lmE2HhLkGw0/dIXhl0GZdEPP7jD5L1SetQoBuGI+?=
 =?us-ascii?Q?tab+yR5EQIKdx048N4V7p0K6abmp7Obp8TVBAoxYtYVNWRy+XPntCbs5sGe/?=
 =?us-ascii?Q?g/ARamHNLYA/ZJdPOB5u2AkzpdJ7PCFO3FGzW4uzSx5QGt3bgm+5sp4xm59b?=
 =?us-ascii?Q?29Q+fmNXlAX+jBB91gyia5gdjtRxAOI0NRRceu6D6tunwsIorrAJkw8LCPpv?=
 =?us-ascii?Q?50ZIKIbsDU9nk3mmrY3KCYUz5xJ1gipxgpRn51UuakqjGNMjkh/4Ia1iJwnU?=
 =?us-ascii?Q?RxjyeXViRxnTC2SfKg8hN3D1/QvDCQ6PTd5wwmYRbPHVvb5wAIQ0QZtBGw3Q?=
 =?us-ascii?Q?+CV2Wvndl5FBFG0QP0y/SGR/S4ga4sF+VcUVAxT+0WpeylxlC0+O1jdZci1h?=
 =?us-ascii?Q?Z+8Lwo1WiuTaa4e0ZUalvXhtLIdfsXXqaSdD4/kh4P44nEM9UVUR5JMofS+o?=
 =?us-ascii?Q?4m0fppWUtkA1FzqTfJQIDI5eVEUOwTRTJAyy2GlMF/Rr4sAKx+6C4JwEjIic?=
 =?us-ascii?Q?UA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fe21650-9781-4fa6-e24b-08dc37a6363a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 15:10:19.5819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JP6BMafrRrX1P309z/dOrcUuWQb6GwDFJcAtJul8sKf6LIEXNXbS892C7duC7U3vgtaW9i55anEgJJCPtiqB9LG7tLakfUkFcYUgYNakPXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4608
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

On Tue, Feb 27, 2024 at 08:02:09PM +0530, Balasubramani Vivekanandan wrote:
>Media descriptor renamed to avoid conflict with future platforms.
>
>Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>---
> drivers/gpu/drm/xe/xe_pci.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 5b5c29761c5d..f2d11543424c 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -206,7 +206,7 @@ static const struct xe_media_desc media_xelpmp = {
> 		BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_GSCCS0)
> };
>
>-static const struct xe_media_desc media_xe2 = {
>+static const struct xe_media_desc media_xe2_lpm = {
> 	.name = "Xe2_LPM",
> 	.hw_engine_mask =
> 		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VECS0), /* TODO: GSC0 */
>@@ -349,7 +349,7 @@ static const struct gmdid_map graphics_ip_map[] = {
> /* Map of GMD_ID values to media IP */
> static const struct gmdid_map media_ip_map[] = {
> 	{ 1300, &media_xelpmp },
>-	{ 2000, &media_xe2 },
>+	{ 2000, &media_xe2_lpm },

why is it media_xelpmp but then media_xe2_lpm with the extra underscore?

Lucas De Marchi

> };
>
> #define INTEL_VGA_DEVICE(id, info) {			\
>-- 
>2.25.1
>
