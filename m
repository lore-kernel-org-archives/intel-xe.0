Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B66D116FE
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 20:31:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E13210E2B7;
	Tue,  2 Dec 2025 20:31:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bP2ViMWx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4D410E2B7
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 20:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764707512; x=1796243512;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IbRdjVEmFclcvA5HK7uDvZbe4ufK490CGHl0eo5hpVU=;
 b=bP2ViMWx4Cr3EB7pP5dJ7uTjWlHrkG/VWCBfysW81sxLgILkCLPwFf1C
 J/D5TkYOn+7i85Cg4gsRnl/XxAUTs4iLg27MU7ng+Dlc6YBAw1MZwjwz1
 aD3auSk9J0P/tq6N49IHTuy1OBvzz+RxkIQ+z14/39w+/ICO3WDccwrfb
 QgLlYBar/svOhx1dbmQsD422rbYhiodiBDNlbTKS2XdZVBgaTHB7g8OIh
 5LbOisuIBPSDn8hMil/gQEOjeZ66ewNnmHEeFzwYKKuISgT1J4T6N4Kvf
 mIfBysarsrPRWZmE2MGebTSsFWe6pfCv99CvzYo+6ePsZarD+/mXfkKiD g==;
X-CSE-ConnectionGUID: CMaPHkwRTKC+G55WHvtYAQ==
X-CSE-MsgGUID: zGbBOR0DRNOsJKMlhFsEFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="70548995"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="70548995"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 12:31:51 -0800
X-CSE-ConnectionGUID: i9MaH+D9QJ2kjhevhZXaBA==
X-CSE-MsgGUID: kFsljz6RSaySgLYabTf1cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="194358600"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 12:31:50 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 12:31:49 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 12:31:49 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.53) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 12:31:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=COzR5RJt1e9Tg0T8fI99MiwRCRVqM2XqwSQdLf009zoJrZnXoQy4UCBlgjRDyjM/marGZt+uDqgeswVN/mnYivPjah69WYEpD2wcDdBFgBULVktmcAcmeJaFRKFVNF6gq28k3zg/IB5ryQskm9uINRySUfDPx6Nurn32rocPQk6PDlmUdK5RsPP4Eg3DsaN24jrk+RomD/KCEBgz9VPRzefigquymtzg2mR5kF6t8ZMSF0kA2SGUmvGkEzfchksClv6vUPHiBHkE6DwGJq4Kw2vYo5m6/ZxbPBTwa5Ugy0f2RViFwr40jRnyfB6OepVRW8Qg62NYraErzcU9he624w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I2ybGzllt5NRDrPwv4oXm4W/Kl13irW7bvjY2qJCz9A=;
 b=reXpe/o3+gYgFc/Q8FT69fH8J1Ua8QPRz8YluM8CPUb3D8lMFy6oJq6zPLmCIWfuC5ySb1cjiQ7w3B4BtRdW2KBvPYOBz72gE9ktneDZL6WX2kPAhcx/vgn3aGkqrzylS5u7fAMNKZRma/73u6tUsh1+6Xqc29+fjbF6HvPRYda/MJDcf7SkayzlMbcRIrgcjbMRhgansk81oRfMxAKnG1E/0WAqJT3vYT1NNQGe12hYuPu8zsIh9FoXzYyFEjrV2blAEVX09kUlAacbcJzahQiDxUNW91nsDVq1LNr1ct1YuSxDFAfw2FeXqxT/abgqA3HxY7Uyai2//c8ucWarLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH0PR11MB4840.namprd11.prod.outlook.com (2603:10b6:510:43::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 20:31:42 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 20:31:42 +0000
Date: Tue, 2 Dec 2025 15:31:38 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe/xe_survivability: Add support for
 survivability mode v2
Message-ID: <aS9Mqm_36Tfs3C_x@intel.com>
References: <20251201143420.3158372-4-riana.tauro@intel.com>
 <20251201143420.3158372-6-riana.tauro@intel.com>
 <aS3T2crA95cvORV0@intel.com>
 <93501016-0e5c-4ef2-8d15-9d437c492260@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <93501016-0e5c-4ef2-8d15-9d437c492260@intel.com>
X-ClientProxiedBy: BY5PR20CA0036.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::49) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH0PR11MB4840:EE_
X-MS-Office365-Filtering-Correlation-Id: 57b3d6b1-ceed-40ce-8062-08de31e1cd7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4x/5AbyBXHMeFbzWpL9to7XCL3cahCety1Y0rS+9Mb0bYu45J5mAiLdj0gyh?=
 =?us-ascii?Q?BBFK3b96Dxfgig8RVqaSvxLuEo9hDtcWZwDfcmGy2XUPc+tSj1RC2gIHwLLJ?=
 =?us-ascii?Q?Ch5Ijd7FbtqKlTR3pI5/OCOn8SFjkYJXJhoLM76T5xi2lRA71hALAoqcwZ9p?=
 =?us-ascii?Q?Kp215gLVkRC1yHp/fkf306QlN0DJEmpaVRCUleKj+ZRRWN7mwkGtA6zlrew+?=
 =?us-ascii?Q?GVxTACJan0bF0Iy5VVWN7vJMdpcVnNWY01M4aEbteQDx5JrWyt6vlaSpy30x?=
 =?us-ascii?Q?g4wShvjXqKslrCAM3eW87F7HW7v7eAtyNqRk4wlGNB/T+XZQd15LjvVmVPYn?=
 =?us-ascii?Q?v1ZdF1GH481v4U7CeEMHrt1tkD5KQIlPRFvCx9r+qwXmG0C+6F7BD7HMbjiu?=
 =?us-ascii?Q?1vZ4ir4yAFebkLVjDElZJdALFVJKpHAn2yI5QWD+hg1M/72yU/IBFE+qooVs?=
 =?us-ascii?Q?eAR+1chsKU56lEKqYqYjbtR6JWEiMgmP/IFF8+c+pBGqJVk/FYxXY7mKmWeR?=
 =?us-ascii?Q?kSD0PwzdU3oXdE3RxI1U56F9R5EXOTPhcK9lRWIdLqTrdiNyXvXilMVMtn4o?=
 =?us-ascii?Q?jixpcqAur8QbY+RRUoJMD7h0nELaFaFOE+sEUqMQhhvyhVnHzczjFX9kRR0O?=
 =?us-ascii?Q?8hk71VGReBoHnqiVcMKq2u+2TL3xnZEvA3h9U0y3rKyUjX1AjAQJfbW1wun/?=
 =?us-ascii?Q?OPAyan3Hcxjj66KYZaoXUHW5oEmX0MOomVYvKBOWeei87n8C1XDPi1tzlbUM?=
 =?us-ascii?Q?Wr/2vWY4lsw5oUT24EfuHyR3jL7AHmSC1kySq8GMXKade0T0vM9KxTWrOWGf?=
 =?us-ascii?Q?imZcmA4GUD4F13ddyFiaXv5VP16fD2Wbq8ioUNVCyVLbY5vjmA4XVpuVLL+M?=
 =?us-ascii?Q?fi9pIsu5N9hcT1c+kUrryssfauXdOKlm46iCP7Lik32taLG2IDyDr2il+CdC?=
 =?us-ascii?Q?3OWtwyunrZp8DeYIZusb+DTxmOOBxxruIQKGR5vyAH2ryd1WoXz/o+OS/W2Y?=
 =?us-ascii?Q?1W45DIaUFq3dmdX6KxDqZBze68HoRlNQEW9NoIK4kFlaVD9yKbUPSj6BhMKq?=
 =?us-ascii?Q?h4ShiBOMeRV+mVEHfcEOQszhMU/d8AuxLJW5U1yqX+YZepKbwa7F7PsyLFc9?=
 =?us-ascii?Q?Utq63a+2ArpdMbTie7IOW9GFIIf4E4T2uNngo94+Mz4FrBaEAVUKJsa9nFDU?=
 =?us-ascii?Q?ynwOLcruwW2rcvP1kM/6MizLAwOOcfT+C8Nk+sen01A62vsKPHcs2JX8f+Yu?=
 =?us-ascii?Q?LJhiVYZEovtIGIa8ma4YqlASUm2WtLzSS0ETg135dfHbP8SAB9d3CD9cUbV7?=
 =?us-ascii?Q?Xt2Qjw+aAy6XT8/UC3H4PP6nDWTTPwDFleT+ygsyVO2wxN0O1pEjtMiRgnwQ?=
 =?us-ascii?Q?6KB0vPl76SkI7pkpyz0knmbYzug+y/g8a52x+udatNWuBvnvkHWbT3ho46Av?=
 =?us-ascii?Q?fbgwKkmNtMpaPWLNTrHFkHlHZgoFoBv4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dgtAMSBywQ6e2wPzDjUy/tkUe1fCFYNb00VsLeOranl5RboCPUAE4R3HZPV5?=
 =?us-ascii?Q?bUbkbRJPYiGqIsYdZmmAUkDsp3dgqKFfj/xE9UHPJ9BVn+sxEKUJDy6INEG4?=
 =?us-ascii?Q?LalI/hIQvfCdr1/GzTT64/zcf09V4sS9uFbpl5KsfgpMFD5H1HVBEFbHjUDR?=
 =?us-ascii?Q?T6XEugnZHyTZXo631wnxKGqnmURorl5uDvroBrNg2yWCihB/s4thAjuswu0Z?=
 =?us-ascii?Q?Zjcuk4mlsxgOJHFHjqKacp6HcdPmmeqxOuvu5NPd3t7B2xsm37SwT5c5sAYQ?=
 =?us-ascii?Q?pAQTAvZMUpHH3fw5hZyuL9pIVomCGuuUif4Mi5qQNwEGMwDHyUrPgdVsdqEg?=
 =?us-ascii?Q?0qky4HZCnL7acALmwioz+7iBXLPdolKmUB+UD5UIsp3g4JgLFEA6EffrZvl2?=
 =?us-ascii?Q?4pHAa9wiYnv/Kdh+/DBRJtp4VwpoMl6QlBkkT+jYU3mZTm44mFGyvRiCMa7C?=
 =?us-ascii?Q?6tDABjD/etbxxRGSXQymigwiCxw4hV89uyrWuKQc9ldhpXSpVVVJ7rLH/LT/?=
 =?us-ascii?Q?gjlz8rnPEOjkBUvKDdclw5nlOZwXPPYoV6oxyjNXs5SuwiWOUDPxyoqSmPtp?=
 =?us-ascii?Q?UhKQ+/0UWhCKMfahNnuco7CP8e+xjdyCcLWBdmdcACh91iDgNyU4uN0rbS3t?=
 =?us-ascii?Q?6BqT/UCaVWBmtWEe6yZXGh/q2H0lWkkKwwPzHEHL7hiwaqUTiPXNi3BZNUEx?=
 =?us-ascii?Q?v1MxbR8/nUByLke65lL/y2UURhKtvkGRKojCjlIubEOviYQJWSKLXL2hiha1?=
 =?us-ascii?Q?iVpesYY/r5fblJcr31OWHzNJnsW+CkjJUKU2Pc8XSxuV5ZiyNoBdhXAMi6bB?=
 =?us-ascii?Q?paixr7uCklLGwzjbYS9hYN/d+jKV5qr65Q/E0NsweAsdooxyz+Wx76ImvRir?=
 =?us-ascii?Q?h4fQaL+fCsxeTOCpCBi9ueGQ8Ox8VD547ssmOJe24iqN2nh5mM+M2Yc33zWe?=
 =?us-ascii?Q?XKhEPlZp8e9uonJ1NlISCmSZjVIyGX7q/yUQ3sVPN2GzxRzpW49CEhyYwI+w?=
 =?us-ascii?Q?T7ORPusaoFQTip7PQAaDhBM9J1mOWS3lZ9fsUUdaKb62NhJHVCx+75AI5UXi?=
 =?us-ascii?Q?mc+kKYEfokahaSTMDTtV6/xB6+WvfWsWZRrTF3E4+DQqJpdyldczwoMt6jy1?=
 =?us-ascii?Q?JbmG15PfzmPd+MxZMSw84OUCxiOpKyttzlV5UZhh6AsBQbS52q9laYGnW2iL?=
 =?us-ascii?Q?f0qEynph42MW2411YVhBIv+U4bk+vJ6zIDgdHm/RCqYZ7hAjQ0ctZLUvYZ+Y?=
 =?us-ascii?Q?auU+vR49sEJOGapSbx0hleoQGZu5noGKx86f3WTp6o+lyYWmruaxlvNOH3wz?=
 =?us-ascii?Q?jKlWRKfTexBXYwFHs9hxmE+F5J320ouKlx1RBBLE0vo0jSB9lYDstfvVcMhE?=
 =?us-ascii?Q?pvPrOybc1dPHhwHtrxzXDHc7yVN+q1eHf9VIa80Fqy2ytm9C1A85ZArnG1gx?=
 =?us-ascii?Q?ibdBKsr9P0W7dbcPYoOb3cwf3XcrC0daRFHZ6I0SCXqFIDr6dCnaQ6BTRYLD?=
 =?us-ascii?Q?uyi2rOlKUHW9+0Mzw3U6ktdfFTERWbzPgUWJn+YKwIKVqURpl41Yzxe5A4jl?=
 =?us-ascii?Q?EB8DS5D93yBaNkM0XBBBMFWP4R3LvDclo0pcuR0Z?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57b3d6b1-ceed-40ce-8062-08de31e1cd7b
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 20:31:42.2003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fZolc/AZp765jZRMbsFhR6HbqA2dUFMzIdGllIKnhGL+Dj0KeftpPE9/2kEwx4uYqv5C1JM8QxZAj6npCHMsRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4840
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

On Tue, Dec 02, 2025 at 08:37:09AM +0530, Riana Tauro wrote:
> 
> 
> On 12/1/2025 11:13 PM, Rodrigo Vivi wrote:
> > On Mon, Dec 01, 2025 at 08:04:23PM +0530, Riana Tauro wrote:
> > > v2 survivability breadcrumbs introduces a new mode called
> > > SPI Flash Descriptor Override mode (FDO). This is enabled by
> > > PCODE when MEI itself fails and firmware cannot be updated via
> > > MEI using igsc. This mode provides the ability to update
> > > the firmware directly via SPI driver.
> > > 
> > > Xe KMD initializes the nvm aux driver if FDO mode is enabled.
> > > 
> > > Userspace should check FDO mode entry in survivability info sysfs before
> > > using the SPI driver to update firmware.
> > > 
> > > 	/sys/bus/pci/devices/<device>/survivability_info/fdo_mode
> > > 
> > > v2 also supports survivability mode for critical boot errors.
> > > 
> > > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > > ---
> > > v2: do not exit survivability mode in case of mei init failure (Rodrigo)
> > 
> > I still see the goto err there, what am I missing?
> > I mean, no strong feeling about what is right or wrong to do here,
> > I just want to make sure the code matches the doc and expectations...
> 
> PCODE enables FDO mode when mei has some failure and firmware flashing
> cannot be done using igsc. In FDO mode, XE KMD initializes the SPI driver.
> 
> If initialization of SPI driver fails, then user cannot update through igsc
> or using spi driver. In this case, there wouldn't be any reason to
> stay in survivability mode. The goto err is to fail probe.
> 
> I have mentioned in documentation that 'FDO is enabled only when MEI fails'.
> Is there something else i am missing?

Nevermind. I have mixed things up.
Thanks for the explanation.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Thanks
> Riana
> 
> > 
> > > ---
> > >   drivers/gpu/drm/xe/xe_pcode_api.h             |  2 +
> > >   drivers/gpu/drm/xe/xe_survivability_mode.c    | 44 ++++++++++++++++---
> > >   .../gpu/drm/xe/xe_survivability_mode_types.h  |  6 +++
> > >   3 files changed, 46 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> > > index 70dcd6625680..975892d6b230 100644
> > > --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> > > +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> > > @@ -77,11 +77,13 @@
> > >   #define PCODE_SCRATCH(x)		XE_REG(0x138320 + ((x) * 4))
> > >   /* PCODE_SCRATCH0 */
> > > +#define   BREADCRUMB_VERSION		REG_GENMASK(31, 29)
> > >   #define   AUXINFO_REG_OFFSET		REG_GENMASK(17, 15)
> > >   #define   OVERFLOW_REG_OFFSET		REG_GENMASK(14, 12)
> > >   #define   HISTORY_TRACKING		REG_BIT(11)
> > >   #define   OVERFLOW_SUPPORT		REG_BIT(10)
> > >   #define   AUXINFO_SUPPORT		REG_BIT(9)
> > > +#define   FDO_MODE			REG_BIT(4)
> > >   #define   BOOT_STATUS			REG_GENMASK(3, 1)
> > >   #define      CRITICAL_FAILURE		4
> > >   #define      NON_CRITICAL_FAILURE	7
> > > diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> > > index b5b582442637..8d409bc9c14b 100644
> > > --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> > > +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> > > @@ -16,6 +16,7 @@
> > >   #include "xe_heci_gsc.h"
> > >   #include "xe_i2c.h"
> > >   #include "xe_mmio.h"
> > > +#include "xe_nvm.h"
> > >   #include "xe_pcode_api.h"
> > >   #include "xe_vsec.h"
> > > @@ -66,6 +67,11 @@
> > >    *
> > >    * - ``aux_info<n>`` : Some failures have additional debug information
> > >    *
> > > + * - ``fdo_mode`` : To allow recovery in scenarios where MEI itself fails, a new SPI Flash
> > > + *   Descriptor Override (FDO) mode is added in v2 survivability breadcrumbs. This mode is enabled
> > > + *   by PCODE and provides the ability to directly update the firmware via SPI Driver without
> > > + *   any dependency on MEI. Xe KMD initializes the nvm aux driver if FDO mode is enabled.
> > > + *
> > >    * Runtime Survivability
> > >    * =====================
> > >    *
> > > @@ -94,6 +100,8 @@ static const char * const reg_map[] = {
> > >   	[AUX_INFO4]               = "Auxiliary Info 4",
> > >   };
> > > +#define FDO_INFO	(MAX_SCRATCH_REG + 1)
> > > +
> > >   struct xe_survivability_attribute {
> > >   	struct device_attribute attr;
> > >   	u8 index;
> > > @@ -127,6 +135,11 @@ static void populate_survivability_info(struct xe_device *xe)
> > >   	set_survivability_info(mmio, info, CAPABILITY_INFO);
> > >   	reg_value = info[CAPABILITY_INFO];
> > > +	survivability->version = REG_FIELD_GET(BREADCRUMB_VERSION, reg_value);
> > > +	/* FDO mode is exposed only from version 2 */
> > > +	if (survivability->version >= 2)
> > > +		survivability->fdo_mode = REG_FIELD_GET(FDO_MODE, reg_value);
> > > +
> > >   	if (reg_value & HISTORY_TRACKING) {
> > >   		set_survivability_info(mmio, info, POSTCODE_TRACE);
> > > @@ -188,6 +201,9 @@ static ssize_t survivability_info_show(struct device *dev,
> > >   	struct xe_survivability *survivability = &xe->survivability;
> > >   	u32 *info = survivability->info;
> > > +	if (sa->index == FDO_INFO)
> > > +		return sysfs_emit(buff, "%s\n", str_enabled_disabled(survivability->fdo_mode));
> > > +
> > >   	return sysfs_emit(buff, "0x%x\n", info[sa->index]);
> > >   }
> > > @@ -205,13 +221,18 @@ SURVIVABILITY_ATTR_RO(aux_info1, AUX_INFO1);
> > >   SURVIVABILITY_ATTR_RO(aux_info2, AUX_INFO2);
> > >   SURVIVABILITY_ATTR_RO(aux_info3, AUX_INFO3);
> > >   SURVIVABILITY_ATTR_RO(aux_info4, AUX_INFO4);
> > > +SURVIVABILITY_ATTR_RO(fdo_mode, FDO_INFO);
> > >   static void xe_survivability_mode_fini(void *arg)
> > >   {
> > >   	struct xe_device *xe = arg;
> > > +	struct xe_survivability *survivability = &xe->survivability;
> > >   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > >   	struct device *dev = &pdev->dev;
> > > +	if (survivability->fdo_mode)
> > > +		xe_nvm_fini(xe);
> > > +
> > >   	device_remove_file(dev, &dev_attr_survivability_mode);
> > >   }
> > > @@ -222,7 +243,10 @@ static umode_t survivability_info_attrs_visible(struct kobject *kobj, struct att
> > >   	struct xe_survivability *survivability = &xe->survivability;
> > >   	u32 *info = survivability->info;
> > > -	if (info[idx])
> > > +	/* FDO mode is visible only when supported */
> > > +	if (idx >= MAX_SCRATCH_REG && survivability->version >= 2)
> > > +		return 0400;
> > > +	else if (info[idx])
> > >   		return 0400;
> > >   	return 0;
> > > @@ -238,6 +262,7 @@ static struct attribute *survivability_info_attrs[] = {
> > >   	&attr_aux_info2.attr.attr,
> > >   	&attr_aux_info3.attr.attr,
> > >   	&attr_aux_info4.attr.attr,
> > > +	&attr_fdo_mode.attr.attr,
> > >   	NULL,
> > >   };
> > > @@ -287,12 +312,16 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
> > >   	/* Make sure xe_heci_gsc_init() knows about survivability mode */
> > >   	survivability->mode = true;
> > > -	ret = xe_heci_gsc_init(xe);
> > > -	if (ret)
> > > -		goto err;
> > > +	xe_heci_gsc_init(xe);
> > >   	xe_vsec_init(xe);
> > > +	if (survivability->fdo_mode) {
> > > +		ret = xe_nvm_init(xe);
> > > +		if (ret)
> > > +			goto err;
> > > +	}
> > > +
> > >   	ret = xe_i2c_probe(xe);
> > >   	if (ret)
> > >   		goto err;
> > > @@ -302,6 +331,7 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
> > >   	return 0;
> > >   err:
> > > +	dev_err(dev, "Failed to enable Survivability Mode\n");
> > >   	survivability->mode = false;
> > >   	return ret;
> > >   }
> > > @@ -408,8 +438,10 @@ int xe_survivability_mode_boot_enable(struct xe_device *xe)
> > >   	populate_survivability_info(xe);
> > > -	/* Log breadcrumbs but do not enter survivability mode for Critical boot errors */
> > > -	if (survivability->boot_status == CRITICAL_FAILURE) {
> > > +	/*
> > > +	 * v2 supports survivability mode for critical errors
> > > +	 */
> > > +	if (survivability->version < 2  && survivability->boot_status == CRITICAL_FAILURE) {
> > >   		log_survivability_info(pdev);
> > >   		return -ENXIO;
> > >   	}
> > > diff --git a/drivers/gpu/drm/xe/xe_survivability_mode_types.h b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> > > index f31b3907d933..bd5dc1c955ff 100644
> > > --- a/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> > > @@ -44,6 +44,12 @@ struct xe_survivability {
> > >   	/** @type: survivability type */
> > >   	enum xe_survivability_type type;
> > > +
> > > +	/** @fdo_mode: indicates if FDO mode is enabled */
> > > +	bool fdo_mode;
> > > +
> > > +	/** @version: breadcrumb version of survivability mode  */
> > > +	u8 version;
> > >   };
> > >   #endif /* _XE_SURVIVABILITY_MODE_TYPES_H_ */
> > > -- 
> > > 2.47.1
> > > 
> 
