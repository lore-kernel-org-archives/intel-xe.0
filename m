Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01F4C3DA42
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jul 2024 06:14:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F6A10E5B8;
	Wed, 10 Jul 2024 06:14:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z47rRKyn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 032D810E5B8
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jul 2024 06:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720592093; x=1752128093;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=d4LGa7UUUvNAbMebUBeTMrWDSob41IxLtJIMoI8Cang=;
 b=Z47rRKynZn47Y23BGWlWT3AQpbXoPPx11whezgpgboRzHhPhVOqbYw12
 GMfgiZV15rKlkbx2knkU5iKI6rmNFMqM/h0wFGvQrRqGV2+NYCL6lmdxf
 hvLQtTLWp8C2tt7TbUFOkQsKBw+ZL/OBeDf8TRy/PnQ9MBHeZCUobV3Yl
 VNqeNjTRShvmZndBiVCxhnKk3RA7VkTSGrJ3VG131dDOegdvLYxpdbGX2
 pZ/NDDgr16A4IXOESsX0rvpnUyX4VlqpvJjWoWVaS3p7C/SGb6ds23iL6
 Wpg69rq4EUkkWRDsm0894sBAE9GNbHcKXhBJseZLWcpunVKNT3cVB8Jzu A==;
X-CSE-ConnectionGUID: 9/6+VLfqSVKohfYZvJ4oRQ==
X-CSE-MsgGUID: 3/dxSO7ETAOyKGp2mdT/IA==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="28562097"
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="28562097"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 23:14:52 -0700
X-CSE-ConnectionGUID: AAPkvKI8TE+KC5sohg+2DQ==
X-CSE-MsgGUID: ZcqfGEUhQOqRTJgRfHjuqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="52697634"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jul 2024 23:14:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 23:14:51 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 23:14:51 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 23:14:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zg0ukq2Og23qFs5eQmGsQUFnFVPuxmJ3k3ZIfO19QhCkLgjMM1wBoraMC3IowQQBx+wCSmmKPZDcUuznsHexzLeZCdT0hv2csL3IwmJW7T0/Byj/r6A4E+w/FDoewQCtN9n/aQbuBCnvylUooji8jKbE0FcT31TwfINdagecEoR0fWqsgXn8NG3ISsSzwaCp62045nmiiS01TTvKucxn94Nf483pm08/I1fNmqyAxW6dSftAG9UrJopK0qEany88/R88U7yBLA3bdzPhmZH1pb9ixEIKhJsDmhpgbwrAowAWRz2Ar5ERm6RRGdZyCnT4VGPf30lK+llbsj7+z8JJWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3j1NJ468WkCkATA7pif/ufyOvwvZwJXRdjlq0KqrJBo=;
 b=anfBcejQUqliduIB8NcRzwwodXY/0kw5qZXJi1PTLrzmE0WqALeimJ8mNibxREf1Z/uPqLNBqEVCHUdpnO/uOgQQ9sSD+B2y8dlT126ihIn7h9GJlhkkgC0dhCABO76nljMMeHHrU5PtqnJLPnChtX9FZcN07Q78JYEfsott7Ry74xOCzHdvcl9fMwWMwar2hMCpPisnr78nhrWqQSuEOWddbeR2PXxbtNQlXpIMeByyqHK+WxwwkEe7jgxIdrAOoMfRcQiZlf9m8Ke9sx2frYJDBaKEXIgl9nasE5B+jG5ZjnaC8EWXW9l1WS87fq02haR6cmJiO7G6ZehorASuew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SJ0PR11MB8294.namprd11.prod.outlook.com (2603:10b6:a03:478::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Wed, 10 Jul
 2024 06:14:49 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ffd7:2656:a8c4:43b0]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ffd7:2656:a8c4:43b0%4]) with mapi id 15.20.7741.017; Wed, 10 Jul 2024
 06:14:49 +0000
Date: Tue, 9 Jul 2024 23:14:46 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Dani Liberman <dliberman@habana.ai>
CC: <intel-xe@lists.freedesktop.org>, <illevi@habana.ai>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 2/8] drm/xe/irq: add msix allocator
Message-ID: <Zo4m1tbU7y7lRlIT@nvishwa1-DESK>
References: <20240627124043.2923586-1-dliberman@habana.ai>
 <20240627124043.2923586-3-dliberman@habana.ai>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240627124043.2923586-3-dliberman@habana.ai>
X-ClientProxiedBy: SJ0PR03CA0070.namprd03.prod.outlook.com
 (2603:10b6:a03:331::15) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SJ0PR11MB8294:EE_
X-MS-Office365-Filtering-Correlation-Id: ba1c789b-cb30-495a-2b33-08dca0a79a47
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?awllVlUzZC7RTVmyQHpypqKmepcY5VjyfvjrCcPJn4co+Xz65XP3QtAY5sKk?=
 =?us-ascii?Q?t3gUehlQ2ZeWffq/TzLOtE0xBUBB5ORYSMh/aQWExvIujPgdaRhLUwa0c4Kk?=
 =?us-ascii?Q?+KX+/uEhIf4BP1aQgZQym9doTnoaBaF0kHRH1T9ozFCUc0hwtQgC4mN9i8LP?=
 =?us-ascii?Q?xqTb6mq2robAyDx6LVdp0OjQB94cozl+FFlO4r5t7d0Vt+4XA94fejqA6zkE?=
 =?us-ascii?Q?RgBiC+FKXH9VPyIpP2A699NKpo/eGXC1methjmdnormXzl4T1icLv9afVPE/?=
 =?us-ascii?Q?sYWim2keAfuoljRu3qStgYsovGy/px5QdD4BbLqhJVSGjyw92NcP7vmufr1p?=
 =?us-ascii?Q?h52LU2fQIDNLAf1opgGLrRLZvwSE4njb5Nt58b48DIPL4uueXzWGTJHl3hLB?=
 =?us-ascii?Q?IXpPtpl4A+e7lN0MigHgo6CHrRRPGfZKVMrrbbXU0CSBsOtKO0nGDdYdQPXe?=
 =?us-ascii?Q?9iEcoGwqk/E1L4x1csWeeGnDEFXyeaA/mR4STao3nH/8Qf7QXOQSO8T6QXbo?=
 =?us-ascii?Q?EoVhLU5JdLDzA5/b5ltJz8Lp+Rg3IUb6+wMK421Nh0Uhkil7gSRfzN22d0kP?=
 =?us-ascii?Q?nGhH910M64y3tqWxqMyCp5yBXBcG7yT+4JMiammhkTyzSz7Ipy5+vVcorZfn?=
 =?us-ascii?Q?qTuFaY1Y6axOjEV8T9vHh46WVQjWTNEYcK1fVAO7f8pRqrA7efdYLfvE2gYt?=
 =?us-ascii?Q?ISLN9e9NNzIvGbsQPrFMrtKVJsok0rGsxCzeJsLamjeMQyO0q+3K4TO43A4f?=
 =?us-ascii?Q?H2bIK+wP1BeNTpXUWXmxdmZwaxls/oBlF7vw4T2KsfrsYwh9lqrbDKt4aC0I?=
 =?us-ascii?Q?VvSF9S7LS2QJFvY1xulvIFAQMks1KHAv7fV4GqevXHU+L9sp9Cu59vLkoIpy?=
 =?us-ascii?Q?27REpOCUrZM7hoG8/qF8lVWKAb7IwYDBqpkiIg0oWo4eg3wcv1sPfq3+BR1U?=
 =?us-ascii?Q?9ASmzN3yC5jYLduq1ZeQhvwfjQmEZ+Ep2J39//nh4udqMGrP36nYAVU2I3FF?=
 =?us-ascii?Q?Vz4zNjXy4Zr/A8ykOLiIO2HulxCzAeLgmQNDeNH0xZwG8nGW1dG9uJbqEHVe?=
 =?us-ascii?Q?k71LMHOqBRllmqGHnlmgPLT4vOjFTwcANLPXafTSVswk3exYelQE9Le2kmE3?=
 =?us-ascii?Q?FNtcD8pZD2NqzWpT8ifMnPHMh6ZJTs43TF5tWXKo14r51rmxC8qZPi9OopYQ?=
 =?us-ascii?Q?R7JvmunmI+cRYNAOlNAiLChGGv8ACkZM0iFHKJnzNEGoOKd5bIlllmLZtQSH?=
 =?us-ascii?Q?dznzm1vC+9i/eT+qC77R530vj3uwahWFokNR4FVXrG3Q9n+OTk7+w7VqaXGX?=
 =?us-ascii?Q?6yddeWllI4ykUrVU4/s7TKr7PObOz+zxP20ySuaomVXN5Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DOp6xoia3NGHteFavQ6/vdXmPlVrT/jpKtP55VK4LT3OqycxvpUKB4WvZO8f?=
 =?us-ascii?Q?ilBA7ixj/R4ZFJBcSeU0fz+L8Yei9ZsqXIG3XJhGgaWnrH/KtmMw6NvBpYRs?=
 =?us-ascii?Q?IyGk6cdGetdGKGHZphabynoo2Wz4d4+uL4IbSJtkjh5s2Q7J59i5+F5NFCnC?=
 =?us-ascii?Q?3S2KKdpSmKP+FQgrzm3RQbv+N5aKyQEFTd6EDjbvsp8juyvECWLjJ3meLuZT?=
 =?us-ascii?Q?x8Omz9IauYjJFBJ+nwXwlGt9GDpftV3lHYNjbPeJ4+D4f5yPQwaINxrvHWon?=
 =?us-ascii?Q?sKVhtw5shUK1XD6f2tuXzFQdzBSKzgrq2Ewcep4fW0sb2p2HrBjwIDpzBoby?=
 =?us-ascii?Q?5OGVRAJceUv1tOQHo6hDeRvxr2f/oU9wNsCjwlguIDcawRhJbwL5ZJTG9JoO?=
 =?us-ascii?Q?W0bxCBdKgPCvN46JBbGEJddfTu87RBTCVX1PvzoZt0Q/HfweaqvRe+VKUVhT?=
 =?us-ascii?Q?PAjRWEaSjb19vbNyaT497H6A9yVfIEnw7ruH41qbD9Rf0RMzQaqqSF3FgIX5?=
 =?us-ascii?Q?fI45KZMx7p+jjESJ5xJpP7w9oIqkGLn/awHQVgUrDq1imB82yGAXh3hYARIH?=
 =?us-ascii?Q?zlJA/nxqc4RQlH+Iv1ZPj4K1paDaz1MTgNRSjba6nL7hgWV3wy5tZEcIEt0U?=
 =?us-ascii?Q?Fwx8y9IX3T0FGoI2EJLGW/tvt4HI6AipQj2hvqLxaU1ImF81cfBYHc3ZVTU9?=
 =?us-ascii?Q?iPyXXHEHndNh7HdfMm5afxmT1dVABWCRjCLjjWNe/YMJQ7lT2QjHuWdWQSLC?=
 =?us-ascii?Q?jy8cU3F/4ELQGosTcWj+Jb1PNqQnE/egvX9qjulVF91IHfEwCeUVQF+nqt7b?=
 =?us-ascii?Q?84O0FYuzOaXngpEc0w/lW6/KBFoW/YRXxbFfl5Urq5EClh1N6H8bCljIQiDI?=
 =?us-ascii?Q?J8deo8jjRDFyMnG08fPnEEeGYRSJMpcWlbaYw3VHv9KbcPfPiqoJH3TZLUXS?=
 =?us-ascii?Q?IFwwA+msHyNNE6/AMm3TG3lfBp4fu/k+hNncanhJ0WhSjF8M/ze9KKD7yDNl?=
 =?us-ascii?Q?atluRUXOm3/OcZ/Pd2bGEeV+ToQAy4XWWvHFlY7OYpbrMzCPZxi9kDVpFnlM?=
 =?us-ascii?Q?wIl/YMPiQrIZsq8rQiob0TWnRTmjzXy8WNO5d9otRJscKa5ujArRbuQF7gkP?=
 =?us-ascii?Q?u9+nYM5aQoxRZaEtFlHxvaw5TzVUfNY0FRWW3SrJIKw7bixD8P2QLZKwDtF8?=
 =?us-ascii?Q?zs+4cr20SuCw2kCKccLVmN7iTJ10XtD0NeyCdSxwN7DbFnA5VjWAt2464F8a?=
 =?us-ascii?Q?vziBskj6P5Rgg4f91Q9T2JrieAvkzb9sqdTp+7gmKX7gWsQLn59E+En1hAKe?=
 =?us-ascii?Q?L1resuHWZQ9fmi7qcfnre27FEOCpZek1X96hXCVjPCh+Fs8VtIaPUmOva5dk?=
 =?us-ascii?Q?qVQ9sP0JS/+py/RGcXPOn9Su/l3lxBkrwNFSMIbdR2ochIQCfqJjupRFp2pL?=
 =?us-ascii?Q?kA89bpdMFdyy2QgUBs2AOerztdHcz1D0BYHBjCSUuLFiPy+FDY7fCZ9CMeFJ?=
 =?us-ascii?Q?38jNh44uNTot+iq82aUyGWFTEj6anK+yhneUGXWeu4CuFRZyM8iCXPGsSBVL?=
 =?us-ascii?Q?mHMqaURW8ddLI4+HTbdMaz0I2dxmrrLgBN9zDa5cVBqUcICQf5sNNp0yxr04?=
 =?us-ascii?Q?6WnrvT4tF+7TYUjemjX7Mkw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba1c789b-cb30-495a-2b33-08dca0a79a47
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 06:14:49.2903 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MvCodQvvK1+Q//rweF6fA5qdMmHRrJ2I1dWag8hqj+4maoyKUvAm1VcySsXTuxEXgozMRltD4il6zAxGrFrXjAExh3K7tprJ0Iiydj+ZAQ9juOZs7vRe5LaIh3hUEOPJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8294
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

On Thu, Jun 27, 2024 at 03:40:37PM +0300, Dani Liberman wrote:
>MSIX interrupts are considered as a system resource. There are
>several interrupts that will be assigned statically, and the rest
>will be allocated and released dynamically.
>
>Add MSIX allocator to manage all interrupts allocations.
>
>Signed-off-by: Dani Liberman <dliberman@habana.ai>
>---
> drivers/gpu/drm/xe/xe_device_types.h |  4 ++
> drivers/gpu/drm/xe/xe_irq.c          | 78 ++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_irq.h          |  5 ++
> 3 files changed, 87 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 09ce7ba1b4ed..0d772f8d4b40 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -308,6 +308,10 @@ struct xe_device {
> 		bool enabled;
> 		/** @irq.msix_enabled: msix interrupts enabled on this device */
> 		bool msix_enabled;
>+		/** @irq.num_of_interrupts: number of msix interrupts */
>+		u32 num_of_interrupts;
>+		/** @irq.msix_indexes: used to allocate msix indexes */
>+		struct xarray msix_indexes;

May be add a irq.msix structure here with 'enabled', 'num_interrupts' and
'indicies' as members?

Niranjana

> 	} irq;
>
> 	/** @ttm: ttm device */
>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>index c0fc75592022..b552af53db2f 100644
>--- a/drivers/gpu/drm/xe/xe_irq.c
>+++ b/drivers/gpu/drm/xe/xe_irq.c
>@@ -30,6 +30,10 @@
> #define IIR(offset)				XE_REG(offset + 0x8)
> #define IER(offset)				XE_REG(offset + 0xc)
>
>+enum static_msix_allocations {
>+	NUM_OF_STATIC_MSIX,
>+};
>+
> static void assert_iir_is_zero(struct xe_gt *mmio, struct xe_reg reg)
> {
> 	u32 val = xe_mmio_read32(mmio, reg);
>@@ -816,3 +820,77 @@ void xe_irq_resume(struct xe_device *xe)
> 	for_each_gt(gt, xe, id)
> 		xe_irq_enable_hwe(gt);
> }
>+
>+static int xe_irq_alloc_msix(struct xe_device *xe, void *irq_buf, bool dynamic_msix, u32 *msix)
>+{
>+	struct xa_limit limit;
>+	int ret = 0;
>+	u32 id;
>+
>+	limit = (dynamic_msix) ? XA_LIMIT(NUM_OF_STATIC_MSIX, xe->irq.num_of_interrupts) :
>+				 XA_LIMIT(*msix, *msix);
>+
>+	ret = xa_alloc(&xe->irq.msix_indexes, &id, irq_buf, limit, GFP_KERNEL);
>+	if (ret)
>+		return ret;
>+
>+	if (dynamic_msix)
>+		*msix = id;
>+
>+	return 0;
>+}
>+
>+static void xe_irq_release_msix(struct xe_device *xe, u32 msix)
>+{
>+	xa_erase(&xe->irq.msix_indexes, msix);
>+}
>+
>+int xe_request_irq(struct xe_device *xe, irq_handler_t handler, void *irq_buf, const char *name,
>+		   bool dynamic_msix, u32 *msix)
>+{
>+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>+	int ret, irq;
>+
>+	ret = xe_irq_alloc_msix(xe, irq_buf, dynamic_msix, msix);
>+	if (ret < 0)
>+		return ret;
>+
>+	irq = pci_irq_vector(pdev, *msix);
>+	if (irq < 0) {
>+		ret = irq;
>+		goto release_msix;
>+	}
>+
>+	ret = request_irq(irq, handler, IRQF_SHARED, name, irq_buf);
>+	if (ret < 0)
>+		goto release_msix;
>+
>+	return 0;
>+
>+release_msix:
>+	drm_err(&xe->drm, "Failed to request irq for MSIX %u\n", *msix);
>+	xe_irq_release_msix(xe, *msix);
>+	return ret;
>+}
>+
>+void xe_free_irq(struct xe_device *xe, u32 msix)
>+{
>+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>+	void *irq_buf;
>+	int irq;
>+
>+	irq_buf = xa_load(&xe->irq.msix_indexes, msix);
>+	if (!irq_buf) {
>+		drm_err(&xe->drm, "MSIX %u can't be released since it wasn't allocated\n", msix);
>+		return;
>+	}
>+
>+	irq = pci_irq_vector(pdev, msix);
>+	if (irq < 0) {
>+		drm_err(&xe->drm, "MSIX %u can't be released, there is no matching IRQ\n", msix);
>+		return;
>+	}
>+
>+	free_irq(irq, irq_buf);
>+	xe_irq_release_msix(xe, msix);
>+}
>diff --git a/drivers/gpu/drm/xe/xe_irq.h b/drivers/gpu/drm/xe/xe_irq.h
>index 067514e13675..6529dff90f76 100644
>--- a/drivers/gpu/drm/xe/xe_irq.h
>+++ b/drivers/gpu/drm/xe/xe_irq.h
>@@ -6,6 +6,8 @@
> #ifndef _XE_IRQ_H_
> #define _XE_IRQ_H_
>
>+#include <linux/interrupt.h>
>+
> struct xe_device;
> struct xe_tile;
> struct xe_gt;
>@@ -14,5 +16,8 @@ int xe_irq_install(struct xe_device *xe);
> void xe_irq_suspend(struct xe_device *xe);
> void xe_irq_resume(struct xe_device *xe);
> void xe_irq_enable_hwe(struct xe_gt *gt);
>+int xe_request_irq(struct xe_device *xe, irq_handler_t handler, void *irq_buf, const char *name,
>+		   bool dynamic_msix, u32 *msix);
>+void xe_free_irq(struct xe_device *xe, u32 msix);
>
> #endif
>-- 
>2.34.1
>
