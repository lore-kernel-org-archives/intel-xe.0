Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E992DC52D70
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 20:42:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7032010E3FD;
	Tue,  6 Aug 2024 20:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GhAzZmbo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6933210E3FD
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Aug 2024 20:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722976978; x=1754512978;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=AcvpMa3jqsc9BJdAp0HqllgDxR5a4e1an6ko43cDyS0=;
 b=GhAzZmbos6HxnQxCHDLVSGLky23e6rn+HHtKsxyMdhabnzKXqzbnEI5+
 1o9bV4GFYsQxKaDhFikPVqbUot4jtUXbwWGKFLOYgbiUwTBQ64pXOTgNW
 sFWx3jrZv3R2f9ysDUXkF6yVhttl+B4aWsiJOPt787kYSxUOFnU/8m0ok
 WNvbhwmO1C93us5lBMLH7OhAWcBLMN+h5kmCCBNRYFfE7zTGv03h6n1j8
 OKXlzsKJb8PdSqroNOptyq5dLfs6XygKE8vfYbT5+8D05gG/LurQPQhQc
 JK0XhnDQdt1UYdYRXEh5QiiqqX6FSYl/qZ+IFOE9aaoqt6O7+/2eAm23+ g==;
X-CSE-ConnectionGUID: 8pe16XJXSR+fJE+rPcfSnQ==
X-CSE-MsgGUID: KDwYNgh9R46CxpHP5EQrrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="46421920"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="46421920"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 13:42:57 -0700
X-CSE-ConnectionGUID: c5knQ8liTUm7F7Mjs5KLfw==
X-CSE-MsgGUID: 91xR70METJSB04vUXbCx4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="56563539"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Aug 2024 13:42:57 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 6 Aug 2024 13:42:56 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 6 Aug 2024 13:42:56 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 6 Aug 2024 13:42:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pZ/wA9+qxbNgmjyIh1vvD21lNG2gBbdnJIUAKWC7VEvHUk33ntZCDyMV6Z1Bl4Ngg6hYsWh6697uDxNpvH9KeUFdS9VuNOP7SHe2sUt8YYes5Svkkk+pCOfObQ+fwlliQMv8j5QODf7PJITX8YtKPik9YeUyiG421JtYiyBEUSH99PZnIscCluLx1FfmRxavvx7eCfZvAvqruZFRLU9T/Oj0jO8vOBpnrWgSRyqYEctgzdvJqzZb7gxSdE9vuu1ZCP8c8xTXH60Y3ApxPXFyD/qHRxsKx+Jbep7ifP26fDsfW3UlCnhKGy8IG63gsyxmSUZaBUmpBUdc4qq9TN3w1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/s0gl+zNPrxpUuY5J12VDyxwdHGGh1zoL+pZyEbxTdg=;
 b=RDn3sseggkI5KsAXUcKZBiE8NjzK7IlKT0HjjkAwCfsgnqp5WLwi2wgt0PpmAvv4HGl4O9o4lLkkQFlmNMwBkifAEUQ7Hnn3Yktqw4Vz/NVVMsvstHqyDlPxb2B4s1w8cGvNw5WnmljUzjBLj+zxQ2ChZghXjw8XOa67qVu2q5eoYxf5LI7ei5FG/hIDTFpGJuVutq1ZZCk1tDxbW9caBx5g1gsQnhlZAGLt4l1c2Qw3ank4S0ZYzoJ2+rmeizwCtK8/uGC/qr0pioL8p8QQUukel5EBqMrCQNB2NBxfok/0TMO9J9mvhVG5eoECMtXsFkWZZfdonewvju/QxVwBBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB6928.namprd11.prod.outlook.com (2603:10b6:510:224::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.24; Tue, 6 Aug
 2024 20:42:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 20:42:53 +0000
Date: Tue, 6 Aug 2024 20:41:39 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Dominik Grzegorzek
 <dominik.grzegorzek@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Add kernel doc for xe_hw_engine_lookup
Message-ID: <ZrKKg2YgOWqDbcmn@DUT025-TGLU.fm.intel.com>
References: <20240806153009.1081382-1-mika.kuoppala@linux.intel.com>
 <20240806153009.1081382-2-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240806153009.1081382-2-mika.kuoppala@linux.intel.com>
X-ClientProxiedBy: BY3PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB6928:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c9afad2-202b-41d9-29bb-08dcb658582a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?wf+1wRVY/8Bs3JkeawEcC43GpgJSsRPUqYH+UjGkfQ93kakcIaOo+1zRWb?=
 =?iso-8859-1?Q?337V7fZXr+QQhSuLcO4Rcza2skQBLKHVtSsYQbNt7XiEADujwPnU5fsO8H?=
 =?iso-8859-1?Q?XOM5dSLeXPiBos87+L7ENDAd9YuHuvZ3Q4YqN+1JppLrcXNZbE2Zo7SFrZ?=
 =?iso-8859-1?Q?P/e483JtiraOmcrnYmvVFwnll0K0sXlSsKes51t2NIYJbmNXEhuXyDtlFp?=
 =?iso-8859-1?Q?aa37vtTCUwhem3v5qh8OWDDYhyqrHQyyu5aBSV88MaK1x11xhlRk9U0Zsw?=
 =?iso-8859-1?Q?x6zffr7rSqoImsaCLwtdd9UrazXWyvvYHAx0iRzuv3oXyMbetlkn79CDOO?=
 =?iso-8859-1?Q?cP0Fkx6uA/bY6Lv0f72pA+o97cha8X1Cy2u0Xp8t2D/BxMjD5zXlq9px5o?=
 =?iso-8859-1?Q?x2vx5Gr/q+5C2z7TeKnxaZFxATO/ny2bXWlV1Ux0hGWJMqdWKQ+tbwHNbZ?=
 =?iso-8859-1?Q?yswZ2rbqYAFhWaPqH6xiLx8NOm5habZ2xv3aDHYJ9FVdJ8ViZeETv/LVXa?=
 =?iso-8859-1?Q?xiyaeozhgZf3WoNrGmLc4X8Glddn2Q9V56HdqopuMOB+Qbeifhuln9qfNB?=
 =?iso-8859-1?Q?CLPvbBd78mPblWDbTnTkjIDLrt5GERwlJQiw5u9cb4gElKSfBeij573BiP?=
 =?iso-8859-1?Q?MlUJ0EK3xwdK31WWn6xImZqh84N82MOKYNRXI4Esao+ugUI9r1xYvkAU7s?=
 =?iso-8859-1?Q?ih+va+oZl4bFZ71hVAJrXi5SiyltXBkYnqA9Hr7M64wBBCv2NK9tyG+QQD?=
 =?iso-8859-1?Q?82lgDGwoyTy5Vm03KGuEaSV5k6GYs203os7NeaYkNONWiO7NF5JbZV8V3v?=
 =?iso-8859-1?Q?1XsnWxvngulTxCbeGCnkoxEiW/tT4BjTicm6EFUvVopBoIafLD2OgAVtsy?=
 =?iso-8859-1?Q?fC4Gxsi6J7t+fADx2OWambJwNOJkEPORDwOnTFx2e6T1mhzMetGrO3cv+a?=
 =?iso-8859-1?Q?d+VRUgdN92edl+rm2Qe4i+GQqySWocMbi9M7JQpEksPHxzDZJjK5vyumFW?=
 =?iso-8859-1?Q?N0MP7TOJP32piXCLC0K+ApMEO6zwiV12nHd+YFZFMlsUx+d5fxnfTz4Io3?=
 =?iso-8859-1?Q?ED/wPj5uPacb3vbgzpGFi4sOEFt1tQu7xVrYluSSHPsGRjfkn7LT7qFXNH?=
 =?iso-8859-1?Q?+MhKtsAp+RITzG3BTKzKeOCnzTq+gxqg8AuhkMr82b1luOVJR1IMN3fRxR?=
 =?iso-8859-1?Q?8a23egu+gdqMcI+beWimjkCElPOyQKuxsrkRP3OjA2hnmx09nhNNlNMySc?=
 =?iso-8859-1?Q?a0mLwJKL4OsGgsLaOCkUcnsD7htG9t+ie1khe4vR7XYyPtqAWlpND56ALV?=
 =?iso-8859-1?Q?FEMiZxKM+JUOVeB06RsHWF3ucInTl0M9gzx8rcIPkeB/jUOSo6jK4h45lq?=
 =?iso-8859-1?Q?m4U8gcfZtGg4f7S5J5VuWBCY4uK8gD2w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qWptDoVd8jfpoUnLr8C1dvxpsUimdgBMEa2zdpNhia8qqvhmp3e560PyPu?=
 =?iso-8859-1?Q?5ZgTGu9GGn1tSxXGe+0iUgYLiFWFMt3HnJ58/14UL75pIFTJk6p7I189vf?=
 =?iso-8859-1?Q?83QVymoa5xZUP5G2RNka7acGlD+K7KECmAuTZXECZmznOM6n6BE9JDVt7E?=
 =?iso-8859-1?Q?pnJbI7xsWVw8gZver2kuEqY0HqCD3RVaadP8BC3I7PX0lOFYrZ6T6Yj7R4?=
 =?iso-8859-1?Q?ev2jYaRjVP/y/mIEV3VrLUfEdd8FQ6MiB7zbMzIEnRlABkTk8QryIU4JPr?=
 =?iso-8859-1?Q?tGTR46GJzdIjvLjckkCj9lFIFw8tU0IcoSW46hjxEOmfn8hBR//csMn/2p?=
 =?iso-8859-1?Q?fRM6CrsDsIiPDzjkF8wNmM+tIEXF04m/zTDbVpB4vBtag+CwlLYCsiE2+W?=
 =?iso-8859-1?Q?1QSrgKn6aVJbzKQMmnORBPKZ1vt21kYqkDqdEJeWd0Olt5uSc/dSf0ywoJ?=
 =?iso-8859-1?Q?zzKizSMpKvzYcAvWDnPXSYnt2ljupHjG06oX+Co+vQhNhXGPh/yM03Z4W1?=
 =?iso-8859-1?Q?zltx2l8A8iomqDkaw8AbRi2coEW2rXZycUYR10G4JHODxdcGlsNZy95hTQ?=
 =?iso-8859-1?Q?ACm9BDxcWMgtkak1IBmN9ddsLtDc7eP5HTD9nqUWQuF6SZo6erqBYSPDvQ?=
 =?iso-8859-1?Q?JtD2JvLzGXzkjxFYC/HYxsKUsEEk7pndn2XlGGMfC4Xvbs/TTylnSdxhpd?=
 =?iso-8859-1?Q?EOJD7QWY4TxksbODkP/QF8010ICy3GIv1mWYMRA8xVKmujVJteosOAd+hx?=
 =?iso-8859-1?Q?TzaujFaFCC+UqTHkddeo1Ie5UtW+XoAqVe6141atpeEXHOcn1yCjCcGCYe?=
 =?iso-8859-1?Q?rpNfhTgL7m4q2b9sgPas730/TXKJcij4ur4jF058ng+a0iUN4wToGF2zMN?=
 =?iso-8859-1?Q?R0Po8X0iJKMP/gZuy36AQJGtomce4cnTm4N/OACacudi4Au7j0ouWukrkG?=
 =?iso-8859-1?Q?CQFrCrpURYPBV1GgVaxuIm3/YStdTLjA0F0qZxgB7/mPXFVw8qBk28By8k?=
 =?iso-8859-1?Q?d4xrxghA2lUX8oIz7sIIM/pb4BsApOA8OpIxpdwcHuvPksHWhj/2AK/jTa?=
 =?iso-8859-1?Q?t17yy+9899EjiKveUkjqONPo8sft3NMVVtS+q1GjyFSNdXg6i0kyLzTdVZ?=
 =?iso-8859-1?Q?TvJ/Rz6xNLb7NaUu01ATEJlWdFRTgwzG9W4myOtUIpaIwEAH2BZSCCp+nn?=
 =?iso-8859-1?Q?I0OeDTlRFYBjii1hBBToB/qB9Qfi9znbePc0BSgoOU0Mwpumvh8mPavvKN?=
 =?iso-8859-1?Q?WFWkYrzycoQJAIrVG1RzPkDC3RJo7TEw59XPTDq/ZUaa7tHkXOFvtb+z7s?=
 =?iso-8859-1?Q?YE2wKDZh7XMOigBrfDTYdYpAPctELxFuKMyuJMnI0mkmUyioXXtXXbGAEf?=
 =?iso-8859-1?Q?sVlUKtZg/wtee6YCCdltJtSgRNYnmC8JaoTKF4Y2iDRHjmQAYHAGqLNmEV?=
 =?iso-8859-1?Q?Ujoi2SLCCQt/BkX3wXZ+sYMoeOHcy1pKEhSkJNH/TdGZqqjyvGT3vcvO6s?=
 =?iso-8859-1?Q?NGnMWYzWpeC/vmMdCNczLUB/2+qY5AzQyFeRyiNkCn5yMCpCT8wgn4kiYY?=
 =?iso-8859-1?Q?7dobvp5ZR55AExxX/GZD2SfKsymRJctzGcccmM9jwsNcWeNOKYPNynJOEW?=
 =?iso-8859-1?Q?OUW/+h8R9vOrLAoDWX5KaGIzAVxcCcFowsGF7HFet70T8TAi9b31eGLQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c9afad2-202b-41d9-29bb-08dcb658582a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 20:42:53.3064 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UUy+aYE03sBT1dbzdvihfe7XLPoNo+pj7gg8bAqhTM0U1WkYdMt6qFL7baHpIUN26TzzptvwDYdpPt6d6okTCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6928
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

On Tue, Aug 06, 2024 at 06:30:09PM +0300, Mika Kuoppala wrote:
> kerneldoc was missing from earlier commit where
> we exported xe_hw_engine_lookup. Add it.
> 
> Fixes: 6f20fc09936e ("drm/xe: Move and export xe_hw_engine lookup.")

You don't need the fixes tag, will remove upon merging this.

Matt

> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index c7c44de7c30f..68180f1ff8a9 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -1173,6 +1173,16 @@ static const enum xe_engine_class user_to_xe_engine_class[] = {
>  	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
>  };
>  
> +/**
> + * xe_hw_engine_lookup() - Lookup hardware engine for class:instance
> + * @xe: xe device
> + * @eci: engine class and instance
> + *
> + * This function will find a hardware engine for given engine
> + * class and instance.
> + *
> + * Return: If found xe_hw_engine pointer, NULL otherwise.
> + */
>  struct xe_hw_engine *
>  xe_hw_engine_lookup(struct xe_device *xe,
>  		    struct drm_xe_engine_class_instance eci)
> -- 
> 2.34.1
> 
