Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38260E7C4EC
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 18:21:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 069BB10E3AD;
	Wed,  4 Oct 2023 18:21:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E1F10E3AD
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 18:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696443664; x=1727979664;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rO0rRlUXmPgfoU15V8VGl2sMywo+m44cFkvv9uUVmGQ=;
 b=c9jtQSehY8lgyOzaPRXjCipXhAdiKW/M1IzsJdKtMwOO1Esk7a+bhpBU
 JJnzcQ5CuH9EdOyLZCI/nZB3fsJ9FWZDIXzKf0DK6kU5KZ159QC0lpgPO
 TkxrQ1Xrgx7vVQ88XvBlsYrRYJaaQTE2pRPDAfeakSIRTrDnbxF1bIqzT
 K/m2teY/zI1YD7XYVXyVVtlTLMa01YrHLXmt0IJGK+1kVr5VZlXYsu4hu
 vZLc55I9uaV/3WW/39b+kMlmh8MEIx30CIdC79GqFuthX0ZWlyR0yKOqO
 H/qaY3kErCnLQ7XdeKh/Ao/5ixLbiCuLUpfIdSZx5b6kb0WOKI7EgtLwx g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="414175479"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="414175479"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 11:21:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="701233383"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="701233383"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 11:21:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 11:21:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 11:21:02 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 11:21:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aoa8EYNqP2RvNHpi31A+5WEtUTaZ3sdtQfXBTUaw43afufxzCOu4ZdkmvxnnNoxmh1Yhb2rur8q9n+IiDcUy5bH9sWBivyRzAjM2vDJvWZBsLoFoo6gMKhA3jhS0f/hsI9ozi51P8PWUGH4cpEi6tKCrGHYEVH/Cd3XoYQGu2FxIEbtjVRX20oU0m1c1UxuJwWLxI4Adroj4n79WGjWRA17POe2zDBAvVsj0iSVvmkdaBmFGSxSKRo1VeqvV8Pqfckljay/pWqscui66lhnQnaPdtbJ3dEf6J9X5B4J1SckHLO36jyEk0v1SXk75vgyWKr9zG+gvbUBbdjgxVfavPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rO0rRlUXmPgfoU15V8VGl2sMywo+m44cFkvv9uUVmGQ=;
 b=f9Uix3vTorusu4OHOhuUQnwcaihAB3ul7ratKrijRQntbch5vtnYdNtB1H12KplEQqR1eRJqxCO95EBQuwCK4R8b3sIwxppzJakurdhu12svlaoHb9yJeuDQ1ePMe/sN2aejbmmSOejP7Y21JDAuSE0de6GzOgQUG/CV4Z7C253gBMOlonV3k7aM3kNus7jlsKUQMeKKZQBUsHzPW9N1Dh4T3xsDBoJ6qQp1eBMaUS+IX09ZEjjFuigR+15vA83HPRpxkNuDhyswai80mQFfdUgAgwPJMoDwgg3tcF9U7qa00N86NblOgpM/n31ZX7tzhbqPBu2WmLC+YqMXBtFnug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6118.namprd11.prod.outlook.com (2603:10b6:8:b2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.27; Wed, 4 Oct
 2023 18:20:59 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%7]) with mapi id 15.20.6838.033; Wed, 4 Oct 2023
 18:20:59 +0000
Date: Wed, 4 Oct 2023 13:20:15 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Anusha Srivatsa <anusha.srivatsa@intel.com>
Message-ID: <upz4wkzzjjplrgs2p2pmo7qckazuonjovyuajiiylujlwdvsdh@u2rowwskys6l>
References: <20231003203716.108979-1-anusha.srivatsa@intel.com>
 <20231003203716.108979-5-anusha.srivatsa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231003203716.108979-5-anusha.srivatsa@intel.com>
X-ClientProxiedBy: MW4PR04CA0184.namprd04.prod.outlook.com
 (2603:10b6:303:86::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6118:EE_
X-MS-Office365-Filtering-Correlation-Id: ad9f1b71-82cf-4705-4bfb-08dbc506a8d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +na3ssy96C9WE6bCd10sTppUCiO4yCR/s9hmhJCc0p4Jd175tAWHs/EELNuaVF3E540EIW1CsjhpEuTBo+yAoEoeXHOX/A0qeuZloVaeYZWmypIOMDqWsdtM+aNPTy+cDD2++CXO+D7L1pJBaRWi8M6tRn6lajZ4OMSOs+hkX51FT7c2JlZC34eGhYQbufz5LmeW9yQgCCX1r+atTtsjsnmYYMQwlsOjby5hDNq9OgHv53mREoQDtg2MIVyV0eGcsZFJiBZCAMvYybfHvKe8yECY50gx7Os4k7cy0Rhb6qmClC+4bClIxq/sak2pO+jUR8j/y6NP2p9U5vFibiz3fPfmoDyyQ0pfKq8HARRkLvI9kRg5qDK0lPqYIT794CjcMGhsUJJAlkfgZ35IHIDbVBdOncAsaFct+Kler8tvUhu0qFMIoYfbt5o7XGLW3XgiAMN5nixHVfjh0ejQIZ89kSOuCmutO+3Al75y3Vg1n1dnw8ikraJkJAC60dLHHxhth9KTJs48jPKhyh3Abtedy2ZbpPXRf6x6FlyXnko6a4hmbKl2+uGIQYGnTJ13m9kb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(366004)(136003)(39860400002)(376002)(346002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(66556008)(66476007)(66946007)(6636002)(316002)(41300700001)(107886003)(6512007)(9686003)(26005)(6666004)(6506007)(478600001)(6486002)(38100700002)(82960400001)(86362001)(33716001)(4744005)(2906002)(4326008)(6862004)(8936002)(8676002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gsb1Iu9xWILm5rgLxMd4x6nJWnWp33xvN59qJ72NuEteSLCqxKRgkQiLPm0b?=
 =?us-ascii?Q?CyHYl9wUlHu6/ghB0fTAFiv1GDycocOgfEHJUioPkObm5VFQFWIZBeLVPcFf?=
 =?us-ascii?Q?9GuiZ+rj5RYudVWmPaP5Kk4zkXIRTDzmc7+r5a52OKN5wvz7dIWUAHzVEMF3?=
 =?us-ascii?Q?lwasQsvAMkzCIiabxDjZZUoDoiFjDov6gHETqKTnbPmXGvAT3yx0h0gTq56B?=
 =?us-ascii?Q?9394JlWMrGLuwsuelvjliy75AQlvX/ckarB8bMMiCyKhSguCze4NLTbA7ZJJ?=
 =?us-ascii?Q?VWJISU32ilmxiPs5OTyQLY65fakb82GP7NrAd5NSehgrsALTw+BjYgQMxoS6?=
 =?us-ascii?Q?j0XZgSfqerP2XZGCxx23dIqsAYaZwX/adeKUZCWHjYpiEBaUvIDWF+HpGO+K?=
 =?us-ascii?Q?9wlUJ4G6pVAwCo67iN421sxhVCtKWWFgUZ8hrkE1jnrPpV8MGbH3eHHW8e8Q?=
 =?us-ascii?Q?EbBjNNyfLnqWwr8R0SwPBsseMKDx8Qi/GpzI1eXPVT8txl/Gn1ACP+0cw8CM?=
 =?us-ascii?Q?a/m4wYtC4S+Y6PNYQ9t+BDbimzrLkItV7vf5N30ZI+oc/Ob/ulk0pooSJBzH?=
 =?us-ascii?Q?vWZZH/cCvxSp2t07O0Jkbfqz5l4Z7wIvj9oidKlJJsHLpiUaSSm1Qd2BxtGp?=
 =?us-ascii?Q?oPXmr7D+3Kmu9loJZuzuYI/zL520sk6TqRWLmzmdFcPnrs4u8jIaAZ9tgFeh?=
 =?us-ascii?Q?qnXmSdYW+KrW/3p3+rMhbJxL4j9sqPOj8wAZ21IjidFLmnqqPpzFYvepZCYK?=
 =?us-ascii?Q?Ce+rZmqTWoPX6SgCGTxWNvfLzRcv5rMz26tUeBo2HYicDvj7eCidzh/0/aAg?=
 =?us-ascii?Q?JLPWLy9c728rL4drNJDMiBeoTPVZtIAdOh0YfXv1GOSiw7c8cOMvp5K81U5M?=
 =?us-ascii?Q?7MzwTswmRMo9AuJ+8djKg15pjXyv5HEOydlSjeMm4FDuyleImseJ/HoL3TTp?=
 =?us-ascii?Q?5a0HZfsCiVuYaQ4h8BFQtiP4buPaC0QDN1txuhrMn7ql+D7pWi151NICPrU1?=
 =?us-ascii?Q?Ts6kqyAJ0sTol3Wi1tUfIpwWIy+GD3VEwgjfMIoAjMW/oEBFMIa6DaVPsINb?=
 =?us-ascii?Q?mhOsLT7tDNS/tkNrGCis89eldFzui5R8IMqQ1td2p5D42KlFMJU+YUkej5FD?=
 =?us-ascii?Q?nxEmeCMBBTNb3TgTu5Irsb/P474dG/9YDHidOnfvBJbGgiFv3k4hCSvW7F9A?=
 =?us-ascii?Q?zMuhMliH+6a8XsFLfW7OaZ2X5zir4ePr6RHFWzxK7Bv6xtIkoltlg/BmaRav?=
 =?us-ascii?Q?Ae3KxReTr7eqFZD3f0ZhWT5To7Uugb15q4PdXfmC5sK8vP05Kw/nrPZbw7iH?=
 =?us-ascii?Q?Qb/nGlnZBOWb5VMK/94vloODLYgCt9Lk/tW8SiMoKAYRum+mhD4aqXiu9OWB?=
 =?us-ascii?Q?KMUEbUfex64ZpUAm8jw/sn2HILi6wsrfvpAx5OOzI+afMYie1p5FmYAkT7q/?=
 =?us-ascii?Q?Fh+KfTCESyLinir1GGh+gzvEZ2SSdLo4zqVMtIdb8cCHDw16Dz8Q8Qig8P+o?=
 =?us-ascii?Q?0pJX7wkP+7QvtMwttuENWQKxxiqj3C3+euxigI4ws2Tc//l4sueMyaPhmsto?=
 =?us-ascii?Q?4u6NjqaEt2eKZXBzUAg2L996CaZcRGpqWLWFWpGsOC8uDAG55AVb/WbmBvUs?=
 =?us-ascii?Q?4w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad9f1b71-82cf-4705-4bfb-08dbc506a8d4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 18:20:59.7069 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eQ1HNkNm6fWA/WgXUoBH9B2thSFxYTba/vgKU65Cn1CW90CXOtpmCMn90GSEqpTEERjqQnXx3fAV+zWfsdwlWdhwxWimbdTWXn3+VhIk/MA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6118
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 4/5] drm/xe/rpls: Add Stepping info for RPLS
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Oct 03, 2023 at 01:37:15PM -0700, Anusha Srivatsa wrote:
>Add stepping-substepping info. Though it looks
>weird, the revision ID for the newer stepping
>is indeed backwards and is in accordance to the spec.
>
>v2: s/RPLS/RAPTORLAKE_S (Anusha)
>v3: rebase (Anusha)
>
>Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>(v1)


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
