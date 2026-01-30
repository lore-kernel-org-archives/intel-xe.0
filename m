Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B5EE6BF1D
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 15:16:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5127E10E4EB;
	Fri, 30 Jan 2026 15:16:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zch82TxV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F1310E4EB
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 15:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769786190; x=1801322190;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DpfLcQxvHgEb/x2bzzkNwqi5zrcmUI1XwICK60STDP4=;
 b=Zch82TxVG+1VP/wiCtHEFUgIQMLjeIpYgU0Kji8/BUYywJdlI4PIponm
 71r4QDO5gndqM4rBQuZ34Yzd2lW+SFzJ+g+xq4iSolybzhCv59WK2PN2Y
 F1TSkrHdKjBumzIOmzK17UnymZipYxBPjJbWvb6knTcMZBS9r6c4LI9Ft
 iSpa+0CvOaWApvKmJyByXJU3tpQwvFVbDeyADVDureHidzuFEiJpbmqTZ
 zbXx9saKL0X2oQjYEVl0L94K/hlet9KmmTg4+0WAKauUBC31KPpRSxaGd
 IQx8tvOgN4dwSUVE3lJnVRHyFNb5r6wVlvRffUV2lpnnpxIl4/Uw3boWT w==;
X-CSE-ConnectionGUID: Avi5RX0ATySrEmAxmyeLnQ==
X-CSE-MsgGUID: QAHDtUOYRFewYeoogyffjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="74890886"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="74890886"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 07:16:30 -0800
X-CSE-ConnectionGUID: efYUWATLRSSl40ko/LSFpw==
X-CSE-MsgGUID: R9KnNVOXSrK6aEnHF3Y5BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="213371710"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 07:16:29 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 07:16:28 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 30 Jan 2026 07:16:28 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.35) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 07:16:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i5DUgsN77LHwoHPUJ7cmvDfA9uLcy2OYjte7tBpr1vCzxTpJ1Sdi3MbQHWCLOVzGdJiWlUo89BhAPw5rCfk4uUMikZxhz3ocHRpOfnvbE3C+3etM4ShkNFhEUjxmw7NdM5/dh1ZK3aqpsIZb5w8l9/JlkS7HlAXB2Vnh1WP090+bMJ0/aEnkqaoJjd/Cj8TDiKmjcm5cc5EZ8vEA/hLhYMbEV9uwgEJFzdc08yUhyW0S1dG2Od9siSMRQ2FHC1l2rTNWrozTpOU45P/JcIHTcsETUpoXi8xXxScCgXlluUa89dJpxPsRwn6SDRH/Jik3C1X2M8OLVUV7o8UGnu4cAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/tzviKTsLnhIfZVxq1/EQJSHLlstecFpdu7hzsKS+A=;
 b=sgRIeyws2vK9h2ym/3jxr8CC6lSnu/zVDaepn96CEkqbGIkqMoRTD4o0qpzETmwmfeUfPKkxkHNN2k8D1hnV4/pY8ts3olNajdlX14EMNgn2RvZnpF2zpyflx6+OgKJb8HD0S5XkOZy3iO58hfJBnV1d6Atyks+Or0C3u+VlFcayj+K9OTlP81iQJNDpaIWDDuIJbXXY3SOra7xBY9DmeYF93z0wzgRLC4hJXm3Qyn7aD5jTq83Wp4ErD+D1NeEJs2bLg1VwSZ4g7hcTvFd7eaNnJuf8+65TDACVYUmoMU+vVv0Wku17fCJhmJZRv0RBCB8pKUWOj95jgyFJ4AVhrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA2PR11MB5018.namprd11.prod.outlook.com (2603:10b6:806:11a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 15:16:24 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 15:16:24 +0000
Date: Fri, 30 Jan 2026 10:16:21 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Kumar G, Naresh" <naresh.kumar.g@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe: Fix Prevent VFs from exposing the CCS
 mode sysfs file
Message-ID: <aXzLRcMkbv7lTr6L@intel.com>
References: <20251128171759.2775650-4-naresh.kumar.g@intel.com>
 <20260129172246.1106097-4-naresh.kumar.g@intel.com>
 <20260129172246.1106097-5-naresh.kumar.g@intel.com>
 <fc0f819c-0712-4b27-8cb2-38462cfc7381@intel.com>
 <f40a35bc-1db8-4631-9929-87bff4372dda@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f40a35bc-1db8-4631-9929-87bff4372dda@intel.com>
X-ClientProxiedBy: BY3PR10CA0006.namprd10.prod.outlook.com
 (2603:10b6:a03:255::11) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA2PR11MB5018:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e77fb44-284e-4cd4-34a8-08de60128802
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bAxYJl2fDwStrC03pX/nRd4PDJLd27wvQ0opQcfn2P8hilG6nE8/qu77oYpf?=
 =?us-ascii?Q?z6BC6OPdXGTm0EAR2Jyjz6BPTIwpp2YcbD20yg5JnHMIqGtP9EmUtnELIJPY?=
 =?us-ascii?Q?BPVMCsxQDVNdJJYku2XRBx6AWPBzRepR0yptMRZEWV58Q7lN0lulzYSJJqJn?=
 =?us-ascii?Q?TwrDvsHqHL9tHjS55++dvEkixSBGY31YbSSruGfl34q3skguJCiqBODO03Py?=
 =?us-ascii?Q?fFPiBNkZthOFURoPPGnAoMjCFZyYjK7ok0no1GnnKeHBNEcnkfwvTBNiByVu?=
 =?us-ascii?Q?5fJNZxnraD8eeS28ccMgGGtquYSgNS4vk4q79XzfeiAXH5cfTGkcXSLHb4eI?=
 =?us-ascii?Q?5z9mUl0uVs4g9e/IWrF8HrTYedRQ6vJSjjy04wssqglKtNEUR1vFJnWuKVxa?=
 =?us-ascii?Q?10rfrvULGr1StE4w14jzphH06wOsLEUsZmUTkeOK7Idkx6GTTKC3Pg7BtnUF?=
 =?us-ascii?Q?Wji3yuchjZCDjl/pGz6V9ASfh9FA72ETSNdhMlvnLFa8wwzsuu5ple/DmO/N?=
 =?us-ascii?Q?sWDRxt/WQ/nFnt31sMkaYi3abzJZCge8J+55m/F1TwxFRkE1HHUz/1Yk2GpA?=
 =?us-ascii?Q?Kc+cZuDhHARZx7iM5AIgYsY0g1ZTOpsDyLARqpavJbZRvJHM6mcz1aiw7t+M?=
 =?us-ascii?Q?zG3qfufn7tDIPZtiOywdb8wuE2TvVP3KmuWOQPPW8RLxAD/Gn4vinAU2UoSP?=
 =?us-ascii?Q?Cf74JIkHVlv1MxhPv5Rpjv2uv9681knWob1ipZEhqyTwqU5A965FJ7udrG3I?=
 =?us-ascii?Q?0i45cH2TUlt50WxmbQ/CDvmup9lqcDvmShp9hLrM+IsfGS/AaOzsYsa9h1V6?=
 =?us-ascii?Q?FqH1vbkrE4UbixRxmVh9AiJEV9gUHragkCsN8XgE9Mkivf6tlFx8h2fThqg5?=
 =?us-ascii?Q?SttWrLIIUCCgz7424uFAVTK1AuGxGR6fByd1khdfX8SBU2SvzAxde+MyHh3c?=
 =?us-ascii?Q?wgIufHawQQ52A0GMSNZHo+OSTQsy+YbrydPawAGWtFkver063LsVRXhETQ7F?=
 =?us-ascii?Q?ccM5EaK5gpykAsXuPZpKR1NoKLgFxV2FxBUIVbsrN5x9/TUyLyCAQHCCCkfQ?=
 =?us-ascii?Q?rcI5bejETRtAAoIy868el1V1irCOWcbxYuHtpK0Fb9CCnFfIEhRYdX4Z/tmq?=
 =?us-ascii?Q?GxOTM31Ch9d5RnLKNtt6gGAFUt36Dym0SyJswxJxTUEwqkvp9y6lt8WoM4Yb?=
 =?us-ascii?Q?LuUVuS40i4pT5rBHV+WIdAZX2e+RIom3wC7AtX2m7bIhMOq65gzV61bfalby?=
 =?us-ascii?Q?ftq+Fcs69VNko6V1xXhWVY09EK7NMZ9zuqoyIeOj3hzFjIzRiA8gVZfDacqC?=
 =?us-ascii?Q?zqpJZm8Zbil0OCn7DKifCYNW38IwvTtveK0vjA2tfzeWWYeuQ0CXu+7sQmkW?=
 =?us-ascii?Q?Axs6X7NSOfuRGBDosReYhJfLTuk+W/ylY01BEz5QsdYN59IUAASZnVp/KbGJ?=
 =?us-ascii?Q?FETOCRSULsH5tlnP2I1eAOD1ccTI8SrGY9uaOQJbVYfZxoHVPX+J7PI4SafR?=
 =?us-ascii?Q?CqcW7wUwqw/l8sQRhWnK3T/IjeZZ6dVcK1HRvo3cln7mYH47OIO2hQj6y+aP?=
 =?us-ascii?Q?uOh/e9voTDtQthRXjYM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dsigLEK84DdvcugBAlrCjpQS5sr1CkUpKQ4SNT5gQ/WtWFgg52fDeHpaQg85?=
 =?us-ascii?Q?gfmw35CSjNmvrsl9KkydbLYb4TtNHbAeYBmkbn/O9Tjshbj4XTi+QD2wCXu2?=
 =?us-ascii?Q?HhGxmZPcRZKdgAazl2t03GYUCQSIl3CEiQYZXs7m5OBKp5jg4iDiMqTiH0HF?=
 =?us-ascii?Q?SGSdA0FzPz6NL1lSMLxYEBxb8wZ0ymo8oICF2/7EVqKDqtSo1Cg8R2cyZ8JZ?=
 =?us-ascii?Q?BJqbWo7JrdevkaJrxXMf3p0/XhhoG5oQlZLPcQdF3881cGpQax0Y3ld/m98z?=
 =?us-ascii?Q?UMt+qToOpFOFv3k+Q4+6Awpc85J7bFqvubDa2cZ0rK9ELvmBSz3whQbRpPQh?=
 =?us-ascii?Q?3kjC/mQRiT8NKsMzy87I5ORnSF8KdNiQJPgIqzb8c3hc/q1Lambejnr7Q/Tv?=
 =?us-ascii?Q?UpCnczV0c/z07hA10gZVtylkCJdW3XHPBSa6j+J7VY1ajveV/jAkIHshuCCo?=
 =?us-ascii?Q?/gWmyOEeE6KOJ2NSGGwjw2JdEgFUF69NFrEEaWN2BfpZAE3XSCEUoNIdNSWe?=
 =?us-ascii?Q?FbLJxf1MLfCnBczBfjeCuW5rJCkDVVveEH2WKBYl2tcS58vpkJ+geHUgrDNI?=
 =?us-ascii?Q?A4aKiBgp4MlqNfiSjYOyWu5b12hZtIMnQyEfvkgCVNtLrnjLsC9Taa3lDsCG?=
 =?us-ascii?Q?d44+66u9HzHsU88AIbo6ll60w0KgUReBc5DqEXlrLenXBo9gCG1IBG7e/LLP?=
 =?us-ascii?Q?8NCyuHnNLugd9SwISEL2SHyGlszpEYFYRK9ksPfEVtGxZnfpMCXJKYYqYX0D?=
 =?us-ascii?Q?YdATy96x53TyIAltTqwAMMnLOIlBgGIMGc+u3u61kgKAq3EIIfvFpScFSdDY?=
 =?us-ascii?Q?nDmniPhwI7IA2hbR561qwArggYayN5eF7nHhrgh1/bBQg84XHNXoRO5h2zzY?=
 =?us-ascii?Q?BrVGHhY9NtN90fwdhptbS+JuQsF5HVfWBGAhQ/hzv5BZigUlk2INRd1w9ceM?=
 =?us-ascii?Q?3faqzVxJNx+Ou5XmSYiBT24WKCTftpplUiFaH9ybskbK+Z/rXwfo6koMOtCF?=
 =?us-ascii?Q?igpuItZaP5FYgdoYvaJZ45y89siJN6Ueyl6GGJ8o7sqfzaZFjCju/w1mCkK7?=
 =?us-ascii?Q?7x9pCaGs98xcyxYqqWWPk3u0L8ZaK/AWb6PpBYB2enJa5mKL2llyNAe9phZv?=
 =?us-ascii?Q?mqxB6SsDu8MlvgR3K/X7JwgsoYsj5phVIVkIqmt0FVpbhR5at2wuDud0TEKa?=
 =?us-ascii?Q?Hufg4CiAyVQwg15RiQzfH6/fjQNYisx6eK6SGrjGn+AgTbp4YhNTbBqrIhlI?=
 =?us-ascii?Q?yD034+wLco6880k877ShRgN7UuhM/iA80JANaUMtOwtIo6OS/NYLrwHimrSk?=
 =?us-ascii?Q?3SBYn/C7Uxl+Ad9NRjnYzpqsBBigIZY5dYur2Vk4j4tswCf8uWUrAvzSHCBc?=
 =?us-ascii?Q?WqvGFpjimupWAI/r93iZcHFTFazO3Aed6PECwMCPSeMhqEMp4i6vr05NF5Ip?=
 =?us-ascii?Q?dfpxujJo4HMRQc8b1imZBcmTMoOEzACVP3Rp+i8Ce14++OxVa8A1zKXywaYi?=
 =?us-ascii?Q?WjVp9JJw5Qu2y87ReWsumYn9eUOPjOA8v/YRlfIfKFFvb9SJLF3bBuCdy2dF?=
 =?us-ascii?Q?lvSDtToPCHqI8oENP0BTE22ptPjnX5/ep8y4OgbnEPjkYopu9PaX1xntyNfr?=
 =?us-ascii?Q?fUm5qq1rEV9vngwQUCZVXK9t8MK7Q21ca2ymVmxZ+68ikzrISJaU4C8CwVjv?=
 =?us-ascii?Q?/n6gwHf31X5EQNObLRXPqdBVx8aEIQnsdY9O31Npv6bE/Y+rmyzZ2NGDuFl6?=
 =?us-ascii?Q?Jyyb354dDw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e77fb44-284e-4cd4-34a8-08de60128802
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 15:16:24.3154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5h743Xawx+brwDQKgfNPETkljaMSGOmLUBvKNzaaOYClLAtYRt/aVnqPe8jES1xdn0Y3HEorvOds4xuMZ0EL/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5018
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

On Fri, Jan 30, 2026 at 08:02:57PM +0530, Kumar G, Naresh wrote:
> Hi Michal,
> 
> please find inlined comments,
> 
> On 30-01-2026 02:43, Michal Wajdeczko wrote:
> > 
> > 
> > On 1/29/2026 6:22 PM, Nareshkumar Gollakoti wrote:
> > > Skipping creation of sysfs file in VF Mode to ensure VFs do not expose
> > > CCS mode changes
> > > 
> > > Fixes: f3bc5bb4d53d2 ("drm/xe: Allow userspace to configure CCS mode")
> > 
> > shouldn't this be
> > 
> > Fixes: 97fedf015cd9 ("drm/xe: Use fixed CCS mode when running in SR-IOV mode")
> > 
> > or since it wasn't really broken, maybe we need no Fixes tag at all?
> > 
> > adding maintainers to confirm
> > 
> 
> As we discussed on call, will remove Fixes tag as logic not really broken.

Please let me know when you get this respin and merged so I will port to
the next fixes round. Although it is not a bug, I prefer to port this api
change while we don't have anyone using that...

> 
> Thanks,
> Naresh
> 
> > > Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> > > index 50fffc9ebf62..e146e00b0ca2 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> > > @@ -191,7 +191,7 @@ int xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt)
> > >   	struct xe_device *xe = gt_to_xe(gt);
> > >   	int err;
> > > -	if (!xe_gt_ccs_mode_enabled(gt))
> > > +	if (!xe_gt_ccs_mode_enabled(gt) || IS_SRIOV_VF(xe))
> > >   		return 0;
> > 
> > I guess there should be no users on VFs that would like to read it back
> > (as CCS mode was/is always fixed/const for VFs), so this fine,
> > 
> > Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > 
> > >   	err = sysfs_create_files(gt->sysfs, gt_ccs_mode_attrs);
> > 
> 
