Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57CD2CCFA00
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 03:57:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB9210E234;
	Tue,  4 Nov 2025 03:57:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CcNGIflI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C4A10E234
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 03:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762228664; x=1793764664;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=k1MGUi+Rz8gldr8przGBPuSlAmD3n3lXi6gqgyw92/M=;
 b=CcNGIflIxpTqglO4Z3z3jhG2aEvvkzmIArep7Rt1s9zhxmhm6bvDQn+C
 Q1IOPjwaafUtFPraozFsM4AZd6IZb5L6iIMWgkzdMhrqHAoOpDeRKGB/R
 8zV1pk3rncJFq7G0t60gFcI1dUU3Ehd/FEl7P3htrDnFw50wlc2IH7jtu
 TurDtm772RGXPPP+oH8KkZ8YWIPuPnDE/crFwEBgF3TPTTaJCIM3NmNWA
 umJDwXDSv6c/dZCjuEqtPi4RSOmPBAwm0yOPp1a+LtU3dP0ypfbNdRNR0
 i+HRitgRQrNPr1op29iC+v3NIpWHlQKGoBIQlXlHfeqXr4oxwN/3H8g1M Q==;
X-CSE-ConnectionGUID: qrW0lCpNSgyOqZxDWiylfg==
X-CSE-MsgGUID: TmdqQkLpTeeVS0tJ5kX9uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="89776811"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="89776811"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 19:57:44 -0800
X-CSE-ConnectionGUID: 8Uo2i/k4QGmqMesRqF86nQ==
X-CSE-MsgGUID: qkuIBsLpRQOHKmz89kq5uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="187199061"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 19:57:44 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 19:57:43 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 19:57:43 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.32) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 19:57:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s8fLlTKkrubPZ6Pr+yQlVjt39DSvs2MYyyc97wv/BvNat4p8BQ16quTLyqpbri247a4rDc/ygA1I8/zclMi0+ugdtVMgGhcVqdnvMeHxuXf8jVg7FsJhoInFdUbeNPWm9Bnjb/7/BgphaA9YhSgZvvoTfb2iMjwL7L4rW0+BaGFfLwIYAVAtW/4eeDn7iq3agKgLT7lNCuhh2YSe8nQU/9IKaUuR7cWWD/xbPnlKL0Nlm/8t2kfi481W4ynp2poWwegbsNMMUUodUiPKgbYn/jnhtIK9kcwfn/yronqQ9fGK+A7tmU0RlVFlBc1b0aQSlObuJpeGtpzhkCwtv5R6yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1MGUi+Rz8gldr8przGBPuSlAmD3n3lXi6gqgyw92/M=;
 b=dA9QPP2HE3N0a+HsZFwThk+XL++h/eTUkswxGocpsAXzgj/HE8TqifXBIF8HcTbfLZ032USm+dZT3dL4r5yzL6Z1GxStMiU+zsA2p8MeePHLBsEyTehUFYpWk/X7Z4PksXMNpjR++d57wEBBnfhqqGZUpg+Jca8Wmx+WkN4mKKBktqkTTNgsd0GFEK7UhpqOPvI5ZTbDowac05vQznTBDiyzYacjIjQriEqDOo0FBFrOvAu9F3F8ZGLTql+UqFkh0km87DmQG99sVa0mtD3FGqZhgy7Wx5cF6KB6iNAEMVRv7vxNlRYifPTfKnyxO9zOJpsim6iTr7a0xX7QmDOPPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6342.namprd11.prod.outlook.com (2603:10b6:930:3d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 03:57:39 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9275.013; Tue, 4 Nov 2025
 03:57:39 +0000
Date: Mon, 3 Nov 2025 21:57:36 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>,
 <francois.dugast@intel.com>
Subject: Re: [PATCH v4 1/7] drm/xe: Stub out new pagefault layer
Message-ID: <4443jq4mufv22yb6td7fie763db7yma4htdxsz6qky4vgelmfj@n2o3obdfedry>
References: <20251031165416.2871503-1-matthew.brost@intel.com>
 <20251031165416.2871503-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251031165416.2871503-2-matthew.brost@intel.com>
X-ClientProxiedBy: BY3PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:a03:254::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6342:EE_
X-MS-Office365-Filtering-Correlation-Id: 29cf38de-ad96-472d-eabd-08de1b564c1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LCiWzQUVWdQPyU9nxsGeytK34hwyrGqkw6+3LAaB65dDv7XyyOr/FF31ult7?=
 =?us-ascii?Q?FvkSI0XD4lSSdf1hefoXjVDBmwJqpqvEIojA2GEQ09lgLF5ovfPIb/ERKaLm?=
 =?us-ascii?Q?Fkc27bPx7iIJs7xtOOYeZaEbLu70eYGjrcaak85N1VgGK/21Ep89aKjSsrD4?=
 =?us-ascii?Q?q6d7VGwttK3S1uwaMxEYI8BVUer07Ae9Klvu4sdGnI2GSrlxvSjB3GUDV5vK?=
 =?us-ascii?Q?DXamFArq19ccRZB+m4B7DTpjnTDfecT5GduZHXKJHXgvpZYDKkvE1oPV4ygb?=
 =?us-ascii?Q?yiuity9HiVA6t8KxFCqWOgDeJ/kePgH2u0VSt7G782/TF2lPvfBHyTakVKNR?=
 =?us-ascii?Q?FOqgHe2qXQ2hektbS0wcJSmTlRM3Ix3tDikGHdZKszEw5neBHcFynUlYKJBm?=
 =?us-ascii?Q?zo/dZ2JO/Sy58ar0Yr1yvQgKfPOAifVPFtDVCsAg52AIHzZp/thmTQIFDQXy?=
 =?us-ascii?Q?TS0m+aJU015aqqYCxXjpbktjoKMlC98tMFq/HcGpm+qtULVhNtHGO6V3D9Y+?=
 =?us-ascii?Q?9TU+GOw6bDnuQikOB4fCPDp52++HQETimUt4y9xZnT/btYomMbZs/Sr7pB1L?=
 =?us-ascii?Q?zbt5Kv1hoHYrGEmU2WQqO7wLIvhP65gQlGShrT9/xXr+sdKV8R0yqsIFANyW?=
 =?us-ascii?Q?91T1O5GWFEti35QA0PcPPUc/E7BXpm3qrvWKXWYr+S3m+r1dv3RYCK6FO7ly?=
 =?us-ascii?Q?CKWReaOpjuGhwMgJxXtyOuFJdng+o3jDFsQtm/WxgT0SKEwoAdDwjqcNp8X0?=
 =?us-ascii?Q?tOj66OZ0nx9O/PGGEVaK6ezdE+jZNVhuSfyWtO8RA6epqXvx7BoUqyuTijCW?=
 =?us-ascii?Q?6Y+p4e5QcihCxwamj6GiMpNfK7jWkiQdybsNINT/Xg1b1F15iS536Ap1pGQj?=
 =?us-ascii?Q?HcFUa6/wJAcv2bpF6ae1sp7EA00vDLL/UIvOmQt9/zGWoLxSgDZ0zT0VsDmm?=
 =?us-ascii?Q?7aMM4P8TkAbzkPUICpVYh3+CxlGFmbH6MluamzW4kRSEYBnEOeF0x4uwGULw?=
 =?us-ascii?Q?gAjRFe2qBBWm5+ZyETDJ8WczzgXj+haHjoyYCBDTgSUKQECTq1//bKpkOvKC?=
 =?us-ascii?Q?YCBsmOxKHT3IWWOIOq4N9+aZigtq/pZ/lkcYbBazItuRwL8iYlskuzgOhQ7W?=
 =?us-ascii?Q?Be9Cj3gpt6VbVCYhfTPDdaIZN1QffIhfFJOKn9O5VcRHCmbIU+6fuPlhSmrZ?=
 =?us-ascii?Q?cmrcQyM/kcSzebGW72MSHiIXFAupzfPUekcyUidsjs+udYfa0JNZVwVXyUXR?=
 =?us-ascii?Q?VVqtDTkwMgIXXHuujhwPyjdSCfur73+GUC5pKQsRUK6fD/IGg1yMgJWHfkE9?=
 =?us-ascii?Q?w2IQX6Mq8btSfxBQgk2cS/QtM0NVClY4/M79Wt0zGAAk5lMDlcqueb/q4Lq1?=
 =?us-ascii?Q?b406RpyKrGoFrISQQu8fi3/ZnBJHT7AMzmuG3OQb5yeZUp+JeLJLMhb4irA1?=
 =?us-ascii?Q?DNTU4fbDShsav+GuACFQZLO1ieBs7Ycg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rNLadgg0Xd36u8m41VIDwZ0oWQ82yDSgnVHN2TH6KTTqBug6gNTgT2/hksWA?=
 =?us-ascii?Q?fOkRsXSQMl/mgI9OE5F53Zwvz3dDwPvHysHKhvK8niAZgTQ4OCJEGj0gpMu8?=
 =?us-ascii?Q?UhUOLWJ2Lfw4exRnvKBikiHjmSl7fjQcUZY6OwshdZ03ZXFXzbjWKyUWUJsP?=
 =?us-ascii?Q?F526TuOkV0QEa5lp7HRF+ZnYJEot73lByz2LecG5/+1dGlzeW/u5Bl9hWFkc?=
 =?us-ascii?Q?BaGUNl1DOmfRyvW2vs+9nVAExtGtPtiGr8R1N3LP9xW3jxLclftH5oYyOZOL?=
 =?us-ascii?Q?rFFiaUDjeuNkixqemgEiK0hsc72FnDtAWLEVwcWfd2h87ABWNR7caT/TgCEB?=
 =?us-ascii?Q?8nCUetLoRoz/dTW/nuNKItnItBajfIFr0Y5kYFM5fVNe+IEZJXYdhV6EdITv?=
 =?us-ascii?Q?aOhInz/tH+L7BDdi2SoJv76G++uoN05tgCbxJfq1TyR1dzYwd5KGz74/5hrD?=
 =?us-ascii?Q?X/9zLkeA6kRQzE3ZpTpQlHF83T8VH6JOyvy95jvhz1G0IjtskLwmKtI+vNCl?=
 =?us-ascii?Q?Jx1Ksiz24utM0iQ+KGWvVeTs8k48JJa7Ro2lCqwJRv2cGkW5H7s91M1Ufbt9?=
 =?us-ascii?Q?89uezvtKd/xmqgoAEJNc8f+lrRdcA+HAFy0tJOag1/HqXVXXnuTqKlGyKnpH?=
 =?us-ascii?Q?YUlENOVcnpff1RKVS67x1IdHPCcKfi40BD8vP/ffWCeSJtnqCYpMVZfV8F5I?=
 =?us-ascii?Q?CQUMlaQrJLMPzkezM53TyswguAaLjn8NJeJ35jhGpyVmY4LSs8lqS+MjHruT?=
 =?us-ascii?Q?qivHCzIx0xIWdPlfpVOETQHiFXXesDBLIeQh7vvVu4dshKENryijgt3KjbUh?=
 =?us-ascii?Q?FvLNTHqlrqiio2xd6KDBCOiY7IDeI1UO8Z+CXLP4gKH2upKzfEPDfTZ3OYq+?=
 =?us-ascii?Q?AeSTNEdUZrAfo2k4SOccF6yyR8MpipF7prVupR2tmsGWMplKSu2DrHuhgGBM?=
 =?us-ascii?Q?eEX145bKqE/FKwEVl+hduzkX+Vj9f9abKYthEMrD6483abDENh4yN32xQmD1?=
 =?us-ascii?Q?H9FwRuKLVgdt4fDSdxNu/BC7zDgf+hswZXpmNGY1A3rlI/CZTucL7raiKPE8?=
 =?us-ascii?Q?OewD8SHDiW24PrGhgDu6x5Kg0MWOOJ1qShilrvvl+FF2RC3ZhJDJotVldU/j?=
 =?us-ascii?Q?Da7eq3BgT+cCFvpTDc7eHLZreScwTW6k88d8cgheGkGOriPF4RkTIiIcoAW4?=
 =?us-ascii?Q?c25TVhRoPV8BQfy/0KsCdxzK12ky8+eSCt0M3vgUwqRlL+dnae6y+qaJOw2p?=
 =?us-ascii?Q?RrvQKJcKze2qD/kzHSsfTsE9N17pdQopkTvLXsm6OomtbjS3HUBfnqVvdVPb?=
 =?us-ascii?Q?iGan2q+L+FrawDeGOKnh+wp55BOZqNml3dqONwlgSf7g1Xbohm816aj3+QiL?=
 =?us-ascii?Q?vmta/Sw/RLwL3M9Dp7doyOxje2EiiTd6ADLdZLUU7ZucbEQvvwPlgfFZIBqC?=
 =?us-ascii?Q?pKtWmrLBmpOhfxuaMNDWx34rRSbnRaIJgOZ/enciJPhELnkcebXF72pw6RwH?=
 =?us-ascii?Q?1l7n6RN8lnQ9u5JyZzZ0Tt7rLwjLcQaK1BMkkfr3ZMaVIF2apEJXD7vpsk6T?=
 =?us-ascii?Q?rqcl6mBO87tGLGt5h+FFWSFm8ELA0b611fYbsuPlgWKPXApEaraf9teUjFja?=
 =?us-ascii?Q?Ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29cf38de-ad96-472d-eabd-08de1b564c1d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 03:57:39.3598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nUl0xwefo/V/EC622AD4OraGEMzWzDEiNJ8D2hnzQGuA8NC2f80aHsxq3kntQoOABQALCHokLkYbVCWqQ1zQBJ8Lcf6rOb8dCa4W5zZDd5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6342
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

On Fri, Oct 31, 2025 at 09:54:10AM -0700, Matthew Brost wrote:
>Stub out the new page fault layer and add kernel documentation. This is
>intended as a replacement for the GT page fault layer, enabling multiple
>producers to hook into a shared page fault consumer interface.
>
>v2:
> - Fix kernel doc typo (checkpatch)
> - Remove comment around GT (Stuart)
> - Add explaination around reclaim (Francois)
> - Add comment around u8 vs enum (Francois)
> - Include engine instance (Stuart)
>v3:
> - Fix XE_PAGEFAULT_TYPE_ATOMIC_ACCESS_VIOLATION kernel doc (Stuart)
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
