Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D48D17141
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 22:35:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4430F10E112;
	Mon, 21 Oct 2024 22:35:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AS5mi+Vt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F76E10E112
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Oct 2024 22:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729550144; x=1761086144;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=53UUE4FrI8sdU70Q9M/vRU++9hqCKrmItY8cb1OoEyg=;
 b=AS5mi+VtkCiw+JSdrgAht/N+2ZnvN3Sa5egAj5e0KJTLcuJFc4QFJg8l
 theKq8oLPghwZzvf0LuFpsprjTsTAQfVm6c/y+mVZ1Hy6rFZPWP3vuzw0
 wpCb5aJgOpDerLBfmEBfTJHT64YmOhQ+sNtu+rWe1lDnDhYQ3xX3aMfDy
 8dgtTe6nuzbN9sh4+JCW5mtKhKgb91iEgrf5xZv1JhCNTGlALX5i6Ui+z
 JVKrsarDKN6sKFi94E335SJeGC1+vuEspyJgbAtwQK7OVXb55tF9zCPcq
 IbawamaIb/XNPfaSugSHM8Of9AN8tOrmKIpRWmKtmftyxdQG6jPRNd3ql Q==;
X-CSE-ConnectionGUID: s1emcDlEQxO09+RDxzWe+A==
X-CSE-MsgGUID: 364HGTNtQI2uZMZYZcySHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="39642819"
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="39642819"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 15:35:44 -0700
X-CSE-ConnectionGUID: l3FM4BZ9TrmP5XzGCzOlFA==
X-CSE-MsgGUID: P5oWFAt+TJiWAlGHGeyXqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="117087495"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Oct 2024 15:35:44 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Oct 2024 15:35:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 21 Oct 2024 15:35:43 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 21 Oct 2024 15:35:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hyxgaaJIvdAHR7mtbmsneqSX/Y865u8CTUCoVWTd+iIr5G+XIbAEXlADx7z04eqIEqpKgr03JWnQCwC3BWoYhrP9DZtr/xHoXYGyboJfHPm/PxV+lUOzUk4Yat7mG1SrWCCr2PMAGHNqCIvLXwqTK7x4pemodf3ukT34CAFESxzIWdk7GSV7WdGdD3kv//1QG8Z8wnDPeIe0citwyy6i+k7KkHZHfB1B5yCSxO+2+LARsUKsOBLeGWcvhNWNqjQlDodo71Hc9LvAIPpMhMgIwUK7wmzzFV1NfBDrLuNYUHW982xUt7BrgQIPqPHzwR4MVWa/1iKUd4hfPYlFVdrsRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n1Kejz4i0g1GEvSdPUF9KYez/MGEH34ALOtk0sDecpg=;
 b=O+jJlB9/FkSuE1V77O+mz40FLrbWW1tVNShMy5TGwkj9KJS6K2iY0ygRoKrZy2z/uQLYiaNbkSsyxzFktcVBIEwoFIrORlYNQhZDOo95F2n8XiGEvL5smVe2v1j3dvBAyYCYCpFGRMS7mZPd2dQ3x06OY97Hc0A8MzQlnoHOJK1gRypbfLrn0uu/5u4/R1sk1d+lVz4RuSmSmaapvOSErgTJdVodVqTSGMu+uYGpsoLX3AAtc+NsgX+8K92zq4whIn2CZW4Qjr1EIZaV3xiBaFDuYFD1+K9ZZj149q49SXAvdS4OOWawyNxCtgGujF1SwLMtYjkrxKsFt5NZZq6MDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB6611.namprd11.prod.outlook.com (2603:10b6:510:1ce::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.26; Mon, 21 Oct
 2024 22:35:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 22:35:40 +0000
Date: Mon, 21 Oct 2024 22:34:35 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>
CC: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, Maciej Patelczyk
 <maciej.patelczyk@intel.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 12/18] drm/xe/eudebug: implement userptr_vma access
Message-ID: <ZxbW+3+hZtcSuWn8@DUT025-TGLU.fm.intel.com>
References: <20241001144306.1991001-1-mika.kuoppala@linux.intel.com>
 <20241001144306.1991001-13-mika.kuoppala@linux.intel.com>
 <ZxVI8IpkcgAq7PRx@DUT025-TGLU.fm.intel.com>
 <e50c5fdd-2872-4d92-a60f-d1db53fd1b79@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e50c5fdd-2872-4d92-a60f-d1db53fd1b79@intel.com>
X-ClientProxiedBy: BYAPR07CA0054.namprd07.prod.outlook.com
 (2603:10b6:a03:60::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB6611:EE_
X-MS-Office365-Filtering-Correlation-Id: c8386c75-ae5e-4293-45ed-08dcf220b0d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?HK3/J0Fb9/KFko9KiQjNRQhwOLP5kVi1js6HutxpdT+0rvYzZarzRRE1JV?=
 =?iso-8859-1?Q?/wLglUBX+pP4NqhLnN3L5FMsFLaW0VOEiXLVgdrxLJoFEbaELc6nNeHATC?=
 =?iso-8859-1?Q?2CWme+v2/SsNCGqDwv1bIfPVzHFGI94AFGG1smFcsj1kR+texzUHCD32ua?=
 =?iso-8859-1?Q?knu++bzLwLAOXXdHgupsHCqlUSLuxWhzPwMVdnxpK0+ee3lVe88bGwQvmz?=
 =?iso-8859-1?Q?ZBpf5teTbzmh6TEsxU9hajhSlWM1Q6y7Au1iJ5IOZNm6/J1dcBryj7CiP6?=
 =?iso-8859-1?Q?NWqb/755cMnfXwXvDH/4aahEJkgiB5gpOhIz8JQbz2NZ0l/BKhYlrPRSJy?=
 =?iso-8859-1?Q?+6MR//zdvQnUnRQKRfusQeM1wf7e5wvmliR5zLnMYnOGl77Jya/ZGFvEbt?=
 =?iso-8859-1?Q?YKms/wEKO2EKco4ppFWPs/+wqTBSOdSUiUT4+Jb24Mdg2eak9fiJslDsTS?=
 =?iso-8859-1?Q?OtXgFGVwSM6DS1Kxasjktz63Mz+Wyt6ZibOGVHa2aYN/GbrO9wYmGIN8cm?=
 =?iso-8859-1?Q?4mEVWOdxZ+e3oXkhSE/dtbEYyUq3RK0y1lzWORMvcUh/8H5dfn3EmOqMU5?=
 =?iso-8859-1?Q?LXwrHnN36ycl0R1KvmH/I2UsfQ1oq4cU9LtonKm0czOryxw9CAf/kwfDit?=
 =?iso-8859-1?Q?lU6ELy/Eb+vgMukErVqUz4s7/4Hn89oQhsBea+6/sxjfrpVG8X728+417x?=
 =?iso-8859-1?Q?0qXf/xcHTR6DPev0RZ0XhE0TrTMQa2GuvuM2HBuiBLrOrtHY7+qVbCMivz?=
 =?iso-8859-1?Q?y5kwXdIxVUl/M+XuQinx0sGpm5IdFycxzpzj5lbSpsSic8btSAw/viOtTv?=
 =?iso-8859-1?Q?G1X5FPPd8qSAd+ll/zSBh7Bq4Z1Oqt3EsKB6wfxktxVf1kddUXgSQA6bw7?=
 =?iso-8859-1?Q?NwRKvoEN004OewllFdQw7g1WFLZTVRroH8/Br6yFqwDZW7uIVF+DExIqfp?=
 =?iso-8859-1?Q?GOtyrnWSxFVg5QRp6jcoGq7TMERVwGp8NZHkUTNMiQv0gX2bVOqFa9J9+M?=
 =?iso-8859-1?Q?s/aDEY4X0i5pLbpMbfS+yyuBBzvF2PhVQcjRNUL5qt0KkRoREz+Ph/2BZC?=
 =?iso-8859-1?Q?8rvQhv01Q5pmPPr91W5bwDhjxsYUuoCuo1U6ftF5cwFhSxGUasDImlLt/R?=
 =?iso-8859-1?Q?2iiMI96Je4RfBzdpWG5O1VJ3O0Y/hb/dhoaFBQd3Ce4vza3uJ8tIwFif7H?=
 =?iso-8859-1?Q?3JvQWHas2QW7BQDYywVu6/m855ExgIECG1Tp2SHpM7ZYWlcKfrUVKkQUGO?=
 =?iso-8859-1?Q?GoQO8oTBqr3S6zCszGo7xJc6+if0fVvw9K7dT8V5xkucjzJwldbUNV5a+I?=
 =?iso-8859-1?Q?T/UgC8K6RIjmntJtd/3khE/cJw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?T12TsZV0th9UWpKNzIkt3KEPzVUNQO+WACyk1uC84lQ915i0U5vCoY6pDV?=
 =?iso-8859-1?Q?lm1/jdTyan3E2YvIhYQt5VYt8wboKe0/Dt+/U5DcJprmcmZp0B7AszbB1O?=
 =?iso-8859-1?Q?j2OLmYd80EpW65sF3DvFAi8IHLptiy0JAkX072GBp1xidJkL/ABtEsDlxk?=
 =?iso-8859-1?Q?Hz2Atj2lWGHzhPhWQc5smSSyvv6MOo3mY5Q3fCd65YVOmFNUasccwwxRwD?=
 =?iso-8859-1?Q?ylBdAvF59YVuI488elQk15/KMrTtCt/4i8O3ZMWf0zQMQ8WKR2BOi4ddM6?=
 =?iso-8859-1?Q?z2p0+NoLzN2b/0+caRwmBxZPXpIaWH+Khd/2r0ileeP9eaFXmu1/z5iH5E?=
 =?iso-8859-1?Q?fRutmWQV/XDwKYrKTGr0dmXna6SbE/jBfaKp6C/9uPRVj0j39pKj/jBEMl?=
 =?iso-8859-1?Q?ZMJj8POJvi7OtqNnUpN+kfocgLA2WOYhFAjOtdbYncNo+arl142ja2S9/J?=
 =?iso-8859-1?Q?RlChqvodZ4ceYlQcLGo74ckoPi7Pim0kTz3aAyRKA9cbr/f4EVXcOGghyh?=
 =?iso-8859-1?Q?gAvkt/rQcfTpqdBBrvvVzXBQf/a3FKHwRVccYcxShWJY/9p5ySZHkbbJJL?=
 =?iso-8859-1?Q?v5/6kRjELo1gXXBwkfXp/m+1xljV6pcHhnHPAQvQCBfLPN574EC1GKWft4?=
 =?iso-8859-1?Q?mMhegPnVqDwUwQ1H0UDbWfCnW1a6j9iZVXmvOCeGjZmi47QhSvUPsiH1UG?=
 =?iso-8859-1?Q?oYK8ui8rAkv8czO5Ayzxq+7qpwrpXI3+AYxnvFKMnHgm6CGihUX4aIEKNk?=
 =?iso-8859-1?Q?OizIZEep80Q4OieDw61tsFNnVdAZfOxOFrIZ024Exm5uEhtkeBP8HaXk0N?=
 =?iso-8859-1?Q?JMibBHLMIaMkdXMSz/DzBpyNavXk0gwqPHRJk2DTostFbIJ4+E7cZLS5Va?=
 =?iso-8859-1?Q?Y6Az3IlG4S0uugrQAA3NpqS1Ge8ws6a+uPnQ3Ca3FzXfeDfqCoYWXjp/tv?=
 =?iso-8859-1?Q?OTAYqM4SqG9JdtmVRxO43psoim9Ttea8PktHE63u23PH+V2cV4wvhopqxn?=
 =?iso-8859-1?Q?0Pyz2fizf1CE5Mm3n6d5UmHNc7SifmBP5B2vlieU+5q9jsTfo2v3UdQxsp?=
 =?iso-8859-1?Q?kqQzdnDTckuNSkiE9TXbNBPBsdhNDG5RED0M1pWpK00Ly9vHMBClU6CwHp?=
 =?iso-8859-1?Q?uxc5P5AGYyfFXMJ4j1Tr5h5xNaHWwomNNMfF6loBL4p5AFLpufw8u6poYd?=
 =?iso-8859-1?Q?f6hS2aKK5ONXhcUUz3V76WX7nNIqKwj7mnO+UMBXgLBiBisp7CURrF6bGC?=
 =?iso-8859-1?Q?LbQ2xd2xhSAC8I8cXlW6ouPKVKZtnvZ2MgTnVKY+A1pode09sg+FuHz/Jt?=
 =?iso-8859-1?Q?GZ8RnXnIUcVwFh8AdATCHhdpXlmm2FJ9K1h5SAQczK9wuKTRTZXH3hcUuB?=
 =?iso-8859-1?Q?YwtuIT2tboRqtym9RuNKt8qRycRY3Xf0QzkdOhH0xeS/L2frEaGDzk/gbS?=
 =?iso-8859-1?Q?zBnTSmQRlmTxPb9TIOtIWQOts7caTeaSRhNcSa/0+XdJ75/leW7V7QNUQX?=
 =?iso-8859-1?Q?5121uHVM/1MC0Un8Xb36e1cKqosA8/2F9r9Pyc6KjgyvZhprgekBJib+H6?=
 =?iso-8859-1?Q?7Bf2/6vRVQYsz62tpucra3vuffRTFpPyVHoIfxO8jhtcOAgwA1GmnYUZHT?=
 =?iso-8859-1?Q?hkIlR9kWcPGF6VV/BVV9tq4Drs82X2Gl1YhwAAXEDzIS0EzcbaOnICWQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8386c75-ae5e-4293-45ed-08dcf220b0d6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 22:35:40.0802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WpTuNXKLU+DyrUxczUXaHTwwOuUdeEFdlPpb3s5kYMrhCPzrqivZt9VZj9Mj2dt/3D5EgswslWEK1/IrSs0Zxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6611
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

On Mon, Oct 21, 2024 at 11:54:30AM +0200, Hajda, Andrzej wrote:
> W dniu 20.10.2024 o 20:16, Matthew Brost pisze:
> > On Tue, Oct 01, 2024 at 05:43:00PM +0300, Mika Kuoppala wrote:
> > > From: Andrzej Hajda <andrzej.hajda@intel.com>
> > > 
> > > Debugger needs to read/write program's vmas including userptr_vma.
> > > Since hmm_range_fault is used to pin userptr vmas, it is possible
> > > to map those vmas from debugger context.
> > > 
> > > v2: pin pages vs notifier, move to vm.c (Matthew)
> > > 
> > > Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> > > Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> > > Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> > > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_eudebug.c |  2 +-
> > >   drivers/gpu/drm/xe/xe_vm.c      | 47 +++++++++++++++++++++++++++++++++
> > >   drivers/gpu/drm/xe/xe_vm.h      |  3 +++
> > >   3 files changed, 51 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
> > > index edad6d533d0b..b09d7414cfe3 100644
> > > --- a/drivers/gpu/drm/xe/xe_eudebug.c
> > > +++ b/drivers/gpu/drm/xe/xe_eudebug.c
> > > @@ -3023,7 +3023,7 @@ static int xe_eudebug_vma_access(struct xe_vma *vma, u64 offset,
> > >   		return ret;
> > >   	}
> > > -	return -EINVAL;
> > > +	return xe_uvma_access(to_userptr_vma(vma), offset, buf, bytes, write);
> > >   }
> > >   static int xe_eudebug_vm_access(struct xe_vm *vm, u64 offset,
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index a836dfc5a86f..5f891e76993b 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -3421,3 +3421,50 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
> > >   	}
> > >   	kvfree(snap);
> > >   }
> > > +
> > > +int xe_uvma_access(struct xe_userptr_vma *uvma, u64 offset,
> > > +		   void *buf, u64 len, bool write)
> > > +{
> > 
> > Maybe dump question but are we overthinking this here?
> > 
> > Can we just use kthread_use_mm, copy_to_user, copy_from_user?
> > 
> > If not then my previous comments still apply here.
> 
> This function is called from debugger process context and kthread_use_mm is
> allowed only from kthread. Spawning kthread just for this is an option but
> looks odd and suboptimal, could be kind of last resort, or not?
> 
> Another options:
> 1. Keep reference to remote task in xe_userptr and use
> access_process_vm(up->task, ...).
> 

I think remote refs are generally a bad idea but admittedly don't fully
understand what this would look like.

> 2. Pass xe_eudebug.target_task reference down from eudebug framework to this
> helper and use access_process_vm. Current call chain is:
> __xe_eudebug_vm_access - has access to xe_eudebug.target_task
> ->__vm_read_write
> --->xe_eudebug_vm_access
> ---->xe_eudebug_vm_access
> ----->xe_eudebug_vma_access
> ------>xe_vm_userptr_access
> So to achieve this multiple changes are required, but maybe it is valid path
> to go?
> One potential issue with 1 and 2 is that multiple UMD tests were failing
> when access_process_vm/access_remote_vm were used, they were not
> investigated as this approach was dropped due to different reasons.
> 
> 3. Continue approach from this patch, but with corrected page iterator of
> up->sg sg list[1]. This was nacked by you(?) [2] but I have problem
> understanding why? I see lot of code in kernel mapping sg pages:
> linux$ git grep ' kmap.*sg' | wc -l

I looked here every example I found has mapping and accessing 1 page at
time not mapping 1 page and accessing many.

> 61
> Is it incorrect? Or our case is different?
> 

A sglist segments are dma-addresses (virtual address), thus every 4k in
the segment can be a different physical page.

i.e., look at this snippet:

+		void *ptr = kmap_local_page(sg_page(cur.sgl)) + cur.start;
+
+		cur_len = min(cur.size, cur.remaining);
+		if (write)
+			memcpy(ptr, buf, cur_len);
+		else
+			memcpy(buf, ptr, cur_len);
+		kunmap_local(ptr);

If 'cur.start' > 4k, then you are potentially pointing to an incorrect
page and corrupting memory.

Likewise if 'cur_len' > 4k, then you are potentially pointing to an
incorrect page and corrupting memory.

This loop would have to be changed to something like below which kmaps
and accesses 1 page at a time...
	
	for (xe_res_first_sg(up->sg, offset, len, &cur); cur.remaining;
	     xe_res_next(&cur, cur_len)) {
		int segment_len;
		int remain;		

		cur_len = min(cur.size, cur.remaining);
		remain = cur_len;

		for (i = 0; i < cur_len; i += segment_len) {
			phys_addr_t phys = iommu_iova_to_phys(sg_dma_address(cur.sgl) + i + cur.start);
			struct page *page = phys_to_page(phys); 
			void *ptr = kmap_local_page(page);
			int ptr_offset = offset & ~PAGE_MASK;

			segment_len = min(remain, PAGE_SIZE - ptr_offset);

			if (write)
				memcpy(ptr + ptr_offset, buf + i, segment_len);
			else
				memcpy(buf + i, ptr + ptr_offset, segment_len);
			kunmap_local(ptr);

			offset += segment_len;
			remain -= segment_len;		
		}
		
		buf += cur_len;
	}

> 4. As you suggested in [3](?), modify xe_hmm_userptr_populate_range to keep
> hmm_range.hmm_pfns(or sth similar) in xe_userptr and use it later (instead
> of up->sg) to iterate over pages.
>

Or just call hmm_range_fault directly here and operate on returned pages
directly.

BTW eventually all the userptr stuff is going to change and be based on
GPU SVM [4]. Calling hmm_range_fault directly will always work though
and likely the safest option.

Matt

[4] https://patchwork.freedesktop.org/patch/619809/?series=137870&rev=2
 
> [1]: https://lore.kernel.org/intel-xe/20241011-xe_res_cursor_add_page_iterator-v3-1-0f8b8d3ab021@intel.com/
> [2]:
> https://lore.kernel.org/intel-xe/Zw32fauoUmB6Iojk@DUT025-TGLU.fm.intel.com/
> [3]: https://patchwork.freedesktop.org/patch/617481/?series=136572&rev=2#comment_1126527
> 
> Regards
> Andrzej
> 
> > 
> > Matt
> > 
> > > +	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
> > > +	struct xe_userptr *up = &uvma->userptr;
> > > +	struct xe_res_cursor cur = {};
> > > +	int cur_len, ret = 0;
> > > +
> > > +	while (true) {
> > > +		down_read(&vm->userptr.notifier_lock);
> > > +		if (!xe_vma_userptr_check_repin(uvma))
> > > +			break;
> > > +
> > > +		spin_lock(&vm->userptr.invalidated_lock);
> > > +		list_del_init(&uvma->userptr.invalidate_link);
> > > +		spin_unlock(&vm->userptr.invalidated_lock);
> > > +
> > > +		up_read(&vm->userptr.notifier_lock);
> > > +		ret = xe_vma_userptr_pin_pages(uvma);
> > > +		if (ret)
> > > +			return ret;
> > > +	}
> > > +
> > > +	if (!up->sg) {
> > > +		ret = -EINVAL;
> > > +		goto out_unlock_notifier;
> > > +	}
> > > +
> > > +	for (xe_res_first_sg(up->sg, offset, len, &cur); cur.remaining;
> > > +	     xe_res_next(&cur, cur_len)) {
> > > +		void *ptr = kmap_local_page(sg_page(cur.sgl)) + cur.start;
> > > +
> > > +		cur_len = min(cur.size, cur.remaining);
> > > +		if (write)
> > > +			memcpy(ptr, buf, cur_len);
> > > +		else
> > > +			memcpy(buf, ptr, cur_len);
> > > +		kunmap_local(ptr);
> > > +		buf += cur_len;
> > > +	}
> > > +	ret = len;
> > > +
> > > +out_unlock_notifier:
> > > +	up_read(&vm->userptr.notifier_lock);
> > > +	return ret;
> > > +}
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > > index c864dba35e1d..99b9a9b011de 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > > @@ -281,3 +281,6 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm);
> > >   void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap);
> > >   void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p);
> > >   void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
> > > +
> > > +int xe_uvma_access(struct xe_userptr_vma *uvma, u64 offset,
> > > +		   void *buf, u64 len, bool write);
> > > -- 
> > > 2.34.1
> > > 
> 
