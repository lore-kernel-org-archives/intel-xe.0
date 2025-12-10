Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2546D3E773
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 18:47:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45E9010E267;
	Wed, 10 Dec 2025 18:47:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UkX68YNr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82BD10E265
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 18:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765392447; x=1796928447;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vQg2mu9nJ/3aO9edL94O9HkKBMfbqwoCxqGhIj+BWkQ=;
 b=UkX68YNrK2Kamg5F+RbMUCRAh8vzUhkL95WjrugvnB3E5457XCZv2JS0
 fmVVB8ySpPOFHKbcC06WcHi49vU5qBsSrcVf1CtaSouR/1JY90pThRr9g
 jBwSou7SpRlzk5pOKqwY7JFUYc//tkcFjjarj2RhvoWdaJUfL7zIWyarw
 w524y17pdwUJP9FI7iNguJXkPnJmhT5qTo2uMSniSCltieFTa/aR+t1p0
 5DVJtIAXiqeA2y7nX5/AtRV/sPHM8F0/P9TUEvWI6oLnZ7YmBp5/DH5UN
 3qNDVrYtwNzT4uHYtI+GTAhQHkuYyNhMQeNFA00WAt26Yo2kRd4J46mZ4 Q==;
X-CSE-ConnectionGUID: pr4lN5uyReChSgoPrgKQHQ==
X-CSE-MsgGUID: rzzLq1xGTsqclunR/BpWoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67098799"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="67098799"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 10:47:27 -0800
X-CSE-ConnectionGUID: fH5yJQoiSYWc6o+egf3UtA==
X-CSE-MsgGUID: PEcqT39eQUGnHhVX3L7Qgg==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 10:47:26 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 10:47:25 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 10 Dec 2025 10:47:25 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.61) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 10:47:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=evfSYEv5Sk/Ey3U9osN4NTnSxXv4J4UzTOqgDXS1mqnp0E0jrRq7i+zxXTCwN0qCTtZYHXEC/fSB6/MxTuyV3hkBk889VC57uHNvCvMqP3H3nVQeQB2K28hhoZLCuId5m6bVruqAmH/IVd+VmOEwxDbFayUwo8AwHosRNhC//YHBlNfGp3pSobnu5EgaZMPESd7CRMgH19uWJIsiCHVSafecrfEFvNoz3Sg0QK4UgHyFvEAJRrhZp6Gjtc5ZNxLDm9Uv3X+sC7ZHNHFRSEeMGNexDnyOA1jz7pQcQl5FnCmVxylkem2vFE3BIRTn+la71liWf2k2hKTQKUo9ntggnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TvB/kAxajhiacioYU5DcA4V5+Rpg35pLRhOREoyCxxc=;
 b=H/x2G6I/X9s5aY8dpEi/+inNc/KzYMY94rSo/4tq/2a9FtCl1xuUpEV9C9uTmxNiEw3RnzIELmFwvQCKYh3lf3jU0NLzZE6tX2WwcWDuWJhnTOlcMYpGBzrd3iM6RBnn9ZvDYqaSllEWWePb2LG71MFfXwzNyjyMm+y2miqFQ3N72URFiNeQDkW0B/as7OolWJjZQ/tG9tmm/7JsXz/HjWhcR7K6Qws5Fun86rNbQc0AiY0NLEMDllPkfvbB/1PyQrDowDcTKzR4xn10HqaZCZ9NzUGiyB9HKvJVhBv4MlgnDSl5ViOUjPh8T74kNmcY605FY4LmvrQTt40smWbceA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB6706.namprd11.prod.outlook.com (2603:10b6:510:1c5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 18:47:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 18:47:22 +0000
Date: Wed, 10 Dec 2025 10:47:20 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "Maslak, Jan" <jan.maslak@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Patelczyk, Maciej"
 <maciej.patelczyk@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH 1/1] drm/xe: Restore engine registers before restarting
 schedulers after GT reset
Message-ID: <aTnAONCgMwwXlIrb@lstrano-desk.jf.intel.com>
References: <20251210145618.169625-1-jan.maslak@intel.com>
 <20251210145618.169625-2-jan.maslak@intel.com>
 <CH0PR11MB54448758C46AF56B5C81C089E5A0A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CH0PR11MB54448758C46AF56B5C81C089E5A0A@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR03CA0297.namprd03.prod.outlook.com
 (2603:10b6:303:b5::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB6706:EE_
X-MS-Office365-Filtering-Correlation-Id: 842e084a-1e73-4c31-fdbe-08de381c8dee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BelDZ18MjFhQ/ST6tIYZUcqeEoyHTZifr6cP+8lErPW9ewo49K6vE1ZwUdIy?=
 =?us-ascii?Q?Dh9yKTr0aufl4CydZfKBQJC61hcjdU7vfPLKhjPZYJDCYs0fG97VjTDHV0fE?=
 =?us-ascii?Q?qtyrXS2yfdM55E9n6u4+WFgzbCVN+2veRCllMOjpkVpp6ypThQ0k9MevP5Xp?=
 =?us-ascii?Q?MvAhluTc6IMMucB8OWgAbgmuJvffZGvrdXCR0V0PrwNYUqc0/bcZz2SVRclZ?=
 =?us-ascii?Q?1Dd3xD1OgDvYBQRDgViWQ2lLsuaNEcEIS+fhgHjr+6yqV9LOzyLlYJIoqkpS?=
 =?us-ascii?Q?5cvv80DFdSRuLNSn1pf/dhNKmjJLzbrOnbMBZPAewb9C0EKQLnfiuCj3dErO?=
 =?us-ascii?Q?sfkWYY0Nu8wdyCogwFg1IbvOdiD11ie6O2kZHvHRQXpkAvGOA1kBjMmMQDk3?=
 =?us-ascii?Q?GhYr98W/AfwFU/9mvetUc4TCxYTh5gdMo+VkuSxtMd1jK6vCY5g3B2hSpSlQ?=
 =?us-ascii?Q?a8o5ynXcpFqzWePm9cfYlALOKqsqzJLgemI6mkqzVHByxp8JUPgRnsBiMUiu?=
 =?us-ascii?Q?Gv02mNiiiCtzMI940ODzGYY7RIAAOawHbY8u2nXWzBJvz76qaVk2vS1jKr7t?=
 =?us-ascii?Q?DTaOT8LdkWG32bPI4CHrzq6L51o/MMUnV5WfYYn/VSoAt7GpT9Lr3+YbU70r?=
 =?us-ascii?Q?d0Fz1Vy4gBSZqLaFQqwcnXU5hywAug1TS6Aw1Iw0oVRO/39YXK5P7MPD6OJY?=
 =?us-ascii?Q?qw/5Eu9GW2fLKtw5T//VuGZF2QnFE+41yZh6xE2Y9iTgIwhMNfOX4D90x0sl?=
 =?us-ascii?Q?tr0lyjMMyCcqtum2+NiaNsnsVG7vrR4vMaT2r2/vKE1cixO8eQYbB/Y2m4AB?=
 =?us-ascii?Q?HTPGA0sSR/3UNX/nLYbFCU8ieqmy3f/vx8d7aMUIxrDwKlhsSS9+ssg7aLFc?=
 =?us-ascii?Q?0MFd1iqX2P7PNl/Ar/vEJKUkeDWJb2SLmggrxh5f4lUy4XC9n7hTVLDUDWMC?=
 =?us-ascii?Q?zdGuam8Ty4h5a/BvFSezdDOZrRJlme6k0s/b1Z5t8Rkrf/7lLXtrq81r8/5z?=
 =?us-ascii?Q?sKM9wM+59Gf9K3FyF7TeB0EgBX4K4S9ZpRsGuUEuyTeZs0+5YQktS1ATykk6?=
 =?us-ascii?Q?JwVXw8MxaW+ygQxJplFmZEnVYa3CU6ZDq44Oyo2KiaN3FYMQdxMn53jBOtd+?=
 =?us-ascii?Q?QaC90Gqmlpsp80/37XweyXWOmaZ6xhhsfXqZM54VUJ/JmoEZETUQPEBcDaaP?=
 =?us-ascii?Q?XEC0Lywd75Yihjl9vSvJyk4585iemnv2uWcNmsd11ZtJCRYiTdB9Y5BwcQJu?=
 =?us-ascii?Q?fTjXw1F7/O9+VMdpCbju9yCZ/OO860trHjy2tj9qsg20A86vKiS7Rnz6nu4V?=
 =?us-ascii?Q?1DkqCLWn1GjEpWdn9GHpZ/e/QHytHQUKJzVthovbK9A+kaTze3gBE5lgexLs?=
 =?us-ascii?Q?BWCqNZkPJN/uMquvRp2OWuA/JWsKuYSDh025yHb9VcyqHwKYTQ4JmErRthuU?=
 =?us-ascii?Q?A93Z668/spPFpBuk1W2+56+N6cNolZd+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pqZ9HqQ9hOYyW5kPtW1fLQeEObO2VI7H7nUj2jyERO9wDTZHqeNYYzUF7ldK?=
 =?us-ascii?Q?zj6Nh/I8vYj8E4eRe4PdXwR9lhfqlcl+FoQ18rdGxeSYPM6vF1mylDU5+f3k?=
 =?us-ascii?Q?5qmOxWeTq4B5VBTsoSA7gpIcWmNFTVRjUmCB/yYgk0lqbt5N7CSL8uhg105D?=
 =?us-ascii?Q?57rgs9nIOMMuam0MZCzyH0klIHfrWRue7LgG5k+OfiNmiH2hMEjBqP00QB5W?=
 =?us-ascii?Q?kYAnfT8T0EyFGH8fBK9maLjFGL44DNxPLzuoWOjYoTWuKIUMPaEV2cfN1Uqq?=
 =?us-ascii?Q?ofoXE0kpxHaylTB48Feietieir9I+GlpxiJEWnmH4gVKWTZtvfOiFtAgchMQ?=
 =?us-ascii?Q?YB/HCKL/9eHQ/SFeij7osa/yqV3MaVcdMDBGEIvKQCEx80ryu5XTI193pms1?=
 =?us-ascii?Q?5lnBb7wtOXdi5PBV1f6hpNEBuMrqPDsyamV2eyhM4msVLPgdOBvQUlVA7e4H?=
 =?us-ascii?Q?Dq5KJwacUR1LLte3BzElayfsON01XgGBoQenvfNTX+wmCzePMdgM5EP6gvby?=
 =?us-ascii?Q?oPkF/NSiCtn/BugOq5aaFktzCWR+YEo1YKiauhjHRDRKgV40oetv3QcTUNM4?=
 =?us-ascii?Q?YPfAPCTQC10wqfRXEtiMtHs+WVvIeJ91kbXAy+0O+V63xABucklXt/1nTnTH?=
 =?us-ascii?Q?ToUZwQsEC/Rmu4ebElrWluO+DLk1Kxe7FMFAjnZ396Aa1euta2idQKJoAe19?=
 =?us-ascii?Q?YdSEudwQOxp325HmMBbglefULjp+dOOb3xSJnp4wZBZ5rYnVXtsa3cHzQ0N3?=
 =?us-ascii?Q?MJc3YOA4RUYS+Cdw0GNrqiHViorGncBqJYqkUaXIgAL654OURbgnR323TfaM?=
 =?us-ascii?Q?bJggx4OeJwP+Ekpp3gjbEPk2z/WVBXiY+OLnGTSmW+eeBgCsPEOL5bdncSOf?=
 =?us-ascii?Q?rTYK2Bu1dA1d21S1FgNsIE5pkfNf5SJMHOUkgZhuKvKiLohZrptssJH/CY20?=
 =?us-ascii?Q?5icqu/O4i0JiwSzmX5q+1SPIz6uiRXCnaoajgCW+cqR0qPeIJcmJlJYB+ZbE?=
 =?us-ascii?Q?Uy45Qhw31iX2cdwP65a42DdxTLXK7LtqvqRuxnDZLk2RfaqTcTvU5/FZB6kP?=
 =?us-ascii?Q?ZhBcR49oKOJmdB2N6+EdSVdtGMwTaLwtVkPvzMLqV0/4tgWgp/jeKCeOVZ0q?=
 =?us-ascii?Q?tm812XKLgcfWRMOkoCF/RCf1aTxJYosbKLLXapxNH4AA6RkXoU+WHC31wefS?=
 =?us-ascii?Q?h8ob2c3zU6dVZ3QXazYpAqzx7DV6yXM39xoD3AXKwpdnyEURUf/VNbr6tCbs?=
 =?us-ascii?Q?OBSvN6u+bE8FvpX+fbYootohOTAvXSiTYGn4yoQGUoGNJrL/JY93EzO4PNnb?=
 =?us-ascii?Q?RVnNgOc0jtbUVZTGy6E/3Fz/HhPvMid+mbCFXqiwuVk5M966hJToyI9F7TTx?=
 =?us-ascii?Q?500GjqzouWF5tWDXK9bnFdphfdsf7GKDfw+H1nA4KkvGjzLum93Z7TXuB3g3?=
 =?us-ascii?Q?Op0WYO3P6TvBZMPK705YeHtCqRCyGYaWw+aTEwn5BddrJIE/lSOqms3shJNx?=
 =?us-ascii?Q?qYK3xXxrenld+mEJ+kndxAy/3wP58Qs/dFkXanKQ9YrZTX1d6x5Fxo79X7mE?=
 =?us-ascii?Q?cDYYfCrdDxU2nkfjjghwIqNXf0bke/Dop6SmRVgyyujaCpY4Tm43GaWJOU6X?=
 =?us-ascii?Q?Qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 842e084a-1e73-4c31-fdbe-08de381c8dee
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 18:47:22.5844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fJk/yxVRm5VSiBS+AxUYVASTaYNjFwICa+YjRh3izHBOLdWlo9wzM0awxdjSAbHjRLG4jvDYJKWGnf5HcL6Xng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6706
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

On Wed, Dec 10, 2025 at 11:25:43AM -0700, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Jan Maslak
> Sent: Wednesday, December 10, 2025 6:56 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Patelczyk, Maciej <maciej.patelczyk@intel.com>; joonas.lahtinen@linux.intel.com; Brost, Matthew <matthew.brost@intel.com>; Maslak, Jan <jan.maslak@intel.com>
> Subject: [PATCH 1/1] drm/xe: Restore engine registers before restarting schedulers after GT reset
> > 
> > During GT reset recovery in do_gt_restart(), xe_uc_start() was called
> > before xe_reg_sr_apply_mmio() restored engine-specific registers. This
> > created a race window where the scheduler could run jobs before hardware
> > state was fully restored.
> > 
> > This caused failures in eudebug tests (xe_exec_sip_eudebug@breakpoint-
> > waitsip-*) where TD_CTL register (containing TD_CTL_GLOBAL_DEBUG_ENABLE)
> > wasn't restored before jobs started executing. Breakpoints would fail to
> > trigger SIP entry because the debug enable bit wasn't set yet.
> > 
> > Fix by moving xe_uc_start() after all MMIO register restoration,
> > including engine registers and CCS mode configuration, ensuring all
> > hardware state is fully restored before any jobs can be scheduled.
> > 
> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > Signed-off-by: Jan Maslak <jan.maslak@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 7caf781ba9e8..313ce83ab0e5 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -771,9 +771,6 @@ static int do_gt_restart(struct xe_gt *gt)
> >  		xe_gt_sriov_pf_init_hw(gt);
> >  
> >  	xe_mocs_init(gt);
> > -	err = xe_uc_start(&gt->uc);
> > -	if (err)
> > -		return err;
> >  
> >  	for_each_hw_engine(hwe, gt, id)
> >  		xe_reg_sr_apply_mmio(&hwe->reg_sr, gt);
> > @@ -781,6 +778,10 @@ static int do_gt_restart(struct xe_gt *gt)
> >  	/* Get CCS mode in sync between sw/hw */
> >  	xe_gt_apply_ccs_mode(gt);
> >  
> > +	err = xe_uc_start(&gt->uc);
> > +	if (err)
> > +		return err;
> > +
> 
> This probably doesn't need to go after xe_gt_sanitize_freq (or, in other
> words, this is probably the correct place to move this to), so:
> 

Yes, xe_gt_sanitize_freq relies on the GuC/CTs being live, so this is
the correct place.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> 
> -Jonathan Cavitt
> 
> >  	/* Restore GT freq to expected values */
> >  	xe_gt_sanitize_freq(gt);
> >  
> > -- 
> > 2.34.1
> > 
> > 
