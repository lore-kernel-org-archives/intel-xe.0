Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F94FCD1284
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 12:46:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C957F11A383;
	Thu,  4 Apr 2024 12:46:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RmQLQDuQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56D4F11A482
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 12:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712234804; x=1743770804;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jBnFJmfM05IkH174iBUuRqnaigVDiqqxylKtJNtXc0M=;
 b=RmQLQDuQCzKIRNJjAWvwVNrjB/uX++ocfTUaDgc8mqY2iueyR6zFDNgl
 /vXMNhKa9PYECkUQ/w/GnPEX17II30mXmb7ijPAQcakU/ueIlie0EEPqT
 zAXuEEqHUwNi5Q57b+3T+QUf75gRB7fxWerxDS0tXxagOwzKTfVA2EQ0v
 D960G8m1I89HNdm+m9XY0aNrqfcDt82aM+Rs5MDQrNkjgRFRnX84dWUnX
 CFJPx8iVcQXxGJocYwa/D4A+Vp3N0jbPA3Dvam981MqkhFrF32Jv320gK
 cx8bvJ0GuINknYonh4JAiAqV7gsxeUThyAfoqBMBkCHm3bTAlccK5lo00 A==;
X-CSE-ConnectionGUID: rVdazMgPQ6uK3tPxIO80tg==
X-CSE-MsgGUID: jhCw/fWiRVGDioxvV0zbUg==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7374598"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="7374598"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 05:46:43 -0700
X-CSE-ConnectionGUID: C0GkQ7C9QEWVA7EqvYuXbg==
X-CSE-MsgGUID: S2ayPaBbQV22PGUMaLdi7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; d="scan'208";a="19368322"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 05:46:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 05:46:42 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 05:46:42 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 05:46:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EsrdinSbcmu7DofkkNTLnSstdEJU/hONvdsyxhM7M/Dc6UHXdXydTOPQtHJJS9t0aT/ULzU89yNW/Y2G21fTnc9PncAjzRanxd7R7++isESuwBCh+h2EBLjSYl3iAqifrmRXTpQNfWOg0GXW6ioH74iaiJHZy/X7SQL1e/HarzspeS/EXO0ea0TqYUkPTu3zAZ0gZ6WCEPBuCMwHfjYfPef1wS+SjjCNDyWPzEkQLrV0S2pXmQxVGqZr5NX9gQ7kLpiKc+gU781lt8vq/+wTYYfSL4wtctzIeSWvADbM9SzUabPeqSzLKO0RPndEbmIy0j5nINEsFA8JlE/KRVFiPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jqDlKDYLsBDe/UhcXO+qtw9de5NKngtUpzCbqnHuwcE=;
 b=lsW3OEfl4sYARqS84Kp+TfduqK0onYm2VADRQaGp5jS+JbJSOo4yzssSLWRPcCNKZsIE8pObBpyiv/HkIqFzCtVE24kLA6rgmam9quPTfsPBHUELutdFfVbro93sAYL3Q/0/bvoPnqh7S0YeSBABIBMgSlHvj/5uJN7qoi2xnmVQ3Ufr74iURI4MrgQTOR84pFW1Os2X0+lB1YjghzCpwbqKjXsAFzcp7IbKEoHul8mnSK1Dkh9Hr0n4Vg12RI/7gQ08dUi31pAfFgjJ/IMaqm8FqrjR3VZx7VVsAWeyHTEvCNLlDConGPgTmDxEb6wOxDTfheE98RoQBQT5Rm3pdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Thu, 4 Apr
 2024 12:46:19 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Thu, 4 Apr 2024
 12:46:19 +0000
Date: Thu, 4 Apr 2024 07:46:17 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Niranjana Vishwanathapura
 <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH] drm/xe: Label RING_CONTEXT_CONTROL as masked
Message-ID: <ditc3suqirizkvzij6xecwhcjohwqx4eyagpddv6djtconhjk7@rxj3heqbpeft>
References: <20240403210207.3839459-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240403210207.3839459-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR13CA0067.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8706:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: odt+dbQJkEeJ9lnMIB3F4sOukt37Iy0D/83IryCwCsFWoVBHwDaWxGlQR1E/XvO7JEyH21kVPQXfCsvS4JaioJmOkcPAqo/zSkK/wTSN//3TZ+3dM+XXw8mzuZNoM9DTR+qYrBiwWaaqLztbJ3q1JbUL3tGeVo4BDXiA2vDgyaXm4MWzF61QrCPGAe+yQLXs5QW3BzbmKLg/fIxPcHKVZCJ4RIzubUvBmhxHhAlioe+dAcji5ssiOOMrAdx4Rsc1uIEgZBAbDrol+R+RTxX5HZQgIh0cj89KhiabNjHe1NcIAj1aTjPmaaf0xJCRdkJpG70HILg9ceHBaDGM6j8mIHWJfKFJ1r/zJKJ0rKKx/e0ARJewrcHAubMd8qiQQbFtuKkr097KHt7HxvI5y2WH6GK7fNMcfkT7mFD+bNdk5SkutrWjeuCgLNdGjzDqAK+7OgTtHslcFWffcQEnjNBJrLxvBe07fWUx/MNzZ0vLL9c3k9ELufx8NpylG8TBoE/At6gM6u1VnNPxvcIqPAhkUWr/l9vK3bCqL1zNX4W+K+8YTDf1AHdQ/43yCkQ4lX+F6cSDzgptpDzQvFGqja0XW3aggmvHjN3rL/EQ+ioxv0ghB/qwlXhXvUykSXozMPI8O/kFCcb+2XltGnlPFQedUjrQgBty3qpM/VtvVvoJG2A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F6Xhy4QmO1Lri62MDq5A5/XbyCPuv7BlhdXpeUJl0I2RUe+/KZqWrh97pbZS?=
 =?us-ascii?Q?AaG4Wyj7giWKnFi7JR1k5i9uxF6ZM5vGQgUq2wMnmGqho0oipKHEHOOZzJJK?=
 =?us-ascii?Q?687qRePai9TTBYqtd0Me64GoovomYN5Ctj3gG7SzWqOkgN4y2DR6bL3mHXSC?=
 =?us-ascii?Q?5JCBNh0eWsrzoY/tet8wdBz4uXQZsgwHcydZWDY66No0MRFTeiqz+AXHKtpy?=
 =?us-ascii?Q?Nx5ge09rOA3/GKX65Da+A8ZRzXjmTNu6qHiKOeuF7/y2uAVkWJfCAYoYrQNo?=
 =?us-ascii?Q?Wddd6kumpyVv0ZLL+uzhFmUgOPAeKRnm+kJUmY+OL9da74D8WqeChMn3aD+M?=
 =?us-ascii?Q?eSRnvPWSLSeRyhP+D0RnYjcmMlNC3IBObOraKL6E6Ean3t8aJl4BbxD62mjJ?=
 =?us-ascii?Q?znN+LYvvMZC73YxHiyHB/Y1JLD2LUmtDk6Nrfts+qcaz/GYgEEGuxmMp1ro0?=
 =?us-ascii?Q?7xTRHpZLD1e1HPxzITac7w2pOlx5ELy9LWW4Df9qvYN35CojGJ5T2OcX0nNd?=
 =?us-ascii?Q?MfG08SF2nmy/+D0rpQCsTvvAn0GoPc8QxNvltjjE3eXlfP8ui8JpPJJkTjzV?=
 =?us-ascii?Q?YPi80qIVtScogGe6buAnOV5GhYBgXvMy5yXjL8v84Ko8mIVLDcjkJ5ixwOPl?=
 =?us-ascii?Q?ED+ABOXH+cF4IGErPAtN5hIYyjzWmZRI1CuEUh32f6nEztq487NuIbeNTFxB?=
 =?us-ascii?Q?yIgC+XnTlSjwtjUcHA73agzILUXiWLchgHCkycW/IEMTfjIaow7r6dGwxxXG?=
 =?us-ascii?Q?fjRsh04zHR/U0sjn9u0F0CdAJrJkJW2TcJxCI4ay+8Ay+3tC3VHV3HxrOIZ0?=
 =?us-ascii?Q?JSZvNau/MTVjP6jOW3DsOc9C9PUn41shZ2R9P4eFKRLkCc3QHimO8+sa9Z4s?=
 =?us-ascii?Q?AS0Cuk1cZodiOXWYkmEeXdUW8NLS8cN0llpCJRKjtmfIqNpmFarL0Oodmpl9?=
 =?us-ascii?Q?zy9gKdYeZB+dd6Ysk5l1am/s/q4Moh+1aErwitLSq1P8cQK4JjQe67WtmAPP?=
 =?us-ascii?Q?1696KCZuEPUj/D8+hpGIcA6x65VHMCxKqnuS07+N85uVP5s3RcP/7QZJKQX7?=
 =?us-ascii?Q?FBReuKFFTYCcZWnCldL9mYAMgTsw1Mz7ccl4/E1MZj6D/ogcB2SXs3vrh7Qn?=
 =?us-ascii?Q?/7IkDbf1eH6TQ8vLqGPmaGnZ1F1EoIH9flzIaajabjr8gUNImEg6DQ9nfoxA?=
 =?us-ascii?Q?h4TDoK7AG+7nnWt/oub+w+CGnajiQId5awoWKDN+RSwk7dO9x49jrbK9sQw1?=
 =?us-ascii?Q?pXrOvWEL2tTGD97VZ2S9rB7GOORfXjUwUIeKAeD8Ab9WwkJ4LBlLVa3LsW11?=
 =?us-ascii?Q?jHmMY8R1QmziwVe7cyoViGuPb7bTmHeV3fULkMPlShp014iEMVWCvW8w8mYj?=
 =?us-ascii?Q?V90GXJ8dLlY4fWy65HZy5i3D264s6tSQfajvw08ixqNfo0jpIvK1RCSMbvD8?=
 =?us-ascii?Q?dVoLYFMn0n5nBqEcKRgmr0N5D9+q3k0/G/zR1SGrqeIUKiJTCmJdHXAcE4Cu?=
 =?us-ascii?Q?6pSsEDyRUWZgR0N0YrxlpVUN0Fm4JvCzNZhHBYV/1cqqTDxy4VAFqzyUJFxp?=
 =?us-ascii?Q?S48Q5N52Ezkxr29ktW7kFDdPh0OJUXkeAiiQdbRHxPWQqTI8ASRSNZQhP/9S?=
 =?us-ascii?Q?+w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b88e1ce5-97af-4b33-bd7e-08dc54a53988
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 12:46:19.3447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rny5TgZzU2E/iX1Vn9msBQdmQ+8Vcjipi9CecTkI0viPHVc9ObijxucD8qmw8Ce8UdES97n++HSxPVCecGSPxUZRsweG9Tv50/2VoiawhZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8706
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

On Wed, Apr 03, 2024 at 02:02:07PM -0700, Ashutosh Dixit wrote:
>RING_CONTEXT_CONTROL is a masked register.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Due to the way we end up using it, it's not a problem right now:

drivers/gpu/drm/xe/xe_lrc.c-static void set_context_control(u32 *regs, struct xe_hw_engine *hwe)
drivers/gpu/drm/xe/xe_lrc.c-{
drivers/gpu/drm/xe/xe_lrc.c-    regs[CTX_CONTEXT_CONTROL] = _MASKED_BIT_ENABLE(CTX_CTRL_INHIBIT_SYN_CTX_SWITCH) |
drivers/gpu/drm/xe/xe_lrc.c:                                _MASKED_BIT_DISABLE(CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT) |
drivers/gpu/drm/xe/xe_lrc.c:                                CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT;

it doesn't really use the  masked flag from the register.
For consistency, and if we ever change the approach, it does look good.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

That _MASKED_BIT_DISABLE(CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT) |
CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT looks odd. Commit
b4b9457ae9b619c106ee464c3d75ee52c0b69575 (from xe brach, not drm-xe)
blames me while refactoring set_context_control() that always received
true as argument (heheh... commit message from those early days were a
piece of art). Could you prep a patch on top changing that to
ENABLE()?

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/regs/xe_engine_regs.h | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>index a08528d9c76b..af71b87d8030 100644
>--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>@@ -122,7 +122,7 @@
> #define RING_EXECLIST_STATUS_LO(base)		XE_REG((base) + 0x234)
> #define RING_EXECLIST_STATUS_HI(base)		XE_REG((base) + 0x234 + 4)
>
>-#define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244)
>+#define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244, XE_REG_OPTION_MASKED)
> #define	  CTX_CTRL_INHIBIT_SYN_CTX_SWITCH	REG_BIT(3)
> #define	  CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT	REG_BIT(0)
>
>-- 
>2.41.0
>
