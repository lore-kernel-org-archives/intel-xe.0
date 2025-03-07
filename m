Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA061C28B28
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 22:15:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED7310E1C7;
	Fri,  7 Mar 2025 22:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NgJFzwKh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E41410E1C7
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 22:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741385710; x=1772921710;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=53M5dhTBpWznMIOlycszvm9uQtmiN0ljt+VOOLapq5Q=;
 b=NgJFzwKhej9vDa+PSvX1wJxt1Z5J6euZ5jTuDdk/m0w3ruAV8QxZBk+A
 R17UMBbVedUUUGQKxogl9cTPJfF8Kt4R6i1KgmCQOzYZC6Su/VZrYCcdt
 HxsmCpXUp7lDXJdWBcCX0d+xDc/jeRhHWMWwdduds/hTt9VvMq8fAMhnq
 9rXl97DTAzZp2ScTCCiBG6XhsSCRj0pVmbNfmYFIF9hlD57r8dP3ZfCov
 CG0NpFzBxlB2pgagsbx38/N77Bjc6epXE67bEZ0hAlJo76wYGuEScd2Q+
 OF5y79/vwVMiSHroY07/9xb8/x3gATq6ZS6+u7pxtSKqU9wUQCFOEq2ip Q==;
X-CSE-ConnectionGUID: oHh6s+6vTWqROR1WxXLW/w==
X-CSE-MsgGUID: mmHpln9ARzuseTkX0AA7cA==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="41611183"
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; d="scan'208";a="41611183"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 14:15:10 -0800
X-CSE-ConnectionGUID: ii0tqgYJSmqNk4Di5kNbOA==
X-CSE-MsgGUID: ZKyrtaUISxemd1k4ybQaiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; d="scan'208";a="119186856"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 14:15:09 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 7 Mar 2025 14:15:09 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 7 Mar 2025 14:15:09 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Mar 2025 14:15:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hyp9le3UI/nbthxxwqb01yDOA7eJycPKNmsnxtZl73m3IBR+9qMqVeoNWgJuN+JIT1eWtnSmQ0y3OcYHnHcr6U4VuNbNC3HiFKL0f1PA1VKJk2Of/6TFEtUH7n9Q21V1XX/DG2Ycia2kuB8mZA7GmharXQTgx0rpQRqF+maalgXvqW9YIJDDWJF8Lr4qjZX6aUeKVM7CW9EHN6mUivBh1xjTnZ/n0pdIIW3LVJky1vuTu2vfoqxaohDwEz1Ab96qbZ34ehqKivrVj+CeTmOw2zDT0jJkKS7savtNDScIDxbkM2whmHq4auUAFy7wvgzudZ+NNxvT4jf6XaRX+tblMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5dfNamBSwUVsC6kMmbLj0fn0lpiib2i2ZwFmkU92LT8=;
 b=p7Ok6349CIC/EDSv11PkvWyY7H1ZrQbpJxwTJzqnaYbNY8TX7KhfFSySCHLAO6C4Xy/PFLYv25k9qowXADADQ4DSq2+c8EXCj9G3H9ldJ1bn3ux4xcEPc/4XbDc4kQKbtODFhHAtdMhe4gpEpQux9yhd0mZ8pUWr54eUUFayB0TxvPKVemHPDvcWAmS8bERMXflBLQUo/+pxtR3zbc6Yh/uDWLTnzWOyEuhxsomhbB47Qzuy727SPeOGQ6lr/TVILAVWlUZO31Tm4c0LLju0EnSkTbFMJ/BdDFBwrJPGH22/z+FF/2I2Xm5f8Yz1AkXrhJeSxxY/36AmTWgu/ceRJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB4831.namprd11.prod.outlook.com (2603:10b6:a03:2d2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.22; Fri, 7 Mar
 2025 22:15:06 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 22:15:06 +0000
Date: Fri, 7 Mar 2025 16:15:01 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Karthik Poosa <karthik.poosa@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/pm: Temporarily disable D3Cold on BMG
Message-ID: <vvxsj5qz5dp2hwpizgduejrvvzqlz4bvjlaljuezpqarjmgvwk@bxnbmh6quo3r>
References: <20250306213615.1004502-1-rodrigo.vivi@intel.com>
 <20250306213615.1004502-2-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250306213615.1004502-2-rodrigo.vivi@intel.com>
X-ClientProxiedBy: MW4PR03CA0081.namprd03.prod.outlook.com
 (2603:10b6:303:b6::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB4831:EE_
X-MS-Office365-Filtering-Correlation-Id: b7289e3c-d497-4aaf-319c-08dd5dc5843f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vEwSoPfVdNzdbxnOi7eS1aqzPrDN5HbDXhBjR+jTsuicC21NR4tks3pM6tDQ?=
 =?us-ascii?Q?wO9cthzbLtRIP2Gh9n878Lw+54i8BP3BF44Te9Qj+XnrB+HH8HkQI0DzE1A8?=
 =?us-ascii?Q?m6OmHJkJ+zjSuHmMbxDjLVls1DLkIV/2qICux4OADrryY+VBBVoSSI48MGzx?=
 =?us-ascii?Q?OAQXp20YxJC8cjY/PTEEFm6zq2Pfydzo5df6Oq02+Nfg5aKodC7lwmLyUQup?=
 =?us-ascii?Q?+TDtbZhxJSHjEPBOXUzvt9G6u9MS3kNZYVEUD1MBzXzvhxfqmgFuCinJkjVd?=
 =?us-ascii?Q?KyP+qjEBVB8rJ0rEnhGNWeTIvEOz3U6Q7W1B3LKrYF+m0oYXk9ege3NUxkjR?=
 =?us-ascii?Q?tdxpEYy0B9S+ubP0ZnEw46rz+DSac6JZa872hfyWA9YvXOhpKzaBm23wu/fK?=
 =?us-ascii?Q?8fGQ4iUt+Gl20uFhp0hhRwh/AgzcfydHUDVOo76tvB1BSmsPFeIvJjpCdIwC?=
 =?us-ascii?Q?7m8bYPzP9SgsucLrPOmWDYuUGQRab1TG+jIFBtUEj+DaWsDqUpL0h8RSh9zZ?=
 =?us-ascii?Q?6qvDMf8FcCS5/8n/5HWLZeIgV0dhGgYKQvIDgRPnO1jUKZslBcpWsfMo2+5P?=
 =?us-ascii?Q?2/Q1ERGWbmhc0s5tfuRT7HhRsIkVF0tcoBNePgWpkoN1YGC65J3cGG/wZJrM?=
 =?us-ascii?Q?zzgywpdndVfTxbgt47eNFSlY4Lji4K+FZsNknmcc0DN9pDMMe2fQiFZ+zIxg?=
 =?us-ascii?Q?C969zBNu4moRi/5cpiYvKUTxl3awzRtMvZXROLgdjWt7KgpndnD8d7Z7xMiv?=
 =?us-ascii?Q?iR6UxUjsgtsVuZmzmuZiYq2SANjGyZfKJ8e0ophgZ7+8S22QXMbqyhVqCk5G?=
 =?us-ascii?Q?F+mxIqPwAowbkKkpDtFk/3QUTkLAKNIY1WnkMlKCWkdeSuI+DWb8W0bOIG8k?=
 =?us-ascii?Q?hhAaLcVRk+ZWJqEtFxUDZFGe1NK+3h6ZrTkbLhFYzzV0jzdjNOcQES82zrZQ?=
 =?us-ascii?Q?fqV4LfZ0MF4ePgKIEZ/LQocHZKlzkkj72pYIp4QjEp+ySDhX8lWuLdfQXzks?=
 =?us-ascii?Q?YQJt8YKoaFS8Pr4G1k6bTiJbLGQorFlHZGfXq5DI5JEIFU28I+8ksOp0+Sob?=
 =?us-ascii?Q?uJ9nfA90/pcIrybXKlYYeLNzrW6Yt96KyLkPEuM/SuekHXmlANzMYQc/67xd?=
 =?us-ascii?Q?3gLIwYobu7lUTsVEkbwTbQ/5Ef3eq34vISMDPOoLj1kQCvk3gZ+YZBxZBaBX?=
 =?us-ascii?Q?AMFJaKSVv/mw2Yk/6fFGq4enF0ugs51GMpxojiwh49yYdiyAwkBxP/EWu4PL?=
 =?us-ascii?Q?pnLhbvTpLYhIHHPJ2dwE2B3Nv8uIbtqeLV26F0bQlzjl8hrMvyYcg63gA6LB?=
 =?us-ascii?Q?fIuEns4ew1OQwy4qQjxXHOIaNs5nNdiRRO2C2JOxaZBcJA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hP5dYhjtKUwsqaLWyxam7MgTU0SvGXXPqS1Jo/dSoR/iAhyaUozjc5QyhEqt?=
 =?us-ascii?Q?7i3nlv8z5IIMQXrShUXZ8ghz/BPHaUUXZ0M2Oxv6/ksHT++D31ooerjGgVc+?=
 =?us-ascii?Q?U8RfriIPENbeGE1Seofl8Y6ZQ7kt5vzpPKfDi8N7xexKBu2v4wA4X7Uttrx1?=
 =?us-ascii?Q?1exkqgyQJD+foOg7p+vGeuPkbGXzHmBqdknmPm4gG5ZAUbs8OjpMMajtrErz?=
 =?us-ascii?Q?hzRueppdBfZDTmWu3bdB5j7bqRbe9LdEbSudiPmLOFxXVJ7XgsATKcS5VM0c?=
 =?us-ascii?Q?jV35cqSLbxz2zff4XtiS/lCFyYYZiGkJV8Zo63erh42moCAj/oHFV3T+MZh/?=
 =?us-ascii?Q?yWQJEntJhHlAMAL0HEmIOcfTuKd/oqggS4Uc5rdWjJ4GabDAh89mThNzCip0?=
 =?us-ascii?Q?QafYrhiFF3cd7ORHW7OrKescrWXRgA8lyidQ3McCwZNNToBIlat/oc+3/13B?=
 =?us-ascii?Q?oIs2u+yBvLjKzPUA8tk574V8YZBzgG7YmA7864RRKxiLje9s/zLkbBQTrVcW?=
 =?us-ascii?Q?odRbDohGTJ3NzF9ZkHvxU3uyS4hFnrFAAWgp4BpYvfEniimwVHuM4bLkPzSJ?=
 =?us-ascii?Q?4ChYKg55fHdsYZ4aK3Vqe6t+SfZ66Q/sAHj+Aw/RtbGbprWu5YqN2clV6Uhj?=
 =?us-ascii?Q?4ECE7gTIb2FN4Lg8fTbaMdGJ/aWFFoW/odqBYJnz6rNxocgCx5pOOpxHiG4V?=
 =?us-ascii?Q?bOe6hyErzUb2j/K7l/k1nd16jiFyoBKJW50RZ0ifF/uir1DncZS/PrH+1Rpw?=
 =?us-ascii?Q?V3hMrvttXyRhNjiLtHE86UHLVzdcEfAqk70ywj853+/uQZPQfHEqK8ZjBpaU?=
 =?us-ascii?Q?pPQZ1T7l0cWV+HXjdH/jPfYiSxvhGbYv6AWQiyehwvOEBYCmCEjCvg64F6c8?=
 =?us-ascii?Q?5gxYedaac9HMKzUHSkvIl5IVlIfdJwozdLPxQoohMhmqf6NqbHEDRZ7H3WQX?=
 =?us-ascii?Q?x6ivsap0dDH24c8OmwwqKDD8VBhH6S3WICx4C9SjNsn91OQvBXBPHr8mqCT0?=
 =?us-ascii?Q?Ls9m6IkOMQF+cgS8RUQakz6+2jrtoNNCBQZt83ZWoJi2dlRTZ9z4ABgtg/Ox?=
 =?us-ascii?Q?EbF/2Bp6m5/3YCAbhFus3VE93lMA7S47goZSW6/YlZj1edXX+DsFPIFt8j86?=
 =?us-ascii?Q?SV4oqQHM4GAVKpaF6Pj//b1lujl7usbEBtUJH9st6TZI92O5UYYALtuiqo+y?=
 =?us-ascii?Q?93kaT/dFpWVTolBLbCk2di432VCcyU+gh2Lcsf1Cwh/1evdsvGloGqZZtLPO?=
 =?us-ascii?Q?hF1ohz9MAjuPFVVU/hNUGjZkeeT7ml8cPdxAu02/ytFatuK6/gHQDKYwI5t9?=
 =?us-ascii?Q?OSca6hxaRvw/Yw5uSDKdoJpIaaU270scXH3da0GB3jnV3J/LcZ1v+RmuvF6/?=
 =?us-ascii?Q?sMY+KBem7Nf57vXFZDNZOyZ1QClbB+FBMBiR8tMnaYq2edMbEnyyWBDZ+9Uj?=
 =?us-ascii?Q?OeBAkZUmrv41Z7wDHVxZ2QAguj0/nViMk4zs58rhLV/+8mxz+hFiP6vg06mS?=
 =?us-ascii?Q?8s4haLT4EvqQPDAiji/IDYSbTuTkDlamgTaP2OKKcaRntqz9yL03rAzbbraQ?=
 =?us-ascii?Q?f38Tx113/jVhFHsZ0UCNkcLSOyT2WoCO4t47ffMIVGfRU7FfkvODi5AQbxmY?=
 =?us-ascii?Q?kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7289e3c-d497-4aaf-319c-08dd5dc5843f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 22:15:06.7865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KqTXmz1DMDcuNLK3HJSjmOcuHVGSTpDhjoelqB2Rc8lmSY0V7IAngx98OfrRRcRtL/Fl5q5oPM80N7RMCB4s11vGomdECTDyB0+Jd8Z16Sw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4831
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

On Thu, Mar 06, 2025 at 04:36:14PM -0500, Rodrigo Vivi wrote:
>Currently, many instability cases related to D3Cold -> D0 transition
>on BMG are under investigation. Among them some bad cases where
>the device is lost after 1 to 3 transitions from D3Cold to D0
>on the runtime pm, with pcieport upstream bridge port link retrain
>failure.
>
>In other cases, it works fine, but with some sudden random memory
>corruptions after D3cold, that could be 0xffff missed ack on GT
>forcewake or GuC reload related failures.
>
>In some other cases though, D3Cold -> D0 works pretty reliably.
>It looks like it is a combination of GPU cards and Host boards at
>this point. So, there is no possible/available quirk at this time.
>
>This patch disables the D3Cold by default on BMG by reducing the
>vram_d3cold_threshold to 0. Users and developers who wants to enable
>it are still able to via
>$ echo 300 > /sys/bus/pci/devices/<addr>/vram_d3cold_threshold
>
>Fixes: 3adcf970dc7e ("drm/xe/bmg: Drop force_probe requirement")
>Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4037
>Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4395
>Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4396

are these Link: or should we use Closes: ?

>Cc: Karthik Poosa <karthik.poosa@intel.com>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
> drivers/gpu/drm/xe/xe_pm.c | 7 ++++++-
> 1 file changed, 6 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>index 12200be7b43d..a9f61a5fc971 100644
>--- a/drivers/gpu/drm/xe/xe_pm.c
>+++ b/drivers/gpu/drm/xe/xe_pm.c
>@@ -287,6 +287,7 @@ ALLOW_ERROR_INJECTION(xe_pm_init_early, ERRNO); /* See xe_pci_probe() */
>  */
> int xe_pm_init(struct xe_device *xe)
> {
>+	u32 vram_threshold;
> 	int err;
>
> 	/* For now suspend/resume is only allowed with GuC */
>@@ -300,7 +301,11 @@ int xe_pm_init(struct xe_device *xe)
> 		if (err)
> 			return err;
>
>-		err = xe_pm_set_vram_threshold(xe, DEFAULT_VRAM_THRESHOLD);
>+		/* FIXME: D3Cold temporarily disabled by default on BMG */
>+		vram_threshold = xe->info.platform == XE_BATTLEMAGE ? 0 :
>+				DEFAULT_VRAM_THRESHOLD;

we usually have to extract this for different values per platform, so
maybe just go ahead and do that?

	u32 vram_threshold_value(struct xe_device *xe)
	{
		/* FIXME: D3Cold temporarily disabled by default on BMG */
		if (xe->info.platform == XE_BATTLEMAGE)
			return 0;

		return DEFAULT_VRAM_THRESHOLD;
	}

	xe_pm_init()
	{
		...
		vram_threshold = vram_threshold_value(xe);
	}

Then the second patch simply removes the first 3 lines of that function.
Anyway, I agree with the approach to get things working. We can try
enabling d3cold again when we understand what's going on.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


for both patches.

thanks
Lucas De Marchi

>+
>+		err = xe_pm_set_vram_threshold(xe, vram_threshold);
> 		if (err)
> 			return err;
> 	}
>-- 
>2.48.1
>
