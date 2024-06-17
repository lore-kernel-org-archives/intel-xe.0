Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC891C27C79
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 18:49:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82FE810E03A;
	Mon, 17 Jun 2024 18:49:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YNUy7+sF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA0FF10E03A
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 18:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718650166; x=1750186166;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7roNBCQB0CkgRtfIEd3pPmvwG3y0LeaL8VX1TgoyauI=;
 b=YNUy7+sFz1SH9GXSd5puC0dQg9RZLgZHRr6mQ3btCm5DJYAS3wB3GyJN
 mbm8SQN25+mYNDoeeFhN8PtVF9KmkrrdXkn6rK6IiokmLQEyHthzgMq7C
 n8n1OMl2o7Z2UrBYFwBbm0CdjimphTSpPj30Zrn95edpIa04OKF98oh30
 cBbKoYJ99ij+R/NY1/qMOQTvi90tGnLQ6zTO68R8EBlTzPyZLAELYkytc
 Y2VhyBemWZz6BFc1Ez1IRdnLq1JNDE8oJ13wX3R4zLWqkxOli9vDJj+l+
 GPY2N6OZN6oaiumvcMJl9+47d2niuLjhJ2Wow7cFZ2Y6eVcnpeLDzH6SE w==;
X-CSE-ConnectionGUID: uOWIY/N3T/iPtCMOrcMP0w==
X-CSE-MsgGUID: 6h1ztoSuS5uDXcI9nfDjbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15727464"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="15727464"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 11:49:26 -0700
X-CSE-ConnectionGUID: RZXDnW4kR4W5X0zWzUiH2g==
X-CSE-MsgGUID: jesn/nroT/W85V05bseacg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="41214680"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jun 2024 11:49:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 11:49:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 11:49:24 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 17 Jun 2024 11:49:24 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 17 Jun 2024 11:49:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RlCuEQMTisW69JEQe0qgDMPsB9dIjzrqWoH2oSCPE2xFZCS/nHKoE+zPsAdxKngpbeVaspAo+NWxyCxsFX2kGdJ3SlG13TQ4feWm6GBhVwXdHzMQVYyDGjrEqw12HXjzY0aZU9MkjRl0+JVXJkNgbTTi5zEfYoPOMUgqsBHA36FnAYs3ZO3dNr0rSeWfl8dOrPHuAWXny6lEmS0ygZttxM/euY/9xOmnrp7J0g12R+dd8sfmmYP61v+Ryo+utzwGLECZv1oaB1AJuUON8qvme72dFVUzFRvzMGNOAQPZELRRBREDJ+OvE0psHoCT4Zo7qfu8yRi3NcEjfw2t8EwIiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QuSMbJ1H+DotoeYbi2sRmqUulN7ld5Qf5W1pkJ1uRAU=;
 b=k2Mi2EXEI0wG6Wn9xSllyKNiKl7i2RAtHdwytT7fY7m+Lnvoaieb3KMpn0JQW44q9kohvKu12rml3umjMwVPlXsTnIkUfm4OsraRm62zaMIjiGxAUm53AIcYHQiPYke+qhV3DAKSU+WkPYMfChvYb/YOuVdFw+K8Osk2cmX6bsWQvwPSZPXvTqGOPK+LS6ueJnSXHHOLC9/P9Ln+XjmG+bSq3wTO5etcJU0LoTTYsnTj4IH8ua/J6iAnGHNoL59J7xVZxZfkZQtdwel+x+kKg6MP/u3MUbh9g1dzyfnWwcF03e1D+dGpicxFoF7ojjWH2vSEY3UzkPum9nvkV6g1Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH3PR11MB8751.namprd11.prod.outlook.com (2603:10b6:610:1c1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Mon, 17 Jun
 2024 18:49:17 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 18:49:17 +0000
Date: Mon, 17 Jun 2024 11:49:14 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 1/5] drm/xe/rtp: Allow to match 0 sr entries
Message-ID: <20240617184914.GF2905419@mdroper-desk1.amr.corp.intel.com>
References: <20240617182518.280975-1-lucas.demarchi@intel.com>
 <20240617182518.280975-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240617182518.280975-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0046.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::21) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH3PR11MB8751:EE_
X-MS-Office365-Filtering-Correlation-Id: 7811b73e-ab00-4e4b-3860-08dc8efe30a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HNytVZxhvz84fs2H3CvfxLHU6ls4tV9AOY7QMJGlWZFCwd5bos5S7wOZBpJW?=
 =?us-ascii?Q?a49DLIH/UFTZnkMa/aHhw2AHVMe6CYErTe1eG+jhUQrbMFmulzbWpfAkbx5E?=
 =?us-ascii?Q?N2afu4u1X9mKUwieTOi01r7oN75ai3xBmgD69Vaw54RB7L0qJpEBiY7vNGde?=
 =?us-ascii?Q?6+h60H9QLo4NW2elrXBzloCc6ZiLt9tr5EM6jDWl7jY9O8usI5M7f5v8i++/?=
 =?us-ascii?Q?VmwFPYBQ1+3xVP94DVl0ySzGjf1Srhmgo9PEzidAcuZPHqh7JiQ9L7MYRvQZ?=
 =?us-ascii?Q?Q1O66BxYQ36maak9B/aYEpXYyE5lTlDbpJXMTli4JqfHqpHMSDvlUCqmlxdf?=
 =?us-ascii?Q?PRCWvC+J9r68rnbeGzUkqIvPx/rmk+0BhJ3+dcuc8vKvNzo7oo0nNpLWtt2T?=
 =?us-ascii?Q?dTCk10z7FXk4bjiqy9aN8w1pJmL5gAJ1Nm4zBFbvkxRNwtMTA4cYvEeZ8Ifq?=
 =?us-ascii?Q?MpHStmUU8b+WibRVlc0PRsCRpluV0GSG4kaWn7dikgzPQXqGnuTLAmd7ChMq?=
 =?us-ascii?Q?jNCHJRbqJPB1n/U5wExdKsouD+HIDmOkeWt4B8ntpQeYNcp66KSEslCEJjA8?=
 =?us-ascii?Q?vihQIMcFH/602wTr9H8+Ton13+XNtYaEVGVfYIkh6J2B631Hbu5spwxeDAn6?=
 =?us-ascii?Q?I+Q2vimEbYcnToRMR9W0PpeSXhlyIGuC3//vThrfWqGznskpO0fahBDVZhOM?=
 =?us-ascii?Q?MV88DLE5kaaEVtcR6st+1LBHjJb+0jnLQydfsps7AkLUkCDGBrcsczRqEzq4?=
 =?us-ascii?Q?mvy7EDLjF4ATOIjMIah0uRtwDHTcck42fGx6CfjmeAAaT1UU4tU/mDxS96Wg?=
 =?us-ascii?Q?5v49FzjsnhQkao4Kw7jqqq+Z5pmg5IRuGd7fEWuhG/zKLLgnjvaFqWtkuRJf?=
 =?us-ascii?Q?MYLiD9he7NIOVlPFovOvBfQDJwt5+sVD2+eLFOA/Qh+yiNvdFMgyz4r+pfXK?=
 =?us-ascii?Q?WVoY7rTYcJGD/FyRTyvrJME91XSmdSkpl3T73Anyy2SDJBsNAf3WvdkqgNrd?=
 =?us-ascii?Q?bt1eHpQ3SFgWfnCeiY3sZnmzO7HVdhSAYGtMNFp84jctqPaAgDChgGXoHeDF?=
 =?us-ascii?Q?fABLqOmtdYbML8Xxlt+5In5O6mC1jvdSvmPR6tKOpQqVTalXk8JgMyMGxXTp?=
 =?us-ascii?Q?3Ikf4SUZcVdrli1gPiwJcY7STX1PGYuHJZIY2UxDYamsxXknBJ5gxNXPwA7M?=
 =?us-ascii?Q?bvu2mKBfeihlCN9Rv2aG65pN/ubkkkkGUercapHCDuParagDdZMeGBDg8rCJ?=
 =?us-ascii?Q?WdAYqEbWoNFkSsDmUWRUgSG7Spig0iKU/7nMbUPYp9RPJaQd6ARPZDUwZGk9?=
 =?us-ascii?Q?4bb79S737TvT1o8A0v7wEkeD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qugDZX2kPM+vWGZHuy6S20PAipuedH+Mm91F2gXG7/iN8M2iBavy2HDPf1/r?=
 =?us-ascii?Q?lBSomTCO17t5+gnplYlS0uXEZmV7OZ0lKpQG9wd1gftsuFmdneX3VxTWbdqD?=
 =?us-ascii?Q?qGv0seuGjGmha4MEpbDs7FEOqHBiw/KWfqeLn5HFjZj/bSrQJfRGHJcAqy15?=
 =?us-ascii?Q?SjAECAczY0ulTXDixvX4gohslwoWeyogC9BVO/v+N0bgqhiXSnbHVUFV2im9?=
 =?us-ascii?Q?kF8ZLXBndQeczV5crSl/uYHtU+sqtJG+TLQa4OFciJvyvBYAIa3PggOtfy2C?=
 =?us-ascii?Q?uxwICHkdbGAO+NsPdIpmQZ1mtoNncVgt9P9RtsW3TBNNEmldIhl1xo9uH6VU?=
 =?us-ascii?Q?eUxszjs0IishheAltG64b8V05ng96azuUfcWdKOZl3qGzWarudp8yeoNcBBu?=
 =?us-ascii?Q?C3/5IxurhPZQuA9ku5+4DdUIsEKldwbtzQFmLMxoHoHS8EgJgjozcmiZOLs/?=
 =?us-ascii?Q?aw9HEhitQzOQGI0fxhBK6rt+Rla7UhS3ruOBbM5aQ+jQdvrrIPGwJssDC+8f?=
 =?us-ascii?Q?BKFrMZqiFUMlx0RirxirwMvfk2vL/+QfFls2Xhy30ltGDYsaPAcTw7pc9Bh6?=
 =?us-ascii?Q?4a3Sw3b8g7fitkIPLnEI2LhlX4ZW+R/8BDRyzPi8hc0sdNU6kE5qvubTAuUn?=
 =?us-ascii?Q?ngo90apkicR3t4Nndy0wJA9m+U0K6SL9hOeaSyjZXU2TM8b2cZID2J7R7S3U?=
 =?us-ascii?Q?rrXFKR3ZNnQm1Y8u/5jcWDCzN5ssbOwUe/nkLdml+f8YnTlkBCyLZ7mx9bA7?=
 =?us-ascii?Q?Zq+lzVmiiAgvBK2qJDZnEz72Nt63IYVnJlM2uO8KE3WbmuFh2bFgmJTGCvGx?=
 =?us-ascii?Q?fhTKJuBzFC/3OV1nl6YAUjmCBDfRfXgPpTSW0Jt62Gh+3NRC5Gt427WSEYge?=
 =?us-ascii?Q?lS98tDMfCuhWgHz3DZ7IQ+RORW7wNezDMZCkozyg+q6kdFK95rG3Zw0RDwYZ?=
 =?us-ascii?Q?MQZnRdRF04bRsabO2+UsVm7jBLS11eikR4vIgHg/Paz/ZACF7t/sxiEHAdLZ?=
 =?us-ascii?Q?eh9SWGKq6+3Bwq2NX8TF8Yxg7VORZyhgiS3y0rA18J8/OQHu5kHVR2oiVXgw?=
 =?us-ascii?Q?FeWurJ5Q8NDbjnhxwGDMlUM5Wf9a6QvrCrKrU4DC/unxuxUzmKlDVSj2VXgW?=
 =?us-ascii?Q?UJaMVSmXBxKgJn2kVNfJrRfIkieVGtPuEKSl3+AcGu9koWM503GeYZAg+Muk?=
 =?us-ascii?Q?hf0LrVVlgqayleW1ve5Uyod60wv6g13ST4K8AJuiIRor/OgCyC6QjBWfDeRi?=
 =?us-ascii?Q?8QGelZRwn4zaqhxyeDZOmW9kdFDv77rGtPMt8v/ZhEtcxqKuWm8IXjFXxcrJ?=
 =?us-ascii?Q?/Ne1E+EE3NCrpE2nIjbEjenb/gZx7O6ZNafEZbDLs7wKP29b4vBjoxZJ2Kt8?=
 =?us-ascii?Q?Rt5wG7AD3OMJTya3GZiIKN4/uwbzpYzCSYjzWjTenn7o6EkCmkEQNytPKsD8?=
 =?us-ascii?Q?aLsbzPkKxaRyA4yGFrHkF1cmwzss9qPGye6I816LZoDz8ICB5qXBrzIvV4nN?=
 =?us-ascii?Q?OHGaTo6XV4WfNF9XoqNYt/xmjQZyebmmbkxP3ZV7i6gqP4d4uskHCJTw6KHP?=
 =?us-ascii?Q?wDe1had6IQ5D8HwM1ugkz9P9CbAlLbk3Kt/cq5LTIvwl1vx5m+v1sg9WiSWK?=
 =?us-ascii?Q?Ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7811b73e-ab00-4e4b-3860-08dc8efe30a5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 18:49:17.0561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z/kZa4ACVyOs5gKJ/bstLeqyJprgXHm6X5bX1VSGi3/+UADvyG1yOns1uZFdoWauGRdqe6pbPseds8AaeJNTREJ0YdmIiUb2POG9eT3GTmg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8751
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

On Mon, Jun 17, 2024 at 11:25:14AM -0700, Lucas De Marchi wrote:
> If none of the rules match, there should be 0 entriese in the sr xarray,
> so none of them should have a register matching.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/tests/xe_rtp_test.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> index 06759d754783..474a0b222ce1 100644
> --- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> @@ -255,9 +255,14 @@ static void xe_rtp_process_tests(struct kunit *test)
>  	}
>  
>  	KUNIT_EXPECT_EQ(test, count, param->expected_count);
> -	KUNIT_EXPECT_EQ(test, sr_entry->clr_bits, param->expected_clr_bits);
> -	KUNIT_EXPECT_EQ(test, sr_entry->set_bits, param->expected_set_bits);
> -	KUNIT_EXPECT_EQ(test, sr_entry->reg.raw, param->expected_reg.raw);
> +	if (count) {
> +		KUNIT_EXPECT_EQ(test, sr_entry->clr_bits, param->expected_clr_bits);
> +		KUNIT_EXPECT_EQ(test, sr_entry->set_bits, param->expected_set_bits);
> +		KUNIT_EXPECT_EQ(test, sr_entry->reg.raw, param->expected_reg.raw);
> +	} else {
> +		KUNIT_EXPECT_NULL(test, sr_entry);
> +	}
> +
>  	KUNIT_EXPECT_EQ(test, reg_sr->errors, param->expected_sr_errors);
>  }
>  
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
