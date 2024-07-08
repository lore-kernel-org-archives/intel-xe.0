Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98CCC3271E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 17:42:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB8C10E135;
	Mon,  8 Jul 2024 17:42:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bw985HjG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AFED10E135
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 17:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720460541; x=1751996541;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OnqVPIuLP9zIv9NOhnraCG3jA46SE21lJDAPStY+KKg=;
 b=Bw985HjGdobrJJlmf0+uo9fDi0XPpg9xn7mptdiz0m88aCyjVoU6fP9f
 R3jUKqBWHdqIIcQP2Ep3nfqZae7D4dJvpyA70tXVOn+zKCQLFs7Y584HQ
 Bj3Q+hDEjpMAOBFcQBfCsraMk0uHkwyhpgZmluUkO3TeRkQgLmBnvB2VE
 3fF4pVEv8IcHkwNbwaO5DtyTXRHvZPEMUQVzxswG9gPqSEtXHbfrU648v
 E8hih3xAbueStJwsw3oX1dsi3u813Zq0bZ8alKtp+FDSSljrGnLUaazqD
 RZBCifo8s1gD/ObVUtfnuzUUqwdmDQwyDPTM845uiPoo/X4pNMCcBzM0e A==;
X-CSE-ConnectionGUID: TdU59ir/QgC4OI5mLNZPWQ==
X-CSE-MsgGUID: 0zmds32JRdeSs5BqK0/bXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="35117407"
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="35117407"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 10:42:21 -0700
X-CSE-ConnectionGUID: fXM/OjzmTka6g1ihKwnXGQ==
X-CSE-MsgGUID: ZuRR9rUHQTyX3iNrNovMvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="52385946"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jul 2024 10:42:21 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 10:42:20 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 8 Jul 2024 10:42:20 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 8 Jul 2024 10:42:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FtrbW5p6JLPjkFrw5dT1+MipHN2ukGcX37+fQ9BEHpWV4Egy0claTIMvBNMYpocahAA6xEkGLcIyLlrke1ZiOoR041uFTbHL4j69A9GmmIDH6EuTmHZazEFeEmjCfAThaJdHb4/2pVJvVTwLitQjCPmBy1kGD9iysHSxFg1DtR9aalohXqT68RzGvXTlq6X2N2aU1JNPfxczZKyJrw8n6UtpCxQ6znEDKyDL1TZwrCJPQVxPUs2s3xW9wIcy2wFbB6S6UsaSCeDamGFQgZk+P27yGp13tAX2u7SO5hAcEURTPPc0/sG8lwtrUc5geFfHs28J4yWTvORVIWgwWB/+zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aMDOlluTajtwRK1O9wOgqedTm+ja7Cf1mn7WUMGZZx8=;
 b=FTTi1uAiLsDVOo4REAHhxGb+WXtV3AzwKmXAJMeB8ZhWYSiAFLi+f6NXsbc6FtzcWUafXVqXjz9TOTg6CRrTQuq/8KLUN1ExwNlithzBsq+H57pq7xHY9mcJd3/vqyK8UKgnU6JtJzr3CGF8X6srSJH28P8kG/b1Sr2Frz5OOceYwKfIId68OUunMYRLvbvNYKtLp5i6Qc3zBV6Is3pxQQRZ52KqfVmyVKYAmYd6SLIOsz4O6uBhwjud8NiMY7XqXH9k7GJ8ckxNNQieDPmCMo9PJv7YUVAaQDg1sk6HKCDuvIiNXxOy2LheRWg1xFSOYJ+kYwNbOyNW/ofPVfvgRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ2PR11MB7427.namprd11.prod.outlook.com (2603:10b6:a03:4c1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Mon, 8 Jul
 2024 17:42:16 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 17:42:16 +0000
Date: Mon, 8 Jul 2024 10:42:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 <intel-xe@lists.freedesktop.org>, Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH] drm/xe/xe2lpg: Extend workaround 14021402888
Message-ID: <20240708174054.GN2906448@mdroper-desk1.amr.corp.intel.com>
References: <20240703090754.1323647-1-krishnaiah.bommu@intel.com>
 <20240703135400.GA2905419@mdroper-desk1.amr.corp.intel.com>
 <vxgd7tn7r2p7k2penw5vozkmmxuhbmardzmuqzielljbdwkmgz@b7elr65a4sxu>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <vxgd7tn7r2p7k2penw5vozkmmxuhbmardzmuqzielljbdwkmgz@b7elr65a4sxu>
X-ClientProxiedBy: SJ0PR13CA0108.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::23) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ2PR11MB7427:EE_
X-MS-Office365-Filtering-Correlation-Id: 737d8c08-acd8-44af-b460-08dc9f754f07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uW7HO8jCjFrQhMUPHO2Kw4BpcXuG7mdVEbTbZ0MOG20kO85ZMibeyjENlXmf?=
 =?us-ascii?Q?R4mBJjNmKZxY1ri3LdDNfCJ2202DQXr3OBMlFsMxTm09qMQ3tXiwNx+93XUi?=
 =?us-ascii?Q?/3bwMB1PHQKQSnCeSjg+AHf+BK9zeuqhd2cX87Y9OfceXLZbLf0I23TFJs34?=
 =?us-ascii?Q?c26H4F4YQw5F8MEPZZby/sW0B+9ABx14xgB8C7jf6udzwjUByFUtE31PldK8?=
 =?us-ascii?Q?aXscoYpA1jFb6fvUxIIZ1vA8uq4asVttl4Gjz6WbFZSlAz/X7HrGKZv2t0Eb?=
 =?us-ascii?Q?3a4UipjtdTQ0kpH61Jfq2ReGTFN/skWQ3m23PUbojiBojlQwP1Hi5whl7Qg9?=
 =?us-ascii?Q?CHyEM+aBY4CmIY868vtggnNIAMyU53vnZG5LyDmBYwxM7sEk5vjy6jRgFTKm?=
 =?us-ascii?Q?qr4bZSBl22m9qPTonwynpiAr2oQqyxOiv8EcBXlpSHCvhCN20J0+t05RpASn?=
 =?us-ascii?Q?DjV69Lp9foO1WVo6K4ZWaR41F8Y4fBvgyZtHuUQRTfv80IGpffYDqPN/OQUL?=
 =?us-ascii?Q?phHfB1fls7zTDE9sStfd1VPWvNxdOdeuzojiL75iEsaC2U7iXnEeEDb6rWJr?=
 =?us-ascii?Q?KEZPPykGsq4K1szLkbSqaJNJVetHx7wXuDtv1sQTRNg/zZQaCbOOOMWXag3t?=
 =?us-ascii?Q?im2x+aMuhHYMJ/s4DjI0WeFnB0cCEWe87Ma4YCqep8l2ECRMlaadnqvaLzOL?=
 =?us-ascii?Q?H40n/siYI55EM3AxGhWd53p+XP7hJu7B+q3DEeX8iE4UTACXOQRnPDoaQ4IF?=
 =?us-ascii?Q?ABPUFjE+KdB0r36I2TviksGMMa42+vhERXxpMNONhdfryePfvL5+QgMCmfnL?=
 =?us-ascii?Q?cSxhEkd4HdoO2yGq9wxEEpd7MiGgWT0WRKNkBfK/0q7HrsxJwk66yQ9vDU1X?=
 =?us-ascii?Q?MXuLiUwa5mlG7uC7QaO3Q7G1u+7lQwoyVqHBM8/KAHqw/d+ptf6HmuNDxlgZ?=
 =?us-ascii?Q?08zNmfn+SkOxOASxiWu5ppYcjE7/FO3CvHh/6Cp+2CxepI0QW083x4nit5f3?=
 =?us-ascii?Q?L2nb4cbizgLVfw+CedP4rjI4cbFxogOFr5SZSrTHlPVeRsM0Mc2QjfNCD+Rd?=
 =?us-ascii?Q?mEz6iSAtZW1Mb/pUOiLTHfYCvFf/HdQWUkNF3MQblBG9TESxbNKgOljImIVT?=
 =?us-ascii?Q?zFMXB2tAk5ljyI41c7/5kT7fg0awkUUXPlYf7nCjLZnUL9vhQZgFif0JPLrH?=
 =?us-ascii?Q?ACyGddfkDu1+SsUasTe6AjdM8agh5OK0VMLtePjy+E2J/iVVMZUNaeJHlvBT?=
 =?us-ascii?Q?rAMf81pUwXB7KvRd9SrQ86Voanh0ZlN0WrccZ/66QusnNuH5tDZgB37Sha2h?=
 =?us-ascii?Q?gBwMZsf10MgmJq2DF9cxLwqE9P0gY+HZDNoyGPv+aWpURw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uK+EWTFJEp6S1leKEh20JkesCuDLIXaCWaLVNK2F0ggMcEvbCFfeiZGLE1y7?=
 =?us-ascii?Q?KF5pSQrH0hrBWnYAHrAxDzYlMhTqSmz4lNfJqpZm7kyIqkXRCQaNCEhVjSu6?=
 =?us-ascii?Q?HVzVvsEcgSCskF1zt+ua4KM8vhIvkYmq1+2YTNSLetoqeUsO4LFBgihgWOC5?=
 =?us-ascii?Q?UARYEDP4e9woilQ78JbRjcv766lhQc9zPwZse2SVwI/J6OU601xSg4yKXehO?=
 =?us-ascii?Q?zVJfrOf5IABikKr1CZ9nbeYmkvYDuxO6XHFA1xZVUH02lP9CHToRjZMj977I?=
 =?us-ascii?Q?dPd/apUCHBoAlreZ/SgbqcPCb+eqbTYIFIr6Ks0Rk1G2Ohv/n1iF7XOElnWm?=
 =?us-ascii?Q?CSmxKDYxKZ+UK7+ns8dKet+wghE0Mw5j/LjqFVDSXro4AUYI+4AwmfNRRL1E?=
 =?us-ascii?Q?K1/rdXrUzI5XI9HiXcFGsUngBIczpXs2zvC84RJcE9AkEcGwBcAYHKFgPyie?=
 =?us-ascii?Q?ccZUOSXhBexKidP2lytRuC7iLVwiPHn0TgKI38YSyQbhGysYe9fLW3H+n3MA?=
 =?us-ascii?Q?t8P82mVimoStTMJkkVr897PIbEHJtG7NXmroaZWUFI/MCbxCgadl11LXgsHZ?=
 =?us-ascii?Q?JC2812Fl90bq0tU3gcN9M5F8CilwAQ7MGQfuB63TDlnUrBkIR5A2JXJibagE?=
 =?us-ascii?Q?qobF62JTSwUTFfHBfFUGXxPdy/L08u7N+AAqXmtCgdWd6Oyf0q5o6E5CrR+b?=
 =?us-ascii?Q?PvSi58BcFnmHEgRJFFzEtREUS0QzPEdG5wmwc8DSWD0O9g5orYJo1Fc9H0yq?=
 =?us-ascii?Q?pUWeL3tpnaE/cKi3iQvllcH2RUDziJ297ZGfSIzpKF9rZNt2s30rG91esbrb?=
 =?us-ascii?Q?VxuS6SmBRhAKJWEGrwoa1TLHaUnx6Yx8P7QNpcQG008brvoP/AEMWmRn3RRz?=
 =?us-ascii?Q?GfLBPJLk7dR0W8RAbblDmM+PuRU1m3ZvN0apVzH8n5Fa5uQBhK8Wy9tXnWEc?=
 =?us-ascii?Q?r2Q2B6HmI9rhEn/ZB0pv5+Umvv3eeEWqzmwb+lExTHplRdp3aPSHcZPt1XGh?=
 =?us-ascii?Q?jq0LFzKXw8dTFbxiBi/orrZ1RBXfvM5IJ9V1WqfqjzDqd7AV4TYv33g/LIbT?=
 =?us-ascii?Q?HzoNWOoE2thh5m4pfUsIzbRVC3I/ZNXJ9/QRBKNHk5A9eRTlcA4j9rB00mDz?=
 =?us-ascii?Q?7rarSpXXOg+zSwDO5HKBDINqRtMVxBkAPLkOMH35h+yHe6gpoLlGc+r0PFm2?=
 =?us-ascii?Q?xyWo7Sd/PYwezG5JBs6oX/q6RrBL0zvy0ej9dtmoOGUnAEK9rGMAu3xCPTbI?=
 =?us-ascii?Q?HqpoPo68PLynkGNY5Km4h/8aCaptNHzshJj1hcT8amVjDApOn4GVWEwy0/XD?=
 =?us-ascii?Q?yN1ZwhKIGJRVNVK69lT3voJti1QYB7zqj3WO+j4TK8/Ci3xV/7IyN1qw4xr+?=
 =?us-ascii?Q?Ewskjwr6B0Xpsuk+dg69ONy3BLGgqoQsBnvEMS/38gYjkJssMTOkQYKofxr0?=
 =?us-ascii?Q?VIMbaXRNzL4w86R+qO57fW6lFBm3iDTPv2A2ow2bQjGOW+pzDMLE4+V/dku3?=
 =?us-ascii?Q?m+roJ36C9nwCaS+gAy2Q3zCgWkgFGoFG5Rj1EDbzMa9i2YvxC3DsLsPpe9Wt?=
 =?us-ascii?Q?579n5rkCqSZlV1xK0/g+ltf4KTvMp0M99nYg5nQdCpZ78IPLtvub6wk/x80A?=
 =?us-ascii?Q?zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 737d8c08-acd8-44af-b460-08dc9f754f07
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 17:42:16.7204 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JxyF0tvWkfkjuyEaTI0+0xASW/qXZgSVZ/l3WESBA9G9bFtbMqWbFM4pg8IBOpGkUL2LcvlPzqS47hu7vTD0bTQyVy0d5HQ1PbSMtjtEJyY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7427
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

On Mon, Jul 08, 2024 at 12:30:19PM -0500, Lucas De Marchi wrote:
> On Wed, Jul 03, 2024 at 06:54:00AM GMT, Matt Roper wrote:
> > On Wed, Jul 03, 2024 at 02:37:54PM +0530, Bommu Krishnaiah wrote:
> > > workaround 14021402888 also applies to Xe2_LPG.
> > > Replicate the existing entry to one specific for Xe2_LPG.
> > > 
> > > Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> > > Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > 
> > Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> > 
> > > ---
> > >  drivers/gpu/drm/xe/xe_wa.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > > index c7bf0862b231..91737d7a483d 100644
> > > --- a/drivers/gpu/drm/xe/xe_wa.c
> > > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > > @@ -486,6 +486,10 @@ static const struct xe_rtp_entry_sr engine_was[] = {
> > >  	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
> > >  	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, SLM_WMTP_RESTORE))
> > >  	},
> > > +	{ XE_RTP_NAME("14021402888"),
> > > +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
> > > +	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
> 
> since the action is exactly the same as for GRAPHICS_VERSION(2001),
> maybe we should prefer to a) add this one here, with an OR to also apply
> in GRAPHICS_VERSION(2001) and then remove the one in the bottom of the
> array that are 2001-only. Thoughts?

We didn't have "OR" capability until a week or two ago, so the pattern
until now has been to create distinct entries for non-contiguous IP
versions.  I figure we shouldn't switch styles for just one specific
workaround, so probably best to keep distinct entries on this specific
workaround.  But as a follow-up we can decide whether we want to
mass-convert all of the shared Xe2_{LPG,HPG} workarounds to a new format
at once.  I think the options are:

 * Consolidate with OR's (might be less readable, especially if the list
   of affected platforms expands in the future?)
 * Switch to [2001..2004] ranges (would need to audit those entries if
   a new platform shows up with 2002 or 2003 in the future).
 * Keep it as is for now and only consolidate once we're a major IP
   generation farther down the road.


Matt

> 
> Lucas De Marchi
> 
> 
> 
> > > +	},
> > > 
> > >  	/* Xe2_HPG */
> > > 
> > > --
> > > 2.25.1
> > > 
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
