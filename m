Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF3DE6FE4A
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 21:41:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6685710EAF6;
	Fri,  6 Sep 2024 21:41:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SMwgCZ0x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D6010EAF6
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 21:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725658865; x=1757194865;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IhF9jVHqIWqXDdoTJ5xeMs+x8foK4ZemEbgt1DlfVLI=;
 b=SMwgCZ0xA9EK8W841ijGEqPkpnTIKKdiUMUz/wxWpnA/fIkoksGXd1+M
 k926dd2qgy6Cu7LrmMI/7/4S3sU+tIHYSrEqMS7bx4If6Asu+mEI/Wpen
 N43pgLhQ3k2n0bYiW1VkM1AYmCGR4QeizstnPHjitg6AynkuEwbBHVZX8
 QQOXD8jR19ZtzJOgDtTOubu4ltBt7vjHzcWbiBBljEJr9yfYA4u2SvpPJ
 /zsMjli7Q9JeNoOa0s+KNLDfuXbzcsqsXRckfrQQiM2AWYQXkt71dgPnS
 E6FvXP16MFbIPnx1KgWbv1oI3Q159UP7ducFJ67oUXEYj5qIrIoTN6zcV A==;
X-CSE-ConnectionGUID: XWArKzMFQZOdD1rrM7gD7Q==
X-CSE-MsgGUID: NmjxxBCURqKv8tOLeJe1KA==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="35576432"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="35576432"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 14:41:05 -0700
X-CSE-ConnectionGUID: 33tWZR+QQKq9vMKPzjw7sw==
X-CSE-MsgGUID: rhtjICC7TyGAmZmh7i9L+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="70480975"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 14:41:04 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 14:41:04 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 14:41:03 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 14:41:03 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 14:41:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YIDm0yxgoyTvmchpc5Ky8DIrkME2EuaGP3n1ujR3ORbsb5l3i8l4nuPOUG+DySkld1/AQkglqNmeQYUfN/SvuTi6ykctcIUR1ZxsOyenjw5INRtcQg1zsYOUiir4yzpEJ6rIsVkZ2B+2aUK2aMgLGq8A/l/Uqn43XQ8RAE5onYarY0VkRF830VVLHzOkyKd4eN/WR93aMFtSBktMoWz3U/Ze/ktRzdEHOx/6h+aFrV4F9EmU+Rj0oiHFGKsSPYr4TJwgUYHmBIOoV0viPtC2qGOR6Y/UOPYtBFp8/F7rgJ+h+Anm+29EsVubSV/ldDKNQAsPXSb3CI2raHmqvTCPhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IhF9jVHqIWqXDdoTJ5xeMs+x8foK4ZemEbgt1DlfVLI=;
 b=Q65ncKcg/4+P8JLmSUIDrWW29dkp+KZNj5YYTeRzK12Ip0wZ5W3xwbwSb+HDKPHbuTHaeV2FZ3gcOj1nrX6/ZlAsEo1Nrx24RbzsIaEha6onZfAtt7E5M1k3V7aP4GDIGqLOolaGuK/BjNy/2DjQNzbrcrqRvne//ElRlagsVEqO7t96sz+R1RJp3lcq0/nDEM11c9VifAKgYW+vxuBLzG3hkXu2+CZf13DAIYMMNNJY5be9VAxS0TtMQQ8clvzhcDjfyyzlqlI8XoTOXdiRpY3lYqxYa172GdAVPaJBlHaNCBP6XW41GwXWqQLpUKGBp6OpiORGB3roCqYBPvGt+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB5147.namprd11.prod.outlook.com (2603:10b6:806:118::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.31; Fri, 6 Sep
 2024 21:41:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 21:41:01 +0000
Date: Fri, 6 Sep 2024 16:41:01 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 12/43] drm/xe/hwmon: Convert register access to use xe_mmio
Message-ID: <j55rns5mmjv224o7sg43ketqyokqu2b4dmqowz27qiz7n4e47x@d4nthoacomeq>
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
 <20240904002100.2023834-57-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240904002100.2023834-57-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR04CA0169.namprd04.prod.outlook.com
 (2603:10b6:303:85::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB5147:EE_
X-MS-Office365-Filtering-Correlation-Id: eb8c2bc1-12e1-4317-afb1-08dccebc99ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kKyVRreL2BoyOp/ZU1kWNdWul+qBlxmTp9VJi/YYK+Tule/GxhHhMDj+TAfK?=
 =?us-ascii?Q?+sPbLsMoQrB0PKaZpMllFwrMW4k6VPYq1+AgD7uKRjYBGXZtFtl3Xly5pYHj?=
 =?us-ascii?Q?vPGPi1Vmd52QBVs9zj1mR5S0LaqIxMIuC/1TCauhlkRXCyWRvvbJkj91hE4b?=
 =?us-ascii?Q?2/JOVEOjF3Lyzxq7dJw5VqCQUSYdN4xzG8IVRL+RXWeCDmvmQOmGA0Dr5QR2?=
 =?us-ascii?Q?nJa7luYHJe544tWb6S6fQiPP65sGmjZzCH0jgcUYJ0PCMm7RQ+ACxbxUCE1l?=
 =?us-ascii?Q?UWxVqt1e438SbQ2s4soqGgZoKOroZxsVv5EuvnCx0yKoaqaUeRgZycf7DePr?=
 =?us-ascii?Q?E2SQHON1XdNkoOnkxeLYWwGf7eEtJPD/mmegnq4cXo4ALstG3dTqiok2v32S?=
 =?us-ascii?Q?KdlHA/VDs5oPs3Sn2jhkpDcrDR5u6wnQ1k3X+9jbbofid2U9XvqjpWndDpJZ?=
 =?us-ascii?Q?7YPMpMT65g7JC0bTZCCwTashwsnZ/GlDAxhMLuaXbUwj4uf0yUfAZ4BvlfjV?=
 =?us-ascii?Q?qD5DyHenjX6THRMR5BDf9kH97P2/CpXXJXo9wijRn4/oYWLBpwUdrewVsDuJ?=
 =?us-ascii?Q?5QhpFsvFNGILfhC4QUMRsW9htZEBQrNe0bZ5VnfyZ7a+QL12FQDVGMfyUPD9?=
 =?us-ascii?Q?ZdhO7E9a5TYABM9gKwHpwjC0bkJIctwiC7oH7gKiuXid0AibhqUydIlcUW6n?=
 =?us-ascii?Q?jJVQuL2Tu9/92zn6aUlcMB3wPqXUvUyTTsG2Lh/rZ67TJ7uPxHUPErnrT5HQ?=
 =?us-ascii?Q?5QRdp0IoyrR11REmt3KhCCPLUv83e9NlrvSn4T2ZHAG3oQ0PrLkgyrw9v07M?=
 =?us-ascii?Q?Gljdpwb1E+orj8lPfmag+XO1K3dj/K+N4JmnudRgnEjAh78BfPnVM22We8aW?=
 =?us-ascii?Q?IAE+WjYmjKDpTsySmv9PSwYgLHv5wFmuHL3VmfilONZg4K+C+gi7rZz3N8ZR?=
 =?us-ascii?Q?BfSdI4DyclwWI6k8SpnCBWe5sBDdSnLLHcvgKs5nyOGRby7EDDEJjG7L6rlc?=
 =?us-ascii?Q?+LR9LB8qwUqXHZLk6QUc62SCRk0BSCSTAvMDhb05ViqBOs3HoJFh3RZINS6+?=
 =?us-ascii?Q?I2QTxx5f2fr5nYKdkAsQ9+Sq1wlCMsGpvzDuDZ/2caAKOl4WHsPfNIJtws/f?=
 =?us-ascii?Q?Tm4Vf/VMV0PTZM6K0QTnoHKfJctTelVAgOBU6ouOUT9uYBmMUbXVCNSHUijB?=
 =?us-ascii?Q?0ZxVirKhtAZzuAbrJdQgTP7MWvzuoYEiXRcX9HbJXfS7mFKIJPKGQLqTnk1U?=
 =?us-ascii?Q?LSw3wC3wIFMheW7N1GCCH5Z4c7nu1reoSS/5N3kxO4EgRvbsS4Mu3xyS1TTw?=
 =?us-ascii?Q?Or/CfceQlDhfFTLU9mHyavElhOaTxZXVWExFCrXSh1lx/w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vAoj6sW7JJiPoGHr1tNgxmG9iXKTGcq2IRkwVO0UtVBaILUuVusW16pdTKr3?=
 =?us-ascii?Q?4i2xC5acBGWyruMDlVLYm72aVP2rBPhK5JMpI4IhKStU79gSw3Zhxay93tFD?=
 =?us-ascii?Q?XFIx2sHNTRPXp5ZRsuzoUo0UJhEthNcET5KlPHEtJJ85k8uW/n4WwbISPr95?=
 =?us-ascii?Q?Ril56gN1PMC/F6Fb7vsJMM5mCQrK/eZj5orWBn+uNRNOAtlnquY65unnukk1?=
 =?us-ascii?Q?5OfTVV2D/wkerP7cBMvKiBE4MjJW22c67HSHVqKrkSdSWYEiaPwyOYOUaMOX?=
 =?us-ascii?Q?LDt9ryBfbb22mPllj4Gk3+XQK19JMaUiIdqBE3XSqZGa5WfULBTNxQse2g8Z?=
 =?us-ascii?Q?BCZso1cj12YzkgXOkLESi6FxskgXDHWTRxHbP7O6N5GCceVA3YYKtL7+NXWK?=
 =?us-ascii?Q?C24TzlDAFPS1elAQRYTE5qmwoTAo6+mjM46cS8Nk8E+p9JayOBfeVpuRDPAx?=
 =?us-ascii?Q?X6sZ4IM3P6Mv7I1qD0sqGpCnO6xRQByaK7o5KEnafmats9WH4iReTwdcJSyw?=
 =?us-ascii?Q?OBE3hsOLdylcZEppwrBA61s+xO8OR5Ctm362kHWo6blzXB+QScQzJ99AAw9G?=
 =?us-ascii?Q?aw6rJxkeq+mhedjIYfzl4eOjgW5mQAX+s6Ay4ssQKSG5ycaEpkAuprU8V6EK?=
 =?us-ascii?Q?RZ4nJ2luM6x/pYmN++3L70MHUfka4ytnamlOseZfSbZCwazgNeGTJ+bgly1Q?=
 =?us-ascii?Q?xgfpGcKen6paOaqINxS5KhDG3m1MOY6jMB74b3b9zUqSA+wi4Ee7w8p820Z1?=
 =?us-ascii?Q?IEspZsA+upXPzBQdLqWLNKmIsJVN1zcTZuozJmT7vKC4Sdy20DWuS2Sjw3Py?=
 =?us-ascii?Q?7tmi4wc0iqo2g5dt1DVnLQ8iWHbptfY+XHDxnFt6begER3TV7i2tmnsSvSQu?=
 =?us-ascii?Q?79tszI8IEZCx8YXrnKG5h5rZ9/ZN/bAgP4nzpXtJE3aFHvKshYr9WHvc2/4B?=
 =?us-ascii?Q?M2kusT4hNecO4+hGzk+cJlINmLouKvRBr7SNALgTCw+I/2zVMzBmtemPebhJ?=
 =?us-ascii?Q?05rYrWzNmoYxseznHpzfAc9OTEqB8HoNordjxxEJM1R4aH+8otU8lfm8l8rA?=
 =?us-ascii?Q?BC5tetmSh2jmLOXYcwdFTn9+D3DVglMgcNEPSRSHO/lwDQ1utOtYiezKKyCr?=
 =?us-ascii?Q?FGTxby9PAXXdCEkFYIgmPLgjnZT9MMZgG5PB5rxsaHyTKK3MGaWjp0sRSKvp?=
 =?us-ascii?Q?mzjT9/2krjW3Li1znFoPTvMO4wUyAvUzYpI/AmQj4myrptE7iqXA4+rnUDmL?=
 =?us-ascii?Q?Br2WDicvx0UG9ZCWbdGQEp3OjspFfZvhznZB/xDAwtGVCZLDyXpVNeNIlVQt?=
 =?us-ascii?Q?moQl/5VoR08WIWo0soKVZDo3d5HBR0r7KKpiO+WSRCOMKOfPbvUbsqB/wInj?=
 =?us-ascii?Q?/LFf1bwNw1H3BB8JYyVfJO77O50bujRgy45sNN5bkJQQ3GU9+qX6f0Nuj0mk?=
 =?us-ascii?Q?hQ4GKrhCEduCvmr5+B1LF5GUDzLK/k1Yb89QNvEoaeADberdU3ByipP5z0t+?=
 =?us-ascii?Q?m0TQoqgpXN4V9QOM6RyEs6NQIJBysP5DjBBbatNe4fe52Zlh5/DUibWt/3aC?=
 =?us-ascii?Q?oQjNB1fqmD8+nSXpEiXl6xqCoAKZDP5l54DAYUwEEMPETiVfd+KMNnFFvRJn?=
 =?us-ascii?Q?3Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb8c2bc1-12e1-4317-afb1-08dccebc99ec
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 21:41:01.2298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MGkdTUOFVrWB+6YdAG+oRRBtWQLv2V3gbeFo3f9Ppi79sg94w062bzfY3rjnqbA+bDL+IPi3pXC9AdMx+jg1y+wYW/2T4DFr8uZpuQNv+TY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5147
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

On Tue, Sep 03, 2024 at 05:21:13PM GMT, Matt Roper wrote:
>Stop using GT pointers for register access.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
