Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4273C46CD3
	for <intel-xe@archiver.kernel.org>; Mon, 18 Dec 2023 20:30:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D5C10E102;
	Mon, 18 Dec 2023 20:30:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F4110E102
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Dec 2023 20:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702931444; x=1734467444;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JZvblNha8CG8X9WMdbeOCONLI3lQP8MHApj8rnRN/aA=;
 b=XrzslG4huCtfe5IahUbvTmWi5LNtlRiqBcQu9a2oAZs0kDG9oQP22s34
 MxpQ8uStmFcA4ZSjhbgvuyrrZShI9OPSH5+7YQhuzsIwySDtTVmB37iG0
 jciI38cY+r020AQOgFN7Ajhh1MDu2NP83uTovKXx2cbNK639nA2ogkBHQ
 O6WFY8q5Be72LVkn9rDLJ3Ewonep6kqV4cAaajCEQ03JQzOwwQkcJEoOC
 x21660/NxBlrxsv1rP1vKepN3ntOFk3hYJr6MVKs8bCd1RGtbGFUyIk7N
 cPioVw8f8y3LD3qz0QMvyM82oWMH8Nfn1EQ2mODiiouhN1Gb4KnTu+0x8 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="375054490"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="375054490"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 12:30:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="1022879565"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="1022879565"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2023 12:30:44 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Dec 2023 12:30:43 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Dec 2023 12:30:43 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Dec 2023 12:30:43 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Dec 2023 12:30:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kvoMcxSbtSfPxf4kJ4yUXud1X9jYWB0QyrNnNRupdWOdY3O+SFxFizR6mjv9gFAZ1DSRHUM1TiKeShVspLR+/zbfNoNWZpJDcdSlqRJDp9UO91Ih9eAuhchgEYjyOYUcS/+7OOM+FTOFqzHwMJeCXmVHoyvNAbH2O/Meg81us8HJnuXulX+uQayAO/hyskGqYwBjoiBcG1l+vTvuhSgEZHcoUHbi+u/ZVqJcsqEzHwwya7nFbl4aJQePDFB7+tjHrbckLDC5GPxT1tjhAdP+XOufsgX5m8J0zYoSqudKfdMBbPp6tZj/e91Omg/RdYuIumj03Yx59SE58vcHFJo46Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7VurLnamy+pCsmXNfgdArO1c/DbVUCp2ECz7b8VLYbk=;
 b=D/R2wCPgj1HA3jrILqDBdX3eXb3c3pnUDYUuz8McHFVPkkxPMKHX2EftW5QBor5H7ccKAEmBxAx0ZQLhJEaI/ITAm1dovWquH8Swg2jbllHPwkqIeCU34dZq2OCIbTw63QgynFkeldNI/M9AXxjSoDeWtyuNEL4Xg1EeqWBrGnNu7DJl3LjZ1GoY+rlDZ76Ylo1vFKa2FFtGYLLT+UO6rgi8MQzrrpGksTJcLeUuFr8Mj4sztTsAamPeNnZGHUFMKah7wQTQmz6cn6H9QOEvVVPrJ7LjoZVzh5knHtciFUw5SMTWFyC4XhCRpPO/TsCEsE1z3tuVGdM1Y1GadSUXTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB7087.namprd11.prod.outlook.com (2603:10b6:806:2b5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Mon, 18 Dec
 2023 20:30:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7091.034; Mon, 18 Dec 2023
 20:30:37 +0000
Date: Mon, 18 Dec 2023 20:29:21 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe: Ensure 'passed' variable is always initialized
Message-ID: <ZYCrocwFzTdOuPzz@DUT025-TGLU.fm.intel.com>
References: <20231218163818.1700983-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231218163818.1700983-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0271.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB7087:EE_
X-MS-Office365-Filtering-Correlation-Id: 30d07b7c-59c3-42f3-955c-08dc00083173
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MOG30Dile23EreIruk8mu0kTnhshuSUVl6I4qbOzyVoDLMkjhWjjFHNvQ9OGPhKvrew6NmD+8FZqnq5TyxYNFPYucwIImvZNi3fNf/o1GewuMYsatGc14DP5VZ9Ke5hARgFkmOdsRxJGVlHUVqiShbXJcf9sZzkIkuycN9kLsr1PIf72EBvHynC7DQnXuo+iWRkn5fu6ZN1P5EeJLxcOiudfvcfSRdWk6s/QKNvVey4jAj+yyY0KJP67LAXpgfz5z8HGDWhtTg9UcGafFijMjS/+7gE48HrIH8qPfW2R6f/u+pM/bQbTR7KPX1AN0KiXFKZDrsbLZlhE74N329d3HJcDbxji5arA+yCFZf4JIHtAUgK65lhjmCCGpCQL4VbUHIjs6g4EfTTPZ1t8yw6FoBQUZWkr2Uqt750h3Rm5xyG/m1YPU1Ya7N3KKNoAY0OOMVTBMYpW292xSka2jDFlkoQ1+0196/YMCQ4+emFahzIEuB/Fq3XLY7uEhcpBRW2CDFN141rKHX5PP/Qplpd/gPVR0A0SUj0v/kST1oq85HnPyay9kWrcYY4oRgAd3oOdzCf2QGg1NtA4/7GwsRm0+mq+7fQQISfun39F2cxc7fRrOJfMmoDvtL8f/ekEz7xZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(346002)(376002)(39860400002)(136003)(230173577357003)(230922051799003)(230273577357003)(64100799003)(451199024)(186009)(1800799012)(316002)(6636002)(66946007)(83380400001)(966005)(82960400001)(86362001)(8936002)(38100700002)(41300700001)(6862004)(8676002)(478600001)(66556008)(66476007)(54906003)(4326008)(2906002)(107886003)(44832011)(6506007)(26005)(6666004)(5660300002)(6486002)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Bf9GNv8gW9k+wfRJTctcYWgSk3tGc/77wcdqMzCbja+1LNrhNGB73PFUoEiY?=
 =?us-ascii?Q?Sc5gc5WlehBPS+YFeNO2RYOO+qiwS7D/wR3fj4HFDkz4WvWjZB7P7iRuyWfJ?=
 =?us-ascii?Q?Iy5cI5ew/gLE+2+ByIp8MP803E+eU7cnaej4GsIekHbuo2eOrihZXsQRYPH9?=
 =?us-ascii?Q?oAjWYfulKpKn2R9L6387NjfywKq4m41M2eD7X1485OkH1tY6KpnUY8e6cpvn?=
 =?us-ascii?Q?g2/2NXCHx0lagx9C/41efnEeEgOWIg4SluCI6ciYr920ezS9LWU/mk7Ua3x2?=
 =?us-ascii?Q?Kh+9yvD2aGqMI0/pBn++O1R06YuNpzlhhiMlE+BMlUuLPhdlpw1Btty3g//d?=
 =?us-ascii?Q?UhtT+SG/OwIyiviG3z8xHhU6Y12ZrDcebYTyXNCt+F7YojyrMTf/an+t0Gam?=
 =?us-ascii?Q?iExSzhwvPlijqlXVnC4anHWmbGzgS7c5+L7WVc6gyonvpZIrHiM8sXIzqaE3?=
 =?us-ascii?Q?QBz42S5n6xzzgZ7wgvJ9SGF6eArRSEWxW+BUu9bZTDSSEEKWVXGAxKB+Q98I?=
 =?us-ascii?Q?o7CDkLh3zh16ZUVAleMJ0r6rEKe+Tq3CdEIRH3YEBmOmWW6NaYyMbi8N9eti?=
 =?us-ascii?Q?DQUlXbqDxajJOv6wAvn4e4P++S6M5SCs3YiuhmIjiUE12hfoQOJ5Cz3FyDDz?=
 =?us-ascii?Q?NOy9a+d0V3bm5AD36N22Wd/Qi4d81a2kea8NVGso3qK94mO7AsgjX2MnY8ex?=
 =?us-ascii?Q?OdNhIGK+cDA51Cx4pWIujmp3HadSrs9VLpzwzgoFVC/QNEGplvLAK2j7o6W9?=
 =?us-ascii?Q?JqN9+BdAqE3ljpvOV00qQGp5fDf+lM828jckHFgvD/QAhoyHJi6UmLRTJ8aP?=
 =?us-ascii?Q?CPyt0UCyGiksaaJ2J9AXKf0jgPJR2s7voPk08AaekxLTA5yK0Sc8kSHFbOwC?=
 =?us-ascii?Q?axRcsO6y9H5d4wEtj70iprv+7wnqmioScRmnqiviHWyI5q9DUYN9gWouNUV9?=
 =?us-ascii?Q?3krXv15Lci5N+Ua+l/HXBQ28if4JzJUcLrN1TFuqAHxaNMrxH1SrgErZl4TP?=
 =?us-ascii?Q?1likpSUDSS4KU1IeQY7TYBx37ZhI32AWMDBFiiy+Wce41gDBiqw33nZKPhCI?=
 =?us-ascii?Q?MvjK0EQLcXbIAHEgIHZojjmiGsthxOhDZtpeGqRligwElbL3QJoXL6zraEpR?=
 =?us-ascii?Q?C4h6p7GwzITqRV2DxncPE5w7MLDjXiA1N6mGKEC6zpzGwtUTWnSuKZHTx19B?=
 =?us-ascii?Q?WZ7VOd+h3OjlfEHemn3KEhECq0bwTpLRKZCaMiTEtJxCUTrcODUe8uSh9kuy?=
 =?us-ascii?Q?a1fP9Bv3Xv5Dlit+OLozV1IxbL/HxIBPuKj/oWo80QdxEAQlcts+7wuCHB57?=
 =?us-ascii?Q?dFB5VQ2DBX+ohr+4DpVU6cm7bPbWWwWNjDldaDtvB4geXHSYLbQv7oQLSppV?=
 =?us-ascii?Q?+CmZ4h7Z8zuFXR7Arkz8newbCR/F9VOovNzDcmhLkEgK+0wapzk+WnUZFS4F?=
 =?us-ascii?Q?RYwcmnMRIYnAxfdV+NAvS1x9qQKHI+A1n7eSKYuGgWIRRDwdgyzkvtj6q4is?=
 =?us-ascii?Q?gu5IDLV+ZtOIiTJsTpB9ZbAN25K3E+dU6WcgN9kl4ARY6wzcLWPgNDPKWpMC?=
 =?us-ascii?Q?/piV9rSdL+awcXexBgNdPiNk3v7netjCOd2xp5crdR/yA/ZJesOq6N5OV927?=
 =?us-ascii?Q?VQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30d07b7c-59c3-42f3-955c-08dc00083173
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 20:30:37.0391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nGP/ehoOEFvS6sQcG1yCtXtF7Zk4K/JkbysENr6xX8M7OMsi2fum1v3Q5lmZq2Dn0o0vlDNHpBsJm+dvrKi+KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7087
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org,
 kernel test robot <lkp@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Dec 18, 2023 at 11:38:18AM -0500, Rodrigo Vivi wrote:
> Although the path should be impossible, some static analyzers
> and compilers might not like the fact that there is a path
> where 'passed' variable is not initialized.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202312170357.KPSinwPs-lkp@intel.com/
> Fixes: ad7d86415578 ("drm/xe: Enable W=1 warnings by default")
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_wait_user_fence.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> index b0a7896f7fcb6..b2e76331bfa73 100644
> --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
> +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> @@ -19,7 +19,7 @@ static int do_compare(u64 addr, u64 value, u64 mask, u16 op)
>  {
>  	u64 rvalue;
>  	int err;
> -	bool passed;
> +	bool passed = 0;
>  
>  	err = copy_from_user(&rvalue, u64_to_user_ptr(addr), sizeof(rvalue));
>  	if (err)
> -- 
> 2.43.0
> 
