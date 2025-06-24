Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40687C77B7C
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 20:53:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033FD10E12F;
	Tue, 24 Jun 2025 20:53:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OrwaMCw6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 722E710E12F
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 20:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750798415; x=1782334415;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ywzbi8njoNBfYt5KGttIekjjmQVljn6ahcWOmPfTaKg=;
 b=OrwaMCw6eSjd98+GwLjjcyeIGZdCSPkPIOlrZjvMM+Ly2MNxtwcg0LKx
 lZaYu0v+zkmNb+Zh4f43CtEeF1uhi+aYdAASmAHkb2JaY7ztfQb4ydhsB
 2EEAeY8uQp6VWptCMvoXoCqGbjUt5EXXtrCFRnhuguUan3GYLy3znO73N
 85T/Dp2mn4Zj2vDSfhjYpwgNttT5G/vEPB2bNtgpmTTtgbisF90iEvh3W
 qnJZLnTl2WMWN8l/tmU5aooBescmDqVUN2KrWUcdrF4Obdv0s+HiIKIhD
 TqIzHJgyVHZ0MbmICmMn7Vm2Kba4dzjv634mcajk0ndlJM86OvYZPX8YN g==;
X-CSE-ConnectionGUID: mwRAd+5vSCeFeFmzp8YhaA==
X-CSE-MsgGUID: yQGx9Q0nS8OOUqMf3Y66jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="56730720"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="56730720"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 13:53:35 -0700
X-CSE-ConnectionGUID: TGAIVzeYSiKWqObrmPpEog==
X-CSE-MsgGUID: P/sbiJY8Sru7u0Il48PsZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="156051591"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 13:53:34 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 13:53:34 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 13:53:34 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.64)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 13:53:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CXiJcW6QdqIoWoRM9TCQoY6KKofYkR9VpzuAd1OcUR/uuweM0609LHJkhMlCMPs1G1ot5ygBbZfCR8XFu/C08fWkEe5VArGLc3B0KbCvvDied7NbVAKtPWG5Aj/vsJTnrpPCJXlLvXg1TGy/ct9rCOkvs0WmJwlM6bzd9v7Lw45poDz0n6L1ycLIHFlYTag8Xet1ifFjpCl0CNakUoaSVY1vHkAaYncsFqDEoAHvTYSn0adZFOBcGeEiwvK7yRqrhfYAQ0mrV96eA/aWbHMihQsialC3yuoplZ9D/SJ8XC4IhYUpnAeNseYJfgO6nmDCUlETMvTrrTCoTbui3ChBfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hAJDIn0LqpC3y9vZtJdWnKJaq81S+O6VoKAxRjriUvQ=;
 b=lPn2A/H+ofWgZO1N+yx1XWvqzbS/oRl/4uneuA8weXk4HwXqc4C2qi3ZNXcMvc8BnvZUjy0XtZS77dsfaze9I5tCEmIhV7EkCaBKifuleAs2eNzdD/G7qULnbfjTtk1eaXCIyniWZe40uovipVijUBsbXrFCmxmr6ngh7P/fMcRzSK7BPmUqTUIumN2QBJekwuN7VHhEiUo13498AQJYyebWu7XghpIvUTTmxSCP/MLUuk/Pgcpwni6zDwHVb3wo732Nww0Ziu/wYPuyrHszSZWdeTn20rW7F1SnmTdPLc7ckbFxzv5jGgQ/DOE41E56Frsu3kgkKU8PNeL1H30Qyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB6513.namprd11.prod.outlook.com (2603:10b6:208:3a3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 20:53:30 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 20:53:30 +0000
Date: Tue, 24 Jun 2025 16:53:26 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 5/5] drm/xe: disable wa_15015404425 for PTL B0
Message-ID: <aFsQRs8tObO_3tK5@intel.com>
References: <20250620214920.718179-1-matthew.s.atwood@intel.com>
 <20250620214920.718179-6-matthew.s.atwood@intel.com>
 <aFnDJdKKgT_-j69u@intel.com>
 <20250623233130.GE4868@mdroper-desk1.amr.corp.intel.com>
 <aFr7scFlNsmNy32h@intel.com> <aFr-19HqjMgXar6v@msatwood-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aFr-19HqjMgXar6v@msatwood-mobl>
X-ClientProxiedBy: SJ0PR03CA0085.namprd03.prod.outlook.com
 (2603:10b6:a03:331::30) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB6513:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fe26922-a4f1-46a2-3e4e-08ddb3612cbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2FxGJMzEg57vCAZVn4eUvpzL1FJbDI3xMbwWy/DfS8Hux8mB2Dnidz8sQNce?=
 =?us-ascii?Q?UybX7t9HRfCuAibOfFxr6oh2r7N7yEgT4eJWux8HQK0gaQgEGV8gwyYxeXtB?=
 =?us-ascii?Q?dMwsYqiXf0Iw20i3rBtBQFAvlfAI+y1NmLGrrcwDZjOS3E0VHdekeyiAVSZE?=
 =?us-ascii?Q?moIt68M3gjWiHxrcnUd2RGCslHmB3c7kasYEocRbcrpiNWAazv51Va2XXgU4?=
 =?us-ascii?Q?HcdFfoOdh1RdnSXnpVC3uJ6Cla943Fd6vjtbFMVuGqHay8rxuE4tT9rKsKGx?=
 =?us-ascii?Q?cJSjoEy+Z871wLpFPW4nOFq9oLFRykv+agpkYtEMlkPr+nXJsHXqPDY12M1T?=
 =?us-ascii?Q?3InnBfLIbk0p2NwuEGVGwQdTEYOnKNJuW3ozpGL/VHvGF9wpwOiyEIRHAfcp?=
 =?us-ascii?Q?WDJcU8/3zxV99kCZNvAwwkBXPZGWAKmE0twgKKwGxgs6OIfuVwEYTBJ/bLZ2?=
 =?us-ascii?Q?1E480LMW8NiUH+0Z4NH3aKRqpjPIVKw4Rm0QO6H7w+dODVMJDV1fgyhacAes?=
 =?us-ascii?Q?1Z2qr5hWz8ZKsoR3g5UzxmxCX+QR3lJuIdgomTXUXPMrdEENSHAwZj8Ks/AX?=
 =?us-ascii?Q?kVFCwY7kr8gOYI2RW0GzhAw7lzAl8dj3x/ZUq3kwCBDTLtYeuRSCeyTaG1nx?=
 =?us-ascii?Q?2WOXDeyaJS6nuWIHTGjV5hdDiITVrgv/hfzPR250Mh6ql64+EtzdFLyUbUFr?=
 =?us-ascii?Q?BnOao9RHjgTzRM9oywnFd/ELVTYs9D/CUJJlAM5Tixh0lQxhUjLQySbyBGwe?=
 =?us-ascii?Q?CoUpaTr6fKoLmsu++3aFjAvHOr4bmIlrWZR+EbwaF2n8a5R8AScHhxEMMj0R?=
 =?us-ascii?Q?bNzWsAKpYsKwC1jzI7D/vsH/+aHeIyafK/5SMT6iwIt+yiyIRqNdwONN0Q7B?=
 =?us-ascii?Q?LhhWEmqI+vBbyZYfDnjh5Ve7/v4D66A9+AfaxsNO0hQ9ScuISo1blsh6ZOlh?=
 =?us-ascii?Q?+ucq51os0L2QVquIE7R5Qb1GvxTn0jCEoV+gg1iCQJI9z8X60sUp0pUqzkJB?=
 =?us-ascii?Q?4f4c5/BUp6k854D0W7RNsiQgRHr8f2q59aJV4vzVUm7ltudsEMzhKJ/XnC2l?=
 =?us-ascii?Q?EcmknxGjtriWNC5QJ57G1anDxn08bf45Rjfj450dwLKR082S28CV5IHsLs4q?=
 =?us-ascii?Q?Y9tKJ7VFwiSvyiqs6nmOnm6HBNgu9GE2cxEdTQAP5+kThqQap64y86YQFxDe?=
 =?us-ascii?Q?rsn8AOqEQeMaBk6NdGyHybQyBVNvgdPZyw9idO38Lw3U9jTRp7Ow3l854BpA?=
 =?us-ascii?Q?3/ygtcRqqmTTlHF/VY6Uo18IVMpQiuARKnBwFEzEXMl9mo2OwedK0I4QaDvZ?=
 =?us-ascii?Q?sxb8qcyujFtCJYnP9+a6e/208AB1S8vlH78A3VazBeANr4+jDCsXOL3Zv2KR?=
 =?us-ascii?Q?AL9IuuyKPdD1r1OBSfdU/OmXdpZMenARwY6pCGNuXYuG6zyKb3y1SduaPLYD?=
 =?us-ascii?Q?2HNi27Ux7tU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hYc9D114KypJPA3Ry+R6OKuLPzyFHi0AOfrDsqJnqOK1Fb6xC6b1oX6bujKG?=
 =?us-ascii?Q?PT/3GkTSCwacM55k4p6n6seGK9wTb24ugW0SY0wpcx5uCXCt8uUYjDL/ZSI7?=
 =?us-ascii?Q?Lq73L8ZHVMy90880iMW0UKnMCyq4A7E1SzlgCmuF8yFho6neJCUDwY6CQsdE?=
 =?us-ascii?Q?1fKRwD0rZajhYKtIlDecLOeLik15RtnPjxYit04art9G6+tn5ybyF1490XDY?=
 =?us-ascii?Q?xt8F4ZT0dO7VoxRn9rV5erDJK+dDTHBry/soaCYofdfo2/z5CCGYKzCSF+wD?=
 =?us-ascii?Q?nsWJTklLr7bWRaO8v1CE9943tYmlH54SSpaC/fm41cvQdheh+7L475WtHqBC?=
 =?us-ascii?Q?5A42Wo1dIOIJkIY1KLx/ekMiITCPJUry7CvRStLB03D7S9Kd4OTCxCf9UCDS?=
 =?us-ascii?Q?TcgPK1+keEBHE3Qu9kziiSVcFoUlkr5lNvxTpaeICkAT1Hi6vq7tk77Qgwez?=
 =?us-ascii?Q?vnbB0EbZKVmjhSAqOCzfE/QJTPoH2kzAwjdEkn8Iy83yTrjW/b7RSdk/wgAw?=
 =?us-ascii?Q?05NRbl2WuwRxjxRRd4INTbe95pztXd0ZGHpYswckj9lbtVnCAHcsjr+ZvZds?=
 =?us-ascii?Q?F/Jxf+3ZcFmLQ7HupBWbfDbARTZDFXzwyRJWsGxJtqT1A0rojv2hPI1I6Kvz?=
 =?us-ascii?Q?aOldfkXr5MzaVWKyAKBDV8fBuG6RpVBUGtVKW6aLHyd8I5HZa+VUIsdWlqxc?=
 =?us-ascii?Q?ZUxNMquyyVjOWK8aDzBusaIDYPMfgTjCgMIbz14d0KPPcRyCF33SExJ/nS5z?=
 =?us-ascii?Q?+/HRGQbrZmyElK4H7VX9hR1rs89koEbmZxeCAtx1oL1sWsA0XzRoAp9+7woh?=
 =?us-ascii?Q?YlA5uWjMKcBC7PS4m+L2R34e2gXS6IKjc/0Z+itYdacUJXqF2egt9Rln9u03?=
 =?us-ascii?Q?qvi0HEKnqLKQhr70unaqheqxiGGY1OdK2Iutu3eUndYbN/XxX8hmL7lwIKiL?=
 =?us-ascii?Q?5axwWYAiOOSJ2uRRzxil7J1sHX1r/NKqQYSaxsY8xSmuUFfkcdasZ7wnNZUP?=
 =?us-ascii?Q?eKDgklbwp3uh/aleSYWm3OlXNSDzqxXpthodcWmZTA4h+sKqyj3TkRpBTTyj?=
 =?us-ascii?Q?+6ZNnBKMzSxIQslpdp4aIMFbN5SDos0fBJq4YUK/DOIQIZjUNRqyfsmG07fG?=
 =?us-ascii?Q?qRKc3GArvWL+kVR3+xog8uGIz2EDxnhdoziNSi6X2ri+UYN/o6ZY6RyPsVdB?=
 =?us-ascii?Q?4bW6GeZLS3ptyDol/5ur2bX4J/4wLrBPy7chhHiPhHmytRaHJlIxXfaHUdG2?=
 =?us-ascii?Q?QLNFO4fMFx20YkX0z3V7ZYFEMsSYJUHEU4Dfw+xAwhyfLjQT3VOEEG5GEuEU?=
 =?us-ascii?Q?r49i/pVXX5jODrwcFUXt1jPIBnHdFtStpvNN/95LOeH7TdTifrb2WWS+GcUc?=
 =?us-ascii?Q?zMZlVhBHtoxKwsSHlOVocj4LrDr/Ye69ZYzqm4T8/GCkzSJN6p5lqSHQhAMP?=
 =?us-ascii?Q?cbf5aFxI1Y4C3q8KpLTZl/sGmFBWl5JaExAPcXT1akjzP+4ZcOXtV7AwztaZ?=
 =?us-ascii?Q?8Z0Qun9aHYJQoBpUD+wWR5WpjOsZsMXnSTGNWcc1FdfGpdF7qVFw4WEUXxRk?=
 =?us-ascii?Q?7k6pcUXan7/ZPcgOtHU8gA2MLZbZ6UhBr8rfnoZDje+O+XiwbVdydwO8nkan?=
 =?us-ascii?Q?MA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fe26922-a4f1-46a2-3e4e-08ddb3612cbb
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 20:53:30.2665 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sLG7t/DNFksSbat5LPXVz9LKa5KmHiDMF0EvfBTpIXuhtdE3WR0MI18rDGDSb/rBlIIPKfeM15sJaaOFB2m3Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6513
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

On Tue, Jun 24, 2025 at 12:39:03PM -0700, Matt Atwood wrote:
> On Tue, Jun 24, 2025 at 03:25:37PM -0400, Rodrigo Vivi wrote:
> > On Mon, Jun 23, 2025 at 04:31:30PM -0700, Matt Roper wrote:
> > > On Mon, Jun 23, 2025 at 05:12:05PM -0400, Rodrigo Vivi wrote:
> > > > On Fri, Jun 20, 2025 at 02:49:20PM -0700, Matt Atwood wrote:
> > > > > This workaround only applies to PTL Compute Die A0. However, this
> > > > > information cannot be determined until after the GT is brought up. This
> > > > > means that we will assume that it is required for the initial bring up of
> > > > > the gt. After GT init, the oob workarounds are enabled for the GT. Use
> > > > > this flag to then manually set the bit in the soc oob bit field to 0
> > > > > which will help performance after device bring up.
> > > > > 
> > > > > Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_pci.c        | 6 ++++++
> > > > >  drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
> > > > >  2 files changed, 7 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > > > index ded0f3dc8d73..a624c3fb9498 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > > > @@ -34,6 +34,9 @@
> > > > >  #include "xe_tile.h"
> > > > >  #include "xe_wa.h"
> > > > >  
> > > > > +#include "generated/xe_wa_oob.h"
> > > > > +#include "generated/xe_soc_wa_oob.h"
> > > > > +
> > > > >  enum toggle_d3cold {
> > > > >  	D3COLD_DISABLE,
> > > > >  	D3COLD_ENABLE,
> > > > > @@ -890,6 +893,9 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> > > > >  	drm_dbg(&xe->drm, "d3cold: capable=%s\n",
> > > > >  		str_yes_no(xe->d3cold.capable));
> > > > >  
> > > > > +	if (XE_WA(xe->tiles->media_gt, 15015404425_disable))
> > > > > +		xe->oob[XE_SOC_WA_OOB_15015404425] = 0;
> > > > 
> > > > We are discussing this offline, but I need to make it very clear here
> > > > that we should not move forward with this as is.
> > > > 
> > > > Two unnaceptable points in here:
> > > > \
> > > > 1. _disable. We either enable or we don't. If we need to wait for the gmdid,
> > > > let it be and enable the workaround after that. GMDID should be one of the
> > > > first things and I confirmed this workaround is so rare that in an a0 situation
> > > > you could wait to only enable after you read the gmd-id and confirm the
> > > > media is A0.
> > > 
> > > This is exactly what we *can't* do for this workaround.  The requirement
> > > is that on any impacted platform, every single register read must be
> > > preceded by four extra dummy writes.  There's no such thing as "early
> > > enough to ignore" ---
> > 
> > What I got from the Architects on this is that it would be safe enough to
> > read the GMDID without this workaround since the condition for the issue
> > to manifest is not on a single read like this, although the protection is
> > global.
> > 
> > But okay, let's work with the assumption that it is better to protect
> > anyway.
> > 
> > > it's specifically noted that even pre-OS firmware
> > > and such needs to be careful about doing this as well.  So this causes a
> > > bit of a chicken-and-egg issue:  we cannot read the GMD_ID register
> > > without having the workaround active on impacted platforms, but we
> > > cannot figure out whether the platform is impacted until after we've
> > > read that register[*].  We also do a bunch of other register reads
> > > during early driver probe before the xe_gt is initialized enough to be
> > > able to service workaround lookup queries.  So there are a few options
> > > here:
> > > 
> > >  * Mark the platform as always being active on PTL, then come back and
> > >    disable it later if/when we confirm that we're on a stepping that
> > >    isn't impacted by the issue.  This is pretty simple conceptually, and
> > >    is quite likely something we'll need in the future for other
> > >    workarounds.  That's the approach MattA has taken here.
> > 
> > ack.
> > 
> > > 
> > >  * Add two separate workarounds in the driver: 15015404425_early and
> > >    15015404425.  15015404425_early is an SoC workaround that applies
> > >    unconditionally on PTL, and 15015404425 is a GT workaround that
> > >    applies only on specific media steppings.  Both do exactly the same
> > >    thing (4 dummy writes before any register read), but
> > >    15015404425_early is checked before all early MMIO accesses and
> > >    15015404425 is checked on all others.  The downside of this approach
> > >    is that we'd need to use a completely different set of MMIO
> > >    operations for early driver boot (i.e., no xe_mmio_read32 and such).
> > > 
> > >  * Ignore this workaround completely if we can confirm that it only
> > >    impacts pre-production steppings.  I don't think we have confirmation
> > >    yet that A-step hardware is preprod-only, so we can't take this easy
> > >    path yet.
> > > 
> > > > 
> > > > 2. Don't mix SoC with Media. If the Bug is SoC don't wait of the media stepping
> > > > and check directly for the SoC that needs this. So, don't create an infra that
> > > > already has an exception in it. And if possible, avoid the infra at all. This
> > > > might bring even more confusion to the w/a handling.
> > > > 
> > > > This w/a in specific here is soc, but it is getting mapped to our media-ip,
> > > > so let's use the media check...
> > > 
> > > I think more explanation needs to be added to the patches to clarify
> > > exactly what's going on since it's still a bit non-obvious.  The reality
> > > is that our modern platforms aren't actually "SOCs" at all anymore;
> > > they're technically MCP's --- Multi Chip Packages with logic (and
> > > sometimes hardware issues) spread across the various dies.  The hardware
> > > teams still refer certain things to be "SoC" logic for historical
> > > reasons, even though that logic is technically distributed across
> > > multiple chips these days.
> > 
> > Well, I still see the glue of all the chips as the SoC. It is easier to
> > understand.
> > 
> > > 
> > > We absolutely need some kind of "device" workaround framework that isn't
> > > tied to the GT and that can be used before GTs are even up; we have some
> > > non-GT workarounds today that we're not really handling properly, and we
> > > know there are more coming.  I think when this workaround first came up
> > > I suggested a "device workaround" infrastructure and using the same
> > > general XE_WA() calls, with a _Generic() implementation to lookup the
> > > status of a workaround in either the xe_device or the xe_gt depending on
> > > which is passed (with the xe_device workaround table being initialized
> > > much earlier in the probe sequence).
> > 
> > If we split in device_wa and gt_wa that would make much more sense with
> > our Xe design indeed.
> Is the ask here to change the name from XE_SOC_WA -> XE_DEVICE_WA?

yes, please.
Then as a follow-up we change the other one from xe_wa to xe_gt_wa...

> > 
> > > 
> > > Issues outside of the GT can live in different places:  the GCD die, the
> > > compute (aka CPU) die, the IO die, etc.  Each of these have their own
> > > steppings, and the MCP itself has a stepping too.  In some of these
> > > cases, the proper way to determine a stepping is to map PCI revid into a
> > > die stepping.  In other cases the proper approach is to "fingerprint" a
> > > die's stepping by inspecting some other IP that lives on the same die
> > > (similar to how we used to fingerprint the PCH back in the day by
> > > inspecting the ISA bus device).  For this workaround the stepping we
> > > care about is the compute (CPU) die stepping, and since standalone media
> > > happens to live on that same die, the bspec tells us how to figure out
> > > compute die stepping from media stepping (A-step compute die <=> A-step
> > > media IP in this case, although that isn't something that's guaranteed
> > > to always be true).
> > > 
> > > 
> > > [*] An alternative to fingerprinting compute die based on media stepping
> > >     would probably be to check the CPU stepping through whatever
> > >     mechanism is used to print the stepping in /proc/cpuinfo.  We'd have
> > >     to find separate documentation on how to map the numeric value there
> > >     into somthing like "B0;" I don't know off the top of my head where
> > >     that documentation would be but the core kernel guys could probably
> > >     point us in the right direction.
> > 
> > Yeap, in this case it would be the combination of the pci id + cpu-revid.
> > This makes much more sense for this w/a, but it is hard to generalize indeed.
> > 
> > But also, any device_wa is hard to generalize anyway, since we won't have
> > a device stepping or anything like that.
> > 
> > So, okay, 15015404425 in xe_device_wa enables it and
> > 15015404425_disable in xe_gt_wa disables it for MEDIA_STEP(B0, FOREVER)
> > 
> > > 
> > > 
> > > Matt
> > > 
> > > > 
> > > > > +
> > > > >  	return 0;
> > > > >  
> > > > >  err_driver_cleanup:
> > > > > diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > > > > index 8c2aa48cb33a..822cbff13819 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> > > > > +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > > > > @@ -71,3 +71,4 @@ no_media_l3	MEDIA_VERSION(3000)
> > > > >  # primary GT GMDID
> > > > >  14022085890	GRAPHICS_VERSION(2001)
> > > > >  16026007364 	MEDIA_VERSION(3000)
> > > > > +15015404425_disable	PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
> > > > > -- 
> > > > > 2.49.0
> > > > > 
> > > 
> > > -- 
> > > Matt Roper
> > > Graphics Software Engineer
> > > Linux GPU Platform Enablement
> > > Intel Corporation
> MattA
