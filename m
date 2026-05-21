Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0E6CD5BAF
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 20:43:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E3310E630;
	Thu, 21 May 2026 20:43:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ElxMh33/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C4CD10E630
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 20:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779396183; x=1810932183;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=rgnqtRlur2dk1VGfxrv2ZoOG/7GJacH6LlFeqS6rOqU=;
 b=ElxMh33/7g7NQztEcmQWuKKKyNOXMreYWnjXQDXKDLinMRKFk/jkriC7
 356aFQcUJpNf+HJhyo9obD7/LJga25h7uuXuX6/LxcZ1EmILW4M3cVXEO
 CesIpAVkUyorMQbxp4nNQPu9ojEJu4QZXbzhjxA8xJXFHz9k6xNki38OP
 TpTeq2HgHgFoiQlI7pbGEhtFQ+PvUGJRMSoFyzgXiGA1/sa42TtOYz6zk
 v42wW79H2pPPkhOvIugjE2wEKl1dnplnCRtGDFmqNo57uCfJYp1SYyV2Q
 b2I4ImtnCMrILrpElihURwHkr8uh0g5Ms5p8QDLbSE5Neb1I6M/kYcAgf Q==;
X-CSE-ConnectionGUID: urDh34ArRyOIoEZXL7I+Lg==
X-CSE-MsgGUID: EIiWrIuuSdOqYq8hYin+kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="105788581"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; d="scan'208";a="105788581"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 13:43:03 -0700
X-CSE-ConnectionGUID: O/SfCI+aRB2SWpAHOI165Q==
X-CSE-MsgGUID: S/6tri/jQWSrG6CAzMkbTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; d="scan'208";a="270999211"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 13:43:02 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 13:43:01 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 21 May 2026 13:43:01 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.32) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 13:43:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KXShAIDNxxske5FhKa0dfcP0Mos+F3thip7cB/s0Y7/P6vXuKUUG0WDb5mh2uf7cbmZy0noeOCmxTXPAdk3PHl+tWfmCj4L/3ZCQUbex6PxCtgOjWmp1mB8i9Jrh8CjVsnxXavoOI7gpCrrzBwGBZ99lGDT5q98UtxC6uqeGU9LfwCDsoCiW43TOScZ19NKgFMS8LfOuK648sLyNbTSSu5TmbhzxZirIjO5E2HoWNQQugUIsS1Q1B1j2aZWLaV+WrcHErBCqpEjejeJsGB45j2C/UaCy99OxnlE+J35T2Ezdk0xUNTZy0kBxjQ3SoPPWAjvIDz2dzb/ZNXNfdZtn6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BqctfazNf7wf8LC6q2vKFwC3WyVM4lNF2zKCyBEwq+0=;
 b=T6JqKhx9c3IgetyhI2EKjlHQSHoC4lhdxQaLxVW+TayzT6R7RLtWdkD7D+F4+apuLUPgNXccMUgFHTPDB5maUcEVTf4khMassrQ4Ytp03aEOhg194uTxJCqyJwzY0jhP4ykjR5p9XhnETvANoyDr27r6sD3vXikY/0jBke09g+16416BCIuqOEkPEqNDg7LYDLUVSW1oi8piqT+aYLliD5QLe+ecNbuMZ0IccWGIb+MaVVqE1hbMEVrL7lBw35RuOKR3ZNkwfApGd8NJkHrZg66d6cu0/7xzz6fpeoAzvARnhaE9pdKGqLTbPfMWzKvV0D9Lv4g8Yf5GRE9W726Dpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA3PR11MB9464.namprd11.prod.outlook.com (2603:10b6:806:464::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 20:42:58 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 20:42:58 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Violet Monti <violet.monti@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Violet Monti <violet.monti@intel.com>
Subject: Re: [PATCH v2 3/4] drm/xe/rtp: Ensure oob_was does not evaluate
 engine type rules
In-Reply-To: <20260519193216.546048-9-violet.monti@intel.com>
References: <20260519193216.546048-6-violet.monti@intel.com>
 <20260519193216.546048-9-violet.monti@intel.com>
Date: Thu, 21 May 2026 17:42:54 -0300
Message-ID: <878q9csddd.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0025.namprd10.prod.outlook.com
 (2603:10b6:a03:255::30) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA3PR11MB9464:EE_
X-MS-Office365-Filtering-Correlation-Id: f4412b90-5d6d-485f-7f77-08deb7798b1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|4143699003|11063799006|22082099003|56012099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: Q/7RGTggVt7lmszaRuCZF1ZhmUJba116b0yro+jsn/1+gd9WVJ2AsiwbmnU0sqn1ZYyUTpHAUppAku+TQbJsrLt4aToccV7ph32SvFzepZzo/yKxAb9tOsTv+kgrjke5uPvc1E+39jszFGiJ1ZCobHj4VKVZ1OTVHFYq2LqPWA5BZ0dvhbvxNk7oiaKMsiVfx+XqKq4oBWcYMBnmiSrpVkm7A3wOtTInXSO9H70DlT6zIQMpESD+d7bKaqTj713CkOGJxMBkao3M0DRbrRm9UjMwYrYX4WBwZctRWENJKyy/iTJ6BSUj5zwlwaptyF75e/9Mhd98Y1MRYRv3W4qKs+x0wJEqu1f6+nCnttDYa90NqDGqzZp9GCAGKUNWA+76nh1I9iVWdqjuC6tZ9BTW55GeW+oYED8644Ciclc19EbmXU8UAGyZPK2ysdBg5ZfkqF5a9FNBdatE5jIxKUihXdeBxbsB6Y2GDnsKXhLSir01Fk/kHH/92Og1Ar4GNjCnpLS6qUlwYKwUwQEKPI9zKmZTO1f9yLoNiLnKWb5jvfVUKcC5lhVdWImDm2np6Ql/RVH5X+g9KAyaIrmsjIFtlBq5P9KjK+r0gtXgsCfiCVk87wgPyZahAccQ1u8erNytJQ+pkTFD2GIwvaRRcfW1PjMIbTrRboHiGPdtDrQ9HMdlVTFxRIiKkU3JLFfLZLA8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(4143699003)(11063799006)(22082099003)(56012099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PSp5KUDNgYf2+Ux4VBVzc0V/Z58LKjWvZGdYpvAKTkDJynmezywYieKNtJuD?=
 =?us-ascii?Q?XM3cNGR6oPNIvEB31p+c1RTaRsfscT1Nhwjb4yfSzbTGXXm6VGMKY0yeUkYj?=
 =?us-ascii?Q?O2+YqRY3cw/0xqOaFmr2u1EaEQhOYKQAVqMxDQkc2V9cnylgY3mpUywAANa/?=
 =?us-ascii?Q?w/ZGHaVXz/7lAZ1J1883fz4kDijmKFMcdYWhiNQ53ao6znz4STL60ZYk/mAY?=
 =?us-ascii?Q?eYmHP/0sEGOEPnNu7F6O7jE586yE6ynlqFRMD+jHkKnUdm3gLqwu97ZY2Z3h?=
 =?us-ascii?Q?U0RyZfp4DzVDjcRvcIcvPNutFX4ezJAagSij6Mum5+/DKpMbUfF1OFYfffs0?=
 =?us-ascii?Q?RUhVkCrpTviuQ/UHkE7TYwi1qFw+ImWKP/ZlCaTWt8UX4NQ3J+OCrHZxno6J?=
 =?us-ascii?Q?/iEaJMmMCEpyBIDF9dga0jM31SrggxM1jwQ0CychbVZW5pqUaN5TwveNLlcR?=
 =?us-ascii?Q?AYQlfQG5KSXlpbDJ/4BEePjs4wPcuedk7unHzZhhKqFewcPKwOPQbu46N1p1?=
 =?us-ascii?Q?BJdmAmvjOhcKFqbV3iDeK4cWpZJ3fP/mxekTitRsZHd2PR1BnH87ndYpw8YZ?=
 =?us-ascii?Q?TQVHAJepwdFMjmFmLDaQYW52oIs25R35wNxx7WgztVuDTCTojlYk5K0PPdU3?=
 =?us-ascii?Q?u9FySZu/pf4XKN3y4/4cETSefq604onEQTY+1Y7ZB2femvrmDtYdII00cyFp?=
 =?us-ascii?Q?Kdw8mgGiht8UgPnjQC/8Dl83qakJ3SJ300rwEWz5+/jm6aONkkhc2shDeh8f?=
 =?us-ascii?Q?oO2CdrSTLHsYZ/TWCJ9wE0Fj+YdcTQtZS+ba5EMIBMlJ3btEGPVjNawfRkQH?=
 =?us-ascii?Q?Kqy3QPfMxjz9DjRrxth+arnZTMT9bZ4TZSa3rih1q9zrlZawvt3ukExX9G9z?=
 =?us-ascii?Q?3r6yeAWz1GuXRLOqQ4XbKg/fbFbFUtP0G6GlySTS0HvZtXm3YLS/HmuyVqwS?=
 =?us-ascii?Q?65CJkEBdTHCZsGtMel8pZpxEPJmS0jlo+0CytTcwzQq654rwaPr83Y32I4nA?=
 =?us-ascii?Q?P+xmlaKdVw02nxnqZsfA72AMiL4+A2siYIJoGk0bXKUPGdRPuVRwat/omDaA?=
 =?us-ascii?Q?EjcDR0c21xq9sUdhNgNsH0/04KkM6h0F5WcDORx3WW0xpwitTbyEzuInAGoT?=
 =?us-ascii?Q?EkiFRWC+WHN1YDLz+E0z27mcOcdf0rsVMtyBWt+YHuhdKpIBq7uketk5klfB?=
 =?us-ascii?Q?PyWy27q+4k0E20UY8geSEHuOd5lUQ1TiFDG64zDEJQar1hbRK+Iqs3X2pZtO?=
 =?us-ascii?Q?bNwTSrzJ7zLcKPmN0b0OqAtBz+RklVLqHfxkl8r5OluYvt4IfH6hsJOIeL4k?=
 =?us-ascii?Q?7F10sLLvTHzAJFFA4e8Ze21IWcWmXFfXslWCz/VOvmfC7CL4NMwWpJfzRxxj?=
 =?us-ascii?Q?kVWXN5kYDZ7ApFl3G6mBAf99Q9JWOzVAo5ADBYV+E2z2rabzP8T8o4KHccZS?=
 =?us-ascii?Q?Wi88BKJlTWfP5hqtV5XR916jdbro0LFI6DtizcahSwH+wp3fxmF0Rgn5R3FV?=
 =?us-ascii?Q?2QVRy9eI+H9kDsqQ8Bo7XpGS/A6esS6219FZj8wx6Zm48QEsEube6KqcVenE?=
 =?us-ascii?Q?T2c+cWf/jkPzVA3fjTvugmr9yDa3PQkUiVWRLtTS4a7+X6x3OcrYmghG2eBr?=
 =?us-ascii?Q?3Lnj12YXbDl/Ka2B/QnD9KXEVPEhZ+z65LxfK9qpFQQ/yS/XiLfz22acTOWL?=
 =?us-ascii?Q?k+aHZs/9NFntaqCA01T2cvC+7bw46+2sgV5Itz/9WVklJ+SYYCyrOvc4RGbx?=
 =?us-ascii?Q?3Utx2hKAFQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: Qt6X/e5/unzLRN/97RDflkScdkv3toFNQyAy8fz3rqFqDaJlUe3V3k9RYjYMN5EXLZFl59ZnMXZY1j8Snifs4CsnY69wImX4MoCpoEFJX/ZR+rxbpSC5gQk48KAdIVC8ixESIfSbqZveB0eb8lbhEEYsOx7xYM2PCObVBul1uvqzLZghd6cmKWljAzOJhVBtDDqSUqPfFnk9aWMnQjD7cRPAl3L5MFQO/pJEYLN3t7g8XJ43sLmpnvNEonM5kKof6xuySKCy8GlywuNOh20s7ey7u6h4q1xyQpp+07wO1yH7OCrKEVtf26kmhoby/wWpF1J5rpGCRuG86+CAT5cEpw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f4412b90-5d6d-485f-7f77-08deb7798b1a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 20:42:58.6715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rBNS38bOmr85PGUBztLVLmXhb8yPbTahCLl+8TzX8/er3RiHva0TXb2oCJJLDM2AvilAz9Og0RegsbpvCRcTUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB9464
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

Violet Monti <violet.monti@intel.com> writes:

> This commit builds on the implementation of the GT WA testing, increasing
> the scope of testing to include the OOB workaround list. The added test
> checks for workarounds with XE_RTP_ENGINE_CLASS() rules and raises an expectation
> failure if any are found. Unlike the GT workarounds, there are no flags
> within this workaround list, so all invalid rules will fail.
>
> v2:
>     - Changed xe_rtp_table_oob_test() to follow format of
>       xe_rtp_table_gt_test
>     - Changed oob_was generated params to follow format of gt_was
>       generated params
>
> Signed-off-by: Violet Monti <violet.monti@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c | 13 +++++++++++++
>  drivers/gpu/drm/xe/xe_wa.c                    |  3 ++-
>  drivers/gpu/drm/xe/xe_wa.h                    |  1 +
>  3 files changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
> index 01d2bc6e8aad..eb1b3ee075c9 100644
> --- a/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
> @@ -42,8 +42,21 @@ static void xe_rtp_table_gt_test(struct kunit *test)
>  
>  RTP_TABLE_PARAM(gt_was);
>  
> +static void xe_rtp_table_oob_test(struct kunit *test)
> +{
> +	const struct xe_rtp_entry *entry = test->param_value;
> +
> +	for (int i = 0; i < entry->n_rules; i++)
> +		KUNIT_EXPECT_TRUE(test,
> +				  entry->rules[i].match_type != XE_RTP_MATCH_ENGINE_CLASS &&
> +				  entry->rules[i].match_type != XE_RTP_MATCH_NOT_ENGINE_CLASS);
> +}
> +
> +RTP_TABLE_PARAM(oob_was);
> +
>  static struct kunit_case xe_rtp_table_tests[] = {
>  	KUNIT_CASE_PARAM(xe_rtp_table_gt_test, gt_was_gen_params),
> +	KUNIT_CASE_PARAM(xe_rtp_table_oob_test, oob_was_gen_params),
>  	{}
>  };
>  
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 1a1e04215f21..410099545f4e 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -803,10 +803,11 @@ static const struct xe_rtp_entry oob_was_entries[] = {
>  
>  static_assert(ARRAY_SIZE(oob_was_entries)  == _XE_WA_OOB_COUNT);
>  
> -static __maybe_unused const struct xe_rtp_table oob_was = {
> +VISIBLE_IF_KUNIT __maybe_unused const struct xe_rtp_table oob_was = {
>  	.entries = oob_was_entries,
>  	.n_entries = ARRAY_SIZE(oob_was_entries),
>  };
> +EXPORT_SYMBOL_IF_KUNIT(oob_was);
>  
>  static const struct xe_rtp_entry device_oob_was_entries[] = {
>  #include <generated/xe_device_wa_oob.c>
> diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
> index 17dff615e507..7ac6d365b65f 100644
> --- a/drivers/gpu/drm/xe/xe_wa.h
> +++ b/drivers/gpu/drm/xe/xe_wa.h
> @@ -27,6 +27,7 @@ int xe_wa_gt_dump(struct xe_gt *gt, struct drm_printer *p);
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>  extern VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_was;
> +extern VISIBLE_IF_KUNIT __maybe_unused const struct xe_rtp_table oob_was;

With VISIBLE_IF_KUNIT dropped,

    Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>  #endif
>  
>  /**
> -- 
> 2.43.0
