Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F47C6FD1D
	for <intel-xe@archiver.kernel.org>; Wed, 15 Mar 2023 00:36:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D5C10E075;
	Wed, 15 Mar 2023 00:36:12 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F44510E075
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Mar 2023 00:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678840571; x=1710376571;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wkJO9n7XWbwrRupA2jidaoB/omIb815Kpbf6VgAfQQM=;
 b=esReqSGe/saZuZxZ+ehiMnh9l3Q/FIZMmXGJTqWl0DZ08KrgAM7SHI1G
 t7hSEVrOZGbO9sKwT+0oIlbArHHH+vM+MbwKMg4mc+1u+3JPltaxtLQkA
 f7SGxEcD2X2ieE00uakMuASi2h61nGY0FsJOqelRn7Lsctdi1SQmdU8X2
 AHAq5dJ/YkkRq2bm/tEJ31Qs5OBC8eu9O/N09tW7isNCTrQ3GKfnu90G6
 l6JYFK37huhk2LkhQEg0ZdveX49s29B54UMK6o+mdjqkj4g2iOmIASYdm
 yMQ5MQOO19AST+DU61D9JFj3xtfXnkZ6b//xajzxYIOFbw0npONAVWoAv A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="402447170"
X-IronPort-AV: E=Sophos;i="5.98,261,1673942400"; d="scan'208";a="402447170"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 17:36:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="853396750"
X-IronPort-AV: E=Sophos;i="5.98,261,1673942400"; d="scan'208";a="853396750"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 14 Mar 2023 17:36:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 14 Mar 2023 17:36:10 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 14 Mar 2023 17:36:10 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 14 Mar 2023 17:36:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EnJXDi17unakL/ozZHsVO8rtwcdHH0m5I4ECjCOpWtsgzgWLubgAST6O5dFZa8c5sDm/4NMtcwY3rkGLOgH2wHAc8ZYSlDLv2d4xoEpFsGsUNq8caUePlI5CQzJailQ61QVM95qrgqjGqBjEy/ZcP0zxd93Yy3aYYuxEbVVUDx1+4rVJb7cbWwmRg6KDTHZi6Kse7Qaz74QKZafs7Z+6iv3HuDgllQj4gZegvY9tTXGS2s5+1VxfmzovjAjWJW1NIeGpYhdQwq3lI2j3EgsFVSdLIM5eS45wl1+oglZ3Y+CqfgxThL7zIto6/43idu4+mACxFB/RHO7uOiOyuntVcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VqwTn+0FlbxeawE16GeLX8yq7kGuAEd/idpfGfaskIw=;
 b=Jwf751ApeJoqDgh4mfUtijUutYSFYVMVbPUysNxXE2qZkA38wfpPspcqySlixfXuOZWnRi6M7Xcsg1Etv77A1F7xmYE2LqMdaX+Imz6fqeizSW07ky8cIXBHKOpK0xJW46FettYtxgGBQr06qNpf0QWPqqlt9LhKxkb84p+3NOOxJNP78sfg6XjvedbJhngeCC7X79AZLFrpLpMkmrF2KzRAUNQc/FOUfUzIuKhBhDDmFNnKMHfnpbsHJf6NPZ4br4tj2JrfVrNXZfoEMcACcaJ4K2wBIHMZaG6D+d4RiZiC/oUPEOltNJfZqb91xOsA/spwZpdeNemEM9Ws9N92cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB4903.namprd11.prod.outlook.com (2603:10b6:510:36::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 00:36:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%4]) with mapi id 15.20.6178.017; Wed, 15 Mar 2023
 00:36:08 +0000
Date: Tue, 14 Mar 2023 17:36:06 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230315003606.tgblu2lag7qut45m@ldmartin-desk2.jf.intel.com>
X-Patchwork-Hint: comment
References: <20230314003012.2600353-1-lucas.demarchi@intel.com>
 <20230314003012.2600353-15-lucas.demarchi@intel.com>
 <20230314234658.GC4085390@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230314234658.GC4085390@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR11CA0037.namprd11.prod.outlook.com
 (2603:10b6:a03:80::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB4903:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f45ae40-a87a-41ed-007a-08db24ed44ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u1kD2CbviQep2CgcIGV6P/BkT/Hfs93WavcnzzthlhkXokw6gz+OVh9OOt+DkWB7nuXWnG2i8e8mxugoUEYTv/cLd1i4W6ES7l4oJbKOLtfAA2Z2u2pW1ITAYTTIuObZHSFKqx9Ibf+8a3ZJkC3N4ZikC4J0JIA5cC2+P7/Os6hF1v7FPbxKpmEsmSiDDsp+Ue6sbM1fcuchSSpX3HVn26wocO+ez85wrGT967fvpMmC8s2dOdUQ/VVlDAMtelGjKTIn7OHmAUJrngqPYRVJS8swRfaohy7RjxWh6cWwHV4LorBobpdOKpZETlAIENv3AGSoRMtBRc/pUIwNKKKhlqnLsJKqGQz0Nsi3AOk26n+YnLGXltoXZWZ14eQZjedBMcsUsehi0pKGt6Ar3lf9MpCkcZdYrvRg+lY4UFR74KdvJ4bt+ao8uHTPV3TY96oMh5HRx5NLeu3gggimns+xfDFyxtU3TnaXwvFVfw/PPYVKS4grbJQRqiZwgCT6Zk5xf1RpPMh7IFyrgPhIi7e8B23DJF4VedPM031RD+eXVd7EUNb95XrJkV04stinA0XjlfEG6VxtnXzaXbcf1mCJUTrmLnCEwuoFhpW54cSEGk525UI0obVzPWcBT28n8H7s4QK/xprajREKqAlhL1s7BQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(346002)(366004)(396003)(376002)(136003)(451199018)(8676002)(478600001)(6862004)(66556008)(316002)(4326008)(66476007)(6636002)(66946007)(8936002)(41300700001)(5660300002)(2906002)(86362001)(6486002)(26005)(6506007)(6512007)(1076003)(82960400001)(186003)(83380400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1QTse84LVN+yghh5pRO7+KQMo4y0oOW5+kgOZbKSvvGSMNSxFiba4SjiHMnA?=
 =?us-ascii?Q?7j9zea6gIqU5aSs6/shRhKJ3+AGN+4P5yvYEpDeOVUBrV3riMjHPAkn9tQ+j?=
 =?us-ascii?Q?RkShxDBJ6QxL1GCMX7nlBWm0Qd7YHY13jgPzFxGXet/ekJvXl9sBy8n6TjKt?=
 =?us-ascii?Q?KgaG9Ue7gFmi+aTcdnUoIYXWnAEJig5Y49GaSje6icPGwYyJY+QPYgUR14h0?=
 =?us-ascii?Q?AvGG1Io5CXUge8/thsjji3JquA6koQrLxkvCunqS5tMufPIcYGkFG8zsh/LL?=
 =?us-ascii?Q?KtUbPOCH2+6Tl+uyPnGYt2YrEnF8FKjD816RKGNFbZVOebYNZqelzYv37sne?=
 =?us-ascii?Q?zUIaP56AUmc713heqgYeV4quXMoQs6Kr3B5Aqo+o2T0jvItzYQzl08i5B+oc?=
 =?us-ascii?Q?Zon7PPMJaJGAjpwvEy6U4T6kJk03/bsaWGiIEO/bFq/qQ2f+rjEy2d+/DrSn?=
 =?us-ascii?Q?Msbu7AMLE7EU6/hFeB0SEYLjkIq+nlLTLEVUvgNurE8+HYRj4dynwxqlntvQ?=
 =?us-ascii?Q?zNR1QTGnKqvT5hKEPdYJO/IqZNcxKo/3U8jdWz8wrm2+lDyhFjChUBbDCXe7?=
 =?us-ascii?Q?LYSFldNixpo7MuzzMXiRVN4NwMolsFOy4R4yzEzbfAy3LtU8E37oD8x2MNar?=
 =?us-ascii?Q?41rgiPSbHYIHQtPFk1P1shuCrObCu0eL/IMxRB5isR430xpRFTVGU8vvyu/T?=
 =?us-ascii?Q?p0gyLUhmutbwdiW7qs+PQBF5LVj8lQsD5nXXv3/ah0zmi1O8MrPCyW04MnD8?=
 =?us-ascii?Q?KuPkbc2LQWbqOMvUN4u5BkTOPvDlyOoKmPxqQrLaFY0GpHfgaZ6m2ydN7ZC+?=
 =?us-ascii?Q?Q/JwE1TJJQolPyoLqROF43pv8Tz5vJ0y/qThHSqpQsPz8lWTp8JHCVxaJwvY?=
 =?us-ascii?Q?8Yvp3jB8MvY3rGuga9FKNKrbmcMnzB0GeJXuLSrU3v6YFO9bbcrBdehxVvu2?=
 =?us-ascii?Q?0BqqLo/09DbYM6/dzJa4zB0LX0G6Wzjckd/LBxS22Ohu4xcWflMXjmkrr3gW?=
 =?us-ascii?Q?MrrntIu4VpSrWLf0Ic6vXS79H32LTGwDihsQYESmlGbGPnzX0UTZ5CKLfaai?=
 =?us-ascii?Q?FinOCcE/ez/2xkK5P+PwTN8yfvzBvxOWGS+ZpyeVH90y6zb604qX2tocz15L?=
 =?us-ascii?Q?9VUyIZYH4XdZo4fDelqn+yFiXvKN21iBNcJNstg5ULIDPxJ20so/dvjMb0NL?=
 =?us-ascii?Q?CK6wnZdN7VF1B1KWtp90PnQ0k0uyPyyD9XJxV8tFO3LwbA57Jeg4JzdmjI7U?=
 =?us-ascii?Q?sBT8hPJEWr1y2Xqm6zfy1nQL9ai6HI2/ftEAE1bB2hDOEegkNRFMYGdPM/H8?=
 =?us-ascii?Q?pW4JqUyrhEsCfOkyK7xrA3+y72x5BK66z93YGrcwfEZYSl99TYvS53Iv5CWL?=
 =?us-ascii?Q?thKzTWP+vGZl+Mb75YR+37MdfSGl3xKCSuWSP0l6eiz4zwtvk3zdEydS785s?=
 =?us-ascii?Q?RvZqlfEv3hOWt5+sQwgIhSZfMTS41jM+x0pOX5iO7jKei9NJRgU0/2TQp1Xu?=
 =?us-ascii?Q?qTdUx4t75c76K2MaVsx5pNqdUtM4Gt20pW4y93InY19mgIsk7jnoKQSGKtAA?=
 =?us-ascii?Q?3ABUeBV4ZHIcU6HITKpvvWGp0qBiWeWdbUL+8PuFChnwLYweltY4qyQ5Rc9s?=
 =?us-ascii?Q?Pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f45ae40-a87a-41ed-007a-08db24ed44ad
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 00:36:08.3281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 37LQDf1hF7s/5gaBGTbPSwPgQo+kUkbKhpJBgJTE+wXSVLOPFLWR7B0V4Ml7CJhuvpLGpN6CnuIh6k+iP7n6d0nHay4ebfnOlyXXemVt/7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4903
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 14/14] drm/xe: Move policy on preemption
 from WAs to tunings
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Mar 14, 2023 at 04:46:58PM -0700, Matt Roper wrote:
>On Mon, Mar 13, 2023 at 05:30:12PM -0700, Lucas De Marchi wrote:
>> The fake WA FtrPerCtxtPreemptionGranularityControl is documented in i915
>> and is not a true WA: it's a policy chosen to allow preemption settings
>> to be controlled on a per-context basis by userspace. Move it to
>> xe_tuning.c since it's more in line with what his is doing. However
>> since it's not something suggested by the spec, prefix it with "Policy"
>> rather than "Tuning".
>>
>> Also, there's no reason to apply this policy only between graphics
>> version 1200 and 1250. Apply it to all versions, like i915.
>>
>
>The big mega-comment in i915 was explicitly requested by the i915
>maintainers since the way preemption is controlled is kind of hard to
>follow from the bspec, and there aren't many people around who still
>remember the old discussions about this stuff from a decade ago.  We
>should probably bring at least some of that text over to Xe as a comment
>as well.  We can drop the stuff about gen9, but the explanation of the
>two control options and list of related workarounds is something we
>probably want to preserve.

ok. Since all the others are unblocked on the review side. I'm going to
apply them and come back to this in a "tuning" series where the current
issue you pointed out in patch 13 is fixed and the comment you are
pointing out is also copied over.

thanks for the reviews

Lucas De Marchi
