Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A23C52D7C
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 17:38:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7154210E9B2;
	Fri,  9 Aug 2024 17:38:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lnma3ndc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF6810E9B2
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 17:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723225128; x=1754761128;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MjY6lHEUbB9CILeri//FcaYzsWXCsGhxwp1AZttW/G8=;
 b=Lnma3ndcS0RahndFhOpTEknlGINl7NHUDBwfUSVFDmiMoEEK9JocdrK+
 A2fqrOkAwFgbJbalOXJszOLQiUsPpIYqAKd6E8/SeT1/cH+ms3RdpseLU
 S8IQutz9bgBx8tDQUdVUBuVWWxY5TwocfKp7ltADN62FwpuNDzbacn7Ho
 Rj/SSvRVuCVG+4jWr2sLAR0jkulVFOlV8j3HQyKtJ8fPSerRJo4BUegVX
 eynAFKZhezDR61K2pcv/FcTL0CxDw1AzTj2IL8l8xVBaeMUe3cEnjOjC2
 eBVDlGXw6PEAWnxkasbS+mm0g6PW17M/B8sLGhPYz/T9V486Wb8RFNWbt w==;
X-CSE-ConnectionGUID: sBriroUMROyN/lg99eswLg==
X-CSE-MsgGUID: w5s0IhaZTd6fC1cKralhHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21384575"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="21384575"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 10:38:47 -0700
X-CSE-ConnectionGUID: mcfYeE3pQqSE146wPx0j5w==
X-CSE-MsgGUID: c86LO78gTzuna5GB6ZSHFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="57711818"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Aug 2024 10:38:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 10:38:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 10:38:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 9 Aug 2024 10:38:46 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 9 Aug 2024 10:38:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q/o0PQWhxXsvR8jiyVuP3YDiDPLbVIT4HqlLtLuapf/BNiOjINtn3fd3AYLC4gS1uiQ0bwJ+IYrGsmIb0in4jw/8pCMWRXdHO4wb2/s/+XkVFa60Nbp453psG7jgAKa+sHQUr5qKy0JvVnanDXhZi2c5KqRkczfXMkQrSoc1kygdpazDoF1Q9nTFlmrECSjIa3Nqi6F73fdlseeq6370hTglQF4V/V2GqtRgHrHi4cItEDSnoHfQTbE5TjqGfeV7nNVAZaewiyuX78lWnLjCPECnn/oyW7PPiw96ZVcJ7+Z/+62OWAMXfDZu2moH9y6hFCpUl7JWIFA6aEvF+YnicA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EM5QKm3nzmgSgzzOsLLbeLlnzTk9Kf611ycO7gNUHcQ=;
 b=KwrG1XQy+T9m/eooAdltQkwMs1JCp+0Ucq61dm+H51ThCZt16E3lZWuFSp/ImCScgyF0sYAV6DZ+JYl0H4DaiVBSPHbTR7LNipBZap4lj7neLcNVj0NF8f9ZcEPFXsddOEwOhDFRmoiERzRAxZgoubYe0NXuh/XhDExsrWBPEqDf4Yj0OCEnIN91pMZvHztQGRPrrJSPaY5Krx6E5FASsqrJ5d7jF/6bjMtXQrc8uyCtf8FS08IDwmG/kIuZn8Yl/UFOxLFf9Y8C3lrfWxMAsUblLHW0nBUErLmY8pkyTmha+iQpdvy8dytibkcFaUthph86No7zbJFeFa1VXZVOow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7135.namprd11.prod.outlook.com (2603:10b6:930:61::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.31; Fri, 9 Aug
 2024 17:38:43 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7828.023; Fri, 9 Aug 2024
 17:38:43 +0000
Date: Fri, 9 Aug 2024 12:38:42 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH xe-for-ci] fixup! drm/xe/guc: Pre-release GuC firmware
 v70.29.2 for PVC
Message-ID: <bllmnwaugidjhxrmzszzbtfoqaodqmoajhnqfuqfzjemu6ifyy@ryw6ovzfylfm>
References: <20240809173459.78732-1-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240809173459.78732-1-gustavo.sousa@intel.com>
X-ClientProxiedBy: MW4P223CA0010.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7135:EE_
X-MS-Office365-Filtering-Correlation-Id: aa83bdb6-5cc1-4cfa-c69a-08dcb89a1d4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pYkwoPtuNLubmda+nhtjUOX6VU6rQFhZrerq44EyWywtiCxyZ/kmruu52Z+d?=
 =?us-ascii?Q?5umKF4HV/adAj692lE2yvRgG1Tn5nX3x5vJqNhTDKcqwBHZ2sC3rrKuXCFw2?=
 =?us-ascii?Q?LtzjiG4vZjqMAbAI02ZLG6//i8mM5FpGuXxAfayebPCwcSObQVw2RHrdnhXN?=
 =?us-ascii?Q?SDO7Vd8ICP1plUl2Gc/BTSSNVad0b3rIIqh79gV92bz8Y912ueIN3Fzb82I8?=
 =?us-ascii?Q?pcmXDzWzfpUODoWRSuC+YRaWyc7SpBewQLZ/PrKRrx1Fu8GW3gWys1fLoKKG?=
 =?us-ascii?Q?wvJiua93UmL2Whdsh0hCMu9RtWL4dtcNop5LzRLG6mcInpRFMLqg6NNZTvNf?=
 =?us-ascii?Q?2ButxPOLfdWBlfrkh+n9fMvTzYJuLywRoiFFqaHN2CJ7Uboy8zYWh2jVBqYu?=
 =?us-ascii?Q?DNJRld8AFVEztlbP+LCuKVOIMM26UDWRxAcmaaYElr5J96b/H7VzaoffZEm5?=
 =?us-ascii?Q?g1Scedn6O2l9Sd2A1DZ9U2GdI5/dn1d2JWScXYKFOk+pKIFTC3VDW9SXP6ql?=
 =?us-ascii?Q?28FBH+M+0dZPqJ1LxZY3k2cJcsCvUwMD57tLnpJEilkDXlN06jPXMH0GRlN4?=
 =?us-ascii?Q?bXYA/xbeKIXu0XAvbyVIeAv0drbA5ayT8/VvZopw1hEsqhwMta9PpwylNjK4?=
 =?us-ascii?Q?0yXgVoqfebVWz72GRtDurG6Me5XXw8ibvpGQsEMgNHX/zXzNKJj3NlQrfrGQ?=
 =?us-ascii?Q?IghbcoKo4JWdQpIH06mBTIxt+rUeRAAGObZEpuy1kkeoB4LmIHUCPYxILi87?=
 =?us-ascii?Q?+R9GuofHvUE/O26OFmXjk3SvjsFQtj0GFS6Otc/VfUmy6zD5Vso9g9yGCS+E?=
 =?us-ascii?Q?NbeIIO4yzOcomroLeDsqwEwHvg06in3aT+mNEWvLS67woQ2+z/jRBmz0aTmF?=
 =?us-ascii?Q?14cDlI5+QxrwH3i0CGqsMrCyv3+HHMMl/9EozCenOLcWOQGYRhRlAxfOCgoA?=
 =?us-ascii?Q?me5G0QSN2D0WFcquHij+YK8NznOyp46DNAJunYYuv+N2EOgah9LmoXO//yZ2?=
 =?us-ascii?Q?BDS36VIWuGap7gTF0ynea6WF2367w4Bhjz7q0d9LR09hWhOISUQBHVq4zAfs?=
 =?us-ascii?Q?uDT0Epsi4NLf10MZZMDbr+Rk99JbFHJc5LWrET+Vq3iObBTA1HRQvk9fiv/t?=
 =?us-ascii?Q?C0mroVS6CTW7txceFBkoIXfe3LtAhYJv+XrQPZ+PV2juxKvv0+y9Bpoqh7/8?=
 =?us-ascii?Q?rq3GtmoFefc+T3fcMLz5uQv4/PoyoCfSRQCxWTbRc5b4VlYx7zXHeLEo4Emn?=
 =?us-ascii?Q?jinUq2Hj/tL3XM/kSPVocdkqepGjUn4p2FgRs/L5uyf6fhYNWxJk4FlhN14l?=
 =?us-ascii?Q?QRQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9d8RPgEz6N5UnuOMGuYS1kQRDKLjGXWlO/CqorheV5/esLp+SnnlxTMU/gSL?=
 =?us-ascii?Q?AJZuM1VJg4E8rNAPrfzcBjsceE6z2N8bOMkj6bP2IAJRswLQbzNIJqZjFupB?=
 =?us-ascii?Q?6g1CrL8VlUGPnE/yvgb8FfaQ+ogzD/fvlAupsOrc4qry5Pxt2tu8jA2VlieP?=
 =?us-ascii?Q?t/Ua0sTDk4nKomwv2RqN5J/I7LN7TeeuRtwrHbxcYDxR6RDheAYmZ9Z8yeQV?=
 =?us-ascii?Q?tDLbhktizShzcz/1lobr3DyYDmGLTXkx53n23fOnkvAQlyS/yX7BfrU5PCU/?=
 =?us-ascii?Q?gchyt+Rp4yvOX7ley5BxRG8HuZhz6N7USprBvM+HYouPPt+31CQIRK3oMEcC?=
 =?us-ascii?Q?qKC4SoR6W5Ua2kA4vI4gQKaDbNwGSnKNtSux0M92faeQq9I32sCbkJseVDVD?=
 =?us-ascii?Q?rd1P+W2nwmLFAgTwlLTxWZGE9bZubs0hpbbbcRo2wSfoutcmEJMeCEz6S++8?=
 =?us-ascii?Q?RPDDc1wXkQ/tLFvjUIjRk0ABSd54kDmKj4e7+4BKdwshmV3IL7A4nF1m/8/G?=
 =?us-ascii?Q?eg0oeUeIYlpSqYV86xBz0t8qbyXGjWifa1sSLLWCG1EpPbKFvmQAKdLwurif?=
 =?us-ascii?Q?KptXZDzDCBwb5bh3rpjHcRcFNHCnVxnma2vO6ytjODZC+JA4ZHwWp7bOXSV4?=
 =?us-ascii?Q?sZb50WZwzm9qPuZk0dExfTUaVhQsIZaASrHCU+fDjBpxj9LR/DWSyKAHE/4a?=
 =?us-ascii?Q?+fb8y+rTAZ75Z3jkxTqNK/QHfL/+qXd/ZoITma+m0z8m4YCdXvqKXjxd3M1J?=
 =?us-ascii?Q?rtPDXwrJ1/kWG8bN6PIHudONBLgRaMAoMLnohqmX9ulikUW5IbJiDhJ51AEq?=
 =?us-ascii?Q?hcZmtBkoQIlOCJlHuTdO/vAKI7XEeed0fY3waj48RLef2YTGCqqxzjA/zKcI?=
 =?us-ascii?Q?ATQpY/1s+nAd3FMhKAZNBCi2NAC23vMQd/qnUiS13vWbaqn//vdJTC/K4Kzy?=
 =?us-ascii?Q?83SYXrH0DJNatykY1CcsIfUCi1r7HiQ6J9PHUAwmMlYOdBf/KGEznFugTJwd?=
 =?us-ascii?Q?wrQVyc0ERQ5gN/YsHgeDW1+DzYzD95U8PbVVqxRlh0+OSvX+ugx9BB/TSSkv?=
 =?us-ascii?Q?s/+q9hMoVAAePvN+/QWjhMEhw09y7OcWCJKdTdbAXl5kEkXEfBPyljnYtwNL?=
 =?us-ascii?Q?jb6YDgoLN4D2tS+hTQ/6qNWOL5QFSKY5jB938DSkT4tuqB/9G0yFWwPsBTqz?=
 =?us-ascii?Q?wxlQePLWxe9gBu5qdLWIodv8LmKIEsl19kN9jw9/u9e87nRzgSkO+aE9Ew47?=
 =?us-ascii?Q?1KAoWFPpQujxdKGaxinraK9iIVh/VuNv/B2jbdRp2GrRSc/GfT0GOOl5MxTo?=
 =?us-ascii?Q?Dqzqh/O2ZqJD6LRkoEhS07CT3ewKmGabD+yRERIe7BEYP6H1Fk1SMktTupLy?=
 =?us-ascii?Q?Ysw/A99bngPPh8n9O+aFShIvKC2TX2LTnHEWrCCedDbWmOm0oNAKXovs2JIy?=
 =?us-ascii?Q?Ip/PKb6bu04gJQLaAE8ijKS3pfrvt3o9hBEN3WqQOToNLWeq9W7FOz++Y/nG?=
 =?us-ascii?Q?2pkrZR6Iw9SVaAsSSxBVdq8MBva9E31FL2XD7W9BWoJ1OBUx3nEHuW/JPvdz?=
 =?us-ascii?Q?vZEDJ6u/XSxhE/XMMDn7KbJp5810RMU67zb/Q2JgA8Ta7fDRR+ocddm2TIbD?=
 =?us-ascii?Q?pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa83bdb6-5cc1-4cfa-c69a-08dcb89a1d4e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 17:38:43.7396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4UiHjwIH9DtEbPmFbSQ9FkIzCYLlmMZeJtaGKNk9E3aDgEFaKj+/JhO/O55h5QVWieixtvSgpLCwXj4Ns9h6LvYzjlfgcsIdKP37M8c7Q4w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7135
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

On Fri, Aug 09, 2024 at 02:34:52PM GMT, Gustavo Sousa wrote:
>We are moving away from the intel-for-ci branch in drm/firmware[1] and
>we sill use intel-staging for all public firmware, those under test and
>those that get upstreamed to linux-firmware.
>
>We recently pushed a commit that makes the GuC v70.29.2 also available
>in intel-staging with the "intel-ci/" prefix removed. Let's now update
>the kernel side by removing the prefix in the firmware definition as
>well.
>
>[1] https://gitlab.freedesktop.org/drm/firmware
>
>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>


Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

Once CI confirms everything is ok I will merge it on the topic branch.

Thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>index 41c4ac6ba42a..d4809ec7d634 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>@@ -109,7 +109,7 @@ struct fw_blobs_by_type {
> 	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
> 	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
> 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\
>-	fw_def(PVC,		mmp_ver(intel-ci/xe, guc, pvc,	70, 29, 2))	\
>+	fw_def(PVC,		mmp_ver(xe,	guc,	pvc,	70, 29, 2))	\
> 	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 29, 2))	\
> 	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 29, 2))	\
> 	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
>-- 
>2.45.2
>
