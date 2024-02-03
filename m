Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 278A8C4828D
	for <intel-xe@archiver.kernel.org>; Sat,  3 Feb 2024 06:39:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB1E10E94F;
	Sat,  3 Feb 2024 06:39:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AxNm6rcK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BB0E10E94F
 for <Intel-Xe@lists.freedesktop.org>; Sat,  3 Feb 2024 06:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706942351; x=1738478351;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=vr7By9uPfzlK2niGxkwFGrwM+7FvSNpGz7EdvNoILJU=;
 b=AxNm6rcK+9kU31VmwtK4pmwz6kT9GTamBRT9aAm5vZxa+fdDgnrZ9Zwl
 HpeYPk5MI+2HbnaOw5VjalYngwhEg8dDTHsHKdnUqmu4JUXfSy8qZBh5L
 eQGms5zPunYgBrIL/AWq/G4pCon/VSIGep1QQFUz85qPsH1HFU4arliDB
 htJi4ro9/2WB8khCOLW2qGkIrcnM22B3DtSkyn+O1nv69QAUr2dtXlsoI
 YiXrIVNNy04ENf+yuaQedKXOeTegJj2d19v6uNmQofsskAt1i6wwphBAi
 NVn1Wxgw3m73xFP5MMwXpjvSQfCafmQ7817uSdn9NRyzOS0OUkX69B/TA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="17818670"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="17818670"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 22:39:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="564876"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Feb 2024 22:39:11 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 22:39:09 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 22:39:09 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 2 Feb 2024 22:39:09 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 2 Feb 2024 22:39:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rh/0xN+UI9SFz1OQrl5HoxKG1P/0P8bf8CSCRNgw6eG2ECctPVM7Bz0FbKKFRAEBYkq2pS23KU27Y7QnjqVRQW0KnOpr3GZpn7+3uMN9zw2JyAPMgZZflrzIBZVQSOCxaD1tPWUAYkrONiJn3eUAiAkOxprTXPe6UQZm8Ttl2ncjCtYWptInj5Fu5UbfjO1my9PXf5f8T5wl7S64Cz3uqdienAVHvkRfI1EVYVjI/XQkcdpjoZJdFdFN/imlyDIm+QxMH+4ieKXndjmojX2F3M+z5AqS40Y6HC1y9bK77wHfpFl+6k8t8OifM49FVa/sSSf594M3oy3OqzOVWYlDmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QDrNu8+c1e1wGtTD+i7QYMH8Yq+RBHxIiWfIC2aFju4=;
 b=FUfj9SaPhON8bic1KDdYM81Vm6fI5polINDcA+3ckVC6ps52nTPTqoky/OyQkAwRg/rN1YcwnZ8sjXMxtOkTKr7JPoykLIlZrwm/N5MTiLAVtb2eD2AIsQAXSmpHQoD0BmmhQdXcmygtit9xsD7tlgqgbdPuQxJj8TAnUCvy2MB0t0AAVRqIVqQ6RzNsgteSEApqqFvbFwazKoe73/G6Es7QgeypzT5X3wqIcvz7U48ODQUamp9It6dIqvq08IBeCSXr8zUs14wMOAEv5Gxa9Y+n5SAQBvGLPOSb26aTNg0VPQ1iHq0CX6/wMLcKr/YMHuyI0FnuzxflsSyYAYLBTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5894.namprd11.prod.outlook.com (2603:10b6:a03:42a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.30; Sat, 3 Feb
 2024 06:38:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.025; Sat, 3 Feb 2024
 06:38:57 +0000
Date: Sat, 3 Feb 2024 00:38:54 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: Re: [PATCH v2 6/6] drm/xe/guc: define PVC FW
Message-ID: <mlncxkfn2lelmx3axna56nbpph6tioyskdcyje4qbpdziuqbhp@2it4ll5ixfzu>
References: <20240202200017.2133438-1-John.C.Harrison@Intel.com>
 <20240202200017.2133438-7-John.C.Harrison@Intel.com>
 <3yygy5wjwl2vv5ywm6o7ig56ufpdhlsilfamrllifbu7scgzk5@4nfj63plwnq4>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3yygy5wjwl2vv5ywm6o7ig56ufpdhlsilfamrllifbu7scgzk5@4nfj63plwnq4>
X-ClientProxiedBy: SJ0PR05CA0104.namprd05.prod.outlook.com
 (2603:10b6:a03:334::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5894:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dcef1d8-9593-4625-7dc3-08dc2482cc90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lKF30triUYiZCx05X5Engt2ox0X4WDg8XimQHmKunRrbhvYllNirrIptQsbTZyMxjaFdWCeVUYNJwGkv6szXzkmcBAM85uMzC+2kbb8zBMZF1Bnd7oT4YJZoMdFYwzjOevl/fJbhuxgBeVUxKOanV4ls43yllHXO3kxX7stnwmuc4vE3OY0drpiFL0QmHBVS4Vs2QH92JpSGgS4J6NiR0DP0dK3KwEFJSv0DYPbk1o66GF/j5Qg04XEzXvR/UDYeAnaTzgIiy3BrGW7Imf0px3JPZM1JFs0SGbEr4RyuiX17bhaN5tDHzSOhEaRqQePy8kLowiNlvngezFpJ2JRWrux2bo3XkJSLs+yKbvdRPLrTUZGpAqodXRAUaHV+S9xgZZLn6K/2mY9HyJkqnF5YK/gIgacXbAjO/qhg2TjSCAVCJpah7LMV7gQTnriAcQ9YBgxl9StG8d9FrVsxXV+35rMy1TlQil4UO0gNH8iEVtyazTStdBXCrZD2YAj8iWiYLl3UCsBt18yGsSfmnIqYRmNRrzeVQiopYSg9z8R6WNA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(366004)(346002)(376002)(396003)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(9686003)(6512007)(8936002)(26005)(66574015)(34206002)(6486002)(41300700001)(966005)(478600001)(33716001)(5660300002)(6636002)(316002)(2906002)(8676002)(86362001)(66946007)(66476007)(66556008)(54906003)(4326008)(6506007)(6666004)(38100700002)(82960400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?SnYAWyuZvBJicv6d2gQqWkLW9saVCldD+ctnSpf+DRQAFD9AUXnWQjgcOm?=
 =?iso-8859-1?Q?KiRKJt1Oa9xkUIWCB4BIZWTrZl6NN83ZVRQYt0PszLMovg8FGkq0BIxQdM?=
 =?iso-8859-1?Q?JC7Pl79zm2g8tAQq4D5sresb2V93OblhESzrplFodUllj+xFAnypJEMhbY?=
 =?iso-8859-1?Q?yK3J6vFEjFARrLTJmkePoKtEExJ/BT3ZxNA4jjyF8L2XoM+YozAwMHSPzy?=
 =?iso-8859-1?Q?bPce7GQ5DWfRUNGU+MLZWTYMMXWz+48jCZ7dzGP9y4fHT34As0GvvgaEME?=
 =?iso-8859-1?Q?a4cOHp+qA5zgy501fZdo7RUQ6KiIJNW712wwQaRG+ldxSq1m86v8qjc5hZ?=
 =?iso-8859-1?Q?dddSkNLpSkZpXmrrzu+wfu8SFJWBC624g1ZYa3ZwmTq8SPQnX6bnIhqx/n?=
 =?iso-8859-1?Q?4/KqZXYkIJh5ePYuhOsAMmX985qfXSp6H2OfrNO3wWYglGgYNDBuKGOM/H?=
 =?iso-8859-1?Q?jUryGSIng+Zi2PiTLiFrlHxcwGxs4AEpwW3+SwYj/51E9QrDkQsL46N4s/?=
 =?iso-8859-1?Q?B2sBPK9UUcKRk47210E7HMskxjgpKrKC+LAe5DsqzxHJ58tZxgZObg2shG?=
 =?iso-8859-1?Q?Hs2YHVIxwvDCo2FckocDMOhhVRB7ZQs64/SeyriGPFqKKpQjOjE8O2Zxia?=
 =?iso-8859-1?Q?KVp6s+FOuuvxyugUysFTOSaayqr8CBcsIiqcR1BBoH6dpq+PZjGZjcB048?=
 =?iso-8859-1?Q?kTLYhYviRxQQEZZpB+j5thCR7GTEJ5FluRQ0bFX/H/HER7CINiMU6W89u2?=
 =?iso-8859-1?Q?QDJIBJmLAuAZgzfnyRXeHUhje8wFPpHfc7UJY+C4eR7/lJXoGZDOezsZ+i?=
 =?iso-8859-1?Q?B4AYTQqmPe0k/BKsrPIk88Qx23LxaT8JsCwGPEdUZ1ZVNCm10gh9McHG/X?=
 =?iso-8859-1?Q?U5mgmosC+WwuG7ZZwbAl1H072k0bC+S7K3FtdHSLvKtvGhMrCbPTJw/lbK?=
 =?iso-8859-1?Q?RADQdmjWRsAu+2FJ25gq8lLgr/2b9vYxhDlFm5lWO9leL6v0OCIUapNZkI?=
 =?iso-8859-1?Q?pEhXZwB305iPvK0JLWGwN6khE1jxbwo6Bpuvu01mJGslUP0egQfNEO9YiG?=
 =?iso-8859-1?Q?xj8JKPDm9OidCjIRh8tQQ7XvwjwZoeptMVtMQRfce0ULvfEEmyfJh2FUkB?=
 =?iso-8859-1?Q?GT61atafLJNKTXIpSKd0iL5jBCozaJsiAwlrL2HztlnnC8efXscvVjHqkz?=
 =?iso-8859-1?Q?m8snBmrySfiCDnocss/d6FTy9IYKCxxc1pI+/kiZQw18sGu5Dt/aER5r/q?=
 =?iso-8859-1?Q?VyVHpaIe01zj5eLifEZqnkkxOpF7IhB9yBDbOaTvGP37zzJlAx3AyR3dTS?=
 =?iso-8859-1?Q?ae1s3FAgWHGjYPPk2Zv0a/SsYy9aGm+LLN2VIx7EQZAkwOMmZGb8437BAZ?=
 =?iso-8859-1?Q?7q6nF1IdPQzem1mWYNfeX12Tf9+ljGz6MWCbmlJfoCvQ5idE875fV9219h?=
 =?iso-8859-1?Q?pt+u40irmCBB6QFjLMyExeMyVE0nvoUbctkb6r6rHY1EKUrnVjLPQsqEFN?=
 =?iso-8859-1?Q?/km7JR0dvhYQ8exAhBqPxFotugsJ55V3XhH4BbHmfwiJIM+T0AMbZIIsYY?=
 =?iso-8859-1?Q?V9o8Fb/IorhcoIN/UdaxK9XwrfDAiQ9zroFnRs1vcnVLIAVIWyUdNVWarQ?=
 =?iso-8859-1?Q?USQzcNHIHrGjAQF+BnqLL4PIXFTgozfcp/xByPikbNIYir3FtokrAyiw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dcef1d8-9593-4625-7dc3-08dc2482cc90
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2024 06:38:57.7765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T5BIUZqPIcRIgrlpmmzVHfu77joEj+gufN15dErEJqJcctHG6Cvl3kxxhgJOUEipOdYxYipmoPfvDa86XX3/b4rfzZq6GQWpx6edEylGiSA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5894
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

On Sat, Feb 03, 2024 at 12:09:19AM -0600, Lucas De Marchi wrote:
>On Fri, Feb 02, 2024 at 12:00:17PM -0800, John.C.Harrison@Intel.com wrote:
>>From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>
>>Add PVC GuC FW definition. This is patch is for CI-only and it is meant
>>for the topic/core-for-CI branch.
>>
>>Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1155
>>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>---
>>drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
>>1 file changed, 1 insertion(+)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>>index 4714f2c8d2ba..d9ecf76c42a3 100644
>>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>>@@ -105,6 +105,7 @@ struct fw_blobs_by_type {
>>#define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
>>	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 19, 2))	\
>>	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 19, 2))	\
>>+	fw_def(PVC,		mmp_ver(xe,	guc,	pvc,	70, 19, 2))	\
>
>from CI results it doesn't seem we uploaded this to drm-firmware?

I kept this at its previous version and pushed to drm-xe-next and
topic/xe-for-CI.

Thanks
Lucas De Marchi
