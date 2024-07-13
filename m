Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB65C3DA42
	for <intel-xe@archiver.kernel.org>; Sat, 13 Jul 2024 13:55:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5997D10E10B;
	Sat, 13 Jul 2024 13:55:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Adn8afhv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 835F710E10B
 for <intel-xe@lists.freedesktop.org>; Sat, 13 Jul 2024 13:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720878939; x=1752414939;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZuErRaUCWawCkNvDuc4Px3nKr6kdiNzWvc/yI4pz1NE=;
 b=Adn8afhvS1unMh7vjihGvNRhD1HOnWsmJ96ePVJYog4/FkI31fos0Eny
 CCveshGwJX6ihM9MiPxfhNmtDVh3n+JpduBrbwt5JghKog2aZr7TeqqmT
 QtLn3M2xwktpD/bCBK+x+WyHH8uEKi3SWM9cKH3NX6CycdEwysuUIg6mY
 JI7CQ8+bIGjBWnxcubdSLa2R7ILOkzPrfOdGZLZsqyFgWNdpGDq1tbcnB
 ldY73wQbYSOVjjedetkXSNl1dvrxJgmgn1iFkl91uH6qeNFdukeXB+ReP
 Oio4l+pGK0K/oI5ZnMYU6fK4sfHHJJb+WOrZ5OFbSZThAzv7/ZIfERuIr A==;
X-CSE-ConnectionGUID: 7GtSGrsyS+aWokrZ9IO8Gw==
X-CSE-MsgGUID: bk+gm5d1T++c9aAJdbTkZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="35742445"
X-IronPort-AV: E=Sophos;i="6.09,206,1716274800"; d="scan'208";a="35742445"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2024 06:55:39 -0700
X-CSE-ConnectionGUID: oV+b9StaSu2Bf8ujH8rg6A==
X-CSE-MsgGUID: dPphsLxYRWifQviU0Q9eZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,206,1716274800"; d="scan'208";a="48908432"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jul 2024 06:55:38 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 13 Jul 2024 06:55:38 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 13 Jul 2024 06:55:37 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 13 Jul 2024 06:55:37 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 13 Jul 2024 06:55:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AmnAuShVMO2V1RpUF/1rmTawdSJcMPXEExlMX+khJVb8j/1DQ6arXO3ftoME/IQ0fDWKxY19pgzlF20xy2ibfxLIwBVsm7SrRqSOOyn6NcPyVerTMJTIfiqVVMQcRUr3iEc6w/Dd0BwJk/Zo/FGGBSbrut9R/ClfAoc2YIhux9rJsgfncF/H+oh5LOflu632Hacj5oxn20PMXDtB5tlxUHsd2Ub/LM4jM6fI8YVa2EdaEJ282VXxU/hYMIjwAanZIz+gJC9QVws4cTBgbaQFl0Gw4wfAaoBXBS40+xe57rzBUrwjTkapaRKvlwCEZDp9/gGZ8Pj18sx02boGWqe9zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v2XiaiCMb8YTpBhaYES29r6DZPA0dPKJ95+fqIbwXUA=;
 b=V3hO30kAgLtPhlwNSX0IF+iJ1rzuEFPpbbfOBPwx7/1LFW2ES7offP3qbjV/n5OU5TcQr/B2d5Yqq9cm1RPxQsTEq+tdcSb32BPp9joJQXBLKyinssuFvzivsPHEn30PTvBogdfaFs1QRz6wa5BUnUZPvG/KgcSwe9SDNnn/IkA5Srbq5lU/e130Jjz+Hqo9UFeMu++Zkh+rCFv3NTX+809puDH/DZLY0OmL4D9VIyFPRwOEhRgH1K5+0lIRclx6xvLhoAhNm+G588Np3i/5shQwlblzJ8SU8kWYXkFZwtRpnqJ/F2lRFVn1XQY45/7aAPH8t/8g2EtoJghH4F5mZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB6147.namprd11.prod.outlook.com (2603:10b6:208:3ed::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.24; Sat, 13 Jul
 2024 13:55:35 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7762.020; Sat, 13 Jul 2024
 13:55:35 +0000
Date: Sat, 13 Jul 2024 08:55:31 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.d.roper@intel.com>,
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [RFC PATCH 2/2] drm/xe/uapi: Expose wmtp as engine capability
Message-ID: <4saec24oxsqk46oq4l2ihygqzllvp7ie2awvh3gwbrfld2aao2@2vf4kjlgedzh>
References: <20240203060534.6839-1-nirmoy.das@intel.com>
 <20240203060534.6839-2-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240203060534.6839-2-nirmoy.das@intel.com>
X-ClientProxiedBy: MW4PR03CA0344.namprd03.prod.outlook.com
 (2603:10b6:303:dc::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB6147:EE_
X-MS-Office365-Filtering-Correlation-Id: b5ea1e3b-5076-4884-a98d-08dca34377d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zAtYFUt8s7t9Sjn3zgezJbyJJ6R9PatxmwYHPDhV5+EVm5cf6ObsG9rJScgp?=
 =?us-ascii?Q?4ytWxR+z54TY+m21QUZw9WbzJF1vuu+qLMBCIfpq1Micj4Vd4crA9kU5mJ9i?=
 =?us-ascii?Q?UivGutHYQlD9GJpf7kgBYkzs/EvXSpSsGkC2D9ctFvpGAgFk/5pLrh1aZDB2?=
 =?us-ascii?Q?8ibCY2MureJhe/xQWHv4X4Kj7IrU0BsFdJlN/klqKD0Sw84pKZ9h4rArKoKv?=
 =?us-ascii?Q?i6s7GBAm9llOjcHysccS+MncFh1LTu8rTb4Y4UbgG/Pl83g4DjqJV1NDGwg0?=
 =?us-ascii?Q?mo6SZN5PmR7DxyJl8DxhCflif6BTvkGkjsdxleMxtSLuPMZD+9i8vQNrn4Eg?=
 =?us-ascii?Q?kz8Gvza10r5sfRfSYWRkansxYqEZch9K0bVFYjZyj3vj874sarFLAjSCLGmH?=
 =?us-ascii?Q?8Wa9YwUR2AH7YdBEMlg4jK6mtSPU6BeMeMincvfa1JHkHjvj2CEbBEV7HvBN?=
 =?us-ascii?Q?A1XFVkJoLrVeu07PQybQ0InsbONhKzvbCJr7oSxiNTrSAc1CJEFrEFJuVzVW?=
 =?us-ascii?Q?DmWRhgYeJ8/4a/25gZrFUsYz6qIh9K05CfGClQO3i6HdQi2pAVXFyyyGcE47?=
 =?us-ascii?Q?XqSSYTwVsYbavzgxhLAj41Aa29+rlqANA4s47LRRayxpdC+7ttyg/Fljr9ib?=
 =?us-ascii?Q?X0TjLZCxA4OpDcNub8dC2IZmBBDDg/egIBe9fNAozk1pgtSlYHQ4r8tkGl6+?=
 =?us-ascii?Q?4gC/htB/GrbJElIa6YwyUOVCSNgBerxe9KKHAhSM3pEwi/u7hTAfmtOKQEVS?=
 =?us-ascii?Q?M3b+iYEpgOtC9NAGr/KaO+3Tc9WIWXVBGqWz4w5+ngFupHCTq8oDdtNoUxFT?=
 =?us-ascii?Q?d6qNtVeOhOpbDnJIfZI5L+aYUhiKDXsKh1HFsQRlxDZFCyq7tn4vCXQeaUHI?=
 =?us-ascii?Q?A+j+pS6plYpxK3KyXxug6otaIfHgvnO1/yFOynegMHGSnAetC/9M62leBb1x?=
 =?us-ascii?Q?qtAPnIT+Svzvbw9Z/Fy2NpfB+FDpAwdoTtZNynO5DWprX7OT2LzRJNsKjbGa?=
 =?us-ascii?Q?bQu8yEx+WMS56lo0fnUy4bsd2cNU0QhCd4LhoLTqZh9P/7iUGpLEo1udzqHO?=
 =?us-ascii?Q?Ciysn4QCc3zNAr+piopZn89Wo4Y3+lkXRa4Yoa5ycQ/sCHpob0lIXwD15sKW?=
 =?us-ascii?Q?dIsekRExZ/0mYcSTRLV18jorllk5dw43whl1EYT4wStEtnerDos/sRLjNqFm?=
 =?us-ascii?Q?9AKj6+T2zEwu+CU8m9MEl9FcajEXA9leVD+In9mGr7t+a5oQFpW84yG7WshJ?=
 =?us-ascii?Q?fnpq3JAw+fnNIChtcs9FuZWF6m+IfM0ACHVnXkjctXp/QWuymNh5xHm4N0XW?=
 =?us-ascii?Q?Yh4DFxl6IJwR/2vKda/KIYBJK2fl5Yst4nMXotzFL5MGcQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GjmLYWI3/KvxeJwSgjVxGsoeL2hsLogGgMaFzOsEbUXLKqUT8CweZ2JkPuJq?=
 =?us-ascii?Q?fjguti4LSub5WBz3/WAb9LKGl8WVZcSkiFDawkm5L76zRe9RQb0qBMD6cSwp?=
 =?us-ascii?Q?9/B6bL6gnyHaeDbbXbfOou4FRavHYw90thpnhGRR2XF/w3gLs8fY0HIc98wA?=
 =?us-ascii?Q?5LxUPWrPrck+BtWdcly2d3PHUADR5GKRYaCkfjpxwo9HoxaOG3rsCNEznaXN?=
 =?us-ascii?Q?6/B/0Slz2+Kje807/XyCTHQ4T36OlgXOx6RkqQKvq/TUiFibdLrWciXKWdPS?=
 =?us-ascii?Q?xleWIscq3l6mWAj/tJf1/SdUBliuK7zsDav4tLsQLLNiWAGGBQvvZSkImM+d?=
 =?us-ascii?Q?DirS/shcpNX9UmjUcQctyg6iu7qwjgljGXD/hd46bj+npOKdD8uZNlFu7rnx?=
 =?us-ascii?Q?ylFEuglASgE/wjbGSg2yxwrtxt3SQViYFZ1ZWO0GZhHQIfqgKj5lGB1fBOHq?=
 =?us-ascii?Q?PdFXZMQicIusctEczzUw4UzBcVhl+/0jq0cXCLbFeVkDJbZeCltwt4pK8eUv?=
 =?us-ascii?Q?7E6aUK9zlymISELsZG/hVNyDLeGpHrAWDo8KeAbTw+kNKIPLwd8rmWtN5DqP?=
 =?us-ascii?Q?6wMQKoes7NqBq30CNrmiz/GZfY3aWohwOuO8NSQM0O1M26RLBAFzdpMOZdQm?=
 =?us-ascii?Q?2Kr/53Z6thWegpeDgZLjlRsT46VTBXaLoCuVtHL9xcMVrOTCdKb3gOgIMzIV?=
 =?us-ascii?Q?hJx90r/FhAL2/MPuFCW3AsTH1i1yO4L/sjQRfhPjyuGBjOmNZctEPT51HRfT?=
 =?us-ascii?Q?Uhc5Aj07S41Fyr+s6VJ8b5JnPeeA7E67jMy+xEzDsap6PpyJpHdTToZqwhhz?=
 =?us-ascii?Q?tOaLk3YqIZ9OdWOPzjCHSNoS8OHUBEiRYZWJvMH5kvu3tfsU10tclcTRSprl?=
 =?us-ascii?Q?jryQrG4797aNWRJSVgMtAyZUO/VIxuIFJMdnYN6dGxNImH5fVKBlZeuffjTc?=
 =?us-ascii?Q?RrYEkfnrrlXXHjNEntoMaaMDW1rjTRlep3IPmdZt4kkFLmt/LMjCqtJwhrM1?=
 =?us-ascii?Q?eV0nW//oSRu9xbUogPvtb/5XEN23S5QpearqxrPiZlcy084jO4M1sU4WCnHL?=
 =?us-ascii?Q?k7NEH9DLZmcZz/zm9FYUlRDlVQ7b1/JWIuBEbbeVmZHSvvOUjkPKsCLJLaXg?=
 =?us-ascii?Q?04e14E7OA4d/nLLs6HbmZz5/wskWhyerOavlXubh/wPjBe1jYCm9Mz/R7x73?=
 =?us-ascii?Q?AjUtM/P62czkC3j/SWhx7Filq2OI1Mta1KTCq+J7INAmacLkmHBYJTzfcj3A?=
 =?us-ascii?Q?qtbQxWJtRiAIvBZUzW6h5tXcV3jj3d84Xg9tyXxtM+xkTfrx4GXBEdCXLomv?=
 =?us-ascii?Q?LwzVJfQWBo67ratp6VGo+i7aXkwQceBjxxDoGDAdKA6uEwJNooLahTNK88bZ?=
 =?us-ascii?Q?4NQnSr7bdvzOkZiucx0tMEUJIb1bOIb1UN/WaNvrk9zvkHRd0SF5Eeq2SCF1?=
 =?us-ascii?Q?u/XI4+/mvpNuFtBBlK/F8zC7qRVHhd8tJSCd9k2QetPpGj4OCPwnxtKYXRfV?=
 =?us-ascii?Q?+9DUfcr/69xkQizhDXGgDGHJmF3mJgcsvkXitn2+LgJ/t5m+Pk9uCP8Luc5z?=
 =?us-ascii?Q?oL8gf7h+QdWrMpPoRGrKdyYvYR/ALazKqDeLQn3XHlsRWY0asHE+nQvM4/8W?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5ea1e3b-5076-4884-a98d-08dca34377d2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2024 13:55:35.1392 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uXkEZ0G5QvwmodE4Y01Ao9pcZ5FdF15Li2X2adcHKMur2U0QEHobTaCtjMdYTDCE3Zpob2+Dx5QLSYACGIzljj89LVPaNrYJ8GrS3csFblQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6147
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

On Sat, Feb 03, 2024 at 07:05:34AM GMT, Nirmoy Das wrote:
>Add capabilities to engine struct which can be used to
>expose various capabilities of each engines.
>
>Add wmtp as engine capability which is retrieve from
>GT info.
>
>Take a field from the reserved for that purpose.
>
>Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>---
> drivers/gpu/drm/xe/xe_query.c | 5 +++++
> include/uapi/drm/xe_drm.h     | 6 ++++--
> 2 files changed, 9 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>index 7e924faeeea0..10981b46c56f 100644
>--- a/drivers/gpu/drm/xe/xe_query.c
>+++ b/drivers/gpu/drm/xe/xe_query.c
>@@ -215,6 +215,11 @@ static int query_engines(struct xe_device *xe,
> 			engines->engines[i].instance.pad = 0;
> 			memset(engines->engines[i].reserved, 0,
> 			       sizeof(engines->engines[i].reserved));
>+			if (gt->info.has_wmtp &&
>+			    (hwe->class == XE_ENGINE_CLASS_COMPUTE ||
>+			     hwe->class == XE_ENGINE_CLASS_RENDER))
>+				engines->engines[i].capabilities |=
>+					DRM_XE_ENGINE_CAPABILITY_WMTP;
>
> 			i++;
> 		}
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 50bbea0992d9..5dac079e64de 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -247,9 +247,11 @@ struct drm_xe_engine_class_instance {
> struct drm_xe_engine {
> 	/** @instance: The @drm_xe_engine_class_instance */
> 	struct drm_xe_engine_class_instance instance;
>-
>+#define DRM_XE_ENGINE_CAPABILITY_WMTP		BIT(0)
>+	/** @capabilities: Capabilities of this engine. */
>+	__u64 capabilities;

isn't u64 a lot for this?  maybe make it u32 and add a u32 reserved?

i915 for example reserved 64b but still only uses 2 bits.

Lucas De Marchi

> 	/** @reserved: Reserved */
>-	__u64 reserved[3];
>+	__u64 reserved[2];
> };
>
> /**
>-- 
>2.42.0
>
