Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC95C61DA4
	for <intel-xe@archiver.kernel.org>; Wed, 22 Feb 2023 14:53:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D502110E9E6;
	Wed, 22 Feb 2023 14:53:20 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC99210E9E6
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Feb 2023 14:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677077598; x=1708613598;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wev0YIHs3TeB1HhQl4608abHMFh3Z7XnaZkGQKQ5TYA=;
 b=S5JoClWWKoMODlO+ztVbWZT7TwMYGfDlljai7T4jYSYRWSKsYT3sbpUU
 Gg4W8FagRgvET3lE/mgI/jB8VuQYnYd5lIycS8fU2tvwfWdKB2J5B7Mc9
 RuHtI82P+rIinm2ohGI70GFX/YWZH6q+enGyaNGsKZp80KrGn+oRi19wk
 jD3OAdwq0pRkctWZ0S/lTbnEqjVJd4NAQ28Hk/HRszCB5pCF/CgrWLDMT
 acnwNV4U1fxrq/JB5Qe5Cpej/xmwXSccPACxrWQwgJFXP7Vj+wXCR/mzn
 ab3bpHvjEOPPv1uHsdyvKCyzjEK+7JTgORaB/jWZ2n57JqVcc56vYo73O w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="321080088"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; d="scan'208";a="321080088"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2023 06:53:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="917587029"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; d="scan'208";a="917587029"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 22 Feb 2023 06:53:17 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 22 Feb 2023 06:53:17 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 22 Feb 2023 06:53:17 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 22 Feb 2023 06:53:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fHCbqdif1JX8rfVHI+A4IPk409rpXGH5ZfYM73vJXY/OKdfEl/bRpFJ7AgumdILSjTKFaVo7W7sUIX0zHelrbb4z4q113mcqux6yWwSEtyXm7xas0yf7+n8jFZDzlNTuS+affoDH5AswP8mPknqWAScKi+vOXTtRboB78TfSfA2jERFW7I/Ct74oWe3Yle7SDsisZXFoXJHGkLBz9gcNQVYKEdhE0FtDCz44wbsKN0qfBtWkCi4asK06dv1wWwPpCUOsZFYnw8ziSftfp+IE4hC0ZDZprKpAaclnCs0AcXcDB3aCnXkRUGh0UTMEhuaWDFn8Kc4k+A95jPRCfvMTXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UM9Bm1i2jKoyJ+0mBh9iUnYKAa4sXvvDN6uEf9sTQt4=;
 b=GRBpN/ZkQNq5KNgU3b8y17O/KxQqsD9LZod4NShp1qCz08mnMce7G/zH67sjQO2BiIV3uDfWr9F3kbfX1w/0TjZMgWJS49IXWlg0krLsKU1Bb62rH0uzg7PcwJbtQzY2Rvo4Oo2qWlvU+9zpHzExuVcr1+JzVNmQ01Q+lJEU7Xsgtn6PKdukp/QmQqAey9oS+o7XzxDMDogbjxqQvY7rOhu7S89Bfl8TkfwXjkyaXywGC5y4wkoctpF12iFjw0SCG7odBQ9o9wYQBicHGO7uCHywg3LLUj5HChUG4a7Mj+uO6bucDVcawCCIxFZNfxvvisWeBWVjKGet0EP0hFPAkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB6296.namprd11.prod.outlook.com (2603:10b6:8:94::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Wed, 22 Feb
 2023 14:53:15 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%6]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 14:53:15 +0000
Date: Wed, 22 Feb 2023 06:53:11 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <20230222145311.5pa5nbund4gbtsid@ldmartin-desk2.jf.intel.com>
X-Patchwork-Hint: comment
References: <20230222121845.171417-1-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230222121845.171417-1-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR04CA0389.namprd04.prod.outlook.com
 (2603:10b6:303:81::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB6296:EE_
X-MS-Office365-Filtering-Correlation-Id: 552bf305-6592-46e3-d3e2-08db14e486a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5v6Qsw9cQUg0Kk1WZis91x8Llyl6xIy3v+hnhOb9XIVihV8FDoHvfQpmyH2Z9xlGbDmoQ+JUKIylStsO6puEdA8UPFa4JEjYNlFXGMKNqwnq+hE3dSqv/3H8lg6WqAoTtMBSI2QDdbLC/RCu8w08JxLZSCbTWqoiuMg4kSyCmY1ufqC9CkDVLyPTgjiwcjNWGxRjsqqkbe5+Wv7YfrU61z7XzzWtoEWNfCyMzgtEUe0ISulkApttpP+ihPk7YvZIaPBH76NeGy+UHME4EqlyuzOYTsJpjA2aOR6S/P3ZtVP/rir5sKajPzDfANF7kt/Ml94x4J/JJBzI35yRD2COOzIcswq6/Yqn9W2c8AYHeWZBmDBrXIN4LGUp0KmT4AYY3a6EglP5OUzN/fM9ygmdJjdfRhcfk9wPe+Y0N/NO9vW4trhvj77/Pihd9bRwg7dxjHtudvDoJ0hbvpKX6Q9Cn/adO1B4pl7LqiBS9UaGHHx09EQiQmZLJm2XTHeAPjmNIXg99mopjCgzgrzwFmSokAa9NPllSvW1bYPBEwLG1SfolNzRWjLn20vVFTZW53b05YsBEg+5XyQCdUvhs9cagw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(376002)(366004)(39860400002)(346002)(396003)(451199018)(316002)(83380400001)(6636002)(6506007)(107886003)(478600001)(1076003)(186003)(26005)(6512007)(41300700001)(2906002)(86362001)(8936002)(6862004)(4326008)(5660300002)(966005)(66476007)(82960400001)(6486002)(66946007)(8676002)(38100700002)(66556008)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LL2ZlcT6YygJ3vzbS3B1L5+TImUo0n6h70yHBVq2qTmfUVfzL2mETYLhDiJd?=
 =?us-ascii?Q?3eRp+wEFJmKy7xVPldFo0lSg3hEm+8gSh9hpFRF1ts/YOfqA5qzhMmeY0tec?=
 =?us-ascii?Q?rqXpuAeGlrff66Ft0yzxtlRLiqCIdZOAgr5EhWrStTLYmohgmVzSOOgmjd4j?=
 =?us-ascii?Q?aiI2f4Z0sPvH6ZXHtIivRIfG/wpMvcLiJj2B58X9ZsHzOxmgGrPidWNLjMLJ?=
 =?us-ascii?Q?JaJFSZi+sjFWJ262ya9KH0TGH4Tbj1upxlm0uGp2CWXt/zYTNVSjSAOJcXrX?=
 =?us-ascii?Q?PZ+DDPivvCreMxILxS1gvBmLmg7wEt7R1A6xle1Y+bUwrt1tqmp7xx4Ei0NQ?=
 =?us-ascii?Q?eJDswB4G5dyVGtQKHQmYY0H9+sCtCr0TZJrSgqZrvJDgKrypUhichvBh6kh2?=
 =?us-ascii?Q?gpqgg4J2neXREe6pGLUcs0dYKq1ZjjfYjr1oD6xB3yJShXT//HHIcDWULqqn?=
 =?us-ascii?Q?zeNjfcbKPYJqwA6JASZ3rXRPNzy5UAiyBgt9pArbFd72pT/X+NXaTeIUVgYb?=
 =?us-ascii?Q?JfD/minYKZ6eOyhQfg/0Zt61WtMz/t1KCrALa2wmjJbnlL1NJS5AZSXz6kr0?=
 =?us-ascii?Q?gjNUyxoBPOcKb+2gLEGp8+vt/o42p1h8DikyhPY01FC2ShLqUW8jtiy+cidU?=
 =?us-ascii?Q?XFr0SQ6gH4MtX5/5niLKJ8dw4zYEczDnAklW/Szb2QaCe7CcxycM6wjWTaks?=
 =?us-ascii?Q?be8oK0Kv9AhBE42Mk1iAt7lWC2e/5ZngolwT03rUf/JG/gVNZ7dRj1A8FZI+?=
 =?us-ascii?Q?RLveN1Jv/hVo1tIXJ67SkmjTbiQ0DsFsYwNxybUAFFLmxRcWwDIMx0SuPS3q?=
 =?us-ascii?Q?1UmXKIlyyAl3vuqxxsfh4ztfuQHcPcL0sIhnidDqRZ4AK80AnK116qnyvuGF?=
 =?us-ascii?Q?241DlpT0QYiiBC7bYIJJmwiUNdPeZaBVafFQ7e+LwMdadDafYqQm9Pi7M6eo?=
 =?us-ascii?Q?zq32cG1DiU6o03vIVM9d2uiMpQlM01BDx5IVG7QYcrFhQkh7sK1caPk7Bzx8?=
 =?us-ascii?Q?92RiB2XEH8tPrTT91Luy8Sw1Knk8rHSFslS78/fOiZjxWmLOKyi37YUbL17N?=
 =?us-ascii?Q?EAlK2nHD61odJfpsTRLp4W6Rz31DtlnvtvrkAySOrK7j3U1+cVIZC/qBlehm?=
 =?us-ascii?Q?DH1umTUEyqHTcNPWUxOMBWXRadFKWqzwNTa0hfyiY6gqcoTk6WZLgL0yqQES?=
 =?us-ascii?Q?CgJXD1uKNPQFY2rjY3FMyGgv7kx/TD/m9NedC9ya3IHDu+iJQm/xmL/8Oq0n?=
 =?us-ascii?Q?OiTH8/8r2G6BuuOCQNuKTUvuj9BIg6UssoA9dOswWv5ez/EgJwzoIlo2h/MS?=
 =?us-ascii?Q?ZeFTNGRsr9WARnIRY4A412vKnw6APRUHXrXoA3BGvsx63yQVgAFnlZ9KpAz8?=
 =?us-ascii?Q?3W/6lIPiORrStPEEhg4ZvMmVP7RdfoXmR8CF5FTvVww+Uf3bjStUDPL1sS3h?=
 =?us-ascii?Q?RO55gjzPpt6EQfxm/cnJe82PxUqJZ1mFDYNJdPwxsTzDqF0zFzFzpGzHq+tM?=
 =?us-ascii?Q?rp++RS3s6HrnDuPOSTP5I88tb3Ean/w04cK34jzF+o0IZ+kn2wiiBf7iLsBa?=
 =?us-ascii?Q?u/t+Y7lC6w66GKESxe2s5OfPpFcs1/zakZdQsoOE7HVHPUehD8NA9aX37LAD?=
 =?us-ascii?Q?XQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 552bf305-6592-46e3-d3e2-08db14e486a2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 14:53:14.9786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EGKXmx7rGZlScN0CCzLD9iweNRvuYUuil0De7Re4i+ivyO+luH+YYPx0cfNXlthDmc+pX5d8EftLMGh9DrzEH8sjw6cJnTuDfXTUQpRY7g4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6296
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe/pm: fix unbalanced ref handling
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Feb 22, 2023 at 12:18:45PM +0000, Matthew Auld wrote:
>In local_pci_probe() the core kernel increments the rpm for the device,
>just before calling into the probe hook. If the driver/device supports
>runtime pm it is then meant to put this ref during probe (like we do in
>xe_pm_runtime_init()). However when removing the device we then also
>need to take the reference back, otherwise the ref that is put in
>pci_device_remove() will be unbalanced when for example unloading the
>driver, leading to warnings like:
>
>    [ 3808.596345] xe 0000:03:00.0: Runtime PM usage count underflow!
>
>Fix this by incrementing the rpm ref when removing the device.
>
>v2:
>  - Improve the terminology in the commit message; s/drop/put/ etc (Lucas & Rodrigo)
>  - Also call pm_runtime_forbid(dev) (Rodrigo)
>
>Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/193
>Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_pci.c | 1 +
> drivers/gpu/drm/xe/xe_pm.c  | 8 ++++++++
> drivers/gpu/drm/xe/xe_pm.h  | 1 +
> 3 files changed, 10 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 25598de3a1fc..85d337cd8fbe 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -441,6 +441,7 @@ static void xe_pci_remove(struct pci_dev *pdev)
> 		return;
>
> 	xe_device_remove(xe);
>+	xe_pm_runtime_fini(xe);
> 	pci_set_drvdata(pdev, NULL);
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>index 44c38e670587..769f380cf1d4 100644
>--- a/drivers/gpu/drm/xe/xe_pm.c
>+++ b/drivers/gpu/drm/xe/xe_pm.c
>@@ -128,6 +128,14 @@ void xe_pm_runtime_init(struct xe_device *xe)
> 	pm_runtime_put_autosuspend(dev);
> }
>
>+void xe_pm_runtime_fini(struct xe_device *xe)
>+{
>+	struct device *dev = xe->drm.dev;
>+
>+	pm_runtime_get_sync(dev);
>+	pm_runtime_forbid(dev);
>+}
>+
> int xe_pm_runtime_suspend(struct xe_device *xe)
> {
> 	struct xe_gt *gt;
>diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
>index b8c5f9558e26..6a885585f653 100644
>--- a/drivers/gpu/drm/xe/xe_pm.h
>+++ b/drivers/gpu/drm/xe/xe_pm.h
>@@ -14,6 +14,7 @@ int xe_pm_suspend(struct xe_device *xe);
> int xe_pm_resume(struct xe_device *xe);
>
> void xe_pm_runtime_init(struct xe_device *xe);
>+void xe_pm_runtime_fini(struct xe_device *xe);
> int xe_pm_runtime_suspend(struct xe_device *xe);
> int xe_pm_runtime_resume(struct xe_device *xe);
> int xe_pm_runtime_get(struct xe_device *xe);
>-- 
>2.39.1
>
