Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63701EDE99D
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 15:31:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1988010E83F;
	Tue, 10 Sep 2024 15:31:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gT06S6zg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 936A410E83F
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 15:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725982291; x=1757518291;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=h0U43TzjRm0okEfw4lmhnxSVZ44MTCGe7mwPeiBysjM=;
 b=gT06S6zgUQ6MGNT/IMKB6zuZ/aFiCmFiOQ8hJ8QF2Kz9o9qKQzaJTH1T
 UzYfxZOy49w4l1/A77SurFUW69ICaMqcIXW42+0qRZY6CZLEKjtnV+pes
 fc7K7v3lu6hf7esq0Jj0ganEu30ik5Wnum60sd2fGuBQ3e+GbbRqUT71+
 M6H9kuHBKPatHZydlGYyUAcp3j6NZw3+VtW0BEG2tdLZ1IrBlXast7H56
 Y8Ad7ncFFgnI2zj9wihwB5TPjUux4IuTrab9EmbF4s2CsvJSkOnC0Ra2r
 0XETcvHgh3I0RQdrbCzKj15KIepJ6DUr2Fz13djVbisEuQe0d0Be6ZyW2 w==;
X-CSE-ConnectionGUID: jGqzRxPWQ5GqD1/02TOIUQ==
X-CSE-MsgGUID: T3D/iQn0QYaL6NglfX3AIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="35877839"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="35877839"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 08:31:27 -0700
X-CSE-ConnectionGUID: XXAQs5TVR3y8NUWoZPOPOg==
X-CSE-MsgGUID: iGn9VqOySvmaVUFMTX4mcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="67113885"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 08:31:26 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 08:31:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 08:31:25 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 08:31:25 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 08:31:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ayqSJN567aJFcxK1o4HbWK9NZYZzClR2v7/Jb8mbf57TAGkvjT0RcD/oKrnOqQwKBufprTrTkSq81cESmT0o5d0sQEz4QOpdej6SgZ+73Of/D4qY3TiGIb7CeqmoJ8rISvkwV4eieUj2qz4vDPwXRugPgoJf9rQfnz4e/Houjd2O/BUy2e6vMmgRsF/SHTLCxTUv9hE7wCnNqQ39NLWfaKBX7xov3AcEXDtLie4OYgGifivVbUB/S9OF6t5wAjCyHXkZ96GuZ/SCsZLDW0tc0utW98GhVXewjG0R5wJHBAjUpfERd74hoVWuRf9QJF0JXLomv3b0w4I9iWKcKFgUhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7RZpzVv2ZWRlw+42WN62tMvybT7bgmgWpn2z4AbtAXY=;
 b=ENl/ZKp6kfP1niO8k+Uyaf5ljzreAQqF6wf6UqJ/V158XurNbAQuNElOsNcPiolhgFx+ROX5mmdo/+vuJmy9iY7zn3jXtmFJlVCe1V6g2Vc2/7ZHgxTCd7A6QpY1wpkiXCpfl4/u3N6Q4txS9cyx9bmSv0QAWVzLf4Ap7eeVIO5bkF6dQkGh2mC73bZ73B2ec0mWxmbHR6PXorqs4evhZBic59/l2PcYvk4uPQreMXFVMenZihoibXg9guO3CKNY328DYIGmAoFHiWU2bk/Qi7c0pt+vPaMFJ1PgjeoVo/tggITZXQCjYEhN9/ewajIGucrd/HBffSNhgizteZ6xbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB7398.namprd11.prod.outlook.com (2603:10b6:8:102::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Tue, 10 Sep
 2024 15:31:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7939.022; Tue, 10 Sep 2024
 15:31:17 +0000
Date: Tue, 10 Sep 2024 15:29:02 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>, 
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 4/4] drm/xe/bo: add some annotations in bo_put()
Message-ID: <ZuBlvjN5d49R84SU@DUT025-TGLU.fm.intel.com>
References: <20240910131145.136984-5-matthew.auld@intel.com>
 <20240910131145.136984-8-matthew.auld@intel.com>
 <ZuBccDRC0NkcJsux@DUT025-TGLU.fm.intel.com>
 <7c417b69-1730-44b4-94d6-cb86a7a5d981@intel.com>
 <ZuBlMnY/F736DbxW@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZuBlMnY/F736DbxW@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR13CA0170.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB7398:EE_
X-MS-Office365-Filtering-Correlation-Id: a540c442-abcb-4d7a-1971-08dcd1ad9d3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?sP6teBYr0wcoKdsJoPjswpubYm6mMmI7DaaGzRHnAb02QE2C0uwcKDa6uW?=
 =?iso-8859-1?Q?dhNz2eIwSxIbUNItdWwYKbNpXwmO7UJHTU1to/M5SzojqgkXrdcYXOwt9f?=
 =?iso-8859-1?Q?fW/SX1GR6/gf3IPv+prQbgsawij96q2wnR4gAnmdEdb8XWfOvtNtS7SCx7?=
 =?iso-8859-1?Q?beKsSMNCQgqZYaVkbJHYJOG5RYwn6QDcTfCdOe1MZ9O7prz9M4QSnjbixM?=
 =?iso-8859-1?Q?R+06Uiqbbl8d0kxP35fFIhHFE/yv2hW6Wi4NYThof7NtUt491fRFdceebS?=
 =?iso-8859-1?Q?OmrGyKsDZPdvb/nkQ3508LbJtKdP4GF5A+zygsA/ZMyQ/f2jvgH3ugmf0h?=
 =?iso-8859-1?Q?TGHCmF2isin20K42CBpuvBa1T5it3vpvhaQfBP2+Xv32PxI/qegUrW5RQZ?=
 =?iso-8859-1?Q?TU/RSLZBlrw3ApbJKsrfq6mBYhIGX+pinixrrl9+SArbUQS4htOcPUJvSB?=
 =?iso-8859-1?Q?WfjkwMIep5ie2eJurB5mA+jams66TSFXIVOKUQZg3a8ZDm0p+NUxeTunfn?=
 =?iso-8859-1?Q?gEHosr90sb36somXUPc+kLN/NJkLk62ZwsKMPwsraayFd3DRejHg7p/Qqp?=
 =?iso-8859-1?Q?DcIJeoQAJju05Rd8xk0wJx4OSdNpbndPM7i4MQRcBCSqPS2GZ36sNApwnY?=
 =?iso-8859-1?Q?dEA91yny+Toz9RlMBnvjCqNLRJiOdMYgUzCZo6ZJy9uHJYhLrXG7vZ+Tus?=
 =?iso-8859-1?Q?P0NF657lp0hMKno46Hb170SwwvjE329pVuCvr3Cm/7f4L8mIK8lN2CIGWL?=
 =?iso-8859-1?Q?JHYF6mC/Cd/+G7kOnZ1w575C+qOrDZqStyN48n6Pt9PUBtwiL5hJklkCRe?=
 =?iso-8859-1?Q?PoYB+zvTyK+h4RuS/SKh2mLZQUl625nBfiMVlq4bEkj5kP5ZRMwuOfOEbT?=
 =?iso-8859-1?Q?dHRXvN8v/x7HAw5y8uU167MBghT6W+iHU4GgAPvbpwSWSqwPIUDTuA1Ww4?=
 =?iso-8859-1?Q?+NHJHnx23mq3ZotXz8oWe3XTZrj/tD/jX93EoNCcQCDE5mamXqam/IhtKG?=
 =?iso-8859-1?Q?BjWEziRMbYIJJQ2XFOwoEKWccqiD7h71NWBLX1x7oLuC4mteYNrGzV5o7n?=
 =?iso-8859-1?Q?AV1vkNlDyev+HHTEOAsZrkqbrPTAKeMrsqF9dQrXIUs1hoq6qmxIU9SHDq?=
 =?iso-8859-1?Q?Yr6ZZO4rX1HCPmRRFi9nz4gghRI7HXAMh1HgxuYIa0U/5g5AahBv/iVElk?=
 =?iso-8859-1?Q?HIOoS9EvlFuICtmii0RiqzbHXC51v3kU+xy9Hq1oOHocSNO7+VZzBf5XgH?=
 =?iso-8859-1?Q?TCODnBS+E7qp+NLUzIPVUUwinwttKrxfdXi3pIvEv3DWZOumyISHVn25dh?=
 =?iso-8859-1?Q?FCFc4DtiPohQFV69lsTpB9GtRnoRe6tyBfGdSc4EW2LO2WrvhMaWOJqf4R?=
 =?iso-8859-1?Q?QxkU9Wgc2pV+QrrpApmHgjwCC0dI7+CA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?bSGy43+/b9xlRbQUaQjxkLOwtYlzabo03VmKYCsGHSRxdBaSQd3T2iuWfi?=
 =?iso-8859-1?Q?1+UVHSyDkqlYVO2o1ZaOWQfV9iO1ArkWog1i6v/4000iYYhtG50vn3Z53u?=
 =?iso-8859-1?Q?GrPCYm9WNJORUFXgO2364w3aAsDzU3oFPu9rocxD0hpNvhTy2eeZXqaQ/I?=
 =?iso-8859-1?Q?CJAL+9AyBaifgFrb9i/VlNnqMGsd8gFaAgYV85FK2ZoC5J00U3J0z5ss8T?=
 =?iso-8859-1?Q?6sHnyXhtHHAGHaHdS6zyBmIlGxaQL9+lSozbcsydNyyII72qUV16fp2oZJ?=
 =?iso-8859-1?Q?5DTrhaZhW56zgkFdNiwyI5YS0yQIOU1z7xDEI0tAIjkl/mp+khIRRSfXTj?=
 =?iso-8859-1?Q?OBPWJvePqTJqv3hIAb2dOn6zVMJBqoXXRPIhvWqkbNkwrPLNJT/iFSXqU0?=
 =?iso-8859-1?Q?f0WVq98BRPs43zhwhtcbvkcs/U+XTIcdJ1bi/mkHXNNBjWMN+lnTgghVzI?=
 =?iso-8859-1?Q?c/hKyRMfv+QmG9/H/2ctaJl/iu6U3NkcZclxnlnbweqKi3a5M9uoieEkcf?=
 =?iso-8859-1?Q?ljJ+GsJ3xCfpCDNj1iZGdtYT0ukGAS/oSHkkIHdeMJaIDRQFmee0UJ+MZF?=
 =?iso-8859-1?Q?dm5bJxGHfZ+uO0e+rlCrNUQyya87Qd+/MVYzs0zQDzIgVAHUmLHk1IjbaU?=
 =?iso-8859-1?Q?QODoK3DAGSXFaqnFVOOTIh7vxGr2iiMlGCiHR5HMA1Pe8B5wlUV+lFvhTe?=
 =?iso-8859-1?Q?DRKyxPDMLwogVJ5BrxrG7hz7TGvJEgMzh+MrcdSxoKTiXdAsbsRp6GMImf?=
 =?iso-8859-1?Q?HpVvwh1Lbv2dDcfSB1xXykBdH22OXCvfoR+usIuwAhp+QxooPhjZuztUKo?=
 =?iso-8859-1?Q?bzIS5ezY8FaH10wVX3q57sCdzBX+S5P9/DCNSRbvOf575Lw6Mp5wCSjxvO?=
 =?iso-8859-1?Q?gTqcf2NOxPupUuBPHCGJkpIj03eGoegV8kyfWqXjcoMgo5QB/7UdrpsnXi?=
 =?iso-8859-1?Q?JitNpLoJ6wN3hkIkYuw1wCbwOzU9TNm84HJ8ohEmWEiclFXfvLNmOWkFvP?=
 =?iso-8859-1?Q?G2a7YOaJ0nGh7pNOP/9ie/5yu5XLtifcRWP7URVValz7CbEIZ1sHf3Ctnb?=
 =?iso-8859-1?Q?+bWRk6/9qqizWbujTU/yk61VVCfnRZ91+t0QxE1fToa5c2f/IYcq1TbQsv?=
 =?iso-8859-1?Q?enrI2mEndImxhpwbrO8m+6N1bGSk6+AmB/Q11NWQ0yHFo3Az9Ty/DA+m4g?=
 =?iso-8859-1?Q?y8jvslRMg9WuzhH/klWnp2db1zMUn0gRcGwCU90WGEllqf6SuxCbARAhbj?=
 =?iso-8859-1?Q?4gLLfeHSSEZGbQo150JilZSlsoiNTz9GlYE6XvxvRrX+FSzDURZBDq7NEb?=
 =?iso-8859-1?Q?LcQWFaFWBBDhwDwO9yJNB4aDME7LHizl+Jh24aIxlSCxeVtMip10AZgHAn?=
 =?iso-8859-1?Q?EwuzLTEt+kYrwyEP8TW4omB4S7XLhGtIQ0eJrRoIyqRJlYyRWXolj9SR6e?=
 =?iso-8859-1?Q?wGhJEW5CX3fc7m/+BAtz/ESwtLr7SRbZpYRyY9VeYETin0wxexhVhr1SFu?=
 =?iso-8859-1?Q?xW+pN1N8QjvupPWdo4m6K82ijoXtGkT410RYOvP0gBvRWW9sFGcvhHWvYY?=
 =?iso-8859-1?Q?VZj+WKWeIFo/9hbZ95oY34G4KdYyhQgBkxHH7cCqx78Cnl5ctrh4SDqQUT?=
 =?iso-8859-1?Q?KW1CxmZMcY61cP3mqUujS0j5MxZuruFtlwiPaJN60Rwif+PAINiyRaVA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a540c442-abcb-4d7a-1971-08dcd1ad9d3f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 15:31:17.8646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RYkpJ9caiVxU1GKibzbk5bupFEsf7zF4S73QJRZ2u9KehhD0NMfhkf5456gzB8bkvlM/PIXDyjWKKRVavPDKvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7398
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

On Tue, Sep 10, 2024 at 03:26:42PM +0000, Matthew Brost wrote:
> On Tue, Sep 10, 2024 at 04:03:58PM +0100, Matthew Auld wrote:
> > On 10/09/2024 15:49, Matthew Brost wrote:
> > > On Tue, Sep 10, 2024 at 02:11:49PM +0100, Matthew Auld wrote:
> > > > If the put() triggers bo destroy then there is at least one potential
> > > > sleeping lock. Also annotate bos_lock and ggtt lock.
> > > > 
> > > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > > Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > > Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> > > > ---
> > > >   drivers/gpu/drm/xe/xe_bo.c | 14 ++++++++++++++
> > > >   drivers/gpu/drm/xe/xe_bo.h |  6 +-----
> > > >   2 files changed, 15 insertions(+), 5 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > > index 53948a965404..4176b302c38d 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > @@ -2320,6 +2320,20 @@ void xe_bo_put_commit(struct llist_head *deferred)
> > > >   		drm_gem_object_free(&bo->ttm.base.refcount);
> > > >   }
> > > > +void xe_bo_put(struct xe_bo *bo)
> > > > +{
> > > > +	might_sleep();
> > > > +	if (bo) {
> > > > +#ifdef CONFIG_PROC_FS
> > > > +		if (bo->client)
> > > > +			might_lock(&bo->client->bos_lock);
> > > > +#endif
> > > > +		if (bo->ggtt_node && bo->ggtt_node->ggtt)
> > > > +			might_lock(&bo->ggtt_node->ggtt->lock);
> > > 
> > > Missed this. We can take dma-resv lock too if we get into the TTM code
> > > upon this put too, right? We should probably add that annotate too.
> > 
> > Yeah, I was also wondering the same thing, but it looks to only be trylock
> > in ttm_bo_release(). AFAICT it will only grab the full dma-resv lock from a
> > worker, which it does if the lock is contended, or if there are unsignalled
> > fences and we need to wait.
> > 
> 
> Ah ok. I was thinking about this in the path of reclaim, the does
> trylocking make it ok to take a dma-resv lock? If it doesn't then I
> think we need some sort additional annotation so the final put is not in
> the path of reclaim.
> 

Ignore this. I was confusing myself, dma-resv is outside of reclaim.
Annotations look good.

Matt

> Matt
> 
> > > 
> > > Matt
> > > 
> > > > +		drm_gem_object_put(&bo->ttm.base);
> > > > +	}
> > > > +}
> > > > +
> > > >   /**
> > > >    * xe_bo_dumb_create - Create a dumb bo as backing for a fb
> > > >    * @file_priv: ...
> > > > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> > > > index dbfb3209615d..6e4be52306df 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bo.h
> > > > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > > > @@ -126,11 +126,7 @@ static inline struct xe_bo *xe_bo_get(struct xe_bo *bo)
> > > >   	return bo;
> > > >   }
> > > > -static inline void xe_bo_put(struct xe_bo *bo)
> > > > -{
> > > > -	if (bo)
> > > > -		drm_gem_object_put(&bo->ttm.base);
> > > > -}
> > > > +void xe_bo_put(struct xe_bo *bo);
> > > >   static inline void __xe_bo_unset_bulk_move(struct xe_bo *bo)
> > > >   {
> > > > -- 
> > > > 2.46.0
> > > > 
