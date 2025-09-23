Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41478CAC5AC
	for <intel-xe@archiver.kernel.org>; Tue, 23 Sep 2025 15:21:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04DAF10E1EE;
	Tue, 23 Sep 2025 15:21:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B0A7LpT7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D77C10E1EE
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Sep 2025 15:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758640869; x=1790176869;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=D7kDGx9uJbDWNvNu6dkOXVs4wMLyMQnL1HsoWQLrymg=;
 b=B0A7LpT70doqSVyjKm8+f92J/m8CVpgsX/YfZGt30WUsgCoS5vFYaMXq
 3kEq3oAWhB009fIINNJq9HBC5tvqwlNoewtC7MQzU7xz1v/zNgp3xxP4Y
 zI9PlMFSTiJaiAlGH9zyLVdjSNPBMP2aFIp/DHpH/YCnB+SYHnGlKKWji
 7e/1C8IkQ2vb6ItcplTFQOB67WTV9xAImfGxV36pvu1HhCQPajGbHxkaV
 GeDvSgkqpEQTnmm9m11WnUA4Y6d3GaPXNX5+cHjbUp8FwZcIn7BbfxGi9
 3abyYkUgGZCzwGCClDz4SM5VBiejkY7M2ePOmaDhvW+mVyvcKbpIARDAM A==;
X-CSE-ConnectionGUID: cwHNOEx7RHyta/IsGZ0XLg==
X-CSE-MsgGUID: t8xoHYHtTcmykHbxidxzog==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="72349211"
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="72349211"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 08:21:09 -0700
X-CSE-ConnectionGUID: xyNjYajLScCZnz5EA4khig==
X-CSE-MsgGUID: cEZ3siICSpOOBvPbIqQtqg==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 08:21:09 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 08:21:08 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 23 Sep 2025 08:21:08 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.54) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 08:21:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A71Ze1A4bGg06YnMsZIrfYux5p20fIQptX2VmavkQKPOeEC8RkoKM1DcCkM6BNbaGe0VMlM/riEF/fusby1lugMq/deJKeP2o5no6pLFjmsaGE15IlhT0RVZFZ01uFXGgrVuvjJ9K61X6ZFi1HCV6TQ7xk2X6EX4okv8G5tbtEkimLygLE1r++jFd7gqGldW1CcRcdhzyMSj3Qjr6FWMO/KT0vfHgpVbLj4BTiA11NrgBk3+YO/l7r2xvmbTV4S0mlTUv6j2yLc9NuaLyTHPtf3kiC0LTtaQL/S6yvZRkDgX/JKHhmLWmC+2exefbKztXx3Poq5hBZ9zPkWbKg+f1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RqM2mEsPh/J9E8DZUidCwwfCuLXVwwkFB1HXwStwGfw=;
 b=lTuwVRx4981rdyM0Ba+KMkULMMg6U0vrdIz1Xhlyg6czbePWaQQhWzjOyJhJCm0nFg5zeNr80xqvjMowEPlZeqeCf0OPvjSyt2M1sUly7P5iQcp+gUH2NXA/Cy50X2WNK2rJdmJPasavJg6N+TuXAFAgtUz+covH3oJTUyW7lfj92x8v8TfQCMrDcr0b5swVrRMlRTvICGf7Nzzu891kd311y+nWB9vrFDXUGx6gejouBfgsB5zOaLg9UvUTEUQKQ5WJoOhEWzt+jW/+Pq2n3SwvZ9LhleY5Q/RXcvBBHvwVlG+l7SsPrf/tDOg6oqZmpfejQdPSxyD8EPXj3x7aLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW6PR11MB8438.namprd11.prod.outlook.com (2603:10b6:303:241::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 15:21:05 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 15:21:05 +0000
Date: Tue, 23 Sep 2025 10:21:03 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [bug report] drm/xe/configfs: Allow to select by class only
Message-ID: <2jgmmn2zvdzzvz3p56u2uzrwnf7zoehmk2zwas22hf2fw53drs@tsgotszrsvpf>
References: <aNJKnrCQmL9xS9Gv@stanley.mountain>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aNJKnrCQmL9xS9Gv@stanley.mountain>
X-ClientProxiedBy: SJ0PR05CA0091.namprd05.prod.outlook.com
 (2603:10b6:a03:334::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW6PR11MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: b7ca84a7-cef7-4f6e-4344-08ddfab4d048
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AMaKhNfCaekhDPguGmDMGw1E/xL6nEkpYlbmaVCW/U4wqJXAcqPAQc7dOtkp?=
 =?us-ascii?Q?OqJWUGn+SKpW35vP5seE+uSC3k5lGvoucNZBMnwn7goDHMGWzqe3jellwVrS?=
 =?us-ascii?Q?C6PFi4XNcuWKkAckp9pA1zgBKyTIcyIH5SYB5NhJ9tg7kGpiZT5FpuKoxWxr?=
 =?us-ascii?Q?7+IHh4WexpFJdW/dSeHhaa3D/2hCWAXuwCdYJnbVAnUDl3jdx+jTYpsT5Rb3?=
 =?us-ascii?Q?zyNW77n1JHCWDMVpn0T8SpClf4A0lPh+eI2SzjiNu5xgoL54KlCObr34WIzb?=
 =?us-ascii?Q?KxDwzEg8O63gB6sIVebDOgHlEMvNFxTm70XAKAirTUwWrxs1xo9kmFNdA8te?=
 =?us-ascii?Q?eB6FKBo8c86cXdr2w2q6lGFHoX9wvS/YufKT/091G2GHIfZ5QzU7JiEA3hIu?=
 =?us-ascii?Q?xhG7RCaGyCEAcu7fH7mZjKu9IPk+MUv5OR4EyF/MovezS4M6lNgDPuFbHUQ1?=
 =?us-ascii?Q?DpOkkSOm2fgyStpQ0KRN8HTfjhuM5Ux/2A6Uou+TUFtRp5dz8xVCPU0Wyaxw?=
 =?us-ascii?Q?y7Z2CgtOwnLTKVgF5FmLEA5gOp1tnvRUVMspXl0FEOz34T/3vX+su7vSri6Q?=
 =?us-ascii?Q?NiPU8EPXFWcFOlMyol1J3rzSP4gzuRS3LfKj5euLsu/+GmVS+KPFmKJOQFuU?=
 =?us-ascii?Q?1kSOGYuMO8DJpmmyI321KUd0xZ5qtdOTCBIdp/pGvo7vg1Vcm49Fwonnqplv?=
 =?us-ascii?Q?VWfkFiQYwWywFg2Od45weo6YI82jNkc+d50t+dwmiyeSZqH6f4B+Q8UnGNE7?=
 =?us-ascii?Q?etd3EFL3ocfir32mJ+Pkj5G+F/uL9OA8Ka7VRLEbOpo/VLaMPYbpKUnNLADf?=
 =?us-ascii?Q?PYCtGqMjT3gR+w1s1G2aOnc9yAjuyzcV0icG1ryhKUOxHt5S40QQuIjAfgqB?=
 =?us-ascii?Q?3UPDRD5Pno8fLkt+8I4O3n01BMLbTR3toYFQ/c/fibIli0yZ8mFM4VPclGZV?=
 =?us-ascii?Q?h/kN5b8MHt0gnoVCh485imMxmckoNynKYtCy6KuWP1sSMiguqzfNPm97WspN?=
 =?us-ascii?Q?5C1h6tOBahWAXToVc0dCH6s9d5ODDHrrpMnOz6aqe6Ls8MW5/627kQTvl1Xe?=
 =?us-ascii?Q?Dkr6/2/YzOIo1J7VvQTLniHgvHAYUNtPHlx1IXEy+iZh0bWqdj4ZjeusAB/H?=
 =?us-ascii?Q?fAM6eN7Mk0rpAmCpbNuDGYZk7E0DLunSVZ7IsgfbSFisCbBQ5b0eoeFQOLaZ?=
 =?us-ascii?Q?lS0dzuohCAAnoS0NL2bl6Ob+9B1bhDYRHn4u15wpF+BStdUG5mlCJQGgO8nQ?=
 =?us-ascii?Q?EsBOSDYUHNlo9OidL8JRosRFrbBDNciZLAfhX06G3uy6TPDrNPRt1hFhAwfW?=
 =?us-ascii?Q?Ad74Uwf+BnZeZfbYNWlfVcVBPvqW6nP/rYdC0q/eLQF6jYMCI444CO4ctPNb?=
 =?us-ascii?Q?LalxDNYWodh0N1ZfGTeeLvmNP0VsSscoMx44pCpw7M09jjHHZWNRT8ZAFM5+?=
 =?us-ascii?Q?X6zVtQ1/S3Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rCYOIzb574X6oqsDClIu9iju5M9EsA2lCtZxvGWcWgwdNWo7mlVMtx1nlsFC?=
 =?us-ascii?Q?ioGUmtP80dAuRmlQmIyWjDrs1YbxYhWHii4dbQXuEluM31E7sMj0Iks34IKp?=
 =?us-ascii?Q?MtPpfNZGNSpRrI3HKvpKP3z+mZdm1mlK6hXhaN1hleQarWRl0KJJkhIH0k4U?=
 =?us-ascii?Q?P+2M6ahYORMw4M4uoRXArflHx2pRFxAPX3iRK8Id0P+haluzaqnS6Ub6dosD?=
 =?us-ascii?Q?mCYv5Bc5xry3HL7KFnz0PI9PqfAShzc3Tu7sp71ldjZ3xX8TLr0kINLSJRje?=
 =?us-ascii?Q?q8qqKZk45Y8hsWz67ETrU3fb3aOcHoLWsUvuxyW79jvXEXq2F+G4kCbj4v4u?=
 =?us-ascii?Q?VjDvxbARxSBSkF5hwEfXShX0u7x0trr3mKqh3Y2zr3j9nCROAaFMN3eLuZr0?=
 =?us-ascii?Q?Z2QprtTLgrwXTUA6XiZeY0myLy1jszUoLgRNrTqiRGqpP6aCDW9MKAia/zPb?=
 =?us-ascii?Q?lO6uTeynDN5CQACuYyNTh78buj4XFS8EkoNkMEjEP9JQBLgwNh7akFiLuOQ9?=
 =?us-ascii?Q?9ntgureRWZpwAHTxcjLdLQDzt61VAIbQ40p5+nl0yE0sENjZc9RaAA5RxZU0?=
 =?us-ascii?Q?9+nG8BY26cmpLq380nhdR6O0CQ721uKF2BELJsDrKZ4fFXjVT7ye632+/uWV?=
 =?us-ascii?Q?Vo25lqf0FAT/uim8/lWsl+C3Y2DnFrwnv10wgAmuMKl/n95FuR7TGs9+E9+L?=
 =?us-ascii?Q?InA6ePwNqTSbjv0EAa+s10hJUaSVD/HMiUAtjm8xZWDsRhcchdLwMciYNcZQ?=
 =?us-ascii?Q?5dlr3fAzIefgIWhiZU83jZLt6OYOYa934Ia4n1YTRNCqEvPUQyIApB97DH86?=
 =?us-ascii?Q?R2eAiVWbW8qIIX38wR4aYtDO/j8M1WzePQSLg+gzwug71vDQAIl19ORmm+1v?=
 =?us-ascii?Q?2IP/skbr36uUhKpsT+WAz4jy7nx3rKBQU2rT61tB+906FEn6Bh985d3MYhbS?=
 =?us-ascii?Q?Be8IEpK0qB2QxtOocPw9rwCoDqNBaQ5pwctID9Qyt1n8y+Nr7z+3aKluZjUQ?=
 =?us-ascii?Q?qAHeIqU9MC2uY0YbWWXUp8fEWo2KFVPpJi0RDpy9+7x+VBbluBAl/NgYJBZW?=
 =?us-ascii?Q?D4da+sgWOqMR6wvT+/KPeC/wCtKV0CKWtq4pJdfVEFerOJfgytZ/00IX64kc?=
 =?us-ascii?Q?OuCxCsoQB4TC4UnlDY/aVlZVsoj2LNFQcSGtQNOlijyQ/dieAItTIFIwE4PV?=
 =?us-ascii?Q?dTN5Q29NhbzQZyZn+AV8rtsMh+JBXdRSnGwNqUKY7JF3VSEI8Ax+f6s6Sl6z?=
 =?us-ascii?Q?4MXLul/vC0d6SzmEwNbmZdj+ZYchmnRCHwjUriEGnl0Vo/gC2FlGywu5tBhg?=
 =?us-ascii?Q?Q09BAdB1e4B4STySuAF4RLQj6Kc3oFZsaGuKVNBUFvd+sGqEr8+1n+XWXNtS?=
 =?us-ascii?Q?QKE3PCC5U2YtovzBbKwK5wo93laZeXZIfwCIstPu5GelkfOPZ/EYSaTroiLj?=
 =?us-ascii?Q?DaGHGWvTv30t81kUSINquoxONQe87uUu9oeUxeioOsvqlotiPfwC2K8IU+xj?=
 =?us-ascii?Q?P11yi11/aPMqPWTdcnTobAXc6ABPe/zlojIClv0UYeiJZVGEgjruINUszAS9?=
 =?us-ascii?Q?O9OgZnZv5L5EpKbUkJibfqkbr+jwCJQvH2xl2dBGj2VdtmanTKS5kq2Hmymo?=
 =?us-ascii?Q?uA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7ca84a7-cef7-4f6e-4344-08ddfab4d048
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 15:21:05.3974 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gmsp+js74XOycAXPjL9Jk6ot8LRC+Bo6p1FT2H5M1J3E+zH78h/Xn0+NNDtDLxqs5mjwOZfdKbAKV5l4o00hgF5/g2EmTke6RDYu7lvj3Oo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8438
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

On Tue, Sep 23, 2025 at 10:22:06AM +0300, Dan Carpenter wrote:
>Hello Lucas De Marchi,
>
>Commit e2a9854d806e ("drm/xe/configfs: Allow to select by class
>only") from Sep 16, 2025 (linux-next), leads to the following Smatch
>static checker warning:
>
>	drivers/gpu/drm/xe/xe_configfs.c:331 lookup_engine_info()
>	error: we previously assumed 'mask' could be null (see line 327)
>
>drivers/gpu/drm/xe/xe_configfs.c
>    317 static const struct engine_info *lookup_engine_info(const char *pattern, u64 *mask)
>    318 {
>    319         for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
>    320                 u8 instance;
>    321                 u16 bit;
>    322
>    323                 if (!str_has_prefix(pattern, engine_info[i].cls))
>    324                         continue;
>    325
>    326                 pattern += strlen(engine_info[i].cls);
>    327                 if (!mask && !*pattern)
>                                  ^^
>Presumably this should be || instead of &&.  If mask is NULL the
>function can't succeed.

adding || here would create 2 other bugs, but yes, there's a bug here
fixed by https://lore.kernel.org/intel-xe/20250922221209.110737-2-lucas.demarchi@intel.com/
I will probably merge that later today.

thanks
Lucas De Marchi


>
>    328                         return &engine_info[i];
>    329
>    330                 if (!strcmp(pattern, "*")) {
>--> 331                         *mask = engine_info[i].mask;
>    332                         return &engine_info[i];
>    333                 }
>    334
>    335                 if (kstrtou8(pattern, 10, &instance))
>    336                         return NULL;
>    337
>    338                 bit = __ffs64(engine_info[i].mask) + instance;
>    339                 if (bit >= fls64(engine_info[i].mask))
>    340                         return NULL;
>    341
>    342                 *mask = BIT_ULL(bit);
>    343                 return &engine_info[i];
>    344         }
>    345
>    346         return NULL;
>    347 }
>
>regards,
>dan carpenter
