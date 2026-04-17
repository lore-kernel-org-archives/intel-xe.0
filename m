Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE9DF8DFF9
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 18:40:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B13AB10E2C8;
	Fri, 17 Apr 2026 18:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I8ivPfAx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D16510E2C8
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Apr 2026 18:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776451225; x=1807987225;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8UU+PTJCWWKIDnn7v+PFaEnt1vZJppRWuTuehsh4xKc=;
 b=I8ivPfAxen/C4y2XeJAVZ2gmYBcWz7iVu3k1Ia7hACc5or/wjM14jkmH
 7hjFlcT40orGLzt6GhAvXXMDErTXEn/clCy4Egss0U0L3/9PEs50Jy1YT
 12rzrtcwqZProFp6nMX8VolR4QtfD/LHtln6HmDY/sxUTFD7UOACovPXp
 ybhvvyvsMmjuxtFbps4s3dxkrJDwA2hdfFie8lkzTsKpEtm64J9Fyqqrp
 EBz/j/6At5tUcG/xALK5B7OKzBrCTsdOsP1KSTKFhS6SJcvkZaCY+CnY0
 BXyQwplZ8s6NWeWXyBrS4KfOxPahc9vV2j604q38I9UzMv8kiJvQpMlOS w==;
X-CSE-ConnectionGUID: WZh6Qs8uSaiXeY2l5m885Q==
X-CSE-MsgGUID: CBmH2mFBQt++prx8IYUQqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="100119901"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="100119901"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 11:40:24 -0700
X-CSE-ConnectionGUID: /zxDkIpyRvexWgE1MJrgjw==
X-CSE-MsgGUID: Xrm1d5VTThiYen/wGJ4aRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="230104848"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 11:39:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 17 Apr 2026 11:39:07 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 17 Apr 2026 11:39:07 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.34) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 17 Apr 2026 11:39:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IUWFgz6bhmOV1f3ltcwpFJPkXn4y2/oRul9eLtTXTlHpsXeI/UJPXjojCaQJ1C+2/rUbriKMO8NT9lxCTgU1xlshn4/CKc70/K5OYu3Ya3TWI+DA1dOfcqei5wRSPO36owujpWT1Voj63MLwdY2rPZmiZKD9hwDA1kCy/F29ZOizXP3hErAiIr27xY3jH3K3Y6Mcdkx8Cv7WvcPJI1mhyk6vPIWjiJmtMOHa1aF481TvPU0vgH/1Lud3SUtmlbKjnsgDQGSQQJfxiAylEECwU0QEQecYVr6vI34w3xQ/MC/WPHHrtSSFpM68NSUm4yG79GnckzRGTRuTNQ8FZ6mHGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y9mcmsdbmSoQqH2cNfu+tP7rxonolyib2ImGd1sJIKY=;
 b=V7Sa99WrnoaA9k6/DdHDiQ4nbQ+dy9o8eVLmQlGY+zuF7frasG9a/UA7mGbbyAmFzjfb/HakPJri5O9cc0F1EsDBmkzRD8Mh78RJuUC/EaiaG+FOF1AzL6P1Xq9lnAXufyZSyC6KgB5ls9DXcw1lK5D/U1j2k8EznQwtF1qwZe8ren6vAYne1RlpYSvIdMAdCBmvUgA7OvtQX6aHRxSznfCRD4WiKCMb2vxZMcsi0BsAI+SyWBnBZU6E5A736ql9YE4kfBHuJwJDgauj+tvQt5mPavAoKRV0+urwgOrJKYx7zqG3p5m8iAIRo/+tIPVFJQZ+NraFCKFz2CDIDi+BGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM4PR11MB7303.namprd11.prod.outlook.com (2603:10b6:8:108::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 18:39:05 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 18:39:04 +0000
Date: Fri, 17 Apr 2026 14:39:01 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Julia Filipchuk <julia.filipchuk@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v2 0/7] drm/xe/guc: Recommend GuC v70.60.0 for LNL, BMG,
 PTL
Message-ID: <aeJ-RTBuAU_yUkVk@intel.com>
References: <20260406211759.817577-9-julia.filipchuk@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260406211759.817577-9-julia.filipchuk@intel.com>
X-ClientProxiedBy: BY3PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:a03:254::19) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM4PR11MB7303:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d3595db-cc73-4a10-d152-08de9cb09a0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: ogP9+aGMXnWmsz3+92vntQWQ/yPTLeimFFLg/Pw8KlsTx350i5yO9M66dfa0Dy/XgWwB1jLZ24n+wnYSf5BlqAN/54UH3KwWN/xkn43Gl8UXClh8bcrobY/48g8R9en/N5et8PM5z12K0hNkhBFXfR8I+q29gAyE0Uya7ZP+7rfQEJihtFVJ7OQ+rP6tNqKjlNPhErMtHr1P1EZiB5YN1PUHP1Kn8La/vZn9puzR/c+4XS4uwoGUsZOHGMKiAc0dsTthqCkpij9fQlTFanf2Azr/LKamxxF3/hoxq0Yu6yKJtOlW4WDRa1PCBNEwb2SE90S6pjrNK3KBkQ5+AjTRLfbG/6I5xij+Xk0+VLsqUH9r6L1klQmSXIc1a+3e50CPBFeRllDyrK/iecDvwKAQ6wZRz/nqU36A6nZUK5WH/svG2vHoT0DnhlgfJX2PPVSPEHUl4a6osBqeqPz4gaGdlOXG06jbJp/Y00sTEhX1O2tV6tyQSjaGb6j+pTII2NeyyKrYuuWEUe/pt+IHCFq/qkA5WkokvSYV+pz7p7o7wB6NOILhLF7dqBUrOhwnB6Bf1poBWV9VB6kA11KIArG8QQYMWItqF/EmryUs7twMJQ9JDoBbX+xbf3fdDvQpezPXdBFMhU1GjgXwMumNbCxftEAG2JF5hUP8Jx+cAC3ECkXWlJP8U8t1Aw3Vs7WTcDk24//+uuiRE5C6h4rpK/KLc5hPZiRpi8DNf60gQBKPZNw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hJPixzIvEfltDEL2G3qtPfUXEnCDZTftdbs38YotomujeMfWv1AXTUN/MGVE?=
 =?us-ascii?Q?TLLfNUgm0Uu7cN/a3WIDfyAcTIvY4E+QcBkSkhOs+42OCrhObWPdu1EqTvxq?=
 =?us-ascii?Q?wEaifdLuKLwzCY/GWlcG9xG1z8OfuN/eq9TkC9OPLA7L80ZyvFRI/8PfAdxy?=
 =?us-ascii?Q?3e8tAtTipBuFg4JEYYXiiYTh4AQZo10Cr/PsJRB8cz1tj1AHQs/R0aSuIOVX?=
 =?us-ascii?Q?ga4Pbg4zldL4McJPZZD7/ncyAn18gmrCzEq9afWbt+Bs0EHhVjIEwFo0JNhL?=
 =?us-ascii?Q?qF0oCscde8oTVlgJeGwTyi6NQoXbBKAIStQ9iQbD6jyuotXIe6dh00XOCR24?=
 =?us-ascii?Q?wPcuHMxRARTylsBqkQHRuT9sog1QS6DAKYARpbZUjoMF9Ee3xOM88vwdDAHo?=
 =?us-ascii?Q?KuevEPh7h4311W18KJBoYuG09m9qKWCikQNtEhQ4BlUJMI3jksNEm/kwOIFm?=
 =?us-ascii?Q?HqT0iPnpU/uvzr/PHJkkCrCO8iHzw7pjB/hc9Z+kxsx2pp4fhKQMVVgd5X1P?=
 =?us-ascii?Q?PoDbM3ItD1sAmnBuNI4OdYojJwuWcBGYgFcgaZMI7fO0UVMKBaxu5Xe/DHNT?=
 =?us-ascii?Q?YhLaBEQ2raOUH7NAX0PCuLH/j8DzwmgAWQnKO1dOem+gqXkDPedtOCYNfRUa?=
 =?us-ascii?Q?+F2uIlJayy6PRMMIZVdlYCtWEwgES1httf8c6+uXI4oHgtO09AS8wPSMHg6n?=
 =?us-ascii?Q?75w39Qa4AZYULFWvXVr6EWGOJK2H568oJlOJn6p7hOtzvcw+ksxYJmhDM95Q?=
 =?us-ascii?Q?OalcnbaXKwEo//44aPXSL57qmiPtvMzr2Lfb2KsFB07s+Bg6WP3M8x4CPl2y?=
 =?us-ascii?Q?AFsE++jpnlXJLC8DhQbDU36iA0wPQxMBCyvlDkI6VRAqNZU0+H2FqpFkLHf2?=
 =?us-ascii?Q?qPzlPlhgLas++0YVaoPjFX+54ZMVsMHTd70AACYy43gbcZHXxShKhowqGDRw?=
 =?us-ascii?Q?ksxq4Bj/ywUu5pfeDnDwPNlWB0alkRb/valDtQ6C5xirzwzw4xc1BZIRoWmw?=
 =?us-ascii?Q?47pqzF6P+KXJyGWYvHJUpX5ZO1ZYgnYpea8iCFZcrtnTfiCZZ+JIapqxvz92?=
 =?us-ascii?Q?0gjKD9QDzN6f6A7ErxegtnJSKrhq2S8xFQ7oHlK7X4nRWvFAFFr1OkdtZGtW?=
 =?us-ascii?Q?1o+4pjU3giIWxte+i1/tCUcptIkZgy68Wtw0v5/GssTcQfjR76k5oWxz2FHC?=
 =?us-ascii?Q?3Oe3kROUtl2UL8SVTwq7qqtAPCZogHdGAPZztVZX7GO5qojmGgo6OOxSfgP+?=
 =?us-ascii?Q?xoKCRWZErcNIBtc9ZJRYXhZ+56UPRmoxZJ3Phl4/ckY5SrxMUJZ2ovxkKKa3?=
 =?us-ascii?Q?iGEHrdPyPj57wv54CBa3biROwtioTHdij7llGlKtAdw5oNj5qts2IRRrY5G/?=
 =?us-ascii?Q?ZTM+UgI+fzcysn4ZEuAHxhiDBJT+33zO3qRrn7KNx5wtCWHTS7hQyoaeQZgX?=
 =?us-ascii?Q?RRAhMYzJyY1phrFRRQSH+iacP4/GFkC5N7w6WrtXwhcct0TgeieoCMY1ok3g?=
 =?us-ascii?Q?7vNOtul7isr1CorDtGS/pOkoi4EAUQ/E7ceBzZG95Cd3C+R3FU+4wysIuP2E?=
 =?us-ascii?Q?8F/9xmyO4sVGYEBfp8r85YLX5Ed7eZU6z/nGoHrL35tAtv+mv/mSgHgCaGrx?=
 =?us-ascii?Q?EWUco8618nU8bs6N8EzjupNcspuE4n/R7DEKM/Jgs7aSXpaE9c1vX/ZdirL3?=
 =?us-ascii?Q?4yZfC5MG7o5qD28x1MlkwOk4rY5/FuZ/6HFU3QYt2pwGhy/EjlRSjA5RsrLO?=
 =?us-ascii?Q?BvxLVrTrLg=3D=3D?=
X-Exchange-RoutingPolicyChecked: aQIKSS3SUTZXqFUP8V0OJzieSb2NAfKZbuhTlLsOIM8hAR+7vJXdz97thUCh74ns3r237jy0MtQze0OGNm5a93Rck3eplygy5wWhOJpZB3nQYUUCi7wKBAAtv5el6ybV8+MgTGzEmfQLrnYQFG272JV6g6DWaZVDIJLwqyJ+e0j27f1yjbGElT/fPVEMg6EHgLReQpomw/nmOn5wnyW/t1jm8ufytrGyAA9kdgRx7ZeTmaeowRYMqHSGIMsIXk8P3iMPWeWp/nBRu+jwE+1/4TS65hNL4qI2lWdHaKvi960CMRcVomIcMyI5ras+FXAd9U+VZa79y+sfQZGdpZ606w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d3595db-cc73-4a10-d152-08de9cb09a0e
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 18:39:04.8477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fieM0/zW2z+UBJf5yUH9qP+1oRHsK1D2fbGrdj/qB6K8nP5IVgT/jzu9KDqDSq9fiHfWUPpYJGymhNYtq/S02Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7303
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

On Mon, Apr 06, 2026 at 02:17:24PM -0700, Julia Filipchuk wrote:
> Recommend newer GuC firmware for LNL, BMG, PTL. UAPI version: 1.31.0
> 
> Update NVL-S, CRI to used matching GuC version v70.60.0 (Only applies
> to xe-for-ci topic branch).
> 
> Platforms NVL-S, CRI, NVL-P are not merged to upstream at present. The
> GuC definitions for those only exist in the for-ci topic branches
> drm-xe:topic/xe-for-ci and drm-intel:topic/core-for-ci. This patch set
> reverts those patches, updates the recommended GuC versions for fully
> upstream platforms, then re-adds the CI only platforms definitions.
> 
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> v2: Added RB for main patch. (Daniele)
>     Update xe-for-ci platforms NVL-S, CRI to use v60 as well.
> 
> Julia INTEL (7):
>   Revert "drm/xe/nvlp: Define GuC firmware for NVL-P"
>   Revert "topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI"
>   Revert "drm/xe/nvls: Define GuC firmware for NVL-S"

Let's not revert what is already upstream. For this we need a branch new patch.

>   drm/xe/guc: Recommend GuC v70.60.0 for BMG, LNL, PTL
>   Reapply "drm/xe/nvls: Define GuC firmware for NVL-S"
>   Reapply "topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI"
>   Reapply "drm/xe/nvlp: Define GuC firmware for NVL-P"

And for the other 2 that gets replaced in the topic branch, let's avoid
adding yet another prefix on those.

> 
>  drivers/gpu/drm/xe/xe_uc_fw.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> -- 
> 2.51.0
> 
