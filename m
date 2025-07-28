Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D10DBC83F26
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 20:00:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DDFB10E582;
	Mon, 28 Jul 2025 20:00:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RT4KV96q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B871C10E582
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 20:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753732812; x=1785268812;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mZatdsGf3Mff5YY+SpZGGu8IOIbiAQPOLmC83k9Kvfs=;
 b=RT4KV96q8OWeT/CAuyOh1Olm4jlRpeQqm0u+IX5ceAn+BzgcJaWLtSKN
 FKkim33CINo9hcWDOSHiguAbdaVUbuWWYdFXARFPkGmL9IH8Qo74RB0R2
 JlKWvgRmkhPJ1nozoRpDbcEZuo4tUGyz/O1HIelHPBm4W5+41atTBUA6R
 Sb+4mzdaBXtUhxui2Vo5lBiKMvO0jE1CokRU39sRWzijLbSpzWNV4kKQ7
 OA/U5x8TmcEt5VMMbH7z7yG+vqbJvzadnzkF7GDkzZkIx6uJA10muDCf9
 EmCuFrm6iMC9qnRMcUlgsLOwHlOyV7o8Tn/WTwf8NoNfqssxsc+2kixxg Q==;
X-CSE-ConnectionGUID: jop7kdyqQs2ei6dpIlGp1Q==
X-CSE-MsgGUID: RFD8AGBbQZ6GDVZUTv5YRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="55929834"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="55929834"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 13:00:12 -0700
X-CSE-ConnectionGUID: 38tIGnOdRNGxj1sRhTD8GA==
X-CSE-MsgGUID: 8rhKaqtDSvqIWV1QCBDFdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="167815821"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 13:00:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 13:00:11 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 13:00:11 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.87) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 28 Jul 2025 13:00:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WIk4pVfsTy3CcaQUY/nRv/792pQBmKt2XLxUJYYB4lmQDUw0TFutP7ma4b8lyluGCsMqIRWz0CVQYfO8jJFmGkKqH05qjYG8j1sIL4ogWxHISIy0PdOEXSCWMXKRpn4l+mRya+RxXXxlt45D6lNj+Gzy3i9gig68aUbl8lueY5Z+4GHfdUS40kscWAclq4O4oQ+YAbBSTvW6s6w5dl81eH+vgCQgK2lEcWJabB9W32g6oENIw8dvFQGjZD0kUh9xWAgBt5CKrwMKNcd26Rq6MHhVcJoBqgQUFflRAzaWXYOwpdJrlvLz3YHp0urvifU1PQoel/ga9/hPqWybXx9RpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tviBJW4dOAYx+U6UAVC/j1SClwgkIZaOUK1+asO1Weg=;
 b=LEu2XUEpulFHdtUNHFsso+AjY7TdL1SKRFBi2mAdXDZLCWDDRUeagtwXB+OgGAuBR1owu1bd8xkcdvpXuGQPdAdC36LbT8X/9QwLCMcZHOQ5T3O3fOfN5W0KPAPRZQvWPKvyL3ult19DUB8dcDXabUixHcvTbEv0xGFdSmH8PmaQbRDOHJmRuPNzXW7Zks/OBcHFMJmHH8LvjkJFp5lmqUPqIk2VVnbfobCrWS5A3jQu/Q4eRgziKg+61POwzSF1yVYJC1AvMiyuugYvuRA+zDaNS+jPsINo2Xo2lOzjDDo9oouNVaJxvl/7PH/gJv81L3sSj6gow5ewH9qPgS0Tnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SN7PR11MB7509.namprd11.prod.outlook.com (2603:10b6:806:346::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 20:00:09 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 20:00:09 +0000
Date: Mon, 28 Jul 2025 16:00:06 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v4 01/11] drm/xe: Simplify module initialization code
Message-ID: <aIfWxg3F4D6LaYbo@intel.com>
References: <20250727172009.587-1-michal.wajdeczko@intel.com>
 <20250727172009.587-2-michal.wajdeczko@intel.com>
 <aIfRHZEKzMeyCBRf@intel.com>
 <f7dcd9c0-8bfc-4355-a568-0b411006893c@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f7dcd9c0-8bfc-4355-a568-0b411006893c@intel.com>
X-ClientProxiedBy: SJ0PR05CA0132.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::17) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SN7PR11MB7509:EE_
X-MS-Office365-Filtering-Correlation-Id: e0854132-8bac-4bee-0e41-08ddce115aa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?V1pF6rYd3AWWmZAMKTP1e1Ae5reB0U7Bu6sch6LT2p/ChQ8ueZpbmZVO65N4?=
 =?us-ascii?Q?0oB/KR7PmDOOJZf2zmim/H7fUKb6oGd6wH/7MK3DBdozhqXpl93JV/Namui0?=
 =?us-ascii?Q?fHqYzDgEdM5l/u3YxL1G5RjY1Au/tV4MUi+7ESUJdFfDXvoyQNfWJwEXY/Aw?=
 =?us-ascii?Q?vjiMlstrDuaK3+kg+rGPmg+RA6fWDROHUj53J7lKpJpvKMI7Nv4Xstz0Semk?=
 =?us-ascii?Q?ouaS603O3xSt/jhbGV6sBSFhw+HC3TajTlQLmgCc/RmFsai8CiTdEPNqblJN?=
 =?us-ascii?Q?KUXmvH/2nV2Ev7uBy2dGunNlbRqgVmSDniARkcW0W6Eu+HoQ7tRS55X/bRUE?=
 =?us-ascii?Q?LgX0m7QLBgrHl+C/PQr98NKxAGQun6KK2lFacadxyztXlchHMCUMBJ3+wRmC?=
 =?us-ascii?Q?qDXZSZR06WPEDMBBv2i+3UJ3bfgCi5Dcg9A+WZMEIlzuhCRS1N0kByk6/7Hl?=
 =?us-ascii?Q?5by7P44yDAvKCArEDne4HS9nsoSx5daCRf0n6QcF3zVvyNl5u/YRMcXwPxkp?=
 =?us-ascii?Q?wGhb7iBWt1ufKBeSPU6Nadz8tV0uQvP7oDOKlBfy9nPV8ik06gBk7EmlI0R7?=
 =?us-ascii?Q?+wasQTYSgG0lA1Eaf2Yx7NSnUJON09jb2TOu7FCAVyy+pm89DG5aDAd2Evm9?=
 =?us-ascii?Q?LeAXku2fIOA3xoFokvkT13DaCOzSbL6fpiB9BnbioEqbYq+dGbhSQEBBrdUm?=
 =?us-ascii?Q?I886m7dBzf5vnwfrhOsCLpwZGxqGQchFT4AHxWPmC48DZmZQMwuiV1sqlC7F?=
 =?us-ascii?Q?J0bCrsVxS1clMW+c+7GoMvalVQ+8yjXY4l7OFP19++la9AuVR8cFQt1fXKoK?=
 =?us-ascii?Q?Ha/yHbhnifelJuCE6OH1GNel9nlOkQKigDQIpPyjYUQ3DPlcuh/VlnE4aEP9?=
 =?us-ascii?Q?T7p+A1/unB0r2fxR7xQ3IX2Lqvj/LnvP26N10mpwKZCnOrRcUTFv8BuUIcqF?=
 =?us-ascii?Q?LbRHvjLQ+NeUN2f5BBYZjjkDCdSkUyGsaw5Y6SjfWfIvk21XRJOxkKVKkXpb?=
 =?us-ascii?Q?+WTj+BVBdRpQiWqDqiVKCAbnmltVlZchHcned2CN7igBDosZNS/fGMt7XvyK?=
 =?us-ascii?Q?zvaN6jy11JygW+hom6U1Bd/4IeWUKN82kjr/1d4Juzh+/b/wR8/0boUNlQfx?=
 =?us-ascii?Q?nY1vd+wvgHb+5/GbJBsj+tkj3swDqV1A0ufZtCKW7XyqB9N9kjj9MEoKnrXY?=
 =?us-ascii?Q?5yTSdFbTymsmxAiSA9d5Gwtvnl9V/EDpnjs5JvI0AQbohyFsGsFALgbaUJbi?=
 =?us-ascii?Q?AzVoUQ4qwmN3z7pBr13HtAB2zCqK8cvNAbuiOGtJkprdhh6JV218mbqA3Vcj?=
 =?us-ascii?Q?azohQZTOXt5ht7cxPACtby76B0x1cuevP2znadfQdlU578x3QL9g+mrhna35?=
 =?us-ascii?Q?ksKOLLpy509Un3Bf0xZg5WF+RSdrcaNa17d8hrthsfSFnChfLD1cYfkg2Rz4?=
 =?us-ascii?Q?AzWrsA4vhG0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vXoPLdbHsi3HPbfE2ILxjBOlcTycmJn/7QhqioJ6bjlIdsIF6bjZ/Cbh3XkE?=
 =?us-ascii?Q?w/Qv4VV1M6fUVHcQe7NtANfgZCjPYyoIIFll/ZCrEBrsUNmJBGrG5jPb9GAQ?=
 =?us-ascii?Q?DrK5PqL9cusAU6GGKj+fo00bIvUP+NnVUcUpeRWZZWu1hQIA0d5g5D7GhFec?=
 =?us-ascii?Q?b1wMD+RaF05TxI9AElnC//qUw6Ke9qzUwV75oxjr3PiiSElVsmH2uoHMedeN?=
 =?us-ascii?Q?sna66kxM89N2y8ZqY9RoGN8zj6DZKeTaMqBZMSsq5tym6HjczGOXbTOssDeO?=
 =?us-ascii?Q?8omiVMYvL+KUojmnUlk+nhWLVshD4a5ID0gw1uKFg3IjfYhwf+Wi/RHbzjB1?=
 =?us-ascii?Q?ca5caiN7CiawhJbRjw4GqDzjtcHpW16LpNzww1913M6xK9XQspHHD2ylloOp?=
 =?us-ascii?Q?U4PNJ/rdnOlOuTELPlJoZr1PIfnvqscbYZ0qKHghRTgPDFac+P9wYLpna3Pj?=
 =?us-ascii?Q?TXi5r7DcB5LGLYdjuKWgu4D/qzPmn3KSIUgtr5Ieh890O8XDmnhcPshbr2m7?=
 =?us-ascii?Q?vsFKdXejwPawPyBCX6hoEm1yJ9mD2HSUO4g+7sSxnXujtb4Y5HLDQxun1UVS?=
 =?us-ascii?Q?YPonDlUeHK+O92TC2wFu6BHtqphbziPZzyBXUwD72GvvZnshfC3BRBaCoLPY?=
 =?us-ascii?Q?edQs0IQWqaTrQVrK1En5+CLQSQwqE/4zqoPRFPehZ/ijYMAT8j09zEjpVHOx?=
 =?us-ascii?Q?CNRs/tqxz18haPtPXS0GyN7dOqgWSw+2CzldtfJg93UpYbwo8AYjXHoIXz5L?=
 =?us-ascii?Q?OTJtTH0900JuGSVliEr8IJwtBPkeMslfeBd30IOjGNPICXT6e7JVX8cgL6Cr?=
 =?us-ascii?Q?c9fNK3li59AQUnARHt+3Dj/98AcxXJ61GFZg9bJcm6MTfovZtpwdUdTggHxT?=
 =?us-ascii?Q?61G2VQ5l2tkr1Gsc8r/Y0IpJYCQn1IUzOGfUANdpERxdi7a/vK6vfkkar3I1?=
 =?us-ascii?Q?GhUF8a/qgV+8VDXdiflPn1Chwj16IlOsdI1rfbNexmBHGxeALIvxipYMqN11?=
 =?us-ascii?Q?7TZibnXR3N0ii5Qc6tdnBbIU9MSoRyZ1oshew/SVmN1UpXBLQgVs4VYu3VPu?=
 =?us-ascii?Q?GyDp1GOxGWod6FFfX8F6O45R1sDtux11J3LhNo5xehm8Rb/NO1MwtkUjp18g?=
 =?us-ascii?Q?ZszTQ6U4g8ALBf215utYcLY6DTrUMUNSU9DQ9uXn1l/mYJJGTpKVLFmwP11Q?=
 =?us-ascii?Q?46vzjhW3Uic6xLrGLeSALmHIrZgXlyzVcVUOXO+M9wNXIK0qEjDYIm2O7Lde?=
 =?us-ascii?Q?dOdBLim/NGrMtNzZQBnHc6y4+Iup9fGAp1iokp+PWmPn70cZxBWtItUXq3PR?=
 =?us-ascii?Q?V24sf6GLP+XNck8get4LGKHhuxTZ4wWXBZr2zT/m1J+aPFPSugjbVFJ+F2Tg?=
 =?us-ascii?Q?2DVg6VUt0MAcFWf8V1Nf9Fxj2QoPiTSeGggHohYDFsXMQnSPQ9CBzby6VeRd?=
 =?us-ascii?Q?W6QsMj77HmqslpS3RkFuclsyFaQUZvkwmf9kP3n84yW1tkt+RIAAfNzk8iSR?=
 =?us-ascii?Q?UU617VQSMW1xJ0lFyZfbA52pVR6xK0rwaKkDsrcgGTwRGHrfzGY45e/x/MND?=
 =?us-ascii?Q?Z+Qu9MBlqWdHZaFjfDxtqiMSlv70T/zpm8sxxuNN4NHAOpqxrgBaeXmndrze?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0854132-8bac-4bee-0e41-08ddce115aa6
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 20:00:08.9220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GmL63TRWWo1HGdQjjmQSqpq3I5m2i4wvdEU8wnNwngBIKVcjB55GJO6kimnoSfSPf6E5hKq+muRHW+5FCv1cUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7509
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

On Mon, Jul 28, 2025 at 09:47:39PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 7/28/2025 9:35 PM, Rodrigo Vivi wrote:
> > On Sun, Jul 27, 2025 at 07:19:58PM +0200, Michal Wajdeczko wrote:
> >> There is no need to have extra checks and WARN() in the helpers
> >> as instead of an index of the entry with function pointers, we
> >> can pass pointer to the entry which we prepare directly in the
> >> main loop, that is guaranteed to be valid.
> >>
> >>   add/remove: 0/0 grow/shrink: 0/4 up/down: 0/-180 (-180)
> >>   Function                                     old     new   delta
> >>   xe_exit                                      109      79     -30
> >>   cleanup_module                               109      79     -30
> >>   xe_init                                      248     188     -60
> >>   init_module                                  248     188     -60
> >>   Total: Before=2774145, After=2773965, chg -0.01%
> >>
> >> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_module.c | 27 ++++++++++-----------------
> >>  1 file changed, 10 insertions(+), 17 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> >> index d9391bd08194..593bc9e5851a 100644
> >> --- a/drivers/gpu/drm/xe/xe_module.c
> >> +++ b/drivers/gpu/drm/xe/xe_module.c
> >> @@ -135,24 +135,17 @@ static const struct init_funcs init_funcs[] = {
> >>  	},
> >>  };
> >>  
> >> -static int __init xe_call_init_func(unsigned int i)
> >> +static int __init xe_call_init_func(const struct init_funcs *func)
> >>  {
> >> -	if (WARN_ON(i >= ARRAY_SIZE(init_funcs)))
> >> -		return 0;
> >> -	if (!init_funcs[i].init)
> >> -		return 0;
> >> -
> >> -	return init_funcs[i].init();
> >> +	if (func->init)
> >> +		return func->init();
> >> +	return 0;
> >>  }
> >>  
> >> -static void xe_call_exit_func(unsigned int i)
> >> +static void xe_call_exit_func(const struct init_funcs *func)
> >>  {
> >> -	if (WARN_ON(i >= ARRAY_SIZE(init_funcs)))
> >> -		return;
> >> -	if (!init_funcs[i].exit)
> >> -		return;
> >> -
> >> -	init_funcs[i].exit();
> >> +	if (func->exit)
> >> +		func->exit();
> >>  }
> >>  
> >>  static int __init xe_init(void)
> >> @@ -160,10 +153,10 @@ static int __init xe_init(void)
> >>  	int err, i;
> >>  
> >>  	for (i = 0; i < ARRAY_SIZE(init_funcs); i++) {
> >> -		err = xe_call_init_func(i);
> >> +		err = xe_call_init_func(&init_funcs[i]);
> > 
> > perhaps we can go further and avoid this extra function calling
> > directly here:
> > 
> > err = init_funcs[i].init();
> 
> it depends if we want to preserve support for unset .init
> (I assumed it was added on purpose)
> 
> > 
> >>  		if (err) {
> >>  			while (i--)
> >> -				xe_call_exit_func(i);
> >> +				xe_call_exit_func(&init_funcs[i]);
> > 
> > and
> > init_funcs[i].exit();
> > here ?
> 
> .exit is optional, so this will have to be:
> 
> if (init_funcs[i].exit)
> 	init_funcs[i].exit();
> 
> but likely compiler will do  the same with current code
> 
> > 
> >>  			return err;
> >>  		}
> >>  	}
> >> @@ -176,7 +169,7 @@ static void __exit xe_exit(void)
> >>  	int i;
> >>  
> >>  	for (i = ARRAY_SIZE(init_funcs) - 1; i >= 0; i--)
> >> -		xe_call_exit_func(i);
> >> +		xe_call_exit_func(&init_funcs[i]);
> > 
> > and here
> > init_funcs[i].exit();
> 
> since .exit is optional, better to keep one helper than
> duplicate code here 

agreed... keep the helpers than and the rv-b

> 
> > 
> > But either way is fine I guess...  up to you:
> > 
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> thanks!
> > 
> >>  }
> >>  
> >>  module_init(xe_init);
> >> -- 
> >> 2.47.1
> >>
> 
