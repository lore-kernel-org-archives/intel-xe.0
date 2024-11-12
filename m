Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3ABD597AA
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 22:26:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0885A10E113;
	Tue, 12 Nov 2024 22:26:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JYTAtVmL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F4BC10E113
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 22:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731450403; x=1762986403;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+0zh0umUvcPOCFgdoC//TtjCQ6FU5x/emY+5eRjWbTw=;
 b=JYTAtVmLsgDPONfisC2XstEECGdRil+ueCQgk/VcuducwhN2KfmxZEOp
 M/CsVfEhthLYNTKdwyXJFe4CQbsDpqHCjOHBVG/VFgRxfNnrjw2/s9We0
 HUKq7x35E1sJ80QamwOwylN/S26CWbUuBd/Wv7MutUuIH/JDHoDOH748N
 ABc3gLGmRufS92Y2kBf8FoirlCuG4l58pXHOl+fsu7F44N2/XDb1MxFZj
 gHQdI0a2a2s8udJZ5ADvb9Imia+VIxjU4iZgFUb71VfxIQur81Zs8I4u8
 BNwki0CyZzOG/1q21nGkJydGCu9qibpLX7/M94bZ4zcj3kFAUTSg/zDcb A==;
X-CSE-ConnectionGUID: 1k1vmyhbQSSNEoY0EVoFCA==
X-CSE-MsgGUID: 3VqILrv4Q1GKjAG78qpbRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31192953"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="31192953"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 14:26:43 -0800
X-CSE-ConnectionGUID: 343J7NKcSiehjpcslcrazA==
X-CSE-MsgGUID: NgbSEbK2RMe9Rf0JxSxb7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="91716935"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Nov 2024 14:26:39 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 12 Nov 2024 14:26:36 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 12 Nov 2024 14:26:36 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 12 Nov 2024 14:26:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nCNE0WjMAqxPWJ5JNvhEsxc9eODAQyj2nFbacPLxTgyioTh6uXizE7fUUAyi7/PYFskps7KKUZes6/9aYUprDkIIQ/J+swZU5Ff2GBZlqLSkqxY07ahLFqIZSaTVq9Rn9J/pejTinblO+hJR5QJU8Vnq5LGg8czdtYONC/YHdXqo48q9Fn06aCFIhfhvIiVhT8/g13rFErGGy48kq+Y2+RCHL7EeyIlTS/HamGXXJOfoJjjvRdouqQqdDQ2Csd/C0ZDOJ4bau+/fShbnO65VpwagysM1t+E/ozlxKeDHrH+/3oT6rnxWzvFV1fTlsSrV16mvy07mG44+XJFa2uYa4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+VzmhyEfPj9KJtXVBwc3pA/3UcINCzHVqla+uIUcysw=;
 b=vUFe0ROM45CA4Qsql7mhKreuDOnjD9KIyB3RWdki0PvfweyuXKxlIT3SJqUHX+Kv2pauHIItYxIHRt0NMrqCD8k67S7dicnK65iLMgUdqY7JyH5TNrZlD9XlzXKv9gTwjTQ0EaUKHSZ3tJQZtchvN7P1+0UloOyl9xhOFuZZsZpU0ZOsG6E92xUq3bs1Y2CKqVEJ+J0lIGk8GhYWniOGMmZVuSrWD3D1kt9JKPAmyGpMmRlyIeIGz6EgAwg7n/7mPpLaMdN/jhdrAKm2/tAgnGl2gLrnFkcbFu33PXf9ql7HMZnDOO++KjUTy7mL6FpgnuipbMa/5srkf+yI9lQeTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27; Tue, 12 Nov
 2024 22:26:33 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%7]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 22:26:33 +0000
Date: Tue, 12 Nov 2024 14:26:30 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Harrison, John C" <john.c.harrison@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Teres
 Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>, "Dong, Zhanjun"
 <zhanjun.dong@intel.com>
Subject: Re: [PATCH 2/7] drm/xe: Add ring address to LRC snapshot
Message-ID: <20241112222630.GK5725@mdroper-desk1.amr.corp.intel.com>
References: <20241108174312.272792-3-matthew.brost@intel.com>
 <CH0PR11MB54441F26FE46E5366FEC4EFDE55D2@CH0PR11MB5444.namprd11.prod.outlook.com>
 <Zy6aVcXWot6hBV1n@lstrano-desk.jf.intel.com>
 <CH0PR11MB5444A8A2BFD2FF1C0B22CFB9E55D2@CH0PR11MB5444.namprd11.prod.outlook.com>
 <9d829b21-4327-4cbf-ad72-b3e47d57fa74@intel.com>
 <ZzOb3FtRFAMAQzt3@lstrano-desk.jf.intel.com>
 <CH0PR11MB544468E5716752CB21F19C2AE5592@CH0PR11MB5444.namprd11.prod.outlook.com>
 <20241112203006.GJ5725@mdroper-desk1.amr.corp.intel.com>
 <ZzO-kV7niWsIOiHC@intel.com>
 <CH0PR11MB5444989A724E09C2A4FF3E2EE5592@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CH0PR11MB5444989A724E09C2A4FF3E2EE5592@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0294.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::29) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH3PR11MB8562:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e408874-84c5-4663-1fba-08dd03691000
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EVFwn6MXfuQhnfhjP9Pl5NKAB8e3iZc9IVi1dF0/tCxD65Hr/j/8jO1YiRrN?=
 =?us-ascii?Q?Uz5XxH0Wpy5P6D2lmS3fOEr9v8zrLBt8DqXV/hMw4UdCV3BqyLqBLWsVUgLA?=
 =?us-ascii?Q?F6yYVmymdxPgKPwuGVm7pmnE/d/t49tRCfWwpfq4B2H9X1NPT+QryczU5NF9?=
 =?us-ascii?Q?xSrlSP6sqtHIKtkYcfZTCJ9DJs/5ZJAdl+2IkyU2RUNyvnt17oaFb1QLmmtE?=
 =?us-ascii?Q?lvEyC3HBEggIxUVOiiwXH6i9JwVsJpI6nAbwpl/V5IF9ZtaGDO1TctwFz+Xj?=
 =?us-ascii?Q?tCXmVRtWAcwV4qtvkL2eC+27imxlpDbWd0NtyWrCtAqKN0q1P9b2nuMqoSHN?=
 =?us-ascii?Q?KkHJDBC/bBQciF/M0Pdi+NSiM2Rm9+FCmhVE92etcmKkvOZGIX/PrcV/LKAZ?=
 =?us-ascii?Q?/6iUDgrYMRtD/MF3nNQoF6fg4MP4JTmDiXd99R3Uh/BwUXaxniU1jIvTqumA?=
 =?us-ascii?Q?zU1yZAJXLCN9/vOeq1lxYgkfmvGDA3CQG+JPubZMhkQzEvDbMAWaoCF1r9ue?=
 =?us-ascii?Q?NWU38iMML3w/3Xt2n7rFRcwWF2FCtndC1cyYU7s1dLFgFvoJAwZwNJ/K64Oo?=
 =?us-ascii?Q?smFW5BpayzHw+6+/UOEzeXobKN/c/28drvteTe6kY/E1xyOXV6WdxsLPxVhM?=
 =?us-ascii?Q?NxU5i6O7eXKwlXp2pPbDb/hdZpyKuz/TnFRk1ciWI2w0NFRdyQNh7NpmQnKp?=
 =?us-ascii?Q?btUc/Z2CbqybcLNKTpwmCwK8yHUFBodTQH5BS5Wh4QxNpDh91+47eoobWPop?=
 =?us-ascii?Q?38PxfCPAMedOlfBNmVJDzxggpeRJGYpjXU4xvBtgHBtX4OV7KaqWsP8wdNWW?=
 =?us-ascii?Q?jB1ii6iR+BY696TrU3XcdatnHDGq6sAfouph7a29f1GEpSai8k2MbjxTW918?=
 =?us-ascii?Q?O+ECSFrwsKZHB10ZH9Sar+Q/9s2a0qwp0iuWuUvLezFLbm3x0w8tQzPrSYqc?=
 =?us-ascii?Q?Uz9pihinP2a7foCfS98NjP/9IrlqJTULe1eRMa6enQWrG/wSzO9bhhSlK/9F?=
 =?us-ascii?Q?cE6r+2cxtpWpaQRwMg8bfP4MoaCkwJ+IJDHSBl2nvJ/teHQJjH3qFXACA8vu?=
 =?us-ascii?Q?wb4NFKy1nH90hH9iwKoLEVQSDr1QnWd5NDn0UwCNORvROQFCFHuu7iiTLcYc?=
 =?us-ascii?Q?xH0GoThLbBMwoT/BLraY4zlQevi/ezK1Ra2MAem8nf5K2lqfDz0YAqreREdy?=
 =?us-ascii?Q?yYt52QWwHaxQJuf26J8un4F3Tp7Z/cr2EeHz2uOxTMDEs8QSgA+RtdyJn3WC?=
 =?us-ascii?Q?TITzqdXDOBJIJ+WwrwukWrGN5FGdZv7bjHpv1mXGVA31B62AvniyZsnZsbhf?=
 =?us-ascii?Q?Nv+RaY1rHumC3Q3r5HBzNydo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ieay35gCsbfQb03zlwWJLHe9cPiOKESWP5VcujzRCj6b/lyeEFHkuRrZ1q+Z?=
 =?us-ascii?Q?9lGnePRBKpVQja0o0v+aqhl7IXR06v1TKTPucncXSgrM1All46xCualdx/v5?=
 =?us-ascii?Q?hUbNKDt0O5lJePLY5VB1fy+xe6pZ2VphU/zerhd50Zsc+ANQs6momVkeQbcB?=
 =?us-ascii?Q?hYmKUD8QCzbrP+oHNyq9wa/R1+NJvU26kUUyVvekG4pjAUHkOqWApCwn/AVZ?=
 =?us-ascii?Q?Wfeukr1YjJk7Lexj7zWRJCTsgb+ynVQ6LdeJKd/iPYBJjetWvaHllxQj53JU?=
 =?us-ascii?Q?IWvHckV8Q3vbzJweWVb/Se78hSmT3Rguc86eqnu+2AkdqOR6/DtpzB3hKWVu?=
 =?us-ascii?Q?IL0lVTQNutmd6cYsFsi6FEZwSOyTKqEeQwbmJAg3s0LQ4OR8eEulbZgFR4M6?=
 =?us-ascii?Q?ityubIr5cc152UJfFSWCDp0mIccPoQhbLBGSC4lvulx4+7dGyD2hA9M4Rtw0?=
 =?us-ascii?Q?9w7NhjUz+3PqX3Wt2uLggCDSqPjIMSEXom1ntwo9xhYqQgrEQhL7VedYoeAP?=
 =?us-ascii?Q?c7AgaLtRzT3Dyr3UR0J2a7luqbyNTARfcXef0MUnw3EnRMYk7+GKodNScrWc?=
 =?us-ascii?Q?Ryp85vjTZsCQV8bgPqZsfvyzoSK8FNAWJXAo9ns5NbAyDdkcxHNiB2nZBX7u?=
 =?us-ascii?Q?QA6xylE6ZrQvD7rSisZbpnSl/cSdCbCIwwslxN+NkfBxsG8X7I7sXz73jv97?=
 =?us-ascii?Q?hkeN5m9w7sEXO4W5ZDF3qx/Ke858Tm7a6VDCYZUj1bgN/C9Tc9sNPssVaRKG?=
 =?us-ascii?Q?tnm7i2uQu4i+CQNyZjQ+qRJ1RDmiTysLmENpoIOLlIT2w/DsYfMqmNc1sM+A?=
 =?us-ascii?Q?4l7FYmTnsYY1UgoxPH2K8+aTOvpwdb1gJgCCqJptONtKISyKF5S/lhp2nlT3?=
 =?us-ascii?Q?igPcLuct+1ytkrDv4KIlslI/kiO5Y7kJe5U9izNOdOy8QU2N9nx+qpIxT7Nj?=
 =?us-ascii?Q?02d/w2GQ3nF9EKujTyaBxBg001OiSo8pK/3on3pmRm5kAp+Lyx3QPEbZ7iyc?=
 =?us-ascii?Q?UIUwRgG00+OdHQySxWxcfnPUODPbs2n9YHiFBlTA8v4+da4pomb6tkmsQ+Mv?=
 =?us-ascii?Q?s6QkKMCOna58OAj+B//hQByn5Q7jKcFp0AacYmI8vncHewWg0YrWw2Ww+/pd?=
 =?us-ascii?Q?HwDghgfqUByNpyTsxx3wtv6ponyMW/ToJp8Ii6wyNfit+4auNT4FMw5dfJF8?=
 =?us-ascii?Q?BrIVODN7uXEucOSgVnB+z3KLBkQfn3C0UxYJ3UaTBeNGfr1i676Mm8HLwNqu?=
 =?us-ascii?Q?Tx1KiSZ5HQuzoMvJkCPKGGvzlCXKf+OagM2Xr8/NtjZ1u4dKFyOLvTkKAelT?=
 =?us-ascii?Q?fqmn0dvgJOQC8e3pygliOWcoVn78yofEUI5td5HkC+KZKvM0qx8G1kDVMkzZ?=
 =?us-ascii?Q?IgpAoPewiYPV3OqZQoz1VjGzf5fsEr5aMrZQJDRg75Q03HkC6Na7GOlWCs6+?=
 =?us-ascii?Q?KloE/RNkPIBP9tKOPy+kYtuVjh/DP0eOnJEHAlGsycRHqqxL+7Nn+knS1AoP?=
 =?us-ascii?Q?G/DVw0VtYi47ng65voStW5HhHBLNIbzvXmG5tlA45f2RPIPjkmssp4pPF2hs?=
 =?us-ascii?Q?A13d1yj8fLv0Qvj24qN/qaI1WO1tYoxgT0OVDsv6iDNVAX5ciIzNE4Ki8uqM?=
 =?us-ascii?Q?jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e408874-84c5-4663-1fba-08dd03691000
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 22:26:33.3666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C/q4wT1H/CKzJ4cEyl748Uxol66q+p4eHCK7WtPjuvBgJULqXx0bqRg32LlQ1O8YAnn+L5xmzfudzaJH0TqSnyWkiuSsjWnoRLVbQ1pAI1U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8562
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

On Tue, Nov 12, 2024 at 01:21:46PM -0800, Cavitt, Jonathan wrote:
> -----Original Message-----
> > From: Vivi, Rodrigo <rodrigo.vivi@intel.com> 
> > Sent: Tuesday, November 12, 2024 12:46 PM
> > To: Roper, Matthew D <matthew.d.roper@intel.com>
> > Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Brost, Matthew <matthew.brost@intel.com>; Harrison, John C <john.c.harrison@intel.com>; intel-xe@lists.freedesktop.org; Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>; Dong, Zhanjun <zhanjun.dong@intel.com>
> > Subject: Re: [PATCH 2/7] drm/xe: Add ring address to LRC snapshot
> > 
> > On Tue, Nov 12, 2024 at 12:30:06PM -0800, Matt Roper wrote:
> > > On Tue, Nov 12, 2024 at 12:16:46PM -0800, Cavitt, Jonathan wrote:
> > > > -----Original Message-----
> > > > From: Brost, Matthew <matthew.brost@intel.com> 
> > > > Sent: Tuesday, November 12, 2024 10:18 AM
> > > > To: Harrison, John C <john.c.harrison@intel.com>
> > > > Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; intel-xe@lists.freedesktop.org; Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>; Dong, Zhanjun <zhanjun.dong@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > > > Subject: Re: [PATCH 2/7] drm/xe: Add ring address to LRC snapshot
> > > > > 
> > > > > On Tue, Nov 12, 2024 at 09:59:16AM -0800, John Harrison wrote:
> > > > > > On 11/8/2024 15:34, Cavitt, Jonathan wrote:
> > > > > > > -----Original Message-----
> > > > > > > From: Brost, Matthew <matthew.brost@intel.com>
> > > > > > > Sent: Friday, November 8, 2024 3:10 PM
> > > > > > > To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> > > > > > > Cc: intel-xe@lists.freedesktop.org; Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>; Dong, Zhanjun <zhanjun.dong@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > > > > > > Subject: Re: [PATCH 2/7] drm/xe: Add ring address to LRC snapshot
> > > > > > > > On Fri, Nov 08, 2024 at 03:05:34PM -0700, Cavitt, Jonathan wrote:
> > > > > > > > > -----Original Message-----
> > > > > > > > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthew Brost
> > > > > > > > > Sent: Friday, November 8, 2024 9:43 AM
> > > > > > > > > To: intel-xe@lists.freedesktop.org
> > > > > > > > > Cc: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>; Dong, Zhanjun <zhanjun.dong@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > > > > > > > > Subject: [PATCH 2/7] drm/xe: Add ring address to LRC snapshot
> > > > > > > > > > The ring is currently in LRC BO but this may change going forward.
> > > > > > > > > > Include the ring address in the snapshot protecting again any future
> > > > > > > > > > changes.
> > > > > > > > > > 
> > > > > > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > > > > LGTM, though the terminology we're using to describe the various ggtt addresses
> > > > > > > > > as "descriptors" is a bit confusing, even if it's consistent.  I wonder where that
> > > > > > > > > terminology came from?
> > > > > > > > > This is just a rhetorical question.  I'm not suggesting it be changed.
> > > > > > > > > 
> > > > > > > > LRC descriptors is name copied over from i915 and may even be in the bspec.
> > > > > > > > 
> > > > > > > > But yea, indirect_state_desc and ring_desc are bad names. Will change to
> > > > > > > > 'ring_addr' here.
> > > > > > > IMO it would probably be better to leave it as "ring_desc" for now as it's
> > > > > > > consistent with surrounding struct members.  We can do a pass of the full
> > > > > > > XE kernel for inaccurate uses of the "desc" qualifier in the near future and
> > > > > > > fix the naming scheme here as a part of that fixup.
> > > > > > I strongly disagree. Just because A is broken doesn't mean we should add a
> > > > > > broken B and C! It makes no sense to add a name we know is bad just so that
> > > > > > we can change it later. Anything new should be done properly from the start.
> > > > > > 
> > > > > 
> > > > > I agree with John here.
> > > > 
> > > > Okay, I submitted a patch to change the name from context_desc to context_addr,
> > > > and it was rejected because context_desc is actually correct.  But if context_desc
> > > > is correct, then would ring_desc *also* be correct?
> > > > 
> > > > Pinging @Roper, Matthew D
> > > > -Jonathan Cavitt
> > > 
> > > As I mentioned on the other thread, "context descriptor" is a formal
> > > hardware term that has a very specific meaning --- it's the 64-bit value
> > > that gets programmed into the ELSP.  The context descriptor contains the
> > > various things inside of it, including the LRCA.  It's documented at
> > > bspec 60419.
> > > 
> > > The problem today is that the capture code is using "context descriptor"
> > > as a name for something else.  We need to decide what the capture code
> > > should really be doing.  If we want to capture the true descriptor, as
> > > used by the hardware, then we should fix the capture code to record and
> > > dump the proper value.  If we only want to capture something else (e.g.,
> > > the LRCA), then we should rename the fields for what they actually
> > > contain.  But we definitely don't want patches making statements like
> > > "context descriptor is a legacy i915 term" since that's just not true
> > > and will confuse people who read this in the git history for years to
> > > come.
> > 
> > I liked the variables named after address better. But I totally agree
> > with Matt Roper here. Plus we cannot break userspace. There are tools
> > out there already parsing 'Desc'.
> 
> Okay... Let's bring this back full circle.
> Should the new variable for this patch be called "ring_addr" or "ring_desc"?

As far as I know there's no such thing as a "ring descriptor."  So some
kind of name with "address" or "offset" would be fine for new fields.

> Ideally, it should be named after whatever the return value for __xe_lrc_ring_ggtt_addr
> is, and on paper that should be a ring address, but the function xe_lrc_ggtt_addr
> returns a context descriptor, and the function xe_lrc_indirect_ring_ggtt_addr

No, xe_lrc_ggtt_addr does not return the context descriptor.  That's the
pre-existing bug in the snapshot code today --- it's claiming that the
value returned by this function is a descriptor when it actually isn't.
So if the snapshot code intended to capture/dump the real descriptor
(which is important from the hardware's POV, and likely something that
would be useful to include in a devcoredump), then it needs a bugfix to
provide the proper value.  xe_lrc_ggtt_addr is just providing a 32-bit
offset into the GGTT at which the LRC resides.  The LRC itself starts
with a 4K pphwsp, followed by the various register and state data that
gets saved/restored on context switch.

As noted previously, a context descriptor is a 64-bit value in the form
documented at bspec 60419.  The address described above makes up bits
31:12 of the descriptor, but there's other data in the other bits.
xe_lrc_descriptor() returns the actual descriptor by OR'ing the offset
with the other parts of the descriptor, which are stored in lrc->desc.


Matt

> apparently doesn't return an address or a descriptor, so I just don't know any more.
> -Jonathan Cavitt
> 
> > 
> > > 
> > > 
> > > Matt
> > > 
> > > > 
> > > > > 
> > > > > Matt
> > > > > 
> > > > > > John.
> > > > > > 
> > > > > > > 
> > > > > > > My RB still stands either way.
> > > > > > > -Jonathan Cavitt
> > > > > > > 
> > > > > > > > Matt
> > > > > > > > 
> > > > > > > > > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > > > > > > > -Jonathan Cavitt
> > > > > > > > > 
> > > > > > > > > > ---
> > > > > > > > > >   drivers/gpu/drm/xe/xe_lrc.c | 3 +++
> > > > > > > > > >   drivers/gpu/drm/xe/xe_lrc.h | 1 +
> > > > > > > > > >   2 files changed, 4 insertions(+)
> > > > > > > > > > 
> > > > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> > > > > > > > > > index e219657535cf..afb0f4f44748 100644
> > > > > > > > > > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > > > > > > > > > @@ -1636,6 +1636,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
> > > > > > > > > >   		xe_vm_get(lrc->bo->vm);
> > > > > > > > > >   	snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
> > > > > > > > > > +	snapshot->ring_desc = __xe_lrc_ring_ggtt_addr(lrc);
> > > > > > > > > >   	snapshot->indirect_context_desc = xe_lrc_indirect_ring_ggtt_addr(lrc);
> > > > > > > > > >   	snapshot->head = xe_lrc_ring_head(lrc);
> > > > > > > > > >   	snapshot->tail.internal = lrc->ring.tail;
> > > > > > > > > > @@ -1693,6 +1694,8 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
> > > > > > > > > >   		return;
> > > > > > > > > >   	drm_printf(p, "\tHW Context Desc: 0x%08x\n", snapshot->context_desc);
> > > > > > > > > > +	drm_printf(p, "\tHW Ring: 0x%08x\n",
> > > > > > > > > > +		   snapshot->ring_desc);
> > > > > > > > > >   	drm_printf(p, "\tHW Indirect Ring State: 0x%08x\n",
> > > > > > > > > >   		   snapshot->indirect_context_desc);
> > > > > > > > > >   	drm_printf(p, "\tLRC Head: (memory) %u\n", snapshot->head);
> > > > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> > > > > > > > > > index 9d64cedc4d14..a2058a501353 100644
> > > > > > > > > > --- a/drivers/gpu/drm/xe/xe_lrc.h
> > > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_lrc.h
> > > > > > > > > > @@ -25,6 +25,7 @@ struct xe_lrc_snapshot {
> > > > > > > > > >   	unsigned long lrc_size, lrc_offset;
> > > > > > > > > >   	u32 context_desc;
> > > > > > > > > > +	u32 ring_desc;
> > > > > > > > > >   	u32 indirect_context_desc;
> > > > > > > > > >   	u32 head;
> > > > > > > > > >   	struct {
> > > > > > > > > > -- 
> > > > > > > > > > 2.34.1
> > > > > > > > > > 
> > > > > > > > > > 
> > > > > > 
> > > > > 
> > > 
> > > -- 
> > > Matt Roper
> > > Graphics Software Engineer
> > > Linux GPU Platform Enablement
> > > Intel Corporation
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
