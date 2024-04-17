Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06557C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 22:27:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9958910E2D6;
	Wed, 17 Apr 2024 22:27:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R50GDyHv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BF2010E2D6
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 22:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713392874; x=1744928874;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=q44L03NcNqchUvyMKqgCwMQa7scbrJWl6D9TimcUajw=;
 b=R50GDyHvMBhVAJnNwi3Gs5GOVo+QzLSEtPu9bx2Au5G7fizSOzDHN2OA
 UGVaQqj7iuBhe0o1+xBEGrAS5kzW+fkacfsqca3+qZkeFtSGzWI7Rlt7e
 vMvIkOa/79hw4mpagp75ejFvqrciGbxl1hqaTArz8zG5/4+7qjlge43Ry
 d3CLaQrRQsoRSZMD2NFX1UhBhZ6VpnrMkCE/t8hvd9UUIN7p/vSShYHs9
 MV9Tp4t4ZQ2PY6JhsKNr9jCoo+S4CwK4yztyHtP02Yh0p0vfbzWzq1cw3
 mc2yQfYiND6SdvofrIFE6NebYrZfA1woUDrFQfmpjjDiCS33yVJa4JnW9 g==;
X-CSE-ConnectionGUID: 2V0qZe3eQ1WQkhwU6TLMvA==
X-CSE-MsgGUID: W02uIRGQQvqOxJHWUokbyw==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="34307867"
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="34307867"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 15:27:53 -0700
X-CSE-ConnectionGUID: hGVHtGmnS2y02S7J77IRrw==
X-CSE-MsgGUID: ssomflE6R5+zwDQMh20EAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="53979889"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 15:27:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 15:27:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 15:27:52 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 15:27:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f6juLlsJd4D34rQbMyCuquNOQhVaOcOkHX2lceeg046wEiy+8584kAJNOaBj0h8o9206MljIYxP9wjH91y7T+XAZfNb061DyGjEDGw66G07cOSD++1PGN2lyg/bvf1uG9+oTPO7OIh3gHaespw/AwZs2AQFqrNuhv1zm4Hz2I8XfMjJ2k4byAbD/1TkNtuo4M0JqglZgofvfikrkDKe+dPnszuMZ3KKpCECA+MUeLmBcCZ3WwcKSIvN591+cyjf2h7mhcNarugi+pmVQZr/bYqqrs2rvU2ZXS6ae/dHcTIrlIS49v3oUVt8p/14hLY16Q/a3eDHl8JAPAT/DTOu1PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dWKio+rRowe9UI7/BBc/8yPwEjl232Myr1WSE/7Rj7Q=;
 b=KQA/CiAmN9s9VZcgS6aTeAvEswnVlWIM8VzHM7bbaIXbro5A1QP19tq7CZ/hky0nDTW1AFadDB25xsCxQPyFVgIc+J0M/+qqrpoC+HAMMyiBfDlxtffWCWIQFT5qTOGrQdv+6KvJCp8XJ69fLLaB5ksOL+kI+foRM/oY1OrqzRBfiSy9fOOErbIVOsyUZL6Niqv0b2ZQ36poBowgWvHjLGqPqqildhf6Nm9WrbHbWPHPGutANpf/PM+m30vVgmxWWfPH1lcexTq7dwmg6nYuH60bvfzl26ispd2fs3O0YUsBxTLs6apYuOHUb5rcXS7i59vXemLmD9kJym+r9lm60w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB7596.namprd11.prod.outlook.com (2603:10b6:510:27e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.27; Wed, 17 Apr
 2024 22:27:50 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7452.049; Wed, 17 Apr 2024
 22:27:50 +0000
Date: Wed, 17 Apr 2024 15:27:47 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.de.marchi@gmail.com>
Subject: Re: [PATCH] drm/xe/xe2lpg: Extend Wa_14020338487
Message-ID: <20240417222747.GN6571@mdroper-desk1.amr.corp.intel.com>
References: <20240417212501.312346-1-gustavo.sousa@intel.com>
 <171339034765.54602.16408540374552896913@gjsousa-mobl2>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <171339034765.54602.16408540374552896913@gjsousa-mobl2>
X-ClientProxiedBy: BY3PR04CA0005.namprd04.prod.outlook.com
 (2603:10b6:a03:217::10) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB7596:EE_
X-MS-Office365-Filtering-Correlation-Id: 531b3b58-40d1-4266-8e71-08dc5f2d9da1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O+vri3XBG3PZIE+4GshwODCQz6vLYQVHrwxdZt0NyI1uMeeXB9xEW2A2Dq2aKvAWNDmLl7D+M+G9u+wg/mn0dGj7aj3WM2pZYaEu91QGeU63qvKGlwBe1WLaUJTBnBlWFcmgA3RbgaAf8v9RtRewDxRFkbmBtg1KwA0JSTIqKPDLVP8NoBRwEk83no+jynhbZK+5hd38nB3rq4rwuRo0K6IRCcuup2NaSbP1cveuXG5sb453wa9/fLWnzepe1A7S2p1JxWtTBgrRbSvhHtk/CmbaEQeFwNJMstVHNkiwx536+5gfcts1D5v04nDkinue+Pkpp0ZKJ4p7HG08ixRAho+vzMhSYNFLu/x/6o2xe1SkWmUi3dxL6oH+97INlQl56y66soYcQX+BtfwExMJN+WOk7Wzx88p3cNY4oOwQH3gWeGZb3HhwsmU08hIqtpqNMs9JE6tjLFtXb5qRPudoNKMs9TcWgFt73K6o2ns2d13VocXbqhYLDFLTXXGaAPJNaCy+EzLSq7pDgWNTeRqNfelF+DjGbkgeSqowq+ok8g4m2mELON/OY/QHVQf9kdJZTTyjo6Tjplk/PR74URe+t1ZDS9Tp5ebsErnJCyx8b0q+EhBIRCXo8v2y1rsGz13ZI8I5TC0cq7meWJJaR5h/xnKkvihsU0dz9aZ47KRBHLs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lOFq+8EVuGiw/FDzevuo2bYi5Yq1ac/tEeyEZVTo71SgylpbtCBXWYEHX788?=
 =?us-ascii?Q?YA6rkcUMh47iHttMIppRABTdBRlB0D/UXeiCTo5AYKog5OmiJwsop0FtAyEG?=
 =?us-ascii?Q?CwLJyyu8OiMDVRmDr8aPJiMwrDO3xcvl/s/DrIGBX2I30i9SMUec4S3tsaei?=
 =?us-ascii?Q?JQxvh0p7aO5yZKwCg6QvpSiYWV0kijhArzfrc6EDUo2iLu7Ew9a6O9XN/Lix?=
 =?us-ascii?Q?hvaPTz7Loalh7FztowxMQIkseGfVyNqwU3u5rUdBC1okZLU6l7noHuSOVefc?=
 =?us-ascii?Q?GWLZMCYjnP67ODo1ng2TXARGp6tP2qBhhBJRgrzfju3L35Q7wi38AQMkyUCq?=
 =?us-ascii?Q?nfYsIoqKvBuM+GpvTsHlMTTuexzGrJk5vEwZqJJ38SzUCZZDB6jWaFCl8ti1?=
 =?us-ascii?Q?KP1CzLVRw9o42DHK9hV8aCI6tv8b5TP2ZZzun4HD3ik+d67zHuYiPtYA1f0e?=
 =?us-ascii?Q?82KBakoc5+8OwL5VpK6qstZ7R1nAKcaYRpNup/ONGTFiAZThQPvbKKu2KbyR?=
 =?us-ascii?Q?PjfDRekunCF8PVzWFRbJ/oy6BJbUNecmUURwgo3pDcPFWTDsxEn4ZiZ46D3D?=
 =?us-ascii?Q?iVRjJx5SeDVsiwDMYOrAIVU5tR2rT3TFhy1A11C6FHpPJvIgEbAyl/lRTzCa?=
 =?us-ascii?Q?Ztx+QTc8XTtk7LZG2+apiEJ2XWEQ9I9mvn61E8r9SitsuZuIYEzZF4txt8dM?=
 =?us-ascii?Q?LC8SUsrAAuMf1u9V4UJ50aIl8LjjIStji7u9LRulqSduSEiLyWsWzDTdVW3P?=
 =?us-ascii?Q?yP3N0fWTlqMclFQ8ozyNFsa0Ppg5d/rvumCVnD0+ZtrNCF63kdwnmVmf4jJ4?=
 =?us-ascii?Q?1EvnqYSYUvQfFHkZNe5eoZvXxGsqy+o0p43a95RgLbn/OOkCGo3DXpx5ytxU?=
 =?us-ascii?Q?no0VZDBOxQI9zrDQroHzH10A7nzoiEYE9EbfOVNuVnkGa9o72l5Ks+poIgqS?=
 =?us-ascii?Q?yyv3cbU97p8h9HBUeOyZnP1U6bLi2fzV4gPYc1i2KLuutwIVBE/8MBAvcXNU?=
 =?us-ascii?Q?AqSTFHRcx7Ziy4lIyLR8/AwLgKOAjfoSVM49gWBLR/0qSAINq1yTQb9nAS6N?=
 =?us-ascii?Q?aQQuDK0dCTyqsujYQ104GsaSXKkNiJxu4lje7VRTVxy48+pHZ1Sti7/gdtkw?=
 =?us-ascii?Q?YpZne6F3btH9fl/AeQoxbkNIF2su0S1xGssIi/GNg6GnsEWI5oV/IK5g3hYE?=
 =?us-ascii?Q?z7rfxQHDx1q85atDPv75g88KOGGO6xCs4jTbbsefjXJPBjle5YC0bHmUfOaV?=
 =?us-ascii?Q?ah/Xk8LaZtesdYA3Z6ew6DjCFOgOfAaDq9yuFl+7uilpeyhSvLQyEE/vlZwY?=
 =?us-ascii?Q?SJBMGt51Jscypf8MVVice5PshtpuGgK9CXzGvuGOsr08G9Nog4BnqCFR1AV5?=
 =?us-ascii?Q?brtrN0psV/JggDTctZmRfKvFP6WbgUViyjBsQCGuClS3P3fKGj96hnbTQl23?=
 =?us-ascii?Q?BLvLGHBRWe362gi55CEi7KCrtK/+BpFR9O3gzeNywNrlvawJpLE5F7R5sYQS?=
 =?us-ascii?Q?aUsdixVGTj9xb2PMssS1E4ZoyEm5UMjQtYZMr+z0nGeKyehyVcPL5l6gOLO+?=
 =?us-ascii?Q?cgF8W1ixrATgMOJzRhXslfHrzdjrhUAuue0T6Sih/0aGmYr65k6LNfDx2pO0?=
 =?us-ascii?Q?Hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 531b3b58-40d1-4266-8e71-08dc5f2d9da1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 22:27:50.4291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AXCAb5eF0G/h2ckzjRYo42sE3EmbgBxoygK99laRYgniFJib50xfuOoQVHBJs7HaMRJflCZmMjy7tPiCPEaG3MDEYet2yE0a7ogTxno/BM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7596
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

On Wed, Apr 17, 2024 at 06:45:47PM -0300, Gustavo Sousa wrote:
> Quoting Gustavo Sousa (2024-04-17 18:25:01-03:00)
> >Wa_14020338487 also applies to Xe2_LPG. Replicate the existing entry to
> >one specific for Xe2_LPG.
> 
> I would also like to take this as an opportunity to discuss the way we
> are currently arranging the RTP entries for the workaround. Using this
> one as example, created a copy of the entry and edited the argument of
> GRAPHICS_VERSION() to match Xe2_LPG. There are multiple cases already
> following the same pattern, mainly because we are grouping entries by
> IP release.
> 
> Do we want to continue following that pattern and keep the code
> duplication? Or should we think of a way to avoid code duplication here?
> 
> A very simple approach that I think of is having a single entry for each
> lineage. But I guess that's not really feasible today because I guess we
> do not have a way of expressing logical disjunction in XE_RTP_RULES().

Yeah, there are basically two options here:
 - Keep them separate for now and combine some of them down the road
   once we're sure no additional SKUs or refresh platforms are going to
   show up with versions 20.02 and 20.03
 - Combine them as "general Xe2" workarounds now with a version range of
   20.01 - 20.04, and then split them back appart in the future if/when
   some new SKU/platform that doesn't need the workaround shows up to
   take the currently unused version numbers.

I think we've been going with the first approach because during early
enablement of the platform it makes it slightly easier to quickly
compare the driver's workaround list against the workaround database's
list for a specific platform.  But we can also get a runtime list (i.e.,
what's _actually_ applied) from debugfs, so maybe that's not very
important.

As long as we do it consistently and put in a comment warning about
future changes, I don't see a problem with grouping some of these shared
workarounds into a new "All Xe2" category with the understanding that
some of them may need to be separated back out into individual entries
if/when 20.02 or 20.03 platforms show up in the future.


Matt

> 
> --
> Gustavo Sousa
> 
> >
> >Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> >---
> > drivers/gpu/drm/xe/xe_wa.c | 4 ++++
> > 1 file changed, 4 insertions(+)
> >
> >diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> >index 632bd9066f8d..dcf7ed51757c 100644
> >--- a/drivers/gpu/drm/xe/xe_wa.c
> >+++ b/drivers/gpu/drm/xe/xe_wa.c
> >@@ -445,6 +445,10 @@ static const struct xe_rtp_entry_sr engine_was[] = {
> >                        FUNC(xe_rtp_match_first_render_or_compute)),
> >           XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN5, DISABLE_SAMPLE_G_PERFORMANCE))
> >         },
> >+        { XE_RTP_NAME("14020338487"),
> >+          XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
> >+          XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
> >+        },
> >         { XE_RTP_NAME("16021540221"),
> >           XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
> >                        FUNC(xe_rtp_match_first_render_or_compute)),
> >-- 
> >2.44.0
> >

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
