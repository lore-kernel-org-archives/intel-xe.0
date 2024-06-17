Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BAFC27C79
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 18:50:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D902E10E4BB;
	Mon, 17 Jun 2024 18:50:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BeHiczc0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 616ED10E03A
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 18:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718650235; x=1750186235;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2EroBUS/bJGZOq5vajfDU67sw4jsXZnxd9xQIk+Jvww=;
 b=BeHiczc0U9XJLNegjiuIbTA+pOLhgHFuUxgNAIyYnGNBYt29bCzKUiew
 SU21YW7klHaEdnQI/58hAcc2Zc8abhNF6ZNnmPHMpueyFEUY/yUIDas6l
 UuiK9yR0GaWE28TGO01rXP/V6la2Hp2G59St4xiVJwQfcYJBJIy1yTpRz
 xWK5QH5gCtKhgvKmchu3ndmwko/POzGSQA3kT4Gv1fMRY1omnRHlwDw8L
 +/6IlvJtKHkIO9Af4jrBMad8fELqEGPQPZa5mKl/SE4rV5a/3A7fBvYTW
 5Abnfrqp8g1npYmlwT9gtrj/AG1MHHq9/qfWrG1jvb+KDINv2K5pb2GRY Q==;
X-CSE-ConnectionGUID: 1w8YcROFTdeFZhkBCal0eA==
X-CSE-MsgGUID: 6Fjx1JxpQCynAOOfeWGhAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="38016342"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="38016342"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 11:50:34 -0700
X-CSE-ConnectionGUID: TmckAyTeQmK5wMTmwqm6CA==
X-CSE-MsgGUID: ZqD5jLajTGik2Ykxqb48dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="41373203"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jun 2024 11:50:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 11:50:33 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 11:50:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 17 Jun 2024 11:50:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 17 Jun 2024 11:50:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=abPKYzd8CI0ZaRPHgnsRh7RyThuoFNGQMgPTJYto2r8K28i8kwWWJTdx6RpfDul5RfLwEYqzcapuJVvXwgil9S4dZyth/f4Rd8n1rUBkmNvwJJHdQF6xf8uGCVvVK9UIVrIsMMVBO9cWNtLLE10YVLLm8RetQhjvGF4HB3WAFYgZmzm1FjfBbXWtCxIYOY2oZBaf7pRFaoBrI5Wg1mp2L0M67MAWed9xKa990o6QaxCDWP3NLxxr/1r1hbdXcEDoYZ3zRtFwC4xGDOeHkldR0gLgZZKlWzNe+r5Qvc+tncP1zm7R8tk2egq9S6wU0Sl+mMrr9A7EtwK6wAo/DgswZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yyx4n4dIE/UwMRly5rkjvg0P1/gNgUBs3hCzCH/6FP4=;
 b=e5bJbZwXe/Ob8GMs5DvzLM/JXomqlgPgjhFI5fWeLV5GFeeOxM7Tx095pcI0Q0JJH83sYTFK0IHb5sKpvkxFXQwGafAQ0UYkzH7fOE1Ap+DmyQdlGlPFW20wZlc+iShQ2LMFWpQPkyJmyPnCOJ/J0nq0nen+NDv4gJ5xFdAHmRQ9cWPXnuqP3Ft86UHVbajD4YcLObvaHMUwCQXI5ov0I9/hXVZykj+0CPveSRV6uClI5EsrS+KRfaNDLuVwWREumLuTjDHu/iarZ0kQNRn9lu1yKJVx3B2MNxrIixjVXxllvoLaHMB+cMhXuYaKvGORHUJGKScKV+fOrsBwYvTivQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB7997.namprd11.prod.outlook.com (2603:10b6:8:125::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.27; Mon, 17 Jun
 2024 18:50:31 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 18:50:31 +0000
Date: Mon, 17 Jun 2024 11:50:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 1/5] drm/xe/rtp: Allow to match 0 sr entries
Message-ID: <20240617185029.GJ2906448@mdroper-desk1.amr.corp.intel.com>
References: <20240617182518.280975-1-lucas.demarchi@intel.com>
 <20240617182518.280975-2-lucas.demarchi@intel.com>
 <20240617184914.GF2905419@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240617184914.GF2905419@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0P220CA0023.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::21) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB7997:EE_
X-MS-Office365-Filtering-Correlation-Id: dbb87245-726a-4c28-bcc4-08dc8efe5d08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?k8JrAmPZThN8N9VW+gC9j/EvzloW63cr4+F+AKDVusnAcqbl46jDMQonSc3P?=
 =?us-ascii?Q?WamLzzF/X+diMMlxzyhqQBo6cZs5WbMh6rMH9aCrch5LusWEeHNcqE/R4aCJ?=
 =?us-ascii?Q?DO5om1w+SfYC3r/bV9SLsFILZu4Id0vJ2ozmjRRiWcwxWsu/MqpgNSkIPqPC?=
 =?us-ascii?Q?BYMsPtV9H5I9rbLlIB3L+z+dlN/91ryJh35DvjcSGDKH9hATX3f4zVJM30HQ?=
 =?us-ascii?Q?jNHEAMw1zJciHIaK2pwo59uBSamQZhkpW4/3uJYI/dEb87rnlEr+89Ukx+Ww?=
 =?us-ascii?Q?aZzMau4ePvVm81c0KAsNmJ66vt0SbPCjk7FeAcjryt1glOL2z/jXKThFpWLr?=
 =?us-ascii?Q?0sFkBKCLDI6VegOlU/EjFGxgiU/2AtoR1wYF5Dhrr6II0EQk49rAngz8HZRc?=
 =?us-ascii?Q?GfENj6HHvsAU+7C3BhN3uQnzAwh/l0bP94Pb0p0elwx5tGUzaoSRuzzsN9yn?=
 =?us-ascii?Q?+DCnNrEviB/skjr8hsFLHt4mM+6NMkcqRVC3V8RKnX51nVJgqypOUDNruQ0R?=
 =?us-ascii?Q?CZSlb5CDMA2rpZlsP54I/3DdvBBfyEnQa22a4S7RovuVGeHI0sCIj0OVtuz8?=
 =?us-ascii?Q?osg0/rzDmu/mkDc7t7IkMTR8bAVqbpQ1P/uJFxtwVTVRn+XUHZws5L8G/fde?=
 =?us-ascii?Q?Sm/TOuqe8AmVanxZmrvr2YDPPJdVyvuIG2c1OH75OZ4m9mYN1NsdWxOLQHqV?=
 =?us-ascii?Q?gaypebRx6Np/PxOp9wqK0TaNQ8p5+gAYiSBWSa6X4blzixyYfm8EFmyLU4Lf?=
 =?us-ascii?Q?4q9b/M+2NQcPBgvLjMH+E1sTgkxJWpAvRSzjOa48sZhq6y3DjCTUnEVf/p+Q?=
 =?us-ascii?Q?C+oVsxCANt9HxZxivdnHaFHTdSou3cdf86PqFqzb7PDgEGTeTihW63t9XNNk?=
 =?us-ascii?Q?h5l0neBVzg7lyDQop0HfpuPb6r95KGXj1Oi1on7rW2kidQcL4o0fMR928SYH?=
 =?us-ascii?Q?okk6yklV0z8FKTKIKBiQDJgVRbFfZbyjg8KX1ezjLdCUhfcMAsiRkmJThX5h?=
 =?us-ascii?Q?S65g3KTr+clVwD/ZLLigBCKfyI0aIR5uSbjGWXBnR7Xspu8FrxRadL6x2HsJ?=
 =?us-ascii?Q?kW5nZm1bt8hqxu1FXVXiDUyi5u6jiizdJgXl/diR/Q0Z3IeAGhVMRA+9Ow9t?=
 =?us-ascii?Q?c3miHwo90qYTrVWzbrmrvUCGf1DfYs93cAXiSAeOCiBOqQ6uY8/ZAzDP0M47?=
 =?us-ascii?Q?HQAGFDadvGPaLipzCWuwmpu2FqCGUtSzk5mSO6xqJc81zqUwI7JOntgqEZ1a?=
 =?us-ascii?Q?CD1d4NBZcWp/u3GOA7asIomEzJ3NRWDFuJQjgoAf3+DoXIiBPeHeThSsNz/d?=
 =?us-ascii?Q?T9ngvh/BmScy8TCCu/gIW9rO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qZdZqeZ2N5pbfRFiywO8x7X3Tx2kwnfQka9f1s6dOVeCzXZyT6DSvpF0Hkah?=
 =?us-ascii?Q?bFjdtoLpWbgTHKjOlcVU3pxTi10S0pec+imY3XllznGoKRuykMlBl3pmTzyL?=
 =?us-ascii?Q?bhwtVJDTJ7tQxnobuHLbT12egf0VNlkZmBCVt8Mkvr2bF2YUvZ3zD9lriaVN?=
 =?us-ascii?Q?1TcRV6CpMKwL7NmZZBjxTQh7eZOMKt1GtyI6VhFqN7j5FNgtUIn+AQ03amvC?=
 =?us-ascii?Q?qqWkFDlxcVtlRJ2fYNlozQpCJ/Iep9KN0ZU3UsTfj4nqG3+FE73jvg4TKk/L?=
 =?us-ascii?Q?uCi+1TIMCy2+xKF2/1m0W1mTB7i3uLGs3K1NeyXsLmSnRDGs819Q0cKuP1yH?=
 =?us-ascii?Q?e4TRUay4WZmKeEohYoQ2hzGderJ8uaAjRLByHZWy17gXWDyj8xNSYwVbuoBA?=
 =?us-ascii?Q?Uu/vT599azlZmpXHZxs8d/tqg68ZLwJ1su9bmZ9PQYdZkR6zBEe1ewdX1XaT?=
 =?us-ascii?Q?49Djw8dUUVz+FIoLxhxKGZk/ieLk2n1CVrcmhJ5y1peI/CXFUtpLW2GrCU0o?=
 =?us-ascii?Q?0x9gOb+7AkophhlXCHoi72t0cTVYK+R00HGBNc+tK1mTUiNkfXRlD+9ZAwLX?=
 =?us-ascii?Q?3LOeN0sNbEjQCNpOsxb4ff/Q6iBcgTKkINKcLhNRxqkfWr2vVqNqXraHf40A?=
 =?us-ascii?Q?3Tyc3S27CSmuK1Viscugi2v4E2ZiRfYj7hcQ3xzv8/zncl8pW36NezCFi1HV?=
 =?us-ascii?Q?e80U1e7tvZlT8Yz+ARYBc4xAUHORd2HrssxlAeZy+h3fN1NfTAeS9RTjrJBm?=
 =?us-ascii?Q?B15Tujpky6CIgKTLtKMjQGxQV83b+5PEq1QXtr1Yen2zPttFpfdBEAsEXbk/?=
 =?us-ascii?Q?eTnThcZkHdFcMDf1gcs2ou+LD4JVG2IXUW+U//BOyHlS+/Iwqx9oj347p0cI?=
 =?us-ascii?Q?s9E+zYaGmmIzDr1RZtAS2lYic5t5KZ5YfxWlPLh/skymjXIGuqMm19Hl8mOS?=
 =?us-ascii?Q?7+p8QwCpabkkDAhFoacIy58YxoRBvgK5pQ+2sS4wZaSf3BAnYEY+q5VkYJpj?=
 =?us-ascii?Q?sWHf02TJv6vSFIMTldTKUx0QkhXx8UIBLwUzMHDIJBVaKk221IVoz99jsjDx?=
 =?us-ascii?Q?3eoBhQc9WLO+YBeHMek1xImvmEVtOcTLFdJe41D/UKXpbnemdroB0j2AxvQA?=
 =?us-ascii?Q?ODm3S8aE/2eR2LG7kxOQK330rR1a4BjZcUwYMkZv35ixcFNXYsz2+sCUrkNW?=
 =?us-ascii?Q?biOVNf8zsMAOlbielYmdQhTFTcQELyCF7ZfSuRC3WS4DH0woHxfMfqCiafo7?=
 =?us-ascii?Q?YqZMNHRy0q71g0qietIAM9yLB22CWf/6bgJT5wXkBpn3FlWcTNt9EE9viann?=
 =?us-ascii?Q?jDg+gOWCfI9qB+uMQ0kNbHzXfLLfD1zrb3wzvxsLu9r3kjNtBuILdj3GHFPW?=
 =?us-ascii?Q?doekYBDky71m03/ACPcLjo65k6imE8y/ljddFeQHbkDzxRNY569uzCFj2Bd2?=
 =?us-ascii?Q?jViVONk/36QnIHjh2og8IwJTX+Ye1hHJ7H3gLVWiyfQBhqZ2f5aaqzvUKuND?=
 =?us-ascii?Q?cMJj+QEPti1eY49cTRG01wkSNKSZrcCFpyl1HR0sXjBQVGbe7HwDJgjC/Wti?=
 =?us-ascii?Q?9W32UD52D6jeFSgbY0hg20QI5b4PZ0XpE6zJt/1M7Ts5dlrB03dcExX7oqFA?=
 =?us-ascii?Q?aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dbb87245-726a-4c28-bcc4-08dc8efe5d08
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 18:50:31.4512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OCuiZn0fTbA7T9DuFtDbGjbabC7B8QNyLORplXtJbQMetLKxdR/UkSdBOcbs61LEAIj9VQ8A+qYCcVSfmgUNnIPSxnNTgL4m/StUcz4ecGg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7997
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

On Mon, Jun 17, 2024 at 11:49:17AM -0700, Matt Roper wrote:
> On Mon, Jun 17, 2024 at 11:25:14AM -0700, Lucas De Marchi wrote:
> > If none of the rules match, there should be 0 entriese in the sr xarray,

Oh, but there is one typo here:  s/entriese/entries/


Matt

> > so none of them should have a register matching.
> > 
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> 
> > ---
> >  drivers/gpu/drm/xe/tests/xe_rtp_test.c | 11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> > index 06759d754783..474a0b222ce1 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> > +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> > @@ -255,9 +255,14 @@ static void xe_rtp_process_tests(struct kunit *test)
> >  	}
> >  
> >  	KUNIT_EXPECT_EQ(test, count, param->expected_count);
> > -	KUNIT_EXPECT_EQ(test, sr_entry->clr_bits, param->expected_clr_bits);
> > -	KUNIT_EXPECT_EQ(test, sr_entry->set_bits, param->expected_set_bits);
> > -	KUNIT_EXPECT_EQ(test, sr_entry->reg.raw, param->expected_reg.raw);
> > +	if (count) {
> > +		KUNIT_EXPECT_EQ(test, sr_entry->clr_bits, param->expected_clr_bits);
> > +		KUNIT_EXPECT_EQ(test, sr_entry->set_bits, param->expected_set_bits);
> > +		KUNIT_EXPECT_EQ(test, sr_entry->reg.raw, param->expected_reg.raw);
> > +	} else {
> > +		KUNIT_EXPECT_NULL(test, sr_entry);
> > +	}
> > +
> >  	KUNIT_EXPECT_EQ(test, reg_sr->errors, param->expected_sr_errors);
> >  }
> >  
> > -- 
> > 2.43.0
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
