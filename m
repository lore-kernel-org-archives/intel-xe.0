Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F4DECAC5AE
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 16:29:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B6F010E0FE;
	Fri, 26 Sep 2025 16:29:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MRDALsV2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67FA710E0FE
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 16:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758904147; x=1790440147;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=U8rg1prSTzIBs8jMIzff23qWA6OVL/2w1PK3JWRmpcM=;
 b=MRDALsV2IXs5Nsw4eNdwjd1wKCvABAWIwdXRJlEwJ8tVmTP6QZDsnhf3
 v+g/zpB55LCnCxEzcYfYsN4jl+2ioe6fhOEL2MUqZTBLKI6eMfqf98uVj
 MGHSz5qnGBoC2HY1c9q9J00ADqP9cTPZlxpl2P03y4L3MHDNrE3O5EB4t
 m7mIKzLOKgpkTwu8mXnBjiw/VVmt1/kPp7IshUKWY0Crnu46iwGAJtk+Y
 MuHpHF34PUUB+wzRGvMH8MsUArIki99Bo4khF/mo69IqK0vMbWMRt3XDQ
 NzTgIunpHJeEvudpz6fV04WHxKllwbl2puDhhqJ9fK6wAFMpUawQqJPAU Q==;
X-CSE-ConnectionGUID: bN6dnJ/iTEeklLa2UY3ESQ==
X-CSE-MsgGUID: iwU5nQeASTuoLgY06wQ7hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="60451855"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="60451855"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 09:29:07 -0700
X-CSE-ConnectionGUID: NEP/3Y9VQaa4cr9cbhi6Mg==
X-CSE-MsgGUID: ORZvWeTjTfqqKrAwhY1bPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="177701001"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 09:29:06 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 09:29:05 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 09:29:05 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.1) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 09:29:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JIo+Skl5mjcigvOD+iTzBnhNVykiHVPflLGC1ZoJ/YJk1wb/SRwtYRD9OWeWQqsqpw8Kx3kmH8LsHqmG0mWp9cEaH6i17JRManeit4rKr450JwQZqixHGoOvs1P1IOCSwXcxGaja8iHElpYD7R/GFbp+a84gS910M05/4oCCn/EaHwH4SUN9HCau+16XMGMgpT0unZX9ewzVWsgE4sJ7Uu8jevC77YUxka+wMVsoeTOphBgh04NFk1u69oB+9GPm8xxz8nMDHXqGtfkrdeNlmyI49A16X4fth4+g6KJK3Py7nVNCfo/U32UQ8Ti7F01VMTs5tSqhlULJhrmmNOsniQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iihSLbtwehfvUMOZWkAF44aZPz5d62eCyOJsVZJuu5k=;
 b=WbvQWx2GigzYhBMXAKuAjjZuQdzXNbcAb1Q3AFu5tKWknZEkbXrn/shqq6yBxbOTT/nFkcHsW5bN6R+UpAWUN3Ary3AnqqtDi86Uuu9v4EL7ANTzy2QeQot/Xa3MlewdTV+pHrwLfhy+r1+PCzCabY3pbNVcPvIJfD2KkRrtFUp/kp7ArkAUVJtAJJH3ndfDzJtVlYAFIewaMefngpwfI/3B/5DEHAWHi0hWt1BZXhVPB/+1lXm7N9QH9KwVShTDTkA/T4HtGJ/nYVXbf6FivJM/g/KUc0g4HkEHMFaYpftvncAk/mf+KVnR82kVLzb+sUnOk8XCgC+CQmKB+qqckw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB6910.namprd11.prod.outlook.com (2603:10b6:303:225::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.14; Fri, 26 Sep
 2025 16:28:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 16:28:57 +0000
Date: Fri, 26 Sep 2025 11:28:54 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 02/22] drm/xe: Drop GT parameter to
 xe_display_irq_postinstall()
Message-ID: <r7stpeeuhraua2by45plz5ov6iceo5thwlb5fe75jxjo2oio6c@bv7knbcshcid>
References: <20250925234628.2112163-24-matthew.d.roper@intel.com>
 <20250925234628.2112163-26-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250925234628.2112163-26-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR05CA0173.namprd05.prod.outlook.com
 (2603:10b6:a03:339::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB6910:EE_
X-MS-Office365-Filtering-Correlation-Id: 03d23bee-b01b-4bef-953a-08ddfd19ca8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rU7mjdKAxmrY8ihXEql9nSxQZsjHG68QeTLqIYT7Mzpej8elcr5uusoL3R5K?=
 =?us-ascii?Q?JkhrT04HMQy6rOSe/DaH0O6MHGI6+KBFCkhq1GFwtKU7Id2s4gCk0wQm5RGx?=
 =?us-ascii?Q?M9r9ei2Mo3/7Gwm2Mw8AzxF5JH7dm3AtKjaJ0o9dZwZ/0V/K1yOlf4PT0gSO?=
 =?us-ascii?Q?yClyLqG2CjHgC4ftnfBis0OE5os3gvMDmXE1/MYxtua5EVozDn+YDDSGNP3w?=
 =?us-ascii?Q?DTInt8gHdbhJWpFSMngo/dp9HvaP1GnrNtHq3NEC/twHO8eyStf6cGqt7Oiu?=
 =?us-ascii?Q?tTkiulgwRlMuO3UV3cIf+Imq+jwRWIzE+RERuMDhGGBpqhwMCas5f+pvHPrS?=
 =?us-ascii?Q?JlqFy/fCw+GLpQlJyf2UASF7X2jc0aNRftefsibCZC4FWiLkBYBVV+vXp5JW?=
 =?us-ascii?Q?2VmgelP1pmxLblq05BsXViln7RbTV1wABIIsbPXCC1VcBzE7r/or1vuFDUME?=
 =?us-ascii?Q?JGUQ6ptucJH2cTgK+A8H2WARkSFaThLyUMwhkS+E0im6z8s5xv8MwwdAQ0aA?=
 =?us-ascii?Q?+2y+7RgFueG4SWETMkHvN/TA3SMN+USIPkXkD0lEgNpRIp6IFUy+0oWnlEbn?=
 =?us-ascii?Q?qAaBfIX9RJhaimOZTT9A6e3M8bWmUbHV+U3cBLKvH74E4Gdqz5ZLsEV/8uGX?=
 =?us-ascii?Q?TdMbCbR/cDA+zGupJzEh84zI3z9b0MpXuuMslTJV6jVsisT+1ECUnc+hnxtY?=
 =?us-ascii?Q?1Hofj3WqlCSwgMitE+jPC1O55j0y0+nsjBT0z54jz/zEcAX07/1EVRPtQ6Wc?=
 =?us-ascii?Q?ogYpMYi6MVanraxjYV69MzS79IxHjAHulWo3Q/j9NlsFKQqWxzczk0vWOYw9?=
 =?us-ascii?Q?4S+BNFnp/dDieQ7KyP/FoLmjACt5+C2Wu47hTili8P/KCC2s0+KWW07l1bGR?=
 =?us-ascii?Q?XU/97PxNMZbo/pZU1jfYuxfFA+Wt4QF+MWFMWkdG4ix/QwH5c31DwPO1yDjF?=
 =?us-ascii?Q?JGZnTMJnNl3uxsls9h2Eyh3WPWidG6OkVx+bWxL9S3w2xde/LpwexoBch7/2?=
 =?us-ascii?Q?MXBfxyPx4U/dxStggTrmCorFJKYthzF9egrt+Dm+/KSN8fZcq6e+MKfkSYDJ?=
 =?us-ascii?Q?gaS0P6zVP9YuRJyTfFxfeuM518Fh2sjyTjGHTbrQX5hWepDKmng5bkI+KXj8?=
 =?us-ascii?Q?tPq0O97wlSpUFfg4suKWN1zofbimCabzvNS5vvBX9PBSGTYguV6XX5JcwNc/?=
 =?us-ascii?Q?NyzA4iHYao+0sVLThyu1senoNAiTQCB931k9CzsNG1+Hh5MkKFqIRjs/IwVV?=
 =?us-ascii?Q?AlJKR0czkJz65r/C6XSLJ1cU7dk2aTon4YsUDCPZM48ITSWZkNxKE3OuryJg?=
 =?us-ascii?Q?pvtiRqqjwE7A/C1zE644j+dmwGRIlVGratSVsEL+be9FPVKMokW2g1jvUxSH?=
 =?us-ascii?Q?zW+HDKxS6rLaMzCEJ3d5UXnyXoVRfbDNqkHiHfeKXlfMZs65tfvCqm6VWqvn?=
 =?us-ascii?Q?mAjZX3iBP1iKeRYGDZrOp14k+tlR+rq1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Y9Ov+kjOmQmLK7MKluY0j8Qs4HOLN7Zkie8sF1wgTHUf4qe4Hb988Fi9uqVD?=
 =?us-ascii?Q?YwSvQyXlzD55uAcsJVYuGP0N/DVp53OVjxzvvTzyppeguSTm1zDzKc7heWN+?=
 =?us-ascii?Q?unEr5XLnW+S+sDWnTylT3AFmNR+BHCTNp5Q+tGSPpjYo6wzVAg6wYr6xtEMr?=
 =?us-ascii?Q?NZdd5z12LPb7bFPp7DT7kY6Ru5Yp0RGTRe1UerF5XEzKLcPVN7wB9AFw4GZz?=
 =?us-ascii?Q?X4+691qjOQJ27XezKwZjpUFhC+BL3uMzyIzVOErM7lnMhPa8ixPnccoyyhAN?=
 =?us-ascii?Q?Ms5uN8epLD8ByUmpXLGlGuCxvFgofoavVMUP3lVXs8nZiFA8dx8y/wkV1Bx4?=
 =?us-ascii?Q?2CTN9/+H8St/fBbd1BN8A0dB8CGDoXQN+vMq+D5QIl5/iHtXQJqslfPbYiUF?=
 =?us-ascii?Q?NbRkGkNkyK4rn12dza+go8YDE32IWQBvWRWzW1zUpi07+gxZ0ugQ5jIO1zLn?=
 =?us-ascii?Q?5CKBcLI51cIZ6xCgT9V+8e19pCi4MQPB6MjR73aV/WlecQv7DTYyCuunZzZs?=
 =?us-ascii?Q?jUwuanmVaUf9W2z7Sexz9bWHxgLbJpX5BDRCsdNoHf1WmhdEdeHWkBQuj5ld?=
 =?us-ascii?Q?ScUI60NpOtMQdMuEOVOuXTBRNYeMP5JT4DCwMjygln8VrvE1B0a+w2stygxV?=
 =?us-ascii?Q?X4cMdjkq74use/EEtkNTlT/PXozMfyjOYISRY64Jt4xYFrHHFMs5H+0qv88U?=
 =?us-ascii?Q?aFixutVjBLE5uheZFpwQLRmREvBAdYSN3PzHQCFeNxHJmJ+iF8UOAJlQIwhH?=
 =?us-ascii?Q?BL1T2qWRxtw3MRTV7SXBjYq1/2vA8O1WrUQgyiVcYebq7OBv/dCn+/lYxJKP?=
 =?us-ascii?Q?XyCt1eIpfAzEuGWkUt3o2P0eo+Y4CsD/vp8qpgMLoldKU29HWiIXS5tE077+?=
 =?us-ascii?Q?ylBNxM3BtMVnvcvYG7R3Q+oqZarFPbqRnRWJAxXTdWGXUBJ3RaRioBogSu9L?=
 =?us-ascii?Q?KV3ApRFOJKZ0/4Zy1M46S0lTM4ZwWjPL8Vkf1OoF8fHpiwwXzi6HssgpJXjk?=
 =?us-ascii?Q?82W96OGgO9mZJBcNqgpTBoPPJqjJuL7hngjQliLWvhXH72JQcwR/rhyTaB5v?=
 =?us-ascii?Q?vjwjNmvajhLbBv+51spxnPu5xbZMOmGi8VZSuNqNo1EkYM7BCBMBnGeB2a5R?=
 =?us-ascii?Q?nlyuFthOADrRZOK4QdP685RQ0UdZ9q+d0rmLpymnDv3t30JP60QXvHnGoHVM?=
 =?us-ascii?Q?J4P37zGe7/N84mFM9KyxdtTGz/4c7RvzLYnfDwtyxkGvZKfHS5WVDmMwqBgH?=
 =?us-ascii?Q?yw9WK0HZgFt/1aJo7yjzzYNcnekTZVsTfxUIF2ZKQrAL28ucq6c0NWgRvhiF?=
 =?us-ascii?Q?ccZ1k/FAn3y7Kx7VqHNknzdqzK9dvYQsxejRXlrnofdLepBbenXk6nQ1KpEB?=
 =?us-ascii?Q?+vOZ7Za/CxuhSk6ELe3hjJkyvCbxMuaNb1r1mbwhMkfoLMypEIMgLNO2xhfY?=
 =?us-ascii?Q?ukVRDCDSWJsf1SVj7pL14XkmCW9tfuTMolVgFMIEPdmH6T8DOX7MF9Gp4KmT?=
 =?us-ascii?Q?tXjkqK/65KYNkg77sceeN04ACzTsaBxu3hLmtOmFmEnq45v+AgeVwrTzwhG5?=
 =?us-ascii?Q?Eu0Heo3bg3AvH/4PNLdba7YjDW8516iDvytd1QAyNngl2L2g6PMNdh2PF8gU?=
 =?us-ascii?Q?kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d23bee-b01b-4bef-953a-08ddfd19ca8b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 16:28:57.2575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k6HviFwY76kl3mMkAbZ7S0NaJ6Ayd3gsJMHjDN48dDQJIuJX5fXAfovotVlbmXctptQZGcBwP4Mwr62VPbFfVk5evS5xitRBzC1hCUSc0ZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6910
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

On Thu, Sep 25, 2025 at 04:46:30PM -0700, Matt Roper wrote:
>Display interrupt handling has no relation to GT(s) on the platforms
>supported by the Xe driver.  We only call xe_display_irq_postinstall
>with the first tile's primary GT, so the single condition that uses the
>GT pointer within the function always evaluates to true.  Drop the
>unnecessary parameter and the condition.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/display/xe_display.c | 5 ++---
> drivers/gpu/drm/xe/display/xe_display.h | 4 ++--
> drivers/gpu/drm/xe/xe_irq.c             | 2 +-
> 3 files changed, 5 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
>index 19e691fccf8c..f5101f267c18 100644
>--- a/drivers/gpu/drm/xe/display/xe_display.c
>+++ b/drivers/gpu/drm/xe/display/xe_display.c
>@@ -223,15 +223,14 @@ void xe_display_irq_reset(struct xe_device *xe)
> 	gen11_display_irq_reset(display);
> }
>
>-void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
>+void xe_display_irq_postinstall(struct xe_device *xe)
> {
> 	struct intel_display *display = xe->display;
>
> 	if (!xe->info.probe_display)
> 		return;
>
>-	if (gt->info.id == XE_GT0)
>-		gen11_de_irq_postinstall(display);
>+	gen11_de_irq_postinstall(display);
> }
>
> static bool suspend_to_idle(void)
>diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
>index e533aa4750bc..76db95c25f7e 100644
>--- a/drivers/gpu/drm/xe/display/xe_display.h
>+++ b/drivers/gpu/drm/xe/display/xe_display.h
>@@ -26,7 +26,7 @@ void xe_display_unregister(struct xe_device *xe);
> void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl);
> void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir);
> void xe_display_irq_reset(struct xe_device *xe);
>-void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt);
>+void xe_display_irq_postinstall(struct xe_device *xe);
>
> void xe_display_pm_suspend(struct xe_device *xe);
> void xe_display_pm_shutdown(struct xe_device *xe);
>@@ -55,7 +55,7 @@ static inline void xe_display_unregister(struct xe_device *xe) {}
> static inline void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl) {}
> static inline void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir) {}
> static inline void xe_display_irq_reset(struct xe_device *xe) {}
>-static inline void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt) {}
>+static inline void xe_display_irq_postinstall(struct xe_device *xe) {}
>
> static inline void xe_display_pm_suspend(struct xe_device *xe) {}
> static inline void xe_display_pm_shutdown(struct xe_device *xe) {}
>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>index 870edaf69388..5018a116852f 100644
>--- a/drivers/gpu/drm/xe/xe_irq.c
>+++ b/drivers/gpu/drm/xe/xe_irq.c
>@@ -656,7 +656,7 @@ static void xe_irq_postinstall(struct xe_device *xe)
> 			xe_memirq_postinstall(&tile->memirq);
> 	}
>
>-	xe_display_irq_postinstall(xe, xe_root_mmio_gt(xe));
>+	xe_display_irq_postinstall(xe);
>
> 	/*
> 	 * ASLE backlight operations are reported via GUnit GSE interrupts
>-- 
>2.51.0
>
