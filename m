Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095F3CA0EED
	for <intel-xe@archiver.kernel.org>; Fri, 22 Aug 2025 19:35:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC96A10E05B;
	Fri, 22 Aug 2025 19:35:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X8+vgnOy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FCEA10E05B
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Aug 2025 19:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755891344; x=1787427344;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dUV17fwQ0AZri3WuNxhAyAEh2B75+fd7Lh/KZ2sPAPg=;
 b=X8+vgnOyGz4wZW+wZzJVd6BSRO/aEMk8l0DuuKnmGzN0WvH1Ox0bSt65
 F7L++1khjRple+w+nddyh10PDGHMx4nipP9eY0NyFpnGAQ5wp3G9YJXvP
 cfNt9fPe84rJl9ocmD9ozxaxFofHaVqpNnyisMM4B/QTytSk3RzJU4Yub
 V1JwFQ/7DuFuKKyefDGQ3Q7a92bzss08wmk6KEiZ5lxCdEmp7DmI3vfmc
 ewk4DjXefh97/+L+OCE1PduOxHXu2LUKRcDb6d4G0xYuEyTRi/PfG96ja
 CmRhaLHPK7KXPeQ9DuEQxfMUAtV4tCkSG1R+t69ZnBD1h3+3kfdiejEuA Q==;
X-CSE-ConnectionGUID: 0hKbF8JfRO6LgFOunf3/aw==
X-CSE-MsgGUID: sOYQjzJdQKKxTuwMJh3BXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58301878"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58301878"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 12:35:42 -0700
X-CSE-ConnectionGUID: uviKT6SoSSiPDPxHvGEPcg==
X-CSE-MsgGUID: B3vMXAQCTEK0XHnoZuKRig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="172976019"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 12:35:43 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 12:35:41 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 22 Aug 2025 12:35:41 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.68)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 12:35:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iy8Zj+77mhAFPS96oE/JDaEitpbEzHmO2kBy8eO5HnRYKLm7V09M5ypQg6DuHvbvAXR1zuf50oIvWh3vbaDYuPARATNDZtbIwTUBn4gy1jJHOv6EknNj6RzW0P5q8iC+a+LjmyIS9vNkFgZcRe9FAS/bWuRihzfxiUE+MOYOtxz3Amxoa8yRv7eHMcuL+NT2NLqjtCpdq7cjA1e9b2o0aGISjWm33B9+gtfKmixSQoo/3Y++YsSdQHfIbNOOatZCsyRMMbAnoJrFtz23Qt9cEKvyW1TJRVfdHSNGefgQ4nDOFW9ALCNyoKqy6v/0EHNmKjQYOttUwVx7scmNAdqHqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vq0BNJ4nfA4cCT/RFuykjSNxa0Sr3KbqtcVkzwK6ho0=;
 b=DdOiQcyRszu5pkAlLLnisTRTgcQJmE0je95QEw/JdutJx40zAoghYEB/7Xe/JS0PDoWjJ+L2SMUuxueooSuUwaQWfjVmGDyVbTCpPoHfifXnD7ftOyHLMh2q1umVgYN1Ek2YYEih7QyMPKx87kTgYc0vXAM+7myYg+TGTIFyq4BGareVjzXPunVlaGNatFUkl1OD3bRtEnUchgsaxCmrMitqAH2V+oIo562TPnj3RDHUaomTgZZCZJlKL+PFQoFytdWdom7kkKVlH3C392wOhQbhLmfHGfq9W+/Ao+NlqH6SSYYSwOIP4v8oidEfNRaYExUdEg1E4dAzRDcKSxUV3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6344.namprd11.prod.outlook.com (2603:10b6:930:3b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Fri, 22 Aug
 2025 19:35:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9052.014; Fri, 22 Aug 2025
 19:35:31 +0000
Date: Fri, 22 Aug 2025 12:35:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH v2 15/16] drm/xe/sriov: Convert pf_provision_vf_lmem for
 exhaustive eviction
Message-ID: <aKjGgGjACwbnrUa2@lstrano-desk.jf.intel.com>
References: <20250822094030.3499-1-thomas.hellstrom@linux.intel.com>
 <20250822094030.3499-16-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250822094030.3499-16-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6344:EE_
X-MS-Office365-Filtering-Correlation-Id: fddbae74-474d-4694-b147-08dde1b30e58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?HVZpASmIdBYTJ6D/nbJuR2XNqMoQbSPlP77tSd/RELcuIbc7Wv33q4f5Ef?=
 =?iso-8859-1?Q?6A1Fq4Pj0pfD4KDPQVdvbHNC7svEcKJiNb7erFbN3mUalfPLFibZHt53CJ?=
 =?iso-8859-1?Q?wNPRfBjfojSPF9RETUgiiEAPCC/V260lHactSI3/EbJM0neRiUm1KdDIYI?=
 =?iso-8859-1?Q?Lp6Kumn0+fUJcIqhWsIx6M5jp8nMzGYcAonxBqSed+/sVF/x3H3hu7B6ZB?=
 =?iso-8859-1?Q?q2PtxH000reSgR/y3Phuk4PYmFvDAxjxXKRt3YyQTPqOw34zpgTbxqMX8t?=
 =?iso-8859-1?Q?MN93QWuqwaVFoRdv0URreM77SDQsgs2K+dseiQm/wFk8FwyxqNU/w5xLdE?=
 =?iso-8859-1?Q?Dz8Yk07OgR6ytdhiY3RORddKMsaRb+v5g/NodsMVKukJOH9MxuQJk5zqS+?=
 =?iso-8859-1?Q?Nti/abUuxoPc5FISJPrbr2NNB1ISoySxNwagBkuGn4BgK6b1WMfjZYah7K?=
 =?iso-8859-1?Q?KwFwYqGskWroQiaSGnaisxwOvN7Duc2buXXw9Dng/s+FQDZy14SA1ziUVB?=
 =?iso-8859-1?Q?tewj5h8V+rnQeZH7RSrK1fZ+qASpeX+0g4SyJzFLu7hxi0ffJslHukCy25?=
 =?iso-8859-1?Q?5ADWtpnWHciVXNVWw/R7KL3g026lAl49PKKSh81wkeuRzOmnNYSwcMI5Eg?=
 =?iso-8859-1?Q?/Bk4jJcmqUUj0E/PlKniZIlVaADf1q7//Kf6WB1UPlHRd+nfzYyhk5thqd?=
 =?iso-8859-1?Q?53jUeb+ClchbB9BJN86lM9ft5WFRKvrJn0o17TLXTI7xFv+QDApmwdozVd?=
 =?iso-8859-1?Q?tx37JPEXjl8pzSpSH44IKlYi3tUb+eFTvO6PEZUCw/XLUCBJBrcYNHDEnb?=
 =?iso-8859-1?Q?4jTjWcnznY1aFsjQATwbcPX8s6Z39d5xWGODOxC5osu5cfeiWiyzko5b7U?=
 =?iso-8859-1?Q?wzsjy5mVU9Tofjs6JVnUg0fPAS8reM8XpMPdVS49iUp4rg4oucKXjbriS0?=
 =?iso-8859-1?Q?twzcga6SrzE839UK4/uSDSCmyBH9uMSUbhyy6fq3EhKNJLFvAeG3CRFoln?=
 =?iso-8859-1?Q?FK26nLGSBIUWvk+S5O3dF2/JGaS2W9D0Y1ekGyj5vcjbcqsBMfv8IIZaVg?=
 =?iso-8859-1?Q?px7yOq1oiVDpwvoxPemCcXuvQ5uZUZPhZiysWCU8CTCSQcYH6vUqcgRhDa?=
 =?iso-8859-1?Q?Pe39k3EsVZus/GZMReZvZu6AR25Qr/XnY9AWRkv8h2mf7OiFNxxsthLBBq?=
 =?iso-8859-1?Q?btcOdsbq8Dcgk9+LTeewLs7fOe+mPndAXAgeVmlh9QvOvY6CkWWQsYQW1W?=
 =?iso-8859-1?Q?GNZmFk8oHTVa/sr05yiM9PlM9E1ZlQqAgcZsqcpKrkDtxsicsH5Ss8ZoNX?=
 =?iso-8859-1?Q?9zZaNdJ3kYoxOscuvNiS2ddauQ79jEzVYmtSPlvJSbgz3ErIL1BrtEEmtG?=
 =?iso-8859-1?Q?v7xQp+tTPaBHBDJ8MKeWp2+yeSw36SDACxCtd6DvwU2WS5sx32CfR5vYL1?=
 =?iso-8859-1?Q?NbH6C8bjVfWroTIuP+5xlYTrWIaW0ofsF3YIeQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?hG2Bn6AuZFANlZKl8iPiO12S7syLTh2SKWfXP3VrcKxrosVpUH2t8fYTJI?=
 =?iso-8859-1?Q?ZKvIr0re7NbaL8uIxQ4RaYPOwSrvyZSMBd2+wjMds7ScNBMtGYt2nhSwFr?=
 =?iso-8859-1?Q?iwCMWjiV6Xuoi6psWUChc9NNxlCeMJrTLKgXK+P9eoI3BB/eoMGlmjREZI?=
 =?iso-8859-1?Q?VdGhq2qpWLEk/jgaRP/kI8eRw/Ticj0dTG82iiL938OxokJ8rVKFjs9uX9?=
 =?iso-8859-1?Q?nwUI83s6OLndXNHTxvLqRTZJ4qyTveRLVmmbW9yjHZm31/1mT/y0DAGwLq?=
 =?iso-8859-1?Q?obfbBK6bb5yr7AkRXP3+wMCGPLDwicOrhxAQtNTZ58OERBRiJBaYltDVvC?=
 =?iso-8859-1?Q?Vh5Sph8VUNoBBYW725HW4SpgYbqYjE1VrMvadieZ39sGxiIgQubsKkq2Nx?=
 =?iso-8859-1?Q?l06eo9kgtQ174HgXtVKAUTrwuSTZcCV/RSVMfSBOELCCZzFAzzWgFmSx7n?=
 =?iso-8859-1?Q?0w+VMaLsYHjfjF6wNsKdSRn0LPlWgFYuSGccSWGzj6v4OLjmSH4PwNvcwd?=
 =?iso-8859-1?Q?nqbxhCbeF0AZaFe+i4SZPrECzF2GNJWMIa2rWyM8qDb6xme63hd1G1F0v8?=
 =?iso-8859-1?Q?1HHcpnel7IF9jY/drYhUjitIKn38SV6aQkPtCF0bLXuihi9zARQ8ScQVah?=
 =?iso-8859-1?Q?cVQ7ahXSWmPz3pvxeTnM3WTjFp4ou+ul17qOnTtSCpjijWk19PNEMxKsKi?=
 =?iso-8859-1?Q?cYMzRcPKYSaUoadrl2iV5x9G9RSWGVbaP3vs9jIBllA/jUL4HMI5T3ObOE?=
 =?iso-8859-1?Q?HKXDvdCI25uXa9yo3YpuwlnpjhRVNvZLbuxRHsB/FLusLacXAeK4sE3ftT?=
 =?iso-8859-1?Q?Sx2n5KDtrkY5VmoGeg8dEkDcJRN0OoczLHthh7+v1jjjsNtoyzGyvmyFLz?=
 =?iso-8859-1?Q?jrXKRthTK1csvbn34u7JJNLjQY1CX7G1kjPks8EvrIPvWtVbT9BpY8Ozw7?=
 =?iso-8859-1?Q?1ielHvlUtuiO3l/6LDkLw3i2+fDfnaixyvgGlZ7XC3Ve6L4tDBipFTsOzR?=
 =?iso-8859-1?Q?80DjfGNTopgg4an14mucHTAsIS1P0Oy41upZfz0KDEXTboYlowgNSHJwPt?=
 =?iso-8859-1?Q?FM8FL4gkuO9Lt90WlCo2ALowpP/WM1B7ngxUcRFiePubOCc9AEmPsVvJ3R?=
 =?iso-8859-1?Q?oJKgm+pQy6U/gSlvMC1Bhd7lIGrt6i3RQW2s12WE9USTHa51OQQP8k8lXM?=
 =?iso-8859-1?Q?XMuMNrCfQt/7+HVybbEPPGV20OkDINj7XbeosLlMrlXFUoTCHQTdcxAXVe?=
 =?iso-8859-1?Q?K/yppcKn/AYsIbJXs77wSD37YZo72aoyd/sZUjalYPWT0PupEGcE6FWjLv?=
 =?iso-8859-1?Q?FvGG0qNmsKQupNOL0sRYMYcfd/Sd656/q3Zv2/HVgJD7/sM7FrsXpzsrSu?=
 =?iso-8859-1?Q?gvdaj35tBv5v5+T4IYuQivYRb1dSGd4LSv1C9fyIfGJqHFgz5mEmdC+Skg?=
 =?iso-8859-1?Q?+jAKrz9gFCyrw6AOdqlSKJg+8XHLx226vOz/ny6Y7QdpLbHGNsK/BJ+2Kd?=
 =?iso-8859-1?Q?U77iM00H8hMhn9q8ANof/AQlK9Cwelsmc36mdhuckjp8vOYVb2e0r1mGiB?=
 =?iso-8859-1?Q?l2oLYwGCgpqdl8jgxB4sZ9wGrlsqAfXyNvEria51l2KI+EoGziLhEzpSCN?=
 =?iso-8859-1?Q?Cjop6lhEEPwVKS1KM57Wzba90pgXlxJHnSBZZHlk9rpC5qZXSbNJ9elA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fddbae74-474d-4694-b147-08dde1b30e58
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 19:35:31.3582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KR7bCPCrFHBhLLhHHABqpWnskobWyZyzEyAR3FDtvw7PJs+CIV+IWRHEYei+0omFv2hc654kwOw3wsxqvzw3Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6344
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

On Fri, Aug 22, 2025 at 11:40:29AM +0200, Thomas Hellström wrote:
> Open-code since this is the only identified instance of pinning
> without mapping.
> 
> v2:
> - Break out this patch from the previous one.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 51 ++++++++++++++--------
>  1 file changed, 33 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 906011671b60..c9e3c811c35b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1452,11 +1452,12 @@ static bool pf_release_vf_config_lmem(struct xe_gt *gt, struct xe_gt_sriov_confi
>  static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
>  {
>  	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
> -	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_validation_ctx ctx;
> +	struct drm_exec exec;
>  	struct xe_bo *bo;
> -	int err;
> +	int err = 0;
>  
>  	xe_gt_assert(gt, vfid);
>  	xe_gt_assert(gt, IS_DGFX(xe));
> @@ -1479,23 +1480,37 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
>  		return 0;
>  
>  	xe_gt_assert(gt, pf_get_lmem_alignment(gt) == SZ_2M);
> -	bo = xe_bo_create_locked(xe, tile, NULL,
> -				 ALIGN(size, PAGE_SIZE),
> -				 ttm_bo_type_kernel,
> -				 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> -				 XE_BO_FLAG_NEEDS_2M |
> -				 XE_BO_FLAG_PINNED |
> -				 XE_BO_FLAG_PINNED_LATE_RESTORE,
> -				 exec);
> -	if (IS_ERR(bo))
> -		return PTR_ERR(bo);
> -
> -	err = xe_bo_pin(bo, exec);
> -	xe_bo_unlock(bo);
> -	if (unlikely(err)) {
> -		xe_bo_put(bo);
> -		return err;
> +
> +	/*
> +	 * Open-code for now, since this is the only instance of
> +	 * pinning without mapping.
> +	 */
> +	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {.exclusive = true}, err) {
> +		bo = xe_bo_create_locked(xe, tile, NULL,
> +					 ALIGN(size, PAGE_SIZE),
> +					 ttm_bo_type_kernel,
> +					 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +					 XE_BO_FLAG_NEEDS_2M |
> +					 XE_BO_FLAG_PINNED |
> +					 XE_BO_FLAG_PINNED_LATE_RESTORE,
> +					 &exec);
> +		if (IS_ERR(bo)) {
> +			drm_exec_retry_on_contention(&exec);
> +			err = PTR_ERR(bo);
> +			xe_validation_retry_on_oom(&ctx, &err);
> +			return PTR_ERR(bo);
> +		}
> +
> +		err = xe_bo_pin(bo, &exec);
> +		xe_bo_unlock(bo);
> +		if (err) {
> +			xe_bo_put(bo);
> +			drm_exec_retry_on_contention(&exec);
> +			xe_validation_retry_on_oom(&ctx, &err);

I think you can do 'return err;' here.

Matt

> +		}
>  	}
> +	if (err)
> +		return err;
>  
>  	config->lmem_obj = bo;
>  
> -- 
> 2.50.1
> 
