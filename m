Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE9EFA375E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 15:44:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A30110E287;
	Fri, 13 Sep 2024 15:44:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ww0Ejd1S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E11610E287
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Sep 2024 15:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726242239; x=1757778239;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=c87H8X6IDmjIUCou9sx0tqAJJqXcene6QuLjx/meExY=;
 b=Ww0Ejd1Su6SBdavkJOu8rpHQBe88t4sAZf4VZPKrW/hxb/sPzEI65rdQ
 X6fWPD72YV4e3QxwaqgXYgxWCYvkbfaMV5Opi3TeOQXXjooGsbia25QvX
 04C1kM8jO+gEmwX/3deuC0wt5bNR/GgguYIL911C6Dh1o2CIXkUqHRZEg
 3QAtAb5DleuFwvapuT6rwMR60hHVZNIsw4ZPchkMCxlRT3gZ3Q79g0c1q
 vPGVslJyWpeHH3OUWL0GPd52/P8cBdbyAg1u79s3BQUPcoX4VMhje3j6U
 S1Uh0c0V7PEBjfjAthfKDThiRrQY0Zk1FHqWylNB1EwELGIYnO0XZxWOy w==;
X-CSE-ConnectionGUID: a+hSSR2WQIe1ocxoYEVc9Q==
X-CSE-MsgGUID: dsHQRXvnTla1xs6Jzc1BYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="35814626"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; d="scan'208";a="35814626"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 08:43:59 -0700
X-CSE-ConnectionGUID: VS8K1T4CR3ix0uy8MSMAyA==
X-CSE-MsgGUID: KvMzxeYsRvaVVVpETc/UlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; d="scan'208";a="68080966"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Sep 2024 08:43:59 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 13 Sep 2024 08:43:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 13 Sep 2024 08:43:58 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 13 Sep 2024 08:43:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xSGzJwGvV8HuOTFgJeCq1Fb3zc8cA4qkiPEK47l64zXLzEXn+3OHgkV4mv8Xg2Z+82O9cnRVXdgIi8M4ipgOdIV535ZKxQYBEG4Vbw7QXNBA61Yn3YnMvjjbVpnbcrHXQdAMR4UQenkYt+UNYU8C0XLyEyjnGoy6bEHV8+90Wcbrubu+KGsitnGLBNT246GsOizo2YATHZWyG6OU21gAgcHUIOkHPAebDPU4lpzWRDeT1wXOKOO32Nzr+xCSlzmgZ03oyN4uE1bW9v7kubRq8ku9mL6s3UNsWOis+ac8g77R8RvokytsI7ANbAIqEI8kKGiMN0DpSIvXajdiF7GNxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QEqdpK9LvIntAaahJ3VgoOFGsT9NCvpbH4IXsYgryps=;
 b=DM4VLyoz4YYRJ7WAMG15u9ucB4TT0Mn8nt6cxxjgyK5u2G3v5VFhvwZHhyYUYiCGFei4uNp3viVNQtia89M5rtGmgbne6Bp75kz/Q+Z7AUJEqIMiVrvxMGJf5FBhwncX4urGCMf/GPN94aw/xkCOHUKb6onblZtRBcr9Vs9CB/4rVzelR7hDjD1xw8TEBZBg44Cp02xz3gLEx2+FTiIS32eKKo721iZ/bS2/HLgHAq12LANrpeuyJ9iuDBcwhFUAW2Y7i/gZzr2sBYZkmoXKDj4kWdnVmtksdWveFuGQEqTO6gKuGhv3Jw1AySGn6fFDUj6poTrdRRWS9NoSCuBnJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH0PR11MB7168.namprd11.prod.outlook.com (2603:10b6:510:1e9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.20; Fri, 13 Sep
 2024 15:43:56 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Fri, 13 Sep 2024
 15:43:56 +0000
Date: Fri, 13 Sep 2024 11:43:52 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 <rafael@kernel.org>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Restore pci state upon resume
Message-ID: <ZuRduLqXs4za8_PN@intel.com>
References: <20240912190530.435976-1-rodrigo.vivi@intel.com>
 <ZuQbnRfh-wkuMR83@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZuQbnRfh-wkuMR83@intel.com>
X-ClientProxiedBy: MW4PR03CA0332.namprd03.prod.outlook.com
 (2603:10b6:303:dc::7) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH0PR11MB7168:EE_
X-MS-Office365-Filtering-Correlation-Id: 31734351-19cf-42ac-1be1-08dcd40ae072
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Ts+zbN6F0yzvt44zDZkWIQoa7qB6sb4d/h87Dar1f1bXnBgGOT3uUHTJcX?=
 =?iso-8859-1?Q?VCjOuhUQTZzSQ1Jg8axpUYJIMH60JL7J6XldUKucJmL28AVqC8RWbNNM5W?=
 =?iso-8859-1?Q?uGZrv4qbI8OyAZ3KgktLyS7CGz4aN9fl5JeFIk34jDL0cqTI1m/NxxiBtH?=
 =?iso-8859-1?Q?ynJYQv4UkyL9jg2ZUwq/SXRylM24uwtPM/Rjr/u3b35auycZYrE8Ff41yY?=
 =?iso-8859-1?Q?7MohdgZZtdGDI1VEhdL9Bo8BwNSBOZMQ6xzYUdxQiH75bfGnjBXeRj+DCR?=
 =?iso-8859-1?Q?reo+J+v4zTIUkDmuEP7NjyMULkSefzJvlgOVh9QO8WbwZLfG7dEYzW4XvE?=
 =?iso-8859-1?Q?winVDHF8NI1H5YSKxwUpM2BgfIzY3BeGkkwau4HQ4iDK2c1o6FYJtb2woG?=
 =?iso-8859-1?Q?n5b1kFnY5SRJGTF6HERObPQvm0ocehahMnS2MrDWEOsWEc+r0SM0B7lLq2?=
 =?iso-8859-1?Q?sWn7Hzx6DW6QVwGfNkKIe8Lkcw1vlopi8TECpqkRaE1ZWVpbbk/vZ/f72/?=
 =?iso-8859-1?Q?epXss9mCEmdoQtYUl82veJTVmGqVLiUrvFksfTSqzWwCRIuTvxXijTeTHI?=
 =?iso-8859-1?Q?LSKZYZlf8NUGX9f4oxg4f66Huds024MlshD/TkwXuctmXvGNk8MjiKQ1QS?=
 =?iso-8859-1?Q?WERPXISrDlfuak61PhM8MguP/AqpPFJrUo/nDZrTWq5jCbmnXooKilC/bw?=
 =?iso-8859-1?Q?oWAk40fxVBrBrMMRYo0y/VQwknZcxAZ0qWcVprfIrSswt4wQdLEVfi5Zpb?=
 =?iso-8859-1?Q?I1igL0PNFQtKCVM0xLRSXHLL1Sf4w1joV+5Mnnxzg7nSTDUMbnDdiZuaqX?=
 =?iso-8859-1?Q?sNFDhKt2ZAesp086ugJ9ljsuSDRZMPSJMedrjlT5cdeXVb82pWscb5ipDE?=
 =?iso-8859-1?Q?eoZq95CQQReFKqSQFvd9mYz5aZPlE8F8aSqblCZaBT6SahgnaSdYLpQJhm?=
 =?iso-8859-1?Q?sR/jQsvUV7yBzNR2yMa5a1C1iHEmY9ERm9MVxDGdrQdSTimkFt4QVYk3U5?=
 =?iso-8859-1?Q?w36T5hNzeXQDUArD0ogl3U4FCcYzuqcV+kNuu1p/N0a/nyY2XtOxurX6iP?=
 =?iso-8859-1?Q?WavYV4knyf4vuv3QfF7OL6fiFtg1HD/0eV2EsHfxWLqllMsZBNvM9H089T?=
 =?iso-8859-1?Q?w8sqPrqkxhQBo88k39EUod5/I68co3uB6hD2rkXzv4kEIiHWxvt3hJuuvK?=
 =?iso-8859-1?Q?jLmD2kX4XY5iMJfbLVWLjf6gX5OJBgWZ9UzGqPdZu7uyc7rxqEObw5aZku?=
 =?iso-8859-1?Q?3F6ZwW0NpotjkGXkljdEGATXLayCFy0R6gxRPaZq0RKD8Xy/ZwK4OArqIt?=
 =?iso-8859-1?Q?9EC074CgLXalAF5gPpw1RRj86Uaoj2LDTJPuMmjote3CYwKaPF/P6B200S?=
 =?iso-8859-1?Q?jypfYN8U01a3Tq8DCMQheKcstoyteDSQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?w8QekWHJaov2eSPEZ2BSWAWkv+PMuiY0pCOaTpj6+5U9aRunpQBEEDA6o5?=
 =?iso-8859-1?Q?z9r8KEqGtPMHk9+jvTmjcZ/onT9mL7Yb7ObG6niblxAFy/WfvU32oj3RpP?=
 =?iso-8859-1?Q?PMK5jfT/qjyZzK2OUrX6JLtWX4xjeAngFrXybWSfFS6I18MCJLfyMxN82+?=
 =?iso-8859-1?Q?NKtRFoirAjZMKZnxb9+qXUWmMBSXtkS6hIpfZPQ49RjA+DOFG8UQvzMzZM?=
 =?iso-8859-1?Q?G9E+46z9WXmY3Go1VFC1Mydhcw4g2iRK9W9sLfreQSK6TPk06FBx98RxES?=
 =?iso-8859-1?Q?KFq+0ieNdKICiPBLuM+WTCEwswuPUMqF5SM49OMB4NjxCEIm+fertPnLhq?=
 =?iso-8859-1?Q?zWWgFapZnZapNf4vCV3P2I4yN6xCbsRPZIpBW5Ie8Oy4n4dm0NHmUSUUsH?=
 =?iso-8859-1?Q?bnzXb1R/AnTwCx65OTNYkppgxigJisq+5ZDyvDFSexGziarMIe2ZFUgNyf?=
 =?iso-8859-1?Q?665MJ/LbpYi5kqSTunBxDMogewb2mGEfZogmb9aEDWPaOBaUC53wzhTBkz?=
 =?iso-8859-1?Q?JhZ8L/I15M6zZ9U5OV+ezPNCVZR5M6AFtjmuty6iqmkB23lWfctALqdM02?=
 =?iso-8859-1?Q?pF1GjS0S9Nn6QFvLkcddTLdWut0mGMRvS2jP0OCk/qHRNtwd70rsRlUWvC?=
 =?iso-8859-1?Q?QWM+ubHiB8wwsHksZ4QYtf2V3WvjLIMTU7fIK/Cyh81GhVob4kegXetcc/?=
 =?iso-8859-1?Q?XhJXUdSIS82kuzH2YeLiaFgdVQ2/e6VXIw+z1ndYe2mToeXfaNYz2uBJZF?=
 =?iso-8859-1?Q?hDDGrsJN1eDQ73MF8HY9Jgm1P3He47DBGOmxZ6kmBGKx3iZKS/duR+p/pm?=
 =?iso-8859-1?Q?Nb4m/5Hylg5xgh0D0uKa4KOXyIyeE5pj90IdBQEQNSX1UHL+K1S4rPxFL1?=
 =?iso-8859-1?Q?L/4nkq+YudcPGCIW99FfH+guonhVeDh8YOAANC5VhwEqP69OLLqXKRAZSa?=
 =?iso-8859-1?Q?PjiXWsVvLFkFLQFOd2ecON4+mks3CuCUNdTQr0uV/anh4CWiuTJdyJXB7b?=
 =?iso-8859-1?Q?CEOmcs2GJL6FeT3ZSfd5dToETkyJecZ/wJ7OeYFB+8Mj97MpIe+62ybLko?=
 =?iso-8859-1?Q?YHDJLTux6VKTC5PK3phvjqwsUgHlnATJYQhO4Yz8ZvVAGc21YimZeMTz5C?=
 =?iso-8859-1?Q?rZR3kk0tmSJKIYXzVodRDAi89bMeebHYIpRAGs17Py6bp/ZzW8UHH8XTf7?=
 =?iso-8859-1?Q?hEmM1cTicB4oSETLOWTYvw/yPhsY/56a3Gj7xz04ttPsfkgQQr7v2P+ZR8?=
 =?iso-8859-1?Q?bvTIy8nAB6GqyYVouEmKMkdT0DQ1R2+Ma4LkkRpOp2Z5ld7iI1MVIn6ZfD?=
 =?iso-8859-1?Q?4mNkprHVrujvYLEm5dO3MWjHtl9T2XykYszjYQF3D1LZj2JSMbVZnM5eM0?=
 =?iso-8859-1?Q?6Zelidd/1OPWefKcVEi33ws4O44Ypl5IIWNHJkOPp/jJpVhq3wUfg9MODL?=
 =?iso-8859-1?Q?QI45eA7RYc9zuPcoREbEJsNnv4yKjzRXa9rbM+h4vz0zLyUmSMh8YhGVaL?=
 =?iso-8859-1?Q?90LebM9ezzJtLNEj8iSRDC649pKMCzIYoLTkmGnM+eGYFofvGmlIlwEOmd?=
 =?iso-8859-1?Q?ybgvmWXjzWF+ZrBNElKyHqvXy5ftjCZE26oHK+6naS4fmzW3sU0VkBL5oU?=
 =?iso-8859-1?Q?7xVArO1ICvxeW2XTvIwg+4K0DcXXPFf4kgz2PpnFfBCytsnR3PKy+vsg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31734351-19cf-42ac-1be1-08dcd40ae072
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 15:43:56.3417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e7ouTjixYJFzkUcFiIe6adbvF2UJ35/0G6KiwS08BEhlsVLn00kTmyt2gpLQNbFZGhb8nXz885DH9uQiBfFd0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7168
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

On Fri, Sep 13, 2024 at 02:01:49PM +0300, Ville Syrjälä wrote:
> On Thu, Sep 12, 2024 at 03:05:30PM -0400, Rodrigo Vivi wrote:
> > The pci state was saved, but not restored. Restore
> > right after the power state transition request like
> > every other driver.
> > 
> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pci.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index 5ba4ec229494..6d29ef4b396f 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -949,6 +949,8 @@ static int xe_pci_resume(struct device *dev)
> >  	if (err)
> >  		return err;
> >  
> > +	pci_restore_state(pdev);
> 
> Why is xe even doing this stuff by hand instead of letting
> the pci core handle it?

That's a fair question, given that there's not much documentation
around it.

Looking the pci code, it looks that the pci core is not calling itself
for the restoration of the config space anywhere and looking to
other drivers around it looks like a safe thing to do.

And the pci_restore_state is paired with the pci_save_state.
Both i915 and Xe are doing the pci_save_state and not restoring
it.

So, we either add the restore state to both, or we remove the
save state. Adding seems to be the most conservative approach,
hence this patch (i915 is queued in a branch with other display
refactor).

Rafael, any guidance here?

Cc: Rafael J. Wysocki <rafael@kernel.org>

> 
> > +
> >  	err = pci_enable_device(pdev);
> >  	if (err)
> >  		return err;
> > -- 
> > 2.46.0
> 
> -- 
> Ville Syrjälä
> Intel
