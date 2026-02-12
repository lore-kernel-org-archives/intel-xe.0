Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D90CEEA845
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 19:16:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E7710E12C;
	Thu, 12 Feb 2026 19:16:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dJC4KanQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A01810E12C
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Feb 2026 19:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770923789; x=1802459789;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XJHhSSafFJHq6hRPN3XLbKiMcgSep/MTDLj2tmek/yY=;
 b=dJC4KanQ/ESMlOScoO9hMLWw0pJkC2mvVyjLlGS6Qt1s8i0yV6E6aP3e
 2P38lP3Fr0tzeDpsvPvNK0addCFtbTptqLtoOFe48x+Jz2BAUbAd3IXXw
 Qt1qUN9qPQrJIj2rcg6HLjY9z4iWOvYr2l9WldtsPNQwDQDD+1lyhxRBk
 VyGnqRM7HUoNSAhUr9JWQTUTnYhKYFmSdbT4dfDE+Lq2wRTj/l+JzdNH4
 Pp9mg2H6CJqPAI1W80FSnzejHLke+FXPVSoUygBIudZmkKZMaWpijnJiO
 FwW5z7T9ws/ZXHyNUameScwpnxEh1Vhpr38oYNWrkQRhYIHO8svPWXYV3 Q==;
X-CSE-ConnectionGUID: MFYPEulzQF2EbhfRp3Un9A==
X-CSE-MsgGUID: ysX8bU5BQjuYi6PWkcBjtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72289958"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="72289958"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 11:16:28 -0800
X-CSE-ConnectionGUID: qvg17EbBQr+NAkG9cTK3tw==
X-CSE-MsgGUID: vMP242uqSyyfFpd9pFierQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="216889382"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 11:16:28 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 11:16:27 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 12 Feb 2026 11:16:27 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.56) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 11:16:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TIwHC/vmx/oeE0WC3xSovRGSWfbyeoxtgCFkaPH0o7PoHR09XeolmqHUfKOkke1YJvDDBZP3gsTpuo8NasTGTbygeo0lehoF3z4+z0p8KO/GoQBQmV1zntoRPQvFsAb8bEiNNGYuMIxALvTgD2n14vLcscCdbA465aH/Caa+GJWvfQbEQmhq+yLt5uqYeFBOaHd+Bie4PVITX2AoWkNB1SjVRYrQUYEYEy/L6BkvqtDSeqTHa8/ATxJ8SGF4uwzy/WhSapd+1fM+iQud/Ex0fqCRGFHEswr1tmuNLeoSKECIHkX6foPyrrqYovWR7a3d4uS5r9xTfAp6Z/Dw99azFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k82csEe0Vbk9i6RVTGQ757mG68GiGckhNl33f/8ppaY=;
 b=t6L8wGNtRnZTv0zo1XGuMzNiiIWYu5q4DxEEvezDjhDcjtdDcr9ylKL2zPEBDNFdPdCY4u9SvI32SiY8juzrFZlVOCLn5fGpVdny43gHe+nR19NLpkJS/wplC+8xsJ5CzgsXced5QU3vHAJwXpIKgoSahpYc9SJpVDcayxVdZUTckcWi/i5GqStZpVmOAXcXiDLKC8Yx4j5Mnvjf2KfosrdTtkSidCjxz2aC6xSz0KTWU4DwbCgNkG8q84oS0q+2ky7n+QQA5nV1qS1asUd/IIK42Wu3dp5BhOTGnahTh02p9xa9reravbl5WAffnIqLVLkBNTQZ5iqFlRi63BColw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SN7PR11MB7139.namprd11.prod.outlook.com (2603:10b6:806:2a2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.20; Thu, 12 Feb
 2026 19:16:24 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 19:16:24 +0000
Date: Thu, 12 Feb 2026 14:16:21 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Allow per queue programming of
 COMMON_SLICE_CHICKEN3 bit13
Message-ID: <aY4nBdcGgCpUoS7W@intel.com>
References: <20260205185248.994531-1-lionel.g.landwerlin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260205185248.994531-1-lionel.g.landwerlin@intel.com>
X-ClientProxiedBy: BYAPR21CA0016.namprd21.prod.outlook.com
 (2603:10b6:a03:114::26) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SN7PR11MB7139:EE_
X-MS-Office365-Filtering-Correlation-Id: 12af75c9-7038-4d51-def6-08de6a6b365e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ar2oPrlnxxbGcWVBAmBiapxKWHXgHS0vmPnxX+RylgJ42mr0pYGFeJ5HmwR1?=
 =?us-ascii?Q?MN3+r6suSVNOaHfzv3t5aTn6nwCaDsREP6XPgptGs+hK9W4E2b681liK7zgH?=
 =?us-ascii?Q?7bAs5TaXE1SwwrFU1VV+b3OETD5bkcxyMsMyhBFVKzyh2++s5rMlfStrQfST?=
 =?us-ascii?Q?2+XlEb1MUMevYXUTQE1LJ6i56EYWYIlYYFl11kqFXbMozJshnEzKM+UOC7wS?=
 =?us-ascii?Q?KYd4tF6FD52px2viuH/egFlycthewt7UZ1DhPG0VeEPPs0XlyvXafL1yGaad?=
 =?us-ascii?Q?KjKL1TQak4j7ZoN2sWfpGGBMVwbsFuIMPmUu+yzmue5ki5GulE5jwBM91dJB?=
 =?us-ascii?Q?4IQHGK1uHk12ImX2zjDifhLqdFJuFTAJ2WhtfWbdcQQv+yQOv93GoovLaqYH?=
 =?us-ascii?Q?Rb0t9QKilI5axGrMGn5itEJQbwZES8OBS/13H2arqVusKbu2iukhsUaSMeIV?=
 =?us-ascii?Q?eFZ6+qXMtb7c4+N9dTA45Bk7XzjeZcWmiuGgNiSamoFlGbTY6iK5WfHOBfPZ?=
 =?us-ascii?Q?ohC0SakmMU80oLehgr6Cz4m9P0FA90MgtMe3dliGQgv3RcUdOAs91LVSHTsN?=
 =?us-ascii?Q?eKjrSvs/vLKxMtdGweOCL5gZV8ClgvIRKZQWW9BB1NxjXVUMoFfp3GogjuPs?=
 =?us-ascii?Q?hlHKj672TWq5M1zmsRB8z9INEJPQe6tancHvuMG4TTNeirgIuYpMIDZ0gz/u?=
 =?us-ascii?Q?vuUsL4yo6Q3quBUmkNFZVX7y8eUbQ+M0vEhCArKSXixesfa/tkoDpERygkLm?=
 =?us-ascii?Q?THLlYX5z5cNL3O9HgClIp7PtfT+9kfsyO0M7c6ifoTEDNDAQnaUznmneN1hw?=
 =?us-ascii?Q?LEGVbymKEYchjJs4aLwf6yJGTkHe6HrDX0cNuu61fOcGTeNDn8t0AH+MIjzT?=
 =?us-ascii?Q?gZuPlZX1rm7W1idi2WPXTNy+DPDejjkmrBEgCB05BXFl79uFmJXtTF/VNjw9?=
 =?us-ascii?Q?iCtSZUNkZfA3LYmIDOH2m0bu9udNBrRPuI68MP587LQUVIMQvcC9SXlDoXkq?=
 =?us-ascii?Q?dzkhPykBwbcAvMx8Nh9HJIVPvtkulp9pApVWY0uRJGrsEOahco96ysPksxGn?=
 =?us-ascii?Q?R15kJcfrh2zUxMCNxcyFWuoleKuEnHTfUswCJ2odw/lvKWRCzQkqcdtmeT5N?=
 =?us-ascii?Q?/rajhtZA6kLJ1aMOsuqj90wIqV0vHRV7BOV1Y/UEOTtn9N8s6Lk0fB/w2hAs?=
 =?us-ascii?Q?qRYph19p6T5wmEGtAV+VRf7ZRDho9tVd+wCX7+KmqGTOzs6R6leULBwVwCqL?=
 =?us-ascii?Q?pa2xDHF2EIN8pp+Hsu/e2e3oauJaklY1bEPhpX5i0bYgv61h8qOKz3degS5j?=
 =?us-ascii?Q?fAsH4GRHDH5dzdxs0fbOPSHNcLIwx/iYx9tmAL+kyOyQtD62EGtIv0Zm67t0?=
 =?us-ascii?Q?VZEP7khzFURuw4hol2BGtTbNCs10//ReA1LglfveGnws0QrL/9fUoUp+r9WA?=
 =?us-ascii?Q?+l8vsglBtRtokA0HbM0qngp2P87XqCpY+K9lM4EGnrwcAutAiiJjM/v4Oe0E?=
 =?us-ascii?Q?Ue02CJSt9v81FEwcqo/+tWrS8gLHcc8qZB0sNwD10pcJmlH6Wotgt6F4/6vK?=
 =?us-ascii?Q?PtRQTGlKKEbvp+NsTKw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aA6dGxei6MMVwJZ0qdE08iu9vhGq7hKaDJIKb2bz0IZuplveU9Wv4RwNECn3?=
 =?us-ascii?Q?gqkNms+iJQeBVC659Ay1uUd4tvHmDIdk8v9iUYYbGceQdH25V4YXgalMpAA/?=
 =?us-ascii?Q?c+soCDdj0SJSO2wclLPvmROCr0LY0pQaOmmFRrE0urEHjc/Jh4qSSygqnhFu?=
 =?us-ascii?Q?Oagw5nbHfWsPMDkxHUeLjEnjfjGB/PIYgkZaWS0rmoAhUrC26RIVcoWfnush?=
 =?us-ascii?Q?W+Qqk0W6Z1wttbZ51c5cld82nuA9LGIRqzCyYLkvr3fuBLP4q+DFrBhO5HD4?=
 =?us-ascii?Q?2SDa0/LtbXSVOVxpDmEMnmyCNh6iGd/QT8mXF7gud17MFaHF1X0hCKD3S/pt?=
 =?us-ascii?Q?+47WDWUA/jxNGI55R64t/OundzuTXO/PBsFhZW/c+e/My7PARrRFzozpEn00?=
 =?us-ascii?Q?c6f2xa913syPuODLzJI+nW0rTVkpJXszWB3yxXeRQvCIr2oMk2Sz0+EkgWkx?=
 =?us-ascii?Q?4xX7RB4gJ9fPmE4a8b8iDlAaoShRUvwQwwBZmNRQh6BX+AZok0vFjxK3s/k2?=
 =?us-ascii?Q?vo8QVKd4n0gkY6/dRj8mQ7hsABtboUsmifr+yfUzbZJxDtgZvLR5Lw7V/cU1?=
 =?us-ascii?Q?p/5C+/JFPcFIhHx06NrmeSt+5P5uK3gXjJPynQ6hNgBB+Z0Ad5W/KgYQKjUV?=
 =?us-ascii?Q?KA5UjYlYy5HyKiX+WIH0EIyLjkDlmiKJ9heDtjQ9B6FuIPSILuZ2+EqkfaTj?=
 =?us-ascii?Q?ZhBIU2z1PbPVwdaWZZneX+4kOtWwatkGGkvEZ8kVZ7KquuIAH7d6c571YHJs?=
 =?us-ascii?Q?dcudcwF8E7YlEZQpVP5obPEYLtr5Cm/BBTv3YgItriP9uEW/wBDwY3cWQi5S?=
 =?us-ascii?Q?PURVamVWS+m4vjJ6tJzHRfWU6XtatdwVnQUVvPgTPzf3DwFBXjKXk9ZR0gIn?=
 =?us-ascii?Q?yD2KhFd7WYI5fP44pBo68HHO4JpAG/IVdDiyZTIz+CQgJnyv5qZC7oF8Sk9C?=
 =?us-ascii?Q?C4A4HILI9uG4j0Bza3zWRB/GDtffxedTRkYAzzG/g3uurhqnJPtLGdQnvsks?=
 =?us-ascii?Q?ClbT9t5y+I4vDN6KK6ud1WCEEKlHudm7DeqsfVHGRy8YP4Ik8wLLZSNRmuGf?=
 =?us-ascii?Q?0mwsuzeM7MteCsPE1NxhSYlo6Y1jkEfC6gvqQNWHFYJurj+wS0RxdwuB0MNx?=
 =?us-ascii?Q?uZ6A9vrsTrDWHS4ASobSppouTl78PM9wDy3zPHGLJDWA5lDHnGDYdXvFn2fS?=
 =?us-ascii?Q?Dgu9hPUtgAaUmf8X3ivw/CYpTgzObSgLHLPcpA+J0cUpb4AOC2VtgzQofAbc?=
 =?us-ascii?Q?yqoB8+C+N4reo5vodjxJtgyE2+ryrRdHi0dW9UvenHvj2C3ZLlaYQEe0jCRv?=
 =?us-ascii?Q?CqXInQdt9a/pxjcZrP+yAmbJfQ2KavrZUZVU7cICrHoFnAmZZBM2GSPcXvUL?=
 =?us-ascii?Q?Y6TK5N1YzK/20JJTw/CUNh6Qx9E0XNwtwHIwYZNJp8hnGgeQe30tXnyzC1Gl?=
 =?us-ascii?Q?YFheqK6+LDXpqSdcEzqYviHfrkC0ciUYt5Ku4Q5gyJ+HDHnnR+q4Zd+XqBUE?=
 =?us-ascii?Q?Q+pjzC/xJ6wfAQaSlqriVpcy4I6Dp0WU0SzNm9KOsPI34Lnyr03nF4emAa1Q?=
 =?us-ascii?Q?NGrhScuSZ9HzhUq398/1i1Hfq3HXDTvpUdvKJENJ4IzOdwJses0PVOTIvEAm?=
 =?us-ascii?Q?Zuc0WC+aZQW/7ugYCCyGAG2oJU4BsAJrO38R3bWBGk79ui1dPW0+oPm+7xEF?=
 =?us-ascii?Q?OkNxjq33UueMTVW7+vRRhv3I2r+r23msDXrdTMdNWHgcwrKd2Yf2VwZASIcM?=
 =?us-ascii?Q?CvhPRMut9g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12af75c9-7038-4d51-def6-08de6a6b365e
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 19:16:24.2274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HmMqCIMhSo/BG6upDaHla/DO3qOnNmqdaJBUtB2czYC30l683wKJTgTBR6a2SRV0AvHD/2jB3/WaYYjDWZv/Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7139
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

On Thu, Feb 05, 2026 at 08:52:48PM +0200, Lionel Landwerlin wrote:
> Similar to i915's commit cebc13de7e704b1355bea208a9f9cdb042c74588
> ("drm/i915: Whitelist COMMON_SLICE_CHICKEN3 for UMD access"), except
> people have decided to not rely on putting the register on the
> allowlist for UMD to program and instead have context/queue creation
> flag.

Could you please be more specific here?

I don't understand why we cannot simply add an RTP rule to xe_reg_whitelist.

If we really need to go with the uapi, it is fine by me. Just attend to
all Jose's request, plus fix this commit message and then ack from my side.

I mean, I'd like to understand this a bit better on why and change a bit
this message here, because 'people' just seems to blame someone
without being transparent about it. Not good in a commit message.
Not a good 'why' reason. The commit message should be about why, not blames...

> 
> This is a recommended tuning setting for both gen12 and Xe_HP
> platforms.
> 
> Bspec: 73993, 73994, 31870, 68331
> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  1 +
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 20 +++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
>  drivers/gpu/drm/xe/xe_lrc.c              |  9 +++++++++
>  drivers/gpu/drm/xe/xe_lrc.h              |  1 +
>  include/uapi/drm/xe_drm.h                |  1 +
>  6 files changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 24fc64fc832e9..a1b89f0a22e14 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -172,6 +172,7 @@
>  
>  #define COMMON_SLICE_CHICKEN3				XE_REG(0x7304, XE_REG_OPTION_MASKED)
>  #define XEHP_COMMON_SLICE_CHICKEN3			XE_REG_MCR(0x7304, XE_REG_OPTION_MASKED)
> +#define   STATE_CACHE_PERF_FIX_DISABLED			REG_BIT(13)
>  #define   DG1_FLOAT_POINT_BLEND_OPT_STRICT_MODE_EN	REG_BIT(12)
>  #define   XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE		REG_BIT(12)
>  #define   BLEND_EMB_FIX_DISABLE_IN_RCC			REG_BIT(11)
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 66d0e10ee2c4a..d20b4d84bbe06 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -292,6 +292,9 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
>  	if (!(exec_queue_flags & EXEC_QUEUE_FLAG_KERNEL))
>  		flags |= XE_LRC_CREATE_USER_CTX;
>  
> +	if (q->flags & EXEC_QUEUE_FLAG_STATE_CACHE_PERF_FIX)
> +		flags |= XE_LRC_STATE_CACHE_PERF_FIX;
> +
>  	err = q->ops->init(q);
>  	if (err)
>  		return err;
> @@ -850,6 +853,19 @@ static int exec_queue_set_multi_queue_priority(struct xe_device *xe, struct xe_e
>  	return q->ops->set_multi_queue_priority(q, value);
>  }
>  
> +static int exec_queue_set_state_cache_perf_fix(struct xe_device *xe, struct xe_exec_queue *q,
> +					       u64 value)
> +{
> +	if (XE_IOCTL_DBG(xe,
> +			 q->class != XE_ENGINE_CLASS_RENDER &&
> +                         q->class != XE_ENGINE_CLASS_COMPUTE))
> +		return -EOPNOTSUPP;
> +
> +	q->flags |= value != 0 ? EXEC_QUEUE_FLAG_STATE_CACHE_PERF_FIX : 0;
> +
> +	return 0;
> +}
> +
>  typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>  					     struct xe_exec_queue *q,
>  					     u64 value);
> @@ -862,6 +878,7 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP] = exec_queue_set_multi_group,
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY] =
>  							exec_queue_set_multi_queue_priority,
> +	[DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX] = exec_queue_set_state_cache_perf_fix,
>  };
>  
>  int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void *data,
> @@ -946,7 +963,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
>  			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE &&
>  			 ext.property != DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE &&
>  			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP &&
> -			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY))
> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY &&
> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX))
>  		return -EINVAL;
>  
>  	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 3791fed34ffa5..f4f72d01eb8c8 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -134,6 +134,8 @@ struct xe_exec_queue {
>  #define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
>  /* for migration (kernel copy, clear, bind) jobs */
>  #define EXEC_QUEUE_FLAG_MIGRATE			BIT(6)
> +/* for programming COMMON_SLICE_CHICKEN2 on first submission */
> +#define EXEC_QUEUE_FLAG_STATE_CACHE_PERF_FIX	BIT(7)
>  
>  	/**
>  	 * @flags: flags for this exec queue, should statically setup aside from ban
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 3db7968aa5e22..571d7ef303e1e 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -14,6 +14,7 @@
>  #include "instructions/xe_gfxpipe_commands.h"
>  #include "instructions/xe_gfx_state_commands.h"
>  #include "regs/xe_engine_regs.h"
> +#include "regs/xe_gt_regs.h"
>  #include "regs/xe_lrc_layout.h"
>  #include "xe_bb.h"
>  #include "xe_bo.h"
> @@ -1443,6 +1444,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct iosys_map map;
>  	u32 arb_enable;
> +	u32 state_cache_perf_fix[3];
>  	u32 bo_flags;
>  	int err;
>  
> @@ -1575,6 +1577,13 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	arb_enable = MI_ARB_ON_OFF | MI_ARB_ENABLE;
>  	xe_lrc_write_ring(lrc, &arb_enable, sizeof(arb_enable));
>  
> +	if (init_flags & XE_LRC_STATE_CACHE_PERF_FIX) {
> +		state_cache_perf_fix[0] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1);
> +		state_cache_perf_fix[1] = COMMON_SLICE_CHICKEN3.addr;
> +		state_cache_perf_fix[2] = _MASKED_BIT_ENABLE(STATE_CACHE_PERF_FIX_DISABLED);
> +		xe_lrc_write_ring(lrc, state_cache_perf_fix, sizeof(state_cache_perf_fix));
> +	}
> +
>  	map = __xe_lrc_seqno_map(lrc);
>  	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
>  
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index c307a3fd9ea28..083a2167aeef8 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -49,6 +49,7 @@ struct xe_lrc_snapshot {
>  #define XE_LRC_CREATE_RUNALONE		BIT(0)
>  #define XE_LRC_CREATE_PXP		BIT(1)
>  #define XE_LRC_CREATE_USER_CTX		BIT(2)
> +#define XE_LRC_STATE_CACHE_PERF_FIX	BIT(3)
>  
>  struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
>  			     void *replay_state, u32 ring_size, u16 msix_vec, u32 flags);
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 077e66a682e29..b69b95a56bd82 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1329,6 +1329,7 @@ struct drm_xe_exec_queue_create {
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		4
>  #define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY	5
> +#define   DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX		6
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
>  
> -- 
> 2.43.0
> 
