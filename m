Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B05C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 15:17:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EBFE112052;
	Tue, 30 Apr 2024 15:17:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G0YqK04d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C61112054
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Apr 2024 15:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714490244; x=1746026244;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oZ4sZaxv6KnyJIKQovNQ+6kOvVeyuwP6qa1BcptPJgs=;
 b=G0YqK04dGH7kldHC4vDH+TuBNHib7fFLVuE3qnQMEzqxjVJ0ZYK6AL81
 BjyqTMA1ySEdW7s9ON6hZKD9Fis0uBB9DbvJD86DAJXKbQYIKu+3+Cgu7
 nUplDFLQ0tVaUTBIFXTDsrLPhdOLnu0BeJ5TE/lXyA914hB3BAZXHjIVB
 ljMdhnpZTzG0FLgWzNB2YddRgSVsh+3wDXRX0RPbJPFsRjwY6u4r7853W
 hRQKcwQEkGrYj5QCFIMcsdkjcEZV/PtwifcyjH9sCigVyA/5oE4d/ZDcT
 u3ZXXv22Pfg6SaJDn1C+BcAKKph8aoNzGEx9B7pUfkbgZOhVfrrq4iaPY A==;
X-CSE-ConnectionGUID: /CLBlq/eTny5jMiASYNazA==
X-CSE-MsgGUID: O+IOzAfmTB+m5u9SjdZEhg==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="20817875"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="20817875"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 08:17:24 -0700
X-CSE-ConnectionGUID: WDrqnoODRBy5e2zzIzCSvw==
X-CSE-MsgGUID: g63prvmKRG6XkRM8zi6evg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="26506853"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Apr 2024 08:17:24 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 08:17:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 08:17:22 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Apr 2024 08:17:22 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Apr 2024 08:17:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hvm1Qb9WyNktiVdk56Yxz3Zo+ApM2ZEnad/xqAfjKj+duFyuztQXZ0Pa5ZRO1YniVh5ZMe7CfXknQ2/XkXNOrLrHfz0UmMmG8+we+r/tuVpM/sFzaEHmlHu0ENTLm9XmiIZ9zsW+2Am0xSsKgOcT4b7AH8e0zGyWr3Qi6C0tw8vpXQX7PH8XRbLplt6IRPjTmLFdt3TQGnoIX+KM79W9272evam/a+VR26JKlMbsSR3u/35zBfLP/gRZwBIC14JesBII/mhpfL0+Br8xvCZskPoGf/xpSMnbQExR0/qyCcTOzpfk4EXfuUqjglpYXmPMvwc3ZUEuz2le6pTmMIlPAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2KDqxeH8K1MwUwNoCfDDiNQe1StPCuoQKjvmBJAgkxw=;
 b=XtWbKCg3wtZ4J7oUpo5k4TrRBpuNglvbpz2g9wRVUng1tTmAo9g1ghPPMd0UbWaS1Lp8HqK6lRFeMNB5F/bo/N4Ybb82hwP74K+FzIvwgCbbWl2lVaV4rgp8QF0oPOt71EPMJFUwgAnr8sy8DN5uC9HJi5swaW28kqIzH/EyQT/EtM6+Pe0gYbrewPwxaVPXi1FR4kB0n1TalqBGt6txg9rVV1ESzbED8GhrwD1kKgMmLk+/ed9Pmy7uBi8+HdSxRxzM4L+aehPf0hdRoAw293Vp4IMhpd4PiJDzD/SLhTiDykPw6UE7rl/w9CSoD+AajvPsvwfnyGuYp+icq4MPlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB7613.namprd11.prod.outlook.com (2603:10b6:510:285::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.24; Tue, 30 Apr
 2024 15:17:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711%6]) with mapi id 15.20.7519.031; Tue, 30 Apr 2024
 15:17:08 +0000
Date: Tue, 30 Apr 2024 10:17:05 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2] drm/xe/gt: Fix assert in L3 bank mask generation
Message-ID: <pk4xbxypck5j3tjdoaqpd3apge4jpo5guq4vyhjumbfk6qg2cb@erbjb2dptabw>
References: <20240430114045.7-1-francois.dugast@intel.com>
 <z3yyivof7ofyqa2ckth4zd7pxlbxrt32uraewkkxyrunt5cakt@ttb2su5634yw>
 <ZjEBQMJUKdktH6ou@fdugast-desk.home>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZjEBQMJUKdktH6ou@fdugast-desk.home>
X-ClientProxiedBy: MW4PR03CA0149.namprd03.prod.outlook.com
 (2603:10b6:303:8c::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB7613:EE_
X-MS-Office365-Filtering-Correlation-Id: c137ce41-3899-48f7-f8b6-08dc69289a2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BUN5aNW4VCS6/tbcN6ifFRLp5fBayEtiqYhNaqlx2rCocpbM62qnjXrhz92h?=
 =?us-ascii?Q?6UqCeCytzdy9cPvw5cwOIxmSXF5cHjGe58BFtWHAQPl2fiVSwosKRItOAsit?=
 =?us-ascii?Q?aqnWYlXeX5gNJazQioOMipMMvFNypRBTG2TDE/NSz+8p5sqcWV5gMf5VENnp?=
 =?us-ascii?Q?RQfT9+VdJJmTKSg648tvhkFpiGq78wxzi2XO0yve/OU4vgHB2Tw8TbS6VM4N?=
 =?us-ascii?Q?5AOoPaHvD6QienEx6I8+XE0/SfmALwnnGVigzwHA79gpf0olgB1oq8g2Lspa?=
 =?us-ascii?Q?wpzYvbvAotzD4OTv6k8O0e5AeKzhXQmBtOZiPic+peBQQW0CSXsfxVhoQidH?=
 =?us-ascii?Q?7ihh1f51cfRJqlDV+pPB+7s1H0qiMH6WZjcYbHkTdr6acovwMhZIIozky+k6?=
 =?us-ascii?Q?e1LGZY/y30acP72n7WO7Dr2U84b6c+wLdyHVfVFJ8otwT/dWEEN4LMb1V6Io?=
 =?us-ascii?Q?embR55AAtXl3Y21pugpwKBSQlR7SAgZdoa0dNLVuHRzZRz1ka8TQFvhL+0We?=
 =?us-ascii?Q?6bpCQ2/d7A/t1RT0JrDhv/ywhTUc7dHXtm9Er/sOaZWUHqOCXbowTj3Y0O5H?=
 =?us-ascii?Q?249C0k0a+QaJeiWEnXo/smALiL45w08wDINukvq6oF1Ftzkg7ZXiBdlicoHG?=
 =?us-ascii?Q?apSUyTj//6S1j2AGEy1wATUaAlsohJhRXvnEApU0D7s4Gpyb/XQqQyJHkEMv?=
 =?us-ascii?Q?HnA6mfrfZa3e3O+iR1MoT9YVK3VbYvk9Ch2k453LB74tuIVNxox+bBP76wWc?=
 =?us-ascii?Q?xmrEXbx+uYi/UT7d4JPHnon3888pU59FRdeyiJJYCjLL9LXHBKFtIQKJmhAK?=
 =?us-ascii?Q?4W+u89JQSFa4DsnlnzVrizN1Xg+o3auIzyoLhwk/1OuxOBxEQuVtU+DzpW91?=
 =?us-ascii?Q?rMZfw37lBDDclXMJGjmd6mpLlioUaiw0c5hzv9GHJmkkggYvl7isGF5A2JCk?=
 =?us-ascii?Q?C7q9wM++SaYAqDj4dyfWNWNzeQQIPYCkmDIvIxlamGFh9nFZ7Kd3/i+iJ8Pl?=
 =?us-ascii?Q?fHuh38VhqtsG85FGiG2zCIQRSkY1eJBg/m81Y2PPbfSyyGCllJiOD258I8E8?=
 =?us-ascii?Q?TnRSdZh0RvnKaYE9a4o3HIoeUbalB2aBs22uNwQAL6QtQJ3rui0y1OzMrdwQ?=
 =?us-ascii?Q?FzaVYRLyNdL9IFplU4/NwuuEWIQlpz1YWPifTIePilLQKs5zEoKTfPIPY1KY?=
 =?us-ascii?Q?V3h2TLi0r3rk7NEwj/M4sPHjuXbqkRUzkPhleV3zhyEwkN0OW/CqI+v+/gKU?=
 =?us-ascii?Q?7Wraf5E+LlNdashX6Zune3JfcEJKooQoZQlCZ759LA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AqruNZqXOWNpXZzoD3CJfiuXYsVAF7JtaucPOol08fQz+mMaS+fJuMU9jlWO?=
 =?us-ascii?Q?SN55/zljdYh6M+CZi3VS8Nl/CL1fx+QOybPHQZqInI61VEw53H6wKBJxiOkp?=
 =?us-ascii?Q?02svykEMPdrUKtwacBGxpj7lPbrDsLYW9HFCt9PqsHjonrBpvTihOQOrDolf?=
 =?us-ascii?Q?o0AkVI3shZtlEvt6d27QztboEaSArXcxhRUf7SSvSxy/kQpt+wfIE8QE1MWR?=
 =?us-ascii?Q?LDyEs8ncFu4zckZvTPA0qjex5vFXUPFebpDF6+WtH3PahM2niUEaDtknbQZB?=
 =?us-ascii?Q?fHmop73V25dxgZo30EryVmJPkQCMQ/9c70R9hfGwsGi/ctr0QfVNP4TRpASO?=
 =?us-ascii?Q?+msqxq7efvhVnMpQkbKGL/DUpZgpYu+huk1G8sJJbalF/Uy6L45TVKLHs2R9?=
 =?us-ascii?Q?6z7vrNvbTW2TYTQbeJb6g+qbWb0eogPbnJch8wl3hkPwXXweCi3GouIRsJ5v?=
 =?us-ascii?Q?r1KWzbMX6N8NaG3p5mn6HoB8p511roIo+8WwaYQWNpa7VzpomqQm3q9LUyYk?=
 =?us-ascii?Q?HCDBHFf9db/uCconNL1dLEZH+/4LAHtjoo2SxU7wIujpENHHwMdsyKWceGoj?=
 =?us-ascii?Q?DxyymX6UXWIYODBGDT6YAiz0ACbJADdZhbO915/NgcFwuRRQo/bYR/SV0yzg?=
 =?us-ascii?Q?647ZRtLvcXp+mCbui9spk/KNJItn1gnlU0QqqlZaMF6aw8RUVo4J1wwx4VQD?=
 =?us-ascii?Q?jAtKwZRMHfEL5OjLZB0gUZcLKoLoVnIGUpK0rDINygQiXC8469f+ed/Bh4XB?=
 =?us-ascii?Q?eHDgP0q3JxyDC/76Bg+KwwnjmqAeSP7zAr814R+UiCDNL/7L5OdFeSHUzh9j?=
 =?us-ascii?Q?sFxW7A2ERmFTbxD3Gz+7TIrPl8Xt6YvA93OUQnVEHohRzWvkuykpWASnvSQe?=
 =?us-ascii?Q?Rb15b4+4YMLoMENuV5yUcVW3VvTgHBy8MMyCMiddDLqHigY1j8EPRXbfcoty?=
 =?us-ascii?Q?gZkPeFqA4lCf/M8ggMLtxiQfhGGHvalaPDfmYeVcVyIDiy5+X7izyqkBMVyD?=
 =?us-ascii?Q?fQS1G+s34fzi/cw7UQa73BadoUNVa6tfRL6XFZ67cVvJRJAh36+pMeMc8vDH?=
 =?us-ascii?Q?ZI54R7YsP5M2SWP5n4l0IoCZBfQKkdGD0oJS28UJQPfgfFLMS0H98URLnMmp?=
 =?us-ascii?Q?QWjRGIGwwJWd8ZjcnPCcXBcDJSgIbjOz7HEnucgLrDawM8CPfBcERo2MXDWa?=
 =?us-ascii?Q?xKBstI2cKGMpwRPWXfiyU5fgS/Ckd43vy6EQCbQMu3G9GOKEGilQYxcRLaPu?=
 =?us-ascii?Q?eZGvmZowWAEz9cQCeKMHNk6O08acU0eadZ7FD0Po1mlfGCWbXwPb7PptiCpS?=
 =?us-ascii?Q?wnEFMal+jj7/0OXLwKhCpo0rBrmN3sERG0VuypvBTh5IFPfvj4/GnY/dvSCd?=
 =?us-ascii?Q?IbO7iD4d0zuK7EuJE020paNgPeCeQVDI+3g6KV5KERZf9EFSZtW7CKeLbfPw?=
 =?us-ascii?Q?+INaqpfoeXf+40NW9n1KWgxdwWVfFHwOK4MPWk00PFqt1oSquxlFvG94MLun?=
 =?us-ascii?Q?8SoJzASHdOIBtFltB9EqfuRkev5LWxS4wBdRR37Yhy0pWpcAtCgC6zLqNvZy?=
 =?us-ascii?Q?CZSfikCHMWkji5WqcGM4P/2U6U4xmDZ8EisANmEck/EKWDVWjWzMNs3buTId?=
 =?us-ascii?Q?Kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c137ce41-3899-48f7-f8b6-08dc69289a2c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 15:17:08.8280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PPeDe4QLkXf+/gYHcmGO/LXeI9STRP5xl+xvz1Dekye/cxht8kWX+D1kTHJPEs+Zw514/LYuoAs0UZ2YIjsIqrobSJ154laiZfOpog9vHcQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7613
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

On Tue, Apr 30, 2024 at 04:33:36PM GMT, Francois Dugast wrote:
>On Tue, Apr 30, 2024 at 08:43:15AM -0500, Lucas De Marchi wrote:
>> On Tue, Apr 30, 2024 at 11:40:45AM GMT, Francois Dugast wrote:
>> > What needs to be asserted is that the pattern fits in the number
>> > of bits provided by the user in patternbits, otherwise it would
>> > be truncated when replicated according to the mask, which is
>> > likely not the intended use of this function.
>> > The pattern argument is a bitmap so use find_last_bit() instead
>> > of fls(). The bit position starts at index 0 so remove "or equal"
>> > from the comparison, and XE_MAX_L3_BANK_MASK_BITS would be the
>> > returned value if the pattern is 0.
>> >
>> > Cc: Matt Roper <matthew.d.roper@intel.com>
>> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/xe_gt_topology.c | 5 ++++-
>> > 1 file changed, 4 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
>> > index af841d801a8f..efe9e5d6fd52 100644
>> > --- a/drivers/gpu/drm/xe/xe_gt_topology.c
>> > +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
>> > @@ -107,8 +107,11 @@ gen_l3_mask_from_pattern(struct xe_device *xe, xe_l3_bank_mask_t dst,
>> > 			 unsigned long mask)
>> > {
>> > 	unsigned long bit;
>> > +	unsigned long last_bit = find_last_bit(pattern,
>> > +					       XE_MAX_L3_BANK_MASK_BITS);
>> >
>> > -	xe_assert(xe, fls(mask) <= patternbits);
>> > +	xe_assert(xe, last_bit < patternbits ||
>> > +		  last_bit == XE_MAX_L3_BANK_MASK_BITS);
>>
>> then if xe_assert() compiles to nothing we may be left with "unused
>> last_bit" variable" :(.  I think it would be simpler if pattern was
>> unsigned long long as apparently it would be sufficient for our needs
>> and we could simply do
>>
>> 	xe_assert(xe, pattern <= GENMASK_ULL(patternbits, 0));
>>
>> As for XE_MAX_L3_BANK_MASK_BITS, the assert here doesn't seem sufficient
>> as you want to check if the final result doesn't overflow the array.
>>
>>
>> Wihout changing the pattern type, I think what we want is:
>>
>> 	xe_assert(xe, find_last_bit(pattern, XE_MAX_L3_BANK_MASK_BITS) < patternbits);
>> 	xe_assert(xe, patternbits * fls(mask) <= XE_MAX_L3_BANK_MASK_BITS);
>
>The array overflow check is a great addition, but the other assertion
>would fail if the pattern is 0 as find_last_bit would return
>XE_MAX_L3_BANK_MASK_BITS which is greater than patternbits.

does it make sense to have pattern == 0? What would we even be repeating
according to a mask? failing the assert would be desirable I think.

Lucas De Marchi

>
>What about this:
>
>	xe_assert(xe, find_last_bit(pattern, XE_MAX_L3_BANK_MASK_BITS) < patternbits || bitmap_empty(pattern, XE_MAX_L3_BANK_MASK_BITS));
>	xe_assert(xe, patternbits * fls(mask) <= XE_MAX_L3_BANK_MASK_BITS);
>
>Francois
>
>>
>>
>> Lucas De Marchi
>>
>> > 	for_each_set_bit(bit, &mask, 32) {
>> > 		xe_l3_bank_mask_t shifted_pattern = {};
>> >
>> > --
>> > 2.34.1
>> >
