Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D82C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 03:15:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76ADD10EC77;
	Wed, 17 Apr 2024 03:15:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y504En3b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30D5D1130BD
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 03:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713323706; x=1744859706;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DMaMqMS9TCeaYO4swdnsA7CIO/QRxBPcHXF7Psp83WI=;
 b=Y504En3b2D/BmrVipfdGH3qfJXr+sUk6iaDQGNQL2BaonI058G5O614X
 VjBBcuiLBFolz7HT9Lo5WfvLdRUJYVelLqJ071s9BN+xXUFGS2TzadTA5
 jzqOiGCT9N8138TDXxZ73pJ3Ff6ookQAabky0lUhKym7gaGbcxtRsH9ey
 +4CvSc+wfrfKXmqJ9rnVOlMTiWiyp0ODDD6enmaWVUsEUfGRZq0FEyQ/z
 dlBeMR/0FPuQlPlWoZstJ+hvedkTEfxUfIlyG1nOfnIEIXyJDXCExVDcV
 eCCyes4Shlwr3fGgJh2Az+tg+LQd5xR7sSbGcviFn1RJT7EUsPPZaNr0c g==;
X-CSE-ConnectionGUID: owICvxGaSviUenpNwu/4dw==
X-CSE-MsgGUID: HR0Bh+U5S2u9g3lY/4C45w==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="12578780"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; d="scan'208";a="12578780"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 20:14:59 -0700
X-CSE-ConnectionGUID: wJrd4e5WQ+CZKDbDl2NCSw==
X-CSE-MsgGUID: kPxYEVtBRYie6hqi5EbHXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; d="scan'208";a="22534388"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 20:14:36 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 20:14:35 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 20:14:35 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 20:14:35 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 20:14:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NU7D14pT1BoskNEV0U4SLS+ea2SusKknYBQ5wrCj5KEdA9mcy8Rph0Q9zlaAhZwwDdHSt2QdjMD3CfOG8djQydUQQMw13fazeJ+DMFu3tTrCn8GWPFf3f/60Y+XdpcFZNAsysAsrHExIn3Is5SklpR8kvnxv6CH0IY9BszMniHBYOsjl7FdskgErOXyiDQaj1/0bTe7QReH454gitS6E66gk3eFcimVh2j9ZPv3IUiQWe2HcSH7Bw21898GD1+yEprRBt1ppvO8QLVVqmbeeraiqt3LiZjTa0/D+J8WQp6wp0LL8pgA8c4ZALlxCt/ZUYlKCYiI2LNYCZIkOYMZ7kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ndhyc5ho5Dlh67bk2833q/0TUgdf9CjnTruQXh4F8G8=;
 b=aMN7vJufhcDKus4T2waPewQublqLT2HekQqDrJjdZejqFMMDm5LXYMDPGGWR/MXm7Hgw5VPfe/qMxg1lanUbMTHBG7d21UOpnVlWsXGcytZKCml0pyCoBgns7DNEIOaaG4RkofvQlwXmxdEZrouQD6LDw5Gak4CRZGH1PXFsVKQZwlTdgL2yC65nbJGwXxH9evVJHk+2/Y/pXxNF8cJ0NWM6cZeMpWovI7/lNZJIKppcTqQv0SDJsDW8u94AVCLqqdfTQqsF1frjmz41+x/ZfnfXgmL8p1s31l+AOJ2D/eFwbwP6kJZeOGh01HcKhfqaYBMKzZyeV+iDzPUnkdUwFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV8PR11MB8509.namprd11.prod.outlook.com (2603:10b6:408:1e6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Wed, 17 Apr
 2024 03:14:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7472.025; Wed, 17 Apr 2024
 03:14:31 +0000
Date: Tue, 16 Apr 2024 22:14:28 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH 5/7] drm/xe: Add helper to capture engine timestamp
Message-ID: <z57tq4ejkkjfo2wsn5dqnf65qmaqt42sgdlquwurv47ikrazwy@ex7tjuv3opbn>
References: <20240416030454.3739862-1-lucas.demarchi@intel.com>
 <20240416030454.3739862-6-lucas.demarchi@intel.com>
 <Zh8CHQe/yx3+j97L@orsosgc001>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Zh8CHQe/yx3+j97L@orsosgc001>
X-ClientProxiedBy: BYAPR07CA0087.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV8PR11MB8509:EE_
X-MS-Office365-Filtering-Correlation-Id: 2df22909-08ea-4d9b-e4fb-08dc5e8c7f9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZiqwlUUcE2HG/IfH9gtc5VGWCjvexTEVDOuKTcAsUr+uoHpxWodlg09VOGNaCPh5mAMeCsFkl+dSwIvumV1FoVeb42O9Pl5V/taa8E2IJ+5LM0rNI7P2zq6eSbgE9iHVaAmqfANnVtSCqjbzH7mQCfIEDr+fsvbZLgFXx8TuR5lC9MthXUR/IIchAq8x8TmMZhLpb4XijxJpJ+dtTW0/6VEecMrP0mM4QlJP1dzTIr/8ygVA4FYN15G18M/pvR0nwofI1g/n2LbolmM0Y/sEu3bgyu5EEPF56jAh+L8h0YKHH0PKrEulq1JKWJUhaD66MddNMmVo8ciS1B+T+pqeyBTOznYQ9wg49snGg1JLtnspldrFrDtZH7y2BcsPZyBP4BHXcKpGkglLQfvNmuOtdfm3Iz+qNyL2zn+/x4mg31jYvwsZviraqzsvvIVPsSl/n/sOav6zHQY8/RNg2bU2+ly7EIvanS4HuLB1+NWyeqo+R83TpTeifjwz+/UjsDjesY9w7b194fTs5T+dGGder0n/c+CsmVJy9YLW1ViK+4YCfj3CHUvgDwYw9lWm7gfrTz4HHE05NXexMVdkPPVs+PlU1yvaH9Tqe7+zERvFYaBFNUd9+PCXPFxmqBNebP5fXQFCNETke2gN4bOVUF30IS+D8dhk2DbcEM/gQTAvT4c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NsoWhN8mFJmjW90Lo6TSDoJDymn/48n/CVrm1iJT+ocW/P7a3939HBbtDTbY?=
 =?us-ascii?Q?jF0Cj3cJKdoLanwAiwe2AzyHbViMWDjowBoV6RJlZkaIi+2Wn/UyhVPzIu0O?=
 =?us-ascii?Q?Q674oJguX6wUdqmrsshqvXCd9od/dnud7q6xahjoienTM7+y2efqQbMCMvwn?=
 =?us-ascii?Q?vc8hRSL+zztVCGO81jRk/JsHyq9OP9S9uqGObv0kn6QXLAmlbl2T6bvCNR/L?=
 =?us-ascii?Q?IWzE5GWXIdWK9vitAcfML+h58ioODGSJz+d8tHSjudSb2688EwQac5OMf8yq?=
 =?us-ascii?Q?9Ei+JKVHNciz68ssLDVRN5e388w7JxK94vlKYMTG2av+fDLtsjK5s4YdXVTQ?=
 =?us-ascii?Q?ouDF1uq4pS9l6cKOuSVG/rtrrSwlATUX/k9xKd1Ow4srHdNYRVv/80sHfYHA?=
 =?us-ascii?Q?Dz8R8pWwiiWd3PSgHZh8auHo2IhuW/5buUQstxt0BJpI+80UQSbCK/fK6IGf?=
 =?us-ascii?Q?TZncyHgMM/LTHNeyNRxRzMrCOLNnOfIYbGc3g5MM2N8hHydViaTIENfPJELp?=
 =?us-ascii?Q?WW5mouN44A0r/jxY3Yvj4qRBxWNjVi2DAvdvLgCssxwbXl+38orLuWDRBGG4?=
 =?us-ascii?Q?zv4sCkkLMB3WczEnPBYnlXjspo0DwgqpDncW9aagCLO81OdEuAu4Xk30+xTw?=
 =?us-ascii?Q?LKUtXh7OQtRudgeJRPuBBbPS0e+LYAppq/534+ZS/Ro9mO/S/iJvWhrP8j6P?=
 =?us-ascii?Q?JQDrt6s0bB8HcAmI5b28fA+XYbjFIUwHSeokrKgQ5QzrDGGTGFhQvlwaFltB?=
 =?us-ascii?Q?2402m/G8/dyJ+gPLovowiSBWOWEIJPHqS3rlf1UPIbr1O5CyAXpYdGctA1Ny?=
 =?us-ascii?Q?Oc8feQw6yDv4W6E5pz9NK95RDLTZBO547ZcwT9ZZI2njzd5SWB+6ysL9d7jI?=
 =?us-ascii?Q?4gAexxqH5IkrEbQCVsODlQJnCQQICedLy0M5XgkT8GbY3PxHnyIpxKUKB1/e?=
 =?us-ascii?Q?JJjMtCMwUAXrryBzXFJ6a1gq6ui+2sdJ/yAkUwV4z1G23kNQyWKpDLZv9mdz?=
 =?us-ascii?Q?bh0K6xsDUxAic6PjgQMtTa8broEUGjDN0h9tmLtv3/82VYG4fN7WY0qcgtQg?=
 =?us-ascii?Q?BgToH9nGSJjJCpv8wujAJ0Vj0A5Oqo9Y21+HYTKnnUY073XyZnV0Ecq0zSGE?=
 =?us-ascii?Q?eaqCzQXkrSJtxehWvaWoZmu59BlblDwrtryw9G+JASI2B33rcSsDNuczQaB2?=
 =?us-ascii?Q?JuSROrJa/iQ20Fi9+5EzOj/akc+6h35sI9UJuH6VYL6CfwwA8HJh36fQg123?=
 =?us-ascii?Q?WNz5U0bIDeQVB7bSaovlyJaJCCt4dKybQUBggr92Qh5bbaizM9nmQ6Vt48ZQ?=
 =?us-ascii?Q?gvzEOUbkHs9bu5Na6BkrRveHrvBgxwk6wk6gSpTTwlwCOquP1SU9oPlP2ttN?=
 =?us-ascii?Q?ug6gyLAHZUHw7kejV2qzSfTaaal9mZduvi9iWMErHe88uR3FC0fB2Qo/Mp/B?=
 =?us-ascii?Q?hER/sWdz3q88c7dzhMvNmWUI1WgNhsyhdYIWaFb0GKh8Wo0PgJsZtzAzxHbh?=
 =?us-ascii?Q?d4cvipqJHEXhhyw7uce1gYVSjenSGg2RvzUsfmTJ5Zx7TdN/ElUzxDOQKYfR?=
 =?us-ascii?Q?0l3ysfOQ+RJXrYmFL7+S1D8W3f+W+YFzNTb8PkE5IGOiJ5lyKggL6hDTEhGE?=
 =?us-ascii?Q?rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2df22909-08ea-4d9b-e4fb-08dc5e8c7f9a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 03:14:31.0339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A5SR1ONtRoCJ/PY5QG7sYrlciRceGa9Mx4ILE4QmcxEZWZCFJHodNB/P/F3GkqHVOnaswYe+cuK0Yicnt/rut3gptMTuH6pxF2ozK8oIof0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8509
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

On Tue, Apr 16, 2024 at 03:56:29PM GMT, Umesh Nerlige Ramappa wrote:
>On Mon, Apr 15, 2024 at 08:04:52PM -0700, Lucas De Marchi wrote:
>>Just like CTX_TIMESTAMP is used to calculate runtime, add a helper to
>>get the timestamp for the engine so it can be used to calculate the
>>"engine time" with the same unit as the runtime is recorded.
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>
>>---
>>drivers/gpu/drm/xe/xe_hw_engine.c | 7 +++++++
>>drivers/gpu/drm/xe/xe_hw_engine.h | 2 ++
>> files changed, 9 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>>index ab227fa8984a..528b271c9f23 100644
>>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>>@@ -981,3 +981,10 @@ const char *xe_hw_engine_class_to_str(enum xe_engine_class class)
>>
>>	return NULL;
>>}
>>+
>>+u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe)
>>+{
>>+	struct xe_reg reg = RING_TIMESTAMP(hwe->mmio_base);
>>+
>>+	return xe_mmio_read64_2x32(hwe->gt, reg);

given the past issues with reading 64b registers, I'm wondering if we
shouldn't export a xe_hw_engine_read_timestamp32 and use just the lower
part. Since the CTX_TIMESTAMP will wrap around first, just using 32b
for RING_TIMESTAMP should be sufficient.

Lucas De Marchi
