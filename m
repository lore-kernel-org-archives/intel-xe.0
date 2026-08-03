Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A755EC55182
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 21:57:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5374710E092;
	Mon,  3 Aug 2026 21:57:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YdqmHNzw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA0F10E092
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Aug 2026 21:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785794275; x=1817330275;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0kUByOufby9AR2YNfguiH6FaLlnGilK50xiILHskogk=;
 b=YdqmHNzws4n0fi7QgjcysknwHG9kLXaDwMwvCagLdTs/flB/vS55E1YT
 O6XfkNtZ3C55rim7RghU3ldsjX5jX5gIksOs9Zek5/oGDZD9+5g28gN/k
 gitmeIHk5H+IxFpztrU0v9JdZbTw5khEPKEdoIK7EYk0avj71mkZ97ooH
 4pkL0umZpkmkJr68ETkMG8xgGqmTHpRxANqzXQQY7xm1b2kTDB/BYlHlY
 XKQ92Bs1w5d7dMmshrSAcDh3ySm4yJQ7V/+yvuz9Wj3IYL+u8xyOMWocc
 bmIN2ElSr5kwMlOroWitb614tZ5zjr5rUICLE0OSr5P/IcDR76nCMAUKi Q==;
X-CSE-ConnectionGUID: 3JmtbKjNQ72fBVffWjfxQw==
X-CSE-MsgGUID: N7HrfZAbT7CVvJnJY4I43g==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="96930901"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="96930901"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 14:57:51 -0700
X-CSE-ConnectionGUID: hM9H171YRcyKUh+/MAjMng==
X-CSE-MsgGUID: /qIyhZFZRwuXHiWLXCoAPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="285966244"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 14:57:50 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 14:57:49 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 3 Aug 2026 14:57:49 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.9) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 14:57:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=slZjgnnn6KGMAW3N1GlQ38YVDldJ2k+85JvJ6VNHfRTxdIXvXbkfjsaZW83mv/IDu5IyffDwkNImRZT/Bm9OIhvXEFc8P5rk9mMRCdpWPVWUCJZmBxqbvOjSZJW+8iRe97PfIt64TXeDW5drHTStn+WzaTZgcBCYcSopREE7ugA/oX5bXXJzM39ihw8HkFsHSkFg34UjLc11RlIHX4VGAzwFBUh70BYgYTcE+slyaumKkreEUdczqAFvwrs+zgu5AeXjw6LMeaT53ML/nEsGE+9fhxAgqpERM/2Q3A5/9BSd7C5EEFP9so3Kko6l8Ol/ZXTpz3Y4UHkIlLjpd5TnoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQNu30wXBq+hWSW51apFog1QdlmEDko1ldPLkeuWk/E=;
 b=w4V+n9u86zs62Ig3yCo03VCCsoZhvW4WlNiVk/IL7u2wIFonUdlirH8Vyx7zXzqoW3Z/9w83JsfVBo+F07A/PWGOHfqsF3E+7cpHbkyAwDidZSpCvQBoHVDQvv3orZGnt10CCMY5O1ZC8kgTIRiIj64IbJfqeosSIl6d1CLfJVkmie38VdF24I5k5AOcmwPcFWfrdsC5r3lIpTGGkmYTkHB+56isoH3inupHehR9PDXhGiZO35kqga8LSNqBeAgwB1TjSRV7pXj5AaSGJ+v0QYMSL9LhuBU536mV19mhpIpD1jI/+aAw7E3zPM50TxEldu1H9QUuoYIGypLdWv69HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by DS6PR11MB9895.namprd11.prod.outlook.com (2603:10b6:8:460::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 21:57:47 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0270.017; Mon, 3 Aug 2026
 21:57:47 +0000
Date: Mon, 3 Aug 2026 17:57:42 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Anirban, Sk" <sk.anirban@intel.com>
CC: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v7 2/2] drm/xe: Add debugfs for IA/GT bias
Message-ID: <anEO1sKiAYggLs6-@intel.com>
References: <20260729221629.593195-1-vinay.belgaumkar@intel.com>
 <20260729221629.593195-3-vinay.belgaumkar@intel.com>
 <3ea292eb-ce41-4fc0-8bf9-9c2ea43a2f46@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3ea292eb-ce41-4fc0-8bf9-9c2ea43a2f46@intel.com>
X-ClientProxiedBy: SJ0PR03CA0041.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::16) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|DS6PR11MB9895:EE_
X-MS-Office365-Filtering-Correlation-Id: d6551a4a-afc4-4082-be00-08def1aa4065
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|4143699003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: n0PA4EqvAV0BFm2IMG/OaQ7s1XsQAlT9RXJ0xiTzDvrkySguI7lQdkGsw54rONZCdMngC9Y17K4Rgskizha9SpQ+YRSJL6Lk4z10Gj5SNAWRTCWUazFZjDFacp0+TZXbMIr1W/NLYPAwBHDmnJBahLbgKb0Yaew3nJyvWzm6DjMK4hCpV/Ted3igKrY+qlOWkBZDmcBZC1u306el5J6Rm3BI0CbQUkPd4A2UlJ3w/KnEwllqQdGjSwi9Dre/0AUAn/O1EOH43kcn0HS2KzSuNkPAg7Ki6ra/QIlWizmljGgvtbHlQWNGEwq1U7UVeyBh+9eSK5m7tu2gA2LKhSoN46PPTMipOCHhjkahOe90K2tDWJ7tqg4eRdu39B1Y9HjPTzCxgEREhbU5Y9bz9EuONJcrurnFBuStRwB3fDe02heEgpqXIWKc2TXIzubZHYcZuMSs/y+Nn5XbSEY6IvyAMnxaJxPwfJ+Uty86Gn6ohF+cqMc6dllfMF3vY6g5BXDXRYSGzmsOjNWyVGhay543aO7zKC1ibEdR5QW9NjTikZRD3dbEx8R/FoE9i+aGKt5IW6JQv+hChDiYbtR1CbUyH94gbj8EemD73+Lx6RTToiZQqcrsMVaVpxbSfKKbJWpF6UcBVcrX4Ts72hK6tyEXAADN1ivkqkZ1dTYBhZom/FU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OYGfuJtPTJkp+GqtqyOd1kK9tu/ig9HoFyi4hZTYuVusxUuO0pJgTGJy8fE+?=
 =?us-ascii?Q?yMuIxfHTQyV6IvuosmD/Byef5yzB2fmSJlJKa2q/qUN4jEWpr2AMEWsQrCpa?=
 =?us-ascii?Q?TXvBxfVSFfjsjz8dTxguOnORBQTabyDMBJyWnGPwTThY6UQ0OysEV6blpig5?=
 =?us-ascii?Q?fpxwpmbj2dHXT6TxorB1YUJgadz1qs49HSaMvcdzeOLEEQgZQvEGQVkDoSz/?=
 =?us-ascii?Q?9dbxvj4H/xfrcw0VvHsPl4qR5OkXZNReAVoC/BJjqaQlGPysjjl5aIcvi6Qf?=
 =?us-ascii?Q?ekIP7jxgvOguKQ773+XFpVfbk5pp1h/RXFKIlHhdkNR9A1TeUebVronKc14r?=
 =?us-ascii?Q?ixN4x+nAQ7+Ec2tm/eh/4wmYSBL2L4U8efDhEZ8Bqn5uelGNTQWFOgVMqD7Q?=
 =?us-ascii?Q?HGacsGJ+qj9Wvo0x2lce5u9xiwD3vJxIpgK0FEyec8n5w7TH0SXKqIdjxVde?=
 =?us-ascii?Q?Kwj6w5028msKQ64hpL5+F5DHzmtBk9MUshgRis01UY75ziw1MvRltByxoZpX?=
 =?us-ascii?Q?1jq8426pZjNNZFUZG/EiiqXNIiEI1Nmm5B9Cfe6YcacAU2cMKbAEoDV21VbU?=
 =?us-ascii?Q?wv/BpD31dfszSSVaovCqoVo1x7U6s7gHA5fItqRhsVhoAqCgh+7qIJne4LF2?=
 =?us-ascii?Q?uNa4upQGmGgeevGYJPgQ5AGuQhjtKbb8Xuowrf6D70T9mjydY3PWhRS6Qp4+?=
 =?us-ascii?Q?so3nbxMu+fkW2Oyu52TgirgkxCJPxjg+fmAlaOr+ETyp2X/x4JynHoIxYXoO?=
 =?us-ascii?Q?prwcOKFub54W5t1Sjg/3opYkWhja98/ldJiWuaI/HEP213N2VQ5Cv/EcZG9x?=
 =?us-ascii?Q?nyWUe/CrlBarU5OWEti8WnehprGyp6Gn8WzCbQ9QB/LtBBJ+fqDFrcj50hN9?=
 =?us-ascii?Q?8Udhg9y0EyeYVYAAWxEKqhONmCy5jyKkHH1MouvTfKes/Ro9IfjLgd2/RUTl?=
 =?us-ascii?Q?EA8dsROPaWCNNrPUUlUpmzk6m70t+bwrK4FZrcePuV34avOV14E7vFb9WWYQ?=
 =?us-ascii?Q?fhMmk7yy6n7Uc5olP6jTYCdPZdJP51kXXlXs7oTyeWBlK9+MxWWPc/MiMHz1?=
 =?us-ascii?Q?c0lVlU97GROZu6T0pkHAJdYgO8Y1/Nim5gCEKWTeBsyCRhyHwKfiXfbSbMhf?=
 =?us-ascii?Q?Vwe9jnvijwr3QAFeGjZDmevcOTj/YXa/Q3KeqjCZYj4alL6f1hgHJ3GqPYlI?=
 =?us-ascii?Q?IAfRXA7cPM4X3sIXrusTsX6+w4xLEQxGhFhy7nVZilB1tujEjQ3tnz2sA+y6?=
 =?us-ascii?Q?XjbAWe5v47eAltejQ9a+e1ZIlanuvNPy5YE+lpvH6Wudm+9pKnGausETwur4?=
 =?us-ascii?Q?RunrO0gy9PU8vi6DLglMFY51ovSxekwz5lcgyGMpKTm7+TwIVJIwBjHHH5OH?=
 =?us-ascii?Q?ZYCTMsi6H2zhIdR6e6a+bW/kUYtONj0AG6yGgSfC9NiZbiKMs9mcWtv9DYHt?=
 =?us-ascii?Q?epzzAdbgpbab7clKUb/8fR6cjcsIk88I0TXoG+7/UvsssDb7YuaxXxMPzuaa?=
 =?us-ascii?Q?0CvISKH3lNU9+uvTelX9TTsTi/kLrD5+FHPD5TgblYhzzKu9Ebd7/I1Fpp2A?=
 =?us-ascii?Q?1G3VYSpzuN8Eo8Qn1E7XZ6g+ud1f6dym2sRhdnZNeLnWQQDwl5Wemi2g4k1P?=
 =?us-ascii?Q?VI2jg44AWwpvMYTHuoQTEKzDJgJmPib8wogsuhRoIlsTIszytDsxsKmFe3Ei?=
 =?us-ascii?Q?fxIFG59sMatIUPKwjZMpt3txS+9Nn7jF2IA+W3zZ4sW4YRzV1aYQXDDwKOtp?=
 =?us-ascii?Q?m65pYut9Fg=3D=3D?=
X-Exchange-RoutingPolicyChecked: cUqsrHYDeiuYRMUZEx31StssQTpb3TiBWtB/K6WdGqCjppBH0FHVSOS2nbuEYei1Z0nj0tYTMpuANse/NjfG9+7rvzd0Rnk8lPbjngeKE2A8UTGgv3LbKzOTgkMiZa8VCujjIW5+xVVkBmiY/nMvtBop6Ki5e/25reHEM5QO0Y/dMZDUyWPA6BuMf1wo4W/BocSiUDvM/ukjJOiFiZpp8C/gkmgouh/itj0O0kiwYnyex2JPILD2MxqrNV3NpOeZulH+mIqHhCvICigOAx9kCtWoZxsQi2SOB7dDoLR7mFGaDvk3fxtt+nBk/ziL+1vOYqq3iX9Gn4l2bWNS71CX8w==
X-MS-Exchange-CrossTenant-Network-Message-Id: d6551a4a-afc4-4082-be00-08def1aa4065
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 21:57:46.7338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4w0tpbZ8CxZyZdZfQj+5dwAiydT9JxIWk+ZC5bYreU7LgoZmvjI0dV5xjBpIY95QC0ekMQJE29No8pk87o6hqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB9895
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

On Thu, Jul 30, 2026 at 11:48:50PM +0530, Anirban, Sk wrote:
> Hi,
> 
> On 30-07-2026 03:46 am, Vinay Belgaumkar wrote:
> > GT_IA_PERF_BIAS_REG indicates power budget between IA and GT.
> > Lower 16 bits correspond to IA and upper to GT. Higher value
> > indicates more bias towards that plane. The values are in U1.15
> > format.
> > 
> > $ cat /sys/kernel/debug/dri/0/gt0/gt_ia_bias
> > 0x80004000 (GT: 1.0000, IA: 0.5000)
> > 
> > This interface will allow us to observe power budget changes while
> > running workloads and also, if needed, tune it. Minimum allowed value
> > for each of GT/IA bias is 0x10, and max is 0x8000 which corresponds
> > to a bias ratio of 1.
> > 
> > Bspec: 51878
> > 
> > v3: Add a helper function for U1.15 decode (Michal)
> > v4: Validate input values (Rodrigo)
> > v5: Comments (Michal, Rodrigo)
> > v6: Rename to gt_ia_bias (Anirban), check lower bound (Michal)
> > v7: Update filename in commit message
> > 
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Sk Anirban <sk.anirban@intel.com>
> > Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > Assisted-by: Copilot:auto
> > ---
> >   drivers/gpu/drm/xe/regs/xe_gt_regs.h |  6 +++
> >   drivers/gpu/drm/xe/xe_gt_debugfs.c   | 80 ++++++++++++++++++++++++++++
> >   2 files changed, 86 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index 08251c7a1a4b..48c515d91882 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -634,6 +634,12 @@
> >   #define GT_GFX_RC6_LOCKED			XE_REG(0x138104)
> >   #define GT_GFX_RC6				XE_REG(0x138108)
> > +#define GT_IA_PERF_BIAS_REG			XE_REG(0x138158)
> > +#define   GT_BIAS				REG_GENMASK(31, 16)
> > +#define   IA_BIAS				REG_GENMASK(15, 0)
> > +#define   GT_BIAS_DEFAULT			0x10
> > +#define   IA_BIAS_DEFAULT			0x10
> > +
> >   #define GT0_PERF_LIMIT_REASONS			XE_REG(0x1381a8)
> >   /* Common performance limit reason bits - available on all platforms */
> >   #define   GT0_PERF_LIMIT_REASONS_MASK		0xde3
> > diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > index c38bcacb27e4..ea78b57b1c31 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > @@ -9,7 +9,9 @@
> >   #include <drm/drm_debugfs.h>
> >   #include <drm/drm_managed.h>
> > +#include <linux/math.h>
> > +#include "regs/xe_gt_regs.h"
> >   #include "xe_device.h"
> >   #include "xe_force_wake.h"
> >   #include "xe_gt.h"
> > @@ -22,6 +24,7 @@
> >   #include "xe_guc_hwconfig.h"
> >   #include "xe_hw_engine.h"
> >   #include "xe_lrc.h"
> > +#include "xe_mmio.h"
> >   #include "xe_mocs.h"
> >   #include "xe_pat.h"
> >   #include "xe_pm.h"
> > @@ -336,6 +339,80 @@ static int force_reset_sync_show(struct seq_file *s, void *unused)
> >   }
> >   DEFINE_SHOW_STORE_ATTRIBUTE(force_reset_sync);
> > +#define U1_15_ONE		0x8000
> > +#define U1_15_INT_BITS		GENMASK(15, 15)
> > +#define U1_15_FRACTION_BITS	GENMASK(14, 0)
> > +
> > +static void u1_15_decode(u16 num, u16 *i, u32 *frac)
> > +{
> > +	/*
> > +	 * In U1.15 format, uppermost bit is integer value and the
> > +	 * rest 15 are the fraction.
> > +	 */
> > +
> > +	*i = FIELD_GET(U1_15_INT_BITS, num);
> > +	*frac = FIELD_GET(U1_15_FRACTION_BITS, num);
> > +}
> > +
> > +static void u1_15_decode_decimal(u16 value, u16 *i, u32 *frac, int digits)
> > +{
> > +	u1_15_decode(value, i, frac);
> > +	*frac = (*frac * int_pow(10, digits)) / (FIELD_MAX(U1_15_FRACTION_BITS) + 1);
> > +}
> > +
> > +static int gt_ia_bias_show(struct seq_file *s, void *unused)
> > +{
> > +	struct xe_gt *gt = s->private;
> > +	struct xe_device *xe = gt_to_xe(gt);
> > +	u32 val;
> > +	u32 ia_frac, gt_frac;
> > +	u16 ia_raw, gt_raw;
> > +	u16 ia_int, gt_int;
> > +
> > +	guard(xe_pm_runtime)(xe);
> > +	val = xe_mmio_read32(&gt->mmio, GT_IA_PERF_BIAS_REG);
> > +
> > +	ia_raw = REG_FIELD_GET(IA_BIAS, val);
> > +	gt_raw = REG_FIELD_GET(GT_BIAS, val);
> > +
> > +	u1_15_decode_decimal(ia_raw, &ia_int, &ia_frac, 4);
> > +	u1_15_decode_decimal(gt_raw, &gt_int, &gt_frac, 4);
> > +
> > +	seq_printf(s, "0x%x (GT: %u.%04u, IA: %u.%04u)\n",
> > +		   val, gt_int, gt_frac, ia_int, ia_frac);
> > +
> > +	return 0;
> > +}
> > +
> > +static ssize_t gt_ia_bias_write(struct file *file,
> > +				const char __user *userbuf,
> > +				size_t count, loff_t *ppos)
> > +{
> > +	struct seq_file *s = file->private_data;
> > +	struct xe_gt *gt = s->private;
> > +	struct xe_device *xe = gt_to_xe(gt);
> > +	u32 val;
> > +	int ret;
> > +
> > +	ret = kstrtou32_from_user(userbuf, count, 0, &val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (REG_FIELD_GET(IA_BIAS, val) > U1_15_ONE ||
> > +	    REG_FIELD_GET(GT_BIAS, val) > U1_15_ONE)
> > +		return -EINVAL;
> > +
> > +	if (REG_FIELD_GET(IA_BIAS, val) < IA_BIAS_DEFAULT ||
> > +	    REG_FIELD_GET(GT_BIAS, val) < GT_BIAS_DEFAULT)
> > +		return -EINVAL;
> > +
> > +	guard(xe_pm_runtime)(xe);
> > +	xe_mmio_write32(&gt->mmio, GT_IA_PERF_BIAS_REG, val);
> > +
> > +	return count;
> > +}
> > +DEFINE_SHOW_STORE_ATTRIBUTE(gt_ia_bias);
> > +
> >   void xe_gt_debugfs_register(struct xe_gt *gt)
> >   {
> >   	struct xe_device *xe = gt_to_xe(gt);
> > @@ -378,6 +455,9 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
> >   					 ARRAY_SIZE(pf_only_debugfs_list),
> >   					 root, minor);
> > +	if (xe_gt_is_main_type(gt) && !IS_DGFX(xe) && !IS_SRIOV_VF(xe))
> > +		debugfs_create_file("gt_ia_bias", 0600, root, gt, &gt_ia_bias_fops);
> > +
> >   	xe_uc_debugfs_register(&gt->uc, root);
> >   	if (IS_SRIOV_PF(xe))
> Reviewed-by: Sk Anirban <sk.anirban@intel.com>

pushed to drm-xe-next. Thanks for the patch and reviews

> 
> Thanks,
> Anirban
