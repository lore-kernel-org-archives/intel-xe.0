Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC083C05027
	for <intel-xe@archiver.kernel.org>; Tue, 14 Feb 2023 16:12:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A583110E907;
	Tue, 14 Feb 2023 16:12:00 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 417F610E907
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Feb 2023 16:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676391118; x=1707927118;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pgDuCvYZkYMB0oNJ/DqPQDVGwyBwA0REjep+y/02Bbg=;
 b=nvVw3GmvAKrvgmwjs4YZRDzU82tY4JDLfSj3/dsLGD+I2dMTQvIF6aG3
 DKvRPO0uP/QmrgM3mxWLi9kSgnphGta3H0aB70rHTwh6op1lhpNRdVPaA
 Mgkkv7KUD2cmg+AwK8LCOAtXFzHBweNTOWzqGGbdnJyT34/OBOT6olRDl
 8bqGFXeZYDYyh1kkt3KlwMYKXe0drXaovkGKApmq1xXw6UIvB5zzQR2hg
 GqTnKLCIZaILbd4ZSeD2NQ1xCsb5QlIqpfBTrXdqJi7IOppsotnJwypT6
 MZO6ov3Z+1Ofur/RdKgyh9dFdQ26N1IN164zAxUEsUYfIew3ASYSId2a8 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="333332365"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000"; d="scan'208";a="333332365"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 08:11:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="671265441"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000"; d="scan'208";a="671265441"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 14 Feb 2023 08:11:31 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 14 Feb 2023 08:11:31 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 14 Feb 2023 08:11:31 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 14 Feb 2023 08:11:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMDLfuXMm+a1oSAbntcOBRM2bThb2NJ+L+NKUkbIEXlwN0zXjMbfKECq8I7uW7sNwwcU9rWdfCXQ7hc9QSqaM79YZz2LawnTHPRFb0aZE3vkGARnL+SWQ+/GbmlIjbxc+99DK3qfMRY3vo40tKwCjq6LjK+Ze5PFLwQY6ItfS3qHBjHZcDJ/qPm5wY9wLrcT0K4JcrX8cncZ6WUfq/OIiiqHpKi3ULgzytXcQHGUS0DIRo2H82/XysfODijF8mxyyY3DvAkUOJ7y/OQVd8YWxp5+u5rRaDZxnDcSpQa8wxh6IN8SS6TEmJjhOHb46v5X1dJ3mOG5lYrM4ZquFY+J+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aPDlF7Qe9Tun03VyLJ/CAsjYNOJG8zuAgtEN+qT2n2c=;
 b=fiFLIFblStAcfjeS2CW3Shmp8yrIb4ES7Q50UFS+TtUUqOHgY2qVK6X7dO+eHI0AYd3C3jiQf+iSnLKB+Kkw6r17GqwOwk2EO2DnQeyVkBmdTWXCkRLPMlPPgZZz2wOLJ9jnjgMTnKFpP7heksf9/VmhZ16il0zw4/3ELIlijHdLQljrffq/79JGXpx8LOtm8f+KtsviZ3sPVYWHI55wkpNDw60aAl6XtqfiJ038knfblBZiGYCPalyXw37WQq2vOguEm7X2OTkJd9JB2rpg7LafILP/LyT08QDhfovO0wn1/F1a6gInKFPPkUy30w6LD4iUzxdFi4z7WfHxIT68Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB5224.namprd11.prod.outlook.com (2603:10b6:208:30a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 16:11:28 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::593:877e:dd33:5b7a]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::593:877e:dd33:5b7a%7]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 16:11:28 +0000
Date: Tue, 14 Feb 2023 08:11:21 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <20230214161121.6t4qmvcx6fclzcmn@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230214112136.162380-1-matthew.auld@intel.com>
 <20230214112136.162380-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230214112136.162380-2-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR03CA0241.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL1PR11MB5224:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ad2dfe6-e383-4b80-d430-08db0ea620da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OpoaNzHDt/P659AYG5RlsG0Noy9yeoQC1TGTHYNc3VeNxVjg+5h03tOw6T/fGhf6tx2BcKDEmlntyQu13gzHRzUdN2Eq9aL3EHEpSn8EDjg4O5LvNkXryemB8/QZxZDIBjNwHJVYnHmVwR/XnawbM4XUmUkIT87l8335zyoX6CgcGjxAILrIgkSNo4s8hIpu+cvMT6FsvUm7qI1rtMlsUrG8ktGlHt6YXrw/szoq68XLeURUOzytBK8/KOKnzwXBd/X/Cw0AMlvBARYIqbrAS6aXtAig20jjz731J+2+h/LEgiXPjUnNrQdCOLbe9e6ssTt+G4J9lSQSYTL3weHI1I11RA+NtlbbqIbIp+cpVeUhIiJY2wjEd9Z/yKIiLVh1pP+BWF161OIUkiCeZJwPhQmNDIbVW6V56Jy66vtvAoMU6+Sf9WGD/MyzP3aEsTPwPDIGBFbou1Guk7KnBzYJlikwb0BHwkUgJ5b1X+CjgUScammfcQS16W6l/2DHpMt15DKos/9vXaNM6TF2jy1Iv690I0TLrXzkUtSauibSupBw5cfLGNDKRemrIyrlQxtyMhB06iLibamqTLX1eUpMp5A+vDNlSrIWq3/wAyMiw2I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(396003)(376002)(366004)(346002)(39860400002)(451199018)(26005)(36756003)(2906002)(5660300002)(186003)(83380400001)(9686003)(4326008)(82960400001)(38100700002)(8676002)(66946007)(6862004)(66476007)(316002)(6636002)(66556008)(41300700001)(478600001)(6666004)(1076003)(6506007)(6512007)(86362001)(6486002)(8936002)(966005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UMnFpALNqpwNl2CcJeJ80XfIjyU8Ny0CtMegM16qA9l+godpSdl5Cvg0IRZ9?=
 =?us-ascii?Q?MHKDWDr5r4GNxsvWf1Th3lilt7MU38eLxGawutEdNRrJ6Am2wtNG8Wo0EGRm?=
 =?us-ascii?Q?fXm7/vTTzJIACwEoXEtOY6naVYaZshX6XLaryEomUK/5zngFNF6/Y9B0vhcG?=
 =?us-ascii?Q?jx07rE2VedXje9u3ZPTSG/qTMtAZQNpd/+Gu70xubssdg+hrAnKngd6JRDZ9?=
 =?us-ascii?Q?5kLPwHbUcEMNvmAWH0eujj9Z4r5OCNjBJYRXrQi04R6Tc+WgQzcUAGbJ8ztT?=
 =?us-ascii?Q?NASSB5eYf10IhMLerlNSxqBEO0IQclDcO1kByPDpWFAv9Q4gqUQ3L5oG2HW2?=
 =?us-ascii?Q?khTaNQN2MfifXaO8xii/2bX5gXDnNORzPLnfz8V2Ktz9mJxTjudmeUB3DKFJ?=
 =?us-ascii?Q?bPuFbLmFamE8qBbDmJ9zoo8Clli5JyPnF8iL0l7RKf6xk+vQ9osJWsGLTxFJ?=
 =?us-ascii?Q?pE9051BTd+bWXwoYHBUveOnSpSActnlJms4bvgL+4654RihUFwoE+KAszrN/?=
 =?us-ascii?Q?DLZmbyBz9Db31JgzMhmUf3TbFkYoyDIsuljBoFWVt6pbUGMhn0zN19e7Td+c?=
 =?us-ascii?Q?B/zeUcb/5XJ81us4kduyb3FL39mlBrouL/zkydESw3PTNxu9HhnRHhJ7QPFP?=
 =?us-ascii?Q?NCaDN19TOakXAZ0hfCxkR+Zfs9mCdtlxuVFyHNmip0iwNigZeZo58ivcFGyE?=
 =?us-ascii?Q?WpE2PLMYkvJPntnkoaf62MnTRD8ddS1E+KRv5LPXNCatd+Q3P7rHLwl6PZGP?=
 =?us-ascii?Q?Xk3taIdv+wVo1X7MpXMDIEcS6Sk4dlS+L8sKrNPbRZyO2vbH0iCtHKh9n8EI?=
 =?us-ascii?Q?Fkzvu7LZka2DRQ/D4BweS0BtT3PTDx2f9MclI5Jqeuwv0MQmWrlQsfpWhVl9?=
 =?us-ascii?Q?0xRKMEm8pPfaYBfC+wgzwpLIqZe+0cEz/Mq5PISsfanc7f9ZEABguMyQm8dG?=
 =?us-ascii?Q?JgfyNIphk1Z8hMKHtACgPnW8+7dmA72FuD3S1mVjM9ZbI7egUxntg9RX6y3S?=
 =?us-ascii?Q?4Ad4nM0QTE0LNDqF5jE4aIPt4YYskOR+satk+7eG/tLF8KSaZU39ecachAAr?=
 =?us-ascii?Q?yRTlxG7VTt4DiDIdAIkEr5YnT7WHRHypvLYzzrw4G6pOQlrecI2MAjKw3E77?=
 =?us-ascii?Q?UNfcTWjqhyg2KWP+XL+zdEqUouXx4Uj92qt2EaKtHD9NbOX91Mc6BbPqWO7y?=
 =?us-ascii?Q?YR0+bP1OdELSRBnxtBkKkm338zQXHyD6etg5rtBaY8zYWB8oHsP5LjAIe4eM?=
 =?us-ascii?Q?1oeOSKaX8PMwNopV0vw7d5Ww3SykF2vmoMZ216W/ym4XwpVMXVlQNLS2SV1t?=
 =?us-ascii?Q?CFc5Ui+XVZXS6SBj1+SS1zhMKj1ATgUpB8D8JYzKpbbJkut7F9aOXr3zdYdi?=
 =?us-ascii?Q?qPrrDPg0+WtlEDJpPKn4WcuGsu8p6rhB+ubIMNjxY3YPy43kjsT2Dw31h1h6?=
 =?us-ascii?Q?jZAY3u7zhQPxQDYu3lN+3VCRbjvlyr7ljoknEQP+cUdD1UDq4dm5Jy1EfhaU?=
 =?us-ascii?Q?VF0RDDWr4GIF4rCSGGBmKFwaW+g50AL/sms9fgek37ayRd8O5EA0zscymL/8?=
 =?us-ascii?Q?nA+HXIvDH0ndfItk+ju5hMp5CzNP1EbEi1Dp0Ngk0OobLkG++tvO20MMyit9?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ad2dfe6-e383-4b80-d430-08db0ea620da
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 16:11:28.3973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SF1PvYsewiwCWAq5US+FVe4QwkwDFgwXrs3yr+MfIyxkU6WVRA0NGY4jnkB5WSjy9PQD+cukHaL6GWKTacsQkBnVf7UtqBFGoPxJkc8IFnU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5224
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 02/15] drm/xe/stolen: don't map stolen on
 small-bar
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Feb 14, 2023 at 11:21:23AM +0000, Matthew Auld wrote:
>The driver should still be functional with small-bar, just that the vram
>size is clamped to the BAR size (until we add proper support for tiered
>vram). For stolen we shouldn't iomap anything if the BAR size doesn't
>also also contain the stolen portion. Stolen should still be functional,

maybe a sentence that for the known platforms stolen is on top of
of the device memory, so if BAR2 doesn't cover all the memory, it's not
accessible?


>just that allocating CPU visible io memory will always return an error.
>
>Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/209
>Reported-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>---
> drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>index b4e9c88644e4..e5a992ce432a 100644
>--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>@@ -150,7 +150,7 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
> 	drm_dbg_kms(&xe->drm, "Initialized stolen memory support with %llu bytes\n",
> 		    stolen_size);
>
>-	if (!xe_ttm_stolen_inaccessible(xe))
>+	if (mgr->io_base && !xe_ttm_stolen_inaccessible(xe))


what I wrote above made me think:  shouldn't the check for mgr->io_base
be in the xe_ttm_stolen_inaccessible()? or should we differentiate
between CPU vs GPU accessible?

Lucas De Marchi

> 		mgr->mapping = devm_ioremap_wc(&pdev->dev, mgr->io_base, stolen_size);
> }
>
>-- 
>2.39.1
>
