Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58EBC636D6
	for <intel-xe@archiver.kernel.org>; Thu, 23 Feb 2023 00:11:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99D1510E1FA;
	Thu, 23 Feb 2023 00:11:29 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE11F10E1FA
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Feb 2023 00:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677111087; x=1708647087;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xuLUY28+lK1aEfHOZ/Vq8EnWd2ykLZC/EOSFEDhZsbY=;
 b=ZZ0UKG4gbyG3/KdWrZ46sgEEPkg1swl7j2ZFCucKG0VCSriZwpkuhwFl
 vLk521sG8zpagRxkzvjx+s37t/9ZEdxZIXbAeVKfOL23BXmz/l8+zVQX8
 fKG9E8J3yCK2ZvI+fJJWnuwOhihlE6u+xGogL5olMWyRVyOCZp3cG+e7w
 UEE9hl9g5/2jphCq1iICX55ZUsFkwWb/f5OrMwM5Neq7Pxj5bPsvGULoZ
 cjDtkRaxAmchEhbQCPKqmCCIeww8x9SIwhmmonVl+Z77QhuBpzDAZL3NB
 eWDEZb9AQ5FWmLziXOpqMnphgBZ6oQgsCxzwB/HvX1tDPUdEy2QCvGvbd A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="331741647"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; d="scan'208";a="331741647"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2023 16:11:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="815116780"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; d="scan'208";a="815116780"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 22 Feb 2023 16:11:27 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 22 Feb 2023 16:11:26 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 22 Feb 2023 16:11:26 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 22 Feb 2023 16:11:26 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 22 Feb 2023 16:11:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=joNjBlln+L1cPGLicTGNXgtoRDRrZp4xuoB+Y8Cmtatgh0VsNMkbTVIae2cVElYvNkVyIyVX7KmR21tSuB1Ndaj3L+vEwzVmXjw1PGbVFeLLUo9XHCX22JKdJq0rAvkyi8YkhUcUBoxpCjDbPoJBGOSEhlZweff83/IxY5n5v75Ujd8qezaq0aIHiqcgSS4aafGKS/vtJwiMBYHV3AQGAfrjivMCDXxbL1t3P0et9zmfPicHexMEVRmjhalu2a8SFowxe+g1ymicogMKck4UwTSgRVWexwUvGMgROhh7vHZhroZct14zW1w1iqJGCUbtgUvKcUhR/yoGK57wSEYioQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MsULqwscB+kxQg37Vtlnrcjj9YZhTZ2rQvbSJQWcT8M=;
 b=VDt8f7mB0bniLO7K1trApYGrDPfQu0V8QWVRLkb3PaaAP+kKAWyfoeejsJ7AF4naUdNprLG4eJG1RgNdcd1gn4qVVdt7ZSiEPg6fBY3SkljMd9fOoX2T1e5Vx1I5/Lxb9qus0pKk/8FGwslPRGc0kZhWhi0WVA0J/GkSDmVduTlul1eaYowPQTmxGN33Jwf0UBH+n7e+I5igmY9zfZQrfGpWr3V69x3eOSRSwoGVX+M3871VaIo6162F+cUb2BSFgCxMPzSNQv08cfmFKHH3o40BvLWvSLGbXQ6InOXgDcJINTYWqty8KKyhL8mAdzl8BGvOzCkKiINguiqT+axubQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7098.namprd11.prod.outlook.com (2603:10b6:510:20d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Thu, 23 Feb
 2023 00:11:24 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%6]) with mapi id 15.20.6134.019; Thu, 23 Feb 2023
 00:11:24 +0000
Date: Wed, 22 Feb 2023 16:11:19 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230223001119.qgn6rhszleezyngz@ldmartin-desk2.jf.intel.com>
X-Patchwork-Hint: comment
References: <20230216231724.2246534-1-matthew.d.roper@intel.com>
 <20230216231724.2246534-7-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230216231724.2246534-7-matthew.d.roper@intel.com>
X-ClientProxiedBy: BYAPR08CA0043.namprd08.prod.outlook.com
 (2603:10b6:a03:117::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7098:EE_
X-MS-Office365-Filtering-Correlation-Id: 1589362e-6749-47f6-588f-08db15327f68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vFQPWD5z1z82LOxYe7BDfoH61CH7h+lM4yhyTsOnJVXPK2XUq7BlklRAkii/i+fyDOe4whRfZywRnhR0oTLQ7+/RfGvePu7PEG9McfCSjNUStHLJzrQpFYsoWi8je36FUzcSUSZfoTgjziDNwPo6j3PREaQjt9/C5kkgcuZkW2yY9bEs1TbvmTGgpt2USjXJguG+ln2w5VCiRjIUsMLbxQdNp5wxhnnizV3RsX9qofQsNgFwdwsUWyCVJx17j/q3smf8CSb1CZXXLGJk0KDh42+tDDXJQSPplLK7gk4+ZOnOS88ArWXc1ReovWTi5pcgX+gdgPiGzyWZaYYJArgKqjUb7kYL0X8AAUTzlh0liYIYiL3065qLFYPO0h6IaYaBfl7zAqvPtfx884nVzyxD/alcnKt3fjAzG8085iSWYfhxZ00LOY72aNoMosyZljZXuhTYeoAjtgHh1F/ingAGcXoYZ6tHf0I277XrkSVNrQw86++7hu+L/xCc6EaxT+eVhRNBOwUbB4sGNJbtIgtzxEhapDTz6yBT2DzYeSU0yCoUAEERF4nky4GUlDobsYYTpWmhgwNsA7zPWStmRP3ecoKB0FKbsckKyDzI6uqQrso8GFXI6EsHgcKYr1STbBYgbOt+KrsZZmtx/LgxPRa1sg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(376002)(346002)(396003)(366004)(39860400002)(451199018)(83380400001)(82960400001)(6506007)(186003)(38100700002)(6862004)(41300700001)(6512007)(8936002)(2906002)(6666004)(26005)(1076003)(5660300002)(86362001)(66946007)(478600001)(6486002)(316002)(6636002)(66476007)(4326008)(66556008)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v5PDcs9g6p6yHu31ew51RxkI2WGyoOGuWh+6aqiAlMjk7+/8FhSxaxYbwdOU?=
 =?us-ascii?Q?1H8tUL8MDtaSfiKLLFeQqamcByuSt9nbWowJgkxxmLZrqirsAOypVY2Jbi20?=
 =?us-ascii?Q?Q+0q4RLo80f5ugETwcQJVqfTgH4zFaU3rufRuQGgRM8VqZ/u/ORXKVgYBazL?=
 =?us-ascii?Q?NDpsBTqSrJBjmvZnGb421XqzFjCa7j2w2NI82CbfI7EdTQmyaBh6xW2uoXG6?=
 =?us-ascii?Q?ACFOsDZoszaPFQbDCoLJBeAZcGxKASGi+R04e8N0HdQiAFrYGeWi/iiPxXyt?=
 =?us-ascii?Q?pt0ag3ogzwjpPqWfXxpI4ytJsqPGzEQ89U+1eHjxADkIcwG2hG30+i1kVH69?=
 =?us-ascii?Q?TT5m5lKZu8nVaOBlBgHpMDb2pEwcq0vQEArTgLXelbhRQMeD1iUgeCkyu0Sp?=
 =?us-ascii?Q?RzUO6t8u/MD+uttCI1pGalrAds3Yr44hMr2962AF9niG8SgnrEDVteG/fk/p?=
 =?us-ascii?Q?6F9HiGAbH6ZCGC9TKkHJ5zKqn1hKld8HLp+dETEiz1w+bKF2jgLqfDg7Gbg1?=
 =?us-ascii?Q?XKGoJgKTcfcwPqTvJXtCzXxgmMnj6jg6V+9L9QckejinwqgPcmHfhD5WqRSk?=
 =?us-ascii?Q?TK7G/5r/1Epl7GuPpjO5f1N1JYPLR/SzgOVI33hvzf75f3wA/37xpJg+uh08?=
 =?us-ascii?Q?FLlWZSehraU2lDSehmvJ0cdQSKLC+Y3TX19JrF0xcdQmaERuw2czI1/WyJsJ?=
 =?us-ascii?Q?gbQjaIIXMY8Ohc3XL7g1OjB9uj1GJO5AA3qZamVFLD/6bxIAl5VcrT8BZQXq?=
 =?us-ascii?Q?u74cqlQNvo/HvbdJGOxNsLDvbBYB/pd/Re8yEb0j3cMrwox8jMslgqxdKwGu?=
 =?us-ascii?Q?lxhh+kqoCd41RNWliQy2ZR3bhlzZ2TGskq+mQNzgEu6s1gy6yrbgJZTRfyXy?=
 =?us-ascii?Q?RCWF3zfd678HgS2mTS0MYvY01V6jbpasI09Og4BYggqmKOgxtS4QbqNn/elM?=
 =?us-ascii?Q?lKBett6m/r9vNK7XOieb5UInDMVBe/LY67mlWQC9gdQi1zoPYlpx6jfBY4tu?=
 =?us-ascii?Q?bTuQYqJtx/AzPppZ9DowEqIPT9Ujzci+c4N/FGtXje/3hesiURZo6GFR1lxn?=
 =?us-ascii?Q?XDamOt4piGVybfSrDenZ+Qe9nubGKWRsatiK4Fi2M4ftiY1OdHR0yXtZrRU6?=
 =?us-ascii?Q?rQ4Rp/s6d8BnaMlSrh5V2TZzCzRgDOaNzuCXOKCTns7Mof67cddL2+x6jbO2?=
 =?us-ascii?Q?6e2nrDhzElP7FddJuc56QUL2dvhAMofX1n9mEq9wmyiGYbdZSv/QbilA3Orj?=
 =?us-ascii?Q?616sF/nBpiLdqXj7vSjEUR0tTA7xoP6P9Nw0XUrWKHVQGm+kJx9aNs6doJol?=
 =?us-ascii?Q?BgskhR+A0o+pZzne4dCQd0eyj6Pv4gxLOeBUDt4Puwjjm9BqeKjv9V8yr3sI?=
 =?us-ascii?Q?PBppFLS5cw2hVnWLgRRrus+i0A+J1R7QSGCqK4fdIowVQ7xBYH/SeZb/6G9I?=
 =?us-ascii?Q?VjXd4XhVzgK1UPipu8NwxISQdcZs5M+qdpecVXNdHeDmRmZ5TdyMT3MdnB3c?=
 =?us-ascii?Q?Zum4t+YddsSYtpCzXz361Ao/SpFMRALrWgrZu9lMxwCzaMrRWZM4V+fGUunp?=
 =?us-ascii?Q?xoHq0Mbn2EDOf8b9tc9LW6RPhS34Wo/pEnItAx/+Q+NHRMh7J8PEOBuRuwnb?=
 =?us-ascii?Q?ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1589362e-6749-47f6-588f-08db15327f68
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 00:11:23.5962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KDQW1zcROPIY+BfuldD+0jIL3GlRprq89M37KJ04IX2vin3dMGG/t1pl3Wc3qadK7RCTIoYMYfXbmMxnA8ZpnstvM96v310RORo2nbp92Uo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7098
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 6/6] drm/xe/mocs: LNCF MOCS settings only
 need to be restored on pre-Xe_HP
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

On Thu, Feb 16, 2023 at 03:17:24PM -0800, Matt Roper wrote:
>Reprogramming the LNCF MOCS registers on render domain reset is not
>intended to be regular driver programming, but rather the implementation
>of a specific workaround (Wa_1607983814).  This workaround no longer
>applies on Xe_HP any beyond, so we can expect that these registers, like
>the rest of the LNCF/LBCF registers, will maintain their values through
>all engine resets.  We should only add these registers to the GuC's
>save/restore list on platforms that need the workaround.
>
>Furthermore, xe_mocs_init_engine() appears to be another attempt to
>satisfy this same workaround.  This is unnecessary on the Xe driver
>since even on platforms where the workaround is necessary, all
>single-engine resets are initiated by the GuC and thus the GuC will take
>care of saving/restoring these registers.  The only host-initiated
>resets we have in Xe are full GT resets which will already
>(re)initialize these registers as part of the regular xe_mocs_init()
>flow.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_execlist.c   |  2 +-
> drivers/gpu/drm/xe/xe_guc_ads.c    | 10 +++++++---
> drivers/gpu/drm/xe/xe_guc_submit.c |  1 -
> drivers/gpu/drm/xe/xe_mocs.c       | 13 -------------
> drivers/gpu/drm/xe/xe_mocs.h       |  1 -
> 5 files changed, 8 insertions(+), 19 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
>index d555d77cbf49..fd0ebfe7cae3 100644
>--- a/drivers/gpu/drm/xe/xe_execlist.c
>+++ b/drivers/gpu/drm/xe/xe_execlist.c
>@@ -462,7 +462,7 @@ static void execlist_engine_suspend_wait(struct xe_engine *e)
>
> static void execlist_engine_resume(struct xe_engine *e)
> {
>-	xe_mocs_init_engine(e);
>+	/* NIY */

what does NIY mean?  maybe "nop" is more common? And... what about
the execlist backend staying without this? Yep, execlist right now is
not very functioal, but should we be intentionally breaking it?

> }
>
> static const struct xe_engine_ops execlist_engine_ops = {
>diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>index 0c08cecaca40..a233023a6616 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ads.c
>+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>@@ -430,6 +430,7 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
> 					  struct iosys_map *regset_map,
> 					  struct xe_hw_engine *hwe)
> {
>+	struct xe_device *xe = ads_to_xe(ads);
> 	struct xe_hw_engine *hwe_rcs_reset_domain =
> 		xe_gt_any_hw_engine_by_reset_domain(hwe->gt, XE_ENGINE_CLASS_RENDER);
> 	struct xe_reg_sr_entry *entry;
>@@ -464,9 +465,12 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
> 					  e->reg, e->flags, count++);
> 	}
>
>-	for (i = 0; i < LNCFCMOCS_REG_COUNT; i++) {
>-		guc_mmio_regset_write_one(ads, regset_map,
>-					  GEN9_LNCFCMOCS(i).reg, 0, count++);
>+	/* Wa_1607983814 */
>+	if (GRAPHICS_VER(xe) == 12 && GRAPHICS_VERx100(xe) < 1250) {
>+		for (i = 0; i < LNCFCMOCS_REG_COUNT; i++) {
>+			guc_mmio_regset_write_one(ads, regset_map,
>+						  GEN9_LNCFCMOCS(i).reg, 0, count++);

calculate_regset_size() unconditionally accounts for
LNCFCMOCS_REG_COUNT. Although this is just a "max", maybe we could
remove it from there by moving the if condition to a function
bool needs_wa_1607983814() { ... }

Another idea would be maybe to extend xe_rtp to allow a FUNC() not only
in the match but also in the action. We'd also need to extend it to
allow that function to apply the actions. Humn... if we need it more
than in just one place we can do that in future. For now this does the
job.


>+		}
> 	}
>
> 	XE_BUG_ON(ads->regset_size < (count * sizeof(struct guc_mmio_reg)));
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index a54f7f82d04d..3766b77a0d90 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -1267,7 +1267,6 @@ static void guc_engine_resume(struct xe_engine *e)
>
> 	XE_BUG_ON(e->guc->suspend_pending);
>
>-	xe_mocs_init_engine(e);
> 	guc_engine_add_msg(e, msg, RESUME);
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
>index 3b48934d99d4..7e495d699295 100644
>--- a/drivers/gpu/drm/xe/xe_mocs.c
>+++ b/drivers/gpu/drm/xe/xe_mocs.c
>@@ -507,19 +507,6 @@ static void init_l3cc_table(struct xe_gt *gt,
> 	}
> }
>
>-void xe_mocs_init_engine(const struct xe_engine *engine)
>-{
>-	struct xe_mocs_info table;
>-	unsigned int flags;
>-
>-	flags = get_mocs_settings(engine->gt->xe, &table);
>-	if (!flags)
>-		return;
>-
>-	if (flags & HAS_RENDER_L3CC && engine->class == XE_ENGINE_CLASS_RENDER)

do we have any other plans for HAS_RENDER_L3CC?  It seems it's not used.
For any error handling part we could check size, table or
unused_entries_index


Lucas De Marchi

>-		init_l3cc_table(engine->gt, &table);
>-}
>-
> void xe_mocs_init(struct xe_gt *gt)
> {
> 	struct xe_mocs_info table;
>diff --git a/drivers/gpu/drm/xe/xe_mocs.h b/drivers/gpu/drm/xe/xe_mocs.h
>index aba1abe216ab..63500a1d6660 100644
>--- a/drivers/gpu/drm/xe/xe_mocs.h
>+++ b/drivers/gpu/drm/xe/xe_mocs.h
>@@ -11,7 +11,6 @@
> struct xe_engine;
> struct xe_gt;
>
>-void xe_mocs_init_engine(const struct xe_engine *engine);
> void xe_mocs_init(struct xe_gt *gt);
>
> /**
>-- 
>2.39.1
>
